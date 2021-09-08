unit Model.Endereco;

interface

uses
  System.SysUtils;

type
  TEndereco<T : class> = class
    private
      [weak]
      FParent : T;
      FLogradouro ,
      FNumero     ,
      FComplemento,
      FBairro,
      FCep   ,
      FCidade,
      FUF    : String;
    protected
      constructor Create(aParent : T);
    public
      destructor Destroy; override;
      class function New(aParent: T) : TEndereco<T>;

      function Logradouro(Value : String) : TEndereco<T>; overload;
      function Logradouro : String; overload;
      function Numero(Value : String) : TEndereco<T>; overload;
      function Numero : String; overload;
      function Complemento(Value : String) : TEndereco<T>; overload;
      function Complemento : String; overload;
      function Bairro(Value : String) : TEndereco<T>; overload;
      function Bairro : String; overload;
      function Cep(Value : String) : TEndereco<T>; overload;
      function Cep : String; overload;
      function Cidade(Value : String) : TEndereco<T>; overload;
      function Cidade : String; overload;
      function UF(Value : String) : TEndereco<T>; overload;
      function UF : String; overload;

      function &End : T;
  end;

implementation

{ TEndereco<T> }

constructor TEndereco<T>.Create(aParent: T);
begin
  FParent := aParent;
  FLogradouro  := EmptyStr;
  FNumero      := EmptyStr;
  FComplemento := EmptyStr;
  FBairro := EmptyStr;
  FCep    := EmptyStr;
  FCidade := EmptyStr;
  FUF     := EmptyStr;
end;

destructor TEndereco<T>.Destroy;
begin
  inherited;
end;

class function TEndereco<T>.New(aParent: T): TEndereco<T>;
begin
  Result := Self.Create(aParent);
end;

function TEndereco<T>.Bairro(Value: String): TEndereco<T>;
begin
  Result  := Self;
  FBairro := Value.Trim;
end;

function TEndereco<T>.Bairro: String;
begin
  Result  := FBairro;
end;

function TEndereco<T>.Cep: String;
begin
  Result := FCep;
end;

function TEndereco<T>.Cep(Value: String): TEndereco<T>;
begin
  Result := Self;
  FCep   := Value.Trim;
end;

function TEndereco<T>.Cidade: String;
begin
  Result  := FCidade;
end;

function TEndereco<T>.Cidade(Value: String): TEndereco<T>;
begin
  Result  := Self;
  FCidade := Value.Trim;
end;

function TEndereco<T>.Complemento(Value: String): TEndereco<T>;
begin
  Result := Self;
  FComplemento := Value.Trim;
end;

function TEndereco<T>.Complemento: String;
begin
  Result := FComplemento;
end;

function TEndereco<T>.Logradouro: String;
begin
  Result := FLogradouro;
end;

function TEndereco<T>.Logradouro(Value: String): TEndereco<T>;
begin
  Result := Self;
  FLogradouro := Value.Trim;
end;

function TEndereco<T>.Numero: String;
begin
  Result := FNumero;
end;

function TEndereco<T>.Numero(Value: String): TEndereco<T>;
begin
  Result  := Self;
  FNumero := Value.Trim;
end;

function TEndereco<T>.UF: String;
begin
  Result := FUF;
end;

function TEndereco<T>.UF(Value: String): TEndereco<T>;
begin
  Result := Self;
  FUF    := Copy(Value.Trim.ToUpper, 1, 2);
end;

function TEndereco<T>.&End: T;
begin
  Result := FParent;
end;

end.
