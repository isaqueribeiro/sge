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
    BcBarMainMenu: TBcBarMainMenu;
    stbMain: TStatusBar;
    menuCadastro: TMenuItem;
    nmCliente: TMenuItem;
    nmProduto: TMenuItem;
    nmVendedor: TMenuItem;
    mnBanco: TMenuItem;
    menuEntrada: TMenuItem;
    menuFinanceiro: TMenuItem;
    nmContasAPagar: TMenuItem;
    nmContasAReceber: TMenuItem;
    nmDeposito: TMenuItem;
    nmFluxoDeCaixa: TMenuItem;
    menuRelatorio: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    nmUsuario: TMenuItem;
    nmEntradaProduto: TMenuItem;
    nmEmpresa: TMenuItem;
    spbBarraAcessoRapido: TSpeedBar;
    btnEmpresa: TRxSpeedButton;
    btnContaAReceber: TRxSpeedButton;
    btnFornecedor: TRxSpeedButton;
    btnTesouraria: TRxSpeedButton;
    btnContaAPagar: TRxSpeedButton;
    btnProduto: TRxSpeedButton;
    btnCliente: TRxSpeedButton;
    SpeedbarSection1: TSpeedbarSection;
    menuSobre: TMenuItem;
    pnlMain: TPanel;
    nmFornecedor: TMenuItem;
    imgFundo: TImage;
    nmTipoDespesa: TMenuItem;
    btnSair: TRxSpeedButton;
    N3: TMenuItem;
    btnEstoque: TRxSpeedButton;
    ppEstoque: TPopupMenu;
    popEntradaProduto: TMenuItem;
    nmAjusteManual: TMenuItem;
    nmKardex: TMenuItem;
    popAjusteEstoque: TMenuItem;
    popKardex: TMenuItem;
    menuMovimentacao: TMenuItem;
    nmVenda: TMenuItem;
    nmRelatorioCliente: TMenuItem;
    nmRelatorioFornecedor: TMenuItem;
    nmRelatorioProduto: TMenuItem;
    mnRelatorioFinanceiro: TMenuItem;
    nmRelatorioFinanceiroContasAPagar: TMenuItem;
    nmRelatorioFinanceiroContasAReceber: TMenuItem;
    btnVenda: TRxSpeedButton;
    nmAbout: TMenuItem;
    nmRelatorioFaturamentoVendas: TMenuItem;
    mnTabelasAuxiliares: TMenuItem;
    nmEstados: TMenuItem;
    nmCidades: TMenuItem;
    nmBairros: TMenuItem;
    nmTiposdeLogradouros: TMenuItem;
    nmLogradouros: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    nmDistritos: TMenuItem;
    nmGruposProduto: TMenuItem;
    nmSecaoProduto: TMenuItem;
    nmUnidade: TMenuItem;
    nmTributacao: TMenuItem;
    nmFormaPagto: TMenuItem;
    nmCondicaoPagto: TMenuItem;
    N6: TMenuItem;
    nmTabelaCFOP: TMenuItem;
    nmSenhaAutorizacao: TMenuItem;
    nmConfigurarNFeACBr: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    menuNotaFiscal: TMenuItem;
    nmEnviarLoteNFe: TMenuItem;
    N10: TMenuItem;
    nmGerarBoleto: TMenuItem;
    nmCancelarNFe: TMenuItem;
    nmInutilizarNumeroNFe: TMenuItem;
    SpeedbarSection2: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    nmImprimirDANFE: TMenuItem;
    N11: TMenuItem;
    nmRemessaBoleto: TMenuItem;
    nmRetornoBoleto: TMenuItem;
    nmPromocoes: TMenuItem;
    nmContaCorrente: TMenuItem;
    nmAberturaCaixa: TMenuItem;
    N12: TMenuItem;
    nmEncerramentoCaixa: TMenuItem;
    nmGerenciaCaixa: TMenuItem;
    nmRelatorioFaturamento: TMenuItem;
    imgEmpresa: TImage;
    ProductName: TLabel;
    Copyright: TLabel;
    FileDescription: TLabel;
    Version: TLabel;
    dxSkinController: TdxSkinController;
    nmUsuarioAlterarSenha: TMenuItem;
    nmFabricanteProduto: TMenuItem;
    N13: TMenuItem;
    nmExportarNFeGerada: TMenuItem;
    mnRelatorioEstoque: TMenuItem;
    mnRelatorioEstoqueDemanda: TMenuItem;
    mnRelatorioEstoqueProduto: TMenuItem;
    nmVendaIemPesquisa: TMenuItem;
    menuConsulta: TMenuItem;
    nmRotatividade: TMenuItem;
    nmConfiguracaoEmpresa: TMenuItem;
    nmEstoqueMinimo: TMenuItem;
    N14: TMenuItem;
    nmConsultarLoteNFe: TMenuItem;
    nmConsultarCNPJ: TMenuItem;
    N15: TMenuItem;
    nmConfigurarAmbiente: TMenuItem;
    N16: TMenuItem;
    nmRequisicaoCliente: TMenuItem;
    N9: TMenuItem;
    EvAcessUserPrincipal: TEvUserAccess;
    nmOS: TMenuItem;
    nmRelatorioFaturamentoOS: TMenuItem;
    nmExportarChaveNFeGerada: TMenuItem;
    nmDownloadNFeGerada: TMenuItem;
    nmGerarArquivoNFC: TMenuItem;
    N17: TMenuItem;
    nmCarregarLicenca: TMenuItem;
    N18: TMenuItem;
    nmAutorizacaoCompra: TMenuItem;
    N19: TMenuItem;
    nmQuitarContaAPagar_Lote: TMenuItem;
    nmQuitarContaAReceber_Lote: TMenuItem;
    nmPerfilAcesso: TMenuItem;
    N20: TMenuItem;
    nmEntradaServico: TMenuItem;
    N21: TMenuItem;
    popEntradaServico: TMenuItem;
    mnRelatorioEntrada: TMenuItem;
    mnRelatorioEntradaProduto: TMenuItem;
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnContaAReceberClick(Sender: TObject);
    procedure btnContaAPagarClick(Sender: TObject);
    procedure nmFornecedorClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure nmEntradaProdutoClick(Sender: TObject);
    procedure nmAjusteManualClick(Sender: TObject);
    procedure nmKardexClick(Sender: TObject);
    procedure nmVendaClick(Sender: TObject);
    procedure nmRelatorioClienteClick(Sender: TObject);
    procedure nmRelatorioFornecedorClick(Sender: TObject);
    procedure nmRelatorioProdutoClick(Sender: TObject);
    procedure nmAboutClick(Sender: TObject);
    procedure mnBancoClick(Sender: TObject);
    procedure nmTiposdeLogradourosClick(Sender: TObject);
    procedure nmEstadosClick(Sender: TObject);
    procedure nmCidadesClick(Sender: TObject);
    procedure nmDistritosClick(Sender: TObject);
    procedure nmBairrosClick(Sender: TObject);
    procedure nmLogradourosClick(Sender: TObject);
    procedure nmGruposProdutoClick(Sender: TObject);
    procedure nmSecaoProdutoClick(Sender: TObject);
    procedure nmUnidadeClick(Sender: TObject);
    procedure nmTabelaCFOPClick(Sender: TObject);
    procedure nmFormaPagtoClick(Sender: TObject);
    procedure nmVendedorClick(Sender: TObject);
    procedure nmCondicaoPagtoClick(Sender: TObject);
    procedure nmConfigurarNFeACBrClick(Sender: TObject);
    procedure nmTipoDespesaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure nmGerarBoletoClick(Sender: TObject);
    procedure nmRemessaBoletoClick(Sender: TObject);
    procedure nmRetornoBoletoClick(Sender: TObject);
    procedure nmPromocoesClick(Sender: TObject);
    procedure nmContaCorrenteClick(Sender: TObject);
    procedure nmGerenciaCaixaClick(Sender: TObject);
    procedure nmAberturaCaixaClick(Sender: TObject);
    procedure nmEncerramentoCaixaClick(Sender: TObject);
    procedure nmFluxoDeCaixaClick(Sender: TObject);
    procedure nmRelatorioFaturamentoVendasClick(Sender: TObject);
    procedure nmFabricanteProdutoClick(Sender: TObject);
    procedure nmUsuarioAlterarSenhaClick(Sender: TObject);
    procedure nmExportarNFeGeradaClick(Sender: TObject);
    procedure mnRelatorioEstoqueProdutoClick(Sender: TObject);
    procedure mnRelatorioEstoqueDemandaClick(Sender: TObject);
    procedure nmVendaIemPesquisaClick(Sender: TObject);
    procedure nmRotatividadeClick(Sender: TObject);
    procedure nmInutilizarNumeroNFeClick(Sender: TObject);
    procedure nmConfiguracaoEmpresaClick(Sender: TObject);
    procedure nmEstoqueMinimoClick(Sender: TObject);
    procedure nmConsultarLoteNFeClick(Sender: TObject);
    procedure nmConsultarCNPJClick(Sender: TObject);
    procedure nmUsuarioClick(Sender: TObject);
    procedure nmRequisicaoClienteClick(Sender: TObject);
    procedure nmExportarChaveNFeGeradaClick(Sender: TObject);
    procedure nmDownloadNFeGeradaClick(Sender: TObject);
    procedure nmGerarArquivoNFCClick(Sender: TObject);
    procedure nmRelatorioFinanceiroContasAReceberClick(Sender: TObject);
    procedure nmConfigurarAmbienteClick(Sender: TObject);
    procedure nmCarregarLicencaClick(Sender: TObject);
    procedure nmAutorizacaoCompraClick(Sender: TObject);
    procedure nmRelatorioFinanceiroContasAPagarClick(Sender: TObject);
    procedure nmEntradaServicoClick(Sender: TObject);
    procedure mnRelatorioEntradaProdutoClick(Sender: TObject);
    procedure nmQuitarContaAPagar_LoteClick(Sender: TObject);
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

  // Estoque, Entrada e Saída
  UGeProduto,
  UGeVenda,
  UGeEntradaEstoque,
  UGeRequisicaoCliente,
  UGeAutorizacaoCompra,

  // Financeiro
  UGeContasAPagar,
  UGeContasAReceber,
  UGeCaixa,
  UGeFluxoCaixa,

  // Relatórios
  UfrmRelEstoque;

