unit Service.Request;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,

  REST.Types,
  REST.Client,

  Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  IObserver = interface
    ['{BB16D496-48CE-4C13-8AA5-2BC1685C4448}']
    procedure Update;
  end;

  ISubjectServiceRequest = interface
    ['{2EE4A3DB-EE8C-425F-BD21-135230F4D2E8}']
    procedure addObserver(Observer: IObserver);
    procedure removeObserver(Observer: IObserver);
    procedure Notify;
  end;

  IServiceRequest = interface
    ['{61C1E1C7-A432-4C5F-9B5A-6321DABAE9DC}']
    procedure Get(const aCallbackJSON : TProc<TJSONValue> = nil);

    function BaseURL(Value : String) : IServiceRequest;
    function Accept(Value : String) : IServiceRequest;
    function Resource(Value : String) : IServiceRequest;
    function AddParameter(const aName, aValue: string; const aKind: TRESTRequestParameterKind = TRESTRequestParameterKind.pkGETorPOST) : IServiceRequest;
    function AddSegmentURL(const aName, aValue: string) : IServiceRequest;
    function Callback(aCallbackJSON : TProc<TJSONValue>) : IServiceRequest;
    function Execute(const aCallbackJSON : TProc<TJSONValue> = nil) : IServiceRequest;
    function Response : TRESTResponse;
    function ResponseJSON : TJSONValue;

    function Executing : Boolean;
  end;

  TServiceRequest = class(TInterfacedObject, IServiceRequest, ISubjectServiceRequest)
    private
      FObservers    : TInterfaceList;
      FRESTClient   : TRESTClient;
      FRESTRequest  : TRESTRequest;
      FRESTResponse : TRESTResponse;
      FExecuting    : Boolean;
      FCallbackJSON : TProc<TJSONValue>;
      procedure Executar;
      procedure Executando;
      procedure TratarRetorno(Sender : TObject);
    protected
      constructor Create(aBaseURL : String);
    public
      destructor Destroy; override;
      class function New(aBaseURL : String) : TServiceRequest;

      procedure addObserver(Observer: IObserver);
      procedure removeObserver(Observer: IObserver);
      procedure Notify;

      procedure Get(const aCallbackJSON : TProc<TJSONValue> = nil);

      function BaseURL(Value : String) : IServiceRequest;
      function Accept(Value : String) : IServiceRequest;
      function Resource(Value : String) : IServiceRequest;
      function AddParameter(const aName, aValue: string; const aKind: TRESTRequestParameterKind) : IServiceRequest;
      function AddSegmentURL(const aName, aValue: string) : IServiceRequest;
      function Callback(aCallbackJSON : TProc<TJSONValue>) : IServiceRequest;
      function Execute(const aCallbackJSON : TProc<TJSONValue> = nil) : IServiceRequest;
      function Response : TRESTResponse;
      function ResponseJSON : TJSONValue;

      function Executing : Boolean;
  end;

implementation

{ TServiceRequest }

function TServiceRequest.Accept(Value: String): IServiceRequest;
begin
  Result := Self;
  FRESTClient.Accept  := Value.Trim;
  FRESTRequest.Accept := FRESTClient.Accept;
end;

procedure TServiceRequest.addObserver(Observer: IObserver);
begin
  if (FObservers.IndexOf(Observer) = -1) then
    FObservers.Add(Observer);
end;

function TServiceRequest.AddParameter(const aName, aValue: string; const aKind: TRESTRequestParameterKind): IServiceRequest;
begin
  Result := Self;
  FRESTRequest.AddParameter(aName, aValue.Trim, aKind);
end;

function TServiceRequest.AddSegmentURL(const aName, aValue: string): IServiceRequest;
begin
  Result := Self;
  FRESTRequest.AddParameter(aName, aValue.Trim, TRESTRequestParameterKind.pkURLSEGMENT);
end;

function TServiceRequest.BaseURL(Value: String): IServiceRequest;
begin
  Result := Self;
  FRESTClient.BaseURL := Value.Trim;
