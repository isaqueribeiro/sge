unit View.SolicitacaoCompra;

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
  SGI.Controller.Impressao.SolicitacaoCompra;

type
  TViewSolicitacaoCompra = class(TViewPadraoCadastro)
    RdgStatusSolicitacao: TRadioGroup;
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
    lblAprovador: TLabel;
    dbAprovador: TDBEdit;
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
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel6: TBevel;
    dbgProdutos: TDBGrid;
    ppImprimir: TPopupMenu;
    nmImprimirSolicitacao: TMenuItem;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    dtsTipoSolicitacao: TDataSource;
    lblDataValidade: TLabel;
    tbsEventoLOG: TTabSheet;
    PgcTextoSolicitacao: TPageControl;
    TbsSolicitacaoObjeto: TTabSheet;
    TbsSolicitacaoObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    TbsSolicitacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblNomeSolicitante: TLabel;
    dbNomeSolicitante: TDBEdit;
    dbEventoLOG: TDBMemo;
    btnFinalizarSolicitacao: TcxButton;
    btnAprovarSolicitacao: TcxButton;
    btnCancelarSolicitacao: TcxButton;
    lblCentroCustoSolicitacao: TLabel;
    lblProdutoNome: TLabel;
    dtsUnidade: TDataSource;
    dbUnidade: TDBLookupComboBox;
    TbsSolicitacaoMotivo: TTabSheet;
    dbObjeto: TDBMemo;
    dbMotivo: TDBMemo;
    lblCentroCustoItem: TLabel;
    lblProdutoNaoCadastrado: TLabel;
    dbDataEmissao: TJvDBDateEdit;
    dbDataValidade: TJvDBDateEdit;
    dbCentroCustoSolicitacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbCentroCustoItem: TJvDBComboEdit;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpOperacaoEditando: TShape;
    shpOperacaoCancelada: TShape;
    shpOperacaoAberta: TShape;
    pnlStatusText: TPanel;
    lblOperacaoAberta: TLabel;
    lblOperacaoCancelada: TLabel;
    lblOperacaoEditando: TLabel;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    procedure ControllerAfterScroll(DataSet: TDataSet);
    procedure dbCentroCustoSelecionar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btnAprovarSolicitacaoClick(Sender: TObject);
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
    procedure nmImprimirSolicitacaoClick(Sender: TObject);
    procedure btnCancelarSolicitacaoClick(Sender: TObject);
    procedure btnFinalizarSolicitacaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FImpressao : IImpressaoSolicitacaoCompra;
    FControllerEmpresaView,
    FControllerTipoSolicitacaoView,
    FControllerUnidadeProduto : IControllerCustom;
    FControllerProduto : IControllerProduto;
    FControllerItens : IControllerCustom;

    iSeq : Integer;
    iCentroCusto : Integer;

    procedure AbrirTabelaItens;
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure SetEventoLOG(sEvento : String);

    function Controller : IControllerSolicitacaoCompra;
    function Produtos : IControllerCustom;
    function Empresa : IControllerEmpresa;

    function GetRotinaFinalizarID : String;
    function GetRotinaAprovarID : String;
    function GetRotinaCancelarSolicitacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaAprovarID   : String read GetRotinaAprovarID;
    property RotinaCancelarSolicitacaoID : String read GetRotinaCancelarSolicitacaoID;
  end;

(*
  Tabelas:
  - TBSOLICITACAO
  - TBSOLICITACAO_ITEM
  - TBCENTRO_CUSTO
  - TBUNIDADEPROD

  Views:
  - VW_EMPRESA
  - VW_TIPO_SOLICITACAO

  Procedures:

*)

var
  ViewSolicitacaoCompra: TViewSolicitacaoCompra;

  procedure MostrarControleSolicitacao(const AOwner : TComponent);

  function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
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
  , View.SolicitacaoCompra.Cancelar
  , View.CentroCusto;

{$R *.dfm}

procedure MostrarControleSolicitacao(const AOwner : TComponent);
var
  AForm : TViewSolicitacaoCompra;
  aDataInicio,
  aDataFinal : String;
