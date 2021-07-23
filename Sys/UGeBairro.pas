unit UGeBairro;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, ImgList, IBUpdateSQL, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, JvDBControls,
  cxLookAndFeelPainters, Menus, cxButtons, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeBairro = class(TfrmGrPadraoCadastro)
    lblCidade: TLabel;
    lblDistrito: TLabel;
    lblNome: TLabel;
    dbNome: TDBEdit;
    dbCidade: TJvDBComboEdit;
    dbDistrito: TJvDBComboEdit;
    fdQryTabelaBAI_COD: TIntegerField;
    fdQryTabelaBAI_NOME: TStringField;
    fdQryTabelaCID_COD: TIntegerField;
    fdQryTabelaDIS_COD: TSmallintField;
    fdQryTabelaCID_NOME: TStringField;
    fdQryTabelaDIS_NOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbDistritoButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    fCidade : Integer;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBBAIRRO
  - TBCIDADE
  - TBESTADO
  - TBDISTRITO

  Views:

  Procedures:

*)

var
  frmGeBairro: TfrmGeBairro;

  procedure MostrarTabelaBairros(const AOwner : TComponent);
  function SelecionarBairro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarBairro(const AOwner : TComponent; const Cidade : Integer; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness, View.Cidade, View.Distrito, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaBairros(const AOwner : TComponent);
var
  frm : TfrmGeBairro;
begin
  frm := TfrmGeBairro.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarBairro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeBairro;
begin
  frm := TfrmGeBairro.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarBairro(const AOwner : TComponent; const Cidade : Integer; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeBairro;
  whr : String;
begin
  frm := TfrmGeBairro.Create(AOwner);
  try
    frm.fCidade := Cidade;

    whr := 'b.cid_cod = ' + IntToStr(Cidade);

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + whr);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeBairro.FormCreate(Sender: TObject);
begin
  inherited;
  fCidade := 0;

  RotinaID         := ROTINA_CAD_BAIRRO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBBAIRRO';
  CampoCodigo    := 'b.bai_cod';
  CampoDescricao := 'b.bai_nome';
  CampoOrdenacao := 'b.bai_nome';

  UpdateGenerator;
end;

procedure TfrmGeBairro.dbCidadeButtonClick(Sender: TObject);
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

procedure TfrmGeBairro.dbDistritoButtonClick(Sender: TObject);
var
  iDistrito : Integer;
  sDistrito : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( SelecionarDistrito(Self, iDistrito, sDistrito) ) then
      begin
        FieldByName('DIS_COD').AsInteger := iDistrito;
        FieldByName('DIS_NOME').AsString := sDistrito;
      end;
  end;
end;

procedure TfrmGeBairro.IbDtstTabelaNewRecord(DataSet: TDataSet);
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

initialization
  FormFunction.RegisterForm('frmGeBairro', TfrmGeBairro);

end.
