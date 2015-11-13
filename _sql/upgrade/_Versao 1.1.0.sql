


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