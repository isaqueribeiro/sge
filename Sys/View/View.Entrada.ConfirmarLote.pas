unit View.Entrada.ConfirmarLote;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UGrPadrao,
  SGE.Controller.Interfaces;

type
  TViewEntradaEstoqueLote = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblSequencial: TLabel;
    lblProduto: TLabel;
    dbCodigo: TDBEdit;
    dbSequencial: TDBEdit;
    dbProduto: TDBEdit;
    dtsCompraItens: TDataSource;
    lblDataFabricacao: TLabel;
    dbDataFabricacao: TJvDBDateEdit;
    lblDataValidade: TLabel;
    dbDataValidade: TJvDBDateEdit;
    Bevel2: TBevel;
    Bevel1: TBevel;
    dbgTitulos: TDBGrid;
    btnConfirmar: TcxButton;
    btnFechar: TcxButton;
    dtsLotes: TDataSource;
    dbDescricao: TDBComboBox;
    lblQTDE: TLabel;
    dbQTDE: TDBEdit;
    pnlDicaFormaPagto: TPanel;
    lblDicaFormaPagto: TLabel;
    procedure ControlEditEnter(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure fdQryCompraItensAfterScroll(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FControllerEntradaProdutos,
    FControllerLotesProduto   : IControllerCustom;
    procedure CarregarLotes(const aEmpresa, aProduto : String);

    function Controller : IControllerEntradaProduto;
    function CarregarProdutos(aAno, aEntrada : Integer; aEmpresa : String) : Boolean;
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

  function LotesProdutosConfirmados(const AOwner : TComponent; Ano, Controle : Integer; const Empresa : String) : Boolean;

implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , Controller.Tabela
  , SGE.Controller.Factory
  , Service.Message;

function LotesProdutosConfirmados(const AOwner : TComponent; Ano, Controle : Integer; const Empresa : String) : Boolean;
var
  aRetorno : Boolean;
  AForm : TViewEntradaEstoqueLote;
begin
  AForm := TViewEntradaEstoqueLote.Create(AOwner);
  try
    aRetorno := AForm.CarregarProdutos(Ano, Controle, Empresa);
    if aRetorno then
      aRetorno := (AForm.ShowModal = mrOk)
    else
      aRetorno := True;
  finally
    AForm.Free;
    Result := aRetorno;
  end;
end;

{ TViewEntradaEstoqueLote }

procedure TViewEntradaEstoqueLote.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewEntradaEstoqueLote.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEntradaEstoqueLote.btnConfirmarClick(Sender: TObject);
begin
  if ( TServiceMessage.ShowConfirm('Confirma os dados informados?') ) then
  begin
    Controller.GravarLoteProduto(gSistema.Codigo);
    ModalResult := mrOk;
  end;
end;

procedure TViewEntradaEstoqueLote.CarregarLotes(const aEmpresa,
  aProduto: String);
var
  aLote : TLoteProduto;
begin
  FControllerLotesProduto
    .DAO
      .Close
      .ParamsByName('empresa', aEmpresa)
      .ParamsByName('centro_custo', CENTRO_CUSTO_ESTOQUE_GERAL)
      .ParamsByName('produto', aProduto)
      .Open;

  FControllerLotesProduto.DAO.DataSet.First;

  try
    dbDescricao.Items.BeginUpdate;
    dbDescricao.Clear;

    while not Eof do
    begin
      aLote := TLoteProduto.Create;

      aLote.ID         := FControllerLotesProduto.DAO.DataSet.FieldByName('id').AsString;
      aLote.Descricao  := FControllerLotesProduto.DAO.DataSet.FieldByName('descricao').AsString;
      aLote.Fabricacao := FControllerLotesProduto.DAO.DataSet.FieldByName('data_fabricacao').AsDateTime;
      aLote.Validade   := FControllerLotesProduto.DAO.DataSet.FieldByName('data_validade').AsDateTime;

      dbDescricao.Items.AddObject(aLote.Descricao, aLote);
      FControllerLotesProduto.DAO.DataSet.Next;
    end;
  finally
    FControllerLotesProduto.DAO.Close;
    dbDescricao.Items.EndUpdate;
  end;
end;

function TViewEntradaEstoqueLote.CarregarProdutos(aAno, aEntrada: Integer; aEmpresa : String) : Boolean;
begin
  FControllerEntradaProdutos
    .DAO
    .Close
    .ClearWhere;

  FControllerEntradaProdutos
    .DAO
    .Where('i.Ano        = :ano')
    .Where('i.Codcontrol = :controle')
    .Where('i.Codemp     = :empresa')
    .Where('p.estoque_aprop_lote = 1') // Estoque do produto gerenciado por lote
    .Where('p.movimenta_estoque = 1')  // Produto movimenta o estoque (Gerar entrada/saída)
    .ParamsByName('ano',      aAno)
    .ParamsByName('controle', aEntrada)
    .ParamsByName('empresa',  aEmpresa)
    .Open;

  Result := not FControllerEntradaProdutos.DAO.DataSet.IsEmpty;

  if Result then
    TTabelaController
      .New
      .Tabela( dtsCompraItens.DataSet )
      .Display('CODCONTROL', 'Entrada', '###0000000', TAlignment.taCenter, True)
      .Display('SEQ', '#', '00', TAlignment.taCenter, True)
      .Display('QTDE', 'Quantidade', ',0', TAlignment.taRightJustify, True)
      .Display('LOTE_DESCRICAO', 'Lote', TAlignment.taLeftJustify, False)
      .Display('LOTE_DATA_FAB',  'Fabricação', 'dd/mm/yyyy', TAlignment.taLeftJustify, False)
      .Display('LOTE_DATA_AL',   'Validade', 'dd/mm/yyyy', TAlignment.taLeftJustify, False)
      .Configurar;
end;

procedure TViewEntradaEstoqueLote.ControlEditEnter(Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDescricao) or (Sender = dbQTDE) or (Sender = dbDataFabricacao) or (Sender = dbDataValidade) ) then
    if ( not dtsCompraItens.DataSet.IsEmpty ) then
      if ( dtsCompraItens.DataSet.State <> dsEdit ) then
        dtsCompraItens.DataSet.Edit;
end;

procedure TViewEntradaEstoqueLote.ControlEditExit(Sender: TObject);
var
  aLote : TLoteProduto;
begin
  inherited;
  if ( (Sender = dbDescricao) and (dbDescricao.ItemIndex >= 0) ) then
  begin

    if ( dtsCompraItens.DataSet.State = dsEdit ) then
    begin
      if (dbDescricao.ItemIndex >= 0) then
      begin
        aLote := TLoteProduto(dbDescricao.Items.Objects[dbDescricao.ItemIndex]);
        dtsCompraItens.DataSet.FieldByName('LOTE_ID').AsString         := aLote.ID;
        dtsCompraItens.DataSet.FieldByName('LOTE_DATA_FAB').AsDateTime := aLote.Fabricacao;
        dtsCompraItens.DataSet.FieldByName('LOTE_DATA_VAL').AsDateTime := aLote.Validade;
      end
      else
      begin
        dtsCompraItens.DataSet.FieldByName('LOTE_ID').Clear;
        dtsCompraItens.DataSet.FieldByName('LOTE_DATA_FAB').Clear;
        dtsCompraItens.DataSet.FieldByName('LOTE_DATA_VAL').Clear;
      end;
    end;

  end
  else
  if ( Sender = dbDataValidade ) then
  begin

    if ( dtsCompraItens.DataSet.State = dsEdit ) then
    begin
      if (Trim(dtsCompraItens.DataSet.FieldByName('LOTE_DESCRICAO').AsString) = EmptyStr) then
      begin
        TServiceMessage.ShowWarning('Informe a Descrição do Lote');
        if dbDescricao.Visible and dbDescricao.Enabled then
          dbDescricao.SetFocus;
      end
      else
      if (dbDataFabricacao.Date = StrToDate(SYS_EMPTY_DATE)) then
      begin
        TServiceMessage.ShowWarning('Informe a Data de Fabricação do Lote');
        if dbDataFabricacao.Visible and dbDataFabricacao.Enabled then
          dbDataFabricacao.SetFocus;
      end
      else
      begin
        dtsCompraItens.DataSet.Post;

        dtsCompraItens.DataSet.Next;

        if ( not dtsCompraItens.DataSet.Eof ) then
          dbProduto.SetFocus
        else
          btnConfirmar.SetFocus;
      end;
    end;

  end;
end;

function TViewEntradaEstoqueLote.Controller: IControllerEntradaProduto;
begin
  Result := FControllerEntradaProdutos as IControllerEntradaProduto;
end;

procedure TViewEntradaEstoqueLote.dbgTitulosDrawColumnCell(Sender: TObject;
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

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TViewEntradaEstoqueLote.fdQryCompraItensAfterScroll(
  DataSet: TDataSet);
begin
  CarregarLotes(
    dtsCompraItens.DataSet.FieldByName('CODEMP').AsString,
    dtsCompraItens.DataSet.FieldByName('CODPROD').AsString);
end;

procedure TViewEntradaEstoqueLote.FormCreate(Sender: TObject);
begin
  FControllerEntradaProdutos := TControllerFactory.New.EntradaProduto;
  FControllerLotesProduto    := TControllerFactory.New.LoteProduto;

  dtsCompraItens.DataSet := FControllerEntradaProdutos.DAO.DataSet;
  dtsLotes.DataSet       := FControllerLotesProduto.DAO.DataSet;
  inherited;
end;

procedure TViewEntradaEstoqueLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
  begin
    if (dtsCompraItens.DataSet.State = dsEdit) then
      dtsCompraItens.DataSet.Cancel
    else
      btnFechar.Click;
  end
  else
    inherited;
end;

end.
