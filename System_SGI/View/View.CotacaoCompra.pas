unit View.CotacaoCompra;

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
  TViewCotacaoCompra = class(TViewPadraoCadastro)
    lblData: TLabel;
    RdgStatusCotacao: TRadioGroup;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
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
    nmImprimirCotacao: TMenuItem;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsDadoConsolidado: TTabSheet;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    dtsTipoCotacao: TDataSource;
    lblDataValidade: TLabel;
    GrpBxPagamento: TGroupBox;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblValorUn: TLabel;
    dbValorUn: TDBEdit;
    tbsEventoLOG: TTabSheet;
    pnlRetiradaEntrega: TPanel;
    lblEnderecoEntrega: TLabel;
    Bevel5: TBevel;
    dbEnderecoEntrega: TDBMemo;
    Bevel9: TBevel;
    dtsTransportador: TDataSource;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    PgcTextoCotacao: TPageControl;
    TbsCotacaoMotivo: TTabSheet;
    TbsCotacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    dbMotivo: TDBMemo;
    TbsCotacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    dbEventoLOG: TDBMemo;
    lblNumeroFornecedor: TLabel;
    dbNumeroFornecedor: TDBEdit;
    nmImprimirCotacaoMapa: TMenuItem;
    lblTotalReferencia: TLabel;
    dbTotalReferencia: TDBEdit;
    lblTotalLiquidoMax: TLabel;
    dbTotalLiquidoMax: TDBEdit;
    lblTotalLiquidoMin: TLabel;
    dbTotalLiquidoMin: TDBEdit;
    lblTotalLiquidoMedio: TLabel;
    dbTotalLiquidoMedio: TDBEdit;
    PnlDadosProdutoConsolidado: TPanel;
    Bevel10: TBevel;
    lblValorUnMax: TLabel;
    dbValorUnMax: TDBEdit;
    lblValorTotalMax: TLabel;
    dbValorTotalMax: TDBEdit;
    lblValorUnMin: TLabel;
    dbValorUnMin: TDBEdit;
    dbValorTotalMin: TDBEdit;
    lblValorTotalMin: TLabel;
    tbsFornecedor: TTabSheet;
    Bevel11: TBevel;
    PnlFornecedor: TPanel;
    BtnFornecedorInserir: TBitBtn;
    BtnFornecedorEditar: TBitBtn;
    BtnFornecedorExcluir: TBitBtn;
    Bevel13: TBevel;
    dtsFornecedor: TDataSource;
    dbgFornecedor: TDBGrid;
    BtnFornecedorOpcoes: TBitBtn;
    ppCotacaoFornecedor: TPopupMenu;
    nmGerarArquivoXLS: TMenuItem;
    nmProcessarArquivoXLS: TMenuItem;
    opdCotacaoFornecedor: TOpenDialog;
    N1: TMenuItem;
    nmProcessarRespostas: TMenuItem;
    btnFinalizarCotacao: TcxButton;
    btnAutorizarCotacao: TcxButton;
    btnCancelarCotacao: TcxButton;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbProduto: TJvDBComboEdit;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoEditando: TShape;
    shpOperacaoCancelada: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoCancelada: TLabel;
    lblOperacaoEditando: TLabel;
    procedure ControllerAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btnAutorizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirCotacaoClick(Sender: TObject);
    procedure btnCancelarCotacaoClick(Sender: TObject);
    procedure btnFinalizarCotacaoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnFornecedorInserirClick(Sender: TObject);
    procedure dtsFornecedorStateChange(Sender: TObject);
    procedure BtnFornecedorEditarClick(Sender: TObject);
    procedure BtnFornecedorOpcoesClick(Sender: TObject);
    procedure nmGerarArquivoXLSClick(Sender: TObject);
    procedure nmProcessarArquivoXLSClick(Sender: TObject);
    procedure dbgFornecedorDblClick(Sender: TObject);
    procedure nmProcessarRespostasClick(Sender: TObject);
    procedure nmImprimirCotacaoMapaClick(Sender: TObject);
    procedure BtnFornecedorExcluirClick(Sender: TObject);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FImpressao : IImpressaoAutorizacaoCompra;
    FControllerEmpresaView,
    FControllerTipoCotacaoView : IControllerCustom;
//    FControllerFormaPagto ,
//    FControllerCondicaoPagtoView,
//    FControllerTransportadora   : IControllerCustom;
    FControllerProduto    : IControllerProduto;
    FControllerFornecedor : IControllerFornecedor;

    iSeq : Integer;
    SQL_Itens       ,
    SQL_Fornecedores: TStringList;

    procedure AbrirTabelaItens;
    procedure AbrirTabelaFornecedores;
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure SetEventoLOG(sEvento : String);
    procedure CotacaoFornecedorItem;

    function Controller : IControllerCotacaoCompra;
    function Itens : IControllerCustom;
    function Fornecedores : IControllerCustom;
    function Empresa : IControllerEmpresa;
    function Fornecedor : IControllerFornecedor;

    function GetRotinaFinalizarID : String;
    function GetRotinaAutorizarID : String;
    function GetRotinaCancelarCotacaoID : String;
    function GetRotinaManterFornecedorID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAutorizarID : String read GetRotinaAutorizarID;
    property RotinaCancelarCotacaoID : String read GetRotinaCancelarCotacaoID;
    property RotinaManterFornecedorID : String read GetRotinaManterFornecedorID;
  end;

