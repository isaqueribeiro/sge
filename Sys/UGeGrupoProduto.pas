unit UGeGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeGrupoProduto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaDESCRI: TIBStringField;
    lblComissao: TLabel;
    dbComissao: TDBEdit;
    IbDtstTabelaPERC_VENDA_COMISSAO: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeGrupoProduto: TfrmGeGrupoProduto;

  procedure MostrarTabelaGrupoProdutos(const AOwner : TComponent);
  function SelecionarGrupoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UDMRecursos;

{$R *.dfm}

procedure MostrarTabelaGrupoProdutos(const AOwner : TComponent);
var
  frm : TfrmGeGrupoProduto;
begin
  frm := TfrmGeGrupoProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarGrupoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeGrupoProduto;
begin
  frm := TfrmGeGrupoProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeGrupoProduto.btbtnSalvarClick(Sender: TObject);
begin
  if (IbDtstTabelaPERC_VENDA_COMISSAO.AsCurrency < 0) or (IbDtstTabelaPERC_VENDA_COMISSAO.AsCurrency > 100) then
    ShowWarning('Favor informar um percentual válido de comissão!')
  else
    inherited;
end;

procedure TfrmGeGrupoProduto.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_GRUPO_PROD_ID;
  ControlFirstEdit := dbNome;
  Self.Caption     := 'Tabela de Grupos de ' + StrDescricaoProduto;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBGRUPOPROD';
  CampoCodigo    := 'COD';
  CampoDescricao := 'DESCRI';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeGrupoProduto', TfrmGeGrupoProduto);

end.
