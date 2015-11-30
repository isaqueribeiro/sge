


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




/*------ SYSDBA 27/10/2015 20:06:48 --------*/

ALTER TABLE TBCONTPAG
    ADD COMPETENCIA_APURACAO DMN_INTEGER_N;

COMMENT ON COLUMN TBCONTPAG.COMPETENCIA_APURACAO IS
'Competencia de apuracao.';




/*------ SYSDBA 27/10/2015 20:07:46 --------*/

ALTER TABLE TBCONTREC
    ADD COMPETENCIA_APURACAO DMN_INTEGER_N;

COMMENT ON COLUMN TBCONTREC.COMPETENCIA_APURACAO IS
'Competencia de apuracao.';




/*------ SYSDBA 27/10/2015 20:09:24 --------*/

ALTER TABLE TBCONTPAG
ADD CONSTRAINT FK_TBCONTPAG_COMP_APUR
FOREIGN KEY (COMPETENCIA_APURACAO)
REFERENCES TBCOMPETENCIA(CMP_NUM);




/*------ SYSDBA 27/10/2015 20:11:06 --------*/

ALTER TABLE TBCONTREC
ADD CONSTRAINT FK_TBCONTREC_COMP_APUR
FOREIGN KEY (COMPETENCIA_APURACAO)
REFERENCES TBCOMPETENCIA(CMP_NUM);



/*------ SYSDBA 27/10/2015 21:28:23 --------*/

Execute block
as
  declare variable competencia Integer;
  declare variable data_emissao Date;
begin
  /* Atualizar Compras A Pagar */
  for
    Select
      p.dtemiss
    from TBCONTPAG p
    where p.competencia_apuracao is null
    group by
      p.dtemiss
    Into
      data_emissao
  do
  begin
    competencia = extract(year from data_emissao) || right('00' || extract(month from data_emissao), 2);
    Execute Procedure SET_COMPETENCIA(:competencia, null);
    Update TBCONTPAG p Set
      p.competencia_apuracao = :competencia
    where p.competencia_apuracao is null
      and p.dtemiss = :data_emissao;
  end 
end;

/*------ SYSDBA 27/10/2015 21:29:11 --------*/

Execute block
as
  declare variable competencia Integer;
  declare variable data_emissao Date;
begin
  /* Atualizar Compras A Pagar */
  for
    Select
      p.dtemiss
    from TBCONTPAG p
    where p.competencia_apuracao is null
    group by
      p.dtemiss
    Into
      data_emissao
  do
  begin
    competencia = extract(year from data_emissao) || right('00' || extract(month from data_emissao), 2);
    Execute Procedure SET_COMPETENCIA(:competencia, null);
    Update TBCONTPAG p Set
      p.competencia_apuracao = :competencia
    where p.competencia_apuracao is null
      and p.dtemiss = :data_emissao;
  end 

  /* Atualizar Compras A Receber */
  for
    Select
      r.dtemiss
    from TBCONTREC r
    where r.competencia_apuracao is null
    group by
      r.dtemiss
    Into
      data_emissao
  do
  begin
    competencia = extract(year from data_emissao) || right('00' || extract(month from data_emissao), 2);
    Execute Procedure SET_COMPETENCIA(:competencia, null);
    Update TBCONTREC r Set
      r.competencia_apuracao = :competencia
    where r.competencia_apuracao is null
      and r.dtemiss = :data_emissao;
  end 
end;

/*------ SYSDBA 27/10/2015 21:32:11 --------*/

COMMIT WORK;


/*------ SYSDBA 29/10/2015 14:16:07 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM
    ADD QTDE_FRACIONADA DMN_QUANTIDADE_D3;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX_ITEM.QTDE_FRACIONADA IS
'Quantidade fracionada (Consumo)';

alter table TBAPROPRIACAO_ALMOX_ITEM
alter ANO position 1;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CONTROLE position 2;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter ITEM position 3;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter PRODUTO position 4;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter QTDE position 5;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter QTDE_FRACIONADA position 6;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter FRACIONADOR position 7;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE position 8;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE_FRACAO position 9;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_UNITARIO position 10;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_TOTAL position 11;




/*------ SYSDBA 29/10/2015 14:16:31 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ALTER COLUMN QTDE_FRACIONADA
SET DEFAULT 0.0
;




/*------ SYSDBA 29/10/2015 14:18:47 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_item_qtde for tbapropriacao_almox_item
active before insert or update position 1
AS
begin
  if ( coalesce(new.qtde_fracionada, 0.0) = 0.0 ) then
    if ( coalesce(new.qtde, 0.0) > 0.0 ) then
      new.qtde_fracionada = coalesce(new.qtde, 0.0) * coalesce(new.fracionador, 1);
end^

SET TERM ; ^




/*------ SYSDBA 29/10/2015 14:22:31 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM
    ADD QTDE_TIPO_LANCAMENTO DMN_SMALLINT_N DEFAULT 0;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX_ITEM.QTDE_TIPO_LANCAMENTO IS
'Tipo de lancamento da quantidade:
0 - Quantidade lancada pela Unidade de Compra
1 - Quantidade lancada pela Unidade de Consumo (Fracionada)';

alter table TBAPROPRIACAO_ALMOX_ITEM
alter ANO position 1;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CONTROLE position 2;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter ITEM position 3;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter PRODUTO position 4;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter QTDE_TIPO_LANCAMENTO position 5;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter QTDE position 6;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter QTDE_FRACIONADA position 7;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter FRACIONADOR position 8;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE position 9;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE_FRACAO position 10;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_UNITARIO position 11;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_TOTAL position 12;




/*------ SYSDBA 29/10/2015 14:23:16 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_SMALLINT_NN'
where (RDB$FIELD_NAME = 'QTDE_TIPO_LANCAMENTO') and
(RDB$RELATION_NAME = 'TBAPROPRIACAO_ALMOX_ITEM')
;




/*------ SYSDBA 29/10/2015 14:26:09 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX_ITEM IS 'Tabela de Itens de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   05/01/2015

Tabela responsavel por armazenar todos os registros de itens da apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/10/2015 - IMR :
        + Criacao dos campos QTDE_FRACIONADA e QTDE_TIPO_LANCAMENTO para que seja
          possivel a apropriacao geral de produtos para o estoque tanto por Unidade
          de Compra como por Unidade de Consumo.

    05/01/2014 - IMR :
        * Documentacao da tabela.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.';




/*------ SYSDBA 29/10/2015 14:59:37 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX_ITEM IS 'Tabela de Itens de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   05/01/2015

Tabela responsavel por armazenar todos os registros de itens da apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/10/2015 - IMR :
        + Criacao dos campos QTDE_FRACIONADA e QTDE_TIPO_LANCAMENTO para que seja
          possivel a apropriacao geral de produtos para o estoque tanto por Unidade
          de Compra como por Unidade de Consumo.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.

    05/01/2014 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 10/11/2015 12:33:12 --------*/

ALTER TABLE TBCOMPRAS
    ADD DNFE_SAIDA_ANO DMN_SMALLINT_N,
    ADD DNFE_SAIDA_COD DMN_BIGINT_N;

COMMENT ON COLUMN TBCOMPRAS.DNFE_SAIDA_ANO IS
'Devolucao -> Ano Saida (Venda)';

COMMENT ON COLUMN TBCOMPRAS.DNFE_SAIDA_COD IS
'Devolucao -> Codigo Saida (Venda)';

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
alter DNFE_SAIDA_ANO position 69;

alter table TBCOMPRAS
alter DNFE_SAIDA_COD position 70;

alter table TBCOMPRAS
alter DNFE_FORMA position 71;

alter table TBCOMPRAS
alter DNFE_UF position 72;

alter table TBCOMPRAS
alter DNFE_CNPJ_CPF position 73;

alter table TBCOMPRAS
alter DNFE_IE position 74;

alter table TBCOMPRAS
alter DNFE_COMPETENCIA position 75;

alter table TBCOMPRAS
alter DNFE_SERIE position 76;

alter table TBCOMPRAS
alter DNFE_NUMERO position 77;

alter table TBCOMPRAS
alter DNFE_MODELO position 78;

alter table TBCOMPRAS
alter DNFE_CHAVE position 79;

alter table TBCOMPRAS
alter DECF_MODELO position 80;

alter table TBCOMPRAS
alter DECF_NUMERO position 81;

alter table TBCOMPRAS
alter DECF_COO position 82;




/*------ SYSDBA 10/11/2015 12:33:44 --------*/

ALTER TABLE TBCOMPRAS
ADD CONSTRAINT FK_TBCOMPRAS_DEVOLVER_SAIDA
FOREIGN KEY (DNFE_SAIDA_ANO,DNFE_SAIDA_COD)
REFERENCES TBVENDAS(ANO,CODCONTROL);




/*------ SYSDBA 10/11/2015 14:52:46 --------*/

SET TERM ^ ;

create or alter procedure SP_UPD_CUSTO_APROP_ENTRADA (
    ANO smallint)
as
declare variable ANO_COMPRA integer;
declare variable COD_COMPRA integer;
declare variable EMP_COMPRA varchar(18);
declare variable PRODUTO varchar(10);
declare variable CUSTO DMN_MONEY;
declare variable TOTAL DMN_MONEY;
declare variable ANO_AUTORIZ integer;
declare variable COD_AUTORIZ integer;
begin
  -- Atualizar Custos de Apropriacao por Entradas
  -- OBSERVACAO: Processo I da Atualizacao Geral de Custos do Estoque
  for
    Select
        c.ano
      , c.codcontrol
      , c.codemp
      , c.codprod
      , c.customedio
    from TBCOMPRASITENS c
    where c.ano = :ano
    Into
        ano_compra
      , cod_compra
      , emp_compra
      , produto
      , custo
  do
  begin
    for
      Select
          aa.ano
        , aa.controle
      from TBAPROPRIACAO_ALMOX aa
      where aa.compra_ano = :ano_compra
        and aa.compra_num = :cod_compra
        and aa.compra_emp = :emp_compra
      Into
          ano_autoriz
        , cod_autoriz
    do
    begin
      Update TBAPROPRIACAO_ALMOX_ITEM i Set
          i.custo_unitario = :custo
        , i.custo_total    = i.qtde * :custo
      where i.ano      = :ano_autoriz
        and i.controle = :cod_autoriz
        and i.produto  = :produto;
    end 
  end 

  -- 2. Atualizar Valor Total das Apropriacoes
  for
    Select
        i.ano
      , i.controle
      , sum( i.custo_total )
    from TBAPROPRIACAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano_autoriz
      , cod_autoriz
      , total
  do
  begin
    Update TBAPROPRIACAO_ALMOX a Set
      a.valor_total  = :total
    where a.ano      = :ano_autoriz
      and a.controle = :cod_autoriz;
  end 
end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_UPD_CUSTO_APROP_ENTRADA TO "PUBLIC";



/*------ SYSDBA 10/11/2015 14:54:28 --------*/

SET TERM ^ ;

create or alter procedure SP_UPD_CUSTO_APROP_AUTORIZ (
    ANO smallint)
as
declare variable ANO_AUTORIZA integer;
declare variable COD_AUTORIZA integer;
declare variable EMP_AUTORIZA varchar(18);
declare variable PRODUTO varchar(10);
declare variable CUSTO DMN_MONEY;
declare variable TOTAL DMN_MONEY;
declare variable ANO_APROPRIACAO integer;
declare variable COD_APROPRIACAO integer;
begin
  -- Atualizar Custos de Apropriacao por Autorizacoes
  -- OBSERVACAO: Processo II da Atualizacao Geral de Custos do Estoque
  for
    Select
        c.ano
      , c.codigo
      , c.empresa
      , c.produto
      , c.valor_unitario
    from TBAUTORIZA_COMPRAITEM c
    where c.ano = :ano
    Into
        ano_autoriza
      , cod_autoriza
      , emp_autoriza
      , produto
      , custo
  do
  begin
    for
      Select
          aa.ano
        , aa.controle
      from TBAPROPRIACAO_ALMOX aa
      where aa.autorizacao_ano = :ano_autoriza
        and aa.autorizacao_num = :cod_autoriza
        and aa.autorizacao_emp = :emp_autoriza
      Into
          ano_apropriacao
        , cod_apropriacao
    do
    begin
      Update TBAPROPRIACAO_ALMOX_ITEM i Set
          i.custo_unitario = :custo
        , i.custo_total    = i.qtde * :custo
      where i.ano      = :ano_apropriacao
        and i.controle = :cod_apropriacao
        and i.produto  = :produto;
    end 
  end 

  -- 2. Atualizar Valor Total das Apropriacoes
  for
    Select
        i.ano
      , i.controle
      , sum( i.custo_total )
    from TBAPROPRIACAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano_apropriacao
      , cod_apropriacao
      , total
  do
  begin
    Update TBAPROPRIACAO_ALMOX a Set
      a.valor_total  = :total
    where a.ano      = :ano_apropriacao
      and a.controle = :cod_apropriacao;
  end 
