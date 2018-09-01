


/*------ SYSDBA 30/08/2018 20:00:30 --------*/

CREATE INDEX IDX_TBCLIENTE_FANTASIA
ON TBCLIENTE (NOMEFANT);

CREATE INDEX IDX_TBCLIENTE_RAZAO
ON TBCLIENTE (NOME);




/*------ SYSDBA 30/08/2018 20:01:17 --------*/

CREATE INDEX IDX_TBFORNECEDOR_FANTASIA
ON TBFORNECEDOR (NOMEFANT);

CREATE INDEX IDX_TBFORNECEDOR_RAZAO
ON TBFORNECEDOR (NOMEFORN);




/*------ SYSDBA 31/08/2018 13:17:14 --------*/

COMMENT ON COLUMN TBPLANO_CONTA.TIPO IS
'Tipo:
 0 - Agrupador (Sintetico)
 1 - Lancamento (Analitico)';




/*------ SYSDBA 31/08/2018 17:53:26 --------*/

ALTER TABLE TBPLANO_CONTA
    ADD EMPRESA DMN_CNPJ;

COMMENT ON COLUMN TBPLANO_CONTA.EMPRESA IS
'Empresa

Obs.: Quando este campo estiver nulo (NULL), significa que todas as empresas registradas
no sistema poderao utilizar o registro de plano de contas.';

alter table TBPLANO_CONTA
alter CODIGO position 1;

alter table TBPLANO_CONTA
alter EXERCICIO position 2;

alter table TBPLANO_CONTA
alter EMPRESA position 3;

alter table TBPLANO_CONTA
alter GRUPO position 4;

alter table TBPLANO_CONTA
alter NIVEL position 5;

alter table TBPLANO_CONTA
alter TIPO position 6;

alter table TBPLANO_CONTA
alter CODIGO_CONTABIL position 7;

alter table TBPLANO_CONTA
alter CODIGO_RESUMIDO position 8;

alter table TBPLANO_CONTA
alter DESCRICAO_RESUMIDA position 9;

alter table TBPLANO_CONTA
alter DESCRICAO_COMPLETA position 10;

alter table TBPLANO_CONTA
alter SITUACAO position 11;




/*------ SYSDBA 31/08/2018 17:56:30 --------*/

ALTER TABLE TBPLANO_CONTA
ADD CONSTRAINT FK_TBPLANO_CONTA_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);




/*------ SYSDBA 31/08/2018 17:57:02 --------*/

CREATE INDEX IDX_TBPLANO_CONTA_SITUACAO
ON TBPLANO_CONTA (SITUACAO);




/*------ SYSDBA 31/08/2018 18:08:17 --------*/

