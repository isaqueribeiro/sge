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
  dxSkinsDefaultPainters,

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
  UConstantesDGE, dxSkinBasic, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2019Black,
  dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinTheBezier,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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
    DtSrcTabelaDuplicatas: TDataSource;
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
    DtSrcTabelaNFE: TDataSource;
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
    lblCalcularTotaisInfo: TLabel;
    tbsLotes: TTabSheet;
    DBGrid1: TDBGrid;
    DtSrcTabelaLotes: TDataSource;
    btnImportar: TcxButton;
    bvlImportar: TBevel;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoInativo: TShape;
    shpOperacaoCancelada: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoCancelada: TLabel;
    lblOperacaoInativo: TLabel;
    nmPpCorrigirDadosValorTotalItens: TMenuItem;
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
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
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure btnTituloEditarClick(Sender: TObject);
    procedure dbSerieKeyPress(Sender: TObject; var Key: Char);
    procedure nmImprimirEspelhoClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure dbgDadosExit(Sender: TObject);
    procedure dbgDadosEnter(Sender: TObject);
    procedure dbSerieKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView    ,
    FControllerTipoEntradaView,
    FControllerTipoDocumentoView,
    FControllerFormaPagto       ,
    FControllerCondicaoPagtoView,
    FControllerTipoDespesa : IControllerCustom;
    FControllerCFOP    : IControllerCFOP;
    FControllerProduto : IControllerProduto;
    FEmpresa : String;
    FTipoMovimento : TTipoMovimentoEntrada;
    FApenasFinalizadas : Boolean;
    FValorTotalProduto : Currency;
    procedure CarregarDadosEmpresa(const pEmpresa, pTituloRelatorio : String);
    procedure AbrirTabelaItens;
    procedure AbrirTabelaDuplicatas;
    procedure AbrirTabelaLotes;
    procedure AbrirNotaFiscal;
    procedure CarregarDadosProduto( Codigo : Integer);
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure InserirItensAutorizacao;
    procedure OcutarCampoAutorizacao;

    function GetRotinaFinalizarID : String;
    function GetRotinaGerarNFeID : String;
    function GetRotinaCancelarEntradaID : String;
    function ValidarGTIN : Boolean;

    procedure RegistrarNovaRotinaSistema;
    procedure BaixarImportarNFe(aChaveNFe, aNSU : String);

    function IdentificarNFe(var aCNPJEmissor, aUFEmissor, aChave, aNSU : String) : Boolean;
    function Controller : IControllerEntrada;
    function Empresa  : IControllerEmpresa;
    function Produtos : IControllerCustom;
    function Duplicatas : IControllerCustom;
    function Lotes : IControllerCustom;
    function NFE : IControllerXML_NFeEnviada;
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

  function SelecionarEntrada(const AOwner : TComponent; var Ano, Controle : Integer; var aEmpresa, aObservacao : String) : Boolean;
  function SelecionarNFParaDevolver(const AOwner : TComponent; var Ano, Controle : Integer;
    var aEmpresa : String; var Emissao : TDateTime; var Serie, Numero, Chave, UF, Cnpj, IE : String) : Boolean;

implementation

uses
  System.DateUtils,
  pcnConversao,
  UDMBusiness,
  UDMRecursos,
  UFuncoes,
  UDMNFe,
  Service.Message,
  Service.Utils,
  Classe.DistribuicaoDFe.DocumentoRetornado,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.CondicaoPagto,
  View.Produto,
  View.CFOP,
  View.Fornecedor,
  View.Entrada.ConfirmarDuplicatas,
  View.Entrada.ConfirmarLote,
  View.Entrada.Cancelar,
  View.Entrada.GerarNFE,
  View.Entrada.DevolucaoNF,
  View.AutorizacaoCompra,
  View.NFE.ConsultarLote,
  View.NFE.Distribuicao,
  View.NFE.Importar;

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

function SelecionarEntrada(const AOwner : TComponent; var Ano, Controle : Integer; var aEmpresa, aObservacao : String) : Boolean;
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
        aObservacao := FieldByName('OBS').AsString;
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
var
  aEmitirNFE : Boolean;
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
    if (not (Empresa.GetSegmentoID(FController.DAO.Usuario.Empresa.CNPJ) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID])) then
      OcutarCampoAutorizacao;

  DtSrcTabelaItens.DataSet      := Produtos.DAO.DataSet;
  DtSrcTabelaDuplicatas.DataSet := Duplicatas.DAO.DataSet;
  DtSrcTabelaLotes.DataSet      := Lotes.DAO.DataSet;
  DtSrcTabelaNFE.DataSet        := NFE.DAO.DataSet;

  inherited;

  AbrirTabelaAuto := True;
  FEmpresa        := EmptyStr;

  e1Data.Date      := Date - 30;
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCOMPRAS';
  CampoCodigo    := 'c.Codcontrol';
  CampoDescricao := 'f.NomeForn';
  CampoOrdenacao := 'c.dtEnt, f.NomeForn';

  aEmitirNFE := Empresa.GetPermitirEmissaoNFe(FController.DAO.Usuario.Empresa.CNPJ)
    and Empresa.GetPermitirEmissaoNFeEntrada(FController.DAO.Usuario.Empresa.CNPJ)
    and Empresa.DAO.Configuracao.Certificado(FController.DAO.Usuario.Empresa.CNPJ).Instalado;

  dbCalcularTotais.Visible      := aEmitirNFE;
  lblCalcularTotaisInfo.Visible := aEmitirNFE;
  btbtnGerarNFe.Visible         := aEmitirNFE;

  TipoMovimento     := TTipoMovimentoEntrada.tmeProduto;
  ApenasFinalizadas := False;

  if not dbCalcularTotais.Visible then
    GrpBxDadosValores.Height := 76
  else
    GrpBxDadosValores.Height := 90;

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
end;

procedure TViewEntrada.btnImportarClick(Sender: TObject);
var
  aEmissor   ,
  aUF        ,
  aChaveNFe  ,
  aUltimoNSU : String;
  aNSU : IControllerXML_NFeImportada;
