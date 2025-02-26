unit UGeApropriacaoEstoqueImpressao;

interface

uses
  UGrPadraoImpressao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  cxButtons, ComCtrls, DBClient, Provider, DB, frxClass, frxDBSet, Vcl.Mask, JvExMask, JvToolEdit,
  IBX.IBTable, IBX.IBCustomDataSet, IBX.IBQuery,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinsDefaultPainters;

type
  TfrmGeApropriacaoEstoqueImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblData: TLabel;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    lblCentroCusto: TLabel;
    edCentroCusto: TComboBox;
    lblTipoApropriacao: TLabel;
    edTipoApropriacao: TComboBox;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    FrRelacaoEstoqueAprop: TfrxReport;
    DspRelacaoEstoqueAprop: TDataSetProvider;
    CdsRelacaoEstoqueAprop: TClientDataSet;
    FrdsRelacaoEstoqueAprop: TfrxDBDataset;
    FrRelacaoEstoqueResumo: TfrxReport;
    DspRelacaoEstoqueResumo: TDataSetProvider;
    CdsRelacaoEstoqueResumo: TClientDataSet;
    FrdsRelacaoEstoqueResumo: TfrxDBDataset;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    frRelacaoApropriacaoSintetico: TfrxReport;
    dspRelacaoApropriacaoSintetico: TDataSetProvider;
    cdsRelacaoApropriacaoSintetico: TClientDataSet;
    frdsRelacaoApropriacaoSintetico: TfrxDBDataset;
    frRelacaoApropriacaoAnalitico: TfrxReport;
    DspRelacaoApropriacaoAnalitico: TDataSetProvider;
    CdsRelacaoApropriacaoAnalitico: TClientDataSet;
    FrdsRelacaoApropriacaoAnalitico: TfrxDBDataset;
    QryRelacaoEstoqueResumo: TFDQuery;
    fdQryEmpresas: TFDQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    fdQryCentroCusto: TFDQuery;
    DspCentroCusto: TDataSetProvider;
    CdsCentroCusto: TClientDataSet;
    fdQryGrupo: TFDQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    fdQryFabricante: TFDQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    fdQryTipoApropriacao: TFDQuery;
    DspTipoApropriacao: TDataSetProvider;
    CdsTipoApropriacao: TClientDataSet;
    QryRelacaoEstoqueAprop: TFDQuery;
    qryRelacaoApropriacaoSintetico: TFDQuery;
    QryRelacaoApropriacaoAnalitico: TFDQuery;
    frRelacaoProdutoApropriacao: TfrxReport;
    QryRelacaoProdutoApropriacao: TFDQuery;
    DspRelacaoProdutoApropriacao: TDataSetProvider;
    CdsRelacaoProdutoApropriacao: TClientDataSet;
    FrdsRelacaoProdutoApropriacao: TfrxDBDataset;
    FrRelacaoEstoqueProdutos: TfrxReport;
    QryRelacaoEstoqueProdutos: TFDQuery;
    DspRelacaoEstoqueProdutos: TDataSetProvider;
    CdsRelacaoEstoqueProdutos: TClientDataSet;
    FrdsRelacaoEstoqueProdutos: TfrxDBDataset;
    QryExtratoMovimentoProduto: TFDQuery;
    DspExtratoMovimentoProduto: TDataSetProvider;
    CdsExtratoMovimentoProduto: TClientDataSet;
    FrdsExtratoMovimentoProduto: TfrxDBDataset;
    frExtratoMovimentoProduto: TfrxReport;
    lblProduto: TLabel;
    edProduto: TJvComboEdit;
    FrRelacaoEstoqueProdutosInventario: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edProdutoButtonClick(Sender: TObject);
    procedure edProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FSQL_RelacaoEstoqueApropS,
    FSQL_RelacaoEstoqueApropA,
    FSQL_RelacaoEstoqueProdutos,
    FSQL_ApropriacaoGeralS   ,
    FSQL_ApropriacaoGeralA   ,
    FSQL_ProdutoApropriacao  ,
    FSQL_ProdutoExtrato      : TStringList;
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
    procedure MontarRelacaoEstoqueProdutos;
    procedure MontarApropriacaoSintetico;
    procedure MontarApropriacaoAnalitico;
    procedure MontarRelacaoProdutoApropriacao;
    procedure MontarExtratoMovimentoProduto;
  end;

