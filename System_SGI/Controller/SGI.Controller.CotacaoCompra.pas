unit SGI.Controller.CotacaoCompra;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,

  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,

  UConstantesDGE;

type
  // Cotações de Compras/Serviços
  TControllerCotacaoCompra = class(TController, IControllerCotacaoCompra)
    private
      FBusca : IModelDAOCustom;
      FItens ,
      FFornecedores : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCotacaoCompra;

      procedure CarregarItens;
      procedure CarregarFornecedores;

      function Itens : IControllerCustom;
      function Fornecedores : IControllerCustom;
  end;

  // Itens da Cotação de Compras/Serviços
  TControllerCotacaoCompraItens = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Fornedores da Cotação de Compras/Serviços
  TControllerCotacaoCompraFornecedores = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Fornecedor da Cotação de Compras/Serviços
  TControllerCotacaoCompraFornecedor = class(TController, IControllerCotacaoCompraFornecedor)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCotacaoCompraFornecedor;

      procedure CarregarFornecedor(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer);
      function CotacaoFornecedorItem(aAno, aCotacao : Integer; aEmpresa : String; aFornecedor : Integer) : IControllerCotacaoCompraFornecedor;
  end;

implementation

{ TControllerCotacaoCompra }

constructor TControllerCotacaoCompra.Create;
begin
  inherited Create(TModelDAOFactory.New.CotacaoCompra);
end;

destructor TControllerCotacaoCompra.Destroy;
begin
  inherited;
end;

class function TControllerCotacaoCompra.New: IControllerCotacaoCompra;
begin
  Result := Self.Create;
end;

procedure TControllerCotacaoCompra.CarregarFornecedores;
begin
  try
    if not Assigned(FFornecedores) then
      FFornecedores := TControllerCotacaoCompraFornecedores.New;

    FFornecedores
      .DAO
      .Close
      .ParamsByName('ano',     FDAO.DataSet.FieldByName('ANO').AsInteger)
      .ParamsByName('codigo',  FDAO.DataSet.FieldByName('CODIGO').AsInteger)
      .ParamsByName('empresa', FDAO.DataSet.FieldByName('EMPRESA').AsString)
      .Open;
  except
    On E : Exception do
      raise Exception.Create(E.Message + ' (Classe: TControllerCotacaoCompra)');
  end;
end;

procedure TControllerCotacaoCompra.CarregarItens;
begin
  try
    if not Assigned(FItens) then
      FItens := TControllerCotacaoCompraItens.New;

    FItens
      .DAO
      .Close
      .ParamsByName('ano',     FDAO.DataSet.FieldByName('ANO').AsInteger)
      .ParamsByName('codigo',  FDAO.DataSet.FieldByName('CODIGO').AsInteger)
      .ParamsByName('empresa', FDAO.DataSet.FieldByName('EMPRESA').AsString)
      .Open;
  except
    On E : Exception do
      raise Exception.Create(E.Message + ' (Classe: TControllerCotacaoCompra)');
  end;
end;

function TControllerCotacaoCompra.Fornecedores: IControllerCustom;
begin
  if not Assigned(FFornecedores) then
    FFornecedores := TControllerCotacaoCompraFornecedores.New;

  Result := FFornecedores;
end;

function TControllerCotacaoCompra.Itens: IControllerCustom;
begin
  if not Assigned(FItens) then
    FItens := TControllerCotacaoCompraItens.New;

  Result := FItens;
end;

{ TControllerCotacaoCompraItens }

constructor TControllerCotacaoCompraItens.Create;
begin
  inherited Create(TModelDAOFactory.New.CotacaoCompraItens);
end;

destructor TControllerCotacaoCompraItens.Destroy;
begin
  inherited;
end;

class function TControllerCotacaoCompraItens.New: IControllerCustom;
begin
  Result := Self.Create
end;

{ TControllerCotacaoCompraFornecedores }

constructor TControllerCotacaoCompraFornecedores.Create;
begin
  inherited Create(TModelDAOFactory.New.CotacaoCompraFornecedores);
end;

destructor TControllerCotacaoCompraFornecedores.Destroy;
begin
  inherited;
end;

class function TControllerCotacaoCompraFornecedores.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCotacaoCompraFornecedor }

constructor TControllerCotacaoCompraFornecedor.Create;
begin
  inherited Create(TModelDAOFactory.New.CotacaoCompraFornecedores);
end;

destructor TControllerCotacaoCompraFornecedor.Destroy;
begin
  inherited;
end;

class function TControllerCotacaoCompraFornecedor.New: IControllerCotacaoCompraFornecedor;
begin
  Result := Self.Create;
end;

function TControllerCotacaoCompraFornecedor.CotacaoFornecedorItem(aAno, aCotacao: Integer; aEmpresa: String;
  aFornecedor: Integer): IControllerCotacaoCompraFornecedor;
var
  aScriptSQL : TStringList;
begin
  Result := Self;

  aScriptSQL := TStringList.Create;
  try
    try
      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Execute Procedure SET_COTACAO_COMPRAFORN_ITEM (');
      aScriptSQL.Add('    ' + aAno.ToString);
      aScriptSQL.Add('  , ' + aCotacao.ToString);
      aScriptSQL.Add('  , ' + aEmpresa.Trim.QuotedString);
      aScriptSQL.Add('  , ' + aFornecedor.ToString);
      aScriptSQL.Add(')');
      aScriptSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    except
      On E : Exception do
        raise Exception.Create('Erro ao tentar atualizar os itens de resposta do fornecedor.' + #13#13 + E.Message);
    end;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerCotacaoCompraFornecedor.CarregarFornecedor(aAno, aCotacao: Integer; aEmpresa: String;
  aFornecedor: Integer);
begin
  try
    FDAO
      .Close
      .ClearWhere;

    FDAO
      .Where('c.Ano = :ano')
      .Where('c.codigo = :codigo')
      .Where('c.empresa = :empresa')
      .Where('c.fornecedor = :fornecedor')
      .ParamsByName('ano', aAno)
      .ParamsByName('codigo', aCotacao)
      .ParamsByName('empresa', aEmpresa)
      .ParamsByName('fornecedor', aFornecedor)
      .Open;
  except
    On E : Exception do
      raise Exception.Create(E.Message + ' (Classe: TControllerCotacaoCompraFornecedor)');
  end;
end;

end.
