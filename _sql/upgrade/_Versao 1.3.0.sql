

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
