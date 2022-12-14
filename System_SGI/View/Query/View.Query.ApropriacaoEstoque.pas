unit View.Query.ApropriacaoEstoque;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.Menus,
  Vcl.DBGrids,
  Vcl.DBCtrls,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.Mask,

  JvExMask,
  JvToolEdit,

  IdMessage,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,

  Data.DB,

  cxControls,
  cxClasses,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  cxDBData,
  cxCurrencyEdit,
  cxButtons,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxGrid,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxGridCustomView,
  dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog,

  dxSkinsCore,
  dxSkinsDefaultPainters,

  UGrPadrao,
  Model.Constantes,
  Interacao.Tabela,
  Controller.Tabela,
  SGE.Controller.Interfaces;

type        
  TViewQueryApropriacaoEstoque = class(TfrmGrPadrao)
    pnlPesquisa: TPanel;
    GrpBxFiltro: TGroupBox;
    lblPesquisar: TLabel;
    lblTipoFiltro: TLabel;
    edPesquisar: TEdit;
    edTipoFiltro: TComboBox;
    lblCentroCusto: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    svdArquivo: TSaveDialog;
    smtpEmail: TIdSMTP;
    msgEmail: TIdMessage;
    StyleRepository: TcxStyleRepository;
    StyleSelecao: TcxStyle;
    StyleContent: TcxStyle;
    StyleContentEven: TcxStyle;
    dsTotal: TDataSource;
    dsProduto: TDataSource;
    dsFabricante: TDataSource;
    dsGrupo: TDataSource;
    PgcTabelas: TPageControl;
    TbsGrupo: TTabSheet;
    dbgGrupo: TcxGrid;
    dbgGrupoTbl: TcxGridDBBandedTableView;
    dbgGrupoTblGRUPO_COD: TcxGridDBBandedColumn;
    dbgGrupoTblGRUPO_DESC: TcxGridDBBandedColumn;
    dbgGrupoTblCUSTO_TOTAL: TcxGridDBBandedColumn;
    dbgGrupoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn;
    dbgGrupoTblDISPONIVEL: TcxGridDBBandedColumn;
    dbgGrupoTblITENS: TcxGridDBBandedColumn;
    dbgGrupoTblESTOQUE: TcxGridDBBandedColumn;
    dbgGrupoLvl: TcxGridLevel;
    TbsFabricante: TTabSheet;
    dbgFab: TcxGrid;
    dbgFabTbl: TcxGridDBBandedTableView;
    dbgFabTblFABRICANTE_COD: TcxGridDBBandedColumn;
    dbgFabTblFABRICANTE_NOME: TcxGridDBBandedColumn;
    dbgFabTblCUSTO_TOTAL: TcxGridDBBandedColumn;
    dbgFabTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn;
    dbgFabTblDISPONIVEL: TcxGridDBBandedColumn;
    dbgFabTblITENS: TcxGridDBBandedColumn;
    dbgFabTblESTOQUE: TcxGridDBBandedColumn;
    dbgFabLvl: TcxGridLevel;
    TbsProduto: TTabSheet;
    dbgProduto: TcxGrid;
    dbgProdutoTbl: TcxGridDBBandedTableView;
    dbgProdutoTblPRODUTO: TcxGridDBBandedColumn;
    dbgProdutoTblDESCRI_APRESENTACAO: TcxGridDBBandedColumn;
    dbgProdutoTblCUSTO_TOTAL: TcxGridDBBandedColumn;
    dbgProdutoTblCUSTO_DISPONIVEL: TcxGridDBBandedColumn;
    dbgProdutoTblDISPONIVEL: TcxGridDBBandedColumn;
    dbgProdutoTblUND: TcxGridDBBandedColumn;
    dbgProdutoTblGRUPO_DES: TcxGridDBBandedColumn;
    dbgProdutoTblFABRICANTE_NOME: TcxGridDBBandedColumn;
    dbgProdutoTblESTOQUE: TcxGridDBBandedColumn;
    dbgProdutoLvl: TcxGridLevel;
    dbgProdutoTblPERCENTUAL: TcxGridDBBandedColumn;
    dbgFabTblPERCENTUAL: TcxGridDBBandedColumn;
    dbgGrupoTblPERCENTUAL: TcxGridDBBandedColumn;
    chkProdutoComEstoque: TCheckBox;
    edCentroCusto: TJvComboEdit;
    tlbBotoes: TPanel;
    Bevel2: TBevel;
    btBtnExportar: TcxButton;
    btBtnEnviarEmail: TcxButton;
    btBtnAtualizarCusto: TcxButton;
    btbtnSelecionar: TcxButton;
    Bevel4: TBevel;
    BtnPesquisar: TcxButton;
    ppAtualizarCusto: TPopupMenu;
    nmppAtualizacaoAutomatica: TMenuItem;
    nmppAtualizacaoManual: TMenuItem;
    btBtnImprimir: TcxButton;
    ppImprimir: TPopupMenu;
    nmppExtratoMovimentoDiaProduto: TMenuItem;
    Bevel5: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edCentroCustoButtonClick(Sender: TObject);
    procedure edCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure edTipoFiltroChange(Sender: TObject);
    procedure dbgGrupoTblDblClick(Sender: TObject);
    procedure dbgFabTblDblClick(Sender: TObject);
    procedure btbtnSelecionarClick(Sender: TObject);
    procedure btBtnExportarClick(Sender: TObject);
    procedure btBtnEnviarEmailClick(Sender: TObject);
    procedure btBtnAtualizarCustoClick(Sender: TObject);
    procedure dbgProdutoTblCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure nmppAtualizacaoManualClick(Sender: TObject);
    procedure nmppAtualizacaoAutomaticaClick(Sender: TObject);
    procedure nmppExtratoMovimentoDiaProdutoClick(Sender: TObject);
  private
    { Private declarations }
    FTabelaTotal     ,
    FTabelaGrupo     ,
    FTabelaFabricante,
    FTabelaProduto   : ITabela;
    FControllerTotal     ,
    FControllerGrupo     ,
    FControllerFabricante,
    FControllerProduto   : IControllerQuery;
    FControllerReserva   : IControllerProdutoAlmoxarifadoReservado;

    procedure HabilitarGuia(const TipoFiltro : Integer);
    procedure ExecutarPesquisa(const TipoFiltro : Integer);

    function ControllerTotal : IControllerQueryAproriacaoEstoque;
    function ControllerGrupo : IControllerQueryAproriacaoEstoque;
    function ControllerFabricante : IControllerQueryAproriacaoEstoque;
    function ControllerProduto : IControllerQueryAproriacaoEstoque;
    function ControllerReserva   : IControllerProdutoAlmoxarifadoReservado;
    function ExecutarPesquisaGrupo : Boolean;
    function ExecutarPesquisaFabricante : Boolean;
    function ExecutarPesquisaProduto(aGrupo, aFabricante : Integer) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBAPROPRIACAO_ALMOX
  - TBAPROPRIACAO_ALMOX_ITEM
  - TBCENTRO_CUSTO
  - TBPRODUTO
  - TBGRUPOPROD
  - TBPRODUTO_ROTATIVIDADE
  - TBREQUISICAO_ALMOX
  - TBREQUISICAO_ALMOX_ITEM

  Views:
  - VW_TIPO_REQUISICAO_ALMOX

  Procedures:
  - GET_ESTOQUE_ALMOX_DISPONIVEL