(*
  Tabelas:
  - TBPRODUTO
  - TBESTOQUE_ALMOX
  - TBEMPRESA
  - TBCENTRO_CUSTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBFABRICANTE
  - TBUNIDADEPROD
  - TBCLIENTE
  - TBFORNECEDOR
  - TBAPROPRIACAO_ALMOX
  - TBCOMPETENCIA
  - TBCOMPRAS
  - TBAUTORIZA_COMPRA

  Views:
  - VW_TIPO_APROPRIACAO

  Procedures:
  - GET_LIMITE_DISPONIVEL_CLIENTE

*)

var
  frmGeApropriacaoEstoqueImpressao: TfrmGeApropriacaoEstoqueImpressao;

implementation

uses
  UConstantesDGE,
  UDMRecursos,
  UDMBusiness,
  UDMNFe,
  UFuncoes,
  View.Produto;

{$R *.dfm}

const
  REPORT_ESTOQUE_APROPRIACAO_SINTETICO = 0;
  REPORT_ESTOQUE_APROPRIACAO_ANALITICO = 1;
  REPORT_ESTOQUE_APROPRIACAO_PRODUTOS  = 2;
  REPORT_ESTOQUE_APROPRIACAO_PRODUTOS_INVENTARIO = 3;
  REPORT_RELACAO_APROPRIACAO_SINTETICO = 4;
  REPORT_RELACAO_APROPRIACAO_ANALITICO = 5;
  REPORT_RELACAO_PRODUTO_APROPRIACAO   = 6;
  REPORT_EXTRATO_PRODUTO_APROPRIACAO   = 7;

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
  with edTipoApropriacao, CdsTipoApropriacao do
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

  FSQL_RelacaoEstoqueProdutos := TStringList.Create;
  FSQL_RelacaoEstoqueProdutos.AddStrings( QryRelacaoEstoqueProdutos.SQL );

  FSQL_ApropriacaoGeralS := TStringList.Create;
  FSQL_ApropriacaoGeralS.AddStrings( qryRelacaoApropriacaoSintetico.SQL );

  FSQL_ApropriacaoGeralA := TStringList.Create;
  FSQL_ApropriacaoGeralA.AddStrings( QryRelacaoApropriacaoAnalitico.SQL );

  FSQL_ProdutoApropriacao := TStringList.Create;
  FSQL_ProdutoApropriacao.AddStrings( QryRelacaoProdutoApropriacao.SQL );

  FSQL_ProdutoExtrato := TStringList.Create;
  FSQL_ProdutoExtrato.AddStrings( QryExtratoMovimentoProduto.SQL );

  SetAtulizarCustoEstoqueApropriacao(GetDateDB);
end;

procedure TfrmGeApropriacaoEstoqueImpressao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) or ((Shift = [ssCtrl]) and (Key = SYS_KEY_L)) Then
  begin
    if ( edProduto.Focused ) then
    begin
      edProduto.Tag  := 0;
      edProduto.Text := EmptyStr;
    end;
  end;

  inherited;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.edEmpresaChange(
  Sender: TObject);
begin
  if edEmpresa.Focused then
    CarregarCentroCusto;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.edProdutoButtonClick(Sender: TObject);
var
  aProduto : TProdutoServico;
begin
  if SelecionarProdutoParaEntrada(Self, aProduto) then
  begin
    edProduto.Tag  := aProduto.aCodigo;
    edProduto.Text := aProduto.aCodigoAlfa + ' - ' + aProduto.aNome;
    edProduto.Hint := aProduto.aCodigoAlfa;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.edProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.edRelatorioChange(
  Sender: TObject);
var
  aEnabled : Boolean;
