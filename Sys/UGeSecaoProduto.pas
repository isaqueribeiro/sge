unit UGeSecaoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeSecaoProduto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaSCP_COD: TSmallintField;
    IbDtstTabelaSCP_DESCRICAO: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeSecaoProduto: TfrmGeSecaoProduto;

  procedure MostrarTabelaSecaoProdutos(const AOwner : TComponent);
  function SelecionarSecaoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure MostrarTabelaSecaoProdutos(const AOwner : TComponent);
var
  frm : TfrmGeSecaoProduto;
begin
  frm := TfrmGeSecaoProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarSecaoProduto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeSecaoProduto;
begin
  frm := TfrmGeSecaoProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeSecaoProduto.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBSECAOPROD';
  CampoCodigo    := 'SCP_COD';
  CampoDescricao := 'SCP_DESCRICAO';

  UpdateGenerator;
end;

initialization
  FormFunction.RegisterForm('frmGeSecaoProduto', TfrmGeSecaoProduto);

end.
