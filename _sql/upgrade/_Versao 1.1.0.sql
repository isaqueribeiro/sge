


/*------ SYSDBA 21/09/2015 16:12:32 --------*/

ALTER TABLE TBVENDEDOR
    ADD TIPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBVENDEDOR.TIPO IS
'Tipo registro:
0 - Vendedor
1 - Vendedor/Tecnico
2 - Tecnico';

alter table TBVENDEDOR
alter COD position 1;

alter table TBVENDEDOR
alter NOME position 2;

alter table TBVENDEDOR
alter CPF position 3;

alter table TBVENDEDOR
alter COMISSAO position 4;

alter table TBVENDEDOR
alter COMISSAO_VL position 5;

alter table TBVENDEDOR
alter TIPO position 6;

alter table TBVENDEDOR
alter ATIVO position 7;




/*------ SYSDBA 21/09/2015 16:16:22 --------*/

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
        + Criacao dos campos TIPO para definir o tipo de registro, sendo o o tipo
          0 (zero) esta definido como padrao.';



/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBVENDEDOR.TIPO IS
'Tipo registro:
0 - Vendedor
1 - Vendedor/Tecnico
2 - Tecnico';

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter COD position 1;

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter NOME position 2;

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter CPF position 3;

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter COMISSAO position 4;

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter COMISSAO_VL position 5;

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter TIPO position 6;

/*------ 21/09/2015 17:39:22 --------*/

alter table TBVENDEDOR
alter ATIVO position 7;

/*------ 21/09/2015 17:39:22 --------*/

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
        + Criacao dos campos TIPO para definir o tipo de registro, sendo o o tipo
          0 (zero) esta definido como padrao.';

/*------ 21/09/2015 17:39:22 --------*/

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
        + Criacao dos campos TIPO para definir o tipo de registro, sendo o o tipo
          0 (zero) esta definido como padrao.';

/*------ 21/09/2015 17:39:22 --------*/

CREATE TABLE TBOS (
    ANO DMN_SMALLINT_NN NOT NULL,
    CONTROLE DMN_BIGINT_NN NOT NULL,
    DATA_CADASTRO DMN_DATE_NN,
    DATA_EMISSAO DMN_DATE_NN,
    USUARIO DMN_USUARIO,
    STATUS DMN_STATUS);

/*------ 21/09/2015 17:39:22 --------*/

ALTER TABLE TBOS
ADD CONSTRAINT PK_TBOS
PRIMARY KEY (ANO,CONTROLE);

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS.ANO IS
'Ano';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS.CONTROLE IS
'Controle';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS.DATA_CADASTRO IS
'Data de cadastro';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS.DATA_EMISSAO IS
'Data de emissao';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS.USUARIO IS
'Usuario de cadastro';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS.STATUS IS
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avalizacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao data pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada
7 - Faturada
8 - NFS
9 - Cancelada';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON TABLE TBOS IS 'Tabela de Ordens de Servicos

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

/*------ 21/09/2015 17:39:22 --------*/

CREATE TABLE TBOS_EVENTO (
    ANO DMN_SMALLINT_NN NOT NULL,
    CONTROLE DMN_BIGINT_NN NOT NULL,
    SEQUENCIAL DMN_SMALLINT_NN NOT NULL,
    DATA_CADASTRO DMN_DATE_NN,
    DATA_EVENTO DMN_DATE_NN,
    USUARIO DMN_USUARIO,
    EVENTO DMN_TEXTO);

/*------ 21/09/2015 17:39:22 --------*/

ALTER TABLE TBOS_EVENTO
ADD CONSTRAINT PK_TBOS_EVENTO
PRIMARY KEY (ANO,CONTROLE,SEQUENCIAL);

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.ANO IS
'Ano';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.CONTROLE IS
'Controle';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.SEQUENCIAL IS
'Sequencial';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.DATA_CADASTRO IS
'Data de cadastro';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.DATA_EVENTO IS
'Data do evento';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.USUARIO IS
'Usuario do evento';

