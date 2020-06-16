unit Classe.Pessoa;

interface

Uses
  System.SysUtils;

type
  TPessoa = class
    private
      FCodigo : Integer;
      FNome   : String;
      procedure SetCodigo(const Value: Integer);
      procedure SetNome(const Value: String);
    protected
      constructor Create();
    public
      constructor Instanciar;

      property Codigo : Integer read FCodigo write SetCodigo;
      property Nome   : String read FNome write SetNome;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create();
begin
  inherited Create;
  FCOdigo := 0;
  FNome   := EmptyStr;
end;

constructor TPessoa.Instanciar;
begin
  Create();
end;

procedure TPessoa.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value.Trim();
end;

end.
