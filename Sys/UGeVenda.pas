unit UGeVenda;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, DBClient, Provider, IBStoredProc,
  frxClass, frxDBSet, Menus, IBQuery, ClipBrd, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxButtons, JvExMask, JvToolEdit, JvDBControls,

  SGE.Controller.Interfaces,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, ACBrBase, ACBrExtenso, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinsDefaultPainters, dxSkinBasic, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinTheBezier, dxSkinWXI;

type
  TfrmGeVenda = class(TfrmGrPadraoCadastro)
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCliente: TLabel;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    GrpBxDadosProduto: TGroupBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    pgcMaisDados: TPageControl;
    tbsRecebimento: TTabSheet;
    tbsITitulos: TTabSheet;
    lblProduto: TLabel;
    dbProdutoNome: TDBEdit;
    dbgProdutos: TDBGrid;
    lblQuantidade: TLabel;
    dbQuantidade: TDBEdit;
    lblValorUnit: TLabel;
    dbValorUnit: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblValorLiq: TLabel;
    dbValorLiq: TDBEdit;
    lblUnidade: TLabel;
    dbUnidade: TDBEdit;
    lblCFOP: TLabel;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblReferencia: TLabel;
    dbReferencia: TDBEdit;
    dbCFOPDescricao: TDBEdit;
    Bevel7: TBevel;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblNFe: TLabel;
    dbNFe: TDBEdit;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    pnlBotoesTitulo: TPanel;
    btnRegerarTitulo: TBitBtn;
    btnGerarBoleto: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    Bevel10: TBevel;
    lblVendedor: TLabel;
    dbVendedor: TDBLookupComboBox;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorDesconto: TDBEdit;
    dtsVendedor: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    DtSrcTabelaItens: TDataSource;
    Bevel12: TBevel;
    dtsTitulos: TDataSource;
    btnTituloQuitar: TBitBtn;
    lblCFOPVenda: TLabel;
    ppImprimir: TPopupMenu;
    nmImprimirVenda: TMenuItem;
    nmImprimirDANFE: TMenuItem;
    nmGerarDANFEXML: TMenuItem;
    N1: TMenuItem;
    lblTotalDesconto: TLabel;
    lblProdutoPromocao: TLabel;
    cdsTotalComprasAbertas: TDataSource;
    lblVendaCancelada: TLabel;
    lblVendaAberta: TLabel;
    lblPercRedBC: TLabel;
    dbPercRedBC: TDBEdit;
    pnlObservacao: TPanel;
    lblObservacao: TLabel;
    dbObservacao: TDBMemo;
    pnlFormaPagto: TPanel;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Label2: TLabel;
    dbValorFormaPagto: TDBEdit;
    btnFormaPagtoSalvar: TBitBtn;
    dbgFormaPagto: TDBGrid;
    btnFormaPagtoExcluir: TBitBtn;
    btnFormaPagtoInserir: TBitBtn;
    btnFormaPagtoEditar: TBitBtn;
    dtsVendaFormaPagto: TDataSource;
    lblData: TLabel;
    dbValorTotalBruto: TDBEdit;
    lblValorTotalBruto: TLabel;
    tbsTransporte: TTabSheet;
    Bevel16: TBevel;
    pnlBotoesTransp: TPanel;
    BtnTransporteInforme: TBitBtn;
    Bevel17: TBevel;
    dtsModalidadeFrete: TDataSource;
    GrpBxTransportadora: TGroupBox;
    lblTranspNome: TLabel;
    dbTranspNome: TDBEdit;
    lblTranspCnpj: TLabel;
    dbTranspCnpj: TDBEdit;
    lblTranspEndereco: TLabel;
    dbTranspEndereco: TDBEdit;
    lblModalidadeFrete: TLabel;
    dbModalidadeFrete: TDBLookupComboBox;
    dtsVendaVolume: TDataSource;
    dbgVolumes: TDBGrid;
    RdgStatusVenda: TRadioGroup;
    ShpLucroZerado: TShape;
    lblLucroZerado: TLabel;
    ShpLucroNegativo: TShape;
    lblLucroNegativo: TLabel;
    nmGerarImprimirBoletos: TMenuItem;
    popupAuditoria: TPopupMenu;
    nmPpReciboNFe: TMenuItem;
    nmPpChaveNFe: TMenuItem;
    nmPpArquivoNFe: TMenuItem;
    N2: TMenuItem;
    nmPpLimparDadosNFe: TMenuItem;
    N3: TMenuItem;
    nmEnviarEmailCliente: TMenuItem;
    nmImprimirNotaEntrega: TMenuItem;
    nmImprimirCartaCredito: TMenuItem;
    TbsInformeNFe: TTabSheet;
    dbLogNFeLote: TDBEdit;
    lblLogNFeLote: TLabel;
    d1LogNFeLoteDataEmissao: TDBEdit;
    lblLogNFeLoteDataEmissao: TLabel;
    d2LogNFeLoteDataEmissao: TDBEdit;
    lblLogNFeLoteChave: TLabel;
    dbLogNFeLoteChave: TDBEdit;
    lblLogNFeLoteRecibo: TLabel;
    dbLogNFeLoteRecibo: TDBEdit;
    dtsNFE: TDataSource;
    lblLogNFeLoteProtocolo: TLabel;
    dbLogNFeLoteProtocolo: TDBEdit;
    lblLogNFeLoteArquivo: TLabel;
    dbLogNFeLoteArquivo: TDBEdit;
    lblLogNFeCancelMotivo: TLabel;
    dbLogNFeCancelMotivo: TDBMemo;
    lblLogNFeCancelUsuario: TLabel;
    dbLogNFeCancelUsuario: TDBEdit;
    lblLogNFeCancelData: TLabel;
    dbLogNFeCancelData: TDBEdit;
    lblLogNFeUsuario: TLabel;
    dbLogNFeUsuario: TDBEdit;
    BtnLimparDadosNFe: TSpeedButton;
    lblLogNFeDenegada: TLabel;
    dbLogNFeDenegada: TDBEdit;
    BtnCorrigirDadosNFe: TSpeedButton;
    ppCorrigirDadosNFe: TPopupMenu;
    nmPpCorrigirDadosNFeCFOP: TMenuItem;
    btnConsultarProduto: TcxButton;
    btbtnFinalizar: TcxButton;
    btbtnGerarNFe: TcxButton;
    btbtnCancelarVND: TcxButton;
    dbCliente: TJvDBComboEdit;
    dbCFOPVenda: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbCFOP: TJvDBComboEdit;
    dbTotalDesconto: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    nmImprimirNotaEntregaX: TMenuItem;
    N4: TMenuItem;
    nmPpCarregarArquivoNFe: TMenuItem;
    opdNotas: TOpenDialog;
    tbsDadosEntrega: TTabSheet;
    pnlDadosEntrega: TPanel;
    lblDadosEntrega: TLabel;
    Bevel11: TBevel;
    Bevel13: TBevel;
    dbDadosEntrega: TDBMemo;
    nmPpCorrigirDadosEntrega: TMenuItem;
    fdQryFormaPagto: TFDQuery;
    fdQryCondicaoPagto: TFDQuery;
    fdQryEmpresa: TFDQuery;
    dtpFormaPagto: TDataSetProvider;
    cdsFormaPagto: TClientDataSet;
    dtpCondicaoPagto: TDataSetProvider;
    cdsCondicaoPagto: TClientDataSet;
    lblLoteProduto: TLabel;
    dbLoteProduto: TDBLookupComboBox;
    fdQryLotes: TFDQuery;
    dtsLotes: TDataSource;
    Bevel18: TBevel;
    fdQryModalidadeFrete: TFDQuery;
    qryProduto: TFDQuery;
    qryCFOP: TFDQuery;
    qryTotalComprasAbertas: TFDQuery;
    cdsVendaFormaPagto: TFDQuery;
    updVendaFormaPagto: TFDUpdateSQL;
    cdsVendaFormaPagtoANO_VENDA: TSmallintField;
    cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField;
    cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField;
    cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField;
    cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField;
    cdsVendaFormaPagtoPRAZO_01: TSmallintField;
    cdsVendaFormaPagtoPRAZO_02: TSmallintField;
    cdsVendaFormaPagtoPRAZO_03: TSmallintField;
    cdsVendaFormaPagtoPRAZO_04: TSmallintField;
    cdsVendaFormaPagtoPRAZO_05: TSmallintField;
    cdsVendaFormaPagtoPRAZO_06: TSmallintField;
    cdsVendaFormaPagtoPRAZO_07: TSmallintField;
    cdsVendaFormaPagtoPRAZO_08: TSmallintField;
    cdsVendaFormaPagtoPRAZO_09: TSmallintField;
    cdsVendaFormaPagtoPRAZO_10: TSmallintField;
    cdsVendaFormaPagtoPRAZO_11: TSmallintField;
    cdsVendaFormaPagtoPRAZO_12: TSmallintField;
    cdsVendaFormaPagtoFormaPagto: TStringField;
    cdsVendaFormaPagtoCondicaoPagto: TStringField;
    cdsVendaVolume: TFDQuery;
    updVendaVolume: TFDUpdateSQL;
    cdsVendaVolumeANO_VENDA: TSmallintField;
    cdsVendaVolumeCONTROLE_VENDA: TIntegerField;
    cdsVendaVolumeSEQUENCIAL: TSmallintField;
    cdsVendaVolumeNUMERO: TStringField;
    cdsVendaVolumeQUANTIDADE: TSmallintField;
    cdsVendaVolumeESPECIE: TStringField;
    cdsVendaVolumeMARCA: TStringField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    qryNFE: TFDQuery;
    updNFE: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TStringField;
    cdsTabelaItensCODEMP: TStringField;
    cdsTabelaItensCODCLI: TStringField;
    cdsTabelaItensCODCLIENTE: TIntegerField;
    cdsTabelaItensCODVENDEDOR: TIntegerField;
    cdsTabelaItensDTVENDA: TSQLTimeStampField;
    cdsTabelaItensLOTE_ID: TStringField;
    cdsTabelaItensREFERENCIA: TStringField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensCFOP_COD: TIntegerField;
    cdsTabelaItensCST: TStringField;
    cdsTabelaItensCSOSN: TStringField;
    cdsTabelaItensDESCRI: TStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TStringField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    cdsTabelaItensCFOP_DESCRICAO: TStringField;
    cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField;
    cdsTabelaItensESTOQUE_APROP_LOTE: TSmallintField;
    cdsTabelaItensNCM_SH: TStringField;
    qryTitulos: TFDQuery;
    qryTitulosANOLANC: TSmallintField;
    qryTitulosNUMLANC: TIntegerField;
    qryTitulosPARCELA: TSmallintField;
    qryTitulosCODBANCO: TIntegerField;
    qryTitulosNOSSONUMERO: TStringField;
    qryTitulosCNPJ: TStringField;
    qryTitulosTIPPAG: TStringField;
    qryTitulosDTEMISS: TDateField;
    qryTitulosDTVENC: TDateField;
    qryTitulosDATAPROCESSOBOLETO: TDateField;
    qryTitulosBAIXADO: TSmallintField;
    qryTitulosBAIXADO_: TStringField;
    qryTitulosDTREC: TDateField;
    qryTitulosFORMA_PAGTO: TSmallintField;
    qryTitulosSTATUS: TStringField;
    qryTitulosPGTO_SEQ: TSmallintField;
    qryTitulosPGTO_USUARIO: TStringField;
    qryTitulosPGTO_DATA: TDateField;
    qryTitulosPGTO_FORMA: TSmallintField;
    qryTitulosPGTO_OK: TIntegerField;
    qryTitulosLancamento: TStringField;
    spSetGerarTitulos: TFDStoredProc;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaCODCONTROL: TIntegerField;
    fdQryTabelaCODEMP: TStringField;
    fdQryTabelaCODCLIENTE: TIntegerField;
    fdQryTabelaCODCLI: TStringField;
    fdQryTabelaDTVENDA: TSQLTimeStampField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaDTFINALIZACAO_VENDA: TDateField;
    fdQryTabelaOBS: TMemoField;
    fdQryTabelaDADOS_ENTREGA: TMemoField;
    fdQryTabelaFORMAPAG: TStringField;
    fdQryTabelaFATDIAS: TSmallintField;
    fdQryTabelaSERIE: TStringField;
    fdQryTabelaNFE: TLargeintField;
    fdQryTabelaMODELO_NF: TIntegerField;
    fdQryTabelaLOTE_NFE_ANO: TSmallintField;
    fdQryTabelaLOTE_NFE_NUMERO: TIntegerField;
    fdQryTabelaLOTE_NFE_RECIBO: TStringField;
    fdQryTabelaNFE_ENVIADA: TSmallintField;
    fdQryTabelaNFE_DENEGADA: TSmallintField;
    fdQryTabelaNFE_DENEGADA_MOTIVO: TStringField;
    fdQryTabelaCAIXA_ANO: TSmallintField;
    fdQryTabelaCAIXA_NUM: TIntegerField;
    fdQryTabelaCAIXA_PDV: TSmallintField;
    fdQryTabelaDATAEMISSAO: TDateField;
    fdQryTabelaHORAEMISSAO: TTimeField;
    fdQryTabelaCANCEL_USUARIO: TStringField;
    fdQryTabelaCANCEL_DATAHORA: TSQLTimeStampField;
    fdQryTabelaCANCEL_MOTIVO: TMemoField;
    fdQryTabelaCFOP: TIntegerField;
    fdQryTabelaVERIFICADOR_NFE: TStringField;
    fdQryTabelaXML_NFE_FILENAME: TStringField;
    fdQryTabelaXML_NFE: TMemoField;
    fdQryTabelaVENDEDOR_COD: TIntegerField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaFORMAPAGTO_COD: TSmallintField;
    fdQryTabelaCONDICAOPAGTO_COD: TSmallintField;
    fdQryTabelaVENDA_PRAZO: TSmallintField;
    fdQryTabelaPRAZO_01: TSmallintField;
    fdQryTabelaPRAZO_02: TSmallintField;
    fdQryTabelaPRAZO_03: TSmallintField;
    fdQryTabelaPRAZO_04: TSmallintField;
    fdQryTabelaPRAZO_05: TSmallintField;
    fdQryTabelaPRAZO_06: TSmallintField;
    fdQryTabelaPRAZO_07: TSmallintField;
    fdQryTabelaPRAZO_08: TSmallintField;
    fdQryTabelaPRAZO_09: TSmallintField;
    fdQryTabelaPRAZO_10: TSmallintField;
    fdQryTabelaPRAZO_11: TSmallintField;
    fdQryTabelaPRAZO_12: TSmallintField;
    fdQryTabelaNFE_MODALIDADE_FRETE: TSmallintField;
    fdQryTabelaNFE_TRANSPORTADORA: TIntegerField;
    fdQryTabelaNFE_PLACA_VEICULO: TStringField;
    fdQryTabelaNFE_PLACA_UF: TStringField;
    fdQryTabelaNFE_PLACA_RNTC: TStringField;
    fdQryTabelaGERAR_ESTOQUE_CLIENTE: TSmallintField;
    fdQryTabelaTRANSP_NOME: TStringField;
    fdQryTabelaTRANSP_CNPJ: TStringField;
    fdQryTabelaTRANSP_IEST: TStringField;
    fdQryTabelaTRANSP_ENDERECO: TStringField;
    fdQryTabelaNOME: TStringField;
    fdQryTabelaBLOQUEADO: TSmallintField;
    fdQryTabelaBLOQUEADO_MOTIVO: TMemoField;
    lblDicaDadosEntrega: TLabel;
    pnlDicaFormaPagto: TPanel;
    lblDicaFormaPagto: TLabel;
    dbValorIPI: TDBEdit;
    lblValorIPI: TLabel;
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
    fdQryTabelaPESSOA_FISICA: TSmallintField;
    fdQryTabelaINSCEST: TStringField;
    nmGerarReciboAvulso: TMenuItem;
    CdsRecibo: TClientDataSet;
    CdsReciboANOLANC: TSmallintField;
    CdsReciboNUMLANC: TIntegerField;
    CdsReciboPARCELA: TSmallintField;
    CdsReciboCLIENTE: TIntegerField;
    CdsReciboRZSOC: TStringField;
    CdsReciboEMPRESA_CNPJ: TStringField;
    CdsReciboNOME: TStringField;
    CdsReciboPESSOA_FISICA: TSmallintField;
    CdsReciboCNPJ: TStringField;
    CdsReciboTIPPAG: TStringField;
    CdsReciboDTEMISS: TDateField;
    CdsReciboDTVENC: TDateField;
    CdsReciboDTREC: TDateField;
    CdsReciboVALORREC: TBCDField;
    CdsReciboBANCO: TSmallintField;
    CdsReciboBCO_NOME: TStringField;
    CdsReciboNUMERO_CHEQUE: TStringField;
    CdsReciboPAGO_: TStringField;
    CdsReciboDOCBAIX: TStringField;
    CdsReciboBAIXADO: TSmallintField;
    CdsReciboSEQ: TSmallintField;
    CdsReciboDATA_PAGTO: TDateField;
    CdsReciboFORMA_PAGTO: TSmallintField;
    CdsReciboFORMA_PAGTO_DESC: TStringField;
    CdsReciboHISTORICO: TMemoField;
    CdsReciboVALOR_BAIXA: TBCDField;
    CdsReciboVALOR_BAIXA_EXTENSO: TStringField;
    ACBrExtenso: TACBrExtenso;
    FrReciboA4: TfrxReport;
    FrdRecibo: TfrxDBDataset;
    fdQryTabelaTOTALVENDA_BRUTA: TFMTBCDField;
    fdQryTabelaDESCONTO: TBCDField;
    fdQryTabelaTOTALVENDA: TFMTBCDField;
    fdQryTabelaLUCRO_CALCULADO: TBCDField;
    cdsTabelaItensQTDE: TFMTBCDField;
    cdsTabelaItensPUNIT: TFMTBCDField;
    cdsTabelaItensPUNIT_PROMOCAO: TFMTBCDField;
    cdsTabelaItensDESCONTO: TFMTBCDField;
    cdsTabelaItensDESCONTO_VALOR: TBCDField;
    cdsTabelaItensPFINAL: TFMTBCDField;
    cdsTabelaItensQTDEFINAL: TFMTBCDField;
    cdsTabelaItensALIQUOTA: TFMTBCDField;
    cdsTabelaItensALIQUOTA_CSOSN: TFMTBCDField;
    cdsTabelaItensALIQUOTA_PIS: TFMTBCDField;
    cdsTabelaItensALIQUOTA_COFINS: TFMTBCDField;
    cdsTabelaItensVALOR_IPI: TFMTBCDField;
    cdsTabelaItensPERCENTUAL_REDUCAO_BC: TFMTBCDField;
    cdsTabelaItensTOTAL_BRUTO: TFMTBCDField;
    cdsTabelaItensTOTAL_DESCONTO: TFMTBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TFMTBCDField;
    cdsTabelaItensESTOQUE: TFMTBCDField;
    cdsTabelaItensRESERVA: TFMTBCDField;
    qryTitulosVALORREC: TFMTBCDField;
    qryTitulosPERCENTJUROS: TCurrencyField;
    qryTitulosPERCENTMULTA: TCurrencyField;
    qryTitulosPERCENTDESCONTO: TCurrencyField;
    qryTitulosVALORRECTOT: TFMTBCDField;
    qryTitulosVALORSALDO: TFMTBCDField;
    qryTitulosPGTO_VALOR: TFMTBCDField;
    cdsVendaFormaPagtoVALOR_FPAGTO: TFMTBCDField;
    cdsVendaVolumePESO_BRUTO: TFMTBCDField;
    cdsVendaVolumePESO_LIQUIDO: TFMTBCDField;
    cdsVendaVolumeCUBAGEM: TBCDField;
    cdsTabelaItensCODBARRA_EAN: TStringField;
    qryTitulosEMPRESA: TStringField;
    lblContrato: TLabel;
    dbContrato: TJvDBComboEdit;
    fdQryTabelaCONTRATO: TLargeintField;
    fdQryTabelaNUMERO_CONTRATO: TStringField;
    procedure ImprimirOpcoesClick(Sender: TObject);
    procedure ImprimirOrcamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure dbFormaPagtoClick(Sender: TObject);
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
    procedure dbCFOPButtonClick(Sender: TObject);
    procedure btbtnFinalizarClick(Sender: TObject);
    procedure btbtnGerarNFeClick(Sender: TObject);
    procedure btnRegerarTituloClick(Sender: TObject);
    procedure dbCFOPVendaButtonClick(Sender: TObject);
    procedure btbtnCancelarVNDClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure nmImprimirDANFEClick(Sender: TObject);
    procedure btnConsultarProdutoClick(Sender: TObject);
    procedure dbTotalDescontoButtonClick(Sender: TObject);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgTitulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFormaPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFormaPagtoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTransporteInformeClick(Sender: TObject);
    procedure nmGerarImprimirBoletosClick(Sender: TObject);
    procedure nmPpReciboNFeClick(Sender: TObject);
    procedure nmPpChaveNFeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nmPpArquivoNFeClick(Sender: TObject);
    procedure nmEnviarEmailClienteClick(Sender: TObject);
    procedure nmImprimirNotaEntregaClick(Sender: TObject);
    procedure nmImprimirCartaCreditoClick(Sender: TObject);
    procedure nmPpLimparDadosNFeClick(Sender: TObject);
    procedure BtnCorrigirDadosNFeClick(Sender: TObject);
    procedure nmPpCorrigirDadosNFeCFOPClick(Sender: TObject);
    procedure RdgStatusVendaClick(Sender: TObject);
    procedure nmImprimirNotaEntregaXClick(Sender: TObject);
    procedure nmPpCarregarArquivoNFeClick(Sender: TObject);
    procedure nmPpCorrigirDadosEntregaClick(Sender: TObject);
    procedure btnTituloEditarClick(Sender: TObject);
    procedure cdsVendaFormaPagtoBeforePost(DataSet: TDataSet);
    procedure cdsVendaFormaPagtoNewRecord(DataSet: TDataSet);
    procedure cdsVendaVolumeNewRecord(DataSet: TDataSet);
    procedure cdsTabelaItensAfterScroll(DataSet: TDataSet);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure cdsTabelaItensSEQGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryTitulosCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaLUCRO_CALCULADOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure dbCSTKeyPress(Sender: TObject; var Key: Char);
    procedure nmGerarReciboAvulsoClick(Sender: TObject);
    procedure FrReciboA4GetValue(const VarName: string; var Value: Variant);
    procedure dbContratoButtonClick(Sender: TObject);
  private
    { Private declarations }
    FControllerTipoReceita,
    FControllerVendedor   : IControllerCustom;
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens     ,
    SQL_FormaPagto,
    SQL_Volume    ,
    SQL_Titulos   : TStringList;
    procedure AbrirTabelaItens(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure AbrirTabelaFormasPagto(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure AbrirTabelaVolume(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure AbrirTabelaTitulos(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure AbrirNotaFiscal(const Empresa : String; const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure GerarTitulos(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure CarregarDadosEmpresa(const pEmpresa, pTituloRelatorio : String);
    procedure CarregarLotes(const aEmpresa, aProduto : String; const aCliente : Integer; const aTodos : Boolean);
    procedure EscolherLote(const aCliente : Integer; const aQuantidade : Currency);
    procedure HabilitarDesabilitar_Btns;
    procedure GetComprasAbertas(iCodigoCliente : Integer);
    procedure ZerarFormaPagto;
    procedure RecarregarRegistro;
    procedure GravarEmailCliente(iCliente : Integer; sEmail : String);
    procedure ControleCampoLote;
    procedure DefinirCSTNaoTributada;
    procedure ConfigurarCamposTabelas;
    procedure CorrigirTotais;

    //function ValidarQuantidade(Codigo : Integer; Quantidade : Integer) : Boolean;
    function PossuiTitulosPagos(AnoVenda : Smallint; NumVenda : Integer) : Boolean;
    function GetTotalValorFormaPagto : Currency;
    function GetTotalValorFormaPagto_APrazo : Currency;
    function GetGerarEstoqueCliente(const aCliente : Integer; const Alertar : Boolean = TRUE) : Boolean;
    function FormaPagtoEmitiBoleto(const aFormaPagto : Integer) : Boolean;
    function BoletosGerados : Boolean;
    function ValidarGTIN : Boolean;

    function GetRotinaFinalizarID : String;
    function GetRotinaGerarNFeID : String;
    function GetRotinaCancelarVendaID : String;
    function GetRotinaGerarBoletoID : String;
    function GetRotinaEnviarEmailID : String;
    function GetRotinaCancelarPagtosID : String;

    procedure RegistrarNovaRotinaSistema;
    procedure pgcGuiasOnChange; override;
  public
    { Public declarations }
    property RotinaFinalizarID      : String read GetRotinaFinalizarID;
    property RotinaGerarNFeID       : String read GetRotinaGerarNFeID;
    property RotinaCancelarVendaID  : String read GetRotinaCancelarVendaID;
    property RotinaGerarBoletoID    : String read GetRotinaGerarBoletoID;
    property RotinaEnviarEmailID    : String read GetRotinaEnviarEmailID;
    property RotinaCancelarPagtosID : String read GetRotinaCancelarPagtosID;
  end;

(*
  Tabelas:
  - TBVENDAS
  - TBVENDAS_FORMAPAGTO
  - TBVENDAS_VOLUME
  - TVENDASITENS
  - TBCLIENTE
  - TBFORNECEDOR
  - TBFORMPAGTO
  - TBVENDEDOR
  - TBCFOP
  - TBPRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBUNIDADEPROD
  - TBPRODUTO_CLIENTE
  - SYS_IBPT
  - TBNFE_ENVIADA

  Views:
  - VW_CONDICAOPAGTO
  - VW_EMPRESA
  - VW_MODALIDADE_FRETE

  Procedures:
  - GET_LIMITE_DISPONIVEL_CLIENTE

*)

var
  frmGeVenda: TfrmGeVenda;

  procedure MostrarControleVendas(const AOwner : TComponent);

implementation

uses
    System.StrUtils
  , Service.InputQuery
  , Controller.Tabela
  , UDMBusiness
  , UFuncoes
  , View.Memo
  , View.Cliente
  , View.CondicaoPagto
  , View.Produto
  , View.CFOP
  , View.Contrato
  , View.ContaAReceber.Pagamento
  , UConstantesDGE, DateUtils, SysConst, UDMNFe, UGeGerarBoletos,
  UGeVendaGerarNFe, UGeVendaCancelar, UGeVendaFormaPagto, UGeVendaTransporte, UGeVendaConfirmaTitulos,
  {$IFNDEF PDV}UGeVendaDevolucaoNF, UGeConsultarLoteNFe_v2, UGeRequisicaoCliente, {$ENDIF}
  UDMRecursos,
  Service.Message;

{$R *.dfm}

(*
  IMR - 07/01/2016 :
    Inser��o do campo "NCM/SH" na grade de visualiza��o dos itens da venda para
    possibilitar a confer�ncia imediata dos c�digos NCM que ser�o utilizados nos
    produtos para a gera��o da NF-e.

*)

const
 COLUMN_LUCRO = 7;

procedure MostrarControleVendas(const AOwner : TComponent);
var
  frm : TfrmGeVenda;
  whr : String;
begin
  frm := TfrmGeVenda.Create(AOwner);
  try
    whr :=
      'cast(v.dtvenda as date) between ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
        QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ' and ' +
      ' (v.codemp in ( ' +
      '    Select      ' +
      '      vw.cnpj   ' +
      '    from VW_EMPRESA vw' +
      ' ))';

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      SQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeVenda.FormCreate(Sender: TObject);
begin
(*
  IMR - 22/04/2016 :
    Ativa��o do bot�o "Cancelar Vendas" para o m�dulo PDV para que estes possa
    cancelar suas pr�prias vendas finalizadas.

  IMR - 12/12/2014 :
    Ajustes da verifica��o do antamento do processo de emiss�o de Nota Fiscal, trocando o campo de valida�a� de "LOTE_NFE_NUMERO"
    para "LOTE_NFE_RECIBO"
*)
  TControllerFactory.New.Promocao.DesativarPromocoes;
  FControllerTipoReceita := TControllerFactory.New.TipoReceita;
  FControllerVendedor    := TControllerFactory.New.Vendedor;
  TController(FControllerVendedor).LookupComboBox(dbVendedor, dtsVendedor, 'vendedor_cod', 'codigo', 'nome');

  sGeneratorName := 'GEN_VENDAS_CONTROLE_' + FormatFloat('0000', YearOf(GetDateDB));
  CriarGenerator(sGeneratorName, 0);

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  SQL_FormaPagto := TStringList.Create;
  SQL_FormaPagto.Clear;
  SQL_FormaPagto.AddStrings( cdsVendaFormaPagto.SQL );

  SQL_Volume := TStringList.Create;
  SQL_Volume.Clear;
  SQL_Volume.AddStrings( cdsVendaVolume.SQL );

  SQL_Titulos := TStringList.Create;
  SQL_Titulos.Clear;
  SQL_Titulos.AddStrings( qryTitulos.SQL );

  e1Data.Date      := GetDateDB;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  CarregarLista(fdQryEmpresa);
  CarregarLista(cdsFormaPagto);
  CarregarLista(cdsCondicaoPagto);
  CarregarLista(fdQryModalidadeFrete);

  Case gSistema.Codigo of
    SISTEMA_PDV :
      RotinaID := ROTINA_MOV_VENDA_PDV_ID;
    else
      RotinaID := ROTINA_MOV_VENDA_ID;
  end;

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBVENDAS';
  CampoCodigo    := 'Codcontrol';
  CampoDescricao := 'c.NOME';
  CampoOrdenacao := 'v.dtvenda, c.Nome';

  WhereAdditional :=
    'cast(v.dtvenda as date) between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ' and ' +
    ' (v.codemp in ( ' +
    '    Select      ' +
    '      vw.cnpj   ' +
    '    from VW_EMPRESA vw' +
    ' ))';

  // A tela de vendas n�o pode atualizar generator porque este processo est� gerando erros
  // UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(GetDateDB)) );

  // Configurar Legendas de acordo com o segmento
  btnConsultarProduto.Caption := StrDescricaoProdutoBtn;
  btnConsultarProduto.Hint    := 'Consultar ' + StrDescricaoProdutoBtn;

  btbtnGerarNFe.Visible := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  if GetUserPermitirAlterarValorVenda then
  begin
    dbValorUnit.ReadOnly := False;
    dbValorUnit.TabStop  := True;
    dbValorUnit.Color    := dbProduto.Color;
  end;

  nmImprimirCartaCredito.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  nmGerarImprimirBoletos.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  nmEnviarEmailCliente.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  btbtnFinalizar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  ShpLucroZerado.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  lblLucroZerado.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  ShpLucroNegativo.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  lblLucroNegativo.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    Self.Caption       := 'Controle de Or�amentos/Vendas';
    btbtnLista.OnClick := ImprimirOrcamentoClick;
  end
  else
  begin
    Self.Caption       := 'Controle de Vendas';
    btbtnLista.OnClick := ImprimirOpcoesClick;
  end;

  lblReferencia.Visible := (gSistema.Codigo = SISTEMA_GESTAO_OPME);
  dbReferencia.Visible  := (gSistema.Codigo = SISTEMA_GESTAO_OPME);

  ConfigurarCamposTabelas;
end;

procedure TfrmGeVenda.btnFiltrarClick(Sender: TObject);
var
  aValor : Currency;
begin
  WhereAdditional :=
    'cast(v.dtvenda as date) between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ' and ' +
    ' (v.codemp in ( ' +
    '    Select      ' +
    '      vw.cnpj   ' +
    '    from VW_EMPRESA vw' +
    ' ))';
                        //'v.codemp = ' + QuotedStr(gUsuarioLogado.Empresa);
  if ( RdgStatusVenda.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (v.status = ' + IntToStr(RdgStatusVenda.ItemIndex) + ')';

  // Buscar registro pelo Valor
  aValor := StrToCurrDef(StringReplace(Trim(edtFiltrar.Text), '.', '', [rfReplaceAll]), 0) * 100;
  if ((Pos(',', Trim(edtFiltrar.Text)) > 0) and (aValor > 0.0)) then
    WhereAdditional := WhereAdditional + ' and (v.index_valor = ' + CurrToStr(aValor) + ')';

  inherited;
end;

procedure TfrmGeVenda.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sInscE,
  sNome : String;
  bBloqueado : Boolean;
  sBloqueado : String;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    if SelecionarCliente(Self, iCodigo, sCNPJ, sInscE, sNome, bBloqueado, sBloqueado) then
    begin
      if bBloqueado then
      begin
        ShowWarning('Cliente selecionado se encontra bloqueado!' + #13#13 + 'Motivo:' + #13 + sBloqueado);

        DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger       := 1;
        DtSrcTabela.DataSet.FieldByName('BLOQUEADO_MOTIVO').AsString := sBloqueado;
      end
      else
      begin
        DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger       := 0;
        DtSrcTabela.DataSet.FieldByName('BLOQUEADO_MOTIVO').AsString := EmptyStr;
      end;

      DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger    := iCodigo;
      DtSrcTabela.DataSet.FieldByName('CODCLI').AsString         := sCNPJ;
      DtSrcTabela.DataSet.FieldByName('NOME').AsString           := sNome;
      DtSrcTabela.DataSet.FieldByName('PESSOA_FISICA').AsInteger := IfThen(StrIsCPF(sCNPJ), 1, 0);
      DtSrcTabela.DataSet.FieldByName('INSCEST').AsString        := sInscE;
      DtSrcTabela.DataSet.FieldByName('CONTRATO').Clear;
      DtSrcTabela.DataSet.FieldByName('NUMERO_CONTRATO').Clear;

      DtSrcTabela.DataSet.FieldByName('DADOS_ENTREGA').AsString :=
        '* Respons�vel pela entrega..............: ' + #13 +
        '* Entregar a(o) Sr(a)...................: ' + #13#13 +
        '* Endere�o para entrega do(s) produto(s): ' + #13 + GetClienteEndereco(iCodigo, True);
    end;
end;

procedure TfrmGeVenda.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  if ( cdsVendaFormaPagto.State in [dsEdit, dsInsert] ) then
    if ( dtsCondicaoPagto.DataSet.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
    begin
      cdsVendaFormaPagtoVENDA_PRAZO.AsInteger := dtsCondicaoPagto.DataSet.FieldByName('Cond_prazo').AsInteger;
      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
      begin
        cdsVendaFormaPagto.FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
        if ( not dtsCondicaoPagto.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
          cdsVendaFormaPagto.FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := dtsCondicaoPagto.DataSet.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
      end;
    end;
end;

procedure TfrmGeVenda.dbContratoButtonClick(Sender: TObject);
var
  aContrato : TContrato;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if (DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger = 0) then
    begin
      TServiceMessage.ShowWarning('Selecione o cliente!');
      if dbCliente.Visible and dbCliente.Enabled then
        dbCliente.SetFocus;
    end
    else
    begin
      aContrato.Empresa := DtSrcTabela.DataSet.FieldByName('CODEMP').AsString;
      aContrato.Cliente := DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger;

      if SelecionarContratoCliente(Self, aContrato.Empresa, aContrato.Cliente, aContrato, True) then
      begin
        DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger := aContrato.Cliente;
        DtSrcTabela.DataSet.FieldByName('CODCLI').AsString := aContrato.Cnpj;
        DtSrcTabela.DataSet.FieldByName('NOME').AsString   := aContrato.Nome;
        DtSrcTabela.DataSet.FieldByName('CONTRATO').AsLargeInt  := aContrato.Controle;
        DtSrcTabela.DataSet.FieldByName('NUMERO_CONTRATO').AsString := aContrato.Numero;
      end;
    end;
  end;
end;

procedure TfrmGeVenda.dbCSTKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;

  if (Key = #13) then
  begin
    Key := #0;
    dbQuantidade.SetFocus;
  end;
end;

procedure TfrmGeVenda.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;

  FControllerVendedor.DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);

  DtSrcTabelaItens.AutoEdit   := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_VND_FIN );
  dtsVendaFormaPagto.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_VND_FIN );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeVenda.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirTabelaVolume( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
end;

procedure TfrmGeVenda.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeVenda.fdQryTabelaLUCRO_CALCULADOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
  begin
    if (Sender.AsCurrency > 100.0) then
      Text := '+100'
    else
      Text := FormatFloat(',0.0###', Sender.AsCurrency);
  end;
end;

procedure TfrmGeVenda.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DtSrcTabela.DataSet.FieldByName('DTVENDA').AsDateTime := GetDateTimeDB;
  DtSrcTabela.DataSet.FieldByName('CODEMP').AsString    := gUsuarioLogado.Empresa;
  DtSrcTabela.DataSet.FieldByName('FORMAPAG').AsString  := GetFormaPagtoNomeDefault;
  DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger     := GetCfopIDDefault;
  DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger := 0;
  DtSrcTabela.DataSet.FieldByName('CAIXA_PDV').AsInteger   := 0;
  DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger      := STATUS_VND_AND;
  DtSrcTabela.DataSet.FieldByName('TOTALVENDA_BRUTA').AsCurrency  := 0;
  DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency          := 0;
  DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency        := 0;
  DtSrcTabela.DataSet.FieldByName('GERAR_ESTOQUE_CLIENTE').AsInteger := 0;
  DtSrcTabela.DataSet.FieldByName('NFE_ENVIADA').AsInteger           := 0;
  DtSrcTabela.DataSet.FieldByName('NFE_DENEGADA').AsInteger          := 0;
  DtSrcTabela.DataSet.FieldByName('NFE_MODALIDADE_FRETE').AsInteger  := MODALIDADE_FRETE_SEMFRETE;
  DtSrcTabela.DataSet.FieldByName('USUARIO').AsString := gUsuarioLogado.Login;
  DtSrcTabela.DataSet.FieldByName('OBS').AsString     := DMNFe.GetInformacaoComplementar(gUsuarioLogado.Empresa);

  DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger    := CONSUMIDOR_FINAL_CODIGO;
  DtSrcTabela.DataSet.FieldByName('CODCLI').AsString         := CONSUMIDOR_FINAL_CNPJ;
  DtSrcTabela.DataSet.FieldByName('NOME').AsString           := GetClienteNome( CONSUMIDOR_FINAL_CODIGO );
  DtSrcTabela.DataSet.FieldByName('PESSOA_FISICA').AsInteger := 1;
  DtSrcTabela.DataSet.FieldByName('INSCEST').AsString        := 'ISENTO';

  if ( gUsuarioLogado.Vendedor = 0 ) then
    DtSrcTabela.DataSet.FieldByName('VENDEDOR_COD').AsInteger := GetVendedorIDDefault
  else
    DtSrcTabela.DataSet.FieldByName('VENDEDOR_COD').AsInteger := gUsuarioLogado.Vendedor;

  if (AnsiUpperCase(Trim(DtSrcTabela.DataSet.FieldByName('NOME').AsString)) <> CONSUMIDOR_FINAL_NOME) then
  begin
    DtSrcTabela.DataSet.FieldByName('CODCLIENTE').Clear;
    DtSrcTabela.DataSet.FieldByName('CODCLI').Clear;
    DtSrcTabela.DataSet.FieldByName('NOME').Clear;
  end;

  DtSrcTabela.DataSet.FieldByName('CONTRATO').Clear;
  DtSrcTabela.DataSet.FieldByName('NUMERO_CONTRATO').Clear;

  DtSrcTabela.DataSet.FieldByName('DADOS_ENTREGA').Clear;

  DtSrcTabela.DataSet.FieldByName('FORMAPAGTO_COD').Clear;
  DtSrcTabela.DataSet.FieldByName('CONDICAOPAGTO_COD').Clear;

  DtSrcTabela.DataSet.FieldByName('CAIXA_NUM').Clear;
  DtSrcTabela.DataSet.FieldByName('CAIXA_ANO').Clear;

  DtSrcTabela.DataSet.FieldByName('SERIE').Clear;
  DtSrcTabela.DataSet.FieldByName('NFE').Clear;
  DtSrcTabela.DataSet.FieldByName('LOTE_NFE_ANO').Clear;
  DtSrcTabela.DataSet.FieldByName('LOTE_NFE_NUMERO').Clear;
  DtSrcTabela.DataSet.FieldByName('NFE_TRANSPORTADORA').Clear;
  DtSrcTabela.DataSet.FieldByName('NFE_DENEGADA_MOTIVO').Clear;

  DtSrcTabela.DataSet.FieldByName('NFE_TRANSPORTADORA').Required := False;
  DtSrcTabela.DataSet.FieldByName('NFE_PLACA_VEICULO').Required  := False;
  DtSrcTabela.DataSet.FieldByName('NFE_PLACA_UF').Required       := False;

  CarregarDadosCFOP( cdsTabelaItensCFOP_COD.AsInteger );
end;

procedure TfrmGeVenda.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_VND_AND : Text := 'Em atendimento';
    STATUS_VND_ABR : Text := 'Aberta';
    STATUS_VND_FIN : Text := 'Finalizada';
    STATUS_VND_NFE : Text := IfThen(Sender.DataSet.FieldByName('modelo_nf').AsInteger = 0,  'NF-e', 'NFC-e');
    STATUS_VND_CAN : Text := 'Cancelada';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeVenda.DefinirCSTNaoTributada;
var
  aPessoaFisica    ,
  aInscricaoIsenta : Boolean;
begin
  with DtSrcTabela.DataSet do
  begin
    aPessoaFisica    := (FieldByName('PESSOA_FISICA').AsInteger = 1);
    aInscricaoIsenta := (Trim(FieldByName('INSCEST').AsString) = EmptyStr)
      or (AnsiUpperCase(Trim(FieldByName('INSCEST').AsString)) = 'ISENTO')
      or (AnsiUpperCase(Trim(FieldByName('INSCEST').AsString)) = 'ISENTA');
  end;

  with cdsTabelaItens do
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      if aPessoaFisica or aInscricaoIsenta then
      begin
        cdsTabelaItensCSOSN.AsString := TRIBUTO_NAO_TRIBUTADA_SN;
        cdsTabelaItensCST.AsString   := TRIBUTO_TRIBUTADA_ISENTA;
      end;
    end;
end;

procedure TfrmGeVenda.DtSrcTabelaItensStateChange(Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeVenda.AbrirTabelaItens(const AnoVenda : Smallint; const ControleVenda : Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.Ano        = ' + IntToStr(AnoVenda));
    Add('  and i.Codcontrol = ' + IntToStr(ControleVenda));
    Add('order by i.Ano, i.Codcontrol, i.Seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
  ControleCampoLote;
  CarregarLotes(
      cdsTabelaItensCODEMP.AsString
    , cdsTabelaItensCODPROD.AsString
    , cdsTabelaItensCODCLIENTE.AsInteger
    , not GetCfopMovimentaEstoque(cdsTabelaItensCFOP_COD.AsInteger));
end;

procedure TfrmGeVenda.AbrirTabelaFormasPagto(const AnoVenda : Smallint; const ControleVenda : Integer);
begin
  cdsVendaFormaPagto.Close;

  with cdsVendaFormaPagto, SQL do
  begin
    Clear;
    AddStrings( SQL_FormaPagto );
    Add('where f.ano_venda      = ' + IntToStr(AnoVenda));
    Add('  and f.controle_venda = ' + IntToStr(ControleVenda));
  end;

  cdsVendaFormaPagto.Open;
end;

procedure TfrmGeVenda.AbrirTabelaVolume(const AnoVenda: Smallint;
  const ControleVenda: Integer);
begin
  cdsVendaVolume.Close;

  with cdsVendaVolume, SQL do
  begin
    Clear;
    AddStrings( SQL_Volume );
    Add('where v.ano_venda      = ' + IntToStr(AnoVenda));
    Add('  and v.controle_venda = ' + IntToStr(ControleVenda));
  end;

  cdsVendaVolume.Open;
end;

procedure TfrmGeVenda.AbrirTabelaTitulos(const AnoVenda : Smallint; const ControleVenda : Integer);
begin
  qryTitulos.Close;

  with qryTitulos, SQL do
  begin
    Clear;
    AddStrings( SQL_Titulos );
    Add('where r.Anovenda = ' + IntToStr(AnoVenda));
    Add('  and r.Numvenda = ' + IntToStr(ControleVenda));
    Add('order by r.numlanc, r.parcela');
  end;

  qryTitulos.Open;
end;

procedure TfrmGeVenda.CarregarDadosProduto( Codigo : Integer);
begin
  if ( Codigo = 0 ) then
  begin
    ShowWarning('Favor informar o c�digo do produto');
    Exit;
  end;

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
        cdsTabelaItensCODPROD.AsString   := FieldByName('Cod').AsString;
        cdsTabelaItensDESCRI.AsString    := FieldByName('Descri').AsString;
        cdsTabelaItensDESCRI_APRESENTACAO.AsString := FieldByName('Descri_apresentacao').AsString;
        cdsTabelaItensUNP_SIGLA.AsString := FieldByName('Unp_sigla').AsString;

        if not qryCFOP.Active then
          CarregarDadosCFOP( FieldByName('Codcfop').AsInteger );

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNID_COD.AsInteger   := FieldByName('Codunidade').AsInteger;

        if ( FieldByName('Codcfop').AsInteger > 0 ) then
          cdsTabelaItensCFOP_COD.AsInteger := IfThen(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger = 0, FieldByName('Codcfop').AsInteger, DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger);

        cdsTabelaItensALIQUOTA.AsCurrency              := FieldByName('Aliquota').AsCurrency;
        cdsTabelaItensALIQUOTA_CSOSN.AsCurrency        := FieldByName('Aliquota_csosn').AsCurrency;
        cdsTabelaItensALIQUOTA_PIS.AsCurrency          := FieldByName('Aliquota_pis').AsCurrency;
        cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := FieldByName('Aliquota_cofins').AsCurrency;
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := FieldByName('Percentual_reducao_BC').AsCurrency;

        if ( Trim(FieldByName('Cst').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString       := FieldByName('Cst').AsString;

        if ( Trim(FieldByName('Csosn').AsString) <> EmptyStr ) then
          cdsTabelaItensCSOSN.AsString     := FieldByName('Csosn').AsString;

        CarregarDadosCFOP( cdsTabelaItensCFOP_COD.AsInteger );

        if ( Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString);

        cdsTabelaItensPUNIT.AsCurrency          := FieldByName('Preco').AsCurrency;
        cdsTabelaItensPUNIT_PROMOCAO.AsCurrency := FieldByName('Preco_Promocao').AsCurrency;
        cdsTabelaItensVALOR_IPI.AsCurrency      := FieldByName('Valor_ipi').AsCurrency;

        cdsTabelaItensESTOQUE.AsCurrency           := FieldByName('Qtde').AsCurrency;
        cdsTabelaItensRESERVA.AsCurrency           := FieldByName('Reserva').AsCurrency;
        cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger  := FieldByName('Movimenta_Estoque').AsInteger;
        cdsTabelaItensESTOQUE_APROP_LOTE.AsInteger := FieldByName('estoque_aprop_lote').AsInteger;
        cdsTabelaItensREFERENCIA.AsString          := IfThen(gSistema.Codigo = SISTEMA_GESTAO_OPME, FieldByName('referencia_fornecedor').AsString, FieldByName('referencia_cliente').AsString);

        if ( cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0 ) then
        begin
          cdsTabelaItensDESCONTO_VALOR.AsCurrency := cdsTabelaItensPUNIT.AsCurrency - cdsTabelaItensPUNIT_PROMOCAO.AsCurrency;
          cdsTabelaItensDESCONTO.AsCurrency       := cdsTabelaItensDESCONTO_VALOR.AsCurrency / cdsTabelaItensPUNIT.AsCurrency * 100;
        end;

        dbDesconto.ReadOnly      := (cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0);
        dbTotalDesconto.ReadOnly := (cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0);

        DefinirCSTNaoTributada;

        ControleCampoLote;
        CarregarLotes(
            cdsTabelaItensCODEMP.AsString
          , cdsTabelaItensCODPROD.AsString
          , cdsTabelaItensCODCLIENTE.AsInteger
          , not GetCfopMovimentaEstoque(cdsTabelaItensCFOP_COD.AsInteger));

        // Escollher o Lote mais adequado do produto

        {$IFNDEF PDV}
        if ( (gSistema.Codigo = SISTEMA_GESTAO_OPME)
          and (DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger <> CONSUMIDOR_FINAL_CODIGO) // N�o pode ser CONSUMIDOR FINAL
          and GetCfopFaturarRemessa(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger)             // CFOP de fatura de remessas de produtos j� enviadas ao cliente
          and (not GetCfopMovimentaEstoque(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger))     // CFOP n�o alterar o estoque atual de produtos da empresa
          and (not GetCfopDevolucao(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger))            // CFOP n�o pode configurar uma Devolu��o
        ) then
          EscolherLote(
              cdsTabelaItensCODCLIENTE.AsInteger
            , cdsTabelaItensQTDE.AsCurrency);
        {$ENDIF}
      end
      else
      begin
        ShowWarning('C�digo de produto n�o cadastrado');
        cdsTabelaItensCODPROD.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeVenda.CarregarLotes(const aEmpresa, aProduto: String; const aCliente : Integer; const aTodos : Boolean);
begin
  with fdQryLotes do
  begin
    fdQryLotes.Close;

    ParamByName('empresa').AsString       := aEmpresa;
    ParamByName('centro_custo').AsInteger := CENTRO_CUSTO_ESTOQUE_GERAL;
    ParamByName('cliente').AsInteger      := aCliente;
    ParamByName('produto').AsString       := aProduto;
    ParamByName('todos').AsInteger        := IfThen(aTodos, 1, 0);

    fdQryLotes.OpenOrExecute;
    fdQryLotes.Last;
    fdQryLotes.First;
  end;
end;

procedure TfrmGeVenda.EscolherLote(const aCliente : Integer; const aQuantidade : Currency);
begin
  if (not fdQryLotes.Active) then
    Exit
  else
  if fdQryLotes.IsEmpty then
    Exit
  else
  if not cdsTabelaItens.Active then
    Exit
  else
  if cdsTabelaItens.IsEmpty then
    Exit;

  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
  begin
    try
      try
        fdQryLotes.First;

        while not fdQryLotes.Eof do
        begin
          if (aCliente > 0) then
          begin
            if (fdQryLotes.FieldByName('qtde_cliente').AsCurrency > 0) then
            begin
              cdsTabelaItensLOTE_ID.AsString := fdQryLotes.FieldByName('id').AsString;
              Break;
            end;
          end
          else
          begin
            if (fdQryLotes.FieldByName('qtde_estoque').AsCurrency > 0) then
            begin
              cdsTabelaItensLOTE_ID.AsString := fdQryLotes.FieldByName('id').AsString;
              Break;
            end;
          end;

          fdQryLotes.Next;
        end;

        fdQryLotes.First;
      except
      end;
    finally
    end;
  end;
end;

procedure TfrmGeVenda.CarregarDadosCFOP( iCodigo : Integer );
begin
  with qryCFOP do
  begin
    Close;
    ParamByName('Cfop_cod').AsInteger := iCodigo;
    Open;

    if ( not cdsTabelaItens.Active ) then
      Exit
    else
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      if not IsEmpty then
        cdsTabelaItensCFOP_DESCRICAO.AsString := FieldByName('cfop_descricao').AsString
      else
        ShowWarning('C�digo CFOP n�o cadastrado');
    end;
  end;
end;

procedure TfrmGeVenda.CarregarDadosEmpresa(const pEmpresa, pTituloRelatorio : String);
begin
  try
    DMNFe.AbrirEmitente(pEmpresa);
    DMBusiness.ConfigurarEmail(pEmpresa, EmptyStr, pTituloRelatorio, EmptyStr);
  except
  end;
end;

procedure TfrmGeVenda.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnFinalizar.Enabled   := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty) and (not cdsVendaFormaPagto.IsEmpty);
    btbtnGerarNFe.Enabled    := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty);
    btbtnCancelarVND.Enabled := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );

    btnRegerarTitulo.Enabled := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]) and (qryTitulos.RecordCount = 0);
    btnTituloEditar.Enabled  := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]) and (not qryTitulos.IsEmpty);

    BtnTransporteInforme.Enabled := btbtnFinalizar.Enabled or btbtnGerarNFe.Enabled;

    btnGerarBoleto.Enabled   := GetEstacaoEmitiBoleto and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN); // and (DtSrcTabela.DataSet.FieldByName('FORMAPAGTO_COD').AsInteger = GetCondicaoPagtoIDBoleto);

    nmGerarImprimirBoletos.Enabled := (not qryTitulos.IsEmpty) and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_VND_CAN);

    nmImprimirDANFE.Enabled         := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) or (DtSrcTabela.DataSet.FieldByName('NFE_DENEGADA').AsInteger = 1) );
    nmImprimirNotaEntrega.Enabled   := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );
    nmImprimirNotaEntregaX.Enabled  := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );
    nmImprimirCartaCredito.Enabled  := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) ) and (DtSrcTabela.DataSet.FieldByName('GERAR_ESTOQUE_CLIENTE').AsInteger = 1);
    nmGerarReciboAvulso.Enabled     := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );
    nmGerarDANFEXML.Enabled         := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE);
    nmEnviarEmailCliente.Enabled    := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE);

    TbsInformeNFe.TabVisible    := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr);
    nmPpLimparDadosNFe.Enabled  := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);
    BtnLimparDadosNFe.Enabled   := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);
    BtnCorrigirDadosNFe.Enabled := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);

    nmPpCorrigirDadosNFeCFOP.Enabled := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);
    nmPpCorrigirDadosEntrega.Enabled := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]);
  end
  else
  begin
    btbtnFinalizar.Enabled   := False;
    btbtnGerarNFe.Enabled    := False;
    btbtnCancelarVND.Enabled := False;

    btnRegerarTitulo.Enabled := False;
    btnTituloEditar.Enabled  := False;

    BtnTransporteInforme.Enabled := False;

    nmGerarImprimirBoletos.Enabled := (not qryTitulos.IsEmpty) and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_VND_CAN);

    nmImprimirDANFE.Enabled         := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) or (DtSrcTabela.DataSet.FieldByName('NFE_DENEGADA').AsInteger = 1) );
    nmImprimirNotaEntrega.Enabled   := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );
    nmImprimirNotaEntregaX.Enabled  := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );
    nmImprimirCartaCredito.Enabled  := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) ) and (DtSrcTabela.DataSet.FieldByName('GERAR_ESTOQUE_CLIENTE').AsInteger = 1);
    nmGerarReciboAvulso.Enabled     := ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) or (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) );
    nmGerarDANFEXML.Enabled         := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE);
    nmEnviarEmailCliente.Enabled    := False;

    TbsInformeNFe.TabVisible    := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr);
    nmPpLimparDadosNFe.Enabled  := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);
    BtnLimparDadosNFe.Enabled   := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);
    BtnCorrigirDadosNFe.Enabled := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) and (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0);

    nmPpCorrigirDadosNFeCFOP.Enabled := False;
    nmPpCorrigirDadosEntrega.Enabled := False;
  end;
