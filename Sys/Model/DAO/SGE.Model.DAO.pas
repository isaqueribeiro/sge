unit SGE.Model.DAO;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.Connection.Factory,
  SGE.Model.DAO.Interfaces,

  Interacao.Usuario,
  Classe.Usuario,
  Model.Entidade.ConfiguracaoINI;

type
  TModelDAO = class(TInterfacedObject, IModelDAO)
    private
    protected
      FConn    : IConnection;
      FUsuario : IUsuarioModel;
      FConfiguracao  : IConfiguracaoIni;
      FPrepareInsert : Boolean;
      FWhereTemp   ,
      FOrderByTemp : TStringList;
      constructor Create;
    public
      destructor Destroy; override;

      function DataSet : TDataSet;
      function SelectSQL : String;
      function Clear : IModelDAO;
      function SQL(Value : String) : IModelDAO;
      function Usuario : IUsuarioModel;
      function Configuracao : IConfiguracaoIni;

      function Where(aExpressionWhere : String) : IModelDAO; overload;
      function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO; overload;
      function Where(aFieldName : String; aFielValue : Integer) : IModelDAO; overload;
      function Where(aFieldName : String; aFielValue : Int64) : IModelDAO; overload;
      function WhereLike(aFieldName, aFielValue : String) : IModelDAO;

      function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO; overload;
      function WhereOr(aExpressionWhere : String) : IModelDAO; overload;

      function WhereAdditional(aExpression : String) : IModelDAO; overload;
      function WhereAdditional : String; overload;

      function ParamsByName(aParamsName, aParamsValue : String) : IModelDAO; overload;
      function ParamsByName(aParamsName : String; aParamsValue : Integer) : IModelDAO; overload;
      function ParamsByName(aParamsName : String; aParamsValue : Int64) : IModelDAO; overload;
      function ParamsByName(aParamsName : String; aParamsValue : Currency) : IModelDAO; overload;
      function ParamsByName(aParamsName : String; aParamsValue : TDateTime) : IModelDAO; overload;
      function ParamsByNameClear(aParamsName : String) : IModelDAO;

      function OrderBy(aFieldName : String) : IModelDAO; overload;

      function PrepareInsert(Value : Boolean) : IModelDAO; overload;
      function PrepareInsert : Boolean; overload;

      function OpenEmpty  : IModelDAO;
      function CloseEmpty : IModelDAO;
      function Close      : IModelDAO;

      procedure Open;
      procedure OpenOrExecute;

      procedure ClearWhere;
      procedure ClearOrderBy;
      procedure ApplyUpdates;
      procedure CommitUpdates;
      procedure RefreshRecord;
      procedure UpdateGenerator(const aExpressionWhere : String = ''); overload;
      procedure UpdateGenerator(aGeneratorName, aTableName, aFielNameKey : String; const aExpressionWhere : String = ''); overload;
      procedure ExecuteScriptSQL(aScript : String);

      procedure StartTransaction;
      procedure CommitTransaction;
      procedure RollbackTransaction;
  end;

implementation

{ TModelDAO }

uses
  System.IOUtils,
  UConstantesDGE;

procedure TModelDAO.ApplyUpdates;
begin
  FConn.Query.ApplyUpdates;
end;

function TModelDAO.Clear : IModelDAO;
begin
  Result := Self;

  if FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Close;

  FConn.Query.SQL.Clear;
end;

procedure TModelDAO.ClearOrderBy;
begin
  if FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Close;

  FConn.Query.SQL.ClearOrderBy;
end;

procedure TModelDAO.ClearWhere;
begin
  if FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Close;

  FConn.Query.SQL.ClearWhere;
end;

function TModelDAO.Close: IModelDAO;
begin
  Result := Self;
  FConn.Query.Close;
end;

function TModelDAO.CloseEmpty: IModelDAO;
begin
  Result := Self;
  FConn.Query.CloseEmpty;
end;

procedure TModelDAO.CommitTransaction;
begin
  FConn.Query.CommitTransaction;
end;

procedure TModelDAO.CommitUpdates;
begin
  FConn.Query.CommitUpdates;
end;

function TModelDAO.Configuracao: IConfiguracaoIni;
begin
  Result := FConfiguracao;
end;

constructor TModelDAO.Create;
begin
  FConn    := TConnectionFactory.New;
  FUsuario := TUsuario.New;

  FConfiguracao := TConfiguracaoIni.New(TPath.Combine(ExtractFilePath(ParamStr(0)), FILE_SETTINGS_INI));
  if not FConfiguracao.Carregado then
    FConfiguracao.Load;

  FPrepareInsert := False;
  FWhereTemp   := TStringList.Create;
  FOrderByTemp := TStringList.Create;
end;

function TModelDAO.DataSet: TDataSet;
begin
  Result := FConn.Query.DataSet;
end;

destructor TModelDAO.Destroy;
begin
  FWhereTemp.DisposeOf;
  FOrderByTemp.DisposeOf;
  inherited;
end;

procedure TModelDAO.ExecuteScriptSQL(aScript: String);
begin
  if not aScript.Trim.IsEmpty then
    FConn.ExecuteSQL(aScript.Trim);
end;

