unit SGE.Controller;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces;

type
  TController = class(TInterfacedObject, IController)
    private
    protected
      FDAO : IModelDAOCustom;
      constructor Create(aDAO : IModelDAOCustom);
    public
      destructor Destroy; override;
      class function New(aDAO : IModelDAOCustom) : IController;
      function DAO : IModelDAOCustom;
  end;

implementation

{ TController }

constructor TController.Create(aDAO : IModelDAOCustom);
begin
  FDAO := aDAO;
end;

function TController.DAO: IModelDAOCustom;
begin
  Result := FDAO;
end;

destructor TController.Destroy;
begin
  inherited;
end;

class function TController.New(aDAO : IModelDAOCustom): IController;
begin
  Result := Self.Create(aDAO);
end;

end.
