unit View.Distrito;

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
  TViewDistrito = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBDISTRITO

  Views:

  Procedures:

*)

var
  ViewDistrito: TViewDistrito;

  procedure MostrarTabelaDistritos(const AOwner : TComponent);
  function SelecionarDistrito(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UDMRecursos,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaDistritos(const AOwner : TComponent);
var
  frm : TViewDistrito;
begin
  frm := TViewDistrito.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarDistrito(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewDistrito;
  whr : String;
begin
  frm := TViewDistrito.Create(AOwner);
  try
    whr := '(trim(coalesce(d.Dis_nome, ' + QuotedStr('') + ')) != ' + QuotedStr('') + ')';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);
  finally
    frm.Destroy;
  end;
end;

procedure TViewDistrito.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Distrito;

  inherited;
  RotinaID         := ROTINA_CAD_DISTRITO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela      := 'TBDISTRITO';
  CampoCodigo     := 'dis_cod';
  CampoDescricao  := 'dis_nome';
  CampoOrdenacao  := 'dis_nome';
  WhereAdditional := '(trim(coalesce(d.Dis_nome, ' + QuotedStr('') + ')) != ' + QuotedStr('') + ')';

  Tabela
    .Display('dis_nome', 'Nome', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

initialization
  FormFunction.RegisterForm('ViewDistrito', TViewDistrito);

end.
