unit View.Cidade;

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
  JvExMask,
  JvToolEdit,
  JvDBControls,
  View.PadraoCadastro;

type
  TViewCidade = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblBGE: TLabel;
    dbIBGE: TDBEdit;
    lblSIAFI: TLabel;
    dbSIAFI: TDBEdit;
    lblEstado: TLabel;
    lblDDD: TLabel;
    dbDDD: TDBEdit;
    lblCEPInicial: TLabel;
    dbCEPInicial: TDBEdit;
    lblCEPFinal: TLabel;
    dbCEPFinal: TDBEdit;
    GrpBxCustosOper: TGroupBox;
    dbCustoOperacional: TDBCheckBox;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblOutros: TLabel;
    dbOutros: TDBEdit;
    Bevel5: TBevel;
    dbEstado: TJvDBComboEdit;
    lblCustosOpereracional: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure pgcGuiasChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCIDADE
  - TBESTADO

  Views:

  Procedures:

*)

var
  ViewCidade: TViewCidade;

  procedure MostrarTabelaCidades(const AOwner : TComponent);

  function SelecionarCidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCidade(const AOwner : TComponent; const Estado : Smallint; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness,
  UDMRecursos,
  View.Estado,
  UGrPadrao,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaCidades(const AOwner : TComponent);
var
  frm : TViewCidade;
begin
  frm := TViewCidade.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewCidade;
begin
  frm := TViewCidade.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCidade(const AOwner : TComponent; const Estado : Smallint; var Codigo : Integer; var Nome : String) : Boolean; overload;
var
  frm : TViewCidade;
  whr : String;
begin
  frm := TViewCidade.Create(AOwner);
  try
    frm.DtSrcTabela.DataSet.Close;

    whr := 'c.est_cod = ' + IntToStr(Estado);

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);
  finally
    frm.Destroy;
  end;
end;

procedure TViewCidade.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Cidade;

  inherited;
  RotinaID         := ROTINA_CAD_CIDADE_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '0000';

  NomeTabela     := 'TBCIDADE';
  CampoCodigo    := 'c.cid_cod';
  CampoDescricao := 'c.cid_nome';
  CampoOrdenacao := 'c.cid_nome';


  Tabela
    .Display('cid_cod',  'Código', DisplayFormatCodigo, TAlignment.taCenter)
    .Display('cid_nome', 'Nome', True)
    .Display('Cid_ibge', 'IBGE', True)
    .Display('est_cod',  'Estado', True)
    .Display('Custo_oper_frete',  'Frete',  ',0.00#', TAlignment.taRightJustify)
    .Display('Custo_oper_outros', 'Outros', ',0.00#', TAlignment.taRightJustify);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);

  GrpBxCustosOper.Enabled        := GetCalcularCustoOperEmpresa(gUsuarioLogado.Empresa);
  lblCustosOpereracional.Visible := not GrpBxCustosOper.Enabled;
end;

procedure TViewCidade.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarEstado(Self, iEstado, sEstado) ) then
      begin
        FieldByName('EST_COD').AsInteger := iEstado;
        FieldByName('EST_NOME').AsString := sEstado;
      end;
  end;
end;

procedure TViewCidade.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( Field = FieldByName('CUSTO_OPER_PERCENTUAL') ) then
      if ( FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger = 1 ) then
      begin
        lblFrete.Caption  := 'Frete (%):';
        lblOutros.Caption := 'Outros (%):';
      end
      else
      begin
        lblFrete.Caption  := 'Frete (R$):';
        lblOutros.Caption := 'Outros (R$):';
      end;
  end;
end;

procedure TViewCidade.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    DtSrcTabelaDataChange(FieldByName('CUSTO_OPER_PERCENTUAL'), FieldByName('CUSTO_OPER_PERCENTUAL'));
end;

procedure TViewCidade.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (GetEstadoIDDefault > 0) and (DtSrcTabela.DataSet.State in [TDataSetState.dsInsert, TDataSetState.dsEdit])  then
  begin
    DtSrcTabela.DataSet.FieldByName('EST_COD').AsInteger := GetEstadoIDDefault;
    DtSrcTabela.DataSet.FieldByName('EST_NOME').AsString := GetEstadoNomeDefault;
  end;
end;

procedure TViewCidade.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger = 1 ) then
    begin
      if ((FieldByName('CUSTO_OPER_FRETE').AsCurrency < 0) or (FieldByName('CUSTO_OPER_FRETE').AsCurrency > 100)) then
      begin
        ShowWarning('Percentual de custo operacional para "Frete" inválido!');
        Exit;
      end;

      if ((FieldByName('CUSTO_OPER_OUTROS').AsCurrency < 0) or (FieldByName('CUSTO_OPER_OUTROS').AsCurrency > 100)) then
      begin
        ShowWarning('Percentual de custo operacional para "Outros" inválido!');
        Exit;
      end;
    end;

    if FieldByName('CUSTO_OPER_PERCENTUAL').IsNull then
      FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger := 1;
  end;

  inherited;
end;

procedure TViewCidade.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (not btbtnAlterar.Enabled) then
      if FieldByName('CUSTO_OPER_PERCENTUAL').IsNull then
        FieldByName('CUSTO_OPER_PERCENTUAL').AsInteger := 1;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewCidade', TViewCidade);

end.
