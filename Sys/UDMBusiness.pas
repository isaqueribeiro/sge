unit UDMBusiness;

interface

uses
  UConstantesDGE,
  Interacao.Usuario,

  {$IFNDEF PRINTER_CUPOM}
  Model.Conexao.Factory.Interfaces,
  Model.Conexao.Interfaces,
  {$ENDIF}

  Windows, Forms, SysUtils, Classes, Controls, IniFIles,
  ShellApi, Printers, DateUtils, IdCoder, IdCoder3to4, IdCoderMIME,
  IdBaseComponent, IdComponent, IdIPWatch, DB, DBClient, Provider, Dialogs, Registry,

  frxClass, frxDBSet, frxBarcode, frxCross, frxRich, frxExportMail, frxExportXML,
  frxExportODF, frxExportDOCX, frxExportXLSX, frxExportImage, frxExportRTF, frxExportPDF,
  frxExportBaseDialog, frxExportXLS,

  ACBrBase, ACBrValidador, ACBrMail, ACBrUtil,

  SGE.Controller.Interfaces,
  SGE.Controller.Factory,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IBDef,
  FireDAC.Phys.FBDef, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Comp.Script;

type
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
    UsarSGO : Boolean;
  end;

  TBlocoImpressaoCupom = (bicCupomRelatorioGerencial, bicCupom, bicRelatorioGerencial);

  TDMBusiness = class(TDataModule)
    dtsrcUsers: TDataSource;
    IdIPWatch: TIdIPWatch;
    opdLicenca: TOpenDialog;
    frxPDF: TfrxPDFExport;
    frxRTF: TfrxRTFExport;
    frxJPEG: TfrxJPEGExport;
    frxMailExport: TfrxMailExport;
    frxRichObject: TfrxRichObject;
    frxCrossObject: TfrxCrossObject;
    fastReport: TfrxReport;
    ACBrValidador: TACBrValidador;
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
    fdQryUpgrade: TFDQuery;
    fdUpdUpgrade: TFDUpdateSQL;
    cdsLicencaXXX: TFDTable;
    cdsLicencaXXXLINHA_CONTROLE: TStringField;
    stpCaixaMovimentoREC: TFDStoredProc;
    stpCaixaMovimentoPAG: TFDStoredProc;
    stpContaCorrenteSaldo: TFDStoredProc;
    stpCaixaMovimentoREC_ESTORNO: TFDStoredProc;
    stpCaixaMovimentoPAG_ESTORNO: TFDStoredProc;
    spAtualizarCustoApEntrada: TFDStoredProc;
    spAtualizarCustoApAutorizacao: TFDStoredProc;
    spAtualizarCustoEstoqueAlmoxarifado: TFDStoredProc;
    spAtualizarCustoEstoqueRequisicao: TFDStoredProc;
    spAtualizarCustoEstoqueInventario: TFDStoredProc;
    frxXLSX: TfrxXLSXExport;
    frxDOCX: TfrxDOCXExport;
    frxODS: TfrxODSExport;
    frxODT: TfrxODTExport;
    frxXML: TfrxXMLExport;
    stpContaCorrenteSaldo_v2: TFDStoredProc;
    frxXLS: TfrxXLSExport;
    cdsRegistro: TFDQuery;
    cdsRegistroEST_LOCAL: TStringField;
    cdsRegistroEST_NOME: TStringField;
    cdsRegistroEST_IP: TStringField;
    cdsRegistroEST_REGISTRO: TStringField;
    cdsRegistroEST_ULTIMO_ACESSO: TSQLTimeStampField;
    updRegistro: TFDUpdateSQL;
    dtsRegistro: TDataSource;
    ACBrMail: TACBrMail;
    spAtualizarCustoEstoqueGeral: TFDStoredProc;
    procedure DataModuleCreate(Sender: TObject);
    procedure fdScriptBeforeExecute(Sender: TObject);
    procedure fdScriptError(ASender: TObject; const AInitiator: IFDStanObject;
      var AException: Exception);
    procedure DataModuleDestroy(Sender: TObject);
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
    procedure DestruirPermissao;
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

  {$IFNDEF PRINTER_CUPOM}
  gModelConexaoFactory : IModelConexaoFactory;
  gModelConexao : IModelConexao;
  {$ENDIF}

  //gSistema    : TSistema;
  gUsuarioLogado : IUsuario;
  gContaEmail : TContaEmail;
  RegistroSistema : TRegistry;


  function IfThenStr(AValue: Boolean; const ATrue: string; AFalse: string = ''): string;
  function IfThen(AValue: Boolean; const ATrue: TDateTime; AFalse: TDateTime = 0): TDateTime; overload;
  function IfThen(AValue: Boolean; const ATrue: Integer; AFalse: Integer = 0): Integer; overload;
  function IfThen(AValue: Boolean; const ATrue: Currency; AFalse: Currency = 0.0): Currency; overload;
  function IfThen(AValue: Boolean; const ATrue: Boolean; AFalse: Boolean = False): Boolean; overload;
  function EstacaoServidora(aServidor : String): Boolean;
  function ControlFBSvr(aStart : Boolean): Boolean;
  function DataBaseOnLine : Boolean;
  function GetVersionDB(aSistema : Integer) : Currency;
  function UsoSistema(aSistema : Integer) : Boolean;

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
  procedure ExportarFR3_ToXLSX(const FrrLayout: TfrxReport; var sFileName : String);

  procedure GerarSaldoContaCorrente(const pContaCorrente : Integer; const pData : TDateTime);
  procedure GerarSaldoContaCorrente_v2(const pContaCorrente : Integer; const pDataInicial, pDataFinal : TDateTime);
