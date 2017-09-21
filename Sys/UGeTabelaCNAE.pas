unit UGeTabelaCNAE;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, Provider, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeTabelaCNAE = class(TfrmGrPadraoCadastro)
    lblDescricaoResumida: TLabel;
    dbDescricaoResumida: TDBEdit;
    lblNotaExplicativa: TLabel;
    dbNotaExplicativa: TDBMemo;
    GrpBxParametros: TGroupBox;
    dbAtivo: TDBCheckBox;
    lblDescricaoCompleta: TLabel;
    dbDescricaoCompleta: TDBEdit;
    dbObrigaInscEstadual: TDBCheckBox;
    IbDtstTabelaCODIGO: TIBStringField;
    IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField;
    IbDtstTabelaDESCRICAO_COMPLETA: TIBStringField;
    IbDtstTabelaNOTA_EXPLICATIVA: TMemoField;
    IbDtstTabelaOBRIGA_INSC_ESTADUAL: TSmallintField;
    IbDtstTabelaATIVA: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCNAE

  Views:

  Procedures:

*)

var
  frmGeTabelaCNAE: TfrmGeTabelaCNAE;

  function SelecionarCNAE(const AOwner : TComponent; var Codigo, Descricao : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

function SelecionarCNAE(const AOwner : TComponent; var Codigo, Descricao : String) : Boolean;
var
  frm : TfrmGeTabelaCNAE;
begin
  frm := TfrmGeTabelaCNAE.Create(AOwner);
  try
    frm.AbrirTabelaAuto := True;
    Result := frm.SelecionarRegistro(Codigo, Descricao);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTabelaCNAE.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_CNAE_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  AbrirTabelaAuto     := True;

  NomeTabela     := 'TBCNAE';
  CampoCodigo    := 'CODIGO';
  CampoDescricao := 'DESCRICAO_RESUMIDA';
end;

procedure TfrmGeTabelaCNAE.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaATIVA.AsInteger                := 1;
  IbDtstTabelaOBRIGA_INSC_ESTADUAL.AsInteger := 0;
  IbDtstTabelaCODIGO.Clear;
  IbDtstTabelaDESCRICAO_RESUMIDA.Clear;
  IbDtstTabelaDESCRICAO_COMPLETA.Clear;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaCNAE', TfrmGeTabelaCNAE);

end.
