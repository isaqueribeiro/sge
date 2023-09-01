/*

Select
    c.codigo
  , c.descricao
  , c.ativo
from TBCENTRO_CUSTO c
  left join TBCENTRO_CUSTO_EMPRESA e on (e.centro_custo = c.codigo)
where (c.codcliente is null)
  and (e.centro_custo is null)
order by
    c.descricao
  , c.codigo

*/
execute block
as
  declare variable certo Integer;
  declare variable errado Integer;
begin
  -- CASA DA MULHER BRASILEIRA - ALMÁA ENGENHARIA
  -- certo  = 136;
  -- errado = 131; -- 130, 132, 131
  -- POSTO DALLAS - AV. DR. FREITAS
  -- certo  = 122;
  -- errado = 124;
  -- ALMOXARIFADO
  certo  = 10;
  errado = 87;

  if ((coalesce(:certo, 0) != 0) and (coalesce(:errado, 0) != 0)) then
  begin
      Update TBAPROPRIACAO_ALMOX a Set
        a.centro_custo = :certo
      where (a.centro_custo = :errado)
        and (a.centro_custo is not null);
    
      Update TBAUTORIZA_COMPRA c Set
        c.centro_custo = :certo
      where (c.centro_custo = :errado)
        and (c.centro_custo is not null);
    
      Update TBESTOQUE_ALMOX e Set
        e.centro_custo = :certo
      where (e.centro_custo = :errado)
        and (e.centro_custo is not null);
    
      Update TBINVENTARIO_ALMOX i Set
        i.centro_custo = :certo
      where (i.centro_custo = :errado)
        and (i.centro_custo is not null);
    
      Update TBREQUISICAO_ALMOX r Set
        r.ccusto_origem = :certo
      where (r.ccusto_origem = :errado)
        and (r.ccusto_origem is not null);
    
      Update TBREQUISITA_COMPRA p Set
        p.centro_custo = :certo
      where (p.centro_custo = :errado)
        and (p.centro_custo is not null);
    
      Update TBSOLICITACAO s Set
        s.centro_custo = :certo
      where (s.centro_custo = :errado)
        and (s.centro_custo is not null);
    
      Update TBSOLICITACAO_ITEM s Set
        s.centro_custo = :certo
      where (s.centro_custo = :errado)
        and (s.centro_custo is not null);
    
      Delete from TBCENTRO_CUSTO z
      where z.codigo = :errado;
  end
end