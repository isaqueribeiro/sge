unit SGE.Controller.ContaAReceber;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Contas A Receber
  TControllerContaAReceber = class(TController, IControllerContaAReceber)
    private
      procedure DataSetBeforeDelete(DataSet: TDataSet);
    protected
      FRecebimentos : IControllerCustom;
      FBusca : IModelDAOCustom;
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContaAReceber;

      procedure GerarTitulos(aAnoVenda, aNumVenda : Integer);
      procedure CarregarRecebimentos;

      function Recebimentos : IControllerCustom;
      function MenorVencimentoAReceber : TDateTime;
  end;

  // Recebimentos (Contas A Receber)
  TControllerRecebimento = class(TController, IControllerRecebimento)
    private
      FSequencial : IModelDAOCustom;
      FContaCorrente : Integer;
      FDataMovimento : TDateTime;
      FCalculandoSaldoDiario : Boolean;
      procedure Recalcular;
      procedure Recalculado(Sender : TObject);
      procedure GerarSaldo;
      procedure SaldoGerado(Sender : TObject);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerRecebimento;

      procedure GerarMovimentoCaixa(aUsuario : String);
      procedure EstornarRecebimento(aUsuario : String; aContaCorrente : Integer);
      procedure GerarSaldoConta(const aContaCorrente : Integer; const aDataMovimento : TDateTime);
      procedure RecalcularSaldo(aContaCorrente : Integer);

      function GerarSequencial(const aDataSet : TDataSet; const aCampo : String; var aSequencial : Integer) : IController; override;
      function Sequencial(const aCampo : String) : Integer;
  end;

implementation

{ TControllerContaAReceber }

constructor TControllerContaAReceber.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaAReceber);
  FDAO.DataSet.BeforeDelete := DataSetBeforeDelete;
end;

destructor TControllerContaAReceber.Destroy;
begin
  inherited;
end;

class function TControllerContaAReceber.New: IControllerContaAReceber;
begin
  Result := Self.Create;
end;

procedure TControllerContaAReceber.DataSetBeforeDelete(DataSet: TDataSet);
var
  aScriptSQL : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    // Eliminar Movimento do Caixa quando o lançamento for excluído pelo SYSTEM ADM
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    if (FDAO.Usuario.Funcao.Codigo in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_SYSTEM_ADM]) then
    begin
      aScriptSQL.Add('Delete from TBCAIXA_MOVIMENTO');
      aScriptSQL.Add('where ARECEBER_ANO = ' + FDAO.DataSet.FieldByName('ANOLANC').AsString);
      aScriptSQL.Add('  and ARECEBER_NUM = ' + FDAO.DataSet.FieldByName('NUMLANC').AsString);
    end
    else
    begin
      aScriptSQL.Add('Update TBCAIXA_MOVIMENTO Set');
      aScriptSQL.Add('    ARECEBER_ANO = null');
      aScriptSQL.Add('  , ARECEBER_NUM = null');
      aScriptSQL.Add('where ARECEBER_ANO = ' + FDAO.DataSet.FieldByName('ANOLANC').AsString);
      aScriptSQL.Add('  and ARECEBER_NUM = ' + FDAO.DataSet.FieldByName('NUMLANC').AsString);
    end;
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerContaAReceber.GerarTitulos(aAnoVenda, aNumVenda: Integer);
var
  aDAO : IModelDAOCustom;
begin
  try
    aDAO := TModelDAOFactory.New.Busca;
    aDAO
      .Clear
      .SQL('Select')
      .SQL('    g.cliente_cod ')
      .SQL('  , g.cliente_cnpj')
      .SQL('  , g.notafiscal  ')
      .SQL('  , g.parcelas    ')
      .SQL('  , g.valor_total ')
      .SQL('  , g.parcela     ')
      .SQL('  , g.emissao     ')
      .SQL('  , g.vencimento  ')
      .SQL('  , g.valor_documento')
      .SQL('  , g.forma_pagto    ')
      .SQL('  , g.condicao_pagto ')
      .SQL('  , g.data_finaliz_venda')
      .SQL('  , g.ano_lanc       ')
      .SQL('  , g.num_lanc       ')
      .SQL('from SET_GERAR_TITULOS(:anovenda, :numvenda) g')
      .ParamsByName('anovenda', aAnoVenda)
      .ParamsByName('numvenda', aNumVenda)
      .OpenOrExecute;
  finally
    aDAO.CommitTransaction
  end;
