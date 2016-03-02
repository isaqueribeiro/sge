unit UGeControleCheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, JvToolEdit, JvExMask,
  JvDBControls, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, Datasnap.DBClient,
  Datasnap.Provider, IBX.IBQuery, ACBrBase, ACBrExtenso, frxClass, frxDBSet;

type
  TfrmGeControleCheque = class(TfrmGrPadraoCadastro)
    Bevel5: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    dbStatus: TDBEdit;
    lblValor: TLabel;
    dbValor: TDBEdit;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblBanco: TLabel;
    dbBanco: TDBLookupComboBox;
    pgcMaisDados: TPageControl;
    tbsObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    lblStatus: TLabel;
    bvlBaixas: TBevel;
    dbgBaixas: TDBGrid;
    Bevel7: TBevel;
    qryBaixas: TIBDataSet;
    dtsBaixas: TDataSource;
    lblAgencia: TLabel;
    dbAgencia: TDBEdit;
    lblEmissorCnpj: TLabel;
    dbEmissorCnpj: TDBEdit;
    tblBanco: TIBTable;
    dtsBanco: TDataSource;
    lblData: TLabel;
    btbtnAlterarSituacao: TcxButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    lblChequePendente: TLabel;
    lblChequeCompensar: TLabel;
    FrChequeA5: TfrxReport;
    FrdRecibo: TfrxDBDataset;
    ACBrExtenso: TACBrExtenso;
    QryCheque: TIBQuery;
    DspCheque: TDataSetProvider;
    CdsCheque: TClientDataSet;
    CdsChequeVALOR_BAIXA_EXTENSO: TStringField;
    popImprimir: TPopupMenu;
    popGerarReciboA4: TMenuItem;
    CdsChequeVALOR_BAIXA: TBCDField;
    lblEmissao: TLabel;
    dbEmissao: TJvDBDateEdit;
    lblApresentacao: TLabel;
    dbApresentacao: TJvDBDateEdit;
    qryTipoCheque: TIBQuery;
    dtsTipoCheque: TDataSource;
    FrChequeA4: TfrxReport;
    popGerarReciboA5: TMenuItem;
    IbDtstTabelaCONTROLE: TIntegerField;
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaBANCO: TIBStringField;
    IbDtstTabelaAGENCIA: TIBStringField;
    IbDtstTabelaCONTA: TIBStringField;
    IbDtstTabelaNUMERO: TIBStringField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaCLIENTE: TIntegerField;
    IbDtstTabelaDATA_EMISSAO: TDateField;
    IbDtstTabelaDATA_APRESENTACAO: TDateField;
    IbDtstTabelaDATA_COMPENSACAO: TDateField;
    IbDtstTabelaVALOR: TIBBCDField;
    IbDtstTabelaNOMINAL_A: TIBStringField;
    IbDtstTabelaDATA_CADASTRO: TDateField;
    IbDtstTabelaUSUARIO_CADASTRO: TIBStringField;
    IbDtstTabelaSTATUS: TSmallintField;
    IbDtstTabelaSTATUS_DESCRICAO: TIBStringField;
    IbDtstTabelaCLIENTE_NOME: TIBStringField;
    IbDtstTabelaCLIENTE_CNPJ: TIBStringField;
    IbDtstTabelaCLIENTE_TIPO: TSmallintField;
    IbDtstTabelaFORNECEDOR_NOME: TIBStringField;
    IbDtstTabelaFORNECEDOR_CNPJ: TIBStringField;
    IbDtstTabelaFORNECEDOR_TIPO: TSmallintField;
    IbDtstTabelaBANCO_NOME: TIBStringField;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    IbDtstTabelaEMISSOR_NOME: TIBStringField;
    IbDtstTabelaEMISSOR_CNPJ: TIBStringField;
    IbDtstTabelaEMISSOR_TIPO: TSmallintField;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    lblEmissorNome: TLabel;
    dbEmissorNome: TJvDBComboEdit;
    lblDataCadastro: TLabel;
    dbDataCadastro: TDBEdit;
    lblCompensacao: TLabel;
    dbCompensacao: TJvDBDateEdit;
    dbConta: TDBEdit;
    lblConta: TLabel;
    lblNominalA: TLabel;
    dbNominalA: TDBEdit;
    IbDtstTabelaOBS: TWideMemoField;
    qryBaixasTIPO: TIBStringField;
    qryBaixasLANCAMENTO: TIBStringField;
    qryBaixasANOLANC: TSmallintField;
    qryBaixasNUMLANC: TIntegerField;
    qryBaixasSEQ: TSmallintField;
    qryBaixasDATA_PAGTO: TDateField;
    qryBaixasVALOR_BAIXA: TIBBCDField;
    qryBaixasDOCUMENTO_BAIXA: TIBStringField;
    qryBaixasUSUARIO: TIBStringField;
    popMudarSituacao: TPopupMenu;
    ppmApresentar: TMenuItem;
    ppmCompensado: TMenuItem;
    ppmDevolvido: TMenuItem;
    ppmCancelar: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure dbEmissorNomeButtonClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnAlterarSituacaoClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FrReciboGetValue(const VarName: string; var Value: Variant);
    procedure popGerarReciboClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure CdsChequeCalcFields(DataSet: TDataSet);
    procedure IbDtstTabelaSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    FDataAtual    : TDateTime;
    FLoteParcelas : String;
    SQL_Baixas    : TStringList;
    FImprimirCabecalho : Boolean;
    procedure AbrirBaixas(const Controle : Integer);
    procedure HabilitarDesabilitar_Btns;
    procedure RecarregarRegistro;

    function GetRotinaAlterarSituacaoID : String;
    function GetRotinaApresentarChequeID : String;
    function GetRotinaDevolverChequeID : String;
    function GetRotinaCompensarChequeID : String;
    function GetRotinaCancelarChequeID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaAlterarSituacaoID  : String read GetRotinaAlterarSituacaoID;
    property RotinaApresentarChequeID : String read GetRotinaApresentarChequeID;
    property RotinaDevolverChequeID   : String read GetRotinaDevolverChequeID;
    property RotinaCompensarChequeID  : String read GetRotinaCompensarChequeID;
    property RotinaCancelarChequeID   : String read GetRotinaCancelarChequeID;
    property DataAtual : TDateTime read FDataAtual;
  end;

