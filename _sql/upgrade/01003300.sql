/*------ SYSDBA 07/07/2023 23:06:06 --------*/

CREATE TABLE TBCONTRATO (
    CONTROLE DMN_LONGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ_NN,
    NUMERO DMN_VCHAR_10,
    DATA_EMISSAO DMN_DATE,
    DATA_VALIDADE DMN_DATE,
    DESTINO DMN_SMALLINT_NN DEFAULT 0,
    CLLIENTE DMN_INTEGER_N,
    FORNECEDOR DMN_INTEGER_N,
    SITUACAO DMN_STATUS DEFAULT 0,
    OBSERVACOES DMN_TEXTO,
    ITENS DMN_INTEGER_N,
    QUANTIDADES DMN_NUMERO,
    VALOR_TOTAL DMN_MONEY,
    USUARIO DMN_VCHAR_50,
    DATA_CADASTRO DMN_DATE);

ALTER TABLE TBCONTRATO
ADD CONSTRAINT PK_TBCONTRATO
PRIMARY KEY (CONTROLE);

COMMENT ON COLUMN TBCONTRATO.CONTROLE IS
'Controle';

COMMENT ON COLUMN TBCONTRATO.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBCONTRATO.NUMERO IS
'Numero do Contrato';

COMMENT ON COLUMN TBCONTRATO.DATA_EMISSAO IS
'Data de Emissao';

COMMENT ON COLUMN TBCONTRATO.DATA_VALIDADE IS
'Data de Validade';

COMMENT ON COLUMN TBCONTRATO.DESTINO IS
'Destino do Contrato:
0 - Contratos com Clientes
1 - Contratos com Fornecedores';

COMMENT ON COLUMN TBCONTRATO.CLLIENTE IS
'Cliente';

COMMENT ON COLUMN TBCONTRATO.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBCONTRATO.SITUACAO IS
'Situacao:
0 - Editando
1 - Disponivel
2 - Finalizado
3 - 
4 - 
5 - 
6 - 
7 - 
8 - 
9 - Cancelado';

COMMENT ON COLUMN TBCONTRATO.OBSERVACOES IS
'Observacoes Gerais';

COMMENT ON COLUMN TBCONTRATO.ITENS IS
'Numero de Itens do Contrato';

COMMENT ON COLUMN TBCONTRATO.QUANTIDADES IS
'Quantidade total dos itens do Contrato';

COMMENT ON COLUMN TBCONTRATO.VALOR_TOTAL IS
'Valor Total do Contrato';

COMMENT ON COLUMN TBCONTRATO.USUARIO IS
'Usuario de insercao/atualizacao';

COMMENT ON COLUMN TBCONTRATO.DATA_CADASTRO IS
'Data de Cadastro';


/*------ SYSDBA 07/07/2023 23:06:08 --------*/

COMMENT ON TABLE TBCONTRATO IS 'Tabela de Contatos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/07/2023

Tabela responsavel por armazenar os contratos da empresa com seus clientes e
fornecedores.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/07/2023 - IMR :
        + Criacao e documentacao da tabela.';


/*------ SYSDBA 07/07/2023 23:11:07 --------*/

SET TERM ^ ;

CREATE trigger tg_contrato_novo for tbcontrato
active before insert position 0
AS
begin
  if (coalesce(new.controle, 0) = 0) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CONTRATO', '') g
    Into
      new.controle;
  end

  if (new.data_cadastro is null) then
    new.data_cadastro = current_date;

  if (coalesce(trim(new.usuario), '') = '') then
    new.usuario = user;
end
^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTRATO_NOVO IS 'Trigger Novo Contrato.

    Autor   :   Isaque M. Ribeiro
    Data    :   07/07/2023

Trigger responsavel por gerar um sequencial unico para cada novo registro de
contrato.';

GRANT ALL ON TBCONTRATO TO "PUBLIC";


/*------ SYSDBA 07/07/2023 23:12:48 --------*/

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_CLIENTE
FOREIGN KEY (CLLIENTE)
REFERENCES TBCLIENTE(CODIGO);

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_FORNEC
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);


