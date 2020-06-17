unit Controller.Usuario;

interface

Uses
  Classe.Usuario, Interacao.Usuario;

type
  TUsuarioCOntroller = class(TInterfacedObject, IUsuario)
    strict private
      class var _instancia : TUsuarioCOntroller;
    private
      FUsuario : TUsuario;
    protected
      constructor Create();
      destructor Destroy();
    public
      function Autenticar : Boolean; overload;
      function Autenticar(aLogin, aSenha, aEmpresa : String) : Boolean; overload;
      function Model : TUsuario;

      class function Instance() : TUsuarioCOntroller;
  end;

implementation

{ TUsuarioCOntroller }

class function TUsuarioCOntroller.Instance: TUsuarioCOntroller;
begin
  if not Assigned(_instancia) then
    _instancia := TUsuarioCOntroller.Create();

  Result := _instancia;
end;

function TUsuarioCOntroller.Autenticar: Boolean;
begin
  Result := False;
end;

function TUsuarioCOntroller.Autenticar(aLogin, aSenha, aEmpresa: String): Boolean;
begin
  FUsuario.Login   := aLogin;
  FUsuario.Senha   := aSenha;
  FUsuario.Empresa := aEmpresa;

  Result := False;
end;

constructor TUsuarioCOntroller.Create;
begin
  inherited Create;
  FUsuario := TUsuario.Instanciar();
end;

destructor TUsuarioCOntroller.Destroy;
begin
  FUsuario.DisposeOf;
  inherited Destroy;
end;

function TUsuarioCOntroller.Model: TUsuario;
begin
  Result := Self.FUsuario;
end;

end.
