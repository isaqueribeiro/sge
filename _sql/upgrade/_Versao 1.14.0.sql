


/*------ SYSDBA 17/07/2019 16:00:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_custo for tvendasitens
active before insert or update position 30
AS
begin
  Select
      p.customedio
    , p.customedio * coalesce(new.qtde, 0.0)
  from TBPRODUTO p
  where (p.cod = new.codprod)
  Into
      new.pcusto
    , new.total_custo;
end^

SET TERM ; ^




/*------ SYSDBA 17/07/2019 16:00:54 --------*/

COMMENT ON COLUMN TVENDASITENS.CODPROD IS
'Produto';




/*------ SYSDBA 04/09/2019 08:37:41 --------*/

ALTER TABLE TBVENDAS
    ADD LOTE_NFE_CODIGO DMN_INTEGER_N;

COMMENT ON COLUMN TBVENDAS.LOTE_NFE_CODIGO IS
'Código do lote de envio (Interno para NFe.Ide.cNF - Componente ACBr).';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLIENTE position 4;

alter table TBVENDAS
alter CODCLI position 5;

alter table TBVENDAS
alter DTVENDA position 6;

alter table TBVENDAS
alter COMPETENCIA position 7;

alter table TBVENDAS
alter STATUS position 8;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

alter table TBVENDAS
alter DESCONTO position 10;

alter table TBVENDAS
alter DESCONTO_CUPOM position 11;

alter table TBVENDAS
alter TOTALVENDA position 12;

alter table TBVENDAS
alter TOTALCUSTO position 13;

alter table TBVENDAS
alter INDEX_VALOR position 14;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 15;

alter table TBVENDAS
alter OBS position 16;

alter table TBVENDAS
alter DADOS_ENTREGA position 17;

alter table TBVENDAS
alter FORMAPAG position 18;

alter table TBVENDAS
alter FATDIAS position 19;

alter table TBVENDAS
alter SERIE position 20;

alter table TBVENDAS
alter NFE position 21;

alter table TBVENDAS
alter MODELO_NF position 22;

alter table TBVENDAS
alter DATAEMISSAO position 23;

alter table TBVENDAS
alter HORAEMISSAO position 24;

alter table TBVENDAS
alter CFOP position 25;

alter table TBVENDAS
alter VERIFICADOR_NFE position 26;

alter table TBVENDAS
alter XML_NFE position 27;

alter table TBVENDAS
alter XML_NFE_FILENAME position 28;

alter table TBVENDAS
alter VENDEDOR_COD position 29;

alter table TBVENDAS
alter USUARIO position 30;

alter table TBVENDAS
alter FORMAPAGTO_COD position 31;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 32;

alter table TBVENDAS
alter VENDA_PRAZO position 33;

alter table TBVENDAS
alter PRAZO_01 position 34;

alter table TBVENDAS
alter PRAZO_02 position 35;

alter table TBVENDAS
alter PRAZO_03 position 36;

alter table TBVENDAS
alter PRAZO_04 position 37;

alter table TBVENDAS
alter PRAZO_05 position 38;

alter table TBVENDAS
alter PRAZO_06 position 39;

alter table TBVENDAS
alter PRAZO_07 position 40;

alter table TBVENDAS
alter PRAZO_08 position 41;

alter table TBVENDAS
alter PRAZO_09 position 42;

alter table TBVENDAS
alter PRAZO_10 position 43;

alter table TBVENDAS
alter PRAZO_11 position 44;

alter table TBVENDAS
alter PRAZO_12 position 45;

alter table TBVENDAS
alter LOTE_NFE_ANO position 46;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 47;

alter table TBVENDAS
alter LOTE_NFE_CODIGO position 48;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 49;

alter table TBVENDAS
alter NFE_ENVIADA position 50;

alter table TBVENDAS
alter NFE_DENEGADA position 51;

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 52;

