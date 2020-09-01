
/*------ SYSDBA 16/01/2020 16:02:27 --------*/

DROP TABLE TB_TESTE;


/*------ SYSDBA 02/04/2020 14:44:18 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_cotacao_compraforn_processa (
    ano dmn_smallint_nn,
    codigo dmn_bigint_nn,
    empresa dmn_cnpj_nn)
as
declare variable item dmn_smallint_nn;
--declare variable fornecedores dmn_smallint_n;
declare variable valor_maximo dmn_money;
declare variable valor_minimo dmn_money;
declare variable valor_medio dmn_money;
declare variable total_maximo dmn_money;
declare variable total_minimo dmn_money;
declare variable total_medio dmn_money;
declare variable total_maximo_desc dmn_money;
declare variable total_minimo_desc dmn_money;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /*
  Select
    count(fr.fornecedor)
  from TBCOTACAO_COMPRAFORN fr
  where fr.ano     = :ano
    and fr.codigo  = :codigo
    and fr.empresa = :empresa
    and fr.fornecedor in (
      Select distinct
        fi.fornecedor
      from TBCOTACAO_COMPRAFORN_ITEM fi
      where fi.ano     = :ano
        and fi.codigo  = :codigo
        and fi.empresa = :empresa
        and fi.valor_unitario > 0.0
    )
  Into
    fornecedores;
  */

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
      and fi.valor_unitario > 0.0
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido > 0.0
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      --c.numero_minimo_fornecedor = :fornecedores,
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end^

SET TERM ; ^




/*------ SYSDBA 21/07/2020 21:02:09 --------*/

COMMENT ON TRIGGER TG_CAIXA_NUMERO IS 'Trigger Novo Caixa (Financeiro).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/07/2020

Trigger responsavel por gerar um sequencial unico para cada novo registro de caixa no ano.';




/*------ SYSDBA 21/07/2020 21:02:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_caixa_numero for tbcaixa
active before insert position 0
AS
begin
  if (new.numero is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CAIXA', cast(new.ano as varchar(4))) g
    Into
      new.numero;
  end
end
^

SET TERM ; ^




/*------ SYSDBA 21/07/2020 21:05:11 --------*/

DROP SEQUENCE GEN_CAIXA_2012;

DROP SEQUENCE GEN_CAIXA_2013;

DROP SEQUENCE GEN_CAIXA_2014;

DROP SEQUENCE GEN_CAIXA_2015;

DROP SEQUENCE GEN_CAIXA_2016;

DROP SEQUENCE GEN_CAIXA_2017;

DROP SEQUENCE GEN_CAIXA_2018;

DROP SEQUENCE GEN_CAIXA_2019;

DROP SEQUENCE GEN_CAIXA_2020;




