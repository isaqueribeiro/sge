unit Controller.ProvisaoTempo.WeatherstackAPI;

interface

uses
  System.SysUtils, System.Classes, Interfaces.PrevisaoTempo,
  REST.Client, REST.Types, Web.HTTPApp;

type
  TPrevisaoTempoWeatherstackAPI = class(TInterfacedObject, IPrevisaoTempo)
    strict private
      class var _instance : IPrevisaoTempo;
    private
      FRESTClient : TRESTClient;
      FCidade     : TCidadePrevisaoTempo;
    protected
      constructor Create(const aURL : String);
    public
      class function GetInstance : IPrevisaoTempo;

      function Cidade(Value : TCidadePrevisaoTempo) : IPrevisaoTempo; overload;
      function Cidade : TCidadePrevisaoTempo; overload;

      function GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out aRetornoXML : String) : IPrevisaoTempo;
  end;

implementation

{ TPrevisaoTempoWeatherstackAPI }

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

  with FRESTClient do
  begin
    Accept        := 'application/xml, application/json, text/plain; q=0.9, text/html;q=0.8,';
    AcceptCharset := 'utf-8, *;q=0.8';
    BaseURL       := aURL;
  end;
end;

function TPrevisaoTempoWeatherstackAPI.GetCidade(const AccessKey : String; var aCidade: TCidadePrevisaoTempo;
  out aRetornoXML: String): IPrevisaoTempo;
var
  aRequest  : TRESTRequest;
  aResponse : TRESTResponse;
  aCity : String;
//
//  aXML : IXMLDocument;
//  I : Integer;
begin
  aRetornoXML := EmptyStr;
  aRequest    := TRESTRequest.Create(FRESTClient);
  aResponse   := TRESTResponse.Create(aRequest);

//  aXML := TXMLDocument.Create(EmptyStr);
//
  try
    with aRequest do
    begin
      Accept := FRESTClient.Accept;
      AcceptCharset := FRESTClient.AcceptCharset;
      SynchronizedEvents := False;

      aCity := aCidade.Nome;

      Client   := FRESTClient;
      Method   := TRESTRequestMethod.rmGET;
      Timeout  := 30000;
      Resource := 'current?access_key=' + AccessKey + '&query={query}';
      //Resource := 'current?access_key=' + AccessKey + '&query={query}&units={units}&language={language}'; // Apenas quando a API é paga

      Params.BeginUpdate;
      Params.AddUrlSegment('query', aCity.Replace(' ', '%20'));
      Params.AddUrlSegment('units', 'm');
      Params.AddUrlSegment('language', 'pt');
      Params.EndUpdate;

      Execute;

      // Response.StatusCode = Código do retorno
      // Response.StatusText = Descrição do retorno

      if (Response.StatusCode = 200) or Response.Status.SuccessOK_200 then
      begin
        aRetornoXML := Response.Content;

        if (aRetornoXML <> EmptyStr) then
        begin
//          aXML.LoadFromXML( aRetornoXML );
//          aXML.Active := True;
//
//          // Percorrer itens do no "cidades"
//          for I := 0 to aXML.DocumentElement.ChildNodes.Count - 1 do
//            with aXML.DocumentElement.ChildNodes[I] do  // Item "cidade" identificado
//            begin
//              if (UpperCase(ChildNodes['uf'].Text) = UpperCase(aCidade.UF)) then
//              begin
//                FCidade.Id   := StrToIntDef(ChildNodes['id'].Text, 0);
//                FCidade.Nome := ChildNodes['nome'].Text;
//                FCidade.UF   := UpperCase(ChildNodes['uf'].Text);
//                Break;
//              end;
//            end;
        end;
      end;
    end;
  finally
    aResponse.DisposeOf;
    aRequest.DisposeOf;

    aCidade := FCidade;
  end;
end;

class function TPrevisaoTempoWeatherstackAPI.GetInstance: IPrevisaoTempo;
begin
  if not Assigned(_instance) then
    _instance := TPrevisaoTempoWeatherstackAPI.Create('http://api.weatherstack.com');

  Result := _instance;
end;

end.
