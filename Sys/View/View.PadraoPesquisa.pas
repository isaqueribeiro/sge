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
  Interacao.Tabela,
  Controller.Tabela;

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
    BrnPesquisar: TcxButton;
    imgGrid: TImageList;
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BrnPesquisarClick(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTabela : ITabela;
    FCampoAtivo : String;
    procedure PosicionarBotaoPesquisa;
    procedure SetCampoAtivo(const Value: String);
  public
    { Public declarations }
    property Tabela : ITabela read FTabela;
    property CampoAtivo : String read FCampoAtivo write SetCampoAtivo;

    procedure RegistrarRotinaSistema; override;

    function ExecutarPesquisa : Boolean; virtual; abstract;
  end;

var
  ViewPadraoPesquisa: TViewPadraoPesquisa;

implementation

uses
    UConstantesDGE
  , UDMBusiness
  , UDMRecursos;

{$R *.dfm}

procedure TViewPadraoPesquisa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  aImage : Byte;
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

        TDBGrid(Sender).Canvas.FillRect(Rect);
        imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
      end
    end;
end;

procedure TViewPadraoPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  PosicionarBotaoPesquisa;

  FCampoAtivo := EmptyStr;

  if Assigned(dtsPesquisa.DataSet) then
    FTabela := TTabelaController.New.Tabela(dtsPesquisa.DataSet);
end;

procedure TViewPadraoPesquisa.PosicionarBotaoPesquisa;
begin
  BrnPesquisar.Left := edPesquisar.Left + edPesquisar.Width + 3;
  BrnPesquisar.Top  := edPesquisar.Top - 2;
  BrnPesquisar.Height := 24;
  BrnPesquisar.Width  := 24;
end;

procedure TViewPadraoPesquisa.BrnPesquisarClick(Sender: TObject);
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
  begin
    Key := #0;
    BrnPesquisar.Click;
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
