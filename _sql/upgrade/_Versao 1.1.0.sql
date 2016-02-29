


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




/*------ SYSDBA 05/12/2015 09:44:15 --------*/

ALTER TABLE TBCONTPAG
    ADD BANCO_FEBRABAN DMN_VCHAR_10;

COMMENT ON COLUMN TBCONTPAG.BANCO_FEBRABAN IS
'Codigo de Compensacao do Banco';

alter table TBCONTPAG
alter ANOLANC position 1;

alter table TBCONTPAG
alter NUMLANC position 2;

alter table TBCONTPAG
alter EMPRESA position 3;

alter table TBCONTPAG
alter CODFORN position 4;

alter table TBCONTPAG
alter PARCELA position 5;

alter table TBCONTPAG
alter TIPPAG position 6;

alter table TBCONTPAG
alter HISTORIC position 7;

alter table TBCONTPAG
alter NOTFISC position 8;

alter table TBCONTPAG
alter DTEMISS position 9;

alter table TBCONTPAG
alter DTVENC position 10;

alter table TBCONTPAG
alter DTPAG position 11;

alter table TBCONTPAG
alter DOCBAIX position 12;

alter table TBCONTPAG
alter VALORPAG position 13;

alter table TBCONTPAG
alter VALORMULTA position 14;

alter table TBCONTPAG
alter VALORPAGTOT position 15;

alter table TBCONTPAG
alter VALORSALDO position 16;

alter table TBCONTPAG
alter NOMEEMP position 17;

alter table TBCONTPAG
alter TIPOCATEG position 18;

alter table TBCONTPAG
alter BANCO position 19;

alter table TBCONTPAG
alter BANCO_FEBRABAN position 20;

alter table TBCONTPAG
alter NUMCHQ position 21;

alter table TBCONTPAG
alter ANOCOMPRA position 22;

alter table TBCONTPAG
alter NUMCOMPRA position 23;

alter table TBCONTPAG
alter FORMA_PAGTO position 24;

alter table TBCONTPAG
alter CONDICAO_PAGTO position 25;

alter table TBCONTPAG
alter QUITADO position 26;

alter table TBCONTPAG
alter CODTPDESP position 27;

alter table TBCONTPAG
alter SITUACAO position 28;

alter table TBCONTPAG
alter LOTE position 29;

alter table TBCONTPAG
alter COMPETENCIA_APURACAO position 30;




/*------ SYSDBA 05/12/2015 09:44:46 --------*/

CREATE INDEX IDX_TBCONTPAG_BANCO_FEBRABAN
ON TBCONTPAG (BANCO_FEBRABAN);




/*------ SYSDBA 05/12/2015 09:45:20 --------*/

ALTER TABLE TBCONTPAG_BAIXA
    ADD BANCO_FEBRABAN DMN_VCHAR_10;

COMMENT ON COLUMN TBCONTPAG_BAIXA.BANCO_FEBRABAN IS
'Codigo de Compensacao do Banco';

alter table TBCONTPAG_BAIXA
alter ANOLANC position 1;

alter table TBCONTPAG_BAIXA
alter NUMLANC position 2;

alter table TBCONTPAG_BAIXA
alter SEQ position 3;

alter table TBCONTPAG_BAIXA
alter HISTORICO position 4;

alter table TBCONTPAG_BAIXA
alter DATA_PAGTO position 5;

alter table TBCONTPAG_BAIXA
alter FORMA_PAGTO position 6;

alter table TBCONTPAG_BAIXA
alter VALOR_BAIXA position 7;

alter table TBCONTPAG_BAIXA
alter NUMERO_CHEQUE position 8;

alter table TBCONTPAG_BAIXA
alter BANCO position 9;

alter table TBCONTPAG_BAIXA
alter BANCO_FEBRABAN position 10;

alter table TBCONTPAG_BAIXA
alter DOCUMENTO_BAIXA position 11;

alter table TBCONTPAG_BAIXA
alter USUARIO position 12;




/*------ SYSDBA 05/12/2015 09:45:44 --------*/

CREATE INDEX IDX_TBCONTPAG_BAIXA_BANCO_FEBRA
ON TBCONTPAG_BAIXA (BANCO_FEBRABAN);




/*------ SYSDBA 05/12/2015 09:46:29 --------*/

ALTER TABLE TBCONTREC
    ADD BANCO_FEBRABAN DMN_VCHAR_10;

COMMENT ON COLUMN TBCONTREC.BANCO_FEBRABAN IS
'Codigo de Compensacao do Banco';

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
alter SITUACAO position 33;

alter table TBCONTREC
alter LOTE position 34;

alter table TBCONTREC
alter COMPETENCIA_APURACAO position 35;




/*------ SYSDBA 05/12/2015 09:46:54 --------*/

CREATE INDEX IDX_TBCONTREC_BANCO_FEBRABAN
ON TBCONTREC (BANCO_FEBRABAN);




/*------ SYSDBA 05/12/2015 09:47:21 --------*/

ALTER TABLE TBCONTREC_BAIXA
    ADD BANCO_FEBRABAN DMN_VCHAR_10;

COMMENT ON COLUMN TBCONTREC_BAIXA.BANCO_FEBRABAN IS
'Codigo de Compensacao do Banco';

alter table TBCONTREC_BAIXA
alter ANOLANC position 1;

alter table TBCONTREC_BAIXA
alter NUMLANC position 2;

alter table TBCONTREC_BAIXA
alter SEQ position 3;

alter table TBCONTREC_BAIXA
alter HISTORICO position 4;

alter table TBCONTREC_BAIXA
alter DATA_PAGTO position 5;

alter table TBCONTREC_BAIXA
alter FORMA_PAGTO position 6;

alter table TBCONTREC_BAIXA
alter VALOR_BAIXA position 7;

alter table TBCONTREC_BAIXA
alter NUMERO_CHEQUE position 8;

alter table TBCONTREC_BAIXA
alter BANCO position 9;

alter table TBCONTREC_BAIXA
alter BANCO_FEBRABAN position 10;

alter table TBCONTREC_BAIXA
alter DOCUMENTO_BAIXA position 11;

alter table TBCONTREC_BAIXA
alter USUARIO position 12;




/*------ SYSDBA 05/12/2015 09:47:45 --------*/

CREATE INDEX IDX_TBCONTREC_BAIXA_BANCO_FEBRA
ON TBCONTREC_BAIXA (BANCO_FEBRABAN);




/*------ SYSDBA 05/12/2015 10:15:09 --------*/

ALTER TABLE TBBANCO
    ADD NOME_RESUMIDO DMN_VCHAR_30;

alter table TBBANCO
alter COD position 1;

alter table TBBANCO
alter NOME position 2;

alter table TBBANCO
alter NOME_RESUMIDO position 3;

alter table TBBANCO
alter HOME_PAGE position 4;




/*------ SYSDBA 05/12/2015 10:15:19 --------*/

COMMENT ON COLUMN TBBANCO.NOME_RESUMIDO IS
'Nome Resumido';




/*------ SYSDBA 07/12/2015 23:02:27 --------*/

ALTER TABLE TBLANCDEPOS
    ADD CODEMPRESA DMN_CNPJ;

COMMENT ON COLUMN TBLANCDEPOS.CODEMPRESA IS
'Empresa';

alter table TBLANCDEPOS
alter NUMLANC position 1;

alter table TBLANCDEPOS
alter CODBANCO position 2;

alter table TBLANCDEPOS
alter CODEMPRESA position 3;

alter table TBLANCDEPOS
alter ESPECIE position 4;

alter table TBLANCDEPOS
alter VALORDEP position 5;

alter table TBLANCDEPOS
alter DATADEP position 6;

alter table TBLANCDEPOS
alter COMPRDEP position 7;




/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column NUMLANC position 1;


/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column CODEMPRESA position 2;


/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column CODBANCO position 3;


/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column ESPECIE position 4;


/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column VALORDEP position 5;


/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column DATADEP position 6;


/*------ SYSDBA 07/12/2015 23:02:56 --------*/

alter table TBLANCDEPOS
alter column COMPRDEP position 7;


/*------ SYSDBA 07/12/2015 23:05:04 --------*/

ALTER TABLE TBCONTPAG_BAIXA
    ADD EMPRESA DMN_CNPJ;

COMMENT ON COLUMN TBCONTPAG_BAIXA.EMPRESA IS
'Empresa da Conta';

COMMENT ON COLUMN TBCONTPAG_BAIXA.BANCO IS
'Banco Boleto da Conta';

alter table TBCONTPAG_BAIXA
alter ANOLANC position 1;

alter table TBCONTPAG_BAIXA
alter NUMLANC position 2;

alter table TBCONTPAG_BAIXA
alter SEQ position 3;

alter table TBCONTPAG_BAIXA
alter HISTORICO position 4;

alter table TBCONTPAG_BAIXA
alter DATA_PAGTO position 5;

alter table TBCONTPAG_BAIXA
alter FORMA_PAGTO position 6;

alter table TBCONTPAG_BAIXA
alter VALOR_BAIXA position 7;

alter table TBCONTPAG_BAIXA
alter NUMERO_CHEQUE position 8;

alter table TBCONTPAG_BAIXA
alter EMPRESA position 9;

alter table TBCONTPAG_BAIXA
alter BANCO position 10;

alter table TBCONTPAG_BAIXA
alter BANCO_FEBRABAN position 11;

alter table TBCONTPAG_BAIXA
alter DOCUMENTO_BAIXA position 12;

alter table TBCONTPAG_BAIXA
alter USUARIO position 13;




/*------ SYSDBA 07/12/2015 23:05:35 --------*/

COMMENT ON COLUMN TBCONTPAG.BANCO IS
'Banco Boleto';




/*------ SYSDBA 07/12/2015 23:05:44 --------*/

COMMENT ON COLUMN TBCONTPAG_BAIXA.BANCO IS
'Banco Boleto';




/*------ SYSDBA 07/12/2015 23:05:47 --------*/

COMMENT ON COLUMN TBCONTPAG_BAIXA.EMPRESA IS
'Empresa';




/*------ SYSDBA 07/12/2015 23:06:31 --------*/

COMMENT ON COLUMN TBCONTREC.CODBANCO IS
'Banco Boleto';




/*------ SYSDBA 07/12/2015 23:07:22 --------*/

ALTER TABLE TBCONTREC_BAIXA
    ADD EMPRESA DMN_CNPJ;

COMMENT ON COLUMN TBCONTREC_BAIXA.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBCONTREC_BAIXA.BANCO IS
'Banco Boleto';

alter table TBCONTREC_BAIXA
alter ANOLANC position 1;

alter table TBCONTREC_BAIXA
alter NUMLANC position 2;

alter table TBCONTREC_BAIXA
alter SEQ position 3;

alter table TBCONTREC_BAIXA
alter HISTORICO position 4;

alter table TBCONTREC_BAIXA
alter DATA_PAGTO position 5;

alter table TBCONTREC_BAIXA
alter FORMA_PAGTO position 6;

alter table TBCONTREC_BAIXA
alter VALOR_BAIXA position 7;

alter table TBCONTREC_BAIXA
alter NUMERO_CHEQUE position 8;

alter table TBCONTREC_BAIXA
alter EMPRESA position 9;

alter table TBCONTREC_BAIXA
alter BANCO position 10;

alter table TBCONTREC_BAIXA
alter BANCO_FEBRABAN position 11;

alter table TBCONTREC_BAIXA
alter DOCUMENTO_BAIXA position 12;

alter table TBCONTREC_BAIXA
alter USUARIO position 13;




/*------ SYSDBA 07/12/2015 23:07:55 --------*/

COMMENT ON COLUMN TBLANCDEPOS.CODBANCO IS
'Banco Boleto';




/*------ SYSDBA 07/12/2015 23:08:29 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY'
where (RDB$FIELD_NAME = 'VALORDEP') and
(RDB$RELATION_NAME = 'TBLANCDEPOS')
;




/*------ SYSDBA 07/12/2015 23:08:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_DATE'
where (RDB$FIELD_NAME = 'DATADEP') and
(RDB$RELATION_NAME = 'TBLANCDEPOS')
;




/*------ SYSDBA 08/12/2015 16:53:12 --------*/

ALTER TABLE TBLANCDEPOS DROP CONSTRAINT FK_TBLANCDEPOS_BANCO;




/*------ SYSDBA 08/12/2015 16:53:23 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_BANCO;




/*------ SYSDBA 08/12/2015 16:53:33 --------*/

ALTER TABLE TBCONTREC DROP CONSTRAINT FK_TBCONTREC_BANCO;




/*------ SYSDBA 08/12/2015 16:53:41 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_BANCO;




/*------ SYSDBA 08/12/2015 16:53:51 --------*/

ALTER TABLE TBCONTPAG DROP CONSTRAINT FK_TBCONTPAG_BANCO;




/*------ SYSDBA 08/12/2015 16:54:04 --------*/

ALTER TABLE TBCONTA_CORRENTE DROP CONSTRAINT FK_TBCONTA_CORRENTE_BANCO;




/*------ SYSDBA 08/12/2015 16:54:15 --------*/

ALTER TABLE TBBANCO_BOLETO DROP CONSTRAINT PK_TBBANCO_BOLETO;




/*------ SYSDBA 08/12/2015 16:55:06 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBBANCO_BOLETO')
;




/*------ SYSDBA 08/12/2015 16:55:22 --------*/

ALTER TABLE TBBANCO_BOLETO
ADD CONSTRAINT PK_TBBANCO_BOLETO_EMPRESA
PRIMARY KEY (BCO_COD,EMPRESA);




/*------ SYSDBA 08/12/2015 16:57:46 --------*/

ALTER TABLE TBCONTA_CORRENTE
ADD CONSTRAINT FK_TBCONTA_CORRENTE_BCO_EMP
FOREIGN KEY (CONTA_BANCO_BOLETO,EMPRESA)
REFERENCES TBBANCO_BOLETO(BCO_COD,EMPRESA);




/*------ SYSDBA 08/12/2015 16:58:10 --------*/

alter table TBCONTA_CORRENTE
alter column CODIGO position 1;


/*------ SYSDBA 08/12/2015 16:58:10 --------*/

alter table TBCONTA_CORRENTE
alter column DESCRICAO position 2;


/*------ SYSDBA 08/12/2015 16:58:10 --------*/

alter table TBCONTA_CORRENTE
alter column TIPO position 3;


/*------ SYSDBA 08/12/2015 16:58:10 --------*/

alter table TBCONTA_CORRENTE
alter column CONTA_BANCO_BOLETO position 4;


/*------ SYSDBA 08/12/2015 16:58:10 --------*/

alter table TBCONTA_CORRENTE
alter column EMPRESA position 5;


/*------ SYSDBA 08/12/2015 17:00:09 --------*/

ALTER TABLE TBCONTPAG
ADD CONSTRAINT FK_TBCONTPAG_BCO_EMP
FOREIGN KEY (BANCO,EMPRESA)
REFERENCES TBBANCO_BOLETO(BCO_COD,EMPRESA);




/*------ SYSDBA 08/12/2015 17:02:14 --------*/

ALTER TABLE TBCONTPAG_BAIXA
ADD CONSTRAINT FK_TBCONTPAG_BAIXA_BCO_EMP
FOREIGN KEY (BANCO,EMPRESA)
REFERENCES TBBANCO_BOLETO(BCO_COD,EMPRESA);




/*------ SYSDBA 08/12/2015 17:03:40 --------*/

ALTER TABLE TBCONTREC
ADD CONSTRAINT FK_TBCONTREC_BCO_EMP
FOREIGN KEY (CODBANCO,EMPRESA)
REFERENCES TBBANCO_BOLETO(BCO_COD,EMPRESA);




/*------ SYSDBA 08/12/2015 17:07:14 --------*/

ALTER TABLE TBCONTREC_BAIXA
ADD CONSTRAINT FK_TBCONTREC_BAIXA_BCO_EMP
FOREIGN KEY (BANCO,EMPRESA)
REFERENCES TBBANCO_BOLETO(BCO_COD,EMPRESA);




/*------ SYSDBA 08/12/2015 17:11:36 --------*/

DROP TABLE TBLANCDEPOS;




/*------ SYSDBA 08/12/2015 17:22:41 --------*/

ALTER TABLE TBCONTPAG DROP CONSTRAINT FK_TBCONTPAG_BCO_EMP;




/*------ SYSDBA 08/12/2015 17:23:26 --------*/

CREATE INDEX IDX_TBCONTPAG_BCO_EMP
ON TBCONTPAG (BANCO,EMPRESA);




/*------ SYSDBA 08/12/2015 17:23:36 --------*/

ALTER TABLE TBCONTPAG_BAIXA DROP CONSTRAINT FK_TBCONTPAG_BAIXA_BCO_EMP;




/*------ SYSDBA 08/12/2015 17:23:59 --------*/

CREATE INDEX IDX_TBCONTPAG_BAIXA_BCO_EMP
ON TBCONTPAG_BAIXA (BANCO,EMPRESA);




/*------ SYSDBA 08/12/2015 17:24:11 --------*/

ALTER TABLE TBCONTREC DROP CONSTRAINT FK_TBCONTREC_BCO_EMP;




/*------ SYSDBA 08/12/2015 17:24:45 --------*/

CREATE INDEX IDX_TBCONTREC_BCO_EMP
ON TBCONTREC (CODBANCO,EMPRESA);




/*------ SYSDBA 08/12/2015 17:24:54 --------*/

ALTER TABLE TBCONTREC_BAIXA DROP CONSTRAINT FK_TBCONTREC_BAIXA_BCO_EMP;




/*------ SYSDBA 08/12/2015 17:25:18 --------*/

CREATE INDEX IDX_TBCONTREC_BAIXA_BCO_EMP
ON TBCONTREC_BAIXA (BANCO,EMPRESA);




/*------ SYSDBA 15/12/2015 15:48:59 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_item_qtde for tbapropriacao_almox_item
active before insert or update position 1
AS
begin
  if ( (coalesce(new.qtde_fracionada, 0.0) = 0.0) or (coalesce(new.qtde_fracionada, 0.0) = 1.0)  ) then
    if ( coalesce(new.qtde, 0.0) > 0.0 ) then
      new.qtde_fracionada = coalesce(new.qtde, 0.0) * coalesce(new.fracionador, 1);
end^

SET TERM ; ^




/*------ SYSDBA 15/12/2015 15:49:18 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_item_qtde for tbapropriacao_almox_item
active before insert or update position 1
AS
begin
  if ( (coalesce(new.qtde_fracionada, 0.0) = 0.0) or (coalesce(new.qtde_fracionada, 0.0) = 1.0)  ) then
    if ( coalesce(new.qtde, 0.0) > 0.0 ) then
      new.qtde_fracionada = coalesce(new.qtde, 0.0) * coalesce(new.fracionador, 1.0);
end^

SET TERM ; ^




/*------ SYSDBA 15/12/2015 15:53:13 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_item_qtde for tbapropriacao_almox_item
active before insert or update position 1
AS
begin
  if ( (coalesce(new.qtde_fracionada, 0.0) = 0.0) or (coalesce(new.qtde_fracionada, 0.0) = 1.0)  ) then
    if ( coalesce(new.qtde, 0.0) > 0.0 ) then
      new.qtde_fracionada = coalesce(new.qtde, 0.0) * coalesce(new.fracionador, 1.0);
end^

SET TERM ; ^




/*------ SYSDBA 05/01/2016 09:44:52 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contpag_quitar for tbcontpag_baixa
active after insert or update position 1
AS
  declare variable Quitado Smallint;
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais

  if ( :Quitado = 0 ) then
  begin

    Update TBCONTPAG p Set
        p.Historic = coalesce(p.Historic, '') || ' --> HISTORICO DE PGTO : ' || new.Historico
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = coalesce(p.Historic, '') || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

SET TERM ; ^




/*------ SYSDBA 07/01/2016 10:06:29 --------*/

ALTER TABLE SYS_IBPT
    ADD ATIVO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN SYS_IBPT.ATIVO IS
'Codigo Ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 07/01/2016 10:07:21 --------*/

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

    07/01/2016 - IMR :
        + Criacao do campo ATIVO para definir quais codigos estarao ativos a partir
          de 2016.

    28/05/2014 - IMR :
        + Criacao dos campos ALIQESTADUAL_IBPT e ALIQMUNICIPAL_IBPT para armazenar as aliquotas estaduais e municipais.';




/*------ SYSDBA 07/01/2016 11:02:02 --------*/

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_FUN;

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_ROT;

SET STATISTICS INDEX FK_SYS_FUNCAO_PERMISSAO_SIS;

SET STATISTICS INDEX FK_SYS_ROTINA_PAI;

SET STATISTICS INDEX FK_SYS_SISTEMA_ROTINA_ROT;

SET STATISTICS INDEX FK_SYS_SISTEMA_ROTINA_SIS;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_1;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_2;

SET STATISTICS INDEX FK_TBAJUSTESTOQ_EMP;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_AUT;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_CMP;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_CNT;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_EMP;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_ITEM_PRD;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_ITM_UND;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_ITM_UNDF;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_MOV;

SET STATISTICS INDEX FK_TBAPROPRIACAO_ALMOX_USR;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_AUT;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_EMP;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_FRN;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_PRD;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRAITEM_UND;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_CLIENTE;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_CNT_CUSTO;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_COMPET;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_CPAGTO;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_EMISSOR;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_EMPRESA;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_FPAGTO;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_FRN;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_TRANSP;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_USR_AUT;

SET STATISTICS INDEX FK_TBAUTORIZA_COMPRA_USR_CANCEL;

SET STATISTICS INDEX FK_TBAUTORIZA_REQUISITA_AUT;

SET STATISTICS INDEX FK_TBAUTORIZA_REQUISITA_REC;

SET STATISTICS INDEX FK_TBBAIRRO_CID;

SET STATISTICS INDEX FK_TBBAIRRO_DIS;

SET STATISTICS INDEX FK_TBBANCO_BOLETO_EMPRESA;

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO;

SET STATISTICS INDEX FK_TBCAIXA_CONSOLIDACAO_FP;

SET STATISTICS INDEX FK_TBCAIXA_CONTA_CORRENTE;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CC;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CL;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CM;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_CX;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_EP;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FN;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_FP;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_PG;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_RC;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_TD;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_US;

SET STATISTICS INDEX FK_TBCAIXA_MOVIMENTO_VD;

SET STATISTICS INDEX FK_TBCAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCAIXA_USUARIO_CANCEL;

SET STATISTICS INDEX FK_TBCENTRO_CUSTO_CLIENTE;

SET STATISTICS INDEX FK_TBCENTRO_CUSTO_EMPRESA_CCT;

SET STATISTICS INDEX FK_TBCENTRO_CUSTO_EMPRESA_EMP;

SET STATISTICS INDEX FK_TBCIDADE_UF;

SET STATISTICS INDEX FK_TBCLIENTE_BAI;

SET STATISTICS INDEX FK_TBCLIENTE_BANCO;

SET STATISTICS INDEX FK_TBCLIENTE_BANCO2;

SET STATISTICS INDEX FK_TBCLIENTE_BANCO3;

SET STATISTICS INDEX FK_TBCLIENTE_CID;

SET STATISTICS INDEX FK_TBCLIENTE_EST;

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_CLI;

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_PRD;

SET STATISTICS INDEX FK_TBCLIENTE_ESTOQUE_VND;

SET STATISTICS INDEX FK_TBCLIENTE_LOG;

SET STATISTICS INDEX FK_TBCLIENTE_PAIS;

SET STATISTICS INDEX FK_TBCLIENTE_REQUISICAO_CLI;

SET STATISTICS INDEX FK_TBCLIENTE_REQUISICAO_EMP;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_CLI;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_EMP;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_PRD;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_REQ;

SET STATISTICS INDEX FK_TBCLIENTE_REQ_ITEM_UND;

SET STATISTICS INDEX FK_TBCLIENTE_TIPO_LOG;

SET STATISTICS INDEX FK_TBCLIENTE_VENDEDOR;

SET STATISTICS INDEX FK_TBCOMPRASITENS_COMPRA;

SET STATISTICS INDEX FK_TBCOMPRASITENS_EMPRESA;

SET STATISTICS INDEX FK_TBCOMPRASITENS_FORNECEDOR;

SET STATISTICS INDEX FK_TBCOMPRASITENS_PRODUTO;

SET STATISTICS INDEX FK_TBCOMPRASITENS_UNID;

SET STATISTICS INDEX FK_TBCOMPRAS_AUTORIZACAO;

SET STATISTICS INDEX FK_TBCOMPRAS_CFOP;

SET STATISTICS INDEX FK_TBCOMPRAS_DEVOLVER_ENTRADA;

SET STATISTICS INDEX FK_TBCOMPRAS_DEVOLVER_SAIDA;

SET STATISTICS INDEX FK_TBCOMPRAS_EMPRESA;

SET STATISTICS INDEX FK_TBCOMPRAS_FORNECEDOR;

SET STATISTICS INDEX FK_TBCOMPRAS_TIPO_DESPESA;

SET STATISTICS INDEX FK_TBCONFIGURACAO_EMPRESA;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_BCO_EMP;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_EMPRESA;

SET STATISTICS INDEX FK_TBCONTA_CORRENTE_SALDO;

SET STATISTICS INDEX FK_TBCONTPAG_1;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_CPAG;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_FPAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_BAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCONTPAG_COMPRA;

SET STATISTICS INDEX FK_TBCONTPAG_COMP_APUR;

SET STATISTICS INDEX FK_TBCONTPAG_COND_PAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_EMPRESA;

SET STATISTICS INDEX FK_TBCONTPAG_FORMA_PAGTO;

SET STATISTICS INDEX FK_TBCONTPAG_FORNECEDOR;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_CREC;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_FPAGTO;

SET STATISTICS INDEX FK_TBCONTREC_BAIXA_USUARIO;

SET STATISTICS INDEX FK_TBCONTREC_CLIENTE_COD;

SET STATISTICS INDEX FK_TBCONTREC_COMP_APUR;

SET STATISTICS INDEX FK_TBCONTREC_EMPRESA;

SET STATISTICS INDEX FK_TBCONTREC_FORMA_PGTO;

SET STATISTICS INDEX FK_TBCONTREC_VND;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_COT;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_CPG;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_FOR;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_FPG;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_ITM_COT;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_ITM_EMP;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_ITM_FOR;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_ITM_FRN;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_ITM_ITM;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAFORN_USR;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAITEM_AUT;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAITEM_EMP;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAITEM_PRD;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRAITEM_UND;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRA_COMPET;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRA_EMISSOR;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRA_EMPRESA;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRA_USR_AUT;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRA_USR_CANCEL;

SET STATISTICS INDEX FK_TBCOTACAO_COMPRA_USR_ENCERR;

SET STATISTICS INDEX FK_TBEMPRESA_BAI;

SET STATISTICS INDEX FK_TBEMPRESA_CID;

SET STATISTICS INDEX FK_TBEMPRESA_EST;

SET STATISTICS INDEX FK_TBEMPRESA_LOG;

SET STATISTICS INDEX FK_TBEMPRESA_PAIS;

SET STATISTICS INDEX FK_TBEMPRESA_SEGMENTO;

SET STATISTICS INDEX FK_TBEMPRESA_TIPO_LOG;

SET STATISTICS INDEX FK_TBESTOQUE_ALMOX_CNT;

SET STATISTICS INDEX FK_TBESTOQUE_ALMOX_UND;

SET STATISTICS INDEX FK_TBFORMPAGTO_CCORRENTE;

SET STATISTICS INDEX FK_TBFORMPAGTO_CONDICAO_CPGTO;

SET STATISTICS INDEX FK_TBFORMPAGTO_CONDICAO_FPGTO;

SET STATISTICS INDEX FK_TBFORMPAGTO_CONTACOR_CCR;

