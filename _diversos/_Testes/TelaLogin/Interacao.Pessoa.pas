unit Interacao.Pessoa;

interface

type
  IPessoaModel = interface
    ['{1052C985-1C95-43F7-B094-3C8267DD2582}']
    function Codigo(Value : Integer) : IPessoaModel; overload;
    function Codigo : Integer; overload;

    function Nome(Value : String) : IPessoaModel; overload;
    function Nome : String; overload;
  end;


implementation

end.
