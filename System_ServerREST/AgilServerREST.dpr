program AgilServerREST;

uses
  System.StartUpCopy,
  FMX.Forms,
  SGE.Assets.Style in '..\Sys\View\Assets\SGE.Assets.Style.pas',
  AgilServerREST.DataModule.RDWService in 'DataModule\AgilServerREST.DataModule.RDWService.pas' {RDWService: TDataModule},
  AgilServerREST.View.Principal in 'View\AgilServerREST.View.Principal.pas' {ViewPrincipal},
  AgilServerREST.Model.Configuracao in 'Model\AgilServerREST.Model.Configuracao.pas',
  AgilServerREST.Controller.Configuracao in 'Controller\AgilServerREST.Controller.Configuracao.pas',
  AgilServerREST.Controller.Interfaces in 'Controller\AgilServerREST.Controller.Interfaces.pas',
  AgilServerREST.Controller.Factory in 'Controller\AgilServerREST.Controller.Factory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
