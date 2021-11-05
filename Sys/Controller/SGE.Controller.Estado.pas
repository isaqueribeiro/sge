unit SGE.Controller.Estado;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerEstado = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerEstado }

constructor TControllerEstado.Create;
begin
  inherited Create(TModelDAOFactory.New.Estado);
end;

destructor TControllerEstado.Destroy;
begin
  inherited;
end;

class function TControllerEstado.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
