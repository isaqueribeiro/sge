unit UGeCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, Menus, IBStoredProc, frxClass,
  frxDBSet, IBQuery;

type
  TfrmGeCaixa = class(TfrmGrPadraoCadastro)
    IbDtstTabelaANO: TSmallintField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaDATA_ABERTURA: TDateField;
    IbDtstTabelaDATA_FECH: TDateField;
    IbDtstTabelaDATA_CANCEL: TDateField;
    IbDtstTabelaUSUARIO: TIBStringField;
    IbDtstTabelaUSUARIO_CANCEL: TIBStringField;
    IbDtstTabelaSITUACAO: TSmallintField;
    IbDtstTabelaCONTA_CORRENTE: TIntegerField;
    IbDtstTabelaVALOR_TOTAL_CREDITO: TIBBCDField;
    IbDtstTabelaVALOR_TOTAL_DEBITO: TIBBCDField;
    IbDtstTabelaDESCRICAO: TIBStringField;
    IbDtstTabelaTIPO: TIBStringField;
    tblOperador: TIBTable;
    dtsOperador: TDataSource;
    tblContaCorrente: TIBTable;
    dtsContaCorrente: TDataSource;
    lblOperador: TLabel;
    dbOperador: TDBLookupComboBox;
    lblContaCorrente: TLabel;
    dbContaCorrente: TDBLookupComboBox;
    dbDataAbertura: TDBDateEdit;
    lblDataAbertura: TLabel;
    lblSituacao: TLabel;
    dbSituacao: TDBEdit;
    IbDtstTabelaMOTIVO_CANCEL: TIBStringField;
    GrpBxDadosEncerramento: TGroupBox;
    lblDataFech: TLabel;
    dbDataFech: TDBDateEdit;
    lblEntrada: TLabel;
    dbEntrada: TDBEdit;
    lblSaida: TLabel;
    dbSaida: TDBEdit;
    lblDataCancel: TLabel;
    dbDataCancel: TDBDateEdit;
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
    cdsCosolidado: TIBDataSet;
    IbUpdConsolidado: TIBUpdateSQL;
    DtSrcConsolidado: TDataSource;
    dtsMovimento: TDataSource;
    qryMovimento: TIBDataSet;
    cdsCosolidadoANO: TSmallintField;
    cdsCosolidadoNUMERO: TIntegerField;
    cdsCosolidadoSEQ: TSmallintField;
    cdsCosolidadoFORMA_PAGTO: TSmallintField;
    cdsCosolidadoDESCRICAO: TIBStringField;
    cdsCosolidadoTOTAL_CREDITO: TIBBCDField;
    cdsCosolidadoTOTAL_DEBITO: TIBBCDField;
    lblCaixaAberto: TLabel;
    lblCaixaCancelado: TLabel;
    Label1: TLabel;
    btbtnEncerrar: TBitBtn;
    Bevel6: TBevel;
    qryMovimentoANO: TSmallintField;
    qryMovimentoNUMERO: TIntegerField;
    qryMovimentoFORMA_PAGTO: TSmallintField;
    qryMovimentoFORMA_PAGTO_DESC: TIBStringField;
    qryMovimentoDATAHORA: TDateTimeField;
    qryMovimentoTIPO: TIBStringField;
    qryMovimentoHISTORICO: TIBStringField;
    qryMovimentoVALOR: TIBBCDField;
    qryMovimentoSITUACAO: TSmallintField;
    qryMovimentoVENDA_ANO: TSmallintField;
    qryMovimentoVENDA_NUM: TIntegerField;
    qryMovimentoCLIENTE: TIBStringField;
    qryMovimentoCOMPRA_ANO: TSmallintField;
    qryMovimentoCOMPRA_NUM: TIntegerField;
    qryMovimentoFORNECEDOR: TIntegerField;
    qryMovimentoControleVenda: TStringField;
    qryMovimentoControleCompra: TStringField;
    qryMovimentoControleMov: TStringField;
    ppImprimir: TPopupMenu;
    nmImprimirCaixaEncerrado: TMenuItem;
    N1: TMenuItem;
    nmImprimirCaixaSintetico: TMenuItem;
    nmImprimirCaixaAnalitico: TMenuItem;
    lblData: TLabel;
    e1Data: TDateTimePicker;
    e2Data: TDateTimePicker;
    btbtnCancelarCaixa: TBitBtn;
    Bevel7: TBevel;
    IBStrPrcCaixaConsolidar: TIBStoredProc;
    qryCaixaSintetico: TIBQuery;
    frdCaixaSintetico: TfrxDBDataset;
    frrCaixaSintetico: TfrxReport;
    frrCaixaAnalitico: TfrxReport;
    qryCaixaAnalitico: TIBQuery;
    frdCaixaAnalitico: TfrxDBDataset;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaSITUACAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnEncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryMovimentoCalcFields(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
    procedure nmImprimirCaixaSinteticoClick(Sender: TObject);
    procedure nmImprimirCaixaAnaliticoClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnCancelarCaixaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  DateUtils, UDMBusiness, UDMNFe, UConstantesDGE;

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

    with frm, IbDtstTabela do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        frm.WhereAdditional := '(cc.tipo = 1)'
      else
        frm.WhereAdditional := '(1 = 1)';

      Close;
      SelectSQL.Add('where ' + whr + ' and ' + frm.WhereAdditional);
      SelectSQL.Add('order by ' + CampoOrdenacao);
      Open;
    end;

    frm.RotinaID := ROTINA_FIN_GERENCIAR_CAIXA_ID;
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

    frm.FAbrirCaixa := True;

    whr := 'c.Situacao = 0 and ' +
           'c.Usuario = ' + QuotedStr(Usuario);

    with frm, IbDtstTabela do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        frm.WhereAdditional := '(cc.tipo = 1)'
      else
        frm.WhereAdditional := '(1 = 1)';

      Close;
      SelectSQL.Add('where ' + whr + ' and ' + frm.WhereAdditional);
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

    frm.FFecharCaixa := True;

    whr := 'c.Situacao = 0 and ' +
           'c.Usuario = ' + QuotedStr(Usuario);

    with frm, IbDtstTabela do
    begin
      if (gSistema.Codigo = SISTEMA_PDV) then
        frm.WhereAdditional := '(cc.tipo = 1)'
      else
        frm.WhereAdditional := '(1 = 1)';

      Close;
      SelectSQL.Add('where ' + whr + ' and ' + frm.WhereAdditional);
      Open;
      
      AbrirTabelaConsolidado(IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger);
      AbrirTabelaMovimento(IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger);

      HabilitarDesabilitar_Btns;
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
  SQL_Consolidado.AddStrings( cdsCosolidado.SelectSQL );

  SQL_Movimento := TStringList.Create;
  SQL_Movimento.Clear;
  SQL_Movimento.AddStrings( qryMovimento.SelectSQL );

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

  tblOperador.Open;
  tblContaCorrente.Open;

  DisplayFormatCodigo := '###0000000';
  
  NomeTabela     := 'TBCAIXA';
  CampoCodigo    := 'Numero';
  CampoDescricao := 'c.Usuario';
  CampoOrdenacao := 'c.Data_abertura, c.Usuario';

  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    WhereAdditional := '(cc.tipo = 1)';
    tblContaCorrente.Filter   := 'TIPO = 1';
    tblContaCorrente.Filtered := True;
  end;

  with IbDtstTabela, GeneratorField do
  begin
    Field       := CampoCodigo;
    Generator   := sGeneratorName;
    IncrementBy := 1;
  end;

  UpdateGenerator( 'where Ano = ' + FormatFloat('0000', YearOf(Date)) );

  FAbrirCaixa  := False;
  FFecharCaixa := False;
end;

procedure TfrmGeCaixa.IbDtstTabelaSITUACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  Case Sender.AsInteger of
    STATUS_CAIXA_ABERTO    : Text := 'Aberto';
    STATUS_CAIXA_FECHADO   : Text := 'Fechado';
    STATUS_CAIXA_CANCELADO : Text := 'Cancelado';
  end;
end;

procedure TfrmGeCaixa.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( FAbrirCaixa ) then
    IbDtstTabelaUSUARIO.Value := GetUserApp;

  IbDtstTabelaAno.Value           := YearOf(GetDateTimeDB);
  IbDtstTabelaDATA_ABERTURA.Value := GetDateTimeDB;
  IbDtstTabelaSITUACAO.Value      := STATUS_CAIXA_ABERTO;
  IbDtstTabelaVALOR_TOTAL_CREDITO.Value := 0;
  IbDtstTabelaVALOR_TOTAL_DEBITO.Value  := 0;
  IbDtstTabelaDATA_FECH.Clear;
  IbDtstTabelaDATA_CANCEL.Clear;
  IbDtstTabelaUSUARIO_CANCEL.Clear;
  IbDtstTabelaMOTIVO_CANCEL.Clear;
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

  dbDataAbertura.ReadOnly  := not (IbDtstTabela.State = dsInsert);
  dbOperador.ReadOnly      := not (IbDtstTabela.State = dsInsert);
  dbContaCorrente.ReadOnly := not (IbDtstTabela.State = dsInsert);
end;

procedure TfrmGeCaixa.AbrirTabelaConsolidado(const AnoCaixa: Smallint;
  const NumeroCaixa: Integer);
begin
  if ( FFecharCaixa and (IbDtstTabelaSITUACAO.AsInteger = 0) ) then
    ConsolidarCaixa(AnoCaixa, NumeroCaixa);

  cdsCosolidado.Close;

  with cdsCosolidado, SelectSQL do
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

  with qryMovimento, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Movimento );
    Add('where cm.Caixa_ano = ' + IntToStr(AnoCaixa));
    Add('  and cm.Caixa_num = ' + IntToStr(NumeroCaixa));
    Add('order by cm.Ano, cm.Numero');
  end;

  qryMovimento.Open;
  HabilitarDesabilitar_Btns;

  if ( IbDtstTabelaCONTA_CORRENTE.AsInteger > 0 ) then
    GerarSaldoContaCorrente(IbDtstTabelaCONTA_CORRENTE.AsInteger, IbDtstTabelaDATA_ABERTURA.AsDateTime);
