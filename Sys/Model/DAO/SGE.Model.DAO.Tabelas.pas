unit SGE.Model.DAO.Tabelas;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOSegmento = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Table
  TModelDAOGrupoFornecedor = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOTipoRegimeView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOTipoCNPJView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOTipoComissaoView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOBancoFebrabanView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOLayoutRemessaBancoView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Alíquota (View)
  TModelDAOTipoAliquotaView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Tributação
  TModelDAOTipoTributacao = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Alíquota PIS (View)
  TModelDAOAliquotaPISView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Alíquota COFINS (View)
  TModelDAOAliquotaCOFINSView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Alíquota ICMS (Stored Procedure)
  TModelDAOAliquotaICMS = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOSegmento }

constructor TModelDAOSegmento.Create;
const
  SCRIPT_SQL = 'Execute Procedure SET_SEGMENTO(%d, ''%s'')';
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBSEGMENTO')
      .KeyFields('seg_id')
      .SQL
        .Clear
        .Add('Select')
        .Add('    s.seg_id  ')
        .Add('  , s.seg_descricao ')
        .Add('from TBSEGMENTO s')
      .&End
      .Open;

  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_PADRAO_ID,          SEGMENTO_PADRAO_DS]));
  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_VAREJO_ATACADO_ID,  SEGMENTO_VAREJO_ATACADO_DS]));
  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_MERCADO_CARRO_ID,   SEGMENTO_MERCADO_CARRO_DS]));
  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_SERVICOS_ID,        SEGMENTO_SERVICOS_DS]));
  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_VAREJO_SERVICOS_ID, SEGMENTO_VAREJO_SERVICOS_DS]));
  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_METAL_DS]));
  FConn.ExecuteSQL(Format(SCRIPT_SQL, [SEGMENTO_INDUSTRIA_GERAL_ID, SEGMENTO_INDUSTRIA_GERAL_DS]));

  FConn.Query.DataSet.Close;
  FConn.Query.Open;
end;

destructor TModelDAOSegmento.Destroy;
begin
  inherited;
end;

class function TModelDAOSegmento.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOSegmento.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOGrupoFornecedor }

constructor TModelDAOGrupoFornecedor.Create;
var
  grupoFornecedor : TGrupoFornecedor;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBFORNECEDOR_GRUPO')
      .KeyFields('grf_cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    g.grf_cod  ')
        .Add('  , g.grf_descricao ')
        .Add('from TBFORNECEDOR_GRUPO g')
      .&End
      .Open;

  // Inserir grupos de fornecedores padrões
  FConn.Query.DataSet.DisableControls;
  try
    for grupoFornecedor := Low(SYS_GRUPOS_FORNECEDOR) to High(SYS_GRUPOS_FORNECEDOR) do
    begin
      if (not FConn.Query.DataSet.Locate('grf_cod', Ord(grupoFornecedor), [])) then
      begin
        FConn.Query.DataSet.Append;
        FConn.Query.DataSet.FieldByName('grf_cod').AsInteger := Ord(grupoFornecedor);
        FConn.Query.DataSet.FieldByName('grf_descricao').AsString  := SYS_GRUPOS_FORNECEDOR[grupoFornecedor];
        FConn.Query.DataSet.Post;
        FConn.Query.ApplyUpdates;
      end;
    end;
  finally
    FConn.Query.DataSet.First;
    FConn.Query.DataSet.EnableControls;
  end;
end;

destructor TModelDAOGrupoFornecedor.Destroy;
begin
  inherited;
end;

class function TModelDAOGrupoFornecedor.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOGrupoFornecedor.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoRegimeView }

constructor TModelDAOTipoRegimeView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.codigo   ')
        .Add('  , t.descricao')
        .Add('from VW_TIPO_REGIME_NFE t')
      .&End
      .Open;
end;

destructor TModelDAOTipoRegimeView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoRegimeView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;


function TModelDAOTipoRegimeView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoCNPJView }

constructor TModelDAOTipoCNPJView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.codigo   ')
        .Add('  , t.descricao')
        .Add('from VW_TIPO_CNPJ t')
      .&End
    .Open;
