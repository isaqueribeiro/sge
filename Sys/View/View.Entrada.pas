unit View.Entrada;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
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

  Data.DB,
  Datasnap.DBClient,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  cxControls,
  cxStyles,
  cxEdit,
  cxDBLookupComboBox,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxVGrid,
  cxDBVGrid,
  cxInplaceContainer,

  ACBrConsultaCPF,
  ACBrBase,
  ACBrSocket,
  ACBrConsultaCNPJ,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TViewEntrada = class(TViewPadraoCadastro)
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblFornecedor: TLabel;
    lblDataEmissao: TLabel;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblDataEntrada: TLabel;
    lblCFOPNF: TLabel;
    dbCFOPNFDescricao: TDBEdit;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    dbValorFrete: TDBEdit;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblValorOutros: TLabel;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    lblTotalNotaFiscal: TLabel;
    dbValorDesconto: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorIPI: TDBEdit;
    lblValorIPI: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMS: TDBEdit;
    lblValorICMS: TLabel;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsPagamento: TTabSheet;
    lblObservacao: TLabel;
    lblFormaPagto: TLabel;
    lblCondicaoPagto: TLabel;
    lblPrazo01: TLabel;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    lblPrazo12: TLabel;
    dbObservacao: TDBMemo;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    tbsDuplicatas: TTabSheet;
    Bevel6: TBevel;
    Bevel7: TBevel;
    pnlBotoesTitulo: TPanel;
    btnRegerarDuplicata: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    DtSrcTabelaItens: TDataSource;
    dtsDuplicatas: TDataSource;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblParticipacao: TLabel;
    lblTotalBruto: TLabel;
    lblValorIPIProduto: TLabel;
    Bevel10: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorUnit: TDBEdit;
    dbUnidade: TDBEdit;
    dbParticipacao: TDBEdit;
    dbTotalBruto: TDBEdit;
    dbValorIPIProduto: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel11: TBevel;
    dbgProdutos: TDBGrid;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    lblCustoMedio: TLabel;
    dbCustoMedio: TDBEdit;
    Bevel12: TBevel;
    lblNCM_SH: TLabel;
    dbNCM_SH: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblCFOPItem: TLabel;
    dbCFOPItem: TDBEdit;
    lblEntradaAberta: TLabel;
    lblEntradaCancelada: TLabel;
    Label1: TLabel;
    lblData: TLabel;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    lblPercRedBC: TLabel;
    dbPercRedBC: TDBEdit;
    ppImprimir: TPopupMenu;
    nmImprimirEspelho: TMenuItem;
    dvImprimirEspelho: TMenuItem;
    nmImprimirDANFE: TMenuItem;
    nmGerarDANFEXML: TMenuItem;
    lblAutorizacao: TLabel;
    dtsTpDespesa: TDataSource;
    Bevel13: TBevel;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    lblTipoDocumento: TLabel;
    dbTipoDocumento: TDBLookupComboBox;
    dtsTipoDocumento: TDataSource;
    dtsTipoEntrada: TDataSource;
    lblTipoEntrada: TLabel;
    dbTipoEntrada: TDBLookupComboBox;
    btbtnFinalizar: TcxButton;
    btbtnGerarNFe: TcxButton;
    btbtnCancelarENT: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbFornecedor: TJvDBComboEdit;
    dbCFOPNF: TJvDBComboEdit;
    dbAutorizacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataEmissao: TJvDBDateEdit;
    dbDataEntrada: TJvDBDateEdit;
    dtsNFE: TDataSource;
    TbsInformeNFe: TTabSheet;
    lblLogNFeLote: TLabel;
    dbLogNFeLote: TDBEdit;
    lblLogNFeLoteDataEmissao: TLabel;
    d1LogNFeLoteDataEmissao: TDBEdit;
    d2LogNFeLoteDataEmissao: TDBEdit;
    lblLogNFeLoteRecibo: TLabel;
    dbLogNFeLoteRecibo: TDBEdit;
    lblLogNFeLoteProtocolo: TLabel;
    dbLogNFeLoteProtocolo: TDBEdit;
    lblLogNFeUsuario: TLabel;
    dbLogNFeUsuario: TDBEdit;
    lblLogNFeLoteChave: TLabel;
    dbLogNFeLoteChave: TDBEdit;
    BtnLimparDadosNFe: TSpeedButton;
    lblLogNFeLoteArquivo: TLabel;
    dbLogNFeLoteArquivo: TDBEdit;
    lblLogNFeCancelUsuario: TLabel;
    dbLogNFeCancelUsuario: TDBEdit;
    lblLogNFeCancelMotivo: TLabel;
    dbLogNFeCancelMotivo: TDBMemo;
    lblLogNFeDenegada: TLabel;
    dbLogNFeDenegada: TDBEdit;
    lblLogNFeCancelData: TLabel;
    dbLogNFeCancelData: TDBEdit;
    ppCorrigirDadosNFe: TPopupMenu;
    nmPpCorrigirDadosNFeCFOP: TMenuItem;
    BtnCorrigirDadosNFe: TSpeedButton;
    popupAuditoria: TPopupMenu;
    nmPpLimparDadosNFe: TMenuItem;
    N2: TMenuItem;
    nmPpReciboNFe: TMenuItem;
    nmPpChaveNFe: TMenuItem;
    nmPpArquivoNFe: TMenuItem;
    lblCSOSN: TLabel;
    dbCSOSN: TDBEdit;
    dbCalcularTotais: TDBCheckBox;
    qryAutorizacaoProduto: TFDQuery;
    qryProduto: TFDQuery;
    spGerarDuplicatas: TFDStoredProc;
    qryNFE: TFDQuery;
    updNFE: TFDUpdateSQL;
    qryNFEEMPRESA: TStringField;
    qryNFESERIE: TStringField;
    qryNFENUMERO: TIntegerField;
    qryNFEMODELO: TSmallintField;
    qryNFEVERSAO: TSmallintField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFECHAVE: TStringField;
    qryNFEPROTOCOLO: TStringField;
    qryNFERECIBO: TStringField;
    qryNFEXML_FILENAME: TStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    qryNFEANOVENDA: TSmallintField;
    qryNFENUMVENDA: TIntegerField;
    qryNFEANOCOMPRA: TSmallintField;
    qryNFENUMCOMPRA: TIntegerField;
    cdsTabelaItens: TFDQuery;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensCODEMP: TStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TStringField;
    cdsTabelaItensCODFORN: TIntegerField;
    cdsTabelaItensDTENT: TDateField;
    cdsTabelaItensNF: TIntegerField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensNCM_SH: TStringField;
    cdsTabelaItensCST: TStringField;
    cdsTabelaItensCSOSN: TStringField;
    cdsTabelaItensCFOP: TIntegerField;
    cdsTabelaItensDESCRI: TStringField;
    cdsTabelaItensESTOQUE_APROP_LOTE: TSmallintField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    updTabelaItens: TFDUpdateSQL;
    qryDuplicatas: TFDQuery;
    updDuplicatas: TFDUpdateSQL;
    qryDuplicatasANOLANC: TSmallintField;
    qryDuplicatasNUMLANC: TIntegerField;
    qryDuplicatasPARCELA: TSmallintField;
    qryDuplicatasCODFORN: TSmallintField;
    qryDuplicatasNOMEFORN: TStringField;
    qryDuplicatasCNPJ: TStringField;
    qryDuplicatasNOTFISC: TStringField;
    qryDuplicatasTIPPAG: TStringField;
    qryDuplicatasDTEMISS: TDateField;
    qryDuplicatasDTVENC: TDateField;
    qryDuplicatasBANCO: TSmallintField;
    qryDuplicatasBCO_NOME: TStringField;
    qryDuplicatasNUMCHQ: TStringField;
    qryDuplicatasPAGO_: TStringField;
    qryDuplicatasDOCBAIX: TStringField;
    qryDuplicatasSITUACAO: TSmallintField;
    qryDuplicatasSITUACAO_DESC: TStringField;
    qryDuplicatasLancamento: TStringField;
    lblCalcularTotaisInfo: TLabel;
    tbsLotes: TTabSheet;
    DBGrid1: TDBGrid;
    DtSrcTabelaLotes: TDataSource;
    cdsTabelaLotes: TFDQuery;
    cdsTabelaLotesANO: TSmallintField;
    cdsTabelaLotesCODCONTROL: TIntegerField;
    cdsTabelaLotesCODEMP: TStringField;
    cdsTabelaLotesSEQ: TSmallintField;
    cdsTabelaLotesCODPROD: TStringField;
    cdsTabelaLotesDESCRI: TStringField;
    cdsTabelaLotesAPRESENTACAO: TStringField;
    cdsTabelaLotesDESCRI_APRESENTACAO: TStringField;
    cdsTabelaLotesREFERENCIA: TStringField;
    cdsTabelaLotesLOTE_ID: TStringField;
    cdsTabelaLotesLOTE_DESCRICAO: TStringField;
    cdsTabelaLotesLOTE_DATA_FAB: TDateField;
    cdsTabelaLotesLOTE_DATA_VAL: TDateField;
    cdsTabelaItensQTDE: TFMTBCDField;
    cdsTabelaItensQTDEANTES: TFMTBCDField;
    cdsTabelaItensQTDEFINAL: TFMTBCDField;
    cdsTabelaItensPRECOUNIT: TFMTBCDField;
    cdsTabelaItensCUSTOMEDIO: TFMTBCDField;
    cdsTabelaItensPERC_PARTICIPACAO: TFMTBCDField;
    cdsTabelaItensVALOR_FRETE: TFMTBCDField;
    cdsTabelaItensVALOR_DESCONTO: TFMTBCDField;
    cdsTabelaItensVALOR_OUTROS: TFMTBCDField;
    cdsTabelaItensVALOR_IPI: TFMTBCDField;
    cdsTabelaItensALIQUOTA: TFMTBCDField;
    cdsTabelaItensALIQUOTA_CSOSN: TFMTBCDField;
    cdsTabelaItensALIQUOTA_PIS: TFMTBCDField;
    cdsTabelaItensALIQUOTA_COFINS: TFMTBCDField;
    cdsTabelaItensPERCENTUAL_REDUCAO_BC: TFMTBCDField;
    cdsTabelaItensTOTAL_BRUTO: TFMTBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TFMTBCDField;
    cdsTabelaItensESTOQUE: TFMTBCDField;
    cdsTabelaLotesQTDE: TFMTBCDField;
    qryDuplicatasVALORPAG: TFMTBCDField;
    btnImportar: TcxButton;
    bvlImportar: TBevel;
    procedure DataSetStatusGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure btbtnFinalizarClick(Sender: TObject);
    procedure btnRegerarDuplicataClick(Sender: TObject);
    procedure dbCFOPNFButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarENTClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnGerarNFeClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure nmImprimirDANFEClick(Sender: TObject);
    procedure nmGerarDANFEXMLClick(Sender: TObject);
    procedure dbAutorizacaoButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure nmPpCorrigirDadosNFeCFOPClick(Sender: TObject);
    procedure BtnCorrigirDadosNFeClick(Sender: TObject);
    procedure nmPpLimparDadosNFeClick(Sender: TObject);
    procedure nmPpReciboNFeClick(Sender: TObject);
    procedure nmPpChaveNFeClick(Sender: TObject);
    procedure nmPpArquivoNFeClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure fdQryTabelaAUTORIZACAO_CODIGOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure btnTituloEditarClick(Sender: TObject);
    procedure dbSerieKeyPress(Sender: TObject; var Key: Char);
    procedure nmImprimirEspelhoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure dbgDadosExit(Sender: TObject);
    procedure dbgDadosEnter(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView    ,
    FControllerTipoEntradaView,
    FControllerTipoDocumentoView,
    FControllerFormaPagto  ,
    FControllerCondicaoPagtoView,
    FControllerTipoDespesa ,
    FControllerCFOP : IControllerCustom;
    FEmpresa : String;
    FTipoMovimento : TTipoMovimentoEntrada;
    FApenasFinalizadas : Boolean;
    SQL_Itens   ,
    SQL_Duplicatas : TStringList;
    FValorTotalProduto : Currency;
    procedure CarregarDadosEmpresa(const pEmpresa, pTituloRelatorio : String);
    procedure AbrirTabelaItens(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirTabelaLotes(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirTabelaDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirNotaFiscal(const pEmpresa : String; const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure GerarDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure CarregarDadosProduto( Codigo : Integer);
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure InserirItensAutorizacao;
    procedure ConfigurarCamposTabelas;
    procedure OcutarCampoAutorizacao;

    function GetRotinaFinalizarID : String;
    function GetRotinaGerarNFeID : String;
    function GetRotinaCancelarEntradaID : String;
    function LoteProdutoPendente  : Boolean;

    procedure RegistrarNovaRotinaSistema;
    procedure BaixarImportarNFe(aChaveNFe, aNSU : String);

    function IdentificarNFe(var aCNPJEmissor, aUFEmissor, aChave, aNSU : String) : Boolean;
    function Controller : IControllerEntrada;
    function Empresa : IControllerEmpresa;
  public
    { Public declarations }
    procedure pgcGuiasOnChange; override;

    function DocumentoDuplicado(const aEntrada : TLancamentoEntrada; const aDocumento : TDocumentoEntrada) : Boolean;

    property TipoMovimento : TTipoMovimentoEntrada read FTipoMovimento write FTipoMovimento;
    property ApenasFinalizadas : Boolean read FApenasFinalizadas write FApenasFinalizadas;
    property RotinaFinalizarID       : String read GetRotinaFinalizarID;
    property RotinaGerarNFeID        : String read GetRotinaGerarNFeID;
    property RotinaCancelarEntradaID : String read GetRotinaCancelarEntradaID;
  end;

(*
  Tabelas:
  - TBCOMRAS
  - TBCOMPRASITENS
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCFOP
  - TBAUTORIZA_COMPRA
  - TBAUTORIZA_COMPRAITEM
  - TBPRODUTO
  - TBUNIDADEPROD

  Views:
  - VW_EMPRESA

  Procedures:
  - SET_GERAR_DUPLICATAS

*)

var
  ViewEntrada: TViewEntrada;

  procedure MostrarControleCompras(const AOwner : TComponent);
  procedure MostrarControleCompraServicos(const AOwner : TComponent);

  function SelecionarEntrada(const AOwner : TComponent; var Ano, Controle : Integer; var aEmpresa : String) : Boolean;
  function SelecionarNFParaDevolver(const AOwner : TComponent; var Ano, Controle : Integer;
    var aEmpresa : String; var Emissao : TDateTime; var Serie, Numero, Chave, UF, Cnpj, IE : String) : Boolean;

implementation

uses
  System.DateUtils,
  UDMBusiness,
  UDMRecursos,
  UFuncoes,
  UDMNFe,
  pcnConversao,
  Classe.DistribuicaoDFe.DocumentoRetornado,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.CondicaoPagto,
  View.Produto,
  View.CFOP,
  View.Fornecedor,
  UGeConsultarLoteNFe_v2,
  UGeAutorizacaoCompra,
  UGeEntradaEstoqueLote,
  UGeEntradaEstoqueCancelar,
  UGeEntradaConfirmaDuplicatas,
  UGeEntradaEstoqueGerarNFe,
  UGeEntradaEstoqueDevolucaoNF,
  UGeDistribuicaoDFe,
  UGeImportarNFE;

{$R *.dfm}

procedure MostrarControleCompras(const AOwner : TComponent);
var
  AForm  : TViewEntrada;
  aWhere ,
  aTipoMovimento,
  aDataInicio   ,
  aDataFinal    : String;
begin
  AForm := TViewEntrada.Create(AOwner);
  try
    AForm.TipoMovimento := TTipoMovimentoEntrada.tmeProduto;
    AForm.Caption       := 'Controle de Entradas de Produtos';
    AForm.RotinaID      := ROTINA_ENT_PRODUTO_ID;

    aTipoMovimento := IntToStr(Ord(AForm.TipoMovimento));
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    aWhere :=
      '(c.tipo_movimento = ' + aTipoMovimento + ') and ' +
      '(cast(c.dtent as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(c.codemp in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(aWhere);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure MostrarControleCompraServicos(const AOwner : TComponent);
var
  AForm  : TViewEntrada;
  aWhere ,
  aTipoMovimento,
  aDataInicio   ,
  aDataFinal    : String;
begin
  AForm := TViewEntrada.Create(AOwner);
  try
    AForm.TipoMovimento := TTipoMovimentoEntrada.tmeServico;
    AForm.Caption       := 'Controle de Entradas de Serviços';
    AForm.RotinaID      := ROTINA_ENT_SERVICO_ID;

    aTipoMovimento := IntToStr(Ord(AForm.TipoMovimento));
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    aWhere :=
      '(c.tipo_movimento = ' + aTipoMovimento + ') and ' +
      '(cast(c.dtent as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(c.codemp in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(aWhere);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarEntrada(const AOwner : TComponent; var Ano, Controle : Integer; var aEmpresa : String) : Boolean;
var
  AForm  : TViewEntrada;
  aWhere ,
  aTipoMovimento,
  aDataInicio   ,
  aDataFinal    : String;
begin
  AForm := TViewEntrada.Create(AOwner);
  try
    AForm.btbtnSelecionar.Visible := True;

    AForm.TipoMovimento     := TTipoMovimentoEntrada.tmeProduto;
    AForm.ApenasFinalizadas := True;
    AForm.Caption           := 'Controle de Entradas de Produtos';
    AForm.RotinaID          := ROTINA_ENT_PRODUTO_ID;

    AForm.btbtnIncluir.Visible  := False;
    AForm.btbtnAlterar.Visible  := False;
    AForm.btbtnExcluir.Visible  := False;
    AForm.btbtnFinalizar.Visible   := False;
    AForm.btbtnCancelarENT.Visible := False;
    AForm.btbtnGerarNFe.Visible    := False;

    if AForm.ApenasFinalizadas then
      aWhere := '(c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')) and '
    else
      aWhere := EmptyStr;

    aTipoMovimento := IntToStr(Ord(AForm.TipoMovimento));
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    aWhere := aWhere +
      '(c.tipo_movimento = ' + aTipoMovimento + ') and ' +
      '(cast(c.dtent as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(c.codemp in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(aWhere);
    AForm.FController.DAO.Open;

    Result := (AForm.ShowModal = mrOk);

    if Result then
      with AForm, DtSrcTabela.DataSet do
      begin
        Ano      := FieldByName('ANO').AsInteger;
        Controle := FieldByName('CODCONTROL').AsInteger;
        aEmpresa := FieldByName('CODEMP').AsString;
      end;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarNFParaDevolver(const AOwner : TComponent; var Ano, Controle : Integer;
  var aEmpresa : String; var Emissao : TDateTime; var Serie, Numero, Chave, UF, Cnpj, IE : String) : Boolean;
var
  AForm  : TViewEntrada;
  aTipoMovimento,
  aDataInicio   ,
  aDataFinal    : String;
begin
  AForm := TViewEntrada.Create(AOwner);
  try
    with AForm do
    begin
      btbtnSelecionar.Visible := True;

      TipoMovimento     := TTipoMovimentoEntrada.tmeProduto;
      ApenasFinalizadas := True;
      FEmpresa          := Trim(aEmpresa);
      Caption           := 'Controle de Entradas de Produtos';
      RotinaID          := ROTINA_ENT_PRODUTO_ID;

      btbtnIncluir.Visible  := False;
      btbtnAlterar.Visible  := False;
      btbtnExcluir.Visible  := False;
      btbtnFinalizar.Visible   := False;
      btbtnCancelarENT.Visible := False;
      btbtnGerarNFe.Visible    := False;

      aTipoMovimento := IntToStr(Ord(AForm.TipoMovimento));
      aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
      aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

      WhereAdditional :=
        '(c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')) and ' +
        '(c.tipo_movimento = ' + aTipoMovimento + ') and ' +
        '(cast(c.dtent as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
        '(c.codemp = ' + FEmpresa.QuotedString + ')' + ' and ' +
        '(c.codemp in ( ' +
        '  Select      ' +
        '    vw.cnpj   ' +
        '  from VW_EMPRESA vw' +
        '))';


      Result := (ShowModal = mrOk);

      if Result then
        with DtSrcTabela.DataSet do
        begin
          Ano      := FieldByName('ANO').AsInteger;
          Controle := FieldByName('CODCONTROL').AsInteger;
          aEmpresa := FieldByName('CODEMP').AsString;
          Emissao  := FieldByName('DTEMISS').AsDateTime;
          Serie    := FieldByName('NFSERIE').AsString;
          Numero   := FormatFloat('###0000000', FieldByName('NF').AsInteger);
          Chave    := Trim(FieldByName('VERIFICADOR_NFE').AsString);
          UF       := EmptyStr;
          Cnpj     := FieldByName('CNPJ').AsString;
          IE       := EmptyStr;
        end;
    end;

  finally
    AForm.Free;
  end;
