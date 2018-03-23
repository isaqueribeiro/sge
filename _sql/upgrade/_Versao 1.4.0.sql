


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

