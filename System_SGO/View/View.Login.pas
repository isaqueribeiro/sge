unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.PadraoLogin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, dxGDIPlusClasses;

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
  UDMBusiness;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  imgLogo.BringToFront;
  // Inverter cor
  //lblSystemName.Font.Color := RGB(255 - GetRValue(Self.Color), 255 - GetGValue(Self.Color), 255 - GetBValue(Self.Color));

  lblSystemName.Transparent := False;
  lblSystemDescription.Transparent := False;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  lblSystemName.Transparent := True;
  lblSystemDescription.Transparent := True;
end;

initialization
  FormFunction.RegisterForm('FrmLogin', TFrmLogin);

end.
