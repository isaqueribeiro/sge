


/*------ SYSDBA 21/11/2019 15:28:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_caixa_movimento_rec (
    usuario varchar(12),
    data_pagto timestamp,
    forma_pagto smallint,
    anolanc smallint,
    numlanc integer,
    seq smallint,
    valor_baixa numeric(18,2))
as
declare variable empresa varchar(18);
declare variable cliente_cod integer;
declare variable cliente_cnpj varchar(18);
declare variable ano_caixa smallint;
declare variable num_caixa integer;
declare variable ccr_caixa integer;
declare variable historico varchar(250);
declare variable ano_venda smallint;
declare variable num_venda integer;
declare variable tipo_receita smallint;
declare variable ano_os dmn_smallint_n;
declare variable num_os dmn_bigint_n;
declare variable cliente_nome varchar(100);
begin
  -- Montar Historico
  Select
      coalesce(o.empresa, v.Codemp, r.empresa)
    , coalesce(o.cliente, v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , Case
        when r.Anovenda is not null then 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - '
        when r.Anoos    is not null then 'OS No. '    || r.anoos    || '/' || r.numos    || ' - '
        else null       -- NULL para que uma segunda opcao de historico seja construida
      End || c.Nome
    , r.Anovenda
    , r.Numvenda
    , r.anoos
    , r.numos
    , r.codtprec
    , coalesce(c.nomefant, c.nome)
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBOS o on (o.Ano = r.anoos and o.controle = r.numos)
    left join TBCLIENTE c on (c.codigo = coalesce(o.cliente, v.codcliente, r.cliente))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda
    , Ano_os
    , Num_os
    , tipo_receita
    , cliente_nome;

  Historico = substring(coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq || coalesce(' - ' || :cliente_nome, '')) from 1 for 250);

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Buscar Conta Corrente de movimentacao diaria do sistema caso nao tenha caixa aberto
  if ( :Ccr_caixa is null ) then
  begin
    Select first 1
      cc.codigo
    from TBCONTA_CORRENTE cc
      inner join TBFORMPAGTO_CONTACOR fc on (fc.conta_corrente = cc.codigo)
    where cc.empresa     = :empresa
      and cc.tipo        = 1 -- Caixa Diario
      and fc.forma_pagto = :forma_pagto
    Into
      Ccr_caixa;
  end

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Tipo_Receita
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Os_ano
    , Os_num
    , CLIENTE_COD
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Areceber_ano
    , Areceber_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , :tipo_receita
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
    , :Ano_os
    , :Num_os
    , :cliente_cod
    , :cliente_cnpj
    , Null
    , Null
    , :Empresa
    , Null
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 21/11/2019 15:29:02 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_caixa_movimento_pag (
    usuario varchar(12),
    data_pagto timestamp,
    forma_pagto smallint,
    anolanc smallint,
    numlanc integer,
    seq smallint,
    valor_baixa numeric(18,2))
as
declare variable empresa varchar(18);
declare variable fornecedor integer;
declare variable ano_caixa smallint;
declare variable num_caixa integer;
declare variable ccr_caixa integer;
declare variable historico varchar(250);
declare variable ano_compra smallint;
declare variable num_compra integer;
declare variable tipo_despesa smallint;
declare variable fornecedor_nome varchar(100);
begin
  -- Montar Historico
  Select
      coalesce(cc.Codemp, r.empresa)
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
    , r.codtpdesp
    , f.nomeforn
  from TBCONTPAG r
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
    left join TBFORNECEDOR f on (f.Codforn = coalesce(cc.Codforn, r.codforn))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra
    , tipo_despesa
    , fornecedor_nome;

  Historico = substring(coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq || coalesce(' - ' || :fornecedor_nome, '')) from 1 for 250);

  -- Buscar Numero do Caixa Aberto
  Select
      cx.Ano_caixa
    , cx.Num_caixa
    , cx.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa, :Usuario, :Data_pagto, :Forma_pagto) cx
  into
      Ano_caixa
    , Num_caixa
    , Ccr_caixa;

  -- Buscar Conta Corrente de movimentacao diaria do sistema caso nao tenha caixa aberto
  if ( :Ccr_caixa is null ) then
  begin
    Select first 1
      cc.codigo
    from TBCONTA_CORRENTE cc
      inner join TBFORMPAGTO_CONTACOR fc on (fc.conta_corrente = cc.codigo)
    where cc.empresa     = :empresa
      and cc.tipo        = 1 -- Caixa Diario
      and fc.forma_pagto = :forma_pagto
    Into
      Ccr_caixa;
  end

  -- Inserir Movimento Caixa
  Insert Into TBCAIXA_MOVIMENTO (
      Ano
    , Numero
    , Caixa_ano
    , Caixa_num
    , Conta_corrente
    , Forma_pagto
    , Datahora
    , Tipo
    , Tipo_Despesa
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :tipo_despesa
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 28/11/2019 09:43:05 --------*/

COMMENT ON COLUMN TBCLIENTE_REQUISICAO.VENDA_ANO IS
'Origem da requisicao automatica - Ano da Venda (SGO)';




