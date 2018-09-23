


/*------ SYSDBA 12/09/2018 15:46:17 --------*/

SET TERM ^ ;

create or alter procedure GET_PERIODO_MENSAL (
    DT_BASE DMN_DATE)
returns (
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    DT_DIA DMN_DATE)
as
declare variable NR_SEMANA_INICIAL integer;
declare variable NR_SEMANA_FINAL integer;
begin
  Select
      coalesce(:dt_base, current_date)
    , extract(week from coalesce(:dt_base, current_date) - 28) -- 7 dias * 4 semanas
    , extract(week from coalesce(:dt_base, current_date))
  from RDB$DATABASE
  Into
      dt_base
    , nr_semana_inicial
    , nr_semana_final;

  dt_dia = coalesce(:dt_base, current_date) - ((:nr_semana_final - :nr_semana_inicial) * 7);
  nr_dia = extract(weekday from :dt_dia) + 1;

  -- Definir a segunda como o 1o. dia da 1a. semana
  if (:nr_dia = 1) then
    dt_dia = :dt_dia + 1;
  else
  if (:nr_dia > 2) then
    dt_dia = :dt_dia + (7 - extract(weekday from :dt_base)) + 1;

  -- Definir o domingo como o ultimo dia da 4a. semana
  if ((extract(weekday from :dt_base) + 1) <> 1 ) then
    dt_base = :dt_base + (7 - extract(weekday from :dt_base));

  while (:dt_dia <= :dt_base) do
  begin
    nr_dia    = extract(weekday from :dt_dia) + 1;
    nr_semana = extract(week from :dt_dia);
    suspend;
    dt_dia = :dt_dia + 1;
  end
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_PERIODO_MENSAL.DT_BASE IS
'Data base';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.NR_DIA IS
'Dia da semana';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.NR_SEMANA IS
'Numero da semana';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.DT_DIA IS
'Periodo mensal';

GRANT EXECUTE ON PROCEDURE GET_PERIODO_MENSAL TO "PUBLIC";



