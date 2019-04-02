unit UGeGrupoProduto;

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
  TfrmGeGrupoProduto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblComissao: TLabel;
    dbComissao: TDBEdit;
    fdQryTabelaCOD: TSmallintField;
    fdQryTabelaDESCRI: TStringField;
    fdQryTabelaPERC_VENDA_COMISSAO: TBCDField;
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
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('PERC_VENDA_COMISSAO').AsCurrency < 0) or (FieldByName('PERC_VENDA_COMISSAO').AsCurrency > 100) then
      ShowWarning('Favor informar um percentual válido de comissão!')
    else
      inherited;
  end;
end;

procedure TfrmGeGrupoProduto.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_GRUPO_PROD_ID;
  ControlFirstEdit := dbNome;
  Self.Caption     := 'Tabela de Grupos de ' + StrDescricaoProduto;

  DisplayFormatCodigo := '000';
  AbrirTabelaAuto     := True;

  NomeTabela     := 'TBGRUPOPROD';
  CampoCodigo    := 'g.COD';
  CampoDescricao := 'g.DESCRI';
  CampoOrdenacao := 'g.DESCRI';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeGrupoProduto', TfrmGeGrupoProduto);

end.
