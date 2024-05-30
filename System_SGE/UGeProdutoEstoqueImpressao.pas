unit UGeProdutoEstoqueImpressao;

interface

uses
  UGrPadraoImpressao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  cxButtons, ComCtrls, DBClient, Provider, DB, frxClass, frxDBSet,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinsDefaultPainters;

type
  TfrmGeProdutoEstoqueImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    FrRelacaoEstoqueProduto: TfrxReport;
    DspRelacaoEstoqueProduto: TDataSetProvider;
    CdsRelacaoEstoqueProduto: TClientDataSet;
    FrdsRelacaoEstoqueProduto: TfrxDBDataset;
    DspDemandaEstoqueProduto: TDataSetProvider;
    CdsDemandaEstoqueProduto: TClientDataSet;
    FrdsDemandaEstoqueProduto: TfrxDBDataset;
    lblAno: TLabel;
    edAno: TComboBox;
    FrDemandaEstoqueProduto: TfrxReport;
    ckSemEstoqueVenda: TCheckBox;
    fdQryGrupo: TFDQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    fdQryFabricante: TFDQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    CdsAno: TClientDataSet;
    DspAno: TDataSetProvider;
    fdQryAno: TFDQuery;
    fdQryEmpresas: TFDQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    ckComEstoqueVenda: TCheckBox;
    QryRelacaoEstoqueProduto: TFDQuery;
    QryDemandaEstoqueProduto: TFDQuery;
    FrRelacaoEstoqueProdutoLote: TfrxReport;
    QryRelacaoEstoqueProdutoLote: TFDQuery;
    DspRelacaoEstoqueProdutoLote: TDataSetProvider;
    CdsRelacaoEstoqueProdutoLote: TClientDataSet;
    FrdsRelacaoEstoqueProdutoLote: TfrxDBDataset;
    lblCentroCusto: TLabel;
    edCentroCusto: TComboBox;
    qryCentroCusto: TFDQuery;
    dspCentroCusto: TDataSetProvider;
    cdsCentroCusto: TClientDataSet;
    FrRelacaoLoteProdutoEstoque: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure ckSemEstoqueVendaClick(Sender: TObject);
    procedure ckComEstoqueVendaClick(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoEstoqueProduto    ,
    FSQL_RelacaoEstoqueProdutoLote,
    FSQL_DemandaEstoqueProduto    : TStringList;
    ICentroCusto,
    IGrupo      ,
    IFabricante : Array of Integer;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCentroCusto(const aEmpresa : String);
    procedure CarregarGrupo;
    procedure CarregarFabricante;
    procedure CarregarAno;
    procedure MontarRelacaoEstoqueProduto;
    procedure MontarRelacaoEstoqueProdutoLote;
    procedure MontarDemandaEstoqueProduto;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBPRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBUNIDADEPROD
  - TBFABRICANTE
  - TBCOMPETENCIA
  - TBEMPRESA
  - TBAJUSTESTOQ
  - TBCOMPRAS
  - TBCOMPRASITENS
  - TBINVENTARIO_ALMOX
  - TBINVENTARIO_ALMOX_ITEM
  - TBAPROPRIACAO_ALMOX
  - TBAPROPRIACAO_ALMOX_ITEM
  - TBREQUISICAO_ALMOX
  - TBREQUISICAO_ALMOX_ITEM
  - TBESTOQUE_ALMOX
  - TBCENTRO_CUSTO
  - TBCENTRO_CUSTO_EMPRESA

  Views:
  - VW_EMPRESA
  - VW_PRODUTO_DEMANDA_ANUAL

  Procedures:

*)

var
  frmGeProdutoEstoqueImpressao: TfrmGeProdutoEstoqueImpressao;

implementation

uses
  System.StrUtils,
  UConstantesDGE,
  UDMBusiness,
  UDMRecursos,
  UDMNFe,
  SGE.Controller.Interfaces,
  SGE.Controller.Factory,
  UGrPadrao;

const
  REPORT_RELACAO_ESTOQUE_PRODUTO    = 0;
  REPORT_RELACAO_ESTOQUE_PRODUTO_LT = 1;
  REPORT_LOTE_PRODUTO_ESTOQUE       = 2;
  REPORT_DEMANDA_ESTOQUE_PRODUTO    = 3;

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
      edEmpresa.Items.Add( FieldByName('razao').AsString );
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

procedure TfrmGeProdutoEstoqueImpressao.ckComEstoqueVendaClick(Sender: TObject);
begin
  if ckComEstoqueVenda.Checked and ckSemEstoqueVenda.Checked then
    ckSemEstoqueVenda.Checked := False;
