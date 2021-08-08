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

  // Table
  TControllerGrupoFornecedor = class(TController, IControllerCustom)
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

  // View
  TControllerTipoCNPJView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerTipoComissaoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerBancoFebrabanView = class(TController, IControllerCustom)
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

{ TControllerGrupoFornecedor }

constructor TControllerGrupoFornecedor.Create;
begin
  inherited Create(TModelDAOFactory.New.GrupoFornecedor);
end;

destructor TControllerGrupoFornecedor.Destroy;
begin
  inherited;
end;

class function TControllerGrupoFornecedor.New: IControllerCustom;
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

{ TControllerTipoCNPJView }

constructor TControllerTipoCNPJView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoCNPJView);
end;

destructor TControllerTipoCNPJView.Destroy;
begin
  inherited;
end;

class function TControllerTipoCNPJView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoComissaoView }

constructor TControllerTipoComissaoView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoComissaoView);
end;

destructor TControllerTipoComissaoView.Destroy;
begin
  inherited;
end;

class function TControllerTipoComissaoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerBancoFebrabanView }

constructor TControllerBancoFebrabanView.Create;
begin
  inherited Create(TModelDAOFactory.New.BancoFebrabanView);
end;

destructor TControllerBancoFebrabanView.Destroy;
begin
  inherited;
end;

class function TControllerBancoFebrabanView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
