unit UGeContasAReceberQuitar;

interface

uses
  UGrPadraoPesquisa,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, DBClient,
  Provider, DBCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvDBControls, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TfrmGeContasAReceberQuitar = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    PnlControleQuitacao: TPanel;
    GrpBxControleQuitacao: TGroupBox;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    CdsPesquisaSelecionados: TAggregateField;
    dtsFormaPagto: TDataSource;
    cdsRecebimentoLOTE: TClientDataSet;
    dtsRecebimentoLOTE: TDataSource;
    lblDataPagto: TLabel;
    cdsRecebimentoLOTEDataPagto: TDateTimeField;
    cdsRecebimentoLOTEFormaPagto: TIntegerField;
    cdsRecebimentoLOTEHistoricoGeral: TMemoField;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblHistorico: TLabel;
    dbHistorico: TDBMemo;
    BtnQuitar: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbDataPagto: TJvDBDateEdit;
    CdsPesquisaANOLANC: TSmallintField;
    CdsPesquisaNUMLANC: TIntegerField;
    CdsPesquisaPARCELA: TSmallintField;
    CdsPesquisaDTEMISS: TDateField;
    CdsPesquisaDTVENC: TDateField;
    CdsPesquisaDTREC: TDateField;
    fdQryFormaPagto: TFDQuery;
    cdsRecebimentos: TFDQuery;
    updRecebimentos: TFDUpdateSQL;
    cdsRecebimentosANOLANC: TSmallintField;
    cdsRecebimentosNUMLANC: TIntegerField;
    cdsRecebimentosSEQ: TSmallintField;
    cdsRecebimentosHISTORICO: TMemoField;
    cdsRecebimentosDATA_PAGTO: TDateField;
    cdsRecebimentosFORMA_PAGTO: TSmallintField;
    cdsRecebimentosFORMA_PAGTO_DESC: TStringField;
    cdsRecebimentosVALOR_BAIXA: TBCDField;
    cdsRecebimentosNUMERO_CHEQUE: TStringField;
    cdsRecebimentosEMPRESA: TStringField;
    cdsRecebimentosBANCO: TSmallintField;
    cdsRecebimentosBCO_NOME: TStringField;
    cdsRecebimentosDOCUMENTO_BAIXA: TStringField;
    cdsRecebimentosUSUARIO: TStringField;
    fdQryPesquisaANOLANC: TSmallintField;
    fdQryPesquisaNUMLANC: TIntegerField;
    fdQryPesquisaLANCAMENTO: TStringField;
    fdQryPesquisaEMPRESA: TStringField;
    fdQryPesquisaPARCELA: TSmallintField;
    fdQryPesquisaTIPPAG: TStringField;
    fdQryPesquisaDTEMISS: TDateField;
    fdQryPesquisaDTVENC: TDateField;
    fdQryPesquisaDTREC: TDateField;
    fdQryPesquisaSAIDA: TStringField;
    fdQryPesquisaSAIDA_ANO: TSmallintField;
    fdQryPesquisaSAIDA_NUMERO: TIntegerField;
    fdQryPesquisaSAIDA_DOC_TIPO: TStringField;
    fdQryPesquisaSAIDA_DOC: TStringField;
    fdQryPesquisaSAIDA_DOC_NUMERO: TLargeintField;
    fdQryPesquisaSAIDA_DOC_SERIE: TStringField;
    fdQryPesquisaSAIDA_FORNECEDOR: TStringField;
    fdQryPesquisaSAIDA_FORNECEDOR_CNPJ: TStringField;
    fdQryPesquisaSELECIONAR: TSmallintField;
    CdsPesquisaSELECIONAR: TSmallintField;
    CdsPesquisaLANCAMENTO: TStringField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaSAIDA: TStringField;
    CdsPesquisaSAIDA_ANO: TSmallintField;
    CdsPesquisaSAIDA_NUMERO: TIntegerField;
    CdsPesquisaSAIDA_DOC_TIPO: TStringField;
    CdsPesquisaSAIDA_DOC: TStringField;
    CdsPesquisaSAIDA_DOC_NUMERO: TLargeintField;
    CdsPesquisaSAIDA_DOC_SERIE: TStringField;
    CdsPesquisaSAIDA_FORNECEDOR: TStringField;
    CdsPesquisaSAIDA_FORNECEDOR_CNPJ: TStringField;
    CdsPesquisaTIPPAG: TStringField;
    fdQryPesquisaVALORREC: TFMTBCDField;
    fdQryPesquisaVALORMULTA: TFMTBCDField;
    fdQryPesquisaVALORRECTOT: TFMTBCDField;
    fdQryPesquisaVALORSALDO: TFMTBCDField;
    fdQryPesquisaVALOR_ARECEBER: TFMTBCDField;
    CdsPesquisaVALORREC: TFMTBCDField;
    CdsPesquisaVALORMULTA: TFMTBCDField;
    CdsPesquisaVALORRECTOT: TFMTBCDField;
    CdsPesquisaVALORSALDO: TFMTBCDField;
    CdsPesquisaVALOR_ARECEBER: TFMTBCDField;
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
  - TBCONTREC
  - TBCONTREC_BAIXA
  - TBEMPRESA
  - TBCLIENTE
  - TBVENDAS
  - TBFORMPAGTO
  - TBBANCO_BOLETO

  Views:

  Procedures:

