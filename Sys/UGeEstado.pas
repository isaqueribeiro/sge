unit UGeEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeEstado = class(TfrmGrPadraoCadastro)
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaEST_SIGLA: TIBStringField;
    IbDtstTabelaEST_SIAFI: TIntegerField;
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    lblSiafi: TLabel;
    dbSiafi: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelecionarRegistro(var Codigo : Integer; var Descricao, UF : String) : Boolean; overload;
  end;

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

procedure TfrmGeEstado.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_ESTADO_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '00';
  CampoCodigo    := 'est_cod';
  CampoDescricao := 'est_nome';
end;

function TfrmGeEstado.SelecionarRegistro(var Codigo: Integer;
  var Descricao, UF: String): Boolean;
begin
  try
    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not IbDtstTabela.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := IbDtstTabela.FieldByName('est_cod').AsInteger;
      Descricao := IbDtstTabela.FieldByName('est_nome').AsString;
      UF        := IbDtstTabela.FieldByName('est_sigla').AsString;
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
