unit Model.Usuario;

interface

uses
  System.SysUtils;

type
  TUsuario<T : class> = class
    private
      [weak]
      FParent: T;
      Fdoc   : String;
      FUUID  : TGUID;
      FEmail ,
      FPasswd,
      FDisplayName  ,
      FTokenID      ,
      FRefreshToken : String;
      FExpiresIn    : Integer;
      FRegistered   : Boolean;
    protected
      constructor Create(aParent: T);
    public
      destructor Destroy; override;
      class function New(aParent: T) : TUsuario<T>;

      function doc(Value : String) : TUsuario<T>; overload;
      function doc : String; overload;
      function UUID(Value : TGUID) : TUsuario<T>; overload;
      function UUID : TGUID; overload;
      function Email(Value : String) : TUsuario<T>; overload;
      function Email : String; overload;
      function Passwd(Value : String) : TUsuario<T>; overload;
      function Passwd : String; overload;
      function DisplayName(Value : String) : TUsuario<T>; overload;
      function DisplayName : String; overload;
      function TokenID(Value : String) : TUsuario<T>; overload;
      function TokenID : String; overload;
      function RefreshToken(Value : String) : TUsuario<T>; overload;
      function RefreshToken : String; overload;
      function ExpiresIn(Value : Integer) : TUsuario<T>; overload;
      function ExpiresIn : Integer; overload;
      function Registered(Value : Boolean) : TUsuario<T>; overload;
      function Registered : Boolean; overload;

      function &End : T;
  end;

implementation

{ TUsuario<T> }

function TUsuario<T>.&End: T;
begin
  Result := FParent;
end;

constructor TUsuario<T>.Create(aParent: T);
begin
  FParent := aParent;
  Fdoc    := EmptyStr;
  FUUID   := TGUID.Empty;
  FEmail  := EmptyStr;
  FPasswd := EmptyStr;
  FDisplayName  := EmptyStr;
  FTokenID      := EmptyStr;
  FRefreshToken := EmptyStr;
  FExpiresIn    := 0;
  FRegistered   := False;
end;

destructor TUsuario<T>.Destroy;
begin
  inherited;
end;

class function TUsuario<T>.New(aParent: T) : TUsuario<T>;
begin
  Result := Self.Create(aParent);
end;

function TUsuario<T>.Passwd: String;
begin
  Result := FPasswd;
end;

function TUsuario<T>.Passwd(Value: String): TUsuario<T>;
begin
  Result  := Self;
  FPasswd := Value;
end;

function TUsuario<T>.DisplayName: String;
begin
  Result := FDisplayName;
end;

function TUsuario<T>.doc: String;
begin
  Result := Fdoc;
end;

function TUsuario<T>.doc(Value: String): TUsuario<T>;
begin
  Result := Self;
  Fdoc   := Value.Trim;
end;

function TUsuario<T>.DisplayName(Value: String): TUsuario<T>;
begin
  Result := Self;
  FDisplayName := Value.Trim;
end;

function TUsuario<T>.Email: String;
begin
  Result := FEmail;
end;

function TUsuario<T>.Email(Value: String): TUsuario<T>;
begin
  Result := Self;
  FEmail := Value.Trim.ToLower;
end;

function TUsuario<T>.ExpiresIn: Integer;
begin
  Result := FExpiresIn;
end;

function TUsuario<T>.ExpiresIn(Value: Integer): TUsuario<T>;
begin
  Result := Self;
  FExpiresIn := Value;
end;

function TUsuario<T>.RefreshToken: String;
begin
  Result := FRefreshToken;
end;

function TUsuario<T>.Registered: Boolean;
begin
  Result := FRegistered;
end;

function TUsuario<T>.Registered(Value: Boolean): TUsuario<T>;
begin
  Result := Self;
  FRegistered := Value;
end;

function TUsuario<T>.RefreshToken(Value: String): TUsuario<T>;
begin
  Result := Self;
  FRefreshToken := Value.Trim;
end;

function TUsuario<T>.TokenID(Value: String): TUsuario<T>;
begin
  Result := Self;
  FTokenID := Value.Trim;
end;

function TUsuario<T>.TokenID: String;
begin
  Result := FTokenID;
end;

function TUsuario<T>.UUID(Value: TGUID): TUsuario<T>;
begin
  Result := Self;
  FUUID  := Value;
end;

function TUsuario<T>.UUID: TGUID;
begin
  Result := FUUID;
end;

end.
