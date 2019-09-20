unit UGeTabelaCFOP;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, System.ImageList,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, cxLookAndFeelPainters,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  DBClient, Provider, IBQuery, cxGraphics, cxLookAndFeels, Menus, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxDBEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeTabelaCFOP = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    GrpBxParametros: TGroupBox;
    dbAlteraCustoEntrada: TDBCheckBox;
    DspCST: TDataSetProvider;
    CdsCST: TClientDataSet;
    DtsCST: TDataSource;
    lblCSTEntrada: TLabel;
    dbCSTEntrada: TDBLookupComboBox;
    lblCSTSaida: TLabel;
    dbCSTSaida: TDBLookupComboBox;
    lblInformacaoFisco: TLabel;
    dbInformacaoFisco: TDBEdit;
    dbCfopDevolucao: TDBCheckBox;
    dbCfopGerarTitulo: TDBCheckBox;
    dbCfopGerarDuplicata: TDBCheckBox;
    dbCfopRemessa: TDBCheckBox;
    grpBxCfopRetorno: TGroupBox;
    lblCfopRetornoDentro: TLabel;
    dbCfopRetornoDentro: TDBEdit;
    lblCfopRetornoFora: TLabel;
    dbCfopRetornoFora: TDBEdit;
    fdQryCST: TFDQuery;
    lblTipo: TLabel;
    dbTipo: TcxDBImageComboBox;
    rgpTipo: TRadioGroup;
    Bevel5: TBevel;
    fdQryTabelaCFOP_COD: TIntegerField;
    fdQryTabelaCFOP_DESCRICAO: TStringField;
    fdQryTabelaCFOP_ESPECIFICACAO: TMemoField;
    fdQryTabelaCFOP_INFORMACAO_FISCO: TStringField;
    fdQryTabelaCFOP_TIPO: TSmallintField;
    fdQryTabelaCFOP_DEVOLUCAO: TSmallintField;
    fdQryTabelaCFOP_REMESSA: TSmallintField;
    fdQryTabelaCFOP_RETORNO_INTERNO: TIntegerField;
    fdQryTabelaCFOP_RETORNO_EXTERNO: TIntegerField;
    fdQryTabelaCFOP_ALTERA_CUSTO_PRODUTO: TSmallintField;
    fdQryTabelaCFOP_CST_PADRAO_ENTRADA: TStringField;
    fdQryTabelaCFOP_CST_PADRAO_SAIDA: TStringField;
    fdQryTabelaCFOP_GERAR_TITULO: TSmallintField;
    fdQryTabelaCFOP_GERAR_DUPLICATA: TSmallintField;
    fdQryTabelaCFOP_ALTERA_ESTOQUE_PRODUTO: TSmallintField;
    dbAlteraEstoqueEntradaSaida: TDBCheckBox;
    lblInformeRemessa: TLabel;
    dbCfopFaturarRemessa: TDBCheckBox;
    fdQryTabelaCFOP_FATURAR_REMESSA: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCFOP

  Views:

  Procedure:
  - GET_CST_NORMAL
*)

