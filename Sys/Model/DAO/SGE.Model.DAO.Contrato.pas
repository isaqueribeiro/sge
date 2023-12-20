unit SGE.Model.DAO.Contrato;

interface

uses
  System.SysUtils,
  System.DateUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Contratos
  TModelDAOContrato = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure NumeroGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure SituacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

  // Tipo de Constratos / Destino dos Contratos (View)
  TModelDAOTipoContratoView = class(TModelDAO, IModelDAOCustom)
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

  // Itens (Produtos/Serviços) do Contrato
  TModelDAOContratoItem = class(TModelDAO, IModelDAOCustom)
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

  // Notas (Vendas de Produtos/Serviços) do Contrato
  TModelDAOContratoNotas = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOContrato }

uses
  UConstantesDGE;

constructor TModelDAOContrato.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_CONTRATO');
  FConn
    .Query
      .TableName('TBCONTRATO')
      .AliasTableName('c')
      .KeyFields('controle')
      .AutoIncFields('controle')
      .GeneratorName('GEN_CONTRATO')
      .SQL
        .Clear
        .Add('Select ')
        .Add('    c.controle')
        .Add('  , c.empresa ')
        .Add('  , c.numero  ')
        .Add('  , c.data_emissao ')
        .Add('  , c.data_validade')
        .Add('  , c.destino    ')
        .Add('  , c.cliente    ')
        .Add('  , c.fornecedor ')
        .Add('  , c.situacao   ')
        .Add('  , c.observacoes')
        .Add('  , c.itens      ')
        .Add('  , c.quantidades')
        .Add('  , c.valor_total')
        .Add('  , c.usuario    ')
        .Add('  , c.data_cadastro   ')
        .Add('  , c.data_atualizacao')
        .Add('  , coalesce(cli.nome, frn.nomeforn) as nome')
        .Add('  , coalesce(cli.nomefant, frn.nomefant) as fantasia')
        .Add('  , coalesce(cli.cnpj, frn.cnpj) as cnpj')
        .Add('  , cli.nome as nome_cliente')
        .Add('  , cli.cnpj as cnpj_cliente')
        .Add('  , frn.nomeforn as nome_fornecedor')
        .Add('  , frn.cnpj as cnpj_fornecedor    ')
        .Add('from TBCONTRATO c')
        .Add('  left join TBCLIENTE cli on (cli.codigo = c.cliente)')
        .Add('  left join TBFORNECEDOR frn on (frn.codforn = c.fornecedor)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

procedure TModelDAOContrato.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('NUMERO').OnGetText := NumeroGetText;
  FConn.Query.DataSet.FieldByName('SITUACAO').OnGetText := SituacaoGetText;
end;

procedure TModelDAOContrato.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoCliente)) then
      FieldByName('FORNECEDOR').Clear
    else
    if (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoFornecedor)) then
      FieldByName('CLIENTE').Clear;

    FieldByName('CLIENTE').Required    := (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoCliente));
    FieldByName('FORNECEDOR').Required := (FieldByName('DESTINO').AsInteger = Ord(TTipoContrato.tpContratoFornecedor));
  end;
end;

procedure TModelDAOContrato.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('EMPRESA').AsString := Usuario.Empresa.CNPJ;
    FieldByName('USUARIO').AsString   := Usuario.Login;
    FieldByName('DATA_CADASTRO').AsDateTime := Date;
    FieldByName('DESTINO').AsInteger  := Ord(TTipoContrato.tpContratoCliente);
    FieldByName('SITUACAO').AsInteger := STATUS_CONTRATO_EDIT;

    FieldByName('NUMERO').Clear;
    FieldByName('DATA_EMISSAO').Clear;
    FieldByName('DATA_VALIDADE').Clear;
    FieldByName('CLIENTE').Clear;
    FieldByName('FORNECEDOR').Clear;
  end;
end;

destructor TModelDAOContrato.Destroy;
begin
  inherited;
end;

class function TModelDAOContrato.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOContrato.NumeroGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull and (not FConn.Query.DataSet.FieldByName('DATA_EMISSAO').IsNull) then
    Text := FormatFloat('###00000', FConn.Query.DataSet.FieldByName('CONTROLE').AsLargeInt) +
      '/' + FormatDateTime('yyyy', FConn.Query.DataSet.FieldByName('DATA_EMISSAO').AsDateTime);
end;

procedure TModelDAOContrato.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('nome').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('fantasia').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('nome_cliente').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj_cliente').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nome_fornecedor').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj_fornecedor').ProviderFlags := [];
end;

procedure TModelDAOContrato.SituacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := Sender.AsString
  else
    Case Sender.AsInteger of
      STATUS_CONTRATO_EDIT   : Text := 'Em edição';
      STATUS_CONTRATO_DISPO  : Text := 'Disponível';
      STATUS_CONTRATO_FINAL  : Text := 'Encerrado';
      STATUS_CONTRATO_CANCEL : Text := 'Cancelado';
      else
        Text := Sender.AsString;
    end;
end;

{ TModelDAOTipoContratoView }

constructor TModelDAOTipoContratoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('VW_TIPO_CONTRATO')
      .KeyFields('tpc_codigo')
      .SQL
        .Clear
        .Add('Select')
        .Add('    t.tpc_codigo    as codigo   ')
        .Add('  , t.tpc_descricao as descricao')
        .Add('  , t.tpc_resumo    as resumo')
        .Add('from VW_TIPO_CONTRATO t')
      .&End
    .Open;
end;

function TModelDAOTipoContratoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

