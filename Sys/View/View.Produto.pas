unit View.Produto;

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

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UCliente,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE;

type
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
    aReserva ,
    aFracionador : Currency;
    aMovimentaEstoque,
    aEstoquePorLote  : Boolean;
  end;

  ProdutoServicoPonteiro = ^TProdutoServico;

  TViewProduto = class(TViewPadraoCadastro)
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
    dtsCorVeiculo: TDataSource;
    dtsTipoCombustivel: TDataSource;
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
    dtsTipoProduto: TDataSource;
    lblTipoProduto: TLabel;
    dbTipoProduto: TDBLookupComboBox;
    lblCodigoAnvisa: TLabel;
    dbCodigoAnvisa: TDBEdit;
    dbGerarSubproduto: TDBCheckBox;
    lblAltura: TLabel;
    dbAltura: TDBEdit;
    dbLargura: TDBEdit;
    lblLargura: TLabel;
    dbEspessura: TDBEdit;
    lblEspessura: TLabel;
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
  private
    { Private declarations }
    FControllerTipoAliquotaView,
    FControllerTipoProduto     ,
    FControllerEmpresaView     ,
    FControllerOrigemProdutoView   ,
    FControllerTipoTributacaoNormal,
    FControllerTipoTributacaoSN    ,
    FControllerAliquotaPISView     ,
    FControllerAliquotaCOFINSView  ,
    FControllerTipoVeiculo,
    FControllerCorVeiculo ,
    FControllerCombustivelVeiculo ,
    FControllerIBPT : IControllerCustom;

    fOrdenado : Boolean;
    fAliquota : TAliquota;
    fRealizarVenda  ,
    fApenasProdutos ,
    fApenasServicos : Boolean;
    Procedure ControleCampos;
    procedure AddWhereAdditional;
    procedure OcultarTipoProduto;
    procedure ConfigurarLabels;

    function Controller : IControllerProduto;
    function Empresa : IControllerEmpresa;
    function IBPT : IControllerIBPT;
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
  - GET_ALIQUOTA_ICMS
*)

var
  ViewProduto: TViewProduto;

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
  UDMBusiness,
  UDMRecursos,
  UFuncoes,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  UGrPadrao,
  View.UnidadeProduto,
  View.FabricanteProduto,
  View.GrupoProduto,
  View.SecaoProduto,
  View.CFOP,
  View.IBPT;

{$R *.dfm}

const
  PRD_ARQUIVO_MORTO = '(p.arquivo_morto = 0)';
  COLUMN_QTDE       = 2;
  COLUMN_DISPONIVEL = 3;
  COLUMN_LUCRO      = 12;
  COLUMN_GRUPO      = 13;

procedure MostrarTabelaProdutos(const AOwner : TComponent; const TipoAliquota : TAliquota);
var
  AForm : TViewProduto;
begin
  AForm := TViewProduto.Create(AOwner);
  try
    AForm.fAliquota       := TipoAliquota;
    AForm.fApenasProdutos := True;
    AForm.fApenasServicos := False;
    AForm.chkProdutoComEstoque.Checked := False;
    AForm.AddWhereAdditional;

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure MostrarTabelaProdutos(const AOwner : TComponent);
var
  AForm : TViewProduto;
begin
  AForm := TViewProduto.Create(AOwner);
  try
    AForm.fAliquota       := taICMS;
    AForm.fApenasProdutos := True;
    AForm.fApenasServicos := False;

    AForm.chkProdutoComEstoque.Checked := False;
    AForm.AddWhereAdditional;

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure MostrarTabelaServicos(const AOwner : TComponent);
var
  AForm : TViewProduto;
begin
  AForm := TViewProduto.Create(AOwner);
  try
    AForm.fAliquota := taISS;
    AForm.fApenasProdutos := False;
    AForm.fApenasServicos := True;
    AForm.chkProdutoComEstoque.Checked := False;
    AForm.AddWhereAdditional;

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarProdutoParaAjuste(const AOwner : TComponent; const Empresa : String;
  var Codigo : Integer;
  var CodigoAlfa, Nome : String) : Boolean;
