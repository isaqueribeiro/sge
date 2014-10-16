unit UGeFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RxLookup, IBTable, IBQuery, RXDBCtrl, frxClass,
  frxDBSet, Menus, DBClient, Provider, ACBrBase, ACBrExtenso;

type
  TfrmGeFluxoCaixa = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    lblContaCorrentePesq: TLabel;
    edContaCorrentePesq: TRxLookupEdit;
    tblContaCorrente: TIBTable;
    dtsContaCorrente: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaCAIXA_ANO: TSmallintField;
    IbDtstTabelaCAIXA_NUM: TIntegerField;
    IbDtstTabelaCONTA_CORRENTE: TIntegerField;
    IbDtstTabelaFORMA_PAGTO: TSmallintField;
    IbDtstTabelaDATAHORA: TDateTimeField;
    IbDtstTabelaTIPO: TIBStringField;
    IbDtstTabelaHISTORICO: TIBStringField;
    IbDtstTabelaVALOR: TIBBCDField;
    IbDtstTabelaSITUACAO: TSmallintField;
    IbDtstTabelaVENDA_ANO: TSmallintField;
    IbDtstTabelaVENDA_NUM: TIntegerField;
    IbDtstTabelaCLIENTE: TIBStringField;
    IbDtstTabelaCOMPRA_ANO: TSmallintField;
    IbDtstTabelaCOMPRA_NUM: TIntegerField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaUSUARIO: TIBStringField;
    pnlConsolidacao: TPanel;
    Bevel5: TBevel;
    IbDtstTabelaFORMA_PAGTO_DESC: TIBStringField;
    IbDtstTabelaNOME_CLENTE: TIBStringField;
    IbDtstTabelaNOME_FORNECEDOR: TIBStringField;
    IbDtstTabelaVALOR_CREDITO: TIBBCDField;
    IbDtstTabelaVALOR_DEBITO: TIBBCDField;
    IbDtstTabelaDATA: TDateField;
    IbDtstTabelaHORA: TTimeField;
    IbDtstTabelaVENDA: TIBStringField;
    IbDtstTabelaTITULO: TIBStringField;
    IbDtstTabelaCOMPRA: TIBStringField;
    IbDtstTabelaDUPLICATA: TIBStringField;
    qrySaldosDias: TIBQuery;
    dtsSaldosDias: TDataSource;
    pnlSaldosDias: TPanel;
    Panel1: TPanel;
    dbLContaCorrente: TDBText;
    Bevel6: TBevel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    dbLDataFinal: TDBText;
    BvDataFinal: TBevel;
    dbLDataInicial: TDBText;
    Bevel9: TBevel;
    dbLDataAnterior: TDBText;
    Bevel10: TBevel;
    Panel5: TPanel;
    dbLSaldoFinal: TDBText;
    BvSaldoFinal: TBevel;
    dbLSaldoInicial: TDBText;
    Bevel12: TBevel;
    dbLSaldoAnterior: TDBText;
    Bevel13: TBevel;
    qrySaldosDiasSALDO_ANTERIOR_DATA: TDateField;
    qrySaldosDiasSALDO_ANTERIOR_VALOR: TIBBCDField;
    qrySaldosDiasSALDO_INICIAL_DATA: TDateField;
    qrySaldosDiasSALDO_INICIAL_VALOR: TIBBCDField;
    qrySaldosDiasSALDO_FINAL_DATA: TDateField;
    qrySaldosDiasSALDO_FINAL_VALOR: TIBBCDField;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    lblDataMov: TLabel;
    dbDataMov: TDBDateEdit;
    dbTipo: TDBLookupComboBox;
    lblTipo: TLabel;
    dbContaCorrente: TDBLookupComboBox;
    lblContaCorrente: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblMovCaixaCancelado: TLabel;
    tblTipoMovimento: TIBTable;
    dtsTipoMovimento: TDataSource;
    lblCaixa: TLabel;
    d1Caixa: TDBEdit;
    d2Caixa: TDBEdit;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    GrpBxCreditoDebito: TGroupBox;
    lblHistorico: TLabel;
    dbHistorico: TDBEdit;
    dbValorMov: TDBEdit;
    lblValorMov: TLabel;
    lblCliente: TLabel;
    dbCliente: TRxDBComboEdit;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblVenda: TLabel;
    dbVenda: TDBEdit;
    lblTitulo: TLabel;
    dbTitulo: TDBEdit;
    lblCompra: TLabel;
    dbCompra: TDBEdit;
    dbDuplicata: TDBEdit;
    lblDuplicata: TLabel;
    GrbBxObs: TGroupBox;
    memObservacoes: TMemo;
    Bevel7: TBevel;
    Bevel11: TBevel;
    Bevel18: TBevel;
    lblUsuario: TLabel;
    dbUsuario: TDBEdit;
    IbDtstTabelaSITUACAO_CAIXA: TSmallintField;
    IbDtstTabelaDATA_FECH: TDateField;
    IbDtstTabelaDATA_CANCEL: TDateField;
    qryConsolidadoFormaPagto: TIBQuery;
    dtsConsolidadoFormaPagto: TDataSource;
    qryConsolidadoFormaPagtoDATA: TDateField;
    qryConsolidadoFormaPagtoFORMA_PAGTO_DESC: TIBStringField;
    qryConsolidadoFormaPagtoSALDO: TIBBCDField;
    qryConsolidadoFormaPagtoENTRADA: TIBBCDField;
    qryConsolidadoFormaPagtoSAIDA: TIBBCDField;
    Panel6: TPanel;
    DBText1: TDBText;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Panel7: TPanel;
    dbgConsolidadoFormaPagto: TDBGrid;
    qryConsolidadoFormaPagtoSaldoDisplay: TStringField;
    qryConsolidadoFormaPagtoFORMA_PAGTO: TIntegerField;
    qryFluxoSintetico: TIBQuery;
    frdFluxoSintetico: TfrxDBDataset;
    frdFluxoAnalitico: TfrxDBDataset;
    qryFluxoAnalitico: TIBQuery;
    frrFluxoAnalitico: TfrxReport;
    qryFluxoSaldos: TIBQuery;
    frdFluxoSaldos: TfrxDBDataset;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    qryTpDespesa: TIBQuery;
    dtsTpDespesa: TDataSource;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    IbDtstTabelaTIPO_DESPESA: TSmallintField;
    IbDtstTabelaCLIENTE_COD: TIntegerField;
    ppImprimir: TPopupMenu;
    nmImprimirExtrato: TMenuItem;
    nmImprimirRecibo: TMenuItem;
    FrRecibo: TfrxReport;
    FrdRecibo: TfrxDBDataset;
    ACBrExtenso: TACBrExtenso;
    QryRecibo: TIBQuery;
    DspRecibo: TDataSetProvider;
    CdsRecibo: TClientDataSet;
    CdsReciboANO: TSmallintField;
    CdsReciboNUMERO: TIntegerField;
    CdsReciboTIPO: TStringField;
    CdsReciboNUMERO_RECIBO: TStringField;
    CdsReciboANOLANC: TSmallintField;
    CdsReciboNUMLANC: TIntegerField;
    CdsReciboPARCELA: TSmallintField;
    CdsReciboNOMEEMP: TStringField;
    CdsReciboCODFORN: TIntegerField;
    CdsReciboNOMEFORN: TStringField;
    CdsReciboPESSOA_FISICA: TSmallintField;
    CdsReciboCNPJ: TStringField;
    CdsReciboNOTFISC: TStringField;
    CdsReciboTIPPAG: TStringField;
    CdsReciboDTEMISS: TDateField;
    CdsReciboDTVENC: TDateField;
    CdsReciboDTPAG: TDateField;
    CdsReciboVALORPAG: TBCDField;
    CdsReciboBANCO: TIntegerField;
    CdsReciboBCO_NOME: TStringField;
    CdsReciboNUMCHQ: TStringField;
    CdsReciboPAGO_: TStringField;
    CdsReciboDOCBAIX: TStringField;
    CdsReciboQUITADO: TIntegerField;
    CdsReciboCODTPDESP: TSmallintField;
    CdsReciboSEQ: TIntegerField;
    CdsReciboDATA_PAGTO: TDateField;
    CdsReciboFORMA_PAGTO: TSmallintField;
    CdsReciboFORMA_PAGTO_DESC: TStringField;
    CdsReciboHISTORICO: TStringField;
    CdsReciboVALOR_BAIXA: TBCDField;
    CdsReciboVALOR_BAIXA_EXTENSO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edContaCorrentePesqChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaSITUACAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure qryConsolidadoFormaPagtoCalcFields(DataSet: TDataSet);
    procedure btbtnListaClick(Sender: TObject);
    procedure frrFluxoAnaliticoGetValue(const VarName: String;
      var Value: Variant);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure nmImprimirExtratoClick(Sender: TObject);
    procedure nmImprimirReciboClick(Sender: TObject);
    procedure FrReciboGetValue(const VarName: String; var Value: Variant);
    procedure CdsReciboCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    sGeneratorName : String;
    procedure CarregarSaldos;
    procedure DefinirControle;

    function BloquearAlteracaoExclusao : Boolean;
  public
    { Public declarations }
  end;