{$R *.dfm}

procedure TfrmPrinc.btnEmpresaClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGeEmpresa');
end;

procedure TfrmPrinc.btnClienteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCliente');
end;

procedure TfrmPrinc.btnContaAReceberClick(Sender: TObject);
begin
  MostrarControleContasAReceber(Self);
end;

procedure TfrmPrinc.btnContaAPagarClick(Sender: TObject);
begin
  MostrarControleContasAPagar(Self);
end;

procedure TfrmPrinc.nmFornecedorClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeFornecedor');
end;

procedure TfrmPrinc.btnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja SAIR do Sistema?', 'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
    Application.Terminate;
end;

procedure TfrmPrinc.btnProdutoClick(Sender: TObject);
begin
  MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmPrinc.nmEntradaProdutoClick(Sender: TObject);
begin
  MostrarControleCompras(Self);
end;

procedure TfrmPrinc.nmAjusteManualClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeEstoqueAjusteManual');
end;

procedure TfrmPrinc.nmKardexClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmKardex');
end;

procedure TfrmPrinc.nmVendaClick(Sender: TObject);
begin
  MostrarControleVendas(Self);
end;

procedure TfrmPrinc.nmRelatorioClienteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeClienteImpressao');
end;

procedure TfrmPrinc.nmRelatorioFornecedorClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelFornec', 'qckrp');
end;