alter table TBVENDAS
alter CANCEL_USUARIO position 53;

alter table TBVENDAS
alter CANCEL_DATAHORA position 54;

alter table TBVENDAS
alter CANCEL_MOTIVO position 55;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 56;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 57;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 58;

alter table TBVENDAS
alter NFE_PLACA_UF position 59;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 60;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 61;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 62;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 63;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 64;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 65;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 66;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 67;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 68;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 69;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 70;

alter table TBVENDAS
alter NFE_VALOR_PIS position 71;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 72;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 73;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 74;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 75;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 76;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 77;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 78;

alter table TBVENDAS
alter CAIXA_ANO position 79;

alter table TBVENDAS
alter CAIXA_NUM position 80;

alter table TBVENDAS
alter CAIXA_PDV position 81;

alter table TBVENDAS
alter DNFE_COMPRA_ANO position 82;

alter table TBVENDAS
alter DNFE_COMPRA_COD position 83;

alter table TBVENDAS
alter DNFE_FORMA position 84;

alter table TBVENDAS
alter DNFE_UF position 85;

alter table TBVENDAS
alter DNFE_CNPJ_CPF position 86;

alter table TBVENDAS
alter DNFE_IE position 87;

alter table TBVENDAS
alter DNFE_COMPETENCIA position 88;

alter table TBVENDAS
alter DNFE_SERIE position 89;

alter table TBVENDAS
alter DNFE_NUMERO position 90;

alter table TBVENDAS
alter DNFE_MODELO position 91;

alter table TBVENDAS
alter DNFE_CHAVE position 92;

alter table TBVENDAS
alter DECF_MODELO position 93;

alter table TBVENDAS
alter DECF_NUMERO position 94;

alter table TBVENDAS
alter DECF_COO position 95;




/*------ SYSDBA 04/09/2019 08:37:52 --------*/

ALTER TABLE TBVENDAS ALTER COLUMN LOTE_NFE_NUMERO TYPE DMN_INTEGER_N;




/*------ SYSDBA 04/09/2019 08:39:31 --------*/

ALTER TABLE TBCOMPRAS ALTER COLUMN LOTE_NFE_NUMERO TYPE DMN_INTEGER_N;




/*------ SYSDBA 04/09/2019 08:40:09 --------*/

ALTER TABLE TBCOMPRAS
    ADD LOTE_NFE_CODIGO DMN_INTEGER_N;

COMMENT ON COLUMN TBCOMPRAS.LOTE_NFE_CODIGO IS
'Código do lote de envio (Interno para NFe.Ide.cNF - Componente ACBr).';

alter table TBCOMPRAS
alter ANO position 1;

alter table TBCOMPRAS
alter CODCONTROL position 2;

alter table TBCOMPRAS
alter CODEMP position 3;

alter table TBCOMPRAS
alter CODFORN position 4;

alter table TBCOMPRAS
alter TIPO_ENTRADA position 5;

alter table TBCOMPRAS
alter TIPO_DOCUMENTO position 6;

alter table TBCOMPRAS
alter TIPO_MOVIMENTO position 7;

alter table TBCOMPRAS
alter NF position 8;

alter table TBCOMPRAS
alter NFSERIE position 9;

alter table TBCOMPRAS
alter MODELO_NF position 10;

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 11;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 12;

alter table TBCOMPRAS
alter LOTE_NFE_CODIGO position 13;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 14;

alter table TBCOMPRAS
alter NFE_ENVIADA position 15;

alter table TBCOMPRAS
alter NFE_DENEGADA position 16;

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 17;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 18;

alter table TBCOMPRAS
alter XML_NFE position 19;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 20;

alter table TBCOMPRAS
alter DTLANCAMENTO position 21;

alter table TBCOMPRAS
alter DTEMISS position 22;

alter table TBCOMPRAS
alter HREMISS position 23;

alter table TBCOMPRAS
alter DTENT position 24;

