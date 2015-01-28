unit UGeRequisicaoAlmoxMonitor;

interface

uses
  UGrPadrao,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, ExtCtrls, ToolWin, ComCtrls,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Mask, rxToolEdit, cxGroupBox, DB, IBCustomDataSet, IBQuery, DBClient,
  Provider, IniFiles, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, cxImageComboBox, ImgList,

  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver;

type
  TfrmGeRequisicaoAlmoxMonitor = class(TfrmGrPadrao)
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    BtnImprimir: TcxButton;
    GrpBxFiltro: TcxGroupBox;
    qryCentroCusto: TIBQuery;
    dspCentroCusto: TDataSetProvider;
    cdsCentroCusto: TClientDataSet;
    dtsCentroCusto: TDataSource;
    lblCentroCusto: TLabel;
    edCentroCusto: TComboBox;
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    qryRequisicaoAlmox: TIBQuery;
    dspRequisicaoAlmox: TDataSetProvider;
    cdsRequisicaoAlmox: TClientDataSet;
    dtsRequisicaoAlmox: TDataSource;
    BtnPesquisar: TcxButton;
    ppImprimir: TPopupMenu;
    nmImprimirRequisicaoAlmox: TMenuItem;
    nmImprimirManifesto: TMenuItem;
    dbgReq: TcxGrid;
    dbgReqTbl: TcxGridDBBandedTableView;
    dbgReqLvl: TcxGridLevel;
    dbgReqTblColumn1: TcxGridDBBandedColumn;
    dbgReqTblColumn2: TcxGridDBBandedColumn;
    dbgReqTblColumn3: TcxGridDBBandedColumn;
    dbgReqTblColumn4: TcxGridDBBandedColumn;
    ImgStatus: TcxImageList;
    nmRequisicaoReceber: TMenuItem;
    N1: TMenuItem;
    nmRequisicaoAtender: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fPreferenciaINI : TIniFile;
    ICentroCusto : Array of Integer;
    procedure CarregarCentroCusto;

    function GetCentroCusto : Integer;
    function GetSituacao : Smallint;
  public
    { Public declarations }
    property CentroCusto : Integer read GetCentroCusto;
    property Situacao : Smallint read GetSituacao;

    procedure RegistrarRotinaSistema; override;
  end;

  procedure MonitorarRequisicaoAlmox(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe;

{$R *.dfm}

procedure MonitorarRequisicaoAlmox(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);
var
  AForm : TfrmGeRequisicaoAlmoxMonitor;
begin
  AForm := TfrmGeRequisicaoAlmoxMonitor.Create(AOwner);

  with AForm do
  begin
    CarregarCentroCusto;
    
    if Assigned(PanelDock) then
    begin
      PanelDock.Width := Width;
      Dock(PanelDock, Rect(0, 0, PanelDock.Width, PanelDock.Height));

      Show;
      PanelDock.Width := PanelDock.Width - 1;
    end
    else
      ShowModal;
  end;
end;

{ TfrmGeRequisicaoAlmoxMonitor }

procedure TfrmGeRequisicaoAlmoxMonitor.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  fPreferenciaINI.WriteInteger(GetUserApp, 'CentroCusto', edCentroCusto.ItemIndex);
  fPreferenciaINI.UpdateFile;
  
  if Assigned(Parent) then
    Parent.Width := 1;

  Action := caFree;  
end;

procedure TfrmGeRequisicaoAlmoxMonitor.CarregarCentroCusto;
var
  S ,
  I : Integer;
begin
  with cdsCentroCusto, Params, fPreferenciaINI do
  begin
    Close;
    ParamByName('empresa').AsString := GetEmpresaIDDefault;
    Open;

    edCentroCusto.Clear;
    SetLength(ICentroCusto, RecordCount);

    S := 0;
    I := 0;

    while not Eof do
    begin
      edCentroCusto.Items.Add( FieldByName('descricao').AsString );
      ICentroCusto[I] := FieldByName('codigo').AsInteger;

      if (ReadInteger(GetUserApp, 'CentroCusto', 0) = FieldByName('codigo').AsInteger) then
        S := FieldByName('codigo').AsInteger;

      Inc(I);
      Next;
    end;

    Close;

    edCentroCusto.ItemIndex := S;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.FormCreate(Sender: TObject);
begin
  inherited;
  fPreferenciaINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Preferencia.MonitorReqAlmox.ini');

  e1Data.Date := GetDateDB;
  e2Data.Date := GetDateDB;
end;

function TfrmGeRequisicaoAlmoxMonitor.GetSituacao: Smallint;
begin
  if ( edSituacao.ItemIndex = 0 ) then
    Result := -1
  else
    Result := (edSituacao.ItemIndex + 1);
end;

function TfrmGeRequisicaoAlmoxMonitor.GetCentroCusto: Integer;
begin
  Result := ICentroCusto[edCentroCusto.ItemIndex];
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoAlmoxMonitor', TfrmGeRequisicaoAlmoxMonitor);

end.
