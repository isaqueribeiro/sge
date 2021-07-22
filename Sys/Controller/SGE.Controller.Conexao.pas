unit SGE.Controller.Conexao;

interface

uses
  SGE.Model.Interacao.DataSet, System.Classes;

type
  TControllerConexao = class
    private
      FSQL : TStrings;
      FDataSet : IModelConexaoDataSet;
    public
      constructor Create;
      destructor Destroy; override;

      function Conexao : IModelConexaoDataSet;
  end;

implementation

uses
  SGE.Model.Factory;

{ TControllerConexao }

constructor TControllerConexao.Create;
begin
  FDataSet := TModelConexaoFactory.Create.DataSet;
  FSQL := TStringList.Create;
  FSQL.Clear;
end;

function TControllerConexao.Conexao : IModelConexaoDataSet;
begin
  Result := FDataSet;
end;

destructor TControllerConexao.Destroy;
begin
  FSQL.DisposeOf;
  FSQL := nil;

  inherited;
end;

end.
