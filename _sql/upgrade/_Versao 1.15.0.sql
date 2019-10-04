


/*------ SYSDBA 25/09/2019 22:36:30 --------*/

ALTER TABLE TBCFOP
    ADD CFOP_RESUMIDO DMN_VCHAR_60;

ALTER TABLE TBCFOP
    ALTER CFOP_DESCRICAO TYPE DMN_VCHAR_250;

COMMENT ON COLUMN TBCFOP.CFOP_RESUMIDO IS
'Descricao resumida para apresentacao no DANFE e XML da NFe';

alter table TBCFOP
alter CFOP_COD position 1;

alter table TBCFOP
alter CFOP_DESCRICAO position 2;

alter table TBCFOP
alter CFOP_RESUMIDO position 3;

alter table TBCFOP
alter CFOP_ESPECIFICACAO position 4;

alter table TBCFOP
alter CFOP_INFORMACAO_FISCO position 5;

alter table TBCFOP
alter CFOP_TIPO position 6;

alter table TBCFOP
alter CFOP_CST_PADRAO_ENTRADA position 7;

alter table TBCFOP
alter CFOP_CST_PADRAO_SAIDA position 8;

alter table TBCFOP
alter CFOP_DEVOLUCAO position 9;

alter table TBCFOP
alter CFOP_REMESSA position 10;

alter table TBCFOP
alter CFOP_FATURAR_REMESSA position 11;

alter table TBCFOP
alter CFOP_RETORNO_INTERNO position 12;

alter table TBCFOP
alter CFOP_RETORNO_EXTERNO position 13;

alter table TBCFOP
alter CFOP_GERAR_TITULO position 14;

alter table TBCFOP
alter CFOP_GERAR_DUPLICATA position 15;

alter table TBCFOP
alter CFOP_ALTERA_CUSTO_PRODUTO position 16;

alter table TBCFOP
alter CFOP_ALTERA_ESTOQUE_PRODUTO position 17;




/*------ SYSDBA 25/09/2019 22:38:04 --------*/

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

    25/09/2019 - IMR:
        + Criacao do campo CFOP_RESUMIDO para armazenar a descricao de forma resumida,
          obedecendo ao criterio de tamanho do campo no arquivo XML da Nota Fiscal.

    19/09/2019 - IMR:
        + Criacao do campo CFOP_FATURAR_REMESSA para este informar para a venda
          que o movimento de saida estara faturando os produtos que foram anteriormente
          enviados para o cliente em Remessa.

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




/*------ SYSDBA 03/10/2019 22:51:15 --------*/

SET TERM ^ ;

CREATE trigger tg_configuracao_serie_nfe for tbconfiguracao
active before insert or update position 0
AS
begin
  Update TBEMPRESA e Set
      e.serie_nfe  = new.nfe_serie
    , e.serie_nfce = new.nfce_serie
  where (e.cnpj = new.empresa);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONFIGURACAO_SERIE_NFE IS 'Trigger Manter Serie NF Empresa (Serie NF)

    Autor   :   Isaque Marinho Ribeiro
    Data    :   03/09/2019

Trigger responsavel por manter atualizada a SERIE NF-e no Cadastro da Empresa de
acordo com as configuracoes de emissao de Notas Ficais.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/07/2019 - IMR :
        * Documentacao do objeto de banco.';

/*------ SYSDBA 04/10/2019 15:18:30 --------*/

CREATE SEQUENCE GEN_SENHA_AUTORIZACAO;




/*------ SYSDBA 04/10/2019 15:40:08 --------*/

SET TERM ^ ;

create or alter procedure set_generator (
    generator_name dmn_vchar_40,
    generator_year dmn_vchar_04)
as
declare variable agenerator dmn_vchar_40;
declare variable generatorid dmn_smallint_n;
declare variable sql_create dmn_vchar_250;
begin
  if (coalesce(trim(:generator_year), '') = '') then
    aGenerator = trim(upper(:generator_name));
  else
    aGenerator = trim(upper(:generator_name)) || '_' || trim(:generator_year);

  Select first 1
    g.rdb$generator_id
  from RDB$GENERATORS g
  where (g.rdb$generator_name = :aGenerator)
  Into
    GeneratorID;

  if (coalesce(:GeneratorID, 0) = 0) then
  begin
    sql_create = Trim('CREATE SEQUENCE ' || :aGenerator);
    execute statement :sql_create;
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE SET_GENERATOR IS 'Procedure SET Criar Generators.

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/10/2019

