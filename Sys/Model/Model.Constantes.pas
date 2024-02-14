unit Model.Constantes;

interface

type
  TTipoPesquisa = (tpAutomatico, tpCodigo, tpDescricao);
  TTipoEmissorCheque = (tecNenhum, tecFornecedor, tecCliente);
  TTipoContaCorrente = (tccCaixa = 1, tccBanco = 2);

const
  CONST_MODEL_USER_NAME     = 'SYSDBA';
  CONST_MODEL_USER_PASSWORD = 'masterkey';
  CONST_MODEL_LC_CTYPE      = 'ISO8859_2';

  CONST_MODEL_USER_APP = 'ADMIN';

  CONST_CONFIG_SYSTEM_ACCOUNT_USER = 'sistemas@agilsoftwares.com';
  CONST_CONFIG_SYSTEM_ACCOUNT_PWD  = 'AgilSoftwares13';
  CONST_CONFIG_SYSTEM_ACCOUNT_POP  = 'pop.agilsoftwares.com';
  CONST_CONFIG_SYSTEM_ACCOUNT_SMTP = 'smtp.agilsoftwares.com';
  CONST_CONFIG_SYSTEM_ACCOUNT_PORT = 587;
  CONST_CONFIG_SYSTEM_ACCOUNT_AUTH = 1;
  CONST_CONFIG_SYSTEM_ACCOUNT_SSL  = 0;

implementation

end.
