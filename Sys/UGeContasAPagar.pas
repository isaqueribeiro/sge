unit UGeContasAPagar;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, ToolWin, IBTable, IBQuery, frxClass, frxDBSet, DBClient, Provider, Menus, ACBrBase,
  ACBrExtenso, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons, JvToolEdit,
  JvDBControls, JvExMask, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver;

type
  TfrmGeContasAPagar = class(TfrmGrPadraoCadastro)
    lblEmpresa: TLabel;
    dbEmpresa: TDBEdit;
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNotaFiscal: TLabel;
    dbNotaFiscal: TDBEdit;
    lblFornecedor: TLabel;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblValorAPagar: TLabel;
    dbValorAPagar: TDBEdit;
    dtsEmpresa: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsHistorico: TTabSheet;
    dbObservacao: TDBMemo;
    lblQuitado: TLabel;
    Bevel6: TBevel;
    dbgPagamentos: TDBGrid;
    Bevel7: TBevel;
    dtsPagamentos: TDataSource;
    lblTipoDespesa: TLabel;
    dbTipoDespesa: TDBLookupComboBox;
    dtsTpDespesa: TDataSource;
    lblLancamentoAberto: TLabel;
    lblLancamentoVencido: TLabel;
    lblData: TLabel;
    FrdRecibo: TfrxDBDataset;
    FrReciboA5: TfrxReport;
    DspRecibo: TDataSetProvider;
    CdsRecibo: TClientDataSet;
    CdsReciboVALOR_BAIXA_EXTENSO: TStringField;
    popImprimir: TPopupMenu;
    popGerarReciboA4: TMenuItem;
    ACBrExtenso: TACBrExtenso;
    lblSaldoAPagar: TLabel;
    dbSaldoAPagar: TDBEdit;
    btbtnEfetuarPagto: TcxButton;
    dbEmissao: TJvDBDateEdit;
    dbVencimento: TJvDBDateEdit;
    dbFornecedor: TJvDBComboEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    Bevel9: TBevel;
    btbtnIncluirLote: TcxButton;
    dtsCompetencia: TDataSource;
    lblCompetenciaApuracao: TLabel;
    dbCompetenciaApuracao: TDBLookupComboBox;
    daCompra: TDBEdit;
    dnCompra: TDBEdit;
    lblCompra: TLabel;
    FrReciboA4: TfrxReport;
    popGerarReciboA5: TMenuItem;
    fdQryEmpresa: TFDQuery;
    fdQryFormaPagto: TFDQuery;
    fdQryCondicaoPagto: TFDQuery;
    fdQryCompetencia: TFDQuery;
    fdQryTipoDespesa: TFDQuery;
    fdQryRecibo: TFDQuery;
    lblLancamentoCancelado: TLabel;
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
    CdsReciboBANCO: TSmallintField;
    CdsReciboBCO_NOME: TStringField;
    CdsReciboNUMCHQ: TStringField;
    CdsReciboPAGO_: TStringField;
    CdsReciboDOCBAIX: TStringField;
    CdsReciboQUITADO: TSmallintField;
    CdsReciboCODTPDESP: TSmallintField;
    CdsReciboSEQ: TSmallintField;
    CdsReciboDATA_PAGTO: TDateField;
    CdsReciboFORMA_PAGTO: TSmallintField;
    CdsReciboFORMA_PAGTO_DESC: TStringField;
    CdsReciboHISTORICO: TMemoField;
    fdQryTabelaANOLANC: TSmallintField;
    fdQryTabelaNUMLANC: TIntegerField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaPARCELA: TSmallintField;
    fdQryTabelaCODFORN: TSmallintField;
    fdQryTabelaNOMEEMP: TStringField;
    fdQryTabelaNOMEFORN: TStringField;
    fdQryTabelaCNPJ: TStringField;
    fdQryTabelaNOTFISC: TStringField;
    fdQryTabelaTIPPAG: TStringField;
    fdQryTabelaDTEMISS: TDateField;
    fdQryTabelaDTVENC: TDateField;
    fdQryTabelaDTPAG: TDateField;
    fdQryTabelaBANCO: TSmallintField;
    fdQryTabelaBCO_NOME: TStringField;
    fdQryTabelaNUMCHQ: TStringField;
    fdQryTabelaHISTORIC: TMemoField;
    fdQryTabelaFORMA_PAGTO: TSmallintField;
    fdQryTabelaCONDICAO_PAGTO: TSmallintField;
    fdQryTabelaPAGO_: TStringField;
    fdQryTabelaDOCBAIX: TStringField;
    fdQryTabelaQUITADO: TSmallintField;
    fdQryTabelaSITUACAO: TSmallintField;
    fdQryTabelaCODTPDESP: TSmallintField;
    fdQryTabelaLOTE: TStringField;
    fdQryTabelaCOMPETENCIA_APURACAO: TIntegerField;
    fdQryTabelaANOCOMPRA: TSmallintField;
    fdQryTabelaNUMCOMPRA: TIntegerField;
    cdsPagamentos: TFDQuery;
    cdsPagamentosANOLANC: TSmallintField;
    cdsPagamentosNUMLANC: TIntegerField;
    cdsPagamentosSEQ: TSmallintField;
    cdsPagamentosHISTORICO: TMemoField;
    cdsPagamentosDATA_PAGTO: TDateField;
    cdsPagamentosFORMA_PAGTO: TSmallintField;
    cdsPagamentosFORMA_PAGTO_DESC: TStringField;
    cdsPagamentosNUMERO_CHEQUE: TStringField;
    cdsPagamentosBANCO: TSmallintField;
    cdsPagamentosBANCO_FEBRABAN: TStringField;
    cdsPagamentosBCO_NOME: TStringField;
    cdsPagamentosDOCUMENTO_BAIXA: TStringField;
    fdQryTabelaVALORPAG: TFMTBCDField;
    fdQryTabelaVALORSALDO: TFMTBCDField;
    CdsReciboVALORPAG: TFMTBCDField;
    CdsReciboVALOR_BAIXA: TFMTBCDField;
    cdsPagamentosVALOR_BAIXA: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
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
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnIncluirLoteClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaQUITADOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    FDataAtual     : TDateTime;
    sGeneratorName ,
    FLoteParcelas  : String;
    SQL_Pagamentos : TStringList;
    FImprimirCabecalho : Boolean;
    procedure AbrirPagamentos(const Ano : Smallint; const Numero : Integer);
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;
    procedure CarregarFormaPagto(const pEmpresa : String);
    procedure CarregarTipoDespesa(const ApenasAtivos : Boolean);

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
  - TBCONTPAG
  - TBEMPRESA
  - TBFORNECEDOR
  - TBCONTPAG_BAIXA
  - TBBANCO_BOLETO
  - TBFORMPAGTO
  - TBCOMPETENCIA

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  frmGeContasAPagar: TfrmGeContasAPagar;

  { DONE -oIsaque -cContas A Pagar : 22/05/2014 - Correção de BUG porque a rotina estava permitindo a gravação de um lançamento sem FORNECEDOR, DATAS e VALOR }

