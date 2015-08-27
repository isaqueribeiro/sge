


/*------ SYSDBA 06/04/2015 22:53:55 --------*/

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

COMMENT ON PROCEDURE SET_COMPETENCIA IS 'Store Procedure Registrar Competencia.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   --/--/2014

Procedure reponsavel por cadastrar o registro de competencia das movimentacoes.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    06/04/2015 - IMR :
        * Documentacao da store procedure.';







/*------ SYSDBA 20/04/2015 11:31:58 --------*/

CREATE DOMAIN DMN_VCHAR_12 AS
VARCHAR(10);


/*------ SYSDBA 20/04/2015 11:32:32 --------*/

ALTER DOMAIN DMN_VCHAR_12
TYPE VARCHAR(12) CHARACTER SET ISO8859_2;




/*------ SYSDBA 20/04/2015 12:11:25 --------*/

ALTER TABLE TBVENDAS
    ADD DNFE_COMPRA_ANO DMN_SMALLINT_N,
    ADD DNFE_COMPRA_COD DMN_BIGINT_N,
    ADD DNFE_FORMA DMN_SMALLINT_N,
    ADD DNFE_UF DMN_UF,
    ADD DNFE_CNPJ_CPF DMN_CNPJ,
    ADD DNFE_IE DMN_VCHAR_20,
    ADD DNFE_COMPETENCIA DMN_VCHAR_04,
    ADD DNFE_SERIE DMN_VCHAR_04,
    ADD DNFE_NUMERO DMN_BIGINT_N,
    ADD DNFE_MODELO DMN_SMALLINT_N,
    ADD DNFE_CHAVE DMN_VCHAR_250,
    ADD DECF_MODELO DMN_SMALLINT_N,
    ADD DECF_NUMERO DMN_BIGINT_N,
    ADD DECF_COO DMN_BIGINT_N;

COMMENT ON COLUMN TBVENDAS.DNFE_COMPRA_ANO IS
'Devolucao -> Ano Compra';

COMMENT ON COLUMN TBVENDAS.DNFE_COMPRA_COD IS
'Devolucao -> Codigo Compra';

COMMENT ON COLUMN TBVENDAS.DNFE_FORMA IS
'Devolucao -> Forma/modelo de devolucao:
0 - NFe Eletronica
1 - NFe Modelo 1/1A
2 - NF produtor Rural
3 - Cupom Fiscal';

COMMENT ON COLUMN TBVENDAS.DNFE_UF IS
'Devolucao -> UF da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_CNPJ_CPF IS
'Devolucao -> CPF/CNPJ da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_IE IS
'Devolucao -> IE da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_COMPETENCIA IS
'Devolucao -> Competencia de emissao da NF devolvida
Obs.: Formato AAMM.';

COMMENT ON COLUMN TBVENDAS.DNFE_SERIE IS
'Devolucao -> Serie da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_NUMERO IS
'Devolucao -> Numero da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_MODELO IS
'Devolucao -> Modelo da NF devolvida';

COMMENT ON COLUMN TBVENDAS.DNFE_CHAVE IS
'Devolucao -> Chave da NF-e devolvida';

COMMENT ON COLUMN TBVENDAS.DECF_MODELO IS
'Devolucao -> Modelo do cupom fiscal devolvido:
0 - (ECFModRefVazio)
1 - 2B = Cupom Fiscal emitido por maquina registradora (ECFModRef2B)
2 - 2C = Cupom Fiscal PDV (ECFModRef2C)
3 - 2D = Cupom Fiscal emitido por ECF (ECFModRef2D)';

COMMENT ON COLUMN TBVENDAS.DECF_NUMERO IS
'Devolucao -> Numero da ECF do cupom fiscal devolvido';

COMMENT ON COLUMN TBVENDAS.DECF_COO IS
'Devolucao -> Numero COO do cupom fiscal devolvido';




/*------ SYSDBA 20/04/2015 12:12:21 --------*/

ALTER TABLE TBVENDAS
ADD CONSTRAINT FK_TBVENDAS_DEVOLVER_COMPRA
FOREIGN KEY (DNFE_COMPRA_ANO,DNFE_COMPRA_COD,CODEMP)
REFERENCES TBCOMPRAS(ANO,CODCONTROL,CODEMP);




/*------ SYSDBA 20/04/2015 12:13:51 --------*/

COMMENT ON COLUMN TBVENDAS.DNFE_NUMERO IS
'Devolucao -> Numero DF da NF devolvida:
0 - moNFe  (Nota Fiscal Eletronica)
1 - moNFCe (Nota Fiscal do Consumidor Eletronica)';




/*------ SYSDBA 20/04/2015 12:15:36 --------*/

CREATE OR ALTER VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'        as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal *' as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D'  as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'      as TPD_DESCRICAO from RDB$DATABASE union
Select 5 as TPD_CODIGO , 'NF-e'          as TPD_DESCRICAO from RDB$DATABASE union
Select 6 as TPD_CODIGO , 'NFC-e'         as TPD_DESCRICAO from RDB$DATABASE
;




/*------ SYSDBA 20/04/2015 12:17:08 --------*/

CREATE OR ALTER VIEW VW_TIPO_DOCUMENTO_ENTRADA(
    TPD_CODIGO,
    TPD_DESCRICAO)
AS
Select 0 as TPD_CODIGO , 'Avulso'        as TPD_DESCRICAO from RDB$DATABASE union
Select 1 as TPD_CODIGO , 'Nota Fiscal *' as TPD_DESCRICAO from RDB$DATABASE union
Select 2 as TPD_CODIGO , 'Cupom Fiscal'  as TPD_DESCRICAO from RDB$DATABASE union
Select 3 as TPD_CODIGO , 'Nota Série D'  as TPD_DESCRICAO from RDB$DATABASE union
Select 4 as TPD_CODIGO , 'Contrato'      as TPD_DESCRICAO from RDB$DATABASE union
Select 5 as TPD_CODIGO , 'NF-e'          as TPD_DESCRICAO from RDB$DATABASE union
Select 6 as TPD_CODIGO , 'NFC-e'         as TPD_DESCRICAO from RDB$DATABASE
;



/*------ SYSDBA 20/04/2015 19:25:04 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Unexpected end of command - line 4, column 44.

*/


/*------ SYSDBA 20/04/2015 19:25:26 --------*/

CREATE OR ALTER VIEW vw_forma_devolucao ( Codigo, Descricao )
as
Select 0 as Codigo, 'NF Eletronica'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo, 'NF Modelo 1/1A'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo, 'NF Produtor Rural' as Descricao from RDB$DATABASE Union
Select 3 as Codigo, 'Cupom Fiscal'      as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_FORMA_DEVOLUCAO TO "PUBLIC";



/*------ SYSDBA 20/04/2015 19:32:17 --------*/

CREATE OR ALTER VIEW VW_FORMA_DEVOLUCAO(
    CODIGO,
    DESCRICAO)
AS
Select 0 as Codigo, 'Nota Fiscal Eletronica'     as Descricao from RDB$DATABASE Union
Select 1 as Codigo, 'Nota Fiscal Modelo 1/1A'    as Descricao from RDB$DATABASE Union
Select 2 as Codigo, 'Nota Fiscal Produtor Rural' as Descricao from RDB$DATABASE Union
Select 3 as Codigo, 'Cupom Fiscal'      as Descricao from RDB$DATABASE
;




/*------ SYSDBA 20/04/2015 20:13:45 --------*/

create view vw_modelo_cupom_fiscal ( codigo, descricao )
as
Select 0 as Codigo, 'Vazio' as Descricao from RDB$DATABASE Union
Select 1 as Codigo, '2B - Cupom Fiscal emitido por Maquina Registradora' as Descricao from RDB$DATABASE Union
Select 2 as Codigo, '2C - Cupom Fiscal PDV'             as Descricao from RDB$DATABASE Union
Select 3 as Codigo, '2D - Cupom Fiscal emitido por ECF' as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_MODELO_CUPOM_FISCAL TO "PUBLIC";



/*------ SYSDBA 23/04/2015 18:40:20 --------*/

ALTER TABLE TBPRODUTO
    ADD ESTOQUE_APROP_LOTE DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBPRODUTO.ESTOQUE_APROP_LOTE IS
'Produto com Estoque Apropriado gerenciado por Lotes:
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
alter ESTOQUE_APROP_LOTE position 65;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 66;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 67;

alter table TBPRODUTO
alter CUST_DESP_ADM position 68;

alter table TBPRODUTO
alter CUST_COMISSAO position 69;

alter table TBPRODUTO
alter CUST_IMPOSTO position 70;

alter table TBPRODUTO
alter FI_RET_FINANC position 71;

alter table TBPRODUTO
alter FI_RET_PLANO position 72;




/*------ SYSDBA 23/04/2015 18:40:58 --------*/

COMMENT ON COLUMN TBPRODUTO.ESTOQUE_APROP_LOTE IS
'Produto com Estoque Apropriado gerenciado por Lotes (SGI):
0 - Nao
1 - Sim';




/*------ SYSDBA 06/05/2015 13:53:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ibpt_cod for sys_ibpt
active before insert position 0
as
begin
  if (new.id_ibpt is null) then
    new.id_ibpt = gen_id(GEN_IBPT_ID, 1);
end^

SET TERM ; ^




/*------ SYSDBA 06/05/2015 14:43:59 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_20'
where (RDB$FIELD_NAME = 'UNIDADE') and
(RDB$RELATION_NAME = 'TBPRODUTO');




/*------ SYSDBA 15/05/2015 17:04:38 --------*/

ALTER TABLE SYS_ESTACAO DROP CONSTRAINT PK_SYS_ESTACAO;




/*------ SYSDBA 15/05/2015 17:05:31 --------*/

CREATE DOMAIN DMN_VCHAR_60_NN AS
VARCHAR(60)
NOT NULL;


/*------ SYSDBA 15/05/2015 17:05:45 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_60_NN'
where (RDB$FIELD_NAME = 'EST_NOME') and
(RDB$RELATION_NAME = 'SYS_ESTACAO');




/*------ SYSDBA 15/05/2015 17:06:00 --------*/

ALTER TABLE SYS_ESTACAO
ADD CONSTRAINT PK_SYS_ESTACAO
PRIMARY KEY (EST_NOME);




/*------ SYSDBA 15/05/2015 17:06:18 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_250'
where (RDB$FIELD_NAME = 'EST_REGISTRO') and
(RDB$RELATION_NAME = 'SYS_ESTACAO');



/*------ 18/05/2015 11:07:15 --------*/

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
end^

/*------ 18/05/2015 11:07:15 --------*/

SET TERM ; ^

/*------ 18/05/2015 11:18:27 --------*/

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

/*------ 18/05/2015 11:18:27 --------*/

SET TERM ; ^

/*------ 18/05/2015 13:38:05 --------*/

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

end^

/*------ 18/05/2015 13:38:06 --------*/

SET TERM ; ^

/*------ 18/05/2015 14:29:27 --------*/

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

/*------ 18/05/2015 14:29:27 --------*/

SET TERM ; ^


/*------ SYSDBA 19/05/2015 18:42:29 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_NOME'
where (RDB$FIELD_NAME = 'NOMEEMP') and
(RDB$RELATION_NAME = 'TBCONTPAG')
;




/*------ SYSDBA 19/05/2015 19:01:29 --------*/

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




/*------ SYSDBA 19/05/2015 19:05:35 --------*/

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
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:06:20 --------*/

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
      , 'x|QUJDMTIz...'
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




/*------ SYSDBA 19/05/2015 19:06:30 --------*/

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
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:10:54 --------*/

ALTER TABLE TBFORNECEDOR
    ADD FORNECEDOR_FUNCIONARIO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBFORNECEDOR.FORNECEDOR_FUNCIONARIO IS
'Fornecedor/Colaborador (Funcionario):
0 - Nao
1 - Sim

(Os registros de flag 1 serao mantidos pelo Cadastro de Funcionarios)';




/*------ SYSDBA 19/05/2015 19:11:39 --------*/

COMMENT ON COLUMN TBFORNECEDOR.PESSOA_FISICA IS
'Pessoa Fisica:
0 - Nao
1 - Sim';




/*------ SYSDBA 19/05/2015 19:11:47 --------*/

COMMENT ON COLUMN TBFORNECEDOR.TIPO IS
'Tipo:
0 - Nao se aplica
1 - Matriz
2 - Filial';




/*------ SYSDBA 19/05/2015 19:11:58 --------*/

COMMENT ON COLUMN TBFORNECEDOR.CODFORN IS
'Codigo';




/*------ SYSDBA 19/05/2015 19:12:11 --------*/

COMMENT ON COLUMN TBFORNECEDOR.CNPJ IS
'CPF/CNPJ.';




/*------ SYSDBA 19/05/2015 19:12:23 --------*/

COMMENT ON COLUMN TBFORNECEDOR.INSCEST IS
'RG/Insc. Estadual';




/*------ SYSDBA 19/05/2015 19:12:32 --------*/

COMMENT ON COLUMN TBFORNECEDOR.INSCMUN IS
'Insc. Municipal.';




/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 6;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 7;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 8;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 9;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 10;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 11;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 12;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 13;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 14;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 15;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CEP position 16;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 17;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column UF position 18;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 19;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 20;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 21;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 22;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 23;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 24;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 25;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 26;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 27;


/*------ SYSDBA 19/05/2015 19:13:12 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 28;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 6;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 7;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 8;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 9;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 10;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 11;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 12;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 13;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 14;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 15;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CEP position 16;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 17;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column UF position 18;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 19;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 20;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 21;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 22;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 23;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 24;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 25;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 26;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 27;


/*------ SYSDBA 19/05/2015 19:13:36 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 28;


/*------ SYSDBA 19/05/2015 19:13:58 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'COMPLEMENTO') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 19/05/2015 19:14:11 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'NUMERO_END') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 19/05/2015 19:15:02 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_CEP'
where (RDB$FIELD_NAME = 'CEP') and
(RDB$RELATION_NAME = 'TBFORNECEDOR')
;




/*------ SYSDBA 19/05/2015 19:19:47 --------*/

CREATE DOMAIN DMN_RG_GERAL AS
VARCHAR(20);COMMENT ON DOMAIN DMN_RG_GERAL IS 'Registro Geral:
Numero e/ou Orgao emissor';




/*------ SYSDBA 19/05/2015 19:20:13 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD CPF DMN_CPF,
    ADD RG_NUMERO DMN_RG_GERAL,
    ADD RG_ORGAO_EMISSOR DMN_RG_GERAL;

COMMENT ON COLUMN TBFUNCIONARIO.RG_NUMERO IS
'Registro Geral:
Numero e/ou Orgao emissor';

COMMENT ON COLUMN TBFUNCIONARIO.RG_ORGAO_EMISSOR IS
'Registro Geral:
Numero e/ou Orgao emissor';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 2;

alter table TBFUNCIONARIO
alter METAFONEMA position 3;

alter table TBFUNCIONARIO
alter SEXO position 4;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 5;

alter table TBFUNCIONARIO
alter CPF position 6;

alter table TBFUNCIONARIO
alter RG_NUMERO position 7;

alter table TBFUNCIONARIO
alter RG_ORGAO_EMISSOR position 8;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 9;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 10;

alter table TBFUNCIONARIO
alter ATIVO position 11;

alter table TBFUNCIONARIO
alter USUARIO position 12;

alter table TBFUNCIONARIO
alter VENDEDOR position 13;

alter table TBFUNCIONARIO
alter FORNECEDOR position 14;

alter table TBFUNCIONARIO
alter ENDER position 15;

alter table TBFUNCIONARIO
alter NUMERO_END position 16;

alter table TBFUNCIONARIO
alter COMPLEMENTO position 17;

alter table TBFUNCIONARIO
alter BAIRRO position 18;

alter table TBFUNCIONARIO
alter CEP position 19;

alter table TBFUNCIONARIO
alter CIDADE position 20;

alter table TBFUNCIONARIO
alter UF position 21;

alter table TBFUNCIONARIO
alter TLG_TIPO position 22;

alter table TBFUNCIONARIO
alter LOG_COD position 23;

alter table TBFUNCIONARIO
alter BAI_COD position 24;

alter table TBFUNCIONARIO
alter CID_COD position 25;

alter table TBFUNCIONARIO
alter EST_COD position 26;

alter table TBFUNCIONARIO
alter PAIS_ID position 27;

alter table TBFUNCIONARIO
alter FONE_FIXO position 28;

alter table TBFUNCIONARIO
alter FONE_CELULAR position 29;

alter table TBFUNCIONARIO
alter FONE_COMERCIAL position 30;

alter table TBFUNCIONARIO
alter EMAIL position 31;




/*------ SYSDBA 19/05/2015 19:21:04 --------*/

CREATE INDEX IDX_TBFUNCIONARIO_RG
ON TBFUNCIONARIO (RG_NUMERO,RG_ORGAO_EMISSOR);

CREATE INDEX IDX_TBFUNCIONARIO_CPF
ON TBFUNCIONARIO (CPF);




/*------ SYSDBA 19/05/2015 19:21:57 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_fornecedor_cod for tbfornecedor
active before insert position 0
As
Begin
  new.fornecedor_funcionario = coalesce(new.fornecedor_funcionario, 0);
  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CPF position 6;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 7;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 8;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 9;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 10;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 11;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 12;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 13;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 14;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 15;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 16;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CEP position 17;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 18;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column UF position 19;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 20;


/*------ SYSDBA 19/05/2015 19:25:06 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 21;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 22;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 23;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 24;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 25;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 26;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 27;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 28;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 29;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column RG_NUMERO position 30;


/*------ SYSDBA 19/05/2015 19:25:07 --------*/

