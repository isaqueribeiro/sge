unit Service.PrevisaoTempo;

interface

(*
 * Top 7 Best Free Weather APIs to Access Global Weather Data (Updated for 2020)
 * https://rapidapi.com/blog/access-global-weather-data-with-these-weather-apis/
 *)

uses
    Interfaces.PrevisaoTempo
  , Controller.ProvisaoTempo.Inpe
  , Controller.ProvisaoTempo.WeatherstackAPI;

type
  TTipoServicePrevisaoTempo = (sptOpenWeatherMapAPI, sptWeatherstackAPI, sptInep);
  TServicePrevisaoTempo = class
    private
      FService : IPrevisaoTempo;
    public
      constructor Create(const aTipo : TTipoServicePrevisaoTempo);

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
    sptOpenWeatherMapAPI:
      ;
    sptWeatherstackAPI:
      FService := TPrevisaoTempoWeatherstackAPI.GetInstance;
    sptInep:
      FService := TPrevisaoTempoInpe.GetInstance;
  end;
end;

class function TServicePrevisaoTempo.GetCidade(const aTipo : TTipoServicePrevisaoTempo; const AccessKey : String;
  aCidade, aUF: String): TCidadePrevisaoTempo;
var
  aStr : String;
  aRetorno : TCidadePrevisaoTempo;
begin
  aRetorno.Id   := 0;
  aRetorno.Nome := aCidade;
  aRetorno.UF   := aUF;

  try
    TServicePrevisaoTempo
      .Create(aTipo)
      .FService
        .GetCidade(AccessKey, aRetorno, aStr);
  finally
    Result := aRetorno;
  end;
end;

end.
