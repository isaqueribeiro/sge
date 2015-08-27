unit UGeApropriacaoEstoqueImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  cxButtons, ComCtrls, Mask, DBClient, Provider, DB,
  IBCustomDataSet, IBQuery, IBTable, frxClass, frxDBSet, JvExMask,
  JvToolEdit, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeApropriacaoEstoqueImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblData: TLabel;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    lblCentroCusto: TLabel;
    edCentroCusto: TComboBox;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    lblTipoApropriacao: TLabel;
    edTipoApropriacao: TComboBox;
    tblTipoApropriacao: TIBTable;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    QryGrupo: TIBQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    QryFabricante: TIBQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    qryCentroCusto: TIBQuery;
    dspCentroCusto: TDataSetProvider;
    cdsCentroCusto: TClientDataSet;
    FrRelacaoEstoqueAprop: TfrxReport;
    QryRelacaoEstoqueAprop: TIBQuery;
    DspRelacaoEstoqueAprop: TDataSetProvider;
    CdsRelacaoEstoqueAprop: TClientDataSet;
    FrdsRelacaoEstoqueAprop: TfrxDBDataset;
    FrRelacaoEstoqueResumo: TfrxReport;
    QryRelacaoEstoqueResumo: TIBQuery;
    DspRelacaoEstoqueResumo: TDataSetProvider;
    CdsRelacaoEstoqueResumo: TClientDataSet;
    FrdsRelacaoEstoqueResumo: TfrxDBDataset;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    frRelacaoApropriacaoSintetico: TfrxReport;
    qryRelacaoApropriacaoSintetico: TIBQuery;
    dspRelacaoApropriacaoSintetico: TDataSetProvider;
    cdsRelacaoApropriacaoSintetico: TClientDataSet;
    frdsRelacaoApropriacaoSintetico: TfrxDBDataset;
    frRelacaoApropriacaoAnalitico: TfrxReport;
    QryRelacaoApropriacaoAnalitico: TIBQuery;
    DspRelacaoApropriacaoAnalitico: TDataSetProvider;
    CdsRelacaoApropriacaoAnalitico: TClientDataSet;
    FrdsRelacaoApropriacaoAnalitico: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoEstoqueApropS,
    FSQL_RelacaoEstoqueApropA,
    FSQL_ApropriacaoGeralS   ,
    FSQL_ApropriacaoGeralA   : TStringList;
    IEmpresa     : Array of String;
    ICentroCusto ,
    IGrupo       ,
    IFabricante  : Array of Integer;
  public
    { Public declarations }
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCentroCusto;
    procedure CarregarGrupo;
    procedure CarregarFabricante;
    procedure CarregarTipoApropriacao;
    procedure MontarRelacaoEstoqueApropSintetico;
    procedure MontarRelacaoEstoqueApropAnalitico;
    procedure MontarApropriacaoSintetico;
    procedure MontarApropriacaoAnalitico;
  end;

var
  frmGeApropriacaoEstoqueImpressao: TfrmGeApropriacaoEstoqueImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe;

{$R *.dfm}

const
  REPORT_ESTOQUE_APROPRIACAO_SINTETICO = 0;
  REPORT_ESTOQUE_APROPRIACAO_ANALITICO = 1;
  REPORT_RELACAO_APROPRIACAO_SINTETICO = 2;
  REPORT_RELACAO_APROPRIACAO_ANALITICO = 3;

  IDX_SITUACAO_APRORIACAO_PADRAO = 0; // Todas

{ TfrmGeApropriacaoEstoqueImpressao }

procedure TfrmGeApropriacaoEstoqueImpressao.CarregarCentroCusto;
var
  I : Integer;
begin
  with cdsCentroCusto, Params do
  begin
    Close;

    if edEmpresa.ItemIndex = 0 then
    begin
      ParamByName('empresa').AsString := EmptyStr;
      ParamByName('todas').AsInteger  := 1;
    end
    else
    begin
      ParamByName('empresa').AsString := IEmpresa[edEmpresa.ItemIndex];
      ParamByName('todas').AsInteger  := 0;
    end;
    
    Open;

    edCentroCusto.Clear;
    SetLength(ICentroCusto, RecordCount + 1);

    edCentroCusto.Items.Add('(Todos)');
    ICentroCusto[0] := 0;

    I := 1;

    while not Eof do
    begin
      edCentroCusto.Items.Add( FieldByName('descricao').AsString );
      ICentroCusto[I] := FieldByName('codigo').AsInteger;

      Inc(I);
      Next;
    end;

    Close;

    edCentroCusto.ItemIndex := 0;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.CarregarEmpresa;
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