begin
  AForm := TViewSolicitacaoCompra.Create(AOwner);
  try
    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);


    AForm.WhereAdditional :=
      '(cast(s.data_emissao as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(s.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusSolicitacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (s.status = ' + IntToStr(AForm.RdgStatusSolicitacao.ItemIndex - 1) + ')';

    AForm.FController.DAO.ClearWhere;
    AForm.FController.DAO.Where(AForm.WhereAdditional);
    AForm.FController.DAO.Open;

    AForm.ShowModal;
  finally
    AForm.Destroy;
  end;
end;

function SelecionarSolicitacao(const AOwner : TComponent; CentroCusto : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
  AForm : TViewSolicitacaoCompra;
  aDataInicio,
  aDataFinal ,
  aNome      : String;
  I : Integer;
begin
  AForm := TViewSolicitacaoCompra.Create(AOwner);
  try
    AForm.btbtnIncluir.Visible            := False;
    AForm.btnFinalizarSolicitacao.Visible := False;
    AForm.btnAprovarSolicitacao.Visible   := False;
    AForm.btnCancelarSolicitacao.Visible  := False;

    AForm.RdgStatusSolicitacao.ItemIndex := STATUS_SOLICITACAO_FIN + 1;
    AForm.RdgStatusSolicitacao.Enabled   := False;

    AForm.iCentroCusto := 0;
    AForm.e1Data.Date := DataInicial;

    aDataInicio := FormatDateTime('yyyy-mm-dd', AForm.e1Data.Date);
    aDataFinal  := FormatDateTime('yyyy-mm-dd', AForm.e2Data.Date);

    AForm.WhereAdditional :=
      '(cast(s.data_emissao as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
      '(s.empresa in ( ' +
      '  Select      ' +
      '    vw.cnpj   ' +
      '  from VW_EMPRESA vw' +
      '))';

    if (AForm.RdgStatusSolicitacao.ItemIndex > 0) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (s.status = ' + IntToStr(AForm.RdgStatusSolicitacao.ItemIndex - 1) + ')';

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

procedure TViewSolicitacaoCompra.FormCreate(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  FController := TControllerFactory.New.SolicitacaoCompra;
  FController.DAO.DataSet.AfterScroll := ControllerAfterScroll;

  FControllerEmpresaView         := TControllerFactory.New.EmpresaView;
  FControllerTipoSolicitacaoView := TControllerFactory.New.TipoSolicitacaoView;
  FControllerUnidadeProduto      := TControllerFactory.New.UnidadeProduto;

  DtSrcTabelaItens.DataSet := Produtos.DAO.DataSet;

  inherited;

  e1Data.Date      := IncDay(Date, -30);
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;
  iCentroCusto     := 0;

  pgcMaisDados.Height := 190;
  RotinaID            := ROTINA_MOV_SOLICITACAO_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBSOLICITACAO';
  CampoCodigo    := 'c.codigo';
  CampoDescricao := 'c.descricao';
  CampoOrdenacao := 's.numero';

  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(cast(s.data_emissao as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ') and ' +
    '(s.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  Tabela
    .Display('CODIGO',  'No. Controle', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('EMPRESA', 'Empresa', TAlignment.taLeftJustify, True)
    .Display('CENTRO_CUSTO', 'Departamento / Centro de Custo', TAlignment.taLeftJustify, True)
    .Display('INSERCAO_DATA', 'Data/Hora', 'dd/mm/yyyy hh:nn', TAlignment.taLeftJustify, True)
    .Display('TIPO', 'Tipo', TAlignment.taLeftJustify, True)
    .Display('STATUS','Situação', TAlignment.taLeftJustify, True)
    .Configurar;

  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');

  TController(FControllerTipoSolicitacaoView)
    .LookupComboBox(dbTipo, dtsTipoSolicitacao, 'tipo', 'codigo', 'descricao');

  TController(FControllerUnidadeProduto)
    .LookupComboBox(dbUnidade, dtsUnidade, 'unidade', 'unp_cod', 'unp_descricao');
end;

procedure TViewSolicitacaoCompra.btbtnIncluirClick(Sender: TObject);
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

procedure TViewSolicitacaoCompra.AbrirTabelaItens;
begin
  Controller.CarregarProdutos;
  HabilitarDesabilitar_Btns;
end;

procedure TViewSolicitacaoCompra.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if (pgcGuias.ActivePage = tbsCadastro) then
    begin
      btnFinalizarSolicitacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_EDC, STATUS_SOLICITACAO_ABR]) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnAprovarSolicitacao.Enabled   := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN]) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnCancelarSolicitacao.Enabled  := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);

      nmImprimirSolicitacao.Enabled   := (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);
    end
    else
    begin
      btnFinalizarSolicitacao.Enabled := False;
      btnAprovarSolicitacao.Enabled   := False;
      btnCancelarSolicitacao.Enabled  := False;

      nmImprimirSolicitacao.Enabled   := (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR]);
    end;
  end;
