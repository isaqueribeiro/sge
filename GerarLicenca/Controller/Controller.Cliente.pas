unit Controller.Cliente;

interface

uses
  Data.DB,
  Datasnap.DBClient,
  Controller.Interfaces,
  Model.Cliente,
  TBGFirebaseConnection.Interfaces,
  TBGFirebaseConnection.View.Connection;

type
  TControllerCliente = class(TInterfacedObject, IControllerCliente<TControllerCliente>)
    private
      FFirebaseConn : iFirebaseConnection;
      FDataSet : TClientDataSet;
      FCliente : TCliente<TControllerCliente>;
      FExpired : TDateTime;
      FError   : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCliente<TControllerCliente>;

      function DataSet(Value : TClientDataSet) : IControllerCliente<TControllerCliente>; overload;
      function DataSet : TClientDataSet; overload;
      function Entity : TCliente<TControllerCliente>;
      function Save(aTokenID : String)   : IControllerCliente<TControllerCliente>;
      function Error  : String;
  end;

const
//  BASE_URL = 'https://firestore.googleapis.com/v1/projects/applicencaagil/databases/(default)/documents/clientes';
  BASE_URL = 'https://firestore.googleapis.com/v1/projects/applicencaagil/databases/(default)/documents';

implementation

uses
  System.JSON,
  System.Generics.Collections,
  Firebase.Interfaces,
  Firebase.Auth,
  Firebase.Database,
  Firebase.Response;

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  FCliente := TCliente<TControllerCliente>.New(Self);
//  FDataSet := TClientDataSet.Create(nil);
  FFirebaseConn := TTBGFirebaseConnection.New;
end;

function TControllerCliente.DataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

function TControllerCliente.DataSet(Value: TClientDataSet): IControllerCliente<TControllerCliente>;
begin
  Result   := Self;
  FDataSet := Value;
end;

destructor TControllerCliente.Destroy;
begin
  FCliente.DisposeOf;
  FDataSet.DisposeOf;
  inherited;
end;

function TControllerCliente.Entity: TCliente<TControllerCliente>;
begin
  Result := FCliente;
end;

function TControllerCliente.Error: String;
begin
  Result := FError;
end;

function TControllerCliente.Save(aTokenID : String) : IControllerCliente<TControllerCliente>;
//var
//  aFirebase : IFirebaseDatabase;
//  aResponse : IFirebaseResponse;
//  aParams   : Array of string;
//  aQueryParams : TDictionary<string, string>;
begin
  Result := Self;
//
//  aFirebase := TFirebaseDatabase.Create;
//  aFirebase.SetBaseURI(BASE_URL);
//  aFirebase.SetToken(aTokenID);
//
//  // Pesquisar cliente
//  aQueryParams := TDictionary<string, string>.Create;
//  aResponse    := aFirebase.Get(aParams, aQueryParams);

  FFirebaseConn
    .Connect
      .BaseURL(BASE_URL)
      .Auth(aTokenID)
    .&End
    .Get
      .Resource('clientes')       // Recurso "Tabela" que será consumida
      .DataSet(FDataSet)          // Pode setar o DataSet que vai receber o retorno da Consulta
//      .ResponseContent(aResponse) // Pode setar um (JsonObject/JsonArray/String) que irá receber o retorno da Consulta
    .&End
  .Exec;
//
//  FError := aResponse.ToString;
end;

class function TControllerCliente.New: IControllerCliente<TControllerCliente>;
begin
  Result := Self.Create;
end;

end.