Stored procedure responsavel por criar as generators que o sistema precisar,
baseando-se no nome e ano informados.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR :
        * Documentacao do objeto.';



/*------ 04/10/2019 15:40:50 --------*/

GRANT EXECUTE ON PROCEDURE SET_GENERATOR TO "PUBLIC";


/*------ SYSDBA 04/10/2019 18:38:28 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_cliente_requisicao_estoque for tbcliente_requisicao
active before update position 1
AS
  declare variable item       Smallint;
  declare variable produto    Varchar(10);
  declare variable quantidade DMN_QUANTIDADE_D3;
  declare variable estoque    DMN_QUANTIDADE_D3;
  declare variable lote_id    DMN_GUID_38;
begin
  /* 2. AUTORIZADA - Decrementar estoque satelite do cliente quando a requisicao for autorizada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 2) ) then
  begin
    for
      Select
          i.numero
        , i.codproduto
        , i.quantidade
        , e.quantidade as estoque
        , coalesce(trim(i.lote_id), '') as lote
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto and coalesce(trim(e.lote_id), '') = coalesce(trim(i.lote_id), ''))
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          item
        , produto
        , quantidade
        , estoque
        , lote_id
    do
    begin

      -- Baixar estoque
      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) - coalesce(:quantidade, 0) -- Retirar estoque
      where (e.cod_cliente = new.codcliente)
        and (e.cod_produto = :produto)
        and (coalesce(trim(e.lote_id), '') = :lote_id);

      -- Guardar historico estoque satelite
      Update TBCLIENTE_REQUISICAO_ITEM i Set
        i.quantidade_final = coalesce(:estoque, 0) - coalesce(:quantidade, 0)
      where i.ano    = new.ano
        and i.numero = new.numero
        and i.item   = :item;

    end 
  end 

  else

  /* 4. CANCELADA - Incrementar estoque satelite do cliente quando a requisicao for cancelada  */

  if ( (old.situacao <> new.situacao) and (new.situacao = 4) ) then
  begin
    for
      Select
          i.codproduto
        , i.quantidade
        , e.quantidade as estoque
        , coalesce(trim(i.lote_id), '') as lote
      from TBCLIENTE_REQUISICAO_ITEM i
        left join TBCLIENTE_ESTOQUE e on (e.cod_cliente = new.codcliente and e.cod_produto = i.codproduto and coalesce(trim(e.lote_id), '') = coalesce(trim(i.lote_id), ''))
      where i.ano    = new.ano
        and i.numero = new.numero
      Into
          produto
        , quantidade
        , estoque
        , lote_id
    do
    begin

      Update TBCLIENTE_ESTOQUE e Set
        e.quantidade = coalesce(:estoque, 0) + coalesce(:quantidade, 0) -- Devolver estoque
      where (e.cod_cliente = new.codcliente)
        and (e.cod_produto = :produto)
        and (coalesce(trim(e.lote_id), '') = :lote_id);

    end 
  end
end^

SET TERM ; ^




/*------ SYSDBA 04/10/2019 18:51:06 --------*/

SET TERM ^ ;

create or alter procedure set_requisicao_cliente (
    empresa dmn_cnpj,
    cliente dmn_integer_n,
    venda_ano dmn_smallint_n,
    venda_num dmn_integer_n,
    usuario dmn_vchar_50)
