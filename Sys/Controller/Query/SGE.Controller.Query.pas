unit SGE.Controller.Query;

interface

uses
  Data.DB,
  Model.Constantes,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces;

type
  TControllerQuery = class(TInterfacedObject, IControllerQuery)
    private
      FDataSource : TDataSource;
      FDAO : IModelDAOQuery;
    protected
      constructor Create(aDAO : IModelDAOQuery);
      function DAO : IModelDAOQuery;
    public
      destructor Destroy; override;
      class function New(aDAO : IModelDAOQuery) : IControllerQuery;

      function DataSource(aDataSource : TDataSource) : IControllerQuery;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IControllerQuery; virtual;
      function DataSet : TDataSet;
  end;

implementation

uses
  System.SysUtils;

{ TControllerQuery }

constructor TControllerQuery.Create(aDAO : IModelDAOQuery);
begin
  FDAO := aDAO;
  if (FDAO = nil) then
    raise Exception.Create('Classe TDAO da interface IModelDAOQuery não instanciada!');
end;

function TControllerQuery.DAO: IModelDAOQuery;
begin
  Result := FDAO;
end;

function TControllerQuery.DataSet: TDataSet;
begin
  Result := FDAO.DataSet;
end;

function TControllerQuery.DataSource(aDataSource: TDataSource): IControllerQuery;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDataSource.DataSet := FDAO.DataSet;
end;

destructor TControllerQuery.Destroy;
begin
  inherited;
end;

function TControllerQuery.Execute(aTipo: TTipoPesquisa; aFiltro: String): IControllerQuery;
begin
  Result := Self;
  FDAO.Execute(aTipo, aFiltro);
end;

class function TControllerQuery.New(aDAO : IModelDAOQuery): IControllerQuery;
begin
  Result := Self.Create(aDAO);
end;

end.
