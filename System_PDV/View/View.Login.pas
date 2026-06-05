unit View.Login;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  dxGDIPlusClasses,
  View.PadraoLogin;

type
  TFrmLogin = class(TFrmPadraoLogin)
    imgLogo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
  FuncoesFormulario;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  lblSystemName.Transparent := False;
  lblSystemDescription.Transparent := False;

  imgLogo.BringToFront;
  // Inverter cor
  //lblSystemName.Font.Color := RGB(255 - GetRValue(Self.Color), 255 - GetGValue(Self.Color), 255 - GetBValue(Self.Color));
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  lblSystemName.Transparent := True;
  lblSystemDescription.Transparent := True;
end;

initialization
  TFormularios.RegisterForm('FrmLogin', TFrmLogin);

end.
