unit UDMRecursos;

interface

uses
  {$IFNDEF PRINTER_CUPOM}
  USplash,
  {$ENDIF}
  UGrAguarde,
  UPersonalizaEmpresa,
  UConstantesDGE,
  UBaseObject,
  Vcl.Forms, SysUtils, Classes, ImgList, Controls, cxGraphics, Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRecursos: TDMRecursos;
  gPersonalizaEmpresa : TPersonalizaEmpresa;

  procedure WaitAMomentFree;
  procedure WaitAMoment(const aTag : Integer = -1);

  {$IFNDEF PRINTER_CUPOM}
  procedure SplashFree;
  procedure SplashShow(const Aonwer : TComponent);
  procedure SplashMessage(pMessage : String);
  {$ENDIF}
  procedure ExcluirArquivosAlertaSistema;

implementation

{$R *.dfm}

procedure WaitAMomentFree;
begin
  if ( FrmAguarde <> nil ) then
    FrmAguarde.Close;
end;

procedure WaitAMoment(const aTag : Integer = -1);
begin
  WaitAMomentFree;

  try
    FrmAguarde := TFrmAguarde.Create(Application);
    FrmAguarde.Tag := aTag;
    FrmAguarde.Show;
  finally
  end
end;

{$IFNDEF PRINTER_CUPOM}
procedure SplashFree;
begin
  if ( frmSplash <> nil ) then
    frmSplash.Close;
end;

procedure SplashShow(const Aonwer : TComponent);
begin
  try
    if (frmSplash = nil) then
    begin
      frmSplash := TfrmSplash.Create(Aonwer);
      frmSplash.Show;

      Sleep(500);
    end;
  finally
    frmSplash.Update;
  end
end;

procedure SplashMessage(pMessage : String);
begin
  if (frmSplash <> nil) then
    try
      frmSplash.lblCarregando.Caption := Trim(pMessage);
    finally
    end
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
      DeleteFile(aFileAlerta);
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

initialization
  gPersonalizaEmpresa := TPersonalizaEmpresa.GetInstance;

end.
