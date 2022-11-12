unit View.ContaAReceber.Pagamento;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  cxControls,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  cxDBData,
  cxDBLookupComboBox,
  cxCalendar,
  cxCurrencyEdit,
  cxTextEdit,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,

  ACBrBase,
  ACBrExtenso,

  dxSkinsCore,
  dxSkinsDefaultPainters,
  dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog,

  UGrPadrao,
  UConstantesDGE,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Interfaces,
  SGE.Controller.Impressao.ContaAReceber;

type
  TTipoOrigemRecebimento = (toRecebimentoOutros, toRecebimentoVenda, toRecebimentoOS);
  TViewContaAReceberPagamento = class(TfrmGrPadrao)
    GrpBxPagamento: TGroupBox;
    Bevel1: TBevel;
    GrpBxLancamento: TGroupBox;
    lblAnoLanc: TLabel;
    Label3: TLabel;
    lblCliente: TLabel;
    edAnoLanc: TEdit;
    edNumLanc: TEdit;
    edCliente: TEdit;
    Bevel2: TBevel;
    dtsPagamentos: TDataSource;
    dtsBanco: TDataSource;
    dtsFormaPagto: TDataSource;
    lblDataPagto: TLabel;
    dbValorPago: TDBEdit;
    lblValorPago: TLabel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblDocBaixa: TLabel;
    dbDocBaixa: TDBEdit;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    lblInforme: TLabel;
    tmrAlerta: TTimer;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    dbDataPagto: TJvDBDateEdit;
    dtsBancoFebraban: TDataSource;
    lblNumeroCheque: TLabel;
    dbNumeroCheque: TJvDBComboEdit;
    procedure dtsPagamentosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrAlertaTimer(Sender: TObject);
    procedure dbNumeroChequeButtonClick(Sender: TObject);
    procedure dtsPagamentosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    CxContaCorrente  : Integer;
    FControllerBancoFebrabanView,
    FControllerFormaPagto       : IControllerCustom;
    FControllerRecebimento : IControllerRecebimento;
    FControllerCaixa : IControllerCaixa;
    FControllerBanco : IControllerBanco;

    procedure CarregarFormaPagto(const pEmpresa : String);
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCONTREC
  - TBEMPRESA
  - TBCLIENTE
  - TBCONTREC_BAIXA
  - TBBANCO_BOLETO
  - TBBANCO
  - TBFORMPAGTO

  Views:
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  ViewContaAReceberPagamento: TViewContaAReceberPagamento;

  function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
    const Ano, Lancamento, FormaPagto : Integer; const Cliente : String;
    var ContaCorrente : Integer; var DataPagto : TDateTime; var AReceber : Currency) : Boolean;

  function RegistrarPagamento(aEmpresa : String; LancAno, LanNumero : Integer; DataPagto : TDateTime; FormaPagto : Integer; ValorPago : Currency;
    pTipoOrigem : TTipoOrigemRecebimento; pAno, pControle : Integer) : Boolean;

implementation

uses
    Service.Message
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , View.Cheque;

{$R *.dfm}

function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
  const Ano, Lancamento, FormaPagto : Integer; const Cliente : String;
  var ContaCorrente : Integer; var DataPagto : TDateTime; var AReceber : Currency) : Boolean;
var
  AForm : TViewContaAReceberPagamento;
  aSequencia : Integer;
