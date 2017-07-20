unit UGeLogradouro;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, dblookup, IBQuery, IBTable, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, JvExMask,
  JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeLogradouro = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblTipo: TLabel;
    dtsTipo: TDataSource;
    dbTipo: TDBLookupComboBox;
    lblCidade: TLabel;
    IbDtstTabelaLOG_COD: TIntegerField;
    IbDtstTabelaLOG_NOME: TIBStringField;
    IbDtstTabelaTLG_COD: TSmallintField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    dbCidade: TJvDBComboEdit;
    fdQryTipo: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    fCidade : Integer;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBLOGRADOURO
  - TBTIPO_LOGRADOURO
  - TBCIDADE
  - TBESTADO

  Views:

  Procedures:

*)

var
  frmGeLogradouro: TfrmGeLogradouro;

  procedure MostrarTabelaLogradouros(const AOwner : TComponent);

  function SelecionarLogradouro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarLogradouro(const AOwner : TComponent; const Cidade : Integer; var Tipo : Smallint; var TipoDesc : String; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UGeCidade, UGeTipoLogradouro, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaLogradouros(const AOwner : TComponent);
var
  frm : TfrmGeLogradouro;
begin
  frm := TfrmGeLogradouro.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarLogradouro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeLogradouro;
begin
  frm := TfrmGeLogradouro.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarLogradouro(const AOwner : TComponent; const Cidade : Integer; var Tipo : Smallint; var TipoDesc : String; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeLogradouro;
  whr : String;
begin
  frm := TfrmGeLogradouro.Create(AOwner);
  try
    frm.fCidade := Cidade;

    whr := 'l.cid_cod = ' + IntToStr(Cidade);

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result and (frm.fdQryTipo.Locate('TLG_COD', frm.IbDtstTabelaTLG_COD.AsInteger, [])) ) then
    begin
      Tipo := frm.fdQryTipo.FieldByName('TLG_COD').AsInteger;
      if (Tipo = 0) then
        TipoDesc := EmptyStr
      else
      if ( Trim(frm.fdQryTipo.FieldByName('TLG_SIGLA').AsString) <> EmptyStr ) then
        TipoDesc := frm.fdQryTipo.FieldByName('TLG_SIGLA').AsString
      else
        TipoDesc := frm.fdQryTipo.FieldByName('TLG_DESCRICAO').AsString;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeLogradouro.FormCreate(Sender: TObject);
begin
  inherited;
  fCidade := 0;

  RotinaID         := ROTINA_CAD_LOGRADOURO_ID;
  ControlFirstEdit := dbTipo;

  CarregarLista(fdQryTipo);

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBLOGRADOURO';
  CampoCodigo    := 'log_cod';
  CampoDescricao := 'log_nome';

  UpdateGenerator;
end;

procedure TfrmGeLogradouro.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ( fCidade > 0 ) then
  begin
    IbDtstTabelaCID_COD.AsInteger := fCidade;
    IbDtstTabelaCID_NOME.AsString := GetCidadeNome( fCidade );
  end
  else
  if ( GetCidadeIDDefault > 0 ) then
  begin
    IbDtstTabelaCID_COD.AsInteger := GetCidadeIDDefault;
    IbDtstTabelaCID_NOME.AsString := GetCidadeNomeDefault;
  end;
end;

procedure TfrmGeLogradouro.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarCidade(Self, iCidade, sCidade) ) then
    begin
      IbDtstTabelaCID_COD.AsInteger := iCidade;
      IbDtstTabelaCID_NOME.AsString := sCidade;
    end;
end;

procedure TfrmGeLogradouro.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    IbDtstTabelaLOGRADOURO.AsString := Trim(dbTipo.Text + ' ' + dbNome.Text);
  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeLogradouro', TfrmGeLogradouro);

end.