end;

(*
function TfrmGeVenda.ValidarQuantidade(Codigo : Integer; Quantidade : Integer) : Boolean;
var
  iEstoque ,
  iReserva : Currency;
begin
  with qryProduto do
  begin
    Close;
    ParamByName('Codigo').AsInt64 := Codigo;
    Open;

    iEstoque := FieldByName('Qtde').AsCurrency;
    iReserva := FieldByName('Reserva').AsCurrency;

    Result := ( (iEstoque - iReserva) >= Quantidade );
  end;
end;
*)

procedure TfrmGeVenda.dbFormaPagtoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( dtsFormaPagto.DataSet.Locate('cod', dbFormaPagto.Field.AsInteger, []) ) then
      DtSrcTabela.DataSet.FieldByName('FORMAPAG').AsString := dtsFormaPagto.DataSet.FieldByName('descri').AsString;
end;

procedure TfrmGeVenda.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger > STATUS_VND_ABR ) then
  begin
    Case DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger of
      STATUS_VND_FIN : sMsg := 'Esta venda n�o pode ser exclu�da porque est� finalizada.';
      STATUS_VND_NFE : sMsg := 'Esta venda n�o pode ser exclu�da porque tem NF-e/NFC-e emitida';
      STATUS_VND_CAN : sMsg := 'Esta venda n�o pode ser exclu�da porque est� cancelada';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaVolume( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    end;
  end;
end;

procedure TfrmGeVenda.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( cdsTabelaItens.Active ) then
  begin

    if ( GetSegmentoID(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString) = SEGMENTO_MERCADO_CARRO_ID ) then
    begin
      dbCST.ReadOnly := False;
      dbCST.TabStop  := True;
      dbCST.Color    := clWhite;
    end
    else
    begin
      dbCST.ReadOnly := True;
      dbCST.TabStop  := False;
      dbCST.Color    := clMoneyGreen;
    end;

    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensSEQ.Value         := Sequencial;
    cdsTabelaItensCODVENDEDOR.AsInteger := DtSrcTabela.DataSet.FieldByName('VENDEDOR_COD').AsInteger;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeVenda.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbQuantidade.SetFocus;
  end;
end;

procedure TfrmGeVenda.btnProdutoExcluirClick(Sender: TObject);

  procedure GetToTais(var Descontos, TotalLiquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o �tem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;

      GetToTais(cDescontos, cTotalLiquido);

      DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency   := cDescontos;
      DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency := cTotalLiquido;

      if ( DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency < 0 ) then
        DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency := 0;

      if ( DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency < 0 ) then
        DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency := 0;
    end;
end;

procedure TfrmGeVenda.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido, vBC_ICMS, vICMS: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;
    vBC_ICMS       := 0.0;
    vICMS          := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + cdsTabelaItensTOTAL_BRUTO.AsCurrency;
      Total_desconto := Total_desconto + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;

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

    Total_Liquido  := Total_Bruto - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido ,
  cValorBaseIcms,
  cValorIcms    : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensCODPROD.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o c�digo do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( Trim(cdsTabelaItensCST.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o C�digo de Situa��o Fiscal (CST) do produto.');
      dbCST.SetFocus;
    end
    else
    if (StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('CST').AsString, -1) = -1) then
    begin
      ShowWarning('C�digo CST inv�lido.');
      dbCST.SetFocus;
    end
    else
    if ( cdsTabelaItensQTDE.Value < 0 ) then
    begin
      ShowWarning('Quantidade inv�lida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( dbLoteProduto.Visible and (fdQryLotes.RecordCount > 0) and (Trim(cdsTabelaItensLOTE_ID.AsString) = EmptyStr) ) then
    begin
      ShowWarning('Selecionar o Lote do Produto.');
      dbLoteProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensPUNIT.Value <= 0 ) then
    begin
      ShowWarning('Valor unit�rio inv�lida.');
      dbValorUnit.SetFocus;
    end
    else
    if ( (cdsTabelaItensDESCONTO.AsCurrency < 0) or (cdsTabelaItensDESCONTO.AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual de desconto inv�lido.');
      dbDesconto.SetFocus;
    end
    else
    if ( (cdsTabelaItensDESCONTO.AsCurrency > GetLimiteDescontoUser) and (cdsTabelaItensPUNIT_PROMOCAO.AsCurrency = 0) ) then
    begin
      ShowWarning('Limite de Desconto = ' + FormatFloat('0.00', GetLimiteDescontoUser) + '%');
      dbDesconto.SetFocus;
    end
    else
    begin

      if ( Trim(cdsTabelaItensCST.AsString) = EmptyStr ) then
        cdsTabelaItensCST.Clear;

      if ( Trim(cdsTabelaItensLOTE_ID.AsString) = EmptyStr ) then
        cdsTabelaItensLOTE_ID.Clear;

      if ( Trim(cdsTabelaItensREFERENCIA.AsString) = EmptyStr ) then
        cdsTabelaItensREFERENCIA.Clear;

      if cdsTabelaItensSEQ.IsNull then
        cdsTabelaItensSEQ.AsInteger := 1;

      cdsTabelaItens.Post;

      GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido, cValorBaseIcms, cValorIcms);

      DtSrcTabela.DataSet.FieldByName('TOTALVENDA_BRUTA').AsCurrency := cTotalBruto;
      DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency         := cTotalDesconto;
      DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency       := cTotalLiquido;

      if ( cdsVendaFormaPagto.RecordCount <= 1 ) then
      begin
        if ( not (cdsVendaFormaPagto.State in [dsEdit, dsInsert]) ) then
          cdsVendaFormaPagto.Edit;

        cdsVendaFormaPagtoVALOR_FPAGTO.Value := cTotalLiquido;
      end;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeVenda.btbtnSalvarClick(Sender: TObject);
var
  iNumero : Integer;
begin
  if ( cdsVendaFormaPagto.State in [dsEdit, dsInsert] ) then
    cdsVendaFormaPagto.Post;
    
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da venda.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar altera��o em andamento no �tem da venda!');
    btnProdutoSalvar.SetFocus;
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
  if ( GetTotalValorFormaPagto > DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MAIOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MENOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  begin
    inherited;

    if (not OcorreuErro) then
    begin

      // Salvar Itens

      if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;
      cdsTabelaItens.CommitUpdates;

      // Salvar Formas de Pagamentos

      if ( cdsVendaFormaPagto.State in [dsEdit, dsInsert] ) then
        cdsVendaFormaPagto.Post;

      cdsVendaFormaPagto.ApplyUpdates;
      cdsVendaFormaPagto.CommitUpdates;

      CommitTransaction;

      iNumero := DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger;

      DtSrcTabela.DataSet.Close;
      DtSrcTabela.DataSet.Open;

      DtSrcTabela.DataSet.Locate(CampoCodigo, iNumero, []);

      AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaVolume( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

      // Corrigir Total Forma Pagto

      if ((cdsVendaFormaPagto.RecordCount = 1) and (cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency <> DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency)) then
      begin
        cdsVendaFormaPagto.Edit;
        cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency := DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency;
        cdsVendaFormaPagto.Post;
        cdsVendaFormaPagto.ApplyUpdates;
        cdsVendaFormaPagto.CommitUpdates;

        CommitTransaction;
      end;

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeVenda.ConfigurarCamposTabelas;
begin
  // Configurar tabela de cadastro
  Tabela
    .Display('CODCONTROL', 'No. Venda', '###0000000', TAlignment.taCenter)
    .Display('TOTALVENDA_BRUTA', 'Total Venda (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('DESCONTO', 'Desconto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('TOTALVENDA', 'Total L�quido (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('LUCRO_CALCULADO', 'Lucro Calculado (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( cdsTabelaItens )
    .Display('QTDE',  'Qtde.', ',0.##', TAlignment.taRightJustify)
    .Display('PUNIT', 'Valor Unit�rio (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('PUNIT_PROMOCAO', 'Valor Promo��o (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('DESCONTO',       '% Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('DESCONTO_VALOR', 'Desconto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('PFINAL',    'Valor Bruto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('QTDEFINAL', 'Saldo Estoque', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA',        '% Al�quota', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA_CSOSN',  '% Al�quota SN', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA_PIS',    '% Al�quota PIS', ',0.00', TAlignment.taRightJustify)
    .Display('ALIQUOTA_COFINS', '% Al�quota COFINS', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_IPI', 'Valor IPI (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('PERCENTUAL_REDUCAO_BC', '% Redu��o BC', ',0.##', TAlignment.taRightJustify)
    .Display('TOTAL_BRUTO',    'Total Produto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_DESCONTO', 'Total Desconto (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_LIQUIDO',  'Total L�quido (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('ESTOQUE', 'Estoque', ',0.###', TAlignment.taRightJustify)
    .Display('RESERVA', 'Reserva', ',0.###', TAlignment.taRightJustify)
    .Configurar( cdsTabelaItens );

  // Configurar tabela das formas de pagamento
  TTabelaController
    .New
    .Tabela( cdsVendaFormaPagto )
    .Display('VALOR_FPAGTO', 'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsVendaFormaPagto );

  // Configurar tabela dos volumes
  TTabelaController
    .New
    .Tabela( cdsVendaVolume )
    .Display('PESO_BRUTO', 'Peso Bruto (Kg)', ',0.###', TAlignment.taRightJustify)
    .Display('PESO_LIQUIDO', 'Peso L�quido (Kg)', ',0.###', TAlignment.taRightJustify)
    .Display('CUBAGEM', 'Cubagem (m�)', ',0.###', TAlignment.taRightJustify)
    .Configurar( cdsVendaVolume );

  // Configurar tabela dos t�tulos
  TTabelaController
    .New
    .Tabela( qryTitulos )
    .Display('VALORREC', 'Valor A Receber (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('PERCENTJUROS', '% JUros', ',0.00', TAlignment.taRightJustify)
    .Display('PERCENTMULTA', '% Multa', ',0.00', TAlignment.taRightJustify)
    .Display('PERCENTDESCONTO', '% Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('VALORRECTOT', 'Total Recebido (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'Saldo A Receber (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('PGTO_VALOR', 'Valor Pago (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( qryTitulos );
end;

procedure TfrmGeVenda.ControleCampoLote;
begin
  lblLoteProduto.Visible := (cdsTabelaItensESTOQUE_APROP_LOTE.AsInteger = FLAG_SIM);
  dbLoteProduto.Visible  := (cdsTabelaItensESTOQUE_APROP_LOTE.AsInteger = FLAG_SIM);
end;

procedure TfrmGeVenda.ControlEditExit(Sender: TObject);

  procedure EditarCampo(const aComponente : TDBEdit; aLiberar : Boolean);
  begin
    aComponente.ReadOnly := not aLiberar;
    aComponente.TabStop  := aLiberar;

    if aLiberar then
      aComponente.Color    := dbProduto.Color
    else
      aComponente.Color    := dbProdutoNome.Color;
  end;

var
  limitedesc,
  perc      : variant;
  cPrecoVND : Currency;
  cLiberar  : Boolean;
begin
  inherited;

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensCODPROD.AsString, 0) );

  if ( Sender = dbCFOPVenda ) then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger );

  if ( Sender = dbCFOP ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( cdsTabelaItensCFOP_COD.AsInteger );

  if ( (Sender = dbCFOPVenda) or (Sender = dbCFOP) ) then
  begin
    // Liberar edi��o de campos caso o CFOP seja de devolu��o
    cLiberar := GetCfopDevolucao( TJvDBComboEdit(Sender).Field.AsInteger );
    EditarCampo(dbAliquota, cLiberar);
    EditarCampo(dbCST, cLiberar);
    EditarCampo(dbPercRedBC, cLiberar);
    EditarCampo(dbValorUnit, cLiberar);
    EditarCampo(dbValorIPI, cLiberar);

    // Liberar edi��o do campo quando segmento de vendas for COMERCIALIZA��O DE CARROS
    if (GetSegmentoID(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString) = SEGMENTO_MERCADO_CARRO_ID) then
      EditarCampo(dbCST, True);

    // Liberar edi��o do campo de acordo com a permiss�o do usu�rio
    if not cLiberar then
      EditarCampo(dbValorUnit, gUsuarioLogado.AlterarValorVenda);
  end;

  if ( (Sender = dbQuantidade) or (Sender = dbValorUnit) or (Sender = dbDesconto) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      if ( cdsTabelaItensPUNIT_PROMOCAO.IsNull ) then
        cdsTabelaItensPUNIT_PROMOCAO.AsCurrency := 0;

      if ( cdsTabelaItensPUNIT.IsNull ) then
        cdsTabelaItensPUNIT.AsCurrency := 0;

      if ( cdsTabelaItensDESCONTO.IsNull ) then
        cdsTabelaItensDESCONTO.AsCurrency := 0;

      cPrecoVND := cdsTabelaItensPUNIT.AsCurrency;

      cdsTabelaItensDESCONTO_VALOR.AsCurrency := cPrecoVND * cdsTabelaItensDESCONTO.AsCurrency / 100;
      cdsTabelaItensPFINAL.AsCurrency         := cPrecoVND - cdsTabelaItensDESCONTO_VALOR.AsCurrency;
      cdsTabelaItensTOTAL_BRUTO.AsCurrency    := cdsTabelaItensQTDE.AsCurrency * cPrecoVND;
      cdsTabelaItensTOTAL_DESCONTO.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensDESCONTO_VALOR.AsCurrency;
      cdsTabelaItensTOTAL_LIQUIDO.AsCurrency  := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
    end;

  if ( (Sender = dbValorLiq) and (not dbReferencia.Visible) and (not dbLoteProduto.Visible) ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

  if ( (Sender = dbReferencia) and (not dbLoteProduto.Visible) ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

  if ( Sender = dbLoteProduto ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeVenda.CorrigirTotais;
var
  aValorVND : Currency;
  aTotalBruto   ,
  aTotalDesconto,
  aTotalLiquido ,
  aBCICMS,
  aICMS  : Currency;
begin
  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_AND, STATUS_VND_ABR]) then
  begin
    DtSrcTabelaItens.DataSet.First;
    DtSrcTabelaItens.DataSet.DisableControls;
    try
      aTotalBruto    := 0.0;
      aTotalDesconto := 0.0;
      aTotalLiquido  := 0.0;
      aBCICMS := 0.0;
      aICMS   := 0.0;

      while (not DtSrcTabelaItens.DataSet.Eof) do
      begin
        // Atualizar valores totais do item
        DtSrcTabelaItens.DataSet.Edit;

        if DtSrcTabelaItens.DataSet.FieldByName('PUNIT_PROMOCAO').IsNull then
          DtSrcTabelaItens.DataSet.FieldByName('PUNIT_PROMOCAO').AsCurrency := 0;

        if DtSrcTabelaItens.DataSet.FieldByName('PUNIT').IsNull then
          DtSrcTabelaItens.DataSet.FieldByName('PUNIT').AsCurrency := 0;

        if DtSrcTabelaItens.DataSet.FieldByName('DESCONTO').IsNull then
          DtSrcTabelaItens.DataSet.FieldByName('DESCONTO').AsCurrency := 0;

        aValorVND := DtSrcTabelaItens.DataSet.FieldByName('PUNIT').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('DESCONTO_VALOR').AsCurrency := aValorVND * DtSrcTabelaItens.DataSet.FieldByName('DESCONTO').AsCurrency / 100;
        DtSrcTabelaItens.DataSet.FieldByName('PFINAL').AsCurrency         := aValorVND - DtSrcTabelaItens.DataSet.FieldByName('DESCONTO_VALOR').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency    := DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency * aValorVND;
        DtSrcTabelaItens.DataSet.FieldByName('TOTAL_DESCONTO').AsCurrency := DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('DESCONTO_VALOR').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('TOTAL_LIQUIDO').AsCurrency  := DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency - DtSrcTabelaItens.DataSet.FieldByName('TOTAL_DESCONTO').AsCurrency;

        DtSrcTabelaItens.DataSet.Post;

        // Montar os valores totais da venda
        aTotalBruto    := aTotalBruto    + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
        aTotalDesconto := aTotalDesconto + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_DESCONTO').AsCurrency;

        if (DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency > 0) then
        begin
          aBCICMS := aBCICMS + (DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency / 100);
          aICMS   := aICMS   + (((DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency / 100)) * DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100);
        end
        else
        begin
          aBCICMS := aBCICMS + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
          aICMS   := aICMS   + (DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100);
        end;

        DtSrcTabelaItens.DataSet.Next;
      end;

      cdsTabelaItens.ApplyUpdates;
      cdsTabelaItens.CommitUpdates;

      aTotalLiquido := aTotalBruto - aTotalDesconto;

      // Atualizar totais na venda
      DtSrcTabela.DataSet.Edit;
      DtSrcTabela.DataSet.FieldByName('TOTALVENDA_BRUTA').AsCurrency := aTotalBruto;
      DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency         := aTotalDesconto;
      DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency       := aTotalLiquido;
      DtSrcTabela.DataSet.Post;

      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      // Corrigir Total Forma Pagto
      if ((dtsVendaFormaPagto.DataSet.RecordCount = 1) and (dtsVendaFormaPagto.DataSet.FieldByName('VALOR_FPAGTO').AsCurrency <> DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency)) then
      begin
        dtsVendaFormaPagto.DataSet.Edit;
        dtsVendaFormaPagto.DataSet.FieldByName('VALOR_FPAGTO').AsCurrency := DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency;
        dtsVendaFormaPagto.DataSet.Post;

        cdsVendaFormaPagto.ApplyUpdates;
        cdsVendaFormaPagto.CommitUpdates;
      end;
    finally
      DtSrcTabelaItens.DataSet.First;
      DtSrcTabelaItens.DataSet.EnableControls;
    end;
  end;
end;

procedure TfrmGeVenda.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirTabelaVolume( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

  pgcMaisDados.ActivePage := tbsRecebimento;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeVenda.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;
  if ( not OcorreuErro ) then
  begin
    DtSrcTabela.DataSet.FieldByName('ANO').AsInteger        := iAno;
    DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger := iNum;

    AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaVolume( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

    ZerarFormaPagto;

    RdgStatusVenda.ItemIndex := 0;
  end;
end;

procedure TfrmGeVenda.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger > STATUS_VND_ABR ) then
  begin
    Case DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger of
      STATUS_VND_FIN : sMsg := 'Esta venda n�o pode ser alterada porque est� finalizada.';
      STATUS_VND_NFE : sMsg := 'Esta venda n�o pode ser alterada porque tem NF-e/NFC-e emitida';
      STATUS_VND_CAN : sMsg := 'Esta venda n�o pode ser alterada porque est� cancelada';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaVolume( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
      AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    end;
  end;
end;

procedure TfrmGeVenda.dbProdutoButtonClick(Sender: TObject);
var
  aProduto : TProdutoServico;
begin
  aProduto.aValorPromocao := 0.0;
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProdutoParaVenda(Self, aProduto) ) then
    begin
      cdsTabelaItensCODPROD.AsString      := aProduto.aCodigoAlfa;
      cdsTabelaItensCODBARRA_EAN.AsString := aProduto.aCodigoEAN;
      cdsTabelaItensDESCRI.AsString       := aProduto.aDescricao;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString := aProduto.aNome;
      cdsTabelaItensUNID_COD.AsInteger   := aProduto.aUnidadeCompra.aCodigo;
      cdsTabelaItensUNP_SIGLA.AsString   := aProduto.aUnidadeCompra.aSigla;

      cdsTabelaItensCST.AsString         := aProduto.aCST;
      cdsTabelaItensNCM_SH.AsString      := aProduto.aNCM_SH;
      cdsTabelaItensCFOP_COD.AsInteger   := aProduto.aCFOP;

      cdsTabelaItensALIQUOTA.AsCurrency        := aProduto.aAliquota;
      cdsTabelaItensALIQUOTA_PIS.AsCurrency    := aProduto.aAliquotaPIS;
      cdsTabelaItensALIQUOTA_COFINS.AsCurrency := aProduto.aAliquotaCOFINS;

      cdsTabelaItensPUNIT.AsCurrency          := aProduto.aValorVenda;
      cdsTabelaItensPUNIT_PROMOCAO.AsCurrency := aProduto.aValorPromocao;
      cdsTabelaItensPFINAL.AsCurrency    := aProduto.aValorVenda;
      cdsTabelaItensVALOR_IPI.AsCurrency := aProduto.aValorIPI;

      cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := aProduto.aPercentualRedBC;

      cdsTabelaItensESTOQUE.AsCurrency := aProduto.aEstoque;
      cdsTabelaItensRESERVA.AsCurrency := aProduto.aReserva;

      cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger  := IfThen(aProduto.aMovimentaEstoque, FLAG_SIM, FLAG_NAO);
      cdsTabelaItensESTOQUE_APROP_LOTE.AsInteger := IfThen(aProduto.aEstoquePorLote, FLAG_SIM, FLAG_NAO);

      if not qryCFOP.Active then
        CarregarDadosCFOP( DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger );

      if ( Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString) <> EmptyStr ) then
        cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString);

      if ( aProduto.aValorPromocao > 0 ) then
      begin
        cdsTabelaItensDESCONTO_VALOR.AsCurrency := aProduto.aValorVenda - aProduto.aValorPromocao;
        cdsTabelaItensDESCONTO.AsCurrency       := cdsTabelaItensDESCONTO_VALOR.AsCurrency / cdsTabelaItensPUNIT.AsCurrency * 100;
      end;

      dbDesconto.ReadOnly      := (aProduto.aValorPromocao > 0);
      dbTotalDesconto.ReadOnly := (aProduto.aValorPromocao > 0);

      DefinirCSTNaoTributada;

      ControleCampoLote;
      CarregarLotes(
          cdsTabelaItensCODEMP.AsString
        , cdsTabelaItensCODPROD.AsString
        , cdsTabelaItensCODCLIENTE.AsInteger
        , not GetCfopMovimentaEstoque(cdsTabelaItensCFOP_COD.AsInteger));

        // Escollher o Lote mais adequado do produto

      {$IFNDEF PDV}
      if ( (gSistema.Codigo = SISTEMA_GESTAO_OPME)
        and (DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger <> CONSUMIDOR_FINAL_CODIGO) // N�o pode ser CONSUMIDOR FINAL
        and GetCfopFaturarRemessa(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger)             // CFOP de fatura de remessas de produtos j� enviadas ao cliente
        and (not GetCfopMovimentaEstoque(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger))     // CFOP n�o alterar o estoque atual de produtos da empresa
        and (not GetCfopDevolucao(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger))            // CFOP n�o pode configurar uma Devolu��o
      ) then
        EscolherLote(
            cdsTabelaItensCODCLIENTE.AsInteger
          , cdsTabelaItensQTDE.AsCurrency);
      {$ENDIF}
    end;
end;

procedure TfrmGeVenda.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, TTipoCFOP.tcfopSaida, iCodigo, sDescricao) ) then
    begin
      cdsTabelaItensCFOP_COD.AsInteger      := iCodigo;
      cdsTabelaItensCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeVenda.cdsTabelaItensAfterScroll(DataSet: TDataSet);
begin
  ControleCampoLote;
  CarregarLotes(
      cdsTabelaItensCODEMP.AsString
    , cdsTabelaItensCODPROD.AsString
    , cdsTabelaItensCODCLIENTE.AsInteger
    , not GetCfopMovimentaEstoque(cdsTabelaItensCFOP_COD.AsInteger));
end;

procedure TfrmGeVenda.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.AsInteger        := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
  cdsTabelaItensCODCONTROL.AsInteger := DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger;
  cdsTabelaItensDTVENDA.AsDateTime   := DtSrcTabela.DataSet.FieldByName('DTVENDA').AsDateTime;
  cdsTabelaItensCODEMP.AsString      := DtSrcTabela.DataSet.FieldByName('CODEMP').AsString;
  cdsTabelaItensCODCLI.AsString      := DtSrcTabela.DataSet.FieldByName('CODCLI').AsString;
  cdsTabelaItensCODCLIENTE.AsInteger := DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger;

  if ( DtSrcTabela.DataSet.FieldByName('CFOP').IsNull ) then
  begin
    cdsTabelaItensCFOP_COD.Value        := GetCfopIDDefault;
    cdsTabelaItensCFOP_DESCRICAO.Value  := GetCfopNomeDefault;
  end
  else
  begin
    if not qryCFOP.Active then
    begin
      qryCFOP.Close;
      qryCFOP.ParamByName('Cfop_cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger;
      qryCFOP.Open;
    end;

    cdsTabelaItensCFOP_COD.Assign( DtSrcTabela.DataSet.FieldByName('CFOP') );
    cdsTabelaItensCFOP_DESCRICAO.Assign( qryCFOP.FieldByName('cfop_descricao') );
  end;

  cdsTabelaItensCST.Value             := '000';
  cdsTabelaItensPUNIT_PROMOCAO.Value  := 0.0;
  cdsTabelaItensALIQUOTA.Value        := 0;
  cdsTabelaItensALIQUOTA_PIS.Value    := 0.0;
  cdsTabelaItensALIQUOTA_COFINS.Value := 0.0;
  cdsTabelaItensQTDE.Value            := 1;
  cdsTabelaItensQTDEFINAL.Value       := 0;
  cdsTabelaItensDESCONTO.Value        := 0;
  cdsTabelaItensDESCONTO_VALOR.Value  := 0;
  cdsTabelaItensPERCENTUAL_REDUCAO_BC.Value := 0.0;
  cdsTabelaItensESTOQUE_APROP_LOTE.Value    := FLAG_NAO;

  cdsTabelaItensLOTE_ID.Clear;
  cdsTabelaItensREFERENCIA.Clear;
end;

procedure TfrmGeVenda.cdsTabelaItensSEQGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Text := IntToStr(cdsTabelaItens.RecNo);
end;

procedure TfrmGeVenda.btbtnFinalizarClick(Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    try
      Return := not GetPermitirVendaEstoqueInsEmpresa(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString); // Permitir vendas de produtos com estoque insuficiente

      if Return then
      begin

        cdsTabelaItens.First;
        cdsTabelaItens.DisableControls;
        while not cdsTabelaItens.Eof do
        begin
          if ( cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger = 0 ) then // Produto n�o movimenta estoque
            Return := False
          else
          if not GetCfopMovimentaEstoque(cdsTabelaItensCFOP_COD.AsInteger) then // CFOP n�o altera (movimenta) estoque
            Return := False
          else
            Return := ( (cdsTabelaItensQTDE.AsCurrency > (cdsTabelaItensESTOQUE.AsCurrency - cdsTabelaItensRESERVA.AsCurrency)) or (cdsTabelaItensESTOQUE.AsCurrency <= 0) );

          if ( Return ) then
            Break;

          cdsTabelaItens.Next;
        end;

      end;
    finally
      cdsTabelaItens.EnableControls;
      Result := Return;
    end;
  end;

var
  iGerarEstoqueCliente,
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  aGerarTitulos   : Boolean;
begin
  if (DtSrcTabela.DataSet.IsEmpty or cdsTabelaItens.IsEmpty) then
    Exit;

  if (not GetPermissaoRotinaInterna(Sender, True)) then
    Abort;

  CxAno    := 0;
  CxNumero := 0;
  CxContaCorrente := 0;

  RecarregarRegistro;
  CorrigirTotais;

  aGerarTitulos := GetCfopGerarTitulo(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger);

  AbrirTabelaItens(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger);
  AbrirTabelaFormasPagto( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

  pgcGuias.ActivePage := tbsCadastro;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN) then
  begin
    ShowWarning('Movimento de Venda j� finalizada!');
    Abort;
  end;

  if (cdsTabelaItens.RecordCount = 0) then
  begin
    ShowWarning('Movimento de Venda sem produto(s)!');
    Abort;
  end;

  // Verificar se cliente est� bloqueado, caso a venda seja a prazo

  if (aGerarTitulos and (DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger = 1)) then
    if (DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger = 1) then
    begin
      ShowWarning('Cliente bloqueado!' + #13#13 + 'Motivo:' + #13 + DtSrcTabela.DataSet.FieldByName('BLOQUEADO_MOTIVO').AsString);
      Exit;
    end;

  // Verificar se existe caixa aberto para o usu�rio do sistema quando o CFOP
  // permitir a gera��o de t�tulos

  if aGerarTitulos then
    if cdsVendaFormaPagto.Locate('VENDA_PRAZO', 0, []) then
      if ( not CaixaAberto(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, gUsuarioLogado.Login
        , GetDateDB
        , cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger
        , CxAno
        , CxNumero
        , CxContaCorrente) ) then
      begin
        ShowWarning('N�o existe caixa aberto para o usu�rio na forma de pagamento ' + QuotedStr(cdsVendaFormaPagtoFormaPagto.AsString) + '.');
        Exit;
      end;

  if ( DtSrcTabela.DataSet.FieldByName('VENDEDOR_COD').AsInteger = 0 ) then
  begin
    DtSrcTabela.DataSet.Edit;
    ShowWarning('Favor informar o vendedor');
    dbVendedor.SetFocus;
  end
  else
  if ( QuantidadeInvalida ) then
  begin
    DtSrcTabela.DataSet.Edit;
    ShowWarning('Quantidade informada para o �tem ' + FormatFloat('#00', cdsTabelaItensSEQ.AsInteger) + ' est� acima da quantidade dispon�vel no estoque.');
    if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      btnProdutoEditar.SetFocus;
  end
  else
  begin
    // Verificar dados da(s) Forma(s) de Pagamento(s)

    if ( cdsVendaFormaPagto.RecordCount = 0 ) then
    begin
      ShowWarning('Favor informar a forma e/ou condi��o de pagamento');
      DtSrcTabela.DataSet.Edit;
      pgcMaisDados.ActivePage := tbsRecebimento;
      dbgFormaPagto.SetFocus;
    end
    else
    if ( GetTotalValorFormaPagto <= 0 ) then
    begin
      ShowWarning('Favor informar corretamente o valor de cada forma/condi��o de pagamento');
      DtSrcTabela.DataSet.Edit;
      pgcMaisDados.ActivePage := tbsRecebimento;
      dbgFormaPagto.SetFocus;
    end
    else
    if ( GetTotalValorFormaPagto > DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency ) then
    begin
      ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MAIOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
      DtSrcTabela.DataSet.Edit;
      pgcMaisDados.ActivePage := tbsRecebimento;
      dbgFormaPagto.SetFocus;
    end
    else
    if ( GetTotalValorFormaPagto < DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency ) then
    begin
      ShowWarning('O Total A Pagar informado na forma/condi��o de pagamento � MENOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
      DtSrcTabela.DataSet.Edit;
      pgcMaisDados.ActivePage := tbsRecebimento;
      dbgFormaPagto.SetFocus;
    end
    else
    begin
      if ( ShowConfirm('Confirma a finaliza��o da venda selecionada?') ) then
      begin

        if ( aGerarTitulos and (DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger = 1) ) then
        begin
          GetComprasAbertas( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger );
          if ( (qryTotalComprasAbertas.FieldByName('VALOR_LIMITE').AsCurrency > 0.0) and (GetTotalValorFormaPagto_APrazo > qryTotalComprasAbertas.FieldByName('VALOR_LIMITE_DISPONIVEL').AsCurrency) ) then
          begin
            ShowWarning(
                'O Valor Total A Prazo da venda est� acima do Valor Limite dispon�vel para o cliente.'
              + #13#13 + 'Favor comunicar ao setor financeiro para que este verifique no Cadastro do Cliente '
              + 'o Valor Limite de Compras e seu Saldo Dispon�vel.');
            Exit;
          end;
        end;

        if GetGerarEstoqueCliente(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger) then
          iGerarEstoqueCliente := 1
        else
        if ( (gSistema.Codigo = SISTEMA_GESTAO_OPME) and GetCfopRemessa(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger) ) then
          iGerarEstoqueCliente := 1
        else
          iGerarEstoqueCliente := 0;

        DtSrcTabela.DataSet.Edit;

        DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger                := STATUS_VND_FIN;
        DtSrcTabela.DataSet.FieldByName('DTVENDA').AsDateTime              := GetDateTimeDB;
        DtSrcTabela.DataSet.FieldByName('DTFINALIZACAO_VENDA').AsDateTime  := GetDateTimeDB;
        DtSrcTabela.DataSet.FieldByName('GERAR_ESTOQUE_CLIENTE').AsInteger := iGerarEstoqueCliente;

        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;

        if aGerarTitulos then
          GerarTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

        AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

        // Debitar Estoque Sat�lite do Cliente gerando uma Requisi��o Autom�tica para o cliente

        {$IFNDEF PDV}
        if ( (gSistema.Codigo = SISTEMA_GESTAO_OPME)
          and (DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger <> CONSUMIDOR_FINAL_CODIGO) // N�o pode ser CONSUMIDOR FINAL
          and GetCfopFaturarRemessa(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger)             // CFOP de fatura de remessas de produtos j� enviadas ao cliente
          and (not GetCfopMovimentaEstoque(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger))     // CFOP n�o alterar o estoque atual de produtos da empresa
          and (not GetCfopDevolucao(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger))            // CFOP n�o pode configurar uma Devolu��o
        ) then
          GerarRequisicaoCliente(Self,
              DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
            , DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger
            , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
            , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger
            , DtSrcTabela.DataSet.FieldByName('OBS').AsString);
        {$ENDIF}

        // Confirmar vencimentos de cada parcela

        if ( aGerarTitulos and (DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger = 1) ) then
          if ( TitulosConfirmados(Self, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, DtSrcTabela.DataSet.FieldByName('DTVENDA').AsDateTime, GetTotalValorFormaPagto_APrazo) ) then
            AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

        HabilitarDesabilitar_Btns;

        // Formas de Pagamento que nao seja a prazo

        if aGerarTitulos then
        begin
          cdsVendaFormaPagto.First;
          while not cdsVendaFormaPagto.Eof do
          begin
            if ( cdsVendaFormaPagtoVENDA_PRAZO.AsInteger = 0 ) then
              if ( qryTitulos.Locate('FORMA_PAGTO', cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger, []) ) then
                RegistrarPagamento(qryTitulosEMPRESA.AsString,
                  qryTitulosANOLANC.AsInteger, qryTitulosNUMLANC.AsInteger, GetDateDB, cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger,
                  cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency, toRecebimentoVenda, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger);

            cdsVendaFormaPagto.Next;
          end;
        end;

        // Registrar o N�mero do Caixa na Venda Finalizada

        RegistrarCaixaNaVenda(
            DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
          , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger
          , CxAno
          , CxNumero
          , (gSistema.Codigo = SISTEMA_PDV));

        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, GetDateDB);

        RdgStatusVenda.ItemIndex := 0;

        ShowInformation('Venda finalizada com sucesso !' + #13#13 + 'Ano/Controle: ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger));

        // Imprimir Cupom

        if (gSistema.Codigo <> SISTEMA_GESTAO_IND) then
        begin
          if GetEmitirCupom then
            if GetEmitirCupomAutomatico then
              if GetCupomNaoFiscalEmitir then
                DMNFe.ImprimirCupomNaoFiscal(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
                  , DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger
                  , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
                  , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger)
              else
                ; // Emitir Cupom Fiscal
        end;

      end;
    end;
  end;
end;

procedure TfrmGeVenda.btbtnGerarNFeClick(Sender: TObject);
var
  iNumeroTmp ,
  iNumero    ,
  iSerieNFe  ,
  iNumeroNFe : Integer;
  sFileNameXML  ,
  sChaveNFE     ,
  sProtocoloNFE ,
  sReciboNFE    ,
  sMensagem     : String;
  iNumeroLote   : Int64;
  {$IFNDEF PDV}
  TipoMovimento : TTipoMovimento;
  {$ENDIF}
  bRetornoErro  ,
  bNFeGerada    : Boolean;
  aDenegada : Boolean;
  aDenegadaMotivo : String;
begin
(*
  IMR - 23/04/2018 :
    Validar o Tipo de CFOP (Entrada ou Sa�da) antes da emiss�o da Nota Fiscal de
    Entrada.

  IMR - 02/08/2017 :
    Inser��o da fun��o "EmissaoNFE_Pendente()" para impedir que uma nota fiscal
    seja emitida se houver um outro pedido de emiss�o pendente.

  IMR - 08/12/2015 :
    Inser��o da valida��o do c�digo CFOP antes da gera��o da Nota Fiscal.

  IMR - 04/05/2015 :
    Inclus�o do bloco de c�digo para buscar o retorno NF-e quando esta j� fora
    solicitada, mas seu retorno ainda n�o fora processado pela aplica��o.

  IMR - 20/04/2015 :
    Inclus�o do bloco de c�digo para verificar se o CFOP da venda corresponde
    a uma opera��o de devolu��o. Caso esta situa��o seja confirmada, a NF-e de
    origem ser� solicitada.
*)
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  bNFeGerada   := (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency > 0) and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE);
  bRetornoErro := False;
  iSerieNFe    := 0;
  iNumeroNFe   := 0;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) then
  begin
    ShowWarning('Movimento de Venda j� com NF-e/NFC-e gerada!');
    Abort;
  end;

  if DMNFe.ConfigurarParamentoNFE(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString) then
  begin
    ShowInformation('A emiss�o da NF-e exige a configura��o dos par�metros da empresa.' + #13 + 'Favor entrar em contrato com suporte.');
    Exit;
  end;

  if not GetPermititEmissaoNFe( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString ) then
  begin
    ShowInformation('Empresa selecionada n�o habilitada para emiss�o de NF-e.' + #13 + 'Favor entrar em contato com suporte.');
    Exit;
  end;

  if (GetCfopTipo(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger) <> tcfopSaida) then
  begin
    ShowInformation('CFOP ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('CFOP').AsString) + ' n�o permitida para a Emiss�o de Notas Fiscais de Sa�da.' + #13 + 'Favor corrigir n�mero de CFOP.');
    Exit;
  end;

  if not DMNFe.ValidarCFOP(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger, 0, DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger) then
    Exit;

  if not DMNFe.ValidarEnderecoCliente(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger) then
    Exit;

  if ( not DelphiIsRunning ) then
    if not DMNFe.GetValidadeCertificado(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString) then
      Exit;

  {$IFNDEF PDV}
  if ( Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
    if GetCfopDevolucao( DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger ) then
      if not InformarDocumentoReferenciado(Self, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger) then
        Exit;

  if not ValidarGTIN then
    Exit;

  // Buscar retorno do envio pendente, caso ele tenha ocorrido
  if not bNFeGerada then
    if ( Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr ) then
    begin
      bNFeGerada := BuscarRetornoReciboNFe(Self
        , DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
        , Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString)
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

      if ( TipoMovimento <> tmNFeSaida ) then
      begin
        ShowWarning('Tipo do movimento do recibo incompat�vel!');
        Exit;
      end;

      sReciboNFE  := Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString);
      iNumeroLote := iNumeroNFe;

      if aDenegada then
        DMNFe.UpdateNFeDenegadaVenda(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
          , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
          , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger
          , aDenegadaMotivo);
    end;
  {$ENDIF}

  if not bNFeGerada then
  begin
    if DMNFe.EmissaoNFE_Pendente(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, True) then
      Abort;

    bNFeGerada := GerarNFe(Self
      , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
      , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger
      , iSerieNFe
      , iNumeroNFe
      , sFileNameXML
      , sChaveNFE
      , sProtocoloNFE
      , sReciboNFE
      , iNumeroLote
      , sMensagem
      , bRetornoErro);
  end;

  if bNFeGerada then
  begin
    with DtSrcTabela.DataSet do
    begin
      iNumero := DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger;

      // Analisar o nome do arquivo XML retornado
      if (Trim(sFileNameXML) = EmptyStr) or (not FileExists(sFileNameXML)) then
        sFileNameXML := DMNFe.GetDiretorioXmlNFe + sChaveNFE + '-nfe.xml';

      AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

      qryNFE.Append;

      qryNFEEMPRESA.Value     := DtSrcTabela.DataSet.FieldByName('CODEMP').AsString;
      qryNFEANOVENDA.Value    := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      qryNFENUMVENDA.Value    := DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger;
      qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
      qryNFENUMERO.Value      := iNumeroNFe;
      qryNFEMODELO.Value      := DMNFe.GetModeloDF;
      qryNFEVERSAO.Value      := DMNFe.GetVersaoDF;
      qryNFEDATAEMISSAO.Value := GetDateDB;
      qryNFEHORAEMISSAO.Value := GetTimeDB;
      qryNFECHAVE.Value       := sChaveNFE;
      qryNFEPROTOCOLO.Value   := sProtocoloNFE;
      qryNFERECIBO.Value      := sReciboNFE;
      qryNFELOTE_ANO.Value    := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      qryNFELOTE_NUM.Value    := iNumeroLote;

      if ( FileExists(sFileNameXML) ) then
      begin
        CorrigirXML_NFe(EmptyWideStr, sFileNameXML);

        qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
        qryNFEXML_FILE.LoadFromFile( sFileNameXML );
      end;

      qryNFEANOCOMPRA.Clear;
      qryNFENUMCOMPRA.Clear;

      try
        qryNFE.Post;
        qryNFE.ApplyUpdates;
        qryNFE.CommitUpdates;
        CommitTransaction;
      except
        On E : Exception do
          ShowError('N�mero da NF-e n�o recuperado.' + #13 + 'Execute novamente o procedimento.' + #13#13 + E.Message);
      end;

      RecarregarRegistro;

      if (DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency = 0) then
        ShowWarning('N�mero da NF-e n�o recuperado.' + #13 + 'Execute novamente o procedimento.')
      else
        ShowInformation('Nota Fiscal de Sa�da gerada com sucesso.' + #13#13 +
          'S�rie/N�mero: ' + DtSrcTabela.DataSet.FieldByName('SERIE').AsString + '/' + FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency) +
          IfThen(Trim(sMensagem) = EmptyStr, EmptyStr, #13#13 + 'Alerta:' + #13 + sMensagem));

      HabilitarDesabilitar_Btns;

      nmImprimirDANFE.Click;
    end;
  end
  else
    RecarregarRegistro;

  TbsInformeNFe.TabVisible := (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr);

//  ANALISAR MELHOR EM QUE SITUA��O APRESENTAR ESSA MENSAGEM
//  if bRetornoErro then
//    ShowWarning('WebService para emiss�o da NF-e n�o est� respondendo.' + #13 + 'Fa�a uma nova tentativa daqui a alguns minutos.');
end;

procedure TfrmGeVenda.GerarTitulos(const AnoVenda: Smallint;
  const ControleVenda: Integer);
begin
  try
    try

      UpdateSequence('GEN_CONTAREC_NUM_' + IntToStr(AnoVenda), 'TBCONTREC', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoVenda));

      with spSetGerarTitulos do
      begin
        ParamByName('anovenda').AsInteger := AnoVenda;
        ParamByName('numvenda').AsInteger := ControleVenda;

        ExecProc;

        CommitTransaction;
      end;

    except
      On E : Exception do
        ShowError('Erro ao tentar gerar t�tulos de recebimento.' + #13#13 + E.Message);
    end;
  finally
  end;
end;

procedure TfrmGeVenda.btnRegerarTituloClick(Sender: TObject);
var
  pPermitir : Boolean;
const
  UPDATE_VENDA = 'Update TBVENDAS v SET v.venda_prazo = 1 WHERE v.ano = %s AND v.codcontrol = %s';
begin
  pPermitir := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_FIN);
  if not pPermitir then
    pPermitir := ((DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE) and (qryTitulos.RecordCount = 0));

  if (not pPermitir) then
    ShowWarning('� permitida a gera��o de t�tulos apenas para vendas finalizadas')
  else
  if ( not qryTitulos.IsEmpty ) then
    ShowWarning('J� existe(m) t�tulo(s) gerado(s) para esta venda')
  else
  if (not GetCfopGerarTitulo(DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger)) then
    ShowWarning('A CFOP utilizada nesta venda n�o permite a gera��o de t�tulos')
  else
  if ( ShowConfirm('Confirma gera��o do(s) t�tulo(s) a receber da venda?') ) then
  begin
    GerarTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

    // A exist�ncia da parcela de n�mero 1 (um) � evid�ncia da venda � prazo.
    if  qryTitulos.Locate('PARCELA', 1, []) then
    begin
      ExecuteScriptSQL(Format(UPDATE_VENDA, [DtSrcTabela.DataSet.FieldByName('ANO').AsString, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString]));
      RecarregarRegistro;
    end;
  end;
end;

procedure TfrmGeVenda.btnTituloEditarClick(Sender: TObject);
begin
  if ( not (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]) ) then
    ShowWarning('� permitida a edi��o de t�tulos apenas para vendas finalizadas')
  else
  if ( qryTitulos.IsEmpty ) then
    ShowWarning('N�o existe(m) t�tulo(s) gerado(s) para esta venda')
  else
  if ( DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
  begin
    if ( TitulosConfirmados(Self, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, DtSrcTabela.DataSet.FieldByName('DTVENDA').AsDateTime, GetTotalValorFormaPagto_APrazo) ) then
      AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  end;
end;

procedure TfrmGeVenda.dbCFOPVendaButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, TTipoCFOP.tcfopSaida, iCodigo, sDescricao) ) then
      DtSrcTabela.DataSet.FieldByName('CFOP').AsInteger := iCodigo;
end;

procedure TfrmGeVenda.btbtnCancelarVNDClick(Sender: TObject);
begin
{*
  IMR - 22/04/2016 :
    Ativa��o do bot�o "Cancelar Vendas" para o m�dulo PDV para que estes possa
    cancelar suas pr�prias vendas finalizadas.
*}
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_CAN) then
  begin
    ShowWarning('Movimento de Venda j� cancelada!');
    Abort;
  end;

  if (gSistema.Codigo = SISTEMA_PDV)  then
    if (DtSrcTabela.DataSet.FieldByName('CAIXA_PDV').AsInteger = 0) then
    begin
      ShowWarning('Apenas registros de vendas finalizadas pelo PDV podem ser canceladas!');
      Exit;
    end;

  if ( (Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) <> EmptyStr) and (DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt = 0) ) then
  begin
    ShowWarning('O processo de gera��o de NF-e para esta venda j� foi solicitado, mas n�o fora conclu�do.' + #13 +
      'Desta forma n�o ser� perdida o cancelamento da venda.' + #13#13 + 'Favor consultar junto a SEFA e processar o Recibo de n�mero ' +
        DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString + ' e comunicar ao suporte.');
    Exit;
  end;

  if ( PossuiTitulosPagos(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger) ) then
  begin
    ShowWarning('A venda possui t�tulo(s) j� baixado(s).' + #13 + 'Favor providenciar a exclus�o da(s) baixa(s) para que a venda possa ser cancelada!');
    Exit;
  end;

  if ( CancelarVND(Self, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger) ) then
    with DtSrcTabela.DataSet do
    begin
      RecarregarRegistro;
      {$IFNDEF PDV}
      // Cancelar Requisi��o Autom�tica gerada para o cliente
      if ( (gSistema.Codigo = SISTEMA_GESTAO_OPME)
        and (FieldByName('CODCLIENTE').AsInteger <> CONSUMIDOR_FINAL_CODIGO) // N�o pode ser CONSUMIDOR FINAL
        and GetCfopFaturarRemessa(FieldByName('CFOP').AsInteger)             // CFOP de fatura de remessas de produtos j� enviadas ao cliente
        and (not GetCfopMovimentaEstoque(FieldByName('CFOP').AsInteger))     // CFOP n�o alterar o estoque atual de produtos da empresa
      ) then
        CancelarRequisicaoCliente(Self,
            FieldByName('CODEMP').AsString
          , FieldByName('CODCLIENTE').AsInteger
          , FieldByName('ANO').AsInteger
          , FieldByName('CODCONTROL').AsInteger
          , FieldByName('CANCEL_MOTIVO').AsString);
      {$ENDIF}

      ShowInformation('Venda cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeVenda.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;

  dbgDados.Columns[COLUMN_LUCRO].Visible := ( gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA..FUNCTION_USER_ID_GERENTE_FIN,
    FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SUPORTE_TI, FUNCTION_USER_ID_SYSTEM_ADM] );
end;

procedure TfrmGeVenda.nmImprimirDANFEClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  isPDF := (Sender = nmGerarDANFEXML); // Pare gerar PDF e XML de envio ao cliente

  DMNFe.ImprimirDANFEACBr( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, isPDF);
end;

procedure TfrmGeVenda.btnConsultarProdutoClick(Sender: TObject);
begin
  MostrarTabelaProdutos(Self, taICMS);
end;

procedure TfrmGeVenda.dbTotalDescontoButtonClick(Sender: TObject);
var
  sValor : String;
  cValor : Currency;
begin
  if ( dbTotalDesconto.ReadOnly ) then
    Exit;

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    sValor := InputBox('TOTAL DESCONTO (R$)', 'Favor informar o Valor Total de Desconto:', FormatFloat(',0.00', dbTotalDesconto.Field.AsCurrency));
    sValor := Trim(StringReplace(sValor, '.', '', [rfReplaceAll]));
    cValor := StrToCurrDef(sValor, 0);
    if ( cValor > 0 ) then
    begin
      cdsTabelaItensDESCONTO_VALOR.AsCurrency := cValor / cdsTabelaItensQTDE.AsCurrency;
      cdsTabelaItensDESCONTO.AsCurrency  := cdsTabelaItensDESCONTO_VALOR.Value / cdsTabelaItensPUNIT.AsCurrency * 100;
      cdsTabelaItensPFINAL.Value         := cdsTabelaItensPUNIT.AsCurrency - cdsTabelaItensDESCONTO_VALOR.Value;
      cdsTabelaItensTOTAL_BRUTO.Value    := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensPUNIT.AsCurrency;
      cdsTabelaItensTOTAL_DESCONTO.Value := cValor; // cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensDESCONTO_VALOR.AsCurrency;
      cdsTabelaItensTOTAL_LIQUIDO.Value  := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
      //cdsTabelaItensTOTAL_LIQUIDO.Value  := cdsTabelaItensQTDE.AsCurrency * StrToCurr( FormatFloat('##########0.00', cdsTabelaItensPFINAL.AsCurrency) );
    end;
  end;
end;

procedure TfrmGeVenda.btnGerarBoletoClick(Sender: TObject);
begin
  if ( not FormaPagtoEmitiBoleto(0) ) then
  begin
    ShowWarning('Forma(s) de Pagamento(s) n�o permite a emiss�o de boletos!');
    Exit;
  end;

  if ( not qryTitulos.IsEmpty ) then
  begin
    GerarBoleto(Self, dbCliente.Text, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger,
      DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, toBoletoVenda);
    AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  end;
end;

procedure TfrmGeVenda.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
    begin
      // Destacar produtos em Promocao
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_AND ) then
        dbgDados.Canvas.Font.Color := lblVendaAberta.Font.Color
      else
      // Destacar produtos em Promocao
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_CAN ) then
        dbgDados.Canvas.Font.Color := lblVendaCancelada.Font.Color;

      // Destacar alerta de lucros
      if ((not DtSrcTabela.DataSet.FieldByName('LUCRO_CALCULADO').IsNull) and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger <> STATUS_VND_CAN)) then
      begin
        if ( DtSrcTabela.DataSet.FieldByName('LUCRO_CALCULADO').AsCurrency = 0 ) then
          dbgDados.Canvas.Brush.Color := ShpLucroZerado.Brush.Color
        else
        if ( DtSrcTabela.DataSet.FieldByName('LUCRO_CALCULADO').AsCurrency < 0 ) then
          dbgDados.Canvas.Brush.Color := ShpLucroNegativo.Brush.Color;
      end;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos em Promocao
  if ( Sender = dbgProdutos ) then
  begin
    if ( cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0 ) then
      dbgProdutos.Canvas.Font.Color := lblProdutoPromocao.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeVenda.GetComprasAbertas(iCodigoCliente : Integer);
begin
  with qryTotalComprasAbertas do
  begin
    Close;
    ParamByName('codigo').AsInteger := iCodigoCliente;
    Open;
  end;
end;

function TfrmGeVenda.PossuiTitulosPagos(AnoVenda: Smallint; NumVenda: Integer): Boolean;
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
        SQL.Add('where r.Anovenda = ' + IntToStr(AnoVenda));
        SQL.Add('  and r.Numvenda = ' + IntToStr(NumVenda));
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

procedure TfrmGeVenda.qryTitulosCalcFields(DataSet: TDataSet);
begin
  qryTitulosLancamento.AsString := FormatFloat('0000', qryTitulosANOLANC.AsInteger) + FormatFloat('000000', qryTitulosNUMLANC.AsInteger);
end;

procedure TfrmGeVenda.dbgTitulosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente,
  MovAno    ,
  MovNumero : Integer;
  DataPagto : TDateTime;
begin
(*
  IMR - 04/05/2018
    Implementa��o bloco que c�digo (2179..2599 - Registrar Estorno) com o objetivo
    de gravar um registro de estorno do caixa dos valores j� baixados.
*)
  if (Shift = [ssCtrl]) and (Key = 46) Then
  begin
    if not LiberarUso then
      Exit;

    if ( UpperCase(Trim(qryTitulosBAIXADO_.AsString)) <> 'X' ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    if ( not qryTitulos.IsEmpty ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if ( dtsFormaPagto.DataSet.Locate('cod', qryTitulosFORMA_PAGTO.AsInteger, []) ) then
        if ( dtsFormaPagto.DataSet.FieldByName('Conta_corrente').AsInteger > 0 ) then
          if ( not CaixaAberto(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, gUsuarioLogado.Login, GetDateDB, qryTitulosFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
          begin
            ShowWarning('N�o existe caixa aberto para o usu�rio na forma de pagamento deste movimento.');
            Exit;
          end;

      MovAno    := qryTitulosANOLANC.AsInteger;
      MovNumero := qryTitulosNUMLANC.AsInteger;
      DataPagto := qryTitulosDTREC.AsDateTime;

      if ShowConfirm('Confirma a remo��o do(s) registro(s) de baixa(s) do t�tulo selecionado?') then
      begin

        // Registrar Estorno

        if (CxContaCorrente = 0) and (not qryTitulosPGTO_DATA.IsNull) then
        begin
          DataPagto := qryTitulosDTREC.AsDateTime;
          CaixaAberto(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
            , qryTitulosPGTO_USUARIO.AsString
            , qryTitulosPGTO_DATA.AsDateTime
            , qryTitulosPGTO_FORMA.AsInteger
            , CxAno, CxNumero, CxContaCorrente);
        end;

        if ( CxContaCorrente > 0 ) then
        begin
          SetMovimentoCaixaEstorno(
            GetUserApp,
            qryTitulosPGTO_DATA.AsDateTime + Time,
            qryTitulosPGTO_FORMA.AsInteger,
            qryTitulosANOLANC.AsInteger,
            qryTitulosNUMLANC.AsInteger,
            qryTitulosPGTO_SEQ.AsInteger,
            qryTitulosVALORRECTOT.AsCurrency,
            tmcxCredito);
        end;

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

        AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

        ShowInformation('Registro(s) de baixa(s) de t�tulo removido(s) com sucesso.');
      end;
    end;
  end;
end;

function TfrmGeVenda.GetTotalValorFormaPagto: Currency;
var
  cReturn : Currency;
begin
  cReturn := 0;

  with cdsVendaFormaPagto do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;


    First;
    while not Eof do
    begin
      cReturn := cReturn + cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency;
      Next;
    end;
    First;

    EnableControls;
  end;
  Result := cReturn;
end;

procedure TfrmGeVenda.dbgFormaPagtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cAPagar : Currency;
  iFormPG : Integer;
begin
  // Inserir

  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
  begin
    if not LiberarUso then
      Exit;

    if not dtsVendaFormaPagto.AutoEdit then
      Exit;

    dtsFormaPagto.DataSet.Filter   := '(ativa = 1)';
    dtsFormaPagto.DataSet.Filtered := True;

    dtsCondicaoPagto.DataSet.Filter   := '(ativa = 1)';
    dtsCondicaoPagto.DataSet.Filtered := True;

    cAPagar := dbValorTotal.Field.AsCurrency - GetTotalValorFormaPagto;

    cdsVendaFormaPagto.Append;
    cdsVendaFormaPagtoFORMAPAGTO_COD.Clear;
    cdsVendaFormaPagtoCONDICAOPAGTO_COD.Clear;
    cdsVendaFormaPagtoVALOR_FPAGTO.Value := cAPagar;
    cdsVendaFormaPagtoVENDA_PRAZO.Value  := 0;

    if InserirFormaPagto(Self, cAPagar) then
      cdsVendaFormaPagto.Post
    else
      cdsVendaFormaPagto.Cancel;

    dtsFormaPagto.DataSet.Filter   := EmptyStr;
    dtsFormaPagto.DataSet.Filtered := False;

    dtsCondicaoPagto.DataSet.Filter   := EmptyStr;
    dtsCondicaoPagto.DataSet.Filtered := False;
  end
  else

  // Editar

  if (Shift = [ssCtrl]) and (Key = VK_RETURN) Then
  begin
    if not LiberarUso then
      Exit;

    if not dtsVendaFormaPagto.AutoEdit then
      Exit;

    iFormPG := cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger;

    dtsFormaPagto.DataSet.Filter   := '(ativa = 1)';
    dtsFormaPagto.DataSet.Filtered := True;

    dtsCondicaoPagto.DataSet.Filter   := '(ativa = 1)';
    dtsCondicaoPagto.DataSet.Filtered := True;

    cAPagar := dbValorTotal.Field.AsCurrency + cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency;
    cAPagar := cAPagar - GetTotalValorFormaPagto;

    cdsVendaFormaPagto.Locate('FORMAPAGTO_COD', iFormPG, []);
    cdsVendaFormaPagto.Edit;

    if InserirFormaPagto(Self, cAPagar) then
      cdsVendaFormaPagto.Post
    else
      cdsVendaFormaPagto.Cancel;

    dtsFormaPagto.DataSet.Filter   := EmptyStr;
    dtsFormaPagto.DataSet.Filtered := False;

    dtsCondicaoPagto.DataSet.Filter   := EmptyStr;
    dtsCondicaoPagto.DataSet.Filtered := False;
  end
  else

  // Excluir Tudo e reiniciar forma de pagamento

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
  begin
    if not LiberarUso then
      Exit;

    if not dtsVendaFormaPagto.AutoEdit then
      Exit;
      
    if ShowConfirm('Deseja zerar as formas/condi��es de pagamento e colocar a forma/condi��o de pagamento padr�o?') then
      ZerarFormaPagto;
  end;
end;

procedure TfrmGeVenda.ZerarFormaPagto;
begin
  if not dtsVendaFormaPagto.AutoEdit then
    Exit;

  cdsVendaFormaPagto.First;

  while not cdsVendaFormaPagto.Eof do
    cdsVendaFormaPagto.Delete;

  // Adicionar forma de pagamento inicial
  
  cdsVendaFormaPagto.Append;
  cdsVendaFormaPagtoFORMAPAGTO_COD.Value    := GetFormaPagtoIDDefault;
  cdsVendaFormaPagtoCONDICAOPAGTO_COD.Value := GetCondicaoPagtoIDDefault;
  cdsVendaFormaPagtoVALOR_FPAGTO.Value      := dbValorTotal.Field.AsCurrency;
  cdsVendaFormaPagtoVENDA_PRAZO.Value       := 0;

  if not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    DtSrcTabela.DataSet.Edit;

  if GetCondicaoPagtoAPrazo(GetCondicaoPagtoIDDefault) then
    DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger := 1;
end;

procedure TfrmGeVenda.cdsVendaFormaPagtoBeforePost(DataSet: TDataSet);
begin
  if ( cdsVendaFormaPagtoVENDA_PRAZO.AsInteger = 1 ) then
  begin
    if not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
      DtSrcTabela.DataSet.Edit;
    DtSrcTabela.DataSet.FieldByName('VENDA_PRAZO').AsInteger := 1;
  end;
end;

procedure TfrmGeVenda.cdsVendaFormaPagtoNewRecord(DataSet: TDataSet);
begin
  cdsVendaFormaPagtoANO_VENDA.Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
  cdsVendaFormaPagtoCONTROLE_VENDA.Assign( DtSrcTabela.DataSet.FieldByName('CODCONTROL') );
end;

function TfrmGeVenda.GetTotalValorFormaPagto_APrazo: Currency;
var
  cReturn : Currency;
begin
  cReturn := 0;

  with cdsVendaFormaPagto do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;

    First;
    while not Eof do
    begin
      if ( cdsVendaFormaPagtoVENDA_PRAZO.AsInteger = 1 ) then
        cReturn := cReturn + cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency;
      Next;
    end;
    First;

    EnableControls;
  end;
  Result := cReturn;
end;

procedure TfrmGeVenda.dbgFormaPagtoEnter(Sender: TObject);
begin
  if ( cdsVendaFormaPagto.State in [dsEdit, dsInsert] ) then
    cdsVendaFormaPagto.Post;
end;

procedure TfrmGeVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Inserir

  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    Case pgcMaisDados.ActivePageIndex of
      0 : dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1 : dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else

  // Editar

  if (Shift = [ssCtrl]) and (Key = VK_RETURN) Then
    Case pgcMaisDados.ActivePageIndex of
      0 : dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1 : dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else

  // Excluir Tudo e reiniciar forma de pagamento

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
    Case pgcMaisDados.ActivePageIndex of
      0 : dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1 : dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else
  if ( Key = VK_F6 ) then
    btnConsultarProduto.Click
  else
  // Desistir na inser��o de um novo produto/servi�o
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
    cdsTabelaItens.Cancel
  else
    inherited;
(*
  if Key = VK_F10 then
    if pgcGuias.ActivePage = tbsCadastro then
    begin
      pgcMaisDados.ActivePage := tbsRecebimento;
      dbgFormaPagto.SetFocus;
    end;
*)
end;

procedure TfrmGeVenda.BtnTransporteInformeClick(Sender: TObject);
begin
  RecarregarRegistro;

  if EditarDadosTransportadora(Self) then
  begin
    if ( DtSrcTabela.DataSet.State = dsEdit ) then
    begin
      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;
    end;

    cdsVendaVolume.ApplyUpdates;
    cdsVendaVolume.CommitUpdates;

    CommitTransaction;
    RecarregarRegistro;
  end
  else
  if ( DtSrcTabela.DataSet.State = dsEdit ) then
    DtSrcTabela.DataSet.Cancel;

  pgcMaisDados.ActivePage := tbsTransporte;
end;

procedure TfrmGeVenda.cdsVendaVolumeNewRecord(DataSet: TDataSet);
begin
  cdsVendaVolumeANO_VENDA.Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
  cdsVendaVolumeCONTROLE_VENDA.Assign( DtSrcTabela.DataSet.FieldByName('CODCONTROL') );
end;

procedure TfrmGeVenda.RdgStatusVendaClick(Sender: TObject);
begin
  if RdgStatusVenda.ItemIndex = 2 then
    RdgStatusVenda.ItemIndex := RdgStatusVenda.ItemIndex - 1;
end;

procedure TfrmGeVenda.RecarregarRegistro;
begin
  if not ((DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) or (DtSrcTabela.DataSet.IsEmpty)) then
    fdQryTabela.RefreshRecord;
end;

procedure TfrmGeVenda.nmGerarImprimirBoletosClick(Sender: TObject);
(*
  function BoletosGerados : Boolean;
  begin
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select b.nossonumero from TBCONTREC b');
      SQL.Add('where b.cliente  = ' + DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsString);
      SQL.Add('  and b.anovenda = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
      SQL.Add('  and b.numvenda = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
      SQL.Add('  and b.codbanco > 0');
      Open;

      Result := (Trim(FieldByName('nossonumero').AsString) <> EmptyStr);

      Close;
    end;
  end;
*)
var
  bExisteTitulo,
  bProsseguir  : Boolean;
  sDestinatario,
  sMensagem    ,
  sDocumento   ,
  sFileNamePDF : String;
const
  MSG_REF_NFE = 'Referente a NF-e %s';
  MSG_REF_DOC = 'Referente a venda No. %s';
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  // Montar identifica��o do documento para t�tulo de e-mail

  if ( DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt > 0 ) then
  begin
    sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt)]);
    sDocumento := 'NFe ' + FormatFloat('###0000000', DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt) + '-' + DtSrcTabela.DataSet.FieldByName('SERIE').AsString;
  end
  else
  begin
    sMensagem  := Format(MSG_REF_DOC, [DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##00000', DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger)]);
    sDocumento := 'Venda ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##00000', DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger);
  end;

  sDestinatario := GetClienteEmail(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger);

  DMNFe.ConfigurarEmail(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, sDestinatario, 'Boleta Banc�ria - ' + sDocumento, sMensagem);

  AbrirTabelaTitulos( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
  bExisteTitulo := not qryTitulos.IsEmpty;

  if BoletosGerados then
  begin
    ReImprimirBoleto(Self, dbCliente.Text, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger,
      DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, qryTitulosCODBANCO.AsInteger, toBoletoVenda, sFileNamePDF);
    Exit;
  end;

  try
    if (not BoletosGerados) and bExisteTitulo then
    begin
      bProsseguir := FormaPagtoEmitiBoleto(0);
      if not bProsseguir then
        ShowWarning('Forma(s) de Pagamento(s) n�o permite a emiss�o de boletos!');

      if bProsseguir then
        bProsseguir := cdsVendaFormaPagto.Locate('VENDA_PRAZO', 1, []);

      if bProsseguir then
        bProsseguir := ShowConfirm('Deseja gerar boletos para os t�tulos da venda.');

      if bProsseguir then
      begin
        btnGerarBoleto.Click;
        Exit;
      end
      else
        Exit;
    end;

    if (not BoletosGerados) then
      ShowWarning('N�o existem t�tulos com boletos gerados para o movimento de venda.')
    else
      ReImprimirBoleto(Self, dbCliente.Text, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger,
        DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, qryTitulosCODBANCO.AsInteger, toBoletoVenda, sFileNamePDF);
  finally
    qryTitulos.Filter   := EmptyStr;
    qryTitulos.Filtered := False;
  end;
end;

procedure TfrmGeVenda.nmGerarReciboAvulsoClick(Sender: TObject);
var
  aComValor  : Boolean;
  aHistorico : String;
const
  MSG_REF_NFE = 'quita��o da Nota Fiscal No. %s';
  MSG_REF_DOC = 'quita��o da Venda No. %s';
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not CdsRecibo.Active then
    CdsRecibo.CreateDataSet;

  aComValor := ShowConfirmation('Recibo', 'Deseja emitir o recibo com o Valor Total da venda?');

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('NFE').AsLargeInt > 0 ) then
      aHistorico := Format(MSG_REF_NFE, [FormatFloat('###0000000', FieldByName('NFE').AsLargeInt)])
    else
      aHistorico := Format(MSG_REF_DOC, [FieldByName('ANO').AsString + '/' + FormatFloat('##00000', FieldByName('CODCONTROL').AsInteger)]);

    CdsRecibo.Edit;

    CdsReciboANOLANC.Value := fdQryTabelaANO.AsInteger;
    CdsReciboNUMLANC.Value := fdQryTabelaCODCONTROL.AsInteger;
    CdsReciboPARCELA.Value := 1;
    CdsReciboSEQ.Value     := 1;
    CdsReciboCLIENTE.AsInteger       := FieldByName('CODCLIENTE').AsInteger;
    CdsReciboRZSOC.AsString          := dbEmpresa.Text;
    CdsReciboEMPRESA_CNPJ.AsString   := FieldByName('CODEMP').AsString;
    CdsReciboNOME.AsString           := FieldByName('NOME').AsString;
    CdsReciboPESSOA_FISICA.AsInteger := FieldByName('PESSOA_FISICA').AsInteger;
    CdsReciboCNPJ.AsString           := FieldByName('CODCLI').AsString;
    CdsReciboDTEMISS.AsDateTime      := FieldByName('DTVENDA').AsDateTime;
    CdsReciboFORMA_PAGTO_DESC.AsString := FieldByName('OBS').AsString;
    CdsReciboHISTORICO.AsString        := aHistorico;

    if aComValor then
    begin
      CdsReciboVALOR_BAIXA.AsCurrency       := FieldByName('TOTALVENDA').AsCurrency;
      CdsReciboVALOR_BAIXA_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsReciboVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
    end
    else
    begin
      CdsReciboVALOR_BAIXA.AsCurrency       := 0;
      CdsReciboVALOR_BAIXA_EXTENSO.AsString := EmptyStr;
    end;
  end;

  CdsRecibo.Post;

  frReport := FrReciboA4;
  SetVariablesDefault(frReport);

  frReport.PrepareReport;
  frReport.ShowReport;
end;

function TfrmGeVenda.GetGerarEstoqueCliente(const aCliente : Integer; const Alertar : Boolean = TRUE) : Boolean;
var
  iReturn : Boolean;
begin
  iReturn := False;
  try
    if GetEstoqueSateliteEmpresa(gUsuarioLogado.Empresa) then
    begin
      // Formar UPDATE apenas no SGO
      if (gSistema.Codigo = SISTEMA_GESTAO_OPME) and (aCliente <> CONSUMIDOR_FINAL_CODIGO) then
      begin
        with DMBusiness, fdQryBusca do
        begin
          SQL.Clear;
          SQL.Add('Update TBCLIENTE c Set');
          SQL.Add('    c.entrega_fracionada_venda = 1');
          SQL.Add('where (c.Codigo = ' + IntToStr(aCliente) + ')');
          ExecSQL;

          CommitTransaction;
        end;
      end;

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('  coalesce(entrega_fracionada_venda, 0) as gerar_estoque');
        SQL.Add('from TBCLIENTE');
        SQL.Add('where Codigo = ' + IntToStr(aCliente));
        Open;

        iReturn := (FieldByName('gerar_estoque').AsInteger = 1);

        if iReturn and Alertar then
          if not ShowConfirm('Cliente trabalha com recebimento fracionado de produtos comprados nesta empresa.' + #13#13 +
            'Deseja gerar um estoque sat�lite para o cliente para entregas fracionadas a partir de requisi��es e gera��o de Cartas de Cr�ditos?', 'Estoque Cliente') then
            iReturn := False;

        Close;
      end;
    end;
  finally
    Result := iReturn;
  end;
end;

procedure TfrmGeVenda.ImprimirOpcoesClick(Sender: TObject);
begin
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeVenda.ImprimirOrcamentoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_CAN ) then
    begin
      ShowWarning('Venda cancelada n�o pode ser impressa!');
      Exit;
    end;

    CarregarDadosEmpresa(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, 'Or�amento / Venda');
    AbrirEmitente( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString );
    AbrirDestinatario( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger );
    AbrirVenda( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

//    if GetEmitirCupom and (gSistema.Codigo = SISTEMA_PDV) then
    if GetEmitirCupom then
      if ( ShowConfirm('Deseja imprimir em formato CUPOM?', 'Impress�o', MB_DEFBUTTON1) ) then
      begin
        if DMNFe.IsEstacaoEmiteNFCe and ((DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency > 0) and (DtSrcTabela.DataSet.FieldByName('MODELO_NF').AsInteger = 1)) then // Modelo 1 (NFC-e [65])
        begin
          if DMNFe.TipoEmissaoCupomTexto(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString) then
            DMNFe.ImprimirCupomNaoFiscal(
                DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
              , DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger
              , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
              , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
              , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger)
          else
            DMNFe.ImprimirDANFE_ESCPOSACBr(
                DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
              , DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger
              , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
              , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger);
        end
        else
        if GetCupomNaoFiscalEmitir and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]) then
          ImprimirCupomNaoFiscal(
              DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
            , DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
            , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger)
        else
        if ( GetModeloEmissaoCupom = MODELO_CUPOM_ORCAMENTO ) then
        begin
          ImprimirCupomOrcamento(
              DtSrcTabela.DataSet.FieldByName('CODEMP').AsString
            , DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger
            , FormatDateTime('dd/mm/yy hh:mm', GetDateTimeDB)
            , DtSrcTabela.DataSet.FieldByName('ANO').AsInteger
            , DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger)
        end
        else
        if ( GetModeloEmissaoCupom = MODELO_CUPOM_POOLER ) then
        begin
          FrECFPooler.PrepareReport;
          FrECFPooler.Print;
        end;

        Exit;
      end;

    frrVenda.ShowReport;

  end;
end;

procedure TfrmGeVenda.FormShow(Sender: TObject);
begin
  inherited;
  if ( gUsuarioLogado.Funcao = FUNCTION_USER_ID_SYSTEM_ADM ) then
    dbgDados.PopupMenu := popupAuditoria
  else
    dbgDados.PopupMenu := nil;

  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeVenda.FrReciboA4GetValue(const VarName: string; var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'R E C I B O';

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - vers�o ' + ver.FileVersion;

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := 1; //IfThen(FImprimirCabecalho, 1, 0);
end;

procedure TfrmGeVenda.nmPpReciboNFeClick(Sender: TObject);
begin
  if not DtSrcTabela.DataSet.IsEmpty then
  begin
    if ( Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString);
    ShowInformation('Dados NF-e', 'N�mero de Recibo de Envio da NF-e:' + #13 + Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString));
  end;
end;

procedure TfrmGeVenda.nmPpCarregarArquivoNFeClick(Sender: TObject);
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
  cValorNF   : Currency;
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_VND_NFE ) then
    ShowWarning('Venda j� possui NF-e/NFC-e.')
  else
  if opdNotas.Execute then
  begin
    DMNFe.CarregarArquivoNFe(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, opdNotas.FileName
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
      , cValorNF
    );

    if bNotaValida then
      if ( tTipoNota <> tnfSaida ) then
        ShowWarning('NF-e selecionada n�o � uma nota de sa�da.')
      else
      if ( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString <> sEmitente ) then
        ShowWarning('NF-e selecionada n�o pertence ao emitente ' + GetEmpresaNome(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString) + '.')
      else
      if ( DtSrcTabela.DataSet.FieldByName('CODCLI').AsString <> sDestinatario ) then
        ShowWarning('NF-e selecionada n�o pertence ao cliente ' + GetClienteNome(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger) + '.')
      else
      if ( DtSrcTabela.DataSet.FieldByName('TOTALVENDA').AsCurrency <> cValorNF ) then
        ShowWarning('NF-e com Valor Total da Nota Fiscal diferente ao registrado na venda.')
      else
      if ShowConfirm('Confirma a importa��o do XML da NF-e para o registro de venda selecionado?') then
      begin
        with qryNFE do
        begin
          AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

          Append;

          qryNFEEMPRESA.Value     := DtSrcTabela.DataSet.FieldByName('CODEMP').AsString;
          qryNFEANOVENDA.Value    := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
          qryNFENUMVENDA.Value    := DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger;
          qryNFESERIE.Value       := sSerieNFe;
          qryNFENUMERO.Value      := iNumeroNFe;
          qryNFEMODELO.Value      := iModeloNFe;
          qryNFEVERSAO.Value      := iVersaoNFe;
          qryNFEDATAEMISSAO.Value := StrToDate(FormatDateTime('dd/mm/yyyy', dDataHoraEmissao));
          qryNFEHORAEMISSAO.Value := StrToTime(FormatDateTime('hh:mm:ss',   dDataHoraEmissao));
          qryNFECHAVE.Value       := sChave;
          qryNFEPROTOCOLO.Value   := sProtocolo;
          qryNFERECIBO.Value      := sRecibo;
          qryNFELOTE_ANO.Value    := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
          qryNFELOTE_NUM.Value    := iNumeroNFe;

          if ( FileExists(opdNotas.FileName) ) then
          begin
            CorrigirXML_NFe(EmptyWideStr, opdNotas.FileName);

            qryNFEXML_FILENAME.Value := sNomeArquivoXML;
            qryNFEXML_FILE.LoadFromFile( opdNotas.FileName );
          end;

          qryNFEANOCOMPRA.Clear;
          qryNFENUMCOMPRA.Clear;

          Post;
          ApplyUpdates;
          CommitUpdates;

          CommitTransaction;
        end;

        RecarregarRegistro;
        HabilitarDesabilitar_Btns;

        ShowInformation('Arquivo XML de NF-e importando com sucesso.');
      end;
  end;
end;

procedure TfrmGeVenda.nmPpChaveNFeClick(Sender: TObject);
begin
  if not DtSrcTabela.DataSet.IsEmpty then
  begin
    if ( Trim(DtSrcTabela.DataSet.FieldByName('VERIFICADOR_NFE').AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(DtSrcTabela.DataSet.FieldByName('VERIFICADOR_NFE').AsString);
    ShowInformation('Dados NF-e', 'Chave da NF-e:' + #13 + Trim(DtSrcTabela.DataSet.FieldByName('VERIFICADOR_NFE').AsString));
  end;
end;

procedure TfrmGeVenda.nmPpArquivoNFeClick(Sender: TObject);
begin
  if not DtSrcTabela.DataSet.IsEmpty then
  begin
    if ( Trim(DtSrcTabela.DataSet.FieldByName('XML_NFE_FILENAME').AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(DtSrcTabela.DataSet.FieldByName('XML_NFE_FILENAME').AsString);
    ShowInformation('Dados NF-e', 'Nome do Arquivo XML NF-e:' + #13 + Trim(DtSrcTabela.DataSet.FieldByName('XML_NFE_FILENAME').AsString));
  end;
end;

procedure TfrmGeVenda.nmEnviarEmailClienteClick(Sender: TObject);
var
  bExisteTitulo,
  bProsseguir  : Boolean;
  sDestinatario,
  sMensagem    ,
  sDocumento   ,
  sFileNamePDF : String;
const
  MSG_REF_NFE = 'Referente a NF-e %s';
  MSG_REF_DOC = 'Referente a venda No. %s';
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  // Montar identifica��o do documento para t�tulo de e-mail

  if ( DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt > 0 ) then
  begin
    sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt)]);
    sDocumento := 'NFe ' + FormatFloat('###0000000', DtSrcTabela.DataSet.FieldByName('NFE').AsLargeInt) + '-' + DtSrcTabela.DataSet.FieldByName('SERIE').AsString;
  end
  else
  begin
    sMensagem  := Format(MSG_REF_DOC, [DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##00000', DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger)]);
    sDocumento := 'Venda ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##00000', DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger);
  end;

  sDestinatario := GetClienteEmail(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger);

  if not TServiceInputQuery.InputQuery(Self, 'E-mail do Cliente:', 'Favor informar/confirmar e-mail do cliente para onde os arquivos (Boleto(s) e NF-e) ser�o enviados:', sDestinatario) then
    Exit
  else
    GravarEmailCliente( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger, sDestinatario );

  DMNFe.ConfigurarEmail(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, sDestinatario, 'Boleta Banc�ria - ' + sDocumento, sMensagem);

  try
    WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Enviando e-mail...');

    // 1. Gerar PDF dos Boletos existentes da venda

    if BoletosGerados then
      ReImprimirBoleto(Self, dbCliente.Text, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger,
        DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, qryTitulosCODBANCO.AsInteger, toBoletoVenda, sFileNamePDF, True);


    // 2. Gerar XML/PDF da NF-e e enviar por e-mail

    if DMNFe.EnviarEmailDANFEACBr( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger, True, sFileNamePDF) then
      ShowInformation('Envio', 'Arquivos referentes a NF-e da venda enviados com sucesso.')
    else
      ShowWarning('Envio', 'N�o foi poss�vel enviar o e-mail.' + #13 + 'Verifique se a conta de e-mail foi informada corretamente.');
  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGeVenda.GravarEmailCliente(iCliente: Integer;
  sEmail: String);
begin
  sEmail := AnsiLowerCase( Trim(sEmail) );

  if (iCliente = 0) or (sEmail = EmptyStr) then
    Exit;

  if GetEmailValido(sEmail, False) then
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update TBCLIENTE Set email = ' + QuotedStr(sEmail));
      SQL.Add('where codigo = ' + IntToStr(iCliente));
      ExecSQL;

      CommitTransaction;
    end;
end;

function TfrmGeVenda.FormaPagtoEmitiBoleto(const aFormaPagto : Integer) : Boolean;
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
    SQL.Add('where r.cliente  = ' + DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsString);
    SQL.Add('  and r.anovenda = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
    SQL.Add('  and r.numvenda = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);

    if (aFormaPagto > 0) then
      SQL.Add('  and r.forma_pagto = ' + IntToStr(aFormaPagto));

    Open;

    Result := (FieldByName('forma_pagto').AsInteger > 0);

    Close;
  end;
end;

function TfrmGeVenda.BoletosGerados: Boolean;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select b.nossonumero from TBCONTREC b');
    SQL.Add('where b.cliente  = ' + DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsString);
    SQL.Add('  and b.anovenda = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
    SQL.Add('  and b.numvenda = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
    SQL.Add('  and b.codbanco > 0');
    Open;

    Result := (Trim(FieldByName('nossonumero').AsString) <> EmptyStr);

    Close;
  end;
end;

procedure TfrmGeVenda.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnFinalizar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btbtnFinalizar.Caption, RotinaID);

    if btbtnGerarNFe.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarNFeID, btbtnGerarNFe.Caption, RotinaID);

    if btbtnCancelarVND.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarVendaID, btbtnCancelarVND.Caption, RotinaID);

    if nmGerarImprimirBoletos.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarBoletoID, nmGerarImprimirBoletos.Caption, RotinaID);

    if nmEnviarEmailCliente.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEnviarEmailID, nmEnviarEmailCliente.Caption, RotinaID);

    if dbgTitulos.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarPagtosID, 'Cancelar Pagamentos', RotinaID);
  end;
end;

function TfrmGeVenda.ValidarGTIN: Boolean;
var
  aError : String;
begin
  Result := False;
  try
    DtSrcTabelaItens.DataSet.DisableControls;
    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      if (not Trim(DtSrcTabelaItens.DataSet.FieldByName('CODBARRA_EAN').AsString).IsEmpty) then
        if (not StrIsGTIN(DtSrcTabelaItens.DataSet.FieldByName('CODBARRA_EAN').AsString, aError)) then
        begin
          TServiceMessage.ShowWarning('C�digo EAN/GTIN inv�lido!' + #13 + aError + #13#13 +
            Format('Verifique o cadastro do produto "%s" e corrija!', [DtSrcTabelaItens.DataSet.FieldByName('DESCRI').AsString]));
          Break;
        end;

      DtSrcTabelaItens.DataSet.Next;
    end;

    Result := True;
  finally
    DtSrcTabelaItens.DataSet.First;
    DtSrcTabelaItens.DataSet.EnableControls;
  end;
end;

function TfrmGeVenda.GetRotinaCancelarPagtosID: String;
begin
  Result := GetRotinaInternaID(dbgTitulos);
end;

function TfrmGeVenda.GetRotinaCancelarVendaID: String;
begin
  Result := GetRotinaInternaID(btbtnCancelarVND);
end;

function TfrmGeVenda.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btbtnFinalizar);
end;

function TfrmGeVenda.GetRotinaGerarNFeID: String;
begin
  Result := GetRotinaInternaID(btbtnGerarNFe);
end;

function TfrmGeVenda.GetRotinaEnviarEmailID: String;
begin
  Result := GetRotinaInternaID(nmEnviarEmailCliente);
end;

function TfrmGeVenda.GetRotinaGerarBoletoID: String;
begin
  Result := GetRotinaInternaID(nmGerarImprimirBoletos);
end;

procedure TfrmGeVenda.nmImprimirNotaEntregaClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin
    CarregarDadosEmpresa(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, 'Nota de Entrega (Termo de Recedimento)');
    AbrirEmitente( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString );
    AbrirDestinatario( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger );
    AbrirVenda( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

    frrNotaEntrega.ShowReport;
  end;
end;

procedure TfrmGeVenda.nmImprimirNotaEntregaXClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin
    CarregarDadosEmpresa(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, 'Nota de Entrega � Domic�lio');
    AbrirEmitente( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString );
    AbrirDestinatario( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger );
    AbrirVenda( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

    ImprimirCabecalho := ShowConfirmation('Nota de Entrega', 'Deseja imprimir na Nota de Entraga o Cabe�alho com informa��es da empresa?');

    frrNotaEntregaX.ShowReport;
  end;
end;

procedure TfrmGeVenda.nmImprimirCartaCreditoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    CarregarDadosEmpresa(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, 'Carta de Cr�dito');

    AbrirEmitente( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString );
    AbrirDestinatario( DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger );
    AbrirVenda( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );
    AbrirVendaCartaCredito( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

    frrVendaCartaCredito.ShowReport;

  end;
end;

procedure TfrmGeVenda.nmPpLimparDadosNFeClick(Sender: TObject);
var
  sArquivoENV , // Envio
  sArquivoREC , // Recibo
  sArquivoRET , // Retorno do processamento do recibo
  sArquivoNFe1, // NFe
  sArquivoNFe2, // NFe
  sDirXMLNFe  : String;
begin
  if not DtSrcTabela.DataSet.IsEmpty then
  begin
    if (gUsuarioLogado.Funcao <> FUNCTION_USER_ID_SYSTEM_ADM) then
    begin
      ShowStop('Favor entrar em contato com o suporte do sistema para execu��o desta rotina!');
      Exit;
    end;

    if ( Trim(DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
      Exit;

    if ( DtSrcTabela.DataSet.FieldByName('NFE').AsCurrency > 0 ) then
      Exit;

    if not ShowConfirmation('Limpar LOG', 'Confirma a limpeza do LOG de envio de NF-e para que esta seja enviada novamente?') then
      Exit;

    // Realocar arquivos XML de envio
    sDirXMLNFe := DMNFe.GetPathNFeXML(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString);

    if DirectoryExists(sDirXMLNFe) then
    begin
      sArquivoENV  := StringReplace(sDirXMLNFe + '\' + DtSrcTabela.DataSet.FieldByName('LOTE_NFE_NUMERO').AsString + '-env-lot.xml', '\\', '\', [rfReplaceAll]);
      sArquivoRET  := StringReplace(sDirXMLNFe + '\' + DtSrcTabela.DataSet.FieldByName('LOTE_NFE_RECIBO').AsString + '-pro-rec.xml', '\\', '\', [rfReplaceAll]);
      sArquivoREC  := StringReplace(sDirXMLNFe + '\' + DtSrcTabela.DataSet.FieldByName('LOTE_NFE_NUMERO').AsString + '-rec.xml',     '\\', '\', [rfReplaceAll]);

      sArquivoNFe1 := StringReplace(sDirXMLNFe + '\' +
        DMNFe.GetGerarChaveNFeXML(
          DtSrcTabela.DataSet.FieldByName('CODEMP').AsString,
          DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
          DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger,
          tnfSaida) + '-nfe.xml', '\\', '\', [rfReplaceAll]);

      sArquivoNFe2 := StringReplace(sDirXMLNFe + '\' +
        DMNFe.GetGerarChaveNFeXML(
          DtSrcTabela.DataSet.FieldByName('CODEMP').AsString,
          DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
          DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger,
          tnfSaida) + '-nfe_view.xml', '\\', '\', [rfReplaceAll]);

      ForceDirectories(ExtractFilePath(sArquivoENV) + 'log\');

      DeleteFile(ExtractFilePath(sArquivoENV)  + 'log\' + ExtractFileName(sArquivoENV));
      DeleteFile(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoRET));
      DeleteFile(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoREC));
      DeleteFile(ExtractFilePath(sArquivoNFe1) + 'log\' + ExtractFileName(sArquivoNFe1));
      DeleteFile(ExtractFilePath(sArquivoNFe2) + 'log\' + ExtractFileName(sArquivoNFe2));

      MoveFile(PChar(sArquivoENV),  PChar(ExtractFilePath(sArquivoENV)  + 'log\' + ExtractFileName(sArquivoENV)));
      MoveFile(PChar(sArquivoRET),  PChar(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoRET)));
      MoveFile(PChar(sArquivoREC),  PChar(ExtractFilePath(sArquivoREC)  + 'log\' + ExtractFileName(sArquivoREC)));
      MoveFile(PChar(sArquivoNFe1), PChar(ExtractFilePath(sArquivoNFe1) + 'log\' + ExtractFileName(sArquivoNFe1)));
      MoveFile(PChar(sArquivoNFe2), PChar(ExtractFilePath(sArquivoNFe2) + 'log\' + ExtractFileName(sArquivoNFe2)));
    end;

    // Limpar dados em envio
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update TBVENDAS Set ');
      SQL.Add('    LOTE_NFE_ANO    = null');
      SQL.Add('  , LOTE_NFE_NUMERO = null');
      SQL.Add('  , LOTE_NFE_CODIGO = null');
      SQL.Add('  , LOTE_NFE_RECIBO = null');
      SQL.Add('where ANO        = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
      SQL.Add('  and CODCONTROL = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
      SQL.Add('  and CODEMP     = ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString));
      ExecSQL;

      CommitTransaction;
    end;

    RecarregarRegistro;
    AbrirNotaFiscal( DtSrcTabela.DataSet.FieldByName('CODEMP').AsString, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsInteger );

    ShowInformation('Dados NF-e', 'LOG de envio de recibo NF-e limpo com sucesso!');
  end;
end;

procedure TfrmGeVenda.AbrirNotaFiscal(const Empresa : String ;const AnoVenda: Smallint;
  const ControleVenda: Integer);
begin
  with qryNFE do
  begin
    Close;
    ParamByName('empresa').AsString   := Empresa;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := ControleVenda;
    Open;
  end;
end;

procedure TfrmGeVenda.BtnCorrigirDadosNFeClick(Sender: TObject);
begin
  if not BtnLimparDadosNFe.Enabled then
    ppCorrigirDadosNFe.Popup(BtnCorrigirDadosNFe.ClientOrigin.X, BtnCorrigirDadosNFe.ClientOrigin.Y + BtnCorrigirDadosNFe.Height);
end;

procedure TfrmGeVenda.nmPpCorrigirDadosEntregaClick(Sender: TObject);
var
  sDadosEntrega : TStringList;
begin
  if not (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_VND_FIN, STATUS_VND_NFE]) then
    Exit;

  sDadosEntrega := TStringList.Create;
  try
    if Trim(DtSrcTabela.DataSet.FieldByName('DADOS_ENTREGA').AsString) <> EmptyStr then
      sDadosEntrega.Text := DtSrcTabela.DataSet.FieldByName('DADOS_ENTREGA').AsString
    else
      sDadosEntrega.Text :=
        '* Respons�vel pela entrega..............: ' + #13 +
        '* Entregar a(o) Sr(a)...................: ' + #13#13 +
        '* Endere�o para entrega do(s) produto(s): ' + #13 + GetClienteEndereco(DtSrcTabela.DataSet.FieldByName('CODCLIENTE').AsInteger, True);

    if SetDadosEntrega(Self, sDadosEntrega) then
      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update TBVENDAS Set ');
        SQL.Add('  DADOS_ENTREGA  = ' + QuotedStr(sDadosEntrega.Text));
        SQL.Add('where ANO        = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
        SQL.Add('  and CODCONTROL = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
        SQL.Add('  and CODEMP     = ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString));
        ExecSQL;

        CommitTransaction;

        RecarregarRegistro;
        pgcMaisDados.ActivePage := tbsDadosEntrega;
      end;
  finally
    sDadosEntrega.Free;
  end;
end;

procedure TfrmGeVenda.nmPpCorrigirDadosNFeCFOPClick(Sender: TObject);
var
  iCodigo    : Integer;
  sCFOP      ,
  sDescricao : String;
begin
  if not BtnCorrigirDadosNFe.Enabled then
    Exit;

  if ( SelecionarCFOP(Self, TTipoCFOP.tcfopSaida, iCodigo, sDescricao) ) then
  begin
    sCFOP := IntToStr(iCodigo);

    with DMBusiness do
    begin
      fdQryBusca.Close;
      fdQryBusca.SQL.Clear;
      fdQryBusca.SQL.Add('Update TBVENDAS Set ');
      fdQryBusca.SQL.Add('  CFOP = ' + sCFOP);
      fdQryBusca.SQL.Add('where ANO        = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
      fdQryBusca.SQL.Add('  and CODCONTROL = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
      fdQryBusca.SQL.Add('  and CODEMP     = ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString));
      fdQryBusca.ExecSQL;

      CommitTransaction;

      fdQryBusca.SQL.Clear;
      fdQryBusca.SQL.Add('Update TVENDASITENS Set ');
      fdQryBusca.SQL.Add('  CFOP_COD = ' + sCFOP);
      fdQryBusca.SQL.Add('where ANO        = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
      fdQryBusca.SQL.Add('  and CODCONTROL = ' + DtSrcTabela.DataSet.FieldByName('CODCONTROL').AsString);
      fdQryBusca.SQL.Add('  and CODEMP     = ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('CODEMP').AsString));
      fdQryBusca.ExecSQL;

      CommitTransaction;
    end;

    RecarregarRegistro;

    with DtSrcTabela.DataSet do
    begin
      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaFormasPagto( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaVolume( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirTabelaTitulos( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
      AbrirNotaFiscal( FieldByName('CODEMP').AsString, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger );
    end;

    ShowInformation('Corre��o', 'CFOP corrigido com sucesso!' + #13 + 'Favor pesquisar venda novamente.');
  end;
end;

procedure TfrmGeVenda.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

end.
