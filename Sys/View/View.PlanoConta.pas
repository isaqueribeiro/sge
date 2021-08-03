unit View.PlanoConta;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UConstantesDGE;

type
  TPlanoConta = record
    Codigo         : Integer;
    CodigoContabil ,
    Descricao      ,
    Empresa        ,
    RazaoSocial    ,
    Fantasia       : String;
  end;

  TViewPlanoConta = class(TViewPadraoCadastro)
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
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblRegistroDesativado: TLabel;
    chkPlanoContaAtivo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView,
    FControllerNivelView  ,
    FControllerTipoView   ,
    FControllerGrupo      : IControllerCustom;
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
  ViewPlanoConta: TViewPlanoConta;

  function SelecionarPlanoConta(const AOwner : TComponent;
    const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
    const aEmpresa : String; var Codigo : Integer; var Descricao : String) : Boolean; overload;
  function SelecionarPlanoConta(const AOwner : TComponent;
    const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
    const aEmpresa, aGrupoContabil : String; var aPlanoConta : TPlanoConta) : Boolean; overload;

implementation

uses
  UDMBusiness,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

function SelecionarPlanoConta(const AOwner : TComponent;
  const TipoPlanoConta : TTipoPlanoConta; const Exercicio : Smallint;
  const aEmpresa : String; var Codigo : Integer; var Descricao : String) : Boolean;
var
  AForm  : TViewPlanoConta;
  sWhere : String;
begin
  AForm := TViewPlanoConta.Create(AOwner);
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
  const aEmpresa, aGrupoContabil : String; var aPlanoConta : TPlanoConta) : Boolean;
var
  AForm  : TViewPlanoConta;
  aCodigo   : Integer;
  aDescricao,
  sWhere    : String;
begin
  AForm := TViewPlanoConta.Create(AOwner);
  try
    sWhere := '(p.situacao = 1)';

    if (Trim(aEmpresa) <> EmptyStr) then
      sWhere := sWhere + ' and ((p.empresa is null) or (p.empresa = ' + QuotedStr(aEmpresa) + '))';

    if (Trim(aGrupoContabil) <> EmptyStr) then
      sWhere := sWhere + ' and (p.codigo_contabil like ' +  QuotedStr(aGrupoContabil + '%') + ')';

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

procedure TViewPlanoConta.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.PlanoConta;
  FControllerEmpresaView  := TControllerFactory.New.EmpresaView;
  FControllerNivelView    := TControllerFactory.New.PlanoContaNivel;
  FControllerTipoView     := TControllerFactory.New.PlanoCOntaTipo;
  FControllerGrupo        := TControllerFactory.New.PlanoConta;

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

  Tabela
    .Display('CODIGO',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NIVEL', 'Nível', True)
    .Display('EMPRESA', 'Empresa', False)
    .Display('DESCRICAO_RESUMIDA', 'Descrição Resumida', True)
    .Display('TIPO', 'Tipo', True)
    .Display('CODIGO_CONTABIL', 'Código Contábil', True)
    .Display('DESCRICAO_COMPLETA', 'Descrição Completa', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);

  TController(FControllerEmpresaView).LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');
  TController(FControllerNivelView).LookupComboBox(dbNivel, dtsNivel, 'nivel', 'codigo', 'descricao');
  TController(FControllerTipoView).LookupComboBox(dbTipo, dtsTipo, 'tipo', 'codigo', 'descricao');
  TController(FControllerGrupo).LookupComboBox(dbGrupo, dtsGrupo, 'grupo', 'codigo', 'descricao_resumida_geral');
end;

procedure TViewPlanoConta.DtSrcTabelaDataChange(Sender: TObject;
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


    FControllerGrupo.DAO.DataSet.Close;
    FControllerGrupo.DAO.DataSet.Filter   := sFiltro;
    FControllerGrupo.DAO.DataSet.Filtered := True;
    FControllerGrupo.DAO.DataSet.Open;
  end;
end;

procedure TViewPlanoConta.btbtnSalvarClick(Sender: TObject);
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]) then
    with DtSrcTabela.DataSet do
    begin
      if Trim(FieldByName('empresa').AsString) = EmptyStr then
        FieldByName('empresa').Clear;

      if FieldByName('grupo').AsLargeInt = 0 then
        FieldByName('grupo').Clear;
    end;

  inherited;
end;

procedure TViewPlanoConta.btnFiltrarClick(Sender: TObject);
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

procedure TViewPlanoConta.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TViewPlanoConta.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  FControllerGrupo.DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

initialization
  FormFunction.RegisterForm('ViewPlanoConta', TViewPlanoConta);

end.
