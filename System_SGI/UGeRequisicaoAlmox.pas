unit UGeRequisicaoAlmox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, 
  IBTable, Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvToolEdit, JvDBControls, JvExMask, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeRequisicaoAlmox = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusRequisicao: TRadioGroup;
    lblRequisicaoAberta: TLabel;
    lblRequisicaoCancelada: TLabel;
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
    lblRequisicaoEmEdicao: TLabel;
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
    lblRequisicaoRecebida: TLabel;
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
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaNUMERO: TStringField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaCCUSTO_ORIGEM: TIntegerField;
    fdQryTabelaCCUSTO_DESTINO: TIntegerField;
    fdQryTabelaINSERCAO_DATA: TSQLTimeStampField;
    fdQryTabelaINSERCAO_USUARIO: TStringField;
    fdQryTabelaDATA_EMISSAO: TDateField;
    fdQryTabelaREQUISITANTE: TStringField;
    fdQryTabelaCOMPETENCIA: TIntegerField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaMOTIVO: TMemoField;
    fdQryTabelaOBS: TMemoField;
    fdQryTabelaATENDIMENTO_USUARIO: TStringField;
    fdQryTabelaATENDIMENTO_DATA: TSQLTimeStampField;
    fdQryTabelaCANCEL_USUARIO: TStringField;
    fdQryTabelaCANCEL_DATA: TSQLTimeStampField;
    fdQryTabelaCANCEL_MOTIVO: TMemoField;
    fdQryTabelaITENS: TIntegerField;
    fdQryTabelaEMPRESA_NOME: TStringField;
    fdQryTabelaCC_ORIGEM_DESC: TStringField;
    fdQryTabelaCC_ORIGEM_CODCLIENTE: TIntegerField;
    fdQryTabelaCC_DESTINO_DESC: TStringField;
    fdQryTabelaUSUARIO_REQUISITANTE: TStringField;
    fdQryTabelaCONTROLE: TFDAutoIncField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCONTROLE: TIntegerField;
    cdsTabelaItensITEM: TSmallintField;
    cdsTabelaItensPRODUTO: TStringField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensSTATUS: TSmallintField;
    cdsTabelaItensLOTE_ATENDIMENTO: TStringField;
    cdsTabelaItensLOTE_REQUISITANTE: TStringField;
    cdsTabelaItensDESCRI: TStringField;
    cdsTabelaItensAPRESENTACAO: TStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TStringField;
    cdsTabelaItensUNP_DESCRICAO: TStringField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    cdsTabelaItensUNIDADE_SIGLA: TStringField;
    cdsTabelaItensDISPONIVEL_TMP: TCurrencyField;
    fdQryEmpresa: TFDQuery;
    fdQryTipoRequisicao: TFDQuery;
    qryProdutoAlmox: TFDQuery;
    cdsTabelaItensQTDE: TFMTBCDField;
    cdsTabelaItensQTDE_ATENDIDA: TFMTBCDField;
    cdsTabelaItensCUSTO: TBCDField;
    cdsTabelaItensFRACIONADOR: TFMTBCDField;
    cdsTabelaItensTOTAL: TFMTBCDField;
    cdsTabelaItensESTOQUE: TFMTBCDField;
    cdsTabelaItensRESERVA: TFMTBCDField;
    cdsTabelaItensDISPONIVEL: TFMTBCDField;
    fdQryTabelaVALOR_TOTAL: TFMTBCDField;
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
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsTabelaItensCalcFields(DataSet: TDataSet);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure cdsTabelaItensSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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
    procedure MontarFiltrosAdcionais;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Custo : Currency);
    procedure ConfigurarCamposTabelas;

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
  frmGeRequisicaoAlmox: TfrmGeRequisicaoAlmox;

  procedure MostrarControleRequisicaoAlmox(const AOwner : TComponent);
  procedure CarregarRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer);

  function AtenderRequisicaoAlmoxMonitor(const AOwner : TComponent; const Ano, Controle : Integer) : Boolean;

implementation

