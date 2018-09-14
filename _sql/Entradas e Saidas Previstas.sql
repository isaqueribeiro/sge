Select
    *
from (
    Select
        'C'        as grupo
      , 'ENTRADAS' as grupo_valores
      , coalesce(tp.classificacao, 0) as classificacao
      , coalesce(cr.tpe_descricao, 'Sem classificação') as descricao
      , extract(week from rb.dtvenc) as nr_semana
      , sum(rb.valorrec)             as vl_previsto
    from TBCONTREC rb
      left join TBTPRECEITA tp on (tp.cod = rb.codtprec)
      left join VW_CLASSIFICAO_RECEITA cr on (cr.tpe_codigo = tp.classificacao)
    where rb.empresa  = '03041377000187'
      and rb.situacao = 1
      and rb.dtvenc between '2018.08.01' and '2018.09.30'
    group by
        coalesce(tp.classificacao, 0)
      , coalesce(cr.tpe_descricao, 'Sem classificação')
      , extract(week from rb.dtvenc)
    
    union
    
    Select
        'D'      as grupo
      , 'SAIDAS' as grupo_valores
      , coalesce(tp.classificacao, 0) as classificacao
      , coalesce(cd.tpe_descricao, 'Sem classificação') as descricao
      , extract(week from pg.dtvenc) as nr_semana
      , sum(pg.valorpag)             as vl_previsto
    from TBCONTPAG pg
      left join TBTPRECEITA tp on (tp.cod = pg.codtpdesp)
      left join VW_CLASSIFICAO_DESPESA cd on (cd.tpe_codigo = tp.classificacao)
    where pg.empresa  = '03041377000187'
      and pg.situacao = 1
      and pg.dtvenc between '2018.08.01' and '2018.09.30'
    group by
        coalesce(tp.classificacao, 0)
      , coalesce(cd.tpe_descricao, 'Sem classificação')
      , extract(week from pg.dtvenc)
) tmp
order by
    grupo
  , nr_semana

