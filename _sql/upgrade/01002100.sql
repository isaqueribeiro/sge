


/*------ SYSDBA 14/03/2018 13:53:10 --------*/

ALTER TABLE TBCONFIGURACAO
    ADD NFE_IMPRIMIR_COD_REFERENTE DMN_LOGICO;

COMMENT ON COLUMN TBCONFIGURACAO.NFE_IMPRIMIR_COD_REFERENTE IS
'NF-e: Imprimir Referencia como Codigo do Produto no DANFE da NF-e:
0 - Nao
1 - Sim';

alter table TBCONFIGURACAO
alter EMPRESA position 1;

alter table TBCONFIGURACAO
alter EMAIL_CONTA position 2;

alter table TBCONFIGURACAO
alter EMAIL_SENHA position 3;

alter table TBCONFIGURACAO
alter EMAIL_POP position 4;

alter table TBCONFIGURACAO
alter EMAIL_SMTP position 5;

alter table TBCONFIGURACAO
alter EMAIL_SMTP_PORTA position 6;

alter table TBCONFIGURACAO
alter EMAIL_REQUER_AUTENTICACAO position 7;

alter table TBCONFIGURACAO
alter EMAIL_CONEXAO_SSL position 8;

alter table TBCONFIGURACAO
alter EMAIL_ASSUNTO_PADRAO position 9;

alter table TBCONFIGURACAO
alter EMAIL_MENSAGEM_PADRAO position 10;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_DUPLICAR_CNPJ position 11;

alter table TBCONFIGURACAO
alter CLIENTE_PERMITIR_VF_CNPJ position 12;

alter table TBCONFIGURACAO
alter CUSTO_OPER_CALCULAR position 13;

alter table TBCONFIGURACAO
alter PERMITIR_VENDA_ESTOQUE_INS position 14;

alter table TBCONFIGURACAO
alter VENDA_CARREGA_PRODUTO_EAN position 15;

alter table TBCONFIGURACAO
alter VENDA_FORMA_PAGTO_CARTACREDITO position 16;

alter table TBCONFIGURACAO
alter ESTOQUE_UNICO_EMPRESAS position 17;

alter table TBCONFIGURACAO
alter ESTOQUE_SATELITE_CLIENTE position 18;

alter table TBCONFIGURACAO
alter AUTORIZA_INFORMA_CLIENTE position 19;

alter table TBCONFIGURACAO
alter USUARIO position 20;

alter table TBCONFIGURACAO
alter NFE_EMITIR position 21;

alter table TBCONFIGURACAO
alter NFE_SERIE position 22;

alter table TBCONFIGURACAO
alter NFE_NUMERO position 23;

alter table TBCONFIGURACAO
alter NFE_LOTE position 24;

alter table TBCONFIGURACAO
alter NFE_CARTA_CORRECAO position 25;

alter table TBCONFIGURACAO
alter NFE_EMITIR_ENTRADA position 26;

alter table TBCONFIGURACAO
alter NFE_ACEITAR_NOTA_DENEGADA position 27;

alter table TBCONFIGURACAO
alter NFE_SOLICITA_DH_SAIDA position 28;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_CLIENTE position 29;

alter table TBCONFIGURACAO
alter NFE_IMPRIMIR_COD_REFERENTE position 30;

alter table TBCONFIGURACAO
alter NFCE_EMITIR position 31;

alter table TBCONFIGURACAO
alter NFCE_SERIE position 32;

alter table TBCONFIGURACAO
alter NFCE_NUMERO position 33;

alter table TBCONFIGURACAO
alter NFCE_TOKEN_ID position 34;

alter table TBCONFIGURACAO
alter NFCE_TOKEN position 35;

alter table TBCONFIGURACAO
alter NFSE_EMITIR position 36;

alter table TBCONFIGURACAO
alter RPS_SERIE position 37;

alter table TBCONFIGURACAO
alter RPS_NUMERO position 38;

alter table TBCONFIGURACAO
alter NFSE_SERIE position 39;

alter table TBCONFIGURACAO
alter NFSE_NUMERO position 40;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_PIS position 41;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_COFINS position 42;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_CSLL position 43;

alter table TBCONFIGURACAO
alter NFSE_PERCENTUAL_ISSQN position 44;




/*------ SYSDBA 14/03/2018 13:59:42 --------*/

ALTER TABLE TBCONFIGURACAO ALTER NFE_IMPRIMIR_COD_REFERENTE TO NFE_IMPRIMIR_COD_REFERENCIA;




/*------ SYSDBA 23/03/2018 10:25:58 --------*/

COMMENT ON COLUMN TBPRODUTO.REFERENCIA IS
'Codigo de referencia

Observacoes:
1 - Para produtos do tipo Materiais medico-hospitalares, Medicamentos e Opme este
campo pode armazenar o codigo Anvisa.
2 - Para produtos automotores (carros e motos) este campo pode armazenar a Placa
do veiculo.';




