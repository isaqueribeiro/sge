unit UGeInventario;

interface

uses
  UInfoVersao,
  UGrPadrao, 

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  cxGroupBox, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, IBTable,
  cxCheckBox, cxDBEdit, Menus, cxButtons, ToolWin,
  ComCtrls, IBUpdateSQL, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid, DBClient,
  frxClass, frxDBSet, Provider, IBQuery, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  JvToolEdit, JvDBControls, JvExMask, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxNavigator;

type
  TfrmGeInventario = class(TfrmGrPadrao)
    PnlTitulo: TPanel;
    ImgLogo: TImage;
    GrpBxFiltro: TcxGroupBox;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCentroCusto: TLabel;
    tblTipoInventario: TIBTable;
    dtsTipoInventario: TDataSource;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    lblData: TLabel;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    dbUsuario: TDBEdit;
    lblUsuario: TLabel;
    dbBloquearMovimento: TcxDBCheckBox;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    BtnImprimir: TcxButton;
    BtnAbrirInventario: TcxButton;
    BtnEncerrarInventario: TcxButton;
    BtnCancelarInventario: TcxButton;
    BtnCancelar: TcxButton;
    BtnSalvar: TcxButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    ppImpressao: TPopupMenu;
    nmImprimirConferenciaMC: TMenuItem;
    nmImprimirConferenciaCC: TMenuItem;
    N1: TMenuItem;
    nmImprimirInventarioLanc: TMenuItem;
    qryInventario: TIBDataSet;
    updInventario: TIBUpdateSQL;
    dtsInventario: TDataSource;
    qryProduto: TIBDataSet;
    BtnOpcao: TcxButton;
    Bevel4: TBevel;
    ppOpcoes: TPopupMenu;
    nmCarregarIA: TMenuItem;
    nmCarregarIE: TMenuItem;
    nmCarregarIC: TMenuItem;
    qryMaterial: TIBDataSet;
    updMaterial: TIBUpdateSQL;
    dtsMaterial: TDataSource;
    qryInventarioANO: TSmallintField;
    qryInventarioCONTROLE: TIntegerField;
    qryInventarioTIPO: TSmallintField;
    qryInventarioEMPRESA: TIBStringField;
    qryInventarioCONFERIR_ESTOQUE_VENDA: TSmallintField;
    qryInventarioDATA: TDateField;
    qryInventarioCOMPETENCIA: TIntegerField;
    qryInventarioSTATUS: TSmallintField;
    qryInventarioOBS: TMemoField;
    qryInventarioINSERCAO_DATAHORA: TDateTimeField;
    qryInventarioINSERCAO_USUARIO: TIBStringField;
    qryInventarioFECH_DATAHORA: TDateTimeField;
    qryInventarioFECH_USUARIO: TIBStringField;
    qryInventarioCANCEL_DATAHORA: TDateTimeField;
    qryInventarioCANCEL_USUARIO: TIBStringField;
    qryInventarioCANCEL_MOVITO: TMemoField;
    qryInventarioBLOQUEAR_MOVIMENTO: TSmallintField;
    PnlMaterial: TPanel;
    PnlMaterialTitulo: TPanel;
    ImgMaterial: TImage;
    BtnConfirmarItem: TcxButton;
    BtnCancelarItem: TcxButton;
    dbgMat: TcxGrid;
    dbgMatTbl: TcxGridDBBandedTableView;
    dbgMatTblPRODUTO: TcxGridDBBandedColumn;
    dbgMatTblDESCRI_APRESENTACAO: TcxGridDBBandedColumn;
    dbgMatLvl: TcxGridLevel;
    qryMaterialANO: TSmallintField;
    qryMaterialCONTROLE: TIntegerField;
    qryMaterialITEM: TIntegerField;
    qryMaterialPRODUTO: TIBStringField;
    qryMaterialQTDE: TIBBCDField;
    qryMaterialESTOQUE: TIBBCDField;
    qryMaterialFRACIONADOR: TIBBCDField;
    qryMaterialUNIDADE: TSmallintField;
    qryMaterialCUSTO: TIBBCDField;
    qryMaterialTOTAL: TIBBCDField;
    qryMaterialUSUARIO: TIBStringField;
    qryMaterialDESCRI_APRESENTACAO: TIBStringField;
    qryMaterialUNP_DESCRICAO: TIBStringField;
    qryMaterialUNP_SIGLA: TIBStringField;
    qryInventarioCENTRO_CUSTO_DESC: TIBStringField;
    qryInventarioSTATUS_DESCRICAO: TIBStringField;
    qryInventarioUSUARIO_ABERTURA: TIBStringField;
    qryInventarioUSUARIO_FECHAMENTO: TIBStringField;
    N2: TMenuItem;
    nmExcluirInventario: TMenuItem;
    lblProdutoCodigo: TLabel;
    dbProdutoCodigo: TDBEdit;
    dbProdutoNome: TDBEdit;
    lblProdutoNome: TLabel;
    BtnLancarProduto: TcxButton;
    qryMaterialID: TIBStringField;
    lblProdutoQtde: TLabel;
    dbProdutoQtde: TDBEdit;
    dbProdutoUnidade: TDBEdit;
    lblProdutoUnidade: TLabel;
    lblProdutoFracionador: TLabel;
    dbProdutoFracionador: TDBEdit;
    BtnEditarProduto: TcxButton;
    nmObservacoes: TMenuItem;
    frRelacaoProduto: TfrxReport;
    QryRelacaoProduto: TIBQuery;
    DspRelacaoProduto: TDataSetProvider;
    CdsRelacaoProduto: TClientDataSet;
    FrdsRelacaoProduto: TfrxDBDataset;
    Bevel5: TBevel;
    frRelacaoProdutoCC: TfrxReport;
    QryRelacaoProdutoCC: TIBQuery;
    DspRelacaoProdutoCC: TDataSetProvider;
    CdsRelacaoProdutoCC: TClientDataSet;
    FrdsRelacaoProdutoCC: TfrxDBDataset;
    dbgMatTblESTOQUE: TcxGridDBBandedColumn;
    dbgMatTblQTDE: TcxGridDBBandedColumn;
    dbgMatTblUNP_SIGLA: TcxGridDBBandedColumn;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    dbgMatTblUSUARIO: TcxGridDBBandedColumn;
    N3: TMenuItem;
    nmLocalizarProduto: TMenuItem;
    nmExcluirProduto: TMenuItem;
    qryMaterialLOTE_CONFERIDO: TIBStringField;
    qryMaterialLOTE_RESULTADO: TIBStringField;
    frRelacaoInventarioCC: TfrxReport;
    QryRelacaoInventarioCC: TIBQuery;
    DspRelacaoInventarioCC: TDataSetProvider;
    CdsRelacaoInventarioCC: TClientDataSet;
    FrdsRelacaoInventarioCC: TfrxDBDataset;
    qryInventarioCENTRO_CUSTO: TIntegerField;
    lblCustoUnitario: TLabel;
    dbCustoUnitario: TDBEdit;
    dbCentroCusto: TJvDBComboEdit;
    dbData: TJvDBDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure nmCarregarIAClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nmCarregarIEClick(Sender: TObject);
    procedure nmCarregarICClick(Sender: TObject);
    procedure BtnCancelarItemClick(Sender: TObject);
    procedure dtsInventarioStateChange(Sender: TObject);
    procedure qryInventarioCONTROLEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure BtnAbrirInventarioClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure dbCentroCustoButtonClick(Sender: TObject);
    procedure qryInventarioCENTRO_CUSTO_DESCGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryInventarioSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BtnSalvarClick(Sender: TObject);
    procedure nmExcluirInventarioClick(Sender: TObject);
    procedure BtnLancarProdutoClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmarItemClick(Sender: TObject);
    procedure BtnEditarProdutoClick(Sender: TObject);
    procedure nmObservacoesClick(Sender: TObject);
    procedure BtnCancelarInventarioClick(Sender: TObject);
    procedure BtnEncerrarInventarioClick(Sender: TObject);
    procedure nmImprimirConferenciaMCClick(Sender: TObject);
    procedure frRelacaoProdutoGetValue(const VarName: String;
      var Value: Variant);
    procedure frRelacaoProdutoCCGetValue(const VarName: String;
      var Value: Variant);
    procedure nmImprimirConferenciaCCClick(Sender: TObject);
    procedure nmLocalizarProdutoClick(Sender: TObject);
    procedure nmExcluirProdutoClick(Sender: TObject);
    procedure nmImprimirInventarioLancClick(Sender: TObject);
    procedure frRelacaoInventarioCCGetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    ver : TInfoVersao;
    procedure CarregarInventario(Empresa : String; Ano, Codigo : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure BloquearBotoes;
    procedure ClearFieldEmptyStr;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeInventario: TfrmGeInventario;

implementation

uses
  UDMBusiness, UFuncoes, UGeProduto,  DateUtils, UDMNFe, SysConst,  UConstantesDGE,
  UGrCampoRequisitado, UGeCentroCusto, UGrMemo, UDMRecursos;

{$R *.dfm}

{ TfrmGrPadrao1 }

procedure TfrmGeInventario.CarregarInventario(Empresa: String; Ano,
  Codigo: Integer);
begin
  with qryInventario do
  begin
    Close;
    ParamByName('ano').AsInteger := Ano;
    ParamByName('cod').AsInteger := Codigo;
    ParamByName('emp').AsString  := Empresa;
    Open;
  end;

  with qryMaterial do
  begin
    Close;
    ParamByName('ano').AsInteger := qryInventarioANO.AsInteger;
    ParamByName('cod').AsInteger := qryInventarioCONTROLE.AsInteger;
    Open;
  end;

  BloquearBotoes;
end;

procedure TfrmGeInventario.FormCreate(Sender: TObject);
begin
  inherited;

  ver := TInfoVersao.GetInstance();

  RotinaID          := ROTINA_MOV_INVENTARIO_ESTOQU_ID;
  PnlTitulo.Caption := StringofChar(' ', 8)+ AnsiUpperCase(Self.Caption);

  tblEmpresa.Open;
  tblTipoInventario.Open;

  NomeTabela    := 'TBINVENTARIO_ALMOX';
  CampoCodigo   := 'controle';
  GeneratorName := 'GEN_INVENTARIO_ALMOX_' + FormatFloat('0000', YearOf(GetDateDB));

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );

  lblCentroCusto.Enabled       := (gSistema.Codigo = SISTEMA_GESTAO_IND);
  dbCentroCusto.Enabled        := (gSistema.Codigo = SISTEMA_GESTAO_IND);
  dbCentroCusto.Button.Enabled := (gSistema.Codigo = SISTEMA_GESTAO_IND);
