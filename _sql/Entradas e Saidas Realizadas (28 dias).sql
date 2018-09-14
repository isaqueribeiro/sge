execute block (
    data_base    DMN_DATE = :data_base
  , empresa      DMN_CNPJ = :empresa       -- 03041377000187
  , conta        DMN_INTEGER_N = :conta
) returns (
    cd_grupo         DMN_VCHAR_01
  , ds_grupo         DMN_VCHAR_30
  , cd_classificacao DMN_SMALLINT_N
  , ds_classificacao DMN_VCHAR_30
  , dt_dia           DMN_DATE
  , nr_dia           DMN_INTEGER_N
  , nr_semana        DMN_INTEGER_N
  , vl_inicial       DMN_MONEY
  , vl_realizado     DMN_MONEY
)
as
  declare variable dt_inicial       DMN_DATE;
  declare variable dt_saldo_inicial DMN_DATE;
  declare variable nr_ordem         DMN_SMALLINT_N;
begin
  Select
    min(dt.dt_dia)
  from GET_PERIODO_MENSAL(:data_base) dt
  Into
    dt_inicial;

  nr_dia    = extract(weekday from :dt_inicial) + 1;
  nr_semana = extract(week from :dt_inicial);

  Select
    max(cs.data_saldo)
  from TBCONTA_CORRENTE cc
    inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
  where cc.empresa    = :empresa
    and cs.data_saldo < :dt_inicial
  into
    dt_saldo_inicial;

  Select
    sum(cs.valor_saldo)
  from TBCONTA_CORRENTE cc
    inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
  where (cc.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
    and (cs.data_saldo = :dt_saldo_inicial)
  into
    vl_inicial;

  cd_grupo  = 'S';
  ds_grupo  = 'SALDO';
  cd_classificacao = -1;
  ds_classificacao = 'Saldo inicial';
  dt_dia    = :dt_saldo_inicial;

  suspend;

  vl_inicial = 0.00;

  /*
  for
    Select
        dt.nr_semana
      , dt.dt_dia
      , coalesce(ra.grupo, 'S') as grupo
      , coalesce(ra.grupo_valores, 'SALDO') as grupo_valores
      , coalesce(ra.classificacao, -1) as classificacao
      , coalesce(ra.descricao, 'Saldo inicial') as descricao
      , ra.vl_realizado
    from GET_PERIODO_MENSAL(:data_base) dt
      left join (

        Select
            cx.tipo    as grupo
          , 'ENTRADAS' as grupo_valores
          , tr.classificacao
          , coalesce(cr.tpe_descricao, 'Sem classificação') as descricao
          , extract(week from cx.datahora) as nr_semana
          , cast(cx.datahora as date)      as dt_dia
          , sum(cx.valor) as vl_realizado
        from TBCAIXA_MOVIMENTO cx
          left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
          left join VW_CLASSIFICAO_RECEITA cr on (cr.tpe_codigo = tr.cod)
        where (cx.tipo     = 'C')
          and (cx.empresa  = :empresa)
          and (cx.situacao = 1)
          and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
          and (cast(cx.datahora as date) > :dt_inicial)

        group by
            cx.tipo
          , tr.classificacao
          , coalesce(cr.tpe_descricao, 'Sem classificação')
          , extract(week from cx.datahora)
          , cast(cx.datahora as date)
        
        union
        
        Select
            cx.tipo  as grupo
          , 'SAIDAS' as grupo_valores
          , td.classificacao
          , coalesce(cd.tpe_descricao, 'Sem classificação') as descricao
          , extract(week from cx.datahora) as nr_semana
          , cast(cx.datahora as date)      as dt_dia
          , sum(cx.valor) as vl_realizado
        from TBCAIXA_MOVIMENTO cx
          left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
          left join VW_CLASSIFICAO_DESPESA cd on (cd.tpe_codigo = td.cod)
        where (cx.tipo     = 'D')
          and (cx.empresa  = :empresa)
          and (cx.situacao = 1)
          and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
          and (cast(cx.datahora as date) > :dt_inicial)

        group by
            cx.tipo
          , td.classificacao
          , coalesce(cd.tpe_descricao, 'Sem classificação')
          , extract(week from cx.datahora)
          , cast(cx.datahora as date)

      ) ra on (ra.dt_dia = dt.dt_dia)
    Into
        nr_semana
      , dt_dia
      , cd_grupo
      , ds_grupo
      , cd_classificacao
      , ds_classificacao
      , vl_realizado
  do
  begin

    suspend;

  end
  */

  for
    Select
        'C'
      , 'ENTRADAS'
      , cr.tpe_codigo
      , cr.tpe_descricao
      , cr.tpe_ordem
    from VW_CLASSIFICAO_RECEITA cr

    union

    Select
        'D'
      , 'SAIDAS'
      , cd.tpe_codigo
      , cd.tpe_descricao
      , cd.tpe_ordem
    from VW_CLASSIFICAO_DESPESA cd

    order by 1, 5

    Into
        cd_grupo
      , ds_grupo
      , cd_classificacao
      , ds_classificacao
      , nr_ordem
  do
  begin
    for
        Select
            dt.nr_semana
          , dt.nr_dia
          , dt.dt_dia
          , ra.vl_realizado
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
    
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
            where (cx.tipo = :cd_grupo and :cd_grupo = 'C')
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)
    
            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
            
            union
            
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
            where (cx.tipo = :cd_grupo and :cd_grupo = 'D')
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)

            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
    
          ) ra on (ra.dt_dia = dt.dt_dia)
        Into
            nr_semana
          , nr_dia
          , dt_dia
          , vl_realizado
    do
    begin

      suspend;

    end 
  end 
end

