unit UGeTipoLogradouro;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeTipoLogradouro = class(TfrmGrPadraoCadastro)
    IbDtstTabelaTLG_COD: TSmallintField;
    IbDtstTabelaTLG_DESCRICAO: TIBStringField;
    IbDtstTabelaTLG_SIGLA: TIBStringField;
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
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
end;

initialization
  FormFunction.RegisterForm('frmGeTipoLogradouro', TfrmGeTipoLogradouro);

end.
