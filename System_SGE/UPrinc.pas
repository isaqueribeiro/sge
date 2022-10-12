unit UPrinc;

interface

uses
  System.Threading, StdCtrls, Buttons, //ShellAPI,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, jpeg, dxRibbonForm, dxRibbonBackstageView,
  cxGraphics, dxGDIPlusClasses, cxLookAndFeelPainters, cxButtons, cxLookAndFeels,
  dxBar, cxControls, cxClasses, dxRibbon, dxRibbonCustomizationForm, cxContainer,
  cxEdit, dxGallery, dxGalleryControl, dxRibbonBackstageViewGalleryControl, cxLabel,
  dxRibbonSkins, dxStatusBar,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinsdxStatusBarPainter,
  dxSkinsdxRibbonPainter, dxSkinsdxBarPainter, dxSkinsForm, Vcl.AppEvnts, dxSkinsDefaultPainters;

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
    PnlDockReqAlmox: TPanel;
    SptDockReqAlmox: TSplitter;
    BrManager: TdxBarManager;
    RbnTabPrincipal: TdxRibbonTab;
    Ribbon: TdxRibbon;
    BrMngPrincipalCad: TdxBar;
    BrBtnEmpresa: TdxBarLargeButton;
    BrBtnCliente: TdxBarLargeButton;
    BrBtnProduto: TdxBarLargeButton;
    BrBtnFornecedor: TdxBarLargeButton;
    BrMngPrincipalMov: TdxBar;
    RbnTabCadastro: TdxRibbonTab;
    BrBtnEntrada: TdxBarLargeButton;
    RbnTabMovimento: TdxRibbonTab;
    BrMngPrincipalFin: TdxBar;
    BrBtnTesouraria: TdxBarLargeButton;
    BrBtnContaAPagar: TdxBarLargeButton;
    BrBtnContaAReceber: TdxBarLargeButton;
    BrPpEntrada: TdxBarPopupMenu;
    RbnTabNota: TdxRibbonTab;
    RbnTabConsulta: TdxRibbonTab;
    RbnTabFinanceiro: TdxRibbonTab;
    RbnTabRelatorio: TdxRibbonTab;
    RbnTabAjuda: TdxRibbonTab;
    BrPpTabelaAuxiliar: TdxBarPopupMenu;
    BrBtnConfigurarEmpresa: TdxBarLargeButton;
    BrBtnConfigurarNFe: TdxBarLargeButton;
    BrBtnConfigurarAmbiente: TdxBarLargeButton;
    BrBtnPerfilAcesso: TdxBarLargeButton;
    BrBtnUsuario: TdxBarLargeButton;
    BrMngCadastroCad: TdxBar;
    BrBtnTabelaAuxiliar: TdxBarLargeButton;
    BrBtnEstado: TdxBarLargeButton;
    BrBtnCidade: TdxBarLargeButton;
    BrBtnDistrito: TdxBarLargeButton;
    BrBtnBairro: TdxBarLargeButton;
    BrBtnTipoLogradouro: TdxBarLargeButton;
    BrBtnLogradouro: TdxBarLargeButton;
    BrBtnVendedor: TdxBarLargeButton;
    BrBrntBanco: TdxBarLargeButton;
    BrBtnTabelaProduto: TdxBarLargeButton;
    BrPpTabelaProduto: TdxBarPopupMenu;
    BrBtnTabelaCFOP: TdxBarLargeButton;
    BrBtnTabelaCNAE: TdxBarLargeButton;
    BrBtnTabelaIBPT: TdxBarLargeButton;
    BrBtnCondicaoPagto: TdxBarLargeButton;
    BrBtnFormaPagto: TdxBarLargeButton;
    BrBtnContaCorrente: TdxBarLargeButton;
    BrBtnPlanoConta: TdxBarLargeButton;
    BrBtnTipoDespesa: TdxBarLargeButton;
    BrBtnCentroCusto: TdxBarLargeButton;
    BrBtnPromocao: TdxBarLargeButton;
    RbnTabEntrada: TdxRibbonTab;
    BrBtnGrupoProduto: TdxBarLargeButton;
    BrBtnSecaoProduto: TdxBarLargeButton;
    BrBtnFabricante: TdxBarLargeButton;
    BrBtnUnidadeCompra: TdxBarLargeButton;
    BrMngEntradaCusto: TdxBar;
    BrBtnEntradaProduto: TdxBarLargeButton;
    BrBtnEntradaAjuste: TdxBarLargeButton;
    BrBtnEntradaKardex: TdxBarLargeButton;
    BrBtnEntradaServico: TdxBarLargeButton;
    BrBtnEntradaEstoque: TdxBarLargeButton;
    BrPpEntradaEstoque: TdxBarPopupMenu;
    BrBtnAlterarSenha: TdxBarLargeButton;
    BrBtnEfetuarLogoff: TdxBarLargeButton;
    BrMngMovimentoFat: TdxBar;
    BrBtnVenda: TdxBarLargeButton;
    BrBtnOrdemServico: TdxBarLargeButton;
    BrBtnRequisicaoCliente: TdxBarLargeButton;
    BrMngMovimentoCmp: TdxBar;
    BrBtnCotacaoCompra: TdxBarLargeButton;
    BrBtnRequisicaoCompra: TdxBarLargeButton;
    BrBtnConverterRequisicaoCompra: TdxBarLargeButton;
    BrBtnAutorizacaoCompra: TdxBarLargeButton;
    BrPpRequisicaoCompra: TdxBarPopupMenu;
    BrBtnRequisicaoCompraPopup: TdxBarLargeButton;
    BrBtnSolicitacaoCompra: TdxBarLargeButton;
    BrPpRequisicaoAlmox: TdxBarPopupMenu;
    BrMngNotaFiscal: TdxBar;
    BrBtnNotaFiscalInutilizar: TdxBarLargeButton;
    BrBtnNotaFiscalRecibo: TdxBarLargeButton;
    BrBtnNotaFiscalCartaCorrecao: TdxBarLargeButton;
    BrBtnNotaFiscalExportar: TdxBarLargeButton;
    BrBtnNotaFiscalDownload: TdxBarLargeButton;
    BrPpNotaFiscalExportar: TdxBarPopupMenu;
    BrBtnNotaFiscalExportarNF: TdxBarLargeButton;
    BrBtnNotaFiscalExportarChave: TdxBarLargeButton;
    BrBtnNotaFiscalExportarNFC: TdxBarLargeButton;
    BrMngConsultaGeral: TdxBar;
    BrMngConsultaEstatistica: TdxBar;
    BrBtnConsultaCNPJ: TdxBarLargeButton;
    BrBtnConsultaVenda: TdxBarLargeButton;
    BrBtnConsultaRotatividadeProduto: TdxBarLargeButton;
    BrBtnConsultaEstoqueMinimo: TdxBarLargeButton;
    BrMngFinanceiroCaixa: TdxBar;
    BrBtnAbrirCaixa: TdxBarLargeButton;
    BrBtnEncerrarCaixa: TdxBarLargeButton;
    BrBtnGerenciarCaixa: TdxBarLargeButton;
    BrMngFinanceiroBoleto: TdxBar;
    BrBtnGerarBoleto: TdxBarLargeButton;
    BrBtnGerarRemessaBoleto: TdxBarLargeButton;
    BrBtnProcessarRetornoBoleto: TdxBarLargeButton;
    BrBtnQuitarLote: TdxBarLargeButton;
    BrBtnQuitarAPagarLote: TdxBarLargeButton;
    BrBtnQuitarAReceberLote: TdxBarLargeButton;
    BrPpFinanceiroQuitarLote: TdxBarPopupMenu;
    BrMngRelatorioCadastro: TdxBar;
    BrBtnRelatorioCliente: TdxBarLargeButton;
    BrBtnRelatorioFornecedor: TdxBarLargeButton;
    BrBtnRelatorioProduto: TdxBarLargeButton;
    BrMngRelatorioOperacional: TdxBar;
    BrBtnRelatorioEntrada: TdxBarLargeButton;
    BrPpRelatorioEstoque: TdxBarPopupMenu;
    BrBtnRelatorioEstoque: TdxBarLargeButton;
    BrBtnRelatorioEstoqueProd: TdxBarLargeButton;
    BrBtnRelatorioFaturamento: TdxBarLargeButton;
    BrBtnRelatorioFinanceiro: TdxBarLargeButton;
    BrBtnRelatorioFaturamentoVnd: TdxBarLargeButton;
    BrBtnRelatorioFaturamentoOrd: TdxBarLargeButton;
    BrBtnRelatorioFinanceiroAP: TdxBarLargeButton;
    BrBtnRelatorioFinanceiroAR: TdxBarLargeButton;
    BrPpRelatorioFaturamento: TdxBarPopupMenu;
    BrPpRelatorioFinanceiro: TdxBarPopupMenu;
    BrBtnRelatorioFinanceiroMV: TdxBarLargeButton;
    BrMngRelatorioGerencial: TdxBar;
    BrMngAjudaDiversos: TdxBar;
    BrBtnCarregarLicenca: TdxBarLargeButton;
    BrBtnRegistroEstacao: TdxBarLargeButton;
    BrBtnSobre: TdxBarLargeButton;
    BrBtnNotaFiscalComplementar: TdxBarLargeButton;
    BrBtnRelatorioAutorizacaoEntrada: TdxBarLargeButton;
    BrBtnRelatorioEntradaVenda: TdxBarLargeButton;
    BrBtnRelatorioEntradaSaida: TdxBarLargeButton;
    BrPpRelatorioEntradaSaida: TdxBarPopupMenu;
    BrBtnSenhaAutorizacao: TdxBarLargeButton;
    stbMain: TdxStatusBar;
    BrMnQuickAccessToolbar: TdxBar;
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
    RbnBackstageGalleryAcesso: TdxRibbonBackstageViewGalleryControl;
    dxRibbonBackstageViewGalleryGroup2: TdxRibbonBackstageViewGalleryGroup;
    dxRibbonBackstageViewGalleryItem1: TdxRibbonBackstageViewGalleryItem;
    dxRibbonBackstageViewGalleryItem2: TdxRibbonBackstageViewGalleryItem;
    dxRibbonBackstageViewGalleryItem3: TdxRibbonBackstageViewGalleryItem;
    TmrMonitorar: TTimer;
    RbnBackstageViewBackup: TdxRibbonBackstageViewTabSheet;
    LblBackstageViewBackup: TcxLabel;
    RbnBackstageGalleryBackup: TdxRibbonBackstageViewGalleryControl;
    dxRibbonBackstageViewGalleryGroup3: TdxRibbonBackstageViewGalleryGroup;
    dxRibbonBackstageViewGalleryItem4: TdxRibbonBackstageViewGalleryItem;
    BrBtnGerarDanfeXML: TdxBarLargeButton;
    BrBtnTipoReceita: TdxBarLargeButton;
    BrBtnControleCheque: TdxBarLargeButton;
    BrBtnUpgrade: TdxBarLargeButton;
    BrBtnTeamViewer: TdxBarLargeButton;
    BrBtnDownloadTeamViewer: TdxBarLargeButton;
    BrBtnExecuteTeamViewer: TdxBarLargeButton;
    BrPpTeamViewer: TdxBarPopupMenu;
    tmrAutoUpgrade: TTimer;
    BrBtnTestesGerais: TdxBarLargeButton;
    BrBtnRelatorioResultadoExercicio: TdxBarLargeButton;
    lblAberta: TLabel;
    TmrAlertaCliente: TTimer;
    BrBtnRelatorioFinanceiroAPxAR: TdxBarLargeButton;
    ApplicationEvents: TApplicationEvents;
    BrBtnVendaMobile: TdxBarLargeButton;
    procedure tmrAutoUpgradeTimer(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnContaAReceberClick(Sender: TObject);
    procedure btnContaAPagarClick(Sender: TObject);
    procedure nmFornecedorClick(Sender: TObject);
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
    procedure nmRegistroEstacaoClick(Sender: TObject);
    procedure nmEfetuarLogoffClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure nmCartaCorrecaoNFeClick(Sender: TObject);
    procedure nmCentroCustoClick(Sender: TObject);
    procedure nmPlanoContaClick(Sender: TObject);
    procedure nmEstoqueApropriadoClick(Sender: TObject);
    procedure nmInventarioMaterialClick(Sender: TObject);
    procedure mnRelatorioEstoqueProdutoClick(Sender: TObject);
    procedure mnRelatorioEstoqueApropriacaoClick(Sender: TObject);
    procedure mnRelatorioRequsicaoAlmoxClick(Sender: TObject);
    procedure BrBtnRelatorioEstoqueReqClick(Sender: TObject);
    procedure RbnBackstageGalleryConfigItemClick(Sender: TObject;
      AItem: TdxRibbonBackstageViewGalleryItem);
    procedure RbnBackstageGalleryAcessoItemClick(Sender: TObject;
      AItem: TdxRibbonBackstageViewGalleryItem);
    procedure RbnBackstageGalleryBackupItemClick(Sender: TObject;
      AItem: TdxRibbonBackstageViewGalleryItem);
    procedure RibbonApplicationMenuClick(Sender: TdxCustomRibbon;
      var AHandled: Boolean);
    procedure BrBtnNotaFiscalComplementarClick(Sender: TObject);
    procedure BrBtnQuitarAReceberLoteClick(Sender: TObject);
    procedure BrBtnTabelaIBPTClick(Sender: TObject);
    procedure BrBtnGerarDanfeXMLClick(Sender: TObject);
    procedure BrBtnTipoReceitaClick(Sender: TObject);
    procedure BrBtnRelatorioFinanceiroMVClick(Sender: TObject);
    procedure BrBtnControleChequeClick(Sender: TObject);
    procedure BrBtnUpgradeClick(Sender: TObject);
    procedure BrBtnDownloadTeamViewerClick(Sender: TObject);
    procedure BrBtnExecuteTeamViewerClick(Sender: TObject);
    procedure BrBtnTestesGeraisClick(Sender: TObject);
    procedure BrBtnRelatorioResultadoExercicioClick(Sender: TObject);
    procedure TmrAlertaClienteTimer(Sender: TObject);
    procedure BrBtnRelatorioAutorizacaoEntradaClick(Sender: TObject);
    procedure BrBtnRelatorioFinanceiroAPxARClick(Sender: TObject);
    procedure ApplicationEventsModalBegin(Sender: TObject);
    procedure ApplicationEventsModalEnd(Sender: TObject);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure BrBtnVendaMobileClick(Sender: TObject);
  private
    { Private declarations }
    FAcesso : Boolean;
    procedure RegistrarRotinasMenu;
    procedure AutoUpdateSystem;
    procedure GetInformacoesGerais;
	  procedure OcultarTabs;
  public
    { Public declarations }
    procedure AlertarCliente;
    procedure ConfigurarRotuloBotoes;
    procedure Notificar;
  end;

(*
  Tabelas:
  - TBEMPRESA

  Views:

  Procedures:

*)

var
  frmPrinc: TfrmPrinc;

implementation

uses
    System.StrUtils
  , System.Notification

  // Conexão e Controles Aplicação
  , UDMRecursos
  , UDMBusiness
  , UDMNFe
  , UFuncoes
  , UConstantesDGE

  , View.AutoUpgrade
  , View.Abertura
  , View.Esmaecer

  // Movimentação
  , UGeRequisicaoCliente
  , View.AutorizacaoCompra
  , View.RequisicaoCompra,

  // Estoque, Entrada e Saída
  View.Produto,
  UGeVenda,
  View.Entrada,

  // Financeiro
  View.ContaAPagar,
  View.ContaAReceber,
  UGeCaixa,
  UGeFluxoCaixa;

{$R *.dfm}

procedure TfrmPrinc.btnEmpresaClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'ViewEmpresa');
end;

