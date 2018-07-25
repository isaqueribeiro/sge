


/*------ SYSDBA 25/07/2018 12:16:26 --------*/

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

        custo_medio = Case when ( (:estoque_cc <= 0) or (:custo_cc = 0.0) )
            then (:custo_produto / :fracionador)
            else ( ((:custo_cc * :estoque_cc) + ((:custo_produto / :fracionador) * (:quantidade * :fracionador))) / 2 ) end;

        Update TBESTOQUE_ALMOX ea Set
            --ea.qtde        = :estoque_cc + (:quantidade * :fracionador) -- Informando a quantidade fracionada
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