(*
  Tabelas:
  - TBCHEQUE
  - TBBANCO
  - TBCLIENTE
  - TBFORNECEDOR
  - TBEMPRESA

  Views:
  - VW_STATUS_CHEQUE
*)

var
  frmGeControleCheque: TfrmGeControleCheque;

implementation

uses
  UConstantesDGE, UDMBusiness, UGeCliente, DateUtils;

{$R *.dfm}

procedure TfrmGeControleCheque.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarLista(tblEmpresa);
  CarregarLista(qryTipoCheque);
  CarregarLista(tblBanco);

  SQL_Baixas := TStringList.Create;
  SQL_Baixas.AddStrings( qryBaixas.SelectSQL );

  FDataAtual      := GetDateTimeDB;
  e1Data.Date     := GetMenorDataChequePendente;
  e2Data.Date     := GetDateLastMonth;

  if (e1Data.Date > GetDateDB) then
    e1Data.Date   := GetDateDB;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  RotinaID            := ROTINA_FIN_CONTROLE_CHEQUE_ID;
  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBCHEQUE';
  CampoCodigo    := 'c.controle';
  CampoDescricao := 'coalesce(cc.nome, fc.nomeforn)';
  CampoOrdenacao := 'c.data_apresentacao, coalesce(cc.nome, fc.nomeforn)';

  WhereAdditional := '(c.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and ' +
    '(c.data_apresentacao between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';
end;

procedure TfrmGeControleCheque.dbEmissorNomeButtonClick(Sender: TObject);
//var
//  iCodigo : Integer;
//  sCNPJ   ,
//  sNome   : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    if IbDtstTabelaTIPO.IsNull then
      ShowWarning('Favor selecionar o Tipo de Origem do Cheque');
//    if ( SelecionarCliente(Self, iCodigo, sCNPJ, sNome) ) then
//    begin
//      IbDtstTabelaCLIENTE.AsInteger    := iCodigo;
//      IbDtstTabelaCNPJ.AsString        := sCNPJ;
//      IbDtstTabelaNOMECLIENTE.AsString := sNome;
//    end;
  end;
end;

