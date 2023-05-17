unit SGE.Controller.Perfil;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Table
  TControllerPerfil = class(TController, IControllerPerfil)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerPerfil;
  end;

  // View
  TControllerTipoDescontoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerPerfil }

constructor TControllerPerfil.Create;
begin
  inherited Create(TModelDAOFactory.New.Perfil);
end;

destructor TControllerPerfil.Destroy;
begin
  inherited;
end;

class function TControllerPerfil.New: IControllerPerfil;
begin
  Result := Self.Create;
end;

{ TControllerTipoDescontoView }

constructor TControllerTipoDescontoView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoDescontoView);
end;

destructor TControllerTipoDescontoView.Destroy;
begin
  inherited;
end;

class function TControllerTipoDescontoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