uses
    DateUtils
  , SysConst
  , RTLConsts
  , UConstantesDGE
  , Controller.Tabela
  , UDMBusiness
  , UDMRecursos
  , UDMNFe
  , View.Usuario
  , UGeRequisicaoAlmoxCancelar
  , View.CentroCusto
  , UGeApropriacaoEstoquePesquisa;

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

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      SQL.Add('order by ' + CampoOrdenacao);
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
    with AForm, fdQryTabela do
    begin
      SQL.Add('where r.ano      = ' + IntToStr(Ano));
      SQL.Add('  and r.controle = ' + IntToStr(Controle));
      Open;

      if not DtSrcTabela.DataSet.IsEmpty then
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
    with AForm, fdQryTabela do
    begin
      SQL.Add('where r.ano      = ' + IntToStr(Ano));
      SQL.Add('  and r.controle = ' + IntToStr(Controle));
      Open;

      if not DtSrcTabela.DataSet.IsEmpty then
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
  CriarGenerator(sGeneratorName, 0);

  with fdQryTabela.UpdateOptions do
  begin
    GeneratorName := sGeneratorName;
    AutoIncFields := 'controle';
  end;

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  e1Data.Date      := GetMenorDataEmissao;
  e2Data.Date      := GetDateDB;

  if (e1Data.Date > GetDateDB) then
    e1Data.Date   := GetDateDB;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  iCentroCustoOrigem  := 0;
  iCentroCustoDestino := 0;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipoRequisicao);

  RotinaID            := ROTINA_MOV_REQUISICAO_ALMOX_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBREQUISICAO_ALMOX';
  CampoCodigo    := 'r.controle';
  CampoDescricao := 'co.descricao';                      // Descrição do centro de custo de origem (requisitante)
  CampoOrdenacao := 'r.ano, r.controle, co.descricao';

  WhereAdditional :=  'cast(r.data_emissao as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  ConfigurarCamposTabelas;
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
  with DtSrcTabela.DataSet do
    begin
      FieldByName('ANO').AsInteger      := iAno;
      FieldByName('CONTROLE').AsInteger := iNum;
      FieldByName('NUMERO').AsString    := FormatFloat('###0000000', FieldByName('CONTROLE').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
    end;
end;

procedure TfrmGeRequisicaoAlmox.AbrirTabelaItens(
  const AnoRequisicao : Smallint; const CodigoRequisicao : Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano      = ' + IntToStr(AnoRequisicao));
    Add('  and i.controle = ' + IntToStr(CodigoRequisicao));
    Add('order by i.ano, i.controle, i.item');

    ParamByName('empresa').AsString          := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
    ParamByName('centro_custo').AsInteger    := DtSrcTabela.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger;
    ParamByName('requisicao_ano').AsSmallInt := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
    ParamByName('requisicao_cod').AsInteger  := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoAlmox.HabilitarDesabilitar_Btns;
begin
(*
  IMR - 06/01/2017 :
    Dada a alteração/simplicação nas etapas de edição, finalização e envio das requisições,
    o controle de acesso ao botão "Finalizar" foi alterado para comportar a nova realidade
    em que uma requisição com Status "STATUS_REQUISICAO_ALMOX_ABR" possa ser enviada novamente.
*)
  with DtSrcTabela.DataSet do
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
  //    btnFinalizarLancamento.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_EDC) and (not cdsTabelaItens.IsEmpty);
  //    btnEnviarRequisicao.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_ABR) and (not cdsTabelaItens.IsEmpty);
      btnFinalizarLancamento.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_EDC, STATUS_REQUISICAO_ALMOX_ABR]) and (not cdsTabelaItens.IsEmpty);
      btnEnviarRequisicao.Enabled    := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_ABR) and (not cdsTabelaItens.IsEmpty);
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

procedure TfrmGeRequisicaoAlmox.RecarregarRegistro;
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    Exit;

  fdQryTabela.RefreshRecord();
end;

procedure TfrmGeRequisicaoAlmox.btbtnAlterarClick(Sender: TObject);
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
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
      end;
    end;
end;

procedure TfrmGeRequisicaoAlmox.btbtnExcluirClick(Sender: TObject);
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
      if ( not OcorreuErro ) then
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
    end;
end;

