


/*------ SYSDBA 11/07/2019 10:37:19 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_ALTERA_ESTOQUE_PRODUTO DMN_LOGICO DEFAULT 1;

COMMENT ON COLUMN TBCFOP.CFOP_ALTERA_ESTOQUE_PRODUTO IS
'CFOP altera estoque produto na Entrada/Saida:
0 - Nao
1 - Sim';



/*------ SYSDBA 11/07/2019 10:38:09 --------*/

Update TBCFOP c Set
  c.cfop_altera_estoque_produto = 1
where c.cfop_altera_estoque_produto is null;

/*------ SYSDBA 11/07/2019 10:38:13 --------*/

COMMIT WORK;


COMMENT ON TRIGGER TG_COMPRAS_ATUALIZAR_ESTOQUE IS 'Trigger Atualizar Estoque Venda (Entrada)

    Autor   :   Isaque Marinho Ribeiro
    Data    :

Trigger responsavel por atualizar o estoque de venda do produto, quando este
foi definido para ser movimentado. Atualiza tambem o Valor de Custo Medio do
produto e seu percentual de markup.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/07/2019 - IMR :
        + Inclusao da variavel ALTERAR_ESTOQUE que entra em sintonia com a configuracao
          definida no cadastro de CFOP que estabelece se esse codigo fiscal ira
          alterar o estoque ou nao dos produtos da entrada.

    19/01/2016 - IMR :
        * Reestruturacao da forma de calculo do percentual de markup. Este forma
          definido da maneira que diz a literatura de gestoa comercial.';




/*------ SYSDBA 11/07/2019 11:06:25 --------*/

COMMENT ON TABLE TBCFOP IS 'Tabela CFOP

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar a lista de CFOPs que se pode utilizar na emissao
de NF-e.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/07/2019 - IMR :
        + Criacao do campo CFOP_ALTERA_ESTOQUE_PRODUTO para definir se determinada
          entrada/saida associada ao CFOP ira alterar ou nao o estoque do produto.

    17/05/2016 - IMR :
        + Criacao do campo CFOP_REMESSA para sinalizar as operacoes que identificam
          simples remessas de produtos e/ou servicos.
          Exemplo disso sao as Remessas para Industrializacao por Conta e Ordem do
          adquirente da mercadoria, quando esta nao transitar pelo estabelecimento
          do adquirente.

    10/05/2016 - IMR :
        + Criacao dos campos CFOP_GERAR_TITULO e CFOP_GERAR_DUPLICATA a fim de
          permitir que uma nota de saida ou entrada possam ou nao gerar titulos
          a pagar ou a receber de acordo com a natureza de emissao do NF-e.

    25/06/2014 - IMR :
        + Criacao do campo CFOP_INFORMACAO_FISCO para armazenar o texto padrao
          que sera informado na NF-e quando esta possuir um CFOP com esta
          informacao.';





