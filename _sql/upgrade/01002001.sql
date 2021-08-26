/* Create Domains... 01002001.sql */
CREATE DOMAIN DMN_LONGINT AS BIGINT;

DESCRIBE DOMAIN DMN_LONGINT
'Inteiro longo';

CREATE DOMAIN DMN_LONGINT_NN AS BIGINT NOT NULL;

DESCRIBE DOMAIN DMN_LONGINT_NN
'Inteiro longo (Nao nulo)';

CREATE DOMAIN DMN_TIPO_2 AS SMALLINT DEFAULT 0 NOT NULL CHECK(value between 0 and 2);

DESCRIBE DOMAIN DMN_TIPO_2
'0 - A Definir
1 -
2 -';

/* Create Table... */
CREATE TABLE SYS_UPGRADE(SIS_COD DMN_SMALLINT_NN NOT NULL,
SIS_VERSION DMN_LONGINT_NN NOT NULL,
UPGRADE_SQL DMN_TEXTO,
UPGRADE_DATA DMN_DATE,
UPGRADE_ERROR DMN_TEXTO,
UPGRADE_OK DMN_LOGICO);


DESCRIBE TABLE SYS_UPGRADE
'Tabela Upgrade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os scripts de upgrade da base de dados a cada
nova atualizacao do(s) sistema(s).';

DESCRIBE FIELD SIS_COD TABLE SYS_UPGRADE
'Sistema';

DESCRIBE FIELD SIS_VERSION TABLE SYS_UPGRADE
'Versao';

DESCRIBE FIELD UPGRADE_SQL TABLE SYS_UPGRADE
'Script SQL';

DESCRIBE FIELD UPGRADE_DATA TABLE SYS_UPGRADE
'Data de execucao';

DESCRIBE FIELD UPGRADE_ERROR TABLE SYS_UPGRADE
'LOG de Erro';

DESCRIBE FIELD UPGRADE_OK TABLE SYS_UPGRADE
'Execucao com sucesso:
0 - Nao
1 - Sim';

CREATE TABLE TBPRODUTO_CLIENTE(PRODUTO DMN_VCHAR_10_KEY NOT NULL,
CLIENTE DMN_INTEGER_NN NOT NULL,
REFERENCIA DMN_VCHAR_15);


DESCRIBE TABLE TBPRODUTO_CLIENTE
'Tabela de Referencia Produto x Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os codigos de referencia de cada produto na base
do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto na base.';

DESCRIBE FIELD PRODUTO TABLE TBPRODUTO_CLIENTE
'Produto';

DESCRIBE FIELD CLIENTE TABLE TBPRODUTO_CLIENTE
'Cliente';

DESCRIBE FIELD REFERENCIA TABLE TBPRODUTO_CLIENTE
'Referencia / Codigo Externo

Obs.: Codigo do produto na base do Cliente';


ALTER TABLE TBAJUSTESTOQ ADD SISTEMA DMN_SMALLINT_N;

UPDATE TBAJUSTESTOQ SET SISTEMA = 2 WHERE SISTEMA IS NULL;

DESCRIBE FIELD SISTEMA TABLE TBAJUSTESTOQ
'Sistema';

ALTER TABLE TBCFOP ADD CFOP_TIPO DMN_TIPO_2;

DESCRIBE FIELD CFOP_TIPO TABLE TBCFOP
'Tipo:
0 - A Definir
1 - Entrada
2 - Saida';

UPDATE TBCFOP
SET CFOP_TIPO = 0;

Update TBCFOP c Set c.cfop_tipo = 1 where c.cfop_cod < 4000;  -- Entrada;

Update TBCFOP c Set c.cfop_tipo = 2 where c.cfop_cod > 4000;  -- Saida;

ALTER TABLE TBCONFIGURACAO ADD NFE_IMPRIMIR_COD_REFERENTE DMN_LOGICO;

DESCRIBE FIELD NFE_IMPRIMIR_COD_REFERENTE TABLE TBCONFIGURACAO
'NF-e: Imprimir Referencia como Codigo do Produto no DANFE da NF-e:
0 - Nao
1 - Sim';

ALTER TABLE TBCONFIGURACAO ADD NFE_IMPRIMIR_COD_REFERENCIA DMN_LOGICO;

DESCRIBE FIELD NFE_IMPRIMIR_COD_REFERENCIA TABLE TBCONFIGURACAO
'NF-e: Imprimir Referencia como Codigo do Produto no DANFE da NF-e:
0 - Nao
1 - Sim';

ALTER TABLE TBINVENTARIO_ALMOX ADD SISTEMA DMN_SMALLINT_N;

DESCRIBE FIELD SISTEMA TABLE TBINVENTARIO_ALMOX
'Sistema';

ALTER TABLE TVENDASITENS ADD REFERENCIA DMN_VCHAR_15;

