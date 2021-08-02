unit SGE.Controller.PlanoConta;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerPlanoConta = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerPlanoContaNivel = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerPlanoContaTipo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerPlanoConta }

constructor TControllerPlanoConta.Create;
begin
  inherited Create(TModelDAOFactory.New.PlanoConta);
end;

destructor TControllerPlanoConta.Destroy;
begin
  inherited;
end;

class function TControllerPlanoConta.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerPlanoContaNivel }

constructor TControllerPlanoContaNivel.Create;
begin
  inherited Create(TModelDAOFactory.New.PlanoContaNivel);
end;

destructor TControllerPlanoContaNivel.Destroy;
begin
  inherited;
end;

class function TControllerPlanoContaNivel.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerPlanoContaTipo }

constructor TControllerPlanoContaTipo.Create;
begin
  inherited Create(TModelDAOFactory.New.PlanoContaTipo);
end;

destructor TControllerPlanoContaTipo.Destroy;
begin
  inherited;
end;

class function TControllerPlanoContaTipo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
