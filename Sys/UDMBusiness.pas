unit UDMBusiness;

interface

uses
  {$IFDEF DGE}
  EUserAcs, EMsgDlg,
  {$ENDIF}
  Windows, Forms, SysUtils, Classes, Controls, IBX.IBDatabase, DB, IBX.IBCustomDataSet, IniFIles,
  ShellApi, Printers, DateUtils, IBX.IBQuery, IdCoder, IdCoder3to4, IdCoderMIME,
  frxClass, frxDBSet, IdBaseComponent, IdComponent, IdIPWatch, IBX.IBStoredProc,
  FuncoesFormulario, UConstantesDGE, IBX.IBUpdateSQL, DBClient,
  Provider, Dialogs, Registry, frxChart, frxCross, frxRich, frxExportMail,
  frxExportImage, frxExportRTF, frxExportXLS, frxExportPDF, ACBrBase,
  ACBrValidador, ACBrMail,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IBDef,
  FireDAC.Phys.FBDef, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  frxBarcode, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
  TSistema = record
    Codigo : Integer;
    Nome   : String;
  end;

  TUsuarioLogado = record
    Login    : String;
    Nome     : String;
    Funcao   : Integer;
    Empresa  : String;
    Vendedor : Integer;
  end;

  TContaEmail = record
    Conta : String;
    Senha : String;
    Servidor_POP    : String;
    Servidor_SMTP   : String;
    Porta_SMTP      : Integer;
    Assunto_Padrao    : String;
    Mensagem_Padrao   : String;
    Assinatura_Padrao : String;
    RequerAutenticacao : Boolean;
    ConexaoSeguraSSL   : Boolean;
  end;

  TLicenca = record
    Empresa  : String;
    CNPJ     : String;
    Endereco : String;
    Bairro : String;
    Cidade : String;
    UF     : String;
    CEP    : String;
    Competencia  : Integer;
    DataBloqueio : TDateTime;
    UsarSGE : Boolean;
    UsarSGI : Boolean;
    UsarSGF : Boolean;
  end;

  TBlocoImpressaoCupom = (bicCupomRelatorioGerencial, bicCupom, bicRelatorioGerencial);
  TTipoDANFE = (tipoDANFEFast, tipoDANFE_ESCPOS);

  TTipoRegime = (trSimplesNacional, trSimplesExcessoReceita, trRegimeNormal);
  TTipoMovimentoCaixa = (tmcxCredito, tmcxDebito);
  TTipoMovimentoEntrada = (tmeProduto, tmeServico);
  TDMBusiness = class(TDataModule)
    ibdtbsBusiness: TIBDatabase;
    ibtrnsctnBusiness: TIBTransaction;
    dtsrcAjustEstoq: TDataSource;
    ibdtstAjustEstoq: TIBDataSet;
    ibdtstProduto: TIBDataSet;
    ibdtstFornec: TIBDataSet;
    ibdtstAjustEstoqCODPROD: TIBStringField;
    ibdtstAjustEstoqCODFORN: TIntegerField;
    ibdtstAjustEstoqMOTIVO: TIBStringField;
    ibdtstAjustEstoqDOC: TIBStringField;
    ibdtstAjustEstoqDTAJUST: TDateTimeField;
    ibdtstAjustEstoqLookProdNome: TStringField;
    ibdtstAjustEstoqLookProdQtde: TIntegerField;
    ibdtstAjustEstoqLookFornec: TStringField;
    dtsrcUsers: TDataSource;
    IdIPWatch: TIdIPWatch;
    stpCaixaMovimentoREC: TIBStoredProc;
    stpCaixaMovimentoPAG: TIBStoredProc;
    stpContaCorrenteSaldo: TIBStoredProc;
    stpCaixaMovimentoREC_ESTORNO: TIBStoredProc;
    stpCaixaMovimentoPAG_ESTORNO: TIBStoredProc;
    ibdtstAjustEstoqCONTROLE: TIntegerField;
    ibdtstAjustEstoqCODEMPRESA: TIBStringField;
    ibdtstAjustEstoqQTDEATUAL: TIBBCDField;
    ibdtstAjustEstoqQTDENOVA: TIBBCDField;
    ibdtstAjustEstoqQTDEFINAL: TIBBCDField;
    ibdtstAjustEstoqUSUARIO: TIBStringField;
    cdsLicenca: TIBDataSet;
    cdsLicencaLINHA_CONTROLE: TIBStringField;
    opdLicenca: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxXLS: TfrxXLSExport;
    frxRTF: TfrxRTFExport;
    frxJPEG: TfrxJPEGExport;
    frxMailExport: TfrxMailExport;
    frxRichObject: TfrxRichObject;
    frxCrossObject: TfrxCrossObject;
    frxChartObject: TfrxChartObject;
    fastReport: TfrxReport;
    ACBrValidador: TACBrValidador;
    ACBrMail: TACBrMail;
    spAtualizarCustoApEntrada: TIBStoredProc;
    spAtualizarCustoApAutorizacao: TIBStoredProc;
    spAtualizarCustoEstoqueAlmoxarifado: TIBStoredProc;
    spAtualizarCustoEstoqueRequisicao: TIBStoredProc;
    spAtualizarCustoEstoqueInventario: TIBStoredProc;
    fdConexao: TFDConnection;
    fdIBDriverLink: TFDPhysIBDriverLink;
    fdFBDriverLink: TFDPhysFBDriverLink;
    fdTransacao: TFDTransaction;
    fdQryUsers: TFDQuery;
    fdQryEmpresa: TFDQuery;
    fdWaitCursor: TFDGUIxWaitCursor;
    fdSetSistema: TFDStoredProc;
    fdSetRotina: TFDStoredProc;
    fdQryConfiguracoes: TFDQuery;
    frxBarCodeObject: TfrxBarCodeObject;
    fdQryBusca: TFDQuery;
    fdQryCaixaAberto: TFDQuery;
    fdScript: TFDScript;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdScriptBeforeExecute(Sender: TObject);
    procedure fdScriptError(ASender: TObject; const AInitiator: IFDStanObject;
      var AException: Exception);
  private
    { Private declarations }

    _PermissaoPerfilDiretoria   ,
    _PermissaoPerfil_DIRETORIA  ,
    _PermissaoPerfil_GERENTE_VND,
    _PermissaoPerfil_GERENTE_FIN,
    _PermissaoPerfil_VENDEDOR   ,
    _PermissaoPerfil_GERENTE_ADM,
    _PermissaoPerfil_CAIXA      ,
    _PermissaoPerfil_AUX_FINANC1,
    _PermissaoPerfil_AUX_FINANC2,
    _PermissaoPerfil_SUPERV_CX  ,
    _PermissaoPerfil_ESTOQUISTA ,
    _PermissaoPerfil_SUPORTE_TI ,
    _PermissaoPerfil_SYSTEM_ADM : TStringList;
    procedure MontarPermissao;
    procedure MontarPermissao_Diretoria;
  public
    { Public declarations }
    procedure CarregarLicencaAuto;
    procedure CarregarLicenca(const sNomeArquivo : String);
    procedure ValidarLicenca(const sNomeArquivo : String; var CNPJ : String);
    procedure LimparLicenca;
    procedure ConfigurarEmail(const sCNPJEmitente, sDestinatario, sAssunto, sMensagem: String);

    function LiberarUsoLicenca(const dDataMovimento : TDateTime; const Alertar : Boolean = FALSE) : Boolean;
    function NovaLicencaDisponivel(const dDataLicenca : TDateTime) : Boolean;
  end;

