unit SGE.Controller.Query.ContaAPagar;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.Query;

type
  TControllerQueryContaAPagar = class(TControllerQuery)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;
  end;

implementation

{ TControllerQueryContaAPagar }

uses
  SGE.Model.DAO.Query.Factory;

constructor TControllerQueryContaAPagar.Create;
begin
  inherited Create(TModelDAOQueryFactory.Instance.ContaAPagar);
end;

destructor TControllerQueryContaAPagar.Destroy;
begin
  inherited;
end;

class function TControllerQueryContaAPagar.New: IControllerQuery;
begin
  Result := Self.Create;
end;

end.
