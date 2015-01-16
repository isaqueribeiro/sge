unit UGeContasAPagarQuitar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoPesquisa, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, DBClient, Provider,
  IBTable, RXDBCtrl, DBCtrls, IBUpdateSQL, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeContasAPagarQuitar = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    PnlControleQuitacao: TPanel;
    GrpBxControleQuitacao: TGroupBox;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    CdsPesquisaANOLANC: TSmallintField;
    CdsPesquisaNUMLANC: TIntegerField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaPARCELA: TSmallintField;
    CdsPesquisaTIPPAG: TStringField;
    CdsPesquisaDTEMISS: TDateField;
    CdsPesquisaDTVENC: TDateField;
    CdsPesquisaDTPAG: TDateField;
    CdsPesquisaVALORPAG: TBCDField;
    CdsPesquisaVALORMULTA: TBCDField;
    CdsPesquisaVALORPAGTOT: TBCDField;
    CdsPesquisaVALORSALDO: TBCDField;
    CdsPesquisaVALOR_APAGAR: TBCDField;
    CdsPesquisaENTRADA: TStringField;
    CdsPesquisaENTRADA_ANO: TSmallintField;
    CdsPesquisaENTRADA_NUMERO: TIntegerField;
    CdsPesquisaENTRADA_DOC_TIPO: TStringField;
    CdsPesquisaENTRADA_DOC: TStringField;
    CdsPesquisaENTRADA_DOC_NUMERO: TIntegerField;
    CdsPesquisaENTRADA_DOC_SERIE: TStringField;
    CdsPesquisaSELECIONAR: TIntegerField;
    CdsPesquisaSelecionados: TAggregateField;
    CdsPesquisaLANCAMENTO: TStringField;
    CdsPesquisaENTRADA_FORNECEDOR: TStringField;
    CdsPesquisaENTRADA_FORNECEDOR_CNPJ: TStringField;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    cdsPagamentoLOTE: TClientDataSet;
    dtsPagamentoLOTE: TDataSource;
    lblDataPagto: TLabel;
    dbDataPagto: TDBDateEdit;
    cdsPagamentoLOTEDataPagto: TDateTimeField;
    cdsPagamentoLOTEFormaPagto: TIntegerField;
    cdsPagamentoLOTEHistoricoGeral: TMemoField;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
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
    cdsPagamentosUSUARIO: TIBStringField;
    updPagamentos: TIBUpdateSQL;
    BtnQuitar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure CdsPesquisaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure BtnQuitarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure QuitarDespesa;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  frmGeContasAPagarQuitar: TfrmGeContasAPagarQuitar;

implementation

uses
  UDMBusiness, DateUtils;

{$R *.dfm}

{ TfrmGeContasAPagarQuitar }

const
  TIPO_AUT = 0;
  
function TfrmGeContasAPagarQuitar.ExecutarPesquisa: Boolean;
var
  sDataInicial,
  sDataFinal  : String;
