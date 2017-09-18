

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

