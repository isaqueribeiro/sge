unit UGeUnidade;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeUnidade = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    fdQryTabelaUNP_COD: TSmallintField;
    fdQryTabelaUNP_DESCRICAO: TStringField;
    fdQryTabelaUNP_SIGLA: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarRegistro(var Codigo : Integer; var Descricao, Sigla : String) : Boolean; overload;
  end;

(*
  Tabelas:
  - TBUNIDADEPROD

  Views:

  Procedures:

*)

var
  frmGeUnidade: TfrmGeUnidade;

  procedure MostrarTabelaUnidades(const AOwner : TComponent);
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome, Sigla : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaUnidades(const AOwner : TComponent);
var
  frm : TfrmGeUnidade;
begin
  frm := TfrmGeUnidade.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeUnidade;
begin
  frm := TfrmGeUnidade.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome, Sigla : String) : Boolean;
var
  frm : TfrmGeUnidade;
begin
  frm := TfrmGeUnidade.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome, Sigla);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeUnidade.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_UNIDA_PROD_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  AbrirTabelaAuto     := True;

  NomeTabela     := 'TBUNIDADEPROD';
  CampoCodigo    := 'u.UNP_COD';
  CampoDescricao := 'u.UNP_DESCRICAO';
  CampoOrdenacao := 'u.UNP_DESCRICAO';

  UpdateGenerator;
end;

function TfrmGeUnidade.SelecionarRegistro(var Codigo: Integer;
  var Descricao, Sigla: String): Boolean;
begin
  try
    with DtSrcTabela.DataSet do
    begin
      Self.btbtnSelecionar.Visible := True;

      Result := (ShowModal = mrOk) and (not IsEmpty);

      if ( Result ) then
      begin
        Codigo    := FieldByName('UNP_COD').AsInteger;
        Descricao := FieldByName('UNP_DESCRICAO').AsString;
        Sigla     := FieldByName('UNP_SIGLA').AsString;
      end
      else
      begin
        Codigo    := 0;
        Descricao := EmptyStr;
        Sigla     := EmptyStr;
      end;
    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeUnidade', TfrmGeUnidade);

end.
