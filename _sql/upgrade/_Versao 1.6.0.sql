


/*------ SYSDBA 29/03/2018 16:36:14 --------*/

COMMENT ON TABLE SYS_LICENCA IS 'Tabela Licenca de Uso

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar, de forma criptografada, informacoes importantes
referentes a Licenca de Uso do sistema.';




/*------ SYSDBA 02/04/2018 17:25:10 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_15'
where (RDB$FIELD_NAME = 'REFERENCIA') and
(RDB$RELATION_NAME = 'TBPRODUTO_CLIENTE')
;




/*------ SYSDBA 02/04/2018 17:27:28 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_PRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10,
    CLIENTE DMN_INTEGER_N,
    REFERENCIA DMN_VCHAR_15)
as
declare variable COMPARAR DMN_VCHAR_10;
begin
  Select
    upper(trim(coalesce(p.referencia, '')))
  from TBPRODUTO p
  where p.cod = :produto
  Into
    comparar;

  if (:comparar <> upper(trim(:referencia))) then
  begin
    /*
    if (exists(
      Select
        p.codigo
      from TBPRODUTO p
      where p.cod = :produto
    ) and exists(
      Select
        c.codigo
      from TBCLIENTE c
      where c.codigo = :cliente
    )) then
    begin
    */
      if (not exists(
        Select
          pc.referencia
        from TBPRODUTO_CLIENTE pc
        where pc.produto = :produto
          and pc.cliente = :cliente
      )) then
      begin
        Insert Into TBPRODUTO_CLIENTE (
            produto
          , cliente
          , referencia
        ) values (
            :produto
          , :cliente
          , upper(trim(:referencia))
        );
      end
      else
      begin
        Update TBPRODUTO_CLIENTE pc Set
           pc.referencia = upper(trim(:referencia))
        where pc.produto = :produto
          and pc.cliente = :cliente;
      end
    /*
    end
    */
  end 
end^

SET TERM ; ^




/*------ SYSDBA 02/04/2018 17:37:14 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_PRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10,
    CLIENTE DMN_INTEGER_N,
    REFERENCIA DMN_VCHAR_15)
as
declare variable COMPARAR DMN_VCHAR_15;
begin
  Select
    upper(trim(coalesce(p.referencia, '')))
  from TBPRODUTO p
  where p.cod = :produto
  Into
    comparar;

  if (:comparar <> upper(trim(:referencia))) then
  begin
    /*
    if (exists(
      Select
        p.codigo
      from TBPRODUTO p
      where p.cod = :produto
    ) and exists(
      Select
        c.codigo
      from TBCLIENTE c
      where c.codigo = :cliente
    )) then
    begin
    */
      if (not exists(
        Select
          pc.referencia
        from TBPRODUTO_CLIENTE pc
        where pc.produto = :produto
          and pc.cliente = :cliente
      )) then
      begin
        Insert Into TBPRODUTO_CLIENTE (
            produto
          , cliente
          , referencia
        ) values (
            :produto
          , :cliente
          , upper(trim(:referencia))
        );
      end
      else
      begin
        Update TBPRODUTO_CLIENTE pc Set
           pc.referencia = upper(trim(:referencia))
        where pc.produto = :produto
          and pc.cliente = :cliente;
      end
    /*
    end
    */
  end 
end^

SET TERM ; ^




/*------ SYSDBA 03/04/2018 16:06:47 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
declare variable TIPO_DESPESA smallint;
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

  Historico = substring(coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq) || coalesce(' - ' || :fornecedor_nome, '') from 1 for 250);

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




/*------ SYSDBA 03/04/2018 16:09:16 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_REC (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable CLIENTE_COD integer;
declare variable CLIENTE_CNPJ varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
declare variable TIPO_RECEITA smallint;
declare variable ANO_OS DMN_SMALLINT_N;
declare variable NUM_OS DMN_BIGINT_N;
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

  Historico = substring(coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq) || coalesce(' - ' || :cliente_nome, '') from 1 for 250);

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

