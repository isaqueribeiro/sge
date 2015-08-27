unit UDMNFe;

interface

uses
  UInfoVersao,
  PngImage,

  Windows, SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFe, DB,
  IBCustomDataSet, IBQuery, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF, frxExportMail, UGeConfigurarNFeACBr, TypInfo,
  HTTPApp, WinInet, Graphics, ExtCtrls, Jpeg,

  ACBrUtil, pcnConversao, pcnNFeW, pcnNFeRTXT, pcnAuxiliar, ACBrNFeUtil, SHDocVw,
  IBUpdateSQL, IBSQL, frxDesgn, frxRich, frxCross, frxChart, ACBrBase,
  ACBrBoleto, ACBrBoletoFCFR, frxExportImage, ACBrValidador, ACBrNFeDANFEFR,
  ACBrECF, ACBrRFD, ACBrAAC, ACBrEAD, ACBrECFVirtual,
  ACBrECFVirtualPrinter, ACBrECFVirtualNaoFiscal, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrNFeDANFeESCPOS, ACBrSAT, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, ACBrNFeDANFEFRDM;

type
  TTipoDANFE = (tipoDANFEFast, tipoDANFE_ESCPOS); 
  TQrImage_ErrCorrLevel = (L, M, Q, H);
  TTamanhoQrCode = (tamQrCode150, tamQrCode160, tamQrCode175, tamQrCode180, tamQrCode200, tamQrCode300);
  TFormaNFDevolucao = (fdNFeEletronica, fdNFeModelo1_1A, fdNFProdutorRural, fdCupomFiscal);
  TTipoNF = (tnfEntrada, tnfSaida);
  TDMNFe = class(TDataModule)
    ACBrNFe: TACBrNFe;
    frDANFE: TACBrNFeDANFEFR;
    qryDestinatario: TIBQuery;
    qryDuplicatas: TIBQuery;
    qryDadosProduto: TIBQuery;
    frdEmpresa: TfrxDBDataset;
    frdCliente: TfrxDBDataset;
    frrVenda: TfrxReport;
    frdVenda: TfrxDBDataset;
    frdItens: TfrxDBDataset;
    frdTitulo: TfrxDBDataset;
    qryEmitente: TIBDataSet;
    qryEmitenteCODIGO: TIntegerField;
    qryEmitentePESSOA_FISICA: TSmallintField;
    qryEmitenteCNPJ: TIBStringField;
    qryEmitenteRZSOC: TIBStringField;
    qryEmitenteNMFANT: TIBStringField;
    qryEmitenteIE: TIBStringField;
    qryEmitenteIM: TIBStringField;
    qryEmitenteFONE: TIBStringField;
    qryEmitenteLOGO: TBlobField;
    qryEmitenteTLG_TIPO: TSmallintField;
    qryEmitenteTLG_DESCRICAO: TIBStringField;
    qryEmitenteTLG_SIGLA: TIBStringField;
    qryEmitenteLOG_COD: TIntegerField;
    qryEmitenteLOG_NOME: TIBStringField;
    qryEmitenteCOMPLEMENTO: TIBStringField;
    qryEmitenteNUMERO_END: TIBStringField;
    qryEmitenteCEP: TIBStringField;
    qryEmitenteBAI_COD: TIntegerField;
    qryEmitenteBAI_NOME: TIBStringField;
    qryEmitenteCID_COD: TIntegerField;
    qryEmitenteCID_NOME: TIBStringField;
    qryEmitenteCID_SIAFI: TIntegerField;
    qryEmitenteCID_IBGE: TIntegerField;
    qryEmitenteCID_DDD: TSmallintField;
    qryEmitenteEST_COD: TSmallintField;
    qryEmitenteEST_NOME: TIBStringField;
    qryEmitenteEST_SIGLA: TIBStringField;
    qryEmitenteEST_SIAFI: TIntegerField;
    qryEmitenteEMAIL: TIBStringField;
    qryEmitenteHOME_PAGE: TIBStringField;
    qryEmitenteCHAVE_ACESSO_NFE: TIBStringField;
    qryEmitenteTIPO_REGIME_NFE: TSmallintField;
    qryEmitenteSERIE_NFE: TSmallintField;
    qryEmitenteNUMERO_NFE: TIntegerField;
    qryEmitenteLOTE_ANO_NFE: TSmallintField;
    qryEmitenteLOTE_NUM_NFE: TIntegerField;
    qryEmitentePAIS_ID: TIBStringField;
    qryEmitentePAIS_NOME: TIBStringField;
    qryCalculoImposto: TIBDataSet;
    IBSQL: TIBSQL;
    qryEmitenteCNAE: TIBStringField;
    FrECFPooler: TfrxReport;
    qryFormaPagtos: TIBQuery;
    frdFormaPagtos: TfrxDBDataset;
    qryFornecedorDestinatario: TIBQuery;
    frdFornecedor: TfrxDBDataset;
    frdEntrada: TfrxDBDataset;
    qryEntradaCalculoImposto: TIBDataSet;
    qryEntradaDadosProduto: TIBQuery;
    frdEntradaItens: TfrxDBDataset;
    qryEntradaDuplicatas: TIBQuery;
    frdEntradaDuplicata: TfrxDBDataset;
    qryNFeEmitida: TIBQuery;
    qryNFeEmitidaANOVENDA: TSmallintField;
    qryNFeEmitidaNUMVENDA: TIntegerField;
    qryNFeEmitidaDATAEMISSAO: TDateField;
    qryNFeEmitidaHORAEMISSAO: TTimeField;
    qryNFeEmitidaSERIE: TIBStringField;
    qryNFeEmitidaNUMERO: TIntegerField;
    qryNFeEmitidaCHAVE: TIBStringField;
    qryNFeEmitidaPROTOCOLO: TIBStringField;
    qryNFeEmitidaRECIBO: TIBStringField;
    qryNFeEmitidaXML_FILENAME: TIBStringField;
    qryNFeEmitidaXML_FILE: TMemoField;
    qryNFeEmitidaLOTE_ANO: TSmallintField;
    qryNFeEmitidaLOTE_NUM: TIntegerField;
    qryDadosVolume: TIBQuery;
    qryLoteNFePendente: TIBQuery;
    SmallintField1: TSmallintField;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    TimeField1: TTimeField;
    IBStringField1: TIBStringField;
    IntegerField2: TIntegerField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    MemoField1: TMemoField;
    SmallintField2: TSmallintField;
    IntegerField3: TIntegerField;
    frrBoletoEntrega: TfrxReport;
    frrRequisicaoCliente: TfrxReport;
    FrrECFPoolerRequisicaoCliente: TfrxReport;
    qryRequisicaoCliente: TIBQuery;
    frdRequisicaoCliente: TfrxDBDataset;
    cdsLOG: TIBDataSet;
    cdsLOGUSUARIO: TIBStringField;
    cdsLOGDATA_HORA: TDateTimeField;
    cdsLOGTIPO: TSmallintField;
    cdsLOGDESCRICAO: TIBStringField;
    cdsLOGESPECIFICACAO: TMemoField;
    updLOG: TIBUpdateSQL;
    qryNFeEmitidaEntrada: TIBQuery;
    qryNFeEmitidaEntradaANOCOMPRA: TSmallintField;
    qryNFeEmitidaEntradaNUMCOMPRA: TIntegerField;
    qryNFeEmitidaEntradaDATAEMISSAO: TDateField;
    qryNFeEmitidaEntradaHORAEMISSAO: TTimeField;
    qryNFeEmitidaEntradaSERIE: TIBStringField;
    qryNFeEmitidaEntradaNUMERO: TIntegerField;
    qryNFeEmitidaEntradaCHAVE: TIBStringField;
    qryNFeEmitidaEntradaPROTOCOLO: TIBStringField;
    qryNFeEmitidaEntradaRECIBO: TIBStringField;
    qryNFeEmitidaEntradaXML_FILENAME: TIBStringField;
    qryNFeEmitidaEntradaXML_FILE: TMemoField;
    qryNFeEmitidaEntradaLOTE_ANO: TSmallintField;
    qryNFeEmitidaEntradaLOTE_NUM: TIntegerField;
    qryAutorizacaoCompra: TIBQuery;
    frdAutorizacaoCompra: TfrxDBDataset;
    frrAutorizacaoCompra: TfrxReport;
    qryCotacaoCompra: TIBQuery;
    frdCotacaoCompra: TfrxDBDataset;
    frrCotacaoCompra: TfrxReport;
    qryCotacaoCompraFornecedor: TIBQuery;
    frdCotacaoCompraFornecedor: TfrxDBDataset;
    ACBrValidador: TACBrValidador;
    qryCotacaoCompraFornecedorItem: TIBQuery;
    frdCotacaoCompraFornecedorItem: TfrxDBDataset;
    frrCotacaoCompraMapaPreco: TfrxReport;
    frrNotaEntrega: TfrxReport;
    qryVendaCartaCredito: TIBQuery;
    frdVendaCartaCredito: TfrxDBDataset;
    frrVendaCartaCredito: TfrxReport;
    qryNFeEmitidaEMPRESA: TIBStringField;
    qryNFeEmitidaMODELO: TSmallintField;
    qryNFeEmitidaVERSAO: TSmallintField;
    qryNFeEmitidaEntradaEMPRESA: TIBStringField;
    qryNFeEmitidaEntradaMODELO: TSmallintField;
    qryNFeEmitidaEntradaVERSAO: TSmallintField;
    qryRequisicaoCompra: TIBQuery;
    frdRequisicaoCompra: TfrxDBDataset;
    frrRequisicaoCompra: TfrxReport;
    frrCartaCorrecaoE: TfrxReport;
    qryNFe: TIBQuery;
    qryNFeANOVENDA: TSmallintField;
    qryNFeNUMVENDA: TIntegerField;
    qryNFeEMPRESA: TIBStringField;
    qryNFeDATAEMISSAO: TDateField;
    qryNFeHORAEMISSAO: TTimeField;
    qryNFeSERIE: TIBStringField;
    qryNFeNUMERO: TIntegerField;
    qryNFeMODELO: TSmallintField;
    qryNFeVERSAO: TSmallintField;
    qryNFeCHAVE: TIBStringField;
    qryNFePROTOCOLO: TIBStringField;
    qryNFeRECIBO: TIBStringField;
    qryNFeXML_FILENAME: TIBStringField;
    qryNFeXML_FILE: TMemoField;
    qryNFeLOTE_ANO: TSmallintField;
    qryNFeLOTE_NUM: TIntegerField;
    qryCartaCorrecaoNFe: TIBDataSet;
    updCartaCorrecaoNFe: TIBUpdateSQL;
    qryCartaCorrecaoNFeCCE_NUMERO: TIntegerField;
    qryCartaCorrecaoNFeCCE_EMPRESA: TIBStringField;
    qryCartaCorrecaoNFeCCE_DATA: TDateField;
    qryCartaCorrecaoNFeCCE_HORA: TTimeField;
    qryCartaCorrecaoNFeCCE_ENVIADA: TSmallintField;
    qryCartaCorrecaoNFeNFE_SERIE: TIBStringField;
    qryCartaCorrecaoNFeNFE_NUMERO: TIntegerField;
    qryCartaCorrecaoNFeNFE_MODELO: TSmallintField;
    qryCartaCorrecaoNFeNUMERO: TIntegerField;
    qryCartaCorrecaoNFePROTOCOLO: TIBStringField;
    qryCartaCorrecaoNFeXML: TMemoField;
    qryCartaCorrecaoNFeCCE_TEXTO: TMemoField;
    ACBrECF: TACBrECF;
    ACBrRFD: TACBrRFD;
    ACBrAAC: TACBrAAC;
    ACBrEAD: TACBrEAD;
    ACBrECFVirtualNaoFiscal: TACBrECFVirtualNaoFiscal;
    nfcDANFE: TACBrNFeDANFeESCPOS;
    ACBrSATExtratoESCPOS: TACBrSATExtratoESCPOS;
    ACBrSAT: TACBrSAT;
    qryEmitenteSERIE_NFCE: TSmallintField;
    qryEmitenteNUMERO_NFCE: TIntegerField;
    qryApropriacaoEstoque: TIBQuery;
    frdApropriacaoEstoque: TfrxDBDataset;
    frrApropriacaoEstoque: TfrxReport;
    qryRequisicaoAlmox: TIBQuery;
    frdRequisicaoAlmox: TfrxDBDataset;
    frrRequisicaoAlmox: TfrxReport;
    frrManifestoAlmox: TfrxReport;
    qrySolicitacaoCompra: TIBQuery;
    frdSolicitacaoCompra: TfrxDBDataset;
    frrSolicitacaoCompra: TfrxReport;
    qryVendasCaixaDetalhe: TIBQuery;
    qryVendasCaixaFormaPagto: TIBQuery;
    qryVendasCaixaSoma: TIBQuery;
    frrNFeRetrato: TfrxReport;
    frrNFePaisagem: TfrxReport;
    ValidarXML: TXMLDocument;
    qryNFCDestinatario: TIBQuery;
    frdNFCDestinatario: TfrxDBDataset;
    frdNFCCalculoImposto: TfrxDBDataset;
    qryNFCCalculoImposto: TIBDataSet;
    qryNFCDadosProduto: TIBQuery;
    frdNFCDadosProduto: TfrxDBDataset;
    frrNotaEntregaX: TfrxReport;
    qryListaFuncionario: TIBQuery;
    frdListaFuncionario: TfrxDBDataset;
    frrListaFuncionario: TfrxReport;
    procedure SelecionarCertificado(Sender : TObject);
    procedure TestarServico(Sender : TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FrECFPoolerGetValue(const VarName: String;
      var Value: Variant);
    procedure frrAutorizacaoCompraGetValue(const VarName: String;
      var Value: Variant);
    procedure frrNotaEntregaXGetValue(const VarName: string;
      var Value: Variant);
  private
    { Private declarations }
    ver : TInfoVersao;

    frmACBr : TfrmGeConfigurarNFeACBr;
    fr3Designer: TfrxDesigner;

    FImprimirCabecalho : Boolean;

    procedure GerarTabela_CST_PIS;
    procedure GerarTabela_CST_COFINS;

    procedure UpdateNumeroNFe(const sCNPJEmitente : String; const Serie, Numero : Integer);
    procedure UpdateNumeroNFCe(const sCNPJEmitente : String; const Serie, Numero : Integer);
    procedure UpdateNumeroCCe(const sCNPJEmitente : String; const Numero : Integer);
    procedure UpdateLoteNFe(const sCNPJEmitente : String; const Ano, Numero : Integer);
    procedure GuardarLoteNFeVenda(const sCNPJEmitente : String; const Ano, Numero, NumeroLote : Integer; const Recibo : String);
    procedure GuardarLoteNFeEntrada(const sCNPJEmitente : String; const Ano, Numero, NumeroLote : Integer; const Recibo : String);

    procedure GerarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
    procedure GerarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
    procedure GerarNFCeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFCe, iNumeroNFCe : Integer; var FileNameXML : String);
    procedure GerarNFeComplementarACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String); virtual; abstract;

    function ImprimirCupomNaoFiscal_PORTA(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer) : Boolean;

    function ImprimirCupomNaoFiscal_ESCPOS(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer) : Boolean; virtual; abstract;

    function ImprimirCupomFechamentoCaixa_PORTA(const sEmpresa : String;
      const iAnoCaixa, iNumCaixa : Integer) : Boolean;

  public
    { Public declarations }
    property ConfigACBr : TfrmGeConfigurarNFeACBr read frmACBr write frmACBr;
    property ImprimirCabecalho : Boolean read FImprimirCabecalho write FImprimirCabecalho;

    procedure LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);

    procedure LerConfiguracao(const sCNPJEmitente : String; const tipoDANFE : TTipoDANFE = tipoDANFEFast);
    procedure GravarConfiguracao(const sCNPJEmitente : String);
    procedure ConfigurarEmail(const sCNPJEmitente, sDestinatario, sAssunto, sMensagem : String);
    procedure GerarArquivoQRCODE(const FileNameQRCODE, StringQRCODE : String; const tamanhoQrCode : TTamanhoQrCode);
    procedure CarregarArquivoNFe(const sCNPJEmitente, sArquivo : String;
      var aNomeArquivoXML, aEmitente, aDestinatario, aRecibo, aProtocolo, aChave : String;
      var aDataHoraEmissao : TDateTime; var NotaValida : Boolean;
      var aSerie : String; var aNumero, aModelo, aVersao : Integer;
      var aTipoNota : TTipoNF;
      var aValorNF  : Currency);

    procedure AbrirEmitente(sCNPJ : String);
    procedure AbrirDestinatario(iCodigo : Integer);
    procedure AbrirDestinatarioFornecedor(iCodigo : Integer);
    procedure AbrirVenda(AnoVenda, NumeroVenda : Integer);
    procedure AbrirVendaCartaCredito(AnoVenda, NumeroVenda : Integer);
    procedure AbrirVendasCaixa(AnoCaixa, NumeroCaixa : Integer);
    procedure AbrirCompra(AnoCompra, NumeroCompra : Integer);
    procedure AbrirNFeEmitida(AnoVenda, NumeroVenda : Integer);
    procedure AbrirNFeEmitidaEntrada(AnoCompra, NumeroCompra : Integer);
    procedure AbrirNFe(const sCNPJEmitente : String; const Modelo : Smallint; Serie : String; Numero : Integer);
    procedure AbrirCartaCorrecao(const sCNPJEmitente : String; const ControleCCe : Integer);
    procedure AbrirDestinatarioNFC(const aCNPJEmitente : String; const aCodigoNFC : Integer);
    procedure AbrirNFC(const aCNPJEmitente : String; const aCodigoNFC : Integer);

    function ReciboNaoExisteNaVenda(const sRecibo : String) : Boolean;
    function ReciboNaoExisteNaEntrada(const sRecibo : String) : Boolean;
    function GerarNFeOnLine(const sCNPJEmitente : String) : Boolean;
    function GetInformacaoFisco : String;
    function GetValidadeCertificado(const sCNPJEmitente : String; const Informe : Boolean = FALSE) : Boolean;

    function GerarNFeOnLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFCeOnLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFCe, iNumeroNFCe  : Integer; var FileNameXML, ChaveNFCe, ProtocoloNFCe, ReciboNFCe : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const Imprimir : Boolean = FALSE) : Boolean;

    function GerarNFeOffLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
      const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFeComplementarOnLineACBr(const aCNPJEmitente : String; aCodigoDestinatario : Integer; const aDataHoraSaida : String; const aTipoNotaOrigem : TTipoNF; const aControleNFC : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const Imprimir : Boolean = TRUE) : Boolean; virtual; abstract;

    function CancelarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;

    function CancelarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor, iAnoCompra, iNumCompra : Integer; const Motivo : String) : Boolean;

    function ImprimirDANFEACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
      const IsPDF : Boolean = FALSE) : Boolean;

    function ImprimirDANFE_ESCPOSACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
      const ImprimirItens : Boolean = TRUE) : Boolean;

    function ImprimirDANFEEntradaACBr(const sCNPJEmitente : String; const CodFornecedor: Integer; const iAnoCompra, iNumCompra : Integer;
      const IsPDF : Boolean = FALSE) : Boolean;

    function GerarNFeEntradaOnLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFeEntradaOffLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
      const Imprimir : Boolean = TRUE) : Boolean;

    function EnviarEmailDANFEACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
      const EnviarPDF : Boolean = True; const sArquivoBoleto : String = '') : Boolean;

    function InutilizaNumeroNFeACBr(const sCNPJEmitente : String; iAno, iModelo, iSerie, iNumeroInicial, iNumeroFinal : Integer; const sJustificativa : String; var sRetorno : String) : Boolean;
    function ConsultarNumeroLoteNFeACBr(const sCNPJEmitente : String; sNumeroRecibo : String;
      var sChaveNFe, sProtocolo, sRetorno : String; var dDHEnvio : TDateTime) : Boolean;
    function ConsultarChaveNFeACBr(const sCNPJEmitente, sChave : String;
      var iSerieNFe, iNumeroNFe, iTipoNFe : Integer; var DestinatarioNFE, FileNameXML, ChaveNFE, ProtocoloNFE : String;
      var DataEmissao : TDateTime; const Imprimir : Boolean = TRUE) : Boolean;
    function DownloadNFeACBr(const sCNPJEmitente, sCNPJDestinatario, sChaveNFe : String; var FileNameXML : String) : Boolean;

    function EnviarEmail_Generico(const sCNPJEmitente, sNumeroDocumento, sEmailDestinatario : String;
      const sArquivo : String = '') : Boolean;

    function ImprimirCupomNaoFiscal(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer) : Boolean;

    function ImprimirCupomOrcamento(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer) : Boolean;

    function ImprimirCupomFechamentoCaixa(const sEmpresa : String;
      const iAnoCaixa, iNumCaixa : Integer) : Boolean;

    function GerarEnviarCCeACBr(const sCNPJEmitente : String; const ControleCCe : Integer; sCondicaoUso : String) : Boolean;

    function GetModeloDF : Integer;
    function GetVersaoDF : Integer;
    function IsEstacaoEmiteNFCe : Boolean;
    function IsEstacaoEmiteNFCeResumido : Boolean;
  end;

var
  DMNFe: TDMNFe;

  procedure CorrigirXML_NFe(aString : WideString; sFileNameXML : String);

  function GetDiretorioNFe : String;
  function FormatarChaveNFe(const aChave : String) : String;

const
  UrlGoogleQrCode = 'http://chart.apis.google.com/chart?chs=%dx%d&cht=qr&chld=%s&chl=%s'; // Exemplo: http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=Isaque%20Marinho%20Ribeiro
  QrImgCorrStr    : Array [TQrImage_ErrCorrLevel] of string = ('L', 'M', 'Q', 'H');

  SELDIRHELP   = 1000;
  FILENAME_NFE_RAVE   = 'Report\NotaFiscalEletronica.rav';
  FILENAME_NFE_FAST   = 'Report\NotaFiscalEletronica.fr3';
  FILENAME_NFE_EVENTO = 'Report\Eventos.fr3';

  DIRECTORY_CANCEL = 'NFe\Canceladas\';
  DIRECTORY_PRINT  = 'NFe\Imprimir\';
  DIRECTORY_CLIENT = 'NFe\Clientes\';

  PROCESSO_NFE_AUTORIZADA   = 100;
  PROCESSO_NFE_LOTE_PROCES  = 103; // Processo: Lote recebido com Sucesso
  PROCESSO_NFE_USO_DENEGADO = 110; // Processo: Uso denegado

  REJEICAO_NFE_DUPLICIDADE = 204;

  REJEICAO_NFE_NOTA_DENEGADA     = 205; // Rejeicao: NF-e esta denegada na base de dados da SEFAZ
  REJEICAO_NFE_IE_NAO_CADASTRADO = 233; // Rejeicao: IE do destinatario nao cadastrada
  REJEICAO_NFE_IE_NAO_VINCULADO  = 234; // Rejeicao: IE do destinatario nao vinculada ao CNPJ
  REJEICAO_NFE_IRREG_FISCO_EMIT  = 301; // Rejeição: Uso Denegado: Irregularidade fiscal do emitente
  REJEICAO_NFE_IRREG_FISCO_DEST  = 302; // Rejeição: Uso Denegado: Irregularidade fiscal do destinatario

  REJEICAO_NFE_DESCOMPACT  = 416; // Rejeição: Falha na descompactação da área de dados
  REJEICAO_NFE_BC_ICMS_ERR = 531; // Rejeição: Total da BC ICMS difere do somatório dos itens
  REJEICAO_NFE_TO_ICMS_ERR = 532; // Rejeição: Total do ICMS difere do somatório dos itens
  REJEICAO_NFE_TO_PROD_ERR = 564; // Rejeição: Total do Produto / Serviço difere do somatório dos itens
  REJEICAO_NFE_MODELO_DIF  = 450; // Rejeição: Modelo da NF-e diferente de 55
  REJEICAO_NFCE_MODELO_DIF = 775; // Rejeição: Modelo da NFC-e diferente de 65

  PULAR_LINHA_FINAL = 3;

  procedure ConfigurarNFeACBr(const sCNPJEmitente : String);

implementation

uses
  UDMBusiness, Forms, FileCtrl, ACBrNFeConfiguracoes,
  ACBrNFeNotasFiscais, ACBrNFeWebServices, StdCtrls, pcnNFe, UFuncoes,
  UConstantesDGE, DateUtils, pcnRetConsReciNFe, pcnDownloadNFe, UEcfFactory,
  pcnEnvEventoNFe, pcnEventoNFe, ACBrSATClass, ACBrDFeUtil, IniFiles;

{$R *.dfm}

procedure CorrigirXML_NFe (aString : WideString; sFileNameXML : String);
var
//  ArquivoXML  : TStringList;
  S : WideString;
  xmlFile ,
  xmlNFe  : TStringStream;
begin
  xmlFile := TStringStream.Create;
  xmlNFe  := TStringStream.Create(aString);
  try
    if Trim(aString) = EmptyWideStr then
    begin
      // Desenvolver rotina de correção de conteúdo no arquivo
      xmlFile.LoadFromFile(sFileNameXML);
      S := EmptyWideStr;
      //...
    end
    else
    begin
      aString := StringReplace(aString, NFE_TAG_PROTNFE_ERROR, NFE_TAG_PROTNFE_FEET, [rfReplaceAll]);

      xmlNFe.WriteString(aString);
      xmlNFe.SaveToFile(sFileNameXML);
    end;
  finally
    xmlNFe.Free;
  end;

  // Blodo de código descontinuado por não funcionar no Delphi XE7
(*
  if ( FileExists(sFileNameXML) ) then
  begin

    ArquivoXML := TStringList.Create;
    ArquivoXML.LoadFromFile( sFileNameXML, TEncoding.UTF8 );

    ArquivoXML.Text := StringReplace(ArquivoXML.Text, NFE_TAG_PROTNFE_ERROR, NFE_TAG_PROTNFE_FEET, [rfReplaceAll]);

    ArquivoXML.SaveToFile(sFileNameXML);
    ArquivoXML.Free;
  end;
*)
end;

procedure RemoverAcentos_ArquivoTexto (sFileName : String);
var
  ArquivoXML : TStringList;
begin
  if ( FileExists(sFileName) ) then
  begin
    ArquivoXML := TStringList.Create;
    ArquivoXML.LoadFromFile( sFileName );

    ArquivoXML.Text := RemoveAcentos(ArquivoXML.Text);

    ArquivoXML.SaveToFile(sFileName);
    ArquivoXML.Free;
  end;
end;

