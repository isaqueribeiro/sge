/*------ SYSDBA 10/01/2020 10:48:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure get_generator (
    generator_name dmn_vchar_40,
    generator_year dmn_vchar_04)
returns (
    generator_id bigint)
as
declare variable agenerator dmn_vchar_40;
declare variable sql_create dmn_vchar_250;
begin
  Execute procedure SET_GENERATOR(:generator_name, :generator_year);

  if (coalesce(trim(:generator_year), '') = '') then
    aGenerator = trim(upper(:generator_name));
  else
    aGenerator = trim(upper(:generator_name)) || '_' || trim(:generator_year);

  sql_create = 'SELECT Gen_id(' || :aGenerator || ', 1) as generator_id FROM RDB$DATABASE';
  execute statement :sql_create
  Into
    generator_id;

  suspend;
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_GENERATOR IS 'Procedure GET Valuer Generator.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   10/01/2020

Stored procedure responsavel por recuperar o valor do generator baseando-se
no nome e ano informados.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    10/01/2020 - IMR :
        * Documentacao do objeto.';

GRANT EXECUTE ON PROCEDURE GET_GENERATOR TO "PUBLIC";





/*------ SYSDBA 10/01/2020 10:57:11 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_codigo for tbapropriacao_almox
active before insert position 0
AS
begin
  if (new.controle is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_APROPRIACAO_ALMOX', cast(new.ano as varchar(4))) g
    Into
      new.controle;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:00:33 --------*/

DROP SEQUENCE GEN_APROPRIACAO_ALMOX_2015;

DROP SEQUENCE GEN_APROPRIACAO_ALMOX_2016;

DROP SEQUENCE GEN_APROPRIACAO_ALMOX_2017;

DROP SEQUENCE GEN_APROPRIACAO_ALMOX_2018;

DROP SEQUENCE GEN_APROPRIACAO_ALMOX_2019;

DROP SEQUENCE GEN_APROPRIACAO_ALMOX_2021;




/*------ SYSDBA 10/01/2020 11:02:40 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_autoriza_compra_codigo for tbautoriza_compra
active before insert position 0
AS
begin
  if (new.codigo is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_AUTORIZA_COMPRA', cast(new.ano as varchar(4))) g
    Into
      new.codigo;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:03:25 --------*/

DROP SEQUENCE GEN_AUTORIZA_COMPRA_2014;

DROP SEQUENCE GEN_AUTORIZA_COMPRA_2015;

DROP SEQUENCE GEN_AUTORIZA_COMPRA_2016;

DROP SEQUENCE GEN_AUTORIZA_COMPRA_2017;

DROP SEQUENCE GEN_AUTORIZA_COMPRA_2018;

DROP SEQUENCE GEN_AUTORIZA_COMPRA_2019;




/*------ SYSDBA 10/01/2020 11:04:28 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_controle for tbcompras
active before insert position 0
AS
BEGIN
  if (new.codcontrol is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_COMPRAS_CONTROLE', cast(new.ano as varchar(4))) g
    Into
      new.codcontrol;
  end
END^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:06:57 --------*/

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2011;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2012;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2013;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2014;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2015;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2016;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2017;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2018;

DROP SEQUENCE GEN_COMPRAS_CONTROLE_2019;




/*------ SYSDBA 10/01/2020 11:08:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_numlanc for tbcontpag
active before insert position 0
AS
begin
  if (new.numlanc is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CONTAPAG_NUM', cast(new.anolanc as varchar(4))) g
    Into
      new.numlanc;
  end

  if ( new.valorsaldo is null ) then
    new.valorsaldo = new.valorpag;
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:10:22 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_duplicata_pagar (
    anocompra smallint,
    numcompra integer,
    fornecedor integer,
    nf integer,
    forma_pagto smallint,
    condicao_pagto smallint,
    emissao date,
    vencimento date,
    valor_documento numeric(15,2),
    parcela smallint,
    tipo_despesa smallint)
returns (
    anolancamento smallint,
    numlancamento integer)
as
declare variable empresa dmn_cnpj;
declare variable empresa_nome dmn_vchar_60;
declare variable forma_pagto_desc dmn_vchar_30;
declare variable competencia integer;
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.forma_pagto = :forma_pagto
      and p.Parcela     = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
      c.codemp
    , e.rzsoc
  from TBCOMPRAS c
    left join TBEMPRESA e on (e.cnpj = c.codemp)
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
      Empresa
    , Empresa_Nome;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  Select
    g.generator_id
  from GET_GENERATOR('GEN_CONTAPAG_NUM', cast(:anolancamento as varchar(4))) g
  Into
    numlancamento;

  competencia = extract(year from :emissao) || right('00' || extract(month from :emissao), 2);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , NomeEmp
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , competencia_apuracao
    , Valorpag
    , ValorSaldo
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , substring(:Empresa_Nome from 1 for 40)
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Competencia
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:12:21 --------*/

