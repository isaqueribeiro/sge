unit Controller.Factory;

interface

Uses
  Controller.Usuario;

type
  TControllerFactory = class
    private
    public
      class function UsuarioControler : TUsuarioCOntroller;
  end;

implementation

{ TControllerFactory }

class function TControllerFactory.UsuarioControler: TUsuarioCOntroller;
begin
  Result := TUsuarioCOntroller.Instance();
end;

end.
