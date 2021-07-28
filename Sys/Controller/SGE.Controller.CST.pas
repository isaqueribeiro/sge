unit SGE.Controller.CST;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerCST = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCST }

constructor TControllerCST.Create;
begin
  inherited Create(TModelDAOFactory.New.CST);
end;

destructor TControllerCST.Destroy;
begin
  inherited;
end;

class function TControllerCST.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