/*------ SYSDBA 22/07/2020 17:47:36 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    SISTEMA smallint,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable ESTOQUE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
declare variable USUARIO varchar(60);
begin
  if (exists(
    Select
      cc.centro_custo
    from TBCENTRO_CUSTO_EMPRESA cc
    where cc.centro_custo = :centro_custo
      and cc.empresa      = :empresa
  ) and (trim(coalesce(:lote_descricao, '')) <> '')) then
  begin
    -- Buscar identificacao do Lote
    Select
        ea.id
      , ea.qtde
      , ea.lote
    from TBESTOQUE_ALMOX ea
    where ea.empresa      = :empresa
      and ea.centro_custo = :centro_custo
      and ea.produto      = :produto
      and ea.descricao    = :lote_descricao
    Into
        lote_id
      , qtde
      , lote;

    --qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);
    qtde_nova = coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
      , coalesce(pr.qtde, 0.000)
      , pr.usuario
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade
      , estoque
      , usuario;

    if ( trim(coalesce(:lote_id, '')) = '' ) then
    begin
        Select
          g.hex_uuid_format
        from GET_GUID_UUID_HEX g
        Into
          lote_id;

        Select
            max(ea.lote)
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
        Into
            lote;

        lote = coalesce(:lote, 0) + 1;

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , descricao
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
          , id
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , trim(:lote_descricao)
          , :lote_fab
          , :lote_val
          , :qtde_nova   -- Informando a quantidade fracionada
          , :fracionador
          , :unidade
          , null         -- Informando o custo medio fracionado
          , :lote_id
        );
    end
    else
    begin
      Update TBESTOQUE_ALMOX ea Set
          ea.qtde        = :qtde_nova -- Informando a quantidade fracionada
        , ea.fracionador = :fracionador
        , ea.unidade     = :unidade
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;
    end

    /* SISTEMA_GESTAO_SGE e SISTEMA_GESTAO_OPME */
    if ((coalesce(:sistema, -1) = 0) or (coalesce(:sistema, -1) = 3)) then
    begin
      Select
        sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
      from TBESTOQUE_ALMOX e
      where e.empresa      = :empresa
        and e.centro_custo = :centro_custo
        and e.produto      = :produto
      Into
        qtde_nova;

      -- Atualizar Estoque de Venda
      Update TBPRODUTO p Set
        p.qtde = :qtde_nova
      where p.cod = :produto;

      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :empresa
        , :produto
        , 'LOTE'
        , case when ((:qtde_nova - :estoque) > 0.000) then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , current_timestamp
        , :estoque
        , (:qtde_nova - :estoque)
        , :qtde_nova
        , coalesce(:usuario, user)
        , 'Ajuste manual do estoque'
      );
    end

    suspend;
  end 
end
^

SET TERM ; ^




/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 11;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_VF_CNPJ position 12;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 13;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 14;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 15;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column VENDA_FORMA_PAGTO_CARTACREDITO position 16;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 17;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 18;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column AUTORIZA_INFORMA_CLIENTE position 19;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 20;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_EMITIR position 21;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_SERIE position 22;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_NUMERO position 23;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_LOTE position 24;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_CARTA_CORRECAO position 25;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_EMITIR_ENTRADA position 26;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_ACEITAR_NOTA_DENEGADA position 27;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 28;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 29;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_REFERENTE position 30;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_REFERENCIA position 31;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFCE_EMITIR position 32;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFCE_SERIE position 33;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFCE_NUMERO position 34;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFCE_TOKEN_ID position 35;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFCE_TOKEN position 36;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_EMITIR position 37;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column RPS_SERIE position 38;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column RPS_NUMERO position 39;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_SERIE position 40;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_NUMERO position 41;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_PIS position 42;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_COFINS position 43;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_CSLL position 44;


/*------ SYSDBA 30/07/2020 10:28:11 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_ISSQN position 45;


/*------ SYSDBA 30/07/2020 10:29:26 --------*/

ALTER TABLE TBCONFIGURACAO DROP NFE_IMPRIMIR_COD_REFERENTE;




/*------ SYSDBA 30/07/2020 10:31:35 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD CONTADOR_CODIGO DMN_INTEGER_N,
    ADD CONTADOR_CNPJCPF DMN_CNPJ;

COMMENT ON COLUMN TBCONFIGURACAO.CONTADOR_CODIGO IS
'Contador: Codigo do fornecedor.';

COMMENT ON COLUMN TBCONFIGURACAO.CONTADOR_CNPJCPF IS
'Contador: CNPJ/CPF';




/*------ SYSDBA 30/07/2020 10:31:58 --------*/

ALTER TABLE TBCONFIGURACAO
ADD CONSTRAINT FK_TBCONFIGURACAO_CONTADOR
FOREIGN KEY (CONTADOR_CODIGO)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 31/08/2020 19:43:32 --------*/

COMMENT ON TABLE SYS_UPGRADE IS 'Tabela Upgrade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os scripts de upgrade da base de dados a cada
nova atualizacao do(s) sistema(s).';

