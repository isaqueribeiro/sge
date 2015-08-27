


/*------ SYSDBA 28/07/2015 17:24:32 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_EMITIR_ENTRADA DMN_LOGICO;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_EMITIR_ENTRADA IS
'NF-e: Emitir Nota Fiscal Eletronica para Entrada:
0 - Nao
1 - Sim';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 11;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 12;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 13;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 14;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 15;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 16;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 17;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 18;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 19;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 20;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 21;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 22;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 23;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 24;

alter table TBCONFIGURACAO
alter USUARIO position 25;

alter table TBCONFIGURACAO
alter NFE_EMITIR_NFE position 26;




/*------ SYSDBA 30/07/2015 19:34:26 --------*/

ALTER TABLE TBCONFIGURACAO DROP NFE_EMITIR_NFE;




/*------ SYSDBA 30/07/2015 19:43:17 --------*/

ALTER TABLE TBCOMPRAS
    ADD CALCULAR_TOTAIS DMN_LOGICO;

COMMENT ON COLUMN TBCOMPRAS.CALCULAR_TOTAIS IS
'Permitir que o sistema calcule automaticamente os valores totais da Entrada:
0 - Nao
1 - Sim';

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
alter LOTE_NFE_ANO position 10;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 11;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 12;

alter table TBCOMPRAS
alter NFE_ENVIADA position 13;

alter table TBCOMPRAS
alter NFE_DENEGADA position 14;

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 15;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 16;

alter table TBCOMPRAS
alter XML_NFE position 17;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 18;

alter table TBCOMPRAS
alter DTLANCAMENTO position 19;

alter table TBCOMPRAS
alter DTEMISS position 20;

alter table TBCOMPRAS
alter HREMISS position 21;

alter table TBCOMPRAS
alter DTENT position 22;

alter table TBCOMPRAS
alter NFCFOP position 23;

alter table TBCOMPRAS
alter NATUREZA position 24;

alter table TBCOMPRAS
alter STATUS position 25;

alter table TBCOMPRAS
alter CALCULAR_TOTAIS position 26;

alter table TBCOMPRAS
alter IPI position 27;

alter table TBCOMPRAS
alter ICMSBASE position 28;

alter table TBCOMPRAS
alter ICMSVALOR position 29;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 30;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 31;

alter table TBCOMPRAS
alter FRETE position 32;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 33;

alter table TBCOMPRAS
alter DESCONTO position 34;

alter table TBCOMPRAS
alter VALORSEGURO position 35;

alter table TBCOMPRAS
alter VALORTOTAL_II position 36;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 37;

alter table TBCOMPRAS
alter VALORPIS position 38;

alter table TBCOMPRAS
alter VALORCOFINS position 39;

alter table TBCOMPRAS
alter TOTALPROD position 40;

alter table TBCOMPRAS
alter TOTALNF position 41;

alter table TBCOMPRAS
alter OBS position 42;

alter table TBCOMPRAS
alter USUARIO position 43;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 44;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 45;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 46;

alter table TBCOMPRAS
alter PRAZO_01 position 47;

alter table TBCOMPRAS
alter PRAZO_02 position 48;

alter table TBCOMPRAS
alter PRAZO_03 position 49;

alter table TBCOMPRAS
alter PRAZO_04 position 50;

alter table TBCOMPRAS
alter PRAZO_05 position 51;

alter table TBCOMPRAS
alter PRAZO_06 position 52;

alter table TBCOMPRAS
alter PRAZO_07 position 53;

alter table TBCOMPRAS
alter PRAZO_08 position 54;

alter table TBCOMPRAS
alter PRAZO_09 position 55;

alter table TBCOMPRAS
alter PRAZO_10 position 56;

alter table TBCOMPRAS
alter PRAZO_11 position 57;

alter table TBCOMPRAS
alter PRAZO_12 position 58;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 59;

alter table TBCOMPRAS
alter TIPO_DESPESA position 60;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 61;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 62;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 63;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 64;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 65;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 66;

alter table TBCOMPRAS
alter DNFE_ENTRADA_ANO position 67;

alter table TBCOMPRAS
alter DNFE_ENTRADA_COD position 68;

