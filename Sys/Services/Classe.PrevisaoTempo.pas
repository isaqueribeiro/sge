unit Classe.PrevisaoTempo;

interface

uses
  Interfaces.PrevisaoTempo, Controller.ProvisaoTempo.Inpe;

type
  TServicePrevisaoTempo = class
    private
      FService : IPrevisaoTempo;
    public
      constructor Create;

      class function GetCidade(aCidade, aUF : String) : TCidadePrevisaoTempo;
  end;

implementation

uses
  System.SysUtils, System.Classes;

{ TServicePrevisaoTempo }

constructor TServicePrevisaoTempo.Create;
begin
  FService := TPrevisaoTempoInpe.GetInstance;
end;

class function TServicePrevisaoTempo.GetCidade(aCidade, aUF: String): TCidadePrevisaoTempo;
var
  aStr : String;
  aRetorno : TCidadePrevisaoTempo;
begin
  aRetorno.Id := 0;
  aRetorno.Nome := aCidade;
  aRetorno.UF   := aUF;

  try
    TServicePrevisaoTempo
      .Create
      .FService
        .GetCidade(aRetorno, aStr);
  finally
    Result := aRetorno;
  end;
end;

end.
