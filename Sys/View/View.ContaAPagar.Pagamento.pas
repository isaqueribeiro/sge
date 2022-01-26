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
    FTabelaPagamento : ITabela;
    CxContaCorrente  : Integer;
    FControllerBancoFebrabanView,
    FControllerFormaPagto       : IControllerCustom;
    FControllerPagamento : IControllerPagamento;

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
    UDMBusiness
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , UGeControleCheque;

{$R *.dfm}

function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
  const Ano, Lancamento, FormaPagto : Integer; const Fornecedor : String;
  var ContaCorrente : Integer; var DataPagto : TDateTime; var APagar : Currency) : Boolean;
var
  AForm : TViewContaAPagarPagamento;
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

      FTabelaPagamento.Configurar;

      FControllerPagamento.DAO.DataSet.Append;

//      cdsPagamentosANOLANC.Value    := StrToInt(edAnoLanc.Text);
//      cdsPagamentosNUMLANC.Value    := StrToInt(edNumLanc.Text);
//      cdsPagamentosSEQ.Value        := GetNextID('TBCONTPAG_BAIXA', 'SEQ', 'where anolanc = ' + edAnoLanc.Text + ' and numlanc = ' + edNumLanc.Text);
      FControllerPagamento.DAO.DataSet.FieldByName('EMPRESA').AsString       := Empresa;
      FControllerPagamento.DAO.DataSet.FieldByName('FORMA_PAGTO').AsInteger  := FormaPagto;
      FControllerPagamento.DAO.DataSet.FieldByName('VALOR_BAIXA').AsCurrency := APagar;
      FControllerPagamento.DAO.DataSet.FieldByName('CONTROLE_CHEQUE').Clear;

      Result := (ShowModal = mrOk);

      if ( Result ) then
      begin
//        DataPagto     := cdsPagamentosDATA_PAGTO.AsDateTime;
//        ContaCorrente := cxContaCorrente;
//
//        SetMovimentoCaixa(
//          gUsuarioLogado.Login,
//          cdsPagamentosDATA_PAGTO.AsDateTime + Time,
//          cdsPagamentosFORMA_PAGTO.AsInteger,
//          cdsPagamentosANOLANC.AsInteger,
//          cdsPagamentosNUMLANC.AsInteger,
//          cdsPagamentosSEQ.AsInteger,
//          cdsPagamentosVALOR_BAIXA.AsCurrency,
//          tmcxDebito);
      end;
    end;

  finally
    AForm.Free;
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
//    cdsPagamentosCONTROLE_CHEQUE.AsInteger := aCheque.Codigo;
//    cdsPagamentosNUMERO_CHEQUE.AsString    := aCheque.Numero;
//    cdsPagamentosBANCO_FEBRABAN.AsString   := aCheque.Banco;
//    cdsPagamentosVALOR_BAIXA.AsCurrency    := aCheque.Valor;
//    cdsPagamentosDATA_PAGTO.AsDateTime     := aCheque.Data;
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

  FTabelaPagamento := TTabelaController.New.Tabela(FControllerPagamento.DAO.DataSet);
  FTabelaPagamento
    .Display('DATA_PAGTO', 'Data de Pagamento', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
    .Display('VALOR_BAIXA', 'Valor Pago (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('FORMA_PAGTO', 'Forma de Pagamento', True);

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'Forma_Pagto', 'codigo', 'codigo_descricao');

  TController(FControllerBancoFebrabanView)
    .LookupComboBox(dbBancoFebraban, dtsBancoFebraban, 'banco_febraban', 'codigo', 'nome_codigo');
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

//  if ( cdsPagamentos.State in [dsEdit, dsInsert] ) then
//  begin
//    if ( cdsPagamentosVALOR_BAIXA.AsCurrency <= 0 ) then
//    begin
//      ShowWarning('Favor informar o valor pago!');
//      dbValorPago.SetFocus;
//    end
//    else
//    if ( cdsPagamentosDATA_PAGTO.AsDateTime > GetDateTimeDB ) then
//    begin
//      ShowWarning('Não é permitido o registro de pagamentos futuros!');
//      dbDataPagto.SetFocus;
//    end
//    else
//    if ( (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0) and (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) = EmptyStr) ) then
//    begin
//      ShowWarning('Favor informar o Número do Cheque!');
//      if dbNumeroCheque.Visible and dbNumeroCheque.Enabled then
//        dbNumeroCheque.SetFocus;
//    end
//    else
//    if ( (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) <> EmptyStr) and (Trim(cdsPagamentosBANCO_FEBRABAN.AsString) = EmptyStr) ) then
//    begin
//      ShowWarning('Favor informar o Banco!');
//      dbBancoFebraban.SetFocus;
//    end
//    else
//    if ( Trim(cdsPagamentosHISTORICO.AsString) = EmptyStr ) then
//    begin
//      ShowWarning('Favor informar histórico (referente à) do pagamento!');
//      dbHistorico.SetFocus;
//    end
//    else
//    begin
//      if ( not CaixaAberto(cdsPagamentosEMPRESA.AsString, gUsuarioLogado.Login, cdsPagamentosDATA_PAGTO.AsDateTime, cdsPagamentosFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
//      begin
//        ShowWarning('Não existe caixa aberto para o usuário ' + QuotedStr(gUsuarioLogado.Login) + ' na forma de pagamento deste movimento.');
//        Exit;
//      end;
//
//      if ( ShowConfirm('Confirma a efetuação do pagamento?') ) then
//      begin
//        cdsPagamentosHISTORICO.AsString := AnsiUpperCase(Trim(cdsPagamentosHISTORICO.AsString));
//
//        if (Copy(cdsPagamentosHISTORICO.AsString, Length(cdsPagamentosHISTORICO.AsString), 1) = '.') then
//          cdsPagamentosHISTORICO.AsString := Copy(cdsPagamentosHISTORICO.AsString, 1, Length(cdsPagamentosHISTORICO.AsString) - 1);
//
//        iBancoBoleto := GetBancoBoletoCodigo(cdsPagamentosEMPRESA.AsString, Trim(cdsPagamentosBANCO_FEBRABAN.AsString));
//        if iBancoBoleto > 0 then
//          cdsPagamentosBANCO.AsInteger := iBancoBoleto
//        else
//          cdsPagamentosBANCO.Clear;
//
//        cdsPagamentos.Post;
//        cdsPagamentos.ApplyUpdates;
//        cdsPagamentos.CommitUpdates;
//
//        CommitTransaction;
//
//        ModalResult := mrOk;
//      end;
//    end;
//  end;
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
