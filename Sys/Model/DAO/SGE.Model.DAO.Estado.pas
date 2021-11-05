unit SGE.Model.DAO.Estado;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOEstado = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

{ TModelDAOEstado }

constructor TModelDAOEstado.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBESTADO')
      .KeyFields('est_cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    e.est_cod  ')
        .Add('  , e.est_nome ')
        .Add('  , e.est_sigla')
        .Add('  , e.est_siafi')
        .Add('  , e.aliquota_icms')
        .Add('  , e.aliquota_fcp ')
        .Add('from TBESTADO e    ')
      .&End
      .OrderBy('e.est_nome')
      .Open;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

function TModelDAOEstado.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

procedure TModelDAOEstado.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('est_cod').Clear;
    FieldByName('est_nome').Clear;
    FieldByName('est_sigla').Clear;
    FieldByName('est_siafi').Clear;
    FieldByName('aliquota_icms').Clear;
    FieldByName('aliquota_fcp').Clear;
  end;
end;

destructor TModelDAOEstado.Destroy;
begin
  inherited;
end;

class function TModelDAOEstado.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
