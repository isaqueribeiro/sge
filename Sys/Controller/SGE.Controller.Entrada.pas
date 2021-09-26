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
      FCFOP  : IControllerCFOP;
      FProdutos    : IControllerCustom;
      FDuplicatas  : IControllerCustom;
      FLotes       : IControllerCustom;
      FNFE         : IControllerXML_NFeEnviada;
      FAutorizacao : IControllerAutorizacaoCompra;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerEntrada;

      procedure CorrigirCFOP(aCFOP : String);
      procedure CarregarProdutos;
      procedure CarregarLotes;
      procedure CarregarDuplicatas;
      procedure CarregarNFe;
      procedure GerarDuplicatas;
      procedure GerarTotaisNFE;
      procedure LimparLoteEmissaoNFe;

      function Busca : IModelDAOCustom;
      function DocumentoDuplicado(const aEntrada : TLancamentoEntrada; const aDocumento : TDocumentoEntrada) : Boolean;
      function Produtos : IControllerCustom;
      function Duplicatas : IControllerCustom;
      function Lotes : IControllerCustom;
      function NFe : IControllerXML_NFeEnviada;
      function CFOP : IControllerCFOP;
      function LoteProdutoPendente : Boolean;
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
  TControllerEntradaProduto = class(TController, IControllerEntradaProduto)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerEntradaProduto;

      procedure GravarLoteProduto(aSistema : Smallint);
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

  // Lotes dos Produtos da Entrada (Estoque)
  TControllerEntradaLoteProduto = class(TController, IControllerCustom)
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
  System.Classes,
  Data.DB,
  SGE.Controller.CFOP,
  SGE.Controller.XML_NFeEnviada;

procedure TControllerEntrada.CarregarDuplicatas;
begin
  if not Assigned(FDuplicatas) then
    FDuplicatas := TControllerEntradaDuplicata.New;

  FDuplicatas
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('CODCONTROL').AsInteger)
    .Open;
end;

procedure TControllerEntrada.CarregarLotes;
begin
  if not Assigned(FLotes) then
    FLotes := TControllerEntradaLoteProduto.New;

  FLotes
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('CODCONTROL').AsInteger)
    .ParamsByName('empresa',  FDAO.DataSet.FieldByName('CODEMP').AsString)
    .Open;
end;

procedure TControllerEntrada.CarregarNFe;
begin
  if not Assigned(FNFE) then
    FNFE := TControllerXML_NFeEnviada.New;

  FNFE
    .DAO
    .Close
    .ClearWhere;

  FNFE
    .DAO
    .Where('n.empresa   = :empresa')
    .Where('n.anocompra = :anocompra')
    .Where('n.numcompra = :numcompra')
    .ParamsByName('empresa',   FDAO.DataSet.FieldByName('CODEMP').AsString)
    .ParamsByName('anocompra', FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('numcompra', FDAO.DataSet.FieldByName('CODCONTROL').AsInteger)
    .Open;
end;

procedure TControllerEntrada.CarregarProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerEntradaProduto.New;

  FProdutos
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('CODCONTROL').AsInteger)
    .ParamsByName('empresa',  FDAO.DataSet.FieldByName('CODEMP').AsString)
    .Open;
end;

function TControllerEntrada.CFOP: IControllerCFOP;
begin
  if not Assigned(FCFOP) then
    FCFOP := TControllerCFOP.New;

  Result := FCFOP;
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

procedure TControllerEntrada.GerarTotaisNFE;
var
  aValorTotalIPI     ,
  aValorTotalBruto   ,
  aValorTotalDesconto,
  aValorTotalLiquido ,
  aValorBaseICMSEntrada,
  aValorICMSEntrada   ,
  aValorBaseICMSSaida ,
  aValorICMSSaida     ,
  aValorICMSSemReducao,
  aValorICMSDevido,
  aValorPIS       ,
  aValorCOFINS    : Currency;