end;

function TControllerContaAReceber.MenorVencimentoAReceber : TDateTime;
begin
  Result := Date;
  FBusca := TModelDAOFactory.New.Busca;
  FBusca
    .Close
    .Clear
    .SQL('Select')
    .SQL('  min(cr.dtvenc) as vencimento')
    .SQL('from TBCONTREC cr')
    .SQL('where (cr.empresa  = ' + QuotedStr(FBusca.Usuario.Empresa.CNPJ) + ')')
    .SQL('  and (cr.baixado  = 0)')
    .SQL('  and (cr.situacao = 1)')
    .Open;

  if (not FBusca.DataSet.FieldByName('vencimento').IsNull) then
    Result := FBusca.DataSet.FieldByName('vencimento').AsDateTime;
end;

procedure TControllerContaAReceber.CarregarRecebimentos;
begin
  if not Assigned(FRecebimentos) then
    FRecebimentos := TControllerRecebimento.New;

  // Preparação para a entrada de parâmetros de pesquisa
  FRecebimentos
    .DAO
    .Close
    .ClearWhere;

  FRecebimentos
    .DAO
    .Where('p.anolanc = :ano')
    .Where('p.numlanc = :controle')
    .OrderBy('p.seq');

  FRecebimentos
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('Anolanc').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('Numlanc').AsInteger)
    .Open;
end;

function TControllerContaAReceber.Recebimentos: IControllerCustom;
begin
  if not Assigned(FRecebimentos) then
    FRecebimentos := TControllerRecebimento.New;

  Result := FRecebimentos;
end;

{ TControllerRecebimento }

constructor TControllerRecebimento.Create;
begin
  inherited Create(TModelDAOFactory.New.Recebimento);
  FContaCorrente := 0;
  FDataMovimento := Date;
  FCalculandoSaldoDiario := False;
end;

destructor TControllerRecebimento.Destroy;
begin
  inherited;
end;

class function TControllerRecebimento.New: IControllerRecebimento;
begin
  Result := Self.Create;
end;

procedure TControllerRecebimento.GerarMovimentoCaixa(aUsuario: String);
var
  aScriptSQL : TStringList;
  aAnoConta,
  aNumConta,
  aValor   : String;
  aDataPagto : TDateTime;
  aValorPago : Currency;