end;

procedure TViewEntrada.OcutarCampoAutorizacao;
begin
  dbCFOPNFDescricao.Width := 273;
  lblSituacao.Left        := dbTipoEntrada.Left;
  dbSituacao.Left         := dbTipoEntrada.Left;
  dbSituacao.Width        := dbTipoEntrada.Width;
  lblAutorizacao.Visible  := False;
  dbAutorizacao.Visible   := False;
end;

procedure TViewEntrada.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Entrada;

  FControllerEmpresaView       := TControllerFactory.New.EmpresaView;
  FControllerTipoEntradaView   := TControllerFactory.New.TipoEntradaView;
  FControllerTipoDocumentoView := TControllerFactory.New.TipoDocumentoEntradaView;
  FControllerFormaPagto        := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView := TControllerFactory.New.CondicaoPagtoView;
  FControllerTipoDespesa       := TControllerFactory.New.TipoDespesa;
  FControllerCFOP := TControllerFactory.New.CFOP;

  if (gSistema.Codigo <> SISTEMA_GESTAO_OPME) then
    if not (GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID]) then
      OcutarCampoAutorizacao;

  inherited;

  AbrirTabelaAuto := True;
  FEmpresa        := EmptyStr;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  SQL_Duplicatas := TStringList.Create;
  SQL_Duplicatas.Clear;
  SQL_Duplicatas.AddStrings( qryDuplicatas.SQL );

  e1Data.Date      := Date - 30;
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCOMPRAS';
  CampoCodigo    := 'c.Codcontrol';
  CampoDescricao := 'f.NomeForn';
  CampoOrdenacao := 'c.dtEnt, f.NomeForn';

  dbCalcularTotais.Visible      := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and GetPermititEmissaoNFeEntrada(gUsuarioLogado.Empresa);
  lblCalcularTotaisInfo.Visible := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and GetPermititEmissaoNFeEntrada(gUsuarioLogado.Empresa);
  btbtnGerarNFe.Visible         := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and GetPermititEmissaoNFeEntrada(gUsuarioLogado.Empresa);

  TipoMovimento     := TTipoMovimentoEntrada.tmeProduto;
  ApenasFinalizadas := False;

  if not dbCalcularTotais.Visible then
    GrpBxDadosValores.Height := 76
  else
    GrpBxDadosValores.Height := 90;

  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'codemp', 'cnpj', 'razao');

  TController(FControllerTipoEntradaView)
    .LookupComboBox(dbTipoEntrada, dtsTipoEntrada, 'tipo_entrada', 'codigo', 'descricao');

  TController(FControllerTipoDocumentoView)
    .LookupComboBox(dbTipoDocumento, dtsTipoDocumento, 'tipo_documento', 'codigo', 'descricao');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'formapagto_cod', 'codigo', 'codigo_descricao');

  TController(FControllerCondicaoPagtoView)
    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'condicaopagto_cod', 'cond_cod', 'cond_descricao');

  TController(FControllerTipoDespesa)
    .LookupComboBox(dbTipoDespesa, dtsTpDespesa, 'tipo_despesa', 'codigo', 'descricao');

  ConfigurarCamposTabelas;

  FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
