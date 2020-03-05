


/*------ SYSDBA 29/02/2020 13:36:41 --------*/

ALTER TABLE TBUSERS
    ADD ALMOX_MANIFESTO_AUTOMATICO DMN_LOGICO DEFAULT 0;




/*------ SYSDBA 29/02/2020 13:37:54 --------*/

ALTER TABLE TBEMPRESA
    ADD ATIVA DMN_LOGICO DEFAULT 1;




/*------ SYSDBA 29/02/2020 13:38:02 --------*/

CREATE VIEW VW_EMPRESA(
  CODIGO,
  CNPJ,
  RAZAO,
  FANTASIA)
AS
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as fantasia
from TBEMPRESA e
where e.ativa = 1
order by
    4 -- Fantasia
;



/*------ 29/02/2020 13:49:50 --------*/

ALTER TABLE TBCONFIGURACAO
  ADD CLIENTE_PERMITIR_VF_CNPJ DMN_LOGICO DEFAULT 0 NOT NULL,
  ADD VENDA_FORMA_PAGTO_CARTACREDITO DMN_SMALLINT_N,
  ADD NFE_LOTE DMN_BIGINT_N,
  ADD NFE_CARTA_CORRECAO DMN_BIGINT_N DEFAULT 0,
  ADD NFE_IMPRIMIR_COD_REFERENTE DMN_LOGICO NOT NULL,
  ADD NFCE_EMITIR DMN_LOGICO DEFAULT 0 NOT NULL,
  ADD NFCE_SERIE DMN_SMALLINT_N,
  ADD NFCE_NUMERO DMN_BIGINT_N,
  ADD RPS_SERIE DMN_VCHAR_05,
  ADD RPS_NUMERO DMN_BIGINT_N DEFAULT 0,
  ADD NFE_IMPRIMIR_COD_REFERENCIA DMN_LOGICO NOT NULL;


/*------ SYSDBA 29/02/2020 13:51:06 --------*/

COMMENT ON TABLE TBCONFIGURACAO IS 'Tabela Configuracoes da Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2014

Tabela responsavel por armazenar informacoes de configuracoes da empresa. Estas informacoes influenciam diretamente no
comportamento do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        + Criacao do campo CLIENTE_PERMITIR_DUPLICAR_CNPJ para permitir ou nao duplicacao de CPF/CNPJ no cadastro dos
          clientes.

    04/09/2014 - IMR:
        + Criacao do campo NFE_ACEITAR_NOTA_DENEGADA para permitir ou nao o emitende de NF-e aceitar o retorno de NF-e
          denegadas e guarda-las na base.

    12/12/2014 - IMR:
        + Criacao dos campos NFCE_TOKEN_ID e NFCE_TOKEN parameter validar a geracao do QRCODE na emissao das NFC-e.

    30/07/2015 - IMR:
        + Criacao do campo NFE_EMITIR_ENTRADA que funcionara como controle para que a aplicacao permita ou nao a
          emissao de NF-e de entrada de produtos para terceiros.';



/*------ 29/02/2020 13:56:24 --------*/

ALTER TABLE TBCONFIGURACAO
  ADD NFE_SERIE   DMN_SMALLINT_N,
  ADD NFE_NUMERO  DMN_BIGINT_N;





/*------ SYSDBA 04/03/2020 22:40:11 --------*/

ALTER TABLE TBCONTA_CORRENTE
    ADD CODIGO_CONTABIL DMN_VCHAR_20;




/*------ SYSDBA 04/03/2020 22:40:44 --------*/

alter table TBCONTA_CORRENTE
alter column CODIGO position 1;


/*------ SYSDBA 04/03/2020 22:40:44 --------*/

alter table TBCONTA_CORRENTE
alter column DESCRICAO position 2;


/*------ SYSDBA 04/03/2020 22:40:44 --------*/

alter table TBCONTA_CORRENTE
alter column TIPO position 3;


/*------ SYSDBA 04/03/2020 22:40:44 --------*/

alter table TBCONTA_CORRENTE
alter column EMPRESA position 4;


/*------ SYSDBA 04/03/2020 22:40:44 --------*/

alter table TBCONTA_CORRENTE
alter column CONTA_BANCO_BOLETO position 5;


/*------ SYSDBA 04/03/2020 22:40:44 --------*/

alter table TBCONTA_CORRENTE
alter column CODIGO_CONTABIL position 6;


/*------ SYSDBA 04/03/2020 22:42:17 --------*/

ALTER TABLE TBCONTA_CORRENTE
    ADD BCO_CODIGO_CC DMN_SMALLINT_N;

COMMENT ON COLUMN TBCONTA_CORRENTE.BCO_CODIGO_CC IS
'Codigo do Banco da tabela TBBANCO_BOLETO.

Apenas para a conta corrente que for do tipo 2 (Banco)';

COMMENT ON COLUMN TBCONTA_CORRENTE.CONTA_BANCO_BOLETO IS
'Banco Boleto (Codigo Febraban).

Apenas para a conta corrente que for do tipo 2 (Banco)';

alter table TBCONTA_CORRENTE
alter CODIGO position 1;

alter table TBCONTA_CORRENTE
alter DESCRICAO position 2;

alter table TBCONTA_CORRENTE
alter TIPO position 3;

alter table TBCONTA_CORRENTE
alter BCO_CODIGO_CC position 4;

alter table TBCONTA_CORRENTE
alter EMPRESA position 5;

alter table TBCONTA_CORRENTE
alter CONTA_BANCO_BOLETO position 6;

alter table TBCONTA_CORRENTE
alter CODIGO_CONTABIL position 7;




/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column CODIGO position 1;


