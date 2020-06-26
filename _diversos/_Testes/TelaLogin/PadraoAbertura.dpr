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
  Classe.Conexao in 'Classe.Conexao.pas',
  Interacao.Usuario in 'Interacao.Usuario.pas',
  Interacao.Pessoa in 'Interacao.Pessoa.pas',
  Classe.PessoaFisica in 'Classe.PessoaFisica.pas',
  Classe.PessoaJuridica in 'Classe.PessoaJuridica.pas',
  Interacao.Funcao in 'Interacao.Funcao.pas',
  Classe.Funcao in 'Classe.Funcao.pas',
  Interacao.Conexao in 'Interacao.Conexao.pas',
  Controller.Versao in 'Controller.Versao.pas',
  Interacao.Versao in 'Interacao.Versao.pas',
  Interacao.PersonalizaEmpresa in 'Interacao.PersonalizaEmpresa.pas',
  Controller.PersonalizaEmpresa in 'Controller.PersonalizaEmpresa.pas',
  Interacao.Licenca in 'Interacao.Licenca.pas',
  Classe.Licenca in 'Classe.Licenca.pas',
  Controller.Licenca in 'Controller.Licenca.pas',
  Controller.Factory in 'Controller.Factory.pas',
  Interacao.Factory in 'Interacao.Factory.pas';

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
