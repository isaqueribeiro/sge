unit View.GrupoProduto;

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
  TViewGrupoProduto = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblComissao: TLabel;
    dbComissao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBGRUPOPROD

  Views:

  Procedures:

*)

var
  ViewGrupoProduto: TViewGrupoProduto;

  procedure MostrarTabelaGrupoProdutos(const AOwner : TComponent);
  function SelecionarGrupoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UDMRecursos,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaGrupoProdutos(const AOwner : TComponent);
var
  frm : TViewGrupoProduto;
begin
  frm := TViewGrupoProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarGrupoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewGrupoProduto;
begin
  frm := TViewGrupoProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewGrupoProduto.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('PERC_VENDA_COMISSAO').AsCurrency < 0) or (FieldByName('PERC_VENDA_COMISSAO').AsCurrency > 100) then
      ShowWarning('Favor informar um percentual válido de comissão!')
    else
      inherited;
  end;
end;

procedure TViewGrupoProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.GrupoProduto;
  inherited;
  RotinaID         := ROTINA_CAD_GRUPO_PROD_ID;
  ControlFirstEdit := dbNome;
  Self.Caption     := 'Tabela de Grupos de ' + StrDescricaoProduto;

  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBGRUPOPROD';
  CampoCodigo    := 'g.COD';
  CampoDescricao := 'g.DESCRI';
  CampoOrdenacao := 'g.DESCRI';

  Tabela
    .Display('COD', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('DESCRI', 'Descrição', True)
    .Display('PERC_VENDA_COMISSAO', '% Comissão', ',0.00', TAlignment.taRightJustify, False);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

initialization
  FormFunction.RegisterForm('ViewGrupoProduto', TViewGrupoProduto);

end.
