unit UGeEfetuarPagtoREC;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBUpdateSQL, IBTable, Buttons, IBStoredProc, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, IBX.IBQuery,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2007Green;

type
  TTipoOrigemRecebimento = (toRecebimentoOutros, toRecebimentoVenda, toRecebimentoOS);
  TfrmGeEfetuarPagtoREC = class(TfrmGrPadrao)
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
    cdsPagamentos: TIBDataSet;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TIBStringField;
    cdsPagamentosVALOR_BAIXA: TIBBCDField;
    cdsPagamentosNUMERO_CHEQUE: TIBStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosBCO_NOME: TIBStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TIBStringField;
    updPagamentos: TIBUpdateSQL;
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
    cdsPagamentosUSUARIO: TIBStringField;
    lblInforme: TLabel;
    tmrAlerta: TTimer;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    dbDataPagto: TJvDBDateEdit;
    cdsPagamentosEMPRESA: TIBStringField;
    dtsBancoFebraban: TDataSource;
    cdsPagamentosBANCO_FEBRABAN: TIBStringField;
    lblNumeroCheque: TLabel;
    dbNumeroCheque: TJvDBComboEdit;
    cdsPagamentosCONTROLE_CHEQUE: TIntegerField;
    fdQryBanco: TFDQuery;
    fdQryBancoFebraban: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    procedure dtsPagamentosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsPagamentosNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tmrAlertaTimer(Sender: TObject);
    procedure dbNumeroChequeButtonClick(Sender: TObject);
    procedure dtsPagamentosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    CxContaCorrente : Integer;
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
  frmGeEfetuarPagtoREC: TfrmGeEfetuarPagtoREC;

  function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
    const Ano, Lancamento, FormaPagto : Integer; const Cliente : String;
    var ContaCorrente : Integer; var DataPagto : TDateTime; var AReceber : Currency) : Boolean;
  function RegistrarPagamento(LancAno, LanNumero : Integer; DataPagto : TDateTime; FormaPagto : Integer; ValorPago : Currency;
    pTipoOrigem : TTipoOrigemRecebimento; pAno, pControle : Integer) : Boolean;

implementation

uses
  UDMBusiness, UGeControleCheque;

{$R *.dfm}

function PagamentoConfirmado(const AOwner : TComponent; const Empresa : String;
  const Ano, Lancamento, FormaPagto : Integer; const Cliente : String;
  var ContaCorrente : Integer; var DataPagto : TDateTime; var AReceber : Currency) : Boolean;
var
  frm : TfrmGeEfetuarPagtoREC;
begin
  frm := TfrmGeEfetuarPagtoREC.Create(AOwner);
  try

    with frm do
    begin
      edAnoLanc.Text := FormatFloat('0000', Ano);
      edNumLanc.Text := FormatFloat('###0000000', Lancamento);
      edCliente.Text := Cliente;

      cdsPagamentos.Close;

      with cdsPagamentos, SelectSQL do
      begin
        Add('where p.Anolanc = ' + IntToStr(Ano));
        Add('  and p.Numlanc = ' + IntToStr(Lancamento));
      end;

      cdsPagamentos.Open;
      cdsPagamentos.Append;
      cdsPagamentosEMPRESA.AsString       := Empresa;
      cdsPagamentosFORMA_PAGTO.AsInteger  := FormaPagto;
      cdsPagamentosVALOR_BAIXA.AsCurrency := AReceber;

      Result := (ShowModal = mrOk);

      if ( Result ) then
      begin
        DataPagto := cdsPagamentosDATA_PAGTO.AsDateTime;

        SetMovimentoCaixa(
          gUsuarioLogado.Login,
          cdsPagamentosDATA_PAGTO.AsDateTime + Time,
          cdsPagamentosFORMA_PAGTO.AsInteger,
          cdsPagamentosANOLANC.AsInteger,
          cdsPagamentosNUMLANC.AsInteger,
          cdsPagamentosSEQ.AsInteger,
          cdsPagamentosVALOR_BAIXA.AsCurrency,
          tmcxCredito);
      end;
    end;

  finally
    frm.Free;
  end;
end;

