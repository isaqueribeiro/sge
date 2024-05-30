unit Service.Request.CNPJ;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.JSON,
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
begin
(*
  {
      "NOME FANTASIA": "AGIL SOLUCOES EM SOFTWARES",
      "RAZAO SOCIAL": "I M RIBEIRO SOLUCOES EM SOFTWARES",
      "CNPJ": "17327623000176",
      "STATUS": "ATIVA",
      "CNAE PRINCIPAL DESCRICAO": "Desenvolvimento de programas de computador sob encomenda",
      "CNAE PRINCIPAL CODIGO": "6201501",
      "CEP": "67125000",
      "DATA ABERTURA": "20\/12\/2012",
      "DDD": "91",
      "TELEFONE": "32875498",
      "EMAIL": "",
      "TIPO LOGRADOURO": "RUA",
      "LOGRADOURO": "STA MARIA (LT CRISTO REDENTOR)",
      "NUMERO": "68",
      "COMPLEMENTO": "",
      "BAIRRO": "ICUI GUAJARA",
      "MUNICIPIO": "Ananindeua",
      "UF": "PA"
  }
*)
  if (Pos('error', aResponse.ToString) > 0) then
    FError := aResponse.GetValue<String>('error')
  else
  begin
    try
      FEntity.CNPJ := aResponse.GetValue<String>('CNPJ');
      FEntity.RazaoSocial := Trim(aResponse.GetValue<String>('RAZAO SOCIAL'));
      FEntity.Fantasia    := Trim(aResponse.GetValue<String>('NOME FANTASIA'));
      FEntity.Status  := aResponse.GetValue<String>('STATUS');
      FEntity.Cnae.Codigo    := Trim(aResponse.GetValue<String>('CNAE PRINCIPAL CODIGO'));
      FEntity.Cnae.Descricao := Trim(aResponse.GetValue<String>('CNAE PRINCIPAL DESCRICAO'));
      FEntity.DataAbertura := StringReplace(aResponse.GetValue<String>('DATA ABERTURA'), '\/', '/', [rfReplaceAll]);
      FEntity.Ativa   := FEntity.Status.Equals('ATIVA');

      FEntity.Endereco.Tipo        := Trim(aResponse.GetValue<String>('TIPO LOGRADOURO'));
      FEntity.Endereco.Logradouro  := Trim(aResponse.GetValue<String>('LOGRADOURO'));
      FEntity.Endereco.Numero      := Trim(aResponse.GetValue<String>('NUMERO'));
      FEntity.Endereco.Complemento := Trim(aResponse.GetValue<String>('COMPLEMENTO'));
      FEntity.Endereco.Bairro      := Trim(aResponse.GetValue<String>('BAIRRO'));
      FEntity.Endereco.Municipio   := Trim(aResponse.GetValue<String>('MUNICIPIO'));
      FEntity.Endereco.UF          := Trim(aResponse.GetValue<String>('UF'));
      FEntity.Endereco.CEP         := Trim(aResponse.GetValue<String>('CEP'));

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
      .Resource('buscarcnpj')
      .AddParameter('cnpj', aCNPJ)
      .Get;
  end;
end;

constructor TServiceRequestCNPJ.Create;
begin
  FRequest := TServiceRequest.New('https://api-publica.speedio.com.br').Callback(Self.Callback);
end;

function TServiceRequestCNPJ.Error: String;
begin
  Result := FError.Trim;
end;

end.