end;

destructor TModelDAOTipoCNPJView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoCNPJView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoCNPJView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoComissaoView }

constructor TModelDAOTipoComissaoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.codigo   ')
        .Add('  , t.descricao')
        .Add('from VW_TIPO_COMISSAO t')
      .&End
    .Open;
end;

destructor TModelDAOTipoComissaoView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoComissaoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoComissaoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOBancoFebrabanView }

constructor TModelDAOBancoFebrabanView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    b.codigo     ')
        .Add('  , b.nome       ')
        .Add('  , b.codigo_nome')
        .Add('  , b.nome_codigo')
        .Add('from VW_BANCO_FEBRABAN b')
        .Add('order by  ')
        .Add('    b.nome')
      .&End
    .Open;
end;

destructor TModelDAOBancoFebrabanView.Destroy;
begin
  inherited;
end;

class function TModelDAOBancoFebrabanView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOBancoFebrabanView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOLayoutRemessaBancoView }

constructor TModelDAOLayoutRemessaBancoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    l.codigo    ')
        .Add('  , l.descricao ')
        .Add('from VW_LAYOUT_REM_RET_BANCO l')
      .&End
    .Open;
end;

destructor TModelDAOLayoutRemessaBancoView.Destroy;
begin
  inherited;
end;

class function TModelDAOLayoutRemessaBancoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOLayoutRemessaBancoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoAliquotaView }

constructor TModelDAOTipoAliquotaView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    codigo    ')
        .Add('  , descricao ')
        .Add('  , tipo      ')
        .Add('from VW_TIPO_ALIQUOTA')
      .&End
    .Open;
end;

destructor TModelDAOTipoAliquotaView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoAliquotaView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoAliquotaView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoTributacao }

constructor TModelDAOTipoTributacao.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Tpt_cod      ')
        .Add('  , t.Tpt_descricao')
        .Add('  , t.Tpt_cod || '' - '' || t.Tpt_descricao as Tpt_descricao_full')
        .Add('  , t.Tpt_sigla')
        .Add('  , t.Crt      ')
        .Add('  , coalesce(t.obrigar_cest, 0) as obrigar_cest')
        .Add('from TBTRIBUTACAO_TIPO t                       ')
        .Where('coalesce(t.obrigar_cest, 0) = 0')
        .OrderBy('t.Crt')
        .OrderBy('t.Tpt_cod')
      .&End
    .OpenEmpty
    .CloseEmpty;
end;

destructor TModelDAOTipoTributacao.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoTributacao.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoTributacao.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOAliquotaPISView }

constructor TModelDAOAliquotaPISView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    codigo    ')
        .Add('  , descricao ')
        .Add('  , descricao_full')
        .Add('  , indice_acbr   ')
        .Add('from VW_ALIQUOTA_PIS')
      .&End
    .Open;
end;

destructor TModelDAOAliquotaPISView.Destroy;
begin
  inherited;
end;

class function TModelDAOAliquotaPISView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOAliquotaPISView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOAliquotaCOFINSView }

constructor TModelDAOAliquotaCOFINSView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    codigo    ')
        .Add('  , descricao ')
        .Add('  , descricao_full')
        .Add('  , indice_acbr   ')
        .Add('from VW_ALIQUOTA_COFINS')
      .&End
    .Open;
end;

destructor TModelDAOAliquotaCOFINSView.Destroy;
begin
  inherited;
end;

class function TModelDAOAliquotaCOFINSView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOAliquotaCOFINSView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOAliquotaICMS }

constructor TModelDAOAliquotaICMS.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select first 1')
        .Add('    icms.aliquota_inter')
        .Add('  , icms.aliquota_intra')
        .Add('  , icms.aliquota_st   ')
        .Add('from GET_ALIQUOTA_ICMS(:uf_origem, :uf_destino) icms')
      .&End
      .ParamByName('uf_origem',  EmptyStr)
      .ParamByName('uf_destino', EmptyStr)
    .Open;
end;

destructor TModelDAOAliquotaICMS.Destroy;
begin
  inherited;
end;

class function TModelDAOAliquotaICMS.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