var
  frmGeTabelaCFOP: TfrmGeTabelaCFOP;

  procedure MostrarTabelaCFOP(const AOwner : TComponent);

  function SelecionarCFOP(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaCFOP(const AOwner : TComponent);
var
  frm : TfrmGeTabelaCFOP;
begin
  frm := TfrmGeTabelaCFOP.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCFOP(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTabelaCFOP;
begin
  frm := TfrmGeTabelaCFOP.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTabelaCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_CFOP_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBCFOP';
  CampoCodigo    := 'c.CFOP_COD';
  CampoDescricao := 'c.CFOP_DESCRICAO';
  CampoOrdenacao := 'c.CFOP_COD';

  CarregarLista(CdsCST);

  lblInformeRemessa.Visible := (gSistema.Codigo = SISTEMA_GESTAO_OPME);
end;

procedure TfrmGeTabelaCFOP.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').AsInteger := 1;
    FieldByName('CFOP_DEVOLUCAO').AsInteger            := 0;
    FieldByName('CFOP_REMESSA').AsInteger              := 0;
    FieldByName('CFOP_GERAR_TITULO').AsInteger         := 1;
    FieldByName('CFOP_GERAR_DUPLICATA').AsInteger      := 1;
    FieldByName('CFOP_TIPO').Clear;
    FieldByName('CFOP_CST_PADRAO_ENTRADA').Clear;
    FieldByName('CFOP_CST_PADRAO_SAIDA').Clear;
    FieldByName('CFOP_RETORNO_INTERNO').Clear;
    FieldByName('CFOP_RETORNO_EXTERNO').Clear;
  end;
end;

procedure TfrmGeTabelaCFOP.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not btbtnAlterar.Enabled then
    with DtSrcTabela.DataSet do
    begin
      if FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').IsNull then
        FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').AsInteger := 1;
    end;
end;

procedure TfrmGeTabelaCFOP.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('CFOP_COD').AsInteger = 0) then
      FieldByName('CFOP_COD').Clear;

    if FieldByName('CFOP_REMESSA').IsNull then
      FieldByName('CFOP_REMESSA').AsInteger := 0;

    if FieldByName('CFOP_FATURAR_REMESSA').IsNull then
      FieldByName('CFOP_FATURAR_REMESSA').AsInteger := 0;

    if FieldByName('CFOP_GERAR_TITULO').IsNull then
      FieldByName('CFOP_GERAR_TITULO').AsInteger := 1;

    if FieldByName('CFOP_GERAR_DUPLICATA').IsNull then
      FieldByName('CFOP_GERAR_DUPLICATA').AsInteger := 1;

    if FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').IsNull then
      FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').AsInteger := 1;

    // Regra 2 : Apenas CFOPs de Remessa terão CFOPs de Retorno
    if (FieldByName('CFOP_REMESSA').AsInteger = 0) then
    begin
      FieldByName('CFOP_RETORNO_INTERNO').Clear;
      FieldByName('CFOP_RETORNO_EXTERNO').Clear;
    end;
  end;

  inherited;
end;

procedure TfrmGeTabelaCFOP.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := EmptyStr;

  if ( rgpTipo.ItemIndex > 0 ) then
    WhereAdditional := '(c.Cfop_tipo = ' + IntToStr(rgpTipo.ItemIndex) + ')';

  inherited;
end;

procedure TfrmGeTabelaCFOP.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  (*

  Regra 1 : CFOP marcado como "Remessa" não gera movimentaçao financeira.
  Regra 2 : Apenas CFOPs de Remessa terão CFOPs de Retorno
  Regra 3 : CFOP marcado como "Faturar Remessa" gera movimentaçao financeira.

  *)
  inherited;

  with DtSrcTabela.DataSet do
  begin
    if (Field = FieldByName('CFOP_REMESSA')) then
    begin
      if (State in [dsEdit, dsInsert]) and (FieldByName('CFOP_REMESSA').AsInteger = 1) then
      begin
        FieldByName('CFOP_GERAR_TITULO').AsInteger    := 0;
        FieldByName('CFOP_GERAR_DUPLICATA').AsInteger := 0;
        FieldByName('CFOP_FATURAR_REMESSA').AsInteger := 0;
      end
      else
      if (State in [dsEdit, dsInsert]) and (FieldByName('CFOP_REMESSA').AsInteger = 0) then
      begin
        FieldByName('CFOP_RETORNO_INTERNO').Clear;
        FieldByName('CFOP_RETORNO_EXTERNO').Clear;
      end;

      grpBxCfopRetorno.Enabled := (FieldByName('CFOP_REMESSA').AsInteger = 1);
    end
    else
    if (Field = FieldByName('CFOP_FATURAR_REMESSA')) then
    begin
      if (State in [dsEdit, dsInsert]) and (FieldByName('CFOP_FATURAR_REMESSA').AsInteger = 1) then
      begin
        FieldByName('CFOP_GERAR_TITULO').AsInteger    := 1;
        FieldByName('CFOP_GERAR_DUPLICATA').AsInteger := 1;
        FieldByName('CFOP_REMESSA').AsInteger         := 0;
      end;
    end;
  end;
end;

procedure TfrmGeTabelaCFOP.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    grpBxCfopRetorno.Enabled := (FieldByName('CFOP_REMESSA').AsInteger = 1);
end;

procedure TfrmGeTabelaCFOP.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('CFOP_ALTERA_ESTOQUE_PRODUTO').AsInteger := 1;
    FieldByName('CFOP_FATURAR_REMESSA').AsInteger        := 0;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaCFOP', TfrmGeTabelaCFOP);

end.
