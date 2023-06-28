unit View.RequisicaoAlmox.Monitor;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  System.IniFiles,

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
  Vcl.ToolWin,

  Data.DB,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  cxClasses,
  cxImageList,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  cxControls,
  cxContainer,
  cxEdit,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  dxDateRanges,
  cxDBData,
  cxImageComboBox,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCustomView,
  cxGrid,
  cxGroupBox,
  dxSkinsDefaultPainters,
  dxSkinsCore,
  frxClass,

  UGrPadrao,
  UBaseObject,
  UObserverInterface,
  UConstantesDGE,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Impressao.AutorizacaoCompra,
  SGE.Controller.Impressao.RequisicaoAlmox,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Datasnap.Provider;

type
  TViewRequisicaoAlmoxMonitor = class(TfrmGrPadrao)
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    BtnImprimir: TcxButton;
    GrpBxFiltro: TcxGroupBox;
    dtsCentroCusto: TDataSource;
    lblCentroCusto: TLabel;
    edCentroCusto: TComboBox;
    lblData: TLabel;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
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
    nmRequisicaoDevolver: TMenuItem;
    qryRequisicaoAlmox: TFDQuery;
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
    procedure nmRequisicaoDevolverClick(Sender: TObject);
  private
    { Private declarations }
    FTabela : ITabela;
    FImpressao : IImpressaoRequisicaoAlmox;
    FController ,
    FControllerEmpresaView ,
    FControllerCentroCusto : IControllerCustom;

    FPreferenciaINI : TIniFile;

    procedure CarregarEmpresa;
    procedure CarregarCentroCusto(const aEmpresa : String);

    function EmpresaView : IControllerEmpresa;
    function CentroCustoLista : IControllerCentroCusto;
    function Controller : IControllerRequisicaoAlmoxarifado;

    function GetEmpresa     : String;
    function GetCentroCusto : Integer;
    function GetSituacao : Smallint;
    function CarregarRequisicaoAlmox : Boolean;

    function GetRotinaReceberID : String;
    function GetRotinaAtenderID : String;
    function GetRotinaCancelarID : String;
    function GetRotinaDevolverID : String;
  public
    { Public declarations }
    property Empresa     : String read GetEmpresa;
    property CentroCusto : Integer read GetCentroCusto;
    property Situacao : Smallint read GetSituacao;
    property RotinaReceberID : String read GetRotinaReceberID;
    property RotinaAtenderID : String read GetRotinaAtenderID;
    property RotinaCancelarID : String read GetRotinaCancelarID;
    property RotinaDevolverID : String read GetRotinaDevolverID;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBREQUISICAO_ALMOX
  - TBEMPRESA
  - TBCENTRO_CUSTO
  - TBCENTRO_CUSTO_EMPRESA
  - TBCONFIGURACAO
  - TBCLIENTE

  Views:
  - VW_EMPRESA

  Procedures:

*)

  procedure MonitorarRequisicaoAlmoxAuto(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);
  procedure MonitorarRequisicaoAlmox(const AOwner : TComponent; const PanelDock : TPanel = nil; const AutoLoad : Boolean = FALSE);

implementation

uses
//  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMRecursos, UDMNFe,
//  UGeRequisicaoAlmox, UGeRequisicaoAlmoxCancelar;
    System.DateUtils
  , System.SysConst
  , RTLConsts
  , UDMRecursos
  , UDMBusiness
  , UDMNFe
  , Classe.Empresa
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , Service.Message
  , View.Fornecedor
  , View.Produto
  , View.Usuario
  , View.RequisicaoAlmox
  , View.RequisicaoAlmox.Cancelar;

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
  AForm : TViewRequisicaoAlmoxMonitor;
begin
  if Assigned(PanelDock) then
    if PanelDock.Width > 1 then
      Exit;

  AForm := TViewRequisicaoAlmoxMonitor.Create(AOwner);

  with AForm do
  begin
    CarregarEmpresa;
    CarregarCentroCusto(gUsuarioLogado.Empresa);

    e1Data.Date := IncDay(Date, -30);
    e2Data.Date := Date;

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

procedure TViewRequisicaoAlmoxMonitor.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaReceberID,  nmRequisicaoReceber.Caption,  RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAtenderID,  nmRequisicaoAtender.Caption,  RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarID, nmRequisicaoCancelar.Caption, RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaDevolverID, nmRequisicaoDevolver.Caption, RotinaID);
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FPreferenciaINI.WriteBool(gUsuarioLogado.Login, 'Monitorar', False);
  FPreferenciaINI.UpdateFile;

  if Assigned(Parent) then
    Parent.Width := 1;

  edEmpresa.Clear;
  edCentroCusto.Clear;

  Action := caFree;