end;

procedure TViewSolicitacaoCompra.RecarregarRegistro;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  if (not DtSrcTabela.DataSet.FieldByName('DATA_EMISSAO').IsNull) then
  begin
    if ( DtSrcTabela.DataSet.FieldByName('DATA_EMISSAO').AsDateTime < e1Data.Date ) then
      e1Data.Date := DtSrcTabela.DataSet.FieldByName('DATA_EMISSAO').AsDateTime;

    if ( DtSrcTabela.DataSet.FieldByName('DATA_EMISSAO').AsDateTime > e2Data.Date ) then
      e2Data.Date := DtSrcTabela.DataSet.FieldByName('DATA_EMISSAO').AsDateTime;
  end;

  FController.DAO.RefreshRecord;
end;

procedure TViewSolicitacaoCompra.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_SOLICITACAO_FIN ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_SOLICITACAO_APR : sMsg := 'Esta solicitação não pode ser alterada por já está aprovada/encerrada.';
        STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicitação não pode ser alterada porque está cancelada.';
      end;

      TServiceMessage.ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_ABR, STATUS_SOLICITACAO_FIN]) then
        if not TServiceMessage.ShowConfirm('A análise da solicitação selecionada está em andamento (Aberta).' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if (not OcorreuErro) then
      begin
        FieldByName('STATUS').AsInteger := STATUS_SOLICITACAO_EDC;
        dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicitação reaberta para edição por ' + gUsuarioLogado.Login);
        AbrirTabelaItens;
      end;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    AbrirTabelaItens;
end;

procedure TViewSolicitacaoCompra.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSRcTabela.DataSet do
  begin
    if (FieldByName('STATUS').AsInteger > STATUS_SOLICITACAO_FIN) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_SOLICITACAO_APR : sMsg := 'Esta solicitação não pode ser excluída por já está aprovada/encerrada.';
        STATUS_SOLICITACAO_CAN : sMsg := 'Esta solicitação não pode ser excluída porque está cancelada.';
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
end;

procedure TViewSolicitacaoCompra.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TViewSolicitacaoCompra.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := DtSrcTabelaItens.DataSet.RecordCount + 1;
    while ( DtSrcTabelaItens.DataSet.Locate('SEQ', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if Trim(DtSRcTabela.DataSet.FieldByName('OBJETO_SOLICITACAO').AsString).IsEmpty then
  begin
    ShowWarning('Favor informar uma breve descrição sobre o objeto da solicitação!');
    PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;
    dbObjeto.SetFocus;
  end
  else
  if ( DtSrcTabelaItens.DataSet.Active ) then
  begin
    GerarSequencial(Sequencial);

    DtSrcTabelaItens.DataSet.Append;
    DtSrcTabelaItens.DataSet.FieldByName('ANO').Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
    DtSrcTabelaItens.DataSet.FieldByName('CODIGO').Assign( DtSrcTabela.DataSet.FieldByName('CODIGO') );
    DtSrcTabelaItens.DataSet.FieldByName('CENTRO_CUSTO').Assign( DtSrcTabela.DataSet.FieldByName('CENTRO_CUSTO') );
    DtSrcTabelaItens.DataSet.FieldByName('CENTRO_CUSTO_NOME').Assign( DtSrcTabela.DataSet.FieldByName('CENTRO_CUSTO_NOME') );
    DtSrcTabelaItens.DataSet.FieldByName('SEQ').AsInteger := Sequencial;

    dbProduto.SetFocus;
  end;
end;

procedure TViewSolicitacaoCompra.btnProdutoEditarClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
  begin
    DtSrcTabelaItens.DataSet.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TViewSolicitacaoCompra.btnProdutoExcluirClick(Sender: TObject);
begin
  if (not DtSrcTabelaItens.DataSet.IsEmpty) then
    if ( TServiceMessage.ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      DtSrcTabelaItens.DataSet.Delete;
end;

procedure TViewSolicitacaoCompra.btnProdutoSalvarClick(Sender: TObject);
begin
  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
  begin
    if Trim(DtSrcTabelaItens.DataSet.FieldByName('ITEM_CODIGO').AsString).IsEmpty then
    begin
      TServiceMessage.ShowWarning('Favor informar o código do produto/serviço.');
      dbProduto.SetFocus;
    end
    else
    if Trim(DtSrcTabelaItens.DataSet.FieldByName('ITEM_DESCRICAO').AsString).IsEmpty then
    begin
      TServiceMessage.ShowWarning('Favor informar a descrição do produto/serviço.');
      dbProdutoNome.SetFocus;
    end
    else
    if (DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger = 0) then
    begin
      TServiceMessage.ShowWarning('Favor selecionar a unidade de medida do produto/serviço.');
      dbUnidade.SetFocus;
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

      if (btnProdutoInserir.Visible and btnProdutoInserir.Enabled) then
        btnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.btnAprovarSolicitacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;
    AbrirTabelaItens;

    if not (FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_FIN) then
      TServiceMessage.ShowInformation('Apenas solicitações finalizadas/encerradas podem sem aprovadas!')
    else
    if TServiceMessage.ShowConfirm('Confirma a aprovação do solicitação selecionada?') then
    begin
      Edit;

      dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicitação aprovada por ' + gUsuarioLogado.Login);

      FieldByName('STATUS').Value            := STATUS_SOLICITACAO_APR;
      FieldByName('APROVACAO_DATA').Value    := GetDateDB;
      FieldByName('APROVACAO_USUARIO').Value := gUsuarioLogado.Login;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Solicitação aprovada realizada com sucesso !' + #13#13 +
        'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusSolicitacao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_SOLICITACAO_APR);
  DtSrcTabelaItensStateChange(DtSrcTabelaItens);
end;

function TViewSolicitacaoCompra.Empresa: IControllerEmpresa;
begin
  Result := FControllerEmpresaView as IControllerEmpresa;
end;

procedure TViewSolicitacaoCompra.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (DtSrcTabelaItens.DataSet.State = dsBrowse) and (not DtSrcTabelaItens.DataSet.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled := not (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]);

  if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
    if (dbProduto.Visible and dbProduto.Enabled) then
      dbProduto.SetFocus;
end;

procedure TViewSolicitacaoCompra.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
  begin
    AbrirTabelaItens;
    pgcMaisDados.ActivePage := tbsEventoLOG;
    TbsSolicitacaoCancelado.TabVisible := (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_CAN);
  end;

  HabilitarDesabilitar_Btns;
end;

function TViewSolicitacaoCompra.Produtos: IControllerCustom;
begin
  Result := Controller.Produtos;
end;

procedure TViewSolicitacaoCompra.btnFiltrarClick(Sender: TObject);
var
  aDataInicio,
  aDataFinal : String;
begin
  aDataInicio := FormatDateTime('yyyy-mm-dd', e1Data.Date);
  aDataFinal  := FormatDateTime('yyyy-mm-dd', e2Data.Date);

  WhereAdditional :=
    '(s.empresa in ( ' +
    '  Select      ' +
    '    vw.cnpj   ' +
    '  from VW_EMPRESA vw' +
    '))';

  WhereAdditional := WhereAdditional +
    IfThen(iCentroCusto = 0, EmptyStr,
      ' and (s.centro_custo = ' + IntToStr(iCentroCusto) + ') ') +
      ' and (cast(s.data_emissao as date) between ' + aDataInicio.QuotedString + ' and ' + aDataFinal.QuotedString + ')';

  if (RdgStatusSolicitacao.ItemIndex > 0) then
    WhereAdditional := WhereAdditional + ' and (s.status = ' + IntToStr(RdgStatusSolicitacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TViewSolicitacaoCompra.CarregarDadosProduto(Codigo: Integer);
begin
  if (Codigo = 0) then
  begin
    TServiceMessage.ShowWarning('Favor informar o código do produto');
    Exit;
  end;

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
        DtSrcTabelaItens.DataSet.FieldByName('ITEM_CODIGO').AsString      := FieldByName('cod').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('ITEM_DESCRICAO').AsString   := FieldByName('descri_apresentacao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('UNP_DESCRICAO').AsString    := FieldByName('Unp_descricao').AsString;
        DtSrcTabelaItens.DataSet.FieldByName('ITEM_CADASTRADO').AsInteger := 1;

        if (FieldByName('Codunidade').AsInteger > 0) then
          DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        TServiceMessage.ShowWarning('Código de produto não cadastrado!');
        DtSrcTabelaItens.DataSet.FieldByName('ITEM_CODIGO').Clear;
        if (dbProduto.Visible and dbProduto.Enabled) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.btbtnSalvarClick(Sender: TObject);
var
  sControle : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if DtSrcTabelaItens.DataSet.IsEmpty then
      TServiceMessage.ShowWarning('Favor informar o(s) produto(s) da autorização.')
    else
    if btnProdutoSalvar.Enabled then
    begin
      TServiceMessage.ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da solicitação!');
      btnProdutoSalvar.SetFocus;
    end
    else
    begin

      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CODIGO').AsInteger);

      if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        TServiceMessage.ShowWarning('Número de solicitação já existe!');
        Abort;
      end;

      FieldByName('STATUS').AsInteger            := STATUS_SOLICITACAO_ABR;
      FieldByName('OBJETO_SOLICITACAO').AsString := Trim(AnsiUpperCase(FieldByName('OBJETO_SOLICITACAO').AsString));
      FieldByName('MOVITO').AsString             := Trim(AnsiUpperCase(FieldByName('MOVITO').AsString));
      FieldByName('OBSERVACAO').AsString         := Trim(AnsiUpperCase(FieldByName('OBSERVACAO').AsString));

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

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.ControlEditExit(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (Sender = dbDataEmissao) then
      if ( State in [dsEdit, dsInsert] ) then
        FieldByName('VALIDADE').Value := FieldByName('DATA_EMISSAO').Value + GetPrazoValidadeCotacaoCompra(FieldByName('EMPRESA').AsString);

    if (Sender = dbProduto ) then
      if (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert]) then
        CarregarDadosProduto( StrToIntDef(DtSrcTabelaItens.DataSet.FieldByName('ITEM_CODIGO').AsString, 0) );

    if (Sender = dbQuantidade) then
      if (btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled) then
        btnProdutoSalvar.SetFocus;
  end;
end;

function TViewSolicitacaoCompra.Controller: IControllerSolicitacaoCompra;
begin
  if not Supports(FController, IControllerSolicitacaoCompra, Result) then
    Result := nil;
end;

procedure TViewSolicitacaoCompra.ControllerAfterScroll(DataSet: TDataSet);
begin
  HabilitarDesabilitar_Btns;
end;

procedure TViewSolicitacaoCompra.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TViewSolicitacaoCompra.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Sender = dbgDados) then
  begin
    if Assigned(DtSrcTabela.DataSet) then
    begin
      if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
        // Destacar solicitação em edição
        if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_EDC ) then
          dbgDados.Canvas.Brush.Color := shpOperacaoEditando.Brush.Color
        else
        // Destacar solicitação aberta
        if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_ABR ) then
          dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
        else
        // Destacar solicitação cancelada
        if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_CAN ) then
          dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos já não cadastrados
  if (Sender = dbgProdutos) then
  begin
    if Assigned(DtSrcTabelaItens.DataSet) then
    begin
      if (DtSrcTabelaItens.DataSet.FieldByName('ITEM_CADASTRADO').AsInteger = 0) then
        dbgProdutos.Canvas.Font.Color := lblProdutoNaoCadastrado.Font.Color;
    end;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TViewSolicitacaoCompra.dbProdutoButtonClick(Sender: TObject);
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
  if Trim(DtSrcTabela.DataSet.FieldByName('OBJETO_SOLICITACAO').AsString).IsEmpty then
  begin
    TServiceMessage.ShowWarning('Favor informar uma breve descrição sobre o objeto da solicitação!');
    PgcTextoSolicitacao.ActivePage := TbsSolicitacaoObjeto;
    dbObjeto.SetFocus;
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
      TIPO_SOLICITACAO_COMPRA:
        bSelecionado := SelecionarProdutoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      TIPO_SOLICITACAO_SERVICO:
        bSelecionado := SelecionarServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao);

      TIPO_SOLICITACAO_COMPRA_SERVICO:
        bSelecionado := SelecionarProdutoServicoParaCotacao(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
                          cValorCusto, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva);

      else
        bSelecionado := False;
    end;

    if bSelecionado then
    begin
      DtSrcTabelaItens.DataSet.FieldByName('ITEM_CODIGO').AsString      := sCodigoAlfa;
      DtSrcTabelaItens.DataSet.FieldByName('ITEM_DESCRICAO').AsString   := sDescricao;
      DtSrcTabelaItens.DataSet.FieldByName('ITEM_CADASTRADO').AsInteger := 1;
      DtSrcTabelaItens.DataSet.FieldByName('UNP_DESCRICAO').AsString    := sUnidade;

      if (iUnidade > 0) then
        DtSrcTabelaItens.DataSet.FieldByName('UNIDADE').AsInteger := iUnidade;
    end;

  end;
end;

procedure TViewSolicitacaoCompra.nmImprimirSolicitacaoClick(
  Sender: TObject);
begin
  if DtSrcTabela.DataSet.IsEmpty then
    Exit;

  if not Assigned(FImpressao) then
    FImpressao := TImpressaoSolicitacaoCompra.New;

  FImpressao
    .VisualizarSolicitacao(
      DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString,
      DtSrcTabela.DataSet.FieldByName('ANO').AsInteger,
      DtSrcTabela.DataSet.FieldByName('CODIGO').AsInteger
    );
end;

procedure TViewSolicitacaoCompra.btnCancelarSolicitacaoClick(
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

    if (FieldByName('STATUS').AsInteger = STATUS_SOLICITACAO_CAN) then
    begin
      TServiceMessage.ShowWarning('Lançamento de Solicitação já está cancelado!');
      Abort;
    end;

    AbrirTabelaItens;

    if (not (FieldByName('STATUS').AsInteger in [STATUS_SOLICITACAO_FIN, STATUS_SOLICITACAO_APR])) then
      TServiceMessage.ShowInformation('Apenas registros finalizados e/ou aprovados podem ser cancelados!')
    else
    if CancelarCOT(Self, FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger) then
    begin
      RecarregarRegistro;

      TServiceMessage.ShowInformation('Solicitação cancelada com sucesso.' + #13#13 +
        'Ano/Controle: ' +
        FieldByName('ANO').AsString + '/' +
        FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));
      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.btnFinalizarSolicitacaoClick(
  Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if IsEmpty then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    RecarregarRegistro;
    AbrirTabelaItens;

    if TServiceMessage.ShowConfirm('Confirma a finalização da solicitação?') then
    begin
      Edit;

      dbEventoLOG.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss - ', GetDateTimeDB) + 'Solicitação finalizada por ' + gUsuarioLogado.Login);

      FieldByName('STATUS').AsInteger := STATUS_SOLICITACAO_FIN;

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;

      TServiceMessage.ShowInformation('Solicitação finalizada com sucesso !' + #13#13 +
        'Ano/Número: ' +
        FieldByName('ANO').AsString + '/' +
        FormatFloat('##0000000', FieldByName('CODIGO').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusSolicitacao.ItemIndex := 0;
    end;
  end;
end;

procedure TViewSolicitacaoCompra.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert])  then
    begin
      if (Key = VK_RETURN) then
      begin
        if dbNumero.Focused then
          if (Length(Trim(dbNumero.Text)) > 0) then
            if Controller.GetExisteNumero(FieldByName('ANO').AsInteger, FieldByName('CODIGO').AsInteger, Trim(dbNumero.Text), sControle) then
              TServiceMessage.ShowWarning('Número de solicitação já existe!' + #13 + 'Controle: ' + sControle);

        if dbDataEmissao.Focused then
          if (dbDataEmissao.Date > GetDateTimeDB) then
              TServiceMessage.ShowWarning('A Data de Emissão da solicitação está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');
      end
      else
      if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
      begin
        if dbCentroCustoSolicitacao.Focused then
        begin
          FieldByName('CENTRO_CUSTO').Clear;
          FieldByName('CENTRO_CUSTO_NOME').Clear;
        end;
      end;
    end;
  end;

  // Desistir na inserção de um novo produto/serviço
  if ((Key = VK_ESCAPE) and (pgcGuias.ActivePage = tbsCadastro) and (DtSrcTabelaItens.DataSet.State in [dsEdit, dsInsert])) then
    DtSrcTabelaItens.DataSet.Cancel
  else
    inherited;
end;

function TViewSolicitacaoCompra.GetRotinaAprovarID: String;
begin
  Result := GetRotinaInternaID(btnAprovarSolicitacao);
end;

function TViewSolicitacaoCompra.GetRotinaCancelarSolicitacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarSolicitacao);
end;

function TViewSolicitacaoCompra.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarSolicitacao);
end;

procedure TViewSolicitacaoCompra.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarSolicitacao.Caption, RotinaID);

    if btnAprovarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaAprovarID, btnAprovarSolicitacao.Caption, RotinaID);

    if btnCancelarSolicitacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarSolicitacaoID, btnCancelarSolicitacao.Caption, RotinaID);
  end;
