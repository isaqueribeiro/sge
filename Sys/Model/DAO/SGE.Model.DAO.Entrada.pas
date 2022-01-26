unit SGE.Model.DAO.Entrada;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Entrada de Produtos/Servi�os
  TModelDAOEntrada = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure AutorizacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

  // Devolu��o de Produtos/Servi�os atrav�s da Entrada
  TModelDAOEntradaDevolucao = class(TModelDAO, IModelDAOCustom)
    private
      procedure ControleGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure EntradaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure SaidaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Tipo de Entrada de Produtos/Servi�os (View)
  TModelDAOTipoEntradaView = class(TModelDAO, IModelDAOCustom)
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Documento para Entrada de Produtos/Servi�os (View)
  TModelDAOTipoDocumentoEntradaView = class(TModelDAO, IModelDAOCustom)
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Produtos/Servi�os da Entrada
  TModelDAOEntradaProduto = class(TModelDAO, IModelDAOCustom)
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

  // Lotes de Produtos da Entrada
  TModelDAOEntradaProdutoLote = class(TModelDAO, IModelDAOCustom)
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

implementation

uses
  System.DateUtils,
  UConstantesDGE;

{ TModelDAOEntrada }

constructor TModelDAOEntrada.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_COMPRAS_CONTROLE', FormatDateTime('yyyy', Date).ToInteger);
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
        .Add('  , c.nfe_denegada        ')
        .Add('  , c.nfe_denegada_motivo ')
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
        .Add('  , coalesce(tmp.qt_itens, 0) as qt_itens')
        .Add('  , coalesce(tmp.valor_total_IPI, 0)      as valor_total_IPI     ')
        .Add('  , coalesce(tmp.valor_total_bruto, 0)    as valor_total_bruto   ')
        .Add('  , coalesce(tmp.valor_total_desconto, 0) as valor_total_desconto')
        .Add('  , coalesce(tmp.valor_total_liquido, 0)  as valor_total_liquido ')
        .Add('  , coalesce(tmp.valor_base_icms_normal_entrada, 0)  as valor_base_icms_normal_entrada ')
        .Add('  , coalesce(tmp.valor_total_icms_normal_entrada, 0) as valor_total_icms_normal_entrada')
        .Add('  , coalesce(tmp.valor_base_icms_normal_saida, 0)    as valor_base_icms_normal_saida   ')
        .Add('  , coalesce(tmp.valor_total_icms_normal_saida, 0)   as valor_total_icms_normal_saida  ')
        .Add('  , coalesce(tmp.valor_total_icms_normal_devido, 0)  as valor_total_icms_normal_devido ')
        .Add('  , coalesce(tmp.valor_total_PIS, 0)    as valor_total_PIS   ')
        .Add('  , coalesce(tmp.valor_total_COFINS, 0) as valor_total_COFINS')
        .Add('from TBCOMPRAS c      ')
        .Add('  left join TBFORNECEDOR f on (f.Codforn = c.Codforn)')
        .Add('  left join TBCFOP n on (n.Cfop_cod = c.Nfcfop)      ')
        .Add('  left join (       ')
        .Add('    Select          ')
        .Add('        i.ano       ')
        .Add('      , i.codcontrol')
        .Add('      , i.codemp    ')
        .Add('      , count(i.seq) as qt_itens ')
        .Add('      , sum( coalesce(i.Qtde, 0) * coalesce(i.Valor_ipi, 0) ) as valor_total_IPI')
        .Add('      , sum( coalesce(i.Qtde, 0) * i.precounit )  as valor_total_bruto          ')
        .Add('      , sum( coalesce(i.valor_desconto, 0) )      as valor_total_desconto       ')
        .Add('      , sum( coalesce(i.Qtde, 0) * i.customedio ) as valor_total_liquido        ')
        .Add('                                                                                ')
        .Add('      , sum( case when coalesce(p.Aliquota, 0) = 0 then 0 else coalesce(i.Qtde, 0) * i.Customedio end ) as valor_base_icms_normal_entrada ')
        .Add('      , sum( coalesce(i.Qtde, 0) * i.Customedio * coalesce(p.Aliquota, 0) / 100 )                       as valor_total_icms_normal_entrada')
        .Add('                                                                                                                                          ')
        .Add('      , sum( case when coalesce(i.Aliquota, 0) = 0 then 0 else coalesce(i.Qtde, 0) * (case when coalesce(i.Percentual_reducao_bc, 0) = 0 then i.Customedio else (i.Customedio * i.Percentual_reducao_bc / 100) end) end ) as valor_base_icms_normal_saida ')
        .Add('      , sum( coalesce(i.Qtde, 0) * (case when coalesce(i.Percentual_reducao_bc, 0) = 0 then i.Customedio else (i.Customedio * i.Percentual_reducao_bc / 100) end) * coalesce(i.Aliquota, 0) / 100 )                       as valor_total_icms_normal_saida')
        .Add('                                                                                                                                                                                                     ')
        .Add('      , sum( coalesce(i.Qtde, 0) * (case when coalesce(i.Percentual_reducao_bc, 0) = 0 then i.Customedio else (i.Customedio * i.Percentual_reducao_bc / 100) end) * coalesce(i.Aliquota, 0) / 100 ) -')
        .Add('        sum( coalesce(i.Qtde, 0) * p.Customedio * coalesce(p.Aliquota, 0) / 100 ) as valor_total_icms_normal_devido                                                                                  ')
        .Add('                                                                                                                ')
        .Add('      , sum( (coalesce(i.Qtde, 0) * i.customedio) * coalesce(i.Aliquota_pis, 0) / 100 )    as valor_total_PIS   ')
        .Add('      , sum( (coalesce(i.Qtde, 0) * i.customedio) * coalesce(i.Aliquota_cofins, 0) / 100 ) as valor_total_COFINS')
        .Add('    from TBCOMPRASITENS i                          ')
        .Add('      inner join TBPRODUTO p on (p.Cod = i.codprod)')
        .Add('    group by        ')
        .Add('        i.ano       ')
        .Add('      , i.codcontrol')
        .Add('      , i.codemp    ')
        .Add('  ) tmp on (tmp.ano = c.ano and tmp.codcontrol = c.codcontrol and tmp.codemp = c.codemp)')
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
  FConn.Query.DataSet.FieldByName('qt_itens').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('valor_total_IPI').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('valor_total_bruto').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('valor_total_desconto').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('valor_total_liquido').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('valor_base_icms_normal_entrada').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('valor_total_icms_normal_entrada').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('valor_base_icms_normal_saida').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('valor_total_icms_normal_saida').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('valor_total_icms_normal_devido').ProviderFlags  := [];
