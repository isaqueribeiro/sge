program GerarLicenca_v2;

uses
  Forms,
  UConstantesDGE in '..\Sys\UConstantesDGE.pas',
  Model.Usuario in 'Model\Model.Usuario.pas',
  Model.Cliente in 'Model\Model.Cliente.pas',
  Model.Endereco in 'Model\Model.Endereco.pas',
  Model.Licenca in 'Model\Model.Licenca.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  Controller.Factory in 'Controller\Controller.Factory.pas',
  Controller.Usuario in 'Controller\Controller.Usuario.pas',
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  GerarLicenca.View.Principal in 'View\GerarLicenca.View.Principal.pas' {ViewPrincipal},
  Service.Utils in '..\Sys\Services\Service.Utils.pas',
  GerarLicenca.View.Auth in 'View\GerarLicenca.View.Auth.pas' {ViewAuth};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gerar Licença de Uso';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
