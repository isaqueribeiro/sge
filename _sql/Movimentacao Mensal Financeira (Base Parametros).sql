Select
    x.nr_semana
  , min(x.dt_dia) as dt_inicial
  , max(x.dt_dia) as dt_final
from GET_PERIODO_MENSAL(:data_base) x
group by
    x.nr_semana
order by
    x.nr_semana

Select
    cs.cd_grupo
  , cs.ds_grupo
  , cs.cd_classificacao
  , cs.ds_classificacao
  , cs.nr_semana
  , min(cs.dt_dia) as dt_inicial
  , max(cs.dt_dia) as dt_final
  , sum(cs.vl_inicial) as vl_inicial
  , null as vl_previsto
  , null as vl_realizado
from GET_MOV_MENSAL_PREVISTO(:data_base, :empresa, :conta, 'S') cs
group by
    cs.cd_grupo
  , cs.ds_grupo
  , cs.cd_classificacao
  , cs.ds_classificacao
  , cs.nr_semana

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