*)

var
  ViewQueryApropriacaoEstoque: TViewQueryApropriacaoEstoque;

  function SelecionarProdutoLoteAlmox(const AOnwer : TComponent; const CentroCustoID : Integer; const CentroCustoNome : String;
    var ProdutoID, ProdutoDesc, LoteID, UnidadeDesc : String; var Unidade : Integer;
    var Estoque, Reserva, Disponivel : Currency) : Boolean;

implementation

uses
    System.DateUtils
  , cxGridExportLink
  , UDMRecursos
  , UDMBusiness
  , UConstantesDGE
  , UFuncoes
  , Service.Message
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , SGE.Controller.Query.Factory
  , View.CentroCusto
  , UGeProdutoImpressao;

{$R *.dfm}

const
  TIPO_GRP = 0;
  TIPO_FAB = 1;
  TIPO_PRD = 2;

  WHR_DEFAULT = '1=1';

  XXX_S = '''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' as lote_id--';
  XXX_G = '''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx''--';

function SelecionarProdutoLoteAlmox(const AOnwer : TComponent; const CentroCustoID : Integer; const CentroCustoNome : String;
  var ProdutoID, ProdutoDesc, LoteID, UnidadeDesc : String; var Unidade : Integer;
  var Estoque, Reserva, Disponivel : Currency) : Boolean;
var
  AForm : TViewQueryApropriacaoEstoque;
