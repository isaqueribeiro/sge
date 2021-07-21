unit SGE.Model.Connection.Component.SQL;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TSQL<T : class> = class
    private
      [weak]
      FParent  : T;
      FScriptL : TStringList;
    public
      constructor Create(aParent : T);
      destructor Destroy; override;

      function Clear : TSQL<T>;
      function Add(Value : String) : TSQL<T>;
      function AddStrings(Value : TStringList) : TSQL<T>;
      function Text : String;

      function &End : T;
  end;
implementation

{ TSQL<T> }

constructor TSQL<T>.Create(aParent: T);
begin
  FParent  := aParent;
  FScriptL := TStringList.Create;
end;

destructor TSQL<T>.Destroy;
begin
  FScriptL.DisposeOf;
  inherited;
end;

function TSQL<T>.&End: T;
begin
  Result := FParent;
end;

function TSQL<T>.Text: String;
begin
  Result := FScriptL.Text;
end;

function TSQL<T>.Add(Value: String): TSQL<T>;
begin
  Result := Self;
  FScriptL.Add(Value);
end;

function TSQL<T>.AddStrings(Value: TStringList): TSQL<T>;
begin
  Result := Self;
  FScriptL.AddStrings(Value);
end;

function TSQL<T>.Clear: TSQL<T>;
begin
  Result := Self;
  FScriptL.Clear;
end;

end.