end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_UPD_CUSTO_APROP_AUTORIZ TO "PUBLIC";



/*------ SYSDBA 10/11/2015 14:57:25 --------*/

SET TERM ^ ;

create or alter procedure SP_UPD_CUSTO_ESTOQUE_APROP (
    ANO smallint)
as
declare variable PRODUTO varchar(10);
declare variable CENTRO integer;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
declare variable UNIDADE smallint;
declare variable CUSTO_INTEIRO DMN_MONEY;
begin
  -- Atualizar Custos do Estoque Apropriado no Almoxarifado
  -- OBSERVACAO: Processo III da Atualizacao Geral de Custos do Estoque
  for
    Select
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
      , avg(i.custo_unitario) as custo_medio
    from TBAPROPRIACAO_ALMOX_ITEM i
      inner join TBAPROPRIACAO_ALMOX a on (a.ano = i.ano and a.controle = i.controle)
      inner join TBPRODUTO p on (p.cod = i.produto)
    where i.ano = :ano
    group by
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
    Into
        produto
      , centro
      , fracionador
      , unidade
      , custo_inteiro
  do
  begin
    Update TBESTOQUE_ALMOX ee Set
        ee.fracionador = :fracionador
      , ee.unidade     = :unidade
      , ee.custo_medio = (:custo_inteiro / :fracionador)
    where ee.centro_custo = :centro
      and ee.produto      = :produto;
  end 
end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_UPD_CUSTO_ESTOQUE_APROP TO "PUBLIC";



/*------ SYSDBA 10/11/2015 15:00:34 --------*/

SET TERM ^ ;

create or alter procedure SP_UPD_CUSTO_ESTOQUE_REQUI (
    ANO_MOVIMENTO smallint)
as
declare variable ANO integer;
declare variable CONTROLE integer;
declare variable LOTE varchar(38);
declare variable CUSTO DMN_MONEY_4;
declare variable TOTAL DMN_MONEY;
declare variable UNIDADE smallint;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Atualizar Custos das Requisicoes ao Almoxarifado
  -- OBSERVACAO: Processo VI da Atualizacao Geral de Custos do Estoque

  --1. Atualizar Custo dos Itens
  for
    Select
        i.ano
      , i.controle
      , i.lote_atendimento
    from TBREQUISICAO_ALMOX_ITEM i
    where i.ano = :ano_movimento
    Into
        ano
      , controle
      , lote
  do
  begin
    Select
        e.custo_medio
      , e.unidade
      , e.fracionador
    from TBESTOQUE_ALMOX e
    where e.id = :lote
    Into
        custo
      , unidade
      , fracionador;

    Update TBREQUISICAO_ALMOX_ITEM i Set
        i.custo       = :custo
      , i.unidade     = :unidade
      , i.fracionador = :fracionador
      , i.total       = (i.qtde_atendida * :custo)
    where i.ano      = :ano
      and i.controle = :controle
      and i.lote_atendimento = :lote;
  end 

  --2. Atualizar Custos Gerais
  for
    Select
        i.ano
      , i.controle
      , sum( i.total )
    from TBREQUISICAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano
      , controle
      , total
  do
  begin
    Update TBREQUISICAO_ALMOX r Set
      r.valor_total = :total
    where r.ano      = :ano
      and r.controle = :controle;
  end 
end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_UPD_CUSTO_ESTOQUE_REQUI TO "PUBLIC";



