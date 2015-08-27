

/*------ 13/01/2015 10:08:53 --------*/

CREATE TABLE TBAPROPRIACAO_ALMOX(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN NOT NULL,
  NUMERO DMN_VCHAR_20_NN,
  EMPRESA DMN_CNPJ_NN,
  CENTRO_CUSTO DMN_INTEGER_NN,
  COMPRA_ANO DMN_SMALLINT_N,
  COMPRA_NUM DMN_BIGINT_N,
  COMPRA_EMP DMN_CNPJ,
  INSERCAO_DATA DMN_DATETIME,
  DATA_APROPRIACAO DMN_DATE,
  COMPETENCIA DMN_INTEGER_N,
  USUARIO DMN_USUARIO,
  STATUS DMN_STATUS,
  MOTIVO DMN_TEXTO,
  OBS DMN_TEXTO,
  VALOR_TOTAL DMN_MONEY,
  CANCEL_USUARIO DMN_USUARIO,
  CANCEL_DATAHORA DMN_DATETIME,
  CANCEL_MOTIVO DMN_TEXTO);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT PK_TBAPROPRIACAO_ALMOX PRIMARY KEY (ANO, CONTROLE);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_USR FOREIGN KEY (USUARIO) REFERENCES
TBUSERS (NOME);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_CNT FOREIGN KEY (CENTRO_CUSTO) REFERENCES
TBCENTRO_CUSTO (CODIGO);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_EMP FOREIGN KEY (EMPRESA) REFERENCES
TBEMPRESA (CNPJ);

/*------ 13/01/2015 10:08:53 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_CMP FOREIGN KEY (COMPRA_ANO, COMPRA_NUM, COMPRA_EMP) REFERENCES
TBCOMPRAS (ANO, CODCONTROL, CODEMP);

/*------ 13/01/2015 10:09:36 --------*/

CREATE TABLE TBAPROPRIACAO_ALMOX_ITEM(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN NOT NULL,
  ITEM DMN_SMALLINT_NN NOT NULL,
  PRODUTO DMN_VCHAR_10_KEY,
  QTDE DMN_MONEY_NN DEFAULT 0.0,
  UNIDADE DMN_SMALLINT_N NOT NULL,
  CUSTO_UNITARIO DMN_MONEY_3,
  CUSTO_TOTAL DMN_MONEY);

/*------ 13/01/2015 10:09:36 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ADD CONSTRAINT PK_TBAPROPRIACAO_ALMOX_ITEM PRIMARY KEY (ANO, CONTROLE, ITEM);

/*------ 13/01/2015 10:09:36 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_MOV FOREIGN KEY (ANO, CONTROLE) REFERENCES
TBAPROPRIACAO_ALMOX (ANO, CONTROLE) ON UPDATE CASCADE ON DELETE CASCADE;

/*------ 13/01/2015 10:09:36 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_ITM_UND FOREIGN KEY (UNIDADE) REFERENCES
TBUNIDADEPROD (UNP_COD);GRANT ALL ON TBAPROPRIACAO_ALMOX TO "PUBLIC";
GRANT ALL ON TBAPROPRIACAO_ALMOX_ITEM TO "PUBLIC";



/*------ SYSDBA 13/01/2015 10:11:47 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX IS 'Tabela de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   02/01/2015

Tabela responsavel por armazenar todos os registros de apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    03/01/2014 - IMR :
        * Documentacao da tabela.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.';




/*------ SYSDBA 13/01/2015 10:11:55 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX_ITEM IS 'Tabela de Itens de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   05/01/2015

Tabela responsavel por armazenar todos os registros de itens da apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    05/01/2014 - IMR :
        * Documentacao da tabela.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.';




/*------ SYSDBA 13/01/2015 10:13:38 --------*/

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2015;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2016;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2017;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2018;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2019;

CREATE SEQUENCE GEN_APROPRIACAO_ALMOX_2020;




/*------ SYSDBA 13/01/2015 10:17:07 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_codigo for tbapropriacao_almox
active before insert position 0
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

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_CODIGO IS 'Trigger Nova Apropriacao de Estoque.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de apropriacao de estoque no ano.';




/*------ SYSDBA 13/01/2015 10:19:56 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_compet for tbapropriacao_almox
active before insert or update position 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.data_apropriacao), 4) || right('00' || extract(month from new.data_apropriacao), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_COMPET IS 'Trigger Competencia Apropriacao Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2015

Trigger responsavel por identificar a competencia da apropriacao quando esta nao for informada, baseando-se na data de
apropriacao.';




/*------ SYSDBA 13/01/2015 10:20:23 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_codigo for tbapropriacao_almox
active before insert position 0
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

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_CODIGO IS 'Trigger Nova Apropriacao de Estoque (Almoxarifado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   13/01/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de apropriacao de estoque no ano.';




/*------ SYSDBA 13/01/2015 10:22:08 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_COMP
ON TBAPROPRIACAO_ALMOX (COMPETENCIA);




/*------ SYSDBA 13/01/2015 10:22:25 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_DATA
ON TBAPROPRIACAO_ALMOX (DATA_APROPRIACAO);




/*------ SYSDBA 13/01/2015 10:22:46 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_STATUS
ON TBAPROPRIACAO_ALMOX (STATUS);




/*------ SYSDBA 13/01/2015 17:11:38 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX
    ADD TIPO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX.TIPO IS
'Tipo:
0 - Apropriacao Geral
1 - Apropriacao por Entrada';

alter table TBAPROPRIACAO_ALMOX
alter ANO position 1;

alter table TBAPROPRIACAO_ALMOX
alter CONTROLE position 2;

alter table TBAPROPRIACAO_ALMOX
alter NUMERO position 3;

alter table TBAPROPRIACAO_ALMOX
alter EMPRESA position 4;

alter table TBAPROPRIACAO_ALMOX
alter CENTRO_CUSTO position 5;

alter table TBAPROPRIACAO_ALMOX
alter TIPO position 6;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_ANO position 7;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_NUM position 8;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_EMP position 9;

alter table TBAPROPRIACAO_ALMOX
alter INSERCAO_DATA position 10;

alter table TBAPROPRIACAO_ALMOX
alter DATA_APROPRIACAO position 11;

alter table TBAPROPRIACAO_ALMOX
alter COMPETENCIA position 12;

alter table TBAPROPRIACAO_ALMOX
alter USUARIO position 13;

alter table TBAPROPRIACAO_ALMOX
alter STATUS position 14;

alter table TBAPROPRIACAO_ALMOX
alter MOTIVO position 15;

alter table TBAPROPRIACAO_ALMOX
alter OBS position 16;

alter table TBAPROPRIACAO_ALMOX
alter VALOR_TOTAL position 17;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_USUARIO position 18;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_DATAHORA position 19;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_MOTIVO position 20;




/*------ SYSDBA 13/01/2015 17:12:56 --------*/

CREATE VIEW VW_TIPO_APROPRIACAO (
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Apropriação Geral'       as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Apropriação Por Entrada' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_APROPRIACAO TO "PUBLIC";



/*------ SYSDBA 13/01/2015 17:54:26 --------*/

CREATE INDEX IDX_TBAPROPRIACAO_ALMOX_NUMERO
ON TBAPROPRIACAO_ALMOX (NUMERO);




/*------ SYSDBA 14/01/2015 20:25:54 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable reserva    DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

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
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

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




/*------ SYSDBA 14/01/2015 20:36:33 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      /*
      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
        from
      )) then
      begin

      end
      else
      begin

      end
      */
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 14/01/2015 20:38:46 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      /*
      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
        from
      )) then
      begin

      end
      else
      begin

      end
      */
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_ESTOQUE IS 'Trigger Apropriar Estoque (Encerramento).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/01/2015

Trigger responsavel por executar o processo de baixa do estoque geral e apropriacao do estoque baixado no Centro de
Custo informado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    15/01/2014 - IMR :
        * Atualizacao do trigger (Otimizacao).';



/*------ 14/01/2015 20:42:33 --------*/

CREATE TABLE TBESTOQUE_ALMOX(
  EMPRESA DMN_CNPJ_NN NOT NULL,
  CENTRO_CUSTO DMN_INTEGER_NN NOT NULL,
  PRODUTO DMN_VCHAR_10_KEY NOT NULL,
  LOTE DMN_BIGINT_NN DEFAULT 0 NOT NULL,
  DATA_FABRICACAO DMN_DATE,
  DATA_VALIDADE DMN_DATE,
  QTDE DMN_QUANTIDADE_D3_N DEFAULT 0,
  FRACIONADOR DMN_INTEGER_NN DEFAULT 1,
  CUSTO_MEDIO DMN_MONEY);

/*------ 14/01/2015 20:42:36 --------*/

ALTER TABLE TBESTOQUE_ALMOX ADD CONSTRAINT PK_TBESTOQUE_ALMOX PRIMARY KEY (EMPRESA, CENTRO_CUSTO, PRODUTO, LOTE);

/*------ 14/01/2015 20:42:36 --------*/

ALTER TABLE TBESTOQUE_ALMOX ADD CONSTRAINT FK_TBESTOQUE_ALMOX_CNT FOREIGN KEY (CENTRO_CUSTO) REFERENCES
TBCENTRO_CUSTO (CODIGO);GRANT ALL ON TBESTOQUE_ALMOX TO "PUBLIC";



/*------ SYSDBA 14/01/2015 20:53:14 --------*/

COMMENT ON COLUMN TBESTOQUE_ALMOX.CUSTO_MEDIO IS
'Custo Medio apropriado de acordo com o Fracionador.';




/*------ SYSDBA 14/01/2015 20:58:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa varchar(18);
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = new.centro_custo
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
          , custo_medio
        ) values (
            :empresa
          , new.centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade * :fracionador
          , :fracionador
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_produto
        where ea.empresa      = :empresa
          and ea.centro_custo = new.centro_custo
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 15/01/2015 09:00:20 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa varchar(18);
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = new.centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = new.centro_custo
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
          , custo_medio
        ) values (
            :empresa
          , new.centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade * :fracionador
          , :fracionador
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then :custo_produto
            else ( ((:custo_cc * :estoque_cc) + (:custo_produto * :quantidade)) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_medio
        where ea.empresa      = :empresa
          and ea.centro_custo = new.centro_custo
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 15/01/2015 09:00:46 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa varchar(18);
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = new.centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = new.centro_custo
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
          , custo_medio
        ) values (
            :empresa
          , new.centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade * :fracionador
          , :fracionador
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then :custo_produto
            else ( ((:custo_cc * :estoque_cc) + (:custo_produto * :quantidade)) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_medio
        where ea.empresa      = :empresa
          and ea.centro_custo = new.centro_custo
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 15/01/2015 09:02:50 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

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
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade * :fracionador
          , :fracionador
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then :custo_produto
            else ( ((:custo_cc * :estoque_cc) + (:custo_produto * :quantidade)) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_medio
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 15/01/2015 09:03:36 --------*/

COMMENT ON COLUMN TBPRODHIST.QTDENOVA IS
'Quantidade movimentada.';




/*------ SYSDBA 15/01/2015 09:03:48 --------*/

COMMENT ON COLUMN TBPRODHIST.QTDEATUAL IS
'Quantidade antes da movimentacao.';




/*------ SYSDBA 15/01/2015 09:03:57 --------*/

COMMENT ON COLUMN TBPRODHIST.QTDEFINAL IS
'Quantidade depois da movimentacao.';




/*------ SYSDBA 15/01/2015 09:04:56 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

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
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade * :fracionador
          , :fracionador
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then :custo_produto
            else ( ((:custo_cc * :estoque_cc) + (:custo_produto * :quantidade)) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_medio
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 15/01/2015 14:57:53 --------*/

ALTER TABLE TBESTOQUE_ALMOX
ADD CONSTRAINT CHK_TBESTOQUE_ALMOX_FRACIONADOR
CHECK (FRACIONADOR > 0);




/*------ SYSDBA 15/01/2015 15:00:39 --------*/

SET TERM ^ ;

CREATE trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 3) ) then /* Cancelada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa      = new.empresa;
    centro_custo = new.centro_custo;

    -- Retornar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;
      lote    = 0;

      -- Retornar estoque geral
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where ( p.Cod    = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Retirar apropriacao das quantidades em estoque da Empresa/Centro de Custo
      Select
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1)
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , fracionador;

      estoque_cc = coalesce(:estoque_cc, 0.0) - :quantidade;

      Update TBESTOQUE_ALMOX ea Set
          ea.qtde  = :estoque_cc / :fracionador
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




/*------ SYSDBA 15/01/2015 15:02:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 3) ) then /* Cancelada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa      = new.empresa;
    centro_custo = new.centro_custo;

    -- Retornar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;
      lote    = 0;

      -- Retornar estoque geral
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where ( p.Cod    = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Retirar apropriacao das quantidades em estoque da Empresa/Centro de Custo
      Select
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1) -- Quantidade fracionada transformada em inteira
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , fracionador;

      estoque_cc = coalesce(:estoque_cc, 0.0) - :quantidade;

      Update TBESTOQUE_ALMOX ea Set
          ea.qtde  = :estoque_cc / :fracionador -- Quantidade fracionada
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




/*------ SYSDBA 15/01/2015 15:04:06 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 3) ) then /* Cancelada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa      = new.empresa;
    centro_custo = new.centro_custo;

    -- Retornar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;
      lote    = 0;

      -- Retornar estoque geral
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where ( p.Cod    = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Retirar apropriacao das quantidades em estoque da Empresa/Centro de Custo
      Select
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1) -- Quantidade fracionada transformada em inteira
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , fracionador;

      estoque_cc = coalesce(:estoque_cc, 0.0) - :quantidade;

      Update TBESTOQUE_ALMOX ea Set
          ea.qtde  = :estoque_cc / :fracionador -- Quantidade fracionada
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

COMMENT ON TRIGGER TG_APROPRIACAO_ALMOX_CANCELAR IS 'Trigger Remover Apropriacao de Estoque (Cancelamento).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/01/2015

Trigger responsavel por executar o processo de remocao do estoque apropriado e devolucao para o estoque de acordo com
a Empresa e o Centro de Custo informados.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    15/01/2014 - IMR :
        * Atualizacao do trigger (Otimizacao).';




/*------ SYSDBA 16/01/2015 07:58:20 --------*/

DROP VIEW VW_PRODUTO_DEMANDA_ANUAL;

