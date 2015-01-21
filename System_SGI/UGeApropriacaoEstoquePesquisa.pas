unit UGeApropriacaoEstoquePesquisa;

interface

uses
  UGrPadrao,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, RxSpeedBar, RXCtrls, ExtCtrls, jpeg,
  cxGraphics, dxGDIPlusClasses, cxLookAndFeelPainters,
  cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IBStoredProc,
  DBClient, Provider, IBCustomDataSet, IBQuery, DBCtrls, Gauges, ToolWin,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, Buttons, cxLookAndFeels, cxButtons,
  dxSkinsForm, Mask, rxToolEdit,

  dxSkinsCore, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver;

type        
  TfrmGeApropriacaoEstoquePesquisa = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxPesquisar: TGroupBox;
    BtnPesquisar: TSpeedButton;
    lblPesquisar: TLabel;
    lblTipoFiltro: TLabel;
    edPesquisar: TEdit;
    edTipoFiltro: TComboBox;
    edCentroCusto: TComboEdit;
    lblCentroCusto: TLabel;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    btBtnExportar: TcxButton;
    btBtnEnviarEmail: TcxButton;
    Bevel3: TBevel;
    svdArquivo: TSaveDialog;
    smtpEmail: TIdSMTP;
    msgEmail: TIdMessage;
    IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    QryGrupo: TIBQuery;
    QryFabricante: TIBQuery;
    QryProduto: TIBQuery;
    QryTotal: TIBQuery;
    DspTotal: TDataSetProvider;
    DspProduto: TDataSetProvider;
    DspFabricante: TDataSetProvider;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    CdsFabricante: TClientDataSet;
    CdsProduto: TClientDataSet;
    CdsTotal: TClientDataSet;
    dsTotal: TDataSource;
    dsProduto: TDataSource;
    dsFabricante: TDataSource;
    dsGrupo: TDataSource;
    PgcTabelas: TPageControl;
    TbsGrupo: TTabSheet;
    dbgGrupo: TcxGrid;
    dbgGrupoTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn31: TcxGridDBBandedColumn;
    cxGridDBBandedColumn32: TcxGridDBBandedColumn;
    cxGridDBBandedColumn33: TcxGridDBBandedColumn;
    cxGridDBBandedColumn34: TcxGridDBBandedColumn;
    cxGridDBBandedColumn35: TcxGridDBBandedColumn;
    cxGridDBBandedColumn36: TcxGridDBBandedColumn;
    cxGridDBBandedColumn56: TcxGridDBBandedColumn;
    cxGridDBBandedColumn57: TcxGridDBBandedColumn;
    cxGridDBBandedColumn58: TcxGridDBBandedColumn;
    dbgGrupoTblColumn1: TcxGridDBBandedColumn;
    dbgGrupoTblColumn2: TcxGridDBBandedColumn;
    dbgGrupoTblColumn3: TcxGridDBBandedColumn;
    dbgGrupoTblColumn4: TcxGridDBBandedColumn;
    dbgGrupoTblColumn5: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    TbsFabricante: TTabSheet;
    dbgFab: TcxGrid;
    dbgFabTbl: TcxGridDBBandedTableView;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn6: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridDBBandedColumn12: TcxGridDBBandedColumn;
    cxGridDBBandedColumn13: TcxGridDBBandedColumn;
    cxGridDBBandedColumn14: TcxGridDBBandedColumn;
    cxGridDBBandedColumn15: TcxGridDBBandedColumn;
    cxGridDBBandedColumn16: TcxGridDBBandedColumn;
    cxGridDBBandedColumn17: TcxGridDBBandedColumn;
    cxGridDBBandedColumn18: TcxGridDBBandedColumn;
    dbgFabLvl: TcxGridLevel;
    TbsProduto: TTabSheet;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    dbgProdutoTblColumn1: TcxGridDBBandedColumn;
    dbgProdutoTblColumn2: TcxGridDBBandedColumn;
    dbgProdutoTblColumn3: TcxGridDBBandedColumn;
    dbgProdutoTblColumn4: TcxGridDBBandedColumn;
    dbgProdutoTblColumn5: TcxGridDBBandedColumn;
    dbgProdutoTblColumn6: TcxGridDBBandedColumn;
    dbgProdutoTblColumn7: TcxGridDBBandedColumn;
    dbgProdutoTblColumn8: TcxGridDBBandedColumn;
    dbgProdutoTblColumn29: TcxGridDBBandedColumn;
    dbgProdutoTblColumn30: TcxGridDBBandedColumn;
    dbgProdutoTblColumn31: TcxGridDBBandedColumn;
    dbgProdutoTblColumn32: TcxGridDBBandedColumn;
    dbgProdutoTblColumn9: TcxGridDBBandedColumn;
    dbgProdutoLvl: TcxGridLevel;
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCentroCustoButtonClick(Sender: TObject);
    procedure edCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure edTipoFiltroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FSQLTotal   ,
    FSQLGrupo   ,
    FSQLFabricante,
    FSQLProduto : TStringList;
    procedure HabilitarGuia(const TipoFiltro : Integer);
    procedure ExecutarPesquisa(const TipoFiltro : Integer); virtual; abstract;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeApropriacaoEstoquePesquisa: TfrmGeApropriacaoEstoquePesquisa;

