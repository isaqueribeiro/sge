unit View.AutorizacaoCompra;

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

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsDefaultPainters,
  dxSkinsCore,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,

  UObserverInterface,
  UConstantesDGE,
  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Impressao.AutorizacaoCompra;

type
  TViewAutorizacaoCompra = class(TViewPadraoCadastro)
    lblData: TLabel;
    RdgStatusAutorizacao: TRadioGroup;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    lblFornecedor: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    lblAutorizador: TLabel;
    dbAutorizador: TDBEdit;
    Bevel12: TBevel;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirAutorizacao: TMenuItem;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsFormaPagto: TTabSheet;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    dtsTipoAutorizacao: TDataSource;
    lblDataValidade: TLabel;
    GrpBxPagamento: TGroupBox;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
    lblTotalDesconto: TLabel;
    dbTotalDesconto: TDBEdit;
    dbTotalLiquido: TDBEdit;
    lblTotalLiquido: TLabel;
    lblTotalFrete: TLabel;
    dbTotalFrete: TDBEdit;
    lblTotalIPI: TLabel;
    dbTotalIPI: TDBEdit;
    lblValorTotalIPI: TLabel;
    dbValorTotalIPI: TDBEdit;
    lblPercentualIPI: TLabel;
    dbPercentualIPI: TDBEdit;
    lblTotalBruto: TLabel;
    dbTotalBruto: TDBEdit;
    tbsRetirada: TTabSheet;
    GrpBxRetirada: TGroupBox;
    lblRecebedorNome: TLabel;
    lblRecebedorCPF: TLabel;
    lblRecebedorFuncao: TLabel;
    lblTransportador: TLabel;
    dbRecebedorNome: TDBEdit;
    dbRecebedorCPF: TDBEdit;
    dbRecebedorFuncao: TDBEdit;
    dbTransportador: TDBLookupComboBox;
    pnlRetiradaEntrega: TPanel;
    lblEnderecoEntrega: TLabel;
    Bevel5: TBevel;
    dbEnderecoEntrega: TDBMemo;
    Bevel9: TBevel;
    dtsTransportador: TDataSource;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    PgcTextoAutorizacao: TPageControl;
    TbsAutorizacaoMotivo: TTabSheet;
    TbsAutorizacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    dbMotivo: TDBMemo;
    lblCliente: TLabel;
    TbsAutorizacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblCentroCusto: TLabel;
    btnFinalizarAutorizacao: TcxButton;
    btnAutorizarReabrir: TcxButton;
    btnCancelarAutorizacao: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    dbFornecedor: TJvDBComboEdit;
    dbCliente: TJvDBComboEdit;
    dbCentroCusto: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    ppAutorizacao: TPopupMenu;
    ppmAutorizarCompra: TMenuItem;
    ppmReabrirAutorizacao: TMenuItem;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoEditando: TShape;
    shpOperacaoCancelada: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoCancelada: TLabel;
    lblOperacaoEditando: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirAutorizacaoClick(Sender: TObject);
    procedure btnCancelarAutorizacaoClick(Sender: TObject);
    procedure btnFinalizarAutorizacaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure dbCentroCustoButtonClick(Sender: TObject);
    procedure ppmAutorizarCompraClick(Sender: TObject);
    procedure ppmReabrirAutorizacaoClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure ControllerAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FImpressao : IImpressaoAutorizacaoCompra;
    FControllerEmpresaView,
    FControllerTipoAutorizacaoView,
    FControllerFormaPagto ,
    FControllerCondicaoPagtoView,
    FControllerTransportadora   : IControllerCustom;
    FControllerProduto    : IControllerProduto;
    FControllerFornecedor : IControllerFornecedor;

    iSeq : Integer;
    iTipoAutorizacao : Integer;
    iFornecedor : Integer;

    procedure AbrirTabelaItens;
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);

    function Controller : IControllerAutorizacaoCompra;
    function Produtos : IControllerCustom;
    function Empresa : IControllerEmpresa;
    function Fornecedor : IControllerFornecedor;

    function GetRotinaFinalizarID : String;
    function GetRotinaAutorizarID : String;
    function GetRotinaCancelarAutorizacaoID : String;
    function GetRotinaReabrirAutorizacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAutorizarID : String read GetRotinaAutorizarID;
    property RotinaCancelarAutorizacaoID : String read GetRotinaCancelarAutorizacaoID;
    property RotinaReabrirAutorizacaoID  : String read GetRotinaReabrirAutorizacaoID;
  end;

(*
  Tabelas:
  - TBAUTORIZA_COMPRA
  - TBAUTORIZA_COMPRAITEM
  - TBFORNECEDOR
  - TBCLIENTE
  - TBCENTRO_CUSTO
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBFORMPAGTO

  Views:
  - VW_EMPRESA
  - VW_TIPO_AUTORIZACAO
  - VW_CONDICAOPAGTO

  Procedures:
*)