(*
  Tabelas:
  - TBCOTACAO_COMPRA
  - TBCOTACAO_COMPRAITEM
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBCOTACAO_COMPRAFORN
  - TBCOTACAO_COMPRAFORN_ITEM
  - TBFORNECEDOR
  - TBFORMPAGTO

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO
  - VW_TIPO_COTACAO

  Procedures:
  - SET_COTACAO_COMPRAFORN_ITEM
  - SET_COTACAO_COMPRAFORN_PROCESSA
*)

var
  ViewCotacaoCompra: TViewCotacaoCompra;

  procedure MostrarControleCotacao(const AOwner : TComponent);

  function SelecionarCotacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

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
  , View.CentroCusto
  , UGeCotacaoCompraCancelar
  , UGeCotacaoCompraFornecedor;
//
//  , Controller.Tabela
//  , UConstantesDGE
//  , UDMBusiness
//  , UDMRecursos
//  , UDMNFe
//  , View.Produto
//  , UGeCotacaoCompraCancelar
//  , UGeCotacaoCompraFornecedor
//  , View.Fornecedor
//  , UFuncoes;

{$R *.dfm}

procedure MostrarControleCotacao(const AOwner : TComponent);
var
  AForm : TViewCotacaoCompra;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewCotacaoCompra.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);


    AForm.WhereAdditional :=
      '(cast(c.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(c.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusCotacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (c.status = ' + IntToStr(AForm.RdgStatusCotacao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarCotacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  AForm : TViewCotacaoCompra;
  aDataInicio,
  aDataFinal ,
  aNome : String;
  I : Integer;
begin
  AForm := TViewCotacaoCompra.Create(AOwner);
  try
    AForm.btbtnIncluir.Visible        := False;
    AForm.btnFinalizarCotacao.Visible := False;
    AForm.btnAutorizarCotacao.Visible := False;
    AForm.btnCancelarCotacao.Visible  := False;

    AForm.RdgStatusCotacao.ItemIndex := STATUS_COTACAO_COT + 1;
    AForm.RdgStatusCotacao.Enabled   := False;

    //for I := 0 to AForm.RdgStatusCotacao.Items.Count - 1 do
    //  AForm.RdgStatusCotacao.Controls[I].Enabled := False;

    AForm.e1Data.Date := DataInicial;

    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    AForm.WhereAdditional :=
      //'(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
      '(cast(c.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(c.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusCotacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (c.status = ' + IntToStr(AForm.RdgStatusCotacao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    Result := AForm.SelecionarRegistro(Codigo, aNome, AForm.WhereAdditional);

    if Result then
    begin
      Ano     := AForm.DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      Codigo  := AForm.DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      Empresa := AForm.DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
    end;
  finally
    AForm.Destroy;
  end;

end;

procedure TViewCotacaoCompra.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.CotacaoCompra;
  FController.DAO.DataSet.AfterScroll := ControllerAfterScroll;

  FControllerEmpresaView       := TControllerFactory.New.EmpresaView;
  FControllerTipoCotacaoView   := TControllerFactory.New.TipoCotacaoView;
//  FControllerFormaPagto        := TControllerFactory.New.FormaPagto;
//  FControllerCondicaoPagtoView := TControllerFactory.New.CondicaoPagtoView;
//  FControllerTransportadora    := TControllerFactory.New.Transportadora;

  DtSrcTabelaItens.DataSet := Itens.DAO.DataSet;
  dtsFornecedor.DataSet    := Itens.DAO.DataSet;

  inherited;

  e1Data.Date      := IncDay(Date, -30);
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_COTACAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBCOTACAO_COMPRA';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'c.descricao_resumo';
  CampoOrdenacao := 'c.emissao_data, c.descricao_resumo';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(cast(c.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '(c.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  Tabela
    .Display('CODIGO', 'Código', '###00000', TAlignment.taCenter)
    .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:mm')
    .Display('VALOR_REF_TOTAL',      'Valor Referência', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_MAX_BRUTO',      'Valor Bruto',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MAX_DESCONTO',   'Valor Desconto',   ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MAX_TOTAL',      'Valor Total',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MIN_BRUTO',      'Valor Bruto',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MIN_DESCONTO',   'Valor Desconto',   ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MIN_TOTAL',      'Valor Total',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MEDIA_BRUTO',    'Valor Bruto',      ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MEDIA_DESCONTO', 'Valor Desconto',   ',0.00#', TAlignment.taRightJustify)
    .Display('VALOR_MEDIA_TOTAL',    'Valor Total',      ',0.00#', TAlignment.taRightJustify)
    .Configurar;

  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoCotacaoView)
    .LookupComboBox(dbTipo, dtsTipoCotacao, 'tipo', 'codigo', 'descricao');
//
//  TController(FControllerFormaPagto)
//    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FORMA_PAGTO', 'codigo', 'codigo_descricao');
//
//  TController(FControllerCondicaoPagtoView)
//    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'CONDICAO_PAGTO', 'cond_cod', 'cond_descricao');
//
//  TController(FControllerTransportadora)
//    .LookupComboBox(dbTransportador, dtsTransportador, 'transportador', 'codforn', 'nomeforn');
end;

procedure TViewCotacaoCompra.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    DtSrcTabela.DataSet.FieldByName('NUMERO').AsString :=
      FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger) + '/' +
        Copy(DtSrcTabela.DataSet.FieldByName('ANO').AsString, 3, 2);

    AbrirTabelaItens;
    AbrirTabelaFornecedores;
  end;
end;

procedure TViewCotacaoCompra.AbrirTabelaItens;
begin
  Controller.CarregarItens;
  HabilitarDesabilitar_Btns;
end;

procedure TViewCotacaoCompra.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if (pgcGuias.ActivePage = tbsCadastro) then
    begin
      btnFinalizarCotacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_COTACAO_EDC) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnAutorizarCotacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnCancelarCotacao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT);

      nmImprimirCotacao.Enabled     := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ABR) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);
      nmImprimirCotacaoMapa.Enabled := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);

      dtsFornecedor.AutoEdit := (not IsEmpty) and (State = dsBrowse) and (FieldByName('STATUS').AsInteger < STATUS_COTACAO_ENC);
      dtsFornecedorStateChange( dtsFornecedor );
    end
    else
    begin
      btnFinalizarCotacao.Enabled := False;
      btnAutorizarCotacao.Enabled := False;
      btnCancelarCotacao.Enabled  := False;

      nmImprimirCotacao.Enabled     := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ABR) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);
      nmImprimirCotacaoMapa.Enabled := (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) or (FieldByName('STATUS').AsInteger = STATUS_COTACAO_ENC);
    end;
  end;
