

/*------ 17/03/2017 15:48:55 --------*/

SET TERM ^ ;

create or alter procedure GET_ALIQUOTA_ISS (
    EMPRESA DMN_CNPJ,
    UF DMN_INTEGER_N,
    CIDADE DMN_INTEGER_N)
returns (
    ALIQUOTA_ISS DMN_PERCENTUAL,
    ALIQUOTA_PIS DMN_PERCENTUAL,
    ALIQUOTA_COFINS DMN_PERCENTUAL)
as
begin
  Select
      coalesce(nullif(co.nfse_percentual_issqn, 0.0), c.aliquota_iss)
    , co.nfse_percentual_pis
    , co.nfse_percentual_cofins
  from TBCONFIGURACAO co
    inner join TBEMPRESA e on (e.cnpj = co.empresa)
    left join TBCIDADE c on (c.cid_cod = e.cid_cod)
  where co.empresa = :empresa
  Into
      aliquota_iss
    , aliquota_pis
    , aliquota_cofins;

  suspend;
end^

/*------ 17/03/2017 15:48:55 --------*/

SET TERM ; ^

COMMENT ON PROCEDURE GET_ALIQUOTA_ISS IS
'Procedure GET Aliquota ISS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/03/2017

Stored procedure responsavel por retornar os percentuais de ISS, PIS e COFINS de
acordo com a empresa informada, recuperando esses dados da tabela de configuracoes
da empresa e/ou do cadastro do municipio.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/03/2017 - IMR :
        * Documentacao do objeto.';

/*------ 17/03/2017 15:48:55 --------*/

GRANT SELECT ON TBCONFIGURACAO TO PROCEDURE GET_ALIQUOTA_ISS;

/*------ 17/03/2017 15:48:55 --------*/

GRANT SELECT ON TBEMPRESA TO PROCEDURE GET_ALIQUOTA_ISS;

/*------ 17/03/2017 15:48:55 --------*/

GRANT SELECT ON TBCIDADE TO PROCEDURE GET_ALIQUOTA_ISS;

/*------ 17/03/2017 15:48:55 --------*/

GRANT EXECUTE ON PROCEDURE GET_ALIQUOTA_ISS TO "PUBLIC";

/*------ 17/03/2017 15:48:55 --------*/

GRANT EXECUTE ON PROCEDURE GET_ALIQUOTA_ISS TO SYSDBA;

/*------ 17/03/2017 15:49:02 --------*/

SET TERM ^ ;

create or alter procedure GET_ALIQUOTA_ICMS (
    UF_ORIGEM DMN_VCHAR_02,
    UF_DESTINO DMN_VCHAR_02)
returns (
    ALIQUOTA_INTER DMN_PERCENTUAL,
    ALIQUOTA_INTRA DMN_PERCENTUAL,
    ALIQUOTA_ST DMN_PERCENTUAL)
as
begin
  -- Buscando o ICMS Inter (Estado de Origem - ICMS do proprio Estado)
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_origem
  Into
    aliquota_inter;

  -- Buscando o ICMS Intra (Estado de Destino)
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_destino
    and a.uf_destino = :uf_destino
  Into
    aliquota_intra;

  -- Buscando o ICMS de Destino
  Select first 1
    a.aliquota
  from SYS_ALIQUOTA_ICMS a
  where a.uf_origem  = :uf_origem
    and a.uf_destino = :uf_destino
  Into
    aliquota_st;

  suspend;
end^

/*------ 17/03/2017 15:49:03 --------*/

SET TERM ; ^

COMMENT ON PROCEDURE GET_ALIQUOTA_ICMS IS
'Procedure GET Aliquota ICMS.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   17/03/2017

Stored procedure responsavel por retornar os percentuais de ICMS dentro e fora do
esdado de acordo com a UF de origem e a UF de destino informadas, recuperando esses
dados da tabela de aliquotas do sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/03/2017 - IMR :
        * Documentacao do objeto.';

/*------ 17/03/2017 15:49:03 --------*/

GRANT SELECT ON SYS_ALIQUOTA_ICMS TO PROCEDURE GET_ALIQUOTA_ICMS;

/*------ 17/03/2017 15:49:03 --------*/

GRANT EXECUTE ON PROCEDURE GET_ALIQUOTA_ICMS TO "PUBLIC";

/*------ 17/03/2017 15:49:03 --------*/

GRANT EXECUTE ON PROCEDURE GET_ALIQUOTA_ICMS TO SYSDBA;


/*------ SYSDBA 17/03/2017 18:15:26 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_DEMONST_RESULT_OPERACIONAL (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE)
returns (
    GRUPO DMN_SMALLINT_N,
    MARCADOR DMN_VCHAR_03,
    DESTACAR DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_100,
    ESPECIFIC DMN_VCHAR_250,
    TIPO DMN_VCHAR_01,
    ID_TIPO DMN_SMALLINT_N,
    VALOR DMN_MONEY,
    PERCENTUAL DMN_PERCENTUAL_4)
as
declare variable VL_TOTAL_RECEITA DMN_MONEY;
declare variable VL_TOTAL_DESPESA DMN_MONEY;
declare variable VL_TOTAL_GRUPO DMN_MONEY;
declare variable VL_CUSTO_FIXO DMN_MONEY;
declare variable VL_MARGEM_CONTRIB DMN_MONEY;
declare variable VL_LUCRO_OPER DMN_MONEY;
declare variable CD_CLASSIFICACAO_DESPESA DMN_SMALLINT_N;
declare variable CD_TIPO_DESPESA DMN_SMALLINT_N;
declare variable DT_INCIAL DMN_DATETIME;
declare variable DT_FINAL DMN_DATETIME;
begin
  dt_incial = :data_inicial + cast('00:00:00' as time);
  dt_final  = :data_final   + cast('23:59:59' as time);

  vl_custo_fixo    = 0.0;
  vl_total_despesa = 0.0;

  /* 1. Totalizar Receita */
  for
    Select
        sum(c.valor) as valor
    from TBCAIXA_MOVIMENTO c
      left join TBTPRECEITA r on (r.cod = c.tipo_receita)
      left join TBTPDESPESA d on (d.cod = c.tipo_despesa)
    where c.empresa  = :empresa
      and c.estorno  = 0
      and c.situacao = 1
      and c.tipo     = 'C'
      and ((:conta = 0) or (c.conta_corrente = :conta))
      and c.datahora between :dt_incial and :dt_final
    Into
      valor
  do
  begin
    --valor = 900000.00;
    marcador   = '';
    descricao  = 'RECEITA TOTAL';
    tipo       = 'C';
    destacar   = 1;
    vl_total_receita = coalesce(:valor, 0.00);
    if (:vl_total_receita > 0.0) then
      percentual = 100.0;
    else
      percentual = 0.0;
    suspend;
  end 

  /* 2. Totalizar grupos de despesas */
  for
    Select
        g.tpe_codigo
      , g.tpe_descricao
      , dp.valor
    from VW_CLASSIFICAO_DESPESA g
      inner join (
        Select
            d.classificacao
          , sum(c.valor) as valor
        from TBCAIXA_MOVIMENTO c
            inner join TBTPDESPESA d on (d.cod = c.tipo_despesa)
        where c.empresa  = :empresa
          and c.estorno  = 0
          and c.situacao = 1
          and c.tipo     = 'D'
          and ((:conta = 0) or (c.conta_corrente = :conta))
          and c.datahora between :dt_incial and :data_final
        group by
            d.classificacao
      ) dp on (dp.classificacao = g.tpe_codigo)
    order by
        g.tpe_ordem
    Into
        cd_classificacao_despesa
      , descricao
      , valor

  do
  begin
    grupo    = :cd_classificacao_despesa;
    marcador = '(-)';
    tipo     = 'D';
    vl_total_grupo   = coalesce(:valor, 0.00);
    vl_total_despesa = :vl_total_despesa + coalesce(:valor, 0.00);

    -- Guardar o valor do custo fixo
    if (:grupo = 1) then vl_custo_fixo = :valor;

    if (coalesce(:vl_total_receita, 0) = 0) then
      percentual = 0.00;
    else
      percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

    destacar  = 1;
    suspend;
    especific = null;

    /* 3. Detalhar os grupos de despesas */
    for
      Select
          c.tipo_despesa
        , d.tipodesp
        , c.tipo
        , sum(c.valor) as valor
      from TBCAIXA_MOVIMENTO c
          inner join TBTPDESPESA d on (d.cod = c.tipo_despesa)
      where c.empresa  = :empresa
        and c.estorno  = 0
        and c.situacao = 1
        and c.tipo     = 'D'
        and d.classificacao  = :cd_classificacao_despesa
        and ((:conta = 0) or (c.conta_corrente = :conta))
        and c.datahora between :dt_incial and :data_final
      group by
          c.tipo_despesa
        , d.tipodesp
        , c.tipo
      order by
          d.tipodesp
      Into
          cd_tipo_despesa
        , descricao
        , tipo
        , valor
    do
    begin
      marcador = '';
      id_tipo  = :cd_tipo_despesa;

      if (coalesce(:vl_total_receita, 0) = 0) then
        percentual = 0.00;
      else
        percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;
    
      destacar  = 0;
      suspend;
      especific = null;
      tipo      = null;
      id_tipo   = null;
    end

    /* 4. Gerar resultado por grupo */
    if (:grupo = 1) then  -- Custo Fixo
    begin
      marcador    = '(=)';
      descricao   = 'LUCRO OPERACIONAL';
      especific   = 'Margem de contribuição (-) Custos fixos';
      valor       = :vl_margem_contrib - :vl_total_grupo;
      vl_lucro_oper = :valor;

      if (coalesce(:vl_total_receita, 0) = 0) then
        percentual = 0.00;
      else
        percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

      destacar  = 1;
      suspend;
      especific = null;
    end
    if (:grupo = 2) then  -- Custo Variavel
    begin
      marcador    = '(=)';
      descricao   = 'MARGEM DE CONTRIBUIÇÃO';
      especific   = 'Receita total (-) Custos variáveis';
      valor       = :vl_total_receita - :vl_total_grupo;
      vl_margem_contrib = :valor;

      if (coalesce(:vl_total_receita, 0) = 0) then
        percentual = 0.00;
      else
        percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

      destacar  = 1;
      suspend;
      especific = null;
    end
  end 

  grupo = null;
  tipo  = null;

  /* 5. Totalizar Resultado exercicio */
  marcador    = '(=)';
  descricao   = 'RESULTADO';
  especific   = 'Receita total (-) Todos os custos e despesas';
  valor       = :vl_total_receita - :vl_total_despesa;

  if (coalesce(:vl_total_receita, 0) = 0) then
    percentual = 0.00;
  else
    percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

  destacar  = 1;
  suspend;
  especific = null;

  marcador   = '';
  descricao  = 'Ponto de Equilíbrio';
  especific  = 'Custo Fixo (/) Margem de Contribuição';

  if (coalesce(:vl_margem_contrib, 0) = 0) then
    percentual = 0.00;
  else
    percentual = coalesce(:vl_custo_fixo, 0.00) / coalesce(:vl_margem_contrib, 0.0) * 100.0;

  valor     = (:vl_total_receita * :percentual) / 100.0;
  destacar  = 1;
  suspend;
  especific = null;
end^

SET TERM ; ^




/*------ SYSDBA 17/03/2017 18:15:38 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_DEMONST_RESULT_OPERACIONAL (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL DMN_DATE,
    DATA_FINAL DMN_DATE)
returns (
    GRUPO DMN_SMALLINT_N,
    MARCADOR DMN_VCHAR_03,
    DESTACAR DMN_SMALLINT_N,
    DESCRICAO DMN_VCHAR_100,
    ESPECIFIC DMN_VCHAR_250,
    TIPO DMN_VCHAR_01,
    ID_TIPO DMN_SMALLINT_N,
    VALOR DMN_MONEY,
    PERCENTUAL DMN_PERCENTUAL_4)
as
declare variable VL_TOTAL_RECEITA DMN_MONEY;
declare variable VL_TOTAL_DESPESA DMN_MONEY;
declare variable VL_TOTAL_GRUPO DMN_MONEY;
declare variable VL_CUSTO_FIXO DMN_MONEY;
declare variable VL_MARGEM_CONTRIB DMN_MONEY;
declare variable VL_LUCRO_OPER DMN_MONEY;
declare variable CD_CLASSIFICACAO_DESPESA DMN_SMALLINT_N;
declare variable CD_TIPO_DESPESA DMN_SMALLINT_N;
declare variable DT_INCIAL DMN_DATETIME;
declare variable DT_FINAL DMN_DATETIME;
begin
  dt_incial = :data_inicial + cast('00:00:00' as time);
  dt_final  = :data_final   + cast('23:59:59' as time);

  vl_custo_fixo    = 0.0;
  vl_total_despesa = 0.0;

  /* 1. Totalizar Receita */
  for
    Select
        sum(c.valor) as valor
    from TBCAIXA_MOVIMENTO c
      left join TBTPRECEITA r on (r.cod = c.tipo_receita)
      left join TBTPDESPESA d on (d.cod = c.tipo_despesa)
    where c.empresa  = :empresa
      and c.estorno  = 0
      and c.situacao = 1
      and c.tipo     = 'C'
      and ((:conta = 0) or (c.conta_corrente = :conta))
      and c.datahora between :dt_incial and :dt_final
    Into
      valor
  do
  begin
    --valor = 900000.00;
    marcador   = '';
    descricao  = 'RECEITA TOTAL';
    tipo       = 'C';
    destacar   = 1;
    vl_total_receita = coalesce(:valor, 0.00);
    if (:vl_total_receita > 0.00) then
      percentual = 100.0;
    else
      percentual = 0.0;
    suspend;
  end 

  /* 2. Totalizar grupos de despesas */
  for
    Select
        g.tpe_codigo
      , g.tpe_descricao
      , dp.valor
    from VW_CLASSIFICAO_DESPESA g
      inner join (
        Select
            d.classificacao
          , sum(c.valor) as valor
        from TBCAIXA_MOVIMENTO c
            inner join TBTPDESPESA d on (d.cod = c.tipo_despesa)
        where c.empresa  = :empresa
          and c.estorno  = 0
          and c.situacao = 1
          and c.tipo     = 'D'
          and ((:conta = 0) or (c.conta_corrente = :conta))
          and c.datahora between :dt_incial and :data_final
        group by
            d.classificacao
      ) dp on (dp.classificacao = g.tpe_codigo)
    order by
        g.tpe_ordem
    Into
        cd_classificacao_despesa
      , descricao
      , valor

  do
  begin
    grupo    = :cd_classificacao_despesa;
    marcador = '(-)';
    tipo     = 'D';
    vl_total_grupo   = coalesce(:valor, 0.00);
    vl_total_despesa = :vl_total_despesa + coalesce(:valor, 0.00);

    -- Guardar o valor do custo fixo
    if (:grupo = 1) then vl_custo_fixo = :valor;

    if (coalesce(:vl_total_receita, 0) = 0) then
      percentual = 0.00;
    else
      percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

    destacar  = 1;
    suspend;
    especific = null;

    /* 3. Detalhar os grupos de despesas */
    for
      Select
          c.tipo_despesa
        , d.tipodesp
        , c.tipo
        , sum(c.valor) as valor
      from TBCAIXA_MOVIMENTO c
          inner join TBTPDESPESA d on (d.cod = c.tipo_despesa)
      where c.empresa  = :empresa
        and c.estorno  = 0
        and c.situacao = 1
        and c.tipo     = 'D'
        and d.classificacao  = :cd_classificacao_despesa
        and ((:conta = 0) or (c.conta_corrente = :conta))
        and c.datahora between :dt_incial and :data_final
      group by
          c.tipo_despesa
        , d.tipodesp
        , c.tipo
      order by
          d.tipodesp
      Into
          cd_tipo_despesa
        , descricao
        , tipo
        , valor
    do
    begin
      marcador = '';
      id_tipo  = :cd_tipo_despesa;

      if (coalesce(:vl_total_receita, 0) = 0) then
        percentual = 0.00;
      else
        percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;
    
      destacar  = 0;
      suspend;
      especific = null;
      tipo      = null;
      id_tipo   = null;
    end

    /* 4. Gerar resultado por grupo */
    if (:grupo = 1) then  -- Custo Fixo
    begin
      marcador    = '(=)';
      descricao   = 'LUCRO OPERACIONAL';
      especific   = 'Margem de contribuição (-) Custos fixos';
      valor       = :vl_margem_contrib - :vl_total_grupo;
      vl_lucro_oper = :valor;

      if (coalesce(:vl_total_receita, 0) = 0) then
        percentual = 0.00;
      else
        percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

      destacar  = 1;
      suspend;
      especific = null;
    end
    if (:grupo = 2) then  -- Custo Variavel
    begin
      marcador    = '(=)';
      descricao   = 'MARGEM DE CONTRIBUIÇÃO';
      especific   = 'Receita total (-) Custos variáveis';
      valor       = :vl_total_receita - :vl_total_grupo;
      vl_margem_contrib = :valor;

      if (coalesce(:vl_total_receita, 0) = 0) then
        percentual = 0.00;
      else
        percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

      destacar  = 1;
      suspend;
      especific = null;
    end
  end 

  grupo = null;
  tipo  = null;

  /* 5. Totalizar Resultado exercicio */
  marcador    = '(=)';
  descricao   = 'RESULTADO';
  especific   = 'Receita total (-) Todos os custos e despesas';
  valor       = :vl_total_receita - :vl_total_despesa;

  if (coalesce(:vl_total_receita, 0) = 0) then
    percentual = 0.00;
  else
    percentual = coalesce(:valor, 0.00) / :vl_total_receita * 100.0;

  destacar  = 1;
  suspend;
  especific = null;

  marcador   = '';
  descricao  = 'Ponto de Equilíbrio';
  especific  = 'Custo Fixo (/) Margem de Contribuição';

  if (coalesce(:vl_margem_contrib, 0) = 0) then
    percentual = 0.00;
  else
    percentual = coalesce(:vl_custo_fixo, 0.00) / coalesce(:vl_margem_contrib, 0.0) * 100.0;

  valor     = (:vl_total_receita * :percentual) / 100.0;
  destacar  = 1;
  suspend;
  especific = null;
