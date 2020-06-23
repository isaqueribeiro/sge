unit Interacao.Usuario;

interface

uses
  Interacao.Pessoa, Interacao.Funcao;

type
  IUsuarioModel = interface(IPessoaModel)
    ['{3902E5A3-2355-4D90-B132-385E69824E48}']
    function Login(const Value: String)   : IUsuarioModel; overload;
    function Login : String; overload;

    function Senha(const Value: String)   : IUsuarioModel; overload;
    function Senha : String; overload;

    function Funcao(const Value: Integer)  : IUsuarioModel; overload;
    function Funcao(const Value: IFuncao)  : IUsuarioModel; overload;
    function Funcao : IFuncao; overload;

    function Empresa(const aCNPJ: String) : IUsuarioModel; overload;
    function Empresa(const Value: IPessoaJuridicaModel)  : IUsuarioModel; overload;
    function Empresa : IPessoaJuridicaModel; overload;

    function Vendedor(const aCodigo: Integer) : IUsuarioModel; overload;
    function Vendedor(const Value: IPessoaFisicaModel) : IUsuarioModel; overload;
    function Vendedor : IPessoaFisicaModel; overload;

    function Logado(const Value: Boolean)  : IUsuarioModel; overload;
    function Logado : Boolean; overload;

    function AlterarValorVenda(const Value: Boolean)  : IUsuarioModel; overload;
    function AlterarValorVenda : Boolean; overload;
  end;

  IUsuario = interface
    ['{78704687-CA14-4235-A460-8373A947E15A}']
    function Load(aLogin : String) : IUsuario; overload;

    function Autenticar : Boolean; overload;
    function Autenticar(aLogin, aSenha, aEmpresa : String) : Boolean; overload;
    function Autenticar(aUsuario : IUsuarioModel) : Boolean; overload;
  end;

implementation

end.
