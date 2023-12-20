unit Controller.ClienteApp;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,
  Data.DB,
  Datasnap.DBClient,
  Firebase,
  Controller.Interfaces,
  Model.Cliente;

type
  TControllerClienteApp = class(TInterfacedObject, IControllerCliente<TControllerClienteApp>)
    private
      FDataSet : TClientDataSet;
      FCliente : TCliente<TControllerClienteApp>;
      FExpired : TDateTime;
      FError   : String;
      FFBRealTime  : TFBRealTime;
      FCodeProject : String;
      procedure ConfigFBRealTime(aTokenID : String);
      procedure FBRealTimeErrorOccurred(Sender: TComponent; Code: Integer; Error: string);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCliente<TControllerClienteApp>;

      function DataSet(Value : TClientDataSet) : IControllerCliente<TControllerClienteApp>; overload;
      function DataSet : TClientDataSet; overload;
      function CodeProject(Value : String) : IControllerCliente<TControllerClienteApp>;
      function Entity : TCliente<TControllerClienteApp>;
      function LoadDataSet(aTokenID : String; aClientDataSet : TClientDataSet) : IControllerCliente<TControllerClienteApp>;
      function Load(aTokenID, aDocument : String) : IControllerCliente<TControllerClienteApp>;
      function Save(aTokenID : String)   : IControllerCliente<TControllerClienteApp>;
      function Error  : String;
  end;

// DICAS:
// 1. https://www.youtube.com/watch?v=VUzzpoePoIs
// 2. https://www.youtube.com/playlist?list=PLB2U9eVzdLhQ7BIFcUEHO6_n9HkxZRYv8

implementation

uses
  Service.Utils;

{ TControllerClienteApp }

function TControllerClienteApp.CodeProject(Value: String): IControllerCliente<TControllerClienteApp>;
begin
  Result := Self;
  FCodeProject := Value.Trim;
end;

procedure TControllerClienteApp.ConfigFBRealTime;
begin
  FFBRealTime.ProjectCode := FCodeProject;
  FFBRealTime.Authentication.SecretKey.Token := aTokenID;
  FFBRealTime.CaseSensitive := True;

  FFBRealTime.onErrorOccurred := FBRealTimeErrorOccurred;
end;

constructor TControllerClienteApp.Create;
begin
  FCliente := TCliente<TControllerClienteApp>.New(Self);
  FDataSet := TClientDataSet.Create(nil);
  FFBRealTime := TFBRealTime.Create(nil);
end;

function TControllerClienteApp.DataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

function TControllerClienteApp.DataSet(Value: TClientDataSet): IControllerCliente<TControllerClienteApp>;
begin
  Result   := Self;
  FDataSet := Value;
end;

destructor TControllerClienteApp.Destroy;
begin
  FCliente.DisposeOf;
  FDataSet.DisposeOf;
  FFBRealTime.DisposeOf;
  inherited;
end;

function TControllerClienteApp.Entity: TCliente<TControllerClienteApp>;
begin
  Result := FCliente;
end;

function TControllerClienteApp.Error: String;
begin
  Result := FError;
end;

procedure TControllerClienteApp.FBRealTimeErrorOccurred(Sender: TComponent; Code: Integer; Error: string);
begin
  raise Exception.Create(Error);
end;

function TControllerClienteApp.Load(aTokenID, aDocument: String): IControllerCliente<TControllerClienteApp>;
var
  aResponse ,
  aRegistro : TJSONObject;
begin
  Result := self;
  try
    ConfigFBRealTime(aTokenID);
    aResponse := TJSONObject.ParseJSONValue(FFBRealTime.Collection('clientes').Key(aDocument).Get.ToJson) as TJSONObject;
    if Assigned(aResponse) and (not Assigned(aResponse.GetValue('error'))) then
    begin
      aRegistro := TJSONObject.ParseJSONValue(aResponse.ToString) as TJSONObject;

      FCliente
        .doc( aDocument )
        .UUID( StringToGUID('{' + aRegistro.GetValue<String>('uuid') + '}') )
        .Razao( aRegistro.GetValue<String>('razao') )
        .Fantasia( aRegistro.GetValue<String>('fantasia') )
        .Cnpj( aRegistro.GetValue<String>('cgc') )
        .Email( aRegistro.GetValue<String>('email') )
        .Registered( True )
        .Endereco
          .Logradouro( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('logradouro') )
          .Numero( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('numero') )
          .Complemento( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('complemento') )
          .Bairro( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('bairro') )
          .Cep( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('cep') )
          .Cidade( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('cidade') )
          .UF( aRegistro.GetValue<TJSONObject>('endereco').GetValue<String>('uf') )
        .&End
        .Licenca
          .Competencia( aRegistro.GetValue<TJSONObject>('licenca').GetValue<Integer>('competencia') )
          .Bloqueio( TServicesUtils.StrDateFormatBr(aRegistro.GetValue<TJSONObject>('licenca').GetValue<String>('bloqueio')) )
          .Sistemas
            .SGE( aRegistro.GetValue<TJSONObject>('licenca').GetValue<TJSONObject>('sistemas').GetValue<String>('SGE').Equals('true') )
            .SGO( aRegistro.GetValue<TJSONObject>('licenca').GetValue<TJSONObject>('sistemas').GetValue<String>('SGO').Equals('true') )
            .SGI( aRegistro.GetValue<TJSONObject>('licenca').GetValue<TJSONObject>('sistemas').GetValue<String>('SGI').Equals('true') )
            .SGF( aRegistro.GetValue<TJSONObject>('licenca').GetValue<TJSONObject>('sistemas').GetValue<String>('SGF').Equals('true') )
          .&End
        .&End;
    end;
  finally
    if Assigned(aResponse) then
      aResponse.DisposeOf;
  end;