var
  DMBusiness: TDMBusiness;

  FileINI : TIniFile;
  FormFunction : TFormularios;

  gSistema    : TSistema;
  gUsuarioLogado : TUsuarioLogado;
  gContaEmail : TContaEmail;
  gLicencaSistema : TLicenca;
  RegistroSistema : TRegistry;


  function IfThen(AValue: Boolean; const ATrue: string; AFalse: string = ''): string; overload;
  function IfThen(AValue: Boolean; const ATrue: TDateTime; AFalse: TDateTime = 0): TDateTime; overload;
  function IfThen(AValue: Boolean; const ATrue: Integer; AFalse: Integer = 0): Integer; overload;
  function IfThen(AValue: Boolean; const ATrue: Currency; AFalse: Currency = 0.0): Currency; overload;
  function IfThen(AValue: Boolean; const ATrue: Boolean; AFalse: Boolean = False): Boolean; overload;
  function EstacaoServidora(aServidor : String): Boolean;
  function ControlFBSvr(aStart : Boolean): Boolean;
  function DataBaseOnLine : Boolean;
  function GetVersionDB : Currency;

  function ShowConfirmation(sTitle, sMsg : String) : Boolean; overload;
  function ShowConfirmation(sMsg : String) : Boolean; overload;

  procedure UpgradeDataBase;
  procedure ShowInformation(sTitle, sMsg : String); overload;
  procedure ShowInformation(sMsg : String); overload;
  procedure ShowWarning(sMsg : String); overload;
  procedure ShowWarning(sTitulo, sMsg : String); overload;
  procedure ShowStop(sMsg : String); overload;
  procedure ShowStop(sTitulo, sMsg : String); overload;
  procedure ShowError(sMsg : String);
  procedure ShowErrorNotify(Sender: TObject; E: Exception);
  procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
  procedure CommitTransaction;
  procedure ExecuteScriptSQL(sScriptSQL : String);
  procedure ExecuteScriptMetaData(aFileName : String);

  procedure GetDataSet(const FDataSet : TClientDataSet; const sNomeTabela, sQuando, sOrdernarPor : String);

  procedure ExportarFR3_ToXSL(const FrrLayout: TfrxReport; var sFileName : String);

  procedure Desativar_Promocoes;
  procedure GerarSaldoContaCorrente(const ContaCorrente : Integer; const Data : TDateTime);
  procedure BloquearClientes;
  procedure DesbloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
  procedure BloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
  procedure GerarCompetencias(const pAno : Smallint);
  procedure RegistrarEmpresa;
  procedure RegistrarSegmentos(Codigo : Integer; Descricao : String);
  procedure RegistrarCaixaNaVenda(const AnoVenda, NumVenda, AnoCaixa, NumCaixa : Integer; const IsPDV : Boolean);
  procedure RegistrarCaixaNaOS(const AnoOS, NumOS, AnoCaixa, NumCaixa : Integer);
  {$IFDEF DGE}
  procedure RegistrarControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess);
  {$ENDIF}
  procedure CarregarConfiguracoesEmpresa(CNPJ : String; Mensagem : String; var AssinaturaHtml, AssinaturaTXT : String);
  procedure AliquotaIcms(const UF_Origem, UF_Destino : String;
    var aAliquotaInter, aAliquotaIntra, aAliquotaST : Currency);
  procedure AliquotaIss(const pEmpresa : String; const pUF, pCidade : Integer;
    var aAliquotaIss, aAliquotaPis, aAliquotaConfins : Currency);
  procedure SetEmpresaIDDefault(CNPJ : String);
  procedure SetSegmento(const iCodigo : Integer; const sDescricao : String);
  procedure SetSistema(iCodigo : Smallint; sNome, sVersao : String);
  procedure SetRotinaSistema(iTipo : Smallint; sCodigo, sDescricao, sRotinaPai : String);
  procedure SetCompetencia(const aData : TDateTime);
  procedure SetAtulizarCustoEstoque(const aData : TDateTime);
  procedure SetAtulizarCustoEstoqueApropriacao(const aData : TDateTime);
  procedure SetAtulizarCustoEstoqueAlmoxarifado(const aData : TDateTime);
  procedure SetAtulizarCustoEstoqueRequisicao(const aData : TDateTime);
  procedure SetAtulizarCustoEstoqueInventario(const aData : TDateTime);
  procedure SetCentroCustoGeral(const aEmpresa : String);
  procedure SetTipoDespesaPadrao;
  procedure SetTipoReceitaPadrao;
  procedure SetTipoProduto(const iCodigo : Integer; const sDescricao : String);
  procedure SetTiposProdutos;

  procedure CarregarListaDB(const pDataSet : TDataSet);

  function EncriptSenha_Master(const Value, Key : String) : String;
  function DecriptarSenha_Master(const Value, Key : String) : String;
  function DelphiIsRunning : Boolean;
  function GetDirectoryTempApp : String;

  function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
  function GetPaisIDDefault : String;
  function GetEstadoIDDefault : Integer;
  function GetCidadeIDDefault : Integer;
  function GetCfopIDDefault : Integer;
  function GetCfopEntradaIDDefault : Integer;
  function GetCfopDevolucao(const iCfop : Integer) : Boolean;
  function GetCfopGerarTitulo(const iCfop : Integer) : Boolean;
  function GetCfopGerarDuplicata(const iCfop : Integer) : Boolean;
  function GetEmpresaIDDefault : String;
  function GetClienteIDDefault : Integer;
  function GetVendedorIDDefault : Integer;
  function GetFormaPagtoIDDefault : Integer;
  function GetCondicaoPagtoIDDefault : Integer;
  function GetEstacaoEmitiBoleto : Boolean;
  function GetEstacaoEmitiNFe(const sCNPJEmpresa : String) : Boolean;
  function GetEstacaoEmitiNFSe : Boolean;
  function GetCondicaoPagtoIDBoleto_Descontinuada : Integer;  // Descontinuada
  function GetEmitirApenasOrcamento : Boolean;
  function GetEmitirCupom : Boolean;
  function GetEmitirCupomAutomatico : Boolean;
  function GetModeloEmissaoCupom : Integer;
  function GetCupomNaoFiscalTipoEmissaoID : Integer;
  function GetCupomNaoFiscalPortaID : Integer;
  function GetCupomNaoFiscalPortaDS : String;
  function GetCupomNaoFiscalPortaNM : String;
  function GetCupomNaoFiscalModeloEspID : Integer;
  function GetCupomNaoFiscalEmitir : Boolean;
  function GetCupomNaoFiscalFonteNome : String;
  function GetCupomNaoFiscalFonteTamanho : Integer;
  function GetSegmentoID(const CNPJ : String) : Integer;
  function GetCompetenciaID(const aDataMovimento : TDateTime) : Integer;
  {$IFDEF DGE}
  function GetControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess) : Boolean;
  {$ENDIF}
  function GetEmailEmpresa(const sCNPJEmpresa : String) : String;
  function GetCalcularCustoOperEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetPermitirVendaEstoqueInsEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetPermitirDuplicarCNPJCliente(const sCNPJEmpresa : String) : Boolean;
  function GetPermitirVerdadeiroFalsoCNPJCliente(const sCNPJEmpresa : String) : Boolean;
  function GetAutorizacaoInformarCliente(const sCNPJEmpresa : String) : Boolean;
  function GetSimplesNacionalInsEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetEstoqueUnificadoEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetEstoqueSateliteEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetRegimeEmpresa(const sCNPJEmpresa : String) : TTipoRegime;
  function GetRazaoSocialEmpresa(const sCNPJEmpresa : String) : String;
  function GetNomeFantasiaEmpresa(const sCNPJEmpresa : String) : String;
  function GetCnpjEmpresa(const iCodigo : Integer) : String;
  function GetCnaeEmpresa(const sCNPJEmpresa : String) : String;
  function GetPrazoValidadeAutorizacaoCompra(const sCNPJEmpresa : String) : Integer;
  function GetPrazoValidadeCotacaoCompra(const sCNPJEmpresa : String) : Integer;
  function GetMenorDataEmissaoOS : TDateTime;

  function StrIsCNPJ(const Num: string): Boolean;
  function StrIsCPF(const Num: string): Boolean;
  function StrIsDateTime(const S: string): Boolean;
  function StrIsInteger(const Num: string): Boolean;
  function StrFormatar(Documento, Complemento : String; const TipoDocumento : TACBrValTipoDocto): String;
  function StrFormatarCnpj(sCnpj: String): String;
  function StrFormatarCpf(sCpf: String): String;
  function StrFormatarCEP(sCEP: String): String;
  function StrFormatarFONE(sFone: String): String;
  function StrDescricaoProduto(const NoPlural : Boolean = TRUE) : String;
  function StrDescricaoProdutoBtn(const NoPlural : Boolean = TRUE) : String;
  function StrOnlyNumbers(const Str : String) : String;
  Function StrInscricaoEstadual(const IE, UF : String) : Boolean;

  function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
  function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;

  function GetGeneratorID(const GeneratorName : String) : Integer;
  function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
  function GetCountID(NomeTabela : String; const sWhere : String = '') : Largeint;
  function GetGuidID38 : String;
  function GetPaisNomeDefault : String;
  function GetEstadoNomeDefault : String;
  function GetEstadoNome(const iEstado : Integer) : String; overload;
  function GetEstadoNome(const sSigla : String) : String; overload;
  function GetEstadoID(const sSigla : String) : Integer;
  function GetEstadoUF(const iEstado : Integer) : String;
  function GetCidadeNomeDefault : String;
  function GetCidadeNome(const iCidade : Integer) : String;
  function GetCidadeCEP(const iCidade : Integer) : String;
  function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer; overload;
  function GetCidadeID(const sCEP : String) : Integer; overload;
  function GetBairroNome(const iBairro : Integer) : String;
  function GetLogradouroNome(const iLogradouro : Integer) : String;
  function GetLogradouroTipo(const iLogradouro : Integer) : String;
  function GetCfopNomeDefault : String;
  function GetCfopNome(const iCodigo : Integer) : String;
  function GetCfopEntradaNomeDefault : String;
  function GetEmpresaNomeDefault : String;
  function GetEmpresaNome(const sCNPJEmpresa : String) : String;
  function GetEmpresaEnderecoDefault : String;
  function GetEmpresaEndereco(const sCNPJEmitente : String) : String;
  function GetEmpresaUF(const sCNPJEmitente : String) : String;
  function GetClienteNomeDefault : String;
  function GetClienteNome(const iCodigo : Integer) : String;
  function GetClienteEmail(const iCodigo : Integer) : String;
  function GetClienteUF(const iCodigo : Integer) : String;
  function GetClienteEndereco(const aCodigo : Integer; const aQuebrarLinha : Boolean = FALSE) : String;
  function GetClienteCnpfCpf(const aCodigo : Integer) : String;
  function GetClienteBloqueado(const aCodigo : Integer; var aMotivo : String) : Boolean;
  function GetFornecedorEmail(const iCodigo : Integer) : String;
  function GetFornecedorRazao(const iCodigo : Integer) : String;
  function GetFornecedorContato(const iCodigo : Integer) : String;
  function GetFornecedorUF(const iCodigo : Integer) : String;
  function GetFornecedorCodigo(const aCnpj : String) : Integer;
  function GetVendedorNomeDefault : String;
  function GetVendedorNome(const iCodigo : Integer) : String;
  function GetFormaPagtoNomeDefault : String;
  function GetFormaPagtoNome(const iCodigo : Integer) : String;
  function GetFormaPagtoCondicaoPagto(const iFormaPagto, iCondicaoPagto : Integer) : Boolean;
  function GetCondicaoPagtoNomeDefault : String;
  function GetCondicaoPagtoNome(const iCodigo : Integer) : String;
  function GetCondicaoPagtoAPrazo(const iCodigo : Integer) : Boolean;
  function GetTabelaIBPT_Codigo(const aCodigoNCM : String) : Integer;
  function GetBancoBoletoCodigo(const aEmpresa, aCodigoFebraban : String) : Integer;
  function GetSenhaAutorizacao : String;
  function GetDateTimeDB : TDateTime;
  function GetDateDB : TDateTime;
  function GetDateLastMonth : TDateTime;
  function GetProximoDiaUtil(const Data : TDateTime) : TDateTime;
  function GetTimeDB : TDateTime;
  function GetUserApp : String;
  function GetUserFullName : String;
  function GetUserFunctionID : Integer;
  function GetUserCodigoVendedorID : Integer;
  function GetUserUpdatePassWord : Boolean;
  function GetLimiteDescontoUser : Currency;
  function GetUserPermitirAlterarValorVenda : Boolean;
  function GetUserPermitirAlterarValorVendaLivre : Boolean;
  function GetUserPermitirAlterarValorVendaParaMaior : Boolean;
  function GetUserPermitirAlterarValorVendaParaMenor : Boolean;
  function GetUserManifestoAutomatico : Boolean;
  function GetPermititEmissaoNFe(const sCNPJEmitente : String) : Boolean;
  function GetPermititEmissaoNFeEntrada(const sCNPJEmitente : String) : Boolean;
  function GetPermititNFeDenegada(const sCNPJEmitente : String) : Boolean;
  function GetSolicitaDHSaidaNFe(const sCNPJEmitente : String) : Boolean;
  function GetImprimirCodClienteNFe(const sCNPJEmitente : String) : Boolean;
  function GetExisteCPF_CNPJ(iCodigoCliente : Integer; sCpfCnpj : String; var iCodigo : Integer; var sRazao : String) : Boolean;
  function GetExisteNumeroAutorizacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetExisteNumeroCotacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetExisteNumeroSolicitacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetExisteNumeroRequisicao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetExisteNumeroApropriacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetExisteNumeroRequisicaoAlmox(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetMenorVencimentoAPagar : TDateTime;
  function GetMenorVencimentoAReceber : TDateTime;
  function GetMenorDataEmissaoReqAlmoxEnviada(const aEmpresa : String; const aCentroCusto : Integer) : TDateTime;
  function GetMenorDataApropriacaoAberta(const aEmpresa : String; const aCentroCusto : Integer) : TDateTime;
  function GetMenorDataChequePendente : TDateTime;
  function GetCarregarProdutoCodigoBarra(const sCNPJEmitente : String) : Boolean;
  function GetCarregarProdutoCodigoBarraLocal : Boolean;
  function GetCarregarPapelDeParedeLocal : Boolean;
  function GetAjustarDataHoraEstacao : Boolean;
  function GetPermissaoRotinaSistema(sRotina : String; const Alertar : Boolean = FALSE) : Boolean;
  function GetRotinaPaiIDSistema(const RotinaID : String): String;
  function GetQuantidadeEmpresasEmiteNFe : Integer;
  function GetTokenID_NFCe(const Empresa : String) : String;
  function GetToken_NFCe(const Empresa : String) : String;
  function GetFormaPagtoCartaCredito(const Empresa : String) : Integer;

  function SetAcessoEstacao(const sHostName : String) : Boolean;

  function CaixaAberto(const Empresa, Usuario : String;
    const DataRef : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;

  function SetMovimentoCaixa(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
  function SetMovimentoCaixaEstorno(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;

const
  DB_USER_NAME     = 'SYSDBA';
  DB_USER_PASSWORD = 'masterkey';
  DB_LC_CTYPE      = 'ISO8859_2';

  MODELO_CUPOM_POOLER    = 0;
  MODELO_CUPOM_ORCAMENTO = 0;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif'; //gif
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  STATUS_VND_AND = 1;
  STATUS_VND_ABR = 2;
  STATUS_VND_FIN = 3;
  STATUS_VND_NFE = 4;
  STATUS_VND_CAN = 5;

  STATUS_OS_EDT = 0; // Em edição
  STATUS_OS_ABR = 1; // Aberta
  STATUS_OS_AVL = 2; // Em avaliação pelo técnico
  STATUS_OS_PAR = 3; // Parecer
  STATUS_OS_APR = 4; // Aprovada
  STATUS_OS_ATE = 5; // Em atendimento pelo técnico
  STATUS_OS_FIN = 6; // Finalizada em atendimento
  STATUS_OS_FAT = 7; // Faturada
  STATUS_OS_NFS = 8; // Nota Fiscal de Serviço emitida
  STATUS_OS_CAN = 9; // Cancelada

  STATUS_CMP_ABR = 1;
  STATUS_CMP_FIN = 2;
  STATUS_CMP_CAN = 3;
  STATUS_CMP_NFE = 4;

  STATUS_REQ_ABR = 1;
  STATUS_REQ_AUT = 2;
  STATUS_REQ_FCH = 3;
  STATUS_REQ_CAN = 4;

  STATUS_AUTORIZACAO_EDC = 0;
  STATUS_AUTORIZACAO_ABR = 1;
  STATUS_AUTORIZACAO_AUT = 2;
  STATUS_AUTORIZACAO_FAT = 3;
  STATUS_AUTORIZACAO_CAN = 4;

  STATUS_REQUISICAO_EDC = STATUS_AUTORIZACAO_EDC;
  STATUS_REQUISICAO_ABR = STATUS_AUTORIZACAO_ABR;
  STATUS_REQUISICAO_REQ = STATUS_AUTORIZACAO_AUT;
  STATUS_REQUISICAO_FAT = STATUS_AUTORIZACAO_FAT;
  STATUS_REQUISICAO_CAN = STATUS_AUTORIZACAO_CAN;

  STATUS_CHEQUE_PENDENTE    = 0;
  STATUS_CHEQUE_APRESENTADO = 1;
  STATUS_CHEQUE_DEVOLVIDO   = 2;
  STATUS_CHEQUE_COMPENSADO  = 8;
  STATUS_CHEQUE_CANCELADO   = 9;

  TIPO_CHEQUE_EMITIDO  = 1;
  TIPO_CHEQUE_RECEBIDO = 2;

  TIPO_AUTORIZACAO_COMPRA         = 1;
  TIPO_AUTORIZACAO_SERVICO        = 2;
  TIPO_AUTORIZACAO_COMPRA_SERVICO = 3;

  TIPO_REQUISICAO_COMPRA         = TIPO_AUTORIZACAO_COMPRA;
  TIPO_REQUISICAO_SERVICO        = TIPO_AUTORIZACAO_SERVICO;
  TIPO_REQUISICAO_COMPRA_SERVICO = TIPO_AUTORIZACAO_COMPRA_SERVICO;

  TIPO_COTACAO_COMPRA         = TIPO_AUTORIZACAO_COMPRA;
  TIPO_COTACAO_SERVICO        = TIPO_AUTORIZACAO_SERVICO;
  TIPO_COTACAO_COMPRA_SERVICO = TIPO_AUTORIZACAO_COMPRA_SERVICO;

  TIPO_SOLICITACAO_COMPRA         = TIPO_AUTORIZACAO_COMPRA;
  TIPO_SOLICITACAO_SERVICO        = TIPO_AUTORIZACAO_SERVICO;
  TIPO_SOLICITACAO_COMPRA_SERVICO = TIPO_AUTORIZACAO_COMPRA_SERVICO;

  TIPO_APROPRIACAO_GERAL   = 0;
  TIPO_APROPRIACAO_ENTRADA = 1;
  TIPO_APROPRIACAO_AUTORIZ = 2;

  TIPO_REQUISICAO_ALMOX_CI = 0;
  TIPO_REQUISICAO_ALMOX_CP = 1;
  TIPO_REQUISICAO_ALMOX_TE = 2;

  STATUS_COTACAO_EDC = 0;
  STATUS_COTACAO_ABR = 1;
  STATUS_COTACAO_COT = 2;
  STATUS_COTACAO_ENC = 3;
  STATUS_COTACAO_CAN = 4;

  STATUS_APROPRIACAO_ESTOQUE_EDC = 0;
  STATUS_APROPRIACAO_ESTOQUE_ABR = 1;
  STATUS_APROPRIACAO_ESTOQUE_ENC = 2;
  STATUS_APROPRIACAO_ESTOQUE_CAN = 3;

  STATUS_REQUISICAO_ALMOX_EDC = 0;
  STATUS_REQUISICAO_ALMOX_ABR = 1;
  STATUS_REQUISICAO_ALMOX_ENV = 2;
  STATUS_REQUISICAO_ALMOX_REC = 3;
  STATUS_REQUISICAO_ALMOX_ATD = 4;
  STATUS_REQUISICAO_ALMOX_CAN = 5;

  STATUS_ITEM_REQUISICAO_ALMOX_PEN = 0;
  STATUS_ITEM_REQUISICAO_ALMOX_AGU = 1;
  STATUS_ITEM_REQUISICAO_ALMOX_ATE = 2;
  STATUS_ITEM_REQUISICAO_ALMOX_ENT = 3;
  STATUS_ITEM_REQUISICAO_ALMOX_CAN = 4;

  STATUS_INVENTARIO_ALMOX_EML = 0;
  STATUS_INVENTARIO_ALMOX_EMC = 1;
  STATUS_INVENTARIO_ALMOX_ENC = 2;
  STATUS_INVENTARIO_ALMOX_CAN = 3;

  STATUS_SOLICITACAO_EDC = 0;
  STATUS_SOLICITACAO_ABR = 1;
  STATUS_SOLICITACAO_FIN = 2;
  STATUS_SOLICITACAO_APR = 3;
  STATUS_SOLICITACAO_CAN = 4;

  // Mensagens padrões do sistema
  CLIENTE_BLOQUEADO_PORDEBITO = 'Cliente bloqueado automaticamente pelo sistema por se encontrar com títulos vencidos. Favor buscar mais informações junto ao FINANCEIRO.';

implementation

uses
  UFuncoes, UGrMessage, UDMRecursos;

{$R *.dfm}

function IfThen(AValue: Boolean; const ATrue: string;
  AFalse: string = ''): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: TDateTime; AFalse: TDateTime = 0): TDateTime;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: Integer; AFalse: Integer = 0): Integer;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: Currency; AFalse: Currency = 0.0): Currency;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function IfThen(AValue: Boolean; const ATrue: Boolean; AFalse: Boolean = False): Boolean;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

(*
function NetWorkActive(const Alertar : Boolean = FALSE) : Boolean;
var
  Enviar    ,
  Return    : Boolean;
  sFileName : String;
  Registro  : TStringList;

  sCNPJ     ,
  sRazao    ,
  sFantasia ,
  sTelefone ,
  sSistema  ,
  sHostID   ,
  sHostName : String;
const
  sLocalHost : String = '127.0.0.1';
begin
  Return   := False;

  Registro := TStringList.Create;
  try

    try
      sSistema  := StringReplace( ExtractFileName(ParamStr(0)), '.exe', '', [rfReplaceAll] );
      sFileName := ExtractFilePath(ParamStr(0)) + 'NetWorkActive' + sSistema + '.dll';

      Return := FileExists( sFileName );
      Enviar := not Return;

      // Abrir arquivo para verificar a data
      if ( Return ) then
      begin
        Registro.LoadFromFile( sFileName );
        Return := ( FormatDateTime('dd/mm/yyyy', Date) = Trim(Registro.Strings[0]) );
        if ( not Return ) then
        begin
          DeleteFile( sFileName );
          Enviar := True;
        end;
      end;

      // --- Conectar ao servidor para registrar cliente (INICIO)
      if ( not Return ) then
      begin
        Registro.Clear;
        Registro.BeginUpdate;
        Registro.Add( FormatDateTime('dd/mm/yyyy', Date) );
        Registro.Add( sHostID );
        Registro.Add( sHostName );
        Registro.Add( sSistema );

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Select * from TBEMPRESA');
          Open;

          while not Eof do
          begin
            sCNPJ     := Trim( FieldByName('CNPJ').AsString );
            sRazao    := Trim( FieldByName('RZSOC').AsString );
            sFantasia := Trim( FieldByName('NMFANT').AsString );
            sTelefone := Trim( FieldByName('FONE').AsString );

            Registro.Add( '-- CLIENTE --' );
            Registro.Add( 'CNPJ     : ' + sCNPJ );
            Registro.Add( 'Razão    : ' + sRazao );
            Registro.Add( 'Fantasia : ' + sFantasia );
            Registro.Add( 'Fone     : ' + sTelefone );
            Registro.Add( '--' );

            Next;
          end;

          Close;

          Return := True;
        end;

        Registro.EndUpdate;
        Registro.SaveToFile( sFileName );

      end;

      if ( Return and Enviar ) then
      begin

        // Enviando dados para o FTP MasterDados
        try

          try
//            IdFTP.Username := 'masterdados';
//            IdFTP.Password := 'masterdados';
//            IdFTP.Host     := 'ftp.masterdados.com.br';
//            IdFTP.Connect;
//
//            IdFTP.ChangeDir('/client_license');
//            IdFTP.Put(sFileName, Trim(sHostName) + '_' + Trim(sCNPJ) + '.txt');

            Return := True;
          except
//            Return := False;
          end;

        finally
//          IdFTP.Disconnect;
        end;

      end;
      // --- Conectar ao servidor para registrar cliente (FINAL)

      if ( Alertar and (not Return) ) then
        if ( sHostID =  sLocalHost ) then
          Application.MessageBox('Não foi possível conectar a Internet para validação de recursos visto que a máquina não está em rede.', 'Alerta', MB_ICONEXCLAMATION)
        else
          Application.MessageBox('Não foi possível conectar a Internet para validação de recursos.', 'Alerta', MB_ICONEXCLAMATION);

    except
      Return := False;
    end;

  finally
    Registro.Free;

    Result := Return;
  end;
end;
*)

function EstacaoServidora(aServidor : String): Boolean;
var
  aRetorno : Boolean;
  sEstacaoNM,
  sEstacaoIP,
  sServidor : String;
begin
  aRetorno  := False;

  try
    sEstacaoIP := GetIPLocal;
    sEstacaoNM := GetHostNameLocal;
    sServidor  := AnsiLowerCase(aServidor);

    aRetorno := (sEstacaoIP = sServidor) or (sEstacaoNM = sServidor)
      or (sServidor = 'localhost')
      or (sServidor = '127.0.0.1')
      or (sServidor = '.');
  finally
    Result := aRetorno;
  end;
end;

function ControlFBSvr(aStart : Boolean): Boolean;
var
  aRetorno : Boolean;
  szBuff   : String;
begin
  aRetorno := False;

  with TRegistry.Create do
  begin
    try
      RootKey  := HKEY_LOCAL_MACHINE;
      aRetorno := OpenKey('SOFTWARE\Firebird Project\Firebird Server\Instances', False);

      if not aRetorno then
      begin
        CloseKey;
        RootKey  := HKEY_LOCAL_MACHINE;
        aRetorno := OpenKey('SOFTWARE\Wow6432Node\Firebird Project\Firebird Server\Instances', False);
      end;

      if aRetorno then
      begin
        szBuff   := ReadString('DefaultInstance') + 'bin\instsvc.exe';
        aRetorno := FileExists(szBuff);

        if aRetorno then
          case aStart of
            True  : ShellExecute(0, nil, PChar(szBuff), '-s start', nil, SW_HIDE);   // -s Superserver
            False : ShellExecute(0, nil, PChar(szBuff), '-s stop', nil, SW_HIDE);    // -c ClientServer
          end;

        CloseKey;
      end;
    finally
      Free;
      Result := aRetorno;
    end;
  end;

end;

function DataBaseOnLine : Boolean;
begin
  Result := DMBusiness.ibdtbsBusiness.Connected;
end;

function GetVersionDB : Currency;
begin
  Result := 01001600.0; // 1.0.16.0
end;

function ShowConfirmation(sTitle, sMsg : String) : Boolean;
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Confirmar(sTitle, sMsg);

      Result := (fMsg.ShowModal = mrYes);
    finally
      fMsg.Free;
    end
  else
    Result := (MessageDlg(PChar(sMsg), mtConfirmation, [mbYes, mbNo], 0) = ID_YES);
//    Result := (Application.MessageBox(PChar(sMsg), PChar(sTitle), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES);
end;

function ShowConfirmation(sMsg : String) : Boolean;
begin
  Result := ShowConfirmation('Confirmar', sMsg);
end;

procedure UpgradeDataBase;
var
  aFileUpgrade : String;
  aVersaoUpgrade,
  aVersaoBase   ,
  aVersaoApp    : Currency;
begin
  aVersaoBase    := GetVersionDB + 1;
  aVersaoApp     := GetVersionID;
  aVersaoUpgrade := aVersaoBase;
  while (aVersaoUpgrade <= aVersaoApp) do
  begin
    aFileUpgrade := ExtractFilePath(ParamStr(0)) + CurrToStr(aVersaoUpgrade) + '.sql';
    ExecuteScriptMetaData(aFileUpgrade);

    aVersaoUpgrade := aVersaoUpgrade + 1;
  end;
end;

procedure ShowInformation(sTitle, sMsg : String);
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Informe(sTitle, sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    Application.MessageBox(PChar(sMsg), PChar(sTitle), MB_ICONINFORMATION);
end;

procedure ShowInformation(sMsg : String);
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Informe('Informação', sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    MessageDlg(PChar(sMsg), mtInformation, [mbOK], 0);
end;

procedure ShowWarning(sMsg : String);
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Alerta('Alerta', sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    MessageDlg(PChar(sMsg), mtWarning, [mbOK], 0);
end;

procedure ShowWarning(sTitulo, sMsg : String);
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Alerta(IfThen(Trim(sTitulo) = EmptyStr, 'Alerta', Trim(sTitulo)), sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    Application.MessageBox(PChar(sMsg), PChar(IfThen(Trim(sTitulo) = EmptyStr, 'Alerta', Trim(sTitulo))), MB_ICONWARNING);
end;

procedure ShowStop(sMsg : String);
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Parar('Pare!', sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    Application.MessageBox(PChar(sMsg), 'Pare!', MB_ICONSTOP);
end;

procedure ShowStop(sTitulo, sMsg : String);
var
  fMsg : TfrmGeMessage;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TfrmGeMessage.Create(Application);
      fMsg.Parar(IfThen(Trim(sTitulo) = EmptyStr, 'Pare!', Trim(sTitulo)), sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    Application.MessageBox(PChar(sMsg), PChar(IfThen(Trim(sTitulo) = EmptyStr, 'Pare!', Trim(sTitulo))), MB_ICONSTOP);
end;

procedure ShowError(sMsg : String);
var
  sLOG_Error : TStringList;
begin
  sLOG_Error := TStringList.Create;
  try
    sLOG_Error.BeginUpdate;
    sLOG_Error.Add('Aplicativo: ' + Application.Title);
    sLOG_Error.Add('Versão    : ' + GetVersion);
    sLOG_Error.Add('-');
    sLOG_Error.Add('ERRO:');
    sLOG_Error.Add(sMsg);
    sLOG_Error.EndUpdate;

    ForceDirectories(ExtractFilePath(Application.ExeName) + '_logError\');
    sLOG_Error.SaveToFile(ExtractFilePath(Application.ExeName) + '_logError\' + FormatDateTime('yyyy-mm-dd.hhmmss".log"', Now));

    MessageDlg(PChar(sMsg), mtError, [mbOK], 0);
  finally
    sLOG_Error.Free;
  end;
end;

procedure ShowErrorNotify(Sender: TObject; E: Exception);
var
  sLOG_File  : String;
  sLOG_Error : TStringList;
begin
  sLOG_File  := ExtractFilePath(Application.ExeName) + '_logError\' + FormatDateTime('yyyy-mm-dd.hhmmss".log"', Now);
  sLOG_Error := TStringList.Create;
  try
    sLOG_Error.BeginUpdate;
    sLOG_Error.Add('Cliente   : ' + gLicencaSistema.Empresa);
    sLOG_Error.Add('Aplicativo: ' + Application.Title);
    sLOG_Error.Add('Versão    : ' + GetVersion);
    sLOG_Error.Add('-');
    sLOG_Error.Add('UnitName  : ' + Sender.UnitName);
    sLOG_Error.Add('ClassName : ' + E.ClassName);
    sLOG_Error.Add('-');
    sLOG_Error.Add('ERROR MESSAGE:');
    sLOG_Error.Add(E.Message);
    sLOG_Error.EndUpdate;

    ForceDirectories(ExtractFilePath(sLOG_File));
    sLOG_Error.SaveToFile(sLOG_File);

    MessageDlg(PChar(E.Message), mtError, [mbOK], 0);
  finally
    sLOG_Error.Free;
  end;
end;

procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
var
  ID : Largeint;
begin
//  with DMBusiness, qryBusca do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhr);
//    Open;
//
//    ID := FieldByName('ID').AsInteger;
//
//    Close;
//    SQL.Clear;
//    SQL.Add('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH ' + IntToStr(ID));
//    ExecSQL;
//
//    CommitTransaction;
//  end;
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhr);
    Open;

    ID := FieldByName('ID').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH ' + IntToStr(ID));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure CommitTransaction;
begin
  with DMBusiness do
  begin
    ibtrnsctnBusiness.CommitRetaining;

    if fdConexao.InTransaction then
      fdConexao.CommitRetaining;
  end;
end;

procedure ExecuteScriptSQL(sScriptSQL : String);
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add( Trim(sScriptSQL) );
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure ExecuteScriptMetaData(aFileName : String);
begin
  if FileExists(aFileName) then
    with DMBusiness, fdScript do
    begin
      SQLScriptFileName := aFileName;
      ValidateAll;
      ExecuteAll;
      CommitTransaction;

      RenameFile(aFileName, ChangeFileExt(aFileName, '.upgraded'));
    end;
end;

procedure GetDataSet(const FDataSet : TClientDataSet; const sNomeTabela, sQuando, sOrdernarPor : String);
var
  qry : TIBQuery;
  dsp : TDataSetProvider;
  cds : TClientDataSet;
begin
  qry := TIBQuery.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);
  try
    qry.Database    := DMBusiness.ibdtbsBusiness;
    qry.Transaction := DMBusiness.ibtrnsctnBusiness;

    with qry do
    begin
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Select * ');
      SQL.Add('from ' + sNomeTabela);

      if ( Trim(sQuando) <> EmptyStr ) then
        SQL.Add('where ' + sQuando);

      if ( Trim(sOrdernarPor) <> EmptyStr ) then
        SQL.Add('order by ' + sOrdernarPor);

      SQL.EndUpdate;
    end;

    dsp.DataSet := qry;
    cds.SetProvider( dsp );
    cds.Open;

    FDataSet.CloneCursor(cds, False);
  finally
    cds.Free;
    dsp.Free;
    qry.Free;
  end;
end;

procedure ExportarFR3_ToXSL(const FrrLayout: TfrxReport; var sFileName : String);
begin
  KillTask('EXCEL.EXE');

  with DMBusiness, FrrLayout, PrintOptions do
  begin
    if FileExists(sFileName) then
      DeleteFile(sFileName);

    ForceDirectories( ExtractFilePath(sFileName) );
    PrepareReport;
    frxXLS.FileName := sFileName;
    frxXLS.Report   := FrrLayout;

    Export(frxXLS);

    sFileName := frxXLS.FileName;
  end;
end;

procedure Desativar_Promocoes;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBPROMOCAO Set Ativa = 0');
    SQL.Add('where (Ativa = 1) and ((Data_inicio > Current_date) or (Data_final < Current_date))');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure GerarSaldoContaCorrente(const ContaCorrente : Integer; const Data : TDateTime);
begin
  try

    try

      with DMBusiness, stpContaCorrenteSaldo do
      begin
        ParamByName('CONTA_CORRENTE').AsInteger  := ContaCorrente;
        ParamByName('DATA_MOVIMENTO').AsDateTime := Data;

        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar atualizar saldo diário de conta corrente.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure BloquearClientes;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set');
    SQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
    SQL.Add('  , Bloqueado = 1');
    SQL.Add('  , Bloqueado_automatico = 1');
    SQL.Add('  , Bloqueado_data = Current_date');
    SQL.Add('  , Bloqueado_usuario = user');
    SQL.Add('  , Usuario = user');
    SQL.Add('  , Desbloqueado_data = null');
    SQL.Add('  , Bloqueado_motivo = ' + QuotedStr(CLIENTE_BLOQUEADO_PORDEBITO));
    SQL.Add('where Bloqueado = 0');
    SQL.Add('  and ((Desbloqueado_data is null) or (Desbloqueado_data <> Current_date))');
    SQL.Add('  and Codigo in (');
    SQL.Add('    Select Distinct');
    SQL.Add('      r.Cliente');
    SQL.Add('    from TBCONTREC r');
    SQL.Add('    where r.Parcela  > 0'); // Parcelas a prazo
    SQL.Add('      and r.Situacao = 1'); // Situação ativa
    SQL.Add('      and r.Baixado  = 0'); // Títulos não baixados (em aberto)
    SQL.Add('      and r.Cliente  <> ' + IntToStr(CONSUMIDOR_FINAL_CODIGO));
    // O cliente encontra-se bloqueado por haver títulos em atraso.
    SQL.Add('      and r.Dtvenc < Current_date');
    SQL.Add('  )');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure DesbloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set');
    SQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
    SQL.Add('  , Desbloqueado_data = Current_date');
    SQL.Add('  , Bloqueado = 0');
    SQL.Add('  , Bloqueado_automatico = 0');
    SQL.Add('  , Bloqueado_data = Null');
    SQL.Add('  , Bloqueado_usuario = Null');
    SQL.Add('  , Usuario = ' + QuotedStr(gUsuarioLogado.Login));

    if Trim(Motivo) = EmptyStr then
      SQL.Add('  , Bloqueado_motivo = Null')
    else
      SQL.Add('  , Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));

    SQL.Add('where Codigo = ' + IntToStr(iCodigoCliente));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure BloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set');
    SQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
    SQL.Add('  , Desbloqueado_data = Null');
    SQL.Add('  , Bloqueado = 1');
    SQL.Add('  , Bloqueado_automatico = 0');
    SQL.Add('  , Bloqueado_data = Current_date');
    SQL.Add('  , Bloqueado_usuario = ' + QuotedStr(gUsuarioLogado.Login));
    SQL.Add('  , Usuario = ' + QuotedStr(gUsuarioLogado.Login));

    if Trim(Motivo) = EmptyStr then
      SQL.Add('  , Bloqueado_motivo = Null')
    else
      SQL.Add('  , Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));

    SQL.Add('where Codigo = ' + IntToStr(iCodigoCliente));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure GerarCompetencias(const pAno: Smallint);
var
  I : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    for I := 1 to 12 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Execute Procedure SET_COMPETENCIA(' + Copy(IntToStr(pAno), 1, 4) + FormatFloat('00', I) + ', null)');
      ExecSQL;
    end;

    CommitTransaction;
  end;
end;

procedure RegistrarEmpresa;
var
  bRegistrada : Boolean;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  e.codigo');
      SQL.Add('from TBEMPRESA e');
      SQL.Add('where e.cnpj = ' + QuotedStr(StrOnlyNumbers(gLicencaSistema.CNPJ)));
      Open;

      bRegistrada := (FieldByName('codigo').AsInteger = 1);

      Close;

      SQL.Clear;

      if not bRegistrada then
      begin
        SQL.Add('Insert Into TBEMPRESA (');
        SQL.Add('    codigo');
        SQL.Add('  , cnpj');
        SQL.Add('  , pessoa_fisica');
        SQL.Add('  , rzsoc');
        SQL.Add('  , segmento');
        SQL.Add(') values (');
        SQL.Add('    1');
        SQL.Add('  , ' + QuotedStr(StrOnlyNumbers(gLicencaSistema.CNPJ)));
        SQL.Add('  , 0');
        SQL.Add('  , ' + QuotedStr(gLicencaSistema.Empresa));
        SQL.Add('  , ' + IntToStr(SEGMENTO_PADRAO_ID));
        SQL.Add(')');
      end
      else
      begin
        SQL.Add('Update TBEMPRESA e Set');
        SQL.Add('    codigo = 1');
        SQL.Add('  , rzsoc  = ' + QuotedStr(gLicencaSistema.Empresa));
        SQL.Add('where e.cnpj = ' + QuotedStr(StrOnlyNumbers(gLicencaSistema.CNPJ)));
      end;

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      ShowError('Erro na inserção/atualização do registro da empresa.' + #13#13 + E.Message);
  end;
end;

procedure RegistrarSegmentos(Codigo : Integer; Descricao : String);
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Execute Procedure SET_SEGMENTO(' + IntToStr(Codigo) + ', ' + QuotedStr(Trim(Descricao)) + ')');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure RegistrarCaixaNaVenda(const AnoVenda, NumVenda, AnoCaixa, NumCaixa : Integer;
  const IsPDV : Boolean);
begin
  if (AnoVenda = 0) or (NumVenda = 0) or (AnoCaixa = 0) or (NumCaixa = 0) then
    Exit;

  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBVENDAS Set');
    SQL.Add('    caixa_ano = ' + IntToStr(AnoCaixa));
    SQL.Add('  , caixa_num = ' + IntToStr(NumCaixa));
    SQL.Add('  , caixa_pdv = ' + IfThen(IsPDV, '1', '0'));
    SQL.Add('where ano        = ' + IntToStr(AnoVenda));
    SQL.Add('  and codcontrol = ' + IntToStr(NumVenda));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure RegistrarCaixaNaOS(const AnoOS, NumOS, AnoCaixa, NumCaixa : Integer);
begin
  if (AnoOS = 0) or (NumOS = 0) or (AnoCaixa = 0) or (NumCaixa = 0) then
    Exit;

  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBOS Set');
    SQL.Add('    caixa_ano = ' + IntToStr(AnoCaixa));
    SQL.Add('  , caixa_num = ' + IntToStr(NumCaixa));
    SQL.Add('where ano      = ' + IntToStr(AnoOS));
    SQL.Add('  and controle = ' + IntToStr(NumOS));
    ExecSQL;

    CommitTransaction;
  end;
end;

{$IFDEF DGE}
procedure RegistrarControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess);
begin
  with DMBusiness, qryEvAcessUser do
  begin
    Close;
    ParamByName('formulario').AsString := TForm(AOnwer).Name;
    ParamByName('objeto').AsString     := EvUserAcesso.Name;
    Open;

    if IsEmpty then
    begin
      Append;
      qryEvAcessUserFORM_NAME.AsString       := TForm(AOnwer).Name;
      qryEvAcessUserOBJECT_NAME.AsString     := EvUserAcesso.Name;
      qryEvAcessUserCONSENTS_STRING.AsString := EvUserAcesso.Consents.Text;
      Post;
      ApplyUpdates;
    end;

    CommitTransaction;
  end;
end;
{$ENDIF}

procedure CarregarConfiguracoesEmpresa(CNPJ : String; Mensagem : String; var AssinaturaHtml, AssinaturaTXT : String);
var
  sMsg : String;
  bFaltaConfigurado : Boolean;
const
  sHTML =
    '<html>'                  + #13 +
    '<style type="text/css">' + #13 +
    '<!--'      + #13 +
    '.style1 {' + #13 +
    '	font-family: Verdana, Arial, Helvetica, sans-serif;' + #13 +
    '	font-size: 12px;' + #13 +
    '}'   + #13 +
    '-->' + #13 +
    '</style>'  + #13 +
    '<body>'    + #13 +
    '  %s'      + #13 +
    '  <p>&nbsp;</p>' + #13 +
    '  <p><span class="style1"><strong>%s</strong><br>' + #13 +
    '    %s<br>'           + #13 +
    '    %s<br>' + #13 +
    '    <a href="http://%s">%s</a>' + #13 +
    '  </span></p>' + #13 +
    '</body>'       + #13 +
    '</html>';

begin
  // Verificar se existe apenas uma empresa no cadastro
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cnpj from TBEMPRESA');
    Open;

    if (RecordCount = 1) then
    begin
      SetEmpresaIDDefault( FieldByName('cnpj').AsString );
      CNPJ := FieldByName('cnpj').AsString;
    end;

    Close;
  end;

  if (Trim(CNPJ) = EmptyStr) then
    CNPJ := GetEmpresaIDDefault;

//  with gContaEmail, DMBusiness, qryConfiguracoes do
  with gContaEmail, DMBusiness, fdQryConfiguracoes do
  begin
    Close;
    ParamByName('empresa').AsString := Trim(CNPJ);
    Open;

    if IsEmpty then
      raise Exception.Create('Tabela de Configurações vazia!');

    bFaltaConfigurado := False;

    bFaltaConfigurado := bFaltaConfigurado
      or (Trim(FieldByName('email_conta').AsString) = EmptyStr)
      or (Trim(FieldByName('email_senha').AsString) = EmptyStr)
      or (Trim(FieldByName('email_pop').AsString)   = EmptyStr)
      or (Trim(FieldByName('email_smtp').AsString)  = EmptyStr);

    if not DelphiIsRunning then
      if bFaltaConfigurado then
        raise Exception.Create('Configurações da conta de e-mail do sistema não informadas!');

    if (Trim(Mensagem) <> EmptyStr) then
      sMsg := '<p>' + Trim(Mensagem) + '</p>'
    else
    if (Trim(FieldByName('email_mensagem_padrao').AsString) <> EmptyStr) then
      sMsg := '<p>' + Trim(FieldByName('email_mensagem_padrao').AsString) + '</p>'
    else
    if (Trim(FieldByName('email_mensagem_padrao').AsString) = EmptyStr) then
      sMsg := '<p>-</p>';

    gContaEmail.Conta := FieldByName('email_conta').AsString;
    gContaEmail.Senha := FieldByName('email_senha').AsString;
    gContaEmail.Servidor_POP  := FieldByName('email_pop').AsString;
    gContaEmail.Servidor_SMTP := FieldByName('email_smtp').AsString;
    gContaEmail.Porta_SMTP    := FieldByName('email_smtp_porta').AsInteger;
    gContaEmail.Assunto_Padrao    := FieldByName('email_assunto_padrao').AsString;
    gContaEmail.Mensagem_Padrao   := FieldByName('email_mensagem_padrao').AsString;

    gContaEmail.RequerAutenticacao := (FieldByName('email_requer_autenticacao').AsInteger = 1);
    gContaEmail.ConexaoSeguraSSL   := (FieldByName('email_conexao_ssl').AsInteger = 1);

    AssinaturaHtml := Format(sHTML, [sMsg,
      FieldByName('empresa_razao').AsString,
      FieldByName('empresa_fone_1').AsString,
      FieldByName('empresa_email').AsString,
      FieldByName('empresa_homepage').AsString, FieldByName('empresa_homepage').AsString]);

    AssinaturaTXT := '--' + #13 +
      FieldByName('empresa_razao').AsString  + #13 +
      FieldByName('empresa_fone_1').AsString + #13 +
      FieldByName('empresa_email').AsString  + #13 +
      FieldByName('empresa_homepage').AsString;

    gContaEmail.Assinatura_Padrao := AssinaturaTXT;
  end;
end;

procedure AliquotaIcms(const UF_Origem, UF_Destino : String;
  var aAliquotaInter, aAliquotaIntra, aAliquotaST : Currency);
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select first 1');
    SQL.Add('    icms.aliquota_inter');
    SQL.Add('  , icms.aliquota_intra');
    SQL.Add('  , icms.aliquota_st');
    SQL.Add('from GET_ALIQUOTA_ICMS(' + QuotedStr(UF_Origem) + ', ' + QuotedStr(UF_Destino) + ') icms');
    Open;

    aAliquotaInter := FieldByName('aliquota_inter').AsCurrency;
    aAliquotaIntra := FieldByName('aliquota_intra').AsCurrency;
    aAliquotaST    := FieldByName('aliquota_st').AsCurrency;

    Close;
  end;
end;

procedure AliquotaIss(const pEmpresa : String; const pUF, pCidade : Integer;
  var aAliquotaIss, aAliquotaPis, aAliquotaConfins : Currency);
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select first 1');
    SQL.Add('    iss.aliquota_iss');
    SQL.Add('  , iss.aliquota_pis');
    SQL.Add('  , iss.aliquota_cofins');
    SQL.Add('from GET_ALIQUOTA_ISS(' + QuotedStr(pEmpresa) + ', ' + IntToStr(pUF) + ', ' + IntToStr(pCidade) + ') iss');
    Open;

    aAliquotaIss     := FieldByName('aliquota_iss').AsCurrency;
    aAliquotaPis     := FieldByName('aliquota_pis').AsCurrency;
    aAliquotaConfins := FieldByName('aliquota_cofins').AsCurrency;

    Close;
  end;
end;

procedure SetEmpresaIDDefault(CNPJ : String);
begin
  FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_EMPRESA, CNPJ);
  FileINI.UpdateFile;
end;

procedure SetSegmento(const iCodigo : Integer; const sDescricao : String);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Execute Procedure SET_SEGMENTO_EMPRESA(' + IntToStr(iCodigo) + ', ' + QuotedStr(Trim(sDescricao)) + ')');
      ExecSQL;

      CommitTransaction;

      Close;
    end;
  except
    On E : Exception do
      ShowError('SetSegmento() - ' + E.Message + #13#13 + DMBusiness.fdQryBusca.SQL.Text);
  end;
end;

procedure SetSistema(iCodigo : Smallint; sNome, sVersao : String);
begin
  try
    //with DMBusiness, setSistema do
    with DMBusiness, fdSetSistema do
    begin
      Close;
      ParamByName('Codigo').AsSmallInt := iCodigo;
      ParamByName('Nome').AsString     := sNome;
      ParamByName('Versao').AsString   := sVersao;
      ExecProc;

      CommitTransaction;
    end;
  except
    On E : Exception do
      ShowError('SetSistema() - ' + E.Message);
  end;
end;

procedure SetRotinaSistema(iTipo : Smallint; sCodigo, sDescricao, sRotinaPai : String);
begin
  try
    //with DMBusiness, setRotina do
    with DMBusiness, fdSetRotina do
    begin
      Close;
      ParamByName('Sistema').AsSmallInt  := gSistema.Codigo;
      ParamByName('Codigo').AsString     := Trim(sCodigo);
      ParamByName('Tipo').AsSmallInt     := iTipo;
      ParamByName('Descricao').AsString  := StringReplace(Trim(sDescricao), '&', '', [rfReplaceAll]);
      ParamByName('Rotina_Pai').AsString := Trim(sRotinaPai);
      ExecProc;

      CommitTransaction;
    end;
  except
    On E : Exception do
      ShowError('SetRotinaSistema() - ' + E.Message);
  end;
end;

procedure SetCompetencia(const aData : TDateTime);
var
  sCodigo    ,
  sDescricao : String;
begin
  try
    sCodigo    := FormatDateTime('YYYYMM', aData);
    sDescricao := AnsiUpperCase(FormatDateTime('MMM/YYYY', aData));

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Execute Procedure SET_COMPETENCIA(' + sCodigo + ', ' + QuotedStr(Trim(sDescricao)) + ')');
      ExecSQL;

      CommitTransaction;

      Close;
    end;
  except
    On E : Exception do
      ShowError('SetCompetencia() - ' + E.Message + #13#13 + DMBusiness.fdQryBusca.SQL.Text);
  end;
end;

procedure SetAtulizarCustoEstoque(const aData : TDateTime);
begin
  Screen.Cursor := crSQLWait;
  try
    // 1. Atualização do Custo das Apropriações de Estoque por Entrada
    with DMBusiness, spAtualizarCustoApEntrada do
    begin
      ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 2. Atualização do Custo das Apropriações de Estoque por Autorizações
    with DMBusiness, spAtualizarCustoApAutorizacao do
    begin
      ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 3. Atualização do Custo do Estoque de Almoxarifado
    with DMBusiness, spAtualizarCustoEstoqueAlmoxarifado do
    begin
      ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 4. Atualização do Custo das Requisições ao Almoxarifado
    with DMBusiness, spAtualizarCustoEstoqueRequisicao do
    begin
      ParamByName('ano_movimento').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 5. Atualização do Custo dos Inventários
    with DMBusiness, spAtualizarCustoEstoqueInventario do
    begin
      ParamByName('ano_movimento').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtulizarCustoEstoqueApropriacao(const aData : TDateTime);
begin
  Screen.Cursor := crSQLWait;
  try
    // 1. Atualização do Custo das Apropriações de Estoque por Entrada
    with DMBusiness, spAtualizarCustoApEntrada do
    begin
      ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 2. Atualização do Custo das Apropriações de Estoque por Autorizações
    with DMBusiness, spAtualizarCustoApAutorizacao do
    begin
      ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtulizarCustoEstoqueAlmoxarifado(const aData : TDateTime);
begin
  Screen.Cursor := crSQLWait;
  try
    // 3. Atualização do Custo do Estoque de Almoxarifado
    with DMBusiness, spAtualizarCustoEstoqueAlmoxarifado do
    begin
      ParamByName('ano').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtulizarCustoEstoqueRequisicao(const aData : TDateTime);
begin
  Screen.Cursor := crSQLWait;
  try
    // 4. Atualização do Custo das Requisições ao Almoxarifado
    with DMBusiness, spAtualizarCustoEstoqueRequisicao do
    begin
      ParamByName('ano_movimento').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtulizarCustoEstoqueInventario(const aData : TDateTime);
begin
  Screen.Cursor := crSQLWait;
  try
    // 5. Atualização do Custo dos Inventários
    with DMBusiness, spAtualizarCustoEstoqueInventario do
    begin
      ParamByName('ano_movimento').AsInteger := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetCentroCustoGeral(const aEmpresa : String);
begin
  Screen.Cursor := crSQLWait;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('');
      SQL.Add('execute block');
      SQL.Add('as');
      SQL.Add('  declare variable cc Integer;');
      SQL.Add('  declare variable ep varchar(18);');
      SQL.Add('begin');
      SQL.Add('  cc = ' + IntToStr(CENTRO_CUSTO_ESTOQUE_GERAL) + ';');
      SQL.Add('  ep = ' + QuotedStr(aEmpresa) + '; ');

      SQL.Add('  /* Cadastrar Centro de Custo 1 */');

      SQL.Add('  if (not exists(');
      SQL.Add('    Select');
      SQL.Add('      c.descricao');
      SQL.Add('    from TBCENTRO_CUSTO c');
      SQL.Add('    where c.codigo = :cc');
      SQL.Add('  )) then');
      SQL.Add('  begin');
      SQL.Add('    Insert into TBCENTRO_CUSTO (');
      SQL.Add('        codigo     ');
      SQL.Add('      , descricao  ');
      SQL.Add('      , ativo      ');
      SQL.Add('      , codcliente ');
      SQL.Add('    ) values (');
      SQL.Add('        :cc');
      SQL.Add('      , ' + QuotedStr('ESTOQUE GERAL') + ' ');
      SQL.Add('      , 1');
      SQL.Add('      , null');
      SQL.Add('    );');
      SQL.Add('  end');

      SQL.Add('  /* Associar Centro de Custo 1 a Empresa */');

      SQL.Add('  if (not exists(');
      SQL.Add('    Select');
      SQL.Add('      ce.centro_custo');
      SQL.Add('    from TBCENTRO_CUSTO_EMPRESA ce');
      SQL.Add('    where ce.centro_custo = :cc');
      SQL.Add('      and ce.empresa      = :ep');
      SQL.Add('  )) then');
      SQL.Add('  begin');
      SQL.Add('    Insert Into TBCENTRO_CUSTO_EMPRESA (');
      SQL.Add('        centro_custo ');
      SQL.Add('      , empresa      ');
      SQL.Add('      , selecionar   ');
      SQL.Add('    ) values (');
      SQL.Add('        :cc');
      SQL.Add('      , :ep');
      SQL.Add('      , 1');
      SQL.Add('    );');
      SQL.Add('  end');
      SQL.Add('end');
      ExecSQL;

      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetTipoDespesaPadrao;
begin
  Screen.Cursor := crSQLWait;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('');
      SQL.Add('execute block');
      SQL.Add('as');
      SQL.Add('  declare variable cd Integer;');
      SQL.Add('begin');
      SQL.Add('  cd = ' + IntToStr(TIPO_RECEITA_PADRAO) + ';');

      SQL.Add('  if (not exists(');
      SQL.Add('    Select');
      SQL.Add('      d.tipodesp');
      SQL.Add('    from TBTPDESPESA d');
      SQL.Add('    where (d.cod = :cd)');
      SQL.Add('       or (d.tipodesp = ' + QuotedStr('ENTRADAS EM GERAL') + ')');
      SQL.Add('  )) then');
      SQL.Add('  begin');
      SQL.Add('    Insert into TBTPDESPESA (');
      SQL.Add('        cod');
      SQL.Add('      , classificacao');
      SQL.Add('      , tipodesp');
      SQL.Add('      , tipo_particular');
      SQL.Add('      , plano_conta');
      SQL.Add('      , ativo');
      SQL.Add('    ) values (');
      SQL.Add('        :cd');  // Codigo
      SQL.Add('      , 0');    // Classificação
      SQL.Add('      , ' + QuotedStr('ENTRADAS EM GERAL') + ' ');
      SQL.Add('      , 0');    // Tipo particular
      SQL.Add('      , null'); // Plano de Contas
      SQL.Add('      , 1');    // Ativo
      SQL.Add('    );');
      SQL.Add('  end');
      SQL.Add('end');
      ExecSQL;

      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetTipoReceitaPadrao;
begin
  Screen.Cursor := crSQLWait;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('');
      SQL.Add('execute block');
      SQL.Add('as');
      SQL.Add('  declare variable cd Integer;');
      SQL.Add('begin');
      SQL.Add('  cd = ' + IntToStr(TIPO_RECEITA_PADRAO) + ';');

      SQL.Add('  if (not exists(');
      SQL.Add('    Select');
      SQL.Add('      r.tiporec');
      SQL.Add('    from TBTPRECEITA r');
      SQL.Add('    where (r.cod = :cd)');
      SQL.Add('       or (r.tiporec = ' + QuotedStr('SAÍDAS EM GERAL') + ')');
      SQL.Add('  )) then');
      SQL.Add('  begin');
      SQL.Add('    Insert into TBTPRECEITA (');
      SQL.Add('        cod');
      SQL.Add('      , classificacao');
      SQL.Add('      , tiporec');
      SQL.Add('      , tipo_particular');
      SQL.Add('      , plano_conta');
      SQL.Add('      , ativo');
      SQL.Add('    ) values (');
      SQL.Add('        :cd');  // Codigo
      SQL.Add('      , 0');    // Classificação
      SQL.Add('      , ' + QuotedStr('SAÍDAS EM GERAL') + ' ');
      SQL.Add('      , 0');    // Tipo particular
      SQL.Add('      , null'); // Plano de Contas
      SQL.Add('      , 1');    // Ativo
      SQL.Add('    );');
      SQL.Add('  end');
      SQL.Add('end');   //SQL.SaveToFile('_teste.sql'); ShowMessage(SQL.Text);
      ExecSQL;

      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetTipoProduto(const iCodigo : Integer; const sDescricao : String);
begin
  Screen.Cursor := crSQLWait;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('');
      SQL.Add('execute block');
      SQL.Add('as');
      SQL.Add('  declare variable cd DMN_SMALLINT_N;');
      SQL.Add('  declare variable ds DMN_VCHAR_50;');
      SQL.Add('begin');
      SQL.Add('  cd = ' + IntToStr(iCodigo) + ';');
      SQL.Add('  ds = ' + QuotedStr(sDescricao) + ';');

      SQL.Add('  if (not exists(');
      SQL.Add('    Select');
      SQL.Add('      t.codigo ');
      SQL.Add('    from SYS_TIPO_PRODUTO t');
      SQL.Add('    where (t.codigo    = :cd)');
      SQL.Add('       or (t.descricao = :ds)');
      SQL.Add('  )) then');
      SQL.Add('  begin');
      SQL.Add('    Insert into SYS_TIPO_PRODUTO (');
      SQL.Add('        codigo ');
      SQL.Add('      , descricao ');
      SQL.Add('    ) values (');
      SQL.Add('        :cd ');  // Codigo
      SQL.Add('      , :ds ');  // Descrição
      SQL.Add('    );');
      SQL.Add('  end');
      SQL.Add('end');  //SQL.SaveToFile('_SYS_TIPO_PRODUTO.sql');
      ExecSQL;

      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetTiposProdutos;
var
  tipoProduto : TTipoProduto;
begin
  try
    for tipoProduto := Low(SYS_TIPOS_PRODUTO) to High(SYS_TIPOS_PRODUTO) do
      SetTipoProduto(Ord(tipoProduto), SYS_TIPOS_PRODUTO[tipoProduto]);
  except
    On E : Exception do
      ShowError('Erro ao tentar registrar tipo de produto.' + #13#13 + E.Message);
  end;
end;

procedure CarregarListaDB(const pDataSet : TDataSet);
begin
  if pDataSet.Active then
    pDataSet.Close;

  pDataSet.Open;

  pDataSet.Last;
  pDataSet.First;
end;

function EncriptSenha_Master(const Value, Key : String) : String;
var
  sKeyChar    ,
  sStrEncode  ,
  sResult     : String;
  iTamanhoStr ,
  iPosicaoKey : Integer;
  IdEncoder   : TIdEncoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  try
    sKeyChar    := IdEncoder.EncodeString(Key);
    sStrEncode  := IdEncoder.EncodeString(Value);
    iTamanhoStr := Length(sStrEncode);

    iPosicaoKey := -1;
    while (iPosicaoKey < 0) do
      iPosicaoKey := Random(iTamanhoStr);

    sResult := Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr);

    Result := sResult;
  finally
    IdEncoder.Free;
  end;
end;

function DecriptarSenha_Master(const Value, Key : String) : String;
var
  sKeyChar   ,
  sStrEncode : String;
  IdEncoder  : TIdEncoderMIME;
  IdDecoder  : TIdDecoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  IdDecoder := TIdDecoderMIME.Create(nil);
  try
    sKeyChar   := IdEncoder.EncodeString(Key);
    sStrEncode := Value;

    if (Pos(sKeyChar, sStrEncode) = 0)  then
      raise Exception.Create('Criptografia corrompida!!!')
    else
      sStrEncode := StringReplace(sStrEncode, sKeyChar, EmptyStr, [rfReplaceAll]);

    Result := IdDecoder.DecodeString(sStrEncode);
  finally
    IdEncoder.Free;
    IdDecoder.Free;
  end;
end;

function DelphiIsRunning : Boolean;
begin
  // Verifica se o programa rodou a partir do IDE do Delphi7:
  Result := DebugHook <> 0;
end;

function GetDirectoryTempApp : String;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'Temp\';

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
begin
  Result := ( MessageDlg(PChar(sMsg), mtConfirmation, [mbYes, mbNo], 0) = ID_YES );
//  Result := ( Application.MessageBox(PChar(sMsg), 'Confirmar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

function GetPaisIDDefault : String;
begin
  Result := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_PAIS, INI_KEY_PAIS_VALUE);
end;

function GetEstadoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_ESTADO, StrToInt(INI_KEY_ESTADO_VALUE));
end;

function GetCidadeIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_CIDADE, StrToInt(INI_KEY_CIDADE_VALUE));
end;

function GetCfopIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_CFOP_SAI, StrToInt(INI_KEY_CFOP_SAI_VALUE));
end;

function GetCfopEntradaIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_CFOP_ENT, StrToInt(INI_KEY_CFOP_ENT_VALUE));
end;

function GetCfopDevolucao(const iCfop : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_devolucao from TBCFOP where cfop_cod = ' + IntToStr(iCfop));
    Open;

    Result := (FieldByName('cfop_devolucao').AsInteger = 1);

    Close;
  end;
end;

function GetCfopGerarTitulo(const iCfop : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_gerar_titulo from TBCFOP where cfop_cod = ' + IntToStr(iCfop));
    Open;

    Result := (FieldByName('cfop_gerar_titulo').AsInteger = 1);

    Close;
  end;
end;

function GetCfopGerarDuplicata(const iCfop : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_gerar_duplicata from TBCFOP where cfop_cod = ' + IntToStr(iCfop));
    Open;

    Result := (FieldByName('cfop_gerar_duplicata').AsInteger = 1);

    Close;
  end;
end;

function GetEmpresaIDDefault : String;
begin
  Result := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_EMPRESA, EmptyStr);
end;

function GetClienteIDDefault : Integer;
begin
  Result := StrToIntDef( FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_CLIENTE, EmptyStr), CONSUMIDOR_FINAL_CODIGO);
end;

function GetVendedorIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_VENDEDOR, 1);
end;

function GetFormaPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_FORMA_PGTO, 1);
end;

function GetCondicaoPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, INI_KEY_COND_PGTO, 1);
end;

function GetEstacaoEmitiBoleto : Boolean;
begin
  Result := FileINI.ReadBool('Boleto', 'EmitirBoleto', False);
end;

function GetEstacaoEmitiNFe(const sCNPJEmpresa : String) : Boolean;
Var
  sPrefixoSecao     ,
  sSecaoCertificado : String;
begin
  if ( GetQuantidadeEmpresasEmiteNFe > 1 ) then
    sPrefixoSecao := Trim(sCNPJEmpresa) + '_'
  else
    sPrefixoSecao := EmptyStr;

  sSecaoCertificado := sPrefixoSecao + INI_SECAO_CERTIFICADO;

  Result := GetPermititEmissaoNFe(sCNPJEmpresa) and (Trim(FileINI.ReadString(sSecaoCertificado, 'NumSerie', EmptyStr)) <> EmptyStr);
end;

function GetEstacaoEmitiNFSe : Boolean;
begin
  Result := False
end;

function GetCondicaoPagtoIDBoleto_Descontinuada : Integer; // Descontinuada
begin
  Result := FileINI.ReadInteger('Boleto', INI_KEY_FORMA_PGTO, 1);
end;

function GetEmitirApenasOrcamento : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_ORCAM, False);
end;

function GetEmitirCupom : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM, False);
end;

