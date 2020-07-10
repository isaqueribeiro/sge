unit Controller.Usuario;

interface

Uses
  FireDAC.Comp.Client, Classe.Usuario, Classe.Empresa, Interacao.Usuario, Interacao.Funcao;

type
  TUsuarioController = class(TInterfacedObject, IUsuario)
    strict private
      class var _instancia : TUsuarioCOntroller;
    private
      [weak]
      FModel   : IUsuarioModel;
    protected
      constructor Create();
      destructor Destroy();
    public
      function Load(aConn : TFDConnection; aLogin : String) : IUsuario; overload;

      function Autenticar : Boolean; overload;
      function Autenticar(aConn : TFDConnection; aLogin, aSenha, aEmpresa : String) : Boolean; overload;
      function Autenticar(aConn : TFDConnection; aLogin, aSenha : String; aEmpresa : TObject) : Boolean; overload;
      function Autenticar(aConn : TFDConnection; aUsuario : IUsuarioModel) : Boolean; overload;

      function getLogin() : String;

      class function GetInstance() : TUsuarioController;
  end;

implementation

{ TUsuarioCOntroller }

function TUsuarioController.Load(aConn : TFDConnection; aLogin: String): IUsuario;
var
  aQry : TFDQuery;
begin
  aQry := TFDQuery.Create(nil);
  try
    aQry.Connection  := aConn;
    aQry.Transaction := aConn.Transaction;

    with aQry do
    begin
      SQL.BeginUpdate;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    u.nome   as login');
      SQL.Add('  , u.senha');
      SQL.Add('  , u.nomecompleto as nome');
      SQL.Add('  , u.codfuncao as funcao');
      SQL.Add('  , f.funcao    as nome_funcao');
      SQL.Add('  , u.vendedor');
      SQL.Add('  , v.nome as nome_vendador');
      SQL.Add('  , v.cpf  as cpf_vendedor');
      SQL.Add('from TBUSERS u');
      SQL.Add('  left join TBFUNCAO f on (f.cod = u.codfuncao)');
      SQL.Add('  left join TBVENDEDOR v on (v.cod = u.vendedor)');
      SQL.Add('where (u.ativo = 1)');
      SQL.Add('  and (lower(u.nome) = lower(:login))');
      SQL.EndUpdate;

      ParamByName('login').AsString := aLogin;

      if OpenOrExecute then
      begin
        FModel.Nome( FieldByName('nome').AsString );
        FModel
          .Login( FieldByName('login').AsString )
          .Senha( FieldByName('senha').AsString )
          .Funcao( FieldByName('funcao').AsInteger )
          .Vendedor( FieldByName('vendedor').AsInteger );
      end;
    end;
  finally
    aQry.DisposeOf;
    Result := Self;
  end;
end;

function TUsuarioCOntroller.Autenticar: Boolean;
begin
  Result := True;
end;

function TUsuarioCOntroller.Autenticar(aConn : TFDConnection; aLogin, aSenha, aEmpresa: String): Boolean;
begin
  FModel
    .Login(aLogin)
    .Senha(aSenha)
    .Empresa(aEmpresa);

  Result := True;
end;

function TUsuarioCOntroller.Autenticar(aConn : TFDConnection; aUsuario: IUsuarioModel): Boolean;
begin
  FModel := aUsuario;
  Result := False;
end;

function TUsuarioController.Autenticar(aConn : TFDConnection; aLogin, aSenha: String; aEmpresa: TObject): Boolean;
begin
  if (aConn = nil) then
    Result := (FModel.Senha = aSenha)
  else
    Result := False;
//  FModel
//    .Login(aLogin)
//    .Senha(aSenha);
////    .Empresa( TEmpresa(aEmpresa) );
//
//  Result := True;
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
