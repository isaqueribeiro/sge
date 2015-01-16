unit UGeContasAReceberImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ToolWin, ComCtrls, Mask, rxToolEdit, frxClass, frxDBSet,
  DBClient, Provider, DB, IBCustomDataSet, IBQuery, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeContasAReceberImpressao = class(TfrmGrPadraoImpressao)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    frRelacaoAReceberVSintetico: TfrxReport;
    QryRelacaoAReceberVSintetico: TIBQuery;
    DspRelacaoAReceberVSintetico: TDataSetProvider;
    CdsRelacaoAReceberVSintetico: TClientDataSet;
    FrdsRelacaoAReceberVSintetico: TfrxDBDataset;
    QryRelacaoAReceberVAnalitico: TIBQuery;
    DspRelacaoAReceberVAnalitico: TDataSetProvider;
    CdsRelacaoAReceberVAnalitico: TClientDataSet;
    FrdsRelacaoAReceberVAnalitico: TfrxDBDataset;
    frRelacaoAReceberVAnalitico: TfrxReport;
    lblCompetencia: TLabel;
    edCompetencia: TComboBox;
    QryCompetencia: TIBQuery;
    DspCompetencia: TDataSetProvider;
    CdsCompetencia: TClientDataSet;
    lblCliente: TLabel;
    edCliente: TComboBox;
    QryCliente: TIBQuery;
    DspCliente: TDataSetProvider;
    CdsCliente: TClientDataSet;
    frRelacaoAReceberESintetico: TfrxReport;
    QryRelacaoAReceberESintetico: TIBQuery;
    DspRelacaoAReceberESintetico: TDataSetProvider;
    CdsRelacaoAReceberESintetico: TClientDataSet;
    FrdsRelacaoAReceberESintetico: TfrxDBDataset;
    frRelacaoAReceberEAnalitico: TfrxReport;
    frRelacaoAReceberBSintetico: TfrxReport;
    QryRelacaoAReceberBSintetico: TIBQuery;
    DspRelacaoAReceberBSintetico: TDataSetProvider;
    CdsRelacaoAReceberBSintetico: TClientDataSet;
    FrdsRelacaoAReceberBSintetico: TfrxDBDataset;
    frRelacaoAReceberBAnalitico: TfrxReport;
    frRelacaoAReceberVCliente: TfrxReport;
    QryRelacaoAReceberVCliente: TIBQuery;
    DspRelacaoAReceberVCliente: TDataSetProvider;
    CdsRelacaoAReceberVCliente: TClientDataSet;
    FrdsRelacaoAReceberVCliente: TfrxDBDataset;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCompetenciaChange(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoAReceberAnalit           ,
    FSQL_RelacaoAReceberEmissaoSintet    ,
    FSQL_RelacaoAReceberVencimentoSintet ,
    FSQL_RelacaoAReceberVencimentoCliente,
    FSQL_RelacaoAReceberBaixaSintet      : TStringList;
    IEmpresa : Array of String;
    ICompetencia : Array of Integer;
    ICliente     : Array of Integer;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCompetencia;
    procedure CarregarCliente;

    procedure MontarRelacaoAReceberPorEmissaoSintetico;
    procedure MontarRelacaoAReceberPorEmissaoAnalitico;
    procedure MontarRelacaoAReceberPorVencimentoSintetico;
    procedure MontarRelacaoAReceberPorVencimentoAnalitico;
    procedure MontarRelacaoAReceberPorVencimentoCliente;
    procedure MontarRelacaoAReceberPorBaixaSintetico;
    procedure MontarRelacaoAReceberPorBaixaAnalitico;
  public
    { Public declarations }
  end;

var
  frmGeContasAReceberImpressao: TfrmGeContasAReceberImpressao;

const
  REPORT_RELACAO_ARECEBER_POR_VENCIMENTO_SINTETICO = 0;
  REPORT_RELACAO_ARECEBER_POR_VENCIMENTO_ANALITICO = 1;
  REPORT_RELACAO_ARECEBER_POR_VENCIMENTO_CLIENTE   = 2;
  REPORT_RELACAO_ARECEBER_POR_EMISSAO_SINTETICO    = 3;
  REPORT_RELACAO_ARECEBER_POR_EMISSAO_ANALITICO    = 4;
  REPORT_RELACAO_ARECEBER_POR_BAIXA_SINTETICO      = 5;
  REPORT_RELACAO_ARECEBER_POR_BAIXA_ANALITICO      = 6;

implementation

uses
  UConstantesDGE, UDMBusiness, DateUtils, UDMNFe;

{$R *.dfm}

const
  TITULO_TODOS     = 0;
  TITULO_BAIXADO   = 1;
  TITULO_PENDENTE  = 2;
  TITULO_CANCELADO = 3;

{ TfrmGeContasAReceberImpressao }

procedure TfrmGeContasAReceberImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := TITULO_PENDENTE;

  inherited;

  FSQL_RelacaoAReceberAnalit := TStringList.Create;
  FSQL_RelacaoAReceberAnalit.AddStrings( QryRelacaoAReceberVAnalitico.SQL );

  FSQL_RelacaoAReceberVencimentoSintet := TStringList.Create;
  FSQL_RelacaoAReceberVencimentoSintet.AddStrings( QryRelacaoAReceberVSintetico.SQL );

  FSQL_RelacaoAReceberVencimentoCliente := TStringList.Create;
  FSQL_RelacaoAReceberVencimentoCliente.AddStrings( QryRelacaoAReceberVCliente.SQL );

  FSQL_RelacaoAReceberEmissaoSintet := TStringList.Create;
  FSQL_RelacaoAReceberEmissaoSintet.AddStrings( QryRelacaoAReceberESintetico.SQL );

  FSQL_RelacaoAReceberBaixaSintet := TStringList.Create;
  FSQL_RelacaoAReceberBaixaSintet.AddStrings( QryRelacaoAReceberBSintetico.SQL );
end;

procedure TfrmGeContasAReceberImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '       + #13 +
    Format('- Período  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situação : %s', [edSituacao.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Por Data de Vencimento

    REPORT_RELACAO_ARECEBER_POR_VENCIMENTO_SINTETICO:
      begin
        MontarRelacaoAReceberPorVencimentoSintetico;
        frReport := frRelacaoAReceberVSintetico;
      end;

    REPORT_RELACAO_ARECEBER_POR_VENCIMENTO_ANALITICO:
      begin
        MontarRelacaoAReceberPorVencimentoAnalitico;
        frReport := frRelacaoAReceberVAnalitico;
      end;

    REPORT_RELACAO_ARECEBER_POR_VENCIMENTO_CLIENTE:
      begin
        MontarRelacaoAReceberPorVencimentoCliente;
        frReport := frRelacaoAReceberVCliente;
      end;

    // Por Data de Emissão

    REPORT_RELACAO_ARECEBER_POR_EMISSAO_SINTETICO:
      begin
        MontarRelacaoAReceberPorEmissaoSintetico;
        frReport := frRelacaoAReceberESintetico;
      end;

    REPORT_RELACAO_ARECEBER_POR_EMISSAO_ANALITICO:
      begin
        MontarRelacaoAReceberPorEmissaoAnalitico;
        frReport := frRelacaoAReceberEAnalitico;
      end;

    // Por Data de Baixa (Recebimento)

    REPORT_RELACAO_ARECEBER_POR_BAIXA_SINTETICO:
      begin
        MontarRelacaoAReceberPorBaixaSintetico;
        frReport := frRelacaoAReceberBSintetico;
      end;

    REPORT_RELACAO_ARECEBER_POR_BAIXA_ANALITICO:
      begin
        MontarRelacaoAReceberPorBaixaAnalitico;
        frReport := frRelacaoAReceberBAnalitico;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorVencimentoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Títulos com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoAReceberVAnalitico.Close;

    with QryRelacaoAReceberVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberAnalit );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    cl.nome');
      SQL.Add('  , extract(year from cr.dtvenc) || right(''00'' || extract(month from cr.dtvenc), 2)');
      SQL.Add('  , cr.cliente');
      SQL.Add('  , cr.dtvenc');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a receber por vencimento/cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorVencimentoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edCliente.ItemIndex = 0) then
      PeriodoRelatorio := Format('Títulos com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Títulos com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edCliente.Text]) + #13;

    CdsRelacaoAReceberVSintetico.Close;

    with QryRelacaoAReceberVSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberVencimentoSintet );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cr.dtvenc)  || right(''00'' || extract(month from cr.dtvenc),  2)');
      SQL.Add('  , cr.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cr.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cr.dtvenc)  || right(''00'' || extract(month from cr.dtvenc),  2)');
      SQL.Add('  , cr.dtvenc');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a receber por vencimento.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.CarregarCompetencia;
