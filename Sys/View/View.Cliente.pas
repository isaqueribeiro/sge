unit View.Cliente;

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

  cxControls,
  cxStyles,
  cxEdit,
  cxDBLookupComboBox,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxVGrid,
  cxDBVGrid,
  cxInplaceContainer,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Service.Request.CNPJ,
  Service.Request.CEP,
  UObserverInterface,
  UCliente,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela, dxSkinsDefaultPainters, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, cxFilter, dxScrollbarAnnotations;

type
  TViewCliente = class(TViewPadraoCadastro, IObserver)
    dbPessoaFisica: TDBCheckBox;
    lblCNPJ: TLabel;
    lblRazao: TLabel;
    dbRazao: TDBEdit;
    lblIE: TLabel;
    dbIE: TDBEdit;
    lblIM: TLabel;
    dbIM: TDBEdit;
    GroupBox1: TGroupBox;
    lblCidade: TLabel;
    Bevel5: TBevel;
    lblEstado: TLabel;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    tbsCompra: TTabSheet;
    lblBairro: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblComplemento: TLabel;
    dbComplemento: TDBEdit;
    lblFoneFixo: TLabel;
    dbFoneFixo: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblHome: TLabel;
    dbHome: TDBEdit;
    lblPais: TLabel;
    lblValorLimiteCompra: TLabel;
    dbValorLimiteCompra: TDBEdit;
    lblTotalCompras: TLabel;
    dbTotalCompras: TDBEdit;
    dtsTotalComprasAbertas: TDataSource;
    lblLimiteDisponivel: TLabel;
    dbLimiteDisponivel: TDBEdit;
    dtsTitulos: TDataSource;
    pnlTitulos: TPanel;
    dbgTitulos: TDBGrid;
    lblTituloEmAberto: TLabel;
    lblTituloPagando: TLabel;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    Bevel6: TBevel;
    dbcBloqueio: TDBCheckBox;
    Bevel10: TBevel;
    lblFoneCelular: TLabel;
    dbFoneCelular: TDBEdit;
    lblFoneComercial: TLabel;
    dbFoneComercial: TDBEdit;
    dtsVendedor: TDataSource;
    lblVendedor: TLabel;
    dbVendedor: TDBLookupComboBox;
    popProcesso: TPopupMenu;
    mpClienteBloquear: TMenuItem;
    mpClienteDesbloquear: TMenuItem;
    tbsDadosAdcionais: TTabSheet;
    dbNFeDevolucao: TDBCheckBox;
    GrpBxCustosOper: TGroupBox;
    lblFrete: TLabel;
    lblOutros: TLabel;
    dbCustoOperacional: TDBCheckBox;
    dbFrete: TDBEdit;
    dbOutros: TDBEdit;
    dbEntregaFracionada: TDBCheckBox;
    tbsEstoqueSatelite: TTabSheet;
    pnlPesquisarEstoqueSatelite: TPanel;
    GroupBox2: TGroupBox;
    btnPesquisarEstoqueSatelite: TSpeedButton;
    edFiltrarEstoqueSatelite: TEdit;
    edFiltrarTipoEstoqueSatelite: TComboBox;
    Bevel11: TBevel;
    lblInformeSatelite: TLabel;
    dbgEstoqueSatelite: TDBGrid;
    pnlControleRequisicao: TPanel;
    Bevel12: TBevel;
    chkProdutoComEstoque: TCheckBox;
    DtsEstoqueSatelite: TDataSource;
    CmbBxFiltrarTipo: TComboBox;
    dtsTipoCnpj: TDataSource;
    lblTipoCNPJ: TLabel;
    dbTipoCNPJ: TDBLookupComboBox;
    dtsBancoFebraban: TDataSource;
    tbsDadoFinanceiro: TTabSheet;
    tbsObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    lblNomeFantasia: TLabel;
    dbNomeFantasia: TDBEdit;
    BtBtnProcesso: TcxButton;
    BtnRequisicoes: TcxButton;
    dbCNPJ: TJvDBComboEdit;
    dbEstado: TJvDBComboEdit;
    dbCidade: TJvDBComboEdit;
    dbBairro: TJvDBComboEdit;
    dbLogradouro: TJvDBComboEdit;
    dbPais: TJvDBComboEdit;
    dbCadastroAtivo: TDBCheckBox;
    dbgContaCorrente: TcxDBVerticalGrid;
    dbCtgrConta1: TcxCategoryRow;
    dbBanco1: TcxDBEditorRow;
    dbAgencia1: TcxDBEditorRow;
    dbContaCorrente1: TcxDBEditorRow;
    dbPracaCobranca1: TcxDBEditorRow;
    dbCtgrConta2: TcxCategoryRow;
    dbBanco2: TcxDBEditorRow;
    dbAgencia2: TcxDBEditorRow;
    dbContaCorrente2: TcxDBEditorRow;
    dbPracaCobranca2: TcxDBEditorRow;
    dbCtgrConta3: TcxCategoryRow;
    dbBanco3: TcxDBEditorRow;
    dbAgencia3: TcxDBEditorRow;
    dbContaCorrente3: TcxDBEditorRow;
    dbPracaCobranca3: TcxDBEditorRow;
    imgAjuda: TImage;
    Panel1: TPanel;
    lblRegistroDesativado: TLabel;
    lblMotivoBloqueio: TLabel;
    lblCEP: TLabel;
    dbCEP: TJvDBComboEdit;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtBtnProcessoClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure mpClienteDesbloquearClick(Sender: TObject);
    procedure mpClienteBloquearClick(Sender: TObject);
    procedure dbCNPJButtonClick(Sender: TObject);
    procedure btnPesquisarEstoqueSateliteClick(Sender: TObject);
    procedure edFiltrarEstoqueSateliteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbgEstoqueSateliteKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure ProdutoSelecionado(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgContaCorrenteExit(Sender: TObject);
    procedure dbgContaCorrenteEnter(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure CmbBxFiltrarTipoKeyPress(Sender: TObject; var Key: Char);
    procedure DataSetTituloSituacaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure imgAjudaClick(Sender: TObject);
    procedure DataSetEstoqueUltimaVendaGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure DtSrcTabelaAfterScroll(DataSet : TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure dbCEPButtonClick(Sender: TObject);
  private
    { Private declarations }
    FControllerVendedor           ,
    FControllerTipoCNPJView       ,
    FControllerBancoFebrabanView  ,
    FControllerClienteTotalCompras,
    FControllerClienteTitulos     ,
    FControllerClienteEstoque     ,
    FControllerEmpresaView        : IControllerCustom;
    FControllerConfiguracoes : IControllerEmpresa;
    FServiceCEP  : TServiceRequestCEP;

    aEstoqueSateliteEmpresa,
    aEstoqueSateliteCliente,
    bApenasPossuiEstoque   : Boolean;

    procedure CarregarBancos;
    procedure GetComprasAbertas(iCodigoCliente : Integer);
    procedure HabilitarAbaEstoque;
    procedure EstoqueSateliteFiltarDados(const iTipoPesquisa : Integer);
    procedure RegistrarNovaRotinaSistema;
    procedure CarregarInformeUsuario;
    procedure BuscarCEP(aRetorno : TEndereco);

    function ServiceCEP : TServiceRequestCEP;
    function GetRotinaBloqueioID : String;
    function GetRotinaVisualizarEstoqueID : String;
    function Controller : IControllerCliente;
    function Empresa  : IControllerEmpresa;
  public
    { Public declarations }
    property RotinaBloqueioID : String read GetRotinaBloqueioID;
    property RotinaVisualizarEstoqueID : String read GetRotinaVisualizarEstoqueID;

    procedure Update(Observeble: IObservable); overload;
    procedure Update(Observeble: IObservable; sMessage: string); overload;
    procedure FiltarDados(const iTipoPesquisa : Integer); overload;
  end;

(*
  Tabelas:
  - TBCLIENTE
  - TBTIPO_LOGRADOURO
  - TBLOGRADOURO
  - TBCIDADE
  - TBESTADO
  - TBPAIS
  - TBCLIENTE_ESTOQUE
  - TBPRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBUNIDADEPROD
  - TBFABRICANTE
  - TBVENDEDOR
  - TBCONTREC
  - TBFORMPAGTO
  - TBVENDAS

  Views:
  - VW_TIPO_CNPJ
  - VW_BANCO_FEBRABAN

  Procedures:
  - GET_LIMITE_DISPONIVEL_CLIENTE
*)

var
  ViewCliente: TViewCliente;

  procedure MostrarTabelaClientes(const AOwner : TComponent);

  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String; const PossueEstoque : Boolean) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, InscEstudual, Nome : String; var Bloqueado : Boolean; var MotivoBloqueio : String) : Boolean; overload;

  function SelecionarProdutoCliente(const AOwner : TComponent; iCodigo : Integer; var sCodigo, sDescricao, sLote : String; var iEstoque : Integer;
    var cValorMedio : Currency) : Boolean;

implementation

uses
  UConstantesDGE,
  UDMBusiness,
  UDMRecursos,
  FuncoesFormulario,
  Service.InputQuery,
  Service.Message,
  Service.Utils,
  View.Servico.ConsultarCNPJ,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Bairro,
  View.Cidade,
  View.Distrito,
  View.Estado,
  View.Logradouro,
  UGrPadrao;

{$R *.dfm}

procedure MostrarTabelaClientes(const AOwner : TComponent);
var
  frm : TViewCliente;
begin
  frm := TViewCliente.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewCliente;
begin
  frm := TViewCliente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String; const PossueEstoque : Boolean) : Boolean;
