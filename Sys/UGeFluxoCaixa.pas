unit UGeFluxoCaixa;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBX.IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  DBClient, Provider, ACBrBase, ACBrExtenso, frxClass, frxDBSet,
  JvDBControls, DBCtrls, JvExMask, JvToolEdit, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, ComCtrls, cxButtons, ToolWin,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeFluxoCaixa = class(TfrmGrPadraoCadastro)
    lblData: TLabel;
    lblContaCorrentePesq: TLabel;
    dtsContaCorrente: TDataSource;
    dtsFormaPagto: TDataSource;
    pnlConsolidacao: TPanel;
    Bevel5: TBevel;
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
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    lblDataMov: TLabel;
    dbTipo: TDBLookupComboBox;
    lblTipo: TLabel;
    dbContaCorrente: TDBLookupComboBox;
    lblContaCorrente: TLabel;
    dbSituacao: TDBEdit;
    lblSituacao: TLabel;
    lblMovCaixaCancelado: TLabel;
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
    lblFornecedor: TLabel;
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
    dtsConsolidadoFormaPagto: TDataSource;
    Panel6: TPanel;
    dbtDESCRICAO_FULL: TDBText;
    Bevel19: TBevel;
    Bevel20: TBevel;
    Panel7: TPanel;
    dbgConsolidadoFormaPagto: TDBGrid;
    frdFluxoSintetico: TfrxDBDataset;
    frdFluxoAnalitico: TfrxDBDataset;
    frrFluxoAnalitico: TfrxReport;
    frdFluxoSaldos: TfrxDBDataset;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    dtsTpDespesa: TDataSource;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    ppImprimir: TPopupMenu;
    nmImprimirExtrato: TMenuItem;
    nmImprimirReciboA5: TMenuItem;
    FrReciboA5: TfrxReport;
    FrdRecibo: TfrxDBDataset;
    ACBrExtenso: TACBrExtenso;
    DspRecibo: TDataSetProvider;
    CdsRecibo: TClientDataSet;
    CdsReciboVALOR_BAIXA_EXTENSO: TStringField;
    dbCliente: TJvDBComboEdit;
    dbFornecedor: TJvDBComboEdit;
    dbDataMov: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    edContaCorrentePesq: TComboBox;
    lblTipoReceita: TLabel;
    dbTipoReceita: TDBLookupComboBox;
    dtsTpReceita: TDataSource;
    nmImprimirReciboA4: TMenuItem;
    FrReciboA4: TfrxReport;
    btnRecalcularSaldo: TcxButton;
    bvlRecalcularSaldo: TBevel;
    fdQryEmpresa: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    fdQryContaCorrente: TFDQuery;
    fdQryTipoMovimento: TFDQuery;
    fdQryTipoDespesa: TFDQuery;
    fdQryTipoReceita: TFDQuery;
    fdQrySaldosDias: TFDQuery;
    fdQrySaldosDiasSALDO_ANTERIOR_DATA: TDateField;
    fdQrySaldosDiasSALDO_INICIAL_DATA: TDateField;
    fdQrySaldosDiasSALDO_FINAL_DATA: TDateField;
    fdQryConsolidadoFormaPagto: TFDQuery;
    fdQryConsolidadoFormaPagtoDATA: TDateField;
    fdQryConsolidadoFormaPagtoFORMA_PAGTO: TIntegerField;
    fdQryConsolidadoFormaPagtoFORMA_PAGTO_DESC: TStringField;
    fdQryConsolidadoFormaPagtoSaldoDIsplay: TStringField;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaNUMERO: TIntegerField;
    fdQryTabelaCAIXA_ANO: TSmallintField;
    fdQryTabelaCAIXA_NUM: TIntegerField;
    fdQryTabelaCONTA_CORRENTE: TIntegerField;
    fdQryTabelaFORMA_PAGTO: TSmallintField;
    fdQryTabelaDATAHORA: TSQLTimeStampField;
    fdQryTabelaTIPO: TStringField;
    fdQryTabelaTIPO_RECEITA: TSmallintField;
    fdQryTabelaTIPO_DESPESA: TSmallintField;
    fdQryTabelaHISTORICO: TStringField;
    fdQryTabelaSITUACAO: TSmallintField;
    fdQryTabelaVENDA_ANO: TSmallintField;
    fdQryTabelaVENDA_NUM: TIntegerField;
    fdQryTabelaCLIENTE: TStringField;
    fdQryTabelaCLIENTE_COD: TIntegerField;
    fdQryTabelaCOMPRA_ANO: TSmallintField;
    fdQryTabelaCOMPRA_NUM: TIntegerField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaFORNECEDOR: TIntegerField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaFORMA_PAGTO_DESC: TStringField;
    fdQryTabelaNOME_CLENTE: TStringField;
    fdQryTabelaNOME_FORNECEDOR: TStringField;
    fdQryTabelaDATA: TDateField;
    fdQryTabelaHORA: TTimeField;
    fdQryTabelaVENDA: TStringField;
    fdQryTabelaTITULO: TStringField;
    fdQryTabelaCOMPRA: TStringField;
    fdQryTabelaDUPLICATA: TStringField;
    fdQryTabelaSITUACAO_CAIXA: TSmallintField;
    fdQryTabelaDATA_FECH: TDateField;
    fdQryTabelaDATA_CANCEL: TDateField;
    qryFluxoSaldos: TFDQuery;
    qryFluxoSintetico: TFDQuery;
    qryFluxoAnalitico: TFDQuery;
    QryRecibo: TFDQuery;
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
    CdsReciboVALORPAG: TFMTBCDField;
    CdsReciboVALOR_BAIXA: TFMTBCDField;
    fdQryTabelaVALOR: TFMTBCDField;
    fdQryTabelaVALOR_CREDITO: TFMTBCDField;
    fdQryTabelaVALOR_DEBITO: TFMTBCDField;
    fdQrySaldosDiasSALDO_ANTERIOR_VALOR: TFMTBCDField;
    fdQrySaldosDiasSALDO_INICIAL_VALOR: TFMTBCDField;
    fdQrySaldosDiasSALDO_FINAL_VALOR: TFMTBCDField;
    fdQryConsolidadoFormaPagtoSALDO: TFMTBCDField;
    fdQryConsolidadoFormaPagtoENTRADA: TFMTBCDField;
    fdQryConsolidadoFormaPagtoSAIDA: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure edContaCorrentePesqChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure frrFluxoAnaliticoGetValue(const VarName: String;
      var Value: Variant);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure nmImprimirExtratoClick(Sender: TObject);
    procedure nmImprimirReciboClick(Sender: TObject);
    procedure FrReciboGetValue(const VarName: String; var Value: Variant);
    procedure CdsReciboCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnRecalcularSaldoClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure fdQryConsolidadoFormaPagtoCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaSITUACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    sGeneratorName : String;
    FImprimirCabecalho : Boolean;
    procedure CarregarContaCorrente;
    procedure CarregarSaldos;
    procedure DefinirControle;
    procedure CarregarTipoDespesa(const ApenasAtivos : Boolean);
    procedure CarregarTipoReceita(const ApenasAtivos : Boolean);
    procedure RegistrarNovaRotinaSistema;
    procedure pgcGuiasOnChange; override;

    function BloquearAlteracaoExclusao : Boolean;
    function GetRotinaRecalcularSaldoID : String;
  public
    { Public declarations }
    property RotinaRecalcularSaldoID : String read GetRotinaRecalcularSaldoID;
  end;

