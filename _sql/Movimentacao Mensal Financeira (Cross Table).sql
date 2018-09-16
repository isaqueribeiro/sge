WITH MOVIMENTO AS (
    Select
        g.cd_grupo
      , g.ds_grupo
      , g.cd_classificacao
      , g.ds_classificacao
      , g.nr_semana
      , g.dt_inicial
      , g.dt_final
      , g.vl_inicial
      , g.vl_previsto
      , g.vl_realizado
    from GET_MOV_MENSAL(:data_base, :empresa, :conta) g -- 03041377000187
)
SELECT
    a.*
  , m1.nr_semana    as nr_semana_1
  , m2.nr_semana    as nr_semana_2
  , m3.nr_semana    as nr_semana_3
  , m4.nr_semana    as nr_semana_4

  , m1.vl_previsto  as vl_previsto_1
  , m2.vl_previsto  as vl_previsto_2
  , m3.vl_previsto  as vl_previsto_3
  , m4.vl_previsto  as vl_previsto_4
  , coalesce(m1.vl_previsto, 0.00) +
    coalesce(m2.vl_previsto, 0.00) +
    coalesce(m3.vl_previsto, 0.00) +
    coalesce(m4.vl_previsto, 0.00) as vl_previsto

  , m1.vl_realizado as vl_realizado_1
  , m2.vl_realizado as vl_realizado_2
  , m3.vl_realizado as vl_realizado_3
  , m4.vl_realizado as vl_realizado_4
  , coalesce(m1.vl_realizado, 0.00) +
    coalesce(m2.vl_realizado, 0.00) +
    coalesce(m3.vl_realizado, 0.00) +
    coalesce(m4.vl_realizado, 0.00) as vl_realizado
FROM (
  Select
      'C'              as cd_grupo
    , 'ENTRADAS'       as ds_grupo
    , cr.tpe_codigo    as cd_classificacao
    , cr.tpe_descricao as ds_classificacao
    , cr.tpe_ordem     as nr_ordem
  from VW_CLASSIFICAO_RECEITA cr
  union
  Select
      'D'              as cd_grupo
    , 'SAIDAS'         as ds_grupo
    , cd.tpe_codigo    as cd_classificacao
    , cd.tpe_descricao as ds_classificacao
    , cd.tpe_ordem     as nr_ordem
  from VW_CLASSIFICAO_DESPESA cd
) a
  inner join
    MOVIMENTO m1 ON (m1.cd_grupo = a.cd_grupo and m1.cd_classificacao = a.cd_classificacao and m1.nr_semana = 32)
  inner join
    MOVIMENTO m2 ON (m2.cd_grupo = a.cd_grupo and m2.cd_classificacao = a.cd_classificacao and m2.nr_semana = 33)
  inner join
    MOVIMENTO m3 ON (m3.cd_grupo = a.cd_grupo and m3.cd_classificacao = a.cd_classificacao and m3.nr_semana = 34)
  inner join
    MOVIMENTO m4 ON (m4.cd_grupo = a.cd_grupo and m4.cd_classificacao = a.cd_classificacao and m4.nr_semana = 35)

order by
    a.cd_grupo
  , a.cd_classificacao