alter table TBFUNCIONARIO
alter column RG_ORGAO_EMISSOR position 31;


/*------ SYSDBA 19/05/2015 19:25:21 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.RG_NUMERO IS
'Documentacao -> Registro Geral:
Numero e/ou Orgao emissor';




/*------ SYSDBA 19/05/2015 19:25:28 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.RG_ORGAO_EMISSOR IS
'Documentacao -> Registro Geral: Orgao emissor';




/*------ SYSDBA 19/05/2015 19:25:36 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.RG_NUMERO IS
'Documentacao -> Registro Geral: Numero';




/*------ SYSDBA 19/05/2015 19:54:14 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'GRF_DESCRICAO') and
(RDB$RELATION_NAME = 'TBFORNECEDOR_GRUPO')
;




/*------ SYSDBA 19/05/2015 20:13:15 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.SEXO IS
'Sexo:
M - Masculino
F - Feminino';




/*------ SYSDBA 19/05/2015 21:04:46 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD OBSERVACAO DMN_TEXTO;

COMMENT ON COLUMN TBFUNCIONARIO.OBSERVACAO IS
'Observacoes gerais';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 2;

alter table TBFUNCIONARIO
alter METAFONEMA position 3;

alter table TBFUNCIONARIO
alter SEXO position 4;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 5;

alter table TBFUNCIONARIO
alter CPF position 6;

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

alter table TBFUNCIONARIO
alter ENDER position 13;

alter table TBFUNCIONARIO
alter NUMERO_END position 14;

alter table TBFUNCIONARIO
alter COMPLEMENTO position 15;

alter table TBFUNCIONARIO
alter BAIRRO position 16;

alter table TBFUNCIONARIO
alter CEP position 17;

alter table TBFUNCIONARIO
alter CIDADE position 18;

alter table TBFUNCIONARIO
alter UF position 19;

alter table TBFUNCIONARIO
alter TLG_TIPO position 20;

alter table TBFUNCIONARIO
alter LOG_COD position 21;

alter table TBFUNCIONARIO
alter BAI_COD position 22;

alter table TBFUNCIONARIO
alter CID_COD position 23;

alter table TBFUNCIONARIO
alter EST_COD position 24;

alter table TBFUNCIONARIO
alter PAIS_ID position 25;

alter table TBFUNCIONARIO
alter FONE_FIXO position 26;

alter table TBFUNCIONARIO
alter FONE_CELULAR position 27;

alter table TBFUNCIONARIO
alter FONE_COMERCIAL position 28;

alter table TBFUNCIONARIO
alter EMAIL position 29;

alter table TBFUNCIONARIO
alter OBSERVACAO position 30;

alter table TBFUNCIONARIO
alter RG_NUMERO position 31;

alter table TBFUNCIONARIO
alter RG_ORGAO_EMISSOR position 32;




/*------ SYSDBA 19/05/2015 21:05:38 --------*/

CREATE INDEX IDX_TBFORNECEDOR_FUNC
ON TBFORNECEDOR (PESSOA_FISICA,CNPJ,GRF_COD);




/*------ SYSDBA 19/05/2015 21:12:25 --------*/

SET TERM ^ ;

CREATE trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
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
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
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
        , null
        , null
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
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
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.cliente_origem     = null
        , f.cliente_origem_cod = null
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 19/05/2015 21:13:52 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
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
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
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
        , null
        , null
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
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
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.cliente_origem     = null
        , f.cliente_origem_cod = null
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Colaborador.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/05/2015

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente
ao registro do colaborador quando for marcado como "fornecedor".';




/*------ SYSDBA 19/05/2015 21:15:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
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
        , CLIENTE_ORIGEM
        , CLIENTE_ORIGEM_COD
        , FATURAMENTO_MINIMO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
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
        , null
        , null
        , 0.0
      );
    end
    else
    begin
      Update TBFORNECEDOR f Set
          f.pessoa_fisica = 1
        , f.nomeforn = new.nome_completo
        , f.nomefant = new.nome_completo
        , f.cnpj     = new.cpf
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
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
        , f.banco   = null
        , f.agencia = null
        , f.cc      = null
        , f.praca   = null
        , f.observacao = new.observacao
        , f.cliente_origem     = null
        , f.cliente_origem_cod = null
      where f.codforn = :codigo_forn;
    end

    if (new.fornecedor is null) then
      new.fornecedor = :codigo_forn;
  end 
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Colaborador.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/05/2015

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente
ao registro do colaborador quando for marcado como "fornecedor".


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/05/2015 - IMR :
        * Documentacao da trigger.';




/*------ SYSDBA 19/05/2015 21:18:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
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
        , FATURAMENTO_MINIMO
        , FORNECEDOR_FUNCIONARIO
      ) values (
          :codigo_forn
        , 1
        , new.nome_completo
        , new.nome_completo
        , new.cpf
        , substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , null
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
        , f.inscest = substring(trim(trim(coalesce(new.rg_numero, '')) || ' ' || trim(coalesce(new.rg_orgao_emissor, ''))) from 1 for 20) -- RG/Orgao Emissor
        , f.inscmun = null
        , f.ender   = new.ender
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




/*------ SYSDBA 20/05/2015 19:28:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
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




/*------ SYSDBA 20/05/2015 19:29:31 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
AS
  declare variable codigo_forn Integer;
  declare variable grupo_forn Smallint;
begin
  if ( new.flag_fornecedor = 1 ) then
  begin
    /* Buscar Fornecedor referenre ao CPF */
    Select first 1
      f.codforn
    from TBFORNECEDOR f
    where f.cnpj = trim(new.cpf)            -- Cpf informado
      and trim(coalesce(new.cpf, '')) <> '' -- "nao vazio"
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

COMMENT ON TRIGGER TG_FUNCIONARIO_GERAR_FORNECEDOR IS 'Trigger Gerar Fornecedor do Colaborador.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/05/2015

Trigger responsavel por inserir/atualizar um registro de fornecedor corrrespondente
ao registro do colaborador quando for marcado como "fornecedor".


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/05/2015 - IMR :
        * Documentacao da trigger.

    20/05/2015 - IMR :
        * Ajustes pontuais para otimizacao do codigo.';




/*------ SYSDBA 20/05/2015 19:31:08 --------*/

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
        * Documentacao da procedure.

    19/05/2015 - IMR:
        + Cricao da trigger TG_FUNCIONARIO_GERAR_FORNECEDOR para gerar o registro
          de fornecedor correspondente ao funcionario quando este for marcado
          como tal.';




/*------ SYSDBA 20/05/2015 19:32:11 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
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




/*------ SYSDBA 21/05/2015 21:56:34 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD DATA_CADASTRO DMN_DATE;

COMMENT ON COLUMN TBFUNCIONARIO.DATA_CADASTRO IS
'Data de cadastro.';




/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column CODIGO position 1;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column NOME_COMPLETO position 2;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column METAFONEMA position 3;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column SEXO position 4;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FOTO_3X4 position 5;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column CPF position 6;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column RG_NUMERO position 7;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column RG_ORGAO_EMISSOR position 8;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FLAG_VENDEDOR position 9;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FLAG_FORNECEDOR position 10;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column ATIVO position 11;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column USUARIO position 12;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column VENDEDOR position 13;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FORNECEDOR position 14;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column ENDER position 15;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column NUMERO_END position 16;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column COMPLEMENTO position 17;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column BAIRRO position 18;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column CEP position 19;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column CIDADE position 20;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column UF position 21;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column TLG_TIPO position 22;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column LOG_COD position 23;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column BAI_COD position 24;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column CID_COD position 25;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column EST_COD position 26;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column PAIS_ID position 27;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FONE_FIXO position 28;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FONE_CELULAR position 29;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column FONE_COMERCIAL position 30;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column EMAIL position 31;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column OBSERVACAO position 32;


/*------ SYSDBA 21/05/2015 22:02:40 --------*/

alter table TBFUNCIONARIO
alter column DATA_CADASTRO position 33;


/*------ SYSDBA 21/05/2015 22:03:11 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD DATA_NASCIMENTO DMN_DATE;

COMMENT ON COLUMN TBFUNCIONARIO.DATA_NASCIMENTO IS
'Data de nascimento.';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 2;

alter table TBFUNCIONARIO
alter METAFONEMA position 3;

alter table TBFUNCIONARIO
alter SEXO position 4;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 5;

alter table TBFUNCIONARIO
alter CPF position 6;

alter table TBFUNCIONARIO
alter RG_NUMERO position 7;

alter table TBFUNCIONARIO
alter RG_ORGAO_EMISSOR position 8;

alter table TBFUNCIONARIO
alter DATA_NASCIMENTO position 9;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 10;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 11;

alter table TBFUNCIONARIO
alter ATIVO position 12;

alter table TBFUNCIONARIO
alter USUARIO position 13;

alter table TBFUNCIONARIO
alter VENDEDOR position 14;

alter table TBFUNCIONARIO
alter FORNECEDOR position 15;

alter table TBFUNCIONARIO
alter ENDER position 16;

alter table TBFUNCIONARIO
alter NUMERO_END position 17;

alter table TBFUNCIONARIO
alter COMPLEMENTO position 18;

alter table TBFUNCIONARIO
alter BAIRRO position 19;

alter table TBFUNCIONARIO
alter CEP position 20;

alter table TBFUNCIONARIO
alter CIDADE position 21;

alter table TBFUNCIONARIO
alter UF position 22;

alter table TBFUNCIONARIO
alter TLG_TIPO position 23;

alter table TBFUNCIONARIO
alter LOG_COD position 24;

alter table TBFUNCIONARIO
alter BAI_COD position 25;

alter table TBFUNCIONARIO
alter CID_COD position 26;

alter table TBFUNCIONARIO
alter EST_COD position 27;

alter table TBFUNCIONARIO
alter PAIS_ID position 28;

alter table TBFUNCIONARIO
alter FONE_FIXO position 29;

alter table TBFUNCIONARIO
alter FONE_CELULAR position 30;

alter table TBFUNCIONARIO
alter FONE_COMERCIAL position 31;

alter table TBFUNCIONARIO
alter EMAIL position 32;

alter table TBFUNCIONARIO
alter OBSERVACAO position 33;

alter table TBFUNCIONARIO
alter DATA_CADASTRO position 34;




/*------ SYSDBA 21/05/2015 22:03:32 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.CPF IS
'CPF';




/*------ SYSDBA 21/05/2015 22:03:36 --------*/

COMMENT ON COLUMN TBFUNCIONARIO.DATA_NASCIMENTO IS
'Data de nascimento';



/*------ SYSDBA 23/05/2015 09:09:11 --------*/

Alter Table TBCOMPRAS
 add column DNFE_ENTRADA_ANO            DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DNFE_ENTRADA_COD            DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add column DNFE_FORMA                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DNFE_UF                    DMN_UF /* DMN_UF = CHAR(2) */,
 add column DNFE_CNPJ_CPF              DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
 add column DNFE_IE                    DMN_VCHAR_20 /* DMN_VCHAR_20 = VARCHAR(20) */,
 add column DNFE_COMPETENCIA           DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add column DNFE_SERIE                 DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add column DNFE_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add column DNFE_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DNFE_CHAVE                 DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
 add column DECF_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add column DECF_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add column DECF_COO                   DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */;

/*------ SYSDBA 23/05/2015 09:09:11 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 6.
column.

*/

/*------ SYSDBA 23/05/2015 09:10:46 --------*/

Alter Table TBCOMPRAS
 add DNFE_ENTRADA_ANO            DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DNFE_ENTRADA_COD            DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add DNFE_FORMA                 DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DNFE_UF                    DMN_UF /* DMN_UF = CHAR(2) */,
 add DNFE_CNPJ_CPF              DMN_CNPJ /* DMN_CNPJ = VARCHAR(18) */,
 add DNFE_IE                    DMN_VCHAR_20 /* DMN_VCHAR_20 = VARCHAR(20) */,
 add DNFE_COMPETENCIA           DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add DNFE_SERIE                 DMN_VCHAR_04 /* DMN_VCHAR_04 = VARCHAR(4) */,
 add DNFE_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add DNFE_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DNFE_CHAVE                 DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
 add DECF_MODELO                DMN_SMALLINT_N /* DMN_SMALLINT_N = SMALLINT */,
 add DECF_NUMERO                DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
 add DECF_COO                   DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */;

/*------ SYSDBA 23/05/2015 09:10:49 --------*/

COMMIT WORK;

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_ENTRADA_ANO IS
'Devolucao -> Ano Entrada';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_ENTRADA_COD IS
'Devolucao -> Codigo Entrada';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_FORMA IS 
'Devolucao -> Forma/modelo de devolucao:
0 - NFe Eletronica
1 - NFe Modelo 1/1A
2 - NF produtor Rural
3 - Cupom Fiscal';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_UF IS 
'Devolucao -> UF da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_CNPJ_CPF IS 
'Devolucao -> CPF/CNPJ da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_IE IS 
'Devolucao -> IE da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_COMPETENCIA IS 
'Devolucao -> Competencia de emissao da NF devolvida
Obs.: Formato AAMM.';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_SERIE IS 
'Devolucao -> Serie da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_NUMERO IS
'Devolucao -> Numero DF da NF devolvida:
0 - moNFe  (Nota Fiscal Eletronica)
1 - moNFCe (Nota Fiscal do Consumidor Eletronica)';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_MODELO IS 
'Devolucao -> Modelo da NF devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DNFE_CHAVE IS 
'Devolucao -> Chave da NF-e devolvida';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DECF_MODELO IS 
'Devolucao -> Modelo do cupom fiscal devolvido:
0 - (ECFModRefVazio)
1 - 2B = Cupom Fiscal emitido por maquina registradora (ECFModRef2B)
2 - 2C = Cupom Fiscal PDV (ECFModRef2C)
3 - 2D = Cupom Fiscal emitido por ECF (ECFModRef2D)';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DECF_NUMERO IS 
'Devolucao -> Numero da ECF do cupom fiscal devolvido';

/*------ 23/05/2015 09:12:48 --------*/

COMMENT ON COLUMN TBCOMPRAS.DECF_COO IS 
'Devolucao -> Numero COO do cupom fiscal devolvido';


/*------ SYSDBA 23/05/2015 09:15:42 --------*/

ALTER TABLE TBCOMPRAS
ADD CONSTRAINT FK_TBCOMPRAS_DEVOLVER_ENTRADA
FOREIGN KEY (DNFE_ENTRADA_ANO,DNFE_ENTRADA_COD,CODEMP)
REFERENCES TBCOMPRAS(ANO,CODCONTROL,CODEMP);



/*------ SYSDBA 23/05/2015 09:50:52 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
C.DNFE_COMPRA_ANO.
At line 5, column 7.

*/


/*------ SYSDBA 26/05/2015 10:49:29 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM
    ADD FRACIONADOR DMN_PERCENTUAL_3 DEFAULT 1;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX_ITEM.FRACIONADOR IS
'Fracionador';

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
alter FRACIONADOR position 6;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE position 7;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_UNITARIO position 8;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_TOTAL position 9;




/*------ SYSDBA 26/05/2015 10:50:48 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM
    ADD UNIDADE_FRACAO DMN_SMALLINT_N;

COMMENT ON COLUMN TBAPROPRIACAO_ALMOX_ITEM.UNIDADE_FRACAO IS
'Unidade fracao';

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
alter FRACIONADOR position 6;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE position 7;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter UNIDADE_FRACAO position 8;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_UNITARIO position 9;

alter table TBAPROPRIACAO_ALMOX_ITEM
alter CUSTO_TOTAL position 10;




/*------ SYSDBA 26/05/2015 10:51:21 --------*/

ALTER TABLE TBAPROPRIACAO_ALMOX_ITEM
ADD CONSTRAINT FK_TBAPROPRIACAO_ALMOX_ITM_UNDF
FOREIGN KEY (UNIDADE_FRACAO)
REFERENCES TBUNIDADEPROD(UNP_COD);




/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODIGO position 1;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column COD position 2;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column DESCRI position 3;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column APRESENTACAO position 4;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column METAFONEMA position 6;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column MODELO position 7;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PRECO position 8;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 9;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column REFERENCIA position 10;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ESPECIFICACAO position 11;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column SECAO position 12;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column QTDE position 13;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column FRACIONADOR position 14;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PESO_BRUTO position 15;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PESO_LIQUIDO position 16;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUBAGEM position 17;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column VENDA_FRACIONADA position 18;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column UNIDADE position 19;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ESTOQMIN position 20;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODGRUPO position 21;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODFABRICANTE position 22;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUSTOMEDIO position 23;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARCKUP position 24;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARGEM position 25;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PRECO_SUGERIDO position 26;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODEMP position 27;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODSECAO position 28;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODORIGEM position 29;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODTRIBUTACAO position 30;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CST position 31;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CSOSN position 32;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CST_PIS position 33;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CST_COFINS position 34;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column NCM_SH position 35;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODIGO_NVE position 36;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODCFOP position 37;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODBARRA_EAN position 38;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODUNIDADE position 39;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CODUNIDADE_FRACIONADA position 40;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 41;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ALIQUOTA position 42;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 43;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_PIS position 44;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_COFINS position 45;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column VALOR_IPI position 46;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column RESERVA position 47;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PRODUTO_NOVO position 48;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column COR_VEICULO position 49;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column COMBUSTIVEL_VEICULO position 50;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column TIPO_VEICULO position 51;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ANO_MODELO_VEICULO position 52;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ANO_FABRICACAO_VEICULO position 53;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column RENAVAM_VEICULO position 54;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CHASSI_VEICULO position 55;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column KILOMETRAGEM_VEICULO position 56;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column SITUACAO_ATUAL_VEICULO position 57;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column SITUACAO_HISTORICO_VEICULO position 58;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_REDUCAO_BC position 59;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column USUARIO position 60;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CADASTRO_ATIVO position 61;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column MOVIMENTA_ESTOQUE position 62;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column COMPOR_FATURAMENTO position 63;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column PRODUTO_IMOBILIZADO position 64;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column ESTOQUE_APROP_LOTE position 65;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUST_DESP_OFIC position 66;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUST_DESP_GERAIS position 67;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUST_DESP_ADM position 68;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUST_COMISSAO position 69;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column CUST_IMPOSTO position 70;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column FI_RET_FINANC position 71;