/*------ SYSDBA 10/11/2015 20:42:13 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_ESTOQUE_APROP (
    ANO smallint)
as
declare variable PRODUTO varchar(10);
declare variable CENTRO integer;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
declare variable UNIDADE smallint;
declare variable CUSTO_INTEIRO DMN_MONEY;
begin
  -- Atualizar Custos do Estoque Apropriado no Almoxarifado
  -- OBSERVACAO: Processo III da Atualizacao Geral de Custos do Estoque
  for
    Select
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
      , avg(i.custo_unitario) as custo_medio
    from TBAPROPRIACAO_ALMOX_ITEM i
      inner join TBAPROPRIACAO_ALMOX a on (a.ano = i.ano and a.controle = i.controle and a.status = 2)  -- 2. Encerrada
      inner join TBPRODUTO p on (p.cod = i.produto)
    where i.ano = :ano
    group by
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
    Into
        produto
      , centro
      , fracionador
      , unidade
      , custo_inteiro
  do
  begin
    Update TBESTOQUE_ALMOX ee Set
        ee.fracionador = :fracionador
      , ee.unidade     = :unidade
      , ee.custo_medio = (:custo_inteiro / :fracionador)
    where ee.centro_custo = :centro
      and ee.produto      = :produto;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/11/2015 20:47:03 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_APROP_AUTORIZ (
    ANO smallint)
as
declare variable ANO_AUTORIZA integer;
declare variable COD_AUTORIZA integer;
declare variable EMP_AUTORIZA varchar(18);
declare variable PRODUTO varchar(10);
declare variable CUSTO DMN_MONEY;
declare variable TOTAL DMN_MONEY;
declare variable ANO_APROPRIACAO integer;
declare variable COD_APROPRIACAO integer;
begin
  -- Atualizar Custos de Apropriacao por Autorizacoes
  -- OBSERVACAO: Processo II da Atualizacao Geral de Custos do Estoque
  for
    Select
        c.ano
      , c.codigo
      , c.empresa
      , c.produto
      , c.valor_unitario
    from TBAUTORIZA_COMPRAITEM c
      inner join TBAUTORIZA_COMPRA cc on (cc.ano = c.ano and cc.codigo = c.codigo and cc.empresa = c.empresa)
    where cc.status between 2 and 3 -- 2. Autorizada / 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      and c.ano = :ano
    Into
        ano_autoriza
      , cod_autoriza
      , emp_autoriza
      , produto
      , custo
  do
  begin
    for
      Select
          aa.ano
        , aa.controle
      from TBAPROPRIACAO_ALMOX aa
      where aa.autorizacao_ano = :ano_autoriza
        and aa.autorizacao_num = :cod_autoriza
        and aa.autorizacao_emp = :emp_autoriza
      Into
          ano_apropriacao
        , cod_apropriacao
    do
    begin
      Update TBAPROPRIACAO_ALMOX_ITEM i Set
          i.custo_unitario = :custo
        , i.custo_total    = i.qtde * :custo
      where i.ano      = :ano_apropriacao
        and i.controle = :cod_apropriacao
        and i.produto  = :produto;
    end 
  end 

  -- 2. Atualizar Valor Total das Apropriacoes
  for
    Select
        i.ano
      , i.controle
      , sum( i.custo_total )
    from TBAPROPRIACAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano_apropriacao
      , cod_apropriacao
      , total
  do
  begin
    Update TBAPROPRIACAO_ALMOX a Set
      a.valor_total  = :total
    where a.ano      = :ano_apropriacao
      and a.controle = :cod_apropriacao;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/11/2015 20:50:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_APROP_ENTRADA (
    ANO smallint)
as
declare variable ANO_COMPRA integer;
declare variable COD_COMPRA integer;
declare variable EMP_COMPRA varchar(18);
declare variable PRODUTO varchar(10);
declare variable CUSTO DMN_MONEY;
declare variable TOTAL DMN_MONEY;
declare variable ANO_AUTORIZ integer;
declare variable COD_AUTORIZ integer;
begin
  -- Atualizar Custos de Apropriacao por Entradas
  -- OBSERVACAO: Processo I da Atualizacao Geral de Custos do Estoque
  for
    Select
        c.ano
      , c.codcontrol
      , c.codemp
      , c.codprod
      , c.customedio
    from TBCOMPRASITENS c
      inner join TBCOMPRAS cc on (cc.ano = c.ano and cc.codcontrol = c.codcontrol and cc.codemp = c.codemp)
    where cc.status in (2, 4) -- 2. Finalizado / 4. NF-e Emitida
      and c.ano = :ano
    Into
        ano_compra
      , cod_compra
      , emp_compra
      , produto
      , custo
  do
  begin
    for
      Select
          aa.ano
        , aa.controle
      from TBAPROPRIACAO_ALMOX aa
      where aa.compra_ano = :ano_compra
        and aa.compra_num = :cod_compra
        and aa.compra_emp = :emp_compra
      Into
          ano_autoriz
        , cod_autoriz
    do
    begin
      Update TBAPROPRIACAO_ALMOX_ITEM i Set
          i.custo_unitario = :custo
        , i.custo_total    = i.qtde * :custo
      where i.ano      = :ano_autoriz
        and i.controle = :cod_autoriz
        and i.produto  = :produto;
    end 
  end 

  -- 2. Atualizar Valor Total das Apropriacoes
  for
    Select
        i.ano
      , i.controle
      , sum( i.custo_total )
    from TBAPROPRIACAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano_autoriz
      , cod_autoriz
      , total
  do
  begin
    Update TBAPROPRIACAO_ALMOX a Set
      a.valor_total  = :total
    where a.ano      = :ano_autoriz
      and a.controle = :cod_autoriz;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/11/2015 20:50:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_APROP_AUTORIZ (
    ANO smallint)
as
declare variable ANO_AUTORIZA integer;
declare variable COD_AUTORIZA integer;
declare variable EMP_AUTORIZA varchar(18);
declare variable PRODUTO varchar(10);
declare variable CUSTO DMN_MONEY;
declare variable TOTAL DMN_MONEY;
declare variable ANO_APROPRIACAO integer;
declare variable COD_APROPRIACAO integer;
begin
  -- Atualizar Custos de Apropriacao por Autorizacoes
  -- OBSERVACAO: Processo II da Atualizacao Geral de Custos do Estoque
  for
    Select
        c.ano
      , c.codigo
      , c.empresa
      , c.produto
      , c.valor_unitario
    from TBAUTORIZA_COMPRAITEM c
      inner join TBAUTORIZA_COMPRA cc on (cc.ano = c.ano and cc.codigo = c.codigo and cc.empresa = c.empresa)
    where cc.status in (2, 3) -- 2. Autorizada / 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      and c.ano = :ano
    Into
        ano_autoriza
      , cod_autoriza
      , emp_autoriza
      , produto
      , custo
  do
  begin
    for
      Select
          aa.ano
        , aa.controle
      from TBAPROPRIACAO_ALMOX aa
      where aa.autorizacao_ano = :ano_autoriza
        and aa.autorizacao_num = :cod_autoriza
        and aa.autorizacao_emp = :emp_autoriza
      Into
          ano_apropriacao
        , cod_apropriacao
    do
    begin
      Update TBAPROPRIACAO_ALMOX_ITEM i Set
          i.custo_unitario = :custo
        , i.custo_total    = i.qtde * :custo
      where i.ano      = :ano_apropriacao
        and i.controle = :cod_apropriacao
        and i.produto  = :produto;
    end 
  end 

  -- 2. Atualizar Valor Total das Apropriacoes
  for
    Select
        i.ano
      , i.controle
      , sum( i.custo_total )
    from TBAPROPRIACAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano_apropriacao
      , cod_apropriacao
      , total
  do
  begin
    Update TBAPROPRIACAO_ALMOX a Set
      a.valor_total  = :total
    where a.ano      = :ano_apropriacao
      and a.controle = :cod_apropriacao;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/11/2015 20:51:39 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_ESTOQUE_APROP (
    ANO smallint)
as
declare variable PRODUTO varchar(10);
declare variable CENTRO integer;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
declare variable UNIDADE smallint;
declare variable CUSTO_INTEIRO DMN_MONEY;
begin
  -- Atualizar Custos do Estoque Apropriado no Almoxarifado
  -- OBSERVACAO: Processo III da Atualizacao Geral de Custos do Estoque
  for
    Select
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
      , avg(i.custo_unitario) as custo_medio
    from TBAPROPRIACAO_ALMOX_ITEM i
      inner join TBAPROPRIACAO_ALMOX a on (a.ano = i.ano and a.controle = i.controle)
      inner join TBPRODUTO p on (p.cod = i.produto)
    where a.status = 2 -- 2. Encerrada
      and i.ano = :ano
    group by
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
    Into
        produto
      , centro
      , fracionador
      , unidade
      , custo_inteiro
  do
  begin
    Update TBESTOQUE_ALMOX ee Set
        ee.fracionador = :fracionador
      , ee.unidade     = :unidade
      , ee.custo_medio = (:custo_inteiro / :fracionador)
    where ee.centro_custo = :centro
      and ee.produto      = :produto;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/11/2015 21:10:21 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_ESTOQUE_REQUI (
    ANO_MOVIMENTO smallint)
as
declare variable ANO integer;
declare variable CONTROLE integer;
declare variable LOTE varchar(38);
declare variable CUSTO DMN_MONEY_4;
declare variable TOTAL DMN_MONEY;
declare variable UNIDADE smallint;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Atualizar Custos das Requisicoes ao Almoxarifado
  -- OBSERVACAO: Processo VI da Atualizacao Geral de Custos do Estoque

  --1. Atualizar Custo dos Itens
  for
    Select
        i.ano
      , i.controle
      , i.lote_atendimento
    from TBREQUISICAO_ALMOX_ITEM i
      inner join TBREQUISICAO_ALMOX ii on (ii.ano = i.ano and ii.controle = i.controle )
    where ii.status in (2, 3, 4) -- 2. Enviada / 3. Recebida / 4. Atendida
      and i.ano = :ano_movimento
    Into
        ano
      , controle
      , lote
  do
  begin
    Select
        e.custo_medio
      , e.unidade
      , e.fracionador
    from TBESTOQUE_ALMOX e
    where e.id = :lote
    Into
        custo
      , unidade
      , fracionador;

    Update TBREQUISICAO_ALMOX_ITEM i Set
        i.custo       = :custo
      , i.unidade     = :unidade
      , i.fracionador = :fracionador
      , i.total       = (i.qtde_atendida * :custo)
    where i.ano      = :ano
      and i.controle = :controle
      and i.lote_atendimento = :lote;
  end 

  --2. Atualizar Custos Gerais
  for
    Select
        i.ano
      , i.controle
      , sum( i.total )
    from TBREQUISICAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano
      , controle
      , total
  do
  begin
    Update TBREQUISICAO_ALMOX r Set
      r.valor_total = :total
    where r.ano      = :ano
      and r.controle = :controle;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/11/2015 13:26:21 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_ESTOQUE_APROP (
    ANO smallint)
as
declare variable PRODUTO varchar(10);
declare variable CENTRO integer;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
declare variable UNIDADE smallint;
declare variable CUSTO_INTEIRO DMN_MONEY;
begin
  -- Atualizar Custos do Estoque Apropriado no Almoxarifado
  -- OBSERVACAO: Processo III da Atualizacao Geral de Custos do Estoque
  for
    Select
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
      , max(i.custo_unitario) as custo_medio
    from TBAPROPRIACAO_ALMOX_ITEM i
      inner join TBAPROPRIACAO_ALMOX a on (a.ano = i.ano and a.controle = i.controle)
      inner join TBPRODUTO p on (p.cod = i.produto)
    where a.status = 2 -- 2. Encerrada
      and i.ano = :ano
    group by
        i.produto
      , a.centro_custo
      , i.fracionador
      , p.codunidade_fracionada
    Into
        produto
      , centro
      , fracionador
      , unidade
      , custo_inteiro
  do
  begin
    Update TBESTOQUE_ALMOX ee Set
        ee.fracionador = :fracionador
      , ee.unidade     = :unidade
      , ee.custo_medio = (:custo_inteiro / :fracionador)
    where ee.centro_custo = :centro
      and ee.produto      = :produto;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 13/11/2015 13:30:19 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque_vd     DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable fracionador_cc DMN_PERCENTUAL_3;
  declare variable unidade_cns    DMN_SMALLINT_N;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0)
        , coalesce(nullif(i.custo_unitario, 0.0), p.customedio, 0.0)
        , coalesce(i.fracionador, nullif(p.fracionador, 0), 1)
        , coalesce(i.unidade_fracao, p.codunidade_fracionada)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque_vd
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque_vd  = Case when :Movimentar = 1 then (:estoque_vd - :Quantidade) else :estoque_vd end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :estoque_vd
      where (p.Cod  = :Produto);

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
      )) then
      begin

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade * :fracionador     -- Informando a quantidade fracionada
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador  -- Informando o custo medio fracionado
        );

      end
      else
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
          , ea.fracionador
          , ea.custo_medio
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            estoque_cc
          , fracionador_cc
          , custo_cc;

        -- Calcular o Custo Medio (Fracionado) para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        custo_cc       = coalesce(:custo_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = :estoque_cc + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                               -- Informando o custo medio fracionado anteriormente
          , ea.unidade     = :unidade_cns
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote;

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
        , new.ano || '/' || new.controle
        , Trim('SAIDA - APROPRIACAO DE ESTOQUE ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :estoque_vd + :Quantidade
        , :Quantidade
        , :estoque_vd
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 13/11/2015 13:31:22 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque_vd     DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable fracionador_cc DMN_PERCENTUAL_3;
  declare variable unidade_cns    DMN_SMALLINT_N;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0)
        , coalesce(nullif(i.custo_unitario, 0.0), p.customedio, 0.0)
        , coalesce(i.fracionador, nullif(p.fracionador, 0), 1)
        , coalesce(i.unidade_fracao, p.codunidade_fracionada)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque_vd
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque_vd  = Case when :Movimentar = 1 then (:estoque_vd - :Quantidade) else :estoque_vd end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :estoque_vd
      where (p.Cod  = :Produto);

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
      )) then
      begin

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade_frc                -- Informando a quantidade fracionada
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador  -- Informando o custo medio fracionado
        );

      end
      else
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
          , ea.fracionador
          , ea.custo_medio
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            estoque_cc
          , fracionador_cc
          , custo_cc;

        -- Calcular o Custo Medio (Fracionado) para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        custo_cc       = coalesce(:custo_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = :estoque_cc + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                               -- Informando o custo medio fracionado anteriormente
          , ea.unidade     = :unidade_cns
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote;

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
        , new.ano || '/' || new.controle
        , Trim('SAIDA - APROPRIACAO DE ESTOQUE ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :estoque_vd + :Quantidade
        , :Quantidade
        , :estoque_vd
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 13/11/2015 13:33:25 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque_vd     DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable fracionador_cc DMN_PERCENTUAL_3;
  declare variable unidade_cns    DMN_SMALLINT_N;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0)
        , coalesce(nullif(i.custo_unitario, 0.0), p.customedio, 0.0)
        , coalesce(i.fracionador, nullif(p.fracionador, 0), 1)
        , coalesce(i.unidade_fracao, p.codunidade_fracionada)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque_vd
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque_vd  = Case when :Movimentar = 1 then (:estoque_vd - :Quantidade) else :estoque_vd end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :estoque_vd
      where (p.Cod  = :Produto);

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
      )) then
      begin

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade_frc                -- Informando a quantidade fracionada
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador  -- Informando o custo medio fracionado
        );

      end
      else
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
          , ea.fracionador
          , ea.custo_medio
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            estoque_cc
          , fracionador_cc
          , custo_cc;

        -- Calcular o Custo Medio (Fracionado) para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        custo_cc       = coalesce(:custo_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            --ea.qtde        = :estoque_cc + (:quantidade * :fracionador) -- Informando a quantidade fracionada
            ea.qtde        = :estoque_cc + :quantidade_frc -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                  -- Informando o custo medio fracionado anteriormente
          , ea.unidade     = :unidade_cns
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote;

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
        , new.ano || '/' || new.controle
        , Trim('SAIDA - APROPRIACAO DE ESTOQUE ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :estoque_vd + :Quantidade
        , :Quantidade
        , :estoque_vd
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 13/11/2015 13:40:34 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque        DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable estoque_cc_frc DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 3) ) then /* Cancelada */
  begin

    empresa      = new.empresa;
    centro_custo = new.centro_custo;

    -- Retornar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;
      lote    = 0;

      -- Retornar estoque geral
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where (p.Cod = :Produto);

      -- Retirar apropriacao das quantidades em estoque da Empresa/Centro de Custo
      Select
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1) -- Recuperando a quantidade fracionada transformada em inteira
        , ea.qtde
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc     -- Quantidade Inteira
        , estoque_cc_frc -- Quantidade Fracionada
        , fracionador;   -- Fracionador

      estoque_cc     = coalesce(:estoque_cc, 0.0) - :quantidade;
      estoque_cc_frc = coalesce(:estoque_cc_frc, 0.0) - :quantidade_frc;

      Update TBESTOQUE_ALMOX ea Set
          --ea.qtde  = :estoque_cc * :fracionador -- Devolvendo a quantidade fracionada atualizada
          ea.qtde  = :estoque_cc_frc -- Devolvendo a quantidade fracionada atualizada
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;

      -- Remover registro de estoque apropriadado com quantidade zerada
      Delete from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
        and ea.qtde         = 0;

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
        , new.ano || '/' || new.controle
        , Trim('ENTRADA - APROPRIACAO CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , 'Valor de Custo (R$) fixado no cadastro do produto.'
      );

    end

  end
end^

SET TERM ; ^



/*------ 13/11/2015 15:12:07 --------*/

CREATE INDEX IDX_TBESTOQUE_ALMOX_QTDE
ON TBESTOQUE_ALMOX (QTDE);


/*------ SYSDBA 17/11/2015 23:20:04 --------*/

CREATE OR ALTER VIEW VW_PRODUTO_DEMANDA_ANUAL_IND(
    EMPRESA_CNPJ,
    EMPRESA_RAZAO,
    TIPO,
    TIPO_DESC,
    COD,
    COD_X,
    DESCRI,
    APRESENTACAO,
    DESCRI_APRESENTACAO,
    MODELO,
    REFERENCIA,
    GRUPO_COD,
    GRUPO_DESC,
    SECAO_COD,
    SECAO_DESC,
    FABRICANTE_COD,
    FABRICANTE_NOME,
    ESPECIFICACAO,
    UND_COMPRA,
    VALOR_CUSTOMEDIO,
    VALOR_VENDA,
    PERCENTUAL_MARCKUP,
    PERCENTUAL_MARGEM,
    COMPOR_FATURAMENTO,
    PRODUTO_NOVO,
    MOVIMENTA_ESTOQUE,
    ESTOQUE_MINIMO,
    ESTOQUE,
    ESTOQUE_ALMOX,
    ANO,
    CJAN,
    VJAN,
    AJAN,
    SJAN,
    CFEV,
    VFEV,
    AFEV,
    SFEV,
    CMAR,
    VMAR,
    AMAR,
    SMAR,
    CABR,
    VABR,
    AABR,
    SABR,
    CMAI,
    VMAI,
    AMAI,
    SMAI,
    CJUN,
    VJUN,
    AJUN,
    SJUN,
    CJUL,
    VJUL,
    AJUL,
    SJUL,
    CAGO,
    VAGO,
    AAGO,
    SAGO,
    CSET,
    VSET,
    ASET,
    SSET,
    COUT,
    VOUT,
    AOUT,
    SOUT,
    CNOV,
    VNOV,
    ANOV,
    SNOV,
    CDEZ,
    VDEZ,
    ADEZ,
    SDEZ)
