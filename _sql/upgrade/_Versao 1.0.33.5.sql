CREATE OR ALTER VIEW VW_EMPRESA(
    CODIGO,
    CNPJ,
    RAZAO,
    FANTASIA)
AS
Select 
    e.codigo
  , e.cnpj
  , e.rzsoc as razao
  , cast(coalesce(nullif(trim(e.nmfant), ''), e.rzsoc) as DMN_VCHAR_150) as fantasia
from TBEMPRESA e
where e.ativa = 1
order by
    4 -- Fantasia
;



ALTER TABLE TBVENDAS
    ADD CONTRATO DMN_INTEIRO_LONGO_N;

COMMENT ON COLUMN TBVENDAS.CONTRATO IS
'Numero de Contrato';



ALTER TABLE TBVENDAS
ADD CONSTRAINT FK_TBVENDAS_CONTRATO
FOREIGN KEY (CONTRATO)
REFERENCES TBCONTRATO(CONTROLE);



COMMENT ON COLUMN TBVENDAS.CUSTO_OPER_FRETE IS
'Custo Operacional (Frete) - Percentual ou Valor';



COMMENT ON TABLE TBVENDAS IS 'Tabela Vendas

    Autor   :   Isaque Marinho Ribeiro
    Data    :   01/01/2013

Tabela responsavel por armazenar todos os registros de vendas realizados pelo sistema.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/12/2023 - IMR:
        + Criacao do campo CONTRATO para associar a venda ao contrato de vendas de
          produtos firmado com o cliente. Este campo permitira a gestao do saldo do
          contrato.

    04/09/2019 - IMR:
        + Criacao dos campos CFOP_ALTERA_ESTOQUE e CFOP_GERA_TITULO para armazenar as
          as configuracoes da CFOP que influenciam na geracao de estoque e titulos a
          receber.

    28/11/2017 - IMR:
        + Cricao do campo INDEX_VALOR para armazenar o valor da venda de forma indexada
          a fim de proporcionar um meio de busca dos registros pelo valor liquido da venda.

    20/08/2014 - IMR:
        + Criacao do campo DESCONTO_CUPOM para armazenar o valor de desconto concedido no PDV (Novo sistema em
          desenvolvimento).

    04/09/2014 - IMR:
        + Criacao dos campos NFE_DENEGADA e NFE_DENEGADA_MOTIVO para sinalizar as NF-e que foram denegadas na SEFA e
          armazenar o motivo da denegacao.

    24/02/2015 - IMR:
        + Criacao dos campos CAIXA_ANO, CAIXA_NUM e CAIXA_PDV para facilitar a identificacao de vendas realizadas, mas
          que ainda nao geraram movimentacao de caixa, nos caixas do usuarios.';



SET TERM ^ ;

CREATE OR ALTER trigger tg_contrato_item_novo for tbcontrato_item
active before insert position 0
AS
  declare variable sequencial type of DMN_SMALLINT_N;
begin
  if (coalesce(new.item, 0) = 0) then
  begin
    Select
      max(itm.item)
    from TBCONTRATO_ITEM itm
    where (itm.contrato = new.contrato)
    Into
      sequencial;

    new.item = (coalesce(:sequencial, 0) + 1);
  end

  new.consumo_qtde  = 0.0;
  new.consumo_total = 0.0;
end^

SET TERM ; ^

SET TERM ^ ;

create or alter procedure SP_CONTRATO_ATUALIZA_CONSUMO (
    CONTRATO DMN_BIGINT_N)
as
declare variable VPRODUTO type of DMN_VCHAR_10;
declare variable VQUANTIDADE type of DMN_QUANTIDADE_D3;
declare variable VVALOR_TOTAL type of DMN_MONEY;
begin
  for
    Select
        vi.codprod   as produto
      , sum(vi.qtde) as quantidade
      , sum(vi.total_liquido) as valor_total
    from TBVENDAS vn
      inner join TVENDASITENS vi on (vi.ano = vn.ano and vi.codcontrol = vn.codcontrol)
    where (vn.status between 3 and 4) -- 3. Venda Finalizada / 4. Nota Emitida
      and (vn.contrato = :contrato)
    group by
        vi.codprod
    Into
        vproduto
      , vquantidade
      , vvalor_total
  do
  begin
    Update TBCONTRATO_ITEM ci Set
        ci.consumo_qtde  = :vquantidade
      , ci.consumo_total = :vvalor_total
    where (ci.contrato = :contrato)
      and (ci.produto  = :vproduto);
  end
end^

SET TERM ; ^

COMMENT ON PROCEDURE SP_CONTRATO_ATUALIZA_CONSUMO IS 'Procedure SP Atualiza Consumo (Contrato).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/01/2024

Stored procedure responsavel por calcular as quantidades e valores dos produtos vendidos sob um contrato
e atualizar os valores de consumo nos regitros dos produtos do contrato informado.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    19/01/2024 - IMR :
        * Documentacao do objeto.';

COMMENT ON PARAMETER SP_CONTRATO_ATUALIZA_CONSUMO.CONTRATO IS
'Codigo de controle do contrato';

GRANT EXECUTE ON PROCEDURE SP_CONTRATO_ATUALIZA_CONSUMO TO "PUBLIC";


SET TERM ^ ;

CREATE trigger tg_vendas_atualiza_contrato for tbvendas
active after insert or update position 11
AS
begin
  if ((new.status > 2) and (coalesce(new.contrato,0) != 0)) then
    execute procedure SP_CONTRATO_ATUALIZA_CONSUMO(new.contrato);
end^

SET TERM ; ^

COMMENT ON TRIGGER TG_VENDAS_ATUALIZA_CONTRATO IS 'Trigger Atualiza Saldo de Contrato (Vendas).

    Autor   :   Isaque Marinho Ribeiro
    Data    :   19/01/2024

Trigger responsavel por executar o procedimento de atualizacao dos saldos de contratos quando a venda em questao, tendo
um contrato associado ao seu registro, for finalizada, emitida a nota ou cancelada.';



COMMIT WORK;