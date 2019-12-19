unit USplash;

interface

uses
  UConstantesDGE,
  UGrPadrao,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  dxGDIPlusClasses, Vcl.StdCtrls, JvExControls, JvAnimatedImage, JvGIFCtrl;

type
  TfrmSplash = class(TfrmGrPadrao)
    img_company: TImage;
    shp_vertical: TShape;
    lblVersion: TLabel;
    gifCarregando: TJvGIFAnimator;
    lblFileDescription: TLabel;
    lblCopyright: TLabel;
    lblCarregando: TLabel;
    lblProductName: TLabel;
    lblManifestoAgil: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmSplash: TfrmSplash;

{
144	1,6180
233	1,6181 - 233 x 144
377	1,6180 - 377 x 233
610	1,6180 - 610 x 377
987	1,6180 - 987 x 610
}

implementation

{$R *.dfm}

uses UFuncoes;

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  gifCarregando.Animate := False;
  Action := caFree;
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  inherited;
  lblProductName.Caption     := StringReplace(GetInternalName, '_', ' ', [rfReplaceAll]);
  lblFileDescription.Caption := GetFileDescription;
  lblVersion.Caption         := 'Versão ' + GetExeVersion;
  lblCopyright.Caption       := GetCopyright;
  lblManifestoAgil.Caption   := MANIFESTO_AGIL;

  gifCarregando.Animate := True;
end;

procedure TfrmSplash.RegistrarRotinaSistema;
begin
  ;
end;

end.
