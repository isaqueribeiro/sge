unit SGI.Model.DAO.SolicitacaoCompra;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Solicitação de Compras/Serviços
  TModelDAOSolicitacaoCompra = class(TModelDAO, IModelDAOCustom)
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

  // Itens da Solicitação de Compras/Serviços
  TModelDAOSolicitacaoCompraProdutoServico = class(TModelDAO, IModelDAOCustom)
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

  // Tipos de Solicitação de Compras/Serviços (View)
  TModelDAOTipoSolicitacaoView = class(TModelDAO, IModelDAOCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;
//
//  // Itens da Solicitação de Compras/Serviços para entrada
//  TModelDAOItensAutorizadosParaEntrada = class(TModelDAO, IModelDAOCustom)
//    private
//    protected
//      constructor Create;
//    public
//      destructor Destroy; override;
//      class function New : IModelDAOCustom;
//
//      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
//  end;

implementation

uses
  System.DateUtils,
  UConstantesDGE;

{ TModelDAOSolicitacaoCompra }

constructor TModelDAOSolicitacaoCompra.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_SOLICITACAO_', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBSOLICITACAO')
      .AliasTableName('s')
      .KeyFields('ano;codigo')
      .AutoIncFields('codigo')
      .GeneratorName('GEN_SOLICITACAO_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select')
        .Add('    s.ano    ')
        .Add('  , s.codigo ')
        .Add('  , s.numero ')
        .Add('  , s.tipo   ')
        .Add('  , s.empresa')
        .Add('  , s.centro_custo      ')
        .Add('  , s.nome_solicitante  ')
        .Add('  , s.objeto_solicitacao')
        .Add('  , s.movito       ')
        .Add('  , s.observacao   ')
        .Add('  , s.data_emissao ')
        .Add('  , s.validade     ')
        .Add('  , s.competencia  ')
        .Add('  , s.insercao_data')
        .Add('  , s.insercao_usuario ')
        .Add('  , s.status           ')
        .Add('  , s.aprovacao_data   ')
        .Add('  , s.aprovacao_usuario')
        .Add('  , s.cancelado_data   ')
        .Add('  , s.cancelado_usuario')
        .Add('  , s.cancelado_motivo ')
        .Add('  , s.log_evento       ')
        .Add('  , cast(coalesce((Select count(x.seq) from TBSOLICITACAO_ITEM x where x.ano = s.ano and x.codigo = s.codigo), 0) as Integer) as itens')
        .Add('  , c.descricao as centro_custo_nome')
        .Add('from TBSOLICITACAO s')
        .Add('  left join TBCENTRO_CUSTO c on (c.codigo = s.centro_custo)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOSolicitacaoCompra.Destroy;
begin
  inherited;
end;

class function TModelDAOSolicitacaoCompra.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOSolicitacaoCompra.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('itens').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('centro_custo_nome').ProviderFlags := [];
end;

procedure TModelDAOSolicitacaoCompra.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
      STATUS_SOLICITACAO_EDC : Text := 'Em Edição';
      STATUS_SOLICITACAO_ABR : Text := 'Aberta';
      STATUS_SOLICITACAO_FIN : Text := 'Finalizada';
      STATUS_SOLICITACAO_APR : Text := 'Aprovada';
      STATUS_SOLICITACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TModelDAOSolicitacaoCompra.TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_SOLICITACAO_COMPRA :
        Text := 'Compra';

      TIPO_SOLICITACAO_SERVICO:
        Text := 'Serviço';

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

procedure TModelDAOSolicitacaoCompra.DataHoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Text := FormatDateTime('dd/mm/yyyy hh:nn', Sender.AsDateTime)
  else
    Text := Sender.AsString;
end;

procedure TModelDAOSolicitacaoCompra.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('TIPO').OnGetText   := TipoGetText;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
  FConn.Query.DataSet.FieldByName('INSERCAO_DATA').OnGetText := DataHoraGetText;
end;

procedure TModelDAOSolicitacaoCompra.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if Trim(FieldByName('APROVACAO_USUARIO').AsString) = EmptyStr then
      FieldByName('APROVACAO_USUARIO').Clear;

    if Trim(FieldByName('CANCELADO_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCELADO_USUARIO').Clear;
  end;
end;

procedure TModelDAOSolicitacaoCompra.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger             := FormatDateTime('yyyy', Date).ToInteger;
    FieldByName('EMPRESA').AsString          := Usuario.Empresa.CNPJ;
    FieldByName('TIPO').AsInteger            := TIPO_SOLICITACAO_COMPRA;
    FieldByName('DATA_EMISSAO').AsDateTime   := Date;
    FieldByName('INSERCAO_DATA').AsDateTime  := Now;
    FieldByName('INSERCAO_USUARIO').AsString := Usuario.Login;
    FieldByName('VALIDADE').AsDateTime       := IncDay(FieldByName('DATA_EMISSAO').AsDateTime, PRAZO_VALIDADE_SOLICITACAO_COMPRA);
    FieldByName('STATUS').AsInteger          := STATUS_SOLICITACAO_EDC;
    FieldByName('NOME_SOLICITANTE').AsString := Usuario.Nome;

    FieldByName('CENTRO_CUSTO').Clear;
    FieldByName('CENTRO_CUSTO_NOME').Clear;
    FieldByName('APROVACAO_DATA').Clear;
    FieldByName('APROVACAO_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
  end;
end;

{ TModelDAOSolicitacaoCompraProdutoServico }

constructor TModelDAOSolicitacaoCompraProdutoServico.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBSOLICITACAO_ITEM')
      .AliasTableName('i')
      .KeyFields('ano;codigo;seq')
      .SQL
        .Clear
        .Add('Select')
        .Add('    i.ano   ')
        .Add('  , i.codigo')
        .Add('  , i.seq   ')
        .Add('  , i.centro_custo   ')
        .Add('  , i.item_codigo    ')
        .Add('  , i.item_descricao ')
        .Add('  , i.item_cadastrado')
        .Add('  , i.quantidade')
        .Add('  , i.unidade   ')
        .Add('  , i.usuario   ')
        .Add('  , u.unp_descricao')
        .Add('  , c.descricao as centro_custo_nome')
        .Add('from TBSOLICITACAO_ITEM i')
        .Add('  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)')
        .Add('  left join TBCENTRO_CUSTO c on (c.codigo = i.centro_custo)')
      .&End
      .Where('i.Ano     = :ano')
      .Where('i.codigo  = :codigo')
      .ParamByName('ano', 0)
      .ParamByName('codigo', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAOSolicitacaoCompraProdutoServico.Destroy;
begin
  inherited;
end;

class function TModelDAOSolicitacaoCompraProdutoServico.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOSolicitacaoCompraProdutoServico.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('centro_custo_nome').ProviderFlags := [];
end;

procedure TModelDAOSolicitacaoCompraProdutoServico.SettingDisplayFields;
begin
  DisplayField('SEQ', '#', '#00', TAlignment.taCenter, True);
  DisplayField('PRODUTO', 'Produto/Serviço', TAlignment.taLeftJustify, True);
  DisplayField('QUANTIDADE', 'Quantidade', ',0.###', TAlignment.taRightJustify, True);
end;

procedure TModelDAOSolicitacaoCompraProdutoServico.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  SettingDisplayFields;
end;

procedure TModelDAOSolicitacaoCompraProdutoServico.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger := YearOf(Now);
    FieldByName('CODIGO').Clear;
    FieldByName('QUANTIDADE').AsCurrency := 1;
    FieldByName('USUARIO').AsString      := USuario.Login;
    FieldByName('ITEM_CADASTRADO').AsInteger := 0;
    FieldByName('CENTRO_CUSTO').Clear;
    FieldByName('CENTRO_CUSTO_NOME').Clear;
    FieldByName('ITEM_CODIGO').Clear;
    FieldByName('ITEM_DESCRICAO').Clear;
  end;
end;

{ TModelDAOTipoSolicitacaoView }

constructor TModelDAOTipoSolicitacaoView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select       ')
        .Add('  a.codigo,  ')
        .Add('  a.descricao')
        .Add('from VW_TIPO_SOLICITACAO a')
      .&End
    .Open;
end;

destructor TModelDAOTipoSolicitacaoView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoSolicitacaoView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoSolicitacaoView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

//{ TModelDAOItensAutorizadosParaEntrada }
//
//constructor TModelDAOItensAutorizadosParaEntrada.Create;
//begin
//  inherited Create;
//  FConn
//    .Query
//      .SQL
//        .Clear
//        .Add('Select            ')
//        .Add('    i.produto     ')
//        .Add('  , p.descri      ')
//        .Add('  , p.apresentacao')
//        .Add('  , p.descri_apresentacao')
//        .Add('  , i.unidade      ')
//        .Add('  , u.unp_descricao')
//        .Add('  , u.unp_sigla    ')
//        .Add('  , p.codcfop      ')
//        .Add('  , p.ncm_sh       ')
//        .Add('  , p.cst          ')
//        .Add('  , p.csosn        ')
//        .Add('  , p.aliquota     ')
//        .Add('  , p.percentual_reducao_bc')
//        .Add('  , p.aliquota_csosn       ')
//        .Add('  , p.aliquota_pis         ')
//        .Add('  , p.aliquota_cofins      ')
//        .Add('  , i.quantidade           ')
//        .Add('  , p.qtde as estoque      ')
//        .Add('  , i.quantidade + coalesce(p.qtde, 0.0) as novo_estoque')
//        .Add('  , i.valor_unitario')
//        .Add('  , p.valor_ipi     ')
//        .Add('from TBAUTORIZA_COMPRA c')
//        .Add('  inner join TBAUTORIZA_COMPRAITEM i on (i.ano = c.ano and i.codigo = c.codigo and i.empresa = c.empresa)')
//        .Add('  inner join TBPRODUTO p on (p.cod = i.produto and p.aliquota_tipo = :tipo)')
//        .Add('  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)')
//        .Add('where c.ano     = :ano')
//        .Add('  and c.codigo  = :codigo')
//        .Add('  and c.empresa = :empresa')
//      .&End
//      .ParamByName('ano', 0)
//      .ParamByName('codigo', 0)
//      .ParamByName('empresa', EmptyStr)
//    .Open;
//end;
//
//destructor TModelDAOItensAutorizadosParaEntrada.Destroy;
//begin
//  inherited;
//end;
//
//class function TModelDAOItensAutorizadosParaEntrada.New: IModelDAOCustom;
//begin
//  Result := Self.Create;
//end;

end.