procedure TfrmPrinc.AlertarCliente;
var
  tipoAlerta  : TTipoAlertaSistema;
  aFileAlerta : String;
  aTextoAlerta: TStringList;
  aNotificacao : TNotification;
begin
  aTextoAlerta := TStringList.Create;
  try
    lblAberta.Caption := EmptyStr;

    aTextoAlerta.Clear;
    aTextoAlerta.BeginUpdate;
    for tipoAlerta := Low(SYS_ALERTA_ARQUIVOS) to High(SYS_ALERTA_ARQUIVOS) do
    begin
      aFileAlerta := ExtractFilePath(ParamStr(0)) + SYS_ALERTA_ARQUIVOS[tipoAlerta];
      if FileExists(aFileAlerta) then
      begin
        aTextoAlerta.LoadFromFile(aFileAlerta);
        aTextoAlerta.Add(#13);
      end;
    end;
    aTextoAlerta.EndUpdate;

    lblAberta.Caption := Trim(aTextoAlerta.Text);
    lblAberta.Visible := Trim(lblAberta.Caption) <> EmptyStr;
    TmrAlertaCliente.Enabled := lblAberta.Visible;

    aTextoAlerta.Text := aTextoAlerta.Text.Replace('=', '').Replace(#13#13, #13).Replace(#$D#$A#$D#$A, #$D#$A);
    aTextoAlerta.Text := aTextoAlerta.Text.Replace(#$D#$A#$D#$A#$D#$A, #$D#$A#$D#$A);

    if (Trim(aTextoAlerta.Text) <> EmptyStr) then
    begin
      aNotificacao := NotificationCenter.CreateNotification;

      aNotificacao.Name      := SGE_NOTIFICAR_LICENCA;
      aNotificacao.Title     := 'Licença de Uso do ' + ProductName.Caption;
      aNotificacao.AlertBody := Trim(aTextoAlerta.Text);

      NotificarUsuario(aNotificacao);
    end;
  finally
    aTextoAlerta.Free;

    if Assigned(aNotificacao) then
      aNotificacao.Free;
  end;
end;

procedure TfrmPrinc.ApplicationEventsActivate(Sender: TObject);
begin
  Application.BringToFront;
end;

procedure TfrmPrinc.ApplicationEventsModalBegin(Sender: TObject);
begin
  if Self.Showing then
    if not TViewEsmaecer.GetInstance(Self).Showing then
      TViewEsmaecer.GetInstance(Application).Show;
end;

procedure TfrmPrinc.ApplicationEventsModalEnd(Sender: TObject);
begin
  if Self.Showing then
    TViewEsmaecer.GetInstance(Self).Close;
end;

procedure TfrmPrinc.AutoUpdateSystem;
var
  aInterval : Cardinal;
  aTask : ITask;
begin
  aInterval := (1000 * 60) * 15; // 15 minutos

  if (tmrAutoUpgrade.Interval <> aInterval) then
  begin
    tmrAutoUpgrade.Enabled  := False;
    tmrAutoUpgrade.Interval := aInterval;
    tmrAutoUpgrade.Enabled  := True;

    // Thread
    aTask := TTask.Create(procedure ()
      begin
        ExcluirArquivosTemporarios;
        AtivarUpgradeAutomatico;
      end);
     aTask.Start;
  end;
end;

procedure TfrmPrinc.BrBtnControleChequeClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_CONTROLE_CHEQUE_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewCheque');
end;

procedure TfrmPrinc.BrBtnDownloadTeamViewerClick(Sender: TObject);
begin
  ExecuteResource(Handle, DOWNLOAD_URL_REMOTE_ACCESS);
end;

procedure TfrmPrinc.BrBtnExecuteTeamViewerClick(Sender: TObject);
var
  aArquivo : String;
begin
  aArquivo := ExtractFilePath(Application.ExeName) + FILE_REMOTE_ACCESS;
  if FileExists(aArquivo) then
    ExecuteResource(Handle, aArquivo)
  else
    ShowWarning(Format('O arquivo ''%s'' não fora localizado.'#13#13'Favor comunicar ao suporte.', [aArquivo]));
end;

procedure TfrmPrinc.BrBtnGerarDanfeXMLClick(Sender: TObject);
var
  sNomeArquivoXML,
  sEmitente      ,
  sDestinatario  ,
  sRecibo   ,
  sProtocolo,
  sChave    : String;
  dDataHoraEmissao : TDateTime;
  bNotaValida : Boolean;
  sSerieNFe  : String;
  iNumeroNFe ,
  iModeloNFe ,
  iVersaoNFe : Integer;
  tTipoNota  : TTipoNF;
  cValorProdutoNF : Currency;
begin
  if DMNFe.opdNotas.Execute then
  begin
    DMNFe.ImprimirArquivoNFeDANFE(gUsuarioLogado.Empresa, DMNFe.opdNotas.FileName
      , sNomeArquivoXML
      , sEmitente
      , sDestinatario
      , sRecibo
      , sProtocolo
      , sChave
      , dDataHoraEmissao
      , bNotaValida
      , sSerieNFe
      , iNumeroNFe
      , iModeloNFe
      , iVersaoNFe
      , tTipoNota
      , cValorProdutoNF
    );
  end;
end;

procedure TfrmPrinc.BrBtnNotaFiscalComplementarClick(Sender: TObject);
begin
  if not GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) then
    ShowWarning('Certificado não configurado nesta estação de trabalho para que esta rotina seja executada!')
  else
  if GetPermissaoRotinaSistema(ROTINA_NFE_COMPLEMENTAR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeNFComplementar');
end;

procedure TfrmPrinc.BrBtnQuitarAReceberLoteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_FIN_QUITAR_ARECEBER_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewQueryContaAReceber');
end;

procedure TfrmPrinc.BrBtnRelatorioAutorizacaoEntradaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_AUTOR_ENTRAD_ID, True) then
    ; //FormFunction.ShowModalForm(Self, 'frmGeResultadoExercicioImpressao');
end;

procedure TfrmPrinc.BrBtnRelatorioEstoqueReqClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_ESTOQUE_REQ_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeRequisicaoAlmoxImpressao');
end;

procedure TfrmPrinc.BrBtnRelatorioFinanceiroAPxARClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_APAG_AREC_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeContasAPagarAReceberImpressao');
end;

procedure TfrmPrinc.BrBtnRelatorioFinanceiroMVClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_MOV_FINANCE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeFluxoCaixaImpressao');
end;

procedure TfrmPrinc.BrBtnRelatorioResultadoExercicioClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_RESULT_EXERC_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeResultadoExercicioImpressao');
end;

procedure TfrmPrinc.BrBtnTabelaIBPTClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TABELA_IBPT_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewIBPT');
end;

procedure TfrmPrinc.BrBtnTestesGeraisClick(Sender: TObject);
begin
  FormFunction.ShowModalForm(Self, 'frmGeImportarNFE');
end;

procedure TfrmPrinc.BrBtnTipoReceitaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TIPO_RECEITA_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewTipoReceita');
end;

procedure TfrmPrinc.BrBtnUpgradeClick(Sender: TObject);
begin
  if DMBusiness.LiberarUsoLicenca(GetDateDB, True) then
    FormFunction.ShowModalForm(Self, 'FrmAutoUpgrade');
end;

procedure TfrmPrinc.BrBtnVendaMobileClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_VENDA_MOBILE_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewVendaMobile');
end;

procedure TfrmPrinc.btnClienteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CLIENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewCliente');
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
    FormFunction.ShowModalForm(Self, 'ViewFornecedor');
end;

procedure TfrmPrinc.btnProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_PRODUTO_ID, True) then
    MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmPrinc.ConfigurarRotuloBotoes;
begin
  BrBtnGrupoProduto.Caption      := 'Grupos de ' + StrDescricaoProduto;
  BrBtnSecaoProduto.Caption      := 'Seções de ' + StrDescricaoProduto;
  BrBtnTabelaProduto.Caption     := StrDescricaoProduto;
  BrBtnProduto.Caption           := StrDescricaoProduto;
  BrBtnRelatorioProduto.Caption  := StrDescricaoProduto;
  BrBtnRelatorioEntrada.Caption  := 'Entradas de ' + StrDescricaoProduto;
end;

procedure TfrmPrinc.RbnBackstageGalleryAcessoItemClick(
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

procedure TfrmPrinc.RbnBackstageGalleryBackupItemClick(Sender: TObject;
  AItem: TdxRibbonBackstageViewGalleryItem);
begin
  Case AItem.Index of
    0 :
      begin
        RbnBackstageView.ClosePopup;
        FormFunction.ShowModalForm(Self, 'frmGrConfigurarBackup');
      end;
  end;
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
    FormFunction.ShowModalForm(Self, 'frmGeProdutoKardex');
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
    FormFunction.ShowModalForm(Self, 'frmGeProdutoImpressao');
end;

procedure TfrmPrinc.nmAboutClick(Sender: TObject);
begin
  ShowAbout(Self);
  Application.BringToFront;
end;

procedure TfrmPrinc.mnBancoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_BANCO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewBanco');
end;

procedure TfrmPrinc.nmTiposdeLogradourosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TIPO_LOG_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewTipoLogradouro');
end;

procedure TfrmPrinc.nmEstadosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_ESTADO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewEstado');
end;

procedure TfrmPrinc.nmCidadesClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CIDADE_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewCidade');
end;

procedure TfrmPrinc.nmDistritosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_DISTRITO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewDistrito');
end;

procedure TfrmPrinc.nmBairrosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_BAIRRO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewBairro');
end;

procedure TfrmPrinc.nmLogradourosClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_LOGRADOURO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewLogradouro');
end;

procedure TfrmPrinc.nmGruposProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_GRUPO_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewGrupoProduto');
end;

procedure TfrmPrinc.nmSecaoProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_SECAO_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewSecaoProduto');
end;

procedure TfrmPrinc.nmUnidadeClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_UNIDA_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewUnidadeProduto');
end;

procedure TfrmPrinc.nmTabelaCFOPClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CFOP_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewCFOP');
end;

procedure TfrmPrinc.nmFormaPagtoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_FORMA_PAGTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewFormaPagto');
end;

procedure TfrmPrinc.nmVendedorClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_VENDEDOR_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewVendedor');
end;

procedure TfrmPrinc.Notificar;
begin
  DMNFe.AbrirEmitente( gUsuarioLogado.Empresa );

  BrBtnNotaFiscalInutilizar.Enabled    := GetEstacaoEmitiNFe(IfThen(gUsuarioLogado.Empresa = EmptyStr, GetEmpresaIDDefault, gUsuarioLogado.Empresa));
  BrBtnNotaFiscalRecibo.Enabled        := GetEstacaoEmitiNFe(IfThen(gUsuarioLogado.Empresa = EmptyStr, GetEmpresaIDDefault, gUsuarioLogado.Empresa));
  BrBtnNotaFiscalCartaCorrecao.Enabled := GetEstacaoEmitiNFe(IfThen(gUsuarioLogado.Empresa = EmptyStr, GetEmpresaIDDefault, gUsuarioLogado.Empresa));
  BrBtnNotaFiscalComplementar.Enabled  := GetEstacaoEmitiNFe(IfThen(gUsuarioLogado.Empresa = EmptyStr, GetEmpresaIDDefault, gUsuarioLogado.Empresa));

  AutoUpdateSystem;
  AlertarCliente;
end;

procedure TfrmPrinc.OcultarTabs;
var
  I : Integer;
begin
  for I := 1 to Ribbon.Tabs.Count - 2 do
    Ribbon.Tabs.Items[I].Visible := False;
end;

procedure TfrmPrinc.nmCondicaoPagtoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONDICAO_PAGTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewCondicaoPagto');
end;

procedure TfrmPrinc.nmConfigurarNFeACBrClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
  if not GetPermititEmissaoNFe( gUsuarioLogado.Empresa ) then
    ShowInformation('Empresa selecionada não habilitada para emissão de NF-e.' + #13 + 'Favor entrar em contato com suporte.')
  else
    ConfigurarNFeACBr( gUsuarioLogado.Empresa );
end;

procedure TfrmPrinc.nmTipoDespesaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_TIPO_DESPESA_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewTipoDespesa');
end;

procedure TfrmPrinc.FormActivate(Sender: TObject);
var
  sHostName ,
  aProcesso : String;
begin
  GetInformacoesGerais;
  Self.Notificar;

  if not DataBaseOnLine then
    Exit;

  Self.WindowState := wsMaximized;

  if not DMBusiness.LiberarUsoLicenca(GetDateDB, True) then
    OcultarTabs;

  sHostName := GetHostNameLocal;

  if not SetAcessoEstacao(sHostName) then
  begin
    RbnTabCadastro.Visible   := False;
    RbnTabEntrada.Visible    := False;
    RbnTabMovimento.Visible  := False;
    RbnTabNota.Visible       := False;
    RbnTabConsulta.Visible   := False;
    RbnTabFinanceiro.Visible := False;
    RbnTabRelatorio.Visible  := False;

    BrBtnEmpresa.Enabled := False;
    BrBtnCliente.Enabled := False;
    BrBtnProduto.Enabled := False;
    BrBtnFornecedor.Enabled        := False;
    BrBtnAutorizacaoCompra.Enabled := False;
    BrBtnEntrada.Enabled           := False;
    BrBtnVenda.Enabled             := False;
    BrBtnOrdemServico.Enabled      := False;
    BrBtnRequisicaoCliente.Enabled := False;
    BrBtnControleCheque.Enabled    := False;
    BrBtnTesouraria.Enabled    := False;
    BrBtnContaAPagar.Enabled   := False;
    BrBtnContaAReceber.Enabled := False;

    raise Exception.Create('Host -> ' + sHostName + #13 + 'Estação de trabalho não registrada no sistema!');
  end;

  if not gLicencaSistema.UsarSGE then
    try
      ShowError(
        'A licença atual não permite que este sistema seja utilizado!' + #13#13 +
        'Favor entrar em contato com o fornecedor do software.');
    finally
      Application.Terminate;

      // Remover processo da memória do Windows
      aProcesso := ParamStr(0);
      aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
      KillTask(aProcesso);
    end;

  // Verifica se a versão da aplicação é maior que a versão do banco
  // O procedimento "UpgradeDataBase()" atualiza a base de dados
  if (Trunc(gVersaoApp.VersionID / 100) > Trunc(GetVersionDB(gSistema.Codigo) / 100)) then
    try
      raise Exception.Create(
        'Esta versão da aplicação necessidade que a base de dados esteja atualizada!' + #13#13 +
        'Favor entrar em contato com o fornecedor do software.'
      );
    finally
      Application.Terminate;

      // Remover processo da memória do Windows
      aProcesso := ParamStr(0);
      aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
      KillTask(aProcesso);
    end;

  // Verifica se a versão do banco é maior que a versão da aplicação
  if (Trunc(GetVersionDB(gSistema.Codigo) / 100) > Trunc(gVersaoApp.VersionID / 100)) then
    raise Exception.Create('O sistema está desatualizado em relação à base de dados.' + #13 + 'Favor atualize seu sistema.');

  if gConfiguracoes.ConfigurarAmbiente then
    BrBtnConfigurarAmbiente.Click;
end;

procedure TfrmPrinc.FormCreate(Sender: TObject);
var
  sFileImage : String;
begin
  Self.Tag := SISTEMA_GESTAO_COM;

  gSistema.Codigo := Self.Tag;
  gSistema.Nome   := Self.Caption;

  Self.Caption             := Application.Title + ' [ v' + gVersaoApp.Version + ' ]';
  Self.ProductName.Caption := gPersonalizaEmpresa.InternalName;
  Self.FileDescription.Caption := gPersonalizaEmpresa.FileDescription;
  Self.Version.Caption     := 'Versão ' + gVersaoApp.Version;
  Self.Copyright.Caption   := gVersaoApp.Copyright;
  Self.DisableAero         := True;

  Ribbon.ActiveTab := RbnTabPrincipal;
  ConfigurarRotuloBotoes;

  // Carregar Imagem de Fundo da Tele Principal
  if GetCarregarPapelDeParedeLocal then
  begin
    //sFileImage := ExtractFilePath(Application.ExeName) + FILE_WALLPAPER;
    sFileImage := gPersonalizaEmpresa.FileNameImagePNG_Wallpaper;

    if ( FileExists(sFileImage) ) then
    begin
      imgFundo.Picture.LoadFromFile(sFileImage);
      imgFundo.Center := True;
    end;
  end;

  // Carregar Logotipo da Empresa
  if FileExists(gPersonalizaEmpresa.FileNameImagePNG_Company) then
    imgEmpresa.Picture.LoadFromFile(gPersonalizaEmpresa.FileNameImagePNG_Company);

  if not DataBaseOnLine then
    Exit;

  FAcesso := False;
  SetSistema(gSistema.Codigo, gSistema.Nome, gVersaoApp.Version);
  RegistrarRotinasMenu;
end;

procedure TfrmPrinc.GetInformacoesGerais;
var
  sCNPJ    ,
  aConexao : String;
begin
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := 'CNPJ: ' + StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := 'CPF: ' + StrFormatarCpf(gLicencaSistema.CNPJ);

  stbMain.Panels.Items[2].Text := Format('Licenciado a empresa %s, %s', [gLicencaSistema.Empresa, sCNPJ]);
  BrBtnAlterarSenha.Caption    := Format('Alteração de Senha (%s)', [gUsuarioLogado.Login]);
  BrBtnAlterarSenha.Hint       := Format('Alteração de Senha (%s)', [gUsuarioLogado.Login]);

  with DMBusiness do
    aConexao := fdConexao.Params.Values['Server'] + '/' + fdConexao.Params.Values['Port'] + ':' + fdConexao.Params.Values['Database'];

  stbMain.Panels[1].Text := AnsiLowerCase(gUsuarioLogado.Login + '@' + aConexao);

  if (gUsuarioLogado.Empresa <> StrOnlyNumbers(gLicencaSistema.CNPJ)) then
    stbMain.Panels.Items[2].Text := '[' + GetEmpresaNome(gUsuarioLogado.Empresa) + '] | ' + stbMain.Panels.Items[2].Text;
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
    FormFunction.ShowModalForm(Self, 'ViewPromocao');
end;

procedure TfrmPrinc.nmContaCorrenteClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CONTA_CORRENTE_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewContaCorrente');
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
    if ( FecharCaixa(Self, gUsuarioLogado.Login) ) then
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
    FormFunction.ShowModalForm(Self, 'ViewFabricanteProduto');
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
  if not GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) then
    ShowWarning('Certificado não configurado nesta estação de trabalho para que esta rotina seja executada!')
  else
  if GetPermissaoRotinaSistema(ROTINA_NFE_INUTILIZAR_NRO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeInutilizarNumeroNFe');
end;

procedure TfrmPrinc.nmConfiguracaoEmpresaClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'ViewConfiguracaoEmpresa');
end;

procedure TfrmPrinc.nmEstoqueMinimoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_ESTOQUE_MIN_ID, True) then
    FormFunction.ShowModalForm(Self, 'FrmGeProdutoEstoqueMinimo');
end;

procedure TfrmPrinc.nmConsultarLoteNFeClick(Sender: TObject);
begin
  if not GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) then
    ShowWarning('Certificado não configurado nesta estação de trabalho para que esta rotina seja executada!')
  else
  if GetPermissaoRotinaSistema(ROTINA_NFE_CONSULTA_RECIBO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewNFEConsultarLote');
end;

procedure TfrmPrinc.nmConsultarCNPJClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_CNPJ_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGrConsultarCNJP');
end;

procedure TfrmPrinc.nmUsuarioClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_USUARIO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGrUsuario');
end;

procedure TfrmPrinc.nmRequisicaoClienteClick(Sender: TObject);
begin
  if not GetEstoqueSateliteEmpresa(gUsuarioLogado.Empresa) then
    ShowInformation('Empresa não habilitada para trabalhar com estoque satélide de clientes.' + #13 +
      'Favor entrar em contato com suporte.')
  else
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
  if GetPermissaoRotinaSistema(ROTINA_NFE_DOWNLOAD_NFE_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeImportarNFE');
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
  (*
  Neste procedimento utiliza-se apenas rotinas que não vem da matriz "Padrão Cadastro".
  *)

  // Menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_RIBBON_ID,     '> Aplicação',   EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CADASTRO_ID,   'Cadastro',      EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_ENTRADA_ID,    'Entradas',      EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_MOVIMENTO_ID,  'Movimentações', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_NOTAFISCAL_ID, 'Notas Fiscais', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_CONSULTA_ID,   'Consultas',  EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_FINANCEIRO_ID, 'Financeiro', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_RELATORIO_ID,  'Relatórios', EmptyStr);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_AJUDA_ID,      'Ajuda',      EmptyStr);

  // Sub-menus

  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_TAB_AUXILIAR_ID,    'Tabelas Auxiliares',        ROTINA_MENU_CADASTRO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ENTRADA_ID,     'Relatórios de Entradas',    ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_ESTOQUE_ID,     'Relatórios de Estoque',     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FATURAMENTO_ID, 'Relatórios de Faturamento', ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_FINANCEIRO_ID,  'Relatórios do Financeiro',  ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_MENU, ROTINA_MENU_REL_GERENCIAL_ID,   'Relatórios Gerenciais',     ROTINA_MENU_RELATORIO_ID);

  // Menu Aplicação

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_EMP_ID, Trim(RbnBackstageViewConfig.Caption + ' -> ' + BrBtnConfigurarEmpresa.Caption),  ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_NFE_ID, Trim(RbnBackstageViewConfig.Caption + ' -> ' + BrBtnConfigurarNFe.Caption),      ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_CONFIG_AMB_ID, Trim(RbnBackstageViewConfig.Caption + ' -> ' + BrBtnConfigurarAmbiente.Caption), ROTINA_MENU_RIBBON_ID);

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_PERFIL_ID,     Trim(BrBtnPerfilAcesso.Caption),     ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_USUARIO_ID,    Trim(BrBtnUsuario.Caption),          ROTINA_MENU_RIBBON_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_GERAR_SENH_ID, Trim(BrBtnSenhaAutorizacao.Caption), ROTINA_MENU_RIBBON_ID);

  // Cadastros

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CAD_EMPRESA_ID, Trim(BrBtnEmpresa.Caption), ROTINA_MENU_CADASTRO_ID);

  // Entradas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_ENT_AJUSTE_ID, Trim(BrBtnEntradaEstoque.Caption + ' -> ' + BrBtnEntradaAjuste.Caption), ROTINA_MENU_ENTRADA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_ENT_KARDEX_ID, Trim(BrBtnEntradaEstoque.Caption + ' -> ' + BrBtnEntradaKardex.Caption), ROTINA_MENU_ENTRADA_ID);

  // Movimento

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_VENDA_ID,        Trim(BrBtnVenda.Caption),        ROTINA_MENU_MOVIMENTO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_VENDA_MOBILE_ID, Trim(BrBtnVendaMobile.Caption),  ROTINA_MENU_MOVIMENTO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_MOV_ORDEM_SERV_ID,   Trim(BrBtnOrdemServico.Caption), ROTINA_MENU_MOVIMENTO_ID);

  // Notas Fiscais

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_INUTILIZAR_NRO_ID,  Trim(BrBtnNotaFiscalInutilizar.Caption),    ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_CONSULTA_RECIBO_ID, Trim(BrBtnNotaFiscalRecibo.Caption),        ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_EXPORTAR_NFE_ID,    Trim(BrBtnNotaFiscalExportar.Caption + ' -> ' + BrBtnNotaFiscalExportarNF.Caption),    ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_EXPORTAR_CHAVE_ID,  Trim(BrBtnNotaFiscalExportar.Caption + ' -> ' + BrBtnNotaFiscalExportarChave.Caption), ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_GERAR_ARQUI_NFC_ID, Trim(BrBtnNotaFiscalExportar.Caption + ' -> ' + BrBtnNotaFiscalExportarNFC.Caption),   ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_DOWNLOAD_NFE_ID,    Trim(BrBtnNotaFiscalDownload.Caption),      ROTINA_MENU_NOTAFISCAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_NFE_COMPLEMENTAR_ID,    Trim(BrBtnNotaFiscalComplementar.Caption),  ROTINA_MENU_NOTAFISCAL_ID);

  // Consultas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_CNPJ_ID,        Trim(BrBtnConsultaCNPJ.Caption),                ROTINA_MENU_CONSULTA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_VENDA_ID,       Trim(BrBtnConsultaVenda.Caption),               ROTINA_MENU_CONSULTA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_ROTATIVIDAD_ID, Trim(BrBtnConsultaRotatividadeProduto.Caption), ROTINA_MENU_CONSULTA_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_CNS_CONSULTA_ESTOQUE_MIN_ID, Trim(BrBtnConsultaEstoqueMinimo.Caption),       ROTINA_MENU_CONSULTA_ID);

  // Financeiro

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ABRIR_CAIXA_ID,     Trim(BrBtnAbrirCaixa.Caption),             ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_ENCERRAR_CAIXA_ID,  Trim(BrBtnEncerrarCaixa.Caption),          ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERAR_BOLETO_ID,    Trim(BrBtnGerarBoleto.Caption),            ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_GERAR_REMESSA_ID,   Trim(BrBtnGerarRemessaBoleto.Caption),     ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_PROCESSA_RETORN_ID, Trim(BrBtnProcessarRetornoBoleto.Caption), ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_QUITAR_APAGAR_ID,   Trim(BrBtnQuitarAPagarLote.Caption),       ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_QUITAR_ARECEBER_ID, Trim(BrBtnQuitarAReceberLote.Caption),     ROTINA_MENU_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_FIN_CONTROLE_CHEQUE_ID, Trim(BrBtnControleCheque.Caption),         ROTINA_MENU_FINANCEIRO_ID);

  // Relatórios

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_CLIENTE_ID,      Trim(BrBtnRelatorioCliente.Caption),        ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FORNECEDOR_ID,   Trim(BrBtnRelatorioFornecedor.Caption),     ROTINA_MENU_RELATORIO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_PRODUTO_ID,      Trim(BrBtnRelatorioProduto.Caption),        ROTINA_MENU_RELATORIO_ID);

  // Relatórios -> Entradas

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_ENTRADA_PROD_ID, Trim(BrBtnRelatorioEntrada.Caption), ROTINA_MENU_REL_ENTRADA_ID);

  // Relatórios -> Estoque

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_ESTOQUE_PROD_ID, Trim(BrBtnRelatorioEstoque.Caption + ' -> ' + BrBtnRelatorioEstoqueProd.Caption),  ROTINA_MENU_REL_ESTOQUE_ID);

  // Relatórios -> Faturamento

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FATURA_VENDA_ID, Trim(BrBtnRelatorioFaturamento.Caption + ' -> ' + BrBtnRelatorioFaturamentoVnd.Caption), ROTINA_MENU_REL_FATURAMENTO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_FATURA_OS_ID,    Trim(BrBtnRelatorioFaturamento.Caption + ' -> ' + BrBtnRelatorioFaturamentoOrd.Caption), ROTINA_MENU_REL_FATURAMENTO_ID);

  // Relatórios -> Financeiro

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_APAGAR_ID,      Trim(BrBtnRelatorioFinanceiro.Caption + ' -> ' + BrBtnRelatorioFinanceiroAP.Caption), ROTINA_MENU_REL_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_ARECEBER_ID,    Trim(BrBtnRelatorioFinanceiro.Caption + ' -> ' + BrBtnRelatorioFinanceiroAR.Caption), ROTINA_MENU_REL_FINANCEIRO_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_MOV_FINANCE_ID, Trim(BrBtnRelatorioFinanceiro.Caption + ' -> ' + BrBtnRelatorioFinanceiroMV.Caption), ROTINA_MENU_REL_FINANCEIRO_ID);

  // Relatórios -> Gerenciais

  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_RESULT_EXERC_ID, Trim(BrBtnRelatorioResultadoExercicio.Caption), ROTINA_MENU_REL_GERENCIAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_AUTOR_ENTRAD_ID, Trim(BrBtnRelatorioAutorizacaoEntrada.Caption), ROTINA_MENU_REL_GERENCIAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_ENTRAD_SAIDA_ID, Trim(BrBtnRelatorioEntradaSaida.Caption),       ROTINA_MENU_REL_GERENCIAL_ID);
  SetRotinaSistema(ROTINA_TIPO_TELA, ROTINA_REL_APAG_AREC_ID,    Trim(BrBtnRelatorioFinanceiroAPxAR.Caption),    ROTINA_MENU_REL_GERENCIAL_ID);