as
declare variable numero dmn_integer_n;
begin
  /* Veriricar se a Venda existe e foi finalizada */
  if (exists(
    Select
      v.codcontrol
    from TBVENDAS v
    where (v.ano        = :venda_ano)
      and (v.codcontrol = :venda_num)
      and (v.codcliente = :cliente)
      and (v.codemp     = :empresa)
      and (v.status between 3 and 4) -- 3. Finalizada, 4. NF Emitida
  )) then
  begin
    /* Verificar se Requisicao existe no Cliente  */
    if (not exists(
      Select
        cr.numero
      from TBCLIENTE_REQUISICAO cr
      where (cr.codempresa = :empresa)
        and (cr.codcliente = :cliente)
        and (cr.venda_ano  = :venda_ano)
        and (cr.venda_num  = :venda_num)
    )) then
    begin
      Execute Procedure SET_GENERATOR('GEN_REQUISICAO', :venda_ano);
      Execute Statement 'SELECT gen_id(GEN_REQUISICAO_' || :venda_ano || ', 1) as ID from RDB$DATABASE'
      Into
        numero;

      -- 1. Gerar cabecalho da REQUISICAO
      Insert Into TBCLIENTE_REQUISICAO (
          ano
        , numero
        , codempresa
        , codcliente
        , data_movimento
        , insercao_data
        , insercao_hora
        , insercao_usuario
        , situacao
        , observacoes
        --, autorizacao_data
        --, autorizacao_usuario
        , recebedor_nome
        , recebedor_rg
        , venda_ano
        , venda_num
      ) Select
            v.ano
          , :numero
          , v.codemp
          , v.codcliente
          , v.dtfinalizacao_venda
          , current_date
          , current_time
          , v.usuario
          , 1 -- Aberta
          , 'REQUISICAO GERADA DE FORMA AUTOMATICA PARA DEDUZIR ESTOQUE DE PRODUTOS DO CLIENTE, MAS FATURADOS SOMENTE NA VENDA ' || :venda_ano || '/' || right('0000000' || :venda_num, 7)
          , substring(trim(c.nome) from 1 for 50)
          , '0000000 SSP/' || coalesce(trim(e.est_sigla), 'XX')
          , v.ano
          , v.codcontrol
        from TBVENDAS v
          inner join TBCLIENTE c on (c.codigo = v.codcliente)
          left join TBESTADO e on (e.est_cod = c.est_cod)
        where (v.ano        = :venda_ano)
          and (v.codcontrol = :venda_num)
          and (v.codcliente = :cliente)
          and (v.codemp     = :empresa);

      -- 2. Inserir Itens na REQUISICAO
      Insert Into TBCLIENTE_REQUISICAO_ITEM (
          ano
        , numero
        , item
        , codempresa
        , codcliente
        , codproduto
        , quantidade
        , valor_medio
        , unidade
        , usuario
        , lote_id
      ) Select
            i.ano
          , :numero
          , i.seq
          , i.codemp
          , i.codcliente
          , i.codprod
          , i.qtde
          , i.pfinal
          , i.unid_cod
          , v.usuario
          , i.lote_id
        from TBVENDAS v
          inner join TVENDASITENS i on (i.ano = v.ano and i.codcontrol = v.codcontrol and i.codemp = v.codemp)
        where (v.ano        = :venda_ano)
          and (v.codcontrol = :venda_num)
          and (v.codcliente = :cliente)
          and (v.codemp     = :empresa);

      -- 3. Autorizar REQUISICAO
      Update TBCLIENTE_REQUISICAO rc Set
          rc.situacao            = 2 -- Autotizada
        , rc.autorizacao_data    = current_date
        , rc.autorizacao_usuario = :usuario
      where (rc.ano    = :venda_ano)
        and (rc.numero = :numero);
    end
  end 
end
^

SET TERM ; ^



/*------ 04/10/2019 18:51:23 --------*/

GRANT EXECUTE ON PROCEDURE SET_REQUISICAO_CLIENTE TO "PUBLIC";


