unit UGeApropriacaoEstoque;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, 
  IBTable, Menus, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  JvToolEdit, JvDBControls, JvExMask,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, System.ImageList;

type
  TfrmGeApropriacaoEstoque = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    RdgStatusApropriacao: TRadioGroup;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblDataApropriacao: TLabel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
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
    nmImprimirApropriacao: TMenuItem;
    lblCustoTotal: TLabel;
    dbCustoTotal: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    tbsObservacoes: TTabSheet;
    lblCustoUn: TLabel;
    dbCustoUn: TDBEdit;
    PnlObservacoes: TPanel;
    PgcTextoApropriacao: TPageControl;
    TbsApropriacaoMotivo: TTabSheet;
    dbMotivo: TDBMemo;
    TbsApropriacaoCancelado: TTabSheet;
    dbMovitoCancelamento: TDBMemo;
    lblCentroCusto: TLabel;
    dbObservacao: TDBMemo;
    lblEntrada: TLabel;
    PnlValores: TPanel;
    lblCompetencia: TLabel;
    dbCompetencia: TDBEdit;
    lblValorTotalAprop: TLabel;
    dbValorTotalAprop: TDBEdit;
    dtsTipoApropriacao: TDataSource;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    LblAjuda: TLabel;
    btnFinalizarLancamento: TcxButton;
    btnEncerrarApropriacao: TcxButton;
    btnCancelarApropriacao: TcxButton;
    lblAutorizacao: TLabel;
    dbCentroCusto: TJvDBComboEdit;
    dbEntrada: TJvDBComboEdit;
    dbAutorizacao: TJvDBComboEdit;
    dbProduto: TJvDBComboEdit;
    dbDataApropriacao: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblUnidadeProduto: TLabel;
    dbUnidadeProduto: TDBLookupComboBox;
    dtsUnidadeProduto: TDataSource;
    lblFracionador: TLabel;
    dbFracionador: TDBEdit;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaCONTROLE: TIntegerField;
    fdQryTabelaNUMERO: TStringField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaCENTRO_CUSTO: TIntegerField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaCOMPRA_ANO: TSmallintField;
    fdQryTabelaCOMPRA_NUM: TIntegerField;
    fdQryTabelaCOMPRA_EMP: TStringField;
    fdQryTabelaAUTORIZACAO_ANO: TSmallintField;
    fdQryTabelaAUTORIZACAO_NUM: TIntegerField;
    fdQryTabelaAUTORIZACAO_EMP: TStringField;
    fdQryTabelaINSERCAO_DATA: TSQLTimeStampField;
    fdQryTabelaDATA_APROPRIACAO: TDateField;
    fdQryTabelaCOMPETENCIA: TIntegerField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaSTATUS: TSmallintField;
    fdQryTabelaMOTIVO: TMemoField;
    fdQryTabelaOBS: TMemoField;
    fdQryTabelaCANCEL_USUARIO: TStringField;
    fdQryTabelaCANCEL_DATAHORA: TSQLTimeStampField;
    fdQryTabelaCANCEL_MOTIVO: TMemoField;
    fdQryTabelaEMPRESA_NOME: TStringField;
    fdQryTabelaCC_DESCRICAO: TStringField;
    fdQryTabelaCC_CLIENTE_CODIGO: TIntegerField;
    fdQryTabelaCC_CLIENTE_NOME: TStringField;
    fdQryTabelaCC_CLIENTE_CNPJ: TStringField;
    fdQryTabelaCC_CLIENTE_TIPO: TSmallintField;
    fdQryTabelaENTRADA: TStringField;
    fdQryTabelaAUTORIZACAO: TStringField;
    cdsTabelaItens: TFDQuery;
    updTabelaItens: TFDUpdateSQL;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCONTROLE: TIntegerField;
    cdsTabelaItensITEM: TSmallintField;
    cdsTabelaItensPRODUTO: TStringField;
    cdsTabelaItensQTDE_TIPO_LANCAMENTO: TSmallintField;
    cdsTabelaItensUNIDADE: TSmallintField;
    cdsTabelaItensUNIDADE_FRACAO: TSmallintField;
    cdsTabelaItensDESCRI: TStringField;
    cdsTabelaItensAPRESENTACAO: TStringField;
    cdsTabelaItensDESCRI_APRESENTACAO: TStringField;
    cdsTabelaItensUNP_DESCRICAO: TStringField;
    cdsTabelaItensUNP_SIGLA: TStringField;
    cdsTabelaItensUNIDADE_SIGLA: TStringField;
    cdsTabelaItensMOVIMENTA_ESTOQUE: TSmallintField;
    cdsTabelaItensUNIDADE_FRACIONADA: TStringField;
    spAjusteEstoqueVenda: TFDStoredProc;
    fdQryEmpresa: TFDQuery;
    fdQryTipoApropriacao: TFDQuery;
    fdQryUnidadeProduto: TFDQuery;
    fdQryProduto: TFDQuery;
    fdQryEntradaProduto: TFDQuery;
    fdQryAutorizacaoProduto: TFDQuery;
    fdQryTabelaVALOR_TOTAL: TFMTBCDField;
    cdsTabelaItensQTDE: TFMTBCDField;
    cdsTabelaItensQTDE_FRACIONADA: TFMTBCDField;
    cdsTabelaItensFRACIONADOR: TFMTBCDField;
    cdsTabelaItensCUSTO_UNITARIO: TFMTBCDField;
    cdsTabelaItensCUSTO_TOTAL: TFMTBCDField;
    cdsTabelaItensESTOQUE: TFMTBCDField;
    cdsTabelaItensRESERVA: TFMTBCDField;
    fdQryTabelaITENS: TIntegerField;
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
    procedure btnEncerrarApropriacaoClick(Sender: TObject);
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
    procedure nmImprimirApropriacaoClick(Sender: TObject);
    procedure btnCancelarApropriacaoClick(Sender: TObject);
    procedure btnFinalizarLancamentoClick(Sender: TObject);
    procedure DtSrcTabelaItensDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dbCentroCustoButtonClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbEntradaButtonClick(Sender: TObject);
    procedure dbAutorizacaoButtonClick(Sender: TObject);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsTabelaItensAfterScroll(DataSet: TDataSet);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    iSeq : Integer;
    SQL_Itens : TStringList;
    iCentroCusto : Integer;
    procedure AbrirTabelaItens(const AnoApropriacao : Smallint; const CodigoApropriacao : Integer);
    procedure CarregarDadosProduto( Codigo : Integer );
    procedure CarregarUnidadeProduto( Codigo : String );
    procedure CarregarProdutosEntrada(const iEntradaAno, iEntradaCod : Integer; sEntradaEmp : String);
    procedure CarregarProdutosAutorizacao(const iAutorizacaoAno, iAutorizacaoCod : Integer; sAutorizacaoEmp : String);
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure ValidarToTais(var Total_Custo : Currency);

    function GetRotinaFinalizarID : String;
    function GetRotinaEncerrarID  : String;
    function GetRotinaCancelarApropriacaoID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaFinalizarID : String read GetRotinaFinalizarID;
    property RotinaEncerrarID  : String read GetRotinaEncerrarID;
    property RotinaCancelarApropriacaoID : String read GetRotinaCancelarApropriacaoID;
    procedure pgcGuiasOnChange; override;
  end;

