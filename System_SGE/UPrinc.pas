unit UPrinc;

interface

uses
  StdCtrls, Buttons,

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
    nmCotacaoCompra: TMenuItem;
    N22: TMenuItem;
    nmPlanoConta: TMenuItem;
    nmCentroCusto: TMenuItem;
    nmRegistroEstacao: TMenuItem;
    nmCartaCorrecaoNFe: TMenuItem;
    nmEfetuarLogoff: TMenuItem;
    N110: TMenuItem;
    nmRequisicaoCompra: TMenuItem;
    nmConverterReqAutCompra: TMenuItem;
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
    procedure nmPerfilAcessoClick(Sender: TObject);
    procedure nmCotacaoCompraClick(Sender: TObject);
    procedure nmRegistroEstacaoClick(Sender: TObject);
    procedure nmEfetuarLogoffClick(Sender: TObject);
    procedure nmRequisicaoCompraClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure nmConverterReqAutCompraClick(Sender: TObject);
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
  UGeRequisicaoCompra,

  // Financeiro
  UGeContasAPagar,
  UGeContasAReceber,
  UGeCaixa,
  UGeFluxoCaixa,

  // Relatórios
  UfrmRelEstoque,
  UGeCotacaoCompra;

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
  if GetPermissaoRotinaSistema(ROTINA_CAD_CLIENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeCliente');
end;

procedure TfrmPrinc.btnContaAReceberClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_CONTA_ARECEBER_ID, True) then
    MostrarControleContasAReceber(Self);
end;

procedure TfrmPrinc.btnContaAPagarClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_CONTA_APAGAR_ID, True) then
    MostrarControleContasAPagar(Self);
end;

procedure TfrmPrinc.nmFornecedorClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_FORNECEDOR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeFornecedor');
end;

procedure TfrmPrinc.btnSairClick(Sender: TObject);
begin
  if ShowConfirm('Deseja SAIR do Sistema?') then
    Application.Terminate;
end;

procedure TfrmPrinc.btnProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_PRODUTO_ID, True) then
    MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmPrinc.nmEntradaProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_ENT_PRODUTO_ID, True) then
    MostrarControleCompras(Self);
end;

procedure TfrmPrinc.nmAjusteManualClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_ENT_AJUSTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeEstoqueAjusteManual');
end;

procedure TfrmPrinc.nmKardexClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_ENT_KARDEX_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmKardex');
end;

procedure TfrmPrinc.nmVendaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_VENDA_ID, True) then
    MostrarControleVendas(Self);
end;

procedure TfrmPrinc.nmRelatorioClienteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_CLIENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeClienteImpressao');
end;

procedure TfrmPrinc.nmRelatorioFornecedorClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_FORNECEDOR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeFornecedorImpressao');
end;

procedure TfrmPrinc.nmRelatorioProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_PRODUTO_ID, True) then
    FormFunction.ShowFormReport(Self, 'frmRelProdutos', 'QuickRep1');
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
end;

procedure TfrmPrinc.mnBancoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_BANCO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeBancos');
end;

procedure TfrmPrinc.nmTiposdeLogradourosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TIPO_LOG_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeTipoLogradouro');
end;

procedure TfrmPrinc.nmEstadosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_ESTADO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeEstado');
end;

procedure TfrmPrinc.nmCidadesClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CIDADE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeCidade');
end;

procedure TfrmPrinc.nmDistritosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_DISTRITO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeDistrito');
end;

procedure TfrmPrinc.nmBairrosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_BAIRRO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeBairro');
end;

procedure TfrmPrinc.nmLogradourosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_LOGRADOURO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeLogradouro');
end;

procedure TfrmPrinc.nmGruposProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_GRUPO_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeGrupoProduto');
end;

procedure TfrmPrinc.nmSecaoProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_SECAO_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeSecaoProduto');
end;

procedure TfrmPrinc.nmUnidadeClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_UNIDA_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeUnidade');
end;

procedure TfrmPrinc.nmTabelaCFOPClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CFOP_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeTabelaCFOP');
end;

procedure TfrmPrinc.nmFormaPagtoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_FORMA_PAGTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeFormaPagto');
end;

procedure TfrmPrinc.nmVendedorClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_VENDEDOR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeVendedor');
end;

procedure TfrmPrinc.nmCondicaoPagtoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONDICAO_PAGTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeCondicaoPagto');
end;

