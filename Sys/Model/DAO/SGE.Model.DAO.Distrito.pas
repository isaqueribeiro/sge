unit SGE.Model.DAO.Distrito;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAODistrito = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;
  end;

implementation

{ TModelDAODistrito }

constructor TModelDAODistrito.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBDISTRITO')
      .KeyFields('dis_cod')
      .AutoIncFields('dis_cod')
      .GeneratorName('GEN_DISTRITO_ID')
      .SQL
        .Clear
        .Add('Select')
        .Add('    d.dis_cod')
        .Add('  , d.dis_nome')
        .Add('from TBDISTRITO d')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAODistrito.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('dis_nome').Clear;
  end;
end;

destructor TModelDAODistrito.Destroy;
begin
  inherited;
end;

class function TModelDAODistrito.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
