unit SGE.Controller.Cliente;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerCliente = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerClienteTotalCompras = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // View
  TControllerClienteTitulos = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
  inherited Create(TModelDAOFactory.New.Cliente);
end;

destructor TControllerCliente.Destroy;
begin
  inherited;
end;

class function TControllerCliente.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerClienteTotalCompras }

constructor TControllerClienteTotalCompras.Create;
begin
  inherited Create(TModelDAOFactory.New.ClienteTotalCompras);
end;

destructor TControllerClienteTotalCompras.Destroy;
begin
  inherited;
end;

class function TControllerClienteTotalCompras.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerClienteTitulos }

constructor TControllerClienteTitulos.Create;
begin
  inherited Create(TModelDAOFactory.New.ClienteTitulos);
end;

destructor TControllerClienteTitulos.Destroy;
begin
  inherited;
end;

class function TControllerClienteTitulos.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
