unit UDMRecursos;

interface

uses
  System.SysUtils,
  System.Classes,
  System.ImageList,
  System.Notification,
  System.IOUtils,

  Winapi.Windows,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Vcl.Controls,

  cxGraphics,
  cxImageList,

  Interacao.Versao,
  Interacao.PersonalizaEmpresa,
  Interacao.Licenca,
  Model.Entidade.ConfiguracaoINI,

  {$IFNDEF PRINTER_CUPOM}
  View.Abertura,
  View.Login,
  {$ENDIF}

  FuncoesFormulario,
  UGrAguarde,
  UConstantesDGE,
  UBaseObject;

type
  TLoteProduto = class(TBaseObject)
    private
      aCodigo : Integer;
      aDescricao : String;
      aFabricacao,
      aValidade  : TDateTime;
      procedure SetID(const Value: String);
      function GetID: String;
    public
      property Codigo : Integer read aCodigo write aCodigo;
      property ID : String read GetID write SetID;
      property Descricao  : String read aDescricao write aDescricao;
      property Fabricacao : TDateTime read aFabricacao write aFabricacao;
      property Validade   : TDateTime read aValidade write aValidade;

      constructor Create;
  end;

  TDMRecursos = class(TDataModule)
    ImgPrincipalEnabled: TcxImageList;
    ImgPrincipalDisabled: TcxImageList;
    ImgPrincipalHot: TcxImageList;
    ImgPrincipal16x16: TcxImageList;
    ImgBotoesEnabled: TcxImageList;
    ImgBotoesDisabled: TcxImageList;
    ImgBotoesHot: TcxImageList;
    ImgBotoes16x16: TcxImageList;
    ncNotificationCenter: TNotificationCenter;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRecursos: TDMRecursos;
  FormFunction   : TFormularios;
  gSistema       : TSistema;
  gConfiguracoes : IConfiguracaoIni;
  gVersaoApp     : IVersao;
  gPersonalizaEmpresa : IPersonalizaEmpresa;
  gLicencaSistema : ILicenca;

  procedure WaitAMomentFree;
  procedure WaitAMoment(const aTag : Integer = -1; const aMensabem : String = '');
  procedure InstalarFonteWindows(aFontName, aFontDescription : String);
  procedure NotificarUsuario(aNotificacao : TNotification);

  function NotificationCenter : TNotificationCenter;

  {$IFNDEF PRINTER_CUPOM}
  procedure SplashFree;
  procedure SplashShow(const Aonwer : TComponent);
  procedure SplashMessage(pMessage : String);

  function ExecutarLogin() : Boolean;
  {$ENDIF}
  procedure ExcluirArquivosAlertaSistema;

implementation

{$R *.dfm}

uses
  Controller.Factory;

procedure WaitAMomentFree;
begin
  if ( FrmAguarde <> nil ) then
  begin
    FrmAguarde.Close;
    FrmAguarde.Free;
  end;

  Application.BringToFront; // Trazer aplicação para frente
end;

procedure WaitAMoment(const aTag : Integer = -1; const aMensabem : String = '');
begin
  WaitAMomentFree;

  try
    FrmAguarde := TFrmAguarde.Create(Application);
    FrmAguarde.Tag := aTag;

    if (Trim(aMensabem) <> EmptyStr) then
      FrmAguarde.lbDesc.Caption := Trim(aMensabem);

    FrmAguarde.Show;
  finally
  end
end;

procedure InstalarFonteWindows(aFontName, aFontDescription : String);
var
  aExiste : Boolean;
  aFileName : String;
begin
  aExiste   := (Screen.Fonts.IndexOf(Trim(aFontName)) > 0) or (Screen.Fonts.IndexOf(Trim(aFontDescription)) > 0);
  aFileName := ExtractFilePath(ParamStr(0)) + aFontName;
  if (not aExiste) and FileExists(aFileName) then
    AddFontResource(PChar(aFileName));
end;

procedure NotificarUsuario(aNotificacao : TNotification);
begin
  if Assigned(aNotificacao) then
    NotificationCenter.PresentNotification(aNotificacao);
end;

function NotificationCenter : TNotificationCenter;
begin
  Result := DMRecursos.ncNotificationCenter;
end;

{$IFNDEF PRINTER_CUPOM}
procedure SplashFree;
begin
  try
    try
      if (FrmAbertura <> nil) then
        FrmAbertura.Close;
    except
    end
  finally
  end
end;

procedure SplashShow(const Aonwer : TComponent);
begin
  try
    try
      if (FrmAbertura = nil) then
      begin
        FrmAbertura := TFrmAbertura.Create(Aonwer);
        FrmAbertura.Show;

        Sleep(500);
      end;
    except
    end
  finally
    try
      FrmAbertura.Update;
    except
    end
  end
end;

procedure SplashMessage(pMessage : String);
begin
  try
    try
      if (FrmAbertura <> nil) then
          FrmAbertura.SetMensagem( Trim(pMessage) );
    except
    end
  finally
  end
end;

function ExecutarLogin() : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    FrmLogin := TFrmLogin.Create(Application);
    aRetorno := (FrmLogin.ShowModal = mrOK);
  finally
    Result := aRetorno;
  end;
end;

{$ENDIF}

procedure ExcluirArquivosAlertaSistema;
var
  tipoAlerta  : TTipoAlertaSistema;
  aFileAlerta : String;
begin
  for tipoAlerta := Low(SYS_ALERTA_ARQUIVOS) to High(SYS_ALERTA_ARQUIVOS) do
  begin
    aFileAlerta := ExtractFilePath(ParamStr(0)) + SYS_ALERTA_ARQUIVOS[tipoAlerta];
    if FileExists(aFileAlerta) then
      System.SysUtils.DeleteFile(aFileAlerta);
  end;
end;

{ TLoteProduto }

constructor TLoteProduto.Create;
begin
  inherited Create;
  aDescricao  := EmptyStr;
  aFabricacao := StrToDate(SYS_EMPTY_DATE);
  aValidade   := StrToDate(SYS_EMPTY_DATE);
end;

function TLoteProduto.GetID: String;
begin
  Result := IDGuid;
end;

procedure TLoteProduto.SetID(const Value: String);
begin
  IDGuid := Trim(Value);
end;

{ TDMRecursos }

procedure TDMRecursos.DataModuleCreate(Sender: TObject);
begin
  InstalarFonteWindows(SYS_BAUHS93, SYS_BAUHS93_DESCRIPTION);
end;

initialization
  gConfiguracoes := TConfiguracaoIni.New(TPath.Combine(ExtractFilePath(ParamStr(0)), FILE_SETTINGS_INI)).Load;
  gVersaoApp     := TFactoryController.getInstance().getVersaoController();
  gPersonalizaEmpresa := TFactoryController.getInstance().getPersonalizaEmpresa();
  gLicencaSistema := TFactoryController.getInstance().getLicenca();
  FormFunction    := TFormularios.Create;

finalization
  FormFunction.Destroy;

end.
