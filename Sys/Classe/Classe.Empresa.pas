unit Classe.Empresa;


interface

Uses
  Classe.PessoaJuridica, Interacao.Empresa;

type
  TEmpresa = class(TPessoaJuridica, IEmpresaModel)
    private
      FCodigo : Integer;
      function Codigo(Value : Integer) : IEmpresaModel; overload;
    published
      function Codigo : Integer; overload;
    public
      constructor Create;
      destructor Destroy; override;

      function toString() : String; override;

      class function New : IEmpresaModel;
  end;

implementation

{ TEmpresa }

class function TEmpresa.New: IEmpresaModel;
begin
  Result := Self.Create;
end;

function TEmpresa.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TEmpresa.Codigo(Value : Integer): IEmpresaModel;
begin
  Result  := Self;
  FCodigo := Value;
end;

constructor TEmpresa.Create;
begin
  inherited;
  FCodigo := 0;
  Self.RazaoSocial('EMPRESA DE DEMONSTRAÇÃO')
    .Fantasia('DEMONSTRAÇÃO')
    .CNPJ('00.000.000/0000-00');
end;

destructor TEmpresa.Destroy;
begin
  inherited;
end;

function TEmpresa.toString: String;
begin
  Result := Self.Fantasia;
end;

end.