CREATE VIEW VW_PRODUTO_DEMANDA_ANUAL(
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

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_PRODUTO_DEMANDA_ANUAL TO "PUBLIC";




/*------ SYSDBA 16/01/2015 07:59:07 --------*/

CREATE VIEW VW_PRODUTO_DEMANDA_ANUAL_IND(
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




/*------ SYSDBA 16/01/2015 07:59:20 --------*/

DROP VIEW VW_PRODUTO_DEMANDA_ANUAL_IND;

CREATE VIEW VW_PRODUTO_DEMANDA_ANUAL_IND(
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

GRANT ALL ON VW_PRODUTO_DEMANDA_ANUAL_IND TO "PUBLIC";



/*------ SYSDBA 16/01/2015 17:46:03 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.ESTOQUE_UNICO_EMPRESAS IS
'Trabalhar com estoque unificado de produtos entre as demais empresa:
0 - Nao
1 - Sim';




/*------ SYSDBA 16/01/2015 21:02:14 --------*/

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
declare variable tipo_despesa smallint;
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

end^

SET TERM ; ^




/*------ SYSDBA 16/01/2015 21:03:44 --------*/

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




/*------ SYSDBA 20/01/2015 10:00:42 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_QUANTIDADE_D3'
where (RDB$FIELD_NAME = 'QTDE') and
(RDB$RELATION_NAME = 'TBAPROPRIACAO_ALMOX_ITEM')
;




/*------ SYSDBA 20/01/2015 10:32:42 --------*/

ALTER TABLE TBESTOQUE_ALMOX
    ADD ID DMN_VCHAR_30_NN;

COMMENT ON COLUMN TBESTOQUE_ALMOX.ID IS
'Identificador Unico (Guid)';


/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
GEN_UUID.
At line 1, column 18.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
GEN_UUID.
At line 1, column 18.

*/

/*!!! Error occured !!!
Invalid data type, length, or value.
function GEN_UUID could not be matched.

*/

/*!!! Error occured !!!
Invalid data type, length, or value.
function GEN_UUID could not be matched.

*/



/*------ SYSDBA 20/01/2015 10:40:09 --------*/

SET TERM ^ ;

create or alter procedure GET_GUID_UUID_HEX
returns (
    REAL_UUID char(16) character set OCTETS,
    HEX_UUID varchar(32))
as
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
      substring('0123456789abcdef' from bin_shr(:c, 4)  + 1 for 1) ||
      substring('0123456789abcdef' from bin_and(:c, 15) + 1 for 1);

    i = :i + 1;
  end

  suspend;

end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_GUID_UUID_HEX TO "PUBLIC";

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 1, column 10.
GET_GUID_UUID_HEX.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 3, column 1.
Select.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 3, column 1.
Select.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 3, column 1.
Select.

*/



/*------ SYSDBA 20/01/2015 10:50:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_GUID_UUID_HEX
returns (
    REAL_UUID char(16) character set OCTETS,
    HEX_UUID varchar(32),
    HEX_UUID_FORMAT varchar(38))
as
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
      substring('0123456789abcdef' from bin_shr(:c, 4)  + 1 for 1) ||
      substring('0123456789abcdef' from bin_and(:c, 15) + 1 for 1);

    i = :i + 1;
  end

  /*                        8   -  4 -  4 - 4  -      12       */
  /* Formato exemplo: '{5B86B088-F14F-4872-B876-977FBEF9CB91}' */
  hex_uuid_format = '{' ||                        -- 8
    substring(:hex_uuid from  1 for  8) || '-' || -- 4
    substring(:hex_uuid from  9 for  4) || '-' || -- 4
    substring(:hex_uuid from 13 for  4) || '-' || -- 4
    substring(:hex_uuid from 17 for 12) || '}';   -- 12

  hex_uuid_format = upper(:hex_uuid_format);

  suspend;

end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 10:53:26 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_GUID_UUID_HEX
returns (
    REAL_UUID char(16) character set OCTETS,
    HEX_UUID varchar(32),
    HEX_UUID_FORMAT varchar(38))
as
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
      substring('0123456789abcdef' from bin_shr(:c, 4)  + 1 for 1) ||
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

  hex_uuid_format = upper(:hex_uuid_format);

  suspend;

end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 10:55:35 --------*/

CREATE DOMAIN DMN_GUID_32 AS
VARCHAR(32);CREATE DOMAIN DMN_GUID_32_NN AS
VARCHAR(32)
NOT NULL;CREATE DOMAIN DMN_GUID_38 AS
VARCHAR(38);CREATE DOMAIN DMN_GUID_38_NN AS
VARCHAR(38)
NOT NULL;


/*------ SYSDBA 20/01/2015 10:56:10 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_GUID_UUID_HEX
returns (
    REAL_UUID char(16) character set OCTETS,
    HEX_UUID varchar(32),
    HEX_UUID_FORMAT varchar(38))
as
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
      substring('0123456789abcdef' from bin_shr(:c, 4)  + 1 for 1) ||
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

end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 10:57:02 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_GUID_UUID_HEX
returns (
    REAL_UUID char(16) character set OCTETS,
    HEX_UUID varchar(32),
    HEX_UUID_FORMAT varchar(38))
as
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

end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 10:59:01 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_GUID_38_NN'
where (RDB$FIELD_NAME = 'ID') and
(RDB$RELATION_NAME = 'TBESTOQUE_ALMOX')
;




/*------ SYSDBA 20/01/2015 11:00:35 --------*/

COMMENT ON COLUMN TBESTOQUE_ALMOX.ID IS
'Identificador Unico (GUID)';




/*------ SYSDBA 20/01/2015 11:00:57 --------*/

ALTER TABLE TBESTOQUE_ALMOX
ADD CONSTRAINT UNQ_TBESTOQUE_ALMOX
UNIQUE (ID);




/*------ SYSDBA 20/01/2015 11:02:51 --------*/

SET TERM ^ ;

CREATE trigger tg_estoque_almox_guid for tbestoque_almox
active before insert position 0
AS
begin
  Select
    g.hex_uuid_format
  from GET_GUID_UUID_HEX g
  Into
    new.id;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ESTOQUE_ALMOX_GUID IS 'Trigger Identificar Estoque Apropriado.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por gerar um identificador unico no padrao GUID para cada nova apropriacao de estoque inserida na
tabela.';




/*------ SYSDBA 20/01/2015 11:03:40 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_estoque_almox_guid for tbestoque_almox
active before insert position 0
AS
begin
  Select
    g.hex_uuid_format
  from GET_GUID_UUID_HEX g
  Into
    new.id;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ESTOQUE_ALMOX_GUID IS 'Trigger Identificar Estoque Apropriado.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por gerar um identificador unico no padrao GUID para cada nova apropriacao de estoque inserida na
tabela.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/01/2014 - IMR :
        * COnstrucao dos objetos relacionados e documentacao.';




/*------ SYSDBA 20/01/2015 11:11:05 --------*/

CREATE SEQUENCE GEN_REQUISICAO_ALMOX_2015;

CREATE SEQUENCE GEN_REQUISICAO_ALMOX_2016;

CREATE SEQUENCE GEN_REQUISICAO_ALMOX_2017;

CREATE SEQUENCE GEN_REQUISICAO_ALMOX_2018;

CREATE SEQUENCE GEN_REQUISICAO_ALMOX_2019;

CREATE SEQUENCE GEN_REQUISICAO_ALMOX_2020;




/*------ SYSDBA 20/01/2015 11:13:48 --------*/

COMMENT ON SEQUENCE GEN_REQUISICAO_ALMOX_2015 IS 'Sequenciador de requisicoes ao almoxarifado para 2015';

COMMENT ON SEQUENCE GEN_REQUISICAO_ALMOX_2016 IS 'Sequenciador de requisicoes ao almoxarifado para 2016';

COMMENT ON SEQUENCE GEN_REQUISICAO_ALMOX_2017 IS 'Sequenciador de requisicoes ao almoxarifado para 2017';

COMMENT ON SEQUENCE GEN_REQUISICAO_ALMOX_2018 IS 'Sequenciador de requisicoes ao almoxarifado para 2018';

COMMENT ON SEQUENCE GEN_REQUISICAO_ALMOX_2019 IS 'Sequenciador de requisicoes ao almoxarifado para 2019';

COMMENT ON SEQUENCE GEN_REQUISICAO_ALMOX_2020 IS 'Sequenciador de requisicoes ao almoxarifado para 2020';

COMMENT ON SEQUENCE GEN_REQUISICAO_2015 IS 'Sequenciador de requisicoes de clientes para 2015';

COMMENT ON SEQUENCE GEN_REQUISICAO_2016 IS 'Sequenciador de requisicoes de clientes para 2016';

COMMENT ON SEQUENCE GEN_REQUISICAO_2017 IS 'Sequenciador de requisicoes de clientes para 2017';

COMMENT ON SEQUENCE GEN_REQUISICAO_2018 IS 'Sequenciador de requisicoes de clientes para 2018';

COMMENT ON SEQUENCE GEN_REQUISICAO_2019 IS 'Sequenciador de requisicoes de clientes para 2019';

COMMENT ON SEQUENCE GEN_REQUISICAO_2020 IS 'Sequenciador de requisicoes de clientes para 2020';



/*------ 20/01/2015 13:26:13 --------*/

CREATE TABLE TBREQUISICAO_ALMOX(
  ANO INTEGER NOT NULL,
  CONTROLE INTEGER NOT NULL,
  NUMERO DMN_VCHAR_20_NN,
  EMPRESA INTEGER,
  TIPO DMN_SMALLINT_NN DEFAULT 0,
  CCUSTO_ORIGEM DMN_INTEGER_NN,
  CCUSTO_DESTINO DMN_INTEGER_NN,
  INSERCAO_DATA DMN_DATETIME,
  INSERCAO_USUARIO DMN_USUARIO,
  DATA_EMISSAO DMN_DATE,
  REQUISITANTE DMN_USUARIO,
  COMPETENCIA DMN_INTEGER_N,
  STATUS DMN_STATUS DEFAULT 0,
  MOTIVO DMN_TEXTO,
  OBS DMN_TEXTO,
  VALOR_TOTAL DMN_MONEY,
  ATENDIMENTO_USUARIO DMN_USUARIO,
  ATENDIMENTO_DATA DMN_DATETIME,
  CANCEL_USUARIO DMN_USUARIO,
  CANCEL_DATA DMN_DATETIME,
  CANCEL_MOTIVO DMN_TEXTO);

/*------ 20/01/2015 13:26:13 --------*/

ALTER TABLE TBREQUISICAO_ALMOX ADD CONSTRAINT PK_TBREQUISICAO_ALMOX PRIMARY KEY (ANO, CONTROLE);

/*------ 20/01/2015 13:26:13 --------*/

ALTER TABLE TBREQUISICAO_ALMOX ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_CCO FOREIGN KEY (CCUSTO_DESTINO) REFERENCES
TBCENTRO_CUSTO (CODIGO);

/*------ 20/01/2015 13:26:13 --------*/

ALTER TABLE TBREQUISICAO_ALMOX ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_CCD FOREIGN KEY (CCUSTO_DESTINO) REFERENCES
TBCENTRO_CUSTO (CODIGO);

/*------ 20/01/2015 13:26:13 --------*/

ALTER TABLE TBREQUISICAO_ALMOX ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_EMP FOREIGN KEY (EMPRESA) REFERENCES
TBEMPRESA (CNPJ);

ALTER TABLE TBREQUISICAO_ALMOX ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_USI FOREIGN KEY (INSERCAO_USUARIO) REFERENCES
TBUSERS (NOME);

/*------ 20/01/2015 13:26:13 --------*/

ALTER TABLE TBREQUISICAO_ALMOX ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_USR FOREIGN KEY (REQUISITANTE) REFERENCES
TBUSERS (NOME);

/*------ 20/01/2015 13:26:13 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_CMP
ON TBREQUISICAO_ALMOX (COMPETENCIA);

/*------ 20/01/2015 13:26:13 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_STA
ON TBREQUISICAO_ALMOX (STATUS);

/*------ 20/01/2015 13:26:13 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_TIP
ON TBREQUISICAO_ALMOX (TIPO);

/*------ 20/01/2015 13:26:13 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_DAT
ON TBREQUISICAO_ALMOX (DATA_EMISSAO);


/*------ SYSDBA 20/01/2015 13:27:54 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_CNPJ_NN'
where (RDB$FIELD_NAME = 'EMPRESA') and
(RDB$RELATION_NAME = 'TBREQUISICAO_ALMOX')
;




/*------ SYSDBA 20/01/2015 13:28:16 --------*/

ALTER TABLE TBREQUISICAO_ALMOX
ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_EMP
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);



/*------ 20/01/2015 13:28:59 --------*/

CREATE TABLE TBREQUISICAO_ALMOX_ITEM(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN NOT NULL,
  ITEM DMN_SMALLINT_NN NOT NULL,
  PRODUTO DMN_VCHAR_10_KEY,
  QTDE DMN_QUANTIDADE_D3 DEFAULT 1,
  UNIDADE DMN_SMALLINT_N,
  CUSTO DMN_MONEY_4 DEFAULT 0.0,
  FRACIONADOR DMN_PERCENTUAL_3,
  TOTAL DMN_MONEY DEFAULT 0.0,
  STATUS DMN_STATUS DEFAULT 0,
  LOTE_ATENDIMENTO DMN_GUID_38);

/*------ 20/01/2015 13:28:59 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM ADD CONSTRAINT PK_TBREQUISICAO_ALMOX_ITEM PRIMARY KEY (ANO, CONTROLE, ITEM);

/*------ 20/01/2015 13:28:59 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_ITEM FOREIGN KEY (ANO, CONTROLE) REFERENCES
TBREQUISICAO_ALMOX (ANO, CONTROLE) ON UPDATE CASCADE ON DELETE CASCADE;

/*------ 20/01/2015 13:28:59 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_ITM_U FOREIGN KEY (UNIDADE) REFERENCES
TBUNIDADEPROD (UNP_COD);

/*------ 20/01/2015 13:28:59 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_ITM_P FOREIGN KEY (PRODUTO) REFERENCES
TBPRODUTO (COD);GRANT ALL ON TBREQUISICAO_ALMOX_ITEM TO "PUBLIC";
GRANT ALL ON TBREQUISICAO_ALMOX TO "PUBLIC";



/*------ SYSDBA 20/01/2015 13:29:45 --------*/

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

    05/01/2014 - IMR :
        * Concepcao do modelo.

    20/01/2014 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 20/01/2015 13:29:52 --------*/

COMMENT ON TABLE TBREQUISICAO_ALMOX_ITEM IS 'Tabela Itens da Requisicao ao Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Tabela responsavel por armazenar todos os registros de itens (produtos) das requisicoes ao estoque lancados no Sistema
de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/01/2014 - IMR :
        * Documentacao da tabela.';



/*------ 20/01/2015 13:31:26 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_ITEM_STA
ON TBREQUISICAO_ALMOX_ITEM (STATUS);

/*------ 20/01/2015 13:31:26 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_ITEM_LOT
ON TBREQUISICAO_ALMOX_ITEM (LOTE_ATENDIMENTO);


/*------ SYSDBA 20/01/2015 13:33:47 --------*/

SET TERM ^ ;

CREATE trigger tg_requisicao_almox_codigo for tbrequisicao_almox
active before insert position 0
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

COMMENT ON TRIGGER TG_REQUISICAO_ALMOX_CODIGO IS 'Trigger Nova Requisicao ao Estoque (Almoxarifado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de requisicao ao estoque no ano.';




/*------ SYSDBA 20/01/2015 13:35:41 --------*/

SET TERM ^ ;

CREATE trigger tg_requisicao_almox_compet for tbrequisicao_almox
active before insert position 1
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

COMMENT ON TRIGGER TG_REQUISICAO_ALMOX_COMPET IS 'Trigger Competencia Requisicao Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por identificar a competencia da requisicao ao estoque quando esta nao for informada, baseando-se na
data de emissao.';




/*------ SYSDBA 20/01/2015 13:36:23 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_compet for tbrequisicao_almox
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




/*------ SYSDBA 20/01/2015 13:37:37 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_compet for tbrequisicao_almox
active before insert or update position 1
AS
  declare variable competencia Integer;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    competencia = right('0000' || extract(year from new.atendimento_data), 4) || right('00' || extract(month from new.atendimento_data), 2);
    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_REQUISICAO_ALMOX_COMPET IS 'Trigger Competencia Requisicao Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por identificar a competencia da requisicao ao estoque quando esta nao for informada, baseando-se na
data de atendimento.';




/*------ SYSDBA 20/01/2015 13:41:56 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_compet for tbrequisicao_almox
active before insert or update position 1
AS
  declare variable competencia Integer;
  declare variable data DMN_DATE_NN;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    data = coalesce(cast(new.atendimento_data as Date), new.data_emissao, cast(new.insercao_data as Date), current_date);

    competencia = right('0000' ||
      extract(year  from :data), 4) || right('00' ||
      extract(month from :data), 2);

    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 13:49:21 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM DROP CONSTRAINT FK_TBREQUISICAO_ALMOX_ITEM;




/*------ SYSDBA 20/01/2015 13:49:28 --------*/

ALTER TABLE TBREQUISICAO_ALMOX DROP CONSTRAINT PK_TBREQUISICAO_ALMOX;




/*------ SYSDBA 20/01/2015 13:49:39 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BIGINT_NN'
where (RDB$FIELD_NAME = 'CONTROLE') and
(RDB$RELATION_NAME = 'TBREQUISICAO_ALMOX')
;




/*------ SYSDBA 20/01/2015 13:49:49 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_SMALLINT_NN'
where (RDB$FIELD_NAME = 'ANO') and
(RDB$RELATION_NAME = 'TBREQUISICAO_ALMOX')
;




/*------ SYSDBA 20/01/2015 13:49:58 --------*/

ALTER TABLE TBREQUISICAO_ALMOX
ADD CONSTRAINT PK_TBREQUISICAO_ALMOX
PRIMARY KEY (ANO,CONTROLE);




/*------ SYSDBA 20/01/2015 13:50:57 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM
ADD CONSTRAINT FK_TBREQUISICAO_ALMOX_ITEM
FOREIGN KEY (ANO,CONTROLE)
REFERENCES TBREQUISICAO_ALMOX(ANO,CONTROLE)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 20/01/2015 14:02:56 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_PERCENTUAL_3'
where (RDB$FIELD_NAME = 'FRACIONADOR') and
(RDB$RELATION_NAME = 'TBESTOQUE_ALMOX')
;




/*------ SYSDBA 20/01/2015 14:48:22 --------*/

SET TERM ^ ;

CREATE trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
AS
  declare variable empresa    varchar(18);
  declare variable cc_origem  Integer;
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
          i.produto
        , i.qtde
        , e.lote
        , e.id
        , e.data_fabricacao
        , e.data_validade
        , coalesce(e.qtde, 0)
        , coalesce(e.custo_medio, 0)
        , coalesce(nullif(e.fracionador, 0), 1)
      from TBREQUISICAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.cod = i.produto)
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
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

      -- Baixar estoque do Centro de custo de origem
      Update TBESTOQUE_ALMOX e Set
          e.qtde = :estoque
      where e.id = :lote_guid;

      lote_guid = null;

      if ( :tipo_requisicao = 2 ) then /* Transferencia de estoque */
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :cc_origem
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            lote_guid;

        if ( :lote_guid is null ) then
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
            , custo_medio
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
          );
            
        end
        else
        begin

          Update TBESTOQUE_ALMOX ea Set
              ea.qtde = coalesce(ea.qtde, 0.0) + :quantidade
          where ea.id = :lote_guid;

        end 

      end 

    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 14:51:42 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM
    ADD QTDE_ATENDIDA DMN_QUANTIDADE_D3 DEFAULT 0;

