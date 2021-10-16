unit SGE.Controller.LogTransacao;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  TControllerLogTransacao = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerLogTransacao }

constructor TControllerLogTransacao.Create;
begin
  inherited Create(TModelDAOFactory.New.LogTransacao);
end;

destructor TControllerLogTransacao.Destroy;
begin
  inherited;
end;

class function TControllerLogTransacao.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
