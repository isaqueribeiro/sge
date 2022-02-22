unit SGE.Controller.Query.Factory;

interface

uses
  SGE.Controller.Query.Interfaces,
  SGE.Controller.Interfaces;

type
  TControllerQueryFactory = class (TInterfacedObject, IControllerQueryFactory)
    strict private
      class var _instance : IControllerQueryFactory;
    private
      FFornecedorCliente,
      FContaAPagar      : IControllerQuery;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function Instance : IControllerQueryFactory;

      function FornecedorCliente : IControllerQuery;
      function ContaAPagar : IControllerQuery;
  end;

implementation

{ TControllerQueryFactory }

uses
  SGE.Controller.Query.FornecedorCliente,
  SGE.Controller.Query.ContaAPagar;

constructor TControllerQueryFactory.Create;
begin
  ;
end;

destructor TControllerQueryFactory.Destroy;
begin
  inherited;
end;

class function TControllerQueryFactory.Instance: IControllerQueryFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TControllerQueryFactory.ContaAPagar: IControllerQuery;
begin
  if not Assigned(FContaAPagar) then
    FContaAPagar := TControllerQueryContaAPagar.New;

  Result := FContaAPagar;
end;

function TControllerQueryFactory.FornecedorCliente: IControllerQuery;
begin
  if not Assigned(FFornecedorCliente) then
    FFornecedorCliente := TControllerQueryFornecedorCliente.New;

  Result := FFornecedorCliente;
end;

end.

