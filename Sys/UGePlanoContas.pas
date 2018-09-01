unit UGePlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB, cxButtons,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, Menus,
  ToolWin, IBTable, IBQuery, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

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
    dtsNivel: TDataSource;
    fdQryEmpresa: TFDQuery;
    dtsEmpresa: TDataSource;
    fdQryTipo: TFDQuery;
    fdQryNivel: TFDQuery;
    fdQryGrupo: TFDQuery;
    IbDtstTabelaEMPRESA: TIBStringField;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblRegistroDesativado: TLabel;
    IbDtstTabelaRZSOC: TIBStringField;
    chkPlanoContaAtivo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBPLANO_CONTA

  Views:
  - VW_EMPRESA
  - VW_TIPO_PLANO_CONTA
  - VW_NIVEL_PLANO_CONTA

  Procedures:

*)

var
  frmGePlanoContas: TfrmGePlanoContas;

  function SelecionarPlanoConta(const AOwner : TComponent;
    const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
    const aEmpresa : String; var Codigo : Integer; var Descricao : String) : Boolean;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

function SelecionarPlanoConta(const AOwner : TComponent;
  const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
  const aEmpresa : String; var Codigo : Integer; var Descricao : String) : Boolean;
var
  AForm : TfrmGePlanoContas;
  sEmpresa : String;
begin
  AForm := TfrmGePlanoContas.Create(AOwner);
  try
    sEmpresa := '(p.situacao = 1) and (p.empresa is null)';
    if (Trim(aEmpresa) <> EmptyStr) then
      sEmpresa := '(' + sEmpresa + ' or (p.empresa = ' + QuotedStr(aEmpresa) + '))';

    if ( Exercicio = 0 ) then
      AForm.WhereAdditional := sEmpresa + ' and (p.exercicio = 0)'
    else
      AForm.WhereAdditional := sEmpresa + ' and (p.exercicio = ' + IntToStr(Exercicio) + ')';

    if ( TipoPlanoConta <> tpNull ) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (p.tipo = ' + IntToStr(Ord(TipoPlanoConta)) + ')';

    AForm.chkPlanoContaAtivo.Checked := True;
    AForm.chkPlanoContaAtivo.Enabled := False;
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

  NomeTabela         := 'TBPLANO_CONTA';
  CampoCodigo        := 'codigo';
  CampoDescricao     := 'descricao_resumida';
  CampoOrdenacao     := 'p.codigo_contabil, p.descricao_resumida';
  CampoCadastroAtivo := 'situacao';
  UpdateGenerator;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipo);
  CarregarLista(fdQryNivel);
  CarregarLista(fdQryGrupo);
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
  IbDtstTabelaEMPRESA.Clear;
  IbDtstTabelaNIVEL.Clear;
  IbDtstTabelaGRUPO.Clear;
  IbDtstTabelaCODIGO_CONTABIL.Clear;
  IbDtstTabelaCODIGO_RESUMIDO.Clear;
end;

procedure TfrmGePlanoContas.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  sFiltro : String;
begin
  if ((Field = IbDtstTabelaNIVEL) or (Field = IbDtstTabelaEMPRESA)) then
  begin
    sFiltro := '(nivel = ' + IntToStr(IbDtstTabelaNIVEL.AsInteger - 1) + ')';
    if (IbDtstTabelaEMPRESA.IsNull) then
      sFiltro := '(' + sFiltro + '  and (empresa is null))'
    else
      sFiltro := '(' + sFiltro + '  and ((empresa is null) or (empresa = ' + QuotedStr(IbDtstTabelaEMPRESA.AsString) + ')))';

    fdQryGrupo.Close;
    fdQryGrupo.Filter   := sFiltro;
    fdQryGrupo.Filtered := True;
    fdQryGrupo.Open;
  end;
end;

procedure TfrmGePlanoContas.btnFiltrarClick(Sender: TObject);
var
  sAtivo : String;
begin
  if chkPlanoContaAtivo.Checked then
    sAtivo := '(p.situacao = 1)'
  else
    sAtivo := EmptyStr;

  if (sAtivo <> EmptyStr) then
    if (WhereAdditional = EmptyStr) then
      WhereAdditional := sAtivo
    else
      WhereAdditional := WhereAdditional + ' and ' + sAtivo;

  inherited;
end;

procedure TfrmGePlanoContas.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
//  // Destacar Planos de Contas desativados
//  if ( IbDtstTabelaSITUACAO.AsInteger = 0 ) then
//    dbgDados.Canvas.Font.Color := clRed;
//
//  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
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
        IbDtstTabelaGRUPO.Clear
      else
      if ( dbEmpresa.Focused ) then
        IbDtstTabelaEMPRESA.Clear;

  end;

  inherited;
end;

procedure TfrmGePlanoContas.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  fdQryGrupo.Filtered := (IbDtstTabela.State in [dsEdit, dsInsert]);
end;

initialization
  FormFunction.RegisterForm('frmGePlanoContas', TfrmGePlanoContas);

end.
