unit SGE.Controller.ContaCorrente;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerContaCorrente = class(TController, IControllerContaCorrente)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContaCorrente;

      function CarregarLista(aEmpresa : String) : IControllerContaCorrente;
  end;

  TControllerContaCorrenteView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerContaCorrente }

function TControllerContaCorrente.CarregarLista(aEmpresa: String): IControllerContaCorrente;
begin
  Result := Self;

  FDAO
    .Close
    .ClearWhere;

  FDAO
    .Where('cc.Empresa = :empresa')
    .ParamsByName('empresa', aEmpresa)
    .OrderBy('cc.Descricao')
    .Open;
end;

constructor TControllerContaCorrente.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaCorrente);
end;

destructor TControllerContaCorrente.Destroy;
begin
  inherited;
end;

class function TControllerContaCorrente.New: IControllerContaCorrente;
begin
  Result := Self.Create;
end;

{ TControllerContaCorrenteView }

constructor TControllerContaCorrenteView.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaCorrenteView);
end;

destructor TControllerContaCorrenteView.Destroy;
begin
  inherited;
end;

class function TControllerContaCorrenteView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