end;

procedure TfrmGeInventario.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if BtnAbrirInventario.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnAbrirInventario), BtnAbrirInventario.Caption, RotinaID);

    if BtnEncerrarInventario.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnEncerrarInventario), BtnEncerrarInventario.Caption, RotinaID);

    if BtnCancelarInventario.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnCancelarInventario), BtnCancelarInventario.Caption, RotinaID);

    if BtnImprimir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnImprimir), BtnImprimir.Caption, RotinaID);

    if nmImprimirInventarioLanc.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaSubInternaID(nmImprimirInventarioLanc), nmImprimirInventarioLanc.Caption, GetRotinaInternaID(BtnImprimir));

    if BtnLancarProduto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnLancarProduto), BtnLancarProduto.Caption, RotinaID);

    if BtnEditarProduto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(BtnEditarProduto), BtnEditarProduto.Caption, RotinaID);
  end;
end;

procedure TfrmGeInventario.nmCarregarIAClick(Sender: TObject);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    max(i.ano)      as ano');
    SQL.Add('  , max(i.controle) as controle');
    SQL.Add('from TBINVENTARIO_ALMOX i');
    SQL.Add('where i.empresa = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and i.status in (' + IntToStr(STATUS_INVENTARIO_ALMOX_EML) + ', ' + IntToStr(STATUS_INVENTARIO_ALMOX_EMC) + ')');
    Open;

    CarregarInventario(gUsuarioLogado.Empresa, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);

    if Sender = nmCarregarIA then
      if qryInventario.IsEmpty then
        ShowInformation('Não existe inventário aberto para a empresa em uso!');
  end;
