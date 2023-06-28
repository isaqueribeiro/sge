unit View.RequisicaoAlmox;

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

  UObserverInterface,
  UConstantesDGE,
  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Impressao.AutorizacaoCompra,
  SGE.Controller.Impressao.RequisicaoAlmox;

type
  TViewRequisicaoAlmox = class(TViewPadraoCadastro)
    lblData: TLabel;
    RdgStatusRequisicao: TRadioGroup;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    lblUsuarioCadastro: TLabel;
    dbUsuarioCadastro: TDBEdit;
    Bevel12: TBevel;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQtde: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProdutoNome: TDBEdit;
    dbQtde: TDBEdit;
    dbUnidade: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirRequisicaoAlmox: TMenuItem;
    lblCustoTotal: TLabel;
    dbCustoTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsObservacoes: TTabSheet;
    lblCustoUn: TLabel;
    dbCustoUn: TDBEdit;
    PnlObservacoes: TPanel;
    PgcTextoRequisicao: TPageControl;
    TbsRequisicaoMotivo: TTabSheet;
    dbMotivo: TDBMemo;
    TbsRequisicaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblCentroCustoRequisitante: TLabel;
    dbObservacao: TDBMemo;
    lblUsuarioRequisitante: TLabel;
    PnlValores: TPanel;
    lblCompetencia: TLabel;
    dbCompetencia: TDBEdit;
    lblValorTotalCusto: TLabel;
    dbValorTotalCusto: TDBEdit;
    dtsTipoRequisicao: TDataSource;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    LblAjuda: TLabel;
    btnFinalizarLancamento: TcxButton;
    btnEnviarRequisicao: TcxButton;
    btnCancelarRequisicao: TcxButton;
    lblCentroCustoAtendente: TLabel;
    lblUsuarioAtendente: TLabel;
    dbUsuarioAtendente: TDBEdit;
    lblUsuarioCancelamento: TLabel;
    dbUsuarioCancelamento: TDBEdit;
    lblQtdeDisponivel: TLabel;
    dbQtdeDisponivel: TDBEdit;
    lblQtdeAtendida: TLabel;
    dbQtdeAtendida: TDBEdit;
    lblSituacaoProduto: TLabel;
    dbSituacaoProduto: TDBEdit;
    nmImprimirManifesto: TMenuItem;
    btnProdutoAtender: TBitBtn;
    btnProdutoAguarda: TBitBtn;
    btnProdutoCancelar: TBitBtn;
    btnProdutoAtenderTodos: TBitBtn;
    btnConfirmarAtendimento: TcxButton;
    dbCentroCustoRequisitante: TJvDBComboEdit;
    dbCentroCustoAtendente: TJvDBComboEdit;
    dbUsuarioRequisitante: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataEmissao: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoEditando: TShape;
    shpOperacaoCancelada: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoCancelada: TLabel;
    lblOperacaoEditando: TLabel;
    procedure dbCentroCustoSelecionar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btnEnviarRequisicaoClick(Sender: TObject);
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
    procedure nmImprimirRequisicaoAlmoxClick(Sender: TObject);
    procedure btnCancelarRequisicaoClick(Sender: TObject);
    procedure btnFinalizarLancamentoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbUsuarioRequisitanteButtonClick(Sender: TObject);
    procedure btnProdutoAtenderClick(Sender: TObject);
    procedure btnProdutoAtenderTodosClick(Sender: TObject);
    procedure btnProdutoAguardaClick(Sender: TObject);
    procedure btnProdutoCancelarClick(Sender: TObject);
    procedure btnConfirmarAtendimentoClick(Sender: TObject);
    procedure nmImprimirManifestoClick(Sender: TObject);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure ControllerAfterScroll(DataSet: TDataSet);
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FImpressao : IImpressaoRequisicaoAlmox;
    FControllerEmpresaView,
    FControllerTipoRequisicaoAlmoxView : IControllerCustom;
    FControllerProdutoAlmox : IControllerProdutoAlmoxarifado;

    sGeneratorName : String;
    iSeq : Integer;
    iCentroCustoOrigem  ,
    iCentroCustoDestino : Integer;

    procedure AbrirTabelaItens;
    procedure CarregarDadosProduto(aCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure MontarFiltrosAdcionais;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Custo : Currency);

    function Controller : IControllerRequisicaoAlmoxarifado;
    function Produtos : IControllerCustom;
    function Empresa : IControllerEmpresa;

    function GetRotinaFinalizarID : String;
    function GetRotinaEnviarID  : String;
    function GetRotinaCancelarRequisicaoID : String;
    function GetMenorDataEmissao : TDateTime;

    procedure RegistrarNovaRotinaSistema;
    procedure GerarManifestoAutomatico;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaEnviarID  : String read GetRotinaEnviarID;
    property RotinaCancelarRequisicaoID : String read GetRotinaCancelarRequisicaoID;

    procedure pgcGuiasOnChange; override;
  end;

(*
  Tabelas:
  - TBEMPRESA
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBCENTRO_CUSTO
  - TBUSERS
  - TBREQUISICAO_ALMOX
  - TBREQUISICAO_ALMOX_ITEM

  Views:
  - VW_EMPRESA
  - VW_TIPO_REQUISICAO_ALMOX

  Procedures:
  - GET_ESTOQUE_ALMOX_DISPONIVEL
  - SET_REQUISICAO_ALMOX_CUSTO
*)

var
  ViewRequisicaoAlmox: TViewRequisicaoAlmox;

  procedure MostrarControleRequisicaoAlmox(const AOwner : TComponent);
  procedure CarregarRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer);

  function AtenderRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer) : Boolean;

implementation

uses
    System.DateUtils
  , System.SysConst
  , RTLConsts
  , UDMRecursos
  , UDMBusiness
  , UDMNFe
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , Service.Message
  , View.Fornecedor
  , View.Produto
  , View.Usuario
  , View.RequisicaoAlmox.Cancelar
  , View.Cliente
  , View.CentroCusto
  , View.Query.ApropriacaoEstoque;

