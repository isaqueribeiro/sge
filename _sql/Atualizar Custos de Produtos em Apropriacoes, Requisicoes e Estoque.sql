execute block
as
  declare variable empresa type of DMN_CNPJ;
  declare variable produto type of DMN_VCHAR_10;
  declare variable ano type of DMN_SMALLINT_N;
  declare variable quantidade type of DMN_QUANTIDADE_D3_N;
  declare variable custo type of DMN_MONEY;
  declare variable fracionador type of DMN_PERCENTUAL_3;
  declare variable custo_fracinado type of DMN_MONEY_4;
  declare variable controle type of DMN_BIGINT_N;
  declare variable custo_total type of DMN_MONEY;
begin
  for
    Select
        tmp.empresa
      , tmp.produto
      , tmp.ano
      , ci.qtde       as quantidade
      , ci.customedio as custo
      , pd.fracionador
      , ci.customedio / iif(pd.fracionador = 0, 1, pd.fracionador) as custo_fracinado
    from (
      Select
          cp.codemp  as empresa
        , cp.codprod as produto
        , cp.ano
        , max(cp.codcontrol) as controle
      from TBCOMPRASITENS cp
      where (cp.ano > 2020)
      group by
          cp.codemp
        , cp.codprod
        , cp.ano
    ) tmp
      inner join TBCOMPRASITENS ci on (ci.ano = tmp.ano and ci.codcontrol = tmp.controle and ci.codemp = tmp.empresa and ci.codprod = tmp.produto)
      inner join TBPRODUTO pd on (pd.cod = ci.codprod)
    
    order by
        tmp.ano
      , tmp.controle
      , tmp.produto
    Into
        empresa
      , produto
      , ano
      , quantidade
      , custo
      , fracionador
      , custo_fracinado
  do
  begin
    -- Atualizar apropriações gerais de estoque
    Update TBAPROPRIACAO_ALMOX_ITEM ai Set
        ai.custo_unitario = iif(ai.qtde_tipo_lancamento = 0, :custo, :custo_fracinado)
      , ai.custo_total = (ai.qtde * iif(ai.qtde_tipo_lancamento = 0, :custo, :custo_fracinado))
    where (ai.ano = :ano)
      and (ai.controle in (
          Select
            a.controle
          from TBAPROPRIACAO_ALMOX a
          where a.ano = :ano
            and a.tipo = 0
        ))
      and (ai.produto = :produto);

    -- Atualizar custo do produto nas saidas
    Update TBREQUISICAO_ALMOX_ITEM si Set
        si.custo = iif(si.fracionador = 1, :custo, :custo_fracinado)
      , si.total = (si.qtde * iif(si.fracionador = 1, :custo, :custo_fracinado))
    where (si.ano = :ano)
      and (si.produto = :produto);

    -- Atualizar custo do produto no estoque do almoxarifado
    Update TBESTOQUE_ALMOX ea Set
      ea.custo_medio = iif(ea.fracionador = 1, :custo, :custo_fracinado)
    where (ea.empresa = :empresa)
      and (ea.produto = :produto)
      and (ea.qtde != 0);
  end

  -- Atualizar Totais nas Apropriações
  for
    Select
        ai.ano
      , ai.controle
      , cast(sum(ai.custo_total) as DMN_MONEY)
    from TBAPROPRIACAO_ALMOX_ITEM ai
      inner join TBAPROPRIACAO_ALMOX a on (a.ano = ai.ano and a.controle = ai.controle and a.tipo = 0)
    group by
        ai.ano
      , ai.controle
    Into
        ano
      , controle
      , custo_total
  do
  begin
    Update TBAPROPRIACAO_ALMOX a Set
      a.valor_total = :custo_total
    where (a.ano = :ano)
      and (a.controle = :controle);
  end

  -- Atualizar Totais nas Requisições
  for
    Select
        si.ano
      , si.controle
      , cast(sum(si.total) as DMN_MONEY)
    from TBREQUISICAO_ALMOX_ITEM si
      inner join TBREQUISICAO_ALMOX r on (r.ano = si.ano and r.controle = si.controle)
    group by
        si.ano
      , si.controle
    Into
        ano
      , controle
      , custo_total
  do
  begin
    Update TBREQUISICAO_ALMOX r Set
      r.valor_total = :custo_total
    where (r.ano = :ano)
      and (r.controle = :controle);
  end
end
