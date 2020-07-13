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
      FRazaoSOcial: String;

      procedure SetCNPJ(const Value: String);
      procedure SetCodigo(const Value: Integer);
      procedure SetFantasia(const Value: String);
      procedure SetRazaoSOcial(const Value: String);
    public
      constructor Create;
      destructor Destroy; override;

      property Codigo : Integer read FCodigo write SetCodigo;
      property RazaoSOcial : String read FRazaoSOcial write SetRazaoSOcial;
      property Fantasia : String read FFantasia write SetFantasia;
      property CNPJ : String read FCNPJ write SetCNPJ;

      function toString() : String; override;
  end;

  TEmpresa = class(TPessoaJuridica, IEmpresaModel)
    strict private
      class var _instance : TEmpresa;
    private
    public
      constructor Create;
      destructor Destroy; override;

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
    .RazaoSocial('EMPRESA DE DEMONSTRA플O')
    .Fantasia('DEMONSTRA플O')
    .CNPJ('00.000.000/0000-00')
    .Codigo(0);
end;

destructor TEmpresa.Destroy;
begin
  inherited;
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
  FRazaoSOcial := 'EMPRESA DE DEMONSTRA플O';
  FFantasia    := 'DEMONSTRA플O';
  FCNPJ        := '00.000.000/0000-00';
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
