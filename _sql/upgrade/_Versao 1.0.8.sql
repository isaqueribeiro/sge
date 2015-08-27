


/*------ SYSDBA 11/12/2014 19:28:28 --------*/

ALTER TABLE TBEMPRESA
    ADD SERIE_NFCE DMN_SMALLINT_N,
    ADD NUMERO_NFCE DMN_INTEGER_N;

COMMENT ON COLUMN TBEMPRESA.SERIE_NFCE IS
'NFC-e : Serie da nota fiscal do Consumidor.';

COMMENT ON COLUMN TBEMPRESA.NUMERO_NFCE IS
'NFC-e : Numero da ultima nota fiscal do consumidor emitida.';

alter table TBEMPRESA
alter CODIGO position 1;

alter table TBEMPRESA
alter PESSOA_FISICA position 2;

alter table TBEMPRESA
alter CNPJ position 3;

alter table TBEMPRESA
alter RZSOC position 4;

alter table TBEMPRESA
alter NMFANT position 5;

alter table TBEMPRESA
alter IE position 6;

alter table TBEMPRESA
alter IM position 7;

alter table TBEMPRESA
alter SEGMENTO position 8;

alter table TBEMPRESA
alter CNAE position 9;

alter table TBEMPRESA
alter ENDER position 10;

alter table TBEMPRESA
alter COMPLEMENTO position 11;

alter table TBEMPRESA
alter BAIRRO position 12;

alter table TBEMPRESA
alter CEP position 13;

alter table TBEMPRESA
alter CIDADE position 14;

alter table TBEMPRESA
alter UF position 15;

alter table TBEMPRESA
alter FONE position 16;

alter table TBEMPRESA
alter FONE2 position 17;

alter table TBEMPRESA
alter LOGO position 18;

alter table TBEMPRESA
alter TLG_TIPO position 19;

alter table TBEMPRESA
alter LOG_COD position 20;

alter table TBEMPRESA
alter BAI_COD position 21;

alter table TBEMPRESA
alter CID_COD position 22;

alter table TBEMPRESA
alter EST_COD position 23;

alter table TBEMPRESA
alter NUMERO_END position 24;

alter table TBEMPRESA
alter EMAIL position 25;

alter table TBEMPRESA
alter HOME_PAGE position 26;

alter table TBEMPRESA
alter CHAVE_ACESSO_NFE position 27;

alter table TBEMPRESA
alter PAIS_ID position 28;

alter table TBEMPRESA
alter TIPO_REGIME_NFE position 29;

alter table TBEMPRESA
alter SERIE_NFE position 30;

alter table TBEMPRESA
alter NUMERO_NFE position 31;

alter table TBEMPRESA
alter SERIE_NFCE position 32;

alter table TBEMPRESA
alter NUMERO_NFCE position 33;

alter table TBEMPRESA
alter LOTE_ANO_NFE position 34;

alter table TBEMPRESA
alter LOTE_NUM_NFE position 35;

alter table TBEMPRESA
alter CARTA_CORRECAO_NFE position 36;

alter table TBEMPRESA
alter USUARIO position 37;




/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CODIGO position 1;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column PESSOA_FISICA position 2;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CNPJ position 3;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column RZSOC position 4;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NMFANT position 5;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column IE position 6;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column IM position 7;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column SEGMENTO position 8;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CNAE position 9;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column ENDER position 10;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column COMPLEMENTO position 11;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column BAIRRO position 12;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CEP position 13;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CIDADE position 14;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column UF position 15;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column FONE position 16;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column FONE2 position 17;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOGO position 18;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column TLG_TIPO position 19;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOG_COD position 20;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column BAI_COD position 21;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CID_COD position 22;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column EST_COD position 23;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NUMERO_END position 24;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column EMAIL position 25;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column HOME_PAGE position 26;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CHAVE_ACESSO_NFE position 27;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column PAIS_ID position 28;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column TIPO_REGIME_NFE position 29;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column SERIE_NFE position 30;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NUMERO_NFE position 31;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOTE_ANO_NFE position 32;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column LOTE_NUM_NFE position 33;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column CARTA_CORRECAO_NFE position 34;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column SERIE_NFCE position 35;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column NUMERO_NFCE position 36;


/*------ SYSDBA 11/12/2014 19:28:47 --------*/

alter table TBEMPRESA
alter column USUARIO position 37;


/*------ SYSDBA 11/12/2014 20:16:32 --------*/

COMMENT ON TABLE TBEMPRESA IS 'Tabela Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar o registro da empresa e demais dados necessarios e emissao de documentos fiscais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/12/2014 - IMR :
        + Criação dos campos .';




/*------ SYSDBA 11/12/2014 20:17:28 --------*/

COMMENT ON TABLE TBEMPRESA IS 'Tabela Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar o registro da empresa e demais dados necessarios e emissao de documentos fiscais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/12/2014 - IMR :
        + Criação dos campos SERIE_NFCE e NUMERO_NFCE para controle dos numeros sequenciais de emissao de NFC-e (Nota
          Fiscal do Consumidor eletronica).';




