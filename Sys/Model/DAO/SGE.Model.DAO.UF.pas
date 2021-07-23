unit SGE.Model.DAO.UF;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOUF = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;
  end;

implementation

{ TModelDAOUF }

constructor TModelDAOUF.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBESTADO')
      .KeyFields('Est_cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    e.Est_cod  ')
        .Add('  , e.Est_nome ')
        .Add('  , e.Est_sigla')
        .Add('  , e.Est_siafi')
        .Add('  , e.Aliquota_icms')
        .Add('  , e.Aliquota_fcp ')
        .Add('from TBESTADO e')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOUF.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Est_cod').AsInteger := FConn.Query.NewID;

    FieldByName('EST_SIGLA').Clear;
    FieldByName('EST_SIAFI').Clear;
    FieldByName('ALIQUOTA_ICMS').Clear;
    FieldByName('ALIQUOTA_FCP').Clear;
  end;
end;

destructor TModelDAOUF.Destroy;
begin
  inherited;
end;

class function TModelDAOUF.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
