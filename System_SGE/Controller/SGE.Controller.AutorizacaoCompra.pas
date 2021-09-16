unit SGE.Controller.AutorizacaoCompra;

interface

uses
  System.SysUtils,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Autorizações de Compras/Serviços
  TControllerAutorizacaoCompra = class(TController, IControllerAutorizacaoCompra)
    private
      FBusca    : IModelDAOCustom;
      FProdutos : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerAutorizacaoCompra;

      procedure CarregarProdutos;

      function Produtos : IControllerCustom;
      function ProdutosParaEntrada(aTipoItem : TTipoItem; aAno, aCodigo : Integer; aEmpresa : String) : IControllerCustom;
      function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;
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

  // Itens da Autorizações de Compras/Serviços para entrada
  TControllerItensAutorizadosParaEntrada = class(TController, IControllerCustom)
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

function TControllerAutorizacaoCompra.GetExisteNumero(aAno, aCodigo: Integer; aNumero: String;
  var aControleInterno: String): Boolean;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select')
    .SQL('    a.ano')
    .SQL('  , a.codigo')
    .SQL('  , a.numero')
    .SQL('from TBAUTORIZA_COMPRA a')
    .SQL('where a.Numero  = ' + aNumero.Trim.QuotedString)
    .SQL('  and (not (')
    .SQL('           a.ano    = ' + aAno.ToString)
    .SQL('       and a.codigo = ' + aCodigo.ToString)
    .SQL('  ))')
    .Open;

  Result := not FBusca.DataSet.IsEmpty;
  if Result then
    aControleInterno :=
      Trim(FBusca.DataSet.FieldByName('ano').AsString) + '/' +
      FormatFloat('###0000000', FBusca.DataSet.FieldByName('codigo').AsInteger);
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

function TControllerAutorizacaoCompra.ProdutosParaEntrada(aTipoItem: TTipoItem; aAno, aCodigo: Integer;
  aEmpresa: String): IControllerCustom;
begin
//  if not Assigned(FProdutos) then
//    FProdutos := TControllerAutorizacaoCompraProdutoServico.New;
//
//
//
//
//  Result := FProdutos;
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

{ TControllerItensAutorizadosParaEntrada }

constructor TControllerItensAutorizadosParaEntrada.Create;
begin
  inherited Create(TModelDAOFactory.New.ItensAutorizadosParaEntrada);
end;

destructor TControllerItensAutorizadosParaEntrada.Destroy;
begin
  inherited;
end;

class function TControllerItensAutorizadosParaEntrada.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