/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column DESCRICAO position 2;


/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column TIPO position 3;


/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column BCO_CODIGO_CC position 4;


/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column CONTA_BANCO_BOLETO position 5;


/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column EMPRESA position 6;


/*------ SYSDBA 04/03/2020 22:42:27 --------*/

alter table TBCONTA_CORRENTE
alter column CODIGO_CONTABIL position 7;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CODIGO position 1;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_COD position 2;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column EMPRESA position 3;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CARTEIRA position 4;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_NOME position 5;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_AGENCIA position 6;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CC position 7;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CODIGO_CEDENTE position 8;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CHAVE position 9;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_GERAR_BOLETO position 10;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_NOSSO_NUM_INICIO position 11;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_NOSSO_NUM_FINAL position 12;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_NOSSO_NUM_PROXIMO position 13;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CONFG_1 position 14;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_CONFG_2 position 15;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_SEQUENCIAL_REM position 16;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_DIRETORIO_REMESSA position 17;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_DIRETORIO_RETORNO position 18;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_PERCENTUAL_JUROS position 19;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_PERCENTUAL_MORA position 20;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_DIA_PROTESTO position 21;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_MSG_INSTRUCAO position 22;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_LAYOUT_REMESSA position 23;


/*------ SYSDBA 04/03/2020 22:44:40 --------*/

alter table TBBANCO_BOLETO
alter column BCO_LAYOUT_RETORNO position 24;


/*------ SYSDBA 04/03/2020 22:45:54 --------*/

ALTER TABLE TBBANCO_BOLETO
ADD CONSTRAINT UNQ_TBBANCO_BOLETO_CODIGO
UNIQUE (BCO_CODIGO);




/*------ SYSDBA 04/03/2020 22:47:15 --------*/

ALTER TABLE TBCONTA_CORRENTE
ADD CONSTRAINT FK_TBCONTA_CORRENTE_BCO_CC
FOREIGN KEY (BCO_CODIGO_CC)
REFERENCES TBBANCO_BOLETO(BCO_CODIGO);




/*------ SYSDBA 04/03/2020 22:52:03 --------*/

ALTER TABLE TBFORMPAGTO
    ADD ATIVA DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORMPAGTO.ATIVA IS
'Ativa:
0 - Nao
1 - Sim';




/*------ SYSDBA 04/03/2020 22:53:22 --------*/

ALTER TABLE TBFORMPAGTO_CONDICAO
    ADD SELECIONAR DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORMPAGTO_CONDICAO.SELECIONAR IS
'Selecionado:
0 - Nao
1 - Sim';




/*------ SYSDBA 04/03/2020 22:53:57 --------*/

ALTER TABLE TBFORMPAGTO_CONTACOR
    ADD SELECIONAR DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORMPAGTO_CONTACOR.SELECIONAR IS
'Selecionado:
0 - Nao
1 - Sim';




/*------ SYSDBA 04/03/2020 22:55:39 --------*/

ALTER TABLE TBCONDICAOPAGTO
    ADD ATIVA DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCONDICAOPAGTO.ATIVA IS
'Ativa:
0 - Nao
1 - Sim';



/*------ 04/03/2020 22:57:12 --------*/

CREATE TABLE SYS_TIPO_PRODUTO (
  CODIGO DMN_SMALLINT_NN NOT NULL,
  DESCRICAO DMN_VCHAR_50);

/*------ 04/03/2020 22:57:12 --------*/

ALTER TABLE SYS_TIPO_PRODUTO ADD CONSTRAINT PK_SYS_TIPO_PRODUTO PRIMARY KEY (CODIGO);


/*------ SYSDBA 04/03/2020 23:22:04 --------*/

ALTER TABLE TBTRIBUTACAO_TIPO
    ADD OBRIGAR_CEST DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBTRIBUTACAO_TIPO.OBRIGAR_CEST IS
'Obrigar produto/servico informar o CEST:
0 - Nao
1 - Sim

CEST - Codigo Especificador da Substituicao Tributaria';



/*------ SYSDBA 04/03/2020 23:24:07 --------*/

ALTER TABLE TBPRODUTO
    ADD ANVISA DMN_VCHAR_30;

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter PRECO position 9;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 10;

alter table TBPRODUTO
alter REFERENCIA position 11;

alter table TBPRODUTO
alter ESPECIFICACAO position 12;

alter table TBPRODUTO
alter SECAO position 13;

alter table TBPRODUTO
alter QTDE position 14;

alter table TBPRODUTO
alter FRACIONADOR position 15;

alter table TBPRODUTO
alter PESO_BRUTO position 16;

alter table TBPRODUTO
alter PESO_LIQUIDO position 17;

alter table TBPRODUTO
alter CUBAGEM position 18;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 19;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 20;

alter table TBPRODUTO
alter UNIDADE position 21;

alter table TBPRODUTO
alter ESTOQMIN position 22;

alter table TBPRODUTO
alter CODGRUPO position 23;

alter table TBPRODUTO
alter CODFABRICANTE position 24;

alter table TBPRODUTO
alter CUSTOMEDIO position 25;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 27;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 28;

alter table TBPRODUTO
alter CODEMP position 29;

alter table TBPRODUTO
alter CODSECAO position 30;

alter table TBPRODUTO
alter CODORIGEM position 31;

alter table TBPRODUTO
alter CODTRIBUTACAO position 32;

alter table TBPRODUTO
alter CST position 33;

alter table TBPRODUTO
alter CSOSN position 34;

alter table TBPRODUTO
alter CST_PIS position 35;

alter table TBPRODUTO
alter CST_COFINS position 36;

alter table TBPRODUTO
alter NCM_SH position 37;

