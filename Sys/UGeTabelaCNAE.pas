unit UGeTabelaCNAE;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, DBClient, Provider, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2007Green, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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
    fdQryTabelaCODIGO: TStringField;
    fdQryTabelaDESCRICAO_RESUMIDA: TStringField;
    fdQryTabelaDESCRICAO_COMPLETA: TStringField;
    fdQryTabelaNOTA_EXPLICATIVA: TMemoField;
    fdQryTabelaOBRIGA_INSC_ESTADUAL: TSmallintField;
    fdQryTabelaATIVA: TSmallintField;
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
  UDMRecursos, UDMBusiness, UConstantesDGE;

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
  CampoCodigo    := 'c.CODIGO';
  CampoDescricao := 'c.DESCRICAO_RESUMIDA';
  CampoOrdenacao := 'c.DESCRICAO_RESUMIDA';
end;

procedure TfrmGeTabelaCNAE.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('ATIVA').AsInteger                := 1;
    FieldByName('OBRIGA_INSC_ESTADUAL').AsInteger := 0;
    FieldByName('CODIGO').Clear;
    FieldByName('DESCRICAO_RESUMIDA').Clear;
    FieldByName('DESCRICAO_COMPLETA').Clear;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeTabelaCNAE', TfrmGeTabelaCNAE);

end.