var
  ViewAutorizacaoCompra: TViewAutorizacaoCompra;

  procedure MostrarControleAutorizacao(const AOwner : TComponent);

  function SelecionarAutorizacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa, Motivo, Observacao : String; var FormaPagto, CondicaoPagto : Integer;
    var TotalProduto, TotalDescontos, TotalAutorizacao : Currency) : Boolean; overload;
  function SelecionarAutorizacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa, Motivo, Observacao : String) : Boolean; overload;
  function SelecionarAutorizacaoParaApropriacao(const AOwner : TComponent; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa, aObservacao : String) : Boolean;

implementation

uses
    System.DateUtils
  , System.SysConst
  , UDMRecursos
  , UDMBusiness
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , Service.Message
  , View.Fornecedor
  , View.Produto
  , View.AutorizacaoCompra.Cancelar
  , View.Cliente
  , View.CentroCusto;

{$R *.dfm}

procedure MostrarControleAutorizacao(const AOwner : TComponent);
var
  AForm : TViewAutorizacaoCompra;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewAutorizacaoCompra.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);


    AForm.WhereAdditional :=
      '(cast(a.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(a.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusAutorizacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (a.status = ' + IntToStr(AForm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarAutorizacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa, Motivo, Observacao : String; var FormaPagto, CondicaoPagto : Integer;
  var TotalProduto, TotalDescontos, TotalAutorizacao : Currency) : Boolean;
var
  AForm : TViewAutorizacaoCompra;
  aDataInicio,
  aDataFinal ,
  aNome      : String;
  I : Integer;
begin
  AForm := TViewAutorizacaoCompra.Create(AOwner);
  try
    AForm.btbtnIncluir.Visible            := False;
    AForm.btnFinalizarAutorizacao.Visible := False;
    AForm.btnAutorizarReabrir.Visible     := False;
    AForm.btnCancelarAutorizacao.Visible  := False;

    AForm.RdgStatusAutorizacao.ItemIndex := STATUS_AUTORIZACAO_AUT + 1;
    AForm.RdgStatusAutorizacao.Enabled   := False;

    AForm.iFornecedor := Fornecedor;
    AForm.e1Data.Date := DataInicial;

    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    AForm.WhereAdditional :=
      '(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
      '(cast(a.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(a.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusAutorizacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (a.status = ' + IntToStr(AForm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    Result := AForm.SelecionarRegistro(Codigo, aNome, AForm.WhereAdditional);

    if Result then
    begin
      Ano     := AForm.DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      Codigo  := AForm.DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      Empresa := AForm.DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Motivo     := Trim(AForm.DtSrcTabela.DataSet.FieldByName('MOVITO').AsString);
      Observacao := Trim(AForm.DtSrcTabela.DataSet.FieldByName('OBSERVACAO').AsString);
      FormaPagto    := AForm.DtSrcTabela.DataSet.FieldByName('FORMA_PAGTO').AsInteger;
      CondicaoPagto := AForm.DtSrcTabela.DataSet.FieldByName('CONDICAO_PAGTO').AsInteger;
      TotalProduto     := AForm.DtSrcTabela.DataSet.FieldByName('VALOR_BRUTO').AsCurrency;
      TotalDescontos   := AForm.DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;
      TotalAutorizacao := AForm.DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency;
    end;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarAutorizacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa, Motivo, Observacao : String) : Boolean;
var
  aFormaPagto    ,
  aCondicaoPagto : Integer;
  aTotalProduto     ,
  aTotalDescontos   ,
  aTotalAutorizacao : Currency;
begin
  Result := SelecionarAutorizacao(AOwner, Fornecedor, DataInicial, Ano, Codigo, Empresa,
    Motivo, Observacao, aFormaPagto, aCondicaoPagto, aTotalProduto, aTotalDescontos, aTotalAutorizacao);
end;

function SelecionarAutorizacaoParaApropriacao(const AOwner : TComponent; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa, aObservacao : String) : Boolean;
var
  AForm : TViewAutorizacaoCompra;
  aDataInicio,
  aDataFinal ,
  aNome : String;
  I : Integer;