end;

function TControllerClienteApp.LoadDataSet(aTokenID: String;
  aClientDataSet: TClientDataSet): IControllerCliente<TControllerClienteApp>;
var
  aResponse ,
  aTabela   ,
  aRegistro : TJSONObject;
  aCliente,
  aKey    : String;
  I : Integer;
begin
  Result := self;
  aClientDataSet.DisableControls;
  try
    ConfigFBRealTime(aTokenID);
    aResponse := TJSONObject.ParseJSONValue(FFBRealTime.Collection('clientes').Key('').Get.ToJson) as TJSONObject;
    if Assigned(aResponse) and (not Assigned(aResponse.GetValue('error'))) then
    begin
      aTabela := TJSONObject.ParseJSONValue(aResponse.ToString) as TJSONObject;
      for I := 0 to Pred(aTabela.Count) do
      begin
        aKey      := aTabela.Pairs[I].JsonString.ToString.Replace('"', '', [rfReplaceAll]);
        aCliente  := aTabela.Pairs[I].JsonValue.ToString;
        aRegistro := TJSONObject.ParseJSONValue(aCliente) as TJSONObject;

        aClientDataSet.Append;
        aClientDataSet.FieldByName('name').AsString := aKey;
        aClientDataSet.FieldByName('doc').AsString  := aKey;
        aClientDataSet.FieldByName('uuid').AsString := aRegistro.GetValue<String>('uuid');
        aClientDataSet.FieldByName('cgc').AsString  := aRegistro.GetValue<String>('cgc');
        aClientDataSet.FieldByName('razao').AsString    := aRegistro.GetValue<String>('razao');
        aClientDataSet.FieldByName('fantasia').AsString := aRegistro.GetValue<String>('fantasia');
        aClientDataSet.FieldByName('email').AsString    := aRegistro.GetValue<String>('email');
        aClientDataSet.Post;
      end;
    end;
  finally
    if Assigned(aResponse) then
      aResponse.DisposeOf;

    if Assigned(aTabela) then
      aTabela.DisposeOf;

    if Assigned(aRegistro) then
      aRegistro.DisposeOf;

    aClientDataSet.First;
    aClientDataSet.EnableControls;
  end;
end;

function TControllerClienteApp.Save(aTokenID : String) : IControllerCliente<TControllerClienteApp>;
var
  aOK : Boolean;
  aDoc  ,
  aUUID : String;
begin
  Result := Self;

  ConfigFBRealTime(aTokenID);

  if (FCliente.doc = EmptyStr)  then
    FCliente.NewID;

  aUUID := FCliente.UUID.ToString.Replace('{', '', [rfReplaceAll]).Replace('}', '', [rfReplaceAll]);
  aDoc  := aUUID.Replace('-', '', [rfReplaceAll]).ToLower;

  aOK :=
    FFBRealTime.Collection('clientes')
      .Key(aDoc)
      .Field('uuid', aUUID)
      .Field('razao', FCliente.Razao)
      .Field('fantasia', FCliente.Fantasia)
      .Field('cgc', FCliente.Cnpj)
      .Field('email', FCliente.Email)
      .Field('endereco',
        TJSONObject
          .Create
          .AddPair('logradouro', FCliente.Endereco.Logradouro)
          .AddPair('numero', FCliente.Endereco.Numero)
          .AddPair('complemento', FCliente.Endereco.Complemento)
          .AddPair('bairro', FCliente.Endereco.Bairro)
          .AddPair('cep', FCliente.Endereco.Cep)
          .AddPair('cidade', FCliente.Endereco.Cidade)
          .AddPair('uf', FCliente.Endereco.UF)
        )
      .Field('licenca',
        TJSONObject
          .Create
          .AddPair('competencia', FCliente.Licenca.Competencia.ToString)
          .AddPair('bloqueio', FormatDateTime('dd/mm/yyyy', FCliente.Licenca.Bloqueio))

          .AddPair('sistemas',
            TJSONObject
              .Create
              .AddPair('SGE', IfThen(FCliente.Licenca.Sistemas.SGE, 'true', 'false'))
              .AddPair('SGO', IfThen(FCliente.Licenca.Sistemas.SGO, 'true', 'false'))
              .AddPair('SGI', IfThen(FCliente.Licenca.Sistemas.SGI, 'true', 'false'))
              .AddPair('SGF', IfThen(FCliente.Licenca.Sistemas.SGF, 'true', 'false'))
          )
        )
      .Field('ativo', IfThen(FCliente.Active, 'true', 'false'))
      .Add
      .StatusCommunication = TResponseStatus.rsSucess;

  if aOK then
    FCliente.doc(aDoc)
  else
    raise Exception.Create('Erro ao tentar gravar registro do cliente');
end;

class function TControllerClienteApp.New: IControllerCliente<TControllerClienteApp>;
begin
  Result := Self.Create;
end;

end.