procedure TfrmGeApropriacaoEstoqueImpressao.CarregarFabricante;
var
  I : Integer;
begin
  with CdsFabricante do
  begin
    Open;

    edFabricante.Clear;
    SetLength(IFabricante, RecordCount + 1);

    edFabricante.Items.Add('(Todos)');
    IFabricante[0] := 0;

    I := 1;

    while not Eof do
    begin
      edFabricante.Items.Add( FieldByName('nome').AsString );
      IFabricante[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edFabricante.ItemIndex := 0;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.CarregarGrupo;
var
  I : Integer;
begin
  with CdsGrupo do
  begin
    Open;

    edGrupo.Clear;
    SetLength(IGrupo, RecordCount + 1);

    edGrupo.Items.Add('(Todos)');
    IGrupo[0] := 0;

    I := 1;

    while not Eof do
    begin
      edGrupo.Items.Add( FieldByName('descri').AsString );     
      IGrupo[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edGrupo.ItemIndex := 0;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.CarregarTipoApropriacao;
begin
  with edTipoApropriacao, tblTipoApropriacao do
  begin
    Items.Clear;
    Items.Add('(Todas)');

    Open;
    while not Eof do
    begin
      Items.Add(FieldByName('codigo').AsString + ' - ' + FieldByName('descricao').AsString);
      Next;
    end;
    Close;

    ItemIndex := 0;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := IDX_SITUACAO_APRORIACAO_PADRAO; 

  inherited;

  RotinaID := ROTINA_REL_ESTOQUE_APRO_ID;

  CarregarEmpresa;
  CarregarCentroCusto;
  CarregarGrupo;
  CarregarFabricante;
  CarregarTipoApropriacao;

  FSQL_RelacaoEstoqueApropS := TStringList.Create;
  FSQL_RelacaoEstoqueApropS.AddStrings( QryRelacaoEstoqueResumo.SQL );

  FSQL_RelacaoEstoqueApropA := TStringList.Create;
  FSQL_RelacaoEstoqueApropA.AddStrings( QryRelacaoEstoqueAprop.SQL );

  FSQL_ApropriacaoGeralS := TStringList.Create;
  FSQL_ApropriacaoGeralS.AddStrings( qryRelacaoApropriacaoSintetico.SQL );

  FSQL_ApropriacaoGeralA := TStringList.Create;
  FSQL_ApropriacaoGeralA.AddStrings( QryRelacaoApropriacaoAnalitico.SQL );
end;

procedure TfrmGeApropriacaoEstoqueImpressao.edEmpresaChange(
  Sender: TObject);
begin
  if edEmpresa.Focused then
    CarregarCentroCusto;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.edRelatorioChange(
  Sender: TObject);
begin
  inherited;
  lblGrupo.Enabled      := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_APROPRIACAO_SINTETICO, REPORT_ESTOQUE_APROPRIACAO_ANALITICO]);
  edGrupo.Enabled       := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_APROPRIACAO_SINTETICO, REPORT_ESTOQUE_APROPRIACAO_ANALITICO]);
  lblFabricante.Enabled := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_APROPRIACAO_SINTETICO, REPORT_ESTOQUE_APROPRIACAO_ANALITICO]);
  edFabricante.Enabled  := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_APROPRIACAO_SINTETICO, REPORT_ESTOQUE_APROPRIACAO_ANALITICO]);

  if not edGrupo.Enabled then
    edGrupo.ItemIndex := 0;

  if not edFabricante.Enabled then
    edFabricante.ItemIndex := 0;

  lblData.Enabled     := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
  e1Data.Enabled      := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
  e2Data.Enabled      := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
  lblSituacao.Enabled := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
  edSituacao.Enabled  := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
  lblTipoApropriacao.Enabled := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
  edTipoApropriacao.Enabled  := (edRelatorio.ItemIndex in [REPORT_RELACAO_APROPRIACAO_SINTETICO, REPORT_RELACAO_APROPRIACAO_ANALITICO]);
end;