*)

var
  frmGeContasAReceberQuitar: TfrmGeContasAReceberQuitar;

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
  
function TfrmGeContasAReceberQuitar.ExecutarPesquisa: Boolean;
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
      SQL.Add('where r.empresa  = ' + QuotedStr(gUsuarioLogado.Empresa));
      SQL.Add('  and r.situacao = 1');    // Situação Ativa
      SQL.Add('  and r.baixado  = 0');    // Não baixados
      SQL.Add('  and r.dtvenc between ' + QuotedStr(sDataInicial) + ' and ' + QuotedStr(sDataFinal));

      Case edTipoPesquisa.ItemIndex of
        TIPO_AUT:
          begin
            if FuncoesString.StrIsInt(edPesquisar.Text) then
              SQL.Add('  and r.cliente = ' + edPesquisar.Text)
            else  
            if FuncoesString.StrIsCPF(edPesquisar.Text) or FuncoesString.StrIsCNPJ(edPesquisar.Text) then
              SQL.Add('  and f.cnpj = ' + QuotedStr(edPesquisar.Text))
            else
              SQL.Add('  and ((f.nome like ' + QuotedStr(edPesquisar.Text + '%') + ') or (f.nomefant like ' + QuotedStr(edPesquisar.Text + '%') + '))');
          end;
      end;

      SQL.Add('order by r.dtvenc, f.nome');
    end;

    CdsPesquisa.Open;

    Result := not CdsPesquisa.IsEmpty;
  finally
    Screen.Cursor := crDefault;

    if cdsRecebimentoLOTE.Active then
      cdsRecebimentoLOTE.Close;

    cdsRecebimentoLOTE.Open;
    while not cdsRecebimentoLOTE.Eof do
      cdsRecebimentoLOTE.Delete;

    cdsRecebimentoLOTE.Append;
    cdsRecebimentoLOTEDataPagto.AsDateTime := GetDateDB;
    cdsRecebimentoLOTEFormaPagto.Clear;
    cdsRecebimentoLOTEHistoricoGeral.Clear;
  end;
end;

