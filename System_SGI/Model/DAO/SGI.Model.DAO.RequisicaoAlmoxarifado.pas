unit SGI.Model.DAO.RequisicaoAlmoxarifado;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Requisição ao Almoxarifado
  TModelDAORequisicaoAlmoxarifado = class(TModelDAO, IModelDAOCustom)
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

  // Itens da Requisição ao Almoxarifado
  TModelDAORequisicaoAlmoxarifadoProduto = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // Tipos ao Requisição ao Almoxarifado (View)
  TModelDAOTipoRequisicaoAlmoxView = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAORequisicaoAlmoxarifado }

constructor TModelDAORequisicaoAlmoxarifado.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_REQUISICAO_ALMOX', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBREQUISICAO_ALMOX')
      .AliasTableName('a')
      .KeyFields('ano;controle')
      .AutoIncFields('controle')
      .GeneratorName('GEN_REQUISICAO_ALMOX_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select   ')
        .Add('    r.ano')
        .Add('  , r.controle')
        .Add('  , r.numero  ')
        .Add('  , r.empresa ')
        .Add('  , r.tipo    ')
        .Add('  , r.ccusto_origem   ')
        .Add('  , r.ccusto_destino  ')
        .Add('  , r.insercao_data   ')
        .Add('  , r.insercao_usuario')
        .Add('  , r.data_emissao ')
        .Add('  , r.requisitante ')
        .Add('  , r.competencia  ')
        .Add('  , r.status       ')
        .Add('  , r.motivo       ')
        .Add('  , r.obs          ')
        .Add('  , r.valor_total  ')
        .Add('  , r.atendimento_usuario')
        .Add('  , r.atendimento_data   ')
        .Add('  , r.cancel_usuario     ')
        .Add('  , r.cancel_data        ')
        .Add('  , r.cancel_motivo      ')
        .Add('  ')
        .Add('  , cast(coalesce((Select count(ri.item) from TBREQUISICAO_ALMOX_ITEM ri where ri.ano = r.ano and ri.controle = r.controle), 0) as Integer) as Itens')
        .Add('  ')
        .Add('  , e.rzsoc       as empresa_nome  ')
        .Add('  , co.descricao  as cc_origem_desc')
        .Add('  , co.codcliente as cc_origem_codcliente  ')
        .Add('  , cd.descricao  as cc_destino_desc       ')
        .Add('  , us.nomecompleto as usuario_requisitante')
        .Add('  ')
        .Add('from TBREQUISICAO_ALMOX r')
        .Add('  left join TBEMPRESA e on (e.cnpj = r.empresa)')
        .Add('  left join TBCENTRO_CUSTO co on (co.codigo = r.ccusto_origem) ')
        .Add('  left join TBCENTRO_CUSTO cd on (cd.codigo = r.ccusto_destino)')
        .Add('  left join TBUSERS us on (us.nome = r.requisitante)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAORequisicaoAlmoxarifado.Destroy;
begin
  inherited;
end;

class function TModelDAORequisicaoAlmoxarifado.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAORequisicaoAlmoxarifado.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('itens').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('empresa_nome').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('cc_origem_desc').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cc_origem_codcliente').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('cc_destino_desc').ProviderFlags      := [];
  FConn.Query.DataSet.FieldByName('usuario_requisitante').ProviderFlags := [];
end;

procedure TModelDAORequisicaoAlmoxarifado.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_REQUISICAO_ALMOX_EDC : Text := 'Editando';
    STATUS_REQUISICAO_ALMOX_ABR : Text := 'Aberta';
    STATUS_REQUISICAO_ALMOX_ENV : Text := 'Enviada';
    STATUS_REQUISICAO_ALMOX_REC : Text := 'Recebida';
    STATUS_REQUISICAO_ALMOX_ATD : Text := 'Atendida';
    STATUS_REQUISICAO_ALMOX_CAN : Text := 'Cancelada';
  end;
end;

procedure TModelDAORequisicaoAlmoxarifado.TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_REQUISICAO_ALMOX_CI:
        Text := 'Consumo Interno';

      TIPO_REQUISICAO_ALMOX_CP:
        Text := 'Consumo Produção';

      TIPO_REQUISICAO_ALMOX_TE:
        Text := 'Transf. Estoque/Equipamentos';

      else
        Text := Sender.AsString;
    end;
end;

procedure TModelDAORequisicaoAlmoxarifado.DataHoraGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Text := FormatDateTime('dd/mm/yyyy hh:nn', Sender.AsDateTime)
  else
    Text := Sender.AsString;
end;

procedure TModelDAORequisicaoAlmoxarifado.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('TIPO').OnGetText   := TipoGetText;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
  FConn.Query.DataSet.FieldByName('INSERCAO_DATA').OnGetText := DataHoraGetText;
end;

procedure TModelDAORequisicaoAlmoxarifado.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if Trim(FieldByName('ATENDIMENTO_USUARIO').AsString) = EmptyStr then
      FieldByName('ATENDIMENTO_USUARIO').Clear;

    if Trim(FieldByName('CANCEL_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCEL_USUARIO').Clear;
  end;
end;

procedure TModelDAORequisicaoAlmoxarifado.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('EMPRESA').AsString         := Usuario.Empresa.CNPJ;
    FieldByName('INSERCAO_DATA').AsDateTime := Now;
    FieldByName('DATA_EMISSAO').AsDateTime  := Date;
    FieldByName('REQUISITANTE').AsString  := Usuario.Login;
    FieldByName('STATUS').AsInteger       := STATUS_REQUISICAO_ALMOX_EDC;
    FieldByName('INSERCAO_DATA').AsDateTime      := Now;
    FieldByName('INSERCAO_USUARIO').AsString     := Usuario.Login;
    FieldByName('USUARIO_REQUISITANTE').AsString := Usuario.Nome;

    FieldByName('VALOR_TOTAL').AsCurrency := 0.0;

    FieldByName('TIPO').Clear;
    FieldByName('CCUSTO_ORIGEM').Clear;
    FieldByName('CCUSTO_DESTINO').Clear;
    FieldByName('COMPETENCIA').Clear;
    FieldByName('MOTIVO').Clear;
    FieldByName('OBS').Clear;
    FieldByName('ATENDIMENTO_USUARIO').Clear;
    FieldByName('ATENDIMENTO_DATA').Clear;
    FieldByName('CANCEL_USUARIO').Clear;
    FieldByName('CANCEL_DATA').Clear;
    FieldByName('CANCEL_MOTIVO').Clear;
  end;
end;

{ TModelDAORequisicaoAlmoxarifadoProduto }

constructor TModelDAORequisicaoAlmoxarifadoProduto.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBREQUISICAO_ALMOX_ITEM')
      .AliasTableName('i')
      .KeyFields('ano;controle;item')
      .SQL
        .Clear
        .Add('Select   ')
        .Add('    i.ano')
        .Add('  , i.controle')
        .Add('  , i.item    ')
        .Add('  , i.produto ')
        .Add('  , i.qtde    ')
        .Add('  , i.qtde_atendida')
        .Add('  , i.unidade')
        .Add('  , i.custo  ')
        .Add('  , i.fracionador')
        .Add('  , i.total      ')
        .Add('  , i.status     ')
        .Add('  , i.lote_atendimento ')
        .Add('  , i.lote_requisitante')
        .Add('  ')
        .Add('  , p.descri')
        .Add('  , p.apresentacao')
        .Add('  , coalesce(nullif(trim(p.nome_amigo), ''''), p.descri_apresentacao) as descri_apresentacao')
        .Add('  , u.unp_descricao')
        .Add('  , u.unp_sigla    ')
        .Add('  , substring(coalesce(nullif(trim(u.unp_sigla), ''''), u.unp_descricao) from 1 for 3) unidade_sigla')
        .Add('  , ea.estoque   ')
        .Add('  , ea.reserva   ')
        .Add('  , ea.disponivel')
        .Add('  , case when i.status in (' + IntToStr(STATUS_ITEM_REQUISICAO_ALMOX_PEN) +  ', ' + IntToStr(STATUS_ITEM_REQUISICAO_ALMOX_AGU) + ')')
        .Add('      then coalesce(i.qtde, 0.0) + coalesce(ea.disponivel, 0.0)')
        .Add('      else coalesce(ea.disponivel, 0.0)')
        .Add('    end as disponivel_tmp')
        .Add('from TBREQUISICAO_ALMOX_ITEM i')
        .Add('  left join TBPRODUTO p on (p.cod = i.produto)')
        .Add('  left join TBUNIDADEPROD u on (u.unp_cod = i.unidade)')
        .Add('  left join (')
        .Add('    Select   ')
        .Add('        e.produto   ')
        .Add('      , e.estoque   ')
        .Add('      , e.reserva   ')
        .Add('      , e.disponivel')
        .Add('    from GET_ESTOQUE_ALMOX_DISPONIVEL(:empresa, :centro_custo, null, null, null, :requisicao_ano,  :requisicao_cod) e')
        .Add('  ) ea on (ea.produto = i.produto)')
      .&End
      .Where('i.Ano      = :ano')
      .Where('i.controle = :controle')
      .OrderBy('i.ano')
      .OrderBy('i.controle')
      .OrderBy('i.item')
      .ParamByName('ano', 0)
      .ParamByName('controle', 0)
      .ParamByName('empresa', EmptyStr)
      .ParamByName('centro_custo', 0)
      .ParamByName('requisicao_ano', 0)
      .ParamByName('requisicao_cod', 0)
    .Open;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
end;

destructor TModelDAORequisicaoAlmoxarifadoProduto.Destroy;
begin
  inherited;
end;

class function TModelDAORequisicaoAlmoxarifadoProduto.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAORequisicaoAlmoxarifadoProduto.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('descri').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('descri_apresentacao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('unp_sigla').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('unidade_sigla').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('estoque').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('reserva').ProviderFlags    := [];
  FConn.Query.DataSet.FieldByName('disponivel').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('disponivel_tmp').ProviderFlags := [];
end;

procedure TModelDAORequisicaoAlmoxarifadoProduto.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_ITEM_REQUISICAO_ALMOX_PEN : Text := 'Pendente';
    STATUS_ITEM_REQUISICAO_ALMOX_AGU : Text := 'Aguardando';
    STATUS_ITEM_REQUISICAO_ALMOX_ATE : Text := 'Atendido';
    STATUS_ITEM_REQUISICAO_ALMOX_ENT : Text := 'Entregue';
    STATUS_ITEM_REQUISICAO_ALMOX_CAN : Text := 'Cancelado';
  end;
end;

procedure TModelDAORequisicaoAlmoxarifadoProduto.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('STATUS').OnGetText := StatusGetText;
end;

procedure TModelDAORequisicaoAlmoxarifadoProduto.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (FieldByName('STATUS').AsInteger in [STATUS_ITEM_REQUISICAO_ALMOX_PEN, STATUS_ITEM_REQUISICAO_ALMOX_AGU]) then
      FieldByName('DISPONIVEL_TMP').AsCurrency := (FieldByName('DISPONIVEL').AsCurrency + FieldByName('QTDE').AsCurrency)
    else
      FieldByName('DISPONIVEL_TMP').AsCurrency := FieldByName('DISPONIVEL').AsCurrency;
  end;
end;

procedure TModelDAORequisicaoAlmoxarifadoProduto.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANO').AsInteger := YearOf(Now);
    FieldByName('CONTROLE').Clear;
    FieldByName('QTDE').AsCurrency  := 1;
    FieldByName('QTDE_ATENDIDA').AsCurrency := 0.0;
    FieldByName('STATUS').AsInteger := STATUS_ITEM_REQUISICAO_ALMOX_PEN;
    FieldByName('CUSTO').AsCurrency := 0.0;
    FieldByName('TOTAL').AsCurrency := 0.0;
    FieldByName('PRODUTO').Clear;
    FieldByName('DESCRI_APRESENTACAO').Clear;
    FieldByName('UNIDADE').Clear;
    FieldByName('UNP_SIGLA').Clear;
    FieldByName('ESTOQUE').Clear;
    FieldByName('RESERVA').Clear;
    FieldByName('DISPONIVEL').Clear;
    FieldByName('DISPONIVEL_TMP').Clear;
  end;
end;

{ TModelDAOTipoRequisicaoAlmoxView }

constructor TModelDAOTipoRequisicaoAlmoxView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select       ')
        .Add('  a.codigo,  ')
        .Add('  a.descricao')
        .Add('from VW_TIPO_REQUISICAO_ALMOX a')
      .&End
    .Open;
end;

destructor TModelDAOTipoRequisicaoAlmoxView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoRequisicaoAlmoxView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoRequisicaoAlmoxView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

end.

