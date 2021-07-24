unit SGE.Controller.Logradouro;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerLogradouro = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerLogradouro }

constructor TControllerLogradouro.Create;
begin
  inherited Create(TModelDAOFactory.New.Logradouro);
end;

destructor TControllerLogradouro.Destroy;
begin
  inherited;
end;

class function TControllerLogradouro.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