AS
Select
    p.codemp as empresa_cnpj
  , e.rzsoc  as empresa_razao
  , case when p.aliquota_tipo = 0 then 'P' else 'S' end as tipo
  , case when p.aliquota_tipo = 0 then 'Produto(s)' else 'Serviço(s)' end as tipo_desc
  , p.cod
  , coalesce(pc.item, pv.item, pa.item) as cod_x
  , p.descri
  , p.apresentacao
  , p.descri_apresentacao
  , p.modelo
  , p.referencia
  , coalesce(p.codgrupo, 0) as grupo_cod
  , coalesce(g.descri, '* Indefinido')   as grupo_desc
  , coalesce(p.codsecao, 0)                     as secao_cod
  , coalesce(s.scp_descricao, '* Indefinida')   as secao_desc
  , coalesce(p.codfabricante, 0)     as fabricante_cod
  , coalesce(f.nome, '* Indefinido') as fabricante_nome
  , p.especificacao
  , substring(coalesce(nullif(trim(u.unp_sigla), ''), trim(u.unp_descricao)) from 1 for 3) as und_compra
  , p.customedio as valor_customedio
  , p.preco      as valor_venda

  , p.percentual_marckup
  , p.percentual_margem
  , p.compor_faturamento
  , p.produto_novo
  , p.movimenta_estoque

  , p.estoqmin as estoque_minimo
  , p.qtde     as estoque
  , coalesce(pe.estoque_almox, 0) as estoque_almox

  , coalesce(pc.ano, pv.ano, pa.ano) as ano

  , coalesce(pc.jan, 0.0) as cjan
  , coalesce(pv.jan, 0.0) as vjan
  , coalesce(pa.jan, 0.0) as ajan
  , coalesce(pc.jan, 0.0) - coalesce(pv.jan, 0.0) + coalesce(pa.jan, 0.0) as sjan

  , coalesce(pc.fev, 0.0) as cfev
  , coalesce(pv.fev, 0.0) as vfev
  , coalesce(pa.fev, 0.0) as afev
  , coalesce(pc.fev, 0.0) - coalesce(pv.fev, 0.0) + coalesce(pa.fev, 0.0) as sfev

  , coalesce(pc.mar, 0.0) as cmar
  , coalesce(pv.mar, 0.0) as vmar
  , coalesce(pa.mar, 0.0) as amar
  , coalesce(pc.mar, 0.0) - coalesce(pv.mar, 0.0) + coalesce(pa.mar, 0.0) as smar

  , coalesce(pc.abr, 0.0) as cabr
  , coalesce(pv.abr, 0.0) as vabr
  , coalesce(pa.abr, 0.0) as aabr
  , coalesce(pc.abr, 0.0) - coalesce(pv.abr, 0.0) + coalesce(pa.abr, 0.0) as sabr

  , coalesce(pc.mai, 0.0) as cmai
  , coalesce(pv.mai, 0.0) as vmai
  , coalesce(pa.mai, 0.0) as amai
  , coalesce(pc.mai, 0.0) - coalesce(pv.mai, 0.0) + coalesce(pa.mai, 0.0) as smai

  , coalesce(pc.jun, 0.0) as cjun
  , coalesce(pv.jun, 0.0) as vjun
  , coalesce(pa.jun, 0.0) as ajun
  , coalesce(pc.jun, 0.0) - coalesce(pv.jun, 0.0) + coalesce(pa.jun, 0.0) as sjun

  , coalesce(pc.jul, 0.0) as cjul
  , coalesce(pv.jul, 0.0) as vjul
  , coalesce(pa.jul, 0.0) as ajul
  , coalesce(pc.jul, 0.0) - coalesce(pv.jul, 0.0) + coalesce(pa.jul, 0.0) as sjul

  , coalesce(pc.ago, 0.0) as cago
  , coalesce(pv.ago, 0.0) as vago
  , coalesce(pa.ago, 0.0) as aago
  , coalesce(pc.ago, 0.0) - coalesce(pv.ago, 0.0) + coalesce(pa.ago, 0.0) as sago

  , coalesce(pc.se, 0.0)  as cset
  , coalesce(pv.se, 0.0)  as vset
  , coalesce(pa.se, 0.0)  as aset
  , coalesce(pc.se, 0.0) - coalesce(pv.se, 0.0) + coalesce(pa.se, 0.0) as sset

  , coalesce(pc.out, 0.0) as cout
  , coalesce(pv.out, 0.0) as vout
  , coalesce(pa.out, 0.0) as aout
  , coalesce(pc.out, 0.0) - coalesce(pv.out, 0.0) + coalesce(pa.out, 0.0) as sout

  , coalesce(pc.nov, 0.0) as cnov
  , coalesce(pv.nov, 0.0) as vnov
  , coalesce(pa.nov, 0.0) as anov
  , coalesce(pc.nov, 0.0) - coalesce(pv.nov, 0.0) + coalesce(pa.nov, 0.0) as snov

  , coalesce(pc.dez, 0.0) as cdez
  , coalesce(pv.dez, 0.0) as vdez
  , coalesce(pa.dez, 0.0) as adez
  , coalesce(pc.dez, 0.0) - coalesce(pv.dez, 0.0) + coalesce(pa.dez, 0.0) as sdez
from TBEMPRESA e

  /* Compras */
  left join (

    select
        ci.codprod as item
      , ci.codemp as empresa
      , extract(year from ci.dtent) as ano
      , sum(case when extract(month from ci.dtent) = 1 then ci.qtde else 0 end) as JAN
      , sum(case when extract(month from ci.dtent) = 2 then ci.qtde else 0 end) as FEV
      , sum(case when extract(month from ci.dtent) = 3 then ci.qtde else 0 end) as MAR
      , sum(case when extract(month from ci.dtent) = 4 then ci.qtde else 0 end) as ABR
      , sum(case when extract(month from ci.dtent) = 5 then ci.qtde else 0 end) as MAI
      , sum(case when extract(month from ci.dtent) = 6 then ci.qtde else 0 end) as JUN
      , sum(case when extract(month from ci.dtent) = 7 then ci.qtde else 0 end) as JUL
      , sum(case when extract(month from ci.dtent) = 8 then ci.qtde else 0 end) as AGO
      , sum(case when extract(month from ci.dtent) = 9 then ci.qtde else 0 end) as SE
      , sum(case when extract(month from ci.dtent) = 10 then ci.qtde else 0 end) as OUT
      , sum(case when extract(month from ci.dtent) = 11 then ci.qtde else 0 end) as NOV
      , sum(case when extract(month from ci.dtent) = 12 then ci.qtde else 0 end) as DEZ
    from TBCOMPRAS c
      inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
    where c.status in (2,4)
    group by
        ci.codprod
      , ci.codemp
      , extract(year from ci.dtent)

  ) PC on (pc.empresa = e.cnpj)

  /* Estoque Almoxarifado */
  left join (

    Select
        e.produto as item
      , e.empresa
      , sum( e.qtde / coalesce(nullif(e.fracionador, 0), 1) ) as estoque_almox
    from TBESTOQUE_ALMOX e
      inner join TBCENTRO_CUSTO c on (c.codigo = e.centro_custo and c.codcliente is null)
    where e.qtde > 0
    group by
        e.produto
      , e.empresa

  ) PE on (pe.empresa = e.cnpj and pe.item = pc.item)

  /* Vendas */
  left join (

    select
        vi.codprod as item
      , vi.codemp as empresa
      , extract(year from vi.dtvenda) as ano
      , sum(case when extract(month from vi.dtvenda) = 1 then vi.qtde else 0 end) as JAN,
              sum(case when extract(month from vi.dtvenda) = 2 then vi.qtde else 0 end) as FEV,
              sum(case when extract(month from vi.dtvenda) = 3 then vi.qtde else 0 end) as MAR,
              sum(case when extract(month from vi.dtvenda) = 4 then vi.qtde else 0 end) as ABR,
              sum(case when extract(month from vi.dtvenda) = 5 then vi.qtde else 0 end) as MAI,
              sum(case when extract(month from vi.dtvenda) = 6 then vi.qtde else 0 end) as JUN,
              sum(case when extract(month from vi.dtvenda) = 7 then vi.qtde else 0 end) as JUL,
              sum(case when extract(month from vi.dtvenda) = 8 then vi.qtde else 0 end) as AGO,
              sum(case when extract(month from vi.dtvenda) = 9 then vi.qtde else 0 end) as SE,
              sum(case when extract(month from vi.dtvenda) = 10 then vi.qtde else 0 end) as OUT,
              sum(case when extract(month from vi.dtvenda) = 11 then vi.qtde else 0 end) as NOV,
              sum(case when extract(month from vi.dtvenda) = 12 then vi.qtde else 0 end) as DEZ
    from TBVENDAS v
      inner join TVENDASITENS vi on (v.ano = vi.ano and v.codcontrol = vi.codcontrol and v.codemp = vi.codemp)
    where v.status in (3, 4)
    group by
        vi.codprod
      , vi.codemp
      , extract(year from vi.dtvenda)

  ) PV on (pv.empresa = e.cnpj and pv.item = pc.item and pv.ano = pc.ano)

  /* Ajustes */
  left join (

    select
        a.codprod as item
      , a.codempresa as empresa
      , extract(year from a.dtajust) as ano
      , sum(case when extract(month from a.dtajust) = 1 then a.qtdeatual else 0 end) as JAN,
        sum(case when extract(month from a.dtajust) = 2 then a.qtdeatual else 0 end) as FEV,
        sum(case when extract(month from a.dtajust) = 3 then a.qtdeatual else 0 end) as MAR,
        sum(case when extract(month from a.dtajust) = 4 then a.qtdeatual else 0 end) as ABR,
        sum(case when extract(month from a.dtajust) = 5 then a.qtdeatual else 0 end) as MAI,
        sum(case when extract(month from a.dtajust) = 6 then a.qtdeatual else 0 end) as JUN,
        sum(case when extract(month from a.dtajust) = 7 then a.qtdeatual else 0 end) as JUL,
        sum(case when extract(month from a.dtajust) = 8 then a.qtdeatual else 0 end) as AGO,
        sum(case when extract(month from a.dtajust) = 9 then a.qtdeatual else 0 end) as SE,
        sum(case when extract(month from a.dtajust) = 10 then a.qtdeatual else 0 end) as OUT,
        sum(case when extract(month from a.dtajust) = 11 then a.qtdeatual else 0 end) as NOV,
        sum(case when extract(month from a.dtajust) = 12 then a.qtdeatual else 0 end) as DEZ
    from TBAJUSTESTOQ a
    group by
        a.codprod
      , a.codempresa
      , extract(year from a.dtajust)

  ) PA on (pa.empresa = e.cnpj and pa.item = pc.item and pa.ano = pc.ano)

  inner join TBPRODUTO p on (p.cod = coalesce(pv.item, pc.item, pa.item))

  left join TBGRUPOPROD g on (g.cod = p.codgrupo)
  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)
  left join TBFABRICANTE f on (f.cod = p.codfabricante)
  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)

order by
    e.rzsoc
  , p.aliquota_tipo
  , coalesce(g.descri, '* Indefinido')
  , coalesce(f.nome, '* Indefinido')
  , p.descri_apresentacao
  , coalesce(pc.ano, pv.ano, pa.ano);




/*------ SYSDBA 17/11/2015 23:21:03 --------*/

