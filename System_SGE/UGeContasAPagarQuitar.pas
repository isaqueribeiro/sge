unit UGeContasAPagarQuitar;

interface

uses
  UGrPadraoPesquisa,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, DBClient, Provider, IBTable, DBCtrls,
  IBUpdateSQL, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvDBControls, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeContasAPagarQuitar = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    PnlControleQuitacao: TPanel;
    GrpBxControleQuitacao: TGroupBox;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    CdsPesquisaSelecionados: TAggregateField;
    dtsFormaPagto: TDataSource;
    cdsPagamentoLOTE: TClientDataSet;
    dtsPagamentoLOTE: TDataSource;
    lblDataPagto: TLabel;
    cdsPagamentoLOTEDataPagto: TDateTimeField;
    cdsPagamentoLOTEFormaPagto: TIntegerField;
    cdsPagamentoLOTEHistoricoGeral: TMemoField;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    BtnQuitar: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbDataPagto: TJvDBDateEdit;
    fdQryFormaPagto: TFDQuery;
    CdsPesquisaANOLANC: TSmallintField;
    CdsPesquisaNUMLANC: TIntegerField;
    CdsPesquisaLANCAMENTO: TStringField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaPARCELA: TSmallintField;
    CdsPesquisaTIPPAG: TStringField;
    CdsPesquisaDTEMISS: TDateField;
    CdsPesquisaDTVENC: TDateField;
    CdsPesquisaDTPAG: TDateField;
    CdsPesquisaENTRADA: TStringField;
    CdsPesquisaENTRADA_ANO: TSmallintField;
    CdsPesquisaENTRADA_NUMERO: TIntegerField;
    CdsPesquisaENTRADA_DOC_TIPO: TStringField;
    CdsPesquisaENTRADA_DOC: TStringField;
    CdsPesquisaENTRADA_DOC_NUMERO: TIntegerField;
    CdsPesquisaENTRADA_DOC_SERIE: TStringField;
    CdsPesquisaENTRADA_FORNECEDOR: TStringField;
    CdsPesquisaENTRADA_FORNECEDOR_CNPJ: TStringField;
    cdsPagamentos: TFDQuery;
    updPagamentos: TFDUpdateSQL;
    fdQryPesquisaANOLANC: TSmallintField;
    fdQryPesquisaNUMLANC: TIntegerField;
    fdQryPesquisaLANCAMENTO: TStringField;
    fdQryPesquisaEMPRESA: TStringField;
    fdQryPesquisaPARCELA: TSmallintField;
    fdQryPesquisaTIPPAG: TStringField;
    fdQryPesquisaDTEMISS: TDateField;
    fdQryPesquisaDTVENC: TDateField;
    fdQryPesquisaDTPAG: TDateField;
    fdQryPesquisaENTRADA: TStringField;
    fdQryPesquisaENTRADA_ANO: TSmallintField;
    fdQryPesquisaENTRADA_NUMERO: TIntegerField;
    fdQryPesquisaENTRADA_DOC_TIPO: TStringField;
    fdQryPesquisaENTRADA_DOC: TStringField;
    fdQryPesquisaENTRADA_DOC_NUMERO: TIntegerField;
    fdQryPesquisaENTRADA_DOC_SERIE: TStringField;
    fdQryPesquisaENTRADA_FORNECEDOR: TStringField;
    fdQryPesquisaENTRADA_FORNECEDOR_CNPJ: TStringField;
    fdQryPesquisaSELECIONAR: TSmallintField;
    CdsPesquisaSELECIONAR: TSmallintField;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TStringField;
    cdsPagamentosVALOR_BAIXA: TBCDField;
    cdsPagamentosNUMERO_CHEQUE: TStringField;
    cdsPagamentosEMPRESA: TStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosBCO_NOME: TStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TStringField;
    cdsPagamentosUSUARIO: TStringField;
    fdQryPesquisaVALORPAG: TFMTBCDField;
    fdQryPesquisaVALORMULTA: TFMTBCDField;
    fdQryPesquisaVALORPAGTOT: TFMTBCDField;
    fdQryPesquisaVALORSALDO: TFMTBCDField;
    fdQryPesquisaVALOR_APAGAR: TFMTBCDField;
    CdsPesquisaVALORPAG: TFMTBCDField;
    CdsPesquisaVALORMULTA: TFMTBCDField;
    CdsPesquisaVALORPAGTOT: TFMTBCDField;
    CdsPesquisaVALORSALDO: TFMTBCDField;
    CdsPesquisaVALOR_APAGAR: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure CdsPesquisaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure BtnQuitarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure QuitarDespesa;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

(*
  Tabelas:
  - TBCONTPAG
  - TBCONTPAG_BAIXA
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCOMPRAS
  - TBFORMPAGTO
  - TBBANCO_BOLETO

  Views:
  - VW_TIPO_DOCUMENTO_ENTRADA

  Procedures:

*)

var
  frmGeContasAPagarQuitar: TfrmGeContasAPagarQuitar;

implementation

uses
    DateUtils
  , Controller.Tabela
  , UDMBusiness
  , UDMRecursos
  , UConstantesDGE;

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

    with fdQryPesquisa do
    begin
      SQL.Clear;
      SQL.AddStrings( SQLSelect );
      SQL.Add('where c.empresa  = ' + QuotedStr(gUsuarioLogado.Empresa));
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
  CarregarListaDB(fdQryFormaPagto);

  e1Data.Date := GetMenorVencimentoAPagar;
  e2Data.Date := GetDateDB;

  cdsPagamentoLOTE.CreateDataSet;

  // Configurar tabela de pesquisa
  TTabelaController
    .New
    .Tabela( CdsPesquisa )
    .Display('VALORPAG', 'Despesa (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORMULTA', 'Multa (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORPAGTOT', 'Pago (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'Saldo (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_APAGAR', 'A Pagar (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( CdsPesquisa );
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

    if ( not CaixaAberto(gUsuarioLogado.Empresa, gUsuarioLogado.Login, cdsPagamentoLOTEDataPagto.AsDateTime, cdsPagamentoLOTEFormaPagto.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
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
        cdsPagamentosEMPRESA.Value     := CdsPesquisaEMPRESA.Value;
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
        cdsPagamentos.CommitUpdates;

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

procedure TfrmGeContasAPagarQuitar.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := Self.Caption + ' - ' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa);
end;

initialization
  FormFunction.RegisterForm('frmGeContasAPagarQuitar', TfrmGeContasAPagarQuitar);

end.
