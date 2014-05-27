unit UGrCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGrCidade = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaCID_SIAFI: TIntegerField;
    IbDtstTabelaCID_IBGE: TIntegerField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaEST_SIGLA: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrCidade: TfrmGrCidade;

  procedure MostrarTabelaCidades(const AOwner : TComponent);

implementation

uses UDMBusiness, UGeEstado;

{$R *.dfm}

procedure MostrarTabelaCidades(const AOwner : TComponent);
var
  frm : TfrmGrCidade;
begin
  frm := TfrmGrCidade.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGrCidade.FormCreate(Sender: TObject);
begin
  inherited;
  AbrirTabelaAuto := False;
  CampoCodigo     := 'cid_cod';
  CampoDescricao  := 'cid_nome';
end;

end.