alter table TBCOMPRAS
alter NFCFOP position 25;

alter table TBCOMPRAS
alter NATUREZA position 26;

alter table TBCOMPRAS
alter STATUS position 27;

alter table TBCOMPRAS
alter CALCULAR_TOTAIS position 28;

alter table TBCOMPRAS
alter IPI position 29;

alter table TBCOMPRAS
alter ICMSBASE position 30;

alter table TBCOMPRAS
alter ICMSVALOR position 31;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 32;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 33;

alter table TBCOMPRAS
alter FRETE position 34;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 35;

alter table TBCOMPRAS
alter DESCONTO position 36;

alter table TBCOMPRAS
alter VALORSEGURO position 37;

alter table TBCOMPRAS
alter VALORTOTAL_II position 38;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 39;

alter table TBCOMPRAS
alter VALORPIS position 40;

alter table TBCOMPRAS
alter VALORCOFINS position 41;

alter table TBCOMPRAS
alter TOTALPROD position 42;

alter table TBCOMPRAS
alter TOTALNF position 43;

alter table TBCOMPRAS
alter INDEX_VALOR position 44;

alter table TBCOMPRAS
alter OBS position 45;

alter table TBCOMPRAS
alter USUARIO position 46;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 47;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 48;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 49;

alter table TBCOMPRAS
alter PRAZO_01 position 50;

alter table TBCOMPRAS
alter PRAZO_02 position 51;

alter table TBCOMPRAS
alter PRAZO_03 position 52;

alter table TBCOMPRAS
alter PRAZO_04 position 53;

alter table TBCOMPRAS
alter PRAZO_05 position 54;

alter table TBCOMPRAS
alter PRAZO_06 position 55;

alter table TBCOMPRAS
alter PRAZO_07 position 56;

alter table TBCOMPRAS
alter PRAZO_08 position 57;

alter table TBCOMPRAS
alter PRAZO_09 position 58;

alter table TBCOMPRAS
alter PRAZO_10 position 59;

alter table TBCOMPRAS
alter PRAZO_11 position 60;

alter table TBCOMPRAS
alter PRAZO_12 position 61;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 62;

alter table TBCOMPRAS
alter TIPO_DESPESA position 63;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 64;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 65;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 66;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 67;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 68;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 69;

alter table TBCOMPRAS
alter DNFE_ENTRADA_ANO position 70;

alter table TBCOMPRAS
alter DNFE_ENTRADA_COD position 71;

alter table TBCOMPRAS
alter DNFE_SAIDA_ANO position 72;

alter table TBCOMPRAS
alter DNFE_SAIDA_COD position 73;

alter table TBCOMPRAS
alter DNFE_FORMA position 74;

alter table TBCOMPRAS
alter DNFE_UF position 75;

alter table TBCOMPRAS
alter DNFE_CNPJ_CPF position 76;

alter table TBCOMPRAS
alter DNFE_IE position 77;

alter table TBCOMPRAS
alter DNFE_COMPETENCIA position 78;

alter table TBCOMPRAS
alter DNFE_SERIE position 79;

alter table TBCOMPRAS
alter DNFE_NUMERO position 80;

alter table TBCOMPRAS
alter DNFE_MODELO position 81;

alter table TBCOMPRAS
alter DNFE_CHAVE position 82;

alter table TBCOMPRAS
alter DECF_MODELO position 83;

alter table TBCOMPRAS
alter DECF_NUMERO position 84;

alter table TBCOMPRAS
alter DECF_COO position 85;




/*------ SYSDBA 04/09/2019 11:06:14 --------*/

ALTER TABLE TBVENDAS
    ADD CFOP_ALTERA_ESTOQUE DMN_LOGICO DEFAULT 1,
    ADD CFOP_GERA_TITULO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBVENDAS.CFOP_ALTERA_ESTOQUE IS
'CFOP - Altera Estoque do produto:
0 - Nao
1 - Sim