end^

SET TERM ; ^




/*------ SYSDBA 17/03/2017 18:56:58 --------*/

ALTER TABLE TBFORMPAGTO
    ADD ATIVA DMN_LOGICO DEFAULT 1;




/*------ SYSDBA 17/03/2017 18:57:47 --------*/

COMMENT ON TABLE TBFORMPAGTO IS 'Tabela de Formas de Pagamneto

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar as formas de pagamentos utilizadas nas movimentacoes de COMPRA e VENDA e seus
respectivos parametros de comportamento.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    21/09/2015 - IMR :
        + Criacao do campo ATIVA para controlar, atraves do sistema, a disponibilidade
          ou nao de determidas formas de pagamento a serem utilizadas pelos usuarios.';




/*------ SYSDBA 17/03/2017 18:57:58 --------*/

COMMENT ON COLUMN TBFORMPAGTO.ATIVA IS
'Ativa:
0 - Nao
1 - Sim';




/*------ SYSDBA 17/03/2017 19:03:07 --------*/

COMMENT ON COLUMN TBFORMPAGTO.CONTA_CORRENTE IS
'Conta Corrente [DESCONTINUADO]

Obs.: Campo descontinuado pois na nova estrutura uma forma de pagamento pode esta
associada a mais de uma conta corrente. Verificar tabela "TBFORMPAGTO_CONTACOR".';




/*------ SYSDBA 17/03/2017 20:01:04 --------*/

ALTER TABLE TBCONTA_CORRENTE
    ADD CODIGO_CONTABIL DMN_VCHAR_20;

COMMENT ON COLUMN TBCONTA_CORRENTE.CODIGO_CONTABIL IS
'Codigo de Identificacao na Contabilidade';




/*------ SYSDBA 17/03/2017 20:12:35 --------*/

COMMENT ON TABLE TBCONTA_CORRENTE IS 'Tabela Conta Corrente

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de contas correntes do tipo Caixa (1) e do tipo Banco (2).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/03/2017 - IMR:
        + Criacao do campo CODIGO_CONTABIL para que este venha ser referenciado
          em futuros relatorios de Contas A Pagar e A Receber (Quitados) a pedido
          da contabilidade.

    14/10/2014 - IMR:
        + Criacao do campo EMPRESA para definir a empresa responsavel pela conta corrente do tipo Banco (2).';




/*------ SYSDBA 17/03/2017 20:13:03 --------*/

CREATE INDEX IDX_TBCONTA_CORRENTE_COD_CC
ON TBCONTA_CORRENTE (CODIGO_CONTABIL);




/*------ SYSDBA 28/03/2017 12:12:24 --------*/

COMMENT ON COLUMN TBPRODUTO.ESTOQUE_APROP_LOTE IS
'Produto com Estoque Apropriado gerenciado por Lotes (SGI):
0 - Nao
1 - Sim

Produto com Estoque gerenciado por Lotes (SGE):
0 - Nao
1 - Sim';




/*------ SYSDBA 28/03/2017 12:18:08 --------*/

create view vw_empresa (codigo, cnpj, razao, fantasia)
as
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as fantasia
from TBEMPRESA e
order by
    4 -- Fantasia;




/*------ SYSDBA 28/03/2017 12:19:41 --------*/

CREATE OR ALTER VIEW vw_empresa (codigo, cnpj, razao, fantasia)
as
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as fantasia
from TBEMPRESA e
order by
    4 -- Fantasia;

COMMENT ON VIEW VW_EMPRESA IS 'View Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   28/03/2017

View responsavel por listar de forma padronizada a relacao de empresa cadastradas
no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    17/05/2016 - IMR :
        * Criacao da view.';




/*------ SYSDBA 28/03/2017 14:33:19 --------*/

CREATE OR ALTER VIEW vw_empresa (codigo, cnpj, razao, fantasia)
as
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as fantasia
from TBEMPRESA e
order by
    4 -- Fantasia;

COMMENT ON VIEW VW_EMPRESA IS 'View Empresa

    Autor   :   Isaque Marinho Ribeiro
    Data    :   28/03/2017

View responsavel por listar de forma padronizada a relacao de empresa cadastradas
no sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/03/2017 - IMR :
        * Criacao da view.';

GRANT ALL ON VW_EMPRESA TO "PUBLIC";



/*------ SYSDBA 04/04/2017 15:37:44 --------*/

CREATE INDEX IDX_TBESTOQUE_ALMOX_DATA
ON TBESTOQUE_ALMOX (DATA_FABRICACAO,DATA_VALIDADE);

CREATE INDEX IDX_TBESTOQUE_ALMOX_DESC
ON TBESTOQUE_ALMOX (DESCRICAO);




/*------ SYSDBA 05/04/2017 15:54:23 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'DESCRI') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;




/*------ SYSDBA 05/04/2017 15:55:12 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_15'
where (RDB$FIELD_NAME = 'REFERENCIA') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;




/*------ SYSDBA 05/04/2017 15:56:03 --------*/

CREATE DOMAIN DMN_VCHAR_40 AS
VARCHAR(40);CREATE DOMAIN DMN_VCHAR_40_NN AS
VARCHAR(40)
NOT NULL;


/*------ SYSDBA 05/04/2017 15:56:16 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_40'
where (RDB$FIELD_NAME = 'MODELO') and
(RDB$RELATION_NAME = 'TBPRODUTO')
;




/*------ SYSDBA 11/04/2017 15:56:08 --------*/

COMMENT ON COLUMN TBTPDESPESA.CLASSIFICACAO IS
'Classificacao/Categoria:
0 - A Definir
1 - Custo Fixo
2 - Custo Variavel
3 - Despesa Fixa
4 - Despesa Variavel

Obs.: Todas as despesas associadas a producao estara classificada como "Custos"
e as despesas da area administrativa estara relacionada a classificacao "Despesas"';




/*------ SYSDBA 11/04/2017 15:58:41 --------*/

ALTER TABLE TBTPRECEITA
    ADD CLASSIFICACAO DMN_SMALLINT_NN DEFAULT 0;

COMMENT ON COLUMN TBTPRECEITA.CLASSIFICACAO IS
'Classificacao/Categoria:
0 - A Definir
1 - Receita com Produtos
2 - Receita com Servicos
3 - Juros Recebidos
4 - Outras Receitas';

alter table TBTPRECEITA
alter COD position 1;

alter table TBTPRECEITA
alter CLASSIFICACAO position 2;

alter table TBTPRECEITA
alter TIPOREC position 3;

alter table TBTPRECEITA
alter TIPO_PARTICULAR position 4;

alter table TBTPRECEITA
alter PLANO_CONTA position 5;

alter table TBTPRECEITA
alter ATIVO position 6;




/*------ SYSDBA 11/04/2017 16:03:45 --------*/

CREATE OR ALTER VIEW VW_CLASSIFICAO_RECEITA (
    TPE_CODIGO,
    TPE_DESCRICAO,
    TPE_ORDEM)
AS
Select 0 as TPE_CODIGO , 'A Definir'            as TPE_DESCRICAO, 9 as TPE_ORDEM from RDB$DATABASE union
Select 1 as TPE_CODIGO , 'Receita com Produtos' as TPE_DESCRICAO, 1 as TPE_ORDEM from RDB$DATABASE union
Select 2 as TPE_CODIGO , 'Receita com Servicos' as TPE_DESCRICAO, 2 as TPE_ORDEM from RDB$DATABASE union
Select 3 as TPE_CODIGO , 'Juros Recebidos'      as TPE_DESCRICAO, 3 as TPE_ORDEM from RDB$DATABASE union
Select 4 as TPE_CODIGO , 'Outras Receitas'      as TPE_DESCRICAO, 4 as TPE_ORDEM from RDB$DATABASE
;

GRANT ALL ON VW_CLASSIFICAO_RECEITA TO "PUBLIC";



/*------ SYSDBA 31/05/2017 13:21:07 --------*/

ALTER TABLE TBCONDICAOPAGTO
    ADD ATIVA DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCONDICAOPAGTO.ATIVA IS
'Ativa:
0 - Nao
1 - Sim';




/*------ SYSDBA 31/05/2017 13:46:42 --------*/

ALTER DOMAIN DMN_BAIRRO
TYPE VARCHAR(100) CHARACTER SET ISO8859_2;




/*------ SYSDBA 31/05/2017 14:40:20 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_250'
where (RDB$FIELD_NAME = 'LOG_NOME') and
(RDB$RELATION_NAME = 'TBLOGRADOURO')
;




/*------ SYSDBA 31/05/2017 14:40:57 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOGRADOURO (
    NOM_LOGRADOURO DMN_VCHAR_250,
    TIP_LOGRADOURO DMN_VCHAR_50,
    COD_CIDADE integer)
returns (
    COD_LOGRADOURO integer,
    COD_TIPO smallint)
as
declare variable TMP_TIPO smallint;
declare variable TMP_DESC DMN_VCHAR_250;
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
end^

SET TERM ; ^




/*------ SYSDBA 31/05/2017 14:41:21 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_50'
where (RDB$FIELD_NAME = 'TLG_DESCRICAO') and
(RDB$RELATION_NAME = 'TBTIPO_LOGRADOURO')
;




/*------ SYSDBA 31/05/2017 14:41:34 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'TLG_SIGLA') and
(RDB$RELATION_NAME = 'TBTIPO_LOGRADOURO')
;


UPDATE TBLOGRADOURO SET TLG_COD = 20 WHERE TLG_COD = 21;

UPDATE TBCLIENTE SET TLG_COD = 20 WHERE TLG_COD = 21;

DELETE FROM TBTIPO_LOGRADOURO WHERE TLG_COD = 21;

UPDATE  TBTIPO_LOGRADOURO SET TLG_COD = 21 WHERE TLG_COD = 22;

COMMIT WORK;


/*------ SYSDBA 31/05/2017 14:51:57 --------*/

ALTER TABLE TBTIPO_LOGRADOURO
ADD CONSTRAINT UNQ_TBTIPO_LOGRADOURO
UNIQUE (TLG_DESCRICAO);




/*------ SYSDBA 31/05/2017 14:56:28 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BAIRRO'
where (RDB$FIELD_NAME = 'BAI_NOME') and
(RDB$RELATION_NAME = 'TBBAIRRO')
;




/*------ SYSDBA 31/05/2017 15:09:21 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOGRADOURO (
    NOM_LOGRADOURO DMN_VCHAR_250,
    TIP_LOGRADOURO DMN_VCHAR_50,
    COD_CIDADE integer)
returns (
    COD_LOGRADOURO DMN_INTEGER_N,
    COD_TIPO DMN_SMALLINT_N)
as
declare variable TMP_TIPO DMN_SMALLINT_N;
declare variable TMP_DESC DMN_VCHAR_250;
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
end^

SET TERM ; ^




/*------ SYSDBA 31/05/2017 15:15:14 --------*/

CREATE TABLE SYS_TIPO_PRODUTO (
    CODIGO DMN_SMALLINT_NN NOT NULL,
    DESCRICAO DMN_VCHAR_50);

ALTER TABLE SYS_TIPO_PRODUTO
ADD CONSTRAINT PK_SYS_TIPO_PRODUTO
PRIMARY KEY (CODIGO);

COMMENT ON COLUMN SYS_TIPO_PRODUTO.CODIGO IS
'Codigo';

COMMENT ON COLUMN SYS_TIPO_PRODUTO.DESCRICAO IS
'Descricao';




/*------ SYSDBA 31/05/2017 15:15:15 --------*/

COMMENT ON TABLE SYS_TIPO_PRODUTO IS 'Tabela de Tipos de Produtos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/05/2017

Tabela responsavel por armazenar os registros fixos de tipos de produtos que o
controle de Cadastro de Produtos em emissao de NF-e utilizara para a classificacao
dos produtos vendidos.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/05/2015 - IMR :
        * Documentacao da tabela.';

GRANT ALL ON SYS_TIPO_PRODUTO TO "PUBLIC";



/*------ SYSDBA 31/05/2017 15:18:27 --------*/

ALTER TABLE TBPRODUTO
    ADD CODTIPO DMN_SMALLINT_N;

COMMENT ON COLUMN TBPRODUTO.CODTIPO IS
'Tipo do produto, quando a aliquota for ICMS (Tipo Aliquota 0)';

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
alter REFERENCIA position 8;