function GetDiretorioNFe : String;
begin
  Result := StringReplace(DMNFe.ACBrNFe.Configuracoes.Geral.PathSalvar + '\', '\\', '\', [rfReplaceAll]);
end;

function FormatarChaveNFe(const aChave : String) : String;
begin
  Result := Trim(NotaUtil.FormatarChaveAcesso(aChave));
end;

procedure ConfigurarNFeACBr(const sCNPJEmitente : String);
var
 I : Integer;
begin
(*
  IMR - 09/12/2014 :
    Disponiblizar configuração para emissão e impressão de NFC-e.
*)
  try

    I := ID_ABORT;

    with DMNFe do
    begin

      if ( not Assigned(ConfigACBr) ) then
        ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

      {$IFDEF DGE}
      ConfigACBr.lblIdToken.Enabled   := True;
      ConfigACBr.edIdToken.Enabled    := True;
      ConfigACBr.lblToken.Enabled     := True;
      ConfigACBr.edToken.Enabled      := True;
      ConfigACBr.ckEmitirNFCe.Enabled := True;
      {$ELSE}
      ConfigACBr.lblIdToken.Enabled   := (gSistema.Codigo = SISTEMA_PDV);
      ConfigACBr.edIdToken.Enabled    := (gSistema.Codigo = SISTEMA_PDV);
      ConfigACBr.lblToken.Enabled     := (gSistema.Codigo = SISTEMA_PDV);
      ConfigACBr.edToken.Enabled      := (gSistema.Codigo = SISTEMA_PDV);
      ConfigACBr.ckEmitirNFCe.Enabled := (gSistema.Codigo = SISTEMA_PDV);
      {$ENDIF}

      LerConfiguracao(sCNPJEmitente);

      if ( not ConfigACBr.Showing ) then
        I := ConfigACBr.ShowModal;

      ConfigACBr.pgcGuiasGerais.ActivePage        := ConfigACBr.TbsConfiguracoes;
      ConfigACBr.pgcGuiasConfiguracoes.ActivePage := ConfigACBr.TbsGeral;

      if ( I = ID_OK ) then
      begin
        GravarConfiguracao(sCNPJEmitente);
        LerConfiguracao(sCNPJEmitente);
      end;

    end;

  finally
  end;
end;

procedure WinInet_HttpGet(const Url: string; Stream: TStream);
const
  BuffSize = 1024 * 1024;
var
  hInter: HINTERNET;
  UrlHandle: HINTERNET;
  BytesRead: DWORD;
  Buffer: Pointer;
begin
  hInter := InternetOpen('', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if Assigned(hInter) then
  begin
    Stream.Seek(0, 0);
    GetMem(Buffer, BuffSize);
    try
      UrlHandle := InternetOpenUrl(hInter, PChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);
      if Assigned(UrlHandle) then
      begin
        repeat
          InternetReadFile(UrlHandle, Buffer, BuffSize, BytesRead);
          if BytesRead > 0 then
            Stream.WriteBuffer(Buffer^, BytesRead);
        until BytesRead = 0;
        InternetCloseHandle(UrlHandle);
      end;
    finally
      FreeMem(Buffer);
    end;

    InternetCloseHandle(hInter);
  end
end;

procedure GetQrCode(Width, Height: Word; Correction_Level: TQrImage_ErrCorrLevel;
  const Data: string; StreamImage: TMemoryStream);
Var
  EncodedURL: string;
begin
  EncodedURL := Format(UrlGoogleQrCode, [Width, Height, QrImgCorrStr[Correction_Level], HTTPEncode(Data)]);
  WinInet_HttpGet(EncodedURL, StreamImage);
end;

procedure TDMNFe.AbrirEmitente(sCNPJ: String);
begin
  if not DataBaseOnLine then
    Exit;

  with qryEmitente do
  begin
    Close;
    ParamByName('Cnpj').AsString := sCNPJ;
    Open;

    if ( not qryEmitenteLOGO.IsNull ) then
      qryEmitenteLOGO.SaveToFile(ExtractFilePath(Application.ExeName) + sCNPJ + '.bmp');
  end;
end;

procedure TDMNFe.AbrirDestinatario(iCodigo : Integer);
begin
  with qryDestinatario do
  begin
    Close;
    ParamByName('Codigo').AsInteger := iCodigo;
    Open;
  end;
end;

procedure TDMNFe.AbrirVenda(AnoVenda, NumeroVenda : Integer);
begin
  with qryCalculoImposto do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryFormaPagtos do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDadosProduto do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDadosVolume do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;

  with qryDuplicatas do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;
end;

procedure TDMNFe.AbrirNFeEmitida(AnoVenda, NumeroVenda: Integer);
begin
  with qryNFeEmitida do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;
end;

procedure TDMNFe.AbrirNFeEmitidaEntrada(AnoCompra, NumeroCompra: Integer);
begin
  with qryNFeEmitidaEntrada do
  begin
    Close;
    ParamByName('anocompra').AsInteger := AnoCompra;
    ParamByName('numcompra').AsInteger := NumeroCompra;
    Open;
  end;
end;

procedure TDMNFe.DataModuleCreate(Sender: TObject);
begin
  if not DataBaseOnLine then
    Exit;

  ver := TInfoVersao.GetInstance();
  
  AbrirEmitente( GetEmpresaIDDefault );
  ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

  ConfigACBr.sbtnGetCert.OnClick := SelecionarCertificado;
  ConfigACBr.btnServico.OnClick  := TestarServico;

  frDANFE.Sistema := GetCompanyName + ' - Contato(s): ' + GetContacts;

  // A leitura do Certificado será feita agora apenas na emissão da NF-e
  //LerConfiguracao(GetEmpresaIDDefault);

  fr3Designer := TfrxDesigner.Create(Self);

  GerarTabela_CST_PIS;
  GerarTabela_CST_COFINS;

  FImprimirCabecalho := True;
end;

procedure TDMNFe.GravarConfiguracao(const sCNPJEmitente : String);
Var
  sPrefixoSecao : String;
  StreamMemo    : TMemoryStream;

  sSecaoCertificado,
  sSecaoGeral      ,
  sSecaoEmitente   ,
  sSecaoWebService : String;
begin
  try

    AbrirEmitente(sCNPJEmitente);

    if ( GetQuantidadeEmpresasEmiteNFe > 1 ) then
      sPrefixoSecao := Trim(sCNPJEmitente) + '_'
    else
      sPrefixoSecao := EmptyStr;

    sSecaoCertificado := sPrefixoSecao + INI_SECAO_CERTIFICADO;
    sSecaoGeral       := sPrefixoSecao + INI_SECAO_GERAL;
    sSecaoEmitente    := sPrefixoSecao + INI_SECAO_EMITENTE;
    sSecaoWebService  := sPrefixoSecao + INI_SECAO_WEBSERVICE;

    with ConfigACBr, FileINI do
    begin
      WriteString( sSecaoCertificado, 'Caminho' , edtCaminho.Text) ;
      WriteString( sSecaoCertificado, 'Senha'   , edtSenha.Text) ;
      WriteString( sSecaoCertificado, 'NumSerie', edtNumSerie.Text) ;

      WriteBool   (sSecaoGeral, 'AtualizarXML',     ckAtualizarXML.Checked);
      WriteBool   (sSecaoGeral, 'ExibirErroSchema', ckExibirErroSchema.Checked);
      WriteString (sSecaoGeral, 'FormatoAlerta',    edFormatoAlerta.Text) ;
      WriteInteger(sSecaoGeral, 'FormaEmissao', cbFormaEmissao.ItemIndex) ;
      WriteString (sSecaoGeral, 'IdToken'     , edIdToken.Text) ;
      WriteString (sSecaoGeral, 'Token'       , edToken.Text) ;
      WriteBool   (sSecaoGeral, 'GerarNFCe'   , ckEmitirNFCe.Checked);
      WriteInteger(sSecaoGeral, 'DANFE'       , rgTipoDanfe.ItemIndex) ;
      WriteString (sSecaoGeral, 'LogoMarca'   , edtLogoMarca.Text) ;
      WriteBool   (sSecaoGeral, 'RetirarAcentos', ckRetirarAcentos.Checked) ;
      WriteBool   (sSecaoGeral, 'Salvar'      ,   ckSalvar.Checked) ;
      WriteString (sSecaoGeral, 'PathSalvar'  , edPathLogs.Text) ;
      WriteString (sSecaoGeral, 'PathSchemas' , edPathSchemas.Text) ;
      WriteInteger(sSecaoGeral, 'ModoGerarNFe', rgModoGerarNFe.ItemIndex) ;

      WriteBool  ('Arquivos', 'Salvar'        , ckSalvarArqs.Checked) ;
      WriteBool  ('Arquivos', 'PastaMensal'   , ckPastaMensal.Checked) ;
      WriteBool  ('Arquivos', 'AddLiteral'    , ckAdicionaLiteral.Checked) ;
      WriteBool  ('Arquivos', 'EmissaoPathNFe', ckEmissaoPathNFe.Checked) ;
      WriteBool  ('Arquivos', 'SalvarCCeCanPathEvento', ckSalvaCCeCancelamentoPathEvento.Checked) ;
      WriteBool  ('Arquivos', 'SepararPorCNPJ'        , ckSepararPorCNPJ.Checked) ;
      WriteBool  ('Arquivos', 'SepararPorModelo'      , ckSepararPorModelo.Checked) ;
      WriteString('Arquivos', 'PathNFe'    , edPathNFe.Text) ;
      WriteString('Arquivos', 'PathCan'    , edPathCan.Text) ;
      WriteString('Arquivos', 'PathInu'    , edPathInu.Text) ;
      WriteString('Arquivos', 'PathDPEC'   , edPathDPEC.Text) ;
      WriteString('Arquivos', 'PathCCe'    , edPathCCe.Text) ;
      WriteString('Arquivos', 'PathEvento' , edPathEvento.Text) ;

      WriteString (sSecaoWebService, 'UF'        , cbUF.Text) ;
      WriteInteger(sSecaoWebService, 'Ambiente'  , rgTipoAmb.ItemIndex) ;
      WriteInteger(sSecaoWebService, 'VersaoNFe' , cbVersaoDF.ItemIndex) ;
      WriteBool   (sSecaoWebService, 'Visualizar', ckVisualizar.Checked) ;
      WriteBool   (sSecaoWebService, 'SalvarSOAP', ckSalvarSOAP.Checked) ;
      WriteBool   (sSecaoWebService, 'AjustarAut', ckAjustarAut.Checked) ;
      WriteString (sSecaoWebService, 'Aguardar'  , edAguardar.Text) ;
      WriteString (sSecaoWebService, 'Tentativas', edTentativas.Text) ;
      WriteString (sSecaoWebService, 'Intervalo' , edIntervalo.Text) ;

      WriteString( 'Proxy', 'Host'   , edtProxyHost.Text) ;
      WriteString( 'Proxy', 'Porta'  , edtProxyPorta.Text) ;
      WriteString( 'Proxy', 'User'   , edtProxyUser.Text) ;
      WriteString( 'Proxy', 'Pass'   , edtProxySenha.Text) ;

      WriteString( sSecaoEmitente, 'CNPJ'       , edtEmitCNPJ.Text) ;
      WriteString( sSecaoEmitente, 'IE'         , edtEmitIE.Text) ;
      WriteString( sSecaoEmitente, 'RazaoSocial', edtEmitRazao.Text) ;
      WriteString( sSecaoEmitente, 'Fantasia'   , edtEmitFantasia.Text) ;
      WriteString( sSecaoEmitente, 'Fone'       , edtEmitFone.Text) ;
      WriteString( sSecaoEmitente, 'CEP'        , edtEmitCEP.Text) ;
      WriteString( sSecaoEmitente, 'Logradouro' , edtEmitLogradouro.Text) ;
      WriteString( sSecaoEmitente, 'Numero'     , edtEmitNumero.Text) ;
      WriteString( sSecaoEmitente, 'Complemento', edtEmitComp.Text) ;
      WriteString( sSecaoEmitente, 'Bairro'     , edtEmitBairro.Text) ;
      WriteString( sSecaoEmitente, 'CodCidade'  , edtEmitCodCidade.Text) ;
      WriteString( sSecaoEmitente, 'Cidade'     , edtEmitCidade.Text) ;
      WriteString( sSecaoEmitente, 'UF'         , edtEmitUF.Text) ;
      WriteString( sSecaoEmitente, 'InfoFisco'  , edInfoFisco.Text) ;

      WriteString( 'Email', 'Host'    ,edtSmtpHost.Text) ;
      WriteString( 'Email', 'Port'    ,edtSmtpPort.Text) ;
      WriteString( 'Email', 'User'    ,edtSmtpUser.Text) ;
      WriteString( 'Email', 'Pass'    ,edtSmtpPass.Text) ;
      WriteString( 'Email', 'Assunto' ,edtEmailAssunto.Text) ;
      WriteBool(   'Email', 'SSL'     ,cbEmailSSL.Checked ) ;

      StreamMemo := TMemoryStream.Create;

      mmEmailMsg.Lines.SaveToStream(StreamMemo);
      StreamMemo.Seek(0, soFromBeginning);

      WriteBinaryStream( 'Email', 'Mensagem', StreamMemo) ;

      StreamMemo.Free;
    end;

  finally
  end;
end;

procedure TDMNFe.LerConfiguracao(const sCNPJEmitente : String; const tipoDANFE : TTipoDANFE = tipoDANFEFast);
Var
  Ok : Boolean;
  StreamMemo : TMemoryStream;
  sPrefixoSecao,
  sAssinaturaHtml,
  sAssinaturaTxt ,
  sFileNFERave   ,
  sFileNFEFast   ,
  sFileNFEEvento : String;

  sSecaoCertificado,
  sSecaoGeral      ,
  sSecaoEmitente   ,
  sSecaoWebService : String;
begin
(*
  IMR - 29/05/2015 :
    Inserção de novos controles WebService para controle do envio e recebimento das NFs.

  IMR - 28/10/2014 :
    Inserção do campo "Versão NF-e:" para definir na tela de configurações a versão de emissão da NF-e

  IMR - 05/12/2014 :
    Definir configurações do RFD   - Registro do Fisco CAT 52/07. Configuração importante para emissão de CUPOM
    Definir configurações do NFC-e - Inserção/configuração dos componentes necessários a Emissão de Cupons de NFC-e

  IMR - 30/09/2014 :
    Retorno a versão 2.0 da NF-e por a versão 3.10 ainda apresentar inconsistências segundo a SEFA em determinados processos. A reativação
    da versão 3.10 e sua liberação para uso está agora para 30/10/2014.

    Atenção: Prazo final de uso da Versão 2.00, até 30/11/2014. Sendo, até esta data, recepcionado as duas versões. A desativação da versão
    "2.00" será no dia 01/12/2014. (Fonte: http://portalnfe.fazenda.mg.gov.br/)
*)
  if not DataBaseOnLine then
    Exit;

  try

    AbrirEmitente(sCNPJEmitente);

    if ( GetQuantidadeEmpresasEmiteNFe > 1 ) then
      sPrefixoSecao := Trim(sCNPJEmitente) + '_'
    else
      sPrefixoSecao := EmptyStr;

    sSecaoCertificado := sPrefixoSecao + INI_SECAO_CERTIFICADO;
    sSecaoGeral       := sPrefixoSecao + INI_SECAO_GERAL;
    sSecaoEmitente    := sPrefixoSecao + INI_SECAO_EMITENTE;
    sSecaoWebService  := sPrefixoSecao + INI_SECAO_WEBSERVICE;

    with ConfigACBr, FileINI do
    begin

      {$IFDEF ACBrNFeOpenSSL}
         edtCaminho.Text  := ReadString( sSecaoCertificado, 'Caminho' , '') ;
         edtSenha.Text    := ReadString( sSecaoCertificado, 'Senha'   , '') ;
         edtNumSerie.Visible := False;
         Label25.Visible     := False;
         sbtnGetCert.Visible := False;
         
         ACBrNFe.Configuracoes.Certificados.Certificado  := Trim(edtCaminho.Text);
         ACBrNFe.Configuracoes.Certificados.Senha        := Trim(edtSenha.Text);
      {$ELSE}
         edtNumSerie.Text    := ReadString( sSecaoCertificado, 'NumSerie', '') ;
         lbltCaminho.Caption := 'Informe o número de série do certificado'#13+
                                'Disponível no Internet Explorer no menu'#13+
                                'Ferramentas - Opções da Internet - Conteúdo '#13+
                                'Certificados - Exibir - Detalhes - '#13+
                                'Número do certificado';
         lbltSenha.Visible  := False;
         edtCaminho.Visible := False;
         edtSenha.Visible   := False;
         sbtnCaminhoCert.Visible := False;

         ACBrNFe.Configuracoes.Certificados.NumeroSerie := Trim(edtNumSerie.Text);
      {$ENDIF}

      ckAtualizarXML.Checked     := ReadBool   (sSecaoGeral, 'AtualizarXML',     ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado);
      ckExibirErroSchema.Checked := ReadBool   (sSecaoGeral, 'ExibirErroSchema', ACBrNFe.Configuracoes.Geral.ExibirErroSchema);
      edFormatoAlerta.Text       := ReadString (sSecaoGeral, 'FormatoAlerta',    'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.') ;
      cbFormaEmissao.ItemIndex   := ReadInteger(sSecaoGeral, 'FormaEmissao',     0) ;
      rgModoGerarNFe.ItemIndex   := 1; // ReadInteger( 'Geral', 'ModoGerarNFe', 1) ;
      edIdToken.Text       := ReadString(sSecaoGeral, 'IdToken',   GetTokenID_NFCe(sCNPJEmitente));
      edToken.Text         := ReadString(sSecaoGeral, 'Token'  ,   GetToken_NFCe(sCNPJEmitente));
      ckEmitirNFCe.Checked := ReadBool  (sSecaoGeral, 'GerarNFCe', False);

      ckRetirarAcentos.Checked := ReadBool  (sSecaoGeral, 'RetirarAcentos', True) ;
      ckSalvar.Checked         := ReadBool  (sSecaoGeral, 'Salvar'        , True) ;
      edPathLogs.Text          := ReadString(sSecaoGeral, 'PathSalvar'  , '') ;
      edPathSchemas.Text       := ReadString(sSecaoGeral, 'PathSchemas' , PathWithDelim(ExtractFilePath(Application.ExeName)) + 'Schemas\' + GetEnumName(TypeInfo(TpcnVersaoDF), Integer(cbVersaoDF.ItemIndex))) ;

      frDANFE.PathPDF := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT;

      with ACBrNFe.Configuracoes do
      begin
        Arquivos.PathNFe    := StringReplace(Geral.PathSalvar + '\NFe',         '\\', '\', [rfReplaceAll]);
        Arquivos.PathCan    := StringReplace(Geral.PathSalvar + '\NFeCancelar', '\\', '\', [rfReplaceAll]);
        Arquivos.PathInu    := StringReplace(Geral.PathSalvar + '\NFeInutiliz', '\\', '\', [rfReplaceAll]);
        Arquivos.PathEvento := StringReplace(Geral.PathSalvar + '\NFeEvento',   '\\', '\', [rfReplaceAll]);
        Arquivos.PathCCe    := StringReplace(Geral.PathSalvar + '\CCe',         '\\', '\', [rfReplaceAll]);
        Arquivos.PathMDe    := StringReplace(Geral.PathSalvar + '\MDe',         '\\', '\', [rfReplaceAll]);
        Arquivos.PathDPEC   := StringReplace(Geral.PathSalvar + '\DPEC',        '\\', '\', [rfReplaceAll]);
      end;

      ckSalvarArqs.Checked                     := ReadBool('Arquivos', 'Salvar'        , False);
      ckPastaMensal.Checked                    := ReadBool('Arquivos', 'PastaMensal'   , False);
      ckAdicionaLiteral.Checked                := ReadBool('Arquivos', 'AddLiteral'    , False);
      ckEmissaoPathNFe.Checked                 := ReadBool('Arquivos', 'EmissaoPathNFe', False);
      ckSalvaCCeCancelamentoPathEvento.Checked := ReadBool('Arquivos', 'SalvarCCeCanPathEvento', False);
      ckSepararPorCNPJ.Checked                 := ReadBool('Arquivos', 'SepararPorCNPJ'        , False);
      ckSepararPorModelo.Checked               := ReadBool('Arquivos', 'SepararPorModelo'      , False);
      edPathNFe.Text    := ReadString('Arquivos', 'PathNFe'   , ACBrNFe.Configuracoes.Arquivos.PathNFe) ;
      edPathCan.Text    := ReadString('Arquivos', 'PathCan'   , ACBrNFe.Configuracoes.Arquivos.PathCan) ;
      edPathInu.Text    := ReadString('Arquivos', 'PathInu'   , ACBrNFe.Configuracoes.Arquivos.PathInu) ;
      edPathDPEC.Text   := ReadString('Arquivos', 'PathDPEC'  , ACBrNFe.Configuracoes.Arquivos.PathDPEC) ;
      edPathCCe.Text    := ReadString('Arquivos', 'PathCCe'   , ACBrNFe.Configuracoes.Arquivos.PathCCe) ;
      edPathEvento.Text := ReadString('Arquivos', 'PathEvento', ACBrNFe.Configuracoes.Arquivos.PathEvento) ;

      with ACBrNFe.Configuracoes.Arquivos do
      begin
        Salvar             := ckSalvarArqs.Checked;
        PastaMensal        := ckPastaMensal.Checked;
        AdicionarLiteral   := ckAdicionaLiteral.Checked;
        EmissaoPathNFe     := ckEmissaoPathNFe.Checked;
        SalvarCCeCanEvento := ckSalvaCCeCancelamentoPathEvento.Checked;
        SepararPorCNPJ     := ckSepararPorCNPJ.Checked;
        SepararPorModelo   := ckSepararPorModelo.Checked;
      end;

      ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := ckAtualizarXML.Checked;
      ACBrNFe.Configuracoes.Geral.ExibirErroSchema      := ckExibirErroSchema.Checked;
      ACBrNFe.Configuracoes.Geral.FormatoAlerta         := edFormatoAlerta.Text;
      ACBrNFe.Configuracoes.Geral.FormaEmissao   := StrToTpEmis(OK, IntToStr(cbFormaEmissao.ItemIndex + 1));
      ACBrNFe.Configuracoes.Geral.IdToken        := edIdToken.Text;
      ACBrNFe.Configuracoes.Geral.Token          := edToken.Text;
      ACBrNFe.Configuracoes.Geral.Salvar         := ckSalvar.Checked;
      ACBrNFe.Configuracoes.Geral.PathSalvar     := edPathLogs.Text;
      ACBrNFe.Configuracoes.Geral.RetirarAcentos := ckRetirarAcentos.Checked;

      ACBrNFe.Configuracoes.Geral.ModeloDF := moNFe;
      ACBrNFe.Configuracoes.Geral.VersaoDF := TpcnVersaoDF(cbVersaoDF.ItemIndex); // ve310;

      if ( tipoDANFE = tipoDANFEFast ) then
        ACBrNFe.DANFE := frDANFE
      else
      if ( tipoDANFE = tipoDANFE_ESCPOS ) then
        ACBrNFe.DANFE := nfcDANFE;

      cbUF.ItemIndex       := cbUF.Items.IndexOf(ReadString( sSecaoWebService, 'UF', 'PA')) ;
      rgTipoAmb.ItemIndex  := ReadInteger(sSecaoWebService, 'Ambiente'  , 0) ;
      cbVersaoDF.ItemIndex := ReadInteger(sSecaoWebService, 'VersaoNFe' , 0) ;
      ckVisualizar.Checked := ReadBool   (sSecaoWebService, 'Visualizar', ACBrNFe.Configuracoes.WebServices.Visualizar) ;
      ckSalvarSOAP.Checked := ReadBool   (sSecaoWebService, 'SalvarSOAP', ACBrNFe.Configuracoes.WebServices.Salvar) ;
      ckAjustarAut.Checked := ReadBool   (sSecaoWebService, 'AjustarAut', False) ;
      edAguardar.Text      := ReadString (sSecaoWebService, 'Aguardar'  , '0') ;
      edTentativas.Text    := ReadString (sSecaoWebService, 'Tentativas', '5') ;
      edIntervalo.Text     := ReadString (sSecaoWebService, 'Intervalo' , '0') ;

      ACBrNFe.Configuracoes.WebServices.UF         := cbUF.Text;
      ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok, IntToStr(rgTipoAmb.ItemIndex + 1));
      ACBrNFe.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;
      ACBrNFe.Configuracoes.WebServices.Salvar     := ckSalvarSOAP.Checked;

      ACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := ckAjustarAut.Checked;
      if DFeUtil.NaoEstaVazio(edAguardar.Text)then
        ACBrNFe.Configuracoes.WebServices.AguardarConsultaRet := DFeUtil.SeSenao(StrToInt(edAguardar.Text) < 1000, StrToInt(edAguardar.Text) * 1000, StrToInt(edAguardar.Text))
      else
        edAguardar.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.AguardarConsultaRet);

      if DFeUtil.NaoEstaVazio(edTentativas.Text) then
        ACBrNFe.Configuracoes.WebServices.Tentativas := StrToInt(edTentativas.Text)
      else
        edTentativas.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.Tentativas);

      if DFeUtil.NaoEstaVazio(edIntervalo.Text) then
        ACBrNFe.Configuracoes.WebServices.IntervaloTentativas := DFeUtil.SeSenao(StrToInt(edIntervalo.Text) < 1000, StrToInt(edIntervalo.Text) * 1000, StrToInt(edIntervalo.Text))
      else
        edIntervalo.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.IntervaloTentativas);

      edtProxyHost.Text  := ReadString( 'Proxy', 'Host'  , '') ;
      edtProxyPorta.Text := ReadString( 'Proxy', 'Porta' , '') ;
      edtProxyUser.Text  := ReadString( 'Proxy', 'User'  , '') ;
      edtProxySenha.Text := ReadString( 'Proxy', 'Pass'  , '') ;

      ACBrNFe.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

      rgTipoDanfe.ItemIndex := ReadInteger( sSecaoGeral, 'DANFE'     , 0) ;
      edtLogoMarca.Text     := ReadString ( sSecaoGeral, 'LogoMarca' , ExtractFilePath(ParamStr(0)) + sCNPJEmitente + '.bmp') ;

      if ACBrNFe.DANFE <> nil then
      begin
        ACBrNFe.DANFE.TipoDANFE := StrToTpImp(OK, IntToStr(rgTipoDanfe.ItemIndex + 1));

        if ( FilesExists(ExtractFilePath(ParamStr(0)) + sCNPJEmitente + '.bmp')) then
          ACBrNFe.DANFE.Logo := ExtractFilePath(ParamStr(0)) + sCNPJEmitente + '.bmp'
        else
        if ( FilesExists(Trim(edtLogoMarca.Text)) ) then
          ACBrNFe.DANFE.Logo := Trim(edtLogoMarca.Text)
        else
          ACBrNFe.DANFE.Logo := EmptyStr;
      end;

      edtEmitCNPJ.Text       := ReadString( sSecaoEmitente, 'CNPJ'       , EmptyStr ) ;
      edtEmitIE.Text         := ReadString( sSecaoEmitente, 'IE'         , EmptyStr ) ;
      edtEmitRazao.Text      := ReadString( sSecaoEmitente, 'RazaoSocial', EmptyStr ) ;
      edtEmitFantasia.Text   := ReadString( sSecaoEmitente, 'Fantasia'   , EmptyStr ) ;
      edtEmitFone.Text       := ReadString( sSecaoEmitente, 'Fone'       , EmptyStr ) ;
      edtEmitCEP.Text        := ReadString( sSecaoEmitente, 'CEP'        , EmptyStr ) ;
      edtEmitLogradouro.Text := ReadString( sSecaoEmitente, 'Logradouro' , EmptyStr ) ;
      edtEmitNumero.Text     := ReadString( sSecaoEmitente, 'Numero'     , EmptyStr ) ;
      edtEmitComp.Text       := ReadString( sSecaoEmitente, 'Complemento', EmptyStr ) ;
      edtEmitBairro.Text     := ReadString( sSecaoEmitente, 'Bairro'     , EmptyStr ) ;
      edtEmitCodCidade.Text  := ReadString( sSecaoEmitente, 'CodCidade'  , EmptyStr ) ;
      edtEmitCidade.Text     := ReadString( sSecaoEmitente, 'Cidade'     , EmptyStr ) ;
      edtEmitUF.Text         := ReadString( sSecaoEmitente, 'UF'         , EmptyStr ) ;
      edInfoFisco.Text       := ReadString( sSecaoEmitente, 'InfoFisco'  , 'EMPRESA OPTANTE PELO SIMPLES DE ACORDO COM A LEI COMPLEMENTAR 123, DE DEZEMBRO DE 2006' ) ;

      // Configuração para envio de e-mails

      CarregarConfiguracoesEmpresa(sCNPJEmitente, 'Envio de NF-e (Emitente: ' + edtEmitRazao.Text + ')', sAssinaturaHtml, sAssinaturaTxt);

      if ( Trim(gContaEmail.Conta) <> EmptyStr ) then
      begin
        edtSmtpHost.Text      := gContaEmail.Servidor_SMTP;
        edtSmtpPort.Text      := IntToStr(gContaEmail.Porta_SMTP);
        edtSmtpUser.Text      := gContaEmail.Conta;
        edtSmtpPass.Text      := gContaEmail.Senha;
        edtEmailAssunto.Text  := 'Envio de NF-e (Emitente: ' + edtEmitRazao.Text + ')';
        cbEmailSSL.Checked    := False;
      end
      else
      begin
        edtSmtpHost.Text      := ReadString( 'Email', 'Host'   , '') ;
        edtSmtpPort.Text      := ReadString( 'Email', 'Port'   , '') ;
        edtSmtpUser.Text      := ReadString( 'Email', 'User'   , '') ;
        edtSmtpPass.Text      := ReadString( 'Email', 'Pass'   , '') ;
        edtEmailAssunto.Text  := ReadString( 'Email', 'Assunto', '') ;
        cbEmailSSL.Checked    := ReadBool(   'Email', 'SSL'    , False) ;
      end;

      StreamMemo := TMemoryStream.Create;

      ReadBinaryStream( 'Email', 'Mensagem', StreamMemo ) ;

      mmEmailMsg.Lines.LoadFromStream(StreamMemo);
      StreamMemo.Free;

      if ( (Trim(edtEmitCNPJ.Text) = EmptyStr) and (not qryEmitente.IsEmpty) ) then
      begin
        edtEmitCNPJ.Text       := Trim(qryEmitenteCNPJ.AsString);
        edtEmitIE.Text         := Trim(qryEmitenteIE.AsString);
        edtEmitRazao.Text      := Trim(qryEmitenteRZSOC.AsString);
        edtEmitFantasia.Text   := Trim(qryEmitenteNMFANT.AsString);
        edtEmitFone.Text       := Trim(qryEmitenteFONE.AsString);
        edtEmitCEP.Text        := Trim(qryEmitenteCEP.AsString);
        edtEmitLogradouro.Text := Trim(qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString);
        edtEmitNumero.Text     := Trim(qryEmitenteNUMERO_END.AsString);
        edtEmitComp.Text       := Trim(qryEmitenteCOMPLEMENTO.AsString);
        edtEmitBairro.Text     := Trim(qryEmitenteBAI_NOME.AsString);
        edtEmitCodCidade.Text  := Trim(qryEmitenteCID_IBGE.AsString);
        edtEmitCidade.Text     := Trim(qryEmitenteCID_NOME.AsString);
        edtEmitUF.Text         := Trim(qryEmitenteEST_SIGLA.AsString);

        edIdToken.Text       := GetTokenID_NFCe(sCNPJEmitente);
        edToken.Text         := GetToken_NFCe(sCNPJEmitente);
      end;
    end;

    // Definir configurações do RFD - Registro do Fisco CAT 52/07

    with ACBrRFD, ConfigACBr  do
    begin
      DirRFD := ExtractFilePath(ParamStr(0)) + Trim(sCNPJEmitente) + '\rfd';

      if Trim(DirECF)    <> EmptyStr then ForceDirectories(DirECF);
      if Trim(DirECFLog) <> EmptyStr then ForceDirectories(DirECFLog);
      if Trim(DirECFMes) <> EmptyStr then ForceDirectories(DirECFMes);
      if Trim(DirRFD)    <> EmptyStr then ForceDirectories(DirRFD);

      SH_COO  := EmptyStr; // Contador de Operação Fiscal
      SH_CNPJ := StrFormatarCnpj(edtEmitCNPJ.Text);
      SH_IE   := edtEmitIE.Text;
      SH_IM   := qryEmitenteIM.AsString;
      SH_RazaoSocial      := edtEmitRazao.Text;
      SH_NomeAplicativo   := GetProductName;
      SH_VersaoAplicativo := GetVersion;
    end;

    with ACBrAAC, IdentPAF, ConfigACBr do
    begin
      Empresa.CNPJ := edtEmitCNPJ.Text;
      Empresa.IE   := edtEmitIE.Text;
      Empresa.IM   := qryEmitenteIM.AsString;
      Empresa.RazaoSocial := edtEmitRazao.Text;
      Empresa.Telefone    := edtEmitFone.Text;
      Empresa.Cep         := edtEmitCEP.Text;
      Empresa.Endereco    := edtEmitLogradouro.Text + ', ' + edtEmitNumero.Text + ' (' + edtEmitBairro.Text + ')';
      Empresa.Cidade      := edtEmitCidade.Text;
      Empresa.Uf          := edtEmitUF.Text;
      Empresa.Email       := qryEmitenteEMAIL.AsString;
    end;

    // Configurações necessárias e Emissão da NFC-e

    with ACBrSAT, Config, ConfigACBr do
    begin
      emit_CNPJ := ConfigACBr.edtEmitCNPJ.Text;
      emit_IE   := ConfigACBr.edtEmitIE.Text;
      emit_IM   := qryEmitenteIM.AsString;
      ide_CNPJ        := ConfigACBr.edtEmitCNPJ.Text;
      ide_numeroCaixa := FileIni.ReadInteger(INI_SECAO_VENDA, INI_KEY_NUMERO_CAIXA, 1);
      ide_tpAmb       := StrToTpAmb(Ok, IntToStr(rgTipoAmb.ItemIndex + 1));
      if (qryEmitenteTIPO_REGIME_NFE.AsInteger = 0) then
        emit_cRegTrib := RTSimplesNacional
      else
        emit_cRegTrib := RTRegimeNormal;

      PastaCFeVenda        := StringReplace(ExtractFilePath(ParamStr(0)) + '\CFe\Venda',        '\\', '\', [rfReplaceAll]);
      PastaCFeCancelamento := StringReplace(ExtractFilePath(ParamStr(0)) + '\CFe\Cancelamento', '\\', '\', [rfReplaceAll]);
    end;

    ACBrSATExtratoESCPOS.SoftwareHouse := RemoveAcentos( GetCompanyName );
    ACBrSATExtratoESCPOS.NumCopias     := FileIni.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_CUPOM_NFISCAL_QTDE, 1);;

    nfcDANFE.Sistema   := RemoveAcentos( GetCompanyName );
    nfcDANFE.Usuario   := RemoveAcentos( GetUserApp );

    nfcDANFE.MarcaImpressora       := TACBrNFeMarcaImpressora(FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_ID', 0));
    nfcDANFE.Device.Porta          := FileINI.ReadString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_DS', 'COM1');
    nfcDANFE.Device.Baud           := 9600;   // StrToInt(cbxVelocidade.Text);
    nfcDANFE.ImprimeEmUmaLinha     := False;  // chkImprimirItem1Linha.Checked;
    nfcDANFE.ImprimeDescAcrescItem := False;  // chkImprimirDescAcresItem.Checked;
    nfcDANFE.IgnorarTagsFormatacao := False;  // chkIgnorarTagsFormatacao.Checked;
    nfcDANFE.NumCopias             := FileIni.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_CUPOM_NFISCAL_QTDE, 1);;

    if FilesExists(ConfigACBr.edtLogoMarca.Text) then
    begin
      ACBrSATExtratoESCPOS.PictureLogo.LoadFromFile(ConfigACBr.edtLogoMarca.Text);
     // nfcDANFE.Logo := ConfigACBr.edtLogoMarca.Text; // -- Esta chamada ao arquivo de logotipo da empresa gera erro na impressão
    end;

  finally
    sFileNFERave   := ExtractFilePath(ParamStr(0)) + FILENAME_NFE_RAVE;
    sFileNFEFast   := ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST;
    sFileNFEEvento := ExtractFilePath(ParamStr(0)) + FILENAME_NFE_EVENTO;

    if ( not FileExists(sFileNFERave) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFERave) + ' não encontrado!' );

    if ( not FileExists(sFileNFEFast) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFEFast) + ' não encontrado!' );

    if ( not FileExists(sFileNFEEvento) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFEEvento) + ' não encontrado!' );

    ACBrNFe.DANFE.Email := qryEmitenteEMAIL.AsString;
    ACBrNFe.DANFE.Site  := qryEmitenteHOME_PAGE.AsString;

    if ACBrNFe.DANFE is TACBrNFeDANFEFR then
    begin
      TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile       := sFileNFEFast;
      TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFileEvento := sFileNFEEvento;
    end;
  end;
end;

procedure TDMNFe.SelecionarCertificado(Sender: TObject);
begin
  {$IFNDEF ACBrNFeOpenSSL}
  ConfigACBr.edtNumSerie.Text := ACBrNFe.Configuracoes.Certificados.SelecionarCertificado;
  {$ENDIF}
end;

procedure TDMNFe.TestarServico(Sender: TObject);
var
  memResp  ,
  memRespWS,
  memInfo : TStringList;
begin
  memResp   := TStringList.Create;
  memRespWS := TStringList.Create;
  memInfo   := TStringList.Create;
  try

    with ConfigACBr, ACBrNFe, memInfo do
    begin

      WebServices.StatusServico.Executar;

      memResp.Add  ( UTF8Encode(WebServices.StatusServico.RetWS) );
      memRespWS.Add( UTF8Encode(WebServices.StatusServico.RetornoWS) );

      LoadXML(memResp, WBResposta);

      Add('');
      Add('Status Serviço para o Emitente ' + StrFormatarCnpj(gUsuarioLogado.Empresa));
      Add('tpAmb : '    + TpAmbToStr(WebServices.StatusServico.tpAmb));
      Add('verAplic : ' + WebServices.StatusServico.verAplic);
      Add('cStat : '    + IntToStr(WebServices.StatusServico.cStat));
      Add('xMotivo : '  + WebServices.StatusServico.xMotivo);
      Add('cUF : '      + IntToStr(WebServices.StatusServico.cUF));
      Add('dhRecbto : ' + DateTimeToStr(WebServices.StatusServico.dhRecbto));
      Add('tMed : '     + IntToStr(WebServices.StatusServico.TMed));
      Add('dhRetorno : '+ DateTimeToStr(WebServices.StatusServico.dhRetorno));
      Add('xObs : '     + WebServices.StatusServico.xObs);
      Add('');

    end;

    ShowInformation( memInfo.Text );
  finally
    memResp.Free;
    memRespWS.Free;
    memInfo.Free;
  end;
end;

procedure TDMNFe.LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);
begin
  MyMemo.SaveToFile( PathWithDelim(ExtractFileDir(application.ExeName))     + 'temp.xml' );
  MyWebBrowser.Navigate( PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml' );
end;

function TDMNFe.ReciboNaoExisteNaVenda(const sRecibo : String) : Boolean;
begin
  Result := (Trim(sRecibo) = EmptyStr);

  if not Result then
    with DMBusiness, qryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select lote_nfe_recibo as recibo from TBVENDAS where lote_nfe_recibo = ' + QuotedStr(sRecibo));
      Open;

      Result := IsEmpty;

      Close;
    end;
end;

function TDMNFe.ReciboNaoExisteNaEntrada(const sRecibo : String) : Boolean;
begin
  Result := (Trim(sRecibo) = EmptyStr);

  if not Result then
    with DMBusiness, qryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select lote_nfe_recibo as recibo from TBCOMPRAS where lote_nfe_recibo = ' + QuotedStr(sRecibo));
      Open;

      Result := IsEmpty;

      Close;
    end;
end;

function TDMNFe.GerarNFeOnLine(const sCNPJEmitente : String) : Boolean;
begin
  if Trim(sCNPJEmitente) = EmptyStr then
    LerConfiguracao(gUsuarioLogado.Empresa)
  else
    LerConfiguracao(sCNPJEmitente);
      
  Result := ( ConfigACBr.rgModoGerarNFe.ItemIndex = 1 );
end;

function TDMNFe.GetInformacaoFisco : String;
var
  sTexto : String;
begin
  sTexto := EmptyStr;

  if qryCalculoImposto.Active then
    sTexto := Trim(qryCalculoImposto.FieldByName('CFOP_INFORMACAO_FISCO').AsString)
  else
  if qryEntradaCalculoImposto.Active then
    sTexto := Trim(qryEntradaCalculoImposto.FieldByName('CFOP_INFORMACAO_FISCO').AsString);

  Result := IfThen(sTexto = EmptyStr, ConfigACBr.edInfoFisco.Text, sTexto );
end;

function TDMNFe.GerarNFeOnLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda: Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
  var Denegada : Boolean; var DenegadaMotivo : String;
  const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
  sErrorMsg   : String;
begin
(*
  IMR - 09/09/2014 :
    Tratamento de excessão para notas fiscal emitidas, mas de forma denegada. Com este bloco de código este função retornará
    TRUE para que o XML da NF-e seja gravada na base de dados e o registro de venda receba a informação de que a NF-e fora
    denegada.
*)
  try

    LerConfiguracao(sCNPJEmitente);

    if ( DelphiIsRunning ) then
      Result := True
    else
      Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    GerarNFEACBr(sCNPJEmitente, iCodigoCliente, sDataHoraSaida, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    iNumeroLote := GetNextID('TBEMPRESA', 'LOTE_NUM_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and LOTE_ANO_NFE = ' + qryEmitenteLOTE_ANO_NFE.AsString);

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

//    GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, EmptyStr);
//
    if ( Result ) then
    begin
      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
      UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
    end;

  except
    On E : Exception do
    begin
      sErrorMsg := E.Message;

      // Diretrizes de tomada de decisão quando a NFe enviada não é aceita

      if ( Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr ) then
        if ReciboNaoExisteNaVenda(ACBrNFe.WebServices.Retorno.Recibo) then
          GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, ACBrNFe.WebServices.Retorno.Recibo);

      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Count = 1 ) then
        Case ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat of
          REJEICAO_NFE_NOTA_DENEGADA:
            begin
              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);

              if GetPermititNFeDenegada(sCNPJEmitente) then
              begin
                Result := True;

                Denegada       := True;
                DenegadaMotivo := 'NF-e denegada por ' + ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo;

                ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
                ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
                ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

                Exit;
              end
              else
              begin
                // Remover Lote da Venda
                GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

                sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                  'Favor gerar NF-e novamente!';
              end;
            end;

          REJEICAO_NFE_DUPLICIDADE:
            begin
              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);

              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                'Favor gerar NF-e novamente!';
            end;

          REJEICAO_NFE_BC_ICMS_ERR, REJEICAO_NFE_TO_ICMS_ERR, REJEICAO_NFE_TO_PROD_ERR:
            begin
              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                'Favor validar dados e NF-e novamente!';
            end;

          else
            sErrorMsg := IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat) + ' - ' +
              ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13#13 +
              'Favor entrar em contato com suporte e apresentar esta mensagem!';
        end;

      ShowError('Erro ao tentar gerar NF-e.' +
        IfThen(Trim(ACBrNFe.WebServices.Retorno.Recibo) = EmptyStr, EmptyStr, #13 + 'Recibo: ' + ACBrNFe.WebServices.Retorno.Recibo) +
        #13#13 + 'GerarNFeOnLineACBr() --> ' + sErrorMsg);

      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeOffLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
  const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEACBr(sCNPJEmitente, iCodigoCliente, sDataHoraSaida, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    Result := True;

    if ( Imprimir ) then
      ACBrNFe.NotasFiscais.Imprimir;
      
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e.' + #13#13 + 'GerarNFeOffLineACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.CancelarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;
var
  FileNameXML ,
  ChaveNFE    : String;
  iNumeroLote : Integer;
  sLOG : TStringList;
begin
  sLOG := TStringList.Create;

  try

    LerConfiguracao(sCNPJEmitente);

    Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    if ( ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao ) then
      if (not ShowConfirm('Cancelamento de NF-e em AMBIENTE DE HOMOLOGAÇÃO não tem validade nenhuma para a SEFA.' + #13#13 +
        'Deseja continuar assim mesmo?', 'Cancelar NF-e')) then
      begin
        Result := False;
        Exit;
      end;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );
    AbrirNFeEmitida( iAnoVenda, iNumVenda );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CANCEL + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

      NotasFiscais.Clear;

      (* Linhas de Cancelamento da NF-e em 09/04/2013
      NotasFiscais.LoadFromFile( FileNameXML );

      Result := Cancelamento( Motivo );
      *)

      // Numero do Lote de Envio
      iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
      if not NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString ) then
        raise Exception.Create('Não foi possível carregar o XML da Nota Fiscal Eletrônica correspondente!' + #13 + FileNameXML);

      // Criar o Cancelamento

      EventoNFe.Evento.Clear;
      EventoNFe.idLote := iNumeroLote;

      with EventoNFe.Evento.Add do
      begin
        //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
        //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

        infEvento.cOrgao     := qryEmitenteEST_COD.AsInteger; // Código IBGE do Estado
        infEvento.chNFe      := qryNFeEmitidaCHAVE.AsString;
        infEvento.CNPJ       := sCNPJEmitente;
        infEvento.dhEvento   := GetDateTimeDB;
        infEvento.tpEvento        := teCancelamento;
        infEvento.detEvento.nProt := qryNFeEmitidaPROTOCOLO.AsString;
        infEvento.detEvento.xJust := Copy(Motivo, 1, 255);
      end;
      
      // Enviar o evento de cancelamento
      if ACBrNFe.EnviarEventoNFe(iNumeroLote) then
      begin
        with ACBrNFe.WebServices.EnvEvento do
        begin
          Result := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e
          
          if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
          begin
            raise Exception.CreateFmt(
              'Ocorreu o seguinte erro ao cancelar a Nota Fiscal Eletrônica:'  + sLineBreak +
              'Código: %d' + sLineBreak +
              'Motivo: %s', [
                EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
                EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
            ]);
          end;

          // Retorno

          sLOG.BeginUpdate;
          sLOG.Clear;
          sLOG.Add('Ambiente  : ' + IntToStr( Ord(ACBrNFe.Configuracoes.WebServices.Ambiente) ));
          sLOG.Add('-');
          sLOG.Add('Evento    : ' + AnsiUpperCase(DESC_LOG_EVENTO_CANCELAR_NFE_SD));
          sLOG.Add('Emitente  : ' + sCNPJEmitente);
          sLOG.Add('Chave NF-e: ' + qryNFeEmitidaCHAVE.AsString);
          sLOG.Add('-');
          sLOG.Add('Data/Hora Evento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));
          sLOG.Add('Número Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
          sLOG.Add('Código Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
          sLOG.Add('Motivo Status   : ' + EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
          sLOG.Add('-');
          sLOG.Add(EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
          sLOG.EndUpdate;

          // Gravar LOG

          with cdsLOG do
          begin
            Open;
            Append;

            cdsLOGUSUARIO.AsString       := GetUserApp;
            cdsLOGDATA_HORA.AsDateTime   := Now;
            cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
            cdsLOGDESCRICAO.AsString     := DESC_LOG_EVENTO_CANCELAR_NFE_SD;
            cdsLOGESPECIFICACAO.AsString := sLOG.Text;

            Post;
            ApplyUpdates;
            CommitTransaction;

          end;
        end;
      end
      else
      begin
        with ACBrNFe.WebServices.EnvEvento do
        begin
          raise Exception.Create(
            'Ocorreram erros ao tentar efetuar o Cancelamento:' + sLineBreak +
            'Lote: '     + IntToStr(EventoRetorno.idLote)  + sLineBreak +
            'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
            'Orgao: '    + IntToStr(EventoRetorno.cOrgao)  + sLineBreak + sLineBreak +
            'Status: '   + IntToStr(EventoRetorno.cStat)   + sLineBreak +
            'Motivo: '   + EventoRetorno.xMotivo
          );
        end;
      end;

    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar cancelar NF-e de Saída.'+ #13#13 + 'CancelarNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

  sLOG.Free;
end;

function TDMNFe.ImprimirDANFEACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
  const IsPDF : Boolean = FALSE) : Boolean;
var
  FileNameXML : String;
begin

  try

    LerConfiguracao(sCNPJEmitente, tipoDANFEFast);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );
    AbrirNFeEmitida( iAnoVenda, iNumVenda );

    if ( IsPDF ) then // Para exportação em envio
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString
    else
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    CorrigirXML_NFe( qryCalculoImposto.FieldByName('XML_NFE').AsWideString, FileNameXML );

    if not FilesExists(FileNameXML) then
      raise Exception.Create(Format('Arquivo %s não encontrado.', [QuotedStr(FileNameXML)]));

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

      NotasFiscais.Clear;
      NotasFiscais.LoadFromString(qryCalculoImposto.FieldByName('XML_NFE').AsWideString);

      if NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
      begin
        WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
        WebServices.ConsultaDPEC.Executar;

        DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
      end;

      if ( IsPDF ) then
      begin
        NotasFiscais.ImprimirPDF;
        ShowInformation('Arquivo Gerado', 'Arquivo XML da NF-e gerado em:' + #13#13 + FileNameXML);
      end
      else
        NotasFiscais.Imprimir;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE da Saída.' + #13#13 + 'ImprimirDANFEACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.UpdateLoteNFe(const sCNPJEmitente : String; const Ano, Numero: Integer);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBEMPRESA Set');
      SQL.Add('    LOTE_ANO_NFE = ' + FormatFloat('####', Ano));
      SQL.Add('  , LOTE_NUM_NFE = ' + FormatFloat('#########', Numero));
      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateLoteNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNumeroNFe(const sCNPJEmitente : String; const Serie, Numero: Integer);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBEMPRESA Set');
      SQL.Add('    SERIE_NFE  = ' + FormatFloat('####', Serie));
      SQL.Add('  , NUMERO_NFE = ' + FormatFloat('#########', Numero));
      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNumeroNFCe(const sCNPJEmitente : String; const Serie, Numero: Integer);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBEMPRESA Set');
      SQL.Add('    SERIE_NFCE  = ' + FormatFloat('####', Serie));
      SQL.Add('  , NUMERO_NFCE = ' + FormatFloat('#########', Numero));
      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNumeroCCe(const sCNPJEmitente : String; const Numero : Integer);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBEMPRESA Set');
      SQL.Add('  CARTA_CORRECAO_NFE = ' + FormatFloat('#########', Numero));
      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.GerarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String;
  const iAnoVenda, iNumVenda : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
var
  cPercentualTributoAprox,
  vTotalTributoAprox     : Currency;
begin
(*
  IMR - 20/09/2014 :
    Inseção de nova TAG na Nota Fiscal referente a IE do destinatário para informa se este é Isento, Contribuinte ou Não-contribuinte de acordo
    com as regras estabelecidas pela SEFA para a versão 3.10 da NF-e.

  IMR - 10/10/2014 :
    Implementação da Lei "Transparência de Impostos" que visa informar ao consumidos o valor e o percentual pago de impostos sobre os itens e
    o total geral da nota fiscal.

  IMR - 31/03/2015 :
    Inclusão da TAG "Ide.finNFe := fnDevolucao" quando a NF-e for de devolução

  IMR - 20/04/2015 :
    Inclusão do bloco de código para verificar se o CFOP da venda corresponde
    a uma operação de devolução. Caso esta situação seja confirmada, a NF-e de
    origem será solicitada.
*)

  try

    LerConfiguracao(sCNPJEmitente);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFe  := GetNextID('TBEMPRESA', 'NUMERO_NFE',   'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFE = '    + qryEmitenteSERIE_NFE.AsString);
    DtHoraEmiss := GetDateTimeDB;

    ACBrNFe.NotasFiscais.Clear;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := iNumeroNFe; // Caso não seja preenchido será gerado um número aleatório pelo componente
      Ide.natOp     := qryCalculoImposto.FieldByName('CFOP_DESCRICAO').AsString;
      Ide.idDest    := TpcnDestinoOperacao( IfThen(Trim(qryEmitenteEST_SIGLA.AsString) = Trim(qryDestinatario.FieldByName('EST_SIGLA').AsString), 0, 1) );

      if ( qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := MODELO_NFE;
      Ide.serie     := iSerieNFe;
      Ide.nNF       := iNumeroNFe;
      Ide.dEmi      := GetDateDB; // StrToDate( FormatDateTime('dd/mm/yyyy', DtHoraEmiss) );
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Versão do seu sistema
      Ide.cUF       := NotaUtil.UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;

      if (qryCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
        Ide.finNFe  := fnDevolucao
      else
        Ide.finNFe  := fnNormal;

      if ( Ide.finNFe  = fnDevolucao ) then
        with Ide.NFref.Add, qryCalculoImposto do
          Case TFormaNFDevolucao(FieldByName('DNFE_FORMA').AsInteger) of
            fdNFeEletronica:
              refNFe := FieldByName('DNFE_CHAVE').AsString; // Nota Fiscal Eletronica

            fdNFeModelo1_1A:
              begin
                RefNF.cUF    := NotaUtil.UFtoCUF(FieldByName('DNFE_UF').AsString); // |
                RefNF.AAMM   := FieldByName('DNFE_COMPETENCIA').AsString;          // |
                RefNF.CNPJ   := FieldByName('DNFE_CNPJ_CPF').AsString;             // |
                RefNF.modelo := FieldByName('DNFE_MODELO').AsInteger;              // |- NF Modelo 1/1A
                RefNF.serie  := FieldByName('DNFE_SERIE').AsInteger;               // |  * O modelo padrão é 1
                RefNF.nNF    := FieldByName('DNFE_NUMERO').AsInteger;              // |
              end;

            fdNFProdutorRural:
              begin
                RefNFP.cUF     := NotaUtil.UFtoCUF(FieldByName('DNFE_UF').AsString);       // |
                RefNFP.AAMM    := FieldByName('DNFE_COMPETENCIA').AsString;                // |
                RefNFP.CNPJCPF := FieldByName('DNFE_CNPJ_CPF').AsString;                   // |
                RefNFP.IE      := FieldByName('DNFE_IE').AsString;                         // |- NF produtor Rural
                RefNFP.modelo  := FormatFloat('00', FieldByName('DNFE_MODELO').AsInteger); // | * O modelo padrão é 04
                RefNFP.serie   := FieldByName('DNFE_SERIE').AsInteger;                     // |
                RefNFP.nNF     := FieldByName('DNFE_NUMERO').AsInteger;                    // |
              end;

            fdCupomFiscal:
              begin
                RefECF.modelo  := TpcnECFModRef(FieldByName('DECF_MODELO').AsInteger); // | (ECFModRefVazio, ECFModRef2B, ECFModRef2C, ECFModRef2D)
                RefECF.nECF    := FieldByName('DECF_NUMERO').AsString;                 // |- Cupom Fiscal
                RefECF.nCOO    := FieldByName('DECF_COO').AsString;                    // |
              end;
          end;

      if GetSolicitaDHSaidaNFe(sCNPJEmitente) then
        if (Trim(sDataHoraSaida) <> EmptyStr) then
        begin
          Ide.dSaiEnt := StrToDateTime( FormatDateTime('dd/mm/yyyy', StrToDateTime(sDataHoraSaida)) );
          Ide.hSaiEnt := StrToDateTime( FormatDateTime('hh:mm:ss', StrToDateTime(sDataHoraSaida)) );
        end;

  //     Ide.dhCont := date;
  //     Ide.xJust  := 'Justificativa Contingencia';

  //Para NFe referenciada use os campos abaixo
  {     with Ide.NFref.Add do
        begin
          refNFe       := ''; //NFe Eletronica

          RefNF.cUF    := 0;  // |
          RefNF.AAMM   := ''; // |
          RefNF.CNPJ   := ''; // |
          RefNF.modelo := 1;  // |- NFe Modelo 1/1A
          RefNF.serie  := 1;  // |
          RefNF.nNF    := 0;  // |

          RefNFP.cUF     := 0;  // |
          RefNFP.AAMM    := ''; // |
          RefNFP.CNPJCPF := ''; // |
          RefNFP.IE      := ''; // |- NF produtor Rural
          RefNFP.modelo  := ''; // |
          RefNFP.serie   := 1;  // |
          RefNFP.nNF     := 0;  // |

          RefECF.modelo  := ECFModRef2B; // |
          RefECF.nECF    := '';          // |- Cupom Fiscal
          RefECF.nCOO    := '';          // |
        end;
  }
      Emit.CNPJCPF := qryEmitenteCNPJ.AsString;
      Emit.IE      := Trim(qryEmitenteIE.AsString);
      Emit.CNAE    := Trim(qryEmitenteCNAE.AsString);  // C20 - CNAE fiscal Este campo deve ser informado quando o campo NFe.Emit.IM for informado.
      Emit.xNome   := qryEmitenteRZSOC.AsString;
      Emit.xFant   := qryEmitenteNMFANT.AsString;

      case qryEmitenteTIPO_REGIME_NFE.AsInteger of
        0 : Emit.CRT := crtSimplesNacional;
        1 : Emit.CRT := crtSimplesExcessoReceita;
        2 : Emit.CRT := crtRegimeNormal;
      end;

      Emit.EnderEmit.fone    := qryEmitenteFONE.AsString;
      Emit.EnderEmit.CEP     := StrToInt( qryEmitenteCEP.AsString );
      Emit.EnderEmit.xLgr    := Trim( qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString );
      Emit.EnderEmit.nro     := qryEmitenteNUMERO_END.AsString;
      Emit.EnderEmit.xCpl    := qryEmitenteCOMPLEMENTO.AsString + '.';
      Emit.EnderEmit.xBairro := qryEmitenteBAI_NOME.AsString;
      Emit.EnderEmit.cMun    := qryEmitenteCID_IBGE.AsInteger;
      Emit.EnderEmit.xMun    := qryEmitenteCID_NOME.AsString;
      Emit.EnderEmit.UF      := qryEmitenteEST_SIGLA.AsString;
      Emit.EnderEmit.cPais   := qryEmitentePAIS_ID.AsInteger;
      Emit.EnderEmit.xPais   := qryEmitentePAIS_NOME.AsString;

      Emit.IEST              := '';
      Emit.IM                := ''; // Preencher no caso de existir serviços na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se é permitido
                                    // a inclusão de serviços na NFe

  //Para NFe Avulsa preencha os campos abaixo
  {      Avulsa.CNPJ    := '';
        Avulsa.xOrgao  := '';
        Avulsa.matr    := '';
        Avulsa.xAgente := '';
        Avulsa.fone    := '';
        Avulsa.UF      := '';
        Avulsa.nDAR    := '';
        Avulsa.dEmi    := now;
        Avulsa.vDAR    := 0;
        Avulsa.repEmi  := '';
        Avulsa.dPag    := now;             }

      Dest.CNPJCPF := qryDestinatario.FieldByName('CNPJ').AsString; // FormatFloat('00000000000000', qryDestinatarioCNPJ.AsInteger);
      Dest.xNome   := qryDestinatario.FieldByName('NOME').AsString; // + IfThen(GetImprimirCodClienteNFe(sCNPJEmitente), ' ' + FormatFloat('##00000', qryDestinatarioCODIGO.AsInteger));
      Dest.Email   := Trim(AnsiLowerCase(qryDestinatario.FieldByName('EMAIL').AsString));

      if ( qryDestinatario.FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
      begin
        if (AnsiUpperCase(Trim(qryDestinatario.FieldByName('INSCEST').AsString)) = 'ISENTO') or (Trim(qryDestinatario.FieldByName('INSCEST').AsString) = EmptyStr) then
          Dest.indIEDest     := inIsento
        else
          Dest.indIEDest     := inContribuinte;

        Dest.IE              := Trim(qryDestinatario.FieldByName('INSCEST').AsString);
        Dest.ISUF            := EmptyStr;
      end
      else
      begin
        Dest.indIEDest       := inNaoContribuinte;
        Dest.IE              := EmptyStr;
        Dest.ISUF            := EmptyStr;
      end;

      Dest.EnderDest.Fone    := qryDestinatario.FieldByName('FONE').AsString;
      Dest.EnderDest.CEP     := qryDestinatario.FieldByName('CEP').AsInteger;
      Dest.EnderDest.xLgr    := Trim( qryDestinatario.FieldByName('TLG_SIGLA').AsString + ' ' + qryDestinatario.FieldByName('LOG_NOME').AsString );
      Dest.EnderDest.nro     := qryDestinatario.FieldByName('NUMERO_END').AsString;
      Dest.EnderDest.xCpl    := qryDestinatario.FieldByName('COMPLEMENTO').AsString;
      Dest.EnderDest.xBairro := qryDestinatario.FieldByName('BAI_NOME').AsString;
      Dest.EnderDest.cMun    := qryDestinatario.FieldByName('CID_IBGE').AsInteger;
      Dest.EnderDest.xMun    := qryDestinatario.FieldByName('CID_NOME').AsString;
      Dest.EnderDest.UF      := qryDestinatario.FieldByName('EST_SIGLA').AsString;
      Dest.EnderDest.cPais   := qryDestinatario.FieldByName('PAIS_ID').AsInteger;  // 1058;
      Dest.EnderDest.xPais   := qryDestinatario.FieldByName('PAIS_NOME').AsString; // 'BRASIL';

  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

      // Adicionando Produtos

      vTotalTributoAprox := 0.0;

      qryDadosProduto.First;

      while not qryDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // Número sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryDadosProduto.FieldByName('CODPROD').AsString;

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString
          else
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI').AsString + ' ' + qryDadosProduto.FieldByName('ANO_FAB_MODELO_VEICULO').AsString;

          Prod.NCM      := qryDadosProduto.FieldByName('NCM_SH').AsString;            // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.EXTIPI   := '';
          Prod.CFOP     := qryDadosProduto.FieldByName('CFOP_COD').AsString;

          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a função "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
            Prod.cEAN   := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
          else
            Prod.cEAN   := EmptyStr;

          Prod.uCom     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qCom     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency   // I10a  Valor Unitário de comercialização
          else
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT').AsCurrency;           // I10a  Valor Unitário de comercialização

          Prod.vProd    := qryDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Serviços

          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a função "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
            Prod.cEANTrib := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
          else
            Prod.cEANTrib := EmptyStr;

          Prod.uTrib     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qTrib     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency  // I14a  Valor Unitário de tributação
          else
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT').AsCurrency;          // I14a  Valor Unitário de tributação

(* EXEMPLO *)
          // NFe.Det[i].Prod.uCom    := 'CX';                                                   = 'UN'
          // NFe.Det[i].Prod.qCom    :=    2;   Vendidas 2 caixas ( com 10 unidades cada )      = 20
          // NFe.Det[i].Prod.vUnCom  :=   50;   R$ 50,00 cada caixa                             = 50,00 / 10 = 5,00
          // NFe.Det[i].Prod.vProd   :=  100;   R$ 100,00 Valor dos produtos                    = 20 * 5,00 = 100,00
          // NFe.Det[i].Prod.uTrib   := 'UN';                                                   = 'UN'
          // NFe.Det[i].Prod.qTrib   :=   20;   2 caixas X 10 unidades por caixa = 20 unidades  = 20
          // NFe.Det[i].Prod.vUnTrib :=    5;   R$ 100,00 / 20 unidades = R$ 5,00 cada unidade  = 100,00 / 20 = 5,00

          Prod.vFrete    := 0;                                        // I15 - Valor Total do Frete
          Prod.vSeg      := 0;                                        // I16 - Valor Total do Seguro
          Prod.vDesc     := qryDadosProduto.FieldByName('TOTAL_DESCONTO').AsCurrency; // I17 - Valor do Desconto

          // Informação Adicional do Produto

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            if ( Trim(qryDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr ) then
              infAdProd    := 'Ref.: ' + qryDadosProduto.FieldByName('REFERENCIA').AsString
            else
              infAdProd    := EmptyStr
          else
            infAdProd      := 'Cor: '         + qryDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString + #13 +
                              'Placa: '       + qryDadosProduto.FieldByName('REFERENCIA').AsString      + #13 +
                              'Renavam: '     + qryDadosProduto.FieldByName('RENAVAM_VEICULO').AsString + #13 +
                              'Chassi: '      + qryDadosProduto.FieldByName('CHASSI_VEICULO').AsString  + #13 +
                              'Combustivel: ' + qryDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString;

  //Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add

  {         with Prod.DI.Add do
            begin
              nDi         := '';
              dDi         := now;
              xLocDesemb  := '';
              UFDesemb    := '';
              dDesemb     := now;
              cExportador := '';

              with adi.Add do
               begin
                 nAdicao     := 1;
                 nSeqAdi     := 1;
                 cFabricante := '';
                 vDescDI     := 0;
               end;
            end;
  }

  //Campos para venda de veículos novos

          if ( (GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID) and (qryDadosProduto.FieldByName('PRODUTO_NOVO').AsInteger = 1) ) then
          begin

            with Prod.veicProd do
              begin
                tpOP     := toVendaConcessionaria; // J02 - Tipo da operação
                                                   //    (1) = toVendaConcessionaria
                                                   //    (2) = toFaturamentoDireto
                                                   //    (3) = toVendaDireta
                                                   //    (0) = toOutros
                chassi   := qryDadosProduto.FieldByName('CHASSI_VEICULO').AsString;        // J03 - Chassi do veículo
                cCor     := qryDadosProduto.FieldByName('COR_VEICULO').AsString;           // J04 - Cor
                xCor     := qryDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString; // J05 - Descrição da Cor
                pot      := ''; // J06 - Potência Motor
                Cilin    := '';
                pesoL    := ''; // J08 - Peso Líquido
                pesoB    := ''; // J09 - Peso Bruto
                nSerie   := ''; // J10 - Serial (série)
                tpComb   := qryDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString; // J11 - Tipo de combustível
                nMotor   := ''; // J12 - Número de Motor
                CMT      := '';
                dist     := '';        // J14 - Distância entre eixos
//                RENAVAM  := '';        // J15 - RENAVAM            (Não informar a TAG na exportação)
                anoMod   := qryDadosProduto.FieldByName('ANO_MODELO_VEICULO').AsInteger;         // J16 - Ano Modelo de Fabricação
                anoFab   := qryDadosProduto.FieldByName('ANO_FABRICACAO_VEICULO').AsInteger;     // J17 - Ano de Fabricação
                tpPint   := '';        // J18 - Tipo de Pintura
                tpVeic   := StrToIntDef(qryDadosProduto.FieldByName('TIPO_VEICULO').AsString, 0); // J19 - Tipo de Veículo    (Utilizar Tabela RENAVAM)
                espVeic  := 0;         // J20 - Espécie de Veículo (Utilizar Tabela RENAVAM)
                VIN      := '';        // J21 - Condição do VIN
                condVeic := cvAcabado; // J22 - Condição do Veículo (1 - Acabado; 2 - Inacabado; 3 - Semi-acabado)
                cMod     := '';        // J23 - Código Marca Modelo (Utilizar Tabela RENAVAM)
              end;

          end;

{
    property tpOP: TpcnTipoOperacao read FtpOP write FtpOP;
    property chassi: string read Fchassi write Fchassi;
    property cCor: string read FcCor write FcCor;
    property xCor: string read FxCor write FxCor;
    property pot: string read Fpot write Fpot;
    property Cilin: string read FCilin write FCilin;
    property pesoL: string read FpesoL write FpesoL;
    property pesoB: string read FpesoB write FpesoB;
    property nSerie: string read FnSerie write FnSerie;
    property tpComb: string read FtpComb write FtpComb;
    property nMotor: string read FnMotor write FnMotor;
    property CMT: string read FCMT write FCMT;
    property dist: string read Fdist write Fdist;
    //property RENAVAM: string read FRENAVAM write FRENAVAM;
    property anoMod: integer read FanoMod write FanoMod;
    property anoFab: integer read FanoFab write FanoFab;
    property tpPint: string read FtpPint write FtpPint;
    property tpVeic: integer read FtpVeic write FtpVeic;
    property espVeic: integer read FespVeic write FespVeic;
    property VIN: string read FVIN write FVIN;
    property condVeic: TpcnCondicaoVeiculo read FcondVeic write FcondVeic;
    property cMod: string read FcMod write FcMod;

    property cCorDENATRAN: string read FcCorDENATRAN write FcCorDENATRAN;
    property lota: integer read Flota write Flota;
    property tpRest: integer read FtpRest write FtpRest;
}

  //Campos específicos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos específicos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos específicos para venda de combustível(distribuidoras)
  {         with Prod.comb do
            begin
              cProdANP := 0;
              CODIF    := '';
              qTemp    := 0;
              UFcons   := '';

              CIDE.qBCprod   := 0 ;
              CIDE.vAliqProd := 0 ;
              CIDE.vCIDE     := 0 ;

              ICMS.vBCICMS   := 0 ;
              ICMS.vICMS     := 0 ;
              ICMS.vBCICMSST := 0 ;
              ICMS.vICMSST   := 0 ;

              ICMSInter.vBCICMSSTDest := 0 ;
              ICMSInter.vICMSSTDest   := 0 ;

              ICMSCons.vBCICMSSTCons := 0 ;
              ICMSCons.vICMSSTCons   := 0 ;
              ICMSCons.UFcons        := '' ;
            end;}

          with Imposto do
          begin
            with ICMS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                // csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900

                Case qryDadosProduto.FieldByName('CSOSN').AsInteger of
                  101 : CSOSN := csosn101;
                  102 : CSOSN := csosn102;
                  103 : CSOSN := csosn103;
                  201 : CSOSN := csosn201;
                  202 : CSOSN := csosn202;
                  203 : CSOSN := csosn203;
                  300 : CSOSN := csosn300;
                  400 : CSOSN := csosn400;
                  500 : CSOSN := csosn500;
                  else
                    CSOSN := csosn900;
                end;

                pCredSN     := qryDadosProduto.FieldByName('ALIQUOTA_CSOSN').AsCurrency;
                vCredICMSSN := qryDadosProduto.FieldByName('PFINAL').AsCurrency * pCredSN / 100;

              end
              else
              begin

                Case StrToInt(Copy(qryDadosProduto.FieldByName('CST').AsString, 2, 2)) of
                   0 : CST := cst00;
                  10 : CST := cst10;
                  20 : CST := cst20;
                  30 : CST := cst30;
                  40 : CST := cst40;
                  41 : CST := cst41;
                  50 : CST := cst50;
                  51 : CST := cst51;
                  60 : CST := cst60;
                  70 : CST := cst70;
                  else
                    CST := cst90;
                end;

                ICMS.modBC := dbiValorOperacao;

                if (qryCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
                  ICMS.pRedBC := 0.0
                else
                if (qryDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency <= 0) then
                  ICMS.pRedBC := 0.0
                else
                  ICMS.pRedBC := (100.0 - qryDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency); // qryDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;

                if (ICMS.pRedBC > 0) or (qryDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency > 0) then
                  ICMS.vBC := qryDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency
                else
                  ICMS.vBC := qryDadosProduto.FieldByName('PFINAL').AsCurrency;

                ICMS.pICMS := qryDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
                ICMS.vICMS := ICMS.vBC * ICMS.pICMS / 100.0;

              end;

              ICMS.orig    := TpcnOrigemMercadoria( StrToInt(Copy(qryDadosProduto.FieldByName('CST').AsString, 1, 1)) );
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;

            end;

            with PIS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST      := pis99;
                PIS.vBC  := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstPis(qryDadosProduto.FieldByName('CST_PIS_INDICE_ACBR').AsInteger);

                if ( CST = pis99 ) then
                begin
                  PIS.vBC  := 0;
                  PIS.pPIS := 0;
                  PIS.vPIS := 0;
                end
                else
                begin
                  PIS.vBC  := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
                  PIS.pPIS := qryDadosProduto.FieldByName('ALIQUOTA_PIS').AsCurrency;
                  PIS.vPIS := PIS.vBC * PIS.pPIS / 100;
                end;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end;
            end;

            with COFINS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST            := cof99;
                COFINS.vBC     := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstCofins(qryDadosProduto.FieldByName('CST_COFINS_INDICE_ACBR').AsInteger);

                if ( CST = cof99 ) then
                begin
                  COFINS.vBC     := 0;
                  COFINS.pCOFINS := 0;
                  COFINS.vCOFINS := 0;
                end
                else
                begin
                  COFINS.vBC     := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
                  COFINS.pCOFINS := qryDadosProduto.FieldByName('ALIQUOTA_COFINS').AsCurrency;
                  COFINS.vCOFINS := COFINS.vBC * COFINS.pCOFINS / 100;
                end;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end;
            end;

  {
            with IPI do
            begin
              CST      := ipi99 ;
              clEnq    := '999';
              CNPJProd := '';
              cSelo    := '';
              qSelo    := 0;
              cEnq     := '';

              vBC    := qryDadosProdutoPUNIT.AsCurrency;
              qUnid  := 0;
              vUnid  := 0;
              pIPI   := 0; // Percentual IPI
              vIPI   := 0; // Valor IPI
            end;

              with II do
               begin
                 vBc      := 0;
                 vDespAdu := 0;
                 vII      := 0;
                 vIOF     := 0;
               end;

              with PISST do
               begin
                 vBc       := 0;
                 pPis      := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vPIS      := 0;
               end;

              with COFINSST do
               begin
                 vBC       := 0;
                 pCOFINS   := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vCOFINS   := 0;
               end;
  }
  //Grupo para serviços
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela disponível
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}

            // Lei da Transparência de Impostos

            if ( Trim(Prod.NCM) <> EmptyStr ) then
            begin
              cPercentualTributoAprox := qryDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;

              if ( cPercentualTributoAprox > 0.0 ) then
              begin
                vTotTrib  := Prod.vProd * cPercentualTributoAprox / 100;
                infAdProd := infAdProd +
                  Trim(IfThen(Trim(infAdProd) = EmptyStr, '', #13) + Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                    FormatFloat(',0.00', vTotTrib),
                    FormatFloat(',0.##"%"', cPercentualTributoAprox)
                  ]));
                  
                vTotalTributoAprox := vTotalTributoAprox + vTotTrib;
              end;
            end;

          end;
        end ;

        qryDadosProduto.Next;
      end;

      Total.ICMSTot.vBC      := qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency;
      Total.ICMSTot.vICMS    := qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency;
      Total.ICMSTot.vBCST    := qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vST      := qryCalculoImposto.FieldByName('NFE_VALOR_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vProd    := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency;
      Total.ICMSTot.vFrete   := qryCalculoImposto.FieldByName('NFE_VALOR_FRETE').AsCurrency;
      Total.ICMSTot.vSeg     := qryCalculoImposto.FieldByName('NFE_VALOR_SEGURO').AsCurrency;
      Total.ICMSTot.vDesc    := qryCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency;
      Total.ICMSTot.vII      := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_II').AsCurrency;
      Total.ICMSTot.vIPI     := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_IPI').AsCurrency;
      Total.ICMSTot.vPIS     := qryCalculoImposto.FieldByName('NFE_VALOR_PIS').AsCurrency;
      Total.ICMSTot.vCOFINS  := qryCalculoImposto.FieldByName('NFE_VALOR_COFINS').AsCurrency;
      Total.ICMSTot.vOutro   := qryCalculoImposto.FieldByName('NFE_VALOR_OUTROS').AsCurrency;
      Total.ICMSTot.vNF      := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;

      if ( vTotalTributoAprox > 0.0 ) then
        Total.ICMSTot.vTotTrib := vTotalTributoAprox;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

  {      Total.retTrib.vRetPIS    := 0;
        Total.retTrib.vRetCOFINS := 0;
        Total.retTrib.vRetCSLL   := 0;
        Total.retTrib.vBCIRRF    := 0;
        Total.retTrib.vIRRF      := 0;
        Total.retTrib.vBCRetPrev := 0;
        Total.retTrib.vRetPrev   := 0;}

      // Adicionando Dados da Transportadora (Modalidades de Frete: mfContaEmitente, mfContaDestinatario, mfContaTerceiros, mfSemFrete)
  {
      Transp.modFrete            := mfSemFrete; // X02 - Modalidade do frete
                                                //         (0) = mfContaEmitente     – por conta do emitente;
                                                //         (1) = mfContaDestinatario – por conta do destinatário;
                                                //         (2) = mfContaTerceiros    – por conta do terceiros;
                                                //         (3) = mfSemFrete          – sem frete;
                                                //       TAG de grupo Transportador - <transporta> - Ocorrência 0-3
  }
      Transp.modFrete            := TpcnModalidadeFrete( qryCalculoImposto.FieldByName('NFE_MODALIDADE_FRETE').AsInteger );

      Transp.Transporta.CNPJCPF  := qryCalculoImposto.FieldByName('NFE_TRANSPORTADORA_CNPJ').AsString;
      Transp.Transporta.xNome    := qryCalculoImposto.FieldByName('NFE_TRANSPORTADORA_NOME').AsString;
      Transp.Transporta.IE       := qryCalculoImposto.FieldByName('NFE_TRANSPORTADORA_IEST').AsString;
      Transp.Transporta.xEnder   := qryCalculoImposto.FieldByName('NFE_TRANSPORTADORA_ENDER').AsString;
      Transp.Transporta.xMun     := qryCalculoImposto.FieldByName('NFE_TRANSPORTADORA_CIDADE').AsString;
      Transp.Transporta.UF       := qryCalculoImposto.FieldByName('NFE_TRANSPORTADORA_UF').AsString;

  {      Transp.retTransp.vServ    := 0;
        Transp.retTransp.vBCRet   := 0;
        Transp.retTransp.pICMSRet := 0;
        Transp.retTransp.vICMSRet := 0;
        Transp.retTransp.CFOP     := '';
        Transp.retTransp.cMunFG   := 0;         }

      Transp.veicTransp.placa := qryCalculoImposto.FieldByName('NFE_PLACA_VEICULO').AsString;
      Transp.veicTransp.UF    := qryCalculoImposto.FieldByName('NFE_PLACA_UF').AsString;
      Transp.veicTransp.RNTC  := qryCalculoImposto.FieldByName('NFE_PLACA_RNTC').AsString; // RNTC - Registros Nacional de Transportes de Carga (Identificação do vagão quando o transporte é Trem)

  //Dados do Reboque
  {      with Transp.Reboque.Add do
         begin
           placa := '';
           UF    := '';
           RNTC  := '';
         end;}

      // Adicionando Dados de Volumes a Transportar

      if ( Transp.modFrete in [mfContaEmitente, mfContaDestinatario, mfContaTerceiros] ) then
      begin
        qryDadosVolume.First;

        while not qryDadosVolume.Eof do
        begin
          with Transp.Vol.Add do
          begin
            qVol  := qryDadosVolume.FieldByName('QUANTIDADE').AsInteger;
            esp   := qryDadosVolume.FieldByName('ESPECIE').AsString;
            marca := qryDadosVolume.FieldByName('MARCA').AsString;
            nVol  := qryDadosVolume.FieldByName('NUMERO').AsString;
            pesoB := qryDadosVolume.FieldByName('PESO_BRUTO').AsCurrency;
            pesoL := qryDadosVolume.FieldByName('PESO_LIQUIDO').AsCurrency;

            //Lacres do volume. Pode ser adicionado vários
            //Lacres.Add.nLacre := '';
          end;

          qryDadosVolume.Next;
        end;
        
      end;

      if ( Ide.finNFe = fnNormal ) then
      begin

        // Dados da Fatura

        Cobr.Fat.nFat  := FormatFloat('0000', qryCalculoImposto.FieldByName('ANO').AsInteger) + '/' + FormatFloat('0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger);
        Cobr.Fat.vOrig := qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency;
        Cobr.Fat.vDesc := qryCalculoImposto.FieldByName('DESCONTO').AsCurrency ;
        Cobr.Fat.vLiq  := qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency ;

        // Dados da(s) Duplicata(s)

        if ( qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
        begin
          qryDuplicatas.First;
          while not qryDuplicatas.Eof do
          begin
            with Cobr.Dup.Add do
            begin
              nDup  := FormatFloat('0000', qryDuplicatas.FieldByName('ANOLANC').AsInteger) + '/' +
                FormatFloat('0000000', qryDuplicatas.FieldByName('NUMLANC').AsInteger);
              dVenc := qryDuplicatas.FieldByName('DTVENC').AsDateTime;
              vDup  := qryDuplicatas.FieldByName('VALORREC').AsCurrency;
            end;

            qryDuplicatas.Next;
          end;
        end;

      end;

      InfAdic.infCpl     := ' * * * ' + #13 +
                            'Venda: ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger)  +
                            ' - Forma/Cond. Pgto.: ' + qryCalculoImposto.FieldByName('LISTA_FORMA_PAGO').AsString + '/' + qryCalculoImposto.FieldByName('LISTA_COND_PAGO_FULL').AsString + ' * * * ' + #13 +
                            'Vendedor: ' + qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString + ' * * * ' + #13 +
                            'Observações: ' + qryCalculoImposto.FieldByName('OBS').AsString +
                            IfThen(vTotalTributoAprox = 0, EmptyStr, #13 + Format('* Valor Total Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                              FormatFloat(',0.00', Total.ICMSTot.vTotTrib),
                              FormatFloat(',0.##"%"', Total.ICMSTot.vTotTrib / Total.ICMSTot.vNF * 100)]));

      InfAdic.infAdFisco := 'Info. Fisco: ' + GetInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obserações da venda: ' + qryCalculoImportoOBS.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger) +
                  ' - Forma/Cond. Pgto.: ' + qryCalculoImportoFORMAPAG.AsString + '/' + qryCalculoImportoCOND_DESCRICAO_FULL.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString;
      end;

      with InfAdic.obsFisco.Add do
      begin
        xCampo := 'ObsFisco';
        xTexto := GetInformacaoFisco;
      end;

  //Processo referenciado
       with InfAdic.procRef.Add do
         begin
           nProc := '';
           indProc := ipSEFAZ;
         end;                 }

      exporta.UFembarq   := '';
      exporta.xLocEmbarq := '';

      compra.xNEmp := '';
      compra.xPed  := '';
      compra.xCont := '';

      ACBrNFe.NotasFiscais.GerarNFe;

      if ( not DelphiIsRunning ) then
        ACBrNFe.NotasFiscais.Assinar;

      if GetSolicitaDHSaidaNFe( sCNPJEmitente ) then
        if not ACBrNFe.NotasFiscais.ValidaRegrasdeNegocios then
          raise Exception.Create( ACBrNFe.NotasFiscais.Items[0].RegrasdeNegocios );

      if ( not DelphiIsRunning ) then
        ACBrNFe.NotasFiscais.Valida;

      ACBrNFe.NotasFiscais.Items[0].SaveToFile( EmptyStr );

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;

    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NF-e de Saída.' + #13#13 + 'GerarNFEACBr() --> ' + e.Message);
  end;

end;

procedure TDMNFe.FrECFPoolerGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = 'CEPEmissor' ) then
    Value := StrFormatarCEP(qryEmitenteCEP.AsString);

  if ( VarName = 'CNPJEmissor' ) then
    Value := StrFormatarCnpj(qryEmitenteCNPJ.AsString);

  if ( VarName = 'FONEEmissor' ) then
    Value := StrFormatarFONE(qryEmitenteFONE.AsString);

  if ( VarName = 'CNPJCliente' ) then
    if ( qryDestinatario.FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
      Value := StrFormatarCnpj(qryDestinatario.FieldByName('CNPJ').AsString)
    else
      Value := StrFormatarCpf(qryDestinatario.FieldByName('CNPJ').AsString);
end;

procedure TDMNFe.GerarTabela_CST_PIS;
var
  I : Integer;
  sCST_PIS_ID : Array[0..32] of String;
const
  CST_PIS_DESC : Array[0..32] of String = (
      'Operação Tributável com Alíquota Básica'
    , 'Operação Tributável com Alíquota Diferenciada'
    , 'Operação Tributável com Alíquota por Unidade de Medida de Produto'
    , 'Operação Tributável Monofásica - Revenda a Alíquota Zero'
    , 'Operação Tributável por Substituição Tributária'
    , 'Operação Tributável a Alíquota Zero'
    , 'Operação Isenta da Contribuição'
    , 'Operação sem Incidênc ia da Contribuição'
    , 'Operação com Suspensão da Contribuição'
    , 'Outras Operações de Saída'
    , 'Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno'
    , 'Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno'
    , 'Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação'
    , 'Crédito Presumido - Outras Operações'
    , 'Operação de Aquisição sem Direito a Crédito'
    , 'Operação de Aquisição com Isenção'
    , 'Operação de Aquisição com Suspensão'
    , 'Operação de Aquisição a Alíquota Zero'
    , 'Operação de Aquisição sem Incidência da Contribuição'
    , 'Operação de Aquisição por Substituição Tributária'
    , 'Outras Operações de Entrada'
    , 'Outras Operações'
  );
begin
  try
    sCST_PIS_ID[0]  := '01'; // Operação Tributável com Alíquota Básica
    sCST_PIS_ID[1]  := '02'; // Operação Tributável com Alíquota Diferenciada
    sCST_PIS_ID[2]  := '03'; // Operação Tributável com Alíquota por Unidade de Medida de Produto
    sCST_PIS_ID[3]  := '04'; // Operação Tributável Monofásica - Revenda a Alíquota Zero
    sCST_PIS_ID[4]  := '05'; // Operação Tributável por Substituição Tributária
    sCST_PIS_ID[5]  := '06'; // Operação Tributável a Alíquota Zero
    sCST_PIS_ID[6]  := '07'; // Operação Isenta da Contribuição
    sCST_PIS_ID[7]  := '08'; // Operação sem Incidênc ia da Contribuição
    sCST_PIS_ID[8]  := '09'; // Operação com Suspensão da Contribuição
    sCST_PIS_ID[9]  := '49'; // Outras Operações de Saída
    sCST_PIS_ID[10] := '50'; // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno
    sCST_PIS_ID[11] := '51'; // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Não Tributada no Mercado Interno
    sCST_PIS_ID[12] := '52'; // Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação
    sCST_PIS_ID[13] := '53'; // Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno
    sCST_PIS_ID[14] := '54'; // Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação
    sCST_PIS_ID[15] := '55'; // Operação com Direito a Crédito - Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação
    sCST_PIS_ID[16] := '56'; // Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno' e de Exportação
    sCST_PIS_ID[17] := '60'; // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno
    sCST_PIS_ID[18] := '61'; // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno
    sCST_PIS_ID[19] := '62'; // Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação
    sCST_PIS_ID[20] := '63'; // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno
    sCST_PIS_ID[21] := '64'; // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação
    sCST_PIS_ID[22] := '65'; // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação
    sCST_PIS_ID[23] := '66'; // Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno' e de Exportação
    sCST_PIS_ID[24] := '67'; // Crédito Presumido - Outras Operações
    sCST_PIS_ID[25] := '70'; // Operação de Aquisição sem Direito a Crédito
    sCST_PIS_ID[26] := '71'; // Operação de Aquisição com Isenção
    sCST_PIS_ID[27] := '72'; // Operação de Aquisição com Suspensão
    sCST_PIS_ID[28] := '73'; // Operação de Aquisição a Alíquota Zero
    sCST_PIS_ID[29] := '74'; // Operação de Aquisição sem Incidência da Contribuição
    sCST_PIS_ID[30] := '75'; // Operação de Aquisição por Substituição Tributária
    sCST_PIS_ID[31] := '98'; // Outras Operações de Entrada
    sCST_PIS_ID[32] := '99'; // Outras Operações

    for I := Low(sCST_PIS_ID) to High(sCST_PIS_ID) do
      with IBSQL do
      begin
        SQL.Clear;
        SQL.Add( 'Execute Procedure SET_CST_PIS ('     );
        SQL.Add( '    ' + QuotedStr(sCST_PIS_ID[I])    );
        SQL.Add( '  , ' + QuotedStr(CST_PIS_DESC[I])   );
        SQL.Add( '  , ' + IntToStr(Ord(TpcnCstIpi(I))) );
        SQL.Add( ')' );

        ExecQuery;
        CommitTransaction;
      end;
  except
    On E : Exception do
      raise Exception.Create('Erro no procedimento GerarTabela_CST_PIS - ' + E.Message);
  end;
end;

procedure TDMNFe.GerarTabela_CST_COFINS;
var
  I : Integer;
const
  sCST_PIS_ID : Array[0..32] of String = (
      '01'
    , '02'
    , '03'
    , '04'
    , '05'
    , '06'
    , '07'
    , '08'
    , '09'
    , '49'
    , '50'
    , '51'
    , '52'
    , '53'
    , '54'
    , '55'
    , '56'
    , '60'
    , '61'
    , '62'
    , '63'
    , '64'
    , '65'
    , '66'
    , '67'
    , '70'
    , '71'
    , '72'
    , '73'
    , '74'
    , '75'
    , '98'
    , '99'
  );
  CST_PIS_DESC : Array[0..32] of String = (
      'Operação Tributável com Alíquota Básica'
    , 'Operação Tributável com Alíquota Diferenciada'
    , 'Operação Tributável com Alíquota por Unidade de Medida de Produto'
    , 'Operação Tributável Monofásica - Revenda a Alíquota Zero'
    , 'Operação Tributável por Substituição Tributária'
    , 'Operação Tributável a Alíquota Zero'
    , 'Operação Isenta da Contribuição'
    , 'Operação sem Incidência da Contribuição'
    , 'Operação com Suspensão da Contribuição'
    , 'Outras Operações de Saída'
    , 'Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Operação com Direito a Crédito - Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno'
    , 'Operação com Direito a Crédito - Vinculada Exclusivamente a Receita de Exportação'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Tributadas no Mercado Interno e de Exportação'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Não Tributadas no Mercado Interno e de Exportação'
    , 'Operação com Direito a Crédito - Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno e de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno'
    , 'Crédito Presumido - Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação'
    , 'Crédito Presumido - Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno e de Exportação'
    , 'Crédito Presumido - Outras Operações'
    , 'Operação de Aquisição sem Direito a Crédito'
    , 'Operação de Aquisição com Isenção'
    , 'Operação de Aquisição com Suspensão'
    , 'Operação de Aquisição a Alíquota Zero'
    , 'Operação de Aquisição sem Incidência da Contribuição'
    , 'Operação de Aquisição por Substituição Tributária'
    , 'Outras Operações de Entrada'
    , 'Outras Operações'
  );
begin
  try
    for I := Low(sCST_PIS_ID) to High(sCST_PIS_ID) do
      with IBSQL do
      begin
        SQL.Clear;
        SQL.Add( 'Execute Procedure SET_CST_COFINS ('     );
        SQL.Add( '    ' + QuotedStr(sCST_PIS_ID[I])    );
        SQL.Add( '  , ' + QuotedStr(CST_PIS_DESC[I])   );
        SQL.Add( '  , ' + IntToStr(Ord(TpcnCstCofins(I))) );
        SQL.Add( ')' );

        ExecQuery;
        CommitTransaction;
      end;
  except
    On E : Exception do
      raise Exception.Create('Erro no procedimento GerarTabela_CST_COFINS - ' + E.Message);
  end;
end;

function TDMNFe.GerarNFeEntradaOnLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra: Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
  const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
  sErrorMsg   : String;
begin

  try

    LerConfiguracao(sCNPJEmitente);

    if ( DelphiIsRunning ) then
      Result := True
    else
      Result := ACBrNFe.WebServices.StatusServico.Executar;


    if not Result then
      Exit;

    GerarNFEEntradaACBr(sCNPJEmitente, iCodFornecedor, iAnoCompra, iNumCompra, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    iNumeroLote := GetNextID('TBEMPRESA', 'LOTE_NUM_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and LOTE_ANO_NFE = ' + qryEmitenteLOTE_ANO_NFE.AsString);

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

//    GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, iNumeroLote, EmptyStr);
//
    if ( Result ) then
    begin
      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
      UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
    end;

  except
    On E : Exception do
    begin
      sErrorMsg := E.Message;

      // Diretrizes de tomada de decisão quando a NFe enviada não é aceita
      if ( Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr ) then
        if ReciboNaoExisteNaEntrada(ACBrNFe.WebServices.Retorno.Recibo) then
          GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, iNumeroLote, ACBrNFe.WebServices.Retorno.Recibo);

      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Count = 1 ) then
        Case ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat of
          REJEICAO_NFE_DUPLICIDADE, REJEICAO_NFE_NOTA_DENEGADA:
            begin
              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);

              // Remover Lote da Venda
              GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                'Favor gerar NF-e novamente!';
            end;
        end;

      ShowError('Erro ao tentar gerar NF-e de Entrada.' +
        IfThen(Trim(ACBrNFe.WebServices.Retorno.Recibo) = EmptyStr, EmptyStr, #13 + 'Recibo: ' + ACBrNFe.WebServices.Retorno.Recibo) +
        #13#13 + 'GerarNFeEntradaOnLineACBr() --> ' + sErrorMsg);

      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeEntradaOffLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
  const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEEntradaACBr(sCNPJEmitente, iCodFornecedor, iAnoCompra, iNumCompra, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML);

    Result := True;

    if ( Imprimir ) then
      ACBrNFe.NotasFiscais.Imprimir;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar gerar NF-e de Entrada.' + #13#13 + 'GerarNFeEntradaOffLineACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

function TDMNFe.EnviarEmailDANFEACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
  const EnviarPDF : Boolean = True; const sArquivoBoleto : String = '') : Boolean;
var
  sFileNameXML      ,
  sEmailAssunto     ,
  sEmailEmpresa     ,
  sEmailDestinatario,
  sMensagem  ,
  sDocumento : String;
  sAssinaturaHtml ,
  sAssinaturaTxt  : String;
  sANX,
  sMSG,
  sCC : TStringList;
const
  MSG_REF_NFE = 'Referente a NF-e %s';
  MSG_REF_DOC = 'Referente a venda No. %s';
begin

  try

    sANX := TStringList.Create;
    sMSG := TStringList.Create;
    sCC  := TStringList.Create;

    try

      LerConfiguracao( sCNPJEmitente );

      AbrirEmitente( sCNPJEmitente );
      AbrirDestinatario( iCodigoCliente );
      AbrirVenda( iAnoVenda, iNumVenda );
      AbrirNFeEmitida( iAnoVenda, iNumVenda );

      if ( EnviarPDF ) then
        sFileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString
      else
        sFileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

      ForceDirectories( ExtractFilePath(sFileNameXML) );

      TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( sFileNameXML );

      CorrigirXML_NFe( qryCalculoImposto.FieldByName('XML_NFE').AsWideString, sFileNameXML );

      if not FilesExists(sFileNameXML) then
        raise Exception.Create(Format('Arquivo %s não encontrado.', [QuotedStr(sFileNameXML)]));

      with ACBrNFe do
      begin
        Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

        NotasFiscais.Clear;
        NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString );

        // Montar identificação do documento para título de e-mail

        if ( qryCalculoImposto.FieldByName('NFE').AsLargeInt > 0 ) then
        begin
          sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', qryCalculoImposto.FieldByName('NFE').AsLargeInt)]);
          sDocumento := 'NFe ' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('NFE').AsLargeInt) + '-' + qryCalculoImposto.FieldByName('SERIE').AsString;
        end
        else
        begin
          sMensagem  := Format(MSG_REF_DOC, [qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('##00000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger)]);
          sDocumento := 'Venda ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('##00000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger);
        end;

        CarregarConfiguracoesEmpresa(sCNPJEmitente, sEmailAssunto, sAssinaturaHtml, sAssinaturaTxt);

        sEmailEmpresa      := GetEmailEmpresa( sCNPJEmitente );
        sEmailDestinatario := GetClienteEmail( iCodigoCliente );
        sEmailAssunto      := GetNomeFantasiaEmpresa( sCNPJEmitente ) + ' - ' + sDocumento;

        sCC.Add( sEmailEmpresa );

        sMSG.Add( sMensagem );
        sMSG.Add('');
        sMSG.Add( sAssinaturaTxt );
        sMSG.Add('--');
        sMSG.Add('FAVOR NÃO RESPONDER ESTE E-MAIL.');
        sMSG.Add('Composição automática de e-mail executada pelo sistema ' + GetProductName + ' (Versão ' + GetVersion +
          '), desenvolvido pela empresa ' + GetCompanyName + '.' + #13#13 + GetCopyright);

        if FileExists( sArquivoBoleto ) then
          sANX.Add( sArquivoBoleto );

        CopyFileTo( sFileNameXML, ExtractFilePath(ParamStr(0)) + ExtractFileName(sFileNameXML) );

        NotasFiscais.Items[0].EnviarEmail(
            gContaEmail.Servidor_SMTP
          , IntToStr(gContaEmail.Porta_SMTP)
          , gContaEmail.Conta
          , gContaEmail.Senha
          , gContaEmail.Conta
          , sEmailDestinatario
          , sEmailAssunto
          , sMSG
          , gContaEmail.ConexaoSeguraSSL // SSL - Conexão Segura
          , EnviarPDF                    // Enviar PDF junto
          , sCC                          // Lista com emails que serão enviado cópias - TStrings
          , sANX                         // Lista de anexos - TStrings
          , False                        // Pede confirmação de leitura do email
          , False                        // Aguarda Envio do Email(não usa thread)
          , GetNomeFantasiaEmpresa( sCNPJEmitente ) // Nome do Rementente
          , gContaEmail.ConexaoSeguraSSL );         // Auto TLS

        Result := True;
      end;

    except
      On E : Exception do
      begin
        ShowError('Erro ao tentar enviar para o cliente por e-mail o DANFE de Saída.' + #13#13 + 'EnviarEmailDANFEACBr() --> ' + e.Message);
        Result := False;
      end;
    end;

  finally
    sANX.Free;
    sMSG.Free;
    sCC.Free;

    DeleteFile( sFileNameXML );
    DeleteFile( ExtractFilePath(ParamStr(0)) + ExtractFileName(sFileNameXML) );
  end;

end;

procedure TDMNFe.GerarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String);
var
  cPercentualTributoAprox,
  vTotalTributoAprox     : Currency;
begin
(*
  IMR - 20/09/2014 :
    Inseção de nova TAG na Nota Fiscal referente a IE do destinatário para informa se este é Isento, Contribuinte ou Não-contribuinte de acordo
    com as regras estabelecidas pela SEFA para a versão 3.10 da NF-e.

  IMR - 10/10/2014 :
    Implementação da Lei "Transparência de Impostos" que visa informar ao consumidos o valor e o percentual pago de impostos sobre os itens e
    o total geral da nota fiscal.

  IMR - 31/03/2015 :
    Inclusão da TAG "Ide.finNFe := fnDevolucao" quando a NF-e for de devolução

  IMR - 23/05/2015 :
    Inclusão do bloco de código para verificar se o CFOP da venda corresponde
    a uma operação de devolução. Caso esta situação seja confirmada, a NF-e de
    origem será solicitada.
*)

  try

    LerConfiguracao(sCNPJEmitente);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( iCodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra );

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFe  := GetNextID('TBEMPRESA', 'NUMERO_NFE',   'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFE = '    + qryEmitenteSERIE_NFE.AsString);
    DtHoraEmiss := GetDateTimeDB;

    ACBrNFe.NotasFiscais.Clear;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := iNumeroNFe; // Caso não seja preenchido será gerado um número aleatório pelo componente
      Ide.natOp     := qryEntradaCalculoImposto.FieldByName('CFOP_DESCRICAO').AsString;
      Ide.idDest    := TpcnDestinoOperacao( IfThen(Trim(qryEmitenteEST_SIGLA.AsString) = Trim(qryFornecedorDestinatario.FieldByName('EST_SIGLA').AsString), 0, 1) );

      if ( qryEntradaCalculoImposto.FieldByName('COMPRA_PRAZO').AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := MODELO_NFE;
      Ide.serie     := iSerieNFe;
      Ide.nNF       := iNumeroNFe;
      Ide.dEmi      := GetDateDB; // StrToDate( FormatDateTime('dd/mm/yyyy', DtHoraEmiss) );
      Ide.tpNF      := tnEntrada;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Versão do seu sistema
      Ide.cUF       := NotaUtil.UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;

      if (qryEntradaCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
        Ide.finNFe  := fnDevolucao
      else
        Ide.finNFe  := fnNormal;

      if ( Ide.finNFe  = fnDevolucao ) then
        with Ide.NFref.Add, qryEntradaCalculoImposto do
          Case TFormaNFDevolucao(FieldByName('DNFE_FORMA').AsInteger) of
            fdNFeEletronica:
              refNFe := FieldByName('DNFE_CHAVE').AsString; // Nota Fiscal Eletronica

            fdNFeModelo1_1A:
              begin
                RefNF.cUF    := NotaUtil.UFtoCUF(FieldByName('DNFE_UF').AsString); // |
                RefNF.AAMM   := FieldByName('DNFE_COMPETENCIA').AsString;          // |
                RefNF.CNPJ   := FieldByName('DNFE_CNPJ_CPF').AsString;             // |
                RefNF.modelo := FieldByName('DNFE_MODELO').AsInteger;              // |- NF Modelo 1/1A
                RefNF.serie  := FieldByName('DNFE_SERIE').AsInteger;               // |  * O modelo padrão é 1
                RefNF.nNF    := FieldByName('DNFE_NUMERO').AsInteger;              // |
              end;

            fdNFProdutorRural:
              begin
                RefNFP.cUF     := NotaUtil.UFtoCUF(FieldByName('DNFE_UF').AsString);       // |
                RefNFP.AAMM    := FieldByName('DNFE_COMPETENCIA').AsString;                // |
                RefNFP.CNPJCPF := FieldByName('DNFE_CNPJ_CPF').AsString;                   // |
                RefNFP.IE      := FieldByName('DNFE_IE').AsString;                         // |- NF produtor Rural
                RefNFP.modelo  := FormatFloat('00', FieldByName('DNFE_MODELO').AsInteger); // | * O modelo padrão é 04
                RefNFP.serie   := FieldByName('DNFE_SERIE').AsInteger;                     // |
                RefNFP.nNF     := FieldByName('DNFE_NUMERO').AsInteger;                    // |
              end;

            fdCupomFiscal:
              begin
                RefECF.modelo  := TpcnECFModRef(FieldByName('DECF_MODELO').AsInteger); // | (ECFModRefVazio, ECFModRef2B, ECFModRef2C, ECFModRef2D)
                RefECF.nECF    := FieldByName('DECF_NUMERO').AsString;                 // |- Cupom Fiscal
                RefECF.nCOO    := FieldByName('DECF_COO').AsString;                    // |
              end;
          end;

  //     Ide.dhCont := date;
  //     Ide.xJust  := 'Justificativa Contingencia';

  //Para NFe referenciada use os campos abaixo
  {     with Ide.NFref.Add do
        begin
          refNFe       := ''; //NFe Eletronica

          RefNF.cUF    := 0;  // |
          RefNF.AAMM   := ''; // |
          RefNF.CNPJ   := ''; // |
          RefNF.modelo := 1;  // |- NFe Modelo 1/1A
          RefNF.serie  := 1;  // |
          RefNF.nNF    := 0;  // |

          RefNFP.cUF     := 0;  // |
          RefNFP.AAMM    := ''; // |
          RefNFP.CNPJCPF := ''; // |
          RefNFP.IE      := ''; // |- NF produtor Rural
          RefNFP.modelo  := ''; // |
          RefNFP.serie   := 1;  // |
          RefNFP.nNF     := 0;  // |

          RefECF.modelo  := ECFModRef2B; // |
          RefECF.nECF    := '';          // |- Cupom Fiscal
          RefECF.nCOO    := '';          // |
        end;
  }
      Emit.CNPJCPF := qryEmitenteCNPJ.AsString;
      Emit.IE      := Trim(qryEmitenteIE.AsString);
      Emit.CNAE    := Trim(qryEmitenteCNAE.AsString);  // C20 - CNAE fiscal Este campo deve ser informado quando o campo NFe.Emit.IM for informado.
      Emit.xNome   := qryEmitenteRZSOC.AsString;
      Emit.xFant   := qryEmitenteNMFANT.AsString;

      case qryEmitenteTIPO_REGIME_NFE.AsInteger of
        0 : Emit.CRT := crtSimplesNacional;
        1 : Emit.CRT := crtSimplesExcessoReceita;
        2 : Emit.CRT := crtRegimeNormal;
      end;

      Emit.EnderEmit.fone    := qryEmitenteFONE.AsString;
      Emit.EnderEmit.CEP     := StrToInt( qryEmitenteCEP.AsString );
      Emit.EnderEmit.xLgr    := Trim( qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString );
      Emit.EnderEmit.nro     := qryEmitenteNUMERO_END.AsString;
      Emit.EnderEmit.xCpl    := qryEmitenteCOMPLEMENTO.AsString + '.';
      Emit.EnderEmit.xBairro := qryEmitenteBAI_NOME.AsString;
      Emit.EnderEmit.cMun    := qryEmitenteCID_IBGE.AsInteger;
      Emit.EnderEmit.xMun    := qryEmitenteCID_NOME.AsString;
      Emit.EnderEmit.UF      := qryEmitenteEST_SIGLA.AsString;
      Emit.enderEmit.cPais   := qryEmitentePAIS_ID.AsInteger;
      Emit.enderEmit.xPais   := qryEmitentePAIS_NOME.AsString;

      Emit.IEST              := '';
      Emit.IM                := ''; // Preencher no caso de existir serviços na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se é permitido
                                    // a inclusão de serviços na NFe

  //Para NFe Avulsa preencha os campos abaixo
  {      Avulsa.CNPJ    := '';
        Avulsa.xOrgao  := '';
        Avulsa.matr    := '';
        Avulsa.xAgente := '';
        Avulsa.fone    := '';
        Avulsa.UF      := '';
        Avulsa.nDAR    := '';
        Avulsa.dEmi    := now;
        Avulsa.vDAR    := 0;
        Avulsa.repEmi  := '';
        Avulsa.dPag    := now;             }

      Dest.CNPJCPF := qryFornecedorDestinatario.FieldByName('CNPJ').AsString; // FormatFloat('00000000000000', qryDestinatarioCNPJ.AsInteger);
      Dest.xNome   := qryFornecedorDestinatario.FieldByName('NOME').AsString;
      Dest.Email   := Trim(AnsiLowerCase(qryFornecedorDestinatario.FieldByName('EMAIL').AsString));

      if ( qryFornecedorDestinatario.FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
      begin
        if (AnsiUpperCase(Trim(qryFornecedorDestinatario.FieldByName('INSCEST').AsString)) = 'ISENTO') or (Trim(qryFornecedorDestinatario.FieldByName('INSCEST').AsString) = EmptyStr) then
          Dest.indIEDest     := inIsento
        else
          Dest.indIEDest     := inContribuinte;

        Dest.IE              := Trim(qryFornecedorDestinatario.FieldByName('INSCEST').AsString);
        Dest.ISUF            := EmptyStr;
      end
      else
      begin
        Dest.indIEDest       := inNaoContribuinte;
        Dest.IE              := EmptyStr;
        Dest.ISUF            := EmptyStr;
      end;

      Dest.EnderDest.Fone    := qryFornecedorDestinatario.FieldByName('FONE').AsString;
      Dest.EnderDest.CEP     := qryFornecedorDestinatario.FieldByName('CEP').AsInteger;
      Dest.EnderDest.xLgr    := Trim( qryFornecedorDestinatario.FieldByName('TLG_SIGLA').AsString + ' ' + qryFornecedorDestinatario.FieldByName('LOG_NOME').AsString );
      Dest.EnderDest.nro     := qryFornecedorDestinatario.FieldByName('NUMERO_END').AsString;
      Dest.EnderDest.xCpl    := qryFornecedorDestinatario.FieldByName('COMPLEMENTO').AsString;
      Dest.EnderDest.xBairro := qryFornecedorDestinatario.FieldByName('BAI_NOME').AsString;
      Dest.EnderDest.cMun    := qryFornecedorDestinatario.FieldByName('CID_IBGE').AsInteger;
      Dest.EnderDest.xMun    := qryFornecedorDestinatario.FieldByName('CID_NOME').AsString;
      Dest.EnderDest.UF      := qryFornecedorDestinatario.FieldByName('EST_SIGLA').AsString;
      Dest.EnderDest.cPais   := qryFornecedorDestinatario.FieldByName('PAIS_ID').AsInteger;  // 1058;
      Dest.EnderDest.xPais   := qryFornecedorDestinatario.FieldByName('PAIS_NOME').AsString; // 'BRASIL';

  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

  //Adicionando Produtos

      vTotalTributoAprox := 0.0;
      
      qryEntradaDadosProduto.First;
      
      while not qryEntradaDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryEntradaDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // Número sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryEntradaDadosProduto.FieldByName('CODPROD').AsString;

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryEntradaDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString
          else
            Prod.xProd  := qryEntradaDadosProduto.FieldByName('DESCRI').AsString + ' ' + qryEntradaDadosProduto.FieldByName('ANO_FAB_MODELO_VEICULO').AsString;

          Prod.NCM      := qryEntradaDadosProduto.FieldByName('NCM_SH').AsString;            // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.EXTIPI   := '';
          Prod.CFOP     := qryEntradaDadosProduto.FieldByName('CFOP_COD').AsString;

          if EAN13Valido(qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString) then  // Futuramento implementar a função "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
            Prod.cEAN   := qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString
          else
            Prod.cEAN   := EmptyStr;

          Prod.uCom     := qryEntradaDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qCom     := qryEntradaDadosProduto.FieldByName('QTDE').AsCurrency;

          Prod.vUnCom   := qryEntradaDadosProduto.FieldByName('PUNIT').AsCurrency;           // I10a  Valor Unitário de comercialização

          Prod.vProd    := qryEntradaDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Serviços

          if EAN13Valido(qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramente implementar a função "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
            Prod.cEANTrib := qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString
          else
            Prod.cEANTrib := EmptyStr;
              
          Prod.uTrib     := qryEntradaDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qTrib     := qryEntradaDadosProduto.FieldByName('QTDE').AsCurrency;

          Prod.vUnTrib   := qryEntradaDadosProduto.FieldByName('PUNIT').AsCurrency;          // I14a  Valor Unitário de tributação

(* EXEMPLO *)
          // NFe.Det[i].Prod.uCom    := 'CX';                                                   = 'UN'
          // NFe.Det[i].Prod.qCom    :=    2;   Vendidas 2 caixas ( com 10 unidades cada )      = 20
          // NFe.Det[i].Prod.vUnCom  :=   50;   R$ 50,00 cada caixa                             = 50,00 / 10 = 5,00
          // NFe.Det[i].Prod.vProd   :=  100;   R$ 100,00 Valor dos produtos                    = 20 * 5,00 = 100,00
          // NFe.Det[i].Prod.uTrib   := 'UN';                                                   = 'UN'
          // NFe.Det[i].Prod.qTrib   :=   20;   2 caixas X 10 unidades por caixa = 20 unidades  = 20
          // NFe.Det[i].Prod.vUnTrib :=    5;   R$ 100,00 / 20 unidades = R$ 5,00 cada unidade  = 100,00 / 20 = 5,00

          Prod.vFrete    := 0;                                               // I15 - Valor Total do Frete
          Prod.vSeg      := 0;                                               // I16 - Valor Total do Seguro
          Prod.vDesc     := qryEntradaDadosProduto.FieldByName('TOTAL_DESCONTO').AsCurrency; // I17 - Valor do Desconto

          // Informação Adicional do Produto
          
          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            if ( Trim(qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr ) then
              infAdProd    := 'Ref.: ' + qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString
            else
              infAdProd    := EmptyStr
          else
            infAdProd      := 'Cor: '         + qryEntradaDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString + #13 +
                              'Placa: '       + qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString      + #13 +
                              'Renavam: '     + qryEntradaDadosProduto.FieldByName('RENAVAM_VEICULO').AsString + #13 +
                              'Chassi: '      + qryEntradaDadosProduto.FieldByName('CHASSI_VEICULO').AsString  + #13 +
                              'Combustivel: ' + qryEntradaDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString;

  //Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add
  
  {         with Prod.DI.Add do
            begin
              nDi         := '';
              dDi         := now;
              xLocDesemb  := '';
              UFDesemb    := '';
              dDesemb     := now;
              cExportador := '';

              with adi.Add do
               begin
                 nAdicao     := 1;
                 nSeqAdi     := 1;
                 cFabricante := '';
                 vDescDI     := 0;
               end;
            end;
  }

  //Campos para venda de veículos novos

          if ( (GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID) and (qryEntradaDadosProduto.FieldByName('PRODUTO_NOVO').AsInteger = 1) ) then
          begin

            with Prod.veicProd do
              begin
                tpOP     := toVendaConcessionaria; // J02 - Tipo da operação
                                                   //    (1) = toVendaConcessionaria
                                                   //    (2) = toFaturamentoDireto
                                                   //    (3) = toVendaDireta
                                                   //    (0) = toOutros
                chassi   := qryEntradaDadosProduto.FieldByName('CHASSI_VEICULO').AsString;        // J03 - Chassi do veículo
                cCor     := qryEntradaDadosProduto.FieldByName('COR_VEICULO').AsString;           // J04 - Cor
                xCor     := qryEntradaDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString; // J05 - Descrição da Cor
                pot      := ''; // J06 - Potência Motor
                Cilin    := '';
                pesoL    := ''; // J08 - Peso Líquido
                pesoB    := ''; // J09 - Peso Bruto
                nSerie   := ''; // J10 - Serial (série)
                tpComb   := qryEntradaDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString; // J11 - Tipo de combustível
                nMotor   := ''; // J12 - Número de Motor
                CMT      := '';
                dist     := '';        // J14 - Distância entre eixos
//                RENAVAM  := '';        // J15 - RENAVAM            (Não informar a TAG na exportação)
                anoMod   := qryEntradaDadosProduto.FieldByName('ANO_MODELO_VEICULO').AsInteger;         // J16 - Ano Modelo de Fabricação
                anoFab   := qryEntradaDadosProduto.FieldByName('ANO_FABRICACAO_VEICULO').AsInteger;     // J17 - Ano de Fabricação
                tpPint   := '';        // J18 - Tipo de Pintura
                tpVeic   := StrToIntDef(qryEntradaDadosProduto.FieldByName('TIPO_VEICULO').AsString, 0); // J19 - Tipo de Veículo    (Utilizar Tabela RENAVAM)
                espVeic  := 0;         // J20 - Espécie de Veículo (Utilizar Tabela RENAVAM)
                VIN      := '';        // J21 - Condição do VIN
                condVeic := cvAcabado; // J22 - Condição do Veículo (1 - Acabado; 2 - Inacabado; 3 - Semi-acabado)
                cMod     := '';        // J23 - Código Marca Modelo (Utilizar Tabela RENAVAM)
              end;

          end;

{
    property tpOP: TpcnTipoOperacao read FtpOP write FtpOP;
    property chassi: string read Fchassi write Fchassi;
    property cCor: string read FcCor write FcCor;
    property xCor: string read FxCor write FxCor;
    property pot: string read Fpot write Fpot;
    property Cilin: string read FCilin write FCilin;
    property pesoL: string read FpesoL write FpesoL;
    property pesoB: string read FpesoB write FpesoB;
    property nSerie: string read FnSerie write FnSerie;
    property tpComb: string read FtpComb write FtpComb;
    property nMotor: string read FnMotor write FnMotor;
    property CMT: string read FCMT write FCMT;
    property dist: string read Fdist write Fdist;
    //property RENAVAM: string read FRENAVAM write FRENAVAM;
    property anoMod: integer read FanoMod write FanoMod;
    property anoFab: integer read FanoFab write FanoFab;
    property tpPint: string read FtpPint write FtpPint;
    property tpVeic: integer read FtpVeic write FtpVeic;
    property espVeic: integer read FespVeic write FespVeic;
    property VIN: string read FVIN write FVIN;
    property condVeic: TpcnCondicaoVeiculo read FcondVeic write FcondVeic;
    property cMod: string read FcMod write FcMod;

    property cCorDENATRAN: string read FcCorDENATRAN write FcCorDENATRAN;
    property lota: integer read Flota write Flota;
    property tpRest: integer read FtpRest write FtpRest;
}

  //Campos específicos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos específicos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos específicos para venda de combustível(distribuidoras)
  {         with Prod.comb do
            begin
              cProdANP := 0;
              CODIF    := '';
              qTemp    := 0;
              UFcons   := '';

              CIDE.qBCprod   := 0 ;
              CIDE.vAliqProd := 0 ;
              CIDE.vCIDE     := 0 ;

              ICMS.vBCICMS   := 0 ;
              ICMS.vICMS     := 0 ;
              ICMS.vBCICMSST := 0 ;
              ICMS.vICMSST   := 0 ;

              ICMSInter.vBCICMSSTDest := 0 ;
              ICMSInter.vICMSSTDest   := 0 ;

              ICMSCons.vBCICMSSTCons := 0 ;
              ICMSCons.vICMSSTCons   := 0 ;
              ICMSCons.UFcons        := '' ;
            end;}

          with Imposto do
          begin
            with ICMS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                // csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900
                
                Case qryEntradaDadosProduto.FieldByName('CSOSN').AsInteger of
                  101 : CSOSN := csosn101;
                  102 : CSOSN := csosn102;
                  103 : CSOSN := csosn103;
                  201 : CSOSN := csosn201;
                  202 : CSOSN := csosn202;
                  203 : CSOSN := csosn203;
                  300 : CSOSN := csosn300;
                  400 : CSOSN := csosn400;
                  500 : CSOSN := csosn500;
                  else
                    CSOSN := csosn900;
                end;

                pCredSN     := qryEntradaDadosProduto.FieldByName('ALIQUOTA_CSOSN').AsCurrency;
                vCredICMSSN := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency * pCredSN / 100;

              end
              else
              begin

                Case StrToInt(Copy(qryEntradaDadosProduto.FieldByName('CST').AsString, 2, 2)) of
                   0 : CST := cst00;
                  10 : CST := cst10;
                  20 : CST := cst20;
                  30 : CST := cst30;
                  40 : CST := cst40;
                  41 : CST := cst41;
                  50 : CST := cst50;
                  51 : CST := cst51;
                  60 : CST := cst60;
                  70 : CST := cst70;
                  else
                    CST := cst90;
                end;

                ICMS.modBC := dbiValorOperacao;

                if (qryEntradaCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
                  ICMS.pRedBC := 0.0
                else
                if (qryEntradaDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency <= 0) then
                  ICMS.pRedBC := 0.0
                else
                  ICMS.pRedBC := (100.0 - qryEntradaDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency); // qryEntradaDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;


                if (ICMS.pRedBC > 0) or (qryEntradaDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency > 0) then
                  ICMS.vBC := qryEntradaDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency
                else
                  ICMS.vBC := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;

                ICMS.pICMS := qryEntradaDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
                ICMS.vICMS := ICMS.vBC * ICMS.pICMS / 100.0;

              end;

              ICMS.orig    := TpcnOrigemMercadoria( StrToInt(Copy(qryEntradaDadosProduto.FieldByName('CST').AsString, 1, 1)) );
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;

            end;

            with PIS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST      := pis99;
                PIS.vBC  := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstPis(qryEntradaDadosProduto.FieldByName('CST_PIS_INDICE_ACBR').AsInteger);

                if ( CST = pis99 ) then
                begin
                  PIS.vBC  := 0;
                  PIS.pPIS := 0;
                  PIS.vPIS := 0;
                end
                else
                begin
                  PIS.vBC  := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;
                  PIS.pPIS := qryEntradaDadosProduto.FieldByName('ALIQUOTA_PIS').AsCurrency;
                  PIS.vPIS := PIS.vBC * PIS.pPIS / 100;
                end;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end;
            end;

            with COFINS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST            := cof99;
                COFINS.vBC     := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstCofins(qryEntradaDadosProduto.FieldByName('CST_COFINS_INDICE_ACBR').AsInteger);

                if ( CST = cof99 ) then
                begin
                  COFINS.vBC     := 0;
                  COFINS.pCOFINS := 0;
                  COFINS.vCOFINS := 0;
                end
                else
                begin
                  COFINS.vBC     := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;
                  COFINS.pCOFINS := qryEntradaDadosProduto.FieldByName('ALIQUOTA_COFINS').AsCurrency;
                  COFINS.vCOFINS := COFINS.vBC * COFINS.pCOFINS / 100;
                end;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end;
            end;

  {
            with IPI do
            begin
              CST      := ipi99 ;
              clEnq    := '999';
              CNPJProd := '';
              cSelo    := '';
              qSelo    := 0;
              cEnq     := '';

              vBC    := qryDadosProdutoPUNIT.AsCurrency;
              qUnid  := 0;
              vUnid  := 0;
              pIPI   := 0; // Percentual IPI
              vIPI   := 0; // Valor IPI
            end;

              with II do
               begin
                 vBc      := 0;
                 vDespAdu := 0;
                 vII      := 0;
                 vIOF     := 0;
               end;

              with PISST do
               begin
                 vBc       := 0;
                 pPis      := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vPIS      := 0;
               end;

              with COFINSST do
               begin
                 vBC       := 0;
                 pCOFINS   := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vCOFINS   := 0;
               end;
  }
  //Grupo para serviços
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela disponível
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}

            // Lei da Transparência de Impostos

            if ( Trim(Prod.NCM) <> EmptyStr ) then
            begin
              cPercentualTributoAprox := qryEntradaDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;

              if ( cPercentualTributoAprox > 0.0 ) then
              begin
                vTotTrib  := Prod.vProd * cPercentualTributoAprox / 100;
                infAdProd := infAdProd +
                  Trim(IfThen(Trim(infAdProd) = EmptyStr, '', #13) + Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                    FormatFloat(',0.00', vTotTrib),
                    FormatFloat(',0.##"%"', cPercentualTributoAprox)
                  ]));

                vTotalTributoAprox := vTotalTributoAprox + vTotTrib;
              end;
            end;

          end;
        end ;

        qryEntradaDadosProduto.Next;
      end;

      Total.ICMSTot.vBC     := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency;
      Total.ICMSTot.vICMS   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency;
      Total.ICMSTot.vBCST   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vST     := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vProd   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency;
      Total.ICMSTot.vFrete  := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_FRETE').AsCurrency;
      Total.ICMSTot.vSeg    := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_SEGURO').AsCurrency;
      Total.ICMSTot.vDesc   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency;
      Total.ICMSTot.vII     := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_II').AsCurrency;
      Total.ICMSTot.vIPI    := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_IPI').AsCurrency;
      Total.ICMSTot.vPIS    := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_PIS').AsCurrency;
      Total.ICMSTot.vCOFINS := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_COFINS').AsCurrency;
      Total.ICMSTot.vOutro  := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_OUTROS').AsCurrency;
      Total.ICMSTot.vNF     := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;

      if ( vTotalTributoAprox > 0.0 ) then
        Total.ICMSTot.vTotTrib := vTotalTributoAprox;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

  {      Total.retTrib.vRetPIS    := 0;
        Total.retTrib.vRetCOFINS := 0;
        Total.retTrib.vRetCSLL   := 0;
        Total.retTrib.vBCIRRF    := 0;
        Total.retTrib.vIRRF      := 0;
        Total.retTrib.vBCRetPrev := 0;
        Total.retTrib.vRetPrev   := 0;}

      Transp.modFrete            := mfSemFrete; // X02 - Modalidade do frete
                                                //         (0)=mfContaEmitente     – por conta do emitente;
                                                //         (1)=mfContaDestinatario – por conta do destinatário)
                                                //       TAG de grupo Transportador - <transporta> - Ocorrência 0-1

      Transp.Transporta.CNPJCPF  := '';
      Transp.Transporta.xNome    := '';
      Transp.Transporta.IE       := '';
      Transp.Transporta.xEnder   := '';
      Transp.Transporta.xMun     := '';
      Transp.Transporta.UF       := '';
  {
        Transp.retTransp.vServ    := 0;
        Transp.retTransp.vBCRet   := 0;
        Transp.retTransp.pICMSRet := 0;
        Transp.retTransp.vICMSRet := 0;
        Transp.retTransp.CFOP     := '';
        Transp.retTransp.cMunFG   := 0;         }

        Transp.veicTransp.placa := '';
        Transp.veicTransp.UF    := '';
        Transp.veicTransp.RNTC  := '';
        
  //Dados do Reboque
  {      with Transp.Reboque.Add do
         begin
           placa := '';
           UF    := '';
           RNTC  := '';
         end;}

      if ( Transp.modFrete in [mfContaDestinatario, mfContaTerceiros] ) then
        with Transp.Vol.Add do
        begin
          qVol  := qryEntradaDadosProduto.RecordCount;
          esp   := 'Especie';
          marca := 'Marca';
          nVol  := 'Numero';
          pesoB := qryEntradaDadosProduto.RecordCount * 1;
          pesoL := qryEntradaDadosProduto.RecordCount * 1.01;

          //Lacres do volume. Pode ser adicionado vários
          //Lacres.Add.nLacre := '';
        end;

      if ( Ide.finNFe = fnNormal ) then
      begin

        // Dados da Fatura

        Cobr.Fat.nFat  := FormatFloat('0000', qryEntradaCalculoImposto.FieldByName('ANO').AsInteger) + '/' + FormatFloat('0000000', qryEntradaCalculoImposto.FieldByName('CODCONTROL').AsInteger);
        Cobr.Fat.vOrig := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency + qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;
        Cobr.Fat.vDesc := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency ;
        Cobr.Fat.vLiq  := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency ;

        // Dados da(s) Duplicata(s)

        if ( qryEntradaCalculoImposto.FieldByName('COMPRA_PRAZO').AsInteger = 1 ) then
        begin
          qryEntradaDuplicatas.First;
          while not qryEntradaDuplicatas.Eof do
          begin
            with Cobr.Dup.Add do
            begin
              nDup  := FormatFloat('0000', qryEntradaDuplicatas.FieldByName('ANOLANC').AsInteger) + '/' +
                FormatFloat('0000000', qryEntradaDuplicatas.FieldByName('NUMLANC').AsInteger);
              dVenc := qryEntradaDuplicatas.FieldByName('DTVENC').AsDateTime;
              vDup  := qryEntradaDuplicatas.FieldByName('VALORPAG').AsCurrency;
            end;

            qryEntradaDuplicatas.Next;
          end;
        end;

      end;

      InfAdic.infCpl     := ' * * * ' + #13 +
                            'Compra: ' + qryEntradaCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryEntradaCalculoImposto.FieldByName('CODCONTROL').AsInteger)  +
                            ' - Forma/Cond. Pgto.: ' + qryEntradaCalculoImposto.FieldByName('FORMA_PAGO').AsString + '/' + qryEntradaCalculoImposto.FieldByName('COND_PAGO_FULL').AsString + ' * * * ' + #13 +
                            'Usuário: ' + qryEntradaCalculoImposto.FieldByName('USUARIO_NOME_COMPLETO').AsString + ' * * * ' + #13 +
                            'Observações: ' + qryEntradaCalculoImposto.FieldByName('OBS').AsString +
                            IfThen(vTotalTributoAprox = 0, EmptyStr, #13 + Format('* Valor Total Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                              FormatFloat(',0.00', Total.ICMSTot.vTotTrib),
                              FormatFloat(',0.##"%"', Total.ICMSTot.vTotTrib / Total.ICMSTot.vNF * 100)]));

      InfAdic.infAdFisco := 'Info. Fisco: ' + GetInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obserações da venda: ' + qryCalculoImportoOBS.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Venda: ' + qryCalculoImportoANO.AsString + '/' + FormatFloat('###0000000', qryCalculoImportoCODCONTROL.AsInteger) +
                  ' - Forma/Cond. Pgto.: ' + qryCalculoImportoFORMAPAG.AsString + '/' + qryCalculoImportoCOND_DESCRICAO_FULL.AsString;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Vendedor: ' + qryCalculoImportoVENDEDOR_NOME.AsString;
      end;

      with InfAdic.obsFisco.Add do
      begin
        xCampo := 'ObsFisco';
        xTexto := GetInformacaoFisco;
      end;

  //Processo referenciado
       with InfAdic.procRef.Add do
         begin
           nProc := '';
           indProc := ipSEFAZ;
         end;                 }

      exporta.UFembarq   := '';
      exporta.xLocEmbarq := '';

      compra.xNEmp := '';
      compra.xPed  := '';
      compra.xCont := '';

      ACBrNFe.NotasFiscais.GerarNFe;

      if ( not DelphiIsRunning ) then
        ACBrNFe.NotasFiscais.Assinar;

//      if GetSolicitaDHSaidaNFe( sCNPJEmitente ) then
//        if not ACBrNFe.NotasFiscais.ValidaRegrasdeNegocios then
//          raise Exception.Create( ACBrNFe.NotasFiscais.Items[0].RegrasdeNegocios );


      if ( not DelphiIsRunning ) then
        ACBrNFe.NotasFiscais.Valida;

      ACBrNFe.NotasFiscais.Items[0].SaveToFile( EmptyStr );

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;

    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NF-e de Entrada.' + #13#13 + 'GerarNFEEntradaACBr() --> ' + e.Message);
  end;

end;

function TDMNFe.ImprimirDANFEEntradaACBr(const sCNPJEmitente : String; const CodFornecedor: Integer; const iAnoCompra, iNumCompra : Integer;
  const IsPDF : Boolean = FALSE) : Boolean;
var
  FileNameXML : String;
begin

  try

    LerConfiguracao(sCNPJEmitente);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( CodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra );
    AbrirNFeEmitidaEntrada( iAnoCompra, iNumCompra );

    if ( IsPDF ) then
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryEntradaCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString
    else
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryEntradaCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryEntradaCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaEntradaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaEntradaVERSAO.AsInteger);

      NotasFiscais.Clear;
      NotasFiscais.LoadFromString( qryEntradaCalculoImposto.FieldByName('XML_NFE').AsWideString );

      if NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
      begin
        WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
        WebServices.ConsultaDPEC.Executar;

        DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
      end;

      if ( IsPDF ) then
      begin
        NotasFiscais.ImprimirPDF;
        ShowInformation('Arquivo Gerado', 'Arquivo XML da NF-e gerado em:' + #13#13 + FileNameXML);
      end
      else
        NotasFiscais.Imprimir;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE de Entrada.' + #13#13 + 'ImprimirDANFEEntradaACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.AbrirDestinatarioFornecedor(iCodigo: Integer);
begin
  with qryFornecedorDestinatario do
  begin
    Close;
    ParamByName('Codigo').AsInteger := iCodigo;
    Open;
  end;
end;

procedure TDMNFe.AbrirDestinatarioNFC(const aCNPJEmitente : String; const aCodigoNFC : Integer);
begin
  with qryNFCDestinatario do
  begin
    Close;
    ParamByName('numero').AsInteger := aCodigoNFC;
    ParamByName('empresa').AsString := aCNPJEmitente;
    Open;
  end;
end;

procedure TDMNFe.AbrirCompra(AnoCompra, NumeroCompra: Integer);
begin
  with qryEntradaCalculoImposto do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    Open;
  end;

  with qryEntradaDadosProduto do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    Open;
  end;

  with qryEntradaDuplicatas do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    Open;
  end;
end;

function TDMNFe.CancelarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor, iAnoCompra, iNumCompra: Integer;
  const Motivo: String): Boolean;
var
  FileNameXML ,
  ChaveNFE    : String;
  iNumeroLote : Integer;
  sLOG : TStringList;
begin
  sLOG := TStringList.Create;

  try

    LerConfiguracao(sCNPJEmitente);

    Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    if ( ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao ) then
      if (not ShowConfirm('Cancelamento de NF-e em AMBIENTE DE HOMOLOGAÇÃO não tem validade nenhuma para a SEFA.' + #13#13 +
        'Deseja continuar assim mesmo?', 'Cancelar NF-e')) then
      begin
        Result := False;
        Exit;
      end;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( iCodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra );
    AbrirNFeEmitidaEntrada( iAnoCompra, iNumCompra );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CANCEL + qryEntradaCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryEntradaCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaEntradaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaEntradaVERSAO.AsInteger);

      NotasFiscais.Clear;

      // Numero do Lote de Envio
      iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
      if not NotasFiscais.LoadFromString( qryEntradaCalculoImposto.FieldByName('XML_NFE').AsWideString ) then
        raise Exception.Create('Não foi possível carregar o XML da Nota Fiscal Eletrônica correspondente!' + #13 + FileNameXML);

      // Criar o Cancelamento
      EventoNFe.Evento.Clear;
      EventoNFe.idLote := iNumeroLote;

      with EventoNFe.Evento.Add do
      begin
        //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
        //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

        infEvento.cOrgao     := qryEmitenteEST_COD.AsInteger; // Código IBGE do Estado
        infEvento.chNFe      := qryNFeEmitidaEntradaCHAVE.AsString;
        infEvento.CNPJ       := sCNPJEmitente;
        infEvento.dhEvento   := GetDateTimeDB;
        infEvento.tpEvento        := teCancelamento;
        infEvento.detEvento.nProt := qryNFeEmitidaEntradaPROTOCOLO.AsString;
        infEvento.detEvento.xJust := Copy(Motivo, 1, 255);
      end;

      // Enviar o evento de cancelamento
      if ACBrNFe.EnviarEventoNFe(iNumeroLote) then
      begin
        with ACBrNFe.WebServices.EnvEvento do
        begin
          Result := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e

          if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
          begin
            raise Exception.CreateFmt(
              'Ocorreu o seguinte erro ao cancelar a Nota Fiscal Eletrônica:'  + sLineBreak +
              'Código: %d' + sLineBreak +
              'Motivo: %s', [
                EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
                EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
            ]);
          end;

          // Retorno

          sLOG.BeginUpdate;
          sLOG.Clear;
          sLOG.Add('Ambiente  : ' + IntToStr( Ord(ACBrNFe.Configuracoes.WebServices.Ambiente) ));
          sLOG.Add('-');
          sLOG.Add('Evento    : ' + AnsiUpperCase(DESC_LOG_EVENTO_CANCELAR_NFE_ET));
          sLOG.Add('Emitente  : ' + sCNPJEmitente);
          sLOG.Add('Chave NF-e: ' + qryNFeEmitidaEntradaCHAVE.AsString);
          sLOG.Add('-');
          sLOG.Add('Data/Hora Evento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));
          sLOG.Add('Número Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
          sLOG.Add('Código Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
          sLOG.Add('Motivo Status   : ' + EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
          sLOG.Add('-');
          sLOG.Add(EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
          sLOG.EndUpdate;

          // Gravar LOG

          with cdsLOG do
          begin
            Open;
            Append;

            cdsLOGUSUARIO.AsString       := GetUserApp;
            cdsLOGDATA_HORA.AsDateTime   := Now;
            cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
            cdsLOGDESCRICAO.AsString     := DESC_LOG_EVENTO_CANCELAR_NFE_ET;
            cdsLOGESPECIFICACAO.AsString := sLOG.Text;

            Post;
            ApplyUpdates;
            CommitTransaction;

          end;
        end;
      end
      else
      begin
        with ACBrNFe.WebServices.EnvEvento do
        begin
          raise Exception.Create(
            'Ocorreram erros ao tentar efetuar o Cancelamento:' + sLineBreak +
            'Lote: '     + IntToStr(EventoRetorno.idLote)  + sLineBreak +
            'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
            'Orgao: '    + IntToStr(EventoRetorno.cOrgao)  + sLineBreak + sLineBreak +
            'Status: '   + IntToStr(EventoRetorno.cStat)   + sLineBreak +
            'Motivo: '   + EventoRetorno.xMotivo
          );
        end;
      end;

    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar cancelar NF-e de Entrada.'+ #13#13 + 'CancelarNFeEntradaACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

  sLOG.Free;
end;

procedure TDMNFe.CarregarArquivoNFe(const sCNPJEmitente, sArquivo : String;
  var aNomeArquivoXML, aEmitente, aDestinatario, aRecibo, aProtocolo, aChave : String;
  var aDataHoraEmissao : TDateTime; var NotaValida : Boolean;
  var aSerie : String; var aNumero, aModelo, aVersao : Integer;
  var aTipoNota : TTipoNF;
  var aValorNF  : Currency);
var
  sVersao : String;
begin
  NotaValida := False;

  if Trim(sCNPJEmitente) = EmptyStr then
    LerConfiguracao(gUsuarioLogado.Empresa, tipoDANFEFast)
  else
    LerConfiguracao(sCNPJEmitente, tipoDANFEFast);

  try
    with ACBrNFe do
    begin
      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile( sArquivo, False );

      with NotasFiscais.Items[0].NFe do
      begin
        aEmitente     := Emit.CNPJCPF;
        aDestinatario := Dest.CNPJCPF;
        aSerie    := FormatFloat('#00', Ide.serie);
        aNumero   := Ide.nNF;

        Case Ide.modelo of
          MODELO_NFE  : aModelo := Ord(moNFe);
          MODELO_NFCE : aModelo := Ord(moNFCe);
        end;

        aDataHoraEmissao := Ide.dEmi;
        aTipoNota        := TTipoNF(Ord( Ide.tpNF ));

        sVersao := NotasFiscais.Items[0].NFe.infNFe.VersaoStr;

        if ( Trim(sVersao) = 'versao="2.00"' ) then
          aVersao := Ord(ve200)
        else
        if ( Trim(sVersao) = 'versao="3.00"' ) then
          aVersao := Ord(ve300)
        else
        if ( Trim(sVersao) = 'versao="3.10"' ) then
          aVersao := Ord(ve310);
      end;

      NotaValida := True;

      if NotaValida then
      begin
        aChave     := StringReplace(AnsiUpperCase(NotasFiscais.Items[0].NFe.infNFe.ID), 'NFE', '', [rfReplaceAll]);
        aProtocolo := NotasFiscais.Items[0].NFe.procNFe.nProt;
        aRecibo    := aProtocolo;
        aValorNF   := NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;

        aNomeArquivoXML := aChave + '-NFe_import.xml';
      end;
    end;
  except
    On E : Exception do
      ShowError('Erro ao tentar validar/carregar XML da NF-e.' + #13#13 + 'CarregarArquivoNFe() --> ' + e.Message);
  end;
end;

function TDMNFe.GetValidadeCertificado(const sCNPJEmitente : String; const Informe : Boolean = FALSE): Boolean;
var
  sDataVenc,
  sMsg     : String;
  iPrazo   : Integer;
begin
  if Trim(sCNPJEmitente) = EmptyStr then
    LerConfiguracao(gUsuarioLogado.Empresa)
  else
    LerConfiguracao(sCNPJEmitente);
      
  sDataVenc := FormatDateTime('dd/mm/yyyy', ACBrNFe.Configuracoes.Certificados.DataVenc);
  iPrazo    := DaysBetween(now, ACBrNFe.Configuracoes.Certificados.DataVenc);

  Result := (iPrazo >= 0);

  if ( iPrazo = 0 ) then
    sMsg := 'A Data de Vencimento do Certificado expira hoje!' + #13#13 + 'Favor providenciar um novo certificado.'
  else
  if ( iPrazo > 0 ) then
    sMsg := 'Data de Vencimento do Certificado: ' + sDataVenc + #13#13 + 'Prazo de expiração : ' + FormatFloat(',0', iPrazo) + ' dia(s).'
  else
  if ( iPrazo < 0 ) then
    sMsg := 'Data de Vencimento do Certificado: ' + sDataVenc + #13#13 + 'Prazo expirado à ' + FormatFloat(',0', iPrazo) + ' dia(s)!';

  if Informe or (iPrazo <= 30) then
    ShowWarning('A T E N Ç Ã O :' + #13#13 + '-----------------------------------------' + #13#13 + sMsg);
end;

function TDMNFe.InutilizaNumeroNFeACBr(const sCNPJEmitente: String; iAno,
  iModelo, iSerie, iNumeroInicial, iNumeroFinal: Integer;
  const sJustificativa: String; var sRetorno : String): Boolean;
begin
  try

    LerConfiguracao(sCNPJEmitente);

    with ACBrNFe do
    begin
      WebServices.Inutiliza(
        sCNPJEmitente,
        sJustificativa,
        iAno, iModelo, iSerie, iNumeroInicial, iNumeroFinal);

      Result   := True;
      sRetorno :=
        'Ambiente:    ' + IntToStr( Ord(WebServices.Inutilizacao.TpAmb) ) + #13 +
        'Versão App.: ' + WebServices.Inutilizacao.verAplic        + #13 +
        'Status Trn.: ' + IntToStr(WebServices.Inutilizacao.cStat) + #13 +
        '---'     + #13 +
        'Emitente:    ' + WebServices.Inutilizacao.CNPJ + #13 +
        'Modelo NF-e: ' + IntToStr( WebServices.Inutilizacao.Modelo ) + #13 +
        'Série NF-e:  ' + IntToStr( WebServices.Inutilizacao.Serie )  + #13 +
        'No. Inicial: ' + IntToStr( WebServices.Inutilizacao.NumeroInicial ) + #13 +
        'No. Final:   ' + IntToStr( WebServices.Inutilizacao.NumeroFinal )   + #13 +
        'Motivo:      ' + WebServices.Inutilizacao.xMotivo         + #13 +
        'Justif.:     ' + WebServices.Inutilizacao.Justificativa   + #13 +
        '---'     + #13 +
        'Data Recibo: ' + FormatDateTime('dd/mm/yyyy', WebServices.Inutilizacao.dhRecbto) + #13 +
        'Protocolo:   ' + WebServices.Inutilizacao.Protocolo;
   end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar inutilizar numeração de notas.' + #13#13 + 'InutilizaNumeroNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.GuardarLoteNFeVenda(const sCNPJEmitente: String;
  const Ano, Numero, NumeroLote: Integer; const Recibo : String);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBVENDAS Set');
      SQL.Add('    LOTE_NFE_ANO    = ' + IfThen(NumeroLote = 0, 'NULL', qryEmitenteLOTE_ANO_NFE.AsString));
      SQL.Add('  , LOTE_NFE_NUMERO = ' + IfThen(NumeroLote = 0, 'NULL', FormatFloat('#########', NumeroLote)));
      SQL.Add('  , LOTE_NFE_RECIBO = ' + IfThen(Recibo = EmptyStr, 'NULL', QuotedStr(Trim(Recibo))));
      SQL.Add('Where CODEMP     = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('  and ANO        = ' + FormatFloat('#########', Ano));
      SQL.Add('  and CODCONTROL = ' + FormatFloat('#########', Numero));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('GuardarLoteNFeVenda > ' + E.Message);
  end;
end;

procedure TDMNFe.GuardarLoteNFeEntrada(const sCNPJEmitente: String;
  const Ano, Numero, NumeroLote: Integer; const Recibo : String);
begin
  try
    with IBSQL do
    begin
      SQL.Clear;
      SQL.Add('Update TBCOMPRAS Set');
      SQL.Add('    LOTE_NFE_ANO    = ' + IfThen(NumeroLote = 0, 'NULL', qryEmitenteLOTE_ANO_NFE.AsString));
      SQL.Add('  , LOTE_NFE_NUMERO = ' + IfThen(NumeroLote = 0, 'NULL', FormatFloat('#########', NumeroLote)));
      SQL.Add('  , LOTE_NFE_RECIBO = ' + IfThen(Recibo = EmptyStr, 'NULL', QuotedStr(Trim(Recibo))));
      SQL.Add('Where CODEMP     = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('  and ANO        = ' + FormatFloat('#########', Ano));
      SQL.Add('  and CODCONTROL = ' + FormatFloat('#########', Numero));

      ExecQuery;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('GuardarLoteNFeEntrada > ' + E.Message);
  end;
end;

function TDMNFe.ConsultarNumeroLoteNFeACBr(const sCNPJEmitente: String;
  sNumeroRecibo: String; var sChaveNFe, sProtocolo, sRetorno: String; var dDHEnvio : TDateTime): Boolean;
var
  sTextoRetorno : TStringList;
  bReturn : Boolean;
begin
  sTextoRetorno := TStringList.Create;

  try

    try

      LerConfiguracao(sCNPJEmitente);

      with ACBrNFe do
      begin
        WebServices.Recibo.Recibo := sNumeroRecibo;

        bReturn := WebServices.Recibo.Executar;

        // Verificar se houve retorno
        if bReturn then
          bReturn := (WebServices.Recibo.NFeRetorno.ProtNFe.Count = 1);

        // Verificar se o retorno foi de NF-e autorizada
        if bReturn then
          bReturn := (WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].cStat = PROCESSO_NFE_AUTORIZADA);

        if bReturn then
        begin
          sChaveNFe  := WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].chNFe;
          sProtocolo := WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].nProt;
          dDHEnvio   := WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].dhRecbto;
        end;

        if ( WebServices.Recibo.NFeRetorno.ProtNFe.Count = 1 ) then
        begin
          sTextoRetorno.Add( 'Ambiente    : ' + IntToStr( Ord(WebServices.Recibo.NFeRetorno.tpAmb) ) );
          sTextoRetorno.Add( 'Versão App. : ' + WebServices.Recibo.NFeRetorno.verAplic );
          sTextoRetorno.Add( 'Status Trn. : ' + IntToStr(WebServices.Recibo.NFeRetorno.cStat) + ' - ' + WebServices.Recibo.NFeRetorno.xMotivo );
          sTextoRetorno.Add( '---' );
          sTextoRetorno.Add( 'Emitente    : ' + sCNPJEmitente );
          sTextoRetorno.Add( 'Chave NF-e  : ' + WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].chNFe );
          sTextoRetorno.Add( 'Motivo      : ' + WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].xMotivo );
          sTextoRetorno.Add( 'Mensagem    : ' + WebServices.Recibo.NFeRetorno.xMsg );
          sTextoRetorno.Add( '---' );
          sTextoRetorno.Add( 'Nro. Recibo : ' + WebServices.Recibo.NFeRetorno.nRec );
          sTextoRetorno.Add( 'Data Recibo : ' + FormatDateTime('dd/mm/yyyy', WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].dhRecbto) );
          sTextoRetorno.Add( 'Protocolo   : ' + WebServices.Recibo.NFeRetorno.ProtNFe.Items[0].nProt );

          sRetorno := sTextoRetorno.Text;
        end;
      end;

    except
      On E : Exception do
      begin
        ShowError('Erro ao tentar consultar número de lote/recibo de envio de NF-e.' + #13#13 + 'ConsultarNumeroLoteNFeACBr() --> ' + e.Message);
        Result := False;
      end;
    end;

  finally
    sTextoRetorno.Free;
    Result := bReturn;
  end;
end;

function TDMNFe.ConsultarChaveNFeACBr(const sCNPJEmitente, sChave: String;
  var iSerieNFe, iNumeroNFe, iTipoNFe : Integer; var DestinatarioNFE, FileNameXML, ChaveNFE,
  ProtocoloNFE : String; var DataEmissao : TDateTime; const Imprimir: Boolean): Boolean;
var
  NomeArq    : String;
  iNumeroTmp : Integer;
const
  TERMINATE_FILENAME     = '-nfe.xml';
  TERMINATE_FILENAME_NEW = '-procNfe.xml';
begin
  try

    LerConfiguracao(sCNPJEmitente);

    with ACBrNFe do
    begin

      if FileExists(FileNameXML) then
      begin

        // Consultar pelo Arquivo NF-e

        NotasFiscais.Clear;
        NotasFiscais.LoadFromFile(FileNameXML);
        Result := ACBrNFe.Consultar;

        if (NotasFiscais.Count = 1) then
        begin
          iSerieNFe   := NotasFiscais.Items[0].NFe.Ide.Serie;
          iNumeroNFe  := NotasFiscais.Items[0].NFe.Ide.nNF;
          iTipoNFe    := Ord(NotasFiscais.Items[0].NFe.Ide.tpNF);
          DataEmissao := NotasFiscais.Items[0].NFe.Ide.dEmi;
        end;

        // (INICIO) Adicionando TAG de Protocolo no Arquivo
        if Result then
        begin
          NomeArq := FileNameXML;

          if ( Pos(AnsiLowerCase(TERMINATE_FILENAME), AnsiLowerCase(NomeArq)) > 0 ) then
             NomeArq := StringReplace(NomeArq, TERMINATE_FILENAME, TERMINATE_FILENAME_NEW, [rfIgnoreCase]);

          NotasFiscais.Items[0].SaveToFile(NomeArq);

          FileNameXML := NomeArq;
        end;
        // (FINAL) Adicionando TAG de Protocolo no Arquivo

      end
      else
      begin

        // Consultar pela Chave NF-e

        WebServices.Consulta.NFeChave := sChave;
        Result := WebServices.Consulta.Executar;

      end;

      if Result then
      begin
        ChaveNFE     := WebServices.Consulta.NFeChave;
        ProtocoloNFE := WebServices.Consulta.Protocolo;

        // Atualizar contador do número da NF-e

        iNumeroTmp := GetNextID('TBEMPRESA'
          , 'NUMERO_NFE'
          , 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFE = ' + IntToStr(iSerieNFe));

        if ( iNumeroNFe = iNumeroTmp ) then
        begin
          UpdateNumeroNFe(sCNPJEmitente, iSerieNFe, iNumeroNFe);
          UpdateLoteNFe(sCNPJEmitente, YearOf(DataEmissao), iNumeroNFe);
        end;
      end;

    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar consultar NF-e pela chave.' + #13#13 + 'ConsultarChaveNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;
end;

function TDMNFe.DownloadNFeACBr(const sCNPJEmitente, sCNPJDestinatario, sChaveNFe: String;
  var FileNameXML: String): Boolean;
begin
  try

    LerConfiguracao(sCNPJEmitente);

    with ACBrNFe do
    begin

      DownloadNFe.Download.Chaves.Clear;
      DownloadNFe.Download.Chaves.Add.chNFe := sChaveNFe;
      DownloadNFe.Download.CNPJ             := sCNPJDestinatario;

      if ( WebServices.DownloadNFe.Executar ) then
        FileNameXML := WebServices.DownloadNFe.retDownloadNFe.GetNamePath
      else
        raise Exception.Create('Erro ao tentar fazer download do arquivo XML do servidor da SEFA.' + #13 + WebServices.DownloadNFe.RetornoWS);
(*
      EventoNFe.Evento.Clear;
      with EventoNFe.Evento.Add do
      begin
        infEvento.chNFe := sChaveNFe;
        infEvento.CNPJ  := IfThen(Trim(sCNPJDestinatario) = EmptyStr, sCNPJEmitente, sCNPJDestinatario);
        infEvento.dhEvento := Now;
        infEvento.tpEvento := teManifDestConfirmacao;
        infEvento.cOrgao   := 91;
      end;
      EnviarEventoNFe(1);
*)

      if not FileExists(FileNameXML) then
        raise Exception.Create(Format('Arquivo %s não encontrado.', [QuotedStr(FileNameXML)]))
      else
        Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar executar download da NF-e.' + #13#13 + 'DownloadNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;
end;

procedure TDMNFe.ConfigurarEmail(const sCNPJEmitente, sDestinatario, sAssunto, sMensagem: String);
var
  sAssinaturaHtml,
  sAssinaturaTxt : String;
begin
  CarregarConfiguracoesEmpresa(sCNPJEmitente, sAssunto, sAssinaturaHtml, sAssinaturaTxt);

  // Configurar conta de e-mail no Fast Report
  DMBusiness.ConfigurarEmail(sCNPJEmitente, sDestinatario, sAssunto, sMensagem);
end;

procedure TDMNFe.frrAutorizacaoCompraGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;
end;

procedure TDMNFe.frrNotaEntregaXGetValue(const VarName: string;
  var Value: Variant);
begin
  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FImprimirCabecalho, 1, 0);
end;

function TDMNFe.EnviarEmail_Generico(const sCNPJEmitente, sNumeroDocumento, sEmailDestinatario : String;
  const sArquivo : String = '') : Boolean;
var
  sEmailAssunto     ,
  sEmailEmpresa     ,
  sMensagem  ,
  sDocumento : String;
  sAssinaturaHtml ,
  sAssinaturaTxt  : String;
  sANX,
  sMSG,
  sCC : TStringList;
const
  MSG_REF = 'Referente a Cotação No. %s';
begin

  try

    sANX := TStringList.Create;
    sMSG := TStringList.Create;
    sCC  := TStringList.Create;

    try

      LerConfiguracao( sCNPJEmitente );

      AbrirEmitente( sCNPJEmitente );

      if Trim(sArquivo) <> EmptyStr then
        if not FilesExists(sArquivo) then
          raise Exception.Create(Format('Arquivo %s não encontrado.', [QuotedStr(sArquivo)]));

      with ACBrNFe do
      begin
        NotasFiscais.Clear;
        NotasFiscais.Add;

        // Montar identificação do documento para título de e-mail

        sMensagem  := Format(MSG_REF, [sNumeroDocumento]);
        sDocumento := 'Cotação No. ' + sNumeroDocumento;

        CarregarConfiguracoesEmpresa(sCNPJEmitente, sEmailAssunto, sAssinaturaHtml, sAssinaturaTxt);

        sEmailEmpresa := GetEmailEmpresa( sCNPJEmitente );
        sEmailAssunto := GetNomeFantasiaEmpresa( sCNPJEmitente ) + ' - ' + sDocumento;

        sCC.Add( sEmailEmpresa );

        sMSG.Add( sMensagem );
        sMSG.Add('');
        sMSG.Add( sAssinaturaTxt );
        sMSG.Add('--');
        sMSG.Add('FAVOR NÃO RESPONDER ESTE E-MAIL.');
        sMSG.Add('Composição automática de e-mail executada pelo sistema ' + GetProductName + ' (Versão ' + GetVersion +
          '), desenvolvido pela empresa ' + GetCompanyName + '.' + #13#13 + GetCopyright);

        if FileExists( sArquivo ) then
          sANX.Add( sArquivo );

        NotasFiscais.Items[0].EnviarEmail(
            gContaEmail.Servidor_SMTP
          , IntToStr(gContaEmail.Porta_SMTP)
          , gContaEmail.Conta
          , gContaEmail.Senha
          , gContaEmail.Conta
          , sEmailDestinatario
          , sEmailAssunto
          , sMSG
          , gContaEmail.ConexaoSeguraSSL // SSL - Conexão Segura
          , False                        // Enviar PDF junto
          , sCC                          // Lista com emails que serão enviado cópias - TStrings
          , sANX                         // Lista de anexos - TStrings
          , False                        // Pede confirmação de leitura do email
          , False                        // Aguarda Envio do Email(não usa thread)
          , GetNomeFantasiaEmpresa( sCNPJEmitente ) // Nome do Rementente
          , gContaEmail.ConexaoSeguraSSL );         // Auto TLS

        Result := True;
      end;

    except
      On E : Exception do
      begin
        ShowError(Format('Erro ao tentar enviar para e-mail para ''%s''.', [sEmailDestinatario]) + #13#13 +
          'EnviarEmail_Generico() --> ' + e.Message);
        Result := False;
      end;
    end;

  finally
    sANX.Free;
    sMSG.Free;
    sCC.Free;
  end;

end;

function TDMNFe.ImprimirCupomNaoFiscal(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer): Boolean;
begin
  Result := ImprimirCupomNaoFiscal_PORTA(sCNPJEmitente, iCodigoCliente, sDataHoraSaida, iAnoVenda, iNumVenda);
end;

procedure TDMNFe.AbrirVendaCartaCredito(AnoVenda, NumeroVenda: Integer);
begin
  if (not qryCalculoImposto.Active) or qryCalculoImposto.IsEmpty then
    with qryCalculoImposto do
    begin
      Close;
      ParamByName('anovenda').AsInteger := AnoVenda;
      ParamByName('numvenda').AsInteger := NumeroVenda;
      Open;
    end;

  with qryVendaCartaCredito do
  begin
    Close;
    ParamByName('anovenda').AsInteger := AnoVenda;
    ParamByName('numvenda').AsInteger := NumeroVenda;
    Open;
  end;
end;

function TDMNFe.GetModeloDF: Integer;
begin
  Result := Ord(ACBrNFe.Configuracoes.Geral.ModeloDF);
end;

function TDMNFe.GetVersaoDF: Integer;
begin
  Result := Ord(ACBrNFe.Configuracoes.Geral.VersaoDF);
end;

function TDMNFe.IsEstacaoEmiteNFCe : Boolean;
begin
  Result := ConfigACBr.ckEmitirNFCe.Checked;
end;

function TDMNFe.IsEstacaoEmiteNFCeResumido : Boolean;
begin
  Result := ConfigACBr.ckEmitirNFCe.Checked and False;
end;

function TDMNFe.ImprimirCupomOrcamento(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer): Boolean;
var
  aEcfTipo   : TEcfTipo;
  aEcfConfig : TEcfConfiguracao;
  aEcf : TEcfFactory;
begin
  LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);

  if GetCupomNaoFiscalTipoEmissaoID = -1 then
    aEcfTipo := ecfTEXTO
  else
    aEcfTipo := TEcfTipo(GetCupomNaoFiscalTipoEmissaoID);

  AbrirEmitente(sCNPJEmitente);
  AbrirDestinatario(iCodigoCliente);
  AbrirVenda(iAnoVenda, iNumVenda);
  AbrirNFeEmitida(iAnoVenda, iNumVenda);

  aEcfConfig.Dll              := EmptyStr;
  aEcfConfig.Impressora       := GetCupomNaoFiscalPortaNM;
  aEcfConfig.ModeloEspecifico := GetCupomNaoFiscalModeloEspID;
  aEcfConfig.Porta            := GetCupomNaoFiscalPortaDS;
  aEcfConfig.Empresa  := AnsiUpperCase( qryEmitenteNMFANT.AsString );
  aEcfConfig.Endereco := RemoveAcentos( Trim(qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString + ', ' + qryEmitenteNUMERO_END.AsString) );
  aEcfConfig.Bairro   := RemoveAcentos( Trim(qryEmitenteBAI_NOME.AsString) );
  aEcfConfig.Fone     := StrFormatarFONE(qryEmitenteFONE.AsString);
  aEcfConfig.Cep      := StrFormatarCEP(qryEmitenteCEP.AsString);
  aEcfConfig.Cidade   := RemoveAcentos( qryEmitenteCID_NOME.AsString + '/' + qryEmitenteEST_SIGLA.AsString );
  aEcfConfig.Cnpj     := StrFormatarCnpj( sCNPJEmitente );
  aEcfConfig.InscEstadual   := qryEmitenteIE.AsString;
  aEcfConfig.ID             := FormatFloat('###0000000', iNumVenda);
  aEcfConfig.ImprimirGliche := True;

  aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
  try

    with aEcf do
    begin
      Ecf.SoftHouse := GetCompanyName;
      Ecf.Sistema   := GetProductName;
      Ecf.Versao    := GetProductVersion;

      Ecf.Identifica_Cupom(Now, FormatFloat('###0000000', iNumVenda), qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString);

      if ( qryDestinatario.FieldByName('CODIGO').AsInteger <> CONSUMIDOR_FINAL_CODIGO ) then
        Ecf.Identifica_Consumidor( IfThen(StrIsCPF(qryDestinatario.FieldByName('CNPJ').AsString), StrFormatarCpf(qryDestinatario.FieldByName('CNPJ').AsString), StrFormatarCnpj(qryDestinatario.FieldByName('CNPJ').AsString))
          , AnsiUpperCase(qryDestinatario.FieldByName('NOMEFANT').AsString)
          , Trim(qryDestinatario.FieldByName('TLG_SIGLA').AsString + ' ' + qryDestinatario.FieldByName('LOG_NOME').AsString + ', ' +
            qryDestinatario.FieldByName('NUMERO_END').AsString + ' - ' + qryDestinatario.FieldByName('BAI_NOME').AsString) + ' (' + qryDestinatario.FieldByName('CID_NOME').AsString + ')'
          , Trim(Copy(Trim(qryDestinatario.FieldByName('FONES').AsString), 1, Length(Trim(qryDestinatario.FieldByName('FONES').AsString)) - 1))
        );

      Ecf.Titulo_Cupom('*** ORCAMENTO ***');

      qryDadosProduto.First;

      while not qryDadosProduto.Eof do
      begin
        Ecf.Incluir_Item(FormatFloat('00', qryDadosProduto.FieldByName('SEQ').AsInteger)
          , qryDadosProduto.FieldByName('CODPROD').AsString
          , RemoveAcentos( AnsiUpperCase(qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString) )
          , Trim(FormatFloat(',0.###', qryDadosProduto.FieldByName('QTDE').AsCurrency) + ' ' + Copy(Trim(qryDadosProduto.FieldByName('UNP_SIGLA').AsString), 1, 2))
          , FormatFloat(',0.00',  qryDadosProduto.FieldByName('PFINAL').AsCurrency)
          , 'T0'
          , FormatFloat(',0.00',  (qryDadosProduto.FieldByName('QTDE').AsCurrency * qryDadosProduto.FieldByName('PFINAL').AsCurrency))
        );

        qryDadosProduto.Next;
      end;

      Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), True );
      Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
      Ecf.Linha;
      Ecf.TotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency)  );

      qryFormaPagtos.First;

      while not qryFormaPagtos.Eof do
      begin
        Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
          FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency));
        qryFormaPagtos.Next;
      end;

      Ecf.Pular_Linha(PULAR_LINHA_FINAL);
    end;

  finally
    aEcf.Ecf.Finalizar;
    aEcf.Free;
  end;
end;

function TDMNFe.GerarEnviarCCeACBr(const sCNPJEmitente: String;
  const ControleCCe: Integer; sCondicaoUso : String): Boolean;
var
  bRetorno    : Boolean;
  sFileNameXML,
  sErrorMsg   ,
  sCorrecao   ,
  sRetornoXML ,
  sProtocolo  : String;
  iNumeroLote  ,
  iNumeroCarta : Integer;
  sLOG : TStringList;
begin
  sLOG := TStringList.Create;

  try
    try

      LerConfiguracao(sCNPJEmitente, tipoDANFEFast);

      AbrirEmitente(sCNPJEmitente);
      AbrirCartaCorrecao(sCNPJEmitente, ControleCCe);
      AbrirNFe(sCNPJEmitente, qryCartaCorrecaoNFeNFE_MODELO.AsInteger, qryCartaCorrecaoNFeNFE_SERIE.AsString, qryCartaCorrecaoNFeNFE_NUMERO.AsInteger);

      with ACBrNFe do
      begin

        if ( DelphiIsRunning ) then
          bRetorno := True
        else
          bRetorno := ACBrNFe.WebServices.StatusServico.Executar;

        if not bRetorno then
          Exit;

        iNumeroCarta := GetNextID('TBEMPRESA', 'CARTA_CORRECAO_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente));

        Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeMODELO.AsInteger);
        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeVERSAO.AsInteger);

        sFileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryNFeXML_FILENAME.AsString;
        ForceDirectories( ExtractFilePath(sFileNameXML) );
        qryNFeEmitidaXML_FILE.SaveToFile( sFileNameXML );

        NotasFiscais.Clear;
        if not NotasFiscais.LoadFromString( qryNFeEmitidaXML_FILE.AsWideString ) then
          raise Exception.Create('Não foi possível carregar o XML da Nota Fiscal Eletrônica correspondente!' + #13 + sFileNameXML);

        // Numero do Lote de Envio
        iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
        sCorrecao   := Trim(qryCartaCorrecaoNFeCCE_TEXTO.AsString);

        EventoNFe.Evento.Clear;
        EventoNFe.idLote := iNumeroLote;

        with EventoNFe.Evento.Add do
        begin
          //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
          //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

          infEvento.cOrgao := qryEmitenteEST_COD.AsInteger; // Código IBGE do Estado
          infEvento.chNFe  := qryNFeCHAVE.AsString;
          infEvento.CNPJ   := sCNPJEmitente;
          infEvento.dhEvento   := GetDateTimeDB;
          infEvento.tpEvento   := teCCe;
          infEvento.nSeqEvento := iNumeroCarta;
          infEvento.detEvento.descEvento := AnsiUpperCase(DESC_LOG_EVENTO_CCE_NFE);
          infEvento.detEvento.xCorrecao  := sCorrecao;
          infEvento.detEvento.xCondUso   := Trim(sCondicaoUso);
        end;

        // Enviar o evento de CC-e

        if EnviarEventoNFe(iNumeroLote) then
        begin
          with WebServices.EnvEvento do
          begin
            bRetorno := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e

            // Montar LOG de Retorno

            sLOG.BeginUpdate;
            sLOG.Clear;
            sLOG.Add('Ambiente  : ' + IntToStr( Ord(Configuracoes.WebServices.Ambiente) ));
            sLOG.Add('-');
            sLOG.Add('Evento    : ' + AnsiUpperCase(DESC_LOG_EVENTO_CCE_NFE));
            sLOG.Add('Emitente  : ' + sCNPJEmitente);
            sLOG.Add('Chave NF-e: ' + qryNFeCHAVE.AsString);
            sLOG.Add('-');
            sLOG.Add('Data/Hora Evento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));
            sLOG.Add('Número Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
            sLOG.Add('Código Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
            sLOG.Add('Motivo Status   : ' + EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
            sLOG.Add('-');
            sLOG.Add(EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
            sLOG.EndUpdate;

            if bRetorno then
            begin
              EventoNFe.GerarXML;
              sRetornoXML := EventoRetorno.retEvento.Items[0].RetInfEvento.XML;
              sProtocolo  := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;

              // Gravar dados de retorno no resgitro da CC-e
              qryCartaCorrecaoNFe.Edit;
              qryCartaCorrecaoNFeCCE_DATA.Value  := GetDateDB;
              qryCartaCorrecaoNFeCCE_HORA.Value  := GetTimeDB;
              qryCartaCorrecaoNFeNUMERO.Value    := iNumeroCarta;
              qryCartaCorrecaoNFePROTOCOLO.Value := EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
              qryCartaCorrecaoNFeXML.LoadFromFile( EventoNFe.ObterNomeArquivo(teCCe) );
              qryCartaCorrecaoNFe.Post;
              qryCartaCorrecaoNFe.ApplyUpdates;

              CommitTransaction;

              UpdateNumeroCCe(sCNPJEmitente, iNumeroCarta);
            end
            else
            begin
              raise Exception.CreateFmt(
                'Ocorreu o seguinte erro ao enviar a CC-e da Nota Fiscal Eletrônica:'  + sLineBreak +
                'Código: %d' + sLineBreak +
                'Motivo: %s', [
                  EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
                  EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
              ]);
            end;

          end;

          if bRetorno then
            ImprimirEvento;

        end;

      end;

    except
      On E : Exception do
      begin
        bRetorno := False;

        sErrorMsg := E.Message;
        ShowError('Erro ao tentar gerar/enviar CC-e.' + #13#13 + 'GerarEnviarCCeACBr() --> ' + sErrorMsg);
      end;
    end;
  finally
    // Gravar LOG

    with cdsLOG do
    begin
      Open;
      Append;

      cdsLOGUSUARIO.AsString       := GetUserApp;
      cdsLOGDATA_HORA.AsDateTime   := Now;
      cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
      cdsLOGDESCRICAO.AsString     := AnsiUpperCase(DESC_LOG_EVENTO_CCE_NFE);
      cdsLOGESPECIFICACAO.AsString := sLOG.Text;

      Post;
      ApplyUpdates;
      CommitTransaction;
    end;

    sLOG.Free;
    Result := bRetorno;
  end;
end;

procedure TDMNFe.AbrirNFC(const aCNPJEmitente: String;
  const aCodigoNFC: Integer);
begin
  with qryNFCCalculoImposto do
  begin
    Close;
    ParamByName('numero').AsInteger := aCodigoNFC;
    ParamByName('empresa').AsString := aCNPJEmitente;
    Open;
  end;

  with qryNFCDadosProduto do
  begin
    Close;
    ParamByName('numero').AsInteger := aCodigoNFC;
    ParamByName('empresa').AsString := aCNPJEmitente;
    Open;
  end;
end;

procedure TDMNFe.AbrirNFe(const sCNPJEmitente: String;
  const Modelo: Smallint; Serie: String; Numero: Integer);
begin
  with qryNFe do
  begin
    Close;
    ParamByName('empresa').AsString := sCNPJEmitente;
    ParamByName('numero').AsInteger := Numero;
    ParamByName('serie').AsString   := Serie;
    ParamByName('modelo').AsInteger := Modelo;
    Open;
  end;
end;

procedure TDMNFe.AbrirCartaCorrecao(const sCNPJEmitente: String;
  const ControleCCe: Integer);
begin
  with qryCartaCorrecaoNFe do
  begin
    Close;
    ParamByName('empresa').AsString := sCNPJEmitente;
    ParamByName('codigo').AsInteger := ControleCCe;
    Open;
  end;
end;

function TDMNFe.GerarNFCeOnLineACBr(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer; var iSerieNFCe, iNumeroNFCe: Integer;
  var FileNameXML, ChaveNFCe, ProtocoloNFCe, ReciboNFCe: String;
  var iNumeroLote: Int64; var Denegada: Boolean;
  var DenegadaMotivo: String; const Imprimir: Boolean): Boolean;
var
  DtHoraEmiss : TDateTime;
  sErrorMsg   : String;
begin
(*
  IMR - 09/12/2014 :
    Desenvolvimento da função.
*)
  try

    LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);

    if ( DelphiIsRunning ) then
      Result := True
    else
      Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    GerarNFCEACBr(sCNPJEmitente, iCodigoCliente, sDataHoraSaida, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFCe, iNumeroNFCe, FileNameXML);

    iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

    if ( Result ) then
    begin
      ChaveNFCE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFCE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFCE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFCe(sCNPJEmitente, qryEmitenteSERIE_NFCE.AsInteger, iNumeroNFCe);
    end;

  except
    On E : Exception do
    begin
      sErrorMsg := E.Message;

      // Diretrizes de tomada de decisão quando a NFCe enviada não é aceita

      if ( Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr ) then
        if ReciboNaoExisteNaVenda(ACBrNFe.WebServices.Retorno.Recibo) then
          GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, ACBrNFe.WebServices.Retorno.Recibo);

      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Count = 1 ) then
        Case ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat of
          REJEICAO_NFE_NOTA_DENEGADA:
            begin
              UpdateNumeroNFCe(sCNPJEmitente, qryEmitenteSERIE_NFCE.AsInteger, iNumeroNFCe);

              if GetPermititNFeDenegada(sCNPJEmitente) then
              begin
                Result := True;

                Denegada       := True;
                DenegadaMotivo := 'NFC-e denegada por ' + ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo;

                ChaveNFCE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
                ProtocoloNFCE := ACBrNFe.WebServices.Retorno.Protocolo;
                ReciboNFCE    := ACBrNFe.WebServices.Retorno.Recibo;

                Exit;
              end
              else
              begin
                // Remover Lote da Venda
                GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

                sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                  'Favor gerar NFC-e novamente!';
              end;
            end;

          REJEICAO_NFE_DUPLICIDADE:
            begin
              UpdateNumeroNFCe(sCNPJEmitente, qryEmitenteSERIE_NFCE.AsInteger, iNumeroNFCe);

              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                'Favor gerar NFC-e novamente!';
            end;

          REJEICAO_NFE_BC_ICMS_ERR, REJEICAO_NFE_TO_ICMS_ERR, REJEICAO_NFE_TO_PROD_ERR:
            begin
              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13 +
                'Favor validar dados e NFC-e novamente!';
            end;

          else
            sErrorMsg := IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].cStat) + ' - ' +
              ACBrNFe.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].xMotivo + #13#13 +
              'Favor entrar em contato com suporte e apresentar esta mensagem!';
        end;

      ShowError('Erro ao tentar gerar NFC-e.' +
        IfThen(Trim(ACBrNFe.WebServices.Retorno.Recibo) = EmptyStr, EmptyStr, #13 + 'Recibo: ' + ACBrNFe.WebServices.Retorno.Recibo) +
        #13#13 + 'GerarNFCeOnLineACBr() --> ' + sErrorMsg);

      Result := False;
    end;
  end;

end;

procedure TDMNFe.GerarNFCeACBr(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer; var DtHoraEmiss: TDateTime; var iSerieNFCe,
  iNumeroNFCe: Integer; var FileNameXML: String);
var
  cPercentualTributoAprox,
  vTotalTributoAprox     : Currency;
begin
(*
  IMR - 28/11/2014 :
    Construção do procedimento para se gerar NFC-e.
*)

  try

    LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);

    ACBrNFe.Configuracoes.Geral.RetirarAcentos := True;
    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;
    ACBrNFe.Configuracoes.Geral.VersaoDF := TpcnVersaoDF(ConfigACBr.cbVersaoDF.ItemIndex);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );

    if ( GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID ) then
      raise Exception.Create('O segmento da empresa não permite a emissão de NFC-e!');

    iSerieNFCe  := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFCe := GetNextID('TBEMPRESA', 'NUMERO_NFCE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente) + ' and SERIE_NFCE = ' + qryEmitenteSERIE_NFCE.AsString);
    DtHoraEmiss := GetDateTimeDB;

    ACBrNFe.NotasFiscais.Clear;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF       := iNumeroNFCe;
      Ide.natOp     := 'VENDA'; // Da CFOP 5101 // qryCalculoImportoCFOP_DESCRICAO.AsString;
      Ide.idDest    := TpcnDestinoOperacao( IfThen(Trim(qryEmitenteEST_SIGLA.AsString) = Trim(qryDestinatario.FieldByName('EST_SIGLA').AsString), 0, 1) );

      if ( qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := MODELO_NFCE;
      Ide.serie     := iSerieNFCe;
      Ide.nNF       := iNumeroNFCe;
      Ide.dEmi      := GetDateDB;
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) );
      Ide.cUF       := NotaUtil.UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;
      Ide.finNFe    := fnNormal;
      Ide.tpImp     := tiNFCe;
      Ide.indFinal  := cfConsumidorFinal;
      Ide.indPres   := pcPresencial;
      Ide.dSaiEnt   := StrToDateTime( FormatDateTime('dd/mm/yyyy', GetDateDB) );
      Ide.hSaiEnt   := StrToDateTime( FormatDateTime('hh:mm:ss',   GetTimeDB) );

//     Ide.dhCont := date;
//     Ide.xJust  := 'Justificativa Contingencia';

  //Para NFe referenciada use os campos abaixo
  {     with Ide.NFref.Add do
        begin
          refNFe       := ''; //NFe Eletronica

          RefNF.cUF    := 0;  // |
          RefNF.AAMM   := ''; // |
          RefNF.CNPJ   := ''; // |
          RefNF.modelo := 1;  // |- NFe Modelo 1/1A
          RefNF.serie  := 1;  // |
          RefNF.nNF    := 0;  // |

          RefNFP.cUF     := 0;  // |
          RefNFP.AAMM    := ''; // |
          RefNFP.CNPJCPF := ''; // |
          RefNFP.IE      := ''; // |- NF produtor Rural
          RefNFP.modelo  := ''; // |
          RefNFP.serie   := 1;  // |
          RefNFP.nNF     := 0;  // |

          RefECF.modelo  := ECFModRef2B; // |
          RefECF.nECF    := '';          // |- Cupom Fiscal
          RefECF.nCOO    := '';          // |
        end;
  }
      Emit.CNPJCPF := qryEmitenteCNPJ.AsString;
      Emit.xNome   := qryEmitenteRZSOC.AsString;
      Emit.xFant   := qryEmitenteNMFANT.AsString;
      Emit.CRT     := TpcnCRT(qryEmitenteTIPO_REGIME_NFE.AsInteger);

      Emit.EnderEmit.fone    := qryEmitenteFONE.AsString;
      Emit.EnderEmit.CEP     := StrToInt( qryEmitenteCEP.AsString );
      Emit.EnderEmit.xLgr    := Trim( qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString );
      Emit.EnderEmit.nro     := Trim( qryEmitenteNUMERO_END.AsString );
      Emit.EnderEmit.xCpl    := Trim( qryEmitenteCOMPLEMENTO.AsString ) + '.';
      Emit.EnderEmit.xBairro := Trim( qryEmitenteBAI_NOME.AsString );
      Emit.EnderEmit.cMun    := qryEmitenteCID_IBGE.AsInteger;
      Emit.EnderEmit.xMun    := qryEmitenteCID_NOME.AsString;
      Emit.EnderEmit.UF      := qryEmitenteEST_SIGLA.AsString;
      Emit.EnderEmit.cPais   := qryEmitentePAIS_ID.AsInteger;
      Emit.EnderEmit.xPais   := qryEmitentePAIS_NOME.AsString;

      Emit.IEST  := EmptyStr;
      Emit.IM    := EmptyStr; // Preencher no caso de existir serviços na nota
      Emit.CNAE  := EmptyStr; // Verifique na cidade do emissor da NFe se é permitido
                              // a inclusão de serviços na NFCe

  //Para NFe Avulsa preencha os campos abaixo
  {      Avulsa.CNPJ    := '';
        Avulsa.xOrgao  := '';
        Avulsa.matr    := '';
        Avulsa.xAgente := '';
        Avulsa.fone    := '';
        Avulsa.UF      := '';
        Avulsa.nDAR    := '';
        Avulsa.dEmi    := now;
        Avulsa.vDAR    := 0;
        Avulsa.repEmi  := '';
        Avulsa.dPag    := now;             }

      Dest.CNPJCPF := qryDestinatario.FieldByName('CNPJ').AsString;
      Dest.xNome   := qryDestinatario.FieldByName('NOME').AsString + IfThen(GetImprimirCodClienteNFe(sCNPJEmitente), ' ' + FormatFloat('##00000', qryDestinatario.FieldByName('CODIGO').AsInteger));
      Dest.Email   := Trim(AnsiLowerCase(qryDestinatario.FieldByName('EMAIL').AsString));

      if ( qryDestinatario.FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
      begin
        if (AnsiUpperCase(Trim(qryDestinatario.FieldByName('INSCEST').AsString)) = 'ISENTO') or (Trim(qryDestinatario.FieldByName('INSCEST').AsString) = EmptyStr) then
          Dest.indIEDest     := inIsento
        else
          Dest.indIEDest     := inContribuinte;

        Dest.IE              := Trim(qryDestinatario.FieldByName('INSCEST').AsString);
        Dest.ISUF            := EmptyStr;
      end
      else
      begin
        Dest.indIEDest       := inNaoContribuinte;
        Dest.IE              := EmptyStr;
        Dest.ISUF            := EmptyStr;
      end;

      Dest.EnderDest.Fone    := qryDestinatario.FieldByName('FONE').AsString;
      Dest.EnderDest.CEP     := qryDestinatario.FieldByName('CEP').AsInteger;
      Dest.EnderDest.xLgr    := Trim( qryDestinatario.FieldByName('TLG_SIGLA').AsString + ' ' + qryDestinatario.FieldByName('LOG_NOME').AsString );
      Dest.EnderDest.nro     := qryDestinatario.FieldByName('NUMERO_END').AsString;
      Dest.EnderDest.xCpl    := qryDestinatario.FieldByName('COMPLEMENTO').AsString;
      Dest.EnderDest.xBairro := qryDestinatario.FieldByName('BAI_NOME').AsString;
      Dest.EnderDest.cMun    := qryDestinatario.FieldByName('CID_IBGE').AsInteger;
      Dest.EnderDest.xMun    := qryDestinatario.FieldByName('CID_NOME').AsString;
      Dest.EnderDest.UF      := qryDestinatario.FieldByName('EST_SIGLA').AsString;
      Dest.EnderDest.cPais   := qryDestinatario.FieldByName('PAIS_ID').AsInteger;  // 1058;
      Dest.EnderDest.xPais   := qryDestinatario.FieldByName('PAIS_NOME').AsString; // 'BRASIL';

  //Use os campos abaixo para informar o endereço de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

      // Adicionando Produtos

      vTotalTributoAprox := 0.0;

      qryDadosProduto.First;

      while not qryDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // Número sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryDadosProduto.FieldByName('CODPROD').AsString;

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString
          else
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI').AsString + ' ' + qryDadosProduto.FieldByName('ANO_FAB_MODELO_VEICULO').AsString;

          Prod.NCM      := qryDadosProduto.FieldByName('NCM_SH').AsString;            // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.EXTIPI   := EmptyStr;
          Prod.CFOP     := '5101'; // qryDadosProdutoCFOP_COD.AsString;

          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a função "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
            Prod.cEAN   := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
          else
            Prod.cEAN   := EmptyStr;

          Prod.uCom     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qCom     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency   // I10a  Valor Unitário de comercialização
          else
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT').AsCurrency;           // I10a  Valor Unitário de comercialização

          Prod.vProd    := qryDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Serviços

          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a função "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
            Prod.cEANTrib := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
          else
            Prod.cEANTrib := EmptyStr;

          Prod.uTrib     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qTrib     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency  // I14a  Valor Unitário de tributação
          else
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT').AsCurrency;          // I14a  Valor Unitário de tributação

(* EXEMPLO *)
          // NFe.Det[i].Prod.uCom    := 'CX';                                                   = 'UN'
          // NFe.Det[i].Prod.qCom    :=    2;   Vendidas 2 caixas ( com 10 unidades cada )      = 20
          // NFe.Det[i].Prod.vUnCom  :=   50;   R$ 50,00 cada caixa                             = 50,00 / 10 = 5,00
          // NFe.Det[i].Prod.vProd   :=  100;   R$ 100,00 Valor dos produtos                    = 20 * 5,00 = 100,00
          // NFe.Det[i].Prod.uTrib   := 'UN';                                                   = 'UN'
          // NFe.Det[i].Prod.qTrib   :=   20;   2 caixas X 10 unidades por caixa = 20 unidades  = 20
          // NFe.Det[i].Prod.vUnTrib :=    5;   R$ 100,00 / 20 unidades = R$ 5,00 cada unidade  = 100,00 / 20 = 5,00

          Prod.vFrete    := 0;                                        // I15 - Valor Total do Frete
          Prod.vSeg      := 0;                                        // I16 - Valor Total do Seguro
          Prod.vDesc     := qryDadosProduto.FieldByName('TOTAL_DESCONTO').AsCurrency; // I17 - Valor do Desconto

          // Informação Adicional do Produto

          if ( Trim(qryDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr ) then
            infAdProd    := 'Ref.: ' + qryDadosProduto.FieldByName('REFERENCIA').AsString
          else
            infAdProd    := EmptyStr;

  //Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add

  {         with Prod.DI.Add do
            begin
              nDi         := '';
              dDi         := now;
              xLocDesemb  := '';
              UFDesemb    := '';
              dDesemb     := now;
              cExportador := '';

              with adi.Add do
               begin
                 nAdicao     := 1;
                 nSeqAdi     := 1;
                 cFabricante := '';
                 vDescDI     := 0;
               end;
            end;
  }

{
    property tpOP: TpcnTipoOperacao read FtpOP write FtpOP;
    property chassi: string read Fchassi write Fchassi;
    property cCor: string read FcCor write FcCor;
    property xCor: string read FxCor write FxCor;
    property pot: string read Fpot write Fpot;
    property Cilin: string read FCilin write FCilin;
    property pesoL: string read FpesoL write FpesoL;
    property pesoB: string read FpesoB write FpesoB;
    property nSerie: string read FnSerie write FnSerie;
    property tpComb: string read FtpComb write FtpComb;
    property nMotor: string read FnMotor write FnMotor;
    property CMT: string read FCMT write FCMT;
    property dist: string read Fdist write Fdist;
    //property RENAVAM: string read FRENAVAM write FRENAVAM;
    property anoMod: integer read FanoMod write FanoMod;
    property anoFab: integer read FanoFab write FanoFab;
    property tpPint: string read FtpPint write FtpPint;
    property tpVeic: integer read FtpVeic write FtpVeic;
    property espVeic: integer read FespVeic write FespVeic;
    property VIN: string read FVIN write FVIN;
    property condVeic: TpcnCondicaoVeiculo read FcondVeic write FcondVeic;
    property cMod: string read FcMod write FcMod;

    property cCorDENATRAN: string read FcCorDENATRAN write FcCorDENATRAN;
    property lota: integer read Flota write Flota;
    property tpRest: integer read FtpRest write FtpRest;
}

  //Campos específicos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos específicos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos específicos para venda de combustível(distribuidoras)
  {         with Prod.comb do
            begin
              cProdANP := 0;
              CODIF    := '';
              qTemp    := 0;
              UFcons   := '';

              CIDE.qBCprod   := 0 ;
              CIDE.vAliqProd := 0 ;
              CIDE.vCIDE     := 0 ;

              ICMS.vBCICMS   := 0 ;
              ICMS.vICMS     := 0 ;
              ICMS.vBCICMSST := 0 ;
              ICMS.vICMSST   := 0 ;

              ICMSInter.vBCICMSSTDest := 0 ;
              ICMSInter.vICMSSTDest   := 0 ;

              ICMSCons.vBCICMSSTCons := 0 ;
              ICMSCons.vICMSSTCons   := 0 ;
              ICMSCons.UFcons        := '' ;
            end;}

          with Imposto do
          begin
            with ICMS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                // csosnVazio, csosn101, csosn102, csosn103, csosn201, csosn202, csosn203, csosn300, csosn400, csosn500, csosn900

                Case qryDadosProduto.FieldByName('CSOSN').AsInteger of
                  101 : CSOSN := csosn101;
                  102 : CSOSN := csosn102;
                  103 : CSOSN := csosn103;
                  201 : CSOSN := csosn201;
                  202 : CSOSN := csosn202;
                  203 : CSOSN := csosn203;
                  300 : CSOSN := csosn300;
                  400 : CSOSN := csosn400;
                  500 : CSOSN := csosn500;
                  else
                    CSOSN := csosn900;
                end;

                pCredSN     := qryDadosProduto.FieldByName('ALIQUOTA_CSOSN').AsCurrency;
                vCredICMSSN := qryDadosProduto.FieldByName('PFINAL').AsCurrency * pCredSN / 100;

              end
              else
              begin

                Case StrToInt(Copy(qryDadosProduto.FieldByName('CST').AsString, 2, 2)) of
                   0 : CST := cst00;
                  10 : CST := cst10;
                  20 : CST := cst20;
                  30 : CST := cst30;
                  40 : CST := cst40;
                  41 : CST := cst41;
                  50 : CST := cst50;
                  51 : CST := cst51;
                  60 : CST := cst60;
                  70 : CST := cst70;
                  else
                    CST := cst90;
                end;

                ICMS.modBC := dbiValorOperacao;

                if (qryCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
                  ICMS.pRedBC := 0.0
                else
                if (qryDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency <= 0) then
                  ICMS.pRedBC := 0.0
                else
                  ICMS.pRedBC := (100.0 - qryDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency); // qryDadosProduto.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency;


                if (ICMS.pRedBC > 0) or (qryDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency > 0) then
                  ICMS.vBC := qryDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency
                else
                  ICMS.vBC := qryDadosProduto.FieldByName('PFINAL').AsCurrency;

                ICMS.pICMS := qryDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
                ICMS.vICMS := ICMS.vBC * ICMS.pICMS / 100.0;

              end;

              ICMS.orig    := TpcnOrigemMercadoria( StrToInt(Copy(qryDadosProduto.FieldByName('CST').AsString, 1, 1)) );
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;

            end;

            with PIS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST      := pis99;
                PIS.vBC  := 0;
                PIS.pPIS := 0;
                PIS.vPIS := 0;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstPis(qryDadosProduto.FieldByName('CST_PIS_INDICE_ACBR').AsInteger);

                if ( CST = pis99 ) then
                begin
                  PIS.vBC  := 0;
                  PIS.pPIS := 0;
                  PIS.vPIS := 0;
                end
                else
                begin
                  PIS.vBC  := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
                  PIS.pPIS := qryDadosProduto.FieldByName('ALIQUOTA_PIS').AsCurrency;
                  PIS.vPIS := PIS.vBC * PIS.pPIS / 100;
                end;

                PIS.qBCProd   := 0;
                PIS.vAliqProd := 0;

              end;
            end;

            with COFINS do
            begin
              if ( Emit.CRT = crtSimplesNacional ) then
              begin

                CST            := cof99;
                COFINS.vBC     := 0;
                COFINS.pCOFINS := 0;
                COFINS.vCOFINS := 0;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end
              else
              begin

                CST := TpcnCstCofins(qryDadosProduto.FieldByName('CST_COFINS_INDICE_ACBR').AsInteger);

                if ( CST = cof99 ) then
                begin
                  COFINS.vBC     := 0;
                  COFINS.pCOFINS := 0;
                  COFINS.vCOFINS := 0;
                end
                else
                begin
                  COFINS.vBC     := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
                  COFINS.pCOFINS := qryDadosProduto.FieldByName('ALIQUOTA_COFINS').AsCurrency;
                  COFINS.vCOFINS := COFINS.vBC * COFINS.pCOFINS / 100;
                end;

                COFINS.qBCProd   := 0;
                COFINS.vAliqProd := 0;

              end;
            end;

  {
            with IPI do
            begin
              CST      := ipi99 ;
              clEnq    := '999';
              CNPJProd := '';
              cSelo    := '';
              qSelo    := 0;
              cEnq     := '';

              vBC    := qryDadosProdutoPUNIT.AsCurrency;
              qUnid  := 0;
              vUnid  := 0;
              pIPI   := 0; // Percentual IPI
              vIPI   := 0; // Valor IPI
            end;

              with II do
               begin
                 vBc      := 0;
                 vDespAdu := 0;
                 vII      := 0;
                 vIOF     := 0;
               end;

              with PISST do
               begin
                 vBc       := 0;
                 pPis      := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vPIS      := 0;
               end;

              with COFINSST do
               begin
                 vBC       := 0;
                 pCOFINS   := 0;
                 qBCProd   := 0;
                 vAliqProd := 0;
                 vCOFINS   := 0;
               end;
  }
  //Grupo para serviços
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela disponível
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}

            // Lei da Transparência de Impostos

            if ( Trim(Prod.NCM) <> EmptyStr ) then
            begin
              cPercentualTributoAprox := qryDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;

              if ( cPercentualTributoAprox > 0.0 ) then
              begin
                vTotTrib  := Prod.vProd * cPercentualTributoAprox / 100;
                infAdProd := infAdProd +
                  Trim(IfThen(Trim(infAdProd) = EmptyStr, '', #13) + Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                    FormatFloat(',0.00', vTotTrib),
                    FormatFloat(',0.##"%"', cPercentualTributoAprox)
                  ]));
                  
                vTotalTributoAprox := vTotalTributoAprox + vTotTrib;
              end;
            end;

          end;
        end ;

        qryDadosProduto.Next;
      end;

      Total.ICMSTot.vBC      := qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency;
      Total.ICMSTot.vICMS    := qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency;
      Total.ICMSTot.vBCST    := qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vST      := qryCalculoImposto.FieldByName('NFE_VALOR_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vProd    := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency;
      Total.ICMSTot.vFrete   := qryCalculoImposto.FieldByName('NFE_VALOR_FRETE').AsCurrency;
      Total.ICMSTot.vSeg     := qryCalculoImposto.FieldByName('NFE_VALOR_SEGURO').AsCurrency;
      Total.ICMSTot.vDesc    := qryCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency;
      Total.ICMSTot.vII      := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_II').AsCurrency;
      Total.ICMSTot.vIPI     := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_IPI').AsCurrency;
      Total.ICMSTot.vPIS     := qryCalculoImposto.FieldByName('NFE_VALOR_PIS').AsCurrency;
      Total.ICMSTot.vCOFINS  := qryCalculoImposto.FieldByName('NFE_VALOR_COFINS').AsCurrency;
      Total.ICMSTot.vOutro   := qryCalculoImposto.FieldByName('NFE_VALOR_OUTROS').AsCurrency;
      Total.ICMSTot.vNF      := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;

      if ( vTotalTributoAprox > 0.0 ) then
        Total.ICMSTot.vTotTrib := vTotalTributoAprox;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

      Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

      // Dados da(s) Forma(s) de Pagamento(s)

      if ( not qryFormaPagtos.IsEmpty ) then
      begin
        qryFormaPagtos.First;
        while not qryFormaPagtos.Eof do
        begin
          with pag.Add do // Formas de Pagamentos apenas para NFC-e
           begin
             Case qryFormaPagtos.FieldByName('FORMAPAGTO_NFCE').AsInteger of
               01 : tPag := fpDinheiro;
               02 : tPag := fpCheque;
               03 : tPag := fpCartaoCredito;
               04 : tPag := fpCartaoDebito;
               05 : tPag := fpCreditoLoja;
               10 : tPag := fpValeAlimentacao;
               11 : tPag := fpValeRefeicao;
               12 : tPag := fpValePresente;
               13 : tPag := fpValeCombustivel;
               else
                tPag := fpOutro
             end;
             vPag := qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;
           end;

          qryFormaPagtos.Next;
        end;
      end;

      InfAdic.infCpl := '* ' + #13 +
        'Venda: ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger)  +
        ' - Forma/Cond. Pgto.: ' + qryCalculoImposto.FieldByName('LISTA_FORMA_PAGO').AsString + '/' + qryCalculoImposto.FieldByName('LISTA_COND_PAGO_FULL').AsString + ' * ' + #13 +
        'Vendedor: ' + qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString + ' * ' + #13 +
        'Observações: ' + qryCalculoImposto.FieldByName('OBS').AsString +
        IfThen(vTotalTributoAprox = 0, EmptyStr, #13 + Format('* Valor Total Aprox. Trib. R$ %s (%s). Fonte IBPT', [
          FormatFloat(',0.00', Total.ICMSTot.vTotTrib),
          FormatFloat(',0.##"%"', Total.ICMSTot.vTotTrib / Total.ICMSTot.vNF * 100)]));

      InfAdic.infAdFisco := 'Info. Fisco: ' + GetInformacaoFisco;

      exporta.UFembarq   := EmptyStr;
      exporta.xLocEmbarq := EmptyStr;

      compra.xNEmp := EmptyStr;
      compra.xPed  := EmptyStr;
      compra.xCont := EmptyStr;

      ACBrNFe.NotasFiscais.GerarNFe;
      
      if ( not DelphiIsRunning ) then
        ACBrNFe.NotasFiscais.Assinar;

      if not ACBrNFe.NotasFiscais.ValidaRegrasdeNegocios then
        raise Exception.Create( ACBrNFe.NotasFiscais.Items[0].RegrasdeNegocios );

      if ( not DelphiIsRunning ) then
        ACBrNFe.NotasFiscais.Valida;

      ACBrNFe.NotasFiscais.Items[0].SaveToFile( EmptyStr );

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;

    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NFC-e.' + #13#13 + 'GerarNFCEACBr() --> ' + e.Message);
  end;

end;

function TDMNFe.ImprimirDANFE_ESCPOSACBr(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const iAnoVenda, iNumVenda: Integer;
  const ImprimirItens : Boolean = TRUE): Boolean;
var
  FileNameXML : String;
begin

  try

    LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );
    AbrirNFeEmitida( iAnoVenda, iNumVenda );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    CorrigirXML_NFe( qryCalculoImposto.FieldByName('XML_NFE').AsWideString, FileNameXML );
    RemoverAcentos_ArquivoTexto( FileNameXML );

    if not FilesExists(FileNameXML) then
      raise Exception.Create(Format('Arquivo %s não encontrado.', [QuotedStr(FileNameXML)]));

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

      NotasFiscais.Clear;
      NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString );

      if ACBrNFe.NotasFiscais.Count <= 0 then
        raise Exception.Create('Nenhuma Nota Fiscal de Consumidor foi selecionada!');

      if ( not DelphiIsRunning ) then
        if ACBrNFe.NotasFiscais[0].NFe.Ide.modelo <> MODELO_NFCE then
          raise Exception.Create('Nota Fiscal não é do tipo NFC-e!');
      
      nfcDANFE.Device.Ativar;
      try
        DANFE.ViaConsumidor := True; // chkViaConsumidor.Checked;
        DANFE.ImprimeItens  := ImprimirItens; // Obs.: Esta propriedade ao receber FALSE, permite apenas a impressão resumo do DANFE da NFC-e

        NotasFiscais[0].Imprimir;
      finally
        nfcDANFE.Device.Desativar;
      end;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE da Saída da NFC-e.' + #13#13 + 'ImprimirDANFE_ESCPOSACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.GerarArquivoQRCODE(const FileNameQRCODE,
  StringQRCODE: String; const tamanhoQrCode : TTamanhoQrCode);
var
  ImageStream : TMemoryStream;
  CmpImage    : TImage;
  PngImage    : TPngImage;
  BmpImage    : TBitmap;
  iTamQrCode  : Integer;
begin
  ImageStream := TMemoryStream.Create;
  CmpImage := TImage.Create(nil);
  PngImage := TPngImage.Create;
  BmpImage := TBitmap.Create;
  try
    CmpImage.Picture := nil;
    try
      Case tamanhoQrCode of
        tamQrCode150 : iTamQrCode := LENGTH_QRCODE_150;
        tamQrCode160 : iTamQrCode := LENGTH_QRCODE_160;
        tamQrCode175 : iTamQrCode := LENGTH_QRCODE_175;
        tamQrCode180 : iTamQrCode := LENGTH_QRCODE_180;
        tamQrCode200 : iTamQrCode := LENGTH_QRCODE_200;
        tamQrCode300 : iTamQrCode := LENGTH_QRCODE_300;
      end;

      GetQrCode(iTamQrCode, iTamQrCode, TQrImage_ErrCorrLevel(0), StringQRCODE, ImageStream);
      
      if ImageStream.Size > 0 then
      begin
        ImageStream.Position := 0;
        PngImage.LoadFromStream(ImageStream);
        CmpImage.Picture.Assign(PngImage);

        BmpImage.Assign( CmpImage.Picture.Graphic );
        BmpImage.SaveToFile(FileNameQRCODE);
      end;
    except
    end;
  finally
    BmpImage.Free;
    CmpImage.Free;
    PngImage.Free;
    ImageStream.Free;
  end;
end;

function TDMNFe.ImprimirCupomNaoFiscal_PORTA(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer): Boolean;
var
  aEcfTipo   : TEcfTipo;
  aEcfConfig : TEcfConfiguracao;
  aEcf : TEcfFactory;

  bEmitirCumpoExtraParcelas : Boolean;
  cValorTroco,
  cPercentualTributoAprox,
  cValorTributoAprox     ,
  cValorTotalTributoAprox: Currency;

  sUrlConsultaNFCe  ,
  sDuplicata        ,
  sFileNameXML      ,
  sStringQrCode     ,
  sArquivoBmpQrCode : String;
  cTamQrCode        : TTamanhoQrCode;
const
  TEXTO_TRIB_APROX_1 = '* Valor Total Aprox. Trib.:';
  TEXTO_TRIB_APROX_2 = '* R$ %s (%s)';
  TEXTO_TRIB_APROX_3 = '* Fonte IBPT';
  TEXTO_NUMERO_DANFE = 'Numero %s Serie %s Emissao %s';
begin
  LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);

  if GetCupomNaoFiscalTipoEmissaoID = -1 then
    aEcfTipo := ecfTEXTO
  else
    aEcfTipo := TEcfTipo(GetCupomNaoFiscalTipoEmissaoID);

  AbrirEmitente(sCNPJEmitente);
  AbrirDestinatario(iCodigoCliente);
  AbrirVenda(iAnoVenda, iNumVenda);
  AbrirNFeEmitida(iAnoVenda, iNumVenda);

  // Carregar XML da NF quando este existir

  if Trim(qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString) <> EmptyStr then
  begin
    sFileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;
    ForceDirectories( ExtractFilePath(sFileNameXML) );
    TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( sFileNameXML );

    CorrigirXML_NFe( qryCalculoImposto.FieldByName('XML_NFE').AsWideString, sFileNameXML );
    RemoverAcentos_ArquivoTexto( sFileNameXML );

    if FilesExists(sFileNameXML) then
      with ACBrNFe do
      begin
        Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

        NotasFiscais.Clear;
        NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString );
      end;
  end;

  aEcfConfig.Dll              := EmptyStr;
  aEcfConfig.Impressora       := GetCupomNaoFiscalPortaNM;
  aEcfConfig.ModeloEspecifico := GetCupomNaoFiscalModeloEspID;
  aEcfConfig.Porta            := GetCupomNaoFiscalPortaDS;
  aEcfConfig.Empresa  := AnsiUpperCase( qryEmitenteNMFANT.AsString );
  aEcfConfig.Endereco := RemoveAcentos( Trim(qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString + ', ' + qryEmitenteNUMERO_END.AsString) );
  aEcfConfig.Bairro   := RemoveAcentos( Trim(qryEmitenteBAI_NOME.AsString) );
  aEcfConfig.Fone     := StrFormatarFONE(qryEmitenteFONE.AsString);
  aEcfConfig.Cep      := StrFormatarCEP(qryEmitenteCEP.AsString);
  aEcfConfig.Cidade   := RemoveAcentos( qryEmitenteCID_NOME.AsString + '/' + qryEmitenteEST_SIGLA.AsString );
  aEcfConfig.Cnpj     := StrFormatarCnpj( sCNPJEmitente );
  aEcfConfig.InscEstadual   := qryEmitenteIE.AsString;
  aEcfConfig.ID             := FormatFloat('###0000000', iNumVenda);
  aEcfConfig.ImprimirGliche := True;

  aEcfConfig.ArquivoLogo   := Trim(ConfigACBr.edtLogoMarca.Text);
  aEcfConfig.ArquivoQRCode := EmptyStr;

  aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
  try

    cValorTroco := 0.0;
    cPercentualTributoAprox := 0.0;
    cValorTributoAprox      := 0.0;
    cValorTotalTributoAprox := 0.0;

    with aEcf do
    begin
      Ecf.SoftHouse := GetCompanyName;
      Ecf.Sistema   := GetProductName;
      Ecf.Versao    := GetProductVersion;

      Ecf.Identifica_Cupom(Now, FormatFloat('###0000000', iNumVenda), qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString);

      if ( qryDestinatario.FieldByName('CODIGO').AsInteger <> CONSUMIDOR_FINAL_CODIGO ) then
        Ecf.Identifica_Consumidor( IfThen(StrIsCPF(qryDestinatario.FieldByName('CNPJ').AsString), StrFormatarCpf(qryDestinatario.FieldByName('CNPJ').AsString), StrFormatarCnpj(qryDestinatario.FieldByName('CNPJ').AsString))
          , RemoveAcentos(AnsiUpperCase(qryDestinatario.FieldByName('NOMEFANT').AsString))
          , Trim(qryDestinatario.FieldByName('TLG_SIGLA').AsString + ' ' + qryDestinatario.FieldByName('LOG_NOME').AsString + ', ' +
            qryDestinatario.FieldByName('NUMERO_END').AsString + ' - ' + qryDestinatario.FieldByName('BAI_NOME').AsString) + ' (' + qryDestinatario.FieldByName('CID_NOME').AsString + ')'
          , Trim(Copy(Trim(qryDestinatario.FieldByName('FONES').AsString), 1, Length(Trim(qryDestinatario.FieldByName('FONES').AsString)) - 1))
        );

      if qryNFeEmitida.IsEmpty then
        Ecf.Titulo_Cupom('NOTA DE ENTREGA')
      else
        Ecf.Titulo_Cupom_DANFE('DANFE NFC-e'
          , 'Documento Auxiliar da Nota Fiscal'
          , 'Eletronica para Consumidor Final'
          , 'Nao permite aprovimento de credito de ICMS');

      qryDadosProduto.First;

      while not qryDadosProduto.Eof do
      begin
        cPercentualTributoAprox := qryDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;
        if (cPercentualTributoAprox > 0.0) then
          cValorTributoAprox := qryDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency * cPercentualTributoAprox / 100
        else
          cValorTributoAprox := 0.0;

        Ecf.Incluir_Item(FormatFloat('00', qryDadosProduto.FieldByName('SEQ').AsInteger)
          , qryDadosProduto.FieldByName('CODPROD').AsString
          , RemoveAcentos( Copy(AnsiUpperCase(qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString), 1, 45) )
          , Trim(FormatFloat(',0.###', qryDadosProduto.FieldByName('QTDE').AsCurrency) + ' ' + Copy(Trim(qryDadosProduto.FieldByName('UNP_SIGLA').AsString), 1, 2))
          , FormatFloat(',0.00',  qryDadosProduto.FieldByName('PFINAL').AsCurrency)
          , 'T0'
          , FormatFloat(',0.00',  (qryDadosProduto.FieldByName('QTDE').AsCurrency * qryDadosProduto.FieldByName('PFINAL').AsCurrency))
        );

        cValorTotalTributoAprox := cValorTotalTributoAprox + cValorTributoAprox;
        qryDadosProduto.Next;
      end;

      if (qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) <> 0 then
      begin
        Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), True );
        Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
      end;

      Ecf.Linha;
      Ecf.Incluir_Texto_Valor('QTDE. TOTAL DE ITENS', FormatFloat(',000.##',  qryDadosProduto.RecordCount));
      Ecf.TotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency)  );

      qryFormaPagtos.First;
      bEmitirCumpoExtraParcelas := False;

      while not qryFormaPagtos.Eof do
      begin
        if not bEmitirCumpoExtraParcelas then
          bEmitirCumpoExtraParcelas := (qryFormaPagtos.FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger = 1) and (qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1);

        cValorTroco := qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency -
          qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;

        if ( cValorTroco > 0.0 ) then
        begin
          Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
            FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency));
          Ecf.Incluir_Texto_Valor('* Troco', FormatFloat(',0.00',  cValorTroco));
        end
        else
          Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
            FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency));

        if ( qryFormaPagtos.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
          Ecf.Texto_Livre('* ' + RemoveAcentos(
            IfThen(Trim(qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString) = EmptyStr
              , qryFormaPagtos.FieldByName('COND_DESCRICAO_FULL').Text
              , qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString)));

        qryFormaPagtos.Next;
      end;

      if (cValorTotalTributoAprox > 0.0) then
      begin
        Ecf.Linha;
        Ecf.Texto_Livre_Negrito(TEXTO_TRIB_APROX_1);
        Ecf.Texto_Livre_Negrito(Format(TEXTO_TRIB_APROX_2, [
          FormatFloat(',0.00', cValorTotalTributoAprox),
          FormatFloat(',0.##"%"', cValorTotalTributoAprox / qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency * 100)]));
        Ecf.Texto_Livre_Negrito(TEXTO_TRIB_APROX_3);
      end;

      if (Trim(qryCalculoImposto.FieldByName('OBS').AsString) <> EmptyStr) then
      begin
        Ecf.Linha;
        Ecf.Texto_Livre( '* Venda: ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger) );
        Ecf.Texto_Livre( '* Cond. Pgto.: ' + qryCalculoImposto.FieldByName('LISTA_COND_PAGO_FULL').AsString);
        Ecf.Texto_Livre( '* ' + Trim(qryCalculoImposto.FieldByName('OBS').AsString) );
      end;

      if not qryNFeEmitida.IsEmpty then
      begin
        Ecf.Linha;
        Ecf.Texto_Livre_Centralizado( Format(TEXTO_NUMERO_DANFE, [FormatFloat('###0000000', qryNFeEmitidaNUMERO.AsInteger)
          , FormatFloat('000', qryNFeEmitidaSERIE.AsInteger)
          , FormatDateTime('dd/mm/yyyy', qryNFeEmitidaDATAEMISSAO.AsDateTime)]) );
        Ecf.Texto_Livre_Centralizado( 'Via Consumidor' );
        Ecf.Texto_Livre_Centralizado( 'Consulte pela Chave de Acesso em:' );

        if (TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger) = moNFCe) then
          sUrlConsultaNFCe :=
            NotaUtil.GetURLConsultaNFCe(ACBrNFe.Configuracoes.WebServices.UFCodigo
              , ACBrNFe.Configuracoes.WebServices.Ambiente
            )
        else
          sUrlConsultaNFCe :=
            NotaUtil.GetURL(ACBrNFe.Configuracoes.WebServices.UFCodigo
              , ACBrNFe.Configuracoes.WebServices.AmbienteCodigo
              , ACBrNFe.Configuracoes.Geral.FormaEmissaoCodigo
              , LayNfeConsulta
              , TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger)
              , TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger)
            );

        Ecf.Texto_Livre_Centralizado( sUrlConsultaNFCe );

        Ecf.Texto_Livre_Centralizado( 'CHAVE DE ACESSO' );
        Ecf.Texto_Livre_Centralizado( NotaUtil.FormatarChaveAcesso(qryNFeEmitidaCHAVE.AsString) );
        Ecf.Linha;
        Ecf.Texto_Livre_Centralizado( 'Consulta via leitor de QR Code' );

        // Gerar Arquivo QRCODE

        sArquivoBmpQRCode := ExtractFilePath(ParamStr(0)) + 'Temp\' + qryNFeEmitidaCHAVE.AsString + '.bmp';
        ForceDirectories( ExtractFilePath(sArquivoBmpQRCode) );

        if (ACBrNFe.NotasFiscais.Count = 0) then
          sStringQRCode := NotaUtil.GetURLQRCode(
              NotaUtil.UFtoCUF(qryEmitenteEST_SIGLA.AsString)    // Código UF
            , ACBrNFe.Configuracoes.WebServices.Ambiente         // Ambiente do WebService
            , 'NFe' + qryNFeEmitidaCHAVE.AsString                // ID da Nota Fiscal (NFe + Chave)
            , qryDestinatario.FieldByName('CNPJ').AsString       // CPJ/CNPJ do Consumidor
            , qryCalculoImposto.FieldByName('DATAEMISSAO').AsDateTime            // Data de Emissão
            , qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency   // Valor da Nota Fiscal
            , qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency         // Valor do ICMS da Nota Fiscal
            , EmptyStr                                           // Assinatura Digital (A1 ou A3)
            , TACBrNFe(ACBrNFe).Configuracoes.Geral.IdToken      // ID do Código de Segurança do Contribuinte (CSC)
            , TACBrNFe(ACBrNFe).Configuracoes.Geral.Token        // Token / CSC
          )
        else
          sStringQRCode := NotaUtil.GetURLQRCode(
              ACBrNFe.NotasFiscais[0].NFe.ide.cUF
            , ACBrNFe.NotasFiscais[0].NFe.ide.tpAmb
            , ACBrNFe.NotasFiscais[0].NFe.infNFe.ID
            , IfThen(ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro <> EmptyStr
              , ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro
              , ACBrNFe.NotasFiscais[0].NFe.Dest.CNPJCPF)
            , ACBrNFe.NotasFiscais[0].NFe.ide.dEmi
            , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vNF
            , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vICMS
            , ACBrNFe.NotasFiscais[0].NFe.signature.DigestValue
            , TACBrNFe(ACBrNFe).Configuracoes.Geral.IdToken
            , TACBrNFe(ACBrNFe).Configuracoes.Geral.Token
          );

        if Copy(sStringQRCode, 1, 1) = '?' then
          sStringQRCode := sUrlConsultaNFCe + sStringQRCode;

        Case aEcfTipo of
          ecfPadraoWindows, ecfLPTX, ecfTEXTO:
            cTamQrCode := tamQrCode200;

          ecfDaruma, ecfBematech:
            cTamQrCode := tamQrCode160;

          else
            cTamQrCode := tamQrCode300;
        end;

        GerarArquivoQRCODE(sArquivoBmpQrCode, sStringQrCode, cTamQrCode);

        if FileExists(sArquivoBmpQRCode) then
          Ecf.ImprimirQRCode( sArquivoBmpQRCode );

        Ecf.Texto_Livre_Centralizado( 'Protocolo de Autorizacao' );
        Ecf.Texto_Livre_Centralizado( qryNFeEmitidaPROTOCOLO.AsString         + ' '
          + FormatDateTime('dd/mm/yyyy', qryNFeEmitidaDATAEMISSAO.AsDateTime) + ' '
          + FormatDateTime('hh:mm:ss',   qryNFeEmitidaHORAEMISSAO.AsDateTime) );
      end;
    end;

  finally
    aEcf.Ecf.Finalizar;
    aEcf.Free;

    DeleteFiles(sArquivoBmpQRCode);
  end;

  // Emitir Cupom Relatório Gerencial com parcelas para consumidor

  if bEmitirCumpoExtraParcelas and (aEcfTipo in [ecfPadraoWindows, ecfLPTX, ecfTEXTO, ecfBematech]) then
  begin
    aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
    try

      with aEcf do
      begin
        Ecf.SoftHouse := GetCompanyName;
        Ecf.Sistema   := GetProductName;
        Ecf.Versao    := GetVersion;

        Ecf.Identifica_Cupom(Now, FormatFloat('###0000000', iNumVenda), qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString);
        Ecf.Titulo_Livre( 'RELATORIO GERENCIAL' );
        Ecf.Compactar_Fonte;

        Ecf.Linha;

        Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), False );
        Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
        Ecf.Linha;
        Ecf.TotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency)  );

        qryFormaPagtos.First;

        while not qryFormaPagtos.Eof do
        begin
          cValorTroco := qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency - qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;

          if ( cValorTroco > 0.0  ) then
            Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
              FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency))
          else
            Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
              FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency));

          Ecf.Texto_Livre('* ' + RemoveAcentos(
            IfThen(Trim(qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString) = EmptyStr
              , qryFormaPagtos.FieldByName('COND_DESCRICAO_FULL').Text
              , qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString)));

          if ( cValorTroco > 0.0 ) then
            Ecf.Incluir_Texto_Valor('* Troco', FormatFloat(',0.00',  cValorTroco));

          qryFormaPagtos.Next;
        end;

        Ecf.Linha;
        Ecf.Titulo_Livre( 'VENCIMENTO(S)' );

        qryDuplicatas.First;

        while not qryDuplicatas.Eof do
        begin
          sDuplicata := qryDuplicatas.FieldByName('ANOLANC').AsString + '/' +
            FormatFloat('###00000"."', qryDuplicatas.FieldByName('NUMLANC').AsInteger) +
            FormatFloat('00', qryDuplicatas.FieldByName('PARCELA').AsInteger) + ' ' +
            FormatDateTime('dd/mm/yyyy', qryDuplicatas.FieldByName('DTVENC').AsDateTime);
          Ecf.Incluir_Texto_Valor(Trim(sDuplicata), FormatFloat(',0.00',  qryDuplicatas.FieldByName('VALORREC').AsCurrency));

          qryDuplicatas.Next;
        end;

        Ecf.Texto_Livre('.');
        Ecf.Texto_Livre('.');
        Ecf.Texto_Livre('.');
        Ecf.Texto_Livre('.');
        Ecf.Texto_Livre('.');
        Ecf.Texto_Livre('.');
        Ecf.Pular_Linha(PULAR_LINHA_FINAL);

        Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas, '----------------------------------------') );
        Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas, RemoveAcentos(AnsiUpperCase(qryDestinatario.FieldByName('NOMEFANT').AsString))) );
        Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas,
          IfThen(StrIsCPF(qryDestinatario.FieldByName('CNPJ').AsString)
            , StrFormatarCpf(qryDestinatario.FieldByName('CNPJ').AsString)
            , StrFormatarCnpj(qryDestinatario.FieldByName('CNPJ').AsString))) );
      end;

    finally
      aEcf.Ecf.Finalizar;
      aEcf.Free;
    end;
  end;

