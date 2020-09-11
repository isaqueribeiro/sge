unit UGeProduto;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, cxGraphics, JvDBControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TAliquota = (taICMS, taISS);

  TUnidade = record
    aCodigo   : Integer;
    aDescricao,
    aSigla    : String;
  end;

  TProdutoServico = record
    aCodigo      : Integer;
    aCodigoAlfa  ,
    aCodigoEAN   ,
    aDescricao   ,
    aApresentacao,
    aNome        ,
    aReferencia  : String;
    aUnidadeCompra  ,
    aUnidadeConsumo : TUnidade;
    aCST    ,
    aNCM_SH : String;
    aCFOP ,
    aCNAE : Integer;
    aAliquota       ,
    aAliquotaPIS    ,
    aAliquotaCOFINS ,
    aValorVenda     ,
    aValorPromocao  ,
    aValorIPI       ,
    aValorCusto     ,
    aPercentualRedBC,
    aEstoque ,
    aReserva : Currency;
    aMovimentaEstoque,
    aEstoquePorLote  : Boolean;
  end;

  ProdutoServicoPonteiro = ^TProdutoServico;

  TfrmGeProduto = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    lblReferencia: TLabel;
    dbReferencia: TDBEdit;
    dtsEmpresa: TDataSource;
    lblModelo: TLabel;
    dbModelo: TDBEdit;
    lblSecao: TLabel;
    lblGrupo: TLabel;
    Bevel5: TBevel;
    dtsOrigem: TDataSource;
    dtsTributacaoNM: TDataSource;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsHistoricoVeiculo: TTabSheet;
    GrpBxDadosEstoque: TGroupBox;
    lblEstoqueQtde: TLabel;
    dbEstoqueQtde: TDBEdit;
    lblEstoqueMinimo: TLabel;
    dbEstoqueMinimo: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCusto: TLabel;
    dbCusto: TDBEdit;
    lblPreco: TLabel;
    dbPreco: TDBEdit;
    lblCodigoEAN: TLabel;
    dbCodigoEAN: TDBEdit;
    dtsAliquota: TDataSource;
    lblReserva: TLabel;
    dbReserva: TDBEdit;
    dtsTributacaoSN: TDataSource;
    lblPrecoPromocao: TLabel;
    dbPrecoPromocao: TDBEdit;
    lblProdutoPromocao: TLabel;
    lblProdutoSemEstoque: TLabel;
    lblProdutoDesativado: TLabel;
    lblFabricante: TLabel;
    TbsEspecificacao: TTabSheet;
    lblApresentacao: TLabel;
    dbApresentacao: TDBEdit;
    dtsCor: TDataSource;
    dtsCombustivel: TDataSource;
    dtsTipoVeiculo: TDataSource;
    lblSituacaoVeiculo: TLabel;
    dbSituacaoVeiculo: TDBEdit;
    lblHistoricoSituacaoVeiculo: TLabel;
    dbHistoricoSituacaoVeiculo: TDBMemo;
    tbsTributacao: TTabSheet;
    GrpBxDadosTributoICMS: TGroupBox;
    lblOrigem: TLabel;
    lblTipoTributacaoNM: TLabel;
    lblCFOP: TLabel;
    lblAliquota: TLabel;
    lblIPI: TLabel;
    lblAliquotaTipo: TLabel;
    lblNCM_SH: TLabel;
    lblTipoTributacaoSN: TLabel;
    lblAliquotaSN: TLabel;
    lblPercentualReducaoBC: TLabel;
    dbOrigem: TDBLookupComboBox;
    dbTipoTributacaoNM: TDBLookupComboBox;
    dbAliquota: TDBEdit;
    dbIPI: TDBEdit;
    dbAliquotaTipo: TDBLookupComboBox;
    dbTipoTributacaoSN: TDBLookupComboBox;
    dbAliquotaSN: TDBEdit;
    dbPercentualReducaoBC: TDBEdit;
    Bevel6: TBevel;
    GrpBxDadosTributoPIS: TGroupBox;
    Bevel7: TBevel;
    lblCSTPIS: TLabel;
    dbCSTPIS: TDBLookupComboBox;
    lblCSTCOFINS: TLabel;
    dbCSTCOFINS: TDBLookupComboBox;
    chkProdutoComEstoque: TCheckBox;
    lblAliquotaCOFINS: TLabel;
    dbAliquotaCOFINS: TDBEdit;
    lblAliquotaPIS: TLabel;
    dbAliquotaPIS: TDBEdit;
    dtsAliquotaPIS: TDataSource;
    dtsAliquotaCOFINS: TDataSource;
    lblPercentualMarkup: TLabel;
    dbPercentualMarkup: TDBEdit;
    lblPrecoVendaSugestao: TLabel;
    dbPrecoVendaSugestao: TDBEdit;
    CmbBxFiltrarTipo: TComboBox;
    lblLucroValor: TLabel;
    dbLucroValor: TDBEdit;
    ShpLucroZerado: TShape;
    lblLucroZerado: TLabel;
    ShpLucroNegativo: TShape;
    lblLucroNegativo: TLabel;
    GrpBxFracionamentoPreco: TGroupBox;
    lblPrecoFrac: TLabel;
    dbPrecoFrac: TDBEdit;
    dbPrecoPromocaoFrac: TDBEdit;
    lblPrecoPromocaoFrac: TLabel;
    lblPrecoSugeridoFrac: TLabel;
    dbPrecoSugeridoFrac: TDBEdit;
    lblFracionador: TLabel;
    dbFracionador: TDBEdit;
    dbVendaFracionada: TDBCheckBox;
    lblUnidadeFracao: TLabel;
    pnlVeiculo: TPanel;
    pnlVolume: TPanel;
    GrpVolume: TGroupBox;
    lblPesoBruto: TLabel;
    dbPesoBruto: TDBEdit;
    GrpVeiculo: TGroupBox;
    lblTipoVeiculo: TLabel;
    dbTipoVeiculo: TDBLookupComboBox;
    lblRenavam: TLabel;
    dbRenavam: TDBEdit;
    lblCorVeiculo: TLabel;
    dbCorVeiculo: TDBLookupComboBox;
    lblChassi: TLabel;
    dbChassi: TDBEdit;
    lblTipoCombustivel: TLabel;
    dbTipoCombustivel: TDBLookupComboBox;
    lblAnoFabricacao: TLabel;
    dbAnoFabricacao: TDBEdit;
    lblAnoModelo: TLabel;
    dbAnoModelo: TDBEdit;
    lblKilometragem: TLabel;
    dbKilometragem: TDBEdit;
    lblPesoLiquido: TLabel;
    dbPesoLiquido: TDBEdit;
    lblCubagem: TLabel;
    dbCubagem: TDBEdit;
    lblNVE: TLabel;
    dbNVE: TDBEdit;
    lblUnidade: TLabel;
    lblTipoCadastro: TLabel;
    dbTipoCadastro: TDBLookupComboBox;
    pnlEspecificacao: TPanel;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    Bevel9: TBevel;
    popFerramentas: TPopupMenu;
    ppMnAtualizarMetafonema: TMenuItem;
    ppImprimir: TPopupMenu;
    nmProdutoLista: TMenuItem;
    nmProdutoFicha: TMenuItem;
    nmProdutoEtiqueta: TMenuItem;
    dbCFOP: TJvDBComboEdit;
    dbGrupo: TJvDBComboEdit;
    dbFabricante: TJvDBComboEdit;
    dbUnidade: TJvDBComboEdit;
    dbUnidadeFracao: TJvDBComboEdit;
    dbSecao: TJvDBComboEdit;
    tbsCustoVeiculo: TTabSheet;
    grpCustosVeiculo: TGroupBox;
    lblValorCompraVeiculo: TLabel;
    lblOutros: TLabel;
    lblValorOficinaVeiculo: TLabel;
    lblValorComissaoVeiculo: TLabel;
    lblImpostos: TLabel;
    lblAdm: TLabel;
    dbValorCompraVeiculo: TDBEdit;
    dbValorComissaoVeiculo: TDBEdit;
    dbValorOficinaVeiculo: TDBEdit;
    dbImpostos: TDBEdit;
    dbAdm: TDBEdit;
    dbOutros: TDBEdit;
    grpFIVeiculo: TGroupBox;
    lblRetPlano: TLabel;
    lblFinanciadora: TLabel;
    lvlValorRetornoVeiculo: TLabel;
    dbFinanciadora: TDBEdit;
    dbPorPlano: TDBEdit;
    dbValorRetornoVeiculo: TDBEdit;
    GrpBxParametroGeral: TGroupBox;
    GrpBxParametroProdudo: TGroupBox;
    dbCadastroAtivo: TDBCheckBox;
    dbProdutoNovo: TDBCheckBox;
    dbComporFaturamento: TDBCheckBox;
    dbProdutoMovEstoque: TDBCheckBox;
    dbProdutoEhImobilizado: TDBCheckBox;
    dbProdutoPorLote: TDBCheckBox;
    ppMnAtualizarTabelaIBPT: TMenuItem;
    dbNCM_SH: TJvDBComboEdit;
    lblNomeAmigo: TLabel;
    dbNomeAmigo: TDBEdit;
    ppMnAtualizarNomeAmigo: TMenuItem;
    GrpBxUltimaCompra: TGroupBox;
    lblUltimaCompraData: TLabel;
    lblUltimaCompraValor: TLabel;
    dbUltimaCompraData: TDBEdit;
    dbUltimaCompraValor: TDBEdit;
    lblPercentualMargem: TLabel;
    dbPercentualMargem: TDBEdit;
    fdQryEmpresa: TFDQuery;
    fdQryTipoProduto: TFDQuery;
    dtsTipoProduto: TDataSource;
    lblTipoProduto: TLabel;
    dbTipoProduto: TDBLookupComboBox;
    lblCodigoAnvisa: TLabel;
    dbCodigoAnvisa: TDBEdit;
    dbGerarSubproduto: TDBCheckBox;
    fdQryOrigem: TFDQuery;
    lblAltura: TLabel;
    dbAltura: TDBEdit;
    dbLargura: TDBEdit;
    lblLargura: TLabel;
    dbEspessura: TDBEdit;
    lblEspessura: TLabel;
    fdQryTributacaoNM: TFDQuery;
    qryTributacaoSN: TFDQuery;
    tblAliquota: TFDTable;
    tblCombustivel: TFDTable;
    tblCor: TFDTable;
    tblTipoVeiculo: TFDTable;
    qryAliquotaPIS: TFDQuery;
    qryAliquotaCOFINS: TFDQuery;
    fdQryTabelaCODIGO: TFDAutoIncField;
    fdQryTabelaCOD: TStringField;
    fdQryTabelaDESCRI: TStringField;
    fdQryTabelaAPRESENTACAO: TStringField;
    fdQryTabelaDESCRI_APRESENTACAO: TStringField;
    fdQryTabelaMETAFONEMA: TStringField;
    fdQryTabelaMODELO: TStringField;
    fdQryTabelaANVISA: TStringField;
    fdQryTabelaREFERENCIA: TStringField;
    fdQryTabelaNOME_AMIGO: TStringField;
    fdQryTabelaESPECIFICACAO: TBlobField;
    fdQryTabelaSECAO: TStringField;
    fdQryTabelaUNIDADE: TStringField;
    fdQryTabelaALTURA: TBCDField;
    fdQryTabelaLARGURA: TBCDField;
    fdQryTabelaESPESSURA: TBCDField;
    fdQryTabelaCUBAGEM: TBCDField;
    fdQryTabelaVENDA_FRACIONADA: TSmallintField;
    fdQryTabelaCODUNIDADE_FRACIONADA: TSmallintField;
    fdQryTabelaCODTIPO: TSmallintField;
    fdQryTabelaCODGRUPO: TSmallintField;
    fdQryTabelaCODFABRICANTE: TIntegerField;
    fdQryTabelaCODEMP: TStringField;
    fdQryTabelaCODSECAO: TSmallintField;
    fdQryTabelaCODORIGEM: TStringField;
    fdQryTabelaCODTRIBUTACAO: TStringField;
    fdQryTabelaCST: TStringField;
    fdQryTabelaCSOSN: TStringField;
    fdQryTabelaCST_PIS: TStringField;
    fdQryTabelaCST_COFINS: TStringField;
    fdQryTabelaTABELA_IBPT: TIntegerField;
    fdQryTabelaNCM_SH: TStringField;
    fdQryTabelaCODIGO_NVE: TStringField;
    fdQryTabelaCODCFOP: TIntegerField;
    fdQryTabelaCODBARRA_EAN: TStringField;
    fdQryTabelaCODUNIDADE: TSmallintField;
    fdQryTabelaALIQUOTA_TIPO: TSmallintField;
    fdQryTabelaPRODUTO_NOVO: TSmallintField;
    fdQryTabelaCOR_VEICULO: TStringField;
    fdQryTabelaCOMBUSTIVEL_VEICULO: TStringField;
    fdQryTabelaTIPO_VEICULO: TStringField;
    fdQryTabelaRENAVAM_VEICULO: TStringField;
    fdQryTabelaCHASSI_VEICULO: TStringField;
    fdQryTabelaANO_MODELO_VEICULO: TSmallintField;
    fdQryTabelaANO_FABRICACAO_VEICULO: TSmallintField;
    fdQryTabelaKILOMETRAGEM_VEICULO: TIntegerField;
    fdQryTabelaSITUACAO_ATUAL_VEICULO: TStringField;
    fdQryTabelaSITUACAO_HISTORICO_VEICULO: TMemoField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaCADASTRO_ATIVO: TSmallintField;
    fdQryTabelaPRODUTO_IMOBILIZADO: TSmallintField;
    fdQryTabelaMOVIMENTA_ESTOQUE: TSmallintField;
    fdQryTabelaCOMPOR_FATURAMENTO: TSmallintField;
    fdQryTabelaESTOQUE_APROP_LOTE: TSmallintField;
    fdQryTabelaULTIMA_COMPRA_DATA: TDateField;
    fdQryTabelaULTIMA_COMPRA_FORNEC: TIntegerField;
    fdQryTabelaGERAR_SUBPRODUTO: TSmallintField;
    fdQryTabelaPRODUTO_PAI: TStringField;
    fdQryTabelaDESCRICAO_GRUPO: TStringField;
    fdQryTabelaNOME_FABRICANTE: TStringField;
    fdQryTabelaDESCRICAO_SECAO: TStringField;
    fdQryTabelaDESCRICAO_UNIDADE: TStringField;
    fdQryTabelaUNP_SIGLA: TStringField;
    fdQryTabelaDESCRICAO_UNIDADE_FRAC: TStringField;
    fdQryTabelaUNP_SIGLA_FRAC: TStringField;
    fdQryTabelaCFOP_DESCRICAO: TStringField;
    fdQryTabelaCFOP_ESPECIFICACAO: TMemoField;
    fdQryTabelaDESCRICAO_COR: TStringField;
    fdQryTabelaDESCRICAO_COMBUSTIVEL: TStringField;
    fdQryTabelaMODELO_FABRICACAO: TStringField;
    fdQryTabelaPRECO: TFMTBCDField;
    fdQryTabelaPRECO_PROMOCAO: TFMTBCDField;
    fdQryTabelaPRECO_SUGERIDO: TFMTBCDField;
    fdQryTabelaLUCRO_CALCULADO: TBCDField;
    fdQryTabelaLUCRO_VALOR: TFMTBCDField;
    fdQryTabelaPRECO_FRAC: TFMTBCDField;
    fdQryTabelaPRECO_PROMOCAO_FRAC: TFMTBCDField;
    fdQryTabelaPRECO_SUGERIDO_FRAC: TFMTBCDField;
    fdQryTabelaQTDE: TFMTBCDField;
    fdQryTabelaESTOQMIN: TFMTBCDField;
    fdQryTabelaRESERVA: TFMTBCDField;
    fdQryTabelaCUSTOMEDIO: TFMTBCDField;
    fdQryTabelaPERCENTUAL_MARCKUP: TFMTBCDField;
    fdQryTabelaPERCENTUAL_MARGEM: TFMTBCDField;
    fdQryTabelaFRACIONADOR: TFMTBCDField;
    fdQryTabelaPESO_BRUTO: TFMTBCDField;
    fdQryTabelaPESO_LIQUIDO: TFMTBCDField;
    fdQryTabelaPERCENTUAL_REDUCAO_BC: TFMTBCDField;
    fdQryTabelaVALOR_IPI: TFMTBCDField;
    fdQryTabelaALIQUOTA: TFMTBCDField;
    fdQryTabelaALIQUOTA_CSOSN: TFMTBCDField;
    fdQryTabelaALIQUOTA_PIS: TFMTBCDField;
    fdQryTabelaALIQUOTA_COFINS: TFMTBCDField;
    fdQryTabelaULTIMA_COMPRA_VALOR: TFMTBCDField;
    fdQryTabelaDISPONIVEL: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbGrupoButtonClick(Sender: TObject);
    procedure dbSecaoButtonClick(Sender: TObject);
    procedure dbUnidadeButtonClick(Sender: TObject);
    procedure dbCFOPButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbFabricanteButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkProdutoComEstoqueClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbUnidadeFracaoButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ppMnAtualizarMetafonemaClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure dbProdutoMovEstoqueClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure dbNCM_SHButtonClick(Sender: TObject);
    procedure ppMnAtualizarTabelaIBPTClick(Sender: TObject);
    procedure ppMnAtualizarNomeAmigoClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    fOrdenado : Boolean;
    fAliquota : TAliquota;
    fRealizarVenda  ,
    fApenasProdutos ,
    fApenasServicos : Boolean;
    Procedure ControleCampos;
    procedure AddWhereAdditional;
    procedure OcultarTipoProduto;
    procedure ConfigurarLabels;
  public
    { Public declarations }
    procedure FiltarDados(const iTipoPesquisa : Integer); overload;
  end;