var
  H ,
  X ,
  I : Integer;
begin
  H := StrToInt(FormatDateTime('yyyymm', GetDateDB));
  X := 0;

  with CdsCompetencia do
  begin
    Open;

    edCompetencia.Clear;
    SetLength(ICompetencia, RecordCount + 1);

    I := 0;

    while not Eof do
    begin
      edCompetencia.Items.Add( FieldByName('cmp_desc').AsString );
      ICompetencia[I] := FieldByName('cmp_num').AsInteger;

      if ( FieldByName('cmp_num').AsInteger = H ) then
        X := I;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edCompetencia.ItemIndex := X;
  edCompetenciaChange(edCompetencia);
end;

procedure TfrmGeContasAReceberImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarCompetencia;
  CarregarCliente;
end;

procedure TfrmGeContasAReceberImpressao.edCompetenciaChange(
  Sender: TObject);
var
  sDataInicial : String;
begin
  sDataInicial := IntToStr(ICompetencia[edCompetencia.ItemIndex]);
  sDataInicial := '01/' + Copy(sDataInicial, 5, 2) + '/' + Copy(sDataInicial, 1, 4);

  e1Data.Date := StrToDate(sDataInicial);
  e2Data.Date := StrToDate(FormatFloat('00"/"', DaysInMonth(e1Data.Date)) + FormatDateTime('mm/yyyy', e1Data.Date));