procedure TModelDAO.Open;
begin
  FConn.Query.Open;
end;

function TModelDAO.OpenEmpty: IModelDAO;
begin
  Result := Self;
  FConn.Query.OpenEmpty;
end;

procedure TModelDAO.OpenOrExecute;
begin
  FConn.Query.OpenOrExecute;
end;

function TModelDAO.OrderBy(aFieldName: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.SQL.OrderBy(aFieldName);
end;

function TModelDAO.ParamsByName(aParamsName: String; aParamsValue: Int64): IModelDAO;
begin
  Result := Self;
  FConn.Query.ParamByName(aParamsName, aParamsValue);
end;

function TModelDAO.ParamsByNameClear(aParamsName: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.ParamByNameClear(aParamsName);
end;

function TModelDAO.PrepareInsert: Boolean;
begin
  Result := FPrepareInsert;
end;

function TModelDAO.PrepareInsert(Value: Boolean): IModelDAO;
begin
  Result := Self;
  FPrepareInsert := Value;

  if FPrepareInsert then
  begin
    FWhereTemp.Clear;
    FWhereTemp.AddStrings( FConn.Query.WhereList );

    FOrderByTemp.Clear;
    FOrderByTemp.AddStrings( FConn.Query.OrderByList );

    Self.Close;
    Self.ClearWhere;
    Self.OpenEmpty;
  end
  else
  begin
    Self.Close;
    Self.ClearWhere;
    Self.ClearOrderBy;
    FConn.Query.WhereList(FWhereTemp);
    FConn.Query.OrderByList(FOrderByTemp);
    Self.Open;
  end;
end;

function TModelDAO.ParamsByName(aParamsName: String; aParamsValue: Integer): IModelDAO;
begin
  Result := Self;
  FConn.Query.ParamByName(aParamsName, aParamsValue);
end;

function TModelDAO.ParamsByName(aParamsName, aParamsValue: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.ParamByName(aParamsName, aParamsValue);
end;

procedure TModelDAO.RefreshRecord;
begin
  FConn.Query.RefreshRecord;
end;

procedure TModelDAO.RollbackTransaction;
begin
  FConn.Query.RollbackTransaction;
end;

function TModelDAO.SelectSQL: String;
begin
  Result := FConn.Query.SQL.Text + #13 + FConn.Query.SQL.Where + #13 + FConn.Query.SQL.OrderBy;
end;

function TModelDAO.SQL(Value: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.SQL.Add(Value);
end;

procedure TModelDAO.StartTransaction;
begin
  FConn.Query.StartTransaction;
end;

procedure TModelDAO.UpdateGenerator(const aExpressionWhere : String = '');
begin
  FConn.Query.UpdateGenerator(aExpressionWhere);
end;

procedure TModelDAO.UpdateGenerator(aGeneratorName, aTableName, aFielNameKey: String; const aExpressionWhere : String);
begin
  FConn.Query.UpdateGenerator(aGeneratorName, aTableName, aFielNameKey, aExpressionWhere);
end;

function TModelDAO.Usuario: IUsuarioModel;
begin
  Result := FUsuario;
end;

function TModelDAO.Where(aExpressionWhere: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.Where(aExpressionWhere);
end;

function TModelDAO.Where(aFieldName, aFielValue: String; const aQuotedString : Boolean = True): IModelDAO;
begin
  Result := Self;
  FConn.Query.Where(aFieldName, aFielValue, aQuotedString);
end;

function TModelDAO.Where(aFieldName: String; aFielValue: Integer): IModelDAO;
begin
  Result := Self;
  FConn.Query.Where(aFieldName, aFielValue);
end;

function TModelDAO.Where(aFieldName: String; aFielValue: Int64): IModelDAO;
begin
  Result := Self;
  FConn.Query.Where(aFieldName, aFielValue);
end;

function TModelDAO.WhereAdditional: String;
begin
  Result := FConn.Query.WhereAdditional;
end;

function TModelDAO.WhereAdditional(aExpression: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.WhereAdditional(aExpression);
end;

function TModelDAO.WhereLike(aFieldName, aFielValue: String): IModelDAO;
var
  aExpression : String;
begin
  Result := Self;
  aExpression := '(' + aFieldName.Trim + ' like ' + aFielValue.Trim.QuotedString + ')';
  FConn.Query.Where(aExpression);
end;

function TModelDAO.WhereOr(aExpressionWhere: String): IModelDAO;
begin
  Result := Self;
  FConn.Query.WhereOr(aExpressionWhere);
end;

function TModelDAO.WhereOr(aFieldName, aFielValue: String; const aQuotedString : Boolean = True): IModelDAO;
begin
  Result := Self;
  FConn.Query.WhereOr(aFieldName, aFielValue, aQuotedString);
end;

function TModelDAO.ParamsByName(aParamsName: String; aParamsValue: Currency): IModelDAO;
begin
  Result := Self;
  FConn.Query.ParamByName(aParamsName, aParamsValue);
end;

function TModelDAO.ParamsByName(aParamsName: String; aParamsValue: TDateTime): IModelDAO;
begin
  Result := Self;
  FConn.Query.ParamByName(aParamsName, aParamsValue);
end;

end.
