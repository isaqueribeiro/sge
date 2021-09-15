unit SGE.Model.DAO.RequisicaoCompra;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Requisições de Compras/Serviços
  TModelDAORequisicaoCompra = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
      procedure TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataHoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Itens da Requisições de Compras/Serviços
  TModelDAORequisicaoCompraProdutoServico = class(TModelDAO, IModelDAOCustom)
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

  // Tipos de Requisições de Compras/Serviços (View)
  TModelDAOTipoRequisicaoView = class(TModelDAO, IModelDAOCustom)
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
  System.DateUtils,
  UConstantesDGE;

{ TModelDAORequisicaoCompra }

constructor TModelDAORequisicaoCompra.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_REQUISITA_COMPRA', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBREQUISITA_COMPRA')
      .AliasTableName('r')
      .KeyFields('ano;codigo;empresa')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_REQUISITA_COMPRA_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select                   ')
        .Add('    r.ano                ')
        .Add('  , r.codigo             ')
        .Add('  , r.empresa            ')
        .Add('  , r.numero             ')
        .Add('  , r.fornecedor         ')
        .Add('  , r.nome_contato       ')
        .Add('  , r.tipo               ')
        .Add('  , r.insercao_data      ')
        .Add('  , r.emissao_data       ')
        .Add('  , r.emissao_usuario    ')
        .Add('  , r.validade           ')
        .Add('  , r.competencia        ')
        .Add('  , r.movito             ')
        .Add('  , r.observacao         ')
        .Add('  , r.cliente            ')
        .Add('  , r.centro_custo       ')
        .Add('  , r.endereco_entrega   ')
        .Add('  , r.status             ')
        .Add('  , r.recebedor_nome     ')
        .Add('  , r.recebedor_cpf      ')
        .Add('  , r.recebedor_funcao   ')
        .Add('  , r.forma_pagto        ')
        .Add('  , r.condicao_pagto     ')
        .Add('  , r.transportador      ')
        .Add('  , r.valor_bruto        ')
        .Add('  , r.valor_desconto     ')
        .Add('  , r.valor_total_frete  ')
        .Add('  , r.valor_total_ipi    ')
        .Add('  , r.valor_total        ')
        .Add('  , r.requisitado_data   ')
        .Add('  , r.data_fatura        ')
        .Add('  , r.requisitado_usuario')
        .Add('  , r.cancelado_data     ')
        .Add('  , r.cancelado_usuario  ')
        .Add('  , r.cancelado_motivo   ')
        .Add('  , coalesce((Select count(x.seq) from TBREQUISITA_COMPRAITEM x where x.ano = r.ano and x.codigo = r.codigo and x.empresa = r.empresa), 0) as itens')
        .Add('  , coalesce((Select count(y.autorizacao_ano) from TBAUTORIZA_REQUISITA y where y.requisicao_ano = r.ano and y.requisicao_cod = r.codigo and y.requisicao_emp = r.empresa), 0) as autorizacoes')
        .Add('  , f.nomeforn          ')
        .Add('  , f.cnpj              ')
        .Add('  , f.pessoa_fisica     ')
        .Add('  , f.faturamento_minimo')
        .Add('  , t.nomeforn  as transportador_nome    ')
        .Add('  , t.cnpj      as transportador_cpf_cnpj')
        .Add('  , c.nome      as nomecliente           ')
        .Add('  , u.descricao as descricao_centro_custo')
        .Add('from TBREQUISITA_COMPRA r')
        .Add('  left join TBFORNECEDOR f on (f.codforn = r.fornecedor)   ')
        .Add('  left join TBFORNECEDOR t on (t.codforn = r.transportador)')
        .Add('  left join TBCLIENTE c on (c.codigo = r.cliente)          ')
        .Add('  left join TBCENTRO_CUSTO u on (u.codigo = r.centro_custo)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAORequisicaoCompra.Destroy;
begin
  inherited;
end;

class function TModelDAORequisicaoCompra.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAORequisicaoCompra.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_REQUISICAO_EDC : Text := 'Em Edição';
    STATUS_REQUISICAO_ABR : Text := 'Aberta';
    STATUS_REQUISICAO_REQ : Text := 'Requisitada';
    STATUS_REQUISICAO_FAT : Text := 'Faturada';
    STATUS_REQUISICAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TModelDAORequisicaoCompra.TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_Requisicao_COMPRA :
        Text := 'Compra';

      TIPO_Requisicao_SERVICO:
        Text := 'Serviço';

      TIPO_Requisicao_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

procedure TModelDAORequisicaoCompra.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('itens').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('autorizacoes').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nomeforn').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('pessoa_fisica').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('faturamento_minimo').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('transportador_nome').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('transportador_cpf_cnpj').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nomecliente').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('descricao_centro_custo').ProviderFlags := [];
end;

procedure TModelDAORequisicaoCompra.DataHoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Text := FormatDateTime('dd/mm/yyyy hh:nn', Sender.AsDateTime)
  else
    Text := Sender.AsString;
end;

procedure TModelDAORequisicaoCompra.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('TIPO').OnGetText   := TipoGetText;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
  FConn.Query.DataSet.FieldByName('INSERCAO_DATA').OnGetText := DataHoraGetText;
