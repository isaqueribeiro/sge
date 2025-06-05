unit SGE.Model.DAO.Promocao;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Promoções de Produto/Serviço
  TModelDAOPromocao = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Produtos/Serviços da promoção
  TModelDAOPromocaoProduto = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

{ TModelDAOPromocao }

constructor TModelDAOPromocao.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBPROMOCAO')
      .AliasTableName('p')
      .KeyFields('Codigo')
      .AutoIncFields('Codigo')
      .GeneratorName('GEN_TBPROMOCAO_ID')
      .SQL
        .Clear
        .Add('Select          ')
        .Add('    p.Codigo    ')
        .Add('  , p.Descricao ')
        .Add('  , p.Data_inicio ')
        .Add('  , p.Data_final  ')
        .Add('  , p.Percentual_desconto ')
        .Add('  , p.Ativa       ')
        .Add('from TBPROMOCAO p ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAOPromocao.Destroy;
begin
  inherited;
end;

class function TModelDAOPromocao.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOPromocao.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ATIVA').AsInteger                := 1;
    FieldByName('DATA_INICIO').AsDateTime         := Now;
    FieldByName('PERCENTUAL_DESCONTO').AsCurrency := 0.0;
  end;
end;

{ TModelDAOPromocaoProduto }

constructor TModelDAOPromocaoProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBPROMOCAO_PRODUTO')
      .AliasTableName('p')
      .KeyFields('Codigo_prom;Codigo_prod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    p.Codigo_prom')
        .Add('  , p.Codigo_prod')
        .Add('  , p.Preco_venda')
        .Add('  , p.Desconto   ')
        .Add('  , p.Preco_promocao')
        .Add('  , p.Usuario       ')
        .Add('  , pr.Descri       ')
        .Add('  , pr.Apresentacao ')
        .Add('  , pr.Unidade      ')

        // FireBird 2.5
        .Add('  , Case when rdb$set_context(''USER_TRANSACTION'', ''LINHA'', coalesce(cast(rdb$get_context(''USER_TRANSACTION'', ''LINHA'') as Integer), 0) + 1) > 0 ')
        .Add('      then rdb$get_context(''USER_TRANSACTION'', ''LINHA'')        ')
        .Add('      else rdb$set_context(''USER_TRANSACTION'', ''LINHA'', ''1'') ')
        .Add('    end as Sequencial ')

        .Add('from TBPROMOCAO_PRODUTO p')
        .Add('  inner join TBPRODUTO pr on (pr.Cod = p.Codigo_prod)')
      .&End
      .Where('(p.Codigo_prom = :promocao)')
      .OrderBy('pr.Descri')
      .OrderBy('pr.Apresentacao')
      .ParamByName('promocao', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAOPromocaoProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOPromocaoProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOPromocaoProduto.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Descri').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('Apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Unidade').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('sequencial').ProviderFlags   := [];
end;

procedure TModelDAOPromocaoProduto.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOPromocaoProduto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('sequencial').AsInteger := RecordCount + 1;
    FieldByName('Usuario').AsString     := Usuario.Login;
    FieldByName('Codigo_prod').Clear;
    FieldByName('Preco_venda').Clear;
    FieldByName('Desconto').Clear;
    FieldByName('Preco_promocao').Clear;
  end;
end;

end.
