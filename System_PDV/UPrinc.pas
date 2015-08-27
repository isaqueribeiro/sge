unit UPrinc;

interface

uses
  StdCtrls, Buttons,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, jpeg, dxRibbonForm,
  
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBar, dxRibbon, cxClasses, dxSkinsForm,
  dxGDIPlusClasses, dxRibbonSkins, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinsdxRibbonPainter,
  dxRibbonCustomizationForm, dxSkinsdxStatusBarPainter, dxStatusBar,
  cxContainer, cxEdit, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, cxLabel, dxRibbonBackstageView;

type
  TfrmPrinc = class(TdxRibbonForm)
    pnlMain: TPanel;
    imgFundo: TImage;
    imgEmpresa: TImage;
    ProductName: TLabel;
    Copyright: TLabel;
    FileDescription: TLabel;
    Version: TLabel;
    SknController: TdxSkinController;
    BrManager: TdxBarManager;
    BrMngPrincipalMov: TdxBar;
    BrMngPrincipalCad: TdxBar;
    RbbTabPrincipal: TdxRibbonTab;
    Ribbon: TdxRibbon;
    BrBtnVenda: TdxBarLargeButton;
    BrBtnOrcamento: TdxBarLargeButton;
    BrBtnProduto: TdxBarLargeButton;
    BrBtnCliente: TdxBarLargeButton;
    TmrMonitorar: TTimer;
    RbbTabCadastro: TdxRibbonTab;
    BrMngCadastroTab: TdxBar;
    BrBtnTabelaAuxiliar: TdxBarLargeButton;
    BrBtnEmpresa: TdxBarLargeButton;
    BrBtnVendedor: TdxBarLargeButton;
    BrMngCadastroCnf: TdxBar;
    BrBtnConfigurarEmpresa: TdxBarLargeButton;
    BrBtnConfigurarNFe: TdxBarLargeButton;
    BrBtnConfigurarAmbiente: TdxBarLargeButton;
    RbbTabMovimento: TdxRibbonTab;
    RbbTabCaixa: TdxRibbonTab;
    RbbTabAjuda: TdxRibbonTab;
    BrPpTabelaAuxiliar: TdxBarPopupMenu;
    BrMngCadastroAcc: TdxBar;
    BrBtnPerfilAcesso: TdxBarLargeButton;
    BrBtnUsuario: TdxBarLargeButton;
    BtBtnTributacaoIBPT: TdxBarLargeButton;
    BrMngPrincipalAcc: TdxBar;
    BrBtnAlterarSenha: TdxBarLargeButton;
    BrBtnEfetuarLogoff: TdxBarLargeButton;
    BrBtnContaCorrente: TdxBarLargeButton;
    BrBtnFormaPagto: TdxBarLargeButton;
    BrBtnCondicaoPagto: TdxBarLargeButton;
    BrMngCaixaControle: TdxBar;
    BrBtnAbrirCaixa: TdxBarLargeButton;
    BrBtnEncerrarCaixa: TdxBarLargeButton;
    BrBtnGerenciarCaixa: TdxBarLargeButton;
    BrMngAjudaDiversos: TdxBar;
    BrBtnRegistroEstacao: TdxBarLargeButton;
    BrBtnSobre: TdxBarLargeButton;
    BrBtnSenhaAutorizacao: TdxBarLargeButton;
    stbMain: TdxStatusBar;
    RbnBackstageView: TdxRibbonBackstageView;
    RbnBackstageViewConfig: TdxRibbonBackstageViewTabSheet;
    LblBackstageViewConfig: TcxLabel;
    RbnBackstageGalleryConfig: TdxRibbonBackstageViewGalleryControl;
    dxRibbonBackstageViewGalleryGroup1: TdxRibbonBackstageViewGalleryGroup;
    RbnBackstageGalleryConfigEmp: TdxRibbonBackstageViewGalleryItem;
    RbnBackstageGalleryConfigNFe: TdxRibbonBackstageViewGalleryItem;
    RbnBackstageGalleryConfigAmb: TdxRibbonBackstageViewGalleryItem;
    RbnBackstageViewAcesso: TdxRibbonBackstageViewTabSheet;
    LblBackstageViewAcesso: TcxLabel;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    dxRibbonBackstageViewGalleryGroup2: TdxRibbonBackstageViewGalleryGroup;
    dxRibbonBackstageViewGalleryItem1: TdxRibbonBackstageViewGalleryItem;
    dxRibbonBackstageViewGalleryItem2: TdxRibbonBackstageViewGalleryItem;
    dxRibbonBackstageViewGalleryItem3: TdxRibbonBackstageViewGalleryItem;
    BrManagerBar1: TdxBar;
    procedure btnSairClick(Sender: TObject);
    procedure nmAboutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nmGerenciaCaixaClick(Sender: TObject);
    procedure nmAberturaCaixaClick(Sender: TObject);
    procedure nmEncerramentoCaixaClick(Sender: TObject);
    procedure nmTributacaoClick(Sender: TObject);
    procedure nmContaCorrenteClick(Sender: TObject);
    procedure nmFormaPagtoClick(Sender: TObject);
    procedure nmCondicaoPagtoClick(Sender: TObject);
    procedure nmEmpresaClick(Sender: TObject);
    procedure nmClienteClick(Sender: TObject);
    procedure nmVendedorClick(Sender: TObject);
    procedure nmProdutoClick(Sender: TObject);
    procedure nmConfiguracaoEmpresaClick(Sender: TObject);
    procedure nmConfigurarNFeACBrClick(Sender: TObject);
    procedure nmConfigurarAmbienteClick(Sender: TObject);
    procedure nmSenhaAutorizacaoClick(Sender: TObject);
    procedure nmUsuarioClick(Sender: TObject);
    procedure nmUsuarioAlterarSenhaClick(Sender: TObject);
    procedure nmVendaClick(Sender: TObject);
    procedure nmOrcamentoClick(Sender: TObject);
    procedure nmPerfilAcessoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnRegistroEstacaoClick(Sender: TObject);
    procedure nmEfetuarLogoffClick(Sender: TObject);
    procedure RbnBackstageGalleryConfigItemClick(Sender: TObject;
      AItem: TdxRibbonBackstageViewGalleryItem);
    procedure dxRibbonBackstageViewGalleryControl1ItemClick(Sender: TObject;
      AItem: TdxRibbonBackstageViewGalleryItem);
    procedure RibbonApplicationMenuClick(Sender: TdxCustomRibbon;
      var AHandled: Boolean);
  private
    { Private declarations }
    FAcesso : Boolean;
    procedure RegistrarRotinasMenu;
  public
    { Public declarations }
    procedure ConfigurarRotuloBotoes;
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses
  // Conexão e Controles Aplicação
  UDMBusiness,
  UDMNFe,
  UDMRecursos,
  
  UFuncoes,
  UConstantesDGE,
  UGeSobre,

  UGeProduto,
  UGeVenda,
  UGeCaixa,
  UGeFluxoCaixa;