//  procedure BloquearClientes;
//  procedure DesbloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
//  procedure BloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
  procedure GerarCompetencias(const pAno : Smallint);
  procedure CriarGenerator(const aName : String; const aAno : Smallint);
  procedure RegistrarEmpresa;
  procedure RegistrarEstacaoDefault;
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
  procedure SetAtualizarSaldoContasAPagar(const aEmpresa : String);
  procedure SetAtualizarSaldoContasAReceber(const aEmpresa : String);

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
  function GetCfopRemessa(const iCfop : Integer) : Boolean;
  function GetCfopFaturarRemessa(const iCfop : Integer) : Boolean;
  function GetCfopGerarTitulo(const iCfop : Integer) : Boolean;
  function GetCfopGerarDuplicata(const iCfop : Integer) : Boolean;
  function GetCfopMovimentaEstoque(const iCfop : Integer) : Boolean;
  function GetCfopTipo(const aCfop : Integer) : TTipoCFOP;
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
  function GetSimplesNacionalInsEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetEstoqueUnificadoEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetEstoqueSateliteEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetRegimeEmpresa(const sCNPJEmpresa : String) : TTipoRegime;
  function GetRazaoSocialEmpresa(const sCNPJEmpresa : String) : String;
  function GetNomeFantasiaEmpresa(const sCNPJEmpresa : String) : String;
  function GetCnpjEmpresa(const iCodigo : Integer) : String;
  function GetCnaeEmpresa(const sCNPJEmpresa : String) : String;
  function GetPrazoValidadeCotacaoCompra(const sCNPJEmpresa : String) : Integer;
  function GetMenorDataEmissaoOS : TDateTime;
  function GetExisteNumeroNFe(const aCNPJEmpresa, aSerie : String; const aNumero : Largeint; const aModelo : Integer) : Boolean;

  function StrIsCNPJ(const Num: string): Boolean;
  function StrIsCPF(const Num: string): Boolean;
  function StrIsDateTime(const S: string): Boolean;
  function StrIsInteger(const Num: string): Boolean;
  function StrFormatar(Documento, Complemento : String; const TipoDocumento : TACBrValTipoDocto): String;
  function StrFormatarCnpj(sCnpj: String): String;
  function StrFormatarCpf(sCpf: String): String;
  function StrFormatarCEP(sCEP: String): String;
  function StrFormatarFONE(sFone: String): String;
  function StrFormatarNome(aNome : String): String;
  function StrDescricaoProduto(const NoPlural : Boolean = TRUE) : String;
  function StrDescricaoProdutoBtn(const NoPlural : Boolean = TRUE) : String;
  function StrOnlyNumbers(const Str : String) : String;
  Function StrInscricaoEstadual(const IE, UF : String) : Boolean;
  Function StrIsGTIN(aValue : String; out aError : String) : Boolean;
  Function StrIsEmail(aValue : String; out aError : String) : Boolean;

  function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
  function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;

  function GetGeneratorID(const GeneratorName : String) : Integer;
  function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
  function GetCountID(NomeTabela : String; const sWhere : String = '') : Largeint;
  function GetNumeroNFe(const aEmissorCNPJ : String; const aSerie, aModelo : Integer) : Largeint;
  function GetNumeroNFCe(const aEmissorCNPJ : String; const aSerie, aModelo : Integer) : Largeint;
  function GetNumeroNSU(const aEmpresa : String) : Largeint;
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
  function GetCidadeID(const aIBGE : Currency) : Integer; overload;
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
  function GetEmpresaCidade(const sCNPJEmitente : String) : String;
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
  function GetProdutoFornecedorCodigo(const aCnpj, aProduto : String) : String;
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
  function GetDateFirtsMonth : TDateTime;
  function GetDateLastMonth : TDateTime;
  function GetProximoDiaUtil(const Data : TDateTime) : TDateTime;
  function GetTimeDB : TDateTime;
  function GetUserApp(const aLogin : String = '') : String;
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
  function GetImprimirCodigoReferenciaProdutoNFe(const sCNPJEmitente : String) : Boolean;
  function GetImprimirCodigoExternoProdutoNFe(const sCNPJEmitente : String) : Boolean;
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
  function GetAliquotaICMS(const aUFOrigem, aUFDestino : String) : Currency;
  function GetAliquotaFCP(const aUF : String) : Currency;
  function GetFormaPagtoCartaCredito(const Empresa : String) : Integer;

  function SetAcessoEstacao(const sHostName : String) : Boolean;

  function CaixaAberto(const Empresa, Usuario : String;
    const DataRef : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;

  function SetMovimentoCaixa(const Usuario : String; const pData : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
  function SetMovimentoCaixaEstorno(const Usuario : String; const pData : TDateTime; const FormaPagto : Smallint;
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

  TIPO_SOLICITACAO_COMPRA         = TIPO_AUTORIZACAO_COMPRA;
  TIPO_SOLICITACAO_SERVICO        = TIPO_AUTORIZACAO_SERVICO;
  TIPO_SOLICITACAO_COMPRA_SERVICO = TIPO_AUTORIZACAO_COMPRA_SERVICO;

  TIPO_APROPRIACAO_GERAL   = 0;
  TIPO_APROPRIACAO_ENTRADA = 1;
  TIPO_APROPRIACAO_AUTORIZ = 2;

  STATUS_APROPRIACAO_ESTOQUE_EDC = 0;
  STATUS_APROPRIACAO_ESTOQUE_ABR = 1;
  STATUS_APROPRIACAO_ESTOQUE_ENC = 2;
  STATUS_APROPRIACAO_ESTOQUE_CAN = 3;

  STATUS_INVENTARIO_ALMOX_EML = 0;
  STATUS_INVENTARIO_ALMOX_EMC = 1;
  STATUS_INVENTARIO_ALMOX_ENC = 2;
  STATUS_INVENTARIO_ALMOX_CAN = 3;

implementation

uses
    Vcl.StdCtrls
  , UFuncoes
  , UDMRecursos
  {$IFNDEF PRINTER_CUPOM}
  , Model.Conexao.Factory
  {$ENDIF}
  , View.Mensagem
  , Controller.Factory;

{$R *.dfm}

function IfThenStr(AValue: Boolean; const ATrue: string;
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
            True  : ShellExecute(0, nil, PChar(szBuff), '-s start', nil, SW_HIDE); // -s Superserver
            False : ShellExecute(0, nil, PChar(szBuff), '-s stop',  nil, SW_HIDE); // -c ClientServer
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
  //Result := DMBusiness.ibdtbsBusiness.Connected;
  Result := DMBusiness.fdConexao.Connected;
end;

function GetVersionDB(aSistema : Integer) : Currency;
var
  aRetorno : Currency;
begin
  aRetorno := VERSION_NUMBER_ID;
  try
    try
      with DMBusiness, fdQryBusca do
      begin
          Close;
          SQL.Clear;
          SQL.Add('Select');
          SQL.Add('  coalesce(x.sis_version, ' + VERSION_NUMBER_STR + ') as sis_version');
          SQL.Add('from (');
          SQL.Add('  Select');
          SQL.Add('    max(u.sis_version) as sis_version');
          SQL.Add('  from SYS_UPGRADE u');
          SQL.Add('  where u.upgrade_ok = 1');
          SQL.Add('    and u.sis_cod = ' + IntToStr(aSistema));
          SQL.Add(') x');
          Open;

          aRetorno := FieldByName('sis_version').AsCurrency;
      end;
    except
      aRetorno := VERSION_NUMBER_ID;
    end;
  finally
    Result := aRetorno;
  end;
end;

function UsoSistema(aSistema : Integer) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    try
      with DMBusiness, fdQryBusca do
      begin
          Close;
          SQL.Clear;
          SQL.Add('Select');
          SQL.Add('  s.sis_nome ');
          SQL.Add('from SYS_SISTEMA s');
          SQL.Add('where s.sis_cod = ' + aSistema.ToString);
          Open;

          aRetorno := (FieldByName('sis_nome').AsString.Trim <> EmptyStr);
      end;
    except
      aRetorno := False;
    end;
  finally
    Result := aRetorno;
  end;
end;

function ShowConfirmation(sTitle, sMsg : String) : Boolean;
var
  fMsg  : TFrmMensagem;
  aForm : TForm;
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Confirmar(sTitle, sMsg);

      Result := (fMsg.ShowModal = mrYes);
    finally
      fMsg.Free;
    end
  else
  begin
    aForm := CreateMessageDialog(PChar(sMsg), mtConfirmation, [mbYes, mbNo], TMsgDlgBtn.mbNo);
    try
      aForm.Caption := IfThenStr(sTitle.Trim.IsEmpty, 'Confirmar', sTitle);

      (aForm.FindComponent('Yes') as TButton).Caption  := '&Sim';
      (aForm.FindComponent('No')  as TButton).Caption  := '&Não';

      Result := ( aForm.ShowModal = ID_YES );
    finally
      FreeAndNil(aForm);
    end;
  end;
//    Result := (MessageDlg(PChar(sMsg), TMsgDlgType.mtConfirmation, [mbYes, mbNo], 0, mbNo) = ID_YES);
//    Result := (Application.MessageBox(PChar(sMsg), PChar(sTitle), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES);
end;

function ShowConfirmation(sMsg : String) : Boolean;
begin
  Result := ShowConfirmation('Confirmar', sMsg);
end;

procedure UpgradeDataBase;
var
  aFileUpgrade  : String;
  aVersaoUpgrade,
  aVersaoBase   ,
  aVersaoApp    : Currency;
begin
  aVersaoBase    := GetVersionDB(gSistema.Codigo) + 1;
  aVersaoApp     := gVersaoApp.VersionID;
  aVersaoUpgrade := aVersaoBase;
  while (aVersaoUpgrade <= aVersaoApp) do
  begin
    aFileUpgrade := ExtractFilePath(ParamStr(0)) + FormatFloat('00000000', aVersaoUpgrade) + '.sql';
    ExecuteScriptMetaData(aFileUpgrade);

    aVersaoUpgrade := aVersaoUpgrade + 1;
  end;
end;

procedure ShowInformation(sTitle, sMsg : String);
var
  fMsg : TFrmMensagem;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
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
  fMsg : TFrmMensagem;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Informe('Informação', sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    MessageDlg(PChar(sMsg), TMsgDlgType.mtInformation, [mbOK], 0);
end;

procedure ShowWarning(sMsg : String);
var
  fMsg  : TFrmMensagem;
  aForm : TForm;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Alerta('Alerta', sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
  begin
    aForm := CreateMessageDialog(PChar(sMsg), TMsgDlgType.mtWarning, [mbOK], TMsgDlgBtn.mbOK);
    try
//      (aForm.FindComponent('Yes') as TButton).Caption  := 'Sim';
//      (aForm.FindComponent('No')  as TButton).Caption  := 'Não';
      aForm.Caption := 'Alerta!';
      aForm.ShowModal;
    finally
      FreeAndNil(aForm);
    end;
//
//    MessageDlg(PChar(sMsg), TMsgDlgType.mtWarning, [mbOK], 0);
  end;
end;

procedure ShowWarning(sTitulo, sMsg : String);
var
  fMsg : TFrmMensagem;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Alerta(IfThenStr(Trim(sTitulo) = EmptyStr, 'Alerta', Trim(sTitulo)), sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    Application.MessageBox(PChar(sMsg), PChar(IfThenStr(Trim(sTitulo) = EmptyStr, 'Alerta', Trim(sTitulo))), MB_ICONWARNING);
end;

procedure ShowStop(sMsg : String);
var
  fMsg : TFrmMensagem;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
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
  fMsg : TFrmMensagem;
begin
  WaitAMomentFree;

  if (gSistema.Codigo = SISTEMA_PDV) then
    try
      fMsg := TFrmMensagem.GetInstance(Application);
      fMsg.Parar(IfThenStr(Trim(sTitulo) = EmptyStr, 'Pare!', Trim(sTitulo)), sMsg);
      fMsg.ShowModal;
    finally
      fMsg.Free;
    end
  else
    Application.MessageBox(PChar(sMsg), PChar(IfThenStr(Trim(sTitulo) = EmptyStr, 'Pare!', Trim(sTitulo))), MB_ICONSTOP);
end;

procedure ShowError(sMsg : String);
var
  sLOG_Error : TStringList;
  aForm : TForm;
begin
  WaitAMomentFree;

  sLOG_Error := TStringList.Create;
  try
    sLOG_Error.BeginUpdate;
    sLOG_Error.Add('Aplicativo: ' + Application.Title);
    sLOG_Error.Add('Versão    : ' + gVersaoApp.Version);
    sLOG_Error.Add('-');
    sLOG_Error.Add('ERRO:');
    sLOG_Error.Add(sMsg);
    sLOG_Error.EndUpdate;

    ForceDirectories(ExtractFilePath(Application.ExeName) + '_logError\');
    sLOG_Error.SaveToFile(ExtractFilePath(Application.ExeName) + '_logError\' + FormatDateTime('yyyy-mm-dd.hhmmss".log"', Now));

    aForm := CreateMessageDialog(PChar(sMsg), TMsgDlgType.mtError, [mbOK], TMsgDlgBtn.mbOK);

    aForm.Caption := 'Erro';
    aForm.ShowModal;
    //MessageDlg(PChar(sMsg), TMsgDlgType.mtError, [mbOK], 0);
  finally
    sLOG_Error.Free;
    FreeAndNil(aForm);
  end;
end;

procedure ShowErrorNotify(Sender: TObject; E: Exception);
var
  sLOG_File  : String;
  sLOG_Error : TStringList;
  aForm : TForm;
begin
  WaitAMomentFree;

  sLOG_File  := ExtractFilePath(Application.ExeName) + '_logError\' + FormatDateTime('yyyy-mm-dd.hhmmss".log"', Now);
  sLOG_Error := TStringList.Create;
  try
    sLOG_Error.BeginUpdate;
    sLOG_Error.Add('Cliente   : ' + gLicencaSistema.Empresa);
    sLOG_Error.Add('Aplicativo: ' + Application.Title);
    sLOG_Error.Add('Versão    : ' + gVersaoApp.Version);
    sLOG_Error.Add('-');
    sLOG_Error.Add('UnitName  : ' + Sender.UnitName);
    sLOG_Error.Add('ClassName : ' + E.ClassName);
    sLOG_Error.Add('-');
    sLOG_Error.Add('ERROR MESSAGE:');
    sLOG_Error.Add(E.Message);
    sLOG_Error.EndUpdate;

    ForceDirectories(ExtractFilePath(sLOG_File));
    sLOG_Error.SaveToFile(sLOG_File);

    aForm := CreateMessageDialog(PChar(E.Message), TMsgDlgType.mtError, [mbOK], TMsgDlgBtn.mbOK);

    aForm.Caption := '.:: Erro ::.';
    aForm.ShowModal;
    //MessageDlg(PChar(E.Message), mtError, [mbOK], 0);
  finally
    sLOG_Error.Free;
    FreeAndNil(aForm);
  end;
end;

procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
var
  ID : Largeint;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhr);
    Open;

    ID := FieldByName('ID').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('Execute procedure SET_GENERATOR(' + QuotedStr(GeneratorName) + ', null)');
    ExecSQL;

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
    if fdConexao.InTransaction then
      fdConexao.CommitRetaining;
  end;
end;

procedure ExecuteScriptSQL(sScriptSQL : String);
begin
  with DMBusiness do
  begin
    fdConexao.ExecSQL(sScriptSQL);
    CommitTransaction;
  end;
end;

procedure ExecuteScriptMetaData(aFileName : String);
var
  aScript : TStringList;
  aVersao : Currency;

  procedure GravarSriptSQL(aSistema : SmallInt; aError : WideString; aOK : Boolean);
  begin
    with DMBusiness do
    begin
      fdQryUpgrade.Close;
      fdQryUpgrade.ParamByName('sistema').AsSmallInt := aSistema;
      fdQryUpgrade.ParamByName('versao').AsCurrency  := aVersao;
      fdQryUpgrade.OpenOrExecute;

      if fdQryUpgrade.IsEmpty then
      begin
        fdQryUpgrade.Append;
        fdQryUpgrade.FieldByName('sis_cod').AsInteger      := aSistema;
        fdQryUpgrade.FieldByName('sis_version').AsCurrency := aVersao;
      end
      else
        fdQryUpgrade.Edit;

      fdQryUpgrade.FieldByName('upgrade_sql').AsWideString   := aScript.Text;
      fdQryUpgrade.FieldByName('upgrade_data').AsDateTime    := Now;
      fdQryUpgrade.FieldByName('upgrade_error').AsWideString := aError;
      fdQryUpgrade.FieldByName('upgrade_ok').AsInteger       := IfThen(aOK, 1, 0);

      fdQryUpgrade.Post;
      fdQryUpgrade.ApplyUpdates;

      CommitTransaction;
    end;
  end;
begin
  aScript := TStringList.Create;
  try
    try
      if FileExists(aFileName) then
        with DMBusiness, fdScript do
        begin
          aScript.LoadFromFile(aFileName);
          aVersao := StrToCurr(OnlyNumber(ExtractFileName(aFileName)));

          SQLScriptFileName := aFileName;
          ValidateAll;
          ExecuteAll;
          CommitTransaction;

          GravarSriptSQL(gSistema.Codigo, EmptyStr, True);
          //RenameFile(aFileName, ChangeFileExt(aFileName, '.upgraded'));

          // Gravar registro referente ao PDV, caso ele essteja em uso...
          if UsoSistema(SISTEMA_PDV) then
            GravarSriptSQL(SISTEMA_PDV, EmptyStr, True);
        end;
    except
      On E : Exception do
        GravarSriptSQL(gSistema.Codigo, E.Message, False);
    end;
  finally
    if FileExists(aFileName) then
      DeleteFiles(aFileName, False);

    aScript.Free;
  end;
end;

procedure GetDataSet(const FDataSet : TClientDataSet; const sNomeTabela, sQuando, sOrdernarPor : String);
var
  qry : TFDQuery;
  dsp : TDataSetProvider;
  cds : TClientDataSet;
begin
  qry := TFDQuery.Create(nil);
  dsp := TDataSetProvider.Create(nil);
  cds := TClientDataSet.Create(nil);
  try
    qry.Connection  := DMBusiness.fdConexao;
    qry.Transaction := DMBusiness.fdTransacao;

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

procedure ExportarFR3_ToXLSX(const FrrLayout: TfrxReport; var sFileName : String);
begin
  KillTask('EXCEL.EXE');

  with DMBusiness, FrrLayout, PrintOptions do
  begin
    if FileExists(sFileName) then
      DeleteFile(sFileName);

    ForceDirectories( ExtractFilePath(sFileName) );
    PrepareReport;
    frxXLSX.FileName := sFileName;
    frxXLSX.Report   := FrrLayout;

    Export(frxXLSX);

    sFileName := frxXLSX.FileName;
  end;
end;

procedure GerarSaldoContaCorrente(const pContaCorrente : Integer; const pData : TDateTime);
begin
  try

    try

      with DMBusiness, stpContaCorrenteSaldo do
      begin
        ParamByName('CONTA_CORRENTE').AsInteger := pContaCorrente;
        ParamByName('DATA_MOVIMENTO').AsDate    := pData;

        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        if DMBusiness.fdConexao.InTransaction then
          DMBusiness.fdConexao.RollbackRetaining;

        ShowError('Erro ao tentar atualizar saldo diário de conta corrente.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure GerarSaldoContaCorrente_v2(const pContaCorrente : Integer; const pDataInicial, pDataFinal : TDateTime);
begin
  try

    try

      with DMBusiness, stpContaCorrenteSaldo_v2 do
      begin
        ParamByName('CONTA_CORRENTE').AsInteger := pContaCorrente;
        ParamByName('DATA_INICIAL').AsDate      := pDataInicial;
        ParamByName('DATA_FINAL').AsDate        := pDataFinal;

        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        if DMBusiness.fdConexao.InTransaction then
          DMBusiness.fdConexao.RollbackRetaining;

        ShowError('Erro ao tentar atualizar saldo no período da conta corrente.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

//procedure BloquearClientes;
//begin
//  with DMBusiness, fdQryBusca do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Update TBCLIENTE Set');
//    SQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
//    SQL.Add('  , Bloqueado = 1');
//    SQL.Add('  , Bloqueado_automatico = 1');
//    SQL.Add('  , Bloqueado_data = Current_date');
//    SQL.Add('  , Bloqueado_usuario = user');
//    SQL.Add('  , Usuario = user');
//    SQL.Add('  , Desbloqueado_data = null');
//    SQL.Add('  , Bloqueado_motivo = ' + QuotedStr(CLIENTE_BLOQUEADO_PORDEBITO));
//    SQL.Add('where Bloqueado = 0');
//    SQL.Add('  and ((Desbloqueado_data is null) or (Desbloqueado_data <> Current_date))');
//    SQL.Add('  and Codigo in (');
//    SQL.Add('    Select Distinct');
//    SQL.Add('      r.Cliente');
//    SQL.Add('    from TBCONTREC r');
//    SQL.Add('    where r.Parcela  > 0'); // Parcelas a prazo
//    SQL.Add('      and r.Situacao = 1'); // Situação ativa
//    SQL.Add('      and r.Baixado  = 0'); // Títulos não baixados (em aberto)
//    SQL.Add('      and r.Cliente  <> ' + IntToStr(CONSUMIDOR_FINAL_CODIGO));
//    // O cliente encontra-se bloqueado por haver títulos em atraso.
//    SQL.Add('      and r.Dtvenc < Current_date');
//    SQL.Add('  )');
//    ExecSQL;
//
//    CommitTransaction;
//  end;
//end;
//
//procedure DesbloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
//begin
//  with DMBusiness, fdQryBusca do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Update TBCLIENTE Set');
//    SQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
//    SQL.Add('  , Desbloqueado_data = Current_date');
//    SQL.Add('  , Bloqueado = 0');
//    SQL.Add('  , Bloqueado_automatico = 0');
//    SQL.Add('  , Bloqueado_data = Null');
//    SQL.Add('  , Bloqueado_usuario = Null');
//    SQL.Add('  , Usuario = ' + QuotedStr(gUsuarioLogado.Login));
//
//    if Trim(Motivo) = EmptyStr then
//      SQL.Add('  , Bloqueado_motivo = Null')
//    else
//      SQL.Add('  , Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));
//
//    SQL.Add('where Codigo = ' + IntToStr(iCodigoCliente));
//    ExecSQL;
//
//    CommitTransaction;
//  end;
//end;
//
//procedure BloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
//begin
//  with DMBusiness, fdQryBusca do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Update TBCLIENTE Set');
//    SQL.Add('    Dtcad = coalesce(Dtcad, Current_date)');
//    SQL.Add('  , Desbloqueado_data = Null');
//    SQL.Add('  , Bloqueado = 1');
//    SQL.Add('  , Bloqueado_automatico = 0');
//    SQL.Add('  , Bloqueado_data = Current_date');
//    SQL.Add('  , Bloqueado_usuario = ' + QuotedStr(gUsuarioLogado.Login));
//    SQL.Add('  , Usuario = ' + QuotedStr(gUsuarioLogado.Login));
//
//    if Trim(Motivo) = EmptyStr then
//      SQL.Add('  , Bloqueado_motivo = Null')
//    else
//      SQL.Add('  , Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));
//
//    SQL.Add('where Codigo = ' + IntToStr(iCodigoCliente));
//    ExecSQL;
//
//    CommitTransaction;
//  end;
//end;

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

procedure CriarGenerator(const aName : String; const aAno : Smallint);
var
  sAno : String;
begin
  if (aAno > 0) then
    sAno := QuotedStr( IntToStr(aAno) )
  else
    sAno := 'NULL';


  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Execute Procedure SET_GENERATOR(' + QuotedStr(aName) + ',' + sAno + ')' );
    ExecSQL;

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
      SQL.Add('    e.codigo');
      SQL.Add('  , coalesce(nullif(trim(e.nmfant), ''''), e.rzsoc) as fantasia ');
      SQL.Add('from TBEMPRESA e');
      SQL.Add('where e.cnpj = ' + QuotedStr(StrOnlyNumbers(gLicencaSistema.CNPJ)));
      Open;

      bRegistrada := (FieldByName('codigo').AsInteger = 1);

      if bRegistrada then
        gLicencaSistema.Model.NomeFantasia( FieldByName('fantasia').AsString );

      Close;

      SQL.Clear;

      if not bRegistrada then
      begin
        SQL.Add('Insert Into TBEMPRESA (');
        SQL.Add('    codigo');
        SQL.Add('  , cnpj');
        SQL.Add('  , pessoa_fisica');
        SQL.Add('  , rzsoc');
        SQL.Add('  , nmfant');
        SQL.Add('  , segmento');
        SQL.Add(') values (');
        SQL.Add('    1');
        SQL.Add('  , ' + QuotedStr(StrOnlyNumbers(gLicencaSistema.CNPJ)));
        SQL.Add('  , 0');
        SQL.Add('  , ' + QuotedStr(gLicencaSistema.Empresa));
        SQL.Add('  , ' + QuotedStr(gLicencaSistema.NomeFantasia));
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

procedure RegistrarEstacaoDefault;
var
  aHost : String;
begin
  try
    with DMBusiness do
    begin
      aHost := GetHostNameLocal;

      cdsRegistro.Open;
      if not cdsRegistro.Locate('EST_NOME', aHost, []) then
      begin
        cdsRegistro.Append;
        cdsRegistroEST_LOCAL.AsString    := 'Default';
        cdsRegistroEST_NOME.AsString     := aHost;
        cdsRegistroEST_IP.AsString       := DMBusiness.IdIPWatch.LocalIP;
        cdsRegistroEST_REGISTRO.AsString := StrCrypt(SYS_SYSDBA_LOGIN + SYS_SYSDBA_PWD, SYS_PASSWD_KEY);
        cdsRegistroEST_ULTIMO_ACESSO.AsDateTime := Now;

        cdsRegistro.Post;
        cdsRegistro.ApplyUpdates;
        CommitTransaction;
      end;
      cdsRegistro.Close;
    end;
  except
    On E : Exception do
      ShowError('Erro ao tentar registrar estação inicial de trabalho.' + #13#13 + E.Message);
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
    SQL.Add('  , caixa_pdv = ' + IfThenStr(IsPDV, '1', '0'));
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
    // SP_UPD_CUSTO_APROP_ENTRADA
    with DMBusiness, spAtualizarCustoApEntrada do
    begin
      ParamByName('ano').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 2. Atualização do Custo das Apropriações de Estoque por Autorizações
    // SP_UPD_CUSTO_APROP_AUTORIZ
    with DMBusiness, spAtualizarCustoApAutorizacao do
    begin
      ParamByName('ano').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 3. Atualização do Custo do Estoque de Almoxarifado
    // SP_UPD_CUSTO_ESTOQUE_APROP
    with DMBusiness, spAtualizarCustoEstoqueAlmoxarifado do
    begin
      ParamByName('ano').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 4. Atualização do Custo das Requisições ao Almoxarifado
    // SP_UPD_CUSTO_ESTOQUE_REQUI
    with DMBusiness, spAtualizarCustoEstoqueRequisicao do
    begin
      ParamByName('ano_movimento').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 5. Atualização do Custo dos Inventários
    // SP_UPD_CUSTO_INVENTARIO_ALMOX
    with DMBusiness, spAtualizarCustoEstoqueInventario do
    begin
      ParamByName('ano_movimento').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtulizarCustoEstoqueGeral;
begin
  // Atualização Geral de custo dos produtos em estoque e suas movimentações
  // SP_UPD_CUSTO_GERAL_ESTOQUE
  Screen.Cursor := crSQLWait;
  try
    DMBusiness.spAtualizarCustoEstoqueGeral.ExecProc;
    CommitTransaction;
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
      ParamByName('ano').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;

    // 2. Atualização do Custo das Apropriações de Estoque por Autorizações
    with DMBusiness, spAtualizarCustoApAutorizacao do
    begin
      ParamByName('ano').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
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
      ParamByName('ano').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
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
      ParamByName('ano_movimento').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
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
      ParamByName('ano_movimento').AsSmallInt := StrToInt(FormatDateTime('YYYY', aData));
      ExecProc;
      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtualizarSaldoContasAPagar(const aEmpresa : String);
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
      SQL.Add('  declare variable emp DMN_CNPJ;');
      SQL.Add('  declare variable ano Smallint;');
      SQL.Add('  declare variable num Integer;');
      SQL.Add('  declare variable valor_apagar numeric(15,2);');
      SQL.Add('  declare variable valor_pago   numeric(15,2);');
      SQL.Add('  declare variable valor_saldo  numeric(15,2);');
      SQL.Add('begin');
      SQL.Add('  emp = ' + QuotedStr(aEmpresa) + ';');
      SQL.Add('');
      SQL.Add('  for');
      SQL.Add('    Select');
      SQL.Add('        c.anolanc');
      SQL.Add('      , c.numlanc');
      SQL.Add('      , c.valorpag');
      SQL.Add('      , b.valor_pago');
      SQL.Add('    from TBCONTPAG c');
      SQL.Add('      left join (');
      SQL.Add('        Select       ');
      SQL.Add('            x.anolanc');
      SQL.Add('          , x.numlanc');
      SQL.Add('          , sum(y.valor_baixa)  as valor_pago');
      SQL.Add('        from TBCONTPAG x');
      SQL.Add('          inner join TBCONTPAG_BAIXA y on (y.anolanc = x.anolanc and y.numlanc = x.numlanc)');
      SQL.Add('        where (x.empresa = :emp)');
      SQL.Add('          and (x.quitado = 0)');
      SQL.Add('        group by');
      SQL.Add('            x.anolanc');
      SQL.Add('          , x.numlanc');
      SQL.Add('      ) b on (b.anolanc = c.anolanc and b.numlanc = c.numlanc)');
      SQL.Add('    ');
      SQL.Add('    where (coalesce(c.valorpag, 0.0) - coalesce(b.valor_pago, 0.0)) <> coalesce(c.valorsaldo, 0.0)');
      SQL.Add('      and (c.empresa = :emp)');
      SQL.Add('      and (c.quitado = 0)');
      SQL.Add('    ');
      SQL.Add('    Into');
      SQL.Add('        ano');
      SQL.Add('      , num');
      SQL.Add('      , valor_apagar');
      SQL.Add('      , valor_pago');
      SQL.Add('  do');
      SQL.Add('  begin');
      SQL.Add('    valor_saldo = coalesce(:valor_apagar, 0.0) - coalesce(:valor_pago, 0.0);');
      SQL.Add('    if (:valor_saldo > 0.0) then');
      SQL.Add('    begin');
      SQL.Add('      Update TBCONTPAG c Set');
      SQL.Add('          c.valorpagtot = :valor_pago');
      SQL.Add('        , c.valorsaldo  = :valor_saldo');
      SQL.Add('      where (c.anolanc  = :ano)');
      SQL.Add('        and (c.numlanc  = :num);');
      SQL.Add('    end');
      SQL.Add('  end');
      SQL.Add('end');
      ExecSQL;

      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure SetAtualizarSaldoContasAReceber(const aEmpresa : String);
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
      SQL.Add('  declare variable emp DMN_CNPJ;');
      SQL.Add('  declare variable ano Smallint;');
      SQL.Add('  declare variable num Integer;');
      SQL.Add('  declare variable valor_areceber numeric(15,2);');
      SQL.Add('  declare variable valor_recebido numeric(15,2);');
      SQL.Add('  declare variable valor_saldo    numeric(15,2);');
      SQL.Add('begin');
      SQL.Add('  emp = ' + QuotedStr(aEmpresa) + ';');
      SQL.Add('');
      SQL.Add('  for');
      SQL.Add('    Select');
      SQL.Add('        c.anolanc');
      SQL.Add('      , c.numlanc');
      SQL.Add('      , c.valorrec');
      SQL.Add('      , b.valor_recebido');
      SQL.Add('    from TBCONTREC c');
      SQL.Add('      left join (');
      SQL.Add('        Select');
      SQL.Add('            x.anolanc');
      SQL.Add('          , x.numlanc');
      SQL.Add('          , sum(y.valor_baixa)  as valor_recebido');
      SQL.Add('        from TBCONTREC x');
      SQL.Add('          inner join TBCONTREC_BAIXA y on (y.anolanc = x.anolanc and y.numlanc = x.numlanc)');
      SQL.Add('        where (x.empresa = :emp)');
      SQL.Add('          and (x.baixado = 0)');
      SQL.Add('        group by');
      SQL.Add('            x.anolanc');
      SQL.Add('          , x.numlanc');
      SQL.Add('      ) b on (b.anolanc = c.anolanc and b.numlanc = c.numlanc)');
      SQL.Add('    ');
      SQL.Add('    where (coalesce(c.valorrec, 0.0) - coalesce(b.valor_recebido, 0.0)) <> coalesce(c.valorsaldo, 0.0)');
      SQL.Add('      and (c.empresa = :emp)');
      SQL.Add('      and (c.baixado = 0)');
      SQL.Add('    ');
      SQL.Add('    Into');
      SQL.Add('        ano');
      SQL.Add('      , num');
      SQL.Add('      , valor_areceber');
      SQL.Add('      , valor_recebido');
      SQL.Add('  do');
      SQL.Add('  begin');
      SQL.Add('    valor_saldo = coalesce(:valor_areceber, 0.0) - coalesce(:valor_recebido, 0.0);');
      SQL.Add('    if (:valor_saldo > 0.0) then');
      SQL.Add('    begin');
      SQL.Add('      Update TBCONTREC c Set');
      SQL.Add('          c.valorrectot = :valor_recebido');
      SQL.Add('        , c.valorsaldo  = :valor_saldo');
      SQL.Add('      where (c.anolanc  = :ano)');
      SQL.Add('        and (c.numlanc  = :num);');
      SQL.Add('    end');
      SQL.Add('  end');
      SQL.Add('end');
      ExecSQL;

      CommitTransaction;
    end;
  finally
    Screen.Cursor := crDefault;
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
  // Verifica se o programa rodou a partir do IDE do Delphi:
  Result := DebugHook <> 0;
end;

function GetDirectoryTempApp : String;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'Temp\';

  if not DirectoryExists(Result) then
    ForceDirectories(Result);
end;

function ShowConfirm(sMsg : String; const sTitle : String = ''; const DefaultButton : Integer = MB_DEFBUTTON2) : Boolean;
var
  aForm : TForm;
begin
  aForm := CreateMessageDialog(PChar(sMsg), mtConfirmation, [mbYes, mbNo], TMsgDlgBtn.mbNo);
  try
    aForm.Caption := IfThenStr(sTitle.Trim.IsEmpty, 'Confirmar', sTitle);

    (aForm.FindComponent('Yes') as TButton).Caption  := '&Sim';
    (aForm.FindComponent('No')  as TButton).Caption  := '&Não';

    Result := ( aForm.ShowModal = ID_YES );
  finally
    FreeAndNil(aForm);
  end;
//  Result := ( MessageDlg(PChar(sMsg), mtConfirmation, [mbYes, mbNo], 0, mbNo) = ID_YES );
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

function GetCfopRemessa(const iCfop : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_remessa from TBCFOP where cfop_cod = ' + IntToStr(iCfop));
    Open;

    Result := (FieldByName('cfop_remessa').AsInteger = 1);

    Close;
  end;
end;

function GetCfopFaturarRemessa(const iCfop : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_faturar_remessa from TBCFOP where cfop_cod = ' + IntToStr(iCfop));
    Open;

    Result := (FieldByName('cfop_faturar_remessa').AsInteger = 1);

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

function GetCfopMovimentaEstoque(const iCfop : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_altera_estoque_produto from TBCFOP where cfop_cod = ' + IntToStr(iCfop));
    Open;

    Result := (FieldByName('cfop_altera_estoque_produto').AsInteger = 1);

    Close;
  end;
end;

function GetCfopTipo(const aCfop : Integer) : TTipoCFOP;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_tipo from TBCFOP where cfop_cod = ' + IntToStr(aCfop));
    Open;

    Result := TTipoCFOP(FieldByName('cfop_tipo').AsInteger);

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

function GetExisteNumeroNFe(const aCNPJEmpresa, aSerie : String; const aNumero : Largeint; const aModelo : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    nf.numero ');
    SQL.Add('  , nf.chave  ');
    SQL.Add('from TBNFE_ENVIADA nf');
    SQL.Add('where (nf.empresa = ' + QuotedStr(aCNPJEmpresa) + ')');
    SQL.Add('  and (nf.serie   = ' + QuotedStr(aSerie) + ')');
    SQL.Add('  and (nf.numero  = ' + FormatFloat('#############', aNumero) + ')');
    SQL.Add('  and (nf.modelo  = ' + FormatFloat('#############', aModelo) + ')');
    Open;

    Result := (FieldByName('numero').AsLargeInt > 0);

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

function StrFormatarNome(aNome : String): String;
const
  excecao: array[0..5] of string = (' da ', ' de ', ' do ', ' das ', ' dos ', ' e ');
var
  tamanho,
  j : Integer;
  i : Byte;
begin
  Result  := AnsiLowerCase(aNome);
  tamanho := Length(Result);

  for j := 1 to tamanho do
    // Se é a primeira letra ou se o caracter anterior é um espaço
    if (j = 1) or ((j > 1) and (Result[j - 1] = Chr(32))) then
      Result[j] := AnsiUpperCase(Result[j])[1];

  for i := 0 to Length(excecao) - 1 do
    Result := StringReplace(Result, excecao[i], excecao[i], [rfReplaceAll, rfIgnoreCase]);
end;

function StrDescricaoProduto(const NoPlural : Boolean = TRUE) : String;
var
  S : String;
begin
  try
    S := 'Produto' + IfThenStr(NoPlural, 's', EmptyStr);

    if (gSistema.Codigo <> SISTEMA_GESTAO_OPME) then
    begin
      Case GetSegmentoID(gUsuarioLogado.Empresa)  of
        SEGMENTO_MERCADO_CARRO_ID:
          S := 'Veículo' + IfThenStr(NoPlural, 's', EmptyStr);
        else
          s := IfThenStr(NoPlural, 'Produtos / Serviços', 'Produto / Serviço');
      end;
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
    S := 'Produto' + IfThenStr(NoPlural, 's', EmptyStr);

    Case GetSegmentoID(gUsuarioLogado.Empresa)  of
      SEGMENTO_MERCADO_CARRO_ID:
        S := 'Veículo' + IfThenStr(NoPlural, 's', EmptyStr);
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


      ACBrValidador.TipoDocto   := TACBrValTipoDocto.docInscEst;
      ACBrValidador.Documento   := sDocumento;
      ACBrValidador.Complemento := sComplemento;

      Result := ACBrValidador.Validar;

      if not Result then
         sMensErro := Trim(ACBrValidador.MsgErro);
    end;
end;

Function StrIsGTIN(aValue : String; out aError : String) : Boolean;
var
  aNumero : String;
begin
  Result := False;

  with DMBusiness do
  begin
    aNumero := OnlyNumber(aValue.Trim);

    ACBrValidador.TipoDocto := TACBrValTipoDocto.docGTIN;
    ACBrValidador.Documento := aNumero;

    Result := ACBrValidador.Validar;

    if not Result then
       aError := Trim(ACBrValidador.MsgErro);
  end;
end;

Function StrIsEmail(aValue : String; out aError : String) : Boolean;
begin
  with DMBusiness do
  begin
    ACBrValidador.TipoDocto := TACBrValTipoDocto.docEmail;
    ACBrValidador.Documento := aValue.Trim;

    Result := ACBrValidador.Validar;

    if not Result then
       aError := Trim(ACBrValidador.MsgErro);
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

function GetNumeroNFe(const aEmissorCNPJ : String; const aSerie, aModelo : Integer) : Largeint;
var
  aNumero   : Largeint;
  aControle : Integer;
begin
  aNumero   := 0;
  aControle := 0;
  try
    aNumero := GetNextID('TBCONFIGURACAO', 'NFE_NUMERO', 'where EMPRESA = ' + QuotedStr(aEmissorCNPJ));
    while GetExisteNumeroNFe(aEmissorCNPJ, FormatFloat('00', aSerie), aNumero, MODELO_NFE) and (aControle < 10) do
    begin
      aNumero := (aNumero + 1);
      Inc(aControle);
    end;
  finally
    Result := aNumero;
  end;
end;

function GetNumeroNFCe(const aEmissorCNPJ : String; const aSerie, aModelo : Integer) : Largeint;
var
  aNumero   : Largeint;
  aControle : Integer;
begin
  aNumero   := 0;
  aControle := 0;
  try
    aNumero := GetNextID('TBCONFIGURACAO', 'NFCE_NUMERO', 'where EMPRESA = ' + QuotedStr(aEmissorCNPJ));
    while GetExisteNumeroNFe(aEmissorCNPJ, FormatFloat('00', aSerie), aNumero, aModelo) and (aControle < 10) do
    begin
      aNumero := (aNumero + 1);
      Inc(aControle);
    end;
  finally
    Result := aNumero;
  end;
end;

function GetNumeroNSU(const aEmpresa : String) : Largeint;
var
  aNumero : Largeint;
begin
  aNumero := 0;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    min(substring(nsu from 2 for 14)) as nsu_min');
      SQL.Add('from TBNFE_IMPORTADA');
      SQL.Add('where (empresa = ' + QuotedStr(aEmpresa) + ')');
      Open;

      aNumero := StrToInt64Def(FieldByName('nsu_min').AsString, 2) - 1;

      if (aNumero = 0) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('    max(substring(nsu from 2 for 14)) as nsu_max');
        SQL.Add('from TBNFE_IMPORTADA');
        SQL.Add('where (empresa = ' + QuotedStr(aEmpresa) + ')');
        Open;

        aNumero := StrToInt64Def(FieldByName('nsu_max').AsString, 0) + 1;
      end;

      Close;
    end;
  finally
    Result := aNumero;
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
    SQL.Add('Select cid_cod from TBCIDADE where ' + StrOnlyNumbers(sCEP) + ' between cid_cep_inicial and cid_cep_final');
    Open;

    Result := FieldByName('cid_cod').AsInteger;

    Close;
  end;
end;

function GetCidadeID(const aIBGE : Currency) : Integer; overload;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_cod from TBCIDADE where cid_ibge = ' + CurrToStr(aIBGE));
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
      IfThenStr(Trim(FieldByName('complemento').AsString) = EmptyStr, '', ' (' + Trim(FieldByName('complemento').AsString) + ')') + ', ' +
      'BAIRRO: ' + Trim(FieldByName('bairro').AsString) + ' - ' + Trim(FieldByName('cidade').AsString) + ' ' +
      'CEP: ' + StrFormatarCEP(Trim(FieldByName('cep').AsString));

    Close;
  end;
end;

function GetEmpresaCidade(const sCNPJEmitente : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    c.cid_nome as cidade');
    SQL.Add('  , e.uf');
    SQL.Add('from TBEMPRESA e');
    SQL.Add('  left join TBCIDADE c on (c.cid_cod = e.cid_cod)');

    if Trim(sCNPJEmitente) = EmptyStr then
      SQL.Add('where e.cnpj = ' + QuotedStr(GetEmpresaIDDefault))
    else
      SQL.Add('where e.cnpj = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := Trim(FieldByName('cidade').AsString);

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
      IfThenStr(Trim(FieldByName('complemento').AsString) = EmptyStr, '', ' (' + Trim(FieldByName('complemento').AsString) + ')') +
      IfThenStr(aQuebrarLinha, #13, ', ') +
      'BAIRRO: ' + Trim(FieldByName('bairro').AsString) + ' - ' + Trim(FieldByName('cidade').AsString) +
      IfThenStr(aQuebrarLinha, #13, ' ') +
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

function GetProdutoFornecedorCodigo(const aCnpj, aProduto : String) : String;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;

    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  cd_produto ');
    SQL.Add('from TBFORNECEDOR_PRODUTO');
    SQL.Add('where (fornecedor_cnpj    = :cnpj)');
    SQL.Add('  and (fornecedor_produto = :produto)');

    ParamByName('cnpj').AsString    := aCnpj.Trim;
    ParamByName('produto').AsString := aProduto.Trim;

    Open;

    Result := FieldByName('cd_produto').AsString;

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
    SQL.Add('  b.bco_codigo');
    SQL.Add('from TBBANCO_BOLETO b');
    SQL.Add('where b.empresa = ' + QuotedStr(aEmpresa));
    SQL.Add('  and b.bco_cod = ' + IntToStr(StrToIntDef(aCodigoFebraban, 0)));
    Open;

    Result := FieldByName('bco_codigo').AsInteger;

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

function GetDateFirtsMonth : TDateTime;
begin
  Result := EncodeDate(YearOf(Date), MonthOf(Date), 1);
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

function GetUserApp(const aLogin : String = '') : String;
begin
//  with DMBusiness, fdQryUsers do
//    if fdQryUsers.Locate('NOME', aLogin, []) then
//      Result := AnsiUpperCase( Trim(fdQryUsers.FieldByName('NOME').AsString) )
//    else
//      Result := gUsuarioLogado.Login;
  Result := gUsuarioLogado.Login;
end;

function GetUserFullName : String;
begin
//  with DMBusiness, fdQryUsers do
//    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
//      Result := AnsiUpperCase( Trim(fdQryUsers.FieldByName('NOMECOMPLETO').AsString) )
//    else
//      Result := EmptyStr;
  Result := gUsuarioLogado.Nome;
end;

function GetUserFunctionID : Integer;
begin
//  with DMBusiness, fdQryUsers do
//    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
//      Result := fdQryUsers.FieldByName('CODFUNCAO').AsInteger
//    else
//      Result := 0;
  Result := gUsuarioLogado.Funcao;
end;

function GetUserCodigoVendedorID : Integer;
begin
//  with DMBusiness, fdQryUsers do
//    if fdQryUsers.Locate('NOME', gUsuarioLogado.Login, []) then
//      Result := fdQryUsers.FieldByName('VENDEDOR').AsInteger
//    else
//      Result := 0;
  Result := gUsuarioLogado.Vendedor;
end;

function GetUserUpdatePassWord : Boolean;
begin
  if Trim(gUsuarioLogado.Login) = EmptyStr then
    Result := False
  else
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
      Result := (fdQryUsers.FieldByName('ALTERAR_SENHA').AsInteger = 1)
    else
      Result := False;
end;

function GetLimiteDescontoUser : Currency;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
      Result := fdQryUsers.FieldByName('LIMIDESC').AsCurrency
    else
      Result := 0.0;
end;

function GetUserPermitirAlterarValorVenda : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
      Result := (fdQryUsers.FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1)
    else
      Result := False;
end;

function GetUserPermitirAlterarValorVendaLivre : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
      Result := (fdQryUsers.FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger = 1)
    else
      Result := False;
end;

function GetUserPermitirAlterarValorVendaParaMaior : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
      Result := (fdQryUsers.FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger in [1, 2])
    else
      Result := False;
end;

function GetUserPermitirAlterarValorVendaParaMenor : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
      Result := (fdQryUsers.FieldByName('TIPO_ALTERAR_VALOR_VENDA').AsInteger in [1, 3])
    else
      Result := False;
end;

function GetUserManifestoAutomatico : Boolean;
begin
  with DMBusiness, fdQryUsers do
    if fdQryUsers.Locate('NOME', AnsiUpperCase(gUsuarioLogado.Login), []) then
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

function GetImprimirCodigoReferenciaProdutoNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_imprimir_cod_referencia from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_imprimir_cod_referencia').AsInteger = 1);

    Close;
  end;
end;

function GetImprimirCodigoExternoProdutoNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nfe_imprimir_cod_referencia from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmitente));
    Open;

    Result := (FieldByName('nfe_imprimir_cod_referencia').AsInteger = 1);

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

function GetAliquotaICMS(const aUFOrigem, aUFDestino : String) : Currency;
var
  aReturn : Currency;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  x.aliquota');
      SQL.Add('from SYS_ALIQUOTA_ICMS x');
      SQL.Add('where (x.uf_origem  = ' +  QuotedStr(aUFOrigem)  + ')');
      SQL.Add('  and (x.uf_destino = ' +  QuotedStr(aUFDestino) + ')');
      Open;

      aReturn := FieldByName('aliquota').AsCurrency;

      Close;
    end;

  finally
    Result := aReturn;
  end;
end;

function GetAliquotaFCP(const aUF : String) : Currency;
var
  aReturn : Currency;
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  x.aliquota_fcp ');
      SQL.Add('from TBESTADO x');
      SQL.Add('where (x.est_sigla  = ' +  QuotedStr(aUF)  + ')');
      Open;

      aReturn := FieldByName('aliquota_fcp').AsCurrency;

      Close;
    end;

  finally
    Result := aReturn;
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

function SetMovimentoCaixa(const Usuario : String; const pData : TDateTime; const FormaPagto : Smallint;
  const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
var
  Return : Boolean;
begin
  try

    Return := False;

    try

      UpdateSequence('GEN_CX_MOVIMENTO_' + IntToStr(YearOf(pData)), 'TBCAIXA_MOVIMENTO', 'NUMERO', 'where ANO = ' + IntToStr(YearOf(pData)));

      if ( TipoMov = tmcxCredito ) then
        with DMBusiness, stpCaixaMovimentoREC do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').Value       := pData;
          ParamByName('FORMA_PAGTO').AsSmallInt := FormaPagto;
          ParamByName('ANOLANC').AsSmallInt     := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsSmallInt         := SeqPagto;
          ParamByName('VALOR_BAIXA').Value      := Valor;

          ExecProc;
          CommitTransaction;
        end
      else
      if ( TipoMov = tmcxDebito ) then
        with DMBusiness, stpCaixaMovimentoPAG do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').Value       := pData;
          ParamByName('FORMA_PAGTO').AsSmallInt := FormaPagto;
          ParamByName('ANOLANC').AsSmallInt     := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsSmallInt         := SeqPagto;
          ParamByName('VALOR_BAIXA').Value      := Valor;

          ExecProc;
          CommitTransaction;
        end;

      Return := True;

    except
      On E : Exception do
      begin
        if DMBusiness.fdConexao.InTransaction then
          DMBusiness.fdConexao.RollbackRetaining;

        ShowError('Erro ao tentar registrar o pagamento no movimento de caixa.' + #13#13 + E.Message);
      end;
    end;

  finally
    Result := Return;
  end;
end;

function SetMovimentoCaixaEstorno(const Usuario : String; const pData : TDateTime; const FormaPagto : Smallint;
  const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
var
  Return : Boolean;
begin
  try

    Return := False;

    try

      UpdateSequence('GEN_CX_MOVIMENTO_' + IntToStr(YearOf(pData)), 'TBCAIXA_MOVIMENTO', 'NUMERO', 'where ANO = ' + IntToStr(YearOf(pData)));

      if ( TipoMov = tmcxCredito ) then
        with DMBusiness, stpCaixaMovimentoREC_ESTORNO do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').Value       := pData;
          ParamByName('FORMA_PAGTO').AsSmallInt := FormaPagto;
          ParamByName('ANOLANC').AsSmallInt     := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsSmallInt         := SeqPagto;
          ParamByName('VALOR_BAIXA').Value      := Valor;

          ExecProc;
          CommitTransaction;
        end
      else
      if ( TipoMov = tmcxDebito ) then
        with DMBusiness, stpCaixaMovimentoPAG_ESTORNO do
        begin
          ParamByName('USUARIO').AsString       := Usuario;
          ParamByName('DATA_PAGTO').Value       := pData;
          ParamByName('FORMA_PAGTO').AsSmallInt := FormaPagto;
          ParamByName('ANOLANC').AsSmallInt     := AnoLancamento;
          ParamByName('NUMLANC').AsInteger      := NumLancamento;
          ParamByName('SEQ').AsSmallInt         := SeqPagto;
          ParamByName('VALOR_BAIXA').Value      := Valor;

          ExecProc;
          CommitTransaction;
        end;

      Return := True;

    except
      On E : Exception do
      begin
        if DMBusiness.fdConexao.InTransaction then
          DMBusiness.fdConexao.RollbackRetaining;

        ShowError('Erro ao tentar registrar o estorno de movimento no caixa.' + #13#13 + E.Message);
      end;
    end;

  finally
    Result := Return;
  end;
end;

procedure TDMBusiness.CarregarLicenca(const sNomeArquivo: String);
//var
//  Arquivo : TStringList;
//  ini : TIniFile;
//  I   : Integer;
//  aUUID : String;
begin
//  if FileExists(sNomeArquivo) then
//  begin
//
//    Arquivo := TStringList.Create;
//    Arquivo.LoadFromFile(sNomeArquivo);
//
//    for I := 0 to Arquivo.Count - 1 do
//    begin
//      cdsLicenca.Append;
//      cdsLicencaLINHA_CONTROLE.AsString := Arquivo.Strings[I];
//      cdsLicenca.Post;
//    end;
//
//    cdsLicenca.ApplyUpdates;
//    CommitTransaction;
//
//    Arquivo.Free;
//
//  end;
//
//  cdsLicenca.Close;
//  cdsLicenca.Open;
//
//  Arquivo := TStringList.Create;
  try
//    cdsLicenca.First;
//    while not cdsLicenca.Eof do
//    begin
//      Arquivo.Add( cdsLicencaLINHA_CONTROLE.AsString );
//      cdsLicenca.Next;
//    end;
//
//    for I := 0 to Arquivo.Count - 1 do
//      Arquivo.Strings[I] := DecriptarSenha_Master(Arquivo.Strings[I], SYS_PASSWD_KEY);
//
//    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
//
//    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');
//    aUUID := ini.ReadString('Licenca', 'edUUID', TGUID.Empty.ToString);
//
//    gLicencaSistema.Model
//      .doc( ini.ReadString('Licenca', 'doc',  '') )
//      .UUID( StringToGUID(aUUID) )
//      .Empresa( ini.ReadString('Licenca', 'edEmpresa',  '') )
//      .NomeFantasia( ini.ReadString('Licenca', 'edFantasia',  '') )
//      .CNPJ( ini.ReadString('Licenca', 'edCGC',      '') )
//      .Endereco( ini.ReadString('Licenca', 'edEndereco', '') )
//      .Numero( ini.ReadString('Licenca', 'edNumero', 'S/N') )
//      .Bairro( ini.ReadString('Licenca', 'edBairro',   '') )
//      .Cidade( ini.ReadString('Licenca', 'edCidade',   '') )
//      .UF( ini.ReadString('Licenca', 'edUF',       '') )
//      .CEP( ini.ReadString('Licenca', 'edCEP',      '') )
//      .Competencia( StrToIntDef(ini.ReadString('Licenca', 'edCompetencia', FormatDateTime('yyyymm', Date + 30)), 0) )
//      .DataBloqueio( ini.ReadDateTime('Licenca', 'edDataBloqueio', Date + 45) )
//      .UsarSGE( ini.ReadBool('Licenca', 'chkSGE', False) )
//      .UsarSGI( ini.ReadBool('Licenca', 'chkSGI', False) )
//      .UsarSGF( ini.ReadBool('Licenca', 'chkSGF', False) )
//      .UsarSGO( ini.ReadBool('Licenca', 'chkSGO', False) );
    gLicencaSistema.Carregar(sNomeArquivo);

    SetSegmento(SEGMENTO_PADRAO_ID,          SEGMENTO_PADRAO_DS);
    SetSegmento(SEGMENTO_VAREJO_ATACADO_ID,  SEGMENTO_VAREJO_ATACADO_DS);
    SetSegmento(SEGMENTO_MERCADO_CARRO_ID,   SEGMENTO_MERCADO_CARRO_DS);
    SetSegmento(SEGMENTO_SERVICOS_ID,        SEGMENTO_SERVICOS_DS);
    SetSegmento(SEGMENTO_VAREJO_SERVICOS_ID, SEGMENTO_VAREJO_SERVICOS_DS);
    SetSegmento(SEGMENTO_VAREJO_DELIVERY_ID, SEGMENTO_VAREJO_DELIVERY_DS);
    SetSegmento(SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_METAL_DS);
    SetSegmento(SEGMENTO_INDUSTRIA_GERAL_ID, SEGMENTO_INDUSTRIA_GERAL_DS);

    RegistrarEmpresa;
    RegistrarEstacaoDefault;
    GerarCompetencias( StrToInt(Copy(IntToStr(gLicencaSistema.Competencia), 1, 4)) );
  finally
//    ini.Free;
//    Arquivo.Free;
//
//    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
//
    FileINI.WriteString(INI_SECAO_DEFAULT, INI_KEY_FILELICENSE, sNomeArquivo);
    FileINI.UpdateFile;
  end;
end;

procedure TDMBusiness.DataModuleCreate(Sender: TObject);
var
  I ,
  X : Integer;
  sServidor ,
  sPorta    ,
  sBase     ,
  aProcesso : String;
begin
(*
-- EXTRAIR METADATA DA BASE FIREBIRD:
C:\Program Files (x86)\Firebird\Firebird_2_5\bin>isql -extract -o d:\agil.sql AGIL_COMERCIO -u sysdba -p masterkey

-- EXECUTAR SCRIPT NA BASE:
isql.exe C:\Aplicativo\Banco.fdb -m -b -i C:\Atualizacao\Script.sql -q -u SYSDBA -p masterkey
*)
  fdConexao.Connected := False;

  IdIPWatch.HistoryFilename := FILE_HISTORY_NET;
  IdIPWatch.HistoryEnabled  := True;
  IdIPWatch.Active          := True;

  if gVersaoApp.InternalName.Equals('SGE') then
    gSistema.Codigo := SISTEMA_GESTAO_COM
  else
  if gVersaoApp.InternalName.Equals('SGE_PDV') then
    gSistema.Codigo := SISTEMA_PDV
  else
  if gVersaoApp.InternalName.Equals('SGI') then
    gSistema.Codigo := SISTEMA_GESTAO_IND
  else
  if gVersaoApp.InternalName.Equals('SGO') then
    gSistema.Codigo := SISTEMA_GESTAO_OPME
  else
    gSistema.Codigo := SISTEMA_GESTAO_COM;

  gSistema.Nome := Application.Title;

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

    UpgradeDataBase;
    MontarPermissao;

    gLicencaSistema.Carregar(EmptyStr);
    if gLicencaSistema.Model.IsEmpty then
    begin
      if opdLicenca.Execute then
        gLicencaSistema.Carregar(opdLicenca.FileName)
      else
      begin
        ShowWarning('Licença', 'Sistema não registrado!' + #13 + 'Favor carregar arquivo de licença');
        Application.Terminate;

        // Remover processo da memória do Windows
        aProcesso := ParamStr(0);
        aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
        KillTask(aProcesso);
      end;
    end;

    {$IFNDEF PRINTER_CUPOM}
    try
      with RegistroSistema do
      begin
        RootKey := HKEY_CURRENT_USER;
        OpenKey(SYS_PATH_REGISTER + gPersonalizaEmpresa.InternalName, True);

        WriteString(KEY_REG_VERSAO, gVersaoApp.Version);
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
    {$ENDIF}

    if ( fdConexao.Connected ) then
    begin
      fdQryUsers.Open;
      fdQryEmpresa.Open;
    end;

    {$IFDEF PRINTER_CUPOM}
    gUsuarioLogado := TFactoryController.getInstance().getUsuarioController();
    {$ENDIF}

    {$IFNDEF PRINTER_CUPOM}
    gModelConexaoFactory := TModelConexaoFactory.New(TTipoConexaoFactory.conexaoFiredacFireBird);
    gModelConexao        := gModelConexaoFactory.Conexao.Configurar( FileINI );
    SplashMessage('Conectando-se à base de dados...');
    {$ENDIF}
  except
    On E : Exception do
      ShowError('Erro ao tentar conectar no Servidor/Base.' + #13#13 + E.Message);
  end;
end;

procedure TDMBusiness.DataModuleDestroy(Sender: TObject);
begin
  DestruirPermissao;
  FileINI.DisposeOf;
end;

procedure TDMBusiness.DestruirPermissao;
begin
  _PermissaoPerfilDiretoria.DisposeOf;
  _PermissaoPerfil_DIRETORIA.DisposeOf;
  _PermissaoPerfil_GERENTE_VND.DisposeOf;
  _PermissaoPerfil_GERENTE_FIN.DisposeOf;
  _PermissaoPerfil_VENDEDOR.DisposeOf;
  _PermissaoPerfil_GERENTE_ADM.DisposeOf;
  _PermissaoPerfil_CAIXA.DisposeOf;
  _PermissaoPerfil_AUX_FINANC1.DisposeOf;
  _PermissaoPerfil_AUX_FINANC2.DisposeOf;
  _PermissaoPerfil_SUPERV_CX.DisposeOf;
  _PermissaoPerfil_ESTOQUISTA.DisposeOf;
  _PermissaoPerfil_SUPORTE_TI.DisposeOf;
  _PermissaoPerfil_SYSTEM_ADM.DisposeOf;
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
    sLOG_Error.Add('Versão    : ' + gVersaoApp.Version);

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

procedure TDMBusiness.ValidarLicenca(const sNomeArquivo: String; var CNPJ: String);
//var
//  Arquivo : TStringList;
//  ini : TIniFile;
//  I : Integer;
begin
//
//  Arquivo := TStringList.Create;
//  try
//
//    Arquivo.LoadFromFile( sNomeArquivo );
//
//    for I := 0 to Arquivo.Count - 1 do
//      Arquivo.Strings[I] := DecriptarSenha_Master(Arquivo.Strings[I], SYS_PASSWD_KEY);
//
//    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
//
//    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');
//
//    CNPJ := Trim(ini.ReadString('Licenca', 'edCGC', ''));
//
//  finally
//    ini.Free;
//    Arquivo.Free;
//
//    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
//  end;
  CNPJ := gLicencaSistema.GetCNPJArquivo(sNomeArquivo);
end;

procedure TDMBusiness.LimparLicenca;
begin
//  with DMBusiness, fdQryBusca do
//  begin
//    Close;
//    SQL.Clear;
//    SQL.Add('Delete from SYS_LICENCA');
//    ExecSQL;
//
//    CommitTransaction;
//  end;
  gLicencaSistema.LimparLicenca;
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
  Result := ((gLicencaSistema.DataBloqueio + 1) > dData);

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
    From      := gContaEmail.Conta;
    FromName  := RemoveAcentos(GetRazaoSocialEmpresa(sCNPJEmitente));
    Host      := gContaEmail.Servidor_SMTP;
    Username  := gContaEmail.Conta;
    Password  := gContaEmail.Senha;
    Port      := IntToStr(gContaEmail.Porta_SMTP);
    SetSSL    := gContaEmail.ConexaoSeguraSSL;
    SetTLS    := gContaEmail.RequerAutenticacao;
    IsHTML    := False;
    UseThread := False;
    Subject   := Trim(sAssunto);
    AddAddress( AnsiLowerCase(Trim(sDestinatario)) );

    Body.BeginUpdate;
    Body.Clear;
    Body.Add( sMensagem );
    Body.Add( sAssinaturaTxt );
    Body.EndUpdate;
  end;
end;

initialization
  RegistroSistema := TRegistry.Create;

finalization
  RegistroSistema.Destroy;

end.
