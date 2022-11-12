unit Controller.FactoryApp;

interface

uses
  Controller.Interfaces,
  Controller.UsuarioApp,
  Controller.ClienteApp,
  Model.Usuario,
  Model.Cliente;

type
  IControllerFactoryApp = interface
    ['{4A528C7C-37F3-4A6B-93DF-8C10BE48F6DF}']
    function Usuario : IControllerUsuario<TControllerUsuarioApp>;
    function Cliente : IControllerCliente<TControllerClienteApp>;
  end;

  TControllerFactoryApp = class(TInterfacedObject, IControllerFactoryApp)
    strict private
      class var _instance : IControllerFactoryApp;
    private
      FUsuario : IControllerUsuario<TControllerUsuarioApp>;
      FCliente : IControllerCliente<TControllerClienteApp>;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactoryApp;

      function Usuario : IControllerUsuario<TControllerUsuarioApp>;
      function Cliente : IControllerCliente<TControllerClienteApp>;
  end;

implementation

{ TControllerFactoryApp }

constructor TControllerFactoryApp.Create;
begin
  ;
end;

destructor TControllerFactoryApp.Destroy;
begin
  inherited;
end;

class function TControllerFactoryApp.New: IControllerFactoryApp;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TControllerFactoryApp.Cliente: IControllerCliente<TControllerClienteApp>;
begin
  if not Assigned(FCliente) then
    FCliente := TControllerClienteApp.New;

  Result := FCliente;
end;

function TControllerFactoryApp.Usuario : IControllerUsuario<TControllerUsuarioApp>;
begin
  if not Assigned(FUsuario) then
    FUsuario := TControllerUsuarioApp.New;

  Result := FUsuario;
end;

end.