function RegistrarPagamento(LancAno, LanNumero : Integer; DataPagto : TDateTime; FormaPagto : Integer; ValorPago : Currency;
  pTipoOrigem : TTipoOrigemRecebimento; pAno, pControle : Integer) : Boolean;
var
  frm : TfrmGeEfetuarPagtoREC;
begin
  frm := TfrmGeEfetuarPagtoREC.Create(Application);
  try

    with frm do
    begin
      edAnoLanc.Text := FormatFloat('0000', LancAno);
      edNumLanc.Text := FormatFloat('###0000000', LanNumero);

      cdsPagamentos.Close;

      with cdsPagamentos, SelectSQL do
      begin
        Add('where p.Anolanc = ' + IntToStr(LancAno));
        Add('  and p.Numlanc = ' + IntToStr(LanNumero));
      end;

      cdsPagamentos.Open;
      cdsPagamentos.Append;

      cdsPagamentosDATA_PAGTO.AsDateTime  := DataPagto;
      cdsPagamentosFORMA_PAGTO.AsInteger  := FormaPagto;
      cdsPagamentosVALOR_BAIXA.AsCurrency := ValorPago;
      cdsPagamentosDOCUMENTO_BAIXA.AsString := FormatFloat('0000', pAno) + FormatFloat('000000', pControle);
      cdsPagamentosHISTORICO.AsString       := 'BAIXA AUTOMATICA NA CONFIRMACAO DA ' +
        IfThen(pTipoOrigem = toRecebimentoVenda, 'VENDA', IfThen(pTipoOrigem = toRecebimentoOS, 'OS','OUT' ))  +
        ' No. ' + FormatFloat('0000', pAno) + '/' + FormatFloat('000000', pControle);
      cdsPagamentosCONTROLE_CHEQUE.Clear;

      cdsPagamentos.Post;
      cdsPagamentos.ApplyUpdates;

      CommitTransaction;

      cdsPagamentos.Close;

      SetMovimentoCaixa(
        GetUserApp,
        DataPagto + Time,
        FormaPagto,
        LancAno,   // Ano do lançamento do Título
        LanNumero, // Número do lançamento do Título
        0,
        ValorPago,
        tmcxCredito);

    end;

  finally
    frm.Free;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.dbNumeroChequeButtonClick(Sender: TObject);
var
  aCheque : TChequeBaixa;
begin
  if not (cdsPagamentos.State in [dsEdit, dsInsert]) then
    cdsPagamentos.Edit;

  if SelecionarChequeBaixa(Self, aCheque) then
  begin
    cdsPagamentosCONTROLE_CHEQUE.AsInteger := aCheque.Codigo;
    cdsPagamentosNUMERO_CHEQUE.AsString    := aCheque.Numero;
    cdsPagamentosBANCO_FEBRABAN.AsString   := aCheque.Banco;
    cdsPagamentosVALOR_BAIXA.AsCurrency    := aCheque.Valor;
    cdsPagamentosDATA_PAGTO.AsDateTime     := aCheque.Data;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.dtsPagamentosDataChange(Sender: TObject;
  Field: TField);
begin
  if (Field = cdsPagamentosFORMA_PAGTO) then
    dbNumeroCheque.Enabled := (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0);
end;

procedure TfrmGeEfetuarPagtoREC.dtsPagamentosStateChange(Sender: TObject);
begin
  inherited;
  dtsPagamentos.AutoEdit := ( cdsPagamentos.State in [dsEdit, dsInsert] );
end;

procedure TfrmGeEfetuarPagtoREC.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarListaDB(fdQryBanco);
  CarregarListaDB(fdQryFormaPagto);
  CarregarListaDB(fdQryBancoFebraban);

  CxContaCorrente := 0;
end;

procedure TfrmGeEfetuarPagtoREC.btnConfirmarClick(Sender: TObject);
var
  CxAno    ,
  CxNumero ,
  iBancoBoleto : Integer;