DROP SEQUENCE GEN_CONTAPAG_NUM_2011;

DROP SEQUENCE GEN_CONTAPAG_NUM_2012;

DROP SEQUENCE GEN_CONTAPAG_NUM_2013;

DROP SEQUENCE GEN_CONTAPAG_NUM_2014;

DROP SEQUENCE GEN_CONTAPAG_NUM_2015;

DROP SEQUENCE GEN_CONTAPAG_NUM_2016;

DROP SEQUENCE GEN_CONTAPAG_NUM_2017;

DROP SEQUENCE GEN_CONTAPAG_NUM_2018;

DROP SEQUENCE GEN_CONTAPAG_NUM_2019;




/*------ SYSDBA 10/01/2020 11:13:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contrec_num for tbcontrec
active before insert position 0
as
begin
  if (new.Numlanc is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CONTAREC_NUM', cast(new.anolanc as varchar(4))) g
    Into
      new.numlanc;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:14:15 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_titulo_receber (
    anovenda smallint,
    numvenda integer,
    empresa varchar(18),
    cliente_cod integer,
    cliente_cnpj varchar(18),
    forma_pagto smallint,
    emissao date,
    vencimento date,
    valor_documento numeric(15,2),
    parcela smallint)
returns (
    anolancamento smallint,
    numlancamento integer)
as
declare variable forma_pagto_desc varchar(30);
declare variable competencia integer;
declare variable tipo_receita smallint;
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.Anovenda = :Anovenda
      and r.Numvenda = :Numvenda
      and r.forma_pagto = :forma_pagto
      and r.Parcela     = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  tipo_receita = null;

  -- Buscar e inserir Tipo de Receita padrao para Vendas
  if ( coalesce(:anovenda, 0) > 0 and coalesce(:numvenda, 0) > 0 ) then
  begin
    Select first 1
      tr.cod
    from TBTPRECEITA tr
    where tr.tiporec = 'VENDA DE MATERIAIS/PRODUTOS'
    Into
      tipo_receita;
    
    if ( :tipo_receita is null ) then
    begin
      Select
        max(tr.cod)
      from TBTPRECEITA tr
      Into
        tipo_receita;
    
      tipo_receita = coalesce(:tipo_receita, 0) + 1;
    
      Insert Into TBTPRECEITA (
          cod
        , tiporec
        , tipo_particular
        , plano_conta
        , ativo
      ) values (
          :tipo_receita
        , 'VENDA DE MATERIAIS/PRODUTOS'
        , 0
        , null
        , 1
      );
    end
  end

  Anolancamento = :Anovenda;

  Select
    g.generator_id
  from GET_GENERATOR('GEN_CONTAREC_NUM', cast(:anolancamento as varchar(4))) g
  Into
    numlancamento;

  competencia = extract(year from :emissao) || right('00' || extract(month from :emissao), 2);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , Anovenda
    , Numvenda
    , Empresa
    , Cliente
    , Cnpj
    , Tippag
    , CodTpRec
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , competencia_apuracao
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Especie_boleto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Anovenda
    , :Numvenda
    , :Empresa
    , :cliente_cod
    , :cliente_cnpj
    , :Forma_pagto_desc
    , :tipo_receita
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :competencia
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 'DM'
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:19:35 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_titulo_receber_os (
    ano_os dmn_smallint_n,
    num_os dmn_bigint_n,
    empresa dmn_cnpj,
    cliente_cod integer,
    cliente_cnpj dmn_cnpj,
    forma_pagto dmn_smallint_n,
    emissao dmn_date,
    vencimento dmn_date,
    valor_documento dmn_money,
    parcela dmn_smallint_n)
returns (
    anolancamento smallint,
    numlancamento integer)
as
declare variable forma_pagto_desc varchar(30);
declare variable competencia integer;
declare variable tipo_receita smallint;
begin
  if ( Exists(
    Select
      r.Numlanc
    from TBCONTREC r
    where r.anoos = :ano_os
      and r.numos = :num_os
      and r.forma_pagto = :forma_pagto
      and r.Parcela     = :Parcela
  ) ) then
    Exit;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  tipo_receita = null;

  -- Buscar e inserir Tipo de Receita padrao para Vendas
  if ( coalesce(:ano_os, 0) > 0 and coalesce(:num_os, 0) > 0 ) then
  begin
    Select first 1
      tr.cod
    from TBTPRECEITA tr
    where tr.tiporec = 'PRESTACAO DE SERVICOS'
    Into
      tipo_receita;
    
    if ( :tipo_receita is null ) then
    begin
      Select
        max(tr.cod)
      from TBTPRECEITA tr
      Into
        tipo_receita;
    
      tipo_receita = coalesce(:tipo_receita, 0) + 1;
    
      Insert Into TBTPRECEITA (
          cod
        , tiporec
        , tipo_particular
        , plano_conta
        , ativo
      ) values (
          :tipo_receita
        , 'PRESTACAO DE SERVICOS'
        , 0
        , null
        , 1
      );
    end
  end

  Anolancamento = :ano_os;

  Select
    g.generator_id
  from GET_GENERATOR('GEN_CONTAREC_NUM', cast(:anolancamento as varchar(4))) g
  Into
    numlancamento;

  competencia = extract(year from :emissao) || right('00' || extract(month from :emissao), 2);

  Insert Into TBCONTREC (
      Anolanc
    , numlanc
    , AnoOS
    , NumOS
    , Empresa
    , Cliente
    , Cnpj
    , Tippag
    , Forma_pagto
    , CodTpRec
    , Dtemiss
    , Dtvenc
    , Competencia_apuracao
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
    , Especie_boleto
    , Baixado
    , Enviado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :ano_os
    , :num_os
    , :Empresa
    , :cliente_cod
    , :cliente_cnpj
    , :Forma_pagto_desc
    , :Forma_pagto
    , :tipo_receita
    , :Emissao
    , :Vencimento
    , :competencia
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 'DS'
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:19:47 --------*/

