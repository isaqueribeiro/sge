unit Interacao.Usuario;

interface

uses
  FireDAC.Comp.Client, Interacao.Pessoa, Interacao.Empresa, Interacao.Funcao;

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
    function Empresa(const Value: IEmpresaModel)  : IUsuarioModel; overload;
    function Empresa : IEmpresaModel; overload; // IEmpresaModel
    function CNPJ : String;
    function RazaoSocial : String;

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
    procedure LogOff;
    function Load(aConn : TFDConnection; aLogin : String) : IUsuario; overload;

    function Autenticar : Boolean; overload;
    function Autenticar(aConn : TFDConnection; aLogin, aSenha, aEmpresa : String) : Boolean; overload;
    function Autenticar(aConn : TFDConnection; aLogin, aSenha : String; aEmpresa : TObject) : Boolean; overload;
    function Autenticar(aConn : TFDConnection; aUsuario : IUsuarioModel) : Boolean; overload;

    function Logado : Boolean;
    function Login : String;
    function Nome : String;
    function Empresa : String;
    function Funcao : Integer;
    function Vendedor : Integer;
    function AlterarValorVenda : Boolean;
  end;

implementation

end.
