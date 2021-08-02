unit SGE.Controller.TipoDespesa;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerTipoDespesa = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table Detail
  TControllerTipoDespesaPlanoConta = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerClasseDespesa = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerTipoDespesa }

constructor TControllerTipoDespesa.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoDespesa);
end;

destructor TControllerTipoDespesa.Destroy;
begin
  inherited;
end;

class function TControllerTipoDespesa.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoDespesaPlanoConta }

constructor TControllerTipoDespesaPlanoConta.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoDespesaPlanoConta);
end;

destructor TControllerTipoDespesaPlanoConta.Destroy;
begin
  inherited;
end;

class function TControllerTipoDespesaPlanoConta.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerClasseDespesa }

constructor TControllerClasseDespesa.Create;
begin
  inherited Create(TModelDAOFactory.New.ClasseDespesa);
end;

destructor TControllerClasseDespesa.Destroy;
begin
  inherited;
end;

class function TControllerClasseDespesa.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
