unit View.TipoLogradouro;

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
  View.PadraoCadastro;

type
  TViewTipoLogradouro = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblSigla: TLabel;
    dbSigla: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBTIPO_LOGRADOURO

  Views:

  Procedures:

*)

var
  ViewTipoLogradouro: TViewTipoLogradouro;

  procedure MostrarTabelaTiposLogradouros(const AOwner : TComponent);

implementation

uses
  UDMRecursos,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaTiposLogradouros(const AOwner : TComponent);
var
  frm : TViewTipoLogradouro;
begin
  frm := TViewTipoLogradouro.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TViewTipoLogradouro.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.TipoLogradouro;

  inherited;
  RotinaID         := ROTINA_CAD_TIPO_LOG_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '00';
  CampoCodigo     := 'tlg_cod';
  CampoDescricao  := 'tlg_descricao';
  CampoOrdenacao  := 'tlg_descricao';
  WhereAdditional := FController.DAO.WhereAdditional;

  Tabela
    .Display('Tlg_cod',       'Código', DisplayFormatCodigo, TAlignment.taCenter)
    .Display('Tlg_descricao', 'Nome', True)
    .Display('Tlg_sigla',     'Sigla', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

initialization
  FormFunction.RegisterForm('ViewTipoLogradouro', TViewTipoLogradouro);

end.