begin
  aEmissor  := EmptyStr;
  aUF       := EmptyStr;
  aChaveNFe := EmptyStr;

  DMNFe.LerConfiguracao(FController.DAO.Usuario.Empresa.CNPJ, tipoDANFEFast);
  aNSU := TControllerFactory.New.XML_NFeImportada;

  if (not Trim(DMNFe.GetCnpjCertificado).IsEmpty) then
  begin
    aUltimoNSU := TControllerFactory.New.ConfigSystem.GetNumeroNSUPesquisado(FController.DAO.Usuario.Empresa.CNPJ);

    if (aUltimoNSU.ToInt64 = 0) then
      DMNFe.GetUltimoNSU(FController.DAO.Usuario.Empresa.CNPJ, aUltimoNSU, False);

    // Buscar relação do NSU com a NF-e, e caso a relaçao não seja possível, gerar um NSU fictício.
    if not IdentificarNFe(aEmissor, aUF, aChaveNFe, aUltimoNSU) then
      aUltimoNSU := '9' + FormatFloat('00000000000000', aNSU.GetNumeroNSU(FController.DAO.Usuario.Empresa.CNPJ));
  end
  else
    aUltimoNSU := '9' + FormatFloat('00000000000000', aNSU.GetNumeroNSU(FController.DAO.Usuario.Empresa.CNPJ));

  BaixarImportarNFe(aChaveNFe, aUltimoNSU);
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
    if (aNSU.ToInt64 > 0) then
    begin
      if (Copy(DMNFe.GetCnpjCertificado, 1, 8) <> Copy(FController.DAO.Usuario.Empresa.CNPJ, 1, 8)) then
        TServiceMessage.ShowWarning('A Empresa selecionada no login do sistema não está de acordo com o Certificado informado!')
      else
      if not GetConectedInternet then
        TServiceMessage.ShowWarning('Estação de trabalho sem acesso a Internet!')
      else
      if DMNFe.GetValidadeCertificado(FController.DAO.Usuario.Empresa.CNPJ) then
        aRetorno := TViewNFEDistribuicao
          .getInstance(FController.DAO.Usuario.Empresa.CNPJ)
          .&End(aCNPJEmissor, aUFEmissor, aChave, aNSU);
    end;
  finally
    Result := aRetorno;
  end;
end;

procedure TViewEntrada.InserirItensAutorizacao;
var
  I : Integer;
  cPrecoUN     ,
  aTotalProduto,
  aDescontos   ,
  aTotalNota   : Currency;
  aAutorizacaoCompra : IControllerCustom;