procedure TfrmGeControleCheque.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := '(c.empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ') and ' +
    '(c.data_apresentacao between ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) +
    ' and ' + QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  inherited;
end;

procedure TfrmGeControleCheque.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.AsString := gUsuarioLogado.Empresa;
  IbDtstTabelaSTATUS.AsInteger := STATUS_CHEQUE_PENDENTE;
//  IbDtstTabelaTIPO.AsInteger   := qryTipoCheque.FieldByName('codigo').AsInteger;
  IbDtstTabelaAGENCIA.AsString := EmptyStr;
  IbDtstTabelaCONTA.AsString   := EmptyStr;
  IbDtstTabelaOBS.AsString     := EmptyStr;
  IbDtstTabelaDATA_CADASTRO.AsDateTime  := GetDateDB;
  IbDtstTabelaUSUARIO_CADASTRO.AsString := gUsuarioLogado.Login;
  IbDtstTabelaTIPO.Clear;
  IbDtstTabelaNUMERO.Clear;
  IbDtstTabelaVALOR.Clear;
  IbDtstTabelaDATA_EMISSAO.Clear;
  IbDtstTabelaDATA_APRESENTACAO.Clear;
  IbDtstTabelaDATA_COMPENSACAO.Clear;
  IbDtstTabelaNOMINAL_A.Clear;
end;

procedure TfrmGeControleCheque.IbDtstTabelaSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      STATUS_CHEQUE_PENDENTE    : Text := 'Pendente';
      STATUS_CHEQUE_APRESENTADO : Text := 'Apresentado';
      STATUS_CHEQUE_DEVOLVIDO   : Text := 'Devolvido';
      STATUS_CHEQUE_COMPENSADO  : Text := 'Compensado';
      STATUS_CHEQUE_CANCELADO   : Text := 'Cancelado';
      else
        Text := Sender.AsString;
    end;
end;

procedure TfrmGeControleCheque.btbtnAlterarSituacaoClick(Sender: TObject);
//var
//  CxContaCorrente : Integer;
//  DataPagto : TDateTime;
//  cReceber  : Currency;
begin
//  if ( IbDtstTabela.IsEmpty ) then
//    Exit;
//
//  if not GetPermissaoRotinaInterna(Sender, True) then
//    Abort;
//
//  CxContaCorrente := 0;
//
//  RecarregarRegistro;
//
//  if ( not IbDtstTabela.Active ) then
//    Exit;
//
//  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
//  begin
//    ShowWarning('Registro de recebimento selecionado já se encontra baixado!' + #13 + 'Favor pesquisar novamente.');
//    Abort;
//  end;
//
//  cReceber := IbDtstTabelaVALORSALDO.AsCurrency;
//
//  if PagamentoConfirmado(Self, IbDtstTabelaEMPRESA.AsString,
//    IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger,
//    IbDtstTabelaFORMA_PAGTO.AsInteger, IbDtstTabelaNOMECLIENTE.AsString,
//    CxContaCorrente, DataPagto, cReceber) then
//  begin
//    if ( CxContaCorrente > 0 ) then
//      GerarSaldoContaCorrente(CxContaCorrente, DataPagto);
//
//    RecarregarRegistro;
//    AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
//    DesbloquearCliente(IbDtstTabelaCLIENTE.AsInteger, EmptyStr);
//  end;
end;

procedure TfrmGeControleCheque.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    ppmApresentar.Enabled := (IbDtstTabelaSTATUS.AsInteger in [STATUS_CHEQUE_PENDENTE, STATUS_CHEQUE_APRESENTADO]);
    ppmDevolvido.Enabled  := (IbDtstTabelaSTATUS.AsInteger in [STATUS_CHEQUE_APRESENTADO]);
    ppmCompensado.Enabled := (IbDtstTabelaSTATUS.AsInteger in [STATUS_CHEQUE_APRESENTADO]);
    ppmCancelar.Enabled   := (IbDtstTabelaSTATUS.AsInteger in [STATUS_CHEQUE_PENDENTE, STATUS_CHEQUE_APRESENTADO, STATUS_CHEQUE_DEVOLVIDO]);

    popGerarReciboA4.Enabled := False;
    popGerarReciboA5.Enabled := False;
  end
  else
  begin
    ppmApresentar.Enabled := False;
    ppmDevolvido.Enabled  := False;
    ppmCompensado.Enabled := False;
    ppmCancelar.Enabled   := False;

    popGerarReciboA4.Enabled := False;
    popGerarReciboA5.Enabled := False;
  end;