alter table TBCOMPRAS
alter DNFE_FORMA position 69;

alter table TBCOMPRAS
alter DNFE_UF position 70;

alter table TBCOMPRAS
alter DNFE_CNPJ_CPF position 71;

alter table TBCOMPRAS
alter DNFE_IE position 72;

alter table TBCOMPRAS
alter DNFE_COMPETENCIA position 73;

alter table TBCOMPRAS
alter DNFE_SERIE position 74;

alter table TBCOMPRAS
alter DNFE_NUMERO position 75;

alter table TBCOMPRAS
alter DNFE_MODELO position 76;

alter table TBCOMPRAS
alter DNFE_CHAVE position 77;

alter table TBCOMPRAS
alter DECF_MODELO position 78;

alter table TBCOMPRAS
alter DECF_NUMERO position 79;

alter table TBCOMPRAS
alter DECF_COO position 80;




/*------ SYSDBA 30/07/2015 19:44:49 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

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




/*------ SYSDBA 30/07/2015 19:46:45 --------*/

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




/*------ SYSDBA 30/07/2015 23:24:40 --------*/

ALTER TABLE TBPRODUTO
    ADD NOME_AMIGO DMN_VCHAR_100;

COMMENT ON COLUMN TBPRODUTO.NOME_AMIGO IS
'Nome amigo do servico/produto.

Descricao de como o produto/servico sera usualmente reconhecido internamento
na empresa pelos usuarios do sistema.';

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
alter NOME_AMIGO position 8;

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
alter UNIDADE position 20;

alter table TBPRODUTO
alter ESTOQMIN position 21;

alter table TBPRODUTO
alter CODGRUPO position 22;

alter table TBPRODUTO
alter CODFABRICANTE position 23;

alter table TBPRODUTO
alter CUSTOMEDIO position 24;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 25;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 26;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 27;

alter table TBPRODUTO
alter CODEMP position 28;

alter table TBPRODUTO
alter CODSECAO position 29;

alter table TBPRODUTO
alter CODORIGEM position 30;

alter table TBPRODUTO
alter CODTRIBUTACAO position 31;

alter table TBPRODUTO
alter CST position 32;

alter table TBPRODUTO
alter CSOSN position 33;

alter table TBPRODUTO
alter CST_PIS position 34;

alter table TBPRODUTO
alter CST_COFINS position 35;

alter table TBPRODUTO
alter TABELA_IBPT position 36;

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
alter CODUNIDADE_FRACIONADA position 42;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 43;

alter table TBPRODUTO
alter ALIQUOTA position 44;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 45;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 46;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 47;

alter table TBPRODUTO
alter VALOR_IPI position 48;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 49;

alter table TBPRODUTO
alter RESERVA position 50;

alter table TBPRODUTO
alter PRODUTO_NOVO position 51;

alter table TBPRODUTO
alter COR_VEICULO position 52;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 53;

alter table TBPRODUTO
alter TIPO_VEICULO position 54;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 55;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 56;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 57;

alter table TBPRODUTO
alter CHASSI_VEICULO position 58;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 59;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 60;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 61;

alter table TBPRODUTO
alter USUARIO position 62;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 63;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 64;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 65;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 66;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 67;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 68;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 69;

alter table TBPRODUTO
alter CUST_DESP_ADM position 70;

alter table TBPRODUTO
alter CUST_COMISSAO position 71;

alter table TBPRODUTO
alter CUST_IMPOSTO position 72;

alter table TBPRODUTO
alter FI_RET_FINANC position 73;

alter table TBPRODUTO
alter FI_RET_PLANO position 74;




/*------ SYSDBA 30/07/2015 23:25:02 --------*/

DROP INDEX IDX_TBPRODUTO_DESCRICAO;

CREATE INDEX IDX_TBPRODUTO_DESCRICAO
ON TBPRODUTO (DESCRI,APRESENTACAO,DESCRI_APRESENTACAO,METAFONEMA,NOME_AMIGO);




/*------ SYSDBA 30/07/2015 23:27:35 --------*/

