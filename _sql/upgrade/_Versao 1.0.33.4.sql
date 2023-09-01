
/*------ SYSDBA 25/08/2023 15:23:02 --------*/

ALTER TABLE TBUSERS
    ADD CENTRO_CUSTO DMN_INTEGER_N;

COMMENT ON COLUMN TBUSERS.CENTRO_CUSTO IS
'Centro de Custo Padrao';



/*------ SYSDBA 31/08/2023 09:50:44 --------*/

execute block
as
  declare variable codigo DMN_INTEGER_N;
  declare variable login DMN_USUARIO;
begin
  Select
    max(usr.codigo)
  from TBUSERS usr
  Into
    codigo;

  codigo = coalesce(:codigo, 0) + 1;

  for
    Select
      usr.nome
    from TBUSERS usr
    where (coalesce(usr.codigo, 0) = 0)
    Order by
      usr.nome
    Into
      login
  do
  begin
    Update TBUSERS usr Set
      usr.codigo = :codigo
    where (usr.nome = :login)
      and (coalesce(usr.codigo, 0) = 0);

    codigo = (:codigo + 1);
  end
end;

/*------ SYSDBA 31/08/2023 09:50:48 --------*/

COMMIT WORK;



/*------ SYSDBA 31/08/2023 15:56:12 --------*/

CREATE INDEX IDX_TBCOMPRASITENS_DTENTA
ON TBCOMPRASITENS (DTENT);




/*------ SYSDBA 31/08/2023 15:56:36 --------*/

CREATE DESCENDING INDEX IDX_TBCOMPRASITENS_DTENTD
ON TBCOMPRASITENS (DTENT);




/*------ SYSDBA 31/08/2023 19:10:25 --------*/

SET TERM ^ ;

create or alter procedure SP_UPD_CUSTO_GERAL_ESTOQUE
as
declare variable EMPRESA type of DMN_CNPJ;
declare variable PRODUTO type of DMN_VCHAR_10;
declare variable ANO type of DMN_SMALLINT_N;
declare variable CUSTO type of DMN_MONEY;
declare variable CUSTO_FRACINADO type of DMN_MONEY_4;
declare variable CONTROLE type of DMN_BIGINT_N;
declare variable CUSTO_TOTAL type of DMN_MONEY;
begin
  for
    Select
        tmp.empresa
      , tmp.produto
      , tmp.ano
      , ci.customedio as custo
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
      , custo
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
end^

SET TERM ; ^

COMMENT ON PROCEDURE SP_UPD_CUSTO_GERAL_ESTOQUE IS 'Stored Procedure Atualizar Custo Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/08/2023

Atualizacao Geral de custo dos produtos em estoque e suas movimentacoes.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    31/08/2023 - IMR :
        + Criacao e documentacao do objeto.';

