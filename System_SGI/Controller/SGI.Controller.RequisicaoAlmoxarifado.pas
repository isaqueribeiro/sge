unit SGI.Controller.RequisicaoAlmoxarifado;

interface

uses
  System.SysUtils,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Requisições ao Almoxarifado
  TControllerRequisicaoAlmoxarifado = class(TController, IControllerRequisicaoAlmoxarifado)
    private
      FBusca    : IModelDAOCustom;
      FProdutos : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerRequisicaoAlmoxarifado;

      procedure CarregarProdutos;

      function Produtos : IControllerCustom;
  end;

  // Itens da Requisições ao Almoxarifado
  TControllerRequisicaoAlmoxarifadoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipos ao Requisições ao Almoxarifado (View)
  TControllerTipoRequisicaoAlmoxView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerRequisicaoAlmoxarifado }

procedure TControllerRequisicaoAlmoxarifado.CarregarProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerRequisicaoAlmoxarifadoProduto.New;

  FProdutos
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('CONTROLE').AsInteger)
    .ParamsByName('empresa',  FDAO.DataSet.FieldByName('EMPRESA').AsString)
    .ParamsByName('centro_custo', FDAO.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger)
    .ParamsByName('requisicao_ano', FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('requisicao_cod', FDAO.DataSet.FieldByName('CONTROLE').AsInteger)
    .Open;
end;

constructor TControllerRequisicaoAlmoxarifado.Create;
begin
  inherited Create(TModelDAOFactory.New.AutorizacaoCompra);
end;

destructor TControllerRequisicaoAlmoxarifado.Destroy;
begin
  inherited;
end;

class function TControllerRequisicaoAlmoxarifado.New: IControllerRequisicaoAlmoxarifado;
begin
  Result := Self.Create;
end;

function TControllerRequisicaoAlmoxarifado.Produtos: IControllerCustom;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerRequisicaoAlmoxarifadoProduto.New;

  Result := FProdutos;
end;

{ TControllerRequisicaoAlmoxarifadoProduto }

constructor TControllerRequisicaoAlmoxarifadoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.AutorizacaoCompraProdutoServico);
end;

destructor TControllerRequisicaoAlmoxarifadoProduto.Destroy;
begin
  inherited;
end;

class function TControllerRequisicaoAlmoxarifadoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoRequisicaoAlmoxView }

constructor TControllerTipoRequisicaoAlmoxView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoRequisicaoAlmoxView);
end;

destructor TControllerTipoRequisicaoAlmoxView.Destroy;
begin
  inherited;
end;

class function TControllerTipoRequisicaoAlmoxView.New: IControllerCustom;
begin
  Result := Self.Create
end;

end.
