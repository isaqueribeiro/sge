unit Model.Query.Firedac;

interface

uses
  Model.Query.Interfaces, FireDAC.Comp.Client, Data.DB;

type
  TModelQueryFiredac = class(TInterfacedObject, IModelQuery)
    private
      FConexao : TFDConnection;
      FQuery   : TFDQuery;
      FParametros : TParams;
    protected
      constructor Create(AConexao : TFDConnection);
    public
      destructor Destroy; override;
      class function New(AConexao : TFDConnection) : IModelQuery;

      function DataSet : TDataSet;
  end;

implementation

{ TModelQueryFiredac }

constructor TModelQueryFiredac.Create(AConexao: TFDConnection);
begin
  FQuery   := TFDQuery.Create(nil);
  FConexao := AConexao;
  FQuery.Connection  := FConexao;
  FQuery.Transaction := FConexao.Transaction;
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := TDataSet(FQuery);
end;

destructor TModelQueryFiredac.Destroy;
begin
  FQuery.DisposeOf;
  FConexao.DisposeOf;

  if Assigned(FParametros) then
    FParametros.DisposeOf;

  inherited;
end;

class function TModelQueryFiredac.New(AConexao: TFDConnection): IModelQuery;
begin
  Result := Self.Create(AConexao);
end;

end.
