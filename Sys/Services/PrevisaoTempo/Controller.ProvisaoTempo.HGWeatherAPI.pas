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
begin

end;

class function TPrevisaoTempoHGWeatherAPI.GetInstance: IPrevisaoTempo;
begin
  if not Assigned(_instance) then
    _instance := TPrevisaoTempoHGWeatherAPI.Create('https://api.hgbrasil.com/weather');

  Result := _instance;
end;

function TPrevisaoTempoHGWeatherAPI.StrToLocalDateTime(Str: String): TDateTime;
begin

end;

end.
