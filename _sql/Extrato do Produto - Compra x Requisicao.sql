Select
    p.codigo
  , p.cod
  , p.descri
  , p.apresentacao
  , p.descri_apresentacao
  , uc.unp_descricao as und_compra
  , coalesce(nullif(trim(uc.unp_sigla), ''), uc.unp_descricao) as und_compra_sigla
  , p.fracionador
  , uf.unp_descricao as und_fracao
  , coalesce(nullif(trim(uf.unp_sigla), ''), uf.unp_descricao) as und_fracao_sigla
  , coalesce(ep.estoque_almox, 0) as estoque_almox

  , ex.empresa
  , e.rzsoc as empresa_razao
  , ex.data
  , ex.local
  , ex.tipo
  , ex.quant
  , ex.valor_total

  , Case when ex.tipo = 1 then ex.quant else 0 end as quant_compra
  , Case when ex.tipo = 3 then ex.quant else 0 end as quant_apropriacao
  , Case when ex.tipo = 4 then ex.quant else 0 end as quant_requisicao

  , Case when ex.tipo = 1 then ex.quant else 0 end +
    Case when ex.tipo = 2 then ex.quant else 0 end -
    Case when ex.tipo = 4 then ex.quant else 0 end as quant_saldo_almox

  , Case when ex.tipo = 1 then ex.valor_total else 0 end as valor_total_compra
  , Case when ex.tipo = 3 then ex.valor_total else 0 end as valor_total_apropriacao
  , Case when ex.tipo = 4 then ex.valor_total else 0 end as valor_total_requisicao

  , Case when ex.tipo = 1 then ex.valor_total else 0 end +
    Case when ex.tipo = 2 then ex.valor_total else 0 end -
    Case when ex.tipo = 4 then ex.valor_total else 0 end as valor_total_saldo_almox

  , ep.valor_estoque_almox
  , ue.unp_descricao as und_almox
  , coalesce(nullif(trim(ue.unp_sigla), ''), ue.unp_descricao) as und_almox_sigla
from TBEMPRESA e
  inner join (

    /* Compras */
    select
        c.codemp   as empresa
      , ci.codprod as produto
      , c.dtent    as data
      , 'ESTOQUE'  as local
      --, fn.nomeforn as local
      , sum(ci.qtde)        as quant
      , sum(ci.total_liquido) as valor_total
      , 1 as tipo
    from TBCOMPRAS c
      inner join TBCOMPRASITENS ci on (ci.ano = c.ano and ci.codcontrol = c.codcontrol and ci.codemp = c.codemp)
      --left join TBFORNECEDOR fn on (fn.codforn = c.codforn)
    where c.status in (2, 4) -- Finalizada e NF Emitida
      and c.codemp   = :empresa
      and ci.codprod = :produto
    group by
        c.codemp
      , ci.codprod
      , c.dtent
      --, fn.nomeforn

    union

    /* Requisições */
    select
        r.empresa
      , ri.produto
      , r.data_emissao as data
      , cc.descricao   as local
      , sum(ri.qtde / ri.fracionador) as quant
      , sum(ri.total) as valor_total
      , 4 as tipo
    from TBREQUISICAO_ALMOX r
      inner join TBCENTRO_CUSTO cc on (cc.codigo = r.ccusto_origem)
      inner join TBREQUISICAO_ALMOX_ITEM ri on (ri.ano = r.ano and ri.controle = r.controle)
    where r.status   = 4 -- Atendida
      and r.empresa  = :empresa
      and ri.produto = :produto
    group by
        r.empresa
      , ri.produto
      , cc.descricao
      , r.data_emissao

  ) ex on (ex.empresa = e.cnpj)

  inner join TBPRODUTO p on (p.cod = ex.produto)

  /* Estoque Apropriado */
  left join (
    Select
        ae.empresa
      , ae.produto
      , (case when ae.qtde > 0 then ae.fracionador else 0 end) as unidade
      , sum( (ae.qtde / coalesce(nullif(ae.fracionador, 0), 1)) ) as estoque_almox
      , sum( (ae.qtde * ae.custo_medio) ) as valor_estoque_almox
    from TBESTOQUE_ALMOX ae
      inner join TBCENTRO_CUSTO c on (c.codigo = ae.centro_custo and c.codcliente is null)
    where coalesce(ae.qtde, 0) > 0
      and ae.empresa = :empresa
      and ae.produto = :produto
    group by
        ae.empresa
      , ae.produto
      , (case when ae.qtde > 0 then ae.fracionador else 0 end)
  ) ep on (ep.empresa = ex.empresa and ep.produto = ex.produto)

  left join TBUNIDADEPROD uc on (uc.unp_cod = p.codunidade)
  left join TBUNIDADEPROD uf on (uf.unp_cod = p.codunidade_fracionada)
  left join TBUNIDADEPROD ue on (ue.unp_cod = ep.unidade)

where (e.cnpj = :empresa)
  and (ex.produto = :produto)
  and (ex.data between :data_inicial and :data_final)

order by
    ex.empresa
  , p.descri_apresentacao
  , p.cod
  , ex.data
  , ex.tipo
  , ex.local
