unit Model.Licenca;

interface

uses
  System.SysUtils,
  System.DateUtils;

type
  TSistemas<T : class> = class
    private
      [weak]
      FParent : T;
      FSGE ,
      FSGO ,
      FSGI ,
      FSGF : Boolean;
    protected
      constructor Create(aParent : T);
    public
      destructor Destroy; override;
      class function New(aParent: T) : TSistemas<T>;

      function SGE(Value : Boolean) : TSistemas<T>; overload;
      function SGE : Boolean; overload;
      function SGO(Value : Boolean) : TSistemas<T>; overload;
      function SGO : Boolean; overload;
      function SGI(Value : Boolean) : TSistemas<T>; overload;
      function SGI : Boolean; overload;
      function SGF(Value : Boolean) : TSistemas<T>; overload;
      function SGF : Boolean; overload;

      function &End : T;
  end;

  TLicenca<T : class> = class
    private
      [weak]
      FParent : T;
      FCompetencia : Integer;
      FBloqueio    : TDateTime;
      FSistemas : TSistemas<TLicenca<T>>;
    protected
      constructor Create(aParent : T);
    public
      destructor Destroy; override;
      class function New(aParent: T) : TLicenca<T>;

      function Competencia(Value : Integer) : TLicenca<T>; overload;
      function Competencia : Integer; overload;
      function Bloqueio(Value : TDateTime) : TLicenca<T>; overload;
      function Bloqueio : TDateTime; overload;
      function Sistemas : TSistemas<TLicenca<T>>;

      function &End : T;
  end;

implementation

{ TSistemas<T> }

constructor TSistemas<T>.Create(aParent: T);
begin
  FParent := aParent;
  FSGE := False;
  FSGO := False;
  FSGI := False;
  FSGF := False;
end;

destructor TSistemas<T>.Destroy;
begin
  inherited;
end;

class function TSistemas<T>.New(aParent: T): TSistemas<T>;
begin
  Result := Self.Create(aParent);
end;

function TSistemas<T>.SGE: Boolean;
begin
  Result := FSGE;
end;

function TSistemas<T>.SGE(Value: Boolean): TSistemas<T>;
begin
  Result := Self;
  FSGE   := Value;
end;

function TSistemas<T>.SGF(Value: Boolean): TSistemas<T>;
begin
  Result := Self;
  FSGF   := Value;
end;

function TSistemas<T>.SGF: Boolean;
begin
  Result := FSGF;
end;

function TSistemas<T>.SGI: Boolean;
begin
  Result := FSGI;
end;

function TSistemas<T>.SGI(Value: Boolean): TSistemas<T>;
begin
  Result := Self;
  FSGI   := Value;
end;

function TSistemas<T>.SGO(Value: Boolean): TSistemas<T>;
begin
  Result := Self;
  FSGO   := Value;
end;

function TSistemas<T>.SGO: Boolean;
begin
  Result := FSGO;
end;

function TSistemas<T>.&End: T;
begin
  Result := FParent;
end;

{ TLicenca<T> }

constructor TLicenca<T>.Create(aParent: T);
begin
  FParent := aParent;
  FCompetencia := FormatDateTime('yyyymm', Date).ToInteger;
  FBloqueio    := IncDay(Date, 15);
  FSistemas    := TSistemas<TLicenca<T>>.Create(Self);
end;

destructor TLicenca<T>.Destroy;
begin
  FSistemas.DisposeOf;
  inherited;
end;

class function TLicenca<T>.New(aParent: T): TLicenca<T>;
begin
  Result := Self.Create(aParent);
end;

function TLicenca<T>.Sistemas: TSistemas<TLicenca<T>>;
begin
  Result := FSistemas;
end;

function TLicenca<T>.Bloqueio(Value: TDateTime): TLicenca<T>;
begin
  Result := Self;
  FBloqueio := Value;
end;

function TLicenca<T>.Bloqueio: TDateTime;
begin
  Result := FBloqueio;
end;

function TLicenca<T>.Competencia(Value: Integer): TLicenca<T>;
begin
  Result := Self;
  FCompetencia := Value;
end;

function TLicenca<T>.Competencia: Integer;
begin
  Result := FCompetencia;
end;

function TLicenca<T>.&End: T;
begin
  Result := FParent;
end;

end.
