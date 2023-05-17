unit View.Usuario;

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
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsDefaultPainters,
  dxSkinsCore,

  UObserverInterface,
  UConstantesDGE,
  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela;

type
  TViewUsuario = class(TViewPadraoCadastro)
    lblLogin: TLabel;
    dbLogin: TDBEdit;
    lblSenha: TLabel;
    dbSenha: TDBEdit;
    dbAlterarSenha: TDBCheckBox;
    GrpBxDadosGerais: TGroupBox;
    lblNomeCompleto: TLabel;
    lblFuncao: TLabel;
    dbNomeCompleto: TDBEdit;
    dbUsuarioAtivo: TDBCheckBox;
    dbFuncao: TDBLookupComboBox;
    DtsFuncao: TDataSource;
    Bevel5: TBevel;
    DtsVendedor: TDataSource;
    dtsTipoAlteraValor: TDataSource;
    pgcParametros: TPageControl;
    tbsVendas: TTabSheet;
    tbsControleInterno: TTabSheet;
    GrpBxParametrosAlmox: TGroupBox;
    dbAlmoxManifestoAuto: TDBCheckBox;
    GrpBxParametrosVenda: TGroupBox;
    lblPercentualDesc: TLabel;
    lblVendedor: TLabel;
    dbPercentualDesc: TDBEdit;
    dbAlterarValorVendaItem: TDBCheckBox;
    dbVendedor: TDBLookupComboBox;
    dbTipoAlteraValorVendaItem: TDBLookupComboBox;
    pnlStatus: TPanel;
    pnlSatusColor: TPanel;
    shpUsuarioInativo: TShape;
    pnlStatusText: TPanel;
    lblUsuarioInativo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbTipoAlteraValorVendaItemClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FControllerPerfil  ,
    FControllerVendedor,
    FControllerTipoDescontoView : IControllerCustom;

    function Controller : IControllerUsuario;
  public
    { Public declarations }
  end;

  function SelecionarUsuarioRequisitante(const AOnwer : TComponent; var Login, Nome : String) : Boolean;

(*
  Tabelas:
  - TBUSERS
  - TBFUNCAO
  - TBVENDEDOR

  Views:
  - VW_TIPO_ALTERA_VALOR_VENDA

  Procedures:

*)

implementation

uses
  UDMRecursos,
  Service.Message,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

function SelecionarUsuarioRequisitante(const AOnwer : TComponent; var Login, Nome : String) : Boolean;
var
  AForm : TViewUsuario;
begin
  AForm := TViewUsuario.Create(AOnwer);
  try
    with AForm do
    begin
      dbgDados.Columns[1].Visible := False; // Login

      btbtnIncluir.Visible  := False;
      btbtnAlterar.Visible  := False;
      btbtnExcluir.Visible  := False;
      btbtnCancelar.Visible := False;
      btbtnSalvar.Visible   := False;

      btbtnSelecionar.Visible := True;
      AbrirTabelaAuto         := True;

      tbsCadastro.TabVisible  := False;

      WhereAdditional := '(u.ativo = 1)';

      FController.DAO.ClearWhere;
      FController.DAO.Where(WhereAdditional);
      FController.DAO.Open;

      Result := AForm.SelecionarRegistro(Login, Nome, AForm.WhereAdditional);
    end;
  finally
    FreeAndNil(AForm);
  end;
end;