end;

procedure TViewEntrada.btnFiltrarClick(Sender: TObject);
var
  aValor : Currency;
begin
  if ApenasFinalizadas then
    WhereAdditional := '(c.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + ')) and '
  else
    WhereAdditional := EmptyStr;

  WhereAdditional := WhereAdditional +
    '(c.tipo_movimento = ' + IntToStr(Ord(TipoMovimento)) + ') and cast(c.dtent as date) between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ' and ' +
    ' (c.codemp in ( ' +
    '    Select      ' +
    '      vw.cnpj   ' +
    '    from VW_EMPRESA vw' +
    ' ))';

  if ( Trim(FEmpresa) <> EmptyStr ) then
    WhereAdditional := WhereAdditional + ' and (c.codemp = ' + QuotedStr(FEmpresa) +')';

  // Buscar registro pelo Valor
  aValor := StrToCurrDef(StringReplace(Trim(edtFiltrar.Text), '.', '', [rfReplaceAll]), 0) * 100;
  if ((Pos(',', Trim(edtFiltrar.Text)) > 0) and (aValor > 0.0)) then
    WhereAdditional := WhereAdditional + ' and (c.index_valor = ' + CurrToStr(aValor) + ')';

  inherited;

  DtSrcTabela.DataSet.FieldByName('STATUS').OnGetText := DataSetStatusGetText;
end;

procedure TViewEntrada.btnImportarClick(Sender: TObject);
var
  aEmissor ,
  aUF      ,
  aChaveNFe,
  aNSU     : String;
begin
  DMNFe.LerConfiguracao(gUsuarioLogado.Empresa, tipoDANFEFast);

  aEmissor  := EmptyStr;
  aUF       := EmptyStr;
  aChaveNFe := EmptyStr;
  aNSU      := FormatFloat('000000000000000', GetNumeroNSU(gUsuarioLogado.Empresa));

  if (DMNFe.GetCnpjCertificado <> EmptyStr) then
    if not IdentificarNFe(aEmissor, aUF, aChaveNFe, aNSU) then
      aNSU := FormatFloat('000000000000000', GetNumeroNSU(gUsuarioLogado.Empresa));

  BaixarImportarNFe(aChaveNFe, aNSU);
end;

procedure TViewEntrada.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('CODFORN').AsInteger := iCodigo;
        FieldByName('CNPJ').AsString     := sCNPJ;
        FieldByName('NOMEFORN').AsString := sNome;
      end;
  end;
end;

function TViewEntrada.IdentificarNFe(var aCNPJEmissor, aUFEmissor, aChave, aNSU : String): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;

  try
    if (Copy(DMNFe.GetCnpjCertificado, 1, 8) <> Copy(gUsuarioLogado.Empresa, 1, 8)) then
    begin
      ShowWarning('A Empresa selecionada no login do sistema não está de acordo com o Certificado informado!');
      Exit;
    end;

    if not GetConectedInternet then
    begin
      ShowWarning('Estação de trabalho sem acesso a Internet!');
      Exit;
    end;

    if not DMNFe.GetValidadeCertificado(gUsuarioLogado.Empresa) then
      Exit;

    aRetorno := TfrmDistribuicaoDFe
      .getInstance(gUsuarioLogado.Empresa)
      .&End(aCNPJEmissor, aUFEmissor, aChave, aNSU);
  finally
    Result := aRetorno;
  end;
end;

procedure TViewEntrada.InserirItensAutorizacao;
var
  I : Integer;
  cPrecoUN : Currency;
