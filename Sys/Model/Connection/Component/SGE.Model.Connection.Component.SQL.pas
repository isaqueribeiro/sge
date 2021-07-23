unit SGE.Model.Connection.Component.SQL;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes;

type
  TSQL<T : class> = class
    private
      [weak]
      FParent  : T;
      FScripts ,
      FWhere   ,
      FOrderBy : TStringList;
      procedure AddWhere(aExpression : String; const isAnd : Boolean = True);
    public
      constructor Create(aParent : T);
      destructor Destroy; override;

      function Clear : TSQL<T>;
      function ClearWhere : TSQL<T>;
      function ClearWhereEmpty : TSQL<T>;
      function Add(Value : String) : TSQL<T>;
      function AddStrings(Value : TStringList) : TSQL<T>;
      function Text  : String;
      function Where : String; overload;
      function OrderBy : String; overload;

      function WhereEmpty :  TSQL<T>; overload;
      function Where(aExpressionWhere : String) :  TSQL<T>; overload;
      function Where(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) :  TSQL<T>; overload;
      function Where(aFieldName : String; aFielValue : Integer) :  TSQL<T>; overload;
      function Where(aFieldName : String; aFielValue : Int64) :  TSQL<T>; overload;
      function WhereOr(aFieldName, aFielValue : String; const aQuotedString : Boolean = True) :  TSQL<T>;
      function OrderBy(aFieldName : String) :  TSQL<T>; overload;

      function &End : T;
  end;
implementation

{ TSQL<T> }

constructor TSQL<T>.Create(aParent: T);
begin
  FParent  := aParent;
  FScripts := TStringList.Create;
  FWhere   := TStringList.Create;
  FOrderBy := TStringList.Create;
end;

destructor TSQL<T>.Destroy;
begin
  FScripts.DisposeOf;
  FWhere.DisposeOf;
  FOrderBy.DisposeOf;
  inherited;
end;

function TSQL<T>.&End: T;
begin
  Result := FParent;
end;

function TSQL<T>.OrderBy: String;
begin
  Result := FOrderBy.Text;
end;

function TSQL<T>.OrderBy(aFieldName : String): TSQL<T>;
begin
  Result := Self;
  if (FOrderBy.Count = 0) then
  begin
    FOrderBy.Add('ORDER BY');
    FOrderBy.Add('    ' + aFieldName);
  end
  else
    FOrderBy.Add('  , ' + aFieldName);
end;

function TSQL<T>.Text: String;
begin
  Result := FScripts.Text;
end;

function TSQL<T>.Where: String;
begin
  Result := EmptyStr;
  if (FWhere.Count > 0) then
    Result := 'WHERE ' + FWhere.Text;
end;

function TSQL<T>.Where(aExpressionWhere: String): TSQL<T>;
var
  aExpression : String;
begin
  Result := Self;
  aExpression := '(' + aExpressionWhere.Trim + ')';
  AddWhere(aExpression);
end;

function TSQL<T>.Where(aFieldName, aFielValue: String; const aQuotedString : Boolean = True): TSQL<T>;
var
  aExpression : String;
begin
  Result := Self;
  aExpression := '(' + aFieldName.Trim + ' = ' + IfThen(aQuotedString, aFielValue.Trim.QuotedString, aFielValue.Trim) + ')';
  AddWhere(aExpression);
end;

function TSQL<T>.Where(aFieldName: String; aFielValue: Integer): TSQL<T>;
begin
  Result := Self.Where(aFieldName, aFielValue.ToString, False);
end;

function TSQL<T>.Where(aFieldName: String; aFielValue: Int64): TSQL<T>;
begin
  Result := Self.Where(aFieldName, aFielValue.ToString, False);
end;

function TSQL<T>.WhereEmpty: TSQL<T>;
begin
  Result := Self;
  AddWhere('(1 = 0)');
end;

function TSQL<T>.WhereOr(aFieldName, aFielValue: String; const aQuotedString: Boolean): TSQL<T>;
var
  aExpression : String;
begin
  Result := Self;
  aExpression := '(' + aFieldName.Trim + ' = ' + IfThen(aQuotedString, aFielValue.Trim.QuotedString, aFielValue.Trim) + ')';
  AddWhere(aExpression, False);
end;

function TSQL<T>.Add(Value: String): TSQL<T>;
begin
  Result := Self;
  FScripts.Add(Value);
end;

function TSQL<T>.AddStrings(Value: TStringList): TSQL<T>;
begin
  Result := Self;
  FScripts.AddStrings(Value);
end;

procedure TSQL<T>.AddWhere(aExpression: String; const isAnd : Boolean = True);
begin
  if (FWhere.Count = 0) then
    FWhere.Add(aExpression)
  else
    FWhere.Add(IfThen(isAnd, ' AND ', ' OR ') + aExpression);
end;

function TSQL<T>.Clear: TSQL<T>;
begin
  Result := Self;
  FScripts.Clear;
  FWhere.Clear;
  FOrderBy.Clear;
end;

function TSQL<T>.ClearWhere: TSQL<T>;
begin
  Result := Self;
  FWhere.Clear;
  FOrderBy.Clear;
end;

function TSQL<T>.ClearWhereEmpty: TSQL<T>;
var
  I : Integer;
begin
  Result := Self;
  for I := Pred(FWhere.Count) downto 0 do
  begin
    if FWhere.Strings[I] = ' AND (1 = 0)' then
      FWhere.Delete(I)
    else
    if FWhere.Strings[I] = 'WHERE (1 = 0)' then
      FWhere.Delete(I);
  end;
end;

end.