A configuracao da CFOP e guardada aqui para manter o estado da CFOP quando a venda for finalizada.';

COMMENT ON COLUMN TBVENDAS.CFOP_GERA_TITULO IS
'CFOP - Gera Titulo para a venda:
0 - Nao
1 - Sim

A configuracao da CFOP e guardada aqui para manter o estado da CFOP quando a venda for finalizada.';




/*------ SYSDBA 04/09/2019 11:09:23 --------*/

ALTER TABLE TBCOMPRAS
    ADD CFOP_ALTERA_ESTOQUE DMN_LOGICO DEFAULT 1,
    ADD CFOP_ALTERA_CUSTO DMN_LOGICO DEFAULT 1,
    ADD CFOP_GERA_DUPLICATA DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCOMPRAS.CFOP_ALTERA_ESTOQUE IS
'CFOP - Altera Estoque do produto:
0 - Nao
1 - Sim

A configuracao da CFOP e guardada aqui para manter o estado da CFOP quando a compra for finalizada.';

COMMENT ON COLUMN TBCOMPRAS.CFOP_ALTERA_CUSTO IS
'CFOP - Altera Custo do produto:
0 - Nao
1 - Sim

A configuracao da CFOP e guardada aqui para manter o estado da CFOP quando a compra for finalizada.';

COMMENT ON COLUMN TBCOMPRAS.CFOP_GERA_DUPLICATA IS
'CFOP - Gera Duplicata para a compra:
0 - Nao
1 - Sim

A configuracao da CFOP e guardada aqui para manter o estado da CFOP quando a compra for finalizada.';




/*------ SYSDBA 04/09/2019 13:38:20 --------*/

SET TERM ^ ;

CREATE trigger tg_vendas_cfop for tbvendas
active before insert or update position 7
AS
begin
  Select
      coalesce(c.cfop_altera_estoque_produto, 0)
    , coalesce(c.cfop_gerar_titulo, 0)
  from TBCFOP c
  where (c.cfop_cod = coalesce(new.cfop, 0))
  Into
      new.cfop_altera_estoque
    , new.cfop_gera_titulo;

  new.cfop_altera_estoque = coalesce(new.cfop_altera_estoque, 0);
  new.cfop_gera_titulo    = coalesce(new.cfop_gera_titulo, 0);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_VENDAS_CFOP IS 'Trigger Guardar CFOP Venda.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/09/2019

Trigger responsavel por definir e guardar as configuracoes do CFOP que influenciam
no estoque do produto e na geracao de titulos a receber.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR:
        * Documentacao do objeto.';