begin
  AForm := TViewAutorizacaoCompra.Create(AOwner);
  try
    AForm.btbtnIncluir.Visible            := False;
    AForm.btnFinalizarAutorizacao.Visible := False;
    AForm.btnAutorizarReabrir.Visible     := False;
    AForm.btnCancelarAutorizacao.Visible  := False;

    AForm.RdgStatusAutorizacao.ItemIndex := STATUS_AUTORIZACAO_AUT + 1;

    AForm.RdgStatusAutorizacao.Enabled := False;

    AForm.iTipoAutorizacao := TIPO_AUTORIZACAO_COMPRA;
    AForm.e1Data.Date      := DataInicial;

    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    AForm.WhereAdditional :=
      '(a.tipo in (' + IntToStr(TIPO_AUTORIZACAO_COMPRA) + ', ' + IntToStr(TIPO_AUTORIZACAO_COMPRA_SERVICO) + ')) and ' +
      '(cast(a.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(a.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusAutorizacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (a.status = ' + IntToStr(AForm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    Result := AForm.SelecionarRegistro(Codigo, aNome, AForm.WhereAdditional);

    with AForm.DtSrcTabela.DataSet do
      if ( Result ) then
      begin
        Ano     := FieldByName('ANO').AsInteger;
        Codigo  := FieldByName('CODIGO').AsInteger;
        Empresa := FieldByName('EMPRESA').AsString;
        aObservacao := FieldByName('MOVITO').AsString;
      end;
  finally
    AForm.Destroy;
  end;
end;

procedure TViewAutorizacaoCompra.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.AutorizacaoCompra;
  FController.DAO.DataSet.AfterScroll := ControllerAfterScroll;

  FControllerEmpresaView         := TControllerFactory.New.EmpresaView;
  FControllerTipoAutorizacaoView := TControllerFactory.New.TipoAutorizacaoView;
  FControllerFormaPagto          := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView   := TControllerFactory.New.CondicaoPagtoView;
  FControllerTransportadora      := TControllerFactory.New.Transportadora;

  DtSrcTabelaItens.DataSet := Produtos.DAO.DataSet;

  inherited;

  e1Data.Date      := IncDay(Date, -30);
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;
  iTipoAutorizacao := -1;
  iFornecedor      := 0;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_AUTORIZACAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBAUTORIZA_COMPRA';
  CampoCodigo    := 'a.codigo';
  CampoDescricao := 'f.nomeforn';
  CampoOrdenacao := 'a.emissao_data, f.nomeforn';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(cast(a.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '(a.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  lblCliente.Visible :=  Empresa.GetAutorizacaoInformarCliente(FController.DAO.Usuario.Empresa.CNPJ);
  dbCliente.Visible  := lblCliente.Visible;

  Tabela
    .Display('CODIGO',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('EMPRESA', 'Empresa', TAlignment.taLeftJustify, True)
    .Display('FORNECEDOR', 'Fornecedor', TAlignment.taLeftJustify, True)
    .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:nn', TAlignment.taLeftJustify, True)
    .Display('TIPO', 'Tipo', TAlignment.taLeftJustify, True)
    .Display('STATUS','Situação', TAlignment.taLeftJustify, True)
    .Display('FORMA_PAGTO', 'Forma de Pagamento', TAlignment.taLeftJustify, True)
    .Display('CONDICAO_PAGTO', 'Condição de Pagamento', TAlignment.taLeftJustify, True)
    .Display('VALOR_BRUTO', 'Valor Bruto', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_DESCONTO', 'Descontos', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL_FRETE', 'Frete', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL_IPI', 'IPI', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL', 'Valor Total', ',0.00', TAlignment.taRightJustify, True)
    .Display('FATURAMENTO_MINIMO', 'Faturamento Mínimo', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoAUtorizacaoView)
    .LookupComboBox(dbTipo, dtsTipoAutorizacao, 'tipo', 'codigo', 'descricao');

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FORMA_PAGTO', 'codigo', 'codigo_descricao');

  TController(FControllerCondicaoPagtoView)
    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'CONDICAO_PAGTO', 'cond_cod', 'cond_descricao');

  TController(FControllerTransportadora)
    .LookupComboBox(dbTransportador, dtsTransportador, 'transportador', 'codforn', 'nomeforn');
end;

procedure TViewAutorizacaoCompra.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    DtSrcTabela.DataSet.FieldByName('NUMERO').AsString :=
      FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger) + '/' +
        Copy(DtSrcTabela.DataSet.FieldByName('ANO').AsString, 3, 2);

    AbrirTabelaItens;
  end;
end;

procedure TViewAutorizacaoCompra.AbrirTabelaItens;
begin
  Controller.CarregarProdutos;

  TTabelaController
    .New
    .Tabela(DtSrcTabelaItens.DataSet)
    .Display('SEQ', '#', '#00', TAlignment.taCenter, True)
    .Display('PRODUTO', 'Produto/Serviço', TAlignment.taLeftJustify, True)
    .Display('QUANTIDADE', 'Quantidade', ',0.###', TAlignment.taRightJustify, True)
    .Display('VALOR_UNITARIO', 'Valor Unit.', ',0.00', TAlignment.taRightJustify, True)
    .Display('IPI_PERCENTUAL', '% IPI', ',0.00', TAlignment.taRightJustify, True)
    .Display('IPI_VALOR_TOTAL', 'Valor IPI', ',0.00', TAlignment.taRightJustify, True)
    .Display('VALOR_TOTAL', 'Valor Total', ',0.00', TAlignment.taRightJustify, True)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewAutorizacaoCompra.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
    if (pgcGuias.ActivePage = tbsCadastro) then
    begin
      btnFinalizarAutorizacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_EDC) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnAutorizarReabrir.Enabled     := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_AUTORIZACAO_EDC, STATUS_AUTORIZACAO_ABR, STATUS_AUTORIZACAO_AUT]);
      ppmAutorizarCompra.Enabled      := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_AUTORIZACAO_EDC, STATUS_AUTORIZACAO_ABR]) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      ppmReabrirAutorizacao.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_AUT);
      btnCancelarAutorizacao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_AUT);

      nmImprimirAutorizacao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_AUT) or (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_FAT);

      btnAutorizarReabrir.Visible     := btnAutorizarReabrir.Enabled;
      btnFinalizarAutorizacao.Visible := btnFinalizarAutorizacao.Enabled;
    end
    else
    begin
      btnFinalizarAutorizacao.Enabled := False;
      btnAutorizarReabrir.Enabled     := False;
      ppmAutorizarCompra.Enabled      := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_ABR) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      ppmReabrirAutorizacao.Enabled   := False;
      btnCancelarAutorizacao.Enabled  := False;

      nmImprimirAutorizacao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_AUT) or (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_FAT);

      btnAutorizarReabrir.Visible     := True;
      btnFinalizarAutorizacao.Visible := True;
    end;