alter table TBPRODUTO
alter CODIGO_NVE position 38;

alter table TBPRODUTO
alter CODCFOP position 39;

alter table TBPRODUTO
alter CODBARRA_EAN position 40;

alter table TBPRODUTO
alter CODUNIDADE position 41;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 42;

alter table TBPRODUTO
alter ALIQUOTA position 43;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 44;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 45;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 46;

alter table TBPRODUTO
alter VALOR_IPI position 47;

alter table TBPRODUTO
alter RESERVA position 48;

alter table TBPRODUTO
alter PRODUTO_NOVO position 49;

alter table TBPRODUTO
alter COR_VEICULO position 50;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 51;

alter table TBPRODUTO
alter TIPO_VEICULO position 52;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 53;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 54;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 55;

alter table TBPRODUTO
alter CHASSI_VEICULO position 56;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 57;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 58;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 59;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 60;

alter table TBPRODUTO
alter USUARIO position 61;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 62;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 63;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 64;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 65;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 66;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 67;

alter table TBPRODUTO
alter CUST_DESP_ADM position 68;

alter table TBPRODUTO
alter CUST_COMISSAO position 69;

alter table TBPRODUTO
alter CUST_IMPOSTO position 70;

alter table TBPRODUTO
alter FI_RET_FINANC position 71;

alter table TBPRODUTO
alter FI_RET_PLANO position 72;

alter table TBPRODUTO
alter IAT position 73;

alter table TBPRODUTO
alter IPPT position 74;

alter table TBPRODUTO
alter SITUACAO_TRIB position 75;

alter table TBPRODUTO
alter DTESTOQ position 76;

alter table TBPRODUTO
alter FLAGACEITO position 77;

alter table TBPRODUTO
alter FLAGSIS position 78;

alter table TBPRODUTO
alter FLAGEST position 79;

alter table TBPRODUTO
alter FLAGCOMBUST position 80;

alter table TBPRODUTO
alter PRECO_APRAZO position 81;

alter table TBPRODUTO
alter PRECO2 position 82;

alter table TBPRODUTO
alter FLAGGRADE position 83;

alter table TBPRODUTO
alter FLAGBALANCA position 84;

alter table TBPRODUTO
alter DTINIPROM position 85;

alter table TBPRODUTO
alter DTFIMPROM position 86;

alter table TBPRODUTO
alter PROD_SERV position 87;

alter table TBPRODUTO
alter FLAGATIVO position 88;

alter table TBPRODUTO
alter DESCONTO_MAX position 89;

alter table TBPRODUTO
alter FLAGKITPROD position 90;

alter table TBPRODUTO
alter FLAGSERIAL position 91;

alter table TBPRODUTO
alter TCSMART position 92;

alter table TBPRODUTO
alter TIPI position 93;

alter table TBPRODUTO
alter GENERO position 94;

alter table TBPRODUTO
alter ALIQUOTA_IPI position 95;

alter table TBPRODUTO
alter TPMERCREV position 96;

alter table TBPRODUTO
alter DESCRIUNID position 97;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 98;

alter table TBPRODUTO
alter NOME_AMIGO position 99;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 100;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 101;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 102;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 103;

alter table TBPRODUTO
alter TABELA_IBPT position 104;



/*------ SYSDBA 04/03/2020 23:25:35 --------*/

ALTER TABLE TBPRODUTO
    ADD LARGURA DMN_MONEY_DESCONTO_4,
    ADD ALTURA DMN_MONEY_DESCONTO_4,
    ADD ESPESSURA DMN_MONEY_DESCONTO_4;

COMMENT ON COLUMN TBPRODUTO.LARGURA IS
'Valor Desconto c/ 4 cadas decimais.';

COMMENT ON COLUMN TBPRODUTO.ALTURA IS
'Valor Desconto c/ 4 cadas decimais.';

COMMENT ON COLUMN TBPRODUTO.ESPESSURA IS
'Valor Desconto c/ 4 cadas decimais.';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter PRECO position 9;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 10;

alter table TBPRODUTO
alter REFERENCIA position 11;

alter table TBPRODUTO
alter ESPECIFICACAO position 12;

alter table TBPRODUTO
alter SECAO position 13;

alter table TBPRODUTO
alter QTDE position 14;

alter table TBPRODUTO
alter FRACIONADOR position 15;

alter table TBPRODUTO
alter PESO_BRUTO position 16;

alter table TBPRODUTO
alter PESO_LIQUIDO position 17;

alter table TBPRODUTO
alter LARGURA position 18;

alter table TBPRODUTO
alter ALTURA position 19;

alter table TBPRODUTO
alter ESPESSURA position 20;

alter table TBPRODUTO
alter CUBAGEM position 21;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 22;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 23;

alter table TBPRODUTO
alter UNIDADE position 24;

alter table TBPRODUTO
alter ESTOQMIN position 25;

alter table TBPRODUTO
alter CODGRUPO position 26;

alter table TBPRODUTO
alter CODFABRICANTE position 27;

alter table TBPRODUTO
alter CUSTOMEDIO position 28;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 29;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 30;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 31;

alter table TBPRODUTO
alter CODEMP position 32;

alter table TBPRODUTO
alter CODSECAO position 33;

alter table TBPRODUTO
alter CODORIGEM position 34;

alter table TBPRODUTO
alter CODTRIBUTACAO position 35;

alter table TBPRODUTO
alter CST position 36;

alter table TBPRODUTO
alter CSOSN position 37;

alter table TBPRODUTO
alter CST_PIS position 38;

alter table TBPRODUTO
alter CST_COFINS position 39;

alter table TBPRODUTO
alter NCM_SH position 40;

