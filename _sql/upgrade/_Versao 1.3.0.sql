

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