begin
  if FDAO.DataSet.IsEmpty then
    Exit;

  try
    Self.CarregarProdutos;

    FProdutos.DAO.DataSet.First;
    FProdutos.DAO.DataSet.DisableControls;

    aValorTotalIPI        := 0.0;
    aValorTotalBruto      := 0.0;
    aValorTotalDesconto   := 0.0;
    aValorTotalLiquido    := 0.0;
    aValorBaseICMSEntrada := 0.0;
    aValorICMSEntrada     := 0.0;
    aValorBaseICMSSaida   := 0.0;
    aValorICMSSaida       := 0.0;
    aValorICMSSemReducao  := 0.0;
    aValorICMSDevido      := 0.0;
    aValorPIS    := 0.0;
    aValorCOFINS := 0.0;

    // 1. Totalizar valores

    while not FProdutos.DAO.DataSet.Eof do
    begin
      aValorTotalIPI      := aValorTotalIPI      + FProdutos.DAO.DataSet.FieldByName('VALOR_IPI').AsCurrency;
      aValorTotalBruto    := aValorTotalBruto    + FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
      aValorTotalDesconto := aValorTotalDesconto + FProdutos.DAO.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;
      aValorTotalLiquido  := aValorTotalLiquido  + FProdutos.DAO.DataSet.FieldByName('TOTAL_LIQUIDO').AsCurrency;

      if (TAliquota(FProdutos.DAO.DataSet.FieldByName('Aliquota_tipo').AsInteger) = TAliquota.taICMS) then
      begin
        // ICMS Entrada
        aValorBaseICMSEntrada  := aValorBaseICMSEntrada  + FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
        aValorICMSEntrada := aValorICMSEntrada +
          (FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
           FProdutos.DAO.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100.0);

        // ICMS Saída
        if (FProdutos.DAO.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency > 0) then
        begin
          aValorBaseICMSSaida := aValorBaseICMSSaida +
            (FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
             FProdutos.DAO.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency / 100.0);

          aValorICMSSaida := aValorICMSSaida  +
            (((FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
               FProdutos.DAO.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency / 100.0)
             ) * FProdutos.DAO.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100.0);
        end
        else
        begin
          aValorBaseICMSSaida := aValorBaseICMSSaida + FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
          aValorICMSSaida := aValorICMSSaida +
            (FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
             FProdutos.DAO.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100.0);
        end;

        // ANALISAR
        aValorICMSSemReducao := aValorICMSSemReducao +
          (FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
           FProdutos.DAO.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100.0);
        aValorICMSDevido     := aValorICMSSaida - aValorICMSSemReducao;
      end;

      aValorPIS    := aValorPIS    + ((FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency * FProdutos.DAO.DataSet.FieldByName('Aliquota_pis').AsCurrency) / 100.0);
      aValorCOFINS := aValorCOFINS + ((FProdutos.DAO.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency * FProdutos.DAO.DataSet.FieldByName('Aliquota_cofins').AsCurrency) / 100.0);

      FProdutos.DAO.DataSet.Next;
    end;

    // 2. Colocar registro em edição

    if (not (FDAO.DataSet.State in [dsEdit, dsInsert])) then
      FDAO.DataSet.Edit;

    // 3. Informar valores totalizados

    if Self.CFOP.GetDevolucao(FDAO.DataSet.FieldByName('NFCFOP').AsInteger) then
    begin
      FDAO.DataSet.FieldByName('ICMSBASE').AsCurrency  := aValorBaseICMSSaida;
      FDAO.DataSet.FieldByName('ICMSVALOR').AsCurrency := aValorICMSSaida;
    end
    else
    begin
      FDAO.DataSet.FieldByName('ICMSBASE').AsCurrency  := aValorBaseICMSEntrada;
      FDAO.DataSet.FieldByName('ICMSVALOR').AsCurrency := aValorICMSEntrada;
    end;

    FDAO.DataSet.FieldByName('ICMSSUBSTBASE').AsCurrency  := 0.0;
    FDAO.DataSet.FieldByName('ICMSSUBSTVALOR').AsCurrency := 0.0;

    FDAO.DataSet.FieldByName('VALORSEGURO').AsCurrency     := 0.0;
    FDAO.DataSet.FieldByName('VALORTOTAL_IPI').AsCurrency  := FDAO.DataSet.FieldByName('IPI').AsCurrency;
    FDAO.DataSet.FieldByName('VALORPIS').AsCurrency        := FDAO.DataSet.FieldByName('VALOR_TOTAL_PIS').AsCurrency;
    FDAO.DataSet.FieldByName('VALORCOFINS').AsCurrency     := FDAO.DataSet.FieldByName('VALOR_TOTAL_COFINS').AsCurrency;
    FDAO.DataSet.FieldByName('VALORTOTAL_II').AsCurrency   := 0.0;
    FDAO.DataSet.FieldByName('TOTALNF').AsCurrency         := aValorTotalLiquido + aValorTotalIPI;
  finally
    FProdutos.DAO.DataSet.First;
    FProdutos.DAO.DataSet.EnableControls;
  end;
end;

procedure TControllerEntrada.LimparLoteEmissaoNFe;
var
  aScriptSQL  : TStringList;
begin
  if (FDAO.DataSet.FieldByName('ANO').AsInteger > 0) and (FDAO.DataSet.FieldByName('CODCONTROL').AsInteger > 0) then
  begin
    aScriptSQL := TStringList.Create;
    try
      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Update TBCOMPRAS Set ');
      aScriptSQL.Add('    LOTE_NFE_ANO    = null');
      aScriptSQL.Add('  , LOTE_NFE_NUMERO = null');
      aScriptSQL.Add('  , LOTE_NFE_CODIGO = null');
      aScriptSQL.Add('  , LOTE_NFE_RECIBO = null');
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
end;