/*------ SYSDBA 26/05/2015 11:06:23 --------*/

alter table TBPRODUTO
alter column FI_RET_PLANO position 72;


/*------ SYSDBA 26/05/2015 11:07:17 --------*/

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_UNIDADE_FRAC
FOREIGN KEY (CODUNIDADE_FRACIONADA)
REFERENCES TBUNIDADEPROD(UNP_COD);




/*------ SYSDBA 26/05/2015 13:03:31 --------*/

ALTER TABLE TBCLIENTE
    ADD ATIVO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCLIENTE.ATIVO IS
'Cadastro ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 26/05/2015 13:04:13 --------*/

ALTER TABLE TBFORNECEDOR
    ADD ATIVO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORNECEDOR.ATIVO IS
'Cadastro ativo:
0 - Nao
1 - Sim';

alter table TBFORNECEDOR
alter CODFORN position 1;

alter table TBFORNECEDOR
alter TIPO position 2;

alter table TBFORNECEDOR
alter PESSOA_FISICA position 3;

alter table TBFORNECEDOR
alter NOMEFORN position 4;

alter table TBFORNECEDOR
alter NOMEFANT position 5;

alter table TBFORNECEDOR
alter CNPJ position 6;

alter table TBFORNECEDOR
alter INSCEST position 7;

alter table TBFORNECEDOR
alter INSCMUN position 8;

alter table TBFORNECEDOR
alter ENDER position 9;

alter table TBFORNECEDOR
alter COMPLEMENTO position 10;

alter table TBFORNECEDOR
alter NUMERO_END position 11;

alter table TBFORNECEDOR
alter CEP position 12;

alter table TBFORNECEDOR
alter CIDADE position 13;

alter table TBFORNECEDOR
alter UF position 14;

alter table TBFORNECEDOR
alter CONTATO position 15;

alter table TBFORNECEDOR
alter FONE position 16;

alter table TBFORNECEDOR
alter FONECEL position 17;

alter table TBFORNECEDOR
alter FONEFAX position 18;

alter table TBFORNECEDOR
alter EMAIL position 19;

alter table TBFORNECEDOR
alter SITE position 20;

alter table TBFORNECEDOR
alter TLG_TIPO position 21;

alter table TBFORNECEDOR
alter LOG_COD position 22;

alter table TBFORNECEDOR
alter BAI_COD position 23;

alter table TBFORNECEDOR
alter CID_COD position 24;

alter table TBFORNECEDOR
alter EST_COD position 25;

alter table TBFORNECEDOR
alter PAIS_ID position 26;

alter table TBFORNECEDOR
alter GRF_COD position 27;

alter table TBFORNECEDOR
alter TRANSPORTADORA position 28;

alter table TBFORNECEDOR
alter BANCO position 29;

alter table TBFORNECEDOR
alter AGENCIA position 30;

alter table TBFORNECEDOR
alter CC position 31;

alter table TBFORNECEDOR
alter PRACA position 32;

alter table TBFORNECEDOR
alter OBSERVACAO position 33;

alter table TBFORNECEDOR
alter DTCAD position 34;

alter table TBFORNECEDOR
alter ATIVO position 35;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM position 36;

alter table TBFORNECEDOR
alter CLIENTE_ORIGEM_COD position 37;

alter table TBFORNECEDOR
alter FATURAMENTO_MINIMO position 38;

alter table TBFORNECEDOR
alter FORNECEDOR_FUNCIONARIO position 39;




/*------ SYSDBA 26/05/2015 13:05:47 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_gerar_fornecedor for tbcliente
active after insert or update position 1
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
        , f.observacao = new.observacao
        , f.cliente_origem     =  new.cnpj
        , f.cliente_origem_cod = new.codigo
      where f.codforn = :codigo_forn;
    end 
  end 
end^

SET TERM ; ^




/*------ SYSDBA 26/05/2015 13:06:14 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_cod for tbcliente
active before insert position 0
As
Begin
  new.ativo = coalesce(new.ativo, 1);
  If (New.Codigo Is Null) Then
    New.Codigo = Gen_id(GEN_CLIENTE_ID, 1);
End^

SET TERM ; ^




/*------ SYSDBA 26/05/2015 13:06:50 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_fornecedor_cod for tbfornecedor
active before insert position 0
As
Begin
  new.ativo                  = coalesce(new.ativo, 1);
  new.fornecedor_funcionario = coalesce(new.fornecedor_funcionario, 0);

  If (New.CODFORN Is Null) Then
    New.CODFORN = Gen_id(GEN_FORNECEDOR_ID, 1);
End^

SET TERM ; ^




/*------ SYSDBA 26/05/2015 13:12:36 --------*/

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
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
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




/*------ SYSDBA 26/05/2015 15:55:11 --------*/

COMMENT ON TABLE TBFORNECEDOR IS 'Tabela Fornecedores

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar os dados dos fornecedores cadastrados no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/05/2015 - IMR :
        + Criacao dos campos ATIVO para controle dos cadastros ativos.

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.

    22/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar fornecedor tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL.';




/*------ SYSDBA 26/05/2015 15:55:44 --------*/

COMMENT ON TABLE TBCLIENTE IS 'Tabela de Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2011

Tabela responsavel por armazenar os dados referentes aos clientes mantidos pelos sistemas de gestao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/05/2015 - IMR :
        + Criacao dos campos ATIVO para controle dos cadastros ativos.

    29/05/2014 - IMR :
        + Criacao do campos NOMEFANT para que seja possivel pesquisar clientes tambem pelo NOME FANTASIA, uma vez que
          o sistema esta permitindo apenas pela RAZAO SOCIAL (NOME).

    28/05/2014 - IMR :
        + Criacao dos campos BANCO, AGENCIA, CC e OBSERVACAO para atender solicitacoes do novo cliente.';




/*------ SYSDBA 26/05/2015 15:57:04 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_funcionario_gerar_fornecedor for tbfuncionario
active before insert or update position 1
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




/*------ SYSDBA 26/05/2015 15:58:08 --------*/

COMMENT ON TABLE TBFUNCIONARIO IS 'Tabela de FUncionarios (SGI).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   11/03/2015

Tabela responsavel por armazenar o cadastro simplificado dos funcionarios da(s) empresa(s) registros pelo SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/05/2015 - IMR:
        + Cricao da trigger TG_FUNCIONARIO_GERAR_FORNECEDOR para gerar o registro
          de fornecedor correspondente ao funcionario quando este for marcado
          como tal.

    12/03/2015 - IMR :
        * Documentacao da procedure.';




/*------ SYSDBA 26/05/2015 15:59:45 --------*/

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
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
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
          , ea.custo_medio
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            estoque_cc
          , custo_cc;

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




/*------ SYSDBA 26/05/2015 16:02:18 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque        DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable fracionador_cc DMN_PERCENTUAL_3;
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
        , estoque
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque     = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :Estoque
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

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);
        custo_cc       = coalesce(:custo_cc, 0.0);

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




/*------ SYSDBA 26/05/2015 16:12:16 --------*/

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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
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

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);
        custo_cc       = coalesce(:custo_cc, 0.0);

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                                          -- Informando o custo medio fracionado anteriormente
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




/*------ SYSDBA 26/05/2015 16:17:13 --------*/

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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
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

        -- Calcular o Custo Medido para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);
        custo_cc       = coalesce(:custo_cc, 0.0);

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                                          -- Informando o custo medio fracionado anteriormente
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




/*------ SYSDBA 26/05/2015 16:18:04 --------*/

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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
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
        fracionador_cc = coalesce(:fracionador_cc, 1.0);
        custo_cc       = coalesce(:custo_cc, 0.0);

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = coalesce(ea.qtde, 0.0) + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                                          -- Informando o custo medio fracionado anteriormente
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




/*------ SYSDBA 26/05/2015 16:18:17 --------*/

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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
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
            ea.qtde        = coalesce(ea.qtde, 0.0) + (:quantidade * :fracionador) -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                                          -- Informando o custo medio fracionado anteriormente
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




/*------ SYSDBA 26/05/2015 16:20:17 --------*/

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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
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




/*------ SYSDBA 26/05/2015 16:21:29 --------*/

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
        , coalesce(p.Qtde, 0)
        , coalesce(p.customedio, 0)
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




/*------ SYSDBA 26/05/2015 17:39:25 --------*/

ALTER TABLE TBESTOQUE_ALMOX
    ADD DESCRICAO DMN_VCHAR_30;

COMMENT ON COLUMN TBESTOQUE_ALMOX.DESCRICAO IS
'Descricao do lote';

alter table TBESTOQUE_ALMOX
alter EMPRESA position 1;

alter table TBESTOQUE_ALMOX
alter CENTRO_CUSTO position 2;

alter table TBESTOQUE_ALMOX
alter PRODUTO position 3;

alter table TBESTOQUE_ALMOX
alter LOTE position 4;

alter table TBESTOQUE_ALMOX
alter DESCRICAO position 5;

alter table TBESTOQUE_ALMOX
alter DATA_FABRICACAO position 6;

alter table TBESTOQUE_ALMOX
alter DATA_VALIDADE position 7;

alter table TBESTOQUE_ALMOX
alter QTDE position 8;

alter table TBESTOQUE_ALMOX
alter FRACIONADOR position 9;

alter table TBESTOQUE_ALMOX
alter UNIDADE position 10;

alter table TBESTOQUE_ALMOX
alter CUSTO_MEDIO position 11;

alter table TBESTOQUE_ALMOX
alter ID position 12;



/*------ 01/06/2015 19:30:03 --------*/

CREATE GENERATOR GEN_COMPLEMENTAR;

/*------ 01/06/2015 19:30:03 --------*/

CREATE TABLE TBNFE_COMPLEMENTAR (
    NFC_NUMERO   DMN_BIGINT_NN NOT NULL /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    NFC_EMPRESA  DMN_CNPJ_NN /* DMN_CNPJ_NN = VARCHAR(18) NOT NULL */,
    NFC_DATA     DMN_DATE /* DMN_DATE = DATE */,
    NFC_HORA     DMN_TIME /* DMN_TIME = TIME */,
    NFC_ENVIADA  DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    NFC_TEXTO    DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    NFE_SERIE    DMN_VCHAR_03_NN /* DMN_VCHAR_03_NN = VARCHAR(3) NOT NULL */,
    NFE_NUMERO   DMN_BIGINT_NN /* DMN_BIGINT_NN = INTEGER NOT NULL */,
    NFE_MODELO   DMN_SMALLINT_NN DEFAULT 0 NOT NULL /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    NUMERO       DMN_BIGINT_N /* DMN_BIGINT_N = INTEGER */,
    PROTOCOLO    DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
    XML          DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */
);

/*------ 01/06/2015 19:30:03 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ADD CONSTRAINT PK_TBNFE_COMPLEMENTAR PRIMARY KEY (NFC_NUMERO);

/*------ 01/06/2015 19:30:03 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_EMP FOREIGN KEY (NFC_EMPRESA) REFERENCES TBEMPRESA (CNPJ) ON UPDATE CASCADE;

/*------ 01/06/2015 19:30:03 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_NFE FOREIGN KEY (NFC_EMPRESA, NFE_SERIE, NFE_NUMERO, NFE_MODELO) REFERENCES TBNFE_ENVIADA (EMPRESA, SERIE, NUMERO, MODELO);

/*------ 01/06/2015 19:30:03 --------*/

SET TERM ^ ;

CREATE OR ALTER TRIGGER TG_COMPLEMENTAR_COD FOR TBNFE_COMPLEMENTAR
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if ( coalesce(new.NFC_numero, 0) = 0 ) then
    new.NFC_numero = GEN_ID(GEN_COMPLEMENTAR, 1);
end^

/*------ 01/06/2015 19:30:03 --------*/

SET TERM ; ^

COMMENT ON TABLE TBNFE_COMPLEMENTAR IS 
'Tabela de NF Complementar (CC-e).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/06/2015

Tabela responsavel por armazenar os registros de notas fiscais complementares
das NF-e emitidas no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    01/06/2015 - IMR :
        + Documentacao da tabela.';

/*------ 01/06/2015 19:30:03 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_NUMERO IS 
'Numero/Codigo.';

/*------ 01/06/2015 19:30:03 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_EMPRESA IS 
'Empresa.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_DATA IS 
'Data.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_HORA IS 
'Hora.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_ENVIADA IS 
'NF complementar enviada:
0 - Nao
1 - Sim';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_TEXTO IS 
'Texto geral.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFE_SERIE IS 
'Serie da Nota Fiscal.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFE_NUMERO IS 
'Numero da Nota Fiscal.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFE_MODELO IS 
'Modelo da Nota Fiscal.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NUMERO IS 
'Retorno NF-e: Sequencial do Evento.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.PROTOCOLO IS 
'Retorno NF-e: Protocolo do Evento.';

/*------ 01/06/2015 19:30:04 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.XML IS 
'Retorno NF-e: XML de Resposta.';

/*------ 01/06/2015 19:30:04 --------*/

GRANT ALL ON TBNFE_COMPLEMENTAR TO PUBLIC;


/*------ SYSDBA 01/06/2015 19:41:43 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
    ADD TIPO DMN_SMALLINT_NN,
    ADD FORNECEDOR DMN_INTEGER_N,
    ADD CLIENTE DMN_INTEGER_N;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.TIPO IS
'Tipo:
0 - Entrada
1 - Saida';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.CLIENTE IS
'Cliente';




/*------ SYSDBA 01/06/2015 19:42:11 --------*/

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_TIPO
ON TBNFE_COMPLEMENTAR (TIPO);




/*------ SYSDBA 01/06/2015 19:42:59 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_FRN
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);

ALTER TABLE TBNFE_COMPLEMENTAR
ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_CLI
FOREIGN KEY (CLIENTE)
REFERENCES TBCLIENTE(CODIGO);




/*------ SYSDBA 01/06/2015 19:43:16 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN TIPO
SET DEFAULT 1
;




/*------ SYSDBA 01/06/2015 19:46:55 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
    ADD SERIE DMN_VCHAR_03,
    ADD RECIBO DMN_VCHAR_250;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.SERIE IS
'Envio NF-e: Serie.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NUMERO IS
'Envio NF-e: Sequencial.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.RECIBO IS
'Envio NF-e: Recibo.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.PROTOCOLO IS
'Retorno NF-e: Protocolo.';

alter table TBNFE_COMPLEMENTAR
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMPRESA position 2;

alter table TBNFE_COMPLEMENTAR
alter NFC_DATA position 3;

alter table TBNFE_COMPLEMENTAR
alter NFC_HORA position 4;

alter table TBNFE_COMPLEMENTAR
alter NFC_ENVIADA position 5;

alter table TBNFE_COMPLEMENTAR
alter NFC_TEXTO position 6;

alter table TBNFE_COMPLEMENTAR
alter NFE_SERIE position 7;

alter table TBNFE_COMPLEMENTAR
alter NFE_NUMERO position 8;

alter table TBNFE_COMPLEMENTAR
alter NFE_MODELO position 9;

alter table TBNFE_COMPLEMENTAR
alter SERIE position 10;

alter table TBNFE_COMPLEMENTAR
alter NUMERO position 11;

alter table TBNFE_COMPLEMENTAR
alter RECIBO position 12;

alter table TBNFE_COMPLEMENTAR
alter PROTOCOLO position 13;

alter table TBNFE_COMPLEMENTAR
alter XML position 14;

alter table TBNFE_COMPLEMENTAR
alter TIPO position 15;

alter table TBNFE_COMPLEMENTAR
alter FORNECEDOR position 16;

alter table TBNFE_COMPLEMENTAR
alter CLIENTE position 17;




/*------ SYSDBA 01/06/2015 19:51:19 --------*/

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_REC
ON TBNFE_COMPLEMENTAR (RECIBO,PROTOCOLO);

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_NRO
ON TBNFE_COMPLEMENTAR (SERIE,NUMERO);



/*------ 01/06/2015 19:53:35 --------*/

