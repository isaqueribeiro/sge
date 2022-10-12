unit SGE.Controller.Query.ContaAReceber;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.Query;

type
  TControllerQueryContaAReceber = class(TControllerQuery)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;
  end;

implementation

{ TControllerQueryContaAReceber }

uses
  SGE.Model.DAO.Query.Factory;

constructor TControllerQueryContaAReceber.Create;
begin
  inherited Create(TModelDAOQueryFactory.Instance.ContaAReceber);
end;

destructor TControllerQueryContaAReceber.Destroy;
begin
  inherited;
end;

class function TControllerQueryContaAReceber.New: IControllerQuery;
begin
  Result := Self.Create;
end;

end.
