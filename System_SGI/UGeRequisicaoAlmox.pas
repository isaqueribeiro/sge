unit UGeRequisicaoAlmox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, IBTable, RXDBCtrl, Menus, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons;

type
  TfrmGeRequisicaoAlmox = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    RdgStatusRequisicao: TRadioGroup;
    lblRequisicaoAberta: TLabel;
    lblRequisicaoCancelada: TLabel;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBDateEdit;
    lblUsuarioCadastro: TLabel;
    dbUsuarioCadastro: TDBEdit;
    Bevel12: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    pgcMaisDados: TPageControl;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQtde: TLabel;
    lblUnidade: TLabel;
    Bevel7: TBevel;
    dbProduto: TRxDBComboEdit;
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
    qryProdutoAlmox: TIBDataSet;
    lblCustoTotal: TLabel;
    dbCustoTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsObservacoes: TTabSheet;
    lblCustoUn: TLabel;
    dbCustoUn: TDBEdit;
    PnlObservacoes: TPanel;
    lblRequisicaoEmEdicao: TLabel;
    PgcTextoRequisicao: TPageControl;
    TbsRequisicaoMotivo: TTabSheet;
    dbMotivo: TDBMemo;
    TbsRequisicaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblCentroCustoRequisitante: TLabel;
    dbCentroCustoRequisitante: TRxDBComboEdit;
    dbObservacao: TDBMemo;
    lblUsuarioRequisitante: TLabel;
    dbUsuarioRequisitante: TRxDBComboEdit;
    PnlValores: TPanel;
    lblCompetencia: TLabel;
    dbCompetencia: TDBEdit;
    lblValorTotalCusto: TLabel;
    dbValorTotalCusto: TDBEdit;
    tblTipoRequisicao: TIBTable;
    dtsTipoRequisicao: TDataSource;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    LblAjuda: TLabel;
    btnFinalizarLancamento: TcxButton;
    btnEnviarRequisicao: TcxButton;
    btnCancelarRequisicao: TcxButton;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCONTROLE: TIntegerField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaCCUSTO_ORIGEM: TIntegerField;
    IbDtstTabelaCCUSTO_DESTINO: TIntegerField;
    IbDtstTabelaINSERCAO_DATA: TDateTimeField;
    IbDtstTabelaINSERCAO_USUARIO: TIBStringField;
    IbDtstTabelaDATA_EMISSAO: TDateField;
    IbDtstTabelaREQUISITANTE: TIBStringField;
    IbDtstTabelaCOMPETENCIA: TIntegerField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaMOTIVO: TMemoField;
    IbDtstTabelaOBS: TMemoField;
    IbDtstTabelaVALOR_TOTAL: TIBBCDField;
    IbDtstTabelaATENDIMENTO_USUARIO: TIBStringField;
    IbDtstTabelaATENDIMENTO_DATA: TDateTimeField;
    IbDtstTabelaCANCEL_USUARIO: TIBStringField;
    IbDtstTabelaCANCEL_DATA: TDateTimeField;
    IbDtstTabelaCANCEL_MOTIVO: TMemoField;
    IbDtstTabelaITENS: TIntegerField;
    IbDtstTabelaEMPRESA_NOME: TIBStringField;
    IbDtstTabelaCC_ORIGEM_DESC: TIBStringField;
    IbDtstTabelaCC_DESTINO_DESC: TIBStringField;
    lblRequisicaoRecebida: TLabel;
    lblCentroCustoAtendente: TLabel;
    dbCentroCustoAtendente: TRxDBComboEdit;
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
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCONTROLE: TIntegerField;
    cdsTabelaItensITEM: TSmallintField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensQTDE: TIBBCDField;
    cdsTabelaItensQTDE_ATENDIDA: TIBBCDField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensCUSTO: TIBBCDField;
    cdsTabelaItensFRACIONADOR: TIBBCDField;
    cdsTabelaItensTOTAL: TIBBCDField;
    cdsTabelaItensSTATUS: TSmallintField;
    cdsTabelaItensLOTE_ATENDIMENTO: TIBStringField;
    cdsTabelaItensLOTE_REQUISITANTE: TIBStringField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensAPRESENTACAO: TIBStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensUNP_DESCRICAO: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensUNIDADE_SIGLA: TIBStringField;
    cdsTabelaItensESTOQUE: TIBBCDField;
    cdsTabelaItensRESERVA: TIBBCDField;
    cdsTabelaItensDISPONIVEL: TIBBCDField;
    IbDtstTabelaCC_ORIGEM_CODCLIENTE: TIntegerField;
    nmImprimirManifesto: TMenuItem;
    cdsTabelaItensDISPONIVEL_TMP: TCurrencyField;
    btnProdutoAtender: TBitBtn;
    btnProdutoAguarda: TBitBtn;
    btnProdutoCancelar: TBitBtn;
    btnProdutoAtenderTodos: TBitBtn;
    btnConfirmarAtendimento: TcxButton;
    procedure dbCentroCustoSelecionar(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaINSERCAO_DATAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btnEnviarRequisicaoClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure nmImprimirRequisicaoAlmoxClick(Sender: TObject);
    procedure btnCancelarRequisicaoClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btnFinalizarLancamentoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaTIPOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbUsuarioRequisitanteButtonClick(Sender: TObject);
    procedure cdsTabelaItensSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsTabelaItensCalcFields(DataSet: TDataSet);
    procedure btnProdutoAtenderClick(Sender: TObject);
    procedure btnProdutoAtenderTodosClick(Sender: TObject);
    procedure btnProdutoAguardaClick(Sender: TObject);
    procedure btnProdutoCancelarClick(Sender: TObject);
    procedure btnConfirmarAtendimentoClick(Sender: TObject);
    procedure nmImprimirManifestoClick(Sender: TObject);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iCentroCustoOrigem  ,
    iCentroCustoDestino : Integer;
    procedure AbrirTabelaItens(const AnoRequisicao : Smallint; const CodigoRequisicao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Custo : Currency);

    function GetRotinaFinalizarID : String;
    function GetRotinaEnviarID  : String;
    function GetRotinaCancelarRequisicaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaEnviarID  : String read GetRotinaEnviarID;
    property RotinaCancelarRequisicaoID : String read GetRotinaCancelarRequisicaoID;
    
    procedure pgcGuiasOnChange; override;
  end;

var
  frmGeRequisicaoAlmox: TfrmGeRequisicaoAlmox;

  procedure MostrarControleRequisicaoAlmox(const AOwner : TComponent);
  procedure CarregarRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer);

  function AtenderRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMNFe, UGeRequisicaoAlmoxCancelar, UGeCentroCusto,
  UGeApropriacaoEstoquePesquisa, RTLConsts;

