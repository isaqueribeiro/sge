unit SGE.Controller.RequisicaoCompra;

interface

uses
  System.SysUtils,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Requisições de Compras/Serviços
  TControllerRequisicaoCompra = class(TController, IControllerRequisicaoCompra)
    private
      FBusca    : IModelDAOCustom;
      FProdutos : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerRequisicaoCompra;

      procedure CarregarProdutos;

      function Produtos : IControllerCustom;
      function ProdutosParaEntrada(aTipoItem : TTipoItem; aAno, aCodigo : Integer; aEmpresa : String) : IControllerRequisicaoCompra; virtual; abstract;
      function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;
  end;

  // Itens da Requisições de Compras/Serviços
  TControllerRequisicaoCompraProdutoServico = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipos de Requisições de Compras/Serviços (View)
  TControllerTipoRequisicaoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerRequisicaoCompra }

procedure TControllerRequisicaoCompra.CarregarProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerRequisicaoCompraProdutoServico.New;

  FProdutos
    .DAO
    .Close
    .ParamsByName('ano',     FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('codigo',  FDAO.DataSet.FieldByName('CODIGO').AsInteger)
    .ParamsByName('empresa', FDAO.DataSet.FieldByName('EMPRESA').AsString)
    .Open;
end;

constructor TControllerRequisicaoCompra.Create;
begin
  inherited Create(TModelDAOFactory.New.RequisicaoCompra);
end;

destructor TControllerRequisicaoCompra.Destroy;
begin
  inherited;
end;

function TControllerRequisicaoCompra.GetExisteNumero(aAno, aCodigo: Integer; aNumero: String;
  var aControleInterno: String): Boolean;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select')
    .SQL('    r.ano')
    .SQL('  , r.codigo')
    .SQL('  , r.numero')
    .SQL('from TBREQUISITA_COMPRA r')
    .SQL('where a.Numero  = ' + aNumero.Trim.QuotedString)
    .SQL('  and (not (')
    .SQL('           r.ano    = ' + aAno.ToString)
    .SQL('       and r.codigo = ' + aCodigo.ToString)
    .SQL('  ))')
    .Open;

  Result := not FBusca.DataSet.IsEmpty;
  if Result then
    aControleInterno :=
      Trim(FBusca.DataSet.FieldByName('ano').AsString) + '/' +
      FormatFloat('###0000000', FBusca.DataSet.FieldByName('codigo').AsInteger);
end;

class function TControllerRequisicaoCompra.New: IControllerRequisicaoCompra;
begin
  Result := Self.Create;
end;

function TControllerRequisicaoCompra.Produtos: IControllerCustom;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerRequisicaoCompraProdutoServico.New;

  Result := FProdutos;
end;

{ TControllerRequisicaoCompraProdutoServico }

constructor TControllerRequisicaoCompraProdutoServico.Create;
begin
  inherited Create(TModelDAOFactory.New.RequisicaoCompraProdutoServico);
end;

destructor TControllerRequisicaoCompraProdutoServico.Destroy;
begin
  inherited;
end;

class function TControllerRequisicaoCompraProdutoServico.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoRequisicaoView }

constructor TControllerTipoRequisicaoView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoRequisicaoView);
end;

destructor TControllerTipoRequisicaoView.Destroy;
begin
  inherited;
end;

class function TControllerTipoRequisicaoView.New: IControllerCustom;
begin
  Result := Self.Create
end;

end.
