

CREATE INDEX IDX_TBCOMPRAS_NFDEVOLUCAO ON TBCOMPRAS (CODEMP, DNFE_SERIE, DNFE_NUMERO, DNFE_MODELO);

SET TERM ^ ;

CREATE OR ALTER procedure SP_CONTRATO_ATUALIZA_CONSUMO (
    CONTRATO DMN_BIGINT_N)
as
declare variable VPRODUTO type of DMN_VCHAR_10;
declare variable VQUANTIDADE type of DMN_QUANTIDADE_D3;
declare variable VVALOR_TOTAL type of DMN_MONEY;
begin
  for
    Select
        vi.codprod   as produto
      , sum(vi.qtde) as quantidade
      , sum(vi.total_liquido) as valor_total
    from TBVENDAS vn
      inner join TVENDASITENS vi on (vi.ano = vn.ano and vi.codcontrol = vn.codcontrol)
      -- Nota fiscal emitida
      left join TBNFE_ENVIADA nf on (nf.empresa = vn.codemp and nf.anovenda = vn.ano and nf.numvenda = vn.codcontrol)
      -- Nota fical de devolucao emitida
      left join TBCOMPRAS dv on (dv.codemp = vn.codemp and dv.dnfe_serie = nf.serie and dv.dnfe_numero = nf.numero and dv.dnfe_modelo = nf.modelo)
    where (vn.status between 3 and 4) -- 3. Venda Finalizada / 4. Nota Emitida
      and (coalesce(dv.ano, 0) = 0)
      and (vn.contrato = :contrato)
    group by
        vi.codprod
    Into
        vproduto
      , vquantidade
      , vvalor_total
  do
  begin
    Update TBCONTRATO_ITEM ci Set
        ci.consumo_qtde  = :vquantidade
      , ci.consumo_total = :vvalor_total
    where (ci.contrato = :contrato)
      and (ci.produto  = :vproduto);
  end
end^

SET TERM ; ^

COMMENT ON PARAMETER SP_CONTRATO_ATUALIZA_CONSUMO.CONTRATO IS
'Codigo de controle do contrato';



SET TERM ^ ;

CREATE OR ALTER procedure SP_CONTRATO_ATUALIZA_CONSUMO (
    CONTRATO DMN_BIGINT_N)
as
declare variable VPRODUTO type of DMN_VCHAR_10;
declare variable VQUANTIDADE type of DMN_QUANTIDADE_D3;
declare variable VVALOR_TOTAL type of DMN_MONEY;
begin
  for
    Select
        vi.codprod   as produto
      , sum(vi.qtde) as quantidade
      , sum(vi.total_liquido) as valor_total
    from TBVENDAS vn
      inner join TVENDASITENS vi on (vi.ano = vn.ano and vi.codcontrol = vn.codcontrol)
      -- Nota fiscal emitida
      left join TBNFE_ENVIADA nf on (nf.empresa = vn.codemp and nf.anovenda = vn.ano and nf.numvenda = vn.codcontrol)
      -- Nota fical de devolucao emitida
      left join TBCOMPRAS dv on (dv.codemp = vn.codemp and dv.dnfe_serie = nf.serie and dv.dnfe_numero = nf.numero and dv.dnfe_modelo = nf.modelo)
    where (vn.status between 3 and 4) -- 3. Venda Finalizada / 4. Nota Emitida
      and (coalesce(dv.ano, 0) = 0)   -- Retiva os itens da nota devolvida para o calculo do saldo
      and (vn.contrato = :contrato)
    group by
        vi.codprod
    Into
        vproduto
      , vquantidade
      , vvalor_total
  do
  begin
    Update TBCONTRATO_ITEM ci Set
        ci.consumo_qtde  = :vquantidade
      , ci.consumo_total = :vvalor_total
    where (ci.contrato = :contrato)
      and (ci.produto  = :vproduto);
  end
end^

SET TERM ; ^

COMMENT ON PARAMETER SP_CONTRATO_ATUALIZA_CONSUMO.CONTRATO IS
'Codigo de controle do contrato';

