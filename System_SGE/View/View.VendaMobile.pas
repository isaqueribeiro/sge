unit View.VendaMobile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.Buttons;

type
  TViewVendaMobile = class(TfrmGrPadrao)
    pnlTitle: TPanel;
    shpUsuario: TShape;
    pnlUsuario: TPanel;
    Label1: TLabel;
    lblUsuario: TLabel;
    Bevel1: TBevel;
    pnlNameApp: TPanel;
    pnlHora: TPanel;
    Bevel2: TBevel;
    lblHora: TLabel;
    pnlPrevisaoTempo: TPanel;
    Bevel3: TBevel;
    lblData: TLabel;
    lblCidade: TLabel;
    TmrContador: TTimer;
    Image1: TImage;
    Panel1: TPanel;
    btnConfigurar: TSpeedButton;
    btnSincronizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TmrContadorTimer(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  ViewVendaMobile: TViewVendaMobile;

implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness
  , Classe.PrevisaoTempo;

{ TViewVendaMobile }

procedure TViewVendaMobile.btnSincronizarClick(Sender: TObject);
begin
  lblCidade.Caption := TServicePrevisaoTempo.GetCidade('Ananindeua', 'PA').Nome;

end;

procedure TViewVendaMobile.FormCreate(Sender: TObject);
const
  MARGEM = 16;
begin
  inherited;
  Self.Left   := 0;
  Self.Top    := 156;
  Self.Width  := Application.MainForm.Width  - MARGEM;
  Self.Height := Application.MainForm.Height - Self.Top - MARGEM;
end;

procedure TViewVendaMobile.FormShow(Sender: TObject);
begin
  inherited;
  lblUsuario.Caption := StrFormatarNome(gUsuarioLogado.Nome);
end;

procedure TViewVendaMobile.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewVendaMobile.TmrContadorTimer(Sender: TObject);
begin
  inherited;
  lblData.Caption := FormatDateTime('dd/mm/yyyy', Date);
  lblHora.Caption := FormatDateTime('hh:mm', Time);
end;

initialization
  FormFunction.RegisterForm('ViewVendaMobile', TViewVendaMobile);

end.
