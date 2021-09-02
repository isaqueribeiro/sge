unit View.Logradouro;

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
  JvExMask,
  JvToolEdit,
  JvDBControls,
  View.PadraoCadastro,
  SGE.Controller.Interfaces;

type
  TViewLogradouro = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblTipo: TLabel;
    dtsTipo: TDataSource;
    dbTipo: TDBLookupComboBox;
    lblCidade: TLabel;
    dbCidade: TJvDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    fCidade : Integer;
    FControllerTipo : IControllerCustom;
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
  ViewLogradouro: TViewLogradouro;

  procedure MostrarTabelaLogradouros(const AOwner : TComponent);

  function SelecionarLogradouro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarLogradouro(const AOwner : TComponent; const Cidade : Integer; var Tipo : Smallint; var TipoDesc : String; var Codigo : Integer; var Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness,
  UDMRecursos,
  UConstantesDGE,
  View.Cidade,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

procedure MostrarTabelaLogradouros(const AOwner : TComponent);
var
  frm : TViewLogradouro;
begin
  frm := TViewLogradouro.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarLogradouro(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewLogradouro;
begin
  frm := TViewLogradouro.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarLogradouro(const AOwner : TComponent; const Cidade : Integer; var Tipo : Smallint; var TipoDesc : String; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewLogradouro;
  whr : String;
begin
  frm := TViewLogradouro.Create(AOwner);
  try
    frm.fCidade := Cidade;

    whr := 'l.cid_cod = ' + IntToStr(Cidade);

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, whr);

    if ( Result ) then
    begin
      Tipo     := frm.dtsTipo.DataSet.FieldByName('TLG_COD').AsInteger;
      TipoDesc := frm.GetTipoSigla(Tipo);
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TViewLogradouro.FormCreate(Sender: TObject);
begin
  FControllerTipo := TControllerFactory.New.TipoLogradouro;
  FController     := TControllerFactory.New.Logradouro;

  inherited;
  fCidade := 0;

  RotinaID         := ROTINA_CAD_LOGRADOURO_ID;
  ControlFirstEdit := dbTipo;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBLOGRADOURO';
  CampoCodigo    := 'l.log_cod';
  CampoDescricao := 'l.log_nome';
  CampoOrdenacao := '5'; // Logradouro

  Tabela
    .Display('Log_cod',  'Código', DisplayFormatCodigo, TAlignment.taCenter)
    .Display('Log_nome', 'Nome',   True)
    .Display('Tlg_cod',  'Tipo',   True)
    .Display('Cid_cod',  'Cidade', True);

  AbrirTabelaAuto := True;
  TController(FControllerTipo).LookupComboBox(dbTipo, dtsTipo, 'tlg_cod', 'tlg_cod', 'tlg_descricao');
end;

function TViewLogradouro.GetTipoSigla(const pCodigo: Integer): String;
var
  aTipo : String;
begin
  aTipo := EmptyStr;

  with dtsTipo.DataSet do
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

procedure TViewLogradouro.dbCidadeButtonClick(Sender: TObject);
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

procedure TViewLogradouro.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (DtSrcTabela.DataSet.State in [TDataSetState.dsInsert, TDataSetState.dsEdit])  then
  begin
    if ( fCidade > 0 ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CID_COD').AsInteger := fCidade;
      DtSrcTabela.DataSet.FieldByName('CID_NOME').AsString := GetCidadeNome( fCidade );
    end
    else
    if ( GetCidadeIDDefault > 0 ) then
    begin
      DtSrcTabela.DataSet.FieldByName('CID_COD').AsInteger := GetCidadeIDDefault;
      DtSrcTabela.DataSet.FieldByName('CID_NOME').AsString := GetCidadeNomeDefault;
    end;
  end;
end;

procedure TViewLogradouro.btbtnSalvarClick(Sender: TObject);
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
  FormFunction.RegisterForm('ViewLogradouro', TViewLogradouro);

end.
