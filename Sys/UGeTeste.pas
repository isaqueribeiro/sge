unit UGeTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeTeste = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaNOME: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeTeste: TfrmGeTeste;

  procedure MostrarTabelaTeste(const AOwner : TComponent);

implementation

uses UDMBusiness;

{$R *.dfm}

procedure MostrarTabelaTeste(const AOwner : TComponent);
var
  frm : TfrmGeTeste;
begin
  frm := TfrmGeTeste.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTeste.FormCreate(Sender: TObject);
begin
  inherited;
  DisplayFormatCodigo := '000';
  NomeTabela     := 'TB_TESTE';
  CampoCodigo    := 'CODIGO';
  CampoDescricao := 'NOME';

  UpdateGenerator;
end;

end.
