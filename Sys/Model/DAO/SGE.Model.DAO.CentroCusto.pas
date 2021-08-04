unit SGE.Model.DAO.CentroCusto;

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
  TModelDAOCentroCusto = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
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
  TModelDAOCentroCustoEmpresa = class(TModelDAO, IModelDAOCustom)
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

implementation

{ TModelDAOCentroCusto }

constructor TModelDAOCentroCusto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCENTRO_CUSTO')
      .KeyFields('codigo')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_CENTRO_CUSTO')
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.codigo    ')
        .Add('  , c.descricao ')
        .Add('  , c.ativo     ')
        .Add('  , c.codcliente')
        .Add('  , case when c.ativo = 1 then ''X'' else ''.'' end as ativo_temp ')
        .Add('  , cc.nome     ')
        .Add('from TBCENTRO_CUSTO c')
        .Add('  left join TBCLIENTE cc on (cc.codigo = c.codcliente)')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOCentroCusto.Destroy;
begin
  inherited;
end;

class function TModelDAOCentroCusto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOCentroCusto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Open;
end;

procedure TModelDAOCentroCusto.DataSetBeforePost(DataSet: TDataSet);
begin
  SetProviderFlags;
  with FConn.Query.DataSet do
    FieldByName('ativo_temp').AsString := IfThen(FieldByName('ATIVO').AsInteger = 1, 'S', EmptyStr);
end;

procedure TModelDAOCentroCusto.DataSetNewRecord(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('ATIVO').AsInteger := 1;
end;

procedure TModelDAOCentroCusto.SetProviderFlags;
var
  I : Integer;
begin
  for I := 0 to Pred(FConn.Query.DataSet.Fields.Count) do
    FConn.Query.DataSet.Fields[I].ReadOnly := False; // Liberar edição dos campos

  // Configurar campos para a geração de Insert e Update
  FConn.Query.DataSet.FieldByName('ativo_temp').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nome').ProviderFlags       := [];
end;

{ TModelDAOCentroCustoEmpresa }

constructor TModelDAOCentroCustoEmpresa.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCENTRO_CUSTO_EMPRESA')
      .KeyFields('centro_custo;empresa')
      .SQL
        .Clear
        .Add('Select')
        .Add('    cast(:centro_custo as Integer) as centro_custo')
        .Add('  , e.cnpj as empresa                             ')
        .Add('  , coalesce(c.selecionar, 0) as selecionar       ')
        .Add('  , e.rzsoc as razao ')
        .Add('from TBEMPRESA e     ')
        .Add('  left join TBCENTRO_CUSTO_EMPRESA c on (c.empresa = e.cnpj and c.centro_custo = :centro_custo)')
        .Add('order by   ')
        .Add('    e.rzsoc')
      .&End
    .ParamByName('centro_custo', 0)
    .Open;

  SetProviderFlags;
  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOCentroCustoEmpresa.Destroy;
begin
  inherited;
end;

class function TModelDAOCentroCustoEmpresa.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCentroCustoEmpresa.SetProviderFlags;
var
  I : Integer;
begin
  for I := 0 to Pred(FConn.Query.DataSet.Fields.Count) do
    FConn.Query.DataSet.Fields[I].ReadOnly := False; // Liberar edição dos campos

  // Configurar campos para a geração de Insert e Update
  FConn.Query.DataSet.FieldByName('centro_custo').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('empresa').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('razao').ProviderFlags        := [];
end;

procedure TModelDAOCentroCustoEmpresa.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

end.
