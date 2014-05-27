unit UDMBusiness;

interface

uses
  Windows, Forms, SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IniFIles,
  ShellApi, Printers, DateUtils, IBQuery, RpDefine, RpRave,
  frxClass, frxDBSet, EMsgDlg, IdBaseComponent, IdComponent, IdIPWatch, IBStoredProc,
  FuncoesFormulario, UConstantesDGE, IBUpdateSQL, EUserAcs, DBClient,
  Provider, Dialogs, Registry;

type
  TSistema = record
    Codigo : Integer;
    Nome   : String;
  end;

  TUsuarioLogado = record
    Login  : String;
    Nome   : String;
    Funcao : Integer;
    Empresa: String;
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
  end;

  TTipoRegime = (trSimplesNacional, trSimplesExcessoReceita, trRegimeNormal);
  TTipoMovimentoCaixa = (tmcxCredito, tmcxDebito);
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
    qryBusca: TIBQuery;
    ibdtstUsers: TIBDataSet;
    EvMsgDialog: TEvMsgDlg;
    dtsrcUsers: TDataSource;
    raveReport: TRvProject;
    IdIPWatch: TIdIPWatch;
    qryCaixaAberto: TIBDataSet;
    qryCaixaAbertoANO: TSmallintField;
    qryCaixaAbertoNUMERO: TIntegerField;
    qryCaixaAbertoUSUARIO: TIBStringField;
    qryCaixaAbertoDATA_ABERTURA: TDateField;
    qryCaixaAbertoVALOR_TOTAL_CREDITO: TIBBCDField;
    qryCaixaAbertoVALOR_TOTAL_DEBITO: TIBBCDField;
    stpCaixaMovimentoREC: TIBStoredProc;
    stpCaixaMovimentoPAG: TIBStoredProc;
    stpContaCorrenteSaldo: TIBStoredProc;
    qryCaixaAbertoCONTA_CORRENTE: TIntegerField;
    stpCaixaMovimentoREC_ESTORNO: TIBStoredProc;
    stpCaixaMovimentoPAG_ESTORNO: TIBStoredProc;
    qryEvAcessUser: TIBDataSet;
    updEvAcessUser: TIBUpdateSQL;
    qryEvAcessUserFORM_NAME: TIBStringField;
    qryEvAcessUserOBJECT_NAME: TIBStringField;
    qryEvAcessUserCONSENTS_STRING: TMemoField;
    ibqryEmpresa: TIBQuery;
    ibqryEmpresaCNPJ: TIBStringField;
    ibqryEmpresaNMFANT: TIBStringField;
    qryConfiguracoes: TIBQuery;
    ibdtstUsersNOME: TIBStringField;
    ibdtstUsersSENHA: TIBStringField;
    ibdtstUsersNOMECOMPLETO: TIBStringField;
    ibdtstUsersCODFUNCAO: TSmallintField;
    ibdtstUsersLIMIDESC: TIBBCDField;
    ibdtstUsersATIVO: TSmallintField;
    ibdtstUsersPERM_ALTERAR_VALOR_VENDA: TSmallintField;
    ibdtstUsersALTERAR_SENHA: TSmallintField;
    setSistema: TIBStoredProc;
    setRotina: TIBStoredProc;
    ibdtstAjustEstoqCONTROLE: TIntegerField;
    ibdtstAjustEstoqCODEMPRESA: TIBStringField;
    ibdtstAjustEstoqQTDEATUAL: TIBBCDField;
    ibdtstAjustEstoqQTDENOVA: TIBBCDField;
    ibdtstAjustEstoqQTDEFINAL: TIBBCDField;
    ibdtstAjustEstoqUSUARIO: TIBStringField;
    cdsLicenca: TIBDataSet;
    cdsLicencaLINHA_CONTROLE: TIBStringField;
    opdLicenca: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
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
    procedure CarregarLicenca(const sNomeArquivo : String);
    procedure ValidarLicenca(const sNomeArquivo : String; var CNPJ : String);
    procedure LimparLicenca;

    function LiberarUsoLicenca(const dDataMovimento : TDateTime; const Alertar : Boolean = FALSE) : Boolean;
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
  function NetWorkActive(const Alertar : Boolean = FALSE) : Boolean;

  procedure ShowInformation(sTitle, sMsg : String); overload;
  procedure ShowInformation(sMsg : String); overload;
  procedure ShowWarning(sMsg : String); overload;
  procedure ShowWarning(sTitulo, sMsg : String); overload;
  procedure ShowStop(sMsg : String); overload;
  procedure ShowStop(sTitulo, sMsg : String); overload;
  procedure ShowError(sMsg : String);
  procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
  procedure CommitTransaction;

  procedure GetDataSet(const FDataSet : TClientDataSet; const sNomeTabela, sQuando, sOrdernarPor : String);

  procedure Desativar_Promocoes;
  procedure GerarSaldoContaCorrente(const ContaCorrente : Integer; const Data : TDateTime);
  procedure BloquearClientes;
  procedure DesbloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
  procedure BloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
  procedure RegistrarSegmentos(Codigo : Integer; Descricao : String);
  procedure RegistrarControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess);
  procedure CarregarConfiguracoesEmpresa(CNPJ : String; Mensagem : String; var AssinaturaHtml, AssinaturaTXT : String);
  procedure SetEmpresaIDDefault(CNPJ : String);
  procedure SetSistema(iCodigo : Smallint; sNome, sVersao : String);
  procedure SetRotinaSistema(iTipo : Smallint; sCodigo, sDescricao, sRotinaPai : String);

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
  function GetEmpresaIDDefault : String;
  function GetClienteIDDefault : Integer;
  function GetVendedorIDDefault : Integer;
  function GetFormaPagtoIDDefault : Integer;
  function GetCondicaoPagtoIDDefault : Integer;
  function GetEstacaoEmitiBoleto : Boolean;
  function GetEstacaoEmitiNFe : Boolean;
  function GetCondicaoPagtoIDBoleto_Descontinuada : Integer;  // Descontinuada
  function GetEmitirCupom : Boolean;
  function GetModeloEmissaoCupom : Integer;
  function GetSegmentoID(const CNPJ : String) : Integer;
  function GetControleAcesso(const AOnwer : TComponent; const EvUserAcesso : TEvUserAccess) : Boolean;
  function GetEmailEmpresa(const sCNPJEmpresa : String) : String;
  function GetCalcularCustoOperEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetPermitirVendaEstoqueInsEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetPermitirDuplicarCNPJCliente(const sCNPJEmpresa : String) : Boolean;
  function GetSimplesNacionalInsEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetEstoqueUnicoEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetEstoqueSateliteEmpresa(const sCNPJEmpresa : String) : Boolean;
  function GetRegimeEmpresa(const sCNPJEmpresa : String) : TTipoRegime;
  function GetRazaoSocialEmpresa(const sCNPJEmpresa : String) : String;
  function GetNomeFantasiaEmpresa(const sCNPJEmpresa : String) : String;
  function GetPrazoValidadeAutorizacaoCompra(const sCNPJEmpresa : String) : Integer;

  function StrIsCNPJ(const Num: string): Boolean;
  function StrIsCPF(const Num: string): Boolean;
  function StrIsDateTime(const S: string): Boolean;
  function StrIsInteger(const Num: string): Boolean;
  function StrFormatarCnpj(sCnpj: String): String;
  function StrFormatarCpf(sCpf: String): String;
  function StrFormatarCEP(sCEP: String): String;
  function StrFormatarFONE(sFone: String): String;
  function StrDescricaoProduto : String;
  function StrOnlyNumbers(const Str : String) : String;

  function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
  function SetLogradouro(const iCidade : Integer; const sNome : String; var Tipo : Smallint) : Integer;

  function GetGeneratorID(const GeneratorName : String) : Integer;
  function GetNextID(NomeTabela, CampoChave : String; const sWhere : String = '') : Largeint;
  function GetPaisNomeDefault : String;
  function GetEstadoNomeDefault : String;
  function GetEstadoNome(const iEstado : Integer) : String; overload;
  function GetEstadoNome(const sSigla : String) : String; overload;
  function GetEstadoID(const sSigla : String) : Integer;
  function GetEstadoUF(const iEstado : Integer) : String;
  function GetCidadeNomeDefault : String;
  function GetCidadeNome(const iCidade : Integer) : String;
  function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer; overload;
  function GetCidadeID(const sCEP : String) : Integer; overload;
  function GetBairroNome(const iBairro : Integer) : String;
  function GetLogradouroNome(const iLogradouro : Integer) : String;
  function GetLogradouroTipo(const iLogradouro : Integer) : String;
  function GetCfopNomeDefault : String;
  function GetCfopEntradaNomeDefault : String;
  function GetEmpresaNomeDefault : String;
  function GetEmpresaEnderecoDefault : String;
  function GetEmpresaEndereco(const sCNPJEmitente : String) : String;
  function GetClienteNomeDefault : String;
  function GetClienteNome(const iCodigo : Integer) : String;
  function GetClienteEmail(const iCodigo : Integer) : String;
  function GetVendedorNomeDefault : String;
  function GetFormaPagtoNomeDefault : String;
  function GetCondicaoPagtoNomeDefault : String;
  function GetSenhaAutorizacao : String;
  function GetDateTimeDB : TDateTime;
  function GetDateDB : TDateTime;
  function GetProximoDiaUtil(const Data : TDateTime) : TDateTime;
  function GetTimeDB : TDateTime;
  function GetUserApp : String;
  function GetUserFullName : String;
  function GetUserFunctionID : Integer;
  function GetUserPermissao(sRotina : String; const Alertar : Boolean = FALSE) : Boolean;
  function GetUserUpdatePassWord : Boolean;
  function GetLimiteDescontoUser : Currency;
  function GetUserPermitirAlterarValorVenda : Boolean;
  function GetSolicitaDHSaidaNFe(const sCNPJEmitente : String) : Boolean;
  function GetImprimirCodClienteNFe(const sCNPJEmitente : String) : Boolean;
  function GetExisteCPF_CNPJ(iCodigoCliente : Integer; sCpfCnpj : String; var iCodigo : Integer; var sRazao : String) : Boolean;
  function GetExisteNumeroAutorizacao(iAno, iCodigo : Integer; sNumero : String; var sControleInterno : String) : Boolean;
  function GetMenorVencimentoAPagar : TDateTime;

  function CaixaAberto(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;

  function SetMovimentoCaixa(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;
  function SetMovimentoCaixaEstorno(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint;
    const AnoLancamento, NumLancamento, SeqPagto : Integer; const Valor : Currency; const TipoMov : TTipoMovimentoCaixa) : Boolean;

const
  DB_USER_NAME     = 'SYSDBA';
  DB_USER_PASSWORD = 'masterkey';
  DB_LC_CTYPE      = 'ISO8859_2';

  MODELO_CUPOM_POOLER = 0;

  FUNCTION_USER_ID_DIRETORIA   =  1;
  FUNCTION_USER_ID_GERENTE_VND =  2;
  FUNCTION_USER_ID_GERENTE_FIN =  3;
  FUNCTION_USER_ID_VENDEDOR    =  4;
  FUNCTION_USER_ID_GERENTE_ADM =  5;
  FUNCTION_USER_ID_CAIXA       =  6;
  FUNCTION_USER_ID_AUX_FINANC1 =  7;
  FUNCTION_USER_ID_AUX_FINANC2 =  8;
  FUNCTION_USER_ID_SUPERV_CX   =  9;
  FUNCTION_USER_ID_ESTOQUISTA  = 10;
  FUNCTION_USER_ID_SUPORTE_TI  = 11;
  FUNCTION_USER_ID_SYSTEM_ADM  = 12;

  BOLETO_ARQUIVO_LOGOTIPO = 'Imagens\Emitente.gif'; //gif
  BOLETO_IMAGENS          = 'Imagens\';
  BOLETO_LICENCAS         = 'Licencas\';

  STATUS_VND_AND = 1;
  STATUS_VND_ABR = 2;
  STATUS_VND_FIN = 3;
  STATUS_VND_NFE = 4;
  STATUS_VND_CAN = 5;

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

  TIPO_AUTORIZACAO_COMPRA         = 1;
  TIPO_AUTORIZACAO_SERVICO        = 2;
  TIPO_AUTORIZACAO_COMPRA_SERVICO = 3;

  // Mensagens padrões do sistema
  CLIENTE_BLOQUEADO_PORDEBITO = 'Cliente bloqueado, automaticamente, pelo sistema por se encontrar com títulos vencidos. Favor buscar mais informações junto ao FINANCEIRO.';

implementation

uses
  UFuncoes, UGrMessage;

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
(*
      if ( IdIP = nil ) then
        IdIP  := TIdIPWatch.Create(Application);

      if ( IdFTP = nil ) then
        IdFTP := TIdFTP.Create(Application);
*)
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
(*        sHostID   := IdIP.LocalIP;
        sHostName := IdIP.LocalName;
*)
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
    Application.MessageBox(PChar(sMsg), 'Informação', MB_ICONINFORMATION);
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
    Application.MessageBox(PChar(sMsg), 'Alerta', MB_ICONWARNING);
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

    Application.MessageBox(PChar(sMsg), 'Erro', MB_ICONERROR);
  finally
    sLOG_Error.Free;
  end;
end;

procedure UpdateSequence(GeneratorName, NomeTabela, CampoChave : String; const sWhr : String = '');
var
  ID : Largeint;
begin
  with DMBusiness, qryBusca do
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

procedure Desativar_Promocoes;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set Dtcad = coalesce(Dtcad, Current_date), Bloqueado = 1, Bloqueado_data = Current_date, Bloqueado_usuario = user,');
    SQL.Add('  Usuario = user, Desbloqueado_data = null, Bloqueado_motivo = ' + QuotedStr(CLIENTE_BLOQUEADO_PORDEBITO));
    SQL.Add('where Bloqueado = 0');
    SQL.Add('  and ((Desbloqueado_data is null) or (Desbloqueado_data <> Current_date))');
    SQL.Add('  and Codigo in (');
    SQL.Add('    Select Distinct');
    SQL.Add('      r.Cliente');
    SQL.Add('    from TBCONTREC r');
    SQL.Add('    where r.Parcela > 0');
    SQL.Add('      and r.Situacao = 1');
    SQL.Add('      and r.Dtvenc < Current_date');
    SQL.Add('      and r.Baixado = 0');
    SQL.Add('      and r.Cliente <> ' + IntToStr(CONSUMIDOR_FINAL_CODIGO));
    SQL.Add('  )');
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure DesbloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set Dtcad = coalesce(Dtcad, Current_date), Desbloqueado_data = Current_date, Bloqueado = 0, Bloqueado_data = Null, Bloqueado_usuario = Null,');
    SQL.Add('  Usuario = ' + QuotedStr(GetUserApp) + ',');

    if Trim(Motivo) = EmptyStr then
      SQL.Add('  Bloqueado_motivo = Null')
    else
      SQL.Add('  Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));

    SQL.Add('where Codigo = ' + IntToStr(iCodigoCliente));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure BloquearCliente(iCodigoCliente : Integer; const Motivo : String = '');
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCLIENTE Set Dtcad = coalesce(Dtcad, Current_date), Desbloqueado_data = Null, Bloqueado = 1, Bloqueado_data = Current_date, Bloqueado_usuario = ' + QuotedStr(GetUserApp) + ',');
    SQL.Add('  Usuario = ' + QuotedStr(GetUserApp) + ',');

    if Trim(Motivo) = EmptyStr then
      SQL.Add('  Bloqueado_motivo = Null')
    else
      SQL.Add('  Bloqueado_motivo = ' + QuotedStr(Trim(Motivo)));

    SQL.Add('where Codigo = ' + IntToStr(iCodigoCliente));
    ExecSQL;

    CommitTransaction;
  end;
end;

procedure RegistrarSegmentos(Codigo : Integer; Descricao : String);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Execute Procedure SET_SEGMENTO(' + IntToStr(Codigo) + ', ' + QuotedStr(Trim(Descricao)) + ')');
    ExecSQL;

    CommitTransaction;
  end;
end;

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
  with DMBusiness, qryBusca do
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

  with gContaEmail, DMBusiness, qryConfiguracoes do
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

procedure SetEmpresaIDDefault(CNPJ : String);
begin
  FileINI.WriteString('Default', 'EmpresaID', CNPJ);
  FileINI.UpdateFile;
end;

procedure SetSistema(iCodigo : Smallint; sNome, sVersao : String);
begin
  try
    with DMBusiness, setSistema do
    begin
      Close;
      ParamByName('Codigo').AsInteger := iCodigo;
      ParamByName('Nome').AsString    := sNome;
      ParamByName('Versao').AsString  := sVersao;
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
    with DMBusiness, setRotina do
    begin
      Close;
      ParamByName('Codigo').AsString     := Trim(sCodigo);
      ParamByName('Tipo').AsInteger      := iTipo;
      ParamByName('Descricao').AsString  := Trim(sDescricao);
      ParamByName('Rotina_Pai').AsString := Trim(sRotinaPai);
      ExecProc;

      CommitTransaction;
    end;
  except
    On E : Exception do
      ShowError('SetRotinaSistema() - ' + E.Message);
  end;
end;

function EncriptSenha_Master(const Value, Key : String) : String;
var
  iCarac ,
  KeyAlt : Integer;
begin
  KeyAlt := Length(Key);

  for iCarac := 1 to Length(Key) do
    KeyAlt := KeyAlt xor Ord(Key[iCarac]);

  Result := Value;

  for iCarac := 1 to Length(Value) do
    Result[iCarac] := chr(not(ord(Value[iCarac]) xor Ord(KeyAlt)));
end;

function DecriptarSenha_Master(const Value, Key : String) : String;
begin
  Result := EncriptSenha_Master(Value, Key);
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
  Result := ( Application.MessageBox(PChar(sMsg), 'Confirmar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
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
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, 'CfopID', 5102);
end;

function GetCfopEntradaIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, 'CfopEntradaID', GetCfopIDDefault);
end;

function GetEmpresaIDDefault : String;
begin
  Result := FileINI.ReadString(INI_SECAO_DEFAULT, 'EmpresaID', EmptyStr);
end;

function GetClienteIDDefault : Integer;
begin
  Result := StrToIntDef( FileINI.ReadString(INI_SECAO_DEFAULT, 'ClienteID', EmptyStr), CONSUMIDOR_FINAL_CODIGO);
end;

function GetVendedorIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, 'VendedorID', 1);
end;

function GetFormaPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, 'FormaPagtoID', 1);
end;

function GetCondicaoPagtoIDDefault : Integer;
begin
  Result := FileINI.ReadInteger(INI_SECAO_DEFAULT, 'CondicaoPagtoID', 1);
end;

function GetEstacaoEmitiBoleto : Boolean;
begin
  Result := FileINI.ReadBool('Boleto', 'EmitirBoleto', False);
end;

function GetEstacaoEmitiNFe : Boolean;
begin
  Result := (Trim(FileINI.ReadString('Certificado', 'NumSerie', EmptyStr)) <> EmptyStr);
end;

function GetCondicaoPagtoIDBoleto_Descontinuada : Integer; // Descontinuada
begin
  Result := FileINI.ReadInteger('Boleto', 'FormaPagtoID', 1);
end;

function GetEmitirCupom : Boolean;
begin
  Result := FileINI.ReadBool('Cupom', 'EmitirCupom', False);
end;

function GetModeloEmissaoCupom : Integer;
begin
  Result := FileINI.ReadInteger('Cupom', 'ModeloEmissaoCupom', 0);
end;

function GetSegmentoID(const CNPJ : String) : Integer;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(SEGMENTO, 0) as SegmentoID from TBEMPRESA where CNPJ = ' + QuotedStr(Trim(CNPJ)));
    Open;

    Result := FieldByName('SegmentoID').AsInteger;

    Close;
  end;
end;

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

function GetEmailEmpresa(const sCNPJEmpresa : String) : String;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cliente_permitir_duplicar_cnpj as permitir from TBCONFIGURACAO where empresa = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('permitir').AsInteger = 1);

    Close;
  end;
