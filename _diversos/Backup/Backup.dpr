program Backup;

uses
  Forms,
  SysUtils,
  Principal in 'Principal.pas' {frmPrincipal},
  Autenticacao in 'Autenticacao.pas' {frmAutenticacao},
  Sobre in 'Sobre.pas' {frmSobre},
  CopiarEColar in 'CopiarEColar.pas' {frmCopiarEColar};

{$R *.res}

begin
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