COMMENT ON COLUMN TBREQUISICAO_ALMOX_ITEM.QTDE_ATENDIDA IS
'Quantidade fracionada atendida';

alter table TBREQUISICAO_ALMOX_ITEM
alter ANO position 1;

alter table TBREQUISICAO_ALMOX_ITEM
alter CONTROLE position 2;

alter table TBREQUISICAO_ALMOX_ITEM
alter ITEM position 3;

alter table TBREQUISICAO_ALMOX_ITEM
alter PRODUTO position 4;

alter table TBREQUISICAO_ALMOX_ITEM
alter QTDE position 5;

alter table TBREQUISICAO_ALMOX_ITEM
alter QTDE_ATENDIDA position 6;

alter table TBREQUISICAO_ALMOX_ITEM
alter UNIDADE position 7;

alter table TBREQUISICAO_ALMOX_ITEM
alter CUSTO position 8;

alter table TBREQUISICAO_ALMOX_ITEM
alter FRACIONADOR position 9;

alter table TBREQUISICAO_ALMOX_ITEM
alter TOTAL position 10;

alter table TBREQUISICAO_ALMOX_ITEM
alter STATUS position 11;

alter table TBREQUISICAO_ALMOX_ITEM
alter LOTE_ATENDIMENTO position 12;




/*------ SYSDBA 20/01/2015 14:55:58 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento)
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status = 1 /* Aguardando */
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

      -- Baixar estoque do Centro de custo de origem
      Update TBESTOQUE_ALMOX e Set
          e.qtde = :estoque
      where e.id = :lote_guid;

      lote_guid = null;

      if ( :tipo_requisicao = 2 ) then /* Transferencia de estoque */
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :cc_origem
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            lote_guid;

        if ( :lote_guid is null ) then
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
            , custo_medio
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
        i.status = 2 /* Atendido */
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.item     = :item
        and i.status   = 1; /* Aguardando */

    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 20/01/2015 15:00:27 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento)
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status = 1 /* Aguardando */
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

      -- Baixar estoque do Centro de custo de origem
      Update TBESTOQUE_ALMOX e Set
          e.qtde = :estoque
      where e.id = :lote_guid;

      lote_guid = null;

      if ( :tipo_requisicao = 2 ) then /* Transferencia de estoque */
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :cc_origem
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            lote_guid;

        if ( :lote_guid is null ) then
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
            , custo_medio
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
        i.status = 2 /* Atendido */
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.item     = :item
        and i.status   = 1; /* Aguardando */

    end

  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_REQUISICAO_ALMOX_ESTOQUE IS 'Trigger Requisicao ao Estoque (Atendimento do Almoxarifado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por executar o processo de baixa do estoque do centro de custo de destino (atendente) e, quando o
tipo for transferencia de estoque, repasse para o estoque do centro de custo de origem (requisitante).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/01/2014 - IMR :
        * Atualizacao do trigger (Otimizacao).';




/*------ SYSDBA 20/01/2015 15:27:51 --------*/

ALTER TABLE TBREQUISICAO_ALMOX_ITEM
    ADD LOTE_REQUISITANTE DMN_GUID_38;

COMMENT ON COLUMN TBREQUISICAO_ALMOX_ITEM.LOTE_REQUISITANTE IS
'Identificacao do lote do requisitante';




/*------ SYSDBA 20/01/2015 15:31:44 --------*/

DROP INDEX IDX_TBREQUISICAO_ALMOX_ITEM_LOT;



/*------ 20/01/2015 15:32:01 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_ITEM_LTA
ON TBREQUISICAO_ALMOX_ITEM (LOTE_ATENDIMENTO);

/*------ 20/01/2015 15:32:01 --------*/

CREATE INDEX IDX_TBREQUISICAO_ALMOX_ITEM_LTR
ON TBREQUISICAO_ALMOX_ITEM (LOTE_REQUISITANTE);


/*------ SYSDBA 20/01/2015 15:33:11 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento)
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status = 1 /* Aguardando */
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

      -- Baixar estoque do Centro de custo de origem
      Update TBESTOQUE_ALMOX e Set
          e.qtde = :estoque
      where e.id = :lote_guid;

      lote_guid = null;

      if ( :tipo_requisicao = 2 ) then /* Transferencia de estoque */
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
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




/*------ SYSDBA 20/01/2015 15:35:18 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
        inner join TBESTOQUE_ALMOX e on (e.id = i.lote_atendimento)
      where i.ano      = new.ano
        and i.controle = new.controle
        and i.status = 1 /* Aguardando */
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

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
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




/*------ SYSDBA 20/01/2015 15:43:08 --------*/

SET TERM ^ ;

CREATE trigger tg_requisicao_almox_cancelado for tbrequisicao_almox
active after update position 3
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




/*------ SYSDBA 20/01/2015 15:49:30 --------*/

DROP TRIGGER TG_REQUISICAO_ALMOX_CANCELADO;

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_cancelar for tbrequisicao_almox
active after update position 3
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




/*------ SYSDBA 20/01/2015 15:51:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_cancelar for tbrequisicao_almox
active after update position 3
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

COMMENT ON TRIGGER TG_REQUISICAO_ALMOX_CANCELAR IS 'Trigger Remover Estoque de Requisicao Atendida (Cancelamento).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/01/2015

Trigger responsavel por executar o processo de baixa do estoque do centro de custo de origem (requisitante) e, quando o
tipo for transferencia de estoque, devolucao de estoque do centro de custo de destino (atendente).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/01/2014 - IMR :
        * Atualizacao do trigger (Otimizacao).';




/*------ SYSDBA 20/01/2015 16:36:43 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
        and i.status = 1 /* Aguardando */
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

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
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




/*------ SYSDBA 20/01/2015 16:38:27 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
        and i.status = 1 /* Aguardando */
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
            ea.qtde
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




/*------ SYSDBA 20/01/2015 20:53:27 --------*/

CREATE VIEW VW_TIPO_REQUISICAO_ALMOX(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Consumo Interno'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Consumo de Produção' as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Transferência de Estoque/Equipamentos' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_REQUISICAO_ALMOX TO "PUBLIC";



/*------ SYSDBA 20/01/2015 20:54:11 --------*/

COMMENT ON COLUMN TBREQUISICAO_ALMOX.TIPO IS
'Tipo de requisicao:
0 - Consumo Interno
1 - Consumo de Producao
2 - Transferencia de Estoque/Equipamentos';




/*------ SYSDBA 20/01/2015 20:56:09 --------*/

CREATE VIEW VW_STATUS_REQUISICAO_ALMOX (
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Em Edição' as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Aberta'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Enviada'   as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Recebida'  as Descricao from RDB$DATABASE Union
Select 4 as Codigo , 'Atendida'  as Descricao from RDB$DATABASE Union
Select 5 as Codigo , 'Cancelada' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_STATUS_REQUISICAO_ALMOX TO "PUBLIC";



/*------ SYSDBA 22/01/2015 11:47:04 --------*/

COMMENT ON COLUMN TBREQUISICAO_ALMOX_ITEM.TOTAL IS
'Custo Total

* Quantidade x Custo quando o status do produto for 0 (Pendente) ou 1 (Aguardando)
* Quantidade atendida x Custo quando o status do produto for 2 (Atendido) ou 3 (Entregue)
* Zero quando o status do produto for 4 (Cancelado)';




/*------ SYSDBA 22/01/2015 12:00:28 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_MONEY_4'
where (RDB$FIELD_NAME = 'CUSTO_MEDIO') and
(RDB$RELATION_NAME = 'TBESTOQUE_ALMOX')
;




/*------ SYSDBA 22/01/2015 12:17:02 --------*/

SET TERM ^ ;

create or alter procedure SET_REQUISICAO_ALMOX_CUSTO (
    ANO DMN_SMALLINT_NN,
    CONTROLE DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
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
          Case when ep.custo_medio > 0
            then ep.custo_medio
            else p.customedio
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

end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_REQUISICAO_ALMOX_CUSTO TO "PUBLIC";



/*------ SYSDBA 22/01/2015 12:19:28 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_REQUISICAO_ALMOX_CUSTO (
    ANO DMN_SMALLINT_NN,
    CONTROLE DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
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
          Case when ep.custo_medio > 0
            then ep.custo_medio
            else p.customedio
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

end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_REQUISICAO_ALMOX_CUSTO IS 'Stored Procedure Atualizar Custo Requisicao Almox.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   22/01/2015

Procedimento de banco responsavel por atualizar os valores de custos das requisicoes de produtos feitas ao almoxarifado
de acordo com sua situacao (status).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/01/2014 - IMR :
        * DOcumentacao.';




/*------ SYSDBA 22/01/2015 12:19:57 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_REQUISICAO_ALMOX_CUSTO (
    ANO DMN_SMALLINT_NN,
    CONTROLE DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
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
            else p.customedio
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

end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 12:22:45 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_REQUISICAO_ALMOX_CUSTO (
    ANO DMN_SMALLINT_NN,
    CONTROLE DMN_BIGINT_NN,
    EMPRESA DMN_CNPJ_NN)
as
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
            else p.customedio
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

end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 12:52:47 --------*/

SET TERM ^ ;

create or alter procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    EMPRESA DMN_CNPJ_NN,
    CENTRO_CUSTO DMN_INTEGER_NN,
    PRODUTO_OUT DMN_VCHAR_10_KEY,
    LOTE DMN_INTEGER_NN,
    LOTE_GUID DMN_GUID_38_NN)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3)
as
begin
  for
    Select
        ea.produto
      , ea.id
      , sum(ea.qtde)
    from TBESTOQUE_ALMOX ea
    where (ea.id = :lote_guid)
      or (( ea.empresa      = :empresa
        and ((ea.centro_custo = :centro_custo) or (:centro_custo = 0))
        and ((ea.produto    = :produto_out) or (trim(:produto_out) = ''))
        and ((ea.lote       = :lote) or (:lote is null))
      ))
    group by
        ea.produto
      , ea.id
    Into
        lote_id
      , produto
      , estoque
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :empresa
        and r.ccusto_destino = :centro_custo
        and ri.produto       = :produto
      ))
      and ri.status <> 4 -- Cancelado
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    suspend;

  end 
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_ESTOQUE_ALMOX_DISPONIVEL TO "PUBLIC";



/*------ SYSDBA 22/01/2015 12:56:13 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10_KEY,
    OUT_LOTE DMN_INTEGER_NN,
    OUT_LOTE_GUID DMN_GUID_38_NN)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , sum(ea.qtde)
    from TBESTOQUE_ALMOX ea
    where (ea.id = :out_lote_guid)
      or (( ea.empresa      = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (trim(:out_produto) = ''))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.produto
      , ea.id
    Into
        lote_id
      , produto
      , estoque
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 12:58:22 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10_KEY,
    OUT_LOTE DMN_INTEGER_NN,
    OUT_LOTE_GUID DMN_GUID_38_NN)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , sum(ea.qtde)
    from TBESTOQUE_ALMOX ea
    where (ea.id = :out_lote_guid)
      or (( ea.empresa      = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (trim(:out_produto) = ''))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.produto
      , ea.id
    Into
        lote_id
      , produto
      , estoque
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    suspend;

  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_ESTOQUE_ALMOX_DISPONIVEL IS 'Store Procedure Disponibilidade Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   22/01/2015

Procedimento de banco responsavel por listar a disponibilidade dos produtos em estoque no almoxarifado de acordo com
a empresa, centro de custo e produto.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    22/01/2014 - IMR :
        * DOcumentacao.';


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 34, column 70.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
EA.QTDE.
At line 22, column 17.

*/



/*------ SYSDBA 22/01/2015 13:04:39 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , sum(ea.qtde)
    from TBESTOQUE_ALMOX ea
    where (ea.id = :out_lote_guid)
      or (( ea.empresa        = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (:out_produto is null))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.produto
      , ea.id
    Into
        lote_id
      , produto
      , estoque
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 13:06:24 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , sum(ea.qtde)
    from TBESTOQUE_ALMOX ea
    where (ea.id = :out_lote_guid)
      or (( ea.empresa        = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (:out_produto is null))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.produto
      , ea.id
    Into
        lote_id
      , produto
      , estoque
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_ano))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 13:06:35 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , sum(ea.qtde)
    from TBESTOQUE_ALMOX ea
    where (ea.id = :out_lote_guid)
      or (( ea.empresa        = :out_empresa
        and ((ea.centro_custo = :out_centro_custo) or (:out_centro_custo = 0))
        and ((ea.produto    = :out_produto) or (:out_produto is null))
        and ((ea.lote       = :out_lote) or (:out_lote is null))
      ))
    group by
        ea.produto
      , ea.id
    Into
        lote_id
      , produto
      , estoque
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 13:14:49 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    FRACIONADOR DMN_PERCENTUAL_3,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , sum(ea.qtde)
      , sum(ea.qtde * ea.custo_medio)
    from TBESTOQUE_ALMOX ea
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
    Into
        lote_id
      , produto
      , fracionador
      , estoque
      , custo_total
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 13:16:02 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    FRACIONADOR DMN_PERCENTUAL_3,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
    Into
        lote_id
      , produto
      , fracionador
      , estoque
      , custo_total
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and ri.status <> 4 -- Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 22/01/2015 13:19:30 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ_NN,
    OUT_CENTRO_CUSTO DMN_INTEGER_NN,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    FRACIONADOR DMN_PERCENTUAL_3,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
    Into
        lote_id
      , produto
      , fracionador
      , estoque
      , custo_total
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status not in (2,  3, 4)) -- Atendido, Entregue e Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^


/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
R.CANCEL_DATAHORA.
At line 13, column 7.

*/

/*!!! Error occured !!!
The insert failed because a column definition includes validation constraints.
validation error for variable OUT_EMPRESA, value "*** null ***".
At procedure 'GET_ESTOQUE_ALMOX_DISPONIVEL'.

*/