end;

procedure TfrmGeInventario.FormShow(Sender: TObject);
begin
  inherited;
  nmCarregarIAClick(Self);
end;

procedure TfrmGeInventario.nmCarregarIEClick(Sender: TObject);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    max(i.ano)      as ano');
    SQL.Add('  , max(i.controle) as controle');
    SQL.Add('from TBINVENTARIO_ALMOX i');
    SQL.Add('where i.empresa = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and i.status  = ' + IntToStr(STATUS_INVENTARIO_ALMOX_ENC));
    Open;

    CarregarInventario(gUsuarioLogado.Empresa, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);

    if qryInventario.IsEmpty then
      ShowInformation('Não existe inventário encerrado para a empresa em uso!');
  end;
end;

procedure TfrmGeInventario.nmCarregarICClick(Sender: TObject);
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    max(i.ano)      as ano');
    SQL.Add('  , max(i.controle) as controle');
    SQL.Add('from TBINVENTARIO_ALMOX i');
    SQL.Add('where i.empresa = ' + QuotedStr(gUsuarioLogado.Empresa));
    SQL.Add('  and i.status  = ' + IntToStr(STATUS_INVENTARIO_ALMOX_CAN));
    Open;

    CarregarInventario(gUsuarioLogado.Empresa, FieldByName('ano').AsInteger, FieldByName('controle').AsInteger);

    if qryInventario.IsEmpty then
      ShowInformation('Não existe inventário cancelado para a empresa em uso!');
  end;
end;

