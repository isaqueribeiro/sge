unit SGE.Model.DAO.Cheque;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Table
  TModelDAOCheque = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure DataSetAfterOpen(DataSet: TDataSet);
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);

      procedure EmissorCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom; virtual; abstract;
  end;

  // View
  TModelDAOTipoChequeView = class(TModelDAO, IModelDAOCustom)
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
  UConstantesDGE,
  Service.Utils;

{ TModelDAOCheque }

constructor TModelDAOCheque.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCHEQUE')
      .AliasTableName('c')
      .KeyFields('controle')
      .AutoIncFields('controle')
      .GeneratorName('GEN_CONTROLE_CHEQUE')
      .SQL
        .Clear
        .Add('Select            ')
        .Add('    c.controle    ')
        .Add('  , c.empresa     ')
        .Add('  , c.tipo        ')
        .Add('  , c.banco       ')
        .Add('  , c.agencia     ')
        .Add('  , c.conta       ')
        .Add('  , c.numero      ')
        .Add('  , c.fornecedor  ')
        .Add('  , c.cliente     ')
        .Add('  , c.data_emissao')
        .Add('  , c.data_apresentacao')
        .Add('  , c.data_devolucao   ')
        .Add('  , c.data_compensacao ')
        .Add('  , c.valor            ')
        .Add('  , c.nominal_a        ')
        .Add('  , c.data_cadastro    ')
        .Add('  , c.usuario_cadastro ')
        .Add('  , c.status           ')
        .Add('  , c.obs              ')
        .Add('  ')
        .Add('  , sc.descricao     as status_descricao')
        .Add('  , bc.nome          as banco_nome')
        .Add('  ')
        .Add('  , coalesce(cc.nome, fc.nomeforn)               as emissor_nome')
        .Add('  , coalesce(cc.cnpj, fc.cnpj)                   as emissor_cnpj')
        .Add('  , coalesce(cc.pessoa_fisica, fc.pessoa_fisica) as emissor_pf  ')
        .Add('  ')
        .Add('  , cc.nome          as cliente_nome')
        .Add('  , cc.cnpj          as cliente_cnpj')
        .Add('  , cc.pessoa_fisica as cliente_pf  ')
        .Add('  ')
        .Add('  , fc.nomeforn      as fornecedor_nome')
        .Add('  , fc.cnpj          as fornecedor_cnpj')
        .Add('  , fc.pessoa_fisica as fornecedor_pf  ')
        .Add('from TBCHEQUE c')
        .Add('  left join VW_STATUS_CHEQUE sc on (sc.codigo = c.status) ')
        .Add('  left join TBCLIENTE cc on (cc.codigo = c.cliente)       ')
        .Add('  left join TBFORNECEDOR fc on (fc.codforn = c.fornecedor)')
        .Add('  left join TBBANCO bc on (bc.cod = c.banco)              ')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOCheque.Destroy;
begin
  inherited;
end;

class function TModelDAOCheque.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOCheque.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('status_descricao').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('banco_nome').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('emissor_nome').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('emissor_cnpj').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('emissor_pf').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('cliente_nome').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('cliente_cnpj').ProviderFlags     := [];
  FConn.Query.DataSet.FieldByName('cliente_pf').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('fornecedor_nome').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('fornecedor_cnpj').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('fornecedor_pf').ProviderFlags    := [];
end;

procedure TModelDAOCheque.EmissorCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if (Sender.DataSet.FieldByName('emissor_pf').AsInteger = 1) then
      Text := TServicesUtils.StrFormatarCpf(Trim(Sender.AsString))
    else
      Text := TServicesUtils.StrFormatarCnpj(Trim(Sender.AsString));
  end;
end;

procedure TModelDAOCheque.StatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      STATUS_CHEQUE_PENDENTE    : Text := 'Pendente';
      STATUS_CHEQUE_APRESENTADO : Text := 'Apresentado';
      STATUS_CHEQUE_DEVOLVIDO   : Text := 'Devolvido';
      STATUS_CHEQUE_COMPENSADO  : Text := 'Compensado';
      STATUS_CHEQUE_CANCELADO   : Text := 'Cancelado';
      else
        Text := Sender.AsString;
    end;
end;

procedure TModelDAOCheque.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('emissor_cnpj').OnGetText := EmissorCNPJGetText;
  FConn.Query.DataSet.FieldByName('status').OnGetText       := StatusGetText;
end;

procedure TModelDAOCheque.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('EMPRESA').AsString := FUsuario.Empresa.CNPJ;
    FieldByName('STATUS').AsInteger := STATUS_CHEQUE_PENDENTE;
    FieldByName('OBS').AsString     := '...';
    FieldByName('DATA_CADASTRO').AsDateTime  := Date;
    FieldByName('USUARIO_CADASTRO').AsString := FUsuario.Login;
    FieldByName('TIPO').Clear;
    FieldByName('BANCO').Clear;
    FieldByName('AGENCIA').Clear;
    FieldByName('CONTA').Clear;
    FieldByName('NUMERO').Clear;
    FieldByName('VALOR').Clear;
    FieldByName('DATA_EMISSAO').Clear;
    FieldByName('DATA_APRESENTACAO').Clear;
    FieldByName('DATA_DEVOLUCAO').Clear;
    FieldByName('DATA_COMPENSACAO').Clear;
    FieldByName('NOMINAL_A').Clear;
  end;
end;

procedure TModelDAOCheque.DataSetBeforePost(DataSet: TDataSet);
begin
  ;
end;

{ TModelDAOTipoChequeView }

constructor TModelDAOTipoChequeView.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select 1 as Codigo, ''Emitido''  as Descricao from RDB$DATABASE Union')
        .Add('Select 2 as Codigo, ''Recebido'' as Descricao from RDB$DATABASE      ')
      .&End
    .Open;
end;

destructor TModelDAOTipoChequeView.Destroy;
begin
  inherited;
end;

class function TModelDAOTipoChequeView.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

function TModelDAOTipoChequeView.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  if not FConn.Query.DataSet.Active then
    FConn.Query.Open;
end;

end.