/*!!! Error occured !!!
The insert failed because a column definition includes validation constraints.
validation error for variable LOTE_ID, value "*** null ***".
At procedure 'GET_ESTOQUE_ALMOX_DISPONIVEL' line: 21, col: 3.

*/

/*!!! Error occured !!!
The insert failed because a column definition includes validation constraints.
validation error for variable LOTE_ID, value "*** null ***".
At procedure 'GET_ESTOQUE_ALMOX_DISPONIVEL' line: 21, col: 3.

*/



/*------ SYSDBA 22/01/2015 19:03:00 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38_NN,
    PRODUTO DMN_VCHAR_10_KEY,
    FRACIONADOR DMN_PERCENTUAL_3,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
    Into
        lote_id
      , produto
      , fracionador
      , estoque
      , custo_total
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status not in (2,  3, 4)) -- Atendido, Entregue e Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^


/*!!! Error occured !!!
The insert failed because a column definition includes validation constraints.
validation error for variable LOTE_ID, value "*** null ***".
At procedure 'GET_ESTOQUE_ALMOX_DISPONIVEL' line: 21, col: 3.

*/



/*------ SYSDBA 22/01/2015 19:03:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38,
    PRODUTO DMN_VCHAR_10,
    FRACIONADOR DMN_PERCENTUAL_3,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
    Into
        lote_id
      , produto
      , fracionador
      , estoque
      , custo_total
  do
  begin

    Select
      sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      )
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status not in (2,  3, 4)) -- Atendido, Entregue e Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 23/01/2015 15:29:31 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
    LOTE_ID DMN_GUID_38,
    PRODUTO DMN_VCHAR_10,
    FRACIONADOR DMN_PERCENTUAL_3,
    ESTOQUE DMN_QUANTIDADE_D3,
    RESERVA DMN_QUANTIDADE_D3,
    DISPONIVEL DMN_QUANTIDADE_D3,
    CUSTO_TOTAL DMN_MONEY,
    CUSTO_RESERVA DMN_MONEY,
    CUSTO_DISPONIVEL DMN_MONEY)
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
    Into
        lote_id
      , produto
      , fracionador
      , estoque
      , custo_total
  do
  begin

    Select
      coalesce(sum(
        Case ri.status
          when 0 then ri.qtde          -- Pendente
          when 1 then ri.qtde          -- Aguardando
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      ), 0.0)
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status not in (2,  3, 4)) -- Atendido, Entregue e Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 23/01/2015 16:00:33 --------*/

ALTER TABLE TBESTOQUE_ALMOX
    ADD UNIDADE DMN_SMALLINT_N;

COMMENT ON COLUMN TBESTOQUE_ALMOX.UNIDADE IS
'Unidade de medida de consumo para o fracionador';

alter table TBESTOQUE_ALMOX
alter EMPRESA position 1;

alter table TBESTOQUE_ALMOX
alter CENTRO_CUSTO position 2;

alter table TBESTOQUE_ALMOX
alter PRODUTO position 3;

alter table TBESTOQUE_ALMOX
alter LOTE position 4;

alter table TBESTOQUE_ALMOX
alter DATA_FABRICACAO position 5;

alter table TBESTOQUE_ALMOX
alter DATA_VALIDADE position 6;

alter table TBESTOQUE_ALMOX
alter QTDE position 7;

alter table TBESTOQUE_ALMOX
alter FRACIONADOR position 8;

alter table TBESTOQUE_ALMOX
alter UNIDADE position 9;

alter table TBESTOQUE_ALMOX
alter CUSTO_MEDIO position 10;

alter table TBESTOQUE_ALMOX
alter ID position 11;



/*------ 23/01/2015 16:01:04 --------*/

ALTER TABLE TBESTOQUE_ALMOX ADD CONSTRAINT FK_TBESTOQUE_ALMOX_UND FOREIGN KEY (UNIDADE) REFERENCES
TBUNIDADEPROD (UNP_COD);


/*------ SYSDBA 23/01/2015 16:02:43 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable unidade_cns DMN_SMALLINT_N;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.empresa
    Into
      estoque_unico;

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;
    estoque_unico = coalesce(:estoque_unico, 0);

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , p.codunidade_fracionada
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod     = :Produto)
        and ((p.Codemp = :Empresa) or (:estoque_unico = 1)) ;

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

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
          , :quantidade * :fracionador
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then :custo_produto
            else ( ((:custo_cc * :estoque_cc) + (:custo_produto * :quantidade)) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_medio
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 23/01/2015 16:03:43 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
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
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , ea.unidade
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
          when 2 then ri.qtde_atendida -- Atendido
          when 3 then ri.qtde_atendida -- Entregue
        end
      ), 0.0)
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status not in (2,  3, 4)) -- Atendido, Entregue e Cancelado
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/01/2015 11:49:42 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_compet for tbrequisicao_almox
active before insert or update position 1
AS
  declare variable competencia Integer;
  declare variable data DMN_DATE;
begin
  if ( coalesce(new.competencia, 0) = 0 ) then
  begin
    data = coalesce(cast(new.atendimento_data as Date), new.data_emissao, cast(new.insercao_data as Date), current_date);

    competencia = right('0000' ||
      extract(year  from :data), 4) || right('00' ||
      extract(month from :data), 2);

    execute procedure SET_COMPETENCIA(:competencia, null);
    new.competencia = :competencia;
  end
end^

SET TERM ; ^




/*------ SYSDBA 27/01/2015 11:52:34 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_compet for tbrequisicao_almox
active before insert or update position 1
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




/*------ SYSDBA 27/01/2015 11:57:17 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_compet for tbapropriacao_almox
active before insert or update position 1
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




/*------ SYSDBA 28/01/2015 21:20:35 --------*/

COMMENT ON COLUMN TBREQUISICAO_ALMOX_ITEM.STATUS IS
'Satus produto:
0 - Pendente
1 - Aguardando
2 - Atendido
3 - Entregue (Implementacao futura)
4 - Cancelado

Observacoes:
1. O material passa para "Aguardando" atraves da aplicacao quando a requisicao for marcada como recebida';




/*------ SYSDBA 29/01/2015 00:06:24 --------*/

COMMENT ON COLUMN TBREQUISICAO_ALMOX_ITEM.STATUS IS
'Satus produto:
0 - Pendente
1 - Aguardando
2 - Atendido
3 - Entregue (Implementacao futura)
4 - Cancelado

Observacoes:
01. O material passa para "Aguardando" quanto nao existe saldo em estoque para atende-lo
02. O material passa para "Atendido" quanto o usuario lancar a quantidade que vai atenter ou o usuario encerrada a
    requisicao com os itens em "Pedente", dando de entender que todos os itens serao atendidos. E neste caso a quantidade
    atendida e informada automaticamente pelo sistema seguindos os criterios de quantidade disponivel em estoque';




/*------ SYSDBA 29/01/2015 00:09:13 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_requisicao_almox_estoque for tbrequisicao_almox
active after update position 2
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
            ea.qtde
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




/*------ SYSDBA 29/01/2015 00:19:59 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_ALMOX_DISPONIVEL (
    OUT_EMPRESA DMN_CNPJ,
    OUT_CENTRO_CUSTO DMN_INTEGER_N,
    OUT_PRODUTO DMN_VCHAR_10,
    OUT_LOTE DMN_INTEGER_N,
    OUT_LOTE_GUID DMN_GUID_38,
    OUT_REQALMOX_ANO DMN_SMALLINT_N,
    OUT_REQALMOX_COD DMN_SMALLINT_N)
returns (
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
as
begin
  for
    Select
        ea.id
      , ea.produto
      , ea.fracionador
      , ea.unidade
      , sum(ea.qtde)
      , sum(ea.qtde * Case when ea.custo_medio > 0.0 then ea.custo_medio else p.customedio end)
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
    where (ri.lote_atendimento = :lote_id)
      or (( r.empresa        = :out_empresa
        and r.ccusto_destino = :out_centro_custo
        and ri.produto       = :out_produto
      ))
      and (ri.status < 2)
      and (not (ri.ano = :out_reqalmox_ano and ri.controle = :out_reqalmox_cod))
    Into
      reserva;

    reserva    = coalesce(:reserva, 0.0);
    disponivel = coalesce(:estoque, 0.0) - :reserva;

    custo_reserva    = :custo_total * (:reserva    / Case when :estoque > 0.0 then :estoque else 1 end);
    custo_disponivel = :custo_total * (:disponivel / Case when :estoque > 0.0 then :estoque else 1 end);

    suspend;

  end 
end^

SET TERM ; ^




/*------ SYSDBA 29/01/2015 18:16:41 --------*/

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX.TIPO IS
'Tipo:
0 - Apropriacao Geral
1 - Apropriacao por Entrada
2 - Apropriacao por Autorizacao';




/*------ SYSDBA 29/01/2015 18:17:26 --------*/

DROP VIEW VW_TIPO_APROPRIACAO;

CREATE VIEW VW_TIPO_APROPRIACAO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Apropriação Geral'       as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Apropriação Por Entrada' as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Apropriação Por Autorização' as Descricao from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_TIPO_APROPRIACAO TO "PUBLIC";




/*------ SYSDBA 29/01/2015 18:19:37 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX
    ADD AUTORIZACAO_ANO DMN_SMALLINT_N,
    ADD AUTORIZACAO_NUM DMN_BIGINT_N,
    ADD AUTORIZACAO_EMP DMN_CNPJ;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX.AUTORIZACAO_ANO IS
'Autorizacao - Ano';

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX.AUTORIZACAO_NUM IS
'Autorizacao - Numero (Controle)';

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX.AUTORIZACAO_EMP IS
'Autorizacao - Empresa';

alter table TBAPROPRIACAO_ALMOX
alter ANO position 1;

alter table TBAPROPRIACAO_ALMOX
alter CONTROLE position 2;

alter table TBAPROPRIACAO_ALMOX
alter NUMERO position 3;

alter table TBAPROPRIACAO_ALMOX
alter EMPRESA position 4;

alter table TBAPROPRIACAO_ALMOX
alter CENTRO_CUSTO position 5;

alter table TBAPROPRIACAO_ALMOX
alter TIPO position 6;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_ANO position 7;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_NUM position 8;

alter table TBAPROPRIACAO_ALMOX
alter COMPRA_EMP position 9;

alter table TBAPROPRIACAO_ALMOX
alter AUTORIZACAO_ANO position 10;

alter table TBAPROPRIACAO_ALMOX
alter AUTORIZACAO_NUM position 11;

alter table TBAPROPRIACAO_ALMOX
alter AUTORIZACAO_EMP position 12;

alter table TBAPROPRIACAO_ALMOX
alter INSERCAO_DATA position 13;

alter table TBAPROPRIACAO_ALMOX
alter DATA_APROPRIACAO position 14;

alter table TBAPROPRIACAO_ALMOX
alter COMPETENCIA position 15;

alter table TBAPROPRIACAO_ALMOX
alter USUARIO position 16;

alter table TBAPROPRIACAO_ALMOX
alter STATUS position 17;

alter table TBAPROPRIACAO_ALMOX
alter MOTIVO position 18;

alter table TBAPROPRIACAO_ALMOX
alter OBS position 19;

alter table TBAPROPRIACAO_ALMOX
alter VALOR_TOTAL position 20;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_USUARIO position 21;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_DATAHORA position 22;

alter table TBAPROPRIACAO_ALMOX
alter CANCEL_MOTIVO position 23;




/*------ SYSDBA 29/01/2015 18:20:39 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX
ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_AUT
FOREIGN KEY (AUTORIZACAO_ANO,AUTORIZACAO_NUM,AUTORIZACAO_EMP)
REFERENCES TBAUTORIZA_COMPRA(ANO,CODIGO,EMPRESA);



/*------ 06/02/2015 10:36:03 --------*/

CREATE TABLE TBINVENTARIO_ALMOX(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN,
  TIPO DMN_SMALLINT_NN,
  EMPRESA DMN_CNPJ NOT NULL,
  CENTRO_CUSTO DMN_BIGINT_NN NOT NULL,
  CONFERIR_ESTOQUE_VENDA DMN_LOGICO DEFAULT 0,
  DATA DMN_DATE,
  COMPETENCIA DMN_INTEGER_N,
  STATUS DMN_STATUS,
  OBS DMN_TEXTO,
  INSERCAO_DATAHORA DMN_DATETIME,
  INSERCAO_USUARIO DMN_USUARIO,
  FECH_DATAHORA DMN_DATETIME,
  FECH_USUARIO DMN_USUARIO,
  CANCEL_DATAHORA DMN_DATETIME,
  CANCEL_USUARIO DMN_USUARIO,
  CANCEL_MOVITO DMN_TEXTO,
  BLOQUEAR_MOVIMENTO DMN_LOGICO DEFAULT 0);

/*------ 06/02/2015 10:36:03 --------*/

ALTER TABLE TBINVENTARIO_ALMOX ADD CONSTRAINT PK_TBINVENTARIO_ALMOX PRIMARY KEY (ANO, CONTROLE);

/*------ 06/02/2015 10:36:03 --------*/

ALTER TABLE TBINVENTARIO_ALMOX ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_EMP FOREIGN KEY (EMPRESA) REFERENCES
TBEMPRESA (CNPJ);

/*------ 06/02/2015 10:36:03 --------*/

ALTER TABLE TBINVENTARIO_ALMOX ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_CCU FOREIGN KEY (CENTRO_CUSTO) REFERENCES
TBCENTRO_CUSTO (CODIGO);

/*------ 06/02/2015 10:36:19 --------*/

CREATE TABLE TBINVENTARIO_ALMOX_ITEM(
  ANO DMN_SMALLINT_NN NOT NULL,
  CONTROLE DMN_BIGINT_NN,
  ITEM DMN_INTEGER_NN,
  PRODUTO DMN_VCHAR_10_KEY,
  QTDE DMN_QUANTIDADE_D3 DEFAULT 0.0,
  ESTOQUE DMN_QUANTIDADE_D3,
  FRACIONADOR DMN_PERCENTUAL_3 DEFAULT 1,
  UNIDADE DMN_SMALLINT_N NOT NULL,
  CUSTO DMN_MONEY_4 DEFAULT 0.0,
  TOTAL DMN_MONEY DEFAULT 0.0,
  USUARIO DMN_USUARIO,
  LOTE_CONFERIDO DMN_GUID_32,
  LOTE_RESULTADO DMN_GUID_32);

/*------ 06/02/2015 10:36:19 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM ADD CONSTRAINT PK_TBINVENTARIO_ALMOX_ITEM PRIMARY KEY (ANO, CONTROLE, ITEM);

/*------ 06/02/2015 10:36:19 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_ITEM FOREIGN KEY (ANO, CONTROLE) REFERENCES
TBINVENTARIO_ALMOX (ANO, CONTROLE) ON UPDATE CASCADE ON DELETE CASCADE;

/*------ 06/02/2015 10:36:19 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_ITEM_UND FOREIGN KEY (UNIDADE) REFERENCES
TBUNIDADEPROD (UNP_COD);

/*------ 06/02/2015 10:36:19 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_ITEM_PRD FOREIGN KEY (PRODUTO) REFERENCES
TBPRODUTO (COD);


/*------ SYSDBA 06/02/2015 10:36:55 --------*/

COMMENT ON COLUMN TBINVENTARIO_ALMOX_ITEM.FRACIONADOR IS
'Indice fracionador';




/*------ SYSDBA 06/02/2015 10:38:02 --------*/

COMMENT ON COLUMN TBINVENTARIO_ALMOX_ITEM.UNIDADE IS
'Unidade fracionada (Unidade de consumo)

Obs.: Ou Unidade de compra qquando o inventario do para o estoque de venda.';




/*------ SYSDBA 06/02/2015 10:38:29 --------*/

COMMENT ON COLUMN TBINVENTARIO_ALMOX.CENTRO_CUSTO IS
'Centro de Custo

Obs.: Inventario sem centro de custo corresponde a conferencias do estoque de venda e nao do estoque apropriado pelo centro de custo';




/*------ SYSDBA 06/02/2015 10:38:56 --------*/