{$R *.dfm}

procedure TfrmPrinc.btnSairClick(Sender: TObject);
begin
  if ShowConfirm('Deseja SAIR do Sistema?') then
    Application.Terminate;
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
end;

procedure TfrmPrinc.ConfigurarRotuloBotoes;
begin
  ;
end;

procedure TfrmPrinc.dxRibbonBackstageViewGalleryControl1ItemClick(
  Sender: TObject; AItem: TdxRibbonBackstageViewGalleryItem);
begin
  Case AItem.Index of
    0:
      if BrBtnPerfilAcesso.Enabled then
        BrBtnPerfilAcesso.Click;
    1:
      if BrBtnUsuario.Enabled then
        BrBtnUsuario.Click;
    2:
      if BrBtnSenhaAutorizacao.Enabled then
        BrBtnSenhaAutorizacao.Click;
  end;
end;

procedure TfrmPrinc.FormActivate(Sender: TObject);
var
  sCNPJ     ,
  sHostName : String;
begin
  if not DataBaseOnLine then
    Exit;

  if ( StrIsCNPJ(GetEmpresaIDDefault) ) then
    sCNPJ := ' CPF.: ' + StrFormatarCnpj(GetEmpresaIDDefault)
  else
    sCNPJ := ' CNPJ.: ' + StrFormatarCpf(GetEmpresaIDDefault);

  stbMain.Panels.Items[2].Text := 'Licenciado a empresa ' + GetEmpresaNomeDefault;
  BrBtnAlterarSenha.Caption    := Format('Alteração de Senha (%s)', [GetUserApp]);
  BrBtnAlterarSenha.Hint       := Format('Alteração de Senha (%s)', [GetUserApp]);

  Self.WindowState := wsMaximized;

  if not DMBusiness.LiberarUsoLicenca(GetDateDB, True) then
  begin
    RbbTabCadastro.Visible  := False;
    RbbTabMovimento.Visible := False;
    RbbTabCaixa.Visible     := False;

    BrBtnVenda.Enabled      := False;
  end;

  sHostName := GetHostNameLocal;
  if not SetAcessoEstacao(sHostName) then
  begin
    ShowError('Host -> ' + sHostName + #13 + 'Estação de trabalho não registrada no sistema!');

    RbbTabCadastro.Visible  := False;
    RbbTabMovimento.Visible := False;
    RbbTabCaixa.Visible     := False;

    BrBtnVenda.Enabled     := False;
    BrBtnOrcamento.Enabled := False;
    BrBtnProduto.Enabled   := False;
    BrBtnCliente.Enabled   := False;
  end;


  if ( not DelphiIsRunning ) then
    if not gLicencaSistema.UsarSGE then
    begin
      ShowWarning(
        'A licença atual não permite que este sistema seja utilizado!' + #13#13 +
        'Favor entrar em contato com o fornecedor do software.');
      Application.Terminate;
    end;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  sFileImageWallPaper : String;
begin
  Self.Tag := SISTEMA_PDV;

  gSistema.Codigo := Self.Tag;
  gSistema.Nome   := Self.Caption;

  Self.Caption             := Application.Title + ' [ v' + GetExeVersion + ' ]';
  Self.ProductName.Caption := GetInternalName;
  Self.FileDescription.Caption := GetFileDescription;
  Self.Version.Caption     := 'Versão ' + GetExeVersion;
  Self.Copyright.Caption   := GetCopyright;
  Self.DisableAero         := True;

  Ribbon.ActiveTab := RbbTabPrincipal;

  // Carregar Imagem de Fundo da Tele Principal
  if GetCarregarPapelDeParedeLocal then
  begin
    sFileImageWallPaper := ExtractFilePath(Application.ExeName) + FILE_WALLPAPER;

    if ( FileExists(sFileImageWallPaper) ) then
    begin
      imgFundo.Picture.LoadFromFile(sFileImageWallPaper);
      imgFundo.Center := True;
    end;
  end;

  if not DataBaseOnLine then
    Exit;

  FAcesso := False;
  SetSistema(gSistema.Codigo, gSistema.Nome, GetVersion);
  RegistrarRotinasMenu;
end;

procedure TfrmPrinc.nmGerenciaCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_GERENCIAR_CAIXA_PDV_ID, True) then
    MostrarTabelaCaixa(Self);
