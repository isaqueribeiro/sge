unit View.PadraoPesquisa;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.Menus,
  Vcl.DBGrids,
  Vcl.ImgList,

  Data.DB,

  cxButtons,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,

  dxSkinsCore,
  dxSkinsDefaultPainters,

  UGrPadrao,
  Model.Constantes,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Interfaces;

type
  TViewPadraoPesquisa = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxTipoPesquisa: TGroupBox;
    BvlTipoPesquisa: TBevel;
    GrpBxPesquisar: TGroupBox;
    edTipoPesquisa: TComboBox;
    lblTipoPesquisa: TLabel;
    lblPesquisar: TLabel;
    edPesquisar: TEdit;
    dtsPesquisa: TDataSource;
    PnlTabela: TPanel;
    dbgDados: TDBGrid;
    BtnPesquisar: TcxButton;
    imgGrid: TImageList;
    pnlBotoes: TPanel;
    btnSelecionar: TcxButton;
    btnFechar: TcxButton;
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtsPesquisaStateChange(Sender: TObject);
  private
    { Private declarations }
    FTabela : ITabela;
    FCampoAtivo : String;
    procedure PosicionarBotaoPesquisa;
    procedure SetCampoAtivo(const Value: String);
  protected
    FController : IControllerQuery;
  public
    { Public declarations }
    property Tabela : ITabela read FTabela;
    property CampoAtivo : String read FCampoAtivo write SetCampoAtivo;

    procedure RegistrarRotinaSistema; override;

    function Controller : IControllerQuery;
    function ExecutarPesquisa : Boolean; virtual;
  end;

var
  ViewPadraoPesquisa: TViewPadraoPesquisa;

implementation

uses
    UConstantesDGE
  , UDMBusiness
  , UDMRecursos;

{$R *.dfm}

procedure TViewPadraoPesquisa.btnFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewPadraoPesquisa.btnSelecionarClick(Sender: TObject);
begin
  if Assigned(dtsPesquisa.DataSet) then
    if (not dtsPesquisa.DataSet.IsEmpty) then
      ModalResult := mrOk;
end;

function TViewPadraoPesquisa.Controller: IControllerQuery;
begin
  Result := FController;
end;

procedure TViewPadraoPesquisa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  aImage : Byte;
  aLeft  : Integer;
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color := clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color := clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  // Renderizar a imagem checked/unchecked no DBGrid
  if (LowerCase(Column.Field.FieldName) = FCampoAtivo.ToLower) and (not FCampoAtivo.IsEmpty) then
    if Assigned(dtsPesquisa.DataSet) then
    begin
      if Assigned(dtsPesquisa.DataSet.Fields.FindField(FCampoAtivo)) then
      begin
        aImage := StrToIntDef(Trim(Column.Field.AsString), 0);
        aLeft  := Round((Column.Width - 16) / 2);

        TDBGrid(Sender).Canvas.FillRect(Rect);
        imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + aLeft, Rect.Top + 1, aImage);
      end
    end;
end;

procedure TViewPadraoPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  PosicionarBotaoPesquisa;
  FCampoAtivo := EmptyStr;

  if Assigned(FController) and (not Assigned(dtsPesquisa.DataSet)) then
    FController.DataSource(dtsPesquisa);

  if Assigned(dtsPesquisa.DataSet) then
    FTabela := TTabelaController.New.Tabela(dtsPesquisa.DataSet);
end;

procedure TViewPadraoPesquisa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Case Key of
    VK_F2 : if (btnSelecionar.Visible and btnSelecionar.Enabled) then
              btnSelecionar.Click;

    VK_F5 : begin
              dtsPesquisa.DataSet.Close;
              dtsPesquisa.DataSet.Open;
            end;

    VK_ESCAPE : if btnFechar.Visible and btnFechar.Enabled then
                  btnFechar.Click;

    VK_UP : if dtsPesquisa.DataSet.Active then
              dtsPesquisa.DataSet.Prior;

    VK_DOWN : if dtsPesquisa.DataSet.Active then
                dtsPesquisa.DataSet.Next;
    else
    begin
      if (Key = VK_RETURN) and (ActiveControl = edPesquisar) then
        BtnPesquisar.Click
      else
      if not (ActiveControl is TDBGrid) then
        CustomKeyDown(Self, Key, Shift);
    end;
  end;
end;

procedure TViewPadraoPesquisa.PosicionarBotaoPesquisa;
begin
  BtnPesquisar.Left := edPesquisar.Left + edPesquisar.Width + 3;
  BtnPesquisar.Top  := edPesquisar.Top - 2;
  BtnPesquisar.Height := 24;
  BtnPesquisar.Width  := 24;
end;

procedure TViewPadraoPesquisa.BtnPesquisarClick(Sender: TObject);
begin
  if ExecutarPesquisa then
  begin
    if dbgDados.Visible and dbgDados.Enabled then
      dbgDados.SetFocus
  end
  else
  begin
    if edPesquisar.Visible and edPesquisar.Enabled then
      edPesquisar.SetFocus;
  end;
end;

procedure TViewPadraoPesquisa.edPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
    Key := #0;
end;

function TViewPadraoPesquisa.ExecutarPesquisa: Boolean;
begin
  Result := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      if Assigned(FController) then
      begin
        Result := not
          FController
            .Execute(TTipoPesquisa(edTipoPesquisa.ItemIndex), edPesquisar.Text)
            .DataSet
              .IsEmpty;

        FTabela.Configurar;
      end;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewPadraoPesquisa.dbgDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' ']) then
    if edPesquisar.Visible and edPesquisar.Enabled then
    begin
      edPesquisar.Text := Trim(Key);
      edPesquisar.SetFocus;
      edPesquisar.SelStart := Length(edPesquisar.Text);
    end;
end;

procedure TViewPadraoPesquisa.dtsPesquisaStateChange(Sender: TObject);
begin
  btnSelecionar.Enabled := (not dtsPesquisa.DataSet.IsEmpty);
end;

procedure TViewPadraoPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TViewPadraoPesquisa.RegistrarRotinaSistema;
begin
  if (not RotinaID.Trim.IsEmpty) then
    SetRotinaSistema(ROTINA_TIPO_TELA, RotinaID, Trim(Self.Caption), RotinaPaiID);
end;

procedure TViewPadraoPesquisa.SetCampoAtivo(const Value: String);
begin
  FCampoAtivo := Value.Trim;
end;

end.