end;

procedure TfrmPrinc.RibbonApplicationMenuClick(Sender: TdxCustomRibbon;
  var AHandled: Boolean);
begin
  RbnBackstageView.ActiveTab := RbnBackstageViewConfig;
end;

procedure TfrmPrinc.TmrAlertaClienteTimer(Sender: TObject);
begin
  if lblAberta.Visible then
    Case lblAberta.Font.Color of
      clGreen : lblAberta.Font.Color := clRed;
      clRed   : lblAberta.Font.Color := clGreen;
    End;
end;

procedure TfrmPrinc.tmrAutoUpgradeTimer(Sender: TObject);
begin
  AtivarUpgradeAutomatico;
  if DMBusiness.NovaLicencaDisponivel(gLicencaSistema.DataBloqueio) then
    DMBusiness.CarregarLicencaAuto;
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
    FormFunction.ShowModalForm(Self, 'ViewQueryContaAPagar');
end;

procedure TfrmPrinc.nmPerfilAcessoClick(Sender: TObject);
begin
  if ( GetUserFunctionID <> FUNCTION_USER_ID_SYSTEM_ADM ) then
    ShowInformation('Usuário sem permissão de acesso para esta rotina.' + #13 + 'Favor entrar em contato com suporte.')
  else
    FormFunction.ShowModalForm(Self, 'frmGrUsuarioPerfil');
end;

procedure TfrmPrinc.nmRegistroEstacaoClick(Sender: TObject);
begin
  if DMBusiness.LiberarUsoLicenca(GetDateDB, True) then
    FormFunction.ShowModalForm(Self, 'FrmGrRegistroEstacao');
end;

procedure TfrmPrinc.nmEfetuarLogoffClick(Sender: TObject);
begin
  //FormFunction.ShowModalForm(Self, 'FrmEfetuarLogin');
  gUsuarioLogado.LogOff;
  if ExecutarLogin() then
    GetInformacoesGerais;
end;

procedure TfrmPrinc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  aProcesso : String;
begin
  CanClose := ShowConfirm('Deseja SAIR do Sistema?');
  if CanClose then
  begin
    ExcluirArquivosAlertaSistema;
    Application.Terminate;

    // Remover processo da memória do Windows
    aProcesso := ParamStr(0);
    aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
    KillTask(aProcesso);
  end;
end;

procedure TfrmPrinc.nmCartaCorrecaoNFeClick(Sender: TObject);
begin
  if not GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) then
    ShowWarning('Certificado não configurado nesta estação de trabalho para que esta rotina seja executada!')
  else
  if GetPermissaoRotinaSistema(ROTINA_NFE_CARTA_CORRECAO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeCartaCorrecao');
end;

procedure TfrmPrinc.nmCentroCustoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_CENTRO_CUSTO_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewCentroCusto');
end;

procedure TfrmPrinc.nmPlanoContaClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CAD_PLANO_CONTAS_ID, True) then
    FormFunction.ShowModalForm(Self, 'ViewPlanoConta');
end;

procedure TfrmPrinc.nmEstoqueApropriadoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_CNS_CONSULTA_ESTOQUE_APR_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeApropriacaoEstoquePesquisa');
end;

procedure TfrmPrinc.nmInventarioMaterialClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_MOV_INVENTARIO_ESTOQU_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeInventario');
end;

procedure TfrmPrinc.mnRelatorioEstoqueProdutoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_ESTOQUE_PROD_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeProdutoEstoqueImpressao');
end;

procedure TfrmPrinc.mnRelatorioRequsicaoAlmoxClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_ESTOQUE_REQ_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeRequisicaoAlmoxImpressao');
end;

procedure TfrmPrinc.mnRelatorioEstoqueApropriacaoClick(Sender: TObject);
begin
  if GetPermissaoRotinaSistema(ROTINA_REL_ESTOQUE_APRO_ID, True) then
    FormFunction.ShowModalForm(Self, 'frmGeApropriacaoEstoqueImpressao');
end;

end.
