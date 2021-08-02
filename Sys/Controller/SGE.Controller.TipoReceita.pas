unit SGE.Controller.TipoReceita;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerTipoReceita = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table Detail
  TControllerTipoReceitaPlanoConta = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerClasseReceita = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerTipoReceita }

constructor TControllerTipoReceita.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoReceita);
end;

destructor TControllerTipoReceita.Destroy;
begin
  inherited;
end;

class function TControllerTipoReceita.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoReceitaPlanoConta }

constructor TControllerTipoReceitaPlanoConta.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoReceitaPlanoConta);
end;

destructor TControllerTipoReceitaPlanoConta.Destroy;
begin
  inherited;
end;

class function TControllerTipoReceitaPlanoConta.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerClasseReceita }

constructor TControllerClasseReceita.Create;
begin
  inherited Create(TModelDAOFactory.New.ClasseReceita);
end;

destructor TControllerClasseReceita.Destroy;
begin
  inherited;
end;

class function TControllerClasseReceita.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