(*
  Tabelas:
  - TBPRODUTO
  - SYS_TIPO_PRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBFABRICANTE
  - TBUNIDADEPROD
  - TBCFOP
  - RENAVAM_COR
  - RENAVAM_COBUSTIVEL
  - TBTRIBUTACAO_TIPO

  Views:
  - VW_EMPRESA
  - VW_ORIGEM_PRODUTO
  - VW_TIPO_TRIBUTACAO
  - VW_TIPO_ALIQUOTA
  - VW_ALIQUOTA_PIS
  - VW_ALIQUOTA_COFINS

  Procedures:

*)

var
  frmGeProduto: TfrmGeProduto;

  procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota); overload;
  procedure MostrarTabelaProdutos(const AOwner : TComponent); overload;
  procedure MostrarTabelaServicos(const AOwner : TComponent);

  function SelecionarProdutoParaAjuste(const AOwner : TComponent; const Empresa : String;
    var Codigo : Integer;
    var CodigoAlfa, Nome : String) : Boolean;

  function SelecionarProdutoParaVenda(const AOwner : TComponent; var pProduto : TProdutoServico) : Boolean;

  function SelecionarProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome : String) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, CodigoEAN, Nome, Unidade : String;
    var ValorVenda : Currency) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, CST : String;
    var iUnidade, CFOP : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean; overload;
  function SelecionarProduto(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, Unidade : String;
    var ValorVenda, ValorPromocao : Currency) : Boolean; overload;

  function SelecionarProdutoParaEntrada(const AOwner : TComponent; var pProduto : TProdutoServico) : Boolean; overload;
  function SelecionarProdutoParaEntrada(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC, ValorCusto : Currency;
    var Estoque, Reserva : Currency) : Boolean; overload;
  function SelecionarServicoParaEntrada(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CNAE : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao : Currency) : Boolean;
  function SelecionarProdutoServicoParaEntrada(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP_CNAE : Integer;
    var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean;

  function SelecionarProdutoParaCotacao(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP : Integer;
    var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean;
  function SelecionarServicoParaCotacao(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CNAE : Integer;
    var ValorCusto, ValorVenda, ValorPromocao : Currency) : Boolean;
  function SelecionarProdutoServicoParaCotacao(const AOwner : TComponent;
    var Codigo : Integer;
    var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
    var iUnidade, CFOP_CNAE : Integer;
    var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
    var Estoque, Reserva : Currency) : Boolean;

implementation

uses
  UDMBusiness, UGeSecaoProduto, UGeGrupoProduto, UGeUnidade,
  UGeTabelaCFOP, UGeFabricante, UConstantesDGE, UFuncoes, UGrPadrao,
  UGeTabelaIBPT;

{$R *.dfm}

const
  PRD_ARQUIVO_MORTO = '(p.arquivo_morto = 0)';
  COLUMN_QTDE       = 2;
  COLUMN_DISPONIVEL = 3;
  COLUMN_LUCRO      = 12;
  COLUMN_GRUPO      = 13;

procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);
var
  AForm : TfrmGeProduto;
begin
  AForm := TfrmGeProduto.Create(AOwner);
  try
    AForm.fAliquota       := TipoAliquota;
    AForm.fApenasProdutos := True;
    AForm.fApenasServicos := False;
//    AForm.fApenasProdutos := (frm.fAliquota = taICMS);
//    AForm.fApenasServicos := (frm.fAliquota = taISS);
    AForm.chkProdutoComEstoque.Checked := False;
    AForm.AddWhereAdditional;
//
//    if not GetEstoqueUnificadoEmpresa(gUsuarioLogado.Empresa) then
//      AForm.WhereAdditional := '(p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')'
//    else
//      AForm.WhereAdditional := '(1 = 1)';
//
//    // Carregar apenas produtos com estoque e serviços em geral
//    if AForm.chkProdutoComEstoque.Checked then
//      AForm.WhereAdditional := frm.WhereAdditional + ' and ((p.Qtde > 0) or (p.Aliquota_tipo = 1))';
//
//    AForm.WhereAdditional := frm.WhereAdditional + '  and (' + PRD_ARQUIVO_MORTO + ')';
//
    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure MostrarTabelaProdutos(const AOwner : TComponent);
var
  AForm : TfrmGeProduto;
begin
  AForm := TfrmGeProduto.Create(AOwner);
  try
    AForm.fAliquota       := taICMS;
    AForm.fApenasProdutos := True;
    AForm.fApenasServicos := False;

    AForm.chkProdutoComEstoque.Checked := False;
    AForm.AddWhereAdditional;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure MostrarTabelaServicos(const AOwner : TComponent);
var
  AForm : TfrmGeProduto;
begin
  AForm := TfrmGeProduto.Create(AOwner);
  try
    AForm.fAliquota := taISS;
    AForm.fApenasProdutos := False;
    AForm.fApenasServicos := True;
    AForm.chkProdutoComEstoque.Checked := False;
    AForm.AddWhereAdditional;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarProdutoParaAjuste(const AOwner : TComponent; const Empresa : String;
  var Codigo : Integer;
  var CodigoAlfa, Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled      := False;
    frm.dbAliquotaTipo.Enabled       := False;

    whr := PRD_ARQUIVO_MORTO + ' and (p.codemp = ' + QuotedStr(Empresa) + ') and (p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota)) + ')';

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and (p.Qtde > 0)';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.DtSrcTabela.DataSet.FieldByName('COD').AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaVenda(const AOwner : TComponent; var pProduto : TProdutoServico) : Boolean;
var
  AForm : TfrmGeProduto;
  iCodigo    : Integer;
  sDescricao : String;
begin
  AForm := TfrmGeProduto.Create(AOwner);
  try
    AForm.fAliquota       := taICMS;
    AForm.fApenasProdutos := True;
    AForm.fRealizarVenda  := True;
    AForm.AddWhereAdditional;

    Result := AForm.SelecionarRegistro(iCodigo, sDescricao, AForm.WhereAdditional);

    if Result then
      with AForm, DtSrcTabela.DataSet, pProduto do
      begin
        aCodigo     := FieldByName('CODIGO').AsInteger;
        aCodigoAlfa := FieldByName('COD').AsString;
        aCodigoEAN  := FieldByName('CODBARRA_EAN').AsString;

        aDescricao    := FieldByName('DESCRI').AsString;
        aApresentacao := FieldByName('APRESENTACAO').AsString;
        aNome         := FieldByName('DESCRI_APRESENTACAO').AsString;

        aUnidadeCompra.aCodigo     := FieldByName('CODUNIDADE').AsInteger;
        aUnidadeCompra.aDescricao  := FieldByName('DESCRICAO_UNIDADE').AsString;
        aUnidadeCompra.aSigla      := FieldByName('UNP_SIGLA').AsString;

        aUnidadeConsumo.aCodigo    := FieldByName('CODUNIDADE_FRACIONADA').AsInteger;
        aUnidadeConsumo.aDescricao := FieldByName('DESCRICAO_UNIDADE_FRAC').AsString;
        aUnidadeConsumo.aSigla     := FieldByName('UNP_SIGLA_FRAC').AsString;

        aCST       := FieldByName('CST').AsString;
        aNCM_SH    := FieldByName('NCM_SH').AsString;
        aCFOP      := FieldByName('CODCFOP').AsInteger;
        aCNAE      := 0;

        aAliquota       := FieldByName('ALIQUOTA').AsCurrency;
        aAliquotaPIS    := FieldByName('ALIQUOTA_PIS').AsCurrency;
        aAliquotaCOFINS := FieldByName('ALIQUOTA_COFINS').AsCurrency;

        aValorVenda     := FieldByName('PRECO').AsCurrency;
        aValorPromocao  := FieldByName('PRECO_PROMOCAO').AsCurrency;
        aValorIPI       := FieldByName('VALOR_IPI').AsCurrency;
        aValorCusto     := FieldByName('CUSTOMEDIO').AsCurrency;

        aPercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        aEstoque := FieldByName('QTDE').AsCurrency;
        aReserva := FieldByName('RESERVA').AsCurrency;

        aMovimentaEstoque := (FieldByName('MOVIMENTA_ESTOQUE').AsInteger  = FLAG_SIM);
        aEstoquePorLote   := (FieldByName('ESTOQUE_APROP_LOTE').AsInteger = FLAG_SIM);
      end;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome : String) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.DtSrcTabela.DataSet.FieldByName('COD').AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, CodigoEAN, Nome, Unidade : String;
  var ValorVenda : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        CodigoEAN  := FieldByName('CODBARRA_EAN').AsString;
        Unidade    := FieldByName('UNIDADE').AsString;

        if ( FieldByName('PRECO_PROMOCAO').AsCurrency = 0 ) then
          ValorVenda := FieldByName('PRECO').AsCurrency
        else
          ValorVenda := FieldByName('PRECO_PROMOCAO').AsCurrency;
      end;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, CST : String;
  var iUnidade, CFOP : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        CST        := FieldByName('CST').AsString;
        CFOP       := FieldByName('CODCFOP').AsInteger;
        Aliquota       := FieldByName('ALIQUOTA').AsCurrency;
        AliquotaPIS    := FieldByName('ALIQUOTA_PIS').AsCurrency;
        AliquotaCOFINS := FieldByName('ALIQUOTA_COFINS').AsCurrency;
        ValorVenda     := FieldByName('PRECO').AsCurrency;
        ValorPromocao  := FieldByName('PRECO_PROMOCAO').AsCurrency;
        ValorIPI       := FieldByName('VALOR_IPI').AsCurrency;

        PercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        Estoque := FieldByName('QTDE').AsCurrency;
        Reserva := FieldByName('RESERVA').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaEntrada(const AOwner : TComponent; var pProduto : TProdutoServico) : Boolean;