/*------ SYSDBA 28/11/2019 09:43:11 --------*/

COMMENT ON COLUMN TBCLIENTE_REQUISICAO.VENDA_NUM IS
'Origem da requisicao automatica - Numero da Venda (SGO)';




/*------ SYSDBA 28/11/2019 09:58:24 --------*/

ALTER TABLE TBCLIENTE_ESTOQUE
    ADD CONSIGNADO DMN_LOGICO;

COMMENT ON COLUMN TBCLIENTE_ESTOQUE.CONSIGNADO IS
'Produto Consignado:
0 - Nao
1 - Sim

Produto marcado como CONSIGNADO quando a venda origem da requisicao automatica
tiver como CFOP os codigos 5917 (Remessa de mercadoria em consignacao mercantil
ou industrial - Dentro do Estado) ou 6917 (Remessa de mercadoria em consignacao
mercantil ou industrial - Fora do Estado)';




/*------ SYSDBA 28/11/2019 10:04:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_cliente for tbvendas
active after update position 2
AS
  declare variable sequencial DMN_SMALLINT_N;
  declare variable produto varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable lote_id    DMN_GUID_38;
  declare variable valor_medio numeric(15,4);
  declare variable valor_venda numeric(15,2);
  declare variable consignado  DMN_LOGICO;
begin
  -- 5917 (Remessa de mercadoria em consignacao mercantil ou industrial - Dentro do Estado)
  -- 6917 (Remessa de mercadoria em consignacao mercantil ou industrial - Fora do Estado)
  if ((new.cfop = 5917) or (new.cfop = 6917))  then
    consignado = 1;
  else
    consignado = 0;

  /* Gerar Estoque para o Cliente na Finalizacao da Venda */

  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida
          , coalesce(c.quantidade, 0) -- Estoque
          , (coalesce(c.valor_medio, 0) * coalesce(c.quantidade, 0))
          , i.total_liquido
          , coalesce(trim(i.lote_id), '') as lote
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod and coalesce(trim(c.lote_id), '') = coalesce(trim(i.lote_id), ''))
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , valor_medio
          , valor_venda
          , lote_id
      do
      begin

        -- Recalcular valor medio ja existente
        if ( :estoque <= 0 ) then
          valor_medio = 0.0;

        -- Gerar novo valor medio
        valor_medio = (:valor_medio + :valor_venda) / (:quantidade + :estoque);

        if (not exists(
          Select
            ec.cod_cliente
          from TBCLIENTE_ESTOQUE ec
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
            and (coalesce(trim(ec.lote_id), '') = :lote_id)
            and (coalesce(ec.consignado, 0) = :consignado)
        )) then
        begin

          Select
            max(ec.sequencial)
          from TBCLIENTE_ESTOQUE ec
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
          Into
            sequencial;

          -- Gerar Estoque
          Insert Into TBCLIENTE_ESTOQUE (
              cod_cliente
            , cod_produto
            , sequencial
            , quantidade
            , valor_medio
            , usuario
            , ano_venda_ult
            , cod_venda_ult
            , lote_id
            , consignado
          ) values (
              new.codcliente
            , :produto
            , (coalesce(:sequencial, 0) + 1)
            , :quantidade
            , :valor_medio
            , new.usuario
            , new.ano
            , new.codcontrol
            , :lote_id
            , :consignado
          );

        end
        else
        begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
              ec.quantidade  = coalesce(:quantidade, 0) + coalesce(:estoque, 0)
            , ec.valor_medio = :valor_medio
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
            and (coalesce(trim(ec.lote_id), '') = :lote_id)
            and (coalesce(ec.consignado, 0) = :consignado);
        end 

      end 

    end
  end

  else

  /* Atualizar Estoque do Cliente no Cancelamento da Venda */

  if ( (coalesce(old.Status, 0) in (3, 4)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida cancelada
          , coalesce(c.quantidade, 0) -- Estoque
          , coalesce(trim(i.lote_id), '') as lote
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod and coalesce(trim(c.lote_id), '') = coalesce(trim(i.lote_id), ''))
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , lote_id
      do
      begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
            ec.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
            and (coalesce(trim(ec.lote_id), '') = :lote_id)
            and (coalesce(ec.consignado, 0) = :consignado);

      end

    end

  end

end^

SET TERM ; ^




/*------ SYSDBA 28/11/2019 10:05:52 --------*/

CREATE INDEX IDX_TBCLIENTE_ESTOQUE_CONSIG
ON TBCLIENTE_ESTOQUE (CONSIGNADO);


execute block
as
  declare variable ano dmn_smallint_n;
  declare variable venda dmn_integer_n;
  declare variable emppresa dmn_cnpj;
  declare variable produto dmn_vchar_10;
  declare variable lote dmn_guid_38;
begin
  for
    Select
        v.ano
      , v.codcontrol
      , v.codemp
      , p.codprod
      , coalesce(p.lote_id, '') as lote
    from TBVENDAS v
      inner join TVENDASITENS p on (p.ano = v.ano and p.codcontrol = v.codcontrol and p.codemp = v.codemp)
    where (v.cfop in (5917, 6917))
    Into
        ano
      , venda
      , emppresa
      , produto
      , lote
  do
  begin 
    Update TBCLIENTE_ESTOQUE e Set
      e.consignado = 1
    where (e.ano_venda_ult = :ano)
      and (e.cod_venda_ult = :venda)
      and (e.cod_produto   = :produto)
      and (coalesce(e.lote_id, '') = :lote);
  end
end
;





/*------ SYSDBA 28/11/2019 11:57:46 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_cliente for tbvendas
active after update position 2
AS
  declare variable sequencial DMN_SMALLINT_N;
  declare variable produto varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable lote_id    DMN_GUID_38;
  declare variable valor_medio numeric(15,4);
  declare variable valor_venda numeric(15,2);
  declare variable consignado  DMN_LOGICO;
begin
  -- 5917 (Remessa de mercadoria em consignacao mercantil ou industrial - Venda para Dentro do Estado)
  -- 6917 (Remessa de mercadoria em consignacao mercantil ou industrial - Venda para Fora do Estado)
  if ((new.cfop = 5917) or (new.cfop = 6917))  then
    consignado = 1;
  else
    consignado = 0;

  /* Gerar Estoque para o Cliente na Finalizacao da Venda */

  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida
          , coalesce(c.quantidade, 0) -- Estoque
          , (coalesce(c.valor_medio, 0) * coalesce(c.quantidade, 0))
          , i.total_liquido
          , coalesce(trim(i.lote_id), '') as lote
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod and coalesce(trim(c.lote_id), '') = coalesce(trim(i.lote_id), ''))
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , valor_medio
          , valor_venda
          , lote_id
      do
      begin

        -- Recalcular valor medio ja existente
        if ( :estoque <= 0 ) then
          valor_medio = 0.0;

        -- Gerar novo valor medio
        valor_medio = (:valor_medio + :valor_venda) / (:quantidade + :estoque);

        if (not exists(
          Select
            ec.cod_cliente
          from TBCLIENTE_ESTOQUE ec
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
            and (coalesce(trim(ec.lote_id), '') = :lote_id)
            and (coalesce(ec.consignado, 0) = :consignado)
        )) then
        begin

          Select
            max(ec.sequencial)
          from TBCLIENTE_ESTOQUE ec
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
          Into
            sequencial;

          -- Gerar Estoque
          Insert Into TBCLIENTE_ESTOQUE (
              cod_cliente
            , cod_produto
            , sequencial
            , quantidade
            , valor_medio
            , usuario
            , ano_venda_ult
            , cod_venda_ult
            , lote_id
            , consignado
          ) values (
              new.codcliente
            , :produto
            , (coalesce(:sequencial, 0) + 1)
            , :quantidade
            , :valor_medio
            , new.usuario
            , new.ano
            , new.codcontrol
            , :lote_id
            , :consignado
          );

        end
        else
        begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
              ec.quantidade  = coalesce(:quantidade, 0) + coalesce(:estoque, 0)
            , ec.valor_medio = :valor_medio
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
            and (coalesce(trim(ec.lote_id), '') = :lote_id)
            and (coalesce(ec.consignado, 0) = :consignado);
        end 

      end 

    end
  end

  else

  /* Atualizar Estoque do Cliente no Cancelamento da Venda */

  if ( (coalesce(old.Status, 0) in (3, 4)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida cancelada
          , coalesce(c.quantidade, 0) -- Estoque
          , coalesce(trim(i.lote_id), '') as lote
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod and coalesce(trim(c.lote_id), '') = coalesce(trim(i.lote_id), ''))
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , lote_id
      do
      begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
            ec.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
          where (ec.cod_cliente = new.codcliente)
            and (ec.cod_produto = :produto)
            and (coalesce(trim(ec.lote_id), '') = :lote_id)
            and (coalesce(ec.consignado, 0) = :consignado);

      end

    end

  end

end^

SET TERM ; ^

execute block
as
  declare variable ano dmn_smallint_n;
  declare variable venda dmn_integer_n;
  declare variable emppresa dmn_cnpj;
  declare variable cliente dmn_integer_n;
  declare variable produto dmn_vchar_10;
  declare variable lote dmn_guid_38;
begin
  for
    Select
        v.ano
      , v.codcontrol
      , v.codemp
      , v.codcliente
      , p.codprod
      , coalesce(p.lote_id, '') as lote
    from TBVENDAS v
      inner join TVENDASITENS p on (p.ano = v.ano and p.codcontrol = v.codcontrol and p.codemp = v.codemp)
    where (v.cfop in (5917, 6917))
    Into
        ano
      , venda
      , emppresa
      , cliente
      , produto
      , lote
  do
  begin 
    Update TBCLIENTE_ESTOQUE e Set
      e.consignado = 1
    where (e.cod_cliente = :cliente)
      --and (e.ano_venda_ult = :ano)
      --and (e.cod_venda_ult = :venda)
      and (e.cod_produto   = :produto)
      and ((coalesce(e.lote_id, '') = :lote) or (coalesce(e.lote_id, '') = '')) ;
  end
end;



