unit Classe.PessoaFisica;

interface

Uses
  System.SysUtils, Classe.Pessoa, Interacao.Pessoa;

type
  TPessoaFisica = class(TPessoa, IPessoaFisicaModel)
    private
      FCPF : String;

      function CPF(Value : String) : IPessoaFisicaModel; overload;
      function CPF : String; overload;
    public
      constructor Create;
      destructor Destroy; override;

      class function New : TPessoaFisica;
  end;

implementation

{ TPessoaFisica }

function TPessoaFisica.CPF: String;
begin
  Result := FCPF;
end;

function TPessoaFisica.CPF(Value: String): IPessoaFisicaModel;
begin
  Result := Self;
  FCPF   := Value.Trim();
end;

constructor TPessoaFisica.Create;
begin
  inherited;
  FCPF := EmptyStr;
end;

destructor TPessoaFisica.Destroy;
begin
  inherited;
end;

class function TPessoaFisica.New: TPessoaFisica;
begin
  Result := Self.Create;
end;

end.