end;

procedure TfrmGeCaixa.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaConsolidado( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
  AbrirTabelaMovimento( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
end;

procedure TfrmGeCaixa.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  if ( IbDtstTabelaSITUACAO.AsInteger > STATUS_CAIXA_ABERTO ) then
  begin
    Case IbDtstTabelaSITUACAO.AsInteger of
      STATUS_CAIXA_FECHADO   : sMsg := 'Este Caixa não pode ser excluído porque já está fechado.';
      STATUS_CAIXA_CANCELADO : sMsg := 'Este Caixa não pode ser excluído porque já está cancelado.';
    end;

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    AbrirTabelaMovimento(IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger);

    if ( not qryMovimento.IsEmpty ) then
    begin
      ShowWarning('Este Caixa não pode ser excluído porque exite movimentação de crédito/débito associado ao caixa.');
      Abort;
    end;

    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaConsolidado( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
      AbrirTabelaMovimento( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
    end;
  end;
end;

procedure TfrmGeCaixa.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaConsolidado( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
  AbrirTabelaMovimento( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );

  pgcMaisDados.ActivePage := tbsConsolidado;
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
//    IbDtstTabelaANO.AsInteger        := iAno;
//    IbDtstTabelaCODCONTROL.AsInteger := iNum;
//
    AbrirTabelaConsolidado( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
    AbrirTabelaMovimento( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
  end;
end;

procedure TfrmGeCaixa.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  if ( IbDtstTabelaSITUACAO.AsInteger > STATUS_CAIXA_ABERTO ) then
  begin
    Case IbDtstTabelaSITUACAO.AsInteger of
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
      AbrirTabelaConsolidado( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
      AbrirTabelaMovimento( IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger );
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
    if ( IbDtstTabelaSITUACAO.AsInteger = STATUS_CAIXA_ABERTO ) then
      dbgDados.Canvas.Font.Color := lblCaixaAberto.Font.Color
    else
    // Destacar Caixas Cancelados
    if ( IbDtstTabelaSITUACAO.AsInteger = STATUS_CAIXA_CANCELADO ) then
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
    btbtnEncerrar.Enabled      := False;
    btbtnCancelarCaixa.Enabled := False;
  end
  else
  begin
    btbtnEncerrar.Enabled      := (IbDtstTabelaSITUACAO.AsInteger < STATUS_CAIXA_FECHADO) and (not cdsCosolidado.IsEmpty);
    btbtnCancelarCaixa.Enabled := (IbDtstTabelaSITUACAO.AsInteger < STATUS_CAIXA_FECHADO) and (not cdsCosolidado.IsEmpty) and (qryMovimento.IsEmpty);
  end;
end;

procedure TfrmGeCaixa.btbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    if ( FAbrirCaixa and (not (IbDtstTabela.State in [dsEdit, dsInsert])) ) then
      ModalResult := mrOk;

    HabilitarDesabilitar_Btns;
  end;
end;

procedure TfrmGeCaixa.btbtnEncerrarClick(Sender: TObject);
var
  sMsg : String;
  Data : TDateTime;
begin
  inherited;
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  if ( IbDtstTabelaSITUACAO.AsInteger = STATUS_CAIXA_ABERTO ) then
  begin
    AbrirTabelaMovimento(IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger);
    if ( qryMovimento.IsEmpty ) then
      sMsg := 'Não existe movimentação para o Caixa selecionado!' + #13#13 + 'Deseja encerrar mesmo desta forma o Caixa selecionado?'
    else
      sMsg := 'Deseja encerrar o Caixa selecionado?';

    if ( ShowConfirm(sMsg, 'Encerrar Caixa') ) then
    begin
      // Consolidar Movimentacao
      ConsolidarCaixa(IbDtstTabelaANO.AsInteger, IbDtstTabelaNUMERO.AsInteger);

      // Recalcular Saldo da Conta Corrente
      Data := IbDtstTabelaDATA_ABERTURA.AsDateTime;
      while Data <= GetDateDB do
      begin
        GerarSaldoContaCorrente(IbDtstTabelaCONTA_CORRENTE.AsInteger, Data);
        Data := Data + 1;
      end;

      // Encerrar Caixa
      IbDtstTabela.Edit;
      IbDtstTabelaSITUACAO.Value  := STATUS_CAIXA_FECHADO;
      IbDtstTabelaDATA_FECH.Value := GetDateDB;
      IbDtstTabela.Post;
      IbDtstTabela.ApplyUpdates;

      CommitTransaction;

      HabilitarDesabilitar_Btns;

      ShowInformation('Caixa selecionado encerrado com sucesso.');

      nmImprimirCaixaAnalitico.Click;
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
    tbsTabela.TabVisible    := not IbDtstTabela.IsEmpty;

    lblOperador.Enabled := False;
    dbOperador.Enabled  := False;

    if ( IbDtstTabela.RecordCount = 0 ) then
    begin
      ShowWarning('Não existe caixa a ser encerrado para o usuário ativo no sistema');

      pgcGuias.Enabled   := False;
      btbtnLista.Enabled := False;
    end
    else
    if ( IbDtstTabela.RecordCount = 1 ) then
      pgcGuias.ActivePage := tbsCadastro
    else
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
    tbsTabela.TabVisible    := not IbDtstTabela.IsEmpty;
    btbtnEncerrar.Visible   := False;
    pgcMaisDados.Visible    := False;

    lblOperador.Enabled := False;
    dbOperador.Enabled  := False;

    if ( IbDtstTabela.IsEmpty ) then
      btbtnIncluir.Click
    else
      ShowWarning('Existe(m) caixa(s) aberto(s) para o usuário logado.' + #13#13 +
                  'Caso deseje abrir um novo caixa para uma conta corrente diferente, favor ir para a guia DADOS e clicar no botão ABRIR.');
  end;
end;

procedure TfrmGeCaixa.qryMovimentoCalcFields(DataSet: TDataSet);
begin
  inherited;
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

procedure TfrmGeCaixa.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ( tblContaCorrente.Locate('CODIGO', IbDtstTabelaCONTA_CORRENTE.AsInteger, []) ) then
    if ( tblContaCorrente.FieldByName('TIPO').AsInteger = 1 ) then
      IbDtstTabelaTIPO.Value := 'Caixa'
    else
    if ( tblContaCorrente.FieldByName('TIPO').AsInteger = 1 ) then
      IbDtstTabelaTIPO.Value := 'Banco';
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
  try

    try

      with IBStrPrcCaixaConsolidar do
      begin
        ParamByName('Ano_Caixa').AsInteger := AnoCaixa;
        ParamByName('Num_Caixa').AsInteger := NumeroCaixa;
        ExecProc;

        CommitTransaction;
      end;

    except
      On E : Exception do
      begin
        DMBusiness.ibtrnsctnBusiness.Rollback;
        ShowError('Erro ao tentar consolidar a movimentação do caixa selecionado.' + #13#13 + E.Message);
      end;
    end;

  finally
  end;
end;

procedure TfrmGeCaixa.nmImprimirCaixaSinteticoClick(Sender: TObject);
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

    with qryCaixaSintetico, SQL do
    begin
      Close;
      Clear;
      AddStrings( SQL_CaixaSintetico );
      Add('where c.Ano    = ' + IbDtstTabelaANO.AsString);
      Add('  and c.Numero = ' + IbDtstTabelaNUMERO.AsString);
      Open;
    end;

    if ( not qryCaixaSintetico.IsEmpty ) then
      frrCaixaSintetico.ShowReport;

  end;
end;

procedure TfrmGeCaixa.nmImprimirCaixaAnaliticoClick(Sender: TObject);
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

    with qryCaixaSintetico, SQL do
    begin
      Close;
      Clear;
      AddStrings( SQL_CaixaSintetico );
      Add('where c.Ano    = ' + IbDtstTabelaANO.AsString);
      Add('  and c.Numero = ' + IbDtstTabelaNUMERO.AsString);
      Open;
    end;

    with qryCaixaAnalitico, SQL do
    begin
      Close;
      Clear;
      AddStrings( SQL_CaixaAnalitico );
      Add('where c.Ano    = ' + IbDtstTabelaANO.AsString);
      Add('  and c.Numero = ' + IbDtstTabelaNUMERO.AsString);
      Add('order by cm.Forma_pagto, cm.Ano, cm.Numero');
      Open;
    end;

    if ( not qryCaixaAnalitico.IsEmpty ) then
      frrCaixaAnalitico.ShowReport;

  end;
end;

procedure TfrmGeCaixa.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := 'c.Data_abertura between ' +
    QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
    QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

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
