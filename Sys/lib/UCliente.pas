unit UCliente;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  UBaseObject;

type
  TTipoCliente = (tcPessoaFisica, tcPessoaJuridica);

  TCliente = class(TBaseObject)
  strict private
    class var _instance : TCliente;
  private
    FTipo    : TTipoCliente;
    FCpfCnpj ,
    FRazaoSocial ,
    FFantasia    ,
    FDataAbertura,
    FStatus : String;

    procedure SetTipo(Value : TTipoCliente);
    procedure SetCpfCnpj(Value : String);
    procedure SetRazaoSocial(Value : String);
    procedure SetFantasia(Value : String);
    procedure SetDataAbertura(const Value: String);
    procedure SetStatus(const Value: String);

    function GetTipo : TTipoCliente;
    function GetCpfCnpj : String;
    function GetRazaoSocial : String;
    function GetFantasia : String;
  public
    property Tipo    : TTipoCliente read GetTipo write SetTipo;
    property CpfCnpj : String read GetCpfCnpj write SetCpfCnpj;
    property RazaoSocial : String read GetRazaoSocial write SetRazaoSocial;
    property Fantasia : String read GetFantasia write SetFantasia;
    property DataAbertura : String read FDataAbertura write SetDataAbertura;
    property Status : String read FStatus write SetStatus;
//    Cnae   : TCnae;
//    Endereco : TEndereco;

    class function GetInstance() : TCliente;
    destructor Destroy; override;

    function Ativa : Boolean;
  end;

implementation

{ TCliente }

var
  _Cliente : TCliente;

function TCliente.Ativa: Boolean;
begin
  Result := FStatus.Equals('ATIVA');
end;

destructor TCliente.Destroy;
begin
  if (_Cliente <> nil) then
    _Cliente.Destroy;
  inherited;
end;

function TCliente.GetCpfCnpj: String;
begin
  Result := Trim(FCpfCnpj);
end;

function TCliente.GetFantasia: String;
begin
  Result := Trim(FFantasia);
end;

class function TCliente.GetInstance: TCliente;
begin
  if not Assigned(_instance) then
    _instance := TCliente.Create;

  if (_Cliente = nil) then
    _Cliente := _instance;

  Result := _instance;
end;

function TCliente.GetRazaoSocial: String;
begin
  Result := Trim(FRazaoSocial);
end;

function TCliente.GetTipo: TTipoCliente;
begin
  Result := FTipo;
end;

procedure TCliente.SetCpfCnpj(Value: String);
begin
  FCpfCnpj := Trim(Value);
end;

procedure TCliente.SetDataAbertura(const Value: String);
begin
  FDataAbertura := Value.Trim;
end;

procedure TCliente.SetFantasia(Value: String);
begin
  FFantasia := Trim(Value);
end;

procedure TCliente.SetRazaoSocial(Value: String);
begin
  FRazaoSocial := Trim(Value);
end;

procedure TCliente.SetStatus(const Value: String);
begin
  FStatus := Value.Trim.ToUpper;
end;

procedure TCliente.SetTipo(Value: TTipoCliente);
begin
  FTipo := Value;
end;

initialization
  ;

finalization
  if Assigned(_Cliente) then
    _Cliente.Free;

end.
