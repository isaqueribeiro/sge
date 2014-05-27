unit UGeEntradaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, IBStoredProc, Menus, IBQuery;

type
  TfrmGeEntradaEstoque = class(TfrmGrPadraoCadastro)
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    lblDataEntrada: TLabel;
    dbDataEntrada: TDBEdit;
    lblCFOPNF: TLabel;
    dbCFOPNF: TRxDBComboEdit;
    dbCFOPNFDescricao: TDBEdit;
    qryProduto: TIBDataSet;
    qryCFOP: TIBDataSet;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    dbValorFrete: TDBEdit;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblValorOutros: TLabel;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    lblTotalNotaFiscal: TLabel;
    dbValorDesconto: TDBEdit;
    lblValorDesconto: TLabel;
    dbValorIPI: TDBEdit;
    lblValorIPI: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMS: TDBEdit;
    lblValorICMS: TLabel;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsPagamento: TTabSheet;
    lblObservacao: TLabel;
    lblFormaPagto: TLabel;
    lblCondicaoPagto: TLabel;
    lblPrazo01: TLabel;
    lblPrazo02: TLabel;
    lblPrazo03: TLabel;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    lblPrazo06: TLabel;
    lblPrazo07: TLabel;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    lblPrazo10: TLabel;
    lblPrazo11: TLabel;
    lblPrazo12: TLabel;
    dbObservacao: TDBMemo;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    dbPrazo01: TDBEdit;
    dbPrazo02: TDBEdit;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    dbPrazo07: TDBEdit;
    dbPrazo08: TDBEdit;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    dbPrazo11: TDBEdit;
    dbPrazo12: TDBEdit;
    tbsDuplicatas: TTabSheet;
    Bevel6: TBevel;
    Bevel7: TBevel;
    pnlBotoesTitulo: TPanel;
    btnRegerarDuplicata: TBitBtn;
    btnTituloEditar: TBitBtn;
    btnTituloExcluir: TBitBtn;
    dbgTitulos: TDBGrid;
    Bevel9: TBevel;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    qryDuplicatas: TIBDataSet;
    qryDuplicatasLancamento: TStringField;
    dtsDuplicatas: TDataSource;
    IbStrPrcGerarDuplicatas: TIBStoredProc;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblUnidade: TLabel;
    lblParticipacao: TLabel;
    lblTotalBruto: TLabel;
    lblValorIPIProduto: TLabel;
    Bevel10: TBevel;
    dbProduto: TRxDBComboEdit;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorUnit: TDBEdit;
    dbUnidade: TDBEdit;
    dbParticipacao: TDBEdit;
    dbTotalBruto: TDBEdit;
    dbValorIPIProduto: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoInserir: TBitBtn;
    btnProdutoEditar: TBitBtn;
    btnProdutoExcluir: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    Bevel11: TBevel;
    dbgProdutos: TDBGrid;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    lblCustoMedio: TLabel;
    dbCustoMedio: TDBEdit;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaCODCONTROL: TIntegerField;
    IbDtstTabelaCODEMP: TIBStringField;
    IbDtstTabelaCODFORN: TIntegerField;
    IbDtstTabelaNF: TIntegerField;
    IbDtstTabelaDTLANCAMENTO: TDateTimeField;
    IbDtstTabelaDTEMISS: TDateField;
    IbDtstTabelaDTENT: TDateField;
    IbDtstTabelaNFCFOP: TIntegerField;
    IbDtstTabelaNATUREZA: TIBStringField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaIPI: TIBBCDField;
    IbDtstTabelaICMSBASE: TIBBCDField;
    IbDtstTabelaICMSVALOR: TIBBCDField;
    IbDtstTabelaICMSSUBSTBASE: TIBBCDField;
    IbDtstTabelaICMSSUBSTVALOR: TIBBCDField;
    IbDtstTabelaFRETE: TIBBCDField;
    IbDtstTabelaOUTROSCUSTOS: TIBBCDField;
    IbDtstTabelaDESCONTO: TIBBCDField;
    IbDtstTabelaTOTALNF: TIBBCDField;
    IbDtstTabelaTOTALPROD: TIBBCDField;
    IbDtstTabelaOBS: TMemoField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaFORMAPAGTO_COD: TSmallintField;
    IbDtstTabelaCONDICAOPAGTO_COD: TSmallintField;
    IbDtstTabelaCOMPRA_PRAZO: TSmallintField;
    IbDtstTabelaPRAZO_01: TSmallintField;
    IbDtstTabelaPRAZO_02: TSmallintField;
    IbDtstTabelaPRAZO_03: TSmallintField;
    IbDtstTabelaPRAZO_04: TSmallintField;
    IbDtstTabelaPRAZO_05: TSmallintField;
    IbDtstTabelaPRAZO_06: TSmallintField;
    IbDtstTabelaPRAZO_07: TSmallintField;
    IbDtstTabelaPRAZO_08: TSmallintField;
    IbDtstTabelaPRAZO_09: TSmallintField;
    IbDtstTabelaPRAZO_10: TSmallintField;
    IbDtstTabelaPRAZO_11: TSmallintField;
    IbDtstTabelaPRAZO_12: TSmallintField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaCFOP_DESCRICAO: TIBStringField;
    btbtnFinalizar: TBitBtn;
    Bevel12: TBevel;
    cdsTabelaItensANO: TSmallintField;
    cdsTabelaItensCODCONTROL: TIntegerField;
    cdsTabelaItensCODEMP: TIBStringField;
    cdsTabelaItensSEQ: TSmallintField;
    cdsTabelaItensCODPROD: TIBStringField;
    cdsTabelaItensCODFORN: TIntegerField;
    cdsTabelaItensDTENT: TDateField;
    cdsTabelaItensPRECOUNIT: TIBBCDField;
    cdsTabelaItensCUSTOMEDIO: TIBBCDField;
    cdsTabelaItensNF: TIntegerField;
    cdsTabelaItensPERC_PARTICIPACAO: TIBBCDField;
    cdsTabelaItensVALOR_FRETE: TIBBCDField;
    cdsTabelaItensVALOR_DESCONTO: TIBBCDField;
    cdsTabelaItensVALOR_OUTROS: TIBBCDField;
    cdsTabelaItensUNID_COD: TSmallintField;
    cdsTabelaItensDESCRI: TIBStringField;
    cdsTabelaItensUNP_SIGLA: TIBStringField;
    cdsTabelaItensVALOR_IPI: TIBBCDField;
    IbDtstTabelaDTFINALIZACAO_COMPRA: TDateTimeField;
    qryDuplicatasANOLANC: TSmallintField;
    qryDuplicatasNUMLANC: TIntegerField;
    qryDuplicatasPARCELA: TSmallintField;
    qryDuplicatasCODFORN: TSmallintField;
    qryDuplicatasNOMEFORN: TIBStringField;
    qryDuplicatasCNPJ: TIBStringField;
    qryDuplicatasNOTFISC: TIBStringField;
    qryDuplicatasTIPPAG: TIBStringField;
    qryDuplicatasDTEMISS: TDateField;
    qryDuplicatasDTVENC: TDateField;
    qryDuplicatasVALORPAG: TIBBCDField;
    qryDuplicatasBANCO: TSmallintField;
    qryDuplicatasBCO_NOME: TIBStringField;
    qryDuplicatasNUMCHQ: TIBStringField;
    qryDuplicatasPAGO_: TIBStringField;
    qryDuplicatasDOCBAIX: TIBStringField;
    IbUpdDuplicatas: TIBUpdateSQL;
    lblNCM_SH: TLabel;
    dbNCM_SH: TDBEdit;
    lblCST: TLabel;
    dbCST: TDBEdit;
    lblCFOPItem: TLabel;
    dbCFOPItem: TDBEdit;
    cdsTabelaItensNCM_SH: TIBStringField;
    cdsTabelaItensCST: TIBStringField;
    cdsTabelaItensCFOP: TIntegerField;
    btbtnCancelarENT: TBitBtn;
    lblEntradaAberta: TLabel;
    lblEntradaCancelada: TLabel;
    Label1: TLabel;
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    btbtnGerarNFe: TBitBtn;
    lblAliquota: TLabel;
    dbAliquota: TDBEdit;
    lblPercRedBC: TLabel;
    dbPercRedBC: TDBEdit;
    cdsTabelaItensALIQUOTA: TIBBCDField;
    cdsTabelaItensALIQUOTA_CSOSN: TIBBCDField;
    cdsTabelaItensALIQUOTA_PIS: TIBBCDField;
    cdsTabelaItensALIQUOTA_COFINS: TIBBCDField;
    cdsTabelaItensPERCENTUAL_REDUCAO_BC: TIBBCDField;
    qryNFE: TIBDataSet;
    updNFE: TIBUpdateSQL;
    ppImprimir: TPopupMenu;
    nmImprimirVenda: TMenuItem;
    N1: TMenuItem;
    nmImprimirDANFE: TMenuItem;
    nmGerarDANFEXML: TMenuItem;
    qryNFEANOCOMPRA: TSmallintField;
    qryNFENUMCOMPRA: TIntegerField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFESERIE: TIBStringField;
    qryNFENUMERO: TIntegerField;
    qryNFECHAVE: TIBStringField;
    qryNFEPROTOCOLO: TIBStringField;
    qryNFERECIBO: TIBStringField;
    qryNFEXML_FILENAME: TIBStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    IbDtstTabelaNFSERIE: TIBStringField;
    IbDtstTabelaLOTE_NFE_ANO: TSmallintField;
    IbDtstTabelaLOTE_NFE_NUMERO: TIntegerField;
    IbDtstTabelaLOTE_NFE_RECIBO: TIBStringField;
    qryNFEEMPRESA: TIBStringField;
    cdsTabelaItensQTDE: TIBBCDField;
    cdsTabelaItensQTDEANTES: TIBBCDField;
    cdsTabelaItensQTDEFINAL: TIBBCDField;
    cdsTabelaItensESTOQUE: TIBBCDField;
    cdsTabelaItensTOTAL_BRUTO: TFMTBCDField;
    cdsTabelaItensTOTAL_LIQUIDO: TFMTBCDField;
    lblAutorizacao: TLabel;
    dbAutorizacao: TRxDBComboEdit;
    IbDtstTabelaAUTORIZACAO_ANO: TSmallintField;
    IbDtstTabelaAUTORIZACAO_CODIGO: TIntegerField;
    IbDtstTabelaAUTORIZACAO_EMPRESA: TIBStringField;
    qryTpDespesa: TIBQuery;
    dtsTpDespesa: TDataSource;
    IbDtstTabelaTIPO_DESPESA: TSmallintField;
    Bevel13: TBevel;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbCondicaoPagtoClick(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure IbDtstTabelaBeforeCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btnProdutoInserirClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoExcluirClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbProdutoButtonClick(Sender: TObject);
    procedure cdsTabelaItensNewRecord(DataSet: TDataSet);
    procedure btbtnFinalizarClick(Sender: TObject);
    procedure qryDuplicatasCalcFields(DataSet: TDataSet);
    procedure btnRegerarDuplicataClick(Sender: TObject);
    procedure dbCFOPNFButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarENTClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnGerarNFeClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure nmImprimirDANFEClick(Sender: TObject);
    procedure nmGerarDANFEXMLClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbAutorizacaoButtonClick(Sender: TObject);
    procedure IbDtstTabelaAUTORIZACAO_CODIGOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
    SQL_Itens   ,
    SQL_Duplicatas : TStringList;
    procedure AbrirTabelaItens(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure AbrirTabelaDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure GerarDuplicatas(const AnoCompra : Smallint; const ControleCompra : Integer);
    procedure CarregarDadosProduto( Codigo : Integer);
    procedure CarregarDadosCFOP( iCodigo : Integer );
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
  public
    { Public declarations }
  end;

var
  frmGeEntradaEstoque: TfrmGeEntradaEstoque;

  procedure MostrarControleCompras(const AOwner : TComponent);

implementation

uses
  UConstantesDGE, DateUtils, UDMBusiness, UGeCondicaoPagto, UGeProduto, UGeTabelaCFOP, {$IFNDEF DGE}UGeAutorizacaoCompra,{$ENDIF}
  UGeFornecedor, UGeEntradaEstoqueCancelar, UGeEntradaConfirmaDuplicatas, UGeEntradaEstoqueGerarNFe, UDMNFe;

{$R *.dfm}

procedure MostrarControleCompras(const AOwner : TComponent);
var
  frm : TfrmGeEntradaEstoque;
  whr : String;
begin
  frm := TfrmGeEntradaEstoque.Create(AOwner);
  try
    whr := 'cast(c.dtent as date) between ' +
              QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
              QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

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

procedure TfrmGeEntradaEstoque.FormCreate(Sender: TObject);
begin
  {$IFDEF DGE}
  dbCFOPNFDescricao.Width := 457;
  lblSituacao.Left        := 944;
  dbSituacao.Left         := 944;
  lblAutorizacao.Visible  := False;
  dbAutorizacao.Visible   := False;
  {$ENDIF}

  IbDtstTabela.GeneratorField.Generator := 'GEN_COMPRAS_CONTROLE_' + FormatFloat('0000', YearOf(Date));

  inherited;

  AbrirTabelaAuto:= True;

  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  SQL_Duplicatas := TStringList.Create;
  SQL_Duplicatas.Clear;
  SQL_Duplicatas.AddStrings( qryDuplicatas.SelectSQL );

  e1Data.Date      := Date;
  e2Data.Date      := Date;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  qryTpDespesa.Open;

  DisplayFormatCodigo := '###0000000';
  NomeTabela     := 'TBCOMPRAS';
  CampoCodigo    := 'Codcontrol';
  CampoDescricao := 'f.NomeForn';
  CampoOrdenacao := 'c.dtEnt, f.NomeForn';

  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );

  btbtnGerarNFe.Visible := GetEstacaoEmitiNFe;
end;

procedure TfrmGeEntradaEstoque.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'cast(c.dtent as date) between ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
                       QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );
  inherited;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaAno.Value     := YearOf(Now);
  IbDtstTabelaDTENT.Value   := Date;
  IbDtstTabelaDTLANCAMENTO.Value := Now;
  IbDtstTabelaCODEMP.Value  := GetEmpresaIDDefault;
  IbDtstTabelaFORMAPAGTO_COD.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAOPAGTO_COD.Value := GetCondicaoPagtoIDDefault;
  IbDtstTabelaNFCFOP.Value            := GetCfopEntradaIDDefault;
  IbDtstTabelaCFOP_DESCRICAO.Value    := GetCfopEntradaNomeDefault;
  IbDtstTabelaNATUREZA.Value          := IntToStr( GetCfopIDDefault );
  IbDtstTabelaSTATUS.Value       := STATUS_CMP_ABR;
  IbDtstTabelaCOMPRA_PRAZO.Value := 0;
  IbDtstTabelaICMSBASE.Value     := 0;
  IbDtstTabelaICMSVALOR.Value      := 0;
  IbDtstTabelaICMSSUBSTBASE.Value  := 0;
  IbDtstTabelaICMSSUBSTVALOR.Value := 0;
  IbDtstTabelaFRETE.Value          := 0;
  IbDtstTabelaOUTROSCUSTOS.Value   := 0;
  IbDtstTabelaIPI.Value            := 0;
  IbDtstTabelaDESCONTO.Value       := 0;
  IbDtstTabelaTOTALNF.Value        := 0;
  IbDtstTabelaTOTALPROD.Value      := 0;
  IbDtstTabelaUSUARIO.Value        := GetUserApp;
  IbDtstTabelaTIPO_DESPESA.Clear;
  IbDtstTabelaAUTORIZACAO_ANO.Clear;
  IbDtstTabelaAUTORIZACAO_CODIGO.Clear;
  IbDtstTabelaAUTORIZACAO_EMPRESA.Clear;
