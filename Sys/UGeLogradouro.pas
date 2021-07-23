unit UGeLogradouro;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBQuery, IBTable, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, JvExMask,
  JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeLogradouro = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblTipo: TLabel;
    dtsTipo: TDataSource;
    dbTipo: TDBLookupComboBox;
    lblCidade: TLabel;
    dbCidade: TJvDBComboEdit;
    fdQryTipo: TFDQuery;
    fdQryTabelaLOG_COD: TIntegerField;
    fdQryTabelaLOG_NOME: TStringField;
    fdQryTabelaTLG_COD: TSmallintField;
    fdQryTabelaCID_COD: TIntegerField;
    fdQryTabelaLOGRADOURO: TStringField;
    fdQryTabelaCID_NOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    fCidade : Integer;
    function GetTipoSigla(const pCodigo : Integer) : String;
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
  UDMBusiness, View.Cidade, UGeTipoLogradouro, UConstantesDGE;

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

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      Tipo     := frm.fdQryTipo.FieldByName('TLG_COD').AsInteger;
      TipoDesc := frm.GetTipoSigla(Tipo);
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
  CampoCodigo    := 'l.log_cod';
  CampoDescricao := 'l.log_nome';
  CampoOrdenacao := '5'; // Logradouro
end;

function TfrmGeLogradouro.GetTipoSigla(const pCodigo: Integer): String;
var
  aTipo : String;
begin
  aTipo := EmptyStr;

  with fdQryTipo do
  begin
    if not Active then
      Open();

    if Locate('TLG_COD', pCodigo, []) then
    begin
      if ( Trim(FieldByName('TLG_SIGLA').AsString) <> EmptyStr ) then
        aTipo := FieldByName('TLG_SIGLA').AsString
      else
        aTipo := FieldByName('TLG_DESCRICAO').AsString;
    end;
  end;

  Result := Trim(aTipo);
end;

procedure TfrmGeLogradouro.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( fCidade > 0 ) then
    begin
      FieldByName('CID_COD').AsInteger := fCidade;
      FieldByName('CID_NOME').AsString := GetCidadeNome( fCidade );
    end
    else
    if ( GetCidadeIDDefault > 0 ) then
    begin
      FieldByName('CID_COD').AsInteger := GetCidadeIDDefault;
      FieldByName('CID_NOME').AsString := GetCidadeNomeDefault;
    end;
  end;
end;

procedure TfrmGeLogradouro.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarCidade(Self, iCidade, sCidade) ) then
      begin
        FieldByName('CID_COD').AsInteger := iCidade;
        FieldByName('CID_NOME').AsString := sCidade;
      end;
  end;
end;

procedure TfrmGeLogradouro.btbtnSalvarClick(Sender: TObject);
var
  aTipo : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      with DtSrcTabela.DataSet do
      begin
        aTipo := GetTipoSigla(FieldByName('TLG_COD').AsInteger);
        FieldByName('LOGRADOURO').AsString := Trim(aTipo + ' ' + dbNome.Text);
      end;
  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeLogradouro', TfrmGeLogradouro);

end.
