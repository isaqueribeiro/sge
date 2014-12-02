unit UGeVendaImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ToolWin, ComCtrls, DBClient, Provider, DB, IBCustomDataSet,
  IBQuery, frxClass, frxDBSet, Mask, rxToolEdit;

type
  TfrmGeVendaImpressao = class(TfrmGrPadraoImpressao)
    QryCidades: TIBQuery;
    DpsCidades: TDataSetProvider;
    CdsCidades: TClientDataSet;
    frRelacaoVendaSintetico: TfrxReport;
    QryRelacaoVendaSintetico: TIBQuery;
    DspRelacaoVendaSintetico: TDataSetProvider;
    CdsRelacaoVendaSintetico: TClientDataSet;
    FrdsRelacaoVendaSintetico: TfrxDBDataset;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    lblVendedor: TLabel;
    edVendedor: TComboBox;
    lblCidade: TLabel;
    edCidade: TComboBox;
    QryVendedores: TIBQuery;
    DspVendedores: TDataSetProvider;
    CdsVendedores: TClientDataSet;
    frRelacaoVendaAnalitico: TfrxReport;
    QryRelacaoVendaAnalitico: TIBQuery;
    DspRelacaoVendaAnalitico: TDataSetProvider;
    CdsRelacaoVendaAnalitico: TClientDataSet;
    FrdsRelacaoVendaAnalitico: TfrxDBDataset;
    frRelacaoVendaComparativo: TfrxReport;
    frRelacaoVendaClienteSintetico: TfrxReport;
    QryRelacaoVendaClienteSintetico: TIBQuery;
    DspRelacaoVendaClienteSintetico: TDataSetProvider;
    CdsRelacaoVendaClienteSintetico: TClientDataSet;
    FrdsRelacaoVendaClienteSintetico: TfrxDBDataset;
    frRelacaoVendaClienteAnalitico: TfrxReport;
    QryRelacaoVendaClienteAnalitico: TIBQuery;
    DspRelacaoVendaClienteAnalitico: TDataSetProvider;
    CdsRelacaoVendaClienteAnalitico: TClientDataSet;
    FrdsRelacaoVendaClienteAnalitico: TfrxDBDataset;
    lblCliente: TLabel;
    edCliente: TComboBox;
    frRelacaoVendaClienteComparativo: TfrxReport;
    QryVendaCompetencia: TIBQuery;
    DspVendaCompetencia: TDataSetProvider;
    CdsVendaCompetencia: TClientDataSet;
    FrdsVendaCompetencia: TfrxDBDataset;
    chkNFeEmitida: TCheckBox;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure edSituacaoChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_VendaCompetencia   ,
    FSQL_RelacaoVendaSintet ,
    FSQL_RelacaoVendaAnalit : TStringList;
    FSQL_RelacaoVendaClienteSintet ,
    FSQL_RelacaoVendaClienteAnalit : TStringList;
    ICidade   : Array of Integer;
    IVendedor : Array of Integer;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCidades;
    procedure CarregarVendedores;
    procedure MontarVendaCompetencia;
    procedure MontarRelacaoVendaVendedorSintetica;
    procedure MontarRelacaoVendaVendedorAnalitica;
    procedure MontarRelacaoVendaVendedorComparativo;
    procedure MontarRelacaoVendaClienteSintetica;
    procedure MontarRelacaoVendaClienteAnalitica;
    procedure MontarRelacaoVendaClienteComparativo;
  public
    { Public declarations }
  end;

var
  frmGeVendaImpressao: TfrmGeVendaImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe;

const
  REPORT_RELACAO_VENDA_VENDEDOR_SINTETICO = 0;
  REPORT_RELACAO_VENDA_VENDEDOR_ANALITICO = 1;
  REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI = 2;
  REPORT_RELACAO_VENDA_CLIENTE_SINTETICO  = 3;
  REPORT_RELACAO_VENDA_CLIENTE_ANALITICO  = 4;
  REPORT_RELACAO_VENDA_CLIENTE_COMPARATI  = 5;

  SITUACAO_VENDA_PADRAO = 3; // Vendas finalizadas e com NF-e emitidas

{$R *.dfm}

procedure TfrmGeVendaImpressao.CarregarCidades;
var
  I : Integer;
