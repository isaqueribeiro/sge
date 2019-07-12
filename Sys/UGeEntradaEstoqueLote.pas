unit UGeEntradaEstoqueLote;

interface

uses
  UGrPadrao,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, JvExMask, JvToolEdit, Vcl.DBGrids, Vcl.ExtCtrls,
  JvDBControls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxControls, cxContainer, cxButtons, Vcl.Grids,

  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeEntradaEstoqueLote = class(TfrmGrPadrao)
    fdQryCompraItens: TFDQuery;
    fdUpdCompraItens: TFDUpdateSQL;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblSequencial: TLabel;
    lblProduto: TLabel;
    dbCodigo: TDBEdit;
    dbSequencial: TDBEdit;
    dbProduto: TDBEdit;
    dtsCompraItens: TDataSource;
    fdQryCompraItensANO: TSmallintField;
    fdQryCompraItensCODCONTROL: TIntegerField;
    fdQryCompraItensCODEMP: TStringField;
    fdQryCompraItensSEQ: TSmallintField;
    fdQryCompraItensCODPROD: TStringField;
    fdQryCompraItensDESCRI: TStringField;
    fdQryCompraItensAPRESENTACAO: TStringField;
    fdQryCompraItensDESCRI_APRESENTACAO: TStringField;
    fdQryCompraItensLOTE_ID: TStringField;
    fdQryCompraItensLOTE_DESCRICAO: TStringField;
    fdQryCompraItensLOTE_DATA_FAB: TDateField;
    fdQryCompraItensLOTE_DATA_VAL: TDateField;
    lblDataFabricacao: TLabel;
    dbDataFabricacao: TJvDBDateEdit;
    lblDataValidade: TLabel;
    dbDataValidade: TJvDBDateEdit;
    Bevel2: TBevel;
    Bevel1: TBevel;
    dbgTitulos: TDBGrid;
    btnConfirmar: TcxButton;
    btnFechar: TcxButton;
    fdQryLotes: TFDQuery;
    dtsLotes: TDataSource;
    dbDescricao: TDBComboBox;
    fdQryCompraItensQTDE: TBCDField;
    fdQryCompraItensFRACIONADOR: TBCDField;
    fdSetLoteProduto: TFDStoredProc;
    lblQTDE: TLabel;
    dbQTDE: TDBEdit;
    pnlDicaFormaPagto: TPanel;
    lblDicaFormaPagto: TLabel;
    procedure ControlEditEnter(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure fdQryCompraItensAfterScroll(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure fdQryCompraItensBeforePost(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure CarregarLotes(const aEmpresa, aProduto : String);
    procedure UpdateLotes;

    function CarregarProdutos(aAno, aEntrada : Integer) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCOMPRASITENS
  - TBPRODUTO
  - TBESTOQUE_ALMOX

  Views:

  Procedures:
  - SET_LOTE_PRODUTO
*)

  function LotesProdutosConfirmados(const AOwner : TComponent; Ano, Controle : Integer) : Boolean;

implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness;

function LotesProdutosConfirmados(const AOwner : TComponent; Ano, Controle : Integer) : Boolean;
var
  aRetorno : Boolean;
  AForm : TfrmGeEntradaEstoqueLote;
begin
  AForm := TfrmGeEntradaEstoqueLote.Create(AOwner);
  try
    aRetorno := AForm.CarregarProdutos(Ano, Controle);
    if aRetorno then
      aRetorno := (AForm.ShowModal = mrOk)
    else
      aRetorno := True;
  finally
    AForm.Free;
    Result := aRetorno;
  end;
end;

{ TfrmGeEntradaEstoqueLote }

procedure TfrmGeEntradaEstoqueLote.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeEntradaEstoqueLote.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaEstoqueLote.btnConfirmarClick(Sender: TObject);
begin
  if ( ShowConfirm('Confirma os dados informados?') ) then
  begin
    UpdateLotes;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGeEntradaEstoqueLote.CarregarLotes(const aEmpresa,
  aProduto: String);
var
  aLote : TLoteProduto;
begin
  with fdQryLotes do
  begin
    if fdQryLotes.Active then
      fdQryLotes.Close;

    ParamByName('empresa').AsString       := aEmpresa;
    ParamByName('centro_custo').AsInteger := CENTRO_CUSTO_ESTOQUE_GERAL;
    ParamByName('produto').AsString       := aProduto;

    OpenOrExecute;
    First;

    dbDescricao.Clear;
    dbDescricao.Items.BeginUpdate;
    while not Eof do
    begin
      aLote := TLoteProduto.Create;

      aLote.ID         := FieldByName('id').AsString;
      aLote.Descricao  := FieldByName('descricao').AsString;
      aLote.Fabricacao := FieldByName('data_fabricacao').AsDateTime;
      aLote.Validade   := FieldByName('data_validade').AsDateTime;

      dbDescricao.Items.AddObject(aLote.Descricao, aLote);
      Next;
    end;
    dbDescricao.Items.EndUpdate;

    fdQryLotes.Close;
  end;
end;

function TfrmGeEntradaEstoqueLote.CarregarProdutos(aAno, aEntrada: Integer) : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    with fdQryCompraItens do
    begin
      Close;
      ParamByName('ano').AsInteger    := aAno;
      ParamByName('compra').AsInteger := aEntrada;
      Open;

      aRetorno := (fdQryCompraItens.RecordCount > 0);
    end;
  finally
    Result := aRetorno;
  end;
end;

procedure TfrmGeEntradaEstoqueLote.ControlEditEnter(Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDescricao) or (Sender = dbQTDE) or (Sender = dbDataFabricacao) or (Sender = dbDataValidade) ) then
    if ( not fdQryCompraItens.IsEmpty ) then
      if ( fdQryCompraItens.State <> dsEdit ) then
        fdQryCompraItens.Edit;
end;

procedure TfrmGeEntradaEstoqueLote.ControlEditExit(Sender: TObject);
var
  aLote : TLoteProduto;
begin
  inherited;
  if ( (Sender = dbDescricao) and (dbDescricao.ItemIndex >= 0) ) then
  begin

    if ( fdQryCompraItens.State = dsEdit ) then
    begin
      if (dbDescricao.ItemIndex >= 0) then
      begin
        aLote := TLoteProduto(dbDescricao.Items.Objects[dbDescricao.ItemIndex]);
        fdQryCompraItensLOTE_ID.AsString         := aLote.ID;
        fdQryCompraItensLOTE_DATA_FAB.AsDateTime := aLote.Fabricacao;
        fdQryCompraItensLOTE_DATA_VAL.AsDateTime := aLote.Validade;
      end
      else
      begin
        fdQryCompraItensLOTE_ID.Clear;
        fdQryCompraItensLOTE_DATA_FAB.Clear;
        fdQryCompraItensLOTE_DATA_VAL.Clear;
      end;
    end;

  end
  else
  if ( Sender = dbDataValidade ) then
  begin

    if ( fdQryCompraItens.State = dsEdit ) then
    begin
      if (Trim(fdQryCompraItensLOTE_DESCRICAO.AsString) = EmptyStr) then
      begin
        ShowWarning('Informe a Descrição do Lote');
        if dbDescricao.Visible and dbDescricao.Enabled then dbDescricao.SetFocus;
      end
      else
      if (dbDataFabricacao.Date = StrToDate(SYS_EMPTY_DATE)) then
      begin
        ShowWarning('Informe a Data de Fabricação do Lote');
        if dbDataFabricacao.Visible and dbDataFabricacao.Enabled then dbDataFabricacao.SetFocus;
      end
      else
      begin
        fdQryCompraItens.Post;

        fdQryCompraItens.Next;

        if ( not fdQryCompraItens.Eof ) then
          dbProduto.SetFocus
        else
          btnConfirmar.SetFocus;
      end;
    end;

  end;
end;

procedure TfrmGeEntradaEstoqueLote.dbgTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;
end;

procedure TfrmGeEntradaEstoqueLote.fdQryCompraItensAfterScroll(
  DataSet: TDataSet);
begin
  CarregarLotes(fdQryCompraItensCODEMP.AsString, fdQryCompraItensCODPROD.AsString);
end;

procedure TfrmGeEntradaEstoqueLote.fdQryCompraItensBeforePost(
  DataSet: TDataSet);
begin
  fdQryCompraItensLOTE_DESCRICAO.AsString := Trim(fdQryCompraItensLOTE_DESCRICAO.AsString);

  if (Trim(fdQryCompraItensLOTE_DESCRICAO.AsString) = EmptyStr) then
    fdQryCompraItensLOTE_DESCRICAO.Clear;

  if (fdQryCompraItensLOTE_DATA_FAB.AsDateTime = StrToDate(SYS_EMPTY_DATE)) then
    fdQryCompraItensLOTE_DATA_FAB.Clear;

  if (fdQryCompraItensLOTE_DATA_VAL.AsDateTime = StrToDate(SYS_EMPTY_DATE)) then
    fdQryCompraItensLOTE_DATA_VAL.Clear;

  if (fdQryCompraItensLOTE_DESCRICAO.IsNull and fdQryCompraItensLOTE_DATA_FAB.IsNull and fdQryCompraItensLOTE_DATA_VAL.IsNull) then
    fdQryCompraItensLOTE_ID.Clear;
end;

procedure TfrmGeEntradaEstoqueLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    if (fdQryCompraItens.State = dsEdit) then
      fdQryCompraItens.Cancel
    else
      btnFechar.Click;
  end
  else
    inherited;
end;

procedure TfrmGeEntradaEstoqueLote.UpdateLotes;
begin
  if (fdQryCompraItens.State = dsEdit) then
    fdQryCompraItens.Post;

  fdQryCompraItens.DisableControls;
  try
    fdQryCompraItens.First;
    while not fdQryCompraItens.Eof do
    begin
      if fdSetLoteProduto.Active then
        fdSetLoteProduto.Close;

      if (Trim(fdQryCompraItensLOTE_DESCRICAO.AsString) <> EmptyStr) then
      begin
        fdSetLoteProduto.ParamByName('empresa').AsString := fdQryCompraItensCODEMP.AsString;
        fdSetLoteProduto.ParamByName('produto').AsString := fdQryCompraItensCODPROD.AsString;
        fdSetLoteProduto.ParamByName('centro_custo').AsInteger  := CENTRO_CUSTO_ESTOQUE_GERAL;
        fdSetLoteProduto.ParamByName('lote_descricao').AsString := Trim(fdQryCompraItensLOTE_DESCRICAO.AsString);
        fdSetLoteProduto.ParamByName('lote_qtde').AsCurrency    := fdQryCompraItensQTDE.AsCurrency * fdQryCompraItensFRACIONADOR.AsCurrency;

        if not fdQryCompraItensLOTE_DATA_FAB.IsNull then
          fdSetLoteProduto.ParamByName('lote_fab').AsDateTime := fdQryCompraItensLOTE_DATA_FAB.AsDateTime
        else
          fdSetLoteProduto.ParamByName('lote_fab').Clear;

        if not fdQryCompraItensLOTE_DATA_VAL.IsNull then
          fdSetLoteProduto.ParamByName('lote_val').AsDateTime  := fdQryCompraItensLOTE_DATA_VAL.AsDateTime
        else
          fdSetLoteProduto.ParamByName('lote_val').Clear;

        if fdSetLoteProduto.OpenOrExecute then
        begin
          fdQryCompraItens.Edit;
          fdQryCompraItensLOTE_ID.AsString := fdSetLoteProduto.FieldByName('lote_id').AsString;
          fdQryCompraItens.Post;

          fdSetLoteProduto.Close;
        end;
      end;

      fdQryCompraItens.Next;
    end;

    fdQryCompraItens.ApplyUpdates();
    CommitTransaction;
  finally
    fdQryCompraItens.EnableControls;
  end;
end;

end.