end;

procedure TViewRequisicaoAlmoxMonitor.CarregarCentroCusto(const aEmpresa : String);
var
  I : Integer;
  aCentroCusto : TSimpleObject;
begin
  try
    I := 0;

    edCentroCusto.Items.BeginUpdate;
    edCentroCusto.Clear;

    dtsCentroCusto.DataSet := CentroCustoLista.Listar(aEmpresa).DataSet;

    while not dtsCentroCusto.DataSet.Eof do
    begin
      aCentroCusto := TSimpleObject.Create;
      aCentroCusto.Codigo   := dtsCentroCusto.DataSet.FieldByName('codigo').AsInteger;
      aCentroCusto.Descriao := dtsCentroCusto.DataSet.FieldByName('descricao').AsString;
      aCentroCusto.Nome     := dtsCentroCusto.DataSet.FieldByName('nome').AsString;

      if (aCentroCusto.Codigo = FPreferenciaINI.ReadInteger(CentroCustoLista.DAO.Usuario.Login, 'CentroCusto', 0)) then
        I := edCentroCusto.Items.Count;

      edCentroCusto.Items.AddObject(aCentroCusto.Descriao, aCentroCusto);
      dtsCentroCusto.DataSet.Next;
    end;
  finally
    edCentroCusto.Items.EndUpdate;
    edCentroCusto.ItemIndex := I;
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.CarregarEmpresa;
var
  aEmpresa : TEmpresaObject;
  I : Integer;
begin
  try
    I := 0;

    edEmpresa.Items.BeginUpdate;
    edEmpresa.Clear;

    EmpresaView.DAO.Open;
    dtsEmpresa.DataSet := EmpresaView.DAO.DataSet;

    while not dtsEmpresa.DataSet.Eof do
    begin
      aEmpresa := TEmpresaObject.Create;
      aEmpresa.Codigo := dtsEmpresa.DataSet.FieldByName('codigo').AsInteger;
      aEmpresa.CNPJ   := dtsEmpresa.DataSet.FieldByName('cnpj').AsString;
      aEmpresa.RazaoSocial := dtsEmpresa.DataSet.FieldByName('razao').AsString;
      aEmpresa.Fantasia    := dtsEmpresa.DataSet.FieldByName('fantasia').AsString;

      if (aEmpresa.CNPJ = EmpresaView.DAO.Usuario.Empresa.CNPJ) then
        I := edEmpresa.Items.Count;

      edEmpresa.Items.AddObject(aEmpresa.Fantasia, aEmpresa);
      dtsEmpresa.DataSet.Next;
    end;
  finally
    edEmpresa.Items.EndUpdate;
    edEmpresa.ItemIndex := I;
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID        := ROTINA_MOV_MONITOR_REQ_ALMOX_ID;
  FPreferenciaINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Preferencia.MonitorReqAlmox.ini');
end;

function TViewRequisicaoAlmoxMonitor.GetSituacao: Smallint;
begin
  if (edSituacao.ItemIndex = 0) then
    Result := -1
  else
    Result := (edSituacao.ItemIndex + 1);
end;

function TViewRequisicaoAlmoxMonitor.GetCentroCusto: Integer;
begin
  Result := TSimpleObject(edCentroCusto.Items.Objects[edCentroCusto.ItemIndex]).Codigo;
end;

function TViewRequisicaoAlmoxMonitor.GetEmpresa: String;
begin
  Result := TEmpresaObject(edEmpresa.Items.Objects[edEmpresa.ItemIndex]).CNPJ;
end;