COMMENT ON TABLE TBINVENTARIO_ALMOX IS 'Tabela Invetario de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar todos os registros de inventarios de estoque realizados pelo sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/02/2014 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 06/02/2015 10:39:07 --------*/

COMMENT ON TABLE TBINVENTARIO_ALMOX_ITEM IS 'Tabela Itens do Invetario de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar todos os registros de itens do inventarios de estoque realizados pelo sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/02/2014 - IMR :
        * Documentacao da tabela.';

GRANT ALL ON TBINVENTARIO_ALMOX TO "PUBLIC";
GRANT ALL ON TBINVENTARIO_ALMOX_ITEM TO "PUBLIC";



/*------ SYSDBA 06/02/2015 10:44:15 --------*/

CREATE VIEW VW_TIPO_INVENTARIO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Geral'       as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Parcial' as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Equipamentos/Imobilizados' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_INVENTARIO TO "PUBLIC";



/*------ SYSDBA 06/02/2015 10:46:08 --------*/

CREATE VIEW VW_STATUS_INVENTARIO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Em lançamento'  as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Em conferência' as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Encerrado'      as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Cancelado'      as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_STATUS_INVENTARIO TO "PUBLIC";



/*------ SYSDBA 06/02/2015 10:46:48 --------*/

CREATE VIEW VW_STATUS_INVENTARIO_ALMOX(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Em lançamento'  as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Em conferência' as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Encerrado'      as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Cancelado'      as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_STATUS_INVENTARIO_ALMOX TO "PUBLIC";



/*------ SYSDBA 06/02/2015 10:47:06 --------*/

DROP VIEW VW_STATUS_INVENTARIO;




/*------ SYSDBA 06/02/2015 10:47:29 --------*/

CREATE VIEW VW_TIPO_INVENTARIO_ALMOX(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Geral'       as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Parcial' as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Equipamentos/Imobilizados' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_TIPO_INVENTARIO_ALMOX TO "PUBLIC";



/*------ SYSDBA 06/02/2015 10:47:43 --------*/

DROP VIEW VW_TIPO_INVENTARIO;




/*------ SYSDBA 06/02/2015 11:11:18 --------*/

SET TERM ^ ;

create or alter procedure GET_ESTOQUE_PRODUTO (
    IN_EMPRESA DMN_CNPJ,
    IN_CENTRO_CUSTO DMN_INTEGER_N,
    IN_PRODUTO DMN_VCHAR_10)
returns (
    PRODUTO DMN_VCHAR_10,
    ESTOQUE DMN_QUANTIDADE_D3,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    CUSTO_MEDIO DMN_MONEY)
as
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

    Select
        p.cod
      , p.qtde
      , 1.0
      , p.codunidade
      , p.customedio
    from TBPRODUTO p
    where (p.cod     = :in_produto)
      and ((p.codemp = :in_empresa) or (:estoque_unico = 1))
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio;

  end
  else
  begin

    Select
        g.produto
      , g.estoque
      , g.fracionador
      , g.unidade
      , g.custo_total / g.estoque
    from GET_ESTOQUE_ALMOX_DISPONIVEL (:in_empresa, :in_centro_custo, :in_produto, null, null, null, null) g
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio;

  end

  suspend;
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_ESTOQUE_PRODUTO TO "PUBLIC";



/*------ SYSDBA 06/02/2015 11:12:33 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_PRODUTO (
    IN_EMPRESA DMN_CNPJ,
    IN_CENTRO_CUSTO DMN_INTEGER_N,
    IN_PRODUTO DMN_VCHAR_10)
returns (
    PRODUTO DMN_VCHAR_10,
    ESTOQUE DMN_QUANTIDADE_D3,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    CUSTO_MEDIO DMN_MONEY)
as
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
    Select
        p.cod
      , p.qtde
      , 1.0
      , p.codunidade
      , p.customedio
    from TBPRODUTO p
    where (p.cod     = :in_produto)
      and ((p.codemp = :in_empresa) or (:estoque_unico = 1))
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio;

  end
  else
  begin

    /* Buscar no Estoque Apropriado do Centro de Custo */
    Select
        g.produto
      , g.estoque
      , g.fracionador
      , g.unidade
      , g.custo_total / g.estoque
    from GET_ESTOQUE_ALMOX_DISPONIVEL (:in_empresa, :in_centro_custo, :in_produto, null, null, null, null) g
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio;

  end

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 06/02/2015 11:51:19 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_PRODUTO (
    IN_EMPRESA DMN_CNPJ,
    IN_CENTRO_CUSTO DMN_INTEGER_N,
    IN_PRODUTO DMN_VCHAR_10)
returns (
    PRODUTO DMN_VCHAR_10,
    ESTOQUE DMN_QUANTIDADE_D3,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    CUSTO_MEDIO DMN_MONEY)
as
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
    Select
        p.cod
      , p.qtde
      , 1.0
      , p.codunidade
      , p.customedio
    from TBPRODUTO p
    where (p.cod     = :in_produto)
      and ((p.codemp = :in_empresa) or (:estoque_unico = 1))
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio;

  end
  else
  begin

    /* Buscar no Estoque Apropriado do Centro de Custo */
    Select
        g.produto
      , g.estoque
      , g.fracionador
      , g.unidade
      , g.custo_total / g.estoque
    from GET_ESTOQUE_ALMOX_DISPONIVEL (:in_empresa, :in_centro_custo, :in_produto, null, null, null, null) g
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio;

  end

  suspend;
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_ESTOQUE_PRODUTO IS 'Stored Procedure Buscar Estoque Produto.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   06/02/2015

Procedimento de banco responsavel por buscar o estoque disponível do produto a partir de dados com Empresa, Centro de
Custo e Produto. Ao ser informado o Centro de Custo, o estoque vem de sua apropriacao e caso nao seja informado, este
estoque vira do que esta disponivel para venda.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/02/2014 - IMR :
        * DOcumentacao.';


/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 10, column 67.
from.

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 10, column 48.
).

*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 24, column 7.
from.

*/



/*------ SYSDBA 07/02/2015 10:49:30 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ESTOQUE_PRODUTO (
    IN_EMPRESA DMN_CNPJ,
    IN_CENTRO_CUSTO DMN_INTEGER_N,
    IN_PRODUTO DMN_VCHAR_10)
returns (
    PRODUTO DMN_VCHAR_10,
    ESTOQUE DMN_QUANTIDADE_D3,
    FRACIONADOR DMN_PERCENTUAL_3,
    UNIDADE DMN_SMALLINT_N,
    CUSTO_MEDIO DMN_MONEY,
    LOTE_ID DMN_GUID_38)
as
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
      , g.custo_total / g.estoque
      , g.lote_id
    from GET_ESTOQUE_ALMOX_DISPONIVEL (:in_empresa, :in_centro_custo, :in_produto, null, null, null, null) g
    Into
        produto
      , estoque
      , fracionador
      , unidade
      , custo_medio
      , lote_id;

  end

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 07/02/2015 11:31:53 --------*/

CREATE SEQUENCE GEN_INVENTARIO_ALMOX_2015;

CREATE SEQUENCE GEN_INVENTARIO_ALMOX_2016;

CREATE SEQUENCE GEN_INVENTARIO_ALMOX_2017;

CREATE SEQUENCE GEN_INVENTARIO_ALMOX_2018;

CREATE SEQUENCE GEN_INVENTARIO_ALMOX_2019;

CREATE SEQUENCE GEN_INVENTARIO_ALMOX_2020;




/*------ SYSDBA 07/02/2015 11:33:07 --------*/

COMMENT ON SEQUENCE GEN_INVENTARIO_ALMOX_2015 IS 'Sequenciador de inventarios do almoxarifado para 2015';

COMMENT ON SEQUENCE GEN_INVENTARIO_ALMOX_2016 IS 'Sequenciador de inventarios do almoxarifado para 2016';

COMMENT ON SEQUENCE GEN_INVENTARIO_ALMOX_2017 IS 'Sequenciador de inventarios do almoxarifado para 2017';

COMMENT ON SEQUENCE GEN_INVENTARIO_ALMOX_2018 IS 'Sequenciador de inventarios do almoxarifado para 2018';

COMMENT ON SEQUENCE GEN_INVENTARIO_ALMOX_2019 IS 'Sequenciador de inventarios do almoxarifado para 2019';

COMMENT ON SEQUENCE GEN_INVENTARIO_ALMOX_2020 IS 'Sequenciador de inventarios do almoxarifado para 2020';




/*------ SYSDBA 07/02/2015 12:07:40 --------*/

SET TERM ^ ;

create or alter procedure SET_SEGMENTO_EMPRESA (
    CODIGO DMN_SMALLINT_NN,
    DESCRICAO DMN_NOME)
as
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
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_SEGMENTO_EMPRESA TO "PUBLIC";



/*------ SYSDBA 09/02/2015 19:41:36 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM DROP CONSTRAINT PK_TBINVENTARIO_ALMOX_ITEM;




/*------ SYSDBA 09/02/2015 19:42:29 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM
    ADD ID DMN_GUID_38_NN;

COMMENT ON COLUMN TBINVENTARIO_ALMOX_ITEM.ID IS
'ID de Lancamento.';

alter table TBINVENTARIO_ALMOX_ITEM
alter ID position 1;

alter table TBINVENTARIO_ALMOX_ITEM
alter ANO position 2;

alter table TBINVENTARIO_ALMOX_ITEM
alter CONTROLE position 3;

alter table TBINVENTARIO_ALMOX_ITEM
alter ITEM position 4;

alter table TBINVENTARIO_ALMOX_ITEM
alter PRODUTO position 5;

alter table TBINVENTARIO_ALMOX_ITEM
alter QTDE position 6;

alter table TBINVENTARIO_ALMOX_ITEM
alter ESTOQUE position 7;

alter table TBINVENTARIO_ALMOX_ITEM
alter FRACIONADOR position 8;

alter table TBINVENTARIO_ALMOX_ITEM
alter UNIDADE position 9;

alter table TBINVENTARIO_ALMOX_ITEM
alter CUSTO position 10;

alter table TBINVENTARIO_ALMOX_ITEM
alter TOTAL position 11;

alter table TBINVENTARIO_ALMOX_ITEM
alter USUARIO position 12;

alter table TBINVENTARIO_ALMOX_ITEM
alter LOTE_CONFERIDO position 13;

alter table TBINVENTARIO_ALMOX_ITEM
alter LOTE_RESULTADO position 14;




/*------ SYSDBA 09/02/2015 19:42:36 --------*/

ALTER TABLE TBINVENTARIO_ALMOX_ITEM
ADD CONSTRAINT PK_TBINVENTARIO_ALMOX_ITEM
PRIMARY KEY (ID);




/*------ SYSDBA 09/02/2015 19:44:57 --------*/

SET TERM ^ ;

CREATE trigger tg_inventario_almox_item_itm for tbinventario_almox_item
active before insert position 0
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




/*------ SYSDBA 09/02/2015 19:45:11 --------*/

DROP TRIGGER TG_INVENTARIO_ALMOX_ITEM_ITM;

SET TERM ^ ;

CREATE OR ALTER trigger tg_inventario_almox_item for tbinventario_almox_item
active before insert position 0
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




/*------ SYSDBA 10/02/2015 11:42:23 --------*/

ALTER TABLE TBPRODUTO
    ADD PRODUTO_IMOBILIZADO DMN_LOGICO;

COMMENT ON COLUMN TBPRODUTO.PRODUTO_IMOBILIZADO IS
'Produto imobilizado:
0 - Nao
1 - Sim';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter PRECO position 8;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 9;

alter table TBPRODUTO
alter REFERENCIA position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter CUBAGEM position 17;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 18;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 19;

alter table TBPRODUTO
alter UNIDADE position 20;

alter table TBPRODUTO
alter ESTOQMIN position 21;

alter table TBPRODUTO
alter CODGRUPO position 22;

alter table TBPRODUTO
alter CODFABRICANTE position 23;

alter table TBPRODUTO
alter CUSTOMEDIO position 24;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 25;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 26;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 27;

alter table TBPRODUTO
alter CODEMP position 28;

alter table TBPRODUTO
alter CODSECAO position 29;

alter table TBPRODUTO
alter CODORIGEM position 30;

alter table TBPRODUTO
alter CODTRIBUTACAO position 31;

alter table TBPRODUTO
alter CST position 32;

alter table TBPRODUTO
alter CSOSN position 33;

alter table TBPRODUTO
alter CST_PIS position 34;

alter table TBPRODUTO
alter CST_COFINS position 35;

alter table TBPRODUTO
alter NCM_SH position 36;

alter table TBPRODUTO
alter CODIGO_NVE position 37;

alter table TBPRODUTO
alter CODCFOP position 38;

alter table TBPRODUTO
alter CODBARRA_EAN position 39;

alter table TBPRODUTO
alter CODUNIDADE position 40;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 41;

alter table TBPRODUTO
alter ALIQUOTA position 42;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 43;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 44;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 45;

alter table TBPRODUTO
alter VALOR_IPI position 46;

alter table TBPRODUTO
alter RESERVA position 47;

alter table TBPRODUTO
alter PRODUTO_NOVO position 48;

alter table TBPRODUTO
alter COR_VEICULO position 49;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 50;

alter table TBPRODUTO
alter TIPO_VEICULO position 51;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 52;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 53;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 54;

alter table TBPRODUTO
alter CHASSI_VEICULO position 55;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 56;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 57;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 58;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 59;

alter table TBPRODUTO
alter USUARIO position 60;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 61;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 62;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 63;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 64;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 65;

alter table TBPRODUTO
alter CUST_DESP_ADM position 66;

alter table TBPRODUTO
alter CUST_COMISSAO position 67;

alter table TBPRODUTO
alter CUST_IMPOSTO position 68;

alter table TBPRODUTO
alter FI_RET_FINANC position 69;

alter table TBPRODUTO
alter FI_RET_PLANO position 70;




/*------ SYSDBA 10/02/2015 11:46:54 --------*/

ALTER TABLE TBPRODUTO ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBPRODUTO') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBPRODUTO') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBPRODUTO') AND
      (F1.RDB$FIELD_NAME = 'PRODUTO_IMOBILIZADO');

ALTER TABLE TBPRODUTO DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 10/02/2015 12:42:38 --------*/

SET TERM ^ ;

CREATE trigger tg_inventario_almox_codigo for tbinventario_almox
active before insert position 0
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

COMMENT ON TRIGGER TG_INVENTARIO_ALMOX_CODIGO IS 'Trigger Novo Inventario de Estoque (Estoque de Venda/Almoxarifado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   10/02/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de inventario de estoque no ano.';




/*------ SYSDBA 10/02/2015 12:44:20 --------*/

SET TERM ^ ;

CREATE trigger tg_inventario_almox_comp for tbinventario_almox
active before insert or update position 1
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

COMMENT ON TRIGGER TG_INVENTARIO_ALMOX_COMP IS 'Trigger Competencia Inventario Estoque (Estoque de Venda/Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   10/02/2015

Trigger responsavel por identificar a competencia do inventario quando esta nao for informada, baseando-se na data de
lancamento.';




/*------ SYSDBA 10/02/2015 13:47:45 --------*/

CREATE INDEX IDX_TBINVENTARIO_ALMOX_ITM_LR
ON TBINVENTARIO_ALMOX_ITEM (LOTE_RESULTADO);

CREATE INDEX IDX_TBINVENTARIO_ALMOX_ITM_LC
ON TBINVENTARIO_ALMOX_ITEM (LOTE_CONFERIDO);




/*------ SYSDBA 10/02/2015 13:57:22 --------*/

SET TERM ^ ;

CREATE trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
AS
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
  if ((old.status <> new.status) and (new.status = 2)) then
  begin

    for
      Select
          coalesce(i.produto, 'XXX')
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
          produto
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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where (e.id = :lote_id_conf);

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
            , :quantidade
            , :fracionador
            , :unidade_cns
            , :custo_medio
            , :lote_id_resp
          );

        end
         
      end

    end

  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/02/2015 13:59:51 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
