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

  IPessoaFisicaModel = interface(IPessoaModel)
    ['{FC61E34B-C55E-4E13-BBBF-1D2B437B70CA}']
    function CPF(Value : String) : IPessoaFisicaModel; overload;
    function CPF : String; overload;
  end;

  IPessoaJuridicaModel = interface(IPessoaModel)
    ['{FC61E34B-C55E-4E13-BBBF-1D2B437B70CA}']
    function RazaoSocial(Value : String) : IPessoaJuridicaModel; overload;
    function RazaoSocial : String; overload;

    function Fantasia(Value : String) : IPessoaJuridicaModel; overload;
    function Fantasia : String; overload;

    function CNPJ(Value : String) : IPessoaJuridicaModel; overload;
    function CNPJ : String; overload;
  end;

implementation

end.
