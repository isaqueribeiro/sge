unit SGE.Model.Connection.FireDAC;

interface

uses
  System.SysUtils,
  System.Variants,
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
      FWhereAdditional : String;

      procedure UpdateSequence(aGeneratorName, aTableName, aFielNameKey : String; const sWhr : String = '');
      procedure CreateFieldDefs;
      procedure AllowEditAllFields;

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
      function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IConnection<TConnectionFireDAC>;
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
      procedure UpdateGenerator(const aExpressionWhere : String = '');

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
  FWhereAdditional     := EmptyStr;

  FFieldDefs := TFieldDefs.Create(FQuery);
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
  Result := Assigned(FQuery.Params.FindParam(aParamName))
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
  FQuery.Open;

  SetupKeyFields;
  AllowEditAllFields;
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
  FQuery.RefreshRecord();
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
begin
  if (FQuery.FieldCount > 0) then
  begin
    // Remover a obrigatoriedade de informar código quando o GENERATOR é responsável por sua geração
    if (GeneratorName <> EmptyStr) and (KeyFields <> EmptyStr) then
    begin
      if (Pos(';', KeyFields) = 0) then
      begin
        if Assigned(FQuery.Fields.FindField(KeyFields)) then
          FQuery.FieldByName(KeyFields).Required := False;
      end
      else
      begin

      end;
    end;
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
