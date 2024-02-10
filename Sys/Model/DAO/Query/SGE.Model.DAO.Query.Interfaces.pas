unit SGE.Model.DAO.Query.Interfaces;

interface

uses
  SGE.Model.DAO.Interfaces;

type
  IModelDAOQueryFactory = interface
    ['{DFF921EE-C08C-4349-9F6E-19FE5537945B}']
    function ApropriacaoEstoqueGrupo : IModelDAOQueryApropriacaoEstoque;
    function ApropriacaoEstoqueFabricante : IModelDAOQueryApropriacaoEstoque;
    function ApropriacaoEstoqueProduto : IModelDAOQueryApropriacaoEstoque;
    function ApropriacaoEstoqueTotal : IModelDAOQueryApropriacaoEstoque;
    function FornecedorCliente : IModelDAOQuery;
    function Caixa : IModelDAOQuery;
    function CaixaMovimento : IModelDAOQuery;
    function ContaAPagar : IModelDAOQuery;
    function ContaAReceber : IModelDAOQuery;
  end;

implementation

end.