end;

procedure TViewAutorizacaoCompra.RecarregarRegistro;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  if (not DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').IsNull) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime < e1Data.Date ) then
      e1Data.Date := DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime;

    if ( DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime > e2Data.Date ) then
      e2Data.Date := DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime;
  end;

  FController.DAO.RefreshRecord;
end;

procedure TViewAutorizacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_AUTORIZACAO_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_AUTORIZACAO_AUT : sMsg := 'Esta autorização não pode ser alterada porque já está autorizada.';
        STATUS_AUTORIZACAO_FAT : sMsg := 'Esta autorização não pode ser alterada porque já está faturada.';
        STATUS_AUTORIZACAO_CAN : sMsg := 'Esta autorização não pode ser alterada porque está cancelada.';
      end;

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_ABR) then
        if (not TServiceMessage.ShowConfirm('A edição da autorização selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?')) then
          Abort;

      inherited;

      if (not OcorreuErro) then
      begin
        FieldByName('STATUS').Value := STATUS_AUTORIZACAO_EDC;
        AbrirTabelaItens;
      end;
    end;
  end;
end;

procedure TViewAutorizacaoCompra.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    AbrirTabelaItens;
end;

procedure TViewAutorizacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger > STATUS_AUTORIZACAO_ABR) then
  begin
    Case DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger of
      STATUS_AUTORIZACAO_AUT : sMsg := 'Esta autorização não pode ser alterada porque já está autorizada.';
      STATUS_AUTORIZACAO_FAT : sMsg := 'Esta autorização não pode ser alterada porque já está faturada.';
      STATUS_AUTORIZACAO_CAN : sMsg := 'Esta autorização não pode ser alterada porque está cancelada.';
    end;

    TServiceMessage.ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if (not OcorreuErro) then
      AbrirTabelaItens;
  end;
end;

procedure TViewAutorizacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewAutorizacaoCompra.btnProdutoInserirClick(Sender: TObject);
var
  aSequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger = 0 ) then
  begin
    TServiceMessage.ShowWarning('Favor selecionar o fornecedor para a autorização!');
    dbFornecedor.SetFocus;
  end
  else
  if ( DtSrcTabelaItens.DataSet.Active ) then
  begin
    aSequencial := Controller.DAO.NewSequence(DtSrcTabelaItens.DataSet, 'SEQ');

    DtSrcTabelaItens.DataSet.Append;
    DtSrcTabelaItens.DataSet.FieldByName('ANO').Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
    DtSrcTabelaItens.DataSet.FieldByName('CODIGO').Assign( DtSrcTabela.DataSet.FieldByName('CODIGO') );
    DtSrcTabelaItens.DataSet.FieldByName('EMPRESA').Assign( DtSrcTabela.DataSet.FieldByName('EMPRESA') );
    DtSrcTabelaItens.DataSet.FieldByName('FORNECEDOR').Assign( DtSrcTabela.DataSet.FieldByName('FORNECEDOR') );

    DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger := aSequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TViewAutorizacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TViewAutorizacaoCompra.btnProdutoExcluirClick(Sender: TObject);