CREATE OR ALTER VIEW VW_PRODUTO_DEMANDA_ANUAL(
    EMPRESA_CNPJ,
    EMPRESA_RAZAO,
    TIPO,
    TIPO_DESC,
    COD,
    COD_X,
    DESCRI,
    APRESENTACAO,
    DESCRI_APRESENTACAO,
    MODELO,
    REFERENCIA,
    GRUPO_COD,
    GRUPO_DESC,
    SECAO_COD,
    SECAO_DESC,
    FABRICANTE_COD,
    FABRICANTE_NOME,
    ESPECIFICACAO,
    UND_COMPRA,
    VALOR_CUSTOMEDIO,
    VALOR_VENDA,
    PERCENTUAL_MARCKUP,
    PERCENTUAL_MARGEM,
    COMPOR_FATURAMENTO,
    PRODUTO_NOVO,
    MOVIMENTA_ESTOQUE,
    ESTOQUE_MINIMO,
    ESTOQUE,
    ESTOQUE_ALMOX,
    ANO,
    CJAN,
    VJAN,
    AJAN,
    SJAN,
    CFEV,
    VFEV,
    AFEV,
    SFEV,
    CMAR,
    VMAR,
    AMAR,
    SMAR,
    CABR,
    VABR,
    AABR,
    SABR,
    CMAI,
    VMAI,
    AMAI,
    SMAI,
    CJUN,
    VJUN,
    AJUN,
    SJUN,
    CJUL,
    VJUL,
    AJUL,
    SJUL,
    CAGO,
    VAGO,
    AAGO,
    SAGO,
    CSET,
    VSET,
    ASET,
    SSET,
    COUT,
    VOUT,
    AOUT,
    SOUT,
    CNOV,
    VNOV,
    ANOV,
    SNOV,
    CDEZ,
    VDEZ,
    ADEZ,
    SDEZ)
AS
Select
    p.codemp as empresa_cnpj
  , e.rzsoc  as empresa_razao
  , case when p.aliquota_tipo = 0 then 'P' else 'S' end as tipo
  , case when p.aliquota_tipo = 0 then 'Produto(s)' else 'Serviço(s)' end as tipo_desc
  , p.cod
  , coalesce(pc.item, pv.item, pa.item) as cod_x
  , p.descri
  , p.apresentacao
  , p.descri_apresentacao
  , p.modelo
  , p.referencia
  , coalesce(p.codgrupo, 0) as grupo_cod
  , coalesce(g.descri, '* Indefinido')   as grupo_desc
  , coalesce(p.codsecao, 0)                     as secao_cod
  , coalesce(s.scp_descricao, '* Indefinida')   as secao_desc
  , coalesce(p.codfabricante, 0)     as fabricante_cod
  , coalesce(f.nome, '* Indefinido') as fabricante_nome
  , p.especificacao
  , substring(coalesce(nullif(trim(u.unp_sigla), ''), trim(u.unp_descricao)) from 1 for 3) as und_compra
  , p.customedio as valor_customedio
  , p.preco      as valor_venda

  , p.percentual_marckup
  , p.percentual_margem
  , p.compor_faturamento
  , p.produto_novo
  , p.movimenta_estoque

  , p.estoqmin as estoque_minimo
  , p.qtde     as estoque
  , coalesce(pe.estoque_almox, 0) as estoque_almox

  , coalesce(pc.ano, pv.ano, pa.ano) as ano

  , coalesce(pc.jan, 0.0) as cjan
  , coalesce(pv.jan, 0.0) as vjan
  , coalesce(pa.jan, 0.0) as ajan
  , coalesce(pc.jan, 0.0) - coalesce(pv.jan, 0.0) + coalesce(pa.jan, 0.0) as sjan

  , coalesce(pc.fev, 0.0) as cfev
  , coalesce(pv.fev, 0.0) as vfev
  , coalesce(pa.fev, 0.0) as afev
  , coalesce(pc.fev, 0.0) - coalesce(pv.fev, 0.0) + coalesce(pa.fev, 0.0) as sfev

  , coalesce(pc.mar, 0.0) as cmar
  , coalesce(pv.mar, 0.0) as vmar
  , coalesce(pa.mar, 0.0) as amar
  , coalesce(pc.mar, 0.0) - coalesce(pv.mar, 0.0) + coalesce(pa.mar, 0.0) as smar

  , coalesce(pc.abr, 0.0) as cabr
  , coalesce(pv.abr, 0.0) as vabr
  , coalesce(pa.abr, 0.0) as aabr
  , coalesce(pc.abr, 0.0) - coalesce(pv.abr, 0.0) + coalesce(pa.abr, 0.0) as sabr

  , coalesce(pc.mai, 0.0) as cmai
  , coalesce(pv.mai, 0.0) as vmai
  , coalesce(pa.mai, 0.0) as amai
  , coalesce(pc.mai, 0.0) - coalesce(pv.mai, 0.0) + coalesce(pa.mai, 0.0) as smai

  , coalesce(pc.jun, 0.0) as cjun
  , coalesce(pv.jun, 0.0) as vjun
  , coalesce(pa.jun, 0.0) as ajun
  , coalesce(pc.jun, 0.0) - coalesce(pv.jun, 0.0) + coalesce(pa.jun, 0.0) as sjun

  , coalesce(pc.jul, 0.0) as cjul
  , coalesce(pv.jul, 0.0) as vjul
  , coalesce(pa.jul, 0.0) as ajul
  , coalesce(pc.jul, 0.0) - coalesce(pv.jul, 0.0) + coalesce(pa.jul, 0.0) as sjul

  , coalesce(pc.ago, 0.0) as cago
  , coalesce(pv.ago, 0.0) as vago
  , coalesce(pa.ago, 0.0) as aago
  , coalesce(pc.ago, 0.0) - coalesce(pv.ago, 0.0) + coalesce(pa.ago, 0.0) as sago

  , coalesce(pc.se, 0.0)  as cset
  , coalesce(pv.se, 0.0)  as vset
  , coalesce(pa.se, 0.0)  as aset
  , coalesce(pc.se, 0.0) - coalesce(pv.se, 0.0) + coalesce(pa.se, 0.0) as sset

  , coalesce(pc.out, 0.0) as cout
  , coalesce(pv.out, 0.0) as vout
  , coalesce(pa.out, 0.0) as aout
  , coalesce(pc.out, 0.0) - coalesce(pv.out, 0.0) + coalesce(pa.out, 0.0) as sout

  , coalesce(pc.nov, 0.0) as cnov
  , coalesce(pv.nov, 0.0) as vnov
  , coalesce(pa.nov, 0.0) as anov
  , coalesce(pc.nov, 0.0) - coalesce(pv.nov, 0.0) + coalesce(pa.nov, 0.0) as snov

  , coalesce(pc.dez, 0.0) as cdez
  , coalesce(pv.dez, 0.0) as vdez
  , coalesce(pa.dez, 0.0) as adez
  , coalesce(pc.dez, 0.0) - coalesce(pv.dez, 0.0) + coalesce(pa.dez, 0.0) as sdez
from TBEMPRESA e

  /* Vendas */
  left join (

    select
        vi.codprod as item
      , vi.codemp as empresa
      , extract(year from vi.dtvenda) as ano
      , sum(case when extract(month from vi.dtvenda) = 1 then vi.qtde else 0 end) as JAN,
              sum(case when extract(month from vi.dtvenda) = 2 then vi.qtde else 0 end) as FEV,
              sum(case when extract(month from vi.dtvenda) = 3 then vi.qtde else 0 end) as MAR,
              sum(case when extract(month from vi.dtvenda) = 4 then vi.qtde else 0 end) as ABR,
              sum(case when extract(month from vi.dtvenda) = 5 then vi.qtde else 0 end) as MAI,
              sum(case when extract(month from vi.dtvenda) = 6 then vi.qtde else 0 end) as JUN,
              sum(case when extract(month from vi.dtvenda) = 7 then vi.qtde else 0 end) as JUL,
              sum(case when extract(month from vi.dtvenda) = 8 then vi.qtde else 0 end) as AGO,
              sum(case when extract(month from vi.dtvenda) = 9 then vi.qtde else 0 end) as SE,
              sum(case when extract(month from vi.dtvenda) = 10 then vi.qtde else 0 end) as OUT,
              sum(case when extract(month from vi.dtvenda) = 11 then vi.qtde else 0 end) as NOV,
              sum(case when extract(month from vi.dtvenda) = 12 then vi.qtde else 0 end) as DEZ
    from TBVENDAS v
      inner join TVENDASITENS vi on (v.ano = vi.ano and v.codcontrol = vi.codcontrol and v.codemp = vi.codemp)
    where v.status in (3, 4)
    group by
        vi.codprod
      , vi.codemp
      , extract(year from vi.dtvenda)

  ) PV on (pv.empresa = e.cnpj)

  /* Compras */
  left join (

    select
        ci.codprod as item
      , ci.codemp as empresa
      , extract(year from ci.dtent) as ano
      , sum(case when extract(month from ci.dtent) = 1 then ci.qtde else 0 end) as JAN
      , sum(case when extract(month from ci.dtent) = 2 then ci.qtde else 0 end) as FEV
      , sum(case when extract(month from ci.dtent) = 3 then ci.qtde else 0 end) as MAR
      , sum(case when extract(month from ci.dtent) = 4 then ci.qtde else 0 end) as ABR
      , sum(case when extract(month from ci.dtent) = 5 then ci.qtde else 0 end) as MAI
      , sum(case when extract(month from ci.dtent) = 6 then ci.qtde else 0 end) as JUN
      , sum(case when extract(month from ci.dtent) = 7 then ci.qtde else 0 end) as JUL
      , sum(case when extract(month from ci.dtent) = 8 then ci.qtde else 0 end) as AGO
      , sum(case when extract(month from ci.dtent) = 9 then ci.qtde else 0 end) as SE
      , sum(case when extract(month from ci.dtent) = 10 then ci.qtde else 0 end) as OUT
      , sum(case when extract(month from ci.dtent) = 11 then ci.qtde else 0 end) as NOV
      , sum(case when extract(month from ci.dtent) = 12 then ci.qtde else 0 end) as DEZ
    from TBCOMPRAS c
      inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
    where c.status in (2,4)
    group by
        ci.codprod
      , ci.codemp
      , extract(year from ci.dtent)

  ) PC on (pc.empresa = e.cnpj and pc.item = pv.item and pc.ano = pv.ano)

  /* Estoque Almoxarifado */
  left join (

    Select
        e.produto as item
      , e.empresa
      , sum( e.qtde / coalesce(nullif(e.fracionador, 0), 1) ) as estoque_almox
    from TBESTOQUE_ALMOX e
      inner join TBCENTRO_CUSTO c on (c.codigo = e.centro_custo and c.codcliente is null)
    where e.qtde > 0
    group by
        e.produto
      , e.empresa

  ) PE on (pe.empresa = e.cnpj and pe.item = pc.item)

  /* Ajustes */
  left join (

    select
        a.codprod as item
      , a.codempresa as empresa
      , extract(year from a.dtajust) as ano
      , sum(case when extract(month from a.dtajust) = 1 then a.qtdeatual else 0 end) as JAN,
        sum(case when extract(month from a.dtajust) = 2 then a.qtdeatual else 0 end) as FEV,
        sum(case when extract(month from a.dtajust) = 3 then a.qtdeatual else 0 end) as MAR,
        sum(case when extract(month from a.dtajust) = 4 then a.qtdeatual else 0 end) as ABR,
        sum(case when extract(month from a.dtajust) = 5 then a.qtdeatual else 0 end) as MAI,
        sum(case when extract(month from a.dtajust) = 6 then a.qtdeatual else 0 end) as JUN,
        sum(case when extract(month from a.dtajust) = 7 then a.qtdeatual else 0 end) as JUL,
        sum(case when extract(month from a.dtajust) = 8 then a.qtdeatual else 0 end) as AGO,
        sum(case when extract(month from a.dtajust) = 9 then a.qtdeatual else 0 end) as SE,
        sum(case when extract(month from a.dtajust) = 10 then a.qtdeatual else 0 end) as OUT,
        sum(case when extract(month from a.dtajust) = 11 then a.qtdeatual else 0 end) as NOV,
        sum(case when extract(month from a.dtajust) = 12 then a.qtdeatual else 0 end) as DEZ
    from TBAJUSTESTOQ a
    group by
        a.codprod
      , a.codempresa
      , extract(year from a.dtajust)

  ) PA on (pa.empresa = e.cnpj and pa.item = pv.item and pa.ano = pv.ano)

  inner join TBPRODUTO p on (p.cod = coalesce(pv.item, pc.item, pa.item))

  left join TBGRUPOPROD g on (g.cod = p.codgrupo)
  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)
  left join TBFABRICANTE f on (f.cod = p.codfabricante)
  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)

