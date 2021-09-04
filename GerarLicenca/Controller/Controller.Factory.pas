unit Controller.Factory;

interface

uses
  Controller.Interfaces,
  Controller.Usuario,
  Model.Usuario;

type
  IControllerFactory = interface
    ['{4A528C7C-37F3-4A6B-93DF-8C10BE48F6DF}']
    function Usuario : IControllerUsuario<TControllerUsuario>;
  end;

  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    strict private
      class var _instance : IControllerFactory;
    private
      FUsuario : IControllerUsuario<TControllerUsuario>;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactory;

      function Usuario : IControllerUsuario<TControllerUsuario>;
  end;

implementation

{ TControllerFactory }

constructor TControllerFactory.Create;
begin
  ;
end;

destructor TControllerFactory.Destroy;
begin
  inherited;
end;

class function TControllerFactory.New: IControllerFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TControllerFactory.Usuario : IControllerUsuario<TControllerUsuario>;
begin
  if not Assigned(FUsuario) then
    FUsuario := TControllerUsuario.New;

  Result := FUsuario;
end;

end.