var
  frmGeFluxoCaixa: TfrmGeFluxoCaixa;

  procedure MostrarTabelaFluxoCaixas(const AOwner : TComponent);

const
  TIPO_MOVIMENTO_CREDITO = 'C';
  TIPO_MOVIMENTO_DEBITO  = 'D';

implementation

uses DateUtils, UDMBusiness, UGeCliente, UGeFornecedor, UGeCaixa, UDMNFe, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaFluxoCaixas(const AOwner : TComponent);
var
  frm : TfrmGeFluxoCaixa;
  whr : String;
begin
  frm := TfrmGeFluxoCaixa.Create(AOwner);
  try
    whr := '(m.Empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and ' +
      '(cast(m.Datahora as date) between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and '  +
      QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ') and ' +
      'm.Conta_corrente = ' + IntToStr( frm.tblContaCorrente.FieldByName('Codigo').AsInteger );

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.CarregarSaldos;
    
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFluxoCaixa.FormCreate(Sender: TObject);
begin
(*
  IMR - 14/10/2014 :
    Bloco de códigos referentes a propriedade GeneratorField do dataset descontinuado por está gerando erro e campo não localizado.
*)
  sGeneratorName := 'GEN_CX_MOVIMENTO_' + FormatFloat('0000', YearOf(GetDateDB));

  inherited;