begin
  inherited;
  lblProduto.Visible  := (edRelatorio.ItemIndex = REPORT_EXTRATO_PRODUTO_APROPRIACAO);
  edProduto.Visible   := (edRelatorio.ItemIndex = REPORT_EXTRATO_PRODUTO_APROPRIACAO);

  // Filtros Grupo e Fabricante
  aEnabled := (edRelatorio.ItemIndex in [
      REPORT_ESTOQUE_APROPRIACAO_SINTETICO,
      REPORT_ESTOQUE_APROPRIACAO_ANALITICO,
      REPORT_ESTOQUE_APROPRIACAO_PRODUTOS,
      REPORT_ESTOQUE_APROPRIACAO_PRODUTOS_INVENTARIO
    ]);

  lblGrupo.Enabled      := aEnabled;
  edGrupo.Enabled       := lblGrupo.Enabled;
  lblFabricante.Enabled := aEnabled;
  edFabricante.Enabled  := lblFabricante.Enabled;

  if not edGrupo.Enabled then
    edGrupo.ItemIndex := 0;

  if not edFabricante.Enabled then
    edFabricante.ItemIndex := 0;

  if (edRelatorio.ItemIndex in [REPORT_EXTRATO_PRODUTO_APROPRIACAO, REPORT_ESTOQUE_APROPRIACAO_PRODUTOS, REPORT_ESTOQUE_APROPRIACAO_PRODUTOS_INVENTARIO]) then
  begin
    edSituacao.ItemIndex := 0;
    edTipoApropriacao.ItemIndex := 0;
  end;

  // Filtros Período, Situação e Tipo
  aEnabled := (edRelatorio.ItemIndex in [
      REPORT_RELACAO_APROPRIACAO_SINTETICO,
      REPORT_RELACAO_APROPRIACAO_ANALITICO,
      REPORT_RELACAO_PRODUTO_APROPRIACAO,
      REPORT_EXTRATO_PRODUTO_APROPRIACAO
    ]);

  lblData.Enabled := aEnabled;
  e1Data.Enabled  := lblData.Enabled;
  e2Data.Enabled  := lblData.Enabled;

  lblSituacao.Enabled := aEnabled and (edRelatorio.ItemIndex <> REPORT_EXTRATO_PRODUTO_APROPRIACAO);
  lblSituacao.Visible := (edRelatorio.ItemIndex <> REPORT_EXTRATO_PRODUTO_APROPRIACAO);
  edSituacao.Enabled  := lblSituacao.Enabled;
  edSituacao.Visible  := lblSituacao.Visible;

  lblTipoApropriacao.Enabled := aEnabled and (edRelatorio.ItemIndex <> REPORT_EXTRATO_PRODUTO_APROPRIACAO);
  lblTipoApropriacao.Visible := (edRelatorio.ItemIndex <> REPORT_EXTRATO_PRODUTO_APROPRIACAO);
  edTipoApropriacao.Enabled  := lblTipoApropriacao.Enabled;
  edTipoApropriacao.Visible  := lblTipoApropriacao.Visible;
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

procedure TfrmGeApropriacaoEstoqueImpressao.MontarRelacaoEstoqueProdutos;
begin
  try
    CdsRelacaoEstoqueProdutos.Close;

    with QryRelacaoEstoqueProdutos do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueProdutos );
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
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de produtos do estoque.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.MontarRelacaoProdutoApropriacao;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edTipoApropriacao.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s, para o tipo %s.', [e1Data.Text, e2Data.Text,
        Trim(Copy(edTipoApropriacao.Text, Pos('-', edTipoApropriacao.Text) + 1, Length(edTipoApropriacao.Text)))]);

    CdsRelacaoProdutoApropriacao.Close;

    with QryRelacaoProdutoApropriacao do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_ProdutoApropriacao );
      SQL.Add('where a.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));
      SQL.Add('  and a.status  > ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_EDC));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and a.data_apropriacao >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and a.data_apropriacao <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1 : SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ABR));
        2 : SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ENC));
        3 : SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_CAN));
      end;

      if ( edTipoApropriacao.ItemIndex > 0 ) then
        SQL.Add('  and a.tipo = ' + Trim(Copy(edTipoApropriacao.Text, 1, Pos('-', edTipoApropriacao.Text) - 1)));

      SQL.Add('order by');
      SQL.Add('    a.empresa');
      SQL.Add('  , a.tipo');
      SQL.Add('  , f.nomeforn');
      SQL.Add('  , f.nomefant');
      SQL.Add('  , a.data_apropriacao');
      SQL.Add('  , a.ano     ');
      SQL.Add('  , a.controle');
      SQL.Add('  , pd.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório de produtos das apropriações (por data de emissão).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoqueImpressao.btnVisualizarClick(
  Sender: TObject);