{$R *.dfm}

procedure MostrarControleRequisicaoAlmox(const AOwner : TComponent);
var
  AForm : TViewRequisicaoAlmox;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewRequisicaoAlmox.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);


    AForm.WhereAdditional :=
      '(cast(r.data_emissao as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(r.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusRequisicao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (r.status = ' + IntToStr(AForm.RdgStatusRequisicao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

procedure CarregarRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer);
var
  AForm : TViewRequisicaoAlmox;
begin
  AForm := TViewRequisicaoAlmox.Create(AOwner);
  try
    with AForm do
    begin
      FController.DAO.ClearWhere;
      FController.DAO.Where('r.ano', Ano);
      FController.DAO.Where('r.controle', Controle);
      FController.DAO.Open;

      if not DtSrcTabela.DataSet.IsEmpty then
      begin
        AbrirTabelaItens;

        btbtnIncluir.Visible  := False;
        btbtnAlterar.Visible  := False;
        btbtnExcluir.Visible  := False;
        btbtnSalvar.Visible   := False;
        btbtnCancelar.Visible := False;
        btbtnLista.Visible    := False;

        btnFinalizarLancamento.Visible := False;
        btnEnviarRequisicao.Visible    := False;
        btnCancelarRequisicao.Visible  := False;

        pgcGuias.ActivePage  := tbsCadastro;
        tbsTabela.TabVisible := False;

        ShowModal;
      end;
    end;
  finally
    AForm.Free;
  end;
end;

function AtenderRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer) : Boolean;
var
  AForm : TViewRequisicaoAlmox;
begin
  AForm := TViewRequisicaoAlmox.Create(AOwner);
  try
    with AForm do
    begin
      FController.DAO.ClearWhere;
      FController.DAO.Where('r.ano' + Ano.ToString);
      FController.DAO.Where('r.controle' + Controle.ToString);
      FController.DAO.Open;

      if not DtSrcTabela.DataSet.IsEmpty then
      begin
        AbrirTabelaItens;

        btbtnIncluir.Visible  := False;
        btbtnAlterar.Visible  := False;
        btbtnExcluir.Visible  := False;
        btbtnSalvar.Visible   := False;
        btbtnCancelar.Visible := False;
        btbtnLista.Visible    := False;

        btnFinalizarLancamento.Visible  := False;
        btnEnviarRequisicao.Visible     := False;
        btnCancelarRequisicao.Visible   := False;
        btnConfirmarAtendimento.Visible := True;

        pgcGuias.ActivePage  := tbsCadastro;
        tbsTabela.TabVisible := False;

        pnlBotoesProduto.Visible := False;

        btnProdutoAtender.Left      := pnlBotoesProduto.Left;
        btnProdutoAtenderTodos.Left := pnlBotoesProduto.Left;
        btnProdutoAguarda.Left      := pnlBotoesProduto.Left;
        btnProdutoCancelar.Left     := pnlBotoesProduto.Left;

        btnProdutoAtender.Visible      := True;
        btnProdutoAtenderTodos.Visible := True;
        btnProdutoAguarda.Visible      := True;
        btnProdutoCancelar.Visible     := True;

        Result := (ShowModal = mrOk);
      end;
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewRequisicaoAlmox.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.RequisicaoAlmoxarifado;
  FController.DAO.DataSet.AfterScroll := ControllerAfterScroll;

  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerTipoRequisicaoAlmoxView := TControllerFactory.New.TipoRequisicaoAlmoxView;

  DtSrcTabelaItens.DataSet := Produtos.DAO.DataSet;

  inherited;

  e1Data.Date := IncDay(Date, -30);
  e2Data.Date := Date;

  ControlFirstEdit    := dbEmpresa;
  iCentroCustoOrigem  := 0;
  iCentroCustoDestino := 0;

  RotinaID            := ROTINA_MOV_REQUISICAO_ALMOX_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBREQUISICAO_ALMOX';
  CampoCodigo    := 'r.controle';
  CampoDescricao := 'co.descricao'; // Descrição do centro de custo de origem (requisitante)
  CampoOrdenacao := 'r.ano, r.controle, co.descricao';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(cast(r.data_emissao as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '(r.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  Tabela
    .Display('CONTROLE',  'No. Controle', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:nn', TAlignment.taLeftJustify, True)
    .Display('EMPRESA', 'Empresa', TAlignment.taLeftJustify, True)
    .Display('TIPO', 'Tipo', TAlignment.taLeftJustify, True)
    .Display('STATUS', 'Situação', TAlignment.taLeftJustify, False)
    .Display('DATA_EMISSAO', 'Data Emissão', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
    .Display('CCUSTO_ORIGEM',  'Requisitante', TAlignment.taLeftJustify, True)
    .Display('CCUSTO_DESTINO', 'Atendente', TAlignment.taLeftJustify, True)
    .Display('VALOR_TOTAL', 'Custo Total (R$)', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoRequisicaoAlmoxView)
    .LookupComboBox(dbTipo, dtsTipoRequisicao, 'tipo', 'codigo', 'descricao');
end;

procedure TViewRequisicaoAlmox.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
  begin
    DtSrcTabela.DataSet.FieldByName('NUMERO').AsString :=
      FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger) + '/' +
        Copy(DtSrcTabela.DataSet.FieldByName('ANO').AsString, 3, 2);

    AbrirTabelaItens;
  end;
end;

procedure TViewRequisicaoAlmox.AbrirTabelaItens;
begin
  Controller.CarregarProdutos;

  TTabelaController
    .New
    .Tabela(DtSrcTabelaItens.DataSet)
    .Display('ITEM', '#', '#00', TAlignment.taCenter, True)
    .Display('PRODUTO', 'Produto/Serviço', TAlignment.taLeftJustify, True)
    .Display('STATUS', 'Situação', TAlignment.taLeftJustify, False)
    .Display('QTDE', 'Quantidade', ',0.###', TAlignment.taRightJustify, True)
    .Display('QTDE_ATENDIDA', 'Quantidade', ',0.###', TAlignment.taRightJustify, False)
    .Display('ESTOQUE', 'Estoque ', ',0.###', TAlignment.taRightJustify, False)
    .Display('RESERVA', 'Reservado  ', ',0.###', TAlignment.taRightJustify, False)
    .Display('DISPONIVEL', 'Disponível  ', ',0.###', TAlignment.taRightJustify, False)
    .Display('CUSTO', 'Custo Un. (R$) ', ',0.00', TAlignment.taRightJustify, False)
    .Display('TOTAL', 'Custo Total (R$) ', ',0.00', TAlignment.taRightJustify, False)
    .Configurar;

  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoAlmox.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
    if (pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnFinalizarLancamento.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_EDC, STATUS_REQUISICAO_ALMOX_ABR]) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnEnviarRequisicao.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_ABR) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnCancelarRequisicao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]);

      nmImprimirRequisicaoAlmox.Enabled := (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]);
      nmImprimirManifesto.Enabled       := (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ATD]);
    end
    else
    begin
      btnFinalizarLancamento.Enabled := False;
      btnEnviarRequisicao.Enabled    := False;
      btnCancelarRequisicao.Enabled  := False;

      nmImprimirRequisicaoAlmox.Enabled := (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]);
      nmImprimirManifesto.Enabled       := (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ATD]);
    end;
