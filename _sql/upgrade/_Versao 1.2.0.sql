


/*------ SYSDBA 06/05/2016 14:48:02 --------*/

DROP TABLE TBOS_TECNICO;




/*------ SYSDBA 06/05/2016 14:48:08 --------*/

DROP TABLE TBOS_EVENTO;




/*------ SYSDBA 06/05/2016 14:48:30 --------*/

DROP TABLE TBOS;




/*------ SYSDBA 06/05/2016 14:50:10 --------*/

COMMENT ON TABLE TBVENDEDOR IS 'Tabela de Vendedores/Tecnicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        + Criacao dos campos TIPO para definir o tipo de registro, sendo que o tipo
          0 (zero) esta definido como padrao.';




/*------ SYSDBA 06/05/2016 14:53:08 --------*/

CREATE DOMAIN DMN_VCHAR_15 AS
VARCHAR(15);

/*------ 06/05/2016 14:53:53 --------*/

CREATE TABLE TBOS (
    ANO                       DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE                  DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA                   DMN_CNPJ_NN /* DMN_CNPJ_NN = VARCHAR(18) NOT NULL */,
    CLIENTE                   DMN_INTEGER_NN /* DMN_INTEGER_NN = INTEGER NOT NULL */,
    DATA_CADASTRO             DMN_DATETIME /* DMN_DATETIME = TIMESTAMP */,
    DATA_EMISSAO              DMN_DATE_NN /* DMN_DATE_NN = DATE NOT NULL */,
    DATA_PREVISAO_CONCLUSAO   DMN_DATE /* DMN_DATE = DATE */,
    USUARIO                   DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    VENDEDOR                  DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    STATUS                    DMN_STATUS /* DMN_STATUS = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 9) */,
    OBSERVACOES               DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    RELATO_SOLICITACAO        DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    DADOS_ENTREGA             DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    TOTAL_SERVICO             DMN_MONEY DEFAULT 0.0 /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_PRODUTO             DMN_MONEY DEFAULT 0.0 /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_DESCONTOS_SERVICOS  DMN_MONEY_DESCONTO DEFAULT 0.0 /* DMN_MONEY_DESCONTO = NUMERIC(15,3) DEFAULT 0 */,
    TOTAL_DESCONTOS_PRODUTOS  DMN_MONEY_DESCONTO /* DMN_MONEY_DESCONTO = NUMERIC(15,3) DEFAULT 0 */,
    TOTAL_DESCONTOS           DMN_MONEY_DESCONTO /* DMN_MONEY_DESCONTO = NUMERIC(15,3) DEFAULT 0 */,
    TOTAL_OS                  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_BRUTO               DMN_MONEY DEFAULT 0.0 /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_LIQUIDO             DMN_MONEY DEFAULT 0.0 /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_APROVADO_SERVICO    DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_APROVADO_PRODUTO    DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    DATA_APROVACAO            DMN_DATE /* DMN_DATE = DATE */,
    DATA_FINALIZACAO          DMN_DATE /* DMN_DATE = DATE */,
    DATA_FATURA               DMN_DATE /* DMN_DATE = DATE */,
    COMPETENCIA               DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    NFS_LOTE                  DMN_VCHAR_15 /* DMN_VCHAR_15 = VARCHAR(15) */,
    NFS_SERIE                 DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
    NFS_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
    NFS_DATAEMISSAO           DMN_DATE /* DMN_DATE = DATE */,
    NFS_HORAEMISSAO           DMN_TIME /* DMN_TIME = TIME */,
    NFS_CNAE                  DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */,
    NFS_NCM                   DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */,
    NFS_DESCRICAO_SERVICO     DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    NFS_ENVIADA               DMN_LOGICO /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    CAIXA_ANO                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    CAIXA_NUM                 DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    CANCEL_DATAHORA           DMN_DATETIME /* DMN_DATETIME = TIMESTAMP */,
    CANCEL_USUARIO            DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    CANCEL_MOTIVO             DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */
);

/*------ 06/05/2016 14:53:53 --------*/

ALTER TABLE TBOS ADD CONSTRAINT PK_TBOS PRIMARY KEY (ANO, CONTROLE);

/*------ 06/05/2016 14:53:53 --------*/

ALTER TABLE TBOS ADD CONSTRAINT FK_TBOS_CAIXA FOREIGN KEY (CAIXA_ANO, CAIXA_NUM) REFERENCES TBCAIXA (ANO, NUMERO);

/*------ 06/05/2016 14:53:53 --------*/

ALTER TABLE TBOS ADD CONSTRAINT FK_TBOS_CLI FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO);

/*------ 06/05/2016 14:53:53 --------*/

ALTER TABLE TBOS ADD CONSTRAINT FK_TBOS_COMP FOREIGN KEY (COMPETENCIA) REFERENCES TBCOMPETENCIA (CMP_NUM);

/*------ 06/05/2016 14:53:54 --------*/

ALTER TABLE TBOS ADD CONSTRAINT FK_TBOS_EMP FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 06/05/2016 14:53:54 --------*/

ALTER TABLE TBOS ADD CONSTRAINT FK_TBOS_VND FOREIGN KEY (VENDEDOR) REFERENCES TBVENDEDOR (COD);

/*------ 06/05/2016 14:53:54 --------*/

CREATE INDEX IDX_TBOS_CNAE ON TBOS (NFS_CNAE);

/*------ 06/05/2016 14:53:54 --------*/

CREATE INDEX IDX_TBOS_NCM ON TBOS (NFS_NCM);

/*------ 06/05/2016 14:53:54 --------*/

CREATE INDEX IDX_TBOS_NFS ON TBOS (NFS_SERIE, NFS_NUMERO);

/*------ 06/05/2016 14:53:54 --------*/

CREATE INDEX IDX_TBOS_NFS_LOTE ON TBOS (NFS_LOTE);

/*------ 06/05/2016 14:53:54 --------*/

CREATE INDEX IDX_TBOS_STATUS ON TBOS (STATUS);

/*------ 06/05/2016 14:55:25 --------*/

CREATE TABLE TBOS_EQUIPAMENTO (
    ANO             DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE        DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EQUIPAMENTO     DMN_BIGINT_N NOT NULL /* DMN_BIGINT_N = INTEGER */,
    USUARIO         DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    OBSERVACAO      DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    DEVOLVIDO       DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    TECNICO         DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    DATA_ENTREGA    DMN_DATE /* DMN_DATE = DATE */,
    HORA_ENTREGA    DMN_TIME /* DMN_TIME = TIME */,
    ESTADO_ENTREGA  DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */
);

/*------ 06/05/2016 14:55:25 --------*/

ALTER TABLE TBOS_EQUIPAMENTO ADD CONSTRAINT PK_TBOS_EQUIPAMENTO PRIMARY KEY (ANO, CONTROLE, EQUIPAMENTO);

/*------ 06/05/2016 14:55:25 --------*/

ALTER TABLE TBOS_EQUIPAMENTO ADD CONSTRAINT FK_TBOS_EQUIPAMENTO FOREIGN KEY (ANO, CONTROLE) REFERENCES TBOS (ANO, CONTROLE) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 06/05/2016 14:55:25 --------*/

ALTER TABLE TBOS_EQUIPAMENTO ADD CONSTRAINT FK_TBOS_EQUIPAMENTO_TEC FOREIGN KEY (TECNICO) REFERENCES TBVENDEDOR (COD);

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON TABLE TBOS_EQUIPAMENTO IS 
'Tabela de Equipamentos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/10/2015

Tabela responsavel por armazenar os equipamentos que pertencem a ordem de servico, equipamentos este que podem ser o
motivo da ordem de servico solicitada pelo cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.ANO IS 
'Ano';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.CONTROLE IS 
'Controle';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.EQUIPAMENTO IS 
'Codigo do Equipamento pertecente ao Cliente';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.USUARIO IS 
'Usuario / Atendente';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.OBSERVACAO IS 
'Observacoes gerais';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.DEVOLVIDO IS 
'Equipamento devolvido para o cliente:
0 - Nao
1 - Sim';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.TECNICO IS 
'Tecnico responsavel pela verificacao na entrega do equipamento

Origem: Tabela de Vendedores / Tecnicos';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.DATA_ENTREGA IS 
'Data de Entrega';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.HORA_ENTREGA IS 
'Hora de Entrega';

/*------ 06/05/2016 14:55:25 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.ESTADO_ENTREGA IS 
'Descricao do estado em que o equipamento foi entregue';

/*------ 06/05/2016 14:57:25 --------*/

CREATE GENERATOR GEN_CLIENTE_EQUIPAMENTO_ID;

/*------ 06/05/2016 14:57:25 --------*/

CREATE TABLE TBCLIENTE_EQUIPAMENTO (
    CODIGO         DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    TIPO           DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    CLIENTE        DMN_INTEGER_NN /* DMN_INTEGER_NN = INTEGER NOT NULL */,
    DESCRICAO      DMN_VCHAR_100 /* DMN_VCHAR_100 = VARCHAR(100) */,
    ESPECIFICACAO  DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    MARCA          DMN_VCHAR_50 /* DMN_VCHAR_50 = VARCHAR(50) */,
    MODELO         DMN_VCHAR_50 /* DMN_VCHAR_50 = VARCHAR(50) */,
    FABRICANTE     DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    REFERENCIA     DMN_VCHAR_20 /* DMN_VCHAR_20 = VARCHAR(20) */,
    SERIAL         DMN_VCHAR_20 /* DMN_VCHAR_20 = VARCHAR(20) */,
    USUARIO        DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */
);

/*------ 06/05/2016 14:57:25 --------*/

ALTER TABLE TBCLIENTE_EQUIPAMENTO ADD CONSTRAINT PK_TBCLIENTE_EQUIPAMENTO PRIMARY KEY (CODIGO);

/*------ 06/05/2016 14:57:25 --------*/

ALTER TABLE TBCLIENTE_EQUIPAMENTO ADD CONSTRAINT FK_TBCLIENTE_EQUIPAMENTO_CLI FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO);

/*------ 06/05/2016 14:57:25 --------*/

ALTER TABLE TBCLIENTE_EQUIPAMENTO ADD CONSTRAINT FK_TBCLIENTE_EQUIPAMENTO_FAB FOREIGN KEY (FABRICANTE) REFERENCES TBFABRICANTE (COD);

/*------ 06/05/2016 14:57:25 --------*/

CREATE INDEX IDX_TBCLIENTE_EQUIPAMENTO_MAR ON TBCLIENTE_EQUIPAMENTO (MARCA);

/*------ 06/05/2016 14:57:25 --------*/

CREATE INDEX IDX_TBCLIENTE_EQUIPAMENTO_MOD ON TBCLIENTE_EQUIPAMENTO (MODELO);

/*------ 06/05/2016 14:57:25 --------*/