Alter Table TBNFE_COMPLEMENTAR
    add NFC_MODALIDADE_FRETE       DMN_SMALLINT_NN DEFAULT 3 /* DMN_SMALLINT_NN = SMALLINT DEFAULT 0 */,
    add NFE_TRANSPORTADORA         DMN_INTEGER_N /* DMN_INTEGER_N = INTEGER */,
    add NFE_PLACA_VEICULO          DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */,
    add NFE_PLACA_UF               DMN_VCHAR_02 /* DMN_VCHAR_02 = VARCHAR(2) */,
    add NFE_PLACA_RNTC             DMN_VCHAR_10 /* DMN_VCHAR_10 = VARCHAR(10) */,
    add NFE_VALOR_BASE_ICMS        DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_ICMS             DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_BASE_ICMS_SUBST  DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_ICMS_SUBST       DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_TOTAL_PRODUTO    DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_FRETE            DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_SEGURO           DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_DESCONTO         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_TOTAL_II         DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_TOTAL_IPI        DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_PIS              DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_COFINS           DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_OUTROS           DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */,
    add NFE_VALOR_TOTAL_NOTA       DMN_MONEY /* DMN_MONEY = NUMERIC(15,2) */;


/*------ SYSDBA 01/06/2015 19:54:04 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_TRANSPORTADORA TO NFC_TRANSPORTADORA;




/*------ SYSDBA 01/06/2015 19:54:11 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_PLACA_VEICULO TO NFC_PLACA_VEICULO;




/*------ SYSDBA 01/06/2015 19:54:16 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_PLACA_UF TO NFC_PLACA_UF;




/*------ SYSDBA 01/06/2015 19:54:19 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_PLACA_RNTC TO NFC_PLACA_RNTC;




/*------ SYSDBA 01/06/2015 19:54:23 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_BASE_ICMS TO NFC_VALOR_BASE_ICMS;




/*------ SYSDBA 01/06/2015 19:54:27 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_ICMS TO NFC_VALOR_ICMS;




/*------ SYSDBA 01/06/2015 19:54:30 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_BASE_ICMS_SUBST TO NFC_VALOR_BASE_ICMS_SUBST;




/*------ SYSDBA 01/06/2015 19:54:33 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_ICMS_SUBST TO NFC_VALOR_ICMS_SUBST;




/*------ SYSDBA 01/06/2015 19:54:37 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_TOTAL_PRODUTO TO NFC_VALOR_TOTAL_PRODUTO;




/*------ SYSDBA 01/06/2015 19:54:40 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_FRETE TO NFC_VALOR_FRETE;




/*------ SYSDBA 01/06/2015 19:54:43 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_SEGURO TO NFC_VALOR_SEGURO;




/*------ SYSDBA 01/06/2015 19:54:46 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_DESCONTO TO NFC_VALOR_DESCONTO;




/*------ SYSDBA 01/06/2015 19:54:50 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_TOTAL_II TO NFC_VALOR_TOTAL_II;




/*------ SYSDBA 01/06/2015 19:54:54 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_TOTAL_IPI TO NFC_VALOR_TOTAL_IPI;




/*------ SYSDBA 01/06/2015 19:54:57 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_PIS TO NFC_VALOR_PIS;




/*------ SYSDBA 01/06/2015 19:55:00 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_COFINS TO NFC_VALOR_COFINS;




/*------ SYSDBA 01/06/2015 19:55:03 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_OUTROS TO NFC_VALOR_OUTROS;




/*------ SYSDBA 01/06/2015 19:55:07 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER NFE_VALOR_TOTAL_NOTA TO NFC_VALOR_TOTAL_NOTA;




/*------ SYSDBA 01/06/2015 19:55:24 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_BASE_ICMS
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:55:29 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_ICMS
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:55:34 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_BASE_ICMS_SUBST
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:55:40 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_ICMS_SUBST
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:55:44 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_TOTAL_PRODUTO
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:55:50 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_FRETE
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:55:56 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_SEGURO
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:02 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_DESCONTO
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:08 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_TOTAL_II
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:16 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_TOTAL_IPI
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:24 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_PIS
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:29 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_COFINS
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:36 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_OUTROS
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:56:41 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER COLUMN NFC_VALOR_TOTAL_NOTA
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 19:58:13 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_MODALIDADE_FRETE IS
'Modalidade Frete:
0 -  (0) Por conta do Emitente               [CIF - (Cost, Insurance and Freight - “Custo, Seguros e Frete”)]
1 -  (1) Por conta do Destinatario/Remetente [FOB - (Free on Board - “Livre a bordo”)]
2 -  (2) Por conta de Terceiros
3 -  (9) Sem Frete';




/*------ SYSDBA 01/06/2015 19:58:56 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_TRN
FOREIGN KEY (NFC_TRANSPORTADORA)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 01/06/2015 19:59:19 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_TRANSPORTADORA IS
'Transportadora (Fornecedor de servico de transporte).';




/*------ SYSDBA 01/06/2015 19:59:28 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_TRANSPORTADORA IS
'Transportadora (Fornecedor do servico de transporte).';




/*------ SYSDBA 01/06/2015 19:59:58 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_PLACA_RNTC IS
'RNCT do Veiculo.

RNTC - Registros Nacional de Transportes de Carga (Identificacao do vagao quando o transporte for Trem)';




/*------ SYSDBA 01/06/2015 20:06:31 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
    ADD NFC_EMISSAO DMN_DATE;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_EMISSAO IS
'Data de emissao.';

alter table TBNFE_COMPLEMENTAR
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMPRESA position 2;

alter table TBNFE_COMPLEMENTAR
alter NFC_DATA position 3;

alter table TBNFE_COMPLEMENTAR
alter NFC_HORA position 4;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMISSAO position 5;

alter table TBNFE_COMPLEMENTAR
alter NFC_ENVIADA position 6;

alter table TBNFE_COMPLEMENTAR
alter NFC_TEXTO position 7;

alter table TBNFE_COMPLEMENTAR
alter NFE_SERIE position 8;

alter table TBNFE_COMPLEMENTAR
alter NFE_NUMERO position 9;

alter table TBNFE_COMPLEMENTAR
alter NFE_MODELO position 10;

alter table TBNFE_COMPLEMENTAR
alter SERIE position 11;

alter table TBNFE_COMPLEMENTAR
alter NUMERO position 12;

alter table TBNFE_COMPLEMENTAR
alter RECIBO position 13;

alter table TBNFE_COMPLEMENTAR
alter PROTOCOLO position 14;

alter table TBNFE_COMPLEMENTAR
alter XML position 15;

alter table TBNFE_COMPLEMENTAR
alter TIPO position 16;

alter table TBNFE_COMPLEMENTAR
alter FORNECEDOR position 17;

alter table TBNFE_COMPLEMENTAR
alter CLIENTE position 18;

alter table TBNFE_COMPLEMENTAR
alter NFC_MODALIDADE_FRETE position 19;

alter table TBNFE_COMPLEMENTAR
alter NFC_TRANSPORTADORA position 20;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_VEICULO position 21;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_UF position 22;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_RNTC position 23;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_BASE_ICMS position 24;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_ICMS position 25;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_BASE_ICMS_SUBST position 26;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_ICMS_SUBST position 27;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_PRODUTO position 28;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_FRETE position 29;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_SEGURO position 30;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_DESCONTO position 31;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_II position 32;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_IPI position 33;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_PIS position 34;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_COFINS position 35;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_OUTROS position 36;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_NOTA position 37;




/*------ SYSDBA 01/06/2015 20:13:09 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR DROP CONSTRAINT FK_TBNFE_COMPLEMENTAR_TRN;




/*------ SYSDBA 01/06/2015 20:13:45 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_TRN
FOREIGN KEY (NFC_TRANSPORTADORA)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 01/06/2015 20:22:53 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFE_SERIE IS
'NF-e de origem: Serie da Nota Fiscal.';




/*------ SYSDBA 01/06/2015 20:22:56 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFE_NUMERO IS
'NF-e de origem: Numero da Nota Fiscal.';




/*------ SYSDBA 01/06/2015 20:23:00 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFE_MODELO IS
'NF-e de origem: Modelo da Nota Fiscal.';




/*------ SYSDBA 01/06/2015 20:28:29 --------*/

CREATE INDEX IDX_TVENDASITENS_ITENS
ON TVENDASITENS (ANO,CODCONTROL,SEQ);




/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column ANO position 1;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CODCONTROL position 2;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CODEMP position 3;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column SEQ position 4;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CODPROD position 5;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CODCLIENTE position 6;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CODCLI position 7;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column DTVENDA position 8;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column QTDE position 9;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column PUNIT position 10;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column PUNIT_PROMOCAO position 11;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column DESCONTO position 12;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column DESCONTO_VALOR position 13;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column PFINAL position 14;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column QTDEFINAL position 15;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column UNID_COD position 16;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CFOP_COD position 17;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CST position 18;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column CSOSN position 19;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column ALIQUOTA position 20;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column ALIQUOTA_CSOSN position 21;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column ALIQUOTA_PIS position 22;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column ALIQUOTA_COFINS position 23;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column VALOR_IPI position 24;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column PERCENTUAL_REDUCAO_BC position 25;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column TOTAL_BRUTO position 26;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column TOTAL_DESCONTO position 27;


/*------ SYSDBA 01/06/2015 20:29:33 --------*/

alter table TVENDASITENS
alter column TOTAL_LIQUIDO position 28;


/*------ SYSDBA 01/06/2015 20:29:49 --------*/

DROP INDEX IDX_TVENDASITENS_ITENS;

CREATE INDEX IDX_TVENDASITENS_ITENS
ON TVENDASITENS (ANO,CODCONTROL,CODEMP,SEQ);




/*------ SYSDBA 01/06/2015 20:39:58 --------*/

CREATE TABLE TBNFE_COMPLEMENTAR_ITEM (
    NFC_NUMERO DMN_BIGINT_NN NOT NULL,
    NFC_ITEM DMN_SMALLINT_NN NOT NULL,
    MOV_ANO DMN_SMALLINT_N,
    MOV_CONTROLE DMN_BIGINT_N,
    MOV_EMPRESA DMN_CNPJ,
    MOV_SEQ DMN_SMALLINT_N,
    QUANTIDADE DMN_QUANTIDADE_D3,
    VALOR_UNITARIO DMN_MONEY,
    DESCONTO DMN_PERCENTUAL_3,
    DESCONTO_VALOR DMN_MONEY_DESCONTO_4,
    VALOR_FINAL DMN_MONEY_4,
    TOTAL_BRUTO DMN_MONEY,
    TOTAL_DESCONTO DMN_MONEY,
    TOTAL_LIQUIDO DMN_MONEY);

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
ADD CONSTRAINT PK_TBNFE_COMPLEMENTAR_ITEM
PRIMARY KEY (NFC_NUMERO,NFC_ITEM);

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.QUANTIDADE IS
'Quantidade

(Aceita valores decimais)';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.DESCONTO IS
'Percentual c/ 3 casas decimais.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.DESCONTO_VALOR IS
'Valor Desconto c/ 4 cadas decimais.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_FINAL IS
'Valor Desconto c/ 4 cadas decimais.';




/*------ SYSDBA 01/06/2015 20:40:25 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_ITEM
FOREIGN KEY (NFC_NUMERO)
REFERENCES TBNFE_COMPLEMENTAR(NFC_NUMERO)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 01/06/2015 20:41:02 --------*/

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_ITEM
ON TBNFE_COMPLEMENTAR_ITEM (MOV_ANO,MOV_CONTROLE,MOV_EMPRESA,MOV_SEQ);




/*------ SYSDBA 01/06/2015 20:42:24 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.NFC_NUMERO IS
'Numero da NF complementar.';




/*------ SYSDBA 01/06/2015 20:42:30 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.NFC_ITEM IS
'Item.';




/*------ SYSDBA 01/06/2015 20:42:48 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.MOV_ANO IS
'Movimento de origem: Ano.';




/*------ SYSDBA 01/06/2015 20:42:59 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.MOV_CONTROLE IS
'Movimento de origem: Controle.';




/*------ SYSDBA 01/06/2015 20:43:07 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.MOV_EMPRESA IS
'Movimento de origem: Empresa.';




/*------ SYSDBA 01/06/2015 20:43:22 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.MOV_SEQ IS
'Movimento de origem: Sequencial item.';




/*------ SYSDBA 01/06/2015 20:43:37 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_UNITARIO IS
'Valor Unitario';




/*------ SYSDBA 01/06/2015 20:43:47 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.DESCONTO IS
'Percentual do desconto.';




/*------ SYSDBA 01/06/2015 20:43:56 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.DESCONTO_VALOR IS
'Valor de desconto.';




/*------ SYSDBA 01/06/2015 20:44:18 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_FINAL IS
'Valor unitario final = (Valor Unitario - Valor Desconto)';




/*------ SYSDBA 01/06/2015 20:44:26 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.TOTAL_BRUTO IS
'Total Bruto.';




/*------ SYSDBA 01/06/2015 20:44:40 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.TOTAL_DESCONTO IS
'Total Desconto.';




/*------ SYSDBA 01/06/2015 20:45:01 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.TOTAL_LIQUIDO IS
'Total Liquido = (Total Bruto - Total Desconto)';




/*------ SYSDBA 01/06/2015 20:45:26 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.TOTAL_LIQUIDO IS
'Total Liquido.';




/*------ SYSDBA 01/06/2015 20:50:11 --------*/

COMMENT ON TABLE TBNFE_COMPLEMENTAR IS 'Tabela de NF Complementar (CC-e).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/06/2015

Tabela responsavel por armazenar os registros de notas fiscais complementares
das NF-e emitidas no sistema.
Obs.: Uma nota fiscal complementar para uma nota fiscal emitida.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    01/06/2015 - IMR :
        + Documentacao da tabela.';




/*------ SYSDBA 01/06/2015 20:50:50 --------*/

COMMENT ON TABLE TBNFE_COMPLEMENTAR_ITEM IS 'Tabela de Itens da NF Complementar (CC-e).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/06/2015

Tabela responsavel por armazenar os registros de itens das notas fiscais
complementares das NF-e emitidas no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    01/06/2015 - IMR :
        + Documentacao da tabela.';

GRANT ALL ON TBNFE_COMPLEMENTAR_ITEM TO "PUBLIC";



/*------ SYSDBA 01/06/2015 21:02:20 --------*/

CREATE INDEX IDX_TBNFE_ENVIADA_VENDA
ON TBNFE_ENVIADA (ANOVENDA,NUMVENDA);

CREATE INDEX IDX_TBNFE_ENVIADA_COMPRA
ON TBNFE_ENVIADA (ANOCOMPRA,NUMCOMPRA);




/*------ SYSDBA 01/06/2015 21:03:19 --------*/

ALTER TABLE TBNFE_ENVIADA
    ADD NFC_NUMERO DMN_BIGINT_N;

COMMENT ON COLUMN TBNFE_ENVIADA.NFC_NUMERO IS
'Nota fiscal complementar.';

alter table TBNFE_ENVIADA
alter EMPRESA position 1;

alter table TBNFE_ENVIADA
alter SERIE position 2;

alter table TBNFE_ENVIADA
alter NUMERO position 3;

alter table TBNFE_ENVIADA
alter MODELO position 4;

alter table TBNFE_ENVIADA
alter VERSAO position 5;

alter table TBNFE_ENVIADA
alter ANOVENDA position 6;

alter table TBNFE_ENVIADA
alter NUMVENDA position 7;

alter table TBNFE_ENVIADA
alter ANOCOMPRA position 8;

alter table TBNFE_ENVIADA
alter NUMCOMPRA position 9;

alter table TBNFE_ENVIADA
alter NFC_NUMERO position 10;

alter table TBNFE_ENVIADA
alter DATAEMISSAO position 11;

alter table TBNFE_ENVIADA
alter HORAEMISSAO position 12;

alter table TBNFE_ENVIADA
alter CHAVE position 13;

alter table TBNFE_ENVIADA
alter PROTOCOLO position 14;

alter table TBNFE_ENVIADA
alter RECIBO position 15;

alter table TBNFE_ENVIADA
alter XML_FILENAME position 16;

alter table TBNFE_ENVIADA
alter XML_FILE position 17;

alter table TBNFE_ENVIADA
alter LOTE_ANO position 18;

alter table TBNFE_ENVIADA
alter LOTE_NUM position 19;




/*------ SYSDBA 01/06/2015 21:03:46 --------*/

CREATE INDEX IDX_TBNFE_ENVIADA_NFC
ON TBNFE_ENVIADA (NFC_NUMERO);




/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_NUMERO position 1;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_EMPRESA position 2;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column TIPO position 3;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_DATA position 4;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_HORA position 5;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_EMISSAO position 6;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_ENVIADA position 7;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_TEXTO position 8;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFE_SERIE position 9;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFE_NUMERO position 10;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFE_MODELO position 11;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column SERIE position 12;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NUMERO position 13;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column RECIBO position 14;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column PROTOCOLO position 15;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column XML position 16;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column FORNECEDOR position 17;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column CLIENTE position 18;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_MODALIDADE_FRETE position 19;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_TRANSPORTADORA position 20;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_PLACA_VEICULO position 21;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_PLACA_UF position 22;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_PLACA_RNTC position 23;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_BASE_ICMS position 24;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_ICMS position 25;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_BASE_ICMS_SUBST position 26;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_ICMS_SUBST position 27;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_PRODUTO position 28;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_FRETE position 29;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_SEGURO position 30;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_DESCONTO position 31;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_II position 32;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_IPI position 33;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_PIS position 34;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_COFINS position 35;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_OUTROS position 36;


/*------ SYSDBA 01/06/2015 21:14:55 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_NOTA position 37;


/*------ SYSDBA 01/06/2015 21:15:10 --------*/

DROP INDEX IDX_TBNFE_COMPLEMENTAR_TIPO;




/*------ SYSDBA 01/06/2015 21:15:21 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR ALTER TIPO TO NFC_TIPO;




/*------ SYSDBA 01/06/2015 21:15:47 --------*/

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_TIPO
ON TBNFE_COMPLEMENTAR (NFC_TIPO);