var
  frm : TViewCliente;
begin
  frm := TViewCliente.Create(AOwner);
  try
    frm.bApenasPossuiEstoque  := PossueEstoque;
    frm.Bevel10.Visible       := not PossueEstoque;
    frm.BtBtnProcesso.Visible := not PossueEstoque;

    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
      CNPJ := frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean;
var
  frm : TViewCliente;
begin
  frm := TViewCliente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
      CNPJ      := frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCliente(const AOwner : TComponent; var Codigo : Integer;
  var CNPJ, InscEstudual, Nome : String;
  var Bloqueado : Boolean; var MotivoBloqueio : String) : Boolean;
var
  frm : TViewCliente;
begin
  frm := TViewCliente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
    begin
      CNPJ      := frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString;
      Bloqueado := (frm.DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger = 1);
      InscEstudual := Trim(frm.DtSrcTabela.DataSet.FieldByName('INSCEST').AsString);

      if Bloqueado then
        MotivoBloqueio := frm.DtSrcTabela.DataSet.FieldByName('BLOQUEADO_MOTIVO').AsString
      else
        MotivoBloqueio := EmptyStr;
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarProdutoCliente(const AOwner : TComponent; iCodigo : Integer; var sCodigo, sDescricao, sLote : String; var iEstoque : Integer;
  var cValorMedio : Currency) : Boolean;
var
  frm : TViewCliente;