DESCRIBE FIELD REFERENCIA TABLE TVENDASITENS
'Referencia / Codigo externo (Importante para OPME) / Codigo do Produto no Cliente';

DESCRIBE TABLE SYS_LICENCA
'Tabela Licenca de Uso

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar, de forma criptografada, informacoes importantes
referentes a Licenca de Uso do sistema.';

DESCRIBE TABLE TBAJUSTESTOQ
'Tabela Ajuste Manual de Estoque

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar os dados necesarios aos ajustes de estoques
lancados manualmente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/03/2018 - IMR :
        + Criacao do campo SISTEMA para armazer o codigo do sistema responsavel
          pela abertura do registro.

    04/02/2014 - IMR :
        * Documentacao da tabela.';

DESCRIBE TABLE TBAPROPRIACAO_ALMOX
'Tabela de Apropriacao de Estoque (Almoxarifado)

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
        * Revisao da documentacao dos objetos.
          Esta apropriacao de estoque se aplica apenas ao sistema SGI.';

DESCRIBE TABLE TBINVENTARIO_ALMOX
'Tabela Inventario de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar todos os registros de inventarios de estoque realizados pelo sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/03/2018 - IMR :
        + Criacao do campo SISTEMA para armazer o codigo do sistema responsavel
          pela abertura do inventario. Isso permitira que o encerramento de comporte
          de forma diferente de acordo com o sistema de gestao responsavel.

    04/02/2014 - IMR :
        * Documentacao da tabela.';

UPDATE RDB$RELATION_FIELDS SET RDB$Collation_ID =
(Select C.Rdb$Collation_ID from Rdb$Collations C
where C.Rdb$Collation_Name='ISO8859_2'
 and C.Rdb$Character_Set_ID = (select Rdb$Character_Set_ID from Rdb$character_Sets where Rdb$character_set_name = 'ISO8859_2'))
  WHERE RDB$FIELD_NAME='BAI_NOME' AND RDB$RELATION_NAME='TBBAIRRO';

UPDATE RDB$RELATION_FIELDS SET RDB$Collation_ID =
(Select C.Rdb$Collation_ID from Rdb$Collations C
where C.Rdb$Collation_Name='ISO8859_2'
 and C.Rdb$Character_Set_ID = (select Rdb$Character_Set_ID from Rdb$character_Sets where Rdb$character_set_name = 'ISO8859_2'))
  WHERE RDB$FIELD_NAME='LOG_NOME' AND RDB$RELATION_NAME='TBLOGRADOURO';

DESCRIBE FIELD CODBARRA_EAN TABLE TBPRODUTO
'Codigo de Barras / Codigo Externo';

UPDATE RDB$RELATION_FIELDS SET RDB$Collation_ID =
(Select C.Rdb$Collation_ID from Rdb$Collations C
where C.Rdb$Collation_Name='ISO8859_2'
 and C.Rdb$Character_Set_ID = (select Rdb$Character_Set_ID from Rdb$character_Sets where Rdb$character_set_name = 'ISO8859_2'))
  WHERE RDB$FIELD_NAME='TLG_DESCRICAO' AND RDB$RELATION_NAME='TBTIPO_LOGRADOURO';

UPDATE RDB$RELATION_FIELDS SET RDB$Collation_ID =
(Select C.Rdb$Collation_ID from Rdb$Collations C
where C.Rdb$Collation_Name='ISO8859_2'
 and C.Rdb$Character_Set_ID = (select Rdb$Character_Set_ID from Rdb$character_Sets where Rdb$character_set_name = 'ISO8859_2'))
  WHERE RDB$FIELD_NAME='TLG_SIGLA' AND RDB$RELATION_NAME='TBTIPO_LOGRADOURO';

/* Create Procedure... */
SET TERM ^ ;

CREATE PROCEDURE SET_PRODUTO_CLIENTE(PRODUTO DMN_VCHAR_10,
CLIENTE DMN_INTEGER_N,
REFERENCIA DMN_VCHAR_15)
 AS
 BEGIN EXIT; END
^

SET TERM ; ^

DESCRIBE PROCEDURE SET_PRODUTO_CLIENTE
'Procedure SET Referencia Produto x Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Stored procedure responsavel inserir/atualizar o codigo de referencia do produto
na base do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto.';


/* Alter View (Drop, Create)... */
/* Drop altered view: VW_CONDICAOPAGTO */
DROP VIEW VW_CONDICAOPAGTO;

/* Create altered view: VW_CONDICAOPAGTO */
/* Create view: VW_CONDICAOPAGTO */
CREATE VIEW VW_CONDICAOPAGTO(
COND_COD,
COND_DESCRICAO,
COND_PRAZO,
COND_QTDE_PARCELAS,
COND_PRAZO_01,
COND_PRAZO_02,
COND_PRAZO_03,
COND_PRAZO_04,
COND_PRAZO_05,
COND_PRAZO_06,
COND_PRAZO_07,
COND_PRAZO_08,
COND_PRAZO_09,
COND_PRAZO_10,
COND_PRAZO_11,
COND_PRAZO_12,
COND_DESCRICAO_FULL,
COND_DESCRICAO_PDV,
COND_PDV,
ATIVA)
 AS 
