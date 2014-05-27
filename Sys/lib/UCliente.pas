unit UCliente;

interface

uses SysUtils, Windows, Classes, UBaseObject;

type

  TTipoCliente = (tcPessoaFisica, tcPessoaJuridica);

  TCliente = class(TBaseObject)
  private
    fTipo    : TTipoCliente;
    fCpfCnpj ,
    fRazaoSocial,
    fFantasia   : String;

    procedure SetTipo(Value : TTipoCliente);
    procedure SetCpfCnpj(Value : String);
    procedure SetRazaoSocial(Value : String);
    procedure SetFantasia(Value : String);

    function GetTipo : TTipoCliente;
    function GetCpfCnpj : String;
    function GetRazaoSocial : String;
    function GetFantasia : String;
  public
    property Tipo    : TTipoCliente read GetTipo write SetTipo;
    property CpfCnpj : String read GetCpfCnpj write SetCpfCnpj;
    property RazaoSocial : String read GetRazaoSocial write SetRazaoSocial;
    property Fantasia : String read GetFantasia write SetFantasia;

    class function GetInstance() : TCliente;
    destructor Destroy; override;
  end;

implementation

{ TCliente }

var
  _Cliente : TCliente;

destructor TCliente.Destroy;
begin
  if ( _Cliente <> nil ) then
    _Cliente.Destroy;
  inherited;
end;

function TCliente.GetCpfCnpj: String;
begin
  Result := Trim(fCpfCnpj);
end;

function TCliente.GetFantasia: String;
begin
  Result := Trim(fFantasia);
end;

class function TCliente.GetInstance: TCliente;
begin
  if ( _Cliente = nil ) then
    _Cliente := TCliente.Create;

  Result := _Cliente;
end;

function TCliente.GetRazaoSocial: String;
begin
  Result := Trim(fRazaoSocial);
end;

function TCliente.GetTipo: TTipoCliente;
begin
  Result := fTipo;
end;

procedure TCliente.SetCpfCnpj(Value: String);
begin
  fCpfCnpj := Trim(Value);
end;

procedure TCliente.SetFantasia(Value: String);
begin
  fFantasia := Trim(Value);
end;

procedure TCliente.SetRazaoSocial(Value: String);
begin
  fRazaoSocial := Trim(Value);
end;

procedure TCliente.SetTipo(Value: TTipoCliente);
begin
  fTipo := Value;
end;

end.