procedure TfrmGeInventario.BloquearBotoes;
begin
  BtnAbrirInventario.Enabled    := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse)
    and ((qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_ENC, STATUS_INVENTARIO_ALMOX_CAN]) or (qryInventario.RecordCount = 0));

  BtnEncerrarInventario.Enabled := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse)
    and (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC])
    and (qryInventario.RecordCount > 0)
    and (qryMaterial.RecordCount   > 0);

  BtnCancelarInventario.Enabled := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse)
    and (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC])
    and (qryInventario.RecordCount > 0);

  BtnOpcao.Enabled    := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse);
  BtnCancelar.Enabled := (not PnlMaterial.Visible) and (qryInventario.State in [dsEdit, dsInsert]);
  BtnSalvar.Enabled   := (not PnlMaterial.Visible) and (qryInventario.State in [dsEdit, dsInsert]);
  BtnImprimir.Enabled := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse);

  nmExcluirInventario.Enabled      := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse) and (qryMaterial.RecordCount = 0) and (qryInventarioANO.AsInteger > 0);
  nmImprimirInventarioLanc.Enabled := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse);

  nmObservacoes.Enabled      := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse)
    and (qryInventarioANO.AsInteger > 0) and (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC]);
  nmLocalizarProduto.Enabled := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse) and (qryMaterial.RecordCount > 0)
    and (qryInventarioANO.AsInteger > 0);
  BtnLancarProduto.Enabled   := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse)
    and (qryInventarioANO.AsInteger > 0) and (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC]);
  BtnEditarProduto.Enabled   := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse) and (qryMaterial.RecordCount > 0)
    and (qryInventarioANO.AsInteger > 0) and (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC]);
  nmExcluirProduto.Enabled   := (not PnlMaterial.Visible) and (qryInventario.State = dsBrowse) and (qryMaterial.RecordCount > 0)
    and (qryInventarioANO.AsInteger > 0) and (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC]);
end;

procedure TfrmGeInventario.BtnCancelarItemClick(Sender: TObject);
begin
  if (qryMaterial.State in [dsEdit, dsInsert]) then
    qryMaterial.Cancel;

  PnlMaterial.Visible := False;
  dbgMat.SetFocus;
  
  BloquearBotoes;  
end;

procedure TfrmGeInventario.dtsInventarioStateChange(Sender: TObject);
begin
  BloquearBotoes;
end;

procedure TfrmGeInventario.qryInventarioCONTROLEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := qryInventarioANO.AsString + '/' + FormatFloat('###00000', Sender.AsInteger);
end;

procedure TfrmGeInventario.BtnAbrirInventarioClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(GeneratorName);

  qryInventario.Append;
  qryInventarioANO.AsInteger      := iAno;
  qryInventarioCONTROLE.AsInteger := iNum;
  qryInventarioEMPRESA.AsString   := gUsuarioLogado.Empresa;
  qryInventarioSTATUS.AsInteger   := STATUS_INVENTARIO_ALMOX_EML;
  qryInventarioSTATUS_DESCRICAO.AsString        := 'Em lançamento';
  qryInventarioINSERCAO_DATAHORA.AsDateTime     := GetDateTimeDB;
  qryInventarioINSERCAO_USUARIO.AsString        := gUsuarioLogado.Login;
  qryInventarioUSUARIO_ABERTURA.AsString        := gUsuarioLogado.Nome;
  qryInventarioDATA.AsDateTime                  := GetDateDB;
  qryInventarioCONFERIR_ESTOQUE_VENDA.AsInteger := IfThen(gSistema.Codigo = SISTEMA_GESTAO_COM, 1, 0);
  qryInventarioBLOQUEAR_MOVIMENTO.AsInteger     := 0;

  qryInventarioCOMPETENCIA.Clear;
  qryInventarioTIPO.Clear;
  qryInventarioCENTRO_CUSTO.Clear;
  qryInventarioCENTRO_CUSTO_DESC.Clear;
  qryInventarioFECH_DATAHORA.Clear;
  qryInventarioFECH_USUARIO.Clear;
  qryInventarioOBS.Clear;
  qryInventarioCANCEL_DATAHORA.Clear;
  qryInventarioCANCEL_USUARIO.Clear;
  qryInventarioCANCEL_MOVITO.Clear;

  if ( dbCentroCusto.Visible and dbCentroCusto.Enabled ) then
    dbCentroCusto.SetFocus
  else
    dbTipo.SetFocus;  
end;

procedure TfrmGeInventario.BtnCancelarClick(Sender: TObject);
begin
  if (qryInventario.State in [dsEdit, dsInsert]) then
    if not qryInventario.Modified then
      qryInventario.Cancel
    else
    if ShowConfirmation('Deseja cancelar a edição do inventário?') then
      qryInventario.Cancel;
end;

