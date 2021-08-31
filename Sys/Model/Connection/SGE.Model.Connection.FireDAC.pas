unit SGE.Model.Connection.FireDAC;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Variants,
  System.Classes,
  Data.DB,

  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.DatS,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Util,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.IBDef,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.FB,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.IB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.UI,
  FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script,

  SGE.Model.Connection.Interfaces,
  SGE.Model.Connection.Component.SQL;

type
  TConnectionFireDAC = class(TInterfacedObject, IConnection<TConnectionFireDAC>)
    private
      FScript    : TSQL<TConnectionFireDAC>;
      FFieldDefs : TFieldDefs;
      FQuery     : TFDQuery;
      FUpdateSQL : TFDUpdateSQL;
      FAliasTableName  ,
      FWhereAdditional : String;

      procedure UpdateSequence(aGeneratorName, aTableName, aFielNameKey : String; const sWhr : String = '');
      procedure CreateFieldDefs;
      procedure AllowEditAllFields;
      procedure CreateRefreshSQL;

      function ExistParamByName(aParamName : String) : Boolean;
    protected
      constructor Create(aConn : TCustomConnection);

      procedure QueryUpdateError(ASender: TDataSet; AException: EFDException; ARow: TFDDatSRow;
        ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
    public
      destructor Destroy; override;
      class function New(aConn : TCustomConnection) : IConnection<TConnectionFireDAC>;

      function TableName(aTableName : String) : IConnection<TConnectionFireDAC>; overload;
      function TableName : String; overload;
      function AliasTableName(aAliasTableName : String) : IConnection<TConnectionFireDAC>; overload;
      function AliasTableName : String; overload;
      function GeneratorName(aGeneratorName : String) : IConnection<TConnectionFireDAC>; overload;
      function GeneratorName : String; overload;
      function KeyFields(aKeyFields : String) : IConnection<TConnectionFireDAC>; overload;
      function KeyFields : String; overload;
      function AutoIncFields(aAutoIncFields : String) : IConnection<TConnectionFireDAC>; overload;
      function AutoIncFields : String; overload;
      function WhereAdditional(aExpression : String) : IConnection<TConnectionFireDAC>; overload;
      function WhereAdditional : String; overload;
      function SQL : TSQL<TConnectionFireDAC>;
      function ParamByName(aParamName, aParamValue : String) : IConnection<TConnectionFireDAC>; overload;
      function ParamByName(aParamName : String; aParamValue : Integer) : IConnection<TConnectionFireDAC>; overload;
      function ParamByName(aParamName : String; aParamValue : Int64) : IConnection<TConnectionFireDAC>; overload;
      function ParamByName(aParamName : String) : String; overload;
      function Where(aExpressionWhere : String) : IConnection<TConnectionFireDAC>; overload;
      function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IConnection<TConnectionFireDAC>; overload;
      function Where(aFieldName : String; aFielValue : Integer) : IConnection<TConnectionFireDAC>; overload;
      function Where(aFieldName : String; aFielValue : Int64) : IConnection<TConnectionFireDAC>; overload;
      function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IConnection<TConnectionFireDAC>; overload;
      function WhereOr(aExpressionWhere : String) : IConnection<TConnectionFireDAC>; overload;
      function OrderBy(aExpression : String) : IConnection<TConnectionFireDAC>;
      function OpenEmpty : IConnection<TConnectionFireDAC>;
      function CloseEmpty : IConnection<TConnectionFireDAC>;

      function OpenOrExecute : Boolean;
      function DataSet : TDataSet;

      procedure Close;
      procedure Open;
      procedure ExecSQL;
      procedure ApplyUpdates;
      procedure CommitUpdates;

      procedure StartTransaction;
      procedure CommitTransaction;
      procedure RollbackTransaction;

      procedure RefreshRecord;
      procedure SetupKeyFields;
      procedure CreateGenerator(const aGeneratorName : String; const aYear : Smallint = 0);
      procedure UpdateGenerator(const aExpressionWhere : String = ''); overload;
      procedure UpdateGenerator(aGeneratorName, aTableName, aFielNameKey : String; const aExpressionWhere : String = ''); overload;

      function NewID : Variant;
  end;

implementation

{ TConnectionFireDAC }

function TConnectionFireDAC.AutoIncFields: String;
begin
  Result := FQuery.UpdateOptions.AutoIncFields;
end;

function TConnectionFireDAC.AutoIncFields(aAutoIncFields: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FQuery.UpdateOptions.AutoIncFields        := aAutoIncFields.Trim;
  FQuery.UpdateOptions.FetchGeneratorsPoint := TFDFetchGeneratorsPoint.gpImmediate;
end;

procedure TConnectionFireDAC.Close;
begin
  if FQuery.Active then
    FQuery.Close;
end;

function TConnectionFireDAC.CloseEmpty: IConnection<TConnectionFireDAC>;
begin
  Result := Self;

  if FQuery.Active then
    FQuery.Close;

  FScript.ClearWhereEmpty;
  CreateFieldDefs;
end;

procedure TConnectionFireDAC.CommitTransaction;
begin
  if FQuery.Connection.InTransaction then
    FQuery.Connection.CommitRetaining;
end;

constructor TConnectionFireDAC.Create(aConn: TCustomConnection);
begin
  FScript := TSQL<TConnectionFireDAC>.Create(Self);
  FQuery  := TFDQuery.Create(nil);
  FQuery.Connection    := TFDCustomConnection(aConn);
  FQuery.Transaction   := TFDCustomConnection(aConn).Transaction;
  FQuery.CachedUpdates := True;
  FQuery.OnUpdateError := QueryUpdateError;
  FAliasTableName      := EmptyStr;
  FWhereAdditional     := EmptyStr;

  FFieldDefs := TFieldDefs.Create(FQuery);

  FUpdateSQL := TFDUpdateSQL.Create(FQuery);
  FUpdateSQL.Connection := FQuery.Connection;
  FQuery.UpdateObject   := FUpdateSQL;
end;

procedure TConnectionFireDAC.CreateFieldDefs;
var
  I : Integer;
begin
  if FQuery.Active then
  begin
    FFieldDefs.Clear;
    for I := 0 to Pred(FQuery.FieldDefs.Count) do
    begin
      FFieldDefs.AddFieldDef;
      FFieldDefs.Items[I].Assign( FQuery.FieldDefs.Items[I] );
    end;
  end
  else
  begin
    FQuery.FieldDefs.Clear;
    for I := 0 to Pred(FFieldDefs.Count) do
    begin
      FQuery.FieldDefs.AddFieldDef;
      FQuery.FieldDefs.Items[I].Assign( FFieldDefs.Items[I] );
    end;
  end;
end;

procedure TConnectionFireDAC.CreateGenerator(const aGeneratorName: String; const aYear: Smallint);
var
  aDiff : String;
begin
  if (aYear > 0) then
    aDiff := aYear.ToString.QuotedString
  else
    aDiff := 'NULL';

  FQuery.Connection.ExecSQL('Execute Procedure SET_GENERATOR(' + aGeneratorName.QuotedString + ',' + aDiff + ')');
  FQuery.Connection.CommitRetaining;
end;

procedure TConnectionFireDAC.CreateRefreshSQL;
var
  aAlias    : String;
  aKeyField : TStringList;
  I : Integer;
begin
  if (not FQuery.UpdateOptions.UpdateTableName.IsEmpty) and (not FQuery.UpdateOptions.KeyFields.IsEmpty) then
  begin
    aKeyField := TStringList.Create;
    try
      aKeyField.Delimiter := ';';
      aKeyField.DelimitedText := FQuery.UpdateOptions.KeyFields;

      aAlias := IfThen(not FAliasTableName.IsEmpty, FAliasTableName.Trim + '.', EmptyStr);

      FUpdateSQL.FetchRowSQL.BeginUpdate;
      FUpdateSQL.FetchRowSQL.Clear;
      FUpdateSQL.FetchRowSQL.Add(FScript.Text);
      FUpdateSQL.FetchRowSQL.Add('where (' + aAlias + aKeyField.Strings[0] + ' is not null)');

      for I := 0 to Pred(aKeyField.Count) do
        FUpdateSQL.FetchRowSQL.Add('  and (' + aAlias + aKeyField.Strings[I] + ' =  :old_' + aKeyField.Strings[I] + ')');

      FUpdateSQL.FetchRowSQL.EndUpdate;
      FQuery.FetchOptions;
    finally
      aKeyField.DisposeOf;
    end;
  end;
end;

destructor TConnectionFireDAC.Destroy;
begin
  if FQuery.Active then
    FQuery.Close;

  FQuery.DisposeOf;
  FScript.DisposeOf;

  if Assigned(FFieldDefs) then
  begin
    FFieldDefs.Clear;
    FFieldDefs.DisposeOf;
  end;

  inherited;
end;

class function TConnectionFireDAC.New(aConn : TCustomConnection) : IConnection<TConnectionFireDAC>;
begin
  Result := Self.Create(aConn);
end;

function TConnectionFireDAC.NewID : Variant;
var
  aFieldName ,
  aTableName : String;
  ID : Variant;
begin
  aFieldName := FQuery.UpdateOptions.KeyFields;
  aTableName := FQuery.UpdateOptions.UpdateTableName;
  ID := TFDConnection(FQuery.Connection)
    .ExecSQLScalar('Select (max(' + aFieldName + ') + 1) as ID from ' + aTableName);

  if VarIsNull(ID) then
    Result := 1
  else
    Result := ID;
end;

function TConnectionFireDAC.AliasTableName: String;
begin
  Result := FAliasTableName;
end;

function TConnectionFireDAC.AliasTableName(aAliasTableName: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FAliasTableName := aAliasTableName.Trim;
end;

procedure TConnectionFireDAC.AllowEditAllFields;
var
  I : Integer;
begin
  if FQuery.Active then
    for I := 0 to Pred(FQuery.Fields.Count) do
      FQuery.Fields[I].ReadOnly := False; // Liberar edição dos campos
end;

procedure TConnectionFireDAC.ApplyUpdates;
begin
  FQuery.ApplyUpdates(0);
end;

procedure TConnectionFireDAC.CommitUpdates;
begin
  FQuery.CommitUpdates;
end;

function TConnectionFireDAC.DataSet: TDataSet;
begin
  Result := FQuery;
end;

procedure TConnectionFireDAC.ExecSQL;
begin
  // Cláusula adicional, independente dos filtros informados
  if not FWhereAdditional.IsEmpty then
    FScript.Where(FWhereAdditional);

  FQuery.Close;
  FQuery.SQL.BeginUpdate;
  FQuery.SQL.Clear;
  FQuery.SQL.Add( FScript.Text );
  FQuery.SQL.Add( FScript.Where );
  FQuery.SQL.Add( FScript.OrderBy );
  FQuery.SQL.EndUpdate;
  FQuery.ExecSQL;

  AllowEditAllFields;
end;

function TConnectionFireDAC.ExistParamByName(aParamName: String): Boolean;
begin
  Result := Assigned(FQuery.Params.FindParam(aParamName));

  // Remontar SQL para verificar a existência do parâmetro
  if (not Result) and (not FQuery.Active) then
  begin
    FQuery.SQL.BeginUpdate;
    FQuery.SQL.Clear;
    FQuery.SQL.Add( FScript.Text );
    FQuery.SQL.Add( FScript.Where );
    FQuery.SQL.Add( FScript.OrderBy );
    FQuery.SQL.EndUpdate;

    Result := Assigned(FQuery.Params.FindParam(aParamName));
  end;
end;

function TConnectionFireDAC.GeneratorName: String;
begin
  Result := FQuery.UpdateOptions.GeneratorName;
end;

function TConnectionFireDAC.KeyFields: String;
begin
  Result := FQuery.UpdateOptions.KeyFields;
end;

function TConnectionFireDAC.KeyFields(aKeyFields: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FQuery.UpdateOptions.KeyFields := aKeyFields.Trim;
end;

function TConnectionFireDAC.GeneratorName(aGeneratorName : String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FQuery.UpdateOptions.GeneratorName := aGeneratorName.Trim;
end;

procedure TConnectionFireDAC.Open;
var
  aAfterScroll : procedure(DataSet : TDataSet) of Object;
begin
  aAfterScroll := nil;

  // Cláusula adicional, independente dos filtros informados
  if not FWhereAdditional.IsEmpty then
    FScript.Where(FWhereAdditional);

  if Assigned(FQuery.AfterScroll) then
  begin
    aAfterScroll := FQuery.AfterScroll;
    FQuery.AfterScroll := nil;
  end;

  FQuery.Close;
  FQuery.SQL.BeginUpdate;
  FQuery.SQL.Clear;
  FQuery.SQL.Add( FScript.Text );
  FQuery.SQL.Add( FScript.Where );
  FQuery.SQL.Add( FScript.OrderBy );
  FQuery.SQL.EndUpdate;
  FQuery.Open;

  if Assigned(aAfterScroll) then
  begin
    FQuery.AfterScroll := aAfterScroll;
    aAfterScroll(FQuery);
  end;

  SetupKeyFields;
  AllowEditAllFields;
  CreateFieldDefs;
end;

function TConnectionFireDAC.OpenEmpty: IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.WhereEmpty;
  Open;
  CreateFieldDefs;
end;

function TConnectionFireDAC.OpenOrExecute: Boolean;
begin
  // Cláusula adicional, independente dos filtros informados
  if not FWhereAdditional.IsEmpty then
    FScript.Where(FWhereAdditional);

  FQuery.Close;
  FQuery.SQL.BeginUpdate;
  FQuery.SQL.Clear;
  FQuery.SQL.Add( FScript.Text );
  FQuery.SQL.Add( FScript.Where );
  FQuery.SQL.Add( FScript.OrderBy );
  FQuery.SQL.EndUpdate;

  Result := FQuery.OpenOrExecute;

  AllowEditAllFields;

  if (FQuery.RecordCount > 0) then
    SetupKeyFields;
end;

function TConnectionFireDAC.OrderBy(aExpression : String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.OrderBy(aExpression);
end;

function TConnectionFireDAC.ParamByName(aParamName: String): String;
begin
  if Assigned(FQuery.Params.FindParam(aParamName)) then
    Result := FQuery.ParamByName(aParamName).AsString
  else
    Result := EmptyStr;
end;

function TConnectionFireDAC.ParamByName(aParamName: String; aParamValue: Int64): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  if ExistParamByName(aParamName) then
    FQuery.ParamByName(aParamName).AsLargeInt := aParamValue;
end;

procedure TConnectionFireDAC.QueryUpdateError(ASender: TDataSet; AException: EFDException; ARow: TFDDatSRow;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
begin
  Case ARequest of
    arUpdate:
      raise Exception.Create('Erro ao tentar gravar atualização do registro.' + #13#13 + AException.Message);

    arInsert:
      raise Exception.Create('Erro ao tentar gravar novo registro.' + #13#13 + AException.Message);

    arDelete:
      raise Exception.Create('Erro ao tentar gravar excluir registro.' + #13#13 + AException.Message);
  end;
end;

procedure TConnectionFireDAC.RefreshRecord;
begin
  if Assigned(FUpdateSQL) then
  begin
    CreateRefreshSQL;
    FQuery.RefreshRecord();
  end;
end;

procedure TConnectionFireDAC.RollbackTransaction;
begin
  if FQuery.Connection.InTransaction then
    FQuery.Connection.RollbackRetaining;
end;

function TConnectionFireDAC.ParamByName(aParamName: String; aParamValue: Integer): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  if ExistParamByName(aParamName) then
    FQuery.ParamByName(aParamName).AsInteger := aParamValue;
end;

function TConnectionFireDAC.ParamByName(aParamName, aParamValue: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  if ExistParamByName(aParamName) then
    FQuery.ParamByName(aParamName).AsString := aParamValue;
end;

procedure TConnectionFireDAC.SetupKeyFields;
var
  aKeyField : TStringList;
  I : Integer;
begin
  if (FQuery.FieldCount > 0) then
  begin
    aKeyField := TStringList.Create;

    try
      aKeyField.Delimiter := ';';
      aKeyField.DelimitedText := FQuery.UpdateOptions.KeyFields;

      for I := 0 to Pred(aKeyField.Count) do
        if Assigned(FQuery.Fields.FindField(aKeyField.Strings[I])) then
          FQuery.FieldByName(aKeyField.Strings[I]).Required := True;

    finally
      aKeyField.DisposeOf;
    end;

    // Remover a obrigatoriedade de informar código quando o GENERATOR é responsável por sua geração
    if (not GeneratorName.IsEmpty) and (not AutoIncFields.IsEmpty) then
      if Assigned(FQuery.Fields.FindField(AutoIncFields)) then
        FQuery.FieldByName(AutoIncFields).Required := False;
  end;
end;

function TConnectionFireDAC.SQL: TSQL<TConnectionFireDAC>;
begin
  Result := FScript;
end;

procedure TConnectionFireDAC.StartTransaction;
begin
  if not FQuery.Connection.InTransaction then
    FQuery.Connection.StartTransaction;
end;

function TConnectionFireDAC.TableName: String;
begin
  Result := FQuery.UpdateOptions.UpdateTableName;
end;

procedure TConnectionFireDAC.UpdateGenerator(const aExpressionWhere: String);
begin
  UpdateSequence(GeneratorName, TableName, AutoIncFields, aExpressionWhere);
end;

procedure TConnectionFireDAC.UpdateGenerator(aGeneratorName, aTableName, aFielNameKey: String; const aExpressionWhere : String);
begin
  UpdateSequence(GeneratorName, aTableName, aFielNameKey, aExpressionWhere);
end;

procedure TConnectionFireDAC.UpdateSequence(aGeneratorName, aTableName, aFielNameKey : String; const sWhr : String = '');
var
  ID : Variant;
begin
  with FQuery.Connection do
  begin
    TFDConnection(FQuery.Connection).ExecSQL('Execute procedure SET_GENERATOR(' + QuotedStr(GeneratorName) + ', null)');

    ID := TFDConnection(FQuery.Connection).ExecSQLScalar('Select max(' + aFielNameKey + ') as ID from ' + aTableName + ' ' + sWhr);

    if (ID = Null) then
      TFDConnection(FQuery.Connection).ExecSQL('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH 0')
    else
      TFDConnection(FQuery.Connection).ExecSQL('ALTER SEQUENCE ' + GeneratorName + ' RESTART WITH ' + VarToStr(ID));

    CommitTransaction;
  end;
end;

function TConnectionFireDAC.Where(aExpressionWhere: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.Where(aExpressionWhere);
end;

function TConnectionFireDAC.Where(aFieldName, aFielValue: String; const aQuotedString : Boolean = True): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.Where(aFieldName, aFielValue, aQuotedString);
end;

function TConnectionFireDAC.Where(aFieldName: String; aFielValue: Integer): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.Where(aFieldName, aFielValue);
end;

function TConnectionFireDAC.Where(aFieldName: String; aFielValue: Int64): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.Where(aFieldName, aFielValue);
end;

function TConnectionFireDAC.WhereAdditional: String;
begin
  Result := FWhereAdditional;
end;

function TConnectionFireDAC.WhereOr(aExpressionWhere: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.WhereOr(aExpressionWhere);
end;

function TConnectionFireDAC.WhereAdditional(aExpression: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FWhereAdditional := aExpression.Trim;
end;

function TConnectionFireDAC.WhereOr(aFieldName, aFielValue: String; const aQuotedString : Boolean = True): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FScript.WhereOr(aFieldName, aFielValue, aQuotedString);
end;

function TConnectionFireDAC.TableName(aTableName: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FQuery.UpdateOptions.UpdateTableName := aTableName.Trim;
end;

end.