begin
  aScriptSQL := TStringList.Create;
  aValorPago := FDAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency;
  try
    try
      aAnoConta  := FDAO.DataSet.FieldByName('ANOLANC').AsString;
      aNumConta  := FDAO.DataSet.FieldByName('NUMLANC').AsString;
      aDataPagto := FDAO.DataSet.FieldByName('DATA_PAGTO').AsDateTime + Time;
      aValor     := FormatFloat('#############0.00', FDAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency).Replace(',', '.', []);

      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Execute Procedure SET_CAIXA_MOVIMENTO_REC (');
      aScriptSQL.Add('    ' + aUsuario.QuotedString);
      aScriptSQL.Add('  , ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', aDataPagto)));
      aScriptSQL.Add('  , ' + FDAO.DataSet.FieldByName('FORMA_PAGTO').AsString);
      aScriptSQL.Add('  , ' + aAnoConta);
      aScriptSQL.Add('  , ' + aNumConta);
      aScriptSQL.Add('  , ' + FDAO.DataSet.FieldByName('SEQ').AsString);
      aScriptSQL.Add('  , ' + aValor);
      aScriptSQL.Add(')');
      aScriptSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    except
      On E : Exception do
        raise Exception.Create('Erro ao tentar gerar movimento no caixa.' + #13#13 + E.Message);
    end;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerRecebimento.EstornarRecebimento(aUsuario: String; aContaCorrente: Integer);
var
  aScriptSQL : TStringList;
  aAnoConta,
  aNumConta,
  aValor   : String;
  aDataPagto : TDateTime;
  aValorPago : Currency;
begin
  if (not FDAO.DataSet.IsEmpty) then
  begin
    aScriptSQL := TStringList.Create;
    FDAO.DataSet.DisableControls;
    try
      aAnoConta := FDAO.DataSet.FieldByName('ANOLANC').AsString;
      aNumConta := FDAO.DataSet.FieldByName('NUMLANC').AsString;
      aValor    := FormatFloat('#############0.00', FDAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency).Replace(',', '.', []);

      // 1. Registrar estorno do recebimento no movimento do caixa
      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Execute Procedure SET_CAIXA_MOVIMENTO_REC_ESTORNO (');
      aScriptSQL.Add('    ' + aUsuario.Trim.QuotedString);
      aScriptSQL.Add('  , ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', FDAO.DataSet.FieldByName('DATA_PAGTO').AsDateTime + Time)));
      aScriptSQL.Add('  , ' + FDAO.DataSet.FieldByName('FORMA_PAGTO').AsString);
      aScriptSQL.Add('  , ' + aAnoConta);
      aScriptSQL.Add('  , ' + aNumConta);
      aScriptSQL.Add('  , ' + FDAO.DataSet.FieldByName('SEQ').AsString);
      aScriptSQL.Add('  , ' + aValor);
      aScriptSQL.Add(')');
      aScriptSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aScriptSQL.Text);
      FDAO.CommitTransaction;

      // 2. Excluir registro de recebimento
      FDAO.DataSet.Delete;
      FDAO.ApplyUpdates;
      FDAO.CommitUpdates;

      // 3. Contabilizar valores recebidos para atualizar o saldo a Receber
      aValorPago := 0.0;
      FDAO.DataSet.First;
      while not FDAO.DataSet.Eof do
      begin
        aValorPago := aValorPago + FDAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency;
        aDataPagto := FDAO.DataSet.FieldByName('DATA_PAGTO').AsDateTime;
        FDAO.DataSet.Next;
      end;

      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;

      if (aValorPago = 0.0) then
      begin
        aScriptSQL.Add('Update TBCONTREC Set');
        aScriptSQL.Add('    BAIXADO      = 0');
        aScriptSQL.Add('  , VALORMULTA   = 0.0');
        aScriptSQL.Add('  , VALORRECTOT  = 0.0');
        aScriptSQL.Add('  , VALORSALDO   = VALORREC');
        aScriptSQL.Add('  , HISTORIC = ''Recebimento estornado por ' + aUsuario + ''' ');
        aScriptSQL.Add('  , DTREC    = null');
        aScriptSQL.Add('  , DOCBAIX  = null');
        aScriptSQL.Add('  , TIPPAG   = null');
        aScriptSQL.Add('  , NUMCHQ   = null');
        aScriptSQL.Add('  , BANCO    = null');
        aScriptSQL.Add('where ANOLANC = ' + aAnoConta);
        aScriptSQL.Add('  and NUMLANC = ' + aNumConta);
      end
      else
      begin
        aScriptSQL.Add('Update TBCONTREC Set');
        aScriptSQL.Add('    BAIXADO      = 0');
        aScriptSQL.Add('  , VALORMULTA   = 0.0');
        aScriptSQL.Add('  , VALORRECTOT  = ' + FormatFloat('#############0.00', aValorPago).Replace(',', '.', []) );
        aScriptSQL.Add('  , VALORSALDO   = (VALORREC - ' + FormatFloat('#############0.00', aValorPago).Replace(',', '.', []) + ')');
        aScriptSQL.Add('  , HISTORIC = ''Recebimento estornado por ' + aUsuario + ''' ');
        aScriptSQL.Add('  , DTREC    = ' + QuotedStr(FormatDateTime('yyyy-mm-yy', aDataPagto)));
        aScriptSQL.Add('  , DOCBAIX  = null');
        aScriptSQL.Add('  , TIPPAG   = null');
        aScriptSQL.Add('  , NUMCHQ   = null');
        aScriptSQL.Add('  , BANCO    = null');
        aScriptSQL.Add('where ANOLANC = ' + aAnoConta);
        aScriptSQL.Add('  and NUMLANC = ' + aNumConta);
      end;

      aScriptSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aScriptSQL.Text);
      FDAO.CommitTransaction;

      // 4. Recalcular saldo da conta corrente
      Self.RecalcularSaldo(aContaCorrente);
    finally
      FDAO.DataSet.First;
      FDAO.DataSet.EnableControls;

      aScriptSQL.DisposeOf;
    end;
  end;
end;

