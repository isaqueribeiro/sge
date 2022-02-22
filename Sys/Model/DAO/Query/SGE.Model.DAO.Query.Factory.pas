unit SGE.Model.DAO.Query.Factory;

interface

uses
  SGE.Model.DAO.Query.Interfaces,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryFactory = class (TInterfacedObject, IModelDAOQueryFactory)
    strict private
      class var _instance : IModelDAOQueryFactory;
    private
      FFornecedorCliente,
      FContaAPagar      : IModelDAOQuery;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function Instance : IModelDAOQueryFactory;

      function FornecedorCliente : IModelDAOQuery;
      function ContaAPagar : IModelDAOQuery;
  end;

implementation

{ TModelDAOQueryFactory }

uses
  SGE.Model.DAO.Query.FornecedorCliente,
  SGE.Model.DAO.Query.ContaAPagar;

constructor TModelDAOQueryFactory.Create;
begin
  ;
end;

destructor TModelDAOQueryFactory.Destroy;
begin
  inherited;
end;

class function TModelDAOQueryFactory.Instance: IModelDAOQueryFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TModelDAOQueryFactory.FornecedorCliente: IModelDAOQuery;
begin
  if not Assigned(FFornecedorCliente) then
    FFornecedorCliente := TModelDAOQueryFornecedorCliente.New;

  Result := FFornecedorCliente;
end;

function TModelDAOQueryFactory.ContaAPagar: IModelDAOQuery;
begin
  if not Assigned(FContaAPagar) then
    FContaAPagar := TModelDAOQueryContaAPagar.New;

  Result := FContaAPagar;
end;

end.
