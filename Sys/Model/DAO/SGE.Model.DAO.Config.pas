unit SGE.Model.DAO.Config;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOConfigSystem = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

implementation

{ TModelDAOConfigSystem }

constructor TModelDAOConfigSystem.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('SYS_CONFIG')
      .KeyFields('ky_config')
      .AliasTableName('c')
      .SQL
        .Clear
        .Add('Select')
        .Add('  c.ky_config,   ')
        .Add('  c.vl_config,   ')
        .Add('  c.dh_config    ')
        .Add('from SYS_CONFIG c')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOConfigSystem.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ky_config').Clear;
    FieldByName('vl_config').Clear;
    FieldByName('dh_config').Clear;
  end;
end;

destructor TModelDAOConfigSystem.Destroy;
begin
  inherited;
end;

class function TModelDAOConfigSystem.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