order by
    e.rzsoc
  , p.aliquota_tipo
  , coalesce(g.descri, '* Indefinido')
  , coalesce(f.nome, '* Indefinido')
  , p.descri_apresentacao
  , coalesce(pc.ano, pv.ano, pa.ano)
;




/*------ SYSDBA 18/11/2015 17:23:29 --------*/

CREATE OR ALTER VIEW VW_PRODUTO_DEMANDA_ANUAL_IND(
    EMPRESA_CNPJ,
    EMPRESA_RAZAO,
    TIPO,
    TIPO_DESC,
    COD,
    COD_X,
    DESCRI,
    APRESENTACAO,
    DESCRI_APRESENTACAO,
    MODELO,
    REFERENCIA,
    GRUPO_COD,
    GRUPO_DESC,
    SECAO_COD,
    SECAO_DESC,
    FABRICANTE_COD,
    FABRICANTE_NOME,
    ESPECIFICACAO,
    UND_COMPRA,
    VALOR_CUSTOMEDIO,
    VALOR_VENDA,
    PERCENTUAL_MARCKUP,
    PERCENTUAL_MARGEM,
    COMPOR_FATURAMENTO,
    PRODUTO_NOVO,
    MOVIMENTA_ESTOQUE,
    ESTOQUE_MINIMO,
    ESTOQUE,
    ESTOQUE_ALMOX,
    ANO,
    CJAN,
    ACJAN,
    VJAN,
    AJAN,
    SJAN,
    CFEV,
    ACFEV,
    VFEV,
    AFEV,
    SFEV,
    CMAR,
    ACMAR,
    VMAR,
    AMAR,
    SMAR,
    CABR,
    ACABR,
    VABR,
    AABR,
    SABR,
    CMAI,
    ACMAI,
    VMAI,
    AMAI,
    SMAI,
    CJUN,
    ACJUN,
    VJUN,
    AJUN,
    SJUN,
    CJUL,
    ACJUL,
    VJUL,
    AJUL,
    SJUL,
    CAGO,
    ACAGO,
    VAGO,
    AAGO,
    SAGO,
    CSET,
    ACSET,
    VSET,
    ASET,
    SSET,
    COUT,
    ACOUT,
    VOUT,
    AOUT,
    SOUT,
    CNOV,
    ACNOV,
    VNOV,
    ANOV,
    SNOV,
    CDEZ,
    ACDEZ,
    VDEZ,
    ADEZ,
    SDEZ)
AS
Select
    p.codemp as empresa_cnpj
  , e.rzsoc  as empresa_razao
  , case when p.aliquota_tipo = 0 then 'P' else 'S' end as tipo
  , case when p.aliquota_tipo = 0 then 'Produto(s)' else 'Serviço(s)' end as tipo_desc
  , p.cod
  , coalesce(pc.item, pv.item, pa.item) as cod_x
  , p.descri
  , p.apresentacao
  , p.descri_apresentacao
  , p.modelo
  , p.referencia
  , coalesce(p.codgrupo, 0) as grupo_cod
  , coalesce(g.descri, '* Indefinido')   as grupo_desc
  , coalesce(p.codsecao, 0)                     as secao_cod
  , coalesce(s.scp_descricao, '* Indefinida')   as secao_desc
  , coalesce(p.codfabricante, 0)     as fabricante_cod
  , coalesce(f.nome, '* Indefinido') as fabricante_nome
  , p.especificacao
  , substring(coalesce(nullif(trim(u.unp_sigla), ''), trim(u.unp_descricao)) from 1 for 3) as und_compra
  , p.customedio as valor_customedio
  , p.preco      as valor_venda

  , p.percentual_marckup
  , p.percentual_margem
  , p.compor_faturamento
  , p.produto_novo
  , p.movimenta_estoque

  , p.estoqmin as estoque_minimo
  , p.qtde     as estoque
  , coalesce(pe.estoque_almox, 0) as estoque_almox

  , coalesce(pc.ano, pv.ano, pa.ano) as ano

  , coalesce(pc.jan, 0.0)  as cjan
  , coalesce(pac.jan, 0.0) as acjan
  , coalesce(pv.jan, 0.0) as vjan
  , coalesce(pa.jan, 0.0) as ajan
  , coalesce(pc.jan, 0.0) - coalesce(pv.jan, 0.0) + coalesce(pa.jan, 0.0) as sjan

  , coalesce(pc.fev, 0.0)  as cfev
  , coalesce(pac.fev, 0.0) as acfev
  , coalesce(pv.fev, 0.0) as vfev
  , coalesce(pa.fev, 0.0) as afev
  , coalesce(pc.fev, 0.0) - coalesce(pv.fev, 0.0) + coalesce(pa.fev, 0.0) as sfev

  , coalesce(pc.mar, 0.0)  as cmar
  , coalesce(pac.mar, 0.0) as acmar
  , coalesce(pv.mar, 0.0) as vmar
  , coalesce(pa.mar, 0.0) as amar
  , coalesce(pc.mar, 0.0) - coalesce(pv.mar, 0.0) + coalesce(pa.mar, 0.0) as smar

  , coalesce(pc.abr, 0.0)  as cabr
  , coalesce(pac.abr, 0.0) as acabr
  , coalesce(pv.abr, 0.0) as vabr
  , coalesce(pa.abr, 0.0) as aabr
  , coalesce(pc.abr, 0.0) - coalesce(pv.abr, 0.0) + coalesce(pa.abr, 0.0) as sabr

  , coalesce(pc.mai, 0.0)  as cmai
  , coalesce(pac.mai, 0.0) as acmai
  , coalesce(pv.mai, 0.0) as vmai
  , coalesce(pa.mai, 0.0) as amai
  , coalesce(pc.mai, 0.0) - coalesce(pv.mai, 0.0) + coalesce(pa.mai, 0.0) as smai

  , coalesce(pc.jun, 0.0)  as cjun
  , coalesce(pac.jun, 0.0) as acjun
  , coalesce(pv.jun, 0.0) as vjun
  , coalesce(pa.jun, 0.0) as ajun
  , coalesce(pc.jun, 0.0) - coalesce(pv.jun, 0.0) + coalesce(pa.jun, 0.0) as sjun

  , coalesce(pc.jul, 0.0)  as cjul
  , coalesce(pac.jul, 0.0) as acjul
  , coalesce(pv.jul, 0.0) as vjul
  , coalesce(pa.jul, 0.0) as ajul
  , coalesce(pc.jul, 0.0) - coalesce(pv.jul, 0.0) + coalesce(pa.jul, 0.0) as sjul

  , coalesce(pc.ago, 0.0)  as cago
  , coalesce(pac.ago, 0.0) as acago
  , coalesce(pv.ago, 0.0) as vago
  , coalesce(pa.ago, 0.0) as aago
  , coalesce(pc.ago, 0.0) - coalesce(pv.ago, 0.0) + coalesce(pa.ago, 0.0) as sago

  , coalesce(pc.se, 0.0)   as cset
  , coalesce(pac.se, 0.0)  as acset
  , coalesce(pv.se, 0.0)  as vset
  , coalesce(pa.se, 0.0)  as aset
  , coalesce(pc.se, 0.0) - coalesce(pv.se, 0.0) + coalesce(pa.se, 0.0) as sset

  , coalesce(pc.out, 0.0)  as cout
  , coalesce(pac.out, 0.0) as acout
  , coalesce(pv.out, 0.0) as vout
  , coalesce(pa.out, 0.0) as aout
  , coalesce(pc.out, 0.0) - coalesce(pv.out, 0.0) + coalesce(pa.out, 0.0) as sout

  , coalesce(pc.nov, 0.0)  as cnov
  , coalesce(pac.nov, 0.0) as acnov
  , coalesce(pv.nov, 0.0) as vnov
  , coalesce(pa.nov, 0.0) as anov
  , coalesce(pc.nov, 0.0) - coalesce(pv.nov, 0.0) + coalesce(pa.nov, 0.0) as snov

  , coalesce(pc.dez, 0.0)  as cdez
  , coalesce(pac.dez, 0.0) as acdez
  , coalesce(pv.dez, 0.0) as vdez
  , coalesce(pa.dez, 0.0) as adez
  , coalesce(pc.dez, 0.0) - coalesce(pv.dez, 0.0) + coalesce(pa.dez, 0.0) as sdez
