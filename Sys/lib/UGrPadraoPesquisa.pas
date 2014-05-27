unit UGrPadraoPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, Buttons, StdCtrls, DB, IBCustomDataSet,
  IBQuery, Grids, DBGrids;

type
  TfrmGrPadraoPesquisa = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxTipoPesquisa: TGroupBox;
    BvlTipoPesquisa: TBevel;
    GrpBxPesquisar: TGroupBox;
    BrnPesquisar: TSpeedButton;
    edTipoPesquisa: TComboBox;
    lblTipoPesquisa: TLabel;
    lblPesquisar: TLabel;
    edPesquisar: TEdit;
    QryPesquisa: TIBQuery;
    DtsPesquisa: TDataSource;
    PnlTabela: TPanel;
    dbgDados: TDBGrid;
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
  public
    { Public declarations }
    property SQLSelect : TStringList read sSQL;

    procedure RegistrarRotinaSistema; override;

    function ExecutarPesquisa : Boolean; virtual; abstract;
  end;

var
  frmGrPadraoPesquisa: TfrmGrPadraoPesquisa;

implementation

uses
  UDMBusiness, UConstantesDGE;

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
  sSQL := TStringList.Create;
  sSQL.AddStrings( QryPesquisa.SQL );
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
  ;
end;

end.
