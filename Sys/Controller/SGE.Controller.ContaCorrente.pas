unit SGE.Controller.ContaCorrente;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerContaCorrente = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
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

constructor TControllerContaCorrente.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaCorrente);
end;

destructor TControllerContaCorrente.Destroy;
begin
  inherited;
end;

class function TControllerContaCorrente.New: IControllerCustom;
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