end;

procedure TViewRequisicaoAlmox.RecarregarRegistro;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  if (not DtSrcTabela.DataSet.FieldByName('data_emissao').IsNull) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('data_emissao').AsDateTime < e1Data.Date ) then
      e1Data.Date := DtSrcTabela.DataSet.FieldByName('data_emissao').AsDateTime;

    if ( DtSrcTabela.DataSet.FieldByName('data_emissao').AsDateTime > e2Data.Date ) then
      e2Data.Date := DtSrcTabela.DataSet.FieldByName('data_emissao').AsDateTime;
  end;

  FController.DAO.RefreshRecord;
end;

procedure TViewRequisicaoAlmox.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
    if ( FieldByName('STATUS').AsInteger > STATUS_REQUISICAO_ALMOX_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_REQUISICAO_ALMOX_ENV : sMsg := 'Esta requisição não pode ser alterada porque já foi enviada.';
        STATUS_REQUISICAO_ALMOX_REC : sMsg := 'Esta requisição não pode ser alterada porque já foi marcada como recebida.';
        STATUS_REQUISICAO_ALMOX_ATD : sMsg := 'Esta requisição não pode ser alterada porque está atendida.';
        STATUS_REQUISICAO_ALMOX_CAN : sMsg := 'Esta requisição não pode ser alterada porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_ABR) then
        if not ShowConfirm('A edição da requisição selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if ( not OcorreuErro ) then
      begin
        FieldByName('STATUS').AsInteger := STATUS_REQUISICAO_ALMOX_EDC;
        AbrirTabelaItens;
      end;
    end;
end;

procedure TViewRequisicaoAlmox.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    AbrirTabelaItens;
end;

procedure TViewRequisicaoAlmox.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
    if ( FieldByName('STATUS').AsInteger > STATUS_REQUISICAO_ALMOX_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_REQUISICAO_ALMOX_ENV : sMsg := 'Esta requisição não pode ser excluída porque já foi enviada.';
        STATUS_REQUISICAO_ALMOX_REC : sMsg := 'Esta requisição não pode ser excluída porque já foi marcada como recebida.';
        STATUS_REQUISICAO_ALMOX_ATD : sMsg := 'Esta requisição não pode ser excluída porque está atendida.';
        STATUS_REQUISICAO_ALMOX_CAN : sMsg := 'Esta requisição não pode ser excluída porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      inherited;
      if (not OcorreuErro) then
        AbrirTabelaItens;
    end;
end;

procedure TViewRequisicaoAlmox.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := DtSrcTabelaItens.DataSet.RecordCount + 1;
    while ( DtSrcTabelaItens.DataSet.Locate('ITEM', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( DtSrcTabela.DataSet.FieldByName('CCUSTO_ORIGEM').AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo de origem para a requisição!');
    dbCentroCustoRequisitante.SetFocus;
  end
  else
  if ( DtSrcTabela.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo de destino para a requisição!');
    dbCentroCustoAtendente.SetFocus;
  end
  else
  if ( DtSrcTabelaItens.DataSet.Active ) then
  begin
    GerarSequencial(Sequencial);

    DtSrcTabelaItens.DataSet.Append;
    DtSrcTabelaItens.DataSet.FieldByName('ANO').Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
    DtSrcTabelaItens.DataSet.FieldByName('CONTROLE').Assign( DtSrcTabela.DataSet.FieldByName('CONTROLE') );
    DtSrcTabelaItens.DataSet.FieldByName('ITEM').AsInteger := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TViewRequisicaoAlmox.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not DtSrcTabelaItens.DataSet.IsEmpty ) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TViewRequisicaoAlmox.btnProdutoExcluirClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
    if ( TServiceMessage.ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewRequisicaoAlmox.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Custo : Currency);
  var
    Item : Integer;
  begin
    Item := DtSrcTabelaItens.DataSet.FieldByName('ITEM').AsInteger;

    Total_Custo := 0.0;

    DtSrcTabelaItens.DataSet.First;

    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Custo := Total_Custo + DtSrcTabelaItens.DataSet.FieldByName('TOTAL').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;

    DtSrcTabelaItens.DataSet.Locate('ITEM', Item, []);
  end;

var
  cTotalCusto : Currency;
begin
  if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQtde.SetFocus;
    end
    else
    begin

      DtSrcTabelaItens.DataSet.Post;

      GetToTais(cTotalCusto);

      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TViewRequisicaoAlmox.btnEnviarRequisicaoClick(
  Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    try
      DtSrcTabelaItens.DataSet.First;
      DtSrcTabelaItens.DataSet.DisableControls;
      while not DtSrcTabelaItens.DataSet.Eof do
      begin
        Return := (DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency > (DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency + DtSrcTabelaItens.DataSet.FieldByName('DISPONIVEL').AsCurrency));

        if ( Return ) then
          Break;
        DtSrcTabelaItens.DataSet.Next;
      end;
    finally
      DtSrcTabelaItens.DataSet.EnableControls;
      Result := Return;
    end;
  end;

var
  cTotalCusto : Currency;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens;

    if (FieldByName('STATUS').AsInteger > STATUS_REQUISICAO_ALMOX_ABR) then
    begin
      ShowWarning('Lançamento de Requisição já está em mãos do almoxarifado (Centro de Custo atendente)!');
      Abort;
    end;

    if ( QuantidadeInvalida ) then
    begin
      ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', DtSrcTabelaItens.DataSet.FieldByName('ITEM').AsInteger) + ' está acima da quantidade disponível no estoque.');
      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
        btnProdutoEditar.SetFocus;
    end
    else
    if ShowConfirm('Confirma o encerramento e o envio da requisição selecionada?') then
    begin
      Edit;
      FieldByName('STATUS').Value := STATUS_REQUISICAO_ALMOX_ENV;

      if (Trim(FieldByName('REQUISITANTE').AsString) = EmptyStr) then
        FieldByName('REQUISITANTE').AsString := gUsuarioLogado.Login;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      ShowInformation('Envio de requisição realizado com sucesso !'
        + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewRequisicaoAlmox.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex  := 0;
  PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

  if Assigned(DtSrcTabela.DataSet) and Assigned(DtSrcTabelaItens.DataSet) then
  begin
    with DtSrcTabela.DataSet do
    begin
      dbCentroCustoRequisitante.Button.Enabled := (State in [dsEdit, dsInsert]);
      dbCentroCustoAtendente.Button.Enabled    := (State in [dsEdit, dsInsert]) and (DtSrcTabelaItens.DataSet.RecordCount = 0);

      DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (FieldByName('STATUS').AsInteger < STATUS_REQUISICAO_ALMOX_ENV);
      DtSrcTabelaItensStateChange( DtSrcTabelaItens );
    end;
  end;
end;

function TViewRequisicaoAlmox.Empresa: IControllerEmpresa;
begin
  Result := FControllerEmpresaView as IControllerEmpresa;
end;

procedure TViewRequisicaoAlmox.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens;
end;

procedure TViewRequisicaoAlmox.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    TbsRequisicaoCancelado.TabVisible := (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_CAN);
end;

procedure TViewRequisicaoAlmox.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('ATENDIMENTO_USUARIO').AsString.Trim() = EmptyStr) then
      FieldByName('ATENDIMENTO_USUARIO').Clear;

    if (FieldByName('CANCEL_USUARIO').AsString.Trim() = EmptyStr) then
      FieldByName('CANCEL_USUARIO').Clear;
  end;
end;

procedure TViewRequisicaoAlmox.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TViewRequisicaoAlmox.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_REQUISICAO_ALMOX_EDC : Text := 'Editando';
    STATUS_REQUISICAO_ALMOX_ABR : Text := 'Aberta';
    STATUS_REQUISICAO_ALMOX_ENV : Text := 'Enviada';
    STATUS_REQUISICAO_ALMOX_REC : Text := 'Recebida';
    STATUS_REQUISICAO_ALMOX_ATD : Text := 'Atendida';
    STATUS_REQUISICAO_ALMOX_CAN : Text := 'Cancelada';
  end;
end;

procedure TViewRequisicaoAlmox.fdQryTabelaTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_REQUISICAO_ALMOX_CI:
        Text := 'Consumo Interno';

      TIPO_REQUISICAO_ALMOX_CP:
        Text := 'Consumo Produção';

      TIPO_REQUISICAO_ALMOX_TE:
        Text := 'Transf. Estoque/Equipamentos';

      else
        Text := Sender.AsString;
    end;
end;

procedure TViewRequisicaoAlmox.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  if Assigned(DtSrcTabela.DataSet) then
  begin
    dbCentroCustoAtendente.Button.Enabled := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) and (DtSrcTabelaItens.DataSet.RecordCount = 0);

    btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) );
    btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
    btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
    btnProdutoSalvar.Enabled  := ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] );

    if Assigned(DtSrcTabelaItens.DataSet) then
    begin
      dbgProdutos.Enabled       := not (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]);

      if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
    end;
  end;
end;

procedure TViewRequisicaoAlmox.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    pgcMaisDados.ActivePage := tbsObservacoes;
  end;

  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoAlmox.btnFiltrarClick(Sender: TObject);
begin
  MontarFiltrosAdcionais;
  inherited;
end;

procedure TViewRequisicaoAlmox.CarregarDadosProduto(aCodigo : Integer);
begin
  if (aCodigo = 0 ) then
  begin
    TServiceMessage.ShowWarning('Favor informar o código do produto');
    Exit;
  end;

  if ( not DtSrcTabelaItens.DataSet.Active ) then
    Exit
  else
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if not Assigned(FControllerProdutoAlmox) then
      FControllerProdutoAlmox := TControllerFactory.New.ProdutoAlmoxarifado;

    with FControllerProdutoAlmox.Carregar(
      DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString,
      DtSrcTabela.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger,
      aCodigo,
      DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
      DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger
    ).DAO.DataSet do
    begin
      if not IsEmpty then
      begin
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString             := FieldByName('cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := FieldByName('descri_apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString           := FieldByName('Unp_sigla').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('LOTE_ATENDIMENTO').AsString    := FieldByName('lote_id').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('FRACIONADOR').AsCurrency       := FieldByName('fracionador').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('ESTOQUE').AsCurrency           := FieldByName('estoque').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('RESERVA').AsCurrency           := FieldByName('reserva').AsCurrency;
        DtSrcTabelaItens.DataSet.FieldByName('DISPONIVEL').AsCurrency        := FieldByName('disponivel').AsCurrency;

        if ( FieldByName('codunidade_fracionada').AsInteger > 0 ) then
          DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := FieldByName('codunidade_fracionada').AsInteger;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de produto não associado ao estoque do centro de custo ' + QuotedStr(dbCentroCustoAtendente.Text) + '!');
        DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewRequisicaoAlmox.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( DtSrcTabelaItens.DataSet.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da requisição.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da requisição!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FormatFloat('###0000000', FieldByName('CONTROLE').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

      if GetExisteNumeroRequisicaoAlmox(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        ShowWarning('Número de requisiçaõ de materiais já existe!');
        Abort;
      end;

      FieldByName('MOTIVO').AsString  := AnsiUpperCase(FieldByName('MOTIVO').AsString.Trim);
      FieldByName('OBS').AsString     := AnsiUpperCase(FieldByName('OBS').AsString.Trim);

      if ( DtSrcTabelaItens.DataSet.RecordCount > 0 ) then
        FieldByName('ITENS').AsInteger := DtSrcTabelaItens.DataSet.RecordCount
      else
        FieldByName('ITENS').Clear;

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

procedure TViewRequisicaoAlmox.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbProduto ) then
    if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString, 0) );

  if ( (Sender = dbQtde) or (Sender = dbCustoUn) ) then
    if ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] ) then
      DtSrcTabelaItens.DataSet.FieldByName('TOTAL').AsCurrency :=
        DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency *
        DtSrcTabelaItens.DataSet.FieldByName('CUSTO').AsCurrency;

  if ( Sender = dbCustoTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

function TViewRequisicaoAlmox.Controller: IControllerRequisicaoAlmoxarifado;
begin
  Result := (FController as IControllerRequisicaoAlmoxarifado);
end;

procedure TViewRequisicaoAlmox.ControllerAfterScroll(DataSet: TDataSet);
begin
  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoAlmox.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TViewRequisicaoAlmox.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Sender = dbgDados) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar requisição em edição
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_EDC ) then
        dbgDados.Canvas.Brush.Color := shpOperacaoEditando.Brush.Color
      else
      // Destacar requisição aberta
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_ABR ) then
        dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
      else
      // Destacar requisição cancelada
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_CAN ) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos não cancelados e/ou não atendidos
  if ( Sender = dbgProdutos ) then
  begin
    if ((DtSrcTabelaItens.DataSet.FieldByName('STATUS').AsInteger = STATUS_ITEM_REQUISICAO_ALMOX_CAN) or (DtSrcTabelaItens.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency = 0)) then
      dbgProdutos.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TViewRequisicaoAlmox.dbProdutoButtonClick(Sender: TObject);