end;

function TViewCotacaoCompra.Itens: IControllerCustom;
begin
  Result := Controller.Itens;
end;

procedure TViewCotacaoCompra.RecarregarRegistro;
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

procedure TViewCotacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('STATUS').AsInteger > STATUS_COTACAO_COT) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_COTACAO_ENC : sMsg := 'Esta cotação não pode ser alterada por já está autorizada/encerrada.';
        STATUS_COTACAO_CAN : sMsg := 'Esta cotação não pode ser alterada porque está cancelada.';
      end;

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) then
        if not TServiceMessage.ShowConfirm('A edição da cotação selecionada está em andamento.' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if (not OcorreuErro) then
      begin
        AbrirTabelaItens;
        AbrirTabelaFornecedores;
      end;
    end;
  end;
end;

procedure TViewCotacaoCompra.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    AbrirTabelaItens;
    AbrirTabelaFornecedores;
  end;
end;

procedure TViewCotacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger > STATUS_COTACAO_ABR) then
  begin
    Case DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger of
      STATUS_COTACAO_COT : sMsg := 'Esta cotação não pode ser excluída porque já está aguardando encerramento.';
      STATUS_COTACAO_ENC : sMsg := 'Esta cotação não pode ser excluída por já está autorizada/encerrada.';
      STATUS_COTACAO_CAN : sMsg := 'Esta cotação não pode ser excluída porque está cancelada.';
    end;

    TServiceMessage.ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if (not OcorreuErro) then
    begin
      AbrirTabelaItens;
      AbrirTabelaFornecedores;
    end;
  end;
end;

procedure TViewCotacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewCotacaoCompra.btnProdutoInserirClick(Sender: TObject);
var
  aSequencial : Integer;
begin
  if Trim(DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').AsString).IsEmpty then
  begin
    TServiceMessage.ShowWarning('Favor informar uma descrição resumo para a cotação!');
    dbDescricao.SetFocus;
  end
  else
  if (DtSrcTabelaItens.DataSet.Active) then
  begin
    aSequencial := Controller.DAO.NewSequence(DtSrcTabelaItens.DataSet, 'SEQ');

    DtSrcTabelaItens.DataSet.Append;
    DtSrcTabelaItens.DataSet.FieldByName('ANO').Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
    DtSrcTabelaItens.DataSet.FieldByName('CODIGO').Assign( DtSrcTabela.DataSet.FieldByName('CODIGO') );
    DtSrcTabelaItens.DataSet.FieldByName('EMPRESA').Assign( DtSrcTabela.DataSet.FieldByName('EMPRESA') );

    DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger := aSequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TViewCotacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TViewCotacaoCompra.btnProdutoExcluirClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
    if ( TServiceMessage.ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewCotacaoCompra.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Referencia : Currency);
  var
    Item : Integer;
  begin
    Item := DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger;

    Total_Referencia := 0.0;

    DtSrcTabelaItens.DataSet.First;
    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Referencia := Total_Referencia + DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL_REF').AsCurrency;
      DtSrcTabelaItens.DataSet.Next;
    end;

    DtSrcTabelaItens.DataSet.Locate('SEQ', Item, []);
  end;

var
  cTotalReferencia ,
  cTotalMaxBruto   ,
  cTotalMinBruto   ,
  cTotalMediaBruto : Currency;
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if Trim(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString).IsEmpty then
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
    begin
      DtSrcTabelaItens.DataSet.Post;

      GetToTais(cTotalReferencia);

      DtSrcTabela.DataSet.FieldByName('VALOR_REF_TOTAL').AsCurrency := cTotalReferencia;

      if (btnProdutoInserir.Visible and btnProdutoInserir.Enabled) then
        btnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TViewCotacaoCompra.btnAutorizarCotacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    RecarregarRegistro;

    AbrirTabelaItens;
    AbrirTabelaFornecedores;

    if not (FieldByName('STATUS').AsInteger = STATUS_COTACAO_COT) then
      TServiceMessage.ShowInformation('Apenas cotações que já possuem respostas de fornecedores poder ser autorizadas/encerradas!')
    else
    if (dtsFornecedor.DataSet.RecordCount < FieldByName('NUMERO_MINIMO_FORNECEDOR').Value) then
      TServiceMessage.ShowInformation(
        Format('Para que a cotação possa ser autorizada/encerrada, esta deve possuir respostas de, no mínimo, %s fornecedor(es).',
          [FieldByName('NUMERO_MINIMO_FORNECEDOR').AsString]))
    else
    if TServiceMessage.ShowConfirm('Confirma a autorização do cotação selecionada?') then
    begin
      Edit;

      FieldByName('STATUS').Value             := STATUS_COTACAO_ENC;
      FieldByName('AUTORIZADA_DATA').Value    := GetDateDB;
      FieldByName('AUTORIZADA_USUARIO').Value := gUsuarioLogado.Login;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Cotação Autorizada/Encerrada realizada com sucesso !' + #13#13 +
        'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
      RdgStatusCotacao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewCotacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  PgcTextoCotacao.ActivePage   := TbsCotacaoMotivo;

  with DtSrcTabela.DataSet do
  begin
    DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (FieldByName('STATUS').AsInteger < STATUS_COTACAO_ENC );
    DtSrcTabelaItensStateChange( DtSrcTabelaItens );

    dtsFornecedor.AutoEdit := (not IsEmpty) and (State = dsBrowse) and (FieldByName('STATUS').AsInteger < STATUS_COTACAO_ENC);
    dtsFornecedorStateChange( dtsFornecedor );
  end;
end;

function TViewCotacaoCompra.Empresa: IControllerEmpresa;
begin
  if not Supports(FControllerEmpresaView, IControllerEmpresa, Result) then
    Result := nil;
end;

procedure TViewCotacaoCompra.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  TbsCotacaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_CAN);
  HabilitarDesabilitar_Btns;