SET STATISTICS INDEX FK_TBFORMPAGTO_CONTACOR_FPG;

SET STATISTICS INDEX FK_TBFORNECEDOR_BAI;

SET STATISTICS INDEX FK_TBFORNECEDOR_BANCO;

SET STATISTICS INDEX FK_TBFORNECEDOR_BANCO2;

SET STATISTICS INDEX FK_TBFORNECEDOR_BANCO3;

SET STATISTICS INDEX FK_TBFORNECEDOR_CID;

SET STATISTICS INDEX FK_TBFORNECEDOR_CLIENTE_COD;

SET STATISTICS INDEX FK_TBFORNECEDOR_EST;

SET STATISTICS INDEX FK_TBFORNECEDOR_GRUPO;

SET STATISTICS INDEX FK_TBFORNECEDOR_LOG;

SET STATISTICS INDEX FK_TBFORNECEDOR_PAIS;

SET STATISTICS INDEX FK_TBFORNECEDOR_TIPO_LOG;

SET STATISTICS INDEX FK_TBFUNCIONARIO_END_BAIRRO;

SET STATISTICS INDEX FK_TBFUNCIONARIO_END_CIDADE;

SET STATISTICS INDEX FK_TBFUNCIONARIO_END_ESTADO;

SET STATISTICS INDEX FK_TBFUNCIONARIO_END_LOG;

SET STATISTICS INDEX FK_TBFUNCIONARIO_END_PAIS;

SET STATISTICS INDEX FK_TBFUNCIONARIO_END_TIPOLOG;

SET STATISTICS INDEX FK_TBFUNCIONARIO_FORNECEDOR;

SET STATISTICS INDEX FK_TBFUNCIONARIO_LOGIN;

SET STATISTICS INDEX FK_TBFUNCIONARIO_MOVIMENTO_CBO;

SET STATISTICS INDEX FK_TBFUNCIONARIO_MOVIMENTO_EMP;

SET STATISTICS INDEX FK_TBFUNCIONARIO_MOVIMENTO_FCN;

SET STATISTICS INDEX FK_TBFUNCIONARIO_VENDEDOR;

SET STATISTICS INDEX FK_TBINVENTARIO_ALMOX_CNT;

SET STATISTICS INDEX FK_TBINVENTARIO_ALMOX_EMP;

SET STATISTICS INDEX FK_TBINVENTARIO_ALMOX_ITEM;

SET STATISTICS INDEX FK_TBINVENTARIO_ALMOX_ITEM_PRD;

SET STATISTICS INDEX FK_TBINVENTARIO_ALMOX_ITEM_UND;

SET STATISTICS INDEX FK_TBLOGRADOURO_CID;

SET STATISTICS INDEX FK_TBLOGRADOURO_TIP;

SET STATISTICS INDEX FK_TBNFE_CARTA_CORRECAO_EMP;

SET STATISTICS INDEX FK_TBNFE_CARTA_CORRECAO_NFE;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_CLI;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_EMP;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_FRN;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_ITEM;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_ITEM_PRD;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_NFE;

SET STATISTICS INDEX FK_TBNFE_COMPLEMENTAR_TRN;

SET STATISTICS INDEX FK_TBOS_CLI;

SET STATISTICS INDEX FK_TBOS_COMP;

SET STATISTICS INDEX FK_TBOS_EMP;

SET STATISTICS INDEX FK_TBOS_EVENTO_OS;

SET STATISTICS INDEX FK_TBOS_EVENTO_TEC;

SET STATISTICS INDEX FK_TBOS_TECNICO_OS;

SET STATISTICS INDEX FK_TBOS_TECNICO_TEC;

SET STATISTICS INDEX FK_TBOS_VND;

SET STATISTICS INDEX FK_TBPEDIDOITENS_1;

SET STATISTICS INDEX FK_TBPEDIDOS_2;

SET STATISTICS INDEX FK_TBPEDIDOS_3;

SET STATISTICS INDEX FK_TBPLANO_CONTA_GRUPO;

SET STATISTICS INDEX FK_TBPRODHIST_1;

SET STATISTICS INDEX FK_TBPRODHIST_EMP;

SET STATISTICS INDEX FK_TBPRODUTO_1;

SET STATISTICS INDEX FK_TBPRODUTO_2;

SET STATISTICS INDEX FK_TBPRODUTO_CFOP;

SET STATISTICS INDEX FK_TBPRODUTO_COMBUSTIVEL;

SET STATISTICS INDEX FK_TBPRODUTO_COR;

SET STATISTICS INDEX FK_TBPRODUTO_FABRICANTE;

SET STATISTICS INDEX FK_TBPRODUTO_IBPT;

SET STATISTICS INDEX FK_TBPRODUTO_ORIGEM;

SET STATISTICS INDEX FK_TBPRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX FK_TBPRODUTO_SECAO;

SET STATISTICS INDEX FK_TBPRODUTO_TIPO_VEI;

SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE;

SET STATISTICS INDEX FK_TBPRODUTO_UNIDADE_FRAC;

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROD;

SET STATISTICS INDEX FK_TBPROMOCAO_PRODUTO_PROM;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_CCD;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_CCO;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_EMP;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_ITEM;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_ITM_P;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_ITM_U;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_USI;

SET STATISTICS INDEX FK_TBREQUISICAO_ALMOX_USR;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRAITEM_AUT;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRAITEM_EMP;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRAITEM_FRN;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRAITEM_PRD;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRAITEM_UND;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_CLIENTE;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_CNT_CUSTO;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_COMPET;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_CPAGTO;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_EMISSOR;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_EMPRESA;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_FPAGTO;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_FRN;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_TRANSP;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_USR_AUT;

SET STATISTICS INDEX FK_TBREQUISITA_COMPRA_USR_CNL;

SET STATISTICS INDEX FK_TBSOLICITACAO_CC;

SET STATISTICS INDEX FK_TBSOLICITACAO_EMP;

SET STATISTICS INDEX FK_TBSOLICITACAO_ITEM;

SET STATISTICS INDEX FK_TBSOLICITACAO_ITEM_CCU;

SET STATISTICS INDEX FK_TBSOLICITACAO_ITEM_PRD;

SET STATISTICS INDEX FK_TBSOLICITACAO_ITEM_UND;

SET STATISTICS INDEX FK_TBTPDESPESA_PLANO_CONTA;

SET STATISTICS INDEX FK_TBUSERS_1;

SET STATISTICS INDEX FK_TBUSERS_VENDEDOR;

SET STATISTICS INDEX FK_TBVENDAS_CAIXA;

SET STATISTICS INDEX FK_TBVENDAS_CFOP;

SET STATISTICS INDEX FK_TBVENDAS_CLIENTE_COD;

SET STATISTICS INDEX FK_TBVENDAS_COMPETENCIA;

SET STATISTICS INDEX FK_TBVENDAS_CONDPGTO;

SET STATISTICS INDEX FK_TBVENDAS_DEVOLVER_COMPRA;

SET STATISTICS INDEX FK_TBVENDAS_EMPRESA;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_CPG;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPAGTO_FPG;

SET STATISTICS INDEX FK_TBVENDAS_FORMAPGTO;

SET STATISTICS INDEX FK_TBVENDAS_VENDEDOR;

SET STATISTICS INDEX FK_TBVENDAS_VOLUME;

SET STATISTICS INDEX FK_TVENDASITENS_CLIENTE_COD;

SET STATISTICS INDEX FK_TVENDASITENS_EMPRESA;

SET STATISTICS INDEX FK_TVENDASITENS_PRODUTO;

SET STATISTICS INDEX FK_TVENDASITENS_VENDA;

SET STATISTICS INDEX IBE$LOG_BLOB_FIELDS_IDX1;

SET STATISTICS INDEX IBE$LOG_FIELDS_IDX1;

SET STATISTICS INDEX IBE$LOG_KEYS_IDX1;

SET STATISTICS INDEX IDX_PLANO_CONTA_CONTABIL;

SET STATISTICS INDEX IDX_PLANO_CONTA_EXERCICIO;

SET STATISTICS INDEX IDX_PLANO_CONTA_GRUPO;

SET STATISTICS INDEX IDX_PLANO_CONTA_TIPO;

SET STATISTICS INDEX IDX_PRODHIST_DATAHORA;

SET STATISTICS INDEX IDX_PRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX IDX_SYS_IBPT_NCM;

SET STATISTICS INDEX IDX_SYS_IBPT_TABELA;

SET STATISTICS INDEX IDX_TBAPROPRIACAO_ALMOX_COMP;

SET STATISTICS INDEX IDX_TBAPROPRIACAO_ALMOX_DATA;

SET STATISTICS INDEX IDX_TBAPROPRIACAO_ALMOX_NUMERO;

SET STATISTICS INDEX IDX_TBAPROPRIACAO_ALMOX_STATUS;

SET STATISTICS INDEX IDX_TBAUTORIZA_COMPRAITEM_REC;

SET STATISTICS INDEX IDX_TBAUTORIZA_COMPRA_NUMERO;

SET STATISTICS INDEX IDX_TBCAIXA_MOVIMENTO_CNPJ;

SET STATISTICS INDEX IDX_TBCLIENTE_BLOQUEADO;

SET STATISTICS INDEX IDX_TBCLIENTE_CNPJ;

SET STATISTICS INDEX IDX_TBCOMPRAS_NFE;

SET STATISTICS INDEX IDX_TBCOMPRAS_RECIBO;

SET STATISTICS INDEX IDX_TBCOMPRAS_TIPOS;

SET STATISTICS INDEX IDX_TBCONTPAG_BAIXA_BANCO_FEBRA;

SET STATISTICS INDEX IDX_TBCONTPAG_BAIXA_BCO_EMP;

SET STATISTICS INDEX IDX_TBCONTPAG_BANCO_FEBRABAN;

SET STATISTICS INDEX IDX_TBCONTPAG_BCO_EMP;

SET STATISTICS INDEX IDX_TBCONTPAG_LOTE;

SET STATISTICS INDEX IDX_TBCONTPAG_SITUACAO;

SET STATISTICS INDEX IDX_TBCONTREC_BAIXA_BANCO_FEBRA;

SET STATISTICS INDEX IDX_TBCONTREC_BAIXA_BCO_EMP;

SET STATISTICS INDEX IDX_TBCONTREC_BANCO_FEBRABAN;

SET STATISTICS INDEX IDX_TBCONTREC_BCO_EMP;

SET STATISTICS INDEX IDX_TBCONTREC_CLI_CNPJ;

SET STATISTICS INDEX IDX_TBCONTREC_LOTE;

SET STATISTICS INDEX IDX_TBCONTREC_NOSSONUMERO;

SET STATISTICS INDEX IDX_TBCONTREC_PARCELA;

SET STATISTICS INDEX IDX_TBCONTREC_SITUACAO;

SET STATISTICS INDEX IDX_TBCOTACAO_COMPRAFORN_ATIVO;

SET STATISTICS INDEX IDX_TBCOTACAO_COMPRA_NUMERO;

SET STATISTICS INDEX IDX_TBCOTACAO_COMPRA_STATUS;

SET STATISTICS INDEX IDX_TBESTOQUE_ALMOX_QTDE;

SET STATISTICS INDEX IDX_TBFORMPAGTO_PDV;

SET STATISTICS INDEX IDX_TBFORNECEDOR_CLI_CNPJ;

SET STATISTICS INDEX IDX_TBFORNECEDOR_FUNC;

SET STATISTICS INDEX IDX_TBFUNCAO_CBO;

SET STATISTICS INDEX IDX_TBFUNCAO_CBO_ATIVO;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_ATIVO;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_CPF;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_METAPHONE;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_MOVIMENTO_ADM;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_MOVIMENTO_MAT;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_RG;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_SEXO;

SET STATISTICS INDEX IDX_TBFUNCIONARIO_VEND;

SET STATISTICS INDEX IDX_TBINVENTARIO_ALMOX_ITM_LC;

SET STATISTICS INDEX IDX_TBINVENTARIO_ALMOX_ITM_LR;

SET STATISTICS INDEX IDX_TBNFE_COMPLEMENTAR_CAN;

SET STATISTICS INDEX IDX_TBNFE_COMPLEMENTAR_ITEM;

SET STATISTICS INDEX IDX_TBNFE_COMPLEMENTAR_NRO;

SET STATISTICS INDEX IDX_TBNFE_COMPLEMENTAR_REC;

SET STATISTICS INDEX IDX_TBNFE_COMPLEMENTAR_TIPO;

SET STATISTICS INDEX IDX_TBNFE_ENVIADA_COMPRA;

SET STATISTICS INDEX IDX_TBNFE_ENVIADA_NFC;

SET STATISTICS INDEX IDX_TBNFE_ENVIADA_VENDA;

SET STATISTICS INDEX IDX_TBOS_CNAE;

SET STATISTICS INDEX IDX_TBOS_NCM;

SET STATISTICS INDEX IDX_TBOS_STATUS;

SET STATISTICS INDEX IDX_TBPRODUTO_ALIQUOTA_TIPO;

SET STATISTICS INDEX IDX_TBPRODUTO_DESCRICAO;

SET STATISTICS INDEX IDX_TBPRODUTO_METAFONEMA;

SET STATISTICS INDEX IDX_TBPRODUTO_NOMEAMIGO;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_CMP;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_DAT;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_ITEM_LTA;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_ITEM_LTR;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_ITEM_STA;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_STA;

SET STATISTICS INDEX IDX_TBREQUISICAO_ALMOX_TIP;

SET STATISTICS INDEX IDX_TBREQUISITA_COMPRAITEM_REC;

SET STATISTICS INDEX IDX_TBREQUISITA_COMPRA_NUMERO;

SET STATISTICS INDEX IDX_TBSOLICITACAO_DATA;

SET STATISTICS INDEX IDX_TBSOLICITACAO_EMP;

SET STATISTICS INDEX IDX_TBSOLICITACAO_NUMERO;

SET STATISTICS INDEX IDX_TBSOLICITACAO_STATUS;

SET STATISTICS INDEX IDX_TBSOLICITACAO_TIPO;

SET STATISTICS INDEX IDX_TBTPDESPESA_TIPO;

SET STATISTICS INDEX IDX_TBUNIDADEPROD_SIGLA;

SET STATISTICS INDEX IDX_TBUSERALLOW;

SET STATISTICS INDEX IDX_TBVENDAS_CAIXA_PDV;

SET STATISTICS INDEX IDX_TBVENDAS_CLI_CNPJ;

SET STATISTICS INDEX IDX_TBVENDAS_NFE;

SET STATISTICS INDEX IDX_TBVENDAS_RECIBO;

SET STATISTICS INDEX IDX_TVENDASITENS_CLI_CNPJ;

SET STATISTICS INDEX IDX_TVENDASITENS_ITENS;

SET STATISTICS INDEX PK_RENAVAM_COBUSTIVEL;

SET STATISTICS INDEX PK_RENAVAM_COR;

SET STATISTICS INDEX PK_RENAVAM_TIPOVEICULO;

SET STATISTICS INDEX PK_SYS_ALIQUOTA_ICMS;

SET STATISTICS INDEX PK_SYS_ESTACAO;

SET STATISTICS INDEX PK_SYS_FUNCAO_PERMISSAO;

SET STATISTICS INDEX PK_SYS_IBPT;

SET STATISTICS INDEX PK_SYS_LICENCA;

SET STATISTICS INDEX PK_SYS_ROTINA;

SET STATISTICS INDEX PK_SYS_SISTEMA;

SET STATISTICS INDEX PK_SYS_SISTEMA_ROTINA;

SET STATISTICS INDEX PK_TBAJUSTESTOQ;

SET STATISTICS INDEX PK_TBAPROPRIACAO_ALMOX;

SET STATISTICS INDEX PK_TBAPROPRIACAO_ALMOX_ITEM;

SET STATISTICS INDEX PK_TBAUTORIZA_COMPRA;

SET STATISTICS INDEX PK_TBAUTORIZA_COMPRAITEM;

SET STATISTICS INDEX PK_TBAUTORIZA_REQUISITA;

SET STATISTICS INDEX PK_TBBAIRRO;

SET STATISTICS INDEX PK_TBBANCO;

SET STATISTICS INDEX PK_TBBANCO_BOLETO_EMPRESA;

SET STATISTICS INDEX PK_TBCAIXA;

SET STATISTICS INDEX PK_TBCAIXA_CONSOLIDACAO;

SET STATISTICS INDEX PK_TBCAIXA_MOVIMENTO;

SET STATISTICS INDEX PK_TBCENTRO_CUSTO;

SET STATISTICS INDEX PK_TBCENTRO_CUSTO_EMPRESA;

SET STATISTICS INDEX PK_TBCFOP;

SET STATISTICS INDEX PK_TBCIDADE;

SET STATISTICS INDEX PK_TBCLIENTE;

SET STATISTICS INDEX PK_TBCLIENTE_ESTOQUE;

SET STATISTICS INDEX PK_TBCLIENTE_REQUISICAO;

SET STATISTICS INDEX PK_TBCLIENTE_REQUISICAO_ITEM;

SET STATISTICS INDEX PK_TBCOMPETENCIA;

SET STATISTICS INDEX PK_TBCOMPRAS;

SET STATISTICS INDEX PK_TBCOMPRASITENS;

SET STATISTICS INDEX PK_TBCONDICAOPAGTO;

SET STATISTICS INDEX PK_TBCONFIGURACAO;

SET STATISTICS INDEX PK_TBCONTA_CORRENTE;

SET STATISTICS INDEX PK_TBCONTA_CORRENTE_SALDO;

SET STATISTICS INDEX PK_TBCONTPAG;

SET STATISTICS INDEX PK_TBCONTPAG_BAIXA;

SET STATISTICS INDEX PK_TBCONTREC;

SET STATISTICS INDEX PK_TBCONTREC_BAIXA;

SET STATISTICS INDEX PK_TBCOTACAO_COMPRA;

SET STATISTICS INDEX PK_TBCOTACAO_COMPRAFORN;

SET STATISTICS INDEX PK_TBCOTACAO_COMPRAFORN_ITEM;

SET STATISTICS INDEX PK_TBCOTACAO_COMPRAITEM;

SET STATISTICS INDEX PK_TBCST_COFINS;

SET STATISTICS INDEX PK_TBCST_PIS;

SET STATISTICS INDEX PK_TBDISTRITO;

SET STATISTICS INDEX PK_TBEMPRESA;

SET STATISTICS INDEX PK_TBESTADO;

SET STATISTICS INDEX PK_TBESTOQUE_ALMOX;

SET STATISTICS INDEX PK_TBFABRICANTE;

SET STATISTICS INDEX PK_TBFORMPAGTO;

SET STATISTICS INDEX PK_TBFORMPAGTO_CONDICAO;

SET STATISTICS INDEX PK_TBFORMPAGTO_CONTACOR;

SET STATISTICS INDEX PK_TBFORNECEDOR;

SET STATISTICS INDEX PK_TBFORNECEDOR_GRUPO;

SET STATISTICS INDEX PK_TBFUNCAO;

SET STATISTICS INDEX PK_TBFUNCAO_CBO;

SET STATISTICS INDEX PK_TBFUNCIONARIO;

SET STATISTICS INDEX PK_TBFUNCIONARIO_MOVIMENTO;

SET STATISTICS INDEX PK_TBGRUPOPROD;

SET STATISTICS INDEX PK_TBINVENTARIO_ALMOX;

SET STATISTICS INDEX PK_TBINVENTARIO_ALMOX_ITEM;

SET STATISTICS INDEX PK_TBLOGRADOURO;

SET STATISTICS INDEX PK_TBLOG_TRANSACAO;

SET STATISTICS INDEX PK_TBNFE_CARTA_CORRECAO;

SET STATISTICS INDEX PK_TBNFE_COMPLEMENTAR;

SET STATISTICS INDEX PK_TBNFE_COMPLEMENTAR_ITEM;

SET STATISTICS INDEX PK_TBNFE_ENVIADA;

SET STATISTICS INDEX PK_TBORIGEMPROD;

SET STATISTICS INDEX PK_TBOS;

SET STATISTICS INDEX PK_TBOS_EVENTO;

SET STATISTICS INDEX PK_TBOS_TECNICO;

SET STATISTICS INDEX PK_TBPAIS;

SET STATISTICS INDEX PK_TBPEDIDOITENS;

SET STATISTICS INDEX PK_TBPEDIDOS;

SET STATISTICS INDEX PK_TBPLANO_CONTA;

SET STATISTICS INDEX PK_TBPRODUTO;

SET STATISTICS INDEX PK_TBPRODUTO_ROTATIVIDADE;

SET STATISTICS INDEX PK_TBPROMOCAO;

SET STATISTICS INDEX PK_TBPROMOCAO_PRODUTO;

SET STATISTICS INDEX PK_TBREQUISICAO_ALMOX;

SET STATISTICS INDEX PK_TBREQUISICAO_ALMOX_ITEM;

SET STATISTICS INDEX PK_TBREQUISITA_COMPRA;

SET STATISTICS INDEX PK_TBREQUISITA_COMPRAITEM;

SET STATISTICS INDEX PK_TBSECAOPROD;

SET STATISTICS INDEX PK_TBSEGMENTO;

SET STATISTICS INDEX PK_TBSENHA_AUTORIZACAO;

SET STATISTICS INDEX PK_TBSOLICITACAO;

SET STATISTICS INDEX PK_TBSOLICITACAO_ITEM;

SET STATISTICS INDEX PK_TBTIPO_LOGRADOURO;

SET STATISTICS INDEX PK_TBTPDESPESA;

SET STATISTICS INDEX PK_TBTRIBUTACAO_TIPO;

SET STATISTICS INDEX PK_TBUNIDADEPROD;

SET STATISTICS INDEX PK_TBUSERALLOW;

SET STATISTICS INDEX PK_TBUSERS;

SET STATISTICS INDEX PK_TBVENDAS;

SET STATISTICS INDEX PK_TBVENDAS_FORMAPAGTO;

SET STATISTICS INDEX PK_TBVENDAS_VOLUME;

SET STATISTICS INDEX PK_TBVENDEDOR;

SET STATISTICS INDEX RDB$INDEX_0;

SET STATISTICS INDEX RDB$INDEX_1;

SET STATISTICS INDEX RDB$INDEX_10;

SET STATISTICS INDEX RDB$INDEX_11;

SET STATISTICS INDEX RDB$INDEX_12;

SET STATISTICS INDEX RDB$INDEX_13;

SET STATISTICS INDEX RDB$INDEX_14;

SET STATISTICS INDEX RDB$INDEX_15;

SET STATISTICS INDEX RDB$INDEX_16;

SET STATISTICS INDEX RDB$INDEX_17;

SET STATISTICS INDEX RDB$INDEX_18;

SET STATISTICS INDEX RDB$INDEX_19;

SET STATISTICS INDEX RDB$INDEX_2;

SET STATISTICS INDEX RDB$INDEX_20;

SET STATISTICS INDEX RDB$INDEX_21;

SET STATISTICS INDEX RDB$INDEX_22;

SET STATISTICS INDEX RDB$INDEX_23;

SET STATISTICS INDEX RDB$INDEX_24;

SET STATISTICS INDEX RDB$INDEX_25;

SET STATISTICS INDEX RDB$INDEX_26;

SET STATISTICS INDEX RDB$INDEX_27;

SET STATISTICS INDEX RDB$INDEX_28;

SET STATISTICS INDEX RDB$INDEX_29;

SET STATISTICS INDEX RDB$INDEX_3;

SET STATISTICS INDEX RDB$INDEX_30;

SET STATISTICS INDEX RDB$INDEX_31;

SET STATISTICS INDEX RDB$INDEX_32;

SET STATISTICS INDEX RDB$INDEX_33;

SET STATISTICS INDEX RDB$INDEX_34;

SET STATISTICS INDEX RDB$INDEX_35;

SET STATISTICS INDEX RDB$INDEX_36;

SET STATISTICS INDEX RDB$INDEX_37;

SET STATISTICS INDEX RDB$INDEX_38;

SET STATISTICS INDEX RDB$INDEX_39;

SET STATISTICS INDEX RDB$INDEX_4;

SET STATISTICS INDEX RDB$INDEX_40;

SET STATISTICS INDEX RDB$INDEX_41;

SET STATISTICS INDEX RDB$INDEX_42;

SET STATISTICS INDEX RDB$INDEX_43;

SET STATISTICS INDEX RDB$INDEX_44;

SET STATISTICS INDEX RDB$INDEX_45;

SET STATISTICS INDEX RDB$INDEX_46;

SET STATISTICS INDEX RDB$INDEX_47;

SET STATISTICS INDEX RDB$INDEX_48;

SET STATISTICS INDEX RDB$INDEX_5;

SET STATISTICS INDEX RDB$INDEX_6;

SET STATISTICS INDEX RDB$INDEX_7;

SET STATISTICS INDEX RDB$INDEX_8;

SET STATISTICS INDEX RDB$INDEX_9;

SET STATISTICS INDEX RDB$PRIMARY1;

SET STATISTICS INDEX UNQ1_TBFUNCAO;

SET STATISTICS INDEX UNQ_PRODUTO_CODIGO;

SET STATISTICS INDEX UNQ_SYS_NCM_IBPT;

SET STATISTICS INDEX UNQ_SYS_SISTEMA;

SET STATISTICS INDEX UNQ_TBEMPRESA_CODIGO;

SET STATISTICS INDEX UNQ_TBESTADO_UF;

SET STATISTICS INDEX UNQ_TBESTOQUE_ALMOX;




/*------ SYSDBA 07/01/2016 11:02:12 --------*/

SET TERM ^ ;

ALTER PROCEDURE GET_ALIQUOTA_ICMS(
    UF_ORIGEM DMN_VCHAR_02,
    UF_DESTINO DMN_VCHAR_02)
RETURNS (
    ALIQUOTA_NORMAL DMN_PERCENTUAL,
    ALIQUOTA_ST DMN_PERCENTUAL)
AS
begin
  -- Buscando o Icms normal
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_origem
  Into
    aliquota_normal;

  -- Buscando o Icms ST (Substituicao Tributaria)
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_destino
  Into
    aliquota_st;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_ARQUIVO_NFC(
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE,
    TIPO_ARQUIVO DMN_SMALLINT_N,
    CNPJ_EMITENTE DMN_CNPJ,
    STATUS_VENDA DMN_SMALLINT_N)
RETURNS (
    TIPO VARCHAR(2),
    LINHA VARCHAR(250))
