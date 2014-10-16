unit UGeContasAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RXDBCtrl, IBTable, IBQuery, frxClass, frxDBSet,
  DBClient, Provider, Menus, ACBrBase, ACBrExtenso;

type
  TfrmGeContasAPagar = class(TfrmGrPadraoCadastro)
    lblEmpresa: TLabel;
    dbEmpresa: TDBEdit;
    IbDtstTabelaANOLANC: TSmallintField;
    IbDtstTabelaNUMLANC: TIntegerField;
    IbDtstTabelaPARCELA: TSmallintField;
    IbDtstTabelaCODFORN: TSmallintField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaNOTFISC: TIBStringField;
    IbDtstTabelaTIPPAG: TIBStringField;
    IbDtstTabelaDTEMISS: TDateField;
    IbDtstTabelaDTVENC: TDateField;
    IbDtstTabelaVALORPAG: TIBBCDField;
    IbDtstTabelaBANCO: TSmallintField;
    IbDtstTabelaBCO_NOME: TIBStringField;
    IbDtstTabelaNUMCHQ: TIBStringField;
    IbDtstTabelaPAGO_: TIBStringField;
    IbDtstTabelaDOCBAIX: TIBStringField;
    btbtnEfetuarPagto: TBitBtn;
    IbDtstTabelaNOMEEMP: TIBStringField;
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblValorAPagar: TLabel;
    dbValorAPagar: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsHistorico: TTabSheet;
    dbObservacao: TDBMemo;
    IbDtstTabelaHISTORIC: TMemoField;
    IbDtstTabelaFORMA_PAGTO: TSmallintField;
    IbDtstTabelaCONDICAO_PAGTO: TSmallintField;
    IbDtstTabelaQUITADO: TSmallintField;
    IbDtstTabelaDTPAG: TDateField;
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
    cdsPagamentosBCO_NOME: TIBStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TIBStringField;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    IbDtstTabelaCODTPDESP: TSmallintField;
    dtsTpDespesa: TDataSource;
    qryTpDespesa: TIBQuery;
    lblLancamentoAberto: TLabel;
    lblCaixaCancelado: TLabel;
    Label1: TLabel;
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    FrdRecibo: TfrxDBDataset;
    FrRecibo: TfrxReport;
    QryRecibo: TIBQuery;
    DspRecibo: TDataSetProvider;
    CdsRecibo: TClientDataSet;
    CdsReciboANOLANC: TSmallintField;
    CdsReciboNUMLANC: TIntegerField;
    CdsReciboPARCELA: TSmallintField;
    CdsReciboCODFORN: TSmallintField;
    CdsReciboNOMEEMP: TStringField;
    CdsReciboNOMEFORN: TStringField;
    CdsReciboPESSOA_FISICA: TSmallintField;
    CdsReciboCNPJ: TStringField;
    CdsReciboNOTFISC: TStringField;
    CdsReciboTIPPAG: TStringField;
    CdsReciboDTEMISS: TDateField;
    CdsReciboDTVENC: TDateField;
    CdsReciboDTPAG: TDateField;
    CdsReciboVALORPAG: TBCDField;
    CdsReciboBANCO: TSmallintField;
    CdsReciboBCO_NOME: TStringField;
    CdsReciboNUMCHQ: TStringField;
    CdsReciboPAGO_: TStringField;
    CdsReciboDOCBAIX: TStringField;
    CdsReciboQUITADO: TSmallintField;
    CdsReciboCODTPDESP: TSmallintField;
    CdsReciboDATA_PAGTO: TDateField;
    CdsReciboFORMA_PAGTO_DESC: TStringField;
    CdsReciboHISTORICO: TMemoField;
    CdsReciboVALOR_BAIXA: TBCDField;
    CdsReciboVALOR_BAIXA_EXTENSO: TStringField;
    CdsReciboFORMA_PAGTO: TSmallintField;
    CdsReciboSEQ: TSmallintField;
    popImprimir: TPopupMenu;
    popGerarRecibo: TMenuItem;
    ACBrExtenso: TACBrExtenso;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaVALORSALDO: TIBBCDField;
    lblSaldoAPagar: TLabel;
    dbSaldoAPagar: TDBEdit;
    dbEmissao: TDBDateEdit;
    dbVencimento: TDBDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaQUITADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnEfetuarPagtoClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure CdsReciboCalcFields(DataSet: TDataSet);
    procedure FrReciboGetValue(const VarName: String; var Value: Variant);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    SQL_Pagamentos : TStringList;
    procedure AbrirPagamentos(const Ano : Smallint; const Numero : Integer);
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;

    function GetRotinaEfetuarPagtoID : String;
    function GetRotinaCancelarPagtosID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaEfetuarPagtoID : String read GetRotinaEfetuarPagtoID;
    property RotinaCancelarPagtosID : String read GetRotinaCancelarPagtosID;
  end;

