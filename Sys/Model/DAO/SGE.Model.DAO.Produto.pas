unit SGE.Model.DAO.Produto;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Produto/Serviço
  TModelDAOProduto = class(TModelDAO, IModelDAOCustom)
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

  // Grupo
  TModelDAOGrupoProduto = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Seção
  TModelDAOSecaoProduto = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Fabricante
  TModelDAOFabricanteProduto = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Unidade
  TModelDAOUnidadeProduto = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Origem do Produto (View)
  TModelDAOOrigemProdutoView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo do Produto
  TModelDAOTipoProduto = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Veículo
  TModelDAOTipoVeiculo = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Veículo
  TModelDAOCorVeiculo = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Tipo de Combustível do Veículo
  TModelDAOCombustivelVeiculo = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Lotes do Produto
  TModelDAOLoteProduto = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

uses
  System.StrUtils,
  System.Variants,
  UConstantesDGE,
  UFuncoes;

{ TModelDAOProduto }

constructor TModelDAOProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBPRODUTO')
      .AliasTableName('p')
      .KeyFields('Cod')
      .AutoIncFields('Codigo')
      .GeneratorName('GEN_PRODUTO_ID')
      .SQL
        .Clear
        .Add('Select                          ')
        .Add('    p.Codigo                    ')
        .Add('  , p.Cod                       ')
        .Add('  , p.Descri                    ')
        .Add('  , p.Apresentacao              ')
        .Add('  , p.Descri_apresentacao       ')
        .Add('  , p.Metafonema                ')
        .Add('  , p.Modelo                    ')
        .Add('  , p.Anvisa                    ')
        .Add('  , p.Referencia                ')
        .Add('  , p.Nome_amigo                ')
        .Add('  , p.Especificacao             ')
        .Add('  , p.Preco                     ')
        .Add('  , p.Preco_Promocao            ')
        .Add('  , p.Preco_Sugerido            ')
        .Add('  , p.Secao                     ')
        .Add('  , p.Qtde                      ')
        .Add('  , p.Unidade                   ')
        .Add('  , p.Estoqmin                  ')
        .Add('  , p.fracionador               ')
        .Add('  , p.peso_bruto                ')
        .Add('  , p.peso_liquido              ')
        .Add('  , p.altura                    ')
        .Add('  , p.largura                   ')
        .Add('  , p.espessura                 ')
        .Add('  , p.cubagem                   ')
        .Add('  , p.venda_fracionada          ')
        .Add('  , p.codunidade_fracionada     ')
        .Add('  , p.Codtipo                   ')
        .Add('  , p.Codgrupo                  ')
        .Add('  , p.Codfabricante             ')
        .Add('  , p.Customedio                ')
        .Add('  , p.Percentual_marckup        ')
        .Add('  , p.Percentual_margem         ')
        .Add('  , p.Codemp                    ')
        .Add('  , p.Codsecao                  ')
        .Add('  , p.Codorigem                 ')
        .Add('  , p.Codtributacao             ')
        .Add('  , p.Cst                       ')
        .Add('  , p.Csosn                     ')
        .Add('  , p.Cst_pis                   ')
        .Add('  , p.Cst_cofins                ')
        .Add('  , p.Tabela_IBPT               ')
        .Add('  , p.NCM_SH                    ')
        .Add('  , p.Codigo_NVE                ')
        .Add('  , p.Codcfop                   ')
        .Add('  , p.Codbarra_ean              ')
        .Add('  , p.Codunidade                ')
        .Add('  , p.Aliquota_tipo             ')
        .Add('  , p.Aliquota                  ')
        .Add('  , p.Aliquota_CSOSN            ')
        .Add('  , p.Aliquota_pis              ')
        .Add('  , p.Aliquota_cofins           ')
        .Add('  , p.Valor_ipi                 ')
        .Add('  , p.Reserva                   ')
        .Add('  , p.Produto_novo              ')
        .Add('  , p.Cor_veiculo               ')
        .Add('  , p.Combustivel_veiculo       ')
        .Add('  , p.Tipo_veiculo              ')
        .Add('  , p.Renavam_veiculo           ')
        .Add('  , p.Chassi_veiculo            ')
        .Add('  , p.Ano_modelo_veiculo        ')
        .Add('  , p.Ano_fabricacao_veiculo    ')
        .Add('  , p.Kilometragem_veiculo      ')
        .Add('  , p.Situacao_atual_veiculo    ')
        .Add('  , p.Situacao_historico_veiculo')
        .Add('  , p.Percentual_reducao_BC     ')
        .Add('  , p.Usuario                   ')
        .Add('  , p.Cadastro_ativo            ')
        .Add('  , p.Produto_imobilizado       ')
        .Add('  , p.Movimenta_estoque         ')
        .Add('  , p.Compor_faturamento        ')
        .Add('  , p.Estoque_Aprop_lote        ')
        .Add('  , p.Ultima_compra_data        ')
        .Add('  , p.Ultima_compra_valor       ')
        .Add('  , p.Ultima_compra_fornec      ')
        .Add('  , p.gerar_subproduto          ')
        .Add('  , p.produto_pai               ')
        .Add('  , case when coalesce(p.Reserva, 0) > 0                       ')
        .Add('      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)        ')
        .Add('      else coalesce(p.Qtde, 0)                                 ')
        .Add('    end as Disponivel                                          ')
        .Add('  , g.Descri as Descricao_Grupo                                ')
        .Add('  , f.Nome   as Nome_Fabricante                                ')
        .Add('  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao      ')
        .Add('  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade  ')
        .Add('  , u.Unp_sigla                                                ')
        .Add('  , uf.unp_descricao as Descricao_Unidade_frac                 ')
        .Add('  , uf.unp_sigla as unp_sigla_frac                             ')
        .Add('  , c.Cfop_descricao                                           ')
        .Add('  , c.Cfop_especificacao                                       ')
        .Add('  , cr.Descricao as descricao_cor                              ')
        .Add('  , coalesce(cb.Apelido, cb.Descricao) as descricao_combustivel')
        .Add('  , coalesce(p.Ano_fabricacao_veiculo || ''/'' || p.Ano_modelo_veiculo, '''') as modelo_fabricacao')
        .Add('  , Case when p.Customedio > 0                                                     ')
        .Add('      then ((p.Preco / p.Customedio) - 1) * 100                                    ')
        .Add('      else 100.0                                                                   ')
        .Add('    end Lucro_Calculado                                                            ')
        .Add('  , (p.Preco - p.Customedio) as Lucro_Valor                                        ')
        .Add('  , p.preco / coalesce(nullif(p.fracionador, 0), 1) as preco_frac                  ')
        .Add('  , p.preco_promocao / coalesce(nullif(p.fracionador, 0), 1) as preco_promocao_frac')
        .Add('  , p.preco_sugerido / coalesce(nullif(p.fracionador, 0), 1) as preco_sugerido_frac')
        .Add('from TBPRODUTO p                                                        ')
        .Add('  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)                       ')
        .Add('  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)                   ')
        .Add('  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)               ')
        .Add('  left join TBUNIDADEPROD uf on (uf.Unp_cod = p.codunidade_fracionada)  ')
        .Add('  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)                        ')
        .Add('  left join TBFABRICANTE f on (f.Cod = p.Codfabricante)                 ')
        .Add('  left join RENAVAM_COR cr on (cr.Codigo = p.Cor_veiculo)               ')
        .Add('  left join RENAVAM_COBUSTIVEL cb on (cb.Codigo = p.Combustivel_veiculo)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOProduto.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Disponivel').ProviderFlags        := [];
  FConn.Query.DataSet.FieldByName('Descricao_Grupo').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Nome_Fabricante').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Descricao_Secao').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Descricao_Unidade').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Unp_sigla').ProviderFlags         := [];
  FConn.Query.DataSet.FieldByName('Descricao_Unidade_frac').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla_frac').ProviderFlags         := [];
  FConn.Query.DataSet.FieldByName('Cfop_descricao').ProviderFlags         := [];
  FConn.Query.DataSet.FieldByName('Cfop_especificacao').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('descricao_cor').ProviderFlags          := [];
  FConn.Query.DataSet.FieldByName('descricao_combustivel').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('modelo_fabricacao').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Lucro_Calculado').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('Lucro_Valor').ProviderFlags         := [];
  FConn.Query.DataSet.FieldByName('preco_frac').ProviderFlags          := [];
  FConn.Query.DataSet.FieldByName('preco_promocao_frac').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('preco_sugerido_frac').ProviderFlags := [];
end;

procedure TModelDAOProduto.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOProduto.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('DESCRI_APRESENTACAO').AsString := AnsiUpperCase(Trim(FieldByName('DESCRI').AsString + ' ' + FieldByName('APRESENTACAO').AsString));
    FieldByName('METAFONEMA').AsString          := Metafonema(FieldByName('DESCRI_APRESENTACAO').AsString);
    FieldByName('USUARIO').AsString             := Usuario.Login;

    if (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taISS) then
    begin
      FieldByName('CODTIPO').AsInteger           := Ord(TTipoProduto.tpMaterialGeral);
      FieldByName('MOVIMENTA_ESTOQUE').AsInteger := 0;
    end;

    if FieldByName('CODTIPO').IsNull then
      FieldByName('CODTIPO').AsInteger := Ord(TTipoProduto.tpMaterialGeral);

    if ( (FieldByName('RESERVA').AsCurrency < 0) or (FieldByName('RESERVA').AsCurrency > FieldByName('QTDE').AsCurrency) ) then
      FieldByName('RESERVA').AsCurrency := 0;

    if ( FieldByName('PRODUTO_NOVO').IsNull ) then
      FieldByName('PRODUTO_NOVO').AsInteger := 0;

    if ( FieldByName('MOVIMENTA_ESTOQUE').IsNull ) then
      FieldByName('MOVIMENTA_ESTOQUE').AsInteger := 1;

    if ( (FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency < 0) or (FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency > 100) ) then
      FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := 0;

    FieldByName('DISPONIVEL').AsCurrency := FieldByName('QTDE').AsCurrency - FieldByName('RESERVA').AsCurrency;

    FieldByName('CST').AsString := FormatFloat('000', StrToIntDef(Trim(FieldByName('CODORIGEM').AsString) + Trim(FieldByName('CODTRIBUTACAO').AsString), 0));

    if ( FieldByName('COMPOR_FATURAMENTO').AsInteger = 0 ) then
    begin
      FieldByName('PERCENTUAL_MARGEM').AsCurrency  := 0.0;
      FieldByName('PERCENTUAL_MARCKUP').AsCurrency := 0.0;
    end
    else
    if ( FieldByName('PERCENTUAL_MARGEM').IsNull and (not FieldByName('PERCENTUAL_MARCKUP').IsNull) ) then
      FieldByName('PERCENTUAL_MARGEM').AsCurrency := FieldByName('PERCENTUAL_MARCKUP').AsCurrency;

    if Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').OldValue)) <> Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').NewValue)) then
      if (Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').OldValue)) <> EmptyStr) and (Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').NewValue)) <> EmptyStr) then
        FieldByName('SITUACAO_HISTORICO_VEICULO').AsString :=
          FormatDateTime('dd/mm/yyyy hh:mm', Now)           + ' - '  +
          Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').OldValue)) + ' -> ' +
          Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').NewValue)) + ' (' + Usuario.Login + ')' + #13 +
          Trim(FieldByName('SITUACAO_HISTORICO_VEICULO').AsString);

    if ( FieldByName('FRACIONADOR').AsCurrency <= 0 ) then
      FieldByName('FRACIONADOR').AsCurrency := 1;

    if ( Trim(FieldByName('NOME_AMIGO').AsString) = EmptyStr ) then
      FieldByName('NOME_AMIGO').AsString := Copy(Trim(Trim(FieldByName('DESCRI').AsString) + ' ' + Trim(FieldByName('APRESENTACAO').AsString)), 1, FieldByName('NOME_AMIGO').Size);

    if ( Trim(FieldByName('TIPO_VEICULO').AsString) = EmptyStr ) then
      FieldByName('TIPO_VEICULO').Clear;

    if ( Trim(FieldByName('COR_VEICULO').AsString) = EmptyStr ) then
      FieldByName('COR_VEICULO').Clear;

    if ( Trim(FieldByName('COMBUSTIVEL_VEICULO').AsString) = EmptyStr ) then
      FieldByName('COMBUSTIVEL_VEICULO').Clear;
  end;
end;

procedure TModelDAOProduto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('CODEMP').AsString         := Usuario.Empresa.CNPJ;
    FieldByName('CST').AsString            := FormatFloat('000', StrToIntDef(Trim(FieldByName('CODORIGEM').AsString) + Trim(FieldByName('CODTRIBUTACAO').AsString), 0));
    FieldByName('ESTOQMIN').AsCurrency     := 0;
    FieldByName('QTDE').AsCurrency         := 0;
    FieldByName('ESTOQMIN').AsCurrency     := 0;
    FieldByName('RESERVA').AsCurrency      := 0;
    FieldByName('CUSTOMEDIO').AsCurrency   := 0;
    FieldByName('PRECO').AsCurrency        := 0;
    FieldByName('CODTIPO').AsInteger       := Ord(TTipoProduto.tpMaterialGeral);
    FieldByName('ALIQUOTA').AsCurrency       := 0;
    FieldByName('ALIQUOTA_CSOSN').AsCurrency := 0;
    FieldByName('VALOR_IPI').AsCurrency      := 0;
    FieldByName('RESERVA').AsCurrency        := 0;
    FieldByName('PRODUTO_NOVO').AsInteger    := 0;
    FieldByName('PERCENTUAL_MARGEM').AsCurrency  := 20.0; // 20%
    FieldByName('PERCENTUAL_MARCKUP').AsCurrency := 0;
    FieldByName('PRECO_SUGERIDO').AsCurrency     := 0;
    FieldByName('GERAR_SUBPRODUTO').AsInteger    := FLAG_NAO;

    FieldByName('PESO_BRUTO').AsCurrency    := 0.0;
    FieldByName('PESO_LIQUIDO').AsCurrency  := 0.0;

    FieldByName('ALTURA').AsCurrency        := 0.0;
    FieldByName('LARGURA').AsCurrency       := 0.0;
    FieldByName('ESPESSURA').AsCurrency     := 0.0;
    FieldByName('CUBAGEM').AsCurrency       := 0.0;

    FieldByName('FRACIONADOR').AsInteger        := 1;
    FieldByName('VENDA_FRACIONADA').AsInteger   := 0;

    FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := 0;

    FieldByName('ANVISA').Clear;
    FieldByName('COR_VEICULO').Clear;
    FieldByName('COMBUSTIVEL_VEICULO').Clear;
    FieldByName('TIPO_VEICULO').Clear;
    FieldByName('RENAVAM_VEICULO').Clear;
    FieldByName('CHASSI_VEICULO').Clear;
    FieldByName('ANO_MODELO_VEICULO').Clear;
    FieldByName('ANO_FABRICACAO_VEICULO').Clear;
    FieldByName('NCM_SH').Clear;
    FieldByName('ULTIMA_COMPRA_DATA').Clear;
    FieldByName('ULTIMA_COMPRA_VALOR').Clear;
    FieldByName('ULTIMA_COMPRA_FORNEC').Clear;
    FieldByName('PRODUTO_PAI').Clear;

    FieldByName('CST_PIS').AsString      := '99';
    FieldByName('CST_COFINS').AsString   := '99';
    FieldByName('ALIQUOTA_PIS').AsCurrency       := 0.0;
    FieldByName('ALIQUOTA_COFINS').AsCurrency    := 0.0;
    FieldByName('MOVIMENTA_ESTOQUE').AsInteger   := FLAG_SIM;
    FieldByName('CADASTRO_ATIVO').AsInteger      := FLAG_SIM;
    FieldByName('PRODUTO_IMOBILIZADO').AsInteger := FLAG_NAO;
  end;
end;

{ TModelDAOGrupoProduto }

constructor TModelDAOGrupoProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBGRUPOPROD')
      .KeyFields('Cod')
      .AutoIncFields('Cod')
      .GeneratorName('GEN_GRUPOPRODUTO_COD')
      .SQL
        .Clear
        .Add('Select                   ')
        .Add('    g.Cod                ')
        .Add('  , g.Descri             ')
        .Add('  , g.perc_venda_comissao')
        .Add('from TBGRUPOPROD g ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

procedure TModelDAOGrupoProduto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
    FieldByName('perc_venda_comissao').AsCurrency := 0.0;
end;

destructor TModelDAOGrupoProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOGrupoProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOGrupoProduto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOSecaoProduto }

constructor TModelDAOSecaoProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBSECAOPROD')
      .KeyFields('Scp_cod')
      .AutoIncFields('Scp_cod')
      .GeneratorName('GEN_SECAOPRODUTO_ID')
      .SQL
        .Clear
        .Add('Select             ')
        .Add('    s.Scp_cod      ')
        .Add('  , s.Scp_descricao')
        .Add('from TBSECAOPROD s ')
      .&End
    .OpenEmpty
    .CloseEmpty;
end;

destructor TModelDAOSecaoProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOSecaoProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOSecaoProduto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOFabricanteProduto }

constructor TModelDAOFabricanteProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBFABRICANTE')
      .KeyFields('Cod')
      .AutoIncFields('Cod')
      .GeneratorName('GEN_FABRICANTE_ID')
      .SQL
        .Clear
        .Add('Select             ')
        .Add('    f.Cod          ')
        .Add('  , f.Nome         ')
        .Add('from TBFABRICANTE f')
      .&End
    .OpenEmpty
    .CloseEmpty;
end;

destructor TModelDAOFabricanteProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOFabricanteProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOFabricanteProduto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOUnidadeProduto }

constructor TModelDAOUnidadeProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBUNIDADEPROD')
      .KeyFields('Unp_cod')
      .AutoIncFields('Unp_cod')
      .GeneratorName('GEN_UNIDADEPRODUTO_ID')
      .SQL
        .Clear
        .Add('Select              ')
        .Add('    u.Unp_cod       ')
        .Add('  , u.Unp_descricao ')
        .Add('  , u.Unp_sigla     ')
        .Add('  , coalesce(nullif(trim(u.unp_sigla), ''), u.unp_descricao) as unidade ')
        .Add('from TBUNIDADEPROD u')
      .&End
    .OpenEmpty
    .CloseEmpty;
end;

destructor TModelDAOUnidadeProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOUnidadeProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOUnidadeProduto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOOrigemProdutoView }

constructor TModelDAOOrigemProdutoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select                ')
        .Add('    orp_cod           ')
        .Add('  , orp_descricao     ')
        .Add('  , orp_descricao_full')
        .Add('  , orp_sigla         ')
        .Add('from VW_ORIGEM_PRODUTO')
      .&End
    .Open;
end;

destructor TModelDAOOrigemProdutoView.Destroy;
begin
  inherited;
end;

class function TModelDAOOrigemProdutoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOOrigemProdutoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoProduto }

constructor TModelDAOTipoProduto.Create;
var
  tipoProduto : TTipoProduto;
begin
  inherited Create;
  FConn
    .Query
      .TableName('SYS_TIPO_PRODUTO')
      .KeyFields('codigo')
      .SQL
        .Clear
        .Add('Select')
        .Add('    codigo   ')
        .Add('  , descricao')
        .Add('from SYS_TIPO_PRODUTO')
      .&End
      .Open;

  // Inserir tipos de produtos padrões
  FConn.Query.DataSet.DisableControls;
  try
    for tipoProduto := Low(SYS_TIPOS_PRODUTO) to High(SYS_TIPOS_PRODUTO) do
    begin
      if (not FConn.Query.DataSet.Locate('codigo', Ord(tipoProduto), [])) then
      begin
        FConn.Query.DataSet.Append;
        FConn.Query.DataSet.FieldByName('codigo').AsInteger   := Ord(tipoProduto);
        FConn.Query.DataSet.FieldByName('descricao').AsString := SYS_TIPOS_PRODUTO[tipoProduto];
        try
          FConn.Query.DataSet.Post;
          FConn.Query.ApplyUpdates;
        except
          ;
        end;
      end;
    end;
  finally
    FConn.Query.DataSet.First;
    FConn.Query.DataSet.EnableControls;
  end;
end;

destructor TModelDAOTipoProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoProduto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOTipoVeiculo }

constructor TModelDAOTipoVeiculo.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('RENAVAM_TIPOVEICULO')
      .KeyFields('codigo')
      .SQL
        .Clear
        .Add('Select       ')
        .Add('    codigo   ')
        .Add('  , descricao')
        .Add('from RENAVAM_TIPOVEICULO')
      .&End
    .Open;
end;

destructor TModelDAOTipoVeiculo.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoVeiculo.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoVeiculo.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOCorVeiculo }

constructor TModelDAOCorVeiculo.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('RENAVAM_COR')
      .KeyFields('codigo')
      .SQL
        .Clear
        .Add('Select       ')
        .Add('    codigo   ')
        .Add('  , descricao')
        .Add('from RENAVAM_COR')
      .&End
    .Open;
end;

destructor TModelDAOCorVeiculo.Destroy;
begin
  inherited;
end;

class function TModelDAOCorVeiculo.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOCorVeiculo.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOCombustivelVeiculo }

constructor TModelDAOCombustivelVeiculo.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('RENAVAM_COBUSTIVEL')
      .KeyFields('codigo')
      .SQL
        .Clear
        .Add('Select       ')
        .Add('    codigo   ')
        .Add('  , descricao')
        .Add('  , apelido  ')
        .Add('from RENAVAM_COBUSTIVEL')
      .&End
    .Open;
end;

destructor TModelDAOCombustivelVeiculo.Destroy;
begin
  inherited;
end;

class function TModelDAOCombustivelVeiculo.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOCombustivelVeiculo.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

{ TModelDAOLoteProduto }

constructor TModelDAOLoteProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select  ')
        .Add('    e.id')
        .Add('  , e.descricao       ')
        .Add('  , e.data_fabricacao ')
        .Add('  , e.data_validade   ')
        .Add('from TBESTOQUE_ALMOX e')
        .Add('where e.empresa = :empresa')
        .Add('  and e.centro_custo = :centro_custo')
        .Add('  and e.produto = :produto')
      .&End
      .OrderBy('e.descricao')
    .Close;
end;

destructor TModelDAOLoteProduto.Destroy;
begin
  inherited;
end;

class function TModelDAOLoteProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOLoteProduto.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

end.
