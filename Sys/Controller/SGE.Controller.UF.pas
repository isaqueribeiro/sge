unit SGE.Controller.UF;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerUF = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerUF }

constructor TControllerUF.Create;
begin
  inherited Create(TModelDAOFactory.New.UF);
end;

destructor TControllerUF.Destroy;
begin
  inherited;
end;

class function TControllerUF.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
