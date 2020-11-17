unit Controller.ProvisaoTempo.Inpe;

interface

uses
  System.SysUtils, System.Classes, Interfaces.PrevisaoTempo,
  REST.Client, REST.Types, Web.HTTPApp,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc;

type
  TPrevisaoTempoInpe = class(TInterfacedObject, IPrevisaoTempo)
    strict private
      class var _instance : IPrevisaoTempo;
    private
      FRESTClient : TRESTClient;
      FCidade     : TCidadePrevisaoTempo;
      function RemoveAccent(C: Char): Char;
      function RemoveAllAccents(const S: string): string;
    protected
      constructor Create(const aURL : String);
    public
      class function GetInstance : IPrevisaoTempo;

      function Cidade(Value : TCidadePrevisaoTempo) : IPrevisaoTempo; overload;
      function Cidade : TCidadePrevisaoTempo; overload;

      function GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out aRetornoXML : String) : IPrevisaoTempo;
  end;

implementation

{ TPrevisaoTempoInpe }


(*
 * DOCUMENTAÇÃO DA APLI:
 * http://servicos.cptec.inpe.br/XML/
 *)

function TPrevisaoTempoInpe.Cidade(Value: TCidadePrevisaoTempo): IPrevisaoTempo;
begin
  Result  := Self;
  FCidade := Value;
end;

function TPrevisaoTempoInpe.Cidade: TCidadePrevisaoTempo;
begin
  Result := FCidade;
end;

constructor TPrevisaoTempoInpe.Create(const aURL : String);
begin
  FRESTClient := TRESTClient.Create(aURL);

  with FRESTClient do
  begin
    Accept        := 'application/xml, application/json, text/plain; q=0.9, text/html;q=0.8,';
    AcceptCharset := 'utf-8, *;q=0.8';
    BaseURL       := aURL;
  end;
end;

function TPrevisaoTempoInpe.GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out aRetornoXML : String): IPrevisaoTempo;
var
  aRequest  : TRESTRequest;
  aResponse : TRESTResponse;
  aCity : String;

  aXML : IXMLDocument;
  I : Integer;
begin
  aRetornoXML := EmptyStr;
  aRequest    := TRESTRequest.Create(FRESTClient);
  aResponse   := TRESTResponse.Create(aRequest);

  aXML := TXMLDocument.Create(EmptyStr);

  try
    with aRequest do
    begin
      Accept := FRESTClient.Accept;
      AcceptCharset := FRESTClient.AcceptCharset;
      SynchronizedEvents := False;

      aCity := RemoveAllAccents(aCidade.Nome);

      Client   := FRESTClient;
      Method   := TRESTRequestMethod.rmGET;
      Timeout  := 30000;
      Resource := 'listaCidades?city={city}';

      Params.BeginUpdate;
      Params.AddUrlSegment('city', aCity.Replace(' ', '%20'));
      Params.EndUpdate;

      Execute;

      // Response.StatusCode = Código do retorno
      // Response.StatusText = Descrição do retorno

      if (Response.StatusCode = 200) or Response.Status.SuccessOK_200 then
      begin
        aRetornoXML := Response.Content;

        if (aRetornoXML <> EmptyStr) then
        begin
          aXML.LoadFromXML( aRetornoXML );
          aXML.Active := True;

          // Percorrer itens do no "cidades"
          for I := 0 to aXML.DocumentElement.ChildNodes.Count - 1 do
            with aXML.DocumentElement.ChildNodes[I] do  // Item "cidade" identificado
            begin
              if (UpperCase(ChildNodes['uf'].Text) = UpperCase(aCidade.UF)) then
              begin
                FCidade.Id   := StrToIntDef(ChildNodes['id'].Text, 0);
                FCidade.Nome := ChildNodes['nome'].Text;
                FCidade.UF   := UpperCase(ChildNodes['uf'].Text);
                Break;
              end;
            end;
        end;
      end;
    end;
  finally
    aResponse.DisposeOf;
    aRequest.DisposeOf;

    aCidade := FCidade;
  end;
end;

class function TPrevisaoTempoInpe.GetInstance : IPrevisaoTempo;
begin
  if not Assigned(_instance) then
    _instance := TPrevisaoTempoInpe.Create('http://servicos.cptec.inpe.br/XML');

  Result := _instance;
end;

function TPrevisaoTempoInpe.RemoveAccent(C: Char): Char;
const
  BadMaiSChar = ['"', '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '-', '+', '=',
                 '|', '\', '<', ',', '>', '.', ':', ';', '?', '/', '´', '`', '{', '[',
                 '^', '^', '}', ']', '§'];
  BadMaiAChar = ['Á', 'À', 'Ä', 'Ã', 'Â'];
  BadMinAChar = ['á', 'à', 'ä', 'ã', 'â'];
  BadMaiEChar = ['É', 'È', 'Ë', 'Ê'];
  BadMinEChar = ['é', 'è', 'ë', 'ê'];
  BadMaiIChar = ['Í', 'Ì', 'Ï', 'Î'];
  BadMinIChar = ['í', 'ì', 'ï', 'î'];
  BadMaiOChar = ['Ó', 'Ò', 'Ö', 'Õ', 'Ô'];
  BadMinOChar = ['ó', 'ò', 'ö', 'õ', 'ô'];
  BadMaiUChar = ['Ú', 'Ù', 'Ü', 'Û'];
  BadMinUChar = ['ú', 'ù', 'ü', 'û'];
  BadMaiCChar = ['Ç'];
  BadMinCChar = ['ç'];
  BadNumOChar = ['º'];
  BadNumAChar = ['ª'];
  BadChar = ['´', '"', '`', '~', '^','¨'];
var
  U: Char;
begin
  U := C;
  if (U in BadMaiSChar) then U := ' ';
  if (U in BadMaiAChar) then U := 'A';
  if (U in BadMinAChar) then U := 'a';
  if (U in BadMaiEChar) then U := 'E';
  if (U in BadMinEChar) then U := 'e';
  if (U in BadMaiIChar) then U := 'I';
  if (U in BadMinIChar) then U := 'i';
  if (U in BadMaiOChar) then U := 'O';
  if (U in BadMinOChar) then U := 'o';
  if (U in BadMaiUChar) then U := 'U';
  if (U in BadMinUChar) then U := 'u';
  if (U in BadMaiCChar) then U := 'C';
  if (U in BadMinCChar) then U := 'c';
  if (U in BadChar) then U := #0;
  Result := U;
end;

function TPrevisaoTempoInpe.RemoveAllAccents(const S: string): string;
var
  I: Integer;
begin
  Result := S;
  for I := 1 to Length(Result) do
    Result[I] := RemoveAccent(Result[I]);
end;

end.
