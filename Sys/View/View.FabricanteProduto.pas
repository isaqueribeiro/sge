unit View.FabricanteProduto;

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
  UObserverInterface,
  UCliente,
  UGrPadraoCadastro,
  Interacao.Tabela;

type
  TViewFabricanteProduto = class(TViewPadraoCadastro)
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
  - TBFABRICANTE

  Views:

  Procedures:

*)

  procedure MostrarTabelaFabricantes(const AOwner : TComponent);
  function SelecionarFabricante(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMRecursos,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaFabricantes(const AOwner : TComponent);
var
  frm : TViewFabricanteProduto;
begin
  frm := TViewFabricanteProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFabricante(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewFabricanteProduto;
begin
  frm := TViewFabricanteProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewFabricanteProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.FabricanteProduto;
  inherited;
  RotinaID         := ROTINA_CAD_FABRI_PROD_ID;
  ControlFirstEdit := dbNome;
  
  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBFABRICANTE';
  CampoCodigo    := 'f.COD';
  CampoDescricao := 'f.NOME';
  CampoOrdenacao := 'f.NOME';

  Tabela
    .Display('COD',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('NOME', 'Descrição', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

initialization
  FormFunction.RegisterForm('ViewFabricanteProduto', TViewFabricanteProduto);

end.