//  SQL_Consolidado := TStringList.Create;
//  SQL_Consolidado.Clear;
//  SQL_Consolidado.AddStrings( cdsCosolidado.SelectSQL );
//
//  SQL_Movimento := TStringList.Create;
//  SQL_Movimento.Clear;
//  SQL_Movimento.AddStrings( qryMovimento.SelectSQL );
//
//  SQL_CaixaSintetico := TStringList.Create;
//  SQL_CaixaSintetico.Clear;
//  SQL_CaixaSintetico.AddStrings( qryCaixaSintetico.SQL );
//
//  SQL_CaixaAnalitico := TStringList.Create;
//  SQL_CaixaAnalitico.Clear;
//  SQL_CaixaAnalitico.AddStrings( qryCaixaAnalitico.SQL );
//
  e1Data.Date := Date;
  e2Data.Date := Date;
  ControlFirstEdit := dbDataMov;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblTipoMovimento.Open;
  qryTpDespesa.Open;

  tblContaCorrente.Filter   := 'cnpj = ' + QuotedStr(GetEmpresaIDDefault);
  tblContaCorrente.Filtered := True;
  tblContaCorrente.Open;

  if ( not tblContaCorrente.IsEmpty ) then
    edContaCorrentePesq.LookupValue := tblContaCorrente.FieldByName('Codigo').AsString;

  RotinaID            := ROTINA_FIN_TESOURARIA_ID;
  DisplayFormatCodigo := '###0000000';
  ControlFirstEdit    := dbDataMov;
  
  NomeTabela     := 'TBCAIXA_MOVIMENTO';
  CampoCodigo    := 'm.Numero';
  CampoDescricao := 'm.Historico';
  CampoOrdenacao := 'm.Ano, m.Numero';
