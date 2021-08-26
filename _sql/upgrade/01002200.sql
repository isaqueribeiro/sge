


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




/*------ SYSDBA 27/03/2018 09:23:22 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    SISTEMA smallint,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
begin
  if (exists(
    Select
      cc.centro_custo
    from TBCENTRO_CUSTO_EMPRESA cc
    where cc.centro_custo = :centro_custo
      and cc.empresa      = :empresa
  ) and (trim(coalesce(:lote_descricao, '')) <> '')) then
  begin
    -- Buscar identificacao do Lote
    Select
        ea.id
      , ea.qtde
      , ea.lote
    from TBESTOQUE_ALMOX ea
    where ea.empresa      = :empresa
      and ea.centro_custo = :centro_custo
      and ea.produto      = :produto
      and ea.descricao    = :lote_descricao
    Into
        lote_id
      , qtde
      , lote;

    qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade;

    if ( trim(coalesce(:lote_id, '')) = '' ) then
    begin
        Select
          g.hex_uuid_format
        from GET_GUID_UUID_HEX g
        Into
          lote_id;

        Select
            max(ea.lote)
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
        Into
            lote;

        lote = coalesce(:lote, 0) + 1;

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , descricao
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
          , id
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , trim(:lote_descricao)
          , :lote_fab
          , :lote_val
          , :qtde_nova   -- Informando a quantidade fracionada
          , :fracionador
          , :unidade
          , null         -- Informando o custo medio fracionado
          , :lote_id
        );
    end
    else
    begin
      Update TBESTOQUE_ALMOX ea Set
          ea.qtde        = :qtde_nova -- Informando a quantidade fracionada
        , ea.fracionador = :fracionador
        , ea.unidade     = :unidade
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;
    end

    /* SISTEMA_GESTAO_OPME */
    if (coalesce(:sistema, 0) = 3) then
    begin
      Select
        sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
      from TBESTOQUE_ALMOX e
      where e.empresa      = :empresa
        and e.centro_custo = :centro_custo
        and e.produto      = :produto
      Into
        qtde_nova;

      -- Atualizar Estoque de Venda
      Update TBPRODUTO p Set
        p.qtde = :qtde_nova
      where p.cod = :produto;
    end

    suspend;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 09:27:47 --------*/

ALTER TABLE TBAJUSTESTOQ
    ADD SISTEMA DMN_SMALLINT_N;

COMMENT ON COLUMN TBAJUSTESTOQ.SISTEMA IS
'Sistema';

alter table TBAJUSTESTOQ
alter CONTROLE position 1;

alter table TBAJUSTESTOQ
alter CODPROD position 2;

alter table TBAJUSTESTOQ
alter CODEMPRESA position 3;

alter table TBAJUSTESTOQ
alter CODFORN position 4;

alter table TBAJUSTESTOQ
alter SISTEMA position 5;

alter table TBAJUSTESTOQ
alter QTDEATUAL position 6;

alter table TBAJUSTESTOQ
alter QTDENOVA position 7;

alter table TBAJUSTESTOQ
alter QTDEFINAL position 8;

alter table TBAJUSTESTOQ
alter FRACIONADOR position 9;

alter table TBAJUSTESTOQ
alter MOTIVO position 10;

alter table TBAJUSTESTOQ
alter DOC position 11;

alter table TBAJUSTESTOQ
alter DTAJUST position 12;

alter table TBAJUSTESTOQ
alter USUARIO position 13;

alter table TBAJUSTESTOQ
alter LOTE_ID position 14;

alter table TBAJUSTESTOQ
alter LOTE_DESCRICAO position 15;

alter table TBAJUSTESTOQ
alter LOTE_DATA_FAB position 16;

alter table TBAJUSTESTOQ
alter LOTE_DATA_VAL position 17;




/*------ SYSDBA 27/03/2018 09:28:06 --------*/

ALTER TABLE TBAJUSTESTOQ
ADD CONSTRAINT FK_TBAJUSTESTOQ_SISTEMA
FOREIGN KEY (SISTEMA)
REFERENCES SYS_SISTEMA(SIS_COD);




