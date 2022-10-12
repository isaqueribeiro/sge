unit SGE.Controller.Query.Interfaces;

interface

uses
  SGE.Controller.Interfaces;

type
  IControllerQueryFactory = interface
    ['{E206301B-58A5-4CE4-BF0F-29B46F4851A2}']
    {$IFDEF SGI}
    function ApropriacaoEstoqueGrupo : IControllerQuery;
    function ApropriacaoEstoqueFabricante : IControllerQuery;
    function ApropriacaoEstoqueProduto : IControllerQuery;
    function ApropriacaoEstoqueTotal : IControllerQuery;
    {$ENDIF}
    function ContaAPagar : IControllerQuery;
    function ContaAReceber : IControllerQuery;
    function FornecedorCliente : IControllerQuery;
  end;

implementation

end.
