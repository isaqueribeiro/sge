


/*------ SYSDBA 17/07/2019 16:00:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendasitens_custo for tvendasitens
active before insert or update position 30
AS
begin
  Select
      p.customedio
    , p.customedio * coalesce(new.qtde, 0.0)
  from TBPRODUTO p
  where (p.cod = new.codprod)
  Into
      new.pcusto
    , new.total_custo;
end^

SET TERM ; ^




/*------ SYSDBA 17/07/2019 16:00:54 --------*/

COMMENT ON COLUMN TVENDASITENS.CODPROD IS
'Produto';

