unit SGE.Controller.Vendedor;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerVendedor = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerVendedor }

constructor TControllerVendedor.Create;
begin
  inherited Create(TModelDAOFactory.New.Vendedor);
end;

destructor TControllerVendedor.Destroy;
begin
  inherited;
end;

class function TControllerVendedor.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