AS
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
  if ((old.status <> new.status) and (new.status = 2)) then
  begin

    for
      Select
          coalesce(i.produto, 'XXX')
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
          produto
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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where (e.id = :lote_id_conf);

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
            , :quantidade
            , :fracionador
            , :unidade_cns
            , :custo_medio
            , :lote_id_resp
          );

        end
         
      end

    end

  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TB_INVENTARIO_ALMOX_ENCERRAR IS 'Trigger Encerrar Inventario (Estoque de Venda/Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   10/02/2015

Trigger responsavel por atualizar o Estoque de Venda ou o estoque do Centro de Custo (Almoxarifado) quando o inventario
for encerrado peloa aplicacao.';




/*------ SYSDBA 10/02/2015 14:00:17 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
AS
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
          coalesce(i.produto, 'XXX')
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
          produto
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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where (e.id = :lote_id_conf);

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
            , :quantidade
            , :fracionador
            , :unidade_cns
            , :custo_medio
            , :lote_id_resp
          );

        end
         
      end

    end

  end 
end^

SET TERM ; ^




/*------ SYSDBA 10/02/2015 14:02:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where (e.id = :lote_id_conf);

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




/*------ SYSDBA 10/02/2015 14:04:07 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where e.id           = :lote_id_conf
            and e.empresa      = new.empresa
            and e.centro_custo = new.centro_custo
            and e.produto      = :produto;

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




/*------ SYSDBA 10/02/2015 14:04:37 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
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
            and e.empresa      = new.empresa
            and e.centro_custo = new.centro_custo
            and e.produto      = :produto
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where e.id           = :lote_id_conf
            and e.empresa      = new.empresa
            and e.centro_custo = new.centro_custo
            and e.produto      = :produto;

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




/*------ SYSDBA 10/02/2015 14:54:21 --------*/

ALTER TABLE TBPRODUTO
    ADD CADASTRO_ATIVO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBPRODUTO.CADASTRO_ATIVO IS
'Cadastro ativo:
0 - Nao
1 - Sim';

alter table TBPRODUTO
alter CODIGO position 1;

alter table TBPRODUTO
alter COD position 2;

alter table TBPRODUTO
alter DESCRI position 3;

alter table TBPRODUTO
alter APRESENTACAO position 4;

alter table TBPRODUTO
alter DESCRI_APRESENTACAO position 5;

alter table TBPRODUTO
alter METAFONEMA position 6;

alter table TBPRODUTO
alter MODELO position 7;

alter table TBPRODUTO
alter PRECO position 8;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 9;

alter table TBPRODUTO
alter REFERENCIA position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter SECAO position 12;

alter table TBPRODUTO
alter QTDE position 13;

alter table TBPRODUTO
alter FRACIONADOR position 14;

alter table TBPRODUTO
alter PESO_BRUTO position 15;

alter table TBPRODUTO
alter PESO_LIQUIDO position 16;

alter table TBPRODUTO
alter CUBAGEM position 17;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 18;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 19;

alter table TBPRODUTO
alter UNIDADE position 20;

alter table TBPRODUTO
alter ESTOQMIN position 21;

alter table TBPRODUTO
alter CODGRUPO position 22;

alter table TBPRODUTO
alter CODFABRICANTE position 23;

alter table TBPRODUTO
alter CUSTOMEDIO position 24;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 25;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 26;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 27;

alter table TBPRODUTO
alter CODEMP position 28;

alter table TBPRODUTO
alter CODSECAO position 29;

alter table TBPRODUTO
alter CODORIGEM position 30;

alter table TBPRODUTO
alter CODTRIBUTACAO position 31;

alter table TBPRODUTO
alter CST position 32;

alter table TBPRODUTO
alter CSOSN position 33;

alter table TBPRODUTO
alter CST_PIS position 34;

alter table TBPRODUTO
alter CST_COFINS position 35;

alter table TBPRODUTO
alter NCM_SH position 36;

alter table TBPRODUTO
alter CODIGO_NVE position 37;

alter table TBPRODUTO
alter CODCFOP position 38;

alter table TBPRODUTO
alter CODBARRA_EAN position 39;

alter table TBPRODUTO
alter CODUNIDADE position 40;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 41;

alter table TBPRODUTO
alter ALIQUOTA position 42;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 43;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 44;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 45;

alter table TBPRODUTO
alter VALOR_IPI position 46;

alter table TBPRODUTO
alter RESERVA position 47;

alter table TBPRODUTO
alter PRODUTO_NOVO position 48;

alter table TBPRODUTO
alter COR_VEICULO position 49;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 50;

alter table TBPRODUTO
alter TIPO_VEICULO position 51;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 52;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 53;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 54;

alter table TBPRODUTO
alter CHASSI_VEICULO position 55;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 56;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 57;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 58;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 59;

alter table TBPRODUTO
alter USUARIO position 60;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 61;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 62;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 63;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 64;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 65;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 66;

alter table TBPRODUTO
alter CUST_DESP_ADM position 67;

alter table TBPRODUTO
alter CUST_COMISSAO position 68;

alter table TBPRODUTO
alter CUST_IMPOSTO position 69;

alter table TBPRODUTO
alter FI_RET_FINANC position 70;

alter table TBPRODUTO
alter FI_RET_PLANO position 71;




/*------ SYSDBA 10/02/2015 16:57:46 --------*/

COMMENT ON TABLE TBINVENTARIO_ALMOX IS 'Tabela Inventario de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar todos os registros de inventarios de estoque realizados pelo sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/02/2014 - IMR :
        * Documentacao da tabela.';



/*------ 10/02/2015 16:57:58 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
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
    , substring(trim(new.motivo) from 1 for 40)
  );
end^

/*------ 10/02/2015 16:57:58 --------*/

SET TERM ; ^

COMMENT ON TRIGGER TG_AJUST_ESTOQUE_HISTORICO IS 'Trigger Ajuste Manual Estoque (Venda).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/02/2014

Trigger responsavel por ajustar a quantidade em esoque do produto quando o regitro de ajuste for encerrado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/05/2014 - IMR :
        * Mudanca da trigger para que o estoque do produto seja ajustado, independente da empresa a qual pertenca.';


/*------ SYSDBA 10/02/2015 21:21:20 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
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




/*------ SYSDBA 10/02/2015 21:23:54 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_GUID_38'
where (RDB$FIELD_NAME = 'LOTE_CONFERIDO') and
(RDB$RELATION_NAME = 'TBINVENTARIO_ALMOX_ITEM')
;




/*------ SYSDBA 10/02/2015 21:23:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_GUID_38'
where (RDB$FIELD_NAME = 'LOTE_RESULTADO') and
(RDB$RELATION_NAME = 'TBINVENTARIO_ALMOX_ITEM')
;




/*------ SYSDBA 11/02/2015 15:09:45 --------*/

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

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.

    03/11/2014 - IMR :
        + Criacao do campo METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico, muito utilizado em processos de cotacao.

    10/02/2014 - IMR :
        + Criacao dos campos CADASTRO_ATIVO e PRODUTO_IMOBILIZADO para permitir que apenas os cadastro ativos sejam
          utilizados nos processos e para designar os produtos que sao imobilizados para futuras implementacoes de
          controles patrimoniais.';



/*------ 16/02/2015 19:08:05 --------*/

CREATE TABLE TBSOLICITACAO(
  ANO DMN_SMALLINT_NN NOT NULL,
  CODIGO DMN_BIGINT_NN NOT NULL,
  NUMERO DMN_VCHAR_20_NN,
  TIPO DMN_SMALLINT_NN DEFAULT 0,
  EMPRESA DMN_CNPJ_NN NOT NULL,
  CENTRO_CUSTO DMN_INTEGER_N,
  NOME_SOLICITANTE DMN_VCHAR_100,
  OBJETO_SOLICITACAO DMN_TEXTO,
  MOVITO DMN_TEXTO,
  OBSERVACAO DMN_TEXTO,
  DATA_EMISSAO DMN_DATE_NN,
  VALIDADE DMN_DATE,
  COMPETENCIA DMN_INTEGER_N,
  INSERCAO_DATA DMN_DATETIME,
  INSERCAO_USUARIO DMN_USUARIO,
  STATUS DMN_SMALLINT_NN DEFAULT 0,
  APROVACAO_DATA DMN_DATE,
  APROVACAO_USUARIO DMN_USUARIO,
  CANCELADO_DATA DMN_DATE,
  CANCELADO_USUARIO DMN_USUARIO,
  CANCELADO_MOTIVO DMN_TEXTO,
  LOG_EVENTO DMN_TEXTO);

/*------ 16/02/2015 19:08:05 --------*/

ALTER TABLE TBSOLICITACAO ADD CONSTRAINT PK_TBSOLICITACAO PRIMARY KEY (ANO, CODIGO);

/*------ 16/02/2015 19:08:05 --------*/

ALTER TABLE TBSOLICITACAO ADD CONSTRAINT FK_TBSOLICITACAO_CC FOREIGN KEY (CENTRO_CUSTO) REFERENCES
TBCENTRO_CUSTO (CODIGO);

/*------ 16/02/2015 19:08:05 --------*/

ALTER TABLE TBSOLICITACAO ADD CONSTRAINT FK_TBSOLICITACAO_EMP FOREIGN KEY (EMPRESA) REFERENCES
TBEMPRESA (CNPJ);

/*------ 16/02/2015 19:08:18 --------*/

CREATE TABLE TBSOLICITACAO_ITEM(
  ANO DMN_SMALLINT_NN NOT NULL,
  CODIGO DMN_BIGINT_NN NOT NULL,
  SEQ DMN_SMALLINT_NN NOT NULL,
  ITEM_CODIGO DMN_VCHAR_10,
  ITEM_DESCRICAO DMN_VCHAR_250,
  ITEM_CADASTRADO DMN_LOGICO DEFAULT 0,
  QUANTIDADE DMN_QUANTIDADE_D3 DEFAULT 1,
  UNIDADE DMN_SMALLINT_N,
  USUARIO DMN_USUARIO DEFAULT user);

/*------ 16/02/2015 19:08:18 --------*/

ALTER TABLE TBSOLICITACAO_ITEM ADD CONSTRAINT PK_TBSOLICITACAO_ITEM PRIMARY KEY (ANO, CODIGO, SEQ);

/*------ 16/02/2015 19:08:18 --------*/

ALTER TABLE TBSOLICITACAO_ITEM ADD CONSTRAINT FK_TBSOLICITACAO_ITEM FOREIGN KEY (ANO, CODIGO) REFERENCES
TBSOLICITACAO (ANO, CODIGO) ON UPDATE CASCADE ON DELETE CASCADE;

/*------ 16/02/2015 19:08:18 --------*/

ALTER TABLE TBSOLICITACAO_ITEM ADD CONSTRAINT FK_TBSOLICITACAO_ITEM_PRD FOREIGN KEY (ITEM_CODIGO) REFERENCES
TBPRODUTO (COD);

/*------ 16/02/2015 19:08:18 --------*/

ALTER TABLE TBSOLICITACAO_ITEM ADD CONSTRAINT FK_TBSOLICITACAO_ITEM_UND FOREIGN KEY (UNIDADE) REFERENCES
TBUNIDADEPROD (UNP_COD);

/*------ 16/02/2015 19:08:33 --------*/

CREATE VIEW VW_TIPO_SOLICITACAO(
    CODIGO,
    DESCRICAO)
AS
Select 1 as Codigo , 'Compras'          as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Serviços'         as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Compras/Serviços' as Descricao from RDB$DATABASE;

/*------ 16/02/2015 19:08:44 --------*/

