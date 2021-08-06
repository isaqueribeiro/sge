unit SGE.Model.DAO.TipoReceita;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOTipoReceita = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Table Detail
  TModelDAOTipoReceitaPlanoConta = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // View
  TModelDAOClasseReceita = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOTipoReceita }

constructor TModelDAOTipoReceita.Create;
var
  aScriptSQL  : TStringList;
begin
  inherited Create;

  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('execute block');
    aScriptSQL.Add('as');
    aScriptSQL.Add('  declare variable cd Integer;');
    aScriptSQL.Add('begin');
    aScriptSQL.Add('  cd = ' + IntToStr(TIPO_RECEITA_PADRAO) + ';');
    aScriptSQL.Add('  if (not exists(');
    aScriptSQL.Add('    Select');
    aScriptSQL.Add('      r.tiporec');
    aScriptSQL.Add('    from TBTPRECEITA r');
    aScriptSQL.Add('    where (r.cod = :cd)');
    aScriptSQL.Add('       or (r.tiporec = ' + QuotedStr('SAÍDAS EM GERAL') + ')');
    aScriptSQL.Add('  )) then');
    aScriptSQL.Add('  begin');
    aScriptSQL.Add('    Insert into TBTPRECEITA (');
    aScriptSQL.Add('        cod');
    aScriptSQL.Add('      , classificacao');
    aScriptSQL.Add('      , tiporec');
    aScriptSQL.Add('      , tipo_particular');
    aScriptSQL.Add('      , plano_conta');
    aScriptSQL.Add('      , ativo');
    aScriptSQL.Add('    ) values (');
    aScriptSQL.Add('        :cd');  // Codigo
    aScriptSQL.Add('      , 0');    // Classificação
    aScriptSQL.Add('      , ' + QuotedStr('SAÍDAS EM GERAL') + ' ');
    aScriptSQL.Add('      , 0');    // Tipo particular
    aScriptSQL.Add('      , null'); // Plano de Contas
    aScriptSQL.Add('      , 1');    // Ativo
    aScriptSQL.Add('    );');
    aScriptSQL.Add('  end');
    aScriptSQL.Add('end');
    aScriptSQL.EndUpdate;

    FConn.ExecuteSQL(aScriptSQL.Text);
    FConn.CommitRetaining;
  finally
    aScriptSQL.DisposeOf;
  end;

  FConn
    .Query
      .TableName('TBTPRECEITA')
      .KeyFields('Cod')
      .AutoIncFields('Cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Cod')
        .Add('  , t.Tiporec')
        .Add('  , t.classificacao')
        .Add('  , t.Tipo_Particular')
        .Add('  , t.plano_conta')
        .Add('  , t.ativo')
        .Add('  , Case when t.Tipo_Particular = 1 then ''S'' else '''' end Tipo_Particular_Desc')
        .Add('  , coalesce(nullif(trim(p.codigo_contabil), '''') || '' - '', '''') || p.descricao_resumida as descricao_resumida')
        .Add('from TBTPRECEITA t')
        .Add('  left join TBTPRECEITA_PLANO x on (x.receita = t.cod and x.empresa = :empresa)')
        .Add('  left join TBPLANO_CONTA p on (p.codigo = x.plano)')
      .&End
      .ParamByName('empresa', EmptyStr)
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

function TModelDAOTipoReceita.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Cod     as codigo')
        .Add('  , t.Tiporec as descricao')
        .Add('  , t.ativo')
        .Add('from TBTPRECEITA t')
        .Add('order by       ')
        .Add('    t.Tiporec')
      .&End
      .Open;

  FConn.Query.DataSet.Filter := '(ativo = 1)';
end;

procedure TModelDAOTipoReceita.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('TIPOREC').AsString := Trim(FieldByName('TIPOREC').AsString);
    FieldByName('TIPO_PARTICULAR_DESC').AsString := IfThen(FieldByName('TIPO_PARTICULAR').AsInteger = 1, 'S', EmptyStr);
  end;
end;

procedure TModelDAOTipoReceita.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('COD').AsInteger             := FConn.Query.NewID;
    FieldByName('CLASSIFICACAO').AsInteger   := 0; // A Definir
    FieldByName('TIPO_PARTICULAR').AsInteger := 0;
    FieldByName('ATIVO').AsInteger           := 1;
    FieldByName('PLANO_CONTA').Clear;
  end;
end;

destructor TModelDAOTipoReceita.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoReceita.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOTipoReceitaPlanoConta }

constructor TModelDAOTipoReceitaPlanoConta.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBTPRECEITA_PLANO')
      .KeyFields('receita;plano')
      .SQL
        .Clear
        .Add('Select')
        .Add('    r.receita')
        .Add('  , r.plano  ')
        .Add('  , r.empresa')
        .Add('  , r.selecionar     ')
        .Add('  , p.codigo_contabil')
        .Add('  , p.descricao_resumida')
        .Add('  , p.codigo_contabil || '' - '' || p.descricao_resumida as plano_conta')
        .Add('  , coalesce(e.rzsoc, ''(Todas)'')  as empresa_razao    ')
        .Add('  , coalesce(e.nmfant, ''(Todas)'') as empresa_fantasia ')
        .Add('from TBTPRECEITA_PLANO r')
        .Add('  left join TBPLANO_CONTA p on (p.codigo = r.plano)')
        .Add('  left join TBEMPRESA e on (e.cnpj = coalesce(r.empresa, p.empresa))')
        .Add('where (r.receita = :tipo)')
        .Add('order by')
        .Add('    p.codigo_contabil')
        .Add('  , p.descricao_resumida')
      .&End
    .ParamByName('tipo', 0)
    .Open;

  SetProviderFlags;
  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOTipoReceitaPlanoConta.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoReceitaPlanoConta.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOTipoReceitaPlanoConta.SetProviderFlags;
var
  I : Integer;
begin
  for I := 0 to Pred(FConn.Query.DataSet.Fields.Count) do
    FConn.Query.DataSet.Fields[I].ReadOnly := False; // Liberar edição dos campos

  // Configurar campos para a geração de Insert e Update
  FConn.Query.DataSet.FieldByName('codigo_contabil').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('descricao_resumida').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('plano_conta').ProviderFlags        := [];
  FConn.Query.DataSet.FieldByName('empresa_razao').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('empresa_fantasia').ProviderFlags   := [];
end;

procedure TModelDAOTipoReceitaPlanoConta.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

{ TModelDAOClasseReceita }

constructor TModelDAOClasseReceita.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    r.tpe_codigo   ')
        .Add('  , r.tpe_descricao')
        .Add('from VW_CLASSIFICAO_RECEITA r')
        .Add('order by        ')
        .Add('    r.tpe_codigo')
      .&End
    .Open;
end;

destructor TModelDAOClasseReceita.Destroy;
begin
  inherited;
end;

class function TModelDAOClasseReceita.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOClasseReceita.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.
