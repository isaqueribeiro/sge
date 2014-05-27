unit UGeFabricante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeFabricante = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCOD: TIntegerField;
    IbDtstTabelaNOME: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure MostrarTabelaFabricantes(const AOwner : TComponent);
  function SelecionarFabricante(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness;

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
  ControlFirstEdit := dbNome;
  
  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBFABRICANTE';
  CampoCodigo    := 'COD';
  CampoDescricao := 'NOME';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeFabricante', TfrmGeFabricante);

end.