procedure TfrmGeInventario.dbCentroCustoButtonClick(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( qryInventario.State in [dsEdit, dsInsert] ) then
    if ( SelecionarDepartamento(Self, 0, qryInventarioEMPRESA.AsString, iCodigo, sNome, iCliente) ) then
    begin
      qryInventarioCENTRO_CUSTO.AsInteger     := iCodigo;
      qryInventarioCENTRO_CUSTO_DESC.AsString := sNome;
    end;
end;

procedure TfrmGeInventario.qryInventarioCENTRO_CUSTO_DESCGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := IfThen(gSistema.Codigo = SISTEMA_GESTAO_COM, '(ESTOQUE DE VENDA)', Sender.AsString);
end;

procedure TfrmGeInventario.qryInventarioSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      STATUS_INVENTARIO_ALMOX_EML: Text := 'Em lançamento';
      STATUS_INVENTARIO_ALMOX_EMC: Text := 'Em conferência';
      STATUS_INVENTARIO_ALMOX_ENC: Text := 'Encerrado';
      STATUS_INVENTARIO_ALMOX_CAN: Text := 'Cancelado';
    end;
end;

procedure TfrmGeInventario.BtnSalvarClick(Sender: TObject);
begin
  if (qryInventario.State in [dsEdit, dsInsert]) then
  begin
    qryInventarioCENTRO_CUSTO.Required := (gSistema.Codigo = SISTEMA_GESTAO_IND);

    ClearFieldEmptyStr;
    if CamposRequiridos(Self, TClientDataSet(qryInventario), Self.Caption) then
      Exit;

    if not qryInventario.Modified then
      qryInventario.Cancel
    else
    if ShowConfirmation('Deseja confirmar os dados informados para o inventário?') then
    begin
      qryInventario.Post;
      qryInventario.ApplyUpdates;
      CommitTransaction;
    end;
  end;
end;

procedure TfrmGeInventario.ClearFieldEmptyStr;
var
  I : Integer;
begin

  for I := 0 to qryInventario.Fields.Count - 1 do
    if ( qryInventario.Fields[I].Required ) then
      if ( Trim(qryInventario.Fields[I].AsString) = EmptyStr ) then
        qryInventario.Fields[I].Clear;

end;

procedure TfrmGeInventario.nmExcluirInventarioClick(Sender: TObject);
begin
  if ( qryInventario.RecordCount > 0 ) then
    if ( qryInventarioSTATUS.AsInteger <> STATUS_INVENTARIO_ALMOX_EML ) then
      ShowInformation('Apenas inventários em lançamento podem ser excluídos!')
    else
    if ShowConfirmation('Deseja excluir o inventário selecionado?') then
    begin
      qryInventario.Delete;
      qryInventario.ApplyUpdates;
      CommitTransaction;
      
      nmCarregarIAClick(Self);
    end;
end;

procedure TfrmGeInventario.BtnLancarProdutoClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_ENC ) then
    ShowInformation('Inventário encerrado não pode ser alterado!')
  else
  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_CAN ) then
    ShowInformation('Inventário cancelado não pode ser alterado!')
  else
  begin
    qryMaterial.Append;
    qryMaterialID.AsString := GetGuidID38;
    qryMaterialANO.Assign( qryInventarioANO );
    qryMaterialCONTROLE.Assign( qryInventarioCONTROLE );
    qryMaterialITEM.AsInteger         := 0;
    qryMaterialFRACIONADOR.AsCurrency := 1.0;
    qryMaterialUSUARIO.AsString       := gUsuarioLogado.Login;

    qryMaterialLOTE_CONFERIDO.Clear;
    qryMaterialLOTE_RESULTADO.Clear;

    PnlMaterial.Visible      := True;
    dbProdutoCodigo.ReadOnly := False;
    dbProdutoCodigo.SetFocus;

    BloquearBotoes;
  end;
end;

procedure TfrmGeInventario.CarregarDadosProduto(Codigo: Integer);
begin
  if not PnlMaterial.Visible then
    Exit;
    
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o código do material/produto');
    Exit;
  end;

  if ( not qryMaterial.Active ) then
    Exit
  else
  if ( qryMaterial.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('empresa').AsString       := qryInventarioEMPRESA.AsString;
      ParamByName('centro_custo').AsInteger := qryInventarioCENTRO_CUSTO.AsInteger;
      ParamByName('produto').AsString       := FormatFloat('###0000000', Codigo);
      Open;

      if (Trim(FieldByName('produto').AsString) <> EmptyStr) then
      begin
        qryMaterialPRODUTO.AsString             := FieldByName('produto').AsString;
        qryMaterialDESCRI_APRESENTACAO.AsString := FieldByName('descri_apresentacao').AsString;
        qryMaterialESTOQUE.AsCurrency           := FieldByName('estoque').AsCurrency;
        qryMaterialFRACIONADOR.AsCurrency       := FieldByName('fracionador').AsCurrency;
        qryMaterialUNIDADE.AsInteger            := FieldByName('unidade').AsInteger;

        if (gSistema.Codigo = SISTEMA_GESTAO_COM) then
          qryMaterialCUSTO.AsCurrency           := FieldByName('preco').AsCurrency        // Custo médio inteiro
        else
        if ( FieldByName('custo_medio').AsCurrency > 0.0 ) then
          qryMaterialCUSTO.AsCurrency           := FieldByName('custo_medio').AsCurrency  // Custo médio fracionado
        else
          qryMaterialCUSTO.AsCurrency           := FieldByName('preco').AsCurrency;

        qryMaterialUNP_DESCRICAO.AsString       := FieldByName('und_descricao').AsString;
        qryMaterialUNP_SIGLA.AsString           := FieldByName('und_sigla').AsString;

        if (Trim(FieldByName('lote_id').AsString) <> EmptyStr) then
          qryMaterialLOTE_CONFERIDO.AsString := FieldByName('lote_id').AsString
        else
          qryMaterialLOTE_CONFERIDO.Clear;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado!');
        qryMaterialPRODUTO.Clear;
        
        if ( dbProdutoCodigo.Visible and dbProdutoCodigo.Enabled ) then
          dbProdutoCodigo.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeInventario.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbProdutoCodigo ) then
    if ( qryMaterial.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(qryMaterialPRODUTO.AsString, 0) );