/*------ 21/09/2015 17:39:22 --------*/

COMMENT ON COLUMN TBOS_EVENTO.EVENTO IS
'Descricao do evento na OS';

/*------ 21/09/2015 17:39:22 --------*/

ALTER TABLE TBOS_EVENTO
ADD CONSTRAINT FK_TBOS_EVENTO_OS
FOREIGN KEY (ANO,CONTROLE)
REFERENCES TBOS(ANO,CONTROLE)
ON DELETE CASCADE
ON UPDATE CASCADE;

/*------ 21/09/2015 17:39:22 --------*/

CREATE SEQUENCE GEN_OS_2015;

/*------ 21/09/2015 17:39:22 --------*/

CREATE SEQUENCE GEN_OS_2016;

/*------ 21/09/2015 17:39:22 --------*/

CREATE SEQUENCE GEN_OS_2017;

/*------ 21/09/2015 17:39:22 --------*/

CREATE SEQUENCE GEN_OS_2018;

/*------ 21/09/2015 17:39:22 --------*/

CREATE SEQUENCE GEN_OS_2019;

/*------ 21/09/2015 17:39:22 --------*/

CREATE SEQUENCE GEN_OS_2020;

/*------ 21/09/2015 17:39:22 --------*/

SET TERM ^ ;

CREATE trigger tg_os_nova for tbos
active before insert position 0
AS
begin
  if ( coalesce(new.ano, 0) <= 0 ) then
    new.ano = extract(year from coalesce(new.data_emissao, new.data_cadastro));

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

  new.status =  coalesce(new.status, 0);
end^

/*------ 21/09/2015 17:39:22 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_nova for tbos
active before insert position 0
AS
begin
  if ( coalesce(new.ano, 0) <= 0 ) then
    new.ano = extract(year from coalesce(new.data_emissao, new.data_cadastro));

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

  new.status =  coalesce(new.status, 0);
end^

/*------ 21/09/2015 17:39:22 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_OS_NOVA IS 'Trigger Nova OS (Ordem de Servico).

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

/*------ 21/09/2015 17:39:22 --------*/

CREATE INDEX IDX_TBOS_STATUS
ON TBOS (STATUS);

/*------ 21/09/2015 17:39:22 --------*/

GRANT ALL ON TBOS TO "PUBLIC";

/*------ 21/09/2015 17:39:22 --------*/

GRANT ALL ON TBOS_EVENTO TO "PUBLIC";

/*------ 21/09/2015 17:39:22 --------*/