var
  frmGeContasAPagar: TfrmGeContasAPagar;

  { DONE -oIsaque -cContas A Pagar : 22/05/2014 - Correção de BUG porque a rotina estava permitindo a gravação de um lançamento sem FORNECEDOR, DATAS e VALOR }

const
  STATUS_APAGAR_PENDENTE = 0;
  STATUS_APAGAR_PAGO     = 1;

  procedure MostrarControleContasAPagar(const AOwner : TComponent);

implementation

uses
  UConstantesDGE, UDMBusiness, UGeFornecedor, DateUtils, UGeEfetuarPagtoPAG,
  UGrPadrao;

{$R *.dfm}

procedure MostrarControleContasAPagar(const AOwner : TComponent);
var
  frm : TfrmGeContasAPagar;
  whr : String; 
begin
  frm := TfrmGeContasAPagar.Create(AOwner);
  try
    whr :=
      '(p.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and ' +
      '(cast(p.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) +
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

procedure TfrmGeContasAPagar.FormCreate(Sender: TObject);
begin
  IbDtstTabela.GeneratorField.Generator := 'GEN_CONTAPAG_NUM_' + FormatFloat('0000', YearOf(Date));

  inherited;

  SQL_Pagamentos := TStringList.Create;
  SQL_Pagamentos.AddStrings( cdsPagamentos.SelectSQL );

  e1Data.Date     := GetMenorVencimentoAPagar;
  e2Data.Date     := GetDateLastMonth;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbFornecedor;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  qryTpDespesa.Open;

  RotinaID            := ROTINA_FIN_CONTA_APAGAR_ID;
  DisplayFormatCodigo := '###0000000';
  
  NomeTabela     := 'TBCONTPAG';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'NomeForn';
  CampoOrdenacao := 'p.dtvenc, f.NomeForn';

  WhereAdditional :=
    '(p.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and ' +
    '(cast(p.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  UpdateGenerator( 'where anolanc = ' + FormatFloat('0000', YearOf(Date)) );

  UpdateGenerator;
end;

procedure TfrmGeContasAPagar.dbFornecedorButtonClick(Sender: TObject);
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

procedure TfrmGeContasAPagar.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    '(p.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and ' +
    '(cast(p.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  inherited;
end;

procedure TfrmGeContasAPagar.IbDtstTabelaQUITADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;
    
  Case Sender.AsInteger of
    STATUS_APAGAR_PENDENTE : Text := 'A Pagar';
    STATUS_APAGAR_PAGO     : Text := 'Pago';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeContasAPagar.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaANOLANC.Value := YearOf(Date);
  IbDtstTabelaEMPRESA.Value := GetEmpresaIDDefault;
  IbDtstTabelaNOMEEMP.Value := GetEmpresaNomeDefault;
  IbDtstTabelaPARCELA.Value := 0;
  IbDtstTabelaDTEMISS.Value := Date;
  IbDtstTabelaQUITADO.Value := STATUS_APAGAR_PENDENTE;
  IbDtstTabelaFORMA_PAGTO.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaCONDICAO_PAGTO.Value := GetCondicaoPagtoIDDefault;