begin
  AForm := TViewContaAReceberPagamento.Create(AOwner);
  try

    with AForm do
    begin
      CarregarFormaPagto(Empresa);

      edAnoLanc.Text := FormatFloat('0000', Ano);
      edNumLanc.Text := FormatFloat('###0000000', Lancamento);
      edCliente.Text := Cliente;

      // Preparação para a entrada de parâmetros de pesquisa
      FControllerRecebimento
        .DAO
        .Close
        .ClearWhere;

      FControllerRecebimento
        .DAO
        .Where('p.anolanc = :ano')
        .Where('p.numlanc = :controle')
        .OrderBy('p.seq');

      FControllerRecebimento
        .DAO
        .Close
        .ParamsByName('ano',      Ano)
        .ParamsByName('controle', Lancamento)
        .Open;

      TTabelaController
        .New
        .Tabela(FControllerRecebimento.DAO.DataSet)
        .Display('DATA_PAGTO', 'Data de Pagamento', 'dd/mm/yyyy', True)
        .Display('VALOR_BAIXA', 'Valor Pago (R$)', ',0.00', TAlignment.taRightJustify, True)
        .Display('FORMA_PAGTO', 'Forma de Pagamento', True)
        .Configurar;

      FControllerRecebimento.GerarSequencial(dtsPagamentos.DataSet, 'SEQ', aSequencia);

      dtsPagamentos.DataSet.Append;
      dtsPagamentos.DataSet.FieldByName('ANOLANC').AsInteger      := StrToInt(edAnoLanc.Text);
      dtsPagamentos.DataSet.FieldByName('NUMLANC').AsInteger      := StrToInt(edNumLanc.Text);
      dtsPagamentos.DataSet.FieldByName('SEQ').AsInteger          := aSequencia;
      dtsPagamentos.DataSet.FieldByName('EMPRESA').AsString       := Empresa;
      dtsPagamentos.DataSet.FieldByName('FORMA_PAGTO').AsInteger  := FormaPagto;
      dtsPagamentos.DataSet.FieldByName('VALOR_BAIXA').AsCurrency := AReceber;
      dtsPagamentos.DataSet.FieldByName('CONTROLE_CHEQUE').Clear;

      Result := (ShowModal = mrOk);

      if Result then
      begin
        FControllerRecebimento
          .GerarMovimentoCaixa(FControllerRecebimento.DAO.Usuario.Login);

        ContaCorrente := CxContaCorrente;
        DataPagto := dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime;
      end;
    end;

  finally
    AForm.DisposeOf;
  end;
end;

function RegistrarPagamento(aEmpresa : String; LancAno, LanNumero : Integer; DataPagto : TDateTime; FormaPagto : Integer; ValorPago : Currency;
  pTipoOrigem : TTipoOrigemRecebimento; pAno, pControle : Integer) : Boolean;
var
  AForm : TViewContaAReceberPagamento;
  aSequencia : Integer;
begin
  AForm := TViewContaAReceberPagamento.Create(Application);
  try

    with AForm do
    begin
      edAnoLanc.Text := FormatFloat('0000', LancAno);
      edNumLanc.Text := FormatFloat('###0000000', LanNumero);

      // Preparação para a entrada de parâmetros de pesquisa
      FControllerRecebimento
        .DAO
        .Close
        .ClearWhere;

      FControllerRecebimento
        .DAO
        .Where('p.anolanc = :ano')
        .Where('p.numlanc = :controle')
        .OrderBy('p.seq');

      FControllerRecebimento
        .DAO
        .Close
        .ParamsByName('ano',      LancAno)
        .ParamsByName('controle', LanNumero)
        .Open;

      FControllerRecebimento.GerarSequencial(dtsPagamentos.DataSet, 'SEQ', aSequencia);

      dtsPagamentos.DataSet.Append;
      dtsPagamentos.DataSet.FieldByName('ANOLANC').AsInteger      := StrToInt(edAnoLanc.Text);
      dtsPagamentos.DataSet.FieldByName('NUMLANC').AsInteger      := StrToInt(edNumLanc.Text);
      dtsPagamentos.DataSet.FieldByName('SEQ').AsInteger          := aSequencia;
      dtsPagamentos.DataSet.FieldByName('EMPRESA').AsString       := aEmpresa;
      dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime  := DataPagto;
      dtsPagamentos.DataSet.FieldByName('FORMA_PAGTO').AsInteger  := FormaPagto;
      dtsPagamentos.DataSet.FieldByName('VALOR_BAIXA').AsCurrency := ValorPago;
      dtsPagamentos.DataSet.FieldByName('CONTROLE_CHEQUE').Clear;
      dtsPagamentos.DataSet.FieldByName('DOCUMENTO_BAIXA').AsString := FormatFloat('0000', pAno) + FormatFloat('000000', pControle);
      dtsPagamentos.DataSet.FieldByName('HISTORICO').AsString       := 'BAIXA AUTOMATICA NA CONFIRMACAO DA ' +
        IfThen(pTipoOrigem = toRecebimentoVenda, 'VENDA', IfThen(pTipoOrigem = toRecebimentoOS, 'OS','OUT' ))  +
        ' No. ' + FormatFloat('0000', pAno) + '/' + FormatFloat('000000', pControle);
      dtsPagamentos.DataSet.FieldByName('CONTROLE_CHEQUE').Clear;

      dtsPagamentos.DataSet.Post;

      FControllerRecebimento.DAO.ApplyUpdates;
      FControllerRecebimento.DAO.CommitUpdates;
      FControllerRecebimento.DAO.CommitTransaction;

      FControllerRecebimento
        .GerarMovimentoCaixa(FControllerRecebimento.DAO.Usuario.Login);

      dtsPagamentos.DataSet.Close;
    end;

  finally
    AForm.Free;
  end;