procedure TfrmPrinc.nmConfigurarNFeACBrClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
  if not GetPermititEmissaoNFe( GetEmpresaIDDefault ) then
    ShowInformation('Empresa selecionada não habilitada para emissão de NF-e.' + #13 + 'Favor entrar em contato com suporte.')
  else
    ConfigurarNFeACBr( GetEmpresaIDDefault );
end;

procedure TfrmPrinc.nmTipoDespesaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TIPO_DESPESA_ID, True) then
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

  if not DataBaseOnLine then
    Exit;

  stbMain.Panels.Items[2].Text  := Format('Licenciado a empresa %s, %s', [gLicencaSistema.Empresa, sCNPJ]);
  nmUsuarioAlterarSenha.Caption := Format('Alteração de Senha (%s)', [GetUserApp]);

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

  if not SetAcessoEstacao(DMBusiness.IdIPWatch.LocalName) then
  begin
    ShowError('Estação de trabalho não registrada no sistema!');

    menuCadastro.Enabled     := False;
    menuEntrada.Enabled      := False;
    menuMovimentacao.Enabled := False;
    menuNotaFiscal.Enabled   := False;
    menuConsulta.Enabled     := False;
    menuFinanceiro.Enabled   := False;
    menuRelatorio.Enabled    := False;

    btnEmpresa.Enabled := False;
    btnCliente.Enabled := False;
    btnProduto.Enabled := False;
    btnFornecedor.Enabled := False;
    btnEstoque.Enabled    := False;
    btnVenda.Enabled      := False;
    btnTesouraria.Enabled    := False;
    btnContaAPagar.Enabled   := False;
    btnContaAReceber.Enabled := False;
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

  if not DataBaseOnLine then
    Exit;

  // (INICIO) Configurar Legendas de acordo com o segmento

  nmGruposProduto.Caption    := 'Grupos de ' + StrDescricaoProduto;
  nmSecaoProduto.Caption     := 'Seções de ' + StrDescricaoProduto;
  nmProduto.Caption          := StrDescricaoProduto;
  btnProduto.Caption         := StrDescricaoProduto;
  nmRelatorioProduto.Caption := StrDescricaoProduto;
  mnRelatorioEntradaProduto.Caption := StrDescricaoProduto;

  nmRequisicaoCliente.Visible     := (GetSegmentoID(GetEmpresaIDDefault) <= SEGMENTO_VAREJO_SERVICOS_ID);
  nmCotacaoCompra.Visible         := (GetSegmentoID(GetEmpresaIDDefault) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID]);
  nmRequisicaoCompra.Visible      := nmCotacaoCompra.Visible;
  nmConverterReqAutCompra.Visible := nmCotacaoCompra.Visible;
  nmAutorizacaoCompra.Visible     := nmCotacaoCompra.Visible;

  // (FINAL) Configurar Legendas de acordo com o segmento

  FAcesso := False;
  SetSistema(gSistema.Codigo, gSistema.Nome, GetVersion);
  RegistrarRotinasMenu;
end;

procedure TfrmPrinc.nmGerarBoletoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_GERAR_BOLETO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeGerarBoleto');
end;

procedure TfrmPrinc.nmRemessaBoletoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_GERAR_REMESSA_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeRemessaBoleto');
end;

procedure TfrmPrinc.nmRetornoBoletoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_PROCESSA_RETORN_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeRetornoBoleto');
end;

procedure TfrmPrinc.nmPromocoesClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_PROMOCAO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGePromocao');
end;

procedure TfrmPrinc.nmContaCorrenteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONTA_CORRENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeContaCorrente');
end;

procedure TfrmPrinc.nmGerenciaCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_GERENCIAR_CAIXA_ID, True) then
    MostrarTabelaCaixa(Self);
end;

procedure TfrmPrinc.nmAberturaCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_ABRIR_CAIXA_ID, True) then
    if ( AbrirCaixa(Self, GetUserApp) ) then
      ShowInformation('Caixa aberto com sucesso!');
end;

procedure TfrmPrinc.nmEncerramentoCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_ENCERRAR_CAIXA_ID, True) then
    if ( FecharCaixa(Self, GetUserApp) ) then
      ShowInformation('Caixa encerrado com sucesso!');
end;

procedure TfrmPrinc.nmFluxoDeCaixaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_TESOURARIA_ID, True) then
    MostrarTabelaFluxoCaixas(Self);
