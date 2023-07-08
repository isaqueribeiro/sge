


/*------ SYSDBA 07/07/2023 23:06:06 --------*/

CREATE TABLE TBCONTRATO (
    CONTROLE DMN_LONGINT_NN NOT NULL,
    EMPRESA DMN_CNPJ_NN,
    NUMERO DMN_VCHAR_10,
    DATA_EMISSAO DMN_DATE,
    DATA_VALIDADE DMN_DATE,
    DESTINO DMN_SMALLINT_NN DEFAULT 0,
    CLLIENTE DMN_INTEGER_N,
    FORNECEDOR DMN_INTEGER_N,
    SITUACAO DMN_STATUS DEFAULT 0,
    OBSERVACOES DMN_TEXTO,
    ITENS DMN_INTEGER_N,
    QUANTIDADES DMN_NUMERO,
    VALOR_TOTAL DMN_MONEY,
    USUARIO DMN_VCHAR_50,
    DATA_CADASTRO DMN_DATE);

ALTER TABLE TBCONTRATO
ADD CONSTRAINT PK_TBCONTRATO
PRIMARY KEY (CONTROLE);

COMMENT ON COLUMN TBCONTRATO.CONTROLE IS
'Controle';

COMMENT ON COLUMN TBCONTRATO.EMPRESA IS
'Empresa';

COMMENT ON COLUMN TBCONTRATO.NUMERO IS
'Numero do Contrato';

COMMENT ON COLUMN TBCONTRATO.DATA_EMISSAO IS
'Data de Emissao';

COMMENT ON COLUMN TBCONTRATO.DATA_VALIDADE IS
'Data de Validade';

COMMENT ON COLUMN TBCONTRATO.DESTINO IS
'Destino do Contrato:
0 - Contratos com Clientes
1 - Contratos com Fornecedores';

COMMENT ON COLUMN TBCONTRATO.CLLIENTE IS
'Cliente';

COMMENT ON COLUMN TBCONTRATO.FORNECEDOR IS
'Fornecedor';

COMMENT ON COLUMN TBCONTRATO.SITUACAO IS
'Situacao:
0 - Editando
1 - Disponivel
2 - Finalizado
3 - 
4 - 
5 - 
6 - 
7 - 
8 - 
9 - Cancelado';

COMMENT ON COLUMN TBCONTRATO.OBSERVACOES IS
'Observacoes Gerais';

COMMENT ON COLUMN TBCONTRATO.ITENS IS
'Numero de Itens do Contrato';

COMMENT ON COLUMN TBCONTRATO.QUANTIDADES IS
'Quantidade total dos itens do Contrato';

COMMENT ON COLUMN TBCONTRATO.VALOR_TOTAL IS
'Valor Total do Contrato';

COMMENT ON COLUMN TBCONTRATO.USUARIO IS
'Usuario de insercao/atualizacao';

COMMENT ON COLUMN TBCONTRATO.DATA_CADASTRO IS
'Data de Cadastro';




/*------ SYSDBA 07/07/2023 23:06:08 --------*/

COMMENT ON TABLE TBCONTRATO IS 'Tabela de Contatos

    Autor   :   Isaque Marinho Ribeiro
    Data    :   07/07/2023

Tabela responsavel por armazenar os contratos da empresa com seus clientes e
fornecedores.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    07/07/2023 - IMR :
        + Criacao e documentacao da tabela.';




/*------ SYSDBA 07/07/2023 23:11:07 --------*/

SET TERM ^ ;

CREATE trigger tg_contrato_novo for tbcontrato
active before insert position 0
AS
begin
  if (coalesce(new.controle, 0) = 0) then
  begin
    Select
      g.generator_id
    from GET_GENERATOR('GEN_CONTRATO', '') g
    Into
      new.controle;
  end

  if (new.data_cadastro is null) then
    new.data_cadastro = current_date;

  if (coalesce(trim(new.usuario), '') = '') then
    new.usuario = user;
end
^

SET TERM ; ^

COMMENT ON TRIGGER TG_CONTRATO_NOVO IS 'Trigger Novo Contrato.

    Autor   :   Isaque M. Ribeiro
    Data    :   07/07/2023

Trigger responsavel por gerar um sequencial unico para cada novo registro de
contrato.';

GRANT ALL ON TBCONTRATO TO "PUBLIC";



/*------ SYSDBA 07/07/2023 23:12:48 --------*/

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_EMPRESA
FOREIGN KEY (EMPRESA)
REFERENCES TBEMPRESA(CNPJ);

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_CLIENTE
FOREIGN KEY (CLLIENTE)
REFERENCES TBCLIENTE(CODIGO);

ALTER TABLE TBCONTRATO
ADD CONSTRAINT FK_TBCONTRATO_FORNEC
FOREIGN KEY (FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN);




/*------ SYSDBA 07/07/2023 23:15:14 --------*/

CREATE DESCENDING INDEX IDX_TBCONTRATO_EMISSAOD
ON TBCONTRATO (DATA_EMISSAO);

CREATE INDEX IDX_TBCONTRATO_EMISSAOA
ON TBCONTRATO (DATA_EMISSAO);




/*------ SYSDBA 07/07/2023 23:15:42 --------*/

CREATE INDEX IDX_TBCONTRATO_SITUACAO
ON TBCONTRATO (SITUACAO);




/*------ SYSDBA 07/07/2023 23:17:15 --------*/

CREATE DESCENDING INDEX IDX_TBCONTRATO_VALIDADED
ON TBCONTRATO (DATA_VALIDADE);

CREATE INDEX IDX_TBCONTRATO_VALIDADEA
ON TBCONTRATO (DATA_VALIDADE);

CREATE INDEX IDX_TBCONTRATO_DESTINO
ON TBCONTRATO (DESTINO);