var
  frm : TfrmGeProduto;
//  whr : String;
  aCodigo : Integer;
  aNome   : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

//    whr := '(p.arquivo_morto = 0) and (p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota)) + ')';
//
//    if frm.chkProdutoComEstoque.Checked then
//      whr := whr + ' and (p.Qtde > 0)';
//
    frm.AddWhereAdditional;

    Result := frm.SelecionarRegistro(aCodigo, aNome, frm.WhereAdditional);

    if Result then
      with frm, DtSrcTabela.DataSet, pProduto do
      begin
        aCodigo     := FieldByName('CODIGO').AsInteger;
        aCodigoAlfa := FieldByName('COD').AsString;
        aCodigoEAN  := FieldByName('CODBARRA_EAN').AsString;

        aDescricao    := FieldByName('DESCRI').AsString;
        aApresentacao := FieldByName('APRESENTACAO').AsString;
        aNome         := FieldByName('DESCRI_APRESENTACAO').AsString;

        aUnidadeCompra.aCodigo     := FieldByName('CODUNIDADE').AsInteger;
        aUnidadeCompra.aDescricao  := FieldByName('DESCRICAO_UNIDADE').AsString;
        aUnidadeCompra.aSigla      := FieldByName('UNP_SIGLA').AsString;

        aUnidadeConsumo.aCodigo    := FieldByName('CODUNIDADE_FRACIONADA').AsInteger;
        aUnidadeConsumo.aDescricao := FieldByName('DESCRICAO_UNIDADE_FRAC').AsString;
        aUnidadeConsumo.aSigla     := FieldByName('UNP_SIGLA_FRAC').AsString;

        aCST    := FieldByName('CST').AsString;
        aNCM_SH := FieldByName('NCM_SH').AsString;
        aCFOP   := FieldByName('CODCFOP').AsInteger;
        aCNAE   := 0;

        aAliquota       := FieldByName('ALIQUOTA').AsCurrency;
        aAliquotaPIS    := FieldByName('ALIQUOTA_PIS').AsCurrency;
        aAliquotaCOFINS := FieldByName('ALIQUOTA_COFINS').AsCurrency;

        aValorVenda     := FieldByName('PRECO').AsCurrency;
        aValorPromocao  := FieldByName('PRECO_PROMOCAO').AsCurrency;
        aValorIPI       := FieldByName('VALOR_IPI').AsCurrency;
        aValorCusto     := FieldByName('CUSTOMEDIO').AsCurrency;

        aPercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        aEstoque := FieldByName('QTDE').AsCurrency;
        aReserva := FieldByName('RESERVA').AsCurrency;

        aMovimentaEstoque := (FieldByName('MOVIMENTA_ESTOQUE').AsInteger  = FLAG_SIM);
        aEstoquePorLote   := (FieldByName('ESTOQUE_APROP_LOTE').AsInteger = FLAG_SIM);
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaEntrada(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC, ValorCusto : Currency;
  var Estoque, Reserva : Currency) : Boolean; overload;
