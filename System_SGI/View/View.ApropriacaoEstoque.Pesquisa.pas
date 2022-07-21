unit View.ApropriacaoEstoque.Pesquisa;

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
  SGE.Controller.Interfaces,

  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Stan.Intf;

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
    DspTotal: TDataSetProvider;
    DspProduto: TDataSetProvider;
    DspFabricante: TDataSetProvider;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    CdsFabricante: TClientDataSet;
    CdsProduto: TClientDataSet;
    CdsTotal: TClientDataSet;
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
    QryGrupo: TFDQuery;
    QryFabricante: TFDQuery;
    QryProduto: TFDQuery;
    QryTotal: TFDQuery;
    qryQtdeReservada: TFDQuery;
    QryProdutoPRODUTO: TStringField;
    QryProdutoDESCRI: TStringField;
    QryProdutoAPRESENTACAO: TStringField;
    QryProdutoDESCRI_APRESENTACAO: TStringField;
    QryProdutoNOME_AMIGO: TStringField;
    QryProdutoGRUPO_COD: TSmallintField;
    QryProdutoGRUPO_DES: TStringField;
    QryProdutoFABRICANTE_COD: TIntegerField;
    QryProdutoFABRICANTE_NOME: TStringField;
    QryProdutoUND_COD: TSmallintField;
    QryProdutoUND_DESC: TStringField;
    QryProdutoUND_SIGLA: TStringField;
    QryProdutoUND: TStringField;
    QryProdutoDATA_ULTIMA_COMPRA: TDateField;
    QryProdutoDATA_ULTIMA_VENDA: TDateField;
    QryProdutoLOTE_ID: TStringField;
    QryGrupoGRUPO_COD: TSmallintField;
    QryGrupoGRUPO_DES: TStringField;
    QryGrupoITENS: TIntegerField;
    QryFabricanteFABRICANTE_COD: TIntegerField;
    QryFabricanteFABRICANTE_NOME: TStringField;
    QryFabricanteITENS: TIntegerField;
    QryFabricanteDATA_ULTIMA_COMPRA: TDateField;
    QryFabricanteDATA_ULTIMA_VENDA: TDateField;
    QryGrupoCOMPRA_QTDE_01: TBCDField;
    QryGrupoCOMPRA_VALOR_01: TBCDField;
    QryGrupoVENDA_QTDE_01: TBCDField;
    QryGrupoVENDA_VALOR_01: TBCDField;
    QryGrupoDATA_ULTIMA_COMPRA: TDateField;
    QryGrupoDATA_ULTIMA_VENDA: TDateField;
    QryGrupoESTOQUE: TFMTBCDField;
    QryGrupoRESERVA: TFMTBCDField;
    QryGrupoDISPONIVEL: TFMTBCDField;
    QryGrupoCUSTO_TOTAL: TFMTBCDField;
    QryGrupoCUSTO_RESERVA: TFMTBCDField;
    QryGrupoCUSTO_DISPONIVEL: TFMTBCDField;
    QryGrupoPERCENTUAL: TBCDField;
    QryFabricanteCOMPRA_QTDE_01: TBCDField;
    QryFabricanteCOMPRA_VALOR_01: TBCDField;
    QryFabricanteVENDA_QTDE_01: TBCDField;
    QryFabricanteVENDA_VALOR_01: TBCDField;
    QryFabricanteESTOQUE: TFMTBCDField;
    QryFabricanteRESERVA: TFMTBCDField;
    QryFabricanteDISPONIVEL: TFMTBCDField;
    QryFabricanteCUSTO_TOTAL: TFMTBCDField;
    QryFabricanteCUSTO_RESERVA: TFMTBCDField;
    QryFabricanteCUSTO_DISPONIVEL: TFMTBCDField;
    QryFabricantePERCENTUAL: TBCDField;
    QryProdutoCOMPRA_QTDE_01: TBCDField;
    QryProdutoCOMPRA_VALOR_01: TBCDField;
    QryProdutoVENDA_QTDE_01: TBCDField;
    QryProdutoVENDA_VALOR_01: TBCDField;
    QryProdutoFRACIONADOR: TFMTBCDField;
    QryProdutoESTOQUE: TFMTBCDField;
    QryProdutoRESERVA: TFMTBCDField;
    QryProdutoDISPONIVEL: TFMTBCDField;
    QryProdutoCUSTO_TOTAL: TFMTBCDField;
    QryProdutoCUSTO_RESERVA: TFMTBCDField;
    QryProdutoCUSTO_DISPONIVEL: TFMTBCDField;
    QryProdutoPERCENTUAL: TBCDField;
    procedure NovaPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCentroCustoButtonClick(Sender: TObject);
    procedure edCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure edTipoFiltroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
    procedure nmppExtratoMovimentoDiaProdutoClick(Sender: TObject);
  private
    { Private declarations }
    FTabelaGrupo : ITabela;
    FGrupo : IControllerQuery;

    FSQLTotal   ,
    FSQLGrupo   ,
    FSQLFabricante,
    FSQLProduto : TStringList;
    procedure HabilitarGuia(const TipoFiltro : Integer);
    procedure ExecutarPesquisa(const TipoFiltro : Integer);
    procedure CalcularPercentuais( cdsTabela : TClientDataSet );

    function Grupo : IControllerQueryAproriacaoEstoque;
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
        ProdutoID   := CdsProduto.FieldByName('produto').AsString;
        ProdutoDesc := CdsProduto.FieldByName('descri_apresentacao').AsString;
        LoteID      := CdsProduto.FieldByName('lote_id').AsString;
        UnidadeDesc := CdsProduto.FieldByName('und').AsString;
        Unidade     := CdsProduto.FieldByName('und_cod').AsInteger;
        Estoque     := CdsProduto.FieldByName('estoque').AsCurrency;
        Reserva     := CdsProduto.FieldByName('reserva').AsCurrency;
        Disponivel  := CdsProduto.FieldByName('disponivel').AsCurrency;
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

