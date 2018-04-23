


/*------ SYSDBA 23/04/2018 13:00:54 --------*/

CREATE DOMAIN DMN_TIPO_2 AS
SMALLINT
DEFAULT 0
NOT NULL
CHECK (value between 0 and 2);


/*------ SYSDBA 23/04/2018 13:01:13 --------*/

COMMENT ON DOMAIN DMN_TIPO_2 IS '0 - A Definir
1 -
2 -';




/*------ SYSDBA 23/04/2018 13:03:37 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_TIPO DMN_TIPO_2;

COMMENT ON COLUMN TBCFOP.CFOP_TIPO IS
'0 - A Definir
1 - Entrada
2 - Saida';

alter table TBCFOP
alter CFOP_COD position 1;

alter table TBCFOP
alter CFOP_DESCRICAO position 2;

alter table TBCFOP
alter CFOP_ESPECIFICACAO position 3;

alter table TBCFOP
alter CFOP_INFORMACAO_FISCO position 4;

alter table TBCFOP
alter CFOP_TIPO position 5;

alter table TBCFOP
alter CFOP_CST_PADRAO_ENTRADA position 6;

alter table TBCFOP
alter CFOP_CST_PADRAO_SAIDA position 7;

alter table TBCFOP
alter CFOP_DEVOLUCAO position 8;

alter table TBCFOP
alter CFOP_REMESSA position 9;

alter table TBCFOP
alter CFOP_RETORNO_INTERNO position 10;

alter table TBCFOP
alter CFOP_RETORNO_EXTERNO position 11;

alter table TBCFOP
alter CFOP_GERAR_TITULO position 12;

alter table TBCFOP
alter CFOP_GERAR_DUPLICATA position 13;

alter table TBCFOP
alter CFOP_ALTERA_CUSTO_PRODUTO position 14;




/*------ SYSDBA 23/04/2018 13:03:47 --------*/

UPDATE TBCFOP
SET CFOP_TIPO = 0;



/*------ SYSDBA 23/04/2018 13:22:50 --------*/

Update TBCFOP c Set c.cfop_tipo = 1 where c.cfop_cod < 4000;  -- Entrada;

/*------ SYSDBA 23/04/2018 13:22:53 --------*/

COMMIT WORK;

/*------ SYSDBA 23/04/2018 13:22:57 --------*/

Update TBCFOP c Set c.cfop_tipo = 2 where c.cfop_cod > 4000;  -- Saida;

/*------ SYSDBA 23/04/2018 13:23:00 --------*/

COMMIT WORK;