DROP SEQUENCE GEN_CONTAREC_NUM_2011;

DROP SEQUENCE GEN_CONTAREC_NUM_2012;

DROP SEQUENCE GEN_CONTAREC_NUM_2013;

DROP SEQUENCE GEN_CONTAREC_NUM_2014;

DROP SEQUENCE GEN_CONTAREC_NUM_2015;

DROP SEQUENCE GEN_CONTAREC_NUM_2016;

DROP SEQUENCE GEN_CONTAREC_NUM_2017;

DROP SEQUENCE GEN_CONTAREC_NUM_2018;

DROP SEQUENCE GEN_CONTAREC_NUM_2019;




/*------ SYSDBA 10/01/2020 11:28:27 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cotacao_compra_codigo for tbcotacao_compra
active before insert position 0
AS
begin
  if (new.codigo is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_COTACAO_COMPRA', cast(new.ano as varchar(4))) g
    Into
      new.codigo;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:33:54 --------*/

DROP SEQUENCE GEN_COTACAO_COMPRA_2014;

DROP SEQUENCE GEN_COTACAO_COMPRA_2015;

DROP SEQUENCE GEN_COTACAO_COMPRA_2016;

DROP SEQUENCE GEN_COTACAO_COMPRA_2017;

DROP SEQUENCE GEN_COTACAO_COMPRA_2018;

DROP SEQUENCE GEN_COTACAO_COMPRA_2019;




/*------ SYSDBA 10/01/2020 11:34:47 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_caixa_movimento_numero for tbcaixa_movimento
active before insert position 0
AS
begin
  IF (New.Numero IS NULL) Then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CX_MOVIMENTO', cast(new.ano as varchar(4))) g
    Into
      new.Numero;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:35:38 --------*/

DROP SEQUENCE GEN_CX_MOVIMENTO_2012;

DROP SEQUENCE GEN_CX_MOVIMENTO_2013;

DROP SEQUENCE GEN_CX_MOVIMENTO_2014;

DROP SEQUENCE GEN_CX_MOVIMENTO_2015;

DROP SEQUENCE GEN_CX_MOVIMENTO_2016;

DROP SEQUENCE GEN_CX_MOVIMENTO_2017;

DROP SEQUENCE GEN_CX_MOVIMENTO_2018;

DROP SEQUENCE GEN_CX_MOVIMENTO_2019;




/*------ SYSDBA 10/01/2020 11:36:28 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_inventario_almox_codigo for tbinventario_almox
active before insert position 0
AS
begin
  if (new.controle is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_INVENTARIO_ALMOX', cast(new.ano as varchar(4))) g
    Into
      new.controle;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:37:24 --------*/

DROP SEQUENCE GEN_INVENTARIO_ALMOX_2015;

DROP SEQUENCE GEN_INVENTARIO_ALMOX_2016;

DROP SEQUENCE GEN_INVENTARIO_ALMOX_2017;

DROP SEQUENCE GEN_INVENTARIO_ALMOX_2018;

DROP SEQUENCE GEN_INVENTARIO_ALMOX_2019;