/*------ SYSDBA 04/09/2019 13:40:03 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR:
        + Criacao dos campos CFOP_ALTERA_ESTOQUE e CFOP_GERA_TITULO para armazenar as
          as configuracoes da CFOP que influenciam na geracao de estoque e titulos a
          receber.

    28/11/2017 - IMR:
        + Cricao do campo INDEX_VALOR para armazenar o valor da venda de forma indexada
          a fim de proporcionar um meio de busca dos registros pelo valor liquido da venda.

    20/08/2014 - IMR:
        + Criacao do campo DESCONTO_CUPOM para armazenar o valor de desconto concedido no PDV (Novo sistema em
          desenvolvimento).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    24/02/2015 - IMR:
        + Criacao dos campos CAIXA_ANO, CAIXA_NUM e CAIXA_PDV para facilitar a identificacao de vendas realizadas, mas
          que ainda nao geraram movimentacao de caixa, nos caixas do usuarios.';




/*------ SYSDBA 04/09/2019 13:40:59 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR:
        + Criacao dos campos CFOP_ALTERA_ESTOQUE e CFOP_GERA_DUPLICATA para armazenar as
          as configuracoes da CFOP que influenciam na deducao do estoque e duplicatas a
          pagar.

    28/11/2017 - IMR:
        + Cricao do campo INDEX_VALOR para armazenar o valor da compra de forma indexada
          a fim de proporcionar um meio de busca dos registros pelo valor liquido da compra.

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
          devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
          A Pagar.

    29/05/2014 - IMR:
        + Criacao dos campos TIPO_ENTRADA e TIPO_DOCUMENTO para que os movimentos de entrada possam ser classificados quanto
          a sua finalidade (Consumo, Producao/Faturamento, Imobilizado, ETC.) e ao tipo de documento usado para efeturar
          essa entrada (Cupom, NF, ETC.).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    30/07/2015 - IMR:
        + Criacao do campo CALCULAR_TOTAIS para que o sistema possa, atraves dele, calcular de forma automatica os valores
          totais que compoem o registro de entrada de Produtos e/ou Servicos.';




/*------ SYSDBA 04/09/2019 13:42:06 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR:
        + Criacao dos campos CFOP_ALTERA_ESTOQUE, CFOP_ALTERA_CUSTO e CFOP_GERA_DUPLICATA
          para armazenar as as configuracoes da CFOP que influenciam na deducao do estoque,
          alteracao do custo medio do produto e geracao de duplicatas a pagar (Contas A Pagar).

    28/11/2017 - IMR:
        + Cricao do campo INDEX_VALOR para armazenar o valor da compra de forma indexada
          a fim de proporcionar um meio de busca dos registros pelo valor liquido da compra.

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
          devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
          A Pagar.

    29/05/2014 - IMR:
        + Criacao dos campos TIPO_ENTRADA e TIPO_DOCUMENTO para que os movimentos de entrada possam ser classificados quanto
          a sua finalidade (Consumo, Producao/Faturamento, Imobilizado, ETC.) e ao tipo de documento usado para efeturar
          essa entrada (Cupom, NF, ETC.).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    30/07/2015 - IMR:
        + Criacao do campo CALCULAR_TOTAIS para que o sistema possa, atraves dele, calcular de forma automatica os valores
          totais que compoem o registro de entrada de Produtos e/ou Servicos.';




/*------ SYSDBA 04/09/2019 13:45:02 --------*/

SET TERM ^ ;

CREATE trigger tg_compras_cfop for tbcompras
active before insert or update position 7
AS
begin
  Select
      coalesce(c.cfop_altera_estoque_produto, 0)
    , coalesce(c.cfop_altera_custo_produto, 0)
    , coalesce(c.cfop_gerar_duplicata, 0)
  from TBCFOP c
  where (c.cfop_cod = coalesce(new.nfcfop, 0))
  Into
      new.cfop_altera_estoque
    , new.cfop_altera_custo
    , new.cfop_gera_duplicata;

  new.cfop_altera_estoque = coalesce(new.cfop_altera_estoque, 0);
  new.cfop_altera_custo   = coalesce(new.cfop_altera_custo, 0);
  new.cfop_gera_duplicata = coalesce(new.cfop_gera_duplicata, 0);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_COMPRAS_CFOP IS 'Trigger Guardar CFOP Compra.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/09/2019

Trigger responsavel por definir e guardar as configuracoes do CFOP que influenciam
no estoque do produto, no custo medio final e na geracao de duplicatas a pagar.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR:
        * Documentacao do objeto.';




/*------ SYSDBA 04/09/2019 13:46:15 --------*/

CREATE INDEX IDX_TBVENDAS_CFOP
ON TBVENDAS (CFOP,CFOP_ALTERA_ESTOQUE,CFOP_GERA_TITULO);




/*------ SYSDBA 04/09/2019 13:46:59 --------*/

CREATE INDEX IDX_TBCOMPRAS_CFOP
ON TBCOMPRAS (NFCFOP,CFOP_ALTERA_ESTOQUE,CFOP_ALTERA_CUSTO,CFOP_GERA_DUPLICATA);