var
  aGerar : Boolean;
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '   + #13 +
    Format('- Centro de Custo : %s', [edCentroCusto.Text]) + #13 +
    Format('- Grupo           : %s', [edGrupo.Text])       + #13 +
    Format('- Fabricante      : %s', [edFabricante.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;
  aGerar := True;

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

    REPORT_ESTOQUE_APROPRIACAO_PRODUTOS, REPORT_ESTOQUE_APROPRIACAO_PRODUTOS_INVENTARIO:
      begin
        if (edCentroCusto.ItemIndex = 0) then
        begin
          aGerar := False;
          ShowWarning('Selecione o Centro de Custo para este relatório');
        end
        else
        begin
          SubTituloRelario := EmptyStr;
          MontarRelacaoEstoqueProdutos;
          if (edRelatorio.ItemIndex = REPORT_ESTOQUE_APROPRIACAO_PRODUTOS) then
            frReport := FrRelacaoEstoqueProdutos
          else
          if (edRelatorio.ItemIndex = REPORT_ESTOQUE_APROPRIACAO_PRODUTOS_INVENTARIO) then
            frReport := FrRelacaoEstoqueProdutosInventario;
        end;
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

    REPORT_RELACAO_PRODUTO_APROPRIACAO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoProdutoApropriacao;
        frReport := frRelacaoProdutoApropriacao;
      end;

    REPORT_EXTRATO_PRODUTO_APROPRIACAO:
      begin
        if ( edProduto.Tag = 0 ) then
        begin
          aGerar := False;
          ShowWarning('Favor selecionar o produto desejado!');

          if edProduto.Visible and edProduto.Enabled then
            edProduto.SetFocus;
        end;

        if (edEmpresa.ItemIndex = -1) then
          edEmpresa.ItemIndex := IndexOfArray(gUsuarioLogado.Empresa, IEmpresa);

        SubTituloRelario := EmptyStr;
        MontarExtratoMovimentoProduto;
        frReport := frExtratoMovimentoProduto;
      end;
  end;

  if aGerar and Assigned(frReport) then
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
        1 : SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ABR));
        2 : SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_ENC));
        3 : SQL.Add('  and a.status = ' + IntToStr(STATUS_APROPRIACAO_ESTOQUE_CAN));
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

procedure TfrmGeApropriacaoEstoqueImpressao.MontarExtratoMovimentoProduto;
begin
  try
    SubTituloRelario := edSituacao.Text;
    PeriodoRelatorio := Format('Apropriações realizadas no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsExtratoMovimentoProduto.Close;

    with QryExtratoMovimentoProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_ProdutoExtrato );

      SQL.Text := StringReplace(SQL.Text, ':empresa', QuotedStr(IEmpresa[edEmpresa.ItemIndex]), [rfReplaceAll]);
      SQL.Text := StringReplace(SQL.Text, ':produto', QuotedStr(edProduto.Hint), [rfReplaceAll]);
      SQL.Text := StringReplace(SQL.Text, ':data_inicial', QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)), [rfReplaceAll]);
      SQL.Text := StringReplace(SQL.Text, ':data_final', QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)), [rfReplaceAll]);
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar o extrato de movimentação do produto.' + #13#13 + E.Message);

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