(*
  Tabelas:
  - TBAPROPRIACAO_ALMOX
  - TBAPROPRIACAO_ALMOX_ITEM
  - TBEMPRESA
  - TBCENTRO_CUSTO
  - TBCLIENTE
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBCOMPRAS
  - TBCOMPRASITENS
  - TBAUTORIZA_COMPRA
  - TBAUTORIZA_COMPRAITEM

  Views:
  - VW_EMPRESA
  - VW_TIPO_APROPRIACAO

  Procedures:
  - SET_AJUSTE_ESTOQUE_VENDA

*)

var
  frmGeApropriacaoEstoque: TfrmGeApropriacaoEstoque;

  procedure MostrarControleApropriacao(const AOwner : TComponent);

  function SelecionarApropriacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
    var Ano, Codigo : Integer; var Empresa : String) : Boolean;

implementation

uses
  DateUtils, SysConst, UConstantesDGE, UDMBusiness, UDMRecursos, UDMNFe, View.Produto,
  UGeApropriacaoEstoqueCancelar, View.CentroCusto, View.Entrada, View.AutorizacaoCompra, Controller.Tabela;

{$R *.dfm}

procedure MostrarControleApropriacao(const AOwner : TComponent);
var
  frm : TfrmGeApropriacaoEstoque;
  whr : String;
begin
  frm := TfrmGeApropriacaoEstoque.Create(AOwner);
  try
    whr := 'cast(a.data_apropriacao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusApropriacao.ItemIndex > 0) then
      whr := whr + ' and (a.status = ' + IntToStr(frm.RdgStatusApropriacao.ItemIndex - 1) + ')';

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

function SelecionarApropriacao(const AOwner : TComponent; Fornecedor : Integer; DataInicial : TDateTime;
  var Ano, Codigo : Integer; var Empresa : String) : Boolean;
var
//  frm : TfrmGeApropriacaoEstoque;
  sNome : String;
  I : Integer;
begin (*
  frm := TfrmGeApropriacaoEstoque.Create(AOwner);
  try
    frm.btbtnIncluir.Visible            := False;
    frm.btnFinalizarAutorizacao.Visible := False;
    frm.btnAutorizarCompra.Visible      := False;
    frm.btnCancelarAutorizacao.Visible  := False;

    frm.RdgStatusAutorizacao.ItemIndex := STATUS_APROPRIACAO_ESTOQUE_AUT + 1;

    frm.RdgStatusAutorizacao.Enabled := False;
    //for I := 0 to frm.RdgStatusAutorizacao.Items.Count - 1 do
    //  frm.RdgStatusAutorizacao.Controls[I].Enabled := False;

    frm.iFornecedor := Fornecedor;
    frm.e1Data.Date := DataInicial;
    frm.WhereAdditional := '(a.fornecedor = ' + IntToStr(Fornecedor) + ') and ' +
            'cast(a.data_apropriacao as date) between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    if (frm.RdgStatusAutorizacao.ItemIndex > 0) then
      frm.WhereAdditional := frm.WhereAdditional + ' and (a.status = ' + IntToStr(frm.RdgStatusAutorizacao.ItemIndex - 1) + ')';

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + WhereAdditional);
      SQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, sNome, frm.WhereAdditional);

    if ( Result ) then
    begin
      Ano     := frm.DtSrcTabela.DataSet 'ANO'.AsInteger;
      Codigo  := frm.DtSrcTabela.DataSet 'CODIGO'.AsInteger;
      Empresa := frm.DtSrcTabela.DataSet 'EMPRESA'.AsString;
    end;
  finally
    frm.Destroy;
  end;
       *)
end;