end;

procedure TfrmPrinc.nmRelatorioFaturamentoVendasClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_FATURA_VENDA_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeVendaImpressao');
end;

procedure TfrmPrinc.nmFabricanteProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_FABRI_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeFabricante');
end;

procedure TfrmPrinc.nmUsuarioAlterarSenhaClick(Sender: TObject);
begin
  if ( FormFunction.ShowModalForm(Self, 'frmGrUsuarioAlterarSenha') ) then
    Self.Update;
end;

procedure TfrmPrinc.nmExportarNFeGeradaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_NFE_EXPORTAR_NFE_ID, True) then
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
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_VENDA_ID, True) then
    FormFunction.ShowModalForm(Self, 'FrmGeVendaItemPesquisa');
end;

procedure TfrmPrinc.nmRotatividadeClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_ROTATIVIDAD_ID, True) then
    FormFunction.ShowModalForm(Self, 'FrmGeProdutoRotatividadePRC');
end;

procedure TfrmPrinc.nmInutilizarNumeroNFeClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_NFE_INUTILIZAR_NRO_ID, True) then
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
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_ESTOQUE_MIN_ID, True) then
    FormFunction.ShowModalForm(Self, 'FrmGeProdutoEstoqueMinimo');
end;

procedure TfrmPrinc.nmConsultarLoteNFeClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_NFE_CONSULTA_RECIBO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeConsultarLoteNFe_v2');
end;

procedure TfrmPrinc.nmConsultarCNPJClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_CNPJ_ID, True) then
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
  if GetPermissaoRotinaSistema(ROTINA_MOV_REQUISICAO_ID, True) then
    MostrarControleRequisicaoCliente(Self);
end;

procedure TfrmPrinc.nmExportarChaveNFeGeradaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_NFE_EXPORTAR_CHAVE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeExportarChaveNFeGerada');
end;

procedure TfrmPrinc.nmDownloadNFeGeradaClick(Sender: TObject);
begin
  ;
end;