alter table TBPRODUTO
alter NOME_AMIGO position 9;

alter table TBPRODUTO
alter ESPECIFICACAO position 10;

alter table TBPRODUTO
alter PRECO position 11;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 12;

alter table TBPRODUTO
alter SECAO position 13;

alter table TBPRODUTO
alter QTDE position 14;

alter table TBPRODUTO
alter FRACIONADOR position 15;

alter table TBPRODUTO
alter PESO_BRUTO position 16;

alter table TBPRODUTO
alter PESO_LIQUIDO position 17;

alter table TBPRODUTO
alter CUBAGEM position 18;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 19;

alter table TBPRODUTO
alter UNIDADE position 20;

alter table TBPRODUTO
alter ESTOQMIN position 21;

alter table TBPRODUTO
alter CODTIPO position 22;

alter table TBPRODUTO
alter CODGRUPO position 23;

alter table TBPRODUTO
alter CODFABRICANTE position 24;

alter table TBPRODUTO
alter CUSTOMEDIO position 25;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 27;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 28;

alter table TBPRODUTO
alter CODEMP position 29;

alter table TBPRODUTO
alter CODSECAO position 30;

alter table TBPRODUTO
alter CODORIGEM position 31;

alter table TBPRODUTO
alter CODTRIBUTACAO position 32;

alter table TBPRODUTO
alter CST position 33;

alter table TBPRODUTO
alter CSOSN position 34;

alter table TBPRODUTO
alter CST_PIS position 35;

alter table TBPRODUTO
alter CST_COFINS position 36;

alter table TBPRODUTO
alter TABELA_IBPT position 37;

alter table TBPRODUTO
alter NCM_SH position 38;

alter table TBPRODUTO
alter CODIGO_NVE position 39;

alter table TBPRODUTO
alter CODIGO_CEST position 40;

alter table TBPRODUTO
alter CODCFOP position 41;

alter table TBPRODUTO
alter CODBARRA_EAN position 42;

alter table TBPRODUTO
alter CODUNIDADE position 43;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 44;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 45;

alter table TBPRODUTO
alter ALIQUOTA position 46;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 47;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 48;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 49;

alter table TBPRODUTO
alter VALOR_IPI position 50;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 51;

alter table TBPRODUTO
alter RESERVA position 52;

alter table TBPRODUTO
alter PRODUTO_NOVO position 53;

alter table TBPRODUTO
alter COR_VEICULO position 54;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 55;

alter table TBPRODUTO
alter TIPO_VEICULO position 56;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 57;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 58;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 59;

alter table TBPRODUTO
alter CHASSI_VEICULO position 60;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 61;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 62;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 63;

alter table TBPRODUTO
alter USUARIO position 64;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 65;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 66;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 67;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 68;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 69;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 70;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 71;

alter table TBPRODUTO
alter CUST_DESP_ADM position 72;

alter table TBPRODUTO
alter CUST_COMISSAO position 73;

alter table TBPRODUTO
alter CUST_IMPOSTO position 74;

alter table TBPRODUTO
alter FI_RET_FINANC position 75;

alter table TBPRODUTO
alter FI_RET_PLANO position 76;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 77;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 78;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 79;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 80;




/*------ SYSDBA 31/05/2017 15:19:27 --------*/

ALTER TABLE TBPRODUTO
ADD CONSTRAINT FK_TBPRODUTO_TIPO
FOREIGN KEY (CODTIPO)
REFERENCES SYS_TIPO_PRODUTO(CODIGO);




/*------ SYSDBA 31/05/2017 16:02:15 --------*/

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




/*------ SYSDBA 31/05/2017 16:39:40 --------*/

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

    31/05/2017 - IMR :
        + Criacao do campo CODTIPO com o objeto de classificao o produto de acordo
          com o seu tipo a fim de definir a carga de lotes nos XML''s das NF-e quando
          o produto for do tipo MEDICAMENTOS.

    17/05/2016 - IMR :
        + Criacao do campo CODIGO_CEST com o objetivo de armazenar o Codigo Especificador
          de Substituicao Tributaria que passar ser exijido a partir de 2016 na emissao
          da NF-e e NFC-e.

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




/*------ SYSDBA 07/06/2017 10:26:26 --------*/

ALTER TABLE TBEMPRESA
    ADD ATIVA DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBEMPRESA.ATIVA IS
'Empresa ativa:
0 - Nao
1 - Sim';




/*------ SYSDBA 07/06/2017 10:26:54 --------*/

CREATE INDEX IDX_TBEMPRESA_ATIVA
ON TBEMPRESA (ATIVA);




/*------ SYSDBA 07/06/2017 10:28:20 --------*/

COMMENT ON TABLE TBEMPRESA IS 'Tabela Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Tabela responsavel por armazenar o registro da empresa e demais dados necessarios e emissao de documentos fiscais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/06/2017 - IMR :
        + Criacao do campo ATIVA que vai possibilitar a desativacao de novos lancamentos
          e emissao de documentos para a empresa desativada.

    11/12/2014 - IMR :
        + Criação dos campos SERIE_NFCE e NUMERO_NFCE para controle dos numeros sequenciais de emissao de NFC-e (Nota
          Fiscal do Consumidor eletronica).';




/*------ SYSDBA 07/06/2017 10:29:04 --------*/

CREATE OR ALTER VIEW VW_EMPRESA(
    CODIGO,
    CNPJ,
    RAZAO,
    FANTASIA)
AS
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as fantasia
from TBEMPRESA e
where e.ativa = 1
order by
    4 -- Fantasia
;




/*------ SYSDBA 07/06/2017 17:42:26 --------*/

ALTER TABLE TBFORMPAGTO_CONDICAO
    ADD SELECIONAR DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORMPAGTO_CONDICAO.SELECIONAR IS
'Selecionado:
0 - Nao
1 - Sim';




/*------ SYSDBA 07/06/2017 17:43:03 --------*/

ALTER TABLE TBFORMPAGTO_CONTACOR
    ADD SELECIONAR DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBFORMPAGTO_CONTACOR.SELECIONAR IS
'Selecionado:
0 - Nao
1 - Sim';




/*------ SYSDBA 07/06/2017 17:51:03 --------*/

ALTER TABLE TBCENTRO_CUSTO_EMPRESA
    ADD SELECIONAR DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCENTRO_CUSTO_EMPRESA.SELECIONAR IS
'Selecionado:
0 - Nao
1 - Sim';




/*------ SYSDBA 15/06/2017 14:52:12 --------*/

COMMENT ON COLUMN TBPRODUTO.CODTIPO IS
'Tipo do registro, quando a aliquota for ICMS (Tipo Aliquota 0)';




/*------ SYSDBA 15/06/2017 14:54:03 --------*/

COMMENT ON COLUMN TBPRODUTO.CODTIPO IS
'Tipo do produto, quando a aliquota for ICMS (Tipo Aliquota 0)';




/*------ SYSDBA 15/06/2017 16:26:05 --------*/

COMMENT ON COLUMN TBESTOQUE_ALMOX.LOTE IS
'Lote

Observacoes:
1 - O lote geral para todas as movimentacoes sera 0 (zero).
2 - Produtos que possuem lotes de fabricacao diferentes e que sao informados na entrada terao seus lotes aqui lancados';




/*------ SYSDBA 15/06/2017 16:34:48 --------*/

COMMENT ON COLUMN TBPRODUTO.REFERENCIA IS
'Codigo de referencia

Observacoes:
1 - Para produtos do tipo Materiais medico-hospitalares, Medicamentos e Opme este
campo pode armazenar o codigo Anvisa.
2 - Para produtos automotores (carros e motos) este campo pode armazenar a Placa
do veiculo.';



/*------ SYSDBA 11/08/2017 16:04:08 --------*/

Insert into TBCENTRO_CUSTO (
    codigo
  , descricao  
  , ativo      
  , codcliente 
) values (
    :cc
  , ''
  , 1
  , null
);

/*------ SYSDBA 11/08/2017 16:04:15 --------*/

ROLLBACK WORK;


/*------ SYSDBA 30/08/2017 10:29:11 --------*/

ALTER TABLE TBCOMPRASITENS
    ADD LOTE_ID DMN_GUID_38,
    ADD LOTE_DESCRICAO DMN_VCHAR_30,
    ADD LOTE_DATA_FAB DMN_DATE,
    ADD LOTE_DATA_VAL DMN_DATE;

COMMENT ON COLUMN TBCOMPRASITENS.LOTE_ID IS
'Lote : ID (Guid -> Identificacao unica no Estoque/Almoxaifado)';

COMMENT ON COLUMN TBCOMPRASITENS.LOTE_DESCRICAO IS
'Lote : Descricao';

COMMENT ON COLUMN TBCOMPRASITENS.LOTE_DATA_FAB IS
'Lote : Data de fabricacao.';

COMMENT ON COLUMN TBCOMPRASITENS.LOTE_DATA_VAL IS
'Lote : Data de validade.';




/*------ SYSDBA 30/08/2017 10:30:06 --------*/

CREATE INDEX IDX_TBCOMPRASITENS_LTDT
ON TBCOMPRASITENS (LOTE_DATA_FAB,LOTE_DATA_VAL);

CREATE INDEX IDX_TBCOMPRASITENS_LTDS
ON TBCOMPRASITENS (LOTE_DESCRICAO);

CREATE INDEX IDX_TBCOMPRASITENS_LTID
ON TBCOMPRASITENS (LOTE_ID);




/*------ SYSDBA 30/08/2017 16:56:41 --------*/

SET TERM ^ ;

create or alter procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE Integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable fracionador numeric(15,3);
declare variable unidade smallint;
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

    qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade;

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

    suspend;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 30/08/2017 16:58:28 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE Integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable fracionador numeric(15,3);
declare variable unidade smallint;
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

    qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade;

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

    suspend;
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_LOTE_PRODUTO IS 'Store Procedure Inserir Lote Produto.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   30/08/2017

Procedure reponsavel por montar verificar a insercao/atualizacao dos lotes de
produtos informados no movimento de entrada (Sistema de Gestao Comercial).


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    30/08/2017 - IMR :
        * Documentacao da store procedure.';




/*------ SYSDBA 30/08/2017 17:23:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
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

    qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade;

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

    suspend;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 31/08/2017 17:11:35 --------*/

ALTER TABLE TBPRODUTO
    ADD ANVISA DMN_VCHAR_30;

COMMENT ON COLUMN TBPRODUTO.ANVISA IS
'Identificacao Anvisa, quando o tipo do produto for:
1. Material Medico-Hospitalar
2. Medicamento
3. Solucao ou
4. OPME';

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
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter PRECO position 12;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 13;

alter table TBPRODUTO
alter SECAO position 14;

alter table TBPRODUTO
alter QTDE position 15;

alter table TBPRODUTO
alter FRACIONADOR position 16;

alter table TBPRODUTO
alter PESO_BRUTO position 17;

alter table TBPRODUTO
alter PESO_LIQUIDO position 18;

alter table TBPRODUTO
alter CUBAGEM position 19;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 20;

alter table TBPRODUTO
alter UNIDADE position 21;

alter table TBPRODUTO
alter ESTOQMIN position 22;

alter table TBPRODUTO
alter CODTIPO position 23;

alter table TBPRODUTO
alter CODGRUPO position 24;

alter table TBPRODUTO
alter CODFABRICANTE position 25;

alter table TBPRODUTO
alter CUSTOMEDIO position 26;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 27;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 28;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 29;

alter table TBPRODUTO
alter CODEMP position 30;

alter table TBPRODUTO
alter CODSECAO position 31;

alter table TBPRODUTO
alter CODORIGEM position 32;

alter table TBPRODUTO
alter CODTRIBUTACAO position 33;

alter table TBPRODUTO
alter CST position 34;

alter table TBPRODUTO
alter CSOSN position 35;

alter table TBPRODUTO
alter CST_PIS position 36;

alter table TBPRODUTO
alter CST_COFINS position 37;

alter table TBPRODUTO
alter TABELA_IBPT position 38;

alter table TBPRODUTO
alter NCM_SH position 39;

alter table TBPRODUTO
alter CODIGO_NVE position 40;

alter table TBPRODUTO
alter CODIGO_CEST position 41;

alter table TBPRODUTO
alter CODCFOP position 42;

alter table TBPRODUTO
alter CODBARRA_EAN position 43;

alter table TBPRODUTO
alter CODUNIDADE position 44;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 45;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 46;

alter table TBPRODUTO
alter ALIQUOTA position 47;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 48;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 49;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 50;

alter table TBPRODUTO
alter VALOR_IPI position 51;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 52;

alter table TBPRODUTO
alter RESERVA position 53;

alter table TBPRODUTO
alter PRODUTO_NOVO position 54;

alter table TBPRODUTO
alter COR_VEICULO position 55;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 56;

alter table TBPRODUTO
alter TIPO_VEICULO position 57;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 58;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 59;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 60;

alter table TBPRODUTO
alter CHASSI_VEICULO position 61;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 62;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 63;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 64;

alter table TBPRODUTO
alter USUARIO position 65;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 66;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 67;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 68;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 69;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 70;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 71;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 72;

alter table TBPRODUTO
alter CUST_DESP_ADM position 73;

alter table TBPRODUTO
alter CUST_COMISSAO position 74;

alter table TBPRODUTO
alter CUST_IMPOSTO position 75;

alter table TBPRODUTO
alter FI_RET_FINANC position 76;

alter table TBPRODUTO
alter FI_RET_PLANO position 77;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 78;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 79;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 80;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 81;




/*------ SYSDBA 31/08/2017 17:12:01 --------*/

CREATE INDEX IDX_TBPRODUTO_ANVISA
ON TBPRODUTO (ANVISA);




/*------ SYSDBA 01/09/2017 16:52:20 --------*/

ALTER TABLE TVENDASITENS
    ADD LOTE_ID DMN_GUID_38;

COMMENT ON COLUMN TVENDASITENS.LOTE_ID IS
'ID do Lote do produto, caso o estoque do produto seja gerenciado por lote.';

alter table TVENDASITENS
alter ANO position 1;

alter table TVENDASITENS
alter CODCONTROL position 2;

alter table TVENDASITENS
alter CODEMP position 3;

alter table TVENDASITENS
alter SEQ position 4;

alter table TVENDASITENS
alter CODPROD position 5;

alter table TVENDASITENS
alter CODCLIENTE position 6;

alter table TVENDASITENS
alter CODCLI position 7;

alter table TVENDASITENS
alter CODVENDEDOR position 8;

alter table TVENDASITENS
alter DTVENDA position 9;

alter table TVENDASITENS
alter QTDE position 10;

alter table TVENDASITENS
alter LOTE_ID position 11;

alter table TVENDASITENS
alter PUNIT position 12;

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 13;

alter table TVENDASITENS
alter DESCONTO position 14;

alter table TVENDASITENS
alter DESCONTO_VALOR position 15;

alter table TVENDASITENS
alter PFINAL position 16;

alter table TVENDASITENS
alter QTDEFINAL position 17;

alter table TVENDASITENS
alter UNID_COD position 18;

alter table TVENDASITENS
alter CFOP_COD position 19;

alter table TVENDASITENS
alter CST position 20;

