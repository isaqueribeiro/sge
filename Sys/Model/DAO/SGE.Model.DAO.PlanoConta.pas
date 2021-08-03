unit SGE.Model.DAO.PlanoConta;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOPlanoConta = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet : TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOPlanoContaNivel = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // View
  TModelDAOPlanoContaTipo = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOPlanoConta }

constructor TModelDAOPlanoConta.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBPLANO_CONTA')
      .KeyFields('codigo')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_PLANO_CONTA')
      .SQL
        .Clear
        .Add('Select')
        .Add('    p.codigo   ')
        .Add('  , p.exercicio')
        .Add('  , p.empresa  ')
        .Add('  , p.grupo    ')
        .Add('  , p.nivel    ')
        .Add('  , p.tipo     ')
        .Add('  , p.codigo_contabil   ')
        .Add('  , p.codigo_resumido   ')
        .Add('  , p.descricao_resumida')
        .Add('  , p.descricao_completa')
        .Add('  , p.situacao          ')
        .Add('  , t.descricao as tipo_descricao             ')
        .Add('  , coalesce(e.rzsoc,  ''(Todas)'') as razao    ')
        .Add('  , coalesce(e.nmfant, ''(Todas)'') as fantasia ')
        .Add('  , Case when p.situacao = 1 then ''X'' else ''.'' end as ativo')
        .Add('from TBPLANO_CONTA p ')
        .Add('  left join VW_TIPO_PLANO_CONTA t on (t.codigo = p.tipo) ')
        .Add('  left join TBEMPRESA e on (e.cnpj = p.empresa)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOPlanoConta.Destroy;
begin
  inherited;
end;

class function TModelDAOPlanoConta.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOPlanoConta.SetProviderFlags;
begin
  // Configurar campos para a geração de Insert e Update
  FConn.Query.DataSet.FieldByName('tipo_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('razao').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('fantasia').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('ativo').ProviderFlags    := [];
end;

function TModelDAOPlanoConta.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    p.codigo')
        .Add('  , p.descricao_resumida')
        .Add('  , p.codigo_contabil')
        .Add('  , coalesce(nullif(trim(p.codigo_contabil), '''') || '' - '', '''') || p.descricao_resumida as descricao_resumida_geral')
        .Add('  , p.nivel')
        .Add('  , p.empresa')
        .Add('from TBPLANO_CONTA p')
        .Add('order by')
        .Add('    4')
      .&End
    .Open;
end;

procedure TModelDAOPlanoConta.DataSetBeforePost(DataSet: TDataSet);
begin
  SetProviderFlags;
  with FConn.Query.DataSet do
  begin
    if Trim(FieldByName('empresa').AsString) = EmptyStr then
      FieldByName('empresa').Clear;

    if FieldByName('grupo').AsLargeInt = 0 then
      FieldByName('grupo').Clear;
  end;
end;

procedure TModelDAOPlanoConta.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('TIPO').AsInteger      := 0;
    FieldByName('SITUACAO').AsInteger  := 1;
    FieldByName('EXERCICIO').AsInteger := 0;
    FieldByName('EMPRESA').Clear;
    FieldByName('NIVEL').Clear;
    FieldByName('GRUPO').Clear;
    FieldByName('CODIGO_CONTABIL').Clear;
    FieldByName('CODIGO_RESUMIDO').Clear;
  end;
end;

{ TModelDAOPlanoContaNivel }

constructor TModelDAOPlanoContaNivel.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    n.codigo   ')
        .Add('  , n.descricao')
        .Add('from VW_NIVEL_PLANO_CONTA n')
      .&End
    .Open;
end;

function TModelDAOPlanoContaNivel.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

destructor TModelDAOPlanoContaNivel.Destroy;
begin
  inherited;
end;

class function TModelDAOPlanoContaNivel.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOPlanoContaTipo }

constructor TModelDAOPlanoContaTipo.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.codigo   ')
        .Add('  , t.descricao')
        .Add('from VW_TIPO_PLANO_CONTA t')
      .&End
    .Open;
end;

destructor TModelDAOPlanoContaTipo.Destroy;
begin
  inherited;
end;

class function TModelDAOPlanoContaTipo.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOPlanoContaTipo.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.

