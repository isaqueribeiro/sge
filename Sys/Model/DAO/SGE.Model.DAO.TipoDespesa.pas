unit SGE.Model.DAO.TipoDespesa;

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
  TModelDAOTipoDespesa = class(TModelDAO, IModelDAOCustom)
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
  TModelDAOTipoDespesaPlanoConta = class(TModelDAO, IModelDAOCustom)
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
  TModelDAOClasseDespesa = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOTipoDespesa }

constructor TModelDAOTipoDespesa.Create;
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
    aScriptSQL.Add('      d.tipodesp');
    aScriptSQL.Add('    from TBTPDESPESA d');
    aScriptSQL.Add('    where (d.cod = :cd)');
    aScriptSQL.Add('       or (d.tipodesp = ' + QuotedStr('ENTRADAS EM GERAL') + ')');
    aScriptSQL.Add('  )) then');
    aScriptSQL.Add('  begin');
    aScriptSQL.Add('    Insert into TBTPDESPESA (');
    aScriptSQL.Add('        cod');
    aScriptSQL.Add('      , classificacao');
    aScriptSQL.Add('      , tipodesp');
    aScriptSQL.Add('      , tipo_particular');
    aScriptSQL.Add('      , plano_conta');
    aScriptSQL.Add('      , ativo');
    aScriptSQL.Add('    ) values (');
    aScriptSQL.Add('        :cd');  // Codigo
    aScriptSQL.Add('      , 0');    // Classificação
    aScriptSQL.Add('      , ' + QuotedStr('ENTRADAS EM GERAL') + ' ');
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
      .TableName('TBTPDESPESA')
      .KeyFields('Cod')
      .AutoIncFields('Cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Cod     ')
        .Add('  , t.Tipodesp')
        .Add('  , t.Tipo_Particular')
        .Add('  , t.classificacao  ')
        .Add('  , t.plano_conta    ')
        .Add('  , t.ativo          ')
        .Add('  , Case when t.Tipo_Particular = 1 then ''S'' else '''' end Tipo_Particular_Desc')
        .Add('  , coalesce(nullif(trim(p.codigo_contabil), '''') || '' - '', '''') || p.descricao_resumida as descricao_resumida')
        .Add('from TBTPDESPESA t')
        .Add('  left join TBTPDESPESA_PLANO x on (x.despesa = t.cod and x.empresa = :empresa)')
        .Add('  left join TBPLANO_CONTA p on (p.codigo = x.plano)')
      .&End
      .ParamByName('empresa', EmptyStr)
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

function TModelDAOTipoDespesa.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Cod      as codigo')
        .Add('  , t.Tipodesp as descricao')
        .Add('  , t.ativo')
        .Add('from TBTPDESPESA t')
        .Add('order by       ')
        .Add('    t.Tipodesp')
      .&End
      .Open;

  FConn.Query.DataSet.Filter := '(ativo = 1)';
end;

procedure TModelDAOTipoDespesa.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Tipodesp').AsString := Trim(FieldByName('Tipodesp').AsString);
    FieldByName('Tipo_Particular_Desc').AsString := IfThen(FieldByName('TIPO_PARTICULAR').AsInteger = 1, 'S', EmptyStr);
  end;
end;

procedure TModelDAOTipoDespesa.DataSetNewRecord(DataSet: TDataSet);
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

destructor TModelDAOTipoDespesa.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoDespesa.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOTipoDespesaPlanoConta }

constructor TModelDAOTipoDespesaPlanoConta.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBTPDESPESA_PLANO')
      .KeyFields('despesa;plano')
      .SQL
        .Clear
        .Add('Select')
        .Add('    d.despesa')
        .Add('  , d.plano  ')
        .Add('  , d.empresa')
        .Add('  , d.selecionar        ')
        .Add('  , p.codigo_contabil   ')
        .Add('  , p.descricao_resumida')
        .Add('  , p.codigo_contabil || '' - '' || p.descricao_resumida as plano_conta')
        .Add('  , coalesce(e.rzsoc,  ''(Todas)'') as empresa_razao   ')
        .Add('  , coalesce(e.nmfant, ''(Todas)'') as empresa_fantasia')
        .Add('from TBTPDESPESA_PLANO d')
        .Add('  left join TBPLANO_CONTA p on (p.codigo = d.plano)')
        .Add('  left join TBEMPRESA e on (e.cnpj = coalesce(d.empresa, p.empresa))')
        .Add('where (d.despesa = :tipo)')
        .Add('order by')
        .Add('    p.codigo_contabil')
        .Add('  , p.descricao_resumida')
      .&End
    .ParamByName('tipo', 0)
    .Open;

  SetProviderFlags;
  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOTipoDespesaPlanoConta.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoDespesaPlanoConta.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOTipoDespesaPlanoConta.SetProviderFlags;
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

procedure TModelDAOTipoDespesaPlanoConta.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

{ TModelDAOClasseDespesa }

constructor TModelDAOClasseDespesa.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    d.tpe_codigo   ')
        .Add('  , d.tpe_descricao')
        .Add('from VW_CLASSIFICAO_DESPESA d')
        .Add('order by        ')
        .Add('    d.tpe_codigo')
      .&End
    .Open;
end;

destructor TModelDAOClasseDespesa.Destroy;
begin
  inherited;
end;

class function TModelDAOClasseDespesa.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOClasseDespesa.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

end.