CREATE INDEX IDX_TBCLIENTE_EQUIPAMENTO_REF ON TBCLIENTE_EQUIPAMENTO (REFERENCIA);

/*------ 06/05/2016 14:57:25 --------*/

CREATE INDEX IDX_TBCLIENTE_EQUIPAMENTO_SER ON TBCLIENTE_EQUIPAMENTO (SERIAL);

/*------ 06/05/2016 14:57:25 --------*/

CREATE INDEX IDX_TBCLIENTE_EQUIPAMENTO_USR ON TBCLIENTE_EQUIPAMENTO (USUARIO);

/*------ 06/05/2016 14:57:25 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_CLIENTE_EQUIPAMENTO_NOVO FOR TBCLIENTE_EQUIPAMENTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(GEN_CLIENTE_EQUIPAMENTO_ID, 1);
  new.tipo = coalesce(new.tipo, 0);
end^

/*------ 06/05/2016 14:57:25 --------*/

SET TERM ; ^

COMMENT ON TABLE TBCLIENTE_EQUIPAMENTO IS 
'Tabela de Equipamentos dos Clientes (OS)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/10/2015

Tabela responsavel por armazenar os dados referentes os equipamentos entregues pelos clientes para a realizacao de
servicos de manutencao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 14:57:25 --------*/

COMMENT ON TRIGGER TG_CLIENTE_EQUIPAMENTO_NOVO IS 
'Trigger Novo Equipamento Cliente (Ordem de Servico).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/10/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de equipamento de cliente cadastrado.';

/*------ 06/05/2016 14:57:25 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.CODIGO IS 
'Codigo';

/*------ 06/05/2016 14:57:25 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.TIPO IS 
'Tipo';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.CLIENTE IS 
'Codigo do Cliente';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.DESCRICAO IS 
'Descricao';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.ESPECIFICACAO IS 
'Especificacao';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.MARCA IS 
'Marca';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.MODELO IS 
'Modelo';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.FABRICANTE IS 
'Codigo do Fabricante';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.REFERENCIA IS 
'Referencia';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.SERIAL IS 
'Serial Number / Placa';

/*------ 06/05/2016 14:57:26 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.USUARIO IS 
'Usuario responsavel pelo cadastro e/ou manutencao do registros';

/*------ 06/05/2016 14:57:26 --------*/

GRANT ALL ON TBCLIENTE_EQUIPAMENTO TO PUBLIC;

/*------ 06/05/2016 14:58:55 --------*/

CREATE TABLE SYS_TIPO_EQUIPAMENTO (
    CODIGO     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    DESCRICAO  DMN_VCHAR_50 /* DMN_VCHAR_50 = VARCHAR(50) */,
    SIGLA      DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */
);

/*------ 06/05/2016 14:58:55 --------*/

ALTER TABLE SYS_TIPO_EQUIPAMENTO ADD CONSTRAINT UNQ_SYS_TIPO_EQUIPAMENTO UNIQUE (SIGLA);

/*------ 06/05/2016 14:58:55 --------*/

ALTER TABLE SYS_TIPO_EQUIPAMENTO ADD CONSTRAINT PK_SYS_TIPO_EQUIPAMENTO PRIMARY KEY (CODIGO);

/*------ 06/05/2016 14:58:55 --------*/

COMMENT ON TABLE SYS_TIPO_EQUIPAMENTO IS 
'Tabela de Tipos de Equipamentos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   22/10/2015

Tabela responsavel por armazenar os registros fixos de tipos de equipamentos que o controle de OS utilizara para a
classificacao dos equipamentos de clientes.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 14:58:55 --------*/

COMMENT ON COLUMN SYS_TIPO_EQUIPAMENTO.CODIGO IS 
'COdigo';

/*------ 06/05/2016 14:58:55 --------*/

COMMENT ON COLUMN SYS_TIPO_EQUIPAMENTO.DESCRICAO IS 
'Descricao';

/*------ 06/05/2016 14:58:55 --------*/

COMMENT ON COLUMN SYS_TIPO_EQUIPAMENTO.SIGLA IS 
'Sigla';

/*------ 06/05/2016 14:58:55 --------*/

GRANT ALL ON SYS_TIPO_EQUIPAMENTO TO PUBLIC;

/*------ 06/05/2016 14:58:56 --------*/

ALTER TABLE TBCLIENTE_EQUIPAMENTO ADD CONSTRAINT FK_TBCLIENTE_EQUIPAMENTO_TIP FOREIGN KEY (TIPO) REFERENCES SYS_TIPO_EQUIPAMENTO (CODIGO);

/*------ 06/05/2016 14:58:56 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_CLIENTE_EQUIPAMENTO_NOVO FOR TBCLIENTE_EQUIPAMENTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.codigo is null) then
    new.codigo = gen_id(GEN_CLIENTE_EQUIPAMENTO_ID, 1);
  new.tipo = coalesce(new.tipo, 0);
end^

/*------ 06/05/2016 14:58:56 --------*/

SET TERM ; ^

COMMENT ON TABLE TBCLIENTE_EQUIPAMENTO IS 
'Tabela de Equipamentos dos Clientes (OS)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/10/2015

Tabela responsavel por armazenar os dados referentes os equipamentos entregues pelos clientes para a realizacao de
servicos de manutencao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON TRIGGER TG_CLIENTE_EQUIPAMENTO_NOVO IS 
'Trigger Novo Equipamento Cliente (Ordem de Servico).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/10/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de equipamento de cliente cadastrado.';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.CODIGO IS 
'Codigo';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.TIPO IS 
'Tipo';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.CLIENTE IS 
'Codigo do Cliente';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.DESCRICAO IS 
'Descricao';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.ESPECIFICACAO IS 
'Especificacao';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.MARCA IS 
'Marca';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.MODELO IS 
'Modelo';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.FABRICANTE IS 
'Codigo do Fabricante';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.REFERENCIA IS 
'Referencia';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.SERIAL IS 
'Serial Number / Placa';

/*------ 06/05/2016 14:58:56 --------*/

COMMENT ON COLUMN TBCLIENTE_EQUIPAMENTO.USUARIO IS 
'Usuario responsavel pelo cadastro e/ou manutencao do registros';

/*------ 06/05/2016 14:58:56 --------*/

GRANT ALL ON TBCLIENTE_EQUIPAMENTO TO PUBLIC;


/*------ SYSDBA 06/05/2016 15:02:00 --------*/

COMMENT ON COLUMN SYS_TIPO_EQUIPAMENTO.CODIGO IS
'Codigo';



/*------ 06/05/2016 15:03:03 --------*/

ALTER TABLE TBOS_EQUIPAMENTO ADD CONSTRAINT FK_TBOS_EQUIPAMENTO_EQP FOREIGN KEY (EQUIPAMENTO) REFERENCES TBCLIENTE_EQUIPAMENTO (CODIGO);

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON TABLE TBOS_EQUIPAMENTO IS 
'Tabela de Equipamentos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/10/2015

Tabela responsavel por armazenar os equipamentos que pertencem a ordem de servico, equipamentos este que podem ser o
motivo da ordem de servico solicitada pelo cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.ANO IS 
'Ano';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.EQUIPAMENTO IS 
'Codigo do Equipamento pertecente ao Cliente';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.USUARIO IS 
'Usuario / Atendente';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.OBSERVACAO IS 
'Observacoes gerais';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.DEVOLVIDO IS 
'Equipamento devolvido para o cliente:
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.TECNICO IS 
'Tecnico responsavel pela verificacao na entrega do equipamento

Origem: Tabela de Vendedores / Tecnicos';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.DATA_ENTREGA IS 
'Data de Entrega';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.HORA_ENTREGA IS 
'Hora de Entrega';

/*------ 06/05/2016 15:03:03 --------*/

COMMENT ON COLUMN TBOS_EQUIPAMENTO.ESTADO_ENTREGA IS 
'Descricao do estado em que o equipamento foi entregue';

/*------ 06/05/2016 15:04:27 --------*/

