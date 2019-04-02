unit UGeFabricante;

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
  TfrmGeFabricante = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    fdQryTabelaCOD: TIntegerField;
    fdQryTabelaNOME: TStringField;
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
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaFabricantes(const AOwner : TComponent);
var
  frm : TfrmGeFabricante;
begin
  frm := TfrmGeFabricante.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFabricante(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeFabricante;
begin
  frm := TfrmGeFabricante.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFabricante.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_FABRI_PROD_ID;
  ControlFirstEdit := dbNome;
  
  DisplayFormatCodigo := '000';
  AbrirTabelaAuto     := True;

  NomeTabela     := 'TBFABRICANTE';
  CampoCodigo    := 'f.COD';
  CampoDescricao := 'f.NOME';
  CampoOrdenacao := 'f.NOME';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeFabricante', TfrmGeFabricante);

end.
