unit Controller.ProvisaoTempo.WeatherstackAPI;

interface

uses
  System.SysUtils, System.Classes, Interfaces.PrevisaoTempo,
  REST.Client, REST.Types, System.JSON;

type
  TPrevisaoTempoWeatherstackAPI = class(TInterfacedObject, IPrevisaoTempo)
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

{ TPrevisaoTempoWeatherstackAPI }

(*
 * DOCUMENTAÇÃO DA APLI:
 * https://weatherstack.com/documentation
 *)

uses
  System.DateUtils;

function TPrevisaoTempoWeatherstackAPI.Cidade: TCidadePrevisaoTempo;
begin
  Result := FCidade;
end;

function TPrevisaoTempoWeatherstackAPI.Cidade(Value: TCidadePrevisaoTempo): IPrevisaoTempo;
begin
  Result  := Self;
  FCidade := Value;
end;

constructor TPrevisaoTempoWeatherstackAPI.Create(const aURL: String);
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

function TPrevisaoTempoWeatherstackAPI.GetCidade(const AccessKey : String; var aCidade: TCidadePrevisaoTempo;
  out Error: String): IPrevisaoTempo;
var
  aRequest  : TRESTRequest;
  aResponse : TRESTResponse;
  aJson  : TJSONValue;
  aParse : TJSONObject;
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

      Client   := FRESTClient;
      Response := aResponse;
      Method   := TRESTRequestMethod.rmGET;
      Timeout  := 30000;
      Resource := 'current?access_key=' + AccessKey + '&query={query}';
      //Resource := 'current?access_key=' + AccessKey + '&query={query}&units={units}&language={language}'; // Apenas quando a API é paga

      Params.BeginUpdate;
      Params.AddUrlSegment('query', FCidade.Nome.Replace(' ', '%20'));
      Params.AddUrlSegment('units', 'm');
      Params.AddUrlSegment('language', 'pt');
      Params.EndUpdate;

      Execute;

      if (Response.StatusCode = 200) or Response.Status.SuccessOK_200 then
      begin
        aJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Response.Content), 0);

        if (Pos('error', Response.Content) > 0)  then
        begin
          aParse := aJson.FindValue('error') as TJSONObject;
          Error  := 'Error ' + aParse.GetValue('code').Value + ' - ' + aParse.GetValue('info').Value;
          aParse.DisposeOf;
        end
        else
        begin
          aParse := aJson.FindValue('location') as TJSONObject;

          FCidade.Nome      := aParse.GetValue('name').Value;
          FCidade.Pais      := aParse.GetValue('country').Value;
          FCidade.Regiao    := aParse.GetValue('region').Value;
          FCidade.Latitude  := aParse.GetValue('lat').Value;
          FCidade.Longitude := aParse.GetValue('lon').Value;
          FCidade.LocalTime := StrToLocalDateTime( aParse.GetValue('localtime').Value );

          aParse := aJson.FindValue('current') as TJSONObject;

          FCidade.PrevisaoTempo.Temperatura := aParse.GetValue('temperature').Value;
          FCidade.PrevisaoTempo.Maxima      := EmptyStr;
          FCidade.PrevisaoTempo.Minima      := EmptyStr;
          FCidade.PrevisaoTempo.URLClima    := TJSONArray(aParse.GetValue('weather_icons')).Items[0].Value;
          FCidade.PrevisaoTempo.StrClima    := TJSONArray(aParse.GetValue('weather_descriptions')).Items[0].Value;

          aParse.DisposeOf;
        end;
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

class function TPrevisaoTempoWeatherstackAPI.GetInstance: IPrevisaoTempo;
begin
  if not Assigned(_instance) then
    _instance := TPrevisaoTempoWeatherstackAPI.Create('http://api.weatherstack.com');

  Result := _instance;
end;

function TPrevisaoTempoWeatherstackAPI.StrToLocalDateTime(Str: String): TDateTime;
var
  aAno ,
  aMes ,
  aDia ,
  aHora,
  aMin : Word;
begin
  aAno  := StrToIntDef(Copy(Str,  1, 4), YearOf(Date));
  aMes  := StrToIntDef(Copy(Str,  6, 2), MonthOf(Date));
  aDia  := StrToIntDef(Copy(Str,  9, 2), DayOf(Date));
  aHora := StrToIntDef(Copy(Str, 12, 2), HourOf(Time));
  aMin  := StrToIntDef(Copy(Str, 15, 2), MinuteOf(Time));

  Result := EncodeDateTime(aAno, aMes, aDia, aHora, aMin, SecondOf(Time), MilliSecondOf(Time));
end;

end.