procedure TfrmGeApropriacaoEstoque.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_APROPRIACAO_ALMOX_' + FormatFloat('0000', YearOf(GetDateDB));
  fdQryTabela.UpdateOptions.GeneratorName := sGeneratorName;
  CriarGenerator(fdQryTabela.UpdateOptions.GeneratorName, 0);

  inherited;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SQL );

  e1Data.Date := GetMenorDataApropriacaoAberta(EmptyStr, 0);
  e2Data.Date := GetDateDB;

  if (e1Data.Date >= GetDateDB) then
    e1Data.Date := e2Data.Date - 30;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;
  iCentroCusto     := 0;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipoApropriacao);

  RotinaID            := ROTINA_ENT_APROPRIACAO_ESTOQ_ID;
  DisplayFormatCodigo := '###00000';

  NomeTabela     := 'TBAPROPRIACAO_ALMOX';
  CampoCodigo    := 'a.controle';
  CampoDescricao := 'c.descricao';                      // Descrição do centro de custo
  CampoOrdenacao := 'a.ano, a.controle, c.descricao';

  WhereAdditional :=  'cast(a.data_apropriacao as date) between ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  if (gSistema.Codigo <> SISTEMA_GESTAO_IND) then
    raise Exception.Create('Rotina se aplica apenas ao Sistema de Gestão Industrial (SGI)');

  Tabela
    .Display('CONTROLE', 'Contole', DisplayFormatCodigo, TAlignment.taCenter)
    .Display('ITENS', 'Produto(s)', ',0', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL', 'Valor Total (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  TTabelaController
    .New
    .Tabela( cdsTabelaItens )
    .Display('QTDE', 'Quantidade', ',0.###', TAlignment.taRightJustify)
    .Display('CUSTO_UNITARIO', 'Custo Unitário', ',0.00', TAlignment.taRightJustify)
    .Display('CUSTO_TOTAL',    'Custo Total',    ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsTabelaItens );
end;

procedure TfrmGeApropriacaoEstoque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;

  with DtSrcTabela.DataSet do
    if ( not OcorreuErro ) then
    begin
      FieldByName('NUMERO').AsString    := FormatFloat('###0000000', FieldByName('CONTROLE').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);
      AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
    end;
end;

procedure TfrmGeApropriacaoEstoque.AbrirTabelaItens(
  const AnoApropriacao : Smallint; const CodigoApropriacao : Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.ano      = ' + IntToStr(AnoApropriacao));
    Add('  and i.controle = ' + IntToStr(CodigoApropriacao));
    Add('order by i.ano, i.controle, i.item');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btnFinalizarLancamento.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_EDC) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnEncerrarApropriacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR) and (not DtSrcTabelaItens.DataSet.IsEmpty);
      btnCancelarApropriacao.Enabled := (not (State in [dsEdit, dsInsert])) and (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC);

      nmImprimirApropriacao.Enabled   := (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC);
    end
    else
    begin
      btnFinalizarLancamento.Enabled := False;
      btnEncerrarApropriacao.Enabled := False;
      btnCancelarApropriacao.Enabled := False;

      nmImprimirApropriacao.Enabled  := (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC);
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.RecarregarRegistro;
begin
  with DtSrcTabela.DataSet do
  begin
      if ( not FieldByName('DATA_APROPRIACAO').IsNull ) then
      begin
        if ( FieldByName('DATA_APROPRIACAO').AsDateTime < e1Data.Date ) then
          e1Data.Date := FieldByName('DATA_APROPRIACAO').AsDateTime;

        if ( FieldByName('DATA_APROPRIACAO').AsDateTime > e2Data.Date ) then
          e2Data.Date := FieldByName('DATA_APROPRIACAO').AsDateTime;
      end;

    fdQryTabela.RefreshRecord();
  end;
end;

procedure TfrmGeApropriacaoEstoque.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_APROPRIACAO_ESTOQUE_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_APROPRIACAO_ESTOQUE_ENC : sMsg := 'Esta apropriação não pode ser alterada porque já está encerrada.';
        STATUS_APROPRIACAO_ESTOQUE_CAN : sMsg := 'Esta apropriação não pode ser alterada porque está cancelada.';
      end;

      ShowWarning(sMsg);
      Abort;
    end
    else
    begin
      if (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR) then
        if not ShowConfirm('A edição da apropriação selecionada está finalizada.' + #13 + 'Deseja colocá-la em edição novamente?') then
          Abort;

      inherited;

      if ( not OcorreuErro ) then
      begin
        FieldByName('STATUS').Value := STATUS_APROPRIACAO_ESTOQUE_EDC;
        AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('STATUS').AsInteger > STATUS_APROPRIACAO_ESTOQUE_ABR ) then
    begin
      Case FieldByName('STATUS').AsInteger of
        STATUS_APROPRIACAO_ESTOQUE_ENC : sMsg := 'Esta apropriação não pode ser excluída porque já está encerrada.';
        STATUS_APROPRIACAO_ESTOQUE_CAN : sMsg := 'Esta apropriação não pode ser excluída porque está cancelada.';
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
end;

procedure TfrmGeApropriacaoEstoque.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoInserirClick(Sender: TObject);

  procedure GerarSequencial(var Seq : Integer);
  begin
    Seq := cdsTabelaItens.RecordCount + 1;
    while ( cdsTabelaItens.Locate('ITEM', Seq, []) ) do
      Seq := Seq + 1;
  end;

var
  Sequencial : Integer;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_ENTRADA) and (FieldByName('COMPRA_ANO').AsInteger = 0) ) then
    begin
      ShowWarning('Favor selecionar o Movimento de Entrada para a apropriação!');
      dbEntrada.SetFocus;
    end
    else
    if ( (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_AUTORIZ) and (FieldByName('AUTORIZACAO_ANO').AsInteger = 0) ) then
    begin
      ShowWarning('Favor selecionar a Autorizaçao de Compra para a apropriação!');
      dbAutorizacao.SetFocus;
    end
    else
    if ( FieldByName('CENTRO_CUSTO').AsInteger = 0 ) then
    begin
      ShowWarning('Favor selecionar o Centro de Custo para a apropriação!');
      dbCentroCusto.SetFocus;
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
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoExcluirClick(Sender: TObject);
var
  cDescontos    ,
  cTotalLiquido : Currency;
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TfrmGeApropriacaoEstoque.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var Total_Custo : Currency);
  var
    Item : Integer;
  begin
    Item := cdsTabelaItensITEM.AsInteger;

    Total_Custo := 0.0;

    cdsTabelaItens.First;

    while not cdsTabelaItens.Eof do
    begin
      Total_Custo := Total_Custo + cdsTabelaItensCUSTO_TOTAL.AsCurrency;

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
    if ( dbQuantidade.Field.AsCurrency < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensCUSTO_UNITARIO.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor de Custo Unitário inválido.');
      dbCustoUn.SetFocus;
    end
    else
    begin
      cdsTabelaItens.Post;

      GetToTais(cTotalCusto);

      DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus
      else
      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      begin
        btnProdutoEditar.SetFocus;
        if (DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger in [TIPO_APROPRIACAO_ENTRADA, TIPO_APROPRIACAO_AUTORIZ]) then
          cdsTabelaItens.Next;
      end;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.cdsTabelaItensAfterScroll(DataSet: TDataSet);
begin
  CarregarUnidadeProduto(cdsTabelaItensPRODUTO.AsString);

  if (cdsTabelaItensQTDE_TIPO_LANCAMENTO.AsInteger = 0) then
    dbQuantidade.DataField := cdsTabelaItensQTDE.FieldName
  else
    dbQuantidade.DataField := cdsTabelaItensQTDE_FRACIONADA.FieldName;
end;

procedure TfrmGeApropriacaoEstoque.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabelaItens.DataSet do
  begin
    FieldByName('ANO').Assign( DtSrcTabela.DataSet.FieldByName('ANO') );
    FieldByName('CONTROLE').Assign( DtSrcTabela.DataSet.FieldByName('CONTROLE') );
    FieldByName('QTDE_TIPO_LANCAMENTO').Value := 0;
    FieldByName('QTDE').Value                 := 1;
    FieldByName('QTDE_FRACIONADA').Value      := 1;
    FieldByName('FRACIONADOR').Value          := 1;
    FieldByName('CUSTO_UNITARIO').AsCurrency  := 0.0;
    FieldByName('CUSTO_TOTAL').AsCurrency     := 0.0;
    FieldByName('PRODUTO').Clear;
    FieldByName('DESCRI_APRESENTACAO').Clear;
    FieldByName('UNIDADE').Clear;
    FieldByName('UNIDADE_FRACAO').Clear;
    FieldByName('UNP_SIGLA').Clear;
    FieldByName('UNIDADE_FRACIONADA').Clear;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnEncerrarApropriacaoClick(
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
        // Produto não movimenta estoque ou autorização informada
        if ( (cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger = 0) or (DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_ANO').AsInteger > 0) ) then
          Return := False
        else
          Return := ( (cdsTabelaItensQTDE.AsCurrency > (cdsTabelaItensESTOQUE.AsCurrency - cdsTabelaItensRESERVA.AsCurrency)) or (cdsTabelaItensESTOQUE.AsCurrency <= 0) );

        if ( Return ) then
          Break;

        cdsTabelaItens.Next;
      end;

    finally
      cdsTabelaItens.EnableControls;
      Result := Return;
    end;
  end;

  procedure AjustarEstoqueAutomatico;
  var
    bAjustar : Boolean;
  begin
    try

      cdsTabelaItens.First;
      cdsTabelaItens.DisableControls;
      while not cdsTabelaItens.Eof do
      begin
        if ( (cdsTabelaItensMOVIMENTA_ESTOQUE.AsInteger = 0) or (DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_ANO').AsInteger > 0) ) then // Produto não movimenta estoque ou autorização informada
          bAjustar := False
        else
          bAjustar := ( (cdsTabelaItensQTDE.AsCurrency > (cdsTabelaItensESTOQUE.AsCurrency - cdsTabelaItensRESERVA.AsCurrency)) or (cdsTabelaItensESTOQUE.AsCurrency <= 0) );

        if ( bAjustar ) then
          with spAjusteEstoqueVenda do
          begin
            ParamByName('empresa').AsString      := DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString;
            ParamByName('produto').AsString      := cdsTabelaItensPRODUTO.AsString;
            ParamByName('qtde_atual').Value      := cdsTabelaItensESTOQUE.AsCurrency + cdsTabelaItensRESERVA.AsCurrency;
            ParamByName('qtde_nova').Value       := cdsTabelaItensQTDE.AsCurrency    + cdsTabelaItensRESERVA.AsCurrency;
            ParamByName('motivo').AsString       := 'APROPRIAÇÃO DE ESTOQUE PARA O CENTRO DE CUSTO ' + dbCentroCusto.Text;
            ParamByName('data_hora').Value       := GetDateTimeDB;
            ParamByName('usuario').AsString      := gUsuarioLogado.Login;
            ParamByName('documento').AsString    := 'AE' +
              Copy(DtSrcTabela.DataSet.FieldByName('ANO').AsString, 3, 2) +
              FormatFloat('000000', DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger);

            ExecProc;
            CommitTransaction;
          end;

        cdsTabelaItens.Next;
      end;

    finally
      cdsTabelaItens.First;
      cdsTabelaItens.EnableControls;
    end;
  end;

var
  cTotalCusto : Currency;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC) then
    begin
      ShowWarning('Lançamento de Apropriação já está encerrado!');
      Abort;
    end;

    ValidarToTais(cTotalCusto);

    if ( FieldByName('VALOR_TOTAL').AsCurrency <> cTotalCusto ) then
    begin
      ShowWarning('A soma dos valores totais dos itens (' +
        FormatFloat('"R$ ",0.00', cTotalCusto) +
        ') não confere com o Custo Total da Apropriação.' + #13#13 +
        'Favor excute os seguintes procedimentos:' + #13 +
        '1. Altere o registro para correção.'      + #13 +
        '2. Salve a alteração realizada.'          + #13 +
        '3. Finalize-o novamente.');
      Abort;
    end;

    (*
     * IMR: 29/06/2015
     * Rotina descontinuada, pois acima tem uma novo procedimento de criar um ajustes
     * automático no estoque e para que este possa ser apropriado pelo Centro de Custo.

    if ( QuantidadeInvalida ) then
    begin
      ShowWarning('Quantidade informada para o ítem ' + FormatFloat('#00', cdsTabelaItensITEM.AsInteger) + ' está acima da quantidade disponível no estoque.');
      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
        btnProdutoEditar.SetFocus;
    end
    else
    *)
    if ( ShowConfirm('Confirma o encerramento da apropriação selecionada?') ) then
    begin
      if QuantidadeInvalida then
      begin
        AjustarEstoqueAutomatico;
        AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);
      end;

      Edit;

      FieldByName('STATUS').Value  := STATUS_APROPRIACAO_ESTOQUE_ENC;
      FieldByName('USUARIO').Value := gUsuarioLogado.Login;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Encerramento realizado com sucesso !' + #13#13 +
        'Ano/Número: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusApropriacao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex   := 0;
  PgcTextoApropriacao.ActivePage := TbsApropriacaoMotivo;

  dbEntrada.Button.Enabled     := (DtSrcTabela.DataSet.State = dsInsert);
  dbAutorizacao.Button.Enabled := (DtSrcTabela.DataSet.State = dsInsert);

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger < STATUS_APROPRIACAO_ESTOQUE_ENC );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeApropriacaoEstoque.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );
end;

procedure TfrmGeApropriacaoEstoque.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    TbsApropriacaoCancelado.TabVisible := (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_CAN);
end;

procedure TfrmGeApropriacaoEstoque.fdQryTabelaINSERCAO_DATAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Text := FormatDateTime('dd/mm/yyyy hh:mm', Sender.AsDateTime);
end;

procedure TfrmGeApropriacaoEstoque.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('ANO').Value              := YearOf(GetDateDB);
    FieldByName('EMPRESA').Value          := gUsuarioLogado.Empresa;
    FieldByName('INSERCAO_DATA').Value    := GetDateTimeDB;
    FieldByName('DATA_APROPRIACAO').Value := GetDateDB;
    FieldByName('USUARIO').Value          := gUsuarioLogado.Login;
    FieldByName('STATUS').AsInteger       := STATUS_APROPRIACAO_ESTOQUE_EDC;
    FieldByName('TIPO').AsInteger         := TIPO_APROPRIACAO_GERAL;

    FieldByName('VALOR_TOTAL').AsCurrency := 0.0;

    FieldByName('CENTRO_CUSTO').Clear;
    FieldByName('COMPRA_ANO').Clear;
    FieldByName('COMPRA_NUM').Clear;
    FieldByName('COMPRA_EMP').Clear;
    FieldByName('AUTORIZACAO_ANO').Clear;
    FieldByName('AUTORIZACAO_NUM').Clear;
    FieldByName('AUTORIZACAO_EMP').Clear;
    FieldByName('COMPETENCIA').Clear;
    FieldByName('MOTIVO').Clear;
    FieldByName('OBS').Clear;
    FieldByName('CANCEL_USUARIO').Clear;
    FieldByName('CANCEL_DATAHORA').Clear;
    FieldByName('CANCEL_MOTIVO').Clear;
  end;
end;

procedure TfrmGeApropriacaoEstoque.fdQryTabelaSTATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_APROPRIACAO_ESTOQUE_EDC : Text := 'Em Edição';
    STATUS_APROPRIACAO_ESTOQUE_ABR : Text := 'Aberta';
    STATUS_APROPRIACAO_ESTOQUE_ENC : Text := 'Encerrada';
    STATUS_APROPRIACAO_ESTOQUE_CAN : Text := 'Cancelada';
  end;
end;

procedure TfrmGeApropriacaoEstoque.fdQryTabelaTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
    Case Sender.AsInteger of
      TIPO_APROPRIACAO_GERAL :
        Text := 'Geral';

      TIPO_APROPRIACAO_ENTRADA:
        Text := 'Por Entrada';

      TIPO_APROPRIACAO_AUTORIZ:
        Text := 'Por Autorização';

      else
        Text := Sender.AsString;
    end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) ) and ( DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_GERAL );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  dbgProdutos.Enabled       := not (cdsTabelaItens.State in [dsEdit, dsInsert]);

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeApropriacaoEstoque.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    AbrirTabelaItens( FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger );

  pgcMaisDados.ActivePage := tbsObservacoes;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := IfThen(iCentroCusto = 0, '', '(a.centro_custo = ' + IntToStr(iCentroCusto) + ') and ') +
    '(cast(a.data_apropriacao as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  if ( RdgStatusApropriacao.ItemIndex > 0 ) then
    WhereAdditional := WhereAdditional + ' and (a.status = ' + IntToStr(RdgStatusApropriacao.ItemIndex - 1) + ')';

  inherited;
