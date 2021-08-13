unit SGE.Controller.Empresa;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

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
  end;

implementation

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
