unit SGE.Controller.Query.Interfaces;

interface

uses
  SGE.Controller.Interfaces;

type
  IControllerQueryFactory = interface
    ['{E206301B-58A5-4CE4-BF0F-29B46F4851A2}']
    function FornecedorCliente : IControllerQuery;
    function ContaAPagar : IControllerQuery;
  end;

implementation

end.
