


/*------ SYSDBA 01/02/2021 22:36:16 --------*/

CREATE TABLE SYS_CONFIG (
    KY_CONFIG DMN_VCHAR_150_NN NOT NULL,
    VL_CONFIG DMN_VCHAR_250,
    DH_CONFIG DMN_DATETIME);

ALTER TABLE SYS_CONFIG
ADD CONSTRAINT PK_SYS_CONFIG
PRIMARY KEY (KY_CONFIG);

COMMENT ON COLUMN SYS_CONFIG.KY_CONFIG IS
'Chave.';

COMMENT ON COLUMN SYS_CONFIG.VL_CONFIG IS
'Valor.';

COMMENT ON COLUMN SYS_CONFIG.DH_CONFIG IS
'Data/hora da insercao ou alteracao.';




/*------ SYSDBA 01/02/2021 22:36:17 --------*/

COMMENT ON TABLE SYS_CONFIG IS 'Tabela de Configuracoes Diversas

    Autor   :   Isaque M. Ribeiro
    Data    :   01/02/2021

Tabela responsavel por armazenar registros de configuracoes gerais importantes
de parametrizam o funcionamento dos sistemas.


Historico:

    Legendas:
        + Novo objeto de banco (Campos, Triggers)
        - Remocao de objeto de banco
        * Modificacao no objeto de banco

    01/02/2021 - IMR :
        + Criacao e documentacao da tabela.';

GRANT ALL ON SYS_CONFIG TO "PUBLIC";



/*------ SYSDBA 05/07/2021 13:37:21 --------*/

COMMENT ON COLUMN TBPRODUTO.CODUNIDADE IS
'Unidade de Compra';




/*------ SYSDBA 04/08/2021 22:28:06 --------*/

COMMENT ON COLUMN TBCONFIGURACAO.ESTOQUE_UNICO_EMPRESAS IS
'Trabalhar com estoque unificado de produtos entre as demais empresa:
0 - Nao
1 - Sim

A empresa que possue esta flag marcada tem acesso a todos os dados de produtos e
estoque das demais empresa.';



/*------ SYSDBA 08/08/2021 13:30:45 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 1.
Select.

*/

/*------ SYSDBA 08/08/2021 13:30:49 --------*/

/*!!! Error occured !!!
Invalid token.
Dynamic SQL Error.
SQL error code = -104.
Token unknown - line 2, column 1.
Select.

*/