CREATE VIEW VW_STATUS_OS(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Editando'    as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Aberta'      as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Avaliacao'   as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Parecer'     as Descricao from RDB$DATABASE Union
Select 4 as Codigo , 'Aprovada'    as Descricao from RDB$DATABASE Union
Select 5 as Codigo , 'Atendimento' as Descricao from RDB$DATABASE Union
Select 6 as Codigo , 'Finalizada'  as Descricao from RDB$DATABASE Union
Select 7 as Codigo , 'Faturada'    as Descricao from RDB$DATABASE Union
Select 8 as Codigo , 'NFS'         as Descricao from RDB$DATABASE Union
Select 9 as Codigo , 'Cancelada'   as Descricao from RDB$DATABASE;

/*------ 21/09/2015 17:39:23 --------*/

GRANT ALL ON VW_STATUS_OS TO "PUBLIC";

/*------ 21/09/2015 17:39:23 --------*/

COMMENT ON COLUMN TBOS.STATUS IS
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avalizacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao data pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada
7 - Faturada
8 - NFS
9 - Cancelada';


/*------ SYSDBA 21/09/2015 17:45:34 --------*/

CREATE TABLE TBOS_TECNICO (
    ANO DMN_SMALLINT_NN NOT NULL,
    CONTROLE DMN_BIGINT_NN NOT NULL,
    TECNICO DMN_INTEGER_NN NOT NULL,
    USUARIO DMN_USUARIO,
    DATA_CADASTRO DMN_DATE_NN);

ALTER TABLE TBOS_TECNICO
ADD CONSTRAINT PK_TBOS_TECNICO
PRIMARY KEY (ANO,CONTROLE,TECNICO);

COMMENT ON COLUMN TBOS_TECNICO.ANO IS
'Ano';

COMMENT ON COLUMN TBOS_TECNICO.CONTROLE IS
'Controle';

COMMENT ON COLUMN TBOS_TECNICO.TECNICO IS
'Tecnico

Origem do registro: TBVENDEDOR';

COMMENT ON COLUMN TBOS_TECNICO.USUARIO IS
'Usuario de cadastro';

COMMENT ON COLUMN TBOS_TECNICO.DATA_CADASTRO IS
'Data de cadastro';




/*------ SYSDBA 21/09/2015 17:46:21 --------*/

COMMENT ON TABLE TBOS_TECNICO IS 'Tabela de Tecniscos das Ordens de Servicos

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




/*------ SYSDBA 21/09/2015 17:46:59 --------*/

COMMENT ON TABLE TBOS_EVENTO IS 'Tabela de Eventos das Ordens de Servicos

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




/*------ SYSDBA 21/09/2015 17:47:36 --------*/

ALTER TABLE TBOS_EVENTO
    ADD TECNICO DMN_INTEGER_N;

COMMENT ON COLUMN TBOS_EVENTO.TECNICO IS
'Tecnico do evento';

alter table TBOS_EVENTO
alter ANO position 1;

alter table TBOS_EVENTO
alter CONTROLE position 2;

alter table TBOS_EVENTO
alter SEQUENCIAL position 3;

alter table TBOS_EVENTO
alter DATA_CADASTRO position 4;

alter table TBOS_EVENTO
alter DATA_EVENTO position 5;

alter table TBOS_EVENTO
alter USUARIO position 6;

alter table TBOS_EVENTO
alter TECNICO position 7;

alter table TBOS_EVENTO
alter EVENTO position 8;




/*------ SYSDBA 21/09/2015 17:47:56 --------*/

COMMENT ON COLUMN TBOS_EVENTO.TECNICO IS
'Tecnico do evento

Origem do registro: TBVENDEDOR';




/*------ SYSDBA 21/09/2015 17:48:18 --------*/

ALTER TABLE TBOS_EVENTO
ADD CONSTRAINT FK_TBOS_EVENTO_TEC
FOREIGN KEY (TECNICO)
REFERENCES TBVENDEDOR(COD);




/*------ SYSDBA 21/09/2015 17:49:05 --------*/

ALTER TABLE TBOS_TECNICO
ADD CONSTRAINT FK_TBOS_TECNICO_OS
FOREIGN KEY (ANO,CONTROLE)
REFERENCES TBOS(ANO,CONTROLE)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBOS_TECNICO
ADD CONSTRAINT FK_TBOS_TECNICO_TEC
FOREIGN KEY (TECNICO)
REFERENCES TBVENDEDOR(COD);




/*------ SYSDBA 21/09/2015 17:50:36 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_nova for tbos
active before insert position 0
AS
begin
  new.status        =  coalesce(new.status, 0);
  new.data_cadastro = coalesce(new.data_cadastro, current_date);
  new.data_emissao  = coalesce(new.data_emissao, new.data_cadastro, current_date);

  if ( coalesce(new.ano, 0) <= 0 ) then
    new.ano = extract(year from coalesce(new.data_emissao, new.data_cadastro));

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

SET TERM ; ^




/*------ SYSDBA 21/09/2015 17:51:38 --------*/

ALTER TABLE TBOS
    ADD COMPETENCIA DMN_INTEGER_N;

COMMENT ON COLUMN TBOS.COMPETENCIA IS
'Competencia de producao';




/*------ SYSDBA 21/09/2015 17:53:12 --------*/

SET TERM ^ ;

CREATE trigger tg_os_competencia for tbos
active before insert or update position 0
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

SET TERM ; ^

COMMENT ON TRIGGER TG_OS_COMPETENCIA IS 'Trigger SET Competencia OS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/09/2015

Trigger responsavel por definir a competencia da OS quando esta nao fora
definida ainda.';




/*------ SYSDBA 21/09/2015 17:53:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_competencia for tbos
active before insert or update position 0
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

SET TERM ; ^

COMMENT ON TRIGGER TG_OS_COMPETENCIA IS 'Trigger SET Competencia OS.

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




/*------ SYSDBA 21/09/2015 17:54:01 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_competencia for tbos
active before insert or update position 1
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

SET TERM ; ^




/*------ SYSDBA 21/09/2015 19:09:46 --------*/

ALTER TABLE TBOS
ADD CONSTRAINT FK_TBOS_COMP
FOREIGN KEY (COMPETENCIA)
REFERENCES TBCOMPETENCIA(CMP_NUM);




/*------ SYSDBA 21/09/2015 19:15:03 --------*/

ALTER TABLE TBOS
    ADD EMPRESA DMN_CNPJ_NN,
    ADD CLIENTE DMN_INTEGER_NN;

COMMENT ON COLUMN TBOS.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBOS.CLIENTE IS
'Cliente';




/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column ANO position 1;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column CONTROLE position 2;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column EMPRESA position 3;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column CLIENTE position 4;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column DATA_CADASTRO position 5;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column DATA_EMISSAO position 6;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column USUARIO position 7;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column STATUS position 8;


/*------ SYSDBA 21/09/2015 19:15:28 --------*/

alter table TBOS
alter column COMPETENCIA position 9;


/*------ SYSDBA 21/09/2015 19:16:37 --------*/

ALTER TABLE TBOS
    ADD VENDEDOR DMN_INTEGER_N;

COMMENT ON COLUMN TBOS.VENDEDOR IS
'Vendedor / Tecnico principal';

alter table TBOS
alter ANO position 1;

alter table TBOS
alter CONTROLE position 2;

alter table TBOS
alter EMPRESA position 3;

alter table TBOS
alter CLIENTE position 4;

alter table TBOS
alter DATA_CADASTRO position 5;

alter table TBOS
alter DATA_EMISSAO position 6;

alter table TBOS
alter USUARIO position 7;

alter table TBOS
alter VENDEDOR position 8;

alter table TBOS
alter STATUS position 9;

alter table TBOS
alter COMPETENCIA position 10;




/*------ SYSDBA 21/09/2015 19:17:28 --------*/

ALTER TABLE TBOS
ADD CONSTRAINT FK_TBOS_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);

