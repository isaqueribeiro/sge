


/*------ SYSDBA 26/03/2018 16:55:14 --------*/

ALTER TABLE TBINVENTARIO_ALMOX
    ADD SISTEMA DMN_SMALLINT_N;

COMMENT ON COLUMN TBINVENTARIO_ALMOX.SISTEMA IS
'Sistema';

alter table TBINVENTARIO_ALMOX
alter ANO position 1;

alter table TBINVENTARIO_ALMOX
alter CONTROLE position 2;

alter table TBINVENTARIO_ALMOX
alter TIPO position 3;

alter table TBINVENTARIO_ALMOX
alter SISTEMA position 4;

alter table TBINVENTARIO_ALMOX
alter EMPRESA position 5;

alter table TBINVENTARIO_ALMOX
alter CENTRO_CUSTO position 6;

alter table TBINVENTARIO_ALMOX
alter CONFERIR_ESTOQUE_VENDA position 7;

alter table TBINVENTARIO_ALMOX
alter DATA position 8;

alter table TBINVENTARIO_ALMOX
alter COMPETENCIA position 9;

alter table TBINVENTARIO_ALMOX
alter STATUS position 10;

alter table TBINVENTARIO_ALMOX
alter OBS position 11;

alter table TBINVENTARIO_ALMOX
alter INSERCAO_DATAHORA position 12;

alter table TBINVENTARIO_ALMOX
alter INSERCAO_USUARIO position 13;

alter table TBINVENTARIO_ALMOX
alter FECH_DATAHORA position 14;

alter table TBINVENTARIO_ALMOX
alter FECH_USUARIO position 15;

alter table TBINVENTARIO_ALMOX
alter CANCEL_DATAHORA position 16;

alter table TBINVENTARIO_ALMOX
alter CANCEL_USUARIO position 17;

alter table TBINVENTARIO_ALMOX
alter CANCEL_MOVITO position 18;

alter table TBINVENTARIO_ALMOX
alter BLOQUEAR_MOVIMENTO position 19;




/*------ SYSDBA 26/03/2018 16:55:31 --------*/

ALTER TABLE TBINVENTARIO_ALMOX
ADD CONSTRAINT FK_TBINVENTARIO_ALMOX_SIS
FOREIGN KEY (SISTEMA)
REFERENCES SYS_SISTEMA(SIS_COD);