(*
  procedure GetToTais(var Descontos, TotalLiquido: Currency);
  var
    Item : Integer;
  begin
    Item         := cdsTabelaItensSEQ.AsInteger;
    Descontos    := 0.0;
    TotalLiquido := 0.0;

    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Descontos    := Descontos    + cdsTabelaItensTOTAL_DESCONTO.AsCurrency;
      TotalLiquido := TotalLiquido + cdsTabelaItensTOTAL_LIQUIDO.AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
  end;
*)
//var
//  cDescontos    ,
//  cTotalLiquido : Currency;
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
    if ( TServiceMessage.ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewAutorizacaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Bruto, Total_IPI, Total_Desconto, Total_Liquido: Currency);
  var
    Item : Integer;
  begin
    Item := DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger;

    Total_Bruto    := 0.0;
    Total_IPI      := 0.0;
    Total_Liquido  := 0.0;
    Total_Desconto := DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Bruto := Total_Bruto + DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency;
      Total_IPI   := Total_IPI   + DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_desconto;

    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
  end;

var
  cDescontos    ,
  cTotalBruto   ,
  cTotalFrete   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if (Trim(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString) = EmptyStr) then
    begin
      TServiceMessage.ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency < 0) then
    begin
      TServiceMessage.ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency <= 0) then
    begin
      TServiceMessage.ShowWarning('Valor Unitário inválido.');
      dbValorUn.SetFocus;
    end
    else
    if ((DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency < 0) or (DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency > 100)) then
    begin
      TServiceMessage.ShowWarning('Percentual do IPI inválido.');
      dbPercentualIPI.Field.AsCurrency := 0.0;
      dbPercentualIPI.SetFocus;
    end
    else
    begin
      DtSrcTabelaItens.DataSet.Post;

      GetToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      DtSrcTabela.DataSet.FieldByName('VALOR_BRUTO').AsCurrency     := cTotalBruto;
      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL_IPI').AsCurrency := cTotalIPI;
      DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency  := cTotalDesconto;
      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency     := cTotalLiquido;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TViewAutorizacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoAutorizacao.ActivePage := TbsAutorizacaoMotivo;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_AUTORIZACAO_AUT );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

function TViewAutorizacaoCompra.Empresa: IControllerEmpresa;
begin
//  Result := FControllerEmpresaView as IControllerEmpresa;
  if not Supports(FControllerEmpresaView, IControllerEmpresa, Result) then
    Result := nil;
end;

procedure TViewAutorizacaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]);

  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if (dbProduto.Visible and dbProduto.Enabled) then
      dbProduto.SetFocus;
end;

procedure TViewAutorizacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    pgcMaisDados.ActivePage := tbsFormaPagto;
    TbsAutorizacaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_CAN);
  end;

  HabilitarDesabilitar_Btns;
end;

procedure TViewAutorizacaoCompra.ppmAutorizarCompraClick(Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_AUT) then
    begin
      TServiceMessage.ShowWarning('A Autorização já foi realizada!');
      Abort;
    end;

    AbrirTabelaItens;

    ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

    if ( FieldByName('VALOR_TOTAL').AsCurrency <> cTotalLiquido ) then
    begin
      TServiceMessage.ShowWarning('A soma dos valores totais dos itens (' +
        FormatFloat('"R$ ",0.00', cTotalLiquido) +
        ') não confere com o Valor Total da Autorização.' + #13#13 +
        'Favor excute os seguintes procedimentos:' + #13 +
        '1. Altere o registro para correção.'      + #13 +
        '2. Salve a alteração realizada.'          + #13 +
        '3. Finalize-o novamente.');
      Abort;
    end;

    if ( TServiceMessage.ShowConfirm('Confirma a autorização do registro selecionado?') ) then
    begin
      if ( cTotalLiquido < FieldByName('FATURAMENTO_MINIMO').AsCurrency ) then
      begin
        TServiceMessage.ShowWarning(Format('O Faturamento Mínimo (%s) deste fornecedor não permite que essa autorização de compra/serviço seja autorizada!',
          [FormatFloat('"R$ ",0.00', FieldByName('FATURAMENTO_MINIMO').AsCurrency)]));
        Exit;
      end;

      Edit;

      FieldByName('STATUS').AsInteger            := STATUS_AUTORIZACAO_AUT;
      FieldByName('AUTORIZADO_DATA').AsDateTime  := Now;
      FieldByName('AUTORIZADO_USUARIO').AsString := FController.DAO.Usuario.Login;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Autorização realizada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
      RdgStatusAutorizacao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewAutorizacaoCompra.ppmReabrirAutorizacaoClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_ABR) then
    begin
      TServiceMessage.ShowWarning('A Autorização já está aberta!');
      Abort;
    end
    else
    if (FieldByName('STATUS').AsInteger in [STATUS_AUTORIZACAO_FAT, STATUS_AUTORIZACAO_CAN]) then
    begin
      TServiceMessage.ShowWarning('Apenas registros "Autorizados" podem ser reabertos!');
      Abort;
    end;

    AbrirTabelaItens;

    if TServiceMessage.ShowConfirm('Confirma a reabertura do registro selecionado?') then
      try
        Edit;

        FieldByName('STATUS').AsInteger := STATUS_AUTORIZACAO_ABR;
        FieldByName('AUTORIZADO_DATA').Clear;
        FieldByName('AUTORIZADO_USUARIO').Clear;

        PgcTextoAutorizacao.ActivePage := TbsAutorizacaoMotivo;
        dbObservacao.Lines.Add(
          Format('Autorização reaberta para correção por %s em %s.',
            [FController.DAO.Usuario.Login, FormatDateTime('dd/mm/yyyy "às" hh:mm', Now)])
        );

        DtSrcTabela.DataSet.Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        TServiceMessage.ShowInformation('Autorização reaberta com sucesso !');

        HabilitarDesabilitar_Btns;

        RdgStatusAutorizacao.ItemIndex := 0;
      finally
      end;
  end;