var
  frm : TfrmGeProduto;
//  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

//    whr := '(p.arquivo_morto = 0) and (p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota)) + ')';
//
//    if frm.chkProdutoComEstoque.Checked then
//      whr := whr + ' and (p.Qtde > 0)';
//
    frm.AddWhereAdditional;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        sNCM_SH    := FieldByName('NCM_SH').AsString;
        CST        := FieldByName('CST').AsString;
        CFOP       := FieldByName('CODCFOP').AsInteger;
        Aliquota       := FieldByName('ALIQUOTA').AsCurrency;
        AliquotaPIS    := FieldByName('ALIQUOTA_PIS').AsCurrency;
        AliquotaCOFINS := FieldByName('ALIQUOTA_COFINS').AsCurrency;
        ValorVenda     := FieldByName('PRECO').AsCurrency;
        ValorPromocao  := FieldByName('PRECO_PROMOCAO').AsCurrency;
        ValorIPI       := FieldByName('VALOR_IPI').AsCurrency;
        ValorCusto     := FieldByName('CUSTOMEDIO').AsCurrency;

        PercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        Estoque := FieldByName('QTDE').AsCurrency;
        Reserva := FieldByName('RESERVA').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarServicoParaEntrada(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CNAE : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taISS;
    frm.fApenasServicos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        sNCM_SH    := FieldByName('NCM_SH').AsString;
        CST        := FieldByName('CST').AsString;
        CNAE       := 0; //FieldByName('CODCFOP').AsInteger;
        Aliquota       := FieldByName('ALIQUOTA').AsCurrency;
        AliquotaPIS    := FieldByName('ALIQUOTA_PIS').AsCurrency;
        AliquotaCOFINS := FieldByName('ALIQUOTA_COFINS').AsCurrency;
        ValorVenda     := FieldByName('PRECO').AsCurrency;
        ValorPromocao  := FieldByName('PRECO_PROMOCAO').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoServicoParaEntrada(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP_CNAE : Integer;
  var Aliquota, AliquotaPIS, AliquotaCOFINS, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean; overload;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        sNCM_SH    := FieldByName('NCM_SH').AsString;
        CST        := FieldByName('CST').AsString;

        if ( TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS ) then
          CFOP_CNAE  := FieldByName('CODCFOP').AsInteger
        else
          CFOP_CNAE  := 0;

        Aliquota       := FieldByName('ALIQUOTA').AsCurrency;
        AliquotaPIS    := FieldByName('ALIQUOTA_PIS').AsCurrency;
        AliquotaCOFINS := FieldByName('ALIQUOTA_COFINS').AsCurrency;
        ValorVenda     := FieldByName('PRECO').AsCurrency;
        ValorPromocao  := FieldByName('PRECO_PROMOCAO').AsCurrency;
        ValorIPI       := FieldByName('VALOR_IPI').AsCurrency;

        PercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        Estoque := FieldByName('QTDE').AsCurrency;
        Reserva := FieldByName('RESERVA').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaCotacao(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP : Integer;
  var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        sNCM_SH    := FieldByName('NCM_SH').AsString;
        CST        := FieldByName('CST').AsString;
        CFOP       := FieldByName('CODCFOP').AsInteger;
        ValorCusto    := FieldByName('CUSTOMEDIO').AsCurrency;
        ValorVenda    := FieldByName('PRECO').AsCurrency;
        ValorPromocao := FieldByName('PRECO_PROMOCAO').AsCurrency;
        ValorIPI      := FieldByName('VALOR_IPI').AsCurrency;

        PercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        Estoque := FieldByName('QTDE').AsCurrency;
        Reserva := FieldByName('RESERVA').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarServicoParaCotacao(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CNAE : Integer;
  var ValorCusto, ValorVenda, ValorPromocao : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota       := taISS;
    frm.fApenasServicos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        sNCM_SH    := FieldByName('NCM_SH').AsString;
        CST        := FieldByName('CST').AsString;
        CNAE       := 0; //FieldByName('CODCFOP').AsInteger;
        ValorCusto    := FieldByName('CUSTOMEDIO').AsCurrency;
        ValorVenda    := FieldByName('PRECO').AsCurrency;
        ValorPromocao := FieldByName('PRECO_PROMOCAO').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoServicoParaCotacao(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, sUnidade, sNCM_SH, CST : String;
  var iUnidade, CFOP_CNAE : Integer;
  var ValorCusto, ValorVenda, ValorPromocao, ValorIPI, PercentualRedBC : Currency;
  var Estoque, Reserva : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        iUnidade   := FieldByName('CODUNIDADE').AsInteger;
        sUnidade   := FieldByName('UNP_SIGLA').AsString;
        sNCM_SH    := FieldByName('NCM_SH').AsString;
        CST        := FieldByName('CST').AsString;

        if ( TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS ) then
          CFOP_CNAE  := FieldByName('CODCFOP').AsInteger
        else
          CFOP_CNAE  := 0;

        ValorCusto    := FieldByName('CUSTOMEDIO').AsCurrency;
        ValorVenda    := FieldByName('PRECO').AsCurrency;
        ValorPromocao := FieldByName('PRECO_PROMOCAO').AsCurrency;
        ValorIPI      := FieldByName('VALOR_IPI').AsCurrency;

        PercentualRedBC := FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

        Estoque := FieldByName('QTDE').AsCurrency;
        Reserva := FieldByName('RESERVA').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProduto(const AOwner : TComponent;
  var Codigo : Integer;
  var CodigoAlfa, Nome, Unidade : String;
  var ValorVenda, ValorPromocao : Currency) : Boolean;
var
  frm : TfrmGeProduto;
  whr : String;
begin
  frm := TfrmGeProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      with frm, DtSrcTabela.DataSet do
      begin
        CodigoAlfa := FieldByName('COD').AsString;
        Unidade    := FieldByName('UNIDADE').AsString;
        ValorVenda := FieldByName('PRECO').AsCurrency;
        ValorPromocao := FieldByName('PRECO_PROMOCAO').AsCurrency;
      end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeProduto.FormCreate(Sender: TObject);
begin
  SetTiposProdutos;

  inherited;
  RotinaID         := ROTINA_CAD_PRODUTO_ID;
  ControlFirstEdit := dbCodigoEAN;

  fOrdenado := False;
  fAliquota := taICMS;

  fRealizarVenda  := False;
  fApenasProdutos := False;
  fApenasServicos := False;

  CarregarLista(fdQryTipoProduto);
  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryOrigem);
  CarregarLista(fdQryTributacaoNM);
  CarregarLista(qryTributacaoSN);
  CarregarLista(tblAliquota);
  CarregarLista(qryAliquotaPIS);
  CarregarLista(qryAliquotaCOFINS);

  if ( GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID ) then
  begin
    CarregarLista(tblCor);
    CarregarLista(tblCombustivel);
    CarregarLista(tblTipoVeiculo);
  end;

  if (gSistema.Codigo = SISTEMA_GESTAO_IND) or (GetSegmentoID(gUsuarioLogado.Empresa) in [
        SEGMENTO_MERCADO_CARRO_ID
      , SEGMENTO_SERVICOS_ID
      , SEGMENTO_VAREJO_DELIVERY_ID
      , SEGMENTO_INDUSTRIA_METAL_ID
      , SEGMENTO_INDUSTRIA_GERAL_ID]) then
    OcultarTipoProduto;

  DisplayFormatCodigo := '###0000000';

  NomeTabela         := 'TBPRODUTO';
  CampoCodigo        := 'p.Codigo';
  CampoDescricao     := 'p.Descri';
  CampoCadastroAtivo := 'p.cadastro_ativo';
  CampoDescricao     := 'p.Descri_apresentacao';
  CampoOrdenacao     := 'p.Descri_apresentacao';

  pgcMaisDados.ActivePageIndex := 0;

  lblPrecoVendaSugestao.Visible := True;
  dbPrecoVendaSugestao.Visible  := True;

  tbsCadastro.TabVisible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnIncluir.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnAlterar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnExcluir.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnCancelar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnSalvar.Visible    := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  ShpLucroZerado.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  lblLucroZerado.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  ShpLucroNegativo.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  lblLucroNegativo.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  nmProdutoLista.Caption    := 'Lista de ' + StrDescricaoProduto;
  nmProdutoFicha.Caption    := 'Ficha de ' + StrDescricaoProduto;
  nmProdutoEtiqueta.Caption := 'Etiqueta de ' + StrDescricaoProduto;
  dbProdutoPorLote.Caption  := IfThen(gSistema.Codigo = SISTEMA_GESTAO_IND, 'Estoque Apropriado por Lote', 'Gerenciar Estoque por Lote');

  lblProdutoPromocao.Caption   := Format('* %s em Promoção', [StrDescricaoProduto]);
  lblProdutoSemEstoque.Caption := Format('* %s sem Estoque', [StrDescricaoProduto]);
  lblProdutoDesativado.Caption := Format('* %s desativado', [StrDescricaoProduto]);

//  dbProdutoNovo.Enabled          := (gSistema.Codigo = SISTEMA_GESTAO_COM) and (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
//  dbProdutoEhImobilizado.Enabled := (gSistema.Codigo = SISTEMA_GESTAO_IND);
//  dbGerarSubproduto.Enabled      := (gSistema.Codigo = SISTEMA_GESTAO_IND);
(*
  lblTipoTributacaoSN.Enabled := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
  dbTipoTributacaoSN.Enabled  := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
  lblAliquotaSN.Enabled := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
  dbAliquotaSN.Enabled  := GetSimplesNacionalInsEmpresa(gUsuarioLogado.Empresa);
*)
  chkProdutoComEstoque.Visible := (gSistema.Codigo <> SISTEMA_GESTAO_IND);
  if not chkProdutoComEstoque.Visible then
    chkProdutoComEstoque.Checked := False;

  if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
    chkProdutoComEstoque.Checked := False;
end;

procedure TfrmGeProduto.dbGrupoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarGrupoProduto(Self, iCodigo, sDescricao) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CODGRUPO').AsInteger       := iCodigo;
      DtSrcTabela.DataSet.FieldByName('DESCRICAO_GRUPO').AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.dbNCM_SHButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sCodigo    ,
  sDescricao : String;
  TipoTabela : TTipoTabelaIBPT;
begin
  if TAliquota(DtSrcTabela.DataSet.FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS then
    TipoTabela := tIbptProdutos
  else
    TipoTabela := tIbptServicos;

  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCodigoIBPT(Self, TipoTabela, iCodigo, sCodigo, sDescricao) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('TABELA_IBPT').AsInteger := iCodigo;
      DtSrcTabela.DataSet.FieldByName('NCM_SH').AsString       := sCodigo;
    end;
end;

procedure TfrmGeProduto.dbProdutoMovEstoqueClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    if Assigned(dbProdutoPorLote.Field) then
      if (dbProdutoMovEstoque.Field.AsInteger = 0) then
        dbProdutoPorLote.Field.AsInteger := 0;
end;

procedure TfrmGeProduto.dbSecaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarSecaoProduto(Self, iCodigo, sDescricao) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CODSECAO').AsInteger       := iCodigo;
      DtSrcTabela.DataSet.FieldByName('SECAO').AsString           := sDescricao;
      DtSrcTabela.DataSet.FieldByName('DESCRICAO_SECAO').AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.dbUnidadeButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
      begin
        FieldByName('CODUNIDADE').AsInteger       := iCodigo;
        FieldByName('UNIDADE').AsString           := AnsiUpperCase(Copy(sDescricao, 1, FieldByName('UNIDADE').Size));
        FieldByName('DESCRICAO_UNIDADE').AsString := sDescricao;
        FieldByName('UNP_SIGLA').AsString         := sSigla;

        if ( FieldByName('FRACIONADOR').AsInteger = 1 ) then
        begin
          FieldByName('CODUNIDADE_FRACIONADA').AsInteger := iCodigo;
          FieldByName('DESCRICAO_UNIDADE_FRAC').AsString := sDescricao;
          FieldByName('UNP_SIGLA_FRAC').AsString         := sSigla;
        end;
      end;
  end;
end;

procedure TfrmGeProduto.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( DtsrCTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CODCFOP').AsInteger       := iCodigo;
      DtSrcTabela.DataSet.FieldByName('CFOP_DESCRICAO').AsString := sDescricao;
    end;
end;

procedure TfrmGeProduto.OcultarTipoProduto;
begin
  // Ocultar campo "Tipo Produto"
  lblTipoProduto.Visible := False;
  dbTipoProduto.Visible  := False;

  // Redefinir o tamanho do campo "Nome Amigo"
  lblNomeAmigo.Left := lblCodigo.Left;
  dbNomeAmigo.Left  := dbCodigo.Left;
  dbNomeAmigo.Width := 706;

//  // Reposicionar e redimencionar campo "Grupo"
//  lblGrupo.Left := lblTipoProduto.Left;
//  dbGrupo.Left  := dbTipoProduto.Left;
//  dbGrupo.Width := 377;
//
//  // Reposicionar e redimencionar campo "Seção"
//  lblSecao.Left := dbNomeAmigo.Left;
//  dbSecao.Left  := dbNomeAmigo.Left;
//  dbSecao.Width := 322;
end;

procedure TfrmGeProduto.FormShow(Sender: TObject);
var
  S : String;
begin
  if (not fOrdenado) then
  begin
    fdQryTabela.SQL.Add( 'order by ' + CampoOrdenacao );
    fOrdenado := True;
  end;

  inherited;

  S := StrDescricaoProduto;
  Case fAliquota of
    taICMS :
      Caption := 'Cadastro de ' + S;
    taISS :
      Caption := 'Cadastro de Serviços';
    else
      Caption := 'Cadastro de ' + S + '/Serviços';
  end;

  // Configurar Legendas de acordo com o segmento
  pnlVeiculo.Visible             := (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
  tbsHistoricoVeiculo.TabVisible := (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
  tbsCustoVeiculo.TabVisible     := (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);

  ConfigurarLabels;
  CentralizarCodigo;

  with DtSrcTabela.DataSet do
  begin
    FieldByName('COR_VEICULO').Required            := pnlVeiculo.Visible;
    FieldByName('COMBUSTIVEL_VEICULO').Required    := pnlVeiculo.Visible;
    FieldByName('TIPO_VEICULO').Required           := pnlVeiculo.Visible;
    FieldByName('RENAVAM_VEICULO').Required        := pnlVeiculo.Visible;
    FieldByName('CHASSI_VEICULO').Required         := pnlVeiculo.Visible;
    FieldByName('KILOMETRAGEM_VEICULO').Required   := pnlVeiculo.Visible;
    FieldByName('ANO_MODELO_VEICULO').Required     := pnlVeiculo.Visible;
    FieldByName('ANO_FABRICACAO_VEICULO').Required := pnlVeiculo.Visible;
  end;

  with dbgDados do
  begin
    Columns[2].Visible  := not pnlVeiculo.Visible;
    Columns[4].Visible  := pnlVeiculo.Visible;
    Columns[5].Visible  := pnlVeiculo.Visible;
    Columns[6].Visible  := pnlVeiculo.Visible;
    Columns[7].Visible  := pnlVeiculo.Visible;
    Columns[8].Visible  := pnlVeiculo.Visible;
    Columns[9].Visible  := not pnlVeiculo.Visible;
    Columns[COLUMN_GRUPO].Visible := not pnlVeiculo.Visible;
  end;
end;

procedure TfrmGeProduto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeProduto.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
  //  FieldByName('FRACIONADOR').Required           := (FieldByName('VENDA_FRACIONADA').AsInteger = 1);
  //  FieldByName('CODUNIDADE_FRACIONADA').Required := (FieldByName('VENDA_FRACIONADA').AsInteger = 1);
  //  FieldByName('ANVISA').Required := dbCodigoAnvisa.Visible;

    inherited;

    FieldByName('DESCRI_APRESENTACAO').AsString := AnsiUpperCase(Trim(FieldByName('DESCRI').AsString + ' ' + FieldByName('APRESENTACAO').AsString));
    FieldByName('METAFONEMA').AsString          := Metafonema(FieldByName('DESCRI_APRESENTACAO').AsString);
    FieldByName('USUARIO').AsString             := gUsuarioLogado.Login;

    if (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taISS) then
    begin
      FieldByName('CODTIPO').AsInteger           := Ord(TTipoProduto.tpMaterialGeral);
      FieldByName('MOVIMENTA_ESTOQUE').AsInteger := 0;
    end;

    if FieldByName('CODTIPO').IsNull then
      FieldByName('CODTIPO').AsInteger := Ord(TTipoProduto.tpMaterialGeral);

    if ( (FieldByName('RESERVA').AsCurrency < 0) or (FieldByName('RESERVA').AsCurrency > FieldByName('QTDE').AsCurrency) ) then
      FieldByName('RESERVA').AsCurrency := 0;

    if ( FieldByName('PRODUTO_NOVO').IsNull ) then
      FieldByName('PRODUTO_NOVO').AsInteger := 0;

    if ( FieldByName('MOVIMENTA_ESTOQUE').IsNull ) then
      FieldByName('MOVIMENTA_ESTOQUE').AsInteger := 1;

    if ( FieldByName('COMPOR_FATURAMENTO').IsNull ) then
      FieldByName('COMPOR_FATURAMENTO').AsInteger := StrToInt(IfThen(GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID], '0', '1'));

    if ( (FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency < 0) or (FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency > 100) ) then
      FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := 0;

    FieldByName('DISPONIVEL').AsCurrency := FieldByName('QTDE').AsCurrency - FieldByName('RESERVA').AsCurrency;

    FieldByName('CST').AsString := FieldByName('CODORIGEM').AsString + FieldByName('CODTRIBUTACAO').AsString;

    if ( FieldByName('COMPOR_FATURAMENTO').AsInteger = 0 ) then
    begin
      FieldByName('PERCENTUAL_MARGEM').AsCurrency  := 0.0;
      FieldByName('PERCENTUAL_MARCKUP').AsCurrency := 0.0;
    end
    else
    if ( FieldByName('PERCENTUAL_MARGEM').IsNull and (not FieldByName('PERCENTUAL_MARCKUP').IsNull) ) then
      FieldByName('PERCENTUAL_MARGEM').AsCurrency := FieldByName('PERCENTUAL_MARCKUP').AsCurrency;

    if ( DtSrcTabela.DataSet.State = dsInsert ) then
      if ( Trim(FieldByName('COD').AsString) = EmptyStr ) then
        FieldByName('COD').Value := FormatFloat(DisplayFormatCodigo, FieldByName('CODIGO').AsInteger);

    if Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').OldValue)) <> Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').NewValue)) then
      if (Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').OldValue)) <> EmptyStr) and (Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').NewValue)) <> EmptyStr) then
        FieldByName('SITUACAO_HISTORICO_VEICULO').AsString :=
          FormatDateTime('dd/mm/yyyy hh:mm', GetDateTimeDB)           + ' - '  +
          Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').OldValue)) + ' -> ' +
          Trim(VarToStr(FieldByName('SITUACAO_ATUAL_VEICULO').NewValue)) + ' (' + gUsuarioLogado.Login + ')' + #13 +
          Trim(FieldByName('SITUACAO_HISTORICO_VEICULO').AsString);

    FieldByName('DESCRICAO_COR').AsString         := dbCorVeiculo.Text;
    FieldByName('DESCRICAO_COMBUSTIVEL').AsString := dbTipoCombustivel.Text;
    FieldByName('MODELO_FABRICACAO').AsString     := dbAnoFabricacao.Text + '/' + dbAnoModelo.Text;

    if ( FieldByName('FRACIONADOR').AsCurrency <= 0 ) then
      FieldByName('FRACIONADOR').AsCurrency := 1;

    if ( Trim(FieldByName('NOME_AMIGO').AsString) = EmptyStr ) then
      FieldByName('NOME_AMIGO').AsString := Copy(Trim(Trim(FieldByName('DESCRI').AsString) + ' ' + Trim(FieldByName('APRESENTACAO').AsString)), 1, FieldByName('NOME_AMIGO').Size);

    // Gerar Centro de Custo Geral para armazanamento dos Lotes do produto quando
    // o sistema for de Gestão Comercial.
    if (FieldByName('ESTOQUE_APROP_LOTE').AsInteger = 1) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) then
    begin
      SetCentroCustoGeral(FieldByName('CODEMP').AsString);
      if (FieldByName('CODEMP').AsString <> gUsuarioLogado.Empresa) then
        SetCentroCustoGeral(gUsuarioLogado.Empresa);
    end;

    if ( Trim(FieldByName('TIPO_VEICULO').AsString) = EmptyStr ) then
      FieldByName('TIPO_VEICULO').Clear;

    if ( Trim(FieldByName('COR_VEICULO').AsString) = EmptyStr ) then
      FieldByName('COR_VEICULO').Clear;

    if ( Trim(FieldByName('COMBUSTIVEL_VEICULO').AsString) = EmptyStr ) then
      FieldByName('COMBUSTIVEL_VEICULO').Clear;
  end;
