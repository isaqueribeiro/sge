Select
    p.codigo
  , p.cod
  , p.descri
  , p.apresentacao
  , p.descri_apresentacao
  , uc.unp_descricao as und_compra
  , uc.unp_sigla     as und_compra_sigla
  , p.qtde           as estoque
  , coalesce(ep.estoque_almox, 0) as estoque_almox

  , ex.empresa
  , ex.data
  , ex.tipo
  , ex.quant
  , ex.valor_total

  , Case when ex.tipo = 0 then ex.quant else 0 end as quant_compra
  , Case when ex.tipo = 1 then ex.quant else 0 end as quant_apropriacao
  , Case when ex.tipo = 2 then ex.quant else 0 end as quant_requisicao

  , Case when ex.tipo = 0 then ex.valor_total else 0 end as valor_total_compra
  , Case when ex.tipo = 1 then ex.valor_total else 0 end as valor_total_apropriacao
  , Case when ex.tipo = 2 then ex.valor_total else 0 end as valor_total_requisicao

  , Case when ex.tipo = 1 then ex.valor_total else 0 end -
    Case when ex.tipo = 2 then ex.valor_total else 0 end as valor_total_saldo

  , ep.valor_estoque_almox
from TBEMPRESA e

  inner join (

    /* Compras */
    select
        ci.codemp    as empresa
      , ci.codprod   as produto
      , ci.dtent     as data
      , sum(ci.qtde) as quant
      , sum(ci.total_liquido) as valor_total
      , 0 as tipo
    from TBCOMPRAS c
      inner join TBCOMPRASITENS ci on (c.ano = ci.ano and c.codcontrol = ci.codcontrol and c.codemp = ci.codemp)
    where c.status in (2,4) -- 2. Finalizado / 4. NF-e Emitida
    group by
        ci.codemp
      , ci.codprod
      , ci.dtent

    union

    /* Ajustes de Entradas/Saidas */
    Select
        x.codempresa as empresa
      , x.codprod    as produto
      , cast(x.dtajust as date) as data
      , sum(x.qtdenova)         as quant
      , sum(x.qtdenova * p.customedio) as valor_total
      , 0 as tipo
    from TBAJUSTESTOQ x
      inner join TBPRODUTO p on (p.cod = x.codprod)
    group by
        x.codempresa
      , x.codprod
      , cast(x.dtajust as date)

    union

    /* Apropriações */
    select
        a.empresa
      , ai.produto
      , a.data_apropriacao  as data
      , sum(ai.qtde)        as quant
      , sum(ai.custo_total) as valor_total
      , 1 as tipo
    from TBAPROPRIACAO_ALMOX a
      inner join TBAPROPRIACAO_ALMOX_ITEM ai on (ai.ano = a.ano and ai.controle = a.controle)
    where a.status = 2 -- Encerrada
    group by
        a.empresa
      , ai.produto
      , a.data_apropriacao

    union

    /* Requisições */
    select
        r.empresa
      , ri.produto
      , r.data_emissao as data
      , sum(ri.qtde / ri.fracionador) as quant
      , sum(ri.qtde * lt.custo_medio) as valor_total
      , 2 as tipo
    from TBREQUISICAO_ALMOX r
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
      inner join TBESTOQUE_ALMOX lt on (lt.id = ri.lote_atendimento)
    where r.status = 4 -- Atendida
    group by
        r.empresa
      , ri.produto
      , r.data_emissao

    order by
        1
      , 2
      , 3

  ) ex on (ex.empresa = e.cnpj)

  inner join TBPRODUTO p on (p.cod = ex.produto)

  left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)

  left join (
    Select
        ae.empresa
      , ae.produto
      , sum( ae.qtde / coalesce(nullif(ae.fracionador, 0), 1) ) as estoque_almox
      , sum( ae.qtde * ae.custo_medio ) as valor_estoque_almox
    from TBESTOQUE_ALMOX ae
      inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
    where ae.qtde > 0
    group by
        ae.empresa
      , ae.produto
  ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)

where e.cnpj = '03041377000187'
  and ex.produto = '0000021'

order by
    ex.empresa
  , p.descri_apresentacao
  , p.cod
  , ex.data
  , ex.tipo