end;

function TViewAutorizacaoCompra.Produtos: IControllerCustom;
begin
  Result := Controller.Produtos;
end;

procedure TViewAutorizacaoCompra.btnFiltrarClick(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(a.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  WhereAdditional := WhereAdditional +
    IfThen(iTipoAutorizacao = -1, EmptyStr,
      IfThen(iTipoAutorizacao = TIPO_AUTORIZACAO_SERVICO,
        ' and (a.tipo = ' + IntToStr(TIPO_AUTORIZACAO_SERVICO) + ')',
        ' and (a.tipo in (' + IntToStr(TIPO_AUTORIZACAO_COMPRA) + ', ' + IntToStr(TIPO_AUTORIZACAO_COMPRA_SERVICO) + ')) and ')) +
    IfThen(iFornecedor = 0, EmptyStr,
      ' and (a.fornecedor = ' + IntToStr(iFornecedor) + ') ') +
      ' and (cast(a.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ')';

  if ( RdgStatusAutorizacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (a.status = ' + IntToStr(RdgStatusAutorizacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TViewAutorizacaoCompra.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger := iCodigo;
      DtSrcTabela.DataSet.FieldByName('NOMEFORN').AsString    := sNome;
    end;
end;

procedure TViewAutorizacaoCompra.CarregarDadosProduto(Codigo: Integer);
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
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString             := FieldByName('cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := FieldByName('descri_apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString           := FieldByName('Unp_sigla').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de produto não cadastrado!');
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewAutorizacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if DtSrcTabelaItens.DataSet.IsEmpty then
    TServiceMessage.ShowWarning('Favor informar o(s) produto(s) da autorização.')
  else
  if btnProdutoSalvar.Enabled then
  begin
    TServiceMessage.ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da autorização!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger);

      if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        TServiceMessage.ShowWarning('Número de autorização já existe!');
        Abort;
      end;

      FieldByName('MOVITO').AsString     := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));
      FieldByName('ENDERECO_ENTREGA').AsString := Trim(AnsiUpperCase(FieldByName('ENDERECO_ENTREGA').AsString));

      inherited;

      // Salvar Itens da Base
      if (not OcorreuErro) then
      begin
        if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
          DtSrcTabelaItens.DataSet.Post;

        Produtos.DAO.ApplyUpdates;
        Produtos.DAO.CommitUpdates;
        Produtos.DAO.CommitTransaction;

        RecarregarRegistro;
        AbrirTabelaItens;
      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TViewAutorizacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;

  with DtSrcTabela.DataSet do
  begin
    if (Sender = dbDataEmissao) then
      if (State in [dsEdit, dsInsert]) then
        FieldByName('VALIDADE').AsDateTime := IncDay(FieldByName('EMISSAO_DATA').AsDateTime, PRAZO_VALIDADE_AUTORIZACAO_COMPRA);

    if (Sender = dbProduto ) then
      if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
        CarregarDadosProduto( StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString, 0) );

    if ((Sender = dbQuantidade) or (Sender = dbValorUn) or (Sender = dbPercentualIPI)) then
      if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
      begin
        DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency :=
          DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency *
            DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency;

        DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency :=
          (DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency *
            DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency) / 100.0;
      end;

    if (Sender = dbValorTotal) then
      if (btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled) then
        btnProdutoSalvar.SetFocus;
  end;
end;

function TViewAutorizacaoCompra.Controller: IControllerAutorizacaoCompra;
begin
  Result := (FController as IControllerAutorizacaoCompra);
end;

procedure TViewAutorizacaoCompra.ControllerAfterScroll(DataSet: TDataSet);
begin
  HabilitarDesabilitar_Btns;
end;

