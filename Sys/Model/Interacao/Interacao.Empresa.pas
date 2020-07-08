unit Interacao.Empresa;

interface

Uses
  System.SysUtils, System.Types, System.Generics.Collections, Interacao.Conexao, Interacao.Pessoa;

type
  IEmpresaModel = interface(IPessoaJuridicaModel)
    ['{D27E9304-D08C-442A-B971-503C04CC3073}']
    function Codigo(Value : Integer) : IEmpresaModel; overload;
    function Codigo : Integer; overload;

    function toString() : String;
  end;

  IEmpresa = interface
    ['{A0C7FDC9-267D-408B-9BE4-B089908886FA}']
    function Conexao(const Value : IConexao) : IEmpresa;
  end;

implementation

end.
