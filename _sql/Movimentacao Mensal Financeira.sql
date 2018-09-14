execute block (
    data_base    DMN_DATE = :data_base
  , empresa      DMN_CNPJ = :empresa       -- 03041377000187
  , conta        DMN_INTEGER_N = :conta
) returns (
    cd_grupo         DMN_VCHAR_01
  , ds_grupo         DMN_VCHAR_30
  , cd_classificacao DMN_SMALLINT_N
  , ds_classificacao DMN_VCHAR_30
  , nr_semana        DMN_INTEGER_N
  , vl_inicial       DMN_MONEY
  , vl_previsto      DMN_MONEY
  , vl_realizado     DMN_MONEY
)
as
begin
  for
    Select
        cs.cd_grupo
      , cs.ds_grupo
      , cs.cd_classificacao
      , cs.ds_classificacao
      , cs.nr_semana
      , sum(cs.vl_inicial)
    from GET_MOV_MENSAL_PREVISTO(:data_base, :empresa, :conta) cs
    where (cs.cd_grupo = 'S')
      and (cs.vl_inicial <> 0.00)
    group by
        cs.cd_grupo
      , cs.ds_grupo
      , cs.cd_classificacao
      , cs.ds_classificacao
      , cs.nr_semana
    Into
        cd_grupo
      , ds_grupo
      , cd_classificacao
      , ds_classificacao
      , nr_semana
      , vl_inicial
  do
  begin
    suspend;
  end 

  vl_inicial = null;

  for
    Select
        pv.cd_grupo
      , pv.ds_grupo
      , pv.cd_classificacao
      , pv.ds_classificacao
      , pv.nr_semana
      , sum(pv.vl_previsto)
    from GET_MOV_MENSAL_PREVISTO(:data_base, :empresa, :conta) pv
    where (pv.cd_grupo <> 'S')
    group by
        pv.cd_grupo
      , pv.ds_grupo
      , pv.cd_classificacao
      , pv.ds_classificacao
      , pv.nr_semana
    order by
        pv.nr_semana
      , pv.cd_grupo
      , pv.cd_classificacao
    Into
        cd_grupo
      , ds_grupo
      , cd_classificacao
      , ds_classificacao
      , nr_semana
      , vl_previsto
  do
  begin
    Select
      sum(vl_realizado)
    from GET_MOV_MENSAL_REALIZADO(:data_base, :empresa, :conta) ra
    where ra.cd_grupo = :cd_grupo
      and ra.cd_classificacao = :cd_classificacao
      and ra.nr_semana = :nr_semana
    Into
      vl_realizado;

    suspend;
  end 
end