end;

procedure TfrmGeInventario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin

    if (Key = SYS_KEY_O) then
    begin
      if nmObservacoes.Visible and nmObservacoes.Enabled then
        nmObservacoes.Click;
    end
    else
    if (Key = SYS_KEY_F) then
    begin
      if nmLocalizarProduto.Visible and nmLocalizarProduto.Enabled then
        nmLocalizarProduto.Click;
    end
    else
    if (Key = VK_DELETE) then
    begin
      if nmExcluirProduto.Visible and nmExcluirProduto.Enabled then
        nmExcluirProduto.Click;
    end;

  end
  else
  if (Key = VK_ESCAPE) then
  begin

    if PnlMaterial.Visible then
    begin
      PnlMaterial.Visible := False;
      if ( qryMaterial.State in [dsEdit, dsInsert] ) then
        qryMaterial.Cancel;
      BloquearBotoes;  
    end;

  end
  else
  if (Key = VK_INSERT) then
  begin

    if ( BtnLancarProduto.Visible and BtnLancarProduto.Enabled ) then
      BtnLancarProduto.Click;

  end
  else
  if (Key = VK_F2) then
  begin

    if ( BtnEditarProduto.Visible and BtnEditarProduto.Enabled ) then
      BtnEditarProduto.Click;

  end;

  inherited;
end;

procedure TfrmGeInventario.BtnConfirmarItemClick(Sender: TObject);
begin
  if (Trim(dbProdutoCodigo.Field.AsString) = EmptyStr) or (Trim(dbProdutoNome.Field.AsString) = EmptyStr) then
  begin
    ShowWarning('Favor informar o código do material/produto cadastrado para a empresa');
    dbProdutoCodigo.SetFocus;
  end
  else
  if ( dbProdutoQtde.Field.AsCurrency < 0.0 ) then
  begin
    ShowWarning('Favor informar uma quantidade válida');
    dbProdutoQtde.SetFocus;
  end
  else
  if ( dbCustoUnitario.Field.AsCurrency <= 0.0 ) then
  begin
    ShowWarning('Favor informar um Valor de Custo unitário válido');
    dbCustoUnitario.SetFocus;
  end
  else
  begin
    if (qryMaterial.State in [dsEdit, dsInsert]) then
    begin
      qryMaterialTOTAL.AsCurrency := qryMaterialQTDE.AsCurrency * qryMaterialCUSTO.AsCurrency;
      qryMaterialUSUARIO.AsString := gUsuarioLogado.Login;
      
      qryMaterial.Post;
      qryMaterial.ApplyUpdates;

      if (qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_EML) then
      begin
        qryInventario.Edit;
        qryInventarioSTATUS.AsInteger          := STATUS_INVENTARIO_ALMOX_EMC;
        qryInventarioSTATUS_DESCRICAO.AsString := 'Em conferência';
        qryInventario.Post;
        qryInventario.ApplyUpdates;
      end;

      CommitTransaction;
    end;

    PnlMaterial.Visible := False;
    dbgMat.SetFocus;

    BloquearBotoes;
  end;
end;

procedure TfrmGeInventario.BtnEditarProdutoClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_ENC ) then
    ShowInformation('Inventário encerrado não pode ser alterado!')
  else
  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_CAN ) then
    ShowInformation('Inventário cancelado não pode ser alterado!')
  else
  begin
    qryMaterial.Edit;

    PnlMaterial.Visible      := True;
    dbProdutoCodigo.ReadOnly := True;
    dbProdutoQtde.SetFocus;

    BloquearBotoes;
  end;
end;

procedure TfrmGeInventario.nmObservacoesClick(Sender: TObject);
var
  sObs : TStringList;
begin
  if ( qryInventario.RecordCount > 0 ) then
    if ( not (qryInventarioSTATUS.AsInteger in [STATUS_INVENTARIO_ALMOX_EML, STATUS_INVENTARIO_ALMOX_EMC]) ) then
      ShowInformation('Apenas inventários em lançamento ou em conferência podem ser observações inseridas!')
    else
    begin
      sObs := TStringList.Create;
      sObs.Clear;

      sObs.Text := qryInventarioOBS.AsString;

      if SetMemoObservacao(Self, sObs) then
      begin
        qryInventario.Edit;
        qryInventarioOBS.AsString := sObs.Text;
        qryInventario.Post;
        qryInventario.ApplyUpdates;
        CommitTransaction;
      end;
    end;