begin
  with CdsCidades do
  begin
    Open;

    edCidade.Clear;
    SetLength(ICidade, RecordCount + 1);

    edCidade.Items.Add('(Todas)');
    ICidade[0] := 0;

    I := 1;

    while not Eof do
    begin
      edCidade.Items.Add( FieldByName('cid_nome').AsString );
      ICidade[I] := FieldByName('cid_cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edCidade.ItemIndex := 0;
end;

procedure TfrmGeVendaImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := SITUACAO_VENDA_PADRAO; // Vendas finalizadas e com NF-e emitidas
  
  inherited;

  FSQL_VendaCompetencia := TStringList.Create;
  FSQL_VendaCompetencia.AddStrings( QryVendaCompetencia.SQL );

  FSQL_RelacaoVendaSintet := TStringList.Create;
  FSQL_RelacaoVendaSintet.AddStrings( QryRelacaoVendaSintetico.SQL );

  FSQL_RelacaoVendaAnalit := TStringList.Create;
  FSQL_RelacaoVendaAnalit.AddStrings( QryRelacaoVendaAnalitico.SQL );

  FSQL_RelacaoVendaClienteSintet := TStringList.Create;
  FSQL_RelacaoVendaClienteSintet.AddStrings( QryRelacaoVendaClienteSintetico.SQL );

  FSQL_RelacaoVendaClienteAnalit := TStringList.Create;
  FSQL_RelacaoVendaClienteAnalit.AddStrings( QryRelacaoVendaClienteAnalitico.SQL );
end;

procedure TfrmGeVendaImpressao.FormShow(Sender: TObject);
begin
  CarregarEmpresa;
  CarregarVendedores;
  CarregarCidades;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaVendedorSintetica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaSintetico.Close;

    with QryRelacaoVendaSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));
          
        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.vendedor_cod');
      SQL.Add('  , d.nome');
      SQL.Add('  , d.cpf');
      SQL.Add('  , d.comissao');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.nome');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de vendas por vendedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
    Format('- Período  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situação : %s', [edSituacao.Text]) + #13 +
    Format('- Vendedor : %s', [edVendedor.Text]) + #13 +
    Format('- Cidade   : %s', [edCidade.Text])   + #13 +
    IfThen(chkNFeEmitida.Visible and chkNFeEmitida.Checked, '- Apenas com NF-e emitida(s)', EmptyStr);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Por vendedores

    REPORT_RELACAO_VENDA_VENDEDOR_SINTETICO:
      begin
        MontarRelacaoVendaVendedorSintetica;
        frReport := frRelacaoVendaSintetico;
      end;

    REPORT_RELACAO_VENDA_VENDEDOR_ANALITICO:
      begin
        MontarRelacaoVendaVendedorAnalitica;
        frReport := frRelacaoVendaAnalitico;
      end;

    REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI:
      begin
        MontarVendaCompetencia;
        MontarRelacaoVendaVendedorComparativo;
        frReport := frRelacaoVendaComparativo;
      end;

    // Por Clientes

    REPORT_RELACAO_VENDA_CLIENTE_SINTETICO:
      begin
        MontarRelacaoVendaClienteSintetica;
        frReport := frRelacaoVendaClienteSintetico;
      end;

    REPORT_RELACAO_VENDA_CLIENTE_ANALITICO:
      begin
        MontarRelacaoVendaClienteAnalitica;
        frReport := frRelacaoVendaClienteAnalitico;
      end;

    REPORT_RELACAO_VENDA_CLIENTE_COMPARATI:
      begin
        MontarVendaCompetencia;
        MontarRelacaoVendaClienteComparativo;
        frReport := frRelacaoVendaClienteComparativo;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeVendaImpressao.CarregarVendedores;
var
  I : Integer;
begin
  with CdsVendedores do
  begin
    Open;

    edVendedor.Clear;
    SetLength(IVendedor, RecordCount + 1);

    edVendedor.Items.Add('(Todos)');
    IVendedor[0] := 0;

    I := 1;

    while not Eof do
    begin
      edVendedor.Items.Add( FieldByName('nome').AsString );
      IVendedor[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edVendedor.ItemIndex := 0;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaVendedorAnalitica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaAnalitico.Close;

    with QryRelacaoVendaAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaAnalit );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        SITUACAO_VENDA_PADRAO:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));
          
        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.nome');
      SQL.Add('  , v.vendedor_cod');
      SQL.Add('  , v.competencia');
      SQL.Add('  , v.dtvenda');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de vendas por vendedor/competência.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  if ( (edRelatorio.ItemIndex = REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI) or (edRelatorio.ItemIndex = REPORT_RELACAO_VENDA_CLIENTE_COMPARATI) ) then
  begin
    e1Data.Date := StrToDate('01/01/' + FormatDateTime('yyyy', GetDateDB));
    e2Data.Date := StrToDate('31/12/' + FormatDateTime('yyyy', GetDateDB));

    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := SITUACAO_VENDA_PADRAO;
  end
  else
  begin
    e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
    e2Data.Date := GetDateDB;

    edSituacao.Enabled := True;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaVendedorComparativo;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaSintetico.Close;

    with QryRelacaoVendaSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));
      SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));
          
        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.vendedor_cod');
      SQL.Add('  , d.nome');
      SQL.Add('  , d.cpf');
      SQL.Add('  , d.comissao');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.nome');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório comparativo sintético de vendas por vendedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaClienteAnalitica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaClienteAnalitico.Close;

    with QryRelacaoVendaClienteAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaClienteAnalit );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        SITUACAO_VENDA_PADRAO:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));
          
        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , v.competencia');
      SQL.Add('  , v.dtvenda');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de vendas por cliente/competência.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaClienteComparativo;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaClienteSintetico.Close;

    with QryRelacaoVendaClienteSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaClienteSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.codcli');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório comparativo sintético de vendas por cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaClienteSintetica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaClienteSintetico.Close;

    with QryRelacaoVendaClienteSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaClienteSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.codcli');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de vendas por cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarVendaCompetencia;
begin
  try
(*
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);
*)
    CdsVendaCompetencia.Close;

    with QryVendaCompetencia do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_VendaCompetencia );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a tabela resumo das vendas por competência.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
//      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.edSituacaoChange(Sender: TObject);
begin
  inherited;
  chkNFeEmitida.Visible := (edSituacao.ItemIndex = 4); // Vendas canceladas
end;

procedure TfrmGeVendaImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeVendaImpressao.CarregarEmpresa;
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
  FormFunction.RegisterForm('frmGeVendaImpressao', TfrmGeVendaImpressao);

end.