COMMENT ON TABLE TBPRODUTO IS 'Tabela Produtos/Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de todos os produtos e/ou servicos necessarios as movimentacoes de
entrada e saida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.

    03/11/2014 - IMR :
        + Criacao do campo METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico, muito utilizado em processos de cotacao.

    10/02/2014 - IMR :
        + Criacao dos campos CADASTRO_ATIVO e PRODUTO_IMOBILIZADO para permitir que apenas os cadastro ativos sejam
          utilizados nos processos e para designar os produtos que sao imobilizados para futuras implementacoes de
          controles patrimoniais.

    30/07/2015 - IMR :
        + Criacao do campo NOME_AMIGO para facilitar a identificacao interna do produto/servico dentro da empresa
          pelos usuarios do sistema. Esse dados e necessario por existir muitas situacoes onde o nome comercial do
          servico/produto e muito diferente do nome usualmente conhecimento pelos usuarios.';




/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODIGO position 1;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COD position 2;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column DESCRI position 3;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column APRESENTACAO position 4;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column METAFONEMA position 6;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column MODELO position 7;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column REFERENCIA position 8;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column NOME_AMIGO position 9;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ESPECIFICACAO position 10;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRECO position 11;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 12;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column SECAO position 13;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column QTDE position 14;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column FRACIONADOR position 15;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PESO_BRUTO position 16;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PESO_LIQUIDO position 17;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUBAGEM position 18;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column VENDA_FRACIONADA position 19;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column UNIDADE position 20;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ESTOQMIN position 21;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODGRUPO position 22;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODFABRICANTE position 23;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUSTOMEDIO position 24;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARCKUP position 25;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARGEM position 26;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRECO_SUGERIDO position 27;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODEMP position 28;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODSECAO position 29;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODORIGEM position 30;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODTRIBUTACAO position 31;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CST position 32;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CSOSN position 33;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CST_PIS position 34;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CST_COFINS position 35;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column TABELA_IBPT position 36;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column NCM_SH position 37;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODIGO_NVE position 38;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODCFOP position 39;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODBARRA_EAN position 40;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODUNIDADE position 41;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CODUNIDADE_FRACIONADA position 42;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 43;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA position 44;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 45;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_PIS position 46;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_COFINS position 47;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column VALOR_IPI position 48;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_REDUCAO_BC position 49;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column RESERVA position 50;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRODUTO_NOVO position 51;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COR_VEICULO position 52;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COMBUSTIVEL_VEICULO position 53;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column TIPO_VEICULO position 54;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ANO_MODELO_VEICULO position 55;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ANO_FABRICACAO_VEICULO position 56;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column RENAVAM_VEICULO position 57;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CHASSI_VEICULO position 58;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column KILOMETRAGEM_VEICULO position 59;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column SITUACAO_ATUAL_VEICULO position 60;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column SITUACAO_HISTORICO_VEICULO position 61;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column USUARIO position 62;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CADASTRO_ATIVO position 63;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column MOVIMENTA_ESTOQUE position 64;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column COMPOR_FATURAMENTO position 65;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column PRODUTO_IMOBILIZADO position 66;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column ESTOQUE_APROP_LOTE position 67;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_DESP_OFIC position 68;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_DESP_GERAIS position 69;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_DESP_ADM position 70;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_COMISSAO position 71;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column CUST_IMPOSTO position 72;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column FI_RET_FINANC position 73;


/*------ SYSDBA 07/08/2015 15:38:54 --------*/

alter table TBPRODUTO
alter column FI_RET_PLANO position 74;


/*------ SYSDBA 07/08/2015 15:39:09 --------*/

COMMENT ON COLUMN TBPRODUTO.MODELO IS
'Modelo';




/*------ SYSDBA 07/08/2015 15:39:23 --------*/

COMMENT ON COLUMN TBPRODUTO.REFERENCIA IS
'Codigo de referencia';




/*------ SYSDBA 11/08/2015 16:47:01 --------*/

CREATE INDEX IDX_TBPRODUTO_METAFONEMA
ON TBPRODUTO (METAFONEMA);

CREATE INDEX IDX_TBPRODUTO_NOMEAMIGO
ON TBPRODUTO (NOME_AMIGO);




/*------ SYSDBA 17/08/2015 16:16:05 --------*/