Select
    c.Cond_cod
  , c.Cond_descricao
  , c.Cond_prazo
  , c.Cond_qtde_parcelas
  , c.Cond_prazo_01
  , c.Cond_prazo_02
  , c.Cond_prazo_03
  , c.Cond_prazo_04
  , c.Cond_prazo_05
  , c.Cond_prazo_06
  , c.Cond_prazo_07
  , c.Cond_prazo_08
  , c.Cond_prazo_09
  , c.Cond_prazo_10
  , c.Cond_prazo_11
  , c.Cond_prazo_12
  , c.Cond_descricao || ' [' ||
      case when c.Cond_prazo_01 is not Null then right('00' || c.Cond_prazo_01, 2) else '' end ||
      case when c.Cond_prazo_02 is not Null then ', ' || c.Cond_prazo_02 else '' end ||
      case when c.Cond_prazo_03 is not Null then ', ' || c.Cond_prazo_03 else '' end ||
      case when c.Cond_prazo_04 is not Null then ', ' || c.Cond_prazo_04 else '' end ||
      case when c.Cond_prazo_05 is not Null then ', ' || c.Cond_prazo_05 else '' end ||
      case when c.Cond_prazo_06 is not Null then ', ' || c.Cond_prazo_06 else '' end ||
      case when c.Cond_prazo_07 is not Null then ', ' || c.Cond_prazo_07 else '' end ||
      case when c.Cond_prazo_08 is not Null then ', ' || c.Cond_prazo_08 else '' end ||
      case when c.Cond_prazo_09 is not Null then ', ' || c.Cond_prazo_09 else '' end ||
      case when c.Cond_prazo_10 is not Null then ', ' || c.Cond_prazo_10 else '' end ||
      case when c.Cond_prazo_11 is not Null then ', ' || c.Cond_prazo_11 else '' end ||
      case when c.Cond_prazo_12 is not Null then ', ' || c.Cond_prazo_12 else '' end || ']'
    as Cond_descricao_full
  , Case when c.Cond_prazo = 0
      then '* A VISTA'
      else coalesce(c.Cond_qtde_parcelas, 1) || 'x'
    end as Cond_descricao_PDV
  , coalesce(c.Cond_pdv, 0)
  , c.ativa
from TBCONDICAOPAGTO c
;

/* Create index... */
CREATE INDEX IDX_SYS_UPGRADE_OK ON SYS_UPGRADE(UPGRADE_OK);

CREATE INDEX IDX_TBPRODUTO_CLIENTE_REF ON TBPRODUTO_CLIENTE(REFERENCIA);

CREATE INDEX IDX_TVENDASITENS_REF ON TVENDASITENS(CODPROD, CODCLIENTE, REFERENCIA);


/* Create Primary Key... */
ALTER TABLE SYS_UPGRADE ADD CONSTRAINT PK_SYS_UPGRADE PRIMARY KEY (SIS_COD, SIS_VERSION);

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT PK_TBPRODUTO_CLIENTE PRIMARY KEY (CLIENTE, PRODUTO);

/* Create Foreign Key... */
RECONNECT;

ALTER TABLE SYS_UPGRADE ADD CONSTRAINT FK_SYS_UPGRADE FOREIGN KEY (SIS_COD) REFERENCES SYS_SISTEMA (SIS_COD) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TBAJUSTESTOQ ADD CONSTRAINT FK_TBAJUSTESTOQ_SISTEMA FOREIGN KEY (SISTEMA) REFERENCES SYS_SISTEMA (SIS_COD);

ALTER TABLE TBINVENTARIO_ALMOX ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_SIS FOREIGN KEY (SISTEMA) REFERENCES SYS_SISTEMA (SIS_COD);

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_CLI FOREIGN KEY (CLIENTE) REFERENCES TBCLIENTE (CODIGO) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TBPRODUTO_CLIENTE ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_PRD FOREIGN KEY (PRODUTO) REFERENCES TBPRODUTO (COD) ON UPDATE CASCADE ON DELETE CASCADE;

/* Alter Procedure... */
/* Alter (SET_ATUALIZAR_CUSTO_PRODUTO) */
SET TERM ^ ;

