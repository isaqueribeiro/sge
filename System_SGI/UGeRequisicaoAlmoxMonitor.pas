unit UGeRequisicaoAlmoxMonitor;

interface

uses
  UGrPadrao,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, ExtCtrls, ToolWin, ComCtrls,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  Mask, cxGroupBox, DB, IBCustomDataSet, IBQuery, DBClient,
  Provider, IniFiles, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGrid, cxImageComboBox, ImgList,
  JvExMask, JvToolEdit,

  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxNavigator;

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
    dbgReqTblNUMERO: TcxGridDBBandedColumn;
    dbgReqTblDATA_EMISSAO: TcxGridDBBandedColumn;
    dbgReqTblCC_ORIGEM_DESC: TcxGridDBBandedColumn;
    dbgReqTblSTATUS: TcxGridDBBandedColumn;
    ImgStatus: TcxImageList;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    ppOpcoes: TPopupMenu;
    nmRequisicaoReceber: TMenuItem;
    nmRequisicaoAtender: TMenuItem;
    BtnOpcoes: TcxButton;
    N1: TMenuItem;
    nmRequisicaoCancelar: TMenuItem;
    PnlTitulo: TPanel;
    ImgLogo: TImage;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    qryEmpresa: TIBQuery;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dtsEmpresa: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure nmImprimirRequisicaoAlmoxClick(Sender: TObject);
    procedure nmRequisicaoReceberClick(Sender: TObject);
    procedure dbgReqTblDblClick(Sender: TObject);
    procedure nmRequisicaoAtenderClick(Sender: TObject);
    procedure nmRequisicaoCancelarClick(Sender: TObject);
    procedure nmImprimirManifestoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
  private
    { Private declarations }
    fPreferenciaINI : TIniFile;
    SEmpresa     : Array of String;
    ICentroCusto : Array of Integer;
    procedure CarregarEmpresa;
    procedure CarregarCentroCusto(const aEmpresa : String);

    function GetEmpresa     : String;
    function GetCentroCusto : Integer;
    function GetSituacao : Smallint;
    function CarregarRequisicaoAlmox : Boolean;

    function GetRotinaReceberID : String;
    function GetRotinaAtenderID : String;
    function GetRotinaCancelarID : String;
  public
    { Public declarations }
    property Empresa     : String read GetEmpresa;
    property CentroCusto : Integer read GetCentroCusto;
    property Situacao : Smallint read GetSituacao;
    property RotinaReceberID : String read GetRotinaReceberID;
    property RotinaAtenderID : String read GetRotinaAtenderID;
    property RotinaCancelarID : String read GetRotinaCancelarID;

    procedure RegistrarRotinaSistema; override;
  end;

  procedure MonitorarRequisicaoAlmoxAuto(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);
  procedure MonitorarRequisicaoAlmox(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe,
  UGeRequisicaoAlmox, UGeRequisicaoAlmoxCancelar;

{$R *.dfm}

procedure MonitorarRequisicaoAlmoxAuto(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);
var
  PreferenciaINI : TIniFile;
begin
  PreferenciaINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Preferencia.MonitorReqAlmox.ini');
  try
    if PreferenciaINI.ReadBool(gUsuarioLogado.Login, 'Monitorar', False) then
      MonitorarRequisicaoAlmox(AOwner, PanelDock, AutoLoad);
  finally
    PreferenciaINI.Free;
  end;
end;

procedure MonitorarRequisicaoAlmox(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);
var
  AForm : TfrmGeRequisicaoAlmoxMonitor;
begin
  if Assigned(PanelDock) then
    if PanelDock.Width > 1 then
      Exit;

  AForm := TfrmGeRequisicaoAlmoxMonitor.Create(AOwner);

  with AForm do
  begin
    CarregarEmpresa;
    CarregarCentroCusto(gUsuarioLogado.Empresa);

    e1Data.Date := GetMenorDataEmissaoReqAlmoxEnviada(gUsuarioLogado.Empresa, 0);
    e2Data.Date := GetDateDB;

    if Assigned(PanelDock) then
    begin
      PanelDock.Width := Width;
      Dock(PanelDock, Rect(0, 0, PanelDock.Width, PanelDock.Height));

      Show;
      PanelDock.Width := PanelDock.Width - 1;
    end
    else
      ShowModal;

    if AutoLoad then
      CarregarRequisicaoAlmox;
  end;
end;

{ TfrmGeRequisicaoAlmoxMonitor }

procedure TfrmGeRequisicaoAlmoxMonitor.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaReceberID,  nmRequisicaoReceber.Caption,  RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAtenderID,  nmRequisicaoAtender.Caption,  RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarID, nmRequisicaoCancelar.Caption, RotinaID);
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  fPreferenciaINI.WriteInteger(gUsuarioLogado.Login, 'CentroCusto', edCentroCusto.ItemIndex);
  fPreferenciaINI.WriteBool   (gUsuarioLogado.Login, 'Monitorar',   False);
  fPreferenciaINI.UpdateFile;

  if Assigned(Parent) then
    Parent.Width := 1;

  Action := caFree;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.CarregarCentroCusto(const aEmpresa : String);
