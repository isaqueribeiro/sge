unit SGE.Model.DAO.Entrada;

interface


uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Entrada de Produtos/Serviços
  TModelDAOEntrada = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Tipo de Entrada de Produtos/Serviços (View)
  TModelDAOTipoEntradaView = class(TModelDAO, IModelDAOCustom)
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Documento para Entrada de Produtos/Serviços (View)
  TModelDAOTipoDocumentoEntradaView = class(TModelDAO, IModelDAOCustom)
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Produtos/Serviços da Entrada
  TModelDAOEntradaProduto = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

//  // Duplicatas da Entrada
//  TModelDAOEntradaDuplicata = class(TModelDAO, IModelDAOCustom)
//    private
//      procedure SetProviderFlags;
//      procedure DataSetAfterOpen(DataSet: TDataSet);
//      procedure DataSetNewRecord(DataSet: TDataSet);
//      procedure DataSetBeforePost(DataSet: TDataSet);
//    protected
//      constructor Create;
//    public
//      destructor Destroy; override;
//      class function New : IModelDAOCustom;
//
//      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
//  end;
//
//  // Lotes de Produtos da Entrada
//  TModelDAOEntradaProdutoLote = class(TModelDAO, IModelDAOCustom)
//    private
//      procedure SetProviderFlags;
//      procedure DataSetAfterOpen(DataSet: TDataSet);
//      procedure DataSetNewRecord(DataSet: TDataSet);
//      procedure DataSetBeforePost(DataSet: TDataSet);
//    protected
//      constructor Create;
//    public
//      destructor Destroy; override;
//      class function New : IModelDAOCustom;
//
//      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
//  end;
//
implementation

uses
  System.DateUtils,
  UConstantesDGE;

{ TModelDAOEntrada }