end;

procedure TfrmGeEntradaEstoque.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaCODFORN.AsInteger := iCodigo;
      IbDtstTabelaCNPJ.AsString     := sCNPJ;
      IbDtstTabelaNOMEFORN.AsString := sNome;
    end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    STATUS_CMP_ABR : Text := 'Aberta';
    STATUS_CMP_FIN : Text := 'Finalizada';
    STATUS_CMP_CAN : Text := 'Cancelada';
    STATUS_CMP_NFE : Text := 'NF-e Emitida';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeEntradaEstoque.dbCondicaoPagtoClick(Sender: TObject);
var
  I : Integer;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( tblCondicaoPagto.Locate('cond_cod', dbCondicaoPagto.Field.AsInteger, []) ) then
    begin
      IbDtstTabelaCOMPRA_PRAZO.AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo').AsInteger;
      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
      begin
        IbDtstTabela.FieldByName('PRAZO_' + FormatFloat('00', I)).Clear;
        if ( not tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).IsNull ) then
          IbDtstTabela.FieldByName('PRAZO_' + FormatFloat('00', I)).AsInteger := tblCondicaoPagto.FieldByName('Cond_prazo_' + FormatFloat('00', I)).AsInteger;
      end;
    end;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaItensStateChange(
  Sender: TObject);
