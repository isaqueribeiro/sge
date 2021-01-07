unit View.VendaMobile.Vendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TViewVendaMobileVendedor = class(TfrmGrPadrao)
    pnlContent: TPanel;
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    lblMenu: TLabel;
    lblEtata: TLabel;
    lblRotina: TLabel;
    pnlBody: TPanel;
    pnlMessage: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    pnlBtnClose: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InicializarComponentes;
    procedure IdentificarEtapa(AEtapa : Word);
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness
  , Classe.Gerenciador.View;

{ TViewVendaMobileVendedor }

procedure TViewVendaMobileVendedor.FormCreate(Sender: TObject);
begin
  inherited;
  InicializarComponentes;
  IdentificarEtapa( 0 );
end;

procedure TViewVendaMobileVendedor.IdentificarEtapa(AEtapa: Word);
begin
  case AEtapa of
    0 :
    begin
      lblRotina.Caption := EmptyStr;
      lblEtata.Caption  := 'Vendedores';
    end;
  end;
end;

procedure TViewVendaMobileVendedor.InicializarComponentes;
begin
  pnlMessage.Visible := False;

end;

procedure TViewVendaMobileVendedor.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  _GerenciadorView.RegistrarView('ViewVendaMobileVendedor', TViewVendaMobileVendedor);

end.
