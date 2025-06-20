unit Service.Request.CNPJ;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,
  Service.Request;

type
  TEndereco = record
    Tipo ,
    Logradouro ,
    Numero     ,
    Complemento,
    Bairro   ,
    Municipio,
    UF  ,
    CEP : String;
  end;

  TCnae = record
    Codigo    ,
    Descricao : String;
  end;

  TPessoaJuridica = record
    CNPJ       ,
    RazaoSocial,
    Fantasia   ,
    Status : String;
    Cnae   : TCnae;
    Endereco : TEndereco;
    DataAbertura : String;
    Cnaes : TStringList;
    Ativa : Boolean;
  end;

  TProcCNPJ = procedure(aResponse : TPessoaJuridica) of object;

  TServiceRequestCNPJ = class
    private
      FEntity   : TPessoaJuridica;
      FRequest  : IServiceRequest;
      FCallback : TProcCNPJ;
      FError    : String;

      procedure Callback(aResponse : TJSONValue);
    public
      constructor Create;
      procedure Consultar(aCNPJ : String; const aCallback : TProcCNPJ = nil);

      function Error : String;
  end;

implementation

{ TServiceRequestCNPJ }

procedure TServiceRequestCNPJ.Callback(aResponse: TJSONValue);
var
  I : Integer;
begin
  if (Pos('message', aResponse.ToString) > 0) then
    FError := aResponse.GetValue<String>('message')
  else
  begin
    try
      FEntity.CNPJ := aResponse.GetValue<String>('taxId');
      FEntity.RazaoSocial := Trim(aResponse.GetValue<TJSONObject>('company').GetValue<String>('name'));
      FEntity.Fantasia    := Trim(aResponse.GetValue<String>('alias'));
      FEntity.Status      := Trim(aResponse.GetValue<TJSONObject>('status').GetValue<String>('text')).ToUpper;
      FEntity.Cnae.Codigo    := Trim(aResponse.GetValue<TJSONObject>('mainActivity').GetValue<String>('id'));
      FEntity.Cnae.Descricao := Trim(aResponse.GetValue<TJSONObject>('mainActivity').GetValue<String>('text'));
      FEntity.DataAbertura   := Trim(aResponse.GetValue<String>('founded'));

      FEntity.DataAbertura := Copy(FEntity.DataAbertura, 9, 2) + '/' + Copy(FEntity.DataAbertura, 6, 2) + '/' + Copy(FEntity.DataAbertura, 1, 4);
      FEntity.Ativa   := FEntity.Status.Equals('ATIVA');

      with aResponse.GetValue<TJSONObject>('address') do
      begin
        FEntity.Endereco.Tipo        := EmptyStr;
        FEntity.Endereco.Logradouro  := Trim(GetValue<String>('street'));
        FEntity.Endereco.Numero      := Trim(GetValue<String>('number'));
        FEntity.Endereco.Complemento := EmptyStr;
        FEntity.Endereco.Bairro      := Trim(GetValue<String>('district'));
        FEntity.Endereco.Municipio   := Trim(GetValue<String>('city'));
        FEntity.Endereco.UF          := Trim(GetValue<String>('state'));
        FEntity.Endereco.CEP         := Trim(GetValue<String>('zip'));
      end;

      FEntity.Cnaes := TStringList.Create;
      FEntity.Cnaes.Clear;
      FEntity.Cnaes.BeginUpdate;
      with aResponse.GetValue<TJSONArray>('sideActivities') do
      begin
        for I := 0 to Pred(Count) do
        begin
          FEntity.Cnaes.Add(Get(I).GetValue<String>('id') + ' - ' + Get(I).GetValue<String>('text'));
        end;
      end;
      FEntity.Cnaes.EndUpdate;

      if Assigned(FCallback) then
        FCallback(FEntity);
    except
      On E : Exception do
        FError := E.Message;
    end;
  end;
end;

procedure TServiceRequestCNPJ.Consultar(aCNPJ: String; const aCallback : TProcCNPJ = nil);
begin
  if (not FRequest.Executing) then
  begin
    FCallback := aCallback;
    FError := EmptyStr;

    FRequest
      .Resource('office/{cnpj}')
      .AddSegmentURL('cnpj', aCNPJ)
      .Get;
  end;
end;

constructor TServiceRequestCNPJ.Create;
begin
  // Documentação:
  // https://cnpja.com/api/open
  FRequest := TServiceRequest.New('https://open.cnpja.com').Callback(Self.Callback);
end;

function TServiceRequestCNPJ.Error: String;
begin
  Result := FError.Trim;
end;

end.
