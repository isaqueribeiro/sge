unit Service.Request.CEP;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.JSON,
  Service.Request;

type
  TGeoLocalizacao = record
    Latitude  ,
    Longitude : Double;
  end;
  
  TEndereco = record
    Tipo ,
    Logradouro ,
    Endereco   ,
    Numero     ,
    Complemento,
    Bairro   ,
    Municipio,
    IBGE     ,
    UF  ,
    CEP ,
    DDD : String;
    GeoLocalizacao : TGeoLocalizacao;
  end;

  TProcCEP = procedure(aResponse : TEndereco) of object;

  TServiceRequestCEP = class
    private
      FEntity   : TEndereco;
      FRequest  : IServiceRequest;
      FCallback : TProcCEP;
      FError    : String;

      procedure Callback(aResponse : TJSONValue);
      
      function TipoLogradouro(aEndereco : String) : String;
      function Logradouro(aEndereco : String) : String;
    public
      constructor Create;
      procedure Consultar(aCEP : String; const aCallback : TProcCEP = nil);

      function Error : String;
  end;

implementation

uses
  Service.Utils;

{ TServiceRequestCEP }

procedure TServiceRequestCEP.Callback(aResponse: TJSONValue);
begin
  if (Pos('erro', aResponse.ToString) > 0) then
    FError := 'CEP não localizado!'
  else
  begin
    try    
//      {* https://cep.awesomeapi.com.br/json/:cep *}
//      FEntity.Tipo        := Trim(aResponse.GetValue<String>('address_type'));
//      FEntity.Logradouro  := Trim(aResponse.GetValue<String>('address_name'));
//      FEntity.Endereco    := Trim(aResponse.GetValue<String>('address'));
//      FEntity.Numero      := EmptyStr;
//      FEntity.Complemento := Trim(aResponse.GetValue<String>('address_complement', EmptyStr));
//      FEntity.Bairro      := Trim(aResponse.GetValue<String>('district'));
//      FEntity.Municipio   := Trim(aResponse.GetValue<String>('city'));
//      FEntity.IBGE := Trim(aResponse.GetValue<String>('city_ibge'));
//      FEntity.UF   := Trim(aResponse.GetValue<String>('state'));
//      FEntity.CEP  := Trim(aResponse.GetValue<String>('cep'));
//      FEntity.DDD  := Trim(aResponse.GetValue<String>('ddd'));
//
//      FEntity.GeoLocalizacao.Latitude  := aResponse.GetValue<Double>('lat');
//      FEntity.GeoLocalizacao.Longitude := aResponse.GetValue<Double>('lng');

      {* https://viacep.com.br/ws/:cep/json *}
      FEntity.Tipo        := TipoLogradouro(aResponse.GetValue<String>('logradouro'));
      FEntity.Logradouro  := Logradouro(aResponse.GetValue<String>('logradouro'));
      FEntity.Endereco    := Trim(aResponse.GetValue<String>('logradouro'));
      FEntity.Numero      := EmptyStr;
      FEntity.Complemento := Trim(aResponse.GetValue<String>('complemento', EmptyStr));
      FEntity.Bairro      := Trim(aResponse.GetValue<String>('bairro'));
      FEntity.Municipio   := Trim(aResponse.GetValue<String>('localidade'));
      FEntity.IBGE := Trim(aResponse.GetValue<String>('ibge'));
      FEntity.UF   := Trim(aResponse.GetValue<String>('uf'));
      FEntity.CEP  := Trim(aResponse.GetValue<String>('cep'));
      FEntity.DDD  := Trim(aResponse.GetValue<String>('ddd'));

      FEntity.GeoLocalizacao.Latitude  := 0;
      FEntity.GeoLocalizacao.Longitude := 0;
      
      if Assigned(FCallback) then
        FCallback(FEntity);
    except
      On E : Exception do
        FError := E.Message;
    end;
  end;
end;

procedure TServiceRequestCEP.Consultar(aCEP: String; const aCallback : TProcCEP = nil);
begin
  if (not FRequest.Executing) then
  begin
    FCallback := aCallback;
    FError := EmptyStr;

    FRequest
      .Resource('{cep}/json')
      .AddSegmentURL('cep', aCEP)
      .Get;
  end;
end;

constructor TServiceRequestCEP.Create;
begin
  // https://viacep.com.br/ws/:cep/json
  FRequest := TServiceRequest.New('https://viacep.com.br/ws').Callback(Self.Callback);
end;

function TServiceRequestCEP.Error: String;
begin
  Result := FError.Trim;
end;

function TServiceRequestCEP.TipoLogradouro(aEndereco: String): String;
var
  aTipo ,
  aLogradouto : String;
  aDados : TStringList;
begin
  aDados := TStringList.Create;
  try
    aLogradouto := aEndereco.Trim.ToUpper;
    aTipo := EmptyStr;

    TServicesUtils.Split('.', aLogradouto, aDados);
    
    if (aDados.Count > 1) then
    begin
      aTipo := aDados.Strings[0];
      if aTipo.Length > 25 then
        aTipo := EmptyStr;
    end;

    if aTipo.IsEmpty then
    begin
      TServicesUtils.Split(' ', aLogradouto, aDados);
      if (aDados.Count > 1) then
        aTipo := aDados.Strings[0];
    end;

    if (not aTipo.IsEmpty) then
      aLogradouto := Trim(Copy(aLogradouto, aTipo.Length + 1, aLogradouto.Length));
  finally
    aDados.Free;
    
    Result := aTipo;
  end;
end;

function TServiceRequestCEP.Logradouro(aEndereco: String): String;
var
  aTipo : String;
begin
  Result := aEndereco.Trim.ToUpper;
  aTipo := TipoLogradouro(aEndereco);
  
  if (not aTipo.IsEmpty) then
    Result := Trim(Copy(Result, aTipo.Length + 1, Result.Length));
end;

end.
