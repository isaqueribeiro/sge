unit UGeContasAPagarImpressao;

interface

uses
  UGrPadraoImpressao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxGDIPlusClasses, ExtCtrls, Buttons, ComCtrls, Mask, frxClass, frxDBSet, DBClient,
  Provider, DB, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, JvExMask, JvToolEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinsDefaultPainters;

type
  TfrmGeContasAPagarImpressao = class(TfrmGrPadraoImpressao)
    lblData: TLabel;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    frRelacaoAPagarVSintetico: TfrxReport;
    DspRelacaoAPagarVSintetico: TDataSetProvider;
    CdsRelacaoAPagarVSintetico: TClientDataSet;
    FrdsRelacaoAPagarVSintetico: TfrxDBDataset;
    DspRelacaoAPagarVAnalitico: TDataSetProvider;
    CdsRelacaoAPagarVAnalitico: TClientDataSet;
    FrdsRelacaoAPagarVAnalitico: TfrxDBDataset;
    frRelacaoAPagarVAnalitico: TfrxReport;
    lblTipoDespesa: TLabel;
    edTipoDespesa: TComboBox;
    DspTipoDespesa: TDataSetProvider;
    CdsTipoDespesa: TClientDataSet;
    lblFornecedor: TLabel;
    DspFornecedor: TDataSetProvider;
    CdsFornecedor: TClientDataSet;
    frRelacaoAPagarESintetico: TfrxReport;
    DspRelacaoAPagarESintetico: TDataSetProvider;
    CdsRelacaoAPagarESintetico: TClientDataSet;
    FrdsRelacaoAPagarESintetico: TfrxDBDataset;
    frRelacaoAPagarEAnalitico: TfrxReport;
    frRelacaoAPagarBSintetico: TfrxReport;
    DspRelacaoAPagarBSintetico: TDataSetProvider;
    CdsRelacaoAPagarBSintetico: TClientDataSet;
    FrdsRelacaoAPagarBSintetico: TfrxDBDataset;
    frRelacaoAPagarBAnalitico: TfrxReport;
    frRelacaoAPagarTPDespesaSintetico: TfrxReport;
    frRelacaoAPagarTPDespesaAnalitico: TfrxReport;
    dbDespesaParticular: TCheckBox;
    frRelacaoAPagarVFornecedor: TfrxReport;
    DspRelacaoAPagarVFornecedor: TDataSetProvider;
    CdsRelacaoAPagarVFornecedor: TClientDataSet;
    FrdsRelacaoAPagarVFornecedor: TfrxDBDataset;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    DspRelacaoAPagarTPDespesaFornecedor: TDataSetProvider;
    CdsRelacaoAPagarTPDespesaFornecedor: TClientDataSet;
    FrdsRelacaoAPagarTPDespesaFornecedor: TfrxDBDataset;
    frRelacaoAPagarTPDespesaFornecedor: TfrxReport;
    frRelacaoAPagarAPSintetico: TfrxReport;
    frRelacaoAPagarAPAnalitico: TfrxReport;
    frRelacaoAPagarAPFornecedor: TfrxReport;
    fdQryEmpresas: TFDQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    fdQryTipoDespesa: TFDQuery;
    fdQryFornecedor: TFDQuery;
    frRelacaoExtratoFornVSintetico: TfrxReport;
    frRelacaoExtratoFornVAnalitico: TfrxReport;
    dtsFornecedor: TDataSource;
    edFornecedor: TcxLookupComboBox;
    QryRelacaoAPagarVSintetico: TFDQuery;
    QryRelacaoAPagarVAnalitico: TFDQuery;
    QryRelacaoAPagarVFornecedor: TFDQuery;
    QryRelacaoAPagarESintetico: TFDQuery;
    QryRelacaoAPagarBSintetico: TFDQuery;
    QryRelacaoAPagarTPDespesaFornecedor: TFDQuery;
    frRelacaoAPagarVSimplificado: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure edTipoDespesaChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoAPagarAnalit          ,
    FSQL_RelacaoAPagarEmissaoSintet   ,
    FSQL_RelacaoAPagarVencimentoSintet,
    FSQL_RelacaoAPagarVencimentoFornec,
    FSQL_RelacaoAPagarBaixaSintet     ,
    FSQL_RelacaoAPagarTPDespesaFornec : TStringList;
    IEmpresa : Array of String;
    ITipoDespesa : Array of Integer;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarTipoDespesa;
    procedure CarregarFornecedor;

    procedure MontarRelacaoAPagarPorVencimentoSintetico;
    procedure MontarRelacaoAPagarPorVencimentoAnalitico;
    procedure MontarRelacaoAPagarPorVencimentoFornecedor;
    procedure MontarRelacaoAPagarPorEmissaoSintetico;
    procedure MontarRelacaoAPagarPorEmissaoAnalitico;
    procedure MontarRelacaoAPagarPorBaixaSintetico;
    procedure MontarRelacaoAPagarPorBaixaAnalitico;
    procedure MontarRelacaoExtratoFornPorVencimentoSintetico;
    procedure MontarRelacaoExtratoFornPorVencimentoAnalitico;
    procedure MontarRelacaoAPagarPorTPDespesaSintetico;
    procedure MontarRelacaoAPagarPorTPDespesaAnalitico;
    procedure MontarRelacaoAPagarPorTPDespesaFornecedor;
    procedure MontarRelacaoAPagarPorCompetenciaApuracaoSintetico;
    procedure MontarRelacaoAPagarPorCompetenciaApuracaoAnalitico;
    procedure MontarRelacaoAPagarPorCompetenciaApuracaoFornecedor;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCONTPAG
  - TBFORNECEDOR
  - TBTPDESPESA
  - TBCOMPRAS
  - TBFORMPAGTO
  - TBCOMPETENCIA
  - TBCIDADE
  - TBESTADO

  Views:
  - VW_EMPRESA

  Procedures:

*)

var
  frmGeContasAPagarImpressao: TfrmGeContasAPagarImpressao;

const
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_SINTETICO  = 0;
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_ANALITICO  = 1;
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_FORNECEDOR = 2;
  REPORT_RELACAO_APAGAR_POR_VENCIMENTO_SIMPLIFICADO = 3;
  REPORT_RELACAO_APAGAR_POR_EMISSAO_SINTETICO     = 4;
  REPORT_RELACAO_APAGAR_POR_EMISSAO_ANALITICO     = 5;
  REPORT_RELACAO_APAGAR_POR_BAIXA_SINTETICO       = 6;
  REPORT_RELACAO_APAGAR_POR_BAIXA_ANALITICO       = 7;
  REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_SINTETICO = 8;
  REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_ANALITICO = 9;
  REPORT_RELACAO_APAGAR_POR_TPDESPESA_SINTETICO   = 10;
  REPORT_RELACAO_APAGAR_POR_TPDESPESA_ANALITICO   = 11;
  REPORT_RELACAO_APAGAR_POR_TPDESPESA_FORNECEDOR  = 12;
  REPORT_RELACAO_APAGAR_POR_CMP_APURACAO_SINTETICO  = 13;
  REPORT_RELACAO_APAGAR_POR_CMP_APURACAO_ANALITICO  = 14;
  REPORT_RELACAO_APAGAR_POR_CMP_APURACAO_FORNECEDOR = 15;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMRecursos, DateUtils, UDMNFe;

{$R *.dfm}

const
  TITULO_TODOS     = 0;
  TITULO_BAIXADO   = 1;
  TITULO_PENDENTE  = 2;
  TITULO_CANCELADO = 3;

{ TfrmGeContasAReceberImpressao }

procedure TfrmGeContasAPagarImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := TITULO_PENDENTE;

  inherited;

  FSQL_RelacaoAPagarAnalit := TStringList.Create;
  FSQL_RelacaoAPagarAnalit.AddStrings( QryRelacaoAPagarVAnalitico.SQL );

  FSQL_RelacaoAPagarVencimentoSintet := TStringList.Create;
  FSQL_RelacaoAPagarVencimentoSintet.AddStrings( QryRelacaoAPagarVSintetico.SQL );

  FSQL_RelacaoAPagarVencimentoFornec := TStringList.Create;
  FSQL_RelacaoAPagarVencimentoFornec.AddStrings( QryRelacaoAPagarVFornecedor.SQL );

  FSQL_RelacaoAPagarEmissaoSintet := TStringList.Create;
  FSQL_RelacaoAPagarEmissaoSintet.AddStrings( QryRelacaoAPagarESintetico.SQL );

  FSQL_RelacaoAPagarBaixaSintet := TStringList.Create;
  FSQL_RelacaoAPagarBaixaSintet.AddStrings( QryRelacaoAPagarBSintetico.SQL );

  FSQL_RelacaoAPagarTPDespesaFornec := TStringList.Create;
  FSQL_RelacaoAPagarTPDespesaFornec.AddStrings( QryRelacaoAPagarTPDespesaFornecedor.SQL );