begin
  AForm := TViewQueryApropriacaoEstoque.Create(AOnwer);
  try
    with AForm do
    begin
      edTipoFiltro.ItemIndex  := TIPO_PRD;
      edCentroCusto.Tag       := CentroCustoID;
      edCentroCusto.Text      := CentroCustoNome;

      lblTipoFiltro.Enabled   := False;
      edTipoFiltro.Enabled    := False;
      lblCentroCusto.Enabled  := False;
      edCentroCusto.Enabled   := False;

      btBtnAtualizarCusto.Visible := False;
      btbtnSelecionar.Visible     := True;
      
      Result := (ShowModal = mrOk);

      if Result then
      begin
        ProdutoID   := dsProduto.DataSet.FieldByName('produto').AsString;
        ProdutoDesc := dsProduto.DataSet.FieldByName('descri_apresentacao').AsString;
        LoteID      := dsProduto.DataSet.FieldByName('lote_id').AsString;
        UnidadeDesc := dsProduto.DataSet.FieldByName('und').AsString;
        Unidade     := dsProduto.DataSet.FieldByName('und_cod').AsInteger;
        Estoque     := dsProduto.DataSet.FieldByName('estoque').AsCurrency;
        Reserva     := dsProduto.DataSet.FieldByName('reserva').AsCurrency;
        Disponivel  := dsProduto.DataSet.FieldByName('disponivel').AsCurrency;
      end;
    end;
  finally
    FreeAndNil(AForm);
  end;
end;

{ TfrmGeApropriacaoEstoquePesquisa }

procedure TViewQueryApropriacaoEstoque.RegistrarRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btBtnExportar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(btBtnExportar), btBtnExportar.Hint, RotinaID);

    if btBtnEnviarEmail.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(btBtnEnviarEmail), btBtnEnviarEmail.Hint, RotinaID);

    if btBtnAtualizarCusto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, GetRotinaInternaID(btBtnAtualizarCusto), btBtnAtualizarCusto.Hint, RotinaID);
  end;
end;

procedure TViewQueryApropriacaoEstoque.NovaPesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key in ['0'..'9', 'a'..'z', 'A'..'Z', ' '] ) then
  begin
    edPesquisar.Text := Trim(Key);
    edPesquisar.SetFocus;
    edPesquisar.SelStart := Length(edPesquisar.Text) + 1;

    Key := #0;
  end
end;

procedure TViewQueryApropriacaoEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  procedure LimparCentroCusto;
  begin
    edCentroCusto.Tag  := 0;
    edCentroCusto.Text := '(Todos)';
  end;

begin
  if ( (Key = VK_RETURN) and (ActiveControl = edPesquisar) ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_F2 ) then
  begin
    if btbtnSelecionar.Visible and btbtnSelecionar.Enabled then
      btbtnSelecionar.Click;
  end
  else
  if ( Key = VK_F5 ) then
    BtnPesquisar.Click
  else
  if ( Key = VK_ESCAPE ) then
  begin
    if ( PgcTabelas.ActivePageIndex <> edTipoFiltro.ItemIndex ) then
      HabilitarGuia( edTipoFiltro.ItemIndex );
  end
  else
  if ( Key = VK_DELETE ) then
  begin
    if edCentroCusto.Focused then
      LimparCentroCusto;
  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    if edCentroCusto.Focused then
      LimparCentroCusto;
  end
  else
    inherited;
end;

procedure TViewQueryApropriacaoEstoque.FormShow(Sender: TObject);
begin
  inherited;

  nmppAtualizacaoAutomaticaClick(Self);
end;

function TViewQueryApropriacaoEstoque.ControllerFabricante: IControllerQueryAproriacaoEstoque;
begin
  if not Assigned(FControllerFabricante) then
    FControllerFabricante := TControllerQueryFactory.Instance.ApropriacaoEstoqueFabricante.DataSource(dsFabricante);

  Result := FControllerFabricante as IControllerQueryAproriacaoEstoque;
end;

function TViewQueryApropriacaoEstoque.ControllerGrupo: IControllerQueryAproriacaoEstoque;
begin
  if not Assigned(FControllerGrupo) then
    FControllerGrupo := TControllerQueryFactory.Instance.ApropriacaoEstoqueGrupo.DataSource(dsGrupo);

  Result := FControllerGrupo as IControllerQueryAproriacaoEstoque;
end;

function TViewQueryApropriacaoEstoque.ControllerProduto: IControllerQueryAproriacaoEstoque;
begin
  if not Assigned(FControllerProduto) then
    FControllerProduto := TControllerQueryFactory.Instance.ApropriacaoEstoqueProduto.DataSource(dsProduto);

  Result := FControllerProduto as IControllerQueryAproriacaoEstoque;