end;

procedure TfrmGeContasAPagar.btbtnEfetuarPagtoClick(Sender: TObject);
var
  sSenha   : String;
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  CxAno    := 0;
  CxNumero := 0;
  CxContaCorrente := 0;

  RecarregarRegistro;

  if ( IbDtstTabelaQUITADO.AsInteger = 1 ) then
  begin
    ShowWarning('Registro de despesa selecionada já se encontra quitado!' + #13 + 'Favor pesquisar novamente.');
    Abort;
  end;

  if ( tblCondicaoPagto.Locate('COND_COD', IbDtstTabelaCONDICAO_PAGTO.AsInteger, []) ) then
    if ( tblCondicaoPagto.FieldByName('COND_PRAZO').AsInteger = 0 ) then
      if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, GetUserApp, GetDateDB, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
      begin
        ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
        Exit;
      end;

{  sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');

  if ( Trim(sSenha) = EmptyStr ) then
    Exit;

  if ( sSenha <> GetSenhaAutorizacao ) then
  begin
    ShowWarning('Senha de autorização inválida');
    Exit;
  end;
 }
  if PagamentoConfirmado(Self, IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger, IbDtstTabelaFORMA_PAGTO.AsInteger, IbDtstTabelaNOMEFORN.AsString, DataPagto) then
  begin
    if ( CxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

    RecarregarRegistro;

    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );

  end;
end;

procedure TfrmGeContasAPagar.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnEfetuarPagto.Enabled := (IbDtstTabelaQUITADO.AsInteger = STATUS_APAGAR_PENDENTE) and (not IbDtstTabela.IsEmpty) and (IbDtstTabela.State = dsBrowse);
    popGerarRecibo.Enabled    := (not cdsPagamentos.IsEmpty);
  end
  else
  begin
    btbtnEfetuarPagto.Enabled := False;
    popGerarRecibo.Enabled    := False;
  end;
end;

procedure TfrmGeContasAPagar.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAPagar.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
end;

procedure TfrmGeContasAPagar.AbrirPagamentos(const Ano: Smallint;
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

procedure TfrmGeContasAPagar.btbtnAlterarClick(Sender: TObject);
begin
  if ( IbDtstTabelaQUITADO.AsInteger = STATUS_APAGAR_PAGO ) then
  begin
    ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      if ( Trim(IbDtstTabelaNOMEEMP.AsString) = EmptyStr ) then
        IbDtstTabelaNOMEEMP.Value := GetEmpresaNomeDefault;
        
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
    end;
  end;
end;

procedure TfrmGeContasAPagar.btbtnExcluirClick(Sender: TObject);
begin
  if ( IbDtstTabelaQUITADO.AsInteger = STATUS_APAGAR_PAGO ) then
  begin
    ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
    Abort;
  end
  else
  begin
    // Eliminar Movimento do Caixa quando o lançamento for excluído pelo SYSTEM ADM

    if (gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_SYSTEM_ADM]) then
    begin

      with DMBusiness, qryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Delete from TBCAIXA_MOVIMENTO');
        SQL.Add('where APAGAR_ANO = ' + IbDtstTabelaANOLANC.AsString);
        SQL.Add('  and APAGAR_NUM = ' + IbDtstTabelaNUMLANC.AsString);
        ExecSQL;

        CommitTransaction;
      end;

    end;

    inherited;

    if ( not OcorreuErro ) then
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
  end;
end;

procedure TfrmGeContasAPagar.FormShow(Sender: TObject);
begin
  inherited;
  qryTpDespesa.Prior;
  qryTpDespesa.Last;
  
  RegistrarNovaRotinaSistema;
end;

procedure TfrmGeContasAPagar.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Caixas Abertos
    if ( IbDtstTabelaQUITADO.AsInteger = STATUS_APAGAR_PENDENTE ) then
      dbgDados.Canvas.Font.Color := lblLancamentoAberto.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
//  else
//  // Destacar produtos em Promocao
//  if ( Sender = dbgProdutos ) then
//  begin
//    if ( cdsTabelaItensPUNIT_PROMOCAO.AsCurrency > 0 ) then
//      dbgProdutos.Canvas.Font.Color := lblProdutoPromocao.Font.Color;
//
//    dbgProdutos.DefaultDrawDataCell(Rect, dbgProdutos.Columns[DataCol].Field, State);
//  end;
end;

procedure TfrmGeContasAPagar.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
begin
  if (Shift = [ssCtrl]) and (Key = 46) Then
  begin
  
    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    if ( not cdsPagamentos.IsEmpty ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if ( tblFormaPagto.Locate('cod', IbDtstTabelaFORMA_PAGTO.AsInteger, []) ) then
        if ( tblFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
          if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, GetUserApp, GetDateDB, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
          begin
            ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
            Exit;
          end;

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

      DataPagto := cdsPagamentosDATA_PAGTO.AsDateTime;

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
              tmcxDebito);

            cdsPagamentos.Next;
          end;
        end;

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete from TBCONTPAG_BAIXA');
          SQL.Add('where ANOLANC = ' + cdsPagamentosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + cdsPagamentosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Update TBCONTPAG Set');
          SQL.Add('    QUITADO      = 0');
          SQL.Add('  , VALORMULTA   = 0.0');
          SQL.Add('  , VALORPAGTOT  = 0.0');
          SQL.Add('  , VALORSALDO   = VALORPAG');
          SQL.Add('  , HISTORIC = ''''');
          SQL.Add('  , DTPAG    = null');
          SQL.Add('  , DOCBAIX  = null');
          SQL.Add('  , TIPPAG   = null');
          SQL.Add('  , NUMCHQ   = null');
          SQL.Add('  , BANCO    = null');
          SQL.Add('where ANOLANC = ' + cdsPagamentosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + cdsPagamentosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        if ( CxContaCorrente > 0 ) then
          GerarSaldoContaCorrente(CxContaCorrente, DataPagto);
          
        RecarregarRegistro;

        AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeContasAPagar.popGerarReciboClick(Sender: TObject);
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

  frReport := FrRecibo;
  SetVariablesDefault(frReport);

  frReport.PrepareReport;
  frReport.ShowReport;
end;

procedure TfrmGeContasAPagar.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeContasAPagar.CdsReciboCalcFields(DataSet: TDataSet);
begin
  CdsReciboVALOR_BAIXA_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsReciboVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
end;

procedure TfrmGeContasAPagar.FrReciboGetValue(const VarName: String;
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

procedure TfrmGeContasAPagar.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  IbDtstTabelaVALORSALDO.AsCurrency := IbDtstTabelaVALORPAG.AsCurrency; 
  inherited;
end;

procedure TfrmGeContasAPagar.RecarregarRegistro;
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

procedure TfrmGeContasAPagar.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValorAPagar.ReadOnly := (not cdsPagamentos.IsEmpty);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAPagar.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
end;

procedure TfrmGeContasAPagar.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

function TfrmGeContasAPagar.GetRotinaCancelarPagtosID: String;
begin
  Result := GetRotinaInternaID(dbgPagamentos);
end;

function TfrmGeContasAPagar.GetRotinaEfetuarPagtoID: String;
begin
  Result := GetRotinaInternaID(btbtnEfetuarPagto);
end;

procedure TfrmGeContasAPagar.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnEfetuarPagto.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEfetuarPagtoID, btbtnEfetuarPagto.Hint, RotinaID);

    if dbgPagamentos.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarPagtosID, 'Cancelar Pagamentos', RotinaID);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeContasAPagar', TfrmGeContasAPagar);

end.