end;

procedure TfrmGeProduto.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('CODEMP').AsString := gUsuarioLogado.Empresa;

    if Trim(FieldByName('CODEMP').AsString) = EmptyStr then
      if ( not fdQryEmpresa.IsEmpty ) then
        FieldByName('CODEMP').AsString := fdQryEmpresa.FieldByName('cnpj').AsString;

    if ( not fdQryOrigem.IsEmpty ) then
      FieldByName('CODORIGEM').AsString := TRIBUTO_ORIGEM_NACIONAL;

    if ( GetRegimeEmpresa(FieldByName('CODEMP').AsString) = trSimplesNacional ) then
    begin
      if ( not fdQryTributacaoNM.IsEmpty ) then
        FieldByName('CODTRIBUTACAO').AsString := TRIBUTO_TRIBUTADA_ISENTA;
      if ( not qryTributacaoSN.IsEmpty ) then
        FieldByName('CSOSN').AsString := TRIBUTO_NAO_TRIBUTADA_SN;
    end
    else
    begin
      if ( not fdQryTributacaoNM.IsEmpty ) then
        FieldByName('CODTRIBUTACAO').AsString := TRIBUTO_TRIBUTADA_INTEG;
      if ( not qryTributacaoSN.IsEmpty ) then
        FieldByName('CSOSN').AsString := TRIBUTO_NAO_TRIBUTADA_SN;
    end;

    FieldByName('CST').AsString            := FieldByName('CODORIGEM').AsString + FieldByName('CODTRIBUTACAO').AsString;
    FieldByName('ESTOQMIN').AsCurrency     := 0;
    FieldByName('QTDE').AsCurrency         := 0;
    FieldByName('ESTOQMIN').AsCurrency     := 0;
    FieldByName('RESERVA').AsCurrency      := 0;
    FieldByName('CUSTOMEDIO').AsCurrency   := 0;
    FieldByName('PRECO').AsCurrency        := 0;
    FieldByName('CODCFOP').AsInteger       := GetCfopIDDefault;
    FieldByName('CFOP_DESCRICAO').AsString := GetCfopNomeDefault;
    FieldByName('CODTIPO').AsInteger       := Ord(TTipoProduto.tpMaterialGeral);
    FieldByName('ALIQUOTA_TIPO').AsInteger := Ord(fAliquota);
    FieldByName('ALIQUOTA').AsCurrency       := 0;
    FieldByName('ALIQUOTA_CSOSN').AsCurrency := 0;
    FieldByName('VALOR_IPI').AsCurrency      := 0;
    FieldByName('RESERVA').AsCurrency        := 0;
    FieldByName('PRODUTO_NOVO').AsInteger    := 0;
    FieldByName('PERCENTUAL_MARGEM').AsCurrency  := 20.0; // 20%
    FieldByName('PERCENTUAL_MARCKUP').AsCurrency := 0;
    FieldByName('PRECO_SUGERIDO').AsCurrency     := 0;
    FieldByName('GERAR_SUBPRODUTO').AsInteger    := FLAG_NAO;

    FieldByName('PESO_BRUTO').AsCurrency    := 0.0;
    FieldByName('PESO_LIQUIDO').AsCurrency  := 0.0;

    FieldByName('ALTURA').AsCurrency        := 0.0;
    FieldByName('LARGURA').AsCurrency       := 0.0;
    FieldByName('ESPESSURA').AsCurrency     := 0.0;
    FieldByName('CUBAGEM').AsCurrency       := 0.0;

    FieldByName('FRACIONADOR').AsInteger        := 1;
    FieldByName('VENDA_FRACIONADA').AsInteger   := 0;

    FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := 0;

    FieldByName('ANVISA').Clear;
    FieldByName('COR_VEICULO').Clear;
    FieldByName('COMBUSTIVEL_VEICULO').Clear;
    FieldByName('TIPO_VEICULO').Clear;
    FieldByName('RENAVAM_VEICULO').Clear;
    FieldByName('CHASSI_VEICULO').Clear;
    FieldByName('ANO_MODELO_VEICULO').Clear;
    FieldByName('ANO_FABRICACAO_VEICULO').Clear;
    FieldByName('NCM_SH').Clear;
    FieldByName('ULTIMA_COMPRA_DATA').Clear;
    FieldByName('ULTIMA_COMPRA_VALOR').Clear;
    FieldByName('ULTIMA_COMPRA_FORNEC').Clear;
    FieldByName('PRODUTO_PAI').Clear;

    FieldByName('TABELA_IBPT').AsInteger := GetTabelaIBPT_Codigo(TRIBUTO_NCM_SH_PADRAO);
    FieldByName('CST_PIS').AsString      := '99';
    FieldByName('CST_COFINS').AsString   := '99';
    FieldByName('ALIQUOTA_PIS').AsCurrency       := 0.0;
    FieldByName('ALIQUOTA_COFINS').AsCurrency    := 0.0;
    FieldByName('MOVIMENTA_ESTOQUE').AsInteger   := FLAG_SIM;
    FieldByName('CADASTRO_ATIVO').AsInteger      := FLAG_SIM;
    FieldByName('PRODUTO_IMOBILIZADO').AsInteger := FLAG_NAO;
    FieldByName('COMPOR_FATURAMENTO').AsInteger := StrToInt(IfThen(GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID], '0', '1'));
    FieldByName('ESTOQUE_APROP_LOTE').AsInteger := IfThen(gSistema.Codigo = SISTEMA_GESTAO_OPME, FLAG_SIM, FLAG_NAO);

    DtSrcTabelaDataChange(DtSrcTabela, FieldByName('ALIQUOTA_TIPO'));
  end;
