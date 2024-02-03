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
//
//  // Movimentações do Caixa (Table)
//  TModelDAOCaixaMovimento = class(TModelDAO, IModelDAOCustom)
//    private
//      procedure SetProviderFlags;
//      procedure DataSetAfterOpen(DataSet: TDataSet);
//      procedure DataSetNewRecord(DataSet: TDataSet);
//      procedure DataSetBeforePost(DataSet: TDataSet);
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

end.
