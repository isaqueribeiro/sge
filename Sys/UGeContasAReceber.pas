unit UGeContasAReceber;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, JvToolEdit, JvExMask,
  JvDBControls, Datasnap.DBClient, Datasnap.Provider, IBX.IBQuery, ACBrBase,
  ACBrExtenso, frxClass, frxDBSet,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver;

type
  TfrmGeContasAReceber = class(TfrmGrPadraoCadastro)
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblCliente: TLabel;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblValorAReceber: TLabel;
    dbValorAReceber: TDBEdit;
    dtsEmpresa: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsHistorico: TTabSheet;
    dbObservacao: TDBMemo;
    lblQuitado: TLabel;
    Bevel6: TBevel;
    dbgPagamentos: TDBGrid;
    Bevel7: TBevel;
    cdsPagamentos: TIBDataSet;
    dtsPagamentos: TDataSource;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TIBStringField;
    cdsPagamentosVALOR_BAIXA: TIBBCDField;
    cdsPagamentosNUMERO_CHEQUE: TIBStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosDOCUMENTO_BAIXA: TIBStringField;
    lblCNPJ: TLabel;
    dbCNPJ: TDBEdit;
    lblVenda: TLabel;
    daVenda: TDBEdit;
    IbDtstTabelaANOLANC: TSmallintField;
    IbDtstTabelaNUMLANC: TIntegerField;
    IbDtstTabelaPARCELA: TSmallintField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaFORMA_PAGTO: TSmallintField;
    IbDtstTabelaTIPPAG: TIBStringField;
    IbDtstTabelaHISTORIC: TMemoField;
    IbDtstTabelaNUMREC: TIBStringField;
    IbDtstTabelaDTEMISS: TDateField;
    IbDtstTabelaDTVENC: TDateField;
    IbDtstTabelaDTREC: TDateField;
    IbDtstTabelaDOCBAIX: TIBStringField;
    IbDtstTabelaVALORREC: TIBBCDField;
    IbDtstTabelaVALORMULTA: TIBBCDField;
    IbDtstTabelaVALORRECTOT: TIBBCDField;
    IbDtstTabelaNUMCONTRATO: TIBStringField;
    IbDtstTabelaNOSSONUMERO: TIBStringField;
    IbDtstTabelaREMESSA: TIntegerField;
    IbDtstTabelaVALORSALDO: TIBBCDField;
    IbDtstTabelaPERCENTJUROS: TIBBCDField;
    IbDtstTabelaPERCENTMULTA: TIBBCDField;
    IbDtstTabelaPERCENTDESCONTO: TIBBCDField;
    IbDtstTabelaDATAPROCESSOBOLETO: TDateField;
    IbDtstTabelaBAIXADO: TSmallintField;
    IbDtstTabelaENVIADO: TSmallintField;
    IbDtstTabelaANOVENDA: TSmallintField;
    IbDtstTabelaNUMVENDA: TIntegerField;
    IbDtstTabelaPAGO_: TIBStringField;
    dnVenda: TDBEdit;
    Bevel9: TBevel;
    GrpBxDadosBoleto: TGroupBox;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    IbDtstTabelaCODBANCO: TIntegerField;
    lblValorMulta: TLabel;
    dbValorMulta: TDBEdit;
    lblTotalAReceber: TLabel;
    dbTotalAReceber: TDBEdit;
    lblNossoNumero: TLabel;
    dbNossoNumero: TDBEdit;
    dtsBanco: TDataSource;
    lblPercJuros: TLabel;
    dbPercJuros: TDBEdit;
    lblPercMulta: TLabel;
    dbPercMulta: TDBEdit;
    lblDataBoleto: TLabel;
    dbDataBoleto: TDBEdit;
    lblDataPagto: TLabel;
    dbDataPagto: TDBEdit;
    dbEnviado: TDBCheckBox;
    lblPercDesconto: TLabel;
    dbPercDesconto: TDBEdit;
    IbDtstTabelaNOMECLIENTE: TIBStringField;
    IbDtstTabelaSITUACAO: TSmallintField;
    lblData: TLabel;
    IbDtstTabelaSERIE: TIBStringField;
    IbDtstTabelaNFE: TLargeintField;
    IbDtstTabelaNFE_VENDA: TIBStringField;
    lblNFe: TLabel;
    dbNFe: TDBEdit;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaCLIENTE: TIntegerField;
    btbtnEfetuarPagto: TcxButton;
    dbCliente: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblLancamentoAberto: TLabel;
    lblLancamentoVencido: TLabel;
    Bevel10: TBevel;
    btbtnIncluirLote: TcxButton;
    FrReciboA5: TfrxReport;
    FrdRecibo: TfrxDBDataset;
    ACBrExtenso: TACBrExtenso;
    DspRecibo: TDataSetProvider;
    CdsRecibo: TClientDataSet;
    CdsReciboVALOR_BAIXA_EXTENSO: TStringField;
    popImprimir: TPopupMenu;
    popGerarReciboA4: TMenuItem;
    IbDtstTabelaCOMPETENCIA_APURACAO: TIntegerField;
    dtsCompetencia: TDataSource;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    lblVencimento: TLabel;
    dbVencimento: TJvDBDateEdit;
    lblCompetenciaApuracao: TLabel;
    dbCompetenciaApuracao: TDBLookupComboBox;
    dtsTpReceita: TDataSource;
    lblTipoReceita: TLabel;
    dbTipoReceita: TDBLookupComboBox;
    IbDtstTabelaCODTPREC: TSmallintField;
    cdsPagamentosBANCO_FEBRABAN: TIBStringField;
    cdsPagamentosBCO_NOME: TIBStringField;
    FrReciboA4: TfrxReport;
    popGerarReciboA5: TMenuItem;
    lblSaldoAPagar: TLabel;
    dbSaldoAReceber: TDBEdit;
    lblLancamentoCancelado: TLabel;
    fdQryEmpresa: TFDQuery;
    fdQryCondicaoPagto: TFDQuery;
    fdQryCompetencia: TFDQuery;
    fdQryTipoReceita: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    fdQryBanco: TFDQuery;
    fdQryRecibo: TFDQuery;
    CdsReciboANOLANC: TSmallintField;
    CdsReciboNUMLANC: TIntegerField;
    CdsReciboPARCELA: TSmallintField;
    CdsReciboCLIENTE: TIntegerField;
    CdsReciboRZSOC: TStringField;
    CdsReciboEMPRESA_CNPJ: TStringField;
    CdsReciboNOME: TStringField;
    CdsReciboPESSOA_FISICA: TSmallintField;
    CdsReciboCNPJ: TStringField;
    CdsReciboTIPPAG: TStringField;
    CdsReciboDTEMISS: TDateField;
    CdsReciboDTVENC: TDateField;
    CdsReciboDTREC: TDateField;
    CdsReciboVALORREC: TBCDField;
    CdsReciboBANCO: TSmallintField;
    CdsReciboBCO_NOME: TStringField;
    CdsReciboNUMERO_CHEQUE: TStringField;
    CdsReciboPAGO_: TStringField;
    CdsReciboDOCBAIX: TStringField;
    CdsReciboBAIXADO: TSmallintField;
    CdsReciboSEQ: TSmallintField;
    CdsReciboDATA_PAGTO: TDateField;
    CdsReciboFORMA_PAGTO: TSmallintField;
    CdsReciboFORMA_PAGTO_DESC: TStringField;
    CdsReciboHISTORICO: TMemoField;
    CdsReciboVALOR_BAIXA: TBCDField;
    IbDtstTabelaANOOS: TSmallintField;
    IbDtstTabelaNUMOS: TIntegerField;
    IbDtstTabelaNFS_SERIE: TIBStringField;
    IbDtstTabelaNFS_NUMERO: TIntegerField;
    IbDtstTabelaNFSE_OS: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure dbClienteButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnEfetuarPagtoClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure IbDtstTabelaBAIXADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ControlEditExit(Sender: TObject);
    procedure dbFormaPagtoClick(Sender: TObject);
    procedure dbgPagamentosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnIncluirLoteClick(Sender: TObject);
    procedure FrReciboGetValue(const VarName: string; var Value: Variant);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure CdsReciboCalcFields(DataSet: TDataSet);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FDataAtual     : TDateTime;
    FLoteParcelas  : String;
    SQL_Pagamentos : TStringList;
    FImprimirCabecalho : Boolean;
    procedure AbrirPagamentos(const Ano : Smallint; const Numero : Integer);
    procedure HabilitarDesabilitar_Btns;
    procedure ControleLabels;
    procedure RecarregarRegistro;
    procedure CarregarFormaPagto(const pEmpresa : String);
    procedure CarregarTipoReceita(const ApenasAtivos : Boolean);

    function GetRotinaEfetuarPagtoID : String;
    function GetRotinaCancelarPagtosID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaEfetuarPagtoID : String read GetRotinaEfetuarPagtoID;
    property RotinaCancelarPagtosID : String read GetRotinaCancelarPagtosID;
    property DataAtual : TDateTime read FDataAtual;
  end;

