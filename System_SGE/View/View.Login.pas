unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.PadraoLogin, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFrmLogin = class(TFrmPadraoLogin)
    imgLogo: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

end.