var
  bSelecionado : Boolean;
  sProdutoID,
  sLoteID   ,
  sProdutoDescricao,
  sUnidade  : String;
  iUnidade  : Integer;

  cEstoque    ,
  cReserva    ,
  cDisponivel : Currency;
begin
  if (DtSrcTabela.DataSet.FieldByName('CCUSTO_ORIGEM').AsInteger = 0) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo requisitante!');
    dbCentroCustoRequisitante.SetFocus;
  end
  else
  if (DtSrcTabela.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger = 0) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo atendente!');
    dbCentroCustoAtendente.SetFocus;
  end
  else
  if (dbProduto.Button.Enabled and (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert])) then
  begin

    cEstoque    := 0.0;
    cReserva    := 0.0;
    cDisponivel := 0.0;

    bSelecionado := SelecionarProdutoLoteAlmox(Self
      , DtSrcTabela.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger
      , dbCentroCustoAtendente.Text
      , sProdutoID
      , sProdutoDescricao
      , sLoteID
      , sUnidade
      , iUnidade
      , cEstoque
      , cReserva
      , cDisponivel);

    if bSelecionado then
    begin
      DtSrcTabelaItens.DataSet.FieldByName('PRODUTO').AsString             := sProdutoID;
      DtSrcTabelaItens.DataSet.FieldByName('LOTE_ATENDIMENTO').AsString    := sLoteID;
      DtSrcTabelaItens.DataSet.FieldByName('DESCRI_APRESENTACAO').AsString := sProdutoDescricao;
      DtSrcTabelaItens.DataSet.FieldByName('UNP_SIGLA').AsString           := sUnidade;
      DtSrcTabelaItens.DataSet.FieldByName('ESTOQUE').AsCurrency           := cEstoque;
      DtSrcTabelaItens.DataSet.FieldByName('RESERVA').AsCurrency           := cReserva;
      DtSrcTabelaItens.DataSet.FieldByName('DISPONIVEL').AsCurrency        := cDisponivel;

      if (iUnidade > 0) then
        DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := iUnidade;
    end;

  end;
