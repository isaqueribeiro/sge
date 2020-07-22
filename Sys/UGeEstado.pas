unit UGeEstado;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeEstado = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    lblSiafi: TLabel;
    dbSiafi: TDBEdit;
    GrpBxTributacoes: TGroupBox;
    lblAliquotaICMS: TLabel;
    dbAliquotaICMS: TDBEdit;
    fdQryTabelaEST_COD: TSmallintField;
    fdQryTabelaEST_NOME: TStringField;
    fdQryTabelaEST_SIGLA: TStringField;
    fdQryTabelaEST_SIAFI: TIntegerField;
    lblAliquotaFCP: TLabel;
    dbAliquotaFCP: TDBEdit;
    fdQryTabelaALIQUOTA_ICMS: TFMTBCDField;
    fdQryTabelaALIQUOTA_FCP: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarRegistro(var Codigo : Integer; var Descricao, UF : String) : Boolean; overload;
  end;

(*
  Tabelas:
  - TBESTADO

  Views:

  Procedures:

*)

var
  frmGeEstado: TfrmGeEstado;

  procedure MostrarTabelaEstados(const AOwner : TComponent);
  function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome, UF : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UGrPadrao, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaEstados(const AOwner : TComponent);
var
  frm : TfrmGeEstado;
begin
  frm := TfrmGeEstado.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeEstado;
begin
  frm := TfrmGeEstado.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarEstado(const AOwner : TComponent; var Codigo : Integer; var Nome, UF : String) : Boolean;
var
  frm : TfrmGeEstado;
begin
  frm := TfrmGeEstado.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome, UF);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeEstado.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EST_SIGLA').Clear;
    FieldByName('EST_SIAFI').Clear;
    FieldByName('ALIQUOTA_ICMS').Clear;
    FieldByName('ALIQUOTA_FCP').Clear;
  end;
end;

procedure TfrmGeEstado.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_ESTADO_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '00';

  CampoCodigo     := 'est_cod';
  CampoDescricao  := 'est_nome';
  CampoOrdenacao  := 'est_nome';

  Tabela
    .Display('est_cod', 'Código', '00', TAlignment.taCenter)
    .Display('est_nome', 'Nome')
    .Display('est_sigla', 'Sigla')
    .Display('aliquota_icms', '% Aliquota ICMS', ',0.00#', TAlignment.taRightJustify)
    .Display('aliquota_fcp', '% Aliquota FCP', ',0.00#', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );

  AbrirTabelaAuto := True;
end;

function TfrmGeEstado.SelecionarRegistro(var Codigo: Integer;
  var Descricao, UF: String): Boolean;
begin
  try
    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not DtSrcTabela.DataSet.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := DtSrcTabela.DataSet.FieldByName('est_cod').AsInteger;
      Descricao := DtSrcTabela.DataSet.FieldByName('est_nome').AsString;
      UF        := DtSrcTabela.DataSet.FieldByName('est_sigla').AsString;
    end
    else
    begin
      Codigo    := 0;
      Descricao := EmptyStr;
      UF        := EmptyStr;
    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeEstado', TfrmGeEstado);

end.
