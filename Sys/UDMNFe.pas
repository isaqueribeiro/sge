unit UDMNFe;

interface

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.Variants,
  System.TypInfo,
  System.Generics.Collections,
  Web.HTTPApp,
  Winapi.Windows,
  Winapi.ShellApi,
  Winapi.WinInet,
  Vcl.Graphics,
  Vcl.ExtCtrls,
  Vcl.Imaging.PngImage,
  Vcl.Imaging.jpeg,
  Data.DB,
  SHDocVw,

  Interacao.Versao,
  Controller.Versao,
  UConstantesDGE,
  UDMBusiness,
  UGeConfigurarNFeACBr,

  ACBrNFeConfiguracoes,
  ACBrNFeNotasFiscais,
  ACBrNFeWebServices,
  ACBrNFe,
  ACBrDFe,
  ACBrDFeSSL,
  ACBrDFeUtil,
  ACBrUtil,
  ACBrECFVirtualBuffer,
  ACBrPosPrinter,
  ACBrDelphiZXingQRCode,
  ACBrImage,
  pcnConversao,
  //pcnNFeW,
  //pcnNFe,
  pcnNFeRTXT,
  pcnAuxiliar,

  {$IF NOT (DEFINED(PRINTER_CUPOM) OR DEFINED(PDV))}
  Classe.DistribuicaoDFe.DocumentoRetornado,
  {$ENDIF}

  ACBrNFeDANFEClass,
  frxClass, frxDBSet, frxExportRTF, frxExportXLS, frxExportPDF, frxExportMail,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  //IBX.IBUpdateSQL,
  frxDesgn, frxRich, frxCross, ACBrBase,
  ACBrBoleto, ACBrBoletoFCFR, frxExportImage, ACBrValidador, ACBrNFeDANFEFR,
  ACBrECF, ACBrRFD, ACBrAAC, ACBrEAD, ACBrECFVirtual,
  ACBrECFVirtualPrinter, ACBrECFVirtualNaoFiscal, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrNFeDANFeESCPOS, ACBrSAT, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, ACBrNFeDANFEFRDM, Vcl.Dialogs, ACBrDFeReport, ACBrDFeDANFeReport;

type
  TQrImage_ErrCorrLevel = (L, M, Q, H);
  TTamanhoQrCode = (tamQrCode150, tamQrCode160, tamQrCode175, tamQrCode180, tamQrCode200, tamQrCode300);
  TTipoNF = (tnfEntrada, tnfSaida);
  TDMNFe = class(TDataModule)
    ACBrNFe: TACBrNFe;
    frDANFE: TACBrNFeDANFEFR;
    frdEmpresa: TfrxDBDataset;
    frdCliente: TfrxDBDataset;
    frrVenda: TfrxReport;
    frdVenda: TfrxDBDataset;
    frdItens: TfrxDBDataset;
    frdTitulo: TfrxDBDataset;
    FrECFPooler: TfrxReport;
    frdFormaPagtos: TfrxDBDataset;
    frdFornecedor: TfrxDBDataset;
    frdEntrada: TfrxDBDataset;
    frdEntradaItens: TfrxDBDataset;
    frdEntradaDuplicata: TfrxDBDataset;
    frrBoletoEntrega: TfrxReport;
    frrRequisicaoCliente: TfrxReport;
    FrrECFPoolerRequisicaoCliente: TfrxReport;
    frdRequisicaoCliente: TfrxDBDataset;
    frdAutorizacaoCompra: TfrxDBDataset;
    frrAutorizacaoCompra: TfrxReport;
    frdCotacaoCompra: TfrxDBDataset;
    frrCotacaoCompra: TfrxReport;
    frdCotacaoCompraFornecedor: TfrxDBDataset;
    frdCotacaoCompraFornecedorItem: TfrxDBDataset;
    frrCotacaoCompraMapaPreco: TfrxReport;
    frrNotaEntrega: TfrxReport;
    frdVendaCartaCredito: TfrxDBDataset;
    frrVendaCartaCredito: TfrxReport;
    frdRequisicaoCompra: TfrxDBDataset;
    frrRequisicaoCompra: TfrxReport;
    frrCartaCorrecaoE: TfrxReport;
    ACBrECF: TACBrECF;
    ACBrRFD: TACBrRFD;
    ACBrAAC: TACBrAAC;
    ACBrEAD: TACBrEAD;
    ACBrECFVirtualNaoFiscal: TACBrECFVirtualNaoFiscal;
    nfcDANFE: TACBrNFeDANFeESCPOS;
    ACBrSATExtratoESCPOS: TACBrSATExtratoESCPOS;
    ACBrSAT: TACBrSAT;
    frdApropriacaoEstoque: TfrxDBDataset;
    frrApropriacaoEstoque: TfrxReport;
    frdRequisicaoAlmox: TfrxDBDataset;
    frrRequisicaoAlmox: TfrxReport;
    frrManifestoAlmox: TfrxReport;
    frdSolicitacaoCompra: TfrxDBDataset;
    frrSolicitacaoCompra: TfrxReport;
    frrNFeRetrato: TfrxReport;
    frrNFePaisagem: TfrxReport;
    ValidarXML: TXMLDocument;
    frdNFCDestinatario: TfrxDBDataset;
    frdNFCCalculoImposto: TfrxDBDataset;
    frdNFCDadosProduto: TfrxDBDataset;
    frrNotaEntregaX: TfrxReport;
    frdListaFuncionario: TfrxDBDataset;
    frrListaFuncionario: TfrxReport;
    opdNotas: TOpenDialog;
    ACBrPosPrinter: TACBrPosPrinter;
    frrNFeEventoCCe: TfrxReport;
    frrNFeInutilizacao: TfrxReport;
    frrBoletoCarne: TfrxReport;
    frrBoletoFatura: TfrxReport;
    fdQryEmissaoNFePendente: TFDQuery;
    fdQryListaTipoDespesa: TFDQuery;
    frdListaTipoDespesa: TfrxDBDataset;
    frrListaTipoDespesa: TfrxReport;
    fdQryListaTipoReceita: TFDQuery;
    frdListaTipoReceita: TfrxDBDataset;
    frrListaTipoReceita: TfrxReport;
    cdsLOG: TFDQuery;
    updLOG: TFDUpdateSQL;
    cdsLOGUSUARIO: TStringField;
    cdsLOGDATA_HORA: TSQLTimeStampField;
    cdsLOGEMPRESA: TStringField;
    cdsLOGTIPO: TSmallintField;
    cdsLOGDESCRICAO: TStringField;
    cdsLOGESPECIFICACAO: TMemoField;
    qryCartaCorrecaoNFe: TFDQuery;
    updCartaCorrecaoNFe: TFDUpdateSQL;
    qryCartaCorrecaoNFeCCE_NUMERO: TIntegerField;
    qryCartaCorrecaoNFeCCE_EMPRESA: TStringField;
    qryCartaCorrecaoNFeCCE_DATA: TDateField;
    qryCartaCorrecaoNFeCCE_HORA: TTimeField;
    qryCartaCorrecaoNFeCCE_ENVIADA: TSmallintField;
    qryCartaCorrecaoNFeCCE_TEXTO: TMemoField;
    qryCartaCorrecaoNFeNFE_SERIE: TStringField;
    qryCartaCorrecaoNFeNFE_NUMERO: TIntegerField;
    qryCartaCorrecaoNFeNFE_MODELO: TSmallintField;
    qryCartaCorrecaoNFeNUMERO: TIntegerField;
    qryCartaCorrecaoNFePROTOCOLO: TStringField;
    qryCartaCorrecaoNFeXML: TMemoField;
    qryCartaCorrecaoNFeXML_TOTAL: TMemoField;
    qryEmitente: TFDQuery;
    qryEmitenteCODIGO: TIntegerField;
    qryEmitentePESSOA_FISICA: TSmallintField;
    qryEmitenteCNPJ: TStringField;
    qryEmitenteRZSOC: TStringField;
    qryEmitenteNMFANT: TStringField;
    qryEmitenteIE: TStringField;
    qryEmitenteIM: TStringField;
    qryEmitenteCNAE: TStringField;
    qryEmitenteFONE: TStringField;
    qryEmitenteLOGO: TBlobField;
    qryEmitenteTLG_TIPO: TSmallintField;
    qryEmitenteTLG_DESCRICAO: TStringField;
    qryEmitenteTLG_SIGLA: TStringField;
    qryEmitenteLOG_COD: TIntegerField;
    qryEmitenteLOG_NOME: TStringField;
    qryEmitenteCOMPLEMENTO: TStringField;
    qryEmitenteNUMERO_END: TStringField;
    qryEmitenteCEP: TStringField;
    qryEmitenteBAI_COD: TIntegerField;
    qryEmitenteBAI_NOME: TStringField;
    qryEmitenteCID_COD: TIntegerField;
    qryEmitenteCID_NOME: TStringField;
    qryEmitenteCID_SIAFI: TIntegerField;
    qryEmitenteCID_IBGE: TIntegerField;
    qryEmitenteCID_DDD: TSmallintField;
    qryEmitenteEST_COD: TSmallintField;
    qryEmitenteEST_NOME: TStringField;
    qryEmitenteEST_SIGLA: TStringField;
    qryEmitenteEST_SIAFI: TIntegerField;
    qryEmitenteEMAIL: TStringField;
    qryEmitenteHOME_PAGE: TStringField;
    qryEmitenteCHAVE_ACESSO_NFE: TStringField;
    qryEmitenteTIPO_REGIME_NFE: TSmallintField;
    qryEmitenteSERIE_NFE: TSmallintField;
    qryEmitenteNUMERO_NFE: TIntegerField;
    qryEmitenteLOTE_ANO_NFE: TSmallintField;
    qryEmitenteLOTE_NUM_NFE: TIntegerField;
    qryEmitentePAIS_ID: TStringField;
    qryEmitenteSERIE_NFCE: TSmallintField;
    qryEmitenteNUMERO_NFCE: TIntegerField;
    qryEmitentePAIS_NOME: TStringField;
    qryEmitenteRECONFIGURAR: TIntegerField;
    qryVendasCaixaSoma: TFDQuery;
    qryVendasCaixaFormaPagto: TFDQuery;
    qryVendasCaixaDetalhe: TFDQuery;
    qryNFe: TFDQuery;
    qryLoteNFePendente: TFDQuery;
    qryNFeEmitidaEntrada: TFDQuery;
    qryNFeEmitida: TFDQuery;
    qryNFeEmitidaANOVENDA: TSmallintField;
    qryNFeEmitidaNUMVENDA: TIntegerField;
    qryNFeEmitidaEMPRESA: TStringField;
    qryNFeEmitidaDATAEMISSAO: TDateField;
    qryNFeEmitidaHORAEMISSAO: TTimeField;
    qryNFeEmitidaSERIE: TStringField;
    qryNFeEmitidaNUMERO: TIntegerField;
    qryNFeEmitidaMODELO: TSmallintField;
    qryNFeEmitidaVERSAO: TSmallintField;
    qryNFeEmitidaCHAVE: TStringField;
    qryNFeEmitidaPROTOCOLO: TStringField;
    qryNFeEmitidaRECIBO: TStringField;
    qryNFeEmitidaXML_FILENAME: TStringField;
    qryNFeEmitidaXML_FILE: TMemoField;
    qryNFeEmitidaLOTE_ANO: TSmallintField;
    qryNFeEmitidaLOTE_NUM: TIntegerField;
    qryNFeEmitidaEntradaANOCOMPRA: TSmallintField;
    qryNFeEmitidaEntradaNUMCOMPRA: TIntegerField;
    qryNFeEmitidaEntradaEMPRESA: TStringField;
    qryNFeEmitidaEntradaDATAEMISSAO: TDateField;
    qryNFeEmitidaEntradaHORAEMISSAO: TTimeField;
    qryNFeEmitidaEntradaSERIE: TStringField;
    qryNFeEmitidaEntradaNUMERO: TIntegerField;
    qryNFeEmitidaEntradaMODELO: TSmallintField;
    qryNFeEmitidaEntradaVERSAO: TSmallintField;
    qryNFeEmitidaEntradaCHAVE: TStringField;
    qryNFeEmitidaEntradaPROTOCOLO: TStringField;
    qryNFeEmitidaEntradaRECIBO: TStringField;
    qryNFeEmitidaEntradaXML_FILENAME: TStringField;
    qryNFeEmitidaEntradaXML_FILE: TMemoField;
    qryNFeEmitidaEntradaLOTE_ANO: TSmallintField;
    qryNFeEmitidaEntradaLOTE_NUM: TIntegerField;
    qryDadosVolume: TFDQuery;
    qryFormaPagtos: TFDQuery;
    qryListaFuncionario: TFDQuery;
    qryDuplicatas: TFDQuery;
    qryEntradaDuplicatas: TFDQuery;
    qryDadosProduto: TFDQuery;
    qryEntradaDadosProduto: TFDQuery;
    qryNFCDadosProduto: TFDQuery;
    qryRequisicaoCliente: TFDQuery;
    qryVendaCartaCredito: TFDQuery;
    qryDestinatario: TFDQuery;
    qryFornecedorDestinatario: TFDQuery;
    qryNFCDestinatario: TFDQuery;
    qryCalculoImposto: TFDQuery;
    qryEntradaCalculoImposto: TFDQuery;
    qryNFCCalculoImposto: TFDQuery;
    qryAutorizacaoCompra: TFDQuery;
    qryCotacaoCompra: TFDQuery;
    qryCotacaoCompraFornecedor: TFDQuery;
    qryCotacaoCompraFornecedorItem: TFDQuery;
    qryRequisicaoCompra: TFDQuery;
    qrySolicitacaoCompra: TFDQuery;
    qryApropriacaoEstoque: TFDQuery;
    qryRequisicaoAlmox: TFDQuery;
    frrEntradaEspelho: TfrxReport;
    qryEmitenteCONTADOR_CODIGO: TIntegerField;
    qryEmitenteCONTADOR_CNPJCPF: TStringField;
    qryEmitenteCONTADOR_NOME: TStringField;
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
    ver : IVersao;

    frmACBr : TfrmGeConfigurarNFeACBr;
    fr3Designer: TfrxDesigner;

    FImprimirCabecalho : Boolean;
    FMensagemErro      : String;

    procedure GerarTabela_CST_PIS;
    procedure GerarTabela_CST_COFINS;

    procedure UpdateNumeroNFe(const sCNPJEmitente : String; const Serie, Numero : Integer);
    procedure UpdateNumeroNFCe(const sCNPJEmitente : String; const Serie, Numero : Integer);
    procedure UpdateNumeroCCe(const sCNPJEmitente : String; const Numero : Integer);
    procedure UpdateLoteNFe(const sCNPJEmitente : String; const Ano, Numero : Integer);

    procedure GerarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String;
      const OcultarVencimentos : Boolean = FALSE);
    procedure GerarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String;
      const OcultarVencimentos : Boolean = FALSE);
    procedure GerarNFCeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFCe, iNumeroNFCe : Integer; var FileNameXML : String);
    procedure GerarNFeComplementarACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String); virtual; abstract;

    function GetMensagemErro : String;

    function ImprimirCupomNaoFiscal_PORTA(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      const BlocoImpressaoCupom : TBlocoImpressaoCupom = bicCupomRelatorioGerencial) : Boolean;

    function ImprimirCupomNaoFiscal_ESCPOS(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer) : Boolean; virtual; abstract;

    function ImprimirCupomFechamentoCaixa_PORTA(const sEmpresa : String;
      const iAnoCaixa, iNumCaixa : Integer) : Boolean;

  public
    { Public declarations }
    property ConfigACBr : TfrmGeConfigurarNFeACBr read frmACBr write frmACBr;
    property ImprimirCabecalho : Boolean read FImprimirCabecalho write FImprimirCabecalho;
    property MensagemErro : String read GetMensagemErro;

    procedure LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);
    procedure GuardarLoteNFeVenda(const sCNPJEmitente : String; const Ano, Numero, NumeroLote : Integer; const Recibo : String);
    procedure GuardarCodigoNFeVenda(const sCNPJEmitente : String; const Ano, Numero, CodigoNF : Integer);
    procedure GuardarLoteNFeEntrada(const sCNPJEmitente : String; const Ano, Numero, NumeroLote : Integer; const Recibo : String);
    procedure GuardarCodigoNFeEntrada(const sCNPJEmitente : String; const Ano, Numero, CodigoNF : Integer);

    procedure UpdateNFeDenegadaVenda(const aCNPJEmitente : String; const aAno, aVenda : Integer; aMotivo : String);
    procedure UpdateNFeDenegadaEntrada(const aCNPJEmitente : String; const aAno, aCompra : Integer; aMotivo : String);
    procedure SetNumeroNSUPesquisado(const aEmpresa : String; aNSU : String);

    procedure LerConfiguracao(const sCNPJEmitente : String; const tipoDANFE : TTipoDANFE = tipoDANFEFast);
    procedure GravarConfiguracao(const sCNPJEmitente : String);
    procedure ConfigurarEmail(const sCNPJEmitente, sDestinatario, sAssunto, sMensagem : String);
    procedure GerarArquivoQRCODEGoogle(const FileNameQRCODE, StringQRCODE : String; const tamanhoQrCode : TTamanhoQrCode);
    procedure GerarArquivoQrCode(const FileNameQrCode, StringQrCode : String; const tamanhoQrCode : TTamanhoQrCode);
    procedure CarregarArquivoNFe(const sCNPJEmitente, sArquivo : String;
      var aNomeArquivoXML, aEmitente, aDestinatario, aRecibo, aProtocolo, aChave : String;
      var aDataHoraEmissao : TDateTime; var NotaValida : Boolean;
      var aSerie : String; var aNumero, aModelo, aVersao : Integer;
      var aTipoNota : TTipoNF;
      var aValorNF  : Currency);
    procedure ImprimirArquivoNFeDANFE(const sCNPJEmitente, sArquivo : String;
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
    procedure AbrirCompra(AnoCompra, NumeroCompra : Integer; aEmpresa : String);
    procedure AbrirNFeEmitida(AnoVenda, NumeroVenda : Integer);
    procedure AbrirNFeEmitidaEntrada(AnoCompra, NumeroCompra : Integer);
    procedure AbrirNFe(const sCNPJEmitente : String; const Modelo : Smallint; Serie : String; Numero : Integer);
    procedure AbrirCartaCorrecao(const sCNPJEmitente : String; const ControleCCe : Integer);
    procedure AbrirDestinatarioNFC(const aCNPJEmitente : String; const aCodigoNFC : Integer);
    procedure AbrirNFC(const aCNPJEmitente : String; const aCodigoNFC : Integer);
    procedure RenomearLogXmlEnvioRetornoNF(pNumeroLote : Integer; pNumeroRecibo : String;
      const pExtensao : String = 'nfe');

    function ConfigurarParamentoNFE(const pEmpresa : String) : Boolean;
    function ReciboNaoExisteNaVenda(const sRecibo : String) : Boolean;
    function ReciboNaoExisteNaEntrada(const sRecibo : String) : Boolean;
    function ValidarCFOP(const aCNPJEmitente : String; const aCodigoCliente, aCodigoFornecedor, aCFOP : Integer) : Boolean;
    function ValidarEnderecoCliente(const aCliente : Integer) : Boolean;
    function ValidarEnderecoFornecedor(const aFornecedor : Integer) : Boolean;
    function GerarNFeOnLine(const sCNPJEmitente : String) : Boolean;
    function GetInformacaoFisco(const DataSetOrigem : TDataSet) : String;
    function GetInformacaoComplementar(const sCNPJEmitente : String) : String;
    function GetValidadeCertificado(const sCNPJEmitente : String; const Informe : Boolean = FALSE) : Boolean;
    function GetNumeroSerieCertificado(const sCNPJEmitente : String) : String;
    function GetNumeroNSUPesquisado(const aEmpresa : String) : String;
    function GetFileNameDANFE_FR3 : String;

    function GetPathNFeXML(const sCNPJEmitente : String) : String;
    function GetGerarChaveNFeXML(const sCNPJEmitente : String;
      const pAno, pNumero : Integer; const tipoNF : TTipoNF) : String;

    function GerarNFeOnLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFCeOnLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFCe, iNumeroNFCe  : Integer; var FileNameXML, ChaveNFCe, ProtocoloNFCe, ReciboNFCe : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const Imprimir : Boolean = FALSE) : Boolean;

    function GerarNFeOffLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
      const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFeComplementarOnLineACBr(const aCNPJEmitente : String; aCodigoDestinatario : Integer; const aDataHoraSaida : String; const aTipoNotaOrigem : TTipoNF; const aControleNFC : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const Imprimir : Boolean = TRUE) : Boolean; virtual; abstract;

    function CancelarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer; const Motivo : String) : Boolean;

    function CancelarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor, iAnoCompra, iNumCompra : Integer; const Motivo : String) : Boolean;

    function ImprimirDANFEACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
      const IsPDF : Boolean = FALSE) : Boolean;

    function ImprimirCCeACBr(const sCNPJEmitente : String; const ControleCCe : Integer) : Boolean;

    function ImprimirDANFE_ESCPOSACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
      const ImprimirItens : Boolean = TRUE) : Boolean;

    function ImprimirDANFEEntradaACBr(const sCNPJEmitente : String; const CodFornecedor: Integer; const iAnoCompra, iNumCompra : Integer;
      const IsPDF : Boolean = FALSE) : Boolean;

    function GerarNFeEntradaOnLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
      var Denegada : Boolean; var DenegadaMotivo : String;
      const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE) : Boolean;

    function GerarNFeEntradaOffLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
      var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
      const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE) : Boolean;

    function EnviarEmailDANFEACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const iAnoVenda, iNumVenda : Integer;
      const EnviarPDF : Boolean = True; const sArquivoBoleto : String = '') : Boolean;

    function InutilizaNumeroNFeACBr(const sCNPJEmitente : String; iAno, iModelo, iSerie, iNumeroInicial, iNumeroFinal : Integer; const sJustificativa : String;
      var sRetorno, sFileXML : String) : Boolean;
    function ConsultarNumeroLoteNFeACBr(const sCNPJEmitente : String; sNumeroRecibo : String;
      var sChaveNFe, sProtocolo, sRetorno : String; var dDHEnvio : TDateTime;
      var Denegada : Boolean; var DenegadaMotivo : String) : Boolean;
    function ConsultarChaveNFeACBr(const sCNPJEmitente, sChave : String;
      var iSerieNFe, iNumeroNFe, iTipoNFe : Integer; var DestinatarioNFE, FileNameXML, ChaveNFE, ProtocoloNFE : String;
      var DataEmissao : TDateTime; const Imprimir : Boolean = TRUE) : Boolean;
    function DownloadNFeACBr(const sCNPJEmitente, sCNPJDestinatario, sChaveNFe : String; var FileNameXML : String) : Boolean;

    function EnviarEmail_Generico(const sCNPJEmitente, sNumeroDocumento, sEmailDestinatario : String;
      const sArquivo : String = '') : Boolean;

    function TipoEmissaoCupomTexto(const sCNPJEmitente : String) : Boolean;

    function ImprimirCupomNaoFiscal(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
      const BlocoImpressaoCupom : TBlocoImpressaoCupom = bicCupomRelatorioGerencial) : Boolean;

    function ImprimirCupomOrcamento(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer) : Boolean;

    function ImprimirCupomFechamentoCaixa(const sEmpresa : String;
      const iAnoCaixa, iNumCaixa : Integer) : Boolean;

    function GerarEnviarCCeACBr(const sCNPJEmitente : String; const ControleCCe : Integer; sCondicaoUso : String) : Boolean;
    function IsNFeManifestoDestinatarioRegistrado(const sCNPJ, sChave : String) : Boolean;
    function ExecutarManifestoDestinatarioNFe(const sCNPJ, sChave : String; var aLog : String) : Boolean;
    {$IF NOT (DEFINED(PRINTER_CUPOM) OR DEFINED(PDV))}
    function ExisteNFeParaBaixar(const sCNPJ : String; aNSU : Int64; var aFileName, aMensagem : String;
      var aDocumentos : TDictionary<String, TDistribuicaoDFeDocumentoRetornado>) : Boolean;
    function GetUltimoNSU(const sCNPJ : String; var NSU : String; const ExibirErro : Boolean = True) : Boolean;
    function GetMaximoNSU(const sCNPJ : String; var NSU : String) : Boolean;
    {$ENDIF}

    function GetModeloDF : Integer;
    function GetVersaoDF : Integer;
    function GetDiretorioLoteXml : String;
    function GetDiretorioXmlNFe : String;
    function IsEstacaoEmiteNFCe : Boolean;
    function IsEstacaoEmiteNFCeResumido : Boolean;
    function GetCnpjCertificado : String;
    function ValidarCnpjDocumento(const pCnpjDocumento : String) : Boolean;
    function EmissaoNFE_Pendente(const pEmpresa : String; const pAlertar : Boolean = TRUE) : Boolean;
  end;

var
  DMNFe: TDMNFe;

  procedure CorrigirXML_NFe(aString : WideString; sFileNameXML : String);

  function GetDiretorioNFe : String;
  function FormatarChaveNFe(const aChave : String) : String;

const
  UrlGoogleQrCode = 'http://chart.apis.google.com/chart?chs=%dx%d&cht=qr&chld=%s&chl=%s'; // Exemplo: http://chart.apis.google.com/chart?chs=150x150&cht=qr&chl=Isaque%20Marinho%20Ribeiro
  QrImgCorrStr    : Array [TQrImage_ErrCorrLevel] of string = ('L', 'M', 'Q', 'H');

  SELDIRHELP = 1000;

  FILENAME_NFE_FAST   = 'Report\NotaFiscalEletronica.fr3';
  FILENAME_NFE_EVENTO = 'Report\Eventos.fr3';
  FILENAME_NFE_INUTIL = 'Report\InutilizacaoNFe.fr3';

  DIRECTORY_CANCEL = 'NFe\Canceladas\';
  DIRECTORY_PRINT  = 'NFe\Imprimir\';
  DIRECTORY_CLIENT = 'NFe\Clientes\';

  PROCESSO_NFE_AUTORIZADA       = 100;
  PROCESSO_NFE_LOTE_PROCES      = 103; // Processo: Lote recebido com Sucesso
  PROCESSO_NFE_LOTE_REJEITADO   = 104; // Processo: Lote processado, mas rejeitado
  PROCESSO_NFE_LOTE_PROCESSANDO = 105; // Processo: Lote em processamento
  PROCESSO_NFE_USO_DENEGADO     = 110; // Processo: Uso denegado
  PROCESSO_NSU_ENCONTRADO       = 138; // Processo: Documento(s) Localizado(s)

  REJEICAO_NFE_EMISSOR_NAO_HABIL = 203; // Rejeicao: Emitente n�o habilitado para emiss�o de NF-e
  REJEICAO_NFE_DUPLICIDADE       = 204; // Refei��o: Duplicidade de NF-e [nRec:999999999999999]
  REJEICAO_NFE_NOTA_DENEGADA     = 205; // Rejeicao: NF-e esta denegada na base de dados da SEFAZ
  REJEICAO_NFE_IE_NAO_INFORMADO  = 232; // Rejeicao: IE do destinatario nao informado
  REJEICAO_NFE_IE_NAO_CADASTRADO = 233; // Rejeicao: IE do destinatario nao cadastrada
  REJEICAO_NFE_IE_NAO_VINCULADO  = 234; // Rejeicao: IE do destinatario nao vinculada ao CNPJ
  REJEICAO_NFE_IRREG_FISCO_EMIT  = 301; // Rejei��o: Uso Denegado: Irregularidade fiscal do emitente
  REJEICAO_NFE_IRREG_FISCO_DEST  = 302; // Rejei��o: Uso Denegado: Irregularidade fiscal do destinatario
  REJEICAO_NFE_CFOP_INVALIDO     = 327; // Refei��o: CFOP inv�lido para Nota Fiscal com finalidade de devolu��o de mercadoria

  REJEICAO_NFE_DESCOMPACT     = 416; // Rejei��o: Falha na descompacta��o da �rea de dados
  REJEICAO_NFE_BC_ICMS_ERR    = 531; // Rejei��o: Total da BC ICMS difere do somat�rio dos itens
  REJEICAO_NFE_TO_ICMS_ERR    = 532; // Rejei��o: Total do ICMS difere do somat�rio dos itens
  REJEICAO_NFE_TO_PROD_ERR    = 564; // Rejei��o: Total do Produto / Servi�o difere do somat�rio dos itens
  REJEICAO_NFE_MODELO_DIF     = 450; // Rejei��o: Modelo da NF-e diferente de 55
  REJEICAO_NFE_CFOP_DIFERENTE = 733; // Rejei��o: CFOP de opera��o interna e idDest diferente de 1
  REJEICAO_NFE_NCM_INEXIST    = 778; // Rejei��o: Informado NCM inexistente
  REJEICAO_NFCE_MODELO_DIF    = 775; // Rejei��o: Modelo da NFC-e diferente de 65
  REJEICAO_NFE_NAO_CATALOG    = 999; // Rejei��o: Erro n�o catalogado (Poss�vel falha na SEFA)

  PULAR_LINHA_FINAL = 3;

  procedure ConfigurarNFeACBr(const sCNPJEmitente : String);

implementation

uses
  System.IniFiles,
  System.IOUtils,
  System.UITypes,
  View.Certificado,
  UDMRecursos,
  Forms,
  FileCtrl,
  StdCtrls,
  UFuncoes,
  DateUtils, UEcfFactory, // pcnRetConsReciNFe, pcnDownloadNFe,
  pcnConversaoNFe,
  //pcnEnvEventoNFe,
  //pcnEventoNFe,
  ACBrSATClass;

{$R *.dfm}

(*
  IMR - 07/01/2016 :
    Inser��o da condi��o " and ib.ativo = 1" para que apenas os c�digos NCM ativos
    na tabela seja carregados para a emiss�o de NF-e.

  IMR - 08/12/2015 :
    Implementa��o da fun��o "ValidarCFOP()".
*)

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
      // Desenvolver rotina de corre��o de conte�do no arquivo
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

  // Blodo de c�digo descontinuado por n�o funcionar no Delphi XE7
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
  //Result := StringReplace(DMNFe.ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\', '\\', '\', [rfReplaceAll]);
  Result := StringReplace(DMNFe.ACBrNFe.Configuracoes.Arquivos.PathNFe + '\', '\\', '\', [rfReplaceAll]);
end;

function FormatarChaveNFe(const aChave : String) : String;
begin
  Result := Trim(FormatarChaveAcesso(aChave));
end;

procedure ConfigurarNFeACBr(const sCNPJEmitente : String);
var
 I : Integer;
begin
(*
  IMR - 09/12/2014 :
    Disponiblizar configura��o para emiss�o e impress�o de NFC-e.
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
      ConfigACBr.ckAdicionaLiteral.Enabled := (gSistema.Codigo <> SISTEMA_PDV);
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

  if sCNPJ.Trim.IsEmpty then
    sCNPJ := gUsuarioLogado.Empresa;

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
  {$IFNDEF PRINTER_CUPOM}
  SplashMessage('Carregando par�metros para emiss�o de NF-e...');
  {$ENDIF}

  if not DataBaseOnLine then
    Exit;

  ver := TVersaoController.GetInstance();
  
  AbrirEmitente( GetEmpresaIDDefault );
  ConfigACBr := TfrmGeConfigurarNFeACBr.Create(Application);

  ConfigACBr.sbtnGetCert.OnClick := SelecionarCertificado;
  ConfigACBr.btnServico.OnClick  := TestarServico;

  {$IFNDEF PRINTER_CUPOM}
  frDANFE.Sistema := gPersonalizaEmpresa.CompanyName + ' - Contato(s): ' + gPersonalizaEmpresa.Contacts;
  {$ELSE}
  frDANFE.Sistema := AGIL_SOFTWARES_FANTASIA;
  {$ENDIF}

  // A leitura do Certificado ser� feita agora apenas na emiss�o da NF-e
  //LerConfiguracao(GetEmpresaIDDefault);

  fr3Designer := TfrxDesigner.Create(Self);

  GerarTabela_CST_PIS;
  GerarTabela_CST_COFINS;

  FImprimirCabecalho := True;

//  ESSE BLOCO EST� CAUSANDO PROBLEMAS (BUSCAR NOVA SOLU�AO PARA DISTRIBUI��O DE ARQUIVOS)
//  try
//    frrNFeRetrato.SaveToFile( ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST );
//    frrNFeRetrato.SaveToFile ( StringReplace(ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST, '.fr3', '_Retrato.fr3',  [rfReplaceAll]) );
//    frrNFePaisagem.SaveToFile( StringReplace(ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST, '.fr3', '_Paisagem.fr3', [rfReplaceAll]) );
//    frrNFeEventoCCe.SaveToFile   ( ExtractFilePath(ParamStr(0)) + FILENAME_NFE_EVENTO );
//    frrNFeInutilizacao.SaveToFile( ExtractFilePath(ParamStr(0)) + FILENAME_NFE_INUTIL );
//
//    frrBoletoEntrega.SaveToFile( ExtractFilePath(ParamStr(0)) + LAYOUT_BOLETO_ENTREGA );
//    frrBoletoFatura.SaveToFile ( ExtractFilePath(ParamStr(0)) + LAYOUT_BOLETO_FATURA );
//    frrBoletoCarne.SaveToFile  ( ExtractFilePath(ParamStr(0)) + LAYOUT_BOLETO_CARNE );
//
//    if not FileExists(ExtractFilePath(ParamStr(0)) + LAYOUT_BOLETO) then
//      frrBoletoEntrega.SaveToFile( ExtractFilePath(ParamStr(0)) + LAYOUT_BOLETO );
//  except
//    ;
//  end;
end;

procedure TDMNFe.GravarConfiguracao(const sCNPJEmitente : String);
Var
  sPrefixoSecao : String;
  StreamMemo    : TMemoryStream;

  sSecaoCertificado,
  sSecaoGeral      ,
  sSecaoEmitente   ,
  sSecaoWebService ,
  sSecaoArquivos   : String;
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
    sSecaoArquivos    := sPrefixoSecao + INI_SECAO_ARQUIVOS;

    with ConfigACBr, FileINI do
    begin
      WriteString( sSecaoCertificado, 'Caminho' , edtCaminho.Text) ;
      WriteString( sSecaoCertificado, 'Senha'   , edtSenha.Text) ;
      WriteString( sSecaoCertificado, 'NumSerie', edtNumSerie.Text) ;
      WriteString( sSecaoCertificado, 'URL'     , edtURLPFX.Text) ;

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

      WriteBool  (sSecaoArquivos, 'Salvar'        , ckSalvarArqs.Checked) ;
      WriteBool  (sSecaoArquivos, 'PastaMensal'   , ckPastaMensal.Checked) ;
      WriteBool  (sSecaoArquivos, 'AddLiteral'    , ckAdicionaLiteral.Checked) ;
      WriteBool  (sSecaoArquivos, 'EmissaoPathNFe', ckEmissaoPathNFe.Checked) ;
      WriteBool  (sSecaoArquivos, 'SalvarCCeCanPathEvento', ckSalvaCCeCancelamentoPathEvento.Checked) ;
      WriteBool  (sSecaoArquivos, 'SepararPorCNPJ'        , ckSepararPorCNPJ.Checked) ;
      WriteBool  (sSecaoArquivos, 'SepararPorModelo'      , ckSepararPorModelo.Checked) ;
      WriteString(sSecaoArquivos, 'PathNFe'     , edPathNFe.Text) ;
      WriteString(sSecaoArquivos, 'PathCan'     , edPathCan.Text) ;
      WriteString(sSecaoArquivos, 'PathInu'     , edPathInu.Text) ;
      WriteString(sSecaoArquivos, 'PathDPEC'    , edPathDPEC.Text) ;
      WriteString(sSecaoArquivos, 'PathCCe'     , edPathCCe.Text) ;
      WriteString(sSecaoArquivos, 'PathEvento'  , edPathEvento.Text) ;
      WriteString(sSecaoArquivos, 'PathDownload', edPathDownload.Text) ;

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
      WriteString( sSecaoEmitente, 'InfoComple' , edInfoComplementar.Text) ;

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
  sFileNFEFast   ,
  sFileNFEEvento ,
  sFileNFEInutil : String;

  sSecaoCertificado,
  sSecaoGeral      ,
  sSecaoEmitente   ,
  sSecaoWebService ,
  sSecaoArquivos   : String;
begin
(*
  IMR - 09/09/2020 :
    Ajustes na parametriza��o de leitura do certificado.
    Deixar em bloco separado a configura��o do componente ACBr.

  IMR - 11/06/2018 :
    Remo��o da linha "ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := True"
    na nova vers�o do c�digo-fonte ACBr.

  IMR - 29/05/2015 :
    Inser��o de novos controles WebService para controle do envio e recebimento das NFs.

  IMR - 28/10/2014 :
    Inser��o do campo "Vers�o NF-e:" para definir na tela de configura��es a vers�o de emiss�o da NF-e

  IMR - 05/12/2014 :
    Definir configura��es do RFD   - Registro do Fisco CAT 52/07. Configura��o importante para emiss�o de CUPOM
    Definir configura��es do NFC-e - Inser��o/configura��o dos componentes necess�rios a Emiss�o de Cupons de NFC-e

  IMR - 30/09/2014 :
    Retorno a vers�o 2.0 da NF-e por a vers�o 3.10 ainda apresentar inconsist�ncias segundo a SEFA em determinados processos. A reativa��o
    da vers�o 3.10 e sua libera��o para uso est� agora para 30/10/2014.

    Aten��o: Prazo final de uso da Vers�o 2.00, at� 30/11/2014. Sendo, at� esta data, recepcionado as duas vers�es. A desativa��o da vers�o
    "2.00" ser� no dia 01/12/2014. (Fonte: http://portalnfe.fazenda.mg.gov.br/)
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
    sSecaoArquivos    := sPrefixoSecao + INI_SECAO_ARQUIVOS;

    with ConfigACBr, FileINI do
    begin

      {$IFDEF ACBrNFeOpenSSL}
         edtCaminho.Text  := ReadString( sSecaoCertificado, 'Caminho' , '') ;
         edtSenha.Text    := ReadString( sSecaoCertificado, 'Senha'   , '') ;
         edtURLPFX.Text   := ReadString( sSecaoCertificado, 'URL' , '') ;
         edtNumSerie.Visible := False;
         Label25.Visible     := False;
         sbtnGetCert.Visible := False;
      {$ELSE}
         edtURLPFX.Text      := ReadString( sSecaoCertificado, 'URL' , '') ;
         edtNumSerie.Text    := ReadString( sSecaoCertificado, 'NumSerie', '') ;
         lbltCaminho.Caption := 'Informe o n�mero de s�rie do certificado'#13+
                                'Dispon�vel no Internet Explorer no menu'#13+
                                'Ferramentas - Op��es da Internet - Conte�do '#13+
                                'Certificados - Exibir - Detalhes - '#13+
                                'N�mero do certificado';
         lbltSenha.Visible  := False;
         edtCaminho.Visible := False;
         edtSenha.Visible   := False;
         sbtnCaminhoCert.Visible := False;
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

      ckSalvarArqs.Checked                     := ReadBool(sSecaoArquivos, 'Salvar'        , True);
      ckPastaMensal.Checked                    := ReadBool(sSecaoArquivos, 'PastaMensal'   , False);
      ckAdicionaLiteral.Checked                := IfThen(gSistema.Codigo = SISTEMA_PDV, True, ReadBool(sSecaoArquivos, 'AddLiteral', False));
      ckEmissaoPathNFe.Checked                 := ReadBool(sSecaoArquivos, 'EmissaoPathNFe', False);
      ckSalvaCCeCancelamentoPathEvento.Checked := ReadBool(sSecaoArquivos, 'SalvarCCeCanPathEvento', False);
      ckSepararPorCNPJ.Checked                 := ReadBool(sSecaoArquivos, 'SepararPorCNPJ'        , False);
      ckSepararPorModelo.Checked               := ReadBool(sSecaoArquivos, 'SepararPorModelo'      , False);

      edPathNFe.Text      := ACBrNFe.Configuracoes.Arquivos.PathNFe;
      edPathInu.Text      := ACBrNFe.Configuracoes.Arquivos.PathInu;
      edPathEvento.Text   := ACBrNFe.Configuracoes.Arquivos.PathEvento;
      edPathDownload.Text := StringReplace(edPathLogs.Text + '\Down',   '\\', '\', [rfReplaceAll]); //ACBrNFe.Configuracoes.Arquivos.DownloadNFe.PathDownload;

      cbUF.ItemIndex       := cbUF.Items.IndexOf(ReadString( sSecaoWebService, 'UF', 'PA')) ;
      rgTipoAmb.ItemIndex  := ReadInteger(sSecaoWebService, 'Ambiente'  , 0) ;
      cbVersaoDF.ItemIndex := ReadInteger(sSecaoWebService, 'VersaoNFe' , 0) ;
      ckVisualizar.Checked := ReadBool   (sSecaoWebService, 'Visualizar', ACBrNFe.Configuracoes.WebServices.Visualizar) ;
      ckSalvarSOAP.Checked := ReadBool   (sSecaoWebService, 'SalvarSOAP', ACBrNFe.Configuracoes.WebServices.Salvar) ;
      ckAjustarAut.Checked := ReadBool   (sSecaoWebService, 'AjustarAut', False) ;
      edAguardar.Text      := ReadString (sSecaoWebService, 'Aguardar'  , '0') ;
      edTentativas.Text    := ReadString (sSecaoWebService, 'Tentativas', '5') ;
      edIntervalo.Text     := ReadString (sSecaoWebService, 'Intervalo' , '0') ;

      edtProxyHost.Text  := ReadString( 'Proxy', 'Host'  , '') ;
      edtProxyPorta.Text := ReadString( 'Proxy', 'Porta' , '') ;
      edtProxyUser.Text  := ReadString( 'Proxy', 'User'  , '') ;
      edtProxySenha.Text := ReadString( 'Proxy', 'Pass'  , '') ;

      rgTipoDanfe.ItemIndex := ReadInteger( sSecaoGeral, 'DANFE'     , 0) ;
      edtLogoMarca.Text     := ReadString ( sSecaoGeral, 'LogoMarca' , ExtractFilePath(ParamStr(0)) + sCNPJEmitente + '.bmp') ;

      edtEmitCNPJ.Text        := ReadString( sSecaoEmitente, 'CNPJ'       , EmptyStr ) ;
      edtEmitIE.Text          := ReadString( sSecaoEmitente, 'IE'         , EmptyStr ) ;
      edtEmitRazao.Text       := ReadString( sSecaoEmitente, 'RazaoSocial', EmptyStr ) ;
      edtEmitFantasia.Text    := ReadString( sSecaoEmitente, 'Fantasia'   , EmptyStr ) ;
      edtEmitFone.Text        := ReadString( sSecaoEmitente, 'Fone'       , EmptyStr ) ;
      edtEmitCEP.Text         := ReadString( sSecaoEmitente, 'CEP'        , EmptyStr ) ;
      edtEmitLogradouro.Text  := ReadString( sSecaoEmitente, 'Logradouro' , EmptyStr ) ;
      edtEmitNumero.Text      := ReadString( sSecaoEmitente, 'Numero'     , EmptyStr ) ;
      edtEmitComp.Text        := ReadString( sSecaoEmitente, 'Complemento', EmptyStr ) ;
      edtEmitBairro.Text      := ReadString( sSecaoEmitente, 'Bairro'     , EmptyStr ) ;
      edtEmitCodCidade.Text   := ReadString( sSecaoEmitente, 'CodCidade'  , EmptyStr ) ;
      edtEmitCidade.Text      := ReadString( sSecaoEmitente, 'Cidade'     , EmptyStr ) ;
      edtEmitUF.Text          := ReadString( sSecaoEmitente, 'UF'         , EmptyStr ) ;
      //edInfoFisco.Text        := ReadString( sSecaoEmitente, 'InfoFisco'  , 'EMPRESA OPTANTE PELO SIMPLES DE ACORDO COM A LEI COMPLEMENTAR 123, DE DEZEMBRO DE 2006' ) ;
      edInfoFisco.Text        := ReadString( sSecaoEmitente, 'InfoFisco'  , EmptyStr) ;
      edInfoComplementar.Text := ReadString( sSecaoEmitente, 'InfoComple' , EmptyStr) ;

      // ============== Configurar Componente ACBr ============== //

      ACBrNFe.Configuracoes.Certificados.URLPFX      := Trim(edtURLPFX.Text);
      ACBrNFe.Configuracoes.Certificados.ArquivoPFX  := Trim(edtCaminho.Text);
      ACBrNFe.Configuracoes.Certificados.Senha       := Trim(edtSenha.Text);
      ACBrNFe.Configuracoes.Certificados.NumeroSerie := Trim(edtNumSerie.Text);

      with ACBrNFe.Configuracoes do
      begin
        Arquivos.PathSalvar  := edPathLogs.Text;
        Arquivos.PathSchemas := edPathSchemas.Text;

        Arquivos.PathNFe     := StringReplace(Arquivos.PathSalvar + '\NFe',         '\\', '\', [rfReplaceAll]);
        Arquivos.PathInu     := StringReplace(Arquivos.PathSalvar + '\NFeInutiliz', '\\', '\', [rfReplaceAll]);
        Arquivos.PathEvento  := StringReplace(Arquivos.PathSalvar + '\NFeEvento',   '\\', '\', [rfReplaceAll]);
      end;

      with ACBrNFe.Configuracoes.Arquivos do
      begin
        Salvar             := ckSalvarArqs.Checked; // Se TRUE o componente salva em disco os arquivos que tem validade jur�dica, tais como: *-nfe.xml, *-procEventoNFe.xml e *-procInutNFe.xml
        AdicionarLiteral   := ckAdicionaLiteral.Checked;
        EmissaoPathNFe     := ckEmissaoPathNFe.Checked;
        SepararPorCNPJ     := ckSepararPorCNPJ.Checked;
        SepararPorModelo   := ckSepararPorModelo.Checked;
      end;

      // ===== Configurar librarys para uso dos certificados SSL, TLS, ETC... =====

      try
        with ACBrNFe.Configuracoes.Geral do
        begin
          SSLLib        := TSSLLib.libCapicom;
          SSLCryptLib   := TSSLCryptLib.cryCapicom;
          SSLHttpLib    := TSSLHttpLib.httpWinINet;
          SSLXmlSignLib := TSSLXmlSignLib.xsMsXmlCapicom;
        end;
      except
        with ACBrNFe.Configuracoes.Geral do
        begin
          SSLLib        := TSSLLib.libWinCrypt;
          SSLCryptLib   := TSSLCryptLib.cryWinCrypt;
          SSLHttpLib    := TSSLHttpLib.httpWinINet;
          SSLXmlSignLib := TSSLXmlSignLib.xsMsXml;
        end;
      end;

      ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado := ckAtualizarXML.Checked;
      ACBrNFe.Configuracoes.Geral.ExibirErroSchema      := ckExibirErroSchema.Checked;
      ACBrNFe.Configuracoes.Geral.FormatoAlerta         := edFormatoAlerta.Text;
      ACBrNFe.Configuracoes.Geral.FormaEmissao   := StrToTpEmis(OK, IntToStr(cbFormaEmissao.ItemIndex + 1));
      ACBrNFe.Configuracoes.Geral.Salvar         := ckSalvar.Checked; // Se TRUE o componente salva em disco os arquivos de envio e de retorno da SEFAZ, esses XML n�o tem validade jur�dica.
      ACBrNFe.Configuracoes.Geral.RetirarAcentos := ckRetirarAcentos.Checked;

      ACBrNFe.Configuracoes.Geral.IdCSC          := FormatFloat('000000', StrToIntDef(Trim(edIdToken.Text), 1));
      ACBrNFe.Configuracoes.Geral.CSC            := edToken.Text;
      ACBrNFe.Configuracoes.Geral.VersaoQRCode   := TpcnVersaoQrCode.veqr200;

      ACBrNFe.Configuracoes.Geral.ModeloDF := moNFe;
      ACBrNFe.Configuracoes.Geral.VersaoDF := TpcnVersaoDF.ve400; // TpcnVersaoDF(cbVersaoDF.ItemIndex);

      if ( tipoDANFE = tipoDANFEFast ) then
        ACBrNFe.DANFE := frDANFE
      else
      if ( tipoDANFE = tipoDANFE_ESCPOS ) then
        ACBrNFe.DANFE := nfcDANFE;

      ACBrNFe.Configuracoes.WebServices.UF         := cbUF.Text;
      ACBrNFe.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok, IntToStr(rgTipoAmb.ItemIndex + 1));
      ACBrNFe.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;
      ACBrNFe.Configuracoes.WebServices.Salvar     := ckSalvarSOAP.Checked; // Se TRUE o componente salva em disco os arquivos de envio e de retorno da SEFAZ sem nenhum tratamento realizado pelo componente, esses XML n�o tem validade jur�dica e seus nomes � acrescentado o sufixo -soap.

      ACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := ckAjustarAut.Checked;
      if NaoEstaVazio(edAguardar.Text)then
        ACBrNFe.Configuracoes.WebServices.AguardarConsultaRet := IfThen(StrToInt(edAguardar.Text) < 1000, StrToInt(edAguardar.Text) * 1000, StrToInt(edAguardar.Text))
      else
        edAguardar.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.AguardarConsultaRet);

      if NaoEstaVazio(edTentativas.Text) then
        ACBrNFe.Configuracoes.WebServices.Tentativas := StrToInt(edTentativas.Text)
      else
        edTentativas.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.Tentativas);

      if NaoEstaVazio(edIntervalo.Text) then
        ACBrNFe.Configuracoes.WebServices.IntervaloTentativas := IfThen(StrToInt(edIntervalo.Text) < 1000, StrToInt(edIntervalo.Text) * 1000, StrToInt(edIntervalo.Text))
      else
        edIntervalo.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.IntervaloTentativas);

      ACBrNFe.Configuracoes.WebServices.ProxyHost := edtProxyHost.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPort := edtProxyPorta.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyUser := edtProxyUser.Text;
      ACBrNFe.Configuracoes.WebServices.ProxyPass := edtProxySenha.Text;

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

      // ============== Configura��o para envio de e-mails ============== //

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
        cbUF.ItemIndex         := cbUF.Items.IndexOf(ReadString( sSecaoWebService, 'UF', Trim(qryEmitenteEST_SIGLA.AsString))) ;
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

    // ============== Definir configura��es do RFD - Registro do Fisco CAT 52/07 ============== //

    with ACBrRFD, ConfigACBr  do
    begin
      DirRFD := ExtractFilePath(ParamStr(0)) + Trim(sCNPJEmitente) + '\rfd';

      if Trim(DirECF)    <> EmptyStr then ForceDirectories(DirECF);
      if Trim(DirECFLog) <> EmptyStr then ForceDirectories(DirECFLog);
      if Trim(DirECFMes) <> EmptyStr then ForceDirectories(DirECFMes);
      if Trim(DirRFD)    <> EmptyStr then ForceDirectories(DirRFD);

      SH_COO  := EmptyStr; // Contador de Opera��o Fiscal
      SH_CNPJ := StrFormatarCnpj(edtEmitCNPJ.Text);
      SH_IE   := edtEmitIE.Text;
      SH_IM   := qryEmitenteIM.AsString;
      SH_RazaoSocial      := edtEmitRazao.Text;
      {$IFNDEF PRINTER_CUPOM}
      SH_NomeAplicativo   := gPersonalizaEmpresa.ProductName;
      {$ELSE}
      SH_NomeAplicativo   := 'PDV | Controle do Ponto de Venda do SGE/SGI';
      {$ENDIF}
      SH_VersaoAplicativo := TVersaoController.GetInstance().Version;
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

    // ============== Configura��es necess�rias e Emiss�o da NFC-e ============== //

    with ACBrSAT, Config, ConfigArquivos, ConfigACBr do
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

    //ACBrSATExtratoESCPOS.SoftwareHouse := RemoveAcentos( GetCompanyName );
    ACBrSATExtratoESCPOS.NumCopias     := FileIni.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_CUPOM_NFISCAL_QTDE, 1);;

    {$IFNDEF PRINTER_CUPOM}
    nfcDANFE.Sistema   := RemoveAcentos( gPersonalizaEmpresa.CompanyName );
    nfcDANFE.Usuario   := RemoveAcentos( GetUserApp(gUsuarioLogado.Login) );
    {$ELSE}
    nfcDANFE.Sistema   := 'PDV | Controle do Ponto de Venda do SGE/SGI';
    nfcDANFE.Usuario   := 'USER SYSTEM';
    {$ENDIF}


    nfcDANFE.PosPrinter.Modelo       := TACBrPosPrinterModelo(FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_ID', 0));
    nfcDANFE.PosPrinter.Device.Porta := FileINI.ReadString (INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL + '_DS', 'COM1');
    nfcDANFE.PosPrinter.Device.Baud  := 9600;   // StrToInt(cbxVelocidade.Text);
    nfcDANFE.PosPrinter.IgnorarTags  := False;  // chkIgnorarTagsFormatacao.Checked;
    nfcDANFE.ImprimeEmUmaLinha       := False;  // chkImprimirItem1Linha.Checked;
    nfcDANFE.ImprimeDescAcrescItem   := False;  // chkImprimirDescAcresItem.Checked;
    nfcDANFE.NumCopias               := FileIni.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_CUPOM_NFISCAL_QTDE, 1);;

    if FilesExists(ConfigACBr.edtLogoMarca.Text) then
    begin
      ACBrSATExtratoESCPOS.PictureLogo.LoadFromFile(ConfigACBr.edtLogoMarca.Text);
     // nfcDANFE.Logo := ConfigACBr.edtLogoMarca.Text; // -- Esta chamada ao arquivo de logotipo da empresa gera erro na impress�o
    end;

  finally
    sFileNFEFast   := GetFileNameDANFE_FR3;
    sFileNFEEvento := ExtractFilePath(ParamStr(0)) + FILENAME_NFE_EVENTO;
    sFileNFEInutil := ExtractFilePath(ParamStr(0)) + FILENAME_NFE_INUTIL;

    if ( not FileExists(sFileNFEFast) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFEFast) + ' n�o encontrado!' );

    if ( not FileExists(sFileNFEEvento) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFEEvento) + ' n�o encontrado!' );

    if ( not FileExists(sFileNFEInutil) ) then
      ShowError( 'Arquivo ' + QuotedStr(sFileNFEInutil) + ' n�o encontrado!' );

    ACBrNFe.DANFE.Email := qryEmitenteEMAIL.AsString;
    ACBrNFe.DANFE.Site  := qryEmitenteHOME_PAGE.AsString;

    if ACBrNFe.DANFE is TACBrNFeDANFEFR then
    begin
      TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFile       := sFileNFEFast;
      TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFileEvento := sFileNFEEvento;
      TACBrNFeDANFEFR(ACBrNFe.DANFE).FastFileInutilizacao := sFileNFEInutil;
    end;
  end;
end;

procedure TDMNFe.SelecionarCertificado(Sender: TObject);
var
  i      : Integer;
  ASerie : String;
  AddRow : Boolean;
  AForm  : TViewCertificado;
begin
//  {$IFNDEF ACBrNFeOpenSSL}
//  ConfigACBr.edtNumSerie.Text := ACBrNFe.SSL.SelecionarCertificado;
//  {$ENDIF}
  AForm := TViewCertificado.Create(Self);
  try
    ACBrNFe.SSL.LerCertificadosStore;
    AddRow := False;

    with AForm.stgCertificado do
    begin
      ColWidths[0] := 170;
      ColWidths[1] := 250;
      ColWidths[2] := 120;
      ColWidths[3] := 80;
      ColWidths[4] := 150;
      Cells[0, 0] := 'Num.S�rie';
      Cells[1, 0] := 'Raz�o Social';
      Cells[2, 0] := 'CNPJ';
      Cells[3, 0] := 'Validade';
      Cells[4, 0] := 'Certificadora';
    end;

    for i := 0 to ACBrNFe.SSL.ListaCertificados.Count - 1 do
    begin
      with ACBrNFe.SSL.ListaCertificados[i] do
      begin
        ASerie := NumeroSerie;
        if (CNPJ <> '') then
        begin
          with AForm.stgCertificado do
          begin
            if AddRow then
              RowCount := RowCount + 1;

            Cells[0, RowCount - 1] := NumeroSerie;
            Cells[1, RowCount - 1] := RazaoSocial;
            Cells[2, RowCount - 1] := CNPJ;
            Cells[3, RowCount - 1] := FormatDateBr(DataVenc);
            Cells[4, RowCount - 1] := Certificadora;

            AddRow := True;
          end;
        end;
      end;
    end;

    if (AForm.ShowModal = mrOK) then
      ConfigACBr.edtNumSerie.Text := AForm.stgCertificado.Cells[0, AForm.stgCertificado.Row];
  finally
    FreeAndNil(AForm);
  end;
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
    if not GetConectedInternet then
      ShowWarning('Est� esta��o est� sem acesso � Internet')
    else
    begin
      with ConfigACBr, ACBrNFe, memInfo do
      begin

        WebServices.StatusServico.Executar;

        memResp.Add  ( UTF8Encode(WebServices.StatusServico.RetWS) );
        memRespWS.Add( UTF8Encode(WebServices.StatusServico.RetornoWS) );

        LoadXML(memResp, WBResposta);

        Add('');
        Add('Status Servi�o para o Emitente ' + StrFormatarCnpj(gUsuarioLogado.Empresa));
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
    end;
  finally
    memResp.Free;
    memRespWS.Free;
    memInfo.Free;
  end;
end;

function TDMNFe.TipoEmissaoCupomTexto(const sCNPJEmitente : String): Boolean;
var
  aTipoEmissao : TEcfTipo;
begin
  LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);
  aTipoEmissao := TEcfTipo(FileINI.ReadInteger(INI_SECAO_CUMPO_PDV, INI_KEY_PORTA_CUPOM_NFISCAL_MOD + '_TP', 0));
  Result := (aTipoEmissao in [ecfPadraoWindows, ecfLPTX, ecfTEXTO]);
end;

procedure TDMNFe.LoadXML(MyMemo: TStringList; MyWebBrowser: TWebBrowser);
begin
  MyMemo.SaveToFile( PathWithDelim(ExtractFileDir(application.ExeName))     + 'temp.xml' );
  MyWebBrowser.Navigate( PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml' );
end;

function TDMNFe.ConfigurarParamentoNFE(const pEmpresa : String) : Boolean;
var
  bRetorno : Boolean;
begin
  bRetorno := True;
  try
    AbrirEmitente(pEmpresa);
    bRetorno := (qryEmitente.RecordCount = 0) or (qryEmitenteRECONFIGURAR.AsInteger = 1);
  finally
    Result := bRetorno;
  end;
end;

function TDMNFe.ReciboNaoExisteNaVenda(const sRecibo : String) : Boolean;
begin
  Result := (Trim(sRecibo) = EmptyStr);

  if not Result then
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('  lote_nfe_recibo as recibo ');
      SQL.Add('from TBVENDAS ');
      SQL.Add('where lote_nfe_recibo = ' + QuotedStr(sRecibo));
      Open;

      Result := IsEmpty;

      Close;
    end;
end;

procedure TDMNFe.RenomearLogXmlEnvioRetornoNF(pNumeroLote : Integer; pNumeroRecibo : String;
  const pExtensao : String = 'nfe');
var
  sNovaExtensao,
  sLogXmlEnv   ,
  sLogXmlRec   : String;
begin
  sNovaExtensao := '.xml.' + IfThenStr(Trim(pExtensao) = EmptyStr, 'nf', Trim(pExtensao));

  // Renomer no diret�rio os arquivos XML de envio e retorno dos lotes de NF-e
  sLogXmlEnv := StringReplace(ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\' + IntToStr(pNumeroLote) + '-env-lot.xml', '\\', '/', [rfReplaceAll]);
  sLogXmlRec := StringReplace(ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\' + IntToStr(pNumeroLote) + '-rec.xml',     '\\', '/', [rfReplaceAll]);
  RenameFile(sLogXmlEnv, StringReplace(sLogXmlEnv, '.xml', sNovaExtensao, [rfReplaceAll]));
  RenameFile(sLogXmlRec, StringReplace(sLogXmlRec, '.xml', sNovaExtensao, [rfReplaceAll]));
  // Renomer no diret�rio os arquivos XML de envio e retorno dos recibos de NF-e
  sLogXmlEnv := StringReplace(ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\' + pNumeroRecibo + '-ped-rec.xml', '\\', '/', [rfReplaceAll]);
  sLogXmlRec := StringReplace(ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\' + pNumeroRecibo + '-pro-rec.xml', '\\', '/', [rfReplaceAll]);
  RenameFile(sLogXmlEnv, StringReplace(sLogXmlEnv, '.xml', sNovaExtensao, [rfReplaceAll]));
  RenameFile(sLogXmlRec, StringReplace(sLogXmlRec, '.xml', sNovaExtensao, [rfReplaceAll]));
end;

function TDMNFe.ReciboNaoExisteNaEntrada(const sRecibo : String) : Boolean;
begin
  Result := (Trim(sRecibo) = EmptyStr);

  if not Result then
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select lote_nfe_recibo as recibo from TBCOMPRAS where lote_nfe_recibo = ' + QuotedStr(sRecibo));
      Open;

      Result := IsEmpty;

      Close;
    end;
end;

function TDMNFe.ValidarCFOP(const aCNPJEmitente : String; const aCodigoCliente, aCodigoFornecedor, aCFOP : Integer) : Boolean;
var
  sCFOP       ,
  sUFOrigem   ,
  sUFDestino  ,
  sPaisOrigem ,
  sPaisDestino,
  sMensagem   : String;
begin
  sMensagem := EmptyStr;
  sCFOP     := IntToStr(aCFOP);

  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select uf, pais_id from TBEMPRESA where cnpj = ' + QuotedStr(aCNPJEmitente));
    Open;

    sUFOrigem   := Trim(FieldByName('uf').AsString);
    sPaisOrigem := Trim(FieldByName('pais_id').AsString);

    Close;
    SQL.Clear;
    if ( aCodigoCliente > 0 ) then
      SQL.Add('Select uf, pais_id from TBCLIENTE where codigo = ' + IntToStr(aCodigoCliente))
    else
    if ( aCodigoFornecedor > 0 ) then
      SQL.Add('Select uf, pais_id from TBFORNECEDOR where codforn = ' + IntToStr(aCodigoFornecedor));
    Open;

    sUFDestino   := Trim(FieldByName('uf').AsString);
    sPaisDestino := Trim(FieldByName('pais_id').AsString);

    if ( sPaisOrigem = sPaisDestino ) then
    begin
      if (sUFOrigem = sUFDestino) then
        if not (sCFOP[1] in ['1', '5']) then
          sMensagem := Format('(1) CFOP inv�lida para movimenta��o de mercadorias dentro do pr�prio Estado [%s, %s, %s].', [sUFOrigem, sUFDestino, sCFOP]);

      if (sUFOrigem <> sUFDestino) then
        if not (sCFOP[1] in ['2', '6']) then
          sMensagem := Format('(2) CFOP inv�lida para movimenta��o de mercadorias entre Estados diferentes [%s, %s, %s].', [sUFOrigem, sUFDestino, sCFOP]);
    end
    else
    if not (sCFOP[1] in ['3', '7']) then
      sMensagem := Format('(3) CFOP inv�lida para movimenta��o de mercadorias para fora do Pa�s [%s, %s, %s].', [sPaisOrigem, sPaisDestino, sCFOP]);

    Close;
  end;

  Result := (Trim(sMensagem) = EmptyStr);
  if not Result then
    ShowStop(sMensagem);
end;

function TDMNFe.ValidarEnderecoCliente(const aCliente : Integer) : Boolean;
var
  sCliente  ,
  sMensagem : String;
begin
  sMensagem := EmptyStr;
  sCliente  := IntToStr(aCliente);

  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    c.codigo');
    SQL.Add('  , c.ender');
    SQL.Add('  , c.numero_end');
    SQL.Add('  , c.complemento');
    SQL.Add('  , c.bairro');
    SQL.Add('  , c.cidade');
    SQL.Add('  , c.uf');
    SQL.Add('  , m.cid_ibge');
    SQL.Add('  , c.cep');
    SQL.Add('  , coalesce(c.ender, '''')');
    SQL.Add('    || coalesce('', ''  || nullif(trim(c.numero_end), ''''), '''')');
    SQL.Add('    || coalesce('' - '' || nullif(trim(c.bairro), ''''), '''')');
    SQL.Add('    || coalesce('' - '' || nullif(trim(c.cidade), ''''), '''')');
    SQL.Add('    || coalesce('' - CEP '' || substring(nullif(trim(c.cep), '''') from 1 for 2) || ''.'' || substring(nullif(trim(c.cep), '''') from 3 for 3) || ''-'' || substring(nullif(trim(c.cep), '''') from 6 for 3), '''')');
    SQL.Add('    as endereco_completo');
    SQL.Add('from TBCLIENTE c');
    SQL.Add('  left join TBCIDADE m on (m.cid_cod = c.cid_cod)');
    SQL.Add('where c.codigo = ' + sCliente);
    Open;

    if (Trim(FieldByName('ender').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- Logradouro n�o informado' + #13;
    if (Trim(FieldByName('numero_end').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- N�medo do endere�o n�o informado' + #13;
    if (Trim(FieldByName('bairro').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- Bairro n�o informado' + #13;
    if (Trim(FieldByName('cidade').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- Cidade n�o informada' + #13;
    if (Trim(FieldByName('cid_ibge').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- C�digo IBGE da cidade n�o informado' + #13;
    if (Trim(FieldByName('cep').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- N�mero do CEP n�o informado' + #13;

    Close;
  end;

  Result := (Trim(sMensagem) = EmptyStr);
  if not Result then
    ShowStop('Endere�o do cliente incompleto:' + #13 + sMensagem);
end;

function TDMNFe.ValidarEnderecoFornecedor(const aFornecedor : Integer) : Boolean;
var
  sFornecedor,
  sMensagem  : String;
begin
  sMensagem   := EmptyStr;
  sFornecedor := IntToStr(aFornecedor);

  with DMBusiness, fdQryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('    f.codforn');
    SQL.Add('  , f.ender');
    SQL.Add('  , f.numero_end');
    SQL.Add('  , f.complemento');
    SQL.Add('  , b.bai_nome as bairro');
    SQL.Add('  , m.cid_nome as cidade');
    SQL.Add('  , f.uf');
    SQL.Add('  , m.cid_ibge');
    SQL.Add('  , f.cep');
    SQL.Add('  , coalesce(f.ender, '''')');
    SQL.Add('    || coalesce('', ''  || nullif(trim(f.numero_end), ''''), '''')');
    SQL.Add('    || coalesce('' - '' || nullif(trim(b.bai_nome), ''''), '''')');
    SQL.Add('    || coalesce('' - '' || nullif(trim(m.cid_nome), ''''), '''')');
    SQL.Add('    || coalesce('' - CEP '' || substring(nullif(trim(f.cep), '''') from 1 for 2) || ''.'' || substring(nullif(trim(f.cep), '''') from 3 for 3) || ''-'' || substring(nullif(trim(f.cep), '''') from 6 for 3), '''')');
    SQL.Add('    as endereco_completo');
    SQL.Add('from TBFORNECEDOR f');
    SQL.Add('  left join TBCIDADE m on (m.cid_cod = f.cid_cod)');
    SQL.Add('  left join TBBAIRRO b on (b.bai_cod = f.bai_cod)');
    SQL.Add('where f.codforn = ' + sFornecedor);
    Open;

    if (Trim(FieldByName('ender').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- Logradouro n�o informado' + #13;
    if (Trim(FieldByName('numero_end').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- N�medo do endere�o n�o informado' + #13;
    if (Trim(FieldByName('bairro').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- Bairro n�o informado' + #13;
    if (Trim(FieldByName('cidade').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- Cidade n�o informada' + #13;
    if (Trim(FieldByName('cid_ibge').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- C�digo IBGE da cidade n�o informado' + #13;
    if (Trim(FieldByName('cep').AsString) = EmptyStr) then
      sMensagem := sMensagem + '- N�mero do CEP n�o informado' + #13;

    Close;
  end;

  Result := (Trim(sMensagem) = EmptyStr);
  if not Result then
    ShowStop('Endere�o do cliente incompleto:' + #13 + sMensagem);
end;

function TDMNFe.GerarNFeOnLine(const sCNPJEmitente : String) : Boolean;
begin
  if Trim(sCNPJEmitente) = EmptyStr then
    LerConfiguracao(gUsuarioLogado.Empresa)
  else
    LerConfiguracao(sCNPJEmitente);

  Result := (ConfigACBr.rgModoGerarNFe.ItemIndex = 1);
end;

function TDMNFe.GetInformacaoComplementar(const sCNPJEmitente : String): String;
var
  sInformacao : String;
begin
  LerConfiguracao(sCNPJEmitente);
  sInformacao := Trim(ConfigACBr.edInfoComplementar.Text);
  sInformacao := StringReplace(StringReplace(sInformacao, '<br>', #13 , [rfReplaceAll]), '<BR>', #13, [rfReplaceAll]) + #13;
  Result := sInformacao;
end;

function TDMNFe.GetInformacaoFisco(const DataSetOrigem : TDataSet) : String;
var
  sTexto : String;
begin
  sTexto := EmptyStr;

  if (DataSetOrigem <> nil) then
  begin
    if DataSetOrigem.Active then
      sTexto := Trim(DataSetOrigem.FieldByName('CFOP_INFORMACAO_FISCO').AsString);
  end;

  Result := IfThenStr(sTexto = EmptyStr, Trim(ConfigACBr.edInfoFisco.Text), sTexto);
end;

function TDMNFe.GetFileNameDANFE_FR3 : String;
var
  aRetorno : String;
begin
  aRetorno := ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST;

  if (ConfigACBr.rgTipoDanfe.ItemIndex = 0) then
    aRetorno := StringReplace(ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST, '.fr3', '_Retrato.fr3',  [rfReplaceAll])
  else
    aRetorno := StringReplace(ExtractFilePath(ParamStr(0)) + FILENAME_NFE_FAST, '.fr3', '_Paisagem.fr3', [rfReplaceAll]);

  Result := Trim(aRetorno);
end;

function TDMNFe.GetPathNFeXML(const sCNPJEmitente : String) : String;
var
  sPrefixoSecao,
  sSecaoGeral  : String;
begin
  if ( GetQuantidadeEmpresasEmiteNFe > 1 ) then
    sPrefixoSecao := Trim(sCNPJEmitente) + '_'
  else
    sPrefixoSecao := EmptyStr;

  sSecaoGeral := sPrefixoSecao + INI_SECAO_GERAL;

  with ConfigACBr, FileINI do
    Result := ReadString(sSecaoGeral, 'PathSalvar', '') ;
end;

function TDMNFe.GetGerarChaveNFeXML(const sCNPJEmitente : String;
  const pAno, pNumero : Integer; const tipoNF : TTipoNF) : String;
var
  Ok  : Boolean;
  aTE ,
  aUF : Integer;
  aDataEmissao : TDateTime;
  aSerie  ,
  aNumero ,
  aCodigo ,
  aModelo : Integer;
  sPrefixoSecao,
  sSecaoGeral  ,
  sChave       : String;
begin
  if ( GetQuantidadeEmpresasEmiteNFe > 1 ) then
    sPrefixoSecao := Trim(sCNPJEmitente) + '_'
  else
    sPrefixoSecao := EmptyStr;

  sSecaoGeral := sPrefixoSecao + INI_SECAO_GERAL;

  with ConfigACBr, FileINI do
    aTE := ReadInteger(sSecaoGeral, 'FormaEmissao', 0) ;

  AbrirEmitente(sCNPJEmitente);

  aTE     := aTE + 1;
  aUF     := qryEmitente.FieldByName('Est_cod').AsInteger;
  aSerie  := qryEmitente.FieldByName('SERIE_NFE').AsInteger;
  aModelo := MODELO_NFE;

  if ( tipoNF = tnfSaida ) then
  begin
    AbrirVenda(pAno, pNumero);

    aNumero := qryCalculoImposto.FieldByName('Lote_nfe_numero').AsInteger;
    aCodigo := qryCalculoImposto.FieldByName('Lote_nfe_codigo').AsInteger;
    //aCodigo := GerarCodigoDFe(qryCalculoImposto.FieldByName('Lote_nfe_numero').AsInteger); // PROVISORIO

    if not qryCalculoImposto.FieldByName('DataEmissao').IsNull then
      aDataEmissao := qryCalculoImposto.FieldByName('DataEmissao').AsDateTime
    else
      aDataEmissao := qryCalculoImposto.FieldByName('DtVenda').AsDateTime;
  end
  else
  if ( tipoNF = tnfEntrada ) then
  begin
    AbrirCompra(pAno, pNumero, sCNPJEmitente);

    aNumero := qryEntradaCalculoImposto.FieldByName('Lote_nfe_numero').AsInteger;
    aCodigo := qryEntradaCalculoImposto.FieldByName('Lote_nfe_codigo').AsInteger;
    //aCodigo := GerarCodigoDFe(qryEntradaCalculoImposto.FieldByName('Lote_nfe_numero').AsInteger); // PROVISORIO

    if not qryEntradaCalculoImposto.FieldByName('DataEmissao').IsNull then
      aDataEmissao := qryEntradaCalculoImposto.FieldByName('DataEmissao').AsDateTime
    else
      aDataEmissao := qryEntradaCalculoImposto.FieldByName('DtEnt').AsDateTime;
  end;

  sChave := GerarChaveAcesso(aUF, aDataEmissao, sCNPJEmitente, aSerie, aNumero, aTE, aCodigo, aModelo);
  sChave := StrOnlyNumbers(StringReplace(sChave, 'NFe', '', [rfReplaceAll]));

  Result := sChave;
end;

function TDMNFe.GerarNFeOnLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda: Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
  var Denegada : Boolean; var DenegadaMotivo : String;
  const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
  sErrorMsg   ,
  sLogXmlEnv  ,
  sLogXmlRec  : String;
begin
(*
  IMR - 04/10/2019 :
    Removida a rotina de verifica��o do servi�o de emiss�o da NFe da procedure "GerarNFeOnLineACBr()" para que
    esteja num n�vel de chamada acima.

  IMR - 24/10/2018 :
    * Inser��o do bloco de c�digo para guarda o n�mero do recibo de envio, caso ele
    exista, mesmo quando o retorno do envio seja FALSE.
    * Comentado o bloco de c�digo que remove o n�mero do recibo de envio da venda
    mesmo que a rejei��o seja de duplicidade de nota.

  IMR - 20/05/2016 :
    Inclus�o da rejei��o 203 para que o recibo de envio n�o seja guardado no
    registro de origem (Venda ou Compra) da NF-e.

  IMR - 20/05/2016 :
    Inser��o da rotina que renomeia os arquivos XML de envio e retorno do Lote e
    Recibo quando o processo de gera��o/envio da NFe � finalizado corretamente.
    Neste passo o objeto "ACBrNFe.NotasFiscais" � zerado com o objetivo de
    eliminar "lixos de dados" para os novos processos de gera��o/envio de NFe.

  IMR - 05/03/2016 :
    Inters�o do par�metro "OcultarVencimentos" para que o usu�rio informe se ele
    quer ou n�o informar os vencimentos das parecelas da fatura na NF-e.

  IMR - 09/09/2014 :
    Tratamento de excess�o para notas fiscal emitidas, mas de forma denegada. Com este bloco de c�digo este fun��o retornar�
    TRUE para que o XML da NF-e seja gravada na base de dados e o registro de venda receba a informa��o de que a NF-e fora
    denegada.
*)
  sErrorMsg := EmptyStr;
  try

    LerConfiguracao(sCNPJEmitente);
    FMensagemErro := EmptyStr;

    GerarNFEACBr(sCNPJEmitente, iCodigoCliente, sDataHoraSaida,
      iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML, OcultarVencimentos);

    iNumeroLote := GetNextID('TBCONFIGURACAO', 'NFE_LOTE', 'where EMPRESA = ' + QuotedStr(sCNPJEmitente));

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

    if ( Result ) then
    begin
      if (ACBrNFe.NotasFiscais.Count > 0) then
      begin
        ACBrNFe.Consultar;
        ACBrNFe.NotasFiscais.Items[0].GravarXML(ExtractFileName(FileNameXML), ExtractFilePath(FileNameXML));
      end;

      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
      UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
      GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, ReciboNFE);

      // Renomer no diret�rio os arquivos XML de envio e retorno dos lotes e recibos de NF-e
      RenomearLogXmlEnvioRetornoNF(iNumeroLote, ReciboNFE, 'nfe');
      ACBrNFe.NotasFiscais.Clear;

      // Verificar se a nota foi Denegada
      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Count = 1 ) then
      begin
        if (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_NOTA_DENEGADA)
        or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_EMIT)
        or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_DEST) then
        begin
          Denegada       := True;
          DenegadaMotivo := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
        end;
      end;
    end
    // Guarda rebido de retorno, caso ele exista, mesmo o envio ter retornado FALSE
    else
    if Assigned(ACBrNFe.WebServices.Retorno) then
      if (Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr) then
      begin
        ReciboNFE := Trim(ACBrNFe.WebServices.Retorno.Recibo);
        GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, ReciboNFE);
      end;

  except
    On E : Exception do
    begin
      sErrorMsg := E.Message;

      // Diretrizes de tomada de decis�o quando a NFe enviada n�o � aceita

      if ( Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr ) then
        if ReciboNaoExisteNaVenda(ACBrNFe.WebServices.Retorno.Recibo) then
          GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, ACBrNFe.WebServices.Retorno.Recibo);

      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Count = 1 ) then
      begin
        Case ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat of
          REJEICAO_NFE_NOTA_DENEGADA, REJEICAO_NFE_IRREG_FISCO_EMIT, REJEICAO_NFE_IRREG_FISCO_DEST:
            begin
              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);

              if GetPermititNFeDenegada(sCNPJEmitente) then
              begin
                Result := True;

                Denegada       := True;
                DenegadaMotivo := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;

                ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
                ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
                ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

                Exit;
              end
              else
              begin
                // Remover Lote da Venda
                GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

                sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                  'Favor gerar NF-e novamente!';
              end;
            end;

          REJEICAO_NFE_DUPLICIDADE:
            begin
//              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
//              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
//
//              // Remover Lote da Venda
//              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);
//
              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
            end;

          REJEICAO_NFE_EMISSOR_NAO_HABIL,
          REJEICAO_NFE_IE_NAO_INFORMADO ,
          REJEICAO_NFE_IE_NAO_CADASTRADO,
          REJEICAO_NFE_IE_NAO_VINCULADO ,
          REJEICAO_NFE_BC_ICMS_ERR   ,
          REJEICAO_NFE_TO_ICMS_ERR   ,
          REJEICAO_NFE_TO_PROD_ERR   ,
          REJEICAO_NFE_NCM_INEXIST   ,
          REJEICAO_NFE_CFOP_INVALIDO ,
          REJEICAO_NFE_CFOP_DIFERENTE:
            begin
              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Favor validar dados e NF-e novamente!';

              if (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat in [REJEICAO_NFE_IE_NAO_INFORMADO, REJEICAO_NFE_IE_NAO_CADASTRADO, REJEICAO_NFE_IE_NAO_VINCULADO]) then
                sErrorMsg :=
                  'Inscri��o Estadual (IE) do cliente n�o cadastrado ou n�o vinculado ao CNPJ informado. ' + #13 +
                  '- Deve-se consultar o CNPJ do cliente no SINTEGRA; ou' + #13 +
                  '- Deve-se consultar o CNPJ do cliente no portal ''https://dfe-portal.svrs.rs.gov.br/Nfe/Ccc''' + #13 +
                  'Favor corrija esta informa��o no Cadastro do Cliente.' + #13#13 +
                  'Ap�s este procedimento, gere novamente a NF-e'
              else
//              if (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat in [REJEICAO_NFE_CFOP_INVALIDO, REJEICAO_NFE_CFOP_DIFERENTE]) then
              if ( (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_CFOP_INVALIDO)
                or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_CFOP_DIFERENTE)
              ) then
                sErrorMsg :=
                  'C�digo Fiscal de Opera��o n�o adequado para este tipo de movimento dos produtos. ' +
                  'Favor corrija-o clicando com o bot�o direito do mouse no campo CFOP' + #13#13 +
                  'Ap�s este procedimento, gere novamente a NF-e';
            end;

          REJEICAO_NFE_NAO_CATALOG:
            begin
              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Poss�vel erro na valida��o do arquivo XML na SEFA. Favor tentar gerar NF-e mais tarde.';
            end;

          else
          begin

            sErrorMsg := IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat) + ' - ' +
              ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13#13 +
              'Favor entrar em contato com suporte e apresentar esta mensagem!';

            if Assigned(ACBrNFe.WebServices.Recibo) then                        // Se possuir recibo de envio
            begin
              if Assigned(ACBrNFe.WebServices.Recibo.NFeRetorno) then           // Se o recibo de envio possuir retorno
              begin
                if Assigned(ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe) then // Se o retorno prossuir protocolo de processamento
                begin

                  if ( ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe.Count > 0 ) then
                    Case ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat of
                      PROCESSO_NFE_LOTE_REJEITADO :
                        begin
                          // Remover Lote da Venda
                          GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

                          sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                            'Favor fazer as devidas corre��es e gerar NF-e novamente!';
                        end;
                    end;

                end;
              end;
            end;

          end;
        end;

        ShowError('Erro ao tentar gerar NF-e.' +
          #13 + 'Status: ' + IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat) +
          IfThen(Trim(ACBrNFe.WebServices.Retorno.Recibo) = EmptyStr, EmptyStr, #13 + 'Recibo: ' + ACBrNFe.WebServices.Retorno.Recibo) +
          #13#13 + 'GerarNFeOnLineACBr() --> ' + sErrorMsg);

      end;

      FMensagemErro := Trim(sErrorMsg);
      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeOffLineACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String; const iAnoVenda, iNumVenda : Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
  const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEACBr(sCNPJEmitente, iCodigoCliente, sDataHoraSaida, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML, OcultarVencimentos);

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
  aCan : Boolean;
  FileNameXML ,
  ChaveNFE    : String;
  //iNumeroLote : Integer;
  iNumeroLote : Int64;
  sLOG : TStringList;
begin
(*
  IMR - 14/10/2016 :
    Inser��o da vari�vel "aCan" para armazenar a situa��o da NF-e consultada na
    SEFA a fim de constatar o seu cancelamento antes da cria��o de um evento com
    esta finalidade.
*)
  sLOG := TStringList.Create;
  aCan := False;

  try

    LerConfiguracao(sCNPJEmitente);

    Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    if ( ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao ) then
      if (not ShowConfirm('Cancelamento de NF-e em AMBIENTE DE HOMOLOGA��O n�o tem validade nenhuma para a SEFA.' + #13#13 +
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

      if not NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString ) then
        raise Exception.Create('N�o foi poss�vel carregar o XML da Nota Fiscal Eletr�nica correspondente!' + #13 + FileNameXML);

      // Numero do Lote de Envio
      //iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
      //iNumeroLote := StrToInt64(FormatDateTime('yymmddhhnn', GetDateTimeDB));
      iNumeroLote := StrToInt64(Copy(FormatDateTime('yymmddhhnnss', GetDateTimeDB), 5, 8)); // Dia, hora, minuto e segundo

      // Consultar situa��o da NF-e na Sefa

      if ACBrNFe.Consultar then
        aCan := ACBrNFe.NotasFiscais[0].Cancelada;

      // Criar o Evento de Cancelamento, caso a NF-e ainda n�o esteja cancelada

      if aCan then
        Result := True
      else
      begin

        EventoNFe.Evento.Clear;
        EventoNFe.idLote := iNumeroLote;

        //with EventoNFe.Evento.Add do
        with EventoNFe.Evento.New do
        begin
          //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
          //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

          infEvento.cOrgao   := qryEmitenteEST_COD.AsInteger; // C�digo IBGE do Estado
          infEvento.chNFe    := qryNFeEmitidaCHAVE.AsString;
          infEvento.CNPJ     := sCNPJEmitente;
          infEvento.dhEvento := GetDateTimeDB;
          infEvento.tpEvento := TpcnTpEvento.teCancelamento;
          infEvento.detEvento.xJust := Copy(Motivo, 1, 255);
          infEvento.detEvento.nProt := qryNFeEmitidaPROTOCOLO.AsString;
        end;

        // Enviar o evento de cancelamento
        if ACBrNFe.EnviarEvento(iNumeroLote) then
        begin
          with ACBrNFe.WebServices.EnvEvento do
          begin
            Result := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e

            if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
            begin
              raise Exception.CreateFmt(
                'Ocorreu o seguinte erro ao cancelar a Nota Fiscal Eletr�nica:'  + sLineBreak +
                'C�digo: %d' + sLineBreak +
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
            sLOG.Add('N�mero Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
            sLOG.Add('C�digo Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
            sLOG.Add('Motivo Status   : ' + EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
            sLOG.Add('-');
            sLOG.Add(EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
            sLOG.EndUpdate;

            // Gravar LOG

            with cdsLOG do
            begin

              Close;
              ParamByName('usuario').AsString     := gUsuarioLogado.Login;
              ParamByName('data_hora').AsDateTime := Now;
              Open;

              if IsEmpty then
              begin
                Append;

                cdsLOGUSUARIO.AsString       := gUsuarioLogado.Login;
                cdsLOGDATA_HORA.AsDateTime   := Now;
                cdsLOGEMPRESA.AsString       := sCNPJEmitente;
                cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
                cdsLOGDESCRICAO.AsString     := DESC_LOG_EVENTO_CANCELAR_NFE_SD;
                cdsLOGESPECIFICACAO.AsString := sLOG.Text;

                Post;
                ApplyUpdates;
                CommitTransaction;
              end;

            end;
          end;
        end
        else
        begin
          with ACBrNFe.WebServices.EnvEvento do
          begin
            raise Exception.Create(
              'Ocorreram erros ao tentar enviar o Evento de Cancelamento:' + sLineBreak +
              'Lote: '     + IntToStr(EventoRetorno.idLote)  + sLineBreak +
              'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
              'Orgao: '    + IntToStr(EventoRetorno.cOrgao)  + sLineBreak + sLineBreak +
              'Status: '   + IntToStr(EventoRetorno.cStat)   + sLineBreak +
              'Motivo: '   + EventoRetorno.xMotivo
            );
          end;
        end;

      end;

    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar cancelar NF-e de Sa�da.'+ #13#13 + 'CancelarNFeACBr() --> ' + e.Message);
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

    if (Trim(qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString) = EmptyStr) then
    begin
      ShowWarning('Arquivo XML da Nota Fiscal n�o carregado.' + #13 + 'Favor informar ao Suporte.');
      Exit;
    end;

    if ( IsPDF ) then // Para exporta��o em envio
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString
    else
      FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    CorrigirXML_NFe( qryCalculoImposto.FieldByName('XML_NFE').AsWideString, FileNameXML );

    if not FilesExists(FileNameXML) then
      raise Exception.Create(Format('Arquivo %s n�o encontrado.', [QuotedStr(FileNameXML)]));

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

      NotasFiscais.Clear;
      NotasFiscais.LoadFromString(qryCalculoImposto.FieldByName('XML_NFE').AsWideString);

      if NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
      begin
//        WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
//        WebServices.ConsultaDPEC.Executar;
//
//        DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
        WebServices.Consulta.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
        WebServices.Consulta.Executar;

//        DANFE.ProtocoloNFe := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
        DANFE.Protocolo := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
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
      ShowError('Erro ao tentar imprimir DANFE da Sa�da.' + #13#13 + 'ImprimirDANFEACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.UpdateLoteNFe(const sCNPJEmitente : String; const Ano, Numero: Integer);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
//      SQL.Add('Update TBEMPRESA Set');
//      SQL.Add('    LOTE_ANO_NFE = ' + FormatFloat('####', Ano));
//      SQL.Add('  , LOTE_NUM_NFE = ' + FormatFloat('#########', Numero));
//      SQL.Add('Where CNPJ = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('Update TBCONFIGURACAO Set');
      SQL.Add('    NFE_LOTE  = ' + FormatFloat('#########', Numero));
      SQL.Add('Where EMPRESA = ' + QuotedStr(sCNPJEmitente));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateLoteNFe > ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNFeDenegadaVenda(const aCNPJEmitente : String; const aAno, aVenda : Integer; aMotivo : String);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBVENDAS Set');
      SQL.Add('    NFE_DENEGADA  = 1 ');
      SQL.Add('  , NFE_DENEGADA_MOTIVO  = ' + QuotedStr(Copy(Trim(aMotivo), 1, 100)) );
      SQL.Add('Where ANO        = ' + aAno.ToString);
      SQL.Add('  and CODCONTROL = ' + aVenda.ToString);
      SQL.Add('  and CODEMP     = ' + aCNPJEmitente.QuotedString);

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNFeDenegadaVenda > ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNFeDenegadaEntrada(const aCNPJEmitente : String; const aAno, aCompra : Integer; aMotivo : String);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBCOMPRAS Set');
      SQL.Add('    NFE_DENEGADA  = 1 ');
      SQL.Add('  , NFE_DENEGADA_MOTIVO  = ' + QuotedStr(Copy(Trim(aMotivo), 1, 100)) );
      SQL.Add('Where ANO        = ' + aAno.ToString);
      SQL.Add('  and CODCONTROL = ' + aCompra.ToString);
      SQL.Add('  and CODEMP     = ' + aCNPJEmitente.QuotedString);

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNFeDenegadaVenda > ' + E.Message);
  end;
end;

procedure TDMNFe.SetNumeroNSUPesquisado(const aEmpresa : String; aNSU : String);
Var
  aKey : String;
begin
  try
    aKey := 'nsu_pesquisado_' + OnlyNumber(aEmpresa.Trim);
    aNSU := FormatFloat('000000000000000', StrToInt64Def(aNSU.Trim, 0));
    
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update or Insert into SYS_CONFIG (');
      SQL.Add('    ky_config');
      SQL.Add('  , vl_config');
      SQL.Add('  , dh_config');
      SQL.Add(') values (    ');
      SQL.Add('    ' + aKey.ToUpper.QuotedString );
      SQL.Add('  , ' + aNSU.QuotedString);
      SQL.Add('  , current_timestamp  ');
      SQL.Add(') matching (ky_config) ');

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('SetNumeroNSUPesquisado() --> ' + E.Message);
  end;
end;

procedure TDMNFe.UpdateNumeroNFe(const sCNPJEmitente : String; const Serie, Numero: Integer);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBCONFIGURACAO Set');
      SQL.Add('    NFE_SERIE  = ' + FormatFloat('####',      Serie));
      SQL.Add('  , NFE_NUMERO = ' + FormatFloat('#########', Numero));
      SQL.Add('Where EMPRESA  = ' + QuotedStr(sCNPJEmitente));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroNFe > ' + E.Message + #13#13 + DMBusiness.fdQryBusca.SQL.Text);
  end;
end;

procedure TDMNFe.UpdateNumeroNFCe(const sCNPJEmitente : String; const Serie, Numero: Integer);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBCONFIGURACAO Set');
      SQL.Add('    NFCE_SERIE  = ' + FormatFloat('####',      Serie));
      SQL.Add('  , NFCE_NUMERO = ' + FormatFloat('#########', Numero));
      SQL.Add('Where EMPRESA   = ' + QuotedStr(sCNPJEmitente));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroNFCe > ' + E.Message + #13#13 + DMBusiness.fdQryBusca.SQL.Text);
  end;
end;

procedure TDMNFe.UpdateNumeroCCe(const sCNPJEmitente : String; const Numero : Integer);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBCONFIGURACAO Set');
      SQL.Add('  NFE_CARTA_CORRECAO = ' + FormatFloat('#########', Numero));
      SQL.Add('Where EMPRESA = ' + QuotedStr(sCNPJEmitente));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('UpdateNumeroCCe > ' + E.Message + #13#13 + DMBusiness.fdQryBusca.SQL.Text);
  end;
end;

procedure TDMNFe.GerarNFeACBr(const sCNPJEmitente : String; iCodigoCliente : Integer; const sDataHoraSaida : String;
  const iAnoVenda, iNumVenda : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String;
  const OcultarVencimentos : Boolean = FALSE);
var
  sErros ,
  sInformacaoProduto,
  sInformacaoFisco  : String;
  cPercentualTributoAprox,
  vTotalTributoAprox     ,
  vTotalFCP_UF_Destino   ,
  vTotalICMS_UF_Destino  ,
  vTotalICMS_UF_Remetente: Currency;

  PorCodigoExterno ,
  aCalcularICMS    : Boolean;

  // Base para implementar solu��es para a
  // Rejei��o 694: N�o informado o grupo de ICMS para a UF de destino
  aSimplesNacional ,
  aInterestadual   ,
  aConsumidorFinal ,
  aNaoContribuinte : Boolean;

  iCodigoNFE,
  aParcela  : Integer;

  // Base para implementar solu��es para a
  // Rejei��o 694: N�o informado o grupo de ICMS para a UF de destino
  cAliquotaFCPUFDestino,
  cAliquotaUFDestino   ,
  cAliquotaUFInter     : Currency;
  // Totalizar Valores
  cTotal_vIPI          ,
  cTotal_ICMSTot_vBC   ,
  cTotal_ICMSTot_vICMS : Currency;
begin
(*
  IMR - 03/09/2019 :
    O campo "Ide.cNF" precisa receber um valor de c�digo, gerado de forma aleat�ria, diferente do n�mero da
    nota fiscal e assim esteja de acordo com as expecifica��es da Receita Federal.

  IMR - 03/09/2018 :
    Dados de fatura da Nota Fical agora s�o apenas informados quando a(s) duplicata(s)
    for(em) informada(s) pelo usu�rio na nota.

  IMR - 03/09/2018 :
    Dados de fatura da Nota Fical agora s�o apenas informados quando a(s) duplicata(s)
    for(em) informada(s) pelo usu�rio na nota.

  IMR - 14/03/2018 :
    Implementa��o da rotina que inseri a Refer�ncia como C�digo do Produto na nota
    fiscal de acordo com a configura��o da empresa.

  IMR - 03/06/2016 :
    Inclus�o da instru��o "Ide.indFinal := cfConsumidorFinal" para todo destinat�rio
    da nota que for pessoa f�sica, ou seja, todo destinat�rio que n�o seja
    contribuinte de ICMS (Dest.indIEDest = inNaoContribuinte).

  IMR - 05/03/2016 :
    Inters�o do par�metro "OcultarVencimentos" para que o usu�rio informe se ele
    quer ou n�o informar os vencimentos das parecelas da fatura na NF-e.

  IMR - 08/12/2015 :
    Altera��o nas regras de opera��o da tag "idDest" para a emiss�o de Notas Fiscais
    para fora do Estado.

  IMR - 20/09/2014 :
    Inse��o de nova TAG na Nota Fiscal referente a IE do destinat�rio para informa se este � Isento, Contribuinte ou N�o-contribuinte de acordo
    com as regras estabelecidas pela SEFA para a vers�o 3.10 da NF-e.

  IMR - 10/10/2014 :
    Implementa��o da Lei "Transpar�ncia de Impostos" que visa informar ao consumidos o valor e o percentual pago de impostos sobre os itens e
    o total geral da nota fiscal.

  IMR - 31/03/2015 :
    Inclus�o da TAG "Ide.finNFe := fnDevolucao" quando a NF-e for de devolu��o

  IMR - 20/04/2015 :
    Inclus�o do bloco de c�digo para verificar se o CFOP da venda corresponde
    a uma opera��o de devolu��o. Caso esta situa��o seja confirmada, a NF-e de
    origem ser� solicitada.
*)

  try

    LerConfiguracao(sCNPJEmitente);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    iNumeroNFe  := GetNumeroNFe(sCNPJEmitente, iSerieNFe, MODELO_NFE);
    iCodigoNFE  := GerarCodigoDFe(iNumeroNFe);
    DtHoraEmiss := GetDateTimeDB;

    GuardarCodigoNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iCodigoNFE);

    cAliquotaUFInter      := GetAliquotaICMS(qryEmitenteEST_SIGLA.AsString, qryDestinatario.FieldByName('EST_SIGLA').AsString);
    cAliquotaUFDestino    := GetAliquotaICMS(qryDestinatario.FieldByName('EST_SIGLA').AsString, qryDestinatario.FieldByName('EST_SIGLA').AsString);
    cAliquotaFCPUFDestino := GetAliquotaFCP(qryDestinatario.FieldByName('EST_SIGLA').AsString);

    ACBrNFe.NotasFiscais.Clear;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      // Caso n�o seja preenchido ser� gerado um n�mero aleat�rio pelo componente
      Ide.cNF       := iCodigoNFE;
      Ide.natOp     := qryCalculoImposto.FieldByName('CFOP_RESUMIDO').AsString;

      // Entradas ou sa�das dentro do Estado
      if ( qryCalculoImposto.FieldByName('CFOP').AsString[1] in ['1', '5'] ) then
        Ide.idDest := doInterna
      else
      // Entradas ou sa�das em Estados diferentes
      if ( qryCalculoImposto.FieldByName('CFOP').AsString[1] in ['2', '6'] ) then
        Ide.idDest := doInterestadual
      else
      // Entradas ou sa�das do Exterior
      if ( qryCalculoImposto.FieldByName('CFOP').AsString[1] in ['3', '7'] ) then
        Ide.idDest := doExterior
      else
        Ide.idDest := doInterna;

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
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Vers�o do seu sistema
      Ide.cUF       := UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger;

      if (qryCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
        Ide.finNFe := fnDevolucao
      else
        Ide.finNFe := fnNormal;

      if ( qryDestinatario.FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        Ide.indFinal := cfConsumidorFinal;

      aCalcularICMS :=
            (qryCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger  = 1)
        and (qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency > 0.0);

      if ( Ide.finNFe  = fnDevolucao ) then
        with Ide.NFref.Add, qryCalculoImposto do
          Case TFormaNFDevolucao(FieldByName('DNFE_FORMA').AsInteger) of
            fdNFeEletronica:
              refNFe := FieldByName('DNFE_CHAVE').AsString; // Nota Fiscal Eletronica

            fdNFeModelo1_1A:
              begin
                RefNF.cUF    := UFtoCUF(FieldByName('DNFE_UF').AsString); // |
                RefNF.AAMM   := FieldByName('DNFE_COMPETENCIA').AsString;          // |
                RefNF.CNPJ   := FieldByName('DNFE_CNPJ_CPF').AsString;             // |
                RefNF.modelo := FieldByName('DNFE_MODELO').AsInteger;              // |- NF Modelo 1/1A
                RefNF.serie  := FieldByName('DNFE_SERIE').AsInteger;               // |  * O modelo padr�o � 1
                RefNF.nNF    := FieldByName('DNFE_NUMERO').AsInteger;              // |
              end;

            fdNFProdutorRural:
              begin
                RefNFP.cUF     := UFtoCUF(FieldByName('DNFE_UF').AsString);       // |
                RefNFP.AAMM    := FieldByName('DNFE_COMPETENCIA').AsString;                // |
                RefNFP.CNPJCPF := FieldByName('DNFE_CNPJ_CPF').AsString;                   // |
                RefNFP.IE      := FieldByName('DNFE_IE').AsString;                         // |- NF produtor Rural
                RefNFP.modelo  := FormatFloat('00', FieldByName('DNFE_MODELO').AsInteger); // | * O modelo padr�o � 04
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

      if (qryCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) and aCalcularICMS then
        Emit.CRT := crtRegimeNormal;

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
      Emit.IM                := ''; // Preencher no caso de existir servi�os na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se � permitido
                                    // a inclus�o de servi�os na NFe

      // �gil Solu��es em Softwares
      with autXML.Add do
        CNPJCPF := AGIL_SOFTWARES_CNPJ;

      // CNPJ/CPF Contador
      if (Trim(qryEmitenteCONTADOR_CNPJCPF.AsString) <> EmptyStr) then
        with autXML.Add do
          CNPJCPF := StrOnlyNumbers( Trim(qryEmitenteCONTADOR_CNPJCPF.AsString) );

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
        if (AnsiUpperCase(Copy(Trim(qryDestinatario.FieldByName('INSCEST').AsString), 1, 5)) = 'ISENT') or (Trim(qryDestinatario.FieldByName('INSCEST').AsString) = EmptyStr) then
          Dest.indIEDest     := inIsento
        else
          Dest.indIEDest     := inContribuinte;

        Dest.IE              := IfThen(Dest.indIEDest = inContribuinte, Trim(qryDestinatario.FieldByName('INSCEST').AsString), EmptyStr);
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

  //Use os campos abaixo para informar o endere�o de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endere�o de entrega quando for diferente do Remetente/Destinat�rio
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

      // Valida��es para tratar a rejei��o 694: N�o informado o grupo de ICMS para a UF de destino

      aSimplesNacional := (Emit.CRT = TpcnCRT.crtRegimeNormal);
      aInterestadual   := (Ide.idDest = TpcnDestinoOperacao.doInterestadual);
      aConsumidorFinal := (Ide.indFinal = TpcnConsumidorFinal.cfConsumidorFinal);
      aNaoContribuinte := (Dest.indIEDest = TpcnindIEDest.inIsento);

      // Adicionando Produtos

      PorCodigoExterno        := GetImprimirCodigoExternoProdutoNFe(sCNPJEmitente);
      vTotalTributoAprox      := 0.0;
      vTotalICMS_UF_Destino   := 0.0;
      vTotalICMS_UF_Remetente := 0.0;
      vTotalFCP_UF_Destino    := 0.0;
      cTotal_vIPI             := 0.0;
      cTotal_ICMSTot_vBC      := 0.0;
      cTotal_ICMSTot_vICMS    := 0.0;

      qryDadosProduto.First;

      while not qryDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem := qryDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // N�mero sequencial, para cada item deve ser incrementado

          if PorCodigoExterno then
          begin
            if (gSistema.Codigo = SISTEMA_GESTAO_OPME) then
              Prod.cProd := IfThen(Trim(qryDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr,
                Trim(qryDadosProduto.FieldByName('REFERENCIA').AsString),
                Trim(qryDadosProduto.FieldByName('CODPROD').AsString))
            else
              Prod.cProd := IfThen(Trim(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) <> EmptyStr,
                Trim(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString),
                Trim(qryDadosProduto.FieldByName('CODPROD').AsString));
          end
          else
            Prod.cProd := Trim(qryDadosProduto.FieldByName('CODPROD').AsString);

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString
          else
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI').AsString + ' ' + qryDadosProduto.FieldByName('ANO_FAB_MODELO_VEICULO').AsString;

          Prod.NCM      := qryDadosProduto.FieldByName('NCM_SH').AsString;            // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.CFOP     := qryDadosProduto.FieldByName('CFOP_COD').AsString;
          Prod.EXTIPI   := EmptyStr;

          if (Trim(Prod.NCM) = EmptyStr) or (Trim(Prod.NCM) = '10203000') then // C�digo descontinuado a partir de 2016
            Prod.NCM := TRIBUTO_NCM_SH_PADRAO;

          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a fun��o "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
          begin
            Prod.cEAN     := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString;
            Prod.cEANTrib := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
          end
          else
          begin
            //Prod.cEAN   := EmptyStr;
            //Prod.cEAN     := 'SEM GTIN';
            //Prod.cEANTrib := 'SEM GTIN';
//            Prod.cEAN     := Trim(qryDadosProduto.FieldByName('CODPROD').AsString);
//            Prod.cEAN     := PadLeft(Prod.cEAN, 12, '0') + EAN13_DV(Prod.cEAN);
            Prod.cEAN     := '200' + PadLeft(Trim(qryDadosProduto.FieldByName('CODPROD').AsString), 9, '0');
            Prod.cEAN     := Prod.cEAN + EAN13_DV(Prod.cEAN);
            Prod.cEANTrib := Prod.cEAN;
          end;

          Prod.uCom     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qCom     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency   // I10a  Valor Unit�rio de comercializa��o
          else
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT').AsCurrency;           // I10a  Valor Unit�rio de comercializa��o

          Prod.vProd    := qryDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Servi�os

//          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a fun��o "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
//            Prod.cEANTrib := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
//          else
//            Prod.cEANTrib := EmptyStr;
//
          Prod.uTrib     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qTrib     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency  // I14a  Valor Unit�rio de tributa��o
          else
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT').AsCurrency;          // I14a  Valor Unit�rio de tributa��o

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

          // Informa��o Adicional do Produto

          sInformacaoProduto := EmptyStr;
          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
          begin
            if PorCodigoExterno then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'C�d.: ' + qryDadosProduto.FieldByName('CODPROD').AsString
            else
            if ( Trim(qryDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Ref.: ' + qryDadosProduto.FieldByName('REFERENCIA').AsString;

            if ( Trim(qryDadosProduto.FieldByName('ANVISA').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Anvisa: ' + qryDadosProduto.FieldByName('ANVISA').AsString;

            if ( Trim(qryDadosProduto.FieldByName('LOTE').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Lote: ' + qryDadosProduto.FieldByName('LOTE').AsString +
                  IfThen(qryDadosProduto.FieldByName('LOTE_FABRICACAO').IsNull, '', ' Fabrica��o: ' + FormatDateTime('dd/mm/yyyy', qryDadosProduto.FieldByName('LOTE_FABRICACAO').AsDateTime)) +
                  IfThen(qryDadosProduto.FieldByName('LOTE_VALIDADE').IsNull  , '', ' Validade: '   + FormatDateTime('dd/mm/yyyy', qryDadosProduto.FieldByName('LOTE_VALIDADE').AsDateTime));
          end
          else
            sInformacaoProduto :=
              'Cor: '         + qryDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString + #13 +
              'Placa: '       + qryDadosProduto.FieldByName('REFERENCIA').AsString      + #13 +
              'Renavam: '     + qryDadosProduto.FieldByName('RENAVAM_VEICULO').AsString + #13 +
              'Chassi: '      + qryDadosProduto.FieldByName('CHASSI_VEICULO').AsString  + #13 +
              'Combustivel: ' + qryDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString;

          infAdProd := sInformacaoProduto;

  //Declara��o de Importa��o. Pode ser adicionada v�rias atrav�s do comando Prod.DI.Add

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

  //Campos para venda de ve�culos novos

          if ( (GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID) and (qryDadosProduto.FieldByName('PRODUTO_NOVO').AsInteger = 1) ) then
          begin

            with Prod.veicProd do
              begin
                tpOP     := toVendaConcessionaria; // J02 - Tipo da opera��o
                                                   //    (1) = toVendaConcessionaria
                                                   //    (2) = toFaturamentoDireto
                                                   //    (3) = toVendaDireta
                                                   //    (0) = toOutros
                chassi   := qryDadosProduto.FieldByName('CHASSI_VEICULO').AsString;        // J03 - Chassi do ve�culo
                cCor     := qryDadosProduto.FieldByName('COR_VEICULO').AsString;           // J04 - Cor
                xCor     := qryDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString; // J05 - Descri��o da Cor
                pot      := ''; // J06 - Pot�ncia Motor
                Cilin    := '';
                pesoL    := ''; // J08 - Peso L�quido
                pesoB    := ''; // J09 - Peso Bruto
                nSerie   := ''; // J10 - Serial (s�rie)
                tpComb   := qryDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString; // J11 - Tipo de combust�vel
                nMotor   := ''; // J12 - N�mero de Motor
                CMT      := '';
                dist     := '';        // J14 - Dist�ncia entre eixos
//                RENAVAM  := '';        // J15 - RENAVAM            (N�o informar a TAG na exporta��o)
                anoMod   := qryDadosProduto.FieldByName('ANO_MODELO_VEICULO').AsInteger;         // J16 - Ano Modelo de Fabrica��o
                anoFab   := qryDadosProduto.FieldByName('ANO_FABRICACAO_VEICULO').AsInteger;     // J17 - Ano de Fabrica��o
                tpPint   := '';        // J18 - Tipo de Pintura
                tpVeic   := StrToIntDef(qryDadosProduto.FieldByName('TIPO_VEICULO').AsString, 0); // J19 - Tipo de Ve�culo    (Utilizar Tabela RENAVAM)
                espVeic  := 0;         // J20 - Esp�cie de Ve�culo (Utilizar Tabela RENAVAM)
                VIN      := '';        // J21 - Condi��o do VIN
                condVeic := cvAcabado; // J22 - Condi��o do Ve�culo (1 - Acabado; 2 - Inacabado; 3 - Semi-acabado)
                cMod     := '';        // J23 - C�digo Marca Modelo (Utilizar Tabela RENAVAM)
              end;

          end;

          // Inserir Lote do Produto na NF-e
          // Campos espec�ficos para venda de medicamentos
          if (qryDadosProduto.FieldByName('estoque_aprop_lote').AsInteger = 1) and
             (TTipoProduto(qryDadosProduto.FieldByName('codtipo').AsInteger) in [tpMedicamento, tpSolucao] ) then
          begin
            with Prod.med.Add do
            begin
              cProdANVISA := qryDadosProduto.FieldByName('ANVISA').AsString;
              nLote       := qryDadosProduto.FieldByName('LOTE').AsString;
              qLote       := Prod.qTrib;
              dFab        := qryDadosProduto.FieldByName('LOTE_FABRICACAO').AsDateTime;
              dVal        := qryDadosProduto.FieldByName('LOTE_VALIDADE').AsDateTime;
              vPMC        := 0; //Prod.vProd;
            end;
          end;

  //Campos espec�ficos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
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

  //Campos espec�ficos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos espec�ficos para venda de combust�vel(distribuidoras)
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
              ICMS.orig := TpcnOrigemMercadoria( StrToInt(Copy(qryDadosProduto.FieldByName('CST').AsString, 1, 1)) );

              //if (Emit.CRT = crtSimplesNacional) then
              if (Emit.CRT = crtSimplesNacional) and (not aCalcularICMS) then
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

//                if (CSOSN = csosn900) then
//                begin
//                  ICMS.vBC   := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
//                  ICMS.pICMS := qryDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
//                  ICMS.vICMS := RoundABNT(ICMS.vBC * ICMS.pICMS / 100.0, -2);
//
//                  cTotal_ICMSTot_vBC   := cTotal_ICMSTot_vBC   + (Prod.qCom * ICMS.vBC);
//                  cTotal_ICMSTot_vICMS := cTotal_ICMSTot_vICMS + (Prod.qCom * ICMS.vICMS);
//                end;
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
                  ICMS.vBC := RoundABNT(Prod.qCom * qryDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency, -2)
                else
                  ICMS.vBC := RoundABNT(Prod.qCom * qryDadosProduto.FieldByName('PFINAL').AsCurrency, -2);

                ICMS.pICMS := qryDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
                ICMS.vICMS := RoundABNT(ICMS.vBC * ICMS.pICMS / 100.0, -2);

                cTotal_ICMSTot_vBC   := cTotal_ICMSTot_vBC   + ICMS.vBC;
                cTotal_ICMSTot_vICMS := cTotal_ICMSTot_vICMS + ICMS.vICMS;
              end;

              // ICMS ST (Substitui��o Tribut�ria)
              ICMS.modBCST := dbisMargemValorAgregado;
              ICMS.pMVAST  := 0;
              ICMS.pRedBCST:= 0;
              ICMS.vBCST   := 0;
              ICMS.pICMSST := 0;
              ICMS.vICMSST := 0;
            end;

            // Estudar:
            // 1. https://ajuda.contaazul.com/hc/pt-br/articles/115008496308-Partilha-ICMS
            // 2. https://facil123.com.br/blog/difal-diferencial-de-aliquota-icms/
            if ( (not aSimplesNacional) and aInterestadual and aConsumidorFinal and aNaoContribuinte ) then
            begin
              with ICMSUFDest do
              begin
                vBCUFDest      := ICMS.vBC; // Valor da Base de C�lculo da UF de Destino
                vBCFCPUFDest   := ICMS.vBC; // Valor da Base de C�lculo do Fundo de Combate � Pobreza na UF de Destino
                pFCPUFDest     := cAliquotaFCPUFDestino; // Al�quota do Fundo de Combate � Pobreza na UF de Destino
                pICMSUFDest    := cAliquotaUFDestino;    // Al�quota do ICMS da UF de Destino
                pICMSInter     := cAliquotaUFInter;      // Al�quota do ICMS Interestadual
                pICMSInterPart := 100.0; // Al�quota do ICMS Interestadual de Partilha
                vFCPUFDest     := (vBCUFDest * pFCPUFDest  / 100.0);                // Valor do Fundo de Combate � Pobreza na UF de Destino
                vICMSUFDest    := (vBCUFDest * (pICMSUFDest - pICMSInter) / 100.0); // Valor do ICMS na UF de Destino
                vICMSUFRemet   := 0.0;                                              // Valor do ICMS da UF do Remetente

                vTotalFCP_UF_Destino    := vTotalFCP_UF_Destino    + vFCPUFDest;
                vTotalICMS_UF_Destino   := vTotalICMS_UF_Destino   + vICMSUFDest;
                vTotalICMS_UF_Remetente := vTotalICMS_UF_Remetente + vICMSUFRemet;
              end;
            end;

            with PIS do
            begin
              if (Emit.CRT = crtSimplesNacional) then
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
              if (Emit.CRT = crtSimplesNacional) then
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

            with IPI do
            begin
              if (Emit.CRT = crtSimplesNacional) then
              begin
                CST      := TpcnCstIpi.ipi99; // Outras Sa�das
                clEnq    := '999';
                CNPJProd := '';
                cSelo    := '';
                qSelo    := 0;
                cEnq     := '';

                vBC    := 0;
                qUnid  := 0;
                vUnid  := 0;
                pIPI   := 0; // Percentual IPI
                vIPI   := 0; // Valor IPI
              end
              else
              begin
                CST      := TpcnCstIpi.ipi99 ; // Outras Sa�das
                clEnq    := '999';
                CNPJProd := '';
                cSelo    := '';
                qSelo    := 0;
                cEnq     := '';

//                if (CST = TpcnCstIpi.ipi99) then
//                begin
//                  vBC    := 0;
//                  qUnid  := 0;
//                  vUnid  := 0;
//                  pIPI   := 0; // Percentual IPI
//                  vIPI   := 0; // Valor IPI
//                end
//                else
//                begin
//                  vBC    := qryDadosProduto.FieldByName('PFINAL').AsCurrency * Prod.qCom;
//                  qUnid  := Prod.qCom;
//                  vUnid  := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
//                  pIPI   := qryDadosProduto.FieldByName('VALOR_IPI').AsCurrency / IPI.vBC * 100;
//                  vIPI   := IPI.vBC * IPI.pIPI / 100;
//                end;

                vBC    := qryDadosProduto.FieldByName('PFINAL').AsCurrency * Prod.qCom;
                qUnid  := Prod.qCom;
                vUnid  := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
                pIPI   := (qryDadosProduto.FieldByName('VALOR_IPI').AsCurrency / IPI.vBC) * 100;
                vIPI   := IPI.vBC * IPI.pIPI / 100;

                cTotal_vIPI := cTotal_vIPI + IPI.vIPI;
              end;
            end;

  {
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
  //Grupo para servi�os
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela dispon�vel
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}

            // Lei da Transpar�ncia de Impostos

            if ( Trim(Prod.NCM) <> EmptyStr ) then
            begin
              cPercentualTributoAprox := qryDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;

              if ( cPercentualTributoAprox > 0.0 ) then
              begin
                vTotTrib  := SimpleRoundTo((Prod.vProd * cPercentualTributoAprox / 100), -2);

                if (Trim(sInformacaoProduto) = EmptyStr) then
                  sInformacaoProduto := sInformacaoProduto +
                    Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                      FormatFloat(',0.00', vTotTrib),
                      FormatFloat(',0.##"%"', cPercentualTributoAprox)
                    ])
                else
                  sInformacaoProduto := sInformacaoProduto + #13 +
                    Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                      FormatFloat(',0.00', vTotTrib),
                      FormatFloat(',0.##"%"', cPercentualTributoAprox)
                    ]);

                infAdProd := sInformacaoProduto;

                vTotalTributoAprox := vTotalTributoAprox + vTotTrib;
              end;
            end;

          end;
        end ;

        qryDadosProduto.Next;
      end;

      Total.ICMSTot.vBC      := cTotal_ICMSTot_vBC;   // qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency;
      Total.ICMSTot.vICMS    := cTotal_ICMSTot_vICMS; // qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency;
      Total.ICMSTot.vBCST    := qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vST      := qryCalculoImposto.FieldByName('NFE_VALOR_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vProd    := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency;
      Total.ICMSTot.vFrete   := qryCalculoImposto.FieldByName('NFE_VALOR_FRETE').AsCurrency;
      Total.ICMSTot.vSeg     := qryCalculoImposto.FieldByName('NFE_VALOR_SEGURO').AsCurrency;
      Total.ICMSTot.vDesc    := qryCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency;
      Total.ICMSTot.vII      := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_II').AsCurrency;
      Total.ICMSTot.vIPI     := cTotal_vIPI; // qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_IPI').AsCurrency;
      Total.ICMSTot.vPIS     := qryCalculoImposto.FieldByName('NFE_VALOR_PIS').AsCurrency;
      Total.ICMSTot.vCOFINS  := qryCalculoImposto.FieldByName('NFE_VALOR_COFINS').AsCurrency;
      Total.ICMSTot.vOutro   := qryCalculoImposto.FieldByName('NFE_VALOR_OUTROS').AsCurrency;
      Total.ICMSTot.vNF      := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;

      if ( (not aSimplesNacional) and aInterestadual and aConsumidorFinal and aNaoContribuinte ) then
      begin
        Total.ICMSTot.vFCPUFDest   := vTotalFCP_UF_Destino;    // Valor do Fundo de Combate � Pobreza na UF de Destino
        Total.ICMSTot.vICMSUFDest  := vTotalICMS_UF_Destino;   // Valor do ICMS da UF de Destino
        Total.ICMSTot.vICMSUFRemet := vTotalICMS_UF_Remetente; // Valor do ICMS da UF do Remetente
      end;

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
                                                //         (0) = mfContaEmitente     � por conta do emitente;
                                                //         (1) = mfContaDestinatario � por conta do destinat�rio;
                                                //         (2) = mfContaTerceiros    � por conta do terceiros;
                                                //         (3) = mfSemFrete          � sem frete;
                                                //       TAG de grupo Transportador - <transporta> - Ocorr�ncia 0-3
     // Nova estrutura       = 0
       mfContaEmitente       = 1
     , mfContaDestinatario   = 2
     , mfContaTerceiros      = 3
     , mfProprioRemetente    = 4
     , mfProprioDestinatario = 5
     , mfSemFrete            = 6
  }
      case qryCalculoImposto.FieldByName('NFE_MODALIDADE_FRETE').AsInteger of
        0 : Transp.modFrete := mfContaEmitente;
        1 : Transp.modFrete := mfContaDestinatario;
        3 : Transp.modFrete := mfSemFrete;
        else
          Transp.modFrete := mfSemFrete;
      end;
      //Transp.modFrete            := TpcnModalidadeFrete( qryCalculoImposto.FieldByName('NFE_MODALIDADE_FRETE').AsInteger );

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
      Transp.veicTransp.RNTC  := qryCalculoImposto.FieldByName('NFE_PLACA_RNTC').AsString; // RNTC - Registros Nacional de Transportes de Carga (Identifica��o do vag�o quando o transporte � Trem)

  //Dados do Reboque
  {      with Transp.Reboque.Add do
         begin
           placa := '';
           UF    := '';
           RNTC  := '';
         end;
         }

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

            //Lacres do volume. Pode ser adicionado v�rios
            //Lacres.Add.nLacre := '';
          end;

          qryDadosVolume.Next;
        end;

      end;

      if ( Ide.finNFe = fnDevolucao ) then
      begin
        // Sem forma de Pagamento
        with pag.Add do
        begin
          indPag := ipNenhum;
          tPag   := fpSemPagamento;
          vPag   := 0.0;
        end;
      end
      else
      if ( Ide.finNFe = fnNormal ) then
      begin
//
//        // Formas de Pagamentos
//
//        with pag.Add do
//        begin
//          indPag := ipNenhum;
//          tPag   := fpSemPagamento;
//          //xPag   := EmptyStr;
//          vPag   := 0.0;
////          tpIntegra := tiNaoInformado;
////          CNPJ      := EmptyStr;
////          tBand     := bcOutros;
////          cAut      := EmptyStr;
//        end;

        // Dados da(s) Forma(s) de Pagamento(s)

//      01. TpcnFormaPagamento.fpDinheiro,
//      02. TpcnFormaPagamento.fpCheque,
//      03. TpcnFormaPagamento.fpCartaoCredito,
//      04. TpcnFormaPagamento.fpCartaoDebito,
//      05. TpcnFormaPagamento.fpCreditoLoja,
//      10. TpcnFormaPagamento.fpValeAlimentacao,
//      11. TpcnFormaPagamento.fpValeRefeicao,
//      12. TpcnFormaPagamento.fpValePresente,
//      13. TpcnFormaPagamento.fpValeCombustivel,
//      14. TpcnFormaPagamento.fpDuplicataMercantil,
//      06. TpcnFormaPagamento.fpBoletoBancario,
//      07. TpcnFormaPagamento.fpDepositoBancario,
//      08. TpcnFormaPagamento.fpPagamentoInstantaneo,
//      09. TpcnFormaPagamento.fpTransfBancario,
//      15. TpcnFormaPagamento.fpProgramaFidelidade,
//      TpcnFormaPagamento.fpSemPagamento,
//      TpcnFormaPagamento.fpRegimeEspecial,
//      TpcnFormaPagamento.fpOutro
//
        if ( not qryFormaPagtos.IsEmpty ) then
        begin
          qryFormaPagtos.First;
          while not qryFormaPagtos.Eof do
          begin
            with pag.Add do // Formas de Pagamentos apenas para NFC-e
            begin
              Case qryFormaPagtos.FieldByName('FORMAPAGTO_NFCE').AsInteger of
                01 : tPag := TpcnFormaPagamento.fpDinheiro;
                02 : tPag := TpcnFormaPagamento.fpCheque;
                03 : tPag := TpcnFormaPagamento.fpCartaoCredito;
                04 : tPag := TpcnFormaPagamento.fpCartaoDebito;
                05 : tPag := TpcnFormaPagamento.fpCreditoLoja;
                06 : tPag := TpcnFormaPagamento.fpBoletoBancario;
                07 : tPag := TpcnFormaPagamento.fpDepositoBancario;
                08 : tPag := TpcnFormaPagamento.fpPagamentoInstantaneo;
                09 : tPag := TpcnFormaPagamento.fpTransfBancario;
                10 : tPag := TpcnFormaPagamento.fpValeAlimentacao;
                11 : tPag := TpcnFormaPagamento.fpValeRefeicao;
                12 : tPag := TpcnFormaPagamento.fpValePresente;
                13 : tPag := TpcnFormaPagamento.fpValeCombustivel;
                14 : tPag := TpcnFormaPagamento.fpDuplicataMercantil;
                15 : tPag := TpcnFormaPagamento.fpProgramaFidelidade;
                else
                begin
                  tPag := fpOutro;
                  xPag := qryFormaPagtos.FieldByName('Descri').AsString;
                end;
              end;

              vPag := qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;
            end;

            qryFormaPagtos.Next;
          end;
        end;

        if not OcultarVencimentos then
        begin

          // Dados da Fatura

          Cobr.Fat.nFat  := FormatFloat('0000', qryCalculoImposto.FieldByName('ANO').AsInteger) + '/' + FormatFloat('0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger);
          Cobr.Fat.vOrig := qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency;
          Cobr.Fat.vLiq  := qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency ;
          //Cobr.Fat.vDesc := qryCalculoImposto.FieldByName('DESCONTO').AsCurrency ;
          Cobr.Fat.vDesc := (Cobr.Fat.vOrig - Cobr.Fat.vLiq);

          // Dados da(s) Duplicata(s)

          aParcela := 1;
          if ( qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
          begin
            qryDuplicatas.First;
            while not qryDuplicatas.Eof do
            begin
              with Cobr.Dup.Add do
              begin
                //nDup  := FormatFloat('0000', qryDuplicatas.FieldByName('ANOLANC').AsInteger) + '/' + FormatFloat('0000000', qryDuplicatas.FieldByName('NUMLANC').AsInteger);
                //nDup  := FormatFloat('000', qryDuplicatas.FieldByName('parcela').AsInteger);
                nDup  := FormatFloat('000', aParcela);
                dVenc := qryDuplicatas.FieldByName('DTVENC').AsDateTime;
                vDup  := qryDuplicatas.FieldByName('VALORREC').AsCurrency;
              end;

              Inc(aParcela);
              qryDuplicatas.Next;
            end;
          end;

        end;

      end;

      sInformacaoFisco := Trim(GetInformacaoFisco(qryCalculoImposto));
      InfAdic.infCpl   := #13 +
        'Venda: ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger)  +
        IfThen(OcultarVencimentos, '', ' - Forma/Cond. Pgto.: ' + qryCalculoImposto.FieldByName('LISTA_FORMA_PAGO').AsString + '/' + qryCalculoImposto.FieldByName('LISTA_COND_PAGO_FULL').AsString + ' * * * ') + #13 +
        'Vendedor: ' + qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString + ' * * * ' + #13 +
        'Observa��es: ' + qryCalculoImposto.FieldByName('OBS').AsString +
        IfThen(vTotalTributoAprox = 0, EmptyStr, #13 + Format('* Valor Total Aprox. Trib. R$ %s (%s). Fonte IBPT', [
          FormatFloat(',0.00', Total.ICMSTot.vTotTrib),
          FormatFloat(',0.##"%"', Total.ICMSTot.vTotTrib / Total.ICMSTot.vNF * 100)]));

      if (sInformacaoFisco <> EmptyStr) then
        InfAdic.infAdFisco := sInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obsera��es da venda: ' + qryCalculoImportoOBS.AsString;
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
      ACBrNFe.NotasFiscais.Assinar;

      if GetSolicitaDHSaidaNFe( sCNPJEmitente ) then
        if not ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(sErros) then
          raise Exception.Create( sErros );

      ACBrNFe.NotasFiscais.Validar;

      ACBrNFe.NotasFiscais.Items[0].NomeArq := EmptyStr;
      ACBrNFe.NotasFiscais.Items[0].GravarXML;

      FileNameXML := ACBrNFe.NotasFiscais.Items[0].NomeArq;

    end;

  except
    On E : Exception do
      ShowError('Erro ao tentar gerar NF-e de Sa�da.' + #13#13 + 'GerarNFEACBr() --> ' + e.Message);
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
      'Opera��o Tribut�vel com Al�quota B�sica'
    , 'Opera��o Tribut�vel com Al�quota Diferenciada'
    , 'Opera��o Tribut�vel com Al�quota por Unidade de Medida de Produto'
    , 'Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero'
    , 'Opera��o Tribut�vel por Substitui��o Tribut�ria'
    , 'Opera��o Tribut�vel a Al�quota Zero'
    , 'Opera��o Isenta da Contribui��o'
    , 'Opera��o sem Incid�nc ia da Contribui��o'
    , 'Opera��o com Suspens�o da Contribui��o'
    , 'Outras Opera��es de Sa�da'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita N�o Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno, e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno, e de Exporta��o'
    , 'Cr�dito Presumido - Outras Opera��es'
    , 'Opera��o de Aquisi��o sem Direito a Cr�dito'
    , 'Opera��o de Aquisi��o com Isen��o'
    , 'Opera��o de Aquisi��o com Suspens�o'
    , 'Opera��o de Aquisi��o a Al�quota Zero'
    , 'Opera��o de Aquisi��o sem Incid�ncia da Contribui��o'
    , 'Opera��o de Aquisi��o por Substitui��o Tribut�ria'
    , 'Outras Opera��es de Entrada'
    , 'Outras Opera��es'
  );
begin
  try
    sCST_PIS_ID[0]  := '01'; // Opera��o Tribut�vel com Al�quota B�sica
    sCST_PIS_ID[1]  := '02'; // Opera��o Tribut�vel com Al�quota Diferenciada
    sCST_PIS_ID[2]  := '03'; // Opera��o Tribut�vel com Al�quota por Unidade de Medida de Produto
    sCST_PIS_ID[3]  := '04'; // Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero
    sCST_PIS_ID[4]  := '05'; // Opera��o Tribut�vel por Substitui��o Tribut�ria
    sCST_PIS_ID[5]  := '06'; // Opera��o Tribut�vel a Al�quota Zero
    sCST_PIS_ID[6]  := '07'; // Opera��o Isenta da Contribui��o
    sCST_PIS_ID[7]  := '08'; // Opera��o sem Incid�nc ia da Contribui��o
    sCST_PIS_ID[8]  := '09'; // Opera��o com Suspens�o da Contribui��o
    sCST_PIS_ID[9]  := '49'; // Outras Opera��es de Sa�da
    sCST_PIS_ID[10] := '50'; // Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno
    sCST_PIS_ID[11] := '51'; // Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita N�o Tributada no Mercado Interno
    sCST_PIS_ID[12] := '52'; // Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita de Exporta��o
    sCST_PIS_ID[13] := '53'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno
    sCST_PIS_ID[14] := '54'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[15] := '55'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[16] := '56'; // Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno' e de Exporta��o
    sCST_PIS_ID[17] := '60'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita Tributada no Mercado Interno
    sCST_PIS_ID[18] := '61'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno
    sCST_PIS_ID[19] := '62'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita de Exporta��o
    sCST_PIS_ID[20] := '63'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno
    sCST_PIS_ID[21] := '64'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[22] := '65'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o
    sCST_PIS_ID[23] := '66'; // Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno' e de Exporta��o
    sCST_PIS_ID[24] := '67'; // Cr�dito Presumido - Outras Opera��es
    sCST_PIS_ID[25] := '70'; // Opera��o de Aquisi��o sem Direito a Cr�dito
    sCST_PIS_ID[26] := '71'; // Opera��o de Aquisi��o com Isen��o
    sCST_PIS_ID[27] := '72'; // Opera��o de Aquisi��o com Suspens�o
    sCST_PIS_ID[28] := '73'; // Opera��o de Aquisi��o a Al�quota Zero
    sCST_PIS_ID[29] := '74'; // Opera��o de Aquisi��o sem Incid�ncia da Contribui��o
    sCST_PIS_ID[30] := '75'; // Opera��o de Aquisi��o por Substitui��o Tribut�ria
    sCST_PIS_ID[31] := '98'; // Outras Opera��es de Entrada
    sCST_PIS_ID[32] := '99'; // Outras Opera��es

    for I := Low(sCST_PIS_ID) to High(sCST_PIS_ID) do
      with DMBusiness, fdQryBusca do
      begin
        SQL.Clear;
        SQL.Add( 'Execute Procedure SET_CST_PIS ('     );
        SQL.Add( '    ' + QuotedStr(sCST_PIS_ID[I])    );
        SQL.Add( '  , ' + QuotedStr(CST_PIS_DESC[I])   );
        SQL.Add( '  , ' + IntToStr(Ord(TpcnCstIpi(I))) );
        SQL.Add( ')' );

        ExecSQL;
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
      'Opera��o Tribut�vel com Al�quota B�sica'
    , 'Opera��o Tribut�vel com Al�quota Diferenciada'
    , 'Opera��o Tribut�vel com Al�quota por Unidade de Medida de Produto'
    , 'Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero'
    , 'Opera��o Tribut�vel por Substitui��o Tribut�ria'
    , 'Opera��o Tribut�vel a Al�quota Zero'
    , 'Opera��o Isenta da Contribui��o'
    , 'Opera��o sem Incid�ncia da Contribui��o'
    , 'Opera��o com Suspens�o da Contribui��o'
    , 'Outras Opera��es de Sa�da'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas N�o Tributadas no Mercado Interno e de Exporta��o'
    , 'Opera��o com Direito a Cr�dito - Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita N�o-Tributada no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada Exclusivamente a Receita de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Opera��o de Aquisi��o Vinculada a Receitas Tributadas e N�o-Tributadas no Mercado Interno e de Exporta��o'
    , 'Cr�dito Presumido - Outras Opera��es'
    , 'Opera��o de Aquisi��o sem Direito a Cr�dito'
    , 'Opera��o de Aquisi��o com Isen��o'
    , 'Opera��o de Aquisi��o com Suspens�o'
    , 'Opera��o de Aquisi��o a Al�quota Zero'
    , 'Opera��o de Aquisi��o sem Incid�ncia da Contribui��o'
    , 'Opera��o de Aquisi��o por Substitui��o Tribut�ria'
    , 'Outras Opera��es de Entrada'
    , 'Outras Opera��es'
  );
begin
  try
    for I := Low(sCST_PIS_ID) to High(sCST_PIS_ID) do
      with DMBusiness, fdQryBusca do
      begin
        SQL.Clear;
        SQL.Add( 'Execute Procedure SET_CST_COFINS ('     );
        SQL.Add( '    ' + QuotedStr(sCST_PIS_ID[I])    );
        SQL.Add( '  , ' + QuotedStr(CST_PIS_DESC[I])   );
        SQL.Add( '  , ' + IntToStr(Ord(TpcnCstCofins(I))) );
        SQL.Add( ')' );

        ExecSQL;
        CommitTransaction;
      end;
  except
    On E : Exception do
      raise Exception.Create('Erro no procedimento GerarTabela_CST_COFINS - ' + E.Message);
  end;
end;

function TDMNFe.GerarNFeEntradaOnLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra: Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE : String; var iNumeroLote  : Int64;
  var Denegada : Boolean; var DenegadaMotivo : String;
  const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE): Boolean;
var
  DtHoraEmiss : TDateTime;
  sErrorMsg   : String;
begin
{
  IMR - 04/10/2019 :
    Removida a rotina de verifica��o do servi�o de emiss�o da NFe da procedure "GerarNFeEntradaOnLineACBr()" para que
    esteja num n�vel de chamada acima.

  IMR - 24/10/2018 :
    * Inser��o do bloco de c�digo para guarda o n�mero do recibo de envio, caso ele
    exista, mesmo quando o retorno do envio seja FALSE.
    * Comentado o bloco de c�digo que remove o n�mero do recibo de envio da compra
    mesmo que a rejei��o seja de duplicidade de nota.

  IMR - 20/05/2016 :
    Inser��o da rotina que renomeia os arquivos XML de envio e retorno do Lote e
    Recibo quando o processo de gera��o/envio da NFe � finalizado corretamente.
    Neste passo o objeto "ACBrNFe.NotasFiscais" � zerado com o objetivo de
    eliminar "lixos de dados" para os novos processos de gera��o/envio de NFe.

  IMR - 05/03/2016 :
    Inters�o do par�metro "OcultarVencimentos" para que o usu�rio informe se ele
    quer ou n�o informar os vencimentos das parecelas da fatura na NF-e.

}
  sErrorMsg := EmptyStr;
  try

    LerConfiguracao(sCNPJEmitente);
    FMensagemErro := EmptyStr;

//    // Verificar o status do servi�o
//    if ( DelphiIsRunning ) then
//      Result := True
//    else
//      Result := ACBrNFe.WebServices.StatusServico.Executar;
//
//    if not Result then
//      Exit;
//
    GerarNFEEntradaACBr(sCNPJEmitente, iCodFornecedor, iAnoCompra, iNumCompra, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML, OcultarVencimentos);

    iNumeroLote := GetNextID('TBCONFIGURACAO', 'NFE_LOTE', 'where EMPRESA = ' + QuotedStr(sCNPJEmitente));

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

    if ( Result ) then
    begin
      if (ACBrNFe.NotasFiscais.Count > 0) then
      begin
        ACBrNFe.Consultar;
        ACBrNFe.NotasFiscais.Items[0].GravarXML(ExtractFileName(FileNameXML), ExtractFilePath(FileNameXML));
      end;

      ChaveNFE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
      UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
      GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, iNumeroLote, EmptyStr);

      // Renomer no diret�rio os arquivos XML de envio e retorno dos lotes e recibos de NF-e
      RenomearLogXmlEnvioRetornoNF(iNumeroLote, ReciboNFE, 'nfe');
      ACBrNFe.NotasFiscais.Clear;

      // Verificar se a nota foi Denegada
      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Count = 1 ) then
      begin
        if (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_NOTA_DENEGADA)
        or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_EMIT)
        or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_DEST) then
        begin
          Denegada       := True;
          DenegadaMotivo := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
        end;
      end;
    end
    // Guarda rebido de retorno, caso ele exista, mesmo o envio ter retornado FALSE
    else
    if Assigned(ACBrNFe.WebServices.Retorno) then
      if (Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr) then
      begin
        ReciboNFE := Trim(ACBrNFe.WebServices.Retorno.Recibo);
        GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, iNumeroLote, ReciboNFE);
      end;

  except
    On E : Exception do
    begin
      sErrorMsg := E.Message;

      // Diretrizes de tomada de decis�o quando a NFe enviada n�o � aceita

      if ( Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr ) then
        if ReciboNaoExisteNaEntrada(ACBrNFe.WebServices.Retorno.Recibo) then
          GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, iNumeroLote, ACBrNFe.WebServices.Retorno.Recibo);

      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Count = 1 ) then
      begin
        Case ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat of
          REJEICAO_NFE_DUPLICIDADE  :
            begin
//              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
//              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);
//
//              // Remover Lote da Entrada
//              GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, 0, EmptyStr);
//
              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
            end;

          REJEICAO_NFE_NOTA_DENEGADA, REJEICAO_NFE_IRREG_FISCO_EMIT, REJEICAO_NFE_IRREG_FISCO_DEST:
            begin
              UpdateNumeroNFe(sCNPJEmitente, qryEmitenteSERIE_NFE.AsInteger, iNumeroNFe);
              UpdateLoteNFe  (sCNPJEmitente, qryEmitenteLOTE_ANO_NFE.AsInteger, iNumeroLote);

              // Remover Lote da Entrada
              GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Favor gerar NF-e novamente!';
            end;

          REJEICAO_NFE_EMISSOR_NAO_HABIL,
          REJEICAO_NFE_IE_NAO_INFORMADO ,
          REJEICAO_NFE_IE_NAO_CADASTRADO,
          REJEICAO_NFE_IE_NAO_VINCULADO ,
          REJEICAO_NFE_BC_ICMS_ERR   ,
          REJEICAO_NFE_TO_ICMS_ERR   ,
          REJEICAO_NFE_TO_PROD_ERR   ,
          REJEICAO_NFE_NCM_INEXIST   ,
          REJEICAO_NFE_CFOP_INVALIDO ,
          REJEICAO_NFE_CFOP_DIFERENTE:
            begin
              // Remover Lote da Entrada
              GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Favor validar dados e NF-e novamente!';

              if (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat in [REJEICAO_NFE_IE_NAO_INFORMADO, REJEICAO_NFE_IE_NAO_CADASTRADO, REJEICAO_NFE_IE_NAO_VINCULADO]) then
                sErrorMsg :=
                  'Inscri��o Estadual (IE) do fornecedor n�o cadastrado ou n�o vinculado ao CNPJ informado. ' + #13 +
                  '- Deve-se consultar o CNPJ do fornecedor no SINTEGRA; ou' + #13 +
                  '- Deve-se consultar o CNPJ do fornecedor no portal ''https://dfe-portal.svrs.rs.gov.br/Nfe/Ccc''' + #13 +
                  'Favor corrija esta informa��o no Cadastro do Fornecedor.' + #13#13 +
                  'Ap�s este procedimento, gere novamente a NF-e'
              else
              if ( (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_CFOP_INVALIDO)
                or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_CFOP_DIFERENTE)
              ) then
                sErrorMsg :=
                  'C�digo Fiscal de Opera��o n�o adequado para este tipo de movimento dos produtos. ' +
                  'Favor corrija-o clicando com o bot�o direito do mouse no campo CFOP' + #13#13 +
                  'Ap�s este procedimento, gere novamente a NF-e';
            end;

          REJEICAO_NFE_NAO_CATALOG:
            begin
              // Remover Lote da Entrada
              GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Poss�vel erro na valida��o do arquivo XML na SEFA. Favor tentar gerar NF-e mais tarde.';
            end;

          else
          begin

            sErrorMsg := IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat) + ' - ' +
              ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13#13 +
              'Favor entrar em contato com suporte e apresentar esta mensagem!';

            if Assigned(ACBrNFe.WebServices.Recibo) then                        // Se possuir recibo de envio
            begin
              if Assigned(ACBrNFe.WebServices.Recibo.NFeRetorno) then           // Se o recibo de envio possuir retorno
              begin
                if Assigned(ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe) then // Se o retorno prossuir protocolo de processamento
                begin

                  if ( ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe.Count > 0 ) then
                    Case ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat of
                      PROCESSO_NFE_LOTE_REJEITADO :
                        begin
                          // Remover Lote da Entrada
                          GuardarLoteNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, 0, EmptyStr);

                          sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                            'Favor fazer as devidas core��es e gerar NF-e novamente!';
                        end;
                    end;

                end;
              end;
            end;

          end;
        end;

        ShowError('Erro ao tentar gerar NF-e de Entrada.' +
          #13 + 'Status: ' + IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat) +
          IfThen(Trim(ACBrNFe.WebServices.Retorno.Recibo) = EmptyStr, EmptyStr, #13 + 'Recibo: ' + ACBrNFe.WebServices.Retorno.Recibo) +
          #13#13 + 'GerarNFeEntradaOnLineACBr() --> ' + sErrorMsg);

      end;

      FMensagemErro := Trim(sErrorMsg);
      Result := False;
    end;
  end;

end;

function TDMNFe.GerarNFeEntradaOffLineACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
  var iSerieNFe, iNumeroNFe  : Integer; var FileNameXML, ChaveNFE : String;
  const OcultarVencimentos : Boolean = FALSE; const Imprimir : Boolean = TRUE) : Boolean;
var
  DtHoraEmiss : TDateTime;
begin

  try

    GerarNFEEntradaACBr(sCNPJEmitente, iCodFornecedor, iAnoCompra, iNumCompra, DtHoraEmiss, iSerieNFe, iNumeroNFe, FileNameXML, OcultarVencimentos);

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
        raise Exception.Create(Format('Arquivo %s n�o encontrado.', [QuotedStr(sFileNameXML)]));

      with ACBrNFe do
      begin
        Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);

        NotasFiscais.Clear;
        NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString );

        // Montar identifica��o do documento para t�tulo de e-mail

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

        sEmailEmpresa      := GetEmailEmpresa( sCNPJEmitente );
        sEmailDestinatario := GetClienteEmail( iCodigoCliente );
        sEmailAssunto      := GetNomeFantasiaEmpresa( sCNPJEmitente ) + ' - ' + sDocumento;

        sCC.Add( sEmailEmpresa );

        sMSG.Add( sMensagem );
        sMSG.Add('');
        sMSG.Add( sAssinaturaTxt );
        sMSG.Add('--');
        sMSG.Add('FAVOR N�O RESPONDER ESTE E-MAIL.');
        sMSG.Add('Composi��o autom�tica de e-mail executada pelo sistema ' + gPersonalizaEmpresa.ProductName + ' (Vers�o ' + TVersaoController.GetInstance().Version +
          '), desenvolvido pela empresa ' + gPersonalizaEmpresa.CompanyName + '.' + #13#13 + TVersaoController.GetInstance().Copyright);

        if FileExists( sArquivoBoleto ) then
          sANX.Add( sArquivoBoleto );

        CopyFileTo( sFileNameXML, ExtractFilePath(ParamStr(0)) + ExtractFileName(sFileNameXML) );

        ConfigurarEmail(sCNPJEmitente, sEmailDestinatario, sEmailAssunto, sMSG.Text);

//        NotasFiscais.Items[0].EnviarEmail(
//            gContaEmail.Servidor_SMTP
//          , IntToStr(gContaEmail.Porta_SMTP)
//          , gContaEmail.Conta
//          , gContaEmail.Senha
//          , gContaEmail.Conta
//          , sEmailDestinatario
//          , sEmailAssunto
//          , sMSG
//          , gContaEmail.ConexaoSeguraSSL // SSL - Conex�o Segura
//          , EnviarPDF                    // Enviar PDF junto
//          , sCC                          // Lista com emails que ser�o enviado c�pias - TStrings
//          , sANX                         // Lista de anexos - TStrings
//          , False                        // Pede confirma��o de leitura do email
//          , False                        // Aguarda Envio do Email(n�o usa thread)
//          , GetNomeFantasiaEmpresa( sCNPJEmitente ) // Nome do Rementente
//          , gContaEmail.ConexaoSeguraSSL );         // Auto TLS
        NotasFiscais.Items[0].EnviarEmail(
            sEmailDestinatario
          , sEmailAssunto
          , sMSG
          , EnviarPDF                    // Enviar PDF junto
          , sCC                          // Lista com emails que ser�o enviado c�pias - TStrings
          , sANX);                       // Lista de anexos - TStrings

        Result := True;
      end;

    except
      On E : Exception do
      begin
        ShowError('Erro ao tentar enviar para o cliente por e-mail o DANFE de Sa�da.' + #13#13 + 'EnviarEmailDANFEACBr() --> ' + e.Message);
        Result := False;
      end;
    end;

  finally
    sANX.Free;
    sMSG.Free;
    sCC.Free;

    System.SysUtils.DeleteFile( sFileNameXML );
    System.SysUtils.DeleteFile( ExtractFilePath(ParamStr(0)) + ExtractFileName(sFileNameXML) );
  end;

end;

procedure TDMNFe.GerarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor : Integer; const iAnoCompra, iNumCompra : Integer;
  var DtHoraEmiss : TDateTime; var iSerieNFe, iNumeroNFe : Integer; var FileNameXML : String;
  const OcultarVencimentos : Boolean = FALSE);
var
  sInformacaoProduto,
  sInformacaoFisco  : String;
  cPercentualTributoAprox,
  vTotalTributoAprox     : Currency;
  PorCodigoExterno : Boolean;

  iCodigoNFE,
  aParcela  : Integer;

  // Totalizar Valores
  cTotal_vIPI          ,
  cTotal_ICMSTot_vBC   ,
  cTotal_ICMSTot_vICMS : Currency;
begin
(*
  IMR - 03/09/2019 :
    O campo "Ide.cNF" precisa receber um valor de c�digo, gerado de forma aleat�ria, diferente do n�mero da
    nota fiscal e assim esteja de acordo com as expecifica��es da Receita Federal.

  IMR - 14/03/2018 :
    Implementa��o da rotina que inseri a Refer�ncia como C�digo do Produto na nota
    fiscal de acordo com a configura��o da empresa.

  IMR - 03/06/2016 :
    Inclus�o da instru��o "Ide.indFinal := cfConsumidorFinal" para todo destinat�rio
    da nota que for pessoa f�sica, ou seja, todo destinat�rio que n�o seja
    contribuinte de ICMS (Dest.indIEDest = inNaoContribuinte).

  IMR - 05/03/2016 :
    Inters�o do par�metro "OcultarVencimentos" para que o usu�rio informe se ele
    quer ou n�o informar os vencimentos das parecelas da fatura na NF-e.

  IMR - 08/12/2015 :
    Altera��o nas regras de opera��o da tag "idDest" para a emiss�o de Notas Fiscais
    para fora do Estado.

  IMR - 20/09/2014 :
    Inse��o de nova TAG na Nota Fiscal referente a IE do destinat�rio para informa se este � Isento, Contribuinte ou N�o-contribuinte de acordo
    com as regras estabelecidas pela SEFA para a vers�o 3.10 da NF-e.

  IMR - 10/10/2014 :
    Implementa��o da Lei "Transpar�ncia de Impostos" que visa informar ao consumidos o valor e o percentual pago de impostos sobre os itens e
    o total geral da nota fiscal.

  IMR - 31/03/2015 :
    Inclus�o da TAG "Ide.finNFe := fnDevolucao" quando a NF-e for de devolu��o

  IMR - 23/05/2015 :
    Inclus�o do bloco de c�digo para verificar se o CFOP da venda corresponde
    a uma opera��o de devolu��o. Caso esta situa��o seja confirmada, a NF-e de
    origem ser� solicitada.
*)

  try

    LerConfiguracao(sCNPJEmitente);

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( iCodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra, sCNPJEmitente );

    iSerieNFe   := qryEmitenteSERIE_NFE.AsInteger;
    //iNumeroNFe  := GetNextID('TBCONFIGURACAO', 'NFE_NUMERO', 'where EMPRESA = ' + QuotedStr(sCNPJEmitente));
    iNumeroNFe  := GetNumeroNFe(sCNPJEmitente, iSerieNFe, MODELO_NFE);
    iCodigoNFE  := GerarCodigoDFe(iNumeroNFe);
    DtHoraEmiss := GetDateTimeDB;

    GuardarCodigoNFeEntrada(sCNPJEmitente, iAnoCompra, iNumCompra, iCodigoNFE);

    ACBrNFe.NotasFiscais.Clear;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      // Caso n�o seja preenchido ser� gerado um n�mero aleat�rio pelo componente
      Ide.cNF   := iCodigoNFE;
      Ide.natOp := qryEntradaCalculoImposto.FieldByName('CFOP_RESUMIDO').AsString;

      // Entradas ou sa�das dentro do Estado
      if ( qryEntradaCalculoImposto.FieldByName('CFOP').AsString[1] in ['1', '5'] ) then
        Ide.idDest := doInterna
      else
      // Entradas ou sa�das em Estados diferentes
      if ( qryEntradaCalculoImposto.FieldByName('CFOP').AsString[1] in ['2', '6'] ) then
        Ide.idDest := doInterestadual
      else
      // Entradas ou sa�das do Exterior
      if ( qryEntradaCalculoImposto.FieldByName('CFOP').AsString[1] in ['3', '7'] ) then
        Ide.idDest := doExterior
      else
        Ide.idDest := doInterna;

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
      Ide.verProc   := GetExeVersion( ParamStr(0) ); // Vers�o do seu sistema
      Ide.cUF       := UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;

      if (qryEntradaCalculoImposto.FieldByName('CFOP_DEVOLUCAO').AsInteger = 1) then
        Ide.finNFe := fnDevolucao
      else
        Ide.finNFe := fnNormal;

      if ( qryFornecedorDestinatario.FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        Ide.indFinal := cfConsumidorFinal;

      if ( Ide.finNFe  = fnDevolucao ) then
        with Ide.NFref.Add, qryEntradaCalculoImposto do
          Case TFormaNFDevolucao(FieldByName('DNFE_FORMA').AsInteger) of
            fdNFeEletronica:
              refNFe := FieldByName('DNFE_CHAVE').AsString; // Nota Fiscal Eletronica

            fdNFeModelo1_1A:
              begin
                RefNF.cUF    := UFtoCUF(FieldByName('DNFE_UF').AsString); // |
                RefNF.AAMM   := FieldByName('DNFE_COMPETENCIA').AsString;          // |
                RefNF.CNPJ   := FieldByName('DNFE_CNPJ_CPF').AsString;             // |
                RefNF.modelo := FieldByName('DNFE_MODELO').AsInteger;              // |- NF Modelo 1/1A
                RefNF.serie  := FieldByName('DNFE_SERIE').AsInteger;               // |  * O modelo padr�o � 1
                RefNF.nNF    := FieldByName('DNFE_NUMERO').AsInteger;              // |
              end;

            fdNFProdutorRural:
              begin
                RefNFP.cUF     := UFtoCUF(FieldByName('DNFE_UF').AsString);       // |
                RefNFP.AAMM    := FieldByName('DNFE_COMPETENCIA').AsString;                // |
                RefNFP.CNPJCPF := FieldByName('DNFE_CNPJ_CPF').AsString;                   // |
                RefNFP.IE      := FieldByName('DNFE_IE').AsString;                         // |- NF produtor Rural
                RefNFP.modelo  := FormatFloat('00', FieldByName('DNFE_MODELO').AsInteger); // | * O modelo padr�o � 04
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
      Emit.IM                := ''; // Preencher no caso de existir servi�os na nota
      Emit.CNAE              := ''; // Verifique na cidade do emissor da NFe se � permitido
                                    // a inclus�o de servi�os na NFe

      // �gil Solu��es em Softwares
      with autXML.Add do
        CNPJCPF := AGIL_SOFTWARES_CNPJ;

      // CNPJ/CPF Contador
      if (Trim(qryEmitenteCONTADOR_CNPJCPF.AsString) <> EmptyStr) then
        with autXML.Add do
          CNPJCPF := StrOnlyNumbers( Trim(qryEmitenteCONTADOR_CNPJCPF.AsString) );

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
        if (AnsiUpperCase(Copy(Trim(qryFornecedorDestinatario.FieldByName('INSCEST').AsString), 1, 5)) = 'ISENT') or (Trim(qryFornecedorDestinatario.FieldByName('INSCEST').AsString) = EmptyStr) then
          Dest.indIEDest     := inIsento
        else
          Dest.indIEDest     := inContribuinte;

        Dest.IE              := IfThen(Dest.indIEDest = inContribuinte, Trim(qryFornecedorDestinatario.FieldByName('INSCEST').AsString), EmptyStr);
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

  //Use os campos abaixo para informar o endere�o de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endere�o de entrega quando for diferente do Remetente/Destinat�rio
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

      // Adicionando Produtos

      PorCodigoExterno     := GetImprimirCodigoExternoProdutoNFe(sCNPJEmitente);
      vTotalTributoAprox   := 0.0;
      cTotal_vIPI          := 0.0;
      cTotal_ICMSTot_vBC   := 0.0;
      cTotal_ICMSTot_vICMS := 0.0;

      qryEntradaDadosProduto.First;

      while not qryEntradaDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem := qryEntradaDadosProduto.RecNo; // qryEntradaDadosProdutoSEQ.AsInteger; // N�mero sequencial, para cada item deve ser incrementado

          if PorCodigoExterno then
          begin
            if (gSistema.Codigo = SISTEMA_GESTAO_OPME) then
              Prod.cProd := IfThen(Trim(qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr,
                Trim(qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString),
                Trim(qryEntradaDadosProduto.FieldByName('CODPROD').AsString))
            else
              Prod.cProd := IfThen(Trim(qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString) <> EmptyStr,
                Trim(qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString),
                Trim(qryEntradaDadosProduto.FieldByName('CODPROD').AsString));
          end
          else
            Prod.cProd := Trim(qryEntradaDadosProduto.FieldByName('CODPROD').AsString);

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryEntradaDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString
          else
            Prod.xProd  := qryEntradaDadosProduto.FieldByName('DESCRI').AsString + ' ' + qryEntradaDadosProduto.FieldByName('ANO_FAB_MODELO_VEICULO').AsString;

          Prod.NCM      := qryEntradaDadosProduto.FieldByName('NCM_SH').AsString;            // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.CFOP     := qryEntradaDadosProduto.FieldByName('CFOP_COD').AsString;
          Prod.EXTIPI   := EmptyStr;

          if (Trim(Prod.NCM) = EmptyStr) or (Trim(Prod.NCM) = '10203000') then // C�digo descontinuado a partir de 2016
            Prod.NCM := TRIBUTO_NCM_SH_PADRAO;

          if EAN13Valido(qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString) then  // Futuramento implementar a fun��o "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
          begin
            Prod.cEAN     := qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString;
            Prod.cEANTrib := qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString;
          end
          else
          begin
            //Prod.cEAN   := EmptyStr;
            //Prod.cEAN     := 'SEM GTIN';
            //Prod.cEANTrib := 'SEM GTIN';
            Prod.cEAN     := Trim(qryEntradaDadosProduto.FieldByName('CODPROD').AsString);
            Prod.cEAN     := PadLeft(Prod.cEAN, 12, '0') + EAN13_DV(Prod.cEAN);
            Prod.cEANTrib := Prod.cEAN;
          end;

          Prod.uCom     := qryEntradaDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qCom     := qryEntradaDadosProduto.FieldByName('QTDE').AsCurrency;

          Prod.vUnCom   := qryEntradaDadosProduto.FieldByName('PUNIT').AsCurrency;           // I10a  Valor Unit�rio de comercializa��o

          Prod.vProd    := qryEntradaDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Servi�os

//          if EAN13Valido(qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramente implementar a fun��o "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
//            Prod.cEANTrib := qryEntradaDadosProduto.FieldByName('CODBARRA_EAN').AsString
//          else
//            Prod.cEANTrib := EmptyStr;
//
          Prod.uTrib     := qryEntradaDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qTrib     := qryEntradaDadosProduto.FieldByName('QTDE').AsCurrency;

          Prod.vUnTrib   := qryEntradaDadosProduto.FieldByName('PUNIT').AsCurrency;          // I14a  Valor Unit�rio de tributa��o

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

          // Informa��o Adicional do Produto

          sInformacaoProduto := EmptyStr;
          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
          begin
            if PorCodigoExterno then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'C�d.: ' + qryEntradaDadosProduto.FieldByName('CODPROD').AsString
            else
            if ( Trim(qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Ref.: ' + qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString;

            if ( Trim(qryEntradaDadosProduto.FieldByName('ANVISA').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Anvisa: ' + qryEntradaDadosProduto.FieldByName('ANVISA').AsString;

            if ( Trim(qryEntradaDadosProduto.FieldByName('LOTE').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Lote: ' + qryEntradaDadosProduto.FieldByName('LOTE').AsString +
                  IfThen(qryEntradaDadosProduto.FieldByName('LOTE_FABRICACAO').IsNull, '', ' Fabrica��o: ' + FormatDateTime('dd/mm/yyyy', qryEntradaDadosProduto.FieldByName('LOTE_FABRICACAO').AsDateTime)) +
                  IfThen(qryEntradaDadosProduto.FieldByName('LOTE_VALIDADE').IsNull  , '', ' Validade: '   + FormatDateTime('dd/mm/yyyy', qryEntradaDadosProduto.FieldByName('LOTE_VALIDADE').AsDateTime));
          end
          else
            sInformacaoProduto :=
              'Cor: '         + qryEntradaDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString + #13 +
              'Placa: '       + qryEntradaDadosProduto.FieldByName('REFERENCIA').AsString      + #13 +
              'Renavam: '     + qryEntradaDadosProduto.FieldByName('RENAVAM_VEICULO').AsString + #13 +
              'Chassi: '      + qryEntradaDadosProduto.FieldByName('CHASSI_VEICULO').AsString  + #13 +
              'Combustivel: ' + qryEntradaDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString;

          infAdProd := sInformacaoProduto;

  //Declara��o de Importa��o. Pode ser adicionada v�rias atrav�s do comando Prod.DI.Add

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

  //Campos para venda de ve�culos novos

          if ( (GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID) and (qryEntradaDadosProduto.FieldByName('PRODUTO_NOVO').AsInteger = 1) ) then
          begin

            with Prod.veicProd do
              begin
                tpOP     := toVendaConcessionaria; // J02 - Tipo da opera��o
                                                   //    (1) = toVendaConcessionaria
                                                   //    (2) = toFaturamentoDireto
                                                   //    (3) = toVendaDireta
                                                   //    (0) = toOutros
                chassi   := qryEntradaDadosProduto.FieldByName('CHASSI_VEICULO').AsString;        // J03 - Chassi do ve�culo
                cCor     := qryEntradaDadosProduto.FieldByName('COR_VEICULO').AsString;           // J04 - Cor
                xCor     := qryEntradaDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString; // J05 - Descri��o da Cor
                pot      := ''; // J06 - Pot�ncia Motor
                Cilin    := '';
                pesoL    := ''; // J08 - Peso L�quido
                pesoB    := ''; // J09 - Peso Bruto
                nSerie   := ''; // J10 - Serial (s�rie)
                tpComb   := qryEntradaDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString; // J11 - Tipo de combust�vel
                nMotor   := ''; // J12 - N�mero de Motor
                CMT      := '';
                dist     := '';        // J14 - Dist�ncia entre eixos
//                RENAVAM  := '';        // J15 - RENAVAM            (N�o informar a TAG na exporta��o)
                anoMod   := qryEntradaDadosProduto.FieldByName('ANO_MODELO_VEICULO').AsInteger;         // J16 - Ano Modelo de Fabrica��o
                anoFab   := qryEntradaDadosProduto.FieldByName('ANO_FABRICACAO_VEICULO').AsInteger;     // J17 - Ano de Fabrica��o
                tpPint   := '';        // J18 - Tipo de Pintura
                tpVeic   := StrToIntDef(qryEntradaDadosProduto.FieldByName('TIPO_VEICULO').AsString, 0); // J19 - Tipo de Ve�culo    (Utilizar Tabela RENAVAM)
                espVeic  := 0;         // J20 - Esp�cie de Ve�culo (Utilizar Tabela RENAVAM)
                VIN      := '';        // J21 - Condi��o do VIN
                condVeic := cvAcabado; // J22 - Condi��o do Ve�culo (1 - Acabado; 2 - Inacabado; 3 - Semi-acabado)
                cMod     := '';        // J23 - C�digo Marca Modelo (Utilizar Tabela RENAVAM)
              end;

          end;

          // Inserir Lote do Produto na NF-e
          // Campos espec�ficos para compra de medicamentos
          if (qryEntradaDadosProduto.FieldByName('estoque_aprop_lote').AsInteger = 1) and
             (TTipoProduto(qryEntradaDadosProduto.FieldByName('codtipo').AsInteger) in [tpMedicamento, tpSolucao] ) then
          begin
            with Prod.med.Add do
            begin
              cProdANVISA := qryEntradaDadosProduto.FieldByName('ANVISA').AsString;
              nLote       := qryEntradaDadosProduto.FieldByName('LOTE').AsString;
              qLote       := Prod.qTrib;
              dFab        := qryEntradaDadosProduto.FieldByName('LOTE_FABRICACAO').AsDateTime;
              dVal        := qryEntradaDadosProduto.FieldByName('LOTE_VALIDADE').AsDateTime;
              vPMC        := 0; //Prod.vProd;
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

  //Campos espec�ficos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos espec�ficos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos espec�ficos para venda de combust�vel(distribuidoras)
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
              ICMS.orig := TpcnOrigemMercadoria( StrToInt(Copy(qryEntradaDadosProduto.FieldByName('CST').AsString, 1, 1)) );

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

//                if (CSOSN = csosn900) then
//                begin
//                  ICMS.vBC   := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;
//                  ICMS.pICMS := qryEntradaDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
//                  ICMS.vICMS := RoundABNT(ICMS.vBC * ICMS.pICMS / 100.0, -2);
//
//                  cTotal_ICMSTot_vBC   := cTotal_ICMSTot_vBC   + (Prod.qCom * ICMS.vBC);
//                  cTotal_ICMSTot_vICMS := cTotal_ICMSTot_vICMS + (Prod.qCom * ICMS.vICMS);
//                end;
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
                  ICMS.vBC := RoundABNT(Prod.qCom * qryEntradaDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency, -2)
                else
                  ICMS.vBC := RoundABNT(Prod.qCom * qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency, -2);

                ICMS.pICMS := qryEntradaDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
                ICMS.vICMS := RoundABNT(ICMS.vBC * ICMS.pICMS / 100.0, -2);

                cTotal_ICMSTot_vBC   := cTotal_ICMSTot_vBC   + ICMS.vBC;
                cTotal_ICMSTot_vICMS := cTotal_ICMSTot_vICMS + ICMS.vICMS;
              end;

              // ICMS ST (Substitui��o Tribut�ria)
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

            with IPI do
            begin
              if (Emit.CRT = crtSimplesNacional) then
              begin
                CST      := TpcnCstIpi.ipi49; // Outras Entradas
                clEnq    := '999';
                CNPJProd := '';
                cSelo    := '';
                qSelo    := 0;
                cEnq     := '';

                vBC    := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;
                qUnid  := 0;
                vUnid  := 0;
                pIPI   := 0; // Percentual IPI
                vIPI   := 0; // Valor IPI
              end
              else
              begin
                CST      := TpcnCstIpi.ipi49; // Outras Entradas
                clEnq    := '999';
                CNPJProd := '';
                cSelo    := '';
                qSelo    := 0;
                cEnq     := '';

//                if (CST = TpcnCstIpi.ipi99) then
//                begin
//                  vBC    := 0;
//                  qUnid  := 0;
//                  vUnid  := 0;
//                  pIPI   := 0; // Percentual IPI
//                  vIPI   := 0; // Valor IPI
//                end
//                else
//                begin
//                  vBC    := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency * Prod.qCom;
//                  qUnid  := Prod.qCom;
//                  vUnid  := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;
//                  pIPI   := qryEntradaDadosProduto.FieldByName('VALOR_IPI').AsCurrency / IPI.vBC * 100;
//                  vIPI   := IPI.vBC * IPI.pIPI / 100;
//                end;

                vBC    := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency * Prod.qCom;
                qUnid  := Prod.qCom;
                vUnid  := qryEntradaDadosProduto.FieldByName('PFINAL').AsCurrency;
                pIPI   := (qryEntradaDadosProduto.FieldByName('VALOR_IPI').AsCurrency / IPI.vBC) * 100;
                vIPI   := IPI.vBC * IPI.pIPI / 100;

                cTotal_vIPI := cTotal_vIPI + IPI.vIPI;
              end;
            end;

  {
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
  //Grupo para servi�os
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela dispon�vel
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}

            // Lei da Transpar�ncia de Impostos

            if ( Trim(Prod.NCM) <> EmptyStr ) then
            begin
              cPercentualTributoAprox := qryEntradaDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;

              if ( cPercentualTributoAprox > 0.0 ) then
              begin
                vTotTrib  := SimpleRoundTo((Prod.vProd * cPercentualTributoAprox / 100), -2);
//                sInformacaoProduto := sInformacaoProduto +
//                  Trim(IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) + Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
//                    FormatFloat(',0.00', vTotTrib),
//                    FormatFloat(',0.##"%"', cPercentualTributoAprox)
//                  ]));

                if (Trim(sInformacaoProduto) = EmptyStr) then
                  sInformacaoProduto := sInformacaoProduto +
                    Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                      FormatFloat(',0.00', vTotTrib),
                      FormatFloat(',0.##"%"', cPercentualTributoAprox)
                    ])
                else
                  sInformacaoProduto := sInformacaoProduto + #13 +
                    Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                      FormatFloat(',0.00', vTotTrib),
                      FormatFloat(',0.##"%"', cPercentualTributoAprox)
                    ]);

                infAdProd := sInformacaoProduto;

                vTotalTributoAprox := vTotalTributoAprox + vTotTrib;
              end;
            end;

          end;
        end ;

        qryEntradaDadosProduto.Next;
      end;

      Total.ICMSTot.vBC     := cTotal_ICMSTot_vBC;   // qryEntradaCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency;
      Total.ICMSTot.vICMS   := cTotal_ICMSTot_vICMS; // qryEntradaCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency;
      Total.ICMSTot.vBCST   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vST     := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vProd   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency;
      Total.ICMSTot.vFrete  := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_FRETE').AsCurrency;
      Total.ICMSTot.vSeg    := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_SEGURO').AsCurrency;
      Total.ICMSTot.vDesc   := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency;
      Total.ICMSTot.vII     := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_II').AsCurrency;
      Total.ICMSTot.vIPI    := cTotal_vIPI; // qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_IPI').AsCurrency;
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
                                                //         (0)=mfContaEmitente     � por conta do emitente;
                                                //         (1)=mfContaDestinatario � por conta do destinat�rio)
                                                //       TAG de grupo Transportador - <transporta> - Ocorr�ncia 0-1

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

          //Lacres do volume. Pode ser adicionado v�rios
          //Lacres.Add.nLacre := '';
        end;


      if ( Ide.finNFe = fnDevolucao ) then
      begin

        // Sem forma de Pagamento

        with pag.Add do
        begin
          indPag := ipNenhum;
          tPag   := fpSemPagamento;
          vPag   := 0.0;
        end;

      end
      else
      if ( Ide.finNFe = fnNormal ) then
      begin

        // Formas de Pagamentos

        with pag.Add do
        begin
          indPag := ipNenhum;
          tPag   := fpSemPagamento;
          vPag   := 0.0;
        end;

        if not OcultarVencimentos then
        begin

          // Dados da Fatura

          Cobr.Fat.nFat  := FormatFloat('0000', qryEntradaCalculoImposto.FieldByName('ANO').AsInteger) + '/' + FormatFloat('0000000', qryEntradaCalculoImposto.FieldByName('CODCONTROL').AsInteger);
          Cobr.Fat.vOrig := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency + qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;
          Cobr.Fat.vDesc := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency ;
          Cobr.Fat.vLiq  := qryEntradaCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency ;

          // Dados da(s) Duplicata(s)

          aParcela := 1;
          if ( qryEntradaCalculoImposto.FieldByName('COMPRA_PRAZO').AsInteger = 1 ) then
          begin
            qryEntradaDuplicatas.First;
            while not qryEntradaDuplicatas.Eof do
            begin
              with Cobr.Dup.Add do
              begin
                //nDup  := FormatFloat('0000', qryEntradaDuplicatas.FieldByName('ANOLANC').AsInteger) + '/' + FormatFloat('0000000', qryEntradaDuplicatas.FieldByName('NUMLANC').AsInteger);
                //nDup  := FormatFloat('000', qryEntradaDuplicatas.FieldByName('parcela').AsInteger);
                nDup  := FormatFloat('000', aParcela);
                dVenc := qryEntradaDuplicatas.FieldByName('DTVENC').AsDateTime;
                vDup  := qryEntradaDuplicatas.FieldByName('VALORPAG').AsCurrency;
              end;

              Inc(aParcela);
              qryEntradaDuplicatas.Next;
            end;
          end;

        end;

      end;

      sInformacaoFisco := Trim(GetInformacaoFisco(qryEntradaCalculoImposto));
      InfAdic.infCpl   := #13 +
        'Compra: ' + qryEntradaCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryEntradaCalculoImposto.FieldByName('CODCONTROL').AsInteger)  +
        ' - Forma/Cond. Pgto.: ' + qryEntradaCalculoImposto.FieldByName('FORMA_PAGO').AsString + '/' + qryEntradaCalculoImposto.FieldByName('COND_PAGO_FULL').AsString + ' * * * ' + #13 +
        'Usu�rio: ' + qryEntradaCalculoImposto.FieldByName('USUARIO_NOME_COMPLETO').AsString + ' * * * ' + #13 +
        'Observa��es: ' + qryEntradaCalculoImposto.FieldByName('OBS').AsString +
        IfThen(vTotalTributoAprox = 0, EmptyStr, #13 + Format('* Valor Total Aprox. Trib. R$ %s (%s). Fonte IBPT', [
          FormatFloat(',0.00', Total.ICMSTot.vTotTrib),
          FormatFloat(',0.##"%"', Total.ICMSTot.vTotTrib / Total.ICMSTot.vNF * 100)]));

      if ( sInformacaoFisco <> EmptyStr ) then
        InfAdic.infAdFisco := sInformacaoFisco;

  {
      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Info. Fisco: ' + GetInformacaoFisco;
      end;

      with InfAdic.obsCont.Add do
      begin
        xCampo := 'ObsCont';
        xTexto := 'Obsera��es da venda: ' + qryCalculoImportoOBS.AsString;
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
        ACBrNFe.NotasFiscais.Validar;

      ACBrNFe.NotasFiscais.Items[0].NomeArq := EmptyStr;
      ACBrNFe.NotasFiscais.Items[0].GravarXML;

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
    AbrirCompra( iAnoCompra, iNumCompra, sCNPJEmitente );
    AbrirNFeEmitidaEntrada( iAnoCompra, iNumCompra );

    if (Trim(qryEntradaCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString) = EmptyStr) then
    begin
      ShowWarning('Arquivo XML da Nota Fiscal n�o carregado.' + #13 + 'Favor informar ao Suporte.');
      Exit;
    end;

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
        WebServices.Consulta.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
        WebServices.Consulta.Executar;

        DANFE.Protocolo := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
      end;

      // Remover a logomarca do DANFE quando o emissor da nota n�o for a empresa
      if OnlyNumber(NotasFiscais.Items[0].NFe.Emit.CNPJCPF) <> OnlyNumber(sCNPJEmitente) then
      begin
        DANFE.Email := EmptyStr;
        DANFE.Site  := EmptyStr;
        DANFE.Logo  := EmptyStr;
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

procedure TDMNFe.AbrirCompra(AnoCompra, NumeroCompra: Integer; aEmpresa : String);
begin
  with qryEntradaCalculoImposto do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    ParamByName('empresa').AsString    := aEmpresa;
    Open;
  end;

  with qryEntradaDadosProduto do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    ParamByName('empresa').AsString    := aEmpresa;
    Open;
  end;

  with qryEntradaDuplicatas do
  begin
    Close;
    ParamByName('anoCompra').AsInteger := AnoCompra;
    ParamByName('numCompra').AsInteger := NumeroCompra;
    ParamByName('empresa').AsString    := aEmpresa;
    Open;
  end;
end;

function TDMNFe.CancelarNFeEntradaACBr(const sCNPJEmitente : String; const iCodFornecedor, iAnoCompra, iNumCompra: Integer;
  const Motivo: String): Boolean;
var
  aCan : Boolean;
  FileNameXML ,
  ChaveNFE    : String;
  //iNumeroLote : Integer;
  iNumeroLote : Int64;
  sLOG : TStringList;
begin
(*
  IMR - 14/10/2016 :
    Inser��o da vari�vel "aCan" para armazenar a situa��o da NF-e consultada na
    SEFA a fim de constatar o seu cancelamento antes da cria��o de um evento com
    esta finalidade.
*)
  sLOG := TStringList.Create;

  try

    LerConfiguracao(sCNPJEmitente);

    Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    if ( ACBrNFe.Configuracoes.WebServices.Ambiente = taHomologacao ) then
      if (not ShowConfirm('Cancelamento de NF-e em AMBIENTE DE HOMOLOGA��O n�o tem validade nenhuma para a SEFA.' + #13#13 +
        'Deseja continuar assim mesmo?', 'Cancelar NF-e')) then
      begin
        Result := False;
        Exit;
      end;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatarioFornecedor( iCodFornecedor );
    AbrirCompra( iAnoCompra, iNumCompra, sCNPJEmitente );
    AbrirNFeEmitidaEntrada( iAnoCompra, iNumCompra );

    FileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CANCEL + qryEntradaCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;

    ForceDirectories( ExtractFilePath(FileNameXML) );

    TMemoField(qryEntradaCalculoImposto.FieldByName('XML_NFE')).SaveToFile( FileNameXML );

    with ACBrNFe do
    begin
      Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaEntradaMODELO.AsInteger);
      Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaEntradaVERSAO.AsInteger);

      NotasFiscais.Clear;

      if not NotasFiscais.LoadFromString( qryEntradaCalculoImposto.FieldByName('XML_NFE').AsWideString ) then
        raise Exception.Create('N�o foi poss�vel carregar o XML da Nota Fiscal Eletr�nica correspondente!' + #13 + FileNameXML);

      // Numero do Lote de Envio
      //iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
      //iNumeroLote := StrToInt64(FormatDateTime('yymmddhhnn', GetDateTimeDB));
      iNumeroLote := StrToInt64(Copy(FormatDateTime('yymmddhhnnss', GetDateTimeDB), 5, 8)); // Dia, hora, minuto e segundo

      // Consultar situa��o da NF-e na Sefa

      if ACBrNFe.Consultar then
        aCan := ACBrNFe.NotasFiscais[0].Cancelada;

      // Criar o Evento de Cancelamento, caso a NF-e ainda n�o esteja cancelada

      if aCan then
        Result := True
      else
      begin

        EventoNFe.Evento.Clear;
        EventoNFe.idLote := iNumeroLote;

        //with EventoNFe.Evento.Add do
        with EventoNFe.Evento.New do
        begin
          //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
          //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

          infEvento.cOrgao   := qryEmitenteEST_COD.AsInteger; // C�digo IBGE do Estado
          infEvento.chNFe    := qryNFeEmitidaEntradaCHAVE.AsString;
          infEvento.CNPJ     := sCNPJEmitente;
          infEvento.dhEvento := GetDateTimeDB;
          infEvento.tpEvento := TpcnTpEvento.teCancelamento;
          infEvento.detEvento.xJust := Copy(Motivo, 1, 255);
          infEvento.detEvento.nProt := qryNFeEmitidaEntradaPROTOCOLO.AsString;
        end;

        // Enviar o evento de cancelamento
        if ACBrNFe.EnviarEvento(iNumeroLote) then
        begin
          with ACBrNFe.WebServices.EnvEvento do
          begin
            Result := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e

            if EventoRetorno.retEvento.Items[0].RetInfEvento.cStat <> 135 then
            begin
              raise Exception.CreateFmt(
                'Ocorreu o seguinte erro ao cancelar a Nota Fiscal Eletr�nica:'  + sLineBreak +
                'C�digo: %d' + sLineBreak +
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
            sLOG.Add('N�mero Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
            sLOG.Add('C�digo Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
            sLOG.Add('Motivo Status   : ' + EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
            sLOG.Add('-');
            sLOG.Add(EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
            sLOG.EndUpdate;

            // Gravar LOG

            with cdsLOG do
            begin

              Close;
              ParamByName('usuario').AsString     := gUsuarioLogado.Login;
              ParamByName('data_hora').AsDateTime := Now;
              Open;

              if IsEmpty then
              begin
                Append;

                cdsLOGUSUARIO.AsString       := gUsuarioLogado.Login;
                cdsLOGDATA_HORA.AsDateTime   := Now;
                cdsLOGEMPRESA.AsString       := sCNPJEmitente;
                cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
                cdsLOGDESCRICAO.AsString     := DESC_LOG_EVENTO_CANCELAR_NFE_ET;
                cdsLOGESPECIFICACAO.AsString := sLOG.Text;

                Post;
                ApplyUpdates;
                CommitTransaction;
              end;

            end;
          end;
        end
        else
        begin
          with ACBrNFe.WebServices.EnvEvento do
          begin
            raise Exception.Create(
              'Ocorreram erros ao tentar enviar o Evento de Cancelamento:' + sLineBreak +
              'Lote: '     + IntToStr(EventoRetorno.idLote)  + sLineBreak +
              'Ambiente: ' + TpAmbToStr(EventoRetorno.tpAmb) + sLineBreak +
              'Orgao: '    + IntToStr(EventoRetorno.cOrgao)  + sLineBreak + sLineBreak +
              'Status: '   + IntToStr(EventoRetorno.cStat)   + sLineBreak +
              'Motivo: '   + EventoRetorno.xMotivo
            );
          end;
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

        if (aDestinatario = EmptyStr) then
          aDestinatario := CONSUMIDOR_FINAL_CNPJ;

        Case Ide.modelo of
          MODELO_NFE  : aModelo := Ord(moNFe);
          MODELO_NFCE : aModelo := Ord(moNFCe);
        end;

        aDataHoraEmissao := Ide.dEmi;
        aTipoNota        := TTipoNF(Ord( Ide.tpNF ));

//        sVersao := NotasFiscais.Items[0].NFe.infNFe.VersaoStr;
//
//        if ( Trim(sVersao) = 'versao="2.00"' ) then
//          aVersao := Ord(ve200)
//        else
//        if ( Trim(sVersao) = 'versao="3.00"' ) then
//          aVersao := Ord(ve300)
//        else
//        if ( Trim(sVersao) = 'versao="3.10"' ) then
//          aVersao := Ord(ve310)
//        else
//        if ( Trim(sVersao) = 'versao="4.00"' ) then
//          aVersao := Ord(ve400);

        aVersao := Ord(ve400);
      end;

      NotaValida := True;

      if NotaValida then
      begin
        aChave     := StringReplace(AnsiUpperCase(NotasFiscais.Items[0].NFe.infNFe.ID), 'NFE', '', [rfReplaceAll]);
        aProtocolo := NotasFiscais.Items[0].NFe.procNFe.nProt;
        aRecibo    := aProtocolo;
        aValorNF   := NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;

        aNomeArquivoXML := aChave + '-nfe_import.xml';
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

  sDataVenc := FormatDateTime('dd/mm/yyyy', ACBrNFe.SSL.CertDataVenc);
  iPrazo    := DaysBetween(now, ACBrNFe.SSL.CertDataVenc);

  Result := (iPrazo >= 0);

  if ( iPrazo = 0 ) then
    sMsg := 'A Data de Vencimento do Certificado expira hoje!' + #13#13 + 'Favor providenciar um novo certificado.'
  else
  if ( iPrazo > 0 ) then
    sMsg := 'Data de Vencimento do Certificado: ' + sDataVenc + #13#13 + 'Prazo de expira��o : ' + FormatFloat(',0', iPrazo) + ' dia(s).'
  else
  if ( iPrazo < 0 ) then
    sMsg := 'Data de Vencimento do Certificado: ' + sDataVenc + #13#13 + 'Prazo expirado � ' + FormatFloat(',0', iPrazo) + ' dia(s)!';

  if Informe or (iPrazo <= 30) then
    ShowWarning('A T E N � � O :' + #13#13 + '-----------------------------------------' + #13#13 + sMsg);
end;

function TDMNFe.InutilizaNumeroNFeACBr(const sCNPJEmitente: String; iAno,
  iModelo, iSerie, iNumeroInicial, iNumeroFinal: Integer;
  const sJustificativa: String; var sRetorno, sFileXML : String): Boolean;
var
  aFileXML : TStringList;
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
        'Vers�o App.: ' + WebServices.Inutilizacao.verAplic        + #13 +
        'Status Trn.: ' + IntToStr(WebServices.Inutilizacao.cStat) + #13 +
        '---'     + #13 +
        'Emitente:    ' + WebServices.Inutilizacao.CNPJ + #13 +
        'Modelo NF-e: ' + IntToStr( WebServices.Inutilizacao.Modelo ) + #13 +
        'S�rie NF-e:  ' + IntToStr( WebServices.Inutilizacao.Serie )  + #13 +
        'No. Inicial: ' + IntToStr( WebServices.Inutilizacao.NumeroInicial ) + #13 +
        'No. Final:   ' + IntToStr( WebServices.Inutilizacao.NumeroFinal )   + #13 +
        'Motivo:      ' + WebServices.Inutilizacao.xMotivo         + #13 +
        'Justif.:     ' + WebServices.Inutilizacao.Justificativa   + #13 +
        '---'     + #13 +
        'Data Recibo: ' + FormatDateTime('dd/mm/yyyy', WebServices.Inutilizacao.dhRecbto) + #13 +
        'Protocolo:   ' + WebServices.Inutilizacao.Protocolo;

      sFileXML := WebServices.Inutilizacao.NomeArquivo;

      aFileXML := TStringList.Create;
      aFileXML.Text := WebServices.Inutilizacao.RetornoWS;
      aFileXML.SaveToFile(sFileXML);
      aFileXML.Free;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar inutilizar numera��o de notas.' + #13#13 + 'InutilizaNumeroNFeACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.GuardarLoteNFeVenda(const sCNPJEmitente: String;
  const Ano, Numero, NumeroLote: Integer; const Recibo : String);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBVENDAS Set');
      SQL.Add('    LOTE_NFE_ANO    = ' + IfThen(NumeroLote = 0, 'NULL', qryEmitenteLOTE_ANO_NFE.AsString));
      SQL.Add('  , LOTE_NFE_NUMERO = ' + IfThen(NumeroLote = 0, 'NULL', FormatFloat('#########', NumeroLote)));
      SQL.Add('  , LOTE_NFE_RECIBO = ' + IfThen(Recibo = EmptyStr, 'NULL', QuotedStr(Trim(Recibo))));
      SQL.Add('Where CODEMP     = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('  and ANO        = ' + FormatFloat('#########', Ano));
      SQL.Add('  and CODCONTROL = ' + FormatFloat('#########', Numero));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('GuardarLoteNFeVenda > ' + E.Message);
  end;
end;

procedure TDMNFe.GuardarCodigoNFeVenda(const sCNPJEmitente: String;
  const Ano, Numero, CodigoNF : Integer);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBVENDAS Set');
      SQL.Add('  LOTE_NFE_CODIGO = ' + IfThen(CodigoNF = 0, 'NULL', FormatFloat('#########', CodigoNF)));
      SQL.Add('Where CODEMP      = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('  and ANO         = ' + FormatFloat('#########', Ano));
      SQL.Add('  and CODCONTROL  = ' + FormatFloat('#########', Numero));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('GuardarCodigoNFeVenda() > ' + E.Message);
  end;
end;

procedure TDMNFe.GuardarLoteNFeEntrada(const sCNPJEmitente: String;
  const Ano, Numero, NumeroLote: Integer; const Recibo : String);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBCOMPRAS Set');
      SQL.Add('    LOTE_NFE_ANO    = ' + IfThen(NumeroLote = 0, 'NULL', qryEmitenteLOTE_ANO_NFE.AsString));
      SQL.Add('  , LOTE_NFE_NUMERO = ' + IfThen(NumeroLote = 0, 'NULL', FormatFloat('#########', NumeroLote)));
      SQL.Add('  , LOTE_NFE_RECIBO = ' + IfThen(Recibo = EmptyStr, 'NULL', QuotedStr(Trim(Recibo))));
      SQL.Add('Where CODEMP     = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('  and ANO        = ' + FormatFloat('#########', Ano));
      SQL.Add('  and CODCONTROL = ' + FormatFloat('#########', Numero));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('GuardarLoteNFeEntrada > ' + E.Message);
  end;
end;

procedure TDMNFe.GuardarCodigoNFeEntrada(const sCNPJEmitente : String; const Ano, Numero, CodigoNF : Integer);
begin
  try
    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add('Update TBCOMPRAS Set');
      SQL.Add('  LOTE_NFE_CODIGO = ' + IfThen(CodigoNF = 0, 'NULL', FormatFloat('#########', CodigoNF)));
      SQL.Add('Where CODEMP      = ' + QuotedStr(sCNPJEmitente));
      SQL.Add('  and ANO         = ' + FormatFloat('#########', Ano));
      SQL.Add('  and CODCONTROL  = ' + FormatFloat('#########', Numero));

      ExecSQL;
      CommitTransaction;
    end;
  except
    On E : Exception do
      raise Exception.Create('GuardarCodigoNFeEntrada() > ' + E.Message);
  end;
end;

function TDMNFe.ConsultarNumeroLoteNFeACBr(const sCNPJEmitente: String;
  sNumeroRecibo: String; var sChaveNFe, sProtocolo, sRetorno: String; var dDHEnvio : TDateTime;
  var Denegada : Boolean; var DenegadaMotivo : String): Boolean;
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
          bReturn := (WebServices.Recibo.NFeRetorno.ProtDFe.Count = 1);

        // Verificar se o retorno foi de NF-e autorizada
        if bReturn then
          bReturn := (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = PROCESSO_NFE_AUTORIZADA)
            or (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_NOTA_DENEGADA)
            or (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_EMIT)
            or (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_DEST);

        if bReturn then
        begin
          sChaveNFe  := WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].chDFe;
          sProtocolo := WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].nProt;
          dDHEnvio   := WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].dhRecbto;

          Denegada :=
               (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_NOTA_DENEGADA)
            or (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_EMIT)
            or (WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_IRREG_FISCO_DEST);

          if Denegada then
            DenegadaMotivo := WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].xMotivo
          else
            DenegadaMotivo := EmptyStr;
        end;

        if ( WebServices.Recibo.NFeRetorno.ProtDFe.Count = 1 ) then
        begin
          sTextoRetorno.Add( 'Ambiente    : ' + IntToStr( Ord(WebServices.Recibo.NFeRetorno.tpAmb) ) );
          sTextoRetorno.Add( 'Vers�o App. : ' + WebServices.Recibo.NFeRetorno.verAplic );
          sTextoRetorno.Add( 'Status Trn. : ' + IntToStr(WebServices.Recibo.NFeRetorno.cStat) + ' - ' + WebServices.Recibo.NFeRetorno.xMotivo );
          sTextoRetorno.Add( '---' );
          sTextoRetorno.Add( 'Emitente    : ' + sCNPJEmitente );
          sTextoRetorno.Add( 'Chave NF-e  : ' + WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].chDFe );
          sTextoRetorno.Add( 'Status      : ' + IntToStr(WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat) );
          sTextoRetorno.Add( 'Motivo      : ' + WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].xMotivo );
          sTextoRetorno.Add( 'Mensagem    : ' + WebServices.Recibo.NFeRetorno.xMsg );
          sTextoRetorno.Add( '---' );
          sTextoRetorno.Add( 'Nro. Recibo : ' + WebServices.Recibo.NFeRetorno.nRec );
          sTextoRetorno.Add( 'Data Recibo : ' + FormatDateTime('dd/mm/yyyy', WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].dhRecbto) );
          sTextoRetorno.Add( 'Protocolo   : ' + WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].nProt );

          sRetorno := sTextoRetorno.Text;
        end;
      end;

    except
      On E : Exception do
      begin
        ShowError('Erro ao tentar consultar n�mero de lote/recibo de envio de NF-e.' + #13#13 + 'ConsultarNumeroLoteNFeACBr() --> ' + e.Message);
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
  aRetorno : Boolean;
const
  TERMINATE_FILENAME     = '-nfe.xml';
  TERMINATE_FILENAME_NEW = '-procNfe.xml';
begin
  aRetorno := False;
  try
    try

      LerConfiguracao(sCNPJEmitente);

      with ACBrNFe do
      begin

        if FileExists(FileNameXML) then
        begin

          // Consultar pelo Arquivo NF-e

          NotasFiscais.Clear;
          NotasFiscais.LoadFromFile(FileNameXML);
          aRetorno := ACBrNFe.Consultar;

          if (NotasFiscais.Count = 1) then
          begin
            iSerieNFe   := NotasFiscais.Items[0].NFe.Ide.Serie;
            iNumeroNFe  := NotasFiscais.Items[0].NFe.Ide.nNF;
            iTipoNFe    := Ord(NotasFiscais.Items[0].NFe.Ide.tpNF);
            DataEmissao := NotasFiscais.Items[0].NFe.Ide.dEmi;
          end;

          // (INICIO) Adicionando TAG de Protocolo no Arquivo
          if aRetorno then
          begin
            NomeArq := FileNameXML;

            if ( Pos(AnsiLowerCase(TERMINATE_FILENAME), AnsiLowerCase(NomeArq)) > 0 ) then
               NomeArq := StringReplace(NomeArq, TERMINATE_FILENAME, TERMINATE_FILENAME_NEW, [rfIgnoreCase]);

            NotasFiscais.Items[0].GravarXML(ExtractFileName(NomeArq), ExtractFilePath(NomeArq));

            FileNameXML := NomeArq;
          end;
          // (FINAL) Adicionando TAG de Protocolo no Arquivo

        end
        else
        begin

          // Consultar pela Chave NF-e

          WebServices.Consulta.NFeChave := sChave;
          aRetorno := WebServices.Consulta.Executar;

        end;

        if aRetorno then
        begin
          ChaveNFE     := WebServices.Consulta.NFeChave;
          ProtocoloNFE := WebServices.Consulta.Protocolo;

          // Recuperar o n�mero da nota a partir da chave
          // 12345678901234567890 12 345 678901234 5678901234
          // 15210839819259000102 55 001 000000010 1986530067
          if (iNumeroNFe = 0) and (not ChaveNFE.Trim.IsEmpty) then
          begin
            //iModeloNFe := Copy(ChaveNFE, 21, 2).ToInteger;
            iSerieNFe  := Copy(ChaveNFE, 23, 3).ToInteger;
            iNumeroNFe := Copy(ChaveNFE, 26, 9).ToInteger;
          end;

          // Atualizar contador do n�mero da NF-e
          iNumeroTmp := GetNumeroNFe(sCNPJEmitente, iSerieNFe, MODELO_NFE);

          if (iNumeroNFe = iNumeroTmp) then
          begin
            UpdateNumeroNFe(sCNPJEmitente, iSerieNFe, iNumeroNFe);
            UpdateLoteNFe(sCNPJEmitente, YearOf(DataEmissao), iNumeroNFe);
          end;
        end;

      end;

    except
      On E : Exception do
      begin
        aRetorno := False;
        ShowError('Erro ao tentar consultar NF-e pela chave.' + #13#13 + 'ConsultarChaveNFeACBr() --> ' + e.Message);
      end;
    end;
  finally
    Result := aRetorno;
  end;
end;

function TDMNFe.DownloadNFeACBr(const sCNPJEmitente, sCNPJDestinatario, sChaveNFe: String;
  var FileNameXML: String): Boolean;
var
  aUF  : Integer;
  aXML : TStringList;
begin
(*
  IMR - 30/09/2020 :
    Inser��o do bloco IF..THEN (137) para tratar a falta de sincroniza do ambiente nacional
    com a SEFA do estado quanto a confirma��o do manifesto.

  IMR - 10/08/2017 :
    Altera��o na forma de execu��o do download das NFs, a partir da nova fun��o
    "DistribuicaoDFePorChaveNFe()".
*)
  aXML := TStringList.Create;
  aXML.Clear;
  try
    try
      LerConfiguracao(sCNPJEmitente);

      with ACBrNFe do
      begin
        aUF := StrToInt(Copy(sChaveNFe, 1, 2)); // C�digo UF do autor da NF-e
        if DistribuicaoDFePorChaveNFe(aUF, sCNPJDestinatario, sChaveNFe) then
        begin
          FileNameXML := Configuracoes.Arquivos.PathSalvar + '\Down\'  + sChaveNFe + '-nfe.xml';
          FileNameXML := StringReplace(FileNameXML, '\\', '\', [rfReplaceAll]);
          ForceDirectories( ExtractFilePath(FileNameXML) );

          if (WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count > 0) then
          begin
            aXML.Text := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[0].XML;
            aXML.SaveToFile(FileNameXML);
          end
          else
          if (WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137) then // 137 - Nenhum documento localizado
          begin
            ShowWarning('Arquivo XML n�o dispon�vel para download.' + #13 +
              WebServices.DistribuicaoDFe.retDistDFeInt.cStat.ToString + ' - ' + WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo + #13#13 +
              'Motivo: Ambiente nacional ainda n�o sincronizou o evento de manifesto com a SEFA.');
            Result := False;

            Exit;
          end
          else
            raise Exception.Create('Arquivo XML n�o dispon�vel para download.' + #13 +
              WebServices.DistribuicaoDFe.retDistDFeInt.cStat.ToString + ' - ' + WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);
        end
        else
          raise Exception.Create(WebServices.DistribuicaoDFe.RetornoWS);

        if not FileExists(FileNameXML) then
          raise Exception.Create(Format('Arquivo %s n�o encontrado.', [QuotedStr(FileNameXML)]))
        else
          Result := True;
      end;

    except
      On E : Exception do
      begin
        ShowWarning('Erro ao tentar executar download da NF-e.' + #13 + 'Tente novamente mais tarde.' + #13#13 + 'DownloadNFeACBr() --> ' + E.Message);
        Result := False;
      end;
    end;
  finally
    aXML.Free;
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
    Value := Application.Title + ' - vers�o ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := gUsuarioLogado.Login;
end;

procedure TDMNFe.frrNotaEntregaXGetValue(const VarName: string;
  var Value: Variant);
begin
  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - vers�o ' + ver.FileVersion;

  if ( VarName = VAR_USER ) then
    Value := gUsuarioLogado.Login;

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
  MSG_REF = 'Referente a Cota��o No. %s';
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
          raise Exception.Create(Format('Arquivo %s n�o encontrado.', [QuotedStr(sArquivo)]));

      with ACBrNFe do
      begin
        NotasFiscais.Clear;
        NotasFiscais.Add;

        // Montar identifica��o do documento para t�tulo de e-mail

        sMensagem  := Format(MSG_REF, [sNumeroDocumento]);
        sDocumento := 'Cota��o No. ' + sNumeroDocumento;

        CarregarConfiguracoesEmpresa(sCNPJEmitente, sEmailAssunto, sAssinaturaHtml, sAssinaturaTxt);

        sEmailEmpresa := GetEmailEmpresa( sCNPJEmitente );
        sEmailAssunto := GetNomeFantasiaEmpresa( sCNPJEmitente ) + ' - ' + sDocumento;

        sCC.Add( sEmailEmpresa );

        sMSG.Add( sMensagem );
        sMSG.Add('');
        sMSG.Add( sAssinaturaTxt );
        sMSG.Add('--');
        sMSG.Add('FAVOR N�O RESPONDER ESTE E-MAIL.');
        sMSG.Add('Composi��o autom�tica de e-mail executada pelo sistema ' + gPersonalizaEmpresa.ProductName + ' (Vers�o ' + TVersaoController.GetInstance().Version +
          '), desenvolvido pela empresa ' + gPersonalizaEmpresa.CompanyName + '.' + #13#13 + TVersaoController.GetInstance().Copyright);

        if FileExists( sArquivo ) then
          sANX.Add( sArquivo );

        ConfigurarEmail(sCNPJEmitente, sEmailDestinatario, sEmailAssunto, sMSG.Text);

//        NotasFiscais.Items[0].EnviarEmail(
//            gContaEmail.Servidor_SMTP
//          , IntToStr(gContaEmail.Porta_SMTP)
//          , gContaEmail.Conta
//          , gContaEmail.Senha
//          , gContaEmail.Conta
//          , sEmailDestinatario
//          , sEmailAssunto
//          , sMSG
//          , gContaEmail.ConexaoSeguraSSL // SSL - Conex�o Segura
//          , False                        // Enviar PDF junto
//          , sCC                          // Lista com emails que ser�o enviado c�pias - TStrings
//          , sANX                         // Lista de anexos - TStrings
//          , False                        // Pede confirma��o de leitura do email
//          , False                        // Aguarda Envio do Email(n�o usa thread)
//          , GetNomeFantasiaEmpresa( sCNPJEmitente ) // Nome do Rementente
//          , gContaEmail.ConexaoSeguraSSL );         // Auto TLS
        NotasFiscais.Items[0].EnviarEmail(
            sEmailDestinatario
          , sEmailAssunto
          , sMSG
          , False                        // Enviar PDF junto
          , sCC                          // Lista com emails que ser�o enviado c�pias - TStrings
          , sANX);                       // Lista de anexos - TStrings

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

function TDMNFe.ExecutarManifestoDestinatarioNFe(const sCNPJ, sChave: String;
  var aLog: String): Boolean;
var
  sLOG : TStringList;
  sErrorMsg   ,
  sDescricao  : String;
  bRetorno    : Boolean;
  //iNumeroLote : Integer;
  iNumeroLote : Int64;
begin
  sLOG := TStringList.Create;
  bRetorno   := False;
  sDescricao := 'Execu��o de Manifesto Dest. NF-e';
  try
    try
      LerConfiguracao(sCNPJ, TTipoDANFE.tipoDANFEFast);

      with ACBrNFe do
      begin

        bRetorno := True;// ACBrNFe.WebServices.StatusServico.Executar;

        if not bRetorno then
          Exit;

        NotasFiscais.Clear;

        // Numero do Lote de Envio
        //iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
        //iNumeroLote := StrToInt64(FormatDateTime('yymmddhhnn', GetDateTimeDB));
        iNumeroLote := StrToInt64(Copy(FormatDateTime('yymmddhhnnss', GetDateTimeDB), 5, 8)); // Dia, hora, minuto e segundo

        EventoNFe.Evento.Clear;
        EventoNFe.idLote := iNumeroLote;

        //with EventoNFe.Evento.Add do
        with EventoNFe.Evento.New do
        begin
          //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
          //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

          infEvento.cOrgao   := qryEmitenteEST_COD.AsInteger; // C�digo IBGE do Estado
          infEvento.CNPJ     := sCNPJ;
          infEvento.chNFe    := sChave;
          infEvento.dhEvento := Now; //GetDateTimeDB;
          infEvento.tpEvento := TpcnTpEvento.teManifDestConfirmacao;

          // "POG" - Manobra para enviar o evento de manifesto da nota e evitar a rejei��o 657.
          if (infEvento.cOrgao = 15) then
            infEvento.cOrgao := 91;
        end;

        // Enviar o evento de Manifesto
        if EnviarEvento(iNumeroLote) then
        begin

          sDescricao := 'MANIFESTO_DEST_' + sCNPJ + sChave;
          with WebServices.EnvEvento do
          begin
//
//            // "POG" - Manobra para enviar o evento de manifesto da nota.
//            if (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 657) then
//            begin
//              iNumeroLote := iNumeroLote - 1;
//              EventoNFe.Evento.Items[0].InfEvento.cOrgao := EventoRetorno.cOrgao;
//              EnviarEvento(iNumeroLote)
//            end;

            bRetorno := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135); // Evento registrado e vinculado a NF-e

            if not bRetorno then
              bRetorno := (EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 573); // Evento j� est� registrado e vinculado a NF-e

            // Montar LOG de Retorno

            sLOG.BeginUpdate;
            sLOG.Clear;
            sLOG.Add('Ambiente    : ' + IntToStr( Ord(Configuracoes.WebServices.Ambiente) ));
            sLOG.Add('-');
            sLOG.Add('Evento      : ' + AnsiUpperCase(DESC_LOG_EVENTO_MANIFESTO_DST_NFE));
            sLOG.Add('Destinat�rio: ' + sCNPJ);
            sLOG.Add('Chave NF-e  : ' + sChave);
            sLOG.Add('-');
            sLOG.Add('Data/Hora Evento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));
            sLOG.Add('N�mero Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
            sLOG.Add('C�digo Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
            sLOG.Add('Motivo Status   : ' + EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
            sLOG.Add('-');
            sLOG.Add(EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
            sLOG.EndUpdate;

            if not bRetorno then
            begin
              raise Exception.CreateFmt(
                'Ocorreu o seguinte erro ao enviar o Evento de Manifesto de Confirma��o da Nota Fiscal Eletr�nica:'  + sLineBreak +
                'C�digo: %d' + sLineBreak +
                'Motivo: %s', [
                  EventoRetorno.retEvento.Items[0].RetInfEvento.cStat,
                  EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo
              ]);
            end;

          end;

        end;

      end;
    except
      On E : Exception do
      begin
        bRetorno := False;

        sErrorMsg  := E.Message;

        if (Trim(sLOG.Text) = EmptyStr) then
          sLOG.Text  := sErrorMsg;

        sDescricao := 'Tentativa de Execu��o de Manifesto Dest. NF-e';
        ShowError('Erro ao tentar gerar/enviar Manifesto NF-e.' + #13#13 + 'ExecutarManifestoDestinatarioNFe() --> ' + sErrorMsg);
      end;
    end;
  finally
    // Gravar LOG

    with cdsLOG do
    begin
      Close;
      ParamByName('usuario').AsString     := gUsuarioLogado.Login;
      ParamByName('data_hora').AsDateTime := Now;
      Open;

      if IsEmpty then
      begin
        Append;

        cdsLOGUSUARIO.AsString       := gUsuarioLogado.Login;
        cdsLOGDATA_HORA.AsDateTime   := Now;
        cdsLOGEMPRESA.AsString       := sCNPJ;
        cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
        cdsLOGDESCRICAO.AsString     := sDescricao;
        cdsLOGESPECIFICACAO.AsString := sLOG.Text;

        Post;
        ApplyUpdates;
        CommitTransaction;
      end;
    end;

    sLOG.Free;
    Result := bRetorno;
  end;
end;

{$IF NOT (DEFINED(PRINTER_CUPOM) OR DEFINED(PDV))}
function TDMNFe.ExisteNFeParaBaixar(const sCNPJ : String; aNSU : Int64; var aFileName, aMensagem : String;
  var aDocumentos : TDictionary<String, TDistribuicaoDFeDocumentoRetornado>) : Boolean;
var
  aRetorno   : Boolean;
  aErrorMsg  ,
  aDescricao : String;
  aFileXML   : TStringList;
  I : Integer;
  aDocumento : TDistribuicaoDFeDocumentoRetornado;
begin
  aRetorno   := False;
  aDescricao := 'DISTRIBUICAO_DEF_' + sCNPJ + FormatFloat('000000000000000', aNSU);
  aFileXML   := TStringList.Create;

  if not GetConectedInternet then
  begin
    aMensagem := 'Esta��o sem conex�o com a internet!';
    Result    := False;
    Exit;
  end;

  try
    try
      LerConfiguracao(sCNPJ, TTipoDANFE.tipoDANFEFast);
      AbrirEmitente(sCNPJ);

      with ACBrNFe do
      begin
        NotasFiscais.Clear;

        aRetorno  := DistribuicaoDFePorUltNSU(qryEmitenteEST_COD.AsInteger, sCNPJ, FormatFloat('000000000000000', aNSU));
        aFileName := TPath.Combine(Configuracoes.Arquivos.PathSalvar, FormatDateTime('yyyymmddhhmmss', Now) + '-dist-dfe.xml');

        if aRetorno then
        begin
          if not FileExists(aFileName) then
          begin
            aFileXML.Text := WebServices.DistribuicaoDFe.RetornoWS;
            aFileXML.SaveToFile(aFileName);
          end
          else
            aFileXML.LoadFromFile(aFileName);

          aRetorno  := (WebServices.DistribuicaoDFe.retDistDFeInt.cStat = PROCESSO_NSU_ENCONTRADO); // Documento(s) localizado(s)
          aMensagem := WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo;

          if aRetorno then
          begin
//            aNSU := WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU.ToInt64;
//
            for I := 0 to (WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1) do
            begin
              aDocumento := TDistribuicaoDFeDocumentoRetornado.Create;

              aDocumento.Chave     := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.chdFe;
              aDocumento.Serie     := Copy(aDocumento.Chave, 23, 3);
              aDocumento.Numero    := Copy(aDocumento.Chave, 26, 9);
              aDocumento.NSU       := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].NSU;
              aDocumento.Protocolo := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.nProt;
              aDocumento.CNPJ      := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.CNPJCPF;
              aDocumento.Nome      := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.xNome;
              aDocumento.IEst      := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.IE;
              aDocumento.Emissao   := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.dhEmi;
              aDocumento.Valor     := WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.vNF;

              if ( StrToIntDef(Copy(aDocumento.Chave, 1, 2).Trim, 0) > 0) then
                aDocumento.UF := CUFtoUF( Copy(aDocumento.Chave, 1, 2).ToInteger );

              case WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.tpNF of
                TpcnTipoNFe.tnEntrada : aDocumento.TipoNFe := TTipoNFe.tnNFeEntrada;
                TpcnTipoNFe.tnSaida   : aDocumento.TipoNFe := TTipoNFe.tnNFeSaida;
              end;

              case WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resdFe.cSitdFe of
                TSituacaoDFe.snAutorizado : aDocumento.Situacao := TSituacaoDocumentoDFe.snDFeAutorizado;
                TSituacaoDFe.snDenegado   : aDocumento.Situacao := TSituacaoDocumentoDFe.snDFeDenegado;
                TSituacaoDFe.snCancelado  : aDocumento.Situacao := TSituacaoDocumentoDFe.snDFeCancelado;
              end;

              if not aDocumentos.ContainsKey(aDocumento.Chave) then
                aDocumentos.Add(aDocumento.Chave, aDocumento);
            end;

            aDocumentos.TrimExcess;
          end;
        end;
      end;

    except
      On E : Exception do
      begin
        aErrorMsg  := E.Message;
        aDescricao := 'Tentativa de Execu��o do processo de Distribui��o DF-e';

        ShowError('Erro ao tentar buscar notas emitidas para ' + StrFormatarCnpj(sCNPJ) + '.' + #13#13 + 'ExisteNFeParaBaixar() --> ' + aErrorMsg);
      end;
    end;
  finally
    // Gravar LOG

    with cdsLOG do
    begin
      Close;
      ParamByName('usuario').AsString     := gUsuarioLogado.Login;
      ParamByName('data_hora').AsDateTime := StrToDateTimeDef(FormatDateTime('dd/mm/yyyy hh:mm', Now) + ':00', Now);
      Open;

      if IsEmpty then
      begin
        Append;

        cdsLOGUSUARIO.AsString       := gUsuarioLogado.Login;
        cdsLOGDATA_HORA.AsDateTime   := Now;
        cdsLOGEMPRESA.AsString       := sCNPJ;
        cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
        cdsLOGDESCRICAO.AsString     := aDescricao;
        cdsLOGESPECIFICACAO.AsString := aFileXML.Text;

        Post;
        ApplyUpdates;
        CommitTransaction;
      end;
    end;

    aFileXML.Free;

    Result := aRetorno;
  end;
end;

function TDMNFe.GetUltimoNSU(const sCNPJ : String; var NSU : String; const ExibirErro : Boolean = True) : Boolean;
var
  aTemp : String;
begin
  Result := False;
  aTemp  := EmptyStr;
  try
    if not GetConectedInternet then
      raise Exception.Create('Esta��o sem conex�o com a internet!');

    LerConfiguracao(sCNPJ, TTipoDANFE.tipoDANFEFast);
    AbrirEmitente(sCNPJ);

    if ACBrNFe.DistribuicaoDFePorUltNSU(qryEmitenteEST_COD.AsInteger, sCNPJ, FormatFloat('000000000000000', NSU.ToInt64)) then
      Result := (ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = PROCESSO_NSU_ENCONTRADO);

    if Result then
    begin
      aTemp := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
      NSU   := aTemp;
    end;
  except
    On E : Exception do
    begin
      if ExibirErro then
        ShowError('Erro ao tentar buscar o �ltimo NSU para ' + StrFormatarCnpj(sCNPJ) + '.' + #13#13 + 'GelUltimoNSU() --> ' + E.Message);

      Result := False;
    end;
  end;
end;

function TDMNFe.GetMaximoNSU(const sCNPJ : String; var NSU : String) : Boolean;
begin
  Result := False;
  try
    try
      if not GetConectedInternet then
        raise Exception.Create('Esta��o sem conex�o com a internet!');

      LerConfiguracao(sCNPJ, TTipoDANFE.tipoDANFEFast);
      AbrirEmitente(sCNPJ);

      if ACBrNFe.DistribuicaoDFePorUltNSU(qryEmitenteEST_COD.AsInteger, sCNPJ, '000000000000000') then
        Result := (ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = PROCESSO_NSU_ENCONTRADO);

      if Result then
        NSU := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU
      else
        NSU := '0';
    except
      On E : Exception do
        ShowError('Erro ao tentar buscar o NSU m�ximo para ' + StrFormatarCnpj(sCNPJ) + '.' + #13#13 + 'GelUltimoNSU() --> ' + E.Message);
    end;
  finally
    Result := not NSU.Trim.IsEmpty;
  end;
end;
{$ENDIF}

function TDMNFe.ImprimirCupomNaoFiscal(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer;
  const BlocoImpressaoCupom : TBlocoImpressaoCupom = bicCupomRelatorioGerencial): Boolean;
begin
  Result := ImprimirCupomNaoFiscal_PORTA(sCNPJEmitente
    , iCodigoCliente
    , sDataHoraSaida
    , iAnoVenda
    , iNumVenda
    , BlocoImpressaoCupom);
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

function TDMNFe.GetNumeroSerieCertificado(const sCNPJEmitente: String): String;
begin
  if Trim(sCNPJEmitente) = EmptyStr then
    LerConfiguracao(gUsuarioLogado.Empresa)
  else
    LerConfiguracao(sCNPJEmitente);

  if Assigned(ACBrNFe.SSL) then
    Result := ACBrNFe.SSL.NumeroSerie
  else
    Result := EmptyStr;
end;

function TDMNFe.GetNumeroNSUPesquisado(const aEmpresa : String) : String;
var
  aKey   ,
  aValue : String;
const
  VALUE_NULL = '000000000000000';
begin
  aKey   := 'nsu_pesquisado_' + OnlyNumber(aEmpresa.Trim);
  aValue := VALUE_NULL;
  try
    with DMBusiness, fdQryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('    c.vl_config as nsu_pesquisado');
      SQL.Add('from SYS_CONFIG c');
      SQL.Add('where (c.ky_config = ' + aKey.Trim.ToUpper.QuotedString + ')');
      Open;

      aValue := FieldByName('nsu_pesquisado').AsString;

      if aValue.Trim.IsEmpty then
        aValue := VALUE_NULL;

      Close;
    end;
  finally
    Result := aValue;
  end;
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

function TDMNFe.GetCnpjCertificado : String;
begin
  try
    if Assigned(ACBrNFe.SSL) then
      Result := OnlyNumber(ACBrNFe.SSL.CertCNPJ)
    else
      Result := EmptyStr;
  except
    Result := EmptyStr;
  end;
end;

function TDMNFe.GetDiretorioLoteXml: String;
var
  aRetorno : String;
begin
  with ACBrNFe.Configuracoes do
  begin
    aRetorno := Arquivos.PathSalvar  + '\';
    aRetorno := StringReplace(aRetorno, '\\', '\', [rfReplaceAll]);
  end;
  Result := Trim(aRetorno);
end;

function TDMNFe.GetDiretorioXmlNFe: String;
var
  aRetorno : String;
begin
  with ACBrNFe.Configuracoes do
  begin
    aRetorno := Arquivos.PathSalvar  + '\NFe\';
    aRetorno := StringReplace(aRetorno, '\\', '\', [rfReplaceAll]);
  end;
  Result := Trim(aRetorno);
end;

function TDMNFe.ValidarCnpjDocumento(const pCnpjDocumento : String) : Boolean;
var
  aRetorno : Boolean;
  sCnpj : String;
begin
  aRetorno := False;
  try
    try
      sCnpj := OnlyNumber(pCnpjDocumento);
      if Assigned(ACBrNFe.SSL) then
      begin
        ACBrNFe.SSL.ValidarCNPJCertificado(sCnpj);
        aRetorno := True;
      end;
    except
      On E : Exception do
        ShowError('Erro ao tentar validar o Cnpj do documento.' + #13#13 + E.Message);
    end;
  finally
    Result := aRetorno;
  end;
end;

function TDMNFe.EmissaoNFE_Pendente(const pEmpresa : String; const pAlertar : Boolean = TRUE) : Boolean;
var
  aRetorno : Boolean;
begin
  // Impedir que outra NF-e seja gerada enquanto houver um pedido de emiss�o anterior pendente
  aRetorno := False;
  try
    with fdQryEmissaoNFePendente do
    begin
      Close;
      ParamByName('empresa').AsString := Trim(pEmpresa);
      Open;

      aRetorno := (RecordCount > 0);
      if aRetorno and pAlertar then
        ShowWarning('Emiss�o pendente de NF-e:'  + #13#13 +
          FieldByName('tipo').AsString   + ' : ' +
          FieldByName('ano').AsString    + '/'   +
          FieldByName('numero').AsString + #13   +
          'Recibo : ' + FieldByName('recibo').AsString + #13#13 +
          'Uma nova emiss�o somente ser� poss�vel com a resolu��o desta pend�ncia.');
    end;
  finally
    Result := aRetorno;
  end;
end;

function TDMNFe.IsNFeManifestoDestinatarioRegistrado(const sCNPJ,
  sChave: String): Boolean;
var
  sID : String;
  bRetorno : Boolean;
begin
  bRetorno := False;
  try
    with DMBusiness, fdQryBusca do
    begin
      sID := 'MANIFESTO_DEST_' + sCNPJ + sChave;

      Close;
      SQL.Clear;
      SQL.Add('Select l.descricao');
      SQL.Add('from TBLOG_TRANSACAO l');
      SQL.Add('where l.tipo      = 1');  // Transa��o SEFA
      SQL.Add('  and l.empresa   = ' + QuotedStr(sCNPJ));
      SQL.Add('  and l.descricao = ' + QuotedStr(sID));
      Open;

      bRetorno := not IsEmpty;

      Close;
    end;
  finally
    Result := bRetorno;
  end;
end;

function TDMNFe.ImprimirCupomOrcamento(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer): Boolean;
var
  aEcfTipo   : TEcfTipo;
  aEcfConfig : TEcfConfiguracao;
  aEcf : TEcfFactory;
const
  PESO_LINHA = 2;
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
  aEcfConfig.NumeroLinhas   := (qryDadosProduto.RecordCount * PESO_LINHA) +  IfThen(iCodigoCliente = CONSUMIDOR_FINAL_CODIGO, 30, 37);

  aEcfConfig.FonteImpressao.Nome    := GetCupomNaoFiscalFonteNome;
  aEcfConfig.FonteImpressao.Tamanho := GetCupomNaoFiscalFonteTamanho;

  aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
  try

    with aEcf do
    begin
      {$IFNDEF PRINTER_CUPOM}
      Ecf.SoftHouse := gPersonalizaEmpresa.CompanyName;
      Ecf.Sistema   := gPersonalizaEmpresa.ProductName;
      {$ELSE}
      Ecf.SoftHouse := AGIL_SOFTWARES_FANTASIA;
      Ecf.Sistema   := 'PDV | Controle do Ponto de Venda do SGE/SGI';
      {$ENDIF}
      Ecf.Versao    := TVersaoController.GetInstance().ProductVersion;

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

      if (qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) <> 0 then
      begin
        Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), True );
        Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
      end;

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
  iNumeroLote   : Int64;
  //iNumeroLote   ,
  iNumeroCarta  ,
  iNumeroEvento : Integer;
  sLOG : TStringList;
begin
  sLOG := TStringList.Create;

  try
    try

      LerConfiguracao(sCNPJEmitente, tipoDANFEFast);

      AbrirEmitente(sCNPJEmitente);
      AbrirCartaCorrecao(sCNPJEmitente, ControleCCe);
      AbrirNFe(sCNPJEmitente,
        qryCartaCorrecaoNFeNFE_MODELO.AsInteger,
        qryCartaCorrecaoNFeNFE_SERIE.AsString,
        qryCartaCorrecaoNFeNFE_NUMERO.AsInteger);

      with ACBrNFe do
      begin

        bRetorno := ACBrNFe.WebServices.StatusServico.Executar;

        if not bRetorno then
          Exit;

//        iNumeroCarta  := GetNextID('TBEMPRESA', 'CARTA_CORRECAO_NFE', 'where CNPJ = ' + QuotedStr(sCNPJEmitente));
        iNumeroCarta  := GetNextID('TBCONFIGURACAO', 'NFE_CARTA_CORRECAO', 'where EMPRESA = ' + QuotedStr(sCNPJEmitente));
        iNumeroEvento := GetCountID('TBNFE_CARTA_CORRECAO',
          'where CCE_EMPRESA = ' + QuotedStr(sCNPJEmitente) +
          '  and NFE_NUMERO  = ' + qryCartaCorrecaoNFeNFE_NUMERO.AsString +
          '  and NFE_SERIE   = ' + qryCartaCorrecaoNFeNFE_SERIE.AsString  +
          '  and NFE_MODELO  = ' + qryCartaCorrecaoNFeNFE_MODELO.AsString +
          '  and CCE_ENVIADA = 1'
          );

        Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFe.FieldByName('MODELO').AsInteger);
        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFe.FieldByName('VERSAO').AsInteger);

        sFileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_CLIENT + qryNFe.FieldByName('XML_FILENAME').AsString;
        ForceDirectories( ExtractFilePath(sFileNameXML) );
        TMemoField(qryNFe.FieldByName('XML_FILE')).SaveToFile( sFileNameXML );

        NotasFiscais.Clear;
        NotasFiscais.LoadFromString(qryNFe.FieldByName('XML_FILE').AsWideString);

        // Numero do Lote de Envio
        //iNumeroLote := StrToInt(FormatDateTime('yymmddhhmm', GetDateTimeDB));
        //iNumeroLote := StrToInt64(FormatDateTime('yymmddhhnn', GetDateTimeDB));
        iNumeroLote := StrToInt64(Copy(FormatDateTime('yymmddhhnnss', GetDateTimeDB), 5, 8)); // Dia, hora, minuto e segundo
        sCorrecao   := RemoveAcentos(Trim(qryCartaCorrecaoNFeCCE_TEXTO.AsString));

        EventoNFe.Evento.Clear;
        EventoNFe.idLote := iNumeroLote;

        //with EventoNFe.Evento.Add do
        with EventoNFe.Evento.New do
        begin
          //  (AC,AL,AP,AM,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RJ,RN,RS,RO,RR,SC,SP,SE,TO);
          //  (12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17);

          infEvento.cOrgao := qryEmitenteEST_COD.AsInteger; // C�digo IBGE do Estado
          infEvento.CNPJ   := sCNPJEmitente;
          infEvento.chNFe      := qryNFe.FieldByName('CHAVE').AsString;
          infEvento.dhEvento   := Now; //GetDateTimeDB;
          infEvento.tpEvento   := TpcnTpEvento.teCCe;
          infEvento.nSeqEvento := iNumeroEvento;
          infEvento.detEvento.xCorrecao  := sCorrecao;
        end;

        // Enviar o evento de CC-e

        if EnviarEvento(iNumeroLote) then
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
            sLOG.Add('Chave NF-e: ' + qryNFe.FieldByName('CHAVE').AsString);
            sLOG.Add('-');
            sLOG.Add('Data/Hora Evento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));
            sLOG.Add('N�mero Protocolo: ' + EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
            sLOG.Add('C�digo Status   : ' + IntToStr(EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
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
              qryCartaCorrecaoNFeNUMERO.Value    := iNumeroEvento; // iNumeroCarta;
              qryCartaCorrecaoNFePROTOCOLO.Value := sProtocolo;
              qryCartaCorrecaoNFeXML.AsString    := IfThen(Pos('<?xml version="1.0" encoding="UTF-8"?>', sRetornoXML) = 0, '<?xml version="1.0" encoding="UTF-8"?>' + sRetornoXML, sRetornoXML);
              //qryCartaCorrecaoNFeXML_TOTAL.LoadFromFile( EventoNFe.ObterNomeArquivo(teCCe) );  // Com Erro
              qryCartaCorrecaoNFe.Post;
              qryCartaCorrecaoNFe.ApplyUpdates;

              CommitTransaction;

              UpdateNumeroCCe(sCNPJEmitente, iNumeroCarta);
            end
            else
            begin
              raise Exception.CreateFmt(
                'Ocorreu o seguinte erro ao enviar a CC-e da Nota Fiscal Eletr�nica:'  + sLineBreak +
                'C�digo: %d' + sLineBreak +
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
      Close;
      ParamByName('usuario').AsString     := gUsuarioLogado.Login;
      ParamByName('data_hora').AsDateTime := Now;
      Open;

      if IsEmpty then
      begin
        Append;

        cdsLOGUSUARIO.AsString       := gUsuarioLogado.Login;
        cdsLOGDATA_HORA.AsDateTime   := Now;
        cdsLOGEMPRESA.AsString       := sCNPJEmitente;
        cdsLOGTIPO.AsInteger         := TIPO_LOG_TRANS_SEFA;
        cdsLOGDESCRICAO.AsString     := AnsiUpperCase(DESC_LOG_EVENTO_CCE_NFE);
        cdsLOGESPECIFICACAO.AsString := sLOG.Text;

        Post;
        ApplyUpdates;
        CommitTransaction;
      end;
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
  sErrorMsg   ,
  sLogXmlEnv  ,
  sLogXmlRec  : String;
begin
(*
  IMR - 24/10/2018 :
    * Inser��o do bloco de c�digo para guarda o n�mero do recibo de envio, caso ele
    exista, mesmo quando o retorno do envio seja FALSE.
    * Comentado o bloco de c�digo que remove o n�mero do recibo de envio da venda
    mesmo que a rejei��o seja de duplicidade de nota.

  IMR - 20/05/2016 :
    Inclus�o da rejei��o 203 para que o recibo de envio n�o seja guardado no
    registro de origem (Venda ou Compra) da NF-e.

  IMR - 20/05/2016 :
    Inser��o da rotina que renomeia os arquivos XML de envio e retorno do Lote e
    Recibo quando o processo de gera��o/envio da NFCe � finalizado corretamente.
    Neste passo o objeto "ACBrNFe.NotasFiscais" � zerado com o objetivo de
    eliminar "lixos de dados" para os novos processos de gera��o/envio de NFCe.

  IMR - 08/03/2016 :
    Inser��o do bloco de comando para que, uma vez confirmado o envio da NFC-e,
    uma consulta seja realizada para for�ar a atualiza��o do XML com os dados da
    assinatura digital e o protocolo de autoriza��o.

  IMR - 09/12/2014 :
    Desenvolvimento da fun��o.
*)
  sErrorMsg := EmptyStr;
  try

    LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);
    FMensagemErro := EmptyStr;

    if ( DelphiIsRunning ) then
      Result := True
    else
      Result := ACBrNFe.WebServices.StatusServico.Executar;

    if not Result then
      Exit;

    GerarNFCEACBr(sCNPJEmitente, iCodigoCliente, sDataHoraSaida, iAnoVenda, iNumVenda, DtHoraEmiss, iSerieNFCe, iNumeroNFCe, FileNameXML);

    iNumeroLote := StrToInt(Copy(FormatDateTime('yymmddhhmmss', GetDateTimeDB), 5, 8)); // Dia, hora, minuto e segundo

    Result := ACBrNFe.Enviar( iNumeroLote, Imprimir );

    if ( Result ) then
    begin
      if (ACBrNFe.NotasFiscais.Count > 0) then
      begin
        ACBrNFe.Consultar;
        ACBrNFe.NotasFiscais.Items[0].GravarXML(ExtractFileName(FileNameXML), ExtractFilePath(FileNameXML));
      end;

      ChaveNFCE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
      ProtocoloNFCE := ACBrNFe.WebServices.Retorno.Protocolo;
      ReciboNFCE    := ACBrNFe.WebServices.Retorno.Recibo;

      UpdateNumeroNFCe(sCNPJEmitente, qryEmitenteSERIE_NFCE.AsInteger, iNumeroNFCe);

      // Renomer no diret�rio os arquivos XML de envio e retorno dos lotes e recibos de NFC-e
      RenomearLogXmlEnvioRetornoNF(iNumeroLote, ReciboNFCE, 'nfce');
      ACBrNFe.NotasFiscais.Clear;
    end
    // Guarda rebido de retorno, caso ele exista, mesmo o envio ter retornado FALSE
    else
    if Assigned(ACBrNFe.WebServices.Retorno) then
      if (Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr) then
      begin
        ReciboNFCE := Trim(ACBrNFe.WebServices.Retorno.Recibo);
        GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, ReciboNFCE);
      end;

  except
    On E : Exception do
    begin
      sErrorMsg := E.Message;

      // Diretrizes de tomada de decis�o quando a NFCe enviada n�o � aceita

      if ( Trim(ACBrNFe.WebServices.Retorno.Recibo) <> EmptyStr ) then
        if ReciboNaoExisteNaVenda(ACBrNFe.WebServices.Retorno.Recibo) then
          GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iNumeroLote, ACBrNFe.WebServices.Retorno.Recibo);

      if ( ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Count = 1 ) then
        Case ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat of
          REJEICAO_NFE_NOTA_DENEGADA, REJEICAO_NFE_IRREG_FISCO_EMIT, REJEICAO_NFE_IRREG_FISCO_DEST:
            begin
              UpdateNumeroNFCe(sCNPJEmitente, qryEmitenteSERIE_NFCE.AsInteger, iNumeroNFCe);

              if GetPermititNFeDenegada(sCNPJEmitente) then
              begin
                Result := True;

                Denegada       := True;
                DenegadaMotivo := 'NFC-e denegada por ' + ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;

                ChaveNFCE     := ACBrNFe.WebServices.Retorno.ChaveNFe;
                ProtocoloNFCE := ACBrNFe.WebServices.Retorno.Protocolo;
                ReciboNFCE    := ACBrNFe.WebServices.Retorno.Recibo;

                Exit;
              end
              else
              begin
                // Remover Lote da Venda
                GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

                sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                  'Favor gerar NFC-e novamente!';
              end;
            end;

          REJEICAO_NFE_DUPLICIDADE:
            begin
//              UpdateNumeroNFCe(sCNPJEmitente, qryEmitenteSERIE_NFCE.AsInteger, iNumeroNFCe);
//
//              // Remover Lote da Venda
//              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);
//
              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
            end;

          REJEICAO_NFE_EMISSOR_NAO_HABIL,
          REJEICAO_NFE_IE_NAO_INFORMADO ,
          REJEICAO_NFE_IE_NAO_CADASTRADO,
          REJEICAO_NFE_IE_NAO_VINCULADO ,
          REJEICAO_NFE_BC_ICMS_ERR   ,
          REJEICAO_NFE_TO_ICMS_ERR   ,
          REJEICAO_NFE_TO_PROD_ERR   ,
          REJEICAO_NFE_NCM_INEXIST   ,
          REJEICAO_NFE_CFOP_INVALIDO ,
          REJEICAO_NFE_CFOP_DIFERENTE:
            begin
              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Favor validar dados e NFC-e novamente!';

              if (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat in [REJEICAO_NFE_IE_NAO_INFORMADO, REJEICAO_NFE_IE_NAO_CADASTRADO, REJEICAO_NFE_IE_NAO_VINCULADO]) then
                sErrorMsg :=
                  'Inscri��o Estadual (IE) do cliente n�o cadastrado ou n�o vinculado ao CNPJ informado. ' + #13 +
                  '- Deve-se consultar o CNPJ do cliente no SINTEGRA; ou' + #13 +
                  '- Deve-se consultar o CNPJ do cliente no portal ''https://dfe-portal.svrs.rs.gov.br/Nfe/Ccc''' + #13 +
                  'Favor corrija esta informa��o no Cadastro do Cliente.' + #13#13 +
                  'Ap�s este procedimento, gere novamente a NF-e'
              else
              if ( (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_CFOP_INVALIDO)
                or (ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat = REJEICAO_NFE_CFOP_DIFERENTE)
              ) then
                sErrorMsg :=
                  'C�digo Fiscal de Opera��o n�o adequado para este tipo de movimento dos produtos. ' +
                  'Favor corrija-o clicando com o bot�o direito do mouse no campo CFOP' + #13#13 +
                  'Ap�s este procedimento, gere novamente a NFC-e';
            end;

          REJEICAO_NFE_NAO_CATALOG:
            begin
              // Remover Lote da Venda
              GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

              sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                'Poss�vel erro na valida��o do arquivo XML na SEFA. Favor tentar gerar NF-e mais tarde.';
            end;

          else
          begin

            sErrorMsg := IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat) + ' - ' +
              ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13#13 +
              'Favor entrar em contato com suporte e apresentar esta mensagem!';

            if Assigned(ACBrNFe.WebServices.Recibo) then                        // Se possuir recibo de envio
            begin
              if Assigned(ACBrNFe.WebServices.Recibo.NFeRetorno) then           // Se o recibo de envio possuir retorno
              begin
                if Assigned(ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe) then // Se o retorno prossuir protocolo de processamento
                begin
                  if ( ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe.Count > 0 ) then
                    Case ACBrNFe.WebServices.Recibo.NFeRetorno.ProtDFe.Items[0].cStat of
                      PROCESSO_NFE_LOTE_REJEITADO :
                        begin
                          // Remover Lote da Venda
                          GuardarLoteNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, 0, EmptyStr);

                          sErrorMsg := ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo + #13 +
                            'Favor fazer as devidas core��es e gerar NF-e novamente!';
                        end;
                    end;
                end;
              end;
            end;

          end;
        end;

      ShowError('Erro ao tentar gerar NFC-e.' +
        #13 + 'Status: ' + IntToStr(ACBrNFe.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat) +
        IfThen(Trim(ACBrNFe.WebServices.Retorno.Recibo) = EmptyStr, EmptyStr, #13 + 'Recibo: ' + ACBrNFe.WebServices.Retorno.Recibo) +
        #13#13 + 'GerarNFCeOnLineACBr() --> ' + sErrorMsg);

      FMensagemErro := Trim(sErrorMsg);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.GerarNFCeACBr(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer; var DtHoraEmiss: TDateTime; var iSerieNFCe,
  iNumeroNFCe: Integer; var FileNameXML: String);
var
  sErros ,
  sInformacaoProduto,
  sInformacaoFisco  : String;
  PorCodigoExterno  : Boolean;
  cPercentualTributoAprox,
  vTotalTributoAprox     : Currency;
  // Totalizar Valores
  cTotal_ICMSTot_vBC   ,
  cTotal_ICMSTot_vICMS : Currency;
  iCodigoNFCe          : Integer;
begin
(*
  IMR - 11/06/2018 :
    Remo��o da linha "ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := True"
    na nova vers�o do c�digo-fonte ACBr.

  IMR - 08/12/2015 :
    Altera��o nas regras de opera��o da tag "idDest" para a emiss�o de Notas Fiscais
    para fora do Estado.

  IMR - 28/11/2014 :
    Constru��o do procedimento para se gerar NFC-e.
*)

  try

    LerConfiguracao(sCNPJEmitente, tipoDANFE_ESCPOS);

    ACBrNFe.Configuracoes.Geral.RetirarAcentos       := True;
    ACBrNFe.Configuracoes.Geral.ModeloDF             := moNFCe;
    ACBrNFe.Configuracoes.Geral.VersaoDF             := TpcnVersaoDF(ConfigACBr.cbVersaoDF.ItemIndex);
    //ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := True;

    AbrirEmitente( sCNPJEmitente );
    AbrirDestinatario( iCodigoCliente );
    AbrirVenda( iAnoVenda, iNumVenda );

    if ( GetSegmentoID(qryEmitenteCNPJ.AsString) = SEGMENTO_MERCADO_CARRO_ID ) then
      raise Exception.Create('O segmento da empresa n�o permite a emiss�o de NFC-e!');

    iSerieNFCe  := qryEmitenteSERIE_NFCE.AsInteger;
    iNumeroNFCe := GetNumeroNFCe(sCNPJEmitente, iSerieNFCe, MODELO_NFCE);
    iCodigoNFCe := GerarCodigoDFe(iNumeroNFCe);
    DtHoraEmiss := Now; // GetDateTimeDB; // Porque a valida��o do XML ocorre pela data/hora local da m�quina

    GuardarCodigoNFeVenda(sCNPJEmitente, iAnoVenda, iNumVenda, iCodigoNFCe);

    ACBrNFe.NotasFiscais.Clear;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin
      Ide.cNF   := iCodigoNFCe;
      Ide.natOp := 'VENDA'; // Da CFOP 5101 // qryCalculoImportoCFOP_RESUMIDO.AsString;

      // Entradas ou sa�das dentro do Estado
      if ( qryCalculoImposto.FieldByName('CFOP').AsString[1] in ['1', '5'] ) then
        Ide.idDest := doInterna
      else
      // Entradas ou sa�das em Estados diferentes
      if ( qryCalculoImposto.FieldByName('CFOP').AsString[1] in ['2', '6'] ) then
        Ide.idDest := doInterestadual
      else
      // Entradas ou sa�das do Exterior
      if ( qryCalculoImposto.FieldByName('CFOP').AsString[1] in ['3', '7'] ) then
        Ide.idDest := doExterior
      else
        Ide.idDest := doInterna;

      if ( qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 0 ) then
        Ide.indPag  := ipVista
      else
        Ide.indPag  := ipPrazo;

      Ide.modelo    := MODELO_NFCE;
      Ide.serie     := iSerieNFCe;
      Ide.nNF       := iNumeroNFCe;
      Ide.dEmi      := DtHoraEmiss; // Data/hora vinda do Servidor FireBird
      Ide.tpNF      := tnSaida;
      Ide.tpEmis    := ACBrNFe.Configuracoes.Geral.FormaEmissao;
      Ide.tpAmb     := ACBrNFe.Configuracoes.WebServices.Ambiente;
      Ide.verProc   := GetExeVersion( ParamStr(0) );
      Ide.cUF       := UFtoCUF( qryEmitenteEST_SIGLA.AsString );
      Ide.cMunFG    := qryEmitenteCID_IBGE.AsInteger ;
      Ide.finNFe    := fnNormal;
      Ide.tpImp     := tiNFCe;
      Ide.indFinal  := cfConsumidorFinal;
      Ide.indPres   := pcPresencial;
      // N�o � aconselh�vel informar a Data/Hora de Sa�da para NFC-e
      //Ide.dSaiEnt   := StrToDateTime( FormatDateTime('dd/mm/yyyy', GetDateDB) );
      //Ide.hSaiEnt   := StrToDateTime( FormatDateTime('hh:mm:ss',   GetTimeDB) );

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
      Emit.IM    := EmptyStr; // Preencher no caso de existir servi�os na nota
      Emit.CNAE  := EmptyStr; // Verifique na cidade do emissor da NFe se � permitido
                              // a inclus�o de servi�os na NFCe

      // �gil Solu��es em Softwares
      with autXML.Add do
        CNPJCPF := AGIL_SOFTWARES_CNPJ;

      // CNPJ/CPF Contador
      if (Trim(qryEmitenteCONTADOR_CNPJCPF.AsString) <> EmptyStr) then
        with autXML.Add do
          CNPJCPF := StrOnlyNumbers( Trim(qryEmitenteCONTADOR_CNPJCPF.AsString) );

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

      if ( (qryDestinatario.FieldByName('CODIGO').AsInteger <> CONSUMIDOR_FINAL_CODIGO) and (qryDestinatario.FieldByName('CNPJ').AsString <> CONSUMIDOR_FINAL_CNPJ) ) then
        if (Trim(ValidarCNPJouCPF(qryDestinatario.FieldByName('CNPJ').AsString)) = EmptyStr) then
        begin
          Dest.CNPJCPF := qryDestinatario.FieldByName('CNPJ').AsString;
          Dest.xNome   := qryDestinatario.FieldByName('NOME').AsString + IfThen(GetImprimirCodClienteNFe(sCNPJEmitente), ' ' + FormatFloat('##00000', qryDestinatario.FieldByName('CODIGO').AsInteger));
          Dest.Email   := Trim(AnsiLowerCase(qryDestinatario.FieldByName('EMAIL').AsString));

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
        end;

      // Dados padr�es e obrigat�rios para a gera��o da NFC-e
      Dest.indIEDest := inNaoContribuinte;
      Dest.IE        := EmptyStr;
      Dest.ISUF      := EmptyStr;

  //Use os campos abaixo para informar o endere�o de retirada quando for diferente do Emitente
  {      Retirada.CNPJCPF := '';
        Retirada.xLgr    := '';
        Retirada.nro     := '';
        Retirada.xCpl    := '';
        Retirada.xBairro := '';
        Retirada.cMun    := 0;
        Retirada.xMun    := '';
        Retirada.UF      := '';}

  //Use os campos abaixo para informar o endere�o de entrega quando for diferente do Remetente/Destinat�rio
  {      Entrega.CNPJCPF := '';
        Entrega.xLgr    := '';
        Entrega.nro     := '';
        Entrega.xCpl    := '';
        Entrega.xBairro := '';
        Entrega.cMun    := 0;
        Entrega.xMun    := '';
        Entrega.UF      := '';}

      // Adicionando Produtos

      PorCodigoExterno     := GetImprimirCodigoExternoProdutoNFe(sCNPJEmitente);
      vTotalTributoAprox   := 0.0;
      cTotal_ICMSTot_vBC   := 0.0;
      cTotal_ICMSTot_vICMS := 0.0;

      qryDadosProduto.First;

      while not qryDadosProduto.Eof do
      begin

        with Det.Add do
        begin
          Prod.nItem    := qryDadosProduto.RecNo; // qryDadosProdutoSEQ.AsInteger;              // N�mero sequencial, para cada item deve ser incrementado
          Prod.cProd    := qryDadosProduto.FieldByName('CODPROD').AsString;

          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString
          else
            Prod.xProd  := qryDadosProduto.FieldByName('DESCRI').AsString + ' ' + qryDadosProduto.FieldByName('ANO_FAB_MODELO_VEICULO').AsString;

          Prod.NCM      := qryDadosProduto.FieldByName('NCM_SH').AsString;            // Tabela NCM dispon�vel em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
          Prod.CFOP     := '5101'; // qryDadosProdutoCFOP_COD.AsString;
          Prod.EXTIPI   := EmptyStr;

          if (Trim(Prod.NCM) = EmptyStr) or (Trim(Prod.NCM) = '10203000') then // C�digo descontinuado a partir de 2016
            Prod.NCM := TRIBUTO_NCM_SH_PADRAO;

          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a fun��o "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
          begin
            Prod.cEAN     := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString;
            Prod.cEANTrib := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString;
          end
          else
          begin
            //Prod.cEAN     := EmptyStr;
            //Prod.cEAN     := 'SEM GTIN';
            //Prod.cEANTrib := 'SEM GTIN';
//            Prod.cEAN     := Trim(qryDadosProduto.FieldByName('CODPROD').AsString);
//            Prod.cEAN     := PadLeft(Prod.cEAN, 12, '0') + EAN13_DV(Prod.cEAN);
            Prod.cEAN     := '200' + PadLeft(Trim(qryDadosProduto.FieldByName('CODPROD').AsString), 9, '0');
            Prod.cEAN     := Prod.cEAN + EAN13_DV(Prod.cEAN);
            Prod.cEANTrib := Prod.cEAN;
          end;

          Prod.uCom     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qCom     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency   // I10a  Valor Unit�rio de comercializa��o
          else
            Prod.vUnCom := qryDadosProduto.FieldByName('PUNIT').AsCurrency;           // I10a  Valor Unit�rio de comercializa��o

          Prod.vProd    := qryDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency;     // I11 - Valor Total Bruto dos Produtos ou Servi�os

//          if EAN13Valido(qryDadosProduto.FieldByName('CODBARRA_EAN').AsString) then   // Futuramento implementar a fun��o "ACBrValidadorValidarGTIN" em lugar da "EAN13Valido"
//            Prod.cEANTrib := qryDadosProduto.FieldByName('CODBARRA_EAN').AsString
//          else
//            Prod.cEANTrib := EmptyStr;
//
          Prod.uTrib     := qryDadosProduto.FieldByName('UNP_SIGLA').AsString;
          Prod.qTrib     := qryDadosProduto.FieldByName('QTDE').AsCurrency;

          if ( qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency > 0 ) then
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT_PROMOCAO').AsCurrency  // I14a  Valor Unit�rio de tributa��o
          else
            Prod.vUnTrib := qryDadosProduto.FieldByName('PUNIT').AsCurrency;          // I14a  Valor Unit�rio de tributa��o

(* EXEMPLO *)
          // NFe.Det[i].Prod.uCom    := 'CX';                                                   = 'UN'
          // NFe.Det[i].Prod.qCom    :=    2;   Vendidas 2 caixas ( com 10 unidades cada )      = 20
          // NFe.Det[i].Prod.vUnCom  :=   50;   R$ 50,00 cada caixa                             = 50,00 / 10 = 5,00
          // NFe.Det[i].Prod.vProd   :=  100;   R$ 100,00 Valor dos produtos                    = 20 * 5,00 = 100,00
          // NFe.Det[i].Prod.uTrib   := 'UN';                                                   = 'UN'
          // NFe.Det[i].Prod.qTrib   :=   20;   2 caixas X 10 unidades por caixa = 20 unidades  = 20
          // NFe.Det[i].Prod.vUnTrib :=    5;   R$ 100,00 / 20 unidades = R$ 5,00 cada unidade  = 100,00 / 20 = 5,00

          Prod.vFrete := 0;                                        // I15 - Valor Total do Frete
          Prod.vSeg   := 0;                                        // I16 - Valor Total do Seguro
          Prod.vDesc  := qryDadosProduto.FieldByName('TOTAL_DESCONTO').AsCurrency; // I17 - Valor do Desconto

          // Informa��o Adicional do Produto

          sInformacaoProduto := EmptyStr;
          if ( GetSegmentoID(qryEmitenteCNPJ.AsString) <> SEGMENTO_MERCADO_CARRO_ID ) then
          begin
            if PorCodigoExterno then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'C�d.: ' + qryDadosProduto.FieldByName('CODPROD').AsString
            else
            if ( Trim(qryDadosProduto.FieldByName('REFERENCIA').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Ref.: ' + qryDadosProduto.FieldByName('REFERENCIA').AsString;

            if ( Trim(qryDadosProduto.FieldByName('ANVISA').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Anvisa: ' + qryDadosProduto.FieldByName('ANVISA').AsString;

            if ( Trim(qryDadosProduto.FieldByName('LOTE').AsString) <> EmptyStr ) then
              sInformacaoProduto := sInformacaoProduto + IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) +
                'Lote: ' + qryDadosProduto.FieldByName('LOTE').AsString +
                  IfThen(qryDadosProduto.FieldByName('LOTE_FABRICACAO').IsNull, '', ' Fabrica��o: ' + FormatDateTime('dd/mm/yyyy', qryDadosProduto.FieldByName('LOTE_FABRICACAO').AsDateTime)) +
                  IfThen(qryDadosProduto.FieldByName('LOTE_VALIDADE').IsNull  , '', ' Validade: '   + FormatDateTime('dd/mm/yyyy', qryDadosProduto.FieldByName('LOTE_VALIDADE').AsDateTime));
          end
          else
            sInformacaoProduto :=
              'Cor: '         + qryDadosProduto.FieldByName('COR_VEICULO_DESCRICAO').AsString + #13 +
              'Placa: '       + qryDadosProduto.FieldByName('REFERENCIA').AsString      + #13 +
              'Renavam: '     + qryDadosProduto.FieldByName('RENAVAM_VEICULO').AsString + #13 +
              'Chassi: '      + qryDadosProduto.FieldByName('CHASSI_VEICULO').AsString  + #13 +
              'Combustivel: ' + qryDadosProduto.FieldByName('COMBUSTIVEL_VEICULO_DESCRICAO').AsString;

          infAdProd := sInformacaoProduto;

  //Declara��o de Importa��o. Pode ser adicionada v�rias atrav�s do comando Prod.DI.Add

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

  //Campos espec�ficos para venda de medicamentos
  {         with Prod.med.Add do
            begin
              nLote := '';
              qLote := 0 ;
              dFab  := now ;
              dVal  := now ;
              vPMC  := 0 ;
            end;  }

  //Campos espec�ficos para venda de armamento
  {         with Prod.arma.Add do
            begin
              nSerie := 0;
              tpArma := taUsoPermitido ;
              nCano  := 0 ;
              descr  := '' ;
            end;      }

  //Campos espec�ficos para venda de combust�vel(distribuidoras)
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
              ICMS.orig := TpcnOrigemMercadoria( StrToInt(Copy(qryDadosProduto.FieldByName('CST').AsString, 1, 1)) );

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

//                if (CSOSN = csosn900) then
//                begin
//                  ICMS.vBC   := qryDadosProduto.FieldByName('PFINAL').AsCurrency;
//                  ICMS.pICMS := qryDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
//                  ICMS.vICMS := RoundABNT(ICMS.vBC * ICMS.pICMS / 100.0, -2);
//
//                  cTotal_ICMSTot_vBC   := cTotal_ICMSTot_vBC   + (Prod.qCom * ICMS.vBC);
//                  cTotal_ICMSTot_vICMS := cTotal_ICMSTot_vICMS + (Prod.qCom * ICMS.vICMS);
//                end;
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
                  ICMS.vBC := RoundABNT(Prod.qCom * qryDadosProduto.FieldByName('VALOR_REDUCAO_BC').AsCurrency, -2)
                else
                  ICMS.vBC := RoundABNT(Prod.qCom * qryDadosProduto.FieldByName('PFINAL').AsCurrency, -2);

                ICMS.pICMS := qryDadosProduto.FieldByName('ALIQUOTA').AsCurrency;
                ICMS.vICMS := RoundABNT(ICMS.vBC * ICMS.pICMS / 100.0, -2);

                cTotal_ICMSTot_vBC   := cTotal_ICMSTot_vBC   + ICMS.vBC;
                cTotal_ICMSTot_vICMS := cTotal_ICMSTot_vICMS + ICMS.vICMS;
              end;

              // ICMS ST (Substitui��o Tribut�ria)
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
  //Grupo para servi�os
  {            with ISSQN do
               begin
                 vBC       := 0;
                 vAliq     := 0;
                 vISSQN    := 0;
                 cMunFG    := 0;
                 cListServ := 0; // Preencha este campo usando a tabela dispon�vel
                                 // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
               end;}

            // Lei da Transpar�ncia de Impostos

            if ( Trim(Prod.NCM) <> EmptyStr ) then
            begin
              cPercentualTributoAprox := qryDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;

              if ( cPercentualTributoAprox > 0.0 ) then
              begin
                vTotTrib  := SimpleRoundTo((Prod.vProd * cPercentualTributoAprox / 100), -2);
//                sInformacaoProduto := sInformacaoProduto +
//                  Trim(IfThen(Trim(sInformacaoProduto) = EmptyStr, '', #13) + Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
//                    FormatFloat(',0.00', vTotTrib),
//                    FormatFloat(',0.##"%"', cPercentualTributoAprox)
//                  ]));

                if (Trim(sInformacaoProduto) = EmptyStr) then
                  sInformacaoProduto := sInformacaoProduto +
                    Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                      FormatFloat(',0.00', vTotTrib),
                      FormatFloat(',0.##"%"', cPercentualTributoAprox)
                    ])
                else
                  sInformacaoProduto := sInformacaoProduto + #13 +
                    Format(' * Valor Aprox. Trib. R$ %s (%s). Fonte IBPT', [
                      FormatFloat(',0.00', vTotTrib),
                      FormatFloat(',0.##"%"', cPercentualTributoAprox)
                    ]);

                infAdProd := sInformacaoProduto;

                vTotalTributoAprox := vTotalTributoAprox + vTotTrib;
              end;
            end;

          end;
        end ;

        qryDadosProduto.Next;
      end;

      Total.ICMSTot.vBC     := cTotal_ICMSTot_vBC;   // qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS').AsCurrency;
      Total.ICMSTot.vICMS   := cTotal_ICMSTot_vICMS; // qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency;
      Total.ICMSTot.vBCST   := qryCalculoImposto.FieldByName('NFE_VALOR_BASE_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vST     := qryCalculoImposto.FieldByName('NFE_VALOR_ICMS_SUBST').AsCurrency;
      Total.ICMSTot.vProd   := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_PRODUTO').AsCurrency;
      Total.ICMSTot.vFrete  := qryCalculoImposto.FieldByName('NFE_VALOR_FRETE').AsCurrency;
      Total.ICMSTot.vSeg    := qryCalculoImposto.FieldByName('NFE_VALOR_SEGURO').AsCurrency;
      Total.ICMSTot.vDesc   := qryCalculoImposto.FieldByName('NFE_VALOR_DESCONTO').AsCurrency;
      Total.ICMSTot.vII     := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_II').AsCurrency;
      Total.ICMSTot.vIPI    := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_IPI').AsCurrency;
      Total.ICMSTot.vPIS    := qryCalculoImposto.FieldByName('NFE_VALOR_PIS').AsCurrency;
      Total.ICMSTot.vCOFINS := qryCalculoImposto.FieldByName('NFE_VALOR_COFINS').AsCurrency;
      Total.ICMSTot.vOutro  := qryCalculoImposto.FieldByName('NFE_VALOR_OUTROS').AsCurrency;
      Total.ICMSTot.vNF     := qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency;

      if ( vTotalTributoAprox > 0.0 ) then
        Total.ICMSTot.vTotTrib := vTotalTributoAprox;

  {      Total.ISSQNtot.vServ   := 0;
        Total.ISSQNTot.vBC     := 0;
        Total.ISSQNTot.vISS    := 0;
        Total.ISSQNTot.vPIS    := 0;
        Total.ISSQNTot.vCOFINS := 0;}

      Transp.modFrete := mfSemFrete; // NFC-e n�o pode ter FRETE

      // Dados da(s) Forma(s) de Pagamento(s)

//      01. TpcnFormaPagamento.fpDinheiro,
//      02. TpcnFormaPagamento.fpCheque,
//      03. TpcnFormaPagamento.fpCartaoCredito,
//      04. TpcnFormaPagamento.fpCartaoDebito,
//      05. TpcnFormaPagamento.fpCreditoLoja,
//      10. TpcnFormaPagamento.fpValeAlimentacao,
//      11. TpcnFormaPagamento.fpValeRefeicao,
//      12. TpcnFormaPagamento.fpValePresente,
//      13. TpcnFormaPagamento.fpValeCombustivel,
//      14. TpcnFormaPagamento.fpDuplicataMercantil,
//      06. TpcnFormaPagamento.fpBoletoBancario,
//      07. TpcnFormaPagamento.fpDepositoBancario,
//      08. TpcnFormaPagamento.fpPagamentoInstantaneo,
//      09. TpcnFormaPagamento.fpTransfBancario,
//      15. TpcnFormaPagamento.fpProgramaFidelidade,
//      TpcnFormaPagamento.fpSemPagamento,
//      TpcnFormaPagamento.fpRegimeEspecial,
//      TpcnFormaPagamento.fpOutro
//
      if ( not qryFormaPagtos.IsEmpty ) then
      begin
        qryFormaPagtos.First;
        while not qryFormaPagtos.Eof do
        begin
          with pag.Add do // Formas de Pagamentos apenas para NFC-e
           begin
             Case qryFormaPagtos.FieldByName('FORMAPAGTO_NFCE').AsInteger of
               01 : tPag := TpcnFormaPagamento.fpDinheiro;
               02 : tPag := TpcnFormaPagamento.fpCheque;
               03 : tPag := TpcnFormaPagamento.fpCartaoCredito;
               04 : tPag := TpcnFormaPagamento.fpCartaoDebito;
               05 : tPag := TpcnFormaPagamento.fpCreditoLoja;
               06 : tPag := TpcnFormaPagamento.fpBoletoBancario;
               07 : tPag := TpcnFormaPagamento.fpDepositoBancario;
               08 : tPag := TpcnFormaPagamento.fpPagamentoInstantaneo;
               09 : tPag := TpcnFormaPagamento.fpTransfBancario;
               10 : tPag := TpcnFormaPagamento.fpValeAlimentacao;
               11 : tPag := TpcnFormaPagamento.fpValeRefeicao;
               12 : tPag := TpcnFormaPagamento.fpValePresente;
               13 : tPag := TpcnFormaPagamento.fpValeCombustivel;
               14 : tPag := TpcnFormaPagamento.fpDuplicataMercantil;
               15 : tPag := TpcnFormaPagamento.fpProgramaFidelidade;
               else
               begin
                 tPag := TpcnFormaPagamento.fpOutro;
                 xPag := qryFormaPagtos.FieldByName('Descri').AsString;
               end;
             end;

             vPag := qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;
           end;

          qryFormaPagtos.Next;
        end;
      end;

      sInformacaoFisco := Trim(GetInformacaoFisco(qryCalculoImposto));
      InfAdic.infCpl   := '* ' + #13 +
        'Venda: ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger)  +
        ' - Forma/Cond. Pgto.: ' + qryCalculoImposto.FieldByName('LISTA_FORMA_PAGO').AsString + '/' + qryCalculoImposto.FieldByName('LISTA_COND_PAGO_FULL').AsString + ' * ' + #13 +
        'Vendedor: ' + qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString + ' * ' + #13 +
        'Observa��es: ' + qryCalculoImposto.FieldByName('OBS').AsString +
        IfThen(vTotalTributoAprox = 0, EmptyStr, #13 + Format('* Valor Total Aprox. Trib. R$ %s (%s). Fonte IBPT', [
          FormatFloat(',0.00', Total.ICMSTot.vTotTrib),
          FormatFloat(',0.##"%"', Total.ICMSTot.vTotTrib / Total.ICMSTot.vNF * 100)]));

      if ( sInformacaoFisco <> EmptyStr ) then
        InfAdic.infAdFisco := sInformacaoFisco;

//      infNFeSupl.qrCode := ACBrNFe.GetURLQRCode(
//          ACBrNFe.NotasFiscais[0].NFe.ide.cUF
//        , ACBrNFe.NotasFiscais[0].NFe.ide.tpAmb
//        , ACBrNFe.NotasFiscais[0].NFe.infNFe.ID
//        , IfThen(ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro <> EmptyStr
//          , ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro
//          , ACBrNFe.NotasFiscais[0].NFe.Dest.CNPJCPF)
//        , ACBrNFe.NotasFiscais[0].NFe.ide.dEmi
//        , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vNF
//        , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vICMS
//        , ACBrNFe.NotasFiscais[0].NFe.signature.DigestValue
//      );
//
      exporta.UFembarq   := EmptyStr;
      exporta.xLocEmbarq := EmptyStr;

      compra.xNEmp := EmptyStr;
      compra.xPed  := EmptyStr;
      compra.xCont := EmptyStr;

      ACBrNFe.NotasFiscais.GerarNFe;
      ACBrNFe.NotasFiscais.Assinar;

      if not ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(sErros) then
        raise Exception.Create( sErros );

      ACBrNFe.NotasFiscais.Validar;

      ACBrNFe.NotasFiscais.Items[0].NomeArq := EmptyStr;
      ACBrNFe.NotasFiscais.Items[0].GravarXML;

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
      raise Exception.Create(Format('Arquivo %s n�o encontrado.', [QuotedStr(FileNameXML)]));

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
          raise Exception.Create('Nota Fiscal n�o � do tipo NFC-e!');
      
      nfcDANFE.PosPrinter.Device.Ativar;
      try
//        DANFE.ViaConsumidor := True; // chkViaConsumidor.Checked;
//        DANFE.ImprimirItens := ImprimirItens; // Obs.: Esta propriedade ao receber FALSE, permite apenas a impress�o resumo do DANFE da NFC-e

        NotasFiscais[0].Imprimir;
      finally
        nfcDANFE.PosPrinter.Device.Desativar;
      end;

      Result := True;
    end;

  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar imprimir DANFE da Sa�da da NFC-e.' + #13#13 + 'ImprimirDANFE_ESCPOSACBr() --> ' + e.Message);
      Result := False;
    end;
  end;

end;

procedure TDMNFe.GerarArquivoQRCODEGoogle(const FileNameQRCODE,
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

procedure TDMNFe.GerarArquivoQrCode(const FileNameQrCode, StringQrCode : String;
  const tamanhoQrCode : TTamanhoQrCode);
var
  //pc : TImage;
  //pc : TPicture;
  pc : TBitmap;
  iTamQrCode : Integer;
begin
  //pc := TImage.Create(nil);
  //pc := TPicture.Create;
  pc := TBitmap.Create;
  try
    Case tamanhoQrCode of
      tamQrCode150 : iTamQrCode := LENGTH_QRCODE_150;
      tamQrCode160 : iTamQrCode := LENGTH_QRCODE_160;
      tamQrCode175 : iTamQrCode := LENGTH_QRCODE_175;
      tamQrCode180 : iTamQrCode := LENGTH_QRCODE_180;
      tamQrCode200 : iTamQrCode := LENGTH_QRCODE_200;
      tamQrCode300 : iTamQrCode := LENGTH_QRCODE_300;
    end;

    //PintarQRCode(StringQrCode, pc.Picture, TQRCodeEncoding.qrUTF8NoBOM);
    //PintarQRCode(StringQrCode, pc, TQRCodeEncoding.qrUTF8NoBOM);
    PintarQRCode(StringQrCode, pc, TQRCodeEncoding.qrUTF8NoBOM);

    pc.Height  := iTamQrCode * 2;
    pc.Width   := iTamQrCode * 2;
    //pc.Stretch := True;

    //pc.Picture.SaveToFile(FileNameQrCode);
    pc.SaveToFile(FileNameQrCode);
  finally
    pc.Free;
  end;
end;

function TDMNFe.GetMensagemErro : String;
begin
  Result := Trim(FMensagemErro);
end;

function TDMNFe.ImprimirCupomNaoFiscal_PORTA(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoVenda,
  iNumVenda: Integer;
  const BlocoImpressaoCupom : TBlocoImpressaoCupom = bicCupomRelatorioGerencial): Boolean;
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
  sCmd ,
  sPrm : String;
const
  TEXTO_TRIB_APROX_1 = '* Valor Total Aprox. Trib.:';
  TEXTO_TRIB_APROX_2 = '* R$ %s (%s)';
  TEXTO_TRIB_APROX_3 = '* Fonte IBPT';
  TEXTO_NUMERO_DANFE = 'Numero %s Serie %s Emissao %s';
  PESO_LINHA = 2;
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

  qryDadosProduto.Last;
  qryFormaPagtos.Last;

  {$IFDEF PRINTER_CUPOM}

  // Definir como usu�rio o sistema o usu�rio definido na venda
  gUsuarioLogado.Load(DMBusiness.fdConexao, qryCalculoImposto.FieldByName('Usuario').AsString);

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
  aEcfConfig.NumeroLinhas   := (qryDadosProduto.RecordCount * PESO_LINHA) +  IfThen(iCodigoCliente = CONSUMIDOR_FINAL_CODIGO, 30, 37);

  aEcfConfig.FonteImpressao.Nome    := GetCupomNaoFiscalFonteNome;
  aEcfConfig.FonteImpressao.Tamanho := GetCupomNaoFiscalFonteTamanho;

  if not qryNFeEmitida.IsEmpty then
    aEcfConfig.NumeroLinhas := aEcfConfig.NumeroLinhas + 37;

  aEcfConfig.ArquivoLogo   := Trim(ConfigACBr.edtLogoMarca.Text);
  aEcfConfig.ArquivoQRCode := EmptyStr;

  if ( BlocoImpressaoCupom in [bicCupomRelatorioGerencial, bicCupom] ) then
  begin
    aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
    try

      cValorTroco := 0.0;
      cPercentualTributoAprox := 0.0;
      cValorTributoAprox      := 0.0;
      cValorTotalTributoAprox := 0.0;

      with aEcf do
      begin
//        Ecf.SoftHouse := gPersonalizaEmpresa.CompanyName;
//        Ecf.Sistema   := gPersonalizaEmpresa.ProductName;
        Ecf.SoftHouse := AGIL_SOFTWARES_FANTASIA;
        Ecf.Sistema   := 'PDV | Controle do Ponto de Venda do SGE/SGI';
        Ecf.Versao    := gVersaoApp.ProductVersion;

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
              ACBrNFe.GetURLConsultaNFCe(ACBrNFe.Configuracoes.WebServices.UFCodigo
                , ACBrNFe.Configuracoes.WebServices.Ambiente
                , ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.Versao
              )
          else
            sUrlConsultaNFCe := '';
//              ACBrNFe.GetURL(ACBrNFe.Configuracoes.WebServices.UFCodigo
//                , ACBrNFe.Configuracoes.WebServices.AmbienteCodigo
//                , ACBrNFe.Configuracoes.Geral.FormaEmissaoCodigo
//                , LayNfeConsulta
//                , TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger)
//                , TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger)
//              );

          Ecf.Texto_Livre_Centralizado( sUrlConsultaNFCe );

          Ecf.Texto_Livre_Centralizado( 'CHAVE DE ACESSO' );
          Ecf.Texto_Livre_Centralizado( ACBrDFeUtil.FormatarChaveAcesso(qryNFeEmitidaCHAVE.AsString) );
          Ecf.Linha;
          Ecf.Texto_Livre_Centralizado( 'Consulta via leitor de QR Code' );

          // Gerar Arquivo QRCODE

          sArquivoBmpQRCode := ExtractFilePath(ParamStr(0)) + 'Temp\' + qryNFeEmitidaCHAVE.AsString + '.bmp';
          ForceDirectories( ExtractFilePath(sArquivoBmpQRCode) );

          if (ACBrNFe.NotasFiscais.Count = 0) then
            sStringQRCode := ACBrNFe.GetURLQRCode(
                UFtoCUF(qryEmitenteEST_SIGLA.AsString)             // C�digo UF
              , ACBrNFe.Configuracoes.WebServices.Ambiente         // Ambiente do WebService
              , 'NFe' + qryNFeEmitidaCHAVE.AsString                // ID da Nota Fiscal (NFe + Chave)
              , qryDestinatario.FieldByName('CNPJ').AsString       // CPJ/CNPJ do Consumidor
              , qryCalculoImposto.FieldByName('DATAEMISSAO').AsDateTime            // Data de Emiss�o
              , qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency   // Valor da Nota Fiscal
              , qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency         // Valor do ICMS da Nota Fiscal
              , EmptyStr                                                           // Assinatura Digital (A1 ou A3)
              , ACBrNFe.NotasFiscais[0].NFe.infNFe.Versao
            )
          else
          begin
            sStringQRCode := ACBrNFe.NotasFiscais[0].NFe.infNFeSupl.qrCode;
            sStringQRCode :=
              StringReplace(
                StringReplace(
                  StringReplace(
                    StringReplace(sStringQRCode, '![CDATA[', '', [rfReplaceAll])
                  , ']]', '', [rfReplaceAll])
                , '<', '', [rfReplaceAll])
              , '>', '', [rfReplaceAll]);
          end;

          if ( Trim(sStringQRCode) = EmptyStr ) then
            sStringQRCode := ACBrNFe.GetURLQRCode(
                ACBrNFe.NotasFiscais[0].NFe.Ide.cUF
              , ACBrNFe.NotasFiscais[0].NFe.Ide.tpAmb
              , OnlyNumber(ACBrNFe.NotasFiscais[0].NFe.infNFe.ID)
              , Trim(IfThen(ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro <> EmptyStr
                , ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro
                , ACBrNFe.NotasFiscais[0].NFe.Dest.CNPJCPF))
              , ACBrNFe.NotasFiscais[0].NFe.Ide.dEmi
              , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vNF
              , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vICMS
              , ACBrNFe.NotasFiscais[0].NFe.signature.DigestValue
              , ACBrNFe.NotasFiscais[0].NFe.infNFe.Versao);

          if Copy(sStringQRCode, 1, 1) = '?' then
            sStringQRCode := sUrlConsultaNFCe + sStringQRCode;

          Case aEcfTipo of
            ecfPadraoWindows, ecfLPTX, ecfTEXTO:
              cTamQrCode := tamQrCode200;

            ecfDaruma, ecfBematech, ecfBematechMp2032DLL:
              cTamQrCode := tamQrCode160;

            else
              cTamQrCode := tamQrCode300;
          end;

          GerarArquivoQRCODEGoogle(sArquivoBmpQrCode, sStringQrCode, cTamQrCode);
          // Esta fun��o est� gerando o QRCODE mas na hora da impress�o a imagem
          // est� sendo sobreposta pelos textos.
          //GerarArquivoQrCode(sArquivoBmpQrCode, sStringQrCode, cTamQrCode);

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
  end;

  // Bloco para verificar a necessidade de impressa do Cupom Extra
  qryFormaPagtos.First;
  while not qryFormaPagtos.Eof do
  begin
    if not bEmitirCumpoExtraParcelas then
      bEmitirCumpoExtraParcelas := (qryFormaPagtos.FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger = 1) and (qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1);
    qryFormaPagtos.Next;
  end;

  // Emitir Cupom Relat�rio Gerencial com parcelas para consumidor

  if bEmitirCumpoExtraParcelas and (aEcfTipo in [ecfPadraoWindows, ecfLPTX, ecfTEXTO, ecfBematech, ecfBematechMp2032DLL]) then
    if ( BlocoImpressaoCupom in [bicCupomRelatorioGerencial, bicRelatorioGerencial] ) then
    begin
      aEcfConfig.NumeroLinhas := (qryFormaPagtos.RecordCount * PESO_LINHA) + 37;
      aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
      try

        with aEcf do
        begin
//          Ecf.SoftHouse := gPersonalizaEmpresa.CompanyName;
//          Ecf.Sistema   := gPersonalizaEmpresa.ProductName;
          Ecf.SoftHouse := AGIL_SOFTWARES_FANTASIA;
          Ecf.Sistema   := 'PDV | Controle do Ponto de Venda do SGE/SGI';
          Ecf.Versao    := gVersaoApp.Version;

          Ecf.Identifica_Cupom(Now, FormatFloat('###0000000', iNumVenda), qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString);
          Ecf.Titulo_Livre( 'RELATORIO GERENCIAL' );
          Ecf.Compactar_Fonte;

          Ecf.Linha;

          if (qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) <> 0 then
          begin
            Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), False );
            Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
            Ecf.Linha;
          end;

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

  {$ELSE}

  sCmd   := ExtractFilePath(ParamStr(0)) + 'PrinterCupom.exe';
  Result := FileExists(sCmd);

  if Result then
  begin
    sCmd := '"' + Trim(sCmd) + '"';
    sPrm := sCNPJEmitente
      + ' ' + IntToStr(iCodigoCliente)
      + ' ' + IntToStr(iAnoVenda)
      + ' ' + IntToStr(iNumVenda)
      + ' ' + IntToStr(Ord(bicCupom));
    ShellExecute(0, 'Open', PChar(sCmd), PChar(sPrm), nil, SW_SHOW);
    SetFocus(Application.Handle);

    // Bloco para verificar a necessidade de impressa do Cupom Extra
    qryFormaPagtos.First;
    while not qryFormaPagtos.Eof do
    begin
      if not bEmitirCumpoExtraParcelas then
        bEmitirCumpoExtraParcelas := (qryFormaPagtos.FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger = 1) and (qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1);
      qryFormaPagtos.Next;
    end;

    if bEmitirCumpoExtraParcelas then
    begin
      Sleep(1000);
      sCmd := '"' + Trim(ExtractFilePath(ParamStr(0)) + 'PrinterCupom.exe') + '"';
      sPrm := sCNPJEmitente
        + ' ' + IntToStr(iCodigoCliente)
        + ' ' + IntToStr(iAnoVenda)
        + ' ' + IntToStr(iNumVenda)
        + ' ' + IntToStr(Ord(bicRelatorioGerencial));
      ShellExecute(0, 'Open', PChar(sCmd), PChar(sPrm), nil, SW_SHOW);
      SetFocus(Application.Handle);
    end;

  end
  else
    ShowError('Arquivo n�o localizado!' + #13 + sCmd);

  {$ENDIF}
end;

function TDMNFe.ImprimirCupomFechamentoCaixa_PORTA(const sEmpresa: String;
  const iAnoCaixa, iNumCaixa: Integer): Boolean;
var
  aEcfTipo   : TEcfTipo;
  aEcfConfig : TEcfConfiguracao;
  aEcf : TEcfFactory;
const
  PESO_LINHA = 2;
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
  aEcfConfig.NumeroLinhas   := (qryVendasCaixaDetalhe.RecordCount * PESO_LINHA) +  37;

  aEcfConfig.FonteImpressao.Nome    := GetCupomNaoFiscalFonteNome;
  aEcfConfig.FonteImpressao.Tamanho := GetCupomNaoFiscalFonteTamanho;

  aEcfConfig.ArquivoLogo   := Trim(ConfigACBr.edtLogoMarca.Text);
  aEcfConfig.ArquivoQRCode := EmptyStr;

  aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
  try

    with aEcf do
    begin
      {$IFNDEF PRINTER_CUPOM}
      Ecf.SoftHouse := gPersonalizaEmpresa.CompanyName;
      Ecf.Sistema   := gPersonalizaEmpresa.ProductName;
      {$ELSE}
      Ecf.SoftHouse := AGIL_SOFTWARES_FANTASIA;
      Ecf.Sistema   := 'PDV | Controle do Ponto de Venda do SGE/SGI';
      {$ENDIF}
      Ecf.Versao    := TVersaoController.GetInstance().ProductVersion;

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
      Ecf.TotalVenda   ( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('totalvenda').AsCurrency)       + ' .');

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
      Ecf.TotalVenda   ( FormatFloat(',0.00',  qryVendasCaixaSoma.FieldByName('totalvenda').AsCurrency)       + ' .');

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
    ParamByName('pdv').AsInteger      := IfThen(gSistema.Codigo = SISTEMA_PDV, 1, 0);
    Open;
  end;

  with qryVendasCaixaFormaPagto do
  begin
    Close;
    ParamByName('anoCaixa').AsInteger := AnoCaixa;
    ParamByName('numCaixa').AsInteger := NumeroCaixa;
    ParamByName('pdv').AsInteger      := IfThen(gSistema.Codigo = SISTEMA_PDV, 1, 0);
    Open;
  end;

  with qryVendasCaixaDetalhe do
  begin
    Close;
    ParamByName('anoCaixa').AsInteger := AnoCaixa;
    ParamByName('numCaixa').AsInteger := NumeroCaixa;
    ParamByName('pdv').AsInteger      := IfThen(gSistema.Codigo = SISTEMA_PDV, 1, 0);
    Open;
  end;
end;

procedure TDMNFe.ImprimirArquivoNFeDANFE(const sCNPJEmitente, sArquivo: String;
  var aNomeArquivoXML, aEmitente, aDestinatario, aRecibo, aProtocolo,
  aChave: String; var aDataHoraEmissao: TDateTime; var NotaValida: Boolean;
  var aSerie: String; var aNumero, aModelo, aVersao: Integer;
  var aTipoNota: TTipoNF; var aValorNF: Currency);
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
        if Emit.CNPJCPF <> sCNPJEmitente then
        begin
          DANFE.Email := EmptyStr;
          DANFE.Site  := EmptyStr;
          DANFE.Logo  := EmptyStr;
        end;

        aEmitente     := Emit.CNPJCPF;
        aDestinatario := Dest.CNPJCPF;
        aSerie        := FormatFloat('#00', Ide.serie);
        aNumero       := Ide.nNF;

        Case Ide.modelo of
          MODELO_NFE  : aModelo := Ord(moNFe);
          MODELO_NFCE : aModelo := Ord(moNFCe);
        end;

        aDataHoraEmissao := Ide.dEmi;
        aTipoNota        := TTipoNF(Ord( Ide.tpNF ));

//        sVersao := NotasFiscais.Items[0].NFe.infNFe.VersaoStr;
//
//        if ( Trim(sVersao) = 'versao="2.00"' ) then
//          aVersao := Ord(ve200)
//        else
//        if ( Trim(sVersao) = 'versao="3.00"' ) then
//          aVersao := Ord(ve300)
//        else
//        if ( Trim(sVersao) = 'versao="3.10"' ) then
//          aVersao := Ord(ve310)
//        else
//        if ( Trim(sVersao) = 'versao="4.00"' ) then
//          aVersao := Ord(ve400);

        aVersao := Ord(ve400);
      end;

      if ( not DelphiIsRunning ) then
        if ( (NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC) or (not Assigned(NotasFiscais.Items[0].NFe.procNFe)) ) then
        begin
//          WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
//          WebServices.ConsultaDPEC.Executar;
//
//          DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
          WebServices.Consulta.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
          WebServices.Consulta.Executar;

//          DANFE.ProtocoloNFe := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
          DANFE.Protocolo := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
        end;

      NotaValida := Assigned(NotasFiscais.Items[0].NFe.procNFe);

      if NotaValida then
      begin
        aChave     := StringReplace(AnsiUpperCase(NotasFiscais.Items[0].NFe.infNFe.ID), 'NFE', '', [rfReplaceAll]);
        aProtocolo := NotasFiscais.Items[0].NFe.procNFe.nProt;
        aRecibo    := aProtocolo;
        aValorNF   := NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;

        aNomeArquivoXML := aChave + '_view.xml';
        NotasFiscais.Items[0].GravarXML(aNomeArquivoXML, ExtractFilePath(sArquivo));
      end;

      NotasFiscais.Imprimir;
    end;
  except
    On E : Exception do
      ShowError('Erro ao tentar validar/carregar XML da NF-e.' + #13 +
        'Arquivo XML inv�lido!' + #13#13 +
        'ImprimirArquivoNFeDANFE() --> ' + e.Message);
  end;
end;

function TDMNFe.ImprimirCCeACBr(const sCNPJEmitente: String;
  const ControleCCe: Integer): Boolean;
var
  fdQryCCe : TFDQuery;
begin
  fdQryCCe := TFDQuery.Create(nil);
  try
    if Trim(sCNPJEmitente) = EmptyStr then
      LerConfiguracao(gUsuarioLogado.Empresa, tipoDANFEFast)
    else
      LerConfiguracao(sCNPJEmitente, tipoDANFEFast);

    try
      with fdQryCCe do
      begin
        Connection := DMBusiness.fdConexao;
        Transaction       := DMBusiness.fdTransacao;
        UpdateTransaction := DMBusiness.fdTransacao;

        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('    c.cce_numero');
        SQL.Add('  , c.cce_empresa');
        SQL.Add('  , c.cce_data');
        SQL.Add('  , c.cce_hora');
        SQL.Add('  , c.protocolo');
        SQL.Add('  , c.xml as xml_cce');
        SQL.Add('  , c.nfe_serie');
        SQL.Add('  , c.nfe_numero');
        SQL.Add('  , c.nfe_modelo');
        SQL.Add('  , n.versao    as nfe_versao');
        SQL.Add('  , n.chave     as nfe_chave');
        SQL.Add('  , n.protocolo as nfe_protocolo');
        SQL.Add('  , n.xml_file  as nfe_xml');
        SQL.Add('from TBNFE_CARTA_CORRECAO c');
        SQL.Add('  inner join TBNFE_ENVIADA n on (n.empresa = c.cce_empresa and n.serie = c.nfe_serie and n.numero = c.nfe_numero and n.modelo = c.nfe_modelo)');
        SQL.Add('where c.cce_empresa = :empresa');
        SQL.Add('  and c.cce_numero  = :controle');

        ParamByName('empresa').AsString   := sCNPJEmitente;
        ParamByName('controle').AsInteger := ControleCCe;
        Open;
      end;

      with ACBrNFe do
      begin
        Configuracoes.Geral.ModeloDF := TpcnModeloDF(fdQryCCe.FieldByName('nfe_modelo').AsInteger);
        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(fdQryCCe.FieldByName('nfe_versao').AsInteger);

        NotasFiscais.Clear;
        NotasFiscais.LoadFromString(fdQryCCe.FieldByName('nfe_xml').AsWideString);

        EventoNFe.Evento.Clear;
        if EventoNFe.LerXMLFromString(fdQryCCe.FieldByName('xml_cce').AsWideString) then
          ImprimirEvento;
      end;
    except
      On E : Exception do
      begin
        ShowError('Erro ao tentar imprimir a CCe (Carta de Corre��o Eletr�nica).' + #13#13 + 'ImprimirCCeACBr() --> ' + e.Message);
        Result := False;
      end;
    end;
  finally
    fdQryCCe.Free;
  end;
end;

function TDMNFe.ImprimirCupomFechamentoCaixa(const sEmpresa: String;
  const iAnoCaixa, iNumCaixa: Integer): Boolean;
begin
  Result := ImprimirCupomFechamentoCaixa_PORTA(sEmpresa, iAnoCaixa, iNumCaixa);
end;

end.