function TViewQueryApropriacaoEstoque.Grupo: IControllerQueryAproriacaoEstoque;
begin
  if not Assigned(FGrupo) then
    FGrupo := TControllerQueryFactory.Instance.ApropriacaoEstoqueGrupo.DataSource(dsGrupo);

  Result := FGrupo as IControllerQueryAproriacaoEstoque;
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
  FGrupo := TControllerQueryFactory.Instance.ApropriacaoEstoqueGrupo.DataSource(dsGrupo);

  inherited;
  RotinaID := ROTINA_CNS_CONSULTA_ESTOQUE_APR_ID;

  FSQLTotal := TStringList.Create;
  FSQLTotal.AddStrings( QryTotal.SQL );

  FSQLGrupo := TStringList.Create;
  FSQLGrupo.AddStrings( QryGrupo.SQL );

  FSQLFabricante := TStringList.Create;
  FSQLFabricante.AddStrings( QryFabricante.SQL );

  FSQLProduto := TStringList.Create;
  FSQLProduto.AddStrings( QryProduto.SQL );

  edTipoFiltro.ItemIndex := TIPO_PRD;
  HabilitarGuia(edTipoFiltro.ItemIndex);

  btBtnAtualizarCusto.Visible := True;
  btbtnSelecionar.Visible     := False;

  FTabelaGrupo := TTabelaController.New.Tabela(dsGrupo.DataSet);
end;

procedure TViewQueryApropriacaoEstoque.ExecutarPesquisa(
  const TipoFiltro: Integer);
var
  sWhr ,
  sFind: String;