AS
declare variable INSC_ESTADUAL varchar(11);
declare variable QTDE_REGISTRO integer;
begin

  tipo_arquivo  = coalesce(:tipo_arquivo, 1); -- 1. Normal, 2. Retificador
  status_venda  = coalesce(:status_venda, 4); -- 4. NF-e Emitida
  qtde_registro = 0;

  if ( :cnpj_emitente is null ) then
    Select first 1
        e.cnpj
      , replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    Into
        cnpj_emitente
      , insc_estadual;
  else
    Select
        replace(trim(e.ie), '-', '')
    from TBEMPRESA e
    where e.cnpj = :cnpj_emitente
    Into
        insc_estadual;

  /* 1. Definir Identificação do Arquivo (Cabeçalho) */

  tipo  = '10';

  linha =
       :tipo
    || '|' || :tipo_arquivo
    || '|' || '1.00'
    || '|' || trim(:cnpj_emitente)
    || '|' || trim(substring(:insc_estadual from 1 for 9))
    || '|' || trim(right('00' || extract(month from :data_inicial), 2) || right('00' || extract(year from :data_inicial), 4));

  suspend;
  linha = null;

  /* 2. Definir Identificação e Discriminação de Valores da Nota Fiscal */

  tipo = '20';

  for
    Select
         :tipo                                         -- Tipo Registro
      || '|' || '1'                                    -- Modelo da Nota Fiscal
      || '|' || '1'                                    -- Tipo da Operacao
      || '|' || trim(substring(v.serie from 1 for 3))  -- Serie
      || '|' || trim('   ')                            -- Subserie
      || '|' || v.nfe                                  -- Numero NF-e
      || '|' || right('00' ||   extract(day   from v.dataemissao), 2)
             || right('00' ||   extract(month from v.dataemissao), 2)
             || right('0000' || extract(year  from v.dataemissao), 4)  -- Data de Emissao
      || '|' || right('00' ||   extract(day   from n.dataemissao), 2)
             || right('00' ||   extract(month from n.dataemissao), 2)
             || right('0000' || extract(year  from n.dataemissao), 4)  -- Data de Saida (Temporario)
      || '|' || coalesce(trim(substring(v.codcli  from 1 for 14)), '') -- CPF/CNPJ do Cliente
      || '|' || coalesce(trim(substring(c.inscest from 1 for 9)), '')  -- IE do Cliente
      || '|' || coalesce(v.nfe_valor_base_icms, 0)                     -- Valor Base do ICMS
      || '|' || coalesce(v.nfe_valor_icms, 0)                          -- Valor Total do ICMS
      || '|' || coalesce(v.nfe_valor_total_produto, 0)                 -- Valor Total dos Produtos/Servicos
      || '|' || coalesce(v.nfe_valor_desconto, 0)                      -- Valor Total dos Descontos
      || '|' || coalesce(v.nfe_valor_outros, 0)                        -- Valor Total de Outras Despesas
      || '|' || coalesce(v.nfe_valor_total_nota, 0)                    -- Valor Total da Nota Fiscal
    from TBVENDAS v
      inner join TBNFE_ENVIADA n on (n.anovenda = v.ano and n.numvenda = v.codcontrol)
      inner join TBCLIENTE c on (c.codigo = v.codcliente)
    where v.codemp  = :cnpj_emitente
      and v.status  = :status_venda
      and v.dataemissao between :data_inicial and :data_final
    Order by
      v.serie, v.nfe
    Into
      linha
  do
  begin

    linha = replace(:linha, '.', ',');
    suspend;
    linha = null;
    qtde_registro = :qtde_registro + 1;

  end

  /* 3. Definir Totalizador dos registros */

  tipo = '90';

  linha =
       :tipo
    || '|' || :qtde_registro
    || '|' || (:qtde_registro + 2);

  suspend;
  linha = null;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CAIXA_ABERTO(
    EMPRESA DMN_CNPJ,
    USUARIO VARCHAR(12),
    DATA DATE,
    FORMA_PAGTO SMALLINT)
RETURNS (
    ANO_CAIXA SMALLINT,
    NUM_CAIXA INTEGER,
    CONTA_CORRENTE INTEGER)
AS
begin

  Select First 1
      c.Ano
    , c.Numero
    , c.Conta_corrente
  from TBCAIXA c
    Inner join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente and cc.empresa = :empresa)
  where c.Situacao = 0
    and c.Usuario = :Usuario
    and ( (c.Data_abertura = :Data) or (cc.Tipo = 2) )
    and c.Conta_corrente in (
      Select
        fc.conta_corrente
      from TBFORMPAGTO_CONTACOR fc
      where fc.forma_pagto = :Forma_pagto
    )
  into
      Ano_caixa
    , Num_caixa
    , Conta_corrente;

  Suspend;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CAIXA_ABERTO_DETALHE(
    EMPRESA_IN DMN_CNPJ,
    USUARIO_IN VARCHAR(12),
    DATA DATE,
    FORMA_PAGTO SMALLINT)
RETURNS (
    ANO SMALLINT,
    NUMERO INTEGER,
    USUARIO VARCHAR(12),
    DATA_ABERTURA DATE,
    CONTA_CORRENTE INTEGER,
    VALOR_TOTAL_CREDITO NUMERIC(15,2),
    VALOR_TOTAL_DEBITO NUMERIC(15,2))
AS
begin

  Select
      gc.Ano_caixa
    , gc.Num_caixa
    , gc.Conta_corrente
  from GET_CAIXA_ABERTO(:Empresa_in, :Usuario_in, :Data, :Forma_pagto) gc
  into
      Ano
    , Numero
    , Conta_corrente;

  Select
      c.Usuario
    , c.Data_abertura
    , sum( Case when upper(cm.Tipo) = 'C' then cm.Valor else 0 end ) as Valor_total_credito
    , sum( Case when upper(cm.Tipo) = 'D' then cm.Valor else 0 end ) as Valor_total_debito
  from TBCAIXA c
    inner join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm.Caixa_num = c.Numero)
  where c.Ano    = :Ano
    and c.Numero = :Numero
  Group by
      c.Usuario
    , c.Data_abertura
  into
      Usuario
    , Data_abertura
    , Valor_total_credito
    , Valor_total_debito;

  Valor_total_credito = coalesce(:Valor_total_credito, 0);
  Valor_total_debito  = coalesce(:Valor_total_debito,  0);

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CONTA_CORRENTE_SALDO(
    CONTA_CORRENTE INTEGER,
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    SALDO_ANTERIOR_DATA DATE,
    SALDO_ANTERIOR_VALOR NUMERIC(15,2),
    SALDO_INICIAL_DATA DATE,
    SALDO_INICIAL_VALOR NUMERIC(15,2),
    SALDO_FINAL_DATA DATE,
    SALDO_FINAL_VALOR NUMERIC(15,2))
AS
declare variable TMP_DATA date;
begin
  -- Buscar data anterior de saldo
  Select
    max(s.Data_saldo)
  from TBCONTA_CORRENTE_SALDO s
  where s.Codigo = :Conta_corrente
    and s.Data_saldo < :Data_inicial
  into
    Tmp_data;

  -- Buscar valor (SALDO ANTERIOR)
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo = :Tmp_data
  into
      Saldo_anterior_data
    , Saldo_anterior_valor;

  -- Buscar valor (SALDO INICIAL)
  Select
      s2.Data_saldo
    , s2.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s2
  where s2.Codigo = :Conta_corrente
    and s2.Data_saldo = :Data_inicial
  into
      Saldo_inicial_data
    , Saldo_inicial_valor;

  -- Buscar valor (SALDO FINAL)
  Select
      s3.Data_saldo
    , s3.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s3
  where s3.Codigo = :Conta_corrente
    and s3.Data_saldo = :Data_final
  into
      Saldo_final_data
    , Saldo_final_valor;

  Saldo_anterior_data = coalesce(:Saldo_anterior_data, :Data_inicial - 1);
  Saldo_inicial_data  = coalesce(:Saldo_inicial_data,  :Data_inicial);
  Saldo_final_data    = coalesce(:Saldo_final_data,    :Data_final);

  Saldo_anterior_valor = coalesce(:Saldo_anterior_valor, 0);
  Saldo_inicial_valor  = coalesce(:Saldo_inicial_valor,  0);
  Saldo_final_valor    = coalesce(:Saldo_final_valor,    0);

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_CST_NORMAL
RETURNS (
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    DESCRICAO_FULL VARCHAR(250))
AS
declare variable CODIGO_TMP varchar(1);
declare variable DESCRI_TMP varchar(50);
begin
  for
    Select
        o.orp_cod
      , o.orp_descricao
    from TBORIGEMPROD o
    Into
        codigo_tmp
      , descri_tmp
  do
  begin

    for
      Select
          t.tpt_cod
        , t.tpt_descricao
      from TBTRIBUTACAO_TIPO t
      where t.crt = 0
      Into
          Codigo
        , Descricao
    do
    begin

      Codigo    = Trim(:codigo_tmp) || Trim(:Codigo);
      Descricao = Trim(:Descricao) || ' (' || Trim(:descri_tmp) || ')';

      Descricao_Full = :Codigo || ' - ' || :Descricao;

      suspend;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_DIA_UTIL(
    DATA DATE,
    DIAS INTEGER)
RETURNS (
    DIA_UTIL DATE)