constructor TModelDAOEntrada.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_COMPRAS_CONTROLE_' + FormatDateTime('yyyy', Date));
  FConn
    .Query
      .TableName('TBCOMPRAS')
      .AliasTableName('c')
      .KeyFields('ano;codcontrol;codemp')
      .AutoIncFields('codcontrol')
      .GeneratorName('GEN_COMPRAS_CONTROLE_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select                    ')
        .Add('    c.ano                 ')
        .Add('  , c.codcontrol          ')
        .Add('  , c.codemp              ')
        .Add('  , c.codforn             ')
        .Add('  , c.tipo_entrada        ')
        .Add('  , c.tipo_documento      ')
        .Add('  , c.tipo_movimento      ')
        .Add('  , c.nf                  ')
        .Add('  , c.nfserie             ')
        .Add('  , c.nfnsu               ')
        .Add('  , c.verificador_nfe     ')
        .Add('  , c.xml_nfe_filename    ')
        .Add('  , c.lote_nfe_ano        ')
        .Add('  , c.lote_nfe_numero     ')
        .Add('  , c.lote_nfe_recibo     ')
        .Add('  , c.dtlancamento        ')
        .Add('  , c.dtemiss             ')
        .Add('  , c.dtent               ')
        .Add('  , c.dtfinalizacao_compra')
        .Add('  , c.nfcfop              ')
        .Add('  , c.natureza            ')
        .Add('  , c.status              ')
        .Add('  , c.calcular_totais     ')
        .Add('  , c.ipi                 ')
        .Add('  , c.icmsbase            ')
        .Add('  , c.icmsvalor           ')
        .Add('  , c.icmssubstbase       ')
        .Add('  , c.icmssubstvalor      ')
        .Add('  , c.frete               ')
        .Add('  , c.outroscustos        ')
        .Add('  , c.desconto            ')
        .Add('  , c.totalnf             ')
        .Add('  , c.totalprod           ')
        .Add('  , c.obs                 ')
        .Add('  , c.usuario             ')
        .Add('  , c.formapagto_cod      ')
        .Add('  , c.condicaopagto_cod   ')
        .Add('  , c.compra_prazo        ')
        .Add('  , c.prazo_01            ')
        .Add('  , c.prazo_02            ')
        .Add('  , c.prazo_03            ')
        .Add('  , c.prazo_04            ')
        .Add('  , c.prazo_05            ')
        .Add('  , c.prazo_06            ')
        .Add('  , c.prazo_07            ')
        .Add('  , c.prazo_08            ')
        .Add('  , c.prazo_09            ')
        .Add('  , c.prazo_10            ')
        .Add('  , c.prazo_11            ')
        .Add('  , c.prazo_12            ')
        .Add('  , c.tipo_despesa        ')
        .Add('  , c.autorizacao_ano     ')
        .Add('  , c.autorizacao_codigo  ')
        .Add('  , c.autorizacao_empresa ')
        .Add('  , c.cancel_usuario      ')
        .Add('  , c.cancel_datahora     ')
        .Add('  , c.cancel_motivo       ')
        .Add('  , f.nomeforn            ')
        .Add('  , f.cnpj                ')
        .Add('  , n.cfop_descricao      ')
        .Add('  , coalesce((            ')
        .Add('      Select              ')
        .Add('        count(i.seq)      ')
        .Add('      from TBCOMPRASITENS i            ')
        .Add('      where i.ano        = c.ano       ')
        .Add('        and i.codcontrol = c.codcontrol')
        .Add('    ), 0) as qt_itens ')
        .Add('from TBCOMPRAS c      ')
        .Add('  left join TBFORNECEDOR f on (f.Codforn = c.Codforn)')
        .Add('  left join TBCFOP n on (n.Cfop_cod = c.Nfcfop)      ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOEntrada.Destroy;
begin
  inherited;
end;

class function TModelDAOEntrada.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOEntrada.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('nomeforn').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('cfop_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('qt_itens').ProviderFlags := [];
end;

procedure TModelDAOEntrada.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOEntrada.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (StrToIntDef(Trim(FieldByName('NFSERIE').AsString), 0) = 0) then
      FieldByName('NFSERIE').Clear
    else
      FieldByName('NFSERIE').AsString := FormatFloat('00', StrToIntDef(Trim(FieldByName('NFSERIE').AsString), 0));

    if (FieldByName('TIPO_DOCUMENTO').AsInteger in [TIPO_DOCUMENTO_ENTRADA_AVULSA, TIPO_DOCUMENTO_ENTRADA_CONTRATO]) then
    begin
      FieldByName('NF').AsInteger     := FieldByName('CODCONTROL').AsInteger;
      FieldByName('NFSERIE').AsString := TIPO_DOCUMENTO_SERIE_AVULSO;
    end;

    FieldByName('NF').Required      := (FieldByName('TIPO_DOCUMENTO').AsInteger in [TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL, TIPO_DOCUMENTO_ENTRADA_CUPOM, TIPO_DOCUMENTO_ENTRADA_NFE, TIPO_DOCUMENTO_ENTRADA_NFCE, TIPO_DOCUMENTO_ENTRADA_NFSE, TIPO_DOCUMENTO_ENTRADA_CTE]);
    FieldByName('NFSERIE').Required := (FieldByName('TIPO_DOCUMENTO').AsInteger in [TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL, TIPO_DOCUMENTO_ENTRADA_NFE, TIPO_DOCUMENTO_ENTRADA_NFCE]) and (TTipoMovimentoEntrada(FieldByName('TIPO_MOVIMENTO').AsInteger) = TTipoMovimentoEntrada.tmeProduto);
  end;
end;

procedure TModelDAOEntrada.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Ano').AsInteger    := YearOf(Now);
    FieldByName('DTENT').AsDateTime := Date;
    FieldByName('DTLANCAMENTO').AsDateTime := Now;
    FieldByName('CODEMP').AsString         := Usuario.Empresa.CNPJ;
    FieldByName('FORMAPAGTO_COD').AsInteger    := Configuracao.Padrao.FormaPagtoID;
    FieldByName('CONDICAOPAGTO_COD').AsInteger := Configuracao.Padrao.CondicaoPagtoID;
    FieldByName('CALCULAR_TOTAIS').AsInteger   := FLAG_NAO;

    FieldByName('CODFORN').Clear;
    FieldByName('NFCFOP').Clear;
    FieldByName('CFOP_DESCRICAO').Clear;
    FieldByName('NATUREZA').Clear;
    FieldByName('TIPO_MOVIMENTO').Clear;

    FieldByName('STATUS').AsInteger          := STATUS_CMP_ABR;
    FieldByName('COMPRA_PRAZO').AsInteger    := FLAG_NAO;
    FieldByName('ICMSBASE').AsCurrency       := 0.0;
    FieldByName('ICMSVALOR').AsCurrency      := 0.0;
    FieldByName('ICMSSUBSTBASE').AsCurrency  := 0.0;
    FieldByName('ICMSSUBSTVALOR').AsCurrency := 0.0;
    FieldByName('FRETE').AsCurrency          := 0.0;
    FieldByName('OUTROSCUSTOS').AsCurrency   := 0.0;
    FieldByName('IPI').AsCurrency            := 0.0;
    FieldByName('DESCONTO').AsCurrency       := 0.0;
    FieldByName('TOTALNF').AsCurrency        := 0.0;
    FieldByName('TOTALPROD').AsCurrency      := 0.0;
    FieldByName('USUARIO').AsString          := Usuario.Login;
    FieldByName('VERIFICADOR_NFE').Clear;
    FieldByName('XML_NFE_FILENAME').Clear;
    FieldByName('NFNSU').Clear;
    FieldByName('CODFORN').Clear;
    FieldByName('TIPO_ENTRADA').Clear;
    FieldByName('TIPO_DOCUMENTO').Clear;
    FieldByName('TIPO_DESPESA').Clear;
    FieldByName('AUTORIZACAO_ANO').Clear;
    FieldByName('AUTORIZACAO_CODIGO').Clear;
    FieldByName('AUTORIZACAO_EMPRESA').Clear;
  end;
end;

{ TModelDAOTipoEntradaView }

constructor TModelDAOTipoEntradaView.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('VW_TIPO_ENTRADA')
      .KeyFields('tpe_codigo')
      .SQL
        .Clear
        .Add('Select')
        .Add('    a.tpe_codigo    as codigo    ')
        .Add('  , a.tpe_descricao as descricao ')
        .Add('from VW_TIPO_ENTRADA a')
      .&End
    .Open;
end;

destructor TModelDAOTipoEntradaView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoEntradaView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoEntradaView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoDocumentoEntradaView }

constructor TModelDAOTipoDocumentoEntradaView.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('VW_TIPO_DOCUMENTO_ENTRADA')
      .KeyFields('tpd_codigo')
      .SQL
        .Clear
        .Add('Select')
        .Add('    d.tpd_codigo    as codigo   ')
        .Add('  , d.tpd_descricao as descricao')
        .Add('from VW_TIPO_DOCUMENTO_ENTRADA d')
      .&End
    .Open;
end;

destructor TModelDAOTipoDocumentoEntradaView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoDocumentoEntradaView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoDocumentoEntradaView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOEntradaProduto }

constructor TModelDAOEntradaProduto.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_COMPRAS_CONTROLE_' + FormatDateTime('yyyy', Date));
  FConn
    .Query
      .TableName('TBCOMPRASITENS')
      .AliasTableName('i')
      .KeyFields('ano;codcontrol;codemp;Seq')
      .SQL
        .Clear
        .Add('Select                     ')
        .Add('    i.Ano                  ')
        .Add('  , i.Codcontrol           ')
        .Add('  , i.Codemp               ')
        .Add('  , i.Seq                  ')
        .Add('  , i.Codprod              ')
        .Add('  , i.Codforn              ')
        .Add('  , i.Dtent                ')
        .Add('  , i.Qtde                 ')
        .Add('  , i.Qtdeantes            ')
        .Add('  , i.Qtdefinal            ')
        .Add('  , i.Precounit            ')
        .Add('  , i.Customedio           ')
        .Add('  , i.Nf                   ')
        .Add('  , i.Perc_participacao    ')
        .Add('  , i.Valor_frete          ')
        .Add('  , i.Valor_desconto       ')
        .Add('  , i.Valor_outros         ')
        .Add('  , i.Valor_IPI            ')
        .Add('  , i.Unid_cod             ')
        .Add('  , i.Ncm_sh               ')
        .Add('  , i.Cst                  ')
        .Add('  , i.Csosn                ')
        .Add('  , i.Cfop                 ')
        .Add('  , i.aliquota             ')
        .Add('  , i.aliquota_csosn       ')
        .Add('  , i.aliquota_pis         ')
        .Add('  , i.aliquota_cofins      ')
        .Add('  , i.percentual_reducao_bc')
        .Add('  , i.total_bruto          ')
        .Add('  , i.total_liquido        ')
        .Add('                           ')
        .Add('  , coalesce(p.descri_apresentacao, p.Descri) as Descri')
        .Add('  , p.Qtde as Estoque   ')
        .Add('  , p.estoque_aprop_lote')
        .Add('  , u.Unp_sigla         ')
        .Add('from TBCOMPRASITENS i   ')
        .Add('  inner join TBPRODUTO p on (p.Cod = i.Codprod)          ')
        .Add('  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)')
        .Add('where (i.Ano        = :Ano)')
        .Add('  and (i.Codcontrol = :Codcontrol)')
        .Add('  and (i.Codemp     = :Codemp)')
      .&End
      .ParamByName('ano', 0)
      .ParamByName('controle', 0)
      .ParamByName('empresa', EmptyStr)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAOEntradaProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOEntradaProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOEntradaProduto.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Descri').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('Estoque').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('estoque_aprop_lote').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Unp_sigla').ProviderFlags := [];
end;

procedure TModelDAOEntradaProduto.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOEntradaProduto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').Clear;
    FieldByName('CODCONTROL').Clear;
    FieldByName('CODEMP').Clear;
    FieldByName('SEQ').AsInteger := 1;
    FieldByName('DTENT').Clear;
    FieldByName('CODFORN').Clear;
    FieldByName('NF').Clear;
    FieldByName('CFOP').AsInteger       := Configuracao.Padrao.CfopID;
    FieldByName('QTDE').AsCurrency      := 0;
    FieldByName('QTDEANTES').AsCurrency := 0;
    FieldByName('QTDEFINAL').AsCurrency := 0;

    FieldByName('ALIQUOTA').AsCurrency              := 0.0;
    FieldByName('ALIQUOTA_CSOSN').AsCurrency        := 0.0;
    FieldByName('ALIQUOTA_PIS').AsCurrency          := 0.0;
    FieldByName('ALIQUOTA_COFINS').AsCurrency       := 0.0;
    FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := 0.0;
  end;
end;

end.