procedure TfrmPrinc.nmRelatorioProdutoClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelProdutos', 'QuickRep1');
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
end;

procedure TfrmPrinc.mnBancoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeBancos');
end;

procedure TfrmPrinc.nmTiposdeLogradourosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeTipoLogradouro');
end;

procedure TfrmPrinc.nmEstadosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeEstado');
end;

procedure TfrmPrinc.nmCidadesClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCidade');
end;

procedure TfrmPrinc.nmDistritosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeDistrito');
end;

procedure TfrmPrinc.nmBairrosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeBairro');
end;

procedure TfrmPrinc.nmLogradourosClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeLogradouro');
end;

procedure TfrmPrinc.nmGruposProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeGrupoProduto');
end;

procedure TfrmPrinc.nmSecaoProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeSecaoProduto');
end;

procedure TfrmPrinc.nmUnidadeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeUnidade');
end;

procedure TfrmPrinc.nmTabelaCFOPClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeTabelaCFOP');
end;

procedure TfrmPrinc.nmFormaPagtoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeFormaPagto');
end;

procedure TfrmPrinc.nmVendedorClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeVendedor');
end;

procedure TfrmPrinc.nmCondicaoPagtoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeCondicaoPagto');
end;

procedure TfrmPrinc.nmConfigurarNFeACBrClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    ConfigurarNFeACBr;
end;