end;

procedure TfrmGeProduto.FormActivate(Sender: TObject);
begin
  inherited;
  {$IFDEF DGE}
  EvUA.UserID := GetUserFunctionID;

  Case GetUserFunctionID of
    FUNCTION_USER_ID_ESTOQUISTA ,
    FUNCTION_USER_ID_VENDEDOR   ,
    FUNCTION_USER_ID_CAIXA      ,
    FUNCTION_USER_ID_AUX_FINANC1,
    FUNCTION_USER_ID_AUX_FINANC2:
      begin
        btbtnIncluir.Visible  := False;
        btbtnAlterar.Visible  := False;
        btbtnExcluir.Visible  := False;
        btbtnCancelar.Visible := False;
        btbtnSalvar.Visible   := False;

        DtSrcTabela.AutoEdit := False;

        lblCusto.Visible := False;
        dbCusto.Visible  := False;

        lblPercentualMarckup.Visible := False;
        dbPercentualMarckup.Visible  := False;

        lblLucroValor.Visible := False;
        dbLucroValor.Visible  := False;
      end;
  end;
  {$ENDIF}

  if pgcGuias.ActivePage = tbsTabela then
  begin
    FiltarDados;
    if ( edtFiltrar.Visible and edtFiltrar.Enabled ) then
      edtFiltrar.SetFocus;
  end;

  dbgDados.Columns[COLUMN_QTDE].Visible       := ( gSistema.Codigo <> SISTEMA_GESTAO_IND );
  dbgDados.Columns[COLUMN_DISPONIVEL].Visible := ( gSistema.Codigo <> SISTEMA_GESTAO_IND );
  lblProdutoPromocao.Visible   := ( gSistema.Codigo <> SISTEMA_GESTAO_IND );
  lblProdutoSemEstoque.Visible := ( gSistema.Codigo <> SISTEMA_GESTAO_IND );

  dbgDados.Columns[COLUMN_LUCRO].Visible := ( gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA..FUNCTION_USER_ID_GERENTE_FIN,
    FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SUPORTE_TI, FUNCTION_USER_ID_SYSTEM_ADM] )
    and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
end;