end;

procedure TViewCotacaoCompra.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if Trim(FieldByName('AUTORIZADA_USUARIO').AsString) = EmptyStr then
      FieldByName('AUTORIZADA_USUARIO').Clear;

    if Trim(FieldByName('ENCERRADA_USUARIO').AsString) = EmptyStr then
      FieldByName('ENCERRADA_USUARIO').Clear;

    if Trim(FieldByName('CANCELADO_USUARIO').AsString) = EmptyStr then
      FieldByName('CANCELADO_USUARIO').Clear;
  end;
end;

procedure TViewCotacaoCompra.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TViewCotacaoCompra.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').Value             := gUsuarioLogado.Empresa;
    FieldByName('TIPO').Value                := TIPO_COTACAO_COMPRA;
    FieldByName('INSERCAO_DATA').Value       := GetDateTimeDB;
    FieldByName('EMISSAO_DATA').Value        := GetDateDB;
    FieldByName('EMISSAO_USUARIO').Value     := GetUserApp;
    FieldByName('VALIDADE').Value            := FieldByName('EMISSAO_DATA').Value + GetPrazoValidadeCotacaoCompra(FieldByName('EMPRESA').AsString);
    FieldByName('STATUS').AsInteger          := STATUS_COTACAO_EDC;
    FieldByName('NOME_CONTATO_INT').AsString := GetUserFullName;

    FieldByName('NUMERO_MINIMO_FORNECEDOR').AsInteger := 3;

    FieldByName('VALOR_REF_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MAX_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MAX_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MAX_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MIN_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MIN_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MIN_TOTAL').AsCurrency    := 0.0;

    FieldByName('VALOR_MEDIA_BRUTO').AsCurrency    := 0.0;
    FieldByName('VALOR_MEDIA_DESCONTO').AsCurrency := 0.0;
    FieldByName('VALOR_MEDIA_TOTAL').AsCurrency    := 0.0;

    FieldByName('DESCRICAO_RESUMO').Clear;
    FieldByName('AUTORIZADA_DATA').Clear;
    FieldByName('AUTORIZADA_USUARIO').Clear;
    FieldByName('ENCERRADA_DATA').Clear;
    FieldByName('ENCERRADA_USUARIO').Clear;
    FieldByName('CANCELADO_DATA').Clear;
    FieldByName('CANCELADO_USUARIO').Clear;
    FieldByName('CANCELADO_MOTIVO').Clear;
  end;
end;

procedure TViewCotacaoCompra.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_COTACAO_EDC : Text := 'Em Edição';
    STATUS_COTACAO_ABR : Text := 'Aberta';
    STATUS_COTACAO_COT : Text := 'Em Cotação';
    STATUS_COTACAO_ENC : Text := 'Autorizada/Encerrada';
    STATUS_COTACAO_CAN : Text := 'Cancelada';
  end;
end;

procedure TViewCotacaoCompra.fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_COTACAO_COMPRA :
        Text := 'Compra';

      TIPO_COTACAO_SERVICO:
        Text := 'Serviço';

      TIPO_COTACAO_COMPRA_SERVICO:
        Text := 'Compra/Serviço';
    end;
end;

procedure TViewCotacaoCompra.DtSrcTabelaItensStateChange(
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

procedure TViewCotacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    AbrirTabelaFornecedores;
    pgcMaisDados.ActivePage := tbsDadoConsolidado;
    TbsCotacaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_CAN);
  end;

  HabilitarDesabilitar_Btns;
end;

