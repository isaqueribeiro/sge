unit UGeContasAReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RXDBCtrl, IBTable;

type
  TfrmGeContasAReceber = class(TfrmGrPadraoCadastro)
    btbtnEfetuarPagto: TBitBtn;
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblCliente: TLabel;
    dbCliente: TRxDBComboEdit;
    lblParcela: TLabel;
    dbParcela: TDBEdit;
    dbQuitado: TDBEdit;
    lblEmissao: TLabel;
    dbEmissao: TDBEdit;
    lblVencimento: TLabel;
    dbVencimento: TDBEdit;
    lblValorAReceber: TLabel;
    dbValorAReceber: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
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
    cdsPagamentosBCO_NOME: TIBStringField;
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
    tblBanco: TIBTable;
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
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    IbDtstTabelaSERIE: TIBStringField;
    IbDtstTabelaNFE: TLargeintField;
    IbDtstTabelaNFE_VENDA: TIBStringField;
    lblNFe: TLabel;
    dbNFe: TDBEdit;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaCLIENTE: TIntegerField;
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
  private
    { Private declarations }
    SQL_Pagamentos : TStringList;
    procedure AbrirPagamentos(const Ano : Smallint; const Numero : Integer);
    procedure HabilitarDesabilitar_Btns;

    function GetRotinaEfetuarPagtoID : String;
    function GetRotinaCancelarPagtosID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaEfetuarPagtoID : String read GetRotinaEfetuarPagtoID;
    property RotinaCancelarPagtosID : String read GetRotinaCancelarPagtosID;
  end;

var
  frmGeContasAReceber: TfrmGeContasAReceber;

  { DONE -oIsaque -cContas A Receber : 22/05/2014 - Correção de BUG porque a rotina estava permitindo a gravação de um lançamento sem CLIENTE, DATAS e VALOR }

  procedure MostrarControleContasAReceber(const AOwner : TComponent);

implementation

uses
  UConstantesDGE, UDMBusiness, UGeCliente, DateUtils, UGeEfetuarPagtoREC;

{$R *.dfm}

procedure MostrarControleContasAReceber(const AOwner : TComponent);
var
  frm : TfrmGeContasAReceber;
  whr : String; 
begin
  frm := TfrmGeContasAReceber.Create(AOwner);
  try

    whr :=
      '( (r.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and (r.Situacao > 0) and (r.Parcela > 0) ) and (' +
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
  IbDtstTabela.GeneratorField.Generator := 'GEN_CONTAREC_NUM_' + FormatFloat('0000', YearOf(Date));

  inherited;

  SQL_Pagamentos := TStringList.Create;
  SQL_Pagamentos.AddStrings( cdsPagamentos.SelectSQL );

  e1Data.Date     := Date;
  e2Data.Date     := Date;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbCliente;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  tblBanco.Open;

  RotinaID            := ROTINA_FIN_CONTA_ARECEBER_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCONTREC';
  CampoCodigo    := 'numlanc';
  CampoDescricao := 'Nome';
  CampoOrdenacao := 'r.dtvenc, c.Nome';

  WhereAdditional :=
    '( (r.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and (r.Situacao > 0) and (r.Parcela > 0) ) and (' +
    'cast(r.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  UpdateGenerator( 'where anolanc = ' + FormatFloat('0000', YearOf(Date)) );

  UpdateGenerator;
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
    '( (r.empresa = ' + QuotedStr(GetEmpresaIDDefault) + ') and (r.Situacao > 0) and (r.Parcela > 0) ) and (' +
    'cast(r.dtvenc as date) between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';
    
  inherited;
end;

procedure TfrmGeContasAReceber.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.AsString := GetEmpresaIDDefault;
  IbDtstTabelaANOLANC.Value    := YearOf(Date);
  IbDtstTabelaPARCELA.Value    := 0;
  IbDtstTabelaDTEMISS.Value    := Date;
  IbDtstTabelaFORMA_PAGTO.Value    := GetFormaPagtoIDDefault;
  IbDtstTabelaTIPPAG.Value         := GetFormaPagtoNomeDefault;
  IbDtstTabelaVALORRECTOT.Value     := 0;
  IbDtstTabelaVALORSALDO.Value      := 0;
  IbDtstTabelaVALORMULTA.Value      := 0;
  IbDtstTabelaPERCENTJUROS.Value    := 0;
  IbDtstTabelaPERCENTMULTA.Value    := 0;
  IbDtstTabelaPERCENTDESCONTO.Value := 0;
  IbDtstTabelaBAIXADO.Value  := 0;
  IbDtstTabelaENVIADO.Value  := 0;
  IbDtstTabelaSITUACAO.Value := 1; // Ativa
end;

