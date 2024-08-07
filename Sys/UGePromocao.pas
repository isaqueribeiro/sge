unit UGePromocao;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvToolEdit, JvDBControls, JvExMask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGePromocao = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblDataInicio: TLabel;
    lblDataFinal: TLabel;
    lblDescontoProm: TLabel;
    dbDescontoProm: TDBEdit;
    DtSrcProdutos: TDataSource;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblValorUnit: TLabel;
    lblDesconto: TLabel;
    lblUnidade: TLabel;
    Bevel5: TBevel;
    lblValorPromocao: TLabel;
    dbProdutoNome: TDBEdit;
    dbValorUnit: TDBEdit;
    dbDesconto: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    dbAtiva: TDBCheckBox;
    dbProduto: TJvDBComboEdit;
    dbValorPromocao: TJvDBComboEdit;
    dbDataInicio: TJvDBDateEdit;
    dbDataFinal: TJvDBDateEdit;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaDESCRICAO: TStringField;
    fdQryTabelaDATA_INICIO: TDateField;
    fdQryTabelaDATA_FINAL: TDateField;
    fdQryTabelaATIVA: TSmallintField;
    qryProduto: TFDQuery;
    cdsProdutos: TFDQuery;
    IbUpdProdutos: TFDUpdateSQL;
    cdsProdutosSequencial: TIntegerField;
    cdsProdutosCODIGO_PROM: TIntegerField;
    cdsProdutosCODIGO_PROD: TStringField;
    cdsProdutosPRECO_VENDA: TFMTBCDField;
    cdsProdutosDESCONTO: TFMTBCDField;
    cdsProdutosPRECO_PROMOCAO: TFMTBCDField;
    cdsProdutosUSUARIO: TStringField;
    cdsProdutosDESCRI: TStringField;
    cdsProdutosUNIDADE: TStringField;
    fdQryTabelaPERCENTUAL_DESCONTO: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure DtSrcProdutosStateChange(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsProdutosXXXNewRecord(DataSet: TDataSet);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure dbValorPromocaoButtonClick(Sender: TObject);
    procedure cdsProdutosXXXCalcFields(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    SQL_Produtos : TStringList;
    procedure ConfigurarTabelaProdutos;

    procedure AbrirTabelaProdutos(const PromocaoID : Integer);
    procedure CarregarDadosProduto(const ProdutoID : Integer);
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBPROMOCAO
  - TBPRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBUNIDADEPROD
  - TBCFOP

  Views:

  Procedures:

*)

var
  frmGePromocao: TfrmGePromocao;

  procedure MostrarTabelaPromocoes(const AOwner : TComponent);

  function SelecionarPromocao(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
    UDMBusiness
  , View.Produto
  , UConstantesDGE
  , Interacao.Tabela
  , Controller.Tabela;

{$R *.dfm}

procedure MostrarTabelaPromocoes(const AOwner : TComponent);
var
  frm : TfrmGePromocao;
begin
  frm := TfrmGePromocao.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarPromocao(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGePromocao;
begin
  frm := TfrmGePromocao.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGePromocao.AbrirTabelaProdutos(const PromocaoID: Integer);
begin
  cdsProdutos.Close;

  with cdsProdutos, SQL do
  begin
    Clear;
    AddStrings( SQL_Produtos );
    Add('where p.Codigo_prom = ' + IntToStr(PromocaoID));
  end;

  cdsProdutos.Open;
end;

procedure TfrmGePromocao.FormCreate(Sender: TObject);
begin
  inherited;
  Desativar_Promocoes;

  DisplayFormatCodigo := '0000';
  RotinaID            := ROTINA_CAD_PROMOCAO_ID;
  ControlFirstEdit    := dbNome;

  NomeTabela     := 'TBPROMOCAO';
  CampoCodigo    := 'p.CODIGO';
  CampoDescricao := 'p.DESCRICAO';
  CampoOrdenacao := 'p.Ativa DESC, p.Data_inicio ASC, p.DESCRICAO ASC';

  UpdateGenerator;

  SQL_Produtos := TStringList.Create;
  SQL_Produtos.AddStrings( cdsProdutos.SQL );

  Tabela
    .Display('codigo', 'C�digo', '##0000', TAlignment.taCenter)
    .Display('descricao', 'Descri��o')
    .Display('data_inicio', 'Data In�cio', 'dd/mm/yyyy')
    .Display('data_final', 'Data Final', 'dd/mm/yyyy')
    .Display('percentual_desconto', '% Desconto', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  ConfigurarTabelaProdutos;
end;

procedure TfrmGePromocao.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirTabelaProdutos( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TfrmGePromocao.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaProdutos( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TfrmGePromocao.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirTabelaProdutos( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TfrmGePromocao.DtSrcProdutosStateChange(Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcProdutos.AutoEdit and (cdsProdutos.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcProdutos.AutoEdit and (cdsProdutos.State = dsBrowse) and (not cdsProdutos.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcProdutos.AutoEdit and (cdsProdutos.State = dsBrowse) and (not cdsProdutos.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsProdutos.State in [dsEdit, dsInsert] );

  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGePromocao.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo     : Integer;
  sCodigoAlfa ,
  sDescricao  ,
  sUnidade    : String;
  cValorVenda   ,
  cValorPromocao: Currency;
begin
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProduto(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, cValorVenda, cValorPromocao) ) then
    begin
      cdsProdutosCODIGO_PROD.AsString   := sCodigoAlfa;
      cdsProdutosDESCRI.AsString        := sDescricao;
      cdsProdutosUNIDADE.AsString       := sUnidade;
      cdsProdutosPRECO_VENDA.AsCurrency := cValorVenda;
    end;
end;

procedure TfrmGePromocao.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbAtiva.ReadOnly       := ( DtSrcTabela.DataSet.State in [dsInsert] );
  DtSrcProdutos.AutoEdit := ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] );
  DtSrcProdutosStateChange( DtSrcProdutos );
end;

procedure TfrmGePromocao.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaProdutos( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TfrmGePromocao.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('ATIVA').AsInteger                := 0;
    FieldByName('DATA_INICIO').AsDateTime         := GetDateDB;
    FieldByName('PERCENTUAL_DESCONTO').AsCurrency := 0.0;
    AbrirTabelaProdutos( FieldByName('CODIGO').AsInteger );
  end;
end;

procedure TfrmGePromocao.cdsProdutosXXXNewRecord(DataSet: TDataSet);
begin
  cdsProdutosCODIGO_PROM.Value := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
  cdsProdutosDESCONTO.Value    := 0.0;
end;

procedure TfrmGePromocao.btnProdutoInserirClick(Sender: TObject);
begin
  if ( cdsProdutos.Active ) then
  begin
    cdsProdutos.Append;
    cdsProdutosCODIGO_PROM.AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
    cdsProdutosDESCONTO.AsCurrency   := DtSrcTabela.DataSet.FieldByName('PERCENTUAL_DESCONTO').AsCurrency;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGePromocao.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsProdutos.IsEmpty ) then
  begin
    cdsProdutos.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGePromocao.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not cdsProdutos.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
      cdsProdutos.Delete;
end;

procedure TfrmGePromocao.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsProdutosCODIGO_PROD.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o c�digo do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( (cdsProdutosDESCONTO.AsCurrency < 0) or (cdsProdutosDESCONTO.AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual de desconto inv�lido.');
      dbDesconto.SetFocus;
    end
    else
    begin

      cdsProdutos.Post;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGePromocao.ConfigurarTabelaProdutos;
begin
  TTabelaController
    .New
    .Tabela( cdsProdutos )
    .Display('sequencial', '#', '00', TAlignment.taCenter)
    .Display('codigo_prod', 'C�digo')
    .Display('descri', 'Produto')
    .Display('unidade', 'Und.')
    .Display('preco_venda', 'Valor Venda (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('desconto', '% Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('preco_promocao', 'Valor Promo��o (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsProdutos );
end;

procedure TfrmGePromocao.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbProduto ) then
    if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsProdutosCODIGO_PROD.AsString, 0) );

  if ( Sender = dbDesconto ) then
    if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
    begin
      if ( cdsProdutosPRECO_VENDA.IsNull ) then
        cdsProdutosPRECO_VENDA.AsCurrency := 0;

      if ( cdsProdutosDESCONTO.IsNull ) then
        cdsProdutosDESCONTO.AsCurrency := 0;

      cdsProdutosPRECO_PROMOCAO.Value := cdsProdutosPRECO_VENDA.AsCurrency - (cdsProdutosPRECO_VENDA.AsCurrency * cdsProdutosDESCONTO.AsCurrency / 100);
    end;

  if ( Sender = dbValorPromocao ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
      
end;

procedure TfrmGePromocao.CarregarDadosProduto(const ProdutoID: Integer);
begin
  if ( ProdutoID = 0 ) then
  begin
    ShowWarning('Favor informar o c�digo do produto');
    Exit;
  end;

  if ( not cdsProdutos.Active ) then
    Exit
  else
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('Codigo').AsInteger := ProdutoID;
      Open;

      if not IsEmpty then
      begin
        cdsProdutosCODIGO_PROD.AsString   := FieldByName('Cod').AsString;
        cdsProdutosDESCRI.AsString        := FieldByName('Descri').AsString;
        cdsProdutosPRECO_VENDA.AsCurrency := FieldByName('Preco').AsCurrency;
      end
      else
      begin
        ShowWarning('C�digo de produto n�o cadastrado');

        cdsProdutosCODIGO_PROD.Clear;

        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGePromocao.dbValorPromocaoButtonClick(Sender: TObject);
var
  sValor : String;
  cValor : Currency;
begin
  if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
  begin
    sValor := InputBox('VALOR PROMO��O (R$)', 'Favor informar o Valor Promocional:', FormatFloat(',0.00', dbValorPromocao.Field.AsCurrency));
    sValor := Trim(StringReplace(sValor, '.', '', [rfReplaceAll]));
    cValor := StrToCurrDef(sValor, 0);
    
    if ( cValor > 0 ) then
    begin
      cdsProdutosPRECO_PROMOCAO.Value := cValor;
      cdsProdutosDESCONTO.Value       := (1 - (cdsProdutosPRECO_PROMOCAO.Value / cdsProdutosPRECO_VENDA.Value)) * 100.0;
    end;
  end;
end;

procedure TfrmGePromocao.cdsProdutosCalcFields(DataSet: TDataSet);
begin
  cdsProdutosSequencial.Value := DataSet.RecNo;
end;

procedure TfrmGePromocao.cdsProdutosXXXCalcFields(DataSet: TDataSet);
begin
  cdsProdutosSequencial.Value := cdsProdutos.RecNo;
end;

procedure TfrmGePromocao.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    if ( cdsProdutos.State in [dsEdit, dsInsert] ) then
      cdsProdutos.Post;

    cdsProdutos.ApplyUpdates;
    cdsProdutos.CommitUpdates;

    CommitTransaction;
  end;
end;

procedure TfrmGePromocao.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('ATIVA').AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;
    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGePromocao', TfrmGePromocao);

end.