/*------ SYSDBA 23/03/2018 10:26:24 --------*/

COMMENT ON COLUMN TBPRODUTO.CODBARRA_EAN IS
'Codigo de Barras / Codigo Externo';




/*------ SYSDBA 23/03/2018 10:26:58 --------*/

ALTER TABLE TVENDASITENS
    ADD REFERENCIA DMN_VCHAR_15;

COMMENT ON COLUMN TVENDASITENS.REFERENCIA IS
'Referencia / Codigo externo (Importante para OPME) / Codigo do Produto no Cliente';

alter table TVENDASITENS
alter ANO position 1;

alter table TVENDASITENS
alter CODCONTROL position 2;

alter table TVENDASITENS
alter CODEMP position 3;

alter table TVENDASITENS
alter SEQ position 4;

alter table TVENDASITENS
alter CODPROD position 5;

alter table TVENDASITENS
alter REFERENCIA position 6;

alter table TVENDASITENS
alter CODCLIENTE position 7;

alter table TVENDASITENS
alter CODCLI position 8;

alter table TVENDASITENS
alter CODVENDEDOR position 9;

alter table TVENDASITENS
alter DTVENDA position 10;

alter table TVENDASITENS
alter QTDE position 11;

alter table TVENDASITENS
alter LOTE_ID position 12;

alter table TVENDASITENS
alter PUNIT position 13;

alter table TVENDASITENS
alter PUNIT_PROMOCAO position 14;

alter table TVENDASITENS
alter DESCONTO position 15;

alter table TVENDASITENS
alter DESCONTO_VALOR position 16;

alter table TVENDASITENS
alter PFINAL position 17;

alter table TVENDASITENS
alter QTDEFINAL position 18;

alter table TVENDASITENS
alter UNID_COD position 19;

alter table TVENDASITENS
alter CFOP_COD position 20;

alter table TVENDASITENS
alter CST position 21;

alter table TVENDASITENS
alter CSOSN position 22;

alter table TVENDASITENS
alter ALIQUOTA position 23;

alter table TVENDASITENS
alter ALIQUOTA_CSOSN position 24;

alter table TVENDASITENS
alter ALIQUOTA_PIS position 25;

alter table TVENDASITENS
alter ALIQUOTA_COFINS position 26;

alter table TVENDASITENS
alter VALOR_IPI position 27;

alter table TVENDASITENS
alter PERCENTUAL_REDUCAO_BC position 28;

alter table TVENDASITENS
alter TOTAL_BRUTO position 29;

alter table TVENDASITENS
alter TOTAL_DESCONTO position 30;

alter table TVENDASITENS
alter TOTAL_LIQUIDO position 31;

alter table TVENDASITENS
alter TOTAL_COMISSAO position 32;




/*------ SYSDBA 23/03/2018 10:32:33 --------*/

CREATE TABLE TBPRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10_KEY NOT NULL,
    CLIENTE DMN_INTEGER_NN NOT NULL,
    REFERENCIA DMN_VCHAR_10);

ALTER TABLE TBPRODUTO_CLIENTE
ADD CONSTRAINT PK_TBPRODUTO_CLIENTE
PRIMARY KEY (CLIENTE,PRODUTO);

COMMENT ON COLUMN TBPRODUTO_CLIENTE.PRODUTO IS
'Produto';

COMMENT ON COLUMN TBPRODUTO_CLIENTE.CLIENTE IS
'Cliente';

COMMENT ON COLUMN TBPRODUTO_CLIENTE.REFERENCIA IS
'Referencia / Codigo Externo

Obs.: Codigo do produto na base do Cliente';




/*------ SYSDBA 23/03/2018 10:32:34 --------*/

COMMENT ON TABLE TBPRODUTO_CLIENTE IS 'Tabela de Referencia Produto x Clientes

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os codigos de referencia de cada produto na base
do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto na base.';

GRANT ALL ON TBPRODUTO_CLIENTE TO "PUBLIC";



/*------ SYSDBA 23/03/2018 10:55:06 --------*/

SET TERM ^ ;

create or alter procedure SET_PRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10,
    CLIENTE DMN_INTEGER_N,
    REFERENCIA DMN_VCHAR_10)
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

    end
  end 
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_PRODUTO_CLIENTE IS 'Procedure SET Referencia Produto x Cliente.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Stored procedure responsavel inserir/atualizar o codigo de referencia do produto
na base do cliente.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    23/03/2018 - IMR :
        * Documentacao do objeto.';

GRANT EXECUTE ON PROCEDURE SET_PRODUTO_CLIENTE TO "PUBLIC";



/*------ SYSDBA 23/03/2018 10:55:59 --------*/

