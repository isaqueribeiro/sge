unit Controller.Usuario;

interface

Uses
  Classe.Usuario, Interacao.Conexao, Interacao.Usuario;

type
  TUsuarioController = class(TInterfacedObject, IUsuario)
    strict private
      class var _instancia : TUsuarioCOntroller;
    private
      [weak]
      FConexao : IConexao;
      FModel   : IUsuarioModel;
    protected
      constructor Create();
      destructor Destroy();
    public
      function Conexao(const Value : IConexao) : IUsuario;
      function Load(aLogin : String) : IUsuario; overload;

      function Autenticar : Boolean; overload;
      function Autenticar(aLogin, aSenha, aEmpresa : String) : Boolean; overload;
      function Autenticar(aUsuario : IUsuarioModel) : Boolean; overload;

      function getLogin() : String;

      class function GetInstance() : TUsuarioController;
  end;

implementation

{ TUsuarioCOntroller }

function TUsuarioController.Load(aLogin: String): IUsuario;
begin
  Result := Self;
end;

function TUsuarioCOntroller.Autenticar: Boolean;
begin
  Result := False;
end;

function TUsuarioCOntroller.Autenticar(aLogin, aSenha, aEmpresa: String): Boolean;
begin
  FModel
    .Login(aLogin)
    .Senha(aSenha)
    .Empresa(aEmpresa);

  Result := False;
end;

function TUsuarioCOntroller.Autenticar(aUsuario: IUsuarioModel): Boolean;
begin
  FModel := aUsuario;
  Result := False;
end;

function TUsuarioController.Conexao(const Value: IConexao): IUsuario;
begin
  Result   := Self;
  FConexao := Value;
end;

constructor TUsuarioCOntroller.Create;
begin
  inherited Create;
  FModel := TUsuario.New;
end;

destructor TUsuarioCOntroller.Destroy;
begin
  TUsuario(FModel).DisposeOf;
  inherited Destroy;
end;

function TUsuarioController.getLogin: String;
begin
  Result := FModel.Login;
end;

class function TUsuarioController.GetInstance: TUsuarioController;
begin
  if not Assigned(_instancia) then
    _instancia := TUsuarioCOntroller.Create();

  Result := _instancia;
end;

end.