alter table TVENDASITENS
alter CSOSN position 21;

alter table TVENDASITENS
alter ALIQUOTA position 22;

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 23;

alter table TVENDASITENS
alter ALIQUOTA_PIS position 24;

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 25;

alter table TVENDASITENS
alter VALOR_IPI position 26;

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 27;

alter table TVENDASITENS
alter TOTAL_BRUTO position 28;

alter table TVENDASITENS
alter TOTAL_DESCONTO position 29;

alter table TVENDASITENS
alter TOTAL_LIQUIDO position 30;

alter table TVENDASITENS
alter TOTAL_COMISSAO position 31;




/*------ SYSDBA 01/09/2017 19:05:58 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
    do
    begin
      --reserva = :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      estoque_lt = coalesce(:estoque_lt, 0);

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

      -- Baixar estoque do Lote
      if ((:movimentar = 1) and (:estoque_lt > 0.0)) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :Produto);
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
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 01/09/2017 19:07:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , i.lote_id
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      --reserva = :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;
      estoque_lt = coalesce(:estoque_lt, 0);

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

      -- Baixar estoque do Lote
      if ((:movimentar = 1) and (:estoque_lt > 0.0)) then
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
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 01/09/2017 19:13:24 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , i.lote_id
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
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
      if ((:movimentar = 1) and (:estoque_lt > 0.0)) then
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
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 01/09/2017 19:16:06 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
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
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod = :Produto;

      -- Retornar estoque do Lote
      if ( (:movimentar = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt + (:quantidade * e.fracionador)
        where (e.id = :lote_id);
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




/*------ SYSDBA 01/09/2017 19:16:30 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , nullif(trim(i.lote_id), '')
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
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
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 01/09/2017 19:17:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , nullif(trim(i.lote_id), '')
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
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
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 01/09/2017 19:22:14 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
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
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , Custo_compra
        , Movimentar
        , estoque_lt
        , lote_id
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

      -- Decrementar estoque do Lote
      if ( (:movimentar = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :lote_id);
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




/*------ SYSDBA 12/09/2017 11:56:56 --------*/

ALTER TABLE TBAJUSTESTOQ
    ADD LOTE_ID DMN_GUID_38,
    ADD LOTE_DESCRICAO DMN_VCHAR_30,
    ADD LOTE_DATA_FAB DMN_DATE,
    ADD LOTE_DATA_VAL DMN_DATE;

COMMENT ON COLUMN TBAJUSTESTOQ.LOTE_ID IS
'Lote : ID (Guid -> Identificacao unica no Estoque/Almoxaifado)';

COMMENT ON COLUMN TBAJUSTESTOQ.LOTE_DESCRICAO IS
'Lote : Descricao';

COMMENT ON COLUMN TBAJUSTESTOQ.LOTE_DATA_FAB IS
'Lote : Data de fabricacao';

COMMENT ON COLUMN TBAJUSTESTOQ.LOTE_DATA_VAL IS
'Lote : Data de validade';




/*------ SYSDBA 12/09/2017 11:57:17 --------*/

CREATE INDEX IDX_TBAJUSTESTOQ_LOTE
ON TBAJUSTESTOQ (LOTE_ID);




/*------ SYSDBA 12/09/2017 11:57:39 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.LOTE_DATA_FAB IS
'Lote : Data de fabricacao';




/*------ SYSDBA 12/09/2017 11:57:42 --------*/

COMMENT ON COLUMN TBCOMPRASITENS.LOTE_DATA_VAL IS
'Lote : Data de validade';




/*------ SYSDBA 12/09/2017 11:59:15 --------*/

CREATE INDEX IDX_TBAJUSTESTOQ_DATA
ON TBAJUSTESTOQ (DTAJUST);








/*------ SYSDBA 12/09/2017 12:06:25 --------*/

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
    --, doc
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
    --, :documento
    , :data_hora
    , :usuario
  );
end^

SET TERM ; ^




/*------ SYSDBA 12/09/2017 12:06:41 --------*/

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
    --, Doc
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
    --, new.doc
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



/*------ SYSDBA 12/09/2017 12:07:27 --------*/

COMMENT ON COLUMN TBAJUSTESTOQ.DOC IS
'Documento';

alter table TBAJUSTESTOQ
alter CONTROLE position 1;

alter table TBAJUSTESTOQ
alter CODPROD position 2;

alter table TBAJUSTESTOQ
alter CODEMPRESA position 3;

alter table TBAJUSTESTOQ
alter CODFORN position 4;

alter table TBAJUSTESTOQ
alter QTDEATUAL position 5;

alter table TBAJUSTESTOQ
alter QTDENOVA position 6;

alter table TBAJUSTESTOQ
alter QTDEFINAL position 7;

alter table TBAJUSTESTOQ
alter MOTIVO position 8;

alter table TBAJUSTESTOQ
alter DOC position 9;

alter table TBAJUSTESTOQ
alter DTAJUST position 10;

alter table TBAJUSTESTOQ
alter USUARIO position 11;

alter table TBAJUSTESTOQ
alter LOTE_ID position 12;

alter table TBAJUSTESTOQ
alter LOTE_DESCRICAO position 13;

alter table TBAJUSTESTOQ
alter LOTE_DATA_FAB position 14;

alter table TBAJUSTESTOQ
alter LOTE_DATA_VAL position 15;




/*------ SYSDBA 12/09/2017 12:07:51 --------*/

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




/*------ SYSDBA 12/09/2017 12:08:02 --------*/

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




/*------ SYSDBA 12/09/2017 13:33:50 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_DATETIME'
where (RDB$FIELD_NAME = 'DTAJUST') and
(RDB$RELATION_NAME = 'TBAJUSTESTOQ')
;

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_10'
where (RDB$FIELD_NAME = 'DOC') and
(RDB$RELATION_NAME = 'TBAJUSTESTOQ')
;



/*------ SYSDBA 12/09/2017 14:55:07 --------*/

ALTER TABLE TBAJUSTESTOQ
    ADD FRACIONADOR DMN_PERCENTUAL_3 DEFAULT 1;

COMMENT ON COLUMN TBAJUSTESTOQ.FRACIONADOR IS
'Fracionador';

alter table TBAJUSTESTOQ
alter CONTROLE position 1;

alter table TBAJUSTESTOQ
alter CODPROD position 2;

alter table TBAJUSTESTOQ
alter CODEMPRESA position 3;

alter table TBAJUSTESTOQ
alter CODFORN position 4;

alter table TBAJUSTESTOQ
alter QTDEATUAL position 5;

alter table TBAJUSTESTOQ
alter QTDENOVA position 6;

alter table TBAJUSTESTOQ
alter QTDEFINAL position 7;

alter table TBAJUSTESTOQ
alter FRACIONADOR position 8;

alter table TBAJUSTESTOQ
alter MOTIVO position 9;

alter table TBAJUSTESTOQ
alter DOC position 10;

alter table TBAJUSTESTOQ
alter DTAJUST position 11;

alter table TBAJUSTESTOQ
alter USUARIO position 12;

alter table TBAJUSTESTOQ
alter LOTE_ID position 13;

alter table TBAJUSTESTOQ
alter LOTE_DESCRICAO position 14;

alter table TBAJUSTESTOQ
alter LOTE_DATA_FAB position 15;

alter table TBAJUSTESTOQ
alter LOTE_DATA_VAL position 16;




/*------ SYSDBA 12/09/2017 15:34:53 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
  declare variable estoque DMN_QUANTIDADE_D3;
begin
  Select
    coalesce(p.qtde, 0.0)
  from TBPRODUTO p
  where p.cod = new.codprod
  Into
    estoque;

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
end^

SET TERM ; ^

GRANT EXECUTE ON PROCEDURE SET_LOTE_PRODUTO TO "PUBLIC";



/*------ SYSDBA 18/09/2017 13:28:10 --------*/

ALTER TABLE TBPRODUTO
    ADD LARGURA DMN_MONEY_DESCONTO_4,
    ADD ALTURA DMN_MONEY_DESCONTO_4,
    ADD ESPESSURA DMN_MONEY_DESCONTO_4;

COMMENT ON COLUMN TBPRODUTO.LARGURA IS
'Dimensao: Largura (m)';

COMMENT ON COLUMN TBPRODUTO.ALTURA IS
'Dimensao: Altura (m)';

COMMENT ON COLUMN TBPRODUTO.ESPESSURA IS
'Dimensao: Espessura (m)';

COMMENT ON COLUMN TBPRODUTO.CUBAGEM IS
'Cubagem (m3).

Observacao: Para lancamento livre ou calculado (Largura x Altura x Espessura).';

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
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter PRECO position 12;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 13;

alter table TBPRODUTO
alter SECAO position 14;

alter table TBPRODUTO
alter QTDE position 15;

alter table TBPRODUTO
alter FRACIONADOR position 16;

alter table TBPRODUTO
alter PESO_BRUTO position 17;

alter table TBPRODUTO
alter PESO_LIQUIDO position 18;

alter table TBPRODUTO
alter LARGURA position 19;

alter table TBPRODUTO
alter ALTURA position 20;

alter table TBPRODUTO
alter ESPESSURA position 21;

alter table TBPRODUTO
alter CUBAGEM position 22;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 23;

alter table TBPRODUTO
alter UNIDADE position 24;

alter table TBPRODUTO
alter ESTOQMIN position 25;

alter table TBPRODUTO
alter CODTIPO position 26;

alter table TBPRODUTO
alter CODGRUPO position 27;

alter table TBPRODUTO
alter CODFABRICANTE position 28;

alter table TBPRODUTO
alter CUSTOMEDIO position 29;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 30;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 31;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 32;

alter table TBPRODUTO
alter CODEMP position 33;

alter table TBPRODUTO
alter CODSECAO position 34;

alter table TBPRODUTO
alter CODORIGEM position 35;

alter table TBPRODUTO
alter CODTRIBUTACAO position 36;

alter table TBPRODUTO
alter CST position 37;

alter table TBPRODUTO
alter CSOSN position 38;

alter table TBPRODUTO
alter CST_PIS position 39;

alter table TBPRODUTO
alter CST_COFINS position 40;

alter table TBPRODUTO
alter TABELA_IBPT position 41;

alter table TBPRODUTO
alter NCM_SH position 42;

alter table TBPRODUTO
alter CODIGO_NVE position 43;

alter table TBPRODUTO
alter CODIGO_CEST position 44;

alter table TBPRODUTO
alter CODCFOP position 45;

alter table TBPRODUTO
alter CODBARRA_EAN position 46;

alter table TBPRODUTO
alter CODUNIDADE position 47;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 48;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 49;

alter table TBPRODUTO
alter ALIQUOTA position 50;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 51;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 52;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 53;

alter table TBPRODUTO
alter VALOR_IPI position 54;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 55;

alter table TBPRODUTO
alter RESERVA position 56;

alter table TBPRODUTO
alter PRODUTO_NOVO position 57;

alter table TBPRODUTO
alter COR_VEICULO position 58;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 59;

alter table TBPRODUTO
alter TIPO_VEICULO position 60;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 61;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 62;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 63;

alter table TBPRODUTO
alter CHASSI_VEICULO position 64;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 65;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 66;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 67;

alter table TBPRODUTO
alter USUARIO position 68;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 69;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 70;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 71;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 72;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 73;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 74;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 75;

alter table TBPRODUTO
alter CUST_DESP_ADM position 76;

alter table TBPRODUTO
alter CUST_COMISSAO position 77;

alter table TBPRODUTO
alter CUST_IMPOSTO position 78;

alter table TBPRODUTO
alter FI_RET_FINANC position 79;

alter table TBPRODUTO
alter FI_RET_PLANO position 80;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 81;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 82;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 83;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 84;




/*------ SYSDBA 18/09/2017 13:46:55 --------*/

ALTER TABLE TBPRODUTO
    ADD GERAR_SUBPRODUTO DMN_LOGICO DEFAULT 0,
    ADD PRODUTO_PAI DMN_VCHAR_10;

COMMENT ON COLUMN TBPRODUTO.GERAR_SUBPRODUTO IS
'Gerar subproduto:
0 - Nao
1 - Sim';

COMMENT ON COLUMN TBPRODUTO.PRODUTO_PAI IS
'Material/Produto pai (de origem).';

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
alter ANVISA position 8;

alter table TBPRODUTO
alter REFERENCIA position 9;

alter table TBPRODUTO
alter NOME_AMIGO position 10;

alter table TBPRODUTO
alter ESPECIFICACAO position 11;

alter table TBPRODUTO
alter PRECO position 12;

alter table TBPRODUTO
alter PRECO_PROMOCAO position 13;

alter table TBPRODUTO
alter SECAO position 14;

alter table TBPRODUTO
alter QTDE position 15;

alter table TBPRODUTO
alter FRACIONADOR position 16;

alter table TBPRODUTO
alter PESO_BRUTO position 17;

alter table TBPRODUTO
alter PESO_LIQUIDO position 18;

alter table TBPRODUTO
alter LARGURA position 19;

alter table TBPRODUTO
alter ALTURA position 20;

alter table TBPRODUTO
alter ESPESSURA position 21;

alter table TBPRODUTO
alter CUBAGEM position 22;

alter table TBPRODUTO
alter VENDA_FRACIONADA position 23;

alter table TBPRODUTO
alter UNIDADE position 24;

alter table TBPRODUTO
alter ESTOQMIN position 25;

alter table TBPRODUTO
alter CODTIPO position 26;

alter table TBPRODUTO
alter CODGRUPO position 27;

alter table TBPRODUTO
alter CODFABRICANTE position 28;

alter table TBPRODUTO
alter CUSTOMEDIO position 29;

alter table TBPRODUTO
alter PERCENTUAL_MARCKUP position 30;

alter table TBPRODUTO
alter PERCENTUAL_MARGEM position 31;

alter table TBPRODUTO
alter PRECO_SUGERIDO position 32;

alter table TBPRODUTO
alter CODEMP position 33;

alter table TBPRODUTO
alter CODSECAO position 34;

alter table TBPRODUTO
alter CODORIGEM position 35;

alter table TBPRODUTO
alter CODTRIBUTACAO position 36;

alter table TBPRODUTO
alter CST position 37;

alter table TBPRODUTO
alter CSOSN position 38;

alter table TBPRODUTO
alter CST_PIS position 39;

alter table TBPRODUTO
alter CST_COFINS position 40;

alter table TBPRODUTO
alter TABELA_IBPT position 41;

alter table TBPRODUTO
alter NCM_SH position 42;

alter table TBPRODUTO
alter CODIGO_NVE position 43;

alter table TBPRODUTO
alter CODIGO_CEST position 44;

alter table TBPRODUTO
alter CODCFOP position 45;

alter table TBPRODUTO
alter CODBARRA_EAN position 46;

alter table TBPRODUTO
alter CODUNIDADE position 47;

alter table TBPRODUTO
alter CODUNIDADE_FRACIONADA position 48;

alter table TBPRODUTO
alter ALIQUOTA_TIPO position 49;

alter table TBPRODUTO
alter ALIQUOTA position 50;

alter table TBPRODUTO
alter ALIQUOTA_CSOSN position 51;

alter table TBPRODUTO
alter ALIQUOTA_PIS position 52;

