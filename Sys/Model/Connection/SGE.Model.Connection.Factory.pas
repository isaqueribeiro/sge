unit SGE.Model.Connection.Factory;

interface

uses
  Data.DB,
  SGE.Model.Connection.Interfaces,
  SGE.Model.Connection.FireDAC;

type
  IConnection = interface
    ['{A8E8C0DC-6BFC-46CF-ACBD-F96D70490D7B}']
    function Query : IConnection<TConnectionFireDAC>;
    function ExecuteSQL(Value : String) : IConnection<TConnectionFireDAC>;
    function GetNextID(aTableName, aFieldName : String; const sWhere : String = '') : Largeint;
    function GetCountID(aTableName : String; const sWhere : String = '') : Largeint;

    procedure CommitRetaining;
  end;

  TConnectionFactory = class(TInterfacedObject, IConnection)
    private
      FQuery : IConnection<TConnectionFireDAC>;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IConnection;

      function Query : IConnection<TConnectionFireDAC>;
      function ExecuteSQL(Value : String) : IConnection<TConnectionFireDAC>;
      function GetNextID(aTableName, aFieldName : String; const sWhere : String = '') : Largeint;
      function GetCountID(aTableName : String; const sWhere : String = '') : Largeint;

      procedure CommitRetaining;
  end;

implementation

{ TConnectionFactory }

uses
  UDMBusiness;

procedure TConnectionFactory.CommitRetaining;
begin
  DMBusiness.fdConexao.CommitRetaining;
end;

constructor TConnectionFactory.Create;
begin
  ;
end;

destructor TConnectionFactory.Destroy;
begin
  inherited;
end;

function TConnectionFactory.ExecuteSQL(Value: String): IConnection<TConnectionFireDAC>;
begin
  Result := Self.FQuery;
  DMBusiness.fdConexao.ExecSQL(Value, True);
end;

function TConnectionFactory.GetCountID(aTableName: String; const sWhere: String): Largeint;
var
  aQuery : IConnection<TConnectionFireDAC>;
begin
  aQuery := TConnectionFireDAC.New(DMBusiness.fdConexao);
  try
    aQuery
      .SQL
        .Clear
        .Add('Select count(*) as Registros from ' + aTableName + ' ' + sWhere)
      .&End
      .Open;

    Result := aQuery.DataSet.FieldByName('Registros').AsLargeInt;
  finally
    aQuery.Close;
  end;
end;

function TConnectionFactory.GetNextID(aTableName, aFieldName : String; const sWhere: String): Largeint;
var
  aQuery : IConnection<TConnectionFireDAC>;
begin
  aQuery := TConnectionFireDAC.New(DMBusiness.fdConexao);
  try
    aQuery
      .SQL
        .Clear
        .Add('Select max(' + aFieldName + ') as ID from ' + aTableName + ' ' + sWhere)
      .&End
      .Open;

    Result := aQuery.DataSet.FieldByName('ID').AsLargeInt;
  finally
    aQuery.Close;
  end;
end;

class function TConnectionFactory.New : IConnection;
begin
  Result := Self.Create;
end;

function TConnectionFactory.Query : IConnection<TConnectionFireDAC>;
begin
  if (not Assigned(FQuery)) and (Assigned(DMBusiness)) then
    FQuery := TConnectionFireDAC.New(DMBusiness.fdConexao);

  Result := FQuery;
end;

end.
