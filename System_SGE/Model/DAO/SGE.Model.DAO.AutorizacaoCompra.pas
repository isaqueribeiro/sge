unit SGE.Model.DAO.AutorizacaoCompra;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Autorizações de Compras/Serviços
  TModelDAOAutorizacaoCompra = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
      procedure TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Itens da Autorizações de Compras/Serviços
  TModelDAOAutorizacaoCompraProdutoServico = class(TModelDAO, IModelDAOCustom)
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

  // Tipos de Autorizações de Compras/Serviços (View)
  TModelDAOTipoAutorizacao = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOAutorizacaoCompra }

constructor TModelDAOAutorizacaoCompra.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_AUTORIZA_COMPRA_' + FormatDateTime('yyyy', Date));
  FConn
    .Query
      .TableName('TBAUTORIZA_COMPRA')
      .AliasTableName('a')
      .KeyFields('ano;codigo;empresa')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_AUTORIZA_COMPRA_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select                  ')
        .Add('    a.ano               ')
        .Add('  , a.codigo            ')
        .Add('  , a.empresa           ')
        .Add('  , a.numero            ')
        .Add('  , a.fornecedor        ')
        .Add('  , a.nome_contato      ')
        .Add('  , a.tipo              ')
        .Add('  , a.insercao_data     ')
        .Add('  , a.emissao_data      ')
        .Add('  , a.emissao_usuario   ')
        .Add('  , a.validade          ')
        .Add('  , a.competencia       ')
        .Add('  , a.movito            ')
        .Add('  , a.observacao        ')
        .Add('  , a.cliente           ')
        .Add('  , a.centro_custo      ')
        .Add('  , a.endereco_entrega  ')
        .Add('  , a.status            ')
        .Add('  , a.recebedor_nome    ')
        .Add('  , a.recebedor_cpf     ')
        .Add('  , a.recebedor_funcao  ')
        .Add('  , a.forma_pagto       ')
        .Add('  , a.condicao_pagto    ')
        .Add('  , a.transportador     ')
        .Add('  , a.valor_bruto       ')
        .Add('  , a.valor_desconto    ')
        .Add('  , a.valor_total_frete ')
        .Add('  , a.valor_total_ipi   ')
        .Add('  , a.valor_total       ')
        .Add('  , a.autorizado_data   ')
        .Add('  , a.data_fatura       ')
        .Add('  , a.autorizado_usuario')
        .Add('  , a.cancelado_data    ')
        .Add('  , a.cancelado_usuario ')
        .Add('  , a.cancelado_motivo  ')
        .Add('  , coalesce((Select count(x.seq) from TBAUTORIZA_COMPRAITEM x where x.ano = a.ano and x.codigo = a.codigo and x.empresa = a.empresa), 0) as itens')
        .Add('  , f.nomeforn          ')
        .Add('  , f.cnpj              ')
        .Add('  , f.pessoa_fisica     ')
        .Add('  , f.faturamento_minimo')
        .Add('  , t.nomeforn  as transportador_nome    ')
        .Add('  , t.cnpj      as transportador_cpf_cnpj')
        .Add('  , c.nome      as nomecliente           ')
        .Add('  , u.descricao as descricao_centro_custo')
        .Add('from TBAUTORIZA_COMPRA a')
        .Add('  left join TBFORNECEDOR f on (f.codforn = a.fornecedor)   ')
        .Add('  left join TBFORNECEDOR t on (t.codforn = a.transportador)')
        .Add('  left join TBCLIENTE c on (c.codigo = a.cliente)          ')
        .Add('  left join TBCENTRO_CUSTO u on (u.codigo = a.centro_custo)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOAutorizacaoCompra.Destroy;
begin
  inherited;
end;

class function TModelDAOAutorizacaoCompra.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOAutorizacaoCompra.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('itens').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('nomeforn').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cnpj').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('pessoa_fisica').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('faturamento_minimo').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('transportador_nome').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('transportador_cpf_cnpj').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nomecliente').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('descricao_centro_custo').ProviderFlags := [];
end;

