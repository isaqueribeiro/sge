unit View.Query.FornecedorCliente;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,

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

  Data.DB,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxButtons,

  View.PadraoPesquisa,
  Model.Constantes;

type
  TFornecedorCliente = record
    TipoEmissor : TTipoEmissorCheque;
    Codigo : Integer;
    Nome   ,
    Cnpj   : String
  end;

  TViewQueryFornecedorCliente = class(TViewPadraoPesquisa)
  private
    procedure FormCreate(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

  function SelecionarFornecedorCliente(const AOnwer : TComponent; var aRetorno : TFornecedorCliente) : Boolean;

implementation

{$R *.dfm}

uses
  SGE.Controller.Query.Factory;

function SelecionarFornecedorCliente(const AOnwer : TComponent; var aRetorno : TFornecedorCliente) : Boolean;
begin
  Result := False;
end;

procedure TViewQueryFornecedorCliente.FormCreate(Sender: TObject);
begin
  FController := TControllerQueryFactory.Instance.FornecedorCliente.DataSource(dtsPesquisa);
  inherited;
end;

end.