(*
  with IbDtstTabela, GeneratorField do
  begin
    Field       := CampoCodigo;
    Generator   := sGeneratorName;
    IncrementBy := 1;
  end;
*)
  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );
//
//  FAbrirCaixa  := False;
//  FFecharCaixa := False;
end;

procedure TfrmGeFluxoCaixa.edContaCorrentePesqChange(Sender: TObject);
begin
  if ( not tblContaCorrente.IsEmpty ) then
    tblContaCorrente.Locate('Descricao_FULL', edContaCorrentePesq.EditText, []);
end;

procedure TfrmGeFluxoCaixa.btnFiltrarClick(Sender: TObject);
var
  Data : TDateTime;
begin
  with tblContaCorrente do
  begin

    if not Locate('Descricao_FULL', edContaCorrentePesq.EditText, []) then
    begin
      ShowWarning('Favor selecionar Conta Corrente para pesquisa!');
      Abort;
    end;

    WhereAdditional := '(m.Empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and ' +
      '(cast(m.Datahora as date) between '  +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and '  +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ') and ' +
      'm.Conta_corrente = ' + IntToStr( FieldByName('Codigo').AsInteger );

    // Recalcular Saldo da Conta Corrente
    if ( FieldByName('Codigo').AsInteger > 0 ) then
    begin
      Data := e1Data.Date;
      while Data <= e2Data.Date do
      begin
        GerarSaldoContaCorrente(FieldByName('Codigo').AsInteger, Data);
        Data := Data + 1;
      end;
    end;

  end;

  CarregarSaldos;

  inherited;
end;

procedure TfrmGeFluxoCaixa.CarregarSaldos;
begin
  dbLDataFinal.Visible  := (e1Data.Date <> e2Data.Date);
  BvDataFinal.Visible   := (e1Data.Date <> e2Data.Date);

  dbLSaldoFinal.Visible := (e1Data.Date <> e2Data.Date);
  BvSaldoFinal.Visible  := (e1Data.Date <> e2Data.Date);

  with qrySaldosDias do
  begin
    Close;
    ParamByName('Conta').AsInteger    := tblContaCorrente.FieldByName('Codigo').AsInteger;
    ParamByName('DataInicial').AsDate := e1Data.Date;
    ParamByName('DataFinal').AsDate   := e2Data.Date;
    Open;
  end;

  with qryConsolidadoFormaPagto do
  begin
    Close;
    ParamByName('Conta_Corrente').AsInteger := tblContaCorrente.FieldByName('Codigo').AsInteger;
    ParamByName('Data_Inicial').AsDate := e1Data.Date;
    ParamByName('Data_Final').AsDate   := e2Data.Date;
    Open;
  end;
end;

procedure TfrmGeFluxoCaixa.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.Value  := GetEmpresaIDDefault;
  IbDtstTabelaANO.Value      := YearOf(GetDateTimeDB);
  IbDtstTabelaDATAHORA.Value := GetDateTimeDB;
  IbDtstTabelaSITUACAO.Value := 1;
  IbDtstTabelaTIPO.Value     := TIPO_MOVIMENTO_CREDITO;
  IbDtstTabelaUSUARIO.Value  := GetUserApp;
  IbDtstTabelaDATA.Value     := GetDateDB;
  IbDtstTabelaHORA.Value     := GetTimeDB;

  IbDtstTabelaTIPO_DESPESA.Clear;
  IbDtstTabelaCLIENTE.Clear;
  IbDtstTabelaCLIENTE_COD.Clear;
  IbDtstTabelaFORNECEDOR.Clear;
  IbDtstTabelaFORMA_PAGTO.Clear;

  IbDtstTabelaFORMA_PAGTO_DESC.Clear;
  IbDtstTabelaNOME_CLENTE.Clear;
  IbDtstTabelaNOME_FORNECEDOR.Clear;
  IbDtstTabelaVALOR_CREDITO.Clear;
  IbDtstTabelaVALOR_DEBITO.Clear;
  IbDtstTabelaVENDA.Clear;
  IbDtstTabelaTITULO.Clear;
  IbDtstTabelaCOMPRA.Clear;
  IbDtstTabelaDUPLICATA.Clear;
end;