function GetEmitirCupomAutomatico : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_AUTOMAT, False);
end;

function GetModeloEmissaoCupom : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_MODELO_CUPOM, 0);
end;

function GetCupomNaoFiscalTipoEmissaoID : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_TP', 0)
end;

function GetCupomNaoFiscalPortaID : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_ID', 0)
end;

function GetCupomNaoFiscalModeloEspID : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_ES', 0)
end;

function GetCupomNaoFiscalPortaDS : String;
begin
  Result := Trim(StringReplace(FileINI.ReadString(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_DS', 'C:\CUPOM.TXT'), '*', '', [rfReplaceAll]));
end;

function GetCupomNaoFiscalPortaNM : String;
var
  pPrinter : TPrinter;
begin
  pPrinter := TPrinter.Create;
  Result   := FileINI.ReadString(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_NM', pPrinter.Printers.Strings[pPrinter.PrinterIndex]);
end;

function GetCupomNaoFiscalEmitir : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_NFISCAL, False);
end;

function GetCupomNaoFiscalFonteNome : String;
begin
  Result := FileINI.ReadString(INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_NFISCAL_FN, 'Courier New');
end;

function GetCupomNaoFiscalFonteTamanho : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_EMITIR_CUPOM_NFISCAL_FT, 6);
end;

function GetSegmentoID(const CNPJ : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(SEGMENTO, 0) as SegmentoID from TBEMPRESA where CNPJ = ' + QuotedStr(Trim(CNPJ)));
    Open;

    Result := FieldByName('SegmentoID').AsInteger;

    Close;
  end;
end;

function GetCompetenciaID(const aDataMovimento : TDateTime) : Integer;
var
  iCompetencia : Integer;
  sCompetencia : String;
begin
  iCompetencia := StrToInt(FormatDateTime('YYYYMM', aDataMovimento));
  sCompetencia := AnsiUpperCase(FormatDateTime('MMM/YYYY', aDataMovimento));
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Execute Procedure SET_COMPETENCIA(' +
      IntToStr(iCompetencia) + ', ' + QuotedStr(sCompetencia) + ')');
    ExecSQL;

    CommitTransaction;
  end;
  Result := iCompetencia;
end;

{$IFDEF DGE}
function GetControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess) : Boolean;
begin
  with DMBusiness, qryEvAcessUser do
  begin
    Close;
    ParamByName('formulario').AsString := TForm(AOnwer).Name;
    ParamByName('objeto').AsString     := EvUserAcesso.Name;
    Open;

    Result := not IsEmpty;

    if Result then
    begin
      EvUserAcesso.Consents.Clear;
      EvUserAcesso.Consents.Text := qryEvAcessUserCONSENTS_STRING.AsString;
    end;
  end;
end;
{$ENDIF}

function GetEmailEmpresa(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select email from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := AnsiLowerCase( FieldByName('email').AsString );

    Close;
  end;
end;

function GetCalcularCustoOperEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select custo_oper_calcular as calcular from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('calcular').AsInteger = 1);

    Close;
  end;
end;

function GetPermitirVendaEstoqueInsEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select permitir_venda_estoque_ins as permitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('permitir').AsInteger = 1);

    Close;
  end;
end;

function GetPermitirDuplicarCNPJCliente(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(cliente_permitir_duplicar_cnpj, 0) as permitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('permitir').AsInteger = 1);

    Close;
  end;
end;

function GetPermitirVerdadeiroFalsoCNPJCliente(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(cliente_permitir_vf_cnpj, 0) as permitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('permitir').AsInteger = 1);

    Close;
  end;
end;

function GetAutorizacaoInformarCliente(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select autoriza_informa_cliente as permitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('permitir').AsInteger = 1);

    Close;
  end;
end;

function GetSimplesNacionalInsEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select TIPO_REGIME_NFE as sn from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('sn').AsInteger = 0); // 0. Simples Nacional (1); 1. Simples Excesso Receita (2); 2. Regime Normal (3)

    Close;
  end;