end;

procedure TfrmGeInventario.BtnCancelarInventarioClick(Sender: TObject);
var
  sMotivo : TStringList;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_CAN ) then
    ShowWarning('O inventário selecionado já está cancelado!')
  else
  if ( qryInventarioSTATUS.AsInteger <> STATUS_INVENTARIO_ALMOX_EMC ) then
    ShowWarning('Apenas inventários em conferência podem ser cancelados!')
  else
    try
      sMotivo := TStringList.Create;
      sMotivo.Clear;

      if not SetMemoMotivo(Self, sMotivo) then
        Exit;

      if ShowConfirmation('Os lançamentos realizados não serão contabilizados ao cancelar inventário.' + #13#13 + 'Deseja cancelar o inventário?') then
      begin
        qryInventario.Edit;
        qryInventarioSTATUS.AsInteger           := STATUS_INVENTARIO_ALMOX_CAN;
        qryInventarioSTATUS_DESCRICAO.AsString  := 'Cancelado';
        qryInventarioCANCEL_DATAHORA.AsDateTime := GetDateTimeDB;
        qryInventarioCANCEL_USUARIO.AsString    := gUsuarioLogado.Login;
        qryInventarioCANCEL_MOVITO.AsString     := sMotivo.Text;
        qryInventario.Post;
        qryInventario.ApplyUpdates;
        CommitTransaction;

        BloquearBotoes;

        ShowInformation('Inventário cancelado com sucesso.');
      end;
    finally
      sMotivo.Free;
    end;
end;

procedure TfrmGeInventario.BtnEncerrarInventarioClick(Sender: TObject);
var
  sMensagem : String;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  if (qryInventarioCENTRO_CUSTO.AsInteger = 0) then
    sMensagem := 'Ao encerrar o balanço/inventário, o estoque de venda será atualizado para os itens lançados.'
  else
    sMensagem := 'Ao encerra o inventário, o estoque do Centro de Custo será atualizado para os itens lançados.';

  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_ENC ) then
    ShowWarning('O inventário selecionado já está encerrado!')
  else
  if ( qryInventarioSTATUS.AsInteger <> STATUS_INVENTARIO_ALMOX_EMC ) then
    ShowWarning('Apenas inventários em conferência podem ser encerrados!')
  else
  if ShowConfirmation(sMensagem + #13#13 + 'Deseja encerrar o inventário?') then
  begin
    qryInventario.Edit;
    qryInventarioSTATUS.AsInteger          := STATUS_INVENTARIO_ALMOX_ENC;
    qryInventarioSTATUS_DESCRICAO.AsString := 'Encerrado';
    qryInventarioFECH_DATAHORA.AsDateTime  := GetDateTimeDB;
    qryInventarioFECH_USUARIO.AsString     := gUsuarioLogado.Login;
    qryInventario.Post;
    qryInventario.ApplyUpdates;
    CommitTransaction;

    BloquearBotoes;

    ShowInformation('Inventário encerrado com sucesso.');
  end;
end;

procedure TfrmGeInventario.nmImprimirConferenciaMCClick(Sender: TObject);
var
  sEmpresa : String;
begin
  if (Trim(qryInventarioEMPRESA.AsString) = EmptyStr) then
    sEmpresa := gUsuarioLogado.Empresa
  else
    sEmpresa := qryInventarioEMPRESA.AsString;
    
  try
    DMNFe.AbrirEmitente(sEmpresa);
    DMBusiness.ConfigurarEmail(sEmpresa, EmptyStr, nmImprimirConferenciaMC.Caption, EmptyStr);
  except
  end;

  with CdsRelacaoProduto, Params do
  begin
    Close;
    ParamByName('empresa').AsString        := sEmpresa;
    ParamByName('estoque_unico').AsInteger := IfThen(GetEstoqueUnificadoEmpresa(sEmpresa), 1, 0);
    Open;
  end;

  frRelacaoProduto.ShowReport;
end;

procedure TfrmGeInventario.frRelacaoProdutoGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := StringReplace(AnsiUpperCase(nmImprimirConferenciaMC.Caption), '&', '', [rfReplaceAll]);

  if ( VarName = VAR_SUBTITLE ) then
    Value := 'Inventário';

  if ( VarName = VAR_PERIODO ) then
    Value := EmptyStr;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_DEPARTAMENTO ) then
    Value := EmptyStr;

  if ( VarName = VAR_FILTROS ) then
    Value := EmptyStr;

  if ( VarName = VAR_TODOS ) then
    Value := 0;

  if ( VarName = VAR_APENASCONSOLIDADO ) then
    Value := 0;
end;