procedure TViewCotacaoCompra.btnFiltrarClick(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(c.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  WhereAdditional := WhereAdditional +
      ' and (cast(c.emissao_data as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ')';

  if (RdgStatusCotacao.ItemIndex > 0) then
    WhereAdditional := WhereAdditional + ' and (c.status = ' + IntToStr(RdgStatusCotacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TViewCotacaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if (Codigo = 0) then
  begin
    TServiceMessage.ShowWarning('Favor informar o código do produto');
    Exit;
  end;

  if (not DtSrcTabelaItens.DataSet.Active) then
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
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString      := FieldByName('cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString   := FieldByName('descri_apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString    := FieldByName('Unp_descricao').AsString;

        if (FieldByName('Codunidade').AsInteger > 0) then
          DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de produto não cadastrado!');
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').Clear;
        if (dbProduto.Visible and dbProduto.Enabled) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewCotacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if DtSrcTabelaItens.DataSet.IsEmpty then
    TServiceMessage.ShowWarning('Favor informar o(s) produto(s) da autorização.')
  else
  if btnProdutoSalvar.Enabled then
  begin
    TServiceMessage.ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da cotação!');
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
        TServiceMessage.ShowWarning('Número de cotação já existe!');
        Abort;
      end;

      FieldByName('MOVITO').AsString     := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));

      inherited;

      if (not OcorreuErro) then
      begin
        // Salvar Itens
        if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
          DtSrcTabelaItens.DataSet.Post;

        Itens.DAO.ApplyUpdates;
        Itens.DAO.CommitUpdates;
        Itens.DAO.CommitTransaction;

        // Salvar Fornecedores
        if (dtsFornecedor.DataSet.State in [dsEdit, dsInsert]) then
          dtsFornecedor.DataSet.Post;

        Fornecedores.DAO.ApplyUpdates;
        Fornecedores.DAO.CommitUpdates;
        Fornecedores.DAO.CommitTransaction;

        RecarregarRegistro;

        AbrirTabelaItens;
        AbrirTabelaFornecedores;
        CotacaoFornecedorItem;
      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TViewCotacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;
  if (Sender = dbDataEmissao) then
    if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
      DtSrcTabela.DataSet.FieldByName('VALIDADE').Value := IncDay(DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').AsDateTime, PRAZO_VALIDADE_COTACAO_COMPRA);

  if (Sender = dbProduto) then
    if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
      CarregarDadosProduto(StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString, 0));

  if ((Sender = dbQuantidade) or (Sender = dbValorUn)) then
    if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
      DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL_REF').AsCurrency := DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO_REF').AsCurrency;

  if (Sender = dbValorTotal) then
    if (btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled) then
      btnProdutoSalvar.SetFocus;
end;

function TViewCotacaoCompra.Controller: IControllerCotacaoCompra;
begin
  if not Supports(FController, IControllerCotacaoCompra, Result) then
    Result := nil;
end;

procedure TViewCotacaoCompra.ControllerAfterScroll(DataSet: TDataSet);
begin
  HabilitarDesabilitar_Btns;
end;

procedure TViewCotacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TViewCotacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Sender = dbgDados) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar autorização em edição
      if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_EDC) then
        dbgDados.Canvas.Brush.Color := shpOperacaoEditando.Brush.Color
      else
      // Destacar autorização aberta
      if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_ABR) then
        dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
      else
      // Destacar autorização cancelada
      if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_COTACAO_CAN) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos já em cotação
  if (Sender = dbgProdutos) then
  begin
    if ((DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_AUTORIZACAO_FAT) and (DtSrcTabelaItens.DataSet.FieldByName('CONFIRMADO_RECEBIMENTO').AsInteger = 0)) then
      dbgProdutos.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end
  else
  // Destacar fornecedores
  if (Sender = dbgFornecedor) then
  begin
    if (dtsFornecedor.DataSet.FieldByName('ATIVO').AsInteger = 0) then
      dbgFornecedor.Canvas.Font.Color := shpOperacaoCancelada.Font.Color;

    dbgFornecedor.DefaultDrawDataCell(Rect, dbgFornecedor.Columns[DataCol].Field, State);
  end;
end;

procedure TViewCotacaoCompra.dbProdutoButtonClick(Sender: TObject);
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
  cValorCusto   ,
  cValorVenda   ,
  cValorPromocao,
  cValorIPI     ,
  cPercRedBC    : Currency;
begin
  if Trim(DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').AsString).IsEmpty then
  begin
    TServiceMessage.ShowWarning('Favor informar uma descrição resumo para a cotação!');
    dbDescricao.SetFocus;
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
      TIPO_COTACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_COTACAO_SERVICO:
        bSelecionado := SelecionarServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao);

      TIPO_COTACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if bSelecionado then
    begin
      DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString   := sCodigoAlfa;
      DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := sDescricao;
      DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString := sUnidade;
      DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO_REF').AsCurrency := cValorCusto;

      if (iUnidade > 0) then
        DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := iUnidade;
    end;
  end;
end;

procedure TViewCotacaoCompra.nmImprimirCotacaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa,
        GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString),
        dbTipo.Text,
        EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryCotacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      ParamByName('emp').AsString  := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryCotacaoCompraFornecedor do
    begin
      Close;
      ParamByName('ano').AsInteger   := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger   := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
      ParamByName('emp').AsString    := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      ParamByName('frn').AsInteger   := 0;
      ParamByName('todos').AsInteger := 0;
      Open;
    end;

    frrCotacaoCompra.ShowReport;
  end;
end;