end;

procedure TfrmGeControleCheque.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeControleCheque.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirBaixas( IbDtstTabelaCONTROLE.AsInteger );
end;

procedure TfrmGeControleCheque.popGerarReciboClick(Sender: TObject);
begin
//  if ( IbDtstTabela.IsEmpty ) then
//    Exit;
//
//  with CdsRecibo, Params do
//  begin
//    Close;
//    ParamByName('ano').AsInteger    := cdsPagamentosANOLANC.AsInteger;
//    ParamByName('numero').AsInteger := cdsPagamentosNUMLANC.AsInteger;
//    ParamByName('baixa').AsInteger  := cdsPagamentosSEQ.AsInteger;
//    Open;
//
//    if IsEmpty then
//      Exit;
//  end;
//
//  FImprimirCabecalho := ShowConfirmation('Recibo', 'Deseja imprimir no recibo o Cabeçalho com informações da empresa?');
//
//  if ( Sender = popGerarReciboA4 )  then
//    frReport := FrReciboA4
//  else
//  if ( Sender = popGerarReciboA5 )  then
//    frReport := FrReciboA5;
//
//  SetVariablesDefault(frReport);
//
//  frReport.PrepareReport;
//  frReport.ShowReport;
end;

procedure TfrmGeControleCheque.AbrirBaixas(const Controle: Integer);
begin
  qryBaixas.Close;

  with qryBaixas, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Baixas );
    SelectSQL.Text := StringReplace(SelectSQL.Text, ':cheque', IntToStr(Controle), [rfReplaceAll]);
  end;

  qryBaixas.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeControleCheque.btbtnAlterarClick(Sender: TObject);
begin
//  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
//  begin
//    ShowWarning('O Lançamento não poderá ser alterado pois este já está quitado!');
//    Abort;
//  end
//  else
//  begin
//    inherited;
//    if ( not OcorreuErro ) then
//      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
//  end;
end;

procedure TfrmGeControleCheque.btbtnExcluirClick(Sender: TObject);
begin
//  if ( IbDtstTabelaBAIXADO.AsInteger = 1 ) then
//  begin
//    ShowWarning('O Lançamento não poderá ser excluído pois este já está quitado!');
//    Abort;
//  end
//  else
//  begin
//    // Eliminar Movimento do Caixa quando o lançamento for excluído pelo SYSTEM ADM
//
//    if (gUsuarioLogado.Funcao in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_SYSTEM_ADM]) then
//    begin
//
//      with DMBusiness, qryBusca do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('Delete from TBCAIXA_MOVIMENTO');
//        SQL.Add('where ARECEBER_ANO = ' + IbDtstTabelaANOLANC.AsString);
//        SQL.Add('  and ARECEBER_NUM = ' + IbDtstTabelaNUMLANC.AsString);
//        ExecSQL;
//
//        CommitTransaction;
//      end;
//
//    end
//    else
//    begin
//
//      with DMBusiness, qryBusca do
//      begin
//        Close;
//        SQL.Clear;
//        SQL.Add('Update TBCAIXA_MOVIMENTO Set');
//        SQL.Add('    ARECEBER_ANO = null');
//        SQL.Add('  , ARECEBER_NUM = null');
//        SQL.Add('where ARECEBER_ANO = ' + IbDtstTabelaANOLANC.AsString);
//        SQL.Add('  and ARECEBER_NUM = ' + IbDtstTabelaNUMLANC.AsString);
//        ExecSQL;
//
//        CommitTransaction;
//      end;
//
//    end;
//
//    inherited;
//
//    if ( not OcorreuErro ) then
//      AbrirPagamentos( IbDtstTabelaANOLANC.AsInteger, IbDtstTabelaNUMLANC.AsInteger );
//  end;
end;

procedure TfrmGeControleCheque.CdsChequeCalcFields(DataSet: TDataSet);
begin
  CdsChequeVALOR_BAIXA_EXTENSO.AsString := AnsiUpperCase(ACBrExtenso.ValorToTexto(CdsChequeVALOR_BAIXA.AsCurrency, ACBrExtenso.Formato));
