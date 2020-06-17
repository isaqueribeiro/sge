unit Interacao.Usuario;

interface

type
  IUsuario = interface
    ['{78704687-CA14-4235-A460-8373A947E15A}']
    function Autenticar : Boolean; overload;
    function Autenticar(aLogin, aSenha, aEmpresa : String) : Boolean; overload;
  end;

implementation

end.