end;

procedure TViewRequisicaoAlmox.nmImprimirRequisicaoAlmoxClick(
  Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoRequisicaoAlmox.New;

  FImpressao
    .VisualizarRequisicao(
      DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString,
      DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
      DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger,
      DtSrcTabela.DataSet.FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger
    );
end;

procedure TViewRequisicaoAlmox.btnCancelarRequisicaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens;

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_CAN) then
    begin
      ShowWarning('Lançamento de Requisição já está cancelado!');
      Abort;
    end;

    if not (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]) then
      ShowInformation('Apenas registros enviados, recebidos e/ou atendidos podem ser cancelados!')
    else
    if CancelarRequisicaoAlmox(Self, FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger) then
    begin
      RecarregarRegistro;

      ShowInformation('Requisição cancelada com sucesso.' +
        #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString +
        '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TViewRequisicaoAlmox.btnFinalizarLancamentoClick(
  Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    try
      DtSrcTabelaItens.DataSet.First;
      DtSrcTabelaItens.DataSet.DisableControls;
      while not DtSrcTabelaItens.DataSet.Eof do
      begin
        Return := (DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency > (DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency + DtSrcTabelaItens.DataSet.FieldByName('DISPONIVEL').AsCurrency));

        if Return then
          Break;

        DtSrcTabelaItens.DataSet.Next;
      end;

    finally
      DtSrcTabelaItens.DataSet.EnableControls;
      Result := Return;
    end;
  end;

var
  cTotalCusto : Currency;
  sMensagemMn : String;
begin
(*
  IMR - 09/12/2016:
        As etapas de finalização e envio da requisição foram colocadas em apenas
        uma a fim de simplificar o processo de encerramento das requisições de
        materiais/produtos ao estoque.
*)
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens;

    if (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV]) then
    begin
      ShowWarning('Lançamento de Requisição já está finalizado e/ou enviado ao estoque!');
      Abort;
    end;

    if ( QuantidadeInvalida ) then
    begin
      ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', DtSrcTabelaItens.DataSet.FieldByName('ITEM').AsInteger) + ' está acima da quantidade disponível no estoque.');
      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
        btnProdutoEditar.SetFocus;
    end
    else
    if ShowConfirm('Confirma a finalização e o envio da requisição de materiais?') then
    begin
      ValidarToTais(cTotalCusto);

      Edit;

      FieldByName('STATUS').AsInteger       := STATUS_REQUISICAO_ALMOX_ENV;
      FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;

      if (FieldByName('REQUISITANTE').AsString.Trim() = EmptyStr) then
        FieldByName('REQUISITANTE').AsString := gUsuarioLogado.Login;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      if GetUserManifestoAutomatico then
      begin
        sMensagemMn :=
          'Requisição ' + FieldByName('ANO').AsString + '/' +
          FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger) + ':' + #13#13 +
          'O Manifesto de Saída dos materiais/produtos requisitados '    +
          'será gerado automaticamente com a sua confirmação. Isso '     +
          'quer dizer que as quantidades solicitadas já serão abatidas ' +
          'do estoque.' + #13#13 + 'Confirma esse procedimento?';
        if ShowConfirmation('Manifesto Automático', sMensagemMn) then
        begin
          GerarManifestoAutomatico;
          nmImprimirManifesto.Click;
        end;
      end
      else
        ShowInformation('Requisição finalizada e enviada com sucesso !' + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;
      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewRequisicaoAlmox.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if ( (Field = DtSrcTabelaItens.DataSet.FieldByName('QTDE')) or (Field = DtSrcTabelaItens.DataSet.FieldByName('CUSTO')) ) then
      DtSrcTabelaItens.DataSet.FieldByName('TOTAL').AsCurrency := DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency * DtSrcTabelaItens.DataSet.FieldByName('CUSTO').AsCurrency;
end;

procedure TViewRequisicaoAlmox.FormKeyDown(Sender: TObject;
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
          if ( Length(Trim(dbNumero.Text)) > 0 ) then
            if GetExisteNumeroRequisicaoAlmox(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger, Trim(dbNumero.Text), sControle) then
              ShowWarning('Número de requisição de materiais já existe!' + #13 + 'Controle: ' + sControle);

        { DONE -oIsaque -cRequsição de Materiais : 13/01/2015 - Verificar a Data da Requisição }

        if dbDataEmissao.Focused then
          if (dbDataEmissao.Date > GetDateTimeDB) then
            ShowWarning('A Data de emissão da requisição está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');
      end;

  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    with DtSrcTabela.DataSet do
    begin
      if (State in [dsInsert]) then
        if ( dbCentroCustoRequisitante.Focused ) then
        begin
          FieldByName('CCUSTO_ORIGEM').Clear;
          FieldByName('CC_ORIGEM_DESC').Clear;
          FieldByName('CC_ORIGEM_CODCLIENTE').Clear;
        end
        else
        if ( dbCentroCustoAtendente.Focused ) then
        begin
          FieldByName('CCUSTO_DESTINO').Clear;
          FieldByName('CC_DESTINO_DESC').Clear;
        end
        else
        if ( dbUsuarioRequisitante.Focused ) then
          FieldByName('REQUISITANTE').Clear;
    end;

  end;

  inherited;
end;

procedure TViewRequisicaoAlmox.MontarFiltrosAdcionais;
begin
  if (iCentroCustoOrigem > 0) then
    WhereAdditional := '(r.ccusto_origem = ' + IntToStr(iCentroCustoOrigem) + ') and ' +
      'cast(r.data_emissao as date) between ' +
                         QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                         QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) )
  else
  if (iCentroCustoDestino > 0) then
    WhereAdditional := '(r.ccusto_destino = ' + IntToStr(iCentroCustoDestino) + ') and ' +
      'cast(r.data_emissao as date) between ' +
                         QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                         QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) )
  else
    WhereAdditional :=
      'cast(r.data_emissao as date) between ' +
                         QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                         QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if ( RdgStatusRequisicao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (r.status = ' + IntToStr(RdgStatusRequisicao.ItemIndex - 1) + ')';
end;

function TViewRequisicaoAlmox.GetRotinaEnviarID: String;
begin
  Result := GetRotinaInternaID(btnEnviarRequisicao);
end;

procedure TViewRequisicaoAlmox.GerarManifestoAutomatico;
var
  bAtendido : Boolean;
begin
  bAtendido := False;
  DtSrcTabelaItens.DataSet.DisableControls;
  try
    Controller.AjustarQuantidadeAtendidaDeProdutos;
    DtSrcTabelaItens.DataSet.First;

    // Mudar o status dos materia/produtos para Atendidos
    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      if (DtSrcTabelaItens.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency > 0) then
      begin
        DtSrcTabelaItens.DataSet.Edit;
        DtSrcTabelaItens.DataSet.FieldByName('STATUS').AsInteger := STATUS_ITEM_REQUISICAO_ALMOX_ATE;
        DtSrcTabelaItens.DataSet.Post;

        if not bAtendido then
          bAtendido := True;
      end;

      DtSrcTabelaItens.DataSet.Next;
    end;

    DtSrcTabelaItens.DataSet.EnableControls;
    DtSrcTabelaItens.DataSet.First;

    // Postar na base os atendimentos
    if bAtendido then
    begin
      Produtos.DAO.ApplyUpdates;
      Produtos.DAO.CommitUpdates;
      Produtos.DAO.CommitTransaction;

      with DtSrcTabela.DataSet do
      begin
        Edit;

        dbObservacao.Lines.Add('Auto-manifesto gerado por ' +  QuotedStr(gUsuarioLogado.Login));
        FieldByName('STATUS').AsInteger             := STATUS_REQUISICAO_ALMOX_ATD;
        FieldByName('ATENDIMENTO_USUARIO').AsString := gUsuarioLogado.Login;
        FieldByName('ATENDIMENTO_DATA').AsDateTime  := GetDateTimeDB;

        DtSrcTabela.DataSet.Post;
        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        ExecuteScriptSQL('Execute Procedure SET_REQUISICAO_ALMOX_CUSTO(' +
          FieldByName('ANO').AsString + ', ' +
          FieldByName('CONTROLE').AsString + ', ' +
          QuotedStr(FieldByName('EMPRESA').AsString) + ')');
      end;
    end;
  finally
    DtSrcTabelaItens.DataSet.EnableControls;
  end;
end;

function TViewRequisicaoAlmox.GetMenorDataEmissao: TDateTime;
begin
  with DMBusiness, fdQryBusca do
  begin
    Close;

    SQL.Clear;
    SQL.Add('Select');
    SQL.Add('  min(r.data_emissao) as data_emissao');
    SQL.Add('from TBREQUISICAO_ALMOX r');
    SQL.Add('where r.status in (' + IntToStr(STATUS_REQUISICAO_ALMOX_EDC) + ', ' + IntToStr(STATUS_REQUISICAO_ALMOX_ABR) + ')');
    Open;

    if not FieldByName('data_emissao').IsNull then
      Result := FieldByName('data_emissao').AsDateTime
    else
      Result := GetDateDB - 30;

    Close;
  end;
end;

function TViewRequisicaoAlmox.GetRotinaCancelarRequisicaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarRequisicao);
end;