alter table TBPRODUTO
alter CODIGO_NVE position 41;

alter table TBPRODUTO
alter CODCFOP position 42;

alter table TBPRODUTO
alter CODBARRA_EAN position 43;

alter table TBPRODUTO
alter CODUNIDADE position 44;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 45;

alter table TBPRODUTO
alter ALIQUOTA position 46;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 47;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 48;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 49;

alter table TBPRODUTO
alter VALOR_IPI position 50;

alter table TBPRODUTO
alter RESERVA position 51;

alter table TBPRODUTO
alter PRODUTO_NOVO position 52;

alter table TBPRODUTO
alter COR_VEICULO position 53;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 54;

alter table TBPRODUTO
alter TIPO_VEICULO position 55;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 56;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 57;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 58;

alter table TBPRODUTO
alter CHASSI_VEICULO position 59;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 60;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 61;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 62;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 63;

alter table TBPRODUTO
alter USUARIO position 64;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 65;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 66;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 67;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 68;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 69;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 70;

alter table TBPRODUTO
alter CUST_DESP_ADM position 71;

alter table TBPRODUTO
alter CUST_COMISSAO position 72;

alter table TBPRODUTO
alter CUST_IMPOSTO position 73;

alter table TBPRODUTO
alter FI_RET_FINANC position 74;

alter table TBPRODUTO
alter FI_RET_PLANO position 75;

alter table TBPRODUTO
alter IAT position 76;

alter table TBPRODUTO
alter IPPT position 77;

alter table TBPRODUTO
alter SITUACAO_TRIB position 78;

alter table TBPRODUTO
alter DTESTOQ position 79;

alter table TBPRODUTO
alter FLAGACEITO position 80;

alter table TBPRODUTO
alter FLAGSIS position 81;

alter table TBPRODUTO
alter FLAGEST position 82;

alter table TBPRODUTO
alter FLAGCOMBUST position 83;

alter table TBPRODUTO
alter PRECO_APRAZO position 84;

alter table TBPRODUTO
alter PRECO2 position 85;

alter table TBPRODUTO
alter FLAGGRADE position 86;

alter table TBPRODUTO
alter FLAGBALANCA position 87;

alter table TBPRODUTO
alter DTINIPROM position 88;

alter table TBPRODUTO
alter DTFIMPROM position 89;

alter table TBPRODUTO
alter PROD_SERV position 90;

alter table TBPRODUTO
alter FLAGATIVO position 91;

alter table TBPRODUTO
alter DESCONTO_MAX position 92;

alter table TBPRODUTO
alter FLAGKITPROD position 93;

alter table TBPRODUTO
alter FLAGSERIAL position 94;

alter table TBPRODUTO
alter TCSMART position 95;

alter table TBPRODUTO
alter TIPI position 96;

alter table TBPRODUTO
alter GENERO position 97;

alter table TBPRODUTO
alter ALIQUOTA_IPI position 98;

alter table TBPRODUTO
alter TPMERCREV position 99;

alter table TBPRODUTO
alter DESCRIUNID position 100;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 101;

alter table TBPRODUTO
alter NOME_AMIGO position 102;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 103;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 104;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 105;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 106;

alter table TBPRODUTO
alter TABELA_IBPT position 107;



/*------ SYSDBA 04/03/2020 23:27:34 --------*/

ALTER TABLE TBPRODUTO
    ADD CODTIPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBPRODUTO.CODTIPO IS
'Tipo do produto, quando a aliquota for ICMS (Tipo Aliquota 0)';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter ANVISA position 8;

alter table TBPRODUTO
alter PRECO position 9;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 10;

alter table TBPRODUTO
alter REFERENCIA position 11;

alter table TBPRODUTO
alter ESPECIFICACAO position 12;

alter table TBPRODUTO
alter SECAO position 13;

alter table TBPRODUTO
alter QTDE position 14;

alter table TBPRODUTO
alter FRACIONADOR position 15;

alter table TBPRODUTO
alter PESO_BRUTO position 16;

alter table TBPRODUTO
alter PESO_LIQUIDO position 17;

alter table TBPRODUTO
alter LARGURA position 18;

alter table TBPRODUTO
alter ALTURA position 19;

alter table TBPRODUTO
alter ESPESSURA position 20;

alter table TBPRODUTO
alter CUBAGEM position 21;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 22;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 23;

alter table TBPRODUTO
alter UNIDADE position 24;

alter table TBPRODUTO
alter ESTOQMIN position 25;

alter table TBPRODUTO
alter CODTIPO position 26;

alter table TBPRODUTO
alter CODGRUPO position 27;

alter table TBPRODUTO
alter CODFABRICANTE position 28;

alter table TBPRODUTO
alter CUSTOMEDIO position 29;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 30;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 31;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 32;

alter table TBPRODUTO
alter CODEMP position 33;

alter table TBPRODUTO
alter CODSECAO position 34;

alter table TBPRODUTO
alter CODORIGEM position 35;

alter table TBPRODUTO
alter CODTRIBUTACAO position 36;

alter table TBPRODUTO
alter CST position 37;

alter table TBPRODUTO
alter CSOSN position 38;

alter table TBPRODUTO
alter CST_PIS position 39;

alter table TBPRODUTO
alter CST_COFINS position 40;

alter table TBPRODUTO
alter NCM_SH position 41;

alter table TBPRODUTO
alter CODIGO_NVE position 42;

alter table TBPRODUTO
alter CODCFOP position 43;

alter table TBPRODUTO
alter CODBARRA_EAN position 44;

alter table TBPRODUTO
alter CODUNIDADE position 45;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 46;