end;

procedure TfrmPrinc.nmAberturaCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_ABRIR_CAIXA_PDV_ID, True) then
    if ( AbrirCaixa(Self, GetUserApp) ) then
      ShowInformation('Caixa aberto com sucesso!');
end;

procedure TfrmPrinc.nmEncerramentoCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_ENCERRAR_CAIXA_PDV_ID, True) then
    if ( FecharCaixa(Self, GetUserApp) ) then
      ShowInformation('Caixa encerrado com sucesso!');
end;

procedure TfrmPrinc.nmTributacaoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TRIBUTACAO_ID, True) then
    ShowInformation('Rotina não disponível nesta versão!');
end;

procedure TfrmPrinc.nmContaCorrenteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONTA_CORRENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeContaCorrente');
end;

procedure TfrmPrinc.nmFormaPagtoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_FORMA_PAGTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeFormaPagto');
end;

procedure TfrmPrinc.nmCondicaoPagtoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONDICAO_PAGTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeCondicaoPagto');
end;

procedure TfrmPrinc.nmEmpresaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_EMPRESA_ID, True) then
    if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
      ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
    else
      FormFunction.ShowModalForm(Self, 'frmGeEmpresa');
end;

procedure TfrmPrinc.nmClienteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CLIENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeCliente');
end;

procedure TfrmPrinc.nmVendedorClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_VENDEDOR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeVendedor');
end;

procedure TfrmPrinc.nmProdutoClick(Sender: TObject);
begin
  MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmPrinc.nmConfiguracaoEmpresaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONFIG_EMP_ID, True) then
    if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
      ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
    else
      FormFunction.ShowModalForm(Self, 'frmGeConfiguracaoEmpresa');
end;

procedure TfrmPrinc.nmConfigurarNFeACBrClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONFIG_NFE_ID, True) then
    if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
      ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
    else
      ConfigurarNFeACBr(GetEmpresaIDDefault);
end;

procedure TfrmPrinc.nmConfigurarAmbienteClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGrConfigurarAmbiente');
end;

procedure TfrmPrinc.nmSenhaAutorizacaoClick(Sender: TObject);
begin
  ShowInformation('Gerar Senha de Autorização', 'Opção ainda não disponível nesta versão!');
end;

procedure TfrmPrinc.nmUsuarioClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_USUARIO_ID, True) then
    if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
      ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
    else
      FormFunction.ShowModalForm(Self, 'frmGrUsuario');
end;

