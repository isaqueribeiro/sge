unit UGeProdutoEstoqueConsigImpressao;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmGeProdutoEstoqueConsigImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    lblSituacaoEstoque: TLabel;
    edSituacaoEstoque: TComboBox;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    FrRelacaoEstoqueConsignado: TfrxReport;
    DspRelacaoEstoqueConsignado: TDataSetProvider;
    CdsRelacaoEstoqueConsignado: TClientDataSet;
    FrdsRelacaoEstoqueConsignado: TfrxDBDataset;
    FrRelacaoEstoqueConsignadoResumo: TfrxReport;
    DspRelacaoEstoqueConsignadoResumo: TDataSetProvider;
    CdsRelacaoEstoqueConsignadoResumo: TClientDataSet;
    FrdsRelacaoEstoqueConsignadoResumo: TfrxDBDataset;
    QryRelacaoEstoqueConsignadoResumo: TFDQuery;
    fdQryEmpresas: TFDQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    fdQryGrupo: TFDQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    fdQryFabricante: TFDQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    QryRelacaoEstoqueConsignado: TFDQuery;
    dtsCliente: TDataSource;
    fdQryCliente: TFDQuery;
    DspCliente: TDataSetProvider;
    CdsCliente: TClientDataSet;
    lblCliente: TLabel;
    edCliente: TcxLookupComboBox;
    lblDicaDadosEntrega: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoEstoqueConsignadoS ,
    FSQL_RelacaoEstoqueConsignadoA : TStringList;
    IEmpresa     : Array of String;
    IGrupo       ,
    IFabricante  : Array of Integer;
  public
    { Public declarations }
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCliente;
    procedure CarregarGrupo;
    procedure CarregarFabricante;
    procedure MontarRelacaoEstoqueConsignadoSintetico;
    procedure MontarRelacaoEstoqueConsignadoAnalitico;
  end;

(*
  Tabelas:
  - TBESTOQUE_ALMOX
  - TBPRODUTO
  - TBEMPRESA
  - TBGRUPOPROD
  - TBFABRICANTE
  - TBUNIDADEPROD
  - TBCLIENTE
  - TBVENDAS

  Views:

  Procedures:

*)

var
  frmGeProdutoEstoqueConsigImpressao: TfrmGeProdutoEstoqueConsigImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness, UDMNFe, UDMRecursos;

{$R *.dfm}

const
  REPORT_ESTOQUE_CONSIGNADO_SINTETICO = 0;
  REPORT_ESTOQUE_CONSIGNADO_ANALITICO = 1;

  IDX_SITUACAO_PRODUTO_COM_ESTOQUE = 1;

{ TfrmGeApropriacaoEstoqueImpressao }

procedure TfrmGeProdutoEstoqueConsigImpressao.CarregarCliente;
begin
  if not CdsCliente.Active then
  begin
    CdsCliente.Open;
    edCliente.EditValue := 0;
  end;
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.CarregarEmpresa;
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

procedure TfrmGeProdutoEstoqueConsigImpressao.CarregarFabricante;
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

procedure TfrmGeProdutoEstoqueConsigImpressao.CarregarGrupo;
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

procedure TfrmGeProdutoEstoqueConsigImpressao.FormCreate(Sender: TObject);
begin
  edSituacaoEstoque.ItemIndex := IDX_SITUACAO_PRODUTO_COM_ESTOQUE;

  inherited;

  RotinaID := ROTINA_REL_ESTOQUE_PROD_CONSIG_ID;

  FSQL_RelacaoEstoqueConsignadoS := TStringList.Create;
  FSQL_RelacaoEstoqueConsignadoS.AddStrings( QryRelacaoEstoqueConsignadoResumo.SQL );

  FSQL_RelacaoEstoqueConsignadoA := TStringList.Create;
  FSQL_RelacaoEstoqueConsignadoA.AddStrings( QryRelacaoEstoqueConsignado.SQL );
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.FormShow(Sender: TObject);
begin
  inherited;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    CarregarEmpresa;
    CarregarCliente;
    CarregarGrupo;
    CarregarFabricante;
  finally
    WaitAMomentFree;
    edRelatorioChange(edRelatorio);
  end;
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.edRelatorioChange(
  Sender: TObject);