ALTER TABLE TBFORNECEDOR
    ADD BANCO_2 DMN_VCHAR_10,
    ADD AGENCIA_2 DMN_VCHAR_10,
    ADD CC_2 DMN_VCHAR_10,
    ADD PRACA_2 DMN_VCHAR_250,
    ADD BANCO_3 DMN_VCHAR_10,
    ADD AGENCIA_3 DMN_VCHAR_10,
    ADD CC_3 DMN_VCHAR_10,
    ADD PRACA_3 DMN_VCHAR_250;

COMMENT ON COLUMN TBFORNECEDOR.BANCO IS
'Dados Financeiros - Banco (1)';

COMMENT ON COLUMN TBFORNECEDOR.AGENCIA IS
'Dados Financeiros - Agencia (1)';

COMMENT ON COLUMN TBFORNECEDOR.CC IS
'Dados Financeiros - Conta (1)';

COMMENT ON COLUMN TBFORNECEDOR.PRACA IS
'Dados Financeiros - Endereco da Praca de Cobranca (1)';

COMMENT ON COLUMN TBFORNECEDOR.BANCO_2 IS
'Dados Financeiros - Banco (2)';

COMMENT ON COLUMN TBFORNECEDOR.AGENCIA_2 IS
'Dados Financeiros - Agencia (2)';

COMMENT ON COLUMN TBFORNECEDOR.CC_2 IS
'Dados Financeiros - Conta (2)';

COMMENT ON COLUMN TBFORNECEDOR.PRACA_2 IS
'Dados Financeiros - Endereco da Praca de Cobranca (2)';

COMMENT ON COLUMN TBFORNECEDOR.BANCO_3 IS
'Dados Financeiros - Banco (3)';

COMMENT ON COLUMN TBFORNECEDOR.AGENCIA_3 IS
'Dados Financeiros - Agencia (3)';

COMMENT ON COLUMN TBFORNECEDOR.CC_3 IS
'Dados Financeiros - Conta (3)';

COMMENT ON COLUMN TBFORNECEDOR.PRACA_3 IS
'Dados Financeiros - Endereco da Praca de Cobranca (3)';

alter table TBFORNECEDOR
alter CODFORN position 1;

alter table TBFORNECEDOR
alter TIPO position 2;

alter table TBFORNECEDOR
alter PESSOA_FISICA position 3;

alter table TBFORNECEDOR
alter NOMEFORN position 4;

alter table TBFORNECEDOR
alter NOMEFANT position 5;

alter table TBFORNECEDOR
alter CNPJ position 6;

alter table TBFORNECEDOR
alter INSCEST position 7;

alter table TBFORNECEDOR
alter INSCMUN position 8;

alter table TBFORNECEDOR
alter ENDER position 9;

alter table TBFORNECEDOR
alter COMPLEMENTO position 10;

alter table TBFORNECEDOR
alter NUMERO_END position 11;

alter table TBFORNECEDOR
alter CEP position 12;

alter table TBFORNECEDOR
alter CIDADE position 13;

alter table TBFORNECEDOR
alter UF position 14;

alter table TBFORNECEDOR
alter CONTATO position 15;

alter table TBFORNECEDOR
alter FONE position 16;

alter table TBFORNECEDOR
alter FONECEL position 17;

alter table TBFORNECEDOR
alter FONEFAX position 18;

alter table TBFORNECEDOR
alter EMAIL position 19;

alter table TBFORNECEDOR
alter SITE position 20;

alter table TBFORNECEDOR
alter TLG_TIPO position 21;

alter table TBFORNECEDOR
alter LOG_COD position 22;

alter table TBFORNECEDOR
alter BAI_COD position 23;

alter table TBFORNECEDOR
alter CID_COD position 24;

alter table TBFORNECEDOR
alter EST_COD position 25;

alter table TBFORNECEDOR
alter PAIS_ID position 26;

alter table TBFORNECEDOR
alter GRF_COD position 27;

alter table TBFORNECEDOR
alter TRANSPORTADORA position 28;

alter table TBFORNECEDOR
alter BANCO position 29;

alter table TBFORNECEDOR
alter AGENCIA position 30;

