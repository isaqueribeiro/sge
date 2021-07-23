unit SGE.Controller.Cidade;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerCidade = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerCidade }

constructor TControllerCidade.Create;
begin
  inherited Create(TModelDAOFactory.New.Cidade);
end;

destructor TControllerCidade.Destroy;
begin
  inherited;
end;

class function TControllerCidade.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
