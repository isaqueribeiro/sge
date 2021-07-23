unit SGE.Controller.Distrito;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerDistrito = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerDistrito }

constructor TControllerDistrito.Create;
begin
  inherited Create(TModelDAOFactory.New.Distrito);
end;

destructor TControllerDistrito.Destroy;
begin
  inherited;
end;

class function TControllerDistrito.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