ALTER TABLE TBOS
ADD CONSTRAINT FK_TBOS_CLI
FOREIGN KEY (CLIENTE)
REFERENCES TBCLIENTE(CODIGO);

ALTER TABLE TBOS
ADD CONSTRAINT FK_TBOS_VND
FOREIGN KEY (VENDEDOR)
REFERENCES TBVENDEDOR(COD);




/*------ SYSDBA 21/09/2015 19:21:00 --------*/

ALTER TABLE TBOS
    ADD TOTAL_SERVICO DMN_MONEY DEFAULT 0.0,
    ADD TOTAL_PRODUTO DMN_MONEY DEFAULT 0.0,
    ADD TOTAL_BRUTO DMN_MONEY DEFAULT 0.0,
    ADD TOTAL_DESCONTOS DMN_MONEY_DESCONTO DEFAULT 0.0,
    ADD TOTAL_LIQUIDO DMN_MONEY DEFAULT 0.0,
    ADD TOTAL_OS DMN_MONEY;

COMMENT ON COLUMN TBOS.TOTAL_SERVICO IS
'Valor Total do(s) Servico(s)';

COMMENT ON COLUMN TBOS.TOTAL_PRODUTO IS
'Valor Total do(s) Produto(s)';

COMMENT ON COLUMN TBOS.TOTAL_BRUTO IS
'Valor Total Bruto Geral';

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS IS
'Valor Total Geral de Descontos';

