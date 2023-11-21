
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


ALTER TABLE TBFUNCAO
    ADD ATIVO DMN_LOGICO;

COMMENT ON COLUMN TBFUNCAO.ATIVO IS
'Ativo:
0 - Nao
1 - Sim';

UPDATE TBFUNCAO
SET ATIVO = 1;




/*------ SYSDBA 21/11/2023 20:17:52 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque_vd     DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable fracionador_cc DMN_PERCENTUAL_3;
  declare variable unidade_cns    DMN_SMALLINT_N;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable Movimentar Smallint;
begin
  /* TRIGGER APENAS PARA O SISTEMA SGI */
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0)
        , coalesce(nullif(i.custo_unitario, 0.0), p.customedio, 0.0)
        , coalesce(i.fracionador, nullif(p.fracionador, 0), 1)
        , coalesce(i.unidade_fracao, p.codunidade_fracionada)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque_vd
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque_vd  = Case when :Movimentar = 1 then (:estoque_vd - :Quantidade) else :estoque_vd end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :estoque_vd
      where (p.Cod  = :Produto);

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
      )) then
      begin

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade_frc                -- Informando a quantidade fracionada
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador  -- Informando o custo medio fracionado
        );

      end
      else
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
          , ea.fracionador
          , ea.custo_medio
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            estoque_cc
          , fracionador_cc
          , custo_cc;

        -- Calcular o Custo Medio (Fracionado) para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        custo_cc       = coalesce(:custo_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);

        custo_medio = cast(
            Case when ((:estoque_cc <= 0) or (:custo_cc = 0.0))
              then (:custo_produto / :fracionador)
              else ((:custo_cc + (:custo_produto / :fracionador)) / 2) end
          as DMN_MONEY);

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = :estoque_cc + :quantidade_frc -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                  -- Informando o custo medio fracionado anteriormente
          , ea.unidade     = :unidade_cns
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote;

      end

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.ano || '/' || new.controle
        , Trim('SAIDA - APROPRIACAO DE ESTOQUE ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :estoque_vd + :Quantidade
        , :Quantidade
        , :estoque_vd
        , new.Usuario
        , replace('Custo medio no valor de ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 21/11/2023 20:19:11 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_estoque for tbapropriacao_almox
active after update position 2
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque_vd     DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable fracionador_cc DMN_PERCENTUAL_3;
  declare variable unidade_cns    DMN_SMALLINT_N;
  declare variable custo_produto DMN_MONEY;
  declare variable custo_cc      DMN_MONEY;
  declare variable custo_medio   DMN_MONEY;
  declare variable Movimentar Smallint;
begin
  /* TRIGGER APENAS PARA O SISTEMA SGI */
  if ( (old.status <> new.status) and (new.status = 2) ) then /* Encerrada */
  begin

    empresa       = new.empresa;
    centro_custo  = new.centro_custo;

    -- Baixar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0)
        , coalesce(nullif(i.custo_unitario, 0.0), p.customedio, 0.0)
        , coalesce(i.fracionador, nullif(p.fracionador, 0), 1)
        , coalesce(i.unidade_fracao, p.codunidade_fracionada)
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque_vd
        , custo_produto
        , fracionador
        , unidade_cns
        , movimentar
    do
    begin
      lote = 0;

      estoque_vd  = Case when :Movimentar = 1 then (:estoque_vd - :Quantidade) else :estoque_vd end;
      fracionador = Case when :fracionador <= 0 then 1 else :fracionador end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde = :estoque_vd
      where (p.Cod  = :Produto);

      -- Gravar apropriacao de estoque para o centro de custo
      if (not exists(
        Select
          ea.qtde
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
      )) then
      begin

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , null
          , null
          , :quantidade_frc                -- Informando a quantidade fracionada
          , :fracionador
          , :unidade_cns
          , :custo_produto / :fracionador  -- Informando o custo medio fracionado
        );

      end
      else
      begin

        -- Verificar se ja existe estoque para o Centro de Custo
        Select
            ea.qtde
          , ea.fracionador
          , ea.custo_medio
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote
        Into
            estoque_cc
          , fracionador_cc
          , custo_cc;

        -- Calcular o Custo Medio (Fracionado) para Apropriacao de Estoque
        estoque_cc     = coalesce(:estoque_cc, 0.0);
        custo_cc       = coalesce(:custo_cc, 0.0);
        fracionador_cc = coalesce(:fracionador_cc, 1.0);

        custo_medio = cast(
          Case when ((:estoque_cc <= 0) or (:custo_cc = 0.0))
            then (:custo_produto / :fracionador)
            else ((:custo_cc + (:custo_produto / :fracionador)) / 2) end
          as DMN_MONEY);

        Update TBESTOQUE_ALMOX ea Set
            ea.qtde        = :estoque_cc + :quantidade_frc -- Informando a quantidade fracionada
          , ea.custo_medio = :custo_medio                  -- Informando o custo medio fracionado anteriormente
          , ea.unidade     = :unidade_cns
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
          and ea.lote         = :lote;

      end

      -- Gerar historico
      Insert Into TBPRODHIST (
          Codempresa
        , Codprod
        , Doc
        , Historico
        , Dthist
        , Qtdeatual
        , Qtdenova
        , Qtdefinal
        , Resp
        , Motivo
      ) values (
          :Empresa
        , :Produto
        , new.ano || '/' || new.controle
        , Trim('SAIDA - APROPRIACAO DE ESTOQUE ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :estoque_vd + :Quantidade
        , :Quantidade
        , :estoque_vd
        , new.Usuario
        , replace('Custo medio no valor de ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^

