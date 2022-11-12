unit SGE.Model.DAO.ContaAReceber;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  // Contas A Receber
  TModelDAOContaAReceber = class(TModelDAO, IModelDAOCustom)
    private
      procedure SetProviderFlags;
      procedure BaixadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

  // Recebimentos (Contas A Receber)
  TModelDAORecebimento = class(TModelDAO, IModelDAOCustom)
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

{ TModelDAOContaAReceber }

uses
  System.DateUtils,
  Service.Utils,
  UConstantesDGE;

constructor TModelDAOContaAReceber.Create;
begin
  inherited Create;
  FConn.Query.CreateGenerator('GEN_CONTAREC_NUM', FormatDateTime('yyyy', Date).ToInteger);
  FConn
    .Query
      .TableName('TBCONTREC')
      .AliasTableName('r')
      .KeyFields('Anolanc;Numlanc')
      .AutoIncFields('Numlanc')
      .GeneratorName('GEN_CONTAREC_NUM_' + FormatDateTime('yyyy', Date))
      .SQL
        .Clear
        .Add('Select       ')
        .Add('    r.Anolanc')
        .Add('  , r.Numlanc')
        .Add('  , r.Parcela')
        .Add('  , r.Empresa')
        .Add('  , r.Cliente')
        .Add('  , r.Cnpj   ')
        .Add('  , r.Forma_pagto')
        .Add('  , r.Tippag     ')
        .Add('  , r.Codtprec')
        .Add('  , r.Historic')
        .Add('  , r.Numrec  ')
        .Add('  , r.Dtemiss ')
        .Add('  , r.Dtvenc  ')
        .Add('  , r.Dtrec   ')
        .Add('  , r.Docbaix ')
        .Add('  , r.Valorrec')
        .Add('  , r.Valormulta ')
        .Add('  , r.Valorrectot')
        .Add('  , r.Numcontrato')
        .Add('  , r.Codbanco   ')
        .Add('  , r.Nossonumero')
        .Add('  , r.Remessa    ')
        .Add('  , r.Valorsaldo ')
        .Add('  , r.Percentjuros')
        .Add('  , r.Percentmulta')
        .Add('  , r.Percentdesconto   ')
        .Add('  , r.Dataprocessoboleto')
        .Add('  , r.Baixado ')
        .Add('  , r.Enviado ')
        .Add('  , r.Anovenda')
        .Add('  , r.Numvenda')
        .Add('  , r.AnoOS   ')
        .Add('  , r.NumOS   ')
        .Add('  , r.Situacao')
        .Add('  , r.Lote')
        .Add('  , r.Competencia_apuracao')
        .Add('  , lpad(r.Anolanc, 4, ''0'') || lpad(r.Numlanc, 6, ''0'') as Lancamento')
        .Add('  , c.Nome as NomeCliente ')
        .Add('  , Case when r.Baixado = 1 then ''X'' else ''.'' end as Pago_ ')
        .Add('  , vn.Serie as nfe_serie')
        .Add('  , vn.Nfe   as nfe_numero')
        .Add('  , right(''0000000'' || vn.Nfe, 7) || ''/'' || trim(vn.Serie) as nfe_venda')
        .Add('  , os.nfs_serie ')
        .Add('  , os.nfs_numero')
        .Add('  , right(''0000000'' || os.nfs_numero, 7) || ''/'' || trim(os.nfs_serie) as nfse_os')
        .Add('from TBCONTREC r ')
        .Add('  left join TBCLIENTE c on (c.Codigo = r.Cliente)')
        .Add('  left join TBVENDAS vn on (vn.Ano = r.Anovenda and vn.Codcontrol = r.Numvenda)')
        .Add('  left join TBOS os on (os.Ano = r.AnoOS and os.Controle = r.NumOS)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

destructor TModelDAOContaAReceber.Destroy;
begin
  inherited;
end;

class function TModelDAOContaAReceber.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAOContaAReceber.CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if (Sender.DataSet.FieldByName('Cnpj').AsString = EmptyStr) then
    Text := EmptyStr
  else
  if TServicesUtils.StrIsCPF(Sender.DataSet.FieldByName('Cnpj').AsString) then
    Text := TServicesUtils.StrFormatarCpf(Sender.DataSet.FieldByName('Cnpj').AsString)
  else
  if TServicesUtils.StrIsCNPJ(Sender.DataSet.FieldByName('Cnpj').AsString) then
    Text := TServicesUtils.StrFormatarCnpj(Sender.DataSet.FieldByName('Cnpj').AsString);
end;

procedure TModelDAOContaAReceber.BaixadoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if (Sender.DataSet.FieldByName('situacao').AsInteger = 0) then
    Text := 'Cancelado'
  else
    Case Sender.AsInteger of
      STATUS_ARECEBER_PENDENTE : Text := 'A Receber';
      STATUS_ARECEBER_PAGO     : Text := 'Recebido';
      else
        Text := Sender.AsString;
    end;
end;

procedure TModelDAOContaAReceber.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Lancamento').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('Pago_').ProviderFlags       := [];
  FConn.Query.DataSet.FieldByName('NomeCliente').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('nfe_venda').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('nfe_serie').ProviderFlags   := [];
  FConn.Query.DataSet.FieldByName('nfe_numero').ProviderFlags  := [];
  FConn.Query.DataSet.FieldByName('nfse_os').ProviderFlags     := [];
end;

procedure TModelDAOContaAReceber.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
  FConn.Query.DataSet.FieldByName('CNPJ').OnGetText    := CpfCnpjGetText;
  FConn.Query.DataSet.FieldByName('BAIXADO').OnGetText := BaixadoGetText;
end;

procedure TModelDAOContaAReceber.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('COMPETENCIA_APURACAO').AsInteger := FormatDateTime('yyyymm', FieldByName('DTEMISS').AsDateTime).ToInteger;

    if ( (FieldByName('ANOVENDA').AsInteger = 0) and (FieldByName('PARCELA').AsInteger <= 0) ) then
      FieldByName('PARCELA').AsInteger := 1;

    FieldByName('VALORSALDO').AsCurrency := FieldByName('VALORREC').AsCurrency;
  end;
end;

procedure TModelDAOContaAReceber.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('ANOLANC').AsInteger  := YearOf(Date);
    FieldByName('EMPRESA').AsString   := Usuario.Empresa.CNPJ;
    FieldByName('PARCELA').AsInteger  := 1;
    FieldByName('DTEMISS').AsDateTime := Date;
    FieldByName('COMPETENCIA_APURACAO').AsInteger := FormatDateTime('yyyymm', Date).ToInteger;
    FieldByName('BAIXADO').AsInteger  := STATUS_ARECEBER_PENDENTE;
    FieldByName('ENVIADO').AsInteger  := 0;
    FieldByName('SITUACAO').AsInteger := 1; // Ativa
    FieldByName('LOTE').AsString      := EmptyStr;
    FieldByName('TIPPAG').AsString    := EmptyStr;
    FieldByName('FORMA_PAGTO').AsInteger    := Configuracao.Padrao.FormaPagtoID;
    FieldByName('HISTORIC').AsString        := '...';
    FieldByName('VALORRECTOT').AsCurrency     := 0;
    FieldByName('VALORSALDO').AsCurrency      := 0;
    FieldByName('VALORMULTA').AsCurrency      := 0;
    FieldByName('PERCENTJUROS').AsCurrency    := 0;
    FieldByName('PERCENTMULTA').AsCurrency    := 0;
    FieldByName('PERCENTDESCONTO').AsCurrency := 0;
    FieldByName('CODTPREC').Clear;
    FieldByName('ANOVENDA').Clear;
    FieldByName('NUMVENDA').Clear;
    FieldByName('ANOOS').Clear;
    FieldByName('NUMOS').Clear;
    FieldByName('CODTPREC').Clear;
  end;
end;

{ TModelDAORecebimento }

constructor TModelDAORecebimento.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCONTREC_BAIXA')
      .AliasTableName('p')
      .KeyFields('anolanc;numlanc;seq')
      .SQL
        .Clear
        .Add('Select       ')
        .Add('    p.Anolanc')
        .Add('  , p.Numlanc')
        .Add('  , p.Seq    ')
        .Add('  , p.Historico  ')
        .Add('  , p.Data_pagto ')
        .Add('  , p.Forma_pagto')
        .Add('  , p.Valor_baixa')
        .Add('  , p.controle_cheque')
        .Add('  , p.Numero_cheque  ')
        .Add('  , p.empresa        ')
        .Add('  , p.banco          ')
        .Add('  , p.banco_febraban ')
        .Add('  , p.Documento_baixa')
        .Add('  , p.usuario')
        .Add('  , f.Descri as Forma_pagto_desc')
        .Add('  , coalesce(b2.nome, b1.bco_nome) as bco_nome')
        .Add('from TBCONTREC_BAIXA p')
        .Add('  left join TBFORMPAGTO f on (f.Cod = p.Forma_pagto)')
        .Add('  left join TBBANCO_BOLETO b1 on (b1.Bco_cod = p.Banco and b1.empresa = p.empresa)')
        .Add('  left join TBBANCO b2 on (b2.cod = p.banco_febraban)')
      .&End
    .OpenEmpty
    .CloseEmpty;

  FConn.Query.DataSet.AfterOpen   := DataSetAfterOpen;
  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

procedure TModelDAORecebimento.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

procedure TModelDAORecebimento.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('HISTORICO').AsString := AnsiUpperCase(Trim(FieldByName('HISTORICO').AsString));

    // Remover o "." (ponto final) do texto
    if (Copy(FieldByName('HISTORICO').AsString, Length(FieldByName('HISTORICO').AsString), 1) = '.') then
      FieldByName('HISTORICO').AsString := Copy(FieldByName('HISTORICO').AsString, 1, Length(FieldByName('HISTORICO').AsString) - 1);
  end;
end;

procedure TModelDAORecebimento.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('SEQ').AsInteger         := 1;
    FieldByName('data_pagto').AsDateTime := Date;
    FieldByName('usuario').AsString      := Usuario.Login;
    FieldByName('forma_pagto').AsInteger := Configuracao.Padrao.FormaPagtoID;
    FieldByName('controle_cheque').Clear;
    FieldByName('empresa').Clear;
    FieldByName('banco').Clear;
    FieldByName('banco_febraban').Clear;
  end;
end;

destructor TModelDAORecebimento.Destroy;
begin
  inherited;
end;

class function TModelDAORecebimento.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

procedure TModelDAORecebimento.SetProviderFlags;
begin
  // Ignorar campos no Insert e Update
  FConn.Query.DataSet.FieldByName('Forma_pagto_desc').ProviderFlags := [];
  FConn.Query.DataSet.FieldByName('bco_nome').ProviderFlags := [];
end;

end.