implementation

uses
  UDMBusiness, UConstantesDGE, cxGridExportLink, UGeCentroCusto;

{$R *.dfm}

const
  TIPO_GRP = 0;
  TIPO_FAB = 1;
  TIPO_PRD = 2;

  WHR_DEFAULT = '1=1';

{ TfrmGeApropriacaoEstoquePesquisa }

procedure TfrmGeApropriacaoEstoquePesquisa.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.NovaPesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' '] ) then
  begin
    edPesquisar.Text := Trim(Key);
    edPesquisar.SetFocus;
    edPesquisar.SelStart := Length(edPesquisar.Text) + 1;

    Key := #0;
  end
end;

procedure TfrmGeApropriacaoEstoquePesquisa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  procedure LimparCentroCusto;
  begin
    edCentroCusto.Tag  := 0;
    edCentroCusto.Text := '(Todos)';
  end;

begin
  if ( (Key = VK_RETURN) and (ActiveControl = edPesquisar) ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_F5 ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_ESCAPE ) then
  begin
    if ( PgcTabelas.ActivePageIndex <> edTipoFiltro.ItemIndex ) then
      HabilitarGuia( edTipoFiltro.ItemIndex );
  end
  else
  if ( Key = VK_DELETE ) then
  begin
    if edCentroCusto.Focused then
      LimparCentroCusto;
  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    if edCentroCusto.Focused then
      LimparCentroCusto;
  end;

  inherited;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.edCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( SelecionarDepartamento(Self, 0, GetEmpresaIDDefault, iCodigo, sNome, iCliente) ) then
  begin
    edCentroCusto.Tag  := iCodigo;
    edCentroCusto.Text := sNome;
  end;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.edCentroCustoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    edPesquisar.SetFocus
  else
    Key := #0;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.HabilitarGuia(
  const TipoFiltro: Integer);
var
  I : Integer;
begin
  for I := 0 to PgcTabelas.PageCount - 1 do
    PgcTabelas.Pages[I].TabVisible := False;

  if ( TipoFiltro < PgcTabelas.PageCount ) then
  begin
    PgcTabelas.Pages[TipoFiltro].TabVisible := True;
    PgcTabelas.Pages[TipoFiltro].Caption    := edTipoFiltro.Items.Strings[TipoFiltro];
  end;
end;

procedure TfrmGeApropriacaoEstoquePesquisa.BtnPesquisarClick(
  Sender: TObject);
begin
  ExecutarPesquisa(edTipoFiltro.ItemIndex);
end;

procedure TfrmGeApropriacaoEstoquePesquisa.edTipoFiltroChange(
  Sender: TObject);
begin
  HabilitarGuia(edTipoFiltro.ItemIndex);
end;

procedure TfrmGeApropriacaoEstoquePesquisa.FormCreate(Sender: TObject);
begin
  inherited;

  FSQLTotal := TStringList.Create;
  FSQLTotal.AddStrings( QryTotal.SQL );

  FSQLGrupo := TStringList.Create;
  FSQLGrupo.AddStrings( QryGrupo.SQL );

  FSQLFabricante := TStringList.Create;
  FSQLFabricante.AddStrings( QryFabricante.SQL );

  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( QryProduto.SQL );

  edTipoFiltro.ItemIndex := TIPO_PRD;
  HabilitarGuia(edTipoFiltro.ItemIndex);
end;

initialization
  FormFunction.RegisterForm('frmGeApropriacaoEstoquePesquisa', TfrmGeApropriacaoEstoquePesquisa);

end.