(*
  Tabelas:
  - TBCONTREC
  - TBEMPRESA
  - TBCLIENTE
  - TBCONTREC_BAIXA
  - TBBANCO_BOLETO
  - TBFORMPAGTO

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  frmGeContasAReceber: TfrmGeContasAReceber;

const
  STATUS_ARECEBER_PENDENTE = 0;
  STATUS_ARECEBER_PAGO     = 1;

  { DONE -oIsaque -cContas A Receber : 22/05/2014 - Correção de BUG porque a rotina estava permitindo a gravação de um lançamento sem CLIENTE, DATAS e VALOR }
  procedure MostrarControleContasAReceber(const AOwner : TComponent);

implementation

uses
  UConstantesDGE, UDMBusiness, UGeCliente, DateUtils, UGeEfetuarPagtoREC,
  UGeContasAReceberLoteParcela;

{$R *.dfm}

procedure MostrarControleContasAReceber(const AOwner : TComponent);
var
  frm : TfrmGeContasAReceber;
  whr : String; 
begin
  frm := TfrmGeContasAReceber.Create(AOwner);
  try

    whr :=
      '( (r.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and (r.Situacao > 0) and (r.Parcela > 0) ) and (' +
      'cast(r.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) +
      ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ')';

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

procedure TfrmGeContasAReceber.FormCreate(Sender: TObject);
begin
  SetTipoReceitaPadrao;
  IbDtstTabela.GeneratorField.Generator := 'GEN_CONTAREC_NUM_' + FormatFloat('0000', YearOf(Date));

  inherited;

  SQL_Pagamentos := TStringList.Create;
  SQL_Pagamentos.AddStrings( cdsPagamentos.SelectSQL );

  FDataAtual      := GetDateTimeDB;
  e1Data.Date     := GetMenorVencimentoAReceber;
  e2Data.Date     := GetDateLastMonth;

  if (e1Data.Date > GetDateDB) then
    e1Data.Date   := GetDateDB;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbCliente;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryCondicaoPagto);
  CarregarLista(fdQryBanco);
  CarregarLista(fdQryCompetencia);
  CarregarFormaPagto(gUsuarioLogado.Empresa);
  CarregarTipoReceita(False);

  RotinaID            := ROTINA_FIN_CONTA_ARECEBER_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCONTREC';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'Nome';
  CampoOrdenacao := 'r.dtvenc, c.Nome';

  WhereAdditional :=
    '( (r.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and (r.Situacao > 0) and (r.Parcela > 0) ) and (' +
    'cast(r.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';