begin
  with qryAutorizacaoProduto do
  begin
    Close;
    ParamByName('tipo').AsInteger := IfThen(TTipoMovimentoEntrada(DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto, Ord(taICMS), Ord(taISS));
    ParamByName('ano').AsInteger  := DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_ANO').AsInteger;
    ParamByName('cod').AsInteger  := DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_CODIGO').AsInteger;
    ParamByName('emp').AsString   := DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_EMPRESA').AsString;
    Open;

    if not IsEmpty then
    begin
      AbrirTabelaItens(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger);
      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
        cdsTabelaItens.Delete;
    end;

    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        cdsTabelaItens.Append;

        cdsTabelaItensSEQ.AsInteger := I;
        cdsTabelaItensCODPROD.Assign       ( FieldByName('produto') );
        cdsTabelaItensDESCRI.Assign        ( FieldByName('DESCRI') );
        cdsTabelaItensQTDE.Assign          ( FieldByName('quantidade') );
        cdsTabelaItensUNID_COD.Assign      ( FieldByName('unidade') );
        cdsTabelaItensUNP_SIGLA.Assign     ( FieldByName('unp_sigla') );
        cdsTabelaItensCFOP.Assign          ( DtSrcTabela.DataSet.FieldByName('NFCFOP') );
        cdsTabelaItensNCM_SH.Assign        ( FieldByName('ncm_sh') );
        cdsTabelaItensCST.Assign           ( FieldByName('cst') );
        cdsTabelaItensCSOSN.Assign         ( FieldByName('csosn') );
        cdsTabelaItensALIQUOTA.Assign      ( FieldByName('aliquota') );
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.Assign      ( FieldByName('percentual_reducao_bc') );
        cdsTabelaItensALIQUOTA_CSOSN.Assign ( FieldByName('aliquota_csosn') );
        cdsTabelaItensALIQUOTA_PIS.Assign   ( FieldByName('aliquota_pis') );
        cdsTabelaItensALIQUOTA_COFINS.Assign( FieldByName('aliquota_cofins') );
        cdsTabelaItensQTDE.Assign           ( FieldByName('quantidade') );
        cdsTabelaItensQTDEANTES.Assign      ( FieldByName('estoque') );
        cdsTabelaItensQTDEFINAL.Assign      ( FieldByName('novo_estoque') );
        cdsTabelaItensPRECOUNIT.Assign      ( FieldByName('valor_unitario') );
        cdsTabelaItensVALOR_IPI.Assign      ( FieldByName('valor_ipi') );

        cPrecoUN := cdsTabelaItensPRECOUNIT.AsCurrency;

        cdsTabelaItensCUSTOMEDIO.AsCurrency  := cPrecoUN + cdsTabelaItensVALOR_IPI.AsCurrency;
        cdsTabelaItensTOTAL_BRUTO.AsCurrency := cPrecoUN * cdsTabelaItensQTDE.AsCurrency;

        cdsTabelaItensPERC_PARTICIPACAO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency  / DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency * 100;
        cdsTabelaItensVALOR_FRETE.Value            := cdsTabelaItensPERC_PARTICIPACAO.Value * DtSrcTabela.DataSet.FieldByName('FRETE').AsCurrency / 100;
        cdsTabelaItensVALOR_DESCONTO.Value         := cdsTabelaItensPERC_PARTICIPACAO.Value * DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency / 100;
        cdsTabelaItensVALOR_OUTROS.Value           := cdsTabelaItensPERC_PARTICIPACAO.Value * DtSrcTabela.DataSet.FieldByName('OUTROSCUSTOS').AsCurrency / 100;

        cdsTabelaItensTOTAL_LIQUIDO.AsCurrency     := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensVALOR_DESCONTO.AsCurrency;

        cdsTabelaItens.Post;

        Inc(I);
      end;

      Next;
    end;
  end;
end;

function TViewEntrada.LoteProdutoPendente: Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := (TTipoMovimentoEntrada(DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto);

    // Verificar a pendência na informação de lotes caso a entrada seja de produtos
    if aRetorno then
      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('  count(ci.seq) as pendentes');
        SQL.Add('from TBCOMPRASITENS ci');
        SQL.Add('  inner join TBCOMPRAS cp on (cp.ano = ci.ano and cp.codcontrol = ci.codcontrol and cp.codemp = ci.codemp)');
        SQL.Add('  inner join TBPRODUTO pr on (pr.cod = ci.codprod and pr.estoque_aprop_lote = 1 and pr.movimenta_estoque = 1)');
        SQL.Add('  left join TBCFOP cf on (cf.cfop_cod = cp.nfcfop)');
        SQL.Add('where ci.ano        = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
        SQL.Add('  and ci.codcontrol = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
        Open;

        aRetorno := (FieldByName('pendentes').AsInteger > 0);

        Close;
      end;
  finally
    Result := aRetorno;
  end;
end;

procedure TViewEntrada.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( FControllerCondicaoPagtoView.DAO.DataSet.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
      begin
        FieldByName('COMPRA_PRAZO').AsInteger := FControllerCondicaoPagtoView.DAO.DataSet.FieldByName('Cond_prazo').AsInteger;
        for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
        begin
          FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
          if ( not FControllerCondicaoPagtoView.DAO.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
            FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := FControllerCondicaoPagtoView.DAO.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
        end;
      end;
end;

function TViewEntrada.DocumentoDuplicado(
  const aEntrada: TLancamentoEntrada;
  const aDocumento: TDocumentoEntrada): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    aRetorno := Controller.DocumentoDuplicado(aEntrada, aDocumento);
    if aRetorno then
      ShowWarning(Format('Documento %s já lançado.'#13#13'Pesquise o lançamento %s/%s com emissão em %s.', [
          QuotedStr(Trim(Controller.Busca.DataSet.FieldByName('tipo').AsString))
        , FormatFloat('###0000000', Controller.Busca.DataSet.FieldByName('codcontrol').AsInteger)
        , FormatFloat('0000', Controller.Busca.DataSet.FieldByName('ano').AsInteger)
        , FormatDateTime('dd/mm/yyyy', Controller.Busca.DataSet.FieldByName('dtemiss').AsDateTime)
      ]));
  finally
    Result := aRetorno;
  end;
end;

procedure TViewEntrada.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (Field = DtSrcTabela.DataSet.FieldByName('TOTALPROD')) then
    FValorTotalProduto := DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency;

  if (Field = DtSrcTabela.DataSet.FieldByName('NFCFOP')) and (not FControllerCFOP.DAO.DataSet.IsEmpty) then
    DtSrcTabela.DataSet.FieldByName('CFOP_DESCRICAO').AsString := FControllerCFOP.DAO.DataSet.FieldByName('cfop_descricao').AsString;
end;

procedure TViewEntrada.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TViewEntrada.AbrirTabelaItens(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.Ano        = ' + IntToStr(AnoCompra));
    Add('  and i.Codcontrol = ' + IntToStr(ControleCompra));
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TViewEntrada.AbrirTabelaLotes(const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  with cdsTabelaLotes do
  begin
    Close;
    ParamByName('ano').AsSmallInt   := AnoCompra;
    ParamByName('compra').AsInteger := ControleCompra;
    Open;
  end;
end;

procedure TViewEntrada.BaixarImportarNFe(aChaveNFe, aNSU : String);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  aProduto  : String;
  aFileName : TFileName;
  Sequencial,
  I : Integer;
begin
  if ImportarNFE(Self, aChaveNFe, aNSU, aFileName) then
    with DMNFe.ACBrNFe do
    begin
      FValorTotalProduto := 0.0;

      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile(aFileName, False );

      with NotasFiscais.Items[0].NFe do
      begin
        DtSrcTabela.DataSet.Append;

        // Identificação
        DtSrcTabela.DataSet.FieldByName('CODEMP').AsString          := StrOnlyNumbers(Dest.CNPJCPF);
        DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger := Ord(TTipoMovimentoEntrada.tmeProduto);
        DtSrcTabela.DataSet.FieldByName('TIPO_ENTRADA').AsInteger   := 4; // Outras -> VW_TIPO_ENTRADA
        DtSrcTabela.DataSet.FieldByName('TIPO_DESPESA').AsInteger   := TIPO_RECEITA_PADRAO;
        // Fornecedor
        DtSrcTabela.DataSet.FieldByName('CODFORN').AsInteger  := GetFornecedorCodigo( StrOnlyNumbers(Emit.CNPJCPF) );
        DtSrcTabela.DataSet.FieldByName('CNPJ').AsString      := StrOnlyNumbers(Emit.CNPJCPF);
        DtSrcTabela.DataSet.FieldByName('NOMEFORN').AsString  := Emit.xNome;
        // Documento
        DtSrcTabela.DataSet.FieldByName('DTEMISS').AsDateTime       := Ide.dEmi;
        DtSrcTabela.DataSet.FieldByName('TIPO_DOCUMENTO').AsInteger := TIPO_DOCUMENTO_ENTRADA_NFE;
        DtSrcTabela.DataSet.FieldByName('NF').AsString        := FormatFloat('###0000000', Ide.cNF);
        DtSrcTabela.DataSet.FieldByName('NFSERIE').AsString   := FormatFloat('###00', Ide.serie);
        DtSrcTabela.DataSet.FieldByName('NFNSU').AsString     := aNSU;
        // Valores
        DtSrcTabela.DataSet.FieldByName('CALCULAR_TOTAIS').AsInteger := FLAG_NAO;
        DtSrcTabela.DataSet.FieldByName('ICMSBASE').AsCurrency       := Total.ICMSTot.vBC;
        DtSrcTabela.DataSet.FieldByName('ICMSVALOR').AsCurrency      := Total.ICMSTot.vICMS;
        DtSrcTabela.DataSet.FieldByName('ICMSSUBSTBASE').AsCurrency  := Total.ICMSTot.vBCST;
        DtSrcTabela.DataSet.FieldByName('ICMSSUBSTVALOR').AsCurrency := Total.ICMSTot.vST;
        DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency      := Total.ICMSTot.vProd;
        DtSrcTabela.DataSet.FieldByName('FRETE').AsCurrency          := Total.ICMSTot.vFrete;
        DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency       := Total.ICMSTot.vDesc;
        DtSrcTabela.DataSet.FieldByName('IPI').AsCurrency            := Total.ICMSTot.vIPI;
        DtSrcTabela.DataSet.FieldByName('OUTROSCUSTOS').AsCurrency   := Total.ICMSTot.vSeg + Total.ICMSTot.vII + Total.ICMSTot.vOutro;
        DtSrcTabela.DataSet.FieldByName('TOTALNF').AsCurrency        := Total.ICMSTot.vNF;

        DtSrcTabela.DataSet.Post; // Salvar apenas na memória

        AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
          , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
          , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

        AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaLotes( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaDuplicatas( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

        DtSrcTabela.DataSet.Edit; // Colocar registro em edição para que usuário possa continuar o processo

        // Produtos
        for I := 0 to Det.Count - 1 do
        begin
          // CFOP
          if (DtSrcTabela.DataSet.FieldByName('NATUREZA').AsString = EmptyStr) then
          begin
            DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger   := Det.Items[I].Prod.CFOP.ToInteger;
            DtSrcTabela.DataSet.FieldByName('NATUREZA').AsString  := Det.Items[I].Prod.CFOP;
          end;

          aProduto := GetProdutoFornecedorCodigo(StrOnlyNumbers(Emit.CNPJCPF), Det.Items[I].Prod.cProd);
          if not aProduto.IsEmpty then
          begin
            GerarSequencial(Sequencial);

            DtSrcTabelaItens.DataSet.Append;

            DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger    := Sequencial;
            DtSrcTabelaItens.DataSet.FieldByName('CODPROD').AsString := aProduto;
            CarregarDadosProduto( DtSrcTabelaItens.DataSet.FieldByName('CODPROD').AsInteger ); // Forçar carga da descrição do produto

            DtSrcTabelaItens.DataSet.FieldByName('CFOP').AsString   := Det.Items[I].Prod.CFOP;
            DtSrcTabelaItens.DataSet.FieldByName('NCM_SH').AsString := Det.Items[I].Prod.NCM;

            if Emit.CRT = TpcnCRT.crtSimplesNacional then
              DtSrcTabelaItens.DataSet.FieldByName('CSOSN').AsString := CSOSNIcmsToStr(Det.Items[I].Imposto.ICMS.CSOSN)
            else
              DtSrcTabelaItens.DataSet.FieldByName('CST').AsString   := CSTICMSToStr(Det.Items[I].Imposto.ICMS.CST);

            DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency := Det.Items[I].Prod.qCom;
            DtSrcTabelaItens.DataSet.FieldByName('PRECOUNIT').AsCurrency := (Det.Items[I].Prod.vProd / Det.Items[I].Prod.qCom);
            DtSrcTabelaItens.DataSet.FieldByName('VALOR_IPI').AsCurrency := (Det.Items[I].Imposto.IPI.vIPI / Det.Items[I].Prod.qCom);

            ControlEditExit(dbValorUnit); // Forçar cálculo de totais do produto

            DtSrcTabelaItens.DataSet.Post;
          end;
        end;

        // Gravar dados na base
        DtSrcTabela.DataSet.Post;
        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;

        if (DtSrcTabelaItens.DataSet.RecordCount > 0) then
        begin
          cdsTabelaItens.ApplyUpdates;
          cdsTabelaItens.CommitUpdates;
        end;

        FController.DAO.CommitTransaction;

        DtSrcTabela.DataSet.Edit; // Colocar registro em edição para que usuário possa continuar o processo
      end;

      NotasFiscais.Clear;
    end;
end;

procedure TViewEntrada.AbrirTabelaDuplicatas(
  const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  qryDuplicatas.Close;

  with qryDuplicatas, SQL do
  begin
    Clear;
    AddStrings( SQL_Duplicatas );
    Add('where p.AnoCompra = ' + IntToStr(AnoCompra));
    Add('  and p.NumCompra = ' + IntToStr(ControleCompra));
    Add('order by p.numlanc, p.parcela');
  end;

  qryDuplicatas.Open;
end;

procedure TViewEntrada.CarregarDadosProduto(Codigo : Integer);
begin
  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('Codigo').AsInteger := Codigo;
      Open;
      if not IsEmpty then
      begin
        if not FControllerCFOP.DAO.DataSet.Active then
          CarregarDadosCFOP(DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger);

        cdsTabelaItensCODPROD.AsString     := FieldByName('Cod').AsString;
        cdsTabelaItensDESCRI.AsString      := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString   := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensQTDEANTES.AsCurrency := FieldByName('Qtde').AsCurrency;

        cdsTabelaItensNCM_SH.AsString                  := FieldByName('Ncm_sh').AsString;
        cdsTabelaItensALIQUOTA.AsCurrency              := FieldByName('Aliquota').AsCurrency;
        cdsTabelaItensALIQUOTA_CSOSN.AsCurrency        := FieldByName('Aliquota_csosn').AsCurrency;
        cdsTabelaItensALIQUOTA_PIS.AsCurrency          := FieldByName('Aliquota_pis').AsCurrency;
        cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := FieldByName('Aliquota_cofins').AsCurrency;
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := FieldByName('Percentual_reducao_BC').AsCurrency;

        if ( Trim(FieldByName('Cst').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString       := FieldByName('Cst').AsString;

        if ( Trim(FieldByName('Csosn').AsString) <> EmptyStr ) then
          cdsTabelaItensCSOSN.AsString     := FieldByName('Csosn').AsString;

        if ( (FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString);

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNID_COD.AsInteger   := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('Código de ' + IfThen(FTipoMovimento = tmeProduto, 'produto', 'serviço') + ' não cadastrado');
        cdsTabelaItensCODPROD.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewEntrada.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    cdsTabelaItensANO.Value        := FieldByName('ANO').AsInteger;
    cdsTabelaItensCODCONTROL.Value := FieldByName('CODCONTROL').AsInteger;
    cdsTabelaItensDTENT.Value      := FieldByName('DTENT').AsDateTime;
    cdsTabelaItensCODEMP.Value     := FieldByName('CODEMP').AsString;
    cdsTabelaItensCODFORN.Value    := FieldByName('CODFORN').AsInteger;
    cdsTabelaItensNF.Value         := FieldByName('NF').AsInteger;

    if ( FTipoMovimento = tmeProduto ) then
    begin
      if ( FieldByName('NFCFOP').IsNull ) then
        cdsTabelaItensCFOP.Value := GetCfopIDDefault
      else
        cdsTabelaItensCFOP.Assign( FieldByName('NFCFOP') );
    end
    else
    if ( FTipoMovimento = tmeServico ) then
      cdsTabelaItensCFOP.Clear;

    cdsTabelaItensQTDE.Value      := 0;
    cdsTabelaItensQTDEANTES.Value := 0;
    cdsTabelaItensQTDEFINAL.Value := 0;

    cdsTabelaItensALIQUOTA.Value              := 0.0;
    cdsTabelaItensALIQUOTA_CSOSN.Value        := 0.0;
    cdsTabelaItensALIQUOTA_PIS.Value          := 0.0;
    cdsTabelaItensALIQUOTA_COFINS.Value       := 0.0;
    cdsTabelaItensPERCENTUAL_REDUCAO_BC.Value := 0.0;
  end;
end;

procedure TViewEntrada.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnFinalizar.Enabled   := ( FieldByName('STATUS').AsInteger < STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);
    btbtnCancelarENT.Enabled := ((FieldByName('STATUS').AsInteger = STATUS_CMP_FIN) or  (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE)); // and (not cdsTabelaItens.IsEmpty);
    btbtnGerarNFe.Enabled    := ( FieldByName('STATUS').AsInteger = STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);

    nmImprimirDANFE.Enabled := (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) or  (FieldByName('NFNSU').AsString <> EmptyStr);
    nmGerarDANFEXML.Enabled := (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) and (FieldByName('NFNSU').AsString = EmptyStr);

    TbsInformeNFe.TabVisible    := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr);
    nmPpLimparDadosNFe.Enabled  := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr) and (FieldByName('NFNSU').AsString = EmptyStr);
    BtnLimparDadosNFe.Enabled   := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr) and (FieldByName('NFNSU').AsString = EmptyStr);
    BtnCorrigirDadosNFe.Enabled      := (FieldByName('STATUS').AsInteger in [STATUS_CMP_ABR, STATUS_CMP_FIN]) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr) and (FieldByName('NFNSU').AsString = EmptyStr);
    nmPpCorrigirDadosNFeCFOP.Enabled := (FieldByName('STATUS').AsInteger in [STATUS_CMP_ABR, STATUS_CMP_FIN]) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr) and (FieldByName('NFNSU').AsString = EmptyStr);
  end
  else
  begin
    btbtnFinalizar.Enabled   := False;
    btbtnCancelarENT.Enabled := False;
    btbtnGerarNFe.Enabled    := False;

    nmImprimirDANFE.Enabled := (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) or  (FieldByName('NFNSU').AsString <> EmptyStr);
    nmGerarDANFEXML.Enabled := (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) and (FieldByName('NFNSU').AsString = EmptyStr);

    TbsInformeNFe.TabVisible    := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr);
    nmPpLimparDadosNFe.Enabled  := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr) and (FieldByName('NFNSU').AsString = EmptyStr);
    BtnLimparDadosNFe.Enabled   := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (Trim(dbLogNFeLoteProtocolo.Field.AsString) = EmptyStr) and (FieldByName('NFNSU').AsString = EmptyStr);
    BtnCorrigirDadosNFe.Enabled      := False;
    nmPpCorrigirDadosNFeCFOP.Enabled := False;
  end;
end;

procedure TViewEntrada.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  with DtSrcTabela.DataSet do
    if ( FieldByName('STATUS').AsInteger > STATUS_CMP_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_CMP_FIN : sMsg := 'Esta entrada não pode ser excluída porque está finalizada.';
        STATUS_CMP_CAN : sMsg := 'Esta entrada não pode ser excluída porque está cancelada';
        STATUS_CMP_NFE : sMsg := 'Esta entrada não pode ser excluída porque exite Nota Fiscal gerar para este movimento.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      end;
    end;
end;

procedure TViewEntrada.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('CODFORN').AsInteger = 0 ) then
  begin
    ShowInformation('Favor selecionar o Fornecedor primeiramente!');
    dbFornecedor.SetFocus;
  end
  else
  if ( (not dbCalcularTotais.Checked) and (DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency = 0) ) then
  begin
    ShowWarning('Favor informar valor Total de ' + IfThen(FTipoMovimento = tmeProduto, 'Produto(s)', 'Serviço(s)') + '.');
    dbTotalProduto.SetFocus;
  end
  else
  if ( (not dbCalcularTotais.Checked) and (DtSrcTabela.DataSet.FieldByName('TOTALNF').AsCurrency = 0) ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    if ( gSistema.Codigo in [SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME] ) then
      if ( DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_CODIGO').AsCurrency > 0 ) then
        if ShowConfirmation('Deseja carregar automaticamente os itens da autorização selecionada?') then
        begin
          InserirItensAutorizacao;
          Exit;
        end;

    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TViewEntrada.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbQuantidade.SetFocus;
  end;
end;

procedure TViewEntrada.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TViewEntrada.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_IPI, Total_Liquido, vBC_ICMS, vICMS: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_IPI      := 0.0;
    Total_Liquido  := 0.0;
    vBC_ICMS       := 0.0;
    vICMS          := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto := Total_Bruto + cdsTabelaItensTOTAL_BRUTO.AsCurrency;
      Total_IPI   := Total_IPI   + cdsTabelaItensVALOR_IPI.AsCurrency;

      if ( cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency > 0 ) then
      begin
        vBC_ICMS := vBC_ICMS + (cdsTabelaItensTOTAL_BRUTO.AsCurrency * cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency / 100);
        vICMS    := vICMS    + (((cdsTabelaItensTOTAL_BRUTO.AsCurrency * cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency / 100)) * cdsTabelaItensALIQUOTA.AsCurrency / 100);
      end
      else
      begin
        vBC_ICMS := vBC_ICMS + cdsTabelaItensTOTAL_BRUTO.AsCurrency;
        vICMS    := vICMS    + (cdsTabelaItensTOTAL_BRUTO.AsCurrency * cdsTabelaItensALIQUOTA.AsCurrency / 100);
      end;


      cdsTabelaItens.Next;
    end;

    Total_desconto := DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency;
    Total_Liquido  := Total_Bruto - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalIPI     ,
  cTotalLiquido ,
  cValorBaseIcms,
  cValorIcms    : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensCODPROD.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor selecionar o ' + lblProduto.Caption);
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQTDE.AsCurrency <= 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensPRECOUNIT.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor unitário inválida.');
      dbValorUnit.SetFocus;
    end
    else
    if ( cdsTabelaItensVALOR_IPI.AsCurrency < 0 ) then
    begin
      ShowWarning('Valor IPI inválida.');
      dbValorIPIProduto.SetFocus;
    end
    else
    begin

      if cdsTabelaItensSEQ.IsNull then
        cdsTabelaItensSEQ.AsInteger := 1;

      cdsTabelaItens.Post;

      if ( dbCalcularTotais.Checked ) then
      begin
        GetToTais(cTotalBruto, cTotalDesconto, cTotalIPI, cTotalLiquido, cValorBaseIcms, cValorIcms);

        DtSrcTabela.DataSet.FieldByName('ICMSBASE').AsCurrency  := cValorBaseIcms;
        DtSrcTabela.DataSet.FieldByName('ICMSVALOR').AsCurrency := cValorIcms;
        DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency := cTotalBruto;
        DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency  := cTotalDesconto;
        DtSrcTabela.DataSet.FieldByName('IPI').AsCurrency       := cTotalIPI;
        DtSrcTabela.DataSet.FieldByName('TOTALNF').AsCurrency   := cTotalLiquido + DtSrcTabela.DataSet.FieldByName('IPI').AsCurrency;
      end;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TViewEntrada.btbtnSalvarClick(Sender: TObject);
var
  aEntrada   : TLancamentoEntrada;
  aDocumento : TDocumentoEntrada;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( cdsTabelaItens.IsEmpty ) then
      ShowWarning('Favor informar o(s) ' + IfThen(FTipoMovimento = tmeProduto, 'produto(s)', 'serviço(s)') + ' da entrada.')
    else
    begin
      if (StrToIntDef(Trim(FieldByName('NFSERIE').AsString), 0) = 0) then
        FieldByName('NFSERIE').Clear
      else
        FieldByName('NFSERIE').AsString := FormatFloat('00', StrToIntDef(Trim(FieldByName('NFSERIE').AsString), 0));

      if (FieldByName('TIPO_DOCUMENTO').AsInteger in [TIPO_DOCUMENTO_ENTRADA_AVULSA, TIPO_DOCUMENTO_ENTRADA_CONTRATO]) then
      begin
        FieldByName('NF').AsInteger     := FieldByName('CODCONTROL').AsInteger;
        FieldByName('NFSERIE').AsString := TIPO_DOCUMENTO_SERIE_AVULSO;
      end;

      FieldByName('NF').Required      := (FieldByName('TIPO_DOCUMENTO').AsInteger in [TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL, TIPO_DOCUMENTO_ENTRADA_CUPOM, TIPO_DOCUMENTO_ENTRADA_NFE, TIPO_DOCUMENTO_ENTRADA_NFCE, TIPO_DOCUMENTO_ENTRADA_NFSE, TIPO_DOCUMENTO_ENTRADA_CTE]);
      FieldByName('NFSERIE').Required := (FieldByName('TIPO_DOCUMENTO').AsInteger in [TIPO_DOCUMENTO_ENTRADA_NOTA_FISCAL, TIPO_DOCUMENTO_ENTRADA_NFE, TIPO_DOCUMENTO_ENTRADA_NFCE]) and (TTipoMovimentoEntrada(FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto);

      // Verificar duplicidade de lançamento do documento (Nota Fiscal)
      aEntrada.Ano      := FieldByName('ANO').AsInteger;
      aEntrada.Controle := FieldByName('CODCONTROL').AsInteger;
      aDocumento.Fornecedor := FieldByName('CODFORN').AsInteger;
      aDocumento.Tipo       := FieldByName('TIPO_DOCUMENTO').AsInteger;
      aDocumento.Numero     := FieldByName('NF').AsInteger;

      if not DocumentoDuplicado(aEntrada, aDocumento) then
      begin
        inherited;

        if ( not OcorreuErro ) then
        begin
          if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
            cdsTabelaItens.Post;

          cdsTabelaItens.ApplyUpdates;
          cdsTabelaItens.CommitUpdates;

          CommitTransaction;
        end;

        HabilitarDesabilitar_Btns;
      end;
    end;
  end;
end;

procedure TViewEntrada.ConfigurarCamposTabelas;
begin
  // Configurar tabela de cadastro
  Tabela
    .Display('CODCONTROL', 'No. Entrada', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('CODEMP',  'Empresa', True)
    .Display('CODFORN', 'Fornecedor', True)
    .Display('STATUS', 'Situação', TAlignment.taLeftJustify, True)
    .Display('TIPO_ENTRADA', 'Tipo de Entrada', True)
    .Display('DTEMISS', 'Data de Emissão', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('TIPO_DOCUMENTO', 'Tipo do Documento', True)
    .Display('NF', 'Número do Documento', False)
    .Display('NFSERIE', 'Série do Documento', TAlignment.taCenter, False)
    .Display('DTENT', 'Data de Entrada', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('IPI', 'IPI', ',0.00', TAlignment.taRightJustify, False)
    .Display('ICMSBASE', 'Base ICMS', ',0.00', TAlignment.taRightJustify, False)
    .Display('ICMSVALOR', 'Valor ICMS', ',0.00', TAlignment.taRightJustify, False)
    .Display('ICMSSUBSTBASE', 'Base ICMS Subst.', ',0.00', TAlignment.taRightJustify, False)
    .Display('ICMSSUBSTVALOR', 'Valor ICMS Subst.', ',0.00', TAlignment.taRightJustify, False)
    .Display('FRETE', 'Frete', ',0.00', TAlignment.taRightJustify, False)
    .Display('OUTROSCUSTOS', 'Outros', ',0.00', TAlignment.taRightJustify, False)
    .Display('DESCONTO', 'Desconto', ',0.00', TAlignment.taRightJustify, False)
    .Display('TOTALNF', 'Total Nota Fiscal', ',0.00', TAlignment.taRightJustify, True)
    .Display('TOTALPROD', 'Total Produto', ',0.00', TAlignment.taRightJustify, True)
    .Display('FORMAPAGTO_COD',    'Forma de Pagamento', True)
    .Display('CONDICAOPAGTO_COD', 'Condição de Pagamento', True)
    .Display('TIPO_DESPESA',      'Tipo de Despesa', True);

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( cdsTabelaItens )
    .Display('SEQ', '#', '00', TAlignment.taCenter)
    .Display('CODPROD', 'Produto')
    .Display('QTDE', 'Qtde.', ',0.##', TAlignment.taRightJustify)
    .Display('PRECOUNIT', 'Valor Unitário (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('CUSTOMEDIO', 'Outros (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('PERC_PARTICIPACAO', '% Partic.', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_FRETE', 'Frete (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_DESCONTO', 'Desconto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_OUTROS', 'Outros (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_IPI', 'Valor IPI (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA', '% Alíquota', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA_CSOSN', '% Alíquota SN', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA_PIS', '% Alíquota PIS', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA_COFINS', '% Alíquota COFINS', ',0.00', TAlignment.taRightJustify)
    .Display('PERCENTUAL_REDUCAO_BC', '% Redução BC', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_BRUTO', 'Total Bruto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_LIQUIDO', 'Total Líquido (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsTabelaItens );

  // Configurar tabela dos lotes
  TTabelaController
    .New
    .Tabela( cdsTabelaLotes )
    .Display('QTDE', 'Qtde.', ',0.##', TAlignment.taRightJustify)
    .Configurar( cdsTabelaLotes );

  // Configurar tabela das duplicatas
  TTabelaController
    .New
    .Tabela( qryDuplicatas )
    .Display('VALORPAG', 'Valor A Pagar', ',0.00', TAlignment.taRightJustify)
    .Configurar( qryDuplicatas );
end;

procedure TViewEntrada.ControlEditExit(Sender: TObject);
var
  cPrecoUN : Currency;
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( Sender = dbCFOPNF ) then
      if ( State in [dsEdit, dsInsert] ) then
        CarregarDadosCFOP( FieldByName('NFCFOP').AsInteger );

    if ( Sender = dbProduto ) then
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        CarregarDadosProduto( cdsTabelaItensCODPROD.AsInteger );

    if ( Sender = dbQuantidade ) then
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItensQTDEFINAL.Value := cdsTabelaItensQTDEANTES.Value + cdsTabelaItensQTDE.Value;

    if ( (Sender = dbValorUnit) or (Sender = dbValorIPIProduto) ) then
    begin
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      begin
        cPrecoUN := cdsTabelaItensPRECOUNIT.AsCurrency;

        cdsTabelaItensCUSTOMEDIO.AsCurrency  := cPrecoUN + cdsTabelaItensVALOR_IPI.AsCurrency;
        cdsTabelaItensTOTAL_BRUTO.AsCurrency := cPrecoUN * cdsTabelaItensQTDE.AsCurrency;

        if (FValorTotalProduto = 0.0) then
          FValorTotalProduto := FieldByName('TOTALPROD').AsCurrency;

        if ( FValorTotalProduto > 0.0 ) then
        begin
          if not dbCalcularTotais.Checked then
            cdsTabelaItensPERC_PARTICIPACAO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency / FValorTotalProduto * 100
          else
            cdsTabelaItensPERC_PARTICIPACAO.AsCurrency := 0.0;

          cdsTabelaItensVALOR_FRETE.Value        := cdsTabelaItensPERC_PARTICIPACAO.Value * FieldByName('FRETE').AsCurrency / 100;
          cdsTabelaItensVALOR_DESCONTO.Value     := cdsTabelaItensPERC_PARTICIPACAO.Value * FieldByName('DESCONTO').AsCurrency / 100;
          cdsTabelaItensVALOR_OUTROS.Value       := cdsTabelaItensPERC_PARTICIPACAO.Value * FieldByName('OUTROSCUSTOS').AsCurrency / 100;

          cdsTabelaItensTOTAL_LIQUIDO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensVALOR_DESCONTO.AsCurrency;
        end;
      end;
    end;

    if ( Sender = dbTotalBruto ) then
      if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
        btnProdutoSalvar.SetFocus;
  end;
end;

function TViewEntrada.Controller: IControllerEntrada;
begin
  Result := (FController as IControllerEntrada);
end;

procedure TViewEntrada.pgcGuiasChange(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
  end;
end;

procedure TViewEntrada.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    if ( not OcorreuErro ) then
    begin
      FValorTotalProduto := 0.0;
      DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger := Ord(TTipoMovimentoEntrada.tmeProduto);

      if ( FTipoMovimento = TTipoMovimentoEntrada.tmeProduto ) then
      begin
        FieldByName('NFCFOP').AsInteger  := FController.DAO.Configuracao.Padrao.CfopId;
        FieldByName('NATUREZA').AsString := IntToStr(FController.DAO.Configuracao.Padrao.CfopId);
      end;

      if FControllerCFOP.DAO.DataSet.IsEmpty or (FieldByName('NFCFOP').AsInteger <> FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cod').AsInteger) then
      begin
        FControllerCFOP.DAO.ClearWhere;
        FControllerCFOP
          .DAO
          .Where('c.Cfop_cod = ' + FieldByName('NFCFOP').AsString)
          .Open;
        FieldByName('CFOP_DESCRICAO').AsString := FControllerCFOP.DAO.DataSet.FieldByName('cfop_descricao').AsString
      end;

      // A estação tem certificado digital ?
      // A empresa tem permissão para emissão de NFe de entrada ?
      if (not FController.DAO.Configuracao.Certificado(FieldByName('CODEMP').AsString).NumeroSerie.IsEmpty)
        and Empresa.GetPermitirEmissaoNFeEntrada(FieldByName('CODEMP').AsString)
      then
      begin
        FieldByName('CALCULAR_TOTAIS').AsInteger := FLAG_SIM;
        if ( FTipoMovimento = TTipoMovimentoEntrada.tmeProduto ) then
        begin
          FieldByName('NFCFOP').AsInteger  := FController.DAO.Configuracao.Padrao.CfopEntradaID;
          FieldByName('NATUREZA').AsString := IntToStr(FController.DAO.Configuracao.Padrao.CfopEntradaID);
        end;
      end;

      AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    end;
end;

procedure TViewEntrada.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_CMP_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_CMP_FIN : sMsg := 'Esta entrada não pode ser alterada porque está finalizada.';
        STATUS_CMP_CAN : sMsg := 'Esta entrada não pode ser alterada porque está cancelada';
        STATUS_CMP_NFE : sMsg := 'Esta entrada não pode ser alterada porque exite Nota Fiscal gerada para este movimento.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
        AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      end;
    end;
  end;
end;

procedure TViewEntrada.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo   ,
  iCFOP_CNAE,
  iUnidade  : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sNCM_SH    ,
  sCST       : String;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorVenda,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    ,
  cValorCusto   : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case TTipoMovimentoEntrada(DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger) of
      tmeProduto:
        bSelecionado := SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
                          iEstoque, iReserva);

      tmeServico:
        bSelecionado := SelecionarServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao);

      else
        bSelecionado := False;
    end;

    if bSelecionado then
    begin
      cdsTabelaItensCODPROD.AsString     := sCodigoAlfa;
      cdsTabelaItensDESCRI.AsString      := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString   := sUnidade;

      cdsTabelaItensNCM_SH.AsString                  := sNCM_SH;
      cdsTabelaItensCST.AsString                     := sCST;
      cdsTabelaItensALIQUOTA.AsCurrency              := cAliquota;
      cdsTabelaItensALIQUOTA_PIS.AsCurrency          := cAliquotaPIS;
      cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := cAliquotaCOFINS;
      cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := cPercRedBC;

      if (TTipoMovimentoEntrada(DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto) then
      begin
        if not FControllerCFOP.DAO.DataSet.Active then
          CarregarDadosCFOP( DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger );

        if ( (FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString);
      end;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNID_COD.AsInteger := iUnidade;
    end;

  end;
end;

procedure TViewEntrada.dbSerieKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;

  if (Key = #13) then
  begin
    Key := #0;
    dbDataEntrada.SetFocus;
  end;
end;

procedure TViewEntrada.btbtnFinalizarClick(Sender: TObject);
var
  aGerarTitulos : Boolean;
  aEntrada      : TLancamentoEntrada;
  aDocumento    : TDocumentoEntrada;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Abort;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    aEntrada.Ano      := FieldByName('ANO').AsInteger;
    aEntrada.Controle := FieldByName('CODCONTROL').AsInteger;
    aDocumento.Fornecedor := FieldByName('CODFORN').AsInteger;
    aDocumento.Tipo       := FieldByName('TIPO_DOCUMENTO').AsInteger;
    aDocumento.Numero     := FieldByName('NF').AsInteger;

    if DocumentoDuplicado(aEntrada, aDocumento) then
      Abort;

    RecarregarRegistro;
    aGerarTitulos := GetCfopGerarDuplicata(FieldByName('NFCFOP').AsInteger) or (FTipoMovimento = tmeServico);

    pgcGuias.ActivePage := tbsCadastro;

    // Garantir a gravação dos itens na base
    try
      try
        cdsTabelaItens.First;
        //cdsTabelaItens.DisableControls;    // Esta ocasionado problema
        while not cdsTabelaItens.Eof do
        begin
          cdsTabelaItens.Edit;
          cdsTabelaItens.Post;
          cdsTabelaItens.ApplyUpdates;
          cdsTabelaItens.CommitUpdates;

          cdsTabelaItens.Next;
        end;
      except
        //cdsTabelaItens.EnableConstraints;  // Esta ocasionado problema
      end;
    finally
      CommitTransaction;

      cdsTabelaItens.First;
      //cdsTabelaItens.EnableConstraints;    // Esta ocasionado problema
    end;

    //cdsTabelaItens.Refresh;                // Esta ocasionado problema

    if (FieldByName('STATUS').AsInteger = STATUS_CMP_FIN) then
      ShowWarning('Movimento de Entrada já está finalizado!')
    else
    if (cdsTabelaItens.RecordCount = 0) then
      ShowWarning('Movimento de Entrada sem produto(s)!')
    else
    begin

      if (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) then
        if LoteProdutoPendente then
          if not LotesProdutosConfirmados(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger) then
            Abort
          else
            AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

      if ( FieldByName('CODFORN').AsInteger = 0 ) then
      begin
        Edit;

        ShowWarning('Favor informar o fornecedor');
        dbFornecedor.SetFocus;
      end
      else
      if ( FieldByName('TOTALPROD').AsCurrency = 0 ) then
      begin
        Edit;

        ShowWarning('Favor informar valor Total de ' + IfThen(FTipoMovimento = tmeProduto, 'Produtos', 'Serviços'));
        dbTotalProduto.SetFocus;
      end
      else
      if ( FieldByName('TOTALNF').AsCurrency = 0 ) then
      begin
        Edit;

        ShowWarning('Favor informar valor Total da Nota Fiscal');
        dbTotalNotaFiscal.SetFocus;
      end
      else
      if ( FieldByName('FORMAPAGTO_COD').AsInteger = 0 ) then
      begin
        Edit;

        ShowWarning('Favor informar a forma de pagamento');
        dbFormaPagto.SetFocus;
      end
      else
      if ( FieldByName('CONDICAOPAGTO_COD').AsInteger = 0 ) then
      begin
        Edit;

        ShowWarning('Favor informar a condição de pagamento');
        dbCondicaoPagto.SetFocus;
      end
      else
      if ( ShowConfirm('Confirma a finalização da entrada selecionada?') ) then
      begin
        Edit;

        FieldByName('STATUS').AsInteger                := STATUS_CMP_FIN;
        FieldByName('DTFINALIZACAO_COMPRA').AsDateTime := Now;

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        if aGerarTitulos then
          GerarDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

        AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

        ShowInformation('Entrada finalizada com sucesso !');

        if aGerarTitulos then
          if ( DuplicatasConfirmadas(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('DTEMISS').AsDateTime, FieldByName('TOTALNF').AsCurrency) ) then
            AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

        HabilitarDesabilitar_Btns;
      end;

    end;
  end;
end;

procedure TViewEntrada.GerarDuplicatas(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  try

    try

      UpdateSequence('GEN_CONTAPAG_NUM_' + IntToStr(AnoCompra), 'TBCONTPAG', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoCompra));

      with spGerarDuplicatas do
      begin
        ParamByName('anocompra').AsInteger := AnoCompra;
        ParamByName('numcompra').AsInteger := ControleCompra;
        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar duplicatas.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TViewEntrada.qryDuplicatasCalcFields(DataSet: TDataSet);
begin
  qryDuplicatasLancamento.AsString := FormatFloat('0000', qryDuplicatasANOLANC.AsInteger) + FormatFloat('000000', qryDuplicatasNUMLANC.AsInteger);
end;

procedure TViewEntrada.btnRegerarDuplicataClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger <> STATUS_CMP_FIN ) then
    ShowWarning('É permitida a geração de duplicatas apenas para entradas finalizadas')
  else
  if ( not qryDuplicatas.IsEmpty ) then
    ShowWarning('Já existe(m) duplicata(s) gerado(s) para esta entrada')
  else
  if (not GetCfopGerarDuplicata(DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger)) then
    ShowWarning('A CFOP utilizada nesta compra não permite a geração de duplicatas')
  else
  if ( ShowConfirm('Confirma geração do(s) duplicata(s) a receber da entrada?') ) then
  begin
    GerarDuplicatas( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaDuplicatas( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  end;
end;

procedure TViewEntrada.btnTituloEditarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( not (FieldByName('STATUS').AsInteger in [STATUS_CMP_FIN, STATUS_CMP_NFE]) ) then
      ShowWarning('É permitida a edição de duplicatas apenas para compras finalizadas')
    else
    if ( qryDuplicatas.IsEmpty ) then
      ShowWarning('Não existe(m) duplicata(s) gerado(s) para esta compra')
    else
    if ( FieldByName('COMPRA_PRAZO').AsInteger = 1 ) then
    begin
      if ( DuplicatasConfirmadas(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('DTEMISS').AsDateTime, FieldByName('TOTALNF').AsCurrency) ) then
        AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    end;
  end;
end;

procedure TViewEntrada.dbCFOPNFButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, TTipoCFOP.tcfopADefinir, iCodigo, sDescricao) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger        := iCodigo;
      DtSrcTabela.DataSet.FieldByName('CFOP_DESCRICAO').AsString := sDescricao;
    end;
end;

procedure TViewEntrada.CarregarDadosCFOP(iCodigo: Integer);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( not Active ) then
      Exit
    else
    if (State in [dsEdit, dsInsert]) then
    begin
      FControllerCFOP.DAO.ClearWhere;
      FControllerCFOP
        .DAO
        .Where('c.Cfop_cod = ' + iCodigo.ToString)
        .Open;

      if not FControllerCFOP.DAO.DataSet.IsEmpty then
        FieldByName('CFOP_DESCRICAO').AsString := FControllerCFOP.DAO.DataSet.FieldByName('cfop_descricao').AsString
      else
      begin
        if ( TTipoMovimentoEntrada(FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto ) then
          ShowWarning('Código CFOP não cadastrado');

        FieldByName('NFCFOP').Clear;
        if ( dbCFOPNF.Visible and dbCFOPNF.Enabled ) then
          dbCFOPNF.SetFocus;
      end;
    end;
  end;
end;

procedure TViewEntrada.CarregarDadosEmpresa(const pEmpresa, pTituloRelatorio: String);
begin
  try
    DMNFe.AbrirEmitente(pEmpresa);
    DMBusiness.ConfigurarEmail(pEmpresa, EmptyStr, pTituloRelatorio, EmptyStr);
  except
  end;
end;

procedure TViewEntrada.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  btnImportar.Enabled := btbtnIncluir.Enabled;
  pgcMaisDados.ActivePageIndex := 0;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_CMP_FIN );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );

  FControllerFormaPagto
    .DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  FControllerCondicaoPagtoView
    .DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  FControllerTipoDespesa
    .DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

function TViewEntrada.Empresa: IControllerEmpresa;
begin
  Result := (FControllerEmpresaView as IControllerEmpresa);
end;

procedure TViewEntrada.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
  end;
end;

procedure TViewEntrada.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    if (not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])) then
    begin
      FControllerCFOP.DAO.ClearWhere;
      FControllerCFOP
        .DAO
        .Where('c.Cfop_cod = ' + StrToIntDef(DtSrcTabela.DataSet.FieldByName('NFCFOP').AsString, 0).ToString)
        .Open;
    end;
  end;
end;

procedure TViewEntrada.fdQryTabelaAUTORIZACAO_CODIGOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('###0000000"/"', Sender.AsInteger) + Copy(DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_ANO').AsString, 3, 2);
end;

procedure TViewEntrada.DataSetStatusGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_CMP_ABR : Text := 'Aberta';
    STATUS_CMP_FIN : Text := 'Finalizada';
    STATUS_CMP_CAN : Text := 'Cancelada';
    STATUS_CMP_NFE : Text := 'NF-e Emitida';
    else
      Text := Sender.AsString;
  end;
end;

procedure TViewEntrada.btbtnCancelarENTClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

(*
  if ( PossuiTitulosPagos(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger) ) then
  begin
    ShowWarning('A compra possui despesa(s) já baixada(s).' + #13 + 'Favor providenciar a exclusão da(s) baixa(s) para que a compra possa ser cancelada!');
    Exit;
  end;
*)
  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CMP_CAN) then
  begin
    ShowWarning('Movimento de Entrada já está cancelado!');
    Abort;
  end;

  with DtSrcTabela.DataSet do
    if ( CancelarENT(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger) ) then
    begin
      RecarregarRegistro;

      AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

      ShowInformation('Entrada cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODCONTROL').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TViewEntrada.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar Movimento de Entrada Aberto
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CMP_ABR ) then
        dbgDados.Canvas.Font.Color := lblEntradaAberta.Font.Color
      else
      // Destacar Movimento de Entrada Cancelado
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CMP_CAN ) then
        dbgDados.Canvas.Font.Color := lblEntradaCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TViewEntrada.dbgDadosEnter(Sender: TObject);
begin
//  Self.OnKeyPress := nil;
end;

procedure TViewEntrada.dbgDadosExit(Sender: TObject);
begin
//  Self.OnKeyPress := FormKeyPress;
end;

procedure TViewEntrada.btbtnGerarNFeClick(Sender: TObject);
var
  iNumero    ,
  iSerieNFe  ,
  iNumeroNFe : Integer;
  sFileNameXML  ,
  sChaveNFE     ,
  sProtocoloNFE ,
  sReciboNFE    : String;
  iNumeroLote   : Int64;
  bNFeGerada    : Boolean;
  TipoMovimento : TTipoMovimento;
  aDenegada : Boolean;
  aDenegadaMotivo : String;
begin
{
  IMR - 23/04/2018 :
    Validar o Tipo de CFOP (Entrada ou Saída) antes da emissão da Nota Fiscal de
    Entrada.

  IMR - 02/08/2017 :
    Inserção da função "EmissaoNFE_Pendente()" para impedir que uma nota fiscal
    seja emitida se houver um outro pedido de emissão pendente.

  IMR - 08/12/2015 :
    Inserção da validação do código CFOP antes da geração da Nota Fiscal.

  IMR - 04/05/2015 :
    Inclusão do bloco de código para buscar o retorno NF-e quando esta já fora
    solicitada, mas seu retorno ainda não fora processado pela aplicação.

  IMR - 23/05/2015 :
    Inclusão do bloco de código para verificar se o CFOP da entrada corresponde
    a uma operação de devolução. Caso esta situação seja confirmada, a NF-e de
    origem será solicitada.
}
  with DtSrcTabela.DataSet do
  begin
    if ( DtSrcTabela.DataSet.IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    bNFeGerada := (FieldByName('NF').AsCurrency > 0) and (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE);

    if (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) then
    begin
      ShowWarning('Movimento de Entrada já está com NF-e gerada!');
      Abort;
    end;

    if DMNFe.ConfigurarParamentoNFE(FieldByName('CODEMP').AsString) then
    begin
      ShowInformation('A emissão da NF-e exige a configuração dos parâmetros da empresa.' + #13 + 'Favor entrar em contrato com suporte.');
      Exit;
    end;

    if not GetPermititEmissaoNFeEntrada( FieldByName('CODEMP').AsString ) then
    begin
      ShowInformation('Empresa selecionada não habilitada para emissão de NF-e p/ Entradas.' + #13 + 'Favor entrar em contato com suporte.');
      Exit;
    end;

    if (GetCfopTipo(FieldByName('NFCFOP').AsInteger) <> tcfopEntrada) then
    begin
      ShowInformation('CFOP ' + QuotedStr(FieldByName('NFCFOP').AsString) + ' não permitida para a Emissão de Notas Fiscais de Entrada.' + #13 + 'Favor corrigir número de CFOP.');
      Exit;
    end;

    if not DMNFe.ValidarCFOP(FieldByName('CODEMP').AsString, 0, FieldByName('CODFORN').AsInteger, FieldByName('NFCFOP').AsInteger) then
      Exit;

    if not DMNFe.ValidarEnderecoFornecedor(FieldByName('CODFORN').AsInteger) then
      Exit;

    if not DMNFe.GetValidadeCertificado(FieldByName('CODEMP').AsString) then
      Exit;

    if ( Trim(FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
      if GetCfopDevolucao( FieldByName('NFCFOP').AsInteger ) then
        if not InformarDocumentoReferenciado(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger) then
          Exit;

    // Buscar retorno do envio pendente, caso ele tenha ocorrido
    if not bNFeGerada then
      if ( Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr ) then
      begin
        bNFeGerada := BuscarRetornoReciboNFe(Self
          , FieldByName('CODEMP').AsString
          , Trim(FieldByName('LOTE_NFE_RECIBO').AsString)
          , iSerieNFe
          , iNumeroNFe
          , sFileNameXML
          , sChaveNFE
          , sProtocoloNFE
          , TipoMovimento
          , aDenegada
          , aDenegadaMotivo);

        if not bNFeGerada then
          Exit;

        if ( TipoMovimento <> tmNFeEntrada ) then
        begin
          ShowWarning('Tipo do movimento do recibo incompatível!');
          Exit;
        end;

        sReciboNFE  := Trim(FieldByName('LOTE_NFE_RECIBO').AsString);
        iNumeroLote := iNumeroNFe;

        if aDenegada then
          DMNFe.UpdateNFeDenegadaEntrada(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
            , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
            , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger
            , aDenegadaMotivo);
      end;

    if not bNFeGerada then
    begin
      if DMNFe.EmissaoNFE_Pendente(FieldByName('CODEMP').AsString, True) then
        Abort;

      bNFeGerada := GerarNFeEntrada(Self
        , FieldByName('ANO').AsInteger
        , FieldByName('CODCONTROL').AsInteger
        , iSerieNFe
        , iNumeroNFe
        , sFileNameXML
        , sChaveNFE
        , sProtocoloNFE
        , sReciboNFE
        , iNumeroLote);
    end;

    if bNFeGerada then
    begin
      with DtSrcTabela.DataSet do
      begin
        iNumero := FieldByName('CODCONTROL').AsInteger;

        // Analisar o nome do arquivo XML retornado
        if (Trim(sFileNameXML) = EmptyStr) or (not FileExists(sFileNameXML)) then
          sFileNameXML := DMNFe.GetDiretorioXmlNFe + sChaveNFE + '-nfe.xml';

        AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

        qryNFE.Append;

        qryNFEEMPRESA.Value     := FieldByName('CODEMP').AsString;
        qryNFEANOCOMPRA.Value   := FieldByName('ANO').AsInteger;
        qryNFENUMCOMPRA.Value   := FieldByName('CODCONTROL').AsInteger;
        qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
        qryNFENUMERO.Value      := iNumeroNFe;
        qryNFEMODELO.Value      := DMNFe.GetModeloDF;
        qryNFEVERSAO.Value      := DMNFe.GetVersaoDF;
        qryNFEDATAEMISSAO.Value := GetDateDB;
        qryNFEHORAEMISSAO.Value := GetTimeDB;
        qryNFECHAVE.Value     := sChaveNFE;
        qryNFEPROTOCOLO.Value := sProtocoloNFE;
        qryNFERECIBO.Value    := sReciboNFE;
        qryNFELOTE_ANO.Value  := FieldByName('ANO').AsInteger;
        qryNFELOTE_NUM.Value  := iNumeroLote;

        if ( FileExists(sFileNameXML) ) then
        begin
          CorrigirXML_NFe(EmptyWideStr, sFileNameXML);

          qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
          qryNFEXML_FILE.LoadFromFile( sFileNameXML );
        end;

        qryNFEANOVENDA.Clear;
        qryNFENUMVENDA.Clear;

        try
          qryNFE.Post;
          qryNFE.ApplyUpdates;
          qryNFE.CommitUpdates;
          CommitTransaction;
        except
          On E : Exception do
            ShowError('Número da NF-e não recuperado.' + #13 + 'Execute novamente o procedimento.' + #13#13 + E.Message);
        end;

        FController.DAO.RefreshRecord;

        if (DtSrcTabela.DataSet.FieldByName('NF').AsInteger = 0) then
          ShowWarning('Número da NF-e não recuperado.' + #13 + 'Execute novamente o procedimento.')
        else
          ShowInformation('Nota Fiscal de Entrada gerada com sucesso.' + #13#13 + 'Série/Número: ' + FieldByName('NFSERIE').AsString + '/' + FormatFloat('##0000000', FieldByName('NF').AsInteger));

        HabilitarDesabilitar_Btns;

        nmImprimirDANFE.Click;
      end;
    end
    else
      RecarregarRegistro;

    TbsInformeNFe.TabVisible := (Trim(FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr);
  end;
end;

procedure TViewEntrada.btbtnListaClick(Sender: TObject);
begin
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewEntrada.nmImprimirDANFEClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    isPDF := ( Sender = nmGerarDANFEXML );

    DMNFe.ImprimirDANFEEntradaACBr( FieldByName('CODEMP').AsString, FieldByName('CODFORN').AsInteger, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, isPDF);
  end;
end;

procedure TViewEntrada.nmImprimirEspelhoClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet, DMNFe do
  begin
    if ( IsEmpty ) then
      Exit;

    CarregarDadosEmpresa(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, 'Espelho do Documento de Entrada');
    AbrirEmitente( FieldByName('CODEMP').AsString );
    AbrirDestinatarioFornecedor( FieldByName('CODFORN').AsInteger );
    AbrirCompra( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

    frrEntradaEspelho.ShowReport;
  end;
end;

procedure TViewEntrada.nmGerarDANFEXMLClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    isPDF := ( Sender = nmGerarDANFEXML );

    DMNFe.ImprimirDANFEEntradaACBr( FieldByName('CODEMP').AsString, FieldByName('CODFORN').AsInteger, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, isPDF);
  end;
end;

procedure TViewEntrada.dbAutorizacaoButtonClick(Sender: TObject);
var
  iAno    ,
  iCodigo : Integer;
  sEmpresa,
  sMotivo ,
  sObservacao  : String;
  dDataInicial : TDateTime;
  iFormaPagto    ,
  iCOndicaoPagto : Integer;
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
    begin
      if ( FieldByName('CODFORN').AsInteger = 0 ) then
      begin
        ShowInformation('Favor selecionar o Fornecedor primeiramente!');
        dbFornecedor.SetFocus;
      end
      else
      begin
        { DONE -oIsaque -cEntrada : 22/05/2014 - Gerar Data Inicial padrão para busca de Autorizações de Compras }

        dDataInicial := StrToDateTime('01/' + FormatDateTime('mm/yyyy', GetDateDB));
        if ( (GetDateDB - dDataInicial) < 7 ) then
          dDataInicial := GetDateDB - 7;

        if ( SelecionarAutorizacao(Self, FieldByName('CODFORN').AsInteger, dDataInicial, iAno, iCodigo, sEmpresa, sMotivo, sObservacao, iFormaPagto, iCOndicaoPagto) ) then
        begin
          FieldByName('AUTORIZACAO_ANO').AsInteger    := iAno;
          FieldByName('AUTORIZACAO_CODIGO').AsInteger := iCodigo;
          FieldByName('AUTORIZACAO_EMPRESA').AsString := sEmpresa;

          if (sMotivo <> EmptyStr) then
            dbObservacao.Lines.Add(sMotivo);

          if (sObservacao <> EmptyStr) then
            dbObservacao.Lines.Add(sObservacao);

          if (iFormaPagto > 0) then
            FieldByName('FORMAPAGTO_COD').AsInteger := iFormaPagto;

          if (iCOndicaoPagto > 0) then
          begin
            FieldByName('CONDICAOPAGTO_COD').AsInteger := iCOndicaoPagto;
            dbCondicaoPagtoClick(dbCondicaoPagto);
          end;
        end;
      end
    end;
end;

procedure TViewEntrada.RecarregarRegistro;
begin
  with DtSrcTabela.DataSet do
  begin
    if (not FieldByName('DTEMISS').IsNull) then
    begin
      if ( FieldByName('DTEMISS').AsDateTime < e1Data.Date ) then
        e1Data.Date := FieldByName('DTEMISS').AsDateTime;

      if (FieldByName('DTEMISS').AsDateTime > e2Data.Date) then
        e2Data.Date := FieldByName('DTEMISS').AsDateTime;
    end;

    FController.DAO.RefreshRecord;
  end;
end;

procedure TViewEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin

    if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])  then
    begin

      { DONE -oIsaque -cEntrada : 28/05/2014 - Verificar Data de Emissão da NF }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > Date ) then
            ShowWarning('A Data de Emissão da NF está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

      if dbDataEntrada.Focused then
        if ( dbDataEntrada.Date > Date ) then
            ShowWarning('A Data de Entrada da NF está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end;

  // Desistir na inserção de um novo produto/serviço
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
    cdsTabelaItens.Cancel
  else
    inherited;
end;

procedure TViewEntrada.FormShow(Sender: TObject);
begin
  inherited;
  btnImportar.Visible := (FTipoMovimento = tmeProduto);
  bvlImportar.Visible := (FTipoMovimento = tmeProduto);

  nmImprimirEspelho.Visible := (FTipoMovimento = tmeProduto);
  dvImprimirEspelho.Visible := (FTipoMovimento = tmeProduto);

  btbtnGerarNFe.Visible := btbtnGerarNFe.Visible and (FTipoMovimento = tmeProduto);

  if ( FTipoMovimento = TTipoMovimentoEntrada.tmeServico ) then
  begin
    lblCFOPNF.Caption       := 'CNAE:';
    lblBaseICMS.Caption     := 'Base ISS:';
    lblValorICMS.Caption    := 'Valor ISS:';
    lblTotalProduto.Caption := 'Total Serviço:';

    lblCFOPNF.Enabled := False;
    dbCFOPNF.Enabled  := False;
    lblBaseICMSSubs.Enabled  := False;
    dbBaseICMSSubs.Enabled   := False;
    lblValorICMSSubs.Enabled := False;
    dbValorICMSSubs.Enabled  := False;
    lblValorFrete.Enabled    := False;
    dbValorFrete.Enabled     := False;
    lblValorIPI.Enabled      := False;
    dbValorIPI.Enabled       := False;
    lblValorIPIProduto.Enabled := False;
    dbValorIPIProduto.Enabled  := False;

    GrpBxDadosProduto.Caption := 'Dados do serviço';
    lblProduto.Caption := 'Serviço';
    dbgProdutos.Columns[1].Title.Caption := 'Serviço';
    dbgProdutos.Columns[2].Title.Caption := 'Descrição do Serviço';

    dbgDados.Columns[7].Visible       := False;
    dbgDados.Columns[8].Title.Caption := 'Total Serviço';
  end;

  tbsLotes.TabVisible := (FTipoMovimento = TTipoMovimentoEntrada.tmeProduto);

  if Trim(DisplayFormatCodigo) <> EmptyStr then
    CentralizarCodigo;

  RegistrarNovaRotinaSistema;
end;

function TViewEntrada.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btbtnFinalizar);
end;

function TViewEntrada.GetRotinaGerarNFeID: String;
begin
  Result := GetRotinaInternaID(btbtnGerarNFe);
end;

function TViewEntrada.GetRotinaCancelarEntradaID: String;
begin
  Result := GetRotinaInternaID(btbtnCancelarENT);
end;

procedure TViewEntrada.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnFinalizar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btbtnFinalizar.Caption, RotinaID);

    if btbtnGerarNFe.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarNFeID, btbtnGerarNFe.Caption, RotinaID);

    if btbtnCancelarENT.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarEntradaID, btbtnCancelarENT.Caption, RotinaID);
  end;
end;

procedure TViewEntrada.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TViewEntrada.AbrirNotaFiscal(const pEmpresa: String;
  const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  with qryNFE do
  begin
    Close;
    ParamByName('empresa').AsString    := pEmpresa;
    ParamByName('anocompra').AsInteger := AnoCompra;
    ParamByName('numcompra').AsInteger := ControleCompra;
    Open;
  end;
end;

procedure TViewEntrada.nmPpCorrigirDadosNFeCFOPClick(
  Sender: TObject);
var
  aCodigo    : Integer;
  aDescricao : String;
begin
  if not BtnCorrigirDadosNFe.Enabled then
    Exit;

  with DtSrcTabela.DataSet do
    if ( SelecionarCFOP(Self, TTipoCFOP.tcfopADefinir, aCodigo, aDescricao) ) then
    begin
      Controller.CorrigirCFOP(aCodigo.ToString);
      RecarregarRegistro;

      AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaLotes( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaDuplicatas( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

      ShowInformation('Correção', 'CFOP corrigido com sucesso!' + #13 + 'Favor pesquisar entrada novamente.');
    end;
end;

procedure TViewEntrada.BtnCorrigirDadosNFeClick(Sender: TObject);
begin
  if not BtnLimparDadosNFe.Enabled then
    ppCorrigirDadosNFe.Popup(BtnCorrigirDadosNFe.ClientOrigin.X, BtnCorrigirDadosNFe.ClientOrigin.Y + BtnCorrigirDadosNFe.Height);
end;

procedure TViewEntrada.nmPpLimparDadosNFeClick(Sender: TObject);
var
  sArquivoENV ,
  sArquivoREC ,
  sArquivoNFe1,
  sArquivoNFe2,
  sDirXMLNFe  : String;
begin
  with DtSrcTabela.DataSet do
    if not IsEmpty then
    begin
      if ( Trim(FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
        Exit;

      if ( FieldByName('NF').AsCurrency > 0 ) then
        Exit;

      if not ShowConfirmation('Limpar LOG', 'Confirma a limpeza do LOG de envio de NF-e para que esta seja enviada novamente?') then
        Exit;

      // Realocar arquivos XML de envio
      sDirXMLNFe := DMNFe.GetPathNFeXML(FieldByName('CODEMP').AsString);
      if DirectoryExists(sDirXMLNFe) then
      begin
        sArquivoENV  := StringReplace(sDirXMLNFe + '\' + FieldByName('LOTE_NFE_NUMERO').AsString + '-env-lot.xml', '\\', '\', [rfReplaceAll]);
        sArquivoREC  := StringReplace(sDirXMLNFe + '\' + FieldByName('LOTE_NFE_NUMERO').AsString + '-rec.xml',     '\\', '\', [rfReplaceAll]);
        sArquivoNFe1 := StringReplace(sDirXMLNFe + '\' +
          DMNFe.GetGerarChaveNFeXML(
            FieldByName('CODEMP').AsString,
            FieldByName('ANO').AsInteger,
            FieldByName('CODCONTROL').AsInteger,
            tnfEntrada) + '-nfe.xml', '\\', '\', [rfReplaceAll]);

        sArquivoNFe2 := StringReplace(sDirXMLNFe + '\' +
          DMNFe.GetGerarChaveNFeXML(
            FieldByName('CODEMP').AsString,
            FieldByName('ANO').AsInteger,
            FieldByName('CODCONTROL').AsInteger,
            tnfEntrada) + '-nfe_view.xml', '\\', '\', [rfReplaceAll]);

        ForceDirectories(ExtractFilePath(sArquivoENV) + 'log\');

        System.SysUtils.DeleteFile(ExtractFilePath(sArquivoENV)  + 'log\' + ExtractFileName(sArquivoENV));
        System.SysUtils.DeleteFile(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoREC));
        System.SysUtils.DeleteFile(ExtractFilePath(sArquivoNFe1) + 'log\' + ExtractFileName(sArquivoNFe1));
        System.SysUtils.DeleteFile(ExtractFilePath(sArquivoNFe2) + 'log\' + ExtractFileName(sArquivoNFe2));

        MoveFile(PChar(sArquivoENV),  PChar(ExtractFilePath(sArquivoENV)  + 'log\' + ExtractFileName(sArquivoENV)));
        MoveFile(PChar(sArquivoREC),  PChar(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoREC)));
        MoveFile(PChar(sArquivoNFe1), PChar(ExtractFilePath(sArquivoNFe1) + 'log\' + ExtractFileName(sArquivoNFe1)));
        MoveFile(PChar(sArquivoNFe2), PChar(ExtractFilePath(sArquivoNFe2) + 'log\' + ExtractFileName(sArquivoNFe2)));
      end;

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update TBCOMPRAS Set ');
        SQL.Add('    LOTE_NFE_ANO    = null');
        SQL.Add('  , LOTE_NFE_NUMERO = null');
        SQL.Add('  , LOTE_NFE_CODIGO = null');
        SQL.Add('  , LOTE_NFE_RECIBO = null');
        SQL.Add('where ANO        = ' + FieldByName('ANO').AsString);
        SQL.Add('  and CODCONTROL = ' + FieldByName('CODCONTROL').AsString);
        SQL.Add('  and CODEMP     = ' + QuotedStr(FieldByName('CODEMP').AsString));
        ExecSQL;

        CommitTransaction;
      end;

      RecarregarRegistro;
      AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );

      ShowInformation('Dados NF-e', 'LOG de envio de recibo NF-e limpo com sucesso!');
    end;
end;

procedure TViewEntrada.nmPpReciboNFeClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if not IsEmpty then
    begin
      if ( Trim(FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
        Exit;

      Clipboard.AsText := Trim(FieldByName('LOTE_NFE_RECIBO').AsString);
      ShowInformation('Dados NF-e', 'Número de Recibo de Envio da NF-e:' + #13 + Trim(FieldByName('LOTE_NFE_RECIBO').AsString));
    end;
end;

procedure TViewEntrada.nmPpChaveNFeClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if not IsEmpty then
    begin
      if ( Trim(FieldByName('VERIFICADOR_NFE').AsString) = EmptyStr ) then
        Exit;

      Clipboard.AsText := Trim(FieldByName('VERIFICADOR_NFE').AsString);
      ShowInformation('Dados NF-e', 'Chave da NF-e:' + #13 + Trim(FieldByName('VERIFICADOR_NFE').AsString));
    end;
end;

procedure TViewEntrada.nmPpArquivoNFeClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if not IsEmpty then
    begin
      if ( Trim(FieldByName('XML_NFE_FILENAME').AsString) = EmptyStr ) then
        Exit;

      Clipboard.AsText := Trim(FieldByName('XML_NFE_FILENAME').AsString);
      ShowInformation('Dados NF-e', 'Nome do Arquivo XML NF-e:' + #13 + Trim(FieldByName('XML_NFE_FILENAME').AsString));
    end;
end;

initialization
  FormFunction.RegisterForm('ViewEntrada', TViewEntrada);

end.