alter table TBPRODUTO
alter ALIQUOTA_COFINS position 53;

alter table TBPRODUTO
alter VALOR_IPI position 54;

alter table TBPRODUTO
alter PERCENTUAL_REDUCAO_BC position 55;

alter table TBPRODUTO
alter RESERVA position 56;

alter table TBPRODUTO
alter PRODUTO_NOVO position 57;

alter table TBPRODUTO
alter COR_VEICULO position 58;

alter table TBPRODUTO
alter COMBUSTIVEL_VEICULO position 59;

alter table TBPRODUTO
alter TIPO_VEICULO position 60;

alter table TBPRODUTO
alter ANO_MODELO_VEICULO position 61;

alter table TBPRODUTO
alter ANO_FABRICACAO_VEICULO position 62;

alter table TBPRODUTO
alter RENAVAM_VEICULO position 63;

alter table TBPRODUTO
alter CHASSI_VEICULO position 64;

alter table TBPRODUTO
alter KILOMETRAGEM_VEICULO position 65;

alter table TBPRODUTO
alter SITUACAO_ATUAL_VEICULO position 66;

alter table TBPRODUTO
alter SITUACAO_HISTORICO_VEICULO position 67;

alter table TBPRODUTO
alter USUARIO position 68;

alter table TBPRODUTO
alter CADASTRO_ATIVO position 69;

alter table TBPRODUTO
alter MOVIMENTA_ESTOQUE position 70;

alter table TBPRODUTO
alter COMPOR_FATURAMENTO position 71;

alter table TBPRODUTO
alter PRODUTO_IMOBILIZADO position 72;

alter table TBPRODUTO
alter ESTOQUE_APROP_LOTE position 73;

alter table TBPRODUTO
alter CUST_DESP_OFIC position 74;

alter table TBPRODUTO
alter CUST_DESP_GERAIS position 75;

alter table TBPRODUTO
alter CUST_DESP_ADM position 76;

alter table TBPRODUTO
alter CUST_COMISSAO position 77;

alter table TBPRODUTO
alter CUST_IMPOSTO position 78;

alter table TBPRODUTO
alter FI_RET_FINANC position 79;

alter table TBPRODUTO
alter FI_RET_PLANO position 80;

alter table TBPRODUTO
alter ULTIMA_COMPRA_DATA position 81;

alter table TBPRODUTO
alter ULTIMA_COMPRA_VALOR position 82;

alter table TBPRODUTO
alter ULTIMA_COMPRA_FORNEC position 83;

alter table TBPRODUTO
alter GERAR_SUBPRODUTO position 84;

alter table TBPRODUTO
alter PRODUTO_PAI position 85;

alter table TBPRODUTO
alter ARQUIVO_MORTO position 86;




/*------ SYSDBA 18/09/2017 13:55:11 --------*/

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

    18/09/2017 - IMR :
        + Criacao dos campos LARGURA, ALTURA, ESPESSURA, GERAR_SUBPRODUTO e PRODUTO_PAI
          que serao essenciais no processo de Fracionamento Industrial/Metalurgico
          ocorrido atraves do sistema SGI.

    31/05/2017 - IMR :
        + Criacao do campo CODTIPO com o objeto de classificao o produto de acordo
          com o seu tipo a fim de definir a carga de lotes nos XML''s das NF-e quando
          o produto for do tipo MEDICAMENTOS.

    17/05/2016 - IMR :
        + Criacao do campo CODIGO_CEST com o objetivo de armazenar o Codigo Especificador
          de Substituicao Tributaria que passar ser exijido a partir de 2016 na emissao
          da NF-e e NFC-e.

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




/*------ SYSDBA 18/09/2017 13:56:01 --------*/

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

    18/09/2017 - IMR :
        + Criacao dos campos LARGURA, ALTURA, ESPESSURA, GERAR_SUBPRODUTO e PRODUTO_PAI
          que serao essenciais no processo de Fracionamento Industrial/Metalurgico
          ocorrido atraves do sistema SGI.

    31/05/2017 - IMR :
        + Criacao do campo CODTIPO com o objeto de classificao o produto de acordo
          com o seu tipo a fim de definir a carga de lotes nos XML''s das NF-e quando
          o produto for do tipo MEDICAMENTOS.

    17/05/2016 - IMR :
        + Criacao do campo CODIGO_CEST com o objetivo de armazenar o Codigo Especificador
          de Substituicao Tributaria que passar ser exijido a partir de 2016 na emissao
          da NF-e e NFC-e.

    21/01/2016 - IMR :
        + Criacao do campo ARQUIVO_MORTO com o objetivo de ocultar do sistema os
          registros que nao devem mas ser apresentados para o usuario mas que
          precisam constar na base por efeito de integridade referencial.

    30/07/2015 - IMR :
        + Criacao do campo NOME_AMIGO para facilitar a identificacao interna do produto/servico dentro da empresa
          pelos usuarios do sistema. Esse dados e necessario por existir muitas situacoes onde o nome comercial do
          servico/produto e muito diferente do nome usualmente conhecimento pelos usuarios.

    03/11/2014 - IMR :
        + Criacao do campo METAFONEMA para auxiliar da pesquisa de produtos homonimos e o campo ESPECIFICACAO como
          campo para especificar de maneira textual o produto/servico, muito utilizado em processos de cotacao.

    30/05/2014 - IMR :
        + Criacao do campo COMPOR_FATURAMENTO que ira permitir ao sistema saber quais produtos/servicos haverao de compor
          o faturamento da empresa e quais sao de consumo interno.

    10/02/2014 - IMR :
        + Criacao dos campos CADASTRO_ATIVO e PRODUTO_IMOBILIZADO para permitir que apenas os cadastro ativos sejam
          utilizados nos processos e para designar os produtos que sao imobilizados para futuras implementacoes de
          controles patrimoniais.';




/*------ SYSDBA 18/09/2017 13:57:01 --------*/

CREATE INDEX IDX_TBPRODUTO_PRODPAI
ON TBPRODUTO (PRODUTO_PAI);




/*------ SYSDBA 18/09/2017 16:40:20 --------*/

COMMENT ON COLUMN TBPRODUTO.LARGURA IS
'Dimensao: Largura (m).';




/*------ SYSDBA 18/09/2017 16:40:26 --------*/

COMMENT ON COLUMN TBPRODUTO.ALTURA IS
'Dimensao: Altura (m).';




/*------ SYSDBA 18/09/2017 16:40:30 --------*/

COMMENT ON COLUMN TBPRODUTO.ESPESSURA IS
'Dimensao: Espessura (m).';




/*------ SYSDBA 19/09/2017 23:14:41 --------*/

ALTER TABLE TBESTOQUE_ALMOX
    ADD PESO_BRUTO DMN_MONEY_DESCONTO,
    ADD PESO_LIQUIDO DMN_MONEY_DESCONTO,
    ADD LARGURA DMN_MONEY_DESCONTO_4,
    ADD ALTURA DMN_MONEY_DESCONTO_4,
    ADD ESPESSURA DMN_MONEY_DESCONTO_4,
    ADD CUBAGEM DMN_MONEY_DESCONTO_4;

COMMENT ON COLUMN TBESTOQUE_ALMOX.PESO_BRUTO IS
'Peso bruto';

COMMENT ON COLUMN TBESTOQUE_ALMOX.PESO_LIQUIDO IS
'Peso liquido';

COMMENT ON COLUMN TBESTOQUE_ALMOX.LARGURA IS
'Dimensao - Largura (m)';

COMMENT ON COLUMN TBESTOQUE_ALMOX.ALTURA IS
'Dimensao - Altura (m)';

COMMENT ON COLUMN TBESTOQUE_ALMOX.ESPESSURA IS
'Dimensao - Espessura (m)';

COMMENT ON COLUMN TBESTOQUE_ALMOX.CUBAGEM IS
'Cubagem/Volume (m3)';




/*------ SYSDBA 20/09/2017 13:46:47 --------*/

SET TERM ^ ;

CREATE trigger tg_estoque_almox_volume for tbestoque_almox
active before insert or update position 1
AS
begin
  Select first 1
      coalesce(nullif(new.largura     , 0.0), p.largura)
    , coalesce(nullif(new.altura      , 0.0), p.altura)
    , coalesce(nullif(new.espessura   , 0.0), p.espessura)
    , coalesce(nullif(new.cubagem     , 0.0), p.cubagem)
    , coalesce(nullif(new.peso_bruto  , 0.0), p.peso_bruto)
    , coalesce(nullif(new.peso_liquido, 0.0), p.peso_liquido)
  from TBPRODUTO p
  where p.cod = new.produto
  Into
      new.largura
    , new.altura
    , new.espessura
    , new.cubagem
    , new.peso_bruto
    , new.peso_liquido;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ESTOQUE_ALMOX_VOLUME IS 'Trigger Definir Volume do Item da Entrada.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/09/2017

Trigger responsavel por recuperar os dados de pesagem e dimensoes do cadastro do
material/produto para a entrada.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/09/2017 - IMR :
        * COnstrucao dos objetos relacionados e documentacao.';




/*------ SYSDBA 20/09/2017 13:52:02 --------*/

ALTER TABLE TBCOMPRASITENS
    ADD PESO_BRUTO DMN_MONEY_DESCONTO,
    ADD PESO_LIQUIDO DMN_MONEY_DESCONTO,
    ADD LARGURA DMN_MONEY_DESCONTO_4,
    ADD ALTURA DMN_MONEY_DESCONTO_4,
    ADD ESPESSURA DMN_MONEY_DESCONTO_4,
    ADD CUBAGEM DMN_MONEY_DESCONTO_4;

COMMENT ON COLUMN TBCOMPRASITENS.PESO_BRUTO IS
'Peso bruto.';

COMMENT ON COLUMN TBCOMPRASITENS.PESO_LIQUIDO IS
'Peso liquido.';

COMMENT ON COLUMN TBCOMPRASITENS.LARGURA IS
'Dimensao - Largura (m).';

COMMENT ON COLUMN TBCOMPRASITENS.ALTURA IS
'Dimensao - Altura (m).';

COMMENT ON COLUMN TBCOMPRASITENS.ESPESSURA IS
'Dimensao - Espessura (m).';

COMMENT ON COLUMN TBCOMPRASITENS.CUBAGEM IS
'Cubagem/Volume (m3).';

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
alter PESO_BRUTO position 8;

alter table TBCOMPRASITENS
alter PESO_LIQUIDO position 9;

alter table TBCOMPRASITENS
alter LARGURA position 10;

alter table TBCOMPRASITENS
alter ALTURA position 11;

alter table TBCOMPRASITENS
alter ESPESSURA position 12;

alter table TBCOMPRASITENS
alter CUBAGEM position 13;

alter table TBCOMPRASITENS
alter PRECOUNIT position 14;

alter table TBCOMPRASITENS
alter CUSTOMEDIO position 15;

alter table TBCOMPRASITENS
alter DTENT position 16;

alter table TBCOMPRASITENS
alter NF position 17;

alter table TBCOMPRASITENS
alter QTDEANTES position 18;

alter table TBCOMPRASITENS
alter QTDEFINAL position 19;

alter table TBCOMPRASITENS
alter PERC_PARTICIPACAO position 20;

alter table TBCOMPRASITENS
alter VALOR_FRETE position 21;

alter table TBCOMPRASITENS
alter VALOR_DESCONTO position 22;

alter table TBCOMPRASITENS
alter VALOR_OUTROS position 23;

alter table TBCOMPRASITENS
alter VALOR_IPI position 24;

alter table TBCOMPRASITENS
alter UNID_COD position 25;

alter table TBCOMPRASITENS
alter NCM_SH position 26;

alter table TBCOMPRASITENS
alter CST position 27;

alter table TBCOMPRASITENS
alter CSOSN position 28;

alter table TBCOMPRASITENS
alter CFOP position 29;

alter table TBCOMPRASITENS
alter ALIQUOTA position 30;

alter table TBCOMPRASITENS
alter ALIQUOTA_CSOSN position 31;

alter table TBCOMPRASITENS
alter ALIQUOTA_PIS position 32;

alter table TBCOMPRASITENS
alter ALIQUOTA_COFINS position 33;

alter table TBCOMPRASITENS
alter PERCENTUAL_REDUCAO_BC position 34;

alter table TBCOMPRASITENS
alter TOTAL_BRUTO position 35;

alter table TBCOMPRASITENS
alter TOTAL_LIQUIDO position 36;

alter table TBCOMPRASITENS
alter LOTE_ID position 37;

alter table TBCOMPRASITENS
alter LOTE_DESCRICAO position 38;

alter table TBCOMPRASITENS
alter LOTE_DATA_FAB position 39;

alter table TBCOMPRASITENS
alter LOTE_DATA_VAL position 40;




/*------ SYSDBA 20/09/2017 14:20:22 --------*/

SET TERM ^ ;

CREATE trigger tg_comprasitens_volume for tbcomprasitens
active before insert or update position 0
AS
begin
  Select first 1
      coalesce(nullif(new.largura     , 0.0), p.largura)
    , coalesce(nullif(new.altura      , 0.0), p.altura)
    , coalesce(nullif(new.espessura   , 0.0), p.espessura)
    , coalesce(nullif(new.cubagem     , 0.0), p.cubagem)
    , coalesce(nullif(new.peso_bruto  , 0.0), p.peso_bruto)
    , coalesce(nullif(new.peso_liquido, 0.0), p.peso_liquido)
  from TBPRODUTO p
  where p.cod = new.codprod
  Into
      new.largura
    , new.altura
    , new.espessura
    , new.cubagem
    , new.peso_bruto
    , new.peso_liquido;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_COMPRASITENS_VOLUME IS 'Trigger Definir Volume do Item da Compra.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/09/2017

Trigger responsavel por recuperar os dados de pesagem e dimensoes do cadastro do
material/produto para a compra.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/09/2017 - IMR :
        * COnstrucao dos objetos relacionados e documentacao.';




/*------ SYSDBA 20/09/2017 14:20:45 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_estoque_almox_volume for tbestoque_almox
active before insert or update position 1
AS
begin
  Select first 1
      coalesce(nullif(new.largura     , 0.0), p.largura)
    , coalesce(nullif(new.altura      , 0.0), p.altura)
    , coalesce(nullif(new.espessura   , 0.0), p.espessura)
    , coalesce(nullif(new.cubagem     , 0.0), p.cubagem)
    , coalesce(nullif(new.peso_bruto  , 0.0), p.peso_bruto)
    , coalesce(nullif(new.peso_liquido, 0.0), p.peso_liquido)
  from TBPRODUTO p
  where p.cod = new.produto
  Into
      new.largura
    , new.altura
    , new.espessura
    , new.cubagem
    , new.peso_bruto
    , new.peso_liquido;
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_ESTOQUE_ALMOX_VOLUME IS 'Trigger Definir Volume do Item da Entrada.
    
    Autor   :   Isaque Marinho Ribeiro
    Data    :   20/09/2017

Trigger responsavel por recuperar os dados de pesagem e dimensoes do cadastro do
material/produto para a entrada no estoque do lote.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    20/09/2017 - IMR :
        * COnstrucao dos objetos relacionados e documentacao.';




/*------ SYSDBA 20/09/2017 15:17:59 --------*/

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
    peso_kg,
    total_kg_almox,
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
  , coalesce(pe.estoque_almox, 0)  as estoque_almox
  , p.qtde * p.peso_liquido as peso_kg
  , coalesce(pe.total_kg_almox, 0) as total_kg_almox

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
      , sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) * e.peso_liquido ) as total_kg_almox
      , sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) * e.cubagem )      as total_volume_almox
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