/*------ SYSDBA 12/09/2018 15:48:14 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_PERIODO_MENSAL (
    DT_BASE DMN_DATE)
returns (
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    DT_DIA DMN_DATE)
as
declare variable NR_SEMANA_INICIAL integer;
declare variable NR_SEMANA_FINAL integer;
begin
  Select
      coalesce(:dt_base, current_date)
    , extract(week from coalesce(:dt_base, current_date) - 28) -- 7 dias * 4 semanas
    , extract(week from coalesce(:dt_base, current_date))
  from RDB$DATABASE
  Into
      dt_base
    , nr_semana_inicial
    , nr_semana_final;

  dt_dia = coalesce(:dt_base, current_date) - ((:nr_semana_final - :nr_semana_inicial) * 7);
  nr_dia = extract(weekday from :dt_dia) + 1;

  -- Definir a segunda como o 1o. dia da 1a. semana
  if (:nr_dia = 1) then
    dt_dia = :dt_dia + 1;
  else
  if (:nr_dia > 2) then
    dt_dia = :dt_dia + (7 - extract(weekday from :dt_base)) + 1;

  -- Definir o domingo como o ultimo dia da 4a. semana
  if ((extract(weekday from :dt_base) + 1) <> 1 ) then
    dt_base = :dt_base + (7 - extract(weekday from :dt_base));

  while (:dt_dia <= :dt_base) do
  begin
    nr_dia    = extract(weekday from :dt_dia) + 1;
    nr_semana = extract(week from :dt_dia);
    suspend;
    dt_dia = :dt_dia + 1;
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_PERIODO_MENSAL IS 'Procedure GET Periodo Mensal.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   12/09/2018

Store procedure responsavel por definir um periodo mensal de 4 (quatro) semanas
usando como data final do periodo a data base informada.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    12/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.DT_BASE IS
'Data base';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.NR_DIA IS
'Dia da semana';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.NR_SEMANA IS
'Numero da semana';

COMMENT ON PARAMETER GET_PERIODO_MENSAL.DT_DIA IS
'Periodo mensal';




/*------ SYSDBA 14/09/2018 15:31:25 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
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
end ^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_PREVISTO IS 'Procedure GET Movimento Financeiro Mensal Previsto.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

GRANT EXECUTE ON PROCEDURE GET_MOV_MENSAL_PREVISTO TO "PUBLIC";



/*------ SYSDBA 14/09/2018 15:35:22 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
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
end ^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_REALIZADO IS 'Procedure GET Movimento Financeiro Mensal Realizado.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira realizada da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

GRANT EXECUTE ON PROCEDURE GET_MOV_MENSAL_REALIZADO TO "PUBLIC";



/*------ SYSDBA 14/09/2018 15:35:40 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
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
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_PREVISTO IS 'Procedure GET Movimento Financeiro Mensal Previsto.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira prevista da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 14/09/2018 17:40:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
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
^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';




/*------ SYSDBA 14/09/2018 17:41:11 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    nr_ordem         DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
  declare variable dt_inicial       DMN_DATE;
  declare variable dt_saldo_inicial DMN_DATE;
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
^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 14/09/2018 17:42:44 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 14/09/2018 17:44:46 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    nr_ordem         DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
  declare variable dt_inicial       DMN_DATE;
  declare variable dt_saldo_inicial DMN_DATE;
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';




/*------ SYSDBA 14/09/2018 17:45:03 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';




/*------ SYSDBA 14/09/2018 18:10:29 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:11:19 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:15:06 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:15:24 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'D'))

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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:17:30 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'D'))

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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:18:50 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'D'))

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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:19:23 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:20:33 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:32:39 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:32:58 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:37:16 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
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
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(tp.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:37:20 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 18:42:21 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , pv.cd_tipo
          , pv.ds_tipo
          , pv.vl_previsto
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
        
            Select
                extract(week from rb.dtvenc) as nr_semana
              , rb.dtvenc        as dt_dia
              , coalesce(rb.codtprec, 0) as cd_tipo
              , coalesce(tr.tiporec, '') as ds_tipo
              , sum(rb.valorrec) as vl_previsto
            from TBCONTREC rb
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc
              , coalesce(rb.codtprec, 0)
              , coalesce(tr.tiporec, '')

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , coalesce(pg.codtpdesp, 0) as cd_tipo
              , coalesce(td.tipodesp, '') as ds_tipo
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc
              , coalesce(pg.codtpdesp, 0)
              , coalesce(td.tipodesp, '')

          ) pv on (pv.dt_dia = dt.dt_dia)

        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_previsto
      do
      begin

        suspend;

      end
    end
  end
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 14/09/2018 18:42:25 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , pv.cd_tipo
          , pv.ds_tipo
          , pv.vl_previsto
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
        
            Select
                extract(week from rb.dtvenc) as nr_semana
              , rb.dtvenc        as dt_dia
              , coalesce(rb.codtprec, 0) as cd_tipo
              , coalesce(tr.tiporec, '') as ds_tipo
              , sum(rb.valorrec) as vl_previsto
            from TBCONTREC rb
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc
              , coalesce(rb.codtprec, 0)
              , coalesce(tr.tiporec, '')

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , coalesce(pg.codtpdesp, 0) as cd_tipo
              , coalesce(td.tipodesp, '') as ds_tipo
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc
              , coalesce(pg.codtpdesp, 0)
              , coalesce(td.tipodesp, '')

          ) pv on (pv.dt_dia = dt.dt_dia)

        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_previsto
      do
      begin

        suspend;

      end
    end
  end
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 14/09/2018 18:45:11 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , ra.cd_tipo
          , ra.ds_tipo
          , ra.vl_realizado
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
    
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_receita, 0)   as cd_tipo
              , coalesce(tr.tiporec, '')       as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)
    
            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_receita, 0)
              , coalesce(tr.tiporec, '')
            
            union
            
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_despesa, 0)   as cd_tipo
              , coalesce(td.tipodesp, '')      as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)

            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_despesa, 0)
              , coalesce(td.tipodesp, '')
    
          ) ra on (ra.dt_dia = dt.dt_dia)
        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_realizado
      do
      begin

        suspend;

      end
    end
  end 
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';




/*------ SYSDBA 14/09/2018 18:45:15 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , ra.cd_tipo
          , ra.ds_tipo
          , ra.vl_realizado
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
    
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_receita, 0)   as cd_tipo
              , coalesce(tr.tiporec, '')       as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)
    
            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_receita, 0)
              , coalesce(tr.tiporec, '')
            
            union
            
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_despesa, 0)   as cd_tipo
              , coalesce(td.tipodesp, '')      as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)

            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_despesa, 0)
              , coalesce(td.tipodesp, '')
    
          ) ra on (ra.dt_dia = dt.dt_dia)
        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_realizado
      do
      begin

        suspend;

      end
    end
  end 
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';




/*------ SYSDBA 14/09/2018 19:04:11 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , pv.cd_tipo
          , pv.ds_tipo
          , pv.vl_previsto
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
        
            Select
                extract(week from rb.dtvenc) as nr_semana
              , rb.dtvenc        as dt_dia
              , coalesce(rb.codtprec, 0) as cd_tipo
              , coalesce(tr.tiporec, '') as ds_tipo
              , sum(rb.valorrec) as vl_previsto
            from TBCONTREC rb
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc
              , coalesce(rb.codtprec, 0)
              , coalesce(tr.tiporec, '')

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , coalesce(pg.codtpdesp, 0) as cd_tipo
              , coalesce(td.tipodesp, '') as ds_tipo
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc
              , coalesce(pg.codtpdesp, 0)
              , coalesce(td.tipodesp, '')

          ) pv on (pv.dt_dia = dt.dt_dia)

        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_previsto
      do
      begin

        suspend;

      end
    end
  end
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 19:04:31 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL_PREVISTO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , pv.cd_tipo
          , pv.ds_tipo
          , pv.vl_previsto
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
        
            Select
                extract(week from rb.dtvenc) as nr_semana
              , rb.dtvenc        as dt_dia
              , coalesce(rb.codtprec, 0) as cd_tipo
              , coalesce(tr.tiporec, '') as ds_tipo
              , sum(rb.valorrec) as vl_previsto
            from TBCONTREC rb
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc
              , coalesce(rb.codtprec, 0)
              , coalesce(tr.tiporec, '')

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , coalesce(pg.codtpdesp, 0) as cd_tipo
              , coalesce(td.tipodesp, '') as ds_tipo
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc
              , coalesce(pg.codtpdesp, 0)
              , coalesce(td.tipodesp, '')

          ) pv on (pv.dt_dia = dt.dt_dia)

        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_previsto
      do
      begin

        suspend;

      end
    end
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_PREVISTO_DET IS 'Procedure GET Movimento Financeiro Mensal Previsto.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira prevista da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 19:04:46 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL_REALIZADO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , ra.cd_tipo
          , ra.ds_tipo
          , ra.vl_realizado
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
    
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_receita, 0)   as cd_tipo
              , coalesce(tr.tiporec, '')       as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)
    
            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_receita, 0)
              , coalesce(tr.tiporec, '')
            
            union
            
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_despesa, 0)   as cd_tipo
              , coalesce(td.tipodesp, '')      as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)

            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_despesa, 0)
              , coalesce(td.tipodesp, '')
    
          ) ra on (ra.dt_dia = dt.dt_dia)
        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_realizado
      do
      begin

        suspend;

      end
    end
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_REALIZADO_DET IS 'Procedure GET Movimento Financeiro Mensal Realizado.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira realizada da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 19:05:59 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_PREVISTO IS 'Procedure GET Movimento Financeiro Mensal Previsto.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira prevista da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 19:06:57 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_REALIZADO IS 'Procedure GET Movimento Financeiro Mensal Realizado.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira realizada da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';




/*------ SYSDBA 14/09/2018 19:07:29 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , pv.cd_tipo
          , pv.ds_tipo
          , pv.vl_previsto
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
        
            Select
                extract(week from rb.dtvenc) as nr_semana
              , rb.dtvenc        as dt_dia
              , coalesce(rb.codtprec, 0) as cd_tipo
              , coalesce(tr.tiporec, '') as ds_tipo
              , sum(rb.valorrec) as vl_previsto
            from TBCONTREC rb
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc
              , coalesce(rb.codtprec, 0)
              , coalesce(tr.tiporec, '')

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , coalesce(pg.codtpdesp, 0) as cd_tipo
              , coalesce(td.tipodesp, '') as ds_tipo
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc
              , coalesce(pg.codtpdesp, 0)
              , coalesce(td.tipodesp, '')

          ) pv on (pv.dt_dia = dt.dt_dia)

        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_previsto
      do
      begin

        suspend;

      end
    end
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_PREVISTO_DET IS 'Procedure GET Movimento Financeiro Mensal Previsto (Detalhado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira prevista da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 14/09/2018 19:07:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
          , ra.cd_tipo
          , ra.ds_tipo
          , ra.vl_realizado
        from GET_PERIODO_MENSAL(:data_base) dt
          left join (
    
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_receita, 0)   as cd_tipo
              , coalesce(tr.tiporec, '')       as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPRECEITA tr on (tr.cod = cx.tipo_receita)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)
    
            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_receita, 0)
              , coalesce(tr.tiporec, '')
            
            union
            
            Select
                extract(week from cx.datahora) as nr_semana
              , cast(cx.datahora as date)      as dt_dia
              , coalesce(cx.tipo_despesa, 0)   as cd_tipo
              , coalesce(td.tipodesp, '')      as ds_tipo
              , sum(cx.valor) as vl_realizado
            from TBCAIXA_MOVIMENTO cx
              left join TBTPDESPESA td on (td.cod = cx.tipo_despesa)
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and ((coalesce(:conta, 0) = 0) or (cx.conta_corrente = :conta))
              and (cast(cx.datahora as date) > :dt_inicial)

            group by
                extract(week from cx.datahora)
              , cast(cx.datahora as date)
              , coalesce(cx.tipo_despesa, 0)
              , coalesce(td.tipodesp, '')
    
          ) ra on (ra.dt_dia = dt.dt_dia)
        Into
            nr_semana
          , nr_dia
          , dt_dia
          , cd_tipo
          , ds_tipo
          , vl_realizado
      do
      begin

        suspend;

      end
    end
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL_REALIZADO_DET IS 'Procedure GET Movimento Financeiro Mensal Realizado (Detalhado).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   14/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira realizada da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

GRANT EXECUTE ON PROCEDURE GET_MOV_MENSAL_REALIZADO_DET TO "PUBLIC";
GRANT EXECUTE ON PROCEDURE GET_MOV_MENSAL_PREVISTO_DET TO "PUBLIC";



/*------ SYSDBA 15/09/2018 21:49:04 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
        , coalesce(tr.cod, 0)      as cd_tipo
        , coalesce(tr.tiporec, '') as ds_tipo
      from VW_CLASSIFICAO_RECEITA cr
        left join TBTPRECEITA tr on (coalesce(tr.classificacao, 0) = cr.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
        , coalesce(td.cod, 0)       as cd_tipo
        , coalesce(td.tipodesp, '') as ds_tipo
      from VW_CLASSIFICAO_DESPESA cd
        left join TBTPDESPESA td on (coalesce(td.classificacao, 0) = cd.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'D'))

      order by 1, 5, 7

      Into
          cd_grupo
        , ds_grupo
        , cd_classificacao
        , ds_classificacao
        , nr_ordem
        , cd_tipo
        , ds_tipo
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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and (coalesce(rb.codtprec, 0)      = :cd_tipo)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and (coalesce(pg.codtpdesp, 0)     = :cd_tipo)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 15/09/2018 21:50:57 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
        , coalesce(tr.cod, 0)      as cd_tipo
        , coalesce(tr.tiporec, '') as ds_tipo
      from VW_CLASSIFICAO_RECEITA cr
        left join TBTPRECEITA tr on (coalesce(tr.classificacao, 0) = cr.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
        , coalesce(td.cod, 0)       as cd_tipo
        , coalesce(td.tipodesp, '') as ds_tipo
      from VW_CLASSIFICAO_DESPESA cd
        left join TBTPDESPESA td on (coalesce(td.classificacao, 0) = cd.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'D'))

      order by 1, 5, 7

      Into
          cd_grupo
        , ds_grupo
        , cd_classificacao
        , ds_classificacao
        , nr_ordem
        , cd_tipo
        , ds_tipo
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and (coalesce(cx.tipo_receita, 0)  = :cd_tipo)
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and (coalesce(cx.tipo_despesa, 0)  = :cd_tipo)
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 16/09/2018 13:46:16 --------*/

