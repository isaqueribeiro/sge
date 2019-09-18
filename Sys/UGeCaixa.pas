unit UGeCaixa;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, IBStoredProc, frxClass, frxDBSet, IBQuery, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons, System.ImageList,
  JvToolEdit, JvExMask, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeCaixa = class(TfrmGrPadraoCadastro)
    dtsOperador: TDataSource;
    dtsContaCorrente: TDataSource;
    lblOperador: TLabel;
    dbOperador: TDBLookupComboBox;
    lblContaCorrente: TLabel;
    dbContaCorrente: TDBLookupComboBox;
    lblDataAbertura: TLabel;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    GrpBxDadosEncerramento: TGroupBox;
    lblDataFech: TLabel;
    lblEntrada: TLabel;
    dbEntrada: TDBEdit;
    lblSaida: TLabel;
    dbSaida: TDBEdit;
    lblDataCancel: TLabel;
    dbUsuarioCancel: TDBEdit;
    lblUsuarioCancel: TLabel;
    lblMotivoCancel: TLabel;
    dbMotivoCancel: TDBEdit;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsConsolidado: TTabSheet;
    tbsMovimento: TTabSheet;
    dbgMovimento: TDBGrid;
    dbgConsolidado: TDBGrid;
    DtSrcConsolidado: TDataSource;
    dtsMovimento: TDataSource;
    lblCaixaAberto: TLabel;
    lblCaixaCancelado: TLabel;
    Label1: TLabel;
    Bevel6: TBevel;
    ppImprimir: TPopupMenu;
    nmImprimirCaixaEncerrado: TMenuItem;
    N1: TMenuItem;
    nmImprimirCaixaSintetico: TMenuItem;
    nmImprimirCaixaAnalitico: TMenuItem;
    lblData: TLabel;
    Bevel7: TBevel;
    frdCaixaSintetico: TfrxDBDataset;
    frrCaixaSintetico: TfrxReport;
    frrCaixaAnalitico: TfrxReport;
    frdCaixaAnalitico: TfrxDBDataset;
    Label2: TLabel;
    btbtnEncerrar: TcxButton;
    btbtnCancelarCaixa: TcxButton;
    dbDataFech: TJvDBDateEdit;
    dbDataCancel: TJvDBDateEdit;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dbDataAbertura: TJvDBDateEdit;
    dbEmpresaRazao: TDBEdit;
    fdQryOperador: TFDQuery;
    fdQryContaCorrente: TFDQuery;
    fdStrPrcCaixaConsolidar: TFDStoredProc;
    qryCaixaSintetico: TFDQuery;
    qryCaixaAnalitico: TFDQuery;
    qryMovimento: TFDQuery;
    qryMovimentoANO: TSmallintField;
    qryMovimentoNUMERO: TIntegerField;
    qryMovimentoFORMA_PAGTO: TSmallintField;
    qryMovimentoFORMA_PAGTO_DESC: TStringField;
    qryMovimentoDATAHORA: TSQLTimeStampField;
    qryMovimentoTIPO: TStringField;
    qryMovimentoHISTORICO: TStringField;
    qryMovimentoVALOR: TBCDField;
    qryMovimentoSITUACAO: TIntegerField;
    qryMovimentoVENDA_ANO: TSmallintField;
    qryMovimentoVENDA_NUM: TIntegerField;
    qryMovimentoCLIENTE: TStringField;
    qryMovimentoCOMPRA_ANO: TSmallintField;
    qryMovimentoCOMPRA_NUM: TIntegerField;
    qryMovimentoFORNECEDOR: TIntegerField;
    qryMovimentoControleMov: TStringField;
    qryMovimentoControleVenda: TStringField;
    qryMovimentoControleCompra: TStringField;
    cdsCosolidado: TFDQuery;
    updConsolidado: TFDUpdateSQL;
    cdsCosolidadoANO: TSmallintField;
    cdsCosolidadoNUMERO: TIntegerField;
    cdsCosolidadoSEQ: TSmallintField;
    cdsCosolidadoFORMA_PAGTO: TSmallintField;
    cdsCosolidadoDESCRICAO: TStringField;
    cdsCosolidadoTOTAL_CREDITO: TBCDField;
    cdsCosolidadoTOTAL_DEBITO: TBCDField;
    fdQryTabelaANO: TSmallintField;
    fdQryTabelaNUMERO: TIntegerField;
    fdQryTabelaDATA_ABERTURA: TDateField;
    fdQryTabelaDATA_FECH: TDateField;
    fdQryTabelaDATA_CANCEL: TDateField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaUSUARIO_CANCEL: TStringField;
    fdQryTabelaSITUACAO: TSmallintField;
    fdQryTabelaCONTA_CORRENTE: TIntegerField;
    fdQryTabelaVALOR_TOTAL_CREDITO: TBCDField;
    fdQryTabelaVALOR_TOTAL_DEBITO: TBCDField;
    fdQryTabelaMOTIVO_CANCEL: TStringField;
    fdQryTabelaDESCRICAO: TStringField;
    fdQryTabelaTIPO: TStringField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaEMPRESA_RAZAO: TStringField;
    fdQryTabelaEMPRESA_FANTASIA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnEncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure nmImprimirCaixaSinteticoClick(Sender: TObject);
    procedure nmImprimirCaixaAnaliticoClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnCancelarCaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryMovimentoCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaAfterCancel(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaSITUACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    sGeneratorName : String;
    SQL_Consolidado,
    SQL_Movimento  ,
    SQL_CaixaSintetico ,
    SQL_CaixaAnalitico : TStringList;
    FAbrirCaixa  ,
    FFecharCaixa : Boolean;
    procedure AbrirTabelaConsolidado(const AnoCaixa : Smallint; const NumeroCaixa : Integer);
    procedure AbrirTabelaMovimento(const AnoCaixa : Smallint; const NumeroCaixa : Integer);
    procedure HabilitarDesabilitar_Btns;
    procedure ConsolidarCaixa(const AnoCaixa : Smallint; const NumeroCaixa : Integer);

    function GetRotinaEncerrarCaixaID : String;
    function GetRotinaCancelarCaixaID : String;

    procedure RegistrarNovaRotinaSistema;
  public
    { Public declarations }
    property RotinaEncerrarCaixaID : String read GetRotinaEncerrarCaixaID;
    property RotinaCancelarCaixaID : String read GetRotinaCancelarCaixaID;
  end;

(*
  Tabelas:
  - TBCAIXA
  - TBCAIXA_CONSOLIDACAO
  - TBCONTA_CORRENTE
  - TBBANCO_BOLETO
  - TBCAIXA_MOVIMENTO
  - TBFORMPAGTO
  - TBCONDICAOPAGTO
  - TBVENDAS
  - TBVENDAS_FORMAPAGTO
  - TBCLIENTE
  - TBUSERS

  Views:
  - VW_EMPRESA
  - VW_LAYOUT_REM_RET_BANCO

  Stored Procedure:
  - SET_CAIXA_CONSOLIDAR
*)

var
  frmGeCaixa: TfrmGeCaixa;

const
  STATUS_CAIXA_ABERTO    = 0;
  STATUS_CAIXA_FECHADO   = 1;
  STATUS_CAIXA_CANCELADO = 2;

  procedure MostrarTabelaCaixa(const AOwner : TComponent);

  function SelecionarCaixa(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
  function AbrirCaixa(const AOwner : TComponent; const Usuario : String) : Boolean;
  function FecharCaixa(const AOwner : TComponent; const Usuario : String) : Boolean;

implementation

uses
  DateUtils, UDMBusiness, UDMNFe, UConstantesDGE, UDMRecursos;

{$R *.dfm}

procedure MostrarTabelaCaixa(const AOwner : TComponent);
var
  frm : TfrmGeCaixa;
  whr : String;
begin
  frm := TfrmGeCaixa.Create(AOwner);
  try
    whr := 'c.Data_abertura between ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e1Data.Date) ) + ' and ' +
            QuotedStr( FormatDateTime('yyyy-mm-dd', frm.e2Data.Date) );

    with frm, fdQryTabela do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        frm.WhereAdditional := '(cc.tipo = 1)'
      else
        frm.WhereAdditional := '(1 = 1)';

      Close;
      SQL.Add('where ' + whr + ' and ' + frm.WhereAdditional);
      SQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;


    Case gSistema.Codigo of
      SISTEMA_GESTAO_COM ,
      SISTEMA_GESTAO_OPME,
      SISTEMA_GESTAO_IND : frm.RotinaID := ROTINA_FIN_GERENCIAR_CAIXA_ID;
      SISTEMA_PDV        : frm.RotinaID := ROTINA_FIN_GERENCIAR_CAIXA_PDV_ID;
    end;

    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCaixa(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeCaixa;
begin
  frm := TfrmGeCaixa.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function AbrirCaixa(const AOwner : TComponent; const Usuario : String) : Boolean;
var
  frm : TfrmGeCaixa;
  whr : String;
begin
  frm := TfrmGeCaixa.Create(AOwner);
  try
    frm.Caption     := 'A B R I N D O   C A I X A   .    .   .';

    frm.btbtnIncluir.Caption := 'A&brir';
    frm.btbtnIncluir.Hint    := 'Abrir Caixa para Usuário logado.';

    frm.FAbrirCaixa  := True;
    frm.FFecharCaixa := False;

    whr := 'c.Situacao = 0 and ' +
           'c.Usuario = ' + QuotedStr(Usuario);

    with frm, fdQryTabela do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        frm.WhereAdditional := '(cc.tipo = 1)'
      else
        frm.WhereAdditional := '(1 = 1)';

      Close;
      SQL.Add('where ' + whr + ' and ' + frm.WhereAdditional);
      Open;
    end;

    Result := (frm.ShowModal = mrOk);
  finally
    frm.Destroy;
  end;
end;

function FecharCaixa(const AOwner : TComponent; const Usuario : String) : Boolean;
var
  frm : TfrmGeCaixa;
  whr : String;
begin
  frm := TfrmGeCaixa.Create(AOwner);
  try
    frm.Caption := 'E N C E R R A R   C A I X A   .    .   .';

    frm.FAbrirCaixa  := False;
    frm.FFecharCaixa := True;

    whr := 'c.Situacao = 0 and ' +
           'c.Usuario = ' + QuotedStr(Usuario);

    with frm, fdQryTabela do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        frm.WhereAdditional := '(cc.tipo = 1)'
      else
        frm.WhereAdditional := '(1 = 1)';

      Close;
      SQL.Add('where ' + whr + ' and ' + frm.WhereAdditional);
      Open;

      if ( FFecharCaixa and (DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_CAIXA_ABERTO) ) then
        ConsolidarCaixa(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);

      AbrirTabelaConsolidado(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);
      AbrirTabelaMovimento(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);
    end;

    Result := (frm.ShowModal = mrOk);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCaixa.FormCreate(Sender: TObject);
begin
  sGeneratorName := 'GEN_CAIXA_' + FormatFloat('0000', YearOf(GetDateDB));

  inherited;

  AbrirTabelaAuto:= True;

  SQL_Consolidado := TStringList.Create;
  SQL_Consolidado.Clear;
  SQL_Consolidado.AddStrings( cdsCosolidado.SQL );

  SQL_Movimento := TStringList.Create;
  SQL_Movimento.Clear;
  SQL_Movimento.AddStrings( qryMovimento.SQL );

  SQL_CaixaSintetico := TStringList.Create;
  SQL_CaixaSintetico.Clear;
  SQL_CaixaSintetico.AddStrings( qryCaixaSintetico.SQL );

  SQL_CaixaAnalitico := TStringList.Create;
  SQL_CaixaAnalitico.Clear;
  SQL_CaixaAnalitico.AddStrings( qryCaixaAnalitico.SQL );

  e1Data.Date := Date - 1;
  e2Data.Date := Date;
  ControlFirstEdit   := dbDataAbertura;
  pgcMaisDados.ActivePage := tbsConsolidado;

  CarregarLista(fdQryOperador);
  CarregarLista(fdQryContaCorrente);

  DisplayFormatCodigo := '###0000000';
  
  NomeTabela     := 'TBCAIXA';
  CampoCodigo    := 'Numero';
  CampoDescricao := 'c.Usuario';
  CampoOrdenacao := 'c.Data_abertura, c.Usuario';

  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    WhereAdditional := '(cc.tipo = 1)';
    fdQryContaCorrente.Filter   := 'TIPO = 1';
    fdQryContaCorrente.Filtered := True;
  end;

  with fdQryTabela, UpdateOptions do
  begin
    GeneratorName  := sGeneratorName;
    FetchGeneratorsPoint := TFDFetchGeneratorsPoint.gpImmediate;
    FieldByName('NUMERO').AutoGenerateValue := TAutoRefreshFlag.arAutoInc;
  end;

  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );

  FAbrirCaixa  := False;
  FFecharCaixa := False;
end;

procedure TfrmGeCaixa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( FFecharCaixa ) then
  begin
    btbtnIncluir.Enabled := False;
    btbtnAlterar.Enabled := False;
    btbtnExcluir.Enabled := False;
  end;

  dbDataAbertura.ReadOnly  := not (DtSrcTabela.DataSet.State = dsInsert);
  dbOperador.ReadOnly      := not (DtSrcTabela.DataSet.State = dsInsert);
  dbContaCorrente.ReadOnly := not (DtSrcTabela.DataSet.State = dsInsert);
end;

procedure TfrmGeCaixa.fdQryTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaConsolidado( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
  AbrirTabelaMovimento( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
end;

procedure TfrmGeCaixa.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if Trim(FieldByName('USUARIO_CANCEL').AsString) = EmptyStr then
      FieldByName('USUARIO_CANCEL').Clear;

    if ( fdQryContaCorrente.Locate('CODIGO', FieldByName('CONTA_CORRENTE').AsInteger, []) ) then
      if ( fdQryContaCorrente.FieldByName('TIPO').AsInteger = 1 ) then
        FieldByName('TIPO').AsString := 'Caixa'
      else
      if ( fdQryContaCorrente.FieldByName('TIPO').AsInteger = 1 ) then
        FieldByName('TIPO').AsString := 'Banco';
  end;
end;

procedure TfrmGeCaixa.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( FAbrirCaixa ) then
      FieldByName('USUARIO').AsString := gUsuarioLogado.Login;

    FieldByName('Ano').AsInteger            := YearOf(GetDateTimeDB);
    FieldByName('DATA_ABERTURA').AsDateTime := GetDateTimeDB;
    FieldByName('SITUACAO').AsInteger      := STATUS_CAIXA_ABERTO;
    FieldByName('VALOR_TOTAL_CREDITO').AsCurrency := 0;
    FieldByName('VALOR_TOTAL_DEBITO').AsCurrency  := 0;
    FieldByName('DATA_FECH').Clear;
    FieldByName('DATA_CANCEL').Clear;
    FieldByName('USUARIO_CANCEL').Clear;
    FieldByName('MOTIVO_CANCEL').Clear;
  end;
end;

procedure TfrmGeCaixa.fdQryTabelaSITUACAOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_CAIXA_ABERTO    : Text := 'Aberto';
    STATUS_CAIXA_FECHADO   : Text := 'Fechado';
    STATUS_CAIXA_CANCELADO : Text := 'Cancelado';
  end;
end;

procedure TfrmGeCaixa.AbrirTabelaConsolidado(const AnoCaixa: Smallint;
  const NumeroCaixa: Integer);
begin
//  if ( FFecharCaixa and (DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_CAIXA_ABERTO) ) then
//    ConsolidarCaixa(AnoCaixa, NumeroCaixa);
//
  cdsCosolidado.Close;

  with cdsCosolidado, SQL do
  begin
    Clear;
    AddStrings( SQL_Consolidado );
    Add('where cs.Ano    = ' + IntToStr(AnoCaixa));
    Add('  and cs.Numero = ' + IntToStr(NumeroCaixa));
  end;

  cdsCosolidado.Open;
end;

procedure TfrmGeCaixa.AbrirTabelaMovimento(const AnoCaixa: Smallint;
  const NumeroCaixa: Integer);
begin
  qryMovimento.Close;

  with qryMovimento do
  begin
    ParamByName('Caixa_ano').AsSmallInt := AnoCaixa;
    ParamByName('Caixa_num').AsInteger  := NumeroCaixa;
  end;

  qryMovimento.Open;
  HabilitarDesabilitar_Btns;

  if (pgcGuias.ActivePage = tbsCadastro) and (DtSrcTabela.DataSet.FieldByName('CONTA_CORRENTE').AsInteger > 0) then
    GerarSaldoContaCorrente(DtSrcTabela.DataSet.FieldByName('CONTA_CORRENTE').AsInteger, DtSrcTabela.DataSet.FieldByName('DATA_ABERTURA').AsDateTime);
end;

procedure TfrmGeCaixa.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger > STATUS_CAIXA_ABERTO ) then
  begin
    Case DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger of
      STATUS_CAIXA_FECHADO   : sMsg := 'Este Caixa não pode ser excluído porque já está fechado.';
      STATUS_CAIXA_CANCELADO : sMsg := 'Este Caixa não pode ser excluído porque já está cancelado.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    AbrirTabelaMovimento(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);

    if ( not qryMovimento.IsEmpty ) then
    begin
      ShowWarning('Este Caixa não pode ser excluído porque exite movimentação de crédito/débito associado ao caixa.');
      Abort;
    end;

    inherited;

    if ( not OcorreuErro ) then
    begin
      AbrirTabelaConsolidado( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
      AbrirTabelaMovimento( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
    end;
  end;
end;

procedure TfrmGeCaixa.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  if (pgcGuias.ActivePage = tbsCadastro) then
    try
      WaitAMoment(WAIT_AMOMENT_LoadData);

      AbrirTabelaConsolidado( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
      AbrirTabelaMovimento( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );

      pgcMaisDados.ActivePage := tbsConsolidado;
    finally
      WaitAMomentFree;
    end;
end;

procedure TfrmGeCaixa.btbtnIncluirClick(Sender: TObject);
//var
//  iAno ,
//  iNum : Integer;
begin
//  iAno := YearOf(GetDateDB);
//  iNum := GetGeneratorID(sGeneratorName);
//
  inherited;

  if ( not OcorreuErro ) then
  begin
    AbrirTabelaConsolidado( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
    AbrirTabelaMovimento( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
  end;
end;

procedure TfrmGeCaixa.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger > STATUS_CAIXA_ABERTO ) then
  begin
    Case DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger of
      STATUS_CAIXA_FECHADO   : sMsg := 'Este Caixa não pode ser alterado porque já está fechado.';
      STATUS_CAIXA_CANCELADO : sMsg := 'Este Caixa não pode ser alterado porque já está cancelado.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaConsolidado( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
      AbrirTabelaMovimento( DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger );
    end;
  end;
end;

procedure TfrmGeCaixa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    // Destacar Caixas Abertos
    if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_CAIXA_ABERTO ) then
      dbgDados.Canvas.Font.Color := lblCaixaAberto.Font.Color
    else
    // Destacar Caixas Cancelados
    if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_CAIXA_CANCELADO ) then
      dbgDados.Canvas.Font.Color := lblCaixaCancelado.Font.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end
  else
  // Destacar movimentos de Entrada/Saída cancelados
  if ( Sender = dbgMovimento ) then
  begin
    if ( qryMovimentoSITUACAO.AsInteger = 0 ) then
      dbgMovimento.Canvas.Font.Color := lblCaixaCancelado.Font.Color;

    dbgMovimento.DefaultDrawDataCell(Rect, dbgMovimento.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeCaixa.HabilitarDesabilitar_Btns;
begin
  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnEncerrar.Enabled      := (DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger < STATUS_CAIXA_FECHADO) and (not qryMovimento.IsEmpty);
    btbtnCancelarCaixa.Enabled := (DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger < STATUS_CAIXA_FECHADO) and qryMovimento.IsEmpty;
  end
  else
  begin
    btbtnEncerrar.Enabled      := False;
    btbtnCancelarCaixa.Enabled := False;
  end;
end;

procedure TfrmGeCaixa.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    if ( FAbrirCaixa and (not (DtSrcTabela.DataSet.State in [dsEdit, dsInsert])) ) then
      ModalResult := mrOk;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeCaixa.btbtnEncerrarClick(Sender: TObject);
var
  sMsg : String;
  DataDB,
  Data  : TDateTime;
begin
  inherited;
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = STATUS_CAIXA_ABERTO ) then
  begin
    AbrirTabelaMovimento(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);

    // Consolidar Movimentacao

    if ( not qryMovimento.IsEmpty ) then
    begin
      ConsolidarCaixa(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);
      AbrirTabelaConsolidado(DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);
    end;

    if ( qryMovimento.IsEmpty ) then
      sMsg := 'Não existe movimentação para o Caixa selecionado!' + #13#13 + 'Deseja encerrá-lo mesmo assim?'
    else
      sMsg := 'Deseja encerrar o Caixa selecionado?';

    if ( ShowConfirmation('Encerrar Caixa', sMsg) ) then
    begin
      // Recalcular Saldo da Conta Corrente
      WaitAMoment(WAIT_AMOMENT_Process);
      try
        Data   := DtSrcTabela.DataSet.FieldByName('DATA_ABERTURA').AsDateTime;
        DataDB := GetDateDB;
        while Data <= DataDB do
        begin
          GerarSaldoContaCorrente(DtSrcTabela.DataSet.FieldByName('CONTA_CORRENTE').AsInteger, Data);
          Data := Data + 1;
        end;

        // Encerrar Caixa
        fdQryTabela.Edit;
        DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger   := STATUS_CAIXA_FECHADO;
        DtSrcTabela.DataSet.FieldByName('DATA_FECH').AsDateTime := GetDateDB;
        fdQryTabela.Post;
        fdQryTabela.ApplyUpdates;
        fdQryTabela.CommitUpdates;

        CommitTransaction;

        HabilitarDesabilitar_Btns;

        ShowInformation('Caixa selecionado encerrado com sucesso.');

        nmImprimirCaixaAnalitico.Click;
      finally
        WaitAMomentFree;
      end;
    end;
  end;

end;

procedure TfrmGeCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  HabilitarDesabilitar_Btns;

  if ( FFecharCaixa ) then
  begin

    pnlFiltros.Visible      := False;
    tbsTabela.TabVisible    := not DtSrcTabela.DataSet.IsEmpty;

    lblOperador.Enabled := False;
    dbOperador.Enabled  := False;

    if ( DtSrcTabela.DataSet.RecordCount = 0 ) then
    begin
      ShowWarning('Não existe caixa a ser encerrado para o usuário ativo no sistema');

      pgcGuias.Enabled   := False;
      btbtnLista.Enabled := False;
    end
    else
    if ( DtSrcTabela.DataSet.RecordCount = 1 ) then
    begin
      pgcGuias.ActivePage := tbsCadastro;
      HabilitarDesabilitar_Btns;

      pnlFiltros.Visible      := False;
      tbsTabela.TabVisible    := False;

      lblOperador.Enabled := False;
      dbOperador.Enabled  := False;
    end
    else
    if ( pgcGuias.ActivePage = tbsTabela ) then
    begin
      ShowWarning('Existe(m) mais de um caixa(s) aberto(s) para o usuário logado.' + #13#13 +
                  'Caso deseje encerrar um caixa específico, selecione-o clicando duas vezes no registro correspondente.');

      if ( tbsTabela.TabVisible ) then
        dbgDados.SetFocus;
    end;

  end
  else
  if ( FAbrirCaixa and btbtnIncluir.Enabled ) then
  begin

    pnlFiltros.Visible      := False;
    tbsTabela.TabVisible    := not DtSrcTabela.DataSet.IsEmpty;
    btbtnEncerrar.Visible   := False;
    pgcMaisDados.Visible    := False;

    lblOperador.Enabled := False;
    dbOperador.Enabled  := False;

    if ( DtSrcTabela.DataSet.IsEmpty ) then
      btbtnIncluir.Click
    else
    begin
      tbsCadastro.TabVisible := True;
      ShowWarning('Existe(m) caixa(s) aberto(s) para o usuário logado.' + #13#13 +
                  'Caso deseje abrir um novo caixa para uma conta corrente diferente, favor ir para a guia DADOS e clicar no botão ABRIR.');
    end;

  end;
end;

procedure TfrmGeCaixa.qryMovimentoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryMovimentoANO.IsNull then
    qryMovimentoControleMov.AsString := EmptyStr
  else
    qryMovimentoControleMov.AsString := qryMovimentoANO.AsString  + FormatFloat('"/"###0000000', qryMovimentoNUMERO.AsInteger);

  if ( qryMovimentoVENDA_ANO.AsInteger > 0 ) then
    qryMovimentoControleVenda.AsString  := qryMovimentoVENDA_ANO.AsString  + FormatFloat('"/"###0000000', qryMovimentoVENDA_NUM.AsInteger)
  else
    qryMovimentoControleVenda.AsString  := EmptyStr;

  if ( qryMovimentoCOMPRA_ANO.AsInteger > 0 ) then
    qryMovimentoControleCompra.AsString := qryMovimentoCOMPRA_ANO.AsString + FormatFloat('"/"###0000000', qryMovimentoCOMPRA_NUM.AsInteger)
  else
    qryMovimentoControleCompra.AsString := EmptyStr;
end;

procedure TfrmGeCaixa.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    if ( FAbrirCaixa ) then
      ModalResult := mrCancel;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeCaixa.btbtnListaClick(Sender: TObject);
begin
  inherited;
  ppImprimir.Popup(btbtnLista.ClientOrigin.X, btbtnLista.ClientOrigin.Y + btbtnLista.Height);
end;

procedure TfrmGeCaixa.ConsolidarCaixa(const AnoCaixa: Smallint;
  const NumeroCaixa: Integer);
begin
  WaitAMoment(WAIT_AMOMENT_Process, 'Gerando consolidação do Caixa');
  try

    try

      with fdStrPrcCaixaConsolidar do
      begin
        ParamByName('Ano_Caixa').AsSmallInt := AnoCaixa;
        ParamByName('Num_Caixa').AsInteger  := NumeroCaixa;
        ExecProc;

        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        if DMBusiness.fdConexao.InTransaction then
          DMBusiness.fdConexao.RollbackRetaining;

        ShowError('Erro ao tentar consolidar a movimentação do caixa selecionado.' + #13#13 + E.Message);
      end;
    end;

  finally
    WaitAMomentFree;
  end;
end;

procedure TfrmGeCaixa.nmImprimirCaixaSinteticoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := gUsuarioLogado.Empresa;
      Open;
    end;

    with qryCaixaSintetico, SQL do
    begin
      Close;
      Clear;
      AddStrings( SQL_CaixaSintetico );
      Add('where c.Ano    = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
      Add('  and c.Numero = ' + DtSrcTabela.DataSet.FieldByName('NUMERO').AsString);
      Open;
    end;

    if ( not qryCaixaSintetico.IsEmpty ) then
      frrCaixaSintetico.ShowReport;

  end;
end;

procedure TfrmGeCaixa.nmImprimirCaixaAnaliticoClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.IsEmpty ) then
    Exit;

  with DMNFe do
  begin

    with qryEmitente do
    begin
      Close;
      ParamByName('Cnpj').AsString := IfThen(Trim(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString) = EmptyStr, gUsuarioLogado.Empresa, Trim(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString));
      Open;
    end;

    with qryCaixaSintetico, SQL do
    begin
      Close;
      Clear;
      AddStrings( SQL_CaixaSintetico );
      Add('where c.Ano    = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
      Add('  and c.Numero = ' + DtSrcTabela.DataSet.FieldByName('NUMERO').AsString);
      Open;
    end;

    if ( gSistema.Codigo = SISTEMA_PDV ) then
    begin

      if not GetCupomNaoFiscalEmitir then
        ShowWarning(
          'Esta estação não está configurada para a impressão de Cupom no Fechamento do Caixa.' + #13 +
          'Favor realizar a impressão do Caixa no sistema de retaguarda!')
      else
        ImprimirCupomFechamentoCaixa(gUsuarioLogado.Empresa, DtSrcTabela.DataSet.FieldByName('ANO').AsInteger, DtSrcTabela.DataSet.FieldByName('NUMERO').AsInteger);

    end
    else
    begin

      with qryCaixaAnalitico, SQL do
      begin
        Close;
        Clear;
        AddStrings( SQL_CaixaAnalitico );
        Add('where c.Ano    = ' + DtSrcTabela.DataSet.FieldByName('ANO').AsString);
        Add('  and c.Numero = ' + DtSrcTabela.DataSet.FieldByName('NUMERO').AsString);
        Add('order by cm.Forma_pagto, cm.Ano, cm.Numero');
        Open;
      end;

      if ( not qryCaixaAnalitico.IsEmpty ) then
        frrCaixaAnalitico.ShowReport;

    end;

  end;
end;

procedure TfrmGeCaixa.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := '((c.Conta_corrente is null) or (e.cnpj is not null)) ' +
    ' and (c.Data_abertura between ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
      QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) ) + ')';

  if (gSistema.Codigo = SISTEMA_PDV) then
    WhereAdditional := '(cc.tipo = 1) and (' + WhereAdditional + ')';

  inherited;
end;

function TfrmGeCaixa.GetRotinaCancelarCaixaID: String;
begin
  Result := GetRotinaInternaID(btbtnCancelarCaixa);
end;

function TfrmGeCaixa.GetRotinaEncerrarCaixaID: String;
begin
  Result := GetRotinaInternaID(btbtnEncerrar);
end;

procedure TfrmGeCaixa.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnEncerrar.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaEncerrarCaixaID, btbtnEncerrar.Caption, RotinaID);

    if btbtnCancelarCaixa.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarCaixaID, btbtnCancelarCaixa.Caption, RotinaID);
  end;
end;

procedure TfrmGeCaixa.btbtnCancelarCaixaClick(Sender: TObject);
begin

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

end;

procedure TfrmGeCaixa.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

initialization
  FormFunction.RegisterForm('frmGeCaixa', TfrmGeCaixa);

end.