var
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled      := False;
    frm.dbAliquotaTipo.Enabled       := False;

    whr := PRD_ARQUIVO_MORTO + ' and (p.codemp = ' + QuotedStr(Empresa) + ') and (p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota)) + ')';

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and (p.Qtde > 0)';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
      CodigoAlfa := frm.DtSrcTabela.DataSet.FieldByName('COD').AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoParaVenda(const AOwner : TComponent; var pProduto : TProdutoServico) : Boolean;
var
  AForm : TViewProduto;
  iCodigo    : Integer;
  sDescricao : String;
begin
  AForm := TViewProduto.Create(AOwner);
  try
    AForm.fAliquota       := taICMS;
    AForm.fApenasProdutos := True;
    AForm.fRealizarVenda  := True;
    AForm.AddWhereAdditional;

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

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
        aFracionador := FieldByName('FRACIONADOR').AsCurrency;

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
  frm : TViewProduto;
begin
  frm := TViewProduto.Create(AOwner);
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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if (GetPermitirVendaEstoqueInsEmpresa(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
       frm.chkProdutoComEstoque.Checked := False;

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

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
  frm : TViewProduto;
  aCodigo : Integer;
  aNome   : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    frm.AddWhereAdditional;

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(frm.WhereAdditional);
    frm.FController.DAO.Open;

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
        aFracionador := FieldByName('FRACIONADOR').AsCurrency;

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
  frm : TViewProduto;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota       := taICMS;
    frm.fApenasProdutos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    frm.AddWhereAdditional;

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(frm.WhereAdditional);
    frm.FController.DAO.Open;

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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota       := taISS;
    frm.fApenasServicos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

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
  frm : TViewProduto;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    Result := frm.SelecionarRegistro(Codigo, Nome);

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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota       := taISS;
    frm.fApenasServicos := True;

    frm.chkProdutoComEstoque.Checked := False;
    frm.chkProdutoComEstoque.Visible := False;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

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
  frm : TViewProduto;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.chkProdutoComEstoque.Checked := False;
    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    Result := frm.SelecionarRegistro(Codigo, Nome);

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
  frm : TViewProduto;
  whr : String;
begin
  frm := TViewProduto.Create(AOwner);
  try
    frm.fAliquota := taICMS;

    frm.lblAliquotaTipo.Enabled := False;
    frm.dbAliquotaTipo.Enabled  := False;

    whr := 'p.Aliquota_tipo = ' + IntToStr(Ord(frm.fAliquota));

    if frm.chkProdutoComEstoque.Checked then
      whr := whr + ' and p.Qtde > 0';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

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

procedure TViewProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Produto;
  FControllerTipoAliquotaView := TControllerFactory.New.TipoAliquotaView;
  FControllerTipoProduto := TControllerFactory.New.TipoProduto;
  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerOrigemProdutoView := TControllerFactory.New.OrigemProdutoView;
  FControllerTipoTributacaoNormal := TControllerFactory.New.TipoTributacao;
  FControllerTipoTributacaoSN     := TControllerFactory.New.TipoTributacao;
  FControllerAliquotaPISView     := TControllerFactory.New.AliquotaCOFINSView;
  FControllerAliquotaCOFINSView  := TControllerFactory.New.AliquotaPISView;

  inherited;
  RotinaID         := ROTINA_CAD_PRODUTO_ID;
  ControlFirstEdit := dbCodigoEAN;

  fOrdenado := False;
  fAliquota := taICMS;

  fRealizarVenda  := False;
  fApenasProdutos := False;
  fApenasServicos := False;

  if (gSistema.Codigo = SISTEMA_GESTAO_IND) or (Empresa.GetSegmentoID(gUsuarioLogado.Empresa) in [
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

  if (Empresa.GetPermitirVendaEstoqueInsuficiente(gUsuarioLogado.Empresa) and (gSistema.Codigo = SISTEMA_PDV)) then
    chkProdutoComEstoque.Checked := False;

  Tabela
    .Display('CODIGO',        'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('COD',           '#', TAlignment.taCenter, True)
    .Display('ALIQUOTA_TIPO', 'Tipo Cadastro', TAlignment.taLeftJustify, True)
    .Display('CODBARRA_EAN',  'Código EAN', False)
    .Display('DESCRI',        'Descrição', True)
    .Display('APRESENTACAO',  'Apresentação', False)
    .Display('CODTIPO',       'Tipo do Produto', True)
    .Display('NOME_AMIGO',    'Nome amigo', False)
    .Display('CODFABRICANTE', 'Fabricante', False)
    .Display('ANVISA',        'Código Ansiva', (gSistema.Codigo = SISTEMA_GESTAO_OPME))
    .Display('REFERENCIA',    'Referência', (gSistema.Codigo = SISTEMA_GESTAO_OPME))
    .Display('MODELO',        'Modelo', False)
    .Display('CODGRUPO',      'Grupo', True)
    .Display('CODSECAO',      'Seção', False)
    .Display('NCM_SH',        'NCM/SH', True)
    //  Para veículos
//    .Display('PRECO2',  'Outros na Compra (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CUST_COMISSAO',  'Outros da Comissão (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CUST_DESP_OFIC',  'Outros de Oficina (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CUST_IMPOSTO',  'Outros de Impostos (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CUST_DESP_ADM',  'Outros Administrativo (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('CUST_DESP_GERAIS',  'Outros Custo (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('FI_RET_FINANC',  'Retorno Financeiadora (R$)', ',0.00', TAlignment.taRightJustify, False)
//    .Display('FI_RET_PLANO',   'Retorno por Plano (R$)', ',0.00', TAlignment.taRightJustify, False)
    // Valores de Venda e Custo
    .Display('PRECO',          'Preço Venda (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('PRECO_PROMOCAO', 'Preço Promoção (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('CUSTOMEDIO',     'Custo Médio (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('PERCENTUAL_MARGEM',  '% Margem de Lucro', ',0.###', TAlignment.taRightJustify, False)
    .Display('LUCRO_VALOR',        'Lucro Calculado (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('PRECO_SUGERIDO',     'Preço Venda Sugerido (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('PERCENTUAL_MARCKUP', '% Markup', ',0.###', TAlignment.taRightJustify, False)
    // Fracionamento
    .Display('PRECO_FRAC',          'Preço Venda Frac. (R$)', ',0.00##', TAlignment.taRightJustify, False)
    .Display('PRECO_PROMOCAO_FRAC', 'Preço Promoção Frac. (R$)', ',0.00##', TAlignment.taRightJustify, False)
    .Display('PRECO_SUGERIDO_FRAC', 'Preço Venda Sugerido Frac. (R$)', ',0.00##', TAlignment.taRightJustify, False)
    // Última compra
    .Display('ULTIMA_COMPRA_DATA',  'Data Última Compra', 'dd/mm/yyyy', TAlignment.taLeftJustify, False)
    .Display('ULTIMA_COMPRA_VALOR', 'Valor Última Compra (R$)', ',0.00', TAlignment.taRightJustify, False)
    // Especificações para Veículos
    .Display('COR_VEICULO',        'Cor do Veículo', False)
    .Display('COMBUSTIVEL_VEICULO','Tipo do Combustível', False)
    .Display('TIPO_VEICULO',       'Tipo do Veículo', False)
    .Display('RENAVAM_VEICULO',    'Renavam', False)
    .Display('CHASSI_VEICULO',     'Chassi', False)
    .Display('KILOMETRAGEM_VEICULO',   'Kilometragem', False)
    .Display('ANO_MODELO_VEICULO',     'Ano do Modelo', False)
    .Display('ANO_FABRICACAO_VEICULO', 'Ano de Fabricação', False)
    // Especificações
    .Display('PESO_BRUTO',   'Peso bruto (Kg)', ',0.###', TAlignment.taRightJustify, False)
    .Display('PESO_LIQUIDO', 'Peso líquido (Kg)', ',0.###', TAlignment.taRightJustify, False)
    .Display('ALTURA',       'Altura (m)', ',0.###', TAlignment.taRightJustify, False)
    .Display('LARGURA',      'Largura (m)', ',0.###', TAlignment.taRightJustify, False)
    .Display('ESPESSURA',    'Espessura (m)', ',0.###', TAlignment.taRightJustify, False)
    .Display('CUBAGEM',      'Cubagem (m3)', ',0.###', TAlignment.taRightJustify, False);

  AbrirTabelaAuto := True;

  // Tipo de Tributação Normal
  FControllerTipoTributacaoNormal.DAO.ClearWhere;
  FControllerTipoTributacaoNormal
    .DAO
    .Where('coalesce(t.obrigar_cest, 0) = 0')
    .Where('t.Crt = 0')
    .Open;

  // Tipo de Tributação Simples Nacional
  FControllerTipoTributacaoSN.DAO.ClearWhere;
  FControllerTipoTributacaoSN
    .DAO
    .Where('coalesce(t.obrigar_cest, 0) = 0')
    .Where('t.Crt = 1')
    .Open;

  // Configurando os campos de listagem (LookupComboBox)
  TController(FControllerTipoAliquotaView)
    .LookupComboBox(dbTipoCadastro, dtsAliquota, 'aliquota_tipo', 'codigo', 'tipo');
  TController(FControllerTipoAliquotaView)
    .LookupComboBox(dbAliquotaTipo, dtsAliquota, 'aliquota_tipo', 'codigo', 'descricao');
  TController(FControllerTipoProduto)
    .LookupComboBox(dbTipoProduto, dtsTipoProduto, 'codtipo', 'codigo', 'descricao');
  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'codemp', 'cnpj', 'razao');
  TController(FControllerOrigemProdutoView)
    .LookupComboBox(dbOrigem, dtsOrigem, 'codorigem', 'orp_cod', 'orp_descricao_full');
  TController(FControllerTipoTributacaoNormal)
    .LookupComboBox(dbTipoTributacaoNM, dtsTributacaoNM, 'codtributacao', 'Tpt_cod', 'Tpt_descricao_full');
  TController(FControllerTipoTributacaoSN)
    .LookupComboBox(dbTipoTributacaoSN, dtsTributacaoSN, 'csosn', 'Tpt_cod', 'Tpt_descricao_full');
  TController(FControllerAliquotaPISView)
    .LookupComboBox(dbCSTPIS, dtsAliquotaPIS, 'cst_pis', 'codigo', 'descricao_full');
  TController(FControllerAliquotaCOFINSView)
    .LookupComboBox(dbCSTCOFINS, dtsAliquotaCOFINS, 'cst_cofins', 'codigo', 'descricao_full');

  if (Empresa.GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID) then
  begin
    FControllerTipoVeiculo := TControllerFactory.New.TipoVeiculo;
    FControllerCorVeiculo  := TControllerFactory.New.CorVeiculo;
    FControllerCombustivelVeiculo := TControllerFactory.New.CombustivelVeiculo;

    TController(FControllerTipoVeiculo)
      .LookupComboBox(dbTipoVeiculo, dtsTipoVeiculo, 'tipo_veiculo', 'codigo', 'descricao');
    TController(FControllerCorVeiculo)
      .LookupComboBox(dbCorVeiculo, dtsCorVeiculo, 'cor_veiculo', 'codigo', 'descricao');
    TController(FControllerCombustivelVeiculo)
      .LookupComboBox(dbTipoCombustivel, dtsTipoCombustivel, 'combustivel_veiculo', 'codigo', 'descricao');
  end;
end;

procedure TViewProduto.dbGrupoButtonClick(Sender: TObject);
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

procedure TViewProduto.dbNCM_SHButtonClick(Sender: TObject);
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

procedure TViewProduto.dbProdutoMovEstoqueClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    if Assigned(dbProdutoPorLote.Field) then
      if (dbProdutoMovEstoque.Field.AsInteger = 0) then
        dbProdutoPorLote.Field.AsInteger := 0;
end;

procedure TViewProduto.dbSecaoButtonClick(Sender: TObject);
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

procedure TViewProduto.dbUnidadeButtonClick(Sender: TObject);
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

procedure TViewProduto.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( DtsrCTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, TTipoCFOP.tcfopSaida, iCodigo, sDescricao) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CODCFOP').AsInteger       := iCodigo;
      DtSrcTabela.DataSet.FieldByName('CFOP_DESCRICAO').AsString := sDescricao;
    end;
end;

procedure TViewProduto.OcultarTipoProduto;
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

procedure TViewProduto.FormShow(Sender: TObject);
var
  S : String;
  aSegmento : Integer;
begin
  if (not fOrdenado) then
  begin
    FController.DAO.OrderBy(CampoOrdenacao);
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
  aSegmento := Empresa.GetSegmentoID(gUsuarioLogado.Empresa);

  pnlVeiculo.Visible             := (aSegmento = SEGMENTO_MERCADO_CARRO_ID);
  tbsHistoricoVeiculo.TabVisible := (aSegmento = SEGMENTO_MERCADO_CARRO_ID);
  tbsCustoVeiculo.TabVisible     := (aSegmento = SEGMENTO_MERCADO_CARRO_ID);

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

function TViewProduto.IBPT: IControllerIBPT;
begin
  if not Assigned(FControllerIBPT) then
    FControllerIBPT := TControllerFactory.New.IBPT;

  Result := FControllerIBPT as IControllerIBPT;
end;

procedure TViewProduto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    pgcMaisDados.ActivePageIndex := 0;
end;

function TViewProduto.Empresa: IControllerEmpresa;
begin
  Result := FControllerEmpresaView as IControllerEmpresa;
end;

procedure TViewProduto.FormActivate(Sender: TObject);
begin
  inherited;
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

procedure TViewProduto.dbgDadosDrawColumnCell(Sender: TObject;
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

procedure TViewProduto.dbFabricanteButtonClick(Sender: TObject);
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

procedure TViewProduto.FormKeyDown(Sender: TObject; var Key: Word;
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
        dbGerarSubproduto.SetFocus
      else
      if tbsCustoVeiculo.TabVisible then
      begin
        pgcMaisDados.ActivePage := tbsCustoVeiculo;
        dbValorCompraVeiculo.SetFocus;
      end
      else
      begin
        pgcMaisDados.ActivePage := tbsTributacao;
        dbOrigem.SetFocus;
      end;

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

procedure TViewProduto.chkProdutoComEstoqueClick(Sender: TObject);
begin
  if ( Showing and (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible and edtFiltrar.Enabled) ) then
    edtFiltrar.SetFocus;
end;

procedure TViewProduto.ConfigurarLabels;
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

procedure TViewProduto.ControleCampos;
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

    dbProdutoNovo.Enabled          := (gSistema.Codigo = SISTEMA_GESTAO_COM) and (Empresa.GetSegmentoID(gUsuarioLogado.Empresa) = SEGMENTO_MERCADO_CARRO_ID);
    dbProdutoEhImobilizado.Enabled := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS); //(gSistema.Codigo = SISTEMA_GESTAO_IND);
    dbProdutoMovEstoque.Enabled    := (TAliquota(FieldByName('ALIQUOTA_TIPO').AsInteger) = taICMS);
    dbGerarSubproduto.Enabled      := (gSistema.Codigo = SISTEMA_GESTAO_IND);
  end;
end;

function TViewProduto.Controller: IControllerProduto;
begin
  Result := FController as IControllerProduto;
end;

procedure TViewProduto.btnFiltrarClick(Sender: TObject);
begin
  // inherited;
  AddWhereAdditional;
  FiltarDados(CmbBxFiltrarTipo.ItemIndex);
end;

procedure TViewProduto.DtSrcTabelaDataChange(Sender: TObject;
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

          (TControllerFactory.New.AliquotaICMS as IControllerAliquotaICMS).AliquotaIcms(
              Empresa.GetEmpresaUF(gUsuarioLogado.Empresa) // Estado de Origem
            , Empresa.GetEmpresaUF(gUsuarioLogado.Empresa) // Estado de Destino
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

procedure TViewProduto.FiltarDados(const iTipoPesquisa : Integer);
var
  aExpressionOr : String;
begin
  try
    WaitAMoment(WAIT_AMOMENT_LoadData);
    edtFiltrar.Text := Trim(edtFiltrar.Text).Replace(' ', '%');

    try
      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
        Abort;
      end;

      FController.DAO.DataSet.Close;
      FController.DAO.ClearWhere;

      if (edtFiltrar.Text <> EmptyStr) then
      begin

        Case iTipoPesquisa of
          // Por Código, Descrição
          0:
            if ( StrToIntDef(edtFiltrar.Text, 0) > 0 ) then
              FController.DAO.Where(CampoCodigo +  ' = ' + edtFiltrar.Text)
            else
            begin
              aExpressionOr :=
                   '   (upper(' + CampoDescricao +  ') like ' + QuotedStr(UpperCase(edtFiltrar.Text) + '%') +
                   ' or upper(' + CampoDescricao +  ') like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(edtFiltrar.Text)) + '%') +
                   ' or upper(p.metafonema) like ' + QuotedStr(Metafonema(edtFiltrar.Text) + '%') +
                   ' or upper(p.nome_amigo) like ' + QuotedStr(UpperCase(edtFiltrar.Text) + '%') +
                   ' or upper(p.nome_amigo) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(edtFiltrar.Text)) + '%') + ')';

              FController.DAO.Where(aExpressionOr);
            end;

          // Por Referência
          1:
            FController.DAO.Where('p.Referencia = ' + QuotedStr(edtFiltrar.Text));

          // Por Fabricante
          2:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              FController.DAO.Where('p.Codfabricante = ' + edtFiltrar.Text)
            else
              FController.DAO.Where('upper(f.Nome) like ' + QuotedStr(UpperCase(edtFiltrar.Text) + '%'));

          // Por Grupo
          3:
            if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
              FController.DAO.Where('p.Codgrupo = ' + edtFiltrar.Text)
            else
              FController.DAO.Where('upper(g.Descri) like ' + QuotedStr(UpperCase(edtFiltrar.Text) + '%'));
        end;

      end;

      if (not WhereAdditional.IsEmpty) then
        FController.DAO.Where('(' + WhereAdditional + ')');

      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      if (not CampoOrdenacao.IsEmpty) then
        FController.DAO.OrderBy(CampoOrdenacao);

      FController.DAO.Open;
      Tabela.Configurar;

      try
        if Showing and (pgcGuias.ActivePage = tbsTabela) then
          if (not DtSrcTabela.DataSet.IsEmpty) then
            dbgDados.SetFocus
          else
          begin
            ShowWarning('Não existem registros na tabela de acordo com os dados pesquisados');

            edtFiltrar.SetFocus;
            edtFiltrar.SelectAll;
          end;
      except
        WaitAMomentFree;
      end;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13 + E.Message + #13 +
          'Script:' + #13#13 + FController.DAO.SelectSQL);
      end;
    end;

  finally
    WaitAMomentFree;
  end;
end;

procedure TViewProduto.dbUnidadeFracaoButtonClick(Sender: TObject);
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

procedure TViewProduto.btbtnSalvarClick(Sender: TObject);
var
  aCentroCusto : IControllerCentroCusto;
begin
  // Validações de Dados

  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
    begin
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

      if ( DtSrcTabela.DataSet.State = dsInsert ) then
        if ( Trim(FieldByName('COD').AsString) = EmptyStr ) then
          FieldByName('COD').Value := FormatFloat(DisplayFormatCodigo, FieldByName('CODIGO').AsInteger);

      if ( FieldByName('COMPOR_FATURAMENTO').IsNull ) then
        FieldByName('COMPOR_FATURAMENTO').AsInteger := StrToInt(IfThen( Empresa.GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID], '0', '1'));

      if (FieldByName('TABELA_IBPT').AsInteger = 0) then
        FieldByName('TABELA_IBPT').Clear;

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

      // Gerar Centro de Custo Geral para armazanamento dos Lotes do produto quando
      // o sistema for de Gestão Comercial.
      if (FieldByName('ESTOQUE_APROP_LOTE').AsInteger = 1) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) then
      begin
        aCentroCusto := TControllerFactory.New.CentroCusto as IControllerCentroCusto;
        aCentroCusto.SetCentroCustoGeral(FieldByName('CODEMP').AsString);
        if (FieldByName('CODEMP').AsString <> gUsuarioLogado.Empresa) then
          aCentroCusto.SetCentroCustoGeral(gUsuarioLogado.Empresa);
      end;
    end;

    FieldByName('FRACIONADOR').Required           := (FieldByName('VENDA_FRACIONADA').AsInteger = 1);
    FieldByName('CODUNIDADE_FRACIONADA').Required := (FieldByName('VENDA_FRACIONADA').AsInteger = 1);
    FieldByName('ANVISA').Required := dbCodigoAnvisa.Visible;
  end;

  inherited;
end;

procedure TViewProduto.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  ControleCampos;
  ConfigurarLabels;
end;

procedure TViewProduto.ppMnAtualizarMetafonemaClick(Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  Screen.Cursor := crSQLWait;
  DtSrcTabela.DataSet.First;
  DtSrcTabela.DataSet.DisableControls;
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Atualizando código metafônico ...');

  try
    while not DtSrcTabela.DataSet.Eof do
    begin
      Controller.AtualizarMetafonema(
          DtSrcTabela.DataSet.FieldByName('DESCRI').AsString
        , DtSrcTabela.DataSet.FieldByName('APRESENTACAO').AsString
        , DtSrcTabela.DataSet.FieldByName('COD').AsString);
      DtSrcTabela.DataSet.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    DtSrcTabela.DataSet.First;
    DtSrcTabela.DataSet.EnableControls;
    WaitAMomentFree;

    FController.DAO.RefreshRecord;

    ShowInformation('Atualização', 'Código metafônico dos registros atualizados com sucesso!');
  end;
end;

procedure TViewProduto.ppMnAtualizarNomeAmigoClick(Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  Screen.Cursor := crSQLWait;
  DtSrcTabela.DataSet.First;
  DtSrcTabela.DataSet.DisableControls;
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Atualizando nome amigo ...');

  try
    while not DtSrcTabela.DataSet.Eof do
    begin
      if ( Trim(DtSrcTabela.DataSet.FieldByName('NOME_AMIGO').AsString) = EmptyStr ) then
        Controller.AtualizarNomeAmigo(
            DtSrcTabela.DataSet.FieldByName('DESCRI').AsString
          , DtSrcTabela.DataSet.FieldByName('APRESENTACAO').AsString
          , DtSrcTabela.DataSet.FieldByName('COD').AsString);

      DtSrcTabela.DataSet.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    DtSrcTabela.DataSet.First;
    DtSrcTabela.DataSet.EnableControls;
    WaitAMomentFree;

    FController.DAO.RefreshRecord;

    ShowInformation('Atualização', 'Nome Amigo dos registros atualizados com sucesso!');
  end;
end;

procedure TViewProduto.ppMnAtualizarTabelaIBPTClick(Sender: TObject);
var
  iCodigoNCM : Integer;
  sCodigoNCM : String;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  Screen.Cursor := crSQLWait;
  DtSrcTabela.DataSet.First;
  DtSrcTabela.DataSet.DisableControls;
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Atualizando tabela IBPT ...');

  try
    while not DtSrcTabela.DataSet.Eof do
    begin
      sCodigoNCM := IfThen(StrToInt64Def(Trim(DtSrcTabela.DataSet.FieldByName('NCM_SH').AsString), 0) = 0, TRIBUTO_NCM_SH_PADRAO, DtSrcTabela.DataSet.FieldByName('NCM_SH').AsString);
      sCodigoNCM := IfThen(sCodigoNCM = '10203000', TRIBUTO_NCM_SH_PADRAO, sCodigoNCM); // Código descontinuado a partir de 10203000
      iCodigoNCM := IBPT.GetTabelaIBPTCodigo(sCodigoNCM);

      Controller.AtualizarTabelaIBPT(
          sCodigoNCM
        , iCodigoNCM.ToString
        , DtSrcTabela.DataSet.FieldByName('COD').AsString);

      DtSrcTabela.DataSet.Next;
    end;
  finally
    Screen.Cursor := crDefault;
    DtSrcTabela.DataSet.First;
    DtSrcTabela.DataSet.EnableControls;
    WaitAMomentFree;

    FController.DAO.RefreshRecord;

    ShowInformation('Atualização', 'Código da Tabela IBPT dos registros atualizados com sucesso!');
  end;
end;

procedure TViewProduto.AddWhereAdditional;
var
  sWhr : String;
begin
  sWhr := PRD_ARQUIVO_MORTO;

  if not Empresa.GetEstoqueUnificado(gUsuarioLogado.Empresa) then
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

procedure TViewProduto.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('CODEMP').AsString) = EmptyStr then
        if ( not FControllerEmpresaView.DAO.DataSet.IsEmpty ) then
          FieldByName('CODEMP').AsString := FControllerEmpresaView.DAO.DataSet.FieldByName('cnpj').AsString;

      if ( not FControllerOrigemProdutoView.DAO.DataSet.IsEmpty ) then
        FieldByName('CODORIGEM').AsString := TRIBUTO_ORIGEM_NACIONAL;

      if ( Empresa.GetRegime(FieldByName('CODEMP').AsString) = trSimplesNacional ) then
      begin
        if ( not FControllerTipoTributacaoNormal.DAO.DataSet.IsEmpty ) then
          FieldByName('CODTRIBUTACAO').AsString := TRIBUTO_TRIBUTADA_ISENTA;
        if ( not FControllerTipoTributacaoSN.DAO.DataSet.IsEmpty ) then
          FieldByName('CSOSN').AsString := TRIBUTO_NAO_TRIBUTADA_SN;
      end
      else
      begin
        if ( not FControllerTipoTributacaoNormal.DAO.DataSet.IsEmpty ) then
          FieldByName('CODTRIBUTACAO').AsString := TRIBUTO_TRIBUTADA_INTEG;
        if ( not FControllerTipoTributacaoSN.DAO.DataSet.IsEmpty ) then
          FieldByName('CSOSN').AsString := TRIBUTO_NAO_TRIBUTADA_SN;
      end;

      FieldByName('CODCFOP').AsInteger       := GetCfopIDDefault;
      FieldByName('CFOP_DESCRICAO').AsString := GetCfopNomeDefault;
      FieldByName('ALIQUOTA_TIPO').AsInteger := Ord(fAliquota);
      FieldByName('TABELA_IBPT').AsInteger   := IBPT.GetTabelaIBPTCodigo(TRIBUTO_NCM_SH_PADRAO);
      FieldByName('COMPOR_FATURAMENTO').AsInteger := StrToInt(IfThen(Empresa.GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID], '0', '1'));
      FieldByName('ESTOQUE_APROP_LOTE').AsInteger := IfThen(gSistema.Codigo = SISTEMA_GESTAO_OPME, FLAG_SIM, FLAG_NAO);

      ControleCampos;
      DtSrcTabelaDataChange(DtSrcTabela, DtSrcTabela.DataSet.FieldByName('ALIQUOTA_TIPO'));
    end;
end;

procedure TViewProduto.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TViewProduto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TViewProduto.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    ControleCampos;
end;

procedure TViewProduto.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

end.
