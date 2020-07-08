unit Interacao.Funcao;

interface

type
  IFuncao = interface
    ['{04662C08-5747-4146-880A-8472AC60376B}']
    function Codigo(Value : Integer) : IFuncao; overload;
    function Codigo : Integer; overload;
    function Nome(Value : String) : IFuncao; overload;
    function Nome : String; overload;
  end;

implementation

end.
