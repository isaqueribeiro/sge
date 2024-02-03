unit View.Query.Caixa.Conferencia;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Generics.Collections,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  cxGraphics,
  cxLookAndFeels,
  cxButtons,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,

  View.PadraoPesquisa,
  Model.Constantes,
  SGE.Controller.Interfaces;

type
  TViewQueryCaixaConferencia = class(TViewPadraoPesquisa)
    lblData: TLabel;
    e1Data: TJvDateEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FControllerCaixa : IControllerCaixa;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
    System.DateUtils
  , UDMRecursos
  , UConstantesDGE
  , Service.Message
  , SGE.Controller
  , SGE.Controller.Helper
  , SGE.Controller.Factory
  , SGE.Controller.Query.Factory
  , Controller.Tabela;

procedure TViewQueryCaixaConferencia.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_ESCAPE) then
    Self.Close
end;

initialization
  FormFunction.RegisterForm('ViewQueryCaixaConferencia', TViewQueryCaixaConferencia);

end.