function TControllerEntrada.LoteProdutoPendente: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := (TTipoMovimentoEntrada(FDAO.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto);

    // Verificar a pendência na informação de lotes caso a entrada seja de produtos
    // 1. Produto movimenta estoque ?
    // 2. Estoque do produto é gerenciado por lote ?
    // 3. CFOP permite a alteração no estoque do produto ?
    if aRetorno then
    begin
      FBusca.DataSet.Close;
      FBusca
        .Clear
        .SQL('Select')
        .SQL('  count(ci.seq) as pendentes')
        .SQL('from TBCOMPRASITENS ci')
        .SQL('  inner join TBCOMPRAS cp on (cp.ano = ci.ano and cp.codcontrol = ci.codcontrol and cp.codemp = ci.codemp)')
        .SQL('  inner join TBPRODUTO pr on (pr.cod = ci.codprod and pr.estoque_aprop_lote = 1 and pr.movimenta_estoque = 1)')
        .SQL('  inner join TBCFOP cf on (cf.cfop_cod = cp.nfcfop and coalesce(cf.cfop_altera_estoque_produto, 1) = 1)')
        .Where('ci.ano        = ' + FDAO.DataSet.FieldByName('ANO').AsInteger.ToString)
        .Where('ci.codcontrol = ' + FDAO.DataSet.FieldByName('CODCONTROL').AsInteger.ToString)
        .Open;

      aRetorno := (FBusca.DataSet.FieldByName('pendentes').AsInteger > 0);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TControllerEntrada.Lotes: IControllerCustom;
begin
  if not Assigned(FLotes) then
    FLotes := TControllerEntradaLoteProduto.New;

  Result := FLotes;
end;

class function TControllerEntrada.New: IControllerEntrada;
begin
  Result := Self.Create;
end;

function TControllerEntrada.NFe: IControllerXML_NFeEnviada;
begin
  if not Assigned(FNFE) then
    FNFE := TControllerXML_NFeEnviada.New;

  Result := FNFE;
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
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerEntradaProduto.Destroy;
begin
  inherited;
end;

procedure TControllerEntradaProduto.GravarLoteProduto(aSistema : Smallint);
var
  aQtde : Currency;
  aDataFabricacao,
  aDataValidade  : String;
begin
  if (FDAO.DataSet.State = TDataSetState.dsEdit) then
    FDAO.DataSet.Post;

  FDAO.DataSet.DisableControls;
  try
    FDAO.DataSet.First;
    while not FDAO.DataSet.Eof do
    begin
      if (Trim(FDAO.DataSet.FieldByName('LOTE_DESCRICAO').AsString) <> EmptyStr) then
      begin
        aQtde := FDAO.DataSet.FieldByName('QTDE').AsCurrency * FDAO.DataSet.FieldByName('FRACIONADOR').AsCurrency;

        aDataFabricacao := 'null';
        if not FDAO.DataSet.FieldByName('LOTE_DATA_FAB').IsNull then
          aDataFabricacao  := FormatDateTime('yyyy-mm-dd', FDAO.DataSet.FieldByName('LOTE_DATA_FAB').AsDateTime).QuotedString;

        aDataValidade   := 'null';
        if not FDAO.DataSet.FieldByName('LOTE_DATA_VAL').IsNull then
          aDataValidade  := FormatDateTime('yyyy-mm-dd', FDAO.DataSet.FieldByName('LOTE_DATA_VAL').AsDateTime).QuotedString;

        FBusca.DataSet.Close;
        FBusca
          .Clear
          .SQL('Select')
          .SQL('  g.lote_id')
          .SQL('from SET_LOTE_PRODUTO (')
          .SQL('   :empresa, :centro_custo, :sistema, :produto, :lote_descricao')
          .SQL(' , ' + aDataFabricacao)
          .SQL(' , ' + aDataValidade)
          .SQL(' , :lote_qtde')
          .SQL(') g');

        FBusca
          .Close
          .ParamsByName('empresa', FDAO.DataSet.FieldByName('CODEMP').AsString)
          .ParamsByName('centro_custo', CENTRO_CUSTO_ESTOQUE_GERAL)
          .ParamsByName('sistema', aSistema)
          .ParamsByName('produto', FDAO.DataSet.FieldByName('CODPROD').AsString)
          .ParamsByName('lote_descricao', Trim(FDAO.DataSet.FieldByName('LOTE_DESCRICAO').AsString))
          .ParamsByName('lote_qtde', aQtde);

        FBusca.OpenOrExecute;

        if not FBusca.DataSet.IsEmpty then
        begin
          FDAO.DataSet.Edit;
          FDAO.DataSet.FieldByName('LOTE_ID').AsString := FBusca.DataSet.FieldByName('lote_id').AsString;
          FDAO.DataSet.Post;

          FBusca.Close;
        end;
      end;

      FDAO.DataSet.Next;
    end;

    FDAO.ApplyUpdates;
    FDAO.CommitTransaction;
  finally
    FDAO.DataSet.EnableControls;
  end;
end;

class function TControllerEntradaProduto.New: IControllerEntradaProduto;
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
    .Where('p.AnoCompra = :ano')
    .Where('p.NumCompra = :controle')
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

{ TControllerEntradaLoteProduto }

constructor TControllerEntradaLoteProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.EntradaLoteProduto);
end;

destructor TControllerEntradaLoteProduto.Destroy;
begin
  inherited;
end;

class function TControllerEntradaLoteProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
