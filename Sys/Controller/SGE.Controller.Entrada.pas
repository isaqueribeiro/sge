unit SGE.Controller.Entrada;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Entrada de Produtos/Serviços
  TControllerEntrada = class(TController, IControllerEntrada)
    private
      FBusca : IModelDAOCustom;
      FProdutos : IControllerCustom;
      FDuplicatas : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerEntrada;

      procedure CorrigirCFOP(aCFOP : String);
      procedure CarregarProdutos;
      procedure CarregarDuplicatas;
      procedure GerarDuplicatas;

      function Busca : IModelDAOCustom;
      function DocumentoDuplicado(const aEntrada : TLancamentoEntrada; const aDocumento : TDocumentoEntrada) : Boolean;
      function Produtos : IControllerCustom;
      function Duplicatas : IControllerCustom;
  end;

  // Tipo de Entrada de Produtos/Serviços (View)
  TControllerTipoEntradaView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Documento para Entrada de Produtos/Serviços (View)
  TControllerTipoDocumentoEntradaView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Produtos/Serviços da Entrada
  TControllerEntradaProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Duplicatas da Entrada (Contas A Pagar)
  TControllerEntradaDuplicata = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerEntrada }

uses
  System.SysUtils,
  System.Classes;

procedure TControllerEntrada.CarregarDuplicatas;
begin
  if not Assigned(FDuplicatas) then
    FDuplicatas := TControllerEntradaDuplicata.New;

  FDuplicatas
    .DAO
    .Close
    .ParamsByName('AnoCompra', FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('NumCompra', FDAO.DataSet.FieldByName('CODCONTROL').AsInteger)
    .Open;
end;

procedure TControllerEntrada.CarregarProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerEntradaProduto.New;

  FProdutos
    .DAO
    .Close
    .ParamsByName('Ano',        FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('Codcontrol', FDAO.DataSet.FieldByName('CODCONTROL').AsInteger)
    .ParamsByName('Codemp',     FDAO.DataSet.FieldByName('CODEMP').AsString)
    .Open;
end;

function TControllerEntrada.Busca: IModelDAOCustom;
begin
  Result := FBusca;
end;

procedure TControllerEntrada.CorrigirCFOP(aCFOP: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCOMPRAS Set ');
    aScriptSQL.Add('    NFCFOP   = ' + aCFOP.Trim);
    aScriptSQL.Add('  , NATUREZA = ' + aCFOP.Trim.QuotedString);
    aScriptSQL.Add('where ANO        = ' + FDAO.DataSet.FieldByName('ANO').AsInteger.ToString);
    aScriptSQL.Add('  and CODCONTROL = ' + FDAO.DataSet.FieldByName('CODCONTROL').AsInteger.ToString);
    aScriptSQL.Add('  and CODEMP     = ' + QuotedStr(FDAO.DataSet.FieldByName('CODEMP').AsString));
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);

    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBCOMPRASITENS Set ');
    aScriptSQL.Add('  CFOP = ' + aCFOP.Trim);
    aScriptSQL.Add('where ANO        = ' + FDAO.DataSet.FieldByName('ANO').AsInteger.ToString);
    aScriptSQL.Add('  and CODCONTROL = ' + FDAO.DataSet.FieldByName('CODCONTROL').AsInteger.ToString);
    aScriptSQL.Add('  and CODEMP     = ' + QuotedStr(FDAO.DataSet.FieldByName('CODEMP').AsString));
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
  finally
    FDAO.CommitTransaction;
    aScriptSQL.DisposeOf;
  end;
end;

constructor TControllerEntrada.Create;
begin
  inherited Create(TModelDAOFactory.New.Entrada);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerEntrada.Destroy;
begin
  inherited;
end;

function TControllerEntrada.DocumentoDuplicado(const aEntrada: TLancamentoEntrada;
  const aDocumento: TDocumentoEntrada): Boolean;
begin
  try
    FBusca.DataSet.Close;
    FBusca
      .Clear
      .SQL('Select')
      .SQL('    c.ano')
      .SQL('  , c.codcontrol')
      .SQL('  , c.dtemiss')
      .SQL('  , t.tpd_descricao as tipo')
      .SQL('from TBCOMPRAS c')
      .SQL('  left join VW_TIPO_DOCUMENTO_ENTRADA t on (t.tpd_codigo = c.tipo_documento)')
      .Where('(c.status != ' + STATUS_CMP_CAN.ToString + ')')
      .Where('((c.ano = ' + aEntrada.Ano.ToString + ') and  (c.codcontrol <> ' + aEntrada.Controle.ToString + '))')
      .Where('((c.codforn = ' + aDocumento.Fornecedor.ToString + ') and  (c.tipo_documento = ' + aDocumento.Tipo.ToString  + ') and  (c.nf = ' + aDocumento.Numero.ToString + '))')
      .Open;
  finally
    Result := not FBusca.DataSet.IsEmpty;
  end;
end;

function TControllerEntrada.Duplicatas: IControllerCustom;
begin
  if not Assigned(FDuplicatas) then
    FDuplicatas := TControllerEntradaDuplicata.New;

  Result := FDuplicatas;
end;

procedure TControllerEntrada.GerarDuplicatas;
var
  aScriptSQL  : TStringList;
begin
  if (FDAO.DataSet.FieldByName('ANO').AsInteger > 0) and (FDAO.DataSet.FieldByName('CODCONTROL').AsInteger > 0) then
  begin
    aScriptSQL := TStringList.Create;
    try
      FDAO.UpdateGenerator('GEN_CONTAPAG_NUM_' + FDAO.DataSet.FieldByName('ANO').AsInteger.ToString
        , 'TBCONTPAG'
        , 'NUMLANC'
        , 'where ANOLANC = ' + FDAO.DataSet.FieldByName('ANO').AsInteger.ToString);

      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Execute Procedure SET_GERAR_DUPLICATAS (');
      aScriptSQL.Add('    ' + FDAO.DataSet.FieldByName('ANO').AsInteger.ToString);
      aScriptSQL.Add('  , ' + FDAO.DataSet.FieldByName('CODCONTROL').AsInteger.ToString);
      aScriptSQL.Add(')');
      aScriptSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    finally
      FDAO.CommitTransaction;
      aScriptSQL.DisposeOf;
    end;
  end;
end;

class function TControllerEntrada.New: IControllerEntrada;
begin
  Result := Self.Create;
end;

function TControllerEntrada.Produtos: IControllerCustom;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerEntradaProduto.New;

  Result := FProdutos;
end;

{ TControllerTipoEntradaView }

constructor TControllerTipoEntradaView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoEntradaView);
end;

destructor TControllerTipoEntradaView.Destroy;
begin
  inherited;
end;

class function TControllerTipoEntradaView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoDocumentoEntradaView }

constructor TControllerTipoDocumentoEntradaView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoDocumentoEntradaView);
end;

destructor TControllerTipoDocumentoEntradaView.Destroy;
begin
  inherited;
end;

class function TControllerTipoDocumentoEntradaView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerEntradaProduto }

constructor TControllerEntradaProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.EntradaProduto);
end;

destructor TControllerEntradaProduto.Destroy;
begin
  inherited;
end;

class function TControllerEntradaProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerEntradaDuplicata }

constructor TControllerEntradaDuplicata.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaAPagar);

  // Preparação para a entrada de parâmetros de pesquisa
  FDAO
    .Close
    .ClearWhere;
  FDAO
    .Where('p.AnoCompra = :AnoCompra')
    .Where('p.NumCompra = :NumCompra')
    .OrderBy('p.numlanc')
    .OrderBy('p.parcela');
end;

destructor TControllerEntradaDuplicata.Destroy;
begin
  inherited;
end;

class function TControllerEntradaDuplicata.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
