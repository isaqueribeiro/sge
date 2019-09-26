


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