AS
begin
  Dia_util = :Data + :Dias;
  if ( Extract(Weekday from :Dia_util) = 0 ) then /* Caso seja domingo */
    Dia_util = :Dia_util + 1;
  else
  if ( Extract(Weekday from :Dia_util) = 6 ) then /* Caso seja sabado */
    Dia_util = :Dia_util + 2;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_ESTOQUE_ALMOX_DISPONIVEL(
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
RETURNS (
    LOTE_ID DMN_GUID_38,
    PRODUTO DMN_VCHAR_10,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
AS
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , ea.unidade
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio / coalesce(p.fracionador, 1.0) end)
    from TBESTOQUE_ALMOX ea
      inner join TBPRODUTO p on (p.cod = ea.produto)
    where (ea.id = :out_lote_guid)
      or (( ea.empresa        = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (:out_produto is null))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.id
      , ea.produto
      , ea.fracionador
      , ea.unidade
    Into
        lote_id
      , produto
      , fracionador
      , unidade
      , estoque
      , custo_total
  do
  begin

    Select
      coalesce(sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
        end
      ), 0.0)
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (r.status  < 4) -- 4. Atendida, 5. Cancelada
      and (ri.status < 2) -- 2. Produto atendido, 3. Produto entregue
      and (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_ESTOQUE_PRODUTO(
    IN_EMPRESA DMN_CNPJ,
    IN_CENTRO_CUSTO DMN_INTEGER_N,
    IN_PRODUTO DMN_VCHAR_10)
RETURNS (
    PRODUTO DMN_VCHAR_10,
    ESTOQUE DMN_QUANTIDADE_D3,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    CUSTO_MEDIO DMN_MONEY,
    LOTE_ID DMN_GUID_38)
AS
declare variable ESTOQUE_UNICO DMN_SMALLINT_N;
begin
  Select
    coalesce(c.estoque_unico_empresas, 0)
  from TBCONFIGURACAO c
  where c.empresa = :in_empresa
  Into
    estoque_unico;

  estoque_unico = coalesce(:estoque_unico, 0);

  if ( coalesce(:in_centro_custo, 0) = 0 ) then
  begin

    /* Buscar no Estoque de Venda */
    Select first 1
        p.cod
      , p.qtde
      , 1.0
      , p.codunidade
      , p.customedio
      , null
    from TBPRODUTO p
    where (p.cod     = :in_produto)
      and ((p.codemp = :in_empresa) or (:estoque_unico = 1))
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio
      , lote_id;

  end
  else
  begin

    /* Buscar no Estoque Apropriado do Centro de Custo */
    Select first 1
        g.produto
      , g.estoque
      , g.fracionador
      , g.unidade
      , g.custo_total / (Case when g.estoque > 0.0 then g.estoque else 1.0 end)
      , g.lote_id
    from GET_ESTOQUE_ALMOX_DISPONIVEL (:in_empresa, :in_centro_custo, :in_produto, null, null, null, null) g
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio
      , lote_id;

    if (:unidade is null) then
    begin
      Select
        p.codunidade_fracionada
      from TBPRODUTO p
      where p.cod = :in_produto
      Into
        unidade;
    end

  end

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_FLUXO_CAIXA(
    IDCONTA INTEGER,
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    DATA DATE,
    CONTA_CORRENTE INTEGER,
    CONTA_CORRENTE_DESC VARCHAR(50),
    FORMA_PAGTO INTEGER,
    FORMA_PAGTO_DESC VARCHAR(50),
    HISTORICO VARCHAR(250),
    TIPO VARCHAR(1),
    ENTRADA NUMERIC(18,2),
    SAIDA NUMERIC(18,2),
    SALDO NUMERIC(18,2),
    CAIXA_ANO INTEGER,
    CAIXA_NUM INTEGER)
AS
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

      /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_GUID_UUID_HEX
RETURNS (
    REAL_UUID CHAR(16) CHARACTER SET OCTETS,
    HEX_UUID VARCHAR(32),
    HEX_UUID_FORMAT VARCHAR(38))
AS
declare variable I integer;
declare variable C integer;
begin

  real_uuid = gen_uuid();
  hex_uuid  = '';

  i = 0;

  while (:i < 16) do
  begin
    c = ascii_val(substring(real_uuid from i + 1 for 1));

    if (:c < 0) then
      c = 256 + :c;

    hex_uuid = :hex_uuid ||
      substring('0123456789abcdef' from bin_shr(:c,  4) + 1 for 1) ||
      substring('0123456789abcdef' from bin_and(:c, 15) + 1 for 1);

    i = :i + 1;
  end

  /*                        8   -  4 -  4 - 4  -      12       */
  /* Formato exemplo: '{5B86B088-F14F-4872-B876-977FBEF9CB91}' */
  hex_uuid_format = '{' ||
    substring(:hex_uuid from  1 for  8) || '-' || -- 8
    substring(:hex_uuid from  9 for  4) || '-' || -- 4
    substring(:hex_uuid from 13 for  4) || '-' || -- 4
    substring(:hex_uuid from 17 for  4) || '-' || -- 4
    substring(:hex_uuid from 21 for 12) || '}';   -- 12

  hex_uuid        = upper(:hex_uuid);
  hex_uuid_format = upper(:hex_uuid_format);

  suspend;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_LIMITE_DISPONIVEL_CLIENTE(
    CODIGO_CLIENTE INTEGER)
RETURNS (
    VALOR_LIMITE NUMERIC(15,2),
    VALOR_COMPRAS_ABERTAS NUMERIC(15,2),
    VALOR_LIMITE_DISPONIVEL NUMERIC(15,2))
AS
begin
  Select
      coalesce(c.Valor_limite_compra, 0)
    , sum( coalesce(r.Valorrec, 0) - coalesce(r.Valorrectot, 0) )
  from TBCLIENTE c
    left join TBCONTREC r on ( (r.cliente = c.codigo and r.Baixado = 0 and r.Parcela > 0) and ((r.Status is null) or (r.Situacao = 1)) )
    left join TBFORMPAGTO f on (f.Cod = r.Forma_pagto and f.Debitar_limite_cliente = 1)
  where c.codigo = :codigo_cliente
  Group by 1
  into
      Valor_limite
    , Valor_compras_abertas;

  Valor_limite            = coalesce(:Valor_limite, 0);
  Valor_limite_disponivel = 0;

  if ( coalesce(:Valor_compras_abertas, 0) <= 0 ) then
    Valor_compras_abertas = 0;

  if ( :Valor_limite > 0 ) then
    Valor_limite_disponivel = :Valor_limite - :Valor_compras_abertas;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_PRODUTO_EXTRATO(
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10)
RETURNS (
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
AS
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
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE GET_PRODUTO_ROTATIVIDADE(
    PRODUTO VARCHAR(10),
    DATA_INICIAL DATE,
    DATA_FINAL DATE)
RETURNS (
    COMPRA_QTDE NUMERIC(18,4),
    COMPRA_VALOR NUMERIC(18,4),
    VENDA_QTDE NUMERIC(18,4),
    VENDA_VALOR NUMERIC(18,4))
AS
begin
  /* Buscar compras */
  Select
      sum(c.qtde)
    , sum(c.qtde * c.customedio)
  from TBCOMPRAS cc
    inner join TBCOMPRASITENS c on (c.ano = cc.ano and c.codcontrol = cc.codcontrol)
  where cc.dtent between :data_inicial and :data_final
    and cc.status in (2, 4) -- Finalizada, NF-e
    and c.codprod = :produto
  Into
      compra_qtde
    , compra_valor;

  /* Buscar vendas */
  Select
      sum(v.qtde)
    , sum(v.qtde * v.pfinal)
  from TBVENDAS vv
    inner join TVENDASITENS v on (v.ano = vv.ano and v.codcontrol = vv.codcontrol)
  where cast(vv.dtvenda as date) between :data_inicial and :data_final
    and vv.status in (3, 4) -- Finalizada, NF-e
    and v.codprod = :produto
  Into
      venda_qtde
    , venda_valor;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_AJUSTE_ESTOQUE_VENDA(
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10,
    QTDE_ATUAL DMN_QUANTIDADE_D3,
    QTDE_NOVA DMN_QUANTIDADE_D3,
    MOTIVO DMN_VCHAR_250,
    DATA_HORA DMN_DATETIME,
    USUARIO DMN_USUARIO,
    DOCUMENTO DMN_VCHAR_10)
AS
declare variable CONTROLE DMN_BIGINT_N;
declare variable QTDE_FINAL DMN_QUANTIDADE_D3;
begin
  if (not exists(
    Select
      p.codigo
    from TBPRODUTO p
    where p.cod = :produto
  )) then
    Exit;

  Select
    max(a.controle)
  from TBAJUSTESTOQ a
  Into
    controle;

  controle   = coalesce(:controle, 0) + 1;
  qtde_final = coalesce(:qtde_atual, 0) + coalesce(:qtde_nova, 0);

  Insert Into TBAJUSTESTOQ (
      controle
    , codprod
    , codempresa
    , codforn
    , qtdeatual
    , qtdenova
    , qtdefinal
    , motivo
    , doc
    , dtajust
    , usuario
  ) values (
      :controle
    , :produto
    , :empresa
    , null
    , :qtde_atual
    , :qtde_nova
    , :qtde_final
    , :motivo
    , :documento
    , :data_hora
    , :usuario
  );
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_ATUALIZAR_CUSTO_PRODUTO(
    PRODUTO DMN_VCHAR_10_KEY,
    VALOR_CUSTO DMN_MONEY,
    SISTEMA DMN_SMALLINT_N)
AS
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Abandonar o procedimento, caso o custo informado seja 0 (zero)
  if ( coalesce(:valor_custo, 0.0) <= 0 ) then
    Exit;

  if (exists(
    Select
      p.codigo
    from TBPRODUTO p
    where p.aliquota_tipo = 0
      and p.cod = :produto
  )) then
  begin

    -- 1. Atualizar Custo do Produto no Cadastro
    Update TBPRODUTO p Set
      p.customedio = :valor_custo
    where p.aliquota_tipo = 0
      and p.cod = :produto;

    -- 2. Atualizar o Custo no Estoque Apropriado
    if ( coalesce(:sistema, 0) = 2 ) then
    begin
      Select
        coalesce(nullif(p.fracionador, 0), 1.0)
      from TBPRODUTO p
      where p.aliquota_tipo = 0
        and p.cod = :produto
      Into
        fracionador;

      Update TBESTOQUE_ALMOX e Set
          e.custo_medio = (:valor_custo / :fracionador)
      where e.produto = :produto;

    end 
  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_AUTORIZACAO_ITENS_REQ(
    AUTORIZACAO_ANO DMN_SMALLINT_NN,
    AUTORIZACAO_COD DMN_BIGINT_NN,
    AUTORIZACAO_EMP DMN_CNPJ_NN,
    USUARIO DMN_USUARIO)
AS
declare variable SEQ integer;
declare variable PRODUTO varchar(10);
declare variable UNIDADE smallint;
declare variable VALOR_UNITARIO DMN_MONEY;
declare variable IPI_PERCENTUAL DMN_PERCENTUAL;
declare variable IPI_VALOR_TOTAL DMN_MONEY;
declare variable QUANTIDADE DMN_QUANTIDADE_D3;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  seq = 0;

  for
    Select
        i.produto
      , i.unidade
      , i.valor_unitario
      , avg(i.ipi_percentual)
      , sum(i.ipi_valor_total)
      , sum(i.quantidade)
      , sum(i.valor_total)
    from TBAUTORIZA_REQUISITA a
      inner join TBREQUISITA_COMPRA r on (r.ano = a.requisicao_ano and r.codigo = a.requisicao_cod and r.empresa = a.requisicao_emp)
      inner join TBREQUISITA_COMPRAITEM i on (i.ano = r.ano and i.codigo = r.codigo and i.empresa = r.empresa)
    where a.autorizacao_ano = :autorizacao_ano
      and a.autorizacao_cod = :autorizacao_cod
      and a.autorizacao_emp = :autorizacao_emp
    group by
        i.produto
      , i.unidade
      , i.valor_unitario
    Into
        produto
      , unidade
      , valor_unitario
      , ipi_percentual
      , ipi_valor_total
      , quantidade
      , valor_total
  do
  begin
    seq = :seq + 1;

    Insert Into TBAUTORIZA_COMPRAITEM (
        ANO
      , CODIGO
      , EMPRESA
      , SEQ
      , FORNECEDOR
      , PRODUTO
      , QUANTIDADE
      , UNIDADE
      , VALOR_UNITARIO
      , IPI_PERCENTUAL
      , IPI_VALOR_TOTAL
      , VALOR_TOTAL
      , CONFIRMADO_RECEBIMENTO
      , USUARIO
    ) values (
        :autorizacao_ano
      , :autorizacao_cod
      , :autorizacao_emp
      , :seq
      , null
      , :produto
      , :quantidade
      , :unidade
      , :valor_unitario
      , :ipi_percentual
      , :ipi_valor_total
      , :valor_total
      , 0
      , :usuario
    );

  end
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_BAIRRO(
    NOM_BAIRRO VARCHAR(100),
    COD_CIDADE INTEGER,
    COD_DISTRITO INTEGER)
RETURNS (
    COD_BAIRRO INTEGER)
AS
begin
  /* 1. Buscar codigo do Bairro */
  Select first 1
    b.bai_cod
  from TBBAIRRO b
  where b.cid_cod = :cod_cidade
    and trim(b.bai_nome) = Trim(:nom_bairro)
  Into
    cod_bairro;

  /* 2. Inserir bairro caso ele nao exista */
  if ( coalesce(:cod_bairro, 0) = 0 ) then
  begin
    cod_bairro = Gen_id(GEN_BAIRRO_ID, 1);
    Insert Into TBBAIRRO (
        bai_cod
      , bai_nome
      , cid_cod
      , dis_cod
    ) values (
        :cod_bairro
      , :nom_bairro
      , :cod_cidade
      , :cod_distrito
    );
  end 

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_CONSOLIDAR(
    ANO_CAIXA SMALLINT,
    NUM_CAIXA INTEGER)
AS
declare variable FORMA_PAGTO smallint;
declare variable FORMA_PAGTO_DESC varchar(50);
declare variable TOTAL_CREDITO numeric(18,2);
declare variable TOTAL_DEBITO numeric(18,2);
declare variable TOTAL_CREDITO_EST numeric(18,2);
declare variable TOTAL_DEBITO_EST numeric(18,2);
declare variable SEQUENCIAL integer;
begin
  -- Limpar Tabela
  Delete from TBCAIXA_CONSOLIDACAO c
  where c.Ano    = :Ano_caixa
    and c.Numero = :Num_caixa
    and c.Forma_pagto is not null;

  for
    Select
        m.Forma_pagto
      , f.Descri
      , sum( case when ((upper(m.Tipo) = 'C') and (m.Estorno = 0)) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when ((upper(m.Tipo) = 'D') and (m.Estorno = 0)) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when ((upper(m.Tipo) = 'C') and (m.Estorno = 1)) then coalesce(m.Valor, 0) else 0 end )
      , sum( case when ((upper(m.Tipo) = 'D') and (m.Estorno = 1)) then coalesce(m.Valor, 0) else 0 end )
    from TBCAIXA_MOVIMENTO m
      inner join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
    where m.Caixa_ano = :Ano_caixa
      and m.Caixa_num = :Num_caixa
      and m.Situacao  = 1 -- Confirmado
    Group by
        m.Forma_pagto
      , f.Descri
    into
        Forma_pagto
      , Forma_pagto_desc
      , Total_credito
      , Total_debito
      , Total_credito_Est
      , Total_debito_Est
  do
  begin

    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano    = :Ano_caixa
      and c.Numero = :Num_caixa
    into
      Sequencial;

    Sequencial = coalesce(:Sequencial, 0) + 1;

    Insert Into TBCAIXA_CONSOLIDACAO (
        Ano
      , Numero
      , Seq
      , Forma_pagto
      , Descricao
      , Total_credito
      , Total_debito
      , Total_credito_Estorno
      , Total_debito_Estorno
    ) values (
        :Ano_caixa
      , :Num_caixa
      , :Sequencial
      , :Forma_pagto
      , :Forma_pagto_desc
      , coalesce(:Total_credito, 0)
      , coalesce(:Total_debito, 0)
      , coalesce(:Total_credito_Est, 0)
      , coalesce(:Total_debito_Est, 0)
    );

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
declare variable TIPO_DESPESA smallint;
begin
  -- Montar Historico
  Select
      coalesce(cc.Codemp, r.empresa)
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
    , r.codtpdesp
  from TBCONTPAG r
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
    left join TBFORNECEDOR f on (f.Codforn = coalesce(cc.Codforn, r.codforn))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra
    , tipo_despesa;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Tipo_Despesa
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :tipo_despesa
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG_ESTORNO(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Montar Historico
  Select
      coalesce(cc.Codemp, r.empresa)
    , cc.Codforn
    , substring((
        'ESTORNO DO PAGTO. DA DUPLICATA No. ' || r.Anocompra || '/' || r.Numcompra || ' P' || :Seq ||
        ' DA COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
      ) from 1 for 250)
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , 1
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable CLIENTE_COD integer;
declare variable CLIENTE_CNPJ varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Montar Historico
  Select
      coalesce(v.Codemp, r.empresa)
    , coalesce(v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBCLIENTE c on (c.codigo = coalesce(v.codcliente, r.cliente))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda;

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
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
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
    , :Historico
    , :Valor_baixa
    , 1
    , :Ano_venda
    , :Num_venda
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

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC_ESTORNO(
    USUARIO VARCHAR(12),
    DATA_PAGTO TIMESTAMP,
    FORMA_PAGTO SMALLINT,
    ANOLANC SMALLINT,
    NUMLANC INTEGER,
    SEQ SMALLINT,
    VALOR_BAIXA NUMERIC(18,2))
AS
declare variable EMPRESA varchar(18);
declare variable CLIENTE_COD integer;
declare variable CLIENTE_CNPJ varchar(18);
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_VENDA smallint;
declare variable NUM_VENDA integer;
begin
  -- Montar Historico
  Select
      coalesce(v.Codemp, r.empresa)
    , r.cliente
    , c.cnpj
    , substring((
        'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq ||
        ' VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
      ) from 1 for 250)
    , r.Anovenda
    , r.Numvenda
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
    , Num_venda;

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

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_COMPETENCIA(
    NUMERO INTEGER,
    DESCRICAO VARCHAR(50))
AS
begin
  if ( (trim(coalesce(:descricao, '')) = '') and (:numero > 200000) ) then
  begin
    descricao = Case Cast(substring(:numero from 5 for 2) as Smallint)
                  when  1 then 'JAN/' || substring(:numero from 1 for 4)
                  when  2 then 'FEV/' || substring(:numero from 1 for 4)
                  when  3 then 'MAR/' || substring(:numero from 1 for 4)
                  when  4 then 'ABR/' || substring(:numero from 1 for 4)
                  when  5 then 'MAI/' || substring(:numero from 1 for 4)
                  when  6 then 'JUN/' || substring(:numero from 1 for 4)
                  when  7 then 'JUL/' || substring(:numero from 1 for 4)
                  when  8 then 'AGO/' || substring(:numero from 1 for 4)
                  when  9 then 'SET/' || substring(:numero from 1 for 4)
                  when 10 then 'OUT/' || substring(:numero from 1 for 4)
                  when 11 then 'NOV/' || substring(:numero from 1 for 4)
                  when 12 then 'DEZ/' || substring(:numero from 1 for 4)
                  else
                    :descricao
                end;
  end
   
  if (not exists(
    Select
      c.cmp_num
    from TBCOMPETENCIA c
    where c.cmp_num = :numero
  )) then
  begin

    Insert Into TBCOMPETENCIA (
        cmp_num
      , cmp_desc
    ) values (
        :numero
      , :descricao
    );

  end
  else
  begin

    Update TBCOMPETENCIA c Set
      c.cmp_desc = :descricao
    where c.cmp_num = :numero
      and c.cmp_desc is null;

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CONTA_CORRENTE_SALDO(
    CONTA_CORRENTE INTEGER,
    DATA_MOVIMENTO DATE)
AS
declare variable DATA_SALDO_ANT date;
declare variable VALOR_SALDO_ANT numeric(15,2);
declare variable TOTAL_CREDITO_DIA numeric(15,2);
declare variable TOTAL_DEBITO_DIA numeric(15,2);
declare variable TOTAL_SALDO_DIA numeric(15,2);
begin
  -- Buscar Saldo anterior
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE_SALDO s1
  where s1.Codigo = :Conta_corrente
    and s1.Data_saldo in (
      Select
        max(s2.Data_saldo)
      from TBCONTA_CORRENTE_SALDO s2
      where s2.Codigo = :Conta_corrente
        and s2.Data_saldo < :Data_movimento
    )
  into
      Data_saldo_ant
    , Valor_saldo_ant;

  -- Gravar Saldo anterior caso nao exista
  if ( :Data_saldo_ant is null ) then
  begin
    Data_saldo_ant  = :Data_movimento - 1;
    Valor_saldo_ant = 0;

    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_saldo_ant
      , :Valor_saldo_ant
    );
  end 

  -- Consolidar Creditos e Debitos do dia
  Select
      sum( Case when upper(m.Tipo) = 'C' then m.Valor else 0 end )
    , sum( Case when upper(m.Tipo) = 'D' then m.Valor else 0 end )
  from TBCAIXA_MOVIMENTO m
  where m.Situacao = 1 -- Confirmado
    and m.Conta_corrente = :Conta_corrente
    and cast(m.Datahora as Date ) = :Data_movimento
  into
      Total_credito_dia
    , Total_debito_dia;

  Total_saldo_dia = :Valor_saldo_ant + coalesce(:Total_credito_dia, 0) - coalesce(:Total_debito_dia, 0);

  /* Gerar Saldo Conta Corrente do Dia */
  if ( not Exists(
    Select
      s3.Codigo
    from TBCONTA_CORRENTE_SALDO s3
    where s3.Codigo = :Conta_corrente
      and s3.Data_saldo = :Data_movimento
  ) ) then
  begin

    -- Inserir Saldo do Dia
    Insert Into TBCONTA_CORRENTE_SALDO (
        Codigo
      , Data_saldo
      , Valor_saldo
    ) values (
        :Conta_corrente
      , :Data_movimento
      , :Total_saldo_dia
    );

   end
   else
   begin

     -- Atualizar Saldo do Dia
     Update TBCONTA_CORRENTE_SALDO s Set
       s.Valor_saldo = :Total_saldo_dia
     where s.Codigo = :Conta_corrente
       and s.Data_saldo = :Data_movimento;

   end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_COTACAO_COMPRAFORN_ITEM(
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN,
    FORNECEDOR DMN_INTEGER_NN)
AS
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  /* 1. Inserir Itens na planilha de resposta do fornecedor quando nao existirem */

  Insert Into TBCOTACAO_COMPRAFORN_ITEM (
      ano
    , codigo
    , empresa
    , fornecedor
    , item
    , valor_unitario
    , valor_total
  ) Select
        i.ano
      , i.codigo
      , i.empresa
      , :fornecedor
      , i.seq
      , null
      , null
    from TBCOTACAO_COMPRAITEM i
      left join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa and f.fornecedor = :fornecedor)
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and f.item is null
    order by i.seq;

  /* 2. Calcular o valor total de cada item dessa planilha */

  for
    Select
        i.seq
      , coalesce(i.quantidade, 0) * coalesce(f.valor_unitario, 0.0)
    from TBCOTACAO_COMPRAITEM i
      inner join TBCOTACAO_COMPRAFORN_ITEM f on (f.ano = i.ano and f.codigo = i.codigo and f.empresa = i.empresa)
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and coalesce(f.valor_unitario, 0.0) > 0
    Into
        item
      , valor_total
  do
  begin

    Update TBCOTACAO_COMPRAFORN_ITEM f Set
      f.valor_total = :valor_total
    where f.ano     = :ano
      and f.codigo  = :codigo
      and f.empresa = :empresa
      and f.fornecedor = :fornecedor
      and f.item       = :item;

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_COTACAO_COMPRAFORN_PROCESSA(
    ANO DMN_SMALLINT_NN,
    CODIGO DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
AS
declare variable ITEM DMN_SMALLINT_NN;
declare variable VALOR_MAXIMO DMN_MONEY;
declare variable VALOR_MINIMO DMN_MONEY;
declare variable VALOR_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO DMN_MONEY;
declare variable TOTAL_MINIMO DMN_MONEY;
declare variable TOTAL_MEDIO DMN_MONEY;
declare variable TOTAL_MAXIMO_DESC DMN_MONEY;
declare variable TOTAL_MINIMO_DESC DMN_MONEY;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
      and fi.valor_unitario > 0.0
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido > 0.0
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CST_COFINS(
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    INDICE_ACBR SMALLINT)
AS
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_COFINS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_COFINS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_COFINS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_CST_PIS(
    CODIGO VARCHAR(3),
    DESCRICAO VARCHAR(250),
    INDICE_ACBR SMALLINT)
AS
begin
  if ( Trim(coalesce(:Codigo, '')) <> '' ) then
  begin
    Codigo      = Trim(:Codigo);
    Descricao   = Trim(:Descricao);
    Indice_acbr = coalesce(:Indice_acbr, 99);

    if (not Exists(
      Select
        p.Codigo
      from TBCST_PIS p
      where p.Codigo = :Codigo
    )) then
    begin

      /* Inserir CST, caso nao exista */

      Insert Into TBCST_PIS (
          Codigo
        , Descricao
        , Indice_acbr
      ) values (
          :Codigo
        , :Descricao
        , :Indice_acbr
      );

    end
    else
    begin

      /* Atualizar CST, caso exista */

      Update TBCST_PIS Set
          Descricao   = :Descricao
        , Indice_acbr = :Indice_acbr
      where Codigo = :Codigo;

    end 

  end 
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_DUPLICATA_PAGAR(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER,
    FORNECEDOR INTEGER,
    NF INTEGER,
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT,
    TIPO_DESPESA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable EMPRESA DMN_CNPJ;
declare variable EMPRESA_NOME DMN_VCHAR_60;
declare variable FORMA_PAGTO_DESC DMN_VCHAR_30;
declare variable COMPETENCIA InTeger;
begin
  if ( Exists(
    Select
      p.Numlanc
    from TBCONTPAG p
    where p.Anocompra = :Anocompra
      and p.Numcompra = :Numcompra
      and p.forma_pagto = :forma_pagto
      and p.Parcela     = :Parcela
  ) ) then
    Exit;

  -- Buscar o CNPJ da Empresa para se usar no lancamento da duplicata (Contas A Pagar)
  Select first 1
      c.codemp
    , e.rzsoc
  from TBCOMPRAS c
    left join TBEMPRESA e on (e.cnpj = c.codemp)
  where c.ano = :anocompra
    and c.codcontrol = :numcompra
  Into
      Empresa
    , Empresa_Nome;

  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = :Forma_pagto
  into
    Forma_pagto_desc;

  Anolancamento = :Anocompra;

  if ( :Anolancamento = 2011 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2011, 1);
  else
  if ( :Anolancamento = 2012 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2012, 1);
  else
  if ( :Anolancamento = 2013 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2013, 1);
  else
  if ( :Anolancamento = 2014 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2014, 1);
  else
  if ( :Anolancamento = 2015 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2015, 1);
  else
  if ( :Anolancamento = 2016 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2016, 1);
  else
  if ( :Anolancamento = 2017 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2017, 1);
  else
  if ( :Anolancamento = 2018 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2018, 1);
  else
  if ( :Anolancamento = 2019 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2019, 1);
  else
  if ( :Anolancamento = 2020 ) then
    Numlancamento = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  --competencia = extract(year from :Vencimento - 30) || right('00' || extract(month from :Vencimento - 30), 2);
  competencia = extract(year from :emissao) || right('00' || extract(month from :emissao), 2);

  Insert Into TBCONTPAG (
      Anolanc
    , Numlanc
    , Empresa
    , NomeEmp
    , Anocompra
    , Numcompra
    , Parcela
    , Codforn
    , Tippag
    , Forma_pagto
    , Condicao_pagto
    , Codtpdesp
    , Notfisc
    , Dtemiss
    , Dtvenc
    , competencia_apuracao
    , Valorpag
    , ValorSaldo
    , Quitado
    , Situacao
  ) values (
      :Anolancamento
    , :Numlancamento
    , :Empresa
    , substring(:Empresa_Nome from 1 for 40)
    , :Anocompra
    , :Numcompra
    , :Parcela
    , :Fornecedor
    , :Forma_pagto_desc
    , :Forma_pagto
    , :Condicao_pagto
    , :Tipo_Despesa
    , :Nf
    , :Emissao
    , :Vencimento
    , :Competencia
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_FUNCAO_PERMISSAO(
    SIS_CODIGO DMN_SMALLINT_NN,
    FUN_CODIGO DMN_SMALLINT_NN,
    ROT_CODIGO DMN_VCHAR_10_KEY,
    ACESSO DMN_LOGICO)
AS
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :sis_codigo
  )) then
    Exit;

  if (not exists(
    Select
      f.cod
    from TBFUNCAO f
    where f.cod = :fun_codigo
  )) then
    Exit;

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = :rot_codigo
  )) then
    Exit;

  if (not exists(
    Select
      fp.sistema
    from SYS_FUNCAO_PERMISSAO fp
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo
  )) then
    Insert Into SYS_FUNCAO_PERMISSAO values (:sis_codigo, :fun_codigo, :rot_codigo, :acesso);
  else
    Update SYS_FUNCAO_PERMISSAO fp Set
      fp.acesso = :acesso
    where fp.sistema = :sis_codigo
      and fp.funcao  = :fun_codigo
      and fp.rotina  = :rot_codigo;
end
^

SET TERM ; ^

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.SIS_CODIGO IS
'Codigo do Sistema';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.FUN_CODIGO IS
'Codigo da Funcao';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ROT_CODIGO IS
'Codigo da Rotina';

COMMENT ON PARAMETER SET_FUNCAO_PERMISSAO.ACESSO IS
'Permissao de Acesso (0 - Nao, 1 - Sim)';

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_DUPLICATAS(
    ANOCOMPRA SMALLINT,
    NUMCOMPRA INTEGER)
RETURNS (
    FORNECEDOR INTEGER,
    NOTAFISCAL INTEGER,
    PARCELAS SMALLINT,
    VALOR_TOTAL NUMERIC(15,2),
    PARCELA SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    FORMA_PAGTO SMALLINT,
    CONDICAO_PAGTO SMALLINT,
    DATA_ENTRADA DATE,
    ANO_LANC SMALLINT,
    NUM_LANC INTEGER)
AS
declare variable TIPO_DESPESA smallint;
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
        c.Codforn
      , c.Nf
      , c.tipo_despesa
      , coalesce(c.Prazo_01, 0)
      , c.Prazo_02
      , c.Prazo_03
      , c.Prazo_04
      , c.Prazo_05
      , c.Prazo_06
      , c.Prazo_07
      , c.Prazo_08
      , c.Prazo_09
      , c.Prazo_10
      , c.Prazo_11
      , c.Prazo_12
      , case when coalesce(c.Prazo_01, 0) is not null then 1 else 0 end +
        case when c.Prazo_02 is not null then 1 else 0 end +
        case when c.Prazo_03 is not null then 1 else 0 end +
        case when c.Prazo_04 is not null then 1 else 0 end +
        case when c.Prazo_05 is not null then 1 else 0 end +
        case when c.Prazo_06 is not null then 1 else 0 end +
        case when c.Prazo_07 is not null then 1 else 0 end +
        case when c.Prazo_08 is not null then 1 else 0 end +
        case when c.Prazo_09 is not null then 1 else 0 end +
        case when c.Prazo_10 is not null then 1 else 0 end +
        case when c.Prazo_11 is not null then 1 else 0 end +
        case when c.Prazo_12 is not null then 1 else 0 end as parcelas
      , c.Totalnf
      , c.Formapagto_cod
      , c.Condicaopagto_cod
      , coalesce(c.dtemiss, c.dtent)
    from TBCOMPRAS c
    where c.Ano        = :Anocompra
      and c.Codcontrol = :Numcompra
    into
        Fornecedor
      , NotaFiscal
      , Tipo_Despesa
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
      , Condicao_pagto
      , Data_entrada
  do
  begin

    parcela = 0;
    emissao = :Data_entrada;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 2
    if ( :P02 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 3
    if ( :P03 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 4
    if ( :P04 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 5
    if ( :P05 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 6
    if ( :P06 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 7
    if ( :P07 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 8
    if ( :P08 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 9
    if ( :P09 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 10
    if ( :P10 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 11
    if ( :P11 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Parcela 12
    if ( :P12 is not null ) then
    begin
      parcela = :Parcela + 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          d.Anolancamento
        , d.Numlancamento
      from SET_DUPLICATA_PAGAR (
          :Anocompra
        , :Numcompra
        , :Fornecedor
        , :Notafiscal
        , :Forma_pagto
        , :Condicao_pagto
        , :Emissao
        , :Vencimento
        , :Valor_documento
        , :Parcela
        , :Tipo_Despesa) d
      into
          Ano_lanc
        , Num_lanc;
    end

    -- Verificar ao valor total das parcelas
    if ( :Parcelas > 1 ) then
    begin
      Select
          sum( coalesce(d.Valorpag, 0) )
      from TBCONTPAG d
      where d.Anocompra = :Anocompra
        and d.Numcompra = :Numcompra
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTPAG d Set
            d.Valorpag = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where d.Anocompra = :Anocompra
          and d.Numcompra = :Numcompra
          and d.Parcela   = :Parcela;
      end 
    end 

  end
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_GERAR_TITULOS(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER)
RETURNS (
    EMPRESA VARCHAR(18),
    CLIENTE_COD INTEGER,
    CLIENTE_CNPJ VARCHAR(18),
    PARCELAS SMALLINT,
    VALOR_TOTAL NUMERIC(15,2),
    PARCELA SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    FORMA_PAGTO SMALLINT,
    DATA_FINALIZ_VENDA DATE,
    ANO_LANC SMALLINT,
    NUM_LANC INTEGER)
AS
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
        x.codemp
      , x.codcliente
      , x.Codcli
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
      , v.Formapagto_cod
      , x.Dtfinalizacao_venda
    from TBVENDAS x
      inner join TBVENDAS_FORMAPAGTO v on (v.ano_venda = x.ano and v.controle_venda = x.codcontrol)
    where x.Ano        = :Anovenda
      and x.Codcontrol = :Numvenda
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
      , data_finaliz_venda
  do
  begin

    parcela = 0;
    emissao = :Data_finaliz_venda;
    valor_documento = :Valor_total / :Parcelas;

    -- Parcela 1
    if ( :P01 is not null ) then
    begin
      if ( :P01 = 0 ) then
        parcela = 0;
      else
      if ( :P01 > 0 ) then
        parcela = 1;

      Select d.Dia_util from Get_dia_util(:Emissao, :P01) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P02) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P03) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P04) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P05) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P06) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P07) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P08) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P09) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P10) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P11) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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

      Select d.Dia_util from Get_dia_util(:Emissao, :P12) d into vencimento;

      Select
          t.Anolancamento
        , t.Numlancamento
      from SET_TITULO_RECEBER (
          :Anovenda
        , :Numvenda
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
      where r.Anovenda = :Anovenda
        and r.Numvenda = :Numvenda
        and r.forma_pagto = :forma_pagto
      into
          valor_total_parcelas;

      -- Atualizar o valor da ultima parcela
      if ( :Valor_total_parcelas < :Valor_total ) then
      begin
        Update TBCONTREC r Set
            r.Valorrec = :Valor_documento + (:Valor_total - :Valor_total_parcelas)
        where r.Anovenda = :Anovenda
          and r.Numvenda = :Numvenda
          and r.forma_pagto = :forma_pagto
          and r.Parcela  = :Parcela;
      end 
    end 

  end
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_LOGRADOURO(
    NOM_LOGRADOURO VARCHAR(250),
    TIP_LOGRADOURO VARCHAR(10),
    COD_CIDADE INTEGER)
RETURNS (
    COD_LOGRADOURO INTEGER,
    COD_TIPO SMALLINT)
AS
declare variable TMP_TIPO smallint;
declare variable TMP_DESC varchar(250);
begin
  /* 1. Buscar codigo do Tipo do Logradouro */
  Select first 1
    t.tlg_cod
  from TBTIPO_LOGRADOURO t
  where coalesce(t.tlg_sigla, t.tlg_descricao) like Trim(:tip_logradouro) || '%'
  Into
    tmp_tipo;

  /* 2. Ajustar descricao do logradouro */
  if ( coalesce(:tmp_tipo, 0) = 0 ) then
    tmp_desc = trim(:tip_logradouro) || ' ' || trim(:nom_logradouro);
  else
    tmp_desc = trim(:nom_logradouro);

  /* 3. Buscar codigo do Logradouro */
  Select first 1
    l.log_cod
  from TBLOGRADOURO l
  where l.cid_cod = :cod_cidade
    and trim(l.log_nome) = Trim(:tmp_desc)
  Into
    cod_logradouro;

  /* 4. Inserir Logradouro, caso ele nao exista */
  if ( coalesce(:cod_logradouro, 0) = 0 ) then
  begin
    cod_logradouro = Gen_id(GEN_LOGRADOURO_ID, 1);
    Insert Into TBLOGRADOURO (
        log_cod
      , log_nome
      , tlg_cod
      , cid_cod
    ) values (
        :cod_logradouro
      , :tmp_desc
      , :tmp_tipo
      , :cod_cidade
    );
  end

  cod_tipo = tmp_tipo;

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_PRODUTO_ROTATIVIDADE(
    DATA DATE,
    USUARIO VARCHAR(30),
    PRODUTO VARCHAR(10),
    EXCLUIR_ROT SMALLINT,
    TIPO_ROTATI SMALLINT,
    ULTIMA_COMPRA DATE,
    ULTIMA_VENDA DATE)
AS
declare variable TMP_DATA_INI date;
declare variable TMP_DATA_FIM date;
declare variable TMP_COMPRA_QTDE numeric(18,4);
declare variable TMP_COMPRA_VALOR numeric(18,4);
declare variable TMP_VENDA_QTDE numeric(18,4);
declare variable TMP_VENDA_VALOR numeric(18,4);
declare variable UM integer;
declare variable TRES integer;
declare variable SEIS integer;
declare variable NOVE integer;
declare variable DOZE integer;
declare variable NNNN integer;
begin
  um   = 30 * 1;
  tres = 30 * 3;
  seis = 30 * 6;
  nove = 30 * 9;
  doze = 30 * 12;
  nnnn = 30 * 36;

  excluir_rot = coalesce(:excluir_rot, 0);
  tipo_rotati = coalesce(:tipo_rotati, 0); /* 0. Compra | 1. Venda */

  -- Excluir processamento antigo
  if ( :excluir_rot = 1 ) then
    Delete from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto  = :produto;

  /************************************* MES 0-1 *************************************/

  tmp_data_fim = :data;
  tmp_data_ini = :tmp_data_fim - :um;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_01
        , compra_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_01
        , venda_valor_01
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_01  = :tmp_compra_qtde
        , rp.compra_valor_01 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_01   = :tmp_venda_qtde
        , rp.venda_valor_01  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 1-3 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :tres;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_03
        , compra_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_03
        , venda_valor_03
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_03  = :tmp_compra_qtde
        , rp.compra_valor_03 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_03   = :tmp_venda_qtde
        , rp.venda_valor_03  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 3-6 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :seis;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_06
        , compra_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_06
        , venda_valor_06
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_06  = :tmp_compra_qtde
        , rp.compra_valor_06 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_06   = :tmp_venda_qtde
        , rp.venda_valor_06  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 6-9 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nove;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_09
        , compra_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_09
        , venda_valor_09
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_09  = :tmp_compra_qtde
        , rp.compra_valor_09 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_09   = :tmp_venda_qtde
        , rp.venda_valor_09  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 9-12 *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :doze;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_12
        , compra_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_12
        , venda_valor_12
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_12  = :tmp_compra_qtde
        , rp.compra_valor_12 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_12   = :tmp_venda_qtde
        , rp.venda_valor_12  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  /************************************* MES 12-nn *************************************/

  tmp_data_fim = :tmp_data_ini - 1;
  tmp_data_ini = :tmp_data_fim - :nnnn;

  Select
      r.compra_qtde
    , r.compra_valor
    , r.venda_qtde
    , r.venda_valor
  from GET_PRODUTO_ROTATIVIDADE(:produto, :tmp_data_ini, :tmp_data_fim) r
  Into
      tmp_compra_qtde
    , tmp_compra_valor
    , tmp_venda_qtde
    , tmp_venda_valor;

  if (not exists(
    Select
      x.cod_produto
    from TBPRODUTO_ROTATIVIDADE x
    where x.cod_produto = :produto
  )) then
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , compra_qtde_99
        , compra_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_compra_qtde
        , :tmp_compra_valor
        , current_date
        , current_time
        , :usuario
      );

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Insert Into TBPRODUTO_ROTATIVIDADE (
          cod_produto
        , venda_qtde_99
        , venda_valor_99
        , processo_data
        , processo_hora
        , processo_usuario
      ) values (
          :produto
        , :tmp_venda_qtde
        , :tmp_venda_valor
        , current_date
        , current_time
        , :usuario
      );

    end

  end 
  else
  begin

    if ( :tipo_rotati = 0 ) then -- Compra
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.compra_qtde_99  = :tmp_compra_qtde
        , rp.compra_valor_99 = :tmp_compra_valor
      where rp.cod_produto = :produto;

    end
    else
    if ( :tipo_rotati = 1 ) then -- Venda
    begin

      Update TBPRODUTO_ROTATIVIDADE rp Set
          rp.venda_qtde_99   = :tmp_venda_qtde
        , rp.venda_valor_99  = :tmp_venda_valor
      where rp.cod_produto = :produto;

    end

  end 

  -- Atualizar das Datas de Compra e Venda
  Update TBPRODUTO_ROTATIVIDADE rp Set
      rp.data_ultima_compra = :ultima_compra
    , rp.data_ultima_venda = :ultima_venda
  where rp.cod_produto = :produto;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_REQUISICAO_ALMOX_CUSTO(
    ANO DMN_SMALLINT_NN,
    CONTROLE DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
AS
declare variable ITEM DMN_SMALLINT_NN;
declare variable CUSTO_MEDIO DMN_MONEY_4;
declare variable SITUACAO DMN_STATUS;
declare variable QTDE DMN_QUANTIDADE_D3;
declare variable QTDE_ATEND DMN_QUANTIDADE_D3;
declare variable VALOR_TOTAL DMN_MONEY;
begin
  -- 1. Buscar valores atualizados de custo para os produtos e atualiza-los na requisicao
  for
    Select
        ri.item
      , ri.qtde
      , ri.qtde_atendida
      , Cast(
          Case when ep.custo_medio > 0.0
            then ep.custo_medio
            else (p.customedio / (Case when coalesce(p.fracionador, 1.0) < 1 then 1.0 else coalesce(p.fracionador, 1.0) end))
          end
        as DMN_MONEY_4)
      , ri.status
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
      inner join TBESTOQUE_ALMOX ep on (ep.id = ri.lote_atendimento)
      inner join TBPRODUTO p on (p.cod = ri.produto)
    where r.ano      = :ano
      and r.controle = :controle
      and r.empresa  = :empresa
    Into
        item
      , qtde
      , qtde_atend
      , custo_medio
      , situacao
  do
  begin

    Update TBREQUISICAO_ALMOX_ITEM ri Set
        ri.custo = :custo_medio
      , ri.total =
            Case :situacao
              when 0 then :qtde * :custo_medio       -- Pendente
              when 1 then :qtde * :custo_medio       -- Aguardando
              when 2 then :qtde_atend * :custo_medio -- Atendido
              when 3 then :qtde_atend * :custo_medio -- Entregue
              when 4 then 0.0                        -- Cancelado
              else 0.0
            end
    where ri.ano      = :ano
      and ri.controle = :controle
      and ri.item     = :item;

  end

  -- 2. Atualizar o custo total da requisicao
  Select
    sum(ri.total)
  from TBREQUISICAO_ALMOX_ITEM ri
  where ri.ano      = :ano
    and ri.controle = :controle
  Into
    valor_total;

  Update TBREQUISICAO_ALMOX r Set
    r.valor_total = :valor_total
  where r.ano      = :ano
    and r.controle = :controle
    and r.empresa  = :empresa;

end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_ROTINA(
    SISTEMA DMN_SMALLINT_NN,
    CODIGO DMN_VCHAR_10,
    TIPO DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_250,
    ROTINA_PAI DMN_VCHAR_10)
AS
begin
  /* Gravar Rotina */

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:rotina_pai)
  )) then
    rotina_pai = '';

  if (not exists(
    Select
      r.rot_cod
    from SYS_ROTINA r
    where r.rot_cod = trim(:codigo)
  )) then
    Insert Into SYS_ROTINA (
        rot_cod
      , rot_tipo
      , rot_descricao
      , rot_cod_pai
    ) values (
        trim(:codigo)
      , coalesce(:tipo, 0)
      , trim(:descricao)
      , case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    );
  else
    Update SYS_ROTINA r Set
        r.rot_tipo      = coalesce(:tipo, 0)
      , r.rot_descricao = trim(:descricao)
      , r.rot_cod_pai   = case when trim(:rotina_pai) <> '' then trim(:rotina_pai) else null end
    where r.rot_cod = trim(:codigo);

  /* Gravar Associacao Rotina x Sistema */
  if ( coalesce(:sistema, -1) > -1 ) then
    if (not exists(
      Select
        s.acesso
      from SYS_SISTEMA_ROTINA s
      where s.sis_cod = :sistema
        and s.rot_cod = :codigo
    )) then
      Insert Into SYS_SISTEMA_ROTINA (
          sis_cod
        , rot_cod
        , acesso
      ) values (
          :sistema
        , :codigo
        , 1
      );
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_SEGMENTO(
    SEG_ID SMALLINT,
    SEG_DESCRICAO VARCHAR(60))
AS
begin
  if ( (:Seg_id is null) or (:Seg_descricao is null)  ) then
    Exit;

  if ( exists(
    Select
      s.Seg_id
    from TBSEGMENTO s
    where s.Seg_id = :Seg_id
  ) ) then
    Update TBSEGMENTO u Set
      u.Seg_descricao = :Seg_descricao
    where u.Seg_id = :Seg_id;
  else
    Insert Into TBSEGMENTO (
        Seg_id
      , Seg_descricao
    ) values (
        :Seg_id
      , :Seg_descricao
    );
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_SEGMENTO_EMPRESA(
    CODIGO DMN_SMALLINT_NN,
    DESCRICAO DMN_NOME)
AS
begin
  if (not exists(
    Select
      s.seg_id
    from TBSEGMENTO s
    where s.seg_id = :codigo
  )) then
    Insert Into TBSEGMENTO (
        seg_id
      , seg_descricao
    ) values (
        :codigo
      , :descricao
    );
  else
    Update TBSEGMENTO s Set
      s.seg_descricao = :descricao
    where s.seg_id = :codigo;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_SISTEMA(
    CODIGO DMN_SMALLINT_NN,
    NOME DMN_VCHAR_100,
    VERSAO DMN_VCHAR_10)
AS
begin
  if (not exists(
    Select
      s.sis_cod
    from SYS_SISTEMA s
    where s.sis_cod = :codigo
  )) then
    Insert Into SYS_SISTEMA (
        sis_cod
      , sis_nome
      , sis_versao
    ) values (
        :codigo
      , trim(:nome)
      , trim(:versao)
    );
  else
    Update SYS_SISTEMA s Set
        s.sis_nome   = trim(:nome)
      , s.sis_versao = trim(:versao)
    where s.sis_cod = :codigo;