/*------ SYSDBA 07/07/2023 23:15:14 --------*/

CREATE DESCENDING INDEX IDX_TBCONTRATO_EMISSAOD
ON TBCONTRATO (DATA_EMISSAO);

CREATE INDEX IDX_TBCONTRATO_EMISSAOA
ON TBCONTRATO (DATA_EMISSAO);


/*------ SYSDBA 07/07/2023 23:15:42 --------*/

CREATE INDEX IDX_TBCONTRATO_SITUACAO
ON TBCONTRATO (SITUACAO);


/*------ SYSDBA 07/07/2023 23:17:15 --------*/

CREATE DESCENDING INDEX IDX_TBCONTRATO_VALIDADED
ON TBCONTRATO (DATA_VALIDADE);

CREATE INDEX IDX_TBCONTRATO_VALIDADEA
ON TBCONTRATO (DATA_VALIDADE);

CREATE INDEX IDX_TBCONTRATO_DESTINO
ON TBCONTRATO (DESTINO);


/*------ SYSDBA 02/08/2023 11:11:20 --------*/

CREATE TABLE TBCONTRATO_ITEM (
    CONTRATO DMN_BIGINT_NN NOT NULL,
    ITEM DMN_INTEGER_NN NOT NULL,
    PRODUTO DMN_VCHAR_10_KEY,
    QUANTIDADE DMN_QUANTIDADE_D3,
    VALOR DMN_MONEY_3,
    TOTAL COMPUTED BY (Cast((coalesce(quantidade, 0.0) * coalesce(valor, 0.0)) as DMN_MONEY_3)),
    CONSUMO_QTDE DMN_QUANTIDADE_D3 DEFAULT 0.0,
    CONSUMO_TOTAL DMN_MONEY_3 DEFAULT 0.0,
    SALDO_QTDE COMPUTED BY (cast((coalesce(quantidade, 0.0) - coalesce(consumo_qtde, 0.0)) as DMN_QUANTIDADE_D3)),
    SALDO_TOTAL COMPUTED BY (cast((coalesce(total, 0.0) - coalesce(consumo_total, 0.0)) as DMN_MONEY_3)));

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT PK_TBCONTRATO_ITEM
PRIMARY KEY (CONTRATO,ITEM);

COMMENT ON COLUMN TBCONTRATO_ITEM.CONTRATO IS
'Codigo do Contrato';

COMMENT ON COLUMN TBCONTRATO_ITEM.ITEM IS
'Sequencial do item de contrato';

COMMENT ON COLUMN TBCONTRATO_ITEM.PRODUTO IS
'Codigo do produto/servico';

COMMENT ON COLUMN TBCONTRATO_ITEM.QUANTIDADE IS
'Quantidade';

COMMENT ON COLUMN TBCONTRATO_ITEM.VALOR IS
'Valor Unitario';

COMMENT ON COLUMN TBCONTRATO_ITEM.TOTAL IS
'Valor Total = (Quantidade * Valor Unitario)';

COMMENT ON COLUMN TBCONTRATO_ITEM.CONSUMO_QTDE IS
'Quantidade

(Aceita valores decimais)';

COMMENT ON COLUMN TBCONTRATO_ITEM.CONSUMO_TOTAL IS
'Valor (3 Casas Decimais)';

COMMENT ON COLUMN TBCONTRATO_ITEM.SALDO_QTDE IS
'Quantidade

(Aceita valores decimais)';

COMMENT ON COLUMN TBCONTRATO_ITEM.SALDO_TOTAL IS
'Valor (3 Casas Decimais)';


/*------ SYSDBA 02/08/2023 11:11:22 --------*/

COMMENT ON TABLE TBCONTRATO_ITEM IS 'Tabela de Produtos/Servicos do Contatos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   02/08/2023

Tabela responsavel por armazenar os produtos/servicos contratos da empresa com
seus clientes e fornecedores.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    02/08/2023 - IMR :
        + Criacao e documentacao da tabela.';




