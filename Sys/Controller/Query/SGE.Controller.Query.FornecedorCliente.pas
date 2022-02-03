unit SGE.Controller.Query.FornecedorCliente;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.Query;

type
  TControllerQueryFornecedorCliente = class(TControllerQuery)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;
  end;

implementation

{ TControllerQueryFornecedorCliente }

uses
  SGE.Model.DAO.Query.Factory;

constructor TControllerQueryFornecedorCliente.Create;
begin
  inherited Create(TModelDAOQueryFactory.Instance.FornecedorCliente);
end;

destructor TControllerQueryFornecedorCliente.Destroy;
begin
  inherited;
end;

class function TControllerQueryFornecedorCliente.New: IControllerQuery;
begin
  Result := Self.Create;
end;

end.