end
^

SET TERM ; ^

COMMENT ON PARAMETER SET_SISTEMA.CODIGO IS
'Codigo';

COMMENT ON PARAMETER SET_SISTEMA.NOME IS
'Nome do Sistema';

COMMENT ON PARAMETER SET_SISTEMA.VERSAO IS
'Versao';

SET TERM ^ ;

ALTER PROCEDURE SET_TITULO_RECEBER(
    ANOVENDA SMALLINT,
    NUMVENDA INTEGER,
    EMPRESA VARCHAR(18),
    CLIENTE_COD INTEGER,
    CLIENTE_CNPJ VARCHAR(18),
    FORMA_PAGTO SMALLINT,
    EMISSAO DATE,
    VENCIMENTO DATE,
    VALOR_DOCUMENTO NUMERIC(15,2),
    PARCELA SMALLINT)
RETURNS (
    ANOLANCAMENTO SMALLINT,
    NUMLANCAMENTO INTEGER)
AS
declare variable FORMA_PAGTO_DESC varchar(30);
declare variable COMPETENCIA Integer;
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
    , Forma_pagto
    , Dtemiss
    , Dtvenc
    , competencia_apuracao
    , Valorrec
    , Parcela
    , Percentjuros
    , Percentmulta
    , Percentdesconto
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
    , :Forma_pagto
    , :Emissao
    , :Vencimento
    , :competencia
    , :Valor_documento
    , :Parcela
    , 0
    , 0
    , 0
    , 0
    , 0
    , 1
  );

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_USUARIO_FUNCIONARIO(
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
RETURNS (
    USUARIO_LOGIN DMN_USUARIO)
AS
declare variable LOGIN DMN_NOME;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
  login = replace(:login, ' ',     '');
  login = trim(substring(trim(:login) from 1 for 12));

  if (not exists(
    Select
      u.nomecompleto
    from TBUSERS u
    where u.nome = :login
  )) then
  begin
    -- Padronizador perfil de usuario comum
    if (exists(
      Select
        f.cod
      from TBFUNCAO f
      where f.cod = :common_user
    )) then
      Update TBFUNCAO f Set
        f.funcao = 'USUARIO COMUM'
      where f.cod = :common_user;
    else
      Insert Into TBFUNCAO (
          cod
        , funcao
      ) values (
          :common_user
        , 'USUARIO COMUM'
      );

    Insert Into TBUSERS (
        nome
      , senha
      , nomecompleto
      , codfuncao
      , ativo
    ) values (
        :login
      , 'x|QUJDMTIz'
      , :nome_completo
      , :common_user
      , :ativo
    );
  end
  else
  begin
    Update TBUSERS u Set
        u.ativo        = :ativo
      , u.nomecompleto = :nome_completo
    where u.nome = :login;
  end 

  usuario_login = :login;
  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SET_VENDEDOR_FUNCIONARIO(
    NOME_COMPLETO DMN_NOME,
    CPF DMN_CPF,
    ATIVO DMN_LOGICO)
RETURNS (
    CODIGO_VENDEDOR DMN_INTEGER_N)
AS
begin
  -- Buscar codigo do vendedor de acordo com o CPF
  Select first 1
    v.cod
  from TBVENDEDOR v
  where v.cpf = :cpf
  Into
    codigo_vendedor;

  if ( coalesce(:codigo_vendedor, 0) = 0 ) then
  begin
    -- Gerar codigo para o novo registro de vendedor
    Select
      max(v.cod)
    from TBVENDEDOR v
    Into
      codigo_vendedor;

    codigo_vendedor = coalesce(:codigo_vendedor, 0) + 1;

    Insert Into TBVENDEDOR (
        cod
      , nome
      , cpf
      , ativo
    ) values (
        :codigo_vendedor
      , :nome_completo
      , :cpf
      , :ativo
    );
  end 

  suspend;
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SP_UPD_CUSTO_APROP_AUTORIZ(
    ANO SMALLINT)
AS
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
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SP_UPD_CUSTO_APROP_ENTRADA(
    ANO SMALLINT)
AS
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
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SP_UPD_CUSTO_ESTOQUE_APROP(
    ANO SMALLINT)
AS
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
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SP_UPD_CUSTO_ESTOQUE_REQUI(
    ANO_MOVIMENTO SMALLINT)
AS
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
end
^

SET TERM ; ^

SET TERM ^ ;

ALTER PROCEDURE SP_UPD_CUSTO_INVENTARIO_ALMOX(
    ANO_MOVIMENTO SMALLINT)
AS
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
end
^

SET TERM ; ^




/*------ SYSDBA 07/01/2016 11:02:21 --------*/

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AD
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'D', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', old.cnpj);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CODIGO', old.codigo, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'PESSOA_FISICA', old.pessoa_fisica, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CNPJ', old.cnpj, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'NOME', old.nome, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'INSCEST', old.inscest, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'INSCMUN', old.inscmun, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'ENDER', old.ender, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'COMPLEMENTO', old.complemento, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BAIRRO', old.bairro, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CEP', old.cep, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'CIDADE', old.cidade, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'UF', old.uf, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONE', old.fone, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONECEL', old.fonecel, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'FONECOMERC', old.fonecomerc, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'EMAIL', old.email, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'SITE', old.site, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'NUMERO_END', old.numero_end, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'PAIS_ID', old.pais_id, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'VALOR_LIMITE_COMPRA', old.valor_limite_compra, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO', old.bloqueado, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO_DATA', old.bloqueado_data, null);

  insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
         values (:tid, 'BLOQUEADO_MOTIVO', old.bloqueado_motivo, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'BLOQUEADO_USUARIO', old.bloqueado_usuario, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'DESBLOQUEADO_DATA', old.desbloqueado_data, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'DTCAD', old.dtcad, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'VENDEDOR_COD', old.vendedor_cod, null);

  insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
         values (:tid, 'USUARIO', old.usuario, null);


end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AI
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'I', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', new.cnpj);

  if (new.codigo is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CODIGO', null, new.codigo);

  if (new.pessoa_fisica is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'PESSOA_FISICA', null, new.pessoa_fisica);

  if (new.cnpj is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CNPJ', null, new.cnpj);

  if (new.nome is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'NOME', null, new.nome);

  if (new.inscest is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'INSCEST', null, new.inscest);

  if (new.inscmun is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'INSCMUN', null, new.inscmun);

  if (new.ender is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'ENDER', null, new.ender);

  if (new.complemento is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'COMPLEMENTO', null, new.complemento);

  if (new.bairro is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BAIRRO', null, new.bairro);

  if (new.cep is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CEP', null, new.cep);

  if (new.cidade is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'CIDADE', null, new.cidade);

  if (new.uf is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'UF', null, new.uf);

  if (new.fone is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONE', null, new.fone);

  if (new.fonecel is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONECEL', null, new.fonecel);

  if (new.fonecomerc is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'FONECOMERC', null, new.fonecomerc);

  if (new.email is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'EMAIL', null, new.email);

  if (new.site is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'SITE', null, new.site);

  if (new.numero_end is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'NUMERO_END', null, new.numero_end);

  if (new.pais_id is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'PAIS_ID', null, new.pais_id);

  if (new.valor_limite_compra is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'VALOR_LIMITE_COMPRA', null, new.valor_limite_compra);

  if (new.bloqueado is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO', null, new.bloqueado);

  if (new.bloqueado_data is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO_DATA', null, new.bloqueado_data);

  if (not (new.bloqueado_motivo is null)) then
    insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
           values (:tid,'BLOQUEADO_MOTIVO',null, new.bloqueado_motivo);

  if (new.bloqueado_usuario is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'BLOQUEADO_USUARIO', null, new.bloqueado_usuario);

  if (new.desbloqueado_data is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'DESBLOQUEADO_DATA', null, new.desbloqueado_data);

  if (new.dtcad is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'DTCAD', null, new.dtcad);

  if (new.vendedor_cod is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'VENDEDOR_COD', null, new.vendedor_cod);

  if (new.usuario is not null) then
    insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
           values (:tid, 'USUARIO', null, new.usuario);


end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER IBE$TBCLIENTE_AU
as
declare variable tid integer;
begin
  tid = gen_id(ibe$log_tables_gen,1);

  insert into ibe$log_tables (id, table_name, operation, date_time, user_name)
         values (:tid, 'TBCLIENTE', 'U', 'NOW', user);

  insert into ibe$log_keys (log_tables_id, key_field, key_value)
         values (:tid, 'CNPJ', old.cnpj);

  if ((old.codigo is null and new.codigo is not null) or
      (new.codigo is null and old.codigo is not null) or
      (new.codigo is not null and old.codigo is not null and new.codigo <> old.codigo)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CODIGO', old.codigo, new.codigo);

  if ((old.pessoa_fisica is null and new.pessoa_fisica is not null) or
      (new.pessoa_fisica is null and old.pessoa_fisica is not null) or
      (new.pessoa_fisica is not null and old.pessoa_fisica is not null and new.pessoa_fisica <> old.pessoa_fisica)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'PESSOA_FISICA', old.pessoa_fisica, new.pessoa_fisica);

  if ((old.nome is null and new.nome is not null) or
      (new.nome is null and old.nome is not null) or
      (new.nome is not null and old.nome is not null and new.nome <> old.nome)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'NOME', old.nome, new.nome);

  if ((old.inscest is null and new.inscest is not null) or
      (new.inscest is null and old.inscest is not null) or
      (new.inscest is not null and old.inscest is not null and new.inscest <> old.inscest)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'INSCEST', old.inscest, new.inscest);

  if ((old.inscmun is null and new.inscmun is not null) or
      (new.inscmun is null and old.inscmun is not null) or
      (new.inscmun is not null and old.inscmun is not null and new.inscmun <> old.inscmun)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'INSCMUN', old.inscmun, new.inscmun);

  if ((old.ender is null and new.ender is not null) or
      (new.ender is null and old.ender is not null) or
      (new.ender is not null and old.ender is not null and new.ender <> old.ender)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'ENDER', old.ender, new.ender);

  if ((old.complemento is null and new.complemento is not null) or
      (new.complemento is null and old.complemento is not null) or
      (new.complemento is not null and old.complemento is not null and new.complemento <> old.complemento)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'COMPLEMENTO', old.complemento, new.complemento);

  if ((old.bairro is null and new.bairro is not null) or
      (new.bairro is null and old.bairro is not null) or
      (new.bairro is not null and old.bairro is not null and new.bairro <> old.bairro)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BAIRRO', old.bairro, new.bairro);

  if ((old.cep is null and new.cep is not null) or
      (new.cep is null and old.cep is not null) or
      (new.cep is not null and old.cep is not null and new.cep <> old.cep)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CEP', old.cep, new.cep);

  if ((old.cidade is null and new.cidade is not null) or
      (new.cidade is null and old.cidade is not null) or
      (new.cidade is not null and old.cidade is not null and new.cidade <> old.cidade)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'CIDADE', old.cidade, new.cidade);

  if ((old.uf is null and new.uf is not null) or
      (new.uf is null and old.uf is not null) or
      (new.uf is not null and old.uf is not null and new.uf <> old.uf)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'UF', old.uf, new.uf);

  if ((old.fone is null and new.fone is not null) or
      (new.fone is null and old.fone is not null) or
      (new.fone is not null and old.fone is not null and new.fone <> old.fone)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONE', old.fone, new.fone);

  if ((old.fonecel is null and new.fonecel is not null) or
      (new.fonecel is null and old.fonecel is not null) or
      (new.fonecel is not null and old.fonecel is not null and new.fonecel <> old.fonecel)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONECEL', old.fonecel, new.fonecel);

  if ((old.fonecomerc is null and new.fonecomerc is not null) or
      (new.fonecomerc is null and old.fonecomerc is not null) or
      (new.fonecomerc is not null and old.fonecomerc is not null and new.fonecomerc <> old.fonecomerc)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'FONECOMERC', old.fonecomerc, new.fonecomerc);

  if ((old.email is null and new.email is not null) or
      (new.email is null and old.email is not null) or
      (new.email is not null and old.email is not null and new.email <> old.email)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'EMAIL', old.email, new.email);

  if ((old.site is null and new.site is not null) or
      (new.site is null and old.site is not null) or
      (new.site is not null and old.site is not null and new.site <> old.site)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'SITE', old.site, new.site);

  if ((old.numero_end is null and new.numero_end is not null) or
      (new.numero_end is null and old.numero_end is not null) or
      (new.numero_end is not null and old.numero_end is not null and new.numero_end <> old.numero_end)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'NUMERO_END', old.numero_end, new.numero_end);

  if ((old.pais_id is null and new.pais_id is not null) or
      (new.pais_id is null and old.pais_id is not null) or
      (new.pais_id is not null and old.pais_id is not null and new.pais_id <> old.pais_id)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'PAIS_ID', old.pais_id, new.pais_id);

  if ((old.valor_limite_compra is null and new.valor_limite_compra is not null) or
      (new.valor_limite_compra is null and old.valor_limite_compra is not null) or
      (new.valor_limite_compra is not null and old.valor_limite_compra is not null and new.valor_limite_compra <> old.valor_limite_compra)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'VALOR_LIMITE_COMPRA', old.valor_limite_compra, new.valor_limite_compra);

  if ((old.bloqueado is null and new.bloqueado is not null) or
      (new.bloqueado is null and old.bloqueado is not null) or
      (new.bloqueado is not null and old.bloqueado is not null and new.bloqueado <> old.bloqueado)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO', old.bloqueado, new.bloqueado);

  if ((old.bloqueado_data is null and new.bloqueado_data is not null) or
      (new.bloqueado_data is null and old.bloqueado_data is not null) or
      (new.bloqueado_data is not null and old.bloqueado_data is not null and new.bloqueado_data <> old.bloqueado_data)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO_DATA', old.bloqueado_data, new.bloqueado_data);

  if ((old.bloqueado_motivo is null and new.bloqueado_motivo is not null) or
      (new.bloqueado_motivo is null and old.bloqueado_motivo is not null) or
      (new.bloqueado_motivo is not null and old.bloqueado_motivo is not null and new.bloqueado_motivo <> old.bloqueado_motivo)) then
     insert into ibe$log_blob_fields (log_tables_id, field_name, old_blob_value, new_blob_value)
            values (:tid, 'BLOQUEADO_MOTIVO', old.bloqueado_motivo, new.bloqueado_motivo);

  if ((old.bloqueado_usuario is null and new.bloqueado_usuario is not null) or
      (new.bloqueado_usuario is null and old.bloqueado_usuario is not null) or
      (new.bloqueado_usuario is not null and old.bloqueado_usuario is not null and new.bloqueado_usuario <> old.bloqueado_usuario)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'BLOQUEADO_USUARIO', old.bloqueado_usuario, new.bloqueado_usuario);

  if ((old.desbloqueado_data is null and new.desbloqueado_data is not null) or
      (new.desbloqueado_data is null and old.desbloqueado_data is not null) or
      (new.desbloqueado_data is not null and old.desbloqueado_data is not null and new.desbloqueado_data <> old.desbloqueado_data)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'DESBLOQUEADO_DATA', old.desbloqueado_data, new.desbloqueado_data);

  if ((old.dtcad is null and new.dtcad is not null) or
      (new.dtcad is null and old.dtcad is not null) or
      (new.dtcad is not null and old.dtcad is not null and new.dtcad <> old.dtcad)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'DTCAD', old.dtcad, new.dtcad);

  if ((old.vendedor_cod is null and new.vendedor_cod is not null) or
      (new.vendedor_cod is null and old.vendedor_cod is not null) or
      (new.vendedor_cod is not null and old.vendedor_cod is not null and new.vendedor_cod <> old.vendedor_cod)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'VENDEDOR_COD', old.vendedor_cod, new.vendedor_cod);

  if ((old.usuario is null and new.usuario is not null) or
      (new.usuario is null and old.usuario is not null) or
      (new.usuario is not null and old.usuario is not null and new.usuario <> old.usuario)) then
     insert into ibe$log_fields (log_tables_id, field_name, old_value, new_value)
            values (:tid, 'USUARIO', old.usuario, new.usuario);


end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TB_INVENTARIO_ALMOX_ENCERRAR
AS
  declare variable lancamento   DMN_GUID_38;
  declare variable produto      DMN_VCHAR_10;
  declare variable quantidade   DMN_QUANTIDADE_D3;
  declare variable estoque      DMN_QUANTIDADE_D3;
  declare variable fracionador  DMN_PERCENTUAL_3;
  declare variable unidade_cns  DMN_SMALLINT_N;
  declare variable custo_medio  DMN_MONEY_4;
  declare variable lote_id_conf DMN_GUID_38;
  declare variable lote_id_resp DMN_GUID_38;
  declare variable usuario      DMN_USUARIO;
begin
  /* Inventario Encerrado */
  if ((old.status <> new.status) and (old.status = 1) and (new.status = 2)) then
  begin

    for
      Select
          i.id
        , coalesce(i.produto, 'XXX')
        , coalesce(i.qtde, 0.0)
        , coalesce(i.estoque, 0.0)
        , coalesce(i.fracionador, 1.0)
        , coalesce(i.custo, 0.0)
        , i.unidade
        , coalesce(nullif(Trim(i.usuario), ''), user)
        , coalesce(i.lote_conferido, 'XXX')
      from TBINVENTARIO_ALMOX_ITEM i
      where i.ano = new.ano
        and i.controle = new.controle
      Into
          lancamento
        , produto
        , quantidade
        , estoque
        , fracionador
        , custo_medio
        , unidade_cns
        , usuario
        , lote_id_conf
    do
    begin

      /* INVENTARIO DE ESTOQUE DE VENDA */
      if ( coalesce(new.centro_custo, 0) = 0 ) then
      begin

        -- Atualizar Estoque de Venda
        Update TBPRODUTO p Set
          p.qtde = :quantidade
        where p.cod = :produto;

        -- Gravar Kardex do Produto
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
            new.empresa
          , :produto
          , new.ano || '/' || new.controle
          , 'BALANCO/INVENTARIO ' || Case new.tipo when 0 then 'GERAL' when 1 then 'PARCIAL' else 'DE EQUIPAMENTOS/IMOBILIZADOS' end
          , new.data
          , :estoque
          , (:estoque - :quantidade) * (-1)
          , :quantidade
          , :usuario
          , substring(trim('Responsavel pelo inventario: ' || new.fech_usuario) from 1 for 40)
        );

      end

      /* INVENTARIO ALMOXARIFADO (ESTOQUE DO CENTRO DE CUSTO) */
      else
      begin

        if (exists(
          Select
              e.empresa
            , e.centro_custo
            , e.produto
            , e.lote
          from TBESTOQUE_ALMOX e
          where e.id           = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where e.id           = :lote_id_conf;

        end
        else
        begin

          Select
            g.hex_uuid_format
          from GET_GUID_UUID_HEX g
          Into
            lote_id_resp;

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
            , id
          ) values (
              new.empresa
            , new.centro_custo
            , :produto
            , 0
            , null
            , null
            , :quantidade   -- Esta quantidade ja esta fracionada para consumo
            , :fracionador
            , :unidade_cns
            , :custo_medio  -- Este valor ja esta fracionado
            , :lote_id_resp
          );

          Update TBINVENTARIO_ALMOX_ITEM ai Set
            ai.lote_resultado = :lote_id_resp
          where ai.id = :lancamento;

        end
         
      end

    end

  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TB_TESTE_CODIGO
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_tb_teste_codigo, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AJUST_ESTOQUE_HISTORICO
AS
begin
  update TBPRODUTO p set
    p.qtde = coalesce(p.qtde, 0.0) + coalesce(new.qtdenova, 0.0)
  where p.cod = new.codprod;

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
      new.codempresa
    , new.codprod
    , new.doc
    , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
    , new.dtajust
    , new.qtdeatual
    , new.qtdenova
    , new.qtdefinal
    , coalesce(new.Usuario, user)
    , substring(trim(new.motivo) from 1 for 250)
  );
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_APROPRIACAO_ALMOX_CANCELAR
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

SET TERM ^ ;

ALTER TRIGGER TG_APROPRIACAO_ALMOX_CODIGO
AS
begin
  if (new.controle is null) then
    if ( new.ano = 2015 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.controle = gen_id(GEN_APROPRIACAO_ALMOX_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_APROPRIACAO_ALMOX_COMPET
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = Cast((
      right('0000' || extract(year from new.data_apropriacao), 4) ||
      right('00' || extract(month from new.data_apropriacao), 2)) as Integer);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_APROPRIACAO_ALMOX_ESTOQUE
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

SET TERM ^ ;

ALTER TRIGGER TG_APROPRIACAO_ALMOX_ITEM_QTDE
AS
begin
  if ( (coalesce(new.qtde_fracionada, 0.0) = 0.0) or (coalesce(new.qtde_fracionada, 0.0) = 1.0)  ) then
    if ( coalesce(new.qtde, 0.0) > 0.0 ) then
      new.qtde_fracionada = coalesce(new.qtde, 0.0) * coalesce(new.fracionador, 1.0);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRAITEM_REC
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  if ( old.confirmado_recebimento <> new.confirmado_recebimento ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRAITEM ri Set
        ri.confirmado_recebimento = new.confirmado_recebimento
      where ri.ano     = :rec_ano
        and ri.codigo  = :rec_cod
        and ri.empresa = :rec_emp
        and ri.produto = new.produto;
    end 
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRA_CODIGO
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_AUTORIZA_COMPRA_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRA_COMPETENCIA
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRA_REC_AUT
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Autorizada*/
  if ( (old.status <> new.status) and (new.status = 2) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp
        and r.status  = 3; -- Faturada
    end 
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_AUTORIZA_COMPRA_REC_FAT
AS
  declare variable rec_ano DMN_SMALLINT_NN;
  declare variable rec_cod DMN_BIGINT_NN;
  declare variable rec_emp DMN_CNPJ_NN;
begin
  /* Autorizacao marcada como "Faturada (NF/NFS registrada no sistema referente a autorizacao)" (3) */
  if ( (old.status <> new.status) and (new.status = 3) ) then
  begin
    for
      Select
          ar.requisicao_ano
        , ar.requisicao_cod
        , ar.requisicao_emp
      from TBAUTORIZA_REQUISITA ar
      where ar.autorizacao_ano = new.ano
        and ar.autorizacao_cod = new.codigo
        and ar.autorizacao_emp = new.empresa
      Into
          rec_ano
        , rec_cod
        , rec_emp
    do
    begin
      Update TBREQUISITA_COMPRA r Set
       r.status = new.status
      where r.ano     = :rec_ano
        and r.codigo  = :rec_cod
        and r.empresa = :rec_emp
        and r.status  = 2; -- Requisitada
    end 
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_BAIRRO_COD
As
Begin
  If (New.Bai_cod Is Null) Then
    New.Bai_cod = Gen_id(Gen_bairro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_CONSOLIDACAO_SEQ
AS
  declare variable sequencial Smallint;
begin
  if ( coalesce(new.Seq, 0) = 0 ) then
  begin
    Select
      max(c.Seq)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
      sequencial;

    new.Seq = coalesce(Sequencial, 0) + 1;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_FECHAR
AS
  declare variable total_credito Dmn_money;
  declare variable total_debito Dmn_money;
begin
  if ( (old.Situacao = 0) and (new.Situacao = 1) ) then
  begin
    Execute procedure SET_CAIXA_CONSOLIDAR(new.Ano, new.Numero);

    Select
        sum(c.Total_credito)
      , sum(c.Total_debito)
    from TBCAIXA_CONSOLIDACAO c
    where c.Ano = new.Ano
      and c.Numero = new.Numero
    into
        Total_credito
      , Total_debito;

    new.Valor_total_credito = coalesce(:Total_credito, 0);
    new.Valor_total_debito  = coalesce(:Total_debito, 0);
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_MOVIMENTO_NUMERO
AS
begin
  IF (New.Numero IS NULL) Then
    if ( new.Ano = 2012 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.Numero = GEN_ID(GEN_CX_MOVIMENTO_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CAIXA_NUMERO
AS
begin
  IF (New.Numero IS NULL) Then
    if ( new.Ano = 2012 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.Numero = GEN_ID(GEN_CAIXA_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CARTA_CORRECAO_COD
AS
begin
  if ( coalesce(new.cce_numero, 0) = 0 ) then
    new.cce_numero = GEN_ID(GEN_CARTA_CORRECAO, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CENTRO_CUSTO_NOVO
AS
begin
  if (new.codigo is null) then
    new.codigo = gen_id(GEN_CENTRO_CUSTO, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CIDADE_COD
As
Begin
  If (New.Cid_cod Is Null) Then
    New.Cid_cod = Gen_id(Gen_cidade_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CIDADE_CUSTO_OPER
AS
begin
  if ( (new.custo_oper_frete > 0.0) or (new.custo_oper_outros > 0.0) ) then
    Update TBCLIENTE c Set
        c.custo_oper_percentual = new.custo_oper_percentual
      , c.custo_oper_frete      = new.custo_oper_frete
      , c.custo_oper_outros     = new.custo_oper_outros
    where c.cid_cod = new.cid_cod;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_COD
As
Begin
  new.ativo = coalesce(new.ativo, 1);
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(GEN_CLIENTE_ID, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_CUSTO_OPER
AS
  declare variable empresa Varchar(18);
begin
  if ( (new.custo_oper_frete > 0.0) or (new.custo_oper_outros > 0.0) ) then
    for
      Select distinct
          v.codemp
      from TBVENDAS v
        inner join TBCLIENTE c on (c.codigo = v.codcliente)
        inner join TBCONFIGURACAO f on (f.empresa = v.codemp)
      where f.custo_oper_calcular = 1
        and v.ano        = extract(Year from current_date)
        and v.codcliente = new.codigo
        and ((v.custo_oper_frete is null) or (v.custo_oper_outros is null))
      Into
          empresa
    do
    begin

      Update TBVENDAS vd Set
          vd.custo_oper_percentual = new.custo_oper_percentual
        , vd.custo_oper_frete      = new.custo_oper_frete
        , vd.custo_oper_outros     = new.custo_oper_outros
      where vd.ano = extract(Year from current_date)
        and ((vd.custo_oper_frete is null) or (vd.custo_oper_outros is null))
        and vd.codemp     = :empresa
        and vd.codcliente = new.codigo;

    end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_GERAR_FORNECEDOR
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

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_REQUISICAO_ESTOQUE
AS
  declare variable item       Smallint;
  declare variable produto    Varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
begin
  /* 2. AUTORIZADA - Decrementar estoque satelite do cliente quando a requisicao for autorizada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 2) ) then
  begin
    for
      Select
          i.numero
        , i.codproduto
        , i.quantidade
        , e.quantidade as estoque
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto)
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          item
        , produto
        , quantidade
        , estoque
    do
    begin

      -- Baixar estoque
      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0) -- Retirar estoque
      where e.cod_cliente = new.codcliente
        and e.cod_produto = :produto;

      -- Guardar historico estoque satelite
      Update TBCLIENTE_REQUISICAO_ITEM i Set
        i.quantidade_final = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
      where i.ano    = new.ano
        and i.numero = new.numero
        and i.item   = :item;

    end 
  end 

  else

  /* 4. CANCELADA - Incfementar estoque satelite do cliente quando a requisicao for cancelada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 4) ) then
  begin
    for
      Select
          i.codproduto
        , i.quantidade
        , e.quantidade as estoque
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto)
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          produto
        , quantidade
        , estoque
    do
    begin

      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) + coalesce(:quantidade, 0) -- Devolver estoque
      where e.cod_cliente = new.codcliente
        and e.cod_produto = :produto;

    end 
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_REQUISICAO_ITEM_SEQ
AS
begin
  if ( coalesce(new.item, 0) = 0 ) then
    Select
      coalesce(max(i.item), 0) + 1
    from TBCLIENTE_REQUISICAO_ITEM i
    where i.ano    = new.ano
      and i.numero = new.numero
    Into
      new.item;

  if ( new.usuario is null ) then
    new.usuario = user;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CLIENTE_REQUISICAO_NOVA
AS
begin
  if ( coalesce(new.ano, 0) = 0 ) then
    new.ano = extract(year from current_date);

  if ( coalesce(new.numero, 0) = 0 ) then
    if ( new.ano = 2011 ) then
      new.numero = gen_id(GEN_REQUISICAO_2011, 1);
    else
    if ( new.ano = 2012 ) then
      new.numero = gen_id(GEN_REQUISICAO_2012, 1);
    else
    if ( new.ano = 2013 ) then
      new.numero = gen_id(GEN_REQUISICAO_2013, 1);
    else
    if ( new.ano = 2014 ) then
      new.numero = gen_id(GEN_REQUISICAO_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.numero = gen_id(GEN_REQUISICAO_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.numero = gen_id(GEN_REQUISICAO_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.numero = gen_id(GEN_REQUISICAO_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.numero = gen_id(GEN_REQUISICAO_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.numero = gen_id(GEN_REQUISICAO_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.numero = gen_id(GEN_REQUISICAO_2020, 1);

  if ( new.insercao_data is null ) then
    new.insercao_data = current_date;

  if ( new.insercao_hora is null ) then
    new.insercao_usuario = current_time;

  if ( new.insercao_usuario is null ) then
    new.insercao_usuario = user;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPLEMENTAR_COD
AS
begin
  if ( coalesce(new.NFC_numero, 0) = 0 ) then
    new.NFC_numero = GEN_ID(GEN_COMPLEMENTAR, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Custo_produto
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
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

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

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
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
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
        p.Qtde       = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end
      where p.Cod    = :Produto;

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
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque - :Quantidade
        , new.Cancel_usuario
        , replace('Custo Final no valor de R$ ' || :Custo_compra, '.', ',')
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

SET TERM ^ ;

ALTER TRIGGER TG_COMPRAS_CONTROLE
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_COMPRAS_CONTROLE_2020, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONDICAOPAGTO_COD
As
Begin
  If (New.Cond_cod Is Null) Then
    New.Cond_cod = Gen_id(Gen_condicaopagto_cod, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTA_CORRENTE_EMPRESA
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTPAG_NUMLANC
AS
begin
  if (new.numlanc is null) then
    if ( new.anolanc = 2011 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2011, 1);
    else
    if ( new.anolanc = 2012 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2012, 1);
    else
    if ( new.anolanc = 2013 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2013, 1);
    else
    if ( new.anolanc = 2014 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2014, 1);
    else
    if ( new.anolanc = 2015 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2015, 1);
    else
    if ( new.anolanc = 2016 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2016, 1);
    else
    if ( new.anolanc = 2017 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2017, 1);
    else
    if ( new.anolanc = 2018 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2018, 1);
    else
    if ( new.anolanc = 2019 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2019, 1);
    else
    if ( new.anolanc = 2020 ) then
      new.numlanc = gen_id(GEN_CONTAPAG_NUM_2020, 1);

  if ( new.valorsaldo is null ) then
    new.valorsaldo = new.valorpag;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTPAG_QUITAR
AS
  declare variable Quitado Smallint;
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
begin
  /* Quitar contas a pagar */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTPAG_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(p.Valorpag, 0)
  from TBCONTPAG p
  where p.Anolanc = new.Anolanc
    and p.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais

  if ( :Quitado = 0 ) then
  begin

    Update TBCONTPAG p Set
        p.Historic = coalesce(p.Historic, '') || ' --> HISTORICO DE PGTO : ' || new.Historico
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTPAG p Set
        p.Quitado  = 1
      , p.Historic = coalesce(p.Historic, '') || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
      , p.Dtpag    = new.Data_pagto
      , p.Docbaix  = new.Documento_baixa
      , p.Tippag   = :Forma_pagto
      , p.Numchq   = new.Numero_cheque
      , p.Banco    = new.Banco
      , p.valormulta  = :Valor_multa
      , p.valorpagtot = :Total_pago
      , p.valorsaldo  = :Valor_saldo
    where p.Anolanc = new.Anolanc
      and p.Numlanc = new.Numlanc;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTREC_NUM
as
begin
  if (new.Numlanc is null) then
    if ( new.Anolanc = 2011 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2011, 1);
    else
    if ( new.Anolanc = 2012 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2012, 1);
    else
    if ( new.Anolanc = 2013 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2013, 1);
    else
    if ( new.Anolanc = 2014 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2014, 1);
    else
    if ( new.Anolanc = 2015 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2015, 1);
    else
    if ( new.Anolanc = 2016 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2016, 1);
    else
    if ( new.Anolanc = 2017 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2017, 1);
    else
    if ( new.Anolanc = 2018 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2018, 1);
    else
    if ( new.Anolanc = 2019 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2019, 1);
    else
    if ( new.Anolanc = 2020 ) then
      new.Numlanc = gen_id(Gen_contarec_num_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_CONTREC_QUITAR
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago numeric(15,2);
  declare variable valor_pagar numeric(15,2);
  declare variable valor_saldo numeric(15,2);
  declare variable quitado Smallint;
begin
  /* Quitar contas a receber */

  -- Buscar descricao da Forma de Pagamento
  Select
    f.Descri
  from TBFORMPAGTO f
  where f.Cod = new.Forma_pagto
  into
    Forma_pagto;

  -- Totalizar os Valores pagos
  Select
    sum( coalesce(b.Valor_baixa, 0) )
  from TBCONTREC_BAIXA b
  where b.Anolanc = new.Anolanc
    and b.Numlanc = new.Numlanc
  into
    Total_pago;

  -- Buscar o Valor da divida
  Select
    coalesce(r.Valorrec, 0) + coalesce(r.Valormulta, 0) - ( coalesce(r.Valorrec, 0) * coalesce(r.Percentdesconto, 0) / 100 )
  from TBCONTREC r
  where r.Anolanc = new.Anolanc
    and r.Numlanc = new.Numlanc
  Into
    Valor_pagar;

  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  if ( :Total_pago >= :Valor_pagar ) then
    quitado = 1;
  else
    quitado = 0;

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0 ) then
    Valor_saldo = 0;

  Update TBCONTREC r Set
      r.Baixado  = :Quitado
    , r.Historic = coalesce(r.Historic, '') || ' --> HISTORICO DA BAIXA : ' || new.Historico
    , r.Dtrec    = new.Data_pagto
    , r.Docbaix  = new.Documento_baixa
    , r.Tippag   = :Forma_pagto
    , r.Codbanco = new.Banco
    , r.Valorsaldo  = :Valor_saldo
    , r.Valorrectot = :Total_pago
  where r.Anolanc = new.Anolanc
    and r.Numlanc = new.Numlanc;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COTACAO_COMPRAFORN_COTAR
AS
  declare variable ano DMN_SMALLINT_N;
  declare variable cod DMN_BIGINT_N;
  declare variable emp DMN_CNPJ;
  declare variable valor DMN_MONEY;
begin
  if ( inserting or updating ) then
  begin
    ano = new.ano;
    cod = new.codigo;
    emp = new.empresa;
  end 
  else
  if ( deleting ) then
  begin
    ano = old.ano;
    cod = old.codigo;
    emp = old.empresa;
  end

  Select
    sum( coalesce(cf.valor_total_liquido, 0.0) )
  from TBCOTACAO_COMPRAFORN cf
  where cf.ano     = :ano
    and cf.codigo  = :cod
    and cf.empresa = :emp
  Into
    valor;

  Update TBCOTACAO_COMPRA c Set
    c.status =
      Case when coalesce(:valor, 0.0) = 0.0
        then 1 -- Aberta
        else 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
      End
  where c.status in (1, 2)
    and c.ano     = :ano
    and c.codigo  = :cod
    and c.empresa = :emp;

end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COTACAO_COMPRAFORN_ITEM_VLR
AS
  declare variable Ano DMN_SMALLINT_N;
  declare variable Cod DMN_BIGINT_N;
  declare variable Emp DMN_CNPJ;
  declare variable Frn DMN_INTEGER_N;

  declare variable Total_Bruto    DMN_MONEY;
  declare variable Total_Desconto DMN_MONEY;
  declare variable Total_Liquido  DMN_MONEY;
begin
  if ( inserting or updating ) then
  begin
    Ano = new.ano;
    Cod = new.codigo;
    Emp = new.empresa;
    Frn = new.fornecedor;
  end 
  else
  if ( deleting ) then
  begin
    Ano = old.ano;
    Cod = old.codigo;
    Emp = old.empresa;
    Frn = old.fornecedor;
  end

  Select
      coalesce(f.valor_total_desconto, 0.0)
    , sum( coalesce(c.valor_total, 0.0) )
  from TBCOTACAO_COMPRAFORN f
    left join TBCOTACAO_COMPRAFORN_ITEM c on (c.ano = f.ano and c.codigo = f.codigo and c.empresa = f.empresa and c.fornecedor = f.fornecedor)
  where f.ano        = :Ano
    and f.codigo     = :Cod
    and f.empresa    = :Emp
    and f.fornecedor = :Frn
  group by
      coalesce(f.valor_total_desconto, 0.0)
  Into
      Total_Desconto
    , Total_Bruto;

  Total_Liquido = :Total_Bruto - :Total_Desconto;

  Update TBCOTACAO_COMPRAFORN f Set
      f.valor_total_bruto    = coalesce(:Total_Bruto, 0.0)
    , f.valor_total_desconto = coalesce(:Total_Desconto, 0.0)
    , f.valor_total_liquido  = coalesce(:Total_Liquido, 0.0)
  where f.ano        = :Ano
    and f.codigo     = :Cod
    and f.empresa    = :Emp
    and f.fornecedor = :Frn;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COTACAO_COMPRA_CODIGO
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_COTACAO_COMPRA_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_COTACAO_COMPRA_COMPETENCIA
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_DISTRITO_COD
As
Begin
  If (New.Dis_cod Is Null) Then
    New.Dis_cod = Gen_id(Gen_distrito_id, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_EMPRESA_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_empresa_id, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_ESTOQUE_ALMOX_GUID
AS
begin
  Select
    g.hex_uuid_format
  from GET_GUID_UUID_HEX g
  Into
    new.id;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FABRICANTE_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_FABRICANTE_ID, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FORNECEDOR_COD
As
Begin
  new.ativo                  = coalesce(new.ativo, 1);
  new.fornecedor_funcionario = coalesce(new.fornecedor_funcionario, 0);

  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FUNCIONARIO_CODIGO
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_FUNCIONARIO_COD, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( (new.flag_fornecedor = 1) and (trim(coalesce(new.cpf, '')) <> '') ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf) -- Cpf informado
    Into
      codigo_forn;

    -- Padronizador grupo "Colaboradores" para os Fornecedores
    grupo_forn = 5;

    if (exists(
      Select
        g.grf_cod
      from TBFORNECEDOR_GRUPO g
      where g.grf_cod = :grupo_forn
    )) then
      Update TBFORNECEDOR_GRUPO g Set
        g.grf_descricao = 'COLABORADORES'
      where g.grf_cod = :grupo_forn;
    else
      Insert Into TBFORNECEDOR_GRUPO (
          grf_cod
        , grf_descricao
      ) values (
          :grupo_forn
        , 'COLABORADORES'
      );

    if ( :codigo_forn is null ) then
    begin
      codigo_forn = Gen_id(GEN_FORNECEDOR_ID, 1);
      Insert Into TBFORNECEDOR (
          CODFORN
        , PESSOA_FISICA
        , NOMEFORN
        , NOMEFANT
        , CNPJ
        , INSCEST
        , ENDER
        , COMPLEMENTO
        , NUMERO_END
        , CEP
        , CIDADE
        , UF
        , FONE
        , FONECEL
        , EMAIL
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
        , OBSERVACAO
        , DTCAD
        , ATIVO
        , FATURAMENTO_MINIMO
        , FORNECEDOR_FUNCIONARIO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , new.ender
        , new.complemento
        , new.numero_end
        , new.cep
        , new.cidade
        , new.uf
        , new.fone_fixo
        , new.fone_celular
        , substring(new.email from 1 for 40)
        , new.tlg_tipo
        , new.log_cod
        , new.bai_cod
        , new.cid_cod
        , new.est_cod
        , new.pais_id
        , :grupo_forn
        , 0
        , null
        , null
        , null
        , null
        , new.observacao
        , current_date
        , coalesce(new.ativo, 1)
        , 0.0
        , 1
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest  = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.ender    = new.ender
        , f.complemento = new.complemento
        , f.numero_end  = new.numero_end
        , f.cep    = new.cep
        , f.cidade = new.cidade
        , f.uf     = new.uf
        , f.fone     = new.fone_fixo
        , f.fonecel  = new.fone_celular
        , f.email    = substring(new.email from 1 for 40)
        , f.tlg_tipo = new.tlg_tipo
        , f.log_cod = new.log_cod
        , f.bai_cod = new.bai_cod
        , f.cid_cod = new.cid_cod
        , f.est_cod = new.est_cod
        , f.pais_id = new.pais_id
        , f.ativo   = coalesce(new.ativo, 1)
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.fornecedor_funcionario = 1
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_GRUPOPRODUTO_COD
AS
BEGIN
  IF (NEW.COD IS NULL) THEN
    NEW.COD = GEN_ID(GEN_GRUPOPRODUTO_COD,1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_IBPT_COD
as
begin
  if (new.id_ibpt is null) then
    new.id_ibpt = gen_id(GEN_IBPT_ID, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_INVENTARIO_ALMOX_CODIGO
AS
begin
  if (new.controle is null) then
    if ( new.ano = 2015 ) then
      new.controle = gen_id(GEN_INVENTARIO_ALMOX_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.controle = gen_id(GEN_INVENTARIO_ALMOX_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.controle = gen_id(GEN_INVENTARIO_ALMOX_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.controle = gen_id(GEN_INVENTARIO_ALMOX_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.controle = gen_id(GEN_INVENTARIO_ALMOX_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.controle = gen_id(GEN_INVENTARIO_ALMOX_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_INVENTARIO_ALMOX_COMP
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = Cast((
      right('0000' || extract(year from new.data), 4) ||
      right('00' || extract(month from new.data), 2)) as Integer);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_INVENTARIO_ALMOX_ITEM
AS
begin
  Select
    coalesce(max(i.item), 0) + 1
  from TBINVENTARIO_ALMOX_ITEM i
  where i.ano = new.ano
    and i.controle = new.controle
  Into
    new.item;

  new.item = coalesce(new.item, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_LOGRADOURO_COD
As
Begin
  If (New.Log_cod Is Null) Then
    New.Log_cod = Gen_id(Gen_logradouro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_COMPRA
AS
begin
  if ( (new.anocompra > 0) and (new.numcompra > 0) ) then
  begin
    Update TBCOMPRAS c Set
        c.nfserie = new.serie
      , c.nf      = new.numero
      , c.nfe_enviada      = 1
      , c.tipo_documento   = 5 -- NF-e
      , c.verificador_nfe  = new.chave
      , c.xml_nfe_filename = new.xml_filename
      , c.xml_nfe          = new.xml_file
      , c.lote_nfe_ano     = new.lote_ano
      , c.lote_nfe_numero  = new.lote_num
      , c.lote_nfe_recibo  = new.recibo
      , c.status  = 4 -- Nota Fiscal Gerada
      , c.dtemiss = new.dataemissao
      , c.hremiss = new.horaemissao
    where c.ano        = new.anocompra
      and c.codcontrol = new.numcompra;
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ATUALIZAR_VENDA
AS
begin
  if ( (new.anovenda > 0) and (new.numvenda > 0) ) then
  begin
    Update TBVENDAS v Set
        v.serie = new.serie
      , v.nfe   = new.numero
      , v.nfe_enviada      = 1
      , v.verificador_nfe  = new.chave
      , v.xml_nfe_filename = new.xml_filename
      , v.xml_nfe          = new.xml_file
      , v.lote_nfe_ano     = new.lote_ano
      , v.lote_nfe_numero  = new.lote_num
      , v.lote_nfe_recibo  = new.recibo
      , v.status      = 4 -- Nota Fiscal Gerada
      , v.dataemissao = new.dataemissao
      , v.horaemissao = new.horaemissao
    where v.ano = new.anovenda
      and v.codcontrol = new.numvenda;
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_NFE_ENVIADA_EMPRESA
AS
begin
  new.cancelada = coalesce(new.cancelada, 0);
  if (new.empresa is null) then
  begin

    /* Identificando a Empresa da Venda (Saida) */

    if (new.anovenda is not null) then
    begin
      Select
        v.codemp
      from TBVENDAS v
      where v.ano        = new.anovenda
        and v.codcontrol = new.numvenda
      Into
        new.empresa;

    end

    else

    /* Identificando a Empresa da Compra (Entrada) */

    if (new.anovenda is not null) then
    begin

      Select
        v.codemp
      from TBVENDAS v
      where v.ano        = new.anovenda
        and v.codcontrol = new.numvenda
      Into
        new.empresa;

    end

  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_OS_COMPETENCIA
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

SET TERM ^ ;

ALTER TRIGGER TG_OS_NOVA
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

SET TERM ^ ;

ALTER TRIGGER TG_PLANO_CONTA_NOVO
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_PLANO_CONTA, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_COD
As
Begin
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(Gen_produto_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PRODUTO_ROTATIVIDADE_MOV
AS
  declare variable movimento numeric(18,4);
begin
  movimento =
    coalesce(new.compra_qtde_01, 0) + coalesce(new.venda_qtde_01, 0) +
    coalesce(new.compra_qtde_03, 0) + coalesce(new.venda_qtde_03, 0) +
    coalesce(new.compra_qtde_06, 0) + coalesce(new.venda_qtde_06, 0) +
    coalesce(new.compra_qtde_09, 0) + coalesce(new.venda_qtde_09, 0) +
    coalesce(new.compra_qtde_12, 0) + coalesce(new.venda_qtde_12, 0) +
    coalesce(new.compra_qtde_99, 0) + coalesce(new.venda_qtde_99, 0);

  if ( :movimento > 0 ) then
    new.movimentado = 1;
  else
    new.movimentado = 0;

  if ( new.data_ultima_compra = '1899.12.30' ) then
    new.data_ultima_compra = null;

  if ( new.data_ultima_venda = '1899.12.30' ) then
    new.data_ultima_venda = null;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_NOVA
AS
BEGIN
  IF (NEW.CODIGO IS NULL) THEN
    NEW.CODIGO = GEN_ID(GEN_TBPROMOCAO_ID, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_PRODUTO
AS
  declare variable produto varchar(10);
  declare variable valor_prom numeric(15,2);
begin
  if ( coalesce(old.Ativa, 0) <> coalesce(new.Ativa, 0) ) then
  begin

    for
      Select
          p.Codigo_prod
        , case when new.Ativa = 1 then p.Preco_promocao else null end
      from TBPROMOCAO_PRODUTO p
      where p.Codigo_prom = new.Codigo
      into
          produto
        , valor_prom
    do
    begin
      Update TBPRODUTO x Set
        x.Preco_promocao = :Valor_prom
      where x.Cod = :Produto;
    end 

  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_PROMOCAO_PRODUTO_RETIRAR
AS
begin
  /* Retirar Preco de Promocao da Ficha do Produto */
  Update TBPRODUTO p Set
    p.Preco_promocao = null
  where p.Cod = old.Codigo_prod;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_REQUISICAO_ALMOX_CANCELAR
AS
  declare variable item        DMN_SMALLINT_NN;
  declare variable lote_atend  DMN_GUID_38;
  declare variable lote_requi  DMN_GUID_38;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable tipo_requisicao DMN_SMALLINT_NN;
begin
  if ( (old.status = 4) and (new.status = 5) ) then /* De atendida (4) para cancelada (5) */
  begin

    tipo_requisicao = new.tipo;

    -- Listar Produtos requisitados ao almoxarifado
    for
      Select
          i.item
        , i.qtde_atendida
        , i.lote_atendimento
        , i.lote_requisitante
      from TBREQUISICAO_ALMOX_ITEM i
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status in (2, 3) /* Atendido e/ou Enregue */
        and i.qtde_atendida > 0
      into
          item
        , quantidade
        , lote_atend
        , lote_requi
    do
    begin

       -- Baixar estoque do Centro de custo requisitante caso o movimento tenha sido de Transferencia de Estoque
      if ( :tipo_requisicao = 2 ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde = coalesce(e.qtde, 0.0) - :quantidade
        where e.id = :lote_requi;
      end

       -- Devolver o estoque do Centro de custo atendente
      Update TBESTOQUE_ALMOX e Set
        e.qtde = coalesce(e.qtde, 0.0) + :quantidade
      where e.id = :lote_atend;

      -- Marcar item/produto como cancelado
      Update TBREQUISICAO_ALMOX_ITEM i Set
        i.status = 4 /* Cancelado */
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.item     = :item
        and i.status in (2, 3); /* Atendido e/ou Enregue */

    end

  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_REQUISICAO_ALMOX_CODIGO
AS
begin
  if (new.controle is null) then
    if ( new.ano = 2015 ) then
      new.controle = gen_id(GEN_REQUISICAO_ALMOX_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.controle = gen_id(GEN_REQUISICAO_ALMOX_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.controle = gen_id(GEN_REQUISICAO_ALMOX_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.controle = gen_id(GEN_REQUISICAO_ALMOX_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.controle = gen_id(GEN_REQUISICAO_ALMOX_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.controle = gen_id(GEN_REQUISICAO_ALMOX_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_REQUISICAO_ALMOX_COMPET
AS
  declare variable competencia Integer;
  declare variable data DMN_DATE;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    data = coalesce(cast(new.atendimento_data as Date), new.data_emissao, cast(new.insercao_data as Date), current_date);

    competencia = Cast((right('0000' ||
      extract(year  from :data), 4) || right('00' ||
      extract(month from :data), 2)) as Integer);

    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_REQUISICAO_ALMOX_ESTOQUE
AS
  declare variable empresa   varchar(18);
  declare variable cc_origem Integer;
  declare variable item      DMN_SMALLINT_NN;
  declare variable produto varchar(10);
  declare variable lote        DMN_INTEGER_N;
  declare variable lote_guid   DMN_GUID_38;
  declare variable data_fabricacao DMN_DATE;
  declare variable data_validade   DMN_DATE;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_medio     DMN_MONEY;
  declare variable tipo_requisicao DMN_SMALLINT_NN;
begin
  if ( (old.status <> new.status) and (new.status = 4) ) then /* Atendida */
  begin

    empresa    = new.empresa;
    cc_origem  = new.ccusto_origem;  /* Requisitante */
    tipo_requisicao = new.tipo;

    -- Listar Produtos requisitados ao almoxarifado
    for
      Select
          i.item
        , i.produto
        , i.qtde_atendida
        , e.lote
        , e.id
        , e.data_fabricacao
        , e.data_validade
        , coalesce(e.qtde, 0)
        , coalesce(e.custo_medio, 0)
        , coalesce(nullif(e.fracionador, 0), 1)
      from TBREQUISICAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.cod = i.produto)
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento) -- Lote identificado pela aplicacao
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status = 2 /* Atendido */
      into
          item
        , produto
        , quantidade
        , lote
        , lote_guid
        , data_fabricacao
        , data_validade
        , estoque
        , custo_medio
        , fracionador
    do
    begin

      estoque     = (:estoque - :quantidade);
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque do centro de custo atendente
      Update TBESTOQUE_ALMOX e Set
          e.qtde = :estoque
      where e.id = :lote_guid;

      lote_guid = null;

      if ( :tipo_requisicao = 2 ) then /* Transferencia de estoque */
      begin

        -- Verificar se ja existe estoque para o Centro de Custo requisitante
        Select
            ea.id
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :cc_origem
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            lote_guid;

        if ( :lote_guid is null ) then
        begin

          Select
            g.hex_uuid_format
          from GET_GUID_UUID_HEX g
          Into
            lote_guid;

          Insert Into TBESTOQUE_ALMOX (
              empresa
            , centro_custo
            , produto
            , lote
            , data_fabricacao
            , data_validade
            , qtde
            , fracionador
            , custo_medio
            , id
          ) values (
              :empresa
            , :cc_origem
            , :produto
            , :lote
            , :data_fabricacao
            , :data_validade
            , :quantidade
            , :fracionador
            , :custo_medio
            , :lote_guid
          );
            
        end
        else
        begin

          Update TBESTOQUE_ALMOX ea Set
              ea.qtde = coalesce(ea.qtde, 0.0) + :quantidade
          where ea.id = :lote_guid;

        end 

      end 

      -- Marcar item/produto como atendido
      Update TBREQUISICAO_ALMOX_ITEM i Set
          i.status            = 2 /* Atendido */
        , i.lote_requisitante = :lote_guid
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.item     = :item
        and i.status   = 1; /* Aguardando */

    end

  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_REQUISITA_COMPRA_CODIGO
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2014 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2014, 1);
    else
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_REQUISITA_COMPRA_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_REQUISITA_COMPRA_COMPETENCIA
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.emissao_data), 4) || right('00' || extract(month from new.emissao_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_SECAOPRODUTO_COD
As
Begin
  If (New.Scp_cod Is Null) Then
    New.Scp_cod = Gen_id(GEN_SECAOPRODUTO_ID,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_SOLICITACAO_CODIGO
AS
begin
  if (new.codigo is null) then
    if ( new.ano = 2015 ) then
      new.codigo = gen_id(GEN_SOLICITACAO_2015, 1);
    else
    if ( new.ano = 2016 ) then
      new.codigo = gen_id(GEN_SOLICITACAO_2016, 1);
    else
    if ( new.ano = 2017 ) then
      new.codigo = gen_id(GEN_SOLICITACAO_2017, 1);
    else
    if ( new.ano = 2018 ) then
      new.codigo = gen_id(GEN_SOLICITACAO_2018, 1);
    else
    if ( new.ano = 2019 ) then
      new.codigo = gen_id(GEN_SOLICITACAO_2019, 1);
    else
    if ( new.ano = 2020 ) then
      new.codigo = gen_id(GEN_SOLICITACAO_2020, 1);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_SOLICITACAO_COMPETENCIA
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

SET TERM ^ ;

ALTER TRIGGER TG_TBCONTREC_SALDO
AS
begin
  new.valorsaldo = ( coalesce(new.valorrec, 0) + coalesce(new.valormulta, 0) - ( coalesce(new.valorrec, 0) * coalesce(new.percentdesconto, 0) / 100 ) ) - coalesce(new.valorrectot, 0);
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TBESTADO_ALIQUOTA
AS
begin
  if (exists(
    Select
      a.aliquota
    from SYS_ALIQUOTA_ICMS a
    where a.uf_origem  = new.est_sigla
      and a.uf_destino = new.est_sigla
  )) then
    Update SYS_ALIQUOTA_ICMS a Set
      a.aliquota = coalesce(new.aliquota_icms, 0.0)
    where a.uf_origem  = new.est_sigla
      and a.uf_destino = new.est_sigla;
  else
    Insert Into SYS_ALIQUOTA_ICMS (
        uf_origem
      , uf_destino
      , aliquota
    ) values (
        new.est_sigla
      , new.est_sigla
      , coalesce(new.aliquota_icms, 0.0)
    );
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_TIPO_LOGRADOURO_COD
As
Begin
  If (New.Tlg_cod Is Null) Then
    New.Tlg_cod = Gen_id(Gen_tipo_logradouro_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_UNIDADEPRODUTO_COD
As
Begin
  If (New.Unp_cod Is Null) Then
    New.Unp_cod = Gen_id(Gen_unidadeproduto_id,1);
End^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_RESERVAR
AS
  --declare variable status_venda Smallint;
  declare variable reserva integer;
begin
  /*
  Select
    v.Status
  from TBVENDAS v
  where v.Ano = new.Ano
    and v.Codcontrol = new.Codcontrol
  into
    status_venda;
  */

  Exit; -- Descontinuada RESERVA

  if ( Inserting or Updating  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0) + coalesce(new.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = new.Codprod
        and p.Codemp = new.Codemp
      into
        Reserva;
  end

  else

  if ( Deleting  ) then
  begin
      Select
         coalesce(p.Reserva, 0) - coalesce(old.Qtde, 0)
      from TBPRODUTO p
      where p.Cod    = old.Codprod
        and p.Codemp = old.Codemp
      into
        Reserva;
  end

  Update TBPRODUTO Set
    Reserva = :Reserva
  where Cod    = new.Codprod
    and Codemp = new.Codemp;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_TOTAIS_PRODUTO
AS
begin
  Exit;

  new.total_bruto    = ( coalesce(new.qtde, 0.0) * coalesce(new.punit, 0.0) );
  new.total_desconto = ( coalesce(new.qtde, 0.0) * coalesce(new.desconto_valor, 0.0) );
  new.total_liquido  = ( coalesce(new.total_bruto, 0.0) - coalesce(new.total_desconto, 0.0) );
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDASITENS_TOTAL_VENDA
AS
  declare variable anovenda Smallint;
  declare variable numvenda Integer;
  declare variable total_bruto Dmn_money;
  declare variable total_desconto dmn_money;
  declare variable total_liquido Dmn_money;
  declare variable total_custo Dmn_money;
begin
  if ( (Inserting) or (Updating) ) then
  begin
    anovenda = new.Ano;
    numvenda = new.Codcontrol;
  end
  else
  begin
    anovenda = old.Ano;
    numvenda = old.Codcontrol;
  end

  Select
      sum( coalesce(i.total_bruto,    0) )
    , sum( coalesce(i.total_desconto, 0) )
    , sum( coalesce(i.qtde, 0) * coalesce(p.customedio, 0) )
  from TVENDASITENS i
    inner join TBPRODUTO p on (p.cod = i.codprod)
  where i.Ano = :Anovenda
    and i.Codcontrol = :Numvenda
  into
      Total_bruto
    , Total_desconto
    , Total_custo;

  Total_bruto    = coalesce(:Total_bruto, 0);
  Total_desconto = coalesce(:Total_desconto, 0);
  total_liquido  = :Total_bruto - :Total_desconto;

  Update TBVENDAS v Set
      v.Totalvenda_bruta = :Total_bruto
    , v.Desconto   = :Total_desconto
    , v.Totalvenda = (:Total_liquido - coalesce(v.Desconto_cupom, 0.0))
    , v.Totalcusto = :Total_custo
  where v.Ano = :Anovenda
    and v.Codcontrol = :Numvenda;
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CAIXA
AS
begin
  new.caixa_pdv = coalesce(new.caixa_pdv, 0);

  if (not exists(
    Select
      c.ano
    from TBCAIXA c
    where c.ano    = new.caixa_ano
      and c.numero = new.caixa_num
  )) then
  begin
    new.caixa_ano = null;
    new.caixa_num = null;
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CANCELAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod = :Produto;

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
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , replace('Venda no valor de R$ ' || :Valor_produto, '.', ',')
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

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_COMPETENCIA
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.dtvenda), 4) || right('00' || extract(month from new.dtvenda), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CONTROLE
AS
BEGIN
  IF (NEW.CODCONTROL IS NULL) THEN
    if ( new.Ano = 2011 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2011, 1);
    else
    if ( new.Ano = 2012 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2012, 1);
    else
    if ( new.Ano = 2013 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2013, 1);
    else
    if ( new.Ano = 2014 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2014, 1);
    else
    if ( new.Ano = 2015 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2015, 1);
    else
    if ( new.Ano = 2016 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2016, 1);
    else
    if ( new.Ano = 2017 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2017, 1);
    else
    if ( new.Ano = 2018 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2018, 1);
    else
    if ( new.Ano = 2019 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2019, 1);
    else
    if ( new.Ano = 2020 ) then
      NEW.CODCONTROL = GEN_ID(GEN_VENDAS_CONTROLE_2020, 1);
END^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_CUSTO_OPERACIONAL
AS
  declare variable gerar_custo_oper      Smallint;
  declare variable custo_oper_percentual Smallint;
  declare variable custo_oper_frete      Numeric(15,4);
  declare variable custo_oper_outros     Numeric(15,4);
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    /* Buscar FLAG de controle */
    Select
      coalesce(c.custo_oper_calcular, 0)
    from TBCONFIGURACAO c
    where c.empresa = new.codemp
    Into
      gerar_custo_oper;

    /* Buscar valores para calculo de custo operacional caso a empresa esteja configurada para este processo */
    if ( :gerar_custo_oper = 1 ) then
    begin
      Select First 1
          c.custo_oper_percentual
        , c.custo_oper_frete
        , c.custo_oper_outros
      from TBCLIENTE c
      where c.codigo = new.codcliente
      Into
          custo_oper_percentual
        , custo_oper_frete
        , custo_oper_outros;

      new.custo_oper_percentual = :custo_oper_percentual;
      new.custo_oper_frete      = :custo_oper_frete;
      new.custo_oper_outros     = :custo_oper_outros;
    end 
  end
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_ESTOQUE_ATUALIZAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable reserva    DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , reserva
        , valor_produto
        , Movimentar
    do
    begin
      reserva = 0; -- :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

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
        , Trim('SAIDA - VENDA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Venda no valor de R$ ' || :Valor_produto, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^

SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_ESTOQUE_CLIENTE
AS
  declare variable produto varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable valor_medio numeric(15,4);
  declare variable valor_venda numeric(15,2);
begin

  /* Gerar Estoque para o Cliente na Finalizacao da Venda */

  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin
    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida
          , coalesce(c.quantidade, 0) -- Estoque
          , (coalesce(c.valor_medio, 0) * coalesce(c.quantidade, 0))
          , i.total_liquido
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod)
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
          , valor_medio
          , valor_venda
      do
      begin

        -- Recalcular valor medio ja existente
        if ( :estoque <= 0 ) then
          valor_medio = 0.0;

        -- Gerar novo valor medio
        valor_medio = (:valor_medio + :valor_venda) / (:quantidade + :estoque);

        if (not exists(
          Select
            ec.cod_cliente
          from TBCLIENTE_ESTOQUE ec
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto
        )) then
        begin

          -- Gerar Estoque
          Insert Into TBCLIENTE_ESTOQUE (
              cod_cliente
            , cod_produto
            , quantidade
            , valor_medio
            , usuario
            , ano_venda_ult
            , cod_venda_ult
          ) values (
              new.codcliente
            , :produto
            , :quantidade
            , :valor_medio
            , new.usuario
            , new.ano
            , new.codcontrol
          );

        end
        else
        begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
              ec.quantidade  = coalesce(:quantidade, 0) + coalesce(:estoque, 0)
            , ec.valor_medio = :valor_medio
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto;

        end 

      end 

    end
  end

  else

  /* Atualizar Estoque do Cliente no Cancelamento da Venda */

  if ( (coalesce(old.Status, 0) in (3, 4)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    if ( new.gerar_estoque_cliente = 1 ) then
    begin

      for
        Select
            i.Codprod
          , i.Qtde                    -- Quantidade vendida cancelada
          , coalesce(c.quantidade, 0) -- Estoque
        from TVENDASITENS i
          left join TBCLIENTE_ESTOQUE c on (c.cod_cliente = new.codcliente and c.cod_produto = i.codprod)
        where i.Ano        = new.Ano
          and i.Codcontrol = new.Codcontrol
        into
            produto
          , quantidade
          , estoque
      do
      begin

          -- Atualizar estoque cliente
          Update TBCLIENTE_ESTOQUE ec Set
            ec.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
          where ec.cod_cliente = new.codcliente
            and ec.cod_produto = :produto;

      end

    end

  end

end^

SET TERM ; ^




/*------ SYSDBA 07/01/2016 18:04:27 --------*/

COMMENT ON TABLE TBTPDESPESA IS 'Tabela de Tipos de Despesas.

    Autor   :
    Data    :

Tabela responsavel por armazenar as descricoes dos tipos de despesas que poderao
ser usadas nas movimentacoes financeiras de Debito.';




/*------ SYSDBA 07/01/2016 18:05:12 --------*/

COMMENT ON TABLE TBTPDESPESA IS 'Tabela de Tipos de Despesas.

    Autor   :
    Data    :

Tabela responsavel por armazenar as descricoes dos tipos de despesas que poderao
ser usadas nas movimentacoes financeiras de Debito.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/01/2015 - IMR :
        * Documentacao da tabela';



/*------ 07/01/2016 18:07:56 --------*/

CREATE TABLE TBTPRECEITA (
    COD              SMALLINT NOT NULL,
    TIPOREC          DMN_VCHAR_50 /* DMN_VCHAR_50 = VARCHAR(50) */,
    TIPO_PARTICULAR  DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    PLANO_CONTA      DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
    ATIVO            DMN_LOGICO DEFAULT 1 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 07/01/2016 18:07:56 --------*/

ALTER TABLE TBTPRECEITA ADD CONSTRAINT PK_TBTPRECEITA PRIMARY KEY (COD);

/*------ 07/01/2016 18:07:56 --------*/

ALTER TABLE TBTPRECEITA ADD CONSTRAINT FK_TBTPRECEITA_PLANO_CONTA FOREIGN KEY (PLANO_CONTA) REFERENCES TBPLANO_CONTA (CODIGO);

/*------ 07/01/2016 18:07:56 --------*/

CREATE INDEX IDX_TBTPRECEITA_TIPO ON TBTPRECEITA (ATIVO);

/*------ 07/01/2016 18:07:56 --------*/

COMMENT ON TABLE TBTPRECEITA IS 
'Tabela de Tipos de Receitas.

    Autor   :
    Data    :

Tabela responsavel por armazenar as descricoes dos tipos de receitas que poderao
ser usadas nas movimentacoes financeiras de Creditos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/01/2015 - IMR :
        * Documentacao da tabela';

/*------ 07/01/2016 18:07:56 --------*/

COMMENT ON COLUMN TBTPRECEITA.COD IS 
'Codigo';

/*------ 07/01/2016 18:07:56 --------*/

COMMENT ON COLUMN TBTPRECEITA.TIPOREC IS
'Descricao';

/*------ 07/01/2016 18:07:56 --------*/

COMMENT ON COLUMN TBTPRECEITA.TIPO_PARTICULAR IS 
'Receita Particular:
0 - Nao
1 - Sim';

/*------ 07/01/2016 18:07:56 --------*/

COMMENT ON COLUMN TBTPRECEITA.PLANO_CONTA IS 
'Plano de contas para receitas';

/*------ 07/01/2016 18:07:56 --------*/

COMMENT ON COLUMN TBTPRECEITA.ATIVO IS 
'Tipo ativo:
0 - Nao
1 - Sim';

/*------ 07/01/2016 18:07:56 --------*/

GRANT ALL ON TBTPRECEITA TO PUBLIC;


/*------ SYSDBA 07/01/2016 18:09:17 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
    ADD TIPO_RECEITA DMN_SMALLINT_N;

COMMENT ON COLUMN TBCAIXA_MOVIMENTO.TIPO_RECEITA IS
'Tipo de Receita.';

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
alter CLIENTE_COD position 17;

alter table TBCAIXA_MOVIMENTO
alter CLIENTE position 18;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_ANO position 19;

alter table TBCAIXA_MOVIMENTO
alter COMPRA_NUM position 20;

alter table TBCAIXA_MOVIMENTO
alter EMPRESA position 21;

alter table TBCAIXA_MOVIMENTO
alter FORNECEDOR position 22;

alter table TBCAIXA_MOVIMENTO
alter USUARIO position 23;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_ANO position 24;

alter table TBCAIXA_MOVIMENTO
alter APAGAR_NUM position 25;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_ANO position 26;

alter table TBCAIXA_MOVIMENTO
alter ARECEBER_NUM position 27;




/*------ SYSDBA 07/01/2016 18:09:48 --------*/

ALTER TABLE TBCAIXA_MOVIMENTO
ADD CONSTRAINT FK_TBCAIXA_MOVIMENTO_TR
FOREIGN KEY (TIPO_RECEITA)
REFERENCES TBTPRECEITA(COD);




/*------ SYSDBA 07/01/2016 18:12:01 --------*/

ALTER TABLE TBCONTREC
    ADD CODTPREC DMN_SMALLINT_N;

COMMENT ON COLUMN TBCONTREC.CODTPREC IS
'Tipo de Receita';

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
alter CODTPREC position 33;

alter table TBCONTREC
alter SITUACAO position 34;

alter table TBCONTREC
alter LOTE position 35;

alter table TBCONTREC
alter COMPETENCIA_APURACAO position 36;




/*------ SYSDBA 07/01/2016 18:12:25 --------*/

ALTER TABLE TBCONTREC
ADD CONSTRAINT FK_TBCONTREC_TP_RECEITA
FOREIGN KEY (CODTPREC)
REFERENCES TBTPRECEITA(COD);




/*------ SYSDBA 07/01/2016 18:13:47 --------*/

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
begin
  -- Montar Historico
  Select
      coalesce(v.Codemp, r.empresa)
    , coalesce(v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
    , r.codtprec
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBCLIENTE c on (c.codigo = coalesce(v.codcliente, r.cliente))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda
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




/*------ SYSDBA 07/01/2016 19:48:26 --------*/

COMMENT ON TABLE TBTPRECEITA IS 'Tabela de Tipos de Receitas.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/01/2016

Tabela responsavel por armazenar as descricoes dos tipos de receitas que poderao
ser usadas nas movimentacoes financeiras de Creditos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/01/2015 - IMR :
        * Documentacao da tabela';




/*------ SYSDBA 07/01/2016 20:02:33 --------*/

ALTER TABLE TBTPRECEITA
ADD CONSTRAINT UNQ_TBTPRECEITA
UNIQUE (TIPOREC);




/*------ SYSDBA 07/01/2016 20:10:24 --------*/

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
declare variable tipo_receita Smallint;
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

  -- Buscar e inserir Tipo de Receita padrao para Vendas

  Select first 1
    tr.cod
  from TBTPRECEITA tr
  where tr.tiporec = 'VENDAS DE MATERIAIS/PRODUTOS'
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
      , 'VENDAS DE MATERIAIS/PRODUTOS'
      , 0
      , null
      , 1
    );
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
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 07/01/2016 20:15:13 --------*/

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
declare variable tipo_receita Smallint;
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
    where tr.tiporec = 'VENDAS DE MATERIAIS/PRODUTOS'
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
        , 'VENDAS DE MATERIAIS/PRODUTOS'
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
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 07/01/2016 20:15:39 --------*/

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
declare variable tipo_receita Smallint;
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
    , 0
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 07/01/2016 21:51:07 --------*/

ALTER TABLE TBTPDESPESA
ADD CONSTRAINT UNQ_TBTPDESPESA
UNIQUE (TIPODESP);




/*------ SYSDBA 12/01/2016 16:54:46 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
active before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select first 1
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^




/*------ SYSDBA 12/01/2016 16:55:00 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
inactive before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select first 1
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^




/*------ SYSDBA 12/01/2016 17:06:52 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
inactive before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select first 1
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTA_CORRENTE_EMPRESA IS 'Trigger Integridade Conta Corrente X Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   15/10/2014

Trigger responsavel por manter a relacao "Conta Corrente x Empresa" coerente com a relacao "Banco Boleto x Empresa" para
toda conta corrente do tipo Banco (2).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/05/2014 - IMR :
        * Trigger descontinuada por nao ser mais util para a nova estrutura das
          contas correntes lancadas pelos sistemas SGE/SGI.';




/*------ SYSDBA 12/01/2016 17:07:25 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
inactive before insert or update position 10
AS
begin
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select first 1
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^




/*------ SYSDBA 12/01/2016 17:07:57 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_conta_corrente_empresa for tbconta_corrente
inactive before insert or update position 10
AS
begin
  /* Descontinuada -> Ler documentacao */
  if ( (new.tipo = 2) and (new.conta_banco_boleto is not null) ) then
    Select first 1
      coalesce(b.empresa, new.empresa)
    from TBBANCO_BOLETO b
    where b.bco_cod = new.conta_banco_boleto
    Into
      new.empresa;
end^

SET TERM ; ^




/*------ SYSDBA 13/01/2016 14:04:40 --------*/

ALTER TABLE TBBANCO_BOLETO
    ADD CONTROLE DMN_SMALLINT_NN DEFAULT 1;

COMMENT ON COLUMN TBBANCO_BOLETO.CONTROLE IS
'Controle';

alter table TBBANCO_BOLETO
alter CONTROLE position 1;

alter table TBBANCO_BOLETO
alter BCO_COD position 2;

alter table TBBANCO_BOLETO
alter EMPRESA position 3;

alter table TBBANCO_BOLETO
alter BCO_CARTEIRA position 4;

alter table TBBANCO_BOLETO
alter BCO_NOME position 5;

alter table TBBANCO_BOLETO
alter BCO_AGENCIA position 6;

alter table TBBANCO_BOLETO
alter BCO_CC position 7;

alter table TBBANCO_BOLETO
alter BCO_CODIGO_CEDENTE position 8;

alter table TBBANCO_BOLETO
alter BCO_CHAVE position 9;

alter table TBBANCO_BOLETO
alter BCO_GERAR_BOLETO position 10;

alter table TBBANCO_BOLETO
alter BCO_NOSSO_NUM_INICIO position 11;

alter table TBBANCO_BOLETO
alter BCO_NOSSO_NUM_FINAL position 12;

alter table TBBANCO_BOLETO
alter BCO_NOSSO_NUM_PROXIMO position 13;

alter table TBBANCO_BOLETO
alter BCO_CONFG_1 position 14;

alter table TBBANCO_BOLETO
alter BCO_CONFG_2 position 15;

alter table TBBANCO_BOLETO
alter BCO_SEQUENCIAL_REM position 16;

alter table TBBANCO_BOLETO
alter BCO_DIRETORIO_REMESSA position 17;

alter table TBBANCO_BOLETO
alter BCO_DIRETORIO_RETORNO position 18;

alter table TBBANCO_BOLETO
alter BCO_PERCENTUAL_JUROS position 19;

alter table TBBANCO_BOLETO
alter BCO_PERCENTUAL_MORA position 20;

alter table TBBANCO_BOLETO
alter BCO_DIA_PROTESTO position 21;

alter table TBBANCO_BOLETO
alter BCO_MSG_INSTRUCAO position 22;

alter table TBBANCO_BOLETO
alter BCO_LAYOUT_REMESSA position 23;

alter table TBBANCO_BOLETO
alter BCO_LAYOUT_RETORNO position 24;




/*------ SYSDBA 13/01/2016 14:08:12 --------*/

ALTER TABLE TBBANCO_BOLETO ALTER CONTROLE TO BCO_CONTROLE;




/*------ SYSDBA 13/01/2016 14:08:25 --------*/

ALTER TABLE TBBANCO_BOLETO ALTER BCO_CONTROLE TO BCO_CODIGO;




/*------ SYSDBA 13/01/2016 14:08:35 --------*/

COMMENT ON COLUMN TBBANCO_BOLETO.BCO_CODIGO IS
'Codigo sequencial unico.';




/*------ SYSDBA 13/01/2016 14:11:52 --------*/

SET TERM ^ ;

CREATE trigger tg_banco_boleto_codigo for tbbanco_boleto
active before insert position 0
AS
  declare variable codigo DMN_SMALLINT_N;
begin
  if ( new.bco_codigo is null ) then
  begin
    Select
      max(b.bco_codigo)
    from TBBANCO_BOLETO b
    Into
      codigo;

    new.bco_codigo = coalesce(:codigo, 0) + 1;
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_BANCO_BOLETO_CODIGO IS 'Trigger Novo Banco/Boleto (Codigo).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2016

Trigger responavel por gerar o codigo sequencial unico para cada novo registro
quando este nao for informado.';




/*------ SYSDBA 13/01/2016 14:40:35 --------*/

ALTER TABLE TBGRUPOPROD
    ADD PERC_VENDA_COMISSAO DMN_PERCENTUAL DEFAULT 0.0;

COMMENT ON COLUMN TBGRUPOPROD.PERC_VENDA_COMISSAO IS
'Percentual de comissao na venda:
De 0 a 100';




/*------ SYSDBA 14/01/2016 13:49:04 --------*/

COMMENT ON COLUMN TBBANCO_BOLETO.BCO_COD IS
'Codigo Febraban.';




/*------ SYSDBA 14/01/2016 13:49:41 --------*/

COMMENT ON COLUMN TBBANCO_BOLETO.BCO_DIRETORIO_REMESSA IS
'Diretorio p/ gerar os arquivos de remessa.';




/*------ SYSDBA 14/01/2016 13:49:55 --------*/

COMMENT ON COLUMN TBBANCO_BOLETO.BCO_DIRETORIO_RETORNO IS
'Diretorio p/ armazenar os arquivos de retorno.';




/*------ SYSDBA 14/01/2016 15:23:33 --------*/

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
begin
  -- Montar Historico
  Select
      coalesce(v.Codemp, r.empresa)
    , coalesce(v.codcliente, r.cliente)
    , coalesce(nullif(trim(c.cnpj), ''), nullif(trim(v.codcli), ''), nullif(trim(r.cnpj),''))
    , 'VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
    , r.Anovenda
    , r.Numvenda
    , r.codtprec
  from TBCONTREC r
    left join TBVENDAS v on (v.Ano = r.Anovenda and v.Codcontrol = r.Numvenda)
    left join TBCLIENTE c on (c.codigo = coalesce(v.codcliente, r.cliente))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , cliente_cod
    , cliente_cnpj
    , Historico
    , Ano_venda
    , Num_venda
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




/*------ SYSDBA 14/01/2016 15:23:56 --------*/

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
begin
  -- Montar Historico
  Select
      coalesce(v.Codemp, r.empresa)
    , r.cliente
    , c.cnpj
    , substring((
        'ESTORNO DO RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq ||
        ' VENDA No. ' || r.Anovenda || '/' || r.Numvenda || ' - ' || c.Nome
      ) from 1 for 250)
    , r.Anovenda
    , r.Numvenda
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
    , Num_venda;

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




/*------ SYSDBA 14/01/2016 15:24:06 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
declare variable TIPO_DESPESA smallint;
begin
  -- Montar Historico
  Select
      coalesce(cc.Codemp, r.empresa)
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
    , r.codtpdesp
  from TBCONTPAG r
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
    left join TBFORNECEDOR f on (f.Codforn = coalesce(cc.Codforn, r.codforn))
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra
    , tipo_despesa;

  Historico = coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Tipo_Despesa
    , Historico
    , Valor
    , Situacao
    , Venda_ano
    , Venda_num
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'D'
    , :tipo_despesa
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 14/01/2016 15:24:16 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (
    USUARIO varchar(12),
    DATA_PAGTO timestamp,
    FORMA_PAGTO smallint,
    ANOLANC smallint,
    NUMLANC integer,
    SEQ smallint,
    VALOR_BAIXA numeric(18,2))
as
declare variable EMPRESA varchar(18);
declare variable FORNECEDOR integer;
declare variable ANO_CAIXA smallint;
declare variable NUM_CAIXA integer;
declare variable CCR_CAIXA integer;
declare variable HISTORICO varchar(250);
declare variable ANO_COMPRA smallint;
declare variable NUM_COMPRA integer;
begin
  -- Montar Historico
  Select
      coalesce(cc.Codemp, r.empresa)
    , cc.Codforn
    , substring((
        'ESTORNO DO PAGTO. DA DUPLICATA No. ' || r.Anocompra || '/' || r.Numcompra || ' P' || :Seq ||
        ' DA COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
      ) from 1 for 250)
    , r.Anocompra
    , r.Numcompra
  from TBCONTPAG r
    left join TBFORNECEDOR f on (f.Codforn = r.Codforn)
    left join TBCOMPRAS cc on (cc.Ano = r.Anocompra and cc.Codcontrol = r.Numcompra)
  where r.Anolanc = :Anolanc
    and r.Numlanc = :Numlanc
  into
      Empresa
    , Fornecedor
    , Historico
    , Ano_compra
    , Num_compra;

  Historico = coalesce(:Historico, 'ESTORNO DO PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq);

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
    , Cliente
    , Compra_ano
    , Compra_num
    , Empresa
    , Fornecedor
    , Usuario
    , Apagar_ano
    , Apagar_num
  ) values (
      Extract(Year from :Data_pagto)
    , Null
    , :Ano_caixa
    , :Num_caixa
    , :Ccr_caixa
    , :Forma_pagto
    , :Data_pagto
    , 'C'
    , 1
    , :Historico
    , :Valor_baixa
    , 1
    , Null
    , Null
    , Null
    , :Ano_compra
    , :Num_compra
    , :Empresa
    , :Fornecedor
    , :Usuario
    , :Anolanc
    , :Numlanc
  );

end^

SET TERM ; ^




/*------ SYSDBA 18/01/2016 15:43:27 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_FLUXO_CAIXA (
    IDCONTA integer,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    DATA date,
    CONTA_CORRENTE integer,
    CONTA_CORRENTE_DESC varchar(50),
    FORMA_PAGTO integer,
    FORMA_PAGTO_DESC varchar(50),
    HISTORICO varchar(250),
    TIPO varchar(1),
    TIPO_RECEITA smallint,
    TIPO_RECEITA_DESC varchar(50),
    TIPO_DESPESA smallint,
    TIPO_DESPESA_DESC varchar(50),
    ENTRADA numeric(18,2),
    SAIDA numeric(18,2),
    SALDO numeric(18,2),
    CAIXA_ANO integer,
    CAIXA_NUM integer)
as
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

      /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.tipo_receita
        , rc.tiporec  as tipo_receita_desc
        , m.tipo_despesa
        , ds.tipodesp as tipo_despesa_desc
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
        left join TBTPRECEITA rc on (m.tipo_receita = rc.cod)
        left join TBTPDESPESA ds on (m.tipo_despesa = ds.cod)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Tipo_Receita
        , Tipo_Receita_Desc
        , Tipo_Despesa
        , Tipo_Despesa_Desc
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end^

SET TERM ; ^




/*------ SYSDBA 18/01/2016 15:48:37 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_FLUXO_CAIXA (
    IDCONTA integer,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    DATA date,
    CONTA_CORRENTE integer,
    CONTA_CORRENTE_DESC varchar(50),
    FORMA_PAGTO integer,
    FORMA_PAGTO_DESC varchar(50),
    HISTORICO varchar(250),
    TIPO varchar(1),
    TIPO_RECEITA smallint,
    TIPO_RECEITA_DESC varchar(50),
    TIPO_DESPESA smallint,
    TIPO_DESPESA_DESC varchar(50),
    ENTRADA numeric(18,2),
    SAIDA numeric(18,2),
    SALDO numeric(18,2),
    CAIXA_ANO integer,
    CAIXA_NUM integer)
as
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

    /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.tipo_receita
        , rc.tiporec  as tipo_receita_desc
        , m.tipo_despesa
        , ds.tipodesp as tipo_despesa_desc
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
        left join TBTPRECEITA rc on (m.tipo_receita = rc.cod)
        left join TBTPDESPESA ds on (m.tipo_despesa = ds.cod)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Tipo_Receita
        , Tipo_Receita_Desc
        , Tipo_Despesa
        , Tipo_Despesa_Desc
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end^

SET TERM ; ^




/*------ SYSDBA 18/01/2016 15:53:43 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_FLUXO_CAIXA (
    IDCONTA integer,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    DATA date,
    CONTA_CORRENTE integer,
    CONTA_CORRENTE_DESC varchar(50),
    FORMA_PAGTO integer,
    FORMA_PAGTO_DESC varchar(50),
    HISTORICO varchar(250),
    TIPO varchar(1),
    TIPO_RECEITA smallint,
    TIPO_RECEITA_DESC varchar(50),
    TIPO_DESPESA smallint,
    TIPO_DESPESA_DESC varchar(50),
    ENTRADA numeric(18,2),
    SAIDA numeric(18,2),
    SALDO numeric(18,2),
    CAIXA_ANO integer,
    CAIXA_NUM integer)
as
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

    /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , m.tipo_receita
        , rc.tiporec  as tipo_receita_desc
        , m.tipo_despesa
        , ds.tipodesp as tipo_despesa_desc
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
        left join TBTPRECEITA rc on (m.tipo_receita = rc.cod)
        left join TBTPDESPESA ds on (m.tipo_despesa = ds.cod)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Tipo_Receita
        , Tipo_Receita_Desc
        , Tipo_Despesa
        , Tipo_Despesa_Desc
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end^

SET TERM ; ^




/*------ SYSDBA 18/01/2016 20:41:32 --------*/

CREATE INDEX IDX_TBCONTA_CORRENTE_DESC
ON TBCONTA_CORRENTE (DESCRICAO);




/*------ SYSDBA 18/01/2016 20:43:19 --------*/

SET TERM ^ ;

create or alter procedure GET_CAIXA_MOVIMENTO (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE)
returns (
    DATA DMN_DATE,
    CONTA_CORRENTE DMN_INTEGER_N,
    CONTA_CORRENTE_DESC DMN_VCHAR_50,
    FORMA_PAGTO DMN_INTEGER_N,
    FORMA_PAGTO_DESC DMN_VCHAR_50,
    HISTORICO DMN_VCHAR_250,
    TIPO DMN_VCHAR_01,
    TIPO_RECEITA DMN_SMALLINT_N,
    TIPO_RECEITA_DESC DMN_VCHAR_50,
    TIPO_DESPESA DMN_SMALLINT_N,
    TIPO_DESPESA_DESC DMN_VCHAR_50,
    ENTRADA numeric(18,2),
    SAIDA numeric(18,2),
    SALDO numeric(18,2),
    CAIXA_ANO DMN_INTEGER_N,
    CAIXA_NUM DMN_INTEGER_N)
as
begin
  conta = coalesce(:conta, 0);

  for
    Select
      cc.codigo
    from TBCONTA_CORRENTE cc
    where (cc.empresa = :empresa)
      and ((cc.codigo = :conta) or (:conta = 0))
    order by
      cc.descricao
    Into
      conta_corrente
  do
  begin
    for
        Select
            cx.data
          , cx.conta_corrente_desc
          , cx.forma_pagto
          , cx.forma_pagto_desc
          , cx.historico
          , cx.tipo
          , cx.tipo_receita
          , cx.tipo_receita_desc
          , cx.tipo_despesa
          , cx.tipo_despesa_desc
          , cx.entrada
          , cx.saida
          , cx.saldo
          , cx.caixa_ano
          , cx.caixa_num
        from GET_FLUXO_CAIXA(:conta_corrente, :data_inicial, :data_final) cx
        Into
            data
          , conta_corrente_desc
          , forma_pagto
          , forma_pagto_desc
          , historico
          , tipo
          , tipo_receita
          , tipo_receita_desc
          , tipo_despesa
          , tipo_despesa_desc
          , entrada
          , saida
          , saldo
          , caixa_ano
          , caixa_num
    do
      suspend;
  end
end ^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_CAIXA_MOVIMENTO TO "PUBLIC";



/*------ SYSDBA 19/01/2016 19:53:31 --------*/

ALTER TABLE TBCLIENTE
    ADD BLOQUEADO_AUTOMATICO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBCLIENTE.BLOQUEADO_AUTOMATICO IS
'Bloqueado automaticamente:
0 - Nao
1 - Sim';

alter table TBCLIENTE
alter CODIGO position 1;

alter table TBCLIENTE
alter TIPO position 2;

alter table TBCLIENTE
alter PESSOA_FISICA position 3;

alter table TBCLIENTE
alter CNPJ position 4;

alter table TBCLIENTE
alter NOME position 5;

alter table TBCLIENTE
alter NOMEFANT position 6;

alter table TBCLIENTE
alter INSCEST position 7;

alter table TBCLIENTE
alter INSCMUN position 8;

alter table TBCLIENTE
alter ENDER position 9;

alter table TBCLIENTE
alter COMPLEMENTO position 10;

alter table TBCLIENTE
alter BAIRRO position 11;

alter table TBCLIENTE
alter CEP position 12;

alter table TBCLIENTE
alter CIDADE position 13;

alter table TBCLIENTE
alter UF position 14;

alter table TBCLIENTE
alter FONE position 15;

alter table TBCLIENTE
alter FONECEL position 16;

alter table TBCLIENTE
alter FONECOMERC position 17;

alter table TBCLIENTE
alter EMAIL position 18;

alter table TBCLIENTE
alter SITE position 19;

alter table TBCLIENTE
alter TLG_TIPO position 20;

alter table TBCLIENTE
alter LOG_COD position 21;

alter table TBCLIENTE
alter BAI_COD position 22;

alter table TBCLIENTE
alter CID_COD position 23;

alter table TBCLIENTE
alter EST_COD position 24;

alter table TBCLIENTE
alter NUMERO_END position 25;

alter table TBCLIENTE
alter PAIS_ID position 26;

alter table TBCLIENTE
alter VALOR_LIMITE_COMPRA position 27;

alter table TBCLIENTE
alter BLOQUEADO position 28;

alter table TBCLIENTE
alter BLOQUEADO_DATA position 29;

alter table TBCLIENTE
alter BLOQUEADO_MOTIVO position 30;

alter table TBCLIENTE
alter BLOQUEADO_USUARIO position 31;

alter table TBCLIENTE
alter BLOQUEADO_AUTOMATICO position 32;

alter table TBCLIENTE
alter DESBLOQUEADO_DATA position 33;

alter table TBCLIENTE
alter VENDEDOR_COD position 34;

alter table TBCLIENTE
alter USUARIO position 35;

alter table TBCLIENTE
alter EMITIR_NFE_DEVOLUCAO position 36;

alter table TBCLIENTE
alter CUSTO_OPER_PERCENTUAL position 37;

alter table TBCLIENTE
alter CUSTO_OPER_FRETE position 38;

alter table TBCLIENTE
alter CUSTO_OPER_OUTROS position 39;

alter table TBCLIENTE
alter ENTREGA_FRACIONADA_VENDA position 40;

alter table TBCLIENTE
alter BANCO position 41;

alter table TBCLIENTE
alter AGENCIA position 42;

alter table TBCLIENTE
alter CC position 43;

alter table TBCLIENTE
alter PRACA position 44;

alter table TBCLIENTE
alter BANCO_2 position 45;

alter table TBCLIENTE
alter AGENCIA_2 position 46;

alter table TBCLIENTE
alter CC_2 position 47;

alter table TBCLIENTE
alter PRACA_2 position 48;

alter table TBCLIENTE
alter BANCO_3 position 49;

alter table TBCLIENTE
alter AGENCIA_3 position 50;

alter table TBCLIENTE
alter CC_3 position 51;

alter table TBCLIENTE
alter PRACA_3 position 52;

alter table TBCLIENTE
alter OBSERVACAO position 53;

alter table TBCLIENTE
alter DTCAD position 54;

alter table TBCLIENTE
alter ATIVO position 55;




/*------ SYSDBA 19/01/2016 19:55:29 --------*/

COMMENT ON TABLE TBCLIENTE IS 'Tabela de Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/01/2016 - IMR :
        + Criacao do campo BLOQUEADO_AUTOMATICO como referencial para o sistema de
          gestao identificar quais registros de clientes foram bloqueados de forma
          automatica por ele.

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




/*------ SYSDBA 19/01/2016 19:56:08 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_cod for tbcliente
active before insert position 0
As
Begin
  new.ativo = coalesce(new.ativo, 1);
  new.bloqueado_automatico = coalesce(new.bloqueado_automatico, 0);

  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(GEN_CLIENTE_ID, 1);
End^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 20:53:16 --------*/

ALTER TABLE TBPRODUTO
    ADD ULTIMA_COMPRA_DATA DMN_DATE,
    ADD ULTIMA_COMPRA_VALOR DMN_MONEY,
    ADD ULTIMA_COMPRA_FORNEC DMN_INTEGER_N;

COMMENT ON COLUMN TBPRODUTO.ULTIMA_COMPRA_DATA IS
'Ultima Compra - Data';

COMMENT ON COLUMN TBPRODUTO.ULTIMA_COMPRA_VALOR IS
'Ultima Compra - Valor Unitario';

COMMENT ON COLUMN TBPRODUTO.ULTIMA_COMPRA_FORNEC IS
'Ultima Compra - Fornecedor';




/*------ SYSDBA 19/01/2016 20:53:49 --------*/

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_FORNEC_ULT_CMP
FOREIGN KEY (ULTIMA_COMPRA_FORNEC)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 19/01/2016 20:58:07 --------*/

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
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
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
        , Percentual_markup
        , Percentual_margem
        , Preco_venda
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

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 21:48:41 --------*/

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
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
            (i.valor_frete  / coalesce(nullif(i.Qtde, 0), 1)) +
            (i.valor_outros / coalesce(nullif(i.Qtde, 0), 1)) +  0.0
          ) as numeric(15,2)) as percentual_despesas
        , p.percentual_marckup
        , p.percentual_margem
        , p.preco
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
        , Preco_venda
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

      Percentual_markup = cast( ( ( (:Preco_venda - :Custo_final) / :Custo_final) * 100) as numeric(18,3) );

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:09:01 --------*/

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
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
        , p.preco
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
        , Preco_venda
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

      if ( coalesce(:percentual_despesas, 0.0) > 100 ) then
        percentual_despesas = 100.0;

      Percentual_markup = 100.0 / (100.0 - :percentual_despesas); -- Encontrando o indice do Markup
      Percentual_markup = (:Percentual_markup - 1) * 100.0;       -- Transformando o indice em percentual
      /* (Final) - Calcular o markup do produto */

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:10:04 --------*/

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
  --declare variable preco_venda DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
        --, p.preco
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
        --, Preco_venda
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

      if ( coalesce(:percentual_despesas, 0.0) > 100 ) then
        percentual_despesas = 100.0;

      Percentual_markup = 100.0 / (100.0 - :percentual_despesas); -- Encontrando o indice do Markup
      Percentual_markup = (:Percentual_markup - 1) * 100.0;       -- Transformando o indice em percentual
      /* (Final) - Calcular o markup do produto */

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:11:01 --------*/

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
  --declare variable preco_venda DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
        --, p.preco
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
        --, Preco_venda
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

      if ( coalesce(:percentual_despesas, 0.0) > 100 ) then
        percentual_despesas = 99.9;

      Percentual_markup = 100.0 / (100.0 - :percentual_despesas); -- Encontrando o indice do Markup
      Percentual_markup = (:Percentual_markup - 1) * 100.0;       -- Transformando o indice em percentual
      /* (Final) - Calcular o markup do produto */

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:15:43 --------*/

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
  --declare variable preco_venda DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
        --, p.preco
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
        --, Preco_venda
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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = Case when :Percentual_markup > :Percentual_margem then :Percentual_markup else :Percentual_margem end
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:17:34 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:22:41 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE IS 'Trigger Atualizar Estoque Venda (Entrada)

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Trigger responsavel por atualizar o estoque de venda do produto, quando este
foi definido para ser movimentado. Atualiza tambem o Valor de Custo Medio do
produto e seu percentual de markup.';




/*------ SYSDBA 19/01/2016 22:24:06 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        /* Percentuais de markup e margem de lucro */
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:25:33 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        /* Percentuais de markup e margem de lucro */
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE IS 'Trigger Atualizar Estoque Venda (Entrada)

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Trigger responsavel por atualizar o estoque de venda do produto, quando este
foi definido para ser movimentado. Atualiza tambem o Valor de Custo Medio do
produto e seu percentual de markup.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/01/2016 - IMR :
        * Reestruturacao da forma de calculo do percentual de markup. Este forma
          definido da maneira que diz a literatura de gestoa comercial.';




/*------ SYSDBA 19/01/2016 22:27:44 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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

      if ( coalesce(:Percentual_margem, 0.0) <= 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        /* Percentuais de markup e margem de lucro */
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:31:51 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
        /* Percentuais de markup e margem de lucro */
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_margem / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/01/2016 22:41:35 --------*/

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
  declare variable alterar_custo Smallint;
  declare variable movimentar Smallint;
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

    -- Buscar FLAG de alteracao de custo de produto
    Select
      cf.cfop_altera_custo_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo;

    alterar_custo = coalesce(:alterar_custo, 1);

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
          p.Customedio = Case when :Alterar_custo = 1 then :Custo_final else p.Customedio end
        , p.Qtde       = Case when :Movimentar = 1    then (:Estoque + :Quantidade) else :Estoque end
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
          i.Qtdeantes = :Estoque
        , i.Qtdefinal = :Estoque + :Quantidade
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
        , Trim('ENTRADA - COMPRA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , :Estoque + :Quantidade
        , new.Usuario
        , replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',')
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 21/01/2016 00:57:12 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_CAIXA_MOVIMENTO (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE)
returns (
    DATA DMN_DATE,
    CONTA_CORRENTE DMN_INTEGER_N,
    CONTA_CORRENTE_DESC DMN_VCHAR_50,
    FORMA_PAGTO DMN_INTEGER_N,
    FORMA_PAGTO_DESC DMN_VCHAR_50,
    HISTORICO DMN_VCHAR_250,
    TIPO DMN_VCHAR_01,
    TIPO_RECEITA DMN_SMALLINT_N,
    TIPO_RECEITA_DESC DMN_VCHAR_50,
    TIPO_DESPESA DMN_SMALLINT_N,
    TIPO_DESPESA_DESC DMN_VCHAR_50,
    ENTRADA numeric(18,2),
    SAIDA numeric(18,2),
    SALDO numeric(18,2),
    CAIXA_ANO DMN_INTEGER_N,
    CAIXA_NUM DMN_INTEGER_N)
as
begin
  conta = coalesce(:conta, 0);

  for
    Select
      cc.codigo
    from TBCONTA_CORRENTE cc
    where (cc.empresa = :empresa)
      and ((cc.codigo = :conta) or (:conta = 0))
    order by
      cc.codigo
    Into
      conta_corrente
  do
  begin
    for
        Select
            cx.data
          , cx.conta_corrente_desc
          , cx.forma_pagto
          , cx.forma_pagto_desc
          , cx.historico
          , cx.tipo
          , cx.tipo_receita
          , cx.tipo_receita_desc
          , cx.tipo_despesa
          , cx.tipo_despesa_desc
          , cx.entrada
          , cx.saida
          , cx.saldo
          , cx.caixa_ano
          , cx.caixa_num
        from GET_FLUXO_CAIXA(:conta_corrente, :data_inicial, :data_final) cx
        Into
            data
          , conta_corrente_desc
          , forma_pagto
          , forma_pagto_desc
          , historico
          , tipo
          , tipo_receita
          , tipo_receita_desc
          , tipo_despesa
          , tipo_despesa_desc
          , entrada
          , saida
          , saldo
          , caixa_ano
          , caixa_num
    do
      suspend;
  end
end^

SET TERM ; ^




/*------ SYSDBA 21/01/2016 00:58:34 --------*/

CREATE INDEX IDX_TBCAIXA_MOVIMENTO_DATA
ON TBCAIXA_MOVIMENTO (DATAHORA);




/*------ SYSDBA 21/01/2016 00:59:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_FLUXO_CAIXA (
    IDCONTA integer,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    DATA date,
    CONTA_CORRENTE integer,
    CONTA_CORRENTE_DESC varchar(50),
    FORMA_PAGTO integer,
    FORMA_PAGTO_DESC varchar(50),
    HISTORICO varchar(250),
    TIPO varchar(1),
    TIPO_RECEITA smallint,
    TIPO_RECEITA_DESC varchar(50),
    TIPO_DESPESA smallint,
    TIPO_DESPESA_DESC varchar(50),
    ENTRADA numeric(18,2),
    SAIDA numeric(18,2),
    SALDO numeric(18,2),
    CAIXA_ANO integer,
    CAIXA_NUM integer)
as
begin
  IDConta = coalesce(:IDConta, 0);
  Data_Inicial = Coalesce(:Data_Inicial, Current_date);
  Data_final   = Coalesce(:Data_Final,   Current_date);

  /* Buscar Conta Corrente */
  for
    Select
        c.Codigo
      , c.Descricao
    from TBCONTA_CORRENTE c
    where (c.Codigo = :IDConta)
       or (:IDConta = 0)
    into
        Conta_Corrente
      , Conta_Corrente_Desc
  do
  begin

    -- Buscar Saldo Anterior da Conta Corrente
    Select
        sc.SALDO_ANTERIOR_DATA
      , 0
      , 'SALDO'
      , 'SALDO ANTERIOR DA C/C ' || :Conta_corrente_desc
      , 'S'
      , sc.SALDO_ANTERIOR_VALOR
    from GET_CONTA_CORRENTE_SALDO(:Conta_corrente, :Data_inicial, :Data_final) sc
    into
        Data
      , Forma_Pagto
      , Forma_Pagto_Desc
      , Historico
      , Tipo
      , Saldo;

    Saldo = coalesce(Saldo, 0);

    Suspend;

    /* Buscar Movimento do Caixa por Conta Corrente e Periodo */
    for
      Select
          cast(m.Datahora as Date)
        , m.Forma_pagto
        , f.Descri
        , m.Historico
        , m.Tipo
        , m.tipo_receita
        , rc.tiporec  as tipo_receita_desc
        , m.tipo_despesa
        , ds.tipodesp as tipo_despesa_desc
        , Case when upper(m.Tipo) = 'C' then m.Valor else 0 end
        , Case when upper(m.Tipo) = 'D' then m.Valor else 0 end
        , m.Caixa_ano
        , m.Caixa_num
      from TBCAIXA_MOVIMENTO m
        left join TBFORMPAGTO f on (f.Cod = m.Forma_pagto)
        left join TBTPRECEITA rc on (m.tipo_receita = rc.cod)
        left join TBTPDESPESA ds on (m.tipo_despesa = ds.cod)
      where m.Situacao = 1 -- Confirmado
        and m.Conta_corrente = :Conta_corrente
        and cast(m.Datahora as Date) between :Data_inicial and :Data_final
      order by
        m.Datahora
      into
          Data
        , Forma_Pagto
        , Forma_Pagto_Desc
        , Historico
        , Tipo
        , Tipo_Receita
        , Tipo_Receita_Desc
        , Tipo_Despesa
        , Tipo_Despesa_Desc
        , Entrada
        , Saida
        , Caixa_ano
        , Caixa_num
    do
    begin

      Saldo = coalesce(:Saldo, 0) + coalesce(:Entrada, 0) - coalesce(:Saida, 0);

      Suspend;

    end 

  end 
end^

SET TERM ; ^




/*------ SYSDBA 21/01/2016 11:03:36 --------*/

ALTER TABLE TBPRODUTO
    ADD ARQUIVO_MORTO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBPRODUTO.ARQUIVO_MORTO IS
'Arquivo morto:
0 - Nao
1 - Sim

Registros definidos como "arqivo morto" nao sao apresentados no sistema mas precisa
constar na base por causar da integridade dos dados.';




/*------ SYSDBA 21/01/2016 11:05:19 --------*/

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

    21/01/2016 - IMR :
        + Criacao do campo ARQUIVO_MORTO com o objetivo de ocultar do sistema os
          registros que nao devem mas ser apresentados para o usuario mas que
          precisam constar na base por efeito de integridade referencial.

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




/*------ SYSDBA 21/01/2016 11:06:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_produto_cod for tbproduto
active before insert position 0
As
Begin
  new.arquivo_morto = coalesce(new.arquivo_morto, 0);
  If (new.codigo Is Null) Then
    new.codigo = Gen_id(GEN_PRODUTO_ID, 1);
End^

SET TERM ; ^




/*------ SYSDBA 29/01/2016 15:53:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_30'
where (RDB$FIELD_NAME = 'NUMERO_CHEQUE') and
(RDB$RELATION_NAME = 'TBCONTPAG_BAIXA')
;




/*------ SYSDBA 29/01/2016 15:54:01 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_30'
where (RDB$FIELD_NAME = 'NUMERO_CHEQUE') and
(RDB$RELATION_NAME = 'TBCONTREC_BAIXA')
;




/*------ SYSDBA 29/01/2016 15:55:49 --------*/

COMMENT ON COLUMN TBCONTREC_BAIXA.NUMERO_CHEQUE IS
'Numero do cheque

Obs.: Geralmente possui 7 digitos';




/*------ SYSDBA 29/01/2016 16:02:13 --------*/

create view vw_status_cheque (codigo, descricao)
as
Select 0 as Codigo, 'Pendente'    as descricao from RDB$DATABASE Union
Select 1 as Codigo, 'Apresentado' as descricao from RDB$DATABASE Union
Select 2 as Codigo, 'Devolvido'   as descricao from RDB$DATABASE Union
Select 8 as Codigo, 'Compensado'  as descricao from RDB$DATABASE Union
Select 9 as Codigo, 'Cancelado'   as descricao from RDB$DATABASE
;

GRANT ALL ON VW_STATUS_CHEQUE TO "PUBLIC";



/*------ SYSDBA 29/01/2016 16:04:34 --------*/

COMMENT ON COLUMN TBCONTPAG_BAIXA.NUMERO_CHEQUE IS
'Numero do cheque

Obs.: Geralmente possui 7 digitos';




/*------ SYSDBA 09/02/2016 10:54:34 --------*/

ALTER TABLE TBUSERS
    ADD TIPO_ALTERAR_VALOR_VENDA DMN_SMALLINT_NN DEFAULT 1;

COMMENT ON COLUMN TBUSERS.TIPO_ALTERAR_VALOR_VENDA IS
'Tipo de alteracao do valor de venda:
0 - Nenhum
1 - Livre
2 - Para maior
3 - Para menor';

alter table TBUSERS
alter NOME position 1;

alter table TBUSERS
alter SENHA position 2;

alter table TBUSERS
alter NOMECOMPLETO position 3;

alter table TBUSERS
alter CODFUNCAO position 4;

alter table TBUSERS
alter LIMIDESC position 5;

alter table TBUSERS
alter ATIVO position 6;

alter table TBUSERS
alter ALTERAR_SENHA position 7;

alter table TBUSERS
alter PERM_ALTERAR_VALOR_VENDA position 8;

alter table TBUSERS
alter TIPO_ALTERAR_VALOR_VENDA position 9;

alter table TBUSERS
alter VENDEDOR position 10;



/*------ 09/02/2016 10:55:15 --------*/

CREATE VIEW VW_TIPO_ALTERA_VALOR_VENDA (
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Nenhum'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Livre'      as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Para maior' as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Para menor' as Descricao from RDB$DATABASE;

/*------ 09/02/2016 10:55:15 --------*/

GRANT ALL ON VW_TIPO_ALTERA_VALOR_VENDA TO "PUBLIC";


/*------ SYSDBA 09/02/2016 10:56:13 --------*/

COMMENT ON TABLE TBUSERS IS 'Tabela de Usuarios do Sistema

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os registros de usuarios de acesso ao sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    09/02/2016 - IMR :
        + Criacao dos campos TIPO_ALTERAR_VALOR_VENDA que permitira uma maior
          restrincao no tipo de alteracao que o usuario podera fazer no valor
          unitario de venda do item.';




/*------ SYSDBA 09/02/2016 11:24:24 --------*/

ALTER TABLE TBUSERS ALTER COLUMN TIPO_ALTERAR_VALOR_VENDA
SET DEFAULT 0
;




/*------ SYSDBA 18/02/2016 08:41:20 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'TIPO_ALTERAR_VALOR_VENDA') and
(RDB$RELATION_NAME = 'TBUSERS')
;



/*------ 29/02/2016 11:44:10 --------*/

CREATE GENERATOR GEN_CONTROLE_CHEQUE;

/*------ 29/02/2016 11:44:11 --------*/

CREATE TABLE TBCHEQUE (
    CONTROLE DMN_BIGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ,
    TIPO DMN_SMALLINT_NN,
    BANCO DMN_VCHAR_10_KEY,
    AGENCIA DMN_VCHAR_20_NN,
    CONTA DMN_VCHAR_20_NN,
    NUMERO DMN_VCHAR_30_NN,
    FORNECEDOR DMN_INTEGER_N,
    CLIENTE DMN_INTEGER_N,
    DATA_EMISSAO DMN_DATE,
    DATA_APRESENTACAO DMN_DATE,
    DATA_COMPENSACAO DMN_DATE,
    VALOR DMN_MONEY,
    NOMINAL_A DMN_VCHAR_50,
    DATA_CADASTRO DMN_DATE_NN,
    USUARIO_CADASTRO DMN_USUARIO,
    STATUS DMN_STATUS);

/*------ 29/02/2016 11:44:11 --------*/

CREATE INDEX IDX_TBCHEQUE_STATUS
ON TBCHEQUE (STATUS);

/*------ 29/02/2016 11:44:11 --------*/

ALTER TABLE TBCHEQUE ADD CONSTRAINT PK_TBCHEQUE PRIMARY KEY (CONTROLE);

/*------ 29/02/2016 11:44:11 --------*/

ALTER TABLE TBCHEQUE ADD CONSTRAINT FK_TBCHEQUE_BANCO FOREIGN KEY (BANCO) REFERENCES TBBANCO (COD);

/*------ 29/02/2016 11:44:11 --------*/

ALTER TABLE TBCHEQUE ADD CONSTRAINT FK_TBCHEQUE_EMPRESA FOREIGN KEY (EMPRESA) REFERENCES TBEMPRESA (CNPJ);

/*------ 29/02/2016 11:44:11 --------*/

ALTER TABLE TBCHEQUE ADD CONSTRAINT FK_TBCHEQUE_CLIENTE FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO);

/*------ 29/02/2016 11:44:11 --------*/

ALTER TABLE TBCHEQUE ADD CONSTRAINT FK_TBCHEQUE_FORNECEDOR FOREIGN KEY (FORNECEDOR) REFERENCES TBFORNECEDOR (CODFORN);

/*------ 29/02/2016 11:44:11 --------*/

ALTER TABLE TBCHEQUE ADD CONSTRAINT UNQ_TBCHEQUE_NUMERO UNIQUE (BANCO, AGENCIA, CONTA, NUMERO);

/*------ 29/02/2016 11:44:11 --------*/

SET TERM ^ ;

CREATE TRIGGER TG_CHEQUE_CONTROLE FOR TBCHEQUE
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.controle is null) then
    new.controle = gen_id(GEN_CONTROLE_CHEQUE, 1);
end^

/*------ 29/02/2016 11:44:11 --------*/

SET TERM ; ^


/*------ SYSDBA 29/02/2016 11:46:15 --------*/

COMMENT ON TABLE TBCHEQUE IS 'Tabela de Cheques.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/02/2016

Tabela responsavel por armazenar os registros de cheques recebidos e emitidos
para controle.';




/*------ SYSDBA 29/02/2016 15:45:21 --------*/

ALTER TABLE TBCHEQUE
    ADD OBS DMN_TEXTO;

COMMENT ON COLUMN TBCHEQUE.OBS IS
'Observacoes';

