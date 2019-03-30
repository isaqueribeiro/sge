unit UGePlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB, cxButtons,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, Menus,
  ToolWin, IBTable, IBQuery, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TTipoPlanoConta = (tpNull = -1, tpAgrupador = 0, tpLancamento = 1);
  TPlanoConta = record
    Codigo         : Integer;
    CodigoContabil ,
    Descricao      ,
    Empresa        ,
    RazaoSocial    ,
    Fantasia       : String;
  end;

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
    lblNivel: TLabel;
    dbNivel: TDBLookupComboBox;
    dtsNivel: TDataSource;
    fdQryEmpresa: TFDQuery;
    dtsEmpresa: TDataSource;
    fdQryTipo: TFDQuery;
    fdQryNivel: TFDQuery;
    fdQryGrupo: TFDQuery;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblRegistroDesativado: TLabel;
    chkPlanoContaAtivo: TCheckBox;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaEXERCICIO: TSmallintField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaGRUPO: TIntegerField;
    fdQryTabelaNIVEL: TSmallintField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaCODIGO_CONTABIL: TStringField;
    fdQryTabelaCODIGO_RESUMIDO: TStringField;
    fdQryTabelaDESCRICAO_RESUMIDA: TStringField;
    fdQryTabelaDESCRICAO_COMPLETA: TStringField;
    fdQryTabelaSITUACAO: TSmallintField;
    fdQryTabelaTIPO_DESCRICAO: TStringField;
    fdQryTabelaRAZAO: TStringField;
    fdQryTabelaFANTASIA: TStringField;
    fdQryTabelaAtivo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
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
    const aEmpresa : String; var Codigo : Integer; var Descricao : String) : Boolean; overload;
  function SelecionarPlanoConta(const AOwner : TComponent;
    const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
    const aEmpresa : String; var aPlanoConta : TPlanoConta) : Boolean; overload;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

function SelecionarPlanoConta(const AOwner : TComponent;
  const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
  const aEmpresa : String; var Codigo : Integer; var Descricao : String) : Boolean;
var
  AForm  : TfrmGePlanoContas;
  sWhere : String;
begin
  AForm := TfrmGePlanoContas.Create(AOwner);
  try
    sWhere := '(p.situacao = 1)';
    if (Trim(aEmpresa) <> EmptyStr) then
      sWhere := sWhere + ' and ((p.empresa is null) or (p.empresa = ' + QuotedStr(aEmpresa) + '))';

    if ( Exercicio = 0 ) then
      AForm.WhereAdditional := sWhere + ' and (p.exercicio = 0)'
    else
      AForm.WhereAdditional := sWhere + ' and (p.exercicio = ' + IntToStr(Exercicio) + ')';

    if ( TipoPlanoConta <> tpNull ) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (p.tipo = ' + IntToStr(Ord(TipoPlanoConta)) + ')';

    AForm.chkPlanoContaAtivo.Checked := True;
    AForm.chkPlanoContaAtivo.Enabled := False;
    AForm.DisableCadastro;
    AForm.FiltarDados;

    Result := AForm.SelecionarRegistro(Codigo, Descricao, AForm.WhereAdditional);
  finally
    AForm.Free;
  end;
end;

function SelecionarPlanoConta(const AOwner : TComponent;
  const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
  const aEmpresa : String; var aPlanoConta : TPlanoConta) : Boolean;
var
  AForm  : TfrmGePlanoContas;
  aCodigo   : Integer;
  aDescricao,
  sWhere    : String;