begin
  btnProdutoInserir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) );
  btnProdutoEditar.Enabled  := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoExcluir.Enabled := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoSalvar.Enabled  := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( dbProduto.Visible and dbProduto.Enabled ) then
      dbProduto.SetFocus;
end;

procedure TfrmGeEntradaEstoque.AbrirTabelaItens(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.Ano        = ' + IntToStr(AnoCompra));
    Add('  and i.Codcontrol = ' + IntToStr(ControleCompra));
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeEntradaEstoque.AbrirTabelaDuplicatas(
  const AnoCompra: Smallint; const ControleCompra: Integer);
begin
  qryDuplicatas.Close;

  with qryDuplicatas, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Duplicatas );
    Add('where p.AnoCompra = ' + IntToStr(AnoCompra));
    Add('  and p.NumCompra = ' + IntToStr(ControleCompra));
    Add('order by p.numlanc, p.parcela');
  end;

  qryDuplicatas.Open;
end;

procedure TfrmGeEntradaEstoque.CarregarDadosProduto(Codigo : Integer);
begin
  if ( not cdsTabelaItens.Active ) then
    Exit
  else
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    with qryProduto do
    begin
      Close;
      ParamByName('Codigo').AsInteger := Codigo;
      Open;
      if not IsEmpty then
      begin
        if not qryCFOP.Active then
          CarregarDadosCFOP( IbDtstTabelaNFCFOP.AsInteger );

        cdsTabelaItensCODPROD.AsString     := FieldByName('Cod').AsString;
        cdsTabelaItensDESCRI.AsString      := FieldByName('Descri').AsString;
        cdsTabelaItensUNP_SIGLA.AsString   := FieldByName('Unp_sigla').AsString;
        cdsTabelaItensQTDEANTES.AsCurrency := FieldByName('Qtde').AsCurrency;

        cdsTabelaItensNCM_SH.AsString                  := FieldByName('Ncm_sh').AsString;
        cdsTabelaItensALIQUOTA.AsCurrency              := FieldByName('Aliquota').AsCurrency;
        cdsTabelaItensALIQUOTA_CSOSN.AsCurrency        := FieldByName('Aliquota_csosn').AsCurrency;
        cdsTabelaItensALIQUOTA_PIS.AsCurrency          := FieldByName('Aliquota_pis').AsCurrency;
        cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := FieldByName('Aliquota_cofins').AsCurrency;
        cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := FieldByName('Percentual_reducao_BC').AsCurrency;

        if ( Trim(FieldByName('Cst').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString       := FieldByName('Cst').AsString;

        if ( (qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
          cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString);

        if ( FieldByName('Codunidade').AsInteger > 0 ) then
          cdsTabelaItensUNID_COD.AsInteger   := FieldByName('Codunidade').AsInteger;
      end
      else
      begin
        ShowWarning('Código de produto não cadastrado');
        cdsTabelaItensCODPROD.Clear;
        if ( dbProduto.Visible and dbProduto.Enabled ) then
          dbProduto.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnFinalizar.Enabled   := ( IbDtstTabelaSTATUS.AsInteger < STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);
    btbtnCancelarENT.Enabled := ((IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) or (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE)) and (not cdsTabelaItens.IsEmpty);
    btbtnGerarNFe.Enabled    := ( IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_FIN) and (not cdsTabelaItens.IsEmpty);

    nmImprimirDANFE.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);
    nmGerarDANFEXML.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);
  end
  else
  begin
    btbtnFinalizar.Enabled   := False;
    btbtnCancelarENT.Enabled := False;
    btbtnGerarNFe.Enabled    := False;

    nmImprimirDANFE.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);
    nmGerarDANFEXML.Enabled := (IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_NFE);
  end;
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaBeforeCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  
  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_CMP_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_CMP_FIN : sMsg := 'Esta entrada não pode ser excluída porque está finalizada.';
      STATUS_CMP_CAN : sMsg := 'Esta entrada não pode ser excluída porque está cancelada';
      STATUS_CMP_NFE : sMsg := 'Esta entrada não pode ser excluída porque exite Nota Fiscal gerar para este movimento.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoInserirClick(Sender: TObject);
