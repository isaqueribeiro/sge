unit SGE.Controller.CentroCusto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerCentroCusto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table Detail
  TControllerCentroCustoEmpresa = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCentroCusto }

constructor TControllerCentroCusto.Create;
begin
  inherited Create(TModelDAOFactory.New.CentroCusto);
end;

destructor TControllerCentroCusto.Destroy;
begin
  inherited;
end;

class function TControllerCentroCusto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCentroCustoEmpresa }

constructor TControllerCentroCustoEmpresa.Create;
begin
  inherited Create(TModelDAOFactory.New.CentroCustoEmpresa);
end;

destructor TControllerCentroCustoEmpresa.Destroy;
begin
  inherited;
end;

class function TControllerCentroCustoEmpresa.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
