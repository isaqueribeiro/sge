unit Interfaces.PrevisaoTempo;

interface

uses
  System.SysUtils, System.Classes;

type
  TPrevisaoTempo = class
    private
      FTemperatura : String;
      FURLClima    : String;
      FStrClima    : String;
      FFileNameClima : String;
      FMaxima: String;
      FMinima: String;
      FEstacao: String;
      procedure SetStrClima(const Value: String);
      procedure SetTemperatura(const Value: String);
      procedure SetURLClima(const Value: String);
      procedure SetFileNameClima(const Value: String);
      procedure SetMaxima(const Value: String);
      procedure SetMinima(const Value: String);
      procedure SetEstacao(const Value: String);
    protected
      constructor Create;
    public
      property Estacao     : String read FEstacao write SetEstacao;
      property Temperatura : String read FTemperatura write SetTemperatura;
      property Maxima      : String read FMaxima write SetMaxima;
      property Minima      : String read FMinima write SetMinima;
      property URLClima    : String read FURLClima write SetURLClima;
      property StrClima    : String read FStrClima write SetStrClima;
      property FileNameClima : String read FFileNameClima write SetFileNameClima;

      procedure Assign(Source : TPrevisaoTempo);

      class function New : TPrevisaoTempo;
  end;

  TCidadePrevisaoTempo = class
    private
      FRegiao: String;
      FLatitude: String;
      FUF: String;
      FPrevisaoTempo: TPrevisaoTempo;
      FId: Integer;
      FLongitude: String;
      FLocalTime: TDateTime;
      FNome: String;
      FPais: String;
      procedure SetId(const Value: Integer);
      procedure SetLatitude(const Value: String);
      procedure SetLocalTime(const Value: TDateTime);
      procedure SetLongitude(const Value: String);
      procedure SetNome(const Value: String);
      procedure SetPais(const Value: String);
      procedure SetPrevisaoTempo(const Value: TPrevisaoTempo);
      procedure SetRegiao(const Value: String);
      procedure SetUF(const Value: String);

      function GetRegiao : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property Id     : Integer read FId write SetId;
      property Nome   : String read FNome write SetNome;
      property Pais   : String read FPais write SetPais;
      property Regiao : String read GetRegiao write SetRegiao;
      property UF     : String read FUF write SetUF;
      property Latitude  : String read FLatitude write SetLatitude;
      property Longitude : String read FLongitude write SetLongitude;
      property LocalTime : TDateTime read FLocalTime write SetLocalTime;
      property PrevisaoTempo : TPrevisaoTempo read FPrevisaoTempo write SetPrevisaoTempo;

      procedure Assign(Source : TCidadePrevisaoTempo);

      class function New : TCidadePrevisaoTempo;
  end;

  IPrevisaoTempo = interface
    ['{C1F2D87D-6C8F-4935-92D9-F1F24DF69AFE}']
    function Cidade(Value : TCidadePrevisaoTempo) : IPrevisaoTempo; overload;
    function Cidade : TCidadePrevisaoTempo; overload;

    function GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out Error : String) : IPrevisaoTempo;
  end;

implementation

{ TPrevisaoTempo }

procedure TPrevisaoTempo.Assign(Source : TPrevisaoTempo);
begin
  FTemperatura := Source.Temperatura;
  FURLClima    := Source.URLClima;
  FStrClima    := Source.StrClima;
end;

constructor TPrevisaoTempo.Create;
begin
  FEstacao       := EmptyStr;
  FTemperatura   := EmptyStr;
  FURLClima      := EmptyStr;
  FStrClima      := EmptyStr;
  FFileNameClima := EmptyStr;
end;

class function TPrevisaoTempo.New: TPrevisaoTempo;
begin
  Result := TPrevisaoTempo.Create;
end;

procedure TPrevisaoTempo.SetEstacao(const Value: String);
begin
  FEstacao := Value.Trim.ToUpper;
end;

procedure TPrevisaoTempo.SetFileNameClima(const Value: String);
begin
  if FileExists(Value.Trim) then
    FFileNameClima := Value.Trim
  else
    FFileNameClima := EmptyStr;
end;

procedure TPrevisaoTempo.SetMaxima(const Value: String);
begin
  FMaxima := Value.Trim;
end;

procedure TPrevisaoTempo.SetMinima(const Value: String);
begin
  FMinima := Value.Trim;
end;

procedure TPrevisaoTempo.SetStrClima(const Value: String);
begin
  FStrClima := Value;
end;

procedure TPrevisaoTempo.SetTemperatura(const Value: String);
begin
  FTemperatura := Value;
end;

procedure TPrevisaoTempo.SetURLClima(const Value: String);
begin
  FURLClima := Value;
end;

{ TCidadePrevisaoTempo }

procedure TCidadePrevisaoTempo.Assign(Source: TCidadePrevisaoTempo);
begin
  FId       := Source.Id;
  FNome     := Source.Nome;
  FPais     := Source.Pais;
  FRegiao   := Source.Regiao;
  FUF       := Source.UF;
  FLatitude := Source.Latitude;
  FLongitude     := Source.Longitude;
  FLocalTime     := Source.LocalTime;
  FPrevisaoTempo.Assign(Source.PrevisaoTempo);
end;

constructor TCidadePrevisaoTempo.Create;
begin
  FId       := 0;
  FNome     := EmptyStr;
  FPais     := 'BRASIL';
  FRegiao   := EmptyStr;
  FUF       := EmptyStr;
  FLatitude := EmptyStr;
  FLongitude     := EmptyStr;
  FLocalTime     := Now;
  FPrevisaoTempo := TPrevisaoTempo.New;
end;

destructor TCidadePrevisaoTempo.Destroy;
begin
  FPrevisaoTempo.DisposeOf;
  inherited;
end;

function TCidadePrevisaoTempo.GetRegiao: String;
begin
  if not FRegiao.IsEmpty then
    Result := FRegiao
  else
    Result := FUF;
end;

class function TCidadePrevisaoTempo.New: TCidadePrevisaoTempo;
begin
  Result := TCidadePrevisaoTempo.Create;
end;

procedure TCidadePrevisaoTempo.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCidadePrevisaoTempo.SetLatitude(const Value: String);
begin
  FLatitude := Value.Trim;
end;

procedure TCidadePrevisaoTempo.SetLocalTime(const Value: TDateTime);
begin
  FLocalTime := Value;
end;

procedure TCidadePrevisaoTempo.SetLongitude(const Value: String);
begin
  FLongitude := Value.Trim;
end;

procedure TCidadePrevisaoTempo.SetNome(const Value: String);
begin
  FNome := Value.Trim;
end;

procedure TCidadePrevisaoTempo.SetPais(const Value: String);
begin
  FPais := Value.Trim;
end;

procedure TCidadePrevisaoTempo.SetPrevisaoTempo(const Value: TPrevisaoTempo);
begin
  FPrevisaoTempo := Value;
end;

procedure TCidadePrevisaoTempo.SetRegiao(const Value: String);
begin
  FRegiao := Value.Trim;
end;

procedure TCidadePrevisaoTempo.SetUF(const Value: String);
begin
  FUF := Value.Trim;
end;

end.