/*------ SYSDBA 01/06/2015 21:16:35 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN QUANTIDADE
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 21:16:43 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN VALOR_UNITARIO
SET DEFAULT 0.0
;




/*------ SYSDBA 01/06/2015 21:21:36 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
    ADD CANCELADA DMN_LOGICO DEFAULT 0,
    ADD CANCELADA_USUARIO DMN_VCHAR_50,
    ADD CANCELADA_DATAHORA DMN_DATETIME,
    ADD CANCELADA_MOTIVO DMN_TEXTO;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.CANCELADA IS
'NF complementar cancelada:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.CANCELADA_USUARIO IS
'Usuario do cancelamento.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.CANCELADA_DATAHORA IS
'Data/hora do cancelamento.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.CANCELADA_MOTIVO IS
'Motivo do cancelamento.';




/*------ SYSDBA 01/06/2015 21:22:50 --------*/

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_CAN
ON TBNFE_COMPLEMENTAR (CANCELADA);




/*------ SYSDBA 01/06/2015 21:46:17 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
    ADD ALIQUOTA_ICMS DMN_PERCENTUAL,
    ADD ALIQUOTA_ICMS_ST DMN_PERCENTUAL;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.ALIQUOTA_ICMS IS
'Aliquota de ICMS.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.ALIQUOTA_ICMS_ST IS
'Aliquota de ICMS p/ Substituicao Tributaria.';

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_ITEM position 2;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_ANO position 3;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_CONTROLE position 4;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_EMPRESA position 5;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_SEQ position 6;

alter table TBNFE_COMPLEMENTAR_ITEM
alter QUANTIDADE position 7;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_UNITARIO position 8;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO position 9;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO_VALOR position 10;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_FINAL position 11;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS position 12;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS_ST position 13;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_BRUTO position 14;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_DESCONTO position 15;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_LIQUIDO position 16;




/*------ SYSDBA 02/06/2015 22:59:14 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR DROP XML;




/*------ SYSDBA 02/06/2015 22:59:49 --------*/

DROP INDEX IDX_TBNFE_COMPLEMENTAR_REC;

CREATE INDEX IDX_TBNFE_COMPLEMENTAR_REC
ON TBNFE_COMPLEMENTAR (RECIBO);




/*------ SYSDBA 02/06/2015 22:59:57 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR DROP PROTOCOLO;




/*------ SYSDBA 02/06/2015 23:01:58 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
    ADD NFC_EMISSOR DMN_VCHAR_50;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_EMISSOR IS
'Usuario emissor.';

alter table TBNFE_COMPLEMENTAR
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMPRESA position 2;

alter table TBNFE_COMPLEMENTAR
alter NFC_TIPO position 3;

alter table TBNFE_COMPLEMENTAR
alter NFC_DATA position 4;

alter table TBNFE_COMPLEMENTAR
alter NFC_HORA position 5;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMISSAO position 6;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMISSOR position 7;

alter table TBNFE_COMPLEMENTAR
alter NFC_ENVIADA position 8;

alter table TBNFE_COMPLEMENTAR
alter NFC_TEXTO position 9;

alter table TBNFE_COMPLEMENTAR
alter NFE_SERIE position 10;

alter table TBNFE_COMPLEMENTAR
alter NFE_NUMERO position 11;

alter table TBNFE_COMPLEMENTAR
alter NFE_MODELO position 12;

alter table TBNFE_COMPLEMENTAR
alter SERIE position 13;

alter table TBNFE_COMPLEMENTAR
alter NUMERO position 14;

alter table TBNFE_COMPLEMENTAR
alter RECIBO position 15;

alter table TBNFE_COMPLEMENTAR
alter FORNECEDOR position 16;

alter table TBNFE_COMPLEMENTAR
alter CLIENTE position 17;

alter table TBNFE_COMPLEMENTAR
alter NFC_MODALIDADE_FRETE position 18;

alter table TBNFE_COMPLEMENTAR
alter NFC_TRANSPORTADORA position 19;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_VEICULO position 20;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_UF position 21;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_RNTC position 22;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_BASE_ICMS position 23;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_ICMS position 24;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_BASE_ICMS_SUBST position 25;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_ICMS_SUBST position 26;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_PRODUTO position 27;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_FRETE position 28;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_SEGURO position 29;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_DESCONTO position 30;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_II position 31;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_IPI position 32;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_PIS position 33;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_COFINS position 34;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_OUTROS position 35;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_NOTA position 36;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA position 37;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA_USUARIO position 38;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA_DATAHORA position 39;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA_MOTIVO position 40;




/*------ SYSDBA 03/06/2015 09:15:11 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
    ADD PRODUTO DMN_VCHAR_10_KEY;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.PRODUTO IS
'Produto.';

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_ITEM position 2;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_ANO position 3;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_CONTROLE position 4;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_EMPRESA position 5;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_SEQ position 6;

alter table TBNFE_COMPLEMENTAR_ITEM
alter PRODUTO position 7;

alter table TBNFE_COMPLEMENTAR_ITEM
alter QUANTIDADE position 8;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_UNITARIO position 9;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO position 10;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO_VALOR position 11;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_FINAL position 12;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS position 13;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS_ST position 14;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_BRUTO position 15;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_DESCONTO position 16;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_LIQUIDO position 17;




/*------ SYSDBA 03/06/2015 09:15:36 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
ADD CONSTRAINT FK_TBNFE_COMPLEMENTAR_ITEM_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD);




/*------ SYSDBA 03/06/2015 10:34:40 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN ALIQUOTA_ICMS
SET DEFAULT 100.0
;




/*------ SYSDBA 03/06/2015 10:34:46 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN ALIQUOTA_ICMS_ST
SET DEFAULT 100.0
;




/*------ SYSDBA 03/06/2015 10:35:52 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN ALIQUOTA_ICMS
SET DEFAULT 0.0
;




/*------ SYSDBA 03/06/2015 10:36:00 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN ALIQUOTA_ICMS_ST
SET DEFAULT 0.0
;




/*------ SYSDBA 03/06/2015 10:44:15 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
    ADD VALOR_ICMS DMN_MONEY,
    ADD VALOR_ICMS_ST DMN_MONEY;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_ICMS IS
'Valor de ICMS.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_ICMS_ST IS
'Valor de ICMS p/ Substituicao Tributaria.';

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_ITEM position 2;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_ANO position 3;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_CONTROLE position 4;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_EMPRESA position 5;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_SEQ position 6;

alter table TBNFE_COMPLEMENTAR_ITEM
alter PRODUTO position 7;

alter table TBNFE_COMPLEMENTAR_ITEM
alter QUANTIDADE position 8;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_UNITARIO position 9;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO position 10;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO_VALOR position 11;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_FINAL position 12;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS position 13;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS_ST position 14;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_ICMS position 15;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_ICMS_ST position 16;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_BRUTO position 17;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_DESCONTO position 18;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_LIQUIDO position 19;




/*------ SYSDBA 03/06/2015 10:49:11 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
    ADD BC_ICMS DMN_MONEY,
    ADD BC_ICMS_ST DMN_MONEY;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.BC_ICMS IS
'Base de Calculo do ICMS.';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.BC_ICMS_ST IS
'Base de Calculo do ICMS p/ Substituicao Tributaria.';

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_ITEM position 2;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_ANO position 3;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_CONTROLE position 4;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_EMPRESA position 5;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_SEQ position 6;

alter table TBNFE_COMPLEMENTAR_ITEM
alter PRODUTO position 7;

alter table TBNFE_COMPLEMENTAR_ITEM
alter QUANTIDADE position 8;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_UNITARIO position 9;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO position 10;

alter table TBNFE_COMPLEMENTAR_ITEM
alter DESCONTO_VALOR position 11;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_FINAL position 12;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS position 13;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS_ST position 14;

alter table TBNFE_COMPLEMENTAR_ITEM
alter BC_ICMS position 15;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_ICMS position 16;

alter table TBNFE_COMPLEMENTAR_ITEM
alter BC_ICMS_ST position 17;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_ICMS_ST position 18;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_BRUTO position 19;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_DESCONTO position 20;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_LIQUIDO position 21;




/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column NFC_NUMERO position 1;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column NFC_ITEM position 2;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_ANO position 3;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_CONTROLE position 4;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_EMPRESA position 5;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_SEQ position 6;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column PRODUTO position 7;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column QUANTIDADE position 8;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_UNITARIO position 9;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column DESCONTO position 10;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column DESCONTO_VALOR position 11;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_FINAL position 12;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column ALIQUOTA_ICMS position 13;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column BC_ICMS position 14;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_ICMS position 15;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column ALIQUOTA_ICMS_ST position 16;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column BC_ICMS_ST position 17;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_ICMS_ST position 18;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column TOTAL_BRUTO position 19;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column TOTAL_DESCONTO position 20;


/*------ SYSDBA 03/06/2015 10:49:21 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column TOTAL_LIQUIDO position 21;


/*------ SYSDBA 03/06/2015 10:53:33 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM DROP DESCONTO;




/*------ SYSDBA 03/06/2015 10:53:38 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM DROP DESCONTO_VALOR;




/*------ SYSDBA 03/06/2015 10:54:09 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER VALOR_UNITARIO TO VALOR_UNITARIO_DF;




/*------ SYSDBA 03/06/2015 10:54:48 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN BC_ICMS
SET DEFAULT 0.0
;




/*------ SYSDBA 03/06/2015 10:54:53 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN VALOR_ICMS
SET DEFAULT 0.0
;




/*------ SYSDBA 03/06/2015 10:55:00 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN BC_ICMS_ST
SET DEFAULT 0.0
;




/*------ SYSDBA 03/06/2015 10:55:05 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER COLUMN VALOR_ICMS_ST
SET DEFAULT 0.0
;




/*------ SYSDBA 03/06/2015 11:04:07 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_UNITARIO_DF IS
'Valor Unitario (Diferenca de acrescimo).

Obs.: O valor unitario real sera a Valor Unitario da origem mais este valor da
diferenca.';




/*------ SYSDBA 03/06/2015 11:04:29 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER VALOR_UNITARIO_DF TO VALOR_DIFERENCA;




/*------ SYSDBA 03/06/2015 11:05:39 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM
    ADD VALOR_UNITARIO DMN_MONEY;

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR_ITEM
alter NFC_ITEM position 2;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_ANO position 3;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_CONTROLE position 4;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_EMPRESA position 5;

alter table TBNFE_COMPLEMENTAR_ITEM
alter MOV_SEQ position 6;

alter table TBNFE_COMPLEMENTAR_ITEM
alter PRODUTO position 7;

alter table TBNFE_COMPLEMENTAR_ITEM
alter QUANTIDADE position 8;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_UNITARIO position 9;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_DIFERENCA position 10;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_FINAL position 11;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS position 12;

alter table TBNFE_COMPLEMENTAR_ITEM
alter BC_ICMS position 13;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_ICMS position 14;

alter table TBNFE_COMPLEMENTAR_ITEM
alter ALIQUOTA_ICMS_ST position 15;

alter table TBNFE_COMPLEMENTAR_ITEM
alter BC_ICMS_ST position 16;

alter table TBNFE_COMPLEMENTAR_ITEM
alter VALOR_ICMS_ST position 17;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_BRUTO position 18;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_DESCONTO position 19;

alter table TBNFE_COMPLEMENTAR_ITEM
alter TOTAL_LIQUIDO position 20;




/*------ SYSDBA 03/06/2015 11:05:45 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM DROP VALOR_FINAL;




/*------ SYSDBA 03/06/2015 11:05:51 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM DROP TOTAL_BRUTO;




/*------ SYSDBA 03/06/2015 11:05:56 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM DROP TOTAL_DESCONTO;




/*------ SYSDBA 03/06/2015 11:06:44 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.TOTAL_LIQUIDO IS
'Total Liquido = (Quantidade * Valor da Diferenca).';




/*------ SYSDBA 03/06/2015 11:08:23 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_UNITARIO IS
'Valor Unitario.

Obs.: Devera ser:
- Igual ao valor unitario na nota de origem, caso nao exista acrestimo de valor
- Maior ao valor unitario na nota de origem, caso exista acrestimo de valor';




/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column NFC_NUMERO position 1;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column NFC_ITEM position 2;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_ANO position 3;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_CONTROLE position 4;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_EMPRESA position 5;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column MOV_SEQ position 6;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column PRODUTO position 7;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column QUANTIDADE position 8;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_UNITARIO position 9;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_DIFERENCA position 10;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column TOTAL_LIQUIDO position 11;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column ALIQUOTA_ICMS position 12;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column BC_ICMS position 13;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_ICMS position 14;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column ALIQUOTA_ICMS_ST position 15;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column BC_ICMS_ST position 16;


/*------ SYSDBA 03/06/2015 11:08:43 --------*/

alter table TBNFE_COMPLEMENTAR_ITEM
alter column VALOR_ICMS_ST position 17;


/*------ SYSDBA 03/06/2015 11:08:59 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM ALTER TOTAL_LIQUIDO TO VALOR_TOTAL;




/*------ SYSDBA 03/06/2015 11:13:24 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_TOTAL IS
'Valor Total a complementar.

Obs.: Sera igual a:
- Quantidade * Valor Unitario da origem, caso seja apenas acrescimo de quantidade
- Quantidade da origem * Valor de diferenca, caso seja apenas acrescimo de valor unitario
-';




/*------ SYSDBA 03/06/2015 11:13:32 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR_ITEM DROP VALOR_UNITARIO;




/*------ SYSDBA 03/06/2015 11:49:32 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.VALOR_TOTAL IS
'Valor Total a complementar.

Obs.: Sera igual a:
- Quantidade * Valor Unitario da origem, caso seja apenas acrescimo de quantidade
- Quantidade da origem * Valor de diferenca, caso seja apenas acrescimo de valor unitario
- [(Quant. Origem + Quant. dif.) * (Valor Un. Origem + Valor Dif.)] - [Total Liquido Origem]';




/*------ SYSDBA 03/06/2015 11:52:21 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.ALIQUOTA_ICMS IS
'Aliquota de ICMS.

Obs.: O campo sera preenchido com 100 somente para permitir a validacao da NF-e;
ou 0 (zero) caso nao seja complemento de ICMS.';




/*------ SYSDBA 03/06/2015 11:52:30 --------*/

COMMENT ON COLUMN TBNFE_COMPLEMENTAR_ITEM.ALIQUOTA_ICMS_ST IS
'Aliquota de ICMS p/ Substituicao Tributaria.

Obs.: O campo sera preenchido com 100 somente para permitir a validacao da NF-e;
ou 0 (zero) caso nao seja complemento de ICMS.';




/*------ SYSDBA 03/06/2015 18:46:00 --------*/

ALTER TABLE TBNFE_ENVIADA
    ADD CANCELADA DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBNFE_ENVIADA.CANCELADA IS
'Nota cancelada:
0 - Nao
1 - Sim';




/*------ SYSDBA 03/06/2015 18:49:29 --------*/

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




/*------ SYSDBA 03/06/2015 18:50:54 --------*/

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




/*------ SYSDBA 03/06/2015 18:58:41 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_nfe_enviada_empresa for tbnfe_enviada
active before insert or update position 10
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




/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODIGO position 1;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column COD position 2;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column DESCRI position 3;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column APRESENTACAO position 4;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column METAFONEMA position 6;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column MODELO position 7;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PRECO position 8;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 9;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column REFERENCIA position 10;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ESPECIFICACAO position 11;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column SECAO position 12;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column QTDE position 13;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column FRACIONADOR position 14;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PESO_BRUTO position 15;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PESO_LIQUIDO position 16;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUBAGEM position 17;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column VENDA_FRACIONADA position 18;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column UNIDADE position 19;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ESTOQMIN position 20;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODGRUPO position 21;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODFABRICANTE position 22;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUSTOMEDIO position 23;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARCKUP position 24;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARGEM position 25;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PRECO_SUGERIDO position 26;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODEMP position 27;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODSECAO position 28;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODORIGEM position 29;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODTRIBUTACAO position 30;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CST position 31;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CSOSN position 32;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CST_PIS position 33;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CST_COFINS position 34;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column NCM_SH position 35;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODIGO_NVE position 36;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODCFOP position 37;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODBARRA_EAN position 38;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODUNIDADE position 39;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CODUNIDADE_FRACIONADA position 40;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 41;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ALIQUOTA position 42;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 43;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_PIS position 44;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_COFINS position 45;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column VALOR_IPI position 46;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_REDUCAO_BC position 47;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column RESERVA position 48;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PRODUTO_NOVO position 49;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column COR_VEICULO position 50;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column COMBUSTIVEL_VEICULO position 51;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column TIPO_VEICULO position 52;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ANO_MODELO_VEICULO position 53;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ANO_FABRICACAO_VEICULO position 54;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column RENAVAM_VEICULO position 55;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CHASSI_VEICULO position 56;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column KILOMETRAGEM_VEICULO position 57;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column SITUACAO_ATUAL_VEICULO position 58;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column SITUACAO_HISTORICO_VEICULO position 59;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column USUARIO position 60;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CADASTRO_ATIVO position 61;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column MOVIMENTA_ESTOQUE position 62;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column COMPOR_FATURAMENTO position 63;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column PRODUTO_IMOBILIZADO position 64;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column ESTOQUE_APROP_LOTE position 65;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUST_DESP_OFIC position 66;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUST_DESP_GERAIS position 67;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUST_DESP_ADM position 68;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUST_COMISSAO position 69;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column CUST_IMPOSTO position 70;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column FI_RET_FINANC position 71;


/*------ SYSDBA 04/06/2015 13:00:49 --------*/

