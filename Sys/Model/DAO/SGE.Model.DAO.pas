unit SGE.Model.DAO;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.Connection.Factory,
  SGE.Model.DAO.Interfaces;

type
  TModelDAO = class(TInterfacedObject, IModelDAO)
    private
    protected
      FConn : IConnection;
      constructor Create;
    public
      destructor Destroy; override;

      function DataSet : TDataSet;
      function SelectSQL : String;

      function Where(aExpressionWhere : String) : IModelDAO; overload;
      function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO; overload;
      function Where(aFieldName : String; aFielValue : Integer) : IModelDAO; overload;
      function Where(aFieldName : String; aFielValue : Int64) : IModelDAO; overload;
      function WhereLike(aFieldName, aFielValue : String) : IModelDAO;
      function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) : IModelDAO;
      function WhereAdditional(aExpression : String) : IModelDAO; overload;
      function WhereAdditional : String; overload;
      function ParamsByName(aParamsName, aParamsValue : String) : IModelDAO; overload;
      function ParamsByName(aParamsName : String; aParamsValue : Integer) : IModelDAO; overload;
      function ParamsByName(aParamsName : String; aParamsValue : Int64) : IModelDAO; overload;
      function OrderBy(aFieldName : String) : IModelDAO; overload;

      function OpenEmpty  : IModelDAO;
      function CloseEmpty : IModelDAO;

      procedure Open;

      procedure Clear;
      procedure ClearWhere;
      procedure ApplyUpdates;
      procedure CommitUpdates;
      procedure RefreshRecord;
      procedure UpdateGenerator(const aExpressionWhere : String = '');
      procedure ExecuteScriptSQL(aScript : String);

      procedure StartTransaction;
      procedure CommitTransaction;
      procedure RollbackTransaction;
  end;

implementation

{ TModelDAO }

procedure TModelDAO.ApplyUpdates;
begin
  FConn.Query.ApplyUpdates;
end;

procedure TModelDAO.Clear;
begin
  if FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Close;

  FConn.Query.SQL.Clear;
end;

procedure TModelDAO.ClearWhere;
begin
  if FConn.Query.DataSet.Active then
    FConn.Query.DataSet.Close;

  FConn.Query.SQL.ClearWhere;
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

constructor TModelDAO.Create;
begin
  FConn := TConnectionFactory.New;
end;

function TModelDAO.DataSet: TDataSet;
begin
  Result := FConn.Query.DataSet;
end;

destructor TModelDAO.Destroy;
begin
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
  Result := FConn.Query.SQL.Text + #13 + FConn.Query.SQL.Where;
end;

procedure TModelDAO.StartTransaction;
begin
  FConn.Query.StartTransaction;
end;

procedure TModelDAO.UpdateGenerator(const aExpressionWhere : String = '');
begin
  FConn.Query.UpdateGenerator(aExpressionWhere);
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

function TModelDAO.WhereOr(aFieldName, aFielValue: String; const aQuotedString : Boolean = True): IModelDAO;
begin
  Result := Self;
  FConn.Query.WhereOr(aFieldName, aFielValue, aQuotedString);
end;

end.
