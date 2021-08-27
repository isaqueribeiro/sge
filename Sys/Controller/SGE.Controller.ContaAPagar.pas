unit SGE.Controller.ContaAPagar;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Contas A Pagar
  TControllerContaAPagar = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerContaAPagar }

constructor TControllerContaAPagar.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaAPagar);
end;

destructor TControllerContaAPagar.Destroy;
begin
  inherited;
end;

class function TControllerContaAPagar.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
