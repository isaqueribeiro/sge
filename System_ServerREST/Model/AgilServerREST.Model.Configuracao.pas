unit AgilServerREST.Model.Configuracao;

interface

uses
  System.SysUtils;

type
  TAPI<T : class> = class
    private
      FParent    : T;
      Fprotocolo : String;
      Fporta     : Smallint;
      Fusuario   ,
      Fsenha     ,
      Fchave     : String;
    public
      constructor Create(aParent : T);
      destructor Destroy; override;
      function &End : T;

      function protocolo(Value : String) : TAPI<T>; overload;
      function protocolo : String; overload;
      function porta(Value : Smallint) : TAPI<T>; overload;
      function porta : Smallint; overload;
      function usuario(Value : String) : TAPI<T>; overload;
      function usuario : String; overload;
      function senha(Value : String) : TAPI<T>; overload;
      function senha : String; overload;
      function chave(Value : String) : TAPI<T>; overload;
      function chave : String; overload;
  end;

  TBanco<T : class> = class
    private
      FParent   : T;
      Fservidor : String;
      Fporta    : Smallint;
      Fbase     ,
      Fusuario  ,
      Fsenha    : String;
    public
      constructor Create(aParent : T);
      destructor Destroy; override;
      function &End : T;

      function servidor(Value : String) : TBanco<T>; overload;
      function servidor : String; overload;
      function porta(Value : Smallint) : TBanco<T>; overload;
      function porta : Smallint; overload;
      function base(Value : String) : TBanco<T>; overload;
      function base : String; overload;
      function usuario(Value : String) : TBanco<T>; overload;
      function usuario : String; overload;
      function senha(Value : String) : TBanco<T>; overload;
      function senha : String; overload;
  end;

  TConfiguracao = class
    private
      FAPI : TAPI<TConfiguracao>;
      FBanco : TBanco<TConfiguracao>;
    public
      constructor Create;
      destructor Destroy; override;

      function API : TAPI<TConfiguracao>;
      function Banco : TBanco<TConfiguracao>;
  end;

implementation

{ TAPI }

function TAPI<T>.&End: T;
begin
  Result := FParent;
end;

function TAPI<T>.porta: Smallint;
begin
  Result := Fporta;
end;

function TAPI<T>.porta(Value: Smallint): TAPI<T>;
begin
  Result := Self;
  Fporta := Value;
end;

function TAPI<T>.protocolo: String;
begin
  Result := Fprotocolo;
end;

function TAPI<T>.senha(Value: String): TAPI<T>;
begin
  Result := Self;
  Fsenha := Value.Trim;
end;

function TAPI<T>.senha: String;
begin
  Result := Fsenha;
end;

function TAPI<T>.usuario(Value: String): TAPI<T>;
begin
  Result   := Self;
  Fusuario := Value.Trim;
end;

function TAPI<T>.usuario: String;
begin
  Result := Fusuario;
end;

function TAPI<T>.protocolo(Value: String): TAPI<T>;
begin
  Result := Self;
  Fprotocolo := Value.Trim.ToLower;
end;

function TAPI<T>.chave: String;
begin
  Result := Fchave;
end;

function TAPI<T>.chave(Value: String): TAPI<T>;
begin
  Result := Self;
  Fchave := Value.Trim.ToUpper;
end;

constructor TAPI<T>.Create;
begin
  FParent    := aParent;
  Fprotocolo := 'http';
  Fporta     := 8085;
  Fusuario   := 'admin';
  Fsenha     := 'admin';
  Fchave     := 'RDWBASEKEY256';
end;

destructor TAPI<T>.Destroy;
begin
  inherited;
end;

{ TBanco }

function TBanco<T>.&End: T;
begin
  Result := FParent;
end;

function TBanco<T>.porta: Smallint;
begin
  Result := Fporta;
end;

function TBanco<T>.porta(Value: Smallint): TBanco<T>;
begin
  Result := Self;
  Fporta := Value;
end;

function TBanco<T>.senha(Value: String): TBanco<T>;
begin
  Result := Self;
  Fsenha := Value.Trim;
end;

function TBanco<T>.senha: String;
begin
  Result := Fsenha;
end;

function TBanco<T>.servidor: String;
begin
  Result := Fservidor;
end;

function TBanco<T>.usuario(Value: String): TBanco<T>;
begin
  Result   := Self;
  Fusuario := Value.Trim;
end;

function TBanco<T>.usuario: String;
begin
  Result := Fusuario;
end;

function TBanco<T>.servidor(Value: String): TBanco<T>;
begin
  Result    := Self;
  Fservidor := Value.Trim;
end;

function TBanco<T>.base: String;
begin
  Result := Fbase;
end;

function TBanco<T>.base(Value: String): TBanco<T>;
begin
  Result := Self;
  Fbase  := Value.Trim;
end;

constructor TBanco<T>.Create(aParent : T);
begin
  FParent   := aParent;
  Fservidor := 'localhost';
  Fporta    := 3050;
  Fbase     := 'agil_softwares';
  Fusuario  := 'sysdba';
  Fsenha    := 'masterkey';
end;

destructor TBanco<T>.Destroy;
begin
  inherited;
end;

{ TConfiguracao }

function TConfiguracao.API: TAPI<TConfiguracao>;
begin
  Result := FAPI;
end;

function TConfiguracao.Banco: TBanco<TConfiguracao>;
begin
  Result := FBanco;
end;

constructor TConfiguracao.Create;
begin
  FAPI   := TAPI<TConfiguracao>.Create(Self);
  FBanco := TBanco<TConfiguracao>.Create(Self);
end;

destructor TConfiguracao.Destroy;
begin
  FAPi.DisposeOf;
  FBanco.DisposeOf;
  inherited;
end;

end.
