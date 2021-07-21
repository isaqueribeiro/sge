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
  end;

implementation

{ TConnectionFactory }

uses
  UDMBusiness;

constructor TConnectionFactory.Create;
begin
  ;
end;

destructor TConnectionFactory.Destroy;
begin
  inherited;
end;

class function TConnectionFactory.New : IConnection;
begin
  Result := Self.Create;
end;

function TConnectionFactory.Query : IConnection<TConnectionFireDAC>;
begin
  if not Assigned(FQuery) then
    FQuery := TConnectionFireDAC.New(DMBusiness.fdConexao);

  Result := FQuery;
end;

end.
