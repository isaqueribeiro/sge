unit View.TipoDespesa;

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
  TViewTipoDespesa = class(TViewPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    lblPlanoContas: TLabel;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    lblClassificacao: TLabel;
    dbClassificacao: TDBLookupComboBox;
    DtsClassificacao: TDataSource;
    dtsPlanoConta: TDataSource;
    Bevel6: TBevel;
    GrpBxPlanoConta: TGroupBox;
    PnlPlanoContaBtn: TPanel;
    BtnPlanoAdicionar: TcxButton;
    BtnPlanoExcluir: TcxButton;
    Bevel7: TBevel;
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
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure dbgPlanoContasDblClick(Sender: TObject);
    procedure dbgPlanoContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure BtnPlanoAdicionarClick(Sender: TObject);
    procedure cdsPlanoContaSelecionarGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure BtnPlanoExcluirClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
    FControllerTipoDespesaPlanoConta,
    FControllerClasseDespesaView    : IControllerCustom;
    procedure CarregarPlanoConta;
    procedure GravarRelacaoPlanoConta;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBTPDESPESA
  - TBTPDESPESA_PLANO
  - TBPLANO_CONTA
  - TBEMPRESA

  Views:
  - VW_CLASSIFICAO_DESPESA

  Procedures:

*)

