unit Classe.Licenca;

interface

uses
  System.SysUtils, Interacao.Licenca;

type
  TLicenca = class(TInterfacedObject, ILicencaModel)
    strict private
      class var _instance : ILicencaModel;
    private
      Fdoc : String;
      FUUID     : TGUID;
      FEmpresa  : String;
      FNomeFantasia : String;
      FCNPJ     : String;
      FEmail    : String;
      FEndereco : String;
      FNumero : String;
      FBairro : String;
      FCidade : String;
      FUF     : String;
      FCEP    : String;
      FCompetencia  : Integer;
      FDataBloqueio : TDateTime;
      FUsarSGE : Boolean;
      FUsarSGI : Boolean;
      FUsarSGF : Boolean;
      FUsarSGO : Boolean;
    public
      constructor Create;
      destructor Destroy; override;

      function doc(Value : String) : ILicencaModel; overload;
      function doc : String; overload;

      function UUID(Value : TGUID) : ILicencaModel; overload;
      function UUID : TGUID; overload;

      function Empresa(Value : String) : ILicencaModel; overload;
      function Empresa : String; overload;

      function NomeFantasia(Value : String) : ILicencaModel; overload;
      function NomeFantasia : String; overload;

      function CNPJ(Value : String) : ILicencaModel; overload;
      function CNPJ : String; overload;

      function Email(Value : String) : ILicencaModel; overload;
      function Email : String; overload;

      function Endereco(Value : String) : ILicencaModel; overload;
      function Endereco : String; overload;

      function Numero(Value : String) : ILicencaModel; overload;
      function Numero : String; overload;

      function Bairro(Value : String) : ILicencaModel; overload;
      function Bairro : String; overload;

      function Cidade(Value : String) : ILicencaModel; overload;
      function Cidade : String; overload;

      function UF(Value : String) : ILicencaModel; overload;
      function UF : String; overload;

      function CEP(Value : String) : ILicencaModel; overload;
      function CEP : String; overload;

      function Competencia(Value : Integer) : ILicencaModel; overload;
      function Competencia : Integer; overload;

      function DataBloqueio(Value : TDateTime) : ILicencaModel; overload;
      function DataBloqueio : TDateTime; overload;

      function UsarSGE(Value : Boolean) : ILicencaModel; overload;
      function UsarSGE : Boolean; overload;

      function UsarSGI(Value : Boolean) : ILicencaModel; overload;
      function UsarSGI : Boolean; overload;

      function UsarSGF(Value : Boolean) : ILicencaModel; overload;
      function UsarSGF : Boolean; overload;

      function UsarSGO(Value : Boolean) : ILicencaModel; overload;
      function UsarSGO : Boolean; overload;

      class function New() : ILicencaModel;
  end;

implementation

{ TLicenca }

function TLicenca.Bairro(Value: String): ILicencaModel;
begin
  Result  := Self;
  FBairro := Value.Trim();
end;

function TLicenca.Bairro: String;
begin
  Result := FBairro;
end;

function TLicenca.CEP(Value: String): ILicencaModel;
begin
  Result := Self;
  FCEP   := Value.Trim();
end;

function TLicenca.CEP: String;
begin
  Result := FCEP;
end;

function TLicenca.Cidade: String;
begin
  Result := FCidade;
end;

function TLicenca.Cidade(Value: String): ILicencaModel;
begin
  Result  := Self;
  FCidade := Value.Trim();
end;

function TLicenca.CNPJ(Value: String): ILicencaModel;
begin
  Result := Self;
  FCNPJ  := Value.Trim();
end;

function TLicenca.CNPJ: String;
begin
  Result := FCNPJ;
end;

function TLicenca.Competencia(Value: Integer): ILicencaModel;
begin
  Result := Self;
  FCompetencia := Value;
end;

function TLicenca.Competencia: Integer;
begin
  Result := FCompetencia;
end;

