
/*------ SYSDBA 16/01/2020 16:02:27 --------*/

DROP TABLE TB_TESTE;




/*------ SYSDBA 02/04/2020 14:44:18 --------*/

SET TERM ^ ;

CREATE OR ALTER procedure set_cotacao_compraforn_processa (
    ano dmn_smallint_nn,
    codigo dmn_bigint_nn,
    empresa dmn_cnpj_nn)
as
declare variable item dmn_smallint_nn;
--declare variable fornecedores dmn_smallint_n;
declare variable valor_maximo dmn_money;
declare variable valor_minimo dmn_money;
declare variable valor_medio dmn_money;
declare variable total_maximo dmn_money;
declare variable total_minimo dmn_money;
declare variable total_medio dmn_money;
declare variable total_maximo_desc dmn_money;
declare variable total_minimo_desc dmn_money;
begin
  /* Caso a Cotacao nao esteja em status adequado, abandonar processo */
  if (not exists(
    Select
      c.numero
    from TBCOTACAO_COMPRA c
    where c.ano     = :ano
      and c.codigo  = :codigo
      and c.empresa = :empresa
      and c.status  = 2 -- Em Cotacao (Recebendo respostas dos fornecedores)
  )) then
    Exit;

  /*
  Select
    count(fr.fornecedor)
  from TBCOTACAO_COMPRAFORN fr
  where fr.ano     = :ano
    and fr.codigo  = :codigo
    and fr.empresa = :empresa
    and fr.fornecedor in (
      Select distinct
        fi.fornecedor
      from TBCOTACAO_COMPRAFORN_ITEM fi
      where fi.ano     = :ano
        and fi.codigo  = :codigo
        and fi.empresa = :empresa
        and fi.valor_unitario > 0.0
    )
  Into
    fornecedores;
  */

  /* 1. Buscar Valores Maximo, Minimo e Medio */

  for
    Select
        fi.item

      , max(fi.valor_unitario)
      , min(fi.valor_unitario)
      , avg(fi.valor_unitario)

      , max(fi.valor_total)
      , min(fi.valor_total)
      , avg(fi.valor_total)
    from TBCOTACAO_COMPRAFORN_ITEM fi
    where fi.ano     = :ano
      and fi.codigo  = :codigo
      and fi.empresa = :empresa
      and fi.valor_unitario > 0.0
    group by
        fi.item
    Into
        item
      , valor_maximo
      , valor_minimo
      , valor_medio
      , total_maximo
      , total_minimo
      , total_medio
  do
  begin

    /* 1.1. Inserir os totalizadores no item */

    Update TBCOTACAO_COMPRAITEM i Set
        i.valor_unitario_min = :valor_minimo
      , i.valor_total_min    = :total_minimo
      , i.valor_unitario_max = :valor_maximo
      , i.valor_total_max    = :total_maximo
      , i.valor_unitario_media = :valor_medio
      , i.valor_total_media    = :total_medio
    where i.ano     = :ano
      and i.codigo  = :codigo
      and i.empresa = :empresa
      and i.seq     = :item;

  end 

  /* 2. Totalizar resultados processados */

  Select
      max(fc.valor_total_liquido)
    , min(fc.valor_total_liquido)
    , avg(fc.valor_total_liquido)
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido > 0.0
  Into
      total_maximo
    , total_minimo
    , total_medio;

  /* 2.1. Buscar desconto do valor Maximo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_maximo
  Into
    total_maximo_desc;

  /* 2.2. Buscar desconto do valor Minimo */

  Select first 1
    fc.valor_total_desconto
  from TBCOTACAO_COMPRAFORN fc
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo
  Into
    total_minimo_desc;

  /* 2.3. Inserir resultados totalizados na cotação */

  Update TBCOTACAO_COMPRA c Set
      --c.numero_minimo_fornecedor = :fornecedores,
      c.valor_max_total    = :total_maximo
    , c.valor_max_desconto = :total_maximo_desc
    , c.valor_max_bruto    = :total_maximo + :total_maximo_desc

    , c.valor_min_total    = :total_minimo
    , c.valor_min_desconto = :total_minimo_desc
    , c.valor_min_bruto    = :total_minimo + :total_minimo_desc

    , c.valor_media_total    = (:total_maximo + :total_minimo) / 2
    , c.valor_media_desconto = (:total_maximo_desc + :total_minimo_desc) / 2
    , c.valor_media_bruto    = (:total_maximo + :total_minimo + :total_maximo_desc + :total_minimo_desc) / 2
  where c.ano     = :ano
    and c.codigo  = :codigo
    and c.empresa = :empresa;

  /* 3. Marcar o fornecedor com a proposta vencedora */

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 0
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa;

  Update TBCOTACAO_COMPRAFORN fc Set
    fc.vencedor = 1
  where fc.ano     = :ano
    and fc.codigo  = :codigo
    and fc.empresa = :empresa
    and fc.valor_total_liquido = :total_minimo;

end^

SET TERM ; ^




/*------ SYSDBA 21/07/2020 21:02:09 --------*/

COMMENT ON TRIGGER TG_CAIXA_NUMERO IS 'Trigger Novo Caixa (Financeiro).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   21/07/2020

Trigger responsavel por gerar um sequencial unico para cada novo registro de caixa no ano.';




/*------ SYSDBA 21/07/2020 21:02:15 --------*/

SET TERM ^ ;

CREATE OR ALTER trigger tg_caixa_numero for tbcaixa
active before insert position 0
AS
begin
  if (new.numero is null) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CAIXA', cast(new.ano as varchar(4))) g
    Into
      new.numero;
  end
end
^

SET TERM ; ^




/*------ SYSDBA 21/07/2020 21:05:11 --------*/

DROP SEQUENCE GEN_CAIXA_2012;

DROP SEQUENCE GEN_CAIXA_2013;

DROP SEQUENCE GEN_CAIXA_2014;

DROP SEQUENCE GEN_CAIXA_2015;

DROP SEQUENCE GEN_CAIXA_2016;

DROP SEQUENCE GEN_CAIXA_2017;

DROP SEQUENCE GEN_CAIXA_2018;

DROP SEQUENCE GEN_CAIXA_2019;

DROP SEQUENCE GEN_CAIXA_2020;