procedure TfrmGeFluxoCaixa.IbDtstTabelaSITUACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    0 : Text := 'Cancelado';
    1 : Text := 'Confirmado';
  end;
end;

procedure TfrmGeFluxoCaixa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Movimentos de Caixas Cancelados
    if ( IbDtstTabelaSITUACAO.AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := lblMovCaixaCancelado.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  if ( Sender = dbgConsolidadoFormaPagto ) then
  begin
    ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
    //ShowScrollBar(TDBGrid(Sender).Handle, SB_VERT, False);
  end;
end;

procedure TfrmGeFluxoCaixa.DefinirControle;
begin
  memObservacoes.Lines.Clear;

  if ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_CREDITO ) then
  begin
    lblCliente.Enabled := True;
    dbCliente.Enabled  := True;
    lblFornecedor.Enabled  := False;
    dbFornecedor.Enabled   := False;
    lblTipoDespesa.Enabled := False;
    dbTipoDespesa.Enabled  := False;
  end
  else
  if ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_DEBITO ) then
  begin
    lblCliente.Enabled := False;
    dbCliente.Enabled  := False;
    lblFornecedor.Enabled  := True;
    dbFornecedor.Enabled   := True;
    lblTipoDespesa.Enabled := True;
    dbTipoDespesa.Enabled  := True;
  end;

  if ( IbDtstTabelaVENDA_ANO.AsInteger > 0 ) then
  begin
    memObservacoes.Lines.Add(
      'Movimento de fluxo de caixa relacionada a VENDA CONFIRMADA de No. ' + IbDtstTabelaVENDA.AsString +
      '. Este tipo de movimento não poderá ser alterado e nem excluído, com isso a única forma de seu ' +
      'valor não ser considerado para o cálculo do saldo diário da conta corrente é CANCELAR A VENDA '  +
      'responsável por este movimento.');
  end
  else
  if ( IbDtstTabelaCOMPRA_ANO.AsInteger > 0 ) then
  begin
    memObservacoes.Lines.Add(
      'Movimento de fluxo de caixa relacionada a COMPRA CONFIRMADA de No. ' + IbDtstTabelaCOMPRA.AsString +
      '. Este tipo de movimento não poderá ser alterado e nem excluído, com isso a única forma de seu '   +
      'valor não ser considerado para o cálculo do saldo diário da conta corrente é CANCELAR A COMPRA '   +
      'responsável por este movimento.');
  end;
end;

procedure TfrmGeFluxoCaixa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    DefinirControle;
end;

procedure TfrmGeFluxoCaixa.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = IbDtstTabela.FieldByName('TIPO') ) then
    DefinirControle;
end;

procedure TfrmGeFluxoCaixa.pgcGuiasChange(Sender: TObject);
begin
  DefinirControle;
end;

procedure TfrmGeFluxoCaixa.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaCLIENTE_COD.AsInteger := iCodigo;
      IbDtstTabelaCLIENTE.AsString      := sCNPJ;
      IbDtstTabelaNOME_CLENTE.AsString  := sNome;
    end;
end;

procedure TfrmGeFluxoCaixa.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarFornecedor(Self, iCodigo, sNome) ) then
    begin
      IbDtstTabelaFORNECEDOR.AsInteger     := iCodigo;
      IbDtstTabelaNOME_FORNECEDOR.AsString := sNome;
    end;
end;

procedure TfrmGeFluxoCaixa.btbtnSalvarClick(Sender: TObject);
var
  CxAno,
  CxNumero,
  CxContaCorrente : Integer;