function TViewRequisicaoAlmoxMonitor.CarregarRequisicaoAlmox : Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;

  Screen.Cursor := crSQLWait;
  try
    Controller.DAO.Close;
    Controller
      .DAO
      .ParamsByName('empresa', Empresa)
      .ParamsByName('data_inicial', StrToDateDef(e1Data.Text, GetDateDB))
      .ParamsByName('data_final', StrToDateDef(e2Data.Text, GetDateDB))
      .ParamsByName('centro_custo', CentroCusto)
      .ParamsByName('status', Situacao)
      .ParamsByName('todos', IfThen(Situacao < STATUS_REQUISICAO_ALMOX_ENV, 1, 0))
      .Open;

    aRetorno := not dtsRequisicaoAlmox.DataSet.IsEmpty;

    if aRetorno then
    begin
      FTabela
        .Tabela(dtsRequisicaoAlmox.DataSet)
        .Display('CONTROLE',  'No. Controle', '###00000', TAlignment.taCenter, True)
        .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:nn', TAlignment.taLeftJustify, True)
        .Display('EMPRESA', 'Empresa', TAlignment.taLeftJustify, True)
        .Display('TIPO', 'Tipo', TAlignment.taLeftJustify, True)
        .Display('STATUS', 'Situação', TAlignment.taLeftJustify, False)
        .Display('DATA_EMISSAO', 'Data Emissão', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
        .Display('CCUSTO_ORIGEM',  'Requisitante', TAlignment.taLeftJustify, True)
        .Display('CCUSTO_DESTINO', 'Atendente', TAlignment.taLeftJustify, True)
        .Display('VALOR_TOTAL', 'Custo Total (R$)', ',0.00', TAlignment.taRightJustify, False)
        .Configurar;

      FPreferenciaINI.WriteInteger(gUsuarioLogado.Login, 'CentroCusto', CentroCusto);
      FPreferenciaINI.UpdateFile;
    end;
  finally
    Screen.Cursor := crDefault;
    Result := aRetorno;
  end;
end;

function TViewRequisicaoAlmoxMonitor.CentroCustoLista: IControllerCentroCusto;
begin
  if not Assigned(FControllerCentroCusto) then
    FControllerCentroCusto := TControllerFactory.New.CentroCusto;

  Result := FControllerCentroCusto as IControllerCentroCusto;
end;

function TViewRequisicaoAlmoxMonitor.Controller: IControllerRequisicaoAlmoxarifado;
begin
  if not Assigned(FController) then
  begin
    FController := TControllerFactory.New.RequisicaoAlmoxarifado;
    dtsRequisicaoAlmox.DataSet := FController.DAO.DataSet;
    FTabela := TTabelaController.New.Tabela(dtsRequisicaoAlmox.DataSet);
    FController.DAO.CloseEmpty;

    // Montar condições de pesquisa
    FController.DAO.ClearWhere;
    FController
      .DAO
      .Where('r.empresa = :empresa')
      .Where('r.data_emissao between :data_inicial and :data_final')
      .Where('r.ccusto_destino = :centro_custo')
      .Where('((r.status = :status) or (:todos = 1 and r.status > 1))')
      .OrderBy('r.ano, r.controle DESC')
  end;

  Result := (FController as IControllerRequisicaoAlmoxarifado);
end;

procedure TViewRequisicaoAlmoxMonitor.BtnPesquisarClick(Sender: TObject);
begin
  if CarregarRequisicaoAlmox then
    dbgReq.SetFocus
  else
  begin
    ShowWarning('Registros não encontrados de acordo com os parâmetros informados!');
    e1Data.SetFocus;
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.nmImprimirRequisicaoAlmoxClick(
  Sender: TObject);
begin
  if dtsRequisicaoAlmox.DataSet.IsEmpty then
    Exit;

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoRequisicaoAlmox.New;

  FImpressao
    .VisualizarRequisicao(
      dtsRequisicaoAlmox.DataSet.FieldByName('EMPRESA').AsString,
      dtsRequisicaoAlmox.DataSet.FieldByName('ANO').AsInteger,
      dtsRequisicaoAlmox.DataSet.FieldByName('CONTROLE').AsInteger,
      dtsRequisicaoAlmox.DataSet.FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger
    );
end;

procedure TViewRequisicaoAlmoxMonitor.nmRequisicaoReceberClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  with dtsRequisicaoAlmox.DataSet do
  begin
    if IsEmpty then
      Exit;

    if (FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_REC) then
      TServiceMessage.ShowWarning('Requisição de materiais já marcada como recebida!')
    else
    if (FieldByName('status').AsInteger <> STATUS_REQUISICAO_ALMOX_ENV) then
      TServiceMessage.ShowWarning('Apenas requisições de materiais enviadas podem ser marcadas como recebidas.')
    else
    if ShowConfirmation('Deseja sinalizar como recebida a requisição de materiais selecionada?') then
    begin
      Controller
        .MarcarComRecebida
        .DAO
          .RefreshRecord;

      TServiceMessage.ShowInformation(Format('Requisição de materiais "%s" marcada como recebida.', [FieldByName('numero').AsString]));
    end;
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.dbgReqTblDblClick(Sender: TObject);
begin
  with cdsRequisicaoAlmox do
  begin
    if ( IsEmpty ) then
      Exit;

    CarregarRequisicaoAlmoxMonitor(Self, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.edEmpresaChange(Sender: TObject);
begin
  if edEmpresa.Focused then
    CarregarCentroCusto(Empresa);
end;

function TViewRequisicaoAlmoxMonitor.EmpresaView: IControllerEmpresa;
begin
  if not Assigned(FControllerEmpresaView) then
    FControllerEmpresaView := TControllerFactory.New.EmpresaView;

  Result := FControllerEmpresaView as IControllerEmpresa;
end;

procedure TViewRequisicaoAlmoxMonitor.nmRequisicaoAtenderClick(
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

procedure TViewRequisicaoAlmoxMonitor.nmRequisicaoCancelarClick(
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

procedure TViewRequisicaoAlmoxMonitor.nmRequisicaoDevolverClick(
  Sender: TObject);
var
  SQL : TStringList;
  sControle : String;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  with cdsRequisicaoAlmox do
  begin
    if ( IsEmpty ) then
      Exit;

    if (FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_ABR) then
    begin
      ShowWarning('Requisição de materiais já fora marcada como devolvida ao requisitante!');
      Abort;
    end;

    if (FieldByName('status').AsInteger <> STATUS_REQUISICAO_ALMOX_ENV) then
      ShowWarning('Apenas requisições de materiais enviadas podem ser marcadas como devolvidas.')
    else
    if ShowConfirmation('Deseja sinalizar como devolvida a requisição de materiais selecionada?') then
      try
        sControle := FieldByName('numero').AsString;

        SQL := TStringList.Create;

        // Marcar requisição como Recebida
        SQL.BeginUpdate;
        SQL.Clear;
        SQL.Add('Update TBREQUISICAO_ALMOX r Set');
        SQL.Add('  r.status = ' + IntToStr(STATUS_REQUISICAO_ALMOX_ABR));
        SQL.Add('where r.ano      = ' + FieldByName('ano').AsString);
        SQL.Add('  and r.controle = ' + FieldByName('controle').AsString);
        SQL.EndUpdate;

        ExecuteScriptSQL( SQL.Text );

        cdsRequisicaoAlmox.Refresh;

        ShowInformation(Format('Requisição de materiais "%s" marcada como devolvida.', [sControle]));
      finally
        SQL.Free;
      end;
  end;
end;

procedure TViewRequisicaoAlmoxMonitor.nmImprimirManifestoClick(
  Sender: TObject);
begin
  if dtsRequisicaoAlmox.DataSet.IsEmpty then
    Exit;

  if (dtsRequisicaoAlmox.DataSet.FieldByName('STATUS').AsInteger <> STATUS_REQUISICAO_ALMOX_ATD) then
    TServiceMessage.ShowWarning('Apenas requisição de materiais já atendidas possuem impressão de Manifesto!')
  else
  begin
    if not Assigned(FImpressao) then
      FImpressao := TImpressaoRequisicaoAlmox.New;

    FImpressao
      .VisualizarManifesto(
        dtsRequisicaoAlmox.DataSet.FieldByName('EMPRESA').AsString,
        dtsRequisicaoAlmox.DataSet.FieldByName('ANO').AsInteger,
        dtsRequisicaoAlmox.DataSet.FieldByName('CONTROLE').AsInteger,
        dtsRequisicaoAlmox.DataSet.FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger,
        False
      );
  end;
end;

function TViewRequisicaoAlmoxMonitor.GetRotinaReceberID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoReceber);
end;

function TViewRequisicaoAlmoxMonitor.GetRotinaAtenderID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoAtender);
end;

function TViewRequisicaoAlmoxMonitor.GetRotinaCancelarID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoCancelar);
end;

function TViewRequisicaoAlmoxMonitor.GetRotinaDevolverID: String;
begin
  Result := GetRotinaInternaID(nmRequisicaoDevolver);
end;

procedure TViewRequisicaoAlmoxMonitor.FormActivate(Sender: TObject);
begin
  inherited;
  FPreferenciaINI.WriteBool(gUsuarioLogado.Login, 'Monitorar', True);
end;

initialization
  FormFunction.RegisterForm('ViewRequisicaoAlmoxMonitor', TViewRequisicaoAlmoxMonitor);

end.