{$R *.dfm}

procedure MostrarControleRequisicaoAlmox(const AOwner : TComponent);
var
  frm : TfrmGeRequisicaoAlmox;
  whr : String;
begin
  frm := TfrmGeRequisicaoAlmox.Create(AOwner);
  try
    whr := 'cast(r.data_emissao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusRequisicao.ItemIndex > 0) then
      whr := whr + ' and (r.status = ' + IntToStr(frm.RdgStatusRequisicao.ItemIndex - 1) + ')';

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

procedure CarregarRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer);
var
  AForm : TfrmGeRequisicaoAlmox;
begin
  AForm := TfrmGeRequisicaoAlmox.Create(AOwner);
  try
    with AForm, IbDtstTabela do
    begin
      SelectSQL.Add('where r.ano      = ' + IntToStr(Ano));
      SelectSQL.Add('  and r.controle = ' + IntToStr(Controle));
      Open;

      if not IbDtstTabela.IsEmpty then
      begin
        AbrirTabelaItens(Ano, Controle);

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
  AForm : TfrmGeRequisicaoAlmox;
begin
  AForm := TfrmGeRequisicaoAlmox.Create(AOwner);
  try
    with AForm, IbDtstTabela do
    begin
      SelectSQL.Add('where r.ano      = ' + IntToStr(Ano));
      SelectSQL.Add('  and r.controle = ' + IntToStr(Controle));
      Open;

      if not IbDtstTabela.IsEmpty then
      begin
        AbrirTabelaItens(Ano, Controle);

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

procedure TfrmGeRequisicaoAlmox.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_REQUISICAO_ALMOX_' + FormatFloat('0000', YearOf(GetDateDB));
  IbDtstTabela.GeneratorField.Generator := sGeneratorName;
  IbDtstTabela.GeneratorField.Field     := 'controle';

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := GetDateDB - 30;
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  iCentroCustoOrigem := 0;
  iCentroCustoDestino := 0;

  tblEmpresa.Open;
  tblTipoRequisicao.Open;

  RotinaID            := ROTINA_MOV_REQUISICAO_ALMOX_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBREQUISICAO_ALMOX';
  CampoCodigo    := 'r.controle';
  CampoDescricao := 'co.descricao';                      // Descrição do centro de custo de origem (requisitante)
  CampoOrdenacao := 'r.ano, r.controle, co.descricao';

  WhereAdditional :=  'cast(r.data_emissao as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  UpdateGenerator( 'where ano = ' + FormatFloat('0000', YearOf(Date)) );
end;

procedure TfrmGeRequisicaoAlmox.IbDtstTabelaINSERCAO_DATAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeRequisicaoAlmox.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value       := GetEmpresaIDDefault;
  IbDtstTabelaINSERCAO_DATA.Value := GetDateTimeDB;
  IbDtstTabelaDATA_EMISSAO.Value  := GetDateDB;
  IbDtstTabelaREQUISITANTE.Value  := gUsuarioLogado.Login;
  IbDtstTabelaSTATUS.AsInteger    := STATUS_REQUISICAO_ALMOX_EDC;
  IbDtstTabelaINSERCAO_DATA.Value    := GetDateTimeDB;
  IbDtstTabelaINSERCAO_USUARIO.Value := GetUserApp;

  IbDtstTabelaVALOR_TOTAL.AsCurrency := 0.0;

  IbDtstTabelaTIPO.Clear;
  IbDtstTabelaCCUSTO_ORIGEM.Clear;
  IbDtstTabelaCCUSTO_DESTINO.Clear;
  IbDtstTabelaCOMPETENCIA.Clear;
  IbDtstTabelaMOTIVO.Clear;
  IbDtstTabelaOBS.Clear;
  IbDtstTabelaATENDIMENTO_USUARIO.Clear;
  IbDtstTabelaATENDIMENTO_DATA.Clear;
  IbDtstTabelaCANCEL_USUARIO.Clear;
  IbDtstTabelaCANCEL_DATA.Clear;
  IbDtstTabelaCANCEL_MOTIVO.Clear;