(*
  Tabelas:
  - TBCAIXA_MOVIMENTO
  - TBEMPRESA
  - TBCLIENTE
  - TBFORNECEDOR
  - TBFORMPAGTO
  - TBCAIXA
  - TBTPDESPESA
  - TBTPRECEITA
  - TBCONTPAG
  - TBCONTREC
  - TBBANCO_BOLETO

  Views:
  - VW_EMPRESA
  - VW_CONTA_CORRENTE
  - VW_TIPO_MOVIMENTO_CAIXA

  Procedures:
  - GET_CONTA_CORRENTE_SALDO
  - GET_FLUXO_CAIXA
*)

var
  frmGeFluxoCaixa: TfrmGeFluxoCaixa;

  procedure MostrarTabelaFluxoCaixas(const AOwner : TComponent);

const
  TIPO_MOVIMENTO_CREDITO = 'C';
  TIPO_MOVIMENTO_DEBITO  = 'D';

implementation

uses
    DateUtils
  , Controller.Tabela
  , UConstantesDGE
  , UDMBusiness
  , UDMNFe
  , UDMRecursos
  , View.Cliente
  , View.Fornecedor
  , UGeCaixa;

{$R *.dfm}

procedure MostrarTabelaFluxoCaixas(const AOwner : TComponent);
var
  frm : TfrmGeFluxoCaixa;
  whr : String;
