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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses
  FuncoesFormulario;

{$R *.dfm}

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  imgLogo.BringToFront;
  // Inverter cor
  //lblSystemName.Font.Color := RGB(255 - GetRValue(Self.Color), 255 - GetGValue(Self.Color), 255 - GetBValue(Self.Color));
end;

initialization
  TFormularios.RegisterForm('FrmLogin', TFrmLogin);

end.