end;

procedure TfrmGeApropriacaoEstoque.CarregarDadosProduto(Codigo: Integer);
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
    with fdQryProduto do
    begin
      Close;
      ParamByName('produto').AsInteger := Codigo;
      Open;

      if not IsEmpty then
      begin
        CarregarUnidadeProduto( FieldByName('cod').AsString );

        cdsTabelaItensPRODUTO.AsString             := FieldByName('cod').AsString;
        cdsTabelaItensDESCRI_APRESENTACAO.AsString := FieldByName('descri_apresentacao').AsString;
        cdsTabelaItensFRACIONADOR.AsCurrency       := FieldByName('fracionador').AsCurrency;
        cdsTabelaItensUNP_SIGLA.AsString           := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensUNIDADE_FRACIONADA.AsString  := FieldByName('Unidade_fracionada').AsString;

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE.AsInteger := FieldByName('Codunidade').AsInteger;

        if ( FieldByName('Codunidade_fracionada').AsInteger > 0 ) then
          cdsTabelaItensUNIDADE_FRACAO.AsInteger := FieldByName('Codunidade_fracionada').AsInteger;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado!');
        cdsTabelaItensPRODUTO.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btbtnSalvarClick(Sender: TObject);
var
  iCodigo   : Integer;
  sControle : String;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da autorização.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no ítem da autorização!');
    btnProdutoSalvar.SetFocus;
  end
  else
    with DtSrcTabela.DataSet do
    begin

      if Trim(FieldByName('NUMERO').AsString) = EmptyStr then
        FieldByName('NUMERO').AsString := FormatFloat('###0000000', FieldByName('CONTROLE').AsInteger) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

      if GetExisteNumeroApropriacao(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger, FieldByName('NUMERO').AsString, sControle) then
      begin
        ShowWarning('Número de apropriação já existe!');
        Abort;
      end;

      FieldByName('MOTIVO').AsString      := Trim(AnsiUpperCase(FieldByName('MOTIVO').AsString));
      FieldByName('OBS').AsString         := Trim(AnsiUpperCase(FieldByName('OBS').AsString));
      FieldByName('ENTRADA').Required     := (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_ENTRADA);
      FieldByName('AUTORIZACAO').Required := (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_AUTORIZ);

      if (FieldByName('COMPRA_ANO').AsInteger = 0) or (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_GERAL) then
      begin
        FieldByName('COMPRA_ANO').Clear;
        FieldByName('COMPRA_NUM').Clear;
        FieldByName('COMPRA_EMP').Clear;
        FieldByName('ENTRADA').Clear;
      end;

      if (FieldByName('AUTORIZACAO_ANO').AsInteger = 0) or (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_GERAL) then
      begin
        FieldByName('AUTORIZACAO_ANO').Clear;
        FieldByName('AUTORIZACAO_NUM').Clear;
        FieldByName('AUTORIZACAO_EMP').Clear;
        FieldByName('AUTORIZACAO').Clear;
      end;

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

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeApropriacaoEstoque.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_GERAL ) then
          CarregarDadosProduto( StrToIntDef(cdsTabelaItensPRODUTO.AsString, 0) );

  if ( Sender = dbUnidadeProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( cdsTabelaItensQTDE_TIPO_LANCAMENTO.AsInteger = 0 ) then
        dbQuantidade.DataField := cdsTabelaItensQTDE.FieldName
      else
        dbQuantidade.DataField := cdsTabelaItensQTDE_FRACIONADA.FieldName;

  if ( (Sender = dbQuantidade) or (Sender = dbCustoUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      if ( cdsTabelaItensQTDE_TIPO_LANCAMENTO.AsInteger = 0 ) then
        cdsTabelaItensQTDE_FRACIONADA.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensFRACIONADOR.AsInteger
      else
        cdsTabelaItensQTDE.AsCurrency := cdsTabelaItensQTDE_FRACIONADA.AsCurrency / cdsTabelaItensFRACIONADOR.AsInteger;

      cdsTabelaItensCUSTO_TOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_UNITARIO.AsCurrency;
    end;

  if ( Sender = dbCustoTotal ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeApropriacaoEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if (not DtSrcTabela.DataSet.FieldByName('STATUS').IsNull) then
      // Destacar autorização em edição
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_EDC ) then
        dbgDados.Canvas.Brush.Color := shpOperacaoEditando.Brush.Color
      else
      // Destacar autorização aberta
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR ) then
        dbgDados.Canvas.Font.Color := shpOperacaoAberta.Brush.Color
      else
      // Destacar autorização cancelada
      if ( DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_CAN ) then
        dbgDados.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar produtos não confirmados o recebimento
  if ( Sender = dbgProdutos ) then
  begin
    if ( (DtSrcTabela.DataSet.FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ENC) and (cdsTabelaItensQTDE.AsCurrency <= 0) ) then
      dbgProdutos.Canvas.Font.Color := shpOperacaoCancelada.Brush.Color;

    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeApropriacaoEstoque.dbProdutoButtonClick(Sender: TObject);
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
  if ( (DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_ENTRADA) and (DtSrcTabela.DataSet.FieldByName('COMPRA_ANO').AsInteger = 0) ) then
  begin
    ShowWarning('Favor selecionar o Movimento de Entrada para a apropriação!');
    dbEntrada.SetFocus;
  end
  else
  if ( (DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_AUTORIZ) and (DtSrcTabela.DataSet.FieldByName('AUTORIZACAO_ANO').AsInteger = 0) ) then
  begin
    ShowWarning('Favor selecionar a Autorização de Compra para a apropriação!');
    dbAutorizacao.SetFocus;
  end
  else
  if ( DtSrcTabela.DataSet.FieldByName('CENTRO_CUSTO').AsInteger = 0 ) then
  begin
    ShowWarning('Favor selecionar o Centro de Custo para a apropriação!');
    dbCentroCusto.SetFocus;
  end
  else
  if ( dbProduto.Button.Enabled and (cdsTabelaItens.State in [dsEdit, dsInsert]) ) then
  begin

    cAliquota       := 0.0;
    cAliquotaPIS    := 0.0;
    cAliquotaCOFINS := 0.0;
    cValorVenda     := 0.0;
    cValorPromocao  := 0.0;
    cValorIPI       := 0.0;
    cPercRedBC      := 0.0;

    bSelecionado := SelecionarProdutoParaEntrada(Self,
      iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP_CNAE,
      cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, cValorCusto,
      iEstoque, iReserva);

    if ( bSelecionado ) then
    begin
      cdsTabelaItensPRODUTO.AsString             := sCodigoAlfa;
      cdsTabelaItensDESCRI_APRESENTACAO.AsString := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString           := sUnidade;
      cdsTabelaItensCUSTO_UNITARIO.AsCurrency    := cValorCusto;

      CarregarDadosProduto( iCodigo );
    end;

  end;
end;

procedure TfrmGeApropriacaoEstoque.nmImprimirApropriacaoClick(
  Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    try
      ConfigurarEmail(gUsuarioLogado.Empresa
        , GetEmailEmpresa(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString)
        , 'Apropriação de Estoque', EmptyStr);
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
      ParamByName('codigo').AsInteger := DtSrcTabela.DataSet.FieldByName('CC_CLIENTE_CODIGO').AsInteger;
      Open;
    end;

    with qryApropriacaoEstoque do
    begin
      Close;
      ParamByName('ano').AsInteger := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
      ParamByName('cod').AsInteger := DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger;
      Open;
    end;

    frrApropriacaoEstoque.ShowReport;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnCancelarApropriacaoClick(
  Sender: TObject);
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  RecarregarRegistro;

  with DtSrcTabela.DataSet do
  begin
    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_CAN) then
    begin
      ShowWarning('Lançamento de Apropriação já está cancelado!');
      Abort;
    end;

    if ( FieldByName('STATUS').AsInteger <> STATUS_APROPRIACAO_ESTOQUE_ENC ) then
      ShowInformation('Apenas registros encerrados podem ser cancelados!')
    else
    if ( CancelarAPROP(Self, FieldByName('ANO').Value, FieldByName('CONTROLE').Value) ) then
    begin
      RecarregarRegistro;

      ShowInformation('Apropriação cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.btnFinalizarLancamentoClick(
  Sender: TObject);
var
  cTotalCusto : Currency;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  with DtSrcTabela.DataSet do
  begin
    if ( IsEmpty ) then
      Exit;

    RecarregarRegistro;

    if ( not Active ) then
      Exit;

    AbrirTabelaItens(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger);

    pgcGuias.ActivePage := tbsCadastro;

    if (FieldByName('STATUS').AsInteger = STATUS_APROPRIACAO_ESTOQUE_ABR) then
    begin
      ShowWarning('Lançamento de Apropriação já está finalizado!');
      Abort;
    end;

    if ShowConfirm('Confirma a finalização do lançamento da apropriação de estoque?') then
    begin
      ValidarToTais(cTotalCusto);

      DtSrcTabela.DataSet.Edit;

      FieldByName('STATUS').AsInteger := STATUS_APROPRIACAO_ESTOQUE_ABR;
      FieldByName('USUARIO').AsString := gUsuarioLogado.Login;
      FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;

      fdQryTabela.Post;
      fdQryTabela.ApplyUpdates;
      fdQryTabela.CommitUpdates;

      CommitTransaction;

      ShowInformation('Apropriação com lançamento finalizado com sucesso !' + #13#13 +
        'Ano/Número: ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString + '/' + FormatFloat('##0000000', DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger));

      HabilitarDesabilitar_Btns;

      RdgStatusApropriacao.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaItensDataChange(
  Sender: TObject; Field: TField);
begin
  if (cdsTabelaItens.State in [dsEdit, dsInsert]) then
    if ( (Field = cdsTabelaItensQTDE) or (Field = cdsTabelaItensCUSTO_UNITARIO) ) then
      cdsTabelaItensCUSTO_TOTAL.AsCurrency := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_TOTAL.AsCurrency;
end;

procedure TfrmGeApropriacaoEstoque.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sControle : String;
begin
  if (Key = VK_RETURN) then
  begin

    if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])  then
    begin

      if dbNumero.Focused then
        if ( Length(Trim(dbNumero.Text)) > 0 ) then
        begin
          with DtSrcTabela.DataSet do
            if GetExisteNumeroApropriacao(FieldByName('ANO').AsInteger, FieldByName('CONTROLE').AsInteger, Trim(dbNumero.Text), sControle) then
              ShowWarning('Número de apropriação já existe!' + #13 + 'Controle: ' + sControle);
        end;

      { DONE -oIsaque -cApropriação : 13/01/2015 - Verificar a Data da Autorização }

      if dbDataApropriacao.Focused then
        if ( dbDataApropriacao.Date > GetDateTimeDB ) then
            ShowWarning('A Data da apropriação está maior que a data atual do sistema.' + #13#13 + 'Favor confirmar!');

    end;

  end
  else
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    begin
      with DtSrcTabela.DataSet do
      begin
        if ( dbEntrada.Focused ) then
        begin
          FieldByName('COMPRA_ANO').Clear;
          FieldByName('COMPRA_NUM').Clear;
          FieldByName('COMPRA_EMP').Clear;
          FieldByName('ENTRADA').Clear;
        end
        else
        if ( dbAutorizacao.Focused ) then
        begin
          FieldByName('AUTORIZACAO_ANO').Clear;
          FieldByName('AUTORIZACAO_NUM').Clear;
          FieldByName('AUTORIZACAO_EMP').Clear;
          FieldByName('AUTORIZACAO').Clear;
        end
        else
        if ( dbCentroCusto.Focused ) then
        begin
          FieldByName('CENTRO_CUSTO').Clear;
          FieldByName('CC_DESCRICAO').Clear;
        end;
      end;
    end;

  end;

  inherited;
end;

function TfrmGeApropriacaoEstoque.GetRotinaEncerrarID: String;
begin
  Result := GetRotinaInternaID(btnEncerrarApropriacao);
end;

function TfrmGeApropriacaoEstoque.GetRotinaCancelarApropriacaoID: String;
begin
  Result := GetRotinaInternaID(btnCancelarApropriacao);
end;

function TfrmGeApropriacaoEstoque.GetRotinaFinalizarID: String;
begin
  Result := GetRotinaInternaID(btnFinalizarLancamento);
end;

procedure TfrmGeApropriacaoEstoque.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnFinalizarLancamento.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaFinalizarID, btnFinalizarLancamento.Caption, RotinaID);

    if btnEncerrarApropriacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEncerrarID, btnEncerrarApropriacao.Caption, RotinaID);

    if btnCancelarApropriacao.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarApropriacaoID, btnCancelarApropriacao.Caption, RotinaID);
  end;
