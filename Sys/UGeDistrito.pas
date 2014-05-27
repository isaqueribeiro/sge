unit UGeDistrito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, DB, IBCustomDataSet, ImgList, IBUpdateSQL,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeDistrito = class(TfrmGrPadraoCadastro)
    IbDtstTabelaDIS_COD: TSmallintField;
    IbDtstTabelaDIS_NOME: TIBStringField;
    lblNome: TLabel;
    dbNome: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

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
  NomeTabela     := 'TBDISTRITO';
  CampoCodigo    := 'dis_cod';
  CampoDescricao := 'dis_nome';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeDistrito', TfrmGeDistrito);

end.
