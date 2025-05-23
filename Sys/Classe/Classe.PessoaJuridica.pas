unit Classe.PessoaJuridica;

interface

Uses
  System.SysUtils, Classe.Pessoa, Interacao.Pessoa;

type
  TPessoaJuridica = class(TPessoa, IPessoaJuridicaModel)
    private
      FFantasia ,
      FCNPJ     ,
      FEndereco : String;
    published
      function RazaoSocial : String; overload;
      function Fantasia : String; overload;
      function CNPJ : String; overload;
      function Endereco : String; overload;
    public
      function Codigo(Value : Integer) : IPessoaJuridicaModel; overload;
      function RazaoSocial(Value : String) : IPessoaJuridicaModel; overload;
      function Fantasia(Value : String) : IPessoaJuridicaModel; overload;
      function CNPJ(Value : String) : IPessoaJuridicaModel; overload;
      function Endereco(Value : String) : IPessoaJuridicaModel; overload;

      constructor Create;
      destructor Destroy; override;

      class function New : TPessoaJuridica;
  end;

implementation

{ TPessoaJuridica }

function TPessoaJuridica.CNPJ: String;
begin
  Result := FCNPJ;
end;

function TPessoaJuridica.CNPJ(Value: String): IPessoaJuridicaModel;
begin
  Result := Self;
  FCNPJ  := Value.Trim();
end;

function TPessoaJuridica.Codigo(Value: Integer): IPessoaJuridicaModel;
begin
  Result := Self;
  IPessoaModel(Self).Codigo(Value);
end;

constructor TPessoaJuridica.Create;
begin
  FCNPJ := EmptyStr;
  FEndereco := EmptyStr;
end;

destructor TPessoaJuridica.Destroy;
begin
  inherited;
end;

function TPessoaJuridica.Endereco(Value: String): IPessoaJuridicaModel;
begin
  Result    := Self;
  FEndereco := Value.Trim;
end;

function TPessoaJuridica.Endereco: String;
begin
  Result := FEndereco;
end;

function TPessoaJuridica.Fantasia(Value: String): IPessoaJuridicaModel;
begin
  Result    := Self;
  FFantasia := Value.Trim();
end;

function TPessoaJuridica.Fantasia: String;
begin
  Result := FFantasia;
end;

class function TPessoaJuridica.New: TPessoaJuridica;
begin
  Result := Self.Create;
end;

function TPessoaJuridica.RazaoSocial(Value: String): IPessoaJuridicaModel;
begin
  Result := Self;
  IPessoaModel(Self).Nome(Value);
end;

function TPessoaJuridica.RazaoSocial: String;
begin
  Result := Nome;
end;

end.
