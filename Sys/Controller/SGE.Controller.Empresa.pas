unit SGE.Controller.Empresa;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Table
  TControllerEmpresa = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerConfiguracaoEmpresa = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerEmpresaView = class(TController, IControllerEmpresa)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerEmpresa;

      function GetSegmentoID(aCNPJ : String) : Integer;
      function GetEmpresaUF(aCNPJ : String) : String;
      function GetEmpresaFantasia(aCNPJ : String) : String;
      function GetEmpresaRazao(aCNPJ : String) : String;
      function GetEstoqueUnificado(aCNPJ : String) : Boolean;
      function GetPermitirVendaEstoqueInsuficiente(aCNPJ : String) : Boolean;
      function GetPermitirEmissaoNFe(aCNPJ : String) : Boolean;
      function GetPermitirEmissaoNFeEntrada(aCNPJ : String) : Boolean;
      function GetRegime(aCNPJ : String) : TTipoRegime;
      function GetAutorizacaoInformarCliente(const aCNPJ : String) : Boolean;
  end;

implementation

uses
  System.SysUtils;

{ TControllerEmpresa }

constructor TControllerEmpresa.Create;
begin
  inherited Create(TModelDAOFactory.New.Empresa);
end;

destructor TControllerEmpresa.Destroy;
begin
  inherited;
end;

class function TControllerEmpresa.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerConfiguracaoEmpresa }

constructor TControllerConfiguracaoEmpresa.Create;
begin
  inherited Create(TModelDAOFactory.New.ConfiguracaoEmpresa);
end;

destructor TControllerConfiguracaoEmpresa.Destroy;
begin
  inherited;
end;

class function TControllerConfiguracaoEmpresa.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerEmpresaView }

constructor TControllerEmpresaView.Create;
begin
  inherited Create(TModelDAOFactory.New.EmpresaView);
end;

destructor TControllerEmpresaView.Destroy;
begin
  inherited;
end;

function TControllerEmpresaView.GetAutorizacaoInformarCliente(const aCNPJ: String): Boolean;
begin
  Result := False;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := (FDAO.DataSet.FieldByName('autoriza_informa_cliente').AsInteger = 1);
end;

function TControllerEmpresaView.GetEmpresaFantasia(aCNPJ: String): String;
begin
  Result := EmptyStr;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := FDAO.DataSet.FieldByName('fantasia').AsString;
end;

function TControllerEmpresaView.GetEmpresaRazao(aCNPJ: String): String;
begin
  Result := EmptyStr;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := FDAO.DataSet.FieldByName('razao').AsString;
end;

function TControllerEmpresaView.GetEmpresaUF(aCNPJ: String): String;
begin
  Result := EmptyStr;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := FDAO.DataSet.FieldByName('uf').AsString;
end;

function TControllerEmpresaView.GetEstoqueUnificado(aCNPJ: String): Boolean;
begin
  Result := False;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := (FDAO.DataSet.FieldByName('estoque_unico').AsInteger = 1);
end;

function TControllerEmpresaView.GetPermitirEmissaoNFe(aCNPJ: String): Boolean;
begin
  Result := False;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := (FDAO.DataSet.FieldByName('nfe_emitir').AsInteger = 1);
end;

function TControllerEmpresaView.GetPermitirEmissaoNFeEntrada(aCNPJ: String): Boolean;
begin
  Result := False;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := (FDAO.DataSet.FieldByName('nfe_emitir_entrada').AsInteger = 1);
end;

function TControllerEmpresaView.GetPermitirVendaEstoqueInsuficiente(aCNPJ: String): Boolean;
begin
  Result := False;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := (FDAO.DataSet.FieldByName('permitir_venda_estoque_ins').AsInteger = 1);
end;

function TControllerEmpresaView.GetRegime(aCNPJ: String): TTipoRegime;
begin
  Result := TTipoRegime.trRegimeNormal;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := TTipoRegime(FDAO.DataSet.FieldByName('regime').AsInteger);
end;

function TControllerEmpresaView.GetSegmentoID(aCNPJ: String): Integer;
begin
  Result := 0;

  if not FDAO.DataSet.Active then
    FDAO.Open;

  if FDAO.DataSet.Locate('cnpj', aCNPJ, []) then
    Result := FDAO.DataSet.FieldByName('segmento').AsInteger;
end;

class function TControllerEmpresaView.New: IControllerEmpresa;
begin
  Result := Self.Create;
end;

end.
