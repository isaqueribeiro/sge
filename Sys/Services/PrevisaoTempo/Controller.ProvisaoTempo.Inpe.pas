unit Controller.ProvisaoTempo.Inpe;

interface

uses
  System.SysUtils, System.Classes, Interfaces.PrevisaoTempo,
  REST.Client, REST.Types, Web.HTTPApp,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TPrevisaoTempoInpe = class(TInterfacedObject, IPrevisaoTempo)
    strict private
      class var _instance : IPrevisaoTempo;
    private
      FRESTClient : TRESTClient;
      FCidade     : TCidadePrevisaoTempo;
      FIdHTTP     : TIdHTTP;

      function RemoveAccent(C: Char): Char;
      function RemoveAllAccents(const S: string): string;
      function GetEstacao(CidadeID : Integer) : String;
    protected
      constructor Create(const aURL : String);
    public
      destructor Destroy; override;

      class function GetInstance : IPrevisaoTempo;

      function Cidade(Value : TCidadePrevisaoTempo) : IPrevisaoTempo; overload;
      function Cidade : TCidadePrevisaoTempo; overload;

      function GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out Error : String) : IPrevisaoTempo;
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
  FCidade     := TCidadePrevisaoTempo.New;

  with FRESTClient do
  begin
    Accept        := 'application/xml, application/json, text/plain; q=0.9, text/html;q=0.8,';
    AcceptCharset := 'ISO-8859-1, *;q=0.8';
    //AcceptCharset := 'utf-8, *;q=0.8';
    BaseURL       := aURL;
  end;

  ForceDirectories(ExtractFilePath(ParamStr(0)) + 'temp/');
end;

destructor TPrevisaoTempoInpe.Destroy;
begin
  if Assigned(FIdHTTP) then
    FIdHTTP.DisposeOf;

  inherited;
end;

function TPrevisaoTempoInpe.GetCidade(const AccessKey : String; var aCidade : TCidadePrevisaoTempo; out Error : String): IPrevisaoTempo;
var
  aRequest  : TRESTRequest;
  aResponse : TRESTResponse;

  aOK  : Boolean;
  aXML : IXMLDocument;
  I : Integer;

  aFile : TFileStream;
begin
  Error     := EmptyStr;
  aRequest  := TRESTRequest.Create(FRESTClient);
  aResponse := TRESTResponse.Create(aRequest);

  aXML := TXMLDocument.Create(EmptyStr);

  try
    with aRequest do
    begin
      Accept := FRESTClient.Accept;
      AcceptCharset := FRESTClient.AcceptCharset;
      SynchronizedEvents := False;

      aCidade.Nome := RemoveAllAccents(aCidade.Nome);
      FCidade.Assign( aCidade );

      Client   := FRESTClient;
      Response := aResponse;
      Method   := TRESTRequestMethod.rmGET;
      Timeout  := 30000;
      Resource := 'listaCidades?city={city}';

      Params.BeginUpdate;
      Params.AddUrlSegment('city', FCidade.Nome.Replace(' ', '%20'));
      Params.EndUpdate;

      Execute;

      // 1. Identificar o ID da Cidade
      aOK := (Response.StatusCode = 200) or Response.Status.SuccessOK_200;

      if not aOK then
        Error := 'Error ' + Response.StatusCode.ToString + ' - ' + Response.StatusText
      else
      begin
        if (Response.Content <> EmptyStr) then
        begin
          aXML.LoadFromXML( Response.Content );
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

          aXML.Active := False;
        end;

        aOK := (FCidade.Id > 0);
      end;

      // 2. Ler a previsão do tempo da cidade
      Resource := 'cidade/' + FCidade.Id.ToString + '/previsao.xml';

      Params.BeginUpdate;
      Params.Clear;
      Params.EndUpdate;

      Execute;

      aOK := (Response.StatusCode = 200) or Response.Status.SuccessOK_200;

      if not aOK then
        Error := 'Error ' + Response.StatusCode.ToString + ' - ' + Response.StatusText
      else
      begin
        if (Response.Content <> EmptyStr) then
        begin
          aXML.LoadFromXML( Response.Content );
          aXML.Active := True;

          // Percorrer os itens
          for I := 0 to aXML.DocumentElement.ChildNodes.Count - 1 do
            with aXML.DocumentElement.ChildNodes[I] do
            begin
              if (UpperCase(NodeName) = 'PREVISAO') then
              begin
                FCidade.PrevisaoTempo.Maxima  := ChildNodes['maxima'].Text;
                FCidade.PrevisaoTempo.Minima  := ChildNodes['minima'].Text;
                Break;
              end;
            end;

          aXML.Active := False;
        end;
      end;

      FCidade.PrevisaoTempo.Estacao := GetEstacao(FCidade.Id);

      if FCidade.PrevisaoTempo.Estacao.IsEmpty then
        Exit;

      // 3. Buscar valor da temperatura na estação
      FIdHTTP := TIdHTTP.Create(nil);
      aFile   := TFileStream.Create('./temp/estacao.xml', fmCreate or fmOpenReadWrite);

      FIdHTTP.Get(FRESTClient.BaseURL + '/estacao/' + FCidade.PrevisaoTempo.Estacao + '/condicoesAtuais.xml', aFile);

      Sleep(1000);

      aOK := (FIdHTTP.ResponseCode = 200);

      if not aOK then
        Error := 'Error ' + FIdHTTP.ResponseCode.ToString + ' - ' + FIdHTTP.ResponseText
      else
      begin
        aXML.LoadFromStream( FIdHTTP.Response.ContentStream );
        aXML.Active := True;

        with aXML.DocumentElement do
        begin
          FCidade.PrevisaoTempo.Temperatura := ChildNodes['temperatura'].Text;
          FCidade.PrevisaoTempo.StrClima    := Format('%s (%s)', [ChildNodes['tempo_desc'].Text, ChildNodes['tempo'].Text]);
        end;

        aXML.Active := False;
      end;

      aFile.DisposeOf;
      DeleteFile('./temp/estacao.xml');
    end;
  finally
    aResponse.DisposeOf;
    aRequest.DisposeOf;

    aCidade.Assign( FCidade );
  end;
end;

function TPrevisaoTempoInpe.GetEstacao(CidadeID: Integer): String;
var
  aStr : String;
const
  BELEM      =  '221';
  ANANINDEUA =  '462';
  BENEVIDES  =  '838';
  CASTANHAL  = '1396';
  MARITUBA   = '3167';
  SBBE : Array [0..4] of String = (BELEM, ANANINDEUA, BENEVIDES, CASTANHAL, MARITUBA);
begin
  Result := EmptyStr;

  for aStr in SBBE do
    if aStr.Equals(CidadeID.ToString) then
    begin
      Result := 'SBBE';
      Break;
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