end;

function GetSimplesNacionalInsEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select TIPO_REGIME_NFE as sn from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := (FieldByName('sn').AsInteger = 0); // 0. Simples Nacional (1); 1. Simples Excesso Receita (2); 2. Regime Normal (3)

    Close;
  end;
end;

function GetEstoqueUnicoEmpresa(const sCNPJEmpresa : String) : Boolean;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select coalesce(nullif(Trim(nmfant), ''''), rzsoc) as fantasia from TBEMPRESA where cnpj = ' + QuotedStr(sCNPJEmpresa));
    Open;

    Result := AnsiUpperCase( Trim(FieldByName('fantasia').AsString) );

    Close;
  end;
end;

function GetPrazoValidadeAutorizacaoCompra(const sCNPJEmpresa : String) : Integer;
begin
  Result := 5;
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

function StrDescricaoProduto : String;
var
  S : String;
begin
  try
    S := 'Produtos';

    Case GetSegmentoID(GetEmpresaIDDefault)  of
      SEGMENTO_MERCADO_CARRO_ID:
        S := 'Veículos';
      else
        S := 'Produtos';
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

function SetBairro(const iCidade : Integer; const sNome : String) : Integer;
begin
  with DMBusiness, qryBusca do
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
begin
  sDesc := Trim(AnsiUpperCase(sNome));
  sTipo := Trim(Copy(sDesc, 1, Pos('.', sDesc) - 1));

  if ( sTipo = EmptyStr ) then
    sTipo := Trim(Copy(sDesc, 1, Pos(' ', sDesc) - 1));

  if ( sTipo <> EmptyStr ) then
    sDesc :=Trim(Copy(sDesc, Length(sTipo) + 1, Length(sDesc)));

  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select g.cod_logradouro, g.cod_tipo from SET_LOGRADOURO(' + QuotedStr(sDesc) + ', ' + QuotedStr(sTipo) + ', ' + IntToStr(iCidade) + ') g');
    Open;

    Tipo   := FieldByName('cod_tipo').AsInteger;
    Result := FieldByName('cod_logradouro').AsInteger;

    CommitTransaction;

    Close;
  end;
end;

function GetGeneratorID(const GeneratorName : String) : Integer;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select max(' + CampoChave + ') as ID from ' + NomeTabela + ' ' + sWhere);
    Open;

    Result := FieldByName('ID').AsInteger + 1;
  end;
end;

function GetPaisNomeDefault : String;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select est_nome from TBESTADO where est_cod = ' + IntToStr(GetEstadoIDDefault));
    Open;

    Result := FieldByName('est_nome').AsString;

    Close;
  end;
end;

function GetEstadoNome(const iEstado : Integer) : String;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where cid_cod = ' + IntToStr(GetCidadeIDDefault));
    Open;

    Result := FieldByName('cid_nome').AsString;

    Close;
  end;
end;

function GetCidadeNome(const iCidade : Integer) : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cid_nome from TBCIDADE where cid_cod = ' + IntToStr(iCidade));
    Open;

    Result := FieldByName('cid_nome').AsString;

    Close;
  end;
end;

function GetCidadeID(const iEstado : Integer; const sNome : String) : Integer;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_descricao from TBCFOP where cfop_cod = ' + IntToStr(GetCfopIDDefault));
    Open;

    Result := FieldByName('cfop_descricao').AsString;

    Close;
  end;
end;

function GetCfopEntradaNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cfop_descricao from TBCFOP where cfop_cod = ' + IntToStr(GetCfopEntradaIDDefault));
    Open;

    Result := FieldByName('cfop_descricao').AsString;

    Close;
  end;
end;

function GetEmpresaNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select rzsoc from TBEMPRESA where Cnpj = ' + QuotedStr(GetEmpresaIDDefault));
    Open;

    Result := FieldByName('rzsoc').AsString;

    Close;
  end;
end;

function GetEmpresaEnderecoDefault : String;
begin
  Result := GetEmpresaEndereco(GetEmpresaIDDefault);
end;

function GetEmpresaEndereco(const sCNPJEmitente : String) : String;
begin
  with DMBusiness, qryBusca do
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
    SQL.Add('where e.cnpj = ' + QuotedStr(GetEmpresaIDDefault));
    Open;

    Result := Trim(FieldByName('ender').AsString) + ', No. ' + Trim(FieldByName('numero_end').AsString) +
      IfThen(Trim(FieldByName('complemento').AsString) = EmptyStr, '', ' (' + Trim(FieldByName('complemento').AsString) + ')') + ', ' +
      'BAIRRO: ' + Trim(FieldByName('bairro').AsString) + ' - ' + Trim(FieldByName('cidade').AsString) + ' ' +
      'CEP: ' + StrFormatarCEP(Trim(FieldByName('cep').AsString));

    Close;
  end;
end;

function GetClienteNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBCLIENTE where Codigo = ' + IntToStr(GetClienteIDDefault));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetClienteNome(const iCodigo : Integer) : String;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select email from TBCLIENTE where Codigo = ' + IntToStr(iCodigo));
    Open;

    Result := AnsiLowerCase(Trim(FieldByName('email').AsString));

    Close;
  end;
end;

function GetVendedorNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select nome from TBVENDEDOR where cod = ' + IntToStr(GetVendedorIDDefault));
    Open;

    Result := FieldByName('nome').AsString;

    Close;
  end;
end;

function GetFormaPagtoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select descri from TBFORMPAGTO where cod = ' + IntToStr(GetFormaPagtoIDDefault));
    Open;

    Result := FieldByName('descri').AsString;

    Close;
  end;
end;

function GetCondicaoPagtoNomeDefault : String;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select cond_descricao_full from VW_CONDICAOPAGTO where cond_cod = ' + IntToStr(GetCondicaoPagtoIDDefault));
    Open;

    Result := FieldByName('cond_descricao_full').AsString;

    Close;
  end;
end;

function GetSenhaAutorizacao : String;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select First 1 Current_date as Data from TBEMPRESA');
    Open;

    Result := FieldByName('Data').AsDateTime;
  end;
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, ibdtstUsers do
    Result := AnsiUpperCase( Trim(ibdtstUsersNOME.AsString) );
end;

function GetUserFullName : String;
begin
  with DMBusiness, ibdtstUsers do
    Result := AnsiUpperCase( Trim(ibdtstUsersNOMECOMPLETO.AsString) );
end;

function GetUserFunctionID : Integer;
begin
  with DMBusiness, ibdtstUsers do
    Result := ibdtstUsersCODFUNCAO.AsInteger;
end;

function GetUserPermissao(sRotina : String; const Alertar : Boolean = FALSE) : Boolean;
begin
  Result := True;

  if not Result then
    if Alertar then
      ShowWarning(sRotina + ' - Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.');
end;

function GetUserUpdatePassWord : Boolean;
begin
  with DMBusiness, ibdtstUsers do
    Result := (ibdtstUsersALTERAR_SENHA.AsInteger = 1);
end;

function GetLimiteDescontoUser : Currency;
begin
  with DMBusiness, ibdtstUsers do
    Result := ibdtstUsersLIMIDESC.AsCurrency;
end;

function GetUserPermitirAlterarValorVenda : Boolean;
begin
  with DMBusiness, ibdtstUsers do
    Result := (ibdtstUsersPERM_ALTERAR_VALOR_VENDA.AsInteger = 1);
end;

function GetSolicitaDHSaidaNFe(const sCNPJEmitente : String) : Boolean;
begin
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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
  with DMBusiness, qryBusca do
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

function GetMenorVencimentoAPagar : TDateTime;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(cp.dtvenc) as vencimento');
    SQL.Add('from TBCONTPAG cp');
    SQL.Add('where cp.empresa = ' + QuotedStr(GetEmpresaIDDefault));
    SQL.Add('  and cp.quitado = 0');
    Open;

    if not IsEmpty then
      Result := FieldByName('vencimento').AsDateTime
    else
      Result := GetDateDB;

    Close;
  end;
end;

function CaixaAberto(const Usuario : String; const Data : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;
begin
  with DMBusiness, qryCaixaAberto do
  begin
    Close;
    ParamByName('Usuario').AsString   := Usuario;
    ParamByName('Data').AsDate        := Data;
    ParamByName('FormaPagto').AsShort := FormaPagto;
    Open;

    Result := ( qryCaixaAbertoANO.AsInteger > 0 );

    if ( Result ) then
    begin
      CxAno           := qryCaixaAbertoANO.AsInteger;
      CxNumero        := qryCaixaAbertoNUMERO.AsInteger; 
      CxContaCorrente := qryCaixaAbertoCONTA_CORRENTE.AsInteger
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

  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;

end;

procedure TDMBusiness.DataModuleCreate(Sender: TObject);
begin
  gSistema.Codigo := SISTEMA_GESTAO;
  gSistema.Nome   := Application.Title;

  try

    with ibdtbsBusiness, FileINI do
    begin
      Connected    := False;
      DatabaseName := ReadString('Conexao', 'Servidor', EmptyStr) + ':' + ReadString('Conexao', 'Base', EmptyStr);
      Params.Clear;
      Params.Add('user_name=' + DB_USER_NAME);
      Params.Add('password='  + DB_USER_PASSWORD);
      Params.Add('lc_ctype='  + DB_LC_CTYPE);
      Connected := True;

      if ( Connected ) then
      begin
        ibdtstUsers.Open;
        ibqryEmpresa.Open;
      end;
    end;

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
    
    with RegistroSistema do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey(SYS_PATH_REGISTER + GetInternalName, True);

      WriteString(KEY_REG_VERSAO, GetExeVersion);
      WriteString(KEY_REG_DATA,   DateToStr(Date));
      CloseKey;
    end;
    
  except
    On E : Exception do
      ShowError('Erro ao tentar conectar no Servidor/Base.' + #13#13 + E.Message);
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

    CNPJ := ini.ReadString('Licenca', 'edCGC', '');

  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;

end;

procedure TDMBusiness.LimparLicenca;
begin
  with DMBusiness, qryBusca do
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
  dData : TDateTime;
begin
  if ( dDataMovimento = 0 ) then
    dData := GetDateDB
  else
    dData := dDataMovimento;

  Result := (gLicencaSistema.DataBloqueio > dData);

  if not Result then
    if Alertar then
      ShowStop('Licença',
        IntToStr (gLicencaSistema.Competencia)  + #13 +
        DateToStr(gLicencaSistema.DataBloqueio) + #13#13 +
        'A licença do sistema expirou.' + #13 +
        'Acessos a determinadas rotinas no sistema serão bloqueados!' + #13#13 +
        'Favor entrar em contato com suporte.');
end;

procedure TDMBusiness.MontarPermissao_Diretoria;
begin
  _PermissaoPerfilDiretoria.BeginUpdate;
  _PermissaoPerfilDiretoria.Clear;

  _PermissaoPerfilDiretoria.Add( ROTINA_MENU_CADASTRO_ID );
  _PermissaoPerfilDiretoria.Add( ROTINA_MENU_ESTOQUE_ID );

  _PermissaoPerfilDiretoria.EndUpdate;
end;

initialization
  FormFunction    := TFormularios.Create;
  RegistroSistema := TRegistry.Create;

finalization
  FormFunction.Destroy;

end.
