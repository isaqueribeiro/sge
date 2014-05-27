unit UGeBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, DB, IBCustomDataSet, ImgList, IBUpdateSQL,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, rxToolEdit, RXDBCtrl;

type
  TfrmGeBairro = class(TfrmGrPadraoCadastro)
    IbDtstTabelaBAI_COD: TIntegerField;
    IbDtstTabelaBAI_NOME: TIBStringField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaDIS_COD: TSmallintField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaDIS_NOME: TIBStringField;
    lblCidade: TLabel;
    dbCidade: TRxDBComboEdit;
    lblDistrito: TLabel;
    dbDistrito: TRxDBComboEdit;
    lblNome: TLabel;
    dbNome: TDBEdit;
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

var
  frmGeBairro: TfrmGeBairro;

  procedure MostrarTabelaBairros(const AOwner : TComponent);
  function SelecionarBairro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarBairro(const AOwner : TComponent; const Cidade : Integer; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UGeCidade, UGeDistrito, UConstantesDGE;

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

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + whr);
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
  CampoCodigo    := 'bai_cod';
  CampoDescricao := 'bai_nome';

  UpdateGenerator;
end;

procedure TfrmGeBairro.dbCidadeButtonClick(Sender: TObject);
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

procedure TfrmGeBairro.dbDistritoButtonClick(Sender: TObject);
var
  iDistrito : Integer;
  sDistrito : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarDistrito(Self, iDistrito, sDistrito) ) then
    begin
      IbDtstTabelaDIS_COD.AsInteger := iDistrito;
      IbDtstTabelaDIS_NOME.AsString := sDistrito;
    end;
end;

procedure TfrmGeBairro.IbDtstTabelaNewRecord(DataSet: TDataSet);
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

initialization
  FormFunction.RegisterForm('frmGeBairro', TfrmGeBairro);

end.
