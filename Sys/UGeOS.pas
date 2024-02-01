unit UGeOS;

interface

uses
  UConstantesDGE,
  UGrPadrao,
  View.Memo,
  UGrPadraoCadastro,
  View.Produto,

  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, JvExMask, JvToolEdit, System.ImageList,
  JvDBControls, IBQuery, IBStoredProc, Menus, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxButtons, Datasnap.DBClient, Datasnap.Provider,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, cxImageList, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinsDefaultPainters;

type
  TfrmGeOS = class(TfrmGrPadraoCadastro)
    lblOSAberta: TLabel;
    lblOSCancelada: TLabel;
    lblData: TLabel;
    lblOSAtrasada: TLabel;
    RdgStatusOS: TRadioGroup;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    lblCliente: TLabel;
    dtsEmpresa: TDataSource;
    lblSerieNFSe: TLabel;
    dbSerieNFSe: TDBEdit;
    dbNumeroNFSe: TDBEdit;
    lblNumeroNFSe: TLabel;
    dbDataEmissaoNFSe: TDBEdit;
    lblDataEmissaoNFSe: TLabel;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCONTROLE: TIntegerField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaCLIENTE: TIntegerField;
    IbDtstTabelaDATA_EMISSAO: TDateField;
    IbDtstTabelaDATA_PREVISAO_CONCLUSAO: TDateField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaVENDEDOR: TIntegerField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaOBSERVACOES: TMemoField;
    IbDtstTabelaRELATO_SOLICITACAO: TMemoField;
    IbDtstTabelaDADOS_ENTREGA: TMemoField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaTOTAL_SERVICO: TIBBCDField;
    IbDtstTabelaTOTAL_PRODUTO: TIBBCDField;
    IbDtstTabelaTOTAL_DESCONTOS_SERVICOS: TIBBCDField;
    IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS: TIBBCDField;
    IbDtstTabelaTOTAL_OS: TIBBCDField;
    IbDtstTabelaTOTAL_BRUTO: TIBBCDField;
    IbDtstTabelaTOTAL_LIQUIDO: TIBBCDField;
    IbDtstTabelaDATA_APROVACAO: TDateField;
    IbDtstTabelaDATA_FINALIZACAO: TDateField;
    IbDtstTabelaDATA_FATURA: TDateField;
    IbDtstTabelaNFS_SERIE: TIBStringField;
    IbDtstTabelaNFS_NUMERO: TIntegerField;
    IbDtstTabelaNFS_DATAEMISSAO: TDateField;
    IbDtstTabelaNFS_HORAEMISSAO: TTimeField;
    IbDtstTabelaNFS_CNAE: TIBStringField;
    IbDtstTabelaNFS_NCM: TIBStringField;
    IbDtstTabelaNFS_DESCRICAO_SERVICO: TMemoField;
    IbDtstTabelaNOME: TIBStringField;
    IbDtstTabelaNOMEFANT: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    lblCnae: TLabel;
    dtsVendedorTecnico: TDataSource;
    lblTecnicoPrincipal: TLabel;
    dbTecnicoPrincipal: TDBLookupComboBox;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblNCM: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TJvDBDateEdit;
    Label1: TLabel;
    dbDataPrevisao: TJvDBDateEdit;
    lblStatus: TLabel;
    dbStatus: TDBEdit;
    pgcServicoDetalhe: TPageControl;
    TbsServicoARealizar: TTabSheet;
    TbsEquipamento: TTabSheet;
    Bevel5: TBevel;
    pgcServicoFinalizar: TPageControl;
    TbsRecebimento: TTabSheet;
    TbsTitulo: TTabSheet;
    TbsEvento: TTabSheet;
    TbsLocalRealizacao: TTabSheet;
    TbsNFSe: TTabSheet;
    pnlRelatoSolicitacao: TPanel;
    lblRelatoSolicitacao: TLabel;
    Bevel15: TBevel;
    dbRelatoSolicitacao: TDBMemo;
    Bevel6: TBevel;
    pgcServicoProduto: TPageControl;
    TbsServico: TTabSheet;
    TbsProduto: TTabSheet;
    pnlObservacao: TPanel;
    lblObservacao: TLabel;
    Bevel7: TBevel;
    Bevel9: TBevel;
    dbObservacao: TDBMemo;
    IbDtstTabelaTOTAL_DESCONTOS: TIBBCDField;
    pnlFormaPagto: TPanel;
    lblFormaPagto: TLabel;
    lblCondicaoPagto: TLabel;
    Label2: TLabel;
    dbgFormaPagto: TDBGrid;
    pnlValoresTotais: TPanel;
    lblValorTotalServico: TLabel;
    lblValorTotalProduto: TLabel;
    lblValorTotalBruto: TLabel;
    lblValorTotalDescontos: TLabel;
    lblValorTotalLiquido: TLabel;
    btnValorTotalAtualizar: TSpeedButton;
    dbValorTotalServico: TDBEdit;
    dbValorTotalProduto: TDBEdit;
    dbValorTotalBruto: TDBEdit;
    dbValorTotalDescontos: TDBEdit;
    dbValorTotalLiquido: TDBEdit;
    GrpBxDadosEquipamento: TGroupBox;
    lblEquipamentoMarca: TLabel;
    Bevel10: TBevel;
    dbEquipamentoMarca: TDBEdit;
    pnlBotoesEquipamento: TPanel;
    BtnEquipamentoInserir: TBitBtn;
    BtnEquipamentoEditar: TBitBtn;
    BtnEquipamentoExcluir: TBitBtn;
    BtnEquipamentoSalvar: TBitBtn;
    cdsOSEquipamentos: TIBDataSet;
    updOSEquipamentos: TIBUpdateSQL;
    dtsOSEquipamentos: TDataSource;
    cdsOSEquipamentosANO: TSmallintField;
    cdsOSEquipamentosCONTROLE: TIntegerField;
    cdsOSEquipamentosEQUIPAMENTO: TIntegerField;
    cdsOSEquipamentosUSUARIO: TIBStringField;
    cdsOSEquipamentosTECNICO: TIntegerField;
    cdsOSEquipamentosOBSERVACAO: TMemoField;
    cdsOSEquipamentosDEVOLVIDO: TSmallintField;
    cdsOSEquipamentosDESCRICAO: TIBStringField;
    cdsOSEquipamentosMARCA: TIBStringField;
    cdsOSEquipamentosMODELO: TIBStringField;
    cdsOSEquipamentosREFERENCIA: TIBStringField;
    cdsOSEquipamentosSERIAL: TIBStringField;
    cdsOSEquipamentosTIPO: TIBStringField;
    lblEquipamentoModelo: TLabel;
    dbEquipamentoModelo: TDBEdit;
    lblEquimanetoDescricao: TLabel;
    lblEquipamentoTipo: TLabel;
    dbEquipamentoTipo: TDBEdit;
    lblEquipamentoReferencia: TLabel;
    dbEquipamentoReferencia: TDBEdit;
    dbEquipamentoSerial: TDBEdit;
    lblEquipamentoSerial: TLabel;
    lblEquipamentoObservacao: TLabel;
    dbEquipamentoObservacao: TDBMemo;
    Bevel11: TBevel;
    dbgEquipamentos: TDBGrid;
    pnlEquipamentoEntrega: TPanel;
    GrpBxEquipamentoEntrega: TGroupBox;
    lblEquipamentoDataEntrega: TLabel;
    dbEquipamentoDataEntrega: TJvDBDateEdit;
    lblEquipamentoHoraEntrega: TLabel;
    dbEquipamentoHoraEntrega: TDBEdit;
    lblEquipamentoTecnicoEntrega: TLabel;
    dbEquipamentoTecnicoEntrega: TDBLookupComboBox;
    lblEquipamentoEstadoEntrega: TLabel;
    dbEquipamentoEstadoEntrega: TDBMemo;
    dbDadosEntrega: TDBMemo;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    cdsOSFormaPagto: TIBDataSet;
    updOSFormaPagto: TIBUpdateSQL;
    dtsOSFormaPagto: TDataSource;
    cdsOSFormaPagtoANO: TSmallintField;
    cdsOSFormaPagtoCONTROLE: TIntegerField;
    cdsOSFormaPagtoFORMAPAGTO: TSmallintField;
    cdsOSFormaPagtoCONDICAOPAGTO: TSmallintField;
    cdsOSFormaPagtoPAGTO_PRAZO: TSmallintField;
    cdsOSFormaPagtoVALOR_FPAGTO: TIBBCDField;
    cdsOSFormaPagtoVALOR_RECEBIDO: TIBBCDField;
    cdsOSFormaPagtoPRAZO_01: TSmallintField;
    cdsOSFormaPagtoPRAZO_02: TSmallintField;
    cdsOSFormaPagtoPRAZO_03: TSmallintField;
    cdsOSFormaPagtoPRAZO_04: TSmallintField;
    cdsOSFormaPagtoPRAZO_05: TSmallintField;
    cdsOSFormaPagtoPRAZO_06: TSmallintField;
    cdsOSFormaPagtoPRAZO_07: TSmallintField;
    cdsOSFormaPagtoPRAZO_08: TSmallintField;
    cdsOSFormaPagtoPRAZO_09: TSmallintField;
    cdsOSFormaPagtoPRAZO_10: TSmallintField;
    cdsOSFormaPagtoPRAZO_11: TSmallintField;
    cdsOSFormaPagtoPRAZO_12: TSmallintField;
    IbDtstTabelaNFS_LOTE: TIBStringField;
    cdsOSServicos: TIBDataSet;
    updOSServicos: TIBUpdateSQL;
    dtsOSServicos: TDataSource;
    cdsOSServicosANO: TSmallintField;
    cdsOSServicosCONTROLE: TIntegerField;
    cdsOSServicosSEQ: TSmallintField;
    cdsOSServicosEMPRESA: TIBStringField;
    cdsOSServicosCLIENTE: TIntegerField;
    cdsOSServicosSERVICO: TIBStringField;
    cdsOSServicosQTDE: TIBBCDField;
    cdsOSServicosUNIDADE: TSmallintField;
    cdsOSServicosPUNIT: TIBBCDField;
    cdsOSServicosPUNIT_PROMOCAO: TIBBCDField;
    cdsOSServicosDESCONTO: TIBBCDField;
    cdsOSServicosDESCONTO_VALOR: TIBBCDField;
    cdsOSServicosPFINAL: TIBBCDField;
    cdsOSServicosTOTAL_BRUTO: TIBBCDField;
    cdsOSServicosTOTAL_DESCONTO: TIBBCDField;
    cdsOSServicosTOTAL_LIQUIDO: TIBBCDField;
    cdsOSServicosAPROVADO: TSmallintField;
    cdsOSServicosDESCRI: TIBStringField;
    cdsOSServicosAPRESENTACAO: TIBStringField;
    cdsOSServicosDESCRI_APRESENTACAO: TIBStringField;
    cdsOSServicosUNP_DESCRICAO: TIBStringField;
    cdsOSServicosUNP_SIGLA: TIBStringField;
    cdsOSServicosALIQUOTA: TIBBCDField;
    GrpBxDadosServico: TGroupBox;
    lblServico: TLabel;
    lblServicoQuantidade: TLabel;
    lblServicoValorUnit: TLabel;
    lblServicoDesconto: TLabel;
    lblServicoTotalLiquido: TLabel;
    lblServicoAliquota: TLabel;
    Bevel12: TBevel;
    lblServicoTotalDesconto: TLabel;
    dbServicoNome: TDBEdit;
    dbServicoQuantidade: TDBEdit;
    dbServicoValorUnit: TDBEdit;
    dbServicoDesconto: TDBEdit;
    dbServicoTotalLiquido: TDBEdit;
    dbServicoAliquota: TDBEdit;
    pnlBotoesServico: TPanel;
    BtnServicoInserir: TBitBtn;
    BtnServicoEditar: TBitBtn;
    BtnServicoExcluir: TBitBtn;
    BtnServicoSalvar: TBitBtn;
    Bevel13: TBevel;
    dbgServicos: TDBGrid;
    dbServicoAprovado: TDBCheckBox;
    lblServicoValorFinal: TLabel;
    dbServicoValorFinal: TDBEdit;
    lblServicoUnidade: TLabel;
    dbServicoUnidade: TDBEdit;
    cdsOSProdutos: TIBDataSet;
    updOSProdutos: TIBUpdateSQL;
    dtsOSProdutos: TDataSource;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblProdutoQuantidade: TLabel;
    lblProdutoValorUnit: TLabel;
    lblProdutoDesconto: TLabel;
    lblProdutoTotalLiquido: TLabel;
    lblProdutoAliquota: TLabel;
    Bevel14: TBevel;
    lblProdutoTotalDesconto: TLabel;
    lblProdutoValorFinal: TLabel;
    lblProdutoUnidade: TLabel;
    dbProdutoNome: TDBEdit;
    dbProdutoQuantidade: TDBEdit;
    dbProdutoValorUnit: TDBEdit;
    dbProdutoDesconto: TDBEdit;
    dbProdutoTotalLiquido: TDBEdit;
    dbProdutoAliquota: TDBEdit;
    pnlBotoesProduto: TPanel;
    BtnProdutoInserir: TBitBtn;
    BtnProdutoEditar: TBitBtn;
    BtnProdutoExcluir: TBitBtn;
    BtnProdutoSalvar: TBitBtn;
    dbProdutoAprovado: TDBCheckBox;
    dbProdutoValorFinal: TDBEdit;
    dbProdutoUnidade: TDBEdit;
    Bevel16: TBevel;
    cdsOSProdutosANO: TSmallintField;
    cdsOSProdutosCONTROLE: TIntegerField;
    cdsOSProdutosSEQ: TSmallintField;
    cdsOSProdutosEMPRESA: TIBStringField;
    cdsOSProdutosCLIENTE: TIntegerField;
    cdsOSProdutosPRODUTO: TIBStringField;
    cdsOSProdutosQTDE: TIBBCDField;
    cdsOSProdutosUNIDADE: TSmallintField;
    cdsOSProdutosPUNIT: TIBBCDField;
    cdsOSProdutosPUNIT_PROMOCAO: TIBBCDField;
    cdsOSProdutosDESCONTO: TIBBCDField;
    cdsOSProdutosDESCONTO_VALOR: TIBBCDField;
    cdsOSProdutosPFINAL: TIBBCDField;
    cdsOSProdutosTOTAL_BRUTO: TIBBCDField;
    cdsOSProdutosTOTAL_DESCONTO: TIBBCDField;
    cdsOSProdutosTOTAL_LIQUIDO: TIBBCDField;
    cdsOSProdutosAPROVADO: TSmallintField;
    cdsOSProdutosDESCRI: TIBStringField;
    cdsOSProdutosAPRESENTACAO: TIBStringField;
    cdsOSProdutosDESCRI_APRESENTACAO: TIBStringField;
    cdsOSProdutosUNP_DESCRICAO: TIBStringField;
    cdsOSProdutosUNP_SIGLA: TIBStringField;
    cdsOSProdutosALIQUOTA: TIBBCDField;
    dbgProdutos: TDBGrid;
    TbsTecnico: TTabSheet;
    GrpBxDadosTecnico: TGroupBox;
    lblTecnico: TLabel;
    lblTecnicoTipoComissao: TLabel;
    Bevel17: TBevel;
    pnlBotoesTecnico: TPanel;
    BtnTecnicoInserir: TBitBtn;
    BtnTecnicoEditar: TBitBtn;
    BtnTecnicoExcluir: TBitBtn;
    BtnTecnicoSalvar: TBitBtn;
    Bevel18: TBevel;
    cdsOSTecnicos: TIBDataSet;
    updOSTecnicos: TIBUpdateSQL;
    dtsOSTecnicos: TDataSource;
    cdsOSTecnicosANO: TSmallintField;
    cdsOSTecnicosCONTROLE: TIntegerField;
    cdsOSTecnicosTECNICO: TIntegerField;
    cdsOSTecnicosUSUARIO: TIBStringField;
    cdsOSTecnicosDATA_CADASTRO: TDateField;
    cdsOSTecnicosCOMISSAO_TIPO_LANC: TSmallintField;
    cdsOSTecnicosCOMISSAO_PERCENTUAL: TIBBCDField;
    cdsOSTecnicosCOMISSAO_VALOR: TIBBCDField;
    cdsOSTecnicosNOME: TIBStringField;
    dbTecnico: TDBLookupComboBox;
    dbTecnicoTipoComissao: TDBLookupComboBox;
    lblTecnicoPercentualComissao: TLabel;
    dbTecnicoPercentualComissao: TDBEdit;
    dtsTipoComissao: TDataSource;
    lblTecnicoValorComissao: TLabel;
    dbTecnicoValorComissao: TDBEdit;
    dbgTecnicos: TDBGrid;
    Bevel19: TBevel;
    pnlBotoesTitulo: TPanel;
    btnRegerarTitulo: TBitBtn;
    btnGerarBoleto: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    btnTituloQuitar: TBitBtn;
    Bevel20: TBevel;
    qryTitulos: TIBDataSet;
    qryTitulosANOLANC: TSmallintField;
    qryTitulosNUMLANC: TIntegerField;
    qryTitulosPARCELA: TSmallintField;
    qryTitulosCODBANCO: TIntegerField;
    qryTitulosNOSSONUMERO: TIBStringField;
    qryTitulosCNPJ: TIBStringField;
    qryTitulosTIPPAG: TIBStringField;
    qryTitulosDTEMISS: TDateField;
    qryTitulosDTVENC: TDateField;
    qryTitulosVALORREC: TIBBCDField;
    qryTitulosPERCENTJUROS: TIBBCDField;
    qryTitulosPERCENTMULTA: TIBBCDField;
    qryTitulosPERCENTDESCONTO: TIBBCDField;
    qryTitulosVALORRECTOT: TIBBCDField;
    qryTitulosVALORSALDO: TIBBCDField;
    qryTitulosDATAPROCESSOBOLETO: TDateField;
    qryTitulosBAIXADO: TSmallintField;
    qryTitulosBAIXADO_: TIBStringField;
    qryTitulosDTREC: TDateField;
    qryTitulosFORMA_PAGTO: TSmallintField;
    qryTitulosLancamento: TStringField;
    qryTitulosSTATUS: TIBStringField;
    dtsTitulos: TDataSource;
    dbgTitulos: TDBGrid;
    Bevel21: TBevel;
    ppControleOS: TPopupMenu;
    mnFinalizarEdicao: TMenuItem;
    mnIniciarAvaliacao: TMenuItem;
    mnLancarParecer: TMenuItem;
    N1: TMenuItem;
    mnAprovarOS: TMenuItem;
    mnLancarAtendimento: TMenuItem;
    mnFinalizarOS: TMenuItem;
    N2: TMenuItem;
    mnFaturarOS: TMenuItem;
    cdsOSEventos: TIBDataSet;
    updOSEventos: TIBUpdateSQL;
    dtsOSEventos: TDataSource;
    cdsOSEventosANO: TSmallintField;
    cdsOSEventosCONTROLE: TIntegerField;
    cdsOSEventosSEQUENCIAL: TSmallintField;
    cdsOSEventosDATA_CADASTRO: TDateField;
    cdsOSEventosDATA_EVENTO: TDateField;
    cdsOSEventosUSUARIO: TIBStringField;
    cdsOSEventosTECNICO: TIntegerField;
    cdsOSEventosDESCRICAO: TIBStringField;
    cdsOSEventosEVENTO: TMemoField;
    cdsOSEventosIMPRIMIR: TSmallintField;
    cdsOSEventosTECNICO_NOME: TIBStringField;
    GrpBxDadosEvento: TGroupBox;
    lblEventoUsuario: TLabel;
    Bevel23: TBevel;
    lblEventoCadastro: TLabel;
    lblEventoHistorico: TLabel;
    dbEventoUsuario: TDBEdit;
    pnlBotoesEvento: TPanel;
    BtnEventoInserir: TBitBtn;
    BtnEventoEditar: TBitBtn;
    BtnEventoCancelar: TBitBtn;
    BtnEventoSalvar: TBitBtn;
    dbEventoCadastro: TDBEdit;
    dbEventoHistorico: TDBMemo;
    lblEventoData: TLabel;
    dbEventoData: TJvDBDateEdit;
    lblEventoTecnico: TLabel;
    dbEventoTecnico: TDBLookupComboBox;
    lblEventoDescricao: TLabel;
    dbEventoDescricao: TDBEdit;
    dbEventoImprimir: TDBCheckBox;
    Bevel24: TBevel;
    dbgEventos: TDBGrid;
    IbDtstTabelaNFS_ENVIADA: TSmallintField;
    ppImprimir: TPopupMenu;
    nmImprimirOrcamento: TMenuItem;
    nmGerarImprimirBoletos: TMenuItem;
    nmImprimirOS: TMenuItem;
    cdsOSEquipamentosDATA_ENTREGA: TDateField;
    cdsOSEquipamentosHORA_ENTREGA: TTimeField;
    cdsOSEquipamentosESTADO_ENTREGA: TMemoField;
    BtnEquipamentoDevolver: TBitBtn;
    IbDtstTabelaBLOQUEADO: TSmallintField;
    IbDtstTabelaBLOQUEADO_MOTIVO: TMemoField;
    cdsOSFormaPagtoFormaPagtoDescricao: TStringField;
    cdsOSFormaPagtoCondicaoPagtoDescricao: TStringField;
    pnlLegendas: TPanel;
    Label3: TLabel;
    bvlLegendas: TBevel;
    shpOSEmEdicao: TShape;
    lblStatusOSEdicao: TLabel;
    shpOSAberta: TShape;
    lblStatusOSAberta: TLabel;
    shpOSAvaliacao: TShape;
    lblStatusOSAvaliacao: TLabel;
    shpOSParecer: TShape;
    lblStatusOSParecer: TLabel;
    IbDtstTabelaLegenda: TSmallintField;
    shpOSAprovada: TShape;
    lblStatusOSAprovada: TLabel;
    shpOSAtendimento: TShape;
    lblStatusOSAtendimento: TLabel;
    shpOSFinalizada: TShape;
    lblStatusOSFinalizada: TLabel;
    shpOSFaturada: TShape;
    lblStatusOSFaturada: TLabel;
    shpOSNFSeEmitida: TShape;
    lblStatusOSNFS: TLabel;
    shpOSCancelada: TShape;
    lblStatusOSCancelada: TLabel;
    IbDtstTabelaDATA_CADASTRO: TDateTimeField;
    BtnTecnicoAtualizarComissao: TBitBtn;
    BtnProdutoAprovar: TBitBtn;
    BtnServicoAprovar: TBitBtn;
    IbDtstTabelaTOTAL_APROVADO_SERVICO: TIBBCDField;
    IbDtstTabelaTOTAL_APROVADO_PRODUTO: TIBBCDField;
    btnFecharLegenda: TSpeedButton;
    ppCorrigirDadosGerais: TPopupMenu;
    mnpCorrigirEnderecoEntrega: TMenuItem;
    lblValorTotalLiquidoOS: TLabel;
    dbValorTotalLiquidoOS: TDBEdit;
    dtsTotalTitulosAbertos: TDataSource;
    N3: TMenuItem;
    dbCnae: TJvDBComboEdit;
    dbNCM: TJvDBComboEdit;
    dbServico: TJvDBComboEdit;
    dbServicoTotalDesconto: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbProdutoTotalDesconto: TJvDBComboEdit;
    dbCliente: TJvDBComboEdit;
    dbEquimanetoDescricao: TJvDBComboEdit;
    btnConsultarServico: TcxButton;
    btbtnControleOS: TcxButton;
    btbtnGerarNFSe: TcxButton;
    btbtnCancelarOS: TcxButton;
    Bevel22: TBevel;
    fdQryServicoProduto: TFDQuery;
    fdQryTotalTitulosAbertos: TFDQuery;
    fdQryTotalTitulosAbertosVALOR_LIMITE: TBCDField;
    fdQryTotalTitulosAbertosVALOR_COMPRAS_ABERTAS: TBCDField;
    fdQryTotalTitulosAbertosVALOR_LIMITE_DISPONIVEL: TBCDField;
    imgOS: TcxImageList;
    IbDtstTabelaTOTAL_CUSTO: TIBBCDField;
    cdsOSServicosCUSTO: TIBBCDField;
    cdsOSServicosTOTAL_CUSTO: TIBBCDField;
    cdsOSProdutosCUSTO: TIBBCDField;
    cdsOSProdutosTOTAL_CUSTO: TIBBCDField;
    fdQryEmpresa: TFDQuery;
    fdQryVendedorTecnico: TFDQuery;
    fdQryTipoComissao: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    dtpFormaPagto: TDataSetProvider;
    cdsFormaPagto: TClientDataSet;
    fdQryCondicaoPagto: TFDQuery;
    dtpCondicaoPagto: TDataSetProvider;
    cdsCondicaoPagto: TClientDataSet;
    IbDtstTabelaPAGTO_PRAZO: TSmallintField;
    fdStpGerarTitulos: TFDStoredProc;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    procedure FiltrarTecnicosChange(Sender: TObject);
    procedure OpcoesImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure cdsOSEquipamentosEQUIPAMENTOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsOSEquipamentosDEVOLVIDOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsOSEquipamentosAfterScroll(DataSet: TDataSet);
    procedure ControlEditExit(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbServicoTotalDescontoButtonClick(Sender: TObject);
    procedure dbProdutoTotalDescontoButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure qryTitulosCalcFields(DataSet: TDataSet);
    procedure btnConsultarServicoClick(Sender: TObject);
    procedure btbtnControleOSClick(Sender: TObject);
    procedure cdsOSFormaPagtoNewRecord(DataSet: TDataSet);
    procedure cdsOSEquipamentosNewRecord(DataSet: TDataSet);
    procedure cdsOSServicosNewRecord(DataSet: TDataSet);
    procedure cdsOSProdutosNewRecord(DataSet: TDataSet);
    procedure cdsOSTecnicosNewRecord(DataSet: TDataSet);
    procedure cdsOSEventosNewRecord(DataSet: TDataSet);
    procedure dbgTitulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFormaPagtoEnter(Sender: TObject);
    procedure dbgFormaPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnListaClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dtsOSEquipamentosStateChange(Sender: TObject);
    procedure dtsOSServicosStateChange(Sender: TObject);
    procedure dtsOSProdutosStateChange(Sender: TObject);
    procedure dtsOSTecnicosStateChange(Sender: TObject);
    procedure dtsOSEventosStateChange(Sender: TObject);
    procedure BtnEquipamentoInserirClick(Sender: TObject);
    procedure BtnEquipamentoEditarClick(Sender: TObject);
    procedure BtnEquipamentoExcluirClick(Sender: TObject);
    procedure BtnEquipamentoSalvarClick(Sender: TObject);
    procedure BtnEquipamentoDevolverClick(Sender: TObject);
    procedure dbEquimanetoDescricaoButtonClick(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BtnServicoInserirClick(Sender: TObject);
    procedure BtnServicoEditarClick(Sender: TObject);
    procedure BtnServicoExcluirClick(Sender: TObject);
    procedure BtnServicoSalvarClick(Sender: TObject);
    procedure dbServicoButtonClick(Sender: TObject);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BtnProdutoInserirClick(Sender: TObject);
    procedure BtnProdutoEditarClick(Sender: TObject);
    procedure BtnProdutoExcluirClick(Sender: TObject);
    procedure BtnProdutoSalvarClick(Sender: TObject);
    procedure BtnTecnicoInserirClick(Sender: TObject);
    procedure BtnTecnicoEditarClick(Sender: TObject);
    procedure BtnTecnicoExcluirClick(Sender: TObject);
    procedure BtnTecnicoSalvarClick(Sender: TObject);
    procedure dtsOSTecnicosDataChange(Sender: TObject; Field: TField);
    procedure BtnTecnicoAtualizarComissaoClick(Sender: TObject);
    procedure mnFinalizarEdicaoClick(Sender: TObject);
    procedure dbgEventosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnEventoInserirClick(Sender: TObject);
    procedure BtnEventoEditarClick(Sender: TObject);
    procedure BtnEventoCancelarClick(Sender: TObject);
    procedure BtnEventoSalvarClick(Sender: TObject);
    procedure mnIniciarAvaliacaoClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mnLancarParecerClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure mnAprovarOSClick(Sender: TObject);
    procedure BtnServicoAprovarClick(Sender: TObject);
    procedure BtnProdutoAprovarClick(Sender: TObject);
    procedure dbgDadosTitleClick(Column: TColumn);
    procedure btnFecharLegendaClick(Sender: TObject);
    procedure mnLancarAtendimentoClick(Sender: TObject);
    procedure mnFinalizarOSClick(Sender: TObject);
    procedure btnRegerarTituloClick(Sender: TObject);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure mnpCorrigirEnderecoEntregaClick(Sender: TObject);
    procedure mnFaturarOSClick(Sender: TObject);
    procedure btbtnCancelarOSClick(Sender: TObject);
    procedure dbCnaeButtonClick(Sender: TObject);
    procedure dbNCMButtonClick(Sender: TObject);
    procedure nmImprimirOrcamentoClick(Sender: TObject);
    procedure btnTituloEditarClick(Sender: TObject);
    procedure cdsOSFormaPagtoBeforePost(DataSet: TDataSet);
    procedure nmImprimirOSClick(Sender: TObject);
    procedure nmGerarImprimirBoletosClick(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;
    SQL_Equipamento,
    SQL_Servico    ,
    SQL_Produto    ,
    SQL_Tecnico    ,
    SQL_FormaPagto ,
    SQL_Titulos    ,
    SQL_Eventos    : TStringList;
    fDataAtual     : TDateTime;

    procedure AbrirTabelaEquipamentos(const aAno : Smallint; const aControle : Integer);
    procedure AbrirTabelaFormasPagto(const aAno : Smallint; const aControle : Integer);
    procedure AbrirTabelaServicos(const aAno : Smallint; const aControle : Integer);
    procedure AbrirTabelaProdutos(const aAno : Smallint; const aControle : Integer);
    procedure AbrirTabelaTecnicos(const aAno : Smallint; const aControle : Integer);
    procedure AbrirTabelaTitulos(const aAno : Smallint; const aControle : Integer);
    procedure AbrirTabelaEventos(const aAno : Smallint; const aControle : Integer);
    procedure AbrirNotaFiscalServico(const Empresa : String; const aAnoOS : Smallint; const aControleOS : Integer); virtual; abstract;
    procedure GerarTitulos(const aAno : Smallint; const aControle : Integer);

    procedure CarregarDadosEmpresa(const pEmpresa, pTituloRelatorio : String);
    procedure CarregarDadosServicoProduto(const pDataSet : TIBDataSet;
      pCodigo : String; pTipo : TAliquota; const ApenasValidar : Boolean = FALSE);

    procedure RegistrarNovaRotinaSistema;
    procedure HabilitarDesabilitar_Btns;
    procedure GetTitulosAbertos(pCliente : Integer);
    procedure PosicionarGuias;
    procedure RecarregarRegistro;
    procedure ZerarFormaPagto;
    procedure CalcularValorComissao;
    procedure GravarEventoAutomatico(pTitulo, pEvento : String; const pImprimir : Boolean);

    function GetRotinaInserirServicosID : String;
    function GetRotinaInserirProdutosID : String;
    function GetRotinaInserirTecnicosID : String;
    function GetRotinaInserirEventosID : String;
    function GetRotinaFinalizarEdicaoID : String;
    function GetRotinaIniciarAvaliacaoID : String;
    function GetRotinaLancarParecerID : String;
    function GetRotinaAprovarOrdemServicoID : String;
    function GetRotinaLancarAtendimentoID : String;
    function GetRotinaFinalizarOrdemServicoID : String;
    function GetRotinaFaturarOrdemServicoID : String;
    function GetRotinaGerarImprimirBoletoID : String;

    function PossuiTitulosPagos(const aAno : Smallint; const aControle : Integer) : Boolean;
    function GetTotalValorFormaPagto : Currency;
    function GetTotalValorFormaPagto_APrazo : Currency;
    function GetTotalValorServicos : Currency;
    function GetGerarEstoqueCliente : Integer; virtual; abstract;
    function FormaPagtoEmitiBoleto(const aFormaPagto : Integer) : Boolean;
    function BoletosGerados : Boolean;

    function ServicosAprovados : Boolean;
    function ProdutosAprovados : Boolean;
  public
    { Public declarations }
    property RotinaInserirServicosID  : String read GetRotinaInserirServicosID;
    property RotinaInserirProdutosID  : String read GetRotinaInserirProdutosID;
    property RotinaInserirTecnicosID  : String read GetRotinaInserirTecnicosID;
    property RotinaInserirEventosID   : String read GetRotinaInserirEventosID;
    property RotinaFinalizarEdicaoID  : String read GetRotinaFinalizarEdicaoID;
    property RotinaIniciarAvaliacaoID : String read GetRotinaIniciarAvaliacaoID;
    property RotinaLancarParecerID    : String read GetRotinaLancarParecerID;
    property RotinaAprovarOrdemServicoID   : String read GetRotinaAprovarOrdemServicoID;
    property RotinaLancarAtendimentoID     : String read GetRotinaLancarAtendimentoID;
    property RotinaFinalizarOrdemServicoID : String read GetRotinaFinalizarOrdemServicoID;
    property RotinaFaturarOrdemServicoID   : String read GetRotinaFaturarOrdemServicoID;
    property RotinaGerarImprimirBoletoID   : String read GetRotinaGerarImprimirBoletoID;
  end;

(*
  Tabelas:
  - TBOS
  - TBOS_FORMAPAGTO
  - TBOS_SERVICO
  - TBOS_PRODUTO
  - TBOS_TECNICO
  - TBOS_EVENTO
  - TBCONTREC
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBCLIENTE
  - TBOS_EQUIPAMENTO
  - TBCLIENTE_EQUIPAMENTO
  - SYS_TIPO_EQUIPAMENTO
  - TBFORMPAGTO
  - TBVENDEDOR

  Views:
  - VW_CONDICAOPAGTO
  - VW_EMPRESA

  Procedures:
  - GET_LIMITE_DISPONIVEL_CLIENTE

*)

var
  frmGeOS: TfrmGeOS;

implementation

uses
  DateUtils, SysConst, UFuncoes, UDMRecursos, UDMBusiness, UDMNFe, UDMNFSe,
  View.Cliente, UGeTabelaCNAE, View.IBPT, View.CondicaoPagto, UGeGerarBoletos,
  UGeEfetuarPagtoREC, UGeEquipamento, UGeOSFormaPagto, UGeOSConfirmaTitulos,
  UGeOSCancelar, View.MemoData;

{$R *.dfm}

(*

  Rela��o de Rotinas para controle de permiss�o:

   1 - Inserir
   2 - Editar
   3 - Excluir
   4 - Imprimir
   5 - Pesquisar

   6 - Inser��o/Edi��o de Servi�os
   7 - Inser��o/Edi��o de Produtos
   8 - Inser��o/Edi��o de T�cnicos
   9 - Inser��o/Edi��o de Eventos

  11 - Finalizar Edi��o
  12 - Iniciar Avalia��o
  13 - Lan�ar Parecer/Diagn�stico
  14 - Aprovar OS
  15 - Iniciar Atendimento
  16 - Finalizar OS
  17 - Faturar OS
   
  18 - Gerar NFS-e
  19 - Cancelar OS
  20 - Gerar/Imprimir Boletos
  21 - Cancelar Pagamentos
  
*)

procedure TfrmGeOS.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_OS_' + FormatFloat('0000', YearOf(GetDateDB));
  CriarGenerator(sGeneratorName, 0);

  inherited;

  SQL_Equipamento := TStringList.Create;
  SQL_Equipamento.Clear;
  SQL_Equipamento.AddStrings( cdsOSEquipamentos.SelectSQL );

  SQL_FormaPagto := TStringList.Create;
  SQL_FormaPagto.Clear;
  SQL_FormaPagto.AddStrings( cdsOSFormaPagto.SelectSQL );

  SQL_Servico := TStringList.Create;
  SQL_Servico.Clear;
  SQL_Servico.AddStrings( cdsOSServicos.SelectSQL );

  SQL_Produto := TStringList.Create;
  SQL_Produto.Clear;
  SQL_Produto.AddStrings( cdsOSProdutos.SelectSQL );

  SQL_Tecnico := TStringList.Create;
  SQL_Tecnico.Clear;
  SQL_Tecnico.AddStrings( cdsOSTecnicos.SelectSQL );

  SQL_Titulos := TStringList.Create;
  SQL_Titulos.Clear;
  SQL_Titulos.AddStrings( qryTitulos.SelectSQL );

  SQL_Eventos := TStringList.Create;
  SQL_Eventos.Clear;
  SQL_Eventos.AddStrings( cdsOSEventos.SelectSQL );

  RotinaID := ROTINA_MOV_ORDEM_SERV_ID;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryVendedorTecnico);
  CarregarLista(cdsFormaPagto);
  CarregarLista(cdsCondicaoPagto);
  CarregarLista(fdQryTipoComissao);

  TbsNFSe.TabVisible     := False;
  btbtnGerarNFSe.Visible := False;

  e1Data.Date := GetMenorDataEmissaoOS;
  e2Data.Date := GetDateDB;
  fDataAtual  := e2Data.Date;

  DisplayFormatCodigo := '###0000000';
  ControlFirstEdit    := dbEmpresa;
  AbrirTabelaAuto     := True;

  NomeTabela      := 'TBOS';
  CampoCodigo     := 'os.controle';
  CampoDescricao  := 'cl.nome';
  CampoOrdenacao  := 'os.ano, os.controle';
  WhereAdditional := '(os.data_emissao between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  if ( RdgStatusOS.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (os.status = ' + IntToStr(RdgStatusOS.ItemIndex - 1) + ')';

  PosicionarGuias;

  TbsLocalRealizacao.Caption := IfThen(gSistema.Codigo = SISTEMA_GESTAO_IND, 'Local de Realiza��o', 'Local de Entrega/Realiza��o');

  if GetUserPermitirAlterarValorVenda then
  begin
    dbServicoValorUnit.ReadOnly := False;
    dbServicoValorUnit.TabStop  := True;
    dbServicoValorUnit.Color    := dbProduto.Color;

    dbProdutoValorUnit.ReadOnly := False;
    dbProdutoValorUnit.TabStop  := True;
    dbProdutoValorUnit.Color    := dbProduto.Color;
  end;
end;

procedure TfrmGeOS.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger      := iAno;
    IbDtstTabelaCONTROLE.AsInteger := iNum;

    AbrirTabelaEquipamentos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaTecnicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaTitulos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaEventos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

    RdgStatusOS.ItemIndex := 0;

    ZerarFormaPagto;
    PosicionarGuias;
  end;
end;

procedure TfrmGeOS.cdsOSEquipamentosEQUIPAMENTOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatFloat('00', Sender.DataSet.RecNo);
end;

procedure TfrmGeOS.cdsOSEquipamentosDEVOLVIDOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if Sender.AsInteger = 1 then
      Text := 'X'
    else
      Text := EmptyStr;  
end;

procedure TfrmGeOS.AbrirTabelaEquipamentos(const aAno: Smallint;
  const aControle: Integer);
begin
  cdsOSEquipamentos.Close;

  with cdsOSEquipamentos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Equipamento );
    Add('where ep.ano      = ' + IntToStr(aAno));
    Add('  and ep.controle = ' + IntToStr(aControle));
  end;

  cdsOSEquipamentos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    TbsEquipamento.TabVisible   := (gSistema.Codigo = SISTEMA_GESTAO_COM) and ((IbDtstTabelaSTATUS.AsInteger = STATUS_OS_EDT) or ((IbDtstTabelaSTATUS.AsInteger > STATUS_OS_EDT) and (cdsOSEquipamentos.RecordCount > 0)));
    btbtnControleOS.Enabled     := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_NFS);

    nmImprimirOS.Enabled        := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger <> STATUS_OS_EDT);
    nmImprimirOrcamento.Enabled := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger <> STATUS_OS_EDT) and (IbDtstTabelaSTATUS.AsInteger <> STATUS_OS_CAN);

    mnFinalizarEdicao.Enabled   := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger = STATUS_OS_EDT);
    mnIniciarAvaliacao.Enabled  := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger = STATUS_OS_ABR);
    mnLancarParecer.Enabled     := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_ABR, STATUS_OS_AVL, STATUS_OS_PAR]); // Pode ser lan�ado mais de 1 parecer/diagn�stico
    mnAprovarOS.Enabled         := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_ABR, STATUS_OS_AVL, STATUS_OS_PAR]) and (IbDtstTabelaTOTAL_SERVICO.AsCurrency > 0);
    mnLancarAtendimento.Enabled := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_APR, STATUS_OS_ATE]); // Marcar OS como atendimento iniciado
    mnFinalizarOS.Enabled       := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_APR, STATUS_OS_ATE]); // Marcar OS como atendimento finalizado
    mnFaturarOS.Enabled         := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger = STATUS_OS_FIN);

    BtnTecnicoAtualizarComissao.Enabled := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger >= STATUS_OS_APR) and (IbDtstTabelaSTATUS.AsInteger <= STATUS_OS_FAT) and (cdsOSTecnicos.RecordCount > 0);

