unit SGI.Model.DAO.CotacaoCompra;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Cotação de Compras
  TModelDAOCotacaoCompra = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
      procedure DataHoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Itens da Cotação de Compras/Serviços
  TModelDAOCotacaoCompraItens = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure SettingDisplayFields;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Fornecedores da Cotação de Compras/Serviços
  TModelDAOCotacaoCompraFornecedores = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure SettingDisplayFields;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
      procedure VendedorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Itens do Fornecedor de Compras/Serviços
  TModelDAOCotacaoCompraFornecedorItens = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure SettingDisplayFields;
      procedure DataSetAfterOpen(DataSet: TDataSet);
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

{ TModelDAOCotacaoCompra }

constructor TModelDAOCotacaoCompra.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_COTACAO_COMPRA_', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBCOTACAO_COMPRA')
      .AliasTableName('c')
      .KeyFields('ano;codigo;empresa')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_COTACAO_COMPRA_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Selec ')
        .Add('    c.ano    ')
        .Add('  , c.codigo ')
        .Add('  , c.empres ')
        .Add('  , c.numero ')
        .Add('  , c.tipo   ')
        .Add('  , c.descricao_resumo')
        .Add('  , c.nome_contato_int')
        .Add('  , c.insercao_data   ')
        .Add('  , c.emissao_data    ')
        .Add('  , c.emissao_usuario ')
        .Add('  , c.validade        ')
        .Add('  , c.competencia     ')
        .Add('  , c.movito          ')
        .Add('  , c.observacao      ')
        .Add('  , c.log_evento      ')
        .Add('  , c.status          ')
        .Add('  , c.numero_minimo_fornecedor')
        .Add('  , c.autorizada_data         ')
        .Add('  , c.autorizada_usuario      ')
        .Add('  , c.encerrada_data          ')
        .Add('  , c.encerrada_usuario       ')
        .Add('  , c.cancelado_data          ')
        .Add('  , c.cancelado_usuario       ')
        .Add('  , c.cancelado_motivo        ')
        .Add('  , c.valor_ref_total         ')
        .Add('  , c.valor_max_bruto         ')
        .Add('  , c.valor_max_desconto      ')
        .Add('  , c.valor_max_total         ')
        .Add('  , c.valor_min_bruto         ')
        .Add('  , c.valor_min_desconto      ')
        .Add('  , c.valor_min_total         ')
        .Add('  , c.valor_media_bruto       ')
        .Add('  , c.valor_media_desconto    ')
        .Add('  , c.valor_media_total       ')
        .Add('  , cast((Select count(x.seq) from TBCOTACAO_COMPRAITEM x where x.ano = c.ano and x.codigo = c.codigo and x.empresa = c.empresa) as Integer) as itens')
        .Add('from TBCOTACAO_COMPRA c')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

class function TModelDAOCotacaoCompra.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCotacaoCompra.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('itens').ProviderFlags := [];
end;

procedure TModelDAOCotacaoCompra.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    STATUS_COTACAO_EDC : Text := 'Em Edição';
    STATUS_COTACAO_ABR : Text := 'Aberta';
    STATUS_COTACAO_COT : Text := 'Em Cotação';
    STATUS_COTACAO_ENC : Text := 'Autorizada/Encerrada';
    STATUS_COTACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TModelDAOCotacaoCompra.TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_COTACAO_COMPRA  : Text := 'Compra';
      TIPO_COTACAO_SERVICO : Text := 'Serviço';
      TIPO_COTACAO_COMPRA_SERVICO : Text := 'Compra/Serviço';
    end;
end;

procedure TModelDAOCotacaoCompra.DataHoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Text := FormatDateTime('dd/mm/yyyy hh:nn', Sender.AsDateTime)
  else
    Text := Sender.AsString;
end;

procedure TModelDAOCotacaoCompra.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('TIPO').OnGetText   := TipoGetText;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
  FConn.Query.DataSet.FieldByName('INSERCAO_DATA').OnGetText := DataHoraGetText;
end;