end;

procedure TfrmGeContasAReceber.dbClienteButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome) ) then
    begin
      IbDtstTabelaCLIENTE.AsInteger    := iCodigo;
      IbDtstTabelaCNPJ.AsString        := sCNPJ;
      IbDtstTabelaNOMECLIENTE.AsString := sNome;
    end;
end;

procedure TfrmGeContasAReceber.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    '( (r.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and (r.Situacao > 0) and (r.Parcela > 0) ) and (' +
    'cast(r.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';
    
  if Trim(FLoteParcelas) <> EmptyStr then
    WhereAdditional := '(' + WhereAdditional + ' and (r.lote = ' + QuotedStr(FLoteParcelas) + '))';

  inherited;
end;

procedure TfrmGeContasAReceber.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.AsString := gUsuarioLogado.Empresa;
  IbDtstTabelaANOLANC.Value    := YearOf(Date);
  IbDtstTabelaPARCELA.Value    := 1;
  IbDtstTabelaDTEMISS.Value    := Date;
  IbDtstTabelaCOMPETENCIA_APURACAO.Value := GetCompetenciaID(Date);
  IbDtstTabelaFORMA_PAGTO.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaTIPPAG.Value         := GetFormaPagtoNomeDefault;
  IbDtstTabelaHISTORIC.AsString    := '...';
  IbDtstTabelaVALORRECTOT.Value     := 0;
  IbDtstTabelaVALORSALDO.Value      := 0;
  IbDtstTabelaVALORMULTA.Value      := 0;
  IbDtstTabelaPERCENTJUROS.Value    := 0;
  IbDtstTabelaPERCENTMULTA.Value    := 0;
  IbDtstTabelaPERCENTDESCONTO.Value := 0;
  IbDtstTabelaBAIXADO.Value  := 0;
  IbDtstTabelaENVIADO.Value  := 0;
  IbDtstTabelaSITUACAO.Value := 1; // Ativa
  IbDtstTabelaCODTPREC.Clear;