COMMENT ON COLUMN TBOS.TOTAL_LIQUIDO IS
'Valor Total Liquido';

COMMENT ON COLUMN TBOS.TOTAL_OS IS
'Valor Total Líquido da OS';




/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column ANO position 1;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column CONTROLE position 2;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column EMPRESA position 3;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column CLIENTE position 4;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column DATA_CADASTRO position 5;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column DATA_EMISSAO position 6;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column USUARIO position 7;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column VENDEDOR position 8;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column STATUS position 9;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column COMPETENCIA position 10;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column TOTAL_SERVICO position 11;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column TOTAL_PRODUTO position 12;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column TOTAL_DESCONTOS position 13;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column TOTAL_OS position 14;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column TOTAL_BRUTO position 15;


/*------ SYSDBA 21/09/2015 19:21:13 --------*/

alter table TBOS
alter column TOTAL_LIQUIDO position 16;


/*------ SYSDBA 21/09/2015 19:21:22 --------*/

ALTER TABLE TBOS ALTER TOTAL_DESCONTOS TO TOTAL_DESCONTOS_SERVICOS;




/*------ SYSDBA 21/09/2015 19:22:12 --------*/

ALTER TABLE TBOS
    ADD TOTAL_DESCONTOS_PRODUTOS DMN_MONEY_DESCONTO;

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_SERVICOS IS
'Valor Total de Descontos no(s) Servico(s)';

COMMENT ON COLUMN TBOS.TOTAL_DESCONTOS_PRODUTOS IS
'Valor Total de Descontos no(s) Produtos(s)';

alter table TBOS
alter ANO position 1;

alter table TBOS
alter CONTROLE position 2;

alter table TBOS
alter EMPRESA position 3;

alter table TBOS
alter CLIENTE position 4;

alter table TBOS
alter DATA_CADASTRO position 5;

alter table TBOS
alter DATA_EMISSAO position 6;

alter table TBOS
alter USUARIO position 7;

alter table TBOS
alter VENDEDOR position 8;

alter table TBOS
alter STATUS position 9;

alter table TBOS
alter COMPETENCIA position 10;

alter table TBOS
alter TOTAL_SERVICO position 11;

alter table TBOS
alter TOTAL_PRODUTO position 12;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 13;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 14;

alter table TBOS
alter TOTAL_OS position 15;

alter table TBOS
alter TOTAL_BRUTO position 16;

alter table TBOS
alter TOTAL_LIQUIDO position 17;




/*------ SYSDBA 21/09/2015 19:22:39 --------*/

COMMENT ON COLUMN TBOS.TOTAL_OS IS
'Valor Total Líquido da OS (Principal para a Ordem de Servico)';




/*------ SYSDBA 21/09/2015 19:24:01 --------*/

ALTER TABLE TBOS
    ADD OBSERVACOES DMN_TEXTO,
    ADD DADOS_ENTREGA DMN_TEXTO;

COMMENT ON COLUMN TBOS.OBSERVACOES IS
'Observacoes gerais';

COMMENT ON COLUMN TBOS.DADOS_ENTREGA IS
'Dados gerais de realizacao/entrega do servico';




/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column ANO position 1;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column CONTROLE position 2;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column EMPRESA position 3;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column CLIENTE position 4;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column DATA_CADASTRO position 5;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column DATA_EMISSAO position 6;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column USUARIO position 7;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column VENDEDOR position 8;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column STATUS position 9;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column COMPETENCIA position 10;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_SERVICO position 11;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_PRODUTO position 12;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_DESCONTOS_SERVICOS position 13;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_DESCONTOS_PRODUTOS position 14;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_OS position 15;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_BRUTO position 16;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column TOTAL_LIQUIDO position 17;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column DADOS_ENTREGA position 18;


/*------ SYSDBA 21/09/2015 19:24:12 --------*/

alter table TBOS
alter column OBSERVACOES position 19;