procedure TfrmGeRequisicaoAlmox.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('ITEM', Seq, []) ) do
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

      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;
    end;
  end;
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
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  pgcGuias.ActivePage := tbsCadastro;

  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);

    if (FieldByName('STATUS').AsInteger > STATUS_REQUISICAO_ALMOX_ABR) then
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
    if ShowConfirm('Confirma o encerramento e o envio da requisição selecionada?') then
    begin
      Edit;
      FieldByName('STATUS').Value := STATUS_REQUISICAO_ALMOX_ENV;

      if (Trim(FieldByName('REQUISITANTE').AsString) = EmptyStr) then
        FieldByName('REQUISITANTE').AsString := gUsuarioLogado.Login;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Envio de requisição realizado com sucesso !'
        + #13#13 + 'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusRequisicao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmox.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex  := 0;
  PgcTextoRequisicao.ActivePage := TbsRequisicaoMotivo;

  with DtSrcTabela.DataSet do
  begin
    dbCentroCustoRequisitante.Button.Enabled := (State in [dsEdit, dsInsert]);
    dbCentroCustoAtendente.Button.Enabled    := (State in [dsEdit, dsInsert]) and (cdsTabelaItens.RecordCount = 0);

    DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (FieldByName('STATUS').AsInteger < STATUS_REQUISICAO_ALMOX_ENV);
    DtSrcTabelaItensStateChange( DtSrcTabelaItens );
  end;
end;

procedure TfrmGeRequisicaoAlmox.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
end;

procedure TfrmGeRequisicaoAlmox.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    TbsRequisicaoCancelado.TabVisible := (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_CAN);
end;

procedure TfrmGeRequisicaoAlmox.fdQryTabelaBeforePost(DataSet: TDataSet);
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

procedure TfrmGeRequisicaoAlmox.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeRequisicaoAlmox.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').AsString         := gUsuarioLogado.Empresa;
    FieldByName('INSERCAO_DATA').AsDateTime := GetDateTimeDB;
    FieldByName('DATA_EMISSAO').AsDateTime  := GetDateDB;
    FieldByName('REQUISITANTE').AsString  := gUsuarioLogado.Login;
    FieldByName('STATUS').AsInteger       := STATUS_REQUISICAO_ALMOX_EDC;
    FieldByName('INSERCAO_DATA').AsDateTime      := GetDateTimeDB;
    FieldByName('INSERCAO_USUARIO').AsString     := gUsuarioLogado.Login;
    FieldByName('USUARIO_REQUISITANTE').AsString := gUsuarioLogado.Nome;

    FieldByName('VALOR_TOTAL').AsCurrency := 0.0;

    FieldByName('TIPO').Clear;
    FieldByName('CCUSTO_ORIGEM').Clear;
    FieldByName('CCUSTO_DESTINO').Clear;
    FieldByName('COMPETENCIA').Clear;
    FieldByName('MOTIVO').Clear;
    FieldByName('OBS').Clear;
    FieldByName('ATENDIMENTO_USUARIO').Clear;
    FieldByName('ATENDIMENTO_DATA').Clear;
    FieldByName('CANCEL_USUARIO').Clear;
    FieldByName('CANCEL_DATA').Clear;
    FieldByName('CANCEL_MOTIVO').Clear;
  end;
end;

procedure TfrmGeRequisicaoAlmox.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
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

procedure TfrmGeRequisicaoAlmox.fdQryTabelaTIPOGetText(Sender: TField; var Text: string;
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

procedure TfrmGeRequisicaoAlmox.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  dbCentroCustoAtendente.Button.Enabled := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) and (cdsTabelaItens.RecordCount = 0);

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
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );

  pgcMaisDados.ActivePage := tbsObservacoes;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeRequisicaoAlmox.btnFiltrarClick(Sender: TObject);
begin
  MontarFiltrosAdcionais;
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
      ParamByName('empresa').AsString       := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      ParamByName('centro_custo').AsInteger := DtSrcTabela.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger;
      ParamByName('produto').AsInteger      := Codigo;
      ParamByName('lote').Clear;
      ParamByName('lote_guid').Clear;
      ParamByName('req_ano').AsSmallInt := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('req_cod').AsInteger  := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;
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

      if ( cdsTabelaItens.RecordCount > 0 ) then
        FieldByName('ITENS').AsInteger := cdsTabelaItens.RecordCount
      else
        FieldByName('ITENS').Clear;

      inherited;

      if ( not OcorreuErro ) then
      begin

        // Salvar Itens da Base

        if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
          cdsTabelaItens.Post;

        cdsTabelaItens.ApplyUpdates;
        cdsTabelaItens.CommitUpdates;

        RecarregarRegistro;
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
      end;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeRequisicaoAlmox.ConfigurarCamposTabelas;
