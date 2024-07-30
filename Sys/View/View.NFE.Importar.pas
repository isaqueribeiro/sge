unit View.NFE.Importar;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
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
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxDBData,
  cxImageComboBox,
  cxClasses,
  cxGridLevel,
  dxLayoutContainer,
  cxGridInplaceEditForm,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCustomView,
  cxGrid,
  cxContainer,
  cxButtonEdit,
  cxCurrencyEdit,
  cxGridDBTableView,
  cxTextEdit,
  cxMaskEdit,

  ACBrNFeDANFEFRDM,
  ACBrNFeDANFEFR,
  ACBrNFeDANFEClass,
  pcnNFe,
  pcnConversaoNFe,
  pcnConversao,
  ACBrUtil,
  ACBrDFeUtil,
  ACBrNFe,
  ACBrValidador,
  pcnAuxiliar,

  UGrPadrao,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela,
  UConstantesDGE, dxSkinsDefaultPainters, dxSkinBasic, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinTheBezier, dxSkinWXI, dxScrollbarAnnotations;

type
  TViewNFEImportar = class(TfrmGrPadrao)
    dtsEmpresa: TDataSource;
    GrpBxEmpresa: TGroupBox;
    lblCNPJEmpresa: TLabel;
    lblRazaoSocialEmpresa: TLabel;
    dbCNPJEmpresa: TDBEdit;
    dbRazaoSocialEmpresa: TDBEdit;
    Bevel1: TBevel;
    GrpBxManifesto: TGroupBox;
    lblChaveNFe: TLabel;
    edChaveNFe: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    btnManifesto: TcxButton;
    GrpBxDadosNFe: TGroupBox;
    lblArquivoXML: TLabel;
    Bevel3: TBevel;
    edArquivoXML: TcxButtonEdit;
    btnCarregarXML: TcxButton;
    pgcNFe: TPageControl;
    tbsNFe: TTabSheet;
    tbsEmitente: TTabSheet;
    tbsProdutos: TTabSheet;
    tbsTotais: TTabSheet;
    tbsTransporte: TTabSheet;
    tbsCobranca: TTabSheet;
    tbsInformacaoAdcional: TTabSheet;
    cdsIdentificacao: TClientDataSet;
    cdsEmitente: TClientDataSet;
    cdsDadosProdutos: TClientDataSet;
    cdsDestinatario: TClientDataSet;
    cdsDuplicatas: TClientDataSet;
    cdsParametros: TClientDataSet;
    cdsCalculoImposto: TClientDataSet;
    cdsTransportador: TClientDataSet;
    cdsVeiculo: TClientDataSet;
    cdsVolumes: TClientDataSet;
    cdsEventos: TClientDataSet;
    cdsISSQN: TClientDataSet;
    cdsFatura: TClientDataSet;
    cdsLocalRetirada: TClientDataSet;
    cdsLocalEntrega: TClientDataSet;
    cdsInformacoesAdicionais: TClientDataSet;
    cdsPagamento: TClientDataSet;
    cdsInutilizacao: TClientDataSet;
    dtsEmitente: TDataSource;
    dtsIdentificacao: TDataSource;
    dtsDestinatario: TDataSource;
    dtsDadosProdutos: TDataSource;
    dtsParametros: TDataSource;
    dtsDuplicatas: TDataSource;
    dtsCalculoImposto: TDataSource;
    dtsTransportador: TDataSource;
    dtsVeiculo: TDataSource;
    dtsVolumes: TDataSource;
    dtsEventos: TDataSource;
    dtsISSQN: TDataSource;
    dtsFatura: TDataSource;
    dtsLocalRetirada: TDataSource;
    dtsLocalEntrega: TDataSource;
    dtsInformacoesAdicionais: TDataSource;
    dtsPagamento: TDataSource;
    dtsInutilizacao: TDataSource;
    lblCNPJ: TLabel;
    dbCNPJ: TDBEdit;
    lblFornecedorCadastro: TLabel;
    lblXNome: TLabel;
    dbXNome: TDBEdit;
    lblXFant: TLabel;
    dbXFant: TDBEdit;
    lblIE: TLabel;
    dbIE: TDBEdit;
    lblIM: TLabel;
    dbIM: TDBEdit;
    lblCRT: TLabel;
    dbCRT: TDBEdit;
    dbDESCR_CST: TDBEdit;
    lblXLgr: TLabel;
    dbXLgr: TDBEdit;
    lblNro: TLabel;
    dbNro: TDBEdit;
    lblXCpl: TLabel;
    dbXCpl: TDBEdit;
    lblXBairro: TLabel;
    dbXBairro: TDBEdit;
    lblCMun: TLabel;
    dbCMun: TDBEdit;
    dbXMun: TDBEdit;
    lblUF: TLabel;
    dbUF: TDBEdit;
    lblCEP: TLabel;
    dbCEP: TDBEdit;
    lblFone: TLabel;
    dbFone: TDBEdit;
    edFornecedorCadastro: TJvComboEdit;
    lblId: TLabel;
    dbId: TDBEdit;
    lblChave: TLabel;
    dbChave: TDBEdit;
    lblcUF: TLabel;
    dbcUF: TDBEdit;
    lblcNF: TLabel;
    dbcNF: TDBEdit;
    lblNatOp: TLabel;
    dbNatOp: TDBEdit;
    lblMod_: TLabel;
    dbMod_: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblNNF: TLabel;
    dbNNF: TDBEdit;
    dbDEmi: TDBEdit;
    lblDEmi: TLabel;
    dbMensagemFiscal: TDBMemo;
    lblMensagemFiscal: TLabel;
    tbsDestinatario: TTabSheet;
    lblCNPJCPF_Dest: TLabel;
    dbCNPJCPF_Dest: TDBEdit;
    dbXNome_Dest: TDBEdit;
    lblXNome_Dest: TLabel;
    lblXFant_Dest: TLabel;
    dbXFant_Dest: TDBEdit;
    lblIE_Dest: TLabel;
    dbIE_Dest: TDBEdit;
    GrdProdutosDBTableView: TcxGridDBTableView;
    GrdProdutosLevel: TcxGridLevel;
    GrdProdutos: TcxGrid;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    cxStyleHeader: TcxStyle;
    GrdProdutosDBTableViewCodigo: TcxGridDBColumn;
    GrdProdutosDBTableViewDescricao: TcxGridDBColumn;
    GrdProdutosDBTableViewQtde: TcxGridDBColumn;
    GrdProdutosDBTableViewUND: TcxGridDBColumn;
    GrdProdutosDBTableViewValor: TcxGridDBColumn;
    GrdProdutosDBTableViewNCM: TcxGridDBColumn;
    GrdProdutosDBTableViewCFOP: TcxGridDBColumn;
    GrdProdutosDBTableViewCadastro: TcxGridDBColumn;
    lblVBC: TLabel;
    dbVBC: TDBEdit;
    lblVICMS: TLabel;
    dbVICMS: TDBEdit;
    lblVBCST: TLabel;
    dbVBCST: TDBEdit;
    lblVST: TLabel;
    dbVST: TDBEdit;
    lblVProd: TLabel;
    dbVProd: TDBEdit;
    lblVFrete: TLabel;
    dbVFrete: TDBEdit;
    dbVSeg: TDBEdit;
    lblVSeg: TLabel;
    dbVDesc: TDBEdit;
    lblVDesc: TLabel;
    lblVII: TLabel;
    dbVII: TDBEdit;
    lblVIPI: TLabel;
    dbVIPI: TDBEdit;
    lblVPIS: TLabel;
    dbVPIS: TDBEdit;
    lblVCOFINS: TLabel;
    dbVCOFINS: TDBEdit;
    lblVOutro: TLabel;
    dbVOutro: TDBEdit;
    lblVTotTrib: TLabel;
    dbVTotTrib: TDBEdit;
    lblVNF: TLabel;
    dbVNF: TDBEdit;
    Label1: TLabel;
    edTransportadoraCadastro: TJvComboEdit;
    dbCNPJCPF_Transp: TDBEdit;
    lblCNPJCPF_Transp: TLabel;
    dbXNome_Transp: TDBEdit;
    lblXNome_Transp: TLabel;
    lblIE_Transp: TLabel;
    dbIE_Transp: TDBEdit;
    lblXEnder_Transp: TLabel;
    dbXEnder_Transp: TDBEdit;
    lblXMun_Transp: TLabel;
    dbXMun_Transp: TDBEdit;
    dbUF_Transp: TDBEdit;
    lblUF_Transp: TLabel;
    pnlFatura: TPanel;
    lblPagamento_Fat: TLabel;
    dbPagamento_Fat: TDBEdit;
    dbnfat_Fat: TDBEdit;
    lblnfat_Fat: TLabel;
    dbvOrig_Fat: TDBEdit;
    lblvOrig_Fat: TLabel;
    lblvDesc_Fat: TLabel;
    dbvDesc_Fat: TDBEdit;
    lblvLiq_Fat: TLabel;
    dbvLiq_Fat: TDBEdit;
    GrdDuplicatas: TcxGrid;
    GrdDuplicatasDBTableView: TcxGridDBTableView;
    cxGridDBDuplicata: TcxGridDBColumn;
    cxGridDBVencimento: TcxGridDBColumn;
    cxGridDBValor: TcxGridDBColumn;
    GrdDuplicatasLevel: TcxGridLevel;
    btnImprimir: TcxButton;
    dbOBS: TDBMemo;
    Label2: TLabel;
    dtsNota: TDataSource;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnCarregarXMLClick(Sender: TObject);
    procedure edArquivoXMLPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnManifestoClick(Sender: TObject);
    procedure edFornecedorCadastroButtonClick(Sender: TObject);
    procedure GrdProdutosEnter(Sender: TObject);
    procedure GrdProdutosExit(Sender: TObject);
    procedure GrdProdutosDBTableViewCadastroPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure btnImprimirClick(Sender: TObject);
    procedure edArquivoXMLPropertiesChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView ,
    FControllerFornecedor  ,
    FControllerProdutoFornecedor : IControllerCustom;
    FControllerNotaImportada : IControllerXML_NFeImportada;

    FNSU : String;
    sQuebraLinha : String;
    vTroco       : Currency;

    procedure CarregarEmpresa(const sCnpj : String);
    procedure CarregarXML(const sCnpj : String; aArquivoXmlNFe : String);
    procedure SetDataSetsXML;
    procedure SetControlsDataSets;

    procedure CarregaIdentificacao;
    procedure CarregaEmitente;
    procedure CarregaDestinatario;
    procedure CarregaDadosProdutos;
    procedure CarregaParametros;
    procedure CarregaCalculoImposto;
    procedure CarregaTransportador;
    procedure CarregaVeiculo;
    procedure CarregaVolumes;
    procedure CarregaDuplicatas;
    procedure CarregaISSQN;
    procedure CarregaLocalRetirada;
    procedure CarregaLocalEntrega;
    procedure CarregaFatura;
    procedure CarregaPagamento;
    procedure CarregaInformacoesAdicionais;
    procedure CarregaDadosNFe;

    procedure LimparDadosRelacao;

    procedure IdentificarFornecedor(const aCnpj : String);
    procedure IdentificarTransportadora(const aCnpj : String);
    procedure IdentificarProduto(aCampo : TField; const aProduto, aCnpjFornecedor : String);

    procedure CadastrarFornecedor;
    procedure CadastrarTransportadora;
    procedure CadastrarNotaImportada;
    procedure CadastrarProdutoFornecedor;

    function Empresa : IControllerEmpresa;
    function Fornecedor : IControllerFornecedor;
    function ProdutoFornecedor : IControllerFornecedorProduto;

    function IfThenX(AValue: Boolean; const ATrue: String; AFalse: string = ''): string;
//    function QuebraLinha: String;
    function SubstrCount(const ASubString, AString: string): Integer;
    function Split(const ADelimiter, AString: string): TSplitResult;
    function CollateBr(Str: String): String;
//    //function Explode(sPart, sInput: String): ArrOfStr;
//    function ManterVprod(dVProd, dvDesc: Double): String;
//    function ManterdvTotTrib(dvTotTrib: Double):  String;
//    function ManterVDesc(dvDesc: Currency; dVUnCom , dQCom : double ) : Double;
//    function ManterCst(dCRT: TpcnCRT; dCSOSN: TpcnCSOSNIcms;
//      dCST: TpcnCSTIcms): String;
//    function ManterArma(inItem: integer): String;
//    function ManterMedicamentos(inItem: integer): String;
//    function ManterVeiculos( inItem : integer): String;
//    function ManterValAprox( inItem : Integer ): String;
//    function ManterInfAProd( inItem : Integer; sinfAdProd : String ) : String;
//    function ManterDescricaoProduto(sXProd, sinfAdProd: String): String;
//    function ManterVTribPerc(dVTotTrib, dVProd, dVNF: Double): Double;
//    function ManterCombustivel(inItem: integer): String;
//    function FormatQuantidade(dValor: Double): String;
//    function FormatValorUnitario(dValor: Double): String;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBLOG_TRANSACAO

  Views:
  = VW_EMPRESA

  Procedures:

  Arquivo:
  - C:\Delphi\Comps\ACBr\Fontes\ACBrDFe\ACBrNFe\DANFE\NFe\Fast\ACBrNFeDANFEFRDM.pas

  Referências:
  - FDANFEClassOwner -> FrDANFE
*)

var
  ViewNFEImportar: TViewNFEImportar;

  function ImportarNFE(const AOnwer : TComponent; aChave : String; var aNSU : String; var aFileName : TFileName) : Boolean;

implementation

uses
    UFuncoes
  , UDMRecursos
  , UDMBusiness
  , UDMNFe
  , Service.Utils
  , Service.Message
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , View.Fornecedor
  , View.Produto;

{$R *.dfm}

{ TfrmGeImportarNFE }

function ImportarNFE(const AOnwer : TComponent; aChave : String; var aNSU : String; var aFileName : TFileName) : Boolean;
begin
  ViewNFEImportar := TViewNFEImportar.Create(AOnwer);
  try
    ViewNFEImportar.FNSU := aNSU.Trim;
    ViewNFEImportar.edChaveNFe.Text := TServicesUtils.StrOnlyNumbers(aChave.Trim);
    ViewNFEImportar.btnConfirmar.Visible := True;
    ViewNFEImportar.btnManifesto.Click;

    Result := (ViewNFEImportar.ShowModal = mrOk);

    if Result then
    begin
      aFileName := ViewNFEImportar.edArquivoXML.Text;
      if not aNSU.Equals(ViewNFEImportar.FNSU) then
        aNSU := ViewNFEImportar.FNSU;
    end;
  finally
    ViewNFEImportar.FreeOnRelease;
  end;
end;

procedure TViewNFEImportar.ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TViewNFEImportar.btnCarregarXMLClick(Sender: TObject);
begin
  if (Trim(edArquivoXML.Text) = EmptyStr) then
    TServiceMessage.ShowWarning('Favor selecionar o arquivo XML da NF-e!')
  else
  if not FileExists(Trim(edArquivoXML.Text)) then
    TServiceMessage.ShowWarning('Arquivo XML não existe!')
  else
  begin
    CarregarXML(Empresa.DAO.Usuario.Empresa.CNPJ, Trim(edArquivoXML.Text));
    btnConfirmar.Enabled := (Empresa.DAO.Usuario.Empresa.CNPJ = TServicesUtils.StrOnlyNumbers(cdsDestinatario.FieldByName('CNPJCPF').AsString));
    if (not btnConfirmar.Enabled) then
      TServiceMessage.ShowWarning('Arquivo XML de NF-e não pertence a empresa ' + QuotedStr(dbRazaoSocialEmpresa.Field.AsString) + '.');
  end;
end;

procedure TViewNFEImportar.btnConfirmarClick(Sender: TObject);
begin
  if FileExists(edArquivoXML.Text) then
  begin
    CadastrarNotaImportada;
    CadastrarProdutoFornecedor;

    ModalResult := mrOk;
  end;
