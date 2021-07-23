unit SGE.Controller.Bairro;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerBairro = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerBairro }

constructor TControllerBairro.Create;
begin
  inherited Create(TModelDAOFactory.New.Bairro);
end;

destructor TControllerBairro.Destroy;
begin
  inherited;
end;

class function TControllerBairro.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