CREATE VIEW VW_STATUS_SOLICITACAO (
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Em Edição/Aberta' as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Finalizada'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Enviada'   as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Aprovada'  as Descricao from RDB$DATABASE Union
Select 4 as Codigo , 'Cancelada' as Descricao from RDB$DATABASE;GRANT ALL ON VW_TIPO_SOLICITACAO TO "PUBLIC";
GRANT ALL ON VW_STATUS_SOLICITACAO TO "PUBLIC";
GRANT ALL ON TBSOLICITACAO TO "PUBLIC";
GRANT ALL ON TBSOLICITACAO_ITEM TO "PUBLIC";



/*------ SYSDBA 16/02/2015 19:12:53 --------*/

CREATE SEQUENCE GEN_SOLICITACAO_2015;

COMMENT ON SEQUENCE GEN_SOLICITACAO_2015 IS 'Sequenciador de solicitacoes do setor Almoxarifado para o Compras em 2015.';

CREATE SEQUENCE GEN_SOLICITACAO_2016;

COMMENT ON SEQUENCE GEN_SOLICITACAO_2016 IS 'Sequenciador de solicitacoes do setor Almoxarifado para o Compras em 2016.';

CREATE SEQUENCE GEN_SOLICITACAO_2017;

COMMENT ON SEQUENCE GEN_SOLICITACAO_2017 IS 'Sequenciador de solicitacoes do setor Almoxarifado para o Compras em 2017.';

CREATE SEQUENCE GEN_SOLICITACAO_2018;

COMMENT ON SEQUENCE GEN_SOLICITACAO_2018 IS 'Sequenciador de solicitacoes do setor Almoxarifado para o Compras em 2018';

CREATE SEQUENCE GEN_SOLICITACAO_2019;

COMMENT ON SEQUENCE GEN_SOLICITACAO_2019 IS 'Sequenciador de solicitacoes do setor Almoxarifado para o Compras em 2019.';

CREATE SEQUENCE GEN_SOLICITACAO_2020;

COMMENT ON SEQUENCE GEN_SOLICITACAO_2020 IS 'Sequenciador de solicitacoes do setor Almoxarifado para o Compras em 2020.';




/*------ SYSDBA 16/02/2015 19:15:33 --------*/

CREATE INDEX IDX_TBSOLICITACAO_STATUS
ON TBSOLICITACAO (STATUS);

CREATE INDEX IDX_TBSOLICITACAO_DATA
ON TBSOLICITACAO (DATA_EMISSAO);

CREATE INDEX IDX_TBSOLICITACAO_TIPO
ON TBSOLICITACAO (TIPO);

CREATE INDEX IDX_TBSOLICITACAO_EMP
ON TBSOLICITACAO (EMPRESA);




/*------ SYSDBA 16/02/2015 19:25:00 --------*/

COMMENT ON COLUMN TBSOLICITACAO.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Finalizada
3 - Enviada
4 - Aprovada
5 - Cancelada';




/*------ SYSDBA 16/02/2015 19:25:35 --------*/

DROP VIEW VW_STATUS_SOLICITACAO;

CREATE VIEW VW_STATUS_SOLICITACAO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Em Edição'    as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Aberta'       as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Finalizada'   as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Enviada'   as Descricao from RDB$DATABASE Union
Select 4 as Codigo , 'Aprovada'  as Descricao from RDB$DATABASE Union
Select 5 as Codigo , 'Cancelada' as Descricao from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_STATUS_SOLICITACAO TO "PUBLIC";




/*------ SYSDBA 18/02/2015 11:19:28 --------*/

CREATE INDEX IDX_TBPRODUTO_ALIQUOTA_TIPO
ON TBPRODUTO (ALIQUOTA_TIPO);




/*------ SYSDBA 19/02/2015 18:26:16 --------*/

ALTER TABLE TBSOLICITACAO_ITEM
    ADD CENTRO_CUSTO DMN_BIGINT_N;

COMMENT ON COLUMN TBSOLICITACAO_ITEM.CENTRO_CUSTO IS
'Centro de Custo';

alter table TBSOLICITACAO_ITEM
alter ANO position 1;

alter table TBSOLICITACAO_ITEM
alter CODIGO position 2;

alter table TBSOLICITACAO_ITEM
alter SEQ position 3;

alter table TBSOLICITACAO_ITEM
alter CENTRO_CUSTO position 4;

alter table TBSOLICITACAO_ITEM
alter ITEM_CODIGO position 5;

alter table TBSOLICITACAO_ITEM
alter ITEM_DESCRICAO position 6;

alter table TBSOLICITACAO_ITEM
alter ITEM_CADASTRADO position 7;

alter table TBSOLICITACAO_ITEM
alter QUANTIDADE position 8;

alter table TBSOLICITACAO_ITEM
alter UNIDADE position 9;

alter table TBSOLICITACAO_ITEM
alter USUARIO position 10;




/*------ SYSDBA 19/02/2015 18:26:36 --------*/

ALTER TABLE TBSOLICITACAO_ITEM
ADD CONSTRAINT FK_TBSOLICITACAO_ITEM_CCU
FOREIGN KEY (CENTRO_CUSTO)
REFERENCES TBCENTRO_CUSTO(CODIGO);




/*------ SYSDBA 19/02/2015 20:14:34 --------*/

SET TERM ^ ;

CREATE trigger tg_solicitacao_codigo for tbsolicitacao
active before insert position 0
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

COMMENT ON TRIGGER TG_SOLICITACAO_CODIGO IS 'Trigger Nova Solicitacao de Compra/Servico.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/02/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de solicitacao de compra e/ou servico no ano.';




/*------ SYSDBA 19/02/2015 20:16:02 --------*/

SET TERM ^ ;

CREATE trigger tg_solicitacao_competencia for tbsolicitacao
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

COMMENT ON TRIGGER TG_SOLICITACAO_COMPETENCIA IS 'Trigger Competencia Solicitacao

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/02/2015

Trigger responsavel por identificar a competencia da solicitaao quando esta nao for informada, baseando-se na data de
emissao.';


/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.ANO.
At line 24, column 68.

*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
X.EMPRESA.
At line 24, column 102.

*/



/*------ SYSDBA 19/02/2015 20:45:18 --------*/

COMMENT ON COLUMN TBSOLICITACAO.STATUS IS
'Status:
0 - Em edicao
1 - Aberta
2 - Finalizada
3 - Aprovada
4 - Cancelada';




/*------ SYSDBA 19/02/2015 21:09:00 --------*/

DROP VIEW VW_STATUS_SOLICITACAO;

CREATE VIEW VW_STATUS_SOLICITACAO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo , 'Em Edição'    as Descricao from RDB$DATABASE Union
Select 1 as Codigo , 'Aberta'       as Descricao from RDB$DATABASE Union
Select 2 as Codigo , 'Finalizada'   as Descricao from RDB$DATABASE Union
Select 3 as Codigo , 'Aprovada'  as Descricao from RDB$DATABASE Union
Select 4 as Codigo , 'Cancelada' as Descricao from RDB$DATABASE
;

GRANT SELECT, UPDATE, DELETE, INSERT, REFERENCES ON VW_STATUS_SOLICITACAO TO "PUBLIC";


/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
S.DESCRICAO_RESUMO.
At line 6, column 7.

*/



/*------ SYSDBA 19/02/2015 23:42:33 --------*/

CREATE INDEX IDX_TBSOLICITACAO_NUMERO
ON TBSOLICITACAO (NUMERO);




/*------ SYSDBA 21/02/2015 09:28:13 --------*/

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
  declare variable preco_venda DMN_MONEY;
  declare variable percentual_markup DMN_PERCENTUAL_3;
  declare variable percentual_margem DMN_PERCENTUAL_3;
  declare variable alterar_custo Smallint;
  declare variable estoque_unico Smallint;
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

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

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




/*------ SYSDBA 21/02/2015 09:29:57 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
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

  end 
end^

SET TERM ; ^




/*------ SYSDBA 21/02/2015 09:30:47 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable reserva    DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable estoque_unico Smallint;
  declare variable Movimentar Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Buscar FLAG de estoque unico
    Select
      cnf.estoque_unico_empresas
    from TBCONFIGURACAO cnf
    where cnf.empresa = new.codemp
    Into
      estoque_unico;

    estoque_unico = coalesce(:estoque_unico, 0);

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




/*------ SYSDBA 21/02/2015 09:31:41 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
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




/*------ SYSDBA 21/02/2015 09:32:21 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
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




/*------ SYSDBA 21/02/2015 09:33:06 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
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
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 21/02/2015 09:33:52 --------*/

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




/*------ SYSDBA 21/02/2015 09:35:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable unidade_cns DMN_SMALLINT_N;
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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , p.codunidade_fracionada
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod  = :Produto);

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

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
          , :quantidade * :fracionador
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then :custo_produto
            else ( ((:custo_cc * :estoque_cc) + (:custo_produto * :quantidade)) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + :quantidade
          , ea.custo_medio = :custo_medio
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 21/02/2015 09:36:46 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
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
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
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
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1) -- Quantidade fracionada transformada em inteira
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , fracionador;

      estoque_cc = coalesce(:estoque_cc, 0.0) - :quantidade;

      Update TBESTOQUE_ALMOX ea Set
          ea.qtde  = :estoque_cc / :fracionador -- Quantidade fracionada
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




/*------ SYSDBA 21/02/2015 10:09:43 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
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




/*------ SYSDBA 21/02/2015 10:46:07 --------*/

ALTER TABLE TBINVENTARIO_ALMOX DROP CONSTRAINT FK_TBINVENTARIO_ALMOX_CCU;




/*------ SYSDBA 21/02/2015 10:46:15 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BIGINT_N'
where (RDB$FIELD_NAME = 'CENTRO_CUSTO') and
(RDB$RELATION_NAME = 'TBINVENTARIO_ALMOX')
;




/*------ SYSDBA 21/02/2015 10:46:35 --------*/

ALTER TABLE TBINVENTARIO_ALMOX
ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_CCU
FOREIGN KEY (CENTRO_CUSTO)
REFERENCES TBCENTRO_CUSTO(CODIGO);




/*------ SYSDBA 21/02/2015 10:50:26 --------*/

ALTER TABLE TBINVENTARIO_ALMOX DROP CONSTRAINT FK_TBINVENTARIO_ALMOX_CCU;




/*------ SYSDBA 21/02/2015 10:50:35 --------*/

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = NULL
where (RDB$FIELD_NAME = 'CENTRO_CUSTO') and
(RDB$RELATION_NAME = 'TBINVENTARIO_ALMOX')
;




/*------ SYSDBA 21/02/2015 10:51:01 --------*/

ALTER TABLE TBINVENTARIO_ALMOX
ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_CNT
FOREIGN KEY (CENTRO_CUSTO)
REFERENCES TBCENTRO_CUSTO(CODIGO);




/*------ SYSDBA 24/02/2015 10:22:26 --------*/

ALTER TABLE TBVENDAS
    ADD CAIXA_ANO DMN_SMALLINT_N,
    ADD CAIXA_NUM DMN_INTEGER_N;

COMMENT ON COLUMN TBVENDAS.CAIXA_ANO IS
'Ano do Caixa de movimento.';

COMMENT ON COLUMN TBVENDAS.CAIXA_NUM IS
'Numero do Caixa de movimento.';




/*------ SYSDBA 24/02/2015 10:23:00 --------*/

ALTER TABLE TBVENDAS
ADD CONSTRAINT FK_TBVENDAS_CAIXA
FOREIGN KEY (CAIXA_ANO,CAIXA_NUM)
REFERENCES TBCAIXA(ANO,NUMERO);




/*------ SYSDBA 24/02/2015 12:00:14 --------*/

ALTER TABLE TBVENDAS
    ADD CAIXA_PDV DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBVENDAS.CAIXA_PDV IS
'Movimento de caixa finalizado no PDV:
0 - Nao
1 - Sim';




/*------ SYSDBA 24/02/2015 12:02:10 --------*/

CREATE INDEX IDX_TBVENDAS_CAIXA_PDV
ON TBVENDAS (CAIXA_PDV);




/*------ SYSDBA 24/02/2015 12:02:29 --------*/

ALTER TABLE TBVENDAS ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBVENDAS') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBVENDAS') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBVENDAS') AND
      (F1.RDB$FIELD_NAME = 'CAIXA_PDV');

ALTER TABLE TBVENDAS DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 24/02/2015 14:32:38 --------*/

SET TERM ^ ;

CREATE trigger tg_vendas_caixa for tbvendas
active before insert or update position 6
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




/*------ SYSDBA 24/02/2015 14:33:56 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_caixa for tbvendas
active before insert or update position 6
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

COMMENT ON TRIGGER TG_VENDAS_CAIXA IS 'Trigger Identificar Caixa PDV (Venda).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   24/02/2015

Trigger responsavel por manter a integridades de dados en relacao ao caixa do PDV.';




/*------ SYSDBA 24/02/2015 14:35:54 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/08/2014 - IMR:
        + Criacao do campo DESCONTO_CUPOM para armazenar o valor de desconto concedido no PDV (Novo sistema em
          desenvolvimento).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    24/02/2015 - IMR:
        + Criacao dos campos CAIXA_ANO, CAIXA_NUM e CAIXA_PDV para facilitar a identificacao de vendas realizadas, mas
          que ainda nao geraram movimentacao de caixa, nos caixas do usuarios.';




/*------ SYSDBA 27/02/2015 13:13:45 --------*/

SET TERM ^ ;

create or alter procedure SET_ATUALIZAR_CUSTO_PRODUTO (
    PRODUTO DMN_VCHAR_10_KEY,
    VALOR_CUSTO DMN_MONEY,
    SISTEMA DMN_SMALLINT_N)
as
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Abandonar o procedimento, caso o custo informado seja 0 (zero)
  if ( coalesce(:valor_custo, 0.0) <= 0 ) then
    Exit;

  if (not exists(
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
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_ATUALIZAR_CUSTO_PRODUTO TO "PUBLIC";



/*------ SYSDBA 27/02/2015 13:39:39 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ATUALIZAR_CUSTO_PRODUTO (
    PRODUTO DMN_VCHAR_10_KEY,
    VALOR_CUSTO DMN_MONEY,
    SISTEMA DMN_SMALLINT_N)
as
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Abandonar o procedimento, caso o custo informado seja 0 (zero)
  if ( coalesce(:valor_custo, 0.0) <= 0 ) then
    Exit;

  if (not exists(
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
end^

SET TERM ; ^




/*------ SYSDBA 27/02/2015 13:51:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ATUALIZAR_CUSTO_PRODUTO (
    PRODUTO DMN_VCHAR_10_KEY,
    VALOR_CUSTO DMN_MONEY,
    SISTEMA DMN_SMALLINT_N)
as
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Abandonar o procedimento, caso o custo informado seja 0 (zero)
  if ( coalesce(:valor_custo, 0.0) <= 0 ) then
    Exit;

  if (not exists(
    Select
      p.codigo
    from TBPRODUTO p
    where p.cod = :produto
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
end^

SET TERM ; ^




/*------ SYSDBA 27/02/2015 13:51:21 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ATUALIZAR_CUSTO_PRODUTO (
    PRODUTO DMN_VCHAR_10_KEY,
    VALOR_CUSTO DMN_MONEY,
    SISTEMA DMN_SMALLINT_N)
as
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
end^

SET TERM ; ^




/*------ SYSDBA 10/03/2015 22:03:50 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_COMPETENCIA (
    NUMERO integer,
    DESCRICAO varchar(50))
as
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
end^

SET TERM ; ^




/*------ SYSDBA 10/03/2015 22:13:28 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_COMPETENCIA (
    NUMERO integer,
    DESCRICAO varchar(50))
as
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
end^

SET TERM ; ^




/*------ SYSDBA 11/03/2015 19:51:55 --------*/

SET TERM ^ ;

create or alter procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
declare variable LOGIN DMN_USUARIO;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' ',     '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
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
      , 'x|xxx'
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
end^

SET TERM ; ^




/*------ SYSDBA 11/03/2015 19:55:48 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
declare variable LOGIN DMN_USUARIO;
declare variable COMMON_USER DMN_SMALLINT_N;
begin
  common_user = 13;

  -- Limpar Nome Completo para montar Login
  login = coalesce(trim(:nome_completo), '');
  login = replace(:login, ' ',     '');
  login = replace(:login, ' E ',   '');
  login = replace(:login, ' DA ',  '');
  login = replace(:login, ' DE ',  '');
  login = replace(:login, ' DI ',  '');
  login = replace(:login, ' DO ',  '');
  login = replace(:login, ' DAS ', '');
  login = replace(:login, ' DOS ', '');
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
      , 'x|xxx'
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
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_USUARIO_FUNCIONARIO IS 'Procedure SET Usuario x Funcionario.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Store procedure responsavel por cadastrar gerar um registro de usuario correspondente ao nome completo do funcionario
informado atraves do sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    12/03/2015 - IMR :
        * Documentacao da procedure.';

GRANT EXECUTE ON PROCEDURE SET_USUARIO_FUNCIONARIO TO "PUBLIC";



/*------ SYSDBA 11/03/2015 19:57:54 --------*/

ALTER TABLE TBVENDEDOR ADD IBE$$TEMP_COLUMN
 NUMERIC(1,1) DEFAULT 0.0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBVENDEDOR') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBVENDEDOR') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBVENDEDOR') AND
      (F1.RDB$FIELD_NAME = 'COMISSAO');

ALTER TABLE TBVENDEDOR DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 11/03/2015 19:58:06 --------*/

ALTER TABLE TBVENDEDOR ADD IBE$$TEMP_COLUMN
 NUMERIC(1,1) DEFAULT 0.0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBVENDEDOR') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBVENDEDOR') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBVENDEDOR') AND
      (F1.RDB$FIELD_NAME = 'COMISSAO_VL');

ALTER TABLE TBVENDEDOR DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 11/03/2015 20:01:05 --------*/

ALTER TABLE TBVENDEDOR
    ADD CODIGO_FUNCIONARIO DMN_INTEGER_N;

COMMENT ON COLUMN TBVENDEDOR.CODIGO_FUNCIONARIO IS
'Registro do Funcionario';




/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column COD position 1;


/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column NOME position 2;


/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column CPF position 3;


/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column COMISSAO position 4;


/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column COMISSAO_VL position 5;


/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column ATIVO position 6;


/*------ SYSDBA 11/03/2015 20:01:12 --------*/

alter table TBVENDEDOR
alter column CODIGO_FUNCIONARIO position 7;


/*------ SYSDBA 11/03/2015 20:09:09 --------*/

ALTER TABLE TBVENDEDOR DROP CODIGO_FUNCIONARIO;




/*------ SYSDBA 11/03/2015 20:09:31 --------*/

SET TERM ^ ;

create or alter procedure SET_VENDEDOR_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    CPF DMN_CPF,
    ATIVO DMN_LOGICO)
returns (
    CODIGO_VENDEDOR DMN_INTEGER_N)
as
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
end^

SET TERM ; ^




/*------ SYSDBA 11/03/2015 20:10:11 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_VENDEDOR_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    CPF DMN_CPF,
    ATIVO DMN_LOGICO)
returns (
    CODIGO_VENDEDOR DMN_INTEGER_N)
as
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
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_VENDEDOR_FUNCIONARIO IS 'Procedure SET Vendedor x Funcionario.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Store procedure responsavel por cadastrar gerar um registro de vendedor correspondente ao CPF do funcionario
informado atraves do sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    12/03/2015 - IMR :
        * Documentacao da procedure.';

GRANT EXECUTE ON PROCEDURE SET_VENDEDOR_FUNCIONARIO TO "PUBLIC";



/*------ SYSDBA 11/03/2015 20:13:48 --------*/

CREATE DOMAIN DMN_SEXO AS
VARCHAR(1)
DEFAULT 'M'
NOT NULL
CHECK ((value = 'F') or (value = 'M'));COMMENT ON DOMAIN DMN_SEXO IS 'Sexo:
M- Masculino
F - Feminino';




/*------ SYSDBA 11/03/2015 20:15:00 --------*/

CREATE DOMAIN DMN_IMAGEM AS
BLOB SUB_TYPE 0 SEGMENT SIZE 80;


/*------ SYSDBA 11/03/2015 20:21:14 --------*/