end;

procedure TfrmGeApropriacaoEstoque.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeApropriacaoEstoque.ValidarToTais(var Total_Custo : Currency);
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
      Total_Custo := Total_Custo + cdsTabelaItensCUSTO_TOTAL.AsCurrency;

      cdsTabelaItens.Next;
    end;

  finally
    cdsTabelaItens.Locate('ITEM', Item, []);
    cdsTabelaItens.EnableControls;
  end;
end;

procedure TfrmGeApropriacaoEstoque.dbCentroCustoButtonClick(
  Sender: TObject);
var
  iCodigo  ,
  iCliente : Integer;
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarDepartamento(Self, 0, FieldByName('EMPRESA').AsString, iCodigo, sNome, iCliente) ) then
      begin
        FieldByName('CENTRO_CUSTO').AsInteger      := iCodigo;
        FieldByName('CC_DESCRICAO').AsString       := sNome;
        FieldByName('CC_CLIENTE_CODIGO').AsInteger := iCliente;
      end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  with DtSrcTabela.DataSet do
    if ( Field = FieldByName('TIPO') ) then
    begin
      dbEntrada.Button.Enabled     := (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_ENTRADA);
      dbAutorizacao.Button.Enabled := (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_AUTORIZ);
      dbProduto.Button.Enabled     := (FieldByName('TIPO').AsInteger = TIPO_APROPRIACAO_GERAL);
      dbProduto.ReadOnly           := (FieldByName('TIPO').AsInteger > TIPO_APROPRIACAO_GERAL);
      dbUnidadeProduto.ReadOnly    := (FieldByName('TIPO').AsInteger > TIPO_APROPRIACAO_GERAL);

      DtSrcTabelaItensStateChange( DtSrcTabelaItens );
    end;
