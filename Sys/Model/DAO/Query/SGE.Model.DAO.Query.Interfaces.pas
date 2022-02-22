unit SGE.Model.DAO.Query.Interfaces;

interface

uses
  SGE.Model.DAO.Interfaces;

type
  IModelDAOQueryFactory = interface
    ['{DFF921EE-C08C-4349-9F6E-19FE5537945B}']
    function FornecedorCliente : IModelDAOQuery;
    function ContaAPagar : IModelDAOQuery;
  end;

implementation

end.
