Select
    *
from (
    Select
        cx.tipo    as grupo
      , 'ENTRADAS' as grupo_valores
      , tr.classificacao
      , coalesce(cr.tpe_descricao, 'Sem classificação') as descricao
      , extract(week from cx.datahora) as nr_semana
      , sum(cx.valor) as vl_realizado
    from TBCAIXA_MOVIMENTO cx
      left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
      left join VW_CLASSIFICAO_RECEITA cr on (cr.tpe_codigo = tr.cod)
    where cx.tipo = 'C'
      and cx.empresa  = '03041377000187'
      and cx.situacao = 1
      and cast(cx.datahora as date) between '2018.08.01' and '2018.09.30'
    
    group by
        cx.tipo
      , tr.classificacao
      , coalesce(cr.tpe_descricao, 'Sem classificação')
      , extract(week from cx.datahora)
    
    union
    
    Select
        cx.tipo  as grupo
      , 'SAIDAS' as grupo_valores
      , td.classificacao
      , coalesce(cd.tpe_descricao, 'Sem classificação') as descricao
      , extract(week from cx.datahora) as nr_semana
      , sum(cx.valor) as vl_realizado
    from TBCAIXA_MOVIMENTO cx
      left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
      left join VW_CLASSIFICAO_DESPESA cd on (cd.tpe_codigo = td.cod)
    where cx.tipo = 'D'
      and cx.empresa  = '03041377000187'
      and cx.situacao = 1
      and cast(cx.datahora as date) between '2018.08.01' and '2018.09.30'
    
    group by
        cx.tipo
      , td.classificacao
      , coalesce(cd.tpe_descricao, 'Sem classificação')
      , extract(week from cx.datahora)
)
order by
    grupo
  , nr_semana