/*------ SYSDBA 27/03/2018 09:29:58 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
  declare variable estoque DMN_QUANTIDADE_D3;
begin
  /* SISTEMA_GESTAO_OPME */
  if (coalesce(new.sistema, 0) <> 3) then
  begin

      Select
        coalesce(p.qtde, 0.0)
      from TBPRODUTO p
      where p.cod = new.codprod
      Into
        estoque;
    
      estoque = coalesce(:estoque, 0.0) + coalesce(new.qtdenova, 0.0);
    
      update TBPRODUTO p set
        p.qtde = :estoque
      where p.cod = new.codprod;
    
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
          new.codempresa
        , new.codprod
        , new.doc
        , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , new.dtajust
        , new.qtdeatual
        , new.qtdenova
        , new.qtdefinal
        , coalesce(new.Usuario, user)
        , substring(trim(new.motivo) from 1 for 250)
      );

  end
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 09:36:34 --------*/

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

      end

    end

  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 09:44:34 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
  declare variable estoque DMN_QUANTIDADE_D3;
  declare variable estoque_por_lote DMN_SMALLINT_N;
begin
  Select
      coalesce(p.qtde, 0.0)
    , p.estoque_aprop_lote
  from TBPRODUTO p
  where p.cod = new.codprod
  Into
      estoque
    , estoque_por_lote;

  if (coalesce(:estoque_por_lote, 0) = 0) then
  begin
      estoque = coalesce(:estoque, 0.0) + coalesce(new.qtdenova, 0.0);
    
      update TBPRODUTO p set
        p.qtde = :estoque
      where p.cod = new.codprod;
    
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
          new.codempresa
        , new.codprod
        , new.doc
        , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , new.dtajust
        , new.qtdeatual
        , new.qtdenova
        , new.qtdefinal
        , coalesce(new.Usuario, user)
        , substring(trim(new.motivo) from 1 for 250)
      );
  end
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_AJUST_ESTOQUE_HISTORICO IS 'Trigger Ajuste Manual Estoque (Venda).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/02/2014

Trigger responsavel por ajustar a quantidade em esoque do produto quando o regitro
de ajuste for encerrado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    27/03/2018 - IMR :
        * Trigger modificada para ser executada apenas quando o estoque do
          material/produto nao for gerenciado por lote.
          Para os estoque gerenciados por lote existe a stored procedure "SET_LOTE_PRODUTO".

    20/05/2014 - IMR :
        * Mudanca da trigger para que o estoque do produto seja ajustado,
          independente da empresa a qual pertenca.';




/*------ SYSDBA 27/03/2018 09:49:37 --------*/

COMMENT ON TABLE TBAJUSTESTOQ IS 'Tabela Ajuste Manual de Estoque

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/02/2015

Tabela responsavel por armazenar os dados necesarios aos ajustes de estoques
lancados manualmente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    26/03/2018 - IMR :
        + Criacao do campo SISTEMA para armazer o codigo do sistema responsavel
          pela abertura do registro.

    04/02/2014 - IMR :
        * Documentacao da tabela.';




/*------ SYSDBA 27/03/2018 09:53:19 --------*/

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
          where e.id = :lote_id_conf
        )) then
        begin

          Update TBESTOQUE_ALMOX e Set
            e.qtde = :quantidade
          where e.id = :lote_id_conf;

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

      end

    end

  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 09:54:54 --------*/

COMMENT ON TABLE TBAPROPRIACAO_ALMOX IS 'Tabela de Apropriacao de Estoque (Almoxarifado)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   02/01/2015

Tabela responsavel por armazenar todos os registros de apropriacao de estoque para as entradas finalizadas de produtos lancadas no Sistema de Gestao Industrial.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    03/01/2014 - IMR :
        * Documentacao da tabela.

    13/01/2014 - IMR :
        * Revisao da documentacao dos objetos.
          Esta apropriacao de estoque se aplica apenas ao sistema SGI.';




/*------ SYSDBA 27/03/2018 10:10:04 --------*/

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
        , replace('Custo médio no valor de R$ ' || :custo_produto, '.', ',')
      );
    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 10:10:14 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_apropriacao_almox_cancelar for tbapropriacao_almox
