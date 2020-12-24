unit Controller.ProvisaoTempo.HGWeatherAPI;

interface

uses
  System.SysUtils, System.Classes, Interfaces.PrevisaoTempo,
  REST.Client, REST.Types, System.JSON;

type
  TPrevisaoTempoHGWeatherAPI = class(TInterfacedObject, IPrevisaoTempo)
    strict private
      class var _instance : IPrevisaoTempo;
    private
      FRESTClient : TRESTClient;
      FCidade     : TCidadePrevisaoTempo;
      function StrToLocalDateTime(Str : String) : TDateTime;
    protected
      constructor Create(const aURL : String);
    public
      class function GetInstance : IPrevisaoTempo;

      function Cidade(Value : TCidadePrevisaoTempo) : IPrevisaoTempo; overload;
      function Cidade : TCidadePrevisaoTempo; overload;

      function GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out Error : String) : IPrevisaoTempo;
  end;

implementation

{ TPrevisaoTempoHGWeatherAPI }

(*
 * DOCUMENTAÇÃO DA APLI:
 * https://console.hgbrasil.com/documentation/weather
 *)

uses
  System.DateUtils;

function TPrevisaoTempoHGWeatherAPI.Cidade: TCidadePrevisaoTempo;
begin
  Result := FCidade;
end;

function TPrevisaoTempoHGWeatherAPI.Cidade(Value: TCidadePrevisaoTempo): IPrevisaoTempo;
begin
  Result  := Self;
  FCidade := Value;
end;

constructor TPrevisaoTempoHGWeatherAPI.Create(const aURL: String);
begin
  FRESTClient := TRESTClient.Create(aURL);
  FCidade     := TCidadePrevisaoTempo.New;

  with FRESTClient do
  begin
    Accept        := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
    AcceptCharset := 'utf-8, *;q=0.8';
    BaseURL       := aURL;
    FallbackCharsetEncoding := 'utf-8';
    RaiseExceptionOn500     := False;
  end;
end;

function TPrevisaoTempoHGWeatherAPI.GetCidade(const AccessKey: String; var aCidade: TCidadePrevisaoTempo;
  out Error: String): IPrevisaoTempo;
var
  aRequest  : TRESTRequest;
  aResponse : TRESTResponse;
  aJson  : TJSONValue;
  aParse : TJSONObject;
  aQuery : String;
begin
  Error     := EmptyStr;
  aRequest  := TRESTRequest.Create(FRESTClient);
  aResponse := TRESTResponse.Create(aRequest);

  try
    with aRequest do
    begin
      aResponse.ContentType := 'application/json';

      Accept             := FRESTClient.Accept;
      AcceptCharset      := FRESTClient.AcceptCharset;
      SynchronizedEvents := False;

      FCidade.Assign( aCidade );

      aQuery := aCidade.Nome.Trim + ',' + aCidade.UF.Trim;
      aQuery := aQuery.Replace(' ', '%20').Replace(',', '%2C');

      Client   := FRESTClient;
      Response := aResponse;
      Method   := TRESTRequestMethod.rmGET;
      Timeout  := 30000;
      Resource := 'weather?key={key}&city_name={city_name}';

      Params.BeginUpdate;
      Params.AddUrlSegment('key', AccessKey);
      Params.AddUrlSegment('city_name', aQuery);
      Params.EndUpdate;

      Execute;

      if (Response.StatusCode = 200) or Response.Status.SuccessOK_200 then
      begin
        aJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Response.Content), 0);

        aParse := aJson as TJSONObject;
        aParse := aParse.GetValue('results') as TJSONObject;

        FCidade.Id   := 1;
        FCidade.Nome := aParse.GetValue('city_name').Value;

        FCidade.LocalTime := StrToLocalDateTime(aParse.GetValue('date').Value + ' ' + aParse.GetValue('time').Value);

        FCidade.PrevisaoTempo.StrClima    := aParse.GetValue('condition_code').Value + ' - ' + aParse.GetValue('description').Value;
        FCidade.PrevisaoTempo.Temperatura := aParse.GetValue('temp').Value;

        FCidade.Latitude  := '0';
        FCidade.Longitude := '0';

        aParse := TJSONArray(aParse.GetValue('forecast')).Items[0] as TJSONObject;

        FCidade.PrevisaoTempo.Maxima := aParse.GetValue('max').Value;
        FCidade.PrevisaoTempo.Minima := aParse.GetValue('min').Value;
      end
      else
        Error := 'Error ' + Response.StatusCode.ToString + ' - ' + Response.StatusText;
    end;
  finally
    aResponse.DisposeOf;
    aRequest.DisposeOf;

    aCidade.Assign( FCidade );
  end;
end;

class function TPrevisaoTempoHGWeatherAPI.GetInstance: IPrevisaoTempo;
begin
  if not Assigned(_instance) then
    _instance := TPrevisaoTempoHGWeatherAPI.Create('https://api.hgbrasil.com');

  Result := _instance;
end;

function TPrevisaoTempoHGWeatherAPI.StrToLocalDateTime(Str: String): TDateTime;
var
  aAno ,
  aMes ,
  aDia ,
  aHora,
  aMin : Word;
begin
  aAno  := StrToIntDef(Copy(Str,  7, 4), YearOf(Date));
  aMes  := StrToIntDef(Copy(Str,  4, 2), MonthOf(Date));
  aDia  := StrToIntDef(Copy(Str,  1, 2), DayOf(Date));
  aHora := StrToIntDef(Copy(Str, 12, 2), HourOf(Time));
  aMin  := StrToIntDef(Copy(Str, 15, 2), MinuteOf(Time));

  Result := EncodeDateTime(aAno, aMes, aDia, aHora, aMin, SecondOf(Time), MilliSecondOf(Time));
end;

end.