/*------ SYSDBA 02/08/2023 11:11:41 --------*/

COMMENT ON COLUMN TBCONTRATO_ITEM.CONSUMO_QTDE IS
'Quantidade Consumida';




/*------ SYSDBA 02/08/2023 11:11:52 --------*/

COMMENT ON COLUMN TBCONTRATO_ITEM.CONSUMO_TOTAL IS
'Valor Total Consumido';




/*------ SYSDBA 02/08/2023 11:12:00 --------*/

COMMENT ON COLUMN TBCONTRATO_ITEM.SALDO_QTDE IS
'Saldo da Quantidade';




/*------ SYSDBA 02/08/2023 11:12:14 --------*/

COMMENT ON COLUMN TBCONTRATO_ITEM.SALDO_TOTAL IS
'Valor Total de Saldo';




/*------ SYSDBA 02/08/2023 11:14:40 --------*/

ALTER TABLE TBCONTRATO_ITEM
    ADD UNIDADE DMN_SMALLINT_NN;

COMMENT ON COLUMN TBCONTRATO_ITEM.UNIDADE IS
'Unidade de medida';

alter table TBCONTRATO_ITEM
alter CONTRATO position 1;

alter table TBCONTRATO_ITEM
alter ITEM position 2;

alter table TBCONTRATO_ITEM
alter PRODUTO position 3;

alter table TBCONTRATO_ITEM
alter QUANTIDADE position 4;

alter table TBCONTRATO_ITEM
alter UNIDADE position 5;

alter table TBCONTRATO_ITEM
alter VALOR position 6;

alter table TBCONTRATO_ITEM
alter TOTAL position 7;

alter table TBCONTRATO_ITEM
alter CONSUMO_QTDE position 8;

alter table TBCONTRATO_ITEM
alter CONSUMO_TOTAL position 9;

alter table TBCONTRATO_ITEM
alter SALDO_QTDE position 10;

alter table TBCONTRATO_ITEM
alter SALDO_TOTAL position 11;




/*------ SYSDBA 02/08/2023 11:15:31 --------*/

ALTER TABLE TBCONTRATO_ITEM DROP CONSTRAINT PK_TBCONTRATO_ITEM;




/*------ SYSDBA 02/08/2023 11:16:13 --------*/

ALTER TABLE TBCONTRATO_ITEM ALTER COLUMN CONTRATO TYPE DMN_LONGINT_NN;




/*------ SYSDBA 02/08/2023 11:16:23 --------*/

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT PK_TBCONTRATO_ITEM
PRIMARY KEY (CONTRATO,ITEM);




/*------ SYSDBA 02/08/2023 11:17:09 --------*/

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT FK_TBCONTRATO_ITEM_CNT
FOREIGN KEY (CONTRATO)
REFERENCES TBCONTRATO(CONTROLE)
ON DELETE CASCADE;

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT FK_TBCONTRATO_ITEM_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD);

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT FK_TBCONTRATO_ITEM_UND
FOREIGN KEY (UNIDADE)
REFERENCES TBUNIDADEPROD(UNP_COD);




/*------ SYSDBA 02/08/2023 11:18:53 --------*/

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT CHK_TBCONTRATO_ITEM_QTDE
CHECK (coalesce(quantidade, 0.0) >= 0);

ALTER TABLE TBCONTRATO_ITEM
ADD CONSTRAINT CHK_TBCONTRATO_ITEM_VALOR
CHECK (coalesce(valor, 0.0) >= 0);




/*------ SYSDBA 02/08/2023 11:20:09 --------*/

ALTER TABLE TBCONTRATO DROP CONSTRAINT FK_TBCONTRATO_CLIENTE;




/*------ SYSDBA 02/08/2023 11:20:18 --------*/

ALTER TABLE TBCONTRATO ALTER CLLIENTE TO CLIENTE;




