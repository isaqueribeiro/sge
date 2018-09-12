


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

