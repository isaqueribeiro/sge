unit UGrPadraoPesquisa;

interface

uses
  Interacao.Tabela,
  Controller.Tabela,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, Buttons, StdCtrls, DB, IBCustomDataSet, cxButtons,
  IBQuery, Grids, DBGrids, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinsDefaultPainters, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White;

type
  TfrmGrPadraoPesquisa = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxTipoPesquisa: TGroupBox;
    BvlTipoPesquisa: TBevel;
    GrpBxPesquisar: TGroupBox;
    edTipoPesquisa: TComboBox;
    lblTipoPesquisa: TLabel;
    lblPesquisar: TLabel;
    edPesquisar: TEdit;
    DtsPesquisa: TDataSource;
    PnlTabela: TPanel;
    dbgDados: TDBGrid;
    BrnPesquisar: TcxButton;
    fdQryPesquisa: TFDQuery;
    QryPesquisaXXX: TIBQuery;
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure BrnPesquisarClick(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sSQL : TStringList;
    FTabela : ITabela;
  public
    { Public declarations }
    property SQLSelect : TStringList read sSQL;
    property Tabela : ITabela read FTabela;

    procedure RegistrarRotinaSistema; override;

    function ExecutarPesquisa : Boolean; virtual; abstract;
  end;

var
  frmGrPadraoPesquisa: TfrmGrPadraoPesquisa;

implementation

uses
    UConstantesDGE
  , UDMBusiness
  , UDMRecursos;

{$R *.dfm}

procedure TfrmGrPadraoPesquisa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TfrmGrPadraoPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  if (fdQryPesquisa.Connection = nil) then
  begin
    fdQryPesquisa.Connection  := DMBusiness.fdConexao;
    fdQryPesquisa.Transaction := DMBusiness.fdTransacao;
  end;

  sSQL := TStringList.Create;
  sSQL.AddStrings( fdQryPesquisa.SQL );

  FTabela := TTabelaController.New.Tabela(fdQryPesquisa as TFDDataSet);
end;

procedure TfrmGrPadraoPesquisa.BrnPesquisarClick(Sender: TObject);
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

procedure TfrmGrPadraoPesquisa.edPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    BrnPesquisar.Click;
  end;
end;

procedure TfrmGrPadraoPesquisa.dbgDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' '] ) then
    if edPesquisar.Visible and edPesquisar.Enabled then
    begin
      edPesquisar.Text := Trim(Key);
      edPesquisar.SetFocus;
      edPesquisar.SelStart := Length(edPesquisar.Text);
    end;
end;

procedure TfrmGrPadraoPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGrPadraoPesquisa.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
    SetRotinaSistema(ROTINA_TIPO_TELA, RotinaID, Trim(Self.Caption), RotinaPaiID);
end;

end.