end;

procedure TModelDAOEntrada.AutorizacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('###0000000"/"', Sender.AsInteger) + Copy(FConn.Query.DataSet.FieldByName('AUTORIZACAO_ANO').AsString, 3, 2);
end;

procedure TModelDAOEntrada.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_CMP_ABR : Text := 'Aberta';
    STATUS_CMP_FIN : Text := 'Finalizada';
    STATUS_CMP_CAN : Text := 'Cancelada';
    STATUS_CMP_NFE : Text := 'NF-e Emitida';
    else
      Text := Sender.AsString;
  end;
end;

procedure TModelDAOEntrada.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('AUTORIZACAO_CODIGO').OnGetText := AutorizacaoGetText;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
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

{ TModelDAOEntradaDevolucao }

constructor TModelDAOEntradaDevolucao.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_COMPRAS_CONTROLE', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBCOMPRAS')
      .AliasTableName('c')
      .KeyFields('ano;codcontrol;codemp')
      .SQL
        .Clear
        .Add('Select                ')
        .Add('    c.ano             ')
        .Add('  , c.codcontrol      ')
        .Add('  , c.codemp          ')
        .Add('  , c.dnfe_entrada_ano')
        .Add('  , c.dnfe_entrada_cod')
        .Add('  , c.dnfe_saida_ano  ')
        .Add('  , c.dnfe_saida_cod  ')
        .Add('  , c.dnfe_forma      ')
        .Add('  , c.dnfe_chave      ')
        .Add('  , c.dnfe_uf         ')
        .Add('  , c.dnfe_cnpj_cpf   ')
        .Add('  , c.dnfe_ie         ')
        .Add('  , c.dnfe_competencia')
        .Add('  , c.dnfe_serie      ')
        .Add('  , c.dnfe_numero     ')
        .Add('  , c.dnfe_modelo     ')
        .Add('  , c.decf_modelo     ')
        .Add('  , c.decf_numero     ')
        .Add('  , c.decf_coo        ')
        .Add('from TBCOMPRAS c      ')
        .Add('where (c.ano        = :ano)')
        .Add('  and (c.codcontrol = :controle)')
        .Add('  and (c.codemp     = :empresa)')
      .&End
    .ParamByName('ano', 0)
    .ParamByName('controle', 0)
    .ParamByName('empresa', EmptyStr)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOEntradaDevolucao.Destroy;