active after update position 3
AS
  declare variable empresa      varchar(18);
  declare variable centro_custo Integer;
  declare variable produto varchar(10);
  declare variable lote    Integer;
  declare variable estoque        DMN_QUANTIDADE_D3;
  declare variable estoque_cc     DMN_QUANTIDADE_D3;
  declare variable estoque_cc_frc DMN_QUANTIDADE_D3;
  declare variable quantidade     DMN_QUANTIDADE_D3;
  declare variable quantidade_frc DMN_QUANTIDADE_D3;
  declare variable fracionador    DMN_PERCENTUAL_3;
  declare variable Movimentar Smallint;
begin
  /* TRIGGER APENAS PARA O SISTEMA SGI */
  if ( (old.status <> new.status) and (new.status = 3) ) then /* Cancelada */
  begin

    empresa      = new.empresa;
    centro_custo = new.centro_custo;

    -- Retornar produto do Estoque
    for
      Select
          i.produto
        , i.qtde
        , i.qtde_fracionada
        , coalesce(p.Qtde, 0) -- Quantidade inteira
        , coalesce(p.movimenta_estoque, 1)
      from TBAPROPRIACAO_ALMOX_ITEM i
        inner join TBPRODUTO p on (p.Cod = i.produto)
      where i.ano      = new.ano
        and i.controle = new.controle
      into
          produto
        , quantidade
        , quantidade_frc
        , estoque
        , Movimentar
    do
    begin
      estoque = Case when :Movimentar = 1 then (:Estoque + :Quantidade) else :Estoque end;
      lote    = 0;

      -- Retornar estoque geral
      Update TBPRODUTO p Set
        p.Qtde = :Estoque
      where (p.Cod = :Produto);

      -- Retirar apropriacao das quantidades em estoque da Empresa/Centro de Custo
      Select
          ea.qtde / coalesce(nullif(ea.fracionador, 0), 1) -- Recuperando a quantidade fracionada transformada em inteira
        , ea.qtde
        , coalesce(nullif(ea.fracionador, 0), 1)
      from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
      Into
          estoque_cc     -- Quantidade Inteira
        , estoque_cc_frc -- Quantidade Fracionada
        , fracionador;   -- Fracionador

      estoque_cc     = coalesce(:estoque_cc, 0.0) - :quantidade;
      estoque_cc_frc = coalesce(:estoque_cc_frc, 0.0) - :quantidade_frc;

      Update TBESTOQUE_ALMOX ea Set
          --ea.qtde  = :estoque_cc * :fracionador -- Devolvendo a quantidade fracionada atualizada
          ea.qtde  = :estoque_cc_frc -- Devolvendo a quantidade fracionada atualizada
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;

      -- Remover registro de estoque apropriadado com quantidade zerada
      Delete from TBESTOQUE_ALMOX ea
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote
        and ea.qtde         = 0;

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
        , Trim('ENTRADA - APROPRIACAO CANCELADA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque - :Quantidade
        , :Quantidade
        , :Estoque
        , new.Cancel_usuario
        , 'Valor de Custo (R$) fixado no cadastro do produto.'
      );

    end

  end
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 11:08:32 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    SISTEMA smallint,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable ESTOQUE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
declare variable usuario varchar(60);
begin
  if (exists(
    Select
      cc.centro_custo
    from TBCENTRO_CUSTO_EMPRESA cc
    where cc.centro_custo = :centro_custo
      and cc.empresa      = :empresa
  ) and (trim(coalesce(:lote_descricao, '')) <> '')) then
  begin
    -- Buscar identificacao do Lote
    Select
        ea.id
      , ea.qtde
      , ea.lote
    from TBESTOQUE_ALMOX ea
    where ea.empresa      = :empresa
      and ea.centro_custo = :centro_custo
      and ea.produto      = :produto
      and ea.descricao    = :lote_descricao
    Into
        lote_id
      , qtde
      , lote;

    qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
      , coalesce(pr.qtde, 0.000)
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade
      , estoque;

    if ( trim(coalesce(:lote_id, '')) = '' ) then
    begin
        Select
          g.hex_uuid_format
        from GET_GUID_UUID_HEX g
        Into
          lote_id;

        Select
            max(ea.lote)
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
        Into
            lote;

        lote = coalesce(:lote, 0) + 1;

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , descricao
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
          , id
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , trim(:lote_descricao)
          , :lote_fab
          , :lote_val
          , :qtde_nova   -- Informando a quantidade fracionada
          , :fracionador
          , :unidade
          , null         -- Informando o custo medio fracionado
          , :lote_id
        );
    end
    else
    begin
      Update TBESTOQUE_ALMOX ea Set
          ea.qtde        = :qtde_nova -- Informando a quantidade fracionada
        , ea.fracionador = :fracionador
        , ea.unidade     = :unidade
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;
    end

    /* SISTEMA_GESTAO_OPME */
    if (coalesce(:sistema, 0) = 3) then
    begin
      Select
        sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
      from TBESTOQUE_ALMOX e
      where e.empresa      = :empresa
        and e.centro_custo = :centro_custo
        and e.produto      = :produto
      Into
        qtde_nova;

      -- Atualizar Estoque de Venda
      Update TBPRODUTO p Set
        p.qtde = :qtde_nova
      where p.cod = :produto;

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
          :empresa
        , :produto
        , 'LOTE'
        , case when ((:qtde_nova - :estoque) > 0.000) then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , current_timestamp
        , :estoque
        , (:qtde_nova - :estoque)
        , :qtde_nova
        , coalesce(:usuario, user)
        , null
      );
    end

    suspend;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 11:09:08 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    SISTEMA smallint,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable ESTOQUE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