procedure TfrmGeProduto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    // Destacar serviços/produtos desativados
    if ( FieldByName('CADASTRO_ATIVO').AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := lblProdutoDesativado.Font.Color
    else
    begin
      // Destacar produtos sem Estoque
      if ( TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS ) then
        if ( FieldByName('QTDE').AsCurrency <= 0 ) then
          if lblProdutoSemEstoque.Visible then
            dbgDados.Canvas.Font.Color := lblProdutoSemEstoque.Font.Color;

      // Destacar produtos em Promocao
      if ( FieldByName('PRECO_PROMOCAO').AsCurrency > 0 ) then
        if lblProdutoPromocao.Visible then
          dbgDados.Canvas.Font.Color := lblProdutoPromocao.Font.Color;

      // Destacar alerta de lucros
      if ( (FieldByName('COMPOR_FATURAMENTO').AsInteger = 1) and (FieldByName('PRECO_PROMOCAO').AsCurrency = 0.0) ) then
        if (not FieldByName('LUCRO_CALCULADO').IsNull) and (FieldByName('PRECO').AsCurrency > 0.0) then
        begin
          if ( FieldByName('LUCRO_CALCULADO').AsInteger = 0 ) then
            dbgDados.Canvas.Brush.Color := ShpLucroZerado.Brush.Color
          else
          if ( FieldByName('LUCRO_CALCULADO').AsInteger < 0 ) then
            dbgDados.Canvas.Brush.Color := ShpLucroNegativo.Brush.Color;
        end;
    end;
  end;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeProduto.dbFabricanteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFabricante(Self, iCodigo, sNome) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CODFABRICANTE').AsInteger  := iCodigo;
      DtSrcTabela.DataSet.FieldByName('NOME_FABRICANTE').AsString := sNome;
    end;
end;

procedure TfrmGeProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if ( (ActiveControl = dbComporFaturamento) and GrpBxParametroProdudo.Enabled ) then
    begin
      if dbProdutoEhImobilizado.Enabled then
        dbProdutoEhImobilizado.SetFocus
      else
      if dbProdutoMovEstoque.Enabled then
        dbProdutoMovEstoque.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbProdutoPorLote) and dbGerarSubproduto.Visible ) then
    begin
      if dbGerarSubproduto.Enabled then
        dbGerarSubproduto.SetFocus;
      Exit;
    end
    else
    if ( ((ActiveControl = dbComporFaturamento) or (ActiveControl = dbProdutoPorLote) or (ActiveControl = dbGerarSubproduto)) and tbsCustoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsCustoVeiculo;
      dbValorCompraVeiculo.SetFocus;
      Exit;
    end
    else
    if ( ((ActiveControl = dbComporFaturamento) or (ActiveControl = dbProdutoPorLote) or (ActiveControl = dbGerarSubproduto)) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbProdutoMovEstoque) and (dbProdutoMovEstoque.Checked and (not dbProdutoPorLote.Enabled)) ) then
    begin
      dbProdutoPorLote.Enabled := True;
      dbProdutoPorLote.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbProdutoMovEstoque) and ((not dbProdutoMovEstoque.Checked) or (not dbProdutoPorLote.Enabled)) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbValorRetornoVeiculo) and tbsTributacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsTributacao;
      dbOrigem.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbAliquotaCOFINS) and TbsEspecificacao.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := TbsEspecificacao;
      if pnlVeiculo.Visible then
        dbTipoVeiculo.SetFocus
      else
      if pnlVolume.Visible then
        dbPesoBruto.SetFocus
      else
        dbEspecificacao.SetFocus;
      Exit;
    end
    else
    if ( (ActiveControl = dbKilometragem) and tbsHistoricoVeiculo.TabVisible ) then
    begin
      pgcMaisDados.ActivePage := tbsHistoricoVeiculo;
      dbSituacaoVeiculo.SetFocus;
      Exit;
    end;

  inherited;

end;

procedure TfrmGeProduto.chkProdutoComEstoqueClick(Sender: TObject);
begin
  if ( Showing and (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible and edtFiltrar.Enabled) ) then
    edtFiltrar.SetFocus;
end;

procedure TfrmGeProduto.ConfigurarLabels;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pnlVeiculo.Visible ) then
    begin
      lblDescricao.Caption               := 'Modelo Veículo:';
      FieldByName('DESCRI').DisplayLabel := 'Modelo Veículo';
      lblApresentacao.Caption                  := 'Linha:';
      FieldByName('APRESENTACAO').DisplayLabel := 'Linha';
      lblReferencia.Caption                  := 'Placa:';
      FieldByName('REFERENCIA').DisplayLabel := 'Placa';
      lblGrupo.Caption                            := 'Família:';
      FieldByName('DESCRICAO_GRUPO').DisplayLabel := 'Família';
    end;

    if (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS) then
    begin
      lblCusto.Caption := 'Custo (R$):';
      FieldByName('CUSTOMEDIO').DisplayLabel := 'Custo (R$)';
      GrpBxParametroProdudo.Font.Color       := clBlack;
    end
    else
    begin
      lblCusto.Caption := 'Custo Oper.(R$):';
      FieldByName('CUSTOMEDIO').DisplayLabel := 'Custo Oper.(R$)';
      GrpBxParametroProdudo.Font.Color       := clGray;
    end;
  end;
end;

procedure TfrmGeProduto.ControleCampos;
begin
  with DtSrcTabela.DataSet do
  begin
    lblTipoCadastro.Enabled := (gSistema.Codigo <> SISTEMA_GESTAO_OPME);
    dbTipoCadastro.Enabled  := (gSistema.Codigo <> SISTEMA_GESTAO_OPME);

    lblTipoProduto.Enabled        := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    dbTipoProduto.Enabled         := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    GrpBxParametroProdudo.Enabled := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    pnlVolume.Visible             := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);

    lblFabricante.Enabled := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    dbFabricante.Enabled  := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    lblModelo.Enabled     := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    dbModelo.Enabled      := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);

    lblCodigoAnvisa.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) and (TTipoProduto(FieldByName('CODTIPO').AsInteger) in [TTipoProduto.tpMaterialMedicoHosp, TTipoProduto.tpMedicamento, TTipoProduto.tpSolucao, TTipoProduto.tpOPME] );
    dbCodigoAnvisa.Visible  := lblCodigoAnvisa.Visible;
    lblModelo.Visible := not lblCodigoAnvisa.Visible;
    dbModelo.Visible  := not dbCodigoAnvisa.Visible;

    dbProdutoNovo.Enabled          := (gSistema.Codigo = SISTEMA_GESTAO_COM) and (GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
    dbProdutoEhImobilizado.Enabled := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS); //(gSistema.Codigo = SISTEMA_GESTAO_IND);
    dbProdutoMovEstoque.Enabled    := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    dbGerarSubproduto.Enabled      := (gSistema.Codigo = SISTEMA_GESTAO_IND);
  end;
end;

procedure TfrmGeProduto.btnFiltrarClick(Sender: TObject);
begin
//  if not GetEstoqueUnificadoEmpresa(gUsuarioLogado.Empresa) then
//    WhereAdditional := '(p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')'
//  else
//    WhereAdditional := '(1 = 1)';
//
//  if fApenasProdutos then
//    WhereAdditional := WhereAdditional + ' and (p.Aliquota_tipo = ' + IntToStr(Ord(taICMS)) + ')'
//  else
//  if fApenasServicos then
//    WhereAdditional := WhereAdditional + ' and (p.Aliquota_tipo = ' + IntToStr(Ord(taISS)) + ')';
//
//  if chkProdutoComEstoque.Visible then
//    if chkProdutoComEstoque.Checked then
//      WhereAdditional := WhereAdditional + ' and ((p.Qtde > 0) or (p.Aliquota_tipo = 1))';
//
  // inherited;
  AddWhereAdditional;
  FiltarDados(CmbBxFiltrarTipo.ItemIndex);
end;

procedure TfrmGeProduto.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  cAliquotaIss   ,
  cAliquotaPis   ,
  cAliquotaCofins,
  cAliquotaIcmsInter,
  cAliquotaIcmsIntra,
  cAliquotaIcmsST   : Currency;
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
    begin
      if (State = dsInsert) and ((Field = FieldByName('DESCRI')) or (Field = FieldByName('APRESENTACAO'))) then
        FieldByName('NOME_AMIGO').AsString := Copy(Trim(Trim(FieldByName('DESCRI').AsString) + ' ' + Trim(FieldByName('APRESENTACAO').AsString)), 1, FieldByName('NOME_AMIGO').Size);

      if ( Field = FieldByName('ALIQUOTA_TIPO') ) then
      begin
        if (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taISS) then
        begin
          cAliquotaIss    := 0.0;
          cAliquotaPis    := 0.0;
          cAliquotaCofins := 0.0;
          AliquotaIss(gUsuarioLogado.Empresa, 0, 0
            , cAliquotaIss
            , cAliquotaPis
            , cAliquotaCofins);
          FieldByName('PRODUTO_NOVO').AsInteger        := 0;
          FieldByName('MOVIMENTA_ESTOQUE').AsInteger   := 0;
          FieldByName('PRODUTO_IMOBILIZADO').AsInteger := 0;
          FieldByName('ESTOQUE_APROP_LOTE').AsInteger  := 0;
          FieldByName('ALIQUOTA').AsCurrency           := cAliquotaIss;
          FieldByName('ALIQUOTA_CSOSN').AsCurrency     := cAliquotaIss;
        end
        else
        begin
          cAliquotaIcmsInter := 0.0;
          cAliquotaIcmsIntra := 0.0;
          cAliquotaIcmsST    := 0.0;
          AliquotaIcms(GetEmpresaUF(gUsuarioLogado.Empresa), GetEmpresaUF(gUsuarioLogado.Empresa)
            , cAliquotaIcmsInter
            , cAliquotaIcmsIntra
            , cAliquotaIcmsST);
          FieldByName('MOVIMENTA_ESTOQUE').AsInteger := 1;
          FieldByName('ALIQUOTA').AsCurrency         := cAliquotaIcmsInter;
          FieldByName('ALIQUOTA_CSOSN').AsCurrency   := cAliquotaIcmsInter;
        end;

        lblTipoProduto.Enabled        := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
        dbTipoProduto.Enabled         := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
        GrpBxParametroProdudo.Enabled := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
      end;

      if ( (Field = FieldByName('PERCENTUAL_MARCKUP')) or (Field = FieldByName('PERCENTUAL_MARGEM')) ) then
        FieldByName('PRECO_SUGERIDO').AsCurrency := FieldByName('CUSTOMEDIO').AsCurrency +
          (FieldByName('CUSTOMEDIO').AsCurrency *
            IfThen(FieldByName('PERCENTUAL_MARCKUP').AsCurrency = 0.0
              , FieldByName('PERCENTUAL_MARGEM').AsCurrency
              , FieldByName('PERCENTUAL_MARCKUP').AsCurrency) / 100);

      if ( Field = FieldByName('MOVIMENTA_ESTOQUE') ) then
        dbProdutoPorLote.Enabled := (FieldByName('MOVIMENTA_ESTOQUE').AsInteger = 1);

      if ( Field = FieldByName('CODTIPO') ) then
      begin
        ControleCampos;
        ConfigurarLabels;
      end;

      if ( (Field = FieldByName('ALTURA')) or (Field = FieldByName('LARGURA')) or (Field = FieldByName('ESPESSURA')) ) then
        FieldByName('CUBAGEM').AsCurrency := FieldByName('ALTURA').AsCurrency * FieldByName('LARGURA').AsCurrency * FieldByName('ESPESSURA').AsCurrency;
    end;
end;

