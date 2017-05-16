unit UDMRecursos;

interface

uses
  USplash,
  UGrAguarde,
  UPersonalizaEmpresa,
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

  procedure SplashFree;
  procedure SplashShow(const Aonwer : TComponent);
  procedure SplashMessage(pMessage : String);

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

{ TDMRecursos }

initialization
  gPersonalizaEmpresa := TPersonalizaEmpresa.GetInstance;

end.