procedure TfrmGeApropriacaoEstoqueImpressao.MontarRelacaoEstoqueApropAnalitico;
begin
  try
    CdsRelacaoEstoqueAprop.Close;

    with QryRelacaoEstoqueAprop do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueApropA );
      SQL.Add('where p.aliquota_tipo = 0');
      SQL.Add('  and coalesce(xx.empresa, p.codemp) = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ( edCentroCusto.ItemIndex > 0 ) then
        SQL.Add('  and xx.centro_custo = ' + IntToStr(ICentroCusto[edCentroCusto.ItemIndex]));

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , c.descricao');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de produtos com estoque apropriado.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.MontarRelacaoEstoqueApropSintetico;
begin
  try
    CdsRelacaoEstoqueResumo.Close;

    with QryRelacaoEstoqueResumo do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueApropS );
      SQL.Add('where p.aliquota_tipo = 0');
      SQL.Add('  and coalesce(xx.empresa, p.codemp) = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ( edCentroCusto.ItemIndex > 0 ) then
        SQL.Add('  and xx.centro_custo = ' + IntToStr(ICentroCusto[edCentroCusto.ItemIndex]));

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      SQL.Add('group by');
      SQL.Add('    coalesce(xx.empresa, p.codemp)');
      SQL.Add('  , e.rzsoc');
      SQL.Add('  , xx.centro_custo');
      SQL.Add('  , c.descricao');
      SQL.Add('  , coalesce(p.codgrupo, 0)');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , coalesce(p.codfabricante, 0)');
      SQL.Add('  , coalesce(f.nome,   ''* Indefinido'')');

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , c.descricao');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , coalesce(f.nome,   ''* Indefinido'')');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de estoque apropriado resumo.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '   + #13 +
    Format('- Centro de Custo : %s', [edCentroCusto.Text]) + #13 +
    Format('- Grupo           : %s', [edGrupo.Text])       + #13 +
    Format('- Fabricante      : %s', [edFabricante.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_ESTOQUE_APROPRIACAO_SINTETICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoEstoqueApropSintetico;
        frReport := FrRelacaoEstoqueResumo;
      end;

    REPORT_ESTOQUE_APROPRIACAO_ANALITICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoEstoqueApropAnalitico;
        frReport := FrRelacaoEstoqueAprop;
      end;

    REPORT_RELACAO_APROPRIACAO_SINTETICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarApropriacaoSintetico;
        frReport := frRelacaoApropriacaoSintetico;
      end;

    REPORT_RELACAO_APROPRIACAO_ANALITICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarApropriacaoAnalitico;
        frReport := frRelacaoApropriacaoAnalitico;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.MontarApropriacaoSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoApropriacao.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s, para o tipo %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoApropriacao.Text, Pos('-', edTipoApropriacao.Text) + 1, Length(edTipoApropriacao.Text)))]);

    cdsRelacaoApropriacaoSintetico.Close;

    with qryRelacaoApropriacaoSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_ApropriacaoGeralS );
      SQL.Add('where a.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));
      SQL.Add('  and a.status  > ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_EDC));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and a.data_apropriacao >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and a.data_apropriacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ABR));

        2:
          SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ENC));

        3:
          SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_CAN));
      end;

      if ( edTipoApropriacao.ItemIndex > 0 ) then
        SQL.Add('  and a.tipo = ' + Trim(Copy(edTipoApropriacao.Text, 1, Pos('-', edTipoApropriacao.Text) - 1)));

      SQL.Add('group by');
      SQL.Add('    a.empresa');
      SQL.Add('  , e.rzsoc');
      SQL.Add('  , a.tipo');
      SQL.Add('  , ta.descricao');
      SQL.Add('  , a.centro_custo');
      SQL.Add('  , c.descricao');
      SQL.Add('  , a.status');
      SQL.Add('  , c.codcliente');
      SQL.Add('  , cc.nome');
      SQL.Add('  , cc.nomefant');
      SQL.Add('  , cc.cnpj');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , a.tipo');
      SQL.Add('  , c.descricao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de apropriação (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.MontarApropriacaoAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoApropriacao.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s, para o tipo %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoApropriacao.Text, Pos('-', edTipoApropriacao.Text) + 1, Length(edTipoApropriacao.Text)))]);

    CdsRelacaoApropriacaoAnalitico.Close;

    with QryRelacaoApropriacaoAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_ApropriacaoGeralA );
      SQL.Add('where a.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));
      SQL.Add('  and a.status  > ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_EDC));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and a.data_apropriacao >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and a.data_apropriacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ABR));

        2:
          SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ENC));

        3:
          SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_CAN));
      end;

      if ( edTipoApropriacao.ItemIndex > 0 ) then
        SQL.Add('  and a.tipo = ' + Trim(Copy(edTipoApropriacao.Text, 1, Pos('-', edTipoApropriacao.Text) - 1)));

      SQL.Add('order by');
      SQL.Add('    a.empresa');
      SQL.Add('  , a.tipo');
      SQL.Add('  , f.nomeforn');
      SQL.Add('  , f.nomefant');
      SQL.Add('  , a.data_apropriacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de apropriação (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeApropriacaoEstoqueImpressao', TfrmGeApropriacaoEstoqueImpressao);

end.
