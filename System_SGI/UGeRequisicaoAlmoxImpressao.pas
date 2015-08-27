unit UGeRequisicaoAlmoxImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoImpressao, cxGraphics,
  Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,

  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, frxClass, frxDBSet, Vcl.Mask, JvExMask, JvToolEdit,
  IBX.IBTable;

type
  TfrmGeRequisicaoAlmoxImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblCentroCusto: TLabel;
    edCentroCusto: TComboBox;
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    qryCentroCusto: TIBQuery;
    dspCentroCusto: TDataSetProvider;
    cdsCentroCusto: TClientDataSet;
    frRequsicaoAlmoxSintetico: TfrxReport;
    qryRequsicaoAlmoxSintetico: TIBQuery;
    dspRequsicaoAlmoxSintetico: TDataSetProvider;
    cdsRequsicaoAlmoxSintetico: TClientDataSet;
    frdsRequsicaoAlmoxSintetico: TfrxDBDataset;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    QryGrupo: TIBQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    lblTipoRequsicao: TLabel;
    edTipoRequsicao: TComboBox;
    tblTipoRequisicaoAlmox: TIBTable;
    frRequsicaoAlmoxAnalitico: TfrxReport;
    QryRequisicaoAlmoxAnalitico: TIBQuery;
    DspRequisicaoAlmoxAnalitico: TDataSetProvider;
    CdsRequisicaoAlmoxAnalitico: TClientDataSet;
    frdsRequisicaoAlmoxAnalitico: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    FSQL_RequisicaoEstoqueS,
    FSQL_RequisicaoEstoqueA,
    FSQL_ConsumoDeptoS     ,
    FSQL_ConsumoDeptoA     : TStringList;
    IEmpresa     : Array of String;
    ICentroCusto ,
    IGrupo       : Array of Integer;
  public
    { Public declarations }
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCentroCusto;
    procedure CarregarGrupo;
    procedure CarregarTipoRequisicaoAlmox;
    procedure MontarRequisicaoEstoqueSintetico;
    procedure MontarRequisicaoEstoqueAnalitico;
  end;

var
  frmGeRequisicaoAlmoxImpressao: TfrmGeRequisicaoAlmoxImpressao;

const
  IDX_SITUACAO_REQUISICAO_PADRAO     = 2;

  REPORT_REQUSICAO_ESTOQUE_SINTETICO = 0;
  REPORT_REQUSICAO_ESTOQUE_ANALITICO = 1;
  REPORT_CONSUMO_DEPTO_SINTETICO     = 2;
  REPORT_CONSUMO_DEPTO_ANALITICO     = 3;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe;

{$R *.dfm}

procedure TfrmGeRequisicaoAlmoxImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '   + #13 +
    Format('- Centro de Custo : %s', [edCentroCusto.Text]) + #13 +
    Format('- Grupo           : %s', [edGrupo.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_REQUSICAO_ESTOQUE_SINTETICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRequisicaoEstoqueSintetico;
        frReport := frRequsicaoAlmoxSintetico;
      end;

    REPORT_REQUSICAO_ESTOQUE_ANALITICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRequisicaoEstoqueAnalitico;
        frReport := frRequsicaoAlmoxAnalitico;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeRequisicaoAlmoxImpressao.CarregarCentroCusto;
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
      edCentroCusto.Items.Add(FieldByName('descricao').AsString);
      ICentroCusto[I] := FieldByName('codigo').AsInteger;

      Inc(I);
      Next;
    end;

    Close;

    edCentroCusto.ItemIndex := 0;
  end;
end;

procedure TfrmGeRequisicaoAlmoxImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeRequisicaoAlmoxImpressao.CarregarEmpresa;
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
      edEmpresa.Items.Add(FieldByName('rzsoc').AsString);
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

procedure TfrmGeRequisicaoAlmoxImpressao.CarregarGrupo;
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

procedure TfrmGeRequisicaoAlmoxImpressao.CarregarTipoRequisicaoAlmox;
begin
  with edTipoRequsicao, tblTipoRequisicaoAlmox do
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

procedure TfrmGeRequisicaoAlmoxImpressao.edEmpresaChange(Sender: TObject);
begin
  if edEmpresa.Focused then
    CarregarCentroCusto;
end;

procedure TfrmGeRequisicaoAlmoxImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  lblGrupo.Enabled      := (edRelatorio.ItemIndex in [REPORT_CONSUMO_DEPTO_SINTETICO, REPORT_CONSUMO_DEPTO_ANALITICO]);
  edGrupo.Enabled       := (edRelatorio.ItemIndex in [REPORT_CONSUMO_DEPTO_SINTETICO, REPORT_CONSUMO_DEPTO_ANALITICO]);
end;

procedure TfrmGeRequisicaoAlmoxImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := IDX_SITUACAO_REQUISICAO_PADRAO;

  inherited;

  RotinaID := ROTINA_REL_ESTOQUE_REQ_ID;

  CarregarEmpresa;
  CarregarCentroCusto;
  CarregarGrupo;
  CarregarTipoRequisicaoAlmox;

  FSQL_RequisicaoEstoqueS := TStringList.Create;
  FSQL_RequisicaoEstoqueS.AddStrings( qryRequsicaoAlmoxSintetico.SQL );

  FSQL_RequisicaoEstoqueA := TStringList.Create;
  FSQL_RequisicaoEstoqueA.AddStrings( QryRequisicaoAlmoxAnalitico.SQL );
end;

procedure TfrmGeRequisicaoAlmoxImpressao.MontarRequisicaoEstoqueAnalitico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoRequsicao.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Requisições realizadas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Requisições realizadas no período de %s a %s, para o tipo %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoRequsicao.Text, Pos('-', edTipoRequsicao.Text) + 1, Length(edTipoRequsicao.Text)))]);

    CdsRequisicaoAlmoxAnalitico.Close;

    with QryRequisicaoAlmoxAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RequisicaoEstoqueA );
      SQL.Add('where r.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ( edCentroCusto.ItemIndex > 0 ) then
        SQL.Add('  and r.ccusto_destino = ' + IntToStr(ICentroCusto[edCentroCusto.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and r.data_emissao >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and r.data_emissao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      if ( edSituacao.ItemIndex > 0 ) then
        Case edSituacao.ItemIndex of
          1:
            SQL.Add('  and r.status in (' +
              IntToStr(STATUS_REQUISICAO_ALMOX_EDC) + ', ' +
              IntToStr(STATUS_REQUISICAO_ALMOX_ABR) + ')');

          2:
            SQL.Add('  and r.status in (' +
              IntToStr(STATUS_REQUISICAO_ALMOX_ENV) + ', ' +
              IntToStr(STATUS_REQUISICAO_ALMOX_REC) + ', ' +
              IntToStr(STATUS_REQUISICAO_ALMOX_ATD) + ')');

          3:
            SQL.Add('  and r.status = ' + IntToStr(STATUS_REQUISICAO_ALMOX_CAN));
        end;

      if ( edTipoRequsicao.ItemIndex > 0 ) then
        SQL.Add('  and r.tipo = ' + Trim(Copy(edTipoRequsicao.Text, 1, Pos('-', edTipoRequsicao.Text) - 1)));

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , r.tipo');
      SQL.Add('  , cd.descricao     -- Atendente');
      SQL.Add('  , r.ccusto_origem');
      SQL.Add('  , co.descricao     -- Solicitante');
      SQL.Add('  , r.ccusto_destino');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar o relatório analítico de Requisições ao Estoque.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmoxImpressao.MontarRequisicaoEstoqueSintetico;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoRequsicao.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Requisições realizadas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Requisições realizadas no período de %s a %s, para o tipo %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoRequsicao.Text, Pos('-', edTipoRequsicao.Text) + 1, Length(edTipoRequsicao.Text)))]);

    cdsRequsicaoAlmoxSintetico.Close;

    with qryRequsicaoAlmoxSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RequisicaoEstoqueS );
      SQL.Add('where r.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ( edCentroCusto.ItemIndex > 0 ) then
        SQL.Add('  and r.ccusto_destino = ' + IntToStr(ICentroCusto[edCentroCusto.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and r.data_emissao >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and r.data_emissao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      if ( edSituacao.ItemIndex > 0 ) then
        Case edSituacao.ItemIndex of
          1:
            SQL.Add('  and r.status in (' +
              IntToStr(STATUS_REQUISICAO_ALMOX_EDC) + ', ' +
              IntToStr(STATUS_REQUISICAO_ALMOX_ABR) + ')');

          2:
            SQL.Add('  and r.status in (' +
              IntToStr(STATUS_REQUISICAO_ALMOX_ENV) + ', ' +
              IntToStr(STATUS_REQUISICAO_ALMOX_REC) + ', ' +
              IntToStr(STATUS_REQUISICAO_ALMOX_ATD) + ')');

          3:
            SQL.Add('  and r.status = ' + IntToStr(STATUS_REQUISICAO_ALMOX_CAN));
        end;

      if ( edTipoRequsicao.ItemIndex > 0 ) then
        SQL.Add('  and r.tipo = ' + Trim(Copy(edTipoRequsicao.Text, 1, Pos('-', edTipoRequsicao.Text) - 1)));

      SQL.Add('group by');
      SQL.Add('    r.empresa');
      SQL.Add('  , e.rzsoc');
      SQL.Add('  , r.tipo');
      SQL.Add('  , tr.descricao');
      SQL.Add('  , r.status');
      SQL.Add('  , sr.descricao');
      SQL.Add('  , r.ccusto_destino');
      SQL.Add('  , cd.descricao');
      SQL.Add('  , r.ccusto_origem');
      SQL.Add('  , co.descricao');
      SQL.Add('  , co.codcliente');
      SQL.Add('  , cc.nome');
      SQL.Add('  , cc.nomefant');
      SQL.Add('  , cc.pessoa_fisica');
      SQL.Add('  , cc.cnpj');

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , r.tipo');
      SQL.Add('  , cd.descricao     -- Atendente');
      SQL.Add('  , r.ccusto_origem');
      SQL.Add('  , co.descricao     -- Solicitante');
      SQL.Add('  , r.ccusto_destino');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar o relatório sintético de Requisições ao Estoque.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoAlmoxImpressao', TfrmGeRequisicaoAlmoxImpressao);

end.
