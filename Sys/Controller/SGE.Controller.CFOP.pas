unit SGE.Controller.CFOP;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerCFOP = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCFOP }

constructor TControllerCFOP.Create;
begin
  inherited Create(TModelDAOFactory.New.CFOP);
end;

destructor TControllerCFOP.Destroy;
begin
  inherited;
end;

class function TControllerCFOP.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