procedure TfrmGeInventario.frRelacaoProdutoCCGetValue(
  const VarName: String; var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'Lista p/ Conferência (' + dbCentroCusto.Text + ')';

  if ( VarName = VAR_SUBTITLE ) then
    Value := 'Inventário';

  if ( VarName = VAR_PERIODO ) then
    Value := EmptyStr;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_DEPARTAMENTO ) then
    Value := EmptyStr;

  if ( VarName = VAR_FILTROS ) then
    Value := EmptyStr;

  if ( VarName = VAR_TODOS ) then
    Value := 0;

  if ( VarName = VAR_APENASCONSOLIDADO ) then
    Value := 0;
end;

procedure TfrmGeInventario.nmImprimirConferenciaCCClick(Sender: TObject);
var
  sEmpresa : String;
begin
  if (qryInventario.RecordCount = 0) then
  begin
    ShowWarning('Este listagem só poderá ser montada se houver um registro de inventário selecionado!');
    Exit;
  end;

  if (Trim(qryInventarioEMPRESA.AsString) = EmptyStr) then
    sEmpresa := gUsuarioLogado.Empresa
  else
    sEmpresa := qryInventarioEMPRESA.AsString;

  try
    DMNFe.AbrirEmitente(sEmpresa);
    DMBusiness.ConfigurarEmail(sEmpresa, EmptyStr, nmImprimirConferenciaCC.Caption, EmptyStr);
  except
  end;

  with CdsRelacaoProdutoCC, Params do
  begin
    Close;
    ParamByName('empresa').AsString       := sEmpresa;
    ParamByName('centro_custo').AsInteger := qryInventarioCENTRO_CUSTO.AsInteger;
    Open;
  end;

  frRelacaoProdutoCC.ShowReport;
end;

procedure TfrmGeInventario.nmLocalizarProdutoClick(Sender: TObject);
var
  sLocalizar,
  sCampo    : String;
begin
  if (qryMaterial.RecordCount > 0) then
    if InputQuery('Localizar', 'Informe o código ou a descrição do material/produto:', sLocalizar) then
    begin
      if (StrToIntDef(Trim(sLocalizar), 0) > 0) then
      begin
        sCampo     := 'PRODUTO';
        sLocalizar := FormatFloat('###0000000', StrToIntDef(Trim(sLocalizar), 0));
      end
      else
        sCampo := 'DESCRI_APRESENTACAO';

      if qryMaterial.Locate(sCampo, AnsiUpperCase(Trim(sLocalizar)), [loCaseInsensitive, loPartialKey]) then
        dbgMat.SetFocus
      else
        ShowWarning('Material/Produto não localizdo!');
    end;
end;

procedure TfrmGeInventario.nmExcluirProdutoClick(Sender: TObject);
begin
  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_ENC ) then
    ShowInformation('Inventário encerrado não pode ser alterado!')
  else
  if ( qryInventarioSTATUS.AsInteger = STATUS_INVENTARIO_ALMOX_CAN ) then
    ShowInformation('Inventário cancelado não pode ser alterado!')
  else
  if ShowConfirmation('Deseja excluir o lançamento do material/produto selecionado?') then
  begin
    qryMaterial.Delete;
    qryMaterial.ApplyUpdates;
    CommitTransaction;

    BloquearBotoes;
    dbgMat.SetFocus;
  end;
end;

procedure TfrmGeInventario.nmImprimirInventarioLancClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  if (qryInventario.RecordCount = 0) then
  begin
    ShowWarning('Favor selecionar o inventário!');
    Exit;
  end;

  try
    DMNFe.AbrirEmitente(qryInventarioEMPRESA.AsString);
    DMBusiness.ConfigurarEmail(qryInventarioEMPRESA.AsString, EmptyStr, nmImprimirInventarioLanc.Caption, EmptyStr);
  except
  end;

  with CdsRelacaoInventarioCC, Params do
  begin
    Close;
    ParamByName('ano').AsInteger      := qryInventarioANO.AsInteger;
    ParamByName('controle').AsInteger := qryInventarioCONTROLE.AsInteger;
    Open;
  end;

  frRelacaoInventarioCC.ShowReport;
end;

procedure TfrmGeInventario.frRelacaoInventarioCCGetValue(
  const VarName: String; var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'Lançamentos do Inventário';

  if ( VarName = VAR_SUBTITLE ) then
    Value := 'Inventário';

  if ( VarName = VAR_PERIODO ) then
    Value := EmptyStr;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_DEPARTAMENTO ) then
    Value := EmptyStr;

  if ( VarName = VAR_FILTROS ) then
    Value := EmptyStr;

  if ( VarName = VAR_TODOS ) then
    Value := 0;

  if ( VarName = VAR_APENASCONSOLIDADO ) then
    Value := 0;
end;

initialization
  FormFunction.RegisterForm('frmGeInventario', TfrmGeInventario);

end.