procedure TModelDAOAutorizacaoCompra.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_AUTORIZACAO_EDC : Text := 'Em Edição';
    STATUS_AUTORIZACAO_ABR : Text := 'Aberta';
    STATUS_AUTORIZACAO_AUT : Text := 'Autorizada';
    STATUS_AUTORIZACAO_FAT : Text := 'Faturada';
    STATUS_AUTORIZACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TModelDAOAutorizacaoCompra.TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_AUTORIZACAO_COMPRA :
        Text := 'Compra';

      TIPO_AUTORIZACAO_SERVICO:
        Text := 'Serviço';

      TIPO_AUTORIZACAO_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

procedure TModelDAOAutorizacaoCompra.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('TIPO').OnGetText   := TipoGetText;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
end;

procedure TModelDAOAutorizacaoCompra.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if Trim(FieldByName('AUTORIZADO_USUARIO').AsString) = EmptyStr then
      FieldByName('AUTORIZADO_USUARIO').Clear;

    if Trim(FieldByName('CANCELADO_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCELADO_USUARIO').Clear;
  end;
end;

procedure TModelDAOAutorizacaoCompra.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('EMPRESA').AsString         := Usuario.Empresa.CNPJ;
    FieldByName('TIPO').AsInteger           := TIPO_AUTORIZACAO_COMPRA;
    FieldByName('INSERCAO_DATA').AsDateTime := Now;
    FieldByName('EMISSAO_DATA').AsDateTime  := Date;
    FieldByName('EMISSAO_USUARIO').AsString := Usuario.Login;
    FieldByName('VALIDADE').AsDateTime      := IncDay(FieldByName('EMISSAO_DATA').AsDateTime, 5);
    FieldByName('STATUS').AsInteger         := STATUS_AUTORIZACAO_EDC;

    FieldByName('FORMA_PAGTO').AsInteger    := Configuracao.Padrao.FormaPagtoID;
    FieldByName('CONDICAO_PAGTO').AsInteger := Configuracao.Padrao.CondicaoPagtoID;

    FieldByName('VALOR_TOTAL_FRETE').AsCurrency := 0.0;
    FieldByName('VALOR_TOTAL_IPI').AsCurrency   := 0.0;
    FieldByName('VALOR_DESCONTO').AsCurrency    := 0.0;

    FieldByName('FORNECEDOR').Clear;
    FieldByName('NOMEFORN').Clear;
    FieldByName('TRANSPORTADOR').Clear;
    FieldByName('RECEBEDOR_NOME').Clear;
    FieldByName('RECEBEDOR_FUNCAO').Clear;
    FieldByName('RECEBEDOR_CPF').Clear;
    FieldByName('AUTORIZADO_DATA').Clear;
    FieldByName('AUTORIZADO_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
    FieldByName('CLIENTE').Clear;
    FieldByName('CENTRO_CUSTO').Clear;
  end;
end;

{ TModelDAOAutorizacaoCompraProdutoServico }

constructor TModelDAOAutorizacaoCompraProdutoServico.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBAUTORIZA_COMPRAITEM')
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
        .Add('from TBAUTORIZA_COMPRAITEM i')
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

destructor TModelDAOAutorizacaoCompraProdutoServico.Destroy;
begin
  inherited;
end;

class function TModelDAOAutorizacaoCompraProdutoServico.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOAutorizacaoCompraProdutoServico.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags     := [];
end;

procedure TModelDAOAutorizacaoCompraProdutoServico.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAOAutorizacaoCompraProdutoServico.DataSetNewRecord(DataSet: TDataSet);
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

{ TModelDAOTipoAutorizacao }

constructor TModelDAOTipoAutorizacao.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select       ')
        .Add('  a.codigo,  ')
        .Add('  a.descricao')
        .Add('from VW_TIPO_AUTORIZACAO a')
      .&End
    .Open;
end;

destructor TModelDAOTipoAutorizacao.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoAutorizacao.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoAutorizacao.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

end.
