unit UGeDistrito;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ImgList, IBUpdateSQL, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeDistrito = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    fdQryTabelaDIS_COD: TSmallintField;
    fdQryTabelaDIS_NOME: TStringField;
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
  frmGeDistrito: TfrmGeDistrito;

  procedure MostrarTabelaDistritos(const AOwner : TComponent);
  function SelecionarDistrito(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaDistritos(const AOwner : TComponent);
var
  frm : TfrmGeDistrito;
begin
  frm := TfrmGeDistrito.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarDistrito(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeDistrito;
begin
  frm := TfrmGeDistrito.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeDistrito.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_DISTRITO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela      := 'TBDISTRITO';
  CampoCodigo     := 'dis_cod';
  CampoDescricao  := 'dis_nome';
  CampoOrdenacao  := 'dis_nome';
  WhereAdditional := '(trim(d.Dis_nome) <> ' + QuotedStr('') +  ')';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeDistrito', TfrmGeDistrito);

end.
