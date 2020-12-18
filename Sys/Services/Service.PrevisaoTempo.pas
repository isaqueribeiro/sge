unit Service.PrevisaoTempo;

interface

(*
 * Top 7 Best Free Weather APIs to Access Global Weather Data (Updated for 2020)
 * https://rapidapi.com/blog/access-global-weather-data-with-these-weather-apis/
 *)

uses
    Interfaces.PrevisaoTempo
  , Controller.ProvisaoTempo.Inpe
  , Controller.ProvisaoTempo.WeatherstackAPI
  , Controller.ProvisaoTempo.OpenWeatherMapAPI
  , Controller.ProvisaoTempo.HGWeatherAPI
  , IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TTipoServicePrevisaoTempo = (sptHGWeatherAPI, sptOpenWeatherMapAPI, sptWeatherstackAPI, sptInep);
  TServicePrevisaoTempo = class
    private
      FService : IPrevisaoTempo;
    public
      constructor Create(const aTipo : TTipoServicePrevisaoTempo);

      class function DownloadImage(const aURL, aFileName : String) : Boolean;
      class function GetCidade(const aTipo : TTipoServicePrevisaoTempo; const AccessKey : String;
        aCidade, aUF : String) : TCidadePrevisaoTempo;
  end;

implementation

uses
  System.SysUtils, System.Classes;

{ TServicePrevisaoTempo }

constructor TServicePrevisaoTempo.Create(const aTipo : TTipoServicePrevisaoTempo);
begin
  case aTipo of
    sptHGWeatherAPI:
      FService := TPrevisaoTempoHGWeatherAPI.GetInstance;
    sptOpenWeatherMapAPI:
      FService := TPrevisaoTempoOpenWeatherMapAPI.GetInstance;
    sptWeatherstackAPI:
      FService := TPrevisaoTempoWeatherstackAPI.GetInstance;
    sptInep:
      FService := TPrevisaoTempoInpe.GetInstance;
  end;
end;

class function TServicePrevisaoTempo.DownloadImage(const aURL, aFileName: String): Boolean;
  var
    aRetorno : Boolean;
    IdHTTP   : TIdHTTP;
    aFile    : TFileStream;
begin
//  TThread.CreateAnonymousThread(procedure
//  var
//    aRetorno : Boolean;
//    IdHTTP   : TIdHTTP;
//    aFile    : TFileStream;
//  begin
//    aRetorno := False;
//    IdHTTP   := TIdHTTP.Create(nil);
//    try
//      aFile := TFileStream.Create(aFileName, fmCreate);
//      IdHTTP.Get(aURL, aFile);
//
//      aRetorno := True;
//    finally
//      IdHTTP.DisposeOf;
//      Result := aRetorno;
//    end;
//  end).Start;
  aRetorno := False;
  IdHTTP   := TIdHTTP.Create(nil);
  try
    aFile := TFileStream.Create(aFileName, fmCreate);
    IdHTTP.Get(aURL, aFile);

    aRetorno := True;
  finally
    IdHTTP.DisposeOf;
    Result := aRetorno;
  end;
end;

class function TServicePrevisaoTempo.GetCidade(const aTipo : TTipoServicePrevisaoTempo; const AccessKey : String;
  aCidade, aUF: String): TCidadePrevisaoTempo;
var
  aError   : String;
  aRetorno : TCidadePrevisaoTempo;
begin
  aRetorno := TCidadePrevisaoTempo.New;

  aRetorno.Nome := aCidade;
  aRetorno.UF   := aUF;

  try
    TServicePrevisaoTempo
      .Create(aTipo)
      .FService
        .GetCidade(AccessKey, aRetorno, aError);
  finally
    Result := aRetorno;
  end;
end;

end.