procedure TViewCotacaoCompra.btnCancelarCotacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    RecarregarRegistro;
    AbrirTabelaItens;
    AbrirTabelaFornecedores;

    if (FieldByName('STATUS').AsInteger <> STATUS_COTACAO_COT) then
      TServiceMessage.ShowInformation('Apenas registros em cotação podem ser cancelados!')
    else
    if CancelarCOT(Self, FieldByName('ANO').Value, FieldByName('CODIGO').Value) then
    begin
      RecarregarRegistro;

      TServiceMessage.ShowInformation('Cotação cancelada com sucesso.' + #13#13 +
        'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TViewCotacaoCompra.btnFinalizarCotacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    RecarregarRegistro;

    AbrirTabelaItens;
    AbrirTabelaFornecedores;

    if TServiceMessage.ShowConfirm('Confirma a finalização da edição do cotação?') then
    begin
      Edit;

      FieldByName('STATUS').Value := STATUS_COTACAO_ABR;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      CommitTransaction;

      TServiceMessage.ShowInformation('Cotação finalizada com sucesso !' + #13#13 +
        'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;
      RdgStatusCotacao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewCotacaoCompra.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if ((Field = DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE')) or (Field = DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO_REF'))) then
      DtSrcTabelaItens.DataSet.FieldByName('VALOR_TOTAL_REF').AsCurrency := DtSrcTabelaItens.DataSet.FieldByName('QUANTIDADE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('VALOR_UNITARIO_REF').AsCurrency;
end;

procedure TViewCotacaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    with DtSrcTabela.DataSet do
      if (State in [dsEdit, dsInsert])  then
      begin
        if dbNumero.Focused then
          if (Trim(dbNumero.Text).Length > 0 ) then
            if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              TServiceMessage.ShowWarning('Número de cotação já existe!' + #13 + 'Controle: ' + sControle);

        { DONE -oIsaque -cAutorizacao : 22/05/2014 - Verificar Data de Emissão da Autorização }

        if dbDataEmissao.Focused then
          if (dbDataEmissao.Date > Date) then
            TServiceMessage.ShowWarning('A Data de Emissão da cotação está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');
      end;

  end;

  // Desistir na inserção de um novo produto/serviço
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) ) then
    DtSrcTabelaItens.DataSet.Cancel
  else
  // Desistir na inserção de um novo fornecedor
  if ( (Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (dtsFornecedor.DataSet.State in [dsEdit, dsInsert]) ) then
    dtsFornecedor.DataSet.Cancel
  else
    inherited;
end;

function TViewCotacaoCompra.GetRotinaAutorizarID: String;
begin
  Result := GetRotinaInternaID(btnAutorizarCotacao);
end;

function TViewCotacaoCompra.GetRotinaCancelarCotacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarCotacao);
end;

function TViewCotacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarCotacao);
end;

procedure TViewCotacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarCotacao.Caption, RotinaID);

    if btnAutorizarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAutorizarID, btnAutorizarCotacao.Caption, RotinaID);

    if btnCancelarCotacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarCotacaoID, btnCancelarCotacao.Caption, RotinaID);

    if PnlFornecedor.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaManterFornecedorID, PnlFornecedor.Hint, RotinaID);
  end;
end;

procedure TViewCotacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

function TViewCotacaoCompra.Fornecedor: IControllerFornecedor;
begin
  if not Assigned(FControllerFornecedor) then
    FControllerFornecedor := TControllerFactory.New.Fornecedor;

  Result := FControllerFornecedor;
end;

function TViewCotacaoCompra.Fornecedores: IControllerCustom;
begin
  Result := Controller.Fornecedores;
end;

procedure TViewCotacaoCompra.AbrirTabelaFornecedores;
begin
  Controller.CarregarFornecedores;
end;

