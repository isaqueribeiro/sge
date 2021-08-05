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
  TControllerEmpresaView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
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

class function TControllerEmpresaView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
