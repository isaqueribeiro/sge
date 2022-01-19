unit SGE.Controller.Tabelas;

interface

uses
  System.SysUtils,
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

  // Tabela de Competências (Table)
  TControllerCompetencia = class(TController, IControllerCompetencia)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCompetencia;

      function GetID(aDataMovimento : TDateTime) : Integer;
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

  // Forma de Devolução (View)
  TControllerFormaDevolucao = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Modelos de Cupons Fiscais (View)
  TControllerModeloCupomFiscal = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Alíquota ICMS (Stored Procedure)
  TControllerAliquotaICMS = class(TController, IControllerAliquotaICMS)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerAliquotaICMS;

      procedure AliquotaIcms(const UF_Origem, UF_Destino : String; var aAliquotaInter, aAliquotaIntra, aAliquotaST : Currency);
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

{ TControllerAliquotaICMS }

constructor TControllerAliquotaICMS.Create;
begin
  inherited Create(TModelDAOFactory.New.AliquotaICMS);
end;

destructor TControllerAliquotaICMS.Destroy;
begin
  inherited;
end;

class function TControllerAliquotaICMS.New: IControllerAliquotaICMS;
begin
  Result := Self.Create;
end;

procedure TControllerAliquotaICMS.AliquotaIcms(const UF_Origem, UF_Destino: String; var aAliquotaInter, aAliquotaIntra,
  aAliquotaST: Currency);
begin
  FDAO.DataSet.Close;

  FDAO
    .ParamsByName('uf_origem',  UF_Origem)
    .ParamsByName('uf_destino', UF_Destino)
    .Open;

  aAliquotaInter := FDAO.DataSet.FieldByName('aliquota_inter').AsCurrency;  // ICMS do proprio Estado
  aAliquotaIntra := FDAO.DataSet.FieldByName('aliquota_intra').AsCurrency;  // ICMS do Estado de destino
  aAliquotaST    := FDAO.DataSet.FieldByName('aliquota_st').AsCurrency;     // ICMS de destino (quando o produto sai do Estado)

  FDAO.DataSet.Close;
end;

{ TControllerFormaDevolucao }

constructor TControllerFormaDevolucao.Create;
begin
  inherited Create(TModelDAOFactory.New.FormaDevolucao);
end;

destructor TControllerFormaDevolucao.Destroy;
begin
  inherited;
end;

class function TControllerFormaDevolucao.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCompetencia }

constructor TControllerCompetencia.Create;
begin
  inherited Create(TModelDAOFactory.New.Competencia);
end;

destructor TControllerCompetencia.Destroy;
begin
  inherited;
end;

function TControllerCompetencia.GetID(aDataMovimento: TDateTime): Integer;
var
  aID : Integer;
  aDescricao : String;
begin
  aID := StrToInt(FormatDateTime('YYYYMM', aDataMovimento));
  aDescricao := AnsiUpperCase(FormatDateTime('MMM/YYYY', aDataMovimento));

  FDAO.ExecuteScriptSQL('Execute Procedure SET_COMPETENCIA(' + aID.ToString + ', ' + aDescricao.QuotedString + ')');
  FDAO.CommitTransaction;

  Result := aID;
end;

class function TControllerCompetencia.New: IControllerCompetencia;
begin
  Result := Self.Create;
end;

{ TControllerModeloCupomFiscal }

constructor TControllerModeloCupomFiscal.Create;
begin
  inherited Create(TModelDAOFactory.New.ModeloCupomFiscalView);
end;

destructor TControllerModeloCupomFiscal.Destroy;
begin
  inherited;
end;

class function TControllerModeloCupomFiscal.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