procedure TViewUsuario.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Usuario;
  FControllerPerfil := TControllerFactory.New.Perfil;
  FControllerVendedor := TControllerFactory.New.Vendedor;
  FControllerTipoDescontoView := TControllerFactory.New.TipoDescontoView;

  inherited;
  RotinaID            := ROTINA_CAD_USUARIO_ID;
  ControlFirstEdit    := dbLogin;
  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBUSERS';
  CampoCodigo    := 'u.coigo';
  CampoDescricao := 'u.nome';
  CampoOrdenacao := 'u.nomecompleto';
  CampoCadastroAtivo := 'u.ativo';

  Tabela
    .Display('COD',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NOME', 'Login', True)
    .Display('NOMECOMPLETO', 'Primeiro e Último Nome', True)
    .Display('CODFUNCAO', 'Perfil de Acesso', True)
    .Display('PERFIL',    'Perfil de Acesso', False)
    .Display('LIMIDESC',  '% Desconto', ',0.00', TAlignment.taRightJustify, False);

  AbrirTabelaAuto := True;

  if (Controller.DAO.Usuario.Funcao.Codigo <> FUNCTION_USER_ID_SYSTEM_ADM) then
    WhereAdditional := '(u.codfuncao <> ' + IntToStr(FUNCTION_USER_ID_SYSTEM_ADM) + ')';

  TController(FControllerPerfil)
    .LookupComboBox(dbFuncao, DtsFuncao, 'codfuncao', 'codigo', 'descricao');

  TController(FControllerVendedor)
    .LookupComboBox(dbVendedor, DtsVendedor, 'vendedor', 'codigo', 'nome');

  TController(FControllerTipoDescontoView)
    .LookupComboBox(dbTipoAlteraValorVendaItem, dtsTipoAlteraValor, 'tipo_alterar_valor_venda', 'codigo', 'descricao');

  dbAlterarValorVendaItem.Visible    := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  dbTipoAlteraValorVendaItem.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_OPME]);

  pgcParametros.ActivePage      := tbsVendas;
  tbsControleInterno.TabVisible := (gSistema.Codigo = SISTEMA_GESTAO_IND);
end;

procedure TViewUsuario.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if ( Field = DtSrcTabela.DataSet.FieldByName('PERM_ALTERAR_VALOR_VENDA') ) then
    dbTipoAlteraValorVendaItem.Enabled := (DtSrcTabela.DataSet.FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

procedure TViewUsuario.DtSrcTabelaStateChange(Sender: TObject);
var
  aFiltro : String;
begin
  inherited;
  aFiltro := '(ativo = 1)';

  if (Controller.DAO.Usuario.Funcao.Codigo <> FUNCTION_USER_ID_SYSTEM_ADM) then
    aFiltro := aFiltro + ' and (codigo != ' + IntToStr(FUNCTION_USER_ID_SYSTEM_ADM) + ')';

  FControllerPerfil.DAO.DataSet.Filter   := aFiltro;
  FControllerPerfil.DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);

  FControllerVendedor.DAO.DataSet.Filtered := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);

  if ( DtSrcTabela.DataSet.State = dsInsert ) then
  begin
    dbLogin.ReadOnly := False;
    dbLogin.Color    := dbSenha.Color;
  end
  else
  if ( DtSrcTabela.DataSet.State = dsEdit ) then
  begin
    dbLogin.ReadOnly := True;
    dbLogin.Color    := dbCodigo.Color;
  end;
end;

procedure TViewUsuario.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if (State = dsInsert) then
      if Controller.LoginExiste(FieldByName('NOME').AsString) then
      begin
        TServiceMessage.ShowWarning('Login informado já existe!');
        Exit;
      end;

    if ( (FieldByName('LIMIDESC').AsCurrency < 0) or (FieldByName('LIMIDESC').AsCurrency > 100) ) then
    begin
      TServiceMessage.ShowWarning('O Percentual de desconto informado é inválido!');
    end
    else
    begin

      FieldByName('PERFIL').AsString := dbFuncao.Text;
      inherited;

    end;
  end;
end;

procedure TViewUsuario.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    dbTipoAlteraValorVendaItem.Enabled := (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

function TViewUsuario.Controller: IControllerUsuario;
begin
  Result := (FController as IControllerUsuario);
end;

procedure TViewUsuario.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (Sender = dbgDados) then
  begin
    if (DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := shpUsuarioInativo.Brush.Color;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TViewUsuario.dbTipoAlteraValorVendaItemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    dbTipoAlteraValorVendaItem.Enabled := (FieldByName('PERM_ALTERAR_VALOR_VENDA').AsInteger = 1);
end;

initialization
  FormFunction.RegisterForm('ViewUsuario', TViewUsuario);

end.