procedure TViewCotacaoCompra.BtnFornecedorInserirClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if GetPermissaoRotinaInterna(PnlFornecedor, True) then
  begin
    iCodigo := 0;
    if SelecionarFornecedor(Self, iCodigo, sNome) then
    begin
      if dtsFornecedor.DataSet.Locate('FORNECEDOR', iCodigo, []) then
      begin
        TServiceMessage.ShowWarning('Fornecedor selecionado já inserido na Cotação!');
        Abort;
      end;

      if CotacaoFornecedor(Self
        , cfoInserir
        , DtSrcTabela.DataSet.FieldByName('EMPRESA').Value
        , DtSrcTabela.DataSet.FieldByName('ANO').Value
        , DtSrcTabela.DataSet.FieldByName('CODIGO').Value
        , iCodigo
        , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
        , EmptyStr
        , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
        , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
      begin

        AbrirTabelaFornecedores;

      end;
    end;
  end;
end;

function TViewCotacaoCompra.GetRotinaManterFornecedorID: String;
begin
  Result := GetRotinaInternaID(PnlFornecedor);
end;

procedure TViewCotacaoCompra.dtsFornecedorStateChange(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    btnFornecedorInserir.Enabled := (dtsFornecedor.AutoEdit and (dtsFornecedor.DataSet.State = dsBrowse));
    btnFornecedorEditar.Enabled  := (dtsFornecedor.AutoEdit and (dtsFornecedor.DataSet.State = dsBrowse) and (not dtsFornecedor.DataSet.IsEmpty));
    btnFornecedorExcluir.Enabled := (dtsFornecedor.AutoEdit and (dtsFornecedor.DataSet.State = dsBrowse) and (not dtsFornecedor.DataSet.IsEmpty));

    BtnFornecedorOpcoes.Enabled   := (dtsFornecedor.AutoEdit and (dtsFornecedor.DataSet.State = dsBrowse) and (not dtsFornecedor.DataSet.IsEmpty));
    nmGerarArquivoXLS.Enabled     := (dtsFornecedor.AutoEdit and (dtsFornecedor.DataSet.State = dsBrowse) and (not dtsFornecedor.DataSet.IsEmpty)) and ( FieldByName('STATUS').AsInteger in [STATUS_COTACAO_ABR, STATUS_COTACAO_COT] );
    nmProcessarArquivoXLS.Enabled := (dtsFornecedor.AutoEdit and (dtsFornecedor.DataSet.State = dsBrowse) and (not dtsFornecedor.DataSet.IsEmpty)) and ( FieldByName('STATUS').AsInteger in [STATUS_COTACAO_ABR, STATUS_COTACAO_COT] );
  end;
end;

procedure TViewCotacaoCompra.BtnFornecedorEditarClick(Sender: TObject);
begin
  if GetPermissaoRotinaInterna(PnlFornecedor, True) then
  begin
    if CotacaoFornecedor(Self
      , cfoEditar
      , qryFornecedorEMPRESA.Value
      , qryFornecedorANO.Value
      , qryFornecedorCODIGO.Value
      , qryFornecedorFORNECEDOR.Value
      , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
      , EmptyStr
      , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
      , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
    begin

      AbrirTabelaFornecedores;

    end;
  end;
end;

procedure TViewCotacaoCompra.BtnFornecedorOpcoesClick(
  Sender: TObject);
begin
  if ( dtsFornecedor.DataSet.IsEmpty ) then
    Exit;

  ppCotacaoFornecedor.Popup(BtnFornecedorOpcoes.ClientOrigin.X, BtnFornecedorOpcoes.ClientOrigin.Y + BtnFornecedorOpcoes.Height);
end;

procedure TViewCotacaoCompra.SetEventoLOG(sEvento: String);
var
  sMensagem : String;
begin
  sMensagem := FormatDateTime('dd/mm/yyyy hh:mm', Now) + ' - ' + sEvento + ' (por ' + gUsuarioLogado.Login + ').';
  if (not DtSrcTabela.DataSet.IsEmpty) then
  begin
    DtSrcTabela.DataSet.Edit;

    dbEventoLOG.Lines.Add(sMensagem);

    DtSrcTabela.DataSet.Post;
    FController.DAO.ApplyUpdates;
    FController.DAO.CommitUpdates;
    FController.DAO.CommitTransaction;
  end;
end;

procedure TViewCotacaoCompra.nmGerarArquivoXLSClick(Sender: TObject);
var
  sID       ,
  sMensagem ,
  sFileName : String;
begin
  if ( dtsFornecedor.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa, GetEmailEmpresa(qryFornecedorEMPRESA.AsString), dbTipo.Text, EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := qryFornecedorEMPRESA.AsString;
      Open;
    end;

    with qryCotacaoCompra do
    begin
      Close;
      ParamByName('ano').AsInteger := qryFornecedorANO.AsInteger;
      ParamByName('cod').AsInteger := qryFornecedorCODIGO.AsInteger;
      ParamByName('emp').AsString  := qryFornecedorEMPRESA.AsString;
      Open;
    end;

    with qryCotacaoCompraFornecedor do
    begin
      Close;
      ParamByName('ano').AsInteger   := qryFornecedorANO.AsInteger;
      ParamByName('cod').AsInteger   := qryFornecedorCODIGO.AsInteger;
      ParamByName('emp').AsString    := qryFornecedorEMPRESA.AsString;
      ParamByName('frn').AsInteger   := qryFornecedorFORNECEDOR.AsInteger;
      ParamByName('todos').AsInteger := 0;
      Open;
    end;

    sID       := FormatFloat('00000', qryFornecedorFORNECEDOR.AsInteger);
    sFileName := Path_MeusDocumentos + '\' +
      'COTACAO_' + sID + '.' + qryFornecedorEMPRESA.AsString + '_' +
        StringReplace(DtSrcTabela.DataSet.FieldByName('NUMERO').AsString, '/', '-', [rfReplaceAll]) + '.xls';

    ExportarFR3_ToXSL(frrCotacaoCompra, sFileName);

    ElaborarFormulaTravarCelulasXLS(Self,
      qryFornecedorEMPRESA.AsString, qryFornecedorANO.AsInteger, qryFornecedorCODIGO.AsInteger, qryFornecedorFORNECEDOR.AsInteger,
      qryFornecedorCNPJ.AsString, sFileName);

    if FileExists(sFileName) then
    begin

      SetEventoLOG('Planilha de cotação gerada para o Fornecedor ' + qryFornecedorNOMEFORN.AsString);

      sMensagem := 'Arquivo gerado com sucesso:' + #13 + sFileName + #13#13 +
        'Deseja que este arquivo seja enviado por e-mail para o fornecedor?';

      if ShowConfirm(sMensagem) then
      begin
        if DMNFe.EnviarEmail_Generico(qryFornecedorEMPRESA.AsString
          , DtSrcTabela.DataSet.FieldByName('NUMERO').Value
          , qryFornecedorEMAIL_ENVIO.AsString
          , sFileName) then
        begin
          SetEventoLOG('Planilha de cotação enviada por e-mail para o Fornecedor ' + qryFornecedorNOMEFORN.AsString);
          ShowInformation(Format('E-mail enviado com sucesso para ''%s''', [qryFornecedorEMAIL_ENVIO.AsString]));
        end;
      end;

    end;
  end;
end;

procedure TViewCotacaoCompra.nmProcessarArquivoXLSClick(Sender: TObject);
var
  sID       ,
  sMensagem ,
  sFileName : String;
begin
  if ( dtsFornecedor.DataSet.IsEmpty ) then
    Exit;

  sID       := FormatFloat('00000', qryFornecedorFORNECEDOR.AsInteger);
  sFileName := Path_MeusDocumentos + '\' +
    'COTACAO_' + sID + '.' + qryFornecedorEMPRESA.AsString + '_' +
      StringReplace(DtSrcTabela.DataSet.FieldByName('NUMERO').AsString, '/', '-', [rfReplaceAll]) + '.xls';

  opdCotacaoFornecedor.FileName := sFileName;

  if opdCotacaoFornecedor.Execute then
    sFileName := opdCotacaoFornecedor.FileName
  else
    Exit;

  if CotacaoFornecedor(Self, cfoCarregarPlanilha
    , qryFornecedorEMPRESA.Value
    , qryFornecedorANO.Value
    , qryFornecedorCODIGO.Value
    , qryFornecedorFORNECEDOR.Value
    , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
    , sFileName
    , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
    , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
  begin
    SetEventoLOG(Format('Arquivo ''%s'' de resposta do fornecedor %s processado', [sFileName, qryFornecedorNOMEFORN.AsString]));

    RecarregarRegistro;
    AbrirTabelaFornecedores;
  end;
end;

procedure TViewCotacaoCompra.dbgFornecedorDblClick(Sender: TObject);
begin
  if ( dtsFornecedor.DataSet.IsEmpty ) then
    Exit;

  if CotacaoFornecedor(Self
    , cfoVisualizar
    , qryFornecedorEMPRESA.Value
    , qryFornecedorANO.Value
    , qryFornecedorCODIGO.Value
    , qryFornecedorFORNECEDOR.Value
    , DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMO').Value
    , EmptyStr
    , DtSrcTabela.DataSet.FieldByName('EMISSAO_DATA').Value
    , DtSrcTabela.DataSet.FieldByName('VALIDADE').Value) then
      ;
end;

procedure TViewCotacaoCompra.nmProcessarRespostasClick(Sender: TObject);
begin
  if dtsFornecedor.DataSet.IsEmpty then
    Exit;

  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('STATUS').AsInteger <> STATUS_COTACAO_COT) then
      TServiceMessage.ShowInformation('Apenas Cotações com situação "Em Cotação" podem ser processadas')
    else
    if (dtsFornecedor.DataSet.RecordCount < FieldByName('NUMERO_MINIMO_FORNECEDOR').Value) then
      TServiceMessage.ShowInformation(
        Format('Para que a cotação possa ser processada, esta deve possuir respostas de, no mínimo, %s fornecedor(es).',
          [FieldByName('NUMERO_MINIMO_FORNECEDOR').AsString]))
    else
    if TServiceMessage.ShowConfirm('Deseja executar processamento da(s) resposta(s) do(s) fornecedor(es)?') then
    begin
      Controller.ProcessarRespostas(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('EMPRESA').AsString);

      AbrirTabelaItens;
      AbrirTabelaFornecedores;
      RecarregarRegistro;

      pgcMaisDados.ActivePage := tbsFornecedor;
    end;
  end;
end;

procedure TViewCotacaoCompra.CotacaoFornecedorItem;
begin
  dtsFornecedor.DataSet.DisableControls;
  try
    dtsFornecedor.DataSet.First;
    with not dtsFornecedor.DataSet.Eof do
    begin
      Controller.CotacaoFornecedorItem(
        dtsFornecedor.DataSet.FieldByName('ANO').AsInteger,
        dtsFornecedor.DataSet.FieldByName('CODIGO').AsInteger,
        dtsFornecedor.DataSet.FieldByName('EMPRESA').AsString,
        dtsFornecedor.DataSet.FieldByName('FORNECEDOR').AsInteger
      );
      dtsFornecedor.DataSet.Next;
    end;
  finally
    dtsFornecedor.DataSet.First;
    dtsFornecedor.DataSet.EnableControls;

    AbrirTabelaFornecedores;
  end;
end;

procedure TViewCotacaoCompra.nmImprimirCotacaoMapaClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.FieldByName('VALOR_MAX_TOTAL').AsCurrency = 0.0) then
    TServiceMessage.ShowWarning('Não é possível montar ainda o mapa de preços por não haver respostas de fornecedores!')
  else
    with DMNFe do
    begin

      try
        ConfigurarEmail(gUsuarioLogado.Empresa,
          GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString),
          dbTipo.Text,
          EmptyStr);
      except
      end;

      with qryEmitente do
      begin
        Close;
        ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        Open;
      end;

      with qryCotacaoCompra do
      begin
        Close;
        ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        ParamByName('emp').AsString  := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        Open;
      end;

      with qryCotacaoCompraFornecedor do
      begin
        Close;
        ParamByName('ano').AsInteger   := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        ParamByName('cod').AsInteger   := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        ParamByName('emp').AsString    := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        ParamByName('frn').AsInteger   := 0;
        ParamByName('todos').AsInteger := 1;
        Open;
      end;

      with qryCotacaoCompraFornecedorItem do
      begin
        Close;
        ParamByName('ano').AsInteger   := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
        ParamByName('cod').AsInteger   := DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger;
        ParamByName('emp').AsString    := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
        ParamByName('frn').AsInteger   := 0;
        ParamByName('todos').AsInteger := 1;
        Open;
      end;

      frrCotacaoCompraMapaPreco.ShowReport;
    end;
end;

procedure TViewCotacaoCompra.BtnFornecedorExcluirClick(Sender: TObject);
begin
  if GetPermissaoRotinaInterna(PnlFornecedor, True) then
  begin
    if not dtsFornecedor.DataSet.IsEmpty then
      if TServiceMessage.ShowConfirm('Deseja excluir o fornecedor selecionado?') then
      begin
        dtsFornecedor.DataSet.Delete;

        RecarregarRegistro;
        pgcMaisDados.ActivePage := tbsFornecedor;
      end;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewCotacaoCompra', TViewCotacaoCompra);

end.