CREATE OR ALTER VIEW VW_TIPO_PLANO_CONTA(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Agrupador (Sintético)'  as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Lançamento (Analítico)' as Descricao from RDB$DATABASE
;



/*------ 01/09/2018 10:32:22 --------*/

CREATE TABLE TBTPDESPESA_PLANO (
    DESPESA     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    PLANO       DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA     DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
    SELECIONAR  DMN_LOGICO /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 01/09/2018 10:32:22 --------*/

ALTER TABLE TBTPDESPESA_PLANO ADD CONSTRAINT PK_TBTPDESPESA_PLANO PRIMARY KEY (DESPESA, PLANO);

/*------ 01/09/2018 10:32:22 --------*/

ALTER TABLE TBTPDESPESA_PLANO ADD CONSTRAINT FK_TBTPDESPESA_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 01/09/2018 10:32:22 --------*/

ALTER TABLE TBTPDESPESA_PLANO ADD CONSTRAINT FK_TBTPDESPESA_PLANO FOREIGN KEY (PLANO) REFERENCES TBPLANO_CONTA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 01/09/2018 10:32:23 --------*/

ALTER TABLE TBTPDESPESA_PLANO ADD CONSTRAINT FK_TBTPDESPESA_PLANO_DESP FOREIGN KEY (DESPESA) REFERENCES TBTPDESPESA (COD) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 01/09/2018 10:32:23 --------*/

COMMENT ON TABLE TBTPDESPESA_PLANO IS 
'Tabela de Tipos de Despesas x Plano de Contas.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/08/2018

Tabela responsavel por armazenar as associacoes entre o Tipo de Despesa e os
Planos de Contas de acordo com cada empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        * Documentacao da tabela';

/*------ 01/09/2018 10:32:23 --------*/

COMMENT ON COLUMN TBTPDESPESA_PLANO.DESPESA IS 
'Tipo de depesa';

/*------ 01/09/2018 10:32:23 --------*/

COMMENT ON COLUMN TBTPDESPESA_PLANO.PLANO IS 
'Plano de contas';

/*------ 01/09/2018 10:32:23 --------*/

COMMENT ON COLUMN TBTPDESPESA_PLANO.EMPRESA IS 
'Empresa';

/*------ 01/09/2018 10:32:23 --------*/

COMMENT ON COLUMN TBTPDESPESA_PLANO.SELECIONAR IS 
'Selecionado:
0 - Nao
1 - Sim';

/*------ 01/09/2018 10:32:23 --------*/

GRANT ALL ON TBTPDESPESA_PLANO TO PUBLIC;

/*------ 01/09/2018 10:32:55 --------*/

CREATE TABLE TBTPRECEITA_PLANO (
    RECEITA     DMN_SMALLINT_NN NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    PLANO       DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    EMPRESA     DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
    SELECIONAR  DMN_LOGICO /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 01/09/2018 10:32:55 --------*/

ALTER TABLE TBTPRECEITA_PLANO ADD CONSTRAINT PK_TBTPRECEITA_PLANO PRIMARY KEY (RECEITA, PLANO);

/*------ 01/09/2018 10:32:55 --------*/

ALTER TABLE TBTPRECEITA_PLANO ADD CONSTRAINT FK_TBTPRECEITA_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 01/09/2018 10:32:55 --------*/

ALTER TABLE TBTPRECEITA_PLANO ADD CONSTRAINT FK_TBTPRECEITA_PLANO FOREIGN KEY (PLANO) REFERENCES TBPLANO_CONTA (CODIGO) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 01/09/2018 10:32:55 --------*/

ALTER TABLE TBTPRECEITA_PLANO ADD CONSTRAINT FK_TBTPRECEITA_PLANO_REC FOREIGN KEY (RECEITA) REFERENCES TBTPRECEITA (COD) ON DELETE CASCADE ON UPDATE CASCADE;

/*------ 01/09/2018 10:32:56 --------*/

COMMENT ON TABLE TBTPRECEITA_PLANO IS 
'Tabela de Tipos de Receitas x Plano de Contas.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/08/2018

Tabela responsavel por armazenar as associacoes entre o Tipo de Receita e os
Planos de Contas de acordo com cada empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        * Documentacao da tabela';

/*------ 01/09/2018 10:32:56 --------*/

COMMENT ON COLUMN TBTPRECEITA_PLANO.RECEITA IS 
'Tipo de receita';

/*------ 01/09/2018 10:32:56 --------*/

COMMENT ON COLUMN TBTPRECEITA_PLANO.PLANO IS 
'Plano de contas';

/*------ 01/09/2018 10:32:56 --------*/

COMMENT ON COLUMN TBTPRECEITA_PLANO.EMPRESA IS 
'Empresa';

/*------ 01/09/2018 10:32:56 --------*/

COMMENT ON COLUMN TBTPRECEITA_PLANO.SELECIONAR IS 
'Selecionado:
0 - Nao
1 - Sim';

/*------ 01/09/2018 10:32:56 --------*/

GRANT ALL ON TBTPRECEITA_PLANO TO PUBLIC;


/*------ SYSDBA 01/09/2018 13:09:59 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        + Agora os Planos de Contas são cadastrador por empresa e associação entre estes com os Tipos de Receitas e Despesas levam em considerações as empresas atreladas a cada plano.

    01/12/2014 - IMR :
        + Adequacao/atualizacao da esrutura da tabela.';




/*------ SYSDBA 01/09/2018 13:10:54 --------*/

COMMENT ON TABLE TBPLANO_CONTA IS 'Tabela Plano de Contas (Contabilidade).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   09/05/2014

Tabela responsavel por armazenar o plano de contas adotado pela empresa. Informacoes estas lancadas pela Contabilidade.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        + Criacao do campo EMPRESA para que os Planos de Contas são cadastrador
          por empresa e associação entre estes com os Tipos de Receitas e Despesas
          levam em considerações as empresas atreladas a cada plano.

    01/12/2014 - IMR :
        + Adequacao/atualizacao da esrutura da tabela.';




/*------ SYSDBA 01/09/2018 13:12:36 --------*/

COMMENT ON TABLE TBTRIBUTACAO_TIPO IS 'Tabela de Tipo de Tributacao (Situacao Tributaria - ST)

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar os codigos e as descricoes CST (Codigo de
Situacao Tributaria) para ICMS normal e de empresa do Simples Nacional.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        * Agora os Planos de Contas são cadastrador por empresa e associação
          entre estes com os Tipos de Despesas levam em considerações as empresas
          atreladas a cada plano.
          Desta forma um Tipo de Despesa pode está associado a mais de um Plano
          de Contas, contanto que sejam de empresas diferentes.';




/*------ SYSDBA 01/09/2018 13:13:08 --------*/

COMMENT ON TABLE TBTRIBUTACAO_TIPO IS 'Tabela de Tipo de Tributacao (Situacao Tributaria - ST)

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar os codigos e as descricoes CST (Codigo de
Situacao Tributaria) para ICMS normal e de empresa do Simples Nacional.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        * Documentacao.';




/*------ SYSDBA 01/09/2018 13:13:28 --------*/

COMMENT ON TABLE TBTPDESPESA_PLANO IS 'Tabela de Tipos de Despesas x Plano de Contas.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/08/2018

Tabela responsavel por armazenar as associacoes entre o Tipo de Despesa e os
Planos de Contas de acordo com cada empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        * Agora os Planos de Contas são cadastrador por empresa e associação
          entre estes com os Tipos de Despesas levam em considerações as empresas
          atreladas a cada plano.
          Desta forma um Tipo de Despesa pode está associado a mais de um Plano
          de Contas, contanto que sejam de empresas diferentes.';




/*------ SYSDBA 01/09/2018 13:13:53 --------*/

COMMENT ON TABLE TBTPRECEITA_PLANO IS 'Tabela de Tipos de Receitas x Plano de Contas.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/08/2018

Tabela responsavel por armazenar as associacoes entre o Tipo de Receita e os
Planos de Contas de acordo com cada empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2018 - IMR :
        * Agora os Planos de Contas são cadastrador por empresa e associação
          entre estes com os Tipos de Receitas levam em considerações as empresas
          atreladas a cada plano.
          Desta forma um Tipo de Receita pode está associado a mais de um Plano
          de Contas, contanto que sejam de empresas diferentes.';




/*------ SYSDBA 01/09/2018 13:14:50 --------*/

ALTER TABLE TBTPDESPESA_PLANO
ADD CONSTRAINT UNQ_TBTPDESPESA_PLANO_EMPRESA
UNIQUE (DESPESA,EMPRESA);




/*------ SYSDBA 01/09/2018 13:15:17 --------*/

ALTER TABLE TBTPRECEITA_PLANO
ADD CONSTRAINT UNQ_TBTPRECEITA_PLANO_EMPRESA
UNIQUE (RECEITA,EMPRESA);