/*------ SYSDBA 04/09/2019 13:49:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cfop for tbvendas
active before insert or update position 7
AS
begin
  Select
      coalesce(c.cfop_altera_estoque_produto, 0)
    , coalesce(c.cfop_gerar_titulo, 0)
  from TBCFOP c
  where (c.cfop_cod = coalesce(new.cfop, 0))
  Into
      new.cfop_altera_estoque
    , new.cfop_gera_titulo;

  new.cfop_altera_estoque = coalesce(new.cfop_altera_estoque, 1);
  new.cfop_gera_titulo    = coalesce(new.cfop_gera_titulo, 1);
end^

SET TERM ; ^




/*------ SYSDBA 04/09/2019 13:50:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cfop for tbcompras
active before insert or update position 7
AS
begin
  Select
      coalesce(c.cfop_altera_estoque_produto, 0)
    , coalesce(c.cfop_altera_custo_produto, 0)
    , coalesce(c.cfop_gerar_duplicata, 0)
  from TBCFOP c
  where (c.cfop_cod = coalesce(new.nfcfop, 0))
  Into
      new.cfop_altera_estoque
    , new.cfop_altera_custo
    , new.cfop_gera_duplicata;

  new.cfop_altera_estoque = coalesce(new.cfop_altera_estoque, 1);
  new.cfop_altera_custo   = coalesce(new.cfop_altera_custo, 1);
  new.cfop_gera_duplicata = coalesce(new.cfop_gera_duplicata, 1);
end^

SET TERM ; ^




/*------ SYSDBA 04/09/2019 13:50:34 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_compra DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo   Smallint;
  declare variable alterar_estoque Smallint;
  declare variable movimentar   Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      , ac.data_fatura = new.dtemiss
    where ac.ano     = new.autorizacao_ano
      and ac.codigo  = new.autorizacao_codigo
      and ac.empresa = new.autorizacao_empresa;

    -- Ler FLAG de alteracao de custo e estoque de produto
    alterar_custo   = coalesce(new.cfop_altera_custo, 1);
    alterar_estoque = coalesce(new.cfop_altera_estoque, 1);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , i.precounit
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , Cast((
            ( (i.valor_frete  / coalesce(nullif(i.Qtde, 0), 1)) / i.precounit * 100 ) +
            ( (i.valor_outros / coalesce(nullif(i.Qtde, 0), 1)) / i.precounit * 100 ) +
            coalesce(i.aliquota, 0.0)        +
            coalesce(i.aliquota_pis, 0.0)    +
            coalesce(i.aliquota_cofins, 0.0)
          ) as numeric(15,2)) as percentual_despesas
        , p.percentual_marckup
        , p.percentual_margem
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Preco_compra
        , Estoque
        , Custo_compra
        , Custo_produto
        , percentual_despesas
        , Percentual_markup
        , Percentual_margem
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = new.autorizacao_ano
        and aci.codigo  = new.autorizacao_codigo
        and aci.empresa = new.autorizacao_empresa
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      /* (Inicio) - Calcular o markup do produto */
      percentual_despesas = coalesce(:percentual_despesas, 0.0) + coalesce(:Percentual_margem, 0.0);

      if ( (100.0 - :percentual_despesas) = 0 ) then
        percentual_despesas = 99.0;

      Percentual_markup = 100.0 / (100.0 - :percentual_despesas); -- Encontrando o indice do Markup
      Percentual_markup = (:Percentual_markup - 1) * 100.0;       -- Transformando o indice em percentual
      /* (Final) - Calcular o markup do produto */

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when (:alterar_custo = 1) then :Custo_final else p.Customedio end
        , p.Qtde       = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:Estoque + :Quantidade) else :Estoque end
        /* Percentuais de markup e margem de lucro */
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_markup / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :estoque
        , i.Qtdefinal = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
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
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - COMPRA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , current_time
        , :estoque
        , :quantidade
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end
        , new.Usuario
        , Case when (:alterar_custo = 1) then replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',') else 'Sem ajustes no custo medio (**)' end
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 04/09/2019 13:51:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable alterar_custo   Smallint;
  declare variable alterar_estoque Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Ler FLAG de alteracao de custo e estoque de produto
    alterar_custo   = coalesce(new.cfop_altera_custo, 1);
    alterar_estoque = coalesce(new.cfop_altera_estoque, 1);

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 2  -- 2. Autorizada
      , ac.data_fatura = null
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , custo_compra
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque - :quantidade) else :estoque end
      where p.Cod    = :Produto;

      -- Decrementar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :lote_id);
      end

      -- Gerar historico
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
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque - :quantidade) else :estoque end
        , new.Cancel_usuario
        , Case when (:alterar_custo = 1) then replace('Custo Final no valor de R$ ' || :custo_compra, '.', ',') else 'Sem ajustes no custo medio (**)' end
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

    -- Cancelar Duplicata (Contas A Pagar)
    Update TBCONTPAG cp Set
      cp.Situacao = 0 -- Cancelado
    where cp.Empresa   = new.Codemp
      and cp.codforn   = new.Codforn
      and cp.anocompra = new.Ano
      and cp.numcompra = new.Codcontrol
      and cp.quitado   = 0;

    -- Cancelar Registro de Nota Fiscal Eletronica
    Update TBNFE_ENVIADA nfe Set
      nfe.cancelada = 1
    where nfe.empresa   = new.codemp
      and nfe.serie     = new.nfserie
      and nfe.numero    = new.nf
      and nfe.anocompra = new.ano
      and nfe.numcompra = new.codcontrol;
  end