begin
  // Configurar tabela de cadastro
  Tabela
    .Display('CONTROLE', 'No. Controle', '###0000000', TAlignment.taCenter)
    .Display('VALOR_TOTAL', 'Custo Total (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  // Configurar tabela de itens
  TTabelaController
    .New
    .Tabela( cdsTabelaItens )
    .Display('ITEM', '#', '###00', TAlignment.taCenter)
    .Display('QTDE', 'Solicitado', ',0.###', TAlignment.taRightJustify)
    .Display('QTDE_ATENDIDA', 'Atendido', ',0.###', TAlignment.taRightJustify)
    .Display('ESTOQUE', 'Estoque', ',0.###', TAlignment.taRightJustify)
    .Display('RESERVA', 'Reservado', ',0.###', TAlignment.taRightJustify)
    .Display('DISPONIVEL', 'Disponível', ',0.###', TAlignment.taRightJustify)
    .Display('CUSTO', 'Custo Un. (R$)', ',0.00#', TAlignment.taRightJustify)
    .Display('TOTAL', 'Custo Total (R$)', ',0.00#', TAlignment.taRightJustify)
    .Configurar( cdsTabelaItens );
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
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar requisição em edição
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_EDC ) then
        dbgDados.Canvas.Brush.Color := lblRequisicaoEmEdicao.Color
      else
      // Destacar requisição aberta
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_ABR ) then
        dbgDados.Canvas.Font.Color := lblRequisicaoAberta.Font.Color
      else
      // Destacar requisição enviada e/ou recebida
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC] ) then
        dbgDados.Canvas.Font.Color := lblRequisicaoRecebida.Font.Color
      else
      // Destacar requisição cancelada
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_CAN ) then
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
  if ( dbProduto.Button.Enabled and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
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
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa, GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString), 'Requisição de Materiais', EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := DtSrcTabela.DataSet.FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger;
      Open;
    end;

    with qryRequisicaoAlmox do
    begin
      Close;
      ParamByName('ano').AsSmallInt := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger  := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;
      ParamByName('todos_itens').AsSmallInt := 1;
      Open;
    end;

    frrRequisicaoAlmox.ShowReport;
  end;
end;

procedure TfrmGeRequisicaoAlmox.btnCancelarRequisicaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;
  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_REQUISICAO_ALMOX_CAN) then
    begin
      ShowWarning('Lançamento de Requisição já está cancelado!');
      Abort;
    end;

    if not (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV, STATUS_REQUISICAO_ALMOX_REC, STATUS_REQUISICAO_ALMOX_ATD]) then
      ShowInformation('Apenas registros enviados, recebidos e/ou atendidos podem ser cancelados!')
    else
    if ( CancelarRequisicaoAlmox(Self, FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger) ) then
    begin
      RecarregarRegistro;

      ShowInformation('Requisição cancelada com sucesso.' +
        #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString +
        '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TfrmGeRequisicaoAlmox.btnFinalizarLancamentoClick(
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
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);

    if (FieldByName('STATUS').AsInteger in [STATUS_REQUISICAO_ALMOX_ENV]) then
    begin
      ShowWarning('Lançamento de Requisição já está finalizado e/ou enviado ao estoque!');
      Abort;
    end;

    if ( QuantidadeInvalida ) then
    begin
      ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', cdsTabelaItensITEM.AsInteger) + ' está acima da quantidade disponível no estoque.');
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

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;


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

    with DtSrcTabela.DataSet do
      if (State in [dsEdit, dsInsert])  then
      begin

        if dbNumero.Focused then
          if ( Length(Trim(dbNumero.Text)) > 0 ) then
            if GetExisteNumeroRequisicaoAlmox(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger, Trim(dbNumero.Text), sControle) then
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

    with DtSrcTabela.DataSet do
    begin
      if ( State in [dsInsert] ) then
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

procedure TfrmGeRequisicaoAlmox.MontarFiltrosAdcionais;
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

function TfrmGeRequisicaoAlmox.GetRotinaEnviarID: String;
begin
  Result := GetRotinaInternaID(btnEnviarRequisicao);
end;

procedure TfrmGeRequisicaoAlmox.GerarManifestoAutomatico;
var
  bAtendido : Boolean;
