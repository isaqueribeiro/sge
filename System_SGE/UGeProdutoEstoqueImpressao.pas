unit UGeProdutoEstoqueImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  cxButtons, ComCtrls, DBClient, Provider, DB, IBCustomDataSet,
  IBQuery, frxClass, frxDBSet, dxSkinsCore, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeProdutoEstoqueImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
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
    QryEmpresas: TIBQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    FrRelacaoEstoqueProduto: TfrxReport;
    QryRelacaoEstoqueProduto: TIBQuery;
    DspRelacaoEstoqueProduto: TDataSetProvider;
    CdsRelacaoEstoqueProduto: TClientDataSet;
    FrdsRelacaoEstoqueProduto: TfrxDBDataset;
    QryDemandaEstoqueProduto: TIBQuery;
    DspDemandaEstoqueProduto: TDataSetProvider;
    CdsDemandaEstoqueProduto: TClientDataSet;
    FrdsDemandaEstoqueProduto: TfrxDBDataset;
    lblAno: TLabel;
    edAno: TComboBox;
    QryAno: TIBQuery;
    DspAno: TDataSetProvider;
    CdsAno: TClientDataSet;
    FrDemandaEstoqueProduto: TfrxReport;
    ckSemEstoqueVenda: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoEstoqueProduto ,
    FSQL_DemandaEstoqueProduto : TStringList;
    IGrupo ,
    IFabricante : Array of Integer;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarGrupo;
    procedure CarregarFabricante;
    procedure CarregarAno;
    procedure MontarRelacaoEstoqueProduto;
    procedure MontarDemandaEstoqueProduto;
  public
    { Public declarations }
  end;

var
  frmGeProdutoEstoqueImpressao: TfrmGeProdutoEstoqueImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe, UGrPadrao;

const
  REPORT_RELACAO_ESTOQUE_PRODUTO = 0;
  REPORT_DEMANDA_ESTOQUE_PRODUTO = 1;

{$R *.dfm}

procedure TfrmGeProdutoEstoqueImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IfThen(edEmpresa.ItemIndex = 0, gUsuarioLogado.Empresa, IEmpresa[edEmpresa.ItemIndex]));
      DMBusiness.ConfigurarEmail(IfThen(edEmpresa.ItemIndex = 0, gUsuarioLogado.Empresa, IEmpresa[edEmpresa.ItemIndex]), EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarEmpresa;
var
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount + 1);

    edEmpresa.Items.Add('(Todas)');
    IEmpresa[0] := EmptyStr;

    I := 1;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := 0;
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarFabricante;
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

procedure TfrmGeProdutoEstoqueImpressao.CarregarGrupo;
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

procedure TfrmGeProdutoEstoqueImpressao.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID := ROTINA_REL_ESTOQUE_PROD_ID;

  FSQL_RelacaoEstoqueProduto := TStringList.Create;
  FSQL_RelacaoEstoqueProduto.AddStrings( QryRelacaoEstoqueProduto.SQL );

  FSQL_DemandaEstoqueProduto := TStringList.Create;
  FSQL_DemandaEstoqueProduto.AddStrings( QryDemandaEstoqueProduto.SQL );
end;

procedure TfrmGeProdutoEstoqueImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarGrupo;
  CarregarFabricante;
  CarregarAno;
end;

procedure TfrmGeProdutoEstoqueImpressao.MontarDemandaEstoqueProduto;
begin
  try
    CdsDemandaEstoqueProduto.Close;

    with QryDemandaEstoqueProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_DemandaEstoqueProduto );
      SQL.Add('where p.aliquota_tipo = 0');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      if ( edEmpresa.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(xx.empresa, yy.empresa, p.codemp) = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ckSemEstoqueVenda.Checked then
        SQL.Add('  and p.qtde <= 0');

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');

      SQL.Text := StringReplace(SQL.Text, ':ano', edAno.Text, [rfReplaceAll]);
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoEstoqueImpressao.MontarRelacaoEstoqueProduto;
begin
  try
    CdsRelacaoEstoqueProduto.Close;

    with QryRelacaoEstoqueProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueProduto );
      SQL.Add('where p.aliquota_tipo = 0');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      if ( edEmpresa.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(xx.empresa, p.codemp) = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ckSemEstoqueVenda.Checked then
        SQL.Add('  and p.qtde <= 0');

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoEstoqueImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '  + #13 +
    Format('- Grupo         : %s', [edGrupo.Text])        + #13 +
    Format('- Fabricante    : %s', [edFabricante.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_RELACAO_ESTOQUE_PRODUTO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoEstoqueProduto;
        frReport := FrRelacaoEstoqueProduto;
      end;

    REPORT_DEMANDA_ESTOQUE_PRODUTO:
      begin
        SubTituloRelario := '- ANO ' + edAno.Text;
        PeriodoRelatorio := edAno.Text;
        MontarDemandaEstoqueProduto;
        frReport := FrDemandaEstoqueProduto;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeProdutoEstoqueImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  lblAno.Enabled := (edRelatorio.ItemIndex = REPORT_DEMANDA_ESTOQUE_PRODUTO);
  edAno.Enabled  := (edRelatorio.ItemIndex = REPORT_DEMANDA_ESTOQUE_PRODUTO);
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarAno;
begin
  with CdsAno do
  begin
    Open;

    edAno.Clear;

    while not Eof do
    begin
      if (FieldByName('ano').AsInteger > 0) then
        edAno.Items.Add( FieldByName('ano').AsString );
      Next;
    end;

    Close;
  end;

  if (edGrupo.Items.Count = 0) then
    edAno.Items.Add( FormatDateTime('yyyy', GetDateDB) );

  edAno.ItemIndex := 0;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoEstoqueImpressao', TfrmGeProdutoEstoqueImpressao);

end.
