unit View.TipoReceita;

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

  JvExMask,
  JvToolEdit,
  JvDBControls,

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
  TViewTipoReceita = class(TViewPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    lblPlanoContas: TLabel;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    DtsClassificacao: TDataSource;
    lblClassificacao: TLabel;
    dbClassificacao: TDBLookupComboBox;
    Bevel6: TBevel;
    dtsPlanoConta: TDataSource;
    GrpBxPlanoConta: TGroupBox;
    PnlPlanoContaBtn: TPanel;
    Bevel7: TBevel;
    BtnPlanoAdicionar: TcxButton;
    BtnPlanoExcluir: TcxButton;
    dbgPlanoContas: TDBGrid;
    lblRegistroDesativado: TLabel;
    imgGrid: TImageList;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnListaClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure BtnPlanoAdicionarClick(Sender: TObject);
    procedure cdsPlanoContaSelecionarGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgPlanoContasDblClick(Sender: TObject);
    procedure dbgPlanoContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure BtnPlanoExcluirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerTipoReceitaPlanoConta,
    FControllerClasseReceitaView    : IControllerCustom;
    procedure CarregarPlanoConta;
    procedure GravarRelacaoPlanoConta;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBTPRECEITA
  - TBTPRECEITA_PLANO
  - TBPLANO_CONTA
  - TBEMPRESA

  Views:
  - VW_CLASSIFICAO_RECEITA

  Procedures:

*)