const
  STATUS_APAGAR_PENDENTE = 0;
  STATUS_APAGAR_PAGO     = 1;

  procedure MostrarControleContasAPagar(const AOwner : TComponent);

implementation

uses
    DateUtils
  , Controller.Tabela
  , UGrPadrao
  , UConstantesDGE
  , UDMBusiness
  , UGeFornecedor
  , UGeEfetuarPagtoPAG
  , UGeContasAPagarLoteParcela;

{$R *.dfm}

procedure MostrarControleContasAPagar(const AOwner : TComponent);
var
  frm : TfrmGeContasAPagar;
  whr : String; 
begin
  frm := TfrmGeContasAPagar.Create(AOwner);
  try
    whr :=
      '(p.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ')' +
      ' and (cast(p.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) +
      ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) ) + ')';

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

procedure TfrmGeContasAPagar.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_CONTAPAG_NUM_' + FormatFloat('0000', YearOf(Date));
  CriarGenerator(sGeneratorName, 0);

  SetTipoDespesaPadrao;

  with fdQryTabela.UpdateOptions do
  begin
    AutoIncFields := 'NUMLANC';
    GeneratorName := sGeneratorName;
  end;

  inherited;

  SQL_Pagamentos := TStringList.Create;
  SQL_Pagamentos.AddStrings( cdsPagamentos.SQL );

  FDataAtual      := GetDateTimeDB;
  e1Data.Date     := GetMenorVencimentoAPagar;
  e2Data.Date     := GetDateLastMonth;

  if (e1Data.Date > GetDateDB) then
    e1Data.Date   := GetDateDB;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbFornecedor;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryCondicaoPagto);
  CarregarLista(fdQryCompetencia);
  CarregarFormaPagto(gUsuarioLogado.Empresa);
  CarregarTipoDespesa(False);

  RotinaID            := ROTINA_FIN_CONTA_APAGAR_ID;
  DisplayFormatCodigo := '###0000000';
  
  NomeTabela     := 'TBCONTPAG';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'NomeForn';
  CampoOrdenacao := 'p.dtvenc, f.NomeForn';
  FLoteParcelas  := EmptyStr;

  WhereAdditional :=
    '(p.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ')' +
    ' and (cast(p.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  Tabela
    .Display('NUMLANC', 'Código', '###0000000', TAlignment.taCenter)
    .Display('VALORPAG', 'Valor A Pagar (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORSALDO', 'Saldo A Pagar (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  TTabelaController
    .New
    .Tabela( cdsPagamentos )
    .Display('VALOR_BAIXA', 'Valor Pago (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsPagamentos );
end;

procedure TfrmGeContasAPagar.dbFornecedorButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ   ,
  sNome   : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
      begin
        FieldByName('CODFORN').AsInteger := iCodigo;
        FieldByName('CNPJ').AsString     := sCNPJ;
        FieldByName('NOMEFORN').AsString := sNome;
      end;
  end;
end;

procedure TfrmGeContasAPagar.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    '(p.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ')' +
    ' and (cast(p.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  if Trim(FLoteParcelas) <> EmptyStr then
    WhereAdditional := '(' + WhereAdditional + ' and (p.lote = ' + QuotedStr(FLoteParcelas) + '))';

  inherited;
end;

procedure TfrmGeContasAPagar.btbtnIncluirLoteClick(Sender: TObject);
var
  sEmpresa,
  sLote   : String;
  iFornecedor : Integer;
  dDataEmissao    ,
  dVencimentoFirst,
  dVencimentoLast : TDateTime;
begin
  if btbtnIncluir.Enabled then
  begin
    sEmpresa     := gUsuarioLogado.Empresa;
    sLote        := EmptyStr;
    iFornecedor  := 0;
    dDataEmissao := GetDateDB;
    dVencimentoFirst := dDataEmissao + 30;
    dVencimentoLast  := dDataEmissao + 60;

    if GerarLoteParcelas(Self, sEmpresa, sLote, iFornecedor, dDataEmissao, dVencimentoFirst, dVencimentoLast)  then
    begin
      pgcGuias.ActivePage := tbsTabela;
      e1Data.Date     := dVencimentoFirst;
      e2Data.Date     := dVencimentoLast;
      edtFiltrar.Text := GetFornecedorRazao(iFornecedor);
      FLoteParcelas   := sLote;
      btnFiltrar.Click;

      FLoteParcelas := EmptyStr;
    end;
  end;
end;

procedure TfrmGeContasAPagar.btbtnEfetuarPagtoClick(Sender: TObject);
var
//  sSenha   : String;
//  CxAno    ,
//  CxNumero ,
  CxContaCorrente : Integer;
  DataPagto : TDateTime;
  cAPagar   : Currency;
begin
(*
  IMR - 17/09/2015
    Remoção do trecho de código que verifica a existência de caixa aberto antes da
    inserção da baixa. Esta validação passou para a tela de Efetuação do Pagamento.
*)
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

//  CxAno    := 0;
//  CxNumero := 0;
  CxContaCorrente := 0;

  RecarregarRegistro;

  if ( not DtSrcTabela.DataSet.Active ) then
    Exit;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('QUITADO').AsInteger = 1 ) then
    begin
      ShowWarning('Registro de despesa selecionada já se encontra quitado!' + #13 + 'Favor pesquisar novamente.');
      Abort;
    end;
  {
    if ( tblCondicaoPagto.Locate('COND_COD', FieldByName('CONDICAO_PAGTO').AsInteger, []) ) then
      if ( tblCondicaoPagto.FieldByName('COND_PRAZO').AsInteger = 0 ) then
        if ( not CaixaAberto(FieldByName('EMPRESA').AsString, GetUserApp, GetDateDB, FieldByName('FORMA_PAGTO').AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
        begin
          ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
          Exit;
        end;
  }
  {  sSenha := InputBox('Favor informar a senha de autorização', 'Senha de Autorização:', '');

    if ( Trim(sSenha) = EmptyStr ) then
      Exit;

    if ( sSenha <> GetSenhaAutorizacao ) then
    begin
      ShowWarning('Senha de autorização inválida');
      Exit;
    end;
   }
    cAPagar := FieldByName('VALORSALDO').AsCurrency;

    if PagamentoConfirmado(Self, FieldByName('EMPRESA').AsString,
      FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger,
      FieldByName('FORMA_PAGTO').AsInteger, FieldByName('NOMEFORN').AsString,
      CxContaCorrente, DataPagto, cAPagar) then
    begin
      if ( CxContaCorrente > 0 ) then
        GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

      RecarregarRegistro;
      AbrirPagamentos( FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger );
    end;
  end;
end;

procedure TfrmGeContasAPagar.HabilitarDesabilitar_Btns;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( pgcGuias.ActivePage = tbsCadastro ) then
    begin
      btbtnEfetuarPagto.Enabled := (FieldByName('SITUACAO').AsInteger = 1) and (FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PENDENTE) and (not IsEmpty) and (State = dsBrowse);
      popGerarReciboA4.Enabled  := (FieldByName('SITUACAO').AsInteger = 1) and (not cdsPagamentos.IsEmpty);
      popGerarReciboA5.Enabled  := (FieldByName('SITUACAO').AsInteger = 1) and (not cdsPagamentos.IsEmpty);
    end
    else
    begin
      btbtnEfetuarPagto.Enabled := False;
      popGerarReciboA4.Enabled  := False;
      popGerarReciboA5.Enabled  := False;
    end;
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
  with DtSrcTabela.DataSet do
    AbrirPagamentos( FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger );
end;

procedure TfrmGeContasAPagar.AbrirPagamentos(const Ano: Smallint;
  const Numero: Integer);
begin
  cdsPagamentos.Close;

  with cdsPagamentos, SQL do
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
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PAGO ) then
    begin
      ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
      Abort;
    end
    else
    begin
      inherited;
      if ( not OcorreuErro ) then
      begin
        if ( Trim(FieldByName('NOMEEMP').AsString) = EmptyStr ) then
          FieldByName('NOMEEMP').AsString := Copy(GetEmpresaNome(gUsuarioLogado.Empresa), 1, FieldByName('NOMEEMP').Size);

        AbrirPagamentos( FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeContasAPagar.btbtnExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PAGO ) then
  begin
    ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
    Abort;
  end
  else
  if ( DtSrcTabela.DataSet.FieldByName('ANOCOMPRA').AsInteger > 0 ) then
  begin
    ShowWarning('Registros de Contas A Pagar atrelados à entradas de produtos/serviços não podem ser excluídos!');
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
        SQL.Add('where APAGAR_ANO = ' + DtSrcTabela.DataSet.FieldByName('ANOLANC').AsString);
        SQL.Add('  and APAGAR_NUM = ' + DtSrcTabela.DataSet.FieldByName('NUMLANC').AsString);
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
        SQL.Add('    APAGAR_ANO = null');
        SQL.Add('  , APAGAR_NUM = null');
        SQL.Add('where APAGAR_ANO = ' + DtSrcTabela.DataSet.FieldByName('ANOLANC').AsString);
        SQL.Add('  and APAGAR_NUM = ' + DtSrcTabela.DataSet.FieldByName('NUMLANC').AsString);
        ExecSQL;

        CommitTransaction;
      end;

    end;

    inherited;

    if ( not OcorreuErro ) then
      AbrirPagamentos( DtSrcTabela.DataSet.FieldByName('ANOLANC').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMLANC').AsInteger );
  end;
end;

procedure TfrmGeContasAPagar.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';
end;

procedure TfrmGeContasAPagar.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    with DtSrcTabela.DataSet do
    begin
      // Destacar Títulos A Pagar cancelados
      if (FieldByName('SITUACAO').AsInteger = 0) then
        dbgDados.Canvas.Font.Color := lblLancamentoCancelado.Font.Color
      else
      // Destacar Títulos A Pagar em aberto
      if (not FieldByName('QUITADO').IsNull) then
        if ( FieldByName('QUITADO').AsInteger = STATUS_APAGAR_PENDENTE ) then
          if FieldByName('DTVENC').AsDateTime >= DataAtual then
            dbgDados.Canvas.Font.Color := lblLancamentoAberto.Font.Color
          else
          begin
            dbgDados.Canvas.Font.Color  := lblLancamentoVencido.Font.Color;
            dbgDados.Canvas.Brush.Color := lblLancamentoVencido.Color;
          end;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
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
  
    if not LiberarUso then
      Exit;

    if not GetPermissaoRotinaInterna(Sender, True) then
      Abort;

    if ( not cdsPagamentos.IsEmpty ) then
    begin
      CxAno    := 0;
      CxNumero := 0;
      CxContaCorrente := 0;

      if ( fdQryFormaPagto.Locate('cod', DtSrcTabela.DataSet.FieldByName('FORMA_PAGTO').AsInteger, []) ) then
        if ( fdQryFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
          if ( not CaixaAberto(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString, GetUserApp, GetDateDB, DtSrcTabela.DataSet.FieldByName('FORMA_PAGTO').AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
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

        with DMBusiness, fdQryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete from TBCONTPAG_BAIXA');
          SQL.Add('where ANOLANC = ' + cdsPagamentosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + cdsPagamentosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        with DMBusiness, fdQryBusca do
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

        AbrirPagamentos( DtSrcTabela.DataSet.FieldByName('ANOLANC').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMLANC').AsInteger );
      end;
    end;
  end;
end;

procedure TfrmGeContasAPagar.popGerarReciboClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
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

  if ( Sender = popGerarReciboA4 ) then
    frReport := FrReciboA4
  else
  if ( Sender = popGerarReciboA5 ) then
    frReport := FrReciboA5;

  SetVariablesDefault(frReport);

  frReport.PrepareReport;
  frReport.ShowReport;
end;

procedure TfrmGeContasAPagar.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeContasAPagar.CarregarFormaPagto(const pEmpresa: String);
begin
  with fdQryFormaPagto, Params do
  begin
    Close;
    ParamByName('empresa').AsString := Trim(pEmpresa);
    Open;

    Prior;
    Last;
  end;
end;

procedure TfrmGeContasAPagar.CarregarTipoDespesa(const ApenasAtivos: Boolean);
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

  if ( VarName = 'Imprimir_Cabecalho' ) then
    Value := IfThen(FImprimirCabecalho, 1, 0);
end;

procedure TfrmGeContasAPagar.RecarregarRegistro;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( not FieldByName('DTVENC').IsNull ) then
    begin
      if ( FieldByName('DTVENC').AsDateTime < e1Data.Date ) then
        e1Data.Date := FieldByName('DTVENC').AsDateTime;

      if ( FieldByName('DTVENC').AsDateTime > e2Data.Date ) then
        e2Data.Date := FieldByName('DTVENC').AsDateTime;
    end;
  end;

  fdQryTabela.RefreshRecord;
end;

procedure TfrmGeContasAPagar.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  iCompetencia : Integer;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( Field = FieldByName('EMPRESA') ) then
      CarregarFormaPagto(FieldByName('EMPRESA').AsString)
    else
    if ( Field = FieldByName('DTEMISS') ) then
      if ( State in [dsEdit, dsInsert] ) then
        if not FieldByName('DTEMISS').IsNull then
        begin
          iCompetencia := GetCompetenciaID(FieldByName('DTEMISS').AsDateTime);
          fdQryCompetencia.Close;
          fdQryCompetencia.Open;

          FieldByName('COMPETENCIA_APURACAO').AsInteger := iCompetencia;
        end;
  end;
end;

procedure TfrmGeContasAPagar.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValorAPagar.ReadOnly   := (not cdsPagamentos.IsEmpty);
  btbtnIncluirLote.Enabled := btbtnIncluir.Enabled;
  HabilitarDesabilitar_Btns;

  CarregarFormaPagto(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString);
  CarregarTipoDespesa( (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) );
end;

procedure TfrmGeContasAPagar.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    if FieldByName('COMPETENCIA_APURACAO').IsNull then
      FieldByName('COMPETENCIA_APURACAO').AsInteger := GetCompetenciaID(FieldByName('DTEMISS').AsDateTime);

    if ( (FieldByName('ANOCOMPRA').AsInteger = 0) and (FieldByName('PARCELA').AsInteger <= 0) ) then
      FieldByName('PARCELA').AsInteger := 1;

    FieldByName('VALORSALDO').AsCurrency := FieldByName('VALORPAG').AsCurrency;
  end;

  inherited;
end;

procedure TfrmGeContasAPagar.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('ANOLANC').AsInteger  := YearOf(Date);
    FieldByName('EMPRESA').AsString   := gUsuarioLogado.Empresa;
    FieldByName('NOMEEMP').AsString   := Copy(GetEmpresaNome(gUsuarioLogado.Empresa), 1, FieldByName('NOMEEMP').Size);
    FieldByName('PARCELA').AsInteger  := 1;
    FieldByName('DTEMISS').AsDateTime := Date;
    FieldByName('COMPETENCIA_APURACAO').AsInteger := GetCompetenciaID(Date);
    FieldByName('QUITADO').AsInteger  := STATUS_APAGAR_PENDENTE;
    FieldByName('SITUACAO').AsInteger := 1; // Ativa
    FieldByName('LOTE').AsString      := EmptyStr;
    FieldByName('FORMA_PAGTO').AsInteger    := GetFormaPagtoIDDefault;
    FieldByName('CONDICAO_PAGTO').AsInteger := GetCondicaoPagtoIDDefault;
    FieldByName('HISTORIC').AsString        := '...';
    FieldByName('CODTPDESP').Clear;
    FieldByName('ANOCOMPRA').Clear;
    FieldByName('NUMCOMPRA').Clear;
  end;
end;

procedure TfrmGeContasAPagar.fdQryTabelaQUITADOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if (Sender.DataSet.FieldByName('situacao').AsInteger = 0) then
    Text := 'Cancelado'
  else
    Case Sender.AsInteger of
      STATUS_APAGAR_PENDENTE : Text := 'A Pagar';
      STATUS_APAGAR_PAGO     : Text := 'Pago';
      else
        Text := Sender.AsString;
    end;
end;

procedure TfrmGeContasAPagar.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    with DtSrcTabela.DataSet do
      AbrirPagamentos( FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger );
end;

procedure TfrmGeContasAPagar.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    with DtSrcTabela.DataSet do
    begin
      AbrirPagamentos( FieldByName('ANOLANC').AsInteger, FieldByName('NUMLANC').AsInteger );
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