declare variable usuario varchar(60);
begin
  if (exists(
    Select
      cc.centro_custo
    from TBCENTRO_CUSTO_EMPRESA cc
    where cc.centro_custo = :centro_custo
      and cc.empresa      = :empresa
  ) and (trim(coalesce(:lote_descricao, '')) <> '')) then
  begin
    -- Buscar identificacao do Lote
    Select
        ea.id
      , ea.qtde
      , ea.lote
    from TBESTOQUE_ALMOX ea
    where ea.empresa      = :empresa
      and ea.centro_custo = :centro_custo
      and ea.produto      = :produto
      and ea.descricao    = :lote_descricao
    Into
        lote_id
      , qtde
      , lote;

    qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
      , coalesce(pr.qtde, 0.000)
      , pr.usuario
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade
      , estoque
      , usuario;

    if ( trim(coalesce(:lote_id, '')) = '' ) then
    begin
        Select
          g.hex_uuid_format
        from GET_GUID_UUID_HEX g
        Into
          lote_id;

        Select
            max(ea.lote)
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
        Into
            lote;

        lote = coalesce(:lote, 0) + 1;

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , descricao
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
          , id
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , trim(:lote_descricao)
          , :lote_fab
          , :lote_val
          , :qtde_nova   -- Informando a quantidade fracionada
          , :fracionador
          , :unidade
          , null         -- Informando o custo medio fracionado
          , :lote_id
        );
    end
    else
    begin
      Update TBESTOQUE_ALMOX ea Set
          ea.qtde        = :qtde_nova -- Informando a quantidade fracionada
        , ea.fracionador = :fracionador
        , ea.unidade     = :unidade
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;
    end

    /* SISTEMA_GESTAO_OPME */
    if (coalesce(:sistema, 0) = 3) then
    begin
      Select
        sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
      from TBESTOQUE_ALMOX e
      where e.empresa      = :empresa
        and e.centro_custo = :centro_custo
        and e.produto      = :produto
      Into
        qtde_nova;

      -- Atualizar Estoque de Venda
      Update TBPRODUTO p Set
        p.qtde = :qtde_nova
      where p.cod = :produto;

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
          :empresa
        , :produto
        , 'LOTE'
        , case when ((:qtde_nova - :estoque) > 0.000) then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , current_timestamp
        , :estoque
        , (:qtde_nova - :estoque)
        , :qtde_nova
        , coalesce(:usuario, user)
        , null
      );
    end

    suspend;
  end 
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 11:10:06 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_ajust_estoque_historico for tbajustestoq
active after insert position 0
AS
  declare variable estoque DMN_QUANTIDADE_D3;
  declare variable estoque_por_lote DMN_SMALLINT_N;