alter table TBPRODUTO
alter ALIQUOTA position 47;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 48;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 49;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 50;

alter table TBPRODUTO
alter VALOR_IPI position 51;

alter table TBPRODUTO
alter RESERVA position 52;

alter table TBPRODUTO
alter PRODUTO_NOVO position 53;

alter table TBPRODUTO
alter COR_VEICULO position 54;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 55;

alter table TBPRODUTO
alter TIPO_VEICULO position 56;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 57;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 58;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 59;

alter table TBPRODUTO
alter CHASSI_VEICULO position 60;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 61;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 62;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 63;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 64;

alter table TBPRODUTO
alter USUARIO position 65;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 66;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 67;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 68;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 69;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 70;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 71;

alter table TBPRODUTO
alter CUST_DESP_ADM position 72;

alter table TBPRODUTO
alter CUST_COMISSAO position 73;

alter table TBPRODUTO
alter CUST_IMPOSTO position 74;

alter table TBPRODUTO
alter FI_RET_FINANC position 75;

alter table TBPRODUTO
alter FI_RET_PLANO position 76;

alter table TBPRODUTO
alter IAT position 77;

alter table TBPRODUTO
alter IPPT position 78;

alter table TBPRODUTO
alter SITUACAO_TRIB position 79;

alter table TBPRODUTO
alter DTESTOQ position 80;

alter table TBPRODUTO
alter FLAGACEITO position 81;

alter table TBPRODUTO
alter FLAGSIS position 82;

alter table TBPRODUTO
alter FLAGEST position 83;

alter table TBPRODUTO
alter FLAGCOMBUST position 84;

alter table TBPRODUTO
alter PRECO_APRAZO position 85;

alter table TBPRODUTO
alter PRECO2 position 86;

alter table TBPRODUTO
alter FLAGGRADE position 87;

alter table TBPRODUTO
alter FLAGBALANCA position 88;

alter table TBPRODUTO
alter DTINIPROM position 89;

alter table TBPRODUTO
alter DTFIMPROM position 90;

alter table TBPRODUTO
alter PROD_SERV position 91;

alter table TBPRODUTO
alter FLAGATIVO position 92;

alter table TBPRODUTO
alter DESCONTO_MAX position 93;

alter table TBPRODUTO
alter FLAGKITPROD position 94;

alter table TBPRODUTO
alter FLAGSERIAL position 95;

alter table TBPRODUTO
alter TCSMART position 96;

alter table TBPRODUTO
alter TIPI position 97;

alter table TBPRODUTO
alter GENERO position 98;

alter table TBPRODUTO
alter ALIQUOTA_IPI position 99;

alter table TBPRODUTO
alter TPMERCREV position 100;

alter table TBPRODUTO
alter DESCRIUNID position 101;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 102;

alter table TBPRODUTO
alter NOME_AMIGO position 103;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 104;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 105;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 106;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 107;

alter table TBPRODUTO
alter TABELA_IBPT position 108;



/*------ SYSDBA 04/03/2020 23:28:55 --------*/

ALTER TABLE TBPRODUTO
    ADD GERAR_SUBPRODUTO DMN_LOGICO DEFAULT 0,
    ADD PRODUTO_PAI DMN_VCHAR_10;



/*------ 04/03/2020 23:31:34 --------*/

SET TERM ^ ;

SET TERM ; ^


/*------ SYSDBA 04/03/2020 23:32:03 --------*/

CREATE DOMAIN DMN_VCHAR_40 AS
VARCHAR(40);



/*------ 04/03/2020 23:32:07 --------*/

SET TERM ^ ;

CREATE PROCEDURE SET_GENERATOR(
  GENERATOR_NAME DMN_VCHAR_40,
  GENERATOR_YEAR DMN_VCHAR_04)
AS
DECLARE VARIABLE agenerator dmn_vchar_40;
DECLARE VARIABLE generatorid dmn_smallint_n;
DECLARE VARIABLE sql_create dmn_vchar_250;
begin
  if (coalesce(trim(:generator_year), '') = '') then
    aGenerator = trim(upper(:generator_name));
  else
    aGenerator = trim(upper(:generator_name)) || '_' || trim(:generator_year);

  Select first 1
    g.rdb$generator_id
  from RDB$GENERATORS g
  where (g.rdb$generator_name = :aGenerator)
  Into
    GeneratorID;

  if (coalesce(:GeneratorID, 0) = 0) then
  begin
    sql_create = Trim('CREATE SEQUENCE ' || :aGenerator);
    execute statement :sql_create;
  end
end^

/*------ 04/03/2020 23:32:07 --------*/

SET TERM ; ^

/*------ SYSDBA 04/03/2020 23:34:06 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
V.LOTE_NFE_CODIGO.
At line 22, column 7.

*/


/*------ SYSDBA 04/03/2020 23:35:22 --------*/

ALTER TABLE TBVENDAS
    ADD LOTE_NFE_CODIGO DMN_INTEGER_N;

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
alter DTFINALIZACAO_VENDA position 14;

alter table TBVENDAS
alter OBS position 15;

alter table TBVENDAS
alter FORMAPAG position 16;

alter table TBVENDAS
alter FATDIAS position 17;

alter table TBVENDAS
alter SERIE position 18;

alter table TBVENDAS
alter NFE position 19;

alter table TBVENDAS
alter DATAEMISSAO position 20;

alter table TBVENDAS
alter HORAEMISSAO position 21;

alter table TBVENDAS
alter CFOP position 22;

alter table TBVENDAS
alter VERIFICADOR_NFE position 23;

alter table TBVENDAS
alter XML_NFE position 24;

alter table TBVENDAS
alter VENDEDOR_COD position 25;

