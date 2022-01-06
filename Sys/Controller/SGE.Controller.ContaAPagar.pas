unit SGE.Controller.ContaAPagar;

interface

uses
  System.SysUtils,
  System.Classes,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Contas A Pagar
  TControllerContaAPagar = class(TController, IControllerContaAPagar)
    private
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

      procedure EstornarPagamento(aUsuario : String; aTipoMovimento : TTipoMovimentoCaixa; aContaCorrente : Integer); virtual; abstract;
  end;

implementation

{ TControllerContaAPagar }

constructor TControllerContaAPagar.Create;
begin
  inherited Create(TModelDAOFactory.New.ContaAPagar);
end;

destructor TControllerContaAPagar.Destroy;
begin
  inherited;
end;

class function TControllerContaAPagar.New: IControllerContaAPagar;
begin
  Result := Self.Create;
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
    Self.CarregarPagamentos;

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
      ;
  end;
end;

end.