function TViewRequisicaoAlmox.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarLancamento);
end;

procedure TViewRequisicaoAlmox.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarLancamento.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarLancamento.Caption, RotinaID);

    if btnEnviarRequisicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEnviarID, btnEnviarRequisicao.Caption, RotinaID);

    if btnCancelarRequisicao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarRequisicaoID, btnCancelarRequisicao.Caption, RotinaID);
  end;
end;

procedure TViewRequisicaoAlmox.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TViewRequisicaoAlmox.ValidarToTais(var Total_Custo : Currency);
var
  Item : Integer;
begin
  Item := DtSrcTabelaItens.DataSet.FieldByName('ITEM').AsInteger;

  Total_Custo := 0.0;

  DtSrcTabelaItens.DataSet.First;

  try
    DtSrcTabelaItens.DataSet.DisableControls;
    while not DtSrcTabelaItens.DataSet.Eof do
    begin
      Total_Custo := Total_Custo + DtSrcTabelaItens.DataSet.FieldByName('TOTAL').AsCurrency;

      DtSrcTabelaItens.DataSet.Next;
    end;
  finally
    DtSrcTabelaItens.DataSet.Locate('ITEM', Item, []);
    DtSrcTabelaItens.DataSet.EnableControls;
  end;
end;

procedure TViewRequisicaoAlmox.dbUsuarioRequisitanteButtonClick(Sender: TObject);
var
  sLogin,
  sNome : String;
