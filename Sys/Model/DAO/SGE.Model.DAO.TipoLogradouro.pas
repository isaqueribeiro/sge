unit SGE.Model.DAO.TipoLogradouro;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOTipoLogradouro = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOTipoLogradouro }

constructor TModelDAOTipoLogradouro.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBTIPO_LOGRADOURO')
      .KeyFields('Tlg_cod')
      .AutoIncFields('Tlg_cod')
      .GeneratorName('GEN_TIPO_LOGRADOURO_ID')
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Tlg_cod')
        .Add('  , t.Tlg_descricao')
        .Add('  , t.Tlg_sigla')
        .Add('from TBTIPO_LOGRADOURO t')
      .&End
      .WhereAdditional('t.Tlg_cod > 0')
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

function TModelDAOTipoLogradouro.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.Tlg_cod')
        .Add('  , t.Tlg_descricao')
        .Add('  , t.Tlg_sigla')
        .Add('from TBTIPO_LOGRADOURO t')
        .Add('order by ')
        .Add('    t.Tlg_descricao')
      .&End
      .Open;
end;

procedure TModelDAOTipoLogradouro.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Tlg_descricao').Clear;
    FieldByName('Tlg_sigla').Clear;
  end;
end;

destructor TModelDAOTipoLogradouro.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoLogradouro.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