begin
  sWhr  := '(1=1)';
  sFind := AnsiUpperCase(Trim(edPesquisar.Text));
  sFind := StringReplace(sFind, ' EM ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' DA ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' DE ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' DO ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' NA ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' NE ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' NO ', ' ', [rfReplaceAll]);
  sFind := StringReplace(sFind, ' ', '%', [rfReplaceAll]);

  CdsTotal.Close;

  with QryTotal do
  begin
    SQL.Clear;
    SQL.AddStrings( FSQLTotal );

    SQL.Text := StringReplace(SQL.Text, '111', gUsuarioLogado.Empresa, [rfReplaceAll]);
    SQL.Text := StringReplace(SQL.Text, '999', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
  end;

  CdsTotal.Open;

  Case TipoFiltro of
    TIPO_PRD:
      begin
        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( Trim(sFind) <> EmptyStr ) then
            if ( StrToIntDef(Trim(sFind), 0) > 0 ) then
              sWhr := sWhr + ' and (p.cod like ' + QuotedStr('%' + sFind + '%') + ')'
            else
            begin
              sWhr := sWhr + ' and (upper(p.descri) like ' + QuotedStr(UpperCase(Trim(sFind)) + '%') +
                   '    or upper(p.descri) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(sFind))) + '%') +
                   '    or upper(p.metafonema) like ' + QuotedStr(Metafonema(sFind) + '%') +
                   '    or upper(p.nome_amigo) like ' + QuotedStr(UpperCase(Trim(sFind)) + '%') +
                   '    or upper(p.nome_amigo) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(sFind))) + '%') + ')';
            end;

          if chkProdutoComEstoque.Checked then
            sWhr := sWhr + ' and (e.estoque > 0.0)';

          SQL.Text := StringReplace(SQL.Text, '111', gUsuarioLogado.Empresa, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, '999', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);

          if btbtnSelecionar.Visible then
          begin
            SQL.Text := StringReplace(SQL.Text, XXX_S, EmptyStr, [rfReplaceAll]);
            SQL.Text := StringReplace(SQL.Text, XXX_G, EmptyStr, [rfReplaceAll]);
          end;
        end;

        CdsProduto.Open;

        if ( CdsProduto.IsEmpty ) then
          ShowWarning('Dados n�o encontados de acordo com o filtro informado!')
        else
        begin
          CalcularPercentuais( CdsProduto );
          if (PgcTabelas.ActivePage = TbsProduto) then
            dbgProduto.SetFocus;
        end;

        btbtnSelecionar.Enabled := not CdsProduto.IsEmpty;
      end;

    TIPO_GRP:
      begin
        CdsGrupo.Close;
        with QryGrupo do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLGrupo );

          if ( Trim(sFind) <> EmptyStr ) then
            if ( StrToIntDef(Trim(sFind), 0) > 0 ) then
              sWhr := sWhr + ' and (p.codgrupo like ' + QuotedStr('%' + sFind + '%') + ')'
            else
              sWhr := sWhr + ' and ((upper(g.descri) like ' + QuotedStr(sFind + '%') + ') or (g.descri is null))';

          if chkProdutoComEstoque.Checked then
            sWhr := sWhr + ' and (e.estoque > 0.0)';

          SQL.Text := StringReplace(SQL.Text, '111', gUsuarioLogado.Empresa, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, '999', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;

        CdsGrupo.Open;

        if ( CdsGrupo.IsEmpty ) then
          ShowWarning('Dados n�o encontados de acordo com o filtro informado!')
        else
        begin
          CalcularPercentuais( CdsGrupo );
          if (PgcTabelas.ActivePage = TbsGrupo) then
            dbgGrupo.SetFocus;
        end
      end;

    TIPO_FAB:
      begin
        CdsFabricante.Close;
        with QryFabricante do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLFabricante );

          if ( Trim(sFind) <> EmptyStr ) then
            if ( StrToIntDef(Trim(sFind), 0) > 0 ) then
              sWhr := sWhr + ' and (p.codfabricante like ' + QuotedStr('%' + sFind + '%') + ')'
            else
              sWhr := sWhr + ' and ((upper(f.nome) like ' + QuotedStr(sFind + '%') + ') or (f.nome is null))';

          if chkProdutoComEstoque.Checked then
            sWhr := sWhr + ' and (e.estoque > 0.0)';

          SQL.Text := StringReplace(SQL.Text, '111', gUsuarioLogado.Empresa, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, '999', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;

        CdsFabricante.Open;

        if ( CdsFabricante.IsEmpty ) then
          ShowWarning('Dados n�o encontados de acordo com o filtro informado!')
        else
        begin
          CalcularPercentuais( CdsFabricante );
          if (PgcTabelas.ActivePage = TbsFabricante) then
            dbgFab.SetFocus;
        end
      end;
  end;
end;

procedure TViewQueryApropriacaoEstoque.CalcularPercentuais(
  cdsTabela: TClientDataSet);
begin

  with cdsTabela do
  begin

    if ( IsEmpty ) then
      Exit;

    DisableControls;
    First;

    while not Eof do
    begin
      FieldByName('PERCENTUAL').ReadOnly := False;
      Edit;

      if ( CdsTotal.FieldByName('CUSTO_DISPONIVEL').AsCurrency = 0 ) then
        FieldByName('PERCENTUAL').AsCurrency := 0
      else
        FieldByName('PERCENTUAL').AsCurrency := (FieldByName('CUSTO_DISPONIVEL').AsCurrency / CdsTotal.FieldByName('CUSTO_DISPONIVEL').AsCurrency) * 100;

      Post;

      Next;
    end;

    First;
    EnableControls;

  end;

end;

procedure TViewQueryApropriacaoEstoque.dbgGrupoTblDblClick(
  Sender: TObject);
var
  sWhr : String;
begin
  sWhr := '(1=1)';

  Case edTipoFiltro.ItemIndex of
    TIPO_GRP:
      begin
        if ( CdsGrupo.IsEmpty ) then
          Exit;

        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( CdsGrupo.FieldByName('GRUPO_COD').IsNull ) then
            sWhr := sWhr + ' and (p.codgrupo is null)'
          else
            sWhr := sWhr + ' and (p.codgrupo = ' + CdsGrupo.FieldByName('GRUPO_COD').AsString + ')';

          SQL.Text := StringReplace(SQL.Text, 'e=e', gUsuarioLogado.Empresa, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
        begin
          HabilitarGuia( TIPO_PRD );
          CalcularPercentuais( CdsProduto );
        end;
      end;

  end;
end;

procedure TViewQueryApropriacaoEstoque.dbgProdutoTblCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  sLinha : String;
begin
  if (Sender.Controller.FocusedItem = dbgProdutoTblDISPONIVEL) then
  begin
    if CdsProduto.IsEmpty then
      Exit;

    qryQtdeReservada.Close;
    qryQtdeReservada.ParamByName('produto').AsString := CdsProduto.FieldByName('produto').AsString;
    qryQtdeReservada.Open;

    if qryQtdeReservada.IsEmpty then
      Exit;

    sLinha := 'Requisi��es com este produto em reserva: ' + #13#13;
    while not qryQtdeReservada.Eof do
    begin
      sLinha := sLinha +
        qryQtdeReservada.FieldByName('numero').AsString + ' - ' +
        FormatDateTime('yy/mm/yyyy', qryQtdeReservada.FieldByName('data_emissao').AsDateTime) + ' -> ' +
        qryQtdeReservada.FieldByName('centro_custo').AsString + #13;
      qryQtdeReservada.Next;
    end;
    qryQtdeReservada.Close;

    ShowWarning(sLinha);
  end;
end;

procedure TViewQueryApropriacaoEstoque.dbgFabTblDblClick(
  Sender: TObject);
var
  sWhr : String;
begin
  sWhr := '(1=1)';

  Case edTipoFiltro.ItemIndex of
    TIPO_FAB:
      begin
        if ( CdsFabricante.IsEmpty ) then
          Exit;

        CdsProduto.Close;
        with QryProduto do
        begin
          SQL.Clear;
          SQL.AddStrings( FSQLProduto );

          if ( CdsFabricante.FieldByName('FABRICANTE_COD').IsNull ) then
            sWhr := sWhr + ' and (p.codfabricante is null)'
          else
            sWhr := sWhr + ' and (p.codfabricante = ' + CdsFabricante.FieldByName('FABRICANTE_COD').AsString + ')';

          SQL.Text := StringReplace(SQL.Text, 'e=e', gUsuarioLogado.Empresa, [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, 'c=c', IntToStr(edCentroCusto.Tag), [rfReplaceAll]);
          SQL.Text := StringReplace(SQL.Text, WHR_DEFAULT, sWhr, [rfReplaceAll]);
        end;
        CdsProduto.Open;

        if ( not CdsProduto.IsEmpty ) then
        begin
          HabilitarGuia( TIPO_PRD );
          CalcularPercentuais( CdsProduto );
        end;
      end;

  end;
end;

procedure TViewQueryApropriacaoEstoque.btbtnSelecionarClick(
  Sender: TObject);
begin
  if not CdsProduto.IsEmpty then
    ModalResult := mrOk;
end;

procedure TViewQueryApropriacaoEstoque.btBtnExportarClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Exit;

  Case PgcTabelas.ActivePageIndex of
    TIPO_GRP:
      if ( CdsGrupo.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_FAB:
      if ( CdsFabricante.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( CdsProduto.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
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
      if ( CdsGrupo.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_FAB:
      if ( CdsFabricante.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;

    TIPO_PRD:
      if ( CdsProduto.IsEmpty ) then
      begin
        ShowWarning('Sem dados para exportar!');
        Exit;
      end;
  end;

  sEmailTo := GetEmailEmpresa(gUsuarioLogado.Empresa);
  if not InputQuery('Enviar e-mail', 'Favor informar e-mail do destinat�rio:', sEmailTo) then
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
      sAssunto := FormatDateTime('dd/mm/yyyy', Date) + ' - Apropria��o de Estoque (' + edTipoFiltro.Text + ' / ' + edCentroCusto.Text + ')';;
      CarregarConfiguracoesEmpresa(gUsuarioLogado.Empresa, sAssunto, sAssinaturaHtml, sAssinaturaTxt);

      (* Bloco de c�digo descontinuado por sua compila��o integral ser poss�vel apenas no Delpi 7
      smtpEmail.Username    := gContaEmail.Conta;
      smtpEmail.Password    := gContaEmail.Senha;
      smtpEmail.Host        := gContaEmail.Servidor_SMTP;
      smtpEmail.Port        := gContaEmail.Porta_SMTP;
      smtpEmail.ReadTimeout := 10000;    // Leitura da Conex�o em 10 segundos!

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

      ShowInformation('E-mail enviado com sucesso!' + #13 + 'Arquivo(s) anexo(s) : ' + #13 + sFileNameHtml + #13 + sFileNameXls);
    except
      On E : Exception do
        ShowError('Erro ao tentar enviar e-mail com o resultado da consulta de apropria��o de estoque.' + #13#13 + E.Message);
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
    SetAtulizarCustoEstoque(GetDateDB);

    if ( Sender = nmppAtualizacaoAutomatica ) then
    begin
      WaitAMomentFree;
      ShowInformation('Atualiza��o ocorrida com sucesso!');
    end;

    if CdsProduto.Active then
    begin
      CdsProduto.Close;
      CdsProduto.Open;
      CalcularPercentuais( CdsProduto );
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

  if not CdsProduto.Active then
    Exit;

  if CdsProduto.IsEmpty then
    Exit;

  sValorCusto := EmptyStr;

  if InputQuery('Atualizar Custo (R$)', 'Favor informar o Custo de Compra do Produto:', sValorCusto) then
  begin
    sValorCusto := Trim( StringReplace(StringReplace(sValorCusto, '.', '', [rfReplaceAll]), 'R$', '', [rfReplaceAll]) );

    if StrToCurrDef(sValorCusto, 0.0) <=0 then
      ShowWarning('Valor de Custo informado n�o � v�lido!')
    else
    begin
      sProduto    := CdsProduto.FieldByName('produto').AsString;
      cValorCusto := StrToCurr(sValorCusto);

      // Gravar Log

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add(Format(LOG, [
            QuotedStr(gUsuarioLogado.Login)
          , QuotedStr(DESC_LOG_EVENTO_ATUALIZAR_CUSTO)
          , QuotedStr('Atualiza��o de custo do produto "' +
              sProduto + '" para o valor de R$ ' +
              FormatFloat(',0.00', cValorCusto) + ' correspondente ao custo de compra.' )
        ]));
        ExecSQL;

        CommitTransaction;
      end;

      // Executar atualiza��o de custo

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

      ShowInformation('Custo atualizado com sucesso');

      CdsProduto.Close;
      CdsProduto.Open;
      CalcularPercentuais( CdsProduto );

      CdsProduto.Locate('PRODUTO', sProduto, []);
    end;
  end;
end;

procedure TViewQueryApropriacaoEstoque.nmppExtratoMovimentoDiaProdutoClick(
  Sender: TObject);
begin
  if ( PgcTabelas.ActivePageIndex <> TIPO_PRD ) then
  begin
    ShowInformation('Favor selecionar o produto desejado!');
    edTipoFiltro.ItemIndex := TIPO_PRD;
    edTipoFiltroChange(edTipoFiltro);
    edTipoFiltro.SetFocus;
  end
  else
  if ( not CdsProduto.Active ) then
  begin
    ShowInformation('Favor executar pesquisa para sele��o do produto!');
    edPesquisar.SetFocus;
  end
  else
  if ( CdsProduto.IsEmpty ) then
  begin
    ShowInformation('Favor selecionar produto!');
    edPesquisar.SetFocus;
  end
  else
    ExtratoMovimentoProduto(Self, gUsuarioLogado.Empresa, CdsProduto.FieldByName('produto').AsString);
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