end;

procedure TfrmGeRequisicaoAlmox.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger      := iAno;
    IbDtstTabelaCONTROLE.AsInteger := iNum;
    IbDtstTabelaNUMERO.AsString    := FormatFloat('###0000000', IbDtstTabelaCONTROLE.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeRequisicaoAlmox.AbrirTabelaItens(
  const AnoRequisicao : Smallint; const CodigoRequisicao : Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano      = ' + IntToStr(AnoRequisicao));
    Add('  and i.controle = ' + IntToStr(CodigoRequisicao));
    Add('order by i.ano, i.controle, i.item');

    ParamByName('empresa').Value      := IbDtstTabelaEMPRESA.AsString;
    ParamByName('centro_custo').Value := IbDtstTabelaCCUSTO_DESTINO.AsInteger;
    ParamByName('requisicao_ano').Value := IbDtstTabelaANO.AsInteger;
    ParamByName('requisicao_cod').Value := IbDtstTabelaCONTROLE.AsInteger;
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoAlmox.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btnFinalizarLancamento.Enabled := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_EDC) and (not cdsTabelaItens.IsEmpty);
    btnEnviarRequisicao.Enabled    := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_ABR) and (not cdsTabelaItens.IsEmpty);
    btnCancelarRequisicao.Enabled  := (not (IbDtstTabela.State in [dsEdit, dsInsert])) and (IbDtstTabelaSTATUS.AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]);

    nmImprimirRequisicaoAlmox.Enabled := (IbDtstTabelaSTATUS.AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]);
    nmImprimirManifesto.Enabled       := (IbDtstTabelaSTATUS.AsInteger in [STATUS_REQUISICAO_ALMOX_ATD]);
  end
  else
  begin
    btnFinalizarLancamento.Enabled := False;
    btnEnviarRequisicao.Enabled    := False;
    btnCancelarRequisicao.Enabled  := False;

    nmImprimirRequisicaoAlmox.Enabled := (IbDtstTabelaSTATUS.AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]);
    nmImprimirManifesto.Enabled       := (IbDtstTabelaSTATUS.AsInteger in [STATUS_REQUISICAO_ALMOX_ATD]);
  end;
end;