alter table TBFORNECEDOR
alter CC position 31;

alter table TBFORNECEDOR
alter PRACA position 32;

alter table TBFORNECEDOR
alter BANCO_2 position 33;

alter table TBFORNECEDOR
alter AGENCIA_2 position 34;

alter table TBFORNECEDOR
alter CC_2 position 35;

alter table TBFORNECEDOR
alter PRACA_2 position 36;

alter table TBFORNECEDOR
alter BANCO_3 position 37;

alter table TBFORNECEDOR
alter AGENCIA_3 position 38;

alter table TBFORNECEDOR
alter CC_3 position 39;

alter table TBFORNECEDOR
alter PRACA_3 position 40;

alter table TBFORNECEDOR
alter OBSERVACAO position 41;

alter table TBFORNECEDOR
alter DTCAD position 42;

alter table TBFORNECEDOR
alter ATIVO position 43;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM position 44;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM_COD position 45;

alter table TBFORNECEDOR
alter FATURAMENTO_MINIMO position 46;

alter table TBFORNECEDOR
alter FORNECEDOR_FUNCIONARIO position 47;




/*------ SYSDBA 17/08/2015 16:17:37 --------*/

ALTER TABLE TBFORNECEDOR DROP CONSTRAINT FK_TBFORNECEDOR_BANCO;

ALTER TABLE TBFORNECEDOR
ADD CONSTRAINT FK_TBFORNECEDOR_BANCO1
FOREIGN KEY (BANCO)
REFERENCES TBBANCO(COD)
USING INDEX FK_TBFORNECEDOR_BANCO;

ALTER TABLE TBFORNECEDOR
ADD CONSTRAINT FK_TBFORNECEDOR_BANCO2
FOREIGN KEY (BANCO_2)
REFERENCES TBBANCO(COD);

ALTER TABLE TBFORNECEDOR
ADD CONSTRAINT FK_TBFORNECEDOR_BANCO3
FOREIGN KEY (BANCO_3)
REFERENCES TBBANCO(COD);



/*------ 17/08/2015 16:19:27 --------*/

ALTER TABLE TBCLIENTE
    ADD BANCO_2 DMN_VCHAR_10,
    ADD AGENCIA_2 DMN_VCHAR_10,
    ADD CC_2 DMN_VCHAR_10,
    ADD PRACA_2 DMN_VCHAR_250,
    ADD BANCO_3 DMN_VCHAR_10,
    ADD AGENCIA_3 DMN_VCHAR_10,
    ADD CC_3 DMN_VCHAR_10,
    ADD PRACA_3 DMN_VCHAR_250;

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.BANCO IS
'Dados Financeiros - Banco (1)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.AGENCIA IS
'Dados Financeiros - Agencia (1)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.CC IS
'Dados Financeiros - Conta (1)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.PRACA IS
'Dados Financeiros - Endereco da Praca de Cobranca (1)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.BANCO_2 IS
'Dados Financeiros - Banco (2)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.AGENCIA_2 IS
'Dados Financeiros - Agencia (2)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.CC_2 IS
'Dados Financeiros - Conta (2)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.PRACA_2 IS
'Dados Financeiros - Endereco da Praca de Cobranca (2)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.BANCO_3 IS
'Dados Financeiros - Banco (3)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.AGENCIA_3 IS
'Dados Financeiros - Agencia (3)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.CC_3 IS
'Dados Financeiros - Conta (3)';

/*------ 17/08/2015 16:19:27 --------*/

COMMENT ON COLUMN TBCLIENTE.PRACA_3 IS
'Dados Financeiros - Endereco da Praca de Cobranca (3)';

/*------ 17/08/2015 16:19:27 --------*/

ALTER TABLE TBCLIENTE DROP CONSTRAINT FK_TBCLIENTE_BANCO;

/*------ 17/08/2015 16:19:27 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT FK_TBCLIENTE_BANCO1
FOREIGN KEY (BANCO)
REFERENCES TBBANCO(COD)
USING INDEX FK_TBCLIENTE_BANCO;

/*------ 17/08/2015 16:19:27 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT FK_TBCLIENTE_BANCO2
FOREIGN KEY (BANCO_2)
REFERENCES TBBANCO(COD);

/*------ 17/08/2015 16:19:27 --------*/

