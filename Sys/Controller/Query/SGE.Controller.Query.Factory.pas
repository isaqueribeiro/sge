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
      FFornecedorCliente : IControllerQuery;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function Instance : IControllerQueryFactory;

      function FornecedorCliente : IControllerQuery;
  end;

implementation

{ TControllerQueryFactory }

uses
  SGE.Controller.Query.FornecedorCliente;

constructor TControllerQueryFactory.Create;
begin
  ;
end;

destructor TControllerQueryFactory.Destroy;
begin
  inherited;
end;

function TControllerQueryFactory.FornecedorCliente: IControllerQuery;
begin
  if not Assigned(FFornecedorCliente) then
    FFornecedorCliente := TControllerQueryFornecedorCliente.New;

  Result := FFornecedorCliente;
end;

class function TControllerQueryFactory.Instance: IControllerQueryFactory;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

end.

