unit UGeTabelaCFOP;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, cxLookAndFeelPainters,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  DBClient, Provider, IBQuery, cxGraphics, cxLookAndFeels, Menus, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxDBEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeTabelaCFOP = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCFOP_COD: TIntegerField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    IbDtstTabelaCFOP_ESPECIFICACAO: TMemoField;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    GrpBxParametros: TGroupBox;
    dbCustoOperacional: TDBCheckBox;
    IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO: TSmallintField;
    DspCST: TDataSetProvider;
    CdsCST: TClientDataSet;
    DtsCST: TDataSource;
    lblCSTEntrada: TLabel;
    dbCSTEntrada: TDBLookupComboBox;
    IbDtstTabelaCFOP_CST_PADRAO_ENTRADA: TIBStringField;
    IbDtstTabelaCFOP_CST_PADRAO_SAIDA: TIBStringField;
    lblCSTSaida: TLabel;
    dbCSTSaida: TDBLookupComboBox;
    IbDtstTabelaCFOP_INFORMACAO_FISCO: TIBStringField;
    lblInformacaoFisco: TLabel;
    dbInformacaoFisco: TDBEdit;
    IbDtstTabelaCFOP_DEVOLUCAO: TSmallintField;
    dbCfopDevolucao: TDBCheckBox;
    IbDtstTabelaCFOP_GERAR_TITULO: TSmallintField;
    dbCfopGerarTitulo: TDBCheckBox;
    dbCfopGerarDuplicata: TDBCheckBox;
    IbDtstTabelaCFOP_GERAR_DUPLICATA: TSmallintField;
    IbDtstTabelaCFOP_REMESSA: TSmallintField;
    dbCfopRemessa: TDBCheckBox;
    grpBxCfopRetorno: TGroupBox;
    lblCfopRetornoDentro: TLabel;
    dbCfopRetornoDentro: TDBEdit;
    lblCfopRetornoFora: TLabel;
    dbCfopRetornoFora: TDBEdit;
    IbDtstTabelaCFOP_RETORNO_INTERNO: TIntegerField;
    IbDtstTabelaCFOP_RETORNO_EXTERNO: TIntegerField;
    fdQryCST: TFDQuery;
    IbDtstTabelaCFOP_TIPO: TSmallintField;
    lblTipo: TLabel;
    dbTipo: TcxDBImageComboBox;
    rgpTipo: TRadioGroup;
    Bevel5: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
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
  CampoCodigo    := 'CFOP_COD';
  CampoDescricao := 'CFOP_DESCRICAO';

  CarregarLista(CdsCST);
end;

procedure TfrmGeTabelaCFOP.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.AsInteger := 1;
  IbDtstTabelaCFOP_DEVOLUCAO.AsInteger            := 0;
  IbDtstTabelaCFOP_REMESSA.AsInteger              := 0;
  IbDtstTabelaCFOP_GERAR_TITULO.AsInteger         := 1;
  IbDtstTabelaCFOP_GERAR_DUPLICATA.AsInteger      := 1;
  IbDtstTabelaCFOP_TIPO.Clear;
  IbDtstTabelaCFOP_CST_PADRAO_ENTRADA.Clear;
  IbDtstTabelaCFOP_CST_PADRAO_SAIDA.Clear;
  IbDtstTabelaCFOP_RETORNO_INTERNO.Clear;
  IbDtstTabelaCFOP_RETORNO_EXTERNO.Clear;
end;

procedure TfrmGeTabelaCFOP.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not btbtnAlterar.Enabled then
    if IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.IsNull then
      IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.AsInteger := 1;
end;

procedure TfrmGeTabelaCFOP.btbtnSalvarClick(Sender: TObject);
begin
  if (IbDtstTabelaCFOP_COD.AsInteger = 0) then
    IbDtstTabelaCFOP_COD.Clear;

  if IbDtstTabelaCFOP_REMESSA.IsNull then
    IbDtstTabelaCFOP_REMESSA.AsInteger := 0;

  if IbDtstTabelaCFOP_GERAR_TITULO.IsNull then
    IbDtstTabelaCFOP_GERAR_TITULO.AsInteger := 1;

  if IbDtstTabelaCFOP_GERAR_DUPLICATA.IsNull then
    IbDtstTabelaCFOP_GERAR_DUPLICATA.AsInteger := 1;

  if IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.IsNull then
    IbDtstTabelaCFOP_ALTERA_CUSTO_PRODUTO.AsInteger := 1;

  if (IbDtstTabelaCFOP_REMESSA.AsInteger = 1) then
  begin
    IbDtstTabelaCFOP_GERAR_TITULO.AsInteger    := 0;
    IbDtstTabelaCFOP_GERAR_DUPLICATA.AsInteger := 0;
  end
  else
  begin
    IbDtstTabelaCFOP_RETORNO_INTERNO.Clear;
    IbDtstTabelaCFOP_RETORNO_EXTERNO.Clear;
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

  *)
  inherited;
  if (Field = IbDtstTabelaCFOP_REMESSA) then
  begin
    if (IbDtstTabela.State in [dsEdit, dsInsert]) and (IbDtstTabelaCFOP_REMESSA.AsInteger = 1) then
    begin
      IbDtstTabelaCFOP_GERAR_TITULO.AsInteger    := 0;
      IbDtstTabelaCFOP_GERAR_DUPLICATA.AsInteger := 0;
    end;
    grpBxCfopRetorno.Enabled := (IbDtstTabelaCFOP_REMESSA.AsInteger = 1);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaCFOP', TfrmGeTabelaCFOP);

end.