end;

procedure TfrmGeContasAReceber.btbtnEfetuarPagtoClick(Sender: TObject);
var
//  sSenha   : String;
//  iNumero  ,
//  CxAno    ,
//  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
  cReceber  : Currency;
begin
(*
  IMR - 17/09/2015
    Remoção do trecho de código que verifica a existência de caixa aberto antes da
    inserção da baixa. Esta validação passou para a tela de Efetuação do Pagamento.
*)
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

//  CxAno    := 0;
//  CxNumero := 0;
  CxContaCorrente := 0;

  RecarregarRegistro;

  if ( not IbDtstTabela.Active ) then
    Exit;

  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
  begin
    ShowWarning('Registro de recebimento selecionado já se encontra baixado!' + #13 + 'Favor pesquisar novamente.');
    Abort;
  end;
{
  if ( tblFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
    if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, GetUserApp, GetDateDB, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
      Exit;
    end;
}
//  sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');
//
//  if ( Trim(sSenha) = EmptyStr ) then
//    Exit;
//
//  if ( sSenha <> GetSenhaAutorizacao ) then
//  begin
//    ShowWarning('Senha de autorização inválida');
//    Exit;
//  end;

  cReceber := IbDtstTabelaVALORSALDO.AsCurrency;

  if PagamentoConfirmado(Self, IbDtstTabelaEMPRESA.AsString,
    IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger,
    IbDtstTabelaFORMA_PAGTO.AsInteger, IbDtstTabelaNOMECLIENTE.AsString,
    CxContaCorrente, DataPagto, cReceber) then
  begin
    if ( CxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

    RecarregarRegistro;
    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
    DesbloquearCliente(IbDtstTabelaCLIENTE.AsInteger, EmptyStr);
  end;
end;

procedure TfrmGeContasAReceber.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnEfetuarPagto.Enabled := (IbDtstTabelaSITUACAO.AsInteger = 1) and (IbDtstTabelaBAIXADO.AsInteger = 0) and (not IbDtstTabela.IsEmpty) and (IbDtstTabela.State = dsBrowse);
    popGerarReciboA4.Enabled  := (IbDtstTabelaSITUACAO.AsInteger = 1) and (not cdsPagamentos.IsEmpty);
    popGerarReciboA5.Enabled  := (IbDtstTabelaSITUACAO.AsInteger = 1) and (not cdsPagamentos.IsEmpty);
  end
  else
  begin
    btbtnEfetuarPagto.Enabled := False;
    popGerarReciboA4.Enabled  := False;
    popGerarReciboA5.Enabled  := False;
  end;
end;

procedure TfrmGeContasAReceber.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
  ControleLabels;
end;

procedure TfrmGeContasAReceber.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
end;

procedure TfrmGeContasAReceber.popGerarReciboClick(Sender: TObject);
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  with CdsRecibo, Params do
  begin
    Close;
    ParamByName('ano').AsInteger    := cdsPagamentosANOLANC.AsInteger;
    ParamByName('numero').AsInteger := cdsPagamentosNUMLANC.AsInteger;
    ParamByName('baixa').AsInteger  := cdsPagamentosSEQ.AsInteger;
    Open;

    if IsEmpty then
      Exit;
  end;

  FImprimirCabecalho := ShowConfirmation('Recibo', 'Deseja imprimir no recibo o Cabeçalho com informações da empresa?');

  if ( Sender = popGerarReciboA4 )  then
    frReport := FrReciboA4
  else
  if ( Sender = popGerarReciboA5 )  then
    frReport := FrReciboA5;

  SetVariablesDefault(frReport);

  frReport.PrepareReport;
  frReport.ShowReport;
end;

procedure TfrmGeContasAReceber.AbrirPagamentos(const Ano: Smallint;
  const Numero: Integer);
begin
  cdsPagamentos.Close;

  with cdsPagamentos, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Pagamentos );
    Add('where p.Anolanc = ' + IntToStr(Ano));
    Add('  and p.Numlanc = ' + IntToStr(Numero));
    Add('order by p.seq');
  end;

  cdsPagamentos.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAReceber.btbtnAlterarClick(Sender: TObject);
begin
  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
  begin
    ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
  end;
end;

procedure TfrmGeContasAReceber.btbtnExcluirClick(Sender: TObject);
begin
  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
  begin
    ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
    Abort;
  end
  else
  if ( IbDtstTabelaANOVENDA.AsInteger > 0 ) then
  begin
    ShowWarning('Registros de Contas A Receber atrelados à saídas de produtos/serviços não podem ser excluídos!');
    Abort;
  end
  else
  begin
    // Eliminar Movimento do Caixa quando o lançamento for excluído pelo SYSTEM ADM

    if (gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_SYSTEM_ADM]) then
    begin

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Delete from TBCAIXA_MOVIMENTO');
        SQL.Add('where ARECEBER_ANO = ' + IbDtstTabelaANOLANC.AsString);
        SQL.Add('  and ARECEBER_NUM = ' + IbDtstTabelaNUMLANC.AsString);
        ExecSQL;

        CommitTransaction;
      end;

    end
    else
    begin

      with DMBusiness, fdQryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update TBCAIXA_MOVIMENTO Set');
        SQL.Add('    ARECEBER_ANO = null');
        SQL.Add('  , ARECEBER_NUM = null');
        SQL.Add('where ARECEBER_ANO = ' + IbDtstTabelaANOLANC.AsString);
        SQL.Add('  and ARECEBER_NUM = ' + IbDtstTabelaNUMLANC.AsString);
        ExecSQL;

        CommitTransaction;
      end;

    end;

    inherited;

    if ( not OcorreuErro ) then
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );

    ControleLabels;
  end;
