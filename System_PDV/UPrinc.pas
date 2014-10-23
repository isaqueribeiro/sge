unit UPrinc;

interface

uses
  EUserAcs, StdCtrls, Buttons,
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, BarMenus, RxSpeedBar, RXCtrls, ExtCtrls, jpeg,

  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSpringTime,
  dxSkinSummer2008, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver,
  dxSkinStardust, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxLookAndFeels, dxSkinsForm, dxGDIPlusClasses;

type
  TfrmPrinc = class(TForm)
    BrMainMenu: TBcBarMainMenu;
    stbMain: TStatusBar;
    menuCadastro: TMenuItem;
    nmCliente: TMenuItem;
    nmProduto: TMenuItem;
    nmVendedor: TMenuItem;
    menuCaixa: TMenuItem;
    N2: TMenuItem;
    nmUsuario: TMenuItem;
    nmEmpresa: TMenuItem;
    spbBarraAcessoRapido: TSpeedBar;
    btnProduto: TRxSpeedButton;
    btnCliente: TRxSpeedButton;
    SpeedbarSection1: TSpeedbarSection;
    menuSobre: TMenuItem;
    pnlMain: TPanel;
    imgFundo: TImage;
    btnSair: TRxSpeedButton;
    N3: TMenuItem;
    menuMovimentacao: TMenuItem;
    btnVenda: TRxSpeedButton;
    nmAbout: TMenuItem;
    mnTabelasAuxiliares: TMenuItem;
    N4: TMenuItem;
    nmTributacao: TMenuItem;
    nmFormaPagto: TMenuItem;
    nmCondicaoPagto: TMenuItem;
    nmSenhaAutorizacao: TMenuItem;
    nmConfigurarNFeACBr: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    SpeedbarSection2: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    nmContaCorrente: TMenuItem;
    nmAberturaCaixa: TMenuItem;
    nmEncerramentoCaixa: TMenuItem;
    nmGerenciaCaixa: TMenuItem;
    imgEmpresa: TImage;
    ProductName: TLabel;
    Copyright: TLabel;
    FileDescription: TLabel;
    Version: TLabel;
    dxSkinController: TdxSkinController;
    nmUsuarioAlterarSenha: TMenuItem;
    nmConfiguracaoEmpresa: TMenuItem;
    nmConfigurarAmbiente: TMenuItem;
    N16: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    N9: TMenuItem;
    nmVenda: TMenuItem;
    nmOrcamento: TMenuItem;
    nmPerfilAcesso: TMenuItem;
    mnRegistroEstacao: TMenuItem;
    N1: TMenuItem;
    nmEfetuarLogoff: TMenuItem;
    N5: TMenuItem;
    procedure btnSairClick(Sender: TObject);
    procedure nmAboutClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nmGerenciaCaixaClick(Sender: TObject);
    procedure nmAberturaCaixaClick(Sender: TObject);
    procedure nmEncerramentoCaixaClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
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
  private
    { Private declarations }
    FAcesso : Boolean;
    procedure RegistrarRotinasMenu;
  public
    { Public declarations }
  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses
  // Conexão e Controles Aplicação
  UDMBusiness,
  UDMNFe,
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
  if Application.MessageBox('Deseja SAIR do Sistema?', 'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
    Application.Terminate;
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
end;

procedure TfrmPrinc.FormActivate(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(GetEmpresaIDDefault) ) then
    sCNPJ := ' CPF.: ' + StrFormatarCnpj(GetEmpresaIDDefault)
  else
    sCNPJ := ' CNPJ.: ' + StrFormatarCpf(GetEmpresaIDDefault);

  stbMain.Panels.Items[2].Text  := 'Licenciado a empresa ' + GetEmpresaNomeDefault;
  nmUsuarioAlterarSenha.Caption := Format('Alteração de Senha (%s)', [GetUserApp]);

  Self.WindowState := wsMaximized;

  if not DMBusiness.LiberarUsoLicenca(GetDateDB, True) then
  begin
    menuCadastro.Enabled     := False;
    menuMovimentacao.Enabled := False;
    menuCaixa.Enabled        := False;
    btnVenda.Enabled         := False;
  end;

  if not SetAcessoEstacao(DMBusiness.IdIPWatch.LocalName) then
  begin
    ShowError('Estação de trabalho não registrada no sistema!');
    menuCadastro.Enabled     := False;
    menuMovimentacao.Enabled := False;
    menuCaixa.Enabled        := False;
    spbBarraAcessoRapido.Enabled := False;
  end;

  if GetUserUpdatePassWord then
    nmUsuarioAlterarSenhaClick( nmUsuarioAlterarSenha );
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  sFileImage : String;
begin
  Self.Tag := SISTEMA_PDV;
  
  gSistema.Codigo := Self.Tag;
  gSistema.Nome   := Self.Caption;

  Self.Caption           := Application.Title + ' [ v' + GetExeVersion + ' ]';
  Self.Version.Caption   := 'Versão ' + GetExeVersion;
  Self.Copyright.Caption := GetCopyright;

  BrMainMenu.Bar.BarCaption.Caption := Application.Title;

  // Carregar Imagem de Fundo da Tele Principal

  sFileImage := ExtractFilePath(Application.ExeName) + 'Logo_Principal.jpg';

  if ( FileExists(sFileImage) ) then
  begin
    imgFundo.Picture.LoadFromFile(sFileImage);
    imgFundo.Center := True;
  end
  else
  begin
    imgEmpresa.Visible  := False;
    ProductName.Visible := False;
    Version.Visible     := False;
    FileDescription.Visible := False;
    Copyright.Visible       := False;
  end;

  FAcesso := False;
  SetSistema(gSistema.Codigo, gSistema.Nome, GetVersion);
  RegistrarRotinasMenu;
end;

procedure TfrmPrinc.nmGerenciaCaixaClick(Sender: TObject);
begin
  MostrarTabelaCaixa(Self);
end;

procedure TfrmPrinc.nmAberturaCaixaClick(Sender: TObject);
begin
  if ( AbrirCaixa(Self, GetUserApp) ) then
    ShowInformation('Caixa aberto com sucesso!');
end;

procedure TfrmPrinc.nmEncerramentoCaixaClick(Sender: TObject);
begin
  if ( FecharCaixa(Self, GetUserApp) ) then
    ShowInformation('Caixa encerrado com sucesso!');
end;

procedure TfrmPrinc.btnVendaClick(Sender: TObject);
begin
  if ( nmVenda.Visible and nmVenda.Enabled ) then
    nmVenda.Click;
end;

procedure TfrmPrinc.RxSpeedButton1Click(Sender: TObject);
begin
  if ( nmOrcamento.Visible and nmOrcamento.Enabled ) then
    nmOrcamento.Click;
end;

procedure TfrmPrinc.btnProdutoClick(Sender: TObject);
begin
  if ( nmProduto.Visible and nmProduto.Enabled ) then
    nmProduto.Click;
end;

procedure TfrmPrinc.btnClienteClick(Sender: TObject);
begin
  if ( nmCliente.Visible and nmCliente.Enabled ) then
    nmCliente.Click;
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
      ConfigurarNFeACBr;
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

procedure TfrmPrinc.RegistrarRotinasMenu;
begin
  // Menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CADASTRO_ID,  'Cadastro',      EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_MOVIMENTO_ID, 'Movimentações', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CAIXA_PDV_ID, 'Caixa',         EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_AJUDA_ID,     'Ajuda',         EmptyStr);

  // Sub-menus
  
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_TAB_AUXILIAR_ID, 'Tabelas Auxiliares', ROTINA_MENU_CADASTRO_ID);

  // Cadastros

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_EMP_ID, Trim(nmConfiguracaoEmpresa.Caption), ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_NFE_ID, Trim(nmConfigurarNFeACBr.Caption),   ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_AMB_ID, Trim(nmConfigurarAmbiente.Caption),  ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_GERAR_SENH_ID, Trim(nmSenhaAutorizacao.Caption),    ROTINA_MENU_CADASTRO_ID);

  // Cadastros -> Tabelas Auxiliares

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_TRIBUTACAO_ID,     Trim(nmTributacao.Caption),    ROTINA_MENU_TAB_AUXILIAR_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONTA_CORRENTE_ID, Trim(nmContaCorrente.Caption), ROTINA_MENU_TAB_AUXILIAR_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_FORMA_PAGTO_ID,    Trim(nmFormaPagto.Caption),    ROTINA_MENU_TAB_AUXILIAR_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONDICAO_PAGTO_ID, Trim(nmCondicaoPagto.Caption), ROTINA_MENU_TAB_AUXILIAR_ID);

  // Movimentações

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_VENDA_PDV_ID,     Trim(nmVenda.Caption),     ROTINA_MENU_MOVIMENTO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_ORCAMENTO_PDV_ID, Trim(nmOrcamento.Caption), ROTINA_MENU_MOVIMENTO_ID);

  // Caixa

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ABRIR_CAIXA_PDV_ID,     Trim(nmAberturaCaixa.Caption),      ROTINA_MENU_CAIXA_PDV_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ENCERRAR_CAIXA_PDV_ID,  Trim(nmEncerramentoCaixa.Caption),  ROTINA_MENU_CAIXA_PDV_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERENCIAR_CAIXA_PDV_ID, Trim(nmGerenciaCaixa.Caption),      ROTINA_MENU_CAIXA_PDV_ID);
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