begin
  Screen.Cursor := crSQLWait;
  try
    sDataInicial     := FormatDateTime('yyyy-mm-dd', StrToDateDef(e1Data.Text, Date));
    sDataFinal       := FormatDateTime('yyyy-mm-dd', StrToDateDef(e2Data.Text, Date));
    edPesquisar.Text := Trim(edPesquisar.Text);

    CdsPesquisa.Close;

    with QryPesquisa do
    begin
      SQL.Clear;
      SQL.AddStrings( SQLSelect );
      SQL.Add('where c.empresa  = ' + QuotedStr(GetEmpresaIDDefault));
      SQL.Add('  and c.situacao = 1');    // Situação Ativa
      SQL.Add('  and c.quitado  = 0');    // Não quitados
      SQL.Add('  and c.dtvenc between ' + QuotedStr(sDataInicial) + ' and ' + QuotedStr(sDataFinal));

      Case edTipoPesquisa.ItemIndex of
        TIPO_AUT:
          begin
            if FuncoesString.StrIsInt(edPesquisar.Text) then
              SQL.Add('  and c.codforn = ' + edPesquisar.Text)
            else  
            if FuncoesString.StrIsCPF(edPesquisar.Text) or FuncoesString.StrIsCNPJ(edPesquisar.Text) then
              SQL.Add('  and f.cnpj = ' + QuotedStr(edPesquisar.Text))
            else
              SQL.Add('  and ((f.nomeforn like ' + QuotedStr(edPesquisar.Text + '%') + ') or (f.nomefant like ' + QuotedStr(edPesquisar.Text + '%') + '))');
          end;
      end;

      SQL.Add('order by c.dtvenc, f.nomeforn');
    end;

    CdsPesquisa.Open;

    Result := not CdsPesquisa.IsEmpty;
  finally
    Screen.Cursor := crDefault;

    if cdsPagamentoLOTE.Active then
      cdsPagamentoLOTE.Close;

    cdsPagamentoLOTE.Open;
    while not cdsPagamentoLOTE.Eof do
      cdsPagamentoLOTE.Delete;

    cdsPagamentoLOTE.Append;
    cdsPagamentoLOTEDataPagto.AsDateTime := GetDateDB;
    cdsPagamentoLOTEFormaPagto.Clear;
    cdsPagamentoLOTEHistoricoGeral.Clear; 
  end;
end;

procedure TfrmGeContasAPagarQuitar.FormCreate(Sender: TObject);
begin
  inherited;
  tblFormaPagto.Open;

  e1Data.Date := GetMenorVencimentoAPagar;
  e2Data.Date := GetDateDB;

  cdsPagamentoLOTE.CreateDataSet;
end;

procedure TfrmGeContasAPagarQuitar.CdsPesquisaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if Sender.AsInteger = 0 then
      Text := '.'
    else
      Text := 'X';  
end;

procedure TfrmGeContasAPagarQuitar.dbgDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #32) then
    if not CdsPesquisa.IsEmpty then
    begin
      CdsPesquisa.Edit;

      if CdsPesquisaSELECIONAR.AsInteger = 0 then
        CdsPesquisaSELECIONAR.AsInteger := 1
      else
      if CdsPesquisaSELECIONAR.AsInteger = 1 then
        CdsPesquisaSELECIONAR.AsInteger := 0;
        
      CdsPesquisa.Post;
      Exit;
    end;

  inherited;
end;

procedure TfrmGeContasAPagarQuitar.BtnQuitarClick(Sender: TObject);
begin
  if CdsPesquisa.IsEmpty then
    ShowWarning('Não há registros de despesas para quitação!')
  else
  if StrToIntDef(CdsPesquisaSelecionados.AsString, 0) < 2 then
  begin
    ShowWarning('Favor selecionar no mínimo 2 registros para baixa em lote!');
    dbgDados.SetFocus;
  end
  else
  if cdsPagamentoLOTEDataPagto.IsNull then
  begin
    ShowWarning('Favor informar a Data de Pagamento para os lançamentos selecionados!');
    dbDataPagto.SetFocus;
  end
  else
  if cdsPagamentoLOTEFormaPagto.IsNull then
  begin
    ShowWarning('Favor informar a Forma de Pagamento para os lançamentos selecionados!');
    dbFormaPagto.SetFocus;
  end
  else
  if Trim(cdsPagamentoLOTEHistoricoGeral.AsString) = EmptyStr then
  begin
    ShowWarning('Favor informar um histório geral para os lançamentos selecionados!');
    dbHistorico.SetFocus;
  end
  else
    if ShowConfirm('Confirma a quitação dos lançamentos de despesas selecionados?', 'Quitação por Lote') then
      try
        cdsPagamentoLOTE.Post;
        QuitarDespesa;
      finally
        CdsPesquisa.Close;
        CdsPesquisa.Open;
      end;
