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

  // View
  TControllerLayoutRemessaBancoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Alíquota (View)
  TControllerTipoAliquotaView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Tributação
  TControllerTipoTributacao = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Alíquota PIS (View)
  TControllerAliquotaPISView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Alíquota COFINS (View)
  TControllerAliquotaCOFINSView = class(TController, IControllerCustom)
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

{ TControllerLayoutRemessaBancoView }

constructor TControllerLayoutRemessaBancoView.Create;
begin
  inherited Create(TModelDAOFactory.New.LayoutRemessaBancoView);
end;

destructor TControllerLayoutRemessaBancoView.Destroy;
begin
  inherited;
end;

class function TControllerLayoutRemessaBancoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoAliquotaView }

constructor TControllerTipoAliquotaView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoAliquotaView);
end;

destructor TControllerTipoAliquotaView.Destroy;
begin
  inherited;
end;

class function TControllerTipoAliquotaView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoTributacao }

constructor TControllerTipoTributacao.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoTributacao);
end;

destructor TControllerTipoTributacao.Destroy;
begin
  inherited;
end;

class function TControllerTipoTributacao.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerAliquotaPISView }

constructor TControllerAliquotaPISView.Create;
begin
  inherited Create(TModelDAOFactory.New.AliquotaPISView);
end;

destructor TControllerAliquotaPISView.Destroy;
begin
  inherited;
end;

class function TControllerAliquotaPISView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerAliquotaCOFINSView }

constructor TControllerAliquotaCOFINSView.Create;
begin
  inherited Create(TModelDAOFactory.New.AliquotaCOFINSView);
end;

destructor TControllerAliquotaCOFINSView.Destroy;
begin
  inherited;
end;

class function TControllerAliquotaCOFINSView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
