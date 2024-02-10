unit SGE.Model.DAO.Caixa;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Caixa (Table)
  TModelDAOCaixa = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
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

  // Movimentações do Caixa (Table)
  TModelDAOCaixaMovimento = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
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

implementation

uses
  System.DateUtils,
  UConstantesDGE;

{ TModelDAOCaixa }

constructor TModelDAOCaixa.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_CAIXA_', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBCAIXA')
      .AliasTableName('c')
      .KeyFields('Ano;Numero')
      .AutoIncFields('Numero')
      .GeneratorName('GEN_CAIXA_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select       ')
        .Add('    c.Ano    ')
        .Add('  , c.Numero ')
        .Add('  , c.Data_abertura ')
        .Add('  , c.Data_fech     ')
        .Add('  , c.Data_cancel   ')
        .Add('  , c.Usuario       ')
        .Add('  , c.Usuario_cancel')
        .Add('  , c.Situacao      ')
        .Add('  , c.Conta_corrente')
        .Add('  , c.Valor_total_credito ')
        .Add('  , c.Valor_total_debito  ')
        .Add('  , c.Motivo_cancel')
        .Add('  , c.conferido')
        .Add('  , c.usuario_confer')
        .Add('  , c.datahora_confer')
        .Add('  , cc.Descricao   ')
        .Add('  , Case ')
        .Add('      when cc.Tipo = 1 then ''Caixa'' ')
        .Add('      when cc.Tipo = 2 then ''Banco'' ')
        .Add('      else ''* Indefinido'' ')
        .Add('    end as Tipo ')
        .Add('  , cc.empresa  ')
        .Add('  , e.razao    as empresa_razao   ')
        .Add('  , e.fantasia as empresa_fantasia')
        .Add('from TBCAIXA c ')
        .Add('  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente) ')
        .Add('  left join TBBANCO_BOLETO bb on (bb.bco_codigo = cc.bco_codigo_cc) ')
        .Add('  left join VW_EMPRESA e on (e.cnpj = coalesce(cc.empresa, bb.empresa)) ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOCaixa.Destroy;
begin
  inherited;
end;

class function TModelDAOCaixa.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCaixa.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Tipo').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('empresa').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('empresa_razao').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('empresa_fantasia').ProviderFlags := [];
end;

procedure TModelDAOCaixa.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('SITUACAO').OnGetText := SituacaoGetText;
end;

procedure TModelDAOCaixa.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (Trim(FieldByName('USUARIO_CANCEL').AsString) = EmptyStr) then
      FieldByName('USUARIO_CANCEL').Clear;
    if (Trim(FieldByName('USUARIO_CONFER').AsString) = EmptyStr) then
      FieldByName('USUARIO_CONFER').Clear;
  end;
end;

procedure TModelDAOCaixa.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Ano').AsInteger := YearOf(Date);
    FieldByName('DATA_ABERTURA').AsDateTime := Now;
    FieldByName('SITUACAO').AsInteger := STATUS_CAIXA_ABERTO;
    FieldByName('VALOR_TOTAL_CREDITO').AsCurrency := 0;
    FieldByName('VALOR_TOTAL_DEBITO').AsCurrency  := 0;
    FieldByName('CONFERIDO').AsInteger  := 0;
    FieldByName('DATA_FECH').Clear;
    FieldByName('DATA_CANCEL').Clear;
    FieldByName('USUARIO_CANCEL').Clear;
    FieldByName('MOTIVO_CANCEL').Clear;
    FieldByName('USUARIO_CONFER').Clear;
    FieldByName('DATAHORA_CONFER').Clear;
  end;
end;

procedure TModelDAOCaixa.SituacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    STATUS_CAIXA_ABERTO    : Text := 'Aberto';
    STATUS_CAIXA_FECHADO   : Text := 'Fechado';
    STATUS_CAIXA_CANCELADO : Text := 'Cancelado';
  end;
end;

{ TModelDAOCaixaMovimento }

constructor TModelDAOCaixaMovimento.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_CX_MOVIMENTO_', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBCAIXA_MOVIMENTO')
      .AliasTableName('m')
      .KeyFields('ano;numero')
      .AutoIncFields('numero')
      .GeneratorName('GEN_CX_MOVIMENTO_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select')
        .Add('    m.ano')
        .Add('  , m.numero   ')
        .Add('  , m.caixa_ano')
        .Add('  , m.caixa_num')
        .Add('  , m.conta_corrente')
        .Add('  , m.forma_pagto')
        .Add('  , m.datahora   ')
        .Add('  , m.tipo       ')
        .Add('  , m.estorno    ')
        .Add('  , m.tipo_receita')
        .Add('  , m.tipo_despesa')
        .Add('  , m.historico')
        .Add('  , m.valor    ')
        .Add('  , m.situacao ')
        .Add('  , m.venda_ano')
        .Add('  , m.venda_num')
        .Add('  , m.os_ano   ')
        .Add('  , m.os_num   ')
        .Add('  , m.cliente_cod ')
        .Add('  , m.cliente     ')
        .Add('  , m.compra_ano  ')
        .Add('  , m.compra_num  ')
        .Add('  , m.empresa     ')
        .Add('  , m.fornecedor  ')
        .Add('  , m.usuario     ')
        .Add('  , m.apagar_ano  ')
        .Add('  , m.apagar_num  ')
        .Add('  , m.areceber_ano')
        .Add('  , m.areceber_num')
        .Add('  , m.conferido   ')
        .Add('  , fp.descri as forma_pagto_desc')
        .Add('  , Case when upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_CREDITO) + ' then m.Valor else 0 end as Valor_Credito')
        .Add('  , Case when upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_DEBITO)  + ' then m.Valor else 0 end as Valor_Debito ')
        .Add('  , cast(m.Datahora as DMN_DATE) as Data')
        .Add('  , cast(m.Datahora as DMN_TIME) as Hora')
        .Add('  , cast(lpad(m.venda_ano, 4, ''0'') || ''/'' || lpad(m.venda_num, 6, ''0'') as DMN_VCHAR_20)       as Venda    ')
        .Add('  , cast(lpad(m.areceber_ano, 4, ''0'') || ''/'' || lpad(m.areceber_num, 6, ''0'') as DMN_VCHAR_20) as Titulo   ')
        .Add('  , cl.nome as cliente_nome')
        .Add('  , cl.cnpj as cliente_cnpj')
        .Add('  , cast(lpad(m.compra_ano, 4, ''0'') || ''/'' || lpad(m.compra_num, 6, ''0'') as DMN_VCHAR_20)     as Compra   ')
        .Add('  , cast(lpad(m.apagar_ano, 4, ''0'') || ''/'' || lpad(m.apagar_num, 6, ''0'') as DMN_VCHAR_20)     as Duplicata')
        .Add('  , fn.nomeforn as fornecedor_nome')
        .Add('  , fn.cnpj     as fornecedor_cnpj')
        .Add('  , cast(lpad(m.ano, 4, ''0'') || ''/'' || lpad(m.numero, 6, ''0'') as DMN_VCHAR_20) as Lancamento')
        .Add('  , tr.tiporec ')
        .Add('  , td.tipodesp')
        .Add('  , us.nomecompleto as usuario_responsavel')
        .Add('  , cast(iif(coalesce(m.caixa_ano, 0) != 0, lpad(m.caixa_ano, 4, ''0'') || ''/'' || lpad(m.caixa_num, 6, ''0''), '''') as DMN_VCHAR_20) as Caixa')
        .Add('  , cm.Situacao as situacao_caixa')
        .Add('  , cm.Data_fech  ')
        .Add('  , cm.Data_cancel')
        .Add('from TBCAIXA_MOVIMENTO m')
        .Add('  left join TBCLIENTE cl on (cl.Codigo = m.Cliente_cod)   ')
        .Add('  left join TBFORNECEDOR fn on (fn.Codforn = m.Fornecedor)')
        .Add('  left join TBFORMPAGTO fp on (fp.Cod = m.Forma_pagto)    ')
        .Add('  left join TBCAIXA cm on (cm.Ano = m.Caixa_ano and cm.Numero = m.Caixa_num)')
        .Add('  left join TBTPRECEITA tr on (tr.cod = m.tipo_receita and upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_CREDITO) + ')')
        .Add('  left join TBTPDESPESA td on (td.cod = m.tipo_despesa and upper(m.tipo) = ' + QuotedStr(TIPO_MOVIMENTO_DEBITO)  + ')')
        .Add('  left join TBUSERS us on (us.nome = m.usuario)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

class function TModelDAOCaixaMovimento.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCaixaMovimento.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('forma_pagto_desc').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Valor_Credito').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Valor_Debito').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('Data').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Hora').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Venda').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('Titulo').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cliente_nome').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cliente_cnpj').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Compra').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('Duplicata').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('fornecedor_nome').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('fornecedor_cnpj').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Lancamento').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('tiporec').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('tipodesp').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('usuario_responsavel').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Caixa').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('situacao_caixa').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('Data_fech').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('Data_cancel').ProviderFlags := [];
end;

procedure TModelDAOCaixaMovimento.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('situacao').OnGetText := SituacaoGetText;
end;

procedure TModelDAOCaixaMovimento.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (Trim(FieldByName('tipo').AsString).ToUpper.Equals(TIPO_MOVIMENTO_CREDITO)) then
      FieldByName('tipo_despesa').Clear;

    if (Trim(FieldByName('tipo').AsString).ToUpper.Equals(TIPO_MOVIMENTO_DEBITO)) then
      FieldByName('tipo_receita').Clear;

    if (Trim(FieldByName('usuario').AsString) = EmptyStr) then
      FieldByName('usuario').Clear;
  end;
end;

procedure TModelDAOCaixaMovimento.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ano').AsInteger := YearOf(Date);
    FieldByName('situacao').AsInteger  := 1;
    FieldByName('empresa').AsString    := Usuario.Empresa.Cnpj;
    FieldByName('usuario').AsString    := Usuario.Login;
    FieldByName('tipo').AsString       := TIPO_MOVIMENTO_CREDITO;

    FieldByName('datahora').AsDateTime := Now;
    FieldByName('data').AsDateTime := Date;
    FieldByName('hora').AsDateTime := Time;

    FieldByName('forma_pagto').Clear;
    FieldByName('tipo_receita').Clear;
    FieldByName('tipo_despesa').Clear;
    FieldByName('cliente_cod').Clear;
    FieldByName('cliente').Clear;
    FieldByName('fornecedor').Clear;

    FieldByName('forma_pagto_desc').Clear;
    FieldByName('Valor_Credito').Clear;
    FieldByName('Valor_Debito').Clear;
    FieldByName('Data').Clear;
    FieldByName('Hora').Clear;
    FieldByName('Venda').Clear;
    FieldByName('Titulo').Clear;
    FieldByName('cliente_nome').Clear;
    FieldByName('cliente_cnpj').Clear;
    FieldByName('Compra').Clear;
    FieldByName('Duplicata').Clear;
    FieldByName('fornecedor_nome').Clear;
    FieldByName('fornecedor_cnpj').Clear;
    FieldByName('Lancamento').Clear;
    FieldByName('tiporec').Clear;
    FieldByName('tipodesp').Clear;
    FieldByName('usuario_responsavel').Clear;
    FieldByName('Caixa').Clear;
    FieldByName('situacao_caixa').Clear;
    FieldByName('Data_fech').Clear;
    FieldByName('Data_cancel').Clear;
  end;
end;

destructor TModelDAOCaixaMovimento.Destroy;
begin
  inherited;
end;

procedure TModelDAOCaixaMovimento.SituacaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    0 : Text := 'Cancelado';
    1 : Text := 'Confirmado';
  end;
end;

end.
