unit SGE.Model.DAO.Vendedor;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOVendedor = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

uses
  UConstantesDGE;

{ TModelDAOVendedor }

constructor TModelDAOVendedor.Create;
var
  aScriptSQL  : TStringList;
begin
  inherited Create;

  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('execute block');
    aScriptSQL.Add('as');
    aScriptSQL.Add('  declare variable cd Integer;');
    aScriptSQL.Add('begin');
    aScriptSQL.Add('    cd = ' + VENDEDOR_PADRAO + ';');
    aScriptSQL.Add('    UPDATE OR INSERT INTO TBVENDEDOR (');
    aScriptSQL.Add('        cod                           ');
    aScriptSQL.Add('      , nome                          ');
    aScriptSQL.Add('      , cpf                           ');
    aScriptSQL.Add('      , email                         ');
    aScriptSQL.Add('      , comissao_tipo                 ');
    aScriptSQL.Add('      , comissao                      ');
    aScriptSQL.Add('      , comissao_vl                   ');
    aScriptSQL.Add('      , tipo                          ');
    aScriptSQL.Add('      , ativo                         ');
    aScriptSQL.Add('    ) values (                        ');
    aScriptSQL.Add('        :cd                           ');
    aScriptSQL.Add('      , ' + QuotedStr('ESTABELECIMENTO') + ' ');
    aScriptSQL.Add('      , ' + QuotedStr('00000000000')     + ' ');
    aScriptSQL.Add('      , null ');
    aScriptSQL.Add('      , 0    '); // 0 - Direta (Por Percentual/Valor sobre o Valor Total da Venda)
    aScriptSQL.Add('      , 0.0  '); // % Comissão
    aScriptSQL.Add('      , 0.0  '); // Valor Comissão
    aScriptSQL.Add('      , 0    '); // 0 - Vendedor
    aScriptSQL.Add('      , 1    '); // 1 - Ativo
    aScriptSQL.Add('    ) MATCHING ( cod ); ');
    aScriptSQL.Add('end');
    aScriptSQL.EndUpdate;

    FConn.ExecuteSQL(aScriptSQL.Text);
    FConn.CommitRetaining;
  finally
    aScriptSQL.DisposeOf;
  end;

  FConn
    .Query
      .TableName('TBVENDEDOR')
      .KeyFields('Cod')
      .AutoIncFields('Cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    v.Cod  ')
        .Add('  , v.Nome ')
        .Add('  , v.Email')
        .Add('  , v.Cpf  ')
        .Add('  , v.Tipo ')
        .Add('  , v.Ativo')
        .Add('  , v.comissao_tipo')
        .Add('  , v.comissao     ')
        .Add('  , v.Comissao_vl  ')
        .Add('  , Case           ')
        .Add('      when v.comissao_tipo = 0 then ''D'' ')
        .Add('      when v.comissao_tipo = 1 then ''P'' ')
        .Add('      else ''*''           ')
        .Add('    end comissao_tipo_flag ')
        .Add('from TBVENDEDOR v          ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAOVendedor.Destroy;
begin
  inherited;
end;

class function TModelDAOVendedor.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOVendedor.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('comissao_tipo_flag').ProviderFlags := [];
end;

function TModelDAOVendedor.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    v.cod        as codigo')
        .Add('  , trim(v.Nome) as nome  ')
        .Add('  , v.Ativo')
        .Add('from TBVENDEDOR v ')
        .Add('Order by ')
        .Add('    trim(v.Nome)  ')
      .&End
    .Open;

  FConn.Query.DataSet.Filter := '(ativo = 1)';
end;

procedure TModelDAOVendedor.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOVendedor.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if ( FieldByName('ATIVO').IsNull ) then
      FieldByName('ATIVO').AsInteger := 1;

    if ( FieldByName('TIPO').IsNull ) then
      FieldByName('TIPO').AsInteger := 1;

    if ( FieldByName('COMISSAO_TIPO').AsInteger = 1 ) then
    begin
      FieldByName('COMISSAO').AsCurrency    := 0.0;
      FieldByName('COMISSAO_VL').AsCurrency := 0.0;
    end;

    if (Length(Trim(FieldByName('CPF').AsString)) < 11) then
      FieldByName('CPF').Clear;

    if (Length(Trim(FieldByName('EMAIL').AsString)) <= 8) then
      FieldByName('EMAIL').Clear;

    Case FieldByName('COMISSAO_TIPO').AsInteger of
      0 : FieldByName('COMISSAO_TIPO_FLAG').AsString := 'D';
      1 : FieldByName('COMISSAO_TIPO_FLAG').AsString := 'P';
      else
        FieldByName('COMISSAO_TIPO_FLAG').AsString := '*';
    end;
  end;
end;

procedure TModelDAOVendedor.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('COD').AsInteger   := FConn.Query.NewID;
    FieldByName('ATIVO').AsInteger := 1;
    FieldByName('TIPO').AsInteger  := 0;
    FieldByName('COMISSAO_TIPO').AsInteger := 0;
    FieldByName('COMISSAO').AsCurrency     := 0.0;
    FieldByName('COMISSAO_VL').AsCurrency  := 0.0;
    FieldByName('EMAIL').Clear;
  end;
end;

end.

