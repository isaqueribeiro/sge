unit UGeEntradaImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ToolWin, ComCtrls, Mask, rxToolEdit, DB, IBCustomDataSet,
  IBTable, frxClass, frxDBSet, DBClient, Provider, IBQuery;

type
  TfrmGeEntradaImpressao = class(TfrmGrPadraoImpressao)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    lblTipoEntrada: TLabel;
    edTipoEntrada: TComboBox;
    tblTipoEntrada: TIBTable;
    lblTipoDocumento: TLabel;
    edTipoDocumento: TComboBox;
    tblTipoDocumento: TIBTable;
    frRelacaoEntradaGeralSintetico: TfrxReport;
    qryRelacaoEntradaGeralSintetico: TIBQuery;
    dspRelacaoEntradaGeralSintetico: TDataSetProvider;
    cdsRelacaoEntradaGeralSintetico: TClientDataSet;
    frdsRelacaoEntradaGeralSintetico: TfrxDBDataset;
    chkNFInformada: TCheckBox;
    frRelacaoEntradaGeralAnalitico: TfrxReport;
    qryRelacaoEntradaGeralAnalitico: TIBQuery;
    dspRelacaoEntradaGeralAnalitico: TDataSetProvider;
    cdsRelacaoEntradaGeralAnalitico: TClientDataSet;
    frdsRelacaoEntradaGeralAnalitico: TfrxDBDataset;
    frRelacaoEntradaNotaFiscal: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkNFInformadaClick(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_EntradaGeralS ,
    FSQL_EntradaGeralA : TStringList;
  public
    { Public declarations }
    procedure CarregarTipoEntrada;
    procedure CarregarTipoDocumento;
    procedure MontarEntradaGeralSintetico;
    procedure MontarEntradaGeralAnalitico;
    procedure MontarEntradaRelacaoNotas;
  end;

var
  frmGeEntradaImpressao: TfrmGeEntradaImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness;

{$R *.dfm}

const
  REPORT_RELACAO_ENTRADA_SINTETICO   = 0;
  REPORT_RELACAO_ENTRADA_ANALITICO   = 1;
  REPORT_RELACAO_ENTRADA_NOTA_FISCAL = 2;

  SITUACAO_ENTRADA_PADRAO = 3; // Entradas Finalizadas e com NF Emitidas

procedure TfrmGeEntradaImpressao.CarregarTipoDocumento;
begin
  with edTipoDocumento, tblTipoDocumento do
  begin
    Items.Clear;
    Items.Add('(Todos)');

    Open;
    while not Eof do
    begin
      Items.Add(FieldByName('tpd_codigo').AsString + ' - ' + FieldByName('tpd_descricao').AsString);
      Next;
    end;
    Close;

    ItemIndex := 0;
  end;
end;

procedure TfrmGeEntradaImpressao.CarregarTipoEntrada;
begin
  with edTipoEntrada, tblTipoEntrada do
  begin
    Items.Clear;
    Items.Add('(Todos)');

    Open;
    while not Eof do
    begin
      Items.Add(FieldByName('tpe_codigo').AsString + ' - ' + FieldByName('tpe_descricao').AsString);
      Next;
    end;
    Close;

    ItemIndex := 0;
  end;
end;

procedure TfrmGeEntradaImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := SITUACAO_ENTRADA_PADRAO; // Entradas finalizadas e com NF-e emitidas

  inherited;
  CarregarTipoEntrada;
  CarregarTipoDocumento;

  FSQL_EntradaGeralS := TStringList.Create;
  FSQL_EntradaGeralS.AddStrings( qryRelacaoEntradaGeralSintetico.SQL );

  FSQL_EntradaGeralA := TStringList.Create;
  FSQL_EntradaGeralA.AddStrings( qryRelacaoEntradaGeralAnalitico.SQL );
end;

procedure TfrmGeEntradaImpressao.MontarEntradaGeralSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoEntrada.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Entradas emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Entradas emitidas no período de %s a %s, para %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoEntrada.Text, Pos('-', edTipoEntrada.Text) + 1, Length(edTipoEntrada.Text)))]);

    cdsRelacaoEntradaGeralSintetico.Close;

    with qryRelacaoEntradaGeralSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_EntradaGeralS );
      SQL.Add('where c.codemp = ' + QuotedStr(GetEmpresaIDDefault));
      SQL.Add('  and c.status > 1');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and c.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and c.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_FIN));

        2:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_NFE));

        3:
          SQL.Add('  and c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')');

        4:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_CAN));

        else
          SQL.Add('  and c.status > ' + IntToStr(STATUS_CMP_ABR)); // Todas as entradas, com excesão das entradas "abertas"
      end;

      if ( edTipoEntrada.ItemIndex > 0 ) then
        SQL.Add('  and c.tipo_entrada = ' + Trim(Copy(edTipoEntrada.Text, 1, Pos('-', edTipoEntrada.Text) - 1)));

      if ( edTipoDocumento.Enabled ) then
        if ( edTipoDocumento.ItemIndex > 0 ) then
          SQL.Add('  and c.tipo_documento = ' + Trim(Copy(edTipoDocumento.Text, 1, Pos('-', edTipoDocumento.Text) - 1)));

      if ( chkNFInformada.Visible ) then
        if ( chkNFInformada.Checked ) then
          SQL.Add('  and c.tipo_documento in (1, 2)');

      SQL.Add('group by');
      SQL.Add('    c.tipo_movimento');
      SQL.Add('  , c.tipo_entrada');
      SQL.Add('  , te.tpe_descricao');
      SQL.Add('  , c.tipo_documento');
      SQL.Add('  , tn.tpd_descricao');
      SQL.Add('  , c.tipo_despesa');
      SQL.Add('  , td.tipodesp');
      SQL.Add('  , c.status');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    c.tipo_movimento');
      SQL.Add('  , td.tipodesp');
      SQL.Add('  , te.tpe_descricao');
      SQL.Add('  , tn.tpd_descricao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de compras (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeEntradaImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '             + #13 +
    Format('- Período        : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situação       : %s', [edSituacao.Text])      + #13 +
    Format('- Tipo Entrada   : %s', [edTipoEntrada.Text])   + #13 +
    Format('- Tipo Documento : %s', [edTipoDocumento.Text]) + #13 +
    IfThen(chkNFInformada.Visible and chkNFInformada.Checked, '- Apenas com NF emitida(s)', EmptyStr);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Geral por Data de Emissão

    REPORT_RELACAO_ENTRADA_SINTETICO:
      begin
        MontarEntradaGeralSintetico;
        frReport := frRelacaoEntradaGeralSintetico;

      end;
      
    REPORT_RELACAO_ENTRADA_ANALITICO:
      begin
        MontarEntradaGeralAnalitico;
        frReport := frRelacaoEntradaGeralAnalitico;
      end;

    REPORT_RELACAO_ENTRADA_NOTA_FISCAL:
      begin
        MontarEntradaRelacaoNotas;
        frReport := frRelacaoEntradaNotaFiscal;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeEntradaImpressao.chkNFInformadaClick(Sender: TObject);
begin
  lblTipoDocumento.Enabled := not chkNFInformada.Checked;
  edTipoDocumento.Enabled  := not chkNFInformada.Checked;
  if not edTipoDocumento.Enabled then
    edTipoDocumento.ItemIndex := 0;
end;

procedure TfrmGeEntradaImpressao.MontarEntradaGeralAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoEntrada.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Entradas emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Entradas emitidas no período de %s a %s, para %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoEntrada.Text, Pos('-', edTipoEntrada.Text) + 1, Length(edTipoEntrada.Text)))]);

    cdsRelacaoEntradaGeralAnalitico.Close;

    with qryRelacaoEntradaGeralAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_EntradaGeralA );
      SQL.Add('where c.codemp = ' + QuotedStr(GetEmpresaIDDefault));
      SQL.Add('  and c.status > 1');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and c.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and c.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_FIN));

        2:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_NFE));

        3:
          SQL.Add('  and c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')');

        4:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_CAN));

        else
          SQL.Add('  and c.status > ' + IntToStr(STATUS_CMP_ABR)); // Todas as entradas, com excesão das entradas "abertas"
      end;

      if ( edTipoEntrada.ItemIndex > 0 ) then
        SQL.Add('  and c.tipo_entrada = ' + Trim(Copy(edTipoEntrada.Text, 1, Pos('-', edTipoEntrada.Text) - 1)));

      if ( edTipoDocumento.Enabled ) then
        if ( edTipoDocumento.ItemIndex > 0 ) then
          SQL.Add('  and c.tipo_documento = ' + Trim(Copy(edTipoDocumento.Text, 1, Pos('-', edTipoDocumento.Text) - 1)));

      if ( chkNFInformada.Visible ) then
        if ( chkNFInformada.Checked ) then
          SQL.Add('  and c.tipo_documento in (1, 2)');

      SQL.Add('order by');
      SQL.Add('    c.tipo_movimento');
      SQL.Add('  , td.tipodesp');
      SQL.Add('  , te.tpe_descricao');
      SQL.Add('  , f.nomeforn');
      SQL.Add('  , f.nomefant');
      SQL.Add('  , c.codforn');
      SQL.Add('  , c.dtemiss');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de compras (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeEntradaImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  chkNFInformada.Enabled := not (edRelatorio.ItemIndex = REPORT_RELACAO_ENTRADA_NOTA_FISCAL);
  chkNFInformada.Checked := (edRelatorio.ItemIndex = REPORT_RELACAO_ENTRADA_NOTA_FISCAL);
end;

procedure TfrmGeEntradaImpressao.MontarEntradaRelacaoNotas;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoEntrada.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Notas fiscais emitidas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Notas fiscais emitidas no período de %s a %s, para %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoEntrada.Text, Pos('-', edTipoEntrada.Text) + 1, Length(edTipoEntrada.Text)))]);

    cdsRelacaoEntradaGeralAnalitico.Close;

    with qryRelacaoEntradaGeralAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_EntradaGeralA );
      SQL.Add('where c.codemp = ' + QuotedStr(GetEmpresaIDDefault));
      SQL.Add('  and c.status > 1');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and c.dtemiss >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and c.dtemiss <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_FIN));

        2:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_NFE));

        3:
          SQL.Add('  and c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')');

        4:
          SQL.Add('  and c.status = ' + IntToStr(STATUS_CMP_CAN));

        else
          SQL.Add('  and c.status > ' + IntToStr(STATUS_CMP_ABR)); // Todas as entradas, com excesão das entradas "abertas"
      end;

      if ( edTipoEntrada.ItemIndex > 0 ) then
        SQL.Add('  and c.tipo_entrada = ' + Trim(Copy(edTipoEntrada.Text, 1, Pos('-', edTipoEntrada.Text) - 1)));

      if ( edTipoDocumento.Enabled ) then
        if ( edTipoDocumento.ItemIndex > 0 ) then
          SQL.Add('  and c.tipo_documento = ' + Trim(Copy(edTipoDocumento.Text, 1, Pos('-', edTipoDocumento.Text) - 1)));

      if ( chkNFInformada.Visible ) then
        if ( chkNFInformada.Checked ) then
          SQL.Add('  and c.tipo_documento in (1, 2)');

      SQL.Add('order by');
      SQL.Add('    c.tipo_movimento');
      SQL.Add('  , c.dtemiss');
      SQL.Add('  , f.nomeforn');
      SQL.Add('  , f.nomefant');
      SQL.Add('  , c.codforn');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de compras (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeEntradaImpressao', TfrmGeEntradaImpressao);

end.
