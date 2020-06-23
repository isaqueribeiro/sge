unit Classe.Pessoa;

interface

Uses
  Interacao.Pessoa, System.SysUtils;

type
  TPessoa = class(TInterfacedObject, IPessoaModel)
    private
      FCOdigo : Integer;
      FNome   : String;

      function Codigo(Value : Integer) : IPessoaModel; overload;
      function Codigo : Integer; overload;

      function Nome(Value : String) : IPessoaModel; overload;
      function Nome : String; overload;
    public
      constructor Create;
      destructor Destroy; override;

      class function New : IPessoaModel;
  end;

implementation

{ TPessoa }

function TPessoa.Codigo: Integer;
begin
  Result := FCodigo;
end;

constructor TPessoa.Create;
begin
  FCOdigo := 0;
  FNome   := EmptyStr;
end;

function TPessoa.Codigo(Value: Integer): IPessoaModel;
begin
  Result  := Self;
  FCOdigo := Value;
end;

destructor TPessoa.Destroy;
begin
  inherited;
end;

class function TPessoa.New: IPessoaModel;
begin
  Result := Self.Create;
end;

function TPessoa.Nome: String;
begin
  Result := FNome;
end;

function TPessoa.Nome(Value: String): IPessoaModel;
begin
  Result := Self;
  FNome  := Value.Trim();
end;

end.