begin
  frm := TViewCliente.Create(AOwner);
  try
    with frm do
    begin
      btbtnIncluir.Visible  := False;
      btbtnAlterar.Visible  := False;
      btbtnExcluir.Visible  := False;
      bvlTool1.Visible      := False;
      btbtnCancelar.Visible := False;
      btbtnSalvar.Visible   := False;
      bvlTool2.Visible      := False;
      btbtnLista.Visible    := False;
      bvlTool3.Visible      := False;
      btbtnFechar.TabStop   := False;

      btbtnFechar.Cancel    := True;

      btbtnSelecionar.Visible := True;

      btbtnSelecionar.OnClick := ProdutoSelecionado;

      Bevel10.Visible         := False;
      BtBtnProcesso.Visible   := False;

      AbrirTabelaAuto := True;

      frm.FController.DAO.ClearWhere;
      frm.FController.DAO.Where('cl.codigo = ' + IntToStr(iCodigo));
      frm.FController.DAO.Open;

      Caption := 'Cliente : ' + FormatFloat('00000', iCodigo) + ' - ' + DtSrcTabela.DataSet.FieldByName('NOME').AsString;

      pgcMaisDados.ActivePage := tbsEstoqueSatelite;
      tbsTabela.TabVisible    := False;
      tbsCadastro.TabVisible  := False;

      Result := (ShowModal = mrOk);

      if Result then
      begin
        sCodigo     := DtsEstoqueSatelite.DataSet.FieldByName('COD_PRODUTO').AsString;
        sDescricao  := DtsEstoqueSatelite.DataSet.FieldByName('DESCRI').AsString;
        sLote       := DtsEstoqueSatelite.DataSet.FieldByName('LOTE_ID').AsString;
        iEstoque    := DtsEstoqueSatelite.DataSet.FieldByName('QUANTIDADE').AsInteger;
        cValorMedio := DtsEstoqueSatelite.DataSet.FieldByName('VALOR_MEDIO').AsCurrency;
      end;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TViewCliente.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Cliente;
  FControllerVendedor            := TControllerFactory.New.Vendedor;
  FControllerTipoCNPJView        := TControllerFactory.New.TipoCNPJView;
  FControllerBancoFebrabanView   := TControllerFactory.New.BancoFebrabanView;
  FControllerClienteTotalCompras := TControllerFactory.New.ClienteTotalCompras;
  FControllerClienteTitulos      := TControllerFactory.New.ClienteTitulos;
  FControllerClienteEstoque      := TControllerFactory.New.ClienteEstoque;
  FControllerConfiguracoes := TControllerFactory.New.EmpresaView;

  dtsTotalComprasAbertas.DataSet := FControllerClienteTotalCompras.DAO.DataSet;
  dtsTitulos.DataSet := FControllerClienteTitulos.DAO.DataSet;
  DtsEstoqueSatelite.DataSet := FControllerClienteEstoque.DAO.DataSet;

  inherited;

  // For�ar a cria��o dos registros padr�es de grupos de fornecedores
  TControllerFactory.New.GrupoFornecedor.DAO.OpenEmpty;

  aEstoqueSateliteEmpresa := FControllerConfiguracoes.GetEstoqueSateliteEmpresa(FController.DAO.Usuario.Empresa.CNPJ);
  aEstoqueSateliteCliente := GetPermissaoRotinaInterna(tbsEstoqueSatelite, False);

  Controller.BloquearClientes;

  RotinaID         := ROTINA_CAD_CLIENTE_ID;
  ControlFirstEdit := dbPessoaFisica;

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBCLIENTE';
  CampoCodigo        := 'cl.codigo';
  CampoDescricao     := 'cl.nome';
  CampoCadastroAtivo := 'cl.ativo';
  CampoOrdenacao     := CampoDescricao;
  WhereAdditional    := '(cl.Codigo > 1)';

  pgcMaisDados.ActivePageIndex := 0;

  if not (FController.DAO.Usuario.Funcao.Codigo in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_SYSTEM_ADM]) then
    dbValorLimiteCompra.Enabled := False;

  tbsEstoqueSatelite.TabVisible := False;
  dbCustoOperacional.Enabled    := FControllerConfiguracoes.GetCalcularCustoOperEmpresa(FController.DAO.Usuario.Empresa.CNPJ);

  lblFrete.Enabled  := dbCustoOperacional.Enabled;
  dbFrete.Enabled   := dbCustoOperacional.Enabled;
  lblOutros.Enabled := dbCustoOperacional.Enabled;
  dbOutros.Enabled  := dbCustoOperacional.Enabled;

  dbEntregaFracionada.ReadOnly  := not aEstoqueSateliteEmpresa;

  tbsDadosAdcionais.TabVisible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  tbsCompra.TabVisible         := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  BtBtnProcesso.Visible        := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  if ( (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]) and (Empresa.GetSegmentoID(FController.DAO.Usuario.Empresa.CNPJ) = SEGMENTO_VAREJO_DELIVERY_ID) ) then
    CmbBxFiltrarTipo.ItemIndex := 3  // Pesquisar por Telefones
  else
  if ( gSistema.Codigo = SISTEMA_PDV ) then
    CmbBxFiltrarTipo.ItemIndex := 1; // Pesquisar por CPF/CNPJ

  if (gSistema.Codigo = SISTEMA_GESTAO_OPME) then
  begin
    dbEntregaFracionada.Enabled := False;
    lblInformeSatelite.Caption  :=
      '* Este estoque de produtos do cliente � alimentado de forma autom�tica a partir das vendas ' +
      'finalizadas com CFOP do tipo Remessa.';
    lblInformeSatelite.Font.Style := [TFontStyle.fsBold];
  end;

  Tabela
    .Display('CODIGO', 'C�digo', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('PESSOA_FISICA', 'Tipo Pessoa', TAlignment.taLeftJustify, True)
    .Display('CNPJ',     'CNPJ', True)
    .Display('NOME',     'Nome / Raz�o Social', True)
    .Display('NOMEFANT', 'Fantasia', False)
    .Display('INSCEST',  'RG / IE', False)
    .Display('INSCMUN',  'Inscri��o Municipal', False)
    .Display('EST_COD',  'Estado', True)
    .Display('CID_COD',  'Cidade', True)
    .Display('BAI_COD',  'Bairro', False)
    .Display('CEP',      'CEP', False)
    .Display('LOG_COD',  'Logradouro', False)
    .Display('VALOR_LIMITE_COMPRA',  'Limte p/ Compras (R$)', ',0.00', TAlignment.taRightJustify, False);

  AbrirTabelaAuto := True;

  TController(FControllerVendedor).LookupComboBox(dbVendedor, dtsVendedor, 'vendedor_cod', 'codigo', 'nome');
  TController(FControllerTipoCNPJView).LookupComboBox(dbTipoCNPJ, dtsTipoCnpj, 'tipo', 'codigo', 'descricao');

  FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
end;

procedure TViewCliente.FormDestroy(Sender: TObject);
begin
  FServiceCEP.Free;
  inherited;
end;

procedure TViewCliente.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbHome ) then
      pgcMaisDados.ActivePage := tbsDadosAdcionais
    else
    if ( Sender = dbCadastroAtivo ) then
      pgcMaisDados.ActivePage := tbsDadoFinanceiro;
  end;
end;

procedure TViewCliente.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
      begin
        FieldByName('EST_COD').AsInteger := iEstado;
        FieldByName('EST_NOME').AsString := sEstado;
        FieldByName('UF').AsString       := sUF;
      end;
  end;
end;

procedure TViewCliente.dbCEPButtonClick(Sender: TObject);
var
  aCEP : String;
  aTipoLog : Smallint;
  aEndereco : IControllerEndereco;
begin
  if (DtSrcTabela.DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
  begin
    dbLogradouro.SetFocus;
    aCEP := TServicesUtils.StrOnlyNumbers(DtSrcTabela.DataSet.FieldByName('CEP').AsString);
    ServiceCEP.Consultar(aCEP, BuscarCEP);
  end;
end;

procedure TViewCliente.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('EST_COD').AsInteger = 0 ) then
      begin
        TServiceMessage.ShowWarning('Favor informar o Estado primeiramente!');
        dbEstado.SetFocus;
      end
      else
      if ( SelecionarCidade(Self, FieldByName('EST_COD').AsInteger, iCidade, sCidade) ) then
      begin
        FieldByName('CID_COD').AsInteger := iCidade;
        FieldByName('CID_NOME').AsString := sCidade;
        FieldByName('CIDADE').AsString   := Copy(sCidade + ' (' + FieldByName('UF').AsString + ')', 1, FieldByName('CIDADE').Size);
        FieldByName('CEP').AsString      := TControllerFactory.New.Endereco.GetCidadeCEP(iCidade);
      end;
  end;
end;

procedure TViewCliente.dbBairroButtonClick(Sender: TObject);
var
  iBairro : Integer;
  sBairro : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('CID_COD').AsInteger = 0 ) then
      begin
        TServiceMessage.ShowWarning('Favor informar a Cidade primeiramente!');
        dbCidade.SetFocus;
      end
      else
      if ( SelecionarBairro(Self, FieldByName('CID_COD').AsInteger, iBairro, sBairro) ) then
      begin
        FieldByName('BAI_COD').AsInteger := iBairro;
        FieldByName('BAIRRO').AsString   := sBairro;
      end;
  end;
end;