/*------ SYSDBA 21/09/2015 19:29:15 --------*/

ALTER TABLE TBOS
    ADD NFS_CNAE DMN_VCHAR_10,
    ADD NFS_NCM DMN_VCHAR_10,
    ADD NFS_DESCRICAO_SERVICO DMN_TEXTO;

COMMENT ON COLUMN TBOS.NFS_CNAE IS
'NFS-e: CNAE principal do servico';

COMMENT ON COLUMN TBOS.NFS_NCM IS
'NFS-e: NCM do servico principal';

COMMENT ON COLUMN TBOS.NFS_DESCRICAO_SERVICO IS
'NFS-e: Descricao do servico principal';




/*------ SYSDBA 21/09/2015 19:29:57 --------*/

CREATE INDEX IDX_TBOS_NCM
ON TBOS (NFS_NCM);

CREATE INDEX IDX_TBOS_CNAE
ON TBOS (NFS_CNAE);




/*------ SYSDBA 21/09/2015 19:33:08 --------*/

ALTER TABLE TBOS
    ADD DATA_APROVACAO DMN_DATE,
    ADD DATA_FINALIZACAO DMN_DATE,
    ADD DATA_FATURA DMN_DATE;

COMMENT ON COLUMN TBOS.STATUS IS
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avalizacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao data pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada  (Finalizado o servico pelo tecnico)
7 - Faturada
8 - NFS
9 - Cancelada';

COMMENT ON COLUMN TBOS.DATA_APROVACAO IS
'Data da aprovacao pelo cliente';

COMMENT ON COLUMN TBOS.DATA_FINALIZACAO IS
'Data de finalizacao do(s) servico(s) pelo tecnico';

COMMENT ON COLUMN TBOS.DATA_FATURA IS
'Data de faturamento da OS';

alter table TBOS
alter ANO position 1;

alter table TBOS
alter CONTROLE position 2;

alter table TBOS
alter EMPRESA position 3;

alter table TBOS
alter CLIENTE position 4;

alter table TBOS
alter DATA_CADASTRO position 5;

alter table TBOS
alter DATA_EMISSAO position 6;

alter table TBOS
alter USUARIO position 7;

alter table TBOS
alter VENDEDOR position 8;

alter table TBOS
alter STATUS position 9;

alter table TBOS
alter COMPETENCIA position 10;

alter table TBOS
alter TOTAL_SERVICO position 11;

alter table TBOS
alter TOTAL_PRODUTO position 12;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 13;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 14;

alter table TBOS
alter TOTAL_OS position 15;

alter table TBOS
alter TOTAL_BRUTO position 16;

alter table TBOS
alter TOTAL_LIQUIDO position 17;

alter table TBOS
alter DADOS_ENTREGA position 18;

alter table TBOS
alter OBSERVACOES position 19;

alter table TBOS
alter DATA_APROVACAO position 20;

alter table TBOS
alter DATA_FINALIZACAO position 21;

alter table TBOS
alter DATA_FATURA position 22;

alter table TBOS
alter NFS_CNAE position 23;

alter table TBOS
alter NFS_NCM position 24;

alter table TBOS
alter NFS_DESCRICAO_SERVICO position 25;




/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column ANO position 1;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column CONTROLE position 2;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column EMPRESA position 3;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column CLIENTE position 4;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column DATA_CADASTRO position 5;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column DATA_EMISSAO position 6;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column USUARIO position 7;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column VENDEDOR position 8;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column STATUS position 9;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column OBSERVACOES position 10;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column DADOS_ENTREGA position 11;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column COMPETENCIA position 12;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_SERVICO position 13;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_PRODUTO position 14;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_DESCONTOS_SERVICOS position 15;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_DESCONTOS_PRODUTOS position 16;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_OS position 17;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_BRUTO position 18;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column TOTAL_LIQUIDO position 19;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column DATA_APROVACAO position 20;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column DATA_FINALIZACAO position 21;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column DATA_FATURA position 22;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column NFS_CNAE position 23;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column NFS_NCM position 24;