/*------ SYSDBA 20/09/2017 15:19:40 --------*/

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
    peso_kg,
    total_kg_almox,
    volume,
    total_volume_almox,
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
  , coalesce(pe.estoque_almox, 0)  as estoque_almox
  , p.qtde * p.peso_liquido as peso_kg
  , coalesce(pe.total_kg_almox, 0) as total_kg_almox
  , p.qtde * p.cubagem as volume
  , coalesce(pe.total_volume_almox, 0) as total_volume_almox

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
      , sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) * e.peso_liquido ) as total_kg_almox
      , sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) * e.cubagem )      as total_volume_almox
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




/*------ SYSDBA 20/09/2017 15:21:40 --------*/

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
    peso_kg,
    total_kg_almox,
    volume,
    total_volume_almox,
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
  , p.qtde * p.peso_liquido as peso_kg
  , coalesce(pe.total_kg_almox, 0) as total_kg_almox
  , p.qtde * p.cubagem as volume
  , coalesce(pe.total_volume_almox, 0) as total_volume_almox

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
      , sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) * e.peso_liquido ) as total_kg_almox
      , sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) * e.cubagem )      as total_volume_almox
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




/*------ SYSDBA 21/09/2017 16:58:19 --------*/

COMMENT ON COLUMN TBOS.VENDEDOR IS
'Vendedor / Tecnico principal / Responsavel tecnico';



/*------ 21/09/2017 17:01:54 --------*/

CREATE TABLE TBCNAE (
    CODIGO                DMN_VCHAR_10_KEY NOT NULL /* DMN_VCHAR_10_KEY = VARCHAR(10) NOT NULL */,
    DESCRICAO_RESUMIDA    DMN_VCHAR_100 /* DMN_VCHAR_100 = VARCHAR(100) */,
    DESCRICAO_COMPLETA    DMN_VCHAR_250 /* DMN_VCHAR_250 = VARCHAR(250) */,
    NOTA_EXPLICATIVA      DMN_TEXTO /* DMN_TEXTO = BLOB SUB_TYPE 1 SEGMENT SIZE 80 */,
    OBRIGA_INSC_ESTADUAL  DMN_LOGICO DEFAULT 0 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */,
    ATIVA                 DMN_LOGICO DEFAULT 1 /* DMN_LOGICO = SMALLINT DEFAULT 0 NOT NULL CHECK (value between 0 and 1) */
);

/*------ 21/09/2017 17:01:54 --------*/

ALTER TABLE TBCNAE ADD CONSTRAINT PK_TBCNAE PRIMARY KEY (CODIGO);

/*------ 21/09/2017 17:01:54 --------*/

CREATE INDEX IDX_TBCNAE_ATIVA ON TBCNAE (ATIVA);

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON TABLE TBCNAE IS 
'Tabela de CNAE

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/10/2015

Tabela responsavel por armazenar os registros de CNAEs (Codigos Nacionais de Atividades Empresariais) que poderao ser
utilizadas na emissao de ordens de servicos e/ou ordens de producao.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/10/2015 - IMR :
        * Documentacao da tabela.';

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON COLUMN TBCNAE.CODIGO IS 
'Codigo';

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON COLUMN TBCNAE.DESCRICAO_RESUMIDA IS 
'Descricao resumida';

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON COLUMN TBCNAE.DESCRICAO_COMPLETA IS 
'Descricao completa';

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON COLUMN TBCNAE.NOTA_EXPLICATIVA IS 
'Nota Explicativa';

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON COLUMN TBCNAE.OBRIGA_INSC_ESTADUAL IS 
'Inscricao Estadual obrigatoria:
0 - Nao
1 - Sim';

/*------ 21/09/2017 17:01:54 --------*/

COMMENT ON COLUMN TBCNAE.ATIVA IS 
'Ativa:
0 - Nao
1 - Sim';

/*------ 21/09/2017 17:01:54 --------*/

GRANT ALL ON TBCNAE TO PUBLIC;


/*------ SYSDBA 26/09/2017 10:52:54 --------*/

CREATE DOMAIN DMN_VCHAR_150 AS
VARCHAR(150);


/*------ SYSDBA 26/09/2017 10:53:10 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_150'
where (RDB$FIELD_NAME = 'DESCRICAO_RESUMIDA') and
(RDB$RELATION_NAME = 'TBCNAE');




/*------ SYSDBA 26/09/2017 10:59:14 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_250'
where (RDB$FIELD_NAME = 'DESCRICAO_RESUMIDA') and
(RDB$RELATION_NAME = 'TBCNAE')
;




/*------ SYSDBA 27/09/2017 10:37:19 --------*/

COMMENT ON COLUMN TBPRODUTO.CUSTOMEDIO IS
'Custo medio operacional.';




/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODIGO position 1;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column COD position 2;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column DESCRI position 3;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column APRESENTACAO position 4;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column DESCRI_APRESENTACAO position 5;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column METAFONEMA position 6;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column MODELO position 7;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ANVISA position 8;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column REFERENCIA position 9;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column NOME_AMIGO position 10;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ESPECIFICACAO position 11;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column SECAO position 12;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column QTDE position 13;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column FRACIONADOR position 14;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PESO_BRUTO position 15;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PESO_LIQUIDO position 16;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column LARGURA position 17;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ALTURA position 18;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ESPESSURA position 19;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUBAGEM position 20;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column VENDA_FRACIONADA position 21;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column UNIDADE position 22;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ESTOQMIN position 23;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODTIPO position 24;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODGRUPO position 25;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODFABRICANTE position 26;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARCKUP position 27;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_MARGEM position 28;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PRECO_SUGERIDO position 29;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODEMP position 30;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODSECAO position 31;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODORIGEM position 32;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODTRIBUTACAO position 33;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CST position 34;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CSOSN position 35;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CST_PIS position 36;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CST_COFINS position 37;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column TABELA_IBPT position 38;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column NCM_SH position 39;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODIGO_NVE position 40;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODIGO_CEST position 41;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODCFOP position 42;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODBARRA_EAN position 43;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODUNIDADE position 44;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CODUNIDADE_FRACIONADA position 45;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_TIPO position 46;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA position 47;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_CSOSN position 48;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_PIS position 49;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ALIQUOTA_COFINS position 50;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column VALOR_IPI position 51;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PERCENTUAL_REDUCAO_BC position 52;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column RESERVA position 53;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PRODUTO_NOVO position 54;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column COR_VEICULO position 55;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column COMBUSTIVEL_VEICULO position 56;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column TIPO_VEICULO position 57;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ANO_MODELO_VEICULO position 58;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ANO_FABRICACAO_VEICULO position 59;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column RENAVAM_VEICULO position 60;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CHASSI_VEICULO position 61;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column KILOMETRAGEM_VEICULO position 62;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column SITUACAO_ATUAL_VEICULO position 63;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column SITUACAO_HISTORICO_VEICULO position 64;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column USUARIO position 65;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CADASTRO_ATIVO position 66;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column MOVIMENTA_ESTOQUE position 67;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column COMPOR_FATURAMENTO position 68;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PRODUTO_IMOBILIZADO position 69;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ESTOQUE_APROP_LOTE position 70;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PRECO position 71;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PRECO_PROMOCAO position 72;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUSTOMEDIO position 73;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUST_DESP_OFIC position 74;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUST_DESP_GERAIS position 75;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUST_DESP_ADM position 76;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUST_COMISSAO position 77;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column CUST_IMPOSTO position 78;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column FI_RET_FINANC position 79;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column FI_RET_PLANO position 80;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ULTIMA_COMPRA_DATA position 81;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ULTIMA_COMPRA_VALOR position 82;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ULTIMA_COMPRA_FORNEC position 83;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column GERAR_SUBPRODUTO position 84;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column PRODUTO_PAI position 85;


/*------ SYSDBA 27/09/2017 10:39:33 --------*/

alter table TBPRODUTO
alter column ARQUIVO_MORTO position 86;


/*------ SYSDBA 27/09/2017 10:56:05 --------*/

ALTER TABLE TBOS_PRODUTO
    ADD CUSTO DMN_MONEY,
    ADD TOTAL_CUSTO DMN_MONEY;

COMMENT ON COLUMN TBOS_PRODUTO.CUSTO IS
'Valor Unitario de Custo';

COMMENT ON COLUMN TBOS_PRODUTO.TOTAL_CUSTO IS
'Total Custo (Quantidade * Valor de Custo)';

alter table TBOS_PRODUTO
alter ANO position 1;

alter table TBOS_PRODUTO
alter CONTROLE position 2;

alter table TBOS_PRODUTO
alter SEQ position 3;

alter table TBOS_PRODUTO
alter EMPRESA position 4;

alter table TBOS_PRODUTO
alter CLIENTE position 5;

alter table TBOS_PRODUTO
alter PRODUTO position 6;

alter table TBOS_PRODUTO
alter QTDE position 7;

alter table TBOS_PRODUTO
alter UNIDADE position 8;

alter table TBOS_PRODUTO
alter CUSTO position 9;

alter table TBOS_PRODUTO
alter PUNIT position 10;

alter table TBOS_PRODUTO
alter PUNIT_PROMOCAO position 11;

alter table TBOS_PRODUTO
alter DESCONTO position 12;

alter table TBOS_PRODUTO
alter DESCONTO_VALOR position 13;

alter table TBOS_PRODUTO
alter PFINAL position 14;

alter table TBOS_PRODUTO
alter TOTAL_CUSTO position 15;

alter table TBOS_PRODUTO
alter TOTAL_BRUTO position 16;

alter table TBOS_PRODUTO
alter TOTAL_DESCONTO position 17;

alter table TBOS_PRODUTO
alter TOTAL_LIQUIDO position 18;

alter table TBOS_PRODUTO
alter APROVADO position 19;




/*------ SYSDBA 27/09/2017 10:57:07 --------*/

ALTER TABLE TBOS_SERVICO
    ADD CUSTO DMN_MONEY,
    ADD TOTAL_CUSTO DMN_MONEY;

COMMENT ON COLUMN TBOS_SERVICO.CUSTO IS
'Valor Unitario de Custo';

COMMENT ON COLUMN TBOS_SERVICO.TOTAL_CUSTO IS
'Total Custo (Quantidade * Valor de Custo)';

alter table TBOS_SERVICO
alter ANO position 1;

alter table TBOS_SERVICO
alter CONTROLE position 2;

alter table TBOS_SERVICO
alter SEQ position 3;

alter table TBOS_SERVICO
alter EMPRESA position 4;

alter table TBOS_SERVICO
alter CLIENTE position 5;

alter table TBOS_SERVICO
alter SERVICO position 6;

alter table TBOS_SERVICO
alter QTDE position 7;

alter table TBOS_SERVICO
alter UNIDADE position 8;

alter table TBOS_SERVICO
alter CUSTO position 9;

alter table TBOS_SERVICO
alter PUNIT position 10;

alter table TBOS_SERVICO
alter PUNIT_PROMOCAO position 11;

alter table TBOS_SERVICO
alter DESCONTO position 12;

alter table TBOS_SERVICO
alter DESCONTO_VALOR position 13;

alter table TBOS_SERVICO
alter PFINAL position 14;

alter table TBOS_SERVICO
alter TOTAL_CUSTO position 15;

alter table TBOS_SERVICO
alter TOTAL_BRUTO position 16;

alter table TBOS_SERVICO
alter TOTAL_DESCONTO position 17;

alter table TBOS_SERVICO
alter TOTAL_LIQUIDO position 18;

alter table TBOS_SERVICO
alter APROVADO position 19;




/*------ SYSDBA 27/09/2017 10:58:24 --------*/

ALTER TABLE TBOS
    ADD TOTAL_CUSTO DMN_MONEY DEFAULT 0.0;

COMMENT ON COLUMN TBOS.TOTAL_CUSTO IS
'Valor Total de Custo do(s) Servico(s) e Produto(s)';

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
alter DATA_PREVISAO_CONCLUSAO position 7;

alter table TBOS
alter USUARIO position 8;

alter table TBOS
alter VENDEDOR position 9;

alter table TBOS
alter STATUS position 10;

alter table TBOS
alter OBSERVACOES position 11;

alter table TBOS
alter RELATO_SOLICITACAO position 12;

alter table TBOS
alter DADOS_ENTREGA position 13;

alter table TBOS
alter TOTAL_CUSTO position 14;

alter table TBOS
alter TOTAL_SERVICO position 15;

alter table TBOS
alter TOTAL_PRODUTO position 16;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 17;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 18;

alter table TBOS
alter TOTAL_DESCONTOS position 19;

alter table TBOS
alter TOTAL_OS position 20;

alter table TBOS
alter TOTAL_BRUTO position 21;

alter table TBOS
alter TOTAL_LIQUIDO position 22;

alter table TBOS
alter TOTAL_APROVADO_SERVICO position 23;

alter table TBOS
alter TOTAL_APROVADO_PRODUTO position 24;

alter table TBOS
alter DATA_APROVACAO position 25;

alter table TBOS
alter DATA_FINALIZACAO position 26;

alter table TBOS
alter DATA_FATURA position 27;

alter table TBOS
alter COMPETENCIA position 28;

alter table TBOS
alter NFS_LOTE position 29;

alter table TBOS
alter NFS_SERIE position 30;

alter table TBOS
alter NFS_NUMERO position 31;

alter table TBOS
alter NFS_DATAEMISSAO position 32;

alter table TBOS
alter NFS_HORAEMISSAO position 33;

alter table TBOS
alter NFS_CNAE position 34;

alter table TBOS
alter NFS_NCM position 35;

alter table TBOS
alter NFS_DESCRICAO_SERVICO position 36;

alter table TBOS
alter NFS_ENVIADA position 37;

alter table TBOS
alter CAIXA_ANO position 38;

alter table TBOS
alter CAIXA_NUM position 39;

alter table TBOS
alter CANCEL_DATAHORA position 40;

alter table TBOS
alter CANCEL_USUARIO position 41;

alter table TBOS
alter CANCEL_MOTIVO position 42;




/*------ SYSDBA 27/09/2017 11:42:58 --------*/

SET TERM ^ ;

CREATE trigger tg_os_valor_custo for tbos
active before update position 3
AS
  declare variable total_custo_servico DMN_MONEY;
  declare variable total_custo_produto DMN_MONEY;
begin
  Select
    sum(coalesce(s.total_custo, 0.0))
  from TBOS_SERVICO s
  where s.ano      = new.ano
    and s.controle = new.controle
  Into
    total_custo_servico;
    
  Select
    sum(coalesce(p.total_custo, 0.0))
  from TBOS_PRODUTO p
  where p.ano      = new.ano
    and p.controle = new.controle
  Into
    total_custo_produto;
    
  new.total_custo = coalesce(:total_custo_servico, 0.0) + coalesce(:total_custo_produto, 0.0);
end^

SET TERM ; ^