end;

procedure TfrmGeApropriacaoEstoque.dbEntradaButtonClick(Sender: TObject);
var
  iEntradaAno ,
  iEntradaCod : Integer;
  sEntradaEmp ,
  aObservacao : String;
begin
  with DtSrcTabela.DataSet do
  begin
    aObservacao := EmptyStr;
    if ( dbEntrada.Button.Enabled and (State in [dsEdit, dsInsert]) ) then
      if SelecionarEntrada(Self, iEntradaAno, iEntradaCod, sEntradaEmp, aObservacao) then
      begin
        FieldByName('COMPRA_ANO').AsInteger := iEntradaAno;
        FieldByName('COMPRA_NUM').AsInteger := iEntradaCod;
        FieldByName('COMPRA_EMP').AsString  := sEntradaEmp;
        FieldByName('ENTRADA').AsString     := FormatFloat('0000"/"', iEntradaAno) + FormatFloat('0000000', iEntradaCod);

        if (not aObservacao.Trim.IsEmpty) then
          dbObservacao.Lines.Add(aObservacao);

        CarregarProdutosEntrada(iEntradaAno, iEntradaCod, sEntradaEmp);
        cdsTabelaItens.First;

        dbEntrada.SetFocus;
      end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.CarregarProdutosEntrada(
  const iEntradaAno, iEntradaCod: Integer; sEntradaEmp: String);