begin
  IbDtstTabelaCLIENTE.Required      := ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_CREDITO );
  IbDtstTabelaFORNECEDOR.Required   := ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_DEBITO );
  IbDtstTabelaTIPO_DESPESA.Required := ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_DEBITO );

  if ( CaixaAberto(IbDtstTabelaEMPRESA.AsString, IbDtstTabelaUSUARIO.AsString, IbDtstTabelaDATAHORA.AsDateTime, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
    if ( CxContaCorrente <> IbDtstTabelaCONTA_CORRENTE.AsInteger ) then
    begin
      IbDtstTabelaCAIXA_ANO.Clear;
      IbDtstTabelaCAIXA_NUM.Clear;
    end;

  IbDtstTabelaDATA.Value := IbDtstTabelaDATAHORA.AsDateTime;
  IbDtstTabelaHORA.Value := IbDtstTabelaDATAHORA.AsDateTime;

  if ( IbDtstTabelaVALOR.AsCurrency <= 0 ) then
    IbDtstTabelaVALOR.Clear;
    
  if ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_CREDITO ) then
  begin
    IbDtstTabelaVALOR_CREDITO.Value := IbDtstTabelaVALOR.Value;
    IbDtstTabelaVALOR_DEBITO.Value  := 0.0;
  end
  else
  if ( IbDtstTabelaTIPO.AsString = TIPO_MOVIMENTO_DEBITO ) then
  begin
    IbDtstTabelaVALOR_CREDITO.Value := 0.0;
    IbDtstTabelaVALOR_DEBITO.Value  := IbDtstTabelaVALOR.Value;
  end;

  inherited;

  if ( not OcorreuErro ) then
  begin
    GerarSaldoContaCorrente(IbDtstTabelaCONTA_CORRENTE.AsInteger, IbDtstTabelaDATAHORA.AsDateTime);
    CarregarSaldos;
  end;
end;

procedure TfrmGeFluxoCaixa.ControlEditExit(Sender: TObject);
var
  CxAno,
  CxNumero,
  CxContaCorrente : Integer;
begin
  inherited;

  if ( Sender = dbFormaPagto ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( CaixaAberto(IbDtstTabelaEMPRESA.AsString, IbDtstTabelaUSUARIO.AsString, IbDtstTabelaDATAHORA.AsDateTime, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
      begin
        IbDtstTabelaCONTA_CORRENTE.AsInteger := CxContaCorrente;
        IbDtstTabelaCAIXA_ANO.AsInteger := CxAno;
        IbDtstTabelaCAIXA_NUM.AsInteger := CxNumero;
      end
      else
      begin
        IbDtstTabelaCONTA_CORRENTE.Value := StrToInt(edContaCorrentePesq.LookupValue);
        IbDtstTabelaCAIXA_ANO.Clear;
        IbDtstTabelaCAIXA_NUM.Clear;
      end;
end;

function TfrmGeFluxoCaixa.BloquearAlteracaoExclusao : Boolean;
var
  Return : Boolean;
begin
  Return := False;

  if ( (IbDtstTabelaVENDA_NUM.AsInteger > 0) or (IbDtstTabelaCOMPRA_NUM.AsInteger > 0) ) then
  begin
    DefinirControle;

    ShowWarning('Movimento de Fluxo de Caixa bloqueado para edição ou exclusão!');
    pgcGuias.ActivePage := tbsCadastro;

    Return := True;
  end
  else
  if ( IbDtstTabelaSITUACAO_CAIXA.AsInteger <> STATUS_CAIXA_ABERTO ) then
  begin
    ShowWarning('O Controle de Caixa referente a referente a este movimento não está aberto!');
    Return := True;
  end;

  Result := Return;
end;

procedure TfrmGeFluxoCaixa.btbtnAlterarClick(Sender: TObject);
begin
  if ( BloquearAlteracaoExclusao ) then
    Exit;

  inherited;
end;

procedure TfrmGeFluxoCaixa.btbtnExcluirClick(Sender: TObject);
begin
  if ( BloquearAlteracaoExclusao ) then
    Exit;

  inherited;
end;

procedure TfrmGeFluxoCaixa.qryConsolidadoFormaPagtoCalcFields(
  DataSet: TDataSet);
begin
  if ( qryConsolidadoFormaPagtoFORMA_PAGTO.AsInteger > 0 ) then
    qryConsolidadoFormaPagtoSaldoDisplay.AsString := EmptyStr
  else
    if ( qryConsolidadoFormaPagtoSALDO.AsCurrency >= 0 ) then
      qryConsolidadoFormaPagtoSaldoDisplay.AsString := FormatFloat(',0.00', qryConsolidadoFormaPagtoSALDO.AsCurrency)
    else
      qryConsolidadoFormaPagtoSaldoDisplay.AsString := FormatFloat('"- ",0.00', qryConsolidadoFormaPagtoSALDO.AsCurrency);  
end;

procedure TfrmGeFluxoCaixa.btbtnListaClick(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeFluxoCaixa.frrFluxoAnaliticoGetValue(const VarName: String;
  var Value: Variant);
begin
  inherited;
  if ( VarName = 'Periodo_Desc' ) then
    if ( e1Data.Date = e2Data.Date ) then
      Value := 'D a t a'
    else
      Value := 'P e r í o d o';

  if ( VarName = 'Periodo' ) then
    if ( e1Data.Date = e2Data.Date ) then
      Value := FormatDateTime('dd/mm/yyyy', e1Data.Date)
    else
      Value := FormatDateTime('dd/mm/yyyy', e1Data.Date) + ' a ' + FormatDateTime('dd/mm/yyyy', e2Data.Date);
end;

procedure TfrmGeFluxoCaixa.btbtnIncluirClick(Sender: TObject);
var
  iAno ,
  iNum : Integer;
begin
(*
  IMR - 14/10/2014 :
    Inserção deste bloco de código para substituir a função da propriedade GeneratorField do dataset por está gerando erro de campo não
    localizado.
*)
  iAno := YearOf(GetDateDB);
  iNum := GetGeneratorID(sGeneratorName);

  inherited;

  if ( not OcorreuErro ) then
  begin
    IbDtstTabelaANO.AsInteger        := iAno;
    IbDtstTabelaNUMERO.AsInteger     := iNum;
    IbDtstTabelaCONTA_CORRENTE.Value := StrToInt(edContaCorrentePesq.LookupValue);
  end;
end;


procedure TfrmGeFluxoCaixa.nmImprimirExtratoClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := GetEmpresaIDDefault;
      Open;
    end;

    with qryFluxoSaldos do
    begin
      Close;
      ParamByName('Conta').AsInteger := tblContaCorrente.FieldByName('Codigo').AsInteger;
      ParamByName('DataInicial').AsDateTime  := e1Data.Date;
      ParamByName('DataFinal').AsDateTime    := e2Data.Date;
      Open;
    end;

    with qryFluxoSintetico do
    begin
      Close;
      ParamByName('Conta_Corrente').AsInteger := tblContaCorrente.FieldByName('Codigo').AsInteger;
      ParamByName('Data_Inicial').AsDateTime  := e1Data.Date;
      ParamByName('Data_Final').AsDateTime    := e2Data.Date;
      Open;
    end;

    with qryFluxoAnalitico do
    begin
      Close;
      ParamByName('Conta_Corrente').AsInteger := tblContaCorrente.FieldByName('Codigo').AsInteger;
      ParamByName('Data_Inicial').AsDateTime  := e1Data.Date;
      ParamByName('Data_Final').AsDateTime    := e2Data.Date;
      Open;
    end;

    if ( not qryFluxoAnalitico.IsEmpty ) then
      frrFluxoAnalitico.ShowReport;

  end;
end;

procedure TfrmGeFluxoCaixa.nmImprimirReciboClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with CdsRecibo, Params do
  begin
    Close;
    ParamByName('ano').AsInteger    := IbDtstTabelaANO.AsInteger;
    ParamByName('numero').AsInteger := IbDtstTabelaNUMERO.AsInteger;
    Open;

    if IsEmpty then
      Exit;
  end;

  frReport := FrRecibo;
  SetVariablesDefault(frReport);

  frReport.PrepareReport;
  frReport.ShowReport;
end;

procedure TfrmGeFluxoCaixa.FrReciboGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = VAR_TITLE ) then
    Value := 'RECIBO';

  if ( VarName = VAR_EMPRESA ) then
    Value := GetEmpresaNomeDefault;

  if ( VarName = VAR_USER ) then
    Value := GetUserApp;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;
end;

procedure TfrmGeFluxoCaixa.CdsReciboCalcFields(DataSet: TDataSet);
begin
  CdsReciboVALOR_BAIXA_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsReciboVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
end;

initialization
  FormFunction.RegisterForm('frmGeFluxoCaixa', TfrmGeFluxoCaixa);

end.
