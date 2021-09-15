unit Classe.Empresa;


interface

Uses
  System.SysUtils, Classe.PessoaJuridica, Interacao.Empresa;

type
  TEmpresaObject = class
    private
      FCNPJ: String;
      FFantasia: String;
      FCodigo: Integer;
      FRazaoSOcial : String;
      FEndereco : String;

      procedure SetCNPJ(const Value: String);
      procedure SetCodigo(const Value: Integer);
      procedure SetFantasia(const Value: String);
      procedure SetRazaoSOcial(const Value: String);
      procedure SetEndereco(const Value: String);
    public
      constructor Create;
      destructor Destroy; override;

      property Codigo : Integer read FCodigo write SetCodigo;
      property RazaoSOcial : String read FRazaoSOcial write SetRazaoSOcial;
      property Fantasia : String read FFantasia write SetFantasia;
      property CNPJ : String read FCNPJ write SetCNPJ;
      property Endereco : String read FEndereco write SetEndereco;

      function toString() : String; override;
  end;

  TEmpresa = class(TPessoaJuridica, IEmpresaModel)
    strict private
      class var _instance : TEmpresa;
    private
    public
      constructor Create;
      destructor Destroy; override;

      function Endereco(Value : String) : IEmpresaModel; overload;
      function Endereco : String; overload;

      function toString() : String; override;

      class function New : IEmpresaModel;
      class function GetInstance() : TEmpresa;
  end;

implementation

{ TEmpresa }

class function TEmpresa.New: IEmpresaModel;
begin
  Result := Self.Create;
end;

constructor TEmpresa.Create;
begin
  inherited;
  Self
    .RazaoSocial('EMPRESA DE DEMONSTRAÇÃO')
    .Fantasia('DEMONSTRAÇÃO')
    .CNPJ('00.000.000/0000-00')
    .Endereco('Rua Santa Maria, 68, Conj. Cristo Redentor - Icuí-Guajará - Cep.: 67.125-775 - Ananindeua/PA')
    .Codigo(0);
end;

destructor TEmpresa.Destroy;
begin
  inherited;
end;

function TEmpresa.Endereco: String;
begin
  Result := EmptyStr;
end;

function TEmpresa.Endereco(Value: String): IEmpresaModel;
begin
  Result := Self;
end;

class function TEmpresa.GetInstance: TEmpresa;
begin
  if not Assigned(_instance) then
    _instance := TEmpresa.Create;

  Result := _instance;
end;

function TEmpresa.toString: String;
begin
  Result := Self.Fantasia;
end;

{ TEmpresaObject }

constructor TEmpresaObject.Create;
begin
  FCodigo      := 0;
  FRazaoSOcial := 'EMPRESA DE DEMONSTRAÇÃO';
  FFantasia    := 'DEMONSTRAÇÃO';
  FCNPJ        := '00.000.000/0000-00';
  FEndereco    := 'Rua Santa Maria, 68, Conj. Cristo Redentor - Icuí-Guajará - Cep.: 67.125-775 - Ananindeua/PA';
end;

destructor TEmpresaObject.Destroy;
begin
  inherited;
end;

procedure TEmpresaObject.SetCNPJ(const Value: String);
begin
  FCNPJ := Value.Trim;
end;

procedure TEmpresaObject.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEmpresaObject.SetEndereco(const Value: String);
begin
  FEndereco := Value.Trim;
end;

procedure TEmpresaObject.SetFantasia(const Value: String);
begin
  FFantasia := Value.Trim;
end;

procedure TEmpresaObject.SetRazaoSOcial(const Value: String);
begin
  FRazaoSOcial := Value.Trim;
end;

function TEmpresaObject.toString: String;
begin
  Result := FFantasia;
end;

end.