begin
  inherited;
  lblEmpresa.Enabled := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_CONSIGNADO_ANALITICO]);
  edEmpresa.Enabled  := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_CONSIGNADO_ANALITICO]);
  lblSituacaoEstoque.Enabled := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_CONSIGNADO_ANALITICO]);
  edSituacaoEstoque.Enabled  := (edRelatorio.ItemIndex in [REPORT_ESTOQUE_CONSIGNADO_ANALITICO]);

  if not edEmpresa.Enabled then
    edEmpresa.ItemIndex := 0;

  if not edSituacaoEstoque.Enabled then
    edSituacaoEstoque.ItemIndex := IDX_SITUACAO_PRODUTO_COM_ESTOQUE;
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.MontarRelacaoEstoqueConsignadoAnalitico;
begin
  try
    CdsRelacaoEstoqueConsignado.Close;

    with QryRelacaoEstoqueConsignado do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueConsignadoA );
      SQL.Add('where (e.cod_cliente <> ' + IntToStr(CONSUMIDOR_FINAL_CODIGO) + ')');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and (p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]) + ')');

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and (p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]) + ')');

      Case edSituacaoEstoque.ItemIndex of
        1: SQL.Add('  and (e.quantidade  > 0)');
        2: SQL.Add('  and (e.quantidade <= 0)');
      end;

      if ( edCliente.ItemIndex > 0 ) and ( VarToStr(edCliente.EditValue) <> '0' ) then
        SQL.Add('  and (e.cod_cliente = ' + VarToStr(edCliente.EditValue) + ')');

      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , e.cod_cliente');
      SQL.Add('  , g.descri');
      SQL.Add('  , p.codgrupo');
      SQL.Add('  , p.descri_apresentacao');
    end;

    CdsRelacaoEstoqueConsignado.FetchParams;
    CdsRelacaoEstoqueConsignado.ParamByName('empresa').AsString := IEmpresa[edEmpresa.ItemIndex];
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de produtos com estoque consignado.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.MontarRelacaoEstoqueConsignadoSintetico;
begin
  try
    CdsRelacaoEstoqueConsignadoResumo.Close;

    with QryRelacaoEstoqueConsignadoResumo do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoEstoqueConsignadoS );
      SQL.Add('where (e.cod_cliente <> ' + IntToStr(CONSUMIDOR_FINAL_CODIGO) + ')');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and (p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]) + ')');

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and (p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]) + ')');

      Case edSituacaoEstoque.ItemIndex of
        1: SQL.Add('  and (e.quantidade  > 0)');
        2: SQL.Add('  and (e.quantidade <= 0)');
      end;

      if ( edCliente.ItemIndex > 0 ) and ( VarToStr(edCliente.EditValue) <> '0' ) then
        SQL.Add('  and (e.cod_cliente = ' + VarToStr(edCliente.EditValue) + ')');

      SQL.Add('group by');
      SQL.Add('    e.cod_cliente');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('  , p.codgrupo');
      SQL.Add('  , g.descri');
      SQL.Add('  , p.codfabricante');
      SQL.Add('  , f.nome');

      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , e.cod_cliente');
      SQL.Add('  , g.descri');
      SQL.Add('  , f.nome');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de estoque consignado resumo.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoEstoqueConsigImpressao.btnVisualizarClick(
  Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
    Format('- Grupo      : %s', [edGrupo.Text])     + #13 +
    Format('- Fabricante : %s', [edFabricante.Text]) + #13 +
    Format('- Cliente    : %s', [edCliente.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_ESTOQUE_CONSIGNADO_SINTETICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoEstoqueConsignadoSintetico;
        frReport := FrRelacaoEstoqueConsignadoResumo;
      end;

    REPORT_ESTOQUE_CONSIGNADO_ANALITICO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoEstoqueConsignadoAnalitico;
        frReport := FrRelacaoEstoqueConsignado;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoEstoqueConsigImpressao', TfrmGeProdutoEstoqueConsigImpressao);

end.
