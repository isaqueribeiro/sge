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
      FFornecedorCliente : IModelDAOQuery;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function Instance : IModelDAOQueryFactory;

      function FornecedorCliente : IModelDAOQuery;
  end;

implementation

{ TModelDAOQueryFactory }

uses
  SGE.Model.DAO.Query.FornecedorCliente;

constructor TModelDAOQueryFactory.Create;
begin
  ;
end;

destructor TModelDAOQueryFactory.Destroy;
begin
  inherited;
end;

function TModelDAOQueryFactory.FornecedorCliente: IModelDAOQuery;
begin
  if not Assigned(FFornecedorCliente) then
    FFornecedorCliente := TModelDAOQueryFornecedorCliente.New;

  Result := FFornecedorCliente;
end;

class function TModelDAOQueryFactory.Instance: IModelDAOQueryFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

end.