var
  ViewTipoReceita: TViewTipoReceita;

  procedure MostrarTipoReceitas(const AOwner : TComponent);

  function SelecionarTipoReceita(const AOwner : TComponent; const aEmpresa : String;
    var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UDMNFe,
  View.PlanoConta,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

procedure MostrarTipoReceitas(const AOwner : TComponent);
var
  frm : TViewTipoReceita;
begin
  frm := TViewTipoReceita.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoReceita(const AOwner : TComponent; const aEmpresa : String;
  var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewTipoReceita;
begin
  frm := TViewTipoReceita.Create(AOwner);
  try
    frm.FController
      .DAO
        .ParamsByName('empresa', aEmpresa)
      .Open;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewTipoReceita.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.TipoReceita;
  FControllerTipoReceitaPlanoConta := TControllerFactory.New.TipoReceitaPlanoConta;
  FControllerClasseReceitaView     := TControllerFactory.New.ClasseReceita;

  inherited;
  RotinaID            := ROTINA_CAD_TIPO_RECEITA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##000';
  NomeTabela          := 'TBTPRECEITA';
  CampoCodigo         := 'COD';
  CampoDescricao      := 'TIPOREC';
  CampoOrdenacao      := 'TIPOREC';
  CampoCadastroAtivo  := 'ATIVO';

  FController.DAO.ParamsByName('empresa', gUsuarioLogado.Empresa);
  FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;

  Tabela
    .Display('COD',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('TIPOREC', 'Descrição', True)
    .Display('CLASSIFICACAO', 'Classificação', True)
    .Display('TIPO_PARTICULAR_DESC', 'Particular', TAlignment.taCenter);

  AbrirTabelaAuto := True;
  TController(FControllerClasseReceitaView).LookupComboBox(dbClassificacao, DtsClassificacao, 'classificacao', 'tpe_codigo', 'tpe_descricao');
  dtsPlanoConta.DataSet := FControllerTipoReceitaPlanoConta.DAO.DataSet;
end;

procedure TViewTipoReceita.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TViewTipoReceita.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TViewTipoReceita.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    CarregarPlanoConta;
end;

procedure TViewTipoReceita.btbtnListaClick(Sender: TObject);
begin
  inherited;
  DMNFe.fdQryListaTipoReceita.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
  DMNFe.frrListaTipoReceita.ShowReport;
end;

procedure TViewTipoReceita.btbtnSalvarClick(Sender: TObject);
begin
  try
    FController.DAO.DataSet.AfterScroll := nil;
    inherited;
    if (not OcorreuErro) then
      GravarRelacaoPlanoConta;
  finally
    FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
  end;
end;

procedure TViewTipoReceita.BtnPlanoAdicionarClick(Sender: TObject);
var
  aPlanoConta : TPlanoConta;
begin
  aPlanoConta.Codigo := 0;
  aPlanoConta.CodigoContabil := EmptyStr;
  aPlanoConta.Descricao      := EmptyStr;
  aPlanoConta.Empresa        := EmptyStr;
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarPlanoConta(Self, tpLancamento, 0, EmptyStr, '4', aPlanoConta) ) then  // 4. Receitas
    begin
      if (Trim(aPlanoConta.Empresa) = EmptyStr) and (FControllerTipoReceitaPlanoConta.DAO.DataSet.RecordCount > 0) then
        ShowWarning('É permitida a associação de apenas 1 (um) plano de conta quando este será usado por todas as empresas')
      else
      if (not aPlanoConta.Empresa.IsEmpty) and FControllerTipoReceitaPlanoConta.DAO.DataSet.Locate('plano;empresa', VarArrayOf([aPlanoConta.Codigo, aPlanoConta.Empresa]), []) then
        ShowWarning('Plano de Contas já associado ao Tipo de Receita')
      else
      if aPlanoConta.Empresa.IsEmpty and FControllerTipoReceitaPlanoConta.DAO.DataSet.Locate('plano', aPlanoConta.Codigo, []) then
        ShowWarning('Plano de Contas já associado ao Tipo de Receita')
      else
      if FControllerTipoReceitaPlanoConta.DAO.DataSet.Locate('empresa', aPlanoConta.Empresa, []) then
        ShowWarning('Não é permitido mais de um Plano de Contas por empresa para o mesmo Tipo de Receita')
      else
        with FControllerTipoReceitaPlanoConta.DAO.DataSet do
        begin
          Append;
          FieldByName('receita').AsInteger    := DtSrcTabela.DataSet.FieldByName('COD').AsInteger;
          FieldByName('selecionar').AsInteger := 1;
          FieldByName('plano').AsInteger      := aPlanoConta.Codigo;
          FieldByName('plano_conta').AsString := aPlanoConta.CodigoContabil + ' - ' + aPlanoConta.Descricao;
          FieldByName('empresa_razao').AsString    := aPlanoConta.RazaoSocial;
          FieldByName('empresa_fantasia').AsString := aPlanoConta.Fantasia;

          if (Trim(aPlanoConta.Empresa) = EmptyStr) then
            FieldByName('empresa').Clear
          else
            FieldByName('empresa').AsString := aPlanoConta.Empresa;

          Post;
        end;
    end;
end;

procedure TViewTipoReceita.BtnPlanoExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if (FControllerTipoReceitaPlanoConta.DAO.DataSet.RecordCount > 0) then
    begin
      FControllerTipoReceitaPlanoConta.DAO.DataSet.Delete;
      FControllerTipoReceitaPlanoConta.DAO.ApplyUpdates;
    end;
end;

procedure TViewTipoReceita.CarregarPlanoConta;
begin
  FControllerTipoReceitaPlanoConta.DAO.DataSet.Close;
  FControllerTipoReceitaPlanoConta.DAO.ParamsByName('tipo', DtSrcTabela.DataSet.FieldByName('cod').AsInteger);
  FControllerTipoReceitaPlanoConta.DAO.Open;

  FControllerTipoReceitaPlanoConta.DAO.DataSet.FieldByName('selecionar').Alignment := TAlignment.taCenter;
  FControllerTipoReceitaPlanoConta.DAO.DataSet.FieldByName('selecionar').OnGetText := cdsPlanoContaSelecionarGetText;
end;

procedure TViewTipoReceita.cdsPlanoContaSelecionarGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TViewTipoReceita.dbgPlanoContasDblClick(Sender: TObject);
begin
  if dtsPlanoConta.AutoEdit then
    if ( not dtsPlanoConta.DataSet.IsEmpty ) then
    begin
      dtsPlanoConta.DataSet.Edit;

      if ( dtsPlanoConta.DataSet.FieldByName('selecionar').AsInteger = 0 ) then
        dtsPlanoConta.DataSet.FieldByName('selecionar').AsInteger := 1
      else
        dtsPlanoConta.DataSet.FieldByName('selecionar').AsInteger := 0;

      dtsPlanoConta.DataSet.Post;
    end;
end;

procedure TViewTipoReceita.dbgPlanoContasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgPlanoContasDblClick(Sender);
end;

procedure TViewTipoReceita.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  BtnPlanoAdicionar.Enabled := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  BtnPlanoExcluir.Enabled   := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  dtsPlanoConta.AutoEdit    := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewTipoReceita.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarPlanoConta;
end;

procedure TViewTipoReceita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      BtnPlanoAdicionar.Click;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      BtnPlanoExcluir.Click;

  inherited;
end;

procedure TViewTipoReceita.GravarRelacaoPlanoConta;
begin
  FControllerTipoReceitaPlanoConta.DAO.ApplyUpdates;
end;

initialization
  FormFunction.RegisterForm('ViewTipoReceita', TViewTipoReceita);

end.
