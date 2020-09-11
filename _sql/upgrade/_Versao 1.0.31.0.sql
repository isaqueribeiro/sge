


/*------ SYSDBA 31/08/2020 20:53:09 --------*/

COMMENT ON TABLE SYS_LICENCA IS 'Tabela Licenca de Uso

    Autor   :   Isaque Marinho Ribeiro
    Data    :   31/08/2020

Tabela responsavel por armazenar, de forma criptografada, informacoes importantes
referentes a Licenca de Uso do sistema.';




/*------ SYSDBA 11/09/2020 10:29:52 --------*/

CREATE TABLE TBFORNECEDOR_PRODUTO (
    FORNECEDOR_CNPJ DMN_CNPJ_NN NOT NULL,
    FORNECEDOR_PRODUTO DMN_VCHAR_30_NN NOT NULL,
    CD_FORNECEDOR DMN_INTEGER_N,
    CD_PRODUTO DMN_VCHAR_10);

ALTER TABLE TBFORNECEDOR_PRODUTO
ADD CONSTRAINT PK_TBFORNECEDOR_PRODUTO
PRIMARY KEY (FORNECEDOR_CNPJ,FORNECEDOR_PRODUTO);

COMMENT ON COLUMN TBFORNECEDOR_PRODUTO.FORNECEDOR_CNPJ IS
'CPF/CNPJ do Fornecedor';

COMMENT ON COLUMN TBFORNECEDOR_PRODUTO.FORNECEDOR_PRODUTO IS
'Codigo do Produto/Servido na base do fornecedor.

Obs: Esta informacao esta na TAG "CProd" do arquivo XML da NF-e.';

COMMENT ON COLUMN TBFORNECEDOR_PRODUTO.CD_FORNECEDOR IS
'Codigo do Fornecedor no cadastro.';

COMMENT ON COLUMN TBFORNECEDOR_PRODUTO.CD_PRODUTO IS
'Codigo do Produto/Servico no cadastro';




/*------ SYSDBA 11/09/2020 10:29:53 --------*/

COMMENT ON TABLE TBFORNECEDOR_PRODUTO IS 'Tabela Fornecedor x Produto.

    Autor   :   Isaque M. Ribeiro
    Data    :   11/09/2020

Tabera responsavel por armazenar a referencia entre o produto/servico do fornecedor
vindo na nota fiscal e o cadastro do sistema da empresa.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    11/09/2020 - IMR :
        + Criacao e documentacao da tabela.';




/*------ SYSDBA 11/09/2020 10:30:46 --------*/

ALTER TABLE TBFORNECEDOR_PRODUTO
ADD CONSTRAINT FK_TBFORNECEDOR_PRODUTO_FRN
FOREIGN KEY (CD_FORNECEDOR)
REFERENCES TBFORNECEDOR(CODFORN)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE TBFORNECEDOR_PRODUTO
ADD CONSTRAINT FK_TBFORNECEDOR_PRODUTO_PRD
FOREIGN KEY (CD_PRODUTO)
REFERENCES TBPRODUTO(COD)
ON DELETE CASCADE
ON UPDATE CASCADE;

GRANT ALL ON TBFORNECEDOR_PRODUTO TO "PUBLIC";



COMMENT ON COLUMN TBFORNECEDOR_PRODUTO.FORNECEDOR_PRODUTO IS
'Codigo do Produto/Servido na base do fornecedor.

Obs: Esta informacao esta na TAG "CProd" do arquivo XML da NF-e.';

