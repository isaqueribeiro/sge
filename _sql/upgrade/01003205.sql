


/*------ SYSDBA 01/02/2021 22:36:16 --------*/

CREATE TABLE SYS_CONFIG (
    KY_CONFIG DMN_VCHAR_150_NN NOT NULL,
    VL_CONFIG DMN_VCHAR_250,
    DH_CONFIG DMN_DATETIME);

ALTER TABLE SYS_CONFIG
ADD CONSTRAINT PK_SYS_CONFIG
PRIMARY KEY (KY_CONFIG);

COMMENT ON COLUMN SYS_CONFIG.KY_CONFIG IS
'Chave.';

COMMENT ON COLUMN SYS_CONFIG.VL_CONFIG IS
'Valor.';

COMMENT ON COLUMN SYS_CONFIG.DH_CONFIG IS
'Data/hora da insercao ou alteracao.';




/*------ SYSDBA 01/02/2021 22:36:17 --------*/

COMMENT ON TABLE SYS_CONFIG IS 'Tabela de Configuracoes Diversas

    Autor   :   Isaque M. Ribeiro
    Data    :   01/02/2021

Tabela responsavel por armazenar registros de configuracoes gerais importantes
de parametrizam o funcionamento dos sistemas.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    01/02/2021 - IMR :
        + Criacao e documentacao da tabela.';

GRANT ALL ON SYS_CONFIG TO "PUBLIC";



/*------ SYSDBA 05/07/2021 13:37:21 --------*/

COMMENT ON COLUMN TBPRODUTO.CODUNIDADE IS
'Unidade de Compra';




/*------ SYSDBA 04/08/2021 22:28:06 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.ESTOQUE_UNICO_EMPRESAS IS
'Trabalhar com estoque unificado de produtos entre as demais empresa:
0 - Nao
1 - Sim

A empresa que possue esta flag marcada tem acesso a todos os dados de produtos e
estoque das demais empresa.';






/*------ SYSDBA 05/11/2021 19:46:09 --------*/

CREATE OR ALTER VIEW VW_CONDICAOPAGTO(
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




/*------ SYSDBA 09/12/2021 20:32:43 --------*/

CREATE INDEX IDX_TBLOG_TRANSACAO_DATAHORA
ON TBLOG_TRANSACAO (DATA_HORA);

