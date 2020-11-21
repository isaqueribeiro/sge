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

end;

function TPrevisaoTempoOpenWeatherMapAPI.Cidade(Value: TCidadePrevisaoTempo): IPrevisaoTempo;
begin

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
begin

end;

function TPrevisaoTempoOpenWeatherMapAPI.StrToLocalDateTime(Str: String): TDateTime;
begin

end;

end.