end;

procedure TfrmGeContasAReceber.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  ControleLabels;
end;

procedure TfrmGeContasAReceber.IbDtstTabelaBAIXADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (Sender.DataSet.FieldByName('situacao').AsInteger = 0) then
    Text := 'Cancelado'
  else
    Case Sender.AsInteger of
      0 : Text := 'A Receber';
      1 : Text := 'Baixado';
      else
        Text := Sender.AsString;
    end;
end;

procedure TfrmGeContasAReceber.CarregarFormaPagto(const pEmpresa: String);
begin
  with fdQryFormaPagto, Params do
  begin
    Close;
    ParamByName('empresa').AsString := Trim(pEmpresa);
    Open;

    Last;
    First;
  end;
end;

procedure TfrmGeContasAReceber.CarregarTipoReceita(const ApenasAtivos: Boolean);
begin
  with fdQryTipoReceita, Params do
  begin
    Close;
    ParamByName('ativo').AsInteger := IfThen(ApenasAtivos, 1, 0);
    ParamByName('todos').AsInteger := IfThen(ApenasAtivos, 0, 1);
    Open;

    Last;
    First;
  end;
end;

procedure TfrmGeContasAReceber.CdsReciboCalcFields(DataSet: TDataSet);
begin
  CdsReciboVALOR_BAIXA_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsReciboVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