/*------ SYSDBA 02/08/2023 11:20:40 --------*/

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_CLIENTE
FOREIGN KEY (CLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 02/08/2023 11:21:50 --------*/

ALTER TABLE TBCONTRATO
    ADD DATA_ATUALIZACAO DMN_DATE;

COMMENT ON COLUMN TBCONTRATO.DATA_ATUALIZACAO IS
'Ultima data de atualizacao';




/*------ SYSDBA 02/08/2023 11:25:31 --------*/

SET TERM ^ ;

CREATE trigger tg_contrato_item_novo for tbcontrato_item
active before insert position 0
AS
  declare variable sequencial type of DMN_SMALLINT_N;
begin
  if (coalesce(new.item, 0) = 0) then
  begin
    Select
      max(itm.item)
    from TBCONTRATO_ITEM itm
    where (itm.contrato = new.contrato)
    Into
      sequencial;

    new.item = (coalesce(:sequencial, 0) + 1);
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTRATO_ITEM_NOVO IS 'Trigger Novo Item de Contrato.

    Autor   :   Isaque M. Ribeiro
    Data    :   02/08/2023

Trigger responsavel por gerar um sequencial unico para cada novo registro de
item do contrato.';




/*------ SYSDBA 02/08/2023 11:31:30 --------*/

CREATE INDEX IDX_TBCONTRATO_NUMERO
ON TBCONTRATO (NUMERO);




/*------ SYSDBA 02/08/2023 11:46:26 --------*/

SET TERM ^ ;

CREATE trigger tg_contrato_item_calcular for tbcontrato_item
active after insert or update or delete position 1
AS
  declare variable contrato type of DMN_LONGINT;
  declare variable itens type of DMN_SMALLINT_N;
  declare variable quantidade type of DMN_NUMERO;
  declare variable valor type of DMN_MONEY;
begin
  if (inserting) then
    contrato = new.contrato;
  else
  if (updating or deleting) then
    contrato = old.contrato;

  Select
      count(itm.item) as itens
    , cast(sum(itm.quantidade) as DMN_NUMERO) as quantidade
    , cast(sum(itm.valor) as DMN_MONEY) as valor
  from TBCONTRATO_ITEM itm
  where (itm.contrato = :contrato)
  Into
      itens
    , quantidade
    , valor;

  Update TBCONTRATO cnt Set
      cnt.itens = coalesce(:itens, 0)
    , cnt.quantidades = coalesce(:quantidade, 0.0)
    , cnt.valor_total = coalesce(:valor, 0.0)
  where (cnt.controle = :contrato);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTRATO_ITEM_CALCULAR IS 'Trigger Calcula Valor do Contrato (Itens do Contrato).

    Autor   :   Isaque M. Ribeiro
    Data    :   02/08/2023

Trigger responsavel por calcular e atualizar os valores de contrato a partir
de seus produtos/servicos.';




/*------ SYSDBA 02/08/2023 11:46:55 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contrato_item_calcular for tbcontrato_item
active after insert or update or delete position 1
AS
  declare variable contrato type of DMN_LONGINT;
  declare variable itens type of DMN_SMALLINT_N;
  declare variable quantidade type of DMN_NUMERO;
  declare variable valor type of DMN_MONEY;
begin
  if (inserting) then
    contrato = new.contrato;
  else
  if (updating or deleting) then
    contrato = old.contrato;

  Select
      count(itm.item) as itens
    , cast(sum(itm.quantidade) as DMN_NUMERO) as quantidade
    , cast(sum(itm.total) as DMN_MONEY) as valor
  from TBCONTRATO_ITEM itm
  where (itm.contrato = :contrato)
  Into
      itens
    , quantidade
    , valor;

  Update TBCONTRATO cnt Set
      cnt.itens = coalesce(:itens, 0)
    , cnt.quantidades = coalesce(:quantidade, 0.0)
    , cnt.valor_total = coalesce(:valor, 0.0)
  where (cnt.controle = :contrato);
end^

SET TERM ; ^




/*------ SYSDBA 02/08/2023 17:40:50 --------*/

COMMENT ON COLUMN TBCONTRATO.SITUACAO IS
'Situacao:
0 - Editando
1 - Disponivel
2 - Finalizado/Encerrado
3 - 
4 - 
5 - 
6 - 
7 - 
8 - 
9 - Cancelado';




/*------ SYSDBA 03/08/2023 10:25:27 --------*/

CREATE OR ALTER VIEW VW_TIPO_CONTRATO (
    TPC_CODIGO,
    TPC_DESCRICAO,
    TPC_RESUMO)
AS
Select 0 as TPC_CODIGO, 'Contratos com Clientes' as TPC_DESCRICAO, 'com Clientes' as TPC_RESUMO from RDB$DATABASE union
Select 1, 'Contratos com Fornecedores', 'com Fornecedores' from RDB$DATABASE
;

GRANT ALL ON TBCONTRATO_ITEM TO "PUBLIC";
GRANT ALL ON VW_TIPO_CONTRATO TO "PUBLIC";


-- Combustiveis
Update or Insert Into RENAVAM_COBUSTIVEL (codigo, descricao) values ('01', 'Álcool') matching (codigo);
Update or Insert Into RENAVAM_COBUSTIVEL (codigo, descricao) values ('02', 'Gasolina') matching (codigo);
Update or Insert Into RENAVAM_COBUSTIVEL (codigo, descricao) values ('03', 'Diesel') matching (codigo);
Update or Insert Into RENAVAM_COBUSTIVEL (codigo, descricao) values ('16', 'Álcool/Gasolina') matching (codigo);
Update or Insert Into RENAVAM_COBUSTIVEL (codigo, descricao) values ('17', 'Gasolina/Álcool/GNV') matching (codigo);
Update or Insert Into RENAVAM_COBUSTIVEL (codigo, descricao) values ('18', 'Gasolina/Elétrico') matching (codigo);


-- Tipos de Veículos
Update or Insert Into RENAVAM_TIPOVEICULO values ('02', 'Ciclomotor') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('03', 'Motoneta') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('04', 'Motocicleta') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('05', 'Triciclo') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('06', 'Automóvel') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('07', 'Micro-ônibus') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('08', 'Ônibus') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('10', 'Reboque') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('11', 'Semirreboque') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('13', 'Camioneta') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('14', 'Caminhão') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('15', 'Carroça') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('17', 'Caminhão Trator') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('18', 'Trator de Rodas') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('19', 'Trator de Esteiras') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('20', 'Trator Misto') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('21', 'Quadriciclo') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('22', 'Chassi/Plataforma') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('23', 'Caminhonete') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('24', 'Carga/Caminhonete') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('25', 'Utilitário') matching (codigo);
Update or Insert Into RENAVAM_TIPOVEICULO values ('26', 'Motor-Casa') matching (codigo);






/*------ SYSDBA 18/08/2023 19:08:38 --------*/

ALTER TABLE TBREQUISICAO_ALMOX
    ADD VEICULO DMN_VCHAR_150,
    ADD MOTORISTA DMN_VCHAR_150;

COMMENT ON COLUMN TBREQUISICAO_ALMOX.VEICULO IS
'Ordem de Entrega - Descricao do veiculo';

COMMENT ON COLUMN TBREQUISICAO_ALMOX.MOTORISTA IS
'Ordem de Entrega - Nome do motorista';




/*------ SYSDBA 18/08/2023 19:09:38 --------*/

COMMENT ON TABLE TBREQUISICAO_ALMOX IS 'Tabela Requisicao Produtos (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   05/01/2015

Tabela responsavel por armazenar todos os registros de requisicoes de materiais/equipamentos ao estoque lancadas pelo
Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    18/08/2023 - IMR :
        + Insercao dos campos VEICULO e MOTORISTA a fim de compor a impressao das
          ordens de entrega.

    05/01/2014 - IMR :
        * Concepcao do modelo.

    20/01/2014 - IMR :
        * Documentacao da tabela.';

