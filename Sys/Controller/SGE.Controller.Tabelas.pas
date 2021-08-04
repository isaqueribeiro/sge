unit SGE.Controller.Tabelas;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerSegmento = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerTipoRegimeView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerSegmento }

constructor TControllerSegmento.Create;
begin
  inherited Create(TModelDAOFactory.New.Segmento);
end;

destructor TControllerSegmento.Destroy;
begin
  inherited;
end;

class function TControllerSegmento.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoRegimeView }

constructor TControllerTipoRegimeView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoRegimeView);
end;

destructor TControllerTipoRegimeView.Destroy;
begin
  inherited;
end;

class function TControllerTipoRegimeView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