begin
  inherited;
end;

class function TModelDAOEntradaDevolucao.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOEntradaDevolucao.ControleGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := Sender.DataSet.FieldByName('ano').AsString + '/' + FormatFloat('0000000', Sender.AsInteger);
end;

procedure TModelDAOEntradaDevolucao.EntradaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := Sender.DataSet.FieldByName('dnfe_entrada_ano').AsString + '/' +
      FormatFloat('0000000', Sender.AsInteger);
end;

procedure TModelDAOEntradaDevolucao.SaidaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := Sender.DataSet.FieldByName('dnfe_saida_ano').AsString + '/' +
      FormatFloat('0000000', Sender.AsInteger);
end;

procedure TModelDAOEntradaDevolucao.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('codcontrol').OnGetText       := ControleGetText;
  FConn.Query.DataSet.FieldByName('dnfe_entrada_cod').OnGetText := EntradaGetText;
  FConn.Query.DataSet.FieldByName('dnfe_saida_cod').OnGetText   := SaidaGetText;
end;

procedure TModelDAOEntradaDevolucao.DataSetBeforePost(DataSet: TDataSet);
begin
  ;
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
        // Lote do Produto
        .Add('  , i.lote_id             ')
        .Add('  , i.lote_descricao      ')
        .Add('  , i.lote_data_fab       ')
        .Add('  , i.lote_data_val       ')
        // Dados do Produto
        .Add('  , coalesce(p.descri_apresentacao, p.Descri) as Descri')
        .Add('  , p.descri_apresentacao')
        .Add('  , p.Qtde as Estoque   ')
        .Add('  , p.estoque_aprop_lote')
        .Add('  , p.fracionador       ')
        .Add('  , u.Unp_sigla         ')
        .Add('from TBCOMPRASITENS i   ')
        .Add('  inner join TBPRODUTO p on (p.Cod = i.Codprod)          ')
        .Add('  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)')
      .&End
      .Where('i.Ano        = :ano')
      .Where('i.Codcontrol = :controle')
      .Where('i.Codemp     = :empresa')
      .ParamByName('ano', 0)
      .ParamByName('controle', 0)
      .ParamByName('empresa', EmptyStr)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
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
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Estoque').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('estoque_aprop_lote').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('fracionador').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Unp_sigla').ProviderFlags   := [];
end;

procedure TModelDAOEntradaProduto.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOEntradaProduto.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if Trim(FieldByName('lote_id').AsString) = EmptyStr then
      FieldByName('lote_id').Clear;

    if Trim(FieldByName('lote_descricao').AsString) = EmptyStr then
      FieldByName('lote_descricao').Clear
    else
      FieldByName('lote_descricao').AsString := Trim(FieldByName('lote_descricao').AsString);

    if FormatDateTime('dd/mm/yyyy',  FieldByName('lote_data_fab').AsDateTime) = SYS_EMPTY_DATE then
      FieldByName('lote_data_fab').Clear;

    if FormatDateTime('dd/mm/yyyy',  FieldByName('lote_data_val').AsDateTime) = SYS_EMPTY_DATE then
      FieldByName('lote_data_val').Clear;

    if (FieldByName('LOTE_DESCRICAO').IsNull and FieldByName('LOTE_DATA_FAB').IsNull and FieldByName('LOTE_DATA_VAL').IsNull) then
      FieldByName('LOTE_ID').Clear;
  end;
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

    FieldByName('lote_id').Clear;
    FieldByName('lote_descricao').Clear;
    FieldByName('lote_data_fab').Clear;
    FieldByName('lote_data_val').Clear;

    FieldByName('ALIQUOTA').AsCurrency              := 0.0;
    FieldByName('ALIQUOTA_CSOSN').AsCurrency        := 0.0;
    FieldByName('ALIQUOTA_PIS').AsCurrency          := 0.0;
    FieldByName('ALIQUOTA_COFINS').AsCurrency       := 0.0;
    FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := 0.0;
  end;