procedure TfrmPrinc.nmUsuarioAlterarSenhaClick(Sender: TObject);
begin
  if ( FormFunction.ShowModalForm(Self, 'frmGrUsuarioAlterarSenha') ) then
    Self.Update;
end;

procedure TfrmPrinc.nmVendaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_VENDA_PDV_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeVendaPDV');
end;

procedure TfrmPrinc.nmOrcamentoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_ORCAMENTO_PDV_ID, True) then
    MostrarControleVendas(Self);
end;

procedure TfrmPrinc.nmPerfilAcessoClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGrUsuarioPerfil');
end;

procedure TfrmPrinc.RbnBackstageGalleryConfigItemClick(Sender: TObject;
  AItem: TdxRibbonBackstageViewGalleryItem);
begin
  Case AItem.Index of
    0:
      if BrBtnConfigurarEmpresa.Enabled then
        BrBtnConfigurarEmpresa.Click;
    1:
      if BrBtnConfigurarNFe.Enabled then
        BrBtnConfigurarNFe.Click;
    2:
      if BrBtnConfigurarAmbiente.Enabled then
        BrBtnConfigurarAmbiente.Click;
  end;
end;

procedure TfrmPrinc.RegistrarRotinasMenu;
begin
  // Menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_RIBBON_ID,    '> Aplicação',   EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CADASTRO_ID,  'Cadastro',      EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_MOVIMENTO_ID, 'Movimentações', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CAIXA_PDV_ID, 'Caixa',         EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_AJUDA_ID,     'Ajuda',         EmptyStr);

  // Sub-menus
  
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_TAB_AUXILIAR_ID, 'Tabelas Auxiliares', ROTINA_MENU_CADASTRO_ID);

  // Menu Aplicação

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_EMP_ID, Trim(RbnBackstageViewConfig.Caption + ' -> ' + BrBtnConfigurarEmpresa.Caption),  ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_NFE_ID, Trim(RbnBackstageViewConfig.Caption + ' -> ' + BrBtnConfigurarNFe.Caption),      ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_AMB_ID, Trim(RbnBackstageViewConfig.Caption + ' -> ' + BrBtnConfigurarAmbiente.Caption), ROTINA_MENU_RIBBON_ID);

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_PERFIL_ID,     Trim(BrBtnPerfilAcesso.Caption),     ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_USUARIO_ID,    Trim(BrBtnUsuario.Caption),          ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_GERAR_SENH_ID, Trim(BrBtnSenhaAutorizacao.Caption), ROTINA_MENU_RIBBON_ID);

  // Cadastros

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_EMPRESA_ID, Trim(BrBtnEmpresa.Caption), ROTINA_MENU_CADASTRO_ID);

  // Cadastros -> Tabelas Auxiliares

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_TRIBUTACAO_ID,     Trim(BtBtnTributacaoIBPT.Caption), ROTINA_MENU_TAB_AUXILIAR_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONTA_CORRENTE_ID, Trim(BrBtnContaCorrente.Caption),  ROTINA_MENU_TAB_AUXILIAR_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_FORMA_PAGTO_ID,    Trim(BrBtnFormaPagto.Caption),     ROTINA_MENU_TAB_AUXILIAR_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONDICAO_PAGTO_ID, Trim(BrBtnCondicaoPagto.Caption),  ROTINA_MENU_TAB_AUXILIAR_ID);

  // Movimentações

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_VENDA_PDV_ID,     Trim(BrBtnVenda.Caption),     ROTINA_MENU_MOVIMENTO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_ORCAMENTO_PDV_ID, Trim(BrBtnOrcamento.Caption), ROTINA_MENU_MOVIMENTO_ID);

  // Caixa

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ABRIR_CAIXA_PDV_ID,     Trim(BrBtnAbrirCaixa.Caption),     ROTINA_MENU_CAIXA_PDV_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ENCERRAR_CAIXA_PDV_ID,  Trim(BrBtnEncerrarCaixa.Caption),  ROTINA_MENU_CAIXA_PDV_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERENCIAR_CAIXA_PDV_ID, Trim(BrBtnGerenciarCaixa.Caption), ROTINA_MENU_CAIXA_PDV_ID);
end;

procedure TfrmPrinc.RibbonApplicationMenuClick(Sender: TdxCustomRibbon;
  var AHandled: Boolean);
begin
  RbnBackstageView.ActiveTab := RbnBackstageViewConfig;
end;

procedure TfrmPrinc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := ShowConfirm('Deseja SAIR do Sistema?');
end;

procedure TfrmPrinc.mnRegistroEstacaoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGrRegistroEstacao');
end;

procedure TfrmPrinc.nmEfetuarLogoffClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmEfetuarLogin');
end;

end.
