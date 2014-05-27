unit UGeTipoLogradouro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

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
