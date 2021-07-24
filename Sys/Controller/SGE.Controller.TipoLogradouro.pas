unit SGE.Controller.TipoLogradouro;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerTipoLogradouro = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerTipoLogradouro }

constructor TControllerTipoLogradouro.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoLogradouro);
end;

destructor TControllerTipoLogradouro.Destroy;
begin
  inherited;
end;

class function TControllerTipoLogradouro.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