begin
  if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
  begin
    ShowInformation('Favor selecionar o Fornecedor primeiramente!');
    dbFornecedor.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALPROD.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total de Produtos');
    dbTotalProduto.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALNF.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( cdsTabelaItens.Active ) then
  begin
    cdsTabelaItens.Append;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeEntradaEstoque.btnProdutoExcluirClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
    if ( ShowConfirm('Deseja excluir o ítem selecionado?') ) then
      cdsTabelaItens.Delete;
end;

procedure TfrmGeEntradaEstoque.btnProdutoSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( cdsTabelaItensQTDE.AsCurrency <= 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensPRECOUNIT.AsCurrency <= 0 ) then
    begin
      ShowWarning('Valor unitário inválida.');
      dbValorUnit.SetFocus;
    end
    else
    if ( cdsTabelaItensVALOR_IPI.AsCurrency < 0 ) then
    begin
      ShowWarning('Valor IPI inválida.');
      dbValorIPIProduto.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      if ( btnProdutoInserir.Visible and btnProdutoInserir.Enabled ) then
        btnProdutoInserir.SetFocus;

    end;
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnSalvarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da compra.')
  else
  begin
    inherited;

    if ( not OcorreuErro ) then
    begin
      if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
        cdsTabelaItens.Post;
      cdsTabelaItens.ApplyUpdates;
      CommitTransaction;
    end;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeEntradaEstoque.ControlEditExit(Sender: TObject);
