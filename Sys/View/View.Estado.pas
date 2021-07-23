unit View.Estado;

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
  View.PadraoCadastro;

type
  TViewEstado = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    lblSiafi: TLabel;
    dbSiafi: TDBEdit;
    GrpBxTributacoes: TGroupBox;
    lblAliquotaICMS: TLabel;
    dbAliquotaICMS: TDBEdit;
    lblAliquotaFCP: TLabel;
    dbAliquotaFCP: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarRegistro(var Codigo : Integer; var Descricao, UF : String) : Boolean; overload;
  end;

(*
  Tabelas:
  - TBESTADO

  Views:

  Procedures:

*)

var
  ViewEstado: TViewEstado;

  procedure MostrarTabelaEstados(const AOwner : TComponent);
  function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome, UF : String) : Boolean; overload;

implementation

uses
  UDMBusiness,
  UGrPadrao,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaEstados(const AOwner : TComponent);
var
  frm : TViewEstado;
begin
  frm := TViewEstado.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewEstado;
begin
  frm := TViewEstado.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome, UF : String) : Boolean;
var
  frm : TViewEstado;
begin
  frm := TViewEstado.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome, UF);
  finally
    frm.Destroy;
  end;
end;

procedure TViewEstado.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.UF;

  inherited;
  RotinaID         := ROTINA_CAD_ESTADO_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '00';

  CampoCodigo     := 'est_cod';
  CampoDescricao  := 'est_nome';
  CampoOrdenacao  := 'est_nome';

  Tabela
    .Display('est_cod', 'Código', DisplayFormatCodigo, TAlignment.taCenter)
    .Display('est_nome', 'Nome', True)
    .Display('est_sigla', 'Sigla', True)
    .Display('aliquota_icms', '% Aliquota ICMS', ',0.00#', TAlignment.taRightJustify)
    .Display('aliquota_fcp', '% Aliquota FCP', ',0.00#', TAlignment.taRightJustify);

  AbrirTabelaAuto := True;
end;

function TViewEstado.SelecionarRegistro(var Codigo: Integer;
  var Descricao, UF: String): Boolean;
begin
  try
    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not DtSrcTabela.DataSet.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := DtSrcTabela.DataSet.FieldByName('est_cod').AsInteger;
      Descricao := DtSrcTabela.DataSet.FieldByName('est_nome').AsString;
      UF        := DtSrcTabela.DataSet.FieldByName('est_sigla').AsString;
    end
    else
    begin
      Codigo    := 0;
      Descricao := EmptyStr;
      UF        := EmptyStr;
    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
  end;
end;

initialization
  FormFunction.RegisterForm('ViewEstado', TViewEstado);

end.
