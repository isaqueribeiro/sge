unit SGI.Controller.ProdutoAlmoxarifado;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Requisições ao Almoxarifado
  TControllerProdutoAlmoxarifado = class(TController, IControllerProdutoAlmoxarifado)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerProdutoAlmoxarifado;

      function Carregar(aEmpresa : String; aCentroCusto, aCodigo : Integer;
        aRequisicaoAno : Smallint; aRequisicaoControle : Integer) : IControllerProdutoAlmoxarifado;
  end;

  // Produtos Reservados no Almoxarifado
  TControllerProdutoAlmoxarifadoReservado = class(TController, IControllerProdutoAlmoxarifadoReservado)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerProdutoAlmoxarifadoReservado;

      function Reservado(aCodigo : String) : IControllerProdutoAlmoxarifadoReservado;
      function DataSet : TDataSet;
  end;

implementation

{ TControllerProdutoAlmoxarifado }

function TControllerProdutoAlmoxarifado.Carregar(aEmpresa: String; aCentroCusto, aCodigo: Integer;
  aRequisicaoAno: Smallint; aRequisicaoControle: Integer): IControllerProdutoAlmoxarifado;
begin
  Result := Self;

  FDAO
    .Close
    .ClearWhere;

  FDAO
    .Close
    .Where('p.codigo = :produto')
    .ParamsByName('empresa',  aEmpresa)
    .ParamsByName('centro_custo', aCentroCusto)
    .ParamsByName('produto', aCodigo)
    .ParamsByName('req_ano', aRequisicaoAno)
    .ParamsByName('req_cod', aRequisicaoControle)
    .Open;
end;

constructor TControllerProdutoAlmoxarifado.Create;
begin
  inherited Create(TModelDAOFactory.New.ProdutoAlmoxarifado);
end;

destructor TControllerProdutoAlmoxarifado.Destroy;
begin
  inherited;
end;

class function TControllerProdutoAlmoxarifado.New: IControllerProdutoAlmoxarifado;
begin
  Result := Self.Create;
end;

{ TControllerProdutoAlmoxarifadoReservado }

constructor TControllerProdutoAlmoxarifadoReservado.Create;
begin
  inherited Create(TModelDAOFactory.New.ProdutoAlmoxarifadoReservado);
end;

function TControllerProdutoAlmoxarifadoReservado.DataSet: TDataSet;
begin
  Result := FDAO.DataSet;
end;

destructor TControllerProdutoAlmoxarifadoReservado.Destroy;
begin
  inherited;
end;

class function TControllerProdutoAlmoxarifadoReservado.New: IControllerProdutoAlmoxarifadoReservado;
begin
  Result := Self.Create;
end;

function TControllerProdutoAlmoxarifadoReservado.Reservado(aCodigo: String): IControllerProdutoAlmoxarifadoReservado;
begin
  Result := Self;

  FDAO
    .Close
    .ParamsByName('produto', aCodigo)
    .Open;

end;

end.