procedure TModelDAOCotacaoCompra.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('MOVITO').AsString     := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
    FieldByName('OBSERVACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));

    if Trim(FieldByName('AUTORIZADA_USUARIO').AsString) = EmptyStr then
      FieldByName('AUTORIZADA_USUARIO').Clear;

    if Trim(FieldByName('ENCERRADA_USUARIO').AsString) = EmptyStr then
      FieldByName('ENCERRADA_USUARIO').Clear;

    if Trim(FieldByName('CANCELADO_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCELADO_USUARIO').Clear;
  end;
end;

procedure TModelDAOCotacaoCompra.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger             := FormatDateTime('yyyy', Date).ToInteger;
    FieldByName('EMPRESA').AsString          := Usuario.Empresa.CNPJ;
    FieldByName('TIPO').Value                := TIPO_COTACAO_COMPRA;
    FieldByName('INSERCAO_DATA').AsDateTime  := Now;
    FieldByName('EMISSAO_DATA').AsDateTime   := Date;
    FieldByName('EMISSAO_USUARIO').AsString  := Usuario.Login;
    FieldByName('VALIDADE').AsDateTime       := IncDay(FieldByName('EMISSAO_DATA').AsDateTime, PRAZO_VALIDADE_COTACAO_COMPRA);
    FieldByName('STATUS').AsInteger          := STATUS_COTACAO_EDC;
    FieldByName('NOME_CONTATO_INT').AsString := Usuario.Nome;

    FieldByName('NUMERO_MINIMO_FORNECEDOR').AsInteger := 3;

    FieldByName('VALOR_REF_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MAX_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MAX_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MAX_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MIN_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MIN_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MIN_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MEDIA_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MEDIA_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MEDIA_TOTAL').AsCurrency    := 0.0;

    FieldByName('DESCRICAO_RESUMO').Clear;
    FieldByName('AUTORIZADA_DATA').Clear;
    FieldByName('AUTORIZADA_USUARIO').Clear;
    FieldByName('ENCERRADA_DATA').Clear;
    FieldByName('ENCERRADA_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
  end;
end;

destructor TModelDAOCotacaoCompra.Destroy;
begin
  inherited;
end;

{ TModelDAOCotacaoCompraItens }

constructor TModelDAOCotacaoCompraItens.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCOTACAO_COMPRAITEM')
      .AliasTableName('i')
      .KeyFields('ano;codigo;empresa;seq')
      .SQL
        .Clear
        .Add('Select')
        .Add('    i.ano    ')
        .Add('  , i.codigo ')
        .Add('  , i.empresa')
        .Add('  , i.seq    ')
        .Add('  , i.produto')
        .Add('  , i.quantidade')
        .Add('  , i.unidade   ')
        .Add('  , i.valor_unitario_ref  ')
        .Add('  , i.valor_total_ref     ')
        .Add('  , i.valor_unitario_min  ')
        .Add('  , i.valor_total_min     ')
        .Add('  , i.valor_unitario_max  ')
        .Add('  , i.valor_total_max     ')
        .Add('  , i.valor_unitario_media')
        .Add('  , i.valor_total_media   ')
        .Add('  , i.usuario             ')
        .Add('  , p.descri_apresentacao ')
        .Add('  , u.unp_descricao')
        .Add('  , u.unp_sigla    ')
        .Add('  , cast(coalesce((')
        .Add('      Select       ')
        .Add('        count(r.fornecedor)')
        .Add('      from TBCOTACAO_COMPRAFORN_ITEM r')
        .Add('      where (r.ano = i.ano)           ')
        .Add('        and (r.codigo = i.codigo)     ')
        .Add('        and (r.empresa = i.empresa)   ')
        .Add('        and (r.item = i.seq)          ')
        .Add('    ), 0) as Integer) as respostas    ')
        .Add('from TBCOTACAO_COMPRAITEM i           ')
        .Add('  left join TBPRODUTO p on (p.cod = i.produto)')
        .Add('  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)')
      .&End
      .Where('i.Ano     = :ano')
      .Where('i.codigo  = :codigo')
      .Where('i.empresa = :empresa')
      .ParamByName('ano', 0)
      .ParamByName('codigo', 0)
      .ParamByName('empresa', EmptyStr)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

class function TModelDAOCotacaoCompraItens.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCotacaoCompraItens.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  SettingDisplayFields;
end;

procedure TModelDAOCotacaoCompraItens.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger := YearOf(Now);
    FieldByName('CODIGO').Clear;
    FieldByName('EMPRESA').Clear;
    FieldByName('QUANTIDADE').AsCurrency := 1;
    FieldByName('USUARIO').AsString      := Usuario.Login;
    FieldByName('VALOR_UNITARIO_REF').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_REF').AsCurrency    := 0.0;

    FieldByName('VALOR_UNITARIO_MAX').AsCurrency   := 0.0;
    FieldByName('VALOR_UNITARIO_MIN').AsCurrency   := 0.0;
    FieldByName('VALOR_UNITARIO_MEDIA').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_MAX').AsCurrency      := 0.0;
    FieldByName('VALOR_TOTAL_MIN').AsCurrency      := 0.0;
    FieldByName('VALOR_TOTAL_MEDIA').AsCurrency    := 0.0;

    FieldByName('PRODUTO').Clear;
    FieldByName('DESCRI_APRESENTACAO').Clear;
    FieldByName('UNIDADE').Clear;
    FieldByName('UNP_SIGLA').Clear;
  end;
end;

destructor TModelDAOCotacaoCompraItens.Destroy;
begin
  inherited;
end;

procedure TModelDAOCotacaoCompraItens.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('respostas').ProviderFlags := [];
end;

procedure TModelDAOCotacaoCompraItens.SettingDisplayFields;
begin
  DisplayField('SEQ', '#', '#00', TAlignment.taCenter);
  DisplayField('QUANTIDADE', 'Quantidade', ',0.###', TAlignment.taRightJustify);
  DisplayField('VALOR_UNITARIO_REF',   'Valor Ref.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL_REF',      'Total Ref.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_UNITARIO_MIN',   'Valor Min.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL_MIN',      'Total Min.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_UNITARIO_MAX',   'Valor Max.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL_MAX',      'Total Max.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_UNITARIO_MEDIA', 'Valor Med.', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL_MEDIA',    'Total Med.', ',0.00#', TAlignment.taRightJustify);
end;

{ TModelDAOCotacaoCompraFornecedores }

constructor TModelDAOCotacaoCompraFornecedores.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCOTACAO_COMPRAFORN')
      .AliasTableName('c')
      .KeyFields('ano;codigo;empresa;fornecedor')
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.ano    ')
        .Add('  , c.codigo ')
        .Add('  , c.empresa')
        .Add('  , c.fornecedor    ')
        .Add('  , c.nome_contato  ')
        .Add('  , c.email_envio   ')
        .Add('  , c.forma_pagto   ')
        .Add('  , c.condicao_pagto')
        .Add('  , c.prazo_entrega_data')
        .Add('  , c.prazo_entreda_dia ')
        .Add('  , c.observacao')
        .Add('  , c.ativo     ')
        .Add('  , c.usuario   ')
        .Add('  , c.valor_total_bruto   ')
        .Add('  , c.valor_total_desconto')
        .Add('  , c.valor_total_liquido ')
        .Add('  , c.vencedor')
        .Add('  , f.nomeforn')
        .Add('  , f.cnpj    ')
        .Add('  , f.email   ')
        .Add('  , fp.descri as forma_pagto_desc')
        .Add('  , cp.cond_descricao as condicap_pagto_desc')
        .Add('  , cast(coalesce((Select count(x.item) from TBCOTACAO_COMPRAFORN_ITEM x where x.ano = c.ano and x.codigo = c.codigo and x.empresa = c.empresa and x.fornecedor = c.fornecedor), 0) as Integer) as Itens')
        .Add('from TBCOTACAO_COMPRAFORN c')
        .Add('  left join TBFORNECEDOR f on (f.codforn = c.fornecedor)')
        .Add('  left join TBFORMPAGTO fp on (fp.cod = c.forma_pagto)  ')
        .Add('  left join VW_CONDICAOPAGTO cp on (cp.cond_cod = c.condicao_pagto)')
      .&End
      .Where('c.Ano     = :ano')
      .Where('c.codigo  = :codigo')
      .Where('c.empresa = :empresa')
      .ParamByName('ano', 0)
      .ParamByName('codigo', 0)
      .ParamByName('empresa', EmptyStr)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

class function TModelDAOCotacaoCompraFornecedores.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCotacaoCompraFornecedores.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  SettingDisplayFields;
  FConn.Query.DataSet.FieldByName('VENDEDOR').OnGetText := VendedorGetText;
end;

procedure TModelDAOCotacaoCompraFornecedores.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('EMAIL').AsString := Trim(FieldByName('EMAIL').AsString);
    FieldByName('PRAZO_ENTREDA_DIA').AsInteger := DaysBetween(FieldByName('PRAZO_ENTREGA_DATA').AsDateTime, FieldByName('DATA_RESPOSTA').AsDateTime);
    FieldByName('USUARIO').AsString := Usuario.Login;
    FieldByName('NUMERO').AsString  := FormatFloat('##0000000', FieldByName('CODIGO').AsLargeInt) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);
  end;
end;

procedure TModelDAOCotacaoCompraFornecedores.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger := YearOf(Now);
    FieldByName('CODIGO').Clear;
    FieldByName('EMPRESA').Clear;
    FieldByName('FORNECEDOR').Clear;
    FieldByName('ATIVO').AsInteger      := 1;
    FieldByName('USUARIO').AsString     := Usuario.Login;
    FieldByName('DATA_RESPOSTA').AsDateTime      := Date;
    FieldByName('PRAZO_ENTREGA_DATA').AsDateTime := IncDay(FieldByName('DATA_RESPOSTA').AsDateTime, PRAZO_VALIDADE_COTACAO_COMPRA);
    FieldByName('VENCEDOR').AsInteger   := 0;

    FieldByName('VALOR_TOTAL_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_TOTAL_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_LIQUIDO').AsCurrency  := 0.0;

    FieldByName('NOMEFORN').Clear;
    FieldByName('NOME_CONTATO').Clear;
    FieldByName('EMAIL_ENVIO').Clear;
    FieldByName('DESCRICAO_RESUMO').Clear;
    FieldByName('EMISSAO_DATA').Clear;
    FieldByName('VALIDADE').Clear;
    FieldByName('OBSERVACAO').Clear;
  end;
end;

destructor TModelDAOCotacaoCompraFornecedores.Destroy;
begin
  inherited;
end;

procedure TModelDAOCotacaoCompraFornecedores.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nomeforn').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('email').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('forma_pagto_desc').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('condicap_pagto_desc').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Itens').ProviderFlags := [];
end;

procedure TModelDAOCotacaoCompraFornecedores.SettingDisplayFields;
begin
  DisplayField('VALOR_TOTAL_BRUTO',    'Total Bruto',    ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL_DESCONTO', 'Total Desconto', ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL_LIQUIDO',  'Total Líquido',  ',0.00#', TAlignment.taRightJustify);
end;

procedure TModelDAOCotacaoCompraFornecedores.VendedorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := EmptyStr;
      1 : Text := 'X';
    end;
end;

{ TModelDAOCotacaoCompraFornecedorItens }

constructor TModelDAOCotacaoCompraFornecedorItens.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCOTACAO_COMPRAFORN_ITEM')
      .AliasTableName('i')
      .KeyFields('ano;codigo;empresa;fornecedor;item')
      .SQL
        .Clear
        .Add('Select')
        .Add('    ci.ano    ')
        .Add('  , ci.codigo ')
        .Add('  , ci.empresa')
        .Add('  , ci.seq')
        .Add('  , ci.produto   ')
        .Add('  , ci.quantidade')
        .Add('  , ci.unidade   ')
        .Add('  , p.descri_apresentacao')
        .Add('  , u.unp_descricao ')
        .Add('  , u.unp_sigla     ')
        .Add('  , i.fornecedor    ')
        .Add('  , i.item          ')
        .Add('  , i.valor_unitario')
        .Add('  , i.valor_total')
        .Add('from TBCOTACAO_COMPRAITEM ci')
        .Add('  left join TBPRODUTO p on (p.cod = ci.produto)')
        .Add('  left join TBUNIDADEPROD u on (u.unp_cod = ci.unidade)')
        .Add('  left join TBCOTACAO_COMPRAFORN_ITEM i on (i.ano = ci.ano and i.codigo = ci.codigo and i.empresa = ci.empresa and i.item = ci.seq and i.fornecedor = :fornecedor)')
      .&End
      .Where('ci.Ano     = :ano')
      .Where('ci.codigo  = :codigo')
      .Where('ci.empresa = :empresa')
      .ParamByName('ano', 0)
      .ParamByName('codigo', 0)
      .ParamByName('empresa', EmptyStr)
      .ParamByName('fornecedor', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOCotacaoCompraFornecedorItens.Destroy;
begin
  inherited;
end;

class function TModelDAOCotacaoCompraFornecedorItens.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCotacaoCompraFornecedorItens.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  SettingDisplayFields;
end;

procedure TModelDAOCotacaoCompraFornecedorItens.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('ano').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('codigo').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('empresa').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('seq').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('produto').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('quantidade').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unidade').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags := [];
end;

procedure TModelDAOCotacaoCompraFornecedorItens.SettingDisplayFields;
begin
  DisplayField('QUANTIDADE',     'Quantidade',  ',0.###', TAlignment.taRightJustify);
  DisplayField('VALOR_UNITARIO', 'Valor Un.',   ',0.00#', TAlignment.taRightJustify);
  DisplayField('VALOR_TOTAL',    'Valor Total', ',0.00#', TAlignment.taRightJustify);
end;

end.