end;

procedure TfrmGeContasAPagarImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  if (Sender = btnVisualizar) then
  begin
    if (edRelatorio.ItemIndex in [REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_SINTETICO, REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_ANALITICO]) then
      if (edFornecedor.ItemIndex = 0) then
      begin
        ShowWarning('Favor selecionar o fornecedor');
        if edFornecedor.Visible and edFornecedor.Enabled then
          edFornecedor.SetFocus;
        Exit;
      end;
  end;

  SetAtualizarSaldoContasAPagar(IEmpresa[edEmpresa.ItemIndex]);

  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '       + #13 +
    Format('- Período  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situação : %s', [edSituacao.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Por Data de Vencimento

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_SINTETICO:
      begin
        MontarRelacaoAPagarPorVencimentoSintetico;
        frReport := frRelacaoAPagarVSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_ANALITICO:
      begin
        MontarRelacaoAPagarPorVencimentoAnalitico;
        frReport := frRelacaoAPagarVAnalitico;
      end;

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_FORNECEDOR:
      begin
        MontarRelacaoAPagarPorVencimentoFornecedor;
        frReport := frRelacaoAPagarVFornecedor;
      end;

    REPORT_RELACAO_APAGAR_POR_VENCIMENTO_SIMPLIFICADO:
      begin
        MontarRelacaoAPagarPorVencimentoAnalitico;
        frReport := frRelacaoAPagarVSimplificado;
      end;

    REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_SINTETICO:
      begin
        MontarRelacaoExtratoFornPorVencimentoSintetico;
        frReport := frRelacaoExtratoFornVSintetico;
      end;

    REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_ANALITICO:
      begin
        MontarRelacaoExtratoFornPorVencimentoAnalitico;
        frReport := frRelacaoExtratoFornVAnalitico;
      end;

    // Por Data de Emissão

    REPORT_RELACAO_APAGAR_POR_EMISSAO_SINTETICO:
      begin
        MontarRelacaoAPagarPorEmissaoSintetico;
        frReport := frRelacaoAPagarESintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_EMISSAO_ANALITICO:
      begin
        MontarRelacaoAPagarPorEmissaoAnalitico;
        frReport := frRelacaoAPagarEAnalitico;
      end;

    // Por Data de Baixa (Pagamento)

    REPORT_RELACAO_APAGAR_POR_BAIXA_SINTETICO:
      begin
        MontarRelacaoAPagarPorBaixaSintetico;
        frReport := frRelacaoAPagarBSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_BAIXA_ANALITICO:
      begin
        MontarRelacaoAPagarPorBaixaAnalitico;
        frReport := frRelacaoAPagarBAnalitico;
      end;

    // Por Tipo de Despesas (Data de Vencimento)

    REPORT_RELACAO_APAGAR_POR_TPDESPESA_SINTETICO:
      begin
        MontarRelacaoAPagarPorTPDespesaSintetico;
        frReport := frRelacaoAPagarTPDespesaSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_TPDESPESA_ANALITICO:
      begin
        MontarRelacaoAPagarPorTPDespesaAnalitico;
        frReport := frRelacaoAPagarTPDespesaAnalitico;
      end;

    REPORT_RELACAO_APAGAR_POR_TPDESPESA_FORNECEDOR:
      begin
        MontarRelacaoAPagarPorTPDespesaFornecedor;
        frReport := frRelacaoAPagarTPDespesaFornecedor;
      end;

    // Por Competência de Apuração

    REPORT_RELACAO_APAGAR_POR_CMP_APURACAO_SINTETICO:
      begin
        MontarRelacaoAPagarPorCompetenciaApuracaoSintetico;
        frReport := frRelacaoAPagarAPSintetico;
      end;

    REPORT_RELACAO_APAGAR_POR_CMP_APURACAO_ANALITICO:
      begin
        MontarRelacaoAPagarPorCompetenciaApuracaoAnalitico;
        frReport := frRelacaoAPagarAPAnalitico;
      end;

    REPORT_RELACAO_APAGAR_POR_CMP_APURACAO_FORNECEDOR:
      begin
        MontarRelacaoAPagarPorCompetenciaApuracaoFornecedor;
        frReport := frRelacaoAPagarAPFornecedor;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorVencimentoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc) || right(''00'' || extract(month from cp.dtvenc), 2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a pagar por vencimento/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorVencimentoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVSintetico.Close;

    with QryRelacaoAPagarVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.competencia_apuracao');
      SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por vencimento.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoExtratoFornPorVencimentoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc) || right(''00'' || extract(month from cp.dtvenc), 2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de extrato do fornecedor por vencimento.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoExtratoFornPorVencimentoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVSintetico.Close;

    with QryRelacaoAPagarVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.competencia_apuracao');
      SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de extrato do fornecedor por vencimento.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.CarregarTipoDespesa;
var
  X ,
  I : Integer;
begin
  X := 0;
  edTipoDespesa.OnChange := nil;

  with CdsTipoDespesa do
  begin
    Open;

    edTipoDespesa.Clear;
    SetLength(ITipoDespesa, RecordCount + 1);

    edTipoDespesa.Items.Add('(Todas)');
    ITipoDespesa[0] := 0;

    I := 1;

    while not Eof do
    begin
      edTipoDespesa.Items.Add( FieldByName('tipodesp').AsString);
      ITipoDespesa[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edTipoDespesa.OnChange  := edTipoDespesaChange;
  edTipoDespesa.ItemIndex := X;
end;

procedure TfrmGeContasAPagarImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarTipoDespesa;
  CarregarFornecedor;
end;

procedure TfrmGeContasAPagarImpressao.CarregarFornecedor;
begin
  if not CdsFornecedor.Active then
  begin
    CdsFornecedor.Open;
    edFornecedor.EditValue := 0;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorEmissaoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtemiss) || right(''00'' || extract(month from cp.dtemiss), 2)');
      SQL.Add('  , cp.dtemiss');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a pagar por emissão/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorEmissaoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas emitidas no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarESintetico.Close;

    with QryRelacaoAPagarESintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarEmissaoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtemiss)  || right(''00'' || extract(month from cp.dtemiss),  2)');
      SQL.Add('  , cp.dtemiss');
      SQL.Add('  , ce.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtemiss)  || right(''00'' || extract(month from cp.dtemiss),  2)');
      SQL.Add('  , cp.dtemiss');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por emissão.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorBaixaAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Duplicatas baixadas no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtpag >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtpag <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtpag) || right(''00'' || extract(month from cp.dtpag), 2)');
      SQL.Add('  , cp.dtpag');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a pagar por baixa/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorBaixaSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas baixadas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas baixadas no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarBSintetico.Close;

    with QryRelacaoAPagarBSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarBaixaSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtpag >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtpag <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtpag)  || right(''00'' || extract(month from cp.dtpag),  2)');
      SQL.Add('  , cp.dtpag');
      SQL.Add('  , mp.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtpag)  || right(''00'' || extract(month from cp.dtpag),  2)');
      SQL.Add('  , cp.dtpag');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por baixa (pagamento).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorCompetenciaApuracaoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    cp.competencia_apuracao');
      SQL.Add('  , extract(year from cp.dtvenc) || right(''00'' || extract(month from cp.dtvenc), 2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a pagar por competência de apuração/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorCompetenciaApuracaoFornecedor;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVFornecedor.Close;

    with QryRelacaoAPagarVFornecedor do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoFornec );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cp.competencia_apuracao');
      SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');
      SQL.Add('  , fn.pessoa_fisica');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    cp.competencia_apuracao');
      SQL.Add('  , extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');

      SQL.Text := StringReplace(SQL.Text, '----', '', [rfReplaceAll]);
      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por competência de apuração/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorCompetenciaApuracaoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVSintetico.Close;

    with QryRelacaoAPagarVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.competencia_apuracao');
      SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    cp.competencia_apuracao');
      SQL.Add('  , extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.codtpdesp');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por competência de apuração.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  if ( (edRelatorio.ItemIndex = REPORT_RELACAO_APAGAR_POR_BAIXA_SINTETICO)
    or (edRelatorio.ItemIndex = REPORT_RELACAO_APAGAR_POR_BAIXA_ANALITICO)
    or (edRelatorio.ItemIndex = REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_SINTETICO)
    or (edRelatorio.ItemIndex = REPORT_RELACAO_EXTRATO_POR_VENCIMENTO_ANALITICO) ) then
  begin
    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := TITULO_TODOS;
  end
  else
  begin
    edSituacao.Enabled   := True;
    edSituacao.ItemIndex := TITULO_PENDENTE;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorTPDespesaSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVSintetico.Close;

    with QryRelacaoAPagarVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoSintet );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.competencia_apuracao');
      SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por tipos de despesas.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorTPDespesaAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVAnalitico.Close;

    with QryRelacaoAPagarVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarAnalit );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.tipodesp');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , extract(year from cp.dtvenc) || right(''00'' || extract(month from cp.dtvenc), 2)');
      SQL.Add('  , cp.dtvenc');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a pagar por tipo de despesa/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorTPDespesaFornecedor;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarTPDespesaFornecedor.Close;

    with QryRelacaoAPagarTPDespesaFornecedor do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarTPDespesaFornec );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');
      SQL.Add('  , fn.pessoa_fisica');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    cp.codtpdesp');
      SQL.Add('  , d.tipodesp');
      SQL.Add('  , extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por tipos de despesas/fornecedores.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.edTipoDespesaChange(Sender: TObject);
begin
  if not CdsTipoDespesa.Active then
    CdsTipoDespesa.Open;

  if CdsTipoDespesa.Locate('cod', ITipoDespesa[edTipoDespesa.ItemIndex], []) then
    dbDespesaParticular.Checked := (CdsTipoDespesa.FieldByName('tipo_particular').AsInteger = 0);
end;

procedure TfrmGeContasAPagarImpressao.MontarRelacaoAPagarPorVencimentoFornecedor;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edFornecedor.ItemIndex = 0) then
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Despesas com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edFornecedor.Text]) + #13;

    if (edTipoDespesa.ItemIndex > 0) then
      PeriodoRelatorio := '[' + Trim(AnsiUpperCase(edTipoDespesa.Text)) +  '] ' + PeriodoRelatorio;

    CdsRelacaoAPagarVFornecedor.Close;

    with QryRelacaoAPagarVFornecedor do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAPagarVencimentoFornec );
      SQL.Add('where (cp.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cp.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cp.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and ((cp.quitado = 1) and (cp.situacao = 1))');

        TITULO_PENDENTE:
          SQL.Add('  and ((cp.quitado = 0) and (cp.situacao = 1))');

        TITULO_CANCELADO:
          SQL.Add('  and (cp.situacao = 0)');
      end;

      if ( edTipoDespesa.ItemIndex > 0 ) then
        SQL.Add('  and (cp.codtpdesp = ' + IntToStr(ITipoDespesa[edTipoDespesa.ItemIndex]) + ')');

      if ( edFornecedor.ItemIndex > 0 ) and ( VarToStr(edFornecedor.EditValue) <> '0' ) then
        SQL.Add('  and (cp.codforn = ' + VarToStr(edFornecedor.EditValue) + ')');

      if ( dbDespesaParticular.Checked ) then
        SQL.Add('  and (d.tipo_particular = 0)');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cp.dtvenc');
      //SQL.Add('  , cp.competencia_apuracao');
      //SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , cp.situacao');
      SQL.Add('  , cp.codforn');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');
      SQL.Add('  , fn.pessoa_fisica');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cp.dtvenc)  || right(''00'' || extract(month from cp.dtvenc),  2)');
      SQL.Add('  , cp.dtvenc');
      SQL.Add('  , fn.nomeforn');
      SQL.Add('  , fn.cnpj');

      SQL.SaveToFile('log.sql');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a pagar por vencimento/fornecedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAPagarImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeContasAPagarImpressao.CarregarEmpresa;
var
  P ,
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount);

    P := 0;
    I := 0;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('razao').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      if ( IEmpresa[I] = gUsuarioLogado.Empresa ) then
        P := I;
        
      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := P;
end;

initialization
  FormFunction.RegisterForm('frmGeContasAPagarImpressao', TfrmGeContasAPagarImpressao);

end.