end;

procedure TViewSolicitacaoCompra.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TViewSolicitacaoCompra.SetEventoLOG(sEvento: String);
var
  sMensagem : String;
begin
  sMensagem := FormatDateTime('dd/mm/yyyy hh:mm', Now) + ' - ' + sEvento + ' (por ' + gUsuarioLogado.Login + ').';
  try
    if (not DtSrcTabela.DataSet.IsEmpty) then
    begin
      DtSrcTabela.DataSet.Edit;

      dbEventoLOG.Lines.Add(sMensagem);

      DtSrcTabela.DataSet.Post;
      FController.DAO.ApplyUpdates;
      FController.DAO.CommitUpdates;
      FController.DAO.CommitTransaction;
    end;
  finally
  end;
end;

procedure TViewSolicitacaoCompra.dbCentroCustoSelecionar(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if (Sender = dbCentroCustoSolicitacao) then
    with DtSrcTabela.DataSet do
    begin
      if (State in [dsInsert]) then
        if SelecionarDepartamento(Self, 0, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) then
        begin
          FieldByName('CENTRO_CUSTO').AsInteger     := iCodigo;
          FieldByName('CENTRO_CUSTO_NOME').AsString := sNome;
        end;
    end;

    if (Sender = dbCentroCustoItem) then
      with DtSrcTabelaItens.DataSet do
      begin
        if (State in [dsInsert]) then
          if SelecionarDepartamento(Self, 0, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) then
          begin
            FieldByName('CENTRO_CUSTO').AsInteger     := iCodigo;
            FieldByName('CENTRO_CUSTO_NOME').AsString := sNome;
          end;
      end;
end;

initialization
  FormFunction.RegisterForm('ViewSolicitacaoCompra', TViewSolicitacaoCompra);

end.
