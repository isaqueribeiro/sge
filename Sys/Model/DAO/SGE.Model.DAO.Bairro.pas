unit SGE.Model.DAO.Bairro;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOBairro = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;
  end;

implementation

{ TModelDAOBairro }

constructor TModelDAOBairro.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBBAIRRO')
      .KeyFields('Bai_cod')
      .AutoIncFields('Bai_cod')
      .GeneratorName('GEN_BAIRRO_ID')
      .SQL
        .Clear
        .Add('Select')
        .Add('    b.Bai_cod')
        .Add('  , b.Bai_nome')
        .Add('  , b.Cid_cod')
        .Add('  , b.Dis_cod')
        .Add('  , c.Cid_nome || '' ('' || e.Est_sigla || '')'' as Cid_nome')
        .Add('  , d.Dis_nome')
        .Add('from TBBAIRRO b')
        .Add('  left join TBCIDADE c on (c.Cid_cod = b.Cid_cod)')
        .Add('  left join TBESTADO e on (e.Est_cod = c.Est_cod)')
        .Add('  left join TBDISTRITO d on (d.Dis_cod = b.Dis_cod)')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOBairro.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Bai_nome').Clear;
    FieldByName('Cid_cod').Clear;
    FieldByName('Dis_cod').Clear;
  end;
end;

destructor TModelDAOBairro.Destroy;
begin
  inherited;
end;

class function TModelDAOBairro.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