/*------ SYSDBA 04/10/2019 18:54:58 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_requisicao_cliente (
    empresa dmn_cnpj,
    cliente dmn_integer_n,
    venda_ano dmn_smallint_n,
    venda_num dmn_integer_n,
    usuario dmn_vchar_50)
as
declare variable numero dmn_integer_n;
begin
  /* Veriricar se a Venda existe e foi finalizada */
  if (exists(
    Select
      v.codcontrol
    from TBVENDAS v
    where (v.ano        = :venda_ano)
      and (v.codcontrol = :venda_num)
      and (v.codcliente = :cliente)
      and (v.codemp     = :empresa)
      and (v.status between 3 and 4) -- 3. Finalizada, 4. NF Emitida
  )) then
  begin
    /* Verificar se Requisicao existe no Cliente  */
    if (not exists(
      Select
        cr.numero
      from TBCLIENTE_REQUISICAO cr
      where (cr.codempresa = :empresa)
        and (cr.codcliente = :cliente)
        and (cr.venda_ano  = :venda_ano)
        and (cr.venda_num  = :venda_num)
    )) then
    begin
      Execute Procedure SET_GENERATOR('GEN_REQUISICAO', :venda_ano);
      Execute Statement 'SELECT gen_id(GEN_REQUISICAO_' || :venda_ano || ', 1) as ID from RDB$DATABASE'
      Into
        numero;

      -- 1. Gerar cabecalho da REQUISICAO
      Insert Into TBCLIENTE_REQUISICAO (
          ano
        , numero
        , codempresa
        , codcliente
        , data_movimento
        , insercao_data
        , insercao_hora
        , insercao_usuario
        , situacao
        , observacoes
        --, autorizacao_data
        --, autorizacao_usuario
        , recebedor_nome
        , recebedor_rg
        , venda_ano
        , venda_num
      ) Select
            v.ano
          , :numero
          , v.codemp
          , v.codcliente
          , v.dtfinalizacao_venda
          , current_date
          , current_time
          , v.usuario
          , 1 -- Aberta
          , 'REQUISICAO GERADA DE FORMA AUTOMATICA PARA DEDUZIR ESTOQUE DE PRODUTOS DO CLIENTE, MAS FATURADOS SOMENTE NA VENDA ' || :venda_ano || '/' || right('0000000' || :venda_num, 7)
          , substring(trim(c.nome) from 1 for 50)
          , '0000000 SSP/' || coalesce(trim(e.est_sigla), 'XX')
          , v.ano
          , v.codcontrol
        from TBVENDAS v
          inner join TBCLIENTE c on (c.codigo = v.codcliente)
          left join TBESTADO e on (e.est_cod = c.est_cod)
        where (v.ano        = :venda_ano)
          and (v.codcontrol = :venda_num)
          and (v.codcliente = :cliente)
          and (v.codemp     = :empresa);

      -- 2. Inserir Itens na REQUISICAO
      Insert Into TBCLIENTE_REQUISICAO_ITEM (
          ano
        , numero
        , item
        , codempresa
        , codcliente
        , codproduto
        , quantidade
        , valor_medio
        , unidade
        , usuario
        , lote_id
      ) Select
            i.ano
          , :numero
          , i.seq
          , i.codemp
          , i.codcliente
          , i.codprod
          , i.qtde
          , i.pfinal
          , i.unid_cod
          , v.usuario
          , i.lote_id
        from TBVENDAS v
          inner join TVENDASITENS i on (i.ano = v.ano and i.codcontrol = v.codcontrol and i.codemp = v.codemp)
        where (v.ano        = :venda_ano)
          and (v.codcontrol = :venda_num)
          and (v.codcliente = :cliente)
          and (v.codemp     = :empresa);

      -- 3. Autorizar REQUISICAO
      Update TBCLIENTE_REQUISICAO rc Set
          rc.situacao            = 2 -- Autotizada
        , rc.autorizacao_data    = current_date
        , rc.autorizacao_usuario = :usuario
      where (rc.ano    = :venda_ano)
        and (rc.numero = :numero);
    end
  end 
end
^

SET TERM ; ^

COMMENT ON PROCEDURE SET_REQUISICAO_CLIENTE IS 'Procedure SET Criar Requisicao Cliente (Automatica).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   04/10/2019

Stored procedure responsavel por requisicoes automaticas para os clientes que
trabalham e/ou possuem estoque satelite. Este estoque e gerado quando uma venda
com CFOP de Remessa (Transferencia de Estoque) e gerada pelo SGO.
E para deduzir o estoque o sistema executa esta procedure quando uma segunda venda
e gerada para o mesmo cliente sob a CFOP de Faturamento de Remessa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    04/09/2019 - IMR :
        * Documentacao do objeto.';