/*------ SYSDBA 27/09/2017 11:47:21 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_valor_custo for tbos
active before update position 3
AS
  declare variable total_custo_servico DMN_MONEY;
  declare variable total_custo_produto DMN_MONEY;
begin
  Select
    sum(coalesce(s.total_custo, 0.0))
  from TBOS_SERVICO s
  where s.ano      = new.ano
    and s.controle = new.controle
  Into
    total_custo_servico;
    
  Select
    sum(coalesce(p.total_custo, 0.0))
  from TBOS_PRODUTO p
  where p.ano      = new.ano
    and p.controle = new.controle
  Into
    total_custo_produto;
    
  new.total_custo = coalesce(:total_custo_servico, 0.0) + coalesce(:total_custo_produto, 0.0);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_OS_VALOR_CUSTO IS 'Trigger Atualizar Total Custo (Controle de OS)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   27/09/2017

Trigger responsavel por totalizar o valor total do custo operacinal de cada ordem
de servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    27/09/2017 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 27/09/2017 11:48:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_os_valor_aprovado for tbos
active before update position 2
AS
  declare variable valor_aprov_servico DMN_MONEY;
  declare variable valor_aprov_produto DMN_MONEY;
begin
  /* Ao aprovar a OS */
  if ( (old.status <> new.status) and (new.status = 4) ) then
  begin 
    Select
      sum(coalesce(s.total_liquido, 0.0))
    from TBOS_SERVICO s
    where s.ano      = new.ano
      and s.controle = new.controle
      and s.aprovado = 1 -- Servico aprovado
    Into
      valor_aprov_servico;

    Select
      sum(coalesce(p.total_liquido, 0.0))
    from TBOS_PRODUTO p
    where p.ano      = new.ano
      and p.controle = new.controle
      and p.aprovado = 1 -- Material/produto aprovado
    Into
      valor_aprov_produto;

    new.total_aprovado_servico = coalesce(:valor_aprov_servico, 0.0);
    new.total_aprovado_produto = coalesce(:valor_aprov_produto, 0.0);
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_OS_VALOR_APROVADO IS 'Trigger Atualizar Total Aprovado (Controle de OS)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   27/09/2017

Trigger responsavel por totalizar o valor total aprovado pelo cliente em cada
ordem de servico.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    27/09/2017 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 07/10/2017 13:17:47 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD RPS_SERIE DMN_VCHAR_05,
    ADD RPS_NUMERO DMN_BIGINT_NN;

COMMENT ON COLUMN TBCONFIGURACAO.RPS_SERIE IS
'RPS: Serie';

COMMENT ON COLUMN TBCONFIGURACAO.RPS_NUMERO IS
'RPS: Numero';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 11;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_VF_CNPJ position 12;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 13;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 14;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 15;

alter table TBCONFIGURACAO
alter VENDA_FORMA_PAGTO_CARTACREDITO position 16;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 18;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 19;

alter table TBCONFIGURACAO
alter USUARIO position 20;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 21;

alter table TBCONFIGURACAO
alter NFE_SERIE position 22;

alter table TBCONFIGURACAO
alter NFE_NUMERO position 23;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 24;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 25;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 26;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 27;

alter table TBCONFIGURACAO
alter NFCE_EMITIR position 28;

alter table TBCONFIGURACAO
alter NFCE_SERIE position 29;

alter table TBCONFIGURACAO
alter NFCE_NUMERO position 30;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 31;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 32;

alter table TBCONFIGURACAO
alter NFSE_EMITIR position 33;

alter table TBCONFIGURACAO
alter RPS_SERIE position 34;

alter table TBCONFIGURACAO
alter RPS_NUMERO position 35;

alter table TBCONFIGURACAO
alter NFSE_SERIE position 36;

alter table TBCONFIGURACAO
alter NFSE_NUMERO position 37;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_PIS position 38;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_COFINS position 39;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_CSLL position 40;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_ISSQN position 41;




/*------ SYSDBA 07/10/2017 13:18:20 --------*/

ALTER TABLE TBCONFIGURACAO ALTER COLUMN RPS_NUMERO
SET DEFAULT 0
;




/*------ SYSDBA 07/10/2017 13:18:37 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BIGINT_N'
where (RDB$FIELD_NAME = 'NFSE_NUMERO') and
(RDB$RELATION_NAME = 'TBCONFIGURACAO')
;




/*------ SYSDBA 07/10/2017 13:18:45 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_BIGINT_N'
where (RDB$FIELD_NAME = 'RPS_NUMERO') and
(RDB$RELATION_NAME = 'TBCONFIGURACAO')
;




/*------ SYSDBA 13/10/2017 10:58:37 --------*/

ALTER TABLE TBOS
    ADD PAGTO_PRAZO DMN_LOGICO DEFAULT 0;

COMMENT ON COLUMN TBOS.PAGTO_PRAZO IS
'Com pagamento a prazo:
0 - Nao
1 - Sim';

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
alter DATA_PREVISAO_CONCLUSAO position 7;

alter table TBOS
alter USUARIO position 8;

alter table TBOS
alter VENDEDOR position 9;

alter table TBOS
alter STATUS position 10;

alter table TBOS
alter OBSERVACOES position 11;

alter table TBOS
alter RELATO_SOLICITACAO position 12;

alter table TBOS
alter DADOS_ENTREGA position 13;

alter table TBOS
alter TOTAL_CUSTO position 14;

alter table TBOS
alter TOTAL_SERVICO position 15;

alter table TBOS
alter TOTAL_PRODUTO position 16;

alter table TBOS
alter TOTAL_DESCONTOS_SERVICOS position 17;

alter table TBOS
alter TOTAL_DESCONTOS_PRODUTOS position 18;

alter table TBOS
alter TOTAL_DESCONTOS position 19;

alter table TBOS
alter TOTAL_OS position 20;

alter table TBOS
alter TOTAL_BRUTO position 21;

alter table TBOS
alter TOTAL_LIQUIDO position 22;

alter table TBOS
alter TOTAL_APROVADO_SERVICO position 23;

alter table TBOS
alter TOTAL_APROVADO_PRODUTO position 24;

alter table TBOS
alter DATA_APROVACAO position 25;

alter table TBOS
alter DATA_FINALIZACAO position 26;

alter table TBOS
alter DATA_FATURA position 27;

alter table TBOS
alter PAGTO_PRAZO position 28;

alter table TBOS
alter COMPETENCIA position 29;

alter table TBOS
alter NFS_LOTE position 30;

alter table TBOS
alter NFS_SERIE position 31;

alter table TBOS
alter NFS_NUMERO position 32;

alter table TBOS
alter NFS_DATAEMISSAO position 33;

alter table TBOS
alter NFS_HORAEMISSAO position 34;

alter table TBOS
alter NFS_CNAE position 35;

alter table TBOS
alter NFS_NCM position 36;

alter table TBOS
alter NFS_DESCRICAO_SERVICO position 37;

alter table TBOS
alter NFS_ENVIADA position 38;

alter table TBOS
alter CAIXA_ANO position 39;

alter table TBOS
alter CAIXA_NUM position 40;

alter table TBOS
alter CANCEL_DATAHORA position 41;

alter table TBOS
alter CANCEL_USUARIO position 42;

alter table TBOS
alter CANCEL_MOTIVO position 43;




/*------ SYSDBA 13/10/2017 11:13:56 --------*/

COMMENT ON COLUMN TBOS.STATUS IS
'Status:
0 - Editando
1 - Aberta
2 - Avaliacao   (Em avaliacao pelo tecnico)
3 - Parecer     (Parecer lancado pelo tecnico)
4 - Aprovada    (Aprovacao dada pelo cliente)
5 - Atendimento (Em atendimento pelo tecnico)
6 - Finalizada  (Finalizado o servico pelo tecnico)
7 - Faturada    (Faturada pelo financeiro para que os Titulos A Receber possam ser gerados)
8 - NFS
9 - Cancelada';




/*------ SYSDBA 24/10/2017 16:37:43 --------*/

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




/*------ SYSDBA 24/10/2017 16:46:03 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_contrec_quitar for tbcontrec_baixa
active after insert or update position 1
AS
  declare variable forma_pagto varchar(30);
  declare variable total_pago  DMN_MONEY;
  declare variable valor_pagar DMN_MONEY;
  declare variable Valor_saldo DMN_MONEY;
  declare variable valor_multa DMN_MONEY;
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

  Valor_saldo = :Valor_pagar - :Total_pago;
  if ( :Valor_saldo < 0.0 ) then
    Valor_saldo = 0.0;

  -- Sinalizar a Quitacao ou Nao da Despesa
  if ( :Total_pago >= :Valor_pagar ) then
    Quitado = 1;
  else
    Quitado = 0;

  -- Informar valores de pagamentos parciais
  if ( :Quitado = 0 ) then
  begin

    Update TBCONTREC r Set
        r.Historic = coalesce(r.Historic, '') || ' --> HISTORICO DA BAIXA : ' || new.Historico
      , r.Valorsaldo  = :Valor_saldo
      , r.Valorrectot = :Total_pago
    where r.Anolanc = new.Anolanc
      and r.Numlanc = new.Numlanc;

  end
    
  -- Quitar divida caso o Total Pago seja maior ou igual ao Total da divida
  else

  if ( :Quitado = 1 ) then
  begin
    valor_multa = :Total_pago - :Valor_pagar;

    if ( :valor_multa < 0 ) then
      valor_multa = 0.0;

    Update TBCONTREC r Set
        r.baixado  = 1
      , r.Historic = coalesce(r.Historic, '') || ' --> HISTORICO DA BAIXA : ' || new.Historico
      , r.Dtrec    = new.Data_pagto
      , r.Docbaix  = new.Documento_baixa
      , r.Tippag   = :Forma_pagto
      , r.valormulta  = :Valor_multa
      , r.Codbanco    = new.Banco
      , r.Valorsaldo  = :Valor_saldo
      , r.Valorrectot = :Total_pago
    where r.Anolanc = new.Anolanc
      and r.Numlanc = new.Numlanc;
  end
end^

SET TERM ; ^




/*------ SYSDBA 24/10/2017 16:46:13 --------*/

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
  if ( :Valor_saldo < 0.0 ) then
    Valor_saldo = 0.0;

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




/*------ SYSDBA 21/11/2017 11:25:57 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_CARTA_CORRECAO DMN_BIGINT_N DEFAULT 0;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_CARTA_CORRECAO IS
'NF-e: Numero da ultima carta de correcao eletronica emitida.';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 11;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_VF_CNPJ position 12;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 13;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 14;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 15;

alter table TBCONFIGURACAO
alter VENDA_FORMA_PAGTO_CARTACREDITO position 16;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 18;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 19;

alter table TBCONFIGURACAO
alter USUARIO position 20;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 21;

alter table TBCONFIGURACAO
alter NFE_SERIE position 22;

alter table TBCONFIGURACAO
alter NFE_NUMERO position 23;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 24;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 25;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 26;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 27;

alter table TBCONFIGURACAO
alter NFE_CARTA_CORRECAO position 28;

alter table TBCONFIGURACAO
alter NFCE_EMITIR position 29;

alter table TBCONFIGURACAO
alter NFCE_SERIE position 30;

alter table TBCONFIGURACAO
alter NFCE_NUMERO position 31;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 32;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 33;

alter table TBCONFIGURACAO
alter NFSE_EMITIR position 34;

alter table TBCONFIGURACAO
alter RPS_SERIE position 35;

alter table TBCONFIGURACAO
alter RPS_NUMERO position 36;

alter table TBCONFIGURACAO
alter NFSE_SERIE position 37;

alter table TBCONFIGURACAO
alter NFSE_NUMERO position 38;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_PIS position 39;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_COFINS position 40;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_CSLL position 41;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_ISSQN position 42;




/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMPRESA position 1;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONTA position 2;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SENHA position 3;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_POP position 4;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP position 5;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_SMTP_PORTA position 6;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_REQUER_AUTENTICACAO position 7;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_CONEXAO_SSL position 8;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_ASSUNTO_PADRAO position 9;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column EMAIL_MENSAGEM_PADRAO position 10;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_DUPLICAR_CNPJ position 11;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column CLIENTE_PERMITIR_VF_CNPJ position 12;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column CUSTO_OPER_CALCULAR position 13;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column PERMITIR_VENDA_ESTOQUE_INS position 14;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column VENDA_CARREGA_PRODUTO_EAN position 15;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column VENDA_FORMA_PAGTO_CARTACREDITO position 16;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_UNICO_EMPRESAS position 17;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column ESTOQUE_SATELITE_CLIENTE position 18;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column AUTORIZA_INFORMA_CLIENTE position 19;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column USUARIO position 20;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_EMITIR position 21;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_SERIE position 22;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_NUMERO position 23;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_CARTA_CORRECAO position 24;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_EMITIR_ENTRADA position 25;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_ACEITAR_NOTA_DENEGADA position 26;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_SOLICITA_DH_SAIDA position 27;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFE_IMPRIMIR_COD_CLIENTE position 28;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFCE_EMITIR position 29;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFCE_SERIE position 30;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFCE_NUMERO position 31;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFCE_TOKEN_ID position 32;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFCE_TOKEN position 33;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_EMITIR position 34;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column RPS_SERIE position 35;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column RPS_NUMERO position 36;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_SERIE position 37;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_NUMERO position 38;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_PIS position 39;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_COFINS position 40;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_CSLL position 41;


/*------ SYSDBA 21/11/2017 11:26:10 --------*/

alter table TBCONFIGURACAO
alter column NFSE_PERCENTUAL_ISSQN position 42;


/*------ SYSDBA 21/11/2017 11:49:38 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_LOTE DMN_BIGINT_N;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_LOTE IS
'NF-e: Numero da ultimo lote enviado.';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 11;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_VF_CNPJ position 12;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 13;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 14;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 15;

alter table TBCONFIGURACAO
alter VENDA_FORMA_PAGTO_CARTACREDITO position 16;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 18;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 19;

alter table TBCONFIGURACAO
alter USUARIO position 20;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 21;

alter table TBCONFIGURACAO
alter NFE_SERIE position 22;

alter table TBCONFIGURACAO
alter NFE_NUMERO position 23;

alter table TBCONFIGURACAO
alter NFE_LOTE position 24;

alter table TBCONFIGURACAO
alter NFE_CARTA_CORRECAO position 25;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 26;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 27;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 28;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 29;

alter table TBCONFIGURACAO
alter NFCE_EMITIR position 30;

alter table TBCONFIGURACAO
alter NFCE_SERIE position 31;

alter table TBCONFIGURACAO
alter NFCE_NUMERO position 32;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 33;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 34;

alter table TBCONFIGURACAO
alter NFSE_EMITIR position 35;

alter table TBCONFIGURACAO
alter RPS_SERIE position 36;

alter table TBCONFIGURACAO
alter RPS_NUMERO position 37;

alter table TBCONFIGURACAO
alter NFSE_SERIE position 38;

alter table TBCONFIGURACAO
alter NFSE_NUMERO position 39;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_PIS position 40;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_COFINS position 41;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_CSLL position 42;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_ISSQN position 43;




/*------ SYSDBA 28/11/2017 09:54:35 --------*/

