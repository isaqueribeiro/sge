unit Controller.Factory;

interface

Uses
  Controller.Usuario;

type
  TControllerFactory = class
    private
    public
      function UsuarioControler : TUsuarioCOntroller;
  end;

implementation

{ TControllerFactory }

function TControllerFactory.UsuarioControler: TUsuarioCOntroller;
begin
  Result := TUsuarioCOntroller.Instance();
end;

end.