from TBEMPRESA e

  /* Compras */
  left join (

    select
        ci.codprod as item
      , ci.codemp as empresa
      , extract(year from ci.dtent) as ano
      , sum(case when extract(month from ci.dtent) = 1 then ci.qtde else 0 end) as JAN
      , sum(case when extract(month from ci.dtent) = 2 then ci.qtde else 0 end) as FEV
      , sum(case when extract(month from ci.dtent) = 3 then ci.qtde else 0 end) as MAR
      , sum(case when extract(month from ci.dtent) = 4 then ci.qtde else 0 end) as ABR
      , sum(case when extract(month from ci.dtent) = 5 then ci.qtde else 0 end) as MAI
      , sum(case when extract(month from ci.dtent) = 6 then ci.qtde else 0 end) as JUN
      , sum(case when extract(month from ci.dtent) = 7 then ci.qtde else 0 end) as JUL
      , sum(case when extract(month from ci.dtent) = 8 then ci.qtde else 0 end) as AGO
      , sum(case when extract(month from ci.dtent) = 9 then ci.qtde else 0 end) as SE
      , sum(case when extract(month from ci.dtent) = 10 then ci.qtde else 0 end) as OUT
      , sum(case when extract(month from ci.dtent) = 11 then ci.qtde else 0 end) as NOV
      , sum(case when extract(month from ci.dtent) = 12 then ci.qtde else 0 end) as DEZ
    from TBCOMPRAS c
      inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
    where c.status in (2,4)
    group by
        ci.codprod
      , ci.codemp
      , extract(year from ci.dtent)

  ) PC on (pc.empresa = e.cnpj)

  /* Apropriacao de Estoque */
  left join (

    select
        ai.produto as item
      , ae.empresa
      , extract(year from ae.data_apropriacao) as ano
      , sum(case when extract(month from ae.data_apropriacao) = 1 then ai.qtde else 0 end) as JAN
      , sum(case when extract(month from ae.data_apropriacao) = 2 then ai.qtde else 0 end) as FEV
      , sum(case when extract(month from ae.data_apropriacao) = 3 then ai.qtde else 0 end) as MAR
      , sum(case when extract(month from ae.data_apropriacao) = 4 then ai.qtde else 0 end) as ABR
      , sum(case when extract(month from ae.data_apropriacao) = 5 then ai.qtde else 0 end) as MAI
      , sum(case when extract(month from ae.data_apropriacao) = 6 then ai.qtde else 0 end) as JUN
      , sum(case when extract(month from ae.data_apropriacao) = 7 then ai.qtde else 0 end) as JUL
      , sum(case when extract(month from ae.data_apropriacao) = 8 then ai.qtde else 0 end) as AGO
      , sum(case when extract(month from ae.data_apropriacao) = 9 then ai.qtde else 0 end) as SE
      , sum(case when extract(month from ae.data_apropriacao) = 10 then ai.qtde else 0 end) as OUT
      , sum(case when extract(month from ae.data_apropriacao) = 11 then ai.qtde else 0 end) as NOV
      , sum(case when extract(month from ae.data_apropriacao) = 12 then ai.qtde else 0 end) as DEZ
    from TBAPROPRIACAO_ALMOX ae
      inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = ae.ano and ai.controle = ae.controle)
    where ae.status = 2
    group by
        ai.produto
      , ae.empresa
      , extract(year from ae.data_apropriacao)

  ) PAC on (pac.empresa = e.cnpj and pac.item = pc.item)

  /* Estoque Almoxarifado */
  left join (

    Select
        e.produto as item
      , e.empresa
      , sum( e.qtde / coalesce(nullif(e.fracionador, 0), 1) ) as estoque_almox
    from TBESTOQUE_ALMOX e
      inner join TBCENTRO_CUSTO c on (c.codigo = e.centro_custo and c.codcliente is null)
    where e.qtde > 0
    group by
        e.produto
      , e.empresa

  ) PE on (pe.empresa = e.cnpj and pe.item = pc.item)

  /* Vendas */
  left join (

    select
        vi.codprod as item
      , vi.codemp as empresa
      , extract(year from vi.dtvenda) as ano
      , sum(case when extract(month from vi.dtvenda) = 1 then vi.qtde else 0 end) as JAN,
              sum(case when extract(month from vi.dtvenda) = 2 then vi.qtde else 0 end) as FEV,
              sum(case when extract(month from vi.dtvenda) = 3 then vi.qtde else 0 end) as MAR,
              sum(case when extract(month from vi.dtvenda) = 4 then vi.qtde else 0 end) as ABR,
              sum(case when extract(month from vi.dtvenda) = 5 then vi.qtde else 0 end) as MAI,
              sum(case when extract(month from vi.dtvenda) = 6 then vi.qtde else 0 end) as JUN,
              sum(case when extract(month from vi.dtvenda) = 7 then vi.qtde else 0 end) as JUL,
              sum(case when extract(month from vi.dtvenda) = 8 then vi.qtde else 0 end) as AGO,
              sum(case when extract(month from vi.dtvenda) = 9 then vi.qtde else 0 end) as SE,
              sum(case when extract(month from vi.dtvenda) = 10 then vi.qtde else 0 end) as OUT,
              sum(case when extract(month from vi.dtvenda) = 11 then vi.qtde else 0 end) as NOV,
              sum(case when extract(month from vi.dtvenda) = 12 then vi.qtde else 0 end) as DEZ
    from TBVENDAS v
      inner join TVENDASITENS vi on (v.ano = vi.ano and v.codcontrol = vi.codcontrol and v.codemp = vi.codemp)
    where v.status in (3, 4)
    group by
        vi.codprod
      , vi.codemp
      , extract(year from vi.dtvenda)

  ) PV on (pv.empresa = e.cnpj and pv.item = pc.item and pv.ano = pc.ano)

  /* Ajustes */
  left join (

    select
        a.codprod as item
      , a.codempresa as empresa
      , extract(year from a.dtajust) as ano
      , sum(case when extract(month from a.dtajust) = 1 then a.qtdeatual else 0 end) as JAN,
        sum(case when extract(month from a.dtajust) = 2 then a.qtdeatual else 0 end) as FEV,
        sum(case when extract(month from a.dtajust) = 3 then a.qtdeatual else 0 end) as MAR,
        sum(case when extract(month from a.dtajust) = 4 then a.qtdeatual else 0 end) as ABR,
        sum(case when extract(month from a.dtajust) = 5 then a.qtdeatual else 0 end) as MAI,
        sum(case when extract(month from a.dtajust) = 6 then a.qtdeatual else 0 end) as JUN,
        sum(case when extract(month from a.dtajust) = 7 then a.qtdeatual else 0 end) as JUL,
        sum(case when extract(month from a.dtajust) = 8 then a.qtdeatual else 0 end) as AGO,
        sum(case when extract(month from a.dtajust) = 9 then a.qtdeatual else 0 end) as SE,
        sum(case when extract(month from a.dtajust) = 10 then a.qtdeatual else 0 end) as OUT,
        sum(case when extract(month from a.dtajust) = 11 then a.qtdeatual else 0 end) as NOV,
        sum(case when extract(month from a.dtajust) = 12 then a.qtdeatual else 0 end) as DEZ
    from TBAJUSTESTOQ a
    group by
        a.codprod
      , a.codempresa
      , extract(year from a.dtajust)

  ) PA on (pa.empresa = e.cnpj and pa.item = pc.item and pa.ano = pc.ano)

  inner join TBPRODUTO p on (p.cod = coalesce(pv.item, pc.item, pa.item))

  left join TBGRUPOPROD g on (g.cod = p.codgrupo)
  left join TBSECAOPROD s on (s.scp_cod = p.codsecao)
  left join TBFABRICANTE f on (f.cod = p.codfabricante)
  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)

order by
    e.rzsoc
  , p.aliquota_tipo
  , coalesce(g.descri, '* Indefinido')
  , coalesce(f.nome, '* Indefinido')
  , p.descri_apresentacao
  , coalesce(pc.ano, pv.ano, pa.ano)
;




/*------ SYSDBA 18/11/2015 22:24:01 --------*/

SET TERM ^ ;

create or alter procedure SP_UPD_CUSTO_INVENTARIO_ALMOX (
    ANO_MOVIMENTO smallint)
as
declare variable ANO integer;
declare variable CONTROLE integer;
declare variable LOTE varchar(38);
declare variable CUSTO DMN_MONEY_4;
declare variable TOTAL DMN_MONEY;
declare variable UNIDADE smallint;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Atualizar Custos dos Inventarios ocorridos nos Centros de Custos
  -- OBSERVACAO: Processo VII da Atualizacao Geral de Custos do Estoque, caso seja necessario

  --1. Atualizar Custo dos Itens
  for
    Select
        i.ano
      , i.controle
      , ii.lote_conferido
    from TBINVENTARIO_ALMOX i
      inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle )
    where i.status < 3 -- Todos os status com excessao do "3. Cancelado"
      and i.ano = :ano_movimento
    Into
        ano
      , controle
      , lote
  do
  begin
    Select
        e.custo_medio
      , e.unidade
      , e.fracionador
    from TBESTOQUE_ALMOX e
    where e.id = :lote
    Into
        custo
      , unidade
      , fracionador;

    Update TBINVENTARIO_ALMOX_ITEM ii Set
        ii.custo       = :custo
      , ii.unidade     = :unidade
      , ii.fracionador = :fracionador
      , ii.total       = (ii.qtde * :custo)
    where ii.ano      = :ano
      and ii.controle = :controle
      and ii.lote_conferido = :lote;
  end 
  /*
  --2. Atualizar Custos Gerais
  for
    Select
        ii.ano
      , ii.controle
      , sum( ii.total )
    from TBINVENTARIO_ALMOX_ITEM ii
    group by
        i.ano
      , i.controle
    Into
        ano
      , controle
      , total
  do
  begin
    Update TBINVENTARIO_ALMOX i Set
      i.valor_total = :total
    where i.ano      = :ano
      and i.controle = :controle;
  end 
  */
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SP_UPD_CUSTO_INVENTARIO_ALMOX TO "PUBLIC";



/*------ SYSDBA 18/11/2015 22:24:12 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_INVENTARIO_ALMOX (
    ANO_MOVIMENTO smallint)
as
declare variable ANO integer;
declare variable CONTROLE integer;
declare variable LOTE varchar(38);
declare variable CUSTO DMN_MONEY_4;
declare variable TOTAL DMN_MONEY;
declare variable UNIDADE smallint;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Atualizar Custos dos Inventarios ocorridos nos Centros de Custos
  -- OBSERVACAO: Processo VII da Atualizacao Geral de Custos do Estoque, caso seja necessario

  --1. Atualizar Custo dos Itens
  for
    Select
        i.ano
      , i.controle
      , ii.lote_conferido
    from TBINVENTARIO_ALMOX i
      inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle )
    where i.status < 3 -- Todos os status com excessao do "3. Cancelado"
      and i.ano = :ano_movimento
    Into
        ano
      , controle
      , lote
  do
  begin
    Select
        e.custo_medio
      , e.unidade
      , e.fracionador
    from TBESTOQUE_ALMOX e
    where e.id = :lote
    Into
        custo
      , unidade
      , fracionador;

    Update TBINVENTARIO_ALMOX_ITEM ii Set
        ii.custo       = :custo
      , ii.unidade     = :unidade
      , ii.fracionador = :fracionador
      , ii.total       = (ii.qtde * :custo)
    where ii.ano      = :ano
      and ii.controle = :controle
      and ii.lote_conferido = :lote;
  end 
  /*
  --2. Atualizar Custos Gerais
  for
    Select
        ii.ano
      , ii.controle
      , sum( ii.total )
    from TBINVENTARIO_ALMOX_ITEM ii
    group by
        i.ano
      , i.controle
    Into
        ano
      , controle
      , total
  do
  begin
    Update TBINVENTARIO_ALMOX i Set
      i.valor_total = :total
    where i.ano      = :ano
      and i.controle = :controle;
  end 
  */
end^

SET TERM ; ^




/*------ SYSDBA 18/11/2015 22:25:01 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_ESTOQUE_REQUI (
    ANO_MOVIMENTO smallint)
as
declare variable ANO integer;
declare variable CONTROLE integer;
declare variable LOTE varchar(38);
declare variable CUSTO DMN_MONEY_4;
declare variable TOTAL DMN_MONEY;
declare variable UNIDADE smallint;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Atualizar Custos das Requisicoes ao Almoxarifado
  -- OBSERVACAO: Processo IV da Atualizacao Geral de Custos do Estoque

  --1. Atualizar Custo dos Itens
  for
    Select
        i.ano
      , i.controle
      , i.lote_atendimento
    from TBREQUISICAO_ALMOX_ITEM i
      inner join TBREQUISICAO_ALMOX ii on (ii.ano = i.ano and ii.controle = i.controle )
    where ii.status in (2, 3, 4) -- 2. Enviada / 3. Recebida / 4. Atendida
      and i.ano = :ano_movimento
    Into
        ano
      , controle
      , lote
  do
  begin
    Select
        e.custo_medio
      , e.unidade
      , e.fracionador
    from TBESTOQUE_ALMOX e
    where e.id = :lote
    Into
        custo
      , unidade
      , fracionador;

    Update TBREQUISICAO_ALMOX_ITEM i Set
        i.custo       = :custo
      , i.unidade     = :unidade
      , i.fracionador = :fracionador
      , i.total       = (i.qtde_atendida * :custo)
    where i.ano      = :ano
      and i.controle = :controle
      and i.lote_atendimento = :lote;
  end 

  --2. Atualizar Custos Gerais
  for
    Select
        i.ano
      , i.controle
      , sum( i.total )
    from TBREQUISICAO_ALMOX_ITEM i
    group by
        i.ano
      , i.controle
    Into
        ano
      , controle
      , total
  do
  begin
    Update TBREQUISICAO_ALMOX r Set
      r.valor_total = :total
    where r.ano      = :ano
      and r.controle = :controle;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 18/11/2015 22:25:10 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SP_UPD_CUSTO_INVENTARIO_ALMOX (
    ANO_MOVIMENTO smallint)
as
declare variable ANO integer;
declare variable CONTROLE integer;
declare variable LOTE varchar(38);
declare variable CUSTO DMN_MONEY_4;
declare variable TOTAL DMN_MONEY;
declare variable UNIDADE smallint;
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Atualizar Custos dos Inventarios ocorridos nos Centros de Custos
  -- OBSERVACAO: Processo V da Atualizacao Geral de Custos do Estoque, caso seja necessario

  --1. Atualizar Custo dos Itens
  for
    Select
        i.ano
      , i.controle
      , ii.lote_conferido
    from TBINVENTARIO_ALMOX i
      inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle )
    where i.status < 3 -- Todos os status com excessao do "3. Cancelado"
      and i.ano = :ano_movimento
    Into
        ano
      , controle
      , lote
  do
  begin
    Select
        e.custo_medio
      , e.unidade
      , e.fracionador
    from TBESTOQUE_ALMOX e
    where e.id = :lote
    Into
        custo
      , unidade
      , fracionador;

    Update TBINVENTARIO_ALMOX_ITEM ii Set
        ii.custo       = :custo
      , ii.unidade     = :unidade
      , ii.fracionador = :fracionador
      , ii.total       = (ii.qtde * :custo)
    where ii.ano      = :ano
      and ii.controle = :controle
      and ii.lote_conferido = :lote;
  end 
  /*
  --2. Atualizar Custos Gerais
  for
    Select
        ii.ano
      , ii.controle
      , sum( ii.total )
    from TBINVENTARIO_ALMOX_ITEM ii
    group by
        i.ano
      , i.controle
    Into
        ano
      , controle
      , total
  do
  begin
    Update TBINVENTARIO_ALMOX i Set
      i.valor_total = :total
    where i.ano      = :ano
      and i.controle = :controle;
  end 
  */
