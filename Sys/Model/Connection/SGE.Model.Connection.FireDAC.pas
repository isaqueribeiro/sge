unit SGE.Model.Connection.FireDAC;

interface

uses
  System.SysUtils,
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
      FTableName : String;
      FScript    : TSQL<TConnectionFireDAC>;
      FQuery     : TFDQuery;

      function ExistParamByName(aParamName : String) : Boolean;
    protected
      constructor Create(aConn : TCustomConnection);
    public
      destructor Destroy; override;
      class function New(aConn : TCustomConnection) : IConnection<TConnectionFireDAC>;

      function TableName(aTableName : String) : IConnection<TConnectionFireDAC>;
      function SQL : TSQL<TConnectionFireDAC>;
      function ParamByName(aParamName, aParamValue : String) : IConnection<TConnectionFireDAC>; overload;
      function ParamByName(aParamName : String; aParamValue : Integer) : IConnection<TConnectionFireDAC>; overload;
      function ParamByName(aParamName : String; aParamValue : Int64) : IConnection<TConnectionFireDAC>; overload;
      function OpenOrExecute : Boolean;
      function DataSet : TDataSet;

      procedure Open;
      procedure ExecSQL;
      procedure Commit;
  end;

implementation

{ TConnectionFireDAC }

constructor TConnectionFireDAC.Create(aConn: TCustomConnection);
begin
  FTableName := EmptyStr;
  FScript    := TSQL<TConnectionFireDAC>.Create(Self);
  FQuery     := TFDQuery.Create(nil);
  FQuery.Connection    := TFDCustomConnection(aConn);
  FQuery.Transaction   := TFDCustomConnection(aConn).Transaction;
  FQuery.CachedUpdates := True;
end;

destructor TConnectionFireDAC.Destroy;
begin
  if FQuery.Active then
    FQuery.Close;

  FQuery.DisposeOf;
  FScript.DisposeOf;
  inherited;
end;

class function TConnectionFireDAC.New(aConn : TCustomConnection) : IConnection<TConnectionFireDAC>;
begin
  Result := Self.Create(aConn);
end;

procedure TConnectionFireDAC.Commit;
begin
  FQuery.ApplyUpdates(0);
  FQuery.CommitUpdates;
end;

function TConnectionFireDAC.DataSet: TDataSet;
begin
  Result := FQuery;
end;

procedure TConnectionFireDAC.ExecSQL;
begin
  FQuery.Close;
  FQuery.SQL.BeginUpdate;
  FQuery.SQL.Clear;
  FQuery.SQL.Add( FScript.Text );
  FQuery.SQL.EndUpdate;
  FQuery.ExecSQL;
end;

function TConnectionFireDAC.ExistParamByName(aParamName: String): Boolean;
begin
  Result := Assigned(FQuery.Params.FindParam(aParamName))
end;

procedure TConnectionFireDAC.Open;
begin
  FQuery.Close;
  FQuery.SQL.BeginUpdate;
  FQuery.SQL.Clear;
  FQuery.SQL.Add( FScript.Text );
  FQuery.SQL.EndUpdate;
  FQuery.Open;
end;

function TConnectionFireDAC.OpenOrExecute: Boolean;
begin
  FQuery.Close;
  FQuery.SQL.BeginUpdate;
  FQuery.SQL.Clear;
  FQuery.SQL.Add( FScript.Text );
  FQuery.SQL.EndUpdate;

  Result := FQuery.OpenOrExecute;
end;

function TConnectionFireDAC.ParamByName(aParamName: String; aParamValue: Int64): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  if ExistParamByName(aParamName) then
    FQuery.ParamByName(aParamName).AsLargeInt := aParamValue;
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

function TConnectionFireDAC.SQL: TSQL<TConnectionFireDAC>;
begin
  Result := FScript;
end;

function TConnectionFireDAC.TableName(aTableName: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self;
  FTableName := aTableName.Trim;
end;

end.