end;

procedure TfrmGeContasAReceberImpressao.CarregarCliente;
var
  I : Integer;
const
  NOME_CLINTE = '%s - %s';
begin
  with CdsCliente do
  begin
    Open;

    edCliente.Clear;
    SetLength(ICliente, RecordCount + 1);

    edCliente.Items.Add('(Todos)');
    ICliente[0] := 0;

    I := 1;

    while not Eof do
    begin
      edCliente.Items.Add( Format(NOME_CLINTE, [
        IfThen(FieldByName('pessoa_fisica').AsInteger = 1,
          StrFormatarCpf(FieldByName('cnpj').AsString),
          StrFormatarCnpj(FieldByName('cnpj').AsString)),
        FieldByName('nome').AsString]) );
      ICliente[I] := FieldByName('codigo').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edCliente.ItemIndex := 0;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorEmissaoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Títulos emitidos no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoAReceberVAnalitico.Close;

    with QryRelacaoAReceberVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberAnalit );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    cl.nome');
      SQL.Add('  , extract(year from cr.dtemiss) || right(''00'' || extract(month from cr.dtemiss), 2)');
      SQL.Add('  , cr.cliente');
      SQL.Add('  , cr.dtemiss');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a receber por emissão/cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorEmissaoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edCliente.ItemIndex = 0) then
      PeriodoRelatorio := Format('Títulos emitidos no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Títulos emitidos no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edCliente.Text]) + #13;

    CdsRelacaoAReceberESintetico.Close;

    with QryRelacaoAReceberESintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberEmissaoSintet );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cr.dtemiss)  || right(''00'' || extract(month from cr.dtemiss),  2)');
      SQL.Add('  , cr.dtemiss');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cr.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cr.dtemiss)  || right(''00'' || extract(month from cr.dtemiss),  2)');
      SQL.Add('  , cr.dtemiss');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a receber por emissão.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorBaixaAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Títulos baixados no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoAReceberVAnalitico.Close;

    with QryRelacaoAReceberVAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberAnalit );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtrec >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtrec <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    cl.nome');
      SQL.Add('  , extract(year from cr.dtrec) || right(''00'' || extract(month from cr.dtrec), 2)');
      SQL.Add('  , cr.cliente');
      SQL.Add('  , cr.dtrec');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de contas a receber por baixa/cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorBaixaSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edCliente.ItemIndex = 0) then
      PeriodoRelatorio := Format('Títulos baixados no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Títulos baixados no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edCliente.Text]) + #13;

    CdsRelacaoAReceberBSintetico.Close;

    with QryRelacaoAReceberBSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberBaixaSintet );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtrec >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtrec <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cr.dtrec)  || right(''00'' || extract(month from cr.dtrec),  2)');
      SQL.Add('  , cr.dtrec');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cr.situacao');
      SQL.Add('  , fp.descri');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cr.dtrec)  || right(''00'' || extract(month from cr.dtrec),  2)');
      SQL.Add('  , cr.dtrec');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a receber por baixa (recebimento).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  if ( (edRelatorio.ItemIndex = REPORT_RELACAO_ARECEBER_POR_BAIXA_SINTETICO) or (edRelatorio.ItemIndex = REPORT_RELACAO_ARECEBER_POR_BAIXA_ANALITICO) ) then
  begin
    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := TITULO_TODOS;
  end
  else
  begin
    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := TITULO_PENDENTE;
  end;
