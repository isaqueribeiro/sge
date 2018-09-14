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
  , vl_previsto      DMN_MONEY
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
      , coalesce(pv.grupo, 'S') as grupo
      , coalesce(pv.grupo_valores, 'SALDO') as grupo_valores
      , coalesce(pv.classificacao, -1) as classificacao
      , coalesce(pv.descricao, 'Saldo inicial') as descricao
      , pv.vl_previsto
    from GET_PERIODO_MENSAL(:data_base) dt
      left join (

        Select
            'C'        as grupo
          , 'ENTRADAS' as grupo_valores
          , coalesce(tp.classificacao, 0) as classificacao
          , coalesce(cr.tpe_descricao, 'Sem classificação') as descricao
          , extract(week from rb.dtvenc) as nr_semana
          , rb.dtvenc        as dt_dia
          , sum(rb.valorrec) as vl_previsto
          , null             as vl_realizado
        from TBCONTREC rb
          left join TBTPRECEITA tp on (tp.cod = rb.codtprec)
          left join VW_CLASSIFICAO_RECEITA cr on (cr.tpe_codigo = tp.classificacao)
        where rb.empresa  = :empresa
          and rb.situacao = 1
        group by
            coalesce(tp.classificacao, 0)
          , coalesce(cr.tpe_descricao, 'Sem classificação')
          , extract(week from rb.dtvenc)
          , rb.dtvenc
        
        union
        
        Select
            'D'      as grupo
          , 'SAIDAS' as grupo_valores
          , coalesce(tp.classificacao, 0) as classificacao
          , coalesce(cd.tpe_descricao, 'Sem classificação') as descricao
          , extract(week from pg.dtvenc) as nr_semana
          , pg.dtvenc        as dt_dia
          , sum(pg.valorpag) as vl_previsto
          , null             as vl_realizado
        from TBCONTPAG pg
          left join TBTPRECEITA tp on (tp.cod = pg.codtpdesp)
          left join VW_CLASSIFICAO_DESPESA cd on (cd.tpe_codigo = tp.classificacao)
        where pg.empresa  = :empresa
          and pg.situacao = 1
        group by
            coalesce(tp.classificacao, 0)
          , coalesce(cd.tpe_descricao, 'Sem classificação')
          , extract(week from pg.dtvenc)
          , pg.dtvenc

      ) pv on (pv.dt_dia = dt.dt_dia)
    Into
        nr_semana
      , dt_dia
      , cd_grupo
      , ds_grupo
      , cd_classificacao
      , ds_classificacao
      , vl_previsto
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
          , pv.vl_previsto
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
        
            Select
                extract(week from rb.dtvenc) as nr_semana
              , rb.dtvenc        as dt_dia
              , sum(rb.valorrec) as vl_previsto
            from TBCONTREC rb
              left join TBTPRECEITA tp on (tp.cod = rb.codtprec)
            where rb.empresa  = :empresa
              and rb.situacao = 1
              and (:cd_grupo  = 'C')
              and coalesce(tp.classificacao, 0) = :cd_classificacao
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPRECEITA tp on (tp.cod = pg.codtpdesp)
            where pg.empresa  = :empresa
              and pg.situacao = 1
              and (:cd_grupo  = 'D')
              and coalesce(tp.classificacao, 0) = :cd_classificacao
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

        where 1 = 1
        Into
            nr_semana
          , nr_dia
          , dt_dia
          , vl_previsto
    do
    begin

      suspend;

    end 
  end
end