begin
  frm := TfrmGeFluxoCaixa.Create(AOwner);
  try
    whr := '(m.Empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and ' +
      '(cast(m.Datahora as date) between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and '  +
      QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ') and ' +
      'm.Conta_corrente = ' + IntToStr( frm.fdQryContaCorrente.FieldByName('codigo').AsInteger );

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      SQL.Add('order by ' + CampoOrdenacao);
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
  CriarGenerator(sGeneratorName, 0);

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

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryFormaPagto);
  CarregarLista(fdQryTipoMovimento);

  CarregarTipoReceita(False);
  CarregarTipoDespesa(False);

  CarregarContaCorrente;

  RotinaID            := ROTINA_FIN_TESOURARIA_ID;
  DisplayFormatCodigo := '###0000000';
  ControlFirstEdit    := dbDataMov;
  
  NomeTabela     := 'TBCAIXA_MOVIMENTO';
  CampoCodigo    := 'm.Numero';
  CampoDescricao := 'm.Historico';
  CampoOrdenacao := 'm.Ano, m.Numero';

  Tabela
    .Display('NUMERO', 'Código', '###0000000', TAlignment.taCenter)
    .Display('VALOR', 'Valor (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_CREDITO', 'Crédito (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_DEBITO',  'Débito (R$)',  ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  TTabelaController
    .New
    .Tabela( fdQrySaldosDias )
    .Display('SALDO_ANTERIOR_VALOR', 'Saldo Anterior (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('SALDO_INICIAL_VALOR',  'Saldo Inicial (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('SALDO_FINAL_VALOR',    'Saldo Final (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQrySaldosDias );

  TTabelaController
    .New
    .Tabela( fdQryConsolidadoFormaPagto )
    .Display('SALDO',   'Saldo', ',0.00', TAlignment.taRightJustify)
    .Display('ENTRADA', 'Entradas', '"+",0.00', TAlignment.taRightJustify)
    .Display('SAIDA',   'Saídas',   '"-",0.00', TAlignment.taRightJustify)
    .Configurar( fdQryConsolidadoFormaPagto );
end;

procedure TfrmGeFluxoCaixa.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
  btnRecalcularSaldo.Visible := (not btbtnSelecionar.Visible) and
    GetPermissaoRotinaInterna(btnRecalcularSaldo, False);
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';
end;

procedure TfrmGeFluxoCaixa.edContaCorrentePesqChange(Sender: TObject);
begin
  if ( not fdQryContaCorrente.IsEmpty ) then
    fdQryContaCorrente.Locate('Descricao_FULL', edContaCorrentePesq.Text, []);
end;

procedure TfrmGeFluxoCaixa.fdQryConsolidadoFormaPagtoCalcFields(
  DataSet: TDataSet);
var
  aSaldo : String;
begin
  if ( fdQryConsolidadoFormaPagtoFORMA_PAGTO.AsInteger > 0 ) then
    fdQryConsolidadoFormaPagtoSaldoDisplay.AsString := EmptyStr
  else
  begin
    aSaldo := FormatFloat(',0.00', fdQryConsolidadoFormaPagtoSALDO.AsCurrency);

    if ( fdQryConsolidadoFormaPagtoSALDO.AsCurrency >= 0 ) then
      fdQryConsolidadoFormaPagtoSaldoDisplay.AsString := aSaldo
    else
      fdQryConsolidadoFormaPagtoSaldoDisplay.AsString := StringReplace(aSaldo, '-', '- ', [rfReplaceAll]);
  end;
end;

procedure TfrmGeFluxoCaixa.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').AsString    := gUsuarioLogado.Empresa;
    FieldByName('ANO').AsInteger       := YearOf(GetDateTimeDB);
    FieldByName('DATAHORA').AsDateTime := GetDateTimeDB;
    FieldByName('SITUACAO').AsInteger  := 1;
    FieldByName('TIPO').AsString       := TIPO_MOVIMENTO_CREDITO;
    FieldByName('USUARIO').AsString    := gUsuarioLogado.Login;
    FieldByName('DATA').AsDateTime     := GetDateDB;
    FieldByName('HORA').AsDateTime     := GetTimeDB;

    FieldByName('TIPO_RECEITA').Clear;
    FieldByName('TIPO_DESPESA').Clear;
    FieldByName('CLIENTE').Clear;
    FieldByName('CLIENTE_COD').Clear;
    FieldByName('FORNECEDOR').Clear;
    FieldByName('FORMA_PAGTO').Clear;

    FieldByName('FORMA_PAGTO_DESC').Clear;
    FieldByName('NOME_CLENTE').Clear;
    FieldByName('NOME_FORNECEDOR').Clear;
    FieldByName('VALOR_CREDITO').Clear;
    FieldByName('VALOR_DEBITO').Clear;
    FieldByName('VENDA').Clear;
    FieldByName('TITULO').Clear;
    FieldByName('COMPRA').Clear;
    FieldByName('DUPLICATA').Clear;
  end;
end;

procedure TfrmGeFluxoCaixa.fdQryTabelaSITUACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    0 : Text := 'Cancelado';
    1 : Text := 'Confirmado';
  end;
end;

procedure TfrmGeFluxoCaixa.btnFiltrarClick(Sender: TObject);
var
  aData : TDateTime;
begin
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try

    with fdQryContaCorrente do
    begin

      if not Locate('Descricao_FULL', edContaCorrentePesq.Text, []) then
      begin
        WaitAMomentFree;
        ShowWarning('Favor selecionar Conta Corrente para pesquisa!');
        Abort;
      end;

      WhereAdditional := '(m.Empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and ' +
        '(cast(m.Datahora as date) between '  +
        QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and '  +
        QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ') and ' +
        'm.Conta_corrente = ' + IntToStr( FieldByName('codigo').AsInteger );

      // Recalcular Saldo da Conta Corrente
      if ( FieldByName('codigo').AsInteger > 0 ) then
      begin
        aData := e1Data.Date;
        // O saldo é recalculado apenas para o período máximo de 30 dias
        if ( (e2Data.Date - aData) > 30 ) then
          aData := e2Data.Date - 30;

        GerarSaldoContaCorrente_v2(FieldByName('codigo').AsInteger, aData, e2Data.Date);
      end;

    end;

    CarregarSaldos;

    inherited;

  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGeFluxoCaixa.btnRecalcularSaldoClick(Sender: TObject);
var
  dData : TDateTime;
begin
  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if not ShowConfirmation('Ao executar o recálculo dos saldos diários da Conta Corrente ' +
    'selecionada, possivelmente os valores sejam alterados no período informado.' + #13#13 +
    'Este processo levará alguns minutos.' + #13#13 +
    'Deseja continuar com o recálculo dos saldos?') then
    Exit;

  WaitAMoment(WAIT_AMOMENT_Process);
  try

    with fdQryContaCorrente do
    begin

      if not Locate('Descricao_FULL', edContaCorrentePesq.Text, []) then
        Exit;

      // Recalcular Saldo da Conta Corrente
      if ( FieldByName('codigo').AsInteger > 0 ) then
      begin
        dData := e1Data.Date;

        GerarSaldoContaCorrente_v2(FieldByName('codigo').AsInteger, dData, e2Data.Date);
      end;

    end;

    CarregarSaldos;

  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGeFluxoCaixa.CarregarSaldos;
begin
  dbLDataFinal.Visible  := (e1Data.Date <> e2Data.Date);
  BvDataFinal.Visible   := (e1Data.Date <> e2Data.Date);

  dbLSaldoFinal.Visible := (e1Data.Date <> e2Data.Date);
  BvSaldoFinal.Visible  := (e1Data.Date <> e2Data.Date);

  with fdQrySaldosDias do
  begin
    Close;
    ParamByName('Conta').AsInteger    := fdQryContaCorrente.FieldByName('codigo').AsInteger;
    ParamByName('DataInicial').AsDate := e1Data.Date;
    ParamByName('DataFinal').AsDate   := e2Data.Date;
    Open;
  end;

  with fdQryConsolidadoFormaPagto do
  begin
    Close;
    ParamByName('Conta_Corrente').AsInteger := fdQryContaCorrente.FieldByName('codigo').AsInteger;
    ParamByName('Data_Inicial').AsDate := e1Data.Date;
    ParamByName('Data_Final').AsDate   := e2Data.Date;
    Open;
  end;
end;

procedure TfrmGeFluxoCaixa.CarregarTipoDespesa(const ApenasAtivos: Boolean);
begin
  with fdQryTipoDespesa, Params do
  begin
    Close;
    ParamByName('ativo').AsInteger := IfThen(ApenasAtivos, 1, 0);
    ParamByName('todos').AsInteger := IfThen(ApenasAtivos, 0, 1);
    Open;

    Prior;
    Last;
  end;
end;

procedure TfrmGeFluxoCaixa.CarregarTipoReceita(const ApenasAtivos: Boolean);
begin
  with fdQryTipoReceita, Params do
  begin
    Close;
    ParamByName('ativo').AsInteger := IfThen(ApenasAtivos, 1, 0);
    ParamByName('todos').AsInteger := IfThen(ApenasAtivos, 0, 1);
    Open;

    Prior;
    Last;
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
    if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = 0 ) then
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

  btnRecalcularSaldo.Enabled := (pgcGuias.ActivePage = tbsTabela);

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_CREDITO ) then
    begin
      lblCliente.Enabled     := True;
      dbCliente.Enabled      := True;
      lblTipoReceita.Enabled := True;
      dbTipoReceita.Enabled  := True;

      lblFornecedor.Enabled  := False;
      dbFornecedor.Enabled   := False;
      lblTipoDespesa.Enabled := False;
      dbTipoDespesa.Enabled  := False;
    end
    else
    if ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_DEBITO ) then
    begin
      lblCliente.Enabled     := False;
      dbCliente.Enabled      := False;
      lblTipoReceita.Enabled := False;
      dbTipoReceita.Enabled  := False;

      lblFornecedor.Enabled  := True;
      dbFornecedor.Enabled   := True;
      lblTipoDespesa.Enabled := True;
      dbTipoDespesa.Enabled  := True;
    end;

    if ( FieldByName('VENDA_ANO').AsInteger > 0 ) then
    begin
      memObservacoes.Lines.Add(
        'Movimento de fluxo de caixa relacionada a VENDA CONFIRMADA de No. ' + FieldByName('VENDA').AsString +
        '. Este tipo de movimento não poderá ser alterado e nem excluído, com isso a única forma de seu ' +
        'valor não ser considerado para o cálculo do saldo diário da conta corrente é CANCELAR A VENDA '  +
        'responsável por este movimento.');
    end
    else
    if ( FieldByName('COMPRA_ANO').AsInteger > 0 ) then
    begin
      memObservacoes.Lines.Add(
        'Movimento de fluxo de caixa relacionada a COMPRA CONFIRMADA de No. ' + FieldByName('COMPRA').AsString +
        '. Este tipo de movimento não poderá ser alterado e nem excluído, com isso a única forma de seu ' +
        'valor não ser considerado para o cálculo do saldo diário da conta corrente é CANCELAR A COMPRA '  +
        'responsável por este movimento.');
    end
    else
    if ( Trim(FieldByName('TITULO').AsString) <> EmptyStr ) then
    begin
      memObservacoes.Lines.Add(
        'Movimento de fluxo de caixa relacionado ao TÍTULO de No. ' + FieldByName('TITULO').AsString);
      memObservacoes.Lines.Add('(Contas A Receber).');
      memObservacoes.Lines.Add('');
      memObservacoes.Lines.Add(
        'Este tipo de movimento não poderá ser alterado e nem excluído, com isso a única forma de seu '  +
        'valor não ser considerado para o cálculo do saldo diário da conta corrente é CANCELAR A BAIXA ' +
        'responsável por este movimento.');
    end
    else
    if ( Trim(FieldByName('DUPLICATA').AsString) <> EmptyStr ) then
    begin
      memObservacoes.Lines.Add(
        'Movimento de fluxo de caixa relacionado a DUPLICATA de No. ' + FieldByName('DUPLICATA').AsString);
      memObservacoes.Lines.Add('(Contas A Pagar).');
      memObservacoes.Lines.Add('');
      memObservacoes.Lines.Add(
        'Este tipo de movimento não poderá ser alterado e nem excluído, com isso a única forma de seu '  +
        'valor não ser considerado para o cálculo do saldo diário da conta corrente é CANCELAR A BAIXA ' +
        'responsável por este movimento.');
    end;
  end;
end;

procedure TfrmGeFluxoCaixa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    DefinirControle;

  CarregarTipoReceita( (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) );
  CarregarTipoDespesa( (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) );
end;

procedure TfrmGeFluxoCaixa.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = DtSrcTabela.DataSet.FieldByName('TIPO') ) then
    DefinirControle;
