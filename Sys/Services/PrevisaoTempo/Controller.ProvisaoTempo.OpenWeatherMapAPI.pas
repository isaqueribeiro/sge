unit Controller.ProvisaoTempo.OpenWeatherMapAPI;

interface

uses
  System.SysUtils, System.Classes, Interfaces.PrevisaoTempo,
  REST.Client, REST.Types, System.JSON;

type
  TPrevisaoTempoOpenWeatherMapAPI = class(TInterfacedObject, IPrevisaoTempo)
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

{ TPrevisaoTempoOpenWeatherMapAPI }

(*
 * DOCUMENTAÇÃO DA APLI:
 * https://rapidapi.com/community/api/open-weather-map/endpoints
 *)

uses
  System.DateUtils;

class function TPrevisaoTempoOpenWeatherMapAPI.GetInstance: IPrevisaoTempo;
begin
  if not Assigned(_instance) then
    _instance := TPrevisaoTempoOpenWeatherMapAPI.Create('https://community-open-weather-map.p.rapidapi.com');

  Result := _instance;
end;

function TPrevisaoTempoOpenWeatherMapAPI.Cidade: TCidadePrevisaoTempo;
begin
  Result := FCidade;
end;

function TPrevisaoTempoOpenWeatherMapAPI.Cidade(Value: TCidadePrevisaoTempo): IPrevisaoTempo;
begin
  Result  := Self;
  FCidade := Value;
end;

constructor TPrevisaoTempoOpenWeatherMapAPI.Create(const aURL: String);
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

function TPrevisaoTempoOpenWeatherMapAPI.GetCidade(const AccessKey: String; var aCidade: TCidadePrevisaoTempo;
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

      aQuery := aCidade.Nome.Trim + ',' + aCidade.Pais.Trim;
      aQuery := aQuery.Replace(' ', '%20').Replace(',', '%2C');

      Client   := FRESTClient;
      Response := aResponse;
      Method   := TRESTRequestMethod.rmGET;
      Timeout  := 30000;
      Resource := 'weather?q=' + aQuery + '&units=metric';

      Params.BeginUpdate;
      Params.AddUrlSegment('p', aQuery);
      Params.AddUrlSegment('units', 'metric');
      Params.AddHeader('X-Rapidapi-Key' , AccessKey);
      Params.AddHeader('X-Rapidapi-Host', 'community-open-weather-map.p.rapidapi.com');
      Params.EndUpdate;

      Execute;

      if (Response.StatusCode = 200) or Response.Status.SuccessOK_200 then
      begin
        aJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Response.Content), 0);

        aParse := aJson as TJSONObject;

        FCidade.Id   := StrToIntDef(aParse.GetValue('id').Value, 0);
        FCidade.Nome := aParse.GetValue('name').Value;

        FCidade.LocalTime := StrToLocalDateTime(aParse.GetValue('dt').Value);

        aParse := aJson.FindValue('coord') as TJSONObject;

        FCidade.Latitude  := aParse.GetValue('lat').Value;
        FCidade.Longitude := aParse.GetValue('lon').Value;

        aParse := TJSONArray(aJson.FindValue('weather')).Items[0] as TJSONObject;

        FCidade.PrevisaoTempo.StrClima := aParse.GetValue('main').Value + ' - ' + aParse.GetValue('description').Value;

        aParse := aJson.FindValue('main') as TJSONObject;

        FCidade.PrevisaoTempo.Temperatura := aParse.GetValue('temp').Value;
        FCidade.PrevisaoTempo.Maxima      := aParse.GetValue('temp_max').Value;
        FCidade.PrevisaoTempo.Minima      := aParse.GetValue('temp_min').Value;
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

function TPrevisaoTempoOpenWeatherMapAPI.StrToLocalDateTime(Str: String): TDateTime;
const
  cSegundosPorDia = 24 * 60 * 60;
begin
  if StrToIntDef(Str, 0) = 0 then
    Result := Now
  else
    Result := ( StrToInt(Str) / cSegundosPorDia + Trunc(EncodeDate(1970, 1, 1)) );
end;

end.