destructor TModelDAOTipoContratoView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoContratoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

{ TModelDAOContratoItem }

constructor TModelDAOContratoItem.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCONTRATO_ITEM')
      .AliasTableName('i')
      .KeyFields('contrato;item')
      .SQL
        .Clear
        .Add('Select')
        .Add('    i.contrato')
        .Add('  , i.item    ')
        .Add('  , i.produto ')
        .Add('  , i.quantidade')
        .Add('  , i.unidade   ')
        .Add('  , i.valor     ')
        .Add('  , i.total     ')
        .Add('  , i.consumo_qtde ')
        .Add('  , i.consumo_total')
        .Add('  , i.saldo_qtde ')
        .Add('  , i.saldo_total')
        .Add('  , prd.descri   ')
        .Add('  , prd.apresentacao ')
        .Add('  , prd.descri_apresentacao')
        .Add('  , und.unp_descricao')
        .Add('  , und.unp_sigla    ')
        .Add('  , trim(coalesce(nullif(trim(und.unp_sigla), ''''), und.unp_descricao)) as unid')
        .Add('from TBCONTRATO_ITEM i')
        .Add('  left join TBPRODUTO prd on (prd.cod = i.produto)')
        .Add('  left join TBUNIDADEPROD und on (und.unp_cod = i.unidade)')
      .&End
      .Where('i.contrato = :controle')
      .ParamByName('controle', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

procedure TModelDAOContratoItem.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOContratoItem.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (Trim(FieldByName('produto').AsString) = EmptyStr) then
      FieldByName('produto').Clear;

    if (FieldByName('unidade').AsInteger = 0) then
      FieldByName('unidade').Clear;
  end;
end;

procedure TModelDAOContratoItem.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('contrato').Clear;
    FieldByName('item').Clear;
    FieldByName('produto').Clear;
    FieldByName('unidade').Clear;
    FieldByName('quantidade').AsCurrency := 0;
    FieldByName('valor').AsCurrency      := 0;
  end;
end;

destructor TModelDAOContratoItem.Destroy;
begin
  inherited;
end;

class function TModelDAOContratoItem.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOContratoItem.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  // Campos com atualização automática
  FConn.Query.DataSet.FieldByName('consumo_qtde').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('consumo_total').ProviderFlags := [];
  // Campos calculados
  FConn.Query.DataSet.FieldByName('total').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('saldo_qtde').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('saldo_total').ProviderFlags := [];
  // Campos descritivos
  FConn.Query.DataSet.FieldByName('descri').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unid').ProviderFlags := [];
end;

{ TModelDAOContratoNotas }

constructor TModelDAOContratoNotas.Create;
begin
  inherited Create;
//  FConn
//    .Query
//      .TableName('TBCONTRATO_ITEM')
//      .AliasTableName('i')
//      .KeyFields('contrato;item')
//      .SQL
//        .Clear
//        .Add('Select')
//        .Add('    i.contrato')
//        .Add('  , i.item    ')
//        .Add('  , i.produto ')
//        .Add('  , i.quantidade')
//        .Add('  , i.unidade   ')
//        .Add('  , i.valor     ')
//        .Add('  , i.total     ')
//        .Add('  , i.consumo_qtde ')
//        .Add('  , i.consumo_total')
//        .Add('  , i.saldo_qtde ')
//        .Add('  , i.saldo_total')
//        .Add('  , prd.descri   ')
//        .Add('  , prd.apresentacao ')
//        .Add('  , prd.descri_apresentacao')
//        .Add('  , und.unp_descricao')
//        .Add('  , und.unp_sigla    ')
//        .Add('  , trim(coalesce(nullif(trim(und.unp_sigla), ''''), und.unp_descricao)) as unid')
//        .Add('from TBCONTRATO_ITEM i')
//        .Add('  left join TBPRODUTO prd on (prd.cod = i.produto)')
//        .Add('  left join TBUNIDADEPROD und on (und.unp_cod = i.unidade)')
//      .&End
//      .Where('i.contrato = :contrato')
//      .ParamByName('controle', 0)
//    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

procedure TModelDAOContratoNotas.DataSetAfterOpen(DataSet: TDataSet);
begin
  ;
end;

procedure TModelDAOContratoNotas.DataSetBeforePost(DataSet: TDataSet);
begin
  ;
end;

procedure TModelDAOContratoNotas.DataSetNewRecord(DataSet: TDataSet);
begin
  ;
end;

destructor TModelDAOContratoNotas.Destroy;
begin
  inherited;
end;

class function TModelDAOContratoNotas.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOContratoNotas.SetProviderFlags;
begin
//  // Ignorar campos no Insert e Update
//  // Campos com atualização automática
//  FConn.Query.DataSet.FieldByName('consumo_qtde').ProviderFlags  := [];
//  FConn.Query.DataSet.FieldByName('consumo_total').ProviderFlags := [];
//  // Campos calculados
//  FConn.Query.DataSet.FieldByName('total').ProviderFlags       := [];
//  FConn.Query.DataSet.FieldByName('saldo_qtde').ProviderFlags  := [];
//  FConn.Query.DataSet.FieldByName('saldo_total').ProviderFlags := [];
//  // Campos descritivos
//  FConn.Query.DataSet.FieldByName('descri').ProviderFlags       := [];
//  FConn.Query.DataSet.FieldByName('apresentacao').ProviderFlags := [];
//  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
//  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
//  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags := [];
//  FConn.Query.DataSet.FieldByName('unid').ProviderFlags := [];
end;

end.