begin
  Select
      coalesce(p.qtde, 0.0)
    , p.estoque_aprop_lote
  from TBPRODUTO p
  where p.cod = new.codprod
  Into
      estoque
    , estoque_por_lote;

  /* Caso o material/produto nao seja gerenciado por Lote */
  if (coalesce(:estoque_por_lote, 0) = 0) then
  begin
      estoque = coalesce(:estoque, 0.0) + coalesce(new.qtdenova, 0.0);
    
      update TBPRODUTO p set
        p.qtde = :estoque
      where p.cod = new.codprod;
    
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
          new.codempresa
        , new.codprod
        , new.doc
        , case when new.qtdenova > 0 then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , new.dtajust
        , new.qtdeatual
        , new.qtdenova
        , new.qtdefinal
        , coalesce(new.Usuario, user)
        , substring(trim(new.motivo) from 1 for 250)
      );
  end
end^

SET TERM ; ^




/*------ SYSDBA 27/03/2018 14:22:34 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_LOTE_PRODUTO (
    EMPRESA varchar(18),
    CENTRO_CUSTO integer,
    SISTEMA smallint,
    PRODUTO varchar(10),
    LOTE_DESCRICAO varchar(30),
    LOTE_FAB date,
    LOTE_VAL date,
    LOTE_QTDE numeric(18,3) = 0)
returns (
    LOTE_ID varchar(38))
as
declare variable LOTE integer;
declare variable QTDE_NOVA numeric(18,3);
declare variable QTDE numeric(18,3);
declare variable ESTOQUE numeric(18,3);
declare variable FRACIONADOR numeric(15,3);
declare variable UNIDADE smallint;
declare variable USUARIO varchar(60);
begin
  if (exists(
    Select
      cc.centro_custo
    from TBCENTRO_CUSTO_EMPRESA cc
    where cc.centro_custo = :centro_custo
      and cc.empresa      = :empresa
  ) and (trim(coalesce(:lote_descricao, '')) <> '')) then
  begin
    -- Buscar identificacao do Lote
    Select
        ea.id
      , ea.qtde
      , ea.lote
    from TBESTOQUE_ALMOX ea
    where ea.empresa      = :empresa
      and ea.centro_custo = :centro_custo
      and ea.produto      = :produto
      and ea.descricao    = :lote_descricao
    Into
        lote_id
      , qtde
      , lote;

    --qtde_nova = coalesce(:qtde, 0.000) + coalesce(:lote_qtde, 0.000);
    qtde_nova = coalesce(:lote_qtde, 0.000);

    -- Buscar dados importantes do produto
    Select
        pr.fracionador
      , pr.codunidade_fracionada
      , coalesce(pr.qtde, 0.000)
      , pr.usuario
    from TBPRODUTO pr
    where pr.cod = :produto
    Into
        fracionador
      , unidade
      , estoque
      , usuario;

    if ( trim(coalesce(:lote_id, '')) = '' ) then
    begin
        Select
          g.hex_uuid_format
        from GET_GUID_UUID_HEX g
        Into
          lote_id;

        Select
            max(ea.lote)
        from TBESTOQUE_ALMOX ea
        where ea.empresa      = :empresa
          and ea.centro_custo = :centro_custo
          and ea.produto      = :produto
        Into
            lote;

        lote = coalesce(:lote, 0) + 1;

        Insert Into TBESTOQUE_ALMOX (
            empresa
          , centro_custo
          , produto
          , lote
          , descricao
          , data_fabricacao
          , data_validade
          , qtde
          , fracionador
          , unidade
          , custo_medio
          , id
        ) values (
            :empresa
          , :centro_custo
          , :produto
          , :lote
          , trim(:lote_descricao)
          , :lote_fab
          , :lote_val
          , :qtde_nova   -- Informando a quantidade fracionada
          , :fracionador
          , :unidade
          , null         -- Informando o custo medio fracionado
          , :lote_id
        );
    end
    else
    begin
      Update TBESTOQUE_ALMOX ea Set
          ea.qtde        = :qtde_nova -- Informando a quantidade fracionada
        , ea.fracionador = :fracionador
        , ea.unidade     = :unidade
      where ea.empresa      = :empresa
        and ea.centro_custo = :centro_custo
        and ea.produto      = :produto
        and ea.lote         = :lote;
    end

    /* SISTEMA_GESTAO_OPME */
    if (coalesce(:sistema, 0) = 3) then
    begin
      Select
        sum( (e.qtde / coalesce(nullif(e.fracionador, 0), 1)) )
      from TBESTOQUE_ALMOX e
      where e.empresa      = :empresa
        and e.centro_custo = :centro_custo
        and e.produto      = :produto
      Into
        qtde_nova;

      -- Atualizar Estoque de Venda
      Update TBPRODUTO p Set
        p.qtde = :qtde_nova
      where p.cod = :produto;

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
          :empresa
        , :produto
        , 'LOTE'
        , case when ((:qtde_nova - :estoque) > 0.000) then 'AJUSTE DE ESTOQUE - ENTRADA' else 'AJUSTE DE ESTOQUE - SAIDA' end
        , current_timestamp
        , :estoque
        , (:qtde_nova - :estoque)
        , :qtde_nova
        , coalesce(:usuario, user)
        , 'Ajuste manual do estoque'
      );
    end

    suspend;
  end 