procedure TViewCliente.dbLogradouroButtonClick(Sender: TObject);
var
  iTipo : Smallint;
  sTipo : String;
  iLogradouro : Integer;
  sLogradouro : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('CID_COD').AsInteger = 0 ) then
      begin
        TServiceMessage.ShowWarning('Favor informar a Cidade primeiramente!');
        dbCidade.SetFocus;
      end
      else
      if ( SelecionarLogradouro(Self, FieldByName('CID_COD').AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
      begin
        FieldByName('TLG_TIPO').AsInteger  := iTipo;
        FieldByName('LOG_COD').AsInteger   := iLogradouro;
        FieldByName('LOGRADOURO').AsString := Trim(sTipo + ' ' + sLogradouro);
        FieldByName('ENDER').AsString      := Trim(sTipo + ' ' + sLogradouro);
      end;
  end;
end;

procedure TViewCliente.imgAjudaClick(Sender: TObject);
var
  sMsg : String;
begin
  sMsg := 'Informa��es importantes para a gera��o de custos operacionais.' + #13 +
    '---' + #13#13 +
    '1. Estes campos s�o liberados atrav�s da rotina "Configurar Empresa";' + #13 +
    '2. O custo operacional est� ligado diretamente aos gastos estimados para a entrega dos produtos vendidos ao cliente.';

  TServiceMessage.ShowInformation(Self.Caption, sMsg);
end;

procedure TViewCliente.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
    begin
      pgcMaisDados.ActivePageIndex := 0;

      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';
    end
    else
      FieldByName('CNPJ').EditMask := EmptyStr;

    if Trim(FieldByName('CEP').EditMask).IsEmpty then
      FieldByName('CEP').EditMask := '00\.000\-000;0; ';

    BtBtnProcesso.Enabled := Active and (not (State in [dsEdit, dsInsert]));

    mpClienteBloquear.Enabled    := Active and (not (State in [dsEdit, dsInsert])) and (FieldByName('BLOQUEADO').AsInteger = 0);
    mpClienteDesbloquear.Enabled := Active and (not (State in [dsEdit, dsInsert])) and (FieldByName('BLOQUEADO').AsInteger = 1);
  end;
end;

procedure TViewCliente.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  CarregarInformeUsuario;
end;

procedure TViewCliente.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    BtBtnProcesso.Enabled := Active and (not (State in [dsEdit, dsInsert]));

    mpClienteBloquear.Enabled    := Active and (not (State in [dsEdit, dsInsert])) and (FieldByName('BLOQUEADO').AsInteger = 0);
    mpClienteDesbloquear.Enabled := Active and (not (State in [dsEdit, dsInsert])) and (FieldByName('BLOQUEADO').AsInteger = 1);

    if (Field = FieldByName('PESSOA_FISICA')) then
    begin
      lblTipoCNPJ.Enabled := (FieldByName('PESSOA_FISICA').AsInteger = 0);
      dbTipoCNPJ.Enabled  := (FieldByName('PESSOA_FISICA').AsInteger = 0);

      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';
    end;

    if (Field = FieldByName('CEP')) and Trim(FieldByName('CEP').EditMask).IsEmpty then
      FieldByName('CEP').EditMask := '00\.000\-000;0; ';

    if (Field = FieldByName('CUSTO_OPER_PERCENTUAL')) then
      if (FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger = 1) then
      begin
        lblFrete.Caption  := 'Frete (%):';
        lblOutros.Caption := 'Outros (%):';
      end
      else
      begin
        lblFrete.Caption  := 'Frete (R$):';
        lblOutros.Caption := 'Outros (R$):';
      end;
  end;
end;

procedure TViewCliente.btbtnSalvarClick(Sender: TObject);
var
  pTrueFalse : Boolean;
  iCodigo : Integer;
  sRazao  : String;
begin
  pTrueFalse := FControllerConfiguracoes.GetPermitirVerdadeiroFalsoCNPJCliente(FController.DAO.Usuario.Empresa.CNPJ);

  if (Length(Trim(dbCEP.Field.AsString)) < 8) then
  begin
    TServiceMessage.ShowWarning('Favor informar um n�mero de CEP v�lido.');
    Abort;
  end;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
      if ( not FuncoesString.StrIsCPF(FieldByName('CNPJ').AsString, pTrueFalse) ) then
      begin
        TServiceMessage.ShowWarning('Favor informar um CPF v�lido.');
        Abort;
      end;

    if ( FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
    begin
      if ( not FuncoesString.StrIsCNPJ(FieldByName('CNPJ').AsString, pTrueFalse) ) then
      begin
        TServiceMessage.ShowWarning('Favor informar um CNPJ v�lido.');
        Abort;
      end;

      if ( (Trim(FieldByName('UF').AsString) = EmptyStr) or (FieldByName('EST_COD').AsInteger = 0) ) then
      begin
        TServiceMessage.ShowWarning('Favor selecionar o Estado.');
        Abort;
      end;

      if (not TServicesUtils.StrInscricaoEstadual(Trim(FieldByName('INSCEST').AsString), Trim(FieldByName('UF').AsString))) then
      begin
        TServiceMessage.ShowWarning('Favor informar uma Inscri��o Estadual v�lida.');
        Abort;
      end;
    end;

    if (not FieldByName('EMAIL').AsString.IsEmpty) then
      if not TServicesUtils.EmailValido(FieldByName('EMAIL').AsString) then
      begin
        TServiceMessage.ShowWarning('O e-mail informado � inv�lido.');
        Abort;
      end;

    { DONE 1 -oIsaque -cCliente : 16/05/2014 - Rotina para verificar a duplicidade de CPF/CNPJ (1) }

    if Controller.CpfCnpjCadastro(FieldByName('CODIGO').AsInteger, FieldByName('CNPJ').AsString, iCodigo, sRazao) then
      if not FControllerConfiguracoes.GetPermitirDuplicarCNPJCliente(FController.DAO.Usuario.Empresa.CNPJ) then
      begin
        TServiceMessage.ShowWarning('CPF/CNJP j� cadastrado para o cliente ' + sRazao + ' ' + FormatFloat('"("###00000")."', iCodigo) );
        Abort;
      end
      else
      if not TServiceMessage.ShowConfirm('CPF/CNJP j� cadastrado para o cliente ' + sRazao + ' ' + FormatFloat('"("###00000")"', iCodigo) + #13 +
        'Deseja salvar este registro assim mesmo?') then
        Abort;

    if ( FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger = 1 ) then
    begin
      if ((FieldByName('CUSTO_OPER_FRETE').AsCurrency < 0) or (FieldByName('CUSTO_OPER_FRETE').AsCurrency > 100)) then
      begin
        TServiceMessage.ShowWarning('Percentual de custo operacional para "Frete" inv�lido!');
        Exit;
      end;

      if ((FieldByName('CUSTO_OPER_OUTROS').AsCurrency < 0) or (FieldByName('CUSTO_OPER_OUTROS').AsCurrency > 100)) then
      begin
        TServiceMessage.ShowWarning('Percentual de custo operacional para "Outros" inv�lido!');
        Exit;
      end;
    end;

    if (Trim(FieldByName('USUARIO').AsString) = EmptyStr) then
      FieldByName('USUARIO').AsString := FController.DAO.Usuario.Login;

    if FieldByName('CUSTO_OPER_PERCENTUAL').IsNull then
      FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger := 1;

    if FieldByName('EMITIR_NFE_DEVOLUCAO').IsNull then
      FieldByName('EMITIR_NFE_DEVOLUCAO').AsInteger := 0;

    if FieldByName('ENTREGA_FRACIONADA_VENDA').IsNull then
      FieldByName('ENTREGA_FRACIONADA_VENDA').AsInteger := 0;

    if FieldByName('BLOQUEADO_AUTOMATICO').IsNull then
      FieldByName('BLOQUEADO_AUTOMATICO').AsInteger := 0;

    if (FieldByName('PESSOA_FISICA').AsInteger = 1) then
      FieldByName('TIPO').AsInteger := 0;

    inherited;
    GetComprasAbertas( FieldByName('CODIGO').AsInteger );
  end;

  HabilitarAbaEstoque;
end;

procedure TViewCliente.GetComprasAbertas(iCodigoCliente : Integer);
begin
  FControllerClienteTotalCompras.DAO.DataSet.Close;

  FControllerClienteTotalCompras.DAO
    .ParamsByName('cliente', iCodigoCliente)
    .Open;

  // Preparar DataSet para a configura��o dos campos
  TTabelaController.New
    .Tabela(dtsTotalComprasAbertas.DataSet)
    .Display('VALOR_COMPRAS_ABERTAS', 'Total Compras Abertas (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_LIMITE_DISPONIVEL', 'Limite Dispon�vel (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar;

  FControllerClienteTitulos.DAO
    .ParamsByName('cliente', iCodigoCliente)
    .Open;

  dtsTitulos.DataSet.FieldByName('SITUACAO').OnGetText := DataSetTituloSituacaoGetText;

  // Preparar DataSet para a configura��o dos campos
  TTabelaController.New
    .Tabela(dtsTitulos.DataSet)
    .Display('DTEMISS',    'Emiss�o', 'dd/mm/yyyy', TAlignment.taCenter)
    .Display('DTVENC',     'Vencimento', 'dd/mm/yyyy', TAlignment.taCenter)
    .Display('VALORREC',   'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_PAGO', 'Pago (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'A Pagar (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar;
end;

procedure TViewCliente.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    CarregarBancos;
    GetComprasAbertas( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
  end;
end;

procedure TViewCliente.dbgContaCorrenteEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TViewCliente.dbgContaCorrenteExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if ( DtSrcTabela.DataSet.State = dsInsert ) then
  begin
    pgcMaisDados.ActivePage := tbsObservacao;
    dbObservacao.SetFocus;
  end;
end;

procedure TViewCliente.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Cliente bloqueado
    if ( DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger = 1 ) then
      dbgDados.Canvas.Font.Color := lblMotivoBloqueio.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  if ( Sender = dbgTitulos ) then
  begin
    // Destacar T�tulos em Pagamento
    if ( (dtsTitulos.DataSet.FieldByName('VALOR_PAGO').AsCurrency > 0) and (dtsTitulos.DataSet.FieldByName('TIPO').AsInteger = 1) ) then
      dbgTitulos.Canvas.Font.Color := lblTituloPagando.Font.Color
    else
    // Destacar T�tulos Cancelados
    if ( dtsTitulos.DataSet.FieldByName('TIPO').AsInteger = 1 ) then
      dbgTitulos.Canvas.Font.Color := lblTituloEmAberto.Font.Color
    else
    // T�tulos pagos de forma imediata (A Vista)
    if ( dtsTitulos.DataSet.FieldByName('TIPO').AsInteger = 0 ) then
      dbgTitulos.Canvas.Font.Style := [];

    dbgTitulos.DefaultDrawDataCell(Rect, dbgTitulos.Columns[DataCol].Field, State);
  end
  else
  if ( Sender = dbgEstoqueSatelite ) then
  begin
    // Estoque sat�lite zerado
    if ( DtsEstoqueSatelite.DataSet.FieldByName('QUANTIDADE').AsInteger < 1 ) then
      dbgEstoqueSatelite.Canvas.Font.Color := clRed;

    dbgEstoqueSatelite.DefaultDrawDataCell(Rect, dbgEstoqueSatelite.Columns[DataCol].Field, State);
  end;
end;

procedure TViewCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TViewCliente.BtBtnProcessoClick(Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  popProcesso.Popup(BtBtnProcesso.ClientOrigin.X, BtBtnProcesso.ClientOrigin.Y + BtBtnProcesso.Height);
end;

procedure TViewCliente.btbtnAlterarClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger = CONSUMIDOR_FINAL_CODIGO ) then
  begin
    TServiceMessage.ShowWarning('Este registro n�o pode ser alterado!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not btbtnAlterar.Enabled ) then
    begin
      if DtSrcTabela.DataSet.FieldByName('CUSTO_OPER_PERCENTUAL').IsNull then
        DtSrcTabela.DataSet.FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger := 1;

      if DtSrcTabela.DataSet.FieldByName('EMITIR_NFE_DEVOLUCAO').IsNull then
        DtSrcTabela.DataSet.FieldByName('EMITIR_NFE_DEVOLUCAO').AsInteger := 0;

      if DtSrcTabela.DataSet.FieldByName('ENTREGA_FRACIONADA_VENDA').IsNull then
        DtSrcTabela.DataSet.FieldByName('ENTREGA_FRACIONADA_VENDA').AsInteger := 0;

      if ( DtSrcTabela.DataSet.FieldByName('DTCAD').IsNull ) then
        DtSrcTabela.DataSet.FieldByName('DTCAD').AsDateTime := Now;
    end;
  end;
end;

procedure TViewCliente.mpClienteDesbloquearClick(Sender: TObject);
var
  iCodigo : Integer;
  sMotivo : String;
begin
  if ( DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger = 1 ) then
    if TServiceInputQuery.InputQuery(Self, 'Desbloquear cliente:', 'Informe o motivo do desbloqueio:', sMotivo) then
      if Trim(sMotivo) <> EmptyStr then
        try
          WaitAMoment(WAIT_AMOMENT_Process);
          Controller.DesbloquearCliente(
            DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger,
            FController.DAO.Usuario.Login + ' -> ' + AnsiUpperCase(sMotivo)
          );
          FController.DAO.RefreshRecord;
        finally
          WaitAMomentFree;
        end;
end;

procedure TViewCliente.mpClienteBloquearClick(Sender: TObject);
var
  iCodigo : Integer;
  sMotivo : String;
begin
  if ( DtSrcTabela.DataSet.FieldByName('BLOQUEADO').AsInteger = 0 ) then
    if TServiceInputQuery.InputQuery(Self, 'Bloquear cliente:', 'Informe o motivo do bloqueio:', sMotivo) then
      if Trim(sMotivo) <> EmptyStr then
      try
        WaitAMoment(WAIT_AMOMENT_Process);
          Controller.BloquearCliente(
            DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger,
            FController.DAO.Usuario.Login + ' -> ' + AnsiUpperCase(sMotivo)
          );
          FController.DAO.RefreshRecord;
      finally
        WaitAMomentFree;
      end;
end;

procedure TViewCliente.Update(Observeble: IObservable);
begin
  TServiceMessage.ShowWarning('Atualizar observador!');
end;

procedure TViewCliente.Update(Observeble: IObservable; sMessage: string);
begin
  Self.Update(Observeble);
end;

procedure TViewCliente.dbCNPJButtonClick(Sender: TObject);
var
  aPessoa  : TPessoaJuridica;
  aTipoLog : Smallint;
  aEndereco : IControllerEndereco;
begin
  if (DtSrcTabela.DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
  begin
    dbRazao.SetFocus;
    aPessoa.CNPJ := TServicesUtils.StrOnlyNumbers(DtSrcTabela.DataSet.FieldByName('CNPJ').AsString);
    if SelecionarCNPJ(Self, aPessoa) then
    begin
      if TServiceMessage.ShowConfirm('Deseja carregar os dados consultados para o cadastro?') then
      begin
        with DtSrcTabela.DataSet do
        begin
          aEndereco := TControllerFactory.New.Endereco;

          FieldByName('CNPJ').AsString       := TServicesUtils.StrOnlyNumbers(aPessoa.CNPJ);
          FieldByName('NOME').AsString       := Copy(aPessoa.RazaoSocial, 1, FieldByName('NOME').Size);
          FieldByName('NOMEFANT').AsString   := Copy(aPessoa.Fantasia,    1, FieldByName('NOMEFANT').Size);
          FieldByName('EST_COD').AsInteger   := aEndereco.GetEstadoID(aPessoa.Endereco.UF);
          FieldByName('EST_NOME').AsString   := aEndereco.GetEstadoNome(aPessoa.Endereco.UF);
          FieldByName('UF').AsString         := aPessoa.Endereco.UF;
          FieldByName('CID_COD').AsInteger   := aEndereco.GetCidadeID(FieldByName('EST_COD').AsInteger, aPessoa.Endereco.Municipio);
          FieldByName('CID_NOME').AsString   := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);

          if ((FieldByName('CID_COD').AsInteger = 0) and (not aPessoa.Endereco.CEP.IsEmpty)) then
          begin
            FieldByName('CID_COD').AsInteger  := aEndereco.GetCidadeID(aPessoa.Endereco.CEP);
            FieldByName('CID_NOME').AsString  := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);
          end;

          FieldByName('CIDADE').AsString   := Copy(FieldByName('CID_NOME').AsString + ' (' + aPessoa.Endereco.UF + ')', 1, FieldByName('CIDADE').Size);

          FieldByName('BAI_COD').AsInteger := aEndereco.SetBairro(FieldByName('CID_COD').AsInteger, Copy(aPessoa.Endereco.Bairro, 1, FieldByName('BAIRRO').Size));
          FieldByName('BAIRRO').AsString   := aPessoa.Endereco.Bairro;

          FieldByName('LOG_COD').AsInteger   := aEndereco.SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(aPessoa.Endereco.Tipo + ' ' + aPessoa.Endereco.Logradouro), 1, FieldByName('LOGRADOURO').Size), aTipoLog);
          FieldByName('LOGRADOURO').AsString := Trim(aEndereco.GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + aEndereco.GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
          FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

          if (aTipoLog = 0) then
            FieldByName('TLG_TIPO').Clear
          else
            FieldByName('TLG_TIPO').AsInteger := aTipoLog;

          FieldByName('COMPLEMENTO').AsString := Copy(aPessoa.Endereco.Complemento, 1, FieldByName('COMPLEMENTO').Size);
          FieldByName('NUMERO_END').AsString  := Copy(aPessoa.Endereco.Numero,      1, FieldByName('NUMERO_END').Size);
          FieldByName('CEP').AsString         := Copy(TServicesUtils.StrOnlyNumbers(aPessoa.Endereco.CEP), 1, FieldByName('CEP').Size);
        end;
      end;
    end;
  end;
end;

procedure TViewCliente.BuscarCEP(aRetorno: TEndereco);
var
  aTipoLog  : Smallint;
  aEndereco : IControllerEndereco;
begin
  if ServiceCEP.Error.IsEmpty then
  begin
      with DtSrcTabela.DataSet do
      begin
        aEndereco := TControllerFactory.New.Endereco;

        FieldByName('EST_COD').AsInteger := aEndereco.GetEstadoID(aRetorno.UF);
        FieldByName('EST_NOME').AsString := aEndereco.GetEstadoNome(aRetorno.UF);
        FieldByName('UF').AsString       := aRetorno.UF;
        FieldByName('CID_COD').AsInteger := aEndereco.GetCidadeID(FieldByName('EST_COD').AsInteger, aRetorno.Municipio);
        FieldByName('CID_NOME').AsString := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);

        if ((FieldByName('CID_COD').AsInteger = 0) and (not aRetorno.CEP.IsEmpty)) then
        begin
          FieldByName('CID_COD').AsInteger := aEndereco.GetCidadeID(aRetorno.CEP);
          FieldByName('CIDADE').AsString   := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);
        end;

        FieldByName('CID_NOME').AsString := Copy(FieldByName('CID_NOME').AsString + ' (' + aRetorno.UF + ')', 1, FieldByName('CIDADE').Size);

        FieldByName('BAI_COD').AsInteger := aEndereco.SetBairro(FieldByName('CID_COD').AsInteger, Copy(aRetorno.Bairro, 1, FieldByName('BAIRRO').Size));
        FieldByName('BAIRRO').AsString   := aRetorno.Bairro;

        FieldByName('LOG_COD').AsInteger   := aEndereco.SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(aRetorno.Tipo + ' ' + aRetorno.Logradouro), 1, FieldByName('LOGRADOURO').Size), aTipoLog);
        FieldByName('LOGRADOURO').AsString := Trim(aEndereco.GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + aEndereco.GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
        FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

        if (aTipoLog = 0) then
          FieldByName('TLG_TIPO').Clear
        else
          FieldByName('TLG_TIPO').AsInteger := aTipoLog;

        FieldByName('COMPLEMENTO').AsString := Copy(aRetorno.Complemento, 1, FieldByName('COMPLEMENTO').Size);
        FieldByName('NUMERO_END').AsString  := Copy(aRetorno.Numero,      1, FieldByName('NUMERO_END').Size);
        FieldByName('CEP').AsString         := Copy(TServicesUtils.StrOnlyNumbers(aRetorno.CEP), 1, FieldByName('CEP').Size);
      end;
  end
  else
    TServiceMessage.ShowError(ServiceCEP.Error);
end;

procedure TViewCliente.CarregarBancos;
begin
  if (dtsBancoFebraban.Tag = 0) then
  begin
    TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco1, dtsBancoFebraban, 'banco',   'codigo', 'codigo_nome');
    TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco2, dtsBancoFebraban, 'banco_2', 'codigo', 'codigo_nome');
    TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco3, dtsBancoFebraban, 'banco_3', 'codigo', 'codigo_nome');

    dtsBancoFebraban.Tag := 1;
  end;