/*------ SYSDBA 10/01/2020 11:41:01 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_nova for tbos
active before insert position 0
AS
begin
  new.status        =  coalesce(new.status, 0);
  new.data_cadastro = coalesce(new.data_cadastro, current_timestamp);
  new.data_emissao  = coalesce(new.data_emissao, cast(new.data_cadastro as date), current_date);

  if ( coalesce(new.ano, 0) <= 0 ) then
    new.ano = extract(year from new.data_emissao);

  if ( coalesce(new.controle, 0) <= 0 ) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_OS', cast(new.ano as varchar(4))) g
    Into
      new.controle;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:41:11 --------*/

DROP SEQUENCE GEN_OS_2015;

DROP SEQUENCE GEN_OS_2016;

DROP SEQUENCE GEN_OS_2017;

DROP SEQUENCE GEN_OS_2018;

DROP SEQUENCE GEN_OS_2019;




/*------ SYSDBA 10/01/2020 11:42:05 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_requisicao_nova for tbcliente_requisicao
active before insert position 0
AS
begin
  if ( coalesce(new.ano, 0) = 0 ) then
    new.ano = extract(year from current_date);

  if ( coalesce(new.numero, 0) = 0 ) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_REQUISICAO', cast(new.ano as varchar(4))) g
    Into
      new.numero;
  end

  if ( new.insercao_data is null ) then
    new.insercao_data = current_date;

  if ( new.insercao_hora is null ) then
    new.insercao_usuario = current_time;

  if ( new.insercao_usuario is null ) then
    new.insercao_usuario = user;
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:49:32 --------*/

DROP SEQUENCE GEN_REQUISICAO_2011;

DROP SEQUENCE GEN_REQUISICAO_2012;

DROP SEQUENCE GEN_REQUISICAO_2013;

DROP SEQUENCE GEN_REQUISICAO_2014;

DROP SEQUENCE GEN_REQUISICAO_2015;

DROP SEQUENCE GEN_REQUISICAO_2016;

DROP SEQUENCE GEN_REQUISICAO_2017;

DROP SEQUENCE GEN_REQUISICAO_2018;

DROP SEQUENCE GEN_REQUISICAO_2019;




/*------ SYSDBA 10/01/2020 11:50:21 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_codigo for tbrequisicao_almox
active before insert position 0
AS
begin
  if (new.controle is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_REQUISICAO_ALMOX', cast(new.ano as varchar(4))) g
    Into
      new.controle;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:50:47 --------*/

DROP SEQUENCE GEN_REQUISICAO_ALMOX_2015;

DROP SEQUENCE GEN_REQUISICAO_ALMOX_2016;

DROP SEQUENCE GEN_REQUISICAO_ALMOX_2017;

DROP SEQUENCE GEN_REQUISICAO_ALMOX_2018;

DROP SEQUENCE GEN_REQUISICAO_ALMOX_2019;




/*------ SYSDBA 10/01/2020 11:51:33 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisita_compra_codigo for tbrequisita_compra
active before insert position 0
AS
begin
  if (new.codigo is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_REQUISITA_COMPRA', cast(new.ano as varchar(4))) g
    Into
      new.codigo;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:53:26 --------*/

DROP SEQUENCE GEN_REQUISITA_COMPRA_2014;

DROP SEQUENCE GEN_REQUISITA_COMPRA_2015;

DROP SEQUENCE GEN_REQUISITA_COMPRA_2016;

DROP SEQUENCE GEN_REQUISITA_COMPRA_2017;

DROP SEQUENCE GEN_REQUISITA_COMPRA_2018;

DROP SEQUENCE GEN_REQUISITA_COMPRA_2019;




/*------ SYSDBA 10/01/2020 11:54:12 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_solicitacao_codigo for tbsolicitacao
active before insert position 0
AS
begin
  if (new.codigo is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_SOLICITACAO', cast(new.ano as varchar(4))) g
    Into
      new.codigo;
  end
end^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:55:04 --------*/

DROP SEQUENCE GEN_SOLICITACAO_2015;

DROP SEQUENCE GEN_SOLICITACAO_2016;

DROP SEQUENCE GEN_SOLICITACAO_2017;

DROP SEQUENCE GEN_SOLICITACAO_2018;

DROP SEQUENCE GEN_SOLICITACAO_2019;




/*------ SYSDBA 10/01/2020 11:57:43 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_controle for tbvendas
active before insert position 0
AS
BEGIN
  if (new.codcontrol is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_VENDAS_CONTROLE', cast(new.ano as varchar(4))) g
    Into
      new.codcontrol;
  end
END^

SET TERM ; ^




/*------ SYSDBA 10/01/2020 11:58:01 --------*/

DROP SEQUENCE GEN_VENDAS_CONTROLE_2011;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2012;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2013;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2014;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2015;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2016;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2017;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2018;

DROP SEQUENCE GEN_VENDAS_CONTROLE_2019;

