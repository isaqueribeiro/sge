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