alter table TBVENDAS
alter USUARIO position 26;

alter table TBVENDAS
alter FORMAPAGTO_COD position 27;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 28;

alter table TBVENDAS
alter VENDA_PRAZO position 29;

alter table TBVENDAS
alter PRAZO_01 position 30;

alter table TBVENDAS
alter PRAZO_02 position 31;

alter table TBVENDAS
alter PRAZO_03 position 32;

alter table TBVENDAS
alter PRAZO_04 position 33;

alter table TBVENDAS
alter PRAZO_05 position 34;

alter table TBVENDAS
alter PRAZO_06 position 35;

alter table TBVENDAS
alter PRAZO_07 position 36;

alter table TBVENDAS
alter PRAZO_08 position 37;

alter table TBVENDAS
alter PRAZO_09 position 38;

alter table TBVENDAS
alter PRAZO_10 position 39;

alter table TBVENDAS
alter PRAZO_11 position 40;

alter table TBVENDAS
alter PRAZO_12 position 41;

alter table TBVENDAS
alter LOTE_NFE_ANO position 42;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 43;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 44;

alter table TBVENDAS
alter LOTE_NFE_CODIGO position 45;

alter table TBVENDAS
alter NFE_ENVIADA position 46;

alter table TBVENDAS
alter NFE_DENEGADA position 47;

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 48;

alter table TBVENDAS
alter CANCEL_USUARIO position 49;

alter table TBVENDAS
alter CANCEL_DATAHORA position 50;

alter table TBVENDAS
alter CANCEL_MOTIVO position 51;

alter table TBVENDAS
alter XML_NFE_FILENAME position 52;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 53;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 54;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 55;

alter table TBVENDAS
alter NFE_PLACA_UF position 56;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 57;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 58;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 59;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 60;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 61;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 62;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 63;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 64;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 65;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 66;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 67;

alter table TBVENDAS
alter NFE_VALOR_PIS position 68;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 69;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 70;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 71;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 72;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 73;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 74;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 75;

alter table TBVENDAS
alter SITUACAO position 76;

alter table TBVENDAS
alter TOTALACRESCIMO position 77;

alter table TBVENDAS
alter TOTALDESCONTO position 78;

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

alter table TBVENDAS
alter DADOS_ENTREGA position 96;

alter table TBVENDAS
alter MODELO_NF position 97;




/*------ SYSDBA 04/03/2020 23:35:40 --------*/

COMMENT ON COLUMN TBVENDAS.LOTE_NFE_CODIGO IS
'Codigo do lote de envio (Interno para NFe.Ide.cNF - Componente ACBr).';



/*------ 04/03/2020 23:37:08 --------*/

CREATE TABLE TBTPRECEITA (
  COD SMALLINT NOT NULL,
  CLASSIFICACAO DMN_SMALLINT_NN DEFAULT 0,
  TIPOREC DMN_VCHAR_50,
  TIPO_PARTICULAR DMN_LOGICO DEFAULT 0 NOT NULL,
  PLANO_CONTA DMN_BIGINT_N,
  ATIVO DMN_LOGICO DEFAULT 1 NOT NULL);

/*------ 04/03/2020 23:37:08 --------*/

ALTER TABLE TBTPRECEITA ADD CONSTRAINT PK_TBTPRECEITA PRIMARY KEY (COD);

/*------ 04/03/2020 23:37:08 --------*/

ALTER TABLE TBTPRECEITA ADD CONSTRAINT FK_TBTPRECEITA_PLANO_CONTA FOREIGN KEY (PLANO_CONTA) REFERENCES TBPLANO_CONTA(CODIGO);

/*------ 04/03/2020 23:37:08 --------*/

ALTER TABLE TBTPRECEITA ADD CONSTRAINT UNQ_TBTPRECEITA UNIQUE (TIPOREC);

/*------ 04/03/2020 23:37:08 --------*/

CREATE INDEX IDX_TBTPRECEITA_TIPO ON TBTPRECEITA(ATIVO);

/*------ SYSDBA 04/03/2020 23:40:37 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
I.LOTE_ID.
At line 12, column 7.

*/


/*------ SYSDBA 04/03/2020 23:43:05 --------*/

ALTER TABLE TVENDASITENS
    ADD LOTE_ID DMN_GUID_38;

alter table TVENDASITENS
alter ANO position 1;

alter table TVENDASITENS
alter CODCONTROL position 2;

alter table TVENDASITENS
alter SEQ position 3;

alter table TVENDASITENS
alter CODPROD position 4;

alter table TVENDASITENS
alter CODEMP position 5;

alter table TVENDASITENS
alter CODCLIENTE position 6;

alter table TVENDASITENS
alter CODCLI position 7;

alter table TVENDASITENS
alter DTVENDA position 8;

alter table TVENDASITENS
alter QTDE position 9;

alter table TVENDASITENS
alter LOTE_ID position 10;

alter table TVENDASITENS
alter PUNIT position 11;

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 12;

alter table TVENDASITENS
alter DESCONTO position 13;

alter table TVENDASITENS
alter DESCONTO_VALOR position 14;

alter table TVENDASITENS
alter PFINAL position 15;

alter table TVENDASITENS
alter QTDEFINAL position 16;

alter table TVENDASITENS
alter UNID_COD position 17;

alter table TVENDASITENS
alter CFOP_COD position 18;

alter table TVENDASITENS
alter CST position 19;

alter table TVENDASITENS
alter CSOSN position 20;

alter table TVENDASITENS
alter ALIQUOTA position 21;

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 22;

alter table TVENDASITENS
alter ALIQUOTA_PIS position 23;

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 24;