end^

SET TERM ; ^


/*------ SYSDBA 02/04/2018 17:25:10 --------*/

update RDB$RELATION_FIELDS set
RDB$FIELD_SOURCE = 'DMN_VCHAR_15'
where (RDB$FIELD_NAME = 'REFERENCIA') and
(RDB$RELATION_NAME = 'TBPRODUTO_CLIENTE')
;




/*------ SYSDBA 02/04/2018 17:27:28 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_PRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10,
    CLIENTE DMN_INTEGER_N,
    REFERENCIA DMN_VCHAR_15)
as
declare variable COMPARAR DMN_VCHAR_10;
begin
  Select
    upper(trim(coalesce(p.referencia, '')))
  from TBPRODUTO p
  where p.cod = :produto
  Into
    comparar;

  if (:comparar <> upper(trim(:referencia))) then
  begin
    /*
    if (exists(
      Select
        p.codigo
      from TBPRODUTO p
      where p.cod = :produto
    ) and exists(
      Select
        c.codigo
      from TBCLIENTE c
      where c.codigo = :cliente
    )) then
    begin
    */
      if (not exists(
        Select
          pc.referencia
        from TBPRODUTO_CLIENTE pc
        where pc.produto = :produto
          and pc.cliente = :cliente
      )) then
      begin
        Insert Into TBPRODUTO_CLIENTE (
            produto
          , cliente
          , referencia
        ) values (
            :produto
          , :cliente
          , upper(trim(:referencia))
        );
      end
      else
      begin
        Update TBPRODUTO_CLIENTE pc Set
           pc.referencia = upper(trim(:referencia))
        where pc.produto = :produto
          and pc.cliente = :cliente;
      end
    /*
    end
    */
  end 
end^

SET TERM ; ^




/*------ SYSDBA 02/04/2018 17:37:14 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_PRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10,
    CLIENTE DMN_INTEGER_N,
    REFERENCIA DMN_VCHAR_15)
as
declare variable COMPARAR DMN_VCHAR_15;
begin
  Select
    upper(trim(coalesce(p.referencia, '')))
  from TBPRODUTO p
  where p.cod = :produto
  Into
    comparar;

  if (:comparar <> upper(trim(:referencia))) then
  begin
    /*
    if (exists(
      Select
        p.codigo
      from TBPRODUTO p
      where p.cod = :produto
    ) and exists(
      Select
        c.codigo
      from TBCLIENTE c
      where c.codigo = :cliente
    )) then
    begin
    */
      if (not exists(
        Select
          pc.referencia
        from TBPRODUTO_CLIENTE pc
        where pc.produto = :produto
          and pc.cliente = :cliente
      )) then
      begin
        Insert Into TBPRODUTO_CLIENTE (
            produto
          , cliente
          , referencia
        ) values (
            :produto
          , :cliente
          , upper(trim(:referencia))
        );
      end
      else
      begin
        Update TBPRODUTO_CLIENTE pc Set
           pc.referencia = upper(trim(:referencia))
        where pc.produto = :produto
          and pc.cliente = :cliente;
      end
    /*
    end
    */
  end 
end^

SET TERM ; ^

