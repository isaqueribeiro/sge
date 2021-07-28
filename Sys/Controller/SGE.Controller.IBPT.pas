unit SGE.Controller.IBPT;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerIBPT = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  TControllerTabelaIBPT = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  TControllerNivelIBPT = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerIBPT }

constructor TControllerIBPT.Create;
begin
  inherited Create(TModelDAOFactory.New.IBPT);
end;

destructor TControllerIBPT.Destroy;
begin
  inherited;
end;

class function TControllerIBPT.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTabelaIBPT }

constructor TControllerTabelaIBPT.Create;
begin
  inherited Create(TModelDAOFactory.New.TabelaIBPT);
end;

destructor TControllerTabelaIBPT.Destroy;
begin
  inherited;
end;

class function TControllerTabelaIBPT.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerNivelIBPT }

constructor TControllerNivelIBPT.Create;
begin
  inherited Create(TModelDAOFactory.New.NivelIBPT);
end;

destructor TControllerNivelIBPT.Destroy;
begin
  inherited;
end;

class function TControllerNivelIBPT.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
