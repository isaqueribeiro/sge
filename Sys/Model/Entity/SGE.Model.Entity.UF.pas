unit SGE.Model.Entity.UF;

interface

type
  TUF<T : class> = class
    private
      FParent : T;
      Fcodigo : Smallint;
      Fnome   ,
      Fsigla  : String;
      Fcodigo_siafi  : Integer;
      Faliquota_icms ,
      Faliquota_fcp  : Currency;
    public
      constructor Create(aParent : T);
      destructor Destroy; override;

      function codigo(Value : Smallint) : TUF<T>; overload;
      function codigo : Smallint; overload;
      function nome(Value : String) : TUF<T>; overload;
      function nome : String; overload;
      function sigla(Value : String) : TUF<T>; overload;
      function sigla : String; overload;
      function codigo_siafi(Value : Integer) : TUF<T>; overload;
      function codigo_siafi : Integer; overload;
      function aliquota_icms(Value : Double) : TUF<T>; overload;
      function aliquota_icms : Currency; overload;
      function aliquota_fcp(Value : Currency) : TUF<T>; overload;
      function aliquota_fcp : Currency; overload;

      function &End : T;
  end;

implementation

uses
  System.SysUtils;

{ TUF<T> }

function TUF<T>.aliquota_fcp(Value: Currency): TUF<T>;
begin
  Result := Self;
  Faliquota_fcp := Value;
end;

function TUF<T>.aliquota_fcp: Currency;
begin
  Result := Faliquota_fcp;
end;

function TUF<T>.aliquota_icms(Value: Double): TUF<T>;
begin
  Result := Self;
  Faliquota_icms := Value;
end;

function TUF<T>.aliquota_icms: Currency;
begin
  Result := Faliquota_icms;
end;

function TUF<T>.codigo(Value: Smallint): TUF<T>;
begin
  Result  := Self;
  Fcodigo := Value;
end;

function TUF<T>.codigo: Smallint;
begin
  Result := Fcodigo;
end;

function TUF<T>.codigo_siafi(Value: Integer): TUF<T>;
begin
  Result := Self;
  Fcodigo_siafi := Value;
end;

function TUF<T>.codigo_siafi: Integer;
begin
  Result := Fcodigo_siafi;
end;

function TUF<T>.&End: T;
begin
  Result := FParent;
end;

constructor TUF<T>.Create(aParent: T);
begin
  FParent := aParent;
  Fcodigo := 0;
  Fnome   := EmptyStr;
  Fsigla  := EmptyStr;
  Fcodigo_siafi  := 0;
  Faliquota_icms := 0.0;
  Faliquota_fcp  := 0.0;
end;

destructor TUF<T>.Destroy;
begin
  inherited;
end;

function TUF<T>.nome(Value: String): TUF<T>;
begin
  Result := Self;
  Fnome  := Value.Trim;
end;

function TUF<T>.nome: String;
begin
  Result := Fnome;
end;

function TUF<T>.sigla(Value: String): TUF<T>;
begin
  Result := Self;
  Fsigla := Copy(Value.Trim.ToUpper, 1, 2);
end;

function TUF<T>.sigla: String;
begin
  Result := Fsigla;
end;

end.