procedure TViewAutorizacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TViewAutorizacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar autorização em edição
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_EDC ) then
        dbgDados.Canvas.Brush.Color := shpOperacaoEditando.Brush.Color
      else
      // Destacar autorização aberta
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_ABR ) then
        dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
      else
      // Destacar autorização cancelada
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_CAN ) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos não confirmados o recebimento
  if ( Sender = dbgProdutos ) then
  begin
    if ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_FAT) and (DtSrcTabelaItens.DataSet.FieldByName('CONFIRMADO_RECEBIMENTO').AsInteger = 0) ) then
      dbgProdutos.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TViewAutorizacaoCompra.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  iCodigo    ,
  iCFOP_CNAE ,
  iUnidade   : Integer;
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
  if (DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger = 0) then
  begin
    TServiceMessage.ShowWarning('Favor selecionar o fornecedor para a autorização!');
    dbFornecedor.SetFocus;
  end
  else
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    Case DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger of
      TIPO_AUTORIZACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
                          iEstoque, iReserva);

      TIPO_AUTORIZACAO_SERVICO:
        bSelecionado := SelecionarServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao);

      TIPO_AUTORIZACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if bSelecionado then
    begin
      DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString             := sCodigoAlfa;
      DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := sDescricao;
      DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString           := sUnidade;

      if ( iUnidade > 0 ) then
        DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := iUnidade;
    end;

  end;
end;

procedure TViewAutorizacaoCompra.nmImprimirAutorizacaoClick(
  Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoAutorizacaoCompra.New;

  FImpressao
    .VisualizarAutorizacao(
      DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString,
      DtSrcTabela.DataSet.FieldByName('FORNECEDOR').AsInteger,
      DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
      DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger
    );
end;

procedure TViewAutorizacaoCompra.btnCancelarAutorizacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_CAN) then
    begin
      TServiceMessage.ShowWarning('Lançamento de Autorização já está cancelado!');
      Abort;
    end;

    AbrirTabelaItens;

    if (FieldByName('STATUS').AsInteger <> STATUS_AUTORIZACAO_AUT) then
      TServiceMessage.ShowInformation('Apenas registros autorizados podem ser cancelados!')
    else
    if ( CancelarAUT(Self, FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('EMPRESA').AsString) ) then
      with DtSrcTabela.DataSet do
      begin
        RecarregarRegistro;

        TServiceMessage.ShowInformation('Autorização cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

        HabilitarDesabilitar_Btns;
      end;
  end;
end;

procedure TViewAutorizacaoCompra.btnFinalizarAutorizacaoClick(
  Sender: TObject);
var
  cTotalBruto   ,
  cTotalIPI     ,
  cTotalDesconto,
  cTotalLiquido : Currency;
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_ABR) then
    begin
      TServiceMessage.ShowWarning('Lançamento de Autorização já está finalizado!');
      Abort;
    end;

    AbrirTabelaItens;

    if TServiceMessage.ShowConfirm('Confirma a finalização da edição do autorização?') then
    begin
      ValidarToTais(cTotalBruto, cTotalIPI, cTotalDesconto, cTotalLiquido);

      if ( cTotalLiquido < FieldByName('FATURAMENTO_MINIMO').AsCurrency ) then
      begin
        TServiceMessage.ShowWarning(Format('O Faturamento Mínimo (%s) deste fornecedor não permite que essa autorização de compra/serviço seja emitida!',
          [FormatFloat('"R$ ",0.00', FieldByName('FATURAMENTO_MINIMO').AsCurrency)]) + #13 +
          'Apenas autorizações com valores iguais ou acima do faturamento mínimo poderão ser emitidas.');
        Exit;
      end;

      Edit;

      FieldByName('STATUS').AsInteger           := STATUS_AUTORIZACAO_ABR;
      FieldByName('VALOR_BRUTO').AsCurrency     := cTotalBruto;
      FieldByName('VALOR_TOTAL_IPI').AsCurrency := cTotalIPI;
      FieldByName('VALOR_DESCONTO').AsCurrency  := cTotalDesconto;
      FieldByName('VALOR_TOTAL').AsCurrency     := cTotalLiquido;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Autorização finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusAutorizacao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewAutorizacaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if ( (Field = DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE'))
      or (Field = DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO'))
      or (Field = DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL')) ) then
    begin
      DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency     :=
        DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency;
      DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency :=
        (DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('IPI_PERCENTUAL').AsCurrency) / 100.0;
    end;
end;

procedure TViewAutorizacaoCompra.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  { DONE -oIsaque -cAutorizacao : 22/05/2014 - Preenchimento automático ENDEREÇO DE ENTREGA E OBSERVAÇÕES no momento da inserção }
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
    begin
      if (Field = FieldByName('EMPRESA')) then
      begin
        if (State = dsInsert) then
        begin
          FieldByName('ENDERECO_ENTREGA').AsString := Empresa.GetEmpresaEndereco(FieldByName('EMPRESA').AsString);
          FieldByName('OBSERVACAO').AsString       := 'NF. EM NOME DA ' + FController.DAO.Usuario.Empresa.RazaoSocial;
        end;
      end
      else
      if ((Field = FieldByName('VALOR_BRUTO')) or (Field = FieldByName('VALOR_TOTAL_FRETE')) or (Field = FieldByName('VALOR_DESCONTO'))) then
        FieldByName('VALOR_TOTAL').AsCurrency :=
          (FieldByName('VALOR_BRUTO').AsCurrency + FieldByName('VALOR_TOTAL_IPI').AsCurrency) - FieldByName('VALOR_DESCONTO').AsCurrency;
    end;
  end;
end;

procedure TViewAutorizacaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if (Key = VK_RETURN) then
    begin

      if (State in [dsEdit, dsInsert])  then
      begin
        if dbNumero.Focused then
          if ( Length(Trim(dbNumero.Text)) > 0 ) then
            if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              TServiceMessage.ShowWarning('Número de autorização já existe!' + #13 + 'Controle: ' + sControle);

        { DONE -oIsaque -cAutorizacao : 22/05/2014 - Verificar Data de Emissão da Autorização }

        if dbDataEmissao.Focused then
          if ( dbDataEmissao.Date > Now ) then
              TServiceMessage.ShowWarning('A Data de Emissão da autorização está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');
      end;

    end
    else
    if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
    begin
      if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
        if ( dbCliente.Focused ) then
        begin
          FieldByName('CLIENTE').Clear;
          FieldByName('NOMECLIENTE').Clear;
        end
        else
        if ( dbCentroCusto.Focused ) then
        begin
          FieldByName('CENTRO_CUSTO').Clear;
          FieldByName('DESCRICAO_CENTRO_CUSTO').Clear;
        end;
    end;
  end;

  // Desistir na inserção de um novo produto/serviço
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) ) then
    DtSrcTabelaItens.DataSet.Cancel
  else
    inherited;
end;

function TViewAutorizacaoCompra.GetRotinaAutorizarID: String;
begin
  Result := GetRotinaInternaID(ppmAutorizarCompra);
end;

function TViewAutorizacaoCompra.GetRotinaCancelarAutorizacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarAutorizacao);
end;

function TViewAutorizacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarAutorizacao);
end;

function TViewAutorizacaoCompra.GetRotinaReabrirAutorizacaoID: String;
begin
  Result := GetRotinaInternaID(ppmReabrirAutorizacao);
end;

procedure TViewAutorizacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarAutorizacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarAutorizacao.Caption, RotinaID);

    if ppmAutorizarCompra.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAutorizarID, ppmAutorizarCompra.Caption, RotinaID);

    if btnCancelarAutorizacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarAutorizacaoID, btnCancelarAutorizacao.Caption, RotinaID);

    if ppmReabrirAutorizacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaReabrirAutorizacaoID, ppmReabrirAutorizacao.Caption, RotinaID);
  end;