var
  I : Integer;
  cTotalCusto : Currency;
begin
  with fdQryEntradaProduto do
  begin
    Close;
    ParamByName('ano').AsSmallInt := iEntradaAno;
    ParamByName('cod').AsInteger  := iEntradaCod;
    ParamByName('emp').AsString   := sEntradaEmp;
    Open;

    if not IsEmpty then
    begin
      AbrirTabelaItens(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger);
      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
        cdsTabelaItens.Delete;
    end;

    cTotalCusto := 0.0;
    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        cdsTabelaItens.Append;

        cdsTabelaItensITEM.AsInteger := I;
        cdsTabelaItensPRODUTO.Assign       ( FieldByName('produto') );
        cdsTabelaItensQTDE.Assign          ( FieldByName('quantidade') );
        cdsTabelaItensFRACIONADOR.Assign   ( FieldByName('fracionador') );
        cdsTabelaItensUNIDADE.Assign       ( FieldByName('unidade') );
        cdsTabelaItensUNIDADE_FRACAO.Assign( FieldByName('unidade_fracao') );
        cdsTabelaItensCUSTO_UNITARIO.Assign( FieldByName('valor_unitario') );

        cdsTabelaItensDESCRI.Assign             ( FieldByName('DESCRI') );
        cdsTabelaItensAPRESENTACAO.Assign       ( FieldByName('apresentacao') );
        cdsTabelaItensDESCRI_APRESENTACAO.Assign( FieldByName('DESCRI_APRESENTACAO') );
        cdsTabelaItensUNP_DESCRICAO.Assign      ( FieldByName('UNP_DESCRICAO') );
        cdsTabelaItensUNP_SIGLA.Assign          ( FieldByName('UNP_SIGLA') );
        cdsTabelaItensUNIDADE_SIGLA.Assign      ( FieldByName('UNIDADE_SIGLA') );
        cdsTabelaItensUNIDADE_FRACIONADA.Assign ( FieldByName('unidade_fracionada') );
        cdsTabelaItensESTOQUE.Assign            ( FieldByName('ESTOQUE') );
        cdsTabelaItensRESERVA.Assign            ( FieldByName('RESERVA') );
        cdsTabelaItensMOVIMENTA_ESTOQUE.Assign  ( FieldByName('MOVIMENTA_ESTOQUE') );

        cdsTabelaItensQTDE_FRACIONADA.AsCurrency := FieldByName('quantidade').AsCurrency * FieldByName('fracionador').AsCurrency;
        cdsTabelaItensCUSTO_TOTAL.AsCurrency     := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_UNITARIO.AsCurrency;

        cdsTabelaItens.Post;

        cTotalCusto := cTotalCusto + cdsTabelaItensCUSTO_TOTAL.AsCurrency;
        Inc(I);
      end;

      Next;
    end;

    DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;
  end;