var
  S ,
  I : Integer;
begin
  with cdsCentroCusto, Params, fPreferenciaINI do
  begin
    Close;
    ParamByName('empresa').AsString := aEmpresa;
    Open;

    edCentroCusto.Clear;
    SetLength(ICentroCusto, RecordCount);

    S := 0;
    I := 0;

    while not Eof do
    begin
      edCentroCusto.Items.Add( FieldByName('descricao').AsString );
      ICentroCusto[I] := FieldByName('codigo').AsInteger;

      if (ReadInteger(gUsuarioLogado.Login, 'CentroCusto', 0) = FieldByName('codigo').AsInteger) then
        S := I;

      Inc(I);
      Next;
    end;

    Close;

    edCentroCusto.ItemIndex := S;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.CarregarEmpresa;
var
  S ,
  I : Integer;
begin
  with cdsEmpresa do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(SEmpresa, RecordCount);

    S := 0;
    I := 0;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
      SEmpresa[I] := FieldByName('empresa').AsString;

      if (FieldByName('empresa').AsString = gUsuarioLogado.Empresa) then
        S := I;

      Inc(I);
      Next;
    end;

    Close;

    edEmpresa.ItemIndex := S;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID        := ROTINA_MOV_MONITOR_REQ_ALMOX_ID;
  fPreferenciaINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Preferencia.MonitorReqAlmox.ini');
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

function TfrmGeRequisicaoAlmoxMonitor.GetEmpresa: String;
begin
  Result := SEmpresa[edEmpresa.ItemIndex];
end;

function TfrmGeRequisicaoAlmoxMonitor.CarregarRequisicaoAlmox : Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := False;

  Screen.Cursor := crSQLWait;
  try
    with cdsRequisicaoAlmox, Params do
    begin
      Close;
      ParamByName('empresa').AsString        := Empresa;
      ParamByName('data_inicial').AsDateTime := StrToDateDef(e1Data.Text, GetDateDB);
      ParamByName('data_final').AsDateTime   := StrToDateDef(e2Data.Text, GetDateDB);
      ParamByName('centro_custo').AsInteger  := CentroCusto;
      ParamByName('status').AsInteger        := Situacao;
      ParamByName('todos').AsInteger         := IfThen(Situacao < STATUS_REQUISICAO_ALMOX_ENV, 1, 0);
      Open;
    end;

    bRetorno := not cdsRequisicaoAlmox.IsEmpty;
  finally
    Screen.Cursor := crDefault;
    Result := bRetorno;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.BtnPesquisarClick(Sender: TObject);
begin
  if CarregarRequisicaoAlmox then
    dbgReq.SetFocus
  else
  begin
    ShowWarning('Registros não encontrados de acordo com os parâmetros informados!');
    e1Data.SetFocus;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.nmImprimirRequisicaoAlmoxClick(
  Sender: TObject);
