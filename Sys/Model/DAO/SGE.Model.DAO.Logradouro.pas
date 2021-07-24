unit SGE.Model.DAO.Logradouro;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOLogradouro = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOLogradouro }

constructor TModelDAOLogradouro.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBLOGRADOURO')
      .KeyFields('Log_cod')
      .AutoIncFields('Log_cod')
      .GeneratorName('GEN_LOGRADOURO_ID')
      .SQL
        .Clear
        .Add('Select')
        .Add('    l.Log_cod ')
        .Add('  , l.Log_nome')
        .Add('  , l.Tlg_cod ')
        .Add('  , l.Cid_cod ')
        .Add('  , trim(coalesce(coalesce(t.Tlg_sigla, t.Tlg_descricao) || '' '', '''') || l.Log_nome) as logradouro') // -- Campo 5
        .Add('  , c.Cid_nome || '' ('' || e.Est_sigla || '')'' as Cid_nome')
        .Add('from TBLOGRADOURO l')
        .Add('  left join TBTIPO_LOGRADOURO t on (t.Tlg_cod = l.Tlg_cod)')
        .Add('  left join TBCIDADE c on (c.Cid_cod = l.Cid_cod)         ')
        .Add('  left join TBESTADO e on (e.Est_cod = c.Est_cod)         ')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOLogradouro.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Log_nome').Clear;
    FieldByName('Tlg_cod').Clear;
    FieldByName('Cid_cod').Clear;
  end;
end;

destructor TModelDAOLogradouro.Destroy;
begin
  inherited;
end;

class function TModelDAOLogradouro.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
