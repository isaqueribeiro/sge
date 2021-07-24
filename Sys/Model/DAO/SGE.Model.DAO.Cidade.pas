unit SGE.Model.DAO.Cidade;

interface

uses
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOCidade = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOCidade }

constructor TModelDAOCidade.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCIDADE')
      .KeyFields('Cid_cod')
      .AutoIncFields('Cid_cod')
      .GeneratorName('Gen_cidade_id')
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.Cid_cod')
        .Add('  , c.Cid_nome')
        .Add('  , c.Est_cod')
        .Add('  , c.Cid_siafi')
        .Add('  , c.Cid_ibge')
        .Add('  , c.Cid_ddd')
        .Add('  , c.Cid_cep_inicial')
        .Add('  , c.Cid_cep_final')
        .Add('  , c.Custo_oper_percentual')
        .Add('  , c.Custo_oper_frete')
        .Add('  , c.Custo_oper_outros')
        .Add('  , e.Est_nome')
        .Add('  , e.Est_sigla')
        .Add('from TBCIDADE c')
        .Add('  inner join TBESTADO e on (e.Est_cod = c.Est_cod)')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOCidade.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Cid_nome').Clear;
    FieldByName('Est_cod').Clear;
    FieldByName('Cid_siafi').Clear;
    FieldByName('Cid_ibge').Clear;
    FieldByName('Custo_oper_percentual').AsInteger := 0;
    FieldByName('Custo_oper_frete').Clear;
    FieldByName('Custo_oper_outros').Clear;
  end;
end;

destructor TModelDAOCidade.Destroy;
begin
  inherited;
end;

class function TModelDAOCidade.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