begin
  inherited;
  CxAno    := 0;
  CxNumero := 0;

  if ( cdsPagamentos.State in [dsEdit, dsInsert] ) then
  begin
    if ( cdsPagamentosVALOR_BAIXA.AsCurrency <= 0 ) then
    begin
      ShowWarning('Favor informar o valor recebido!');
      dbValorPago.SetFocus;
    end
    else
    if ( cdsPagamentosDATA_PAGTO.AsDateTime > GetDateTimeDB ) then
    begin
      ShowWarning('Não é permitido do registro de recebimentos futuros!');
      dbDataPagto.SetFocus;
    end
    else
    if ( (Pos('CHEQUE', AnsiUpperCase(dbFormaPagto.Text)) > 0) and (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) = EmptyStr) ) then
    begin
      ShowWarning('Favor informar o Número do Cheque!');
      if dbNumeroCheque.Visible and dbNumeroCheque.Enabled then
        dbNumeroCheque.SetFocus;
    end
    else
//    if ( (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) <> EmptyStr) and (cdsPagamentosBANCO.AsInteger = 0) ) then
    if ( (Trim(cdsPagamentosNUMERO_CHEQUE.AsString) <> EmptyStr) and (Trim(cdsPagamentosBANCO_FEBRABAN.AsString) = EmptyStr) ) then
    begin
      ShowWarning('Favor informar o Banco!');
      dbBanco.SetFocus;
    end
    else
    if ( Trim(cdsPagamentosHISTORICO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar histórico (referente à) do recebimento!');
      dbHistorico.SetFocus;
    end
    else
    begin
      if ( not CaixaAberto(cdsPagamentosEMPRESA.AsString, gUsuarioLogado.Login, cdsPagamentosDATA_PAGTO.AsDateTime, cdsPagamentosFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
      begin
        ShowWarning('Não existe caixa aberto para o usuário ' + QuotedStr(gUsuarioLogado.Login) + ' na forma de pagamento deste movimento.');
        Exit;
      end;

      if ( ShowConfirm('Confirma a efetuação do recebimento?') ) then
      begin
        cdsPagamentosHISTORICO.AsString := AnsiUpperCase(Trim(cdsPagamentosHISTORICO.AsString));

        if (Copy(cdsPagamentosHISTORICO.AsString, Length(cdsPagamentosHISTORICO.AsString), 1) = '.') then
          cdsPagamentosHISTORICO.AsString := Copy(cdsPagamentosHISTORICO.AsString, 1, Length(cdsPagamentosHISTORICO.AsString) - 1);

        iBancoBoleto := GetBancoBoletoCodigo(cdsPagamentosEMPRESA.AsString, Trim(cdsPagamentosBANCO_FEBRABAN.AsString));
        if iBancoBoleto > 0 then
          cdsPagamentosBANCO.AsInteger := iBancoBoleto
        else
          cdsPagamentosBANCO.Clear;

        cdsPagamentos.Post;
        cdsPagamentos.ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
    end;
  end;
end;

procedure TfrmGeEfetuarPagtoREC.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmGeEfetuarPagtoREC.cdsPagamentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsPagamentosANOLANC.Value    := StrToInt(edAnoLanc.Text);
  cdsPagamentosNUMLANC.Value    := StrToInt(edNumLanc.Text);
  cdsPagamentosSEQ.Value        := GetNextID('TBCONTREC_BAIXA', 'SEQ', 'where anolanc = ' + edAnoLanc.Text + ' and numlanc = ' + edNumLanc.Text);
  cdsPagamentosDATA_PAGTO.Value := GetDateDB;
  cdsPagamentosUSUARIO.Value    := GetUserApp;
  cdsPagamentosFORMA_PAGTO.Value      := GetFormaPagtoIDDefault;
  cdsPagamentosFORMA_PAGTO_DESC.Value := GetFormaPagtoNomeDefault;
end;

procedure TfrmGeEfetuarPagtoREC.FormShow(Sender: TObject);
begin
  inherited;
  if ( dtsPagamentos.AutoEdit ) then
    dbDataPagto.SetFocus;
end;

procedure TfrmGeEfetuarPagtoREC.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeEfetuarPagtoREC.tmrAlertaTimer(Sender: TObject);
begin
  if (lblInforme.Font.Color = clRed) then
    lblInforme.Font.Color := clBlue
  else
  if (lblInforme.Font.Color = clBlue) then
    lblInforme.Font.Color := clRed;
end;

end.