procedure TfrmGeRequisicaoAlmox.RecarregarRegistro;
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
    sID := IbDtstTabelaNUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCONTROLE.AsInteger;

    if ( not IbDtstTabelaDATA_EMISSAO.IsNull ) then
    begin
      if ( IbDtstTabelaDATA_EMISSAO.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaDATA_EMISSAO.AsDateTime;

      if ( IbDtstTabelaDATA_EMISSAO.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaDATA_EMISSAO.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('NUMERO', sID, []);
  end;
end;

procedure TfrmGeRequisicaoAlmox.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_REQUISICAO_ALMOX_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
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
    if (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_ABR) then
      if not ShowConfirm('A edição da requisição selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
        Abort;

    inherited;

    if ( not OcorreuErro ) then
    begin
      IbDtstTabelaSTATUS.Value := STATUS_REQUISICAO_ALMOX_EDC;
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmox.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_REQUISICAO_ALMOX_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
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
    if ( not OcorreuErro ) then
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
  end;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    if ( cdsTabelaItens.Locate('ITEM', Seq, []) ) then
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  if ( IbDtstTabelaCCUSTO_ORIGEM.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo de origem para a requisição!');
    dbCentroCustoRequisitante.SetFocus;
  end
  else
  if ( IbDtstTabelaCCUSTO_DESTINO.AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo de destino para a requisição!');
    dbCentroCustoAtendente.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    GerarSequencial(Sequencial);

    cdsTabelaItens.Append;
    cdsTabelaItensITEM.Value := Sequencial;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoExcluirClick(Sender: TObject);
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Custo : Currency);
  var
    Item : Integer;
  begin
    Item := cdsTabelaItensITEM.AsInteger;

    Total_Custo := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Custo := Total_Custo + cdsTabelaItensTOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

    cdsTabelaItens.Locate('ITEM', Item, []);
  end;

var
  cTotalCusto : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQTDE.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQtde.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais(cTotalCusto);

      IbDtstTabelaVALOR_TOTAL.AsCurrency := cTotalCusto;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmox.cdsTabelaItensNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  cdsTabelaItensANO.Value      := IbDtstTabelaANO.Value;
  cdsTabelaItensCONTROLE.Value := IbDtstTabelaCONTROLE.Value;
  cdsTabelaItensQTDE.Value     := 1;
  cdsTabelaItensQTDE_ATENDIDA.Value := 0.0;
  cdsTabelaItensSTATUS.Value        := STATUS_ITEM_REQUISICAO_ALMOX_PEN;
  cdsTabelaItensCUSTO.AsCurrency := 0.0;
  cdsTabelaItensTOTAL.AsCurrency := 0.0;
  cdsTabelaItensPRODUTO.Clear;
  cdsTabelaItensDESCRI_APRESENTACAO.Clear;
  cdsTabelaItensUNIDADE.Clear;
  cdsTabelaItensUNP_SIGLA.Clear;
  cdsTabelaItensESTOQUE.Clear;
  cdsTabelaItensRESERVA.Clear;
  cdsTabelaItensDISPONIVEL.Clear;
end;

procedure TfrmGeRequisicaoAlmox.btnEnviarRequisicaoClick(
  Sender: TObject);

  function QuantidadeInvalida : Boolean;
  var
    Return : Boolean;
  begin
    try

      cdsTabelaItens.First;
      cdsTabelaItens.DisableControls;
      while not cdsTabelaItens.Eof do
      begin
        Return := (cdsTabelaItensQTDE.AsCurrency > (cdsTabelaItensQTDE.AsCurrency + cdsTabelaItensDISPONIVEL.AsCurrency));

        if ( Return ) then
          Break;
        cdsTabelaItens.Next;
      end;

    finally
      cdsTabelaItens.EnableControls;
      Result := Return;
    end;
  end;

var
  cTotalCusto : Currency;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger > STATUS_REQUISICAO_ALMOX_ABR) then
  begin
    ShowWarning('Lançamento de Requisição já está em mãos do almoxarifado (Centro de Custo atendente)!');
    Abort;
  end;

  if ( QuantidadeInvalida ) then
  begin
    ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', cdsTabelaItensITEM.AsInteger) + ' está acima da quantidade disponível no estoque.');
    if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      btnProdutoEditar.SetFocus;
  end
  else
  if ShowConfirm('Confirma o encerramento da requisição selecionada?') then
  begin
    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value := STATUS_REQUISICAO_ALMOX_ENV;

    if (Trim(IbDtstTabelaREQUISITANTE.AsString) = EmptyStr) then
      IbDtstTabelaREQUISITANTE.Value := gUsuarioLogado.Login;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Envio de requisição realizado com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusRequisicao.ItemIndex := 0;
  end;
end;

procedure TfrmGeRequisicaoAlmox.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex  := 0;
  PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

  dbCentroCustoRequisitante.Button.Enabled := (IbDtstTabela.State in [dsEdit, dsInsert]);
  dbCentroCustoAtendente.Button.Enabled    := (IbDtstTabela.State in [dsEdit, dsInsert]) and (cdsTabelaItens.RecordCount = 0);

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_REQUISICAO_ALMOX_ENV);
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeRequisicaoAlmox.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  dbCentroCustoAtendente.Button.Enabled := (IbDtstTabela.State in [dsEdit, dsInsert]) and (cdsTabelaItens.RecordCount = 0);

  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (cdsTabelaItens.State in [dsEdit, dsInsert]);

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeRequisicaoAlmox.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

  pgcMaisDados.ActivePage := tbsObservacoes;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoAlmox.btnFiltrarClick(Sender: TObject);
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

  inherited;  
end;

procedure TfrmGeRequisicaoAlmox.CarregarDadosProduto(Codigo: Integer);
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
    with qryProdutoAlmox do
    begin
      Close;
      ParamByName('empresa').AsString       := IbDtstTabelaEMPRESA.AsString;
      ParamByName('centro_custo').AsInteger := IbDtstTabelaCCUSTO_DESTINO.AsInteger;
      ParamByName('produto').AsInteger      := Codigo;
      ParamByName('lote').Clear;
      ParamByName('lote_guid').Clear;
      ParamByName('req_ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('req_cod').AsInteger := IbDtstTabelaCONTROLE.AsInteger;
      Open;

      if not IsEmpty then
      begin
        cdsTabelaItensPRODUTO.AsString             := FieldByName('cod').AsString;
        cdsTabelaItensDESCRI_APRESENTACAO.AsString := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensUNP_SIGLA.AsString           := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensLOTE_ATENDIMENTO.AsString    := FieldByName('lote_id').AsString;
        cdsTabelaItensFRACIONADOR.AsCurrency       := FieldByName('fracionador').AsCurrency;
        cdsTabelaItensESTOQUE.AsCurrency           := FieldByName('estoque').AsCurrency;
        cdsTabelaItensRESERVA.AsCurrency           := FieldByName('reserva').AsCurrency;
        cdsTabelaItensDISPONIVEL.AsCurrency        := FieldByName('disponivel').AsCurrency;

        if ( FieldByName('codunidade_fracionada').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('codunidade_fracionada').AsInteger;
      end
      else
      begin
        ShowWarning('Código de produto não associado ao estoque do centro de custo ' + QuotedStr(dbCentroCustoAtendente.Text) + '!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmox.IbDtstTabelaAfterCancel(
  DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );
end;

procedure TfrmGeRequisicaoAlmox.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da requisição.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da requisição!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    if Trim(IbDtstTabelaNUMERO.AsString) = EmptyStr then
      IbDtstTabelaNUMERO.AsString := FormatFloat('###0000000', IbDtstTabelaCONTROLE.AsInteger) + '/' + Copy(IbDtstTabelaANO.AsString, 3, 2);

    if GetExisteNumeroRequisicaoAlmox(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, IbDtstTabelaNUMERO.AsString, sControle) then
    begin
      ShowWarning('Número de requisiçaõ de materiais já existe!');
      Abort;
    end;

    IbDtstTabelaMOTIVO.AsString  := Trim(AnsiUpperCase(IbDtstTabelaMOTIVO.AsString));
    IbDtstTabelaOBS.AsString     := Trim(AnsiUpperCase(IbDtstTabelaOBS.AsString));

    if (IbDtstTabelaCCUSTO_ORIGEM.AsInteger = IbDtstTabelaCCUSTO_DESTINO.AsInteger) then
    begin
      ShowWarning('O Centro de Custo de destino (atendente) não poderá ser igual ao Centro de Custo de origem (requisitante)!');
      Abort;
    end;

    if ( cdsTabelaItens.RecordCount > 0 ) then
      IbDtstTabelaITENS.AsInteger := cdsTabelaItens.RecordCount
    else
      IbDtstTabelaITENS.Clear;

    inherited;

    if ( not OcorreuErro ) then
    begin

      // Salvar Itens da Base

      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;

      cdsTabelaItens.ApplyUpdates;

      iCodigo := IbDtstTabelaCONTROLE.AsInteger;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(GetCampoCodigoLimpo, iCodigo, []);

      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger );

    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeRequisicaoAlmox.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( (Sender = dbQtde) or (Sender = dbCustoUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      cdsTabelaItensTOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO.AsCurrency;

  if ( Sender = dbCustoTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeRequisicaoAlmox.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoAlmox.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar requisição em edição
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_EDC ) then
      dbgDados.Canvas.Brush.Color := lblRequisicaoEmEdicao.Color
    else
    // Destacar requisição aberta
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_ABR ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoAberta.Font.Color
    else
    // Destacar requisição enviada e/ou recebida
    if ( IbDtstTabelaSTATUS.AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC] ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoRecebida.Font.Color
    else
    // Destacar requisição cancelada
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_CAN ) then
      dbgDados.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos não cancelados e/ou não atendidos
  if ( Sender = dbgProdutos ) then
  begin
    if ( (cdsTabelaItensSTATUS.AsInteger = STATUS_ITEM_REQUISICAO_ALMOX_CAN) or (cdsTabelaItensQTDE_ATENDIDA.AsCurrency = 0) ) then
      dbgProdutos.Canvas.Font.Color := lblRequisicaoCancelada.Font.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeRequisicaoAlmox.dbProdutoButtonClick(Sender: TObject);
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
  if (IbDtstTabelaCCUSTO_ORIGEM.AsInteger = 0) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo requisitante!');
    dbCentroCustoRequisitante.SetFocus;
  end
  else
  if (IbDtstTabelaCCUSTO_DESTINO.AsInteger = 0) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo atendente!');
    dbCentroCustoAtendente.SetFocus;
  end
  else
  if ( dbProduto.Button.Enabled and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
  begin

    cEstoque    := 0.0;
    cReserva    := 0.0;
    cDisponivel := 0.0;

    bSelecionado := SelecionarProdutoLoteAlmox(Self, IbDtstTabelaCCUSTO_DESTINO.AsInteger, dbCentroCustoAtendente.Text,
      sProdutoID, sProdutoDescricao, sLoteID, sUnidade, iUnidade, cEstoque, cReserva, cDisponivel);

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString             := sProdutoID;
      cdsTabelaItensLOTE_ATENDIMENTO.AsString    := sLoteID;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString := sProdutoDescricao;
      cdsTabelaItensUNP_SIGLA.AsString           := sUnidade;
      cdsTabelaItensESTOQUE.AsCurrency           := cEstoque;
      cdsTabelaItensRESERVA.AsCurrency           := cReserva;
      cdsTabelaItensDISPONIVEL.AsCurrency        := cDisponivel;

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNIDADE.AsInteger := iUnidade;
    end;

  end;
end;

procedure TfrmGeRequisicaoAlmox.nmImprimirRequisicaoAlmoxClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(GetEmpresaIDDefault, GetEmailEmpresa(IbDtstTabelaEMPRESA.AsString), 'Requisição de Materiais', EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaCC_ORIGEM_CODCLIENTE.AsInteger;
      Open;
    end;

    with qryRequisicaoAlmox do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCONTROLE.AsInteger;
      ParamByName('todos_itens').AsInteger := 1;
      Open;
    end;

    frrRequisicaoAlmox.ShowReport;
  end;
end;

procedure TfrmGeRequisicaoAlmox.btnCancelarRequisicaoClick(
  Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_CAN) then
  begin
    ShowWarning('Lançamento de Requisição já está cancelado!');
    Abort;
  end;

  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_REQUISICAO_ALMOX_ATD ) then
    ShowInformation('Apenas registros atendidos/encerrados podem ser cancelados!')
  else
  if ( CancelarRequisicaoAlmox(Self, IbDtstTabelaANO.Value, IbDtstTabelaCONTROLE.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Requisição cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeRequisicaoAlmox.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
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

procedure TfrmGeRequisicaoAlmox.btnFinalizarLancamentoClick(
  Sender: TObject);
var
  cTotalCusto : Currency;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  AbrirTabelaItens(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger);

  pgcGuias.ActivePage := tbsCadastro;

  if (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_ABR) then
  begin
    ShowWarning('Lançamento de Requisição já está finalizado!');
    Abort;
  end;

  if ShowConfirm('Confirma a finalização do lançamento da requisição de materiais?') then
  begin
    ValidarToTais(cTotalCusto);

    IbDtstTabela.Edit;

    IbDtstTabelaSTATUS.Value           := STATUS_REQUISICAO_ALMOX_ABR;
    IbDtstTabelaVALOR_TOTAL.AsCurrency := cTotalCusto;

    if (Trim(IbDtstTabelaREQUISITANTE.AsString) = EmptyStr) then
      IbDtstTabelaREQUISITANTE.Value := gUsuarioLogado.Login;

    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;

    CommitTransaction;

    ShowInformation('Requisição com lançamento finalizado com sucesso !' + #13#13 + 'Ano/Número: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCONTROLE.AsInteger));

    HabilitarDesabilitar_Btns;

    RdgStatusRequisicao.ItemIndex := 0;
  end;
end;

procedure TfrmGeRequisicaoAlmox.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQTDE) or (Field = cdsTabelaItensCUSTO) ) then
      cdsTabelaItensTOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO.AsCurrency;
end;

procedure TfrmGeRequisicaoAlmox.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    if (IbDtstTabela.State in [dsEdit, dsInsert])  then
    begin

      if dbNumero.Focused then
        if ( Length(Trim(dbNumero.Text)) > 0 ) then
          if GetExisteNumeroRequisicaoAlmox(IbDtstTabelaANO.AsInteger, IbDtstTabelaCONTROLE.AsInteger, Trim(dbNumero.Text), sControle) then
            ShowWarning('Número de requisição de materiais já existe!' + #13 + 'Controle: ' + sControle);

      { DONE -oIsaque -cRequsição de Materiais : 13/01/2015 - Verificar a Data da Requisição }

      if dbDataEmissao.Focused then
        if ( dbDataEmissao.Date > GetDateTimeDB ) then
            ShowWarning('A Data de emissão da requisição está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    if ( IbDtstTabela.State in [dsInsert] ) then
      if ( dbCentroCustoRequisitante.Focused ) then
      begin
        IbDtstTabelaCCUSTO_ORIGEM.Clear;
        IbDtstTabelaCC_ORIGEM_DESC.Clear;
        IbDtstTabelaCC_ORIGEM_CODCLIENTE.Clear;
      end
      else
      if ( dbCentroCustoAtendente.Focused ) then
      begin
        IbDtstTabelaCCUSTO_DESTINO.Clear;
        IbDtstTabelaCC_DESTINO_DESC.Clear;
      end
      else
      if ( dbUsuarioRequisitante.Focused ) then
        IbDtstTabelaREQUISITANTE.Clear;

  end;

  inherited;  
end;

procedure TfrmGeRequisicaoAlmox.IbDtstTabelaTIPOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
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

function TfrmGeRequisicaoAlmox.GetRotinaEnviarID: String;
begin
  Result := GetRotinaInternaID(btnEnviarRequisicao);
end;

function TfrmGeRequisicaoAlmox.GetRotinaCancelarRequisicaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarRequisicao);
end;

function TfrmGeRequisicaoAlmox.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarLancamento);
end;

procedure TfrmGeRequisicaoAlmox.RegistrarNovaRotinaSistema;
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

procedure TfrmGeRequisicaoAlmox.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeRequisicaoAlmox.IbDtstTabelaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  TbsRequisicaoCancelado.TabVisible := (IbDtstTabelaSTATUS.AsInteger = STATUS_REQUISICAO_ALMOX_CAN);
end;

procedure TfrmGeRequisicaoAlmox.ValidarToTais(var Total_Custo : Currency);
var
  Item : Integer;
begin
  Item := cdsTabelaItensITEM.AsInteger;

  Total_Custo := 0.0;

  cdsTabelaItens.First;

  try
    cdsTabelaItens.DisableControls;
    while not cdsTabelaItens.Eof do
    begin
      Total_Custo := Total_Custo + cdsTabelaItensTOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

  finally
    cdsTabelaItens.Locate('ITEM', Item, []);
    cdsTabelaItens.EnableControls;
  end;
end;

procedure TfrmGeRequisicaoAlmox.dbUsuarioRequisitanteButtonClick(Sender: TObject);
begin
(*
  if ( dbEntrada.Button.Enabled and (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
    if SelecionarEntrada(Self, iEntradaAno, iEntradaCod, sEntradaEmp) then
    begin
      IbDtstTabelaCOMPRA_ANO.AsInteger := iEntradaAno;
      IbDtstTabelaCOMPRA_NUM.AsInteger := iEntradaCod;
      IbDtstTabelaCOMPRA_EMP.AsString  := sEntradaEmp;
      IbDtstTabelaENTRADA.AsString     := FormatFloat('0000"/"', iEntradaAno) + FormatFloat('0000000', iEntradaCod);

      CarregarProdutosEntrada(iEntradaAno, iEntradaCod, sEntradaEmp);
      cdsTabelaItens.First;

      dbEntrada.SetFocus;
    end;
*)
end;

procedure TfrmGeRequisicaoAlmox.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoAlmox.dbCentroCustoSelecionar(Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsInsert] ) then
    if ( SelecionarDepartamento(Self, 0, IbDtstTabelaEMPRESA.AsString, iCodigo, sNome, iCliente) ) then
    begin
      if (Sender = dbCentroCustoRequisitante) then
      begin
        IbDtstTabelaCCUSTO_ORIGEM.AsInteger := iCodigo;
        IbDtstTabelaCC_ORIGEM_DESC.AsString := sNome;
        IbDtstTabelaCC_ORIGEM_CODCLIENTE.AsInteger := iCliente;
      end  
      else
      if (Sender = dbCentroCustoAtendente) then
      begin
        IbDtstTabelaCCUSTO_DESTINO.AsInteger := iCodigo;
        IbDtstTabelaCC_DESTINO_DESC.AsString := sNome;
      end;
    end;
end;

procedure TfrmGeRequisicaoAlmox.cdsTabelaItensSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_ITEM_REQUISICAO_ALMOX_PEN : Text := 'Pendente';
    STATUS_ITEM_REQUISICAO_ALMOX_AGU : Text := 'Aguardando';
    STATUS_ITEM_REQUISICAO_ALMOX_ATE : Text := 'Atendido';
    STATUS_ITEM_REQUISICAO_ALMOX_ENT : Text := 'Entregue';
    STATUS_ITEM_REQUISICAO_ALMOX_CAN : Text := 'Cancelado';
  end;
end;

procedure TfrmGeRequisicaoAlmox.cdsTabelaItensCalcFields(
  DataSet: TDataSet);
begin
  if ( cdsTabelaItensSTATUS.AsInteger in [STATUS_ITEM_REQUISICAO_ALMOX_PEN, STATUS_ITEM_REQUISICAO_ALMOX_AGU] ) then
    cdsTabelaItensDISPONIVEL_TMP.AsCurrency := (cdsTabelaItensDISPONIVEL.AsCurrency + cdsTabelaItensQTDE.AsCurrency)
  else
    cdsTabelaItensDISPONIVEL_TMP.AsCurrency := cdsTabelaItensDISPONIVEL.AsCurrency;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoAtenderClick(Sender: TObject);
var
  sQuantidade : String;
begin
  dbgProdutos.SetFocus;
  
  if cdsTabelaItens.IsEmpty then
    Exit;

  sQuantidade := cdsTabelaItensQTDE.AsString;

  if InputQuery('Atender', 'Informe a quantidade a ser atendida:', sQuantidade) then
    if StrToCurrDef(sQuantidade, 0) <= 0 then
      ShowWarning('Quantidade informada é inválida para atendimento!')
    else
    begin
      if (StrToCurrDef(sQuantidade, 0) > cdsTabelaItensDISPONIVEL_TMP.AsCurrency) then
      begin
        ShowWarning('Quantidade para atendimento informada é superior a disponível em estoque!');
        Exit;
      end
      else
      if (StrToCurrDef(sQuantidade, 0) > cdsTabelaItensQTDE.AsCurrency) then
      begin
        ShowWarning('Quantidade para atendimento informada é superior a quantidade solicitada!');
        Exit;
      end;


      cdsTabelaItens.Edit;
      cdsTabelaItensQTDE_ATENDIDA.AsCurrency := StrToCurrDef(sQuantidade, 0);
      cdsTabelaItens.Post;

      dbgProdutos.SetFocus;
    end;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoAtenderTodosClick(
  Sender: TObject);
begin
  if cdsTabelaItens.IsEmpty then
    Exit;

  if not ShowConfirmation('Deseja atender todos os ítens da requisição de materiais?') then
    Exit;

  cdsTabelaItens.First;
  while not cdsTabelaItens.Eof do
  begin
    if ( cdsTabelaItensSTATUS.AsInteger in [STATUS_ITEM_REQUISICAO_ALMOX_PEN, STATUS_ITEM_REQUISICAO_ALMOX_AGU] ) then
    begin
      cdsTabelaItens.Edit;

      if (cdsTabelaItensDISPONIVEL_TMP.AsCurrency <= 0) then
        cdsTabelaItensSTATUS.AsInteger := STATUS_ITEM_REQUISICAO_ALMOX_AGU
      else
      if (cdsTabelaItensQTDE.AsCurrency > cdsTabelaItensDISPONIVEL_TMP.AsCurrency) then
        cdsTabelaItensQTDE_ATENDIDA.AsCurrency := cdsTabelaItensDISPONIVEL_TMP.AsCurrency
      else
        cdsTabelaItensQTDE_ATENDIDA.AsCurrency := cdsTabelaItensQTDE.AsCurrency;

      cdsTabelaItens.Post;
    end;

    cdsTabelaItens.Next;
  end;

  dbgProdutos.SetFocus;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoAguardaClick(Sender: TObject);
begin
  if cdsTabelaItens.IsEmpty then
    Exit;

  if not ShowConfirmation('Deseja colocar o item selecionado como "Aguardando"?') then
    Exit;

  cdsTabelaItens.Edit;
  cdsTabelaItensQTDE_ATENDIDA.AsCurrency := 0;
  cdsTabelaItensSTATUS.AsInteger         := STATUS_ITEM_REQUISICAO_ALMOX_AGU;
  cdsTabelaItens.Post;

  dbgProdutos.SetFocus;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoCancelarClick(Sender: TObject);
begin
  if cdsTabelaItens.IsEmpty then
    Exit;

  if not ShowConfirmation('Deseja cancelar o atendimento do item selecionado?') then
    Exit;

  cdsTabelaItens.Edit;
  cdsTabelaItensQTDE_ATENDIDA.AsCurrency := 0;
  cdsTabelaItensSTATUS.AsInteger         := STATUS_ITEM_REQUISICAO_ALMOX_CAN;
  cdsTabelaItens.Post;

  dbgProdutos.SetFocus;
end;

procedure TfrmGeRequisicaoAlmox.btnConfirmarAtendimentoClick(
  Sender: TObject);
var
  bAtendido : Boolean;
begin
  if not ShowConfirmation('Confirma o atendimento da requisição de materiais selecionada?') then
    Exit;

  // Buscar iten não atendidos e sinalizar os atendidos

  bAtendido := False;

  cdsTabelaItens.DisableControls;
  cdsTabelaItens.First;

  while not cdsTabelaItens.Eof do
  begin
    if (cdsTabelaItensQTDE_ATENDIDA.AsCurrency > 0) then
    begin
      cdsTabelaItens.Edit;
      cdsTabelaItensSTATUS.AsInteger := STATUS_ITEM_REQUISICAO_ALMOX_ATE;
      cdsTabelaItens.Post;

      if not bAtendido then
        bAtendido := True;
    end;

    cdsTabelaItens.Next;
  end;

  cdsTabelaItens.EnableControls;
  cdsTabelaItens.First;

  if not bAtendido then
  begin
    ShowWarning('Nenhum item fora atendido nesta requisição de materiais.' + #13 + 'Favor verificar!');
    dbgProdutos.SetFocus;
    Exit;
  end;

  // Posta na base os atendimentos

  cdsTabelaItens.ApplyUpdates;

  IbDtstTabela.Edit;
  IbDtstTabelaSTATUS.AsInteger          := STATUS_REQUISICAO_ALMOX_ATD;
  IbDtstTabelaATENDIMENTO_USUARIO.Value := gUsuarioLogado.Login;
  IbDtstTabelaATENDIMENTO_DATA.Value    := GetDateTimeDB;
  IbDtstTabela.Post;
  IbDtstTabela.ApplyUpdates;

  CommitTransaction;

  ExecuteScriptSQL('Execute Procedure SET_REQUISICAO_ALMOX_CUSTO(' +
    IbDtstTabelaANO.AsString + ', ' + IbDtstTabelaCONTROLE.AsString + ', ' + QuotedStr(IbDtstTabelaEMPRESA.AsString) + ')');

  ModalResult := mrOk;
end;

procedure TfrmGeRequisicaoAlmox.nmImprimirManifestoClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if (IbDtstTabelaSTATUS.AsInteger <> STATUS_REQUISICAO_ALMOX_ATD) then
  begin
    ShowWarning('Apenas requisição de materiais já atendidas possuem impressão de Manifesto!');
    Abort;
  end;

  with DMNFe do
  begin

    try
      ConfigurarEmail(GetEmpresaIDDefault, GetEmailEmpresa(IbDtstTabelaEMPRESA.AsString), 'Requisição de Materiais', EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IbDtstTabelaEMPRESA.AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := IbDtstTabelaCC_ORIGEM_CODCLIENTE.AsInteger;
      Open;
    end;

    with qryRequisicaoAlmox do
    begin
      Close;
      ParamByName('ano').AsInteger := IbDtstTabelaANO.AsInteger;
      ParamByName('cod').AsInteger := IbDtstTabelaCONTROLE.AsInteger;
      ParamByName('todos_itens').AsInteger := 0;
      Open;
    end;

    frrManifestoAlmox.ShowReport;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoAlmox', TfrmGeRequisicaoAlmox);

end.