procedure TfrmGeProduto.FiltarDados(const iTipoPesquisa : Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with fdQryTabela, SQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        Case iTipoPesquisa of
          // Por Código, Descrição
          0:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where (' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) + ')' )
            else
              Add( 'where (upper(' + CampoDescricao +  ') like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '    or upper(' + CampoDescricao +  ') like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') +
                   '    or upper(p.metafonema) like ' + QuotedStr(Metafonema(edtFiltrar.Text) + '%') +
                   '    or upper(p.nome_amigo) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
                   '    or upper(p.nome_amigo) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')');

          // Por Referência
          1:
            Add( 'where p.Referencia = ' + QuotedStr(Trim(edtFiltrar.Text)) );

          // Por Fabricante
          2:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where (p.Codfabricante = ' + Trim(edtFiltrar.Text) + ')' )
            else
              Add( 'where (upper(f.Nome) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') + ')' );

          // Por Grupo
          3:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              Add( 'where (p.Codgrupo = ' + Trim(edtFiltrar.Text) + ')' )
            else
              Add( 'where (upper(g.Descri) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') + ')' );
        end;

      end;

      if ( WhereAdditional <> EmptyStr ) then
        if ( Pos('where', SQL.Text) > 0 ) then
          Add( '  and (' + WhereAdditional + ')' )
        else
          Add( 'where (' + WhereAdditional + ')' );

      Add( '  and (' + PRD_ARQUIVO_MORTO + ')');
      Add( 'order by ' + CampoOrdenacao );

      Open;

      try
      
        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + fdQryTabela.SQL.Text);
  end;
end;

procedure TfrmGeProduto.dbUnidadeFracaoButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao,
  sSigla    : String;
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarUnidade(Self, iCodigo, sDescricao, sSigla) ) then
      begin
        FieldByName('CODUNIDADE_FRACIONADA').AsInteger := iCodigo;
        FieldByName('DESCRICAO_UNIDADE_FRAC').AsString := sDescricao;
        FieldByName('UNP_SIGLA_FRAC').AsString         := sSigla;
      end;
end;

procedure TfrmGeProduto.btbtnSalvarClick(Sender: TObject);
begin
  // Validações de Dados

  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
    begin
      if (FieldByName('TABELA_IBPT').AsInteger = 0) then
        FieldByName('TABELA_IBPT').Clear;

      if ( ((FieldByName('ALIQUOTA').AsCurrency < 0) and (FieldByName('ALIQUOTA').AsCurrency > 100)) or ((FieldByName('ALIQUOTA_CSOSN').AsCurrency < 0) and (FieldByName('ALIQUOTA_CSOSN').AsCurrency > 100)) ) then
      begin
        ShowWarning('Percentual de alíquota fora da faixa permitida');
        Exit;
      end
      else
      if ( ((FieldByName('ALIQUOTA_PIS').AsCurrency < 0) and (FieldByName('ALIQUOTA_PIS').AsCurrency > 100)) or ((FieldByName('ALIQUOTA_COFINS').AsCurrency < 0) and (FieldByName('ALIQUOTA_COFINS').AsCurrency > 100)) ) then
      begin
        ShowWarning('Percentual de alíquota Pis/Confis fora da faixa permitida');
        Exit;
      end
      else
      if ( FieldByName('FRACIONADOR').AsInteger = 1 ) then
      begin
        if ( FieldByName('CODUNIDADE').AsInteger <> FieldByName('CODUNIDADE_FRACIONADA').AsInteger ) then
        begin
          ShowWarning('A "Unidade da Fração" selecionada deve ser igual a informada no campo "Unidade"!');
          Exit;
        end;
      end
      else
      if ( FieldByName('FRACIONADOR').AsInteger > 1 ) then
      begin
        if ( FieldByName('CODUNIDADE').AsInteger = FieldByName('CODUNIDADE_FRACIONADA').AsInteger ) then
        begin
          ShowWarning('A "Unidade da Fração" selecionada deve ser diferente na informada no campo "Unidade"!');
          Exit;
        end;
      end;

      if FieldByName('CODTIPO').IsNull then
        FieldByName('CODTIPO').AsInteger := Ord(TTipoProduto.tpMaterialGeral);

      if (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taISS) then
      begin
        FieldByName('PRODUTO_NOVO').AsInteger        := 0;
        FieldByName('MOVIMENTA_ESTOQUE').AsInteger   := 0;
        FieldByName('PRODUTO_IMOBILIZADO').AsInteger := 0;
        FieldByName('ESTOQUE_APROP_LOTE').AsInteger  := 0;
      end
      else
      if (FieldByName('MOVIMENTA_ESTOQUE').AsInteger = 0) then
        FieldByName('ESTOQUE_APROP_LOTE').AsInteger  := 0;

      if ( FieldByName('COMPOR_FATURAMENTO').AsInteger = 1 ) then
        FieldByName('PRECO_SUGERIDO').AsCurrency := FieldByName('CUSTOMEDIO').AsCurrency +
          (FieldByName('CUSTOMEDIO').AsCurrency *
            IfThen(FieldByName('PERCENTUAL_MARCKUP').AsCurrency = 0.0
              , FieldByName('PERCENTUAL_MARGEM').AsCurrency
              , FieldByName('PERCENTUAL_MARCKUP').AsCurrency) / 100);
    end;

    FieldByName('FRACIONADOR').Required           := (FieldByName('VENDA_FRACIONADA').AsInteger = 1);
    FieldByName('CODUNIDADE_FRACIONADA').Required := (FieldByName('VENDA_FRACIONADA').AsInteger = 1);
    FieldByName('ANVISA').Required := dbCodigoAnvisa.Visible;
  end;

  inherited;
end;

procedure TfrmGeProduto.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  ControleCampos;
  ConfigurarLabels;
end;

procedure TfrmGeProduto.ppMnAtualizarMetafonemaClick(Sender: TObject);
var
  sUpdate : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    First;
    DisableControls;
    Screen.Cursor := crSQLWait;
    try
      while not Eof do
      begin
        sUpdate := 'Update TBPRODUTO Set metafonema = %s where cod = %s';
        sUpdate := Format(sUpdate, [
          QuotedStr(Metafonema(FieldByName('DESCRI_APRESENTACAO').AsString)),
          QuotedStr(FieldByName('COD').AsString)]);
        ExecuteScriptSQL( sUpdate );

        Next;
      end;
    finally
      First;

      EnableControls;
      Screen.Cursor := crDefault;

      ShowInformation('Atualização', 'Código metafônico dos registros atualizados com sucesso!');
    end;
  end;
end;

procedure TfrmGeProduto.ppMnAtualizarNomeAmigoClick(Sender: TObject);
var
  sUpdate    ,
  sNomeAmigo : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    First;
    DisableControls;
    Screen.Cursor := crSQLWait;
    try
      while not Eof do
      begin
        if ( Trim(FieldByName('NOME_AMIGO').AsString) = EmptyStr ) then
        begin
          sNomeAmigo := Copy(Trim(Trim(FieldByName('DESCRI').AsString) + ' ' + Trim(FieldByName('APRESENTACAO').AsString)), 1, FieldByName('NOME_AMIGO').Size);

          sUpdate := 'Update TBPRODUTO Set nome_amigo = %s where cod = %s';
          sUpdate := Format(sUpdate, [
            QuotedStr(sNomeAmigo),
            QuotedStr(FieldByName('COD').AsString)]);
          ExecuteScriptSQL( sUpdate );
        end;

        Next;
      end;
    finally
      First;

      fdQryTabela.Refresh;

      EnableControls;
      Screen.Cursor := crDefault;

      ShowInformation('Atualização', 'Nome Amigo dos registros atualizados com sucesso!');
    end;
  end;
end;

procedure TfrmGeProduto.ppMnAtualizarTabelaIBPTClick(Sender: TObject);
var
  iCodigoNCM : Integer;
  sCodigoNCM ,
  sUpdate    : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    First;
    DisableControls;
    Screen.Cursor := crSQLWait;
    try
      while not Eof do
      begin
        sUpdate    := 'Update TBPRODUTO Set tabela_ibpt = %s, ncm_sh = %s where cod = %s';
        sCodigoNCM := IfThen(StrToInt64Def(Trim(FieldByName('NCM_SH').AsString), 0) = 0, TRIBUTO_NCM_SH_PADRAO, FieldByName('NCM_SH').AsString);
        sCodigoNCM := IfThen(sCodigoNCM = '10203000', TRIBUTO_NCM_SH_PADRAO, sCodigoNCM); // Código descontinuado a partir de 10203000
        iCodigoNCM := GetTabelaIBPT_Codigo(sCodigoNCM);

        sUpdate := Format(sUpdate, [
          IfThen(iCodigoNCM = 0, 'null', IntToStr(iCodigoNCM)),
          IfThen((sCodigoNCM = EmptyStr) or (sCodigoNCM = TRIBUTO_NCM_SH_PADRAO) or (sCodigoNCM = '10203000'), 'null', QuotedStr(sCodigoNCM)),
          QuotedStr(FieldByName('COD').AsString)]);

        ExecuteScriptSQL( sUpdate );

        Next;
      end;
    finally
      First;

      EnableControls;
      Screen.Cursor := crDefault;

      ShowInformation('Atualização', 'Código da Tabela IBPT dos registros atualizados com sucesso!');
    end;
  end;
end;

procedure TfrmGeProduto.AddWhereAdditional;
var
  sWhr : String;
begin
  sWhr := PRD_ARQUIVO_MORTO;

  if not GetEstoqueUnificadoEmpresa(gUsuarioLogado.Empresa) then
    sWhr := sWhr + ' and (p.codemp = ' + QuotedStr(gUsuarioLogado.Empresa) + ')';

  if chkProdutoComEstoque.Visible then
    if chkProdutoComEstoque.Checked then
      sWhr := sWhr + ' and ((p.qtde > 0) or (p.movimenta_estoque = 0) or (p.aliquota_tipo = 1))';

  if fApenasProdutos then
    sWhr := sWhr + ' and (p.Aliquota_tipo = ' + IntToStr(Ord(taICMS)) + ')'
  else
  if fApenasServicos then
    sWhr := sWhr + ' and (p.Aliquota_tipo = ' + IntToStr(Ord(taISS)) + ')';

  if fRealizarVenda then
    sWhr := sWhr + ' and (p.compor_faturamento = 1)';

  WhereAdditional := '(' + sWhr + ')';
end;

procedure TfrmGeProduto.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TfrmGeProduto.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

end.