/*------ SYSDBA 22/09/2015 00:15:50 --------*/

alter table TBOS
alter column NFS_DESCRICAO_SERVICO position 25;


/*------ SYSDBA 22/09/2015 00:21:27 --------*/

ALTER TABLE TBOS
    ADD SOLICITACAO DMN_TEXTO;

COMMENT ON COLUMN TBOS.SOLICITACAO IS
'Solicitacao do cliente';

alter table TBOS
alter ANO position 1;

alter table TBOS
alter CONTROLE position 2;

alter table TBOS
alter EMPRESA position 3;

alter table TBOS
alter CLIENTE position 4;

alter table TBOS
alter DATA_CADASTRO position 5;

alter table TBOS
alter DATA_EMISSAO position 6;

alter table TBOS
alter USUARIO position 7;

alter table TBOS
alter VENDEDOR position 8;

alter table TBOS
alter STATUS position 9;

alter table TBOS
alter OBSERVACOES position 10;

alter table TBOS
alter SOLICITACAO position 11;

alter table TBOS
alter DADOS_ENTREGA position 12;

alter table TBOS
alter COMPETENCIA position 13;

alter table TBOS
alter TOTAL_SERVICO position 14;

alter table TBOS
alter TOTAL_PRODUTO position 15;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 16;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 17;

alter table TBOS
alter TOTAL_OS position 18;

alter table TBOS
alter TOTAL_BRUTO position 19;

alter table TBOS
alter TOTAL_LIQUIDO position 20;

alter table TBOS
alter DATA_APROVACAO position 21;

alter table TBOS
alter DATA_FINALIZACAO position 22;

alter table TBOS
alter DATA_FATURA position 23;

alter table TBOS
alter NFS_CNAE position 24;

alter table TBOS
alter NFS_NCM position 25;

alter table TBOS
alter NFS_DESCRICAO_SERVICO position 26;




/*------ SYSDBA 22/09/2015 00:31:16 --------*/

ALTER TABLE TBOS
    ADD DIAGNOSTICO DMN_TEXTO;

COMMENT ON COLUMN TBOS.DIAGNOSTICO IS
'Diagnostico do tecnico';

alter table TBOS
alter ANO position 1;

alter table TBOS
alter CONTROLE position 2;

alter table TBOS
alter EMPRESA position 3;

alter table TBOS
alter CLIENTE position 4;

alter table TBOS
alter DATA_CADASTRO position 5;

alter table TBOS
alter DATA_EMISSAO position 6;

alter table TBOS
alter USUARIO position 7;

alter table TBOS
alter VENDEDOR position 8;

alter table TBOS
alter STATUS position 9;

alter table TBOS
alter OBSERVACOES position 10;

alter table TBOS
alter SOLICITACAO position 11;

alter table TBOS
alter DIAGNOSTICO position 12;

alter table TBOS
alter DADOS_ENTREGA position 13;

alter table TBOS
alter COMPETENCIA position 14;

alter table TBOS
alter TOTAL_SERVICO position 15;

alter table TBOS
alter TOTAL_PRODUTO position 16;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 17;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 18;

alter table TBOS
alter TOTAL_OS position 19;

alter table TBOS
alter TOTAL_BRUTO position 20;

alter table TBOS
alter TOTAL_LIQUIDO position 21;

alter table TBOS
alter DATA_APROVACAO position 22;

alter table TBOS
alter DATA_FINALIZACAO position 23;

alter table TBOS
alter DATA_FATURA position 24;

alter table TBOS
alter NFS_CNAE position 25;

alter table TBOS
alter NFS_NCM position 26;

alter table TBOS
alter NFS_DESCRICAO_SERVICO position 27;




/*------ SYSDBA 22/09/2015 00:33:26 --------*/

ALTER TABLE TBOS DROP DIAGNOSTICO;




/*------ SYSDBA 22/09/2015 00:34:46 --------*/

