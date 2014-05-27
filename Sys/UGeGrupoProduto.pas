unit UGeGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeGrupoProduto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaDESCRI: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeGrupoProduto: TfrmGeGrupoProduto;

  procedure MostrarTabelaGrupoProdutos(const AOwner : TComponent);
  function SelecionarGrupoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness;

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

procedure TfrmGeGrupoProduto.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBGRUPOPROD';
  CampoCodigo    := 'COD';
  CampoDescricao := 'DESCRI';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeGrupoProduto', TfrmGeGrupoProduto);

end.