ALTER TABLE TBCLIENTE
ADD CONSTRAINT FK_TBCLIENTE_BANCO3
FOREIGN KEY (BANCO_3)
REFERENCES TBBANCO(COD);


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column CODIGO position 1;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column TIPO position 2;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column PESSOA_FISICA position 3;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column CNPJ position 4;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column NOME position 5;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column NOMEFANT position 6;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column INSCEST position 7;


/*------ SYSDBA 17/08/2015 16:20:09 --------*/

alter table TBCLIENTE
alter column INSCMUN position 8;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column ENDER position 9;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column COMPLEMENTO position 10;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BAIRRO position 11;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CEP position 12;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CIDADE position 13;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column UF position 14;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column FONE position 15;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column FONECEL position 16;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column FONECOMERC position 17;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column EMAIL position 18;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column SITE position 19;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column TLG_TIPO position 20;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column LOG_COD position 21;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BAI_COD position 22;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CID_COD position 23;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column EST_COD position 24;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column NUMERO_END position 25;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column PAIS_ID position 26;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column VALOR_LIMITE_COMPRA position 27;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BLOQUEADO position 28;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_DATA position 29;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_MOTIVO position 30;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BLOQUEADO_USUARIO position 31;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column DESBLOQUEADO_DATA position 32;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column VENDEDOR_COD position 33;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column USUARIO position 34;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column EMITIR_NFE_DEVOLUCAO position 35;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_PERCENTUAL position 36;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_FRETE position 37;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CUSTO_OPER_OUTROS position 38;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column ENTREGA_FRACIONADA_VENDA position 39;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BANCO position 40;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column AGENCIA position 41;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CC position 42;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column PRACA position 43;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BANCO_2 position 44;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column AGENCIA_2 position 45;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CC_2 position 46;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column PRACA_2 position 47;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column BANCO_3 position 48;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column AGENCIA_3 position 49;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column CC_3 position 50;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column PRACA_3 position 51;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column OBSERVACAO position 52;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column DTCAD position 53;


/*------ SYSDBA 17/08/2015 16:20:10 --------*/

alter table TBCLIENTE
alter column ATIVO position 54;


/*------ SYSDBA 17/08/2015 16:22:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.emitir_nfe_devolucao = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF/CNPJ */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cliente_origem_cod = new.codigo
    Into
      codigo_forn;

    if ( :codigo_forn is null ) then
    begin
      /* Buscar Grupo de fornecedor */
      Select first 1
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      Into
        grupo_forn;

      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , INSCMUN
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
        , SITE
        , TLG_TIPO
        , LOG_COD
        , BAI_COD
        , CID_COD
        , EST_COD
        , PAIS_ID
        , GRF_COD
        , TRANSPORTADORA
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , BANCO_2
        , AGENCIA_2
        , CC_2
        , PRACA_2
        , BANCO_3
        , AGENCIA_3
        , CC_3
        , PRACA_3
        , OBSERVACAO
        , DTCAD
        , ATIVO
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
        , new.cnpj
        , new.inscest
        , new.inscmun
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone
        , new.fonecel
        , substring(new.email from 1 for 40)
        , substring(new.site from 1 for 35)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.banco_2
        , new.agencia_2
        , new.cc_2
        , new.praca_2
        , new.banco_3
        , new.agencia_3
        , new.cc_3
        , new.praca_3
        , new.observacao
        , current_date
        , coalesce(new.ativo, 1)
        , new.cnpj
        , new.codigo
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.nomefant = coalesce(new.nomefant, new.nome)
        , f.cnpj     = new.cnpj
        , f.inscest = new.inscest
        , f.inscmun = new.inscmun
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone    = new.fone
        , f.fonecel = new.fonecel
        , f.email   = substring(new.email from 1 for 40)
        , f.site    = substring(new.site from 1 for 35)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.ativo   = coalesce(new.ativo, 1)
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.banco_2   = new.banco_2
        , f.agencia_2 = new.agencia_2
        , f.cc_2      = new.cc_2
        , f.praca_2   = new.praca_2
        , f.banco_3   = new.banco_3
        , f.agencia_3 = new.agencia_3
        , f.cc_3      = new.cc_3
        , f.praca_3   = new.praca_3
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^