end;

procedure TModelDAORequisicaoCompra.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if Trim(FieldByName('REQUISITADO_USUARIO').AsString) = EmptyStr then
      FieldByName('REQUISITADO_USUARIO').Clear;

    if Trim(FieldByName('CANCELADO_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCELADO_USUARIO').Clear;
  end;
end;

procedure TModelDAORequisicaoCompra.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger            := FormatDateTime('yyyy', Date).ToInteger;
    FieldByName('EMPRESA').AsString         := Usuario.Empresa.CNPJ;
    FieldByName('TIPO').AsInteger           := TIPO_REQUISICAO_COMPRA;
    FieldByName('INSERCAO_DATA').AsDateTime := Now;
    FieldByName('EMISSAO_DATA').AsDateTime  := Date;
    FieldByName('EMISSAO_USUARIO').AsString := Usuario.Login;
    FieldByName('VALIDADE').AsDateTime      := IncDay(FieldByName('EMISSAO_DATA').AsDateTime, PRAZO_VALIDADE_REQUISICAO_COMPRA);
    FieldByName('STATUS').AsInteger         := STATUS_REQUISICAO_EDC;

    FieldByName('FORMA_PAGTO').AsInteger    := Configuracao.Padrao.FormaPagtoID;
    FieldByName('CONDICAO_PAGTO').AsInteger := Configuracao.Padrao.CondicaoPagtoID;

    FieldByName('VALOR_TOTAL_FRETE').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_IPI').AsCurrency   := 0.0;
    FieldByName('VALOR_DESCONTO').AsCurrency    := 0.0;

    FieldByName('VALOR_TOTAL_FRETE').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_IPI').AsCurrency   := 0.0;
    FieldByName('VALOR_DESCONTO').AsCurrency    := 0.0;

    FieldByName('FORNECEDOR').Clear;
    FieldByName('NOMEFORN').Clear;
    FieldByName('TRANSPORTADOR').Clear;
    FieldByName('RECEBEDOR_NOME').Clear;
    FieldByName('RECEBEDOR_FUNCAO').Clear;
    FieldByName('RECEBEDOR_CPF').Clear;
    FieldByName('REQUISITADO_DATA').Clear;
    FieldByName('REQUISITADO_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
    FieldByName('CLIENTE').Clear;
    FieldByName('CENTRO_CUSTO').Clear;
  end;
end;

{ TModelDAORequisicaoCompraProdutoServico }

constructor TModelDAORequisicaoCompraProdutoServico.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBREQUISITA_COMPRAITEM')
      .AliasTableName('i')
      .KeyFields('ano;codigo;empresa;seq')
      .SQL
        .Clear
        .Add('Select               ')
        .Add('    i.ano            ')
        .Add('  , i.codigo         ')
        .Add('  , i.empresa        ')
        .Add('  , i.seq            ')
        .Add('  , i.fornecedor     ')
        .Add('  , i.produto        ')
        .Add('  , i.quantidade     ')
        .Add('  , i.unidade        ')
        .Add('  , i.valor_unitario ')
        .Add('  , i.ipi_percentual ')
        .Add('  , i.ipi_valor_total')
        .Add('  , i.valor_total    ')
        .Add('  , i.confirmado_recebimento')
        .Add('  , i.usuario               ')
        .Add('  , p.descri_apresentacao   ')
        .Add('  , u.unp_descricao         ')
        .Add('  , u.unp_sigla             ')
        .Add('from TBREQUISITA_COMPRAITEM i')
        .Add('  left join TBPRODUTO p on (p.cod = i.produto)        ')
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

destructor TModelDAORequisicaoCompraProdutoServico.Destroy;
begin
  inherited;
end;

class function TModelDAORequisicaoCompraProdutoServico.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAORequisicaoCompraProdutoServico.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags     := [];
end;

procedure TModelDAORequisicaoCompraProdutoServico.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAORequisicaoCompraProdutoServico.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger := YearOf(Now);
    FieldByName('CODIGO').Clear;
    FieldByName('EMPRESA').Clear;
    FieldByName('SEQ').Clear;
    FieldByName('FORNECEDOR').Clear;
    FieldByName('QUANTIDADE').AsCurrency := 1;
    FieldByName('CONFIRMADO_RECEBIMENTO').AsInteger := FLAG_NAO;
    FieldByName('VALOR_UNITARIO').AsCurrency    := 0.0;
    FieldByName('IPI_PERCENTUAL').AsCurrency    := 0.0;
    FieldByName('IPI_VALOR_TOTAL').AsCurrency   := 0.0;
    FieldByName('USUARIO').Value                := USuario.Login;
    FieldByName('PRODUTO').Clear;
    FieldByName('DESCRI_APRESENTACAO').Clear;
    FieldByName('UNIDADE').Clear;
    FieldByName('UNP_SIGLA').Clear;
  end;
end;

{ TModelDAOTipoRequisicaoView }

constructor TModelDAOTipoRequisicaoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select       ')
        .Add('  a.codigo,  ')
        .Add('  a.descricao')
        .Add('from VW_TIPO_REQUISICAO a')
      .&End
    .Open;
end;

destructor TModelDAOTipoRequisicaoView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoRequisicaoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoRequisicaoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

end.