//    btnRegerarTitulo.Enabled := (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FIN, STATUS_OS_FAT]) and (qryTitulos.RecordCount = 0);
//    btnTituloEditar.Enabled  := (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FIN, STATUS_OS_FAT]) and (not qryTitulos.IsEmpty);
    btnRegerarTitulo.Enabled := (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FAT]) and (qryTitulos.RecordCount = 0);
    btnTituloEditar.Enabled  := (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FAT]) and (not qryTitulos.IsEmpty);

(*
    btbtnFinalizar.Enabled   := (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty) and (not cdsVendaFormaPagto.IsEmpty);
    btbtnGerarNFe.Enabled    := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty);
    btbtnCancelarVND.Enabled := ( (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) or (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE) );

    BtnTransporteInforme.Enabled := btbtnFinalizar.Enabled or btbtnGerarNFe.Enabled;

    btnGerarBoleto.Enabled   := GetEstacaoEmitiBoleto and (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN); // and (IbDtstTabelaFORMAPAGTO_COD.AsInteger = GetCondicaoPagtoIDBoleto);

    nmGerarImprimirBoletos.Enabled := (not qryTitulos.IsEmpty) and (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_CAN);

    nmImprimirDANFE.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmGerarDANFEXML.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmEnviarEmailCliente.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);

    TbsInformeNFe.TabVisible    := (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0);
    nmPpLimparDadosNFe.Enabled  := (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0) and (IbDtstTabelaNFE.AsCurrency = 0);
    BtnLimparDadosNFe.Enabled   := (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0) and (IbDtstTabelaNFE.AsCurrency = 0);
    BtnCorrigirDadosNFe.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) and (IbDtstTabelaNFE.AsCurrency = 0);
*)
    TbsNFSe.TabVisible    := (Trim(IbDtstTabelaNFS_LOTE.AsString) <> EmptyStr);

    if TbsEquipamento.TabVisible then
      pgcServicoDetalhe.ActivePage := TbsEquipamento;
  end
  else
  begin
    TbsEquipamento.TabVisible   := True;
    btbtnControleOS.Enabled     := False;

    mnFinalizarEdicao.Enabled   := False;
    mnIniciarAvaliacao.Enabled  := False;
    mnLancarParecer.Enabled     := False;
    mnAprovarOS.Enabled         := False;
    mnLancarAtendimento.Enabled := False;
    mnFinalizarOS.Enabled       := False;
    mnFaturarOS.Enabled         := False;

    BtnTecnicoAtualizarComissao.Enabled := False;

    btnRegerarTitulo.Enabled := False;
    btnTituloEditar.Enabled  := False;
(*
    btbtnFinalizar.Enabled   := False;
    btbtnGerarNFe.Enabled    := False;
    btbtnCancelarVND.Enabled := False;

    BtnTransporteInforme.Enabled := False;

    nmGerarImprimirBoletos.Enabled := (not qryTitulos.IsEmpty) and (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_CAN);

    nmImprimirDANFE.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmGerarDANFEXML.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmEnviarEmailCliente.Enabled := False;

    TbsInformeNFe.TabVisible    := (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0);
    nmPpLimparDadosNFe.Enabled  := (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0) and (IbDtstTabelaNFE.AsCurrency = 0);
    BtnLimparDadosNFe.Enabled   := (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0) and (IbDtstTabelaNFE.AsCurrency = 0);
    BtnCorrigirDadosNFe.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) and (IbDtstTabelaNFE.AsCurrency = 0);
*)
    TbsNFSe.TabVisible    := False;
  end;
end;

procedure TfrmGeOS.cdsOSEquipamentosAfterScroll(DataSet: TDataSet);
begin
  pnlEquipamentoEntrega.Visible    := ( cdsOSEquipamentosDEVOLVIDO.AsInteger = 1 );
  BtnEquipamentoDevolver.Enabled   := ((cdsOSEquipamentos.State = dsBrowse) and (cdsOSEquipamentos.RecordCount > 0) and (cdsOSEquipamentosDEVOLVIDO.AsInteger = 0) );
  dbEquipamentoObservacao.ReadOnly := ( cdsOSEquipamentosDEVOLVIDO.AsInteger = 1 );
end;

procedure TfrmGeOS.ControlEditExit(Sender: TObject);
var
  LimiteDesc,
  Perc      : Variant;
  cPrecoVND : Currency;
begin
  inherited;

  if ( Sender = dbServico ) then
    if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
      CarregarDadosServicoProduto( cdsOSServicos, dbServico.Text, taISS );

  if ( Sender = dbProduto ) then
    if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
      CarregarDadosServicoProduto( cdsOSProdutos, dbProduto.Text, taICMS );

  if ( (Sender = dbServicoQuantidade) or (Sender = dbServicoValorUnit) or (Sender = dbServicoDesconto) ) then
    if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
    begin
      if ( cdsOSServicosPUNIT_PROMOCAO.IsNull ) then
        cdsOSServicosPUNIT_PROMOCAO.AsCurrency := 0;

      if ( cdsOSServicosPUNIT.IsNull ) then
        cdsOSServicosPUNIT.AsCurrency := 0;

      if ( cdsOSServicosDESCONTO.IsNull ) then
        cdsOSServicosDESCONTO.AsCurrency := 0;

      cPrecoVND := cdsOSServicosPUNIT.AsCurrency;

      cdsOSServicosDESCONTO_VALOR.AsCurrency := cPrecoVND * cdsOSServicosDESCONTO.AsCurrency / 100;
      cdsOSServicosPFINAL.AsCurrency         := cPrecoVND - cdsOSServicosDESCONTO_VALOR.AsCurrency;
      cdsOSServicosTOTAL_CUSTO.AsCurrency    := cdsOSServicosQTDE.AsCurrency * cdsOSServicosCUSTO.AsCurrency;
      cdsOSServicosTOTAL_BRUTO.AsCurrency    := cdsOSServicosQTDE.AsCurrency * cPrecoVND;
      cdsOSServicosTOTAL_DESCONTO.AsCurrency := cdsOSServicosQTDE.AsCurrency * cdsOSServicosDESCONTO_VALOR.AsCurrency;
      cdsOSServicosTOTAL_LIQUIDO.AsCurrency  := cdsOSServicosTOTAL_BRUTO.AsCurrency - cdsOSServicosTOTAL_DESCONTO.AsCurrency;;
    end;

  if ( (Sender = dbProdutoQuantidade) or (Sender = dbProdutoValorUnit) or (Sender = dbProdutoDesconto) ) then
    if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
    begin
      if ( cdsOSProdutosPUNIT_PROMOCAO.IsNull ) then
        cdsOSProdutosPUNIT_PROMOCAO.AsCurrency := 0;

      if ( cdsOSProdutosPUNIT.IsNull ) then
        cdsOSProdutosPUNIT.AsCurrency := 0;

      if ( cdsOSProdutosDESCONTO.IsNull ) then
        cdsOSProdutosDESCONTO.AsCurrency := 0;

      cPrecoVND := cdsOSProdutosPUNIT.AsCurrency;

      cdsOSProdutosDESCONTO_VALOR.AsCurrency := cPrecoVND * cdsOSProdutosDESCONTO.AsCurrency / 100;
      cdsOSProdutosPFINAL.AsCurrency         := cPrecoVND - cdsOSProdutosDESCONTO_VALOR.AsCurrency;
      cdsOSProdutosTOTAL_CUSTO.AsCurrency    := cdsOSProdutosQTDE.AsCurrency * cdsOSProdutosCUSTO.AsCurrency;
      cdsOSProdutosTOTAL_BRUTO.AsCurrency    := cdsOSProdutosQTDE.AsCurrency * cPrecoVND;
      cdsOSProdutosTOTAL_DESCONTO.AsCurrency := cdsOSProdutosQTDE.AsCurrency * cdsOSProdutosDESCONTO_VALOR.AsCurrency;
      cdsOSProdutosTOTAL_LIQUIDO.AsCurrency  := cdsOSProdutosTOTAL_BRUTO.AsCurrency - cdsOSProdutosTOTAL_DESCONTO.AsCurrency;;
    end;

  if ( Sender = dbTecnicoTipoComissao ) then
    if ( cdsOSTecnicos.State in [dsEdit, dsInsert] ) then
      if (dbTecnicoTipoComissao.Field.AsInteger = 0) then // Comiss�o por Percentual
        cdsOSTecnicosCOMISSAO_VALOR.AsCurrency := 0.0
      else
      if (dbTecnicoTipoComissao.Field.AsInteger = 1) then // Comiss�o por Valor (R$)
        cdsOSTecnicosCOMISSAO_PERCENTUAL.AsCurrency := 0.0;

  if ( (Sender = dbEquipamentoObservacao) or (Sender = dbEquipamentoEstadoEntrega) ) then
    if BtnEquipamentoSalvar.Visible and BtnEquipamentoSalvar.Enabled then
      BtnEquipamentoSalvar.SetFocus;

  if ( Sender = dbServicoTotalLiquido ) then
    if ( BtnServicoSalvar.Visible and BtnServicoSalvar.Enabled ) then
      BtnServicoSalvar.SetFocus;

  if ( Sender = dbProdutoTotalLiquido ) then
    if ( BtnProdutoSalvar.Visible and BtnProdutoSalvar.Enabled ) then
      BtnProdutoSalvar.SetFocus;

  if ( Sender = dbTecnicoValorComissao ) then
    if ( BtnTecnicoSalvar.Visible and BtnTecnicoSalvar.Enabled ) then
      BtnTecnicoSalvar.SetFocus;
end;

procedure TfrmGeOS.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  FiltrarTecnicosChange(Sender);

  dtsOSEquipamentos.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_AVL);
  dtsOSFormaPagto.AutoEdit   := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_FAT); // A forma/condi��o de pagamento poder� ser alterada enquanto a OS n�o tiver sido faturada

  dtsOSServicos.AutoEdit     := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_APR);
  dtsOSProdutos.AutoEdit     := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_APR);
  dtsOSTecnicos.AutoEdit     := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger > STATUS_OS_PAR) and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_FAT); // Enquanto n�o for faturada, as comiss�es podem ser definidas

  dtsOSEventos.AutoEdit      := (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_FIN);
end;

procedure TfrmGeOS.AbrirTabelaFormasPagto(const aAno: Smallint;
  const aControle: Integer);
begin
  cdsOSFormaPagto.Close;

  with cdsOSFormaPagto, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_FormaPagto );
    Add('where fp.ano      = ' + IntToStr(aAno));
    Add('  and fp.controle = ' + IntToStr(aControle));
  end;

  cdsOSFormaPagto.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaEquipamentos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaTecnicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaTitulos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaEventos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
end;

procedure TfrmGeOS.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_OS_AVL ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_OS_AVL : sMsg := 'Esta OS n�o pode ser exclu�da porque j� est� em avalia��o.';
      STATUS_OS_PAR : sMsg := 'Esta OS n�o pode ser exclu�da porque j� possui parecer/diagn�stico lan�ado.';
      STATUS_OS_APR : sMsg := 'Esta OS n�o pode ser exclu�da porque j� foi aprovada pelo cliente para realiza��o/faturamento.';
      STATUS_OS_ATE : sMsg := 'Esta OS n�o pode ser exclu�da porque j� est� em atendimento.';
      STATUS_OS_FIN : sMsg := 'Esta OS n�o pode ser exclu�da porque j� est� finalizada.';
      STATUS_OS_FAT : sMsg := 'Esta OS n�o pode ser exclu�da porque j� est� faturada.';
      STATUS_OS_NFS : sMsg := 'Esta OS n�o pode ser exclu�da porque j� est� possui Nota Fiacal de Servi�o emitida.';
      STATUS_OS_CAN : sMsg := 'Esta OS n�o pode ser exclu�da porque j� est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaEquipamentos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaTecnicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaTitulos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaEventos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    end;
  end;
end;

procedure TfrmGeOS.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID  : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if (IbDtstTabela.RecordCount = 0) then
    sID := EmptyStr
  else
    sID := Trim(IbDtstTabelaCONTROLE.AsString);

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCONTROLE.AsInteger;

    edtFiltrar.Text       := EmptyStr;
    RdgStatusOS.ItemIndex := 0;

    if (IbDtstTabelaDATA_EMISSAO.AsDateTime < e1Data.Date) then
      e1Data.Date := IbDtstTabelaDATA_EMISSAO.AsDateTime;

    if (IbDtstTabelaDATA_EMISSAO.AsDateTime > e2Data.Date) then
      e2Data.Date := IbDtstTabelaDATA_EMISSAO.AsDateTime;

    //IbDtstTabela.Close;
    //IbDtstTabela.Open;
    btnFiltrar.Click;
    
    if not IbDtstTabela.Locate('ANO;CONTROLE', VarArrayOf([iAno, iCod]), []) then
    begin
      ShowWarning('Erro ao verificar a integridade do registros.' + #13 + 'Favor pesquisar novamente a OS.');
      Abort;
    end;
  end;
end;

procedure TfrmGeOS.btbtnSalvarClick(Sender: TObject);
var
  cValorAPagar  ,
  cValorServico : Currency;
begin
  if ( cdsOSFormaPagto.State in [dsEdit, dsInsert] ) then
    cdsOSFormaPagto.Post;

  cValorAPagar := GetTotalValorServicos;

  if (btbtnSalvar.Visible and btbtnSalvar.Enabled) then
    btbtnSalvar.SetFocus;

  // Verificar dados da(s) Forma(s) de Pagamento(s)

  if ( cdsOSFormaPagto.RecordCount = 0 ) then
  begin
    ShowWarning('Favor informar a forma e/ou condi��o de pagamento');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < 0 ) then
  begin
    ShowWarning('Favor informar corretamente o valor de cada forma/condi��o de pagamento');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto > cValorAPagar ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MAIOR que o Valor L�quido da OS.' + #13#13 + 'Favor corrigir os valores.');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < cValorAPagar ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MENOR que o Valor L�quido da OS.' + #13#13 + 'Favor corrigir os valores.');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  begin

    SetCompetencia(IbDtstTabelaDATA_EMISSAO.AsDateTime);
    IbDtstTabelaCOMPETENCIA.Value := StrToInt(FormatDateTime('YYYYMM', IbDtstTabelaDATA_EMISSAO.AsDateTime));

    inherited;
    
    if ( not OcorreuErro ) then
    begin
        // Salvar Equipamentos

      if ( cdsOSEquipamentos.State in [dsEdit, dsInsert] ) then
        cdsOSEquipamentos.Post;

      cdsOSEquipamentos.ApplyUpdates;

      // Salvar Formas de Pagamentos

      if ( cdsOSFormaPagto.State in [dsEdit, dsInsert] ) then
        cdsOSFormaPagto.Post;

      cdsOSFormaPagto.ApplyUpdates;

      // Salvar Servi�os

      if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
        cdsOSServicos.Post;

      cdsOSServicos.ApplyUpdates;

      // Salvar Produtos

      if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
        cdsOSProdutos.Post;

      cdsOSProdutos.ApplyUpdates;

      // Salvar Tecnicos

      if ( cdsOSTecnicos.State in [dsEdit, dsInsert] ) then
        cdsOSTecnicos.Post;

      cdsOSTecnicos.ApplyUpdates;

      // Salvar Hist�ricos

      if ( cdsOSEventos.State in [dsEdit, dsInsert] ) then
        cdsOSEventos.Post;

      cdsOSEventos.ApplyUpdates;

      CommitTransaction;

      // Reabrir tabelas da OS

      AbrirTabelaEquipamentos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaTecnicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaTitulos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaEventos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

      // Corrigir Total Forma Pagto

      cValorServico := GetTotalValorServicos;

      if ( (cdsOSFormaPagto.RecordCount = 1) and (cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency <> IbDtstTabelaTOTAL_LIQUIDO.AsCurrency) ) then
      begin
        cdsOSFormaPagto.Edit;
        cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency := cValorServico;
        cdsOSFormaPagto.Post;
        cdsOSFormaPagto.ApplyUpdates;

        if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
        begin
          IbDtstTabela.Post;
          IbDtstTabela.ApplyUpdates;
        end;

        CommitTransaction;
      end;
    end;

  end;
end;

procedure TfrmGeOS.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  DtSrcTabelaStateChange( DtSrcTabela );

  AbrirTabelaEquipamentos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaTecnicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaTitulos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaEventos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_OS_APR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_OS_AVL : sMsg := 'Esta OS n�o pode ser alterada porque j� est� em avalia��o.';
      STATUS_OS_PAR : sMsg := 'Esta OS n�o pode ser alterada porque j� possui parecer/diagn�stico lan�ado.';
      STATUS_OS_APR : sMsg := 'Esta OS n�o pode ser alterada porque j� foi aprovada pelo cliente para realiza��o/faturamento.';
      STATUS_OS_ATE : sMsg := 'Esta OS n�o pode ser alterada porque j� est� em atendimento.';
      STATUS_OS_FIN : sMsg := 'Esta OS n�o pode ser alterada porque j� est� finalizada.';
      STATUS_OS_FAT : sMsg := 'Esta OS n�o pode ser alterada porque j� est� faturada.';
      STATUS_OS_NFS : sMsg := 'Esta OS n�o pode ser alterada porque j� est� possui Nota Fiacal de Servi�o emitida.';
      STATUS_OS_CAN : sMsg := 'Esta OS n�o pode ser alterada porque j� est� cancelada.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaEquipamentos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaTecnicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaTitulos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
      AbrirTabelaEventos     ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    end;
  end;
end;

procedure TfrmGeOS.AbrirTabelaServicos(const aAno: Smallint;
  const aControle: Integer);
begin
  cdsOSServicos.Close;

  with cdsOSServicos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Servico );
    Add('where s.ano      = ' + IntToStr(aAno));
    Add('  and s.controle = ' + IntToStr(aControle));
  end;

  cdsOSServicos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.dbServicoTotalDescontoButtonClick(Sender: TObject);
var
  sValor : String;
  cValor : Currency;
begin
  if ( dbServicoTotalDesconto.ReadOnly ) then
    Exit;

  if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
  begin
    sValor := InputBox('TOTAL DESCONTO (R$)', 'Favor informar o Valor Total de Desconto:', FormatFloat(',0.00', dbServicoTotalDesconto.Field.AsCurrency));
    sValor := Trim(StringReplace(sValor, '.', '', [rfReplaceAll]));
    cValor := StrToCurrDef(sValor, 0);
    if ( cValor > 0 ) then
    begin
      cdsOSServicosDESCONTO_VALOR.AsCurrency := cValor / cdsOSServicosQTDE.AsCurrency;
      cdsOSServicosDESCONTO.AsCurrency  := cdsOSServicosDESCONTO_VALOR.Value / cdsOSServicosPUNIT.AsCurrency * 100;
      cdsOSServicosPFINAL.Value         := cdsOSServicosPUNIT.AsCurrency     - cdsOSServicosDESCONTO_VALOR.Value;
      cdsOSServicosTOTAL_BRUTO.Value    := cdsOSServicosQTDE.AsCurrency      * cdsOSServicosPUNIT.AsCurrency;
      cdsOSServicosTOTAL_DESCONTO.Value := cValor;
      cdsOSServicosTOTAL_LIQUIDO.Value  := cdsOSServicosTOTAL_BRUTO.AsCurrency - cdsOSServicosTOTAL_DESCONTO.AsCurrency;
    end;
  end;
end;

procedure TfrmGeOS.PosicionarGuias;
begin
  if TbsEquipamento.TabVisible then
    pgcServicoDetalhe.ActivePage := TbsEquipamento
  else
  if TbsServicoARealizar.TabVisible then
    pgcServicoDetalhe.ActivePage := TbsServicoARealizar;

  pgcServicoFinalizar.ActivePage := TbsRecebimento;
  pgcServicoProduto.ActivePage   := TbsServico;
end;

procedure TfrmGeOS.AbrirTabelaProdutos(const aAno: Smallint;
  const aControle: Integer);
begin
  cdsOSProdutos.Close;

  with cdsOSProdutos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Produto );
    Add('where sp.ano      = ' + IntToStr(aAno));
    Add('  and sp.controle = ' + IntToStr(aControle));
  end;

  cdsOSProdutos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.dbProdutoTotalDescontoButtonClick(Sender: TObject);
var
  sValor : String;
  cValor : Currency;
begin
  if ( dbProdutoTotalDesconto.ReadOnly ) then
    Exit;

  if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
  begin
    sValor := InputBox('TOTAL DESCONTO (R$)', 'Favor informar o Valor Total de Desconto:', FormatFloat(',0.00', dbProdutoTotalDesconto.Field.AsCurrency));
    sValor := Trim(StringReplace(sValor, '.', '', [rfReplaceAll]));
    cValor := StrToCurrDef(sValor, 0);
    if ( cValor > 0 ) then
    begin
      cdsOSProdutosDESCONTO_VALOR.AsCurrency := cValor / cdsOSProdutosQTDE.AsCurrency;
      cdsOSProdutosDESCONTO.AsCurrency  := cdsOSProdutosDESCONTO_VALOR.Value / cdsOSProdutosPUNIT.AsCurrency * 100;
      cdsOSProdutosPFINAL.Value         := cdsOSProdutosPUNIT.AsCurrency     - cdsOSProdutosDESCONTO_VALOR.Value;
      cdsOSProdutosTOTAL_BRUTO.Value    := cdsOSProdutosQTDE.AsCurrency      * cdsOSProdutosPUNIT.AsCurrency;
      cdsOSProdutosTOTAL_DESCONTO.Value := cValor;
      cdsOSProdutosTOTAL_LIQUIDO.Value  := cdsOSProdutosTOTAL_BRUTO.AsCurrency - cdsOSProdutosTOTAL_DESCONTO.AsCurrency;
    end;
  end;
end;

procedure TfrmGeOS.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := '(os.data_emissao between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  if ( RdgStatusOS.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (os.status = ' + IntToStr(RdgStatusOS.ItemIndex - 1) + ')';
    
  inherited;
end;

procedure TfrmGeOS.AbrirTabelaTecnicos(const aAno: Smallint;
  const aControle: Integer);
begin
  cdsOSTecnicos.Close;

  with cdsOSTecnicos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Tecnico );
    Add('where tc.ano      = ' + IntToStr(aAno));
    Add('  and tc.controle = ' + IntToStr(aControle));
  end;

  cdsOSTecnicos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.AbrirTabelaTitulos(const aAno: Smallint;
  const aControle: Integer);
begin
  qryTitulos.Close;

  with qryTitulos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Titulos );
    Add('where r.Anoos = ' + IntToStr(aAno));
    Add('  and r.Numos = ' + IntToStr(aControle));
    Add('order by r.numlanc, r.parcela');
  end;

  qryTitulos.Open;
end;

function TfrmGeOS.FormaPagtoEmitiBoleto(const aFormaPagto : Integer) : Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select distinct');
    SQL.Add('    r.forma_pagto');
    SQL.Add('from TBCONTREC r');
    SQL.Add('  inner join TBFORMPAGTO_CONTACOR f on (f.forma_pagto = r.forma_pagto)');
    SQL.Add('  inner join TBBANCO_BOLETO c on (c.bco_codigo = f.conta_corrente and c.empresa = r.empresa and c.bco_gerar_boleto = 1)');
    SQL.Add('where r.cliente  = ' + IbDtstTabelaCLIENTE.AsString);
    SQL.Add('  and r.anoos    = ' + IbDtstTabelaANO.AsString);
    SQL.Add('  and r.numos    = ' + IbDtstTabelaCONTROLE.AsString);

    if (aFormaPagto > 0) then
      SQL.Add('  and r.forma_pagto = ' + IntToStr(aFormaPagto));

    Open;

    Result := (FieldByName('forma_pagto').AsInteger > 0);

    Close;
  end;
end;

function TfrmGeOS.BoletosGerados: Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select b.nossonumero from TBCONTREC b');
    SQL.Add('where b.cliente  = ' + IbDtstTabelaCLIENTE.AsString);
    SQL.Add('  and b.anoos    = ' + IbDtstTabelaANO.AsString);
    SQL.Add('  and b.numos    = ' + IbDtstTabelaCONTROLE.AsString);
    SQL.Add('  and b.codbanco > 0');
    Open;

    Result := (Trim(FieldByName('nossonumero').AsString) <> EmptyStr);

    Close;
  end;
end;

procedure TfrmGeOS.qryTitulosCalcFields(DataSet: TDataSet);
begin
  qryTitulosLancamento.AsString := FormatFloat('0000', qryTitulosANOLANC.AsInteger) + FormatFloat('000000', qryTitulosNUMLANC.AsInteger);
end;

procedure TfrmGeOS.btnConsultarServicoClick(Sender: TObject);
begin
  MostrarTabelaServicos(Self);
end;

procedure TfrmGeOS.btbtnControleOSClick(Sender: TObject);
begin
  ppControleOS.Popup(btbtnControleOS.ClientOrigin.X, btbtnControleOS.ClientOrigin.Y + btbtnControleOS.Height);
end;

procedure TfrmGeOS.AbrirTabelaEventos(const aAno: Smallint;
  const aControle: Integer);
begin
  cdsOSEventos.Close;

  with cdsOSEventos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Eventos );
    Add('where ev.ano      = ' + IntToStr(aAno));
    Add('  and ev.controle = ' + IntToStr(aControle));
    Add('order by ev.data_evento');
  end;

  cdsOSEventos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.FiltrarTecnicosChange(Sender: TObject);