end;

procedure TViewNFEImportar.btnImprimirClick(Sender: TObject);
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
  if FileExists(edArquivoXML.Text) then
  begin
    DMNFe.ImprimirArquivoNFeDANFE(Empresa.DAO.Usuario.Empresa.CNPJ
      , edArquivoXML.Text
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

procedure TViewNFEImportar.btnManifestoClick(Sender: TObject);
var
  sChave,
  sFile ,
  sLog  : String;
  aImportar : Boolean;

  procedure DownloadNFe;
  begin
    sFile := StringReplace(DMNFe.ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Down\', '\\', '\', [rfReplaceAll]) + edChaveNFe.Text + '-nfe.xml';

    if not FileExists(sFile) then
    begin
      sFile := EmptyStr;
      lblInforme.Caption := 'Executando download da NF-e...';
      DMNFe.DownloadNFeACBr(Empresa.DAO.Usuario.Empresa.CNPJ, Empresa.DAO.Usuario.Empresa.CNPJ, edChaveNFe.Text, sFile);
    end;

    edArquivoXML.Text := sFile;
    aImportar := FileExists(Trim(edArquivoXML.Text));
  end;

begin
  try
    sLog := EmptyStr;
    sChave    := TServicesUtils.StrOnlyNumbers(edChaveNFe.Text);
    aImportar := False;
    edChaveNFe.Text    := sChave;
    lblInforme.Visible := True;

    if sChave.IsEmpty then
      TServiceMessage.ShowWarning('Informe a Chave da nota fiscal para ser baixada!')
    else
    if not ValidarChave(edChaveNFe.Text) then
      TServiceMessage.ShowWarning('A Chave informada é inválida!')
    else
    if not DMNFe.IsNFeManifestoDestinatarioRegistrado(Empresa.DAO.Usuario.Empresa.CNPJ, sChave) then
    begin
      lblInforme.Caption := 'Executando manifesto da NF-e junto à Sefa...';

      if not DMNFe.ACBrNFe.WebServices.StatusServico.Executar then
        TServiceMessage.ShowWarning('Serviço Inoperante!' + #13#13 +
          'Motivos:' + #13 +
          '------------------------------------------' + #13 +
          '1. Certificado A1 ou A3 não instalado '     + #13 +
          '2. Certificado A3 não conectado na UBS'     + #13 +
          '3. Servidor Web para manifesto das NF-e não está respondendo.'
        )
      else
        if DMNFe.ExecutarManifestoDestinatarioNFe(Empresa.DAO.Usuario.Empresa.CNPJ, sChave, sLog) then
          DownloadNFe;
    end
    else
      DownloadNFe;

    if aImportar then
      CarregarXML(Empresa.DAO.Usuario.Empresa.CNPJ, Trim(edArquivoXML.Text));
  finally
    lblInforme.Visible := False;
  end;
end;

procedure TViewNFEImportar.CadastrarFornecedor;
var
  I : Integer;
  iTipo : Smallint;
begin
  with Fornecedor.DAO.DataSet do
  begin
    // Permitir que todos campos sejam editáveis
    for I := 0 to Fields.Count - 1 do
    begin
      Fields[I].Required := False;
      Fields[I].ReadOnly := False;
    end;

    Append;

    FieldByName('CNPJ').AsString       := TServicesUtils.StrOnlyNumbers(dbCNPJ.Text);
    FieldByName('INSCEST').AsString    := TServicesUtils.StrOnlyNumbers(dbIE.Text);
    FieldByName('INSCMUN').AsString    := TServicesUtils.StrOnlyNumbers(dbIM.Text);
    FieldByName('NOMEFORN').AsString   := Copy(Trim(dbXNome.Text), 1, FieldByName('NOMEFORN').Size);
    FieldByName('NOMEFANT').AsString   := Copy(Trim(dbXFant.Text),    1, FieldByName('NOMEFANT').Size);
    FieldByName('EST_COD').AsInteger   := GetEstadoID( Trim(dbUF.Text) );
    FieldByName('EST_NOME').AsString   := GetEstadoNome( Trim(dbUF.Text) );
    FieldByName('UF').AsString         := Trim(dbUF.Text);
    FieldByName('CID_COD').AsInteger   := IfThen(StrToIntDef(Trim(dbCMun.Text), 0) = 0, GetCidadeID(FieldByName('EST_COD').AsInteger, dbXMun.Text), GetCidadeID(StrToCurr(Trim(dbCMun.Text))) );
    FieldByName('CID_NOME').AsString   := GetCidadeNome(FieldByName('CID_COD').AsInteger);

    if ( (FieldByName('CID_COD').AsInteger = 0) and (Trim(dbCEP.Text) <> EmptyStr) ) then
    begin
      FieldByName('CID_COD').AsInteger  := GetCidadeID(Trim(dbCEP.Text));
      FieldByName('CID_NOME').AsString  := GetCidadeNome(FieldByName('CID_COD').AsInteger);
    end;

    FieldByName('CIDADE').AsString   := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(dbUF.Text) + ')', 1, FieldByName('CIDADE').Size);

    FieldByName('BAI_COD').AsInteger := TControllerFactory.New.Bairro.SetBairro(FieldByName('CID_COD').AsInteger, Copy(Trim(dbXBairro.Text), 1, FieldByName('BAI_NOME').Size));
    FieldByName('BAI_NOME').AsString := Trim(dbXBairro.Text);

    FieldByName('LOG_COD').AsInteger   := TControllerFactory.New.Logradouro.SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(dbXLgr.Text), 1, FieldByName('LOGRADOURO').Size), iTipo);
    FieldByName('LOGRADOURO').AsString := Trim(GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
    FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

    if (iTipo = 0) then
      FieldByName('TLG_TIPO').Clear
    else
      FieldByName('TLG_TIPO').AsInteger := iTipo;

    FieldByName('COMPLEMENTO').AsString := Copy(Trim(dbXCpl.Text), 1, FieldByName('COMPLEMENTO').Size);
    FieldByName('NUMERO_END').AsString  := Copy(Trim(dbNro.Text),      1, FieldByName('NUMERO_END').Size);
    FieldByName('CEP').AsString         := Copy(TServicesUtils.StrOnlyNumbers(Trim(dbCEP.Text)), 1, FieldByName('CEP').Size);

    // Informações adicionais
    FieldByName('FONE').AsString      := Copy(TServicesUtils.StrOnlyNumbers(Trim(dbFone.Text)), 1, FieldByName('FONE').Size);
    FieldByName('GRF_COD').Value      := Ord(TGrupoFornecedor.gpFornecedorProdutoServico);
    FieldByName('PAIS_ID').AsString   := Empresa.DAO.Configuracao.Padrao.PaisID;
    FieldByName('PAIS_NOME').AsString := GetPaisNomeDefault;
    FieldByName('ATIVO').AsInteger    := 1;
    FieldByName('DTCAD').AsDateTime   := Date;
    FieldByName('PESSOA_FISICA').AsInteger  := IfThen(TServicesUtils.StrIsCPF(FieldByName('CNPJ').AsString), 1, 0);
    FieldByName('TRANSPORTADORA').AsInteger := 0;

    Post;

    Fornecedor.DAO.ApplyUpdates;
    Fornecedor.DAO.CommitUpdates;
    Fornecedor.DAO.RefreshRecord;

    edFornecedorCadastro.Text := FormatFloat('###00000', FieldByName('codforn').AsInteger);
  end;
end;

procedure TViewNFEImportar.CadastrarNotaImportada;
begin
  if FNSU.IsEmpty then
    FNSU := FormatFloat('000000000000000', TControllerFactory.New.XML_NFeImportada.GetNumeroNSU(Empresa.DAO.Usuario.Empresa.CNPJ));

  if cdsEmitente.IsEmpty or FNSU.IsEmpty or (not FileExists(edArquivoXML.Text)) then
    Abort;

  with DMNFe.ACBrNFe do
  begin
    NotasFiscais.Clear;
    NotasFiscais.LoadFromFile(edArquivoXML.Text, False );

    with NotasFiscais.Items[0].NFe do
    begin
      // Buscar Nota Importada
      FControllerNotaImportada
        .DAO
        .Close
        .ParamsByName('empresa', TServicesUtils.StrOnlyNumbers(cdsDestinatario.FieldByName('CNPJCPF').AsString))
        .ParamsByName('nsu', FNSU.Trim)
        .ParamsByName('chave', TServicesUtils.StrOnlyNumbers(edChaveNFe.Text))
        .Open;

      if dtsNota.DataSet.IsEmpty then
      begin
        dtsNota.DataSet.Append;

        dtsNota.DataSet.FieldByName('empresa').AsString := TServicesUtils.StrOnlyNumbers(cdsDestinatario.FieldByName('CNPJCPF').AsString);
        dtsNota.DataSet.FieldByName('nsu').AsString     := FNSU.Trim;
        dtsNota.DataSet.FieldByName('emissor_cnpj').AsString    := cdsEmitente.FieldByName('CNPJ').AsString;
        dtsNota.DataSet.FieldByName('emissor_codigo').AsInteger := StrToInt(edFornecedorCadastro.Text);
        dtsNota.DataSet.FieldByName('serie').AsString        := FormatFloat('###00', Ide.serie);
        dtsNota.DataSet.FieldByName('numero').AsString       := FormatFloat('###0000000', Ide.cNF);
        dtsNota.DataSet.FieldByName('emissao').AsDateTime    := Ide.dEmi;
        dtsNota.DataSet.FieldByName('valor').AsCurrency      := Total.ICMSTot.vNF;
        dtsNota.DataSet.FieldByName('protocolo').AsString    := procNFe.nProt;
        dtsNota.DataSet.FieldByName('chave').AsString        := procNFe.chNFe;
        dtsNota.DataSet.FieldByName('usuario').AsString      := Empresa.DAO.Usuario.Login;

        // Arquivo
        dtsNota.DataSet.FieldByName('xml_filename').AsString := ExtractFileName(edArquivoXML.Text);
        dtsNota.DataSet.FieldByName('datahora_importacao').AsDateTime := Now;
        TMemoField(dtsNota.DataSet.FieldByName('xml_file')).LoadFromFile( edArquivoXML.Text );

        dtsNota.DataSet.Post;
        FControllerNotaImportada.DAO.ApplyUpdates;
        FControllerNotaImportada.DAO.CommitUpdates;
        FControllerNotaImportada.DAO.CommitTransaction;
      end
      else
      if (dtsNota.DataSet.FieldByName('compra_num').AsInteger = 0) then
      begin
        if (StrToCurrDef(FNSU.Trim, 0) > StrToCurrDef(dtsNota.DataSet.FieldByName('nsu').AsString, 0)) then
        begin
          dtsNota.DataSet.Edit;
          dtsNota.DataSet.FieldByName('nsu').AsString := FNSU.Trim;

          dtsNota.DataSet.Post;
          FControllerNotaImportada.DAO.ApplyUpdates;
          FControllerNotaImportada.DAO.CommitUpdates;
          FControllerNotaImportada.DAO.CommitTransaction;
        end
        else
        if (StrToCurrDef(dtsNota.DataSet.FieldByName('nsu').AsString, 0) > 0) then
          FNSU := dtsNota.DataSet.FieldByName('nsu').AsString;
      end;
    end;

    NotasFiscais.Clear;
  end;
end;

procedure TViewNFEImportar.CadastrarProdutoFornecedor;
begin
  if cdsDadosProdutos.IsEmpty then
    Abort;

  cdsDadosProdutos.DisableControls;
  try
    cdsDadosProdutos.First;
    while not cdsDadosProdutos.Eof do
    begin
      if (Trim(cdsDadosProdutos.FieldByName('ID').AsString) <> EmptyStr) then
      begin
        // Buscar Produto x Fornecedor
        ProdutoFornecedor
          .DAO
          .Close
          .ParamsByName('cnpj', TServicesUtils.StrOnlyNumbers(cdsEmitente.FieldByName('CNPJ').AsString))
          .ParamsByName('produto', cdsDadosProdutos.FieldByName('CProd').AsString)
          .Open;

        // Cadastrar referência Produto x FOrnecedor
        if ProdutoFornecedor.DAO.DataSet.IsEmpty then
        begin
          ProdutoFornecedor.DAO.DataSet.Append;
          ProdutoFornecedor.DAO.DataSet.FieldByName('fornecedor_cnpj').AsString    := TServicesUtils.StrOnlyNumbers(cdsEmitente.FieldByName('CNPJ').AsString);
          ProdutoFornecedor.DAO.DataSet.FieldByName('fornecedor_produto').AsString := cdsDadosProdutos.FieldByName('CProd').AsString;
          ProdutoFornecedor.DAO.DataSet.FieldByName('cd_fornecedor').AsInteger     := StrToIntDef(edFornecedorCadastro.Text, 0);
          ProdutoFornecedor.DAO.DataSet.FieldByName('cd_produto').AsString         := cdsDadosProdutos.FieldByName('ID').AsString;
          ProdutoFornecedor.DAO.DataSet.Post;

          ProdutoFornecedor.DAO.ApplyUpdates;
          ProdutoFornecedor.DAO.CommitUpdates;
        end;
      end;

      cdsDadosProdutos.Next;
    end;

    ProdutoFornecedor.DAO.CommitTransaction;
  finally
    cdsDadosProdutos.First;
    cdsDadosProdutos.EnableControls;
  end;
end;

procedure TViewNFEImportar.CadastrarTransportadora;
var
  I : Integer;
  iTipo : Smallint;
begin
  with Fornecedor.DAO.DataSet do
  begin
    // Permitir que todos campos sejam editáveis
    for I := 0 to Fields.Count - 1 do
    begin
      Fields[I].Required := False;
      Fields[I].ReadOnly := False;
    end;

    Append;

    FieldByName('CNPJ').AsString       := TServicesUtils.StrOnlyNumbers(dbCNPJCPF_Transp.Text);
    FieldByName('INSCEST').AsString    := IfThen(TServicesUtils.StrOnlyNumbers(dbIE_Transp.Text) = EmptyStr, 'ISENTO', TServicesUtils.StrOnlyNumbers(dbIE_Transp.Text));
    FieldByName('INSCMUN').AsString    := EmptyStr;
    FieldByName('NOMEFORN').AsString   := Copy(Trim(dbXNome_Transp.Text), 1, FieldByName('NOMEFORN').Size);
    FieldByName('NOMEFANT').AsString   := Copy(Trim(dbXNome_Transp.Text), 1, FieldByName('NOMEFANT').Size);
    FieldByName('EST_COD').AsInteger   := GetEstadoID( Trim(dbUF_Transp.Text) );
    FieldByName('EST_NOME').AsString   := GetEstadoNome( Trim(dbUF_Transp.Text) );
    FieldByName('UF').AsString         := Trim(dbUF_Transp.Text);
    FieldByName('CID_COD').AsInteger   := GetCidadeID(FieldByName('EST_COD').AsInteger, dbXMun_Transp.Text);
    FieldByName('CID_NOME').AsString   := GetCidadeNome(FieldByName('CID_COD').AsInteger);

    // Caso a cidade da transportadora não seja identificada, empresta-se esse dados do emitente da nota
    if ( (FieldByName('CID_COD').AsInteger = 0) and (Trim(dbCEP.Text) <> EmptyStr) ) then
    begin
      FieldByName('CID_COD').AsInteger  := GetCidadeID(Trim(dbCEP.Text));
      FieldByName('CID_NOME').AsString  := GetCidadeNome(FieldByName('CID_COD').AsInteger);
    end;

    FieldByName('CIDADE').AsString   := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(dbUF_Transp.Text) + ')', 1, FieldByName('CIDADE').Size);

    FieldByName('BAI_COD').AsInteger := TControllerFactory.New.Bairro.SetBairro(FieldByName('CID_COD').AsInteger, Copy(Trim(dbXBairro.Text), 1, FieldByName('BAI_NOME').Size));
    FieldByName('BAI_NOME').AsString := Trim(dbXBairro.Text);

    FieldByName('LOG_COD').AsInteger   := TControllerFactory.New.Logradouro.SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(dbXEnder_Transp.Text), 1, FieldByName('LOGRADOURO').Size), iTipo);
    FieldByName('LOGRADOURO').AsString := Trim(GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
    FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

    if (iTipo = 0) then
      FieldByName('TLG_TIPO').Clear
    else
      FieldByName('TLG_TIPO').AsInteger := iTipo;

    FieldByName('COMPLEMENTO').AsString := EmptyStr;
    FieldByName('NUMERO_END').AsString  := 'S/N';
    FieldByName('CEP').AsString         := GetCidadeCEP(FieldByName('CID_COD').AsInteger);

    // Informações adicionais
    FieldByName('FONE').AsString      := EmptyStr;
    FieldByName('GRF_COD').Value      := Ord(TGrupoFornecedor.gpFornecedorProdutoServico);
    FieldByName('PAIS_ID').AsString   := Empresa.DAO.Configuracao.Padrao.PaisID;
    FieldByName('PAIS_NOME').AsString := GetPaisNomeDefault;
    FieldByName('ATIVO').AsInteger    := 1;
    FieldByName('DTCAD').AsDateTime   := Date;
    FieldByName('PESSOA_FISICA').AsInteger  := IfThen(TServicesUtils.StrIsCPF(FieldByName('CNPJ').AsString), 1, 0);
    FieldByName('TRANSPORTADORA').AsInteger := 1;

    Post;

    Fornecedor.DAO.ApplyUpdates;
    Fornecedor.DAO.CommitUpdates;
    Fornecedor.DAO.RefreshRecord;

    edTransportadoraCadastro.Text := FormatFloat('###00000', FieldByName('codforn').AsInteger);
  end;
end;

procedure TViewNFEImportar.CarregaCalculoImposto;
begin
  with cdsCalculoImposto, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;

    with NFe.Total.ICMSTot do
    begin
      FieldByName('VBC').AsFloat          := VBC;
      FieldByName('VICMS').AsFloat        := VICMS;
      FieldByName('VBCST').AsFloat        := VBCST;
      FieldByName('VST').AsFloat          := VST;
      FieldByName('VProd').AsFloat        := VProd;
      FieldByName('VFrete').AsFloat       := VFrete;
      FieldByName('VSeg').AsFloat         := VSeg;
      FieldByName('VDesc').AsFloat        := VDesc;
      FieldByName('vICMSDeson').AsFloat   := vICMSDeson;
      FieldByName('VII').AsFloat          := VII;
      FieldByName('VIPI').AsFloat         := VIPI;
      FieldByName('VPIS').AsFloat         := VPIS;
      FieldByName('VCOFINS').AsFloat      := VCOFINS;
      FieldByName('VOutro').AsFloat       := VOutro;
      FieldByName('VNF').AsFloat          := VNF;
      FieldByName('VTotTrib').AsFloat     := VTotTrib;
      FieldByName('ValorApagar').AsFloat  := VProd - VDesc - vICMSDeson + VOutro;
      FieldByName('VFCP').AsFloat         := VFCP;
      FieldByName('VFCPST').AsFloat       := VFCPST;
      FieldByName('VFCPSTRet').AsFloat    := vFCPSTRet;
      FieldByName('VIPIDevol').AsFloat    := vIPIDevol;
      if (DANFE.Owner is TACBrNFeDANFEClass) then
        FieldByName('VTribPerc').AsFloat := frDANFE.ManterVTribPerc(VTotTrib, VProd, VNF);

      if NaoEstaVazio(frDANFE.FonteTributos) then
        FieldByName('VTribFonte').AsString := '(Fonte: ' + frDANFE.FonteTributos + ')';
    end;

    FieldByName('vTroco').AsCurrency    := NFe.pag.vTroco;
    FieldByName('vTotPago').AsCurrency  := NFe.pag.vTroco + FieldByName('VProd').AsFloat;

    Post;
  end;
end;

procedure TViewNFEImportar.CarregaDadosNFe;
begin
  WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Carregando arquivo XML...');
  try
    CarregaParametros;
    CarregaIdentificacao;
    CarregaEmitente;
    CarregaDestinatario;
    CarregaDadosProdutos;
    CarregaCalculoImposto;
    CarregaTransportador;
    CarregaVeiculo;
    CarregaVolumes;
    CarregaDuplicatas;
    CarregaISSQN;
    CarregaLocalRetirada;
    CarregaLocalEntrega;
    CarregaFatura;
    CarregaPagamento;
    CarregaInformacoesAdicionais;

    SetControlsDataSets;

    // Fornecedor
    if (Trim(cdsEmitente.FieldByName('CNPJ').AsString) <> EmptyStr) then
    begin
      IdentificarFornecedor(cdsEmitente.FieldByName('CNPJ').AsString);
      if Fornecedor.DAO.DataSet.IsEmpty then
        CadastrarFornecedor;
    end;

    // Transportadora
    if (Trim(cdsTransportador.FieldByName('CNPJCPF').AsString) <> EmptyStr) then
    begin
      IdentificarTransportadora(cdsTransportador.FieldByName('CNPJCPF').AsString);
      if Fornecedor.DAO.DataSet.IsEmpty then
        CadastrarTransportadora;
    end;
  finally
    pgcNFe.ActivePage := tbsNFe;
    cdsDadosProdutos.First;

    WaitAMomentFree;
  end;
end;

procedure TViewNFEImportar.CarregaDadosProdutos;
var
  inItem : Integer;
begin
  if not cdsParametros.Active then
    CarregaParametros;

  cdsParametros.First;

  // verificar se e DANFE detalhado
  // dados dos produtos
  with cdsDadosProdutos, DMNFe, ACBrNFe, NotasFiscais.Items[0], frDANFE do
  begin
    Close;
    CreateDataSet;
    if (NFe.Ide.modelo <> 65) then
    begin
      for inItem := 0 to NFe.Det.Count - 1 do
      begin
        Append;
        with NFe.Det.Items[inItem] do
        begin
          IdentificarProduto(FieldByName('ID')
            , Trim(Prod.cProd)
            , TServicesUtils.StrOnlyNumbers(cdsEmitente.FieldByName('CNPJ').AsString));

          FieldByName('ChaveNFe').AsString         := NFe.infNFe.ID;
          FieldByName('cProd').AsString            := frDANFE.ManterCodigo( Prod.cEAN,Prod.cProd);
          FieldByName('cEAN').AsString             := Prod.cEAN;
          FieldByName('XProd').AsString            := StringReplace( Prod.xProd, ';', #13, [rfReplaceAll]);
          FieldByName('VProd').AsString            := ManterVprod( Prod.VProd , Prod.vDesc );
          FieldByName('vTotTrib').AsString         := ManterdvTotTrib( Imposto.vTotTrib );
          FieldByName('infAdProd').AsString        := ManterinfAdProd(NFe, inItem);
          FieldByName('DescricaoProduto').AsString := ManterXProd(NFe, inItem);
          FieldByName('NCM').AsString              := Prod.NCM;
          FieldByName('EXTIPI').AsString           := Prod.EXTIPI;
          FieldByName('genero').AsString           := '';
          FieldByName('CFOP').AsString             := Prod.CFOP;
          FieldByName('Ucom').AsString             := Prod.UCom;
          FieldByName('QCom').AsFloat              := Prod.QCom;
          FieldByName('VUnCom').AsFloat            := Prod.VUnCom;
          FieldByName('cEANTrib').AsString         := Prod.cEANTrib;
          FieldByName('UTrib').AsString            := Prod.uTrib;
          FieldByName('QTrib').AsFloat             := Prod.qTrib;
          FieldByName('VUnTrib').AsFloat           := Prod.vUnTrib;
          FieldByName('vFrete').AsString           := FormatFloatBr( Prod.vFrete ,'###,###,##0.00');
          FieldByName('vSeg').AsString             := FormatFloatBr( Prod.vSeg   ,'###,###,##0.00');
          FieldByName('vOutro').AsString           := FormatFloatBr( Prod.vOutro ,'###,###,##0.00');
          FieldByName('vDesc').AsString            := FormatFloatBr( ManterVDesc( Prod.vDesc , Prod.VUnCom , Prod.QCom),'###,###,##0.00');
          FieldByName('ORIGEM').AsString           :=     OrigToStr( Imposto.ICMS.orig );
          FieldByName('CST').AsString              :=     ManterCst( NFe.Emit.CRT , Imposto.ICMS.CSOSN , Imposto.ICMS.CST );
          FieldByName('VBC').AsString              := FormatFloatBr( Imposto.ICMS.vBC        ,'###,###,##0.00');
          FieldByName('PICMS').AsString            := FormatFloatBr( Imposto.ICMS.pICMS      ,'###,###,##0.00');
          FieldByName('VICMS').AsString            := FormatFloatBr( Imposto.ICMS.vICMS      ,'###,###,##0.00');
          FieldByName('VBCST').AsString            := FormatFloatBr( Imposto.ICMS.vBcST      ,'###,###,##0.00');
          FieldByName('VICMSST').AsString          := FormatFloatBr( Imposto.ICMS.vICMSST    ,'###,###,##0.00');
          FieldByName('VIPI').AsString             := FormatFloatBr( Imposto.IPI.VIPI        ,'###,###,##0.00');
          FieldByName('PIPI').AsString             := FormatFloatBr( Imposto.IPI.PIPI        ,'###,###,##0.00');
          FieldByName('vISSQN').AsString           := FormatFloatBr( Imposto.ISSQN.vISSQN    ,'###,###,##0.00');
          FieldByName('vBcISSQN').AsString         := FormatFloatBr( Imposto.ISSQN.vBC       ,'###,###,##0.00');
          FieldByName('Valorliquido').AsString     := FormatFloatBr( Prod.vProd - Prod.vDesc ,'###,###,##0.00');
          FieldByName('ValorAcrescimos').AsString  := FormatFloatBr( Prod.vProd + Prod.vOutro,'###,###,##0.00');

//          case frDANFE.ImprimirUnQtVlComercial of
//          true:
//            begin
//              FieldByName('Unidade').AsString       := FieldByName('Ucom').AsString;
//              FieldByName('Quantidade').AsString    := FormatQuantidade( FieldByName('QCom').AsFloat );
//              FieldByName('ValorUnitario').AsString := FormatValorUnitario( FieldByName('VUnCom').AsFloat );
//            end;
//          false:
//            begin
//              FieldByName('Unidade').AsString       := FieldByName('UTrib').AsString;
//              FieldByName('Quantidade').AsString    := FormatQuantidade( FieldByName('QTrib').AsFloat );
//              FieldByName('ValorUnitario').AsString := FormatValorUnitario( FieldByName('VUnTrib').AsFloat);
//            end;
//          end;

          if DANFE.Owner is TACBrNFeDANFEClass then
          begin
            case TACBrNFeDANFEClass(DANFE.Owner).ImprimeValor of
            iuComercial:
              begin
                FieldByName('Unidade').AsString       := FieldByName('Ucom').AsString;
                FieldByName('Quantidade').AsString    := frDANFE.FormatarQuantidade( FieldByName('QCom').AsFloat );
                FieldByName('ValorUnitario').AsString := frDANFE.FormatarValorUnitario( FieldByName('VUnCom').AsFloat );
              end;
            iuTributavel:
              begin
                FieldByName('Unidade').AsString       := FieldByName('UTrib').AsString;
                FieldByName('Quantidade').AsString    := frDANFE.FormatarQuantidade( FieldByName('QTrib').AsFloat );
                FieldByName('ValorUnitario').AsString := frDANFE.FormatarValorUnitario( FieldByName('VUnTrib').AsFloat);
              end;
            iuComercialETributavel:
              begin
                if FieldByName('Ucom').AsString = FieldByName('UTrib').AsString then
                begin
                  FieldByName('Unidade').AsString       := FieldByName('Ucom').AsString;
                  FieldByName('Quantidade').AsString    := frDANFE.FormatarQuantidade( FieldByName('QCom').AsFloat );
                  FieldByName('ValorUnitario').AsString := frDANFE.FormatarValorUnitario( FieldByName('VUnCom').AsFloat );
                end
                else
                begin
                  FieldByName('Unidade').AsString       := frDANFE.ManterUnidades(FieldByName('Ucom').AsString, FieldByName('UTrib').AsString);
                  FieldByName('Quantidade').AsString    := frDANFE.ManterQuantidades(FieldByName('QCom').AsFloat, FieldByName('QTrib').AsFloat);
                  FieldByName('ValorUnitario').AsString := frDANFE.ManterValoresUnitarios(FieldByName('VUnCom').AsFloat, FieldByName('VUnTrib').AsFloat);
                end;
              end;
            end;
            FieldByName('vDesc').AsString  := FormatFloatBr( TACBrNFeDANFEClass(frDANFE).ManterVDesc( Prod.vDesc , Prod.VUnCom , Prod.QCom),'###,###,##0.00');
          end
          else
          begin
            FieldByName('Unidade').AsString       := FieldByName('Ucom').AsString;
            FieldByName('Quantidade').AsString    := frDANFE.FormatarQuantidade( FieldByName('QCom').AsFloat );
            FieldByName('ValorUnitario').AsString := frDANFE.FormatarValorUnitario( FieldByName('VUnCom').AsFloat );
            FieldByName('vDesc').AsString         := FormatFloatBr( Prod.vDesc,'###,###,##0.00');
          end;

          Post;
        end;
      end;
    end;
  end;
end;

procedure TViewNFEImportar.CarregaDestinatario;
begin
  { destinatário }
  with cdsDestinatario, DMNFe, ACBrNFe, NotasFiscais.Items[0], frDANFE do
  begin
    Close;
    CreateDataSet;
    Append;

    with NFe.Dest do
    begin
      if NaoEstaVazio(idEstrangeiro) then
        FieldByName('CNPJCPF').AsString := idEstrangeiro
      else
        FieldByName('CNPJCPF').AsString := FormatarCNPJouCPF(CNPJCPF);

      FieldByName('IE').AsString        := IE;
      FieldByName('XNome').AsString     := XNome;
      with EnderDest do
      begin
        FieldByName('XLgr').AsString    := XLgr;
        FieldByName('Nro').AsString     := Nro;
        FieldByName('XCpl').AsString    := XCpl;
        FieldByName('XBairro').AsString := XBairro;
        FieldByName('CMun').AsString    := IntToStr(CMun);
        FieldByName('XMun').AsString    := CollateBr(XMun);
        FieldByName('UF').AsString      := UF;
        FieldByName('CEP').AsString     := FormatarCEP(CEP);
        FieldByName('CPais').AsString   := IntToStr(CPais);
        FieldByName('XPais').AsString   := XPais;
        FieldByName('Fone').AsString    := FormatarFone(Fone);
      end;

      FieldByName('Consumidor').AsString := '';

      if (cdsIdentificacao.FieldByName('Mod_').AsString = '65') then
      begin
        if NaoEstaVazio(idEstrangeiro) then
          FieldByName('Consumidor').AsString := 'ESTRANGEIRO: ' + Trim(FieldByName('CNPJCPF').AsString) + ' ' + trim(FieldByName('XNome').AsString)
        else
        begin
          if (FieldByName('CNPJCPF').AsString = '') then
            FieldByName('Consumidor').AsString := ACBrStr('CONSUMIDOR NÃO IDENTIFICADO')
          else
            FieldByName('Consumidor').AsString :=
              IfThenX(Length(CNPJCPF) = 11, 'CPF: ', 'CNPJ: ') + Trim(FieldByName('CNPJCPF').AsString) + ' ' + trim(FieldByName('XNome').AsString);
        end;

        if Trim(FieldByName('XLgr').AsString) <> '' then
          FieldByName('Consumidor').AsString := FieldByName('Consumidor').AsString + #13 +
            Trim(FieldByName('XLgr').AsString) + ', ' + Trim(FieldByName('Nro').AsString);

        if Trim(FieldByName('XMun').AsString) <> '' then
          FieldByName('Consumidor').AsString := FieldByName('Consumidor').AsString + #13 +
            Trim(FieldByName('XBairro').AsString) + ' - ' +
            Trim(FieldByName('XMun').AsString) + '/' +
            Trim(FieldByName('UF').AsString);
      end;
    end;
    Post;
  end;
end;

procedure TViewNFEImportar.CarregaDuplicatas;
var
  i: Integer;
begin
  cdsDuplicatas.Close;
  cdsDuplicatas.CreateDataSet;
  with DMNFe.ACBrNFe.NotasFiscais.Items[0] do
    if Not ( DMNFe.frDANFE.ExibeCampoFatura and (NFe.Ide.indPag = ipVista) and (NFe.infNFe.Versao <= 3.10) ) then
    begin

      with cdsDuplicatas, DMNFe, ACBrNFe do
      begin
        for i := 0 to NFe.Cobr.Dup.Count - 1 do
        begin
          Append;
          with NFe.Cobr.Dup[i] do
          begin
            FieldByName('ChaveNFe').AsString  := NFe.infNFe.ID;
            FieldByName('NDup').AsString      := NDup;
            FieldByName('DVenc').AsString     := FormatDateBr(DVenc);
            FieldByName('VDup').AsFloat       := VDup;
          end;
          Post;
        end;
      end;

    end;
end;

procedure TViewNFEImportar.CarregaEmitente;
begin
  { emitente }
  with cdsEmitente, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;

    with NFe.Emit do
    begin
      FieldByName('CNPJ').AsString  := FormatarCNPJ(CNPJCPF);
      FieldByName('XNome').AsString := DANFE.ManterNomeImpresso( XNome , XFant );
      FieldByName('XFant').AsString := XFant;

      with EnderEmit do
      begin
        FieldByName('Xlgr').AsString    := XLgr;
        FieldByName('Nro').AsString     := Nro;
        FieldByName('XCpl').AsString    := XCpl;
        FieldByName('XBairro').AsString := XBairro;
        FieldByName('CMun').AsString    := IntToStr(CMun);
        FieldByName('XMun').AsString    := CollateBr(XMun);
        FieldByName('UF').AsString      := UF;
        FieldByName('CEP').AsString     := FormatarCEP(CEP);
        FieldByName('CPais').AsString   := IntToStr(CPais);
        FieldByName('XPais').AsString   := XPais;
        FieldByName('Fone').AsString    := FormatarFone(Fone);
      end;

      FieldByName('IE').AsString        := IE;
      FieldByName('IM').AsString        := IM;
      FieldByName('IEST').AsString      := IEST;
      FieldByName('CRT').AsString       := CRTToStr(CRT);

      if Trim(FieldByName('CRT').AsString) = '1' then
        FieldByName('DESCR_CST').AsString := 'CSOSN'
      else
        FieldByName('DESCR_CST').AsString := 'CST';

      cdsEmitente.FieldByName('DADOS_ENDERECO').AsString    := Trim(FieldByName('XLgr').AsString) + ', ' +
                                                                Trim(FieldByName('Nro').AsString);
	    if NaoEstaVazio(trim(FieldByName('XCpl').AsString)) then
        cdsEmitente.FieldByName('DADOS_ENDERECO').AsString  := cdsEmitente.FieldByName('DADOS_ENDERECO').AsString + ', ' +
                                                                Trim(FieldByName('XCpl').AsString);

      cdsEmitente.FieldByName('DADOS_ENDERECO').AsString    := cdsEmitente.FieldByName('DADOS_ENDERECO').AsString + ' - ' +
  										  	                                      Trim(FieldByName('XBairro').AsString) + ' - ' +
                                                                Trim(FieldByName('XMun').AsString) + ' - ' +
                                                                Trim(FieldByName('UF').AsString) +
                                                                ' - CEP: ' + Trim(FieldByName('CEP').AsString) + #13 +
		  	  				  				                                    ' Fone: ' + Trim(FieldByName('Fone').AsString);
      if NaoEstaVazio(Trim(DANFE.Site)) then
        cdsEmitente.FieldByName('DADOS_ENDERECO').AsString  := cdsEmitente.FieldByName('DADOS_ENDERECO').AsString + #13 +
                                                                Trim(DANFE.Site);
      if NaoEstaVazio(Trim(DANFE.Email)) then
        cdsEmitente.FieldByName('DADOS_ENDERECO').AsString  := cdsEmitente.FieldByName('DADOS_ENDERECO').AsString + #13 +
                                                                Trim(DANFE.Email);
    end;

    Post;
  end;
end;

procedure TViewNFEImportar.CarregaFatura;
begin
  with cdsFatura, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;

    Append;

    FieldByName('iForma').asInteger := Integer( NFe.Ide.indPag);

    case NFe.Ide.indPag of
      ipVista  : FieldByName('Pagamento').AsString := ACBrStr('PAGAMENTO À VISTA');
      ipPrazo  : FieldByName('Pagamento').AsString := ACBrStr('PAGAMENTO À PRAZO');
      ipOutras ,
      ipNenhum : FieldByName('Pagamento').AsString := ACBrStr('OUTROS');
    end;

    if NaoEstaVazio(NFe.Cobr.Fat.nFat) then
    begin
      with NFe.Cobr.Fat do
      begin
        FieldByName('nfat').AsString  := nFat;
        FieldByName('vOrig').AsFloat  := vOrig;
        FieldByName('vDesc').AsFloat  := vDesc;
        FieldByName('vLiq').AsFloat   := vLiq;
      end;
    end;

    Post;
  end;
end;

procedure TViewNFEImportar.CarregaIdentificacao;
begin
  with cdsIdentificacao, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;

    FieldByName('Id').AsString      := OnlyNumber(NFe.infNFe.Id);
    FieldByName('Chave').AsString   := FormatarChaveAcesso(NFe.infNFe.Id);
    FieldByName('CUF').AsString     := IntToStr(NFe.Ide.CUF);
    FieldByName('CNF').AsString     := IntToStr(NFe.Ide.CNF);
    FieldByName('NatOp').AsString   := NFe.Ide.NatOp;
    FieldByName('IndPag').AsString  := IndpagToStr(NFe.Ide.IndPag );
    FieldByName('Mod_').AsString    := IntToStr(NFe.Ide.Modelo);
    FieldByName('Serie').AsString   := IntToStr(NFe.Ide.Serie);
    FieldByName('NNF').AsString     := FormatarNumeroDocumentoFiscal(IntToStr(NFe.Ide.NNF));
    FieldByName('DEmi').AsString    := FormatDateBr(NFe.Ide.DEmi);
    FieldByName('DSaiEnt').AsString := IfThenX(NFe.Ide.DSaiEnt <> 0, FormatDateBr(NFe.Ide.DSaiEnt));
    FieldByName('TpNF').AsString    := tpNFToStr( NFe.Ide.TpNF );
    FieldByName('CMunFG').AsString  := IntToStr(NFe.Ide.CMunFG);
    FieldByName('TpImp').AsString   := TpImpToStr( NFe.Ide.TpImp );
    FieldByName('TpEmis').AsString  := TpEmisToStr( NFe.Ide.TpEmis );
    FieldByName('CDV').AsString     := IntToStr(NFe.Ide.CDV);
    FieldByName('TpAmb').AsString   := TpAmbToStr( NFe.Ide.TpAmb );
    FieldByName('FinNFe').AsString  := FinNFeToStr( NFe.Ide.FinNFe );
    FieldByName('ProcEmi').AsString := procEmiToStr( NFe.Ide.ProcEmi );
    FieldByName('VerProc').AsString := NFe.Ide.VerProc;
    if NFe.infNFe.versao = 2.00 then
      FieldByName('HoraSaida').AsString := IfThenX(NFe.ide.hSaiEnt = 0, '', TimeToStr(NFe.ide.hSaiEnt))
    else
      FieldByName('HoraSaida').AsString := IfThenX(TimeOf(NFe.ide.dSaiEnt)=0, '', TimeToStr(NFe.ide.dSaiEnt));

    if (NFe.Ide.Modelo = 65) then
    begin
      FieldByName('DEmi').AsString := FormatDateTimeBr(NFe.Ide.DEmi);
      if NFe.Ide.TpAmb = taHomologacao then
          FieldByName('MensagemFiscal').AsString := ACBrStr('EMITIDA EM AMBIENTE DE HOMOLOGAÇÃO - SEM VALOR FISCAL')
      else
      begin
        if NFe.Ide.tpEmis <> teNormal then
          FieldByName('MensagemFiscal').AsString := ACBrStr('EMITIDA EM CONTINGÊNCIA')
        else
          FieldByName('MensagemFiscal').AsString := ACBrStr('ÁREA DE MENSAGEM FISCAL');
      end;

      FieldByName('URL').AsString := TACBrNFe(ACBrNFe).GetURLConsultaNFCe(NFe.Ide.cUF, NFe.Ide.tpAmb, VersaoDFToDbl(Configuracoes.Geral.VersaoDF));
    end
    else
    begin
      FieldByName('MensagemFiscal').AsString := '';
      FieldByName('URL').AsString            := '';
    end;
    Post;
  end;
end;

procedure TViewNFEImportar.CarregaInformacoesAdicionais;
var
  i     : Integer;
  vTemp : TStringList;
  IndexCampo   : Integer;
  Campos       : TSplitResult;
  BufferInfCpl : String;
  TmpStr       : String;
  wContingencia: string;
  wObs         : String;
  wLinhasObs   : Integer;
begin
  with cdsInformacoesAdicionais, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;

    wLinhasObs := 0;
    with NFe.InfAdic do
    begin
      TmpStr := '';
      //Fisco
      if Length(InfAdFisco) = 0 then InfAdFisco := '';

      for i := 0 to ObsFisco.Count - 1 do
      begin
        with ObsFisco.Items[i] do
          TmpStr := TmpStr + XCampo + ': ' + XTexto + ';';
      end;
      wObs := TmpStr + InfAdFisco;
      TmpStr := '';

      //Inf. Complementar
      if Length(InfCpl) = 0 then InfCpl := '';

      for i := 0 to ObsCont.Count - 1 do
      begin
        with ObsCont.Items[i] do
          TmpStr := TmpStr + XCampo + ': ' + XTexto + ';';
      end;
      if Length(wObs) > 0 then
        wObs := wObs + ';';
      wObs := wObs + TmpStr + InfCpl;
      TmpStr := '';

      //Contingencia
      if NFe.Ide.tpEmis=teNORMAL then
        wContingencia := ''
      else
      begin
        case NFe.Ide.tpEmis of
          teOffLine,
          teContingencia,
          teFSDA,
          teSCAN,
          teSVCAN,
          teSVCRS,
          teSVCSP:
            wContingencia := ACBrStr('DANFE EM CONTINGÊNCIA, IMPRESSO EM DECORRÊNCIA DE PROBLEMAS TÉCNICOS');

          teDPEC:
          begin
            wContingencia := ACBrStr( 'DANFE IMPRESSO EM CONTINGÊNCIA - DPEC REGULARMENTE RECEBIDA PELA RECEITA FEDERAL DO BRASIL');
            wContingencia := wContingencia + ';' +
                             ACBrStr('DATA/HORA INÍCIO: ') + IfThenX(NFe.ide.dhCont = 0, ' ', DateTimeToStr(NFe.ide.dhCont)) + ';'+
                             ACBrStr('MOTIVO CONTINGÊNCIA: ') + IfThenX(EstaVazio(NFe.ide.xJust), ' ', NFe.ide.xJust);
          end;
        end;
      end;
      if Length(wObs) > 0 then
        wObs := wObs + ';';
      wObs := wObs + wContingencia;

      vTemp := TStringList.Create;
      try
        if Trim(wObs) <> '' then
        begin
          Campos := Split(';', wObs);
          for IndexCampo := 0 to Length(Campos) - 1 do
              vTemp.Add(Campos[IndexCampo]);
           wLinhasObs := 1; //TotalObS(vTemp.Text);
           TmpStr := vTemp.Text;

           BufferInfCpl := TmpStr;
        end
        else
           BufferInfCpl := '';

      finally
        vTemp.Free;
      end;
    end;

    FieldByName('OBS').AsString        := BufferInfCpl;
    FieldByName('LinhasOBS').AsInteger := wLinhasObs;

    Post;
  end;
end;

procedure TViewNFEImportar.CarregaISSQN;
begin
  with cdsISSQN, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;
    with NFe.Total.ISSQNtot do
    begin
      FieldByName('vSERV').AsFloat  := VServ;
      FieldByName('vBC').AsFloat    := VBC;
      FieldByName('vISS').AsFloat   := VISS;
    end;
    Post;
  end;
end;

procedure TViewNFEImportar.CarregaLocalEntrega;
begin
  { local de entrega }
  with cdsLocalEntrega, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;

    if NaoEstaVazio(NFe.Entrega.CNPJCPF) then
    begin
      Append;

      with NFe.Entrega do
      begin
        FieldByName('CNPJ').AsString    := FormatarCNPJouCPF(CNPJCPF);;
        FieldByName('Xlgr').AsString    := XLgr;
        FieldByName('Nro').AsString     := Nro;
        FieldByName('XCpl').AsString    := XCpl;
        FieldByName('XBairro').AsString := XBairro;
        FieldByName('CMun').AsString    := inttostr(CMun);
        FieldByName('XMun').AsString    := CollateBr(XMun);
        FieldByName('UF').AsString      := UF;
      end;
      Post;
    end;
  end;
end;

procedure TViewNFEImportar.CarregaLocalRetirada;
begin
  { local de retirada }
  with cdsLocalRetirada, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;

    if NaoEstaVazio(NFe.Retirada.CNPJCPF) then
    begin
      Append;

      with NFe.Retirada do
      begin
        FieldByName('CNPJ').AsString    := FormatarCNPJouCPF(CNPJCPF);
        FieldByName('Xlgr').AsString    := XLgr;
        FieldByName('Nro').AsString     := Nro;
        FieldByName('XCpl').AsString    := XCpl;
        FieldByName('XBairro').AsString := XBairro;
        FieldByName('CMun').AsString    := inttostr(CMun);
        FieldByName('XMun').AsString    := CollateBr(XMun);
        FieldByName('UF').AsString      := UF;
      end;
      Post;
    end;
  end;
end;

procedure TViewNFEImportar.CarregaPagamento;
var
  i : Integer;
begin
  with cdsPagamento, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    for i := 0 to NFe.Pag.Count - 1 do
    begin
      Append;
      with NFe.Pag[i] do
      begin
        FieldByName('tPag').AsString  := FormaPagamentoToDescricao( tPag );
        FieldByName('vPag').AsFloat   := vPag;
        // ver tpIntegra
        FieldByName('CNPJ').AsString  := FormatarCNPJ(CNPJ);
        FieldByName('tBand').AsString := BandeiraCartaoToDescStr( tBand );
        FieldByName('cAut').AsString  := cAut;
      end;
      Post;
    end;

    // acrescenta o troco
    if vTroco > 0 then
    begin
      Append;
      FieldByName('tPag').AsString  := 'Troco R$';
      FieldByName('vPag').AsFloat   := vTroco;
      Post;
    end;
  end;
end;

procedure TViewNFEImportar.CarregaParametros;
var
  vChave_Contingencia : String;
  vStream             : TMemoryStream;
  vStringStream       : TStringStream;
  P: Integer;
begin
  { parâmetros }
  with cdsParametros, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;

    FieldByName('poscanhoto').AsString            := IntToStr( Ord(frDANFE.PosCanhoto));
    FieldByName('ResumoCanhoto').AsString         := '';
    FieldByName('Mensagem0').AsString             := '';
    FieldByName('Contingencia_ID').AsString       := '';
    FieldByName('ConsultaAutenticidade').AsString := 'Consulta de autenticidade no portal nacional da NF-e'+#13+
                                                     'www.nfe.fazenda.gov.br/portal ou no site da Sefaz autorizadora';

    if frDANFE.Owner is TACBrNFeDANFEClass then
      FieldByName('poscanhoto').AsString := IntToStr( Ord(TACBrNFeDANFEClass(frDANFE.Owner).PosCanhoto))
    else if frDANFE.Owner is TACBrNFeDANFCEClass then
    begin
      if TACBrNFeDANFCEClass(frDANFE.Owner).ViaConsumidor then
        FieldByName('DescricaoViaEstabelec').AsString := 'Via Consumidor'
      else
        FieldByName('DescricaoViaEstabelec').AsString := 'Via Estabelecimento';
    end;

    if Assigned(NFe) then
    begin
      if (frDANFE.Owner is TACBrNFeDANFEClass) and TACBrNFeDANFEClass(frDANFE.Owner).ExibeResumoCanhoto then
      begin
         if EstaVazio(TACBrNFeDANFEClass(frDANFE.Owner).TextoResumoCanhoto) then
          FieldByName('ResumoCanhoto').AsString := ACBrStr('Emissão: ' )+ FormatDateBr(NFe.Ide.DEmi) + '  Dest/Reme: ' + NFe.Dest.XNome + '  Valor Total: ' + FormatFloatBr(NFe.Total.ICMSTot.VNF)
        else
          FieldByName('ResumoCanhoto').AsString := TACBrNFeDANFEClass(frDANFE).TextoResumoCanhoto;
      end;

      if (NFe.Ide.TpAmb = taHomologacao) then
      begin
        if (NFe.Ide.tpEmis in [teContingencia, teFSDA, teSCAN, teDPEC, teSVCAN, teSVCRS, teSVCSP]) then
        begin
          if (NFe.procNFe.cStat in [101,135, 151, 155]) then
            FieldByName('Mensagem0').AsString := ACBrStr('NFe sem Valor Fiscal - HOMOLOGAÇÃO ' +
                                                        #10#13+'NFe em Contingência - CANCELADA')
          else
            FieldByName('Mensagem0').AsString := ACBrStr('NFe sem Valor Fiscal - HOMOLOGAÇÃO'+
                                                        #10#13+'NFe em Contingência');
        end
        else
          FieldByName('Mensagem0').AsString :=ACBrStr( 'NFe sem Valor Fiscal - HOMOLOGAÇÃO')
      end
      else
      begin
        if not (NFe.Ide.tpEmis in [teContingencia, teFSDA, teSVCAN, teSVCRS, teSVCSP]) then
        begin
          //prioridade para opção Cancelada
          if (frDANFE.Cancelada) or
             ((NaoEstaVazio(NFe.procNFe.nProt)) and
              (NFe.procNFe.cStat in [101,135,151,155])) then
            FieldByName('Mensagem0').AsString := 'NFe Cancelada'
          else if ( NFe.procNFe.cStat = 110 ) or
                  ( NFe.procNFe.cStat = 301 ) or
                  ( NFe.procNFe.cStat = 302 ) or
                  ( NFe.procNFe.cStat = 303 ) then
            FieldByName('Mensagem0').AsString := 'NFe denegada pelo Fisco'
          else if ((EstaVazio(frDANFE.Protocolo)) and
                   (EstaVazio(NFe.procNFe.nProt))) then
            FieldByName('Mensagem0').AsString := ACBrStr( 'NFe sem Autorização de Uso da SEFAZ')
          else if (NFe.Ide.tpImp = tiSimplificado) then
            FieldByName('Mensagem0').AsString := ACBrStr( 'EMISSÃO NORMAL' );
        end;
      end;

      case NFe.Ide.tpEmis of
        teNormal,
        teSVCAN,
        teSCAN,
        teSVCRS,
        teSVCSP :   begin
                      FieldByName('ChaveAcesso_Descricao').AsString := 'CHAVE DE ACESSO';
                      FieldByName('Contingencia_ID').AsString := '';

                      if ((frDANFE.Cancelada) or (NFe.procNFe.cStat in [101,151,155])) then
                        FieldByName('Contingencia_Descricao').AsString := ACBrStr('PROTOCOLO DE HOMOLOGAÇÃO DO CANCELAMENTO' )
                      else if ( NFe.procNFe.cStat = 110 ) or
                              ( NFe.procNFe.cStat = 301 ) or
                              ( NFe.procNFe.cStat = 302 ) or
                              ( NFe.procNFe.cStat = 303 ) then
                        FieldByName('Contingencia_Descricao').AsString := ACBrStr('PROTOCOLO DE DENEGAÇÃO DE USO')
                      else
                        FieldByName('Contingencia_Descricao').AsString := ACBrStr('PROTOCOLO DE AUTORIZAÇÃO DE USO');

                      if EstaVazio(frDANFE.Protocolo) then
                      begin
                        if EstaVazio(NFe.procNFe.nProt) then
                          FieldByName('Contingencia_Valor').AsString := ACBrStr('NFe sem Autorização de Uso da SEFAZ')
                        else
                        begin
                          FieldByName('Contingencia_Valor').AsString := NFe.procNFe.nProt + ' ' + IfThen(NFe.procNFe.dhRecbto <> 0, FormatDateTimeBr(NFe.procNFe.dhRecbto), '');
                          FieldByName('nProt').AsString := NFe.procNfe.nProt;
                          FieldByName('dhRecbto').AsDateTime := NFe.procNFe.dhRecbto;
                        end;
                      end
                      else
                      begin
                        FieldByName('Contingencia_Valor').AsString := FrDANFE.Protocolo;
                        P := Pos('-', FrDANFE.Protocolo);
                        if P = 0 then
                        begin
                          FieldByName('nProt').AsString := Trim(FrDANFE.Protocolo);
                          FieldByName('dhRecbto').AsDateTime := 0;
                        end
                        else
                        begin
                          FieldByName('nProt').AsString := Trim(Copy(FrDANFE.Protocolo, 1, P - 1));
                          FieldByName('dhRecbto').AsDateTime := StringToDateTimeDef(Trim(
                            Copy(FrDANFE.Protocolo, P + 1, Length(FrDANFE.Protocolo) - P)
                            ), 0, 'dd/mm/yyyy hh:nn:ss');
                        end;
                      end;
                    end;

        teContingencia ,
        teFSDA :    begin
                      vChave_Contingencia := TACBrNFe(frDANFE.ACBrNFe).GerarChaveContingencia(NFe);
                      FieldByName('ChaveAcesso_Descricao').AsString  := 'CHAVE DE ACESSO';
                      FieldByName('Contingencia_ID').AsString        := vChave_Contingencia;
                      FieldByName('Contingencia_Descricao').AsString := 'DADOS DA NF-E';
                      FieldByName('Contingencia_Valor').AsString     := FormatarChaveAcesso(vChave_Contingencia);
                      FieldByName('ConsultaAutenticidade').AsString  := '';
                    end;

         teDPEC  :  begin
                      if NaoEstaVazio(NFe.procNFe.nProt) then // DPEC TRANSMITIDO
                      begin
                        FieldByName('Contingencia_Descricao').AsString := ACBrStr( 'PROTOCOLO DE AUTORIZAÇÃO DE USO');
                        FieldByName('Contingencia_Valor').AsString     := NFe.procNFe.nProt + ' ' + IfThen(NFe.procNFe.dhRecbto <> 0, FormatDateTimeBr(NFe.procNFe.dhRecbto), '');
                      end
                      else
                      begin
                        FieldByName('Contingencia_Descricao').AsString := ACBrStr('NÚMERO DE REGISTRO DPEC');
                        if NaoEstaVazio(frDANFE.Protocolo) then
                          FieldByName('Contingencia_Valor').AsString := frDANFE.Protocolo;
                      end;
                    end;

         teOffLine: begin
                      FieldByName('Contingencia_Valor').AsString := NFe.procNFe.nProt + ' ' + IfThen(NFe.procNFe.dhRecbto <> 0, FormatDateTimeBr(NFe.procNFe.dhRecbto), '');
                      FieldByName('nProt').AsString      := NFe.procNfe.nProt;
                      FieldByName('dhRecbto').AsDateTime := NFe.procNFe.dhRecbto;
                    end;
      end;

      FieldByName('QtdeItens').AsInteger := NFe.Det.Count;

    end;

    if NaoEstaVazio(FieldByName('Mensagem0').AsString) then
      FieldByName('Mensagem0').AsString  := FieldByName('Mensagem0').AsString+#10#13;

    FieldByName('Mensagem0').AsString                   := FieldByName('Mensagem0').AsString + IfThen(DANFE is TACBrNFeDANFEFR, TACBrNFeDANFEFR(DANFE).MarcaDaguaMSG, '');
    FieldByName('LogoExpandido').AsString               := IfThen( DANFE.ExpandeLogoMarca, '1' , '0' );
    FieldByName('Sistema').AsString                     := IfThen( DANFE.Sistema <> '' , DANFE.Sistema, 'Projeto ACBr - http://acbr.sf.net');
    FieldByName('Usuario').AsString                     := IfThen( DANFE.Usuario <> '' , ' - ' + DANFE.Usuario , '' );
    FieldByName('Site').AsString                        := DANFE.Site;
    FieldByName('Email').AsString                       := DANFE.Email;
    FieldByName('Desconto').AsString                    := IfThen( (DANFE is TACBrNFeDANFEClass) and TACBrNFeDANFEClass(DANFE).ImprimeDescPorPercentual , '%' , 'VALOR');
    FieldByName('TotalLiquido').AsString                := IfThen( DANFE.ImprimeTotalLiquido ,ACBrStr('LÍQUIDO') ,'TOTAL');
    FieldByName('LinhasPorPagina').AsInteger            := 0;
    FieldByName('ExpandirDadosAdicionaisAuto').AsString := IfThen(TACBrNFeDANFEFR(DANFE).ExpandirDadosAdicionaisAuto , 'S' , 'N');
    FieldByName('sDisplayFormat').AsString              := ',0.%.*d';
    FieldByName('iFormato').AsInteger                   := integer( DANFE.CasasDecimais.Formato );
    FieldByName('Mask_qCom').AsString                   := DANFE.CasasDecimais.MaskqCom;
    FieldByName('Mask_vUnCom').AsString                 := DANFE.CasasDecimais.MaskvUnCom;
    FieldByName('Casas_qCom').AsInteger                 := DANFE.CasasDecimais.qCom;
    FieldByName('Casas_vUnCom').AsInteger               := DANFE.CasasDecimais.vUnCom;

    if (DANFE is TACBrNFeDANFCEClass) then
    begin
      FieldByName('ImprimeEm1Linha').AsString        := IfThen( TACBrNFeDANFCEClass(DANFE).ImprimeEmUmaLinha, 'S', 'N');
      FieldByName('ImprimeEmDuasLinhas').AsString    := IfThen( TACBrNFeDANFCEClass(DANFE).ImprimeEmDuasLinhas, 'S', 'N');
      FieldByName('QrCodeLateral').AsString          := IfThen( TACBrNFeDANFCEClass(DANFE).ImprimeQRCodeLateral, 'S', 'N');
      FieldByName('ImprimeDescAcrescItem').AsInteger := IfThen( TACBrNFeDANFCEClass(DANFE).ImprimeDescAcrescItem, 1 , 0 );
    end;

    if (DANFE is TACBrNFeDANFEClass) then
    begin
      FieldByName('ImprimeDescAcrescItem').AsInteger := Integer(TACBrNFeDANFEClass(DANFE).ImprimeDescAcrescItem);
    end;

    // Carregamento da imagem
    if NaoEstaVazio(frDANFE.Logo) then
    begin
      FieldByName('Imagem').AsString := frDANFE.Logo;
      vStream := TMemoryStream.Create;
      try
        if FileExists(frDANFE.Logo) then
          vStream.LoadFromFile(frDANFE.Logo)
        else
        begin
          vStringStream:= TStringStream.Create(frDANFE.Logo);
          try
            vStream.LoadFromStream(vStringStream);
          finally
            vStringStream.Free;
          end;
        end;
        vStream.Position := 0;
        TBlobField(cdsParametros.FieldByName('LogoCarregado')).LoadFromStream(vStream);
      finally
        vStream.Free;
      end;
    end;

    Post;
  end;
end;

procedure TViewNFEImportar.CarregarEmpresa(const sCnpj: String);
begin
  if not Empresa.DAO.DataSet.Locate('cnpj', sCnpj, []) then
    raise Exception.Create('Empresa não identificada!');
end;

procedure TViewNFEImportar.CarregarXML(const sCnpj: String;
  aArquivoXmlNFe: String);
var
  aNomeArquivoXML,
  aEmitente      ,
  aDestinatario  ,
  aRecibo        ,
  aProtocolo     ,
  aChave         : String;
  aDataHoraEmissao : TDateTime;
  aNotaValida      : Boolean;
  aSerie  ,
  sVersao : String;
  aNumero ,
  aModelo ,
  aVersao : Integer;
  aTipoNota : TTipoNF;
  aValorNF  : Currency;
begin
  with DMNFe do
  begin
    aNotaValida := False;
    vTroco      := 0.0;

    if Trim(sCnpj) = EmptyStr then
      LerConfiguracao(Empresa.DAO.Usuario.Empresa.CNPJ, tipoDANFEFast)
    else
      LerConfiguracao(sCnpj, tipoDANFEFast);

    try
      with ACBrNFe do
      begin
        NotasFiscais.Clear;
        NotasFiscais.LoadFromFile(aArquivoXmlNFe, False);

        with NotasFiscais.Items[0].NFe do
        begin
          DANFE.Logo    := EmptyStr;
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

//          sVersao := NotasFiscais.Items[0].NFe.infNFe.VersaoStr;
//
//          if ( Trim(sVersao) = 'versao="2.00"' ) then
//            aVersao := Ord(ve200)
//          else
//          if ( Trim(sVersao) = 'versao="3.00"' ) then
//            aVersao := Ord(ve300)
//          else
//          if ( Trim(sVersao) = 'versao="3.10"' ) then
//            aVersao := Ord(ve310)
//          else
//          if ( Trim(sVersao) = 'versao="4.00"' ) then
//            aVersao := Ord(ve400);

          aVersao := Ord(ve400);
        end;

        if ( (NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC) or (not Assigned(NotasFiscais.Items[0].NFe.procNFe)) ) then
        begin
//          WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
//          WebServices.ConsultaDPEC.Executar;
//
//          DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
          WebServices.Consulta.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
          WebServices.Consulta.Executar;

          DANFE.Protocolo := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
        end;

        aNotaValida := Assigned(NotasFiscais.Items[0].NFe.procNFe);

        if aNotaValida then
        begin
          // Capiturar informações iniciais do arquivo
          aChave     := StringReplace(AnsiUpperCase(NotasFiscais.Items[0].NFe.infNFe.ID), 'NFE', '', [rfReplaceAll]);
          aProtocolo := NotasFiscais.Items[0].NFe.procNFe.nProt;
          aRecibo    := aProtocolo;
          aValorNF   := NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;

          aNomeArquivoXML := aChave + '_view.xml';
          NotasFiscais.Items[0].GravarXML(aNomeArquivoXML, ExtractFilePath(aArquivoXmlNFe));

//          if (Trim(edChaveNFe.Text) = EmptyStr) then
//            edChaveNFe.Text := aChave;
//
//          if (Trim(edChaveNFe.Text) <> aChave) then
//          begin
//            ShowError('Arquivo selecionado não pertence a chave informada!');
//            Exit;
//          end;

          edChaveNFe.Text    := aChave;
          edChaveNFe.Enabled := False;

          // Ler arquivo por completo e identificar os dados já referenciados
          CarregaDadosNFe;
        end;
      end;
    except
      On E : Exception do
        TServiceMessage.ShowError('Erro ao tentar validar/carregar XML da NF-e.' + #13 +
          'Arquivo XML inválido!' + #13#13 +
          'ImprimirArquivoNFeDANFE() --> ' + e.Message);
    end;
  end;
end;

procedure TViewNFEImportar.CarregaTransportador;
var
  ok : Boolean;
begin
  with cdsTransportador, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;

    with NFe, NFe.Transp do
    begin
      FieldByName('ModFrete').AsString := modFreteToDesStr( ModFrete, DblToVersaoDF(ok, infNFe.Versao) );
      with Transporta do
      begin
        FieldByName('CNPJCPF').AsString := FormatarCNPJouCPF(CNPJCPF);
        FieldByName('XNome').AsString   := XNome;
        FieldByName('IE').AsString      := IE;
        FieldByName('XEnder').AsString  := XEnder;
        FieldByName('XMun').AsString    := CollateBr(XMun);
        FieldByName('UF').AsString      := UF;
      end;
    end;
    Post;
  end;
end;

procedure TViewNFEImportar.CarregaVeiculo;
begin
  with cdsVeiculo, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    Append;
    with NFe.Transp.VeicTransp do
    begin
      FieldByName('PLACA').AsString := Placa;
      FieldByName('UF').AsString    := UF;
      FieldByName('RNTC').AsString  := RNTC;
    end;

    Post;
  end;
end;

procedure TViewNFEImportar.CarregaVolumes;
var
  i: Integer;
begin
  with cdsVolumes, DMNFe, ACBrNFe, NotasFiscais.Items[0] do
  begin
    Close;
    CreateDataSet;
    for i := 0 to NFe.Transp.Vol.Count - 1 do
    begin
      Append;
      with NFe.Transp.Vol[i] do
      begin
        FieldByName('QVol').AsFloat   := QVol;
        FieldByName('Esp').AsString   := Esp;
        FieldByName('Marca').AsString := Marca;
        FieldByName('NVol').AsString  := NVol;
        FieldByName('PesoL').AsFloat  := PesoL;
        FieldByName('PesoB').AsFloat  := PesoB;
      end;
      Post;
    end;
  end;
end;

function TViewNFEImportar.CollateBr(Str: String): String;
var
  Resultado,Temp: string;
  vChar: Char;
  Tamanho, i: integer;
begin
  Result := '';
  Tamanho := Length(str);
  i := 1;
  while i <= Tamanho do
  begin
    Temp := Copy(str,i,1);
    vChar := Temp[1];
    case vChar of
      'á', 'â', 'ã', 'à', 'ä', 'å', 'Á', 'Â', 'Ã', 'À', 'Ä', 'Å': Resultado := 'A';
      'é', 'ê', 'è', 'ë', 'É', 'Ê', 'È', 'Ë': Resultado := 'E';
      'í', 'î', 'ì', 'ï', 'Í', 'Î', 'Ì', 'Ï': Resultado := 'I';
      'ó', 'ô', 'õ', 'ò', 'ö', 'Ó', 'Ô', 'Õ', 'Ò', 'Ö': Resultado := 'O';
      'ú', 'û', 'ù', 'ü', 'Ú', 'Û', 'Ù', 'Ü': Resultado := 'U';
      'ç', 'Ç': Resultado := 'C';
      'ñ', 'Ñ': Resultado := 'N';
      'ý', 'ÿ', 'Ý', 'Y': Resultado := 'Y';
    else
      if vChar > #127 then Resultado := #32
      {$IFDEF DELPHI12_UP}
      else if CharInset(vChar, ['a'..'z','A'..'Z','0'..'9','-',' ',Chr(39)]) then
      {$ELSE}
      else if vChar in ['a'..'z','A'..'Z','0'..'9','-',' ',Chr(39)] then
      {$ENDIF}
        Resultado := UpperCase(vCHAR);
    end;
    Result := Result + Resultado;
    i := i + 1;
  end;
end;

procedure TViewNFEImportar.edArquivoXMLPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  with DMNFe do
  begin
    edArquivoXML.Text := Trim(edArquivoXML.Text);
    if (edArquivoXML.Text <> EmptyStr) then
    begin
      if not DirectoryExists( ExtractFilePath(edArquivoXML.Text) ) then
        ForceDirectories( ExtractFilePath(edArquivoXML.Text) );
      opdNotas.InitialDir := edArquivoXML.Text;
    end;

    if opdNotas.Execute then
    begin
      edArquivoXML.Text := opdNotas.FileName;
      CarregarXML(Empresa.DAO.Usuario.Empresa.CNPJ, Trim(edArquivoXML.Text));
    end;
  end;
end;

procedure TViewNFEImportar.edArquivoXMLPropertiesChange(Sender: TObject);
begin
  btnConfirmar.Enabled := FileExists(Trim(edArquivoXML.Text));
  btnImprimir.Enabled  := FileExists(Trim(edArquivoXML.Text));
end;

procedure TViewNFEImportar.edFornecedorCadastroButtonClick(Sender: TObject);
var
  aCodigo : Integer;
  aCNPJ   ,
  aNome   : String;
begin
  aCnpj := dbCNPJ.Text;
  aNome := dbXNome.Text;
  if SelecionarFornecedor(Self, aCodigo, aCnpj, aNome) then
    IdentificarFornecedor(aCNPJ);
end;

function TViewNFEImportar.Empresa: IControllerEmpresa;
begin
  if (not Assigned(FControllerEmpresaView)) then
    FControllerEmpresaView := TControllerFactory.New.EmpresaView;

  if not Assigned(dtsEmpresa.DataSet) then
    dtsEmpresa.DataSet := FControllerEmpresaView.DAO.DataSet;

  Result := (FControllerEmpresaView as IControllerEmpresa);
end;

//function TfrmGeImportarNFE.Explode(sPart, sInput: String): ArrOfStr;
//begin
//  while Pos(sPart, sInput) <> 0 do
//    begin
//      SetLength(Result, Length(Result) + 1);
//      Result[Length(Result) - 1] := Copy(sInput, 0, Pos(sPart, sInput) - 1);
//      Delete(sInput, 1, Pos(sPart, sInput));
//    end;
//
//  SetLength(Result, Length(Result) + 1);
//  Result[Length(Result) - 1] := sInput;
//end;
//
//function TfrmGeImportarNFE.FormatQuantidade(dValor: Double): String;
//begin
//  With cdsParametros do
//  begin
//     case FieldByName('iFormato').AsInteger of
//      0 : Result := FormatFloatBr( dValor , format(FieldByName('sDisplayFormat').AsString, [FieldByName('Casas_qCom').AsInteger, 0]));
//      1 : Result := FormatFloatBr( dValor , FieldByName('Mask_qCom').AsString);
//      else
//        Result := FormatFloatBr( dValor , format(FieldByName('sDisplayFormat').AsString, [FieldByName('Casas_qCom').AsInteger, 0]));
//    end;
//  end;
//end;
//
//function TfrmGeImportarNFE.FormatValorUnitario(dValor: Double): String;
//begin
//  With cdsParametros do
//  begin
//    case FieldByName('iFormato').AsInteger of
//      0 : Result := FormatFloatBr( dValor , format(FieldByName('sDisplayFormat').AsString, [FieldByName('Casas_vUnCom').AsInteger, 0]));
//      1 : Result := FormatFloatBr( dValor , FieldByName('Mask_vUnCom').AsString);
//      else
//        Result := FormatFloatBr( dValor , format(FieldByName('sDisplayFormat').AsString, [FieldByName('Casas_vUnCom').AsInteger, 0]));
//    end;
//  end;
//end;

procedure TViewNFEImportar.FormCreate(Sender: TObject);
begin
  FControllerNotaImportada := TControllerFactory.New.XML_NFeImportada;
  dtsNota.DataSet := FControllerNotaImportada.DAO.DataSet;

  inherited;
  // Forçar a criação dos registros padrões de grupos de fornecedores
  TControllerFactory.New.GrupoFornecedor.DAO.OpenEmpty;

  SetDataSetsXML;

  CarregarEmpresa(Empresa.DAO.Usuario.Empresa.CNPJ);
  btnManifesto.Enabled := Empresa.GetPermitirEmissaoNFe(Empresa.DAO.Usuario.Empresa.CNPJ) and Empresa.DAO.Configuracao.Certificado(Empresa.DAO.Usuario.Empresa.CNPJ).Instalado;
  pgcNFe.ActivePage    := tbsNFe;

  DMNFe.LerConfiguracao(Empresa.DAO.Usuario.Empresa.CNPJ);
  edArquivoXML.Text := StringReplace(DMNFe.ACBrNFe.Configuracoes.Arquivos.PathSalvar + '\Down\', '\\', '\', [rfReplaceAll]);

  FNSU := EmptyStr;

  btnConfirmar.Visible := False;
end;

procedure TViewNFEImportar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_F5 ) then
  begin
    if Clipboard.HasFormat( CF_TEXT ) then
      if ( Length(Trim(Clipboard.AsText)) = NFE_TAMANHO_NUMERO_CHAVE ) then // 15160414547157000146650010000000061000000065
        edChaveNFe.Text := Trim(Clipboard.AsText);
  end
  else
    inherited;
end;

function TViewNFEImportar.Fornecedor: IControllerFornecedor;
begin
  if (not Assigned(FControllerFornecedor)) then
    FControllerFornecedor := TControllerFactory.New.Fornecedor;

  Result := (FControllerFornecedor as IControllerFornecedor);
end;

procedure TViewNFEImportar.GrdProdutosDBTableViewCadastroPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
  aProduto : TProdutoServico;
begin
  if not cdsDadosProdutos.IsEmpty then
    if SelecionarProdutoParaEntrada(Self, aProduto) then
    begin
      cdsDadosProdutos.Edit;
      cdsDadosProdutos.FieldByName('ID').AsString := aProduto.aCodigoAlfa;
    end;
end;

procedure TViewNFEImportar.GrdProdutosEnter(Sender: TObject);
begin
  if not cdsDadosProdutos.IsEmpty then
  begin
    Self.OnKeyDown := nil;
    cdsDadosProdutos.Edit;
  end;
end;

procedure TViewNFEImportar.GrdProdutosExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
end;

procedure TViewNFEImportar.IdentificarFornecedor(const aCnpj: String);
begin
  Fornecedor
    .DAO
      .Close
      .ClearWhere;

  Fornecedor
    .DAO
      .Where('f.cnpj = :cnpj')
      .ParamsByName('cnpj', TServicesUtils.StrOnlyNumbers(aCnpj))
    .Open;

  edFornecedorCadastro.Text := FormatFloat('###00000', Fornecedor.DAO.DataSet.FieldByName('codforn').AsInteger);
  edFornecedorCadastro.Hint := aCnpj;
end;

procedure TViewNFEImportar.IdentificarProduto(aCampo: TField; const aProduto,
  aCnpjFornecedor: String);
begin
  if (aCampo.DataSet.State in [dsEdit, dsInsert]) then
    aCampo.AsString := ProdutoFornecedor.GetProdutoFornecedorCodigo(TServicesUtils.StrOnlyNumbers(aCnpjFornecedor), aProduto.Trim);
end;

procedure TViewNFEImportar.IdentificarTransportadora(const aCnpj: String);
begin
  Fornecedor
    .DAO
      .Close
      .ClearWhere;

  Fornecedor
    .DAO
      .Where('f.cnpj = :cnpj')
      .ParamsByName('cnpj', TServicesUtils.StrOnlyNumbers(aCnpj))
    .Open;

  edTransportadoraCadastro.Text := FormatFloat('###00000', Fornecedor.DAO.DataSet.FieldByName('codforn').AsInteger);
  edTransportadoraCadastro.Hint := aCnpj;
end;

function TViewNFEImportar.IfThenX(AValue: Boolean; const ATrue: String;
  AFalse: string): string;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

procedure TViewNFEImportar.LimparDadosRelacao;
begin
  edFornecedorCadastro.Text := EmptyStr;
  edFornecedorCadastro.Hint := EmptyStr;
end;

function TViewNFEImportar.ProdutoFornecedor: IControllerFornecedorProduto;
begin
  if (not Assigned(FControllerProdutoFornecedor)) then
    FControllerProdutoFornecedor := TControllerFactory.New.FornecedorProduto;

  Result := (FControllerProdutoFornecedor as IControllerFornecedorProduto);
end;

//function TfrmGeImportarNFE.ManterArma(inItem: integer): String;
//Var
//  i : Integer;
//begin
//  Result := '';
//  with DMNFe, ACBrNFe, NotasFiscais.Items[0].NFe.Det.Items[inItem].Prod do
//  begin
//    if Assigned(arma) and ( arma.Count > 0) then
//    begin
//      Result := sQuebraLinha;
//      for i := 0 to arma.Count - 1 do
//      begin
//        Result := Result + ACBrStr('TIPO DE ARMA: ')   + ArmaTipoStr( arma.Items[i].tpArma ) + sQuebraLinha;
//        Result := Result + ACBrStr('No. SÉRIE ARMA: ') + arma.Items[i].nSerie + sQuebraLinha;
//        Result := Result + ACBrStr('No. SÉRIE CANO: ') + arma.Items[i].nCano + sQuebraLinha;
//        Result := Result + ACBrStr('DESCRIÇÃO ARMA: ') + arma.Items[i].descr + ';';
//       end;
//    end;
//  end;
//end;
//
//function TfrmGeImportarNFE.ManterCombustivel(inItem: integer): String;
//begin
//  Result := '';
//  with DMNFe, ACBrNFe, NotasFiscais.Items[0].NFe.Det.Items[inItem].Prod do
//  begin
//    if comb.cProdANP > 0 then
//    begin
//      Result := sQuebraLinha;
//      Result := Result + ACBrStr( 'CÓD. PRODUTO ANP: ') + IntToStr(comb.cProdANP) + sQuebraLinha;
//      Result := Result + IfThenX( comb.CODIF > '', ACBrStr( 'AUTORIZAÇÃO/CODIF: ') + comb.CODIF + sQuebraLinha , '');
//      Result := Result + IfThenX( comb.qTemp > 0 , ACBrStr( 'QTD. FATURADA TEMP. AMBIENTE: ' ) + FormatFloat('###,##0.0000', comb.qTemp) + sQuebraLinha , '');
//      Result := Result + ACBrStr('UF DE CONSUMO: ') + comb.UFcons + sQuebraLinha;
//      if comb.CIDE.qBCProd > 0 then
//      begin
//        Result := Result + ACBrStr('BASE DE CÁLCULO CIDE: ') + FormatFloat('###,##0.0000', comb.CIDE.qBCProd) + sQuebraLinha;
//        Result := Result + ACBrStr('ALÍQUOTA CIDE: ') + FormatFloat('###,##0.0000', comb.CIDE.vAliqProd) + sQuebraLinha;
//        Result := Result + ACBrStr('VALOR CIDE: ') + FormatFloat('###,##0.00', comb.CIDE.vCIDE);
//      end;
//      if comb.encerrante.nBico > 0  then
//      begin
//        Result := Result + 'ENCERRANTE' + sQuebraLinha;
//        Result := Result + 'BICO: ' +  IntToStr( comb.encerrante.nBico ) + sQuebraLinha;
//        Result := Result + IfThenX( comb.encerrante.nBomba > 0, 'BOMBA: ' + IntToStr(comb.encerrante.nBomba) + sQuebraLinha , '');
//        Result := Result + 'TANQUE: ' + IntToStr(comb.encerrante.nTanque) + sQuebraLinha;
//        Result := Result + ACBrStr('NO INÍCIO: ' ) + FormatFloat('###,##0.000', comb.encerrante.vEncIni) + sQuebraLinha;
//        Result := Result + 'NO FINAL: ' + FormatFloat('###,##0.000', comb.encerrante.vEncFin) + sQuebraLinha;
//      end;
//    end;
//  end;
//end;
//
//function TfrmGeImportarNFE.ManterCst(dCRT: TpcnCRT; dCSOSN: TpcnCSOSNIcms;
//  dCST: TpcnCSTIcms): String;
//begin
//  if dCRT = crtSimplesNacional then
//    Result := CSOSNIcmsToStr(dCSOSN)
//  else
//    Result := CSTICMSToStr(dCST);
//end;
//
//function TfrmGeImportarNFE.ManterDescricaoProduto(sXProd,
//  sinfAdProd: String): String;
//begin
//  Result := trim( sXProd );
//  if sinfAdProd <> '' then
//    Result := Result +#13+ trim( sinfAdProd );
//end;
//
//function TfrmGeImportarNFE.ManterdvTotTrib(dvTotTrib: Double): String;
//Var
//  dValor : Double;
//begin
//  if DMNFe.frDANFE.ExibeTotalTributosItem then
//    dValor := dvTotTrib
//  else
//    dValor := 0;
//  Result := FormatFloatBr( dValor,'###,###,##0.00');
//end;
//
//function TfrmGeImportarNFE.ManterInfAProd(inItem: Integer;
//  sinfAdProd: String): String;
//var
//  Campos2     : TSplitResult;
//  IndexCampo2 : Integer;
//  vTemp2      : TStringList;
//begin
//  vTemp2  := TStringList.create;
//  try
//    Result  := sinfAdProd;
//    Result  := Result + ManterValAprox( inItem );
////    if DMNFe.frDANFE.ImprimirDetalhamentoEspecifico then
//    if DMNFe.frDANFE.ExpandirDadosAdicionaisAuto then
//    begin
//      sQuebraLinha := QuebraLinha;
//      Result := Result + ManterVeiculos( inItem  );
//      Result := Result + ManterMedicamentos( inItem  );
//      Result := Result + ManterArma( inItem  );
//      Result := Result + ManterCombustivel( inItem );
//    end;
//
//    if Trim(Result) <> '' then
//    begin
//      Campos2 := Split(';', Result);
//
//      for IndexCampo2 := 0 to Length(Campos2) - 1 do
//        vTemp2.Add(Trim(Campos2[IndexCampo2]));
//
//      Result  := #13 + Trim(vTemp2.Text);
//    end;
//  finally
//    vTemp2.free;
//  end;
//end;
//
//function TfrmGeImportarNFE.ManterMedicamentos(inItem: integer): String;
//Var
//  i : Integer;
//begin
//  Result := '';
//  { detalhamento específico de medicamentos }
//  with DMNFe, ACBrNFe, NotasFiscais.Items[0].NFe.Det.Items[inItem].Prod do
//  begin
//    if med.Count > 0 then
//    begin
//      Result := sQuebraLinha;
//      for i := 0 to med.Count - 1 do
//      begin
//        Result := Result + 'LOTE: ' + med.Items[i].nLote+ sQuebraLinha;
//        Result := Result + 'QTD: '  + FormatFloatBr(med.Items[i].qLote)+ sQuebraLinha;
//        Result := Result + 'FAB: '  + FormatDateBr(med.Items[i].dFab)+ sQuebraLinha;
//        Result := Result + 'VAL: '  + FormatDateBr(med.Items[i].dVal)+ sQuebraLinha;
//        Result := Result + IfThenX( med.Items[i].vPMC  > 0, 'PMC: ' + FormatFloatBr(med.Items[i].vPMC) + ';' , '');
//      end;
//    end;
//  end;
//end;
//
//function TfrmGeImportarNFE.ManterValAprox(inItem: Integer): String;
//begin
//  Result := '';
//  with DMNFe, ACBrNFe, NotasFiscais.Items[0].NFe.Det.Items[inItem] do
//  begin
//    if (Imposto.vTotTrib <> 0)  and (frDANFE.ExibeTotalTributosItem) then
//    begin
//      Result := '';
//      with Imposto do
//      begin
//        Result := Result+'Val Aprox Tributos: '+ FloatToStrF(Imposto.vTotTrib,ffCurrency,15,2);
//        if frDANFE.TributosPercentual = ptValorNF then
//          Result := Result+' ('+FloatToStrF(((StringToFloatDef(FloatToStr(Imposto.vTotTrib),0)*100)/(StringToFloatDef(FloatToStr(Prod.VProd),0) +
//                                StringToFloatDef(FloatToStr(Prod.vFrete),0)  +
//                                StringToFloatDef(FloatToStr(Prod.vOutro),0)  +
//                                StringToFloatDef(FloatToStr(Prod.vSeg),0)    +
//                                StringToFloatDef(FloatToStr(IPI.vIPI), 0)    +
//                                StringToFloatDef(FloatToStr(ICMS.vICMSST), 0))),ffNumber,15,2)+'%)'
//        else
//          Result := Result+' ('+FloatToStrF(((StringToFloatDef(FloatToStr(Imposto.vTotTrib),0)*100)/(StringToFloatDef(FloatToStr(Prod.VProd),0))),ffNumber,15,2)+'%)';
//      end;
//    end;
//  end;
//end;
//
//function TfrmGeImportarNFE.ManterVDesc(dvDesc: Currency; dVUnCom,
//  dQCom: double): Double;
//begin
////  if ( DMNFe.frDANFE.ImprimirDescPorc ) then
//  if ( True ) then
//  begin
//    if ( ( dvDesc  > 0 ) and ( dVUnCom > 0 ) and ( dQCom   > 0 ) ) then
//      Result := (( dvDesc*100 ) / (dVUnCom * dQCom) )
//    else
//      Result := 0;
//  end
//  else
//    Result := dvDesc;
//end;
//
//function TfrmGeImportarNFE.ManterVeiculos(inItem: integer): String;
//begin
//  Result := '';
//{ detalhamento especifico de veículos }
//  with DMNFe, ACBrNFe, NotasFiscais.Items[0].NFe.Det.Items[inItem].Prod do
//  begin
//    if veicProd.chassi > '' then
//    begin
//      Result := sQuebraLinha;
//	    Result := Result + ACBrStr('TIPO DE OPERAÇÃO: ' + VeiculosTipoOperStr( veicProd.tpOP ) ) + sQuebraLinha;
//	    Result := Result + ACBrStr('CHASSI: ' )+ veicProd.chassi + sQuebraLinha;
//	    Result := Result + ACBrStr('CÓDIGO DA COR: ' )+ veicProd.cCor + sQuebraLinha;
//	    Result := Result + ACBrStr('NOME DA COR: ') + veicProd.xCor + sQuebraLinha;
//	    Result := Result + ACBrStr('POTÊNCIA DO MOTOR: ') + veicProd.pot + sQuebraLinha;
//	    Result := Result + ACBrStr('CILINDRADAS: ') + veicProd.Cilin + sQuebraLinha;
//	    Result := Result + ACBrStr('PESO LÍQUIDO: ') + veicProd.pesoL + sQuebraLinha;
//	    Result := Result + ACBrStr('PESO BRUTO: ' )+ veicProd.pesoB + sQuebraLinha;
//	    Result := Result + ACBrStr('NÚMERO DE SÉRIE: ') + veicProd.nSerie + sQuebraLinha;
//	    Result := Result + ACBrStr('COMBUSTÍVEL: ' + VeiculosCombustivelStr( veicProd.tpComb ) ) + sQuebraLinha;
//	    Result := Result + ACBrStr('NÚMERO DO MOTOR: ') + veicProd.nMotor + sQuebraLinha;
//	    Result := Result + ACBrStr('CAP. MÁX. TRAÇÃO: ') + veicProd.CMT + sQuebraLinha;
//	    Result := Result + ACBrStr('DISTÂNCIA ENTRE EIXOS: ') + veicProd.dist + sQuebraLinha;
//	    Result := Result + ACBrStr('ANO DO MODELO: ' )+ IntToStr(veicProd.anoMod) + sQuebraLinha;
//	    Result := Result + ACBrStr('ANO DE FABRICAÇÃO: ') + IntToStr(veicProd.anoFab) + sQuebraLinha;
//	    Result := Result + ACBrStr('TIPO DE PINTURA: ') + veicProd.tpPint + sQuebraLinha;
//	    Result := Result + ACBrStr('TIPO DE VEÍCULO: ' + VeiculosTipoStr( veicProd.tpVeic ) )+ sQuebraLinha;
//	    Result := Result + ACBrStr('ESPÉCIE DO VEÍCULO: ' +VeiculosEspecieStr( veicProd.espVeic )) + sQuebraLinha;
//	    Result := Result + ACBrStr('VIN (CHASSI): ' + VeiculosVinStr( veicProd.VIN ) )+ sQuebraLinha;
//	    Result := Result + ACBrStr('CONDIÇÃO DO VEÍCULO: ' +VeiculosCondicaoStr( veicProd.condVeic)) + sQuebraLinha;
//	    Result := Result + ACBrStr('CÓDIGO MARCA MODELO: ') + veicProd.cMod + sQuebraLinha;
//	    Result := Result + ACBrStr('CÓDIGO COR DENATRAN: ' +VeiculosCorDENATRANSTr( veicProd.cCorDENATRAN )) + sQuebraLinha;
//	    Result := Result + ACBrStr('CAP.MÁXIMA DE LOTAÇÃO: ') +IntToStr(veicProd.lota) + sQuebraLinha;
//	    Result := Result + ACBrStr('RESTRIÇÃO: ' +VeiculosRestricaoStr( veicProd.tpRest ) )+ ';';
//    end;
//  end;
//end;
//
//function TfrmGeImportarNFE.ManterVprod(dVProd, dvDesc: Double): String;
//Var
//  dValor : Double;
//begin
//  if DMNFe.frDANFE.ImprimirTotalLiquido then
//    dValor := dVProd - dvDesc
//  else
//    dValor := dVProd;
//
//  Result := FormatFloatBr( dValor,'###,###,##0.00');
//end;
//
//function TfrmGeImportarNFE.ManterVTribPerc(dVTotTrib, dVProd,
//  dVNF: Double): Double;
//begin
//  Result := 0;
//  case DMNFe.frDANFE.TributosPercentual of
//    ptPersonalizado   : Result := DMNFe.frDANFE.TributosPercentualPersonalizado;
//    ptValorProdutos   : if (dVProd > 0) then Result := dVTotTrib*100/dVProd;
//    ptValorNF         : if (dVNF   > 0) then Result := dVTotTrib*100/dVNF;
//  end;
//end;

//function TfrmGeImportarNFE.QuebraLinha: String;
//begin
//  if DMNFe.frDANFE.QuebraLinhaEmDetalhamentoEspecifico then
//    Result := ';'
//  else
//    Result := ' - ';
//end;
//
procedure TViewNFEImportar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewNFEImportar.SetControlsDataSets;
  procedure SetControlsDataSet(const aDataSet : TClientDataSet; const sSufixo : String = '');
  var
    I : Integer;
    cControle : TComponent;
  begin
    with aDataSet do
      for I := 0 to Fields.Count - 1 do
      begin
        cControle := Self.FindComponent('db' + Fields[I].FieldName + sSufixo);
        if Assigned(cControle) then
        begin
          if cControle is TDBEdit then
            TDBEdit(cControle).DataField := Fields[I].FieldName
          else
          if cControle is TDBMemo then
            TDBMemo(cControle).DataField := Fields[I].FieldName;
        end;

        // Definir formatação do campo
        if (Fields[I] is TFloatField) then
          TFloatField(Fields[I]).DisplayFormat := ',0.00';
      end;
  end;
begin
  SetControlsDataSet(cdsIdentificacao);
  SetControlsDataSet(cdsEmitente);
  SetControlsDataSet(cdsDestinatario, '_Dest');
  SetControlsDataSet(cdsCalculoImposto);
  SetControlsDataSet(cdsTransportador, '_Transp');
  SetControlsDataSet(cdsFatura, '_Fat');
end;

procedure TViewNFEImportar.SetDataSetsXML;
begin
  // cdsIdentificacao
  cdsIdentificacao := TClientDataSet.Create(Self);
  with cdsIdentificacao do
  begin
    FieldDefs.Add('Id'            , ftString, 44);
    FieldDefs.Add('Chave'         , ftString, 60);
    FieldDefs.Add('cUF'           , ftString, 2);
    FieldDefs.Add('cNF'           , ftString, 9);
    FieldDefs.Add('NatOp'         , ftString, 60);
    FieldDefs.Add('IndPag'        , ftString, 1);
    FieldDefs.Add('Mod_'          , ftString, 2);
    FieldDefs.Add('Serie'         , ftString, 3);
    FieldDefs.Add('NNF'           , ftString, 11);
    FieldDefs.Add('DEmi'          , ftString, 19);
    FieldDefs.Add('DSaiEnt'       , ftString, 10);
    FieldDefs.Add('TpNF'          , ftString, 1);
    FieldDefs.Add('CMunFG'        , ftString, 7);
    FieldDefs.Add('TpImp'         , ftString, 1);
    FieldDefs.Add('TpEmis'        , ftString, 1);
    FieldDefs.Add('CDV'           , ftString, 1);
    FieldDefs.Add('TpAmb'         , ftString, 1);
    FieldDefs.Add('FinNFe'        , ftString, 1);
    FieldDefs.Add('ProcEmi'       , ftString, 1);
    FieldDefs.Add('VerProc'       , ftString, 6);
    FieldDefs.Add('HoraSaida'     , ftString, 10);
    FieldDefs.Add('MensagemFiscal', ftString, 200);
    FieldDefs.Add('URL'           , ftString, 1000);
    CreateDataSet;
  end;
  dtsIdentificacao.DataSet := cdsIdentificacao;

  // cdsEmitente
  cdsEmitente := TClientDataSet.Create(Self);
  with cdsEmitente do
  begin
    FieldDefs.Add('ID'            , ftString, 10); // Código no Cadastros
    FieldDefs.Add('CNPJ'          , ftString, 18);
    FieldDefs.Add('XNome'         , ftString, 60);
    FieldDefs.Add('XFant'         , ftString, 60);
    FieldDefs.Add('XLgr'          , ftString, 60);
    FieldDefs.Add('Nro'           , ftString, 60);
    FieldDefs.Add('XCpl'          , ftString, 60);
    FieldDefs.Add('XBairro'       , ftString, 60);
    FieldDefs.Add('CMun'          , ftString, 7);
    FieldDefs.Add('XMun'          , ftString, 60);
    FieldDefs.Add('UF'            , ftString, 2);
    FieldDefs.Add('CEP'           , ftString, 9);
    FieldDefs.Add('CPais'         , ftString, 4);
    FieldDefs.Add('XPais'         , ftString, 60);
    FieldDefs.Add('Fone'          , ftString, 15);
    FieldDefs.Add('IE'            , ftString, 14);
    FieldDefs.Add('IM'            , ftString, 15);
    FieldDefs.Add('IEST'          , ftString, 15);
    FieldDefs.Add('CRT'           , ftString, 1);
    FieldDefs.Add('DESCR_CST'     , ftString, 30);
    FieldDefs.Add('DADOS_ENDERECO', ftString, 1000);
    CreateDataSet;
  end;
  dtsEmitente.DataSet := cdsEmitente;

  // cdsDestinatario
  cdsDestinatario := TClientDataSet.Create(Self);
  with cdsDestinatario do
  begin
    FieldDefs.Add('CNPJCPF'   , ftString, 18);
    FieldDefs.Add('XNome'     , ftString, 60);
    FieldDefs.Add('XLgr'      , ftString, 60);
    FieldDefs.Add('Nro'       , ftString, 60);
    FieldDefs.Add('XCpl'      , ftString, 60);
    FieldDefs.Add('XBairro'   , ftString, 60);
    FieldDefs.Add('CMun'      , ftString, 7);
    FieldDefs.Add('XMun'      , ftString, 60);
    FieldDefs.Add('UF'        , ftString, 2);
    FieldDefs.Add('CEP'       , ftString, 9);
    FieldDefs.Add('CPais'     , ftString, 4);
    FieldDefs.Add('XPais'     , ftString, 60);
    FieldDefs.Add('Fone'      , ftString, 15);
    FieldDefs.Add('IE'        , ftString, 18);
    FieldDefs.Add('Consumidor', ftString, 150);
    CreateDataSet;
  end;
  dtsDestinatario.DataSet := cdsDestinatario;

  // cdsDadosProdutos
  cdsDadosProdutos   := TClientDataSet.Create(Self);
  with cdsDadosProdutos do
  begin
    FieldDefs.Add('ID'        , ftString, 10); // Código no Cadastros
    FieldDefs.Add('CProd'     , ftString, 60);
    FieldDefs.Add('cEAN'      , ftString, 60);
    FieldDefs.Add('XProd'     , ftString, 120);
    FieldDefs.Add('infAdProd' , ftString, 1000);
    FieldDefs.Add('NCM'       , ftString, 9);
    FieldDefs.Add('EXTIPI'    , ftString, 8);
    FieldDefs.Add('genero'    , ftString, 8);
    FieldDefs.Add('CFOP'      , ftString, 4);
    FieldDefs.Add('UCom'      , ftString, 6);
    FieldDefs.Add('QCom'      , ftFloat);
    FieldDefs.Add('VUnCom'    , ftFloat);
    FieldDefs.Add('VProd'     , ftString, 18);
    FieldDefs.Add('cEANTrib'  , ftString, 60);
    FieldDefs.Add('UTrib'     , ftString, 6);
    FieldDefs.Add('QTrib'     , ftFloat);
    FieldDefs.Add('vUnTrib'   , ftFloat);
    FieldDefs.Add('vFrete'    , ftString, 18);
    FieldDefs.Add('vOutro'    , ftString, 18);
    FieldDefs.Add('vSeg'      , ftString, 18);
    FieldDefs.Add('vDesc'     , ftString, 18);
    FieldDefs.Add('ORIGEM'    , ftString, 1);
    FieldDefs.Add('CST'       , ftString, 3);
    FieldDefs.Add('vBC'       , ftString, 18);
    FieldDefs.Add('pICMS'     , ftString, 18);
    FieldDefs.Add('vICMS'     , ftString, 18);
    FieldDefs.Add('vIPI'      , ftString, 18);
    FieldDefs.Add('pIPI'      , ftString, 18);
    FieldDefs.Add('VTotTrib'  , ftString, 18);
    FieldDefs.Add('ChaveNFe'  , ftString, 50);
    FieldDefs.Add('vISSQN'    , ftString, 18);
    FieldDefs.Add('vBcISSQN'  , ftString, 18);
    FieldDefs.Add('vBcST'     , ftString, 18);
    FieldDefs.Add('vICMSST'   , ftString, 18);
    FieldDefs.Add('nLote'     , ftString, 20);
    FieldDefs.Add('qLote'     , ftFloat);
    FieldDefs.Add('dFab'      , ftDateTime);
    FieldDefs.Add('dVal'      , ftDateTime);
    FieldDefs.Add('DescricaoProduto', ftString, 2000);
    FieldDefs.Add('Unidade'   , ftString, 6);
    FieldDefs.Add('Quantidade', ftString, 18);
    FieldDefs.Add('ValorUnitario'   , ftString, 18);
    FieldDefs.Add('Valorliquido'    , ftString, 18);
    FieldDefs.Add('ValorAcrescimos' , ftString, 18);
    CreateDataSet;
  end;
  dtsDadosProdutos.DataSet := cdsDadosProdutos;

  // cdsParametros
  cdsParametros  := TClientDataSet.Create(Self);
  with cdsParametros do
  begin
    FieldDefs.Add('poscanhoto', ftString, 1);
    FieldDefs.Add('ResumoCanhoto', ftString, 200);
    FieldDefs.Add('Mensagem0', ftString, 60);
    FieldDefs.Add('Imagem', ftString, 256);
    FieldDefs.Add('Sistema', ftString, 300);
    FieldDefs.Add('Usuario', ftString, 60);
    FieldDefs.Add('Fax', ftString, 60);
    FieldDefs.Add('Site', ftString, 60);
    FieldDefs.Add('Email', ftString, 60);
    FieldDefs.Add('Desconto', ftString, 60);
    FieldDefs.Add('TotalLiquido', ftString, 60);
    FieldDefs.Add('ChaveAcesso_Descricao', ftString, 90);
    FieldDefs.Add('Contingencia_ID', ftString, 36);
    FieldDefs.Add('Contingencia_Descricao', ftString, 60);
    FieldDefs.Add('Contingencia_Valor', ftString, 60);
    FieldDefs.Add('LinhasPorPagina', ftInteger);
    FieldDefs.Add('LogoExpandido', ftString, 1);
    FieldDefs.Add('DESCR_CST', ftString, 30);
    FieldDefs.Add('ConsultaAutenticidade', ftString, 300);
    FieldDefs.Add('sDisplayFormat', ftString, 25);
    FieldDefs.Add('iFormato', ftInteger);
    FieldDefs.Add('Casas_qCom', ftInteger);
    FieldDefs.Add('Casas_vUnCom', ftInteger);
    FieldDefs.Add('Mask_qCom', ftString, 30);
    FieldDefs.Add('Mask_vUnCom', ftString, 30);
    FieldDefs.Add('LogoCarregado', ftBlob);
    FieldDefs.Add('QrCodeCarregado', ftGraphic, 1000);
    FieldDefs.Add('QrCodeLateral', ftString, 1);
    FieldDefs.Add('ImprimeEm1Linha', ftString, 1);
    FieldDefs.Add('ImprimeEmDuasLinhas', ftString, 1);
    FieldDefs.Add('DescricaoViaEstabelec', ftString, 30);
    FieldDefs.Add('QtdeItens', ftInteger);
    FieldDefs.Add('ExpandirDadosAdicionaisAuto', ftString, 1);
    FieldDefs.Add('ImprimeDescAcrescItem', ftInteger);
    FieldDefs.Add('nProt', ftString, 30);
    FieldDefs.Add('dhRecbto', ftDateTime);
    FieldDefs.Add('poscanhotolayout', ftString, 1);
    CreateDataSet;
  end;
  dtsParametros.DataSet := cdsParametros;

  // cdsDuplicatas
  cdsDuplicatas := TClientDataSet.Create(Self);
  with cdsDuplicatas do
  begin
    FieldDefs.Add('NDup'    , ftString, 60);
    FieldDefs.Add('DVenc'   , ftString, 10);
    FieldDefs.Add('VDup'    , ftFloat);
    FieldDefs.Add('ChaveNFe', ftString, 50);
    CreateDataSet;
  end;
  dtsDuplicatas.DataSet := cdsDuplicatas;

  // cdsCalculoImposto
  cdsCalculoImposto := TClientDataSet.Create(Self);
  with cdsCalculoImposto do
  begin
    FieldDefs.Add('VBC'         , ftFloat);
    FieldDefs.Add('VICMS'       , ftFloat);
    FieldDefs.Add('VBCST'       , ftFloat);
    FieldDefs.Add('VST'         , ftFloat);
    FieldDefs.Add('VProd'       , ftFloat);
    FieldDefs.Add('VFrete'      , ftFloat);
    FieldDefs.Add('VSeg'        , ftFloat);
    FieldDefs.Add('VDesc'       , ftFloat);
    FieldDefs.Add('vICMSDeson'  , ftFloat);
    FieldDefs.Add('VII'         , ftFloat);
    FieldDefs.Add('VIPI'        , ftFloat);
    FieldDefs.Add('VPIS'        , ftFloat);
    FieldDefs.Add('VCOFINS'     , ftFloat);
    FieldDefs.Add('VOutro'      , ftFloat);
    FieldDefs.Add('VNF'         , ftFloat);
    FieldDefs.Add('VTotTrib'    , ftFloat);
    FieldDefs.Add('VTribPerc'   , ftFloat);
    FieldDefs.Add('VTribFonte'  , ftString, 100);
    FieldDefs.Add('vTotPago'    , ftFloat);
    FieldDefs.Add('vTroco'      , ftFloat);
    FieldDefs.Add('ValorApagar' , ftFloat);
    FieldDefs.Add('VFCP'        , ftFloat);
    FieldDefs.Add('VFCPST'      , ftFloat);
    FieldDefs.Add('VFCPSTRet'   , ftFloat);
    FieldDefs.Add('VIPIDevol'   , ftFloat);
    CreateDataSet;
  end;
  dtsCalculoImposto.DataSet := cdsCalculoImposto;

  // cdsTransportador
  cdsTransportador := TClientDataSet.Create(Self);
  with cdsTransportador do
  begin
    FieldDefs.Add('ModFrete', ftString, 14);
    FieldDefs.Add('CNPJCPF' , ftString, 18);
    FieldDefs.Add('XNome'   , ftString, 60);
    FieldDefs.Add('IE'      , ftString, 14);
    FieldDefs.Add('XEnder'  , ftString, 60);
    FieldDefs.Add('XMun'    , ftString, 60);
    FieldDefs.Add('UF'      , ftString, 2);
    CreateDataSet;
  end;
  dtsTransportador.DataSet := cdsTransportador;

  // cdsVeiculo
  cdsVeiculo := TClientDataSet.Create(Self);
  with cdsVeiculo do
  begin
    FieldDefs.Add('PLACA', ftString, 8);
    FieldDefs.Add('UF'   , ftString, 2);
    FieldDefs.Add('RNTC' , ftString, 20);
    CreateDataSet;
  end;
  dtsVeiculo.DataSet := cdsVeiculo;

  // cdsVolumes
  cdsVolumes := TClientDataSet.Create(Self);
  with cdsVolumes do
  begin
    FieldDefs.Add('QVol' , ftFloat);
    FieldDefs.Add('Esp'  , ftString, 60);
    FieldDefs.Add('Marca', ftString, 60);
    FieldDefs.Add('NVol' , ftString, 60);
    FieldDefs.Add('PesoL', ftFloat);
    FieldDefs.Add('PesoB', ftFloat);
    CreateDataSet;
  end;
  dtsVolumes.DataSet := cdsVolumes;

  // csdEvento
  cdsEventos := TClientDataSet.Create(Self);
  dtsEventos.DataSet := cdsEventos;

  // cdsISSQN
  cdsISSQN := TClientDataSet.Create(Self);
  with cdsISSQN do
  begin
    FieldDefs.Add('vSERV', ftFloat);
    FieldDefs.Add('vBC', ftFloat);
    FieldDefs.Add('vISS', ftFloat);
    FieldDefs.Add('vDescIncond', ftFloat);
    FieldDefs.Add('vISSRet', ftFloat);
    CreateDataSet;
  end;
  dtsISSQN.DataSet := cdsISSQN;

   // cdsFatura
  cdsFatura   := TClientDataSet.Create(Self);
  with cdsFatura do
  begin
     FieldDefs.Add('iForma'   , ftInteger);
     FieldDefs.Add('Pagamento', ftString, 20);
     FieldDefs.Add('nFat'     , ftString, 60);
     FieldDefs.Add('vOrig'    , ftFloat);
     FieldDefs.Add('vDesc'    , ftFloat);
     FieldDefs.Add('vLiq'     , ftFloat);
     CreateDataSet;
  end;
  dtsFatura.DataSet := cdsFatura;

  // cdsLocalRetirada
  cdsLocalRetirada := TClientDataSet.Create(Self);
  with cdsLocalRetirada do
  begin
    FieldDefs.Add('CNPJ', ftString, 18);
    FieldDefs.Add('XLgr', ftString, 60);
    FieldDefs.Add('Nro', ftString, 60);
    FieldDefs.Add('XCpl', ftString, 60);
    FieldDefs.Add('XBairro', ftString, 60);
    FieldDefs.Add('CMun', ftString, 7);
    FieldDefs.Add('XMun', ftString, 60);
    FieldDefs.Add('UF', ftString, 2);
    FieldDefs.Add('XNome', ftString, 60);
    FieldDefs.Add('CEP', ftString, 9);
    FieldDefs.Add('CPais', ftString, 4);
    FieldDefs.Add('XPais', ftString, 60);
    FieldDefs.Add('Fone', ftString, 17);
    FieldDefs.Add('IE', ftString, 15);
    CreateDataSet;
  end;
  dtsLocalRetirada.DataSet := cdsLocalRetirada;

  // cdsLocalEntrega
  cdsLocalEntrega := TClientDataSet.Create(Self);
  with cdsLocalEntrega do
  begin
    FieldDefs.Add('CNPJ', ftString, 18);
    FieldDefs.Add('XLgr', ftString, 60);
    FieldDefs.Add('Nro', ftString, 60);
    FieldDefs.Add('XCpl', ftString, 60);
    FieldDefs.Add('XBairro', ftString, 60);
    FieldDefs.Add('CMun', ftString, 7);
    FieldDefs.Add('XMun', ftString, 60);
    FieldDefs.Add('UF', ftString, 2);
    FieldDefs.Add('XNome', ftString, 60);
    FieldDefs.Add('CEP', ftString, 9);
    FieldDefs.Add('CPais', ftString, 4);
    FieldDefs.Add('XPais', ftString, 60);
    FieldDefs.Add('Fone', ftString, 17);
    FieldDefs.Add('IE', ftString, 15);
    CreateDataSet;
  end;
  dtsLocalEntrega.DataSet := cdsLocalEntrega;

  // cdsInformacoesAdicionais
  cdsInformacoesAdicionais := TClientDataSet.Create(Self);
  with cdsInformacoesAdicionais do
  begin
    FieldDefs.Add('OBS', ftString, 6900);
    FieldDefs.Add('LinhasOBS', ftInteger);
    FieldDefs.Add('MensagemSEFAZ', ftString, 200);
    CreateDataSet;
  end;
  dtsInformacoesAdicionais.DataSet := cdsInformacoesAdicionais;

  // cdsPagamento
  cdsPagamento := TClientDataSet.Create(Self);
  with cdsPagamento do
  begin
    FieldDefs.Add('tPag', ftString, 50);
    FieldDefs.Add('vPag', ftFloat);
    FieldDefs.Add('vTroco', ftFloat);
    FieldDefs.Add('CNPJ', ftString, 50);
    FieldDefs.Add('tBand', ftString, 50);
    FieldDefs.Add('cAut', ftString, 20);
    CreateDataSet;
  end;
  dtsPagamento.DataSet := cdsPagamento;

  //cdsInutilização
  cdsInutilizacao := TClientDataSet.Create(Self);
  dtsInutilizacao.DataSet := cdsInutilizacao;
end;

function TViewNFEImportar.Split(const ADelimiter,
  AString: string): TSplitResult;
var
  Step: ^String;
  Chr: PChar;
  iPos, iLast, iDelLen, iLen, x: integer;
label
  EndLoop;
begin
  SetLength(Result, SubstrCount(ADelimiter, AString) + 1);
  if High(Result) = 0 then
    Result[0] := AString
  else
  begin
    iDelLen := Length(ADelimiter);
    iLen := Length(AString);
    Step := @Result[0];
    iLast := 0;
    iPos := 0;
    repeat
      if iPos + iDelLen > iLen then
      begin
        if iLast <> iPos then
          iPos := iLen;
      end else
        for x := 1 to iDelLen do
          if AString[iPos + x] <> ADelimiter[x] then
            goto EndLoop;

      if iPos - iLast > 0 then
      begin
        SetLength(Step^, iPos - iLast);
        Chr := PChar(Step^);
        for x := 1 to PCardinal(Cardinal(Step^) - SizeOf(Cardinal))^ do
        begin
          Chr^ := AString[iLast + x];
          Inc(Chr);
        end;
      end else
        Step^ := '';

      Cardinal(Step) := Cardinal(Step) + SizeOf(Cardinal);
      iLast := iPos + iDelLen;

      EndLoop:
        Inc(iPos);
    until iLast >= iLen;
  end;
end;

function TViewNFEImportar.SubstrCount(const ASubString,
  AString: string): Integer;
var
  i: integer;
begin
  Result := -1;
  i := 0;
  repeat
    Inc(Result);
    i := Pos(ASubString, AString, i + 1);
  until i = 0;
end;

initialization
  FormFunction.RegisterForm('ViewNFEImportar', TViewNFEImportar);

end.
