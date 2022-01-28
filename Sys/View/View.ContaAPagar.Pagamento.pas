unit View.ContaAPagar.Pagamento;

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

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,

  ACBrBase,
  ACBrExtenso,

  dxSkinsCore,
  dxSkinsDefaultPainters,

  UGrPadrao,
  UConstantesDGE,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Interfaces,
  SGE.Controller.Impressao.ContaAPagar;

type
  TViewContaAPagarPagamento = class(TfrmGrPadrao)
    GrpBxPagamento: TGroupBox;
    Bevel1: TBevel;
    GrpBxLancamento: TGroupBox;
    lblAnoLanc: TLabel;
    Label3: TLabel;
    lblFornecedor: TLabel;
    edAnoLanc: TEdit;
    edNumLanc: TEdit;
    edFornecedor: TEdit;
    Bevel2: TBevel;
    dtsPagamentos: TDataSource;
    dtsFormaPagto: TDataSource;
    lblDataPagto: TLabel;
    dbValorPago: TDBEdit;
    lblValorPago: TLabel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblDocBaixa: TLabel;
    dbDocBaixa: TDBEdit;
    lblBanco: TLabel;
    dbBancoFebraban: TDBLookupComboBox;
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
    FControllerPagamento : IControllerPagamento;
    FControllerCaixa : IControllerCaixa;
    FControllerBanco : IControllerBanco;

    procedure CarregarFormaPagto(const pEmpresa : String);
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCONTPAG
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCONTPAG_BAIXA
  - TBBANCO_BOLETO
  - TBBANCO
  - TBFORMPAGTO

  Views:
  - VW_CONDICAOPAGTO

  Procedures:

*)

  function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
    const Ano, Lancamento, FormaPagto : Integer; const Fornecedor : String;
    var ContaCorrente : Integer; var DataPagto : TDateTime; var APagar : Currency) : Boolean;

implementation

uses
    Service.Message
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , View.Cheque;

{$R *.dfm}

function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
  const Ano, Lancamento, FormaPagto : Integer; const Fornecedor : String;
  var ContaCorrente : Integer; var DataPagto : TDateTime; var APagar : Currency) : Boolean;
var
  AForm : TViewContaAPagarPagamento;
  aSequencia : Integer;
begin
  AForm := TViewContaAPagarPagamento.Create(AOwner);
  try

    with AForm do
    begin
      CarregarFormaPagto(Empresa);

      edAnoLanc.Text    := FormatFloat('0000', Ano);
      edNumLanc.Text    := FormatFloat('###0000000', Lancamento);
      edFornecedor.Text := Fornecedor;

      // Preparação para a entrada de parâmetros de pesquisa
      FControllerPagamento
        .DAO
        .Close
        .ClearWhere;

      FControllerPagamento
        .DAO
        .Where('p.anolanc = :ano')
        .Where('p.numlanc = :controle')
        .OrderBy('p.seq');

      FControllerPagamento
        .DAO
        .Close
        .ParamsByName('ano',      Ano)
        .ParamsByName('controle', Lancamento)
        .Open;

      TTabelaController
        .New
        .Tabela(FControllerPagamento.DAO.DataSet)
        .Display('DATA_PAGTO', 'Data de Pagamento', 'dd/mm/yyyy', True)
        .Display('VALOR_BAIXA', 'Valor Pago (R$)', ',0.00', TAlignment.taRightJustify, True)
        .Display('FORMA_PAGTO', 'Forma de Pagamento', True)
        .Configurar;

      FControllerPagamento.GerarSequencial(dtsPagamentos.DataSet, 'SEQ', aSequencia);

      dtsPagamentos.DataSet.Append;
      dtsPagamentos.DataSet.FieldByName('ANOLANC').AsInteger      := StrToInt(edAnoLanc.Text);
      dtsPagamentos.DataSet.FieldByName('NUMLANC').AsInteger      := StrToInt(edNumLanc.Text);
      dtsPagamentos.DataSet.FieldByName('SEQ').AsInteger          := aSequencia;
      dtsPagamentos.DataSet.FieldByName('EMPRESA').AsString       := Empresa;
      dtsPagamentos.DataSet.FieldByName('FORMA_PAGTO').AsInteger  := FormaPagto;
      dtsPagamentos.DataSet.FieldByName('VALOR_BAIXA').AsCurrency := APagar;
      dtsPagamentos.DataSet.FieldByName('CONTROLE_CHEQUE').Clear;

      Result := (ShowModal = mrOk);

      if Result then
      begin
        FControllerPagamento
          .GerarMovimentoCaixa(FControllerPagamento.DAO.Usuario.Login);

        ContaCorrente := CxContaCorrente;
        DataPagto := dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime;
      end;
    end;

  finally
    AForm.DisposeOf;
  end;
