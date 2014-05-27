unit UGeVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, DBClient, Provider, IBStoredProc,
  frxClass, frxDBSet, Menus, IBQuery, ClipBrd;

type
  TfrmGeVenda = class(TfrmGrPadraoCadastro)
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCliente: TLabel;
    dbCliente: TRxDBComboEdit;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    GrpBxDadosProduto: TGroupBox;
    Bevel5: TBevel;
    Bevel6: TBevel;
    pgcMaisDados: TPageControl;
    tbsRecebimento: TTabSheet;
    tbsITitulos: TTabSheet;
    lblProduto: TLabel;
    dbProduto: TRxDBComboEdit;
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
    dbCFOP: TRxDBComboEdit;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblValorIPI: TLabel;
    dbValorIPI: TDBEdit;
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
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODCLI: TIBStringField;
    IbDtstTabelaDTVENDA: TDateTimeField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaTOTALVENDA: TIBBCDField;
    IbDtstTabelaOBS: TMemoField;
    IbDtstTabelaFORMAPAG: TIBStringField;
    IbDtstTabelaFATDIAS: TSmallintField;
    IbDtstTabelaSERIE: TIBStringField;
    IbDtstTabelaNFE: TLargeintField;
    IbDtstTabelaDATAEMISSAO: TDateField;
    IbDtstTabelaHORAEMISSAO: TTimeField;
    IbDtstTabelaVERIFICADOR_NFE: TIBStringField;
    IbDtstTabelaXML_NFE: TMemoField;
    IbDtstTabelaVENDEDOR_COD: TIntegerField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaFORMAPAGTO_COD: TSmallintField;
    IbDtstTabelaCONDICAOPAGTO_COD: TSmallintField;
    IbDtstTabelaVENDA_PRAZO: TSmallintField;
    IbDtstTabelaPRAZO_01: TSmallintField;
    IbDtstTabelaPRAZO_02: TSmallintField;
    IbDtstTabelaPRAZO_03: TSmallintField;
    IbDtstTabelaPRAZO_04: TSmallintField;
    IbDtstTabelaPRAZO_05: TSmallintField;
    IbDtstTabelaPRAZO_06: TSmallintField;
    IbDtstTabelaPRAZO_07: TSmallintField;
    IbDtstTabelaPRAZO_08: TSmallintField;
    IbDtstTabelaPRAZO_09: TSmallintField;
    IbDtstTabelaPRAZO_10: TSmallintField;
    IbDtstTabelaPRAZO_11: TSmallintField;
    IbDtstTabelaPRAZO_12: TSmallintField;
    IbDtstTabelaNOME: TIBStringField;
    tblVendedor: TIBTable;
    dtsVendedor: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    btbtnFinalizar: TBitBtn;
    btbtnGerarNFe: TBitBtn;
    Bevel11: TBevel;
    Bevel12: TBevel;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODCONTROL: TIntegerField;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TIBStringField;
    cdsTabelaItensCODEMP: TIBStringField;
    cdsTabelaItensCODCLI: TIBStringField;
    cdsTabelaItensDTVENDA: TDateTimeField;
    cdsTabelaItensPUNIT: TIBBCDField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensCFOP_COD: TIntegerField;
    cdsTabelaItensALIQUOTA: TIBBCDField;
    cdsTabelaItensVALOR_IPI: TIBBCDField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensCFOP_DESCRICAO: TIBStringField;
    cdsTabelaItensCST: TIBStringField;
    qryTitulos: TIBDataSet;
    dtsTitulos: TDataSource;
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
    qryTitulosLancamento: TStringField;
    qryTitulosBAIXADO: TSmallintField;
    qryTitulosBAIXADO_: TIBStringField;
    qryTitulosDTREC: TDateField;
    IbStrPrcGerarTitulos: TIBStoredProc;
    IbDtstTabelaDTFINALIZACAO_VENDA: TDateField;
    btnTituloQuitar: TBitBtn;
    lblCFOPVenda: TLabel;
    dbCFOPVenda: TRxDBComboEdit;
    IbDtstTabelaCFOP: TIntegerField;
    IbDtstTabelaLOTE_NFE_ANO: TSmallintField;
    IbDtstTabelaLOTE_NFE_NUMERO: TIntegerField;
    IbDtstTabelaNFE_ENVIADA: TSmallintField;
    IbDtstTabelaCANCEL_DATAHORA: TDateTimeField;
    IbDtstTabelaCANCEL_MOTIVO: TMemoField;
    btbtnCancelarVND: TBitBtn;
    ppImprimir: TPopupMenu;
    nmImprimirVenda: TMenuItem;
    nmImprimirDANFE: TMenuItem;
    nmGerarDANFEXML: TMenuItem;
    N1: TMenuItem;
    cdsTabelaItensALIQUOTA_CSOSN: TIBBCDField;
    cdsTabelaItensCSOSN: TIBStringField;
    IbDtstTabelaXML_NFE_FILENAME: TIBStringField;
    qryNFE: TIBDataSet;
    updNFE: TIBUpdateSQL;
    qryNFEANOVENDA: TSmallintField;
    qryNFENUMVENDA: TIntegerField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFESERIE: TIBStringField;
    qryNFENUMERO: TIntegerField;
    qryNFECHAVE: TIBStringField;
    qryNFEPROTOCOLO: TIBStringField;
    qryNFERECIBO: TIBStringField;
    qryNFEXML_FILENAME: TIBStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    btnConsultarProduto: TBitBtn;
    Bevel13: TBevel;
    dbTotalDesconto: TRxDBComboEdit;
    lblTotalDesconto: TLabel;
    cdsTabelaItensPUNIT_PROMOCAO: TIBBCDField;
    lblProdutoPromocao: TLabel;
    qryTotalComprasAbertas: TIBQuery;
    qryTotalComprasAbertasVALOR_LIMITE: TIBBCDField;
    qryTotalComprasAbertasVALOR_COMPRAS_ABERTAS: TIBBCDField;
    qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL: TIBBCDField;
    cdsTotalComprasAbertas: TDataSource;
    lblVendaCancelada: TLabel;
    lblVendaAberta: TLabel;
    IbDtstTabelaBLOQUEADO: TSmallintField;
    IbDtstTabelaBLOQUEADO_MOTIVO: TMemoField;
    cdsTabelaItensPERCENTUAL_REDUCAO_BC: TIBBCDField;
    lblPercRedBC: TLabel;
    dbPercRedBC: TDBEdit;
    cdsTabelaItensALIQUOTA_PIS: TIBBCDField;
    cdsTabelaItensALIQUOTA_COFINS: TIBBCDField;
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
    cdsVendaFormaPagto: TIBDataSet;
    updVendaFormaPagto: TIBUpdateSQL;
    dtsVendaFormaPagto: TDataSource;
    cdsVendaFormaPagtoANO_VENDA: TSmallintField;
    cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField;
    cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField;
    cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField;
    cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField;
    cdsVendaFormaPagtoVALOR_FPAGTO: TIBBCDField;
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
    qryTitulosFORMA_PAGTO: TSmallintField;
    qryTitulosSTATUS: TIBStringField;
    cdsTabelaItensDESCONTO: TIBBCDField;
    cdsTabelaItensDESCONTO_VALOR: TIBBCDField;
    IbDtstTabelaDESCONTO: TIBBCDField;
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    cdsTabelaItensPFINAL: TIBBCDField;
    dbValorTotalBruto: TDBEdit;
    lblValorTotalBruto: TLabel;
    cdsTabelaItensTOTAL_BRUTO: TIBBCDField;
    cdsTabelaItensTOTAL_DESCONTO: TIBBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TIBBCDField;
    IbDtstTabelaTOTALVENDA_BRUTA: TIBBCDField;
    tbsTransporte: TTabSheet;
    Bevel16: TBevel;
    pnlBotoesTransp: TPanel;
    BtnTransporteInforme: TBitBtn;
    Bevel17: TBevel;
    tblModalidadeFrete: TIBTable;
    dtsModalidadeFrete: TDataSource;
    IbDtstTabelaNFE_MODALIDADE_FRETE: TSmallintField;
    IbDtstTabelaNFE_TRANSPORTADORA: TIntegerField;
    IbDtstTabelaNFE_PLACA_VEICULO: TIBStringField;
    IbDtstTabelaNFE_PLACA_UF: TIBStringField;
    IbDtstTabelaNFE_PLACA_RNTC: TIBStringField;
    IbDtstTabelaTRANSP_NOME: TIBStringField;
    IbDtstTabelaTRANSP_CNPJ: TIBStringField;
    IbDtstTabelaTRANSP_IEST: TIBStringField;
    GrpBxTransportadora: TGroupBox;
    lblTranspNome: TLabel;
    dbTranspNome: TDBEdit;
    lblTranspCnpj: TLabel;
    dbTranspCnpj: TDBEdit;
    lblTranspEndereco: TLabel;
    dbTranspEndereco: TDBEdit;
    IbDtstTabelaTRANSP_ENDERECO: TIBStringField;
    lblModalidadeFrete: TLabel;
    dbModalidadeFrete: TDBLookupComboBox;
    cdsVendaVolume: TIBDataSet;
    updVendaVolume: TIBUpdateSQL;
    dtsVendaVolume: TDataSource;
    cdsVendaVolumeANO_VENDA: TSmallintField;
    cdsVendaVolumeCONTROLE_VENDA: TIntegerField;
    cdsVendaVolumeSEQUENCIAL: TSmallintField;
    cdsVendaVolumeNUMERO: TIBStringField;
    cdsVendaVolumeQUANTIDADE: TSmallintField;
    cdsVendaVolumeESPECIE: TIBStringField;
    cdsVendaVolumeMARCA: TIBStringField;
    cdsVendaVolumePESO_BRUTO: TIBBCDField;
    cdsVendaVolumePESO_LIQUIDO: TIBBCDField;
    dbgVolumes: TDBGrid;
    RdgStatusVenda: TRadioGroup;
    IbDtstTabelaLUCRO_CALCULADO: TIBBCDField;
    ShpLucroZerado: TShape;
    lblLucroZerado: TLabel;
    ShpLucroNegativo: TShape;
    lblLucroNegativo: TLabel;
    IbDtstTabelaLOTE_NFE_RECIBO: TIBStringField;
    qryNFEEMPRESA: TIBStringField;
    nmGerarImprimirBoletos: TMenuItem;
    IbDtstTabelaGERAR_ESTOQUE_CLIENTE: TSmallintField;
    IbDtstTabelaCODCLIENTE: TIntegerField;
    popupAuditoria: TPopupMenu;
    nmPpReciboNFe: TMenuItem;
    nmPpChaveNFe: TMenuItem;
    nmPpArquivoNFe: TMenuItem;
    N2: TMenuItem;
    nmPpLimparDadosNFe: TMenuItem;
    N3: TMenuItem;
    nmEnviarEmailCliente: TMenuItem;
    cdsTabelaItensQTDE: TIBBCDField;
    cdsTabelaItensESTOQUE: TIBBCDField;
    cdsTabelaItensRESERVA: TIBBCDField;
    cdsTabelaItensQTDEFINAL: TIBBCDField;
    cdsTabelaItensCODCLIENTE: TIntegerField;
    qryProduto: TIBDataSet;
    qryCFOP: TIBDataSet;
    cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField;
    procedure ImprimirOpcoesClick(Sender: TObject);
    procedure ImprimirOrcamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure dbFormaPagtoClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
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
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btbtnFinalizarClick(Sender: TObject);
    procedure btbtnGerarNFeClick(Sender: TObject);
    procedure qryTitulosCalcFields(DataSet: TDataSet);
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
    procedure cdsVendaFormaPagtoNewRecord(DataSet: TDataSet);
    procedure cdsVendaFormaPagtoBeforePost(DataSet: TDataSet);
    procedure dbgFormaPagtoEnter(Sender: TObject);
    procedure cdsTabelaItensSEQGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTransporteInformeClick(Sender: TObject);
    procedure cdsVendaVolumeNewRecord(DataSet: TDataSet);
    procedure nmGerarImprimirBoletosClick(Sender: TObject);
    procedure nmPpReciboNFeClick(Sender: TObject);
    procedure nmPpChaveNFeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nmPpArquivoNFeClick(Sender: TObject);
    procedure nmEnviarEmailClienteClick(Sender: TObject);
  private
    { Private declarations }
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
    procedure GerarTitulos(const AnoVenda : Smallint; const ControleVenda : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure GetComprasAbertas(iCodigoCliente : Integer);
    procedure ZerarFormaPagto;
    procedure RecarregarRegistro;
    procedure GravarEmailCliente(iCliente : Integer; sEmail : String);

    //function ValidarQuantidade(Codigo : Integer; Quantidade : Integer) : Boolean;
    function PossuiTitulosPagos(AnoVenda : Smallint; NumVenda : Integer) : Boolean;
    function GetTotalValorFormaPagto : Currency;
    function GetTotalValorFormaPagto_APrazo : Currency;
    function GetGerarEstoqueCliente : Integer;
    function BoletosGerados : Boolean;
  public
    { Public declarations }
  end;

var
  frmGeVenda: TfrmGeVenda;

const
  MODALIDADE_FRETE_SEMFRETE = 3;

  procedure MostrarControleVendas(const AOwner : TComponent);

implementation

uses
  UDMBusiness, UFuncoes, UGeCliente, UGeCondicaoPagto, UGeProduto, UGeTabelaCFOP,
  DateUtils, UDMNFe, UGeVendaGerarNFe, SysConst, UGeVendaCancelar,
  UGeGerarBoletos, UGeEfetuarPagtoREC, UGeVendaFormaPagto, UConstantesDGE, UGeVendaTransporte, UGeVendaConfirmaTitulos;

{$R *.dfm}

const
 COLUMN_LUCRO = 7;

procedure MostrarControleVendas(const AOwner : TComponent);
var
  frm : TfrmGeVenda;
  whr : String;
begin
  frm := TfrmGeVenda.Create(AOwner);
  try
    whr := 'cast(v.dtvenda as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeVenda.FormCreate(Sender: TObject);
begin
  Desativar_Promocoes;

  sGeneratorName := 'GEN_VENDAS_CONTROLE_' + FormatFloat('0000', YearOf(GetDateDB));
  
  inherited;
  
  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  SQL_FormaPagto := TStringList.Create;
  SQL_FormaPagto.Clear;
  SQL_FormaPagto.AddStrings( cdsVendaFormaPagto.SelectSQL );

  SQL_Volume := TStringList.Create;
  SQL_Volume.Clear;
  SQL_Volume.AddStrings( cdsVendaVolume.SelectSQL );

  SQL_Titulos := TStringList.Create;
  SQL_Titulos.Clear;
  SQL_Titulos.AddStrings( qryTitulos.SelectSQL );

  e1Data.Date      := Date;
  e2Data.Date      := Date;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;
  tblVendedor.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  tblModalidadeFrete.Open;

  pgcMaisDados.Height := 150;
  DisplayFormatCodigo := '###0000000';
  NomeTabela     := 'TBVENDAS';
  CampoCodigo    := 'Codcontrol';
  CampoDescricao := 'c.NOME';
  CampoOrdenacao := 'v.dtvenda, c.Nome';

  WhereAdditional :=  'cast(v.dtvenda as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );

  // Configurar Legendas de acordo com o segmento
  btnConsultarProduto.Caption := StrDescricaoProduto;
  btnConsultarProduto.Hint    := 'Consultar ' + StrDescricaoProduto;

  RdgStatusVenda.Controls[2].Enabled := False;
  btbtnGerarNFe.Visible              := GetEstacaoEmitiNFe and (gSistema.Codigo = SISTEMA_GESTAO);

  if GetUserPermitirAlterarValorVenda then
  begin
    dbValorUnit.ReadOnly := False;
    dbValorUnit.TabStop  := True;
    dbValorUnit.Color    := dbProduto.Color;
  end;

  btbtnFinalizar.Visible   := (gSistema.Codigo = SISTEMA_GESTAO);
  btbtnCancelarVND.Visible := (gSistema.Codigo = SISTEMA_GESTAO);

  ShpLucroZerado.Visible   := (gSistema.Codigo = SISTEMA_GESTAO);
  lblLucroZerado.Visible   := (gSistema.Codigo = SISTEMA_GESTAO);
  ShpLucroNegativo.Visible := (gSistema.Codigo = SISTEMA_GESTAO);
  lblLucroNegativo.Visible := (gSistema.Codigo = SISTEMA_GESTAO);

  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    Self.Caption       := 'Controle de Orçamentos';
    btbtnLista.OnClick := ImprimirOrcamentoClick;
  end
  else
  begin
    Self.Caption       := 'Controle de Vendas';
    btbtnLista.OnClick := ImprimirOpcoesClick;
  end;  
end;

procedure TfrmGeVenda.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=  'cast(v.dtvenda as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );
  if ( RdgStatusVenda.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (v.status = ' + IntToStr(RdgStatusVenda.ItemIndex) + ')';

  inherited;
end;

procedure TfrmGeVenda.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaDTVENDA.Value := GetDateTimeDB;
  IbDtstTabelaCODEMP.Value  := GetEmpresaIDDefault;
  IbDtstTabelaVENDEDOR_COD.Value      := GetVendedorIDDefault;
  IbDtstTabelaFORMAPAG.Value          := GetFormaPagtoNomeDefault;
  IbDtstTabelaCFOP.Value              := GetCfopIDDefault;
  IbDtstTabelaVENDA_PRAZO.Value := 0;
  IbDtstTabelaSTATUS.Value      := STATUS_VND_AND;
  IbDtstTabelaTOTALVENDA_BRUTA.Value  := 0;
  IbDtstTabelaDESCONTO.Value          := 0;
  IbDtstTabelaTOTALVENDA.Value        := 0;
  IbDtstTabelaGERAR_ESTOQUE_CLIENTE.Value := 0;
  IbDtstTabelaNFE_ENVIADA.Value           := 0;
  IbDtstTabelaNFE_MODALIDADE_FRETE.Value  := MODALIDADE_FRETE_SEMFRETE;
  IbDtstTabelaUSUARIO.Value     := GetUserApp;

  IbDtstTabelaCODCLIENTE.Value := CONSUMIDOR_FINAL_CODIGO;
  IbDtstTabelaCODCLI.Value     := CONSUMIDOR_FINAL_CNPJ;
  IbDtstTabelaNOME.Value       := GetClienteNome( CONSUMIDOR_FINAL_CODIGO );

  if (AnsiUpperCase(Trim(IbDtstTabelaNOME.AsString)) <> CONSUMIDOR_FINAL_NOME) then
  begin
    IbDtstTabelaCODCLIENTE.Clear;
    IbDtstTabelaCODCLI.Clear;
    IbDtstTabelaNOME.Clear;
  end;

  IbDtstTabelaFORMAPAGTO_COD.Clear;
  IbDtstTabelaCONDICAOPAGTO_COD.Clear;

  IbDtstTabelaSERIE.Clear;
  IbDtstTabelaNFE.Clear;
  IbDtstTabelaLOTE_NFE_ANO.Clear;
  IbDtstTabelaLOTE_NFE_NUMERO.Clear;
  IbDtstTabelaNFE_TRANSPORTADORA.Clear;

  IbDtstTabelaNFE_TRANSPORTADORA.Required := False;
  IbDtstTabelaNFE_PLACA_VEICULO.Required  := False;
  IbDtstTabelaNFE_PLACA_UF.Required       := False;

  CarregarDadosCFOP( cdsTabelaItensCFOP_COD.AsInteger );
end;

procedure TfrmGeVenda.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
  bBloqueado : Boolean;
  sBloqueado : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome, bBloqueado, sBloqueado) ) then
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

      IbDtstTabelaCODCLIENTE.AsInteger := iCodigo;
      IbDtstTabelaCODCLI.AsString := sCNPJ;
      IbDtstTabelaNOME.AsString   := sNome;
    end;
end;

procedure TfrmGeVenda.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_VND_AND : Text := 'Em atendimento';
    STATUS_VND_ABR : Text := 'Aberta';
    STATUS_VND_FIN : Text := 'Finalizada';
    STATUS_VND_NFE : Text := 'NF-e emitida';
    STATUS_VND_CAN : Text := 'Cancelada';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeVenda.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  if ( cdsVendaFormaPagto.State in [dsEdit, dsInsert] ) then
    if ( tblCondicaoPagto.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
    begin
      cdsVendaFormaPagtoVENDA_PRAZO.AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo').AsInteger;
      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
      begin
        cdsVendaFormaPagto.FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
        if ( not tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
          cdsVendaFormaPagto.FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
      end;
    end;
end;

procedure TfrmGeVenda.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  
  DtSrcTabelaItens.AutoEdit   := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_FIN );
  dtsVendaFormaPagto.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_FIN );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
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

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.Ano        = ' + IntToStr(AnoVenda));
    Add('  and i.Codcontrol = ' + IntToStr(ControleVenda));
    Add('order by i.Ano, i.Codcontrol, i.Seq');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeVenda.AbrirTabelaFormasPagto(const AnoVenda : Smallint; const ControleVenda : Integer);
begin
  cdsVendaFormaPagto.Close;

  with cdsVendaFormaPagto, SelectSQL do
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

  with cdsVendaVolume, SelectSQL do
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

  with qryTitulos, SelectSQL do
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
    ShowWarning('Favor informar o código do produto');
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
        cdsTabelaItensCODPROD.AsString     := FieldByName('Cod').AsString;
        cdsTabelaItensDESCRI.AsString      := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString   := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNID_COD.AsInteger   := FieldByName('Codunidade').AsInteger;

        if ( FieldByName('Codcfop').AsInteger > 0 ) then
          cdsTabelaItensCFOP_COD.AsInteger := FieldByName('Codcfop').AsInteger;

        cdsTabelaItensALIQUOTA.AsCurrency              := FieldByName('Aliquota').AsCurrency;
        cdsTabelaItensALIQUOTA_CSOSN.AsCurrency        := FieldByName('Aliquota_csosn').AsCurrency;
        cdsTabelaItensALIQUOTA_PIS.AsCurrency          := FieldByName('Aliquota_pis').AsCurrency;
        cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := FieldByName('Aliquota_cofins').AsCurrency;
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := FieldByName('Percentual_reducao_BC').AsCurrency;

        if ( Trim(FieldByName('Cst').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString       := FieldByName('Cst').AsString;

        if ( Trim(FieldByName('Csosn').AsString) <> EmptyStr ) then
          cdsTabelaItensCSOSN.AsString     := FieldByName('Csosn').AsString;

        if ( Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString);

        cdsTabelaItensPUNIT.AsCurrency          := FieldByName('Preco').AsCurrency;
        cdsTabelaItensPUNIT_PROMOCAO.AsCurrency := FieldByName('Preco_Promocao').AsCurrency;
        cdsTabelaItensVALOR_IPI.AsCurrency      := FieldByName('Valor_ipi').AsCurrency;
        
        cdsTabelaItensESTOQUE.AsCurrency          := FieldByName('Qtde').AsCurrency;
        cdsTabelaItensRESERVA.AsCurrency          := FieldByName('Reserva').AsCurrency;
        cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger := FieldByName('Movimenta_Estoque').AsInteger;

        if ( cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0 ) then
        begin
          cdsTabelaItensDESCONTO_VALOR.AsCurrency := cdsTabelaItensPUNIT.AsCurrency - cdsTabelaItensPUNIT_PROMOCAO.AsCurrency;
          cdsTabelaItensDESCONTO.AsCurrency       := cdsTabelaItensDESCONTO_VALOR.AsCurrency / cdsTabelaItensPUNIT.AsCurrency * 100;
        end;

        dbDesconto.ReadOnly      := (cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0);
        dbTotalDesconto.ReadOnly := (cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0);
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado');
        cdsTabelaItensCODPROD.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
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
      begin
        ShowWarning('Código CFOP não cadastrado');
        cdsTabelaItensCFOP_COD.Clear;
        if ( dbCFOP.Visible and dbCFOP.Enabled ) then
          dbCFOP.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeVenda.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnFinalizar.Enabled   := (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty) and (not cdsVendaFormaPagto.IsEmpty);
    btbtnGerarNFe.Enabled    := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) and (not cdsTabelaItens.IsEmpty);
    btbtnCancelarVND.Enabled := ( (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN) or (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE) );

    BtnTransporteInforme.Enabled := btbtnFinalizar.Enabled or btbtnGerarNFe.Enabled;

    btnGerarBoleto.Enabled   := GetEstacaoEmitiBoleto and (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_FIN); // and (IbDtstTabelaFORMAPAGTO_COD.AsInteger = GetCondicaoPagtoIDBoleto);

    nmGerarImprimirBoletos.Enabled := (not qryTitulos.IsEmpty) and (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_CAN);

    nmImprimirDANFE.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmGerarDANFEXML.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmEnviarEmailCliente.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
  end
  else
  begin
    btbtnFinalizar.Enabled   := False;
    btbtnGerarNFe.Enabled    := False;
    btbtnCancelarVND.Enabled := False;

    BtnTransporteInforme.Enabled := False;

    nmGerarImprimirBoletos.Enabled := (not qryTitulos.IsEmpty) and (IbDtstTabelaSTATUS.AsInteger < STATUS_VND_CAN);

    nmImprimirDANFE.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmGerarDANFEXML.Enabled      := (IbDtstTabelaSTATUS.AsInteger = STATUS_VND_NFE);
    nmEnviarEmailCliente.Enabled := False;
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
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( tblFormaPagto.Locate('cod', dbFormaPagto.Field.AsInteger, []) ) then
      IbDtstTabelaFORMAPAG.AsString := tblFormaPagto.FieldByName('descri').AsString;
end;

procedure TfrmGeVenda.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaVolume( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeVenda.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_VND_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_VND_FIN : sMsg := 'Esta venda não pode ser excluída porque está finalizada.';
      STATUS_VND_NFE : sMsg := 'Esta venda não pode ser excluída porque tem NF-e emitida';
      STATUS_VND_CAN : sMsg := 'Esta venda não pode ser excluída porque está cancelada';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaVolume( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeVenda.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    if ( cdsTabelaItens.Locate('SEQ', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( cdsTabelaItens.Active ) then
  begin

    if ( GetSegmentoID(IbDtstTabelaCODEMP.AsString) = SEGMENTO_MERCADO_CARRO_ID ) then
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
    cdsTabelaItensSEQ.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeVenda.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
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
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
    begin
      cdsTabelaItens.Delete;

      GetToTais(cDescontos, cTotalLiquido);

      IbDtstTabelaDESCONTO.AsCurrency   := cDescontos;
      IbDtstTabelaTOTALVENDA.AsCurrency := cTotalLiquido;

      if ( IbDtstTabelaDESCONTO.AsCurrency < 0 ) then
        IbDtstTabelaDESCONTO.AsCurrency := 0;

      if ( IbDtstTabelaTOTALVENDA.AsCurrency < 0 ) then
        IbDtstTabelaTOTALVENDA.AsCurrency := 0;
    end;
end;

procedure TfrmGeVenda.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_Liquido  := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Bruto    := Total_Bruto    + cdsTabelaItensTOTAL_BRUTO.AsCurrency;
      Total_desconto := Total_desconto + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;

      cdsTabelaItens.Next;
    end;

    Total_Liquido  := Total_Bruto - Total_desconto;

    cdsTabelaItens.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensCODPROD.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( Trim(cdsTabelaItensCST.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o Código de Situação Fiscal (CST) do produto.');
      dbCST.SetFocus;
    end
    else
    if ( cdsTabelaItensQTDE.Value < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensPUNIT.Value <= 0 ) then
    begin
      ShowWarning('Valor unitário inválida.');
      dbValorUnit.SetFocus;
    end
    else
    if ( (cdsTabelaItensDESCONTO.AsCurrency < 0) or (cdsTabelaItensDESCONTO.AsCurrency > 100) ) then
    begin
      ShowWarning('Percentual de desconto inválido.');
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
        
      cdsTabelaItens.Post;

      GetToTais(cTotalBruto, cTotalDesconto, cTotalLiquido);

      IbDtstTabelaTOTALVENDA_BRUTA.AsCurrency := cTotalBruto;
      IbDtstTabelaDESCONTO.AsCurrency         := cTotalDesconto;
      IbDtstTabelaTOTALVENDA.AsCurrency       := cTotalLiquido;

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
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da venda!');
    btnProdutoSalvar.SetFocus;
  end
  else

  // Verificar dados da(s) Forma(s) de Pagamento(s)

  if ( cdsVendaFormaPagto.RecordCount = 0 ) then
  begin
    ShowWarning('Favor informar a forma e/ou condição de pagamento');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto <= 0 ) then
  begin
    ShowWarning('Favor informar corretamente o valor de cada forma/condição de pagamento');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto > IbDtstTabelaTOTALVENDA.AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condição de pagamento é MAIOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < IbDtstTabelaTOTALVENDA.AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condição de pagamento é MENOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  begin
    inherited;

    if ( not OcorreuErro ) then
    begin
    
      // Salvar Itens

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      // Salvar Formas de Pagamentos

      if ( cdsVendaFormaPagto.State in [dsEdit, dsInsert] ) then
        cdsVendaFormaPagto.Post;

      cdsVendaFormaPagto.ApplyUpdates;

      CommitTransaction;

      iNumero := IbDtstTabelaCODCONTROL.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaVolume( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

      // Corrigir Total Forma Pagto
      
      if ( (cdsVendaFormaPagto.RecordCount = 1) and (cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency <> IbDtstTabelaTOTALVENDA.AsCurrency) ) then
      begin
        cdsVendaFormaPagto.Edit;
        cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency := IbDtstTabelaTOTALVENDA.AsCurrency;
        cdsVendaFormaPagto.Post;
        cdsVendaFormaPagto.ApplyUpdates;

        CommitTransaction;
      end;

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeVenda.ControlEditExit(Sender: TObject);
var
  limitedesc,
  perc      : variant;
  cPrecoVND : Currency;
begin
  inherited;

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensCODPROD.AsString, 0) );

  if ( Sender = dbCFOP ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( cdsTabelaItensCFOP_COD.AsInteger );

  if ( Sender = dbCFOPVenda ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( IbDtstTabelaCFOP.AsInteger );

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
      cdsTabelaItensTOTAL_LIQUIDO.AsCurrency  := cdsTabelaItensTOTAL_BRUTO.AsCurrency - cdsTabelaItensTOTAL_DESCONTO.AsCurrency;;
    end;

  if ( Sender = dbValorLiq ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

end;

procedure TfrmGeVenda.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaVolume( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

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
    IbDtstTabelaANO.AsInteger        := iAno;
    IbDtstTabelaCODCONTROL.AsInteger := iNum;

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaVolume( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ZerarFormaPagto;

    RdgStatusVenda.ItemIndex := 0;
  end;
end;

procedure TfrmGeVenda.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_VND_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_VND_FIN : sMsg := 'Esta venda não pode ser alterada porque está finalizada.';
      STATUS_VND_NFE : sMsg := 'Esta venda não pode ser alterada porque tem NF-e emitida';
      STATUS_VND_CAN : sMsg := 'Esta venda não pode ser alterada porque está cancelada';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaVolume( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeVenda.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo  ,
  iCFOP    ,
  iUnidade : Integer;
  iEstoque ,
  iReserva : Currency;
  sCodigoAlfa,
  sDescricao ,
  sUnidade   ,
  sCST       : String;
  cAliquota  ,
  cAliquotaPIS   ,
  cAliquotaCOFINS,
  cPercRedBC ,
  cValorVenda,
  cValorPromocao,
  cValorIPI     : Currency;
begin
  cValorPromocao := 0;

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProduto(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sCST, iUnidade, iCFOP, cAliquota, cAliquotaPIS, cAliquotaCOFINS,
      cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva) ) then
    begin
      cdsTabelaItensCODPROD.AsString     := sCodigoAlfa;
      cdsTabelaItensDESCRI.AsString      := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString   := sUnidade;
      cdsTabelaItensCST.AsString         := sCST;
      cdsTabelaItensCFOP_COD.AsInteger   := iCFOP;
      cdsTabelaItensALIQUOTA.AsCurrency        := cAliquota;
      cdsTabelaItensALIQUOTA_PIS.AsCurrency    := cAliquotaPIS;
      cdsTabelaItensALIQUOTA_COFINS.AsCurrency := cAliquotaCOFINS;
      cdsTabelaItensPUNIT.AsCurrency     := cValorVenda;
      cdsTabelaItensPUNIT_PROMOCAO.AsCurrency := cValorPromocao;
      cdsTabelaItensPFINAL.AsCurrency    := cValorVenda;
      cdsTabelaItensVALOR_IPI.AsCurrency := cValorIPI;

      cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := cPercRedBC;

      cdsTabelaItensESTOQUE.AsCurrency := iEstoque;
      cdsTabelaItensRESERVA.AsCurrency := iReserva;

      if ( Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString) <> EmptyStr ) then
        cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_saida').AsString);

      if ( cValorPromocao > 0 ) then
      begin
        cdsTabelaItensDESCONTO_VALOR.AsCurrency := cValorVenda - cValorPromocao;
        cdsTabelaItensDESCONTO.AsCurrency       := cdsTabelaItensDESCONTO_VALOR.AsCurrency / cdsTabelaItensPUNIT.AsCurrency * 100;
      end;

      dbDesconto.ReadOnly      := (cValorPromocao > 0);
      dbTotalDesconto.ReadOnly := (cValorPromocao > 0);
    end;
end;

procedure TfrmGeVenda.dbCFOPButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      cdsTabelaItensCFOP_COD.AsInteger      := iCodigo;
      cdsTabelaItensCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeVenda.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODCONTROL.Value := IbDtstTabelaCODCONTROL.Value;
  cdsTabelaItensDTVENDA.Value    := IbDtstTabelaDTVENDA.Value;
  cdsTabelaItensCODEMP.Value     := IbDtstTabelaCODEMP.Value;
  cdsTabelaItensCODCLI.Value     := IbDtstTabelaCODCLI.Value;
  cdsTabelaItensCODCLIENTE.Value := IbDtstTabelaCODCLIENTE.Value;

  if ( IbDtstTabelaCFOP.IsNull ) then
  begin
    cdsTabelaItensCFOP_COD.Value        := GetCfopIDDefault;
    cdsTabelaItensCFOP_DESCRICAO.Value  := GetCfopNomeDefault;
  end
  else
  begin
    cdsTabelaItensCFOP_COD.Assign( IbDtstTabelaCFOP );
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
end;

procedure TfrmGeVenda.btbtnFinalizarClick(Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    Return := not GetPermitirVendaEstoqueInsEmpresa(IbDtstTabelaCODEMP.AsString); // Permitir vendas de produtos com estoque insuficiente

    if Return then
    begin

      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
      begin
        if ( cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger = 0 ) then // Produto não movimenta estoque
          Return := False
        else
          Return := ( (cdsTabelaItensQTDE.AsCurrency > (cdsTabelaItensESTOQUE.AsCurrency - cdsTabelaItensRESERVA.AsCurrency)) or (cdsTabelaItensESTOQUE.AsCurrency <= 0) );

        if ( Return ) then
          Break;
        cdsTabelaItens.Next;
      end;

    end;

    Result := Return;
  end;

var
  iGerarEstoqueCliente,
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  CxAno    := 0;
  CxNumero := 0;
  CxContaCorrente := 0;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger);
  AbrirTabelaFormasPagto( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

  // Verificar se cliente está bloqueado, caso a venda seja a prazo

  if ( IbDtstTabelaVENDA_PRAZO.AsInteger = 1 ) then
    if ( IbDtstTabelaBLOQUEADO.AsInteger = 1 ) then
    begin
      ShowWarning('Cliente bloqueado!' + #13#13 + 'Motivo:' + #13 + IbDtstTabelaBLOQUEADO_MOTIVO.AsString);
      Exit;
    end;

  // Verificar se existe caixa aberto para o usuário do sistema

  if cdsVendaFormaPagto.Locate('VENDA_PRAZO', 0, []) then
    if ( not CaixaAberto(GetUserApp, GetDateDB, cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento ' + QuotedStr(cdsVendaFormaPagtoFormaPagto.AsString) + '.');
      Exit;
    end;

  IbDtstTabela.Edit;

  if ( IbDtstTabelaVENDEDOR_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar o vendedor');
    dbVendedor.SetFocus;
  end
  else
  if ( QuantidadeInvalida ) then
  begin
    ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', cdsTabelaItensSEQ.AsInteger) + ' está acima da quantidade disponível no estoque.');
    if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      btnProdutoEditar.SetFocus;
  end
  else

  // Verificar dados da(s) Forma(s) de Pagamento(s)

  if ( cdsVendaFormaPagto.RecordCount = 0 ) then
  begin
    ShowWarning('Favor informar a forma e/ou condição de pagamento');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto <= 0 ) then
  begin
    ShowWarning('Favor informar corretamente o valor de cada forma/condição de pagamento');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto > IbDtstTabelaTOTALVENDA.AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condição de pagamento é MAIOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( GetTotalValorFormaPagto < IbDtstTabelaTOTALVENDA.AsCurrency ) then
  begin
    ShowWarning('O Total A Pagar informado na forma/condição de pagamento é MENOR que o Valor Total da Venda.' + #13#13 + 'Favor corrigir os valores.');
    pgcMaisDados.ActivePage := tbsRecebimento;
    dbgFormaPagto.SetFocus;
  end
  else
  if ( ShowConfirm('Confirma a finalização da venda selecionada?') ) then
  begin
    if ( IbDtstTabelaVENDA_PRAZO.AsInteger = 1 ) then
    begin
      GetComprasAbertas( IbDtstTabelaCODCLIENTE.AsInteger );
      if ( GetTotalValorFormaPagto_APrazo > qryTotalComprasAbertasVALOR_LIMITE_DISPONIVEL.AsCurrency ) then
      begin
        ShowWarning('O Valor Total A Parzo da venda está acima do Valor Limite disponível para o cliente.' + #13#13 + 'Favor comunicar ao setor financeiro.');
        Exit;
      end;
    end;

    iGerarEstoqueCliente := GetGerarEstoqueCliente;

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

    if ( CxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(CxContaCorrente, GetDateDB);

    RdgStatusVenda.ItemIndex := 0;
  end;
end;

procedure TfrmGeVenda.btbtnGerarNFeClick(Sender: TObject);
var
  iNumero    ,
  iSerieNFe  ,
  iNumeroNFe : Integer;
  sFileNameXML ,
  sChaveNFE    ,
  sProtocoloNFE,
  sReciboNFE   : String;
  iNumeroLote  : Int64;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  if not DMNFe.GetValidadeCertificado then
    Exit;

  if ( IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0 ) then
  begin
    ShowWarning('O processo de geração de NF-e para esta venda já foi solicitado, mas não fora concluído.' + #13 +
      'Favor consultar junto a SEFA e processar o Recibo de número ' +
        IbDtstTabelaLOTE_NFE_RECIBO.AsString);
(*
      'Favor consultar junto a SEFA e processar o Recibo/Lote de número ' +
        IbDtstTabelaLOTE_NFE_RECIBO.AsString + '/' +
        FormatFloat('#########0', IbDtstTabelaLOTE_NFE_NUMERO.AsInteger));
*)
    Exit;
  end;

  if ( GerarNFe(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value,
                iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote
  ) ) then
    with IbDtstTabela do
    begin
      iNumero := IbDtstTabelaCODCONTROL.AsInteger;

      with qryNFE do
      begin
        Close;
        ParamByName('empresa').AsString   := IbDtstTabelaCODEMP.AsString;
        ParamByName('anovenda').AsInteger := IbDtstTabelaANO.Value;
        ParamByName('numvenda').AsInteger := IbDtstTabelaCODCONTROL.Value;
        Open;

        Append;

        qryNFEEMPRESA.Value     := IbDtstTabelaCODEMP.AsString;
        qryNFEANOVENDA.Value    := IbDtstTabelaANO.Value;
        qryNFENUMVENDA.Value    := IbDtstTabelaCODCONTROL.Value;
        qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
        qryNFENUMERO.Value      := iNumeroNFe;
        qryNFEDATAEMISSAO.Value := GetDateDB;
        qryNFEHORAEMISSAO.Value := GetTimeDB;
        qryNFECHAVE.Value     := sChaveNFE;
        qryNFEPROTOCOLO.Value := sProtocoloNFE;
        qryNFERECIBO.Value    := sReciboNFE;
        qryNFELOTE_ANO.Value  := IbDtstTabelaANO.Value;
        qryNFELOTE_NUM.Value  := iNumeroLote;

        if ( FileExists(sFileNameXML) ) then
        begin
          CorrigirXML_NFe(sFileNameXML);

          qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
          qryNFEXML_FILE.LoadFromFile( sFileNameXML );
        end;

        Post;
        ApplyUpdates;

        CommitTransaction;
      end;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      ShowInformation('Nota Fiscal de Saída gerada com sucesso.' + #13#13 + 'Série/Número: ' + IbDtstTabelaSERIE.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaNFE.Value));

      HabilitarDesabilitar_Btns;

      nmImprimirDANFE.Click;
    end;
end;

procedure TfrmGeVenda.GerarTitulos(const AnoVenda: Smallint;
  const ControleVenda: Integer);
begin
  try

    try

      UpdateSequence('GEN_CONTAREC_NUM_' + IntToStr(AnoVenda), 'TBCONTREC', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoVenda));

      with IbStrPrcGerarTitulos do
      begin
        ParamByName('anovenda').AsInteger := AnoVenda;
        ParamByName('numvenda').AsInteger := ControleVenda;
        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar títulos de recebimento.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeVenda.qryTitulosCalcFields(DataSet: TDataSet);
begin
  qryTitulosLancamento.AsString := FormatFloat('0000', qryTitulosANOLANC.AsInteger) + FormatFloat('000000', qryTitulosNUMLANC.AsInteger);
end;

procedure TfrmGeVenda.btnRegerarTituloClick(Sender: TObject);
begin
  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_VND_FIN ) then
    ShowWarning('É permitida a geração de títulos apenas para vendas finalizadas')
  else
  if ( not qryTitulos.IsEmpty ) then
    ShowWarning('Já existe(m) título(s) gerado(s) para esta venda')
  else
  if ( ShowConfirm('Confirma geração do(s) título(s) a receber da venda?') ) then
  begin
    GerarTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeVenda.dbCFOPVendaButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
      IbDtstTabelaCFOP.AsInteger := iCodigo;
end;

procedure TfrmGeVenda.btbtnCancelarVNDClick(Sender: TObject);
var
 iNumero : Integer;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  if ( (IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0) and (IbDtstTabelaNFE.AsLargeInt = 0) ) then
  begin
    ShowWarning('O processo de geração de NF-e para esta venda já foi solicitado, mas não fora concluído.' + #13 +
      'Desta forma não seré perdida o cancelamento da venda.' + #13#13 + 'Favor consultar junto a SEFA e processar o Recibo de número ' +
        IbDtstTabelaLOTE_NFE_RECIBO.AsString + ' e comunicar ao suporte.');
    Exit;
  end;

  if ( PossuiTitulosPagos(IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) ) then
  begin
    ShowWarning('A venda possui título(s) já baixado(s).' + #13 + 'Favor providenciar a exclusão da(s) baixa(s) para que a venda possa ser cancelada!');
    Exit;
  end;

  if ( CancelarVND(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) ) then
    with IbDtstTabela do
    begin
      iNumero := IbDtstTabelaCODCONTROL.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      ShowInformation('Venda cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODCONTROL.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeVenda.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;

  case GetUserFunctionID of
    FUNCTION_USER_ID_GERENTE_ADM, FUNCTION_USER_ID_GERENTE_VND, FUNCTION_USER_ID_ESTOQUISTA, FUNCTION_USER_ID_VENDEDOR:
      begin
        btbtnFinalizar.Visible   := False;
        btbtnGerarNFe.Visible    := False;
        btbtnCancelarVND.Visible := False;
      end;
  end;

  dbgDados.Columns[COLUMN_LUCRO].Visible := ( DMBusiness.ibdtstUsersCODFUNCAO.AsInteger in [FUNCTION_USER_ID_DIRETORIA..FUNCTION_USER_ID_GERENTE_FIN,
    FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SUPORTE_TI, FUNCTION_USER_ID_SYSTEM_ADM] );
end;

procedure TfrmGeVenda.nmImprimirDANFEClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  isPDF := ( Sender = nmGerarDANFEXML );

  DMNFe.ImprimirDANFEACBr( IbDtstTabelaCODEMP.AsString, IbDtstTabelaCODCLIENTE.AsInteger, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, isPDF);
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
  if ( not GetEstacaoEmitiBoleto ) then
  begin
    ShowWarning('Estação de trabalho não habilitada para gerar boletos!');
    Exit;
  end;

  if ( not qryTitulos.IsEmpty ) then
  begin
    GerarBoleto(Self, dbCliente.Text, IbDtstTabelaCODCLIENTE.AsInteger,
      IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger);
    AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeVenda.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar produtos em Promocao
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_VND_AND ) then
      dbgDados.Canvas.Font.Color := lblVendaAberta.Font.Color
    else
    // Destacar produtos em Promocao
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_VND_CAN ) then
      dbgDados.Canvas.Font.Color := lblVendaCancelada.Font.Color;

    // Destacar alerta de lucros
    if (not IbDtstTabelaLUCRO_CALCULADO.IsNull) then
    begin
      if ( IbDtstTabelaLUCRO_CALCULADO.AsInteger = 0 ) then
        dbgDados.Canvas.Brush.Color := ShpLucroZerado.Brush.Color
      else
      if ( IbDtstTabelaLUCRO_CALCULADO.AsInteger < 0 ) then
        dbgDados.Canvas.Brush.Color := ShpLucroNegativo.Brush.Color;
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
      with DMBusiness, qryBusca do
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
        ShowError('Erro ao tentar consultar títulos baixados do cliente.' + #13#13 + E.Message);
      end;
    end;

  finally

  end;
  
  Result := bReturn;
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
  if (Shift = [ssCtrl]) and (Key = 46) Then
  begin
    if ( UpperCase(Trim(qryTitulosBAIXADO_.AsString)) <> 'X' ) then
      Exit;
      
    // Diretoria, Gerente Financeiro, Gerente ADM, Masterdados

    if (not (DMBusiness.ibdtstUsersCODFUNCAO.AsInteger in [
        FUNCTION_USER_ID_DIRETORIA
      , FUNCTION_USER_ID_GERENTE_ADM
      , FUNCTION_USER_ID_GERENTE_FIN
      , FUNCTION_USER_ID_SYSTEM_ADM])) then Exit;

    if ( not qryTitulos.IsEmpty ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if ( tblFormaPagto.Locate('cod', qryTitulosFORMA_PAGTO.AsInteger, []) ) then
        if ( tblFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
          if ( not CaixaAberto(GetUserApp, GetDateDB, qryTitulosFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
          begin
            ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
            Exit;
          end;

      MovAno    := qryTitulosANOLANC.AsInteger;
      MovNumero := qryTitulosNUMLANC.AsInteger;
      DataPagto := qryTitulosDTREC.AsDateTime;

      if ShowConfirm('Confirma a remoção do(s) registro(s) de baixa(s) do título selecionado?') then
      begin

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete from TBCONTREC_BAIXA');
          SQL.Add('where ANOLANC = ' + qryTitulosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + qryTitulosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update TBCONTREC Set Baixado = 0, Historic = '''', Dtrec = null, Docbaix = null, Tippag = null, Valorrectot = null');
          SQL.Add('where ANOLANC = ' + qryTitulosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + qryTitulosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

        ShowInformation('Registro(s) de baixa(s) de título removido(s) com sucesso.');  
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
    if not dtsVendaFormaPagto.AutoEdit then
      Exit;

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
  end
  else

  // Editar

  if (Shift = [ssCtrl]) and (Key = VK_RETURN) Then
  begin
    if not dtsVendaFormaPagto.AutoEdit then
      Exit;

    iFormPG := cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger;

    cAPagar := dbValorTotal.Field.AsCurrency + cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency;
    cAPagar := cAPagar - GetTotalValorFormaPagto;

    cdsVendaFormaPagto.Locate('FORMAPAGTO_COD', iFormPG, []);
    cdsVendaFormaPagto.Edit;

    if InserirFormaPagto(Self, cAPagar) then
      cdsVendaFormaPagto.Post
    else
      cdsVendaFormaPagto.Cancel;
  end
  else

  // Excluir Tudo e reiniciar forma de pagamento

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
  begin
    if not dtsVendaFormaPagto.AutoEdit then
      Exit;
      
    if ShowConfirm('Deseja zerar as formas/condições de pagamento e colocar a forma/condição de pagamento padrão?') then
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

  if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
    IbDtstTabela.Edit;
  IbDtstTabelaVENDA_PRAZO.AsInteger := 1;
end;

procedure TfrmGeVenda.cdsVendaFormaPagtoNewRecord(DataSet: TDataSet);
begin
  cdsVendaFormaPagtoANO_VENDA.Assign( IbDtstTabelaANO );
  cdsVendaFormaPagtoCONTROLE_VENDA.Assign( IbDtstTabelaCODCONTROL );
end;

procedure TfrmGeVenda.cdsVendaFormaPagtoBeforePost(DataSet: TDataSet);
begin
  if ( cdsVendaFormaPagtoVENDA_PRAZO.AsInteger = 1 ) then
  begin
    if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
      IbDtstTabela.Edit;
    IbDtstTabelaVENDA_PRAZO.AsInteger := 1;
  end;
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

procedure TfrmGeVenda.cdsTabelaItensSEQGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Text := IntToStr(cdsTabelaItens.RecNo);
end;

procedure TfrmGeVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Inserir

  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    Case pgcMaisDados.ActivePageIndex of
      0: dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1: dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else

  // Editar

  if (Shift = [ssCtrl]) and (Key = VK_RETURN) Then
    Case pgcMaisDados.ActivePageIndex of
      0: dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1: dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else

  // Excluir Tudo e reiniciar forma de pagamento

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
    Case pgcMaisDados.ActivePageIndex of
      0: dbgFormaPagtoKeyDown(Sender, Key, Shift);
      1: dbgTitulosKeyDown(Sender, Key, Shift);
    end
  else
  if ( Key = VK_F6 ) then
    btnConsultarProduto.Click
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
var
  iNumero : Integer;
begin
  RecarregarRegistro;

  if EditarDadosTransportadora(Self) then
  begin
    iNumero := IbDtstTabelaCODCONTROL.AsInteger;

    if ( IbDtstTabela.State = dsEdit ) then
    begin
      IbDtstTabela.Post;
      IbDtstTabela.ApplyUpdates;
    end;

    cdsVendaVolume.ApplyUpdates;
    
    CommitTransaction;

    IbDtstTabela.Close;
    IbDtstTabela.Open;

    IbDtstTabela.Locate(CampoCodigo, iNumero, []);
  end
  else
  if ( IbDtstTabela.State = dsEdit ) then
    IbDtstTabela.Cancel;

  pgcMaisDados.ActivePage := tbsTransporte;
end;

procedure TfrmGeVenda.cdsVendaVolumeNewRecord(DataSet: TDataSet);
begin
  cdsVendaVolumeANO_VENDA.Assign( IbDtstTabelaANO );
  cdsVendaVolumeCONTROLE_VENDA.Assign( IbDtstTabelaCODCONTROL );
end;

procedure TfrmGeVenda.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaCODCONTROL.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCODCONTROL.AsInteger;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('CODCONTROL', sID, []);
  end;
end;

procedure TfrmGeVenda.nmGerarImprimirBoletosClick(Sender: TObject);
(*
  function BoletosGerados : Boolean;
  begin
    with DMBusiness, qryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Select b.nossonumero from TBCONTREC b');
      SQL.Add('where b.cliente  = ' + IbDtstTabelaCODCLIENTE.AsString);
      SQL.Add('  and b.anovenda = ' + IbDtstTabelaANO.AsString);
      SQL.Add('  and b.numvenda = ' + IbDtstTabelaCODCONTROL.AsString);
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
  if IbDtstTabela.IsEmpty then
    Exit;

  if (IbDtstTabela.State in [dsEdit, dsInsert]) then
    Exit;

  // Montar identificação do documento para título de e-mail

  if ( IbDtstTabelaNFE.AsLargeInt > 0 ) then
  begin
    sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', IbDtstTabelaNFE.AsLargeInt)]);
    sDocumento := 'NFe ' + FormatFloat('###0000000', IbDtstTabelaNFE.AsLargeInt) + '-' + IbDtstTabelaSERIE.AsString;
  end
  else
  begin
    sMensagem  := Format(MSG_REF_DOC, [IbDtstTabelaANO.AsString + '/' + FormatFloat('##00000', IbDtstTabelaCODCONTROL.AsInteger)]);
    sDocumento := 'Venda ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##00000', IbDtstTabelaCODCONTROL.AsInteger);
  end;

  sDestinatario := GetClienteEmail(IbDtstTabelaCODCLIENTE.AsInteger);

  DMNFe.ConfigurarEmail(IbDtstTabelaCODEMP.AsString, sDestinatario, 'Boleta Bancária - ' + sDocumento, sMensagem);

  if BoletosGerados then
  begin
    ReImprimirBoleto(Self, dbCliente.Text, IbDtstTabelaCODCLIENTE.AsInteger,
      IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, qryTitulosCODBANCO.AsInteger, sFileNamePDF);
    Exit;
  end;

  AbrirTabelaTitulos( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  bExisteTitulo := not qryTitulos.IsEmpty;

  try
    if (not BoletosGerados) and bExisteTitulo then
    begin
      bProsseguir := GetEstacaoEmitiBoleto;

      if bProsseguir then
        bProsseguir := cdsVendaFormaPagto.Locate('VENDA_PRAZO', 1, []);

      //if bProsseguir then
      //  bProsseguir := (cdsVendaFormaPagtoFORMAPAGTO_COD.AsInteger = GetCondicaoPagtoIDBoleto); // Descontinuada

      if bProsseguir then
        bProsseguir := ShowConfirm('Deseja gerar boletos para os títulos da venda.');

      if bProsseguir then
      begin
        btnGerarBoleto.Click;
        Exit;
      end
      else
        Exit;
    end;

    if (not BoletosGerados) then
      ShowWarning('Não existem títulos com boletos gerados para o movimento de venda.')
    else
      ReImprimirBoleto(Self, dbCliente.Text, IbDtstTabelaCODCLIENTE.AsInteger,
        IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, qryTitulosCODBANCO.AsInteger, sFileNamePDF);
  finally
    qryTitulos.Filter   := EmptyStr;
    qryTitulos.Filtered := False;
  end;
end;

function TfrmGeVenda.GetGerarEstoqueCliente: Integer;
var
  iReturn : Integer;
begin
  iReturn := 0;
  try
    if GetEstoqueSateliteEmpresa(GetEmpresaIDDefault) then
      with DMBusiness, qryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select');
        SQL.Add('  coalesce(entrega_fracionada_venda, 0) as gerar_estoque');
        SQL.Add('from TBCLIENTE');
        SQL.Add('where Codigo = ' + IbDtstTabelaCODCLIENTE.AsString);
        Open;

        iReturn := FieldByName('gerar_estoque').AsInteger;

        if ( iReturn = 1 ) then
          if not ShowConfirm('Cliente trabalha com recebimento fracionado de produtos comprados nesta empresa.' + #13#13 +
            'Deseja gerar um estoque satélite para o cliente para entregas fracionadas a partir de requisições?', 'Estoque Cliente') then
            iReturn := 0;

        Close;
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
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaCODEMP.AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaCODCLIENTE.AsInteger;
      Open;
    end;

    with qryCalculoImporto do
    begin
      Close;
      ParamByName('anovenda').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('numvenda').AsInteger := IbDtstTabelaCODCONTROL.AsInteger;
      Open;
    end;

    with qryDadosProduto do
    begin
      Close;
      ParamByName('anovenda').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('numvenda').AsInteger := IbDtstTabelaCODCONTROL.AsInteger;
      Open;
    end;

    if ( ShowConfirm('Deseja imprimir em formato CUPOM?', 'Impressão', MB_DEFBUTTON1) ) then
    begin
      if ( GetModeloEmissaoCupom = MODELO_CUPOM_POOLER ) then
      begin
        FrECFPooler.PrepareReport;
        FrECFPooler.Print;
      end;
    end
    else
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
end;

procedure TfrmGeVenda.nmPpReciboNFeClick(Sender: TObject);
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString);
    ShowInformation('Dados NF-e', 'Número de Recibo de Envio da NF-e:' + #13 + Trim(IbDtstTabelaLOTE_NFE_RECIBO.AsString));
  end;
end;

procedure TfrmGeVenda.nmPpChaveNFeClick(Sender: TObject);
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaVERIFICADOR_NFE.AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(IbDtstTabelaVERIFICADOR_NFE.AsString);
    ShowInformation('Dados NF-e', 'Chave da NF-e:' + #13 + Trim(IbDtstTabelaVERIFICADOR_NFE.AsString));
  end;
end;

procedure TfrmGeVenda.nmPpArquivoNFeClick(Sender: TObject);
begin
  if not IbDtstTabela.IsEmpty then
  begin
    if ( Trim(IbDtstTabelaXML_NFE_FILENAME.AsString) = EmptyStr ) then
      Exit;

    Clipboard.AsText := Trim(IbDtstTabelaXML_NFE_FILENAME.AsString);
    ShowInformation('Dados NF-e', 'Nome do Arquivo XML NF-e:' + #13 + Trim(IbDtstTabelaXML_NFE_FILENAME.AsString));
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
  if IbDtstTabela.IsEmpty then
    Exit;

  if (IbDtstTabela.State in [dsEdit, dsInsert]) then
    Exit;

  // Montar identificação do documento para título de e-mail

  if ( IbDtstTabelaNFE.AsLargeInt > 0 ) then
  begin
    sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', IbDtstTabelaNFE.AsLargeInt)]);
    sDocumento := 'NFe ' + FormatFloat('###0000000', IbDtstTabelaNFE.AsLargeInt) + '-' + IbDtstTabelaSERIE.AsString;
  end
  else
  begin
    sMensagem  := Format(MSG_REF_DOC, [IbDtstTabelaANO.AsString + '/' + FormatFloat('##00000', IbDtstTabelaCODCONTROL.AsInteger)]);
    sDocumento := 'Venda ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##00000', IbDtstTabelaCODCONTROL.AsInteger);
  end;

  sDestinatario := GetClienteEmail(IbDtstTabelaCODCLIENTE.AsInteger);

  if not InputQuery('E-mail do Cliente:', 'Favor informar/confirmar e-mail do cliente para onde os arquivos (Boleto(s) e NF-e) serão enviados:', sDestinatario) then
    Exit
  else
    GravarEmailCliente( IbDtstTabelaCODCLIENTE.AsInteger, sDestinatario );

  DMNFe.ConfigurarEmail(IbDtstTabelaCODEMP.AsString, sDestinatario, 'Boleta Bancária - ' + sDocumento, sMensagem);

  // 1. Gerar PDF dos Boletos existentes da venda

  if BoletosGerados then
    ReImprimirBoleto(Self, dbCliente.Text, IbDtstTabelaCODCLIENTE.AsInteger,
      IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, qryTitulosCODBANCO.AsInteger, sFileNamePDF, True);


  // 2. Gerar XML/PDF da NF-e e enviar por e-mail

  if DMNFe.EnviarEmailDANFEACBr( IbDtstTabelaCODEMP.AsString, IbDtstTabelaCODCLIENTE.AsInteger, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, True, sFileNamePDF) then
    ShowInformation('Envio', 'Arquivos referentes a NF-e da venda enviados com sucesso.');
end;

procedure TfrmGeVenda.GravarEmailCliente(iCliente: Integer;
  sEmail: String);
begin
  sEmail := AnsiLowerCase( Trim(sEmail) );

  if (iCliente = 0) or (sEmail = EmptyStr) then
    Exit;

  if GetEmailValido(sEmail, False) then
    with DMBusiness, qryBusca do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update TBCLIENTE Set email = ' + QuotedStr(sEmail));
      SQL.Add('where codigo = ' + IntToStr(iCliente));
      ExecSQL;

      CommitTransaction;
    end;
end;

function TfrmGeVenda.BoletosGerados: Boolean;
begin
  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select b.nossonumero from TBCONTREC b');
    SQL.Add('where b.cliente  = ' + IbDtstTabelaCODCLIENTE.AsString);
    SQL.Add('  and b.anovenda = ' + IbDtstTabelaANO.AsString);
    SQL.Add('  and b.numvenda = ' + IbDtstTabelaCODCONTROL.AsString);
    SQL.Add('  and b.codbanco > 0');
    Open;

    Result := (Trim(FieldByName('nossonumero').AsString) <> EmptyStr);

    Close;
  end;
end;

end.