begin
  fdQryVendedorTecnico.Filtered := (TDataSource(Sender).DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeOS.ZerarFormaPagto;
begin
  if not dtsOSFormaPagto.AutoEdit then
    Exit;

  cdsOSFormaPagto.First;

  while not cdsOSFormaPagto.Eof do
    cdsOSFormaPagto.Delete;

  // Adicionar forma de pagamento inicial

  cdsOSFormaPagto.Append;
  cdsOSFormaPagtoFORMAPAGTO.Value    := GetFormaPagtoIDDefault;
  cdsOSFormaPagtoVALOR_FPAGTO.Value  := dbValorTotalLiquido.Field.AsCurrency;
  cdsOSFormaPagtoPAGTO_PRAZO.Value   := FLAG_NAO;
  cdsOSFormaPagtoCONDICAOPAGTO.Clear;

  if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
    IbDtstTabela.Edit;

  IbDtstTabelaPAGTO_PRAZO.AsInteger := FLAG_NAO;
end;

procedure TfrmGeOS.cdsOSFormaPagtoBeforePost(DataSet: TDataSet);
begin
  if ( (cdsOSFormaPagtoPAGTO_PRAZO.AsInteger = FLAG_SIM) and (IbDtstTabelaPAGTO_PRAZO.AsInteger = FLAG_NAO) ) then
  begin
    if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
      IbDtstTabela.Edit;

    IbDtstTabelaPAGTO_PRAZO.AsInteger := FLAG_SIM;
  end;
end;

procedure TfrmGeOS.cdsOSFormaPagtoNewRecord(DataSet: TDataSet);
begin
  cdsOSFormaPagtoANO.Assign( IbDtstTabelaANO );
  cdsOSFormaPagtoCONTROLE.Assign( IbDtstTabelaCONTROLE );
end;

procedure TfrmGeOS.cdsOSEquipamentosNewRecord(DataSet: TDataSet);
begin
  cdsOSEquipamentosANO.Assign( IbDtstTabelaANO );
  cdsOSEquipamentosCONTROLE.Assign( IbDtstTabelaCONTROLE );
  cdsOSEquipamentosUSUARIO.Value   := gUsuarioLogado.Login;
  cdsOSEquipamentosDEVOLVIDO.Value := 0;
  cdsOSEquipamentosTECNICO.Clear;
  cdsOSEquipamentosDATA_ENTREGA.Clear;
  cdsOSEquipamentosHORA_ENTREGA.Clear;
  cdsOSEquipamentosESTADO_ENTREGA.Clear;
  cdsOSEquipamentosEQUIPAMENTO.Clear;
end;

procedure TfrmGeOS.cdsOSServicosNewRecord(DataSet: TDataSet);
begin
  cdsOSServicosANO.Assign( IbDtstTabelaANO );
  cdsOSServicosCONTROLE.Assign( IbDtstTabelaCONTROLE );
  cdsOSServicosEMPRESA.Assign( IbDtstTabelaEMPRESA );
  cdsOSServicosCLIENTE.Assign( IbDtstTabelaCLIENTE );
  cdsOSServicosQTDE.Value           := 1;
  cdsOSServicosCUSTO.Value          := 0.0;
  cdsOSServicosPUNIT.Value          := 0.0;
  cdsOSServicosPUNIT_PROMOCAO.Value := 0.0;
  cdsOSServicosAPROVADO.Value       := 0;
  cdsOSServicosDESCONTO.Value       := 0.0;
  cdsOSServicosDESCONTO_VALOR.Value := 0.0;
  cdsOSServicosPFINAL.Value         := 0.0;
  cdsOSServicosTOTAL_CUSTO.Value    := 0.0;
  cdsOSServicosTOTAL_BRUTO.Value    := 0.0;
  cdsOSServicosTOTAL_DESCONTO.Value := 0.0;
  cdsOSServicosTOTAL_LIQUIDO.Value  := 0.0;
  cdsOSServicosALIQUOTA.Value       := 0.0;

  cdsOSServicosDESCRI.Clear;
  cdsOSServicosAPRESENTACAO.Clear;
  cdsOSServicosDESCRI_APRESENTACAO.Clear;
  cdsOSServicosUNP_DESCRICAO.Clear;
  cdsOSServicosUNP_SIGLA.Clear;
end;

procedure TfrmGeOS.cdsOSProdutosNewRecord(DataSet: TDataSet);
begin
  cdsOSProdutosANO.Assign( IbDtstTabelaANO );
  cdsOSProdutosCONTROLE.Assign( IbDtstTabelaCONTROLE );
  cdsOSProdutosEMPRESA.Assign( IbDtstTabelaEMPRESA );
  cdsOSProdutosCLIENTE.Assign( IbDtstTabelaCLIENTE );
  cdsOSProdutosQTDE.Value           := 1;
  cdsOSProdutosCUSTO.Value          := 0.0;
  cdsOSProdutosPUNIT.Value          := 0.0;
  cdsOSProdutosPUNIT_PROMOCAO.Value := 0.0;
  cdsOSProdutosAPROVADO.Value       := 0;
  cdsOSProdutosDESCONTO.Value       := 0.0;
  cdsOSProdutosDESCONTO_VALOR.Value := 0.0;
  cdsOSProdutosPFINAL.Value         := 0.0;
  cdsOSProdutosTOTAL_CUSTO.Value    := 0.0;
  cdsOSProdutosTOTAL_BRUTO.Value    := 0.0;
  cdsOSProdutosTOTAL_DESCONTO.Value := 0.0;
  cdsOSProdutosTOTAL_LIQUIDO.Value  := 0.0;
  cdsOSProdutosALIQUOTA.Value       := 0.0;

  cdsOSProdutosDESCRI.Clear;
  cdsOSProdutosAPRESENTACAO.Clear;
  cdsOSProdutosDESCRI_APRESENTACAO.Clear;
  cdsOSProdutosUNP_DESCRICAO.Clear;
  cdsOSProdutosUNP_SIGLA.Clear;
end;

procedure TfrmGeOS.cdsOSTecnicosNewRecord(DataSet: TDataSet);
begin
  cdsOSTecnicosANO.Assign( IbDtstTabelaANO );
  cdsOSTecnicosCONTROLE.Assign( IbDtstTabelaCONTROLE );
  cdsOSTecnicosUSUARIO.Value       := gUsuarioLogado.Login;
  cdsOSTecnicosDATA_CADASTRO.Value := GetDateDB;
  cdsOSTecnicosCOMISSAO_TIPO_LANC.Value       := 1; // Comiss�o por valor
  cdsOSTecnicosCOMISSAO_PERCENTUAL.AsCurrency := 0.0;
  cdsOSTecnicosCOMISSAO_VALOR.AsCurrency      := 0.0;
end;

procedure TfrmGeOS.cdsOSEventosNewRecord(DataSet: TDataSet);
begin
  cdsOSEventosANO.Assign( IbDtstTabelaANO );
  cdsOSEventosCONTROLE.Assign( IbDtstTabelaCONTROLE );
  cdsOSEventosUSUARIO.Value       := gUsuarioLogado.Login;
  cdsOSEventosDATA_CADASTRO.Value := GetDateDB;
  cdsOSEventosDATA_EVENTO.Value   := GetDateDB;
  cdsOSEventosIMPRIMIR.Value      := 1;
  cdsOSEventosTECNICO.Clear;
  cdsOSEventosDESCRICAO.Clear;
  cdsOSEventosEVENTO.Clear;
end;

procedure TfrmGeOS.dbgTitulosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente,
  MovAno    ,
  MovNumero : Integer;
  DataPagto : TDateTime;
begin
  if (Shift = [ssCtrl]) and (Key = 46) Then
  begin
    if ( UpperCase(Trim(qryTitulosBAIXADO_.AsString)) <> 'X' ) then
      Exit;

    // Diretoria, Gerente Financeiro, Gerente ADM, Masterdados

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    if ( qryTitulos.RecordCount > 0 ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if ( fdQryFormaPagto.Locate('cod', qryTitulosFORMA_PAGTO.AsInteger, []) ) then
        if ( fdQryFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
          if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, GetUserApp, GetDateDB, qryTitulosFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
          begin
            ShowWarning('N�o existe caixa aberto para o usu�rio na forma de pagamento deste movimento.');
            Exit;
          end;

      MovAno    := qryTitulosANOLANC.AsInteger;
      MovNumero := qryTitulosNUMLANC.AsInteger;
      DataPagto := qryTitulosDTREC.AsDateTime;

      if ShowConfirm('Confirma a remo��o do(s) registro(s) de baixa(s) do t�tulo selecionado?') then
      begin

        with DMBusiness, fdQryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete from TBCONTREC_BAIXA');
          SQL.Add('where ANOLANC = ' + qryTitulosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + qryTitulosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        with DMBusiness, fdQryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update TBCONTREC Set Baixado = 0, Historic = '''', Dtrec = null, Docbaix = null, Tippag = null, Valorrectot = null');
          SQL.Add('where ANOLANC = ' + qryTitulosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + qryTitulosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

        ShowInformation('Registro(s) de baixa(s) de t�tulo removido(s) com sucesso.');
      end;
    end;
  end;
end;

procedure TfrmGeOS.dbgFormaPagtoEnter(Sender: TObject);
begin
  if ( cdsOSFormaPagto.State in [dsEdit, dsInsert] ) then
    cdsOSFormaPagto.Post;
end;

procedure TfrmGeOS.dbgFormaPagtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cAPagar : Currency;
  iFormPG : Integer;
begin
  // Inserir

  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
  begin
    if not dtsOSFormaPagto.AutoEdit then
      Exit;

    cAPagar := GetTotalValorServicos;
    cAPagar := cAPagar - GetTotalValorFormaPagto;

    cdsOSFormaPagto.Append;
    cdsOSFormaPagtoFORMAPAGTO.Clear;
    cdsOSFormaPagtoCONDICAOPAGTO.Clear;
    cdsOSFormaPagtoVALOR_FPAGTO.Value := cAPagar;
    cdsOSFormaPagtoPAGTO_PRAZO.Value  := FLAG_NAO;

    if InserirFormaPagto(Self, cAPagar) then
      cdsOSFormaPagto.Post
    else
      cdsOSFormaPagto.Cancel;
  end
  else

  // Editar

  if (Shift = [ssCtrl]) and (Key = VK_RETURN) Then
  begin
    if not dtsOSFormaPagto.AutoEdit then
      Exit;

    iFormPG := cdsOSFormaPagtoFORMAPAGTO.AsInteger;

    cAPagar := GetTotalValorServicos;
    cAPagar := cAPagar + cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency;
    cAPagar := cAPagar - GetTotalValorFormaPagto;

    cdsOSFormaPagto.Locate('FORMAPAGTO', iFormPG, []);
    cdsOSFormaPagto.Edit;

    if ( cAPagar > 0.0 ) then
      cdsOSFormaPagtoVALOR_FPAGTO.Value := cAPagar;

    if InserirFormaPagto(Self, cAPagar) then
      cdsOSFormaPagto.Post
    else
      cdsOSFormaPagto.Cancel;
  end
  else

  // Excluir Tudo e reiniciar forma de pagamento

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
  begin
    if not dtsOSFormaPagto.AutoEdit then
      Exit;
      
    if ShowConfirm('Deseja zerar as formas/condi��es de pagamento e colocar a forma/condi��o de pagamento padr�o?') then
      ZerarFormaPagto;
  end;
end;

procedure TfrmGeOS.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaDATA_CADASTRO.Value := GetDateTimeDB;
  IbDtstTabelaDATA_EMISSAO.Value  := GetDateDB;
  IbDtstTabelaEMPRESA.Value       := gUsuarioLogado.Empresa;
  IbDtstTabelaNFS_CNAE.Value      := GetCnaeEmpresa(gUsuarioLogado.Empresa);
  IbDtstTabelaSTATUS.Value        := STATUS_OS_EDT;
  IbDtstTabelaUSUARIO.Value       := gUsuarioLogado.Login;
  // O valor total de custo da OS � atualizado via trigger
  IbDtstTabelaTOTAL_CUSTO.Value    := 0;
  IbDtstTabelaTOTAL_SERVICO.Value  := 0;
  IbDtstTabelaTOTAL_PRODUTO.Value  := 0;
  IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.Value  := 0;
  IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.Value  := 0;
  IbDtstTabelaTOTAL_APROVADO_SERVICO.Value    := 0;
  IbDtstTabelaTOTAL_APROVADO_PRODUTO.Value    := 0;
  IbDtstTabelaTOTAL_DESCONTOS.Value  := 0;
  IbDtstTabelaTOTAL_OS.Value         := 0;
  IbDtstTabelaTOTAL_BRUTO.Value      := 0;
  IbDtstTabelaTOTAL_LIQUIDO.Value    := 0;
  IbDtstTabelaPAGTO_PRAZO.Value      := FLAG_NAO;
  IbDtstTabelaNFS_ENVIADA.Value      := 0;


  if ( gUsuarioLogado.Vendedor > 0 ) then
    IbDtstTabelaVENDEDOR.Value := gUsuarioLogado.Vendedor
  else
    IbDtstTabelaVENDEDOR.Clear;

  IbDtstTabelaCLIENTE.Value  := CONSUMIDOR_FINAL_CODIGO;
  IbDtstTabelaNOME.Value     := CONSUMIDOR_FINAL_NOME;
  IbDtstTabelaNOMEFANT.Value := CONSUMIDOR_FINAL_NOME;
  IbDtstTabelaCNPJ.Value     := CONSUMIDOR_FINAL_CNPJ;

  if (AnsiUpperCase(Trim(IbDtstTabelaNOME.AsString)) <> CONSUMIDOR_FINAL_NOME) then
  begin
    IbDtstTabelaCLIENTE.Clear;
    IbDtstTabelaNOME.Clear;
    IbDtstTabelaNOMEFANT.Clear;
    IbDtstTabelaCNPJ.Clear;
  end;

  IbDtstTabelaNFS_SERIE.Clear;
  IbDtstTabelaNFS_NUMERO.Clear;
  IbDtstTabelaNFS_LOTE.Clear;
  IbDtstTabelaNFS_DATAEMISSAO.Clear;
  IbDtstTabelaNFS_HORAEMISSAO.Clear;
  IbDtstTabelaNFS_CNAE.Clear;
  IbDtstTabelaNFS_NCM.Clear;
  IbDtstTabelaNFS_DESCRICAO_SERVICO.Clear;
end;

function TfrmGeOS.GetTotalValorFormaPagto: Currency;
var
  cReturn : Currency;
begin
  cReturn := 0;

  with cdsOSFormaPagto do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;


    First;
    while not Eof do
    begin
      cReturn := cReturn + cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency;
      Next;
    end;
    First;

    EnableControls;
  end;
  Result := cReturn;
end;

procedure TfrmGeOS.OpcoesImprimirClick(Sender: TObject);
begin
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeOS.btbtnListaClick(Sender: TObject);
begin
  inherited;
  OpcoesImprimirClick(Sender);
end;

procedure TfrmGeOS.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeOS.dtsOSEquipamentosStateChange(Sender: TObject);
begin
  FiltrarTecnicosChange(Sender);

  BtnEquipamentoInserir.Enabled    := ( dtsOSEquipamentos.AutoEdit and (cdsOSEquipamentos.State = dsBrowse) );
  BtnEquipamentoEditar.Enabled     := ( dtsOSEquipamentos.AutoEdit and (cdsOSEquipamentos.State = dsBrowse) and (cdsOSEquipamentos.RecordCount > 0) );
  BtnEquipamentoExcluir.Enabled    := ( dtsOSEquipamentos.AutoEdit and (cdsOSEquipamentos.State = dsBrowse) and (cdsOSEquipamentos.RecordCount > 0) );
  BtnEquipamentoSalvar.Enabled     := ( cdsOSEquipamentos.State in [dsEdit, dsInsert] );
  BtnEquipamentoDevolver.Enabled   := ( dtsOSEquipamentos.AutoEdit and (cdsOSEquipamentos.State = dsBrowse) and (cdsOSEquipamentos.RecordCount > 0) and (cdsOSEquipamentosDEVOLVIDO.AsInteger = 0) );
  dbEquipamentoObservacao.ReadOnly := ( cdsOSEquipamentosDEVOLVIDO.AsInteger = 1 );

  if ( cdsOSEquipamentos.State in [dsEdit, dsInsert] ) then
    if ( pgcServicoDetalhe.ActivePage = TbsEquipamento ) then
      if ( dbEquimanetoDescricao.Visible and dbProduto.Enabled ) then
        dbEquimanetoDescricao.SetFocus;
end;

procedure TfrmGeOS.dtsOSServicosStateChange(Sender: TObject);
begin
  BtnServicoInserir.Enabled := ( dtsOSServicos.AutoEdit and (cdsOSServicos.State = dsBrowse) );
  BtnServicoEditar.Enabled  := ( dtsOSServicos.AutoEdit and (cdsOSServicos.State = dsBrowse) and (cdsOSServicos.RecordCount > 0) );
  BtnServicoExcluir.Enabled := ( dtsOSServicos.AutoEdit and (cdsOSServicos.State = dsBrowse) and (cdsOSServicos.RecordCount > 0) );
  BtnServicoSalvar.Enabled  := ( cdsOSServicos.State in [dsEdit, dsInsert] );

  BtnServicoAprovar.Enabled := ( dtsOSServicos.AutoEdit and (cdsOSServicos.State = dsBrowse) and (cdsOSServicos.RecordCount > 0) );

  if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
    if ( pgcServicoDetalhe.ActivePage = TbsServicoARealizar ) then
      if ( pgcServicoProduto.ActivePage = TbsServico ) then
        if ( dbServico.Visible and dbServico.Enabled ) then
          dbServico.SetFocus;
end;

procedure TfrmGeOS.dtsOSProdutosStateChange(Sender: TObject);
begin
  BtnProdutoInserir.Enabled := ( dtsOSProdutos.AutoEdit and (cdsOSProdutos.State = dsBrowse) );
  BtnProdutoEditar.Enabled  := ( dtsOSProdutos.AutoEdit and (cdsOSProdutos.State = dsBrowse) and (cdsOSProdutos.RecordCount > 0) );
  BtnProdutoExcluir.Enabled := ( dtsOSProdutos.AutoEdit and (cdsOSProdutos.State = dsBrowse) and (cdsOSProdutos.RecordCount > 0) );
  BtnProdutoSalvar.Enabled  := ( cdsOSProdutos.State in [dsEdit, dsInsert] );

  BtnProdutoAprovar.Enabled := ( dtsOSProdutos.AutoEdit and (cdsOSProdutos.State = dsBrowse) and (cdsOSProdutos.RecordCount > 0) );

  if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
    if ( pgcServicoDetalhe.ActivePage = TbsServicoARealizar ) then
      if ( pgcServicoProduto.ActivePage = TbsProduto ) then
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
end;

procedure TfrmGeOS.dtsOSTecnicosStateChange(Sender: TObject);
begin
  FiltrarTecnicosChange(Sender);

  BtnTecnicoInserir.Enabled := ( dtsOSTecnicos.AutoEdit and (cdsOSTecnicos.State = dsBrowse) );
  BtnTecnicoEditar.Enabled  := ( dtsOSTecnicos.AutoEdit and (cdsOSTecnicos.State = dsBrowse) and (cdsOSTecnicos.RecordCount > 0) );
  BtnTecnicoExcluir.Enabled := ( dtsOSTecnicos.AutoEdit and (cdsOSTecnicos.State = dsBrowse) and (cdsOSTecnicos.RecordCount > 0) );
  BtnTecnicoSalvar.Enabled  := ( cdsOSTecnicos.State in [dsEdit, dsInsert] );

  if ( cdsOSTecnicos.State in [dsEdit, dsInsert] ) then
    if ( pgcServicoDetalhe.ActivePage = TbsServicoARealizar ) then
      if ( pgcServicoProduto.ActivePage = TbsTecnico ) then
        if ( dbTecnico.Visible and dbTecnico.Enabled ) then
          dbTecnico.SetFocus;

  dbTecnico.ReadOnly := (cdsOSTecnicos.State = dsEdit);
  
  BtnTecnicoAtualizarComissao.Enabled :=
    (IbDtstTabelaANO.AsInteger > 0) and (IbDtstTabelaSTATUS.AsInteger >= STATUS_OS_APR) and (IbDtstTabelaSTATUS.AsInteger <= STATUS_OS_FAT)
    and (cdsOSTecnicos.State = dsBrowse)
    and (cdsOSTecnicos.RecordCount > 0);
end;

procedure TfrmGeOS.dtsOSEventosStateChange(Sender: TObject);
begin
  FiltrarTecnicosChange(Sender);

  BtnEventoInserir.Enabled  := ( dtsOSEventos.AutoEdit and (cdsOSEventos.State = dsBrowse) );
  BtnEventoEditar.Enabled   := ( dtsOSEventos.AutoEdit and (cdsOSEventos.State = dsBrowse) and (cdsOSEventos.RecordCount > 0) );
  BtnEventoCancelar.Enabled := ( cdsOSEventos.State in [dsEdit, dsInsert] );
  BtnEventoSalvar.Enabled   := ( cdsOSEventos.State in [dsEdit, dsInsert] );

  if ( cdsOSEventos.State in [dsEdit, dsInsert] ) then
    if ( pgcServicoDetalhe.ActivePage = TbsEvento ) then
      if ( dbEventoData.Visible and dbEventoData.Enabled ) then
        dbEventoData.SetFocus;
end;

procedure TfrmGeOS.BtnEquipamentoInserirClick(Sender: TObject);
begin
  if ( cdsOSEquipamentos.Active ) then
  begin
    cdsOSEquipamentos.Append;

    if ( dbEquimanetoDescricao.Visible and dbEquimanetoDescricao.Enabled ) then
      dbEquimanetoDescricao.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnEquipamentoEditarClick(Sender: TObject);
begin
  if ( cdsOSEquipamentos.RecordCount > 0 ) then
  begin
    if IbDtstTabelaSTATUS.AsInteger > STATUS_OS_ABR then
    begin
      ShowWarning('Este registro n�o poder� ser mais alterado');
      Abort;
    end;

    cdsOSEquipamentos.Edit;

    if ( dbEquimanetoDescricao.Visible and dbEquimanetoDescricao.Enabled ) then
      dbEquimanetoDescricao.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnEquipamentoExcluirClick(Sender: TObject);
var
  SQLDeleteEquipamento : TStringList;
begin
  if ( cdsOSEquipamentos.RecordCount > 0 ) then
  begin
    if IbDtstTabelaSTATUS.AsInteger > STATUS_OS_ABR then
    begin
      ShowWarning('Este registro n�o poder� ser mais exclu�do');
      Abort;
    end;

    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    try
      SQLDeleteEquipamento := TStringList.Create;
      SQLDeleteEquipamento.Clear;

      SQLDeleteEquipamento.Add('Delete from TBCLIENTE_EQUIPAMENTO e');
      SQLDeleteEquipamento.Add('where e.codigo = ' + cdsOSEquipamentosEQUIPAMENTO.AsString);
      SQLDeleteEquipamento.Add('  and e.codigo not in (');
      SQLDeleteEquipamento.Add('    Select');
      SQLDeleteEquipamento.Add('      o.equipamento');
      SQLDeleteEquipamento.Add('    from TBOS_EQUIPAMENTO o');
      SQLDeleteEquipamento.Add('    where not (o.ano = ' + cdsOSEquipamentosANO.AsString + ' and o.controle = ' + cdsOSEquipamentosCONTROLE.AsString + ')');
      SQLDeleteEquipamento.Add('  )');

      cdsOSEquipamentos.Delete;
    finally
      SQLDeleteEquipamento.Free;
    end;
  end;
end;

procedure TfrmGeOS.BtnEquipamentoSalvarClick(Sender: TObject);
begin
  if ( cdsOSEquipamentos.State in [dsEdit, dsInsert] ) then
  begin

    if ( cdsOSEquipamentosEQUIPAMENTO.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar/selecionar o equipamento do cliente.');
      dbEquimanetoDescricao.SetFocus;
    end
    else
    if ( pnlEquipamentoEntrega.Visible and (cdsOSEquipamentosTECNICO.AsInteger = 0) ) then
    begin
      ShowWarning('Favor selecionar a pessoa respons�vel pela devolu��o do �tem ao cliente.');
      dbEquipamentoTecnicoEntrega.SetFocus;
    end
    else
    begin
      cdsOSEquipamentos.Post;

      if BtnEquipamentoInserir.Visible and BtnEquipamentoInserir.Enabled and (IbDtstTabelaSTATUS.AsInteger < STATUS_OS_AVL) then
        BtnEquipamentoInserir.SetFocus
      else
        dbgEquipamentos.SetFocus;  
    end;
  end;
end;

procedure TfrmGeOS.BtnEquipamentoDevolverClick(Sender: TObject);
begin
  if ( cdsOSEquipamentos.RecordCount > 0 ) then
  begin
    cdsOSEquipamentos.Edit;
    cdsOSEquipamentosDEVOLVIDO.Value    := 1;
    cdsOSEquipamentosDATA_ENTREGA.Value := GetDateDB;
    cdsOSEquipamentosHORA_ENTREGA.Value := GetDateDB;
    cdsOSEquipamentosTECNICO.Value      := gUsuarioLogado.Vendedor;

    pnlEquipamentoEntrega.Visible := True;
    if ( dbEquipamentoTecnicoEntrega.Visible and dbEquipamentoTecnicoEntrega.Enabled ) then
      dbEquipamentoTecnicoEntrega.SetFocus;
  end;
end;

procedure TfrmGeOS.dbEquimanetoDescricaoButtonClick(Sender: TObject);
var
  aEquip : TEquipamentoCliente;
begin
  if ( IbDtstTabelaCLIENTE.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o cliente para a OS.');
    dbCliente.SetFocus;
    Abort;
  end;

  if ( cdsOSEquipamentos.State in [dsEdit, dsInsert] ) then
    if SelecionarEquipamento(Self, IbDtstTabelaCLIENTE.AsInteger, aEquip) then
    begin
      cdsOSEquipamentosEQUIPAMENTO.AsInteger := aEquip.Codigo;
      cdsOSEquipamentosTIPO.AsString         := aEquip.TipoDescr;
      cdsOSEquipamentosDESCRICAO.AsString    := aEquip.Descricao;
      cdsOSEquipamentosMARCA.AsString        := aEquip.Marca;
      cdsOSEquipamentosMODELO.AsString       := aEquip.Modelo;
      cdsOSEquipamentosREFERENCIA.AsString   := aEquip.Referencia;
      cdsOSEquipamentosSERIAL.AsString       := aEquip.Serial;

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
        IbDtstTabela.Edit;

      IbDtstTabelaCLIENTE.AsInteger := aEquip.Cliente;
      IbDtstTabelaNOME.AsString     := GetClienteNome(aEquip.Cliente);
      IbDtstTabelaNOMEFANT.AsString := GetClienteNome(aEquip.Cliente);
      IbDtstTabelaCNPJ.AsString     := GetClienteCnpfCpf(aEquip.Cliente);
    end;
end;

procedure TfrmGeOS.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sIE   ,
  sNome : String;
  bBloqueado : Boolean;
  sBloqueado : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sIE, sNome, bBloqueado, sBloqueado) ) then
    begin
      if bBloqueado then
      begin
        ShowWarning('Cliente selecionado se encontra bloqueado!' + #13#13 + 'Motivo:' + #13 + sBloqueado);

        IbDtstTabelaBLOQUEADO.AsInteger       := 1;
        IbDtstTabelaBLOQUEADO_MOTIVO.AsString := sBloqueado;
      end
      else
      begin
        IbDtstTabelaBLOQUEADO.AsInteger       := 0;
        IbDtstTabelaBLOQUEADO_MOTIVO.AsString := EmptyStr;
      end;

      IbDtstTabelaCLIENTE.AsInteger := iCodigo;
      IbDtstTabelaCNPJ.AsString     := sCNPJ;
      IbDtstTabelaNOME.AsString     := sNome;
      IbDtstTabelaNOMEFANT.AsString := sNome;

      IbDtstTabelaDADOS_ENTREGA.AsString :=
        '* Respons�vel pelo(s) servi�o(s)..: ' + #13 +
        '* Endere�o de entrega/realiza��o..: ' + #13 + GetClienteEndereco(IbDtstTabelaCLIENTE.AsInteger, True);
    end;
end;

procedure TfrmGeOS.dbCnaeButtonClick(Sender: TObject);
var
  sCodigo    ,
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCNAE(Self, sCodigo, sDescricao) ) then
      IbDtstTabelaNFS_CNAE.AsString := sCodigo;
end;

procedure TfrmGeOS.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      STATUS_OS_EDT : Text := 'Em edi��o';
      STATUS_OS_ABR : Text := 'Aberta';
      STATUS_OS_AVL : Text := 'Em avalia��o';
      STATUS_OS_PAR : Text := 'Parecer';
      STATUS_OS_APR : Text := 'Aprovada';
      STATUS_OS_ATE : Text := 'Em atendimento';
      STATUS_OS_FIN : Text := 'Finalizada';
      STATUS_OS_FAT : Text := 'Faturada';
      STATUS_OS_NFS : Text := 'NF Emitida';
      STATUS_OS_CAN : Text := 'Cancelada';
    end;
end;

procedure TfrmGeOS.dbNCMButtonClick(Sender: TObject);
var
  iIndice    : Integer;
  sCodigo    ,
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCodigoIBPT(Self, tIbptServicos, iIndice, sCodigo, sDescricao) ) then
      IbDtstTabelaNFS_NCM.AsString := sCodigo;
end;

procedure TfrmGeOS.BtnServicoInserirClick(Sender: TObject);
var
  iSequencial : Integer;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSServicos.Active ) then
  begin
    GerarSequencial(cdsOSServicos, 'SEQ', iSequencial);

    cdsOSServicos.Append;
    cdsOSServicosSEQ.Value := iSequencial;

    if ( dbServico.Visible and dbServico.Enabled ) then
      dbServico.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnServicoEditarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSServicos.RecordCount > 0 ) then
  begin
    cdsOSServicos.Edit;

    if ( dbServico.Visible and dbServico.Enabled ) then
      dbServico.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnServicoExcluirClick(Sender: TObject);

  procedure GetToTais(var pTotalBruto, pDescontos, pTotalLiquido : Currency);
  var
    Item : Integer;
  begin
    // Varrer Servi�os
    Item          := cdsOSServicosSEQ.AsInteger;
    pTotalBruto   := 0.0;
    pDescontos    := 0.0;
    pTotalLiquido := 0.0;

    cdsOSServicos.First;

    while not cdsOSServicos.Eof do
    begin
      pTotalBruto   := pTotalBruto   + cdsOSServicosTOTAL_BRUTO.AsCurrency;
      pDescontos    := pDescontos    + cdsOSServicosTOTAL_DESCONTO.AsCurrency;
      pTotalLiquido := pTotalLiquido + cdsOSServicosTOTAL_LIQUIDO.AsCurrency;

      cdsOSServicos.Next;
    end;

    cdsOSServicos.Locate('SEQ', Item, []);

    // Varrer Produtos
    Item := cdsOSProdutosSEQ.AsInteger;

    cdsOSProdutos.First;

    while not cdsOSProdutos.Eof do
    begin
      pTotalLiquido := pTotalLiquido + cdsOSProdutosTOTAL_LIQUIDO.AsCurrency;

      cdsOSProdutos.Next;
    end;

    cdsOSProdutos.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalLiquido : Currency;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSServicos.RecordCount > 0 ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    begin
      cdsOSServicos.Delete;

      GetToTais(cTotalBruto, cDescontos, cTotalLiquido);

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
        IbDtstTabela.Edit;

      IbDtstTabelaTOTAL_SERVICO.AsCurrency            := cTotalBruto;
      IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency := cDescontos;

      // O valor total de custo da OS � atualizado via trigger
      IbDtstTabelaTOTAL_BRUTO.AsCurrency     := IbDtstTabelaTOTAL_SERVICO.AsCurrency + IbDtstTabelaTOTAL_PRODUTO.AsCurrency;
      IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency + IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency;
      IbDtstTabelaTOTAL_LIQUIDO.AsCurrency   := IbDtstTabelaTOTAL_BRUTO.AsCurrency - IbDtstTabelaTOTAL_DESCONTOS.AsCurrency;
      IbDtstTabelaTOTAL_OS.AsCurrency        := cTotalLiquido;

      if ( IbDtstTabelaTOTAL_SERVICO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_SERVICO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_OS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_OS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_BRUTO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_BRUTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_LIQUIDO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_LIQUIDO.AsCurrency := 0;
    end;
end;

procedure TfrmGeOS.BtnServicoSalvarClick(Sender: TObject);

  procedure GetTotais(var pTotalBruto, pDescontos, pTotalLiquido : Currency);
  var
    Item : Integer;
  begin
    // Varrer Servi�os
    Item          := cdsOSServicosSEQ.AsInteger;
    pTotalBruto   := 0.0;
    pDescontos    := 0.0;
    pTotalLiquido := 0.0;

    cdsOSServicos.DisableControls;
    cdsOSServicos.First;

    while not cdsOSServicos.Eof do
    begin
      pTotalBruto   := pTotalBruto   + cdsOSServicosTOTAL_BRUTO.AsCurrency;
      pDescontos    := pDescontos    + cdsOSServicosTOTAL_DESCONTO.AsCurrency;
      pTotalLiquido := pTotalLiquido + cdsOSServicosTOTAL_LIQUIDO.AsCurrency;

      cdsOSServicos.Next;
    end;

    cdsOSServicos.Locate('SEQ', Item, []);
    cdsOSServicos.EnableControls;

    // Varrer Produtos
    Item := cdsOSProdutosSEQ.AsInteger;

    cdsOSProdutos.DisableControls;
    cdsOSProdutos.First;

    while not cdsOSProdutos.Eof do
    begin
      pTotalLiquido := pTotalLiquido + cdsOSProdutosTOTAL_LIQUIDO.AsCurrency;

      cdsOSProdutos.Next;
    end;

    cdsOSProdutos.Locate('SEQ', Item, []);
    cdsOSProdutos.EnableControls;
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalLiquido : Currency;
begin
  if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
  begin

    if ( cdsOSServicosSERVICO.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar/selecionar o Servi�o.');
      dbServico.SetFocus;
    end
    else
    if ( cdsOSServicosQTDE.AsCurrency <= 0 ) then
    begin
      ShowWarning('Favor informar a Quantidade.');
      dbServicoQuantidade.SetFocus;
    end
    else
    if ( cdsOSServicosPUNIT.AsCurrency < 0 ) then
    begin
      ShowWarning('Favor informar o Valor Unit�rio.');
      dbServicoValorUnit.SetFocus;
    end
    else
//    if ( (cdsOSServicosDESCONTO.AsCurrency < 0) or (cdsOSServicosDESCONTO.AsCurrency > 100) ) then
//    begin
//      ShowWarning('Percentual de desconto inv�lido.');
//      dbServicoDesconto.SetFocus;
//    end
//    else
    if ( (cdsOSServicosDESCONTO.AsCurrency > GetLimiteDescontoUser) and (cdsOSServicosPUNIT_PROMOCAO.AsCurrency = 0) ) then
    begin
      ShowWarning('Limite de Desconto = ' + FormatFloat('0.00', GetLimiteDescontoUser) + '%');
      dbServicoDesconto.SetFocus;
    end
    else
    begin
      if ( cdsOSServicosDESCONTO.AsCurrency < 0 ) then
      begin
        cdsOSServicosDESCONTO.AsCurrency       := 0.0;
        cdsOSServicosDESCONTO_VALOR.AsCurrency := 0.0;
      end;

      cdsOSServicos.Post;

      GetTotais(cTotalBruto, cDescontos, cTotalLiquido);

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
        IbDtstTabela.Edit;

      IbDtstTabelaTOTAL_SERVICO.AsCurrency            := cTotalBruto;
      IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency := cDescontos;

      // O valor total de custo da OS � atualizado via trigger
      IbDtstTabelaTOTAL_BRUTO.AsCurrency     := IbDtstTabelaTOTAL_SERVICO.AsCurrency + IbDtstTabelaTOTAL_PRODUTO.AsCurrency;
      IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency + IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency;
      IbDtstTabelaTOTAL_LIQUIDO.AsCurrency   := IbDtstTabelaTOTAL_BRUTO.AsCurrency - IbDtstTabelaTOTAL_DESCONTOS.AsCurrency;
      IbDtstTabelaTOTAL_OS.AsCurrency        := cTotalLiquido;

      if ( IbDtstTabelaTOTAL_SERVICO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_SERVICO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_OS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_OS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_BRUTO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_BRUTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_LIQUIDO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_LIQUIDO.AsCurrency := 0;

      if BtnServicoInserir.Visible and BtnServicoInserir.Enabled then
        BtnServicoInserir.SetFocus;
    end;
  end;
end;

procedure TfrmGeOS.CarregarDadosEmpresa(const pEmpresa,
  pTituloRelatorio: String);
begin
  try
    DMNFe.AbrirEmitente(pEmpresa);
    DMBusiness.ConfigurarEmail(pEmpresa, EmptyStr, pTituloRelatorio, EmptyStr);
  except
  end;
end;

procedure TfrmGeOS.CarregarDadosServicoProduto(const pDataSet : TIBDataSet;
  pCodigo: String; pTipo: TAliquota; const ApenasValidar: Boolean = FALSE);
begin
  if ( (Trim(pCodigo) = EmptyStr) or (pCodigo = '0') ) then
  begin
    if ( pTipo = taISS ) then
      ShowWarning('Favor informar o c�digo do servi�o')
    else
    if ( pTipo = taICMS ) then
      ShowWarning('Favor informar o c�digo do produto');

    Exit;
  end;

  if ( not pDataSet.Active ) then
    Exit
  else
  if ( pDataSet.State in [dsEdit, dsInsert] ) then
  begin
    with fdQryServicoProduto do
    begin
      Close;
      ParamByName('codigo').AsInteger := StrToInt(pCodigo);;
      ParamByName('tipo').AsInteger   := Ord(pTipo);
      Open;

      if not ApenasValidar then
        if (RecordCount > 0) then
        begin

          pDataSet.FieldByName('DESCRI').AsString              := FieldByName('descri').AsString;
          pDataSet.FieldByName('DESCRI_APRESENTACAO').AsString := FieldByName('descri_apresentacao').AsString;
          pDataSet.FieldByName('UNIDADE').AsInteger            := FieldByName('codunidade').AsInteger;
          pDataSet.FieldByName('UNP_SIGLA').AsString           := FieldByName('unp_sigla').AsString;
          pDataSet.FieldByName('CUSTO').AsCurrency             := FieldByName('customedio').AsCurrency;
          pDataSet.FieldByName('PUNIT').AsCurrency             := IfThen(FieldByName('preco').AsCurrency > 0.0, FieldByName('preco').AsCurrency, FieldByName('customedio').AsCurrency);
          pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency    := FieldByName('preco_Promocao').AsCurrency;
          pDataSet.FieldByName('ALIQUOTA').AsCurrency          := FieldByName('aliquota').AsCurrency;

          if ( pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
          begin
            pDataSet.FieldByName('DESCONTO_VALOR').AsCurrency := pDataSet.FieldByName('PUNIT').AsCurrency - pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency;
            pDataSet.FieldByName('DESCONTO').AsCurrency       := pDataSet.FieldByName('DESCONTO_VALOR').AsCurrency / pDataSet.FieldByName('PUNIT').AsCurrency * 100;
          end;

          if ( pTipo = taISS ) then
          begin
            pDataSet.FieldByName('SERVICO').AsString := FieldByName('cod').AsString;

            dbServicoDesconto.ReadOnly      := (pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0);
            dbServicoTotalDesconto.ReadOnly := (pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0);
          end
          else
          if ( pTipo = taICMS ) then
          begin
            pDataSet.FieldByName('PRODUTO').AsString := FieldByName('cod').AsString;
            
            dbProdutoDesconto.ReadOnly      := (pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0);
            dbProdutoTotalDesconto.ReadOnly := (pDataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0);
          end;

        end
        else
        begin
          if ( pTipo = taISS ) then
            ShowWarning('C�digo do servi�o n�o cadastrado!')
          else
          if ( pTipo = taICMS ) then
            ShowWarning('C�digo do produto n�o cadastrado!');

          if ( pTipo = taISS ) then
          begin

            pDataSet.FieldByName('servico').Clear;

            if ( dbServico.Visible and dbServico.Enabled ) then
              dbServico.SetFocus;

          end
          else
          if ( pTipo = taICMS ) then
          begin

            pDataSet.FieldByName('produto').Clear;
            
            if ( dbProduto.Visible and dbProduto.Enabled ) then
              dbProduto.SetFocus;
              
          end;
        end;
    end;
  end;
end;

procedure TfrmGeOS.dbServicoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigoAlfa,
  sNome   ,
  sUnidade,
  sNCM_SH ,
  sCST    : String;
  iUnidade,
  iCNAE   : Integer;
  cAliquota      ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cValorVenda    ,
  cValorPromocao : Currency;
begin
  cValorPromocao := 0;

  if ( cdsOSServicos.State in [dsEdit, dsInsert] ) then
    if ( SelecionarServicoParaEntrada(Self,
      iCodigo, sCodigoAlfa, sNome, sUnidade, sNCM_SH, sCST, iUnidade, iCNAE,
      cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao) ) then
    begin
      cdsOSServicosSERVICO.AsString := sCodigoAlfa;
      CarregarDadosServicoProduto( cdsOSServicos, sCodigoAlfa, taISS );
    end;
end;

procedure TfrmGeOS.IbDtstTabelaCalcFields(DataSet: TDataSet);
begin
  IbDtstTabelaLegenda.AsInteger := IbDtstTabelaSTATUS.AsInteger;
end;

procedure TfrmGeOS.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if BtnServicoInserir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaInserirServicosID, 'Inser��o/Edi�ao de Servi�os', RotinaID);

    if BtnProdutoInserir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaInserirProdutosID, 'Inser��o/Edi�ao de Produtos', RotinaID);

    if BtnTecnicoInserir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaInserirTecnicosID, 'Inser��o/Edi�ao de T�cnicos', RotinaID);

    if BtnEventoInserir.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaInserirEventosID, 'Inser��o/Edi�ao de Eventos', RotinaID);

    if mnFinalizarEdicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarEdicaoID, mnFinalizarEdicao.Caption, RotinaID);

    if mnIniciarAvaliacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaIniciarAvaliacaoID, mnIniciarAvaliacao.Caption, RotinaID);

    if mnLancarParecer.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaLancarParecerID, mnLancarParecer.Caption, RotinaID);

    if mnAprovarOS.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAprovarOrdemServicoID, mnAprovarOS.Caption, RotinaID);

    if mnLancarAtendimento.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaLancarAtendimentoID, mnLancarAtendimento.Caption, RotinaID);

    if mnFinalizarOS.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarOrdemServicoID, mnFinalizarOS.Caption, RotinaID);

    if mnFaturarOS.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFaturarOrdemServicoID, mnFaturarOS.Caption, RotinaID);

    if btnRegerarTitulo.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarImprimirBoletoID, 'Gerar/Imprimir Boletos', RotinaID);
  end;
end;

procedure TfrmGeOS.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

function TfrmGeOS.GetRotinaInserirServicosID: String;
begin
  Result := GetRotinaInternaID(BtnServicoInserir);
end;

function TfrmGeOS.GetRotinaInserirProdutosID: String;
begin
  Result := GetRotinaInternaID(BtnProdutoInserir);
end;

function TfrmGeOS.GetRotinaInserirTecnicosID: String;
begin
  Result := GetRotinaInternaID(BtnTecnicoInserir);
end;

function TfrmGeOS.GetRotinaInserirEventosID: String;
begin
  Result := GetRotinaInternaID(BtnEventoInserir);
end;

procedure TfrmGeOS.BtnProdutoInserirClick(Sender: TObject);
var
  iSequencial : Integer;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSProdutos.Active ) then
  begin
    GerarSequencial(cdsOSProdutos, 'SEQ', iSequencial);

    cdsOSProdutos.Append;
    cdsOSProdutosSEQ.Value := iSequencial;

    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnProdutoEditarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSProdutos.RecordCount > 0 ) then
  begin
    cdsOSProdutos.Edit;

    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnProdutoExcluirClick(Sender: TObject);

  procedure GetToTais(var pTotalBruto, pDescontos, pTotalLiquido, pTotalOS : Currency);
  var
    Item : Integer;
  begin
    // Varrer Produtos
    Item          := cdsOSProdutosSEQ.AsInteger;
    pTotalBruto   := 0.0;
    pDescontos    := 0.0;
    pTotalLiquido := 0.0;
    pTotalOS      := 0.0;

    cdsOSProdutos.First;

    while not cdsOSProdutos.Eof do
    begin
      pTotalBruto   := pTotalBruto   + cdsOSProdutosTOTAL_BRUTO.AsCurrency;
      pDescontos    := pDescontos    + cdsOSProdutosTOTAL_DESCONTO.AsCurrency;
      pTotalLiquido := pTotalLiquido + cdsOSProdutosTOTAL_LIQUIDO.AsCurrency;

      if (cdsOSProdutosAPROVADO.AsInteger = 1) then
        pTotalOS := pTotalOS + cdsOSProdutosTOTAL_LIQUIDO.AsCurrency;

      cdsOSProdutos.Next;
    end;

    cdsOSProdutos.Locate('SEQ', Item, []);

    // Varrer Servi�os
    Item := cdsOSServicosSEQ.AsInteger;

    cdsOSServicos.First;

    while not cdsOSServicos.Eof do
    begin
      pTotalOS := pTotalOS + cdsOSServicosTOTAL_LIQUIDO.AsCurrency;

      cdsOSServicos.Next;
    end;

    cdsOSServicos.Locate('SEQ', Item, []);
  end;

var
  cDescontos   ,
  cTotalBruto  ,
  cTotalLiquido,
  cTotalOS     : Currency;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSProdutos.RecordCount > 0 ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    begin
      cdsOSProdutos.Delete;

      GetToTais(cTotalBruto, cDescontos, cTotalLiquido, cTotalOS);

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
        IbDtstTabela.Edit;

      IbDtstTabelaTOTAL_PRODUTO.AsCurrency            := cTotalBruto;
      IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency := cDescontos;

      // O valor total de custo da OS � atualizado via trigger
      IbDtstTabelaTOTAL_BRUTO.AsCurrency     := IbDtstTabelaTOTAL_SERVICO.AsCurrency + IbDtstTabelaTOTAL_PRODUTO.AsCurrency;
      IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency + IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency;
      IbDtstTabelaTOTAL_LIQUIDO.AsCurrency   := IbDtstTabelaTOTAL_BRUTO.AsCurrency - IbDtstTabelaTOTAL_DESCONTOS.AsCurrency;
      IbDtstTabelaTOTAL_OS.AsCurrency        := cTotalOS;

      if ( IbDtstTabelaTOTAL_PRODUTO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_PRODUTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_OS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_OS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_BRUTO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_BRUTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_LIQUIDO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_LIQUIDO.AsCurrency := 0;
    end;
end;

procedure TfrmGeOS.BtnProdutoSalvarClick(Sender: TObject);

  procedure GetTotais(var pTotalBruto, pDescontos, pTotalLiquido, pTotalOS : Currency);
  var
    Item : Integer;
  begin
    // Varrer Produtos
    Item          := cdsOSProdutosSEQ.AsInteger;
    pTotalBruto   := 0.0;
    pDescontos    := 0.0;
    pTotalLiquido := 0.0;
    pTotalOS      := 0.0;

    cdsOSProdutos.DisableControls;
    cdsOSProdutos.First;

    while not cdsOSProdutos.Eof do
    begin
      pTotalBruto   := pTotalBruto   + cdsOSProdutosTOTAL_BRUTO.AsCurrency;
      pDescontos    := pDescontos    + cdsOSProdutosTOTAL_DESCONTO.AsCurrency;
      pTotalLiquido := pTotalLiquido + cdsOSProdutosTOTAL_LIQUIDO.AsCurrency;

      if (cdsOSProdutosAPROVADO.AsInteger = 1) then
        pTotalOS := pTotalOS + cdsOSProdutosTOTAL_LIQUIDO.AsCurrency;

      cdsOSProdutos.Next;
    end;

    cdsOSProdutos.Locate('SEQ', Item, []);
    cdsOSProdutos.EnableControls;

    // Varrer Servi�os
    Item := cdsOSServicosSEQ.AsInteger;

    cdsOSServicos.DisableControls;
    cdsOSServicos.First;

    while not cdsOSServicos.Eof do
    begin
      pTotalOS := pTotalOS + cdsOSServicosTOTAL_LIQUIDO.AsCurrency;

      cdsOSServicos.Next;
    end;

    cdsOSServicos.Locate('SEQ', Item, []);
    cdsOSServicos.EnableControls;
  end;

var
  cDescontos   ,
  cTotalBruto  ,
  cTotalLiquido,
  cTotalOS     : Currency;
begin
  if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
  begin

    if ( cdsOSProdutosPRODUTO.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar/selecionar o Produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsOSProdutosQTDE.AsCurrency <= 0 ) then
    begin
      ShowWarning('Favor informar a Quantidade.');
      dbProdutoQuantidade.SetFocus;
    end
    else
    if ( cdsOSProdutosPUNIT.AsCurrency < 0 ) then
    begin
      ShowWarning('Favor informar o Valor Unit�rio.');
      dbProdutoValorUnit.SetFocus;
    end
    else
//    if ( (cdsOSProdutosDESCONTO.AsCurrency < 0) or (cdsOSProdutosDESCONTO.AsCurrency > 100) ) then
//    begin
//      ShowWarning('Percentual de desconto inv�lido.');
//      dbProdutoDesconto.SetFocus;
//    end
//    else
    if ( (cdsOSProdutosDESCONTO.AsCurrency > GetLimiteDescontoUser) and (cdsOSProdutosPUNIT_PROMOCAO.AsCurrency = 0) ) then
    begin
      ShowWarning('Limite de Desconto = ' + FormatFloat('0.00', GetLimiteDescontoUser) + '%');
      dbProdutoDesconto.SetFocus;
    end
    else
    begin
      if ( cdsOSProdutosDESCONTO.AsCurrency < 0 ) then
      begin
        cdsOSProdutosDESCONTO.AsCurrency       := 0.0;
        cdsOSProdutosDESCONTO_VALOR.AsCurrency := 0.0;
      end;

      cdsOSProdutos.Post;

      GetTotais(cTotalBruto, cDescontos, cTotalLiquido, cTotalOS);

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
        IbDtstTabela.Edit;

      IbDtstTabelaTOTAL_PRODUTO.AsCurrency            := cTotalBruto;
      IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency := cDescontos;

      // O valor total de custo da OS � atualizado via trigger
      IbDtstTabelaTOTAL_BRUTO.AsCurrency     := IbDtstTabelaTOTAL_SERVICO.AsCurrency + IbDtstTabelaTOTAL_PRODUTO.AsCurrency;
      IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := IbDtstTabelaTOTAL_DESCONTOS_SERVICOS.AsCurrency + IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency;
      IbDtstTabelaTOTAL_LIQUIDO.AsCurrency   := IbDtstTabelaTOTAL_BRUTO.AsCurrency - IbDtstTabelaTOTAL_DESCONTOS.AsCurrency;
      IbDtstTabelaTOTAL_OS.AsCurrency        := cTotalOS;

      if ( IbDtstTabelaTOTAL_PRODUTO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_PRODUTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_OS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_OS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_BRUTO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_BRUTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_DESCONTOS.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_DESCONTOS.AsCurrency := 0;

      if ( IbDtstTabelaTOTAL_LIQUIDO.AsCurrency < 0 ) then
        IbDtstTabelaTOTAL_LIQUIDO.AsCurrency := 0;

      if BtnProdutoInserir.Visible and BtnProdutoInserir.Enabled then
        BtnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TfrmGeOS.BtnTecnicoInserirClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSTecnicos.Active ) then
  begin
    cdsOSTecnicos.Append;
    cdsOSTecnicosTECNICO.Clear;

    if ( dbTecnico.Visible and dbTecnico.Enabled ) then
      dbTecnico.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnTecnicoEditarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSTecnicos.RecordCount > 0 ) then
  begin
    cdsOSTecnicos.Edit;

    if ( dbTecnico.Visible and dbTecnico.Enabled ) then
      dbTecnico.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnTecnicoExcluirClick(Sender: TObject);
begin
  if ( cdsOSTecnicos.RecordCount > 0 ) then
    if ( ShowConfirm('Deseja excluir o registro de t�cnico selecionado?') ) then
      cdsOSTecnicos.Delete;
end;

procedure TfrmGeOS.BtnTecnicoSalvarClick(Sender: TObject);
begin
  if ( cdsOSTecnicos.State in [dsEdit, dsInsert] ) then
  begin

    if ( cdsOSTecnicosTECNICO.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar/selecionar o t�cnico.');
      dbTecnico.SetFocus;
    end
    else
    begin
      if ( cdsOSTecnicosCOMISSAO_TIPO_LANC.AsInteger = 0 ) then // Por Percentual (%)
        cdsOSTecnicosCOMISSAO_VALOR.AsCurrency      := 0.0
      else
      if ( cdsOSTecnicosCOMISSAO_TIPO_LANC.AsInteger = 1 ) then // Por Valor (R$)
        cdsOSTecnicosCOMISSAO_PERCENTUAL.AsCurrency := 0.0;

      if ( cdsOSTecnicosCOMISSAO_PERCENTUAL.AsCurrency < 0 ) then
        cdsOSTecnicosCOMISSAO_PERCENTUAL.AsCurrency := 0.0;
        
      if ( cdsOSTecnicosCOMISSAO_VALOR.AsCurrency < 0 ) then
        cdsOSTecnicosCOMISSAO_VALOR.AsCurrency := 0.0;

      cdsOSTecnicosNOME.AsString := dbTecnico.Text;  
      cdsOSTecnicos.Post;

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
        cdsOSTecnicos.ApplyUpdates;

      if BtnTecnicoInserir.Visible and BtnTecnicoInserir.Enabled then
        BtnTecnicoInserir.SetFocus;
    end;
  end;
end;

procedure TfrmGeOS.btnTituloEditarClick(Sender: TObject);
begin
//  if ( not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FIN, STATUS_OS_FAT]) ) then
//    ShowWarning('� permitida a edi��o de t�tulos apenas para ordens de servi�os finalizadas ou faturadas')
  if ( not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FAT]) ) then
    ShowWarning('� permitida a edi��o de t�tulos apenas para ordens de servi�os faturadas')
  else
  if ( qryTitulos.IsEmpty ) then
    ShowWarning('N�o existe(m) t�tulo(s) gerado(s) para esta venda')
  else
  if ( IbDtstTabelaPAGTO_PRAZO.AsInteger = FLAG_SIM ) then
  begin
    if ( TitulosConfirmados(Self, IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, IbDtstTabelaDATA_FATURA.AsDateTime, GetTotalValorFormaPagto_APrazo) ) then
      AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeOS.dtsOSTecnicosDataChange(Sender: TObject; Field: TField);
begin
  if ( cdsOSTecnicos.State in [dsEdit, dsInsert] ) then
    if ( Field = cdsOSTecnicosCOMISSAO_TIPO_LANC ) then
    begin
      dbTecnicoPercentualComissao.ReadOnly := (cdsOSTecnicosCOMISSAO_TIPO_LANC.AsInteger = 1); // Quando a comiss�o for por Valor (R$)
      dbTecnicoValorComissao.ReadOnly      := (cdsOSTecnicosCOMISSAO_TIPO_LANC.AsInteger = 0); // Quando a comiss�o for por Percentual (%)
    end;
end;

procedure TfrmGeOS.BtnTecnicoAtualizarComissaoClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( ShowConfirm('Deseja recalcular os valores (R$) de comiss�o de acordo com os percentuais informados?') ) then
    CalcularValorComissao;
end;

procedure TfrmGeOS.CalcularValorComissao;
var
  cValorServico : Currency;
begin
  cdsOSTecnicos.DisableControls;
  try
    cValorServico := GetTotalValorServicos;

    if ( cdsOSTecnicos.Active ) then
    begin
      cdsOSTecnicos.First;
      while not cdsOSTecnicos.Eof do
      begin
        if ( cdsOSTecnicosCOMISSAO_TIPO_LANC.AsInteger = 0 ) then // Comiss�o por Percentual (%)
        begin
          cdsOSTecnicos.Edit;
          cdsOSTecnicosCOMISSAO_VALOR.AsCurrency := cValorServico * cdsOSTecnicosCOMISSAO_PERCENTUAL.AsCurrency / 100.0;
          cdsOSTecnicos.Post;
        end;

        cdsOSTecnicos.Next;
      end;

      if (IbDtstTabelaSTATUS.AsInteger >= STATUS_OS_APR) and (IbDtstTabelaSTATUS.AsInteger <= STATUS_OS_FAT) then
        cdsOSTecnicos.ApplyUpdates;
    end;
  finally
    if ( cdsOSTecnicos.Active ) then
      cdsOSTecnicos.First;
      
    cdsOSTecnicos.EnableControls;
  end;
end;

procedure TfrmGeOS.mnFinalizarEdicaoClick(Sender: TObject);
begin
  if not mnFinalizarEdicao.Enabled then
    Exit;
    
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( ShowConfirm('Deseja finalizar a edi��o da Ordem de Servi�o (OS)?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value  := STATUS_OS_ABR;
    IbDtstTabelaUSUARIO.Value := gUsuarioLogado.Login;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    GravarEventoAutomatico('Finaliza��o da Edi��o', 
      Format('* Edi��o da Ordem de Servi�o finalizada por %s em %s �s %s.', [
        gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

    HabilitarDesabilitar_Btns;
  end;
end;

function TfrmGeOS.GetRotinaFinalizarEdicaoID: String;
begin
  Result := GetRotinaInternaID(mnFinalizarEdicao);
end;

procedure TfrmGeOS.dbgEventosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Impede a exclus�o de um registro em um DBGRID atrav�s das teclas CTRL+DEL
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_DEL) Then
    Key := 0;
end;

procedure TfrmGeOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Sender = dbgEventos ) then
    if (Shift = [ssCtrl]) and (Key = SYS_KEY_DEL) Then
      Key := 0;

  if (pgcGuias.ActivePage = tbsTabela) then
    if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
      pnlLegendas.Visible := True;

  // Inserir

  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    Case pgcServicoFinalizar.ActivePageIndex of
      0 : dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1 : dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else

  // Editar

  if (Shift = [ssCtrl]) and (Key = VK_RETURN) Then
    Case pgcServicoFinalizar.ActivePageIndex of
      0 : dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1 : dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else

  // Excluir Tudo e reiniciar forma de pagamento

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
    Case pgcServicoFinalizar.ActivePageIndex of
      0: dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1: dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else
  if ( Key = VK_F6 ) then
    btnConsultarServico.Click
  else
  // Desistir na inser��o de um novo equipamento, produto/servi�o e ou t�cnico
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) ) then
  begin
    Case pgcServicoDetalhe.ActivePageIndex of
      0 : // Equipamento(s)
        begin
          if ( (cdsOSEquipamentos.State in [dsEdit, dsInsert]) and (Trim(dbEquimanetoDescricao.Text) = EmptyStr) ) then
            cdsOSEquipamentos.Cancel
          else
            inherited;
        end;

      1 : // Servi�o(s) a realizar
        begin
          Case pgcServicoProduto.ActivePageIndex of
            0 : // Servi�os
              if ( (cdsOSServicos.State in [dsEdit, dsInsert]) and (Trim(dbServico.Text) = EmptyStr) ) then
                cdsOSServicos.Cancel
              else
                inherited;
            1 : // Produtos
              if ( (cdsOSProdutos.State in [dsEdit, dsInsert]) and (Trim(dbProduto.Text) = EmptyStr) ) then
                cdsOSProdutos.Cancel
              else
                inherited;
            2 : // T�cnicos
              if ( (cdsOSTecnicos.State in [dsEdit, dsInsert]) and (Trim(dbTecnico.Text) = EmptyStr) ) then
                cdsOSTecnicos.Cancel
              else
                inherited;
            else
              inherited;
          end;
        end;

      else
        inherited;
    end;
  end
  else
    inherited;
end;

procedure TfrmGeOS.BtnEventoInserirClick(Sender: TObject);
var
  iSequencial : Integer;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSEventos.Active ) then
  begin
    GerarSequencial(cdsOSEventos, 'SEQUENCIAL', iSequencial);

    cdsOSEventos.Append;
    cdsOSEventosSEQUENCIAL.Value := iSequencial;

    if ( dbEventoData.Visible and dbEventoData.Enabled ) then
      dbEventoData.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnEventoEditarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( cdsOSEventos.RecordCount > 0 ) then
  begin
    if ( Copy(cdsOSEventosEVENTO.AsString, 1, 1) = '*' ) then
    begin
      ShowWarning('Este evento n�o poder� ser alterado!');
      Abort;
    end;

    cdsOSEventos.Edit;

    if ( dbEventoData.Visible and dbEventoData.Enabled ) then
      dbEventoData.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnEventoCancelarClick(Sender: TObject);
begin
  if ( cdsOSEventos.State in [dsEdit, dsInsert] ) then
  begin
    cdsOSEventos.Cancel;

    if ( BtnEventoInserir.Visible and BtnEventoInserir.Enabled ) then
      BtnEventoInserir.SetFocus;
  end;
end;

procedure TfrmGeOS.BtnEventoSalvarClick(Sender: TObject);
begin
  if ( cdsOSEventos.State in [dsEdit, dsInsert] ) then
  begin

    if ( cdsOSEventosTECNICO.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar/selecionar o t�cnico.');
      dbEventoTecnico.SetFocus;
    end
    else
    if ( Trim(cdsOSEventosDESCRICAO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar a descri��o do evento.');
      dbEventoDescricao.SetFocus;
    end
    else
    begin
      cdsOSEventosTECNICO_NOME.AsString := dbEventoTecnico.Text;
      cdsOSEventos.Post;

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
      begin
        cdsOSEventos.ApplyUpdates;
        CommitTransaction;
      end;

      if ( BtnEventoInserir.Visible and BtnEventoInserir.Enabled ) then
        BtnEventoInserir.SetFocus;
    end;
  end;
end;

procedure TfrmGeOS.GravarEventoAutomatico(pTitulo, pEvento: String; const pImprimir : Boolean);
var
  iSequencial : Integer;
begin
  if not cdsOSEventos.Active then
    AbrirTabelaEventos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

  GerarSequencial(cdsOSEventos, 'SEQUENCIAL', iSequencial);

  cdsOSEventos.Append;
  cdsOSEventosSEQUENCIAL.Value   := iSequencial;
  cdsOSEventosDESCRICAO.AsString := 'Evento Autom�tico - ' + Trim(pTitulo);
  cdsOSEventosEVENTO.AsString    := Trim(pEvento);
  cdsOSEventosIMPRIMIR.AsInteger := IfThen(pImprimir, 1, 0);
  cdsOSEventosTECNICO.Clear;
  cdsOSEventos.Post;

  if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
  begin
    cdsOSEventos.ApplyUpdates;
    CommitTransaction;
  end;
end;

procedure TfrmGeOS.mnIniciarAvaliacaoClick(Sender: TObject);
begin
  if not mnIniciarAvaliacao.Enabled then
    Exit;
    
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( ShowConfirm('Deseja sinalizar que a Ordem de Servi�o (OS) est� em avalia��o?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value := STATUS_OS_AVL;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    GravarEventoAutomatico('Iniciada Avalia��o',
      Format('* Sinaliza��o de in�cio de avalia��o lan�ada por %s em %s �s %s.', [
        gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeOS.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Sender = dbgDados) then
  begin
    // Desenhar ret�ngulo na primeira c�lula da linha

    if (Column.Index = 0) then
      dbgDados.Canvas.Rectangle(Rect.Left - 20, Rect.Top, Rect.Left - 1, Rect.Top + 18);

    with dbgDados.DataSource.DataSet do
    begin
      // Destacar atrazos
      
      if ( (FieldByName('DATA_PREVISAO_CONCLUSAO').AsDateTime < fDataAtual) and (FieldByName('STATUS').AsInteger > STATUS_OS_EDT) and (FieldByName('STATUS').AsInteger < STATUS_OS_FIN) ) then
        dbgDados.Canvas.Brush.Color := lblOSAtrasada.Color;

      // Destacar status
      
      Case FieldByName('STATUS').AsInteger of
        STATUS_OS_EDT :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSEmEdicao.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSEmEdicao.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSEmEdicao.Brush.Style;
            end;
          end;

        STATUS_OS_ABR :
          begin
            dbgDados.Canvas.Font.Color := lblOSAberta.Font.Color;
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSAberta.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSAberta.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSAberta.Brush.Style;
            end;
          end;

        STATUS_OS_AVL :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSAvaliacao.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSAvaliacao.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSAvaliacao.Brush.Style;
            end;
          end;

        STATUS_OS_PAR :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSParecer.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSParecer.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSParecer.Brush.Style;
            end;
          end;

        STATUS_OS_APR :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSAprovada.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSAprovada.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSAprovada.Brush.Style;
            end;
          end;

        STATUS_OS_ATE :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSAtendimento.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSAtendimento.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSAtendimento.Brush.Style;
            end;
          end;

        STATUS_OS_FIN :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSFinalizada.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSFinalizada.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSFinalizada.Brush.Style;
            end;
          end;

        STATUS_OS_FAT :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSFaturada.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSFaturada.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSFaturada.Brush.Style;
            end;
          end;

        STATUS_OS_NFS :
          begin
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Font.Color  := shpOSNFSeEmitida.Brush.Color;
              dbgDados.Canvas.Brush.Color := shpOSNFSeEmitida.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSNFSeEmitida.Brush.Style;
            end;
          end;

        STATUS_OS_CAN :
          begin
            dbgDados.Canvas.Font.Color := lblOSCancelada.Font.Color;
            if (Column.Index = 0) then
            begin
              dbgDados.Canvas.Brush.Color := shpOSCancelada.Brush.Color;
              dbgDados.Canvas.Brush.Style := shpOSCancelada.Brush.Style;
            end;
          end;
      end;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;

  if (Sender = dbgEventos) then
  begin
    with dbgEventos.DataSource.DataSet do
    begin
      if (FieldByName('IMPRIMIR').AsInteger = 0) then
        dbgEventos.Canvas.Font.Color := clRed;
    end;

    dbgEventos.DefaultDrawDataCell(Rect, dbgEventos.Columns[DataCol].Field, State);
  end;

  if (Sender = dbgServicos) then
    if (Column.Field = cdsOSServicosAPROVADO) then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      ImgList.Draw(TDBGrid(Sender).Canvas, Rect.Left + 4, Rect.Top + 1, 43);
      if (Column.Field.AsInteger = 1) then
        ImgList.Draw(TDBGrid(Sender).Canvas, Rect.Left + 4, Rect.Top + 1, 14);
    end;

  if (Sender = dbgProdutos) then
    if (Column.Field = cdsOSProdutosAPROVADO) then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      ImgList.Draw(TDBGrid(Sender).Canvas, Rect.Left + 4, Rect.Top + 1, 43);
      if (Column.Field.AsInteger = 1) then
        ImgList.Draw(TDBGrid(Sender).Canvas, Rect.Left + 4, Rect.Top + 1, 14);
    end;
end;

procedure TfrmGeOS.mnLancarParecerClick(Sender: TObject);
var
  eEvento : TStringList;
begin
  if not mnLancarParecer.Enabled then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  eEvento := TStringList.Create;
  try
    if SetEvento(Self, eEvento) then
    begin
      IbDtstTabela.Edit;

      IbDtstTabelaSTATUS.Value := STATUS_OS_PAR;

      IbDtstTabela.Post;
      IbDtstTabela.ApplyUpdates;

      CommitTransaction;

      GravarEventoAutomatico('Parecer/Diagn�stico',
        '*' + #13 + AnsiUpperCase(Trim(eEvento.Text)) +
        #13#13 + Format('Registrado por %s em %s �s %s.', [
          gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), True);

      HabilitarDesabilitar_Btns;
    end;
  finally
    eEvento.Free;
  end;
end;

procedure TfrmGeOS.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigoAlfa,
  sNome      ,
  sUnidade,
  sNCM_SH ,
  sCST    : String;
  iUnidade,
  iCFOP   : Integer;
  cAliquota       ,
  cAliquotaPIS    ,
  cAliquotaCOFINS ,
  cValorVenda     ,
  cValorPromocao  ,
  cValorIPI       ,
  cPercentualRedBC,
  cValorCusto ,
  cEstoque    ,
  cReserva    : Currency;
begin
  cValorPromocao := 0;

  if ( cdsOSProdutos.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sNome, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP,
      cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercentualRedBC, cValorCusto,
      cEstoque, cReserva    ) ) then
    begin
      cdsOSProdutosPRODUTO.AsString := sCodigoAlfa;
      CarregarDadosServicoProduto( cdsOSProdutos, sCodigoAlfa, taICMS );
    end;
end;

procedure TfrmGeOS.mnAprovarOSClick(Sender: TObject);
begin
(*

  Observa��es:
    1 - Ao gravar a OS com o novo status de "Aprovada", a trigger respons�vel por totalizar o Valor de Aprova��o
        ser� disparada.

*)
  if not mnAprovarOS.Enabled then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  if not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_ABR, STATUS_OS_AVL, STATUS_OS_PAR]) then
  begin
    ShowWarning('Apenas Ordens de Servi�os abertas, com avalia��o ou com parecer t�cnico podem ser aprovadas.');
    Abort;
  end;

  // Verificar a forma e condi��o de pagamentos, quanto ao valor

  if (IbDtstTabelaTOTAL_OS.AsCurrency <> GetTotalValorFormaPagto) then
  begin
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    ShowWarning('O Valor L�quido da OS est� diferente do Total l�quido na Forma/Condi��o de Pagamento.' + #13 + 'Favor corrigir Valores na Forma/Condi��o de Pagamento.');

    if ( dbgFormaPagto.Visible and dbgFormaPagto.Enabled ) then
      dbgFormaPagto.SetFocus;

    Abort;
  end;

  if ( IbDtstTabelaTOTAL_SERVICO.AsCurrency > 0 ) then
    if not ServicosAprovados then
    begin
      ShowWarning('Nenhum servi�o fora marcado como aprovado pelo cliente!');
      Abort;
    end;

  if (gSistema.Codigo = SISTEMA_GESTAO_COM) then
    if ( IbDtstTabelaTOTAL_PRODUTO.AsCurrency > 0 ) then
      if not ProdutosAprovados then
      begin
        ShowWarning('Nenhum material/produto fora marcado como aprovado pelo cliente!');
        Abort;
      end;

  if ( ShowConfirm('Deseja marcar Ordem de Servi�o (OS) como aprovada pelo cliente?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value         := STATUS_OS_APR;
    IbDtstTabelaDATA_APROVACAO.Value := GetDateDB;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    GravarEventoAutomatico('Aprova��o do(s) Servi�o(s)', 
      Format('* Ordem de Servi�o marcada como sido aprovada pelo cliente, segundo o usu�rio %s, registrado em %s �s %s.', [
        gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

    RecarregarRegistro;
    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeOS.BtnServicoAprovarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(mnAprovarOS, True) then
    Abort;

  if ( cdsOSServicos.RecordCount > 0 ) then
  begin
    if (cdsOSServicosAPROVADO.AsInteger = 1) then
      Exit;

    if (cdsOSServicosPUNIT.AsCurrency = 0) then
      ShowWarning('Servi�o sem valor informado!')
    else
    begin
      cdsOSServicos.Edit;
      cdsOSServicosAPROVADO.AsInteger := 1;
      cdsOSServicos.Post;

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
      begin
        cdsOSServicos.ApplyUpdates;
        CommitTransaction;
      end;

      GravarEventoAutomatico('Aprova��o de Or�amento (Servi�o)',
        Format('* Servi�o "%s" marcado como tido aprova��o do cliente pelo usu�rio %s em %s �s %s.', [
          cdsOSServicosDESCRI_APRESENTACAO.AsString,
          gUsuarioLogado.Login,
          FormatDateTime('dd/mm/yyyy', GetDateDB),
          FormatDateTime('hh"h"mm', GetTimeDB)]), False);
    end;
  end;
end;

procedure TfrmGeOS.BtnProdutoAprovarClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(mnAprovarOS, True) then
    Abort;

  if ( cdsOSProdutos.RecordCount > 0 ) then
  begin
    if (cdsOSProdutosAPROVADO.AsInteger = 1) then
      Exit;

    if (cdsOSProdutosPUNIT.AsCurrency = 0) then
      ShowWarning('Material/Produto sem valor informado!')
    else
    begin
      cdsOSProdutos.Edit;
      cdsOSProdutosAPROVADO.AsInteger := 1;
      cdsOSProdutos.Post;

      if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
      begin
        cdsOSProdutos.ApplyUpdates;
        CommitTransaction;
      end;

      GravarEventoAutomatico('Aprova��o de Or�amento (Produto)',
        Format('* Material/produto "%s" marcado como tido aprova��o do cliente pelo usu�rio %s em %s �s %s.', [
          cdsOSProdutosDESCRI_APRESENTACAO.AsString,
          gUsuarioLogado.Login,
          FormatDateTime('dd/mm/yyyy', GetDateDB),
          FormatDateTime('hh"h"mm', GetTimeDB)]), False);
    end;
  end;
end;

procedure TfrmGeOS.dbgDadosTitleClick(Column: TColumn);
begin
  if (Column.Index = 0) then
    pnlLegendas.Visible := True;
end;

procedure TfrmGeOS.btnFecharLegendaClick(Sender: TObject);
begin
  pnlLegendas.Visible := False;
end;

function TfrmGeOS.ServicosAprovados: Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := False;
  try
    if not cdsOSServicos.Active then
      Exit;

    cdsOSServicos.DisableControls;
    cdsOSServicos.First;
    while not cdsOSServicos.Eof do
    begin
      bRetorno := (cdsOSServicosAPROVADO.AsInteger = 1);
      if bRetorno then
        Break;
        
      cdsOSServicos.Next;
    end;
  finally
    cdsOSServicos.First;
    cdsOSServicos.EnableControls;

    Result := bRetorno;
  end;
end;

function TfrmGeOS.ProdutosAprovados: Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := False;
  try
    if not cdsOSProdutos.Active then
      Exit;

    cdsOSProdutos.DisableControls;
    cdsOSProdutos.First;
    while not cdsOSProdutos.Eof do
    begin
      bRetorno := (cdsOSProdutosAPROVADO.AsInteger = 1);
      if bRetorno then
        Break;

      cdsOSProdutos.Next;
    end;
  finally
    cdsOSProdutos.First;
    cdsOSProdutos.EnableControls;

    Result := bRetorno;
  end;
end;

procedure TfrmGeOS.mnLancarAtendimentoClick(Sender: TObject);
var
  eEvento : TStringList;
begin
  if not mnLancarAtendimento.Enabled then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

//  if ( ShowConfirm('Deseja marcar Ordem de Servi�o (OS) como estando atendimento?') ) then
//  begin
//    IbDtstTabela.Edit;
//
//    IbDtstTabelaSTATUS.Value := STATUS_OS_ATE;
//
//    IbDtstTabela.Post;
//    IbDtstTabela.ApplyUpdates;
//
//    CommitTransaction;
//
//    GravarEventoAutomatico('Atendimento da OS',
//      Format('* Sinaliza��o de in�cio de atendimento lan�ada por %s em %s �s %s.', [
//        gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);
//
//    HabilitarDesabilitar_Btns;
//  end;

  eEvento := TStringList.Create;
  try
    if SetEvento(Self, eEvento) then
    begin
      IbDtstTabela.Edit;

      IbDtstTabelaSTATUS.Value := STATUS_OS_ATE;

      IbDtstTabela.Post;
      IbDtstTabela.ApplyUpdates;

      CommitTransaction;

      GravarEventoAutomatico('Atendimento da OS',
        IfThen(Trim(eEvento.Text) = EmptyStr, EmptyStr, AnsiUpperCase(Trim(eEvento.Text)) + #13#13) +
        Format('* Sinaliza��o de in�cio/andamento de atendimento lan�ada por %s em %s �s %s.', [
          gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

      HabilitarDesabilitar_Btns;
    end;
  finally
    eEvento.Free;
  end;
end;

procedure TfrmGeOS.mnFinalizarOSClick(Sender: TObject);
begin
  if not mnFinalizarOS.Enabled then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  if not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_APR, STATUS_OS_ATE]) then
  begin
    ShowWarning('Apenas Ordens de Servi�os aprovadas ou em atendimento podem ser finalizadas.');
    Abort;
  end;

  if ( ShowConfirm('Deseja marcar Ordem de Servi�o (OS) como finalizada?') ) then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value           := STATUS_OS_FIN;
    IbDtstTabelaDATA_FINALIZACAO.Value := GetDateDB;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CalcularValorComissao;

    CommitTransaction;

    GravarEventoAutomatico('Finaliza��o da OS',
      Format('* Sinaliza��o de finaliza��o lan�ada por %s em %s �s %s.', [
        gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeOS.btnRegerarTituloClick(Sender: TObject);
begin
//  if ( not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FIN, STATUS_OS_FAT]) ) then
//    ShowWarning('� permitida a gera��o de t�tulos apenas para Ordem de Servi�os finalizadas ou faturadas')
  if ( not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FAT]) ) then
    ShowWarning('� permitida a gera��o de t�tulos apenas para Ordem de Servi�os faturadas')
  else
  if ( not qryTitulos.IsEmpty ) then
    ShowWarning('J� existe(m) t�tulo(s) gerado(s) para esta venda')
  else
  if ( ShowConfirm('Confirma gera��o do(s) t�tulo(s) a receber da venda?') ) then
  begin
    GerarTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeOS.GerarTitulos(const aAno: Smallint;
  const aControle: Integer);
begin
  try

    try

      with fdStpGerarTitulos do
      begin
        ParamByName('ano_os').AsInteger := aAno;
        ParamByName('num_os').AsInteger := aControle;
        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        //DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar t�tulos de recebimento.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeOS.btnGerarBoletoClick(Sender: TObject);
begin
  if ( not FormaPagtoEmitiBoleto(0) ) then
  begin
    ShowWarning('Forma(s) de Pagamento(s) n�o permite a emiss�o de boletos!');
    Exit;
  end;

  if not GetPermissaoRotinaInterna(nmGerarImprimirBoletos, True) then
    Abort;

  if ( not qryTitulos.IsEmpty ) then
  begin
    GerarBoleto(Self, dbCliente.Text,
      IbDtstTabelaCLIENTE.AsInteger,
      IbDtstTabelaANO.AsInteger,
      IbDtstTabelaCONTROLE.AsInteger,
      toBoletoOS);
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeOS.mnpCorrigirEnderecoEntregaClick(Sender: TObject);
var
  sDadosEntrega : TStringList;
begin
  if not (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FIN, STATUS_OS_FAT]) then
    Exit;

  sDadosEntrega := TStringList.Create;
  try
    if Trim(IbDtstTabelaDADOS_ENTREGA.AsString) <> EmptyStr then
      sDadosEntrega.Text := IbDtstTabelaDADOS_ENTREGA.AsString
    else
      sDadosEntrega.Text :=
        '* Respons�vel pelo(s) servi�o(s)..: ' + #13 +
        '* Endere�o de entrega/realiza��o..: ' + #13 + GetClienteEndereco(IbDtstTabelaCLIENTE.AsInteger, True);

    if SetDadosEntrega(Self, sDadosEntrega) then
      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update TBOS Set ');
        SQL.Add('  DADOS_ENTREGA = ' + QuotedStr(sDadosEntrega.Text));
        SQL.Add('where ANO       = ' + IbDtstTabelaANO.AsString);
        SQL.Add('  and CONTROLE  = ' + IbDtstTabelaCONTROLE.AsString);
        SQL.Add('  and EMPRESA   = ' + QuotedStr(IbDtstTabelaEMPRESA.AsString));
        ExecSQL;

        CommitTransaction;

        RecarregarRegistro;
        pgcServicoFinalizar.ActivePage := TbsLocalRealizacao;
      end;
  finally
    sDadosEntrega.Free;
  end;
end;

procedure TfrmGeOS.nmGerarImprimirBoletosClick(Sender: TObject);
var
  bExisteTitulo,
  bProsseguir  : Boolean;
  sDestinatario,
  sMensagem    ,
  sDocumento   ,
  sFileNamePDF : String;
const
  MSG_REF_NFE = 'Referente a NFS-e %s';
  MSG_REF_DOC = 'Referente a Ordem de Servi�o No. %s';
begin
  if IbDtstTabela.IsEmpty then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if (IbDtstTabela.State in [dsEdit, dsInsert]) then
    Exit;

  // Montar identifica��o do documento para t�tulo de e-mail

  if ( IbDtstTabelaNFS_NUMERO.AsLargeInt > 0 ) then
  begin
    sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', IbDtstTabelaNFS_NUMERO.AsLargeInt)]);
    sDocumento := 'NFSe ' + FormatFloat('###0000000', IbDtstTabelaNFS_NUMERO.AsLargeInt) + '-' + IbDtstTabelaNFS_SERIE.AsString;
  end
  else
  begin
    sMensagem  := Format(MSG_REF_DOC, [IbDtstTabelaANO.AsString + '/' + FormatFloat('##00000', IbDtstTabelaCONTROLE.AsInteger)]);
    sDocumento := 'OS. ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##00000', IbDtstTabelaCONTROLE.AsInteger);
  end;

  sDestinatario := GetClienteEmail(IbDtstTabelaCLIENTE.AsInteger);

  DMNFe.ConfigurarEmail(IbDtstTabelaEMPRESA.AsString, sDestinatario, 'Boleta Banc�ria - ' + sDocumento, sMensagem);

  AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  bExisteTitulo := not qryTitulos.IsEmpty;

  if BoletosGerados then
  begin
    ReImprimirBoleto(Self, dbCliente.Text, IbDtstTabelaCLIENTE.AsInteger,
      IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, qryTitulosCODBANCO.AsInteger, toBoletoOS, sFileNamePDF);
    Exit;
  end;

  try
    if (not BoletosGerados) and bExisteTitulo then
    begin
      bProsseguir := FormaPagtoEmitiBoleto(0);
      if not bProsseguir then
        ShowWarning('Forma(s) de Pagamento(s) n�o permite a emiss�o de boletos!');

      if bProsseguir then
        bProsseguir := cdsOSFormaPagto.Locate('PAGTO_PRAZO', FLAG_SIM, []);

      if bProsseguir then
        bProsseguir := ShowConfirm('Deseja gerar boletos para os t�tulos da Ordem de Servi�o?');

      if bProsseguir then
      begin
        btnGerarBoleto.Click;
        Exit;
      end
      else
        Exit;
    end;

    if (not BoletosGerados) then
      ShowWarning('N�o existem t�tulos com boletos gerados para a Ordem de Servi�o.')
    else
      ReImprimirBoleto(Self, dbCliente.Text, IbDtstTabelaCLIENTE.AsInteger,
        IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, qryTitulosCODBANCO.AsInteger, toBoletoOS, sFileNamePDF);
  finally
    qryTitulos.Filter   := EmptyStr;
    qryTitulos.Filtered := False;
  end;
end;

procedure TfrmGeOS.nmImprimirOrcamentoClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe, DMNFSe do
  begin

    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_OS_CAN ) then
    begin
      ShowWarning('Ordem de Servi�o cancelada n�o pode ser impressa!');
      Exit;
    end;

    CarregarDadosEmpresa(IbDtstTabelaEMPRESA.AsString, 'Or�amento');
    AbrirEmitente( IbDtstTabelaEMPRESA.AsString );
    AbrirTomador( IbDtstTabelaCLIENTE.AsInteger );
    AbrirOS( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, False );

    if GetEmitirCupom then
      if ( ShowConfirm('Deseja imprimir em formato CUPOM?', 'Impress�o', MB_DEFBUTTON1) ) then
      begin
//        if DMNFe.IsEstacaoEmiteNFCe and ((IbDtstTabelaNFE.AsCurrency > 0) and (IbDtstTabelaMODELO_NF.AsInteger = 1)) then // Modelo 1 (NFC-e [65])
//        begin
//          if DMNFe.TipoEmissaoCupomTexto(IbDtstTabela.FieldByName('CODEMP').AsString) then
//            DMNFe.ImprimirCupomNaoFiscal(
//                IbDtstTabela.FieldByName('CODEMP').AsString
//              , IbDtstTabela.FieldByName('CODCLIENTE').AsInteger
//              , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
//              , IbDtstTabela.FieldByName('ANO').AsInteger
//              , IbDtstTabela.FieldByName('CODCONTROL').AsInteger)
//          else
//            DMNFe.ImprimirDANFE_ESCPOSACBr(
//                IbDtstTabela.FieldByName('CODEMP').AsString
//              , IbDtstTabela.FieldByName('CODCLIENTE').AsInteger
//              , IbDtstTabela.FieldByName('ANO').AsInteger
//              , IbDtstTabela.FieldByName('CODCONTROL').AsInteger);
//        end
//        else
        if GetCupomNaoFiscalEmitir and (IbDtstTabelaSTATUS.AsInteger in [STATUS_OS_FAT, STATUS_OS_NFS]) then
          ImprimirCupomNaoFiscalOS(
              IbDtstTabelaEMPRESA.AsString
            , IbDtstTabelaCLIENTE.AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , IbDtstTabelaANO.Value
            , IbDtstTabelaCONTROLE.Value)
        else
        if ( GetModeloEmissaoCupom = MODELO_CUPOM_ORCAMENTO ) then
        begin
          ImprimirCupomOrcamentoOS(
              IbDtstTabelaEMPRESA.AsString
            , IbDtstTabelaCLIENTE.AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , IbDtstTabelaANO.Value
            , IbDtstTabelaCONTROLE.Value)
        end
        else
        if ( GetModeloEmissaoCupom = MODELO_CUPOM_POOLER ) then
        begin
          frrECFPoolerOS.PrepareReport;
          frrECFPoolerOS.Print;
        end;

        Exit;
      end;

    frrOSOrcamento.ShowReport;

  end;
end;

procedure TfrmGeOS.nmImprimirOSClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe, DMNFSe do
  begin
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_OS_CAN ) then
    begin
      ShowWarning('Ordem de Servi�o cancelada n�o pode ser impressa!');
      Exit;
    end;

    CarregarDadosEmpresa(IbDtstTabelaEMPRESA.AsString, 'Ordem de Servi�o');
    AbrirEmitente( IbDtstTabelaEMPRESA.AsString );
    AbrirTomador( IbDtstTabelaCLIENTE.AsInteger );
    AbrirOS( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, False );

    frrOS.ShowReport;
  end;
end;

procedure TfrmGeOS.mnFaturarOSClick(Sender: TObject);
var
  cValorAPagar : Currency;
  iCxAno   ,
  iCxNumero,
  iCxContaCorrente : Integer;
  aDataFatura : TDateTime;
  aObservacao : TStringList;
begin
  if not mnFaturarOS.Enabled then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  iCxAno    := 0;
  iCxNumero := 0;
  iCxContaCorrente := 0;

  RecarregarRegistro;

  aDataFatura := GetDateDB;
  aObservacao := TStringList.Create;
  aObservacao.Add('Ordem de Servi�o: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('###00000', IbDtstTabelaCONTROLE.AsInteger));

  AbrirTabelaFormasPagto ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaServicos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  AbrirTabelaProdutos    ( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

  if not (IbDtstTabelaSTATUS.AsInteger = STATUS_OS_FIN) then
  begin
    ShowWarning('Apenas Ordens de Servi�os finalizadas podem ser faturadas.');
    Abort;
  end;

  // Verificar se cliente est� bloqueado, caso algum pagamento da OS seja a prazo

  if cdsOSFormaPagto.Locate('PAGTO_PRAZO', FLAG_SIM, []) then
    if ( IbDtstTabelaBLOQUEADO.AsInteger = 1 ) then
    begin
      ShowWarning('Cliente bloqueado!' + #13#13 + 'Motivo:' + #13 + IbDtstTabelaBLOQUEADO_MOTIVO.AsString);
      Exit;
    end;

  // Verificar se existe caixa aberto para o usu�rio do sistema

  cdsOSFormaPagto.DisableControls;
  cdsOSFormaPagto.First;
  while not cdsOSFormaPagto.Eof do
  begin
    aObservacao.Add('- ' + cdsOSFormaPagtoFormaPagtoDescricao.AsString + ' ' + cdsOSFormaPagtoCondicaoPagtoDescricao.AsString);
    aObservacao.Add('- R$ ' + FormatFloat(',0.00', cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency));
    if ( cdsOSFormaPagtoPAGTO_PRAZO.AsInteger = FLAG_NAO ) then
      if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, gUsuarioLogado.Login, GetDateDB, cdsOSFormaPagtoFORMAPAGTO.AsInteger, iCxAno, iCxNumero, iCxContaCorrente) ) then
      begin
        ShowWarning('N�o existe caixa aberto para o usu�rio na forma de pagamento ' + QuotedStr(cdsOSFormaPagtoFormaPagtoDescricao.AsString) + '.');
        Break;
      end;

    cdsOSFormaPagto.Next;
  end;
  cdsOSFormaPagto.EnableControls;
  cdsOSFormaPagto.First;

  cValorAPagar := GetTotalValorServicos;

//  if ( cdsOSTecnicos.RecordCount = 0 ) then
//    if ShowConfirmation('Comiss�o', 'N�o existem registros para pagamento de comiss�o nesta Ordem de Servi�o.' + #13#13 + 'Deseja continuar o processo de faturamento?') then
//      Exit;
//
  if ( cdsOSTecnicos.RecordCount > 0 ) then
    CalcularValorComissao;

  IbDtstTabela.Edit;

  // Verificar dados da(s) Forma(s) de Pagamento(s)

  if ( cdsOSFormaPagto.RecordCount = 0 ) then
  begin
    ShowWarning('Favor informar a forma e/ou condi��o de pagamento');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto <= 0 ) then
  begin
    ShowWarning('Favor informar corretamente o valor de cada forma/condi��o de pagamento');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto > cValorAPagar ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MAIOR que o Valor Total da Ordem de Servi�o.' + #13#13 + 'Favor corrigir os valores.');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < cValorAPagar ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MENOR que o Valor Total da Ordem de Servi�o.' + #13#13 + 'Favor corrigir os valores.');
    pgcServicoFinalizar.ActivePage := TbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  //if ( ShowConfirm('Confirma o faturamento da Ordem de Servi�o selecionada?') ) then
  if SetMemoFaturaData(Self, aDataFatura, aObservacao, 'Observa��es') then
  begin
    if cdsOSFormaPagto.Locate('PAGTO_PRAZO', FLAG_SIM, []) then
    begin
      GetTitulosAbertos( IbDtstTabelaCLIENTE.AsInteger );
      if ( (fdQryTotalTitulosAbertosVALOR_LIMITE.AsCurrency > 0.0) and (GetTotalValorFormaPagto_APrazo > fdQryTotalTitulosAbertosVALOR_LIMITE_DISPONIVEL.AsCurrency) ) then
      begin
        ShowWarning('O Valor Total A Prazo est� acima do Valor Limite dispon�vel para o cliente.' + #13#13 + 'Favor comunicar ao setor financeiro.');
        Exit;
      end;
    end;

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value         := STATUS_OS_FAT;
    IbDtstTabelaDATA_FATURA.Value    := aDataFatura;
    IbDtstTabelaOBSERVACOES.AsString := IfThen(Trim(IbDtstTabelaOBSERVACOES.AsString) = EmptyStr
      , aObservacao.Text
      , IbDtstTabelaOBSERVACOES.AsString + #13#13 + aObservacao.Text);

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    GravarEventoAutomatico('Faturamento da OS',
      Format('* Faturamento da Ordem de Servi�o lan�ada por %s em %s �s %s.', [
        gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

    CommitTransaction;

    GerarTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

    ShowInformation('Ordem de Servi�o faturada com sucesso !' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

    // Confirmar vencimentos de cada parcela

    if cdsOSFormaPagto.Locate('PAGTO_PRAZO', FLAG_SIM, []) then
      if ( TitulosConfirmados(Self, IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, IbDtstTabelaDATA_FATURA.AsDateTime, GetTotalValorFormaPagto_APrazo) ) then
        AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

    HabilitarDesabilitar_Btns;

    // Formas de Pagamento que nao sejam a prazo

    cdsOSFormaPagto.First;
    while not cdsOSFormaPagto.Eof do
    begin
      if ( cdsOSFormaPagtoPAGTO_PRAZO.AsInteger = FLAG_NAO ) then
        if ( qryTitulos.Locate('FORMA_PAGTO', cdsOSFormaPagtoFORMAPAGTO.AsInteger, []) ) then
          RegistrarPagamento(qryTitulosANOLANC.AsInteger, qryTitulosNUMLANC.AsInteger,
            GetDateDB,
            cdsOSFormaPagtoFORMAPAGTO.AsInteger,
            cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency,
            toRecebimentoOS,
            IbDtstTabelaANO.AsInteger,
            IbDtstTabelaCONTROLE.AsInteger);

      cdsOSFormaPagto.Next;
    end;

    // Registrar o N�mero do Caixa na Venda Finalizada

    RegistrarCaixaNaOS(
        IbDtstTabelaANO.AsInteger
      , IbDtstTabelaCONTROLE.AsInteger
      , iCxAno
      , iCxNumero);

    if ( iCxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(iCxContaCorrente, GetDateDB);

    RdgStatusOS.ItemIndex := 0;

    // Imprimir Cupom

    if GetEmitirCupom then
    begin
      if GetEmitirCupomAutomatico then
        if GetCupomNaoFiscalEmitir then
          DMNFSe.ImprimirCupomNaoFiscalOS(IbDtstTabelaEMPRESA.AsString
            , IbDtstTabelaCLIENTE.AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , IbDtstTabelaANO.Value, IbDtstTabelaCONTROLE.Value);
    end
    else
      ShowInformation('Faturamento', 'Ordem de Servi�o faturada com sucesso.');
  end
  else
  begin
    if (IbDtstTabela.State = dsEdit) then
      IbDtstTabela.Cancel;
  end;

(*

  IbDtstTabela.Edit;

  if ( IbDtstTabelaVENDEDOR_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar o vendedor');
    dbVendedor.SetFocus;
  end
  else
  if ( QuantidadeInvalida ) then
  begin
    ShowWarning('Quantidade informada para o �tem ' + FormatFloat('#00', cdsTabelaItensSEQ.AsInteger) + ' est� acima da quantidade dispon�vel no estoque.');
    if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      btnProdutoEditar.SetFocus;
  end
  else

  // Verificar dados da(s) Forma(s) de Pagamento(s)

  if ( cdsVendaFormaPagto.RecordCount = 0 ) then
  begin
    ShowWarning('Favor informar a forma e/ou condi��o de pagamento');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto <= 0 ) then
  begin
    ShowWarning('Favor informar corretamente o valor de cada forma/condi��o de pagamento');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto > IbDtstTabelaTOTALVENDA.AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MAIOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < IbDtstTabelaTOTALVENDA.AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MENOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( ShowConfirm('Confirma a finaliza��o da venda selecionada?') ) then
  begin
    if ( IbDtstTabelaVENDA_PRAZO.AsInteger = 1 ) then
    begin
      GetComprasAbertas( IbDtstTabelaCODCLIENTE.AsInteger );
      if ( GetTotalValorFormaPagto_APrazo > qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL.AsCurrency ) then
      begin
        ShowWarning('O Valor Total A Prazo da venda est� acima do Valor Limite dispon�vel para o cliente.' + #13#13 + 'Favor comunicar ao setor financeiro.');
        Exit;
      end;
    end;

    if GetGerarEstoqueCliente then
      iGerarEstoqueCliente := 1
    else
      iGerarEstoqueCliente := 0;

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value                := STATUS_VND_FIN;
    IbDtstTabelaDTVENDA.Value               := GetDateTimeDB;
    IbDtstTabelaDTFINALIZACAO_VENDA.Value   := GetDateTimeDB;
    IbDtstTabelaGERAR_ESTOQUE_CLIENTE.Value := iGerarEstoqueCliente;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    GerarTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ShowInformation('Venda finalizada com sucesso !' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODCONTROL.AsInteger));

    // Confirmar vencimentos de cada parcela

    if ( IbDtstTabelaVENDA_PRAZO.AsInteger = 1 ) then
      if ( TitulosConfirmados(Self, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, GetTotalValorFormaPagto_APrazo) ) then
        AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    HabilitarDesabilitar_Btns;

    // Formas de Pagamento que nao seja a prazo

    cdsVendaFormaPagto.First;
    while not cdsVendaFormaPagto.Eof do
    begin
      if ( cdsVendaFormaPagtoVENDA_PRAZO.AsInteger = 0 ) then
        if ( qryTitulos.Locate('FORMA_PAGTO', cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger, []) ) then
          RegistrarPagamento(qryTitulosANOLANC.AsInteger, qryTitulosNUMLANC.AsInteger, GetDateDB, cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger,
            cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger);

      cdsVendaFormaPagto.Next;
    end;

    // Registrar o N�mero do Caixa na Venda Finalizada

    RegistrarCaixaNaVenda(
        IbDtstTabelaANO.AsInteger
      , IbDtstTabelaCODCONTROL.AsInteger
      , CxAno
      , CxNumero
      , (gSistema.Codigo = SISTEMA_PDV));

    if ( CxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(CxContaCorrente, GetDateDB);

    RdgStatusVenda.ItemIndex := 0;

    // Imprimir Cupom

    if GetEmitirCupom then
      if GetEmitirCupomAutomatico then
        if GetCupomNaoFiscalEmitir then
          DMNFe.ImprimirCupomNaoFiscal(IbDtstTabelaCODEMP.AsString
            , IbDtstTabelaCODCLIENTE.AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value)
        else
          ; // Emitir Cupom Fiscal
  end;

*)
    
end;

function TfrmGeOS.GetTotalValorServicos: Currency;
var
  cValorServico : Currency;
begin
//  if ( IbDtstTabelaTOTAL_APROVADO_SERVICO.AsCurrency > 0 ) then
//    cValorServico := IbDtstTabelaTOTAL_APROVADO_SERVICO.AsCurrency
//  else
//    cValorServico := IbDtstTabelaTOTAL_OS.AsCurrency;
  if (IbDtstTabelaSTATUS.AsInteger > STATUS_OS_FIN) then
    cValorServico := IbDtstTabelaTOTAL_OS.AsCurrency
  else
  if ( (IbDtstTabelaTOTAL_APROVADO_SERVICO.AsCurrency > 0) or (IbDtstTabelaTOTAL_APROVADO_PRODUTO.AsCurrency > 0) ) then
    cValorServico :=
      IbDtstTabelaTOTAL_APROVADO_SERVICO.AsCurrency +
      IbDtstTabelaTOTAL_APROVADO_PRODUTO.AsCurrency
  else
    cValorServico := IbDtstTabelaTOTAL_OS.AsCurrency;

  Result := cValorServico;
end;

procedure TfrmGeOS.GetTitulosAbertos(pCliente: Integer);
begin
  with fdQryTotalTitulosAbertos do
  begin
    Close;
    ParamByName('cliente').AsInteger := pCliente;
    Open;
  end;
end;

procedure TfrmGeOS.btbtnCancelarOSClick(Sender: TObject);
var
 iNumero : Integer;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  if ( (IbDtstTabelaNFS_LOTE.AsInteger > 0) and (IbDtstTabelaNFS_NUMERO.AsInteger = 0) ) then
  begin
    ShowWarning('O processo de gera��o de NFS-e para esta Ordem de Servi�o j� foi solicitado, mas n�o fora conclu�do.' + #13 +
      'Desta forma n�o ser� perdida o cancelamento da Ordem de Servi�o.' + #13#13 + 'Favor consultar junto a SEFA Municipal e processar o Recibo de n�mero ' +
        IbDtstTabelaNFS_LOTE.AsString + ' e comunicar ao suporte.');
    Exit;
  end;

  if ( PossuiTitulosPagos(IbDtstTabelaANO.Value, IbDtstTabelaCONTROLE.Value) ) then
  begin
    ShowWarning('A Ordem de Servi�o possui t�tulo(s) j� baixado(s).' + #13 + 'Favor providenciar a exclus�o da(s) baixa(s) para que esta possa ser cancelada!');
    Exit;
  end;

  if ( CancelarOS(Self, IbDtstTabelaANO.Value, IbDtstTabelaCONTROLE.Value) ) then
    with IbDtstTabela do
    begin
      GravarEventoAutomatico('Cancelamento da OS',
        Format('* Cancelamento da Ordem de Servi�o lan�ada por %s em %s �s %s.', [
          gUsuarioLogado.Login, FormatDateTime('dd/mm/yyyy', GetDateDB), FormatDateTime('hh"h"mm', GetTimeDB)]), False);

      iNumero := IbDtstTabelaCONTROLE.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      ShowInformation('Ordem de Servi�o cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

function TfrmGeOS.PossuiTitulosPagos(const aAno: Smallint;
  const aControle: Integer): Boolean;
var
  bReturn : Boolean;
begin
  bReturn := False;

  try

    try
      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT coalesce(r.Valorrectot, 0) as Total_Pago from TBCONTREC r');
        SQL.Add('where r.AnoOS = ' + IntToStr(aAno));
        SQL.Add('  and r.NumOS = ' + IntToStr(aControle));
        Open;                          

        bReturn := (FieldByName('Total_Pago').AsCurrency > 0);

        Close;
      end;
    except
      On E : Exception do
      begin
        bReturn := False;
        ShowError('Erro ao tentar consultar t�tulos baixados do cliente.' + #13#13 + E.Message);
      end;
    end;

  finally

  end;
  
  Result := bReturn;
end;

function TfrmGeOS.GetRotinaAprovarOrdemServicoID: String;
begin
  Result := GetRotinaInternaID(mnAprovarOS);
end;

function TfrmGeOS.GetRotinaFaturarOrdemServicoID: String;
begin
  Result := GetRotinaInternaID(mnFaturarOS);
end;

function TfrmGeOS.GetRotinaGerarImprimirBoletoID : String;
begin
  Result := GetRotinaInternaID(btnRegerarTitulo);
end;

function TfrmGeOS.GetRotinaFinalizarOrdemServicoID: String;
begin
  Result := GetRotinaInternaID(mnFinalizarOS);
end;

function TfrmGeOS.GetRotinaLancarAtendimentoID: String;
begin
  Result := GetRotinaInternaID(mnLancarAtendimento);
end;

function TfrmGeOS.GetRotinaIniciarAvaliacaoID: String;
begin
  Result := GetRotinaInternaID(mnIniciarAvaliacao);
end;

function TfrmGeOS.GetRotinaLancarParecerID: String;
begin
  Result := GetRotinaInternaID(mnLancarParecer);
end;

function TfrmGeOS.GetTotalValorFormaPagto_APrazo: Currency;
var
  cReturn : Currency;
begin
  cReturn := 0;

  with cdsOSFormaPagto do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;

    First;
    while not Eof do
    begin
      if ( cdsOSFormaPagtoPAGTO_PRAZO.AsInteger = FLAG_SIM ) then
        cReturn := cReturn + cdsOSFormaPagtoVALOR_FPAGTO.AsCurrency;
      Next;
    end;
    First;

    EnableControls;
  end;
  Result := cReturn;
end;

initialization
  FormFunction.RegisterForm('frmGeOS', TfrmGeOS);

end.