begin
  if ( dbUsuarioRequisitante.Button.Enabled and (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) ) then
    if SelecionarUsuarioRequisitante(Self, sLogin, sNome) then
    begin
      DtSrcTabela.DataSet.FieldByName('REQUISITANTE').AsString         := sLogin;
      DtSrcTabela.DataSet.FieldByName('USUARIO_REQUISITANTE').AsString := sNome;
    end;
end;

procedure TViewRequisicaoAlmox.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

function TViewRequisicaoAlmox.Produtos: IControllerCustom;
begin
  Result := Controller.Produtos;
end;

procedure TViewRequisicaoAlmox.dbCentroCustoSelecionar(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsInsert] ) then
      if ( SelecionarDepartamento(Self, 0, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) ) then
      begin
        if (Sender = dbCentroCustoRequisitante) then
        begin
          FieldByName('CCUSTO_ORIGEM').AsInteger := iCodigo;
          FieldByName('CC_ORIGEM_DESC').AsString := sNome;
          FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger := iCliente;
        end
        else
        if (Sender = dbCentroCustoAtendente) then
        begin
          FieldByName('CCUSTO_DESTINO').AsInteger := iCodigo;
          FieldByName('CC_DESTINO_DESC').AsString := sNome;
        end;
      end;
  end;
end;

procedure TViewRequisicaoAlmox.btnProdutoAtenderClick(Sender: TObject);
var
  sQuantidade : String;
