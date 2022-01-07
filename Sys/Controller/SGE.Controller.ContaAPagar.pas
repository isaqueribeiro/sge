unit SGE.Controller.ContaAPagar;

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
  // Contas A Pagar
  TControllerContaAPagar = class(TController, IControllerContaAPagar)
    private
      procedure DataSetBeforeDelete(DataSet: TDataSet);
    protected
      FPagamentos : IControllerCustom;
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerContaAPagar;

      procedure GerarDuplicatas(aAnoCOmpra, aNumCompra : Integer);
      procedure CarregarPagamentos;

      function Pagamentos : IControllerCustom;
  end;

  // Pagamentos (Contas A Pagar)
  TControllerPagamento = class(TController, IControllerPagamento)
    private
      FContaCorrente : Integer;
      procedure RecalcularSaldo(aContaCorrente : Integer);
      procedure Recalcular;
      procedure Recalculado(Sender : TObject);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerPagamento;

      procedure EstornarPagamento(aUsuario : String; aContaCorrente : Integer);
  end;

implementation

{ TControllerContaAPagar }

constructor TControllerContaAPagar.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaAPagar);
  FDAO.DataSet.BeforeDelete := DataSetBeforeDelete;
end;

destructor TControllerContaAPagar.Destroy;
begin
  inherited;
end;

class function TControllerContaAPagar.New: IControllerContaAPagar;
begin
  Result := Self.Create;
end;

procedure TControllerContaAPagar.DataSetBeforeDelete(DataSet: TDataSet);
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
      aScriptSQL.Add('where APAGAR_ANO = ' + FDAO.DataSet.FieldByName('ANOLANC').AsString);
      aScriptSQL.Add('  and APAGAR_NUM = ' + FDAO.DataSet.FieldByName('NUMLANC').AsString);
    end
    else
    begin
      aScriptSQL.Add('Update TBCAIXA_MOVIMENTO Set');
      aScriptSQL.Add('    APAGAR_ANO = null');
      aScriptSQL.Add('  , APAGAR_NUM = null');
      aScriptSQL.Add('where APAGAR_ANO = ' + FDAO.DataSet.FieldByName('ANOLANC').AsString);
      aScriptSQL.Add('  and APAGAR_NUM = ' + FDAO.DataSet.FieldByName('NUMLANC').AsString);
    end;
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerContaAPagar.GerarDuplicatas(aAnoCompra, aNumCompra: Integer);
var
  aDAO : IModelDAOCustom;
begin
  try
    aDAO := TModelDAOFactory.New.Busca;
    aDAO
      .Clear
      .SQL('Select')
      .SQL('    g.fornecedor ')
      .SQL('  , g.notafiscal ')
      .SQL('  , g.parcelas   ')
      .SQL('  , g.valor_total')
      .SQL('  , g.parcela    ')
      .SQL('  , g.emissao    ')
      .SQL('  , g.vencimento ')
      .SQL('  , g.valor_documento')
      .SQL('  , g.forma_pagto    ')
      .SQL('  , g.condicao_pagto ')
      .SQL('  , g.data_entrada   ')
      .SQL('  , g.ano_lanc       ')
      .SQL('  , g.num_lanc       ')
      .SQL('from SET_GERAR_DUPLICATAS(:anocompra, :numcompra) g')
      .ParamsByName('anocompra', aAnoCompra)
      .ParamsByName('numcompra', aNumCompra)
      .OpenOrExecute;
  finally
    aDAO.CommitTransaction
  end;
end;

procedure TControllerContaAPagar.CarregarPagamentos;
begin
  if not Assigned(FPagamentos) then
    FPagamentos := TControllerPagamento.New;

  // Preparação para a entrada de parâmetros de pesquisa
  FPagamentos
    .DAO
    .Close
    .ClearWhere;

  FPagamentos
    .DAO
    .Where('p.anolanc = :ano')
    .Where('p.numlanc = :controle')
    .OrderBy('p.seq');

  FPagamentos
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('Anolanc').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('Numlanc').AsInteger)
    .Open;
end;

function TControllerContaAPagar.Pagamentos: IControllerCustom;
begin
  if not Assigned(FPagamentos) then
    FPagamentos := TControllerPagamento.New;

  Result := FPagamentos;
end;

{ TControllerPagamento }

constructor TControllerPagamento.Create;
begin
  inherited Create(TModelDAOFactory.New.Pagamento);
  FContaCorrente := 0;
end;

destructor TControllerPagamento.Destroy;
begin
  inherited;
end;

class function TControllerPagamento.New: IControllerPagamento;
begin
  Result := Self.Create;
end;

procedure TControllerPagamento.EstornarPagamento(aUsuario: String; aContaCorrente: Integer);
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

      // 1. Registrar estorno do pagamento no movimento do caixa
      aScriptSQL.BeginUpdate;
      aScriptSQL.Clear;
      aScriptSQL.Add('Execute Procedure SET_CAIXA_MOVIMENTO_PAG_ESTORNO (');
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

      // 2. Excluir registro de pagamento
      FDAO.DataSet.Delete;
      FDAO.ApplyUpdates;
      FDAO.CommitUpdates;

      // 3. Atualizar saldo a pagar
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
        aScriptSQL.Add('Update TBCONTPAG Set');
        aScriptSQL.Add('    QUITADO      = 0');
        aScriptSQL.Add('  , VALORMULTA   = 0.0');
        aScriptSQL.Add('  , VALORPAGTOT  = 0.0');
        aScriptSQL.Add('  , VALORSALDO   = VALORPAG');
        aScriptSQL.Add('  , HISTORIC = ''Pagamento estornado por ' + aUsuario + ''' ');
        aScriptSQL.Add('  , DTPAG    = null');
        aScriptSQL.Add('  , DOCBAIX  = null');
        aScriptSQL.Add('  , TIPPAG   = null');
        aScriptSQL.Add('  , NUMCHQ   = null');
        aScriptSQL.Add('  , BANCO    = null');
        aScriptSQL.Add('where ANOLANC = ' + aAnoConta);
        aScriptSQL.Add('  and NUMLANC = ' + aNumConta);
      end
      else
      begin
        aScriptSQL.Add('Update TBCONTPAG Set');
        aScriptSQL.Add('    QUITADO      = 0');
        aScriptSQL.Add('  , VALORMULTA   = 0.0');
        aScriptSQL.Add('  , VALORPAGTOT  = ' + FormatFloat('#############0.00', aValorPago).Replace(',', '.', []) );
        aScriptSQL.Add('  , VALORSALDO   = (VALORPAG - ' + FormatFloat('#############0.00', aValorPago).Replace(',', '.', []) + ')');
        aScriptSQL.Add('  , HISTORIC = ''Pagamento estornado por ' + aUsuario + ''' ');
        aScriptSQL.Add('  , DTPAG    = ' + QuotedStr(FormatDateTime('yyyy-mm-yy', aDataPagto)));
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

procedure TControllerPagamento.RecalcularSaldo(aContaCorrente: Integer);
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

procedure TControllerPagamento.Recalcular;
begin
  raise Exception.Create('(Recalcular) Recurso não implementado!');
end;

procedure TControllerPagamento.Recalculado(Sender: TObject);
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
