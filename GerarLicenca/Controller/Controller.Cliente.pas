unit Controller.Cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,
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
      FReponse : TJSONObject;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCliente<TControllerCliente>;

      function DataSet(Value : TClientDataSet) : IControllerCliente<TControllerCliente>; overload;
      function DataSet : TClientDataSet; overload;
      function Entity : TCliente<TControllerCliente>;
      function LoadDataSet(aTokenID : String) : IControllerCliente<TControllerCliente>; overload;
      function LoadDataSet(aTokenID : String; aClientDataSet : TClientDataSet) : IControllerCliente<TControllerCliente>; overload;
      function Save(aTokenID : String)   : IControllerCliente<TControllerCliente>;
      function Error  : String;
  end;

const
//  BASE_URL = 'https://firestore.googleapis.com/v1/projects/applicencaagil/databases/(default)/documents/clientes';
  BASE_URL = 'https://firestore.googleapis.com/v1/projects/applicencaagil/databases/(default)/documents';

implementation

uses
  Firebase.Interfaces,
  Firebase.Auth,
  Firebase.Database,
  Firebase.Response;

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  FCliente := TCliente<TControllerCliente>.New(Self);
  FDataSet := TClientDataSet.Create(nil);
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

function TControllerCliente.LoadDataSet(aTokenID : String) : IControllerCliente<TControllerCliente>;
begin
  Result := self;
  FFirebaseConn
    .Connect
      .BaseURL(BASE_URL)
      .Auth(aTokenID)
    .&End
    .Get
      .Resource('clientes') // Recurso "Tabela" que será consumida
      .DataSet(FDataSet)    // Pode setar o DataSet que vai receber o retorno da Consulta
    .&End
  .Exec;
end;

function TControllerCliente.LoadDataSet(aTokenID: String;
  aClientDataSet: TClientDataSet): IControllerCliente<TControllerCliente>;
var
  aDocuments : TJSONArray;
  aCliente   ,
  aCampos    : TJSONObject;
  aDoc : TstringList;
  I : Integer;
begin
  Result := self;
  aClientDataSet.DisableControls;
  try
    FFirebaseConn
      .Connect
        .BaseURL(BASE_URL)
        .Auth(aTokenID)
      .&End
      .Get
        .Resource('clientes')      // Recurso "Tabela" que será consumida
        .ResponseContent(FReponse) // Pode setar um (JsonObject/JsonArray/String) que irá receber o retorno da Consulta
      .&End
    .Exec;

    if Assigned(FReponse) then
    begin
      aDocuments := FReponse.GetValue('documents') as TJSONArray;
      for I := 0 to Pred(aDocuments.Count) do
      begin
        aCliente := aDocuments.Items[I] as TJSONObject;
        aCampos  := aCliente.GetValue('fields') as TJSONObject;

        aDoc := TstringList.Create;
        aDoc.Delimiter     := '/';
        aDoc.DelimitedText := aCliente.GetValue<String>('name');

        aClientDataSet.Append;
        aClientDataSet.FieldByName('name').AsString := aCliente.GetValue<String>('name');
        aClientDataSet.FieldByName('doc').AsString  := aDoc.Strings[Pred(aDoc.Count)];
        aClientDataSet.FieldByName('uuid').AsString := TJSONObject(aCampos.GetValue('uuid')).GetValue<String>('stringValue');
        aClientDataSet.FieldByName('cgc').AsString  := TJSONObject(aCampos.GetValue('cgc')).GetValue<String>('stringValue');
        aClientDataSet.FieldByName('razao').AsString    := TJSONObject(aCampos.GetValue('razao')).GetValue<String>('stringValue');
        aClientDataSet.FieldByName('fantasia').AsString := TJSONObject(aCampos.GetValue('fantasia')).GetValue<String>('stringValue');
        aClientDataSet.FieldByName('email').AsString    := TJSONObject(aCampos.GetValue('email')).GetValue<String>('stringValue');
        aClientDataSet.Post;

        aDoc.DisposeOf;
      end;
    end;
  finally
    aClientDataSet.First;
    aClientDataSet.EnableControls;
  end;
end;

function TControllerCliente.Save(aTokenID : String) : IControllerCliente<TControllerCliente>;
var
  aJson    ,
  aReponse : TJSONObject;
begin
  Result := Self;
  aJson  := TJsonObject.Create;
  try

//    if (FCliente.doc = EmptyStr)  then
//    begin
//      FFirebaseConn
//        .Connect
//          .BaseURL(BASE_URL)
//          .Auth(aTokenID)
//        .&End
//        .Post
//          .Resource('clientes')
//          .Json(aJson)
//          .Resource(aReponse)
//        .&End
//      .Exec;
//    end
//    else
//    begin
//      FFirebaseConn
//        .Connect
//          .BaseURL(BASE_URL)
//          .Auth(aTokenID)
//        .&End
//        .Put
//          .Resource('clientes/' + FCliente.doc)
//          .Json(aJson)
//          .Resource(aReponse)
//        .&End
//      .Exec;
//    end;
  finally
    aJson.DisposeOf;
  end;
end;

class function TControllerCliente.New: IControllerCliente<TControllerCliente>;
begin
  Result := Self.Create;
end;

end.