alter table TBPRODUTO
alter column FI_RET_PLANO position 72;


/*------ SYSDBA 04/06/2015 13:01:25 --------*/

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA IS
'Percencial da Aliquota (ICMS ou ISS).';




/*------ SYSDBA 04/06/2015 13:01:48 --------*/

COMMENT ON COLUMN TBPRODUTO.ALIQUOTA_CSOSN IS
'Percencial da Aliquota no Simples Nacional (ICMS ou ISS).';




/*------ SYSDBA 04/06/2015 13:41:29 --------*/

ALTER TABLE TBESTADO
    ADD ALIQUOTA_ICMS DMN_PERCENTUAL;

COMMENT ON COLUMN TBESTADO.ALIQUOTA_ICMS IS
'Percentual de 0 a 100';




/*------ SYSDBA 04/06/2015 13:41:55 --------*/

COMMENT ON COLUMN TBESTADO.ALIQUOTA_ICMS IS
'Aliquota ICMS.';




/*------ SYSDBA 04/06/2015 13:44:10 --------*/

ALTER TABLE TBESTADO
ADD CONSTRAINT UNQ_TBESTADO_UF
UNIQUE (EST_SIGLA);




/*------ SYSDBA 04/06/2015 13:46:40 --------*/

ALTER TABLE TBCIDADE
    ADD ALIQUOTA_ISS DMN_PERCENTUAL DEFAULT 5.0;

COMMENT ON COLUMN TBCIDADE.ALIQUOTA_ISS IS
'Percentual de 0 a 100';




/*------ SYSDBA 04/06/2015 13:46:47 --------*/

COMMENT ON COLUMN TBCIDADE.ALIQUOTA_ISS IS
'Aliquota ISS.';




/*------ SYSDBA 04/06/2015 13:47:02 --------*/

ALTER TABLE TBESTADO ALTER COLUMN ALIQUOTA_ICMS
SET DEFAULT 17.0
;




/*------ SYSDBA 04/06/2015 13:49:12 --------*/

CREATE DOMAIN DMN_VCHAR_02_NN AS
VARCHAR(2);


/*------ SYSDBA 04/06/2015 13:53:07 --------*/

CREATE TABLE SYS_ALIQUOTA_ICMS (
    UF_ORIGEM DMN_VCHAR_02_NN NOT NULL,
    UF_DESTINO DMN_VCHAR_02_NN NOT NULL,
    ALIQUOTA DMN_PERCENTUAL);

ALTER TABLE SYS_ALIQUOTA_ICMS
ADD CONSTRAINT PK_SYS_ALIQUOTA_ICMS
PRIMARY KEY (UF_ORIGEM,UF_DESTINO);

COMMENT ON COLUMN SYS_ALIQUOTA_ICMS.UF_ORIGEM IS
'Estado de Origem.';

COMMENT ON COLUMN SYS_ALIQUOTA_ICMS.UF_DESTINO IS
'Estado de Destino.';

COMMENT ON COLUMN SYS_ALIQUOTA_ICMS.ALIQUOTA IS
'Aliquota ICMS.';




/*------ SYSDBA 04/06/2015 13:53:08 --------*/

COMMENT ON TABLE SYS_ALIQUOTA_ICMS IS 'Tabela de Aliquotas ICMS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/06/2015

Tabela responsavel por armazenar os percentuais de aliquotas de ICMS para os
operacoes tributarias estaduais e interestaduais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/06/2015 - IMR :
        * Documentacao da tabela.';

GRANT ALL ON SYS_ALIQUOTA_ICMS TO "PUBLIC";



/*------ SYSDBA 04/06/2015 13:56:46 --------*/

SET TERM ^ ;

CREATE trigger tg_tbestado_aliquota for tbestado
active after insert or update position 0
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




/*------ SYSDBA 04/06/2015 13:59:11 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_tbestado_aliquota for tbestado
active after insert or update position 0
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

COMMENT ON TRIGGER TG_TBESTADO_ALIQUOTA IS 'Trigger SET Aliquotas ICMS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/06/2015

Trigger responsavel por armazenar gerar/atualizar a aliquota de ICMS de operacoes
tributarias dentro do estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/06/2015 - IMR :
        * Documentacao da trigger.';




/*------ SYSDBA 04/06/2015 14:11:36 --------*/

SET TERM ^ ;

create or alter procedure GET_ALIQUOTA_ICMS (
    UF_ORIGEM DMN_VCHAR_02,
    UF_DESTINO DMN_VCHAR_02)
returns (
    ALIQUOTA_NORMAL DMN_PERCENTUAL,
    ALIQUOTA_ST DMN_PERCENTUAL)
as
begin
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_origem
  Into
    aliquota_normal;

  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_destino
  Into
    aliquota_st;

  suspend;
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE GET_ALIQUOTA_ICMS TO "PUBLIC";



/*------ SYSDBA 04/06/2015 14:18:55 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ALIQUOTA_ICMS (
    UF_ORIGEM DMN_VCHAR_02,
    UF_DESTINO DMN_VCHAR_02)
returns (
    ALIQUOTA_NORMAL DMN_PERCENTUAL,
    ALIQUOTA_ST DMN_PERCENTUAL)
as
begin
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_origem
  Into
    aliquota_normal;

  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_destino
  Into
    aliquota_st;

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 04/06/2015 14:19:05 --------*/

COMMENT ON PROCEDURE GET_ALIQUOTA_ICMS IS '';




/*------ SYSDBA 04/06/2015 14:19:56 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_ALIQUOTA_ICMS (
    UF_ORIGEM DMN_VCHAR_02,
    UF_DESTINO DMN_VCHAR_02)
returns (
    ALIQUOTA_NORMAL DMN_PERCENTUAL,
    ALIQUOTA_ST DMN_PERCENTUAL)
as
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
end^

SET TERM ; ^



/*------ SYSDBA 06/06/2015 21:08:19 --------*/

execute block
as
  declare variable uf varchar(2);
begin
  Update TBESTADO e Set
    e.aliquota_icms = 17.0
  where e.est_cod = 15;

  for
    Select
      e.est_sigla
    from TBESTADO e
    where e.est_sigla <> 15
    Into
      uf;
  do
  begin
    if (not exists(
      Select
        a.aliquota
      from SYS_ALIQUOTA_ICMS a
      where a.uf_origem = 'PA'
       and a.uf_destino = :uf
    )) then
    begin

      Insert Into SYS_ALIQUOTA_ICMS values ('PA', :uf, 12.0);

    end 
  end 
end

/*------ SYSDBA 06/06/2015 21:08:19 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 15, column 9.
;.

*/

/*------ SYSDBA 06/06/2015 21:08:35 --------*/

execute block
as
  declare variable uf varchar(2);
begin
  Update TBESTADO e Set
    e.aliquota_icms = 17.0
  where e.est_cod = 15;

  for
    Select
      e.est_sigla
    from TBESTADO e
    where e.est_sigla <> 15
    Into
      uf
  do
  begin
    if (not exists(
      Select
        a.aliquota
      from SYS_ALIQUOTA_ICMS a
      where a.uf_origem = 'PA'
       and a.uf_destino = :uf
    )) then
    begin

      Insert Into SYS_ALIQUOTA_ICMS values ('PA', :uf, 12.0);

    end 
  end 
end

/*------ SYSDBA 06/06/2015 21:08:35 --------*/

/*!!! Error occured !!!
Overflow occurred during data type conversion.
conversion error from string "RO".

*/

/*------ SYSDBA 06/06/2015 21:08:45 --------*/

ROLLBACK WORK;

/*------ SYSDBA 06/06/2015 21:09:11 --------*/

execute block
as
  declare variable uf DMN_UF;
begin
  Update TBESTADO e Set
    e.aliquota_icms = 17.0
  where e.est_cod = 15;

  for
    Select
      e.est_sigla
    from TBESTADO e
    where e.est_sigla <> 15
    Into
      uf
  do
  begin
    if (not exists(
      Select
        a.aliquota
      from SYS_ALIQUOTA_ICMS a
      where a.uf_origem = 'PA'
       and a.uf_destino = :uf
    )) then
    begin

      Insert Into SYS_ALIQUOTA_ICMS values ('PA', :uf, 12.0);

    end 
  end 
end

/*------ SYSDBA 06/06/2015 21:09:11 --------*/

/*!!! Error occured !!!
Overflow occurred during data type conversion.
conversion error from string "RO".

*/

/*------ SYSDBA 06/06/2015 21:09:18 --------*/

ROLLBACK WORK;

/*------ SYSDBA 06/06/2015 21:09:26 --------*/

execute block
as
  declare variable uf VARCHAR(4);
begin
  Update TBESTADO e Set
    e.aliquota_icms = 17.0
  where e.est_cod = 15;

  for
    Select
      e.est_sigla
    from TBESTADO e
    where e.est_sigla <> 15
    Into
      uf
  do
  begin
    if (not exists(
      Select
        a.aliquota
      from SYS_ALIQUOTA_ICMS a
      where a.uf_origem = 'PA'
       and a.uf_destino = :uf
    )) then
    begin

      Insert Into SYS_ALIQUOTA_ICMS values ('PA', :uf, 12.0);

    end 
  end 
end

/*------ SYSDBA 06/06/2015 21:09:26 --------*/

/*!!! Error occured !!!
Overflow occurred during data type conversion.
conversion error from string "RO".

*/

/*------ SYSDBA 06/06/2015 21:09:32 --------*/

ROLLBACK WORK;

/*------ SYSDBA 06/06/2015 21:10:17 --------*/

execute block
as
  declare variable uf DMN_UF;
begin
  Update TBESTADO e Set
    e.aliquota_icms = 17.0
  where e.est_cod = 15;

  for
    Select
      e.est_sigla
    from TBESTADO e
    where e.est_cod <> 15
    Into
      uf
  do
  begin
    if (not exists(
      Select
        a.aliquota
      from SYS_ALIQUOTA_ICMS a
      where a.uf_origem = 'PA'
       and a.uf_destino = :uf
    )) then
    begin

      Insert Into SYS_ALIQUOTA_ICMS values ('PA', :uf, 12.0);

    end 
  end 
end;

/*------ SYSDBA 06/06/2015 21:10:26 --------*/

COMMIT WORK;

/*------ SYSDBA 06/06/2015 21:11:08 --------*/

execute block
as
  declare variable uf DMN_UF;
begin
  Update TBESTADO e Set e.aliquota_icms = 17.0;

  for
    Select
      e.est_sigla
    from TBESTADO e
    where e.est_cod <> 15
    Into
      uf
  do
  begin
    if (not exists(
      Select
        a.aliquota
      from SYS_ALIQUOTA_ICMS a
      where a.uf_origem = 'PA'
       and a.uf_destino = :uf
    )) then
    begin

      Insert Into SYS_ALIQUOTA_ICMS values ('PA', :uf, 12.0);

    end 
  end 
end;

/*------ SYSDBA 06/06/2015 21:11:16 --------*/

COMMIT WORK;


/*------ SYSDBA 08/06/2015 21:40:14 --------*/

ALTER TABLE TBNFE_COMPLEMENTAR
    ADD NFC_DENEGADA DMN_LOGICO DEFAULT 0,
    ADD NFC_DENEGADA_MOTIVO DMN_VCHAR_100;

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_DENEGADA IS
'Nota fiscal denegada:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBNFE_COMPLEMENTAR.NFC_DENEGADA_MOTIVO IS
'Motivo da nota fiscal ter sido denegada.';

alter table TBNFE_COMPLEMENTAR
alter NFC_NUMERO position 1;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMPRESA position 2;

alter table TBNFE_COMPLEMENTAR
alter NFC_TIPO position 3;

alter table TBNFE_COMPLEMENTAR
alter NFC_DATA position 4;

alter table TBNFE_COMPLEMENTAR
alter NFC_HORA position 5;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMISSAO position 6;

alter table TBNFE_COMPLEMENTAR
alter NFC_EMISSOR position 7;

alter table TBNFE_COMPLEMENTAR
alter NFC_ENVIADA position 8;

alter table TBNFE_COMPLEMENTAR
alter NFC_TEXTO position 9;

alter table TBNFE_COMPLEMENTAR
alter NFE_SERIE position 10;

alter table TBNFE_COMPLEMENTAR
alter NFE_NUMERO position 11;

alter table TBNFE_COMPLEMENTAR
alter NFE_MODELO position 12;

alter table TBNFE_COMPLEMENTAR
alter SERIE position 13;

alter table TBNFE_COMPLEMENTAR
alter NUMERO position 14;

alter table TBNFE_COMPLEMENTAR
alter RECIBO position 15;

alter table TBNFE_COMPLEMENTAR
alter NFC_DENEGADA position 16;

alter table TBNFE_COMPLEMENTAR
alter NFC_DENEGADA_MOTIVO position 17;

alter table TBNFE_COMPLEMENTAR
alter FORNECEDOR position 18;

alter table TBNFE_COMPLEMENTAR
alter CLIENTE position 19;

alter table TBNFE_COMPLEMENTAR
alter NFC_MODALIDADE_FRETE position 20;

alter table TBNFE_COMPLEMENTAR
alter NFC_TRANSPORTADORA position 21;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_VEICULO position 22;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_UF position 23;

alter table TBNFE_COMPLEMENTAR
alter NFC_PLACA_RNTC position 24;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_BASE_ICMS position 25;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_ICMS position 26;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_BASE_ICMS_SUBST position 27;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_ICMS_SUBST position 28;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_PRODUTO position 29;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_FRETE position 30;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_SEGURO position 31;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_DESCONTO position 32;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_II position 33;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_IPI position 34;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_PIS position 35;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_COFINS position 36;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_OUTROS position 37;

alter table TBNFE_COMPLEMENTAR
alter NFC_VALOR_TOTAL_NOTA position 38;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA position 39;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA_USUARIO position 40;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA_DATAHORA position 41;

alter table TBNFE_COMPLEMENTAR
alter CANCELADA_MOTIVO position 42;




/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_NUMERO position 1;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_EMPRESA position 2;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_TIPO position 3;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_DATA position 4;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_HORA position 5;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_EMISSAO position 6;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_EMISSOR position 7;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_ENVIADA position 8;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_TEXTO position 9;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFE_SERIE position 10;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFE_NUMERO position 11;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFE_MODELO position 12;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column SERIE position 13;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NUMERO position 14;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column RECIBO position 15;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column FORNECEDOR position 16;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column CLIENTE position 17;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_DENEGADA position 18;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_DENEGADA_MOTIVO position 19;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_MODALIDADE_FRETE position 20;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_TRANSPORTADORA position 21;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_PLACA_VEICULO position 22;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_PLACA_UF position 23;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_PLACA_RNTC position 24;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_BASE_ICMS position 25;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_ICMS position 26;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_BASE_ICMS_SUBST position 27;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_ICMS_SUBST position 28;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_PRODUTO position 29;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_FRETE position 30;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_SEGURO position 31;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_DESCONTO position 32;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_II position 33;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_IPI position 34;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_PIS position 35;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_COFINS position 36;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_OUTROS position 37;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column NFC_VALOR_TOTAL_NOTA position 38;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column CANCELADA position 39;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column CANCELADA_USUARIO position 40;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column CANCELADA_DATAHORA position 41;


/*------ SYSDBA 08/06/2015 21:40:32 --------*/

alter table TBNFE_COMPLEMENTAR
alter column CANCELADA_MOTIVO position 42;


/*------ SYSDBA 11/06/2015 09:01:14 --------*/

ALTER TABLE TBCOMPRASITENS
    ADD TOTAL_BRUTO DMN_MONEY,
    ADD TOTAL_LIQUIDO DMN_MONEY;




/*------ SYSDBA 11/06/2015 09:01:35 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.TOTAL_BRUTO IS
'Valor Total Produto.';




/*------ SYSDBA 11/06/2015 09:02:23 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.TOTAL_LIQUIDO IS
'Valor Total Liquido.';




/*------ SYSDBA 11/06/2015 09:03:33 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.TOTAL_LIQUIDO IS
'Valor Total Liquido (Total Bruto Produto - Valor Total Desconto).';



/*------ SYSDBA 11/06/2015 09:50:08 --------*/

execute block
as
  declare variable ano Smallint;
  declare variable cod Integer;
  declare variable emp DMN_CNPJ;
  declare variable seq Smallint;
  declare variable tot DMN_MONEY;
begin
  for
    Select
        ci.ano
      , ci.codcontrol
      , ci.codemp
      , ci.seq
      , ci.qtde * ci.precounit
    from TBCOMPRASITENS ci
    Into
        ano
      , cod
      , emp
      , seq
      , tot
  do
  begin
    Update TBCOMPRASITENS ci Set
       ci.total_bruto   = :tot
     , ci.total_liquido = :tot - ci.valor_desconto
    where ci.ano        = :ano
      and ci.codcontrol = :cod
      and ci.codemp     = :emp
      and ci.seq        = :seq;
  end 
end;

/*------ SYSDBA 11/06/2015 09:50:13 --------*/

ROLLBACK WORK;


/*------ SYSDBA 16/06/2015 11:06:23 --------*/

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
      , p.Historic = p.Historic || ' --> HISTORICO DE PAGAMENTO : ' || new.Historico
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