end;

procedure TfrmGeContasAReceberImpressao.MontarRelacaoAReceberPorVencimentoCliente;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if (edCliente.ItemIndex = 0) then
      PeriodoRelatorio := Format('Títulos com vencimento no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Títulos com vencimento no período de %s a %s (%s).', [e1Data.Text, e2Data.Text, edCliente.Text]) + #13;

    CdsRelacaoAReceberVCliente.Close;

    with QryRelacaoAReceberVCliente do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoAReceberVencimentoCliente );
      SQL.Add('where (cr.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      SQL.Add('  and (cr.parcela > 0)');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and cr.dtvenc >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and cr.dtvenc <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        TITULO_BAIXADO:
          SQL.Add('  and (cr.baixado = 1)');

        TITULO_PENDENTE:
          SQL.Add('  and (cr.baixado = 0)');

        TITULO_CANCELADO:
          SQL.Add('  and cr.situacao = 0');
      end;

      if ( edCliente.ItemIndex > 0 ) then
        SQL.Add('  and (cr.cliente = ' + IntToStr(ICliente[edCliente.ItemIndex]) + ')');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    extract(year from cr.dtvenc)  || right(''00'' || extract(month from cr.dtvenc),  2)');
      SQL.Add('  , cr.dtvenc');
      SQL.Add('  , cv.cmp_desc');
      SQL.Add('  , cr.situacao');
      SQL.Add('  , cr.cliente');
      SQL.Add('  , cl.nome');
      SQL.Add('  , cr.cnpj');
      SQL.Add('  , cl.pessoa_fisica');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    extract(year from cr.dtvenc)  || right(''00'' || extract(month from cr.dtvenc),  2)');
      SQL.Add('  , cr.dtvenc');
      SQL.Add('  , cl.nome');
      SQL.Add('  , cr.cnpj');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de contas a receber por vencimento/cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeContasAReceberImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeContasAReceberImpressao.CarregarEmpresa;
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

initialization
  FormFunction.RegisterForm('frmGeContasAReceberImpressao', TfrmGeContasAReceberImpressao);

end.
