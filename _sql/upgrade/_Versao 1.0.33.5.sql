

CREATE OR ALTER VIEW VW_EMPRESA(
    CODIGO,
    CNPJ,
    RAZAO,
    FANTASIA)
AS
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , cast(coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as DMN_VCHAR_150) as fantasia
from TBEMPRESA e
where e.ativa = 1
order by
    4 -- Fantasia
;

