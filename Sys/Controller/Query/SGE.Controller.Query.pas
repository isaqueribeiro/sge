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
    protected
      FDataIncial,
      FDataFinal : TDateTime;
      FDAO : IModelDAOQuery;
      constructor Create(aDAO : IModelDAOQuery);
      function DAO : IModelDAOQuery;
    public
      destructor Destroy; override;
      class function New(aDAO : IModelDAOQuery) : IControllerQuery;

      function DataSource(aDataSource : TDataSource) : IControllerQuery;
      function DataIncial(aValue : TDateTime) : IControllerQuery;
      function DataFinal(aValue : TDateTime) : IControllerQuery;
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

  FDataIncial := Date;
  FDataFinal  := Date;

  if (FDAO = nil) then
    raise Exception.Create('Classe TDAO da interface IModelDAOQuery não instanciada!');
end;

function TControllerQuery.DAO: IModelDAOQuery;
begin
  Result := FDAO;
end;

function TControllerQuery.DataFinal(aValue: TDateTime): IControllerQuery;
begin
  Result := Self;
  FDataFinal := aValue;
end;

function TControllerQuery.DataIncial(aValue: TDateTime): IControllerQuery;
begin
  Result := Self;
  FDataIncial := aValue;
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
  FDAO
    .DataIncial(FDataIncial)
    .DataFinal(FDataFinal)
    .Execute(aTipo, aFiltro);
end;

class function TControllerQuery.New(aDAO : IModelDAOQuery): IControllerQuery;
begin
  Result := Self.Create(aDAO);
end;

end.