end;

procedure TfrmGeContasAReceber.ControlEditExit(Sender: TObject);
begin
  inherited;

//  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
//    if ( (Sender = dbValorAReceber) or (Sender = dbValorMulta) ) then
//      IbDtstTabelaVALORSALDO.Value := IbDtstTabelaVALORREC.AsCurrency + IbDtstTabelaVALORMULTA.AsCurrency - IbDtstTabelaVALORRECTOT.AsCurrency;

end;

procedure TfrmGeContasAReceber.ControleLabels;
begin
  lblVenda.Caption  := 'No. Venda:';
  daVenda.DataField := 'ANOVENDA';
  dnVenda.DataField := 'NUMVENDA';

  lblNFe.Caption  := 'NF-e:';
  dbNFe.DataField := 'NFE_VENDA';
  if (IbDtstTabelaNUMOS.AsInteger > 0) then
  begin
    lblVenda.Caption  := 'No. OS:';
    daVenda.DataField := 'ANOOS';
    dnVenda.DataField := 'NUMOS';

    lblNFe.Caption  := 'NFS-e:';
    dbNFe.DataField := 'NFSE_OS';
  end;
end;

procedure TfrmGeContasAReceber.dbFormaPagtoClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( fdQryFormaPagto.Locate('cod', dbFormaPagto.Field.AsInteger, []) ) then
      IbDtstTabelaTIPPAG.AsString := fdQryFormaPagto.FieldByName('descri').AsString;
end;

procedure TfrmGeContasAReceber.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Títulos A Pagar cancelados
    if (IbDtstTabelaSITUACAO.AsInteger = 0) then
      dbgDados.Canvas.Font.Color := lblLancamentoCancelado.Font.Color
    else
    // Destacar Títulos A Pagar em aberto
    if ( not IbDtstTabelaBAIXADO.IsNull ) then
      if ( IbDtstTabelaBAIXADO.AsInteger = STATUS_ARECEBER_PENDENTE ) then
        if IbDtstTabelaDTVENC.AsDateTime >= DataAtual then
          dbgDados.Canvas.Font.Color := lblLancamentoAberto.Font.Color
        else
        begin
          dbgDados.Canvas.Font.Color  := lblLancamentoVencido.Font.Color;
          dbgDados.Canvas.Brush.Color := lblLancamentoVencido.Color;
        end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TfrmGeContasAReceber.dbgPagamentosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente,
  MovAno    ,
  MovNumero : Integer;
  DataPagto : TDateTime;