ALTER TABLE TBOS ALTER SOLICITACAO TO RELATO_SOLICITACAO;

COMMENT ON COLUMN TBOS.RELATO_SOLICITACAO IS
'Relato / Solicitacao do cliente';




/*------ SYSDBA 22/09/2015 00:40:17 --------*/

ALTER TABLE TBOS
    ADD NFS_SERIE DMN_VCHAR_04,
    ADD NFS_NUMERO DMN_BIGINT_N,
    ADD NFS_DATAEMISSAO DMN_DATE,
    ADD NFS_HORAEMISSAO DMN_TIME;

COMMENT ON COLUMN TBOS.NFS_SERIE IS
'NFS-e: Serie';

COMMENT ON COLUMN TBOS.NFS_NUMERO IS
'NFS-e: Numero';

COMMENT ON COLUMN TBOS.NFS_DATAEMISSAO IS
'NFS-e: Data de emissao';

COMMENT ON COLUMN TBOS.NFS_HORAEMISSAO IS
'NFS-e: Hora de emissao';

alter table TBOS
alter ANO position 1;

alter table TBOS
alter CONTROLE position 2;

alter table TBOS
alter EMPRESA position 3;

alter table TBOS
alter CLIENTE position 4;

alter table TBOS
alter DATA_CADASTRO position 5;

alter table TBOS
alter DATA_EMISSAO position 6;

alter table TBOS
alter USUARIO position 7;

alter table TBOS
alter VENDEDOR position 8;

alter table TBOS
alter STATUS position 9;

alter table TBOS
alter OBSERVACOES position 10;

alter table TBOS
alter RELATO_SOLICITACAO position 11;

alter table TBOS
alter DADOS_ENTREGA position 12;

alter table TBOS
alter COMPETENCIA position 13;

alter table TBOS
alter TOTAL_SERVICO position 14;

alter table TBOS
alter TOTAL_PRODUTO position 15;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 16;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 17;

alter table TBOS
alter TOTAL_OS position 18;

alter table TBOS
alter TOTAL_BRUTO position 19;

alter table TBOS
alter TOTAL_LIQUIDO position 20;

alter table TBOS
alter DATA_APROVACAO position 21;

alter table TBOS
alter DATA_FINALIZACAO position 22;

alter table TBOS
alter DATA_FATURA position 23;

alter table TBOS
alter NFS_SERIE position 24;

alter table TBOS
alter NFS_NUMERO position 25;

alter table TBOS
alter NFS_DATAEMISSAO position 26;

alter table TBOS
alter NFS_HORAEMISSAO position 27;

alter table TBOS
alter NFS_CNAE position 28;

alter table TBOS
alter NFS_NCM position 29;

alter table TBOS
alter NFS_DESCRICAO_SERVICO position 30;




/*------ SYSDBA 22/09/2015 00:50:05 --------*/

ALTER TABLE TBVENDAS DROP CONSTRAINT UNQ_TBVENDAS_NFE;

ALTER TABLE TBVENDAS
ADD CONSTRAINT UNQ_TBVENDAS_NFES
UNIQUE (CODEMP,SERIE,NFE)
USING INDEX UNQ_TBVENDAS_NFE;




/*------ SYSDBA 22/09/2015 00:50:18 --------*/

ALTER TABLE TBVENDAS DROP CONSTRAINT UNQ_TBVENDAS_NFES;

ALTER TABLE TBVENDAS
ADD CONSTRAINT UNQ_TBVENDAS_NFE
UNIQUE (CODEMP,SERIE,NFE)
USING INDEX UNQ_TBVENDAS_NFE;




/*------ SYSDBA 22/09/2015 00:51:04 --------*/

ALTER TABLE TBVENDAS DROP CONSTRAINT UNQ_TBVENDAS_NFE;




/*------ SYSDBA 22/09/2015 00:52:14 --------*/

CREATE INDEX IDX_TBVENDAS_NFE
ON TBVENDAS (SERIE,NFE);