CREATE TABLE TBOS_EVENTO (
    ANO            DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE       DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    SEQUENCIAL     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    DATA_CADASTRO  DMN_DATE_NN /* DMN_DATE_NN = DATE NOT NULL */,
    DATA_EVENTO    DMN_DATE_NN /* DMN_DATE_NN = DATE NOT NULL */,
    USUARIO        DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    TECNICO        DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    DESCRICAO      DMN_VCHAR_100 /* DMN_VCHAR_100 = VARCHAR(100) */,
    EVENTO         DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    IMPRIMIR       DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 06/05/2016 15:04:27 --------*/

ALTER TABLE TBOS_EVENTO ADD CONSTRAINT PK_TBOS_EVENTO PRIMARY KEY (ANO, CONTROLE, SEQUENCIAL);

/*------ 06/05/2016 15:04:27 --------*/

ALTER TABLE TBOS_EVENTO ADD CONSTRAINT FK_TBOS_EVENTO_OS FOREIGN KEY (ANO, CONTROLE) REFERENCES TBOS (ANO, CONTROLE) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 06/05/2016 15:04:27 --------*/

ALTER TABLE TBOS_EVENTO ADD CONSTRAINT FK_TBOS_EVENTO_TEC FOREIGN KEY (TECNICO) REFERENCES TBVENDEDOR (COD);

/*------ 06/05/2016 15:04:27 --------*/

CREATE INDEX IDX_TBOS_EVENTO_IMP ON TBOS_EVENTO (IMPRIMIR);

/*------ 06/05/2016 15:04:27 --------*/

CREATE INDEX IDX_TBOS_EVENTO_LISTA ON TBOS_EVENTO (ANO, DESCRICAO);

/*------ 06/05/2016 15:04:27 --------*/

CREATE INDEX IDX_TBOS_EVENTO_USR ON TBOS_EVENTO (USUARIO);

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON TABLE TBOS_EVENTO IS 
'Tabela de Eventos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar as descricoes dos eventos ocorridos com cada
ordem de servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.ANO IS 
'Ano';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.SEQUENCIAL IS 
'Sequencial';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.DATA_CADASTRO IS 
'Data de cadastro';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.DATA_EVENTO IS 
'Data do evento';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.USUARIO IS 
'Usuario do evento';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.TECNICO IS 
'Tecnico do evento

Origem do registro: TBVENDEDOR';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.DESCRICAO IS 
'Descricao do Evento na OS';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.EVENTO IS 
'Historico do evento na OS';

/*------ 06/05/2016 15:04:27 --------*/

COMMENT ON COLUMN TBOS_EVENTO.IMPRIMIR IS 
'Imprimir descricao do evento na OS:
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:04:27 --------*/

GRANT ALL ON TBOS_EVENTO TO PUBLIC;

/*------ 06/05/2016 15:05:27 --------*/

CREATE TABLE TBOS_FORMAPAGTO (
    ANO             DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE        DMN_INTEGER_NN NOT NULL /* DMN_INTEGER_NN = INTEGER NOT NULL */,
    FORMAPAGTO      DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONDICAOPAGTO   DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PAGTO_PRAZO     DMN_LOGICO /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    VALOR_FPAGTO    DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    VALOR_RECEBIDO  DMN_MONEY DEFAULT 0 /* DMN_MONEY = NUMERIC(15,2) */,
    PRAZO_01        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_02        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_03        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_04        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_05        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_06        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_07        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_08        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_09        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_10        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_11        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PRAZO_12        DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */
);

/*------ 06/05/2016 15:05:27 --------*/

ALTER TABLE TBOS_FORMAPAGTO ADD CONSTRAINT PK_TBOS_FORMAPAGTO PRIMARY KEY (ANO, CONTROLE, FORMAPAGTO);

/*------ 06/05/2016 15:05:27 --------*/

ALTER TABLE TBOS_FORMAPAGTO ADD CONSTRAINT FK_TBOS_FORMAPAGTO FOREIGN KEY (ANO, CONTROLE) REFERENCES TBOS (ANO, CONTROLE) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 06/05/2016 15:05:27 --------*/

ALTER TABLE TBOS_FORMAPAGTO ADD CONSTRAINT FK_TBOS_FORMAPAGTO_CPG FOREIGN KEY (CONDICAOPAGTO) REFERENCES TBCONDICAOPAGTO (COND_COD);

/*------ 06/05/2016 15:05:27 --------*/

ALTER TABLE TBOS_FORMAPAGTO ADD CONSTRAINT FK_TBOS_FORMAPAGTO_FPG FOREIGN KEY (FORMAPAGTO) REFERENCES TBFORMPAGTO (COD);

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON TABLE TBOS_FORMAPAGTO IS 
'Tabela de Formas de Pagamentos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/10/2015

Tabela responsavel por armazenar os registros referentes aos valores pagos/a pagar pela Ordem de Servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.ANO IS 
'Ano.';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.CONTROLE IS 
'Controle.';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.FORMAPAGTO IS 
'Forma de Pagamento.';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.CONDICAOPAGTO IS 
'Condicao de Pagamento.';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.PAGTO_PRAZO IS 
'Pagamento a Prazo:
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.VALOR_FPAGTO IS 
'Valor A Pagar.';

/*------ 06/05/2016 15:05:27 --------*/

COMMENT ON COLUMN TBOS_FORMAPAGTO.VALOR_RECEBIDO IS 
'Valor Recebido.

Apenas em PDV quando o TRONO se torna necessario.';

/*------ 06/05/2016 15:05:27 --------*/

GRANT ALL ON TBOS_FORMAPAGTO TO PUBLIC;

/*------ 06/05/2016 15:06:12 --------*/

CREATE TABLE TBOS_PRODUTO (
    ANO             DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE        DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    SEQ             DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    EMPRESA         DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
    CLIENTE         DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    PRODUTO         DMN_VCHAR_10_KEY /* DMN_VCHAR_10_KEY = VARCHAR(10) NOT NULL */,
    QTDE            DMN_QUANTIDADE_D3 DEFAULT 1 /* DMN_QUANTIDADE_D3 = NUMERIC(18,3) DEFAULT 0 NOT NULL */,
    UNIDADE         DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PUNIT           DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    PUNIT_PROMOCAO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    DESCONTO        DMN_PERCENTUAL_3 /* DMN_PERCENTUAL_3 = NUMERIC(15,3) DEFAULT 0 */,
    DESCONTO_VALOR  DMN_MONEY_DESCONTO_4 /* DMN_MONEY_DESCONTO_4 = NUMERIC(15,4) DEFAULT 0 */,
    PFINAL          DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_BRUTO     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_DESCONTO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_LIQUIDO   DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    APROVADO        DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 06/05/2016 15:06:12 --------*/

ALTER TABLE TBOS_PRODUTO ADD CONSTRAINT PK_TBOS_PRODUTO PRIMARY KEY (ANO, CONTROLE, SEQ);

/*------ 06/05/2016 15:06:12 --------*/

ALTER TABLE TBOS_PRODUTO ADD CONSTRAINT FK_TBOS_PRODUTO FOREIGN KEY (ANO, CONTROLE) REFERENCES TBOS (ANO, CONTROLE) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 06/05/2016 15:06:12 --------*/

ALTER TABLE TBOS_PRODUTO ADD CONSTRAINT FK_TBOS_PRODUTO_CLI FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO);

/*------ 06/05/2016 15:06:12 --------*/

ALTER TABLE TBOS_PRODUTO ADD CONSTRAINT FK_TBOS_PRODUTO_EMP FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 06/05/2016 15:06:12 --------*/

ALTER TABLE TBOS_PRODUTO ADD CONSTRAINT FK_TBOS_PRODUTO_PRD FOREIGN KEY (PRODUTO) REFERENCES TBPRODUTO (COD);

/*------ 06/05/2016 15:06:12 --------*/

ALTER TABLE TBOS_PRODUTO ADD CONSTRAINT FK_TBOS_PRODUTO_UND FOREIGN KEY (UNIDADE) REFERENCES TBUNIDADEPROD (UNP_COD);

/*------ 06/05/2016 15:06:12 --------*/

CREATE INDEX IDX_TBOS_PRODUTO_APROV ON TBOS_PRODUTO (APROVADO);

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON TABLE TBOS_PRODUTO IS 
'Tabela de Produtos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/10/2015

Tabela responsavel por armazenar os produtos associados as ordens de servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.ANO IS 
'Ano';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.SEQ IS 
'Sequencial';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.EMPRESA IS 
'Empresa';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.CLIENTE IS 
'Cliente (Codigo)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.PRODUTO IS 
'Produto (Codigo)

Origem do registro: TBPRODUTO';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.QTDE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.UNIDADE IS 
'Unidade';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.PUNIT IS 
'Valor Unitario';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.PUNIT_PROMOCAO IS 
'Valor Unitario (Promocional)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.DESCONTO IS 
'Percentual de Desconto';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.DESCONTO_VALOR IS 
'Valor de Desconto (Unitario)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.PFINAL IS 
'Valor Final Unitario (Preco Unitario - Valor de Desconto)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.TOTAL_BRUTO IS 
'Total Bruto (Quantidade * Preco Unitario)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.TOTAL_DESCONTO IS 
'Total Desconto (Quantidade * Valor Desconto)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.TOTAL_LIQUIDO IS 
'Total Liquido (Total Bruto - Total Desconto) ou (Quantidade * Preco Final)';

/*------ 06/05/2016 15:06:12 --------*/

COMMENT ON COLUMN TBOS_PRODUTO.APROVADO IS 
'Aprovado pelo cliente:
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:06:12 --------*/

GRANT ALL ON TBOS_PRODUTO TO PUBLIC;

/*------ 06/05/2016 15:06:42 --------*/

CREATE TABLE TBOS_SERVICO (
    ANO             DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE        DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    SEQ             DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    EMPRESA         DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
    CLIENTE         DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    SERVICO         DMN_VCHAR_10_KEY /* DMN_VCHAR_10_KEY = VARCHAR(10) NOT NULL */,
    QTDE            DMN_QUANTIDADE_D3 DEFAULT 1 /* DMN_QUANTIDADE_D3 = NUMERIC(18,3) DEFAULT 0 NOT NULL */,
    UNIDADE         DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
    PUNIT           DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    PUNIT_PROMOCAO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    DESCONTO        DMN_PERCENTUAL_3 /* DMN_PERCENTUAL_3 = NUMERIC(15,3) DEFAULT 0 */,
    DESCONTO_VALOR  DMN_MONEY_DESCONTO_4 /* DMN_MONEY_DESCONTO_4 = NUMERIC(15,4) DEFAULT 0 */,
    PFINAL          DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_BRUTO     DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_DESCONTO  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    TOTAL_LIQUIDO   DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    APROVADO        DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 06/05/2016 15:06:42 --------*/

ALTER TABLE TBOS_SERVICO ADD CONSTRAINT PK_TBOS_SERVICO PRIMARY KEY (ANO, CONTROLE, SEQ);

/*------ 06/05/2016 15:06:42 --------*/

ALTER TABLE TBOS_SERVICO ADD CONSTRAINT FK_TBOS_SERVICO FOREIGN KEY (ANO, CONTROLE) REFERENCES TBOS (ANO, CONTROLE) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 06/05/2016 15:06:42 --------*/

ALTER TABLE TBOS_SERVICO ADD CONSTRAINT FK_TBOS_SERVICO_CLI FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO);

/*------ 06/05/2016 15:06:42 --------*/

ALTER TABLE TBOS_SERVICO ADD CONSTRAINT FK_TBOS_SERVICO_EMP FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 06/05/2016 15:06:42 --------*/

ALTER TABLE TBOS_SERVICO ADD CONSTRAINT FK_TBOS_SERVICO_SRV FOREIGN KEY (SERVICO) REFERENCES TBPRODUTO (COD);

/*------ 06/05/2016 15:06:42 --------*/

ALTER TABLE TBOS_SERVICO ADD CONSTRAINT FK_TBOS_SERVICO_UND FOREIGN KEY (UNIDADE) REFERENCES TBUNIDADEPROD (UNP_COD);

/*------ 06/05/2016 15:06:42 --------*/

CREATE INDEX IDX_TBOS_SERVICO_APROV ON TBOS_SERVICO (APROVADO);

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON TABLE TBOS_SERVICO IS 
'Tabela de Servicos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2015

Tabela responsavel por armazenar os servicos associados as ordens de servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    15/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.ANO IS 
'Ano';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.SEQ IS 
'Sequencial';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.EMPRESA IS 
'Empresa';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.CLIENTE IS 
'Cliente (Codigo)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.SERVICO IS 
'Servico (Codigo)

Origem do registro: TBPRODUTO';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.QTDE IS 
'Quantidade

(Aceita valores decimais)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.UNIDADE IS 
'Unidade';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.PUNIT IS 
'Valor Unitario';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.PUNIT_PROMOCAO IS 
'Valor Unitario (Promocional)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.DESCONTO IS 
'Percentual de Desconto';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.DESCONTO_VALOR IS 
'Valor de Desconto (Unitario)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.PFINAL IS 
'Valor Final Unitario (Preco Unitario - Valor de Desconto)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.TOTAL_BRUTO IS 
'Total Bruto (Quantidade * Preco Unitario)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.TOTAL_DESCONTO IS 
'Total Desconto (Quantidade * Valor Desconto)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.TOTAL_LIQUIDO IS 
'Total Liquido (Total Bruto - Total Desconto) ou (Quantidade * Preco Final)';

/*------ 06/05/2016 15:06:42 --------*/

COMMENT ON COLUMN TBOS_SERVICO.APROVADO IS 
'Aprovado pelo cliente:
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:06:42 --------*/

GRANT ALL ON TBOS_SERVICO TO PUBLIC;

/*------ 06/05/2016 15:07:12 --------*/

CREATE TABLE TBOS_TECNICO (
    ANO                  DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    CONTROLE             DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    TECNICO              DMN_INTEGER_NN NOT NULL /* DMN_INTEGER_NN = INTEGER NOT NULL */,
    USUARIO              DMN_USUARIO /* DMN_USUARIO = VARCHAR(12) */,
    DATA_CADASTRO        DMN_DATE_NN /* DMN_DATE_NN = DATE NOT NULL */,
    COMISSAO_TIPO_LANC   DMN_SMALLINT_NN DEFAULT 0 /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    COMISSAO_PERCENTUAL  DMN_PERCENTUAL_3 /* DMN_PERCENTUAL_3 = NUMERIC(15,3) DEFAULT 0 */,
    COMISSAO_VALOR       DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */
);

/*------ 06/05/2016 15:07:12 --------*/

ALTER TABLE TBOS_TECNICO ADD CONSTRAINT PK_TBOS_TECNICO PRIMARY KEY (ANO, CONTROLE, TECNICO);

/*------ 06/05/2016 15:07:12 --------*/

ALTER TABLE TBOS_TECNICO ADD CONSTRAINT FK_TBOS_TECNICO_OS FOREIGN KEY (ANO, CONTROLE) REFERENCES TBOS (ANO, CONTROLE) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 06/05/2016 15:07:12 --------*/

ALTER TABLE TBOS_TECNICO ADD CONSTRAINT FK_TBOS_TECNICO_TEC FOREIGN KEY (TECNICO) REFERENCES TBVENDEDOR (COD);

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON TABLE TBOS_TECNICO IS 
'Tabela de Tecnicos das Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar os tecnicos associados as ordens de servicos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.ANO IS 
'Ano';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.TECNICO IS 
'Tecnico

Origem do registro: TBVENDEDOR';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.USUARIO IS 
'Usuario de cadastro';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.DATA_CADASTRO IS 
'Data de cadastro';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.COMISSAO_TIPO_LANC IS 
'Tipo de lancamento da comissao:
0 - Por Percentual
1 - Por Valor';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.COMISSAO_PERCENTUAL IS 
'Percentual de Comissao';

/*------ 06/05/2016 15:07:12 --------*/

COMMENT ON COLUMN TBOS_TECNICO.COMISSAO_VALOR IS 
'Valor de Comissao';

/*------ 06/05/2016 15:07:49 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_OS_COMPETENCIA FOR TBOS
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.data_emissao), 4) || right('00' || extract(month from new.data_emissao), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 06/05/2016 15:07:49 --------*/

CREATE OR ALTER TRIGGER TG_OS_VALOR_APROVADO FOR TBOS
ACTIVE BEFORE UPDATE POSITION 2
AS
  declare variable valor_aprov_servico DMN_MONEY;
  declare variable valor_aprov_produto DMN_MONEY;
begin
  /* Ao aprovar a OS */
  if ( (old.status <> new.status) and (new.status = 4) ) then
  begin 
    Select
      sum(coalesce(s.total_liquido, 0.0))
    from TBOS_SERVICO s
    where s.ano      = new.ano
      and s.controle = new.controle
      and s.aprovado = 1 -- Servico aprovado
    Into
      valor_aprov_servico;

    Select
      sum(coalesce(p.total_liquido, 0.0))
    from TBOS_PRODUTO p
    where p.ano      = new.ano
      and p.controle = new.controle
      and p.aprovado = 1 -- Material/produto aprovado
    Into
      valor_aprov_produto;

    new.total_aprovado_servico = coalesce(:valor_aprov_servico, 0.0);
    new.total_aprovado_produto = coalesce(:valor_aprov_produto, 0.0);
  end
end^

/*------ 06/05/2016 15:07:50 --------*/

SET TERM ; ^

COMMENT ON TABLE TBOS IS 
'Tabela de Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar os dados referentes as ordens de servicos aberta
pelos sistemas.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON TRIGGER TG_OS_COMPETENCIA IS 
'Trigger SET Competencia OS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Trigger responsavel por definir a competencia da OS quando esta nao fora
definida ainda.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da trigger.';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.ANO IS 
'Ano';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.EMPRESA IS 
'Empresa';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CLIENTE IS 
'Cliente';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DATA_CADASTRO IS 
'Data/hora de cadastro';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DATA_EMISSAO IS 
'Data de emissao';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DATA_PREVISAO_CONCLUSAO IS 
'Data de previsao para conclusao da OS';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.USUARIO IS 
'Usuario de cadastro';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.VENDEDOR IS 
'Vendedor / Tecnico principal';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.STATUS IS 
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avaliacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao dada pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada  (Finalizado o servico pelo tecnico)
7 - Faturada    (Faturada plo financeiro para que os Titulos A Receber possam ser gerados)
8 - NFS
9 - Cancelada';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.OBSERVACOES IS 
'Observacoes gerais';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.RELATO_SOLICITACAO IS 
'Relato / Solicitacao do cliente';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DADOS_ENTREGA IS 
'Dados gerais de realizacao/entrega do servico';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_SERVICO IS 
'Valor Total do(s) Servico(s)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_PRODUTO IS 
'Valor Total do(s) Produto(s)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_SERVICOS IS 
'Valor Total de Descontos no(s) Servico(s)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_PRODUTOS IS 
'Total Descontos (Produtos e Servicos)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS IS 
'Valor Total de Descontos no(s) Servico(s) e no(s) Produto(s)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_OS IS 
'Valor Total Líquido da OS (Principal para a Ordem de Servico)

Obs.: Sobre este valor a forma de pagamento e definida e a proposta e elaborada';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_BRUTO IS 
'Valor Total Bruto Geral';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_LIQUIDO IS 
'Valor Total Liquido Geral';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_SERVICO IS 
'Valor Total Aprovado dos Servicos (Valor Liquido)

Obs.: Sobre este valor a forma de pagamento e definida e os titulos sao gerados';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_PRODUTO IS 
'Valor Total Aprovado dos Produtos (Valor Liquido)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DATA_APROVACAO IS 
'Data da aprovacao pelo cliente';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DATA_FINALIZACAO IS 
'Data de finalizacao do(s) servico(s) pelo tecnico';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.DATA_FATURA IS 
'Data de faturamento da OS';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.COMPETENCIA IS 
'Competencia de producao (Data de Emissao)';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_LOTE IS 
'NFS-e: Identificacao do Lote de Envio';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_SERIE IS 
'NFS-e: Serie';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_NUMERO IS 
'NFS-e: Numero';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_DATAEMISSAO IS 
'NFS-e: Data de emissao';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_HORAEMISSAO IS 
'NFS-e: Hora de emissao';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_CNAE IS 
'NFS-e: CNAE principal do servico';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_NCM IS 
'NFS-e: NCM do servico principal

Origem: Tabela NCM (SYS_IBPT).';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_DESCRICAO_SERVICO IS 
'NFS-e: Descricao do servico principal';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.NFS_ENVIADA IS 
'NFS-e: Enviada
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CAIXA_ANO IS 
'Ano do Caixa de movimento';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CAIXA_NUM IS 
'Numero do Caixa de movimento.';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CANCEL_DATAHORA IS 
'Cancelamento: Data/hora';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CANCEL_USUARIO IS 
'Cancelamento: Usuario';

/*------ 06/05/2016 15:07:50 --------*/

COMMENT ON COLUMN TBOS.CANCEL_MOTIVO IS 
'Cancelamento: Motivo';

/*------ 06/05/2016 15:07:50 --------*/

GRANT ALL ON TBOS TO PUBLIC;

/*------ 06/05/2016 15:09:41 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_OS_COMPETENCIA FOR TBOS
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.data_emissao), 4) || right('00' || extract(month from new.data_emissao), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 06/05/2016 15:09:41 --------*/

CREATE OR ALTER TRIGGER TG_OS_VALOR_APROVADO FOR TBOS
ACTIVE BEFORE UPDATE POSITION 2
AS
  declare variable valor_aprov_servico DMN_MONEY;
  declare variable valor_aprov_produto DMN_MONEY;
begin
  /* Ao aprovar a OS */
  if ( (old.status <> new.status) and (new.status = 4) ) then
  begin 
    Select
      sum(coalesce(s.total_liquido, 0.0))
    from TBOS_SERVICO s
    where s.ano      = new.ano
      and s.controle = new.controle
      and s.aprovado = 1 -- Servico aprovado
    Into
      valor_aprov_servico;

    Select
      sum(coalesce(p.total_liquido, 0.0))
    from TBOS_PRODUTO p
    where p.ano      = new.ano
      and p.controle = new.controle
      and p.aprovado = 1 -- Material/produto aprovado
    Into
      valor_aprov_produto;

    new.total_aprovado_servico = coalesce(:valor_aprov_servico, 0.0);
    new.total_aprovado_produto = coalesce(:valor_aprov_produto, 0.0);
  end
end^

/*------ 06/05/2016 15:09:41 --------*/

SET TERM ; ^

COMMENT ON TABLE TBOS IS 
'Tabela de Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar os dados referentes as ordens de servicos aberta
pelos sistemas.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON TRIGGER TG_OS_COMPETENCIA IS 
'Trigger SET Competencia OS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Trigger responsavel por definir a competencia da OS quando esta nao fora
definida ainda.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da trigger.';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.ANO IS 
'Ano';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.EMPRESA IS 
'Empresa';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CLIENTE IS 
'Cliente';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DATA_CADASTRO IS 
'Data/hora de cadastro';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DATA_EMISSAO IS 
'Data de emissao';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DATA_PREVISAO_CONCLUSAO IS 
'Data de previsao para conclusao da OS';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.USUARIO IS 
'Usuario de cadastro';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.VENDEDOR IS 
'Vendedor / Tecnico principal';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.STATUS IS 
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avaliacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao dada pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada  (Finalizado o servico pelo tecnico)
7 - Faturada    (Faturada plo financeiro para que os Titulos A Receber possam ser gerados)
8 - NFS
9 - Cancelada';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.OBSERVACOES IS 
'Observacoes gerais';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.RELATO_SOLICITACAO IS 
'Relato / Solicitacao do cliente';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DADOS_ENTREGA IS 
'Dados gerais de realizacao/entrega do servico';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_SERVICO IS 
'Valor Total do(s) Servico(s)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_PRODUTO IS 
'Valor Total do(s) Produto(s)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_SERVICOS IS 
'Valor Total de Descontos no(s) Servico(s)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_PRODUTOS IS 
'Total Descontos (Produtos e Servicos)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS IS 
'Valor Total de Descontos no(s) Servico(s) e no(s) Produto(s)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_OS IS 
'Valor Total Líquido da OS (Principal para a Ordem de Servico)

Obs.: Sobre este valor a forma de pagamento e definida e a proposta e elaborada';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_BRUTO IS 
'Valor Total Bruto Geral';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_LIQUIDO IS 
'Valor Total Liquido Geral';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_SERVICO IS 
'Valor Total Aprovado dos Servicos (Valor Liquido)

Obs.: Sobre este valor a forma de pagamento e definida e os titulos sao gerados';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_PRODUTO IS 
'Valor Total Aprovado dos Produtos (Valor Liquido)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DATA_APROVACAO IS 
'Data da aprovacao pelo cliente';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DATA_FINALIZACAO IS 
'Data de finalizacao do(s) servico(s) pelo tecnico';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.DATA_FATURA IS 
'Data de faturamento da OS';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.COMPETENCIA IS 
'Competencia de producao (Data de Emissao)';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_LOTE IS 
'NFS-e: Identificacao do Lote de Envio';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_SERIE IS 
'NFS-e: Serie';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_NUMERO IS 
'NFS-e: Numero';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_DATAEMISSAO IS 
'NFS-e: Data de emissao';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_HORAEMISSAO IS 
'NFS-e: Hora de emissao';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_CNAE IS 
'NFS-e: CNAE principal do servico';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_NCM IS 
'NFS-e: NCM do servico principal

Origem: Tabela NCM (SYS_IBPT).';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_DESCRICAO_SERVICO IS 
'NFS-e: Descricao do servico principal';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.NFS_ENVIADA IS 
'NFS-e: Enviada
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CAIXA_ANO IS 
'Ano do Caixa de movimento';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CAIXA_NUM IS 
'Numero do Caixa de movimento.';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CANCEL_DATAHORA IS 
'Cancelamento: Data/hora';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CANCEL_USUARIO IS 
'Cancelamento: Usuario';

/*------ 06/05/2016 15:09:41 --------*/

COMMENT ON COLUMN TBOS.CANCEL_MOTIVO IS 
'Cancelamento: Motivo';

/*------ 06/05/2016 15:09:41 --------*/

GRANT ALL ON TBOS TO PUBLIC;

/*------ 06/05/2016 15:10:25 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_OS_COMPETENCIA FOR TBOS
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.data_emissao), 4) || right('00' || extract(month from new.data_emissao), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 06/05/2016 15:10:25 --------*/

CREATE OR ALTER TRIGGER TG_OS_VALOR_APROVADO FOR TBOS
ACTIVE BEFORE UPDATE POSITION 2
AS
  declare variable valor_aprov_servico DMN_MONEY;
  declare variable valor_aprov_produto DMN_MONEY;
begin
  /* Ao aprovar a OS */
  if ( (old.status <> new.status) and (new.status = 4) ) then
  begin 
    Select
      sum(coalesce(s.total_liquido, 0.0))
    from TBOS_SERVICO s
    where s.ano      = new.ano
      and s.controle = new.controle
      and s.aprovado = 1 -- Servico aprovado
    Into
      valor_aprov_servico;

    Select
      sum(coalesce(p.total_liquido, 0.0))
    from TBOS_PRODUTO p
    where p.ano      = new.ano
      and p.controle = new.controle
      and p.aprovado = 1 -- Material/produto aprovado
    Into
      valor_aprov_produto;

    new.total_aprovado_servico = coalesce(:valor_aprov_servico, 0.0);
    new.total_aprovado_produto = coalesce(:valor_aprov_produto, 0.0);
  end
end^

/*------ 06/05/2016 15:10:25 --------*/

SET TERM ; ^

COMMENT ON TABLE TBOS IS 
'Tabela de Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar os dados referentes as ordens de servicos aberta
pelos sistemas.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON TRIGGER TG_OS_COMPETENCIA IS 
'Trigger SET Competencia OS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Trigger responsavel por definir a competencia da OS quando esta nao fora
definida ainda.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da trigger.';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.ANO IS 
'Ano';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.EMPRESA IS 
'Empresa';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.CLIENTE IS 
'Cliente';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.DATA_CADASTRO IS 
'Data/hora de cadastro';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.DATA_EMISSAO IS 
'Data de emissao';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.DATA_PREVISAO_CONCLUSAO IS 
'Data de previsao para conclusao da OS';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.USUARIO IS 
'Usuario de cadastro';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.VENDEDOR IS 
'Vendedor / Tecnico principal';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.STATUS IS 
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avaliacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao dada pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada  (Finalizado o servico pelo tecnico)
7 - Faturada    (Faturada plo financeiro para que os Titulos A Receber possam ser gerados)
8 - NFS
9 - Cancelada';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.OBSERVACOES IS 
'Observacoes gerais';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.RELATO_SOLICITACAO IS 
'Relato / Solicitacao do cliente';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.DADOS_ENTREGA IS 
'Dados gerais de realizacao/entrega do servico';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_SERVICO IS 
'Valor Total do(s) Servico(s)';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_PRODUTO IS 
'Valor Total do(s) Produto(s)';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_SERVICOS IS 
'Valor Total de Descontos no(s) Servico(s)';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_PRODUTOS IS 
'Total Descontos (Produtos e Servicos)';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS IS 
'Valor Total de Descontos no(s) Servico(s) e no(s) Produto(s)';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_OS IS 
'Valor Total Líquido da OS (Principal para a Ordem de Servico)

Obs.: Sobre este valor a forma de pagamento e definida e a proposta e elaborada';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_BRUTO IS 
'Valor Total Bruto Geral';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_LIQUIDO IS 
'Valor Total Liquido Geral';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_SERVICO IS 
'Valor Total Aprovado dos Servicos (Valor Liquido)

Obs.: Sobre este valor a forma de pagamento e definida e os titulos sao gerados';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_PRODUTO IS 
'Valor Total Aprovado dos Produtos (Valor Liquido)';

/*------ 06/05/2016 15:10:25 --------*/

COMMENT ON COLUMN TBOS.DATA_APROVACAO IS 
'Data da aprovacao pelo cliente';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.DATA_FINALIZACAO IS 
'Data de finalizacao do(s) servico(s) pelo tecnico';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.DATA_FATURA IS 
'Data de faturamento da OS';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.COMPETENCIA IS 
'Competencia de producao (Data de Emissao)';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_LOTE IS 
'NFS-e: Identificacao do Lote de Envio';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_SERIE IS 
'NFS-e: Serie';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_NUMERO IS 
'NFS-e: Numero';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_DATAEMISSAO IS 
'NFS-e: Data de emissao';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_HORAEMISSAO IS 
'NFS-e: Hora de emissao';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_CNAE IS 
'NFS-e: CNAE principal do servico';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_NCM IS 
'NFS-e: NCM do servico principal

Origem: Tabela NCM (SYS_IBPT).';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_DESCRICAO_SERVICO IS 
'NFS-e: Descricao do servico principal';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.NFS_ENVIADA IS 
'NFS-e: Enviada
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.CAIXA_ANO IS 
'Ano do Caixa de movimento';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.CAIXA_NUM IS 
'Numero do Caixa de movimento.';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.CANCEL_DATAHORA IS 
'Cancelamento: Data/hora';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.CANCEL_USUARIO IS 
'Cancelamento: Usuario';

/*------ 06/05/2016 15:10:26 --------*/

COMMENT ON COLUMN TBOS.CANCEL_MOTIVO IS 
'Cancelamento: Motivo';

/*------ 06/05/2016 15:10:26 --------*/

GRANT ALL ON TBOS TO PUBLIC;

/*------ 06/05/2016 15:11:43 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_OS_COMPETENCIA FOR TBOS
ACTIVE BEFORE INSERT OR UPDATE POSITION 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.data_emissao), 4) || right('00' || extract(month from new.data_emissao), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

/*------ 06/05/2016 15:11:43 --------*/

CREATE OR ALTER TRIGGER TG_OS_NOVA FOR TBOS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  new.status        =  coalesce(new.status, 0);
  new.data_cadastro = coalesce(new.data_cadastro, current_timestamp);
  new.data_emissao  = coalesce(new.data_emissao, cast(new.data_cadastro as date), current_date);

  if ( coalesce(new.ano, 0) <= 0 ) then
    new.ano = extract(year from new.data_emissao);

  if ( coalesce(new.controle, 0) <= 0 ) then
    if (new.ano = 2015) then
      new.controle = GEN_ID(GEN_OS_2015, 1);
    else
    if (new.ano = 2016) then
      new.controle = GEN_ID(GEN_OS_2016, 1);
    else
    if (new.ano = 2017) then
      new.controle = GEN_ID(GEN_OS_2017, 1);
    else
    if (new.ano = 2018) then
      new.controle = GEN_ID(GEN_OS_2018, 1);
    else
    if (new.ano = 2019) then
      new.controle = GEN_ID(GEN_OS_2019, 1);
    else
    if (new.ano = 2020) then
      new.controle = GEN_ID(GEN_OS_2020, 1);
end^

/*------ 06/05/2016 15:11:43 --------*/

CREATE OR ALTER TRIGGER TG_OS_VALOR_APROVADO FOR TBOS
ACTIVE BEFORE UPDATE POSITION 2
AS
  declare variable valor_aprov_servico DMN_MONEY;
  declare variable valor_aprov_produto DMN_MONEY;
begin
  /* Ao aprovar a OS */
  if ( (old.status <> new.status) and (new.status = 4) ) then
  begin 
    Select
      sum(coalesce(s.total_liquido, 0.0))
    from TBOS_SERVICO s
    where s.ano      = new.ano
      and s.controle = new.controle
      and s.aprovado = 1 -- Servico aprovado
    Into
      valor_aprov_servico;

    Select
      sum(coalesce(p.total_liquido, 0.0))
    from TBOS_PRODUTO p
    where p.ano      = new.ano
      and p.controle = new.controle
      and p.aprovado = 1 -- Material/produto aprovado
    Into
      valor_aprov_produto;

    new.total_aprovado_servico = coalesce(:valor_aprov_servico, 0.0);
    new.total_aprovado_produto = coalesce(:valor_aprov_produto, 0.0);
  end
end^

/*------ 06/05/2016 15:11:43 --------*/

SET TERM ; ^

COMMENT ON TABLE TBOS IS 
'Tabela de Ordens de Servicos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Tabela responsavel por armazenar os dados referentes as ordens de servicos aberta
pelos sistemas.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da tabela.';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON TRIGGER TG_OS_COMPETENCIA IS 
'Trigger SET Competencia OS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Trigger responsavel por definir a competencia da OS quando esta nao fora
definida ainda.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Documentacao da trigger.';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON TRIGGER TG_OS_NOVA IS 
'Trigger Nova OS (Ordem de Servico).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Trigger responsavel gerar o novo sequencial para cada nova ordem de servico, de
acordo com a data de emissao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        * Definicao da trigger.';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.ANO IS 
'Ano';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.CONTROLE IS 
'Controle';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.EMPRESA IS 
'Empresa';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.CLIENTE IS 
'Cliente';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DATA_CADASTRO IS 
'Data/hora de cadastro';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DATA_EMISSAO IS 
'Data de emissao';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DATA_PREVISAO_CONCLUSAO IS 
'Data de previsao para conclusao da OS';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.USUARIO IS 
'Usuario de cadastro';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.VENDEDOR IS 
'Vendedor / Tecnico principal';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.STATUS IS 
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avaliacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao dada pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada  (Finalizado o servico pelo tecnico)
7 - Faturada    (Faturada plo financeiro para que os Titulos A Receber possam ser gerados)
8 - NFS
9 - Cancelada';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.OBSERVACOES IS 
'Observacoes gerais';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.RELATO_SOLICITACAO IS 
'Relato / Solicitacao do cliente';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DADOS_ENTREGA IS 
'Dados gerais de realizacao/entrega do servico';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_SERVICO IS 
'Valor Total do(s) Servico(s)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_PRODUTO IS 
'Valor Total do(s) Produto(s)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_SERVICOS IS 
'Valor Total de Descontos no(s) Servico(s)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_PRODUTOS IS 
'Total Descontos (Produtos e Servicos)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS IS 
'Valor Total de Descontos no(s) Servico(s) e no(s) Produto(s)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_OS IS 
'Valor Total Líquido da OS (Principal para a Ordem de Servico)

Obs.: Sobre este valor a forma de pagamento e definida e a proposta e elaborada';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_BRUTO IS 
'Valor Total Bruto Geral';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_LIQUIDO IS 
'Valor Total Liquido Geral';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_SERVICO IS 
'Valor Total Aprovado dos Servicos (Valor Liquido)

Obs.: Sobre este valor a forma de pagamento e definida e os titulos sao gerados';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.TOTAL_APROVADO_PRODUTO IS 
'Valor Total Aprovado dos Produtos (Valor Liquido)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DATA_APROVACAO IS 
'Data da aprovacao pelo cliente';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DATA_FINALIZACAO IS 
'Data de finalizacao do(s) servico(s) pelo tecnico';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.DATA_FATURA IS 
'Data de faturamento da OS';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.COMPETENCIA IS 
'Competencia de producao (Data de Emissao)';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_LOTE IS 
'NFS-e: Identificacao do Lote de Envio';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_SERIE IS 
'NFS-e: Serie';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_NUMERO IS 
'NFS-e: Numero';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_DATAEMISSAO IS 
'NFS-e: Data de emissao';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_HORAEMISSAO IS 
'NFS-e: Hora de emissao';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_CNAE IS 
'NFS-e: CNAE principal do servico';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_NCM IS 
'NFS-e: NCM do servico principal

Origem: Tabela NCM (SYS_IBPT).';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_DESCRICAO_SERVICO IS 
'NFS-e: Descricao do servico principal';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.NFS_ENVIADA IS 
'NFS-e: Enviada
0 - Nao
1 - Sim';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.CAIXA_ANO IS 
'Ano do Caixa de movimento';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.CAIXA_NUM IS 
'Numero do Caixa de movimento.';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.CANCEL_DATAHORA IS 
'Cancelamento: Data/hora';

/*------ 06/05/2016 15:11:43 --------*/

COMMENT ON COLUMN TBOS.CANCEL_USUARIO IS 
'Cancelamento: Usuario';

/*------ 06/05/2016 15:11:44 --------*/

COMMENT ON COLUMN TBOS.CANCEL_MOTIVO IS 
'Cancelamento: Motivo';

/*------ 06/05/2016 15:11:44 --------*/

GRANT ALL ON TBOS TO PUBLIC;


/*------ SYSDBA 06/05/2016 15:20:20 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
    ADD OS_ANO DMN_SMALLINT_N,
    ADD OS_NUM DMN_BIGINT_N;

alter table TBCAIXA_MOVIMENTO
alter ANO position 1;

alter table TBCAIXA_MOVIMENTO
alter NUMERO position 2;

alter table TBCAIXA_MOVIMENTO
alter CAIXA_ANO position 3;

alter table TBCAIXA_MOVIMENTO
alter CAIXA_NUM position 4;

alter table TBCAIXA_MOVIMENTO
alter CONTA_CORRENTE position 5;

alter table TBCAIXA_MOVIMENTO
alter FORMA_PAGTO position 6;

alter table TBCAIXA_MOVIMENTO
alter DATAHORA position 7;

alter table TBCAIXA_MOVIMENTO
alter TIPO position 8;

alter table TBCAIXA_MOVIMENTO
alter ESTORNO position 9;

alter table TBCAIXA_MOVIMENTO
alter TIPO_RECEITA position 10;

alter table TBCAIXA_MOVIMENTO
alter TIPO_DESPESA position 11;

alter table TBCAIXA_MOVIMENTO
alter HISTORICO position 12;

alter table TBCAIXA_MOVIMENTO
alter VALOR position 13;

alter table TBCAIXA_MOVIMENTO
alter SITUACAO position 14;

alter table TBCAIXA_MOVIMENTO
alter VENDA_ANO position 15;

alter table TBCAIXA_MOVIMENTO
alter VENDA_NUM position 16;

alter table TBCAIXA_MOVIMENTO
alter OS_ANO position 17;

alter table TBCAIXA_MOVIMENTO
alter OS_NUM position 18;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE_COD position 19;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE position 20;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_ANO position 21;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_NUM position 22;

alter table TBCAIXA_MOVIMENTO
alter EMPRESA position 23;

alter table TBCAIXA_MOVIMENTO
alter FORNECEDOR position 24;

alter table TBCAIXA_MOVIMENTO
alter USUARIO position 25;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_ANO position 26;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_NUM position 27;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_ANO position 28;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_NUM position 29;




/*------ SYSDBA 06/05/2016 15:20:47 --------*/

COMMENT ON TABLE TBCAIXA_MOVIMENTO IS 'Tabela Movimento Caixa (Fluxo)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimentacao (fluxo) de caixa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/10/2015 - IMR:
        + Criacao dos campos OS_ANO e OS_NUM para sinalizar a origem do registros de movimentacao financeira no caixa.

    14/10/2014 - IMR:
        + Criacao do campo TIPO_DESPESA para armazenar o tipo de despesa do fluxo de ciaxa quando este for um movimento
          de debito (D).';



/*------ 06/05/2016 15:21:16 --------*/

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.VENDA_ANO IS 
'Origem: Ano da Venda';

/*------ 06/05/2016 15:21:17 --------*/

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.VENDA_NUM IS 
'Origem: Codigo da Venda';

/*------ 06/05/2016 15:21:17 --------*/

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.OS_ANO IS 
'Origem: Ano da OS (Ordem de Servico)';

/*------ 06/05/2016 15:21:17 --------*/

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.OS_NUM IS 
'Origem: Codigo da OS (Ordem de Servico)';

/*------ 06/05/2016 15:21:55 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_OS FOREIGN KEY (OS_ANO, OS_NUM) REFERENCES TBOS (ANO, CONTROLE);GRANT ALL ON TBOS_EQUIPAMENTO TO "PUBLIC";
GRANT ALL ON TBOS_TECNICO TO "PUBLIC";



/*------ SYSDBA 06/05/2016 15:26:30 --------*/

ALTER TABLE TBCONTREC
    ADD ANOOS DMN_SMALLINT_N,
    ADD NUMOS DMN_BIGINT_N;

alter table TBCONTREC
alter ANOLANC position 1;

alter table TBCONTREC
alter NUMLANC position 2;

alter table TBCONTREC
alter EMPRESA position 3;

alter table TBCONTREC
alter CLIENTE position 4;

alter table TBCONTREC
alter CNPJ position 5;

alter table TBCONTREC
alter FORMA_PAGTO position 6;

alter table TBCONTREC
alter TIPPAG position 7;

alter table TBCONTREC
alter HISTORIC position 8;

alter table TBCONTREC
alter NUMREC position 9;

alter table TBCONTREC
alter DTEMISS position 10;

alter table TBCONTREC
alter DTVENC position 11;

alter table TBCONTREC
alter DTREC position 12;

alter table TBCONTREC
alter DOCBAIX position 13;

alter table TBCONTREC
alter VALORREC position 14;

alter table TBCONTREC
alter VALORMULTA position 15;

alter table TBCONTREC
alter VALORRECTOT position 16;

alter table TBCONTREC
alter VALORSALDO position 17;

alter table TBCONTREC
alter NUMCONTRATO position 18;

alter table TBCONTREC
alter PARCELA position 19;

alter table TBCONTREC
alter STATUS position 20;

alter table TBCONTREC
alter CODBANCO position 21;

alter table TBCONTREC
alter BANCO_FEBRABAN position 22;

alter table TBCONTREC
alter NOSSONUMERO position 23;

alter table TBCONTREC
alter REMESSA position 24;

alter table TBCONTREC
alter PERCENTJUROS position 25;

alter table TBCONTREC
alter PERCENTMULTA position 26;

alter table TBCONTREC
alter PERCENTDESCONTO position 27;

alter table TBCONTREC
alter DATAPROCESSOBOLETO position 28;

alter table TBCONTREC
alter BAIXADO position 29;

alter table TBCONTREC
alter ENVIADO position 30;

alter table TBCONTREC
alter ANOVENDA position 31;

alter table TBCONTREC
alter NUMVENDA position 32;

alter table TBCONTREC
alter ANOOS position 33;

alter table TBCONTREC
alter NUMOS position 34;

alter table TBCONTREC
alter CODTPREC position 35;

alter table TBCONTREC
alter SITUACAO position 36;

alter table TBCONTREC
alter LOTE position 37;

alter table TBCONTREC
alter COMPETENCIA_APURACAO position 38;



/*------ 06/05/2016 15:26:54 --------*/

ALTER TABLE TBCONTREC ADD CONSTRAINT FK_TBCONTREC_OS FOREIGN KEY (ANOOS, NUMOS) REFERENCES TBOS (ANO, CONTROLE);


/*------ SYSDBA 06/05/2016 15:28:15 --------*/

ALTER TABLE TBCONTREC
    ADD ESPECIE_BOLETO DMN_VCHAR_03_NN DEFAULT 'DM';

alter table TBCONTREC
alter ANOLANC position 1;

alter table TBCONTREC
alter NUMLANC position 2;

alter table TBCONTREC
alter EMPRESA position 3;

alter table TBCONTREC
alter CLIENTE position 4;

alter table TBCONTREC
alter CNPJ position 5;

alter table TBCONTREC
alter FORMA_PAGTO position 6;

alter table TBCONTREC
alter TIPPAG position 7;

alter table TBCONTREC
alter HISTORIC position 8;

alter table TBCONTREC
alter NUMREC position 9;

alter table TBCONTREC
alter DTEMISS position 10;

alter table TBCONTREC
alter DTVENC position 11;

alter table TBCONTREC
alter DTREC position 12;

alter table TBCONTREC
alter DOCBAIX position 13;

alter table TBCONTREC
alter VALORREC position 14;

alter table TBCONTREC
alter VALORMULTA position 15;

alter table TBCONTREC
alter VALORRECTOT position 16;

alter table TBCONTREC
alter VALORSALDO position 17;

alter table TBCONTREC
alter NUMCONTRATO position 18;

alter table TBCONTREC
alter PARCELA position 19;

alter table TBCONTREC
alter STATUS position 20;

alter table TBCONTREC
alter CODBANCO position 21;

alter table TBCONTREC
alter BANCO_FEBRABAN position 22;

alter table TBCONTREC
alter NOSSONUMERO position 23;

alter table TBCONTREC
alter ESPECIE_BOLETO position 24;

alter table TBCONTREC
alter REMESSA position 25;

alter table TBCONTREC
alter PERCENTJUROS position 26;

alter table TBCONTREC
alter PERCENTMULTA position 27;

alter table TBCONTREC
alter PERCENTDESCONTO position 28;

alter table TBCONTREC
alter DATAPROCESSOBOLETO position 29;

alter table TBCONTREC
alter BAIXADO position 30;

alter table TBCONTREC
alter ENVIADO position 31;

alter table TBCONTREC
alter ANOVENDA position 32;

alter table TBCONTREC
alter NUMVENDA position 33;

alter table TBCONTREC
alter ANOOS position 34;

alter table TBCONTREC
alter NUMOS position 35;

alter table TBCONTREC
alter CODTPREC position 36;

alter table TBCONTREC
alter SITUACAO position 37;

alter table TBCONTREC
alter LOTE position 38;

alter table TBCONTREC
alter COMPETENCIA_APURACAO position 39;



/*------ 06/05/2016 15:28:45 --------*/

COMMENT ON COLUMN TBCONTREC.BANCO_FEBRABAN IS 
'Codigo de Compensacao do Banco';

/*------ 06/05/2016 15:28:45 --------*/

COMMENT ON COLUMN TBCONTREC.ESPECIE_BOLETO IS 
'Tipo Boleto:

DM - Duplicata Mercantil
DS - Duplicata de Servicos

Observacoes (Outras especificacoes de acordo com a Caixa Economica):

01 - CH  - Cheque
02 - DM  - Duplicata Mercantil
03 - DMI - Duplicata Mercantil p/ Indicacao
04 - DS  - Duplicata de Servico
05 - DSI - Duplicata de Servico p/ Indicacao
06 - DR  - Duplicata Rural
07 - LC  - Letra de Cambio
08 - NCC - Nota de Credito Comercial
09 - NCE - Nota de Credito a Exportacao
10 - NCI - Nota de Credito Industrial
11 - NCR - Nota de Credito Rural
12 - NP  - Nota Promissoria
13 - NPR - Nota Promissoria Rural
14 - TM  - Triplicata Mercantil
15 - TS  - Triplicata de Servico
16 - NS  - Nota de Seguro
17 - RC  - Recibo
18 - FAT - Fatura
19 - ND  - Nota de Debito
20 - AP  - Apolice de Seguro
21 - ME  - Mensalidade Escolar
22 - PC  - Parcela de Consorcio
23 - NF  - Nota Fiscal
24 - DD  - Documento de Divida
25 - CPR - Cedula de Produto Rural
99 - OU  - Outros';

/*------ 06/05/2016 15:29:02 --------*/

COMMENT ON COLUMN TBCONTREC.ANOVENDA IS 
'Origem do registro: Ano da Venda';

/*------ 06/05/2016 15:29:02 --------*/

COMMENT ON COLUMN TBCONTREC.NUMVENDA IS 
'Origem do registro: Codigo da Venda';

/*------ 06/05/2016 15:29:02 --------*/

COMMENT ON COLUMN TBCONTREC.ANOOS IS 
'Origem do registro: Ano da OS (Ordem de Servico)';

/*------ 06/05/2016 15:29:02 --------*/

COMMENT ON COLUMN TBCONTREC.NUMOS IS 
'Origem do registro: Codigo da OS (Ordem de Servico)';


/*------ SYSDBA 06/05/2016 15:30:43 --------*/

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
begin
  -- Montar Historico
  Select
      coalesce(o.empresa, v.Codemp, r.empresa)
    , coalesce(o.cliente, v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , Case
        when r.Anovenda is not null then 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - '
        when r.Anoos    is not null then 'OS No. '    || r.anoos    || '/' || r.numos    || ' - '
        else null
      End || c.Nome
    , r.Anovenda
    , r.Numvenda
    , r.anoos
    , r.numos
    , r.codtprec
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
    , tipo_receita;

  Historico = coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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




/*------ SYSDBA 06/05/2016 15:31:38 --------*/

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
    , tipo_receita;

  Historico = coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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




/*------ SYSDBA 06/05/2016 15:35:42 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_REC_ESTORNO (
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
declare variable ANO_OS DMN_SMALLINT_N;
declare variable NUM_OS DMN_BIGINT_N;
begin
  -- Montar Historico
  Select
      coalesce(v.Codemp, r.empresa)
    , r.cliente
    , c.cnpj
    , substring((
        'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq ||
        Case
          when r.Anovenda is not null then ', VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - '
          when r.Anoos    is not null then ', OS No. '    || r.anoos    || '/' || r.numos    || ' - '
          else null       -- NULL para que uma segunda opcao de historico seja construida
        End || c.Nome
      ) from 1 for 250)
    , r.Anovenda
    , r.Numvenda
    , r.AnoOS
    , r.NumOS
  from TBCONTREC r
    left join TBCLIENTE c on (c.codigo = r.cliente)
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
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
    , Num_os;

  Historico = coalesce(:Historico, 'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Estorno
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Os_ano
    , Os_num
    , Cliente_Cod
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
    , 'D'
    , 1
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



/*------ 06/05/2016 15:36:43 --------*/

SET TERM ^ ;

SET TERM ; ^

GRANT SELECT ON TBOS TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:36:43 --------*/

GRANT SELECT ON TBOS_FORMAPAGTO TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:36:43 --------*/

GRANT SELECT ON TBCLIENTE TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:36:43 --------*/

GRANT EXECUTE ON PROCEDURE GET_DIA_UTIL TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:36:43 --------*/

GRANT SELECT,UPDATE ON TBCONTREC TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:38:15 --------*/

SET TERM ^ ;

create or alter procedure SET_TITULO_RECEBER_OS (
    ANO_OS smallint,
    NUM_OS integer,
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    FORMA_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
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

  Anolancamento = :ano_os;

  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2020, 1);

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
    , Dtemiss
    , Dtvenc
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
    , :Emissao
    , :Vencimento
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

/*------ 06/05/2016 15:38:15 --------*/

SET TERM ; ^

GRANT SELECT,INSERT ON TBCONTREC TO PROCEDURE SET_TITULO_RECEBER_OS;

/*------ 06/05/2016 15:38:15 --------*/

GRANT SELECT ON TBFORMPAGTO TO PROCEDURE SET_TITULO_RECEBER_OS;

/*------ 06/05/2016 15:38:15 --------*/

GRANT EXECUTE ON PROCEDURE SET_TITULO_RECEBER_OS TO "PUBLIC";

/*------ 06/05/2016 15:38:15 --------*/

GRANT EXECUTE ON PROCEDURE SET_TITULO_RECEBER_OS TO SYSDBA;


/*------ SYSDBA 06/05/2016 15:40:07 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER_OS (
    ANO_OS DMN_SMALLINT_N,
    NUM_OS DMN_BIGINT_N,
    EMPRESA DMN_CNPJ,
    CLIENTE_COD integer,
    CLIENTE_CNPJ DMN_CNPJ,
    FORMA_PAGTO DMN_SMALLINT_N,
    EMISSAO DMN_DATE,
    VENCIMENTO DMN_DATE,
    VALOR_DOCUMENTO DMN_MONEY,
    PARCELA DMN_SMALLINT_N)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
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

  Anolancamento = :ano_os;

  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2020, 1);

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
    , Dtemiss
    , Dtvenc
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
    , :Emissao
    , :Vencimento
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




/*------ SYSDBA 06/05/2016 15:45:33 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER (
    ANOVENDA smallint,
    NUMVENDA integer,
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    FORMA_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
declare variable COMPETENCIA integer;
declare variable TIPO_RECEITA smallint;
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

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(Gen_contarec_num_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(Gen_contarec_num_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(Gen_contarec_num_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(Gen_contarec_num_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(Gen_contarec_num_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(Gen_contarec_num_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(Gen_contarec_num_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(Gen_contarec_num_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(Gen_contarec_num_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(Gen_contarec_num_2020, 1);

  --competencia = extract(year from :Vencimento - 30) || right('00' || extract(month from :Vencimento - 30), 2);
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




/*------ SYSDBA 06/05/2016 15:47:02 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_TITULO_RECEBER_OS (
    ANO_OS DMN_SMALLINT_N,
    NUM_OS DMN_BIGINT_N,
    EMPRESA DMN_CNPJ,
    CLIENTE_COD integer,
    CLIENTE_CNPJ DMN_CNPJ,
    FORMA_PAGTO DMN_SMALLINT_N,
    EMISSAO DMN_DATE,
    VENCIMENTO DMN_DATE,
    VALOR_DOCUMENTO DMN_MONEY,
    PARCELA DMN_SMALLINT_N)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable FORMA_PAGTO_DESC varchar(30);
declare variable COMPETENCIA integer;
declare variable TIPO_RECEITA smallint;
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

  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAREC_NUM_2020, 1);

  --competencia = extract(year from :Vencimento - 30) || right('00' || extract(month from :Vencimento - 30), 2);
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



/*------ 06/05/2016 15:51:14 --------*/

SET TERM ^ ;

create or alter procedure SET_GERAR_TITULOS_OS (
    ANO_OS smallint,
    NUM_OS integer)
returns (
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    DATA_FINALIZ_OS date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        x.empresa
      , x.cliente
      , c.cnpj
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.valor_fpagto
      , v.formapagto
      , x.data_finalizacao
    from TBOS x
      inner join TBOS_FORMAPAGTO v on (v.ano = x.ano and v.controle = x.controle)
      inner join TBCLIENTE c on (c.codigo = x.cliente)
    where x.Ano      = :ano_os
      and x.controle = :num_os
      and v.valor_fpagto > 0
    into
        empresa
      , cliente_cod
      , cliente_cnpj
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_os
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_os;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.anoos = :ano_os
        and r.numos = :num_os
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.anoos = :ano_os
          and r.numos = :num_os
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end^

/*------ 06/05/2016 15:51:14 --------*/

SET TERM ; ^

GRANT SELECT ON TBOS TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:51:14 --------*/

GRANT SELECT ON TBOS_FORMAPAGTO TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:51:14 --------*/

GRANT SELECT ON TBCLIENTE TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:51:14 --------*/

GRANT EXECUTE ON PROCEDURE GET_DIA_UTIL TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:51:14 --------*/

GRANT EXECUTE ON PROCEDURE SET_TITULO_RECEBER_OS TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:51:14 --------*/

GRANT SELECT,UPDATE ON TBCONTREC TO PROCEDURE SET_GERAR_TITULOS_OS;

/*------ 06/05/2016 15:51:14 --------*/

GRANT EXECUTE ON PROCEDURE SET_GERAR_TITULOS_OS TO "PUBLIC";

/*------ 06/05/2016 15:51:14 --------*/

GRANT EXECUTE ON PROCEDURE SET_GERAR_TITULOS_OS TO SYSDBA;


/*------ SYSDBA 06/05/2016 15:51:37 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_GERAR_TITULOS_OS (
    ANO_OS DMN_SMALLINT_N,
    NUM_OS DMN_BIGINT_N)
returns (
    EMPRESA varchar(18),
    CLIENTE_COD integer,
    CLIENTE_CNPJ varchar(18),
    PARCELAS smallint,
    VALOR_TOTAL numeric(15,2),
    PARCELA smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    FORMA_PAGTO smallint,
    DATA_FINALIZ_OS date,
    ANO_LANC smallint,
    NUM_LANC integer)
as
declare variable P01 smallint;
declare variable P02 smallint;
declare variable P03 smallint;
declare variable P04 smallint;
declare variable P05 smallint;
declare variable P06 smallint;
declare variable P07 smallint;
declare variable P08 smallint;
declare variable P09 smallint;
declare variable P10 smallint;
declare variable P11 smallint;
declare variable P12 smallint;
declare variable VALOR_TOTAL_PARCELAS numeric(15,2);
begin
  for
    Select
        x.empresa
      , x.cliente
      , c.cnpj
      , coalesce(v.Prazo_01, 0)
      , v.Prazo_02
      , v.Prazo_03
      , v.Prazo_04
      , v.Prazo_05
      , v.Prazo_06
      , v.Prazo_07
      , v.Prazo_08
      , v.Prazo_09
      , v.Prazo_10
      , v.Prazo_11
      , v.Prazo_12
      , case when coalesce(v.Prazo_01, 0) is not null then 1 else 0 end +
        case when v.Prazo_02 is not null then 1 else 0 end +
        case when v.Prazo_03 is not null then 1 else 0 end +
        case when v.Prazo_04 is not null then 1 else 0 end +
        case when v.Prazo_05 is not null then 1 else 0 end +
        case when v.Prazo_06 is not null then 1 else 0 end +
        case when v.Prazo_07 is not null then 1 else 0 end +
        case when v.Prazo_08 is not null then 1 else 0 end +
        case when v.Prazo_09 is not null then 1 else 0 end +
        case when v.Prazo_10 is not null then 1 else 0 end +
        case when v.Prazo_11 is not null then 1 else 0 end +
        case when v.Prazo_12 is not null then 1 else 0 end as parcelas
      , v.valor_fpagto
      , v.formapagto
      , x.data_finalizacao
    from TBOS x
      inner join TBOS_FORMAPAGTO v on (v.ano = x.ano and v.controle = x.controle)
      inner join TBCLIENTE c on (c.codigo = x.cliente)
    where x.Ano      = :ano_os
      and x.controle = :num_os
      and v.valor_fpagto > 0
    into
        empresa
      , cliente_cod
      , cliente_cnpj
      , p01
      , p02
      , p03
      , p04
      , p05
      , p06
      , p07
      , p08
      , p09
      , p10
      , p11
      , p12
      , parcelas
      , valor_total
      , forma_pagto
      , data_finaliz_os
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_os;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from GET_DIA_UTIL(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER_OS (
          :ano_os
        , :num_os
        , :Empresa
        , :cliente_cod
        , :cliente_cnpj
        , :Forma_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela) t
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(r.Valorrec, 0) )
      from TBCONTREC r
      where r.anoos = :ano_os
        and r.numos = :num_os
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.anoos = :ano_os
          and r.numos = :num_os
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end^

SET TERM ; ^




/*------ SYSDBA 06/05/2016 16:04:24 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFSE_EMITIR DMN_LOGICO DEFAULT 0,
    ADD NFSE_SERIE DMN_VCHAR_05,
    ADD NFSE_NUMERO DMN_BIGINT_NN DEFAULT 0,
    ADD NFSE_PERCENTUAL_PIS DMN_PERCENTUAL_3,
    ADD NFSE_PERCENTUAL_COFINS DMN_PERCENTUAL_3,
    ADD NFSE_PERCENTUAL_CSLL DMN_PERCENTUAL_3,
    ADD NFSE_PERCENTUAL_ISSQN DMN_PERCENTUAL_3;

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_PIS IS
'Percentual c/ 3 casas decimais.';

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_COFINS IS
'Percentual c/ 3 casas decimais.';

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_CSLL IS
'Percentual c/ 3 casas decimais.';

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_ISSQN IS
'Percentual c/ 3 casas decimais.';



/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_EMITIR IS 
'NFS-e: Emitir Nota Fiscal de Servico Eletronica:
0 - Nao
1 - Sim';

/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_SERIE IS 
'NFS-e: Serie';

/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_NUMERO IS 
'NFS-e: Numero da ultima nota fiscal de servico emitida';

/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_PIS IS 
'NFS-e: Percentual do PIS';

/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_COFINS IS 
'NFS-e: Percentual do COFINS';

/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_CSLL IS 
'NFS-e: Percentual do CSLL';

/*------ 06/05/2016 16:04:42 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.NFSE_PERCENTUAL_ISSQN IS 
'NFS-e: Percentual do ISSQN (Imposto Sobre Servicos de Qualquer Natureza)';


/*------ SYSDBA 06/05/2016 16:34:30 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_SERIE DMN_SMALLINT_N,
    ADD NFE_NUMERO DMN_BIGINT_N;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_SERIE IS
'NF-e: Serie da nota fiscal.';

COMMENT ON COLUMN TBCONFIGURACAO.NFE_NUMERO IS
'NF-e: Numero da ultima nota fiscal emitida.';

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
alter NFE_SERIE position 11;

alter table TBCONFIGURACAO
alter NFE_NUMERO position 12;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 13;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 14;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 15;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 16;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 17;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 18;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 19;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 20;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 21;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 22;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 23;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 24;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 25;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 26;

alter table TBCONFIGURACAO
alter USUARIO position 27;

alter table TBCONFIGURACAO
alter NFSE_EMITIR position 28;

alter table TBCONFIGURACAO
alter NFSE_SERIE position 29;

alter table TBCONFIGURACAO
alter NFSE_NUMERO position 30;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_PIS position 31;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_COFINS position 32;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_CSLL position 33;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_ISSQN position 34;




/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_EMITIR position 11;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_SERIE position 12;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_NUMERO position 13;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_EMITIR_ENTRADA position 14;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_ACEITAR_NOTA_DENEGADA position 15;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 16;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 17;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFCE_TOKEN_ID position 18;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFCE_TOKEN position 19;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 20;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 21;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 22;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 23;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 24;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 25;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column AUTORIZA_INFORMA_CLIENTE position 26;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 27;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_EMITIR position 28;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_SERIE position 29;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_NUMERO position 30;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_PIS position 31;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_COFINS position 32;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_CSLL position 33;


/*------ SYSDBA 06/05/2016 16:34:47 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_ISSQN position 34;


/*------ SYSDBA 06/05/2016 16:37:57 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFCE_EMITIR DMN_LOGICO DEFAULT 0,
    ADD NFCE_SERIE DMN_SMALLINT_N,
    ADD NFCE_NUMERO DMN_BIGINT_N;

COMMENT ON COLUMN TBCONFIGURACAO.NFCE_EMITIR IS
'NFC-e: Emitir Nota Fiscal ao Consumidor Eletronica:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBCONFIGURACAO.NFCE_SERIE IS
'NFC-e: Serie da nota fiscal do Consumidor.';

COMMENT ON COLUMN TBCONFIGURACAO.NFCE_NUMERO IS
'NFC-e: Numero da ultima nota fiscal do consumidor emitida.';

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
alter NFE_SERIE position 12;

alter table TBCONFIGURACAO
alter NFE_NUMERO position 13;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 14;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 15;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 16;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 17;

alter table TBCONFIGURACAO
alter NFCE_EMITIR position 18;

alter table TBCONFIGURACAO
alter NFCE_SERIE position 19;

alter table TBCONFIGURACAO
alter NFCE_NUMERO position 20;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 21;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 22;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 23;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 24;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 25;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 26;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 27;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 28;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 29;

alter table TBCONFIGURACAO
alter USUARIO position 30;

alter table TBCONFIGURACAO
alter NFSE_EMITIR position 31;

alter table TBCONFIGURACAO
alter NFSE_SERIE position 32;

alter table TBCONFIGURACAO
alter NFSE_NUMERO position 33;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_PIS position 34;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_COFINS position 35;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_CSLL position 36;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_ISSQN position 37;




/*------ SYSDBA 06/05/2016 16:37:58 --------*/

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_EMITIR
SET DEFAULT 0;




/*------ SYSDBA 10/05/2016 14:02:05 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_GERAR_TITULO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCFOP.CFOP_GERAR_TITULO IS
'CFOP gera Titulos A Receber ou A Pagar:
0 - Nao
1 - Sim';




/*------ SYSDBA 10/05/2016 14:16:16 --------*/

COMMENT ON TABLE TBCFOP IS 'Tabela CFOP

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar a lista de CFOPs que se pode utilizar na emissao de NF-e.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    10/05/2016 - IMR :
        + Criacao do campo CFOP_GERAR_TITULO a fim de permitir que uma nota de saida
          ou entrada possam ou nao gerar titulos a pagar ou a receber de acordo com
          a natureza de emissao do NF-e.

    25/06/2014 - IMR :
        + Criacao do campo CFOP_INFORMACAO_FISCO para armazenar o texto padrao que sera informado na NF-e quando esta
          possuir um CFOP com esta informacao.';




/*------ SYSDBA 10/05/2016 16:01:56 --------*/

COMMENT ON COLUMN TBCFOP.CFOP_GERAR_TITULO IS
'CFOP gera Titulos A Receber:
0 - Nao
1 - Sim';




/*------ SYSDBA 10/05/2016 16:02:39 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_GERAR_DUPLICATA DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCFOP.CFOP_GERAR_DUPLICATA IS
'CFOP gera Titulos A Pagar:
0 - Nao
1 - Sim';