procedure TControllerRecebimento.GerarSaldoConta(const aContaCorrente: Integer; const aDataMovimento: TDateTime);
var
  aThread : TThread;
begin
  FContaCorrente := aContaCorrente;
  FDataMovimento := aDataMovimento;

  if (not FCalculandoSaldoDiario) and (FContaCorrente > 0) and (FDataMovimento <> EncodeDate(1899, 12, 31)) then
  begin
    aThread := TThread.CreateAnonymousThread(GerarSaldo);
    aThread.OnTerminate := SaldoGerado;
    aThread.Start;
  end;
end;

function TControllerRecebimento.GerarSequencial(const aDataSet: TDataSet; const aCampo: String;
  var aSequencial: Integer): IController;
begin
  if not Assigned(FSequencial) then
  begin
    FSequencial := TModelDAOFactory.New.Busca;
    FSequencial.DataSet.Close;
    FSequencial
      .Clear
      .SQL('Select')
      .SQL('    max(' + aCampo + ') as Sequencial')
      .SQL('from TBCONTREC_BAIXA')
      .Where('anolanc = :ano')
      .Where('numlanc = :numero')
  end;

  FSequencial
    .Close
    .ParamsByName('ano', FDAO.DataSet.FieldByName('ANOLANC').AsInteger)
    .ParamsByName('numero', FDAO.DataSet.FieldByName('NUMLANC').AsInteger)
    .Open;

  aSequencial := (FSequencial.DataSet.FieldByName('Sequencial').AsInteger + 1);
end;

procedure TControllerRecebimento.GerarSaldo;
var
  aScriptSQL : TStringList;
begin
  aScriptSQL := TStringList.Create;
  FCalculandoSaldoDiario := True;
  try
    try
      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Execute Procedure SET_CONTA_CORRENTE_SALDO (');
      aScriptSQL.Add('    ' + FContaCorrente.ToString);
      aScriptSQL.Add('  , ' + QuotedStr(FormatDateTime('yyyy-mm-dd', FDataMovimento)));
      aScriptSQL.Add(')');
      aScriptSQL.EndUpdate;

      FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    except
      ON E : Exception do
        raise Exception.Create('Erro ao tentar atualizar saldo diário de conta corrente.' + #13#13 + E.Message);
    end;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerRecebimento.SaldoGerado(Sender: TObject);
begin
  FCalculandoSaldoDiario := False;
  if (Sender is TThread) then
  begin
    if Assigned(TThread(Sender).FatalException) then
      raise Exception.Create(Exception(TThread(Sender).FatalException).Message)
    else
      FDAO.CommitTransaction;
  end;
end;

function TControllerRecebimento.Sequencial(const aCampo: String): Integer;
begin
  if not Assigned(FSequencial) then
  begin
    FSequencial := TModelDAOFactory.New.Busca;
    FSequencial.DataSet.Close;
    FSequencial
      .Clear
      .SQL('Select')
      .SQL('    max(' + aCampo + ') as Sequencial')
      .SQL('from TBCONTREC_BAIXA')
      .Where('anolanc = :ano')
      .Where('numlanc = :numero')
  end;

  FSequencial
    .Close
    .ParamsByName('ano', FDAO.DataSet.FieldByName('ANOLANC').AsInteger)
    .ParamsByName('numero', FDAO.DataSet.FieldByName('NUMLANC').AsInteger)
    .Open;

  Result := (FSequencial.DataSet.FieldByName('Sequencial').AsInteger + 1);
end;

procedure TControllerRecebimento.RecalcularSaldo(aContaCorrente: Integer);
var
  aThread : TThread;
begin
  FContaCorrente := aContaCorrente;
  if (FContaCorrente > 0) then
  begin
    aThread := TThread.CreateAnonymousThread(Recalcular);
    aThread.OnTerminate := Recalculado;
    aThread.Start;
  end;
end;

procedure TControllerRecebimento.Recalcular;
begin
  raise Exception.Create('(Recalcular) Recurso não implementado!');
end;

procedure TControllerRecebimento.Recalculado(Sender: TObject);
begin
  if (Sender is TThread) then
  begin
    if Assigned(TThread(Sender).FatalException) then
      raise Exception.Create(Exception(TThread(Sender).FatalException).Message)
    else
      FDAO.CommitTransaction;
  end;
end;

end.
