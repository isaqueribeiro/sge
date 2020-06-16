program PadraoAbertura;

uses
  System.SysUtils,
  Vcl.Forms,
  UGrPadraoAbertura in 'UGrPadraoAbertura.pas' {FrmPadraoAbertura},
  UAbertura in 'UAbertura.pas' {FrmAbertura},
  UPadraoLogin in 'UPadraoLogin.pas' {FrmPadraoLogin},
  Classe.Usuario in 'Classe.Usuario.pas',
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Controller.Usuario in 'Controller.Usuario.pas',
  Classe.Conexao in 'Classe.Conexao.pas';

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
