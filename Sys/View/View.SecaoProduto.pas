unit View.SecaoProduto;

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
  TViewSecaoProduto = class(TViewPadraoCadastro)
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
  - TBSECAOPROD

  Views:

  Procedures:

*)

var
  ViewSecaoProduto: TViewSecaoProduto;

  procedure MostrarTabelaSecaoProdutos(const AOwner : TComponent);
  function SelecionarSecaoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaSecaoProdutos(const AOwner : TComponent);
var
  frm : TViewSecaoProduto;
begin
  frm := TViewSecaoProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarSecaoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewSecaoProduto;
begin
  frm := TViewSecaoProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewSecaoProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.SecaoProduto;
  inherited;
  RotinaID         := ROTINA_CAD_SECAO_PROD_ID;
  ControlFirstEdit := dbNome;
  Self.Caption     := 'Tabela de Seções de ' + StrDescricaoProduto;

  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBSECAOPROD';
  CampoCodigo    := 's.SCP_COD';
  CampoDescricao := 's.SCP_DESCRICAO';
  CampoOrdenacao := 's.SCP_DESCRICAO';

  Tabela
    .Display('SCP_COD', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('SCP_DESCRICAO', 'Descrição', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

initialization
  FormFunction.RegisterForm('ViewSecaoProduto', TViewSecaoProduto);

end.