end;

procedure TViewContaAReceberPagamento.dbNumeroChequeButtonClick(Sender: TObject);
var
  aCheque : TChequeBaixa;
begin
  if not (FControllerRecebimento.DAO.DataSet.State in [dsEdit, dsInsert]) then
    FControllerRecebimento.DAO.DataSet.Edit;

  if SelecionarChequeBaixa(Self, aCheque) then
  begin
    dtsPagamentos.DataSet.FieldByName('CONTROLE_CHEQUE').AsInteger := aCheque.Codigo;
    dtsPagamentos.DataSet.FieldByName('NUMERO_CHEQUE').AsString    := aCheque.Numero;
    dtsPagamentos.DataSet.FieldByName('BANCO_FEBRABAN').AsString   := aCheque.Banco;
    dtsPagamentos.DataSet.FieldByName('VALOR_BAIXA').AsCurrency    := aCheque.Valor;
    dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime     := aCheque.Data;
  end;
end;

procedure TViewContaAReceberPagamento.dtsPagamentosDataChange(Sender: TObject;
  Field: TField);
begin
  if (Field = FControllerRecebimento.DAO.DataSet.FieldByName('FORMA_PAGTO')) then
    dbNumeroCheque.Enabled := (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0);
end;

procedure TViewContaAReceberPagamento.dtsPagamentosStateChange(Sender: TObject);
begin
  inherited;
  dtsPagamentos.AutoEdit := (FControllerRecebimento.DAO.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewContaAReceberPagamento.FormCreate(Sender: TObject);
begin
  FControllerRecebimento := TControllerFactory.New.Recebimento;
  FControllerBancoFebrabanView := TControllerFactory.New.BancoFebrabanView;
  FControllerFormaPagto := TControllerFactory.New.FormaPagto;

  inherited;

  CxContaCorrente := 0;
  dtsPagamentos.DataSet := FControllerRecebimento.DAO.DataSet;

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'Forma_Pagto', 'codigo', 'descricao');

  TController(FControllerBancoFebrabanView)
    .LookupComboBox(dbBanco, dtsBancoFebraban, 'banco_febraban', 'codigo', 'codigo_nome');
end;

procedure TViewContaAReceberPagamento.btnConfirmarClick(Sender: TObject);
var
  CxAno    ,
  CxNumero ,
  iBancoBoleto : Integer;
