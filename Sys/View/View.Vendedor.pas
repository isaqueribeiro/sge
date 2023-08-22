unit View.Vendedor;

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
  SGE.Controller.Interfaces;

type
  TViewVendedor = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblCPF: TLabel;
    dbCPF: TDBEdit;
    dbComissao: TDBEdit;
    lblComissao: TLabel;
    dbComissaoValor: TDBEdit;
    lblComissaoValor: TLabel;
    chkbxAtivo: TDBCheckBox;
    dtsTipoComissao: TDataSource;
    lblTipoComissao: TLabel;
    dbTipoComissao: TDBLookupComboBox;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblRegistroDesativado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure DtSrcTabelaAfterScroll(DataSet: TDataSet);
    procedure pgcGuiasChange(Sender: TObject);
  private
    { Private declarations }
    FControllerTipoComissaoView : IControllerCustom;
    procedure ControleCampos;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBVENDEDOR

  Views:
  - VW_TIPO_COMISSAO

  Procedures:

*)

var
  ViewVendedor: TViewVendedor;

  procedure MostrarTabelaVendedores(const AOwner : TComponent);

  function SelecionarVendedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
  function SelecionarVendedorPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UDMRecursos,
  UConstantesDGE,
  Service.Message,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

procedure MostrarTabelaVendedores(const AOwner : TComponent);
var
  frm : TViewVendedor;
begin
  frm := TViewVendedor.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarVendedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewVendedor;
begin
  frm := TViewVendedor.Create(AOwner);
  try
    frm.WhereAdditional := '(v.ativo = 1)';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(frm.WhereAdditional);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
  finally
    frm.Destroy;
  end;
end;

function SelecionarVendedorPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewVendedor;
begin
  frm := TViewVendedor.Create(AOwner);
  try
    frm.btbtnIncluir.Visible  := False;
    frm.btbtnAlterar.Visible  := False;
    frm.btbtnExcluir.Visible  := False;
    frm.btbtnCancelar.Visible := False;
    frm.btbtnSalvar.Visible   := False;
    frm.btbtnLista.Visible    := False;
    frm.btbtnFechar.Visible   := False;

    frm.WhereAdditional := '(v.ativo = 1)';
    frm.AbrirTabelaAuto := True;

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(frm.WhereAdditional);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
  finally
    frm.Destroy;
  end;
end;

procedure TViewVendedor.ControleCampos;
begin
  with DtSrcTabela.DataSet do
  begin
    lblComissao.Enabled      := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
    dbComissao.Enabled       := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
    lblComissaoValor.Enabled := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
    dbComissaoValor.Enabled  := (FieldByName('COMISSAO_TIPO').AsInteger = 0);
  end;
end;

procedure TViewVendedor.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  if (Field = DtSrcTabela.DataSet.FieldByName('COMISSAO_TIPO')) then
    ControleCampos;
end;

procedure TViewVendedor.DtSrcTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ControleCampos;
end;

procedure TViewVendedor.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Vendedor;
  FControllerTipoComissaoView := TControllerFactory.New.TipoComissaoView;

  inherited;
  RotinaID            := ROTINA_CAD_VENDEDOR_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';

  NomeTabela         := 'TBVENDEDOR';
  CampoCodigo        := 'v.COD';
  CampoDescricao     := 'v.NOME';
  CampoOrdenacao     := 'v.NOME';
  CampoCadastroAtivo := 'ATIVO';

  Tabela
    .Display('COD', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NOME', 'Nome', True)
    .Display('CPF', 'CPF', False)
    .Display('COMISSAO_TIPO', 'Tipo Comissão', True)
    .Display('COMISSAO', 'Percentual (%)', ',0.00', TAlignment.taRightJustify, True)
    .Display('COMISSAO_VL', 'Valor (R$)', ',0.00', TAlignment.taRightJustify, True)
    .Display('COMISSAO_TIPO_FLAG', 'TC', TAlignment.taCenter, False);

  AbrirTabelaAuto := True;

  TController(FControllerTipoComissaoView)
    .LookupComboBox(dbTipoComissao, dtsTipoComissao, 'comissao_tipo', 'codigo', 'descricao');

  if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
    Self.Caption := 'Cadastro de Vendedores / Responsáveis';

  FController.DAO.DataSet.AfterScroll := DtSrcTabelaAfterScroll;
end;

procedure TViewVendedor.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  ControleCampos;
end;

procedure TViewVendedor.btbtnSalvarClick(Sender: TObject);
var
  aError : String;
begin
  if (Trim(DtSrcTabela.DataSet.FieldByName('CPF').AsString) <> EmptyStr) then
    if (not FuncoesString.StrIsCPF(DtSrcTabela.DataSet.FieldByName('CPF').AsString)) then
    begin
      TServiceMessage.ShowWarning('Favor informar um CPF válido.');
      Abort;
    end;

  if (DtSrcTabela.DataSet.FieldByName('EMAIL').AsString <> EmptyStr) then
    if StrIsEmail(DtSrcTabela.DataSet.FieldByName('EMAIL').AsString, aError) then
      DtSrcTabela.DataSet.FieldByName('EMAIL').AsString := Trim(DtSrcTabela.DataSet.FieldByName('EMAIL').AsString)
    else
    begin
      TServiceMessage.ShowWarning('Restrinção: ' + aError);
      Abort;
    end;

  if (DtSrcTabela.DataSet.FieldByName('COMISSAO').AsCurrency < 0) or (DtSrcTabela.DataSet.FieldByName('COMISSAO').AsCurrency > 100) then
    TServiceMessage.ShowWarning('Favor informar um percentual válido de comissão!')
  else
    inherited;
end;

initialization
  FormFunction.RegisterForm('ViewVendedor', TViewVendedor);

end.