constructor TLicenca.Create;
begin
  Fdoc          := EmptyStr;
  FEmpresa      := 'EMPRESA DE DEMONSTRAÇÃO';
  FNomeFantasia := 'DEMONSTRAÇÃO';
  FCNPJ         := '00.000.000/0000-00';
  FEmail        := 'isaque.ribeiro@outlook.com';
  FEndereco := EmptyStr;
  FBairro   := EmptyStr;
  FCidade   := EmptyStr;
  FUF       := EmptyStr;
  FCEP      := EmptyStr;
  FCompetencia  := FormatDateTime('yyyymm', (Date - 1)).ToInteger();
  FDataBloqueio := Date - 1;
  FUsarSGE := False;
  FUsarSGI := False;
  FUsarSGF := False;
  FUsarSGO := False;
end;

function TLicenca.DataBloqueio(Value: TDateTime): ILicencaModel;
begin
  Result  := Self;
  FDataBloqueio := Value;
end;

function TLicenca.DataBloqueio: TDateTime;
begin
  Result := FDataBloqueio;
end;

destructor TLicenca.Destroy;
begin
  inherited;
end;

function TLicenca.doc: String;
begin
  Result := Fdoc;
end;

function TLicenca.doc(Value: String): ILicencaModel;
begin
  Result := Self;
  Fdoc   := Value.Trim;
end;

function TLicenca.Empresa(Value: String): ILicencaModel;
begin
  Result   := Self;
  FEmpresa := Value.Trim();
end;

function TLicenca.Email: String;
begin
  Result := FEmail;
end;

function TLicenca.Email(Value: String): ILicencaModel;
begin
  Result := Self;
  FEmail := Value.Trim.ToLower;
end;

function TLicenca.Empresa: String;
begin
  Result := FEmpresa;
end;

function TLicenca.Endereco: String;
begin
  Result := FEndereco;
end;

function TLicenca.Endereco(Value: String): ILicencaModel;
begin
  Result := Self;
  FEndereco := Value.Trim();
end;

function TLicenca.UF: String;
begin
  Result := FUF;
end;

function TLicenca.UF(Value: String): ILicencaModel;
begin
  Result := Self;
  FUF    := Value.Trim().ToUpper();
end;

function TLicenca.UsarSGE: Boolean;
begin
  Result := FUsarSGE;
end;

function TLicenca.UsarSGE(Value: Boolean): ILicencaModel;
begin
  Result   := Self;
  FUsarSGE := Value;
end;

function TLicenca.UsarSGF(Value: Boolean): ILicencaModel;
begin
  Result   := Self;
  FUsarSGF := Value;
end;

function TLicenca.UsarSGF: Boolean;
begin
  Result := FUsarSGF;
end;

function TLicenca.UsarSGI: Boolean;
begin
  Result := FUsarSGI;
end;

function TLicenca.UsarSGI(Value: Boolean): ILicencaModel;
begin
  Result   := Self;
  FUsarSGI := Value;
end;

function TLicenca.UsarSGO(Value: Boolean): ILicencaModel;
begin
  Result   := Self;
  FUsarSGO := Value;
end;

function TLicenca.UsarSGO: Boolean;
begin
  Result := FUsarSGO;
end;

function TLicenca.UUID: TGUID;
begin
  Result := FUUID;
end;

function TLicenca.UUID(Value: TGUID): ILicencaModel;
begin
  Result := Self;
  FUUID  := Value;
end;

function TLicenca.NomeFantasia: String;
begin
  Result := FNomeFantasia;
end;

function TLicenca.Numero: String;
begin
  Result := FNumero;
end;

function TLicenca.Numero(Value: String): ILicencaModel;
begin
  Result  := Self;
  FNumero := Value.Trim;
end;

function TLicenca.NomeFantasia(Value: String): ILicencaModel;
begin
  Result := Self;
  FNomeFantasia := Value.Trim();
end;

class function TLicenca.New: ILicencaModel;
begin
  //Result := Self.Create;
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

end.
