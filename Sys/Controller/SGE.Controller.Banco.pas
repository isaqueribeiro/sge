unit SGE.Controller.Banco;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerBanco = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

uses
  Controller.Factory;

{ TControllerBanco }

constructor TControllerBanco.Create;
begin
  inherited Create(TModelDAOFactory.New.Banco);
end;

destructor TControllerBanco.Destroy;
begin
  inherited;
end;

class function TControllerBanco.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