end;

procedure TViewAutorizacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

function TViewAutorizacaoCompra.Fornecedor: IControllerFornecedor;
begin
  if not Assigned(FControllerFornecedor) then
    FControllerFornecedor := TControllerFactory.New.Fornecedor;

  Result := FControllerFornecedor;
end;

procedure TViewAutorizacaoCompra.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome : String;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sNome) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CLIENTE').AsInteger    := iCodigo;
      DtSrcTabela.DataSet.FieldByName('NOMECLIENTE').AsString := sNome;
    end;
end;

procedure TViewAutorizacaoCompra.ValidarToTais(var Total_Bruto, Total_IPI,
  Total_Desconto, Total_Liquido: Currency);
var
  Item : Integer;
begin
  Item := DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger;

  Total_Bruto    := 0.0;
  Total_IPI      := 0.0;
  Total_Liquido  := 0.0;
  Total_Desconto := DtSrcTabela.DataSet.FieldByName('VALOR_DESCONTO').AsCurrency;

  DtSrcTabelaItens.DataSet.First;

  try
    DtSrcTabelaItens.DataSet.DisableControls;
    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Bruto := Total_Bruto + DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL').AsCurrency;
      Total_IPI   := Total_IPI   + DtSrcTabelaItens.DataSet.FieldByName('IPI_VALOR_TOTAL').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    Total_Liquido  := (Total_Bruto + Total_IPI) - Total_Desconto;
  finally
    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
    DtSrcTabelaItens.DataSet.EnableControls;
  end;
end;

procedure TViewAutorizacaoCompra.dbCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
      if SelecionarDepartamento(Self, FieldByName('CLIENTE').AsInteger, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) then
      begin
        FieldByName('CENTRO_CUSTO').AsInteger          := iCodigo;
        FieldByName('DESCRICAO_CENTRO_CUSTO').AsString := sNome;
      end;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewAutorizacaoCompra', TViewAutorizacaoCompra);

end.