ALTER PROCEDURE SET_ATUALIZAR_CUSTO_PRODUTO(PRODUTO DMN_VCHAR_10_KEY,
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
    /* 2. SISTEMA_GESTAO_IND, 3. SISTEMA_GESTAO_OPME */
    if ( (coalesce(:sistema, 0) = 2) or (coalesce(:sistema, 0) = 3) ) then
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

/* Alter (SET_CAIXA_MOVIMENTO_PAG) */
ALTER PROCEDURE SET_CAIXA_MOVIMENTO_PAG(USUARIO VARCHAR(12),
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
declare variable fornecedor_nome varchar(100);
begin
  -- Montar Historico
  Select
      coalesce(cc.Codemp, r.empresa)
    , coalesce(cc.Codforn, r.codforn)
    , 'COMPRA No. ' || r.Anocompra || '/' || r.Numcompra || ' - ' || f.Nomeforn
    , r.Anocompra
    , r.Numcompra
    , r.codtpdesp
    , f.nomeforn
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
    , tipo_despesa
    , fornecedor_nome;

  Historico = substring(coalesce(:Historico, 'PAGTO. DA DUPLICATA No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq) || coalesce(' - ' || :fornecedor_nome, '') from 1 for 250);

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

end
^

/* Alter (SET_CAIXA_MOVIMENTO_REC) */
ALTER PROCEDURE SET_CAIXA_MOVIMENTO_REC(USUARIO VARCHAR(12),
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
declare variable TIPO_RECEITA smallint;
declare variable ANO_OS DMN_SMALLINT_N;
declare variable NUM_OS DMN_BIGINT_N;
declare variable cliente_nome varchar(100);
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
    , coalesce(c.nomefant, c.nome)
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
    , tipo_receita
    , cliente_nome;

  Historico = substring(coalesce(:Historico, 'RECEBIMENTO DO TITULO No. ' || :Anolanc || '/' || :Numlanc || ' P' || :Seq) || coalesce(' - ' || :cliente_nome, '') from 1 for 250);

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

end
^

/* Alter (SET_LOTE_PRODUTO) */
ALTER PROCEDURE SET_LOTE_PRODUTO(EMPRESA VARCHAR(18),
CENTRO_CUSTO INTEGER,
SISTEMA SMALLINT,
PRODUTO VARCHAR(10),
LOTE_DESCRICAO VARCHAR(30),
LOTE_FAB DATE,
LOTE_VAL DATE,
LOTE_QTDE NUMERIC(18,3) = 0)
 RETURNS(LOTE_ID VARCHAR(38))
 AS
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable ESTOQUE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
declare variable USUARIO varchar(60);
begin
  if (exists(
    Select
      cc.centro_custo
    from TBCENTRO_CUSTO_EMPRESA cc
    where cc.centro_custo = :centro_custo
      and cc.empresa      = :empresa
  ) and (trim(coalesce(:lote_descricao, '')) <> '')) then
  begin
    -- Buscar identificacao do Lote
    Select
        ea.id
      , ea.qtde
      , ea.lote
    from TBESTOQUE_ALMOX ea
    where ea.empresa      = :empresa
      and ea.centro_custo = :centro_custo
      and ea.produto      = :produto
      and ea.descricao    = :lote_descricao
    Into
        lote_id
      , qtde
      , lote;

    --qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);
    qtde_nova = coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
      , coalesce(pr.qtde, 0.000)
      , pr.usuario
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade
      , estoque
      , usuario;

    if ( trim(coalesce(:lote_id, '')) = '' ) then
    begin
        Select
          g.hex_uuid_format
        from GET_GUID_UUID_HEX g
        Into
          lote_id;

        Select
            max(ea.lote)
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
        Into
            lote;

        lote = coalesce(:lote, 0) + 1;

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , descricao
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
          , id
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , trim(:lote_descricao)
          , :lote_fab
          , :lote_val
          , :qtde_nova   -- Informando a quantidade fracionada
          , :fracionador
          , :unidade
          , null         -- Informando o custo medio fracionado
          , :lote_id
        );
    end
    else
    begin
      Update TBESTOQUE_ALMOX ea Set
          ea.qtde        = :qtde_nova -- Informando a quantidade fracionada
        , ea.fracionador = :fracionador
        , ea.unidade     = :unidade
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;
    end

    /* SISTEMA_GESTAO_OPME */
    if (coalesce(:sistema, 0) = 3) then
    begin
      Select
        sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
      from TBESTOQUE_ALMOX e
      where e.empresa      = :empresa
        and e.centro_custo = :centro_custo
        and e.produto      = :produto
      Into
        qtde_nova;

      -- Atualizar Estoque de Venda
      Update TBPRODUTO p Set
        p.qtde = :qtde_nova
      where p.cod = :produto;

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
          :empresa
        , :produto
        , 'LOTE'
        , case when ((:qtde_nova - :estoque) > 0.000) then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , current_timestamp
        , :estoque
        , (:qtde_nova - :estoque)
        , :qtde_nova
        , coalesce(:usuario, user)
        , 'Ajuste manual do estoque'
      );
    end

    suspend;
  end 
end
^

/* Restore proc. body: SET_PRODUTO_CLIENTE */
ALTER PROCEDURE SET_PRODUTO_CLIENTE(PRODUTO DMN_VCHAR_10,
CLIENTE DMN_INTEGER_N,
REFERENCIA DMN_VCHAR_15)
 AS
declare variable COMPARAR DMN_VCHAR_15;
begin
  Select
    upper(trim(coalesce(p.referencia, '')))
  from TBPRODUTO p
  where p.cod = :produto
  Into
    comparar;

  if (:comparar <> upper(trim(:referencia))) then
  begin
    /*
    if (exists(
      Select
        p.codigo
      from TBPRODUTO p
      where p.cod = :produto
    ) and exists(
      Select
        c.codigo
      from TBCLIENTE c
      where c.codigo = :cliente
    )) then
    begin
    */
      if (not exists(
        Select
          pc.referencia
        from TBPRODUTO_CLIENTE pc
        where pc.produto = :produto
          and pc.cliente = :cliente
      )) then
      begin
        Insert Into TBPRODUTO_CLIENTE (
            produto
          , cliente
          , referencia
        ) values (
            :produto
          , :cliente
          , upper(trim(:referencia))
        );
      end
      else
      begin
        Update TBPRODUTO_CLIENTE pc Set
           pc.referencia = upper(trim(:referencia))
        where pc.produto = :produto
          and pc.cliente = :cliente;
      end
    /*
    end
    */
  end 
end
^

/* Altering existing trigger... */
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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where e.id = :lote_id_conf;

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

        /* SISTEMA_GESTAO_OPME */
        if (coalesce(new.sistema, 0) = 3) then
        begin
          Select
            sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
          from TBESTOQUE_ALMOX e
          where e.empresa      = new.empresa
            and e.centro_custo = coalesce(new.centro_custo, 0)
            and e.produto      = :produto
          Into
            quantidade;

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

      end

    end

  end 
end
^

SET TERM ; ^

DESCRIBE TRIGGER TB_INVENTARIO_ALMOX_ENCERRAR
'Trigger Encerrar Inventario (Estoque de Venda/Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   10/02/2015

Trigger responsavel por atualizar o Estoque de Venda ou o estoque do Centro de Custo (Almoxarifado) quando o inventario
for encerrado peloa aplicacao.';

/* Altering existing trigger... */
SET TERM ^ ;

ALTER TRIGGER TG_AJUST_ESTOQUE_HISTORICO
AS
  declare variable estoque DMN_QUANTIDADE_D3;
  declare variable estoque_por_lote DMN_SMALLINT_N;
begin
  Select
      coalesce(p.qtde, 0.0)
    , p.estoque_aprop_lote
  from TBPRODUTO p
  where p.cod = new.codprod
  Into
      estoque
    , estoque_por_lote;

  /* Caso o material/produto nao seja gerenciado por Lote */
  if (coalesce(:estoque_por_lote, 0) = 0) then
  begin
      estoque = coalesce(:estoque, 0.0) + coalesce(new.qtdenova, 0.0);
    
      update TBPRODUTO p set
        p.qtde = :estoque
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
  end
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_AJUST_ESTOQUE_HISTORICO
'Trigger Ajuste Manual Estoque (Venda).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/02/2014

Trigger responsavel por ajustar a quantidade em esoque do produto quando o regitro
de ajuste for encerrado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    27/03/2018 - IMR :
        * Trigger modificada para ser executada apenas quando o estoque do
          material/produto nao for gerenciado por lote.
          Para os estoque gerenciados por lote existe a stored procedure "SET_LOTE_PRODUTO".

    20/05/2014 - IMR :
        * Mudanca da trigger para que o estoque do produto seja ajustado,
          independente da empresa a qual pertenca.';

/* Altering existing trigger... */
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
  /* TRIGGER APENAS PARA O SISTEMA SGI */
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
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_APROPRIACAO_ALMOX_CANCELAR
'Trigger Remover Apropriacao de Estoque (Cancelamento).

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

/* Altering existing trigger... */
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
  /* TRIGGER APENAS PARA O SISTEMA SGI */
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
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_APROPRIACAO_ALMOX_ESTOQUE
'Trigger Apropriar Estoque (Encerramento).

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

/* Altering existing trigger... */
SET TERM ^ ;

ALTER TRIGGER TG_VENDAS_ESTOQUE_ATUALIZAR
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable cliente Integer;
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable referencia DMN_VCHAR_10;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.codcliente
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , nullif(trim(i.lote_id), '')
        , upper(coalesce(trim(i.referencia), ''))
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , cliente
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
        , referencia
    do
    begin
      --reserva = :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

      -- Baixar estoque do Lote
      if ( (:movimentar = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :lote_id);
      end

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

      -- Inserir armazenar codigo de referencia do produto no cliente
      if (:referencia <> '') then
        execute procedure SET_PRODUTO_CLIENTE(:produto, :cliente, :referencia);
    end
     
  end 
end
^

/* Alter Procedure... */
SET TERM ; ^

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN CONTROLE POSITION 1;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN CODPROD POSITION 2;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN CODEMPRESA POSITION 3;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN CODFORN POSITION 4;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN SISTEMA POSITION 5;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN QTDEATUAL POSITION 6;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN QTDENOVA POSITION 7;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN QTDEFINAL POSITION 8;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN FRACIONADOR POSITION 9;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN MOTIVO POSITION 10;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN DOC POSITION 11;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN DTAJUST POSITION 12;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN USUARIO POSITION 13;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN LOTE_ID POSITION 14;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN LOTE_DESCRICAO POSITION 15;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN LOTE_DATA_FAB POSITION 16;

ALTER TABLE TBAJUSTESTOQ ALTER COLUMN LOTE_DATA_VAL POSITION 17;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_COD POSITION 1;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_DESCRICAO POSITION 2;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_ESPECIFICACAO POSITION 3;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_INFORMACAO_FISCO POSITION 4;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_TIPO POSITION 5;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_CST_PADRAO_ENTRADA POSITION 6;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_CST_PADRAO_SAIDA POSITION 7;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_DEVOLUCAO POSITION 8;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_REMESSA POSITION 9;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_RETORNO_INTERNO POSITION 10;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_RETORNO_EXTERNO POSITION 11;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_GERAR_TITULO POSITION 12;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_GERAR_DUPLICATA POSITION 13;

ALTER TABLE TBCFOP ALTER COLUMN CFOP_ALTERA_CUSTO_PRODUTO POSITION 14;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMPRESA POSITION 1;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_CONTA POSITION 2;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_SENHA POSITION 3;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_POP POSITION 4;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_SMTP POSITION 5;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_SMTP_PORTA POSITION 6;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_REQUER_AUTENTICACAO POSITION 7;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_CONEXAO_SSL POSITION 8;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_ASSUNTO_PADRAO POSITION 9;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN EMAIL_MENSAGEM_PADRAO POSITION 10;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN CLIENTE_PERMITIR_DUPLICAR_CNPJ POSITION 11;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN CLIENTE_PERMITIR_VF_CNPJ POSITION 12;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN CUSTO_OPER_CALCULAR POSITION 13;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN PERMITIR_VENDA_ESTOQUE_INS POSITION 14;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN VENDA_CARREGA_PRODUTO_EAN POSITION 15;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN VENDA_FORMA_PAGTO_CARTACREDITO POSITION 16;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN ESTOQUE_UNICO_EMPRESAS POSITION 17;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN ESTOQUE_SATELITE_CLIENTE POSITION 18;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN AUTORIZA_INFORMA_CLIENTE POSITION 19;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN USUARIO POSITION 20;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_EMITIR POSITION 21;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_SERIE POSITION 22;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_NUMERO POSITION 23;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_LOTE POSITION 24;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_CARTA_CORRECAO POSITION 25;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_EMITIR_ENTRADA POSITION 26;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_ACEITAR_NOTA_DENEGADA POSITION 27;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_SOLICITA_DH_SAIDA POSITION 28;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_IMPRIMIR_COD_CLIENTE POSITION 29;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_IMPRIMIR_COD_REFERENTE POSITION 30;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFCE_EMITIR POSITION 31;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFCE_SERIE POSITION 32;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFCE_NUMERO POSITION 33;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFCE_TOKEN_ID POSITION 34;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFCE_TOKEN POSITION 35;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_EMITIR POSITION 36;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN RPS_SERIE POSITION 37;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN RPS_NUMERO POSITION 38;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_SERIE POSITION 39;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_NUMERO POSITION 40;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_PERCENTUAL_PIS POSITION 41;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_PERCENTUAL_COFINS POSITION 42;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_PERCENTUAL_CSLL POSITION 43;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFSE_PERCENTUAL_ISSQN POSITION 44;

ALTER TABLE TBCONFIGURACAO ALTER COLUMN NFE_IMPRIMIR_COD_REFERENCIA POSITION 45;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN ANO POSITION 1;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN CONTROLE POSITION 2;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN TIPO POSITION 3;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN SISTEMA POSITION 4;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN EMPRESA POSITION 5;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN CENTRO_CUSTO POSITION 6;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN CONFERIR_ESTOQUE_VENDA POSITION 7;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN DATA POSITION 8;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN COMPETENCIA POSITION 9;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN STATUS POSITION 10;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN OBS POSITION 11;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN INSERCAO_DATAHORA POSITION 12;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN INSERCAO_USUARIO POSITION 13;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN FECH_DATAHORA POSITION 14;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN FECH_USUARIO POSITION 15;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN CANCEL_DATAHORA POSITION 16;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN CANCEL_USUARIO POSITION 17;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN CANCEL_MOVITO POSITION 18;

ALTER TABLE TBINVENTARIO_ALMOX ALTER COLUMN BLOQUEAR_MOVIMENTO POSITION 19;

ALTER TABLE TVENDASITENS ALTER COLUMN ANO POSITION 1;

ALTER TABLE TVENDASITENS ALTER COLUMN CODCONTROL POSITION 2;

ALTER TABLE TVENDASITENS ALTER COLUMN CODEMP POSITION 3;

ALTER TABLE TVENDASITENS ALTER COLUMN SEQ POSITION 4;

ALTER TABLE TVENDASITENS ALTER COLUMN CODPROD POSITION 5;

ALTER TABLE TVENDASITENS ALTER COLUMN REFERENCIA POSITION 6;

ALTER TABLE TVENDASITENS ALTER COLUMN CODCLIENTE POSITION 7;

ALTER TABLE TVENDASITENS ALTER COLUMN CODCLI POSITION 8;

ALTER TABLE TVENDASITENS ALTER COLUMN CODVENDEDOR POSITION 9;

ALTER TABLE TVENDASITENS ALTER COLUMN DTVENDA POSITION 10;

ALTER TABLE TVENDASITENS ALTER COLUMN QTDE POSITION 11;

ALTER TABLE TVENDASITENS ALTER COLUMN LOTE_ID POSITION 12;

ALTER TABLE TVENDASITENS ALTER COLUMN PUNIT POSITION 13;

ALTER TABLE TVENDASITENS ALTER COLUMN PUNIT_PROMOCAO POSITION 14;

ALTER TABLE TVENDASITENS ALTER COLUMN DESCONTO POSITION 15;

ALTER TABLE TVENDASITENS ALTER COLUMN DESCONTO_VALOR POSITION 16;

ALTER TABLE TVENDASITENS ALTER COLUMN PFINAL POSITION 17;

ALTER TABLE TVENDASITENS ALTER COLUMN QTDEFINAL POSITION 18;

ALTER TABLE TVENDASITENS ALTER COLUMN UNID_COD POSITION 19;

ALTER TABLE TVENDASITENS ALTER COLUMN CFOP_COD POSITION 20;

ALTER TABLE TVENDASITENS ALTER COLUMN CST POSITION 21;

ALTER TABLE TVENDASITENS ALTER COLUMN CSOSN POSITION 22;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA POSITION 23;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA_CSOSN POSITION 24;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA_PIS POSITION 25;

ALTER TABLE TVENDASITENS ALTER COLUMN ALIQUOTA_COFINS POSITION 26;

ALTER TABLE TVENDASITENS ALTER COLUMN VALOR_IPI POSITION 27;

ALTER TABLE TVENDASITENS ALTER COLUMN PERCENTUAL_REDUCAO_BC POSITION 28;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_BRUTO POSITION 29;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_DESCONTO POSITION 30;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_LIQUIDO POSITION 31;

ALTER TABLE TVENDASITENS ALTER COLUMN TOTAL_COMISSAO POSITION 32;

/* Create(Add) privilege */
GRANT ALL ON SYS_UPGRADE TO SYSDBA WITH GRANT OPTION;

GRANT ALL ON TBPRODUTO_CLIENTE TO PUBLIC;

GRANT ALL ON TBPRODUTO_CLIENTE TO SYSDBA WITH GRANT OPTION;

GRANT ALL ON VW_CONDICAOPAGTO TO PUBLIC;

GRANT ALL ON VW_CONDICAOPAGTO TO SYSDBA WITH GRANT OPTION;

GRANT EXECUTE ON PROCEDURE SET_PRODUTO_CLIENTE TO PUBLIC;

SET SQL DIALECT 3;

SET AUTODDL ON;

DESCRIBE DOMAIN DMN_LONGINT
'Inteiro longo';

DESCRIBE DOMAIN DMN_LONGINT_NN
'Inteiro longo (Nao nulo)';

DESCRIBE DOMAIN DMN_TIPO_2
'0 - A Definir
1 -
2 -';

DESCRIBE TABLE SYS_LICENCA
'Tabela Licenca de Uso

    Autor   :   Isaque Marinho Ribeiro
    Data    :   ?

Tabela responsavel por armazenar, de forma criptografada, informacoes importantes
referentes a Licenca de Uso do sistema.';

DESCRIBE TABLE SYS_UPGRADE
'Tabela Upgrade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os scripts de upgrade da base de dados a cada
nova atualizacao do(s) sistema(s).';

DESCRIBE TABLE TBAJUSTESTOQ
'Tabela Ajuste Manual de Estoque

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar os dados necesarios aos ajustes de estoques
lancados manualmente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/03/2018 - IMR :
        + Criacao do campo SISTEMA para armazer o codigo do sistema responsavel
          pela abertura do registro.

    04/02/2014 - IMR :
        * Documentacao da tabela.';

DESCRIBE TABLE TBAPROPRIACAO_ALMOX
'Tabela de Apropriacao de Estoque (Almoxarifado)

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
        * Revisao da documentacao dos objetos.
          Esta apropriacao de estoque se aplica apenas ao sistema SGI.';

DESCRIBE TABLE TBINVENTARIO_ALMOX
'Tabela Inventario de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar todos os registros de inventarios de estoque realizados pelo sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/03/2018 - IMR :
        + Criacao do campo SISTEMA para armazer o codigo do sistema responsavel
          pela abertura do inventario. Isso permitira que o encerramento de comporte
          de forma diferente de acordo com o sistema de gestao responsavel.

    04/02/2014 - IMR :
        * Documentacao da tabela.';

DESCRIBE TABLE TBPRODUTO_CLIENTE
'Tabela de Referencia Produto x Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os codigos de referencia de cada produto na base
do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto na base.';

DESCRIBE FIELD SIS_COD TABLE SYS_UPGRADE
'Sistema';

DESCRIBE FIELD SIS_VERSION TABLE SYS_UPGRADE
'Versao';

DESCRIBE FIELD UPGRADE_SQL TABLE SYS_UPGRADE
'Script SQL';

DESCRIBE FIELD UPGRADE_DATA TABLE SYS_UPGRADE
'Data de execucao';

DESCRIBE FIELD UPGRADE_ERROR TABLE SYS_UPGRADE
'LOG de Erro';

DESCRIBE FIELD UPGRADE_OK TABLE SYS_UPGRADE
'Execucao com sucesso:
0 - Nao
1 - Sim';

DESCRIBE FIELD SISTEMA TABLE TBAJUSTESTOQ
'Sistema';

DESCRIBE FIELD CFOP_TIPO TABLE TBCFOP
'Tipo:
0 - A Definir
1 - Entrada
2 - Saida';

DESCRIBE FIELD NFE_IMPRIMIR_COD_REFERENTE TABLE TBCONFIGURACAO
'NF-e: Imprimir Referencia como Codigo do Produto no DANFE da NF-e:
0 - Nao
1 - Sim';

DESCRIBE FIELD NFE_IMPRIMIR_COD_REFERENCIA TABLE TBCONFIGURACAO
'NF-e: Imprimir Referencia como Codigo do Produto no DANFE da NF-e:
0 - Nao
1 - Sim';

DESCRIBE FIELD SISTEMA TABLE TBINVENTARIO_ALMOX
'Sistema';

DESCRIBE FIELD CODBARRA_EAN TABLE TBPRODUTO
'Codigo de Barras / Codigo Externo';

DESCRIBE FIELD PRODUTO TABLE TBPRODUTO_CLIENTE
'Produto';

DESCRIBE FIELD CLIENTE TABLE TBPRODUTO_CLIENTE
'Cliente';

DESCRIBE FIELD REFERENCIA TABLE TBPRODUTO_CLIENTE
'Referencia / Codigo Externo

Obs.: Codigo do produto na base do Cliente';

DESCRIBE FIELD REFERENCIA TABLE TVENDASITENS
'Referencia / Codigo externo (Importante para OPME) / Codigo do Produto no Cliente';

DESCRIBE PROCEDURE SET_PRODUTO_CLIENTE
'Procedure SET Referencia Produto x Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Stored procedure responsavel inserir/atualizar o codigo de referencia do produto
na base do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto.';

DESCRIBE TRIGGER TG_AJUST_ESTOQUE_HISTORICO
'Trigger Ajuste Manual Estoque (Venda).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/02/2014

Trigger responsavel por ajustar a quantidade em esoque do produto quando o regitro
de ajuste for encerrado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    27/03/2018 - IMR :
        * Trigger modificada para ser executada apenas quando o estoque do
          material/produto nao for gerenciado por lote.
          Para os estoque gerenciados por lote existe a stored procedure "SET_LOTE_PRODUTO".

    20/05/2014 - IMR :
        * Mudanca da trigger para que o estoque do produto seja ajustado,
          independente da empresa a qual pertenca.';

/* Altering existing trigger... */
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
  /* TRIGGER APENAS PARA O SISTEMA SGI */
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
        , replace('Custo medio no valor de ' || :custo_produto, '.', ',')
      );
    end

  end
end
^

SET TERM ; ^

DESCRIBE TRIGGER TG_APROPRIACAO_ALMOX_ESTOQUE
'Trigger Apropriar Estoque (Encerramento).

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

DESCRIBE PROCEDURE SET_PRODUTO_CLIENTE
'Procedure SET Referencia Produto x Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Stored procedure responsavel inserir/atualizar o codigo de referencia do produto
na base do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto.';