end;

procedure TViewCliente.CarregarInformeUsuario;
begin
  if (pgcGuias.ActivePage = tbsTabela) then
  begin
    HabilitarAbaEstoque;
    DtsEstoqueSatelite.DataSet.Close;

    if DtSrcTabela.DataSet.Active then
    begin
      lblMotivoBloqueio.Visible     := (DtSrcTabela.DataSet.FieldByName('bloqueado').AsInteger = 1);
      lblRegistroDesativado.Visible := (DtSrcTabela.DataSet.FieldByName('ativo').AsInteger = 0) and (not lblMotivoBloqueio.Visible);

      if lblMotivoBloqueio.Visible then
        lblMotivoBloqueio.Caption := DtSrcTabela.DataSet.FieldByName('Bloqueado_motivo').AsString;
    end;
  end;
end;

procedure TViewCliente.CmbBxFiltrarTipoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' ']) then
  begin
    edtFiltrar.Text := Trim(Key);
    if (pgcGuias.ActivePage = tbsTabela) then
      if (edtFiltrar.Visible and edtFiltrar.Enabled) then
      begin
        edtFiltrar.SetFocus;
        edtFiltrar.SelStart := Length(edtFiltrar.Text);
      end;
  end
  else
  if (Key = #13) then
  begin
    if (pgcGuias.ActivePage = tbsTabela) then
      if (edtFiltrar.Visible and edtFiltrar.Enabled) then
        edtFiltrar.SetFocus;
  end;
end;

function TViewCliente.Controller: IControllerCliente;
begin
  Result := (FController as IControllerCliente);
end;

procedure TViewCliente.HabilitarAbaEstoque;
begin
  with DtSrcTabela.DataSet do
  begin
    tbsEstoqueSatelite.TabVisible :=
        ((aEstoqueSateliteEmpresa and (FieldByName('ENTREGA_FRACIONADA_VENDA').AsInteger = 1))
      or ((gSistema.Codigo = SISTEMA_GESTAO_OPME) and (not FieldByName('VALORES').IsNull))
    ) and aEstoqueSateliteCliente;
  end;
end;

procedure TViewCliente.DataSetEstoqueUltimaVendaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Text := DtsEstoqueSatelite.DataSet.FieldByName('ano_venda_ult').AsString + FormatFloat('"/"###00000', Sender.AsInteger);
end;

function TViewCliente.Empresa: IControllerEmpresa;
begin
  if not Assigned(FControllerEmpresaView) then
    FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  Result := (FControllerEmpresaView as IControllerEmpresa);
end;

procedure TViewCliente.EstoqueSateliteFiltarDados(
  const iTipoPesquisa: Integer);
var
  aFilter : String;
begin
  try
    aFilter := Trim(edFiltrarEstoqueSatelite.Text);

    DtsEstoqueSatelite.DataSet.Close;
    FControllerClienteEstoque.DAO.ClearWhere;

    if (not aFilter.IsEmpty) then
    begin

      Case iTipoPesquisa of
        // Por C�digo, Descri��o
        0:
          if ( StrToIntDef(aFilter, 0) > 0 ) then
            FControllerClienteEstoque.DAO.Where('p.codigo = ' + aFilter)
          else
            FControllerClienteEstoque.DAO.Where(
              '(upper(p.Descri) like ' + QuotedStr('%' + UpperCase(aFilter) + '%') +
              ' or upper(p.Descri) like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(aFilter)) + '%') + ')');

        // Por Refer�ncia
        1:
          FControllerClienteEstoque.DAO.Where('p.Referencia = ' + aFilter.QuotedString);

        // Por Fabricante
        2:
          if ( StrToIntDef(aFilter, 0) > 0 ) then
            FControllerClienteEstoque.DAO.Where(' p.Codfabricante = ' + aFilter)
          else
            FControllerClienteEstoque.DAO.Where('(upper(f.Nome) like ' + QuotedStr('%' + UpperCase(aFilter) + '%') + ')');

        // Por Grupo
        3:
          if ( StrToIntDef(aFilter, 0) > 0 ) then
            FControllerClienteEstoque.DAO.Where('p.Codgrupo = ' + aFilter)
          else
            FControllerClienteEstoque.DAO.Where('(upper(g.Descri) like ' + QuotedStr('%' + UpperCase(aFilter) + '%') + ')');
      end;

    end;

    FControllerClienteEstoque.DAO.Where('(e.cod_cliente = ' + DtSrcTabela.DataSet.FieldByName('CODIGO').AsString + ')');

    if chkProdutoComEstoque.Checked then
      FControllerClienteEstoque.DAO.Where('(e.quantidade > 0)');

    FControllerClienteEstoque
      .DAO
        .OrderBy('p.Descri')
      .Open;

    FControllerClienteEstoque.DAO.DataSet.FieldByName('COD_VENDA_ULT').OnGetText := DataSetEstoqueUltimaVendaGetText;

    // Preparar DataSet para a configura��o dos campos
    TTabelaController.New
      .Tabela(DtsEstoqueSatelite.DataSet)
      .Display('VALIDADE',    'Validade', 'dd/mm/yyyy', TAlignment.taCenter)
      .Display('QUANTIDADE', 'Estoque', ',0.###', TAlignment.taRightJustify)
      .Display('VALOR_MEDIO', 'Valor M�dio (R$)', ',0.00', TAlignment.taRightJustify)
      .Configurar;

    if ( not DtsEstoqueSatelite.DataSet.IsEmpty ) then
      dbgEstoqueSatelite.SetFocus
    else
    begin
      TServiceMessage.ShowWarning('N�o existe registros de produtos no estoque sat�lite do cliente para este tipo de pesquisa');

      edFiltrarEstoqueSatelite.SetFocus;
      edFiltrarEstoqueSatelite.SelectAll;
    end;
  except
    On E : Exception do
      TServiceMessage.ShowWarning('Erro ao tentar filtrar registros de produtos no estoque sat�lite do cliente.' + #13 +
        E.Message + #13 + 'Script:' + #13#13 + FControllerClienteEstoque.DAO.SelectSQL);
  end;
end;

procedure TViewCliente.DataSetTituloSituacaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if ( Sender.AsInteger = 0 ) then
    Text := 'Cancelado';
end;

procedure TViewCliente.btnPesquisarEstoqueSateliteClick(Sender: TObject);
begin
  EstoqueSateliteFiltarDados(edFiltrarTipoEstoqueSatelite.ItemIndex);
end;

procedure TViewCliente.edFiltrarEstoqueSateliteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnPesquisarEstoqueSatelite.Click;
end;

procedure TViewCliente.dbgEstoqueSateliteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key in ['0'..'9', ' '] ) then
  begin
    edFiltrarEstoqueSatelite.Text := Trim(Key);
    edFiltrarEstoqueSatelite.SetFocus;
    edFiltrarEstoqueSatelite.SelStart := Length(edFiltrarEstoqueSatelite.Text);
  end;
end;

procedure TViewCliente.btnFiltrarClick(Sender: TObject);
begin
  if bApenasPossuiEstoque then
    WhereAdditional := '(cl.entrega_fracionada_venda = 1)';

  // N�o apresentar na pesquisa o cliente CONSUMIDOR FINAL
  if ( WhereAdditional <> EmptyStr ) then
    WhereAdditional := WhereAdditional + ' and (cl.Codigo > 1)'
  else
    WhereAdditional := '(cl.Codigo > 1)';

  // inherited;
  FiltarDados(CmbBxFiltrarTipo.ItemIndex);
  CentralizarCodigo;
end;

procedure TViewCliente.FiltarDados(const iTipoPesquisa: Integer);
var
  aExpressionOr : String;
begin
  try
    WaitAMoment(WAIT_AMOMENT_LoadData);
    edtFiltrar.Text := Trim(edtFiltrar.Text);

    try

      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        WaitAMomentFree;
        TServiceMessage.ShowWarning('O nome do campo chave e/ou de descri��o n�o foram informados');
        Abort;
      end;

      FController.DAO.DataSet.Close;
      FController.DAO.ClearWhere;

      if ( edtFiltrar.Text <> EmptyStr ) then
      begin

        Case iTipoPesquisa of
          // Por C�digo, Raz�o
          0:
            if (StrToIntDef(edtFiltrar.Text, 0) > 0) then
              FController.DAO.Where(CampoCodigo, StrToIntDef(edtFiltrar.Text, 0))
            else
            if (StrToInt64Def(edtFiltrar.Text, 0) > 0) then
              FController.DAO.Where(CampoCodigo, StrToInt64Def(edtFiltrar.Text, 0))
            else
            begin
              aExpressionOr :=
                '    (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
                '  or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')';

              FController.DAO.Where(aExpressionOr);
            end;

          // Por CPF/CNPJ
          1:
            FController.DAO.Where( 'cl.cnpj like ' + QuotedStr('%' + TServicesUtils.StrOnlyNumbers(edtFiltrar.Text) + '%') );

          // Por Cidade
          2:
            FController.DAO.Where( '((upper(cl.Cidade) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
                 ' or upper(cl.Cidade) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');

          // Por Telefones
          3:
            begin
              aExpressionOr :=
                '   ((cl.fone       like ' + QuotedStr('%' + TServicesUtils.StrOnlyNumbers(Trim(edtFiltrar.Text)) + '%') + ')' +
                ' or (cl.fonecel    like ' + QuotedStr('%' + TServicesUtils.StrOnlyNumbers(Trim(edtFiltrar.Text)) + '%') + ')' +
                ' or (cl.fonecomerc like ' + QuotedStr('%' + TServicesUtils.StrOnlyNumbers(Trim(edtFiltrar.Text)) + '%') + '))';

              FController.DAO.Where(aExpressionOr);
            end;
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
          if ( not DtSrcTabela.DataSet.IsEmpty ) then
            dbgDados.SetFocus
          else
          begin
            TServiceMessage.ShowWarning('N�o existe registros na tabela para este tipo de pesquisa');

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
        TServiceMessage.ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13 + E.Message + #13 +
          'Script:' + #13#13 + FController.DAO.SelectSQL);
      end;
    end;

  finally
    CarregarInformeUsuario;
    WaitAMomentFree;
  end;
