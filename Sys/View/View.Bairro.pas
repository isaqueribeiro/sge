unit View.Bairro;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,
  JvToolEdit,
  JvExMask,
  JvDBControls,
  View.PadraoCadastro;

type
  TViewBairro = class(TViewPadraoCadastro)
    lblCidade: TLabel;
    lblDistrito: TLabel;
    lblNome: TLabel;
    dbNome: TDBEdit;
    dbCidade: TJvDBComboEdit;
    dbDistrito: TJvDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbDistritoButtonClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
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
  ViewBairro: TViewBairro;

  procedure MostrarTabelaBairros(const AOwner : TComponent);
  function SelecionarBairro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarBairro(const AOwner : TComponent; const Cidade : Integer; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness,
  UDMRecursos,
  UConstantesDGE,
  View.Cidade,
  View.Distrito,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaBairros(const AOwner : TComponent);
var
  frm : TViewBairro;
begin
  frm := TViewBairro.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarBairro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewBairro;
begin
  frm := TViewBairro.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarBairro(const AOwner : TComponent; const Cidade : Integer; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewBairro;
  whr : String;
begin
  frm := TViewBairro.Create(AOwner);
  try
    frm.fCidade := Cidade;

    whr := 'b.cid_cod = ' + IntToStr(Cidade);

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);
  finally
    frm.Destroy;
  end;
end;

procedure TViewBairro.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Bairro;

  inherited;
  fCidade := 0;

  RotinaID         := ROTINA_CAD_BAIRRO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBBAIRRO';
  CampoCodigo    := 'b.bai_cod';
  CampoDescricao := 'b.bai_nome';
  CampoOrdenacao := 'b.bai_nome';

  Tabela
    .Display('bai_cod',  'Código', DisplayFormatCodigo, TAlignment.taCenter)
    .Display('bai_nome', 'Nome', True)
    .Display('cid_cod',  'Cidade', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

procedure TViewBairro.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (fCidade > 0) and (DtSrcTabela.DataSet.State in [TDataSetState.dsInsert, TDataSetState.dsEdit]) then
  begin
    DtSrcTabela.DataSet.FieldByName('CID_COD').AsInteger := fCidade;
    DtSrcTabela.DataSet.FieldByName('CID_NOME').AsString := GetCidadeNome( fCidade );
  end
end;

procedure TViewBairro.dbCidadeButtonClick(Sender: TObject);
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

procedure TViewBairro.dbDistritoButtonClick(Sender: TObject);
var
  iDistrito : Integer;
  sDistrito : String;
begin
  if (DtSrcTabela.DataSet.State in [dsEdit, dsInsert] ) then
    if ( SelecionarDistrito(Self, iDistrito, sDistrito) ) then
    begin
      DtSrcTabela.DataSet.FieldByName('DIS_COD').AsInteger := iDistrito;
      DtSrcTabela.DataSet.FieldByName('DIS_NOME').AsString := sDistrito;
    end;
end;

initialization
  FormFunction.RegisterForm('ViewBairro', TViewBairro);

end.
