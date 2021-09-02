unit View.UnidadeProduto;

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
  Vcl.Dialogs,
  Vcl.ExtDlgs,

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UCliente,
  UGrPadraoCadastro,
  Interacao.Tabela;

type
  TViewUnidadeProduto = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
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
  ViewUnidadeProduto: TViewUnidadeProduto;

  procedure MostrarTabelaUnidades(const AOwner : TComponent);
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome, Sigla : String) : Boolean; overload;

implementation

uses
  UDMRecursos,
  UConstantesDGE,
  SGE.Controller.Factory,
  Service.Message;

{$R *.dfm}

procedure MostrarTabelaUnidades(const AOwner : TComponent);
var
  frm : TViewUnidadeProduto;
begin
  frm := TViewUnidadeProduto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewUnidadeProduto;
begin
  frm := TViewUnidadeProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarUnidade(const AOwner : TComponent; var Codigo : Integer; var Nome, Sigla : String) : Boolean;
var
  frm : TViewUnidadeProduto;
begin
  frm := TViewUnidadeProduto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome, Sigla);
  finally
    frm.Destroy;
  end;
end;

procedure TViewUnidadeProduto.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.UnidadeProduto;
  inherited;
  RotinaID         := ROTINA_CAD_UNIDA_PROD_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBUNIDADEPROD';
  CampoCodigo    := 'u.UNP_COD';
  CampoDescricao := 'u.UNP_DESCRICAO';
  CampoOrdenacao := 'u.UNP_DESCRICAO';

  Tabela
    .Display('UNP_COD',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('UNP_DESCRICAO', 'Descrição', True)
    .Display('UNP_SIGLA', 'Sigla', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

function TViewUnidadeProduto.SelecionarRegistro(var Codigo: Integer;
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
      TServiceMessage.ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
  end;
end;

initialization
  FormFunction.RegisterForm('ViewUnidadeProduto', TViewUnidadeProduto);

end.