/*------ SYSDBA 16/06/2015 11:06:39 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contrec_quitar for tbcontrec_baixa
active after insert or update position 1
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



/*------ SYSDBA 17/06/2015 20:42:06 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
F.CODFORN.
At line 2, column 7.

*/

/*------ SYSDBA 17/06/2015 20:44:07 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
F.CNPJ.
At line 3, column 7.

*/


/*------ SYSDBA 17/06/2015 20:55:39 --------*/

CREATE OR ALTER VIEW VW_SEXO(
    CODIGO,
    DESCRICAO)
AS
Select 'M' as Codigo , 'Masculino' as Descricao from RDB$DATABASE Union
Select 'F' as Codigo , 'Feminino'  as Descricao from RDB$DATABASE
;

GRANT ALL ON VW_SEXO TO "PUBLIC";



/*------ SYSDBA 18/06/2015 10:38:14 --------*/

COMMENT ON COLUMN TBVENDAS.VERIFICADOR_NFE IS
'Chave da NF-e';




/*------ SYSDBA 18/06/2015 10:38:22 --------*/

COMMENT ON COLUMN TBVENDAS.XML_NFE IS
'Arquivo XML da NF-e';




/*------ SYSDBA 18/06/2015 10:38:41 --------*/

COMMENT ON COLUMN TBVENDAS.XML_NFE_FILENAME IS
'Nome do arquivo XML da NF-e';




/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column ANO position 1;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CODCONTROL position 2;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CODEMP position 3;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CODCLIENTE position 4;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CODCLI position 5;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DTVENDA position 6;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column COMPETENCIA position 7;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column STATUS position 8;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column TOTALVENDA_BRUTA position 9;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DESCONTO position 10;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DESCONTO_CUPOM position 11;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column TOTALVENDA position 12;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column TOTALCUSTO position 13;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DTFINALIZACAO_VENDA position 14;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column OBS position 15;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column FORMAPAG position 16;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column FATDIAS position 17;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column SERIE position 18;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE position 19;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DATAEMISSAO position 20;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column HORAEMISSAO position 21;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CFOP position 22;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column VERIFICADOR_NFE position 23;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column XML_NFE_FILENAME position 24;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column XML_NFE position 25;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column VENDEDOR_COD position 26;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column USUARIO position 27;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column FORMAPAGTO_COD position 28;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CONDICAOPAGTO_COD position 29;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column VENDA_PRAZO position 30;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_01 position 31;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_02 position 32;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_03 position 33;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_04 position 34;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_05 position 35;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_06 position 36;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_07 position 37;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_08 position 38;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_09 position 39;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_10 position 40;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_11 position 41;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column PRAZO_12 position 42;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column LOTE_NFE_ANO position 43;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column LOTE_NFE_NUMERO position 44;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column LOTE_NFE_RECIBO position 45;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_ENVIADA position 46;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_DENEGADA position 47;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_DENEGADA_MOTIVO position 48;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CANCEL_USUARIO position 49;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CANCEL_DATAHORA position 50;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CANCEL_MOTIVO position 51;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_MODALIDADE_FRETE position 52;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_TRANSPORTADORA position 53;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_PLACA_VEICULO position 54;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_PLACA_UF position 55;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_PLACA_RNTC position 56;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_BASE_ICMS position 57;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_ICMS position 58;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_BASE_ICMS_SUBST position 59;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_ICMS_SUBST position 60;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_PRODUTO position 61;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_FRETE position 62;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_SEGURO position 63;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_DESCONTO position 64;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_II position 65;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_IPI position 66;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_PIS position 67;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_COFINS position 68;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_OUTROS position 69;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_NOTA position 70;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CUSTO_OPER_PERCENTUAL position 71;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CUSTO_OPER_FRETE position 72;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CUSTO_OPER_OUTROS position 73;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column GERAR_ESTOQUE_CLIENTE position 74;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CAIXA_ANO position 75;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CAIXA_NUM position 76;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column CAIXA_PDV position 77;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_COMPRA_ANO position 78;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_COMPRA_COD position 79;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_FORMA position 80;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_UF position 81;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_CNPJ_CPF position 82;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_IE position 83;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_COMPETENCIA position 84;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_SERIE position 85;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_NUMERO position 86;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_MODELO position 87;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DNFE_CHAVE position 88;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DECF_MODELO position 89;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DECF_NUMERO position 90;


/*------ SYSDBA 18/06/2015 10:39:00 --------*/

alter table TBVENDAS
alter column DECF_COO position 91;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column ANO position 1;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CODCONTROL position 2;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CODEMP position 3;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CODCLIENTE position 4;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CODCLI position 5;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DTVENDA position 6;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column COMPETENCIA position 7;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column STATUS position 8;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column TOTALVENDA_BRUTA position 9;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DESCONTO position 10;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DESCONTO_CUPOM position 11;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column TOTALVENDA position 12;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column TOTALCUSTO position 13;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DTFINALIZACAO_VENDA position 14;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column OBS position 15;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column FORMAPAG position 16;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column FATDIAS position 17;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column SERIE position 18;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE position 19;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DATAEMISSAO position 20;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column HORAEMISSAO position 21;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CFOP position 22;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column VERIFICADOR_NFE position 23;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column XML_NFE position 24;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column XML_NFE_FILENAME position 25;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column VENDEDOR_COD position 26;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column USUARIO position 27;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column FORMAPAGTO_COD position 28;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CONDICAOPAGTO_COD position 29;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column VENDA_PRAZO position 30;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_01 position 31;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_02 position 32;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_03 position 33;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_04 position 34;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_05 position 35;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_06 position 36;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_07 position 37;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_08 position 38;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_09 position 39;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_10 position 40;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_11 position 41;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column PRAZO_12 position 42;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column LOTE_NFE_ANO position 43;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column LOTE_NFE_NUMERO position 44;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column LOTE_NFE_RECIBO position 45;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_ENVIADA position 46;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_DENEGADA position 47;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_DENEGADA_MOTIVO position 48;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CANCEL_USUARIO position 49;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CANCEL_DATAHORA position 50;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CANCEL_MOTIVO position 51;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_MODALIDADE_FRETE position 52;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_TRANSPORTADORA position 53;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_PLACA_VEICULO position 54;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_PLACA_UF position 55;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_PLACA_RNTC position 56;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_BASE_ICMS position 57;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_ICMS position 58;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_BASE_ICMS_SUBST position 59;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_ICMS_SUBST position 60;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_PRODUTO position 61;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_FRETE position 62;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_SEGURO position 63;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_DESCONTO position 64;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_II position 65;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_IPI position 66;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_PIS position 67;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_COFINS position 68;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_OUTROS position 69;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column NFE_VALOR_TOTAL_NOTA position 70;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CUSTO_OPER_PERCENTUAL position 71;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CUSTO_OPER_FRETE position 72;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CUSTO_OPER_OUTROS position 73;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column GERAR_ESTOQUE_CLIENTE position 74;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CAIXA_ANO position 75;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CAIXA_NUM position 76;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column CAIXA_PDV position 77;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_COMPRA_ANO position 78;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_COMPRA_COD position 79;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_FORMA position 80;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_UF position 81;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_CNPJ_CPF position 82;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_IE position 83;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_COMPETENCIA position 84;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_SERIE position 85;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_NUMERO position 86;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_MODELO position 87;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DNFE_CHAVE position 88;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DECF_MODELO position 89;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DECF_NUMERO position 90;


/*------ SYSDBA 18/06/2015 10:39:27 --------*/

alter table TBVENDAS
alter column DECF_COO position 91;


/*------ SYSDBA 18/06/2015 10:39:46 --------*/

COMMENT ON COLUMN TBCOMPRAS.VERIFICADOR_NFE IS
'Condigo de verificacao da NF-e gerada (Chave da NF-e).';




/*------ SYSDBA 18/06/2015 10:39:57 --------*/

COMMENT ON COLUMN TBCOMPRAS.XML_NFE IS
'Arquivo XML da NF-e gerada ou recebida.';




/*------ SYSDBA 18/06/2015 10:40:03 --------*/

COMMENT ON COLUMN TBCOMPRAS.XML_NFE_FILENAME IS
'Nome do arquivo XML da NF-e gerada ou recebida.';




/*------ SYSDBA 18/06/2015 10:41:13 --------*/

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




/*------ SYSDBA 18/06/2015 10:43:20 --------*/

COMMENT ON TRIGGER TG_NFE_ATUALIZAR_COMPRA IS 'Trigger Atualizar NFE na Compra (Entradas)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Trigger resposanvel por atualizar os dados referentes as notas ficais eletronicas
geradas pelo sistema e enviadas a SEFA.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    18/06/2019 - IMR:
        * Alteracao da atribuicao de valores do campo .';




/*------ SYSDBA 18/06/2015 10:44:44 --------*/

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

COMMENT ON TRIGGER TG_NFE_ATUALIZAR_COMPRA IS 'Trigger Atualizar NFE na Compra (Entradas)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Trigger resposanvel por atualizar os dados referentes as notas ficais eletronicas
geradas pelo sistema e enviadas a SEFA.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    18/06/2019 - IMR:
        * Alteracao da atribuicao de valores do campo TIPO_DOCUMENTO de 1 (um)
          para 5 (cinco). Onde 1 corresponte ao tipo "Nota Fiscal" e 5 coresponde
          ao tipo "NF-e".';




/*------ SYSDBA 23/06/2015 17:14:35 --------*/

ALTER TABLE TBFUNCIONARIO DROP CONSTRAINT FK_TBFUNCIONARIO_USUARIO;

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME)
ON DELETE SET NULL
ON UPDATE CASCADE
USING INDEX FK_TBFUNCIONARIO_USUARIO;




/*------ SYSDBA 23/06/2015 17:17:54 --------*/

ALTER TABLE TBFUNCIONARIO DROP CONSTRAINT FK_TBFUNCIONARIO_USUARIO;

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_USUARIO
FOREIGN KEY (USUARIO)
REFERENCES TBUSERS(NOME)
ON DELETE SET NULL
USING INDEX FK_TBFUNCIONARIO_USUARIO;




/*------ SYSDBA 24/06/2015 14:00:50 --------*/

ALTER TABLE TBCOMPRASITENS
    ADD CSOSN DMN_VCHAR_03;

alter table TBCOMPRASITENS
alter ANO position 1;

alter table TBCOMPRASITENS
alter CODCONTROL position 2;

alter table TBCOMPRASITENS
alter CODEMP position 3;

alter table TBCOMPRASITENS
alter SEQ position 4;

alter table TBCOMPRASITENS
alter CODFORN position 5;

alter table TBCOMPRASITENS
alter CODPROD position 6;

alter table TBCOMPRASITENS
alter QTDE position 7;

alter table TBCOMPRASITENS
alter PRECOUNIT position 8;

alter table TBCOMPRASITENS
alter CUSTOMEDIO position 9;

alter table TBCOMPRASITENS
alter DTENT position 10;

alter table TBCOMPRASITENS
alter NF position 11;

alter table TBCOMPRASITENS
alter QTDEANTES position 12;

alter table TBCOMPRASITENS
alter QTDEFINAL position 13;

alter table TBCOMPRASITENS
alter PERC_PARTICIPACAO position 14;

alter table TBCOMPRASITENS
alter VALOR_FRETE position 15;

alter table TBCOMPRASITENS
alter VALOR_DESCONTO position 16;

alter table TBCOMPRASITENS
alter VALOR_OUTROS position 17;

alter table TBCOMPRASITENS
alter VALOR_IPI position 18;

alter table TBCOMPRASITENS
alter UNID_COD position 19;

alter table TBCOMPRASITENS
alter NCM_SH position 20;

alter table TBCOMPRASITENS
alter CST position 21;

alter table TBCOMPRASITENS
alter CSOSN position 22;

alter table TBCOMPRASITENS
alter CFOP position 23;

alter table TBCOMPRASITENS
alter ALIQUOTA position 24;

alter table TBCOMPRASITENS
alter ALIQUOTA_CSOSN position 25;

alter table TBCOMPRASITENS
alter ALIQUOTA_PIS position 26;

alter table TBCOMPRASITENS
alter ALIQUOTA_COFINS position 27;

alter table TBCOMPRASITENS
alter PERCENTUAL_REDUCAO_BC position 28;

alter table TBCOMPRASITENS
alter TOTAL_BRUTO position 29;

alter table TBCOMPRASITENS
alter TOTAL_LIQUIDO position 30;




/*------ SYSDBA 24/06/2015 15:24:26 --------*/

ALTER TABLE TBVENDAS
    ADD DADOS_ENTREGA DMN_TEXTO;

COMMENT ON COLUMN TBVENDAS.DADOS_ENTREGA IS
'Dados de entrega da mercadoria.';

alter table TBVENDAS
alter ANO position 1;

alter table TBVENDAS
alter CODCONTROL position 2;

alter table TBVENDAS
alter CODEMP position 3;

alter table TBVENDAS
alter CODCLIENTE position 4;

alter table TBVENDAS
alter CODCLI position 5;

alter table TBVENDAS
alter DTVENDA position 6;

alter table TBVENDAS
alter COMPETENCIA position 7;

alter table TBVENDAS
alter STATUS position 8;

alter table TBVENDAS
alter TOTALVENDA_BRUTA position 9;

alter table TBVENDAS
alter DESCONTO position 10;

alter table TBVENDAS
alter DESCONTO_CUPOM position 11;

alter table TBVENDAS
alter TOTALVENDA position 12;

alter table TBVENDAS
alter TOTALCUSTO position 13;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 14;

alter table TBVENDAS
alter OBS position 15;

alter table TBVENDAS
alter DADOS_ENTREGA position 16;

alter table TBVENDAS
alter FORMAPAG position 17;

alter table TBVENDAS
alter FATDIAS position 18;

alter table TBVENDAS
alter SERIE position 19;

alter table TBVENDAS
alter NFE position 20;

alter table TBVENDAS
alter DATAEMISSAO position 21;

alter table TBVENDAS
alter HORAEMISSAO position 22;

alter table TBVENDAS
alter CFOP position 23;

alter table TBVENDAS
alter VERIFICADOR_NFE position 24;

alter table TBVENDAS
alter XML_NFE position 25;

alter table TBVENDAS
alter XML_NFE_FILENAME position 26;

alter table TBVENDAS
alter VENDEDOR_COD position 27;

alter table TBVENDAS
alter USUARIO position 28;

alter table TBVENDAS
alter FORMAPAGTO_COD position 29;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 30;

alter table TBVENDAS
alter VENDA_PRAZO position 31;

alter table TBVENDAS
alter PRAZO_01 position 32;

alter table TBVENDAS
alter PRAZO_02 position 33;

alter table TBVENDAS
alter PRAZO_03 position 34;

alter table TBVENDAS
alter PRAZO_04 position 35;

alter table TBVENDAS
alter PRAZO_05 position 36;

alter table TBVENDAS
alter PRAZO_06 position 37;

alter table TBVENDAS
alter PRAZO_07 position 38;

alter table TBVENDAS
alter PRAZO_08 position 39;

alter table TBVENDAS
alter PRAZO_09 position 40;

alter table TBVENDAS
alter PRAZO_10 position 41;

alter table TBVENDAS
alter PRAZO_11 position 42;

alter table TBVENDAS
alter PRAZO_12 position 43;

alter table TBVENDAS
alter LOTE_NFE_ANO position 44;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 45;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 46;

alter table TBVENDAS
alter NFE_ENVIADA position 47;

alter table TBVENDAS
alter NFE_DENEGADA position 48;

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 49;

alter table TBVENDAS
alter CANCEL_USUARIO position 50;

alter table TBVENDAS
alter CANCEL_DATAHORA position 51;

alter table TBVENDAS
alter CANCEL_MOTIVO position 52;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 53;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 54;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 55;

alter table TBVENDAS
alter NFE_PLACA_UF position 56;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 57;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 58;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 59;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 60;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 61;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 62;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 63;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 64;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 65;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 66;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 67;

alter table TBVENDAS
alter NFE_VALOR_PIS position 68;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 69;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 70;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 71;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 72;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 73;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 74;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 75;

alter table TBVENDAS
alter CAIXA_ANO position 76;

alter table TBVENDAS
alter CAIXA_NUM position 77;

alter table TBVENDAS
alter CAIXA_PDV position 78;

alter table TBVENDAS
alter DNFE_COMPRA_ANO position 79;

alter table TBVENDAS
alter DNFE_COMPRA_COD position 80;

alter table TBVENDAS
alter DNFE_FORMA position 81;

alter table TBVENDAS
alter DNFE_UF position 82;

alter table TBVENDAS
alter DNFE_CNPJ_CPF position 83;

alter table TBVENDAS
alter DNFE_IE position 84;

alter table TBVENDAS
alter DNFE_COMPETENCIA position 85;

alter table TBVENDAS
alter DNFE_SERIE position 86;

alter table TBVENDAS
alter DNFE_NUMERO position 87;

alter table TBVENDAS
alter DNFE_MODELO position 88;

alter table TBVENDAS
alter DNFE_CHAVE position 89;

alter table TBVENDAS
alter DECF_MODELO position 90;

alter table TBVENDAS
alter DECF_NUMERO position 91;

alter table TBVENDAS
alter DECF_COO position 92;




/*------ SYSDBA 25/06/2015 11:10:18 --------*/

CREATE DOMAIN DMN_VCHAR_14 AS
VARCHAR(14);


/*------ SYSDBA 25/06/2015 11:10:34 --------*/

ALTER TABLE TBCONTPAG
    ADD LOTE DMN_VCHAR_14;




