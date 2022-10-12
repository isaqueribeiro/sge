unit SGE.View.Produto.CatalogoOnline;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,

  Winapi.Windows,
  Winapi.Messages,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,

  dxGDIPlusClasses;

type
  TViewProdutoCatalogoOnline = class(TForm)
    PanelContent: TPanel;
    PanelHeader: TPanel;
    PanelBody: TPanel;
    lblTitle: TLabel;
    imgBlueSoft: TImage;
    Label2: TLabel;
    lblDescription: TLabel;
    PanelFooter: TPanel;
    btnCongiguracoes: TButton;
    pnlPesquisa: TPanel;
    edtPesquisa: TEdit;
    lblPesquisa: TLabel;
    btnPesquisar: TButton;
    procedure edtPesquisaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewProdutoCatalogoOnline: TViewProdutoCatalogoOnline;

implementation

{$R *.dfm}

procedure TViewProdutoCatalogoOnline.edtPesquisaEnter(Sender: TObject);
begin
  lblPesquisa.Visible := edtPesquisa.Focused;
end;

procedure TViewProdutoCatalogoOnline.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

end.