CREATE DOMAIN DMN_INTEIRO_LONGO_N AS
BIGINT;CREATE DOMAIN DMN_INTEIRO_LONGO_NN AS
BIGINT
DEFAULT 0
NOT NULL;


/*------ SYSDBA 28/11/2017 09:55:28 --------*/

ALTER TABLE TBVENDAS
    ADD INDEX_VALOR DMN_INTEIRO_LONGO_N;

COMMENT ON COLUMN TBVENDAS.INDEX_VALOR IS
'Campo indexado para busca de revistro pelo valor da venda.';

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
alter INDEX_VALOR position 14;

alter table TBVENDAS
alter DTFINALIZACAO_VENDA position 15;

alter table TBVENDAS
alter OBS position 16;

alter table TBVENDAS
alter DADOS_ENTREGA position 17;

alter table TBVENDAS
alter FORMAPAG position 18;

alter table TBVENDAS
alter FATDIAS position 19;

alter table TBVENDAS
alter SERIE position 20;

alter table TBVENDAS
alter NFE position 21;

alter table TBVENDAS
alter MODELO_NF position 22;

alter table TBVENDAS
alter DATAEMISSAO position 23;

alter table TBVENDAS
alter HORAEMISSAO position 24;

alter table TBVENDAS
alter CFOP position 25;

alter table TBVENDAS
alter VERIFICADOR_NFE position 26;

alter table TBVENDAS
alter XML_NFE position 27;

alter table TBVENDAS
alter XML_NFE_FILENAME position 28;

alter table TBVENDAS
alter VENDEDOR_COD position 29;

alter table TBVENDAS
alter USUARIO position 30;

alter table TBVENDAS
alter FORMAPAGTO_COD position 31;

alter table TBVENDAS
alter CONDICAOPAGTO_COD position 32;

alter table TBVENDAS
alter VENDA_PRAZO position 33;

alter table TBVENDAS
alter PRAZO_01 position 34;

alter table TBVENDAS
alter PRAZO_02 position 35;

alter table TBVENDAS
alter PRAZO_03 position 36;

alter table TBVENDAS
alter PRAZO_04 position 37;

alter table TBVENDAS
alter PRAZO_05 position 38;

alter table TBVENDAS
alter PRAZO_06 position 39;

alter table TBVENDAS
alter PRAZO_07 position 40;

alter table TBVENDAS
alter PRAZO_08 position 41;

alter table TBVENDAS
alter PRAZO_09 position 42;

alter table TBVENDAS
alter PRAZO_10 position 43;

alter table TBVENDAS
alter PRAZO_11 position 44;

alter table TBVENDAS
alter PRAZO_12 position 45;

alter table TBVENDAS
alter LOTE_NFE_ANO position 46;

alter table TBVENDAS
alter LOTE_NFE_NUMERO position 47;

alter table TBVENDAS
alter LOTE_NFE_RECIBO position 48;

alter table TBVENDAS
alter NFE_ENVIADA position 49;

alter table TBVENDAS
alter NFE_DENEGADA position 50;

alter table TBVENDAS
alter NFE_DENEGADA_MOTIVO position 51;

alter table TBVENDAS
alter CANCEL_USUARIO position 52;

alter table TBVENDAS
alter CANCEL_DATAHORA position 53;

alter table TBVENDAS
alter CANCEL_MOTIVO position 54;

alter table TBVENDAS
alter NFE_MODALIDADE_FRETE position 55;

alter table TBVENDAS
alter NFE_TRANSPORTADORA position 56;

alter table TBVENDAS
alter NFE_PLACA_VEICULO position 57;

alter table TBVENDAS
alter NFE_PLACA_UF position 58;

alter table TBVENDAS
alter NFE_PLACA_RNTC position 59;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS position 60;

alter table TBVENDAS
alter NFE_VALOR_ICMS position 61;

alter table TBVENDAS
alter NFE_VALOR_BASE_ICMS_SUBST position 62;

alter table TBVENDAS
alter NFE_VALOR_ICMS_SUBST position 63;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_PRODUTO position 64;

alter table TBVENDAS
alter NFE_VALOR_FRETE position 65;

alter table TBVENDAS
alter NFE_VALOR_SEGURO position 66;

alter table TBVENDAS
alter NFE_VALOR_DESCONTO position 67;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_II position 68;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_IPI position 69;

alter table TBVENDAS
alter NFE_VALOR_PIS position 70;

alter table TBVENDAS
alter NFE_VALOR_COFINS position 71;

alter table TBVENDAS
alter NFE_VALOR_OUTROS position 72;

alter table TBVENDAS
alter NFE_VALOR_TOTAL_NOTA position 73;

alter table TBVENDAS
alter CUSTO_OPER_PERCENTUAL position 74;

alter table TBVENDAS
alter CUSTO_OPER_FRETE position 75;

alter table TBVENDAS
alter CUSTO_OPER_OUTROS position 76;

alter table TBVENDAS
alter GERAR_ESTOQUE_CLIENTE position 77;

alter table TBVENDAS
alter CAIXA_ANO position 78;

alter table TBVENDAS
alter CAIXA_NUM position 79;

alter table TBVENDAS
alter CAIXA_PDV position 80;

alter table TBVENDAS
alter DNFE_COMPRA_ANO position 81;

alter table TBVENDAS
alter DNFE_COMPRA_COD position 82;

alter table TBVENDAS
alter DNFE_FORMA position 83;

alter table TBVENDAS
alter DNFE_UF position 84;

alter table TBVENDAS
alter DNFE_CNPJ_CPF position 85;

alter table TBVENDAS
alter DNFE_IE position 86;

alter table TBVENDAS
alter DNFE_COMPETENCIA position 87;

alter table TBVENDAS
alter DNFE_SERIE position 88;

alter table TBVENDAS
alter DNFE_NUMERO position 89;

alter table TBVENDAS
alter DNFE_MODELO position 90;

alter table TBVENDAS
alter DNFE_CHAVE position 91;

alter table TBVENDAS
alter DECF_MODELO position 92;

alter table TBVENDAS
alter DECF_NUMERO position 93;

alter table TBVENDAS
alter DECF_COO position 94;




/*------ SYSDBA 28/11/2017 09:56:10 --------*/

CREATE INDEX IDX_VENDAS_VALOR
ON TBVENDAS (INDEX_VALOR);




/*------ SYSDBA 28/11/2017 09:58:24 --------*/

SET TERM ^ ;

CREATE trigger tg_vendas_indexvalor for tbvendas
active before insert or update position 10
AS
begin
  new.index_valor = cast((new.totalvenda * 100) as bigint);
end^

SET TERM ; ^




/*------ SYSDBA 28/11/2017 10:03:17 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_indexvalor for tbvendas
active before insert or update position 10
AS
begin
  new.index_valor = cast((new.totalvenda * 100) as bigint);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_VENDAS_INDEXVALOR IS 'Trigger Calcular Valor Indexado (Venda)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   28/11/2017

Trigger responsavel por calcular o valor indexido para a busca do registro de
venda.';




/*------ SYSDBA 28/11/2017 10:04:41 --------*/

ALTER TABLE TBCOMPRAS
    ADD INDEX_VALOR DMN_INTEIRO_LONGO_N;

COMMENT ON COLUMN TBCOMPRAS.INDEX_VALOR IS
'Campo indexado para busca de revistro pelo valor da compra (entrada).';

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
alter MODELO_NF position 10;

alter table TBCOMPRAS
alter LOTE_NFE_ANO position 11;

alter table TBCOMPRAS
alter LOTE_NFE_NUMERO position 12;

alter table TBCOMPRAS
alter LOTE_NFE_RECIBO position 13;

alter table TBCOMPRAS
alter NFE_ENVIADA position 14;

alter table TBCOMPRAS
alter NFE_DENEGADA position 15;

alter table TBCOMPRAS
alter NFE_DENEGADA_MOTIVO position 16;

alter table TBCOMPRAS
alter VERIFICADOR_NFE position 17;

alter table TBCOMPRAS
alter XML_NFE position 18;

alter table TBCOMPRAS
alter XML_NFE_FILENAME position 19;

alter table TBCOMPRAS
alter DTLANCAMENTO position 20;

alter table TBCOMPRAS
alter DTEMISS position 21;

alter table TBCOMPRAS
alter HREMISS position 22;

alter table TBCOMPRAS
alter DTENT position 23;

alter table TBCOMPRAS
alter NFCFOP position 24;

alter table TBCOMPRAS
alter NATUREZA position 25;

alter table TBCOMPRAS
alter STATUS position 26;

alter table TBCOMPRAS
alter CALCULAR_TOTAIS position 27;

alter table TBCOMPRAS
alter IPI position 28;

alter table TBCOMPRAS
alter ICMSBASE position 29;

alter table TBCOMPRAS
alter ICMSVALOR position 30;

alter table TBCOMPRAS
alter ICMSSUBSTBASE position 31;

alter table TBCOMPRAS
alter ICMSSUBSTVALOR position 32;

alter table TBCOMPRAS
alter FRETE position 33;

alter table TBCOMPRAS
alter OUTROSCUSTOS position 34;

alter table TBCOMPRAS
alter DESCONTO position 35;

alter table TBCOMPRAS
alter VALORSEGURO position 36;

alter table TBCOMPRAS
alter VALORTOTAL_II position 37;

alter table TBCOMPRAS
alter VALORTOTAL_IPI position 38;

alter table TBCOMPRAS
alter VALORPIS position 39;

alter table TBCOMPRAS
alter VALORCOFINS position 40;

alter table TBCOMPRAS
alter TOTALPROD position 41;

alter table TBCOMPRAS
alter TOTALNF position 42;

alter table TBCOMPRAS
alter INDEX_VALOR position 43;

alter table TBCOMPRAS
alter OBS position 44;

alter table TBCOMPRAS
alter USUARIO position 45;

alter table TBCOMPRAS
alter FORMAPAGTO_COD position 46;

alter table TBCOMPRAS
alter CONDICAOPAGTO_COD position 47;

alter table TBCOMPRAS
alter COMPRA_PRAZO position 48;

alter table TBCOMPRAS
alter PRAZO_01 position 49;

alter table TBCOMPRAS
alter PRAZO_02 position 50;

alter table TBCOMPRAS
alter PRAZO_03 position 51;

alter table TBCOMPRAS
alter PRAZO_04 position 52;

alter table TBCOMPRAS
alter PRAZO_05 position 53;

alter table TBCOMPRAS
alter PRAZO_06 position 54;

alter table TBCOMPRAS
alter PRAZO_07 position 55;

alter table TBCOMPRAS
alter PRAZO_08 position 56;

alter table TBCOMPRAS
alter PRAZO_09 position 57;

alter table TBCOMPRAS
alter PRAZO_10 position 58;

alter table TBCOMPRAS
alter PRAZO_11 position 59;

alter table TBCOMPRAS
alter PRAZO_12 position 60;

alter table TBCOMPRAS
alter DTFINALIZACAO_COMPRA position 61;

alter table TBCOMPRAS
alter TIPO_DESPESA position 62;

alter table TBCOMPRAS
alter CANCEL_USUARIO position 63;

alter table TBCOMPRAS
alter CANCEL_DATAHORA position 64;

alter table TBCOMPRAS
alter CANCEL_MOTIVO position 65;

alter table TBCOMPRAS
alter AUTORIZACAO_ANO position 66;

alter table TBCOMPRAS
alter AUTORIZACAO_CODIGO position 67;

alter table TBCOMPRAS
alter AUTORIZACAO_EMPRESA position 68;

alter table TBCOMPRAS
alter DNFE_ENTRADA_ANO position 69;

alter table TBCOMPRAS
alter DNFE_ENTRADA_COD position 70;

alter table TBCOMPRAS
alter DNFE_SAIDA_ANO position 71;

alter table TBCOMPRAS
alter DNFE_SAIDA_COD position 72;

alter table TBCOMPRAS
alter DNFE_FORMA position 73;

alter table TBCOMPRAS
alter DNFE_UF position 74;

alter table TBCOMPRAS
alter DNFE_CNPJ_CPF position 75;

alter table TBCOMPRAS
alter DNFE_IE position 76;

alter table TBCOMPRAS
alter DNFE_COMPETENCIA position 77;

alter table TBCOMPRAS
alter DNFE_SERIE position 78;

alter table TBCOMPRAS
alter DNFE_NUMERO position 79;

alter table TBCOMPRAS
alter DNFE_MODELO position 80;

alter table TBCOMPRAS
alter DNFE_CHAVE position 81;

alter table TBCOMPRAS
alter DECF_MODELO position 82;

alter table TBCOMPRAS
alter DECF_NUMERO position 83;

alter table TBCOMPRAS
alter DECF_COO position 84;




/*------ SYSDBA 28/11/2017 10:05:24 --------*/

CREATE INDEX IDX_COMPRAS_VALOR
ON TBCOMPRAS (INDEX_VALOR);




/*------ SYSDBA 28/11/2017 10:06:57 --------*/

SET TERM ^ ;

CREATE trigger tg_compras_indexvalor for tbcompras
active before insert or update position 10
AS
begin
  new.index_valor = cast((new.totalnf * 100) as bigint);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_COMPRAS_INDEXVALOR IS 'Trigger Calcular Valor Indexado (Compra)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   28/11/2017

Trigger responsavel por calcular o valor indexido para a busca do registro de
compra (movimento de entrada).';




/*------ SYSDBA 28/11/2017 10:10:50 --------*/

COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/11/2017 - IMR:
        + Cricao do campo INDEX_VALOR para armazenar o valor da venda de forma indexada
          a fim de proporcionar um meio de busca dos registros pelo valor liquido da venda.

    20/08/2014 - IMR:
        + Criacao do campo DESCONTO_CUPOM para armazenar o valor de desconto concedido no PDV (Novo sistema em
          desenvolvimento).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    24/02/2015 - IMR:
        + Criacao dos campos CAIXA_ANO, CAIXA_NUM e CAIXA_PDV para facilitar a identificacao de vendas realizadas, mas
          que ainda nao geraram movimentacao de caixa, nos caixas do usuarios.';




/*------ SYSDBA 28/11/2017 10:11:08 --------*/

COMMENT ON TABLE TBCOMPRAS IS 'Tabela Entrada (Compras)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de movimento de entrada no estoque.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    28/11/2017 - IMR:
        + Cricao do campo INDEX_VALOR para armazenar o valor da compra de forma indexada
          a fim de proporcionar um meio de busca dos registros pelo valor liquido da compra.

    20/05/2014 - IMR :
        + Criacao do campo TIPO_DESPESA para permitir que os registros de Contas A Pagar ja possam ser gerados com o
          devido Tipo de Despesa informado. Este campo passa a ser obrigatorio para uma melhor classificacao das Contas
          A Pagar.

    29/05/2014 - IMR:
        + Criacao dos campos TIPO_ENTRADA e TIPO_DOCUMENTO para que os movimentos de entrada possam ser classificados quanto
          a sua finalidade (Consumo, Producao/Faturamento, Imobilizado, ETC.) e ao tipo de documento usado para efeturar
          essa entrada (Cupom, NF, ETC.).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    30/07/2015 - IMR:
        + Criacao do campo CALCULAR_TOTAIS para que o sistema possa, atraves dele, calcular de forma automatica os valores
          totais que compoem o registro de entrada de Produtos e/ou Servicos.';