begin
  if (Shift = [ssCtrl]) and (Key = 46) Then
  begin

    if not LiberarUso then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    if ( not cdsPagamentos.IsEmpty ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if ( fdQryFormaPagto.Locate('cod', IbDtstTabelaFORMA_PAGTO.AsInteger, []) ) then
        if ( fdQryFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
          if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, GetUserApp, GetDateDB, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
          begin
            ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
            Exit;
          end;

      MovAno    := IbDtstTabelaANOLANC.AsInteger;
      MovNumero := IbDtstTabelaNUMLANC.AsInteger;
      DataPagto := cdsPagamentosDATA_PAGTO.AsDateTime;

//    sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');
//
//    if ( Trim(sSenha) = EmptyStr ) then
//      Exit;
//
//    if ( sSenha <> GetSenhaAutorizacao ) then
//    begin
//      ShowWarning('Senha de autorização inválida');
//      Exit;
//    end;

      if ShowConfirm('Confirma a exclusão do(s) registro(s) de pagamento(s)?') then
      begin

        // Registrar Estorno
        
        if ( CxContaCorrente > 0 ) then
        begin
          cdsPagamentos.First;

          while not cdsPagamentos.Eof do
          begin
            SetMovimentoCaixaEstorno(
              GetUserApp,
              cdsPagamentosDATA_PAGTO.AsDateTime + Time,
              cdsPagamentosFORMA_PAGTO.AsInteger,
              cdsPagamentosANOLANC.AsInteger,
              cdsPagamentosNUMLANC.AsInteger,
              cdsPagamentosSEQ.AsInteger,
              cdsPagamentosVALOR_BAIXA.AsCurrency,
              tmcxCredito);

            cdsPagamentos.Next;
          end;
        end;

        with DMBusiness, fdQryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete from TBCONTREC_BAIXA');
          SQL.Add('where ANOLANC = ' + cdsPagamentosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + cdsPagamentosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        with DMBusiness, fdQryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update TBCONTREC Set');
          SQL.Add('    BAIXADO      = 0');
          SQL.Add('  , VALORMULTA   = Null');
          SQL.Add('  , VALORRECTOT  = Null');
          SQL.Add('  , VALORSALDO   = VALORREC');
          SQL.Add('  , HISTORIC = ''''');
          SQL.Add('  , DTREC    = null');
          SQL.Add('  , DOCBAIX  = null');
          SQL.Add('  , TIPPAG   = null');
          SQL.Add('where ANOLANC = ' + cdsPagamentosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + cdsPagamentosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

        IbDtstTabela.Close;
        IbDtstTabela.Open;

        IbDtstTabela.Locate('ANOLANC;NUMLANC', VarArrayOf([MovAno, MovNumero]), []);

        AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeContasAReceber.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  if IbDtstTabelaCOMPETENCIA_APURACAO.IsNull then
    IbDtstTabelaCOMPETENCIA_APURACAO.Value := GetCompetenciaID(IbDtstTabelaDTEMISS.AsDateTime);

  if ( (IbDtstTabelaANOVENDA.AsInteger = 0) and (IbDtstTabelaPARCELA.AsInteger <= 0) ) then
    IbDtstTabelaPARCELA.AsInteger := 1;

  if ( IbDtstTabela.State = dsEdit ) then
    if ( VarToStr(IbDtstTabelaDTVENC.OldValue) <> VarToStr(IbDtstTabelaDTVENC.NewValue) ) then
      DesbloquearCliente(IbDtstTabelaCLIENTE.AsInteger, EmptyStr);
end;

procedure TfrmGeContasAReceber.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  iCompetencia : Integer;
begin
  if ( Field = IbDtstTabelaEMPRESA ) then
    CarregarFormaPagto(IbDtstTabelaEMPRESA.AsString)
  else
  if ( Field = IbDtstTabelaDTEMISS ) then
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if not IbDtstTabelaDTEMISS.IsNull then
      begin
        iCompetencia := GetCompetenciaID(IbDtstTabelaDTEMISS.AsDateTime);
        fdQryCompetencia.Close;
        fdQryCompetencia.Open;

        IbDtstTabelaCOMPETENCIA_APURACAO.AsInteger := iCompetencia;
      end;
end;

procedure TfrmGeContasAReceber.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValorAReceber.ReadOnly := (not cdsPagamentos.IsEmpty);
  btbtnIncluirLote.Enabled := btbtnIncluir.Enabled;
  HabilitarDesabilitar_Btns;
  ControleLabels;

  CarregarFormaPagto(IbDtstTabelaEMPRESA.AsString);
  CarregarTipoReceita( (IbDtstTabela.State in [dsEdit, dsInsert]) );
end;

procedure TfrmGeContasAReceber.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );

  ControleLabels;
end;

procedure TfrmGeContasAReceber.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

procedure TfrmGeContasAReceber.btbtnIncluirLoteClick(Sender: TObject);
var
  sEmpresa ,
  sLote    : String;
  iCliente : Integer;
  dDataEmissao    ,
  dVencimentoFirst,
  dVencimentoLast : TDateTime;
begin
  if btbtnIncluir.Enabled then
  begin
    sEmpresa     := gUsuarioLogado.Empresa;
    sLote        := EmptyStr;
    iCliente     := 0;
    dDataEmissao := GetDateDB;
    dVencimentoFirst := dDataEmissao + 30;
    dVencimentoLast  := dDataEmissao + 60;

    if GerarLoteParcelas(Self, sEmpresa, sLote, iCliente, dDataEmissao, dVencimentoFirst, dVencimentoLast)  then
    begin
      pgcGuias.ActivePage := tbsTabela;
      e1Data.Date     := dVencimentoFirst;
      e2Data.Date     := dVencimentoLast;
      edtFiltrar.Text := GetClienteNome(iCliente);
      FLoteParcelas   := sLote;
      btnFiltrar.Click;

      FLoteParcelas := EmptyStr;
    end;
  end;
end;

procedure TfrmGeContasAReceber.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

function TfrmGeContasAReceber.GetRotinaCancelarPagtosID: String;
begin
  Result := GetRotinaInternaID(dbgPagamentos);
end;

function TfrmGeContasAReceber.GetRotinaEfetuarPagtoID: String;
begin
  Result := GetRotinaInternaID(btbtnEfetuarPagto);
end;

procedure TfrmGeContasAReceber.RecarregarRegistro;
var
  MovAno    ,
  MovNumero : Integer;
begin
  MovAno    := IbDtstTabelaANOLANC.AsInteger;
  MovNumero := IbDtstTabelaNUMLANC.AsInteger;

  if ( not IbDtstTabelaDTVENC.IsNull ) then
  begin
    if ( IbDtstTabelaDTVENC.AsDateTime < e1Data.Date ) then
      e1Data.Date := IbDtstTabelaDTVENC.AsDateTime;

    if ( IbDtstTabelaDTVENC.AsDateTime > e2Data.Date ) then
      e2Data.Date := IbDtstTabelaDTVENC.AsDateTime;
  end;

  IbDtstTabela.Close;
  IbDtstTabela.Open;

  if not IbDtstTabela.Locate('ANOLANC;NUMLANC', VarArrayOf([MovAno, MovNumero]), []) then
  begin
    IbDtstTabela.Close;

    ShowInformation('Favor pesquisar novamente o registro de despesa!');
    pgcGuias.ActivePage := tbsTabela;
    edtFiltrar.SetFocus;
  end;
end;

procedure TfrmGeContasAReceber.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnEfetuarPagto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEfetuarPagtoID, btbtnEfetuarPagto.Hint, RotinaID);

    if dbgPagamentos.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarPagtosID, 'Cancelar Pagamentos', RotinaID);
  end;
end;

procedure TfrmGeContasAReceber.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';
end;

procedure TfrmGeContasAReceber.FrReciboGetValue(const VarName: string;
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

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FImprimirCabecalho, 1, 0);
end;

initialization
  FormFunction.RegisterForm('frmGeContasAReceber', TfrmGeContasAReceber);

end.
