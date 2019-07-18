program TelaLogin;

uses
  Vcl.Forms,
  UPadraoLogin in 'UPadraoLogin.pas' {FrmPadraoLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPadraoLogin, FrmPadraoLogin);
  Application.Run;
end.