end^

SET TERM ; ^




/*------ SYSDBA 18/11/2015 22:30:05 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM
ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_ITEM_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD);




/*------ SYSDBA 30/11/2015 13:12:27 --------*/

SET TERM ^ ;

create or alter procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_SALDO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_ESTOQUE_ALMOX DMN_MONEY)
as
begin
  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_saldo_almox
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_saldo_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriações */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisições */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_saldo_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_estoque_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_PRODUTO_EXTRATO TO "PUBLIC";



/*------ SYSDBA 30/11/2015 13:14:47 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_SALDO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_ESTOQUE_ALMOX DMN_MONEY)
as
begin
  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_saldo_almox
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_saldo_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriações */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisições */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_saldo_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_estoque_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_PRODUTO_EXTRATO IS 'Procedure Ler Exttrato do Produto

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/11/2015

Stored procedure responsavel por montar o extrato de movimento do produto em relacao
a suas entradas (Compras e Apropriacoes) e Saidas (Vendas e Requisicoes).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/11/2015 - IMR :
        * Documentacao.';




/*------ SYSDBA 30/11/2015 13:15:32 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_SALDO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_ESTOQUE_ALMOX DMN_MONEY)
as
begin
  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_saldo_almox
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_saldo_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_saldo_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_estoque_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^




/*------ SYSDBA 30/11/2015 13:16:19 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_SALDO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_ESTOQUE_ALMOX DMN_MONEY)
as
begin
  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_saldo_almox
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_saldo_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_saldo_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_estoque_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_PRODUTO_EXTRATO IS 'Procedure Ler Exttrato do Produto

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/11/2015

Stored procedure responsavel por montar o extrato de movimento do produto em relacao
a suas entradas (Ajustes, Compras e Apropriacoes) e Saidas (Ajustes e Requisicoes).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/11/2015 - IMR :
        * Documentacao.';




/*------ SYSDBA 30/11/2015 15:11:33 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_MOVIMENTO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_ESTOQUE_ALMOX DMN_MONEY)
as
begin
  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +                         -- Apropriacao
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -                         -- Inventario Almoxrifado
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_movimento_almox  -- Requisicao
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_saldo_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_movimento_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_estoque_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^




/*------ SYSDBA 30/11/2015 15:21:00 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_MOVIMENTO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_MOVIMENTO_ALMOX DMN_MONEY)
as
begin
  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +                         -- Apropriacao
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -                         -- Inventario Almoxrifado
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_movimento_almox  -- Requisicao
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_movimento_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_movimento_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_movimento_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^




/*------ SYSDBA 30/11/2015 15:21:43 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_MOVIMENTO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_MOVIMENTO_ALMOX DMN_MONEY)
as
begin
  empresa = coalesce(trim(:empresa), '');
  produto = coalesce(trim(:produto), '');

  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +                         -- Apropriacao
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -                         -- Inventario Almoxrifado
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_movimento_almox  -- Requisicao
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_movimento_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_movimento_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_movimento_almox
  do
  begin

    suspend;

  end
end^

SET TERM ; ^




/*------ SYSDBA 30/11/2015 15:24:02 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_MOVIMENTO_ALMOX DMN_QUANTIDADE_D3_N,
    QUANT_SALDO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_MOVIMENTO_ALMOX DMN_MONEY)
as
  declare variable quant_saldo_almox_tmp DMN_QUANTIDADE_D3_N;
begin
  empresa = coalesce(trim(:empresa), '');
  produto = coalesce(trim(:produto), '');

  quant_saldo_almox_tmp = 0.0;

  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +                         -- Apropriacao
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -                         -- Inventario Almoxrifado
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_movimento_almox  -- Requisicao
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_movimento_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_movimento_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_movimento_almox
  do
  begin

    quant_saldo_almox = :quant_saldo_almox_tmp + :quant_movimento_almox;
    suspend;
    quant_saldo_almox_tmp = :quant_saldo_almox;

  end
end^

SET TERM ; ^




/*------ SYSDBA 30/11/2015 15:25:55 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PRODUTO_EXTRATO (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
returns (
    ID DMN_INTEGER_N,
    CODIGO DMN_VCHAR_10,
    DESCRICAO DMN_VCHAR_50,
    APRESENTACAO DMN_VCHAR_50,
    DESCRICAO_APRESENTACAO DMN_VCHAR_100,
    UND_COMPRA DMN_VCHAR_50,
    UND_COMPRA_SIGLA DMN_VCHAR_05,
    ESTOQUE_VENDA DMN_QUANTIDADE_D3_N,
    ESTOQUE_ALMOX DMN_QUANTIDADE_D3_N,
    EMPRESA_CNPJ DMN_CNPJ,
    EMPRESA_RAZAO DMN_VCHAR_60,
    DATA DMN_DATE,
    TIPO DMN_SMALLINT_N,
    QUANT DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL DMN_MONEY,
    QUANT_AJUSTE DMN_QUANTIDADE_D3_N,
    QUANT_COMPRA DMN_QUANTIDADE_D3_N,
    QUANT_INVENTARIO DMN_QUANTIDADE_D3_N,
    QUANT_APROPRIACAO DMN_QUANTIDADE_D3_N,
    QUANT_REQUISICAO DMN_QUANTIDADE_D3_N,
    QUANT_MOVIMENTO_ALMOX DMN_QUANTIDADE_D3_N,
    QUANT_SALDO_ALMOX DMN_QUANTIDADE_D3_N,
    VALOR_TOTAL_COMPRA DMN_MONEY,
    VALOR_TOTAL_INVENTARIO DMN_MONEY,
    VALOR_TOTAL_APROPRIACAO DMN_MONEY,
    VALOR_TOTAL_REQUISICAO DMN_MONEY,
    VALOR_TOTAL_SALDO_ALMOX DMN_MONEY,
    VALOR_MOVIMENTO_ALMOX DMN_MONEY,
    VALOR_SALDO_ALMOX DMN_MONEY)
as
  declare variable quant_saldo_almox_tmp DMN_QUANTIDADE_D3_N;
  declare variable valor_saldo_almox_tmp DMN_MONEY;
begin
  empresa = coalesce(trim(:empresa), '');
  produto = coalesce(trim(:produto), '');

  quant_saldo_almox_tmp = 0.0;
  valor_saldo_almox_tmp = 0.0;

  for
    Select
        p.codigo
      , p.cod
      , p.descri
      , p.apresentacao
      , p.descri_apresentacao
      , uc.unp_descricao as und_compra
      , uc.unp_sigla     as und_compra_sigla
      , p.qtde           as estoque
      , coalesce(ep.estoque_almox, 0) as estoque_almox
    
      , ex.empresa
      , e.rzsoc as empresa_razao
      , ex.data
      , ex.tipo
      , ex.quant
      , ex.valor_total
    
      , Case when ex.tipo = 0 then coalesce(ex.quant, 0.0) else 0 end as quant_ajuste
      , Case when ex.tipo = 1 then coalesce(ex.quant, 0.0) else 0 end as quant_compra
      , Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end as quant_inventario
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end as quant_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.quant, 0.0) else 0 end +                         -- Apropriacao
        Case when ex.tipo = 2 then coalesce(ex.quant, 0.0) else 0 end -                         -- Inventario Almoxrifado
        Case when ex.tipo = 4 then coalesce(ex.quant, 0.0) else 0 end as quant_movimento_almox  -- Requisicao
    
      , Case when ex.tipo = 1 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_compra
      , Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_inventario
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_apropriacao
      , Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_total_requisicao
    
      , Case when ex.tipo = 3 then coalesce(ex.valor_total, 0.0) else 0 end +
        Case when ex.tipo = 2 then coalesce(ex.valor_total, 0.0) else 0 end -
        Case when ex.tipo = 4 then coalesce(ex.valor_total, 0.0) else 0 end as valor_movimento_almox
    
      , ep.valor_estoque_almox
    from TBEMPRESA e
    
      inner join (
    
        /* Ajustes de Entradas/Saidas */
        Select
            x.codempresa as empresa
          , x.codprod    as produto
          , cast(x.dtajust as date) as data
          , sum(x.qtdenova)         as quant
          , sum(x.qtdenova * p.customedio) as valor_total
          , 0 as tipo
        from TBAJUSTESTOQ x
          inner join TBPRODUTO p on (p.cod = x.codprod)
        group by
            x.codempresa
          , x.codprod
          , cast(x.dtajust as date)
    
        union
    
        /* Compras */
        select
            ci.codemp    as empresa
          , ci.codprod   as produto
          , ci.dtent     as data
          , sum(ci.qtde) as quant
          , sum(ci.total_liquido) as valor_total
          , 1 as tipo
        from TBCOMPRAS c
          inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
        where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
        group by
            ci.codemp
          , ci.codprod
          , ci.dtent
    
        union
    
        /* Inventarios */
        select
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date) as data
          , sum((ii.qtde - ii.estoque) / ii.fracionador) as quant
          , sum((ii.qtde - ii.estoque) * ii.custo) as valor_total
          , 2 as tipo
        from TBINVENTARIO_ALMOX i
          inner join TBINVENTARIO_ALMOX_ITEM ii on (ii.ano = i.ano and ii.controle = i.controle)
        where i.status = 2 -- Encerrado
        group by
            i.empresa
          , ii.produto
          , cast(i.fech_datahora as date)
    
        union
    
        /* Apropriacoes */
        select
            a.empresa
          , ai.produto
          , a.data_apropriacao  as data
          , sum(ai.qtde)        as quant
          , sum(ai.custo_total) as valor_total
          , 3 as tipo
        from TBAPROPRIACAO_ALMOX a
          inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
        where a.status = 2 -- Encerrada
        group by
            a.empresa
          , ai.produto
          , a.data_apropriacao
    
        union
    
        /* Requisicoes */
        select
            r.empresa
          , ri.produto
          , r.data_emissao as data
          , sum(ri.qtde / ri.fracionador) as quant
          , sum(ri.total) as valor_total
          , 4 as tipo
        from TBREQUISICAO_ALMOX r
          inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
        where r.status = 4 -- Atendida
        group by
            r.empresa
          , ri.produto
          , r.data_emissao
    
        order by
            1
          , 2
          , 3
    
      ) ex on (ex.empresa = e.cnpj)
    
      inner join TBPRODUTO p on (p.cod = ex.produto)
    
      left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
    
      /* Estoque Apropriado */
      left join (
        Select
            ae.empresa
          , ae.produto
          , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
          , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
        from TBESTOQUE_ALMOX ae
          inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
        where ae.qtde > 0
        group by
            ae.empresa
          , ae.produto
      ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)
    
    where e.cnpj = :empresa
      and ( (trim(:produto) = '') or (ex.produto = :produto) )
    
    order by
        ex.empresa
      , p.descri_apresentacao
      , p.cod
      , ex.data
      , ex.tipo

    Into
        id
      , codigo
      , descricao
      , apresentacao
      , descricao_apresentacao
      , und_compra
      , und_compra_sigla
      , estoque_venda
      , estoque_almox
      , empresa_cnpj
      , empresa_razao
      , data
      , tipo
      , quant
      , valor_total
      , quant_ajuste
      , quant_compra
      , quant_inventario
      , quant_apropriacao
      , quant_requisicao
      , quant_movimento_almox
      , valor_total_compra
      , valor_total_inventario
      , valor_total_apropriacao
      , valor_total_requisicao
      , valor_total_saldo_almox
      , valor_movimento_almox
  do
  begin
    quant_saldo_almox = :quant_saldo_almox_tmp + :quant_movimento_almox;
    valor_saldo_almox = :valor_saldo_almox_tmp + :valor_movimento_almox;

    suspend;

    quant_saldo_almox_tmp = :quant_saldo_almox;
    valor_saldo_almox_tmp = :valor_saldo_almox;
  end
end^

SET TERM ; ^