end;

procedure TfrmGeProdutoEstoqueImpressao.ckSemEstoqueVendaClick(Sender: TObject);
begin
  if ckSemEstoqueVenda.Checked and ckComEstoqueVenda.Checked then
    ckComEstoqueVenda.Checked := False;
end;

procedure TfrmGeProdutoEstoqueImpressao.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID := ROTINA_REL_ESTOQUE_PROD_ID;

  FSQL_RelacaoEstoqueProduto := TStringList.Create;
  FSQL_RelacaoEstoqueProduto.AddStrings( QryRelacaoEstoqueProduto.SQL );

  FSQL_RelacaoEstoqueProdutoLote := TStringList.Create;
  FSQL_RelacaoEstoqueProdutoLote.AddStrings( QryRelacaoEstoqueProdutoLote.SQL );

  FSQL_DemandaEstoqueProduto := TStringList.Create;
  FSQL_DemandaEstoqueProduto.AddStrings( QryDemandaEstoqueProduto.SQL );

  SetAtulizarCustoEstoque(GetDateDB);

  if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
  begin
    ckSemEstoqueVenda.Caption := 'Apenas produtos SEM Estoque para Apropria��o';
    ckComEstoqueVenda.Caption := 'Apenas produtos COM Estoque para Apropria��o';
  end;
end;

procedure TfrmGeProdutoEstoqueImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarGrupo;
  CarregarFabricante;
  CarregarAno;

  CarregarCentroCusto(gUsuarioLogado.Empresa);

  lblCentroCusto.Enabled  := False;
  edCentroCusto.Enabled   := False;
  edCentroCusto.ItemIndex := 0;
end;

procedure TfrmGeProdutoEstoqueImpressao.MontarDemandaEstoqueProduto;
begin
  try
    CdsDemandaEstoqueProduto.Close;

    with QryDemandaEstoqueProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_DemandaEstoqueProduto );
      SQL.Add('where (p.arquivo_morto = 0)');
      SQL.Add('  and (p.aliquota_tipo = 0)');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      if ( edEmpresa.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(xx.empresa, yy.empresa, p.codemp) = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
      begin
        if ckSemEstoqueVenda.Checked then
          SQL.Add('  and coalesce(xx.apropriacao_qtde, 0.0) <= 0.0')
        else
        if ckComEstoqueVenda.Checked then
          SQL.Add('  and coalesce(xx.apropriacao_qtde, 0.0) <> 0.0');
      end
      else
      begin
        if ckSemEstoqueVenda.Checked then
          SQL.Add('  and p.qtde <= 0.0')
        else
        if ckComEstoqueVenda.Checked then
          SQL.Add('  and p.qtde <> 0.0');
      end;

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');

      SQL.Text := StringReplace(SQL.Text, ':ano', edAno.Text, [rfReplaceAll]);
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a rela��o de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

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
      SQL.Add('where (p.arquivo_morto = 0)');
      SQL.Add('  and (p.aliquota_tipo = 0)');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      if ( edEmpresa.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(xx.empresa, p.codemp) = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
      begin
        if ckSemEstoqueVenda.Checked then
          SQL.Add('  and coalesce(xx.apropriacao_qtde, 0.0) <= 0.0')
        else
        if ckComEstoqueVenda.Checked then
          SQL.Add('  and coalesce(xx.apropriacao_qtde, 0.0) <> 0.0');
      end
      else
      begin
        if ckSemEstoqueVenda.Checked then
          SQL.Add('  and p.qtde <= 0.0')
        else
        if ckComEstoqueVenda.Checked then
          SQL.Add('  and p.qtde <> 0.0');
      end;

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a rela��o de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoEstoqueImpressao.MontarRelacaoEstoqueProdutoLote;
var
  aWhere : String;
const
  WHR_POS = 'where (p.codigo > 0)';
begin
  try
    CdsRelacaoEstoqueProdutoLote.Close;
    CdsRelacaoEstoqueProdutoLote.ParamByName('empresa').AsString       := IEmpresa[edEmpresa.ItemIndex];
    CdsRelacaoEstoqueProdutoLote.ParamByName('centro_custo').AsInteger := ICentroCusto[edCentroCusto.ItemIndex];

    with QryRelacaoEstoqueProdutoLote do
    begin
      aWhere :=
        'where (p.arquivo_morto = 0)' +
        '  and (p.aliquota_tipo = 0)';

      if ( edGrupo.ItemIndex > 0 ) then
        aWhere := aWhere + '  and (p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]) + ')';

      if ( edFabricante.ItemIndex > 0 ) then
        aWhere := aWhere + '  and (p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]) + ')';

      if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
      begin
        if ckSemEstoqueVenda.Checked then
          aWhere := aWhere + '  and (coalesce(xx.apropriacao_qtde, 0.0) <= 0.0)'
        else
        if ckComEstoqueVenda.Checked then
          aWhere := aWhere + '  and (coalesce(xx.apropriacao_qtde, 0.0) <> 0.0)';
      end
      else
      begin
        if ckSemEstoqueVenda.Checked then
          aWhere := aWhere + '  and ((coalesce(p.qtde, 0.0) + coalesce(xx.apropriacao_qtde, 0.0)) <= 0.0)'
        else
        if ckComEstoqueVenda.Checked then
          aWhere := aWhere + '  and ((coalesce(p.qtde, 0.0) + coalesce(xx.apropriacao_qtde, 0.0)) <> 0.0)';
      end;

      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueProdutoLote );
      SQL.Text := StringReplace(SQL.Text, WHR_POS, aWhere, [rfReplaceAll]);
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a rela��o de ' + StrDescricaoProduto + ' por lote.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoEstoqueImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  if (edRelatorio.ItemIndex in [REPORT_RELACAO_ESTOQUE_PRODUTO_LT, REPORT_LOTE_PRODUTO_ESTOQUE]) and ((edEmpresa.ItemIndex = 0) or (edCentroCusto.ItemIndex = 0)) then
    ShowWarning('Selecione a Empresa e o centro de Custo para este relat�rio!')
  else
  begin
    Filtros := 'FILTROS APLICADOS AO MONTAR O RELAT�RIO: '  + #13 +
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

      REPORT_RELACAO_ESTOQUE_PRODUTO_LT, REPORT_LOTE_PRODUTO_ESTOQUE:
        begin
          SubTituloRelario := EmptyStr;
          MontarRelacaoEstoqueProdutoLote;
          if (edRelatorio.ItemIndex = REPORT_RELACAO_ESTOQUE_PRODUTO_LT) then
            frReport := FrRelacaoEstoqueProdutoLote
          else
            frReport := FrRelacaoLoteProdutoEstoque;
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
end;