begin
  AForm := TfrmGePlanoContas.Create(AOwner);
  try
    sWhere := '(p.situacao = 1)';
    if (Trim(aEmpresa) <> EmptyStr) then
      sWhere := sWhere + ' and ((p.empresa is null) or (p.empresa = ' + QuotedStr(aEmpresa) + '))';

    if ( Exercicio = 0 ) then
      AForm.WhereAdditional := sWhere + ' and (p.exercicio = 0)'
    else
      AForm.WhereAdditional := sWhere + ' and (p.exercicio = ' + IntToStr(Exercicio) + ')';

    if ( TipoPlanoConta <> tpNull ) then
      AForm.WhereAdditional := AForm.WhereAdditional + ' and (p.tipo = ' + IntToStr(Ord(TipoPlanoConta)) + ')';

    AForm.chkPlanoContaAtivo.Checked := True;
    AForm.chkPlanoContaAtivo.Enabled := False;
    AForm.DisableCadastro;
    AForm.FiltarDados;

    aCodigo    := 0;
    aDescricao := EmptyStr;

    Result := AForm.SelecionarRegistro(aCodigo, aDescricao, AForm.WhereAdditional);
    if Result then
    begin
      aPlanoConta.Codigo         := aCodigo;
      aPlanoConta.Descricao      := aDescricao;
      aPlanoConta.CodigoContabil := Trim(AForm.DtSrcTabela.DataSet.FieldByName('codigo_contabil').AsString);
      aPlanoConta.Empresa        := Trim(AForm.DtSrcTabela.DataSet.FieldByName('empresa').AsString);
      aPlanoConta.RazaoSocial    := Trim(AForm.DtSrcTabela.DataSet.FieldByName('razao').AsString);
      aPlanoConta.Fantasia       := Trim(AForm.DtSrcTabela.DataSet.FieldByName('fantasia').AsString);
    end;
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
  CampoCodigo        := 'p.codigo';
  CampoDescricao     := 'p.descricao_resumida';
  CampoOrdenacao     := 'p.codigo_contabil, p.descricao_resumida';
  CampoCadastroAtivo := 'situacao';
  UpdateGenerator;

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryTipo);
  CarregarLista(fdQryNivel);
  CarregarLista(fdQryGrupo);
end;

procedure TfrmGePlanoContas.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  sFiltro : String;
begin
  if ((Field = DtSrcTabela.DataSet.FieldByName('NIVEL')) or (Field = DtSrcTabela.DataSet.FieldByName('EMPRESA'))) then
  begin
    sFiltro := '(nivel = ' + IntToStr(DtSrcTabela.DataSet.FieldByName('NIVEL').AsInteger - 1) + ')';
    if (DtSrcTabela.DataSet.FieldByName('EMPRESA').IsNull) then
      sFiltro := '(' + sFiltro + '  and (empresa is null))'
    else
      sFiltro := '(' + sFiltro + '  and ((empresa is null) or (empresa = ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString) + ')))';

    fdQryGrupo.Close;
    fdQryGrupo.Filter   := sFiltro;
    fdQryGrupo.Filtered := True;
    fdQryGrupo.Open;
  end;
end;

procedure TfrmGePlanoContas.btnFiltrarClick(Sender: TObject);
var
  sWhere ,
  sAtivo : String;
begin
  if chkPlanoContaAtivo.Checked then
    sAtivo := '(p.situacao = 1)'
  else
    sAtivo := EmptyStr;

  sWhere := StringReplace(WhereAdditional, '(p.situacao = 1) and ', '', []);
  sWhere := StringReplace(sWhere, ' and (p.situacao = 1)', '', []);
  sWhere := StringReplace(sWhere, '(p.situacao = 1)', '', []);

  WhereAdditional := sWhere;

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
//  if ( DtSrcTabela.DataSet.FieldByName('SITUACAO').AsInteger = 0 ) then
//    dbgDados.Canvas.Font.Color := clRed;
//
//  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGePlanoContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin
    with DtSrcTabela.DataSet do
    begin
      if ( State in [dsEdit, dsInsert] ) then
        if ( dbNivel.Focused ) then
          FieldByName('NIVEL').Clear
        else
        if ( dbTipo.Focused ) then
          FieldByName('TIPO').Clear
        else
        if ( dbGrupo.Focused ) then
          FieldByName('GRUPO').Clear
        else
        if ( dbEmpresa.Focused ) then
          FieldByName('EMPRESA').Clear;
    end;
  end;

  inherited;
end;

procedure TfrmGePlanoContas.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  fdQryGrupo.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGePlanoContas.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    if Trim(FieldByName('EMPRESA').AsString) = EmptyStr then
      FieldByName('EMPRESA').Clear;
end;

procedure TfrmGePlanoContas.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
    FieldByName('Ativo').AsString := IfThen(FieldByName('SITUACAO').AsInteger = 1, 'X', '.');
end;

procedure TfrmGePlanoContas.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('TIPO').AsInteger      := 0;
    FieldByName('SITUACAO').AsInteger  := 1;
    FieldByName('EXERCICIO').AsInteger := 0;
    FieldByName('EMPRESA').Clear;
    FieldByName('NIVEL').Clear;
    FieldByName('GRUPO').Clear;
    FieldByName('CODIGO_CONTABIL').Clear;
    FieldByName('CODIGO_RESUMIDO').Clear;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGePlanoContas', TfrmGePlanoContas);

end.
