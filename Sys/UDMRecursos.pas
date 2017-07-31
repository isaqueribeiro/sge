unit UDMRecursos;

interface

uses
  {$IFNDEF PRINTER_CUPOM}
  USplash,
  {$ENDIF}
  UGrAguarde,
  UPersonalizaEmpresa,
  UConstantesDGE,
  Vcl.Forms, SysUtils, Classes, ImgList, Controls, cxGraphics, Vcl.ExtCtrls;

type
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

{ TDMRecursos }

initialization
  gPersonalizaEmpresa := TPersonalizaEmpresa.GetInstance;

end.