procedure TfrmGeContasAReceberQuitar.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarListaDB(fdQryFormaPagto);

  e1Data.Date := GetMenorVencimentoAReceber;
  e2Data.Date := GetDateDB;

  cdsRecebimentoLOTE.CreateDataSet;

  // Configurar tabela de pesquisa
  TTabelaController
    .New
    .Tabela( CdsPesquisa )
    .Display('VALORREC', 'Receita (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORMULTA', 'Multa (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORRECTOT', 'Recebido (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'Saldo (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_ARECEBER', 'A Receber (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( CdsPesquisa );
end;

procedure TfrmGeContasAReceberQuitar.CdsPesquisaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if Sender.AsInteger = 0 then
      Text := '.'
    else
      Text := 'X';  
end;

procedure TfrmGeContasAReceberQuitar.dbgDadosKeyPress(Sender: TObject;
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

procedure TfrmGeContasAReceberQuitar.BtnQuitarClick(Sender: TObject);
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
  if cdsRecebimentoLOTEDataPagto.IsNull then
  begin
    ShowWarning('Favor informar a Data de Pagamento para os lançamentos selecionados!');
    dbDataPagto.SetFocus;
  end
  else
  if cdsRecebimentoLOTEFormaPagto.IsNull then
  begin
    ShowWarning('Favor informar a Forma de Pagamento para os lançamentos selecionados!');
    dbFormaPagto.SetFocus;
  end
  else
  if Trim(cdsRecebimentoLOTEHistoricoGeral.AsString) = EmptyStr then
  begin
    ShowWarning('Favor informar um histório geral para os lançamentos selecionados!');
    dbHistorico.SetFocus;
  end
  else
    if ShowConfirm('Confirma a quitação dos lançamentos de despesas selecionados?', 'Quitação por Lote') then
      try
        cdsRecebimentoLOTE.Post;
        QuitarDespesa;
      finally
        CdsPesquisa.Close;
        CdsPesquisa.Open;
      end;
end;

procedure TfrmGeContasAReceberQuitar.QuitarDespesa;
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

    if ( not CaixaAberto(gUsuarioLogado.Empresa, gUsuarioLogado.Login, cdsRecebimentoLOTEDataPagto.AsDateTime, cdsRecebimentoLOTEFormaPagto.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento desta quitação.');
      Exit;
    end;

    cTotalPago := 0.0;
    
    while not CdsPesquisa.Eof do
    begin
      if not cdsRecebimentos.Active then
        cdsRecebimentos.Open;

      if (CdsPesquisaSELECIONAR.AsInteger = 1) then
      begin
        // 1. Gerar Registro de Pagamento

        cdsRecebimentos.Append;

        cdsRecebimentosANOLANC.Value     := CdsPesquisaANOLANC.Value;
        cdsRecebimentosNUMLANC.Value     := CdsPesquisaNUMLANC.Value;
        cdsRecebimentosEMPRESA.Value     := CdsPesquisaEMPRESA.Value;
        cdsRecebimentosSEQ.Value         := GetNextID('TBCONTREC_BAIXA', 'SEQ', 'where anolanc = ' + CdsPesquisaANOLANC.AsString + ' and numlanc = ' + CdsPesquisaNUMLANC.AsString);
        cdsRecebimentosDATA_PAGTO.Value  := cdsRecebimentoLOTEDataPagto.Value;
        cdsRecebimentosUSUARIO.Value     := GetUserApp;
        cdsRecebimentosVALOR_BAIXA.Value := CdsPesquisaVALOR_ARECEBER.AsCurrency;
        cdsRecebimentosFORMA_PAGTO.Value      := cdsRecebimentoLOTEFormaPagto.Value;
        cdsRecebimentosFORMA_PAGTO_DESC.Value := Trim(dbFormaPagto.Text);
        cdsRecebimentosHISTORICO.AsString     := AnsiUpperCase(Trim(cdsRecebimentoLOTEHistoricoGeral.AsString)) + ' (RECEBIMENTO REALIZADO EM LOTE POR ' + GetUserApp + ')';

        if (Copy(cdsRecebimentosHISTORICO.AsString, Length(cdsRecebimentosHISTORICO.AsString), 1) = '.') then
          cdsRecebimentosHISTORICO.AsString := Copy(cdsRecebimentosHISTORICO.AsString, 1, Length(cdsRecebimentosHISTORICO.AsString) - 1);

        cdsRecebimentos.Post;
        cdsRecebimentos.ApplyUpdates;
        cdsRecebimentos.CommitUpdates;

        CommitTransaction;

        // 2. Gerar Registro de Movimento de Caixa (Tesouraria)

        SetMovimentoCaixa(
          GetUserApp,
          cdsRecebimentosDATA_PAGTO.AsDateTime + Time,
          cdsRecebimentosFORMA_PAGTO.AsInteger,
          cdsRecebimentosANOLANC.AsInteger,
          cdsRecebimentosNUMLANC.AsInteger,
          cdsRecebimentosSEQ.AsInteger,
          cdsRecebimentosVALOR_BAIXA.AsCurrency,
          tmcxCredito);

        cTotalPago := cTotalPago + CdsPesquisaVALOR_ARECEBER.AsCurrency;
      end;

      CdsPesquisa.Next;
    end;
  finally
    // 3. Gerar/Atualizar Saldo do Dia

    if ( (cTotalPago > 0.0) and (CxContaCorrente > 0) ) then
    begin
      GerarSaldoContaCorrente(CxContaCorrente, cdsRecebimentoLOTEDataPagto.AsDateTime);
      ShowInformation('Quitação por Lote relalizado com sucesso!');
    end;

    CdsPesquisa.First;
    CdsPesquisa.EnableControls;
  end;
end;

procedure TfrmGeContasAReceberQuitar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_ESCAPE ) then
    Self.Close
end;

procedure TfrmGeContasAReceberQuitar.FormShow(Sender: TObject);
begin
  inherited;
  Self.Caption := Self.Caption + ' - ' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa);
end;

initialization
  FormFunction.RegisterForm('frmGeContasAReceberQuitar', TfrmGeContasAReceberQuitar);

end.