CREATE TABLE TBFUNCIONARIO (
    CODIGO DMN_BIGINT_NN NOT NULL,
    MATRICULA DMN_VCHAR_10,
    NOME_COMPLETO DMN_NOME,
    SEXO DMN_SEXO,
    FOTO_3X4 DMN_IMAGEM,
    FLAG_VENDEDOR DMN_LOGICO DEFAULT 0,
    ATIVO DMN_LOGICO DEFAULT 1,
    USUARIO DMN_USUARIO,
    VENDEDOR DMN_INTEGER_N);

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT PK_TBFUNCIONARIO
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN TBFUNCIONARIO.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBFUNCIONARIO.MATRICULA IS
'Matricula';

COMMENT ON COLUMN TBFUNCIONARIO.NOME_COMPLETO IS
'Nome Completo';

COMMENT ON COLUMN TBFUNCIONARIO.SEXO IS
'Sexo:
M- Masculino
F - Feminino';

COMMENT ON COLUMN TBFUNCIONARIO.FOTO_3X4 IS
'Foto 3x4 (Atual)';

COMMENT ON COLUMN TBFUNCIONARIO.FLAG_VENDEDOR IS
'Vendedor:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBFUNCIONARIO.ATIVO IS
'Ativo:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBFUNCIONARIO.USUARIO IS
'Login de acesso ao sistema.';

COMMENT ON COLUMN TBFUNCIONARIO.VENDEDOR IS
'Codigo do registro de vendedor.';




/*------ SYSDBA 11/03/2015 20:21:15 --------*/

COMMENT ON TABLE TBFUNCIONARIO IS 'Tabela de FUncionarios (SGI).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Tabela responsavel por armazenar o cadastro simplificado dos funcionarios da(s) empresa(s) registros pelo SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    12/03/2015 - IMR :
        * Documentacao da procedure.';

GRANT ALL ON TBFUNCIONARIO TO "PUBLIC";



/*------ SYSDBA 11/03/2015 20:23:13 --------*/

CREATE INDEX IDX_TBFUNCIONARIO_ATIVO
ON TBFUNCIONARIO (ATIVO);

CREATE INDEX IDX_TBFUNCIONARIO_VEND
ON TBFUNCIONARIO (FLAG_VENDEDOR);

CREATE INDEX IDX_TBFUNCIONARIO_SEXO
ON TBFUNCIONARIO (SEXO);

CREATE INDEX IDX_TBFUNCIONARIO_MATRICULA
ON TBFUNCIONARIO (MATRICULA);




/*------ SYSDBA 11/03/2015 20:24:55 --------*/

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME)
ON DELETE SET NULL;

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_VENDEDOR
FOREIGN KEY (VENDEDOR)
REFERENCES TBVENDEDOR(COD)
ON DELETE SET NULL;




/*------ SYSDBA 11/03/2015 20:25:40 --------*/

CREATE SEQUENCE GEN_FUNCIONARIO;




/*------ SYSDBA 11/03/2015 20:26:02 --------*/

DROP SEQUENCE GEN_FUNCIONARIO;

CREATE SEQUENCE GEN_FUNCIONARIO_COD;




/*------ SYSDBA 11/03/2015 20:27:05 --------*/

SET TERM ^ ;

CREATE trigger tg_funcionario_codigo for tbfuncionario
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_FUNCIONARIO_COD, 1);
end^

SET TERM ; ^




/*------ SYSDBA 11/03/2015 20:28:08 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_codigo for tbfuncionario
active before insert position 0
AS
begin
  if ( new.codigo is null ) then
    new.codigo = GEN_ID(GEN_FUNCIONARIO_COD, 1);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_FUNCIONARIO_CODIGO IS 'Trigger Novo Codigo Funcionario.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Trigger responsavel por gerar um sequencial unico para cada novo registro de funcionario.';




/*------ SYSDBA 11/03/2015 20:29:37 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD FLAG_FORNECEDOR DMN_LOGICO;

COMMENT ON COLUMN TBFUNCIONARIO.FLAG_FORNECEDOR IS
'Apresentar como Fornecedor:
0 - Nao
1 - Sim';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter MATRICULA position 2;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 3;

alter table TBFUNCIONARIO
alter SEXO position 4;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 5;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 6;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 7;

alter table TBFUNCIONARIO
alter ATIVO position 8;

alter table TBFUNCIONARIO
alter USUARIO position 9;

alter table TBFUNCIONARIO
alter VENDEDOR position 10;




/*------ SYSDBA 11/03/2015 20:29:45 --------*/

ALTER TABLE TBFUNCIONARIO ADD IBE$$TEMP_COLUMN
 SMALLINT DEFAULT 0
;

UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'TBFUNCIONARIO') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'TBFUNCIONARIO') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'TBFUNCIONARIO') AND
      (F1.RDB$FIELD_NAME = 'FLAG_FORNECEDOR');

ALTER TABLE TBFUNCIONARIO DROP IBE$$TEMP_COLUMN;




/*------ SYSDBA 11/03/2015 20:31:27 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD FORNECEDOR DMN_INTEGER_N;

COMMENT ON COLUMN TBFUNCIONARIO.FORNECEDOR IS
'Codigo do registro de fornecedor.';




/*------ SYSDBA 11/03/2015 20:31:48 --------*/

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_FORNECEDOR
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN)
ON DELETE SET NULL;




/*------ SYSDBA 11/03/2015 20:33:24 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD METAFONEMA DMN_NOME;

COMMENT ON COLUMN TBFUNCIONARIO.METAFONEMA IS
'Codigo metafonico do nome completo.';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter MATRICULA position 2;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 3;

alter table TBFUNCIONARIO
alter METAFONEMA position 4;

alter table TBFUNCIONARIO
alter SEXO position 5;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 6;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 7;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 8;

alter table TBFUNCIONARIO
alter ATIVO position 9;

alter table TBFUNCIONARIO
alter USUARIO position 10;

alter table TBFUNCIONARIO
alter VENDEDOR position 11;

alter table TBFUNCIONARIO
alter FORNECEDOR position 12;




/*------ SYSDBA 11/03/2015 20:33:47 --------*/

CREATE INDEX IDX_TBFUNCIONARIO_METAPHONE
ON TBFUNCIONARIO (NOME_COMPLETO,METAFONEMA);




/*------ SYSDBA 11/03/2015 20:40:42 --------*/

CREATE TABLE TBFORMPAGTO_CONDICAO (
    FORMA_PAGTO DMN_SMALLINT_NN NOT NULL,
    CONDICAO_PAGTO DMN_SMALLINT_NN NOT NULL);

ALTER TABLE TBFORMPAGTO_CONDICAO
ADD CONSTRAINT PK_TBFORMPAGTO_CONDICAO
PRIMARY KEY (FORMA_PAGTO,CONDICAO_PAGTO);

COMMENT ON COLUMN TBFORMPAGTO_CONDICAO.FORMA_PAGTO IS
'Forma de Pagamento';

COMMENT ON COLUMN TBFORMPAGTO_CONDICAO.CONDICAO_PAGTO IS
'Condicao de Pagamento';




/*------ SYSDBA 11/03/2015 20:40:43 --------*/

COMMENT ON TABLE TBFORMPAGTO_CONDICAO IS 'Tabela Forma de Pagamento x Condicao de Pagamento.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Tabela responsavel por armazenar a relacao "Forma de Pagamento" X "Condicao de Pagamento". Ela permitira que uma forma de
pagamento possa esta associada a mais de uma condicao de pagamento e uma condicao de pagamento associada a varias formas
de pagamentos.

Esta relacao e importante para impedir que, no PDV, escolha-se uma condicao de pagamento inadequada a forma de pagamento
da venda.



Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    12/03/2015 - IMR :
        * Documentacao da tabela.';

GRANT ALL ON TBFORMPAGTO_CONDICAO TO "PUBLIC";



/*------ SYSDBA 11/03/2015 20:41:38 --------*/

ALTER TABLE TBFORMPAGTO_CONDICAO
ADD CONSTRAINT FK_TBFORMPAGTO_CONDICAO_FPGTO
FOREIGN KEY (FORMA_PAGTO)
REFERENCES TBFORMPAGTO(COD)
ON DELETE CASCADE;

ALTER TABLE TBFORMPAGTO_CONDICAO
ADD CONSTRAINT FK_TBFORMPAGTO_CONDICAO_CPGTO
FOREIGN KEY (CONDICAO_PAGTO)
REFERENCES TBCONDICAOPAGTO(COND_COD)
ON DELETE CASCADE;




/*------ SYSDBA 11/03/2015 23:33:06 --------*/

CREATE DOMAIN DMN_VCHAR_05 AS
VARCHAR(5);


/*------ SYSDBA 11/03/2015 23:37:16 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD ENDER DMN_END,
    ADD NUMERO_END DMN_VCHAR_10,
    ADD COMPLEMENTO DMN_VCHAR_50,
    ADD BAIRRO DMN_BAIRRO,
    ADD CEP DMN_CEP,
    ADD CIDADE DMN_CIDADE,
    ADD UF DMN_UF,
    ADD TLG_TIPO DMN_SMALLINT_N,
    ADD LOG_COD DMN_INTEGER_N,
    ADD BAI_COD DMN_INTEGER_N,
    ADD CID_COD DMN_INTEGER_N,
    ADD EST_COD DMN_SMALLINT_N,
    ADD PAIS_ID DMN_VCHAR_05,
    ADD FONE_FIXO DMN_FONERSD,
    ADD FONE_CELULAR DMN_FONERSD,
    ADD FONE_COMERCIAL DMN_FONERSD,
    ADD EMAIL DMN_VCHAR_60;

COMMENT ON COLUMN TBFUNCIONARIO.ENDER IS
'Endereco';

COMMENT ON COLUMN TBFUNCIONARIO.NUMERO_END IS
'Numero Endereco';

COMMENT ON COLUMN TBFUNCIONARIO.COMPLEMENTO IS
'Complemento';

COMMENT ON COLUMN TBFUNCIONARIO.BAIRRO IS
'Bairro';

COMMENT ON COLUMN TBFUNCIONARIO.CEP IS
'CEP';

COMMENT ON COLUMN TBFUNCIONARIO.CIDADE IS
'Cidade';

COMMENT ON COLUMN TBFUNCIONARIO.UF IS
'UF';

COMMENT ON COLUMN TBFUNCIONARIO.TLG_TIPO IS
'Tipo Logradouro';

COMMENT ON COLUMN TBFUNCIONARIO.LOG_COD IS
'Logradouro';

COMMENT ON COLUMN TBFUNCIONARIO.BAI_COD IS
'Bairro';

COMMENT ON COLUMN TBFUNCIONARIO.CID_COD IS
'Cidade';

COMMENT ON COLUMN TBFUNCIONARIO.EST_COD IS
'Estado';

COMMENT ON COLUMN TBFUNCIONARIO.PAIS_ID IS
'Pais';

COMMENT ON COLUMN TBFUNCIONARIO.FONE_FIXO IS
'Telefone Fixo';

COMMENT ON COLUMN TBFUNCIONARIO.FONE_CELULAR IS
'Telefone Celular';

COMMENT ON COLUMN TBFUNCIONARIO.FONE_COMERCIAL IS
'Telefone Comercial';

COMMENT ON COLUMN TBFUNCIONARIO.EMAIL IS
'E-mail';




/*------ SYSDBA 11/03/2015 23:41:10 --------*/

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_END_TIPOLOG
FOREIGN KEY (TLG_TIPO)
REFERENCES TBTIPO_LOGRADOURO(TLG_COD);

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_END_LOG
FOREIGN KEY (LOG_COD)
REFERENCES TBLOGRADOURO(LOG_COD);

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_END_BAIRRO
FOREIGN KEY (BAI_COD)
REFERENCES TBBAIRRO(BAI_COD);

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_END_CIDADE
FOREIGN KEY (CID_COD)
REFERENCES TBCIDADE(CID_COD);

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_END_ESTADO
FOREIGN KEY (EST_COD)
REFERENCES TBESTADO(EST_COD);

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_END_PAIS
FOREIGN KEY (PAIS_ID)
REFERENCES TBPAIS(PAIS_ID);




/*------ SYSDBA 15/03/2015 10:25:06 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_nfe_atualizar_compra for tbnfe_enviada
active after insert position 1
AS
begin
  if ( (new.anocompra > 0) and (new.numcompra > 0) ) then
  begin
    Update TBCOMPRAS c Set
        c.nfserie = new.serie
      , c.nf      = new.numero
      , c.nfe_enviada      = 1
      , c.tipo_documento   = 1 -- Nota Fiscal
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




/*------ SYSDBA 15/03/2015 10:45:09 --------*/

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




/*------ SYSDBA 15/03/2015 10:45:51 --------*/

CREATE INDEX IDX_TBCONTREC_PARCELA
ON TBCONTREC (FORMA_PAGTO,PARCELA);




/*------ SYSDBA 15/03/2015 10:46:02 --------*/

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




/*------ SYSDBA 15/03/2015 10:46:36 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_DUPLICATA_PAGAR (
    ANOCOMPRA smallint,
    NUMCOMPRA integer,
    FORNECEDOR integer,
    NF integer,
    FORMA_PAGTO smallint,
    CONDICAO_PAGTO smallint,
    EMISSAO date,
    VENCIMENTO date,
    VALOR_DOCUMENTO numeric(15,2),
    PARCELA smallint,
    TIPO_DESPESA smallint)
returns (
    ANOLANCAMENTO smallint,
    NUMLANCAMENTO integer)
as
declare variable EMPRESA DMN_CNPJ;
declare variable EMPRESA_NOME DMN_VCHAR_60;
declare variable FORMA_PAGTO_DESC DMN_VCHAR_30;
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
    , :Valor_documento
    , :Valor_documento
    , 0
    , 1
  );

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 16/03/2015 18:29:33 --------*/

DROP INDEX IDX_TBFUNCIONARIO_MATRICULA;




/*------ SYSDBA 16/03/2015 18:29:40 --------*/

ALTER TABLE TBFUNCIONARIO DROP MATRICULA;



/*------ 20/03/2015 14:42:40 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable unidade_cns DMN_SMALLINT_N;
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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , p.codunidade_fracionada
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod  = :Produto);

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

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
          , :quantidade * :fracionador
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador
        );

      end
      else
      begin

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + (:quantidade * :fracionador)
          , ea.custo_medio = :custo_medio
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

/*------ 20/03/2015 14:42:40 --------*/

SET TERM ; ^

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
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
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
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
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1) -- Quantidade fracionada transformada em inteira
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc   -- Quantidade Inteira
        , fracionador; -- Fracionador

      estoque_cc = coalesce(:estoque_cc, 0.0) - :quantidade;

      Update TBESTOQUE_ALMOX ea Set
          ea.qtde  = :estoque_cc * :fracionador -- Quantidade fracionada
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

/*------ 20/03/2015 14:42:40 --------*/

SET TERM ; ^


/*------ SYSDBA 20/03/2015 14:48:21 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
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
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
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
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc   -- Quantidade Inteira
        , fracionador; -- Fracionador

      estoque_cc = coalesce(:estoque_cc, 0.0) - :quantidade;

      Update TBESTOQUE_ALMOX ea Set
          ea.qtde  = :estoque_cc * :fracionador -- Devolvendo a quantidade fracionada atualizada
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




/*------ SYSDBA 20/03/2015 14:49:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque     DMN_QUANTIDADE_D3;
  declare variable estoque_cc  DMN_QUANTIDADE_D3;
  declare variable quantidade  DMN_QUANTIDADE_D3;
  declare variable fracionador DMN_PERCENTUAL_3;
  declare variable unidade_cns DMN_SMALLINT_N;
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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
        , coalesce(nullif(p.fracionador, 0), 1)
        , p.codunidade_fracionada
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , Movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
      where (p.Cod  = :Produto);

      -- Verificar se ja existe estoque para o Centro de Custo
      Select
          ea.qtde
        , ea.custo_medio
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc
        , custo_cc;

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

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc  = coalesce(:estoque_cc, 0.0);
        custo_cc    = coalesce(:custo_cc, 0.0);
        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                                          -- Informando o custo medio fracionado anteriormente
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
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 20/03/2015 14:51:06 --------*/

COMMENT ON DOMAIN DMN_SEXO IS 'Sexo:
M - Masculino
F - Feminino';