/*------ SYSDBA 12/12/2014 11:27:24 --------*/

COMMENT ON COLUMN TBNFE_ENVIADA.SERIE IS
'Serie da NF-e / NFC-e.';




/*------ SYSDBA 12/12/2014 11:27:32 --------*/

COMMENT ON COLUMN TBNFE_ENVIADA.NUMERO IS
'Numero da NF-e / NFC-e.';




/*------ SYSDBA 12/12/2014 11:27:58 --------*/

COMMENT ON COLUMN TBNFE_ENVIADA.MODELO IS
'Modelo DF:
0 - moNFe  (Nota Fiscal Eletronica)
1 - moNFCe (Nota Fiscal do Consumidor Eletronica)';




/*------ SYSDBA 12/12/2014 16:10:05 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFCE_TOKEN_ID DMN_VCHAR_250,
    ADD NFCE_TOKEN DMN_VCHAR_250;

COMMENT ON COLUMN TBCONFIGURACAO.NFCE_TOKEN_ID IS
'NFC-e: Id Token / Id CSC (Codigo de Seguranca do Contribuinte)';

COMMENT ON COLUMN TBCONFIGURACAO.NFCE_TOKEN IS
'NFC-e: Token / CSC (Codigo de Seguranca do Contribuinte)';

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
alter NFE_ACEITAR_NOTA_DENEGADA position 12;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 13;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 14;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 15;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 16;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 17;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 18;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 19;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 20;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 21;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 22;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 23;

alter table TBCONFIGURACAO
alter USUARIO position 24;

alter table TBCONFIGURACAO
alter NFE_EMITIR_NFE position 25;




/*------ SYSDBA 12/12/2014 16:29:32 --------*/

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
        + Criação dos campos NFCE_TOKEN_ID e NFCE_TOKEN parameter validar a geracao do QRCODE na emissao das NFC-e.';




/*------ SYSDBA 02/01/2015 13:27:14 --------*/

COMMENT ON DOMAIN DMN_STATUS IS 'Status:
0 - 
1 - 
2 - 
3 - 
4 - 
5 - 
6 - 
7 - 
8 - 
9 -';




/*------ SYSDBA 02/01/2015 15:08:03 --------*/

ALTER TABLE SYS_IBPT
    ADD ALIQESTADUAL_IBPT DMN_PERCENTUAL_2,
    ADD ALIQMUNICIPAL_IBPT DMN_PERCENTUAL_2;

COMMENT ON COLUMN SYS_IBPT.ALIQESTADUAL_IBPT IS
'Aliquota Estadual';

COMMENT ON COLUMN SYS_IBPT.ALIQMUNICIPAL_IBPT IS
'Aliquota Municipal';




/*------ SYSDBA 02/01/2015 15:11:43 --------*/

DROP VIEW VW_TABELA_IBPT;

CREATE VIEW VW_TABELA_IBPT(
    NCM_SH,
    Ncm_aliquota,
    NCM_ALIQUOTA_NAC,
    Ncm_aliquota_est,
    Ncm_aliquota_mun,
    NCM_ALIQUOTA_IMP)
AS
Select
    ib.ncm_ibpt as Ncm_sh
  , max( coalesce(nullif(ib.aliqmunicipal_ibpt, 0), nullif(ib.aliqestadual_ibpt, 0), nullif(ib.aliqnacional_ibpt, 0)) ) as Ncm_aliquota
  , max(ib.aliqnacional_ibpt)       as Ncm_aliquota_nac
  , max(ib.aliqestadual_ibpt)       as Ncm_aliquota_est
  , max(ib.aliqmunicipal_ibpt)      as Ncm_aliquota_mun
  , max(ib.aliqinternacional_ibpt)  as Ncm_aliquota_imp
from SYS_IBPT ib
where ib.ex_ibpt = '0'
group by
    ib.ncm_ibpt
order by
    ib.ncm_ibpt
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TABELA_IBPT TO "PUBLIC";


/*------ SYSDBA 02/01/2015 15:27:06 --------*/

/*------ SYSDBA 02/01/2015 15:44:07 --------*/

COMMENT ON TABLE SYS_IBPT IS 'Tabela IBPT

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/10/2014

Tabela responsavel por armazenar todos os registros IBPT, ou seja, todos os registros de taxas de tributacoes de
impostos de acordo como o NCM do produto/servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.';




/*------ SYSDBA 02/01/2015 15:45:00 --------*/

COMMENT ON TABLE SYS_IBPT IS 'Tabela IBPT

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/10/2014

Tabela responsavel por armazenar todos os registros IBPT, ou seja, todos os registros de taxas de tributacoes de
impostos de acordo como o NCM do produto/servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/05/2014 - IMR :
        + Criacao dos campos ALIQESTADUAL_IBPT e ALIQMUNICIPAL_IBPT para armazenar as aliquotas estaduais e municipais.';