end;

procedure TViewCliente.ProdutoSelecionado(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  if ( not DtsEstoqueSatelite.DataSet.Active ) then
    Exit;

  if ( DtsEstoqueSatelite.DataSet.IsEmpty ) then
    Exit;

  if (DtsEstoqueSatelite.DataSet.FieldByName('QUANTIDADE').AsInteger <= 0 ) then
  begin
    TServiceMessage.ShowWarning('Produto selecionado sem estoque dispon�vel para atender!');
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TViewCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iCodigo : Integer;
  sRazao  : String;
begin
  { DONE -oIsaque -cCliente : 16/05/2014 - Rotina para verificar a duplicidade de CPF/CNPJ (2) }

  if ( dbCNPJ.Focused and (Key = VK_RETURN) and (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) )  then
    if ( Length(dbCNPJ.Text) > 10 ) then
      if Controller.CpfCnpjCadastro(DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger, dbCNPJ.Text, iCodigo, sRazao) then
        TServiceMessage.ShowWarning(
          'CPF/CNJP j� cadastrado para o cliente ' + sRazao + ' ' + FormatFloat('"("###00000")."', iCodigo) );

  inherited;
end;

procedure TViewCliente.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  GetComprasAbertas( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
end;

procedure TViewCliente.btbtnExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger = CONSUMIDOR_FINAL_CODIGO ) then
  begin
    TServiceMessage.ShowWarning('Este registro n�o pode ser exclu�do!');
    Abort;
  end
  else
  begin
    inherited;
    GetComprasAbertas( DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger );
  end;
end;

procedure TViewCliente.btbtnIncluirClick(Sender: TObject);
var
  aEndereco : IControllerEndereco;
begin
  inherited;
  edtFiltrar.Text := Trim(edtFiltrar.Text);

  if (not OcorreuErro) then
    with DtSrcTabela.DataSet do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        if (edtFiltrar.Text <> EmptyStr) then
          if TServicesUtils.StrIsCPF(edtFiltrar.Text) then
          begin
            FieldByName('PESSOA_FISICA').AsInteger := 1;
            FieldByName('CNPJ').AsString           := edtFiltrar.Text;
          end
          else
          if TServicesUtils.StrIsCNPJ(Trim(edtFiltrar.Text)) then
          begin
            FieldByName('PESSOA_FISICA').AsInteger := 0;
            FieldByName('CNPJ').AsString           := edtFiltrar.Text;
          end
          else
            FieldByName('PESSOA_FISICA').AsInteger := 1
        else
          FieldByName('PESSOA_FISICA').AsInteger := 1
      else
        FieldByName('PESSOA_FISICA').AsInteger  := 1;

      aEndereco := TControllerFactory.New.Endereco;

      FieldByName('PAIS_NOME').AsString         := aEndereco.GetPaisNomeDefault;
      FieldByName('EST_NOME').AsString          := aEndereco.GetEstadoNomeDefault;
      FieldByName('UF').AsString                := aEndereco.GetEstadoUF(aEndereco.GetEstadoIDDefault);
      FieldByName('CID_NOME').AsString          := aEndereco.GetCidadeNomeDefault;
      FieldByName('CIDADE').AsString            := Copy(aEndereco.GetCidadeNomeDefault + ' (' + FieldByName('UF').AsString + ')', 1, FieldByName('CIDADE').Size);
      FieldByName('CEP').AsString               := aEndereco.GetCidadeCEP(aEndereco.GetCidadeIDDefault);
      FieldByName('ENTREGA_FRACIONADA_VENDA').AsInteger := IfThen(gSistema.Codigo = SISTEMA_GESTAO_OPME, '1', '0').ToInteger;

      GetComprasAbertas( FieldByName('CODIGO').AsInteger );
    end;
end;

procedure TViewCliente.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if BtBtnProcesso.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaBloqueioID, BtBtnProcesso.Hint, RotinaID);

    if aEstoqueSateliteEmpresa or (gSistema.Codigo = SISTEMA_GESTAO_OPME) then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaVisualizarEstoqueID, 'Visualizar Estoque Sat�lite (Estoque do Cliente)', RotinaID);
  end;
end;

function TViewCliente.ServiceCEP: TServiceRequestCEP;
begin
  if not Assigned(FServiceCEP) then
    FServiceCEP := TServiceRequestCEP.Create;
  Result := FServiceCEP;
end;

function TViewCliente.GetRotinaBloqueioID: String;
begin
  Result := GetRotinaInternaID(BtBtnProcesso);
end;

function TViewCliente.GetRotinaVisualizarEstoqueID: String;
begin
  Result := GetRotinaInternaID(tbsEstoqueSatelite);
end;

procedure TViewCliente.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;

  if (gSistema.Codigo = SISTEMA_PDV) then
    if (pgcGuias.ActivePage = tbsTabela) then
      if (CmbBxFiltrarTipo.Visible and CmbBxFiltrarTipo.Enabled) then
        CmbBxFiltrarTipo.Setfocus;
end;

initialization
  FormFunction.RegisterForm('ViewCliente', TViewCliente);

end.