procedure TfrmGeProdutoEstoqueImpressao.edEmpresaChange(Sender: TObject);
begin
  CarregarCentroCusto(IEmpresa[edEmpresa.ItemIndex]);
end;

procedure TfrmGeProdutoEstoqueImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  lblAno.Enabled := (edRelatorio.ItemIndex = REPORT_DEMANDA_ESTOQUE_PRODUTO);
  edAno.Enabled  := (edRelatorio.ItemIndex = REPORT_DEMANDA_ESTOQUE_PRODUTO);

  lblCentroCusto.Enabled := (edRelatorio.ItemIndex in [REPORT_RELACAO_ESTOQUE_PRODUTO_LT, REPORT_LOTE_PRODUTO_ESTOQUE]);
  edCentroCusto.Enabled  := lblCentroCusto.Enabled;

  if (edRelatorio.ItemIndex in [REPORT_RELACAO_ESTOQUE_PRODUTO_LT, REPORT_LOTE_PRODUTO_ESTOQUE]) then
    edCentroCusto.ItemIndex := (edRelatorio.Items.Count - 1)
  else
    edCentroCusto.ItemIndex := 0;
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

  edAno.ItemIndex := edAno.Items.IndexOf( FormatDateTime('yyyy', GetDateDB) );
end;

procedure TfrmGeProdutoEstoqueImpressao.CarregarCentroCusto(const aEmpresa: String);
var
  I : Integer;
begin
  if (Trim(aEmpresa) <> EmptyStr) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) then
    (TControllerFactory.New.CentroCusto as IControllerCentroCusto).SetCentroCustoGeral(gUsuarioLogado.Empresa);

  with cdsCentroCusto do
  begin
    Close;
    ParamByName('empresa').AsString := aEmpresa;
    Open;

    edCentroCusto.Clear;
    SetLength(ICentroCusto, RecordCount + 1);

    edCentroCusto.Items.Add('(Todas)');
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
  end;

  if (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) and (I > 1) then
    edCentroCusto.ItemIndex := 1
  else
    edCentroCusto.ItemIndex := 0;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoEstoqueImpressao', TfrmGeProdutoEstoqueImpressao);

end.