end^

SET TERM ; ^




/*------ SYSDBA 04/09/2019 13:52:51 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable alterar_estoque Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    -- Ler FLAG de alteracao de estoque de produto
    alterar_estoque = coalesce(new.cfop_altera_estoque, 1);

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      estoque = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod = :Produto;

      -- Retornar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt + (:quantidade * e.fracionador)
        where (e.id = :lote_id);
      end

      -- Gerar historico
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
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then :estoque - :quantidade else :estoque end
        , :quantidade
        , :estoque
        , new.Cancel_usuario
        , replace('Venda no valor de R$ ' || :valor_produto, '.', ',')
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
      , r.enviado  = 0 -- Enviar boleto novamente para o banco
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;

    -- Cancelar Registro de Nota Fiscal Eletronica
    Update TBNFE_ENVIADA nfe Set
      nfe.cancelada = 1
    where nfe.empresa  = new.codemp
      and nfe.serie    = new.serie
      and nfe.numero   = new.nfe
      and nfe.anovenda = new.ano
      and nfe.numvenda = new.codcontrol;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 04/09/2019 13:53:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable cliente Integer;
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable referencia DMN_VCHAR_15;
  declare variable alterar_estoque Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Ler FLAG de alteracao de estoque de produto
    alterar_estoque = coalesce(new.cfop_altera_estoque, 1);

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.codcliente
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , nullif(trim(i.lote_id), '')
        , upper(coalesce(trim(i.referencia), ''))
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , cliente
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
        , referencia
    do
    begin
      --reserva = :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque - :quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

      -- Baixar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :lote_id);
      end

      -- Gravar posicao de estoque
      Update TVENDASITENS i Set
        i.Qtdefinal = :Estoque
      where i.Ano        = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

      -- Gerar historico
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
          :Empresa
        , :Produto
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - VENDA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then :estoque + :quantidade else :estoque end
        , :quantidade
        , :estoque
        , new.Usuario
        , replace('Venda no valor de R$ ' || :valor_produto, '.', ',')
      );

      -- Inserir armazenar codigo de referencia do produto no cliente
      if (:referencia <> '') then
        execute procedure SET_PRODUTO_CLIENTE(:produto, :cliente, :referencia);
    end
     
  end 
end^

SET TERM ; ^