/*------ SYSDBA 17/08/2015 16:24:41 --------*/

COMMENT ON TABLE TBFORNECEDOR IS 'Tabela Fornecedores

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar os dados dos fornecedores cadastrados no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/05/2015 - IMR :
        + Criacao dos campos ATIVO para controle dos cadastros ativos.

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.

    22/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar fornecedor tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL.

    17/08/2014 - IMR :
        + Criacao de novos campos referentes a dados financeiros (Banco, Agencia, Conta e Praca)
          para que o registro do fornecedor venha suportar ate 3 contas correntes diferentes.';




/*------ SYSDBA 17/08/2015 16:25:04 --------*/

COMMENT ON TABLE TBCLIENTE IS 'Tabela de Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/05/2015 - IMR :
        + Criacao dos campos ATIVO para controle dos cadastros ativos.

    29/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar clientes tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL (NOME).

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.

    17/08/2014 - IMR :
        + Criacao de novos campos referentes a dados financeiros (Banco, Agencia, Conta e Praca)
          para que o registro do cliente venha suportar ate 3 contas correntes diferentes.';




/*------ SYSDBA 17/08/2015 16:25:56 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.emitir_nfe_devolucao = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF/CNPJ */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cliente_origem_cod = new.codigo
    Into
      codigo_forn;

    if ( :codigo_forn is null ) then
    begin
      /* Buscar Grupo de fornecedor */
      Select first 1
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      Into
        grupo_forn;

      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , INSCMUN
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
        , SITE
        , TLG_TIPO
        , LOG_COD
        , BAI_COD
        , CID_COD
        , EST_COD
        , PAIS_ID
        , GRF_COD
        , TRANSPORTADORA
        , BANCO
        , AGENCIA
        , CC
        , PRACA
        , BANCO_2
        , AGENCIA_2
        , CC_2
        , PRACA_2
        , BANCO_3
        , AGENCIA_3
        , CC_3
        , PRACA_3
        , OBSERVACAO
        , DTCAD
        , ATIVO
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , new.pessoa_fisica
        , new.nome
        , coalesce(new.nomefant, new.nome)
        , new.cnpj
        , new.inscest
        , new.inscmun
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone
        , new.fonecel
        , substring(new.email from 1 for 40)
        , substring(new.site from 1 for 35)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , new.banco
        , new.agencia
        , new.cc
        , new.praca
        , new.banco_2
        , new.agencia_2
        , new.cc_2
        , new.praca_2
        , new.banco_3
        , new.agencia_3
        , new.cc_3
        , new.praca_3
        , new.observacao
        , current_date
        , coalesce(new.ativo, 1)
        , new.cnpj
        , new.codigo
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = new.pessoa_fisica
        , f.nomeforn = new.nome
        , f.nomefant = coalesce(new.nomefant, new.nome)
        , f.cnpj     = new.cnpj
        , f.inscest = new.inscest
        , f.inscmun = new.inscmun
        , f.ender   = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone    = new.fone
        , f.fonecel = new.fonecel
        , f.email   = substring(new.email from 1 for 40)
        , f.site    = substring(new.site from 1 for 35)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.ativo   = coalesce(new.ativo, 1)
        , f.banco   = new.banco
        , f.agencia = new.agencia
        , f.cc      = new.cc
        , f.praca   = new.praca
        , f.banco_2   = new.banco_2
        , f.agencia_2 = new.agencia_2
        , f.cc_2      = new.cc_2
        , f.praca_2   = new.praca_2
        , f.banco_3   = new.banco_3
        , f.agencia_3 = new.agencia_3
        , f.cc_3      = new.cc_3
        , f.praca_3   = new.praca_3
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CLIENTE_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2013

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente ao registro do clientes quando for
permitido para este gerar NF-e de devolucao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/08/2014 - IMR :
        * Insercao na rotinas de novos campos referentes a dados financeiros (Banco, Agencia, Conta e Praca)
          para que o registro do cliente/fornecedor venha suportar ate 3 contas correntes diferentes.';

