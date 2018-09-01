


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

