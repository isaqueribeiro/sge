unit AgilServerREST.Controller.Factory;

interface

uses
  AgilServerREST.Controller.Interfaces,
  AgilServerREST.Model.Configuracao;

type
  TControllerFactory = class
    private
      FConfiguracao : IControllerConfiguracao<TConfiguracao>;
    public
      constructor Create;
      function Configuracao : IControllerConfiguracao<TConfiguracao>;
  end;

var
  _ControllerFactory : TControllerFactory;

implementation

uses
  AgilServerREST.Controller.Configuracao;

{ TControllerFactory }

function TControllerFactory.Configuracao: IControllerConfiguracao<TConfiguracao>;
begin
  if not Assigned(FConfiguracao) then
    FConfiguracao := TControllerConfiguracao.New;

  Result := FConfiguracao;
end;

constructor TControllerFactory.Create;
begin
  ReportMemoryLeaksOnShutdown := True;
end;

initialization
  _ControllerFactory := TControllerFactory.Create;

finalization
  _ControllerFactory.DisposeOf;

end.