end;

function TServiceRequest.Callback(aCallbackJSON: TProc<TJSONValue>): IServiceRequest;
begin
  Result := Self;
  FCallbackJSON := aCallbackJSON;
end;

constructor TServiceRequest.Create(aBaseURL : String);
begin
  FObservers    := TInterfaceList.Create;
  FRESTClient   := TRESTClient.Create(aBaseURL.Trim);
  FRESTRequest  := TRESTRequest.Create(FRESTClient);
  FRESTResponse := TRESTResponse.Create(FRESTRequest);

  FRESTClient.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  FRESTClient.AcceptCharset := 'utf-8, *;q=0.8';
  FRESTClient.BaseURL := aBaseURL.Trim;

  FRESTRequest.Accept := FRESTClient.Accept;
  FRESTRequest.AcceptCharset := FRESTClient.AcceptCharset;
  FRESTRequest.Response := FRESTResponse;

  FExecuting := False;
end;

destructor TServiceRequest.Destroy;
begin
  FObservers.Clear;
  FObservers.DisposeOf;
  FRESTClient.DisposeOf;
//
//  if Assigned(FRESTRequest) then
//    FRESTRequest.DisposeOf;
//
//  if Assigned(FRESTResponse) then
//    FRESTResponse.DisposeOf;
//
  inherited;
end;

procedure TServiceRequest.Executando;
begin
  FRESTRequest.Execute;
end;

procedure TServiceRequest.Executar;
var
  aThread : TThread;
begin
  if (not FExecuting) then
  begin
    FExecuting := True;

    aThread := TThread.CreateAnonymousThread(Executando);
    aThread.OnTerminate := TratarRetorno;
    aThread.Start;
  end;
end;

function TServiceRequest.Execute(const aCallbackJSON: TProc<TJSONValue>): IServiceRequest;
begin
  Result := Self;

  if Assigned(aCallbackJSON) then
    FCallbackJSON := aCallbackJSON;

  Self.Executar;
end;

function TServiceRequest.Executing: Boolean;
begin
  Result := FExecuting;
end;

procedure TServiceRequest.Get(const aCallbackJSON : TProc<TJSONValue> = nil);
begin
  if Assigned(aCallbackJSON) then
    FCallbackJSON := aCallbackJSON;

  FRESTRequest.Method := TRESTRequestMethod.rmGET;
  Self.Executar;
end;

class function TServiceRequest.New(aBaseURL: String): TServiceRequest;
begin
  Result := Self.Create(aBaseURL);
end;

procedure TServiceRequest.Notify;
var
  I : Integer;
  aObserver :  IObserver;
begin
  for I := 0 to Pred(FObservers.Count) do
  begin
    aObserver := FObservers.Items[I] as IObserver;
    aObserver.Update;
  end;
end;

procedure TServiceRequest.removeObserver(Observer: IObserver);
begin
  if (FObservers.IndexOf(Observer) > -1) then
    FObservers.Remove(Observer);
end;

function TServiceRequest.Resource(Value: String): IServiceRequest;
begin
  Result := Self;
  FRESTRequest.Resource := Value.Trim;
end;

function TServiceRequest.ResponseJSON : TJSONValue;
var
  aJson : TJSONValue;
begin
  aJson  := TJSONValue.ParseJSONValue(TEncoding.UTF8.GetBytes(FRESTResponse.Content), 0);
  Result := aJson;
end;

procedure TServiceRequest.TratarRetorno(Sender: TObject);
begin
  FExecuting := False;

  if (Sender is TThread) then
    if Assigned(TThread(Sender).FatalException) then
      raise Exception.Create('Erro ao tentar executar a requisição.' + #13 + Exception(TThread(Sender).FatalException).Message);

  Self.Notify;

  if Assigned(FCallbackJSON) then
    FCallbackJSON(Self.ResponseJSON);
end;

function TServiceRequest.Response: TRESTResponse;
begin
  Result := FRESTResponse;
end;

end.
