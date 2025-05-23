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
      procedure CnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

  // Itens (Produtos/Servi�os) do Contrato
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

  // Notas (Vendas de Produtos/Servi�os) do Contrato
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
  UConstantesDGE, Service.Utils;

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
        .Add('  , itm.saldo_qtde ')
        .Add('  , itm.saldo_total')
        .Add('from TBCONTRATO c')
        .Add('  left join TBCLIENTE cli on (cli.codigo = c.cliente)')
        .Add('  left join TBFORNECEDOR frn on (frn.codforn = c.fornecedor)')
        .Add('  left join (')
        .Add('    Select   ')
        .Add('        ci.contrato')
        .Add('      , sum(ci.saldo_qtde)  as saldo_qtde ')
        .Add('      , sum(ci.saldo_total) as saldo_total')
        .Add('    from TBCONTRATO_ITEM ci')
        .Add('    group by')
        .Add('        ci.contrato')
        .Add('  ) itm on (itm.contrato = c.controle)')
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
  FConn.Query.DataSet.FieldByName('empresa').OnGetText  := CnpjGetText;
  FConn.Query.DataSet.FieldByName('situacao').OnGetText := SituacaoGetText;
  FConn.Query.DataSet.FieldByName('cnpj').OnGetText := CnpjGetText;
end;

procedure TModelDAOContrato.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (Trim(FieldByName('NUMERO').AsString).IsEmpty and (not FieldByName('DATA_EMISSAO').IsNull)) then
      FieldByName('NUMERO').AsString := FormatFloat('###00000', FieldByName('CONTROLE').AsLargeInt) +
        '/' + FormatDateTime('yyyy', FieldByName('DATA_EMISSAO').AsDateTime);

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

procedure TModelDAOContrato.CnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if TServicesUtils.StrIsCNPJ(Sender.AsString) then
    Text := TServicesUtils.StrFormatarCnpj(Sender.AsString);
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
  FConn.Query.DataSet.FieldByName('saldo_qtde').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('saldo_total').ProviderFlags := [];
end;

procedure TModelDAOContrato.SituacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := Sender.AsString
  else
    Case Sender.AsInteger of
      STATUS_CONTRATO_EDIT   : Text := 'Em edi��o';
      STATUS_CONTRATO_DISPO  : Text := 'Dispon�vel';
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

    if FieldByName('consumo_qtde').IsNull then
      FieldByName('consumo_qtde').AsCurrency := FieldByName('quantidade').AsCurrency;

    if FieldByName('consumo_total').IsNull then
      FieldByName('consumo_total').AsCurrency := (FieldByName('quantidade').AsCurrency * FieldByName('valor').AsCurrency);
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
    FieldByName('consumo_qtde').AsCurrency  := 0.0;
    FieldByName('consumo_total').AsCurrency := 0.0;
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
  // Campos com atualiza��o autom�tica
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
  FConn
    .Query
      .TableName('TBVENDAS')
      .AliasTableName('vnd')
      .KeyFields('ano;codcontrol')
      .SQL
        .Clear
        .Add('Select')
        .Add('    vnd.ano')
        .Add('  , vnd.codcontrol')
        .Add('  , cast(vnd.ano || ''/'' || lpad(vnd.codcontrol, 5, ''0'') as varchar(10)) as numero')
        .Add('  , lpad(vnd.nfe, 7, ''0'') || ''-'' || lpad(trim(vnd.serie), 2, ''0'')     as nota  ')
        .Add('  , cast(vnd.dtvenda as Date) as dtvenda  ')
        .Add('  , vnd.dataemissao           as dtemissao')
        .Add('  , tmp.nr_itens')
        .Add('  , tmp.qt_itens')
        .Add('  , tmp.vl_itens')
        .Add('  , vnd.totalvenda_bruta as vl_total_bruto')
        .Add('  , coalesce(vnd.desconto, 0.0) + coalesce(vnd.desconto_cupom, 0.0) as vl_descontos')
        .Add('  , vnd.totalvenda as vl_total_liquido')
        .Add('  , coalesce(vnd.nfe_valor_total_nota, vnd.totalvenda) as vl_total_nota')
        .Add('from TBVENDAS vnd')
        .Add('  inner join (   ')
        .Add('    Select       ')
        .Add('        ivn.ano  ')
        .Add('      , ivn.codcontrol')
        .Add('      , ivn.codemp    ')
        .Add('      , count(ivn.seq) as nr_itens')
        .Add('      , sum(ivn.qtde)  as qt_itens')
        .Add('      , sum(ivn.total_liquido) as vl_itens')
        .Add('    from TVENDASITENS ivn')
        .Add('    group by   ')
        .Add('        ivn.ano')
        .Add('      , ivn.codcontrol')
        .Add('      , ivn.codemp')
        .Add('  ) tmp on (tmp.ano = vnd.ano and tmp.codcontrol = vnd.codcontrol and tmp.codemp = vnd.codemp)')
      .&End
      .Where('vnd.codcliente != ' + IntToStr(CONSUMIDOR_FINAL_CODIGO))
      .Where('vnd.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE))
      .Where('vnd.contrato = :contrato')
      .OrderBy('vnd.ano')
      .OrderBy('vnd.codcontrol')
      .OrderBy('vnd.nfe')
      .ParamByName('contrato', 0)
    .Open;

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
//  // Campos com atualiza��o autom�tica
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