begin
  if ( cdsRequisicaoAlmox.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(cdsRequisicaoAlmox.FieldByName('empresa').AsString
        , GetEmailEmpresa(cdsRequisicaoAlmox.FieldByName('empresa').AsString)
        , 'Requisição de Materiais'
        , EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := cdsRequisicaoAlmox.FieldByName('empresa').AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := cdsRequisicaoAlmox.FieldByName('cc_origem_codcliente').AsInteger;
      Open;
    end;

    with qryRequisicaoAlmox do
    begin
      Close;
      ParamByName('ano').AsInteger := cdsRequisicaoAlmox.FieldByName('ano').AsInteger;
      ParamByName('cod').AsInteger := cdsRequisicaoAlmox.FieldByName('controle').AsInteger;
      ParamByName('todos_itens').AsInteger := 1;
      Open;
    end;

    frrRequisicaoAlmox.ShowReport;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.nmRequisicaoReceberClick(
  Sender: TObject);
var
  SQL : TStringList;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  with cdsRequisicaoAlmox do
  begin
    if ( IsEmpty ) then
      Exit;

    if (FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_REC) then
    begin
      ShowWarning('Requisição de materiais já marcada como recebida!');
      Abort;
    end;

    if (FieldByName('status').AsInteger <> STATUS_REQUISICAO_ALMOX_ENV) then
      ShowWarning('Apenas requisições de materiais enviadas podem ser marcadas como recebidas.')
    else
    if ShowConfirmation('Deseja sinalizar como recebida a requisição de materiais selecionada?') then
      try
        SQL := TStringList.Create;

        // Marcar requisição como Recebida
        SQL.BeginUpdate;
        SQL.Clear;
        SQL.Add('Update TBREQUISICAO_ALMOX r Set');
        SQL.Add('  r.status = ' + IntToStr(STATUS_REQUISICAO_ALMOX_REC));
        SQL.Add('where r.ano      = ' + FieldByName('ano').AsString);
        SQL.Add('  and r.controle = ' + FieldByName('controle').AsString);
        SQL.EndUpdate;

        ExecuteScriptSQL( SQL.Text );

        cdsRequisicaoAlmox.Refresh;

        ShowInformation(Format('Requisição de materiais "%s" marcada como recebida.', [FieldByName('numero').AsString]));
      finally
        SQL.Free;
      end;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.dbgReqTblDblClick(Sender: TObject);
begin
  with cdsRequisicaoAlmox do
  begin
    if ( IsEmpty ) then
      Exit;

    CarregarRequisicaoAlmoxMonitor(Self, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.edEmpresaChange(Sender: TObject);
begin
  if edEmpresa.Focused then
    CarregarCentroCusto(Empresa);
end;

procedure TfrmGeRequisicaoAlmoxMonitor.nmRequisicaoAtenderClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  with cdsRequisicaoAlmox do
  begin
    if ( IsEmpty ) then
      Exit;

    if (FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_ATD) then
    begin
      ShowWarning('Requisição de materiais já atendida!');
      Abort;
    end;

    if not (FieldByName('status').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC]) then
      ShowWarning('Apenas requisições de materiais marcadas como enviadas e/ou recebidas podem ser atendidas.')
    else
    if AtenderRequisicaoAlmoxMonitor(Self, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger) then
    begin
      cdsRequisicaoAlmox.Refresh;
      ShowInformation(Format('Requisição de materiais "%s" atendida.', [FieldByName('numero').AsString]) + #13 +
        'Favor imprimir manifesto de saída do material.');
      nmImprimirManifesto.Click;  
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.nmRequisicaoCancelarClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  with cdsRequisicaoAlmox do
  begin
    if ( IsEmpty ) then
      Exit;

    if (FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_CAN) then
    begin
      ShowWarning('Requisição de materiais já cancelada!');
      Abort;
    end;

    if not (FieldByName('status').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]) then
      ShowInformation('Apenas registros enviados, recebidos e/ou atendidos podem ser cancelados!')
    else
    if CancelarRequisicaoAlmox(Self, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger) then
    begin
      cdsRequisicaoAlmox.Refresh;
      ShowInformation(Format('Requisição de materiais "%s" cancelada.', [FieldByName('numero').AsString]));
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmoxMonitor.nmImprimirManifestoClick(
  Sender: TObject);
begin
  if ( cdsRequisicaoAlmox.IsEmpty ) then
    Exit;

  if (cdsRequisicaoAlmox.FieldByName('status').AsInteger <> STATUS_REQUISICAO_ALMOX_ATD) then
  begin
    ShowWarning('Apenas requisição de materiais já atendidas possuem impressão de Manifesto!');
    Abort;
  end;

  with DMNFe do
  begin

    try
      ConfigurarEmail(cdsRequisicaoAlmox.FieldByName('empresa').AsString
        , GetEmailEmpresa(cdsRequisicaoAlmox.FieldByName('empresa').AsString)
        , 'Requisição de Materiais'
        , EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := cdsRequisicaoAlmox.FieldByName('empresa').AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := cdsRequisicaoAlmox.FieldByName('cc_origem_codcliente').AsInteger;
      Open;
    end;

    with qryRequisicaoAlmox do
    begin
      Close;
      ParamByName('ano').AsInteger := cdsRequisicaoAlmox.FieldByName('ano').AsInteger;
      ParamByName('cod').AsInteger := cdsRequisicaoAlmox.FieldByName('controle').AsInteger;
      ParamByName('todos_itens').AsInteger := 0;
      Open;
    end;

    frrManifestoAlmox.ShowReport;
  end;
end;

function TfrmGeRequisicaoAlmoxMonitor.GetRotinaReceberID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoReceber);
end;

function TfrmGeRequisicaoAlmoxMonitor.GetRotinaAtenderID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoAtender);
end;

function TfrmGeRequisicaoAlmoxMonitor.GetRotinaCancelarID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoCancelar);
end;

procedure TfrmGeRequisicaoAlmoxMonitor.FormActivate(Sender: TObject);
begin
  inherited;
  fPreferenciaINI.WriteBool(gUsuarioLogado.Login, 'Monitorar', True);
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoAlmoxMonitor', TfrmGeRequisicaoAlmoxMonitor);

end.
