unit SGE.Controller.Rotina;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  Data.DB,

  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Table - Rotinas do Sistema
  TControllerRotina = class(TController, IControllerRotina)
    private
      FMenus   ,
      FSubMenus,
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerRotina;

      function CarregarMenus(aSistema : Integer) : IControllerRotina;
      function CarregarSubMenus(aSistema : Integer; aRotina : String) : IControllerRotina;
      function Menus : TDataSet;
      function SubMenus : TDataSet;
  end;

  // Table - Menus do Sistema
  TControllerRotinaMenu = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table - SubMenus do Sistema
  TControllerRotinaSubMenu = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerRotina }

function TControllerRotina.CarregarMenus(aSistema: Integer): IControllerRotina;
begin
  Result := Self;
  FMenus.Close;
  FMenus
    .ParamsByName('sistema', aSistema)
    .Open;
end;

function TControllerRotina.CarregarSubMenus(aSistema: Integer; aRotina: String): IControllerRotina;
begin
  Result := Self;
  FMenus.Close;
  FMenus
    .ParamsByName('sistema', aSistema)
    .ParamsByName('rotina', aRotina)
    .Open;
end;

constructor TControllerRotina.Create;
begin
  inherited Create(TModelDAOFactory.New.Rotina);
end;

destructor TControllerRotina.Destroy;
begin
  inherited;
end;

function TControllerRotina.Menus: TDataSet;
begin
  if not Assigned(FMenus) then
    FMenus := TModelDAOFactory.New.RotinaMenu;

  Result := FMenus.DataSet;
end;

class function TControllerRotina.New: IControllerRotina;
begin
  Result := Self.Create;
end;

function TControllerRotina.SubMenus: TDataSet;
begin
  if not Assigned(FSubMenus) then
    FSubMenus := TModelDAOFactory.New.RotinaSubMenu;

  Result := FSubMenus.DataSet;
end;

{ TControllerRotinaMenu }

constructor TControllerRotinaMenu.Create;
begin
  inherited Create(TModelDAOFactory.New.RotinaMenu);
end;

destructor TControllerRotinaMenu.Destroy;
begin
  inherited;
end;

class function TControllerRotinaMenu.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerRotinaSubMenu }

constructor TControllerRotinaSubMenu.Create;
begin
  inherited Create(TModelDAOFactory.New.RotinaSubMenu);
end;

destructor TControllerRotinaSubMenu.Destroy;
begin
  inherited;
end;

class function TControllerRotinaSubMenu.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