begin
  aAutorizacaoCompra := TControllerFactory.New.ItensAutorizadosParaEntrada;
  aAutorizacaoCompra
    .DAO
    .Close
    .ParamsByName('tipo',    DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger)
    .ParamsByName('ano',     DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_ANO').AsInteger)
    .ParamsByName('codigo',  DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_CODIGO').AsInteger)
    .ParamsByName('empresa', DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_EMPRESA').AsString)
    .Open;

  with aAutorizacaoCompra.DAO.DataSet do
  begin
    if not IsEmpty then
    begin
      AbrirTabelaItens;

      // Limpar a listagem atual excluíndo os produtos/serviços, caso exista itens na autorização
      DtSrcTabelaItens.DataSet.First;
      while not DtSrcTabelaItens.DataSet.Eof do
        DtSrcTabelaItens.DataSet.Delete;
    end;

    aTotalProduto := 0.0;
    aDescontos    := 0.0;
    aTotalNota    := 0.0;

    // Inserir os produtos/serviços da autorização na entrada

    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        DtSrcTabelaItens.DataSet.Append;

        DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger := I;

        DtSrcTabelaItens.DataSet.FieldByName('ANO').Assign       ( DtSrcTabela.DataSet.FieldByName('ANO') );
        DtSrcTabelaItens.DataSet.FieldByName('CODCONTROL').Assign( DtSrcTabela.DataSet.FieldByName('CODCONTROL') );
        DtSrcTabelaItens.DataSet.FieldByName('CODEMP').Assign    ( DtSrcTabela.DataSet.FieldByName('CODEMP') );
        DtSrcTabelaItens.DataSet.FieldByName('DTENT').Assign     ( DtSrcTabela.DataSet.FieldByName('DTENT') );
        DtSrcTabelaItens.DataSet.FieldByName('CODFORN').Assign   ( DtSrcTabela.DataSet.FieldByName('CODFORN') );
        DtSrcTabelaItens.DataSet.FieldByName('NF').Assign        ( DtSrcTabela.DataSet.FieldByName('NF') );

        DtSrcTabelaItens.DataSet.FieldByName('CODPROD').Assign       ( FieldByName('produto') );
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI').Assign        ( FieldByName('DESCRI') );
        DtSrcTabelaItens.DataSet.FieldByName('QTDE').Assign          ( FieldByName('quantidade') );
        DtSrcTabelaItens.DataSet.FieldByName('UNID_COD').Assign      ( FieldByName('unidade') );
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').Assign     ( FieldByName('unp_sigla') );
        DtSrcTabelaItens.DataSet.FieldByName('CFOP').Assign          ( DtSrcTabela.DataSet.FieldByName('NFCFOP') );
        DtSrcTabelaItens.DataSet.FieldByName('NCM_SH').Assign        ( FieldByName('ncm_sh') );
        DtSrcTabelaItens.DataSet.FieldByName('CST').Assign           ( FieldByName('cst') );
        DtSrcTabelaItens.DataSet.FieldByName('CSOSN').Assign         ( FieldByName('csosn') );
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').Assign      ( FieldByName('aliquota') );
        DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').Assign      ( FieldByName('percentual_reducao_bc') );
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_CSOSN').Assign ( FieldByName('aliquota_csosn') );
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_PIS').Assign   ( FieldByName('aliquota_pis') );
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_COFINS').Assign( FieldByName('aliquota_cofins') );
        DtSrcTabelaItens.DataSet.FieldByName('QTDE').Assign           ( FieldByName('quantidade') );
        DtSrcTabelaItens.DataSet.FieldByName('QTDEANTES').Assign      ( FieldByName('estoque') );
        DtSrcTabelaItens.DataSet.FieldByName('QTDEFINAL').Assign      ( FieldByName('novo_estoque') );
        DtSrcTabelaItens.DataSet.FieldByName('PRECOUNIT').Assign      ( FieldByName('valor_unitario') );
        DtSrcTabelaItens.DataSet.FieldByName('VALOR_IPI').Assign      ( FieldByName('valor_ipi') );

        cPrecoUN := DtSrcTabelaItens.DataSet.FieldByName('PRECOUNIT').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('CUSTOMEDIO').AsCurrency  := cPrecoUN + DtSrcTabelaItens.DataSet.FieldByName('VALOR_IPI').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency := cPrecoUN * DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency := DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency  / DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency * 100;
        DtSrcTabelaItens.DataSet.FieldByName('VALOR_FRETE').AsCurrency       := DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency * DtSrcTabela.DataSet.FieldByName('FRETE').AsCurrency / 100;
        DtSrcTabelaItens.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency    := DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency * DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency / 100;
        DtSrcTabelaItens.DataSet.FieldByName('VALOR_OUTROS').AsCurrency      := DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency * DtSrcTabela.DataSet.FieldByName('OUTROSCUSTOS').AsCurrency / 100;

        DtSrcTabelaItens.DataSet.FieldByName('TOTAL_LIQUIDO').AsCurrency     := DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency - DtSrcTabelaItens.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

        DtSrcTabelaItens.DataSet.Post;

        aTotalProduto := aTotalProduto + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
        aDescontos    := aDescontos    + DtSrcTabelaItens.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;
        aTotalNota    := aTotalNota    + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_LIQUIDO').AsCurrency;

        Inc(I);
      end;

      Next;
    end;

    // Atualizar totais
    if (aTotalProduto <> DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency) then
      DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency := aTotalProduto;

    if (aDescontos <> DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency) then
      DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency := aDescontos;

    if (aTotalNota <> DtSrcTabela.DataSet.FieldByName('TOTALNF').AsCurrency) then
      DtSrcTabela.DataSet.FieldByName('TOTALNF').AsCurrency := aTotalNota;
  end;
end;

function TViewEntrada.Lotes: IControllerCustom;
begin
  Result := Controller.Lotes;
end;

function TViewEntrada.NFE: IControllerXML_NFeEnviada;
begin
  Result := Controller.NFe;
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
      TServiceMessage.ShowWarning(Format('Documento %s já lançado.'#13#13'Pesquise o lançamento %s/%s com emissão em %s.', [
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
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] );

  if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TViewEntrada.AbrirTabelaItens;
begin
  Controller.CarregarProdutos;

  // Configurar tabela dos itens
  TTabelaController
    .New
    .Tabela( DtSrcTabelaItens.DataSet )
    .Display('SEQ', '#', '00', TAlignment.taCenter, True)
    .Display('CODPROD', 'Produto', True)
    .Display('QTDE', 'Qtde.', ',0.##', TAlignment.taRightJustify, True)
    .Display('PRECOUNIT', 'Valor Unitário (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('CUSTOMEDIO', 'Outros (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('PERC_PARTICIPACAO', '% Partic.', ',0.00', TAlignment.taRightJustify, False)
    .Display('VALOR_FRETE', 'Frete (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('VALOR_DESCONTO', 'Desconto (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('VALOR_OUTROS', 'Outros (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('VALOR_IPI', 'Valor IPI (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Display('ALIQUOTA', '% Alíquota', ',0.00', TAlignment.taRightJustify, False)
    .Display('ALIQUOTA_CSOSN', '% Alíquota SN', ',0.00', TAlignment.taRightJustify, False)
    .Display('ALIQUOTA_PIS', '% Alíquota PIS', ',0.00', TAlignment.taRightJustify, False)
    .Display('ALIQUOTA_COFINS', '% Alíquota COFINS', ',0.00', TAlignment.taRightJustify, False)
    .Display('PERCENTUAL_REDUCAO_BC', '% Redução BC', ',0.00', TAlignment.taRightJustify, False)
    .Display('TOTAL_BRUTO', 'Total Bruto (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('TOTAL_LIQUIDO', 'Total Líquido (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewEntrada.AbrirTabelaLotes;
begin
  Controller.CarregarLotes;

  // Configurar tabela dos lotes
  TTabelaController
    .New
    .Tabela( DtSrcTabelaLotes.DataSet )
    .Display('SEQ',     '#', '00', TAlignment.taCenter, True)
    .Display('CODPROD', 'Código', TAlignment.taCenter, True)
    .Display('DESCRI_APRESENTACAO', 'Produto/Serviço', TAlignment.taLeftJustify, False)
    .Display('REFERENCIA',    'Referência', TAlignment.taLeftJustify, False)
    .Display('QTDE',          'Qtde.', ',0.##', TAlignment.taRightJustify, True)
    .Display('LOTE_DATA_FAB', 'Fabricação', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('LOTE_DATA_VAL', 'Validade',   'dd/mm/yyyy', TAlignment.taCenter, True)
    .Configurar;
end;

procedure TViewEntrada.BaixarImportarNFe(aChaveNFe, aNSU : String);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := DtSrcTabelaItens.DataSet.RecordCount + 1;
    while ( DtSrcTabelaItens.DataSet.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  aProduto  : String;
  aFileName : TFileName;
  Sequencial,
  I : Integer;
  aFornecedor : IControllerFornecedor;
  aProdutoFornecedor : IControllerFornecedorProduto;
begin
  if ImportarNFE(Self, aChaveNFe, aNSU, aFileName) then
    with DMNFe.ACBrNFe do
    begin
      aFornecedor := TControllerFactory.New.Fornecedor;
      aProdutoFornecedor := TControllerFactory.New.FornecedorProduto;
      FValorTotalProduto := 0.0;

      NotasFiscais.Clear;
      NotasFiscais.LoadFromFile(aFileName, False );

      with NotasFiscais.Items[0].NFe do
      begin
        DtSrcTabela.DataSet.Append;

        // Identificação
        DtSrcTabela.DataSet.FieldByName('CODEMP').AsString          := TServicesUtils.StrOnlyNumbers(Dest.CNPJCPF);
        DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger := Ord(TTipoMovimentoEntrada.tmeProduto);
        DtSrcTabela.DataSet.FieldByName('TIPO_ENTRADA').AsInteger   := 4; // Outras -> VW_TIPO_ENTRADA
        DtSrcTabela.DataSet.FieldByName('TIPO_DESPESA').AsInteger   := TIPO_RECEITA_PADRAO;
        // Fornecedor
        DtSrcTabela.DataSet.FieldByName('CODFORN').AsInteger  := aFornecedor.Get(TServicesUtils.StrOnlyNumbers(Emit.CNPJCPF)).DataSet.FieldByName('Codforn').AsInteger;
        DtSrcTabela.DataSet.FieldByName('CNPJ').AsString      := TServicesUtils.StrOnlyNumbers(Emit.CNPJCPF);
        DtSrcTabela.DataSet.FieldByName('NOMEFORN').AsString  := Emit.xNome;
        // Documento
        DtSrcTabela.DataSet.FieldByName('DTEMISS').AsDateTime       := Ide.dEmi;
        DtSrcTabela.DataSet.FieldByName('TIPO_DOCUMENTO').AsInteger := TIPO_DOCUMENTO_ENTRADA_NFE;
        DtSrcTabela.DataSet.FieldByName('NF').AsString        := FormatFloat('###0000000', Ide.cNF);
        DtSrcTabela.DataSet.FieldByName('NFSERIE').AsString   := FormatFloat('###00', Ide.serie);

        if (aNSU.ToInt64 = 0) then
          DtSrcTabela.DataSet.FieldByName('NFNSU').Clear
        else
          DtSrcTabela.DataSet.FieldByName('NFNSU').AsString := aNSU;

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

        AbrirTabelaItens;
        AbrirTabelaDuplicatas;
        AbrirTabelaLotes;
        AbrirNotaFiscal;

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

          aProduto := aProdutoFornecedor.GetProdutoFornecedorCodigo(TServicesUtils.StrOnlyNumbers(Emit.CNPJCPF), Det.Items[I].Prod.cProd);
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

        if (not DtSrcTabelaItens.DataSet.IsEmpty) then
        begin
          Produtos.DAO.ApplyUpdates;
          Produtos.DAO.CommitUpdates;
        end;

        FController.DAO.CommitTransaction;

        DtSrcTabela.DataSet.Edit; // Colocar registro em edição para que usuário possa continuar o processo
      end;

      NotasFiscais.Clear;
    end;
end;

procedure TViewEntrada.AbrirTabelaDuplicatas;
begin
  Controller.CarregarDuplicatas;

  // Configurar tabela das duplicatas
  TTabelaController
    .New
    .Tabela( DtSrcTabelaDuplicatas.DataSet )
    .Display('PARCELA',     'Parc.', '00', TAlignment.taCenter, True)
    .Display('DTEMISS',     'Emissão', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
    .Display('DTVENC',      'Vencimento', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
    .Display('DTPAG',       'Data Pagto.', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
    .Display('VALORPAG',    'Valor A Pagar', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALORMULTA',  'Valor Juros/Multas', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALORPAGTOT', 'Total Pago', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALORSALDO',  'Saldo A Pagar', ',0.00', TAlignment.taRightJustify, True)
    .Display('PAGO_',       'Pago?', TAlignment.taCenter, False)
    .Configurar;
end;

procedure TViewEntrada.CarregarDadosProduto(Codigo : Integer);
begin
  if ( not DtSrcTabelaItens.DataSet.Active ) then
    Exit
  else
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if not Assigned(FControllerProduto) then
      FControllerProduto := TControllerFactory.New.Produto;

    with FControllerProduto.Get(Codigo).DataSet do
    begin
      if not IsEmpty then
      begin
        if not FControllerCFOP.DAO.DataSet.Active then
          CarregarDadosCFOP(DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger);

        DtSrcTabelaItens.DataSet.FieldByName('CODPROD').AsString     := FieldByName('Cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI').AsString      := FieldByName('Descri').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString   := FieldByName('Unp_sigla').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('QTDEANTES').AsCurrency := FieldByName('Qtde').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('NCM_SH').AsString                  := FieldByName('Ncm_sh').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').AsCurrency              := FieldByName('Aliquota').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_CSOSN').AsCurrency        := FieldByName('Aliquota_csosn').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_PIS').AsCurrency          := FieldByName('Aliquota_pis').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_COFINS').AsCurrency       := FieldByName('Aliquota_cofins').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := FieldByName('Percentual_reducao_BC').AsCurrency;

        if ( Trim(FieldByName('Cst').AsString) <> EmptyStr ) then
          DtSrcTabelaItens.DataSet.FieldByName('CST').AsString := FieldByName('Cst').AsString;

        if ( Trim(FieldByName('Csosn').AsString) <> EmptyStr ) then
          DtSrcTabelaItens.DataSet.FieldByName('CSOSN').AsString := FieldByName('Csosn').AsString;

        if ( (FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          DtSrcTabelaItens.DataSet.FieldByName('CST').AsString := Trim(FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString);

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          DtSrcTabelaItens.DataSet.FieldByName('UNID_COD').AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de ' + IfThen(FTipoMovimento = tmeProduto, 'produto', 'serviço') + ' não cadastrado');

        DtSrcTabelaItens.DataSet.FieldByName('CODPROD').Clear;

        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewEntrada.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btbtnFinalizar.Enabled   := ( FieldByName('STATUS').AsInteger < STATUS_CMP_FIN) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btbtnCancelarENT.Enabled := ((FieldByName('STATUS').AsInteger = STATUS_CMP_FIN) or  (FieldByName('STATUS').AsInteger = STATUS_CMP_NFE)); // and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btbtnGerarNFe.Enabled    := ( FieldByName('STATUS').AsInteger = STATUS_CMP_FIN) and (not DtSrcTabelaItens.DataSet.IsEmpty);

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

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        AbrirTabelaItens;
        AbrirTabelaDuplicatas;
        AbrirTabelaLotes;
        AbrirNotaFiscal;
      end;
    end;
end;

procedure TViewEntrada.btnProdutoInserirClick(Sender: TObject);
var
  aSequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('CODFORN').AsInteger = 0 ) then
  begin
    TServiceMessage.ShowInformation('Favor selecionar o Fornecedor primeiramente!');
    dbFornecedor.SetFocus;
  end
  else
  if ( (not dbCalcularTotais.Checked) and (DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency = 0) ) then
  begin
    TServiceMessage.ShowWarning('Favor informar valor Total de ' + IfThen(FTipoMovimento = tmeProduto, 'Produto(s)', 'Serviço(s)') + '.');
    dbTotalProduto.SetFocus;
  end
  else
  if ( (not dbCalcularTotais.Checked) and (DtSrcTabela.DataSet.FieldByName('TOTALNF').AsCurrency = 0) ) then
  begin
    TServiceMessage.ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( DtSrcTabelaItens.DataSet.Active ) then
  begin
    if ( gSistema.Codigo in [SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME] ) then
      if ( DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_CODIGO').AsCurrency > 0 ) then
        if TServiceMessage.ShowConfirmation('Deseja carregar automaticamente os itens da autorização selecionada?') then
        begin
          InserirItensAutorizacao;
          Exit;
        end;

    Produtos.GerarSequencial(DtSrcTabelaItens.DataSet, 'SEQ', aSequencial);

    DtSrcTabelaItens.DataSet.Append;
    DtSrcTabelaItens.DataSet.FieldByName('SEQ').Value := aSequencial;

    with DtSrcTabela.DataSet do
    begin
      DtSrcTabelaItens.DataSet.FieldByName('ANO').AsInteger        := FieldByName('ANO').AsInteger;
      DtSrcTabelaItens.DataSet.FieldByName('CODCONTROL').AsInteger := FieldByName('CODCONTROL').AsInteger;
      DtSrcTabelaItens.DataSet.FieldByName('CODEMP').AsString      := FieldByName('CODEMP').AsString;
      DtSrcTabelaItens.DataSet.FieldByName('DTENT').AsDateTime     := FieldByName('DTENT').AsDateTime;
      DtSrcTabelaItens.DataSet.FieldByName('CODFORN').AsInteger    := FieldByName('CODFORN').AsInteger;
      DtSrcTabelaItens.DataSet.FieldByName('NF').AsInteger         := FieldByName('NF').AsInteger;

      if (FTipoMovimento = TTipoMovimentoEntrada.tmeProduto) and (not FieldByName('NFCFOP').IsNull) then
        DtSrcTabelaItens.DataSet.FieldByName('CFOP').Assign( FieldByName('NFCFOP') );
    end;

    dbProduto.SetFocus;
  end;
end;

procedure TViewEntrada.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not DtSrcTabelaItens.DataSet.IsEmpty ) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbQuantidade.SetFocus;
  end;
end;

procedure TViewEntrada.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not DtSrcTabelaItens.DataSet.IsEmpty ) then
    if TServiceMessage.ShowConfirm('Deseja excluir o ítem selecionado?') then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewEntrada.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_Desconto, Total_IPI, Total_Liquido, vBC_ICMS, vICMS: Currency);
  var
    Item : Integer;
  begin
    Item := DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger;

    Total_Bruto    := 0.0;
    Total_desconto := 0.0;
    Total_IPI      := 0.0;
    Total_Liquido  := 0.0;
    vBC_ICMS       := 0.0;
    vICMS          := 0.0;

    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Bruto := Total_Bruto + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
      Total_IPI   := Total_IPI   + DtSrcTabelaItens.DataSet.FieldByName('VALOR_IPI').AsCurrency;

      if (DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency > 0) then
      begin
        vBC_ICMS := vBC_ICMS +
          (DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
           DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency / 100);

        vICMS    := vICMS    +
          (((DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
             DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency / 100)
           ) * DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100);
      end
      else
      begin
        vBC_ICMS := vBC_ICMS + DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency;
        vICMS    := vICMS    +
          (DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency *
           DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').AsCurrency / 100);
      end;


      DtSrcTabelaItens.DataSet.Next;
    end;

    Total_desconto := DtSrcTabela.DataSet.FieldByName('DESCONTO').AsCurrency;
    Total_Liquido  := Total_Bruto - Total_desconto;

    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
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
  if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(DtSrcTabelaItens.DataSet.FieldByName('CODPROD').AsString) = EmptyStr ) then
    begin
      TServiceMessage.ShowWarning('Favor selecionar o ' + lblProduto.Caption);
      dbProduto.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('PRECOUNIT').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Valor unitário inválida.');
      dbValorUnit.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('VALOR_IPI').AsCurrency < 0) then
    begin
      TServiceMessage.ShowWarning('Valor IPI inválida.');
      dbValorIPIProduto.SetFocus;
    end
    else
    if ( Trim(DtSrcTabelaItens.DataSet.FieldByName('CST').AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o Código de Situação Fiscal (CST) do produto.');
      dbCST.SetFocus;
    end
    else
    if (StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('CST').AsString, -1) = -1) then
    begin
      TServiceMessage.ShowWarning('Código CST inválido.');
      dbCST.SetFocus;
    end
    else
    if (StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('CSOSN').AsString, -1) = -1) then
    begin
      TServiceMessage.ShowWarning('Código CSOSN inválido.');
      dbValorIPIProduto.SetFocus;
    end
    else
    begin
      DtSrcTabelaItens.DataSet.Post;

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
    if ( DtSrcTabelaItens.DataSet.IsEmpty ) then
      TServiceMessage.ShowWarning('Favor informar o(s) ' + IfThen(FTipoMovimento = tmeProduto, 'produto(s)', 'serviço(s)') + ' da entrada.')
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
          if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
            DtSrcTabelaItens.DataSet.Post;

          Produtos.DAO.ApplyUpdates;
          Produtos.DAO.CommitUpdates;

          FController.DAO.CommitTransaction;
        end;

        HabilitarDesabilitar_Btns;
      end;
    end;
  end;
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
      if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
        CarregarDadosProduto( DtSrcTabelaItens.DataSet.FieldByName('CODPROD').AsInteger );

    if ( Sender = dbQuantidade ) then
      if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
        DtSrcTabelaItens.DataSet.FieldByName('QTDEFINAL').AsCurrency :=
          DtSrcTabelaItens.DataSet.FieldByName('QTDEANTES').AsCurrency + DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency;

    if ( (Sender = dbValorUnit) or (Sender = dbValorIPIProduto) ) then
    begin
      if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
      begin
        cPrecoUN := DtSrcTabelaItens.DataSet.FieldByName('PRECOUNIT').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('CUSTOMEDIO').AsCurrency  := cPrecoUN + DtSrcTabelaItens.DataSet.FieldByName('VALOR_IPI').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency := cPrecoUN * DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency;

        if (FValorTotalProduto = 0.0) then
          FValorTotalProduto := FieldByName('TOTALPROD').AsCurrency;

        if ( FValorTotalProduto > 0.0 ) then
        begin
          if not dbCalcularTotais.Checked then
            DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency := DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency / FValorTotalProduto * 100
          else
            DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency := 0.0;

          DtSrcTabelaItens.DataSet.FieldByName('VALOR_FRETE').AsCurrency    :=
            DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency * FieldByName('FRETE').AsCurrency / 100;

          DtSrcTabelaItens.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency :=
            DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency * FieldByName('DESCONTO').AsCurrency / 100;

          DtSrcTabelaItens.DataSet.FieldByName('VALOR_OUTROS').AsCurrency   :=
            DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency * FieldByName('OUTROSCUSTOS').AsCurrency / 100;

          DtSrcTabelaItens.DataSet.FieldByName('TOTAL_LIQUIDO').AsCurrency :=
            DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency - DtSrcTabelaItens.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;
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
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    AbrirTabelaDuplicatas;
    AbrirTabelaLotes;
    AbrirNotaFiscal;
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

        if FControllerCFOP.DAO.DataSet.IsEmpty or (FieldByName('NFCFOP').AsInteger <> FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cod').AsInteger) then
        begin
          FControllerCFOP.DAO.ClearWhere;
          FControllerCFOP
            .DAO
            .Where('c.Cfop_cod = ' + FieldByName('NFCFOP').AsString)
            .Open;
          FieldByName('CFOP_DESCRICAO').AsString := FControllerCFOP.DAO.DataSet.FieldByName('cfop_descricao').AsString
        end;
      end;

      // A estação tem certificado digital ?
      // A empresa tem permissão para emissão de NFe de entrada ?
      if FController.DAO.Configuracao.Certificado(FieldByName('CODEMP').AsString).Instalado
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

      AbrirTabelaItens;
      AbrirTabelaDuplicatas;
      AbrirTabelaLotes;
      AbrirNotaFiscal;
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

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        AbrirTabelaItens;
        AbrirTabelaDuplicatas;
        AbrirTabelaLotes;
        AbrirNotaFiscal;
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
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
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
      DtSrcTabelaItens.DataSet.FieldByName('CODPROD').AsString   := sCodigoAlfa;
      DtSrcTabelaItens.DataSet.FieldByName('DESCRI').AsString    := sDescricao;
      DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString := sUnidade;

      DtSrcTabelaItens.DataSet.FieldByName('NCM_SH').AsString                  := sNCM_SH;
      DtSrcTabelaItens.DataSet.FieldByName('CST').AsString                     := sCST;
      DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA').AsCurrency              := cAliquota;
      DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_PIS').AsCurrency          := cAliquotaPIS;
      DtSrcTabelaItens.DataSet.FieldByName('ALIQUOTA_COFINS').AsCurrency       := cAliquotaCOFINS;
      DtSrcTabelaItens.DataSet.FieldByName('PERCENTUAL_REDUCAO_BC').AsCurrency := cPercRedBC;

      if (TTipoMovimentoEntrada(DtSrcTabela.DataSet.FieldByName('TIPO_MOVIMENTO').AsInteger) = tmeProduto) then
      begin
        if not FControllerCFOP.DAO.DataSet.Active then
          CarregarDadosCFOP( DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger );

        if ( (FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          DtSrcTabelaItens.DataSet.FieldByName('CST').AsString := Trim(FControllerCFOP.DAO.DataSet.FieldByName('Cfop_cst_padrao_entrada').AsString);
      end;

      if ( iUnidade > 0 ) then
        DtSrcTabelaItens.DataSet.FieldByName('UNID_COD').AsInteger := iUnidade;
    end;

  end;
end;

procedure TViewEntrada.dbSerieKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    dbDataEntrada.SetFocus;
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
    aGerarTitulos := FControllerCFOP.GetGerarDuplicata(FieldByName('NFCFOP').AsInteger) or (FTipoMovimento = tmeServico);

    pgcGuias.ActivePage := tbsCadastro;

    // 1. Garantir a gravação dos itens na base
    // 2. Atualizar percentual de participação do produto no valor total
    try
      DtSrcTabelaItens.DataSet.First;
      while not DtSrcTabelaItens.DataSet.Eof do
      begin
        DtSrcTabelaItens.DataSet.Edit;
        DtSrcTabelaItens.DataSet.FieldByName('PERC_PARTICIPACAO').AsCurrency :=
          DtSrcTabelaItens.DataSet.FieldByName('TOTAL_BRUTO').AsCurrency  / DtSrcTabela.DataSet.FieldByName('TOTALPROD').AsCurrency * 100.00;
        DtSrcTabelaItens.DataSet.Post;

        Produtos.DAO.ApplyUpdates;
        Produtos.DAO.CommitUpdates;

        DtSrcTabelaItens.DataSet.Next;
      end;
    finally
      FController.DAO.CommitTransaction;
      DtSrcTabelaItens.DataSet.First;
    end;

    if (FieldByName('STATUS').AsInteger = STATUS_CMP_FIN) then
      TServiceMessage.ShowWarning('Movimento de Entrada já está finalizado!')
    else
    if (DtSrcTabelaItens.DataSet.RecordCount = 0) then
      TServiceMessage.ShowWarning('Movimento de Entrada sem produto(s)!')
    else
    begin

      if (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) then
        if Controller.LoteProdutoPendente then
          if not LotesProdutosConfirmados(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('CODEMP').AsString) then
            Abort
          else
            AbrirTabelaLotes;

      if ( FieldByName('CODFORN').AsInteger = 0 ) then
      begin
        Edit;

        TServiceMessage.ShowWarning('Favor informar o fornecedor');
        dbFornecedor.SetFocus;
      end
      else
      if ( FieldByName('TOTALPROD').AsCurrency = 0 ) then
      begin
        Edit;

        TServiceMessage.ShowWarning('Favor informar valor Total de ' + IfThen(FTipoMovimento = tmeProduto, 'Produtos', 'Serviços'));
        dbTotalProduto.SetFocus;
      end
      else
      if ( FieldByName('TOTALNF').AsCurrency = 0 ) then
      begin
        Edit;

        TServiceMessage.ShowWarning('Favor informar valor Total da Nota Fiscal');
        dbTotalNotaFiscal.SetFocus;
      end
      else
      if ( FieldByName('FORMAPAGTO_COD').AsInteger = 0 ) then
      begin
        Edit;

        TServiceMessage.ShowWarning('Favor informar a forma de pagamento');
        dbFormaPagto.SetFocus;
      end
      else
      if ( FieldByName('CONDICAOPAGTO_COD').AsInteger = 0 ) then
      begin
        Edit;

        TServiceMessage.ShowWarning('Favor informar a condição de pagamento');
        dbCondicaoPagto.SetFocus;
      end
      else
      if TServiceMessage.ShowConfirm('Confirma a finalização da entrada selecionada?') then
      begin
        Edit;

        FieldByName('STATUS').AsInteger                := STATUS_CMP_FIN;
        FieldByName('DTFINALIZACAO_COMPRA').AsDateTime := Now;

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        if aGerarTitulos then
          Controller.GerarDuplicatas;

        AbrirTabelaDuplicatas;

        TServiceMessage.ShowInformation('Entrada finalizada com sucesso !');

        if aGerarTitulos then
          if ( DuplicatasConfirmadas(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('DTEMISS').AsDateTime, FieldByName('TOTALNF').AsCurrency) ) then
            AbrirTabelaDuplicatas;

        HabilitarDesabilitar_Btns;
      end;

    end;
  end;
end;

procedure TViewEntrada.btnRegerarDuplicataClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger <> STATUS_CMP_FIN ) then
    TServiceMessage.ShowWarning('É permitida a geração de duplicatas apenas para entradas finalizadas')
  else
  if ( not DtSrcTabelaDuplicatas.DataSet.IsEmpty ) then
    TServiceMessage.ShowWarning('Já existe(m) duplicata(s) gerado(s) para esta entrada')
  else
  if (not FControllerCFOP.GetGerarDuplicata(DtSrcTabela.DataSet.FieldByName('NFCFOP').AsInteger)) then
    TServiceMessage.ShowWarning('A CFOP utilizada nesta compra não permite a geração de duplicatas')
  else
  if TServiceMessage.ShowConfirm('Confirma geração do(s) duplicata(s) a receber da entrada?') then
  begin
    Controller.GerarDuplicatas;
    AbrirTabelaDuplicatas;
  end;
end;

procedure TViewEntrada.btnTituloEditarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( not (FieldByName('STATUS').AsInteger in [STATUS_CMP_FIN, STATUS_CMP_NFE]) ) then
      TServiceMessage.ShowWarning('É permitida a edição de duplicatas apenas para compras finalizadas')
    else
    if ( DtSrcTabelaDuplicatas.DataSet.IsEmpty ) then
      TServiceMessage.ShowWarning('Não existe(m) duplicata(s) gerado(s) para esta compra')
    else
    if ( FieldByName('COMPRA_PRAZO').AsInteger = 1 ) then
    begin
      if ( DuplicatasConfirmadas(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('DTEMISS').AsDateTime, FieldByName('TOTALNF').AsCurrency) ) then
        AbrirTabelaDuplicatas;
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
          TServiceMessage.ShowWarning('Código CFOP não cadastrado');

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

function TViewEntrada.Duplicatas: IControllerCustom;
begin
  Result := Controller.Duplicatas;
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
    AbrirTabelaItens;
    AbrirTabelaDuplicatas;
    AbrirTabelaLotes;
    AbrirNotaFiscal;
  end;
end;

procedure TViewEntrada.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    if (not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])) then
    begin
      AbrirTabelaItens;

      FControllerCFOP.DAO.ClearWhere;
      FControllerCFOP
        .DAO
        .Where('c.Cfop_cod = ' + StrToIntDef(DtSrcTabela.DataSet.FieldByName('NFCFOP').AsString, 0).ToString)
        .Open;
    end;
  end;
end;

procedure TViewEntrada.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
  begin
    AbrirTabelaItens;
    AbrirTabelaDuplicatas;
    AbrirTabelaLotes;
    AbrirNotaFiscal;
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
    TServiceMessage.ShowWarning('Movimento de Entrada já está cancelado!');
    Abort;
  end;

  with DtSrcTabela.DataSet do
    if CancelarENT(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('CODEMP').AsString) then
    begin
      RecarregarRegistro;

      AbrirTabelaItens;
      AbrirTabelaDuplicatas;
      AbrirTabelaLotes;
      AbrirNotaFiscal;

      TServiceMessage.ShowInformation('Entrada cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODCONTROL').AsInteger));

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
        dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
      else
      // Destacar Movimento de Entrada Cancelado
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_CMP_CAN ) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

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
      TServiceMessage.ShowWarning('Movimento de Entrada já está com NF-e gerada!');
      Abort;
    end;

    if DMNFe.ConfigurarParamentoNFE(FieldByName('CODEMP').AsString) then
    begin
      TServiceMessage.ShowInformation('A emissão da NF-e exige a configuração dos parâmetros da empresa.' + #13 + 'Favor entrar em contrato com suporte.');
      Exit;
    end;

    if not Empresa.GetPermitirEmissaoNFeEntrada(FieldByName('CODEMP').AsString) then
    begin
      TServiceMessage.ShowInformation('Empresa selecionada não habilitada para emissão de NF-e p/ Entradas.' + #13 + 'Favor entrar em contato com suporte.');
      Exit;
    end;

    if (FControllerCFOP.GetTipo(FieldByName('NFCFOP').AsInteger) <> tcfopEntrada) then
    begin
      TServiceMessage.ShowInformation('CFOP ' + QuotedStr(FieldByName('NFCFOP').AsString) + ' não permitida para a Emissão de Notas Fiscais de Entrada.' + #13 + 'Favor corrigir número de CFOP.');
      Exit;
    end;

    if not DMNFe.ValidarCFOP(FieldByName('CODEMP').AsString, 0, FieldByName('CODFORN').AsInteger, FieldByName('NFCFOP').AsInteger) then
      Exit;

    if not DMNFe.ValidarEnderecoFornecedor(FieldByName('CODFORN').AsInteger) then
      Exit;

    if not DMNFe.GetValidadeCertificado(FieldByName('CODEMP').AsString) then
      Exit;

    if ( Trim(FieldByName('LOTE_NFE_RECIBO').AsString) = EmptyStr ) then
      if FControllerCFOP.GetDevolucao( FieldByName('NFCFOP').AsInteger ) then
        if not InformarDocumentoReferenciado(Self, FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('CODEMP').AsString) then
          Exit;

    if not ValidarGTIN then
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
          TServiceMessage.ShowWarning('Tipo do movimento do recibo incompatível!');
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
        , FieldByName('CODEMP').AsString
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

        AbrirNotaFiscal;

        DtSrcTabelaNFE.DataSet.Append;

        DtSrcTabelaNFE.DataSet.FieldByName('EMPRESA').Assign( FieldByName('CODEMP') );
        DtSrcTabelaNFE.DataSet.FieldByName('ANOCOMPRA').Assign( FieldByName('ANO') );
        DtSrcTabelaNFE.DataSet.FieldByName('NUMCOMPRA').Assign( FieldByName('CODCONTROL') );
        DtSrcTabelaNFE.DataSet.FieldByName('SERIE').AsString   := FormatFloat('#00', iSerieNFe);
        DtSrcTabelaNFE.DataSet.FieldByName('NUMERO').AsInteger := iNumeroNFe;
        DtSrcTabelaNFE.DataSet.FieldByName('MODELO').AsInteger := DMNFe.GetModeloDF;
        DtSrcTabelaNFE.DataSet.FieldByName('VERSAO').AsInteger := DMNFe.GetVersaoDF;
        DtSrcTabelaNFE.DataSet.FieldByName('DATAEMISSAO').AsDateTime := Date;
        DtSrcTabelaNFE.DataSet.FieldByName('HORAEMISSAO').AsDateTime := Time;
        DtSrcTabelaNFE.DataSet.FieldByName('CHAVE').AsString      := sChaveNFE;
        DtSrcTabelaNFE.DataSet.FieldByName('PROTOCOLO').AsString  := sProtocoloNFE;
        DtSrcTabelaNFE.DataSet.FieldByName('RECIBO').AsString     := sReciboNFE;
        DtSrcTabelaNFE.DataSet.FieldByName('LOTE_ANO').AsInteger  := FieldByName('ANO').AsInteger;
        DtSrcTabelaNFE.DataSet.FieldByName('LOTE_NUM').AsLargeInt := iNumeroLote;

        if ( FileExists(sFileNameXML) ) then
        begin
          CorrigirXML_NFe(EmptyWideStr, sFileNameXML);

          DtSrcTabelaNFE.DataSet.FieldByName('XML_FILENAME').AsString := ExtractFileName( sFileNameXML );
          TMemoField(DtSrcTabelaNFE.DataSet.FieldByName('XML_FILE')).LoadFromFile( sFileNameXML );
        end;

        DtSrcTabelaNFE.DataSet.FieldByName('ANOVENDA').Clear;
        DtSrcTabelaNFE.DataSet.FieldByName('NUMVENDA').Clear;

        try
          DtSrcTabelaNFE.DataSet.Post;

          NFE.DAO.ApplyUpdates;
          NFE.DAO.CommitUpdates;
          NFE.DAO.CommitTransaction;
        except
          On E : Exception do
            TServiceMessage.ShowError('Número da NF-e não recuperado.' + #13 + 'Execute novamente o procedimento.' + #13#13 + E.Message);
        end;

        FController.DAO.RefreshRecord;

        if (DtSrcTabela.DataSet.FieldByName('NF').AsInteger = 0) then
          TServiceMessage.ShowWarning('Número da NF-e não recuperado.' + #13 + 'Execute novamente o procedimento.')
        else
          TServiceMessage.ShowInformation('Nota Fiscal de Entrada gerada com sucesso.' + #13#13 + 'Série/Número: ' + FieldByName('NFSERIE').AsString + '/' + FormatFloat('##0000000', FieldByName('NF').AsInteger));

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
    AbrirCompra( FieldByName('ANO').AsInteger, FieldByName('CODCONTROL').AsInteger, FieldByName('CODEMP').AsString );

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
  aTotalProduto     ,
  aTotalDescontos   ,
  aTotalAutorizacao : Currency;
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
    begin
      if ( FieldByName('CODFORN').AsInteger = 0 ) then
      begin
        TServiceMessage.ShowInformation('Favor selecionar o Fornecedor primeiramente!');
        dbFornecedor.SetFocus;
      end
      else
      begin
        { DONE -oIsaque -cEntrada : 22/05/2014 - Gerar Data Inicial padrão para busca de Autorizações de Compras }

        dDataInicial := StrToDateTime('01/' + FormatDateTime('mm/yyyy', Date));
        if ( (Date - dDataInicial) < 7 ) then
          dDataInicial := Date - 7;

        if ( SelecionarAutorizacao(Self, FieldByName('CODFORN').AsInteger, dDataInicial, iAno, iCodigo, sEmpresa, sMotivo,
          sObservacao, iFormaPagto, iCOndicaoPagto, aTotalProduto, aTotalDescontos, aTotalAutorizacao
        ) ) then
        begin
          FieldByName('AUTORIZACAO_ANO').AsInteger    := iAno;
          FieldByName('AUTORIZACAO_CODIGO').AsInteger := iCodigo;
          FieldByName('AUTORIZACAO_EMPRESA').AsString := sEmpresa;

          FieldByName('TOTALPROD').AsCurrency := aTotalProduto;
          FieldByName('DESCONTO').AsCurrency  := aTotalDescontos;
          FieldByName('TOTALNF').AsCurrency   := aTotalAutorizacao;

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

          // Refazer a listagem de itens
          if (not DtSrcTabelaItens.DataSet.IsEmpty) then
            AbrirTabelaItens;
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
            TServiceMessage.ShowWarning('A Data de Emissão da NF está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

      if dbDataEntrada.Focused then
        if ( dbDataEntrada.Date > Date ) then
            TServiceMessage.ShowWarning('A Data de Entrada da NF está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end;

  // Desistir na inserção de um novo produto/serviço
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) ) then
    DtSrcTabelaItens.DataSet.Cancel
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

function TViewEntrada.ValidarGTIN: Boolean;
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
          TServiceMessage.ShowWarning('Código EAN/GTIN inválido!' + #13 + aError + #13#13 +
            Format('Verifique o cadastro do produto %s e corrija!', [DtSrcTabelaItens.DataSet.FieldByName('DESCRI').AsString]));
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

procedure TViewEntrada.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

function TViewEntrada.Produtos: IControllerCustom;
begin
  Result := Controller.Produtos;
end;

procedure TViewEntrada.AbrirNotaFiscal;
begin
  Controller.CarregarNFe;

  // Configurar tabela de NFe
  TTabelaController
    .New
    .Tabela( DtSrcTabelaNFE.DataSet )
    .Display('NUMERO', 'Número', '###0000000', TAlignment.taCenter, True)
    .Display('DATAEMISSAO', 'Data', 'dd/mm/yyyy', TAlignment.taCenter, True)
    .Display('HORAEMISSAO', 'Hora', 'hh:nn', TAlignment.taCenter, True)
    .Configurar;
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

      AbrirTabelaItens;
      AbrirTabelaDuplicatas;
      AbrirTabelaLotes;
      AbrirNotaFiscal;

      TServiceMessage.ShowInformation('Correção', 'CFOP corrigido com sucesso!' + #13 + 'Favor pesquisar entrada novamente.');
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

      if not TServiceMessage.ShowConfirmation('Limpar LOG', 'Confirma a limpeza do LOG de envio de NF-e para que esta seja enviada novamente?') then
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

      Controller.LimparLoteEmissaoNFe;
      RecarregarRegistro;

      AbrirNotaFiscal;

      TServiceMessage.ShowInformation('Dados NF-e', 'LOG de envio de recibo NF-e limpo com sucesso!');
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
      TServiceMessage.ShowInformation('Dados NF-e', 'Número de Recibo de Envio da NF-e:' + #13 + Trim(FieldByName('LOTE_NFE_RECIBO').AsString));
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
      TServiceMessage.ShowInformation('Dados NF-e', 'Chave da NF-e:' + #13 + Trim(FieldByName('VERIFICADOR_NFE').AsString));
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
      TServiceMessage.ShowInformation('Dados NF-e', 'Nome do Arquivo XML NF-e:' + #13 + Trim(FieldByName('XML_NFE_FILENAME').AsString));
    end;
end;

initialization
  FormFunction.RegisterForm('ViewEntrada', TViewEntrada);

end.