begin
  dbgProdutos.SetFocus;

  if DtSrcTabelaItens.DataSet.IsEmpty then
    Exit;

  sQuantidade := DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsString;

  if InputQuery('Atender', 'Informe a quantidade a ser atendida:', sQuantidade) then
    if StrToCurrDef(sQuantidade, 0) <= 0 then
      ShowWarning('Quantidade informada é inválida para atendimento!')
    else
    begin
      if (StrToCurrDef(sQuantidade, 0) > DtSrcTabelaItens.DataSet.FieldByName('DISPONIVEL_TMP').AsCurrency) then
      begin
        ShowWarning('Quantidade para atendimento informada é superior a disponível em estoque!');
        Exit;
      end
      else
      if (StrToCurrDef(sQuantidade, 0) > DtSrcTabelaItens.DataSet.FieldByName('QTDE').AsCurrency) then
      begin
        ShowWarning('Quantidade para atendimento informada é superior a quantidade solicitada!');
        Exit;
      end;


      DtSrcTabelaItens.DataSet.Edit;
      DtSrcTabelaItens.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency := StrToCurrDef(sQuantidade, 0);
      DtSrcTabelaItens.DataSet.Post;

      dbgProdutos.SetFocus;
    end;
end;

procedure TViewRequisicaoAlmox.btnProdutoAtenderTodosClick(
  Sender: TObject);
begin
  if DtSrcTabelaItens.DataSet.IsEmpty then
    Exit;

  if not ShowConfirmation('Deseja atender todos os ítens da requisição de materiais?') then
    Exit;

  Controller.AjustarQuantidadeAtendidaDeProdutos;
  dbgProdutos.SetFocus;
end;

procedure TViewRequisicaoAlmox.btnProdutoAguardaClick(Sender: TObject);
begin
  if DtSrcTabelaItens.DataSet.IsEmpty then
    Exit;

  if not ShowConfirmation('Deseja colocar o item selecionado como "Aguardando"?') then
    Exit;

  DtSrcTabelaItens.DataSet.Edit;
  DtSrcTabelaItens.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency := 0;
  DtSrcTabelaItens.DataSet.FieldByName('STATUS').AsInteger         := STATUS_ITEM_REQUISICAO_ALMOX_AGU;
  DtSrcTabelaItens.DataSet.Post;

  dbgProdutos.SetFocus;
end;

procedure TViewRequisicaoAlmox.btnProdutoCancelarClick(Sender: TObject);
begin
  if DtSrcTabelaItens.DataSet.IsEmpty then
    Exit;

  if not ShowConfirmation('Deseja cancelar o atendimento do item selecionado?') then
    Exit;

  DtSrcTabelaItens.DataSet.Edit;
  DtSrcTabelaItens.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency := 0;
  DtSrcTabelaItens.DataSet.FieldByName('STATUS').AsInteger         := STATUS_ITEM_REQUISICAO_ALMOX_CAN;
  DtSrcTabelaItens.DataSet.Post;

  dbgProdutos.SetFocus;
end;

procedure TViewRequisicaoAlmox.btnConfirmarAtendimentoClick(
  Sender: TObject);
var
  bAtendido : Boolean;
begin
  if not ShowConfirmation('Confirma o atendimento da requisição de materiais selecionada?') then
    Exit;

  // Buscar item não atendidos e sinalizar os atendidos

  bAtendido := False;

  DtSrcTabelaItens.DataSet.DisableControls;
  DtSrcTabelaItens.DataSet.First;

  while not DtSrcTabelaItens.DataSet.Eof do
  begin
    if (DtSrcTabelaItens.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency > 0) then
    begin
      DtSrcTabelaItens.DataSet.Edit;
      DtSrcTabelaItens.DataSet.FieldByName('STATUS').AsInteger := STATUS_ITEM_REQUISICAO_ALMOX_ATE;
      DtSrcTabelaItens.DataSet.Post;

      if not bAtendido then
        bAtendido := True;
    end;

    DtSrcTabelaItens.DataSet.Next;
  end;

  DtSrcTabelaItens.DataSet.EnableControls;
  DtSrcTabelaItens.DataSet.First;

  if not bAtendido then
  begin
    ShowWarning('Nenhum item fora atendido nesta requisição de materiais.' + #13 + 'Favor verificar!');
    dbgProdutos.SetFocus;
    Exit;
  end;

  // Posta na base os atendimentos
  Produtos.DAO.ApplyUpdates;
  Produtos.DAO.CommitUpdates;
  Produtos.DAO.CommitTransaction;

  with DtSrcTabela.DataSet do
  begin
    Edit;

    FieldByName('STATUS').AsInteger             := STATUS_REQUISICAO_ALMOX_ATD;
    FieldByName('ATENDIMENTO_USUARIO').AsString := gUsuarioLogado.Login;
    FieldByName('ATENDIMENTO_DATA').AsDateTime  := GetDateTimeDB;

    DtSrcTabela.DataSet.Post;
    FController.DAO.ApplyUpdates;
    FController.DAO.CommitUpdates;
    FController.DAO.CommitTransaction;

    ExecuteScriptSQL('Execute Procedure SET_REQUISICAO_ALMOX_CUSTO(' +
      FieldByName('ANO').AsString + ', ' +
      FieldByName('CONTROLE').AsString + ', ' +
      QuotedStr(FieldByName('EMPRESA').AsString) + ')');
  end;

  ModalResult := mrOk;
end;

procedure TViewRequisicaoAlmox.nmImprimirManifestoClick(Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger <> STATUS_REQUISICAO_ALMOX_ATD) then
    TServiceMessage.ShowWarning('Apenas requisição de materiais já atendidas possuem impressão de Manifesto!')
  else
  begin
    if not Assigned(FImpressao) then
      FImpressao := TImpressaoRequisicaoAlmox.New;

    FImpressao
      .VisualizarManifesto(
        DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString,
        DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
        DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger,
        DtSrcTabela.DataSet.FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger,
        False
      );
  end;
end;

initialization
  FormFunction.RegisterForm('ViewRequisicaoAlmox', TViewRequisicaoAlmox);

end.
