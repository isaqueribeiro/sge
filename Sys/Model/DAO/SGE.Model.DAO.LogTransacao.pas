unit SGE.Model.DAO.LogTransacao;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOLogTransacao = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOLogTransacao }

constructor TModelDAOLogTransacao.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBLOG_TRANSACAO')
      .KeyFields('usuario;data_hora')
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.usuario      ')
        .Add('  , t.data_hora    ')
        .Add('  , t.empresa      ')
        .Add('  , t.tipo         ')
        .Add('  , t.descricao    ')
        .Add('  , t.especificacao')
        .Add('from TBLOG_TRANSACAO t')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOLogTransacao.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('usuario').AsString     := Usuario.Login;
    FieldByName('empresa').AsString     := Usuario.Empresa.CNPJ;
    FieldByName('data_hora').AsDateTime := Now;
    FieldByName('tipo').Clear;
    FieldByName('descricao').Clear;
    FieldByName('especificacao').Clear;
  end;
end;

destructor TModelDAOLogTransacao.Destroy;
begin
  inherited;
end;

class function TModelDAOLogTransacao.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
