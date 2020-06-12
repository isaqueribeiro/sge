program PadraoAbertura;

uses
  System.SysUtils,
  Vcl.Forms,
  UGrPadraoAbertura in 'UGrPadraoAbertura.pas' {FrmPadraoAbertura},
  UAbertura in 'UAbertura.pas' {FrmAbertura},
  UPadraoLogin in 'UPadraoLogin.pas' {FrmPadraoLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmAbertura, FrmAbertura);

  Sleep(500);
  Application.CreateForm(TFrmPadraoLogin, FrmPadraoLogin);
  FrmPadraoLogin.Show;

  Application.Run;
end.
