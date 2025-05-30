unit SGI.Controller.SolicitacaoCompra;

interface

uses
  System.SysUtils,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Solicitações de Compras/Serviços
  TControllerSolicitacaoCompra = class(TController, IControllerSolicitacaoCompra)
    private
      FBusca : IModelDAOCustom;
      FProdutos : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerSolicitacaoCompra;

      procedure CarregarProdutos;

      function Produtos : IControllerCustom;
      function GetExisteNumero(aAno, aCodigo : Integer; aNumero : String; var aControleInterno : String) : Boolean;
  end;

  // Itens da Solicitações de Compras/Serviços
  TControllerSolicitacaoCompraProdutoServico = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipos de Solicitações de Compras/Serviços (View)
  TControllerTipoSolicitacaoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerSolicitacaoCompra }

constructor TControllerSolicitacaoCompra.Create;
begin
  inherited Create(TModelDAOFactory.New.SolicitacaoCompra);
end;

destructor TControllerSolicitacaoCompra.Destroy;
begin
  inherited;
end;

class function TControllerSolicitacaoCompra.New: IControllerSolicitacaoCompra;
begin
  Result := Self.Create;
end;

function TControllerSolicitacaoCompra.Produtos: IControllerCustom;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerSolicitacaoCompraProdutoServico.New;

  Result := FProdutos;
end;

procedure TControllerSolicitacaoCompra.CarregarProdutos;
begin
  try
    if not Assigned(FProdutos) then
      FProdutos := TControllerSolicitacaoCompraProdutoServico.New;

    FProdutos
      .DAO
      .Close
      .ParamsByName('ano',    FDAO.DataSet.FieldByName('ANO').AsInteger)
      .ParamsByName('codigo', FDAO.DataSet.FieldByName('CODIGO').AsInteger)
      .Open;
  except
    On E : Exception do
      raise Exception.Create(E.Message + ' (Classe: TControllerSolicitacaoCompra)');
  end;
end;

function TControllerSolicitacaoCompra.GetExisteNumero(aAno, aCodigo: Integer; aNumero: String;
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
    .SQL('from TBSOLICITACAO a')
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

{ TControllerSolicitacaoCompraProdutoServico }

constructor TControllerSolicitacaoCompraProdutoServico.Create;
begin
  inherited Create(TModelDAOFactory.New.SolicitacaoCompraProdutoServico);
end;

destructor TControllerSolicitacaoCompraProdutoServico.Destroy;
begin
  inherited;
end;

class function TControllerSolicitacaoCompraProdutoServico.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoSolicitacaoView }

constructor TControllerTipoSolicitacaoView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoSolicitacaoView);
end;

destructor TControllerTipoSolicitacaoView.Destroy;
begin
  inherited;
end;

class function TControllerTipoSolicitacaoView.New: IControllerCustom;
begin
  Result := Self.Create
end;

end.