/*------ SYSDBA 26/03/2018 17:14:35 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tb_inventario_almox_encerrar for tbinventario_almox
active after update position 2
AS
  declare variable lancamento   DMN_GUID_38;
  declare variable produto      DMN_VCHAR_10;
  declare variable quantidade   DMN_QUANTIDADE_D3;
  declare variable estoque      DMN_QUANTIDADE_D3;
  declare variable fracionador  DMN_PERCENTUAL_3;
  declare variable unidade_cns  DMN_SMALLINT_N;
  declare variable custo_medio  DMN_MONEY_4;
  declare variable lote_id_conf DMN_GUID_38;
  declare variable lote_id_resp DMN_GUID_38;
  declare variable usuario      DMN_USUARIO;
begin
  /* Inventario Encerrado */
  if ((old.status <> new.status) and (old.status = 1) and (new.status = 2)) then
  begin

    for
      Select
          i.id
        , coalesce(i.produto, 'XXX')
        , coalesce(i.qtde, 0.0)
        , coalesce(i.estoque, 0.0)
        , coalesce(i.fracionador, 1.0)
        , coalesce(i.custo, 0.0)
        , i.unidade
        , coalesce(nullif(Trim(i.usuario), ''), user)
        , coalesce(i.lote_conferido, 'XXX')
      from TBINVENTARIO_ALMOX_ITEM i
      where i.ano = new.ano
        and i.controle = new.controle
      Into
          lancamento
        , produto
        , quantidade
        , estoque
        , fracionador
        , custo_medio
        , unidade_cns
        , usuario
        , lote_id_conf
    do
    begin

      /* INVENTARIO DE ESTOQUE DE VENDA */
      if ( coalesce(new.centro_custo, 0) = 0 ) then
      begin

        -- Atualizar Estoque de Venda
        Update TBPRODUTO p Set
          p.qtde = :quantidade
        where p.cod = :produto;

        -- Gravar Kardex do Produto
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
            new.empresa
          , :produto
          , new.ano || '/' || new.controle
          , 'BALANCO/INVENTARIO ' || Case new.tipo when 0 then 'GERAL' when 1 then 'PARCIAL' else 'DE EQUIPAMENTOS/IMOBILIZADOS' end
          , new.data
          , :estoque
          , (:estoque - :quantidade) * (-1)
          , :quantidade
          , :usuario
          , substring(trim('Responsavel pelo inventario: ' || new.fech_usuario) from 1 for 40)
        );

      end

      /* INVENTARIO ALMOXARIFADO (ESTOQUE DO CENTRO DE CUSTO) */
      else
      begin

        if (exists(
          Select
              e.empresa
            , e.centro_custo
            , e.produto
            , e.lote
          from TBESTOQUE_ALMOX e
          where e.id           = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where e.id           = :lote_id_conf;

        end
        else
        begin

          Select
            g.hex_uuid_format
          from GET_GUID_UUID_HEX g
          Into
            lote_id_resp;

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
            , id
          ) values (
              new.empresa
            , new.centro_custo
            , :produto
            , 0
            , null
            , null
            , :quantidade   -- Esta quantidade ja esta fracionada para consumo
            , :fracionador
            , :unidade_cns
            , :custo_medio  -- Este valor ja esta fracionado
            , :lote_id_resp
          );

          Update TBINVENTARIO_ALMOX_ITEM ai Set
            ai.lote_resultado = :lote_id_resp
          where ai.id = :lancamento;

        end

        /* SISTEMA_GESTAO_OPME */
        if (coalesce(new.sistema, 0) = 3) then
        begin
          Select
            sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
          from TBESTOQUE_ALMOX e
          where e.empresa      = new.empresa
            and e.centro_custo = coalesce(new.centro_custo, 0)
            and e.produto      = :produto
          Into
            quantidade;

          -- Atualizar Estoque de Venda
          Update TBPRODUTO p Set
            p.qtde = :quantidade
          where p.cod = :produto;
        end 

      end

    end

  end 
end^

SET TERM ; ^




/*------ SYSDBA 26/03/2018 17:16:08 --------*/

COMMENT ON TABLE TBINVENTARIO_ALMOX IS 'Tabela Inventario de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar todos os registros de inventarios de estoque realizados pelo sistema SGI.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/03/2018 - IMR :
        + Criacao do campo SISTEMA para armazer o codigo do sistema responsavel
          pela abertura do inventario. Isso permitira que o encerramento de comporte
          de forma diferente de acordo com o sistema de gestao responsavel.

    04/02/2014 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 26/03/2018 17:28:45 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_ATUALIZAR_CUSTO_PRODUTO (
    PRODUTO DMN_VCHAR_10_KEY,
    VALOR_CUSTO DMN_MONEY,
    SISTEMA DMN_SMALLINT_N)
as
declare variable FRACIONADOR DMN_PERCENTUAL_3;
begin
  -- Abandonar o procedimento, caso o custo informado seja 0 (zero)
  if ( coalesce(:valor_custo, 0.0) <= 0 ) then
    Exit;

  if (exists(
    Select
      p.codigo
    from TBPRODUTO p
    where p.aliquota_tipo = 0
      and p.cod = :produto
  )) then
  begin

    -- 1. Atualizar Custo do Produto no Cadastro
    Update TBPRODUTO p Set
      p.customedio = :valor_custo
    where p.aliquota_tipo = 0
      and p.cod = :produto;

    -- 2. Atualizar o Custo no Estoque Apropriado
    /* 2. SISTEMA_GESTAO_IND, 3. SISTEMA_GESTAO_OPME */
    if ( (coalesce(:sistema, 0) = 2) or (coalesce(:sistema, 0) = 3) ) then
    begin
      Select
        coalesce(nullif(p.fracionador, 0), 1.0)
      from TBPRODUTO p
      where p.aliquota_tipo = 0
        and p.cod = :produto
      Into
        fracionador;

      Update TBESTOQUE_ALMOX e Set
          e.custo_medio = (:valor_custo / :fracionador)
      where e.produto = :produto;

    end 
  end 
end^

SET TERM ; ^

