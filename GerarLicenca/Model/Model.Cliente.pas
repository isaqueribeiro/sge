unit Model.Cliente;

interface

uses
  System.SysUtils,
  Model.Endereco,
  Model.Licenca;

type
  TCliente<T : class> = class
    private
      [weak]
      FParent   : T;
      Fdoc      : String;
      FUUID     : TGUID;
      FRazao    ,
      FFantasia ,
      FCnpj     ,
      FEmail    : String;
      FEndereco : TEndereco<TCliente<T>>;
      FLicenca  : TLicenca<TCliente<T>>;
      FRegistered : Boolean;
      function SomenteNumero(Value : String) : String;
    protected
      constructor Create(aParent : T);
    public
      destructor Destroy; override;
      class function New(aParent: T) : TCliente<T>;

      function doc(Value : String) : TCliente<T>; overload;
      function doc : String; overload;
      function UUID(Value : TGUID) : TCliente<T>; overload;
      function UUID : TGUID; overload;
      function Razao(Value : String) : TCliente<T>; overload;
      function Razao : String; overload;
      function Fantasia(Value : String) : TCliente<T>; overload;
      function Fantasia : String; overload;
      function Cnpj(Value : String) : TCliente<T>; overload;
      function Cnpj : String; overload;
      function Email(Value : String) : TCliente<T>; overload;
      function Email : String; overload;
      function Endereco : TEndereco<TCliente<T>>;
      function Licenca  : TLicenca<TCliente<T>>;
      function Registered(Value : Boolean) : TCliente<T>; overload;
      function Registered : Boolean; overload;

      function &End : T;
  end;

implementation

{ TCliente<T> }

constructor TCliente<T>.Create(aParent: T);
begin
  FParent   := aParent;
  Fdoc      := EmptyStr;
  FUUID     := TGUID.Empty;
  FRazao    := EmptyStr;
  FFantasia := EmptyStr;
  FCnpj     := EmptyStr;
  FEmail    := EmptyStr;
  FEndereco := TEndereco<TCliente<T>>.New(Self);
  FLicenca  := TLicenca<TCliente<T>>.New(Self);
  FRegistered := False;
end;

destructor TCliente<T>.Destroy;
begin
  if Assigned(FEndereco) then
    FEndereco.DisposeOf;
  inherited;
end;

class function TCliente<T>.New(aParent: T): TCliente<T>;
begin
  Result := Self.Create(aParent);
end;

function TCliente<T>.SomenteNumero(Value: String): String;
var
  I : Integer;
begin
  Result := EmptyStr;
  for I := 1 To Value.Length do
    if Value[I] In ['0'..'9'] Then
      Result := Result + Value[I];
end;

function TCliente<T>.Cnpj(Value: String): TCliente<T>;
begin
  Result := Self;
  FCnpj  := SomenteNumero(Value.Trim);
end;

function TCliente<T>.Cnpj: String;
begin
  Result := FCnpj;
end;

function TCliente<T>.doc: String;
begin
  Result := Fdoc;
end;

function TCliente<T>.doc(Value: String): TCliente<T>;
begin
  Result := Self;
  Fdoc   := Value.Trim;
end;

function TCliente<T>.Email(Value: String): TCliente<T>;
begin
  Result := Self;
  FEmail := Value.Trim.ToLower;
end;

function TCliente<T>.Email: String;
begin
  Result := FEmail;
end;

function TCliente<T>.Endereco: TEndereco<TCliente<T>>;
begin
  Result := FEndereco;
end;

function TCliente<T>.Fantasia: String;
begin
  Result := FFantasia;
end;

function TCliente<T>.Licenca: TLicenca<TCliente<T>>;
begin
  Result := FLicenca;
end;

function TCliente<T>.Fantasia(Value: String): TCliente<T>;
begin
  Result := Self;
  FFantasia := Value.Trim;
end;

function TCliente<T>.Razao(Value: String): TCliente<T>;
begin
  Result := Self;
  FRazao := Value.Trim;
end;

function TCliente<T>.Razao: String;
begin
  Result := FRazao;
end;

function TCliente<T>.Registered: Boolean;
begin
  Result := FRegistered;
end;

function TCliente<T>.Registered(Value: Boolean): TCliente<T>;
begin
  Result := Self;
  FRegistered := Value;
end;

function TCliente<T>.UUID(Value: TGUID): TCliente<T>;
begin
  Result := Self;
  FUUID  := Value;
end;

function TCliente<T>.UUID: TGUID;
begin
  Result := FUUID;
end;

function TCliente<T>.&End: T;
begin
  Result := FParent;
end;

end.