end;

procedure TfrmGeContasAPagarQuitar.QuitarDespesa;
var
  sSenha   : String;
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto  : TDateTime;
  cTotalPago : Currency;
begin
  try
    CdsPesquisa.DisableControls;
    CdsPesquisa.First;

    if ( not CaixaAberto(GetEmpresaIDDefault, GetUserApp, GetDateDB, cdsPagamentoLOTEFormaPagto.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento desta quitação.');
      Exit;
    end;

    cTotalPago := 0.0;
    
    while not CdsPesquisa.Eof do
    begin
      if not cdsPagamentos.Active then
        cdsPagamentos.Open;

      if (CdsPesquisaSELECIONAR.AsInteger = 1) then
      begin
        // 1. Gerar Registro de Pagamento

        cdsPagamentos.Append;

        cdsPagamentosANOLANC.Value     := CdsPesquisaANOLANC.Value;
        cdsPagamentosNUMLANC.Value     := CdsPesquisaNUMLANC.Value;
        cdsPagamentosSEQ.Value         := GetNextID('TBCONTPAG_BAIXA', 'SEQ', 'where anolanc = ' + CdsPesquisaANOLANC.AsString + ' and numlanc = ' + CdsPesquisaNUMLANC.AsString);
        cdsPagamentosDATA_PAGTO.Value  := cdsPagamentoLOTEDataPagto.Value;
        cdsPagamentosUSUARIO.Value     := GetUserApp;
        cdsPagamentosVALOR_BAIXA.Value := CdsPesquisaVALOR_APAGAR.AsCurrency;
        cdsPagamentosFORMA_PAGTO.Value      := cdsPagamentoLOTEFormaPagto.Value;
        cdsPagamentosFORMA_PAGTO_DESC.Value := Trim(dbFormaPagto.Text);
        cdsPagamentosHISTORICO.AsString     := AnsiUpperCase(Trim(cdsPagamentoLOTEHistoricoGeral.AsString)) + ' (PAGTO REALIZADO EM LOTE POR ' + GetUserApp + ')';

        if (Copy(cdsPagamentosHISTORICO.AsString, Length(cdsPagamentosHISTORICO.AsString), 1) = '.') then
          cdsPagamentosHISTORICO.AsString := Copy(cdsPagamentosHISTORICO.AsString, 1, Length(cdsPagamentosHISTORICO.AsString) - 1);

        cdsPagamentos.Post;
        cdsPagamentos.ApplyUpdates;

        CommitTransaction;

        // 2. Gerar Registro de Movimento de Caixa (Tesouraria)

        SetMovimentoCaixa(
          GetUserApp,
          cdsPagamentosDATA_PAGTO.AsDateTime + Time,
          cdsPagamentosFORMA_PAGTO.AsInteger,
          cdsPagamentosANOLANC.AsInteger,
          cdsPagamentosNUMLANC.AsInteger,
          cdsPagamentosSEQ.AsInteger,
          cdsPagamentosVALOR_BAIXA.AsCurrency,
          tmcxDebito);

        cTotalPago := cTotalPago + CdsPesquisaVALOR_APAGAR.AsCurrency;
      end;

      CdsPesquisa.Next;
    end;
  finally
    // 3. Gerar/Atualizar Saldo do Dia

    if ( (cTotalPago > 0.0) and (CxContaCorrente > 0) ) then
    begin
      GerarSaldoContaCorrente(CxContaCorrente, cdsPagamentoLOTEDataPagto.AsDateTime);
      ShowInformation('Quitação por Lote relalizado com sucesso!');
    end;

    CdsPesquisa.First;
    CdsPesquisa.EnableControls;
  end;
end;

procedure TfrmGeContasAPagarQuitar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
    Self.Close
end;

initialization
  FormFunction.RegisterForm('frmGeContasAPagarQuitar', TfrmGeContasAPagarQuitar);

end.