alter table TVENDASITENS
alter VALOR_IPI position 25;

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 26;

alter table TVENDASITENS
alter TOTAL_BRUTO position 27;

alter table TVENDASITENS
alter TOTAL_DESCONTO position 28;

alter table TVENDASITENS
alter TOTAL_LIQUIDO position 29;

alter table TVENDASITENS
alter CODVENDEDOR position 30;

alter table TVENDASITENS
alter TOTAL_COMISSAO position 31;



/*------ SYSDBA 04/03/2020 23:43:08 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
I.REFERENCIA.
At line 13, column 7.

*/


/*------ SYSDBA 04/03/2020 23:44:01 --------*/

ALTER TABLE TVENDASITENS
    ADD REFERENCIA DMN_VCHAR_15;

COMMENT ON COLUMN TVENDASITENS.REFERENCIA IS
'Referencia / Codigo externo (Importante para OPME) / Codigo do Produto no Cliente';

COMMENT ON COLUMN TVENDASITENS.LOTE_ID IS
'ID do Lote do produto, caso o estoque do produto seja gerenciado por lote.';

alter table TVENDASITENS
alter ANO position 1;

alter table TVENDASITENS
alter CODCONTROL position 2;

alter table TVENDASITENS
alter SEQ position 3;

alter table TVENDASITENS
alter CODPROD position 4;

alter table TVENDASITENS
alter REFERENCIA position 5;

alter table TVENDASITENS
alter CODEMP position 6;

alter table TVENDASITENS
alter CODCLIENTE position 7;

alter table TVENDASITENS
alter CODCLI position 8;

alter table TVENDASITENS
alter DTVENDA position 9;

alter table TVENDASITENS
alter QTDE position 10;

alter table TVENDASITENS
alter LOTE_ID position 11;

alter table TVENDASITENS
alter PUNIT position 12;

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 13;

alter table TVENDASITENS
alter DESCONTO position 14;

alter table TVENDASITENS
alter DESCONTO_VALOR position 15;

alter table TVENDASITENS
alter PFINAL position 16;

alter table TVENDASITENS
alter QTDEFINAL position 17;

alter table TVENDASITENS
alter UNID_COD position 18;

alter table TVENDASITENS
alter CFOP_COD position 19;

alter table TVENDASITENS
alter CST position 20;

alter table TVENDASITENS
alter CSOSN position 21;

alter table TVENDASITENS
alter ALIQUOTA position 22;

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 23;

alter table TVENDASITENS
alter ALIQUOTA_PIS position 24;

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 25;

alter table TVENDASITENS
alter VALOR_IPI position 26;

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 27;

alter table TVENDASITENS
alter TOTAL_BRUTO position 28;

alter table TVENDASITENS
alter TOTAL_DESCONTO position 29;

alter table TVENDASITENS
alter TOTAL_LIQUIDO position 30;

alter table TVENDASITENS
alter CODVENDEDOR position 31;

alter table TVENDASITENS
alter TOTAL_COMISSAO position 32;



/*------ SYSDBA 04/03/2020 23:45:25 --------*/

/*!!! Error occured !!!
Undefined name.
Dynamic SQL Error.
SQL error code = -204.
Table unknown.
TBPRODUTO_CLIENTE.
At line 53, column 31.

*/

/*------ 04/03/2020 23:45:55 --------*/

CREATE TABLE TBPRODUTO_CLIENTE (
  PRODUTO DMN_VCHAR_10_KEY NOT NULL,
  CLIENTE DMN_INTEGER_NN NOT NULL,
  REFERENCIA DMN_VCHAR_15);

/*------ 04/03/2020 23:45:55 --------*/

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT PK_TBPRODUTO_CLIENTE PRIMARY KEY (CLIENTE,PRODUTO);

/*------ 04/03/2020 23:45:55 --------*/

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_CLI FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE(CODIGO) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 04/03/2020 23:45:55 --------*/

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_PRD FOREIGN KEY (PRODUTO) REFERENCES TBPRODUTO(COD) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 04/03/2020 23:45:55 --------*/

CREATE INDEX IDX_TBPRODUTO_CLIENTE_REF ON TBPRODUTO_CLIENTE(REFERENCIA);

/*------ SYSDBA 04/03/2020 23:46:37 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.LOTE_ID.
At line 9, column 102.

*/


/*------ SYSDBA 04/03/2020 23:48:10 --------*/

ALTER TABLE TBCLIENTE_ESTOQUE
    ADD LOTE_ID DMN_GUID_38,
    ADD CONSIGNADO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCLIENTE_ESTOQUE.LOTE_ID IS
'ID do Lote do produto, caso o estoque do produto seja gerenciado por lote.';

COMMENT ON COLUMN TBCLIENTE_ESTOQUE.CONSIGNADO IS
'Produto Consignado:
0 - Nao
1 - Sim

Produto marcado como CONSIGNADO quando a venda origem da requisicao automatica
tiver como CFOP os codigos 5917 (Remessa de mercadoria em consignacao mercantil
ou industrial - Dentro do Estado) ou 6917 (Remessa de mercadoria em consignacao
mercantil ou industrial - Fora do Estado)';




/*------ SYSDBA 04/03/2020 23:49:54 --------*/

CREATE OR ALTER VIEW VW_CONDICAOPAGTO(
  COND_COD,
  COND_DESCRICAO,
  COND_PRAZO,
  COND_QTDE_PARCELAS,
  COND_PRAZO_01,
  COND_PRAZO_02,
  COND_PRAZO_03,
  COND_PRAZO_04,
  COND_PRAZO_05,
  COND_PRAZO_06,
  COND_PRAZO_07,
  COND_PRAZO_08,
  COND_PRAZO_09,
  COND_PRAZO_10,
  COND_PRAZO_11,
  COND_PRAZO_12,
  COND_DESCRICAO_FULL,
  COND_DESCRICAO_PDV,
  COND_PDV,
  ATIVA)
