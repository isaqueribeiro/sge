unit Interacao.Usuario;

interface

uses
  Interacao.Pessoa;

type
  IUsuarioModel = interface(IPessoaModel)
    ['{3902E5A3-2355-4D90-B132-385E69824E48}']
    function Login(const Value: String)    : IUsuarioModel;
    function Senha(const Value: String)    : IUsuarioModel;
    function Funcao(const Value: String)   : IUsuarioModel;
    function Empresa(const Value: String)  : IUsuarioModel;
    function Vendedor(const Value: IPessoaModel) : IPessoaModel;
    function Logado   : Boolean;
    function AlterarValorVenda : Boolean;
  end;

  IUsuario = interface
    ['{78704687-CA14-4235-A460-8373A947E15A}']
    function Autenticar : Boolean; overload;
    function Autenticar(aLogin, aSenha, aEmpresa : String) : Boolean; overload;
    function Autenticar(aUsuario : IUsuarioModel) : Boolean; overload;
  end;

implementation

end.
