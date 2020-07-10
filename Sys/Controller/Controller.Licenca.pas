unit Controller.Licenca;

interface

uses
  System.SysUtils, Classe.Licenca, Interacao.Licenca;

type
  TLicencaController = class(TInterfacedObject, ILicenca)
    strict private
      class var _instance : ILicenca;
    private
      [weak]
      FModel   : ILicencaModel;
      procedure GravarArquivo(aFileName : TFileName);
      procedure CarregarDados;

      function LicencaValida(aFileName : TFileName) : Boolean;
    public
      constructor Create;
      destructor Destroy; override;

      function Carregar(aFileName : TFileName) : ILicenca; overload;
      function Carregar : ILicenca; overload;

      function Model : ILicencaModel;
      function Empresa : String;
      function NomeFantasia : String;
      function CNPJ : String;
      function DataBloqueio : TDateTime;
      function Competencia : Integer;
      function UsarSGE : Boolean;
      function UsarSGI : Boolean;
      function UsarSGF : Boolean;
      function UsarSGO : Boolean;

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

function TLicencaController.Competencia: Integer;
begin
  Result := FModel.Competencia;
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

function TLicencaController.DataBloqueio: TDateTime;
begin
  Result := FModel.DataBloqueio;
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

function TLicencaController.Model: ILicencaModel;
begin
  Result := FModel;
end;

function TLicencaController.NomeFantasia: String;
begin
  Result := FModel.NomeFantasia;
end;

function TLicencaController.UsarSGE: Boolean;
begin
  Result := FModel.UsarSGE;
end;

function TLicencaController.UsarSGF: Boolean;
begin
  Result := FModel.UsarSGF;
end;

function TLicencaController.UsarSGI: Boolean;
begin
  Result := FModel.UsarSGI;
end;

function TLicencaController.UsarSGO: Boolean;
begin
  Result := FModel.UsarSGO;
end;

end.