/*------ SYSDBA 11/07/2019 11:16:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_atualizar_estoque for tbcompras
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_produto numeric(15,2);
  declare variable custo_compra numeric(15,2);
  declare variable custo_medio numeric(15,2);
  declare variable custo_final numeric(15,2);
  declare variable preco_compra DMN_MONEY;
  declare variable percentual_despesas DMN_PERCENTUAL_3;
  declare variable percentual_markup   DMN_PERCENTUAL_3;
  declare variable percentual_margem   DMN_PERCENTUAL_3;
  declare variable alterar_custo   Smallint;
  declare variable alterar_estoque Smallint;
  declare variable movimentar   Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 2)) then
  begin

    -- Marcar como FATURADA a Autorizacao de Compra associada a Entrada
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 3 -- 3. Faturada (NF/NFS registrada no sistema referente a autorizacao)
      , ac.data_fatura = new.dtemiss
    where ac.ano     = new.autorizacao_ano
      and ac.codigo  = new.autorizacao_codigo
      and ac.empresa = new.autorizacao_empresa;

    -- Buscar FLAG de alteracao de custo e estoque de produto
    Select
        cf.cfop_altera_custo_produto
      , cf.cfop_altera_estoque_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo
      , alterar_estoque;

    alterar_custo   = coalesce(:alterar_custo, 1);
    alterar_estoque = coalesce(:alterar_estoque, 1);

    -- Incrimentar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , i.precounit
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.Customedio, 0)
        , Cast((
            ( (i.valor_frete  / coalesce(nullif(i.Qtde, 0), 1)) / i.precounit * 100 ) +
            ( (i.valor_outros / coalesce(nullif(i.Qtde, 0), 1)) / i.precounit * 100 ) +
            coalesce(i.aliquota, 0.0)        +
            coalesce(i.aliquota_pis, 0.0)    +
            coalesce(i.aliquota_cofins, 0.0)
          ) as numeric(15,2)) as percentual_despesas
        , p.percentual_marckup
        , p.percentual_margem
        , coalesce(p.movimenta_estoque, 1)
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Preco_compra
        , Estoque
        , Custo_compra
        , Custo_produto
        , percentual_despesas
        , Percentual_markup
        , Percentual_margem
        , Movimentar
    do
    begin

      -- Confirmar recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 1
      where aci.ano     = new.autorizacao_ano
        and aci.codigo  = new.autorizacao_codigo
        and aci.empresa = new.autorizacao_empresa
        and aci.produto = :Produto;

      if ( (:Custo_compra > 0) and (:Custo_produto > 0) and (:Estoque > 0) ) then
        Custo_medio = (:Custo_compra + :Custo_produto) / 2;
      else
        Custo_medio = :Custo_compra;

      if ( :Movimentar = 1 ) then
        Custo_final = :Custo_medio;
      else
        Custo_final = :Custo_compra;

      /* (Inicio) - Calcular o markup do produto */
      percentual_despesas = coalesce(:percentual_despesas, 0.0) + coalesce(:Percentual_margem, 0.0);

      if ( (100.0 - :percentual_despesas) = 0 ) then
        percentual_despesas = 99.0;

      Percentual_markup = 100.0 / (100.0 - :percentual_despesas); -- Encontrando o indice do Markup
      Percentual_markup = (:Percentual_markup - 1) * 100.0;       -- Transformando o indice em percentual
      /* (Final) - Calcular o markup do produto */

      if ( coalesce(:Percentual_margem, 0.0) < 0 ) then
        Percentual_margem = :Percentual_markup;

      -- Incrementar estoque
      Update TBPRODUTO p Set
          p.Customedio = Case when (:alterar_custo = 1) then :Custo_final else p.Customedio end
        , p.Qtde       = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:Estoque + :Quantidade) else :Estoque end
        /* Percentuais de markup e margem de lucro */
        , p.percentual_marckup = :Percentual_markup
        , p.percentual_margem  = :Percentual_margem
        , p.preco_sugerido     = cast( (:Custo_final + (:Custo_final * :Percentual_markup / 100)) as numeric(15,2) )
        /* Dados da ultima entrada/compra */
        , p.ultima_compra_data   = new.dtemiss
        , p.ultima_compra_valor  = :Preco_compra
        , p.ultima_compra_fornec = new.codforn
      where (p.Cod     = :Produto);

      -- Gravar posicao de estoque
      Update TBCOMPRASITENS i Set
          i.Qtdeantes = :estoque
        , i.Qtdefinal = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

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
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - COMPRA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , current_time
        , :estoque
        , :quantidade
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end
        , new.Usuario
        , Case when (:alterar_custo = 1) then replace('Custo Medio/Final no valor de R$ ' || :Custo_final, '.', ',') else 'Sem ajustes no custo medio (**)' end
      );
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 11/07/2019 11:25:40 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_compras_cancelar for tbcompras
active after update position 2
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable custo_compra numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable alterar_custo   Smallint;
  declare variable alterar_estoque Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then
  begin

    -- Buscar FLAG de alteracao de custo e estoque de produto
    Select
        cf.cfop_altera_custo_produto
      , cf.cfop_altera_estoque_produto
    from TBCFOP cf
    where cf.cfop_cod = new.nfcfop
    Into
        alterar_custo
      , alterar_estoque;

    alterar_custo   = coalesce(:alterar_custo, 1);
    alterar_estoque = coalesce(:alterar_estoque, 1);

    -- Marcar como AUTORIZADA a Autorizacao de Compra associada a Entrada que ja esta como FATURADA
    Update TBAUTORIZA_COMPRA ac Set
        ac.status      = 2  -- 2. Autorizada
      , ac.data_fatura = null
    where ac.ano     = coalesce(new.autorizacao_ano, 0)
      and ac.codigo  = coalesce(new.autorizacao_codigo, 0)
      and ac.empresa = coalesce(new.autorizacao_empresa, '0')
      and ac.status  = 3; -- 3. Faturada

    -- Decrementar Estoque do produto
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(i.Customedio, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TBCOMPRASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          Produto
        , Empresa
        , Quantidade
        , Estoque
        , custo_compra
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      -- Remover a confirmacao de recebimento dos produtos autorizados na Autorizacao de Compras
      Update TBAUTORIZA_COMPRAITEM aci Set
        aci.confirmado_recebimento = 0
      where aci.ano     = coalesce(new.autorizacao_ano, 0)
        and aci.codigo  = coalesce(new.autorizacao_codigo, 0)
        and aci.empresa = coalesce(new.autorizacao_empresa, '0')
        and aci.produto = :Produto
        and aci.confirmado_recebimento = 1;

      -- Decrementar estoque
      Update TBPRODUTO p Set
        p.Qtde       = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque - :quantidade) else :estoque end
      where p.Cod    = :Produto;

      -- Decrementar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :lote_id);
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
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - COMPRA CANCELADA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , :Estoque
        , :Quantidade
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque - :quantidade) else :estoque end
        , new.Cancel_usuario
        , Case when (:alterar_custo = 1) then replace('Custo Final no valor de R$ ' || :custo_compra, '.', ',') else 'Sem ajustes no custo medio (**)' end
      );
    end
     
    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Fornecedor = new.Codforn
      and m.Compra_ano = new.Ano
      and m.Compra_num = new.Codcontrol;

    -- Cancelar Duplicata (Contas A Pagar)
    Update TBCONTPAG cp Set
      cp.Situacao = 0 -- Cancelado
    where cp.Empresa   = new.Codemp
      and cp.codforn   = new.Codforn
      and cp.anocompra = new.Ano
      and cp.numcompra = new.Codcontrol
      and cp.quitado   = 0;

    -- Cancelar Registro de Nota Fiscal Eletronica
    Update TBNFE_ENVIADA nfe Set
      nfe.cancelada = 1
    where nfe.empresa   = new.codemp
      and nfe.serie     = new.nfserie
      and nfe.numero    = new.nf
      and nfe.anocompra = new.ano
      and nfe.numcompra = new.codcontrol;
  end