begin
  try
    cdsTabelaItens.First;
    cdsTabelaItens.DisableControls;

    // Definir a quantidade a ser atendida
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

    bAtendido := False;
    cdsTabelaItens.First;

    // Mudar o status dos materia/produtos para Atendidos
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

    // Postar na base os atendimentos
    if bAtendido then
    begin
      cdsTabelaItens.ApplyUpdates;
      cdsTabelaItens.CommitUpdates;

      with DtSrcTabela.DataSet do
      begin
        Edit;

        dbObservacao.Lines.Add('Auto-manifesto gerado por ' +  QuotedStr(gUsuarioLogado.Login));
        FieldByName('STATUS').AsInteger             := STATUS_REQUISICAO_ALMOX_ATD;
        FieldByName('ATENDIMENTO_USUARIO').AsString := gUsuarioLogado.Login;
        FieldByName('ATENDIMENTO_DATA').AsDateTime  := GetDateTimeDB;

        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;

        ExecuteScriptSQL('Execute Procedure SET_REQUISICAO_ALMOX_CUSTO(' +
          FieldByName('ANO').AsString + ', ' +
          FieldByName('CONTROLE').AsString + ', ' +
          QuotedStr(FieldByName('EMPRESA').AsString) + ')');
      end;
    end;
  finally
    cdsTabelaItens.EnableControls;
  end;
end;

function TfrmGeRequisicaoAlmox.GetMenorDataEmissao: TDateTime;
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

procedure TfrmGeRequisicaoAlmox.cdsTabelaItensCalcFields(DataSet: TDataSet);
begin
  if ( cdsTabelaItensSTATUS.AsInteger in [STATUS_ITEM_REQUISICAO_ALMOX_PEN, STATUS_ITEM_REQUISICAO_ALMOX_AGU] ) then
    cdsTabelaItensDISPONIVEL_TMP.AsCurrency := (cdsTabelaItensDISPONIVEL.AsCurrency + cdsTabelaItensQTDE.AsCurrency)
  else
    cdsTabelaItensDISPONIVEL_TMP.AsCurrency := cdsTabelaItensDISPONIVEL.AsCurrency;
end;

procedure TfrmGeRequisicaoAlmox.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.AsInteger      := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
  cdsTabelaItensCONTROLE.AsInteger := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;
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

procedure TfrmGeRequisicaoAlmox.cdsTabelaItensSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
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

  // Buscar item não atendidos e sinalizar os atendidos

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
  cdsTabelaItens.CommitUpdates;

  with DtSrcTabela.DataSet do
  begin
    Edit;

    FieldByName('STATUS').AsInteger             := STATUS_REQUISICAO_ALMOX_ATD;
    FieldByName('ATENDIMENTO_USUARIO').AsString := gUsuarioLogado.Login;
    FieldByName('ATENDIMENTO_DATA').AsDateTime  := GetDateTimeDB;

    fdQryTabela.Post;
    fdQryTabela.ApplyUpdates;
    fdQryTabela.CommitUpdates;

    CommitTransaction;

    ExecuteScriptSQL('Execute Procedure SET_REQUISICAO_ALMOX_CUSTO(' +
      FieldByName('ANO').AsString + ', ' +
      FieldByName('CONTROLE').AsString + ', ' +
      QuotedStr(FieldByName('EMPRESA').AsString) + ')');
  end;

  ModalResult := mrOk;
end;

procedure TfrmGeRequisicaoAlmox.nmImprimirManifestoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger <> STATUS_REQUISICAO_ALMOX_ATD) then
  begin
    ShowWarning('Apenas requisição de materiais já atendidas possuem impressão de Manifesto!');
    Abort;
  end;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa
        , GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString)
        , 'Requisição de Materiais'
        , EmptyStr);
    except
    end;

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
      Open;
    end;

    with qryDestinatario do
    begin
      Close;
      ParamByName('codigo').AsInteger := DtSrcTabela.DataSet.FieldByName('CC_ORIGEM_CODCLIENTE').AsInteger;
      Open;
    end;

    with qryRequisicaoAlmox do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;
      ParamByName('todos_itens').AsSmallInt := 0;
      Open;
    end;

    frrManifestoAlmox.ShowReport;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoAlmox', TfrmGeRequisicaoAlmox);

end.