end;

function TDMNFe.ImprimirCupomFechamentoCaixa_PORTA(const sEmpresa: String;
  const iAnoCaixa, iNumCaixa: Integer): Boolean;
var
  aEcfTipo   : TEcfTipo;
  aEcfConfig : TEcfConfiguracao;
  aEcf : TEcfFactory;
begin
  LerConfiguracao(sEmpresa, tipoDANFE_ESCPOS);

  if GetCupomNaoFiscalTipoEmissaoID = -1 then
    aEcfTipo := ecfTEXTO
  else
    aEcfTipo := TEcfTipo(GetCupomNaoFiscalTipoEmissaoID);

  AbrirEmitente(sEmpresa);
  AbrirVendasCaixa(iAnoCaixa, iNumCaixa);

  aEcfConfig.Dll              := EmptyStr;
  aEcfConfig.Impressora       := GetCupomNaoFiscalPortaNM;
  aEcfConfig.ModeloEspecifico := GetCupomNaoFiscalModeloEspID;
  aEcfConfig.Porta            := GetCupomNaoFiscalPortaDS;
  aEcfConfig.Empresa  := AnsiUpperCase( qryEmitenteNMFANT.AsString );
  aEcfConfig.Endereco := RemoveAcentos( Trim(qryEmitenteTLG_SIGLA.AsString + ' ' + qryEmitenteLOG_NOME.AsString + ', ' + qryEmitenteNUMERO_END.AsString) );
  aEcfConfig.Bairro   := RemoveAcentos( Trim(qryEmitenteBAI_NOME.AsString) );
  aEcfConfig.Fone     := StrFormatarFONE(qryEmitenteFONE.AsString);
  aEcfConfig.Cep      := StrFormatarCEP(qryEmitenteCEP.AsString);
  aEcfConfig.Cidade   := RemoveAcentos( qryEmitenteCID_NOME.AsString + '/' + qryEmitenteEST_SIGLA.AsString );
  aEcfConfig.Cnpj     := StrFormatarCnpj( sEmpresa );
  aEcfConfig.InscEstadual   := qryEmitenteIE.AsString;
  aEcfConfig.ID             := FormatFloat('###0000000', iNumCaixa);
  aEcfConfig.ImprimirGliche := True;

  aEcfConfig.ArquivoLogo   := Trim(ConfigACBr.edtLogoMarca.Text);
  aEcfConfig.ArquivoQRCode := EmptyStr;

  aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
  try

    with aEcf do
    begin
      Ecf.SoftHouse := GetCompanyName;
      Ecf.Sistema   := GetProductName;
      Ecf.Versao    := GetProductVersion;

      Ecf.Identifica_Cupom(Now
        , FormatFloat('###0000000', iNumCaixa)
        , qryVendasCaixaSoma.FieldByName('nome').AsString);

      Ecf.Titulo_Livre('RESUMO DAS VENDAS NO CAIXA');
      Ecf.Linha;

      qryVendasCaixaFormaPagto.First;
      while not qryVendasCaixaFormaPagto.Eof do
      begin
        if ( qryVendasCaixaFormaPagto.FieldByName('Valor_Credito').AsCurrency > 0.0 ) then
          Ecf.Incluir_Texto_Valor(
              RemoveAcentos( qryVendasCaixaFormaPagto.FieldByName('Forma_pagto_Desc').AsString )
            , FormatFloat(',0.00',  qryVendasCaixaFormaPagto.FieldByName('Valor_Credito').AsCurrency) + ' +');

        qryVendasCaixaFormaPagto.Next;
      end;
      qryVendasCaixaFormaPagto.Close;

      Ecf.SubTotalVenda( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('totalvenda_bruta').AsCurrency) + ' +', True );
      Ecf.Desconto     ( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('total_desconto').AsCurrency)   + ' -');
      Ecf.TotalVenda   ( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('totalvenda').AsCurrency)       );

      Ecf.Linha;
      Ecf.Titulo_Livre('DETALHES DAS VENDAS');
      Ecf.Linha;

      qryVendasCaixaDetalhe.First;
      while not qryVendasCaixaDetalhe.Eof do
      begin
        Ecf.Incluir_Item(FormatFloat('00', qryVendasCaixaDetalhe.RecNo)
          , qryVendasCaixaDetalhe.FieldByName('Movimento').AsString
          , RemoveAcentos( Copy(AnsiUpperCase(qryVendasCaixaDetalhe.FieldByName('Historico').AsString), 1, 45) )
          , '1'
          , RemoveAcentos( Copy(qryVendasCaixaDetalhe.FieldByName('Forma_pagto_Desc').AsString, 1, 3) )
          , qryVendasCaixaDetalhe.FieldByName('TipoMov').AsString
          , FormatFloat(',0.00',  qryVendasCaixaDetalhe.FieldByName('Valor').AsCurrency) +
              IfThen(qryVendasCaixaDetalhe.FieldByName('SituacaoMov').AsInteger = 1, ' +', ' -')
        );
        
        qryVendasCaixaDetalhe.Next;
      end;
      qryVendasCaixaDetalhe.Close;

      Ecf.SubTotalVenda( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('totalvenda_bruta').AsCurrency) + ' +', True );
      Ecf.Desconto     ( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('total_desconto').AsCurrency)   + ' -');
      Ecf.TotalVenda   ( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('totalvenda').AsCurrency)       );

      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre_Centralizado('OBSERVACAO:');
      Ecf.Texto_Livre_Centralizado('Os valores das vendas canceladas, apesar');
      Ecf.Texto_Livre_Centralizado('de estarem no detalhe deste relatorio, nao');
      Ecf.Texto_Livre_Centralizado('sao desconsideradas no total resumo acima.');
      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre('.');
      Ecf.Texto_Livre('.');
      Ecf.Pular_Linha(PULAR_LINHA_FINAL);

      Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas, '----------------------------------------') );
      Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas, RemoveAcentos(AnsiUpperCase(qryVendasCaixaSoma.FieldByName('nome').AsString))) );
      Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas,
        IfThen(StrIsCPF(qryVendasCaixaSoma.FieldByName('cpf').AsString)
          , StrFormatarCpf(qryVendasCaixaSoma.FieldByName('cpf').AsString)
          , StrFormatarCnpj(qryVendasCaixaSoma.FieldByName('cpf').AsString))) );

      qryVendasCaixaSoma.Close;
    end;

  finally
    aEcf.Ecf.Finalizar;
    aEcf.Free;
  end;

end;

procedure TDMNFe.AbrirVendasCaixa(AnoCaixa, NumeroCaixa: Integer);
begin
  with qryVendasCaixaSoma do
  begin
    Close;
    ParamByName('anoCaixa').AsInteger := AnoCaixa;
    ParamByName('numCaixa').AsInteger := NumeroCaixa;
    Open;
  end;

  with qryVendasCaixaFormaPagto do
  begin
    Close;
    ParamByName('anoCaixa').AsInteger := AnoCaixa;
    ParamByName('numCaixa').AsInteger := NumeroCaixa;
    Open;
  end;

  with qryVendasCaixaDetalhe do
  begin
    Close;
    ParamByName('anoCaixa').AsInteger := AnoCaixa;
    ParamByName('numCaixa').AsInteger := NumeroCaixa;
    Open;
  end;
end;

function TDMNFe.ImprimirCupomFechamentoCaixa(const sEmpresa: String;
  const iAnoCaixa, iNumCaixa: Integer): Boolean;
begin
  Result := ImprimirCupomFechamentoCaixa_PORTA(sEmpresa, iAnoCaixa, iNumCaixa);
end;

end.
