unit UDMRecursos;

interface

uses
  UGrAguarde,
  UPersonalizaEmpresa,
  Vcl.Forms, SysUtils, Classes, ImgList, Controls, cxGraphics;

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

initialization
  gPersonalizaEmpresa := TPersonalizaEmpresa.GetInstance;

end.