begin
  inherited;
  CxAno    := 0;
  CxNumero := 0;

  if (dtsPagamentos.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if (dtsPagamentos.DataSet.FieldByName('VALOR_BAIXA').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Favor informar o valor pago!');
      dbValorPago.SetFocus;
    end
    else
    if (dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').IsNull or (dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime = EncodeDate(1899, 12, 30))) then
    begin
      TServiceMessage.ShowWarning('Informe a Data de Pagamento!');
      dbDataPagto.SetFocus;
    end
    else
    if (dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime > Date) then
    begin
      TServiceMessage.ShowWarning('Não é permitido o registro de pagamentos futuros!');
      dbDataPagto.SetFocus;
    end
    else
    if ( (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0) and (Trim(dtsPagamentos.DataSet.FieldByName('NUMERO_CHEQUE').AsString) = EmptyStr) ) then
    begin
      TServiceMessage.ShowWarning('Favor informar o Número do Cheque!');
      if dbNumeroCheque.Visible and dbNumeroCheque.Enabled then
        dbNumeroCheque.SetFocus;
    end
    else
    if ( (Trim(dtsPagamentos.DataSet.FieldByName('NUMERO_CHEQUE').AsString) <> EmptyStr) and (Trim(dtsPagamentos.DataSet.FieldByName('BANCO_FEBRABAN').AsString) = EmptyStr) ) then
    begin
      TServiceMessage.ShowWarning('Favor informar o Banco do Cheque!');
      dbBanco.SetFocus;
    end
    else
    if ( Trim(dtsPagamentos.DataSet.FieldByName('HISTORICO').AsString) = EmptyStr ) then
    begin
      TServiceMessage.ShowWarning('Favor informar histórico (referente à) do pagamento!');
      dbHistorico.SetFocus;
    end
    else
    begin
      if (not Assigned(FControllerCaixa)) then
        FControllerCaixa := TControllerFactory.New.Caixa;

      if (not Assigned(FControllerBanco)) then
        FControllerBanco := TControllerFactory.New.Banco;

      if (not FControllerCaixa.CaixaAberto(
        dtsPagamentos.DataSet.FieldByName('EMPRESA').AsString,
        FControllerRecebimento.DAO.Usuario.Login,
        dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime,
        dtsPagamentos.DataSet.FieldByName('FORMA_PAGTO').AsInteger,
        CxAno,
        CxNumero,
        CxContaCorrente
      )) then
        TServiceMessage.ShowWarning('Não existe caixa aberto para o usuário ' + QuotedStr(FControllerRecebimento.DAO.Usuario.Login) + ' na forma de pagamento deste movimento.')
      else
      begin
        if ( TServiceMessage.ShowConfirm('Confirma a efetuação do pagamento?') ) then
        begin
          if (dtsPagamentos.DataSet.FieldByName('BANCO_FEBRABAN').AsString <> EmptyStr) then
          begin
            iBancoBoleto := FControllerBanco.GetBancoBoletoCodigo(
                dtsPagamentos.DataSet.FieldByName('EMPRESA').AsString,
                dtsPagamentos.DataSet.FieldByName('BANCO_FEBRABAN').AsString
              );

            if (iBancoBoleto = 0) then
              dtsPagamentos.DataSet.FieldByName('BANCO').Clear
            else
              dtsPagamentos.DataSet.FieldByName('BANCO').AsInteger := iBancoBoleto;
          end;

          dtsPagamentos.DataSet.Post;

          FControllerRecebimento.DAO.ApplyUpdates;
          FControllerRecebimento.DAO.CommitUpdates;
          FControllerRecebimento.DAO.CommitTransaction;

          ModalResult := mrOk;
        end;
      end;
    end;
  end;
end;

procedure TViewContaAReceberPagamento.CarregarFormaPagto(const pEmpresa: String);
begin
  FControllerFormaPagto
    .DAO
      .Close
      .ParamsByName('empresa', pEmpresa.Trim)
      .Open;
end;

procedure TViewContaAReceberPagamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TViewContaAReceberPagamento.FormShow(Sender: TObject);
begin
  inherited;
  if ( dtsPagamentos.AutoEdit ) then
    dbDataPagto.SetFocus;
end;

procedure TViewContaAReceberPagamento.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewContaAReceberPagamento.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