end^

SET TERM ; ^




/*------ SYSDBA 11/07/2019 11:41:29 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable alterar_estoque Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    -- Buscar FLAG de alteracao de custo e estoque de produto
    Select
        cf.cfop_altera_estoque_produto
    from TBCFOP cf
    where cf.cfop_cod = new.cfop
    Into
        alterar_estoque;

    alterar_estoque = coalesce(:alterar_estoque, 1);

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      estoque = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod = :Produto;

      -- Retornar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt + (:quantidade * e.fracionador)
        where (e.id = :lote_id);
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
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then :estoque - :quantidade else :estoque end
        , :quantidade
        , :estoque
        , new.Cancel_usuario
        , replace('Venda no valor de R$ ' || :valor_produto, '.', ',')
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
      , r.enviado  = 0 -- Enviar boleto novamente para o banco
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;

    -- Cancelar Registro de Nota Fiscal Eletronica
    Update TBNFE_ENVIADA nfe Set
      nfe.cancelada = 1
    where nfe.empresa  = new.codemp
      and nfe.serie    = new.serie
      and nfe.numero   = new.nfe
      and nfe.anovenda = new.ano
      and nfe.numvenda = new.codcontrol;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 11/07/2019 11:42:14 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_cancelar for tbvendas
active after update position 3
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable alterar_estoque Smallint;
begin
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 5)) then /* 5. Cancelada */
  begin

    -- Buscar FLAG de alteracao de estoque de produto
    Select
        cf.cfop_altera_estoque_produto
    from TBCFOP cf
    where cf.cfop_cod = new.cfop
    Into
        alterar_estoque;

    alterar_estoque = coalesce(:alterar_estoque, 1);

    -- Retornar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.Qtde
        , coalesce(p.Qtde, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)
        , nullif(trim(i.lote_id), '')
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , quantidade
        , estoque
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
    do
    begin
      estoque = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque + :quantidade) else :estoque end;

      -- Retornar estoque
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where p.Cod = :Produto;

      -- Retornar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt + (:quantidade * e.fracionador)
        where (e.id = :lote_id);
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
        , new.Ano || '/' || new.Codcontrol
        , Trim('ENTRADA - VENDA CANCELADA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then :estoque - :quantidade else :estoque end
        , :quantidade
        , :estoque
        , new.Cancel_usuario
        , replace('Venda no valor de R$ ' || :valor_produto, '.', ',')
      );

    end

    -- Cancelar Contas A Receber (Apenas parcelas nao pagas)
    Update TBCONTREC r Set
        r.status   = 'CANCELADA'
      , r.Situacao = 0 -- Cancelado
      , r.enviado  = 0 -- Enviar boleto novamente para o banco
    where r.anovenda = new.ano
      and r.numvenda = new.codcontrol
      and coalesce(r.Valorrectot, 0) = 0;

    -- Cancelar Movimento Caixa
    Update TBCAIXA_MOVIMENTO m Set
      m.Situacao = 0 -- Cancelado
    where m.Empresa = new.Codemp
      and m.Cliente = new.Codcli
      and m.Venda_ano = new.Ano
      and m.Venda_num = new.Codcontrol;

    -- Cancelar Registro de Nota Fiscal Eletronica
    Update TBNFE_ENVIADA nfe Set
      nfe.cancelada = 1
    where nfe.empresa  = new.codemp
      and nfe.serie    = new.serie
      and nfe.numero   = new.nfe
      and nfe.anovenda = new.ano
      and nfe.numvenda = new.codcontrol;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 11/07/2019 11:48:20 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_vendas_estoque_atualizar for tbvendas