var
  ViewTipoDespesa: TViewTipoDespesa;

  procedure MostrarTipoDespesas(const AOwner : TComponent);

  function SelecionarTipoDespesa(const AOwner : TComponent; const aEmpresa : String;
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

procedure MostrarTipoDespesas(const AOwner : TComponent);
var
  frm : TViewTipoDespesa;
begin
  frm := TViewTipoDespesa.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoDespesa(const AOwner : TComponent; const aEmpresa : String;
  var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewTipoDespesa;
begin
  frm := TViewTipoDespesa.Create(AOwner);
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

procedure TViewTipoDespesa.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.TipoDespesa;
  FControllerTipoDespesaPlanoConta := TControllerFactory.New.TipoDespesaPlanoConta;
  FControllerClasseDespesaView     := TControllerFactory.New.ClasseDespesa;

  inherited;
  RotinaID            := ROTINA_CAD_TIPO_DESPESA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##000';
  NomeTabela          := 'TBTPDESPESA';
  CampoCodigo         := 'COD';
  CampoDescricao      := 'TIPODESP';
  CampoOrdenacao      := 'TIPODESP';
  CampoCadastroAtivo  := 'ATIVO';

  FController.DAO.ParamsByName('empresa', gUsuarioLogado.Empresa);
  FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;

  Tabela
    .Display('COD',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('TIPODESP', 'Descrição', True)
    .Display('CLASSIFICACAO', 'Classificação', True)
    .Display('TIPO_PARTICULAR_DESC', 'Particular', TAlignment.taCenter);

  AbrirTabelaAuto := True;
  TController(FControllerClasseDespesaView).LookupComboBox(dbClassificacao, DtsClassificacao, 'classificacao', 'tpe_codigo', 'tpe_descricao');
  dtsPlanoConta.DataSet := FControllerTipoDespesaPlanoConta.DAO.DataSet;
end;

procedure TViewTipoDespesa.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TViewTipoDespesa.btbtnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarPlanoConta;
end;

procedure TViewTipoDespesa.btbtnListaClick(Sender: TObject);
begin
  inherited;
  DMNFe.fdQryListaTipoDespesa.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
  DMNFe.frrListaTipoDespesa.ShowReport;
end;

procedure TViewTipoDespesa.btbtnSalvarClick(Sender: TObject);
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

procedure TViewTipoDespesa.BtnPlanoAdicionarClick(Sender: TObject);
var
  aPlanoConta : TPlanoConta;
begin
  aPlanoConta.Codigo := 0;
  aPlanoConta.CodigoContabil := EmptyStr;
  aPlanoConta.Descricao      := EmptyStr;
  aPlanoConta.Empresa        := EmptyStr;
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarPlanoConta(Self, tpLancamento, 0, EmptyStr, '3', aPlanoConta) ) then // 3. Despesas
    begin
      if (Trim(aPlanoConta.Empresa) = EmptyStr) and (FControllerTipoDespesaPlanoConta.DAO.DataSet.RecordCount > 0) then
        ShowWarning('É permitida a associação de apenas 1 (um) plano de conta quando este será usado por todas as empresas')
      else
      if (not aPlanoConta.Empresa.IsEmpty) and FControllerTipoDespesaPlanoConta.DAO.DataSet.Locate('plano;empresa', VarArrayOf([aPlanoConta.Codigo, aPlanoConta.Empresa]), []) then
        ShowWarning('Plano de Contas já associado ao Tipo de Despesa')
      else
      if aPlanoConta.Empresa.IsEmpty and FControllerTipoDespesaPlanoConta.DAO.DataSet.Locate('plano', aPlanoConta.Codigo, []) then
        ShowWarning('Plano de Contas já associado ao Tipo de Despesa')
      else
      if FControllerTipoDespesaPlanoConta.DAO.DataSet.Locate('empresa', aPlanoConta.Empresa, []) then
        ShowWarning('Não é permitido mais de um Plano de Contas por empresa para o mesmo Tipo de Despesa')
      else
        with FControllerTipoDespesaPlanoConta.DAO.DataSet do
        begin
          Append;
          FieldByName('despesa').AsInteger    := DtSrcTabela.DataSet.FieldByName('COD').AsInteger;
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

procedure TViewTipoDespesa.BtnPlanoExcluirClick(Sender: TObject);
begin
  if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if (FControllerTipoDespesaPlanoConta.DAO.DataSet.RecordCount > 0) then
    begin
      FControllerTipoDespesaPlanoConta.DAO.DataSet.Delete;
      FControllerTipoDespesaPlanoConta.DAO.ApplyUpdates;
    end;
end;

procedure TViewTipoDespesa.CarregarPlanoConta;
begin
  FControllerTipoDespesaPlanoConta.DAO.DataSet.Close;
  FControllerTipoDespesaPlanoConta.DAO.ParamsByName('tipo', DtSrcTabela.DataSet.FieldByName('cod').AsInteger);
  FControllerTipoDespesaPlanoConta.DAO.Open;

  FControllerTipoDespesaPlanoConta.DAO.DataSet.FieldByName('selecionar').Alignment := TAlignment.taCenter;
  FControllerTipoDespesaPlanoConta.DAO.DataSet.FieldByName('selecionar').OnGetText := cdsPlanoContaSelecionarGetText;
end;

procedure TViewTipoDespesa.cdsPlanoContaSelecionarGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TViewTipoDespesa.dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  aImage : Byte;
begin
  inherited;
  if (Sender = dbgPlanoContas) then
  begin

    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'SELECIONAR') then
    begin
      aImage := Column.Field.AsInteger;
      TDBGrid(Sender).Canvas.FillRect(Rect);
      imgGrid.Draw(TDBGrid(Sender).Canvas, Rect.Left + 5, Rect.Top + 1, aImage);
    end;

  end;
end;

procedure TViewTipoDespesa.dbgPlanoContasDblClick(Sender: TObject);
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

procedure TViewTipoDespesa.dbgPlanoContasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgPlanoContasDblClick(Sender);
end;

procedure TViewTipoDespesa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  BtnPlanoAdicionar.Enabled := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  BtnPlanoExcluir.Enabled   := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
  dtsPlanoConta.AutoEdit    := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewTipoDespesa.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarPlanoConta;
end;

procedure TViewTipoDespesa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
//  begin
//
//    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
//      if ( dbPlanoContas.Focused ) then
//      begin
//        DtSrcTabela.DataSet.FieldByName('PLANO_CONTA').Clear;
//        DtSrcTabela.DataSet.FieldByName('DESCRICAO_RESUMIDA').Clear;
//      end;
//
//  end;
//
  if (Shift = [ssCtrl]) and (Key = VK_INSERT) Then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      BtnPlanoAdicionar.Click;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) Then
    if ( DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
      BtnPlanoExcluir.Click;

  inherited;
end;

procedure TViewTipoDespesa.GravarRelacaoPlanoConta;
begin
  FControllerTipoDespesaPlanoConta.DAO.ApplyUpdates;
end;

initialization
  FormFunction.RegisterForm('ViewTipoDespesa', TViewTipoDespesa);

end.