ALTER TABLE TBPRODUTO_CLIENTE
ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_PRD
FOREIGN KEY (PRODUTO)
REFERENCES TBPRODUTO(COD)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBPRODUTO_CLIENTE
ADD CONSTRAINT FK_TBPRODUTO_CLIENTE_CLI
FOREIGN KEY (CLIENTE)
REFERENCES TBCLIENTE(CODIGO)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 23/03/2018 10:56:22 --------*/

CREATE INDEX IDX_TBPRODUTO_CLIENTE_REF
ON TBPRODUTO_CLIENTE (REFERENCIA);




/*------ SYSDBA 23/03/2018 11:02:40 --------*/

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
  declare variable referencia DMN_VCHAR_10;
begin
  --declare variable reserva    DMN_QUANTIDADE_D3;
  if ( (coalesce(old.Status, 0) <> coalesce(new.Status, 0)) and (new.Status = 3)) then /* 3. Finalizada */
  begin

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
      estoque = Case when :Movimentar = 1 then (:Estoque - :Quantidade) else :Estoque end;

      -- Baixar estoque
      Update TBPRODUTO p Set
          p.Qtde    = :Estoque
        --, p.Reserva = :Reserva               -- Descontinuada RESERVA
      where (p.Cod  = :Produto);

      -- Baixar estoque do Lote
      if ( (:movimentar = 1) and (:lote_id is not null) ) then
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
        , Trim('SAIDA - VENDA ' || Case when :Movimentar = 1 then '' else '*' end)
        , Current_time
        , :Estoque + :Quantidade
        , :Quantidade
        , :Estoque
        , new.Usuario
        , replace('Venda no valor de R$ ' || :Valor_produto, '.', ',')
      );

      -- Inserir armazenar codigo de referencia do produto no cliente
      if (:referencia <> '') then
        execute procedure SET_PRODUTO_CLIENTE(:produto, :cliente, :referencia);
    end
     
  end 
end^

SET TERM ; ^




/*------ SYSDBA 23/03/2018 11:04:11 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure SET_PRODUTO_CLIENTE (
    PRODUTO DMN_VCHAR_10,
    CLIENTE DMN_INTEGER_N,
    REFERENCIA DMN_VCHAR_10)
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




/*------ SYSDBA 23/03/2018 11:05:31 --------*/

CREATE INDEX IDX_TVENDASITENS_REF
ON TVENDASITENS (CODPROD,CODCLIENTE,REFERENCIA);




/*------ SYSDBA 23/03/2018 14:50:45 --------*/

CREATE DOMAIN DMN_LONGINT AS
BIGINT;COMMENT ON DOMAIN DMN_LONGINT IS 'Inteiro longo';

CREATE DOMAIN DMN_LONGINT_NN AS
BIGINT
NOT NULL;COMMENT ON DOMAIN DMN_LONGINT_NN IS 'Inteiro longo (Nao nulo)';




/*------ SYSDBA 23/03/2018 14:54:12 --------*/

CREATE TABLE SYS_UPGRADE (
    SIS_COD DMN_SMALLINT_NN NOT NULL,
    SIS_VERSION DMN_LONGINT_NN NOT NULL,
    UPGRADE_SQL DMN_TEXTO,
    UPGRADE_DATA DMN_DATE,
    UPGRADE_ERROR DMN_TEXTO,
    UPGRADE_OK DMN_LOGICO);

ALTER TABLE SYS_UPGRADE
ADD CONSTRAINT PK_SYS_UPGRADE
PRIMARY KEY (SIS_COD,SIS_VERSION);

COMMENT ON COLUMN SYS_UPGRADE.SIS_COD IS
'Sistema';

COMMENT ON COLUMN SYS_UPGRADE.SIS_VERSION IS
'Versao';

COMMENT ON COLUMN SYS_UPGRADE.UPGRADE_SQL IS
'Script SQL';

COMMENT ON COLUMN SYS_UPGRADE.UPGRADE_DATA IS
'Data de execucao';

COMMENT ON COLUMN SYS_UPGRADE.UPGRADE_ERROR IS
'LOG de Erro';

COMMENT ON COLUMN SYS_UPGRADE.UPGRADE_OK IS
'Execucao com sucesso:
0 - Nao
1 - Sim';




/*------ SYSDBA 23/03/2018 14:55:00 --------*/

ALTER TABLE SYS_UPGRADE
ADD CONSTRAINT FK_SYS_UPGRADE
FOREIGN KEY (SIS_COD)
REFERENCES SYS_SISTEMA(SIS_COD)
ON DELETE CASCADE
ON UPDATE CASCADE;




/*------ SYSDBA 23/03/2018 14:55:21 --------*/

CREATE INDEX IDX_SYS_UPGRADE_OK
ON SYS_UPGRADE (UPGRADE_OK);




/*------ SYSDBA 23/03/2018 15:05:19 --------*/

COMMENT ON TABLE SYS_UPGRADE IS 'Tabela Upgrade.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   23/03/2018

Tabela responsavel por armazenar os scripts de upgrade da base de dados a cada
nova atualizacao do(s) sistema(s).';




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