AS
Select
    c.Cond_cod
  , c.Cond_descricao
  , c.Cond_prazo
  , c.Cond_qtde_parcelas
  , c.Cond_prazo_01
  , c.Cond_prazo_02
  , c.Cond_prazo_03
  , c.Cond_prazo_04
  , c.Cond_prazo_05
  , c.Cond_prazo_06
  , c.Cond_prazo_07
  , c.Cond_prazo_08
  , c.Cond_prazo_09
  , c.Cond_prazo_10
  , c.Cond_prazo_11
  , c.Cond_prazo_12
  , c.Cond_descricao || ' [' ||
      case when c.Cond_prazo_01 is not Null then right('00' || c.Cond_prazo_01, 2) else '' end ||
      case when c.Cond_prazo_02 is not Null then ', ' || c.Cond_prazo_02 else '' end ||
      case when c.Cond_prazo_03 is not Null then ', ' || c.Cond_prazo_03 else '' end ||
      case when c.Cond_prazo_04 is not Null then ', ' || c.Cond_prazo_04 else '' end ||
      case when c.Cond_prazo_05 is not Null then ', ' || c.Cond_prazo_05 else '' end ||
      case when c.Cond_prazo_06 is not Null then ', ' || c.Cond_prazo_06 else '' end ||
      case when c.Cond_prazo_07 is not Null then ', ' || c.Cond_prazo_07 else '' end ||
      case when c.Cond_prazo_08 is not Null then ', ' || c.Cond_prazo_08 else '' end ||
      case when c.Cond_prazo_09 is not Null then ', ' || c.Cond_prazo_09 else '' end ||
      case when c.Cond_prazo_10 is not Null then ', ' || c.Cond_prazo_10 else '' end ||
      case when c.Cond_prazo_11 is not Null then ', ' || c.Cond_prazo_11 else '' end ||
      case when c.Cond_prazo_12 is not Null then ', ' || c.Cond_prazo_12 else '' end || ']'
    as Cond_descricao_full
  , Case when c.Cond_prazo = 0
      then '* A VISTA'
      else coalesce(c.Cond_qtde_parcelas, 1) || 'x'
    end as Cond_descricao_PDV
  , coalesce(c.Cond_pdv, 0)
  , c.ativa
from TBCONDICAOPAGTO c;



/*------ 04/03/2020 23:52:47 --------*/

CREATE DOMAIN DMN_TIPO_2 AS
  SMALLINT
  DEFAULT 0
  NOT NULL
  CHECK (value between 0 and 2);


/*------ SYSDBA 04/03/2020 23:56:07 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_RESUMIDO DMN_VCHAR_60,
    ADD CFOP_TIPO DMN_TIPO_2,
    ADD CFOP_REMESSA DMN_LOGICO DEFAULT 0,
    ADD CFOP_FATURAR_REMESSA DMN_LOGICO DEFAULT 0,
    ADD CFOP_RETORNO_INTERNO DMN_INTEGER_N,
    ADD CFOP_RETORNO_EXTERNO DMN_INTEGER_N,
    ADD CFOP_GERAR_TITULO DMN_LOGICO DEFAULT 1,
    ADD CFOP_GERAR_DUPLICATA DMN_LOGICO DEFAULT 1,
    ADD CFOP_ALTERA_ESTOQUE_PRODUTO DMN_LOGICO DEFAULT 1;

alter table TBCFOP
alter CFOP_COD position 1;

alter table TBCFOP
alter CFOP_DESCRICAO position 2;

alter table TBCFOP
alter CFOP_RESUMIDO position 3;

alter table TBCFOP
alter CFOP_ESPECIFICACAO position 4;

alter table TBCFOP
alter CFOP_INFORMACAO_FISCO position 5;

alter table TBCFOP
alter CFOP_TIPO position 6;

alter table TBCFOP
alter CFOP_DEVOLUCAO position 7;

alter table TBCFOP
alter CFOP_ALTERA_CUSTO_PRODUTO position 8;

alter table TBCFOP
alter CFOP_CST_PADRAO_ENTRADA position 9;

alter table TBCFOP
alter CFOP_CST_PADRAO_SAIDA position 10;

alter table TBCFOP
alter CFOP_REMESSA position 11;

alter table TBCFOP
alter CFOP_FATURAR_REMESSA position 12;

alter table TBCFOP
alter CFOP_RETORNO_INTERNO position 13;

alter table TBCFOP
alter CFOP_RETORNO_EXTERNO position 14;

alter table TBCFOP
alter CFOP_GERAR_TITULO position 15;

alter table TBCFOP
alter CFOP_GERAR_DUPLICATA position 16;

alter table TBCFOP
alter CFOP_ALTERA_ESTOQUE_PRODUTO position 17;




/*------ SYSDBA 04/03/2020 23:56:39 --------*/

UPDATE TBCFOP
SET CFOP_TIPO = 2;




/*------ SYSDBA 04/03/2020 23:58:29 --------*/

ALTER TABLE TBVENDAS_VOLUME
    ADD CUBAGEM DMN_PERCENTUAL_4;

COMMENT ON COLUMN TBVENDAS_VOLUME.CUBAGEM IS
'Volume/Cubagem (m3) dos produtos da venda.

Observacao: Para lancamento livre ou calculado (Largura x Altura x Espessura).';

Update TBCONDICAOPAGTO x Set x.cond_pdv = 1 where x.cond_cod < 5;


