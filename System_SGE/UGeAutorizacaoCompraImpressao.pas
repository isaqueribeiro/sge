unit UGeAutorizacaoCompraImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoImpressao, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, frxClass, frxDBSet;

type
  TfrmGeAutorizacaoCompraImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    frRelacaoAutorizacaoGeralSintetico: TfrxReport;
    qryRelacaoAutorizacaoGeralSintetico: TIBQuery;
    dspRelacaoAutorizacaoGeralSintetico: TDataSetProvider;
    cdsRelacaoAutorizacaoGeralSintetico: TClientDataSet;
    frdsRelacaoAutorizacaoGeralSintetico: TfrxDBDataset;
    frRelacaoAutorizacaoGeralAnalitico: TfrxReport;
    QryRelacaoAutorizacaoGeralAnalitico: TIBQuery;
    DspRelacaoAutorizacaoGeralAnalitico: TDataSetProvider;
    CdsRelacaoAutorizacaoGeralAnalitico: TClientDataSet;
    frdsRelacaoAutorizacaoGeralAnalitico: TfrxDBDataset;
    frRelacaoAutorizacaoLista: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    FSQL_AutorizacaoGeralS ,
    FSQL_AutorizacaoGeralA : TStringList;
    IEmpresa : Array of String;
  public
    { Public declarations }
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure MontarAutotizacaoGeralSintetico;
    procedure MontarAutotizacaoGeralAnalitico;
    procedure MontarAutotizacaoLista;
  end;

var
  frmGeAutorizacaoCompraImpressao: TfrmGeAutorizacaoCompraImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe;

{$R *.dfm}

const
  REPORT_RELACAO_AUTORIZACAO_SINTETICO = 0;
  REPORT_RELACAO_AUTORIZACAO_ANALITICO = 1;
  REPORT_RELACAO_AUTORIZACAO_LISTA     = 2;

  SITUACAO_AUTORIACAO_PADRAO = 0; // (Todas)

procedure TfrmGeAutorizacaoCompraImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
    Format('- Empresa  : %s', [edEmpresa.Text])          + #13 +
    Format('- Período  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situação : %s', [edSituacao.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Geral por Data de Emissão

    REPORT_RELACAO_AUTORIZACAO_SINTETICO:
      begin
        MontarAutotizacaoGeralSintetico;
        frReport := frRelacaoAutorizacaoGeralSintetico;

      end;

    REPORT_RELACAO_AUTORIZACAO_ANALITICO:
      begin
        MontarAutotizacaoGeralAnalitico;
        frReport := frRelacaoAutorizacaoGeralAnalitico;
      end;

    REPORT_RELACAO_AUTORIZACAO_LISTA:
      begin
        MontarAutotizacaoLista;
        frReport := frRelacaoAutorizacaoLista;
      end;
 end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeAutorizacaoCompraImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeAutorizacaoCompraImpressao.CarregarEmpresa;
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
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      if ( IEmpresa[I] = GetEmpresaIDDefault ) then
        P := I;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := P;
end;

procedure TfrmGeAutorizacaoCompraImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := SITUACAO_AUTORIACAO_PADRAO; // Entradas finalizadas e com NF-e emitidas

  inherited;
  RotinaID := ROTINA_REL_AUTORIZACAO_ID;

  CarregarEmpresa;

  FSQL_AutorizacaoGeralS := TStringList.Create;
  FSQL_AutorizacaoGeralS.AddStrings( qryRelacaoAutorizacaoGeralSintetico.SQL );

  FSQL_AutorizacaoGeralA := TStringList.Create;
  FSQL_AutorizacaoGeralA.AddStrings( qryRelacaoAutorizacaoGeralAnalitico.SQL );
end;

procedure TfrmGeAutorizacaoCompraImpressao.MontarAutotizacaoGeralAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    PeriodoRelatorio := Format('Autorizações emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoAutorizacaoGeralAnalitico.Close;

    with QryRelacaoAutorizacaoGeralAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_AutorizacaoGeralA );
      SQL.Add('where a.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and a.emissao_data >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and a.emissao_data <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_ABR));
        2: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_AUT));
        3: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_FAT));
        4: SQL.Add('  and a.status in (' + IntToStr(STATUS_AUTORIZACAO_AUT) + ', ' + IntToStr(STATUS_AUTORIZACAO_FAT) + ')');
        5: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_CAN));

        else
          SQL.Add('  and a.status > ' + IntToStr(STATUS_AUTORIZACAO_ABR)); // Todas as autorizações, com excesão das "abertas"
      end;

      SQL.Add('order by');
      SQL.Add('    a.competencia -- Competencia');
      SQL.Add('  , a.tipo        -- Tipo');
      SQL.Add('  , f.nomeforn');
      SQL.Add('  , a.fornecedor  -- Fornecedor');
      SQL.Add('  , a.emissao_data');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de autorizações (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeAutorizacaoCompraImpressao.MontarAutotizacaoGeralSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    PeriodoRelatorio := Format('Autorizações emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    cdsRelacaoAutorizacaoGeralSintetico.Close;

    with qryRelacaoAutorizacaoGeralSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_AutorizacaoGeralS );
      SQL.Add('where a.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and a.emissao_data >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and a.emissao_data <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_ABR));
        2: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_AUT));
        3: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_FAT));
        4: SQL.Add('  and a.status in (' + IntToStr(STATUS_AUTORIZACAO_AUT) + ', ' + IntToStr(STATUS_AUTORIZACAO_FAT) + ')');
        5: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_CAN));

        else
          SQL.Add('  and a.status > ' + IntToStr(STATUS_AUTORIZACAO_ABR)); // Todas as autorizações, com excesão das "abertas"
      end;

      SQL.Add('group by');
      SQL.Add('    a.tipo');
      SQL.Add('  , ta.descricao');
      SQL.Add('  , a.competencia');
      SQL.Add('  , ca.cmp_desc');
      SQL.Add('  , a.status');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    a.tipo');
      SQL.Add('  , a.competencia');
      SQL.Add('  , a.status');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de autorizações (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeAutorizacaoCompraImpressao.MontarAutotizacaoLista;
begin
  try
    SubTituloRelario := edSituacao.Text;

    PeriodoRelatorio := Format('Autorizações emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoAutorizacaoGeralAnalitico.Close;

    with QryRelacaoAutorizacaoGeralAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_AutorizacaoGeralA );
      SQL.Add('where a.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and a.emissao_data >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and a.emissao_data <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_ABR));
        2: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_AUT));
        3: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_FAT));
        4: SQL.Add('  and a.status in (' + IntToStr(STATUS_AUTORIZACAO_AUT) + ', ' + IntToStr(STATUS_AUTORIZACAO_FAT) + ')');
        5: SQL.Add('  and a.status = ' + IntToStr(STATUS_AUTORIZACAO_CAN));

        else
          SQL.Add('  and a.status > ' + IntToStr(STATUS_AUTORIZACAO_ABR)); // Todas as autorizações, com excesão das "abertas"
      end;

      SQL.Add('order by');
      SQL.Add('    a.tipo        -- Tipo');
      SQL.Add('  , a.emissao_data');
      SQL.Add('  , f.nomeforn');
      SQL.Add('  , a.fornecedor  -- Fornecedor');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação (lista) de autorizações (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeAutorizacaoCompraImpressao', TfrmGeAutorizacaoCompraImpressao);

end.
