unit Model.Conexao.Factory;

interface

uses
  Model.Conexao.Factory.Interfaces, Model.Conexao.Interfaces;

type
  TTipoConexaoFactory  = (conexaoFiredacSQLite, conexaoFiredacFireBird);
  TModelConexaoFactory = class(TInterfacedObject, IModelConexaoFactory)
    private
      FTipo : TTipoConexaoFactory;
    protected
      constructor Create(Value : TTipoConexaoFactory);
    public
      destructor Destroy; override;

      class function New(ATipo : TTipoConexaoFactory) : IModelConexaoFactory;

      function Conexao : IModelConexao;
  end;

implementation

uses
  Model.Conexao.Firedac.Firebird;

{ TModelConexaoFactory }

function TModelConexaoFactory.Conexao: IModelConexao;
begin
  case FTipo of
    conexaoFiredacSQLite   : Result := nil;
    conexaoFiredacFireBird : Result := TModelConexaoFiredacFireBird.New;
  end;
end;

constructor TModelCOnexaoFactory.Create(Value : TTipoConexaoFactory);
begin
  FTipo := Value;
end;

destructor TModelConexaoFactory.Destroy;
begin
  inherited;
end;

class function TModelConexaoFactory.New(ATipo : TTipoConexaoFactory): IModelConexaoFactory;
begin
  Result := Self.Create(ATipo);
end;

end.