/*------ SYSDBA 25/06/2015 11:10:59 --------*/

CREATE INDEX IDX_TBCONTPAG_LOTE
ON TBCONTPAG (LOTE);




/*------ SYSDBA 25/06/2015 11:11:33 --------*/

COMMENT ON COLUMN TBCONTPAG.LOTE IS
'Lote de parcelas geradas manualmente.';




/*------ SYSDBA 25/06/2015 11:12:12 --------*/

ALTER TABLE TBCONTREC
    ADD LOTE DMN_VCHAR_14;

COMMENT ON COLUMN TBCONTREC.LOTE IS
'Lote de parcelas geradas manualmente.';




/*------ SYSDBA 25/06/2015 11:12:37 --------*/

CREATE INDEX IDX_TBCONTREC_LOTE
ON TBCONTREC (LOTE);




/*------ SYSDBA 26/06/2015 00:00:16 --------*/

ALTER TABLE TBFUNCIONARIO DROP CONSTRAINT FK_TBFUNCIONARIO_USUARIO;




/*------ SYSDBA 26/06/2015 00:00:25 --------*/

ALTER TABLE TBFUNCIONARIO ALTER USUARIO TO LOGIN;




/*------ SYSDBA 26/06/2015 00:00:55 --------*/

ALTER TABLE TBFUNCIONARIO
ADD CONSTRAINT FK_TBFUNCIONARIO_LOGIN
FOREIGN KEY (LOGIN)
REFERENCES TBUSERS(NOME)
ON DELETE SET NULL;




/*------ SYSDBA 26/06/2015 00:07:13 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_USUARIO_FUNCIONARIO (
    NOME_COMPLETO DMN_NOME,
    ATIVO DMN_LOGICO)
returns (
    USUARIO_LOGIN DMN_USUARIO)
as
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
end^

SET TERM ; ^




/*------ SYSDBA 26/06/2015 00:23:02 --------*/

ALTER TABLE TBFUNCIONARIO
    ADD NOME_LIMPO DMN_NOME;

COMMENT ON COLUMN TBFUNCIONARIO.NOME_LIMPO IS
'Nome completo sem caracteres especiais';

alter table TBFUNCIONARIO
alter CODIGO position 1;

alter table TBFUNCIONARIO
alter NOME_COMPLETO position 2;

alter table TBFUNCIONARIO
alter NOME_LIMPO position 3;

alter table TBFUNCIONARIO
alter METAFONEMA position 4;

alter table TBFUNCIONARIO
alter SEXO position 5;

alter table TBFUNCIONARIO
alter FOTO_3X4 position 6;

alter table TBFUNCIONARIO
alter CPF position 7;

alter table TBFUNCIONARIO
alter RG_NUMERO position 8;

alter table TBFUNCIONARIO
alter RG_ORGAO_EMISSOR position 9;

alter table TBFUNCIONARIO
alter DATA_NASCIMENTO position 10;

alter table TBFUNCIONARIO
alter FLAG_VENDEDOR position 11;

alter table TBFUNCIONARIO
alter FLAG_FORNECEDOR position 12;

alter table TBFUNCIONARIO
alter ATIVO position 13;

alter table TBFUNCIONARIO
alter LOGIN position 14;

alter table TBFUNCIONARIO
alter VENDEDOR position 15;

alter table TBFUNCIONARIO
alter FORNECEDOR position 16;

alter table TBFUNCIONARIO
alter ENDER position 17;

alter table TBFUNCIONARIO
alter NUMERO_END position 18;

alter table TBFUNCIONARIO
alter COMPLEMENTO position 19;

alter table TBFUNCIONARIO
alter BAIRRO position 20;

alter table TBFUNCIONARIO
alter CEP position 21;

alter table TBFUNCIONARIO
alter CIDADE position 22;

alter table TBFUNCIONARIO
alter UF position 23;

alter table TBFUNCIONARIO
alter TLG_TIPO position 24;

alter table TBFUNCIONARIO
alter LOG_COD position 25;

alter table TBFUNCIONARIO
alter BAI_COD position 26;

alter table TBFUNCIONARIO
alter CID_COD position 27;

alter table TBFUNCIONARIO
alter EST_COD position 28;

alter table TBFUNCIONARIO
alter PAIS_ID position 29;

alter table TBFUNCIONARIO
alter FONE_FIXO position 30;

alter table TBFUNCIONARIO
alter FONE_CELULAR position 31;

alter table TBFUNCIONARIO
alter FONE_COMERCIAL position 32;

alter table TBFUNCIONARIO
alter EMAIL position 33;

alter table TBFUNCIONARIO
alter OBSERVACAO position 34;

alter table TBFUNCIONARIO
alter DATA_CADASTRO position 35;




/*------ SYSDBA 29/06/2015 18:37:55 --------*/

SET TERM ^ ;

create or alter procedure SET_AJUSTE_ESTOQUE_VENDA (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10,
    QTDE_ATUAL DMN_QUANTIDADE_D3,
    QTDE_NOVA DMN_QUANTIDADE_D3,
    MOTIVO DMN_VCHAR_250,
    DATA_HOTA DMN_DATETIME,
    USUARIO DMN_USUARIO,
    DOCUMENTO DMN_VCHAR_10)
as
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
    , :data_hota
    , :usuario
  );
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_AJUSTE_ESTOQUE_VENDA IS 'Procedure Gravar Ajuste Estoque Venda.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   29/06/2015

Stored procedure responsavel por gravar um registro de ajuste de estoque da venda
de produtos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    29/06/2015 - IMR :
        * Documentacao da procedure.';

GRANT EXECUTE ON PROCEDURE SET_AJUSTE_ESTOQUE_VENDA TO "PUBLIC";



/*------ SYSDBA 29/06/2015 18:52:54 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_AJUSTE_ESTOQUE_VENDA (
    EMPRESA DMN_CNPJ,
    PRODUTO DMN_VCHAR_10,
    QTDE_ATUAL DMN_QUANTIDADE_D3,
    QTDE_NOVA DMN_QUANTIDADE_D3,
    MOTIVO DMN_VCHAR_250,
    DATA_HORA DMN_DATETIME,
    USUARIO DMN_USUARIO,
    DOCUMENTO DMN_VCHAR_10)
as
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
end^

SET TERM ; ^




/*------ SYSDBA 29/06/2015 22:32:08 --------*/

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




/*------ SYSDBA 30/06/2015 14:50:32 --------*/

ALTER TABLE TBTPDESPESA
    ADD TIPO_ATIVO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBTPDESPESA.TIPO_ATIVO IS
'Tipo ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 30/06/2015 18:41:13 --------*/

ALTER TABLE TBTPDESPESA ALTER TIPO_ATIVO TO ATIVO;




/*------ SYSDBA 30/06/2015 18:41:33 --------*/

CREATE INDEX IDX_TBTPDESPESA_TIPO
ON TBTPDESPESA (ATIVO);




/*------ SYSDBA 30/06/2015 20:34:56 --------*/

CREATE TABLE TBFUNCAO_CBO (
    CODIGO DMN_INTEGER_NN NOT NULL,
    DESCRICAO_RESUMO DMN_NOME,
    DESCRICAO_COMPLETA DMN_VCHAR_250,
    CODIGO_CBO DMN_VCHAR_10,
    ATIVO DMN_LOGICO);

ALTER TABLE TBFUNCAO_CBO
ADD CONSTRAINT PK_TBFUNCAO_CBO
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN TBFUNCAO_CBO.CODIGO IS
'Codigo';

COMMENT ON COLUMN TBFUNCAO_CBO.DESCRICAO_RESUMO IS
'Descricao resumo';

COMMENT ON COLUMN TBFUNCAO_CBO.DESCRICAO_COMPLETA IS
'Descricao completa (Modelo CBO)';

COMMENT ON COLUMN TBFUNCAO_CBO.CODIGO_CBO IS
'Codigo CBO (Codigo Brasileiro de Ocupacao)';

COMMENT ON COLUMN TBFUNCAO_CBO.ATIVO IS
'Ativo:
0 - Nao
1 - Sim';




/*------ SYSDBA 30/06/2015 20:34:58 --------*/

COMMENT ON TABLE TBFUNCAO_CBO IS 'Tabela de Funcoes CBO.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/06/2015

Tabela responsavel por armazenar todas as descricoes de funcoes ocupacionais de
acordo com o Codigo Brasileiro Ocupecional (CBO).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/06/2015 - IMR :
        * Documentacao da tabela.';

GRANT ALL ON TBFUNCAO_CBO TO "PUBLIC";



/*------ SYSDBA 30/06/2015 20:35:39 --------*/

CREATE INDEX IDX_TBFUNCAO_CBO_ATIVO
ON TBFUNCAO_CBO (ATIVO);

CREATE INDEX IDX_TBFUNCAO_CBO
ON TBFUNCAO_CBO (CODIGO_CBO);




/*------ SYSDBA 30/06/2015 21:01:48 --------*/

CREATE TABLE TBFUNCIONARIO_MOVIMENTO (
    CONTROLE DMN_BIGINT_NN NOT NULL,
    FUNCIONARIO DMN_INTEGER_NN,
    FUNCAO_CBO DMN_INTEGER_NN,
    EMPRESA DMN_CNPJ,
    DATA_ADMISSAO DMN_DATE);

ALTER TABLE TBFUNCIONARIO_MOVIMENTO
ADD CONSTRAINT PK_TBFUNCIONARIO_MOVIMENTO
PRIMARY KEY (CONTROLE);

COMMENT ON COLUMN TBFUNCIONARIO_MOVIMENTO.CONTROLE IS
'Controle';

COMMENT ON COLUMN TBFUNCIONARIO_MOVIMENTO.FUNCIONARIO IS
'Funcionario';

COMMENT ON COLUMN TBFUNCIONARIO_MOVIMENTO.FUNCAO_CBO IS
'Funcao CBO';

COMMENT ON COLUMN TBFUNCIONARIO_MOVIMENTO.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBFUNCIONARIO_MOVIMENTO.DATA_ADMISSAO IS
'Data admissao';




/*------ SYSDBA 30/06/2015 21:01:54 --------*/

alter table TBFUNCIONARIO_MOVIMENTO
alter column CONTROLE position 1;


/*------ SYSDBA 30/06/2015 21:01:54 --------*/

alter table TBFUNCIONARIO_MOVIMENTO
alter column EMPRESA position 2;


/*------ SYSDBA 30/06/2015 21:01:54 --------*/

alter table TBFUNCIONARIO_MOVIMENTO
alter column FUNCIONARIO position 3;


/*------ SYSDBA 30/06/2015 21:01:54 --------*/

alter table TBFUNCIONARIO_MOVIMENTO
alter column FUNCAO_CBO position 4;


/*------ SYSDBA 30/06/2015 21:01:54 --------*/

alter table TBFUNCIONARIO_MOVIMENTO
alter column DATA_ADMISSAO position 5;


/*------ SYSDBA 30/06/2015 21:03:03 --------*/

ALTER TABLE TBFUNCIONARIO_MOVIMENTO
ADD CONSTRAINT FK_TBFUNCIONARIO_MOVIMENTO_FCN
FOREIGN KEY (FUNCIONARIO)
REFERENCES TBFUNCIONARIO(CODIGO);

ALTER TABLE TBFUNCIONARIO_MOVIMENTO
ADD CONSTRAINT FK_TBFUNCIONARIO_MOVIMENTO_CBO
FOREIGN KEY (FUNCAO_CBO)
REFERENCES TBFUNCAO_CBO(CODIGO);




/*------ SYSDBA 30/06/2015 21:03:35 --------*/

CREATE INDEX IDX_TBFUNCIONARIO_MOVIMENTO_ADM
ON TBFUNCIONARIO_MOVIMENTO (DATA_ADMISSAO);




/*------ SYSDBA 30/06/2015 21:05:29 --------*/

COMMENT ON TABLE TBFUNCIONARIO_MOVIMENTO IS 'Tabela de Movimentacao de Funcionario (Vinculo Empregaticio)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/06/2015

Tabela responsavel por armazenar os vinculos empregaticios dos funcionarios
cadastrados nos sistemas SGI e SGF.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/06/2015 - IMR :
        * Documentacao da procedure.';

GRANT ALL ON TBFUNCIONARIO_MOVIMENTO TO "PUBLIC";



/*------ SYSDBA 01/07/2015 09:55:03 --------*/

ALTER TABLE TBFUNCIONARIO_MOVIMENTO
    ADD MATRICULA DMN_VCHAR_10;

COMMENT ON COLUMN TBFUNCIONARIO_MOVIMENTO.MATRICULA IS
'Matricula';

alter table TBFUNCIONARIO_MOVIMENTO
alter CONTROLE position 1;

alter table TBFUNCIONARIO_MOVIMENTO
alter EMPRESA position 2;

alter table TBFUNCIONARIO_MOVIMENTO
alter FUNCIONARIO position 3;

alter table TBFUNCIONARIO_MOVIMENTO
alter FUNCAO_CBO position 4;

alter table TBFUNCIONARIO_MOVIMENTO
alter MATRICULA position 5;

alter table TBFUNCIONARIO_MOVIMENTO
alter DATA_ADMISSAO position 6;




/*------ SYSDBA 01/07/2015 09:55:24 --------*/

CREATE INDEX IDX_TBFUNCIONARIO_MOVIMENTO_MAT
ON TBFUNCIONARIO_MOVIMENTO (MATRICULA);




/*------ SYSDBA 01/07/2015 12:55:17 --------*/

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
    COND_PDV)
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
from TBCONDICAOPAGTO c
;




/*------ SYSDBA 01/07/2015 12:55:30 --------*/

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
    COND_PDV)
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
from TBCONDICAOPAGTO c
;




/*------ SYSDBA 06/07/2015 14:17:04 --------*/

CREATE INDEX IDX_SYS_IBPT_TABELA
ON SYS_IBPT (TABELA_IBPT);




/*------ SYSDBA 06/07/2015 16:19:45 --------*/

ALTER TABLE TBPRODUTO
    ADD TABELA_IBPT DMN_INTEGER_N;

COMMENT ON COLUMN TBPRODUTO.TABELA_IBPT IS
'Codigo interno na tabela IBPT de Tributacoes.';

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
alter UNIDADE position 19;

alter table TBPRODUTO
alter ESTOQMIN position 20;

alter table TBPRODUTO
alter CODGRUPO position 21;

alter table TBPRODUTO
alter CODFABRICANTE position 22;

alter table TBPRODUTO
alter CUSTOMEDIO position 23;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 24;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 25;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 26;

alter table TBPRODUTO
alter CODEMP position 27;

alter table TBPRODUTO
alter CODSECAO position 28;

alter table TBPRODUTO
alter CODORIGEM position 29;

alter table TBPRODUTO
alter CODTRIBUTACAO position 30;

alter table TBPRODUTO
alter CST position 31;

alter table TBPRODUTO
alter CSOSN position 32;

alter table TBPRODUTO
alter CST_PIS position 33;

alter table TBPRODUTO
alter CST_COFINS position 34;

alter table TBPRODUTO
alter TABELA_IBPT position 35;

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
alter CODUNIDADE_FRACIONADA position 41;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 42;

alter table TBPRODUTO
alter ALIQUOTA position 43;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 44;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 45;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 46;

alter table TBPRODUTO
alter VALOR_IPI position 47;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 48;

alter table TBPRODUTO
alter RESERVA position 49;

alter table TBPRODUTO
alter PRODUTO_NOVO position 50;

alter table TBPRODUTO
alter COR_VEICULO position 51;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 52;

alter table TBPRODUTO
alter TIPO_VEICULO position 53;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 54;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 55;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 56;

alter table TBPRODUTO
alter CHASSI_VEICULO position 57;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 58;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 59;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 60;

alter table TBPRODUTO
alter USUARIO position 61;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 62;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 63;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 64;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 65;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 66;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 67;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 68;

alter table TBPRODUTO
alter CUST_DESP_ADM position 69;

alter table TBPRODUTO
alter CUST_COMISSAO position 70;

alter table TBPRODUTO
alter CUST_IMPOSTO position 71;

alter table TBPRODUTO
alter FI_RET_FINANC position 72;

alter table TBPRODUTO
alter FI_RET_PLANO position 73;




/*------ SYSDBA 06/07/2015 16:20:25 --------*/

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_IBPT
FOREIGN KEY (TABELA_IBPT)
REFERENCES SYS_IBPT(ID_IBPT)
ON DELETE SET NULL;




/*------ SYSDBA 06/07/2015 16:20:31 --------*/

ALTER TABLE TBPRODUTO DROP CONSTRAINT FK_TBPRODUTO_IBPT;

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_IBPT
FOREIGN KEY (TABELA_IBPT)
REFERENCES SYS_IBPT(ID_IBPT)
USING INDEX FK_TBPRODUTO_IBPT;



/*------ SYSDBA 07/07/2015 14:54:06 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
IB.NCM_ALIQUOTA_NAC.
At line 13, column 17.

*/

/*------ SYSDBA 07/07/2015 14:56:16 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
IB.NCM_ALIQUOTA_NAC.
At line 13, column 8.

*/

/*------ SYSDBA 07/07/2015 14:59:32 --------*/

/*!!! Error occured !!!
Column does not belong to referenced table.
Dynamic SQL Error.
SQL error code = -206.
Column unknown.
IB.NCM_ALIQUOTA_NAC.
At line 13, column 8.

*/


/*------ SYSDBA 14/07/2015 10:28:11 --------*/

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
end^

SET TERM ; ^