end;

procedure TViewContaAPagarPagamento.dbNumeroChequeButtonClick(Sender: TObject);
var
  aCheque : TChequeBaixa;
begin
  if not (FControllerPagamento.DAO.DataSet.State in [dsEdit, dsInsert]) then
    FControllerPagamento.DAO.DataSet.Edit;

  if SelecionarChequeBaixa(Self, aCheque) then
  begin
    dtsPagamentos.DataSet.FieldByName('CONTROLE_CHEQUE').AsInteger := aCheque.Codigo;
    dtsPagamentos.DataSet.FieldByName('NUMERO_CHEQUE').AsString    := aCheque.Numero;
    dtsPagamentos.DataSet.FieldByName('BANCO_FEBRABAN').AsString   := aCheque.Banco;
    dtsPagamentos.DataSet.FieldByName('VALOR_BAIXA').AsCurrency    := aCheque.Valor;
    dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime     := aCheque.Data;
  end;
end;

procedure TViewContaAPagarPagamento.dtsPagamentosDataChange(Sender: TObject;
  Field: TField);
begin
  if (Field = FControllerPagamento.DAO.DataSet.FieldByName('FORMA_PAGTO')) then
    dbNumeroCheque.Enabled := (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0);
end;

procedure TViewContaAPagarPagamento.dtsPagamentosStateChange(Sender: TObject);
begin
  inherited;
  dtsPagamentos.AutoEdit := (FControllerPagamento.DAO.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewContaAPagarPagamento.FormCreate(Sender: TObject);
begin
  FControllerPagamento := TControllerFactory.New.Pagamento;
  FControllerBancoFebrabanView := TControllerFactory.New.BancoFebrabanView;
  FControllerFormaPagto := TControllerFactory.New.FormaPagto;

  inherited;

  CxContaCorrente := 0;
  dtsPagamentos.DataSet := FControllerPagamento.DAO.DataSet;

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'Forma_Pagto', 'codigo', 'descricao');

  TController(FControllerBancoFebrabanView)
    .LookupComboBox(dbBancoFebraban, dtsBancoFebraban, 'banco_febraban', 'codigo', 'codigo_nome');
end;

procedure TViewContaAPagarPagamento.btnConfirmarClick(Sender: TObject);
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
      dbBancoFebraban.SetFocus;
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
        FControllerPagamento.DAO.Usuario.Login,
        dtsPagamentos.DataSet.FieldByName('DATA_PAGTO').AsDateTime,
        dtsPagamentos.DataSet.FieldByName('FORMA_PAGTO').AsInteger,
        CxAno,
        CxNumero,
        CxContaCorrente
      )) then
        TServiceMessage.ShowWarning('Não existe caixa aberto para o usuário ' + QuotedStr(FControllerPagamento.DAO.Usuario.Login) + ' na forma de pagamento deste movimento.')
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

          FControllerPagamento.DAO.ApplyUpdates;
          FControllerPagamento.DAO.CommitUpdates;
          FControllerPagamento.DAO.CommitTransaction;

          ModalResult := mrOk;
        end;
      end;
    end;
  end;
end;

procedure TViewContaAPagarPagamento.CarregarFormaPagto(const pEmpresa: String);
begin
  FControllerFormaPagto
    .DAO
      .Close
      .ParamsByName('empresa', pEmpresa.Trim)
      .Open;
end;

procedure TViewContaAPagarPagamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TViewContaAPagarPagamento.FormShow(Sender: TObject);
begin
  inherited;
  if dtsPagamentos.AutoEdit then
    dbDataPagto.SetFocus;
end;

procedure TViewContaAPagarPagamento.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewContaAPagarPagamento.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