procedure TfrmPrinc.nmTipoDespesaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeTipoDespesa');
end;

procedure TfrmPrinc.FormActivate(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := 'CNPJ: ' + StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := 'CPF: ' + StrFormatarCpf(gLicencaSistema.CNPJ);

  stbMain.Panels.Items[2].Text  := Format('Licenciado a empresa %s, %s', [gLicencaSistema.Empresa, sCNPJ]);
  nmUsuarioAlterarSenha.Caption := Format('Alteração de Senha (%s)', [GetUserApp]);

  EvAcessUserPrincipal.UserID := GetUserFunctionID;

  RegistrarControleAcesso(Self, EvAcessUserPrincipal);
  GetControleAcesso(Self, EvAcessUserPrincipal);

  Case GetUserFunctionID of
    FUNCTION_USER_ID_DIRETORIA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_DIRETORIA;

    FUNCTION_USER_ID_GERENTE_VND :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_VND;
        btnTesouraria.Enabled    := False;
        btnContaAReceber.Enabled := False;
        btnContaAPagar.Enabled   := False;
      end;

    FUNCTION_USER_ID_GERENTE_FIN :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_FIN;

    FUNCTION_USER_ID_VENDEDOR :
      begin
        EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_VENDEDOR;

        mnRelatorioFinanceiro.Enabled := False;
        nmRelatorioProduto.Enabled    := False;
        mnRelatorioEstoque.Enabled    := False;

        btnEmpresa.Enabled       := False;
        btnProduto.Enabled       := False;
        btnFornecedor.Enabled    := False;
        btnEstoque.Enabled       := False;
        btnTesouraria.Enabled    := False;
        btnContaAReceber.Enabled := False;
        btnContaAPagar.Enabled   := False;
      end;

    FUNCTION_USER_ID_GERENTE_ADM :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_GERENTE_ADM;

    FUNCTION_USER_ID_CAIXA       :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_CAIXA;

    FUNCTION_USER_ID_AUX_FINANC1 :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_AUX_FINANC1;

    FUNCTION_USER_ID_AUX_FINANC2 :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_AUX_FINANC2;

    FUNCTION_USER_ID_SUPERV_CX  :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SUPERV_CX;

    FUNCTION_USER_ID_ESTOQUISTA :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_ESTOQUISTA;

    FUNCTION_USER_ID_SUPORTE_TI :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SUPORTE_TI;

    FUNCTION_USER_ID_SYSTEM_ADM :
      EvAcessUserPrincipal.UserID := FUNCTION_USER_ID_SYSTEM_ADM;
  else
    ShowWarning('Falta cruzar nova função com UserID!');
    Application.Terminate;
  end;

  Self.WindowState := wsMaximized;

  nmRequisicaoCliente.Enabled := GetEstoqueSateliteEmpresa( GetEmpresaIDDefault );

  if GetUserUpdatePassWord then
    nmUsuarioAlterarSenhaClick( nmUsuarioAlterarSenha );

  if not DMBusiness.LiberarUsoLicenca(GetDateDB, True) then
  begin
    menuCadastro.Enabled     := False;
    menuEntrada.Enabled      := False;
    menuMovimentacao.Enabled := False;
    menuFinanceiro.Enabled   := False;
  end;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  sFileImage : String;
begin
  Self.Tag := SISTEMA_GESTAO;
  
  gSistema.Codigo := Self.Tag;
  gSistema.Nome   := Self.Caption;

  Self.Caption           := Application.Title + ' [ v' + GetExeVersion + ' ]';
  Self.Version.Caption   := 'Versão ' + GetExeVersion;
  Self.Copyright.Caption := GetCopyright;

  BcBarMainMenu.Bar.BarCaption.Caption := Application.Title;

  // Carregar Imagem de Fundo da Tele Principal

  sFileImage := ExtractFilePath(Application.ExeName) + FILE_WALLPAPER;

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

  // (INICIO) Configurar Legendas de acordo com o segmento

  nmGruposProduto.Caption    := 'Grupos de ' + StrDescricaoProduto;
  nmSecaoProduto.Caption     := 'Seções de ' + StrDescricaoProduto;
  nmProduto.Caption          := StrDescricaoProduto;
  btnProduto.Caption         := StrDescricaoProduto;
  nmRelatorioProduto.Caption := StrDescricaoProduto;
  mnRelatorioEntradaProduto.Caption := StrDescricaoProduto;

  nmRequisicaoCliente.Visible := (GetSegmentoID(GetEmpresaIDDefault) <= SEGMENTO_VAREJO_SERVICOS_ID);

  // (FINAL) Configurar Legendas de acordo com o segmento

  FAcesso := False;
  SetSistema(gSistema.Codigo, gSistema.Nome, GetVersion);
  RegistrarRotinasMenu;
end;

procedure TfrmPrinc.nmGerarBoletoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeGerarBoleto');
end;

procedure TfrmPrinc.nmRemessaBoletoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeRemessaBoleto');
end;

procedure TfrmPrinc.nmRetornoBoletoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeRetornoBoleto');
end;

procedure TfrmPrinc.nmPromocoesClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGePromocao');
end;

procedure TfrmPrinc.nmContaCorrenteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeContaCorrente');
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

procedure TfrmPrinc.nmFluxoDeCaixaClick(Sender: TObject);
begin
  MostrarTabelaFluxoCaixas(Self);
end;

procedure TfrmPrinc.nmRelatorioFaturamentoVendasClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeVendaImpressao');
end;

procedure TfrmPrinc.nmFabricanteProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeFabricante');
end;

procedure TfrmPrinc.nmUsuarioAlterarSenhaClick(Sender: TObject);
begin
  if ( FormFunction.ShowModalForm(Self, 'frmGrUsuarioAlterarSenha') ) then
    Self.Update;
end;

procedure TfrmPrinc.nmExportarNFeGeradaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeExportarNFeGerada');
end;

procedure TfrmPrinc.mnRelatorioEstoqueProdutoClick(Sender: TObject);
begin
  FormFunction.ShowFormReport(Self, 'frmRelProdutos', 'qckrp');
end;

procedure TfrmPrinc.mnRelatorioEstoqueDemandaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmRelEstoque');
end;

procedure TfrmPrinc.nmVendaIemPesquisaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGeVendaItemPesquisa');
end;

procedure TfrmPrinc.nmRotatividadeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGeProdutoRotatividadePRC');
end;

procedure TfrmPrinc.nmInutilizarNumeroNFeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeInutilizarNumeroNFe');
end;

procedure TfrmPrinc.nmConfiguracaoEmpresaClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGeConfiguracaoEmpresa');
end;

procedure TfrmPrinc.nmEstoqueMinimoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGeProdutoEstoqueMinimo');
end;

procedure TfrmPrinc.nmConsultarLoteNFeClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeConsultarLoteNFe_v2');
end;

procedure TfrmPrinc.nmConsultarCNPJClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGrConsultarCNJP');
end;

procedure TfrmPrinc.nmUsuarioClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGrUsuario');
end;

procedure TfrmPrinc.nmRequisicaoClienteClick(Sender: TObject);
begin
  MostrarControleRequisicaoCliente(Self);
end;

procedure TfrmPrinc.nmExportarChaveNFeGeradaClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeExportarChaveNFeGerada');
end;

procedure TfrmPrinc.nmDownloadNFeGeradaClick(Sender: TObject);
begin
  ;
end;

procedure TfrmPrinc.RegistrarRotinasMenu;
begin
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CADASTRO_ID,   'Cadastro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_ENTRADA_ID,    'Entradas',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_MOVIMENTO_ID,  'Movimentações', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_NOTAFISCAL_ID, 'Notas Fiscais', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CONSULTA_ID,   'Consultas',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_FINANCEIRO_ID, 'Financeiro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_RELATORIO_ID,  'Relatórios', EmptyStr);

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_TAB_AUXILIAR_ID,    'Tabelas Auxiliares',        ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ESTOQUE_ID,     'Relatórios de Estoque',     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FATURAMENTO_ID, 'Relatórios de Faturamento', ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FINANCEIRO_ID,  'Relatórios do Financeiro',  ROTINA_MENU_RELATORIO_ID);

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_EMP_ID, Trim(nmConfiguracaoEmpresa.Caption), ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_NFE_ID, Trim(nmConfigurarNFeACBr.Caption),   ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_AMB_ID, Trim(nmConfigurarAmbiente.Caption),  ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_GERAR_SENH_ID, Trim(nmSenhaAutorizacao.Caption),    ROTINA_MENU_CADASTRO_ID);
end;