end;

function TViewQueryApropriacaoEstoque.ControllerReserva: IControllerProdutoAlmoxarifadoReservado;
begin
  if not Assigned(FControllerReserva) then
    FControllerReserva := TControllerFactory.New.ProdutoAlmoxarifadoReservado;

  Result := FControllerReserva as IControllerProdutoAlmoxarifadoReservado;
end;

function TViewQueryApropriacaoEstoque.ControllerTotal: IControllerQueryAproriacaoEstoque;
begin
  if not Assigned(FControllerTotal) then
    FControllerTotal := TControllerQueryFactory.Instance.ApropriacaoEstoqueTotal.DataSource(dsTotal);

  Result := FControllerTotal as IControllerQueryAproriacaoEstoque;
end;

procedure TViewQueryApropriacaoEstoque.edCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( SelecionarDepartamento(Self, 0, gUsuarioLogado.Empresa, iCodigo, sNome, iCliente) ) then
  begin
    edCentroCusto.Tag  := iCodigo;
    edCentroCusto.Text := sNome;
  end;
end;

procedure TViewQueryApropriacaoEstoque.edCentroCustoKeyPress(
  Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    edPesquisar.SetFocus
  else
    Key := #0;
end;

procedure TViewQueryApropriacaoEstoque.HabilitarGuia(
  const TipoFiltro: Integer);
var
  I : Integer;
begin
  for I := 0 to PgcTabelas.PageCount - 1 do
    PgcTabelas.Pages[I].TabVisible := False;

  if ( TipoFiltro < PgcTabelas.PageCount ) then
  begin
    PgcTabelas.Pages[TipoFiltro].TabVisible := True;
    PgcTabelas.Pages[TipoFiltro].Caption    := edTipoFiltro.Items.Strings[TipoFiltro];
  end;

  btBtnAtualizarCusto.Enabled := (PgcTabelas.ActivePage = TbsProduto);
end;

procedure TViewQueryApropriacaoEstoque.BtnPesquisarClick(
  Sender: TObject);
begin
  ExecutarPesquisa(edTipoFiltro.ItemIndex);
end;

procedure TViewQueryApropriacaoEstoque.edTipoFiltroChange(
  Sender: TObject);
begin
  HabilitarGuia(edTipoFiltro.ItemIndex);
end;

procedure TViewQueryApropriacaoEstoque.FormCreate(Sender: TObject);
begin
  FControllerTotal := TControllerQueryFactory.Instance.ApropriacaoEstoqueTotal.DataSource(dsTotal);
  FControllerGrupo := TControllerQueryFactory.Instance.ApropriacaoEstoqueGrupo.DataSource(dsGrupo);
  FControllerFabricante := TControllerQueryFactory.Instance.ApropriacaoEstoqueFabricante.DataSource(dsFabricante);
  FControllerProduto := TControllerQueryFactory.Instance.ApropriacaoEstoqueProduto.DataSource(dsProduto);

  inherited;
  RotinaID := ROTINA_CNS_CONSULTA_ESTOQUE_APR_ID;

  edTipoFiltro.ItemIndex := TIPO_PRD;
  HabilitarGuia(edTipoFiltro.ItemIndex);

  btBtnAtualizarCusto.Visible := True;
  btbtnSelecionar.Visible     := False;

  // Configurar visualização de dados das tabelas
  FTabelaTotal := TTabelaController.New.Tabela(dsTotal.DataSet)
    .Display('LOTES', 'Lotes', '#,0', TAlignment.taRightJustify)
    .Display('ESTOQUE', 'Estoque', '#,0.##', TAlignment.taRightJustify)
    .Display('RESERVA', 'Reserva', '#,0.##', TAlignment.taRightJustify)
    .Display('DISPONIVEL', 'Disponível', '#,0.##', TAlignment.taRightJustify)
    .Display('CUSTO_TOTAL', 'Custo Total', '#,0.00', TAlignment.taRightJustify)
    .Display('CUSTO_RESERVA', 'Custo Reserva', '#,0.00', TAlignment.taRightJustify)
    .Display('CUSTO_DISPONIVEL', 'Custo Disponível', '#,0.00', TAlignment.taRightJustify);

  FTabelaGrupo := TTabelaController.New.Tabela(dsGrupo.DataSet)
    .Display('GRUPO_COD', 'Código', TAlignment.taCenter)
    .Display('ITENS', 'Lotes', '#,0', TAlignment.taRightJustify)
    .Display('ESTOQUE', 'Estoque', '#,0.##', TAlignment.taRightJustify)
    .Display('DISPONIVEL', 'Disponível', '#,0.##', TAlignment.taRightJustify)
    .Display('CUSTO_TOTAL', 'Total', '#,0.00', TAlignment.taRightJustify)
    .Display('CUSTO_DISPONIVEL', 'Disponível', '#,0.00', TAlignment.taRightJustify)
    .Display('PERCENTUAL', '%', '#,0.##', TAlignment.taRightJustify);

  FTabelaFabricante := TTabelaController.New.Tabela(dsFabricante.DataSet)
    .Display('FABRICANTE_COD', 'Código', TAlignment.taCenter)
    .Display('ITENS', 'Lotes', '#,0', TAlignment.taRightJustify)
    .Display('ESTOQUE', 'Estoque', '#,0.##', TAlignment.taRightJustify)
    .Display('DISPONIVEL', 'Disponível', '#,0.##', TAlignment.taRightJustify)
    .Display('CUSTO_TOTAL', 'Total', '#,0.00', TAlignment.taRightJustify)
    .Display('CUSTO_DISPONIVEL', 'Disponível', '#,0.00', TAlignment.taRightJustify)
    .Display('PERCENTUAL', '%', '#,0.##', TAlignment.taRightJustify);

  FTabelaProduto := TTabelaController.New.Tabela(dsProduto.DataSet)
    .Display('PRODUTO', 'Código', TAlignment.taCenter)
    .Display('ESTOQUE', 'Estoque', '#,0.##', TAlignment.taRightJustify)
    .Display('DISPONIVEL', 'Disponível', '#,0.##', TAlignment.taRightJustify)
    .Display('CUSTO_TOTAL', 'Total', '#,0.00', TAlignment.taRightJustify)
    .Display('CUSTO_DISPONIVEL', 'Disponível', '#,0.00', TAlignment.taRightJustify)
    .Display('PERCENTUAL', '%', '#,0.##', TAlignment.taRightJustify);
end;

procedure TViewQueryApropriacaoEstoque.ExecutarPesquisa(
  const TipoFiltro: Integer);
begin
  ControllerTotal
    .CentroCusto(edCentroCusto.Tag)
    .Execute(TTipoPesquisa.tpAutomatico, EmptyStr);

  FTabelaTotal.Configurar;

  Case TipoFiltro of
    TIPO_GRP:
      begin
        if ExecutarPesquisaGrupo then
        begin
          if dsGrupo.DataSet.IsEmpty then
            TServiceMessage.ShowWarning('Dados não encontados de acordo com o filtro informado!')
          else
          if (PgcTabelas.ActivePage = TbsGrupo) then
            dbgGrupo.SetFocus;
        end;
      end;

    TIPO_FAB:
      begin
        if ExecutarPesquisaFabricante then
        begin
          if dsFabricante.DataSet.IsEmpty then
            TServiceMessage.ShowWarning('Dados não encontados de acordo com o filtro informado!')
          else
          if (PgcTabelas.ActivePage = TbsFabricante) then
            dbgFab.SetFocus;
        end;
      end;

    TIPO_PRD:
      begin
        if ExecutarPesquisaProduto(-1, -1) then
        begin
          if dsProduto.DataSet.IsEmpty then
            TServiceMessage.ShowWarning('Dados não encontados de acordo com o filtro informado!')
          else
          if (PgcTabelas.ActivePage = TbsProduto) then
            dbgProduto.SetFocus;
        end;

        btbtnSelecionar.Enabled := not dsProduto.DataSet.IsEmpty;
      end;
  end;
end;

function TViewQueryApropriacaoEstoque.ExecutarPesquisaFabricante: Boolean;
begin
  Result := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      Result := not
        ControllerFabricante
          .ApenasProdutoComEstoue(chkProdutoComEstoque.Checked)
          .CentroCusto(edCentroCusto.Tag)
          .Grupo(-1)
          .Fabricante(-1)
          .Execute(TTipoPesquisa.tpAutomatico, edPesquisar.Text)
          .DataSet
            .IsEmpty;

      if Result then
        ControllerFabricante.CalcularPercentuais(dsTotal.DataSet.FieldByName('CUSTO_DISPONIVEL').AsCurrency);

      FTabelaFabricante.Configurar;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

function TViewQueryApropriacaoEstoque.ExecutarPesquisaGrupo: Boolean;
begin
  Result := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      Result := not
        ControllerGrupo
          .ApenasProdutoComEstoue(chkProdutoComEstoque.Checked)
          .CentroCusto(edCentroCusto.Tag)
          .Grupo(-1)
          .Fabricante(-1)
          .Execute(TTipoPesquisa.tpAutomatico, edPesquisar.Text)
          .DataSet
            .IsEmpty;

      if Result then
        ControllerGrupo.CalcularPercentuais(dsTotal.DataSet.FieldByName('CUSTO_DISPONIVEL').AsCurrency);

      FTabelaGrupo.Configurar;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

function TViewQueryApropriacaoEstoque.ExecutarPesquisaProduto(aGrupo, aFabricante : Integer): Boolean;
begin
  Result := False;
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    try
      Result := not
        ControllerProduto
          .ApenasProdutoComEstoue(chkProdutoComEstoque.Checked)
          .CentroCusto(edCentroCusto.Tag)
          .Grupo(aGrupo)
          .Fabricante(aFabricante)
          .Execute(TTipoPesquisa.tpAutomatico, edPesquisar.Text)
          .DataSet
            .IsEmpty;

      if Result then
        ControllerProduto.CalcularPercentuais(dsTotal.DataSet.FieldByName('CUSTO_DISPONIVEL').AsCurrency);

      FTabelaProduto.Configurar;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewQueryApropriacaoEstoque.dbgGrupoTblDblClick(
  Sender: TObject);
begin
  if dsGrupo.DataSet.IsEmpty then
    Exit;

  if ExecutarPesquisaProduto(dsGrupo.DataSet.FieldByName('GRUPO_COD').AsInteger, -1) then
    HabilitarGuia(TIPO_PRD);
end;

procedure TViewQueryApropriacaoEstoque.dbgProdutoTblCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  sLinha : String;
begin
  if (Sender.Controller.FocusedItem = dbgProdutoTblDISPONIVEL) then
  begin
    if dsProduto.DataSet.IsEmpty then
      Exit;

    ControllerReserva.Reservado(dsProduto.DataSet.FieldByName('produto').AsString);

    if ControllerReserva.DataSet.IsEmpty then
      Exit;

    sLinha := 'Requisições com este produto em reserva: ' + #13#13;
    while not ControllerReserva.DataSet.Eof do
    begin
      sLinha := sLinha +
        ControllerReserva.DataSet.FieldByName('numero').AsString + ' - ' +
        FormatDateTime('yy/mm/yyyy', ControllerReserva.DataSet.FieldByName('data_emissao').AsDateTime) + ' -> ' +
        ControllerReserva.DataSet.FieldByName('centro_custo').AsString + #13;

      ControllerReserva.DataSet.Next;
    end;
    ControllerReserva.DataSet.Close;

    TServiceMessage.ShowWarning(sLinha);
  end;
end;

procedure TViewQueryApropriacaoEstoque.dbgFabTblDblClick(
  Sender: TObject);
begin
  if dsFabricante.DataSet.IsEmpty then
    Exit;

  if ExecutarPesquisaProduto(-1, dsFabricante.DataSet.FieldByName('FABRICANTE_COD').AsInteger) then
    HabilitarGuia(TIPO_PRD);
end;

procedure TViewQueryApropriacaoEstoque.btbtnSelecionarClick(
  Sender: TObject);
begin
  if not dsProduto.DataSet.IsEmpty then
    ModalResult := mrOk;
end;

procedure TViewQueryApropriacaoEstoque.btBtnExportarClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      if dsGrupo.DataSet.IsEmpty then
      begin
        TServiceMessage.ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_FAB:
      if ( dsFabricante.DataSet.IsEmpty ) then
      begin
        TServiceMessage.ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( dsProduto.DataSet.IsEmpty ) then
      begin
        TServiceMessage.ShowWarning('Sem dados para exportar!');
        Exit;
      end;
  end;

  if ( svdArquivo.Execute ) then
    Case PgcTabelas.ActivePageIndex of
      TIPO_GRP: ExportGridToExcel(svdArquivo.FileName, dbgGrupo);
      TIPO_FAB: ExportGridToExcel(svdArquivo.FileName, dbgFab);
      TIPO_PRD: ExportGridToExcel(svdArquivo.FileName, dbgProduto);
    end;
end;

procedure TViewQueryApropriacaoEstoque.btBtnEnviarEmailClick(
  Sender: TObject);
var
  sAssunto  ,
  sEmailTo  ,
  sAssinaturaHtml,
  sAssinaturaTxt ,
  sFileNameHtml  ,
  sFileNameXls   : String;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      if dsGrupo.DataSet.IsEmpty then
      begin
        TServiceMessage.ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_FAB:
      if ( dsFabricante.DataSet.IsEmpty ) then
      begin
        TServiceMessage.ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( dsProduto.DataSet.IsEmpty ) then
      begin
        TServiceMessage.ShowWarning('Sem dados para exportar!');
        Exit;
      end;
  end;

  sEmailTo := GetEmailEmpresa(gUsuarioLogado.Empresa);
  if not InputQuery('Enviar e-mail', 'Favor informar e-mail do destinatário:', sEmailTo) then
    Exit;

  if ( Trim(sEmailTo) = EmptyStr ) then
    Exit;

  sFileNameHtml := ExtractFilePath(Application.ExeName) + '_Temp\' + FormatDateTime('yyyymmdd_hhmmss".html"', Now);
  sFileNameXls  := ExtractFilePath(Application.ExeName) + '_Temp\' + FormatDateTime('yyyymmdd_hhmmss".xls"', Now);
  ForceDirectories(ExtractFilePath(sFileNameHtml));

  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      begin
        ExportGridToHTML(sFileNameHtml, dbgGrupo);
        ExportGridToExcel(sFileNameXls, dbgGrupo);
      end;

    TIPO_FAB:
      begin
        ExportGridToHTML(sFileNameHtml, dbgFab);
        ExportGridToExcel(sFileNameXls, dbgFab);
      end;

    TIPO_PRD:
      begin
        ExportGridToHTML(sFileNameHtml, dbgProduto);
        ExportGridToExcel(sFileNameXls, dbgProduto);
      end;
  end;

  Screen.Cursor := crHourGlass;
  try
    try
      sAssunto := FormatDateTime('dd/mm/yyyy', Date) + ' - Apropriação de Estoque (' + edTipoFiltro.Text + ' / ' + edCentroCusto.Text + ')';;
      CarregarConfiguracoesEmpresa(gUsuarioLogado.Empresa, sAssunto, sAssinaturaHtml, sAssinaturaTxt);

      (* Bloco de código descontinuado por sua compilação integral ser possível apenas no Delpi 7
      smtpEmail.Username    := gContaEmail.Conta;
      smtpEmail.Password    := gContaEmail.Senha;
      smtpEmail.Host        := gContaEmail.Servidor_SMTP;
      smtpEmail.Port        := gContaEmail.Porta_SMTP;
      smtpEmail.ReadTimeout := 10000;    // Leitura da Conexão em 10 segundos!

      if gContaEmail.RequerAutenticacao then
        smtpEmail.AuthenticationType := atLogin
      else
        smtpEmail.AuthenticationType := atNone;

      if gContaEmail.ConexaoSeguraSSL then
        smtpEmail.IOHandler := IdSSLIOHandlerSocket
      else
        smtpEmail.IOHandler := nil;

      // Origem
      msgEmail.From.Address := gContaEmail.Conta;
      msgEmail.Body.Text    := gContaEmail.Assinatura_Padrao;
      msgEmail.Subject      := sAssunto;

      // Destino
      msgEmail.Recipients.EMailAddresses := sEmailTo;

      TIdAttachment.Create(msgEmail.MessageParts, sFileNameHtml);
      TIdAttachment.Create(msgEmail.MessageParts, sFileNameXls);

      smtpEmail.Connect;
      smtpEmail.Authenticate;
      smtpEmail.Send(msgEmail);
      *)

      with DMBusiness, ACBrMail do
      begin
        ConfigurarEmail(gUsuarioLogado.Empresa, sEmailTo, sAssunto, gContaEmail.Mensagem_Padrao);
        AddAttachment(sFileNameHtml);
        AddAttachment(sFileNameXls);
        Send;
      end;

      TServiceMessage.ShowInformation('E-mail enviado com sucesso!' + #13 + 'Arquivo(s) anexo(s) : ' + #13 + sFileNameHtml + #13 + sFileNameXls);
    except
      On E : Exception do
        TServiceMessage.ShowError('Erro ao tentar enviar e-mail com o resultado da consulta de apropriação de estoque.' + #13#13 + E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    if smtpEmail.Connected then
      smtpEmail.Disconnect;
  end;
end;

procedure TViewQueryApropriacaoEstoque.nmppAtualizacaoAutomaticaClick(
  Sender: TObject);
begin
  WaitAMoment(WAIT_AMOMENT_Process);
  try
    SetAtulizarCustoEstoque(Date);

    if ( Sender = nmppAtualizacaoAutomatica ) then
    begin
      WaitAMomentFree;
      TServiceMessage.ShowInformation('Atualização ocorrida com sucesso!');
    end;

    if dsProduto.DataSet.Active and dsTotal.DataSet.Active then
    begin
      dsProduto.DataSet.Close;
      dsProduto.DataSet.Open;
      ControllerProduto.CalcularPercentuais(dsTotal.DataSet.FieldByName('CUSTO_DISPONIVEL').AsCurrency);
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewQueryApropriacaoEstoque.nmppAtualizacaoManualClick(
  Sender: TObject);
var
  cValorCusto : Currency;
  sProduto    ,
  sValorCusto : String;
const
  LOG = 'Insert Into TBLOG_TRANSACAO (USUARIO, DATA_HORA, TIPO, DESCRICAO, ESPECIFICACAO) values (%s, current_timestamp, 2, %s, %s)';
begin
  if not GetPermissaoRotinaInterna(btBtnAtualizarCusto, True) then
    Exit;

  if not dsProduto.DataSet.Active then
    Exit;

  if dsProduto.DataSet.IsEmpty then
    Exit;

  sValorCusto := EmptyStr;

  if InputQuery('Atualizar Custo (R$)', 'Favor informar o Custo de Compra do Produto:', sValorCusto) then
  begin
    sValorCusto := Trim( StringReplace(StringReplace(sValorCusto, '.', '', [rfReplaceAll]), 'R$', '', [rfReplaceAll]) );

    if StrToCurrDef(sValorCusto, 0.0) <=0 then
      TServiceMessage.ShowWarning('Valor de Custo informado não é válido!')
    else
    begin
      sProduto    := dsProduto.DataSet.FieldByName('produto').AsString;
      cValorCusto := StrToCurr(sValorCusto);

      // Gravar Log

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format(LOG, [
            QuotedStr(gUsuarioLogado.Login)
          , QuotedStr(DESC_LOG_EVENTO_ATUALIZAR_CUSTO)
          , QuotedStr('Atualização de custo do produto "' +
              sProduto + '" para o valor de R$ ' +
              FormatFloat(',0.00', cValorCusto) + ' correspondente ao custo de compra.' )
        ]));
        ExecSQL;

        CommitTransaction;
      end;

      // Executar atualização de custo

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Execute Procedure SET_ATUALIZAR_CUSTO_PRODUTO (' +
          QuotedStr(sProduto) + ', ' +
          StringReplace(FormatFloat('#########################0.00', cValorCusto), ',', '.', [rfReplaceAll]) + ', ' +
          IntToStr(gSistema.Codigo) + ')');
        ExecSQL;

        CommitTransaction;
      end;

      TServiceMessage.ShowInformation('Custo atualizado com sucesso');

      dsProduto.DataSet.Close;
      dsProduto.DataSet.Open;
      ControllerProduto.CalcularPercentuais(dsTotal.DataSet.FieldByName('CUSTO_DISPONIVEL').AsCurrency);

      dsProduto.DataSet.Locate('PRODUTO', sProduto, []);
    end;
  end;
end;

procedure TViewQueryApropriacaoEstoque.nmppExtratoMovimentoDiaProdutoClick(
  Sender: TObject);
begin
  if ( PgcTabelas.ActivePageIndex <> TIPO_PRD ) then
  begin
    TServiceMessage.ShowInformation('Favor selecionar o produto desejado!');
    edTipoFiltro.ItemIndex := TIPO_PRD;
    edTipoFiltroChange(edTipoFiltro);
    edTipoFiltro.SetFocus;
  end
  else
  if ( not dsProduto.DataSet.Active ) then
  begin
    TServiceMessage.ShowInformation('Favor executar pesquisa para seleção do produto!');
    edPesquisar.SetFocus;
  end
  else
  if ( dsProduto.DataSet.IsEmpty ) then
  begin
    TServiceMessage.ShowInformation('Favor selecionar produto!');
    edPesquisar.SetFocus;
  end
  else
    ExtratoMovimentoProduto(Self, gUsuarioLogado.Empresa, dsProduto.DataSet.FieldByName('produto').AsString);
end;

procedure TViewQueryApropriacaoEstoque.btBtnAtualizarCustoClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;
  ppAtualizarCusto.Popup(btBtnAtualizarCusto.ClientOrigin.X, btBtnAtualizarCusto.ClientOrigin.Y + btBtnAtualizarCusto.Height);
end;

initialization
  FormFunction.RegisterForm('ViewQueryApropriacaoEstoque', TViewQueryApropriacaoEstoque);

end.
