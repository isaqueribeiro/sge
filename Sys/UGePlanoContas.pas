unit UGePlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, RxDBComb, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TTipoPlanoConta = (tpNull = -1, tpAgrupador = 0, tpLancamento = 1);
  TfrmGePlanoContas = class(TfrmGrPadraoCadastro)
    lblDescricaoResumida: TLabel;
    dbDescricaoResumida: TDBEdit;
    dbSituacao: TDBCheckBox;
    dtsGrupo: TDataSource;
    lblGrupo: TLabel;
    dbGrupo: TDBLookupComboBox;
    lblExercicio: TLabel;
    dbExercicio: TDBEdit;
    lblCodigoContabil: TLabel;
    dbCodigoContabil: TDBEdit;
    lblCodigoResumido: TLabel;
    dbCodigoResumido: TDBEdit;
    lblDescricaoCompleta: TLabel;
    dbDescricaoCompleta: TDBEdit;
    lblTipo: TLabel;
    dbTipo: TDBLookupComboBox;
    qryGrupo: TIBQuery;
    qryTipo: TIBQuery;
    dtsTipo: TDataSource;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaEXERCICIO: TSmallintField;
    IbDtstTabelaGRUPO: TIntegerField;
    IbDtstTabelaNIVEL: TSmallintField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaCODIGO_CONTABIL: TIBStringField;
    IbDtstTabelaCODIGO_RESUMIDO: TIBStringField;
    IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField;
    IbDtstTabelaDESCRICAO_COMPLETA: TIBStringField;
    IbDtstTabelaSITUACAO: TSmallintField;
    IbDtstTabelaTIPO_DESCRICAO: TIBStringField;
    IbDtstTabelaAtivo: TStringField;
    lblNivel: TLabel;
    dbNivel: TDBLookupComboBox;
    qryNivel: TIBQuery;
    dtsNivel: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGePlanoContas: TfrmGePlanoContas;

  function SelecionarPlanoConta(const AOwner : TComponent; const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
    var Codigo : Integer; var Descricao : String) : Boolean;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

function SelecionarPlanoConta(const AOwner : TComponent; const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
  var Codigo : Integer; var Descricao : String) : Boolean;
var
  AForm : TfrmGePlanoContas;
begin
  AForm := TfrmGePlanoContas.Create(AOwner);
  try
    if ( Exercicio = 0 ) then
      AForm.WhereAdditional := '(p.exercicio = 0)'
    else
      AForm.WhereAdditional := '(p.exercicio = ' + IntToStr(Exercicio) + ')';

    if ( TipoPlanoConta <> tpNull ) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (p.tipo = ' + IntToStr(Ord(TipoPlanoConta)) + ')';

    AForm.FiltarDados;
      
    Result := AForm.SelecionarRegistro(Codigo, Descricao, AForm.WhereAdditional);
  finally
    AForm.Free;
  end;
end;

procedure TfrmGePlanoContas.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_PLANO_CONTAS_ID;
  ControlFirstEdit := dbNivel;
  AbrirTabelaAuto  := True;

  DisplayFormatCodigo := '0000';

  NomeTabela     := 'TBPLANO_CONTA';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'descricao_resumida';
  CampoOrdenacao := 'p.codigo';
  UpdateGenerator;

  qryTipo.Open;
  qryNivel.Open;
  qryGrupo.Open;
end;

procedure TfrmGePlanoContas.IbDtstTabelaCalcFields(DataSet: TDataSet);
begin
  IbDtstTabelaAtivo.AsString := IfThen(IbDtstTabelaSITUACAO.AsInteger = 1, 'X', '.');
end;

procedure TfrmGePlanoContas.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaTIPO.AsInteger      := 0;
  IbDtstTabelaSITUACAO.AsInteger  := 1;
  IbDtstTabelaEXERCICIO.AsInteger := 0;
  IbDtstTabelaNIVEL.Clear;
  IbDtstTabelaGRUPO.Clear;
  IbDtstTabelaCODIGO_CONTABIL.Clear;
  IbDtstTabelaCODIGO_RESUMIDO.Clear;
end;

procedure TfrmGePlanoContas.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if (Field = IbDtstTabelaNIVEL) then
  begin
    qryGrupo.Close;
    qryGrupo.Filter   := 'nivel = ' + IntToStr(IbDtstTabelaNIVEL.AsInteger - 1);
    qryGrupo.Filtered := True;
    qryGrupo.Open;
  end;
end;

procedure TfrmGePlanoContas.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  // Destacar Planos de Contas desativados
  if ( IbDtstTabelaSITUACAO.AsInteger = 0 ) then
    dbgDados.Canvas.Font.Color := clRed;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGePlanoContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( dbNivel.Focused ) then
        IbDtstTabelaNIVEL.Clear
      else
      if ( dbTipo.Focused ) then
        IbDtstTabelaTIPO.Clear
      else
      if ( dbGrupo.Focused ) then
        IbDtstTabelaGRUPO.Clear;
        
  end;

  inherited;
end;

procedure TfrmGePlanoContas.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  qryGrupo.Filtered := (IbDtstTabela.State in [dsEdit, dsInsert]);
end;

initialization
  FormFunction.RegisterForm('frmGePlanoContas', TfrmGePlanoContas);

end.