end;

procedure TfrmGeControleCheque.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Cheques Pendentes
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_CHEQUE_PENDENTE ) then
      dbgDados.Canvas.Font.Color := lblChequePendente.Font.Color
    else
    // Destacar Cheques A Compensar
    if ( IbDtstTabelaSTATUS.AsInteger = STATUS_CHEQUE_APRESENTADO ) then
    begin
      dbgDados.Canvas.Font.Color  := lblChequeCompensar.Font.Color;
      dbgDados.Canvas.Brush.Color := lblChequeCompensar.Color;
    end;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
end;

procedure TfrmGeControleCheque.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dbValor.ReadOnly      := (not qryBaixas.IsEmpty);
  dbObservacao.ReadOnly := (IbDtstTabela.State = dsEdit);
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeControleCheque.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    AbrirBaixas( IbDtstTabelaCONTROLE.AsInteger );
end;

procedure TfrmGeControleCheque.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirBaixas( IbDtstTabelaCONTROLE.AsInteger );
    DtSrcTabelaStateChange( DtSrcTabela );
  end;
end;

procedure TfrmGeControleCheque.btbtnListaClick(Sender: TObject);
begin
  popImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

function TfrmGeControleCheque.GetRotinaAlterarSituacaoID: String;
begin
  Result := GetRotinaInternaID(btbtnAlterarSituacao);
end;

function TfrmGeControleCheque.GetRotinaApresentarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmApresentar, RotinaAlterarSituacaoID);
end;

function TfrmGeControleCheque.GetRotinaCancelarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmCancelar, RotinaAlterarSituacaoID);
end;

function TfrmGeControleCheque.GetRotinaCompensarChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmCompensado, RotinaAlterarSituacaoID);
end;

function TfrmGeControleCheque.GetRotinaDevolverChequeID: String;
begin
  Result := GetRotinaSubInternaID(ppmDevolvido, RotinaAlterarSituacaoID);
end;

procedure TfrmGeControleCheque.RecarregarRegistro;
//var
//  MovAno    ,
//  MovNumero : Integer;
begin
//  MovAno    := IbDtstTabelaANOLANC.AsInteger;
//  MovNumero := IbDtstTabelaNUMLANC.AsInteger;
//
//  if ( not IbDtstTabelaDTVENC.IsNull ) then
//  begin
//    if ( IbDtstTabelaDTVENC.AsDateTime < e1Data.Date ) then
//      e1Data.Date := IbDtstTabelaDTVENC.AsDateTime;
//
//    if ( IbDtstTabelaDTVENC.AsDateTime > e2Data.Date ) then
//      e2Data.Date := IbDtstTabelaDTVENC.AsDateTime;
//  end;
//
//  IbDtstTabela.Close;
//  IbDtstTabela.Open;
//
//  if not IbDtstTabela.Locate('ANOLANC;NUMLANC', VarArrayOf([MovAno, MovNumero]), []) then
//  begin
//    IbDtstTabela.Close;
//
//    ShowInformation('Favor pesquisar novamente o registro de despesa!');
//    pgcGuias.ActivePage := tbsTabela;
//    edtFiltrar.SetFocus;
//  end;
end;

procedure TfrmGeControleCheque.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    SetRotinaSistema(ROTINA_TIPO_PROCESSO, RotinaAlterarSituacaoID,  Trim(btbtnAlterarSituacao.Caption), RotinaID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaApresentarChequeID, Trim(ppmApresentar.Caption), RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaDevolverChequeID,   Trim(ppmDevolvido.Caption),  RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaCompensarChequeID,  Trim(ppmCompensado.Caption), RotinaAlterarSituacaoID);
    SetRotinaSistema(ROTINA_TIPO_FUNCAO,   RotinaCancelarChequeID,   Trim(ppmCancelar.Caption),   RotinaAlterarSituacaoID);
  end;
end;

procedure TfrmGeControleCheque.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;

  btbtnAlterarSituacao.Enabled := GetPermissaoRotinaSistema(RotinaAlterarSituacaoID, False);
end;

procedure TfrmGeControleCheque.FrReciboGetValue(const VarName: string;
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
  FormFunction.RegisterForm('frmGeControleCheque', TfrmGeControleCheque);

end.