end;

{ TModelDAOEntradaProdutoLote }

constructor TModelDAOEntradaProdutoLote.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCOMPRASITENS')
      .AliasTableName('ci')
      .KeyFields('ano;codcontrol;codemp;Seq')
      .SQL
        .Clear
        .Add('Select            ')
        .Add('     ci.ano       ')
        .Add('   , ci.codcontrol')
        .Add('   , ci.codemp    ')
        .Add('   , ci.seq       ')
        .Add('   , ci.codprod   ')
        .Add('   , pr.descri    ')
        .Add('   , pr.apresentacao       ')
        .Add('   , pr.descri_apresentacao')
        .Add('   , pr.referencia         ')
        .Add('   , ci.lote_id            ')
        .Add('   , ci.lote_descricao     ')
        .Add('   , ci.lote_data_fab      ')
        .Add('   , ci.lote_data_val      ')
        .Add('   , ci.qtde               ')
        .Add('from TBCOMPRASITENS ci     ')
        .Add('  inner join TBCOMPRAS cp on (cp.ano = ci.ano and cp.codcontrol = ci.codcontrol and cp.codemp = ci.codemp)')
        .Add('  inner join TBPRODUTO pr on (pr.cod = ci.codprod)')
        .Add('  left join TBCFOP cf on (cf.cfop_cod = cp.nfcfop)')
      .&End
      .Where('ci.ano        = :ano     ')
      .Where('ci.codcontrol = :controle')
      .Where('ci.Codemp     = :empresa ')
      .Where('ci.lote_id is not null ')

//      // Estes filtros ser�o usados no processo de confirma��o dos lotes
//      // ===============================================================
//      .Where('pr.estoque_aprop_lote = 1')
//      .Where('pr.movimenta_estoque  = 1')
//      .Where('coalesce(cf.cfop_altera_estoque_produto, 1) = 1')

      .OrderBy('ci.seq')
      .ParamByName('ano', 0)
      .ParamByName('controle', 0)
      .ParamByName('empresa', EmptyStr)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOEntradaProdutoLote.Destroy;
begin
  inherited;
end;

class function TModelDAOEntradaProdutoLote.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOEntradaProdutoLote.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('descri').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('referencia').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('qtde').ProviderFlags := [];
end;

procedure TModelDAOEntradaProdutoLote.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOEntradaProdutoLote.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('LOTE_DESCRICAO').AsString := Trim(FieldByName('LOTE_DESCRICAO').AsString);

    if (Trim(FieldByName('LOTE_DESCRICAO').AsString) = EmptyStr) then
      FieldByName('LOTE_DESCRICAO').Clear;

    if (FieldByName('LOTE_DATA_FAB').AsDateTime = StrToDate(SYS_EMPTY_DATE)) then
      FieldByName('LOTE_DATA_FAB').Clear;

    if (FieldByName('LOTE_DATA_VAL').AsDateTime = StrToDate(SYS_EMPTY_DATE)) then
      FieldByName('LOTE_DATA_VAL').Clear;

    if (FieldByName('LOTE_DESCRICAO').IsNull and FieldByName('LOTE_DATA_FAB').IsNull and FieldByName('LOTE_DATA_VAL').IsNull) then
      FieldByName('LOTE_ID').Clear;
  end;
end;

procedure TModelDAOEntradaProdutoLote.DataSetNewRecord(DataSet: TDataSet);
begin
  raise Exception.Create('N�o � permitida inser��o de registros atrav�s desta classe');
end;

end.
