unit UGeTipoLogradouro;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeTipoLogradouro = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    fdQryTabelaTLG_COD: TSmallintField;
    fdQryTabelaTLG_DESCRICAO: TStringField;
    fdQryTabelaTLG_SIGLA: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBTIPO_LOGRADOURO

  Views:

  Procedures:

*)

var
  frmGeTipoLogradouro: TfrmGeTipoLogradouro;

  procedure MostrarTabelaTiposLogradouros(const AOwner : TComponent);

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaTiposLogradouros(const AOwner : TComponent);
var
  frm : TfrmGeTipoLogradouro;
begin
  frm := TfrmGeTipoLogradouro.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTipoLogradouro.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_TIPO_LOG_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '00';
  CampoCodigo    := 'tlg_cod';
  CampoDescricao := 'tlg_descricao';
  CampoOrdenacao := 'tlg_descricao';
end;

initialization
  FormFunction.RegisterForm('frmGeTipoLogradouro', TfrmGeTipoLogradouro);

end.
