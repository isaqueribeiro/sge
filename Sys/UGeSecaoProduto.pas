unit UGeSecaoProduto;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeSecaoProduto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    fdQryTabelaSCP_COD: TSmallintField;
    fdQryTabelaSCP_DESCRICAO: TStringField;
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
  frmGeSecaoProduto: TfrmGeSecaoProduto;

  procedure MostrarTabelaSecaoProdutos(const AOwner : TComponent);
  function SelecionarSecaoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaSecaoProdutos(const AOwner : TComponent);
var
  frm : TfrmGeSecaoProduto;
begin
  frm := TfrmGeSecaoProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarSecaoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeSecaoProduto;
begin
  frm := TfrmGeSecaoProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeSecaoProduto.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_SECAO_PROD_ID;
  ControlFirstEdit := dbNome;
  Self.Caption     := 'Tabela de Seções de ' + StrDescricaoProduto;

  DisplayFormatCodigo := '000';
  AbrirTabelaAuto     := True;

  NomeTabela     := 'TBSECAOPROD';
  CampoCodigo    := 's.SCP_COD';
  CampoDescricao := 's.SCP_DESCRICAO';
  CampoOrdenacao := 's.SCP_DESCRICAO';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeSecaoProduto', TfrmGeSecaoProduto);

end.