end;

procedure TfrmGeFluxoCaixa.pgcGuiasChange(Sender: TObject);
begin
  DefinirControle;
end;

procedure TfrmGeFluxoCaixa.pgcGuiasOnChange;
begin
  DefinirControle;
end;

procedure TfrmGeFluxoCaixa.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('CLIENTE_COD').AsInteger := iCodigo;
        FieldByName('CLIENTE').AsString      := sCNPJ;
        FieldByName('NOME_CLENTE').AsString  := sNome;
      end;
  end;
end;

procedure TfrmGeFluxoCaixa.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarFornecedor(Self, iCodigo, sNome) ) then
      begin
        FieldByName('FORNECEDOR').AsInteger     := iCodigo;
        FieldByName('NOME_FORNECEDOR').AsString := sNome;
      end;
  end;
end;

procedure TfrmGeFluxoCaixa.btbtnSalvarClick(Sender: TObject);
var
  CxAno,
  CxNumero,
  CxContaCorrente : Integer;
begin
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('ANO').AsInteger = 0) or (FieldByName('NUMERO').AsInteger = 0) then
    begin
      FieldByName('ANO').AsInteger    := YearOf(GetDateDB);
      FieldByName('NUMERO').AsInteger := GetGeneratorID(sGeneratorName);
    end;

    FieldByName('CLIENTE').Required      := ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_CREDITO );
    FieldByName('TIPO_RECEITA').Required := ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_CREDITO );

    FieldByName('FORNECEDOR').Required   := ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_DEBITO );
    FieldByName('TIPO_DESPESA').Required := ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_DEBITO );

    if ( CaixaAberto(FieldByName('EMPRESA').AsString, FieldByName('USUARIO').AsString, FieldByName('DATAHORA').AsDateTime, FieldByName('FORMA_PAGTO').AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
      if ( CxContaCorrente <> FieldByName('CONTA_CORRENTE').AsInteger ) then
      begin
        FieldByName('CAIXA_ANO').Clear;
        FieldByName('CAIXA_NUM').Clear;
      end;

    FieldByName('DATA').AsDateTime := FieldByName('DATAHORA').AsDateTime;
    FieldByName('HORA').AsDateTime := FieldByName('DATAHORA').AsDateTime;

    if ( FieldByName('VALOR').AsCurrency <= 0 ) then
      FieldByName('VALOR').Clear;

    if ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_CREDITO ) then
    begin
      FieldByName('VALOR_CREDITO').AsCurrency := FieldByName('VALOR').AsCurrency;
      FieldByName('VALOR_DEBITO').AsCurrency  := 0.0;
      FieldByName('TIPO_DESPESA').Clear;
    end
    else
    if ( FieldByName('TIPO').AsString = TIPO_MOVIMENTO_DEBITO ) then
    begin
      FieldByName('VALOR_CREDITO').AsCurrency := 0.0;
      FieldByName('VALOR_DEBITO').AsCurrency  := FieldByName('VALOR').AsCurrency;
      FieldByName('TIPO_RECEITA').Clear;
    end;

    if ( FieldByName('DATAHORA').AsDateTime > GetDateTimeDB ) then
    begin
      ShowWarning('Não é permitido o registro de débitos/créditos futuros!');
      if dbDataMov.Visible and dbDataMov.Enabled then
        dbDataMov.SetFocus;
    end
    else
    begin
      inherited;

      if ( not OcorreuErro ) then
        try
          WaitAMoment(WAIT_AMOMENT_TextoLivre, 'Recalculando saldo do dia...');
          GerarSaldoContaCorrente(FieldByName('CONTA_CORRENTE').AsInteger, FieldByName('DATAHORA').AsDateTime);
          CarregarSaldos;
        finally
          WaitAMomentFree;
        end;
    end;
  end;
end;

procedure TfrmGeFluxoCaixa.ControlEditExit(Sender: TObject);
var
  CxAno,
  CxNumero,
  CxContaCorrente : Integer;
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( Sender = dbFormaPagto ) then
      if ( State in [dsEdit, dsInsert] ) then
        if ( CaixaAberto(FieldByName('EMPRESA').AsString, FieldByName('USUARIO').AsString, FieldByName('DATAHORA').AsDateTime, FieldByName('FORMA_PAGTO').AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
        begin
          FieldByName('CONTA_CORRENTE').AsInteger := CxContaCorrente;
          FieldByName('CAIXA_ANO').AsInteger := CxAno;
          FieldByName('CAIXA_NUM').AsInteger := CxNumero;
        end
        else
        begin
          FieldByName('CONTA_CORRENTE').AsInteger := fdQryContaCorrente.FieldByName('codigo').AsInteger;
          FieldByName('CAIXA_ANO').Clear;
          FieldByName('CAIXA_NUM').Clear;
        end;
  end;
end;

function TfrmGeFluxoCaixa.BloquearAlteracaoExclusao : Boolean;
var
  Return : Boolean;
begin
  Return := False;
  with DtSrcTabela.DataSet do
  begin
    if ( (FieldByName('VENDA_NUM').AsInteger > 0) or (FieldByName('COMPRA_NUM').AsInteger > 0) ) then
    begin
      DefinirControle;

      ShowWarning('Movimento de Fluxo de Caixa bloqueado para edição ou exclusão!');
      pgcGuias.ActivePage := tbsCadastro;

      Return := True;
    end
    else
    if ( Trim(FieldByName('TITULO').AsString) <> EmptyStr ) then
    begin
      DefinirControle;

      ShowWarning('Movimentos de Fluxo de Caixa associados a Títulos não podem ser editados ou excluídos!' + #13#13 +
        'Favor promover essas alterações direto no registro de baixa do Título (Contas A Receber).');
      pgcGuias.ActivePage := tbsCadastro;

      Return := True;
    end
    else
    if ( Trim(FieldByName('DUPLICATA').AsString) <> EmptyStr ) then
    begin
      DefinirControle;

      ShowWarning('Movimentos de Fluxo de Caixa associados a Duplicatas não podem ser editados ou excluídos!' + #13#13 +
        'Favor promover essas alterações direto no registro de baixa da Duplicata (Contas A Pagar).');
      pgcGuias.ActivePage := tbsCadastro;

      Return := True;
    end
    else
    if ( FieldByName('SITUACAO_CAIXA').AsInteger <> STATUS_CAIXA_ABERTO ) then
    begin
      ShowWarning('O Controle de Caixa referente a referente a este movimento não está aberto!');
      Return := True;
    end;
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

procedure TfrmGeFluxoCaixa.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btnRecalcularSaldo.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaRecalcularSaldoID, btnRecalcularSaldo.Caption, RotinaID);
  end;
end;

procedure TfrmGeFluxoCaixa.btbtnListaClick(Sender: TObject);
begin
  inherited;
  if ( DtSrcTabela.DataSet.IsEmpty ) then
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

function TfrmGeFluxoCaixa.GetRotinaRecalcularSaldoID: String;
begin
  Result := GetRotinaInternaID(btnRecalcularSaldo);
end;

procedure TfrmGeFluxoCaixa.btbtnIncluirClick(Sender: TObject);
begin
  inherited;

  if ( not OcorreuErro ) then
    with DtSrcTabela.DataSet do
    begin
      FieldByName('ANO').AsInteger    := 0;
      FieldByName('NUMERO').AsInteger := 0;
      FieldByName('CONTA_CORRENTE').AsInteger := fdQryContaCorrente.FieldByName('codigo').AsInteger;
    end;
end;


procedure TfrmGeFluxoCaixa.nmImprimirExtratoClick(Sender: TObject);
var
  Data : TDateTime;
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  try
    WaitAMoment(WAIT_AMOMENT_PrintPrepare);

    Data := e1Data.Date;
    // O saldo é recalculado apenas para o período máximo de 30 dias
    if ( (e2Data.Date - Data) > 30 ) then
      Data := e2Data.Date - 30;

    GerarSaldoContaCorrente_v2(DtSrcTabela.DataSet.FieldByName('CONTA_CORRENTE').AsInteger, Data, e2Data.Date);

    with DMNFe do
    begin

      with qryEmitente do
      begin
        Close;
        ParamByName('Cnpj').AsString := gUsuarioLogado.Empresa;
        Open;
      end;

      with qryFluxoSaldos do
      begin
        Close;
        ParamByName('Conta').AsInteger := fdQryContaCorrente.FieldByName('codigo').AsInteger;
        ParamByName('DataInicial').AsDateTime  := e1Data.Date;
        ParamByName('DataFinal').AsDateTime    := e2Data.Date;
        Open;
      end;

      with qryFluxoSintetico do
      begin
        Close;
        ParamByName('Conta_Corrente').AsInteger := fdQryContaCorrente.FieldByName('codigo').AsInteger;
        ParamByName('Data_Inicial').AsDateTime  := e1Data.Date;
        ParamByName('Data_Final').AsDateTime    := e2Data.Date;
        Open;
      end;

      with qryFluxoAnalitico do
      begin
        Close;
        ParamByName('Conta_Corrente').AsInteger := fdQryContaCorrente.FieldByName('codigo').AsInteger;
        ParamByName('Data_Inicial').AsDateTime  := e1Data.Date;
        ParamByName('Data_Final').AsDateTime    := e2Data.Date;
        Open;
      end;

      WaitAMomentFree;
      if ( not qryFluxoAnalitico.IsEmpty ) then
        frrFluxoAnalitico.ShowReport;

    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGeFluxoCaixa.nmImprimirReciboClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with CdsRecibo, Params do
  begin
    Close;
    ParamByName('ano').AsInteger    := DtSrcTabela.DataSet.FieldByName('ANO').AsInteger;
    ParamByName('numero').AsInteger := DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger;
    Open;

    if IsEmpty then
      Exit;
  end;

  FImprimirCabecalho := ShowConfirmation('Recibo', 'Deseja imprimir no recibo o Cabeçalho com informações da empresa?');

  if (Sender = nmImprimirReciboA4) then
    frReport := FrReciboA4
  else
  if (Sender = nmImprimirReciboA5) then
    frReport := FrReciboA5;

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
    Value := gUsuarioLogado.Login;

  if ( VarName = VAR_SYSTEM ) then
    Value := Application.Title + ' - versão ' + ver.FileVersion;

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FImprimirCabecalho, 1, 0);
end;

procedure TfrmGeFluxoCaixa.CdsReciboCalcFields(DataSet: TDataSet);
begin
  CdsReciboVALOR_BAIXA_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsReciboVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
end;

procedure TfrmGeFluxoCaixa.CarregarContaCorrente;
begin
  edContaCorrentePesq.OnChange := nil;
  try

    with fdQryContaCorrente do
    begin
      Filter   := 'cnpj = ' + QuotedStr(gUsuarioLogado.Empresa);
      Filtered := True;
      Open;

      edContaCorrentePesq.Clear;

      while not Eof do
      begin
        edContaCorrentePesq.Items.Add( FieldByName('descricao_full').AsString );
        Next;
      end;
    end;

    edContaCorrentePesq.ItemIndex := 0;

  finally
    edContaCorrentePesq.OnChange := edContaCorrentePesqChange;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeFluxoCaixa', TfrmGeFluxoCaixa);

end.
