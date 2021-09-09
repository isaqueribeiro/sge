unit SGE.Controller.AutorizacaoCompra;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Autorizações de Compras/Serviços
  TControllerAutorizacaoCompra = class(TController, IControllerAutorizacaoCompra)
    private
      FProdutos   : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerAutorizacaoCompra;

      procedure CarregarProdutos;

      function Produtos : IControllerCustom;
      function ProdutosParaEntrada(aTipoItem : TTipoItem; aAno, aCodigo : Integer; aEmpresa : String) : IControllerAutorizacaoCompra; virtual; abstract;
  end;

  // Itens da Autorizações de Compras/Serviços
  TControllerAutorizacaoCompraProdutoServico = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipos de Autorizações de Compras/Serviços (View)
  TControllerTipoAutorizacaoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerAutorizacaoCompra }

procedure TControllerAutorizacaoCompra.CarregarProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerAutorizacaoCompraProdutoServico.New;

  FProdutos
    .DAO
    .Close
    .ParamsByName('ano',     FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('codigo',  FDAO.DataSet.FieldByName('CODIGO').AsInteger)
    .ParamsByName('empresa', FDAO.DataSet.FieldByName('EMPRESA').AsString)
    .Open;
end;

constructor TControllerAutorizacaoCompra.Create;
begin
  inherited Create(TModelDAOFactory.New.AutorizacaoCompra);
end;

destructor TControllerAutorizacaoCompra.Destroy;
begin
  inherited;
end;

class function TControllerAutorizacaoCompra.New: IControllerAutorizacaoCompra;
begin
  Result := Self.Create;
end;

function TControllerAutorizacaoCompra.Produtos: IControllerCustom;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerAutorizacaoCompraProdutoServico.New;

  Result := FProdutos;
end;

{ TControllerAutorizacaoCompraProdutoServico }

constructor TControllerAutorizacaoCompraProdutoServico.Create;
begin
  inherited Create(TModelDAOFactory.New.AutorizacaoCompraProdutoServico);
end;

destructor TControllerAutorizacaoCompraProdutoServico.Destroy;
begin
  inherited;
end;

class function TControllerAutorizacaoCompraProdutoServico.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoAutorizacaoView }

constructor TControllerTipoAutorizacaoView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoAutorizacaoView);
end;

destructor TControllerTipoAutorizacaoView.Destroy;
begin
  inherited;
end;

class function TControllerTipoAutorizacaoView.New: IControllerCustom;
begin
  Result := Self.Create
end;

end.
