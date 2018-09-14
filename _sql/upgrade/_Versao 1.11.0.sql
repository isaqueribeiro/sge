


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

