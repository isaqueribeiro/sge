unit Controller.Licenca;

interface

uses
  System.SysUtils, Classe.Licenca, Interacao.Licenca, Interacao.Conexao;

type
  TLicencaController = class(TInterfacedObject, ILicenca)
    strict private
      class var _instance : ILicenca;
    private
      [weak]
      FConexao : IConexao;
      FModel   : ILicencaModel;
      procedure GravarArquivo(aFileName : TFileName);
      procedure CarregarDados;

      function LicencaValida(aFileName : TFileName) : Boolean;
    public
      constructor Create;
      destructor Destroy; override;

      function Carregar(aConexao : IConexao) : ILicenca; overload;
      function Carregar(aFileName : TFileName) : ILicenca; overload;
      function Carregar : ILicenca; overload;

      function Empresa : String;
      function NomeFantasia : String;
      function CNPJ : String;

      class function GetInstance() : ILicenca;
  end;

implementation

{ TLicencaController }

class function TLicencaController.GetInstance: ILicenca;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TLicencaController.Carregar(aConexao: IConexao): ILicenca;
begin
  Result   := Self;
  FConexao := aConexao;
  Self.CarregarDados();
end;

function TLicencaController.Carregar: ILicenca;
begin
  Result := Self;
  Self.CarregarDados();
end;

procedure TLicencaController.CarregarDados;
begin
  ;
end;

function TLicencaController.CNPJ: String;
begin
  Result := FModel.CNPJ;
end;

function TLicencaController.Carregar(aFileName: TFileName): ILicenca;
begin
  Result := Self;
  Self.CarregarDados();

  if ( (FModel.CNPJ = EmptyStr) or (FModel.CNPJ = '00.000.000/0000-00') or LicencaValida(aFileName) ) then
    Self.GravarArquivo(aFileName)
  else
    raise Exception.Create('Licença inválida!');
end;

constructor TLicencaController.Create;
begin
  FModel := TLicenca.New;
end;

destructor TLicencaController.Destroy;
begin
  inherited;
end;

function TLicencaController.Empresa: String;
begin
  Result := FModel.Empresa;
end;

procedure TLicencaController.GravarArquivo(aFileName: TFileName);
begin
  ;
end;

function TLicencaController.LicencaValida(aFileName: TFileName): Boolean;
begin
  Result := False;
end;

function TLicencaController.NomeFantasia: String;
begin
  Result := FModel.NomeFantasia;
end;

end.