SET TERM ^ ;

create or alter procedure GET_MOV_MENSAL (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_SEMANA DMN_INTEGER_N,
    DT_INICIAL DMN_DATE,
    DT_FINAL DMN_DATE,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
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
    from GET_MOV_MENSAL_PREVISTO(:data_base, :empresa, :conta, 'S') cs
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
      , min(pv.dt_dia)
      , max(pv.dt_dia)
      , sum(pv.vl_previsto)
      , sum(ra.vl_realizado)
    from GET_MOV_MENSAL_PREVISTO(:data_base, :empresa, :conta, 'T') pv
      inner join GET_MOV_MENSAL_REALIZADO(:data_base, :empresa, :conta, 'T') ra on (
            ra.cd_grupo = pv.cd_grupo
        and ra.cd_classificacao = pv.cd_classificacao
        and ra.dt_dia    = pv.dt_dia
        and ra.nr_semana = pv.nr_semana
      )
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
      , dt_inicial
      , dt_final
      , vl_previsto
      , vl_realizado
  do
  begin

    suspend;

  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_MOV_MENSAL IS 'Procedure GET Movimento Financeiro Mensal Previsto e Realizado.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   16/09/2018

Store procedure responsavel por listar, em um periodo mensal de 28 (vinte e oito)
dias, a movimentacao financeira prevista e realizada da empresa/conta.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    16/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_MOV_MENSAL.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL.CONTA IS
'Conta Corrente';

GRANT EXECUTE ON PROCEDURE GET_MOV_MENSAL TO "PUBLIC";



/*------ SYSDBA 23/09/2018 12:08:53 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:09:23 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
        , coalesce(tr.cod, 0)      as cd_tipo
        , coalesce(tr.tiporec, '') as ds_tipo
      from VW_CLASSIFICAO_RECEITA cr
        left join TBTPRECEITA tr on (coalesce(tr.classificacao, 0) = cr.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
        , coalesce(td.cod, 0)       as cd_tipo
        , coalesce(td.tipodesp, '') as ds_tipo
      from VW_CLASSIFICAO_DESPESA cd
        left join TBTPDESPESA td on (coalesce(td.classificacao, 0) = cd.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'D'))

      order by 1, 5, 7

      Into
          cd_grupo
        , ds_grupo
        , cd_classificacao
        , ds_classificacao
        , nr_ordem
        , cd_tipo
        , ds_tipo
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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and (coalesce(rb.codtprec, 0)      = :cd_tipo)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and (coalesce(pg.codtpdesp, 0)     = :cd_tipo)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:09:42 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';




/*------ SYSDBA 23/09/2018 12:10:03 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:10:19 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
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
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
        , coalesce(tr.cod, 0)      as cd_tipo
        , coalesce(tr.tiporec, '') as ds_tipo
      from VW_CLASSIFICAO_RECEITA cr
        left join TBTPRECEITA tr on (coalesce(tr.classificacao, 0) = cr.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
        , coalesce(td.cod, 0)       as cd_tipo
        , coalesce(td.tipodesp, '') as ds_tipo
      from VW_CLASSIFICAO_DESPESA cd
        left join TBTPDESPESA td on (coalesce(td.classificacao, 0) = cd.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'D'))

      order by 1, 5, 7

      Into
          cd_grupo
        , ds_grupo
        , cd_classificacao
        , ds_classificacao
        , nr_ordem
        , cd_tipo
        , ds_tipo
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and (coalesce(cx.tipo_receita, 0)  = :cd_tipo)
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and (coalesce(cx.tipo_despesa, 0)  = :cd_tipo)
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:18:45 --------*/

SET TERM ^ ;

create or alter procedure GET_SALDO_FINANCEIRO_EMPRESA (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    SALDO_ANTERIOR_DATA date,
    SALDO_ANTERIOR_VALOR numeric(15,2),
    SALDO_INICIAL_DATA date,
    SALDO_INICIAL_VALOR numeric(15,2),
    SALDO_FINAL_DATA date,
    SALDO_FINAL_VALOR numeric(15,2))
as
declare variable TMP_DATA date;
begin
  -- Buscar data anterior de saldo
  Select
    max(s.Data_saldo)
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s on (s.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s.codigo = :conta))
    and (s.data_saldo < :data_inicial)
  into
    Tmp_data;

  -- Buscar valor (SALDO ANTERIOR)
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s1 on (s1.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s1.codigo = :conta))
    and (s1.data_saldo = :tmp_data)
  into
      Saldo_anterior_data
    , Saldo_anterior_valor;

  -- Buscar valor (SALDO INICIAL)
  Select
      s2.Data_saldo
    , s2.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s2 on (s2.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s2.codigo = :conta))
    and (s2.data_saldo = :data_inicial)
  into
      Saldo_inicial_data
    , Saldo_inicial_valor;

  -- Buscar valor (SALDO FINAL)
  Select
      s3.Data_saldo
    , s3.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s3 on (s3.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s3.codigo = :conta))
    and (s3.data_saldo = :data_final)
  into
      Saldo_final_data
    , Saldo_final_valor;

  Saldo_anterior_data = coalesce(:Saldo_anterior_data, :Data_inicial - 1);
  Saldo_inicial_data  = coalesce(:Saldo_inicial_data,  :Data_inicial);
  Saldo_final_data    = coalesce(:Saldo_final_data,    :Data_final);

  Saldo_anterior_valor = coalesce(:Saldo_anterior_valor, 0);
  Saldo_inicial_valor  = coalesce(:Saldo_inicial_valor,  0);
  Saldo_final_valor    = coalesce(:Saldo_final_valor,    0);

  suspend;