end;

function GetEstoqueUnificadoEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select estoque_unico_empresas as estoque_unico from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('estoque_unico').AsInteger = 1);

    Close;
  end;
end;

function GetEstoqueSateliteEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select estoque_satelite_cliente as permitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('permitir').AsInteger = 1);

    Close;
  end;
end;

function GetRegimeEmpresa(const sCNPJEmpresa : String) : TTipoRegime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select tipo_regime_nfe as regime from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := TTipoRegime(FieldByName('regime').AsInteger);

    Close;
  end;
end;

function GetRazaoSocialEmpresa(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select rzsoc from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := AnsiUpperCase( Trim(FieldByName('rzsoc').AsString) );

    Close;
  end;
end;

function GetNomeFantasiaEmpresa(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(nullif(Trim(nmfant), ''''), rzsoc) as fantasia from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := AnsiUpperCase( Trim(FieldByName('fantasia').AsString) );

    Close;
  end;
end;

function GetCnpjEmpresa(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cnpj from TBEMPRESA where codigo = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiUpperCase( Trim(FieldByName('cnpj').AsString) );

    Close;
  end;
end;

function GetCnaeEmpresa(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cnae from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := AnsiUpperCase( Trim(FieldByName('cnae').AsString) );

    Close;
  end;
end;

function GetPrazoValidadeAutorizacaoCompra(const sCNPJEmpresa : String) : Integer;
begin
  Result := 5;
end;

function GetPrazoValidadeCotacaoCompra(const sCNPJEmpresa : String) : Integer;
begin
  Result := 15;
end;

function GetMenorDataEmissaoOS : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(o.data_emissao) as data_emissao');
    SQL.Add('from TBOS o');
    SQL.Add('where o.status < 7 -- Faturada');
    Open;

    if not FieldByName('data_emissao').IsNull then
      Result := FieldByName('data_emissao').AsDateTime
    else
      Result := GetDateDB;

    Close;
  end;
end;

function StrIsCNPJ(const Num: string): Boolean;
var
  Dig: array [1..14] of Byte;
  I, Resto: Byte;
  Dv1, Dv2: Byte;
  Total1, Total2: Integer;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  if ( StrToIntDef(Copy(Valor, 1, 5), 0) = 0 ) then
  begin
    Result := False;
    Exit;
  end;

  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;

  Result := False;

  if Length(Valor) = 14 then
  begin
    for I := 1 to 14 do
      try
        Dig[I] := StrToInt (Valor[I]);
      except
        Dig[i] := 0;
      end;

    Total1 := Dig[1]  * 5 + Dig[2]  * 4 + Dig[3]  * 3 +
              Dig[4]  * 2 + Dig[5]  * 9 + Dig[6]  * 8 +
              Dig[7]  * 7 + Dig[8]  * 6 + Dig[9]  * 5 +
              Dig[10] * 4 + Dig[11] * 3 + Dig[12] * 2 ;

    Resto := Total1 mod 11;

    if Resto > 1 then
      Dv1 := 11 - Resto
    else
      Dv1 := 0;

    Total2 := Dig[1]  * 6 + Dig[2]  * 5 + Dig[3]  * 4 +
              Dig[4]  * 3 + Dig[5]  * 2 + Dig[6]  * 9 +
              Dig[7]  * 8 + Dig[8]  * 7 + Dig[9]  * 6 +
              Dig[10] * 5 + Dig[11] * 4 + Dig[12] * 3 + Dv1 * 2 ;

    Resto := Total2 mod 11;

    if Resto > 1 then
      Dv2 := 11 - Resto
    else
      Dv2 := 0;

    if (Dv1 = Dig[13]) and (Dv2 = Dig[14]) then
      Result := True;
  end;

end;

function StrIsCPF(const Num: string): Boolean;
var
  I, Numero, Resto: Byte ;
  Dv1, Dv2: Byte ;
  Total, Soma: Integer ;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;
  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then Delete(Valor, I, 1);
  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;
  Result := False;
  if Length(Valor) = 11 then
  begin
    Total := 0 ;
    Soma := 0 ;
    for I := 1 to 9 do
    begin
      try
        Numero := StrToInt (Valor[I]);
      except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - I)) ;
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1
      then Dv1 := 11 - Resto
      else Dv1 := 0;
    Total := Total + Soma + 2 * Dv1;
    Resto := Total mod 11;
    if Resto > 1
      then Dv2 := 11 - Resto
      else Dv2 := 0;
    if (IntToStr (Dv1) = Valor[10]) and (IntToStr (Dv2) = Valor[11])
      then Result := True;
  end;
end;

function StrIsDateTime(const S: string): Boolean;
var
  d : TDateTime;
begin
  Result := TryStrToDateTime(S, d);
end;

function StrIsInteger(const Num: string): Boolean;
var
  I : Integer;
begin
  Result := TryStrToInt(Num, I);
end;

function StrFormatar(Documento, Complemento : String; const TipoDocumento : TACBrValTipoDocto): String;
begin
  with DMBusiness do
  begin
    ACBrValidador.TipoDocto   := TipoDocumento;
    ACBrValidador.Documento   := Trim(Documento);
    ACBrValidador.Complemento := Trim(Complemento);

    Result := ACBrValidador.Formatar;
  end;
end;

function StrFormatarCnpj(sCnpj: String): String;
var
  S : String;
begin
  S := Trim(sCnpj);

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '.' ) then
    S := Copy(S, 1, 6) + '.' + Copy(S, 7, Length(S));

  if ( Copy(S, 11, 1) <> '/' ) then
    S := Copy(S, 1, 10) + '/' + Copy(S, 11, Length(S));

  if ( Copy(S, 16, 1) <> '-' ) then
    S := Copy(S, 1, 15) + '-' + Copy(S, 16, Length(S));

  Result := S;
end;

function StrFormatarCpf(sCpf: String): String;
var
  S : String;
begin
  S := Trim(sCpf); // 000.000.000-00

  if ( Copy(S, 4, 1) <> '.' ) then
    S := Copy(S, 1, 3) + '.' + Copy(S, 4, Length(S));

  if ( Copy(S, 8, 1) <> '.' ) then
    S := Copy(S, 1, 7) + '.' + Copy(S, 8, Length(S));

  if ( Copy(S, 12, 1) <> '-' ) then
    S := Copy(S, 1, 11) + '-' + Copy(S, 12, Length(S));

  Result := S;
end;

function StrFormatarCEP(sCEP: String): String;
var
  S : String;
begin
  S := Trim(sCEP); // 00.000-000

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '-' ) then
    S := Copy(S, 1, 6) + '-' + Copy(S, 7, Length(S));

  Result := S;
end;

function StrFormatarFONE(sFone: String): String;
var
  S : String;
begin
  S := Trim(sFone); // (91)0123-4567

  if ( Copy(S, 1, 1) <> '(' ) then
    S := '(' + Copy(S, 1, Length(S));

  if ( Copy(S, 4, 1) <> ')' ) then
    S := Copy(S, 1, 3) + ')' + Copy(S, 4, Length(S));

  if ( Copy(S, 9, 1) <> '-' ) then
    S := Copy(S, 1, 8) + '-' + Copy(S, 9, Length(S));

  Result := S;
end;

function StrDescricaoProduto(const NoPlural : Boolean = TRUE) : String;
var
  S : String;
begin
  try
    S := 'Produto' + IfThen(NoPlural, 's', EmptyStr);

    Case GetSegmentoID(gUsuarioLogado.Empresa)  of
      SEGMENTO_MERCADO_CARRO_ID:
        S := 'Veículo' + IfThen(NoPlural, 's', EmptyStr);
//      SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID:
//        s := IfThen(NoPlural, 'Produtos/Serviços', 'Produto/Serviço')
      else
        s := IfThen(NoPlural, 'Produtos / Serviços', 'Produto / Serviço');
//        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
//          s := IfThen(NoPlural, 'Produtos/Serviços', 'Produto/Serviço')
//        else
//          S := 'Produto' + IfThen(NoPlural, 's', EmptyStr);
    end;

  finally
    Result := S;
  end;
end;

function StrDescricaoProdutoBtn(const NoPlural : Boolean = TRUE) : String;
var
  S : String;
begin
  try
    S := 'Produto' + IfThen(NoPlural, 's', EmptyStr);

    Case GetSegmentoID(gUsuarioLogado.Empresa)  of
      SEGMENTO_MERCADO_CARRO_ID:
        S := 'Veículo' + IfThen(NoPlural, 's', EmptyStr);
//      SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID:
//        s := IfThen(NoPlural, 'Produtos/Serviços', 'Produto/Serviço')
//      else
//        s := IfThen(NoPlural, 'Produtos / Serviços', 'Produto / Serviço');
//        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
//          s := IfThen(NoPlural, 'Produtos/Serviços', 'Produto/Serviço')
//        else
//          S := 'Produto' + IfThen(NoPlural, 's', EmptyStr);
    end;

  finally
    Result := S;
  end;
end;

function StrOnlyNumbers(const Str : String) : String;
var
  I : Byte;
  Valor : String;
begin
  Valor := Str;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  Result := Valor;
end;

function StrInscricaoEstadual(const IE, UF : String) : Boolean;
var
  sDocumento   ,
  sComplemento ,
  sMensErro    : String;
begin
  Result := (Trim(IE) = EmptyStr) or (Copy(AnsiUpperCase(IE), 1, 5) = 'ISENT');

  if not Result  then
    with DMBusiness do
    begin
      sDocumento   := StrFormatar(IE, UF, docInscEst);
      sComplemento := Trim(UF);


      ACBrValidador.Documento   := sDocumento;
      ACBrValidador.Complemento := sComplemento;

      Result := ACBrValidador.Validar;

      if not Result then
         sMensErro := Trim(ACBrValidador.MsgErro);
    end;
end;

function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select g.cod_bairro from SET_BAIRRO(' + QuotedStr(Trim(AnsiUpperCase(sNome))) + ', ' + IntToStr(iCidade) + ', null) g');
    Open;

    Result := FieldByName('cod_bairro').AsInteger;

    CommitTransaction;

    Close;
  end;
end;

function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;
var
  sTipo ,
  sDesc : String;
  sLogr : TStringList;
begin
  sLogr := TStringList.Create;
  try
    sDesc := Trim(AnsiUpperCase(sNome));
    sTipo := EmptyStr;

    Split('.', sDesc, sLogr);
    if (sLogr.Count > 1) then
    begin
      sTipo := sLogr.Strings[0];
      if Length(sTipo) > 25 then
        sTipo := EmptyStr;
    end;

    if ( sTipo = EmptyStr ) then
    begin
      Split(' ', sDesc, sLogr);
      if (sLogr.Count > 1) then
        sTipo := sLogr.Strings[0];
    end;

    if ( sTipo <> EmptyStr ) then
      sDesc := Trim(Copy(sDesc, Length(sTipo) + 1, Length(sDesc)));

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    g.cod_logradouro');
      SQL.Add('  , g.cod_tipo');
      SQL.Add('from SET_LOGRADOURO(' + QuotedStr(sDesc) + ', ' + QuotedStr(sTipo) + ', ' + IntToStr(iCidade) + ') g');
      Open;

      Tipo   := FieldByName('cod_tipo').AsInteger;
      Result := FieldByName('cod_logradouro').AsInteger;

      CommitTransaction;

      Close;
    end;
  finally
    sLogr.Free;
  end;
end;

function GetGeneratorID(const GeneratorName : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select first 1 GEN_ID(' + GeneratorName + ', 1) as ID from TBEMPRESA');
    Open;

    Result := FieldByName('ID').AsInteger;

    CommitTransaction;

    Close;
  end;
end;

function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhere);
    Open;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

function GetCountID(NomeTabela : String; const sWhere : String = '') : Largeint;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select count(*) as Registros from ' + NomeTabela + ' ' + sWhere);
    Open;

    Result := FieldByName('Registros').AsInteger + 1;
  end;
end;

function GetGuidID38 : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select g.hex_uuid_format from GET_GUID_UUID_HEX g');
    Open;

    Result := FieldByName('hex_uuid_format').AsString;

    Close;
  end;
end;

function GetPaisNomeDefault : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select pais_nome from TBPAIS where pais_id = ' + QuotedStr(GetPaisIDDefault));
    Open;

    Result := FieldByName('pais_nome').AsString;

    Close;
  end;
end;

function GetEstadoNomeDefault : String;
begin
  Result := GetEstadoNome( GetEstadoIDDefault );
end;

function GetEstadoNome(const iEstado : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_cod = ' + IntToStr(iEstado));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetEstadoNome(const sSigla : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_sigla = ' + QuotedStr(sSigla));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetEstadoID(const sSigla : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_cod from TBESTADO where est_sigla = ' + QuotedStr(sSigla));
    Open;

    Result := FieldByName('est_cod').AsInteger;

    Close;
  end;
end;

function GetEstadoUF(const iEstado : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_sigla from TBESTADO where est_cod = ' + IntToStr(iEstado));
    Open;

    Result := Trim(FieldByName('est_sigla').AsString);

    Close;
  end;
end;

function GetCidadeNomeDefault : String;
begin
  Result := GetCidadeNome( GetCidadeIDDefault );
end;

function GetCidadeNome(const iCidade : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where cid_cod = ' + IntToStr(iCidade));
    Open;

    Result := FieldByName('cid_nome').AsString;

    Close;
  end;
end;

function GetCidadeCEP(const iCidade : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_cep_inicial from TBCIDADE where cid_cod = ' + IntToStr(iCidade));
    Open;

    Result := FieldByName('cid_cep_inicial').AsString;

    Close;
  end;
end;

function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_cod from TBCIDADE where est_cod = ' + IntToStr(iEstado) + ' and cid_nome like ' + QuotedStr('%' + Trim(sNome) + '%'));
    Open;

    Result := FieldByName('cid_cod').AsInteger;

    Close;
  end;
end;

function GetCidadeID(const sCEP : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where ' + StrOnlyNumbers(sCEP) + ' between cid_cep_inicial and cid_cep_final');
    Open;

    Result := FieldByName('cid_cod').AsInteger;

    Close;
  end;
end;

function GetBairroNome(const iBairro : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select bai_nome from TBBAIRRO where bai_cod = ' + IntToStr(iBairro));
    Open;

    Result := FieldByName('bai_nome').AsString;

    Close;
  end;
end;

function GetLogradouroNome(const iLogradouro : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select log_nome from TBLOGRADOURO where log_cod = ' + IntToStr(iLogradouro));
    Open;

    Result := FieldByName('log_nome').AsString;

    Close;
  end;
end;

function GetLogradouroTipo(const iLogradouro : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  coalesce(t.tlg_sigla, t.tlg_descricao) as tipo');
    SQL.Add('from TBLOGRADOURO l');
    SQL.Add('  inner join TBTIPO_LOGRADOURO t on (t.tlg_cod = l.tlg_cod)');
    SQL.Add('where log_cod = ' + IntToStr(iLogradouro));
    Open;

    Result := FieldByName('tipo').AsString;

    Close;
  end;
end;

function GetCfopNomeDefault : String;
begin
  Result := GetCfopNome( GetCfopIDDefault );
end;

function GetCfopNome(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_descricao from TBCFOP where cfop_cod = ' + IntToStr(iCodigo));
    Open;

    Result := FieldByName('cfop_descricao').AsString;

    Close;
  end;
end;

function GetCfopEntradaNomeDefault : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_descricao from TBCFOP where cfop_cod = ' + IntToStr(GetCfopEntradaIDDefault));
    Open;

    Result := FieldByName('cfop_descricao').AsString;

    Close;
  end;
end;

function GetEmpresaNome(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select rzsoc from TBEMPRESA where Cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := FieldByName('rzsoc').AsString;

    Close;
  end;
end;

function GetEmpresaNomeDefault : String;
begin
  Result := GetEmpresaNome(GetEmpresaIDDefault);
end;

function GetEmpresaEnderecoDefault : String;
begin
  Result := GetEmpresaEndereco(GetEmpresaIDDefault);
end;

function GetEmpresaEndereco(const sCNPJEmitente : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    e.ender');
    SQL.Add('  , e.numero_end');
    SQL.Add('  , e.complemento');
    SQL.Add('  , e.bairro');
    SQL.Add('  , e.cidade');
    SQL.Add('  , e.uf');
    SQL.Add('  , e.cep');
    SQL.Add('from TBEMPRESA e');
    if Trim(sCNPJEmitente) = EmptyStr then
      SQL.Add('where e.cnpj = ' + QuotedStr(GetEmpresaIDDefault))
    else
      SQL.Add('where e.cnpj = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := Trim(FieldByName('ender').AsString) + ', No. ' + Trim(FieldByName('numero_end').AsString) +
      IfThen(Trim(FieldByName('complemento').AsString) = EmptyStr, '', ' (' + Trim(FieldByName('complemento').AsString) + ')') + ', ' +
      'BAIRRO: ' + Trim(FieldByName('bairro').AsString) + ' - ' + Trim(FieldByName('cidade').AsString) + ' ' +
      'CEP: ' + StrFormatarCEP(Trim(FieldByName('cep').AsString));

    Close;
  end;
end;

function GetEmpresaUF(const sCNPJEmitente : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select e.uf');
    SQL.Add('from TBEMPRESA e');
    if Trim(sCNPJEmitente) = EmptyStr then
      SQL.Add('where e.cnpj = ' + QuotedStr(GetEmpresaIDDefault))
    else
      SQL.Add('where e.cnpj = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := Trim(FieldByName('uf').AsString);

    Close;
  end;
end;

function GetClienteNomeDefault : String;
begin
  Result := GetClienteNome( GetClienteIDDefault );
end;

function GetClienteNome(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBCLIENTE where Codigo = ' + IntToStr(iCodigo));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetClienteEmail(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select email from TBCLIENTE where Codigo = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('email').AsString));

    Close;
  end;
end;

function GetClienteUF(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select uf from TBCLIENTE where Codigo = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('uf').AsString));

    Close;
  end;
end;

function GetClienteEndereco(const aCodigo : Integer; const aQuebrarLinha : Boolean = FALSE) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    c.ender');
    SQL.Add('  , c.numero_end');
    SQL.Add('  , c.complemento');
    SQL.Add('  , c.bairro');
    SQL.Add('  , c.cidade');
    SQL.Add('  , c.uf');
    SQL.Add('  , c.cep');
    SQL.Add('from TBCLIENTE c');
    SQL.Add('where c.codigo = ' + IntToStr(aCodigo));
    Open;

    Result := Trim(FieldByName('ender').AsString) + ', No. ' + Trim(FieldByName('numero_end').AsString) +
      IfThen(Trim(FieldByName('complemento').AsString) = EmptyStr, '', ' (' + Trim(FieldByName('complemento').AsString) + ')') +
      IfThen(aQuebrarLinha, #13, ', ') +
      'BAIRRO: ' + Trim(FieldByName('bairro').AsString) + ' - ' + Trim(FieldByName('cidade').AsString) +
      IfThen(aQuebrarLinha, #13, ' ') +
      'CEP: ' + StrFormatarCEP(Trim(FieldByName('cep').AsString));

    Close;
  end;
end;

function GetClienteCnpfCpf(const aCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cnpj from TBCLIENTE where Codigo = ' + IntToStr(aCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('cnpj').AsString));

    Close;
  end;
end;

function GetClienteBloqueado(const aCodigo : Integer; var aMotivo : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    c.bloqueado');
    SQL.Add('  , c.bloqueado_motivo');
    SQL.Add('from TBCLIENTE c');
    SQL.Add('where c.codigo = ' + IntToStr(aCodigo));
    Open;

    aMotivo := Trim(FieldByName('bloqueado_motivo').AsString);
    Result  := (FieldByName('bloqueado').AsInteger = 1);

    Close;
  end;
end;

function GetFornecedorEmail(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select email from TBFORNECEDOR where Codforn = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('email').AsString));

    Close;
  end;
end;

function GetFornecedorRazao(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nomeforn from TBFORNECEDOR where Codforn = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('nomeforn').AsString));

    Close;
  end;
end;

function GetFornecedorContato(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select contato from TBFORNECEDOR where Codforn = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('contato').AsString));

    Close;
  end;
end;

function GetFornecedorUF(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select uf from TBFORNECEDOR where Codforn = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('uf').AsString));

    Close;
  end;
end;

function GetFornecedorCodigo(const aCnpj : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select CODFORN from TBFORNECEDOR where CNPJ = ' + QuotedStr(aCnpj));
    Open;

    Result := FieldByName('CODFORN').AsInteger;

    Close;
  end;
end;

function GetVendedorNomeDefault : String;
begin
  Result := GetVendedorNome( GetVendedorIDDefault );
end;

function GetVendedorNome(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBVENDEDOR where cod = ' + IntToStr(iCodigo));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetFormaPagtoNomeDefault : String;
begin
  Result := GetFormaPagtoNome( GetFormaPagtoIDDefault );
end;

function GetFormaPagtoNome(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select descri from TBFORMPAGTO where cod = ' + IntToStr(iCodigo));
    Open;

    Result := FieldByName('descri').AsString;

    Close;
  end;
end;

function GetFormaPagtoCondicaoPagto(const iFormaPagto, iCondicaoPagto : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select count(*) as Itens from TBFORMPAGTO_CONDICAO');
    SQL.Add('where forma_pagto    = ' + IntToStr(iFormaPagto));
    SQL.Add('  and condicao_pagto = ' + IntToStr(iCondicaoPagto));
    Open;

    Result := (FieldByName('Itens').AsInteger > 0);

    Close;
  end;
end;

function GetCondicaoPagtoNomeDefault : String;
begin
  Result := GetCondicaoPagtoNome( GetCondicaoPagtoIDDefault );
end;

function GetCondicaoPagtoNome(const iCodigo : Integer) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cond_descricao_full from VW_CONDICAOPAGTO where cond_cod = ' + IntToStr(iCodigo));
    Open;

    Result := FieldByName('cond_descricao_full').AsString;

    Close;
  end;
end;

function GetCondicaoPagtoAPrazo(const iCodigo : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select COND_PRAZO from VW_CONDICAOPAGTO where cond_cod = ' + IntToStr(iCodigo));
    Open;

    Result := (FieldByName('COND_PRAZO').AsInteger = 1);

    Close;
  end;
end;

function GetTabelaIBPT_Codigo(const aCodigoNCM : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  t.id_ibpt');
    SQL.Add('from SYS_IBPT t');
    SQL.Add('where t.ncm_ibpt = ' + QuotedStr(aCodigoNCM));
    SQL.Add('  and t.ativo = 1');
    SQL.Add('order by');
    SQL.Add('  t.ex_ibpt, t.ncm_ibpt');
    Open;

    Result := FieldByName('id_ibpt').AsInteger;

    Close;
  end;
end;

function GetBancoBoletoCodigo(const aEmpresa, aCodigoFebraban : String) : Integer;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  b.bco_cod');
    SQL.Add('from TBBANCO_BOLETO b');
    SQL.Add('where b.empresa = ' + QuotedStr(aEmpresa));
    SQL.Add('  and b.bco_cod = ' + IntToStr(StrToIntDef(aCodigoFebraban, 0)));
    Open;

    Result := FieldByName('bco_cod').AsInteger;

    Close;
  end;
end;

function GetSenhaAutorizacao : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select snh_descricao from TBSENHA_AUTORIZACAO');
    Open;

    if IsEmpty then
      ShowWarning('Não existe senha de autorização gravada na base.' + #13#13 + 'Favor solicitar a geração de uma senha de autorização');

    Result := FieldByName('snh_descricao').AsString;

    Close;
  end;
end;

function GetDateTimeDB : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_timestamp as DataHora from TBEMPRESA');
    Open;

    Result := FieldByName('DataHora').AsDateTime;
  end;
end;

function GetDateDB : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_date as Data from TBEMPRESA');
    Open;

    Result := FieldByName('Data').AsDateTime;
  end;
end;

function GetDateLastMonth : TDateTime;
var
  sData : String;
begin
  sData  := FormatFloat('00"/"', DaysInMonth(GetDateDB)) + FormatDateTime('mm/yyyy', GetDateDB);
  Result := StrToDate(sData);
end;

function GetProximoDiaUtil(const Data : TDateTime) : TDateTime;
var
  dData : TDateTime;
begin
  dData := Data + 1;
  while ( DayOfWeek(dData) in [1, 7] ) do
    dData := dData + 1;
  Result := dData;
end;

function GetTimeDB : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_time as Hora from TBEMPRESA');
    Open;

    Result := FieldByName('Hora').AsDateTime;
  end;
end;

function GetUserApp : String;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := AnsiUpperCase( Trim(fdQryUsers.FieldByName('NOME').AsString) )
    else
      Result := EmptyStr;
end;

function GetUserFullName : String;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := AnsiUpperCase( Trim(fdQryUsers.FieldByName('NOMECOMPLETO').AsString) )
    else
      Result := EmptyStr;
end;

function GetUserFunctionID : Integer;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := fdQryUsers.FieldByName('CODFUNCAO').AsInteger
    else
      Result := 0;
end;

function GetUserCodigoVendedorID : Integer;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := fdQryUsers.FieldByName('VENDEDOR').AsInteger
    else
      Result := 0;
end;

function GetUserUpdatePassWord : Boolean;
begin
  if Trim(gUsuarioLogado.Login) = EmptyStr then
    Result := False
  else
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := (fdQryUsers.FieldByName('ALTERAR_SENHA').AsInteger = 1)
    else
      Result := False;
end;

function GetLimiteDescontoUser : Currency;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := fdQryUsers.FieldByName('LIMIDESC').AsCurrency
    else
      Result := 0.0;
end;

function GetUserPermitirAlterarValorVenda : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := (fdQryUsers.FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1)
    else
      Result := False;
end;

function GetUserPermitirAlterarValorVendaLivre : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := (fdQryUsers.FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger = 1)
    else
      Result := False;
end;

function GetUserPermitirAlterarValorVendaParaMaior : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := (fdQryUsers.FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger in [1, 2])
    else
      Result := False;
end;

function GetUserPermitirAlterarValorVendaParaMenor : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := (fdQryUsers.FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger in [1, 3])
    else
      Result := False;
end;

function GetUserManifestoAutomatico : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
      Result := (fdQryUsers.FieldByName('ALMOX_MANIFESTO_AUTOMATICO').AsInteger = 1)
    else
      Result := False;
end;

function GetPermititEmissaoNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_emitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_emitir').AsInteger = 1);

    Close;
  end;
end;

function GetPermititEmissaoNFeEntrada(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_emitir_entrada from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_emitir_entrada').AsInteger = 1);

    Close;
  end;
end;

function GetPermititNFeDenegada(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_aceitar_nota_denegada from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_aceitar_nota_denegada').AsInteger = 1);

    Close;
  end;
end;

function GetSolicitaDHSaidaNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_solicita_dh_saida from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_solicita_dh_saida').AsInteger = 1);

    Close;
  end;
end;

function GetImprimirCodClienteNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_imprimir_cod_cliente from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_imprimir_cod_cliente').AsInteger = 1);

    Close;
  end;
end;

function GetExisteCPF_CNPJ(iCodigoCliente : Integer; sCpfCnpj : String; var iCodigo : Integer; var sRazao : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    c.codigo');
    SQL.Add('  , c.nome');
    SQL.Add('from TBCLIENTE c');
    SQL.Add('where c.Cnpj    = ' + QuotedStr(Trim(sCpfCnpj)));
    SQL.Add('  and c.codigo <> ' + IntToStr(iCodigoCliente));
    Open;

    Result := (FieldByName('codigo').AsInteger > 0);

    if Result then
    begin
      iCodigo := FieldByName('codigo').AsInteger;
      sRazao  := Trim(FieldByName('nome').AsString);
    end;

    Close;
  end;
end;

function GetExisteNumeroAutorizacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    a.ano');
    SQL.Add('  , a.codigo');
    SQL.Add('  , a.numero');
    SQL.Add('from TBAUTORIZA_COMPRA a');
    SQL.Add('where a.Numero  = ' + QuotedStr(Trim(sNumero)));
    SQL.Add('  and (not (');
    SQL.Add('           a.ano    = ' + IntToStr(iAno));
    SQL.Add('       and a.codigo = ' + IntToStr(iCodigo));
    SQL.Add('  ))');
    Open;

    Result := (FieldByName('codigo').AsInteger > 0);

    if Result then
      sControleInterno := Trim(FieldByName('ano').AsString) + '/' + FormatFloat('###0000000', FieldByName('codigo').AsInteger);

    Close;
  end;
end;

function GetExisteNumeroCotacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    a.ano');
    SQL.Add('  , a.codigo');
    SQL.Add('  , a.numero');
    SQL.Add('from TBCOTACAO_COMPRA a');
    SQL.Add('where a.Numero  = ' + QuotedStr(Trim(sNumero)));
    SQL.Add('  and (not (');
    SQL.Add('           a.ano    = ' + IntToStr(iAno));
    SQL.Add('       and a.codigo = ' + IntToStr(iCodigo));
    SQL.Add('  ))');
    Open;

    Result := (FieldByName('codigo').AsInteger > 0);

    if Result then
      sControleInterno := Trim(FieldByName('ano').AsString) + '/' + FormatFloat('###0000000', FieldByName('codigo').AsInteger);

    Close;
  end;
end;

function GetExisteNumeroSolicitacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    s.ano');
    SQL.Add('  , s.codigo');
    SQL.Add('  , s.numero');
    SQL.Add('from TBSOLICITACAO s');
    SQL.Add('where s.Numero  = ' + QuotedStr(Trim(sNumero)));
    SQL.Add('  and (not (');
    SQL.Add('           s.ano    = ' + IntToStr(iAno));
    SQL.Add('       and s.codigo = ' + IntToStr(iCodigo));
    SQL.Add('  ))');
    Open;

    Result := (FieldByName('codigo').AsInteger > 0);

    if Result then
      sControleInterno := Trim(FieldByName('ano').AsString) + '/' + FormatFloat('###0000000', FieldByName('codigo').AsInteger);

    Close;
  end;
end;

function GetExisteNumeroRequisicao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    r.ano');
    SQL.Add('  , r.codigo');
    SQL.Add('  , r.numero');
    SQL.Add('from TBREQUISITA_COMPRA r');
    SQL.Add('where r.Numero  = ' + QuotedStr(Trim(sNumero)));
    SQL.Add('  and (not (');
    SQL.Add('           r.ano    = ' + IntToStr(iAno));
    SQL.Add('       and r.codigo = ' + IntToStr(iCodigo));
    SQL.Add('  ))');
    Open;

    Result := (FieldByName('codigo').AsInteger > 0);

    if Result then
      sControleInterno := Trim(FieldByName('ano').AsString) + '/' + FormatFloat('###0000000', FieldByName('codigo').AsInteger);

    Close;
  end;
end;

function GetExisteNumeroApropriacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    a.ano');
    SQL.Add('  , a.controle');
    SQL.Add('  , a.numero');
    SQL.Add('from TBAPROPRIACAO_ALMOX a');
    SQL.Add('where a.Numero  = ' + QuotedStr(Trim(sNumero)));
    SQL.Add('  and (not (');
    SQL.Add('           a.ano      = ' + IntToStr(iAno));
    SQL.Add('       and a.controle = ' + IntToStr(iCodigo));
    SQL.Add('  ))');
    Open;

    Result := (FieldByName('controle').AsInteger > 0);

    if Result then
      sControleInterno := Trim(FieldByName('ano').AsString) + '/' + FormatFloat('###0000000', FieldByName('controle').AsInteger);

    Close;
  end;
end;

function GetExisteNumeroRequisicaoAlmox(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    r.ano');
    SQL.Add('  , r.controle');
    SQL.Add('  , r.numero');
    SQL.Add('from TBREQUISICAO_ALMOX r');
    SQL.Add('where r.Numero  = ' + QuotedStr(Trim(sNumero)));
    SQL.Add('  and (not (');
    SQL.Add('           r.ano      = ' + IntToStr(iAno));
    SQL.Add('       and r.controle = ' + IntToStr(iCodigo));
    SQL.Add('  ))');
    Open;

    Result := (FieldByName('controle').AsInteger > 0);

    if Result then
      sControleInterno := Trim(FieldByName('ano').AsString) + '/' + FormatFloat('###0000000', FieldByName('controle').AsInteger);

    Close;
  end;
end;

function GetMenorVencimentoAPagar : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(cp.dtvenc) as vencimento');
    SQL.Add('from TBCONTPAG cp');
    SQL.Add('where cp.empresa  = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and cp.quitado  = 0');
    SQL.Add('  and cp.situacao = 1');
    Open;

    if not IsEmpty then
      if not FieldByName('vencimento').IsNull then
        Result := FieldByName('vencimento').AsDateTime
      else
        Result := GetDateDB
    else
      Result := GetDateDB;

    Close;
  end;
end;

function GetMenorVencimentoAReceber : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(cr.dtvenc) as vencimento');
    SQL.Add('from TBCONTREC cr');
    SQL.Add('where cr.empresa  = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and cr.baixado  = 0');
    SQL.Add('  and cr.situacao = 1');
    Open;

    if not IsEmpty then
      if not FieldByName('vencimento').IsNull then
        Result := FieldByName('vencimento').AsDateTime
      else
        Result := GetDateDB
    else
      Result := GetDateDB;

    Close;
  end;
end;

function GetMenorDataEmissaoReqAlmoxEnviada(const aEmpresa : String; const aCentroCusto : Integer) : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;

    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(r.data_emissao) as data_emissao');
    SQL.Add('from TBREQUISICAO_ALMOX r');
    SQL.Add('where r.empresa = ' + QuotedStr(aEmpresa));
    SQL.Add('  and r.status in (' + IntToStr(STATUS_REQUISICAO_ALMOX_ENV) + ', ' + IntToStr(STATUS_REQUISICAO_ALMOX_REC) + ')');

    if ( aCentroCusto > 0 ) then
      SQL.Add('  and r.ccusto_destino = ' + IntToStr(aCentroCusto));

    Open;

    if not FieldByName('data_emissao').IsNull then
      Result := FieldByName('data_emissao').AsDateTime
    else
      Result := GetDateDB;

    Close;
  end;
end;

function GetMenorDataApropriacaoAberta(const aEmpresa : String; const aCentroCusto : Integer) : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;

    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(cast(a.data_apropriacao as date)) as data_apropriacao');
    SQL.Add('from TBAPROPRIACAO_ALMOX a');
    SQL.Add('where a.status in (' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_EDC) + ', ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ABR) + ')');

    if (Trim(aEmpresa) <> EmptyStr) then
      SQL.Add('  and a.empresa = ' + QuotedStr(aEmpresa));

    if ( aCentroCusto > 0 ) then
      SQL.Add('  and a.centro_custo = ' + IntToStr(aCentroCusto));

    Open;

    if not FieldByName('data_apropriacao').IsNull then
      Result := FieldByName('data_apropriacao').AsDateTime
    else
      Result := GetDateDB;

    Close;
  end;
end;

function GetMenorDataChequePendente : TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(coalesce(cq.data_apresentacao, cq.data_emissao, current_date)) as apresentacao');
    SQL.Add('from TBCHEQUE cq');
    SQL.Add('where cq.empresa  = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and cq.status   < 2'); // 0. Cheque pendente; 1. Cheque apresentado
    Open;

    if not IsEmpty then
      if not FieldByName('apresentacao').IsNull then
        Result := FieldByName('apresentacao').AsDateTime
      else
        Result := GetDateDB
    else
      Result := GetDateDB;

    Close;
  end;
end;

function GetCarregarProdutoCodigoBarra(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select venda_carrega_produto_ean from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('venda_carrega_produto_ean').AsInteger = 1);

    Close;
  end;
end;

function GetCarregarProdutoCodigoBarraLocal : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_VENDA, INI_KEY_CODIGO_EAN, GetCarregarProdutoCodigoBarra(GetEmpresaIDDefault));
end;

function GetCarregarPapelDeParedeLocal : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_VENDA, INI_KEY_PAPEL_PAREDE, True);
end;

function GetAjustarDataHoraEstacao : Boolean;
begin
  Result := FileINI.ReadBool(INI_SECAO_VENDA, INI_KEY_AJUSTAR_DH, False);
end;

function GetPermissaoRotinaSistema(sRotina : String; const Alertar : Boolean = FALSE) : Boolean;
var
  Return : Boolean;
begin
  try
    Return := (gUsuarioLogado.Funcao = FUNCTION_USER_ID_SYSTEM_ADM);

    if Return then
      Exit;

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  p.acesso');
      SQL.Add('from SYS_FUNCAO_PERMISSAO p');
      SQL.Add('where p.sistema = ' + IntToStr(gSistema.Codigo));
      SQL.Add('  and p.funcao  = ' + IntToStr(gUsuarioLogado.Funcao));
      SQL.Add('  and p.rotina  = ' + QuotedStr(sRotina));
      Open;

      Return := (FieldByName('acesso').AsInteger = 1);

      Close;
    end;

    if not Return then
      if Alertar then
        ShowWarning('Controle de Acesso', sRotina + ' - Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.');
  finally
    Result := Return;
  end;
end;

function GetRotinaPaiIDSistema(const RotinaID : String): String;
var
  sComplemento : String;
begin
  sComplemento := StringOfChar('0', ROTINA_LENGTH_ID);

  if ( Trim(RotinaID) = EmptyStr ) then
    Result := EmptyStr
  else
    Result := Copy(Copy(RotinaID, 1, 3) + sComplemento, 1, ROTINA_LENGTH_ID);
end;

function GetQuantidadeEmpresasEmiteNFe : Integer;
var
  Return : Integer;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  count(c.empresa) as empresas');
      SQL.Add('from TBCONFIGURACAO c');
      SQL.Add('where c.nfe_emitir = 1');
      Open;

      Return := FieldByName('empresas').AsInteger;

      Close;
    end;

  finally
    Result := Return;
  end;
end;

function GetTokenID_NFCe(const Empresa : String) : String;
var
  sReturn : String;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  c.nfce_token_id');
      SQL.Add('from TBCONFIGURACAO c');
      SQL.Add('where c.empresa = ' + QuotedStr(Empresa));
      Open;

      sReturn := Trim(FieldByName('nfce_token_id').AsString);

      Close;
    end;

  finally
    Result := sReturn;
  end;
end;

function GetToken_NFCe(const Empresa : String) : String;
var
  sReturn : String;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  c.nfce_token');
      SQL.Add('from TBCONFIGURACAO c');
      SQL.Add('where c.empresa = ' + QuotedStr(Empresa));
      Open;

      sReturn := Trim(FieldByName('nfce_token').AsString);

      Close;
    end;

  finally
    Result := sReturn;
  end;
end;

function GetFormaPagtoCartaCredito(const Empresa : String) : Integer;
var
  iReturn : Integer;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  coalesce(c.venda_forma_pagto_cartacredito, 0) as cd_forma_pagto');
      SQL.Add('from TBCONFIGURACAO c');
      SQL.Add('  inner join TBFORMPAGTO f on (f.cod = c.venda_forma_pagto_cartacredito)');
      SQL.Add('where c.empresa = ' + QuotedStr(Empresa));
      Open;

      iReturn := FieldByName('cd_forma_pagto').AsInteger;

      Close;
    end;

  finally
    Result := iReturn;
  end;
end;

function SetAcessoEstacao(const sHostName : String) : Boolean;
var
  Return : Boolean;
begin
  try
    Return := False;

    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  e.est_registro');
      SQL.Add('from SYS_ESTACAO e');
      SQL.Add('where coalesce(e.est_nome, e.est_ip) = ' + QuotedStr(Trim(sHostName)));
      Open;

      Return := (FieldByName('est_registro').AsString <> EmptyStr);

      Close;

      if Return then
      begin
        SQL.Clear;
        SQL.Add('Update SYS_ESTACAO e Set');
        SQL.Add('  e.est_ultimo_acesso = ' + QuotedStr(FormatDateTime('dd.mm.yyyy hh:mm:ss', Now)));
        SQL.Add('where coalesce(e.est_nome, e.est_ip) = ' + QuotedStr(Trim(sHostName)));
        ExecSQL;

        CommitTransaction;
      end;
    end;

  finally
    Result := Return;
  end;
end;

function CaixaAberto(const Empresa, Usuario : String;
  const DataRef : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;
begin
  with DMBusiness, fdQryCaixaAberto do
  begin
    Close;
    ParamByName('Empresa').AsString      := Empresa;
    ParamByName('Usuario').AsString      := Usuario;
    ParamByName('Data').AsDateTime       := DataRef;
    ParamByName('FormaPagto').AsSmallInt := FormaPagto;
    Open;

    Result := ( FieldByName('ANO').AsInteger > 0 );

    if ( Result ) then
    begin
      CxAno           := FieldByName('ANO').AsInteger;
      CxNumero        := FieldByName('NUMERO').AsInteger;
      CxContaCorrente := FieldByName('CONTA_CORRENTE').AsInteger
    end;
  end;
end;

function SetMovimentoCaixa(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
  const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
var
  Return : Boolean;
begin
  try

    Return := False;

    try

      UpdateSequence('GEN_CX_MOVIMENTO_' + IntToStr(YearOf(Data)), 'TBCAIXA_MOVIMENTO', 'NUMERO', 'where ANO = ' + IntToStr(YearOf(Data)));

      if ( TipoMov = tmcxCredito ) then
        with DMBusiness, stpCaixaMovimentoREC do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end
      else
      if ( TipoMov = tmcxDebito ) then
        with DMBusiness, stpCaixaMovimentoPAG do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end;

      Return := True;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar registrar o pagamento no movimento de caixa.' + #13#13 + E.Message);
      end;
    end;

  finally
    Result := Return;
  end;
end;

function SetMovimentoCaixaEstorno(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
  const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
var
  Return : Boolean;
begin
  try

    Return := False;

    try

      UpdateSequence('GEN_CX_MOVIMENTO_' + IntToStr(YearOf(Data)), 'TBCAIXA_MOVIMENTO', 'NUMERO', 'where ANO = ' + IntToStr(YearOf(Data)));

      if ( TipoMov = tmcxCredito ) then
        with DMBusiness, stpCaixaMovimentoREC_ESTORNO do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end
      else
      if ( TipoMov = tmcxDebito ) then
        with DMBusiness, stpCaixaMovimentoPAG_ESTORNO do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').AsDateTime  := Data;
          ParamByName('FORMA_PAGTO').AsInteger  := FormaPagto;
          ParamByName('ANOLANC').AsInteger      := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsInteger          := SeqPagto;
          ParamByName('VALOR_BAIXA').AsCurrency := Valor;

          ExecProc;
          CommitTransaction;
        end;

      Return := True;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar registrar o estorno de movimento no caixa.' + #13#13 + E.Message);
      end;
    end;

  finally
    Result := Return;
  end;
end;

procedure TDMBusiness.CarregarLicenca(const sNomeArquivo: String);
var
  Arquivo : TStringList;
  ini : TIniFile;
  I : Integer;
begin
  if FileExists(sNomeArquivo) then
  begin

    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile(sNomeArquivo);

    for I := 0 to Arquivo.Count - 1 do
    begin
      cdsLicenca.Append;
      cdsLicencaLINHA_CONTROLE.AsString := Arquivo.Strings[I];
      cdsLicenca.Post;
    end;

    cdsLicenca.ApplyUpdates;
    CommitTransaction;

    Arquivo.Free;

  end;

  cdsLicenca.Close;
  cdsLicenca.Open;

  Arquivo := TStringList.Create;
  try
    cdsLicenca.First;
    while not cdsLicenca.Eof do
    begin
      Arquivo.Add( cdsLicencaLINHA_CONTROLE.AsString );
      cdsLicenca.Next;
    end;

    for I := 0 to Arquivo.Count - 1 do
      Arquivo.Strings[I] := DecriptarSenha_Master(Arquivo.Strings[I], SYS_PASSWD_KEY);

    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');

    gLicencaSistema.Empresa  := ini.ReadString('Licenca', 'edEmpresa',  '');
    gLicencaSistema.CNPJ     := ini.ReadString('Licenca', 'edCGC',      '');
    gLicencaSistema.Endereco := ini.ReadString('Licenca', 'edEndereco', '');
    gLicencaSistema.Bairro   := ini.ReadString('Licenca', 'edBairro',   '');
    gLicencaSistema.Cidade   := ini.ReadString('Licenca', 'edCidade',   '');
    gLicencaSistema.UF       := ini.ReadString('Licenca', 'edUF',       '');
    gLicencaSistema.CEP      := ini.ReadString('Licenca', 'edCEP',      '');
    gLicencaSistema.Competencia  := StrToIntDef(ini.ReadString('Licenca', 'edCompetencia', FormatDateTime('yyyymm', Date + 30)), 0);
    gLicencaSistema.DataBloqueio := ini.ReadDateTime('Licenca', 'edDataBloqueio', Date + 45);
    gLicencaSistema.UsarSGE  := ini.ReadBool('Licenca', 'chkSGE', False);
    gLicencaSistema.UsarSGI  := ini.ReadBool('Licenca', 'chkSGI', False);
    gLicencaSistema.UsarSGF  := ini.ReadBool('Licenca', 'chkSGF', False);

    SetSegmento(SEGMENTO_PADRAO_ID,          SEGMENTO_PADRAO_DS);
    SetSegmento(SEGMENTO_VAREJO_ATACADO_ID,  SEGMENTO_VAREJO_ATACADO_DS);
    SetSegmento(SEGMENTO_MERCADO_CARRO_ID,   SEGMENTO_MERCADO_CARRO_DS);
    SetSegmento(SEGMENTO_SERVICOS_ID,        SEGMENTO_SERVICOS_DS);
    SetSegmento(SEGMENTO_VAREJO_SERVICOS_ID, SEGMENTO_VAREJO_SERVICOS_DS);
    SetSegmento(SEGMENTO_VAREJO_DELIVERY_ID, SEGMENTO_VAREJO_DELIVERY_DS);
    SetSegmento(SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_METAL_DS);
    SetSegmento(SEGMENTO_INDUSTRIA_GERAL_ID, SEGMENTO_INDUSTRIA_GERAL_DS);

    RegistrarEmpresa;
    GerarCompetencias( StrToInt(Copy(IntToStr(gLicencaSistema.Competencia), 1, 4)) );
  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

    FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_FILELICENSE, sNomeArquivo);
    FileINI.UpdateFile;
  end;
end;

procedure TDMBusiness.DataModuleCreate(Sender: TObject);
var
  I ,
  X : Integer;
  sServidor,
  sPorta   ,
  sBase    : String;
begin
(*
-- EXTRAIR METADATA DA BASE FIREBIRD:
C:\Program Files (x86)\Firebird\Firebird_2_5\bin>isql -extract -o d:\agil.sql AGIL_COMERCIO -u sysdba -p masterkey

-- EXECUTAR SCRIPT NA BASE:
isql.exe C:\Aplicativo\Banco.fdb -m -b -i C:\Atualizacao\Script.sql -q -u SYSDBA -p masterkey
*)
  {$IFNDEF PRINTER_CUPOM}
  SplashMessage('Conectando-se à base de dados...');
  {$ENDIF}

  gSistema.Codigo := SISTEMA_GESTAO_COM;
  gSistema.Nome   := Application.Title;

  try
    with FileINI do
    begin
      sServidor := ReadString('Conexao', 'Servidor', 'localhost');
      sPorta    := ReadString('Conexao', 'Porta',    '3050');
      sBase     := ReadString('Conexao', 'Base',     'AGIL_COMERCIO');

      {$IFNDEF PRINTER_CUPOM}
      if (ParamCount >= 2) then
      begin
        sServidor := ParamStr(1);
        sBase     := ParamStr(2);
      end;
      {$ENDIF}

      if Pos('/', sServidor) > 0 then
      begin
        sPorta    := Copy(sServidor, Pos('/', sServidor) + 1, Length(sServidor));
        sServidor := Copy(sServidor, 1, Pos('/', sServidor) - 1);
      end
      else
      if (sPorta = EmptyStr) then
        sPorta := '3050';

      // Se a estação é o host servidor do banco, iniciar servidor FireBird
      if EstacaoServidora( ReadString('Conexao', 'Servidor', 'localhost') ) then
        ControlFBSvr(True);
    end;

    // Conexão InterBase
    with ibdtbsBusiness do
    begin
      Connected    := False;
      DatabaseName := sServidor + '/' + sPorta + ':' + sBase;
      Params.Clear;
      Params.Add('user_name=' + DB_USER_NAME);
      Params.Add('password='  + DB_USER_PASSWORD);
      Params.Add('lc_ctype='  + DB_LC_CTYPE);
      Connected := True;
    end;

    // Conexão FireDAC
    with fdConexao do
    begin
      Connected := False;
      Params.Clear;
      Params.Add('DriverID=FB');
      Params.Add('Protocol=TCPIP');
      Params.Add('Server='       + sServidor);
      Params.Add('Port='         + sPorta);
      Params.Add('Database='     + sBase);
      Params.Add('User_Name='    + DB_USER_NAME);
      Params.Add('Password='     + DB_USER_PASSWORD);
      Params.Add('CharacterSet=' + DB_LC_CTYPE);

      Connected := True;
    end;

    // Upgrade DB
    UpgradeDataBase;

    MontarPermissao;

    cdsLicenca.Open;
    if cdsLicenca.IsEmpty then
    begin
      if opdLicenca.Execute then
        CarregarLicenca(opdLicenca.FileName)
      else
      begin
        ShowWarning('Licença', 'Sistema não registrado!' + #13 + 'Favor carregar arquivo de licença');
        Application.Terminate;
      end;
    end
    else
    begin
      CarregarLicenca(EmptyStr);
    end;

    try
      with RegistroSistema do
      begin
        RootKey := HKEY_CURRENT_USER;
        OpenKey(SYS_PATH_REGISTER + GetInternalName, True);

        WriteString(KEY_REG_VERSAO, GetExeVersion);
        WriteString(KEY_REG_DATA,   DateToStr(Date));
        CloseKey;
      end;
    except
    end;

    for I := -2 to 2 do
    begin
      X := StrToInt(FormatDateTime('YYYY', Date)) + I;
      GerarCompetencias( X );
    end;

    if ( fdConexao.Connected ) then
    begin
      fdQryUsers.Open;
      fdQryEmpresa.Open;
    end;
  except
    On E : Exception do
      ShowError('Erro ao tentar conectar no Servidor/Base.' + #13#13 + E.Message);
  end;
end;

procedure TDMBusiness.fdScriptBeforeExecute(Sender: TObject);
begin
  {$IFNDEF PRINTER_CUPOM}
  SplashMessage('Atualizando base de dados...');
  {$ENDIF}
end;

procedure TDMBusiness.fdScriptError(ASender: TObject;
  const AInitiator: IFDStanObject; var AException: Exception);
var
  sLOG_Error : TStringList;
begin
  sLOG_Error := TStringList.Create;
  try
    sLOG_Error.BeginUpdate;
    sLOG_Error.Add('Aplicativo: ' + Application.Title);
    sLOG_Error.Add('Versão    : ' + GetVersion);

    if (fdScript.SQLScripts.Count > 0) then
    begin
      sLOG_Error.Add('-');
      sLOG_Error.Add('SCRIPT:');
      sLOG_Error.AddStrings(fdScript.SQLScripts.Items[fdScript.SQLScripts.Count - 1].SQL);
    end;

    sLOG_Error.Add('-');
    sLOG_Error.Add('ERRO:');
    sLOG_Error.Add(AException.Message);
    sLOG_Error.EndUpdate;

    ForceDirectories(ExtractFilePath(Application.ExeName) + '_logError\');
    sLOG_Error.SaveToFile(ExtractFilePath(Application.ExeName) + '_logError\' + FormatDateTime('yyyy-mm-dd.hhmmss".sql"', Now));
  finally
    sLOG_Error.Free;
  end;
end;

procedure TDMBusiness.MontarPermissao;
begin
  _PermissaoPerfilDiretoria    := TStringList.Create;
  _PermissaoPerfil_DIRETORIA   := TStringList.Create;
  _PermissaoPerfil_GERENTE_VND := TStringList.Create;
  _PermissaoPerfil_GERENTE_FIN := TStringList.Create;
  _PermissaoPerfil_VENDEDOR    := TStringList.Create;
  _PermissaoPerfil_GERENTE_ADM := TStringList.Create;
  _PermissaoPerfil_CAIXA       := TStringList.Create;
  _PermissaoPerfil_AUX_FINANC1 := TStringList.Create;
  _PermissaoPerfil_AUX_FINANC2 := TStringList.Create;
  _PermissaoPerfil_SUPERV_CX   := TStringList.Create;
  _PermissaoPerfil_ESTOQUISTA  := TStringList.Create;
  _PermissaoPerfil_SUPORTE_TI  := TStringList.Create;
  _PermissaoPerfil_SYSTEM_ADM  := TStringList.Create;

  MontarPermissao_Diretoria;
end;

procedure TDMBusiness.ValidarLicenca(const sNomeArquivo: String;
  var CNPJ: String);
var
  Arquivo : TStringList;
  ini : TIniFile;
  I : Integer;
begin

  Arquivo := TStringList.Create;
  try

    Arquivo.LoadFromFile( sNomeArquivo );

    for I := 0 to Arquivo.Count - 1 do
      Arquivo.Strings[I] := DecriptarSenha_Master(Arquivo.Strings[I], SYS_PASSWD_KEY);

    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');

    CNPJ := Trim(ini.ReadString('Licenca', 'edCGC', ''));

  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;

end;

procedure TDMBusiness.LimparLicenca;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Delete from SYS_LICENCA');
    ExecSQL;

    CommitTransaction;
  end;
end;

function TDMBusiness.LiberarUsoLicenca(const dDataMovimento : TDateTime;
  const Alertar: Boolean = FALSE): Boolean;
var
  aFile : String;
  aTexto: TStringList;
  iDias : Integer;
  dData : TDateTime;
begin
  if ( dDataMovimento = 0 ) then
    dData := GetDateDB
  else
    dData := dDataMovimento;

  iDias  := DaysBetween(dData, (gLicencaSistema.DataBloqueio + 1));
  Result := {$IFDEF DGE}True{$ELSE}((gLicencaSistema.DataBloqueio + 1) > dData){$ENDIF};

  if (iDias <= SYS_ALERTA_PERIODO_LICENCA) then
  begin
    aFile  := ExtractFilePath(ParamStr(0)) + SYS_ALERTA_ARQUIVO_LICENCA;
    if not FileExists(aFile) then
    begin
      aTexto := TStringList.Create;
      aTexto.Text :=
       //123456789012345678901234567890
        '=============================' + #13 +
        'ALERTA!' + #13 +
        '=============================' + #13#13 +
        'Data de expiração da licenca de uso do sistema está para o dia ' + DateToStr(gLicencaSistema.DataBloqueio) + '.' + #13#13 +
        'Acessos a determinadas rotinas no sistema serão bloqueados!' + #13#13 +
        'Favor entrar em contato com suporte.';

      try
        aTexto.SaveToFile(aFile);
      finally
        aTexto.Free;
      end;
    end;
  end;

  if not Result then
    if Alertar then
      ShowStop('Licença',
        'Competência : ' + IntToStr (gLicencaSistema.Competencia)  + #13 +
        'Data Expiração : ' + DateToStr(gLicencaSistema.DataBloqueio) + #13#13 +
        'A licença do sistema expirou.' + #13 +
        'Acessos a determinadas rotinas no sistema serão bloqueados!' + #13#13 +
        'Favor entrar em contato com suporte.');
end;

procedure TDMBusiness.MontarPermissao_Diretoria;
begin
  _PermissaoPerfilDiretoria.BeginUpdate;
  _PermissaoPerfilDiretoria.Clear;

  _PermissaoPerfilDiretoria.Add( ROTINA_MENU_CADASTRO_ID );
  _PermissaoPerfilDiretoria.Add( ROTINA_MENU_ENTRADA_ID );

  _PermissaoPerfilDiretoria.EndUpdate;
end;

function TDMBusiness.NovaLicencaDisponivel(const dDataLicenca: TDateTime): Boolean;
var
  aRetorno : Boolean;
  Arquivo  : TStringList;
  ini : TIniFile;
  I : Integer;
  sFile : String;
  aData : TDateTime;
begin
  aRetorno := False;
  try
    sFile := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_FILELICENSE, EmptyStr);
    if (Trim(sFile) <> EmptyStr) and (FileExists(sFile)) then
    begin
      Arquivo := TStringList.Create;
      Arquivo.LoadFromFile(sFile);

      for I := 0 to Arquivo.Count - 1 do
        Arquivo.Strings[I] := DecriptarSenha_Master(Arquivo.Strings[I], SYS_PASSWD_KEY);

      Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

      ini      := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');
      aData    := ini.ReadDate('Licenca', 'edDataBloqueio', dDataLicenca);
      aRetorno := (aData > dDataLicenca);
    end;
  finally
    if Assigned(ini) then
      ini.Free;
    if Assigned(Arquivo) then
      Arquivo.Free;

    sFile := ExtractFilePath(Application.ExeName) + '_temp.ini';
    if FileExists(sFile) then
      DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

    Result := aRetorno;
  end;
end;

procedure TDMBusiness.CarregarLicencaAuto;
var
  sCNPJ ,
  sFile : String;
begin
  sFile := FileINI.ReadString(INI_SECAO_DEFAULT, INI_KEY_FILELICENSE, EmptyStr);
  if (Trim(sFile) <> EmptyStr) and (FileExists(sFile)) then
  begin
    ValidarLicenca(sFile, sCNPJ);
    if (sCNPJ = gLicencaSistema.CNPJ) then
    begin
      LimparLicenca;
      CarregarLicenca(sFile);
    end;
  end;
end;

procedure TDMBusiness.ConfigurarEmail(const sCNPJEmitente, sDestinatario,
  sAssunto, sMensagem: String);
var
  sAssinaturaHtml,
  sAssinaturaTxt : String;
begin
  CarregarConfiguracoesEmpresa(sCNPJEmitente, sAssunto, sAssinaturaHtml, sAssinaturaTxt);

  // Configurar conta de e-mail no Fast Report
  
  with frxMailExport do
  begin
    SmtpHost := gContaEmail.Servidor_SMTP;
    SmtpPort := gContaEmail.Porta_SMTP;
    Login    := gContaEmail.Conta;
    Password := gContaEmail.Senha;

    FromCompany := GetRazaoSocialEmpresa( sCNPJEmitente );
    FromMail    := gContaEmail.Conta;
    FromName    := GetNomeFantasiaEmpresa( sCNPJEmitente );
    Subject     := Trim(sAssunto);
    Address     := AnsiLowerCase(Trim(sDestinatario));

    Lines.Clear;
    Lines.Add( sMensagem );

    Signature.Clear;
    Signature.Add(sAssinaturaTxt);
  end;

  // Configurar conta de e-mail no ACBrMail

  with ACBrMail do
  begin
    From     := gContaEmail.Conta;
    FromName := RemoveAcentos(GetRazaoSocialEmpresa(sCNPJEmitente));
    Host     := gContaEmail.Servidor_SMTP;
    Username := gContaEmail.Conta;
    Password := gContaEmail.Senha;
    Port     := IntToStr(gContaEmail.Porta_SMTP);
    SetSSL   := gContaEmail.ConexaoSeguraSSL;
    SetTLS   := gContaEmail.RequerAutenticacao;
    IsHTML   := False;
    Subject  := Trim(sAssunto);
    AddAddress( AnsiLowerCase(Trim(sDestinatario)) );

    Body.BeginUpdate;
    Body.Clear;
    Body.Add( sMensagem );
    Body.Add( sAssinaturaTxt );
    Body.EndUpdate;
  end;
end;

initialization
  FormFunction    := TFormularios.Create;
  RegistroSistema := TRegistry.Create;

finalization
  FormFunction.Destroy;

end.