active after update position 1
AS
  declare variable produto varchar(10);
  declare variable empresa varchar(18);
  declare variable cliente Integer;
  declare variable lote_id DMN_GUID_38;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable estoque_lt DMN_QUANTIDADE_D3;
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable valor_produto numeric(15,2);
  declare variable Movimentar Smallint;
  declare variable referencia DMN_VCHAR_15;
  declare variable alterar_estoque Smallint;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

    -- Buscar FLAG de alteracao de estoque de produto
    Select
        cf.cfop_altera_estoque_produto
    from TBCFOP cf
    where cf.cfop_cod = new.cfop
    Into
        alterar_estoque;

    alterar_estoque = coalesce(:alterar_estoque, 1);

    -- Baixar produto do Estoque
    for
      Select
          i.Codprod
        , i.Codemp
        , i.codcliente
        , i.Qtde
        , coalesce(p.Qtde, 0)
        --, coalesce(p.Reserva, 0)
        , coalesce(p.Preco, 0)
        , coalesce(p.movimenta_estoque, 1)
        , coalesce(e.qtde, 0)  -- Estoque fracionado do lote
        , nullif(trim(i.lote_id), '')
        , upper(coalesce(trim(i.referencia), ''))
      from TVENDASITENS i
        inner join TBPRODUTO p on (p.Cod = i.Codprod)
        left join TBESTOQUE_ALMOX e on (e.id = i.lote_id)
      where i.Ano = new.Ano
        and i.Codcontrol = new.Codcontrol
      into
          produto
        , empresa
        , cliente
        , quantidade
        , estoque
        --, reserva
        , valor_produto
        , Movimentar
        , estoque_lt
        , lote_id
        , referencia
    do
    begin
      --reserva = :reserva - :Quantidade;  -- Descontinuada RESERVA
      estoque = Case when (:movimentar = 1 and :alterar_estoque = 1) then (:estoque - :quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

      -- Baixar estoque do Lote
      if ( (:movimentar = 1 and :alterar_estoque = 1) and (:lote_id is not null) ) then
      begin
        Update TBESTOQUE_ALMOX e Set
          e.qtde  = :estoque_lt - (:quantidade * e.fracionador)
        where (e.id = :lote_id);
      end

      -- Gravar posicao de estoque
      Update TVENDASITENS i Set
        i.Qtdefinal = :Estoque
      where i.Ano        = new.Ano
        and i.Codcontrol = new.Codcontrol
        and i.Codemp     = new.Codemp
        and i.Codprod    = :Produto;

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
        , new.Ano || '/' || new.Codcontrol
        , Trim('SAIDA - VENDA ' || Case when (:movimentar = 1 and :alterar_estoque = 1) then '' else '(*)' end)
        , Current_time
        , Case when (:movimentar = 1 and :alterar_estoque = 1) then :estoque + :quantidade else :estoque end
        , :quantidade
        , :estoque
        , new.Usuario
        , replace('Venda no valor de R$ ' || :valor_produto, '.', ',')
      );

      -- Inserir armazenar codigo de referencia do produto no cliente
      if (:referencia <> '') then
        execute procedure SET_PRODUTO_CLIENTE(:produto, :cliente, :referencia);
    end
     
  end 
end^

SET TERM ; ^