begin
  inherited;

  if ( Sender = dbCFOPNF ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      CarregarDadosCFOP( IbDtstTabelaNFCFOP.AsInteger );

  if ( Sender = dbProduto ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      CarregarDadosProduto( cdsTabelaItensCODPROD.AsInteger );

  if ( Sender = dbQuantidade ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      cdsTabelaItensQTDEFINAL.Value := cdsTabelaItensQTDEANTES.Value + cdsTabelaItensQTDE.Value;

  if ( (Sender = dbValorUnit) or (Sender = dbValorIPIProduto) ) then
  begin
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensCUSTOMEDIO.AsCurrency  := cdsTabelaItensPRECOUNIT.AsCurrency + cdsTabelaItensVALOR_IPI.AsCurrency;
      cdsTabelaItensTOTAL_BRUTO.AsCurrency := cdsTabelaItensPRECOUNIT.AsCurrency * cdsTabelaItensQTDE.AsCurrency;

      if ( IbDtstTabelaTOTALPROD.AsCurrency > 0 ) then
      begin
        cdsTabelaItensPERC_PARTICIPACAO.AsCurrency := cdsTabelaItensTOTAL_BRUTO.AsCurrency / IbDtstTabelaTOTALPROD.AsCurrency * 100;
        cdsTabelaItensVALOR_FRETE.Value        := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaFRETE.Value / 100;
        cdsTabelaItensVALOR_DESCONTO.Value     := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaDESCONTO.Value / 100;
        cdsTabelaItensVALOR_OUTROS.Value       := cdsTabelaItensPERC_PARTICIPACAO.Value * IbDtstTabelaOUTROSCUSTOS.Value / 100;

        cdsTabelaItensTOTAL_LIQUIDO.AsCurrency := cdsTabelaItensCUSTOMEDIO.AsCurrency * cdsTabelaItensQTDE.AsCurrency;
      end;
    end;
  end;

  if ( Sender = dbTotalBruto ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;

end;

procedure TfrmGeEntradaEstoque.pgcGuiasChange(Sender: TObject);
begin
  AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
end;

procedure TfrmGeEntradaEstoque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;
  
  if ( IbDtstTabelaSTATUS.AsInteger > STATUS_CMP_ABR ) then
  begin
    Case IbDtstTabelaSTATUS.AsInteger of
      STATUS_CMP_FIN : sMsg := 'Esta entrada não pode ser alterada porque está finalizada.';
      STATUS_CMP_CAN : sMsg := 'Esta entrada não pode ser alterada porque está cancelada';
      STATUS_CMP_NFE : sMsg := 'Esta entrada não pode ser alterada porque exite Nota Fiscal gerada para este movimento.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.dbProdutoButtonClick(Sender: TObject);
var
  iCodigo  ,
  iCFOP    ,
  iUnidade : Integer;
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
  cPercRedBC    : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    if ( SelecionarProdutoParaEntrada(Self, iCodigo, sCodigoAlfa, sDescricao, sUnidade, sNCM_SH, sCST, iUnidade, iCFOP,
      cAliquota, cAliquotaPIS, cAliquotaCOFINS, cValorVenda, cValorPromocao, cValorIPI, cPercRedBC, iEstoque, iReserva) ) then
    begin
      cdsTabelaItensCODPROD.AsString     := sCodigoAlfa;
      cdsTabelaItensDESCRI.AsString      := sDescricao;
      cdsTabelaItensUNP_SIGLA.AsString   := sUnidade;

      cdsTabelaItensNCM_SH.AsString                  := sNCM_SH;
      cdsTabelaItensCST.AsString                     := sCST;
      cdsTabelaItensALIQUOTA.AsCurrency              := cAliquota;
      cdsTabelaItensALIQUOTA_PIS.AsCurrency          := cAliquotaPIS;
      cdsTabelaItensALIQUOTA_COFINS.AsCurrency       := cAliquotaCOFINS;
      cdsTabelaItensPERCENTUAL_REDUCAO_BC.AsCurrency := cPercRedBC;

      if ( (qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString) <> EmptyStr ) then
        cdsTabelaItensCST.AsString := Trim(qryCFOP.FieldByName('Cfop_cst_padrao_entrada').AsString);

      if ( iUnidade > 0 ) then
        cdsTabelaItensUNID_COD.AsInteger := iUnidade;
    end;
end;

procedure TfrmGeEntradaEstoque.cdsTabelaItensNewRecord(DataSet: TDataSet);
begin
  cdsTabelaItensANO.Value        := IbDtstTabelaANO.Value;
  cdsTabelaItensCODCONTROL.Value := IbDtstTabelaCODCONTROL.Value;
  cdsTabelaItensDTENT.Value      := IbDtstTabelaDTENT.Value;
  cdsTabelaItensCODEMP.Value     := IbDtstTabelaCODEMP.Value;
  cdsTabelaItensCODFORN.Value    := IbDtstTabelaCODFORN.Value;
  cdsTabelaItensNF.Value         := IbDtstTabelaNF.Value;
  cdsTabelaItensSEQ.Value        := cdsTabelaItens.RecordCount + 1;

  if ( IbDtstTabelaNFCFOP.IsNull ) then
    cdsTabelaItensCFOP.Value := GetCfopIDDefault
  else
    cdsTabelaItensCFOP.Assign( IbDtstTabelaNFCFOP );

  cdsTabelaItensQTDE.Value      := 0;
  cdsTabelaItensQTDEANTES.Value := 0;
  cdsTabelaItensQTDEFINAL.Value := 0;

  cdsTabelaItensALIQUOTA.Value              := 0.0;
  cdsTabelaItensALIQUOTA_CSOSN.Value        := 0.0;
  cdsTabelaItensALIQUOTA_PIS.Value          := 0.0;
  cdsTabelaItensALIQUOTA_COFINS.Value       := 0.0;
  cdsTabelaItensPERCENTUAL_REDUCAO_BC.Value := 0.0;
end;

procedure TfrmGeEntradaEstoque.btbtnFinalizarClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  RecarregarRegistro;

  IbDtstTabela.Edit;

  if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar o fornecedor');
    dbFornecedor.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALPROD.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total de Produtos');
    dbTotalProduto.SetFocus;
  end
  else
  if ( IbDtstTabelaTOTALNF.AsCurrency = 0 ) then
  begin
    ShowWarning('Favor informar valor Total da Nota Fiscal');
    dbTotalNotaFiscal.SetFocus;
  end
  else
  if ( IbDtstTabelaFORMAPAGTO_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar a forma de pagamento');
    dbFormaPagto.SetFocus;
  end
  else
  if ( IbDtstTabelaCONDICAOPAGTO_COD.AsInteger = 0 ) then
  begin
    ShowWarning('Favor informar a condição de pagamento');
    dbCondicaoPagto.SetFocus;
  end
  else
  if ( ShowConfirm('Confirma a finalização da entrada selecionada?') ) then
  begin
    IbDtstTabelaSTATUS.Value               := STATUS_CMP_FIN;
    IbDtstTabelaDTFINALIZACAO_COMPRA.Value := Now;
    IbDtstTabela.Post;
    IbDtstTabela.ApplyUpdates;
    CommitTransaction;

    GerarDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    ShowInformation('Entrada finalizada com sucesso !');

    if ( DuplicatasConfirmadas(Self, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, IbDtstTabelaTOTALNF.AsCurrency) ) then
      AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeEntradaEstoque.GerarDuplicatas(const AnoCompra: Smallint;
  const ControleCompra: Integer);
begin
  try

    try

      UpdateSequence('GEN_CONTAPAG_NUM_' + IntToStr(AnoCompra), 'TBCONTPAG', 'NUMLANC', 'where ANOLANC = ' + IntToStr(AnoCompra));

      with IbStrPrcGerarDuplicatas do
      begin
        ParamByName('anocompra').AsInteger := AnoCompra;
        ParamByName('numcompra').AsInteger := ControleCompra;
        ExecProc;
        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar gerar duplicatas.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeEntradaEstoque.qryDuplicatasCalcFields(DataSet: TDataSet);
begin
  qryDuplicatasLancamento.AsString := FormatFloat('0000', qryDuplicatasANOLANC.AsInteger) + FormatFloat('000000', qryDuplicatasNUMLANC.AsInteger);
end;

procedure TfrmGeEntradaEstoque.btnRegerarDuplicataClick(Sender: TObject);
begin
  if ( IbDtstTabelaSTATUS.AsInteger <> STATUS_CMP_FIN ) then
    ShowWarning('É permitida a geração de duplicatas apenas para entradas finalizadas')
  else
  if ( not qryDuplicatas.IsEmpty ) then
    ShowWarning('Já existe(m) duplicata(s) gerado(s) para esta entrada')
  else
  if ( ShowConfirm('Confirma geração do(s) duplicata(s) a receber da entrada?') ) then
  begin
    GerarDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
    AbrirTabelaDuplicatas( IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger );
  end;
end;

procedure TfrmGeEntradaEstoque.dbCFOPNFButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCFOP(Self, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaNFCFOP.AsInteger        := iCodigo;
      IbDtstTabelaCFOP_DESCRICAO.AsString := sDescricao;
    end;
end;

procedure TfrmGeEntradaEstoque.CarregarDadosCFOP(iCodigo: Integer);
begin
  if ( not IbDtstTabela.Active ) then
    Exit
  else
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    with qryCFOP do
    begin
      Close;
      ParamByName('Cfop_cod').AsInteger := iCodigo;
      Open;
      if not IsEmpty then
        IbDtstTabelaCFOP_DESCRICAO.AsString := FieldByName('cfop_descricao').AsString
      else
      begin
        ShowWarning('Código CFOP não cadastrado');
        IbDtstTabelaNFCFOP.Clear;
        if ( dbCFOPNF.Visible and dbCFOPNF.Enabled ) then
          dbCFOPNF.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeEntradaEstoque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;

  DtSrcTabelaItens.AutoEdit := DtSrcTabela.AutoEdit and (IbDtstTabelaSTATUS.AsInteger < STATUS_CMP_FIN );
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeEntradaEstoque.btbtnCancelarENTClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;
(*
  if ( PossuiTitulosPagos(IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) ) then
  begin
    ShowWarning('A compra possui despesa(s) já baixada(s).' + #13 + 'Favor providenciar a exclusão da(s) baixa(s) para que a compra possa ser cancelada!');
    Exit;
  end;
*)
  RecarregarRegistro;

  if ( CancelarENT(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value) ) then
    with IbDtstTabela do
    begin
      RecarregarRegistro;

      ShowInformation('Entrada cancelada com sucesso.' + #13#13 + 'Ano/Controle: ' + IbDtstTabelaANO.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaCODCONTROL.AsInteger));

      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeEntradaEstoque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Movimento de Entrada Aberto
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_ABR ) then
      dbgDados.Canvas.Font.Color := lblEntradaAberta.Font.Color
    else
    // Destacar Movimento de Entrada Cancelado
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_CMP_CAN ) then
      dbgDados.Canvas.Font.Color := lblEntradaCancelada.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeEntradaEstoque.btbtnGerarNFeClick(Sender: TObject);
var
  iNumero    ,
  iSerieNFe  ,
  iNumeroNFe : Integer;
  sFileNameXML ,
  sChaveNFE    ,
  sProtocoloNFE,
  sReciboNFE   : String;
  iNumeroLote  : Int64;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not DMNFe.GetValidadeCertificado then
    Exit;

  RecarregarRegistro;
    
  if ( IbDtstTabelaLOTE_NFE_NUMERO.AsInteger > 0 ) then
  begin
    ShowWarning('O processo de geração de NF-e para esta venda já foi solicitado, mas não fora concluído.' + #13 +
      'Favor consultar junto a SEFA e processar o Recibo/Lote de número ' +
        IbDtstTabelaLOTE_NFE_RECIBO.AsString + '/' +
        FormatFloat('#########0', IbDtstTabelaLOTE_NFE_NUMERO.AsInteger));
    Exit;  
  end;

  if ( GerarNFeEntrada(Self, IbDtstTabelaANO.Value, IbDtstTabelaCODCONTROL.Value,
                iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote
  ) ) then
    with IbDtstTabela do
    begin
      iNumero := IbDtstTabelaCODCONTROL.AsInteger;

      with qryNFE do
      begin
        Close;
        ParamByName('empresa').AsString    := IbDtstTabelaCODEMP.AsString;
        ParamByName('anoCompra').AsInteger := IbDtstTabelaANO.Value;
        ParamByName('numCompra').AsInteger := IbDtstTabelaCODCONTROL.Value;
        Open;

        Append;

        qryNFEEMPRESA.Value     := IbDtstTabelaCODEMP.AsString;
        qryNFEANOCOMPRA.Value   := IbDtstTabelaANO.Value;
        qryNFENUMCOMPRA.Value   := IbDtstTabelaCODCONTROL.Value;
        qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
        qryNFENUMERO.Value      := iNumeroNFe;
        qryNFEDATAEMISSAO.Value := GetDateDB;
        qryNFEHORAEMISSAO.Value := GetTimeDB;
        qryNFECHAVE.Value     := sChaveNFE;
        qryNFEPROTOCOLO.Value := sProtocoloNFE;
        qryNFERECIBO.Value    := sReciboNFE;
        qryNFELOTE_ANO.Value  := IbDtstTabelaANO.Value;
        qryNFELOTE_NUM.Value  := iNumeroLote;

        if ( FileExists(sFileNameXML) ) then
        begin
          CorrigirXML_NFe(sFileNameXML);

          qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
          qryNFEXML_FILE.LoadFromFile( sFileNameXML );
        end;

        Post;
        ApplyUpdates;

        CommitTransaction;
      end;

      IbDtstTabela.Close;
      IbDtstTabela.Open;

      IbDtstTabela.Locate(CampoCodigo, iNumero, []);

      ShowInformation('Nota Fiscal de Entrada gerada com sucesso.' + #13#13 + 'Série/Número: ' + IbDtstTabelaNFSERIE.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaNF.Value));

      HabilitarDesabilitar_Btns;

      nmImprimirDANFE.Click;
    end;
end;

procedure TfrmGeEntradaEstoque.btbtnListaClick(Sender: TObject);
begin
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeEntradaEstoque.nmImprimirDANFEClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  isPDF := ( Sender = nmGerarDANFEXML );

  DMNFe.ImprimirDANFEEntradaACBr( IbDtstTabelaCODEMP.AsString, IbDtstTabelaCODFORN.AsInteger, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, isPDF);
end;

procedure TfrmGeEntradaEstoque.nmGerarDANFEXMLClick(Sender: TObject);
var
  isPDF : Boolean;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  isPDF := ( Sender = nmGerarDANFEXML );

  DMNFe.ImprimirDANFEEntradaACBr( IbDtstTabelaCODEMP.AsString, IbDtstTabelaCODFORN.AsInteger, IbDtstTabelaANO.AsInteger, IbDtstTabelaCODCONTROL.AsInteger, isPDF);
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  if ( not (IbDtstTabela.State in [dsEdit, dsInsert]) ) then
  begin
    qryCFOP.Close;
    qryCFOP.ParamByName('Cfop_cod').AsInteger := IbDtstTabelaNFCFOP.AsInteger;
    qryCFOP.Open;
  end;
end;

procedure TfrmGeEntradaEstoque.dbAutorizacaoButtonClick(Sender: TObject);
{$IFNDEF DGE}
var
  iAno    ,
  iCodigo : Integer;
  sEmpresa : String;
  dDataInicial : TDateTime;
{$ENDIF}
begin
{$IFNDEF DGE}
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    if ( IbDtstTabelaCODFORN.AsInteger = 0 ) then
    begin
      ShowInformation('Favor selecionar o Fornecedor primeiramente!');
      dbFornecedor.SetFocus;
    end
    else
    begin
      { DONE -oIsaque -cEntrada : 22/05/2014 - Gerar Data Inicial padrão para busca de Autorizações de Compras }

      dDataInicial := StrToDateTime('01/' + FormatDateTime('mm/yyyy', GetDateDB));
      if ( (GetDateDB - dDataInicial) < 7 ) then
        dDataInicial := GetDateDB - 7;

      if ( SelecionarAutorizacao(Self, IbDtstTabelaCODFORN.AsInteger, dDataInicial, iAno, iCodigo, sEmpresa) ) then
      begin
        IbDtstTabelaAUTORIZACAO_ANO.AsInteger    := iAno;
        IbDtstTabelaAUTORIZACAO_CODIGO.AsInteger := iCodigo;
        IbDtstTabelaAUTORIZACAO_EMPRESA.AsString := sEmpresa;
      end;
    end
  end;
{$ENDIF}
end;

procedure TfrmGeEntradaEstoque.IbDtstTabelaAUTORIZACAO_CODIGOGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
{$IFNDEF DGE}
  if not Sender.IsNull then
    Text := FormatFloat('###0000000"/"', Sender.AsInteger) + Copy(IbDtstTabelaAUTORIZACAO_ANO.AsString, 3, 2);
{$ENDIF}
end;

procedure TfrmGeEntradaEstoque.RecarregarRegistro;
var
  iAno ,
  iCod : Integer;
  sID : String;
begin
  { DONE -oIsaque -cEntrada : 22/05/2014 - Rotina de busca dos dados atualizados dos registros antes de qualquer manipulação }

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaCODCONTROL.AsString;

  if ( sID <> EmptyStr ) then
  begin
    iAno := IbDtstTabelaANO.AsInteger;
    iCod := IbDtstTabelaCODCONTROL.AsInteger;

    if ( not IbDtstTabelaDTEMISS.IsNull ) then
    begin
      if ( IbDtstTabelaDTEMISS.AsDateTime < e1Data.Date ) then
        e1Data.Date := IbDtstTabelaDTEMISS.AsDateTime;

      if ( IbDtstTabelaDTEMISS.AsDateTime > e2Data.Date ) then
        e2Data.Date := IbDtstTabelaDTEMISS.AsDateTime;
    end;

    IbDtstTabela.Close;
    IbDtstTabela.Open;
    IbDtstTabela.Locate('CODCONTROL', sID, []);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeEntradaEstoque', TfrmGeEntradaEstoque);

end.