end;

procedure TfrmGeApropriacaoEstoque.CarregarUnidadeProduto(Codigo: String);
begin
  with fdQryUnidadeProduto do
  begin
    Close;
    ParamByName('produto').AsString := Codigo;
    Open;
  end;
end;

procedure TfrmGeApropriacaoEstoque.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeApropriacaoEstoque.dbAutorizacaoButtonClick(
  Sender: TObject);
var
  iAutorizacaoAno ,
  iAutorizacaoCod : Integer;
  sAutorizacaoEmp ,
  aObservacao     : String;
begin
  with DtSrcTabela.DataSet do
  begin
    aObservacao := EmptyStr;
    if ( dbAutorizacao.Button.Enabled and (State in [dsEdit, dsInsert]) ) then
      if SelecionarAutorizacaoParaApropriacao(Self, e1Data.Date - 30, iAutorizacaoAno, iAutorizacaoCod, sAutorizacaoEmp, aObservacao) then
      begin
        FieldByName('AUTORIZACAO_ANO').AsInteger := iAutorizacaoAno;
        FieldByName('AUTORIZACAO_NUM').AsInteger := iAutorizacaoCod;
        FieldByName('AUTORIZACAO_EMP').AsString  := sAutorizacaoEmp;
        FieldByName('AUTORIZACAO').AsString      := FormatFloat('0000"/"', iAutorizacaoAno) + FormatFloat('0000000', iAutorizacaoCod);

        if (not aObservacao.Trim.IsEmpty) then
          dbObservacao.Lines.Add(aObservacao);

        CarregarProdutosAutorizacao(iAutorizacaoAno, iAutorizacaoCod, sAutorizacaoEmp);
        cdsTabelaItens.First;

        dbAutorizacao.SetFocus;
      end;
  end;
end;

procedure TfrmGeApropriacaoEstoque.CarregarProdutosAutorizacao(
  const iAutorizacaoAno, iAutorizacaoCod: Integer;
  sAutorizacaoEmp: String);
var
  I : Integer;
  cTotalCusto : Currency;
begin
  with fdQryAutorizacaoProduto do
  begin
    Close;
    ParamByName('ano').AsSmallInt := iAutorizacaoAno;
    ParamByName('cod').AsInteger  := iAutorizacaoCod;
    ParamByName('emp').AsString   := sAutorizacaoEmp;
    Open;

    if not IsEmpty then
    begin
      AbrirTabelaItens(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('CONTROLE').AsInteger);
      cdsTabelaItens.First;
      while not cdsTabelaItens.Eof do
        cdsTabelaItens.Delete;
    end;

    cTotalCusto := 0.0;
    I := 1;

    First;
    while not Eof do
    begin
      if ( FieldByName('quantidade').AsCurrency > 0.0 ) then
      begin
        cdsTabelaItens.Append;

        cdsTabelaItensITEM.AsInteger := I;
        cdsTabelaItensPRODUTO.Assign       ( FieldByName('produto') );
        cdsTabelaItensQTDE.Assign          ( FieldByName('quantidade') );
        cdsTabelaItensFRACIONADOR.Assign   ( FieldByName('fracionador') );
        cdsTabelaItensUNIDADE.Assign       ( FieldByName('unidade') );
        cdsTabelaItensUNIDADE_FRACAO.Assign( FieldByName('unidade_fracao') );
        cdsTabelaItensCUSTO_UNITARIO.Assign( FieldByName('valor_unitario') );

        cdsTabelaItensDESCRI.Assign             ( FieldByName('DESCRI') );
        cdsTabelaItensAPRESENTACAO.Assign       ( FieldByName('apresentacao') );
        cdsTabelaItensDESCRI_APRESENTACAO.Assign( FieldByName('DESCRI_APRESENTACAO') );
        cdsTabelaItensUNP_DESCRICAO.Assign      ( FieldByName('UNP_DESCRICAO') );
        cdsTabelaItensUNP_SIGLA.Assign          ( FieldByName('UNP_SIGLA') );
        cdsTabelaItensUNIDADE_SIGLA.Assign      ( FieldByName('UNIDADE_SIGLA') );
        cdsTabelaItensUNIDADE_FRACIONADA.Assign ( FieldByName('unidade_fracionada') );
        cdsTabelaItensESTOQUE.Assign            ( FieldByName('ESTOQUE') );
        cdsTabelaItensRESERVA.Assign            ( FieldByName('RESERVA') );
        cdsTabelaItensMOVIMENTA_ESTOQUE.Assign  ( FieldByName('MOVIMENTA_ESTOQUE') );

        cdsTabelaItensQTDE_FRACIONADA.AsCurrency := FieldByName('quantidade').AsCurrency * FieldByName('fracionador').AsCurrency;
        cdsTabelaItensCUSTO_TOTAL.AsCurrency     := cdsTabelaItensQTDE.AsCurrency * cdsTabelaItensCUSTO_UNITARIO.AsCurrency;

        cdsTabelaItens.Post;

        cTotalCusto := cTotalCusto + cdsTabelaItensCUSTO_TOTAL.AsCurrency;
        Inc(I);
      end;

      Next;
    end;

    DtSrcTabela.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := cTotalCusto;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeApropriacaoEstoque', TfrmGeApropriacaoEstoque);

end.
