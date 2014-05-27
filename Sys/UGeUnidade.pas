unit UGeUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeUnidade = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaUNP_COD: TSmallintField;
    IbDtstTabelaUNP_DESCRICAO: TIBStringField;
    IbDtstTabelaUNP_SIGLA: TIBStringField;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarRegistro(var Codigo : Integer; var Descricao, Sigla : String) : Boolean; overload;
  end;

var
  frmGeUnidade: TfrmGeUnidade;

  procedure MostrarTabelaUnidades(const AOwner : TComponent);
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome, Sigla : String) : Boolean; overload;

implementation

uses UDMBusiness;

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
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBUNIDADEPROD';
  CampoCodigo    := 'UNP_COD';
  CampoDescricao := 'UNP_DESCRICAO';

  UpdateGenerator;
end;

function TfrmGeUnidade.SelecionarRegistro(var Codigo: Integer;
  var Descricao, Sigla: String): Boolean;
begin
  try
    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not IbDtstTabela.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := IbDtstTabela.FieldByName('UNP_COD').AsInteger;
      Descricao := IbDtstTabela.FieldByName('UNP_DESCRICAO').AsString;
      Sigla     := IbDtstTabela.FieldByName('UNP_SIGLA').AsString;
    end
    else
    begin
      Codigo    := 0;
      Descricao := EmptyStr;
      Sigla     := EmptyStr;
    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeUnidade', TfrmGeUnidade);

end.