procedure TfrmGeContasAReceber.btbtnEfetuarPagtoClick(Sender: TObject);
var
  sSenha   : String;
  iNumero  ,
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

  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
  begin
    ShowWarning('Registro de recebimento selecionado já se encontra baixado!' + #13 + 'Favor pesquisar novamente.');
    Abort;
  end;

  if ( tblFormaPagto.FieldByName('Conta_corrente').AsInteger > 0 ) then
    if ( not CaixaAberto(IbDtstTabelaEMPRESA.AsString, GetUserApp, GetDateDB, IbDtstTabelaFORMA_PAGTO.AsInteger, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento deste movimento.');
      Exit;
    end;

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

  if PagamentoConfirmado(Self, IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger, IbDtstTabelaFORMA_PAGTO.AsInteger, IbDtstTabelaNOMECLIENTE.AsString, DataPagto) then
  begin
    if ( CxContaCorrente > 0 ) then
      GerarSaldoContaCorrente(CxContaCorrente, DataPagto);

    iNumero := IbDtstTabelaNUMLANC.AsInteger;

    IbDtstTabela.Close;
    IbDtstTabela.Open;

    IbDtstTabela.Locate('NUMLANC', iNumero, []);

    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );

    DesbloquearCliente(IbDtstTabelaCLIENTE.AsInteger, EmptyStr);
  end;
end;

procedure TfrmGeContasAReceber.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
    btbtnEfetuarPagto.Enabled := (IbDtstTabelaBAIXADO.AsInteger = 0) and (not IbDtstTabela.IsEmpty) and (IbDtstTabela.State = dsBrowse)
  else
    btbtnEfetuarPagto.Enabled := False;
end;

procedure TfrmGeContasAReceber.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAReceber.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
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
  begin
    // Eliminar Movimento do Caixa quando o lançamento for excluído pelo SYSTEM ADM

    if (gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_SYSTEM_ADM]) then
    begin

      with DMBusiness, qryBusca do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Delete from TBCAIXA_MOVIMENTO');
        SQL.Add('where ARECEBER_ANO = ' + IbDtstTabelaANOLANC.AsString);
        SQL.Add('  and ARECEBER_NUM = ' + IbDtstTabelaNUMLANC.AsString);
        ExecSQL;

        CommitTransaction;
      end;

    end;

    inherited;

    if ( not OcorreuErro ) then
      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
  end;
end;

procedure TfrmGeContasAReceber.IbDtstTabelaBAIXADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    0 : Text := 'A Receber';
    1 : Text := 'Baixado';
    else
      Text := Sender.AsString;
  end;
end;

procedure TfrmGeContasAReceber.ControlEditExit(Sender: TObject);
begin
  inherited;

//  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
//    if ( (Sender = dbValorAReceber) or (Sender = dbValorMulta) ) then
//      IbDtstTabelaVALORSALDO.Value := IbDtstTabelaVALORREC.AsCurrency + IbDtstTabelaVALORMULTA.AsCurrency - IbDtstTabelaVALORRECTOT.AsCurrency;

end;

procedure TfrmGeContasAReceber.dbFormaPagtoClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( tblFormaPagto.Locate('cod', dbFormaPagto.Field.AsInteger, []) ) then
      IbDtstTabelaTIPPAG.AsString := tblFormaPagto.FieldByName('descri').AsString;
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

        with DMBusiness, qryBusca do
        begin
          Close;
          SQL.Clear;
          SQL.Add('Delete from TBCONTREC_BAIXA');
          SQL.Add('where ANOLANC = ' + cdsPagamentosANOLANC.AsString);
          SQL.Add('  and NUMLANC = ' + cdsPagamentosNUMLANC.AsString);
          ExecSQL;

          CommitTransaction;
        end;

        with DMBusiness, qryBusca do
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
  if ( IbDtstTabela.State = dsEdit ) then
    if ( VarToStr(IbDtstTabelaDTVENC.OldValue) <> VarToStr(IbDtstTabelaDTVENC.NewValue) ) then
      DesbloquearCliente(IbDtstTabelaCLIENTE.AsInteger, EmptyStr)
end;

procedure TfrmGeContasAReceber.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValorAReceber.ReadOnly := (not cdsPagamentos.IsEmpty);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeContasAReceber.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
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

function TfrmGeContasAReceber.GetRotinaCancelarPagtosID: String;
begin
  Result := GetRotinaInternaID(dbgPagamentos);
end;

function TfrmGeContasAReceber.GetRotinaEfetuarPagtoID: String;
begin
  Result := GetRotinaInternaID(btbtnEfetuarPagto);
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
end;

initialization
  FormFunction.RegisterForm('frmGeContasAReceber', TfrmGeContasAReceber);

end.