procedure TfrmPrinc.RegistrarRotinasMenu;
begin
  // Menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CADASTRO_ID,   'Cadastro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_ENTRADA_ID,    'Entradas',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_MOVIMENTO_ID,  'Movimentações', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_NOTAFISCAL_ID, 'Notas Fiscais', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CONSULTA_ID,   'Consultas',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_FINANCEIRO_ID, 'Financeiro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_RELATORIO_ID,  'Relatórios', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_AJUDA_ID,      'Ajuda',      EmptyStr);

  // Sub-menus
  
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_TAB_AUXILIAR_ID,    'Tabelas Auxiliares',        ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ESTOQUE_ID,     'Relatórios de Estoque',     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ENTRADA_ID,     'Relatórios de Entradas',    ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FATURAMENTO_ID, 'Relatórios de Faturamento', ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FINANCEIRO_ID,  'Relatórios do Financeiro',  ROTINA_MENU_RELATORIO_ID);

  // Cadastros

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_EMP_ID, Trim(nmConfiguracaoEmpresa.Caption), ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_NFE_ID, Trim(nmConfigurarNFeACBr.Caption),   ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_AMB_ID, Trim(nmConfigurarAmbiente.Caption),  ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_GERAR_SENH_ID, Trim(nmSenhaAutorizacao.Caption),    ROTINA_MENU_CADASTRO_ID);

  // Entradas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_ENT_AJUSTE_ID, Trim(nmAjusteManual.Caption), ROTINA_MENU_ENTRADA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_ENT_KARDEX_ID, Trim(nmKardex.Caption),       ROTINA_MENU_ENTRADA_ID);

  // Notas Fiscais

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_INUTILIZAR_NRO_ID,  Trim(nmInutilizarNumeroNFe.Caption),    ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_CONSULTA_RECIBO_ID, Trim(nmConsultarLoteNFe.Caption),       ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_EXPORTAR_NFE_ID,    Trim(nmExportarNFeGerada.Caption),      ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_EXPORTAR_CHAVE_ID,  Trim(nmExportarChaveNFeGerada.Caption), ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_GERAR_ARQUI_NFC_ID, Trim(nmGerarArquivoNFC.Caption),        ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_DOWNLOAD_NFE_ID,    Trim(nmDownloadNFeGerada.Caption),      ROTINA_MENU_NOTAFISCAL_ID);

  // Consultas
  
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_CNPJ_ID,        Trim(nmConsultarCNPJ.Caption),    ROTINA_MENU_CONSULTA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_VENDA_ID,       Trim(nmVendaIemPesquisa.Caption), ROTINA_MENU_CONSULTA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_ROTATIVIDAD_ID, Trim(nmRotatividade.Caption),     ROTINA_MENU_CONSULTA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_ESTOQUE_MIN_ID, Trim(nmEstoqueMinimo.Caption),    ROTINA_MENU_CONSULTA_ID);

  // Financeiro
  
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ABRIR_CAIXA_ID,     Trim(nmAberturaCaixa.Caption),            ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ENCERRAR_CAIXA_ID,  Trim(nmEncerramentoCaixa.Caption),        ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERAR_BOLETO_ID,    Trim(nmGerarBoleto.Caption),              ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERAR_REMESSA_ID,   Trim(nmRemessaBoleto.Caption),            ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_PROCESSA_RETORN_ID, Trim(nmRetornoBoleto.Caption),            ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_QUITAR_APAGAR_ID,   Trim(nmQuitarContaAPagar_Lote.Caption),   ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_QUITAR_ARECEBER_ID, Trim(nmQuitarContaAReceber_Lote.Caption), ROTINA_MENU_FINANCEIRO_ID);

  // Relatórios

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_CLIENTE_ID,      Trim(nmRelatorioCliente.Caption),        ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FORNECEDOR_ID,   Trim(nmRelatorioFornecedor.Caption),     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_PRODUTO_ID,      Trim(nmRelatorioProduto.Caption),        ROTINA_MENU_RELATORIO_ID);

  // Relatórios -> Faturamento

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FATURA_VENDA_ID, Trim(nmRelatorioFaturamentoVendas.Caption), ROTINA_MENU_REL_FATURAMENTO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FATURA_OS_ID,    Trim(nmRelatorioFaturamentoOS.Caption),     ROTINA_MENU_REL_FATURAMENTO_ID);

  // Relatórios -> Entradas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_ENTRADA_PROD_ID, Trim(mnRelatorioEntradaProduto.Caption), ROTINA_MENU_REL_ENTRADA_ID);

  // Relatórios -> Financeiro

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_APAGAR_ID,   Trim(nmRelatorioFinanceiroContasAPagar.Caption),   ROTINA_MENU_REL_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_ARECEBER_ID, Trim(nmRelatorioFinanceiroContasAReceber.Caption), ROTINA_MENU_REL_FINANCEIRO_ID);
end;

procedure TfrmPrinc.nmGerarArquivoNFCClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_NFE_GERAR_ARQUI_NFC_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeExportarNFC');
end;

procedure TfrmPrinc.nmRelatorioFinanceiroContasAReceberClick(
  Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_ARECEBER_ID, True) then
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
  if GetPermissaoRotinaSistema(ROTINA_MOV_AUTORIZACAO_ID, True) then
    MostrarControleAutorizacao(Self);
end;

procedure TfrmPrinc.nmRelatorioFinanceiroContasAPagarClick(
  Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_APAGAR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeContasAPagarImpressao');
end;

procedure TfrmPrinc.nmEntradaServicoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_ENT_SERVICO_ID, True) then
    MostrarControleCompraServicos(Self);
end;

procedure TfrmPrinc.mnRelatorioEntradaProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_ENTRADA_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeEntradaImpressao');
end;

procedure TfrmPrinc.nmQuitarContaAPagar_LoteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_QUITAR_APAGAR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeContasAPagarQuitar');
end;

procedure TfrmPrinc.nmPerfilAcessoClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGrUsuarioPerfil');
end;

procedure TfrmPrinc.nmCotacaoCompraClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_COTACAO_ID, True) then
    MostrarControleCotacao(Self);
end;

procedure TfrmPrinc.nmRegistroEstacaoClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmGrRegistroEstacao');
end;

procedure TfrmPrinc.nmEfetuarLogoffClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'FrmEfetuarLogin');
end;

procedure TfrmPrinc.nmRequisicaoCompraClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_REQUISICAO_CMP_ID, True) then
    MostrarControleRequisicao(Self);
end;

procedure TfrmPrinc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := ShowConfirm('Deseja SAIR do Sistema?');
end;

procedure TfrmPrinc.nmConverterReqAutCompraClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_CONVERT_REQ_AUT_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeRequisicaoCompraPesquisa');
end;

end.