/*------ SYSDBA 04/10/2019 18:59:58 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_requisicao_cliente (
    empresa dmn_cnpj,
    cliente dmn_integer_n,
    venda_ano dmn_smallint_n,
    venda_num dmn_integer_n,
    usuario dmn_vchar_50)
as
declare variable numero dmn_integer_n;
begin
  /* Veriricar se a Venda existe e foi finalizada */
  if (exists(
    Select
      v.codcontrol
    from TBVENDAS v
    where (v.ano        = :venda_ano)
      and (v.codcontrol = :venda_num)
      and (v.codcliente = :cliente)
      and (v.codemp     = :empresa)
      and (v.status between 3 and 4) -- 3. Finalizada, 4. NF Emitida
  )) then
  begin
    /* Verificar se Requisicao existe no Cliente  */
    if (not exists(
      Select
        cr.numero
      from TBCLIENTE_REQUISICAO cr
      where (cr.codempresa = :empresa)
        and (cr.codcliente = :cliente)
        and (cr.venda_ano  = :venda_ano)
        and (cr.venda_num  = :venda_num)
    )) then
    begin
      Execute Procedure SET_GENERATOR('GEN_REQUISICAO', :venda_ano);
      Execute Statement 'SELECT gen_id(GEN_REQUISICAO_' || :venda_ano || ', 1) as ID from RDB$DATABASE'
      Into
        numero;

      -- 1. Gerar cabecalho da REQUISICAO
      Insert Into TBCLIENTE_REQUISICAO (
          ano
        , numero
        , codempresa
        , codcliente
        , data_movimento
        , insercao_data
        , insercao_hora
        , insercao_usuario
        , situacao
        , observacoes
        --, autorizacao_data
        --, autorizacao_usuario
        , recebedor_nome
        , recebedor_rg
        , venda_ano
        , venda_num
      ) Select
            v.ano
          , :numero
          , v.codemp
          , v.codcliente
          , v.dtfinalizacao_venda
          , current_date
          , current_time
          , v.usuario
          , 1 -- Aberta
          , 'REQUISICAO GERADA DE FORMA AUTOMATICA PARA DEDUZIR ESTOQUE DE PRODUTOS DO CLIENTE, MAS FATURADOS SOMENTE NA VENDA ' || :venda_ano || '/' || right('0000000' || :venda_num, 7)
          , substring(trim(c.nome) from 1 for 50)
          , 'VND. ' || :venda_ano || '/' || right('0000000' || :venda_num, 7)
          , v.ano
          , v.codcontrol
        from TBVENDAS v
          inner join TBCLIENTE c on (c.codigo = v.codcliente)
        where (v.ano        = :venda_ano)
          and (v.codcontrol = :venda_num)
          and (v.codcliente = :cliente)
          and (v.codemp     = :empresa);

      -- 2. Inserir Itens na REQUISICAO
      Insert Into TBCLIENTE_REQUISICAO_ITEM (
          ano
        , numero
        , item
        , codempresa
        , codcliente
        , codproduto
        , quantidade
        , valor_medio
        , unidade
        , usuario
        , lote_id
      ) Select
            i.ano
          , :numero
          , i.seq
          , i.codemp
          , i.codcliente
          , i.codprod
          , i.qtde
          , i.pfinal
          , i.unid_cod
          , v.usuario
          , i.lote_id
        from TBVENDAS v
          inner join TVENDASITENS i on (i.ano = v.ano and i.codcontrol = v.codcontrol and i.codemp = v.codemp)
        where (v.ano        = :venda_ano)
          and (v.codcontrol = :venda_num)
          and (v.codcliente = :cliente)
          and (v.codemp     = :empresa);

      -- 3. Autorizar REQUISICAO
      Update TBCLIENTE_REQUISICAO rc Set
          rc.situacao            = 2 -- Autotizada
        , rc.autorizacao_data    = current_date
        , rc.autorizacao_usuario = :usuario
      where (rc.ano    = :venda_ano)
        and (rc.numero = :numero);
    end
  end 
end
^

SET TERM ; ^