procedure TfrmPrinc.nmGerarArquivoNFCClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeExportarNFC');
end;

procedure TfrmPrinc.nmRelatorioFinanceiroContasAReceberClick(
  Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeContasAReceberImpressao');
end;

procedure TfrmPrinc.nmConfigurarAmbienteClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGrConfigurarAmbiente');
end;

procedure TfrmPrinc.nmCarregarLicencaClick(Sender: TObject);
var
  sCNPJ : String;
begin
  if DMBusiness.opdLicenca.Execute then
  begin
    DMBusiness.ValidarLicenca(DMBusiness.opdLicenca.FileName, sCNPJ);
    if (sCNPJ <> gLicencaSistema.CNPJ) then
      ShowStop('Licença', 'Arquivo de licença inválido para o cliente!' + #13 + 'Favor entrar em contato com suporte.')
    else
    begin
      DMBusiness.LimparLicenca;
      DMBusiness.CarregarLicenca(DMBusiness.opdLicenca.FileName);

      ShowInformation('Licença', 'Arquivo para licença de uso do software carregado com sucesso.');
    end;
  end;
end;

procedure TfrmPrinc.nmAutorizacaoCompraClick(Sender: TObject);
begin
  MostrarControleAutorizacao(Self);
end;

procedure TfrmPrinc.nmRelatorioFinanceiroContasAPagarClick(
  Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeContasAPagarImpressao');
end;

procedure TfrmPrinc.nmEntradaServicoClick(Sender: TObject);
begin
  MostrarControleCompraServicos(Self);
end;

procedure TfrmPrinc.mnRelatorioEntradaProdutoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeEntradaImpressao');
end;

procedure TfrmPrinc.nmQuitarContaAPagar_LoteClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeContasAPagarQuitar');
end;

end.
