unit Classe.Funcao;

interface

uses
  System.SysUtils, Interacao.Funcao;

type
  TFuncao = class(TInterfacedObject, IFuncao)
    private
      FCodigo : Integer;
      FNome   : String;

      function Codigo(Value : Integer) : IFuncao; overload;
      function Codigo : Integer; overload;

      function Nome(Value : String) : IFuncao; overload;
      function Nome : String; overload;
    public
      constructor Create;
      destructor Destroy; override;

      class function New : IFuncao;
  end;

implementation

{ TFuncao }

function TFuncao.Codigo(Value: Integer): IFuncao;
begin
  Result  := Self;
  FCodigo := Value;
end;

function TFuncao.Codigo: Integer;
begin
  Result := FCodigo;
end;

constructor TFuncao.Create;
begin
  FCodigo := 0;
  FNome   := EmptyStr;
end;

destructor TFuncao.Destroy;
begin
  inherited;
end;

function TFuncao.Nome(Value: String): IFuncao;
begin
  Result := Self;
  FNome  := Value.Trim();
end;

class function TFuncao.New: IFuncao;
begin
  Result := Self.Create;
end;

function TFuncao.Nome: String;
begin
  Result := FNome;
end;

end.