end^

SET TERM ; ^




/*------ SYSDBA 23/09/2018 12:20:46 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_SALDO_FINANCEIRO_EMPRESA (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    SALDO_ANTERIOR_DATA date,
    SALDO_ANTERIOR_VALOR numeric(15,2),
    SALDO_INICIAL_DATA date,
    SALDO_INICIAL_VALOR numeric(15,2),
    SALDO_FINAL_DATA date,
    SALDO_FINAL_VALOR numeric(15,2))
as
declare variable TMP_DATA date;
begin
  -- Buscar data anterior de saldo
  Select
    max(s.Data_saldo)
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s on (s.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s.codigo = :conta))
    and (s.data_saldo < :data_inicial)
  into
    Tmp_data;

  -- Buscar valor (SALDO ANTERIOR)
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s1 on (s1.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s1.codigo = :conta))
    and (s1.data_saldo = :tmp_data)
  into
      Saldo_anterior_data
    , Saldo_anterior_valor;

  -- Buscar valor (SALDO INICIAL)
  Select
      s2.Data_saldo
    , s2.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s2 on (s2.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s2.codigo = :conta))
    and (s2.data_saldo = :data_inicial)
  into
      Saldo_inicial_data
    , Saldo_inicial_valor;

  -- Buscar valor (SALDO FINAL)
  Select
      s3.Data_saldo
    , s3.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s3 on (s3.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s3.codigo = :conta))
    and (s3.data_saldo = :data_final)
  into
      Saldo_final_data
    , Saldo_final_valor;

  Saldo_anterior_data = coalesce(:Saldo_anterior_data, :Data_inicial - 1);
  Saldo_inicial_data  = coalesce(:Saldo_inicial_data,  :Data_inicial);
  Saldo_final_data    = coalesce(:Saldo_final_data,    :Data_final);

  Saldo_anterior_valor = coalesce(:Saldo_anterior_valor, 0);
  Saldo_inicial_valor  = coalesce(:Saldo_inicial_valor,  0);
  Saldo_final_valor    = coalesce(:Saldo_final_valor,    0);

  suspend;
end^

SET TERM ; ^

COMMENT ON PROCEDURE GET_SALDO_FINANCEIRO_EMPRESA IS 'Procedure GET Saldo Financeiro Empresa.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/09/2018

Store procedure responsavel por consolidar o Saldo Financeiro da Empresa de acordo
com a conta corrente, caso esta seja informada.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/09/2018 - IMR :
        * Documentacao da procedure.';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.EMPRESA IS
'Empresa';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.DATA_INICIAL IS
'Data Inicial';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.DATA_FINAL IS
'Data Final';

GRANT EXECUTE ON PROCEDURE GET_SALDO_FINANCEIRO_EMPRESA TO "PUBLIC";



/*------ SYSDBA 23/09/2018 12:39:46 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_SALDO_FINANCEIRO_EMPRESA (
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    DATA_INICIAL date,
    DATA_FINAL date)
returns (
    SALDO_ANTERIOR_DATA date,
    SALDO_ANTERIOR_VALOR numeric(15,2),
    SALDO_INICIAL_DATA date,
    SALDO_INICIAL_VALOR numeric(15,2),
    SALDO_FINAL_DATA date,
    SALDO_FINAL_VALOR numeric(15,2))
as
declare variable TMP_DATA date;
begin
  -- Buscar data anterior de saldo
  Select
    max(s.Data_saldo)
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s on (s.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s.codigo = :conta))
    and (s.data_saldo < :data_inicial)
  into
    Tmp_data;

  -- Buscar valor (SALDO ANTERIOR)
  Select
      s1.Data_saldo
    , s1.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s1 on (s1.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s1.codigo = :conta))
    and (s1.data_saldo = :tmp_data)
  into
      Saldo_anterior_data
    , Saldo_anterior_valor;

  -- Buscar valor (SALDO INICIAL)
  Select
      s2.Data_saldo
    , s2.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s2 on (s2.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s2.codigo = :conta))
    and (s2.data_saldo = :data_inicial)
  into
      Saldo_inicial_data
    , Saldo_inicial_valor;

  -- Buscar valor (SALDO FINAL)
  Select
      s3.Data_saldo
    , s3.Valor_saldo
  from TBCONTA_CORRENTE c
    inner join TBCONTA_CORRENTE_SALDO s3 on (s3.codigo = c.codigo)
  where (c.empresa = :empresa)
    and ((coalesce(:conta, 0) = 0) or (s3.codigo = :conta))
    and (s3.data_saldo = :data_final)
  into
      Saldo_final_data
    , Saldo_final_valor;

  Saldo_anterior_data = coalesce(:Saldo_anterior_data, :Data_inicial - 1);
  Saldo_inicial_data  = coalesce(:Saldo_inicial_data,  :Data_inicial);
  Saldo_final_data    = coalesce(:Saldo_final_data,    :Data_final);

  Saldo_anterior_valor = coalesce(:Saldo_anterior_valor, 0);
  Saldo_inicial_valor  = coalesce(:Saldo_inicial_valor,  0);
  Saldo_final_valor    = coalesce(:Saldo_final_valor,    0);

  suspend;
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.EMPRESA IS
'Empresa';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.DATA_INICIAL IS
'Data Inicial';

COMMENT ON PARAMETER GET_SALDO_FINANCEIRO_EMPRESA.DATA_FINAL IS
'Data Final';




/*------ SYSDBA 23/09/2018 12:53:41 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
  begin
    Select
      min(dt.dt_dia)
    from GET_PERIODO_MENSAL(:data_base) dt
    Into
      dt_inicial;

    nr_dia    = extract(weekday from :dt_inicial) + 1;
    nr_semana = extract(week from :dt_inicial);
    /*
    Select
      max(cs.data_saldo)
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
    */

    Select
        min(cs.data_saldo)  as dt_saldo
      , sum(cs.valor_saldo) as vl_saldo
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
      inner join (
        Select
            cc.codigo as conta
          , max(cs.data_saldo)  as dt_saldo
        from TBCONTA_CORRENTE cc
          inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
        where (cc.empresa    = :empresa)
          and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
          and (cs.data_saldo < :dt_inicial)
        group by
            cc.codigo
      ) dt on (dt.conta = cc.codigo and dt.dt_saldo = cs.data_saldo)

    where (cc.empresa = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
    into
        dt_saldo_inicial
      , vl_inicial;

    cd_grupo  = 'S';
    ds_grupo  = 'SALDO';
    cd_classificacao = -1;
    ds_classificacao = 'Saldo inicial';
    dt_dia    = :dt_saldo_inicial;

    suspend;
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:53:58 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_PREVISTO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_PREVISTO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
  begin
    Select
      min(dt.dt_dia)
    from GET_PERIODO_MENSAL(:data_base) dt
    Into
      dt_inicial;

    nr_dia    = extract(weekday from :dt_inicial) + 1;
    nr_semana = extract(week from :dt_inicial);
    /*
    Select
      max(cs.data_saldo)
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
    */

    Select
        min(cs.data_saldo)  as dt_saldo
      , sum(cs.valor_saldo) as vl_saldo
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
      inner join (
        Select
            cc.codigo as conta
          , max(cs.data_saldo)  as dt_saldo
        from TBCONTA_CORRENTE cc
          inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
        where (cc.empresa    = :empresa)
          and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
          and (cs.data_saldo < :dt_inicial)
        group by
            cc.codigo
      ) dt on (dt.conta = cc.codigo and dt.dt_saldo = cs.data_saldo)

    where (cc.empresa = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
    into
        dt_saldo_inicial
      , vl_inicial;

    cd_grupo  = 'S';
    ds_grupo  = 'SALDO';
    cd_classificacao = -1;
    ds_classificacao = 'Saldo inicial';
    dt_dia    = :dt_saldo_inicial;

    suspend;
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
        , coalesce(tr.cod, 0)      as cd_tipo
        , coalesce(tr.tiporec, '') as ds_tipo
      from VW_CLASSIFICAO_RECEITA cr
        left join TBTPRECEITA tr on (coalesce(tr.classificacao, 0) = cr.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
        , coalesce(td.cod, 0)       as cd_tipo
        , coalesce(td.tipodesp, '') as ds_tipo
      from VW_CLASSIFICAO_DESPESA cd
        left join TBTPDESPESA td on (coalesce(td.classificacao, 0) = cd.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'D'))

      order by 1, 5, 7

      Into
          cd_grupo
        , ds_grupo
        , cd_classificacao
        , ds_classificacao
        , nr_ordem
        , cd_tipo
        , ds_tipo
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
              left join TBTPRECEITA tr on (tr.cod = rb.codtprec)
            where (rb.empresa  = :empresa)
              and (rb.situacao = 1)
              and (:cd_grupo   = 'C')
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and (coalesce(rb.codtprec, 0)      = :cd_tipo)
            group by
                extract(week from rb.dtvenc)
              , rb.dtvenc

            union

            Select
                extract(week from pg.dtvenc) as nr_semana
              , pg.dtvenc        as dt_dia
              , sum(pg.valorpag) as vl_previsto
            from TBCONTPAG pg
              left join TBTPDESPESA td on (td.cod = pg.codtpdesp)
            where (pg.empresa  = :empresa)
              and (pg.situacao = 1)
              and (:cd_grupo   = 'D')
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and (coalesce(pg.codtpdesp, 0)     = :cd_tipo)
            group by
                extract(week from pg.dtvenc)
              , pg.dtvenc

          ) pv on (pv.dt_dia = dt.dt_dia)

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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.VL_PREVISTO IS
'Valor Previsto';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_PREVISTO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:54:13 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
  begin
    Select
      min(dt.dt_dia)
    from GET_PERIODO_MENSAL(:data_base) dt
    Into
      dt_inicial;

    nr_dia    = extract(weekday from :dt_inicial) + 1;
    nr_semana = extract(week from :dt_inicial);
    /*
    Select
      max(cs.data_saldo)
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
    */

    Select
        min(cs.data_saldo)  as dt_saldo
      , sum(cs.valor_saldo) as vl_saldo
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
      inner join (
        Select
            cc.codigo as conta
          , max(cs.data_saldo)  as dt_saldo
        from TBCONTA_CORRENTE cc
          inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
        where (cc.empresa    = :empresa)
          and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
          and (cs.data_saldo < :dt_inicial)
        group by
            cc.codigo
      ) dt on (dt.conta = cc.codigo and dt.dt_saldo = cs.data_saldo)

    where (cc.empresa = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
    into
        dt_saldo_inicial
      , vl_inicial;

    cd_grupo  = 'S';
    ds_grupo  = 'SALDO';
    cd_classificacao = -1;
    ds_classificacao = 'Saldo inicial';
    dt_dia    = :dt_saldo_inicial;

    suspend;
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
      from VW_CLASSIFICAO_RECEITA cr
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
      from VW_CLASSIFICAO_DESPESA cd
      where (:cd_grupo_temp in ('T', 'M', 'D'))

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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';




/*------ SYSDBA 23/09/2018 12:54:26 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure GET_MOV_MENSAL_REALIZADO_DET (
    DATA_BASE DMN_DATE,
    EMPRESA DMN_CNPJ,
    CONTA DMN_INTEGER_N,
    GRUPO DMN_VCHAR_01)
returns (
    CD_GRUPO DMN_VCHAR_01,
    DS_GRUPO DMN_VCHAR_30,
    CD_CLASSIFICACAO DMN_SMALLINT_N,
    DS_CLASSIFICACAO DMN_VCHAR_30,
    CD_TIPO DMN_SMALLINT_N,
    DS_TIPO DMN_VCHAR_50,
    NR_ORDEM DMN_SMALLINT_N,
    DT_DIA DMN_DATE,
    NR_DIA DMN_INTEGER_N,
    NR_SEMANA DMN_INTEGER_N,
    VL_INICIAL DMN_MONEY,
    VL_REALIZADO DMN_MONEY)
as
declare variable DT_INICIAL DMN_DATE;
declare variable DT_SALDO_INICIAL DMN_DATE;
declare variable CD_GRUPO_TEMP DMN_VCHAR_01;
begin
  cd_grupo_temp = coalesce(trim(:grupo), 'T');

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'S')) then
  begin
    Select
      min(dt.dt_dia)
    from GET_PERIODO_MENSAL(:data_base) dt
    Into
      dt_inicial;

    nr_dia    = extract(weekday from :dt_inicial) + 1;
    nr_semana = extract(week from :dt_inicial);
    /*
    Select
      max(cs.data_saldo)
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
    where (cc.empresa    = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
      and (cs.data_saldo < :dt_inicial)
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
    */

    Select
        min(cs.data_saldo)  as dt_saldo
      , sum(cs.valor_saldo) as vl_saldo
    from TBCONTA_CORRENTE cc
      inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
      inner join (
        Select
            cc.codigo as conta
          , max(cs.data_saldo)  as dt_saldo
        from TBCONTA_CORRENTE cc
          inner join TBCONTA_CORRENTE_SALDO cs on (cs.codigo = cc.codigo)
        where (cc.empresa    = :empresa)
          and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
          and (cs.data_saldo < :dt_inicial)
        group by
            cc.codigo
      ) dt on (dt.conta = cc.codigo and dt.dt_saldo = cs.data_saldo)

    where (cc.empresa = :empresa)
      and ((coalesce(:conta, 0) = 0) or (cc.codigo = :conta))
    into
        dt_saldo_inicial
      , vl_inicial;

    cd_grupo  = 'S';
    ds_grupo  = 'SALDO';
    cd_classificacao = -1;
    ds_classificacao = 'Saldo inicial';
    dt_dia    = :dt_saldo_inicial;

    suspend;
  end

  vl_inicial = 0.00;

  if ((:cd_grupo_temp = 'T') or (:cd_grupo_temp = 'M') or (:cd_grupo_temp = 'C') or (:cd_grupo_temp = 'D')) then
  begin
    for
      Select
          'C'
        , 'ENTRADAS'
        , cr.tpe_codigo
        , cr.tpe_descricao
        , cr.tpe_ordem
        , coalesce(tr.cod, 0)      as cd_tipo
        , coalesce(tr.tiporec, '') as ds_tipo
      from VW_CLASSIFICAO_RECEITA cr
        left join TBTPRECEITA tr on (coalesce(tr.classificacao, 0) = cr.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'C'))

      union

      Select
          'D'
        , 'SAIDAS'
        , cd.tpe_codigo
        , cd.tpe_descricao
        , cd.tpe_ordem
        , coalesce(td.cod, 0)       as cd_tipo
        , coalesce(td.tipodesp, '') as ds_tipo
      from VW_CLASSIFICAO_DESPESA cd
        left join TBTPDESPESA td on (coalesce(td.classificacao, 0) = cd.tpe_codigo)
      where (:cd_grupo_temp in ('T', 'M', 'D'))

      order by 1, 5, 7

      Into
          cd_grupo
        , ds_grupo
        , cd_classificacao
        , ds_classificacao
        , nr_ordem
        , cd_tipo
        , ds_tipo
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'C'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(tr.classificacao, 0) = :cd_classificacao)
              and (coalesce(cx.tipo_receita, 0)  = :cd_tipo)
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
            where ((cx.tipo = :cd_grupo) and (:cd_grupo = 'D'))
              and (cx.situacao = 1)
              and (cx.empresa  = :empresa)
              and (coalesce(td.classificacao, 0) = :cd_classificacao)
              and (coalesce(cx.tipo_despesa, 0)  = :cd_tipo)
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
end^

SET TERM ; ^

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_GRUPO IS
'Codigo do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_GRUPO IS
'Descricao do Grupo';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CD_CLASSIFICACAO IS
'Codigo da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DS_CLASSIFICACAO IS
'Descricao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_ORDEM IS
'Ordem de exibicao da Classificacao';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DT_DIA IS
'Data';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_DIA IS
'Dia da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.NR_SEMANA IS
'Numero da Semana';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_INICIAL IS
'Valor de Saldo Inicial';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.VL_REALIZADO IS
'Valor Realizado';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.DATA_BASE IS
'Data final para o periodo mensal de 28 dias';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.EMPRESA IS
'CNPJ da Empresa';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.CONTA IS
'Conta Corrente';

COMMENT ON PARAMETER GET_MOV_MENSAL_REALIZADO_DET.GRUPO IS
'Grupo (S - Saldo, C - Credito, D - Debito, M - Credito/Debito, T - Todos)';

