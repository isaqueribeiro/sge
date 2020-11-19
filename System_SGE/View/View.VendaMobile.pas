unit View.VendaMobile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses, Vcl.Buttons,
  Vcl.WinXCtrls, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

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
    imgApp: TImage;
    pnlBotoes: TPanel;
    btnConfigurar: TSpeedButton;
    btnSincronizar: TSpeedButton;
    pnlContent: TPanel;
    pnlDesktop: TPanel;
    SplitViewMenu: TSplitView;
    lblSincronizar: TLabel;
    lblSincronizarVendedor: TLabel;
    lblSincronizarProduto: TLabel;
    lblSincronizarCliente: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TmrContadorTimer(Sender: TObject);
    procedure btnSincronizarMouseEnter(Sender: TObject);
    procedure btnSincronizarMouseLeave(Sender: TObject);
    procedure btnConfigurarMouseEnter(Sender: TObject);
    procedure btnConfigurarMouseLeave(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
    procedure pnlDesktopClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ConfigurarIcon(aResource : String; Sender : TSpeedButton);
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
  , Service.PrevisaoTempo
  , Service.Utils
  , Classe.Gerenciador.View, Interfaces.PrevisaoTempo;

{ TViewVendaMobile }

procedure TViewVendaMobile.btnConfigurarClick(Sender: TObject);
var
  aPrevisao : TCidadePrevisaoTempo;
begin
  try
    aPrevisao := TServicePrevisaoTempo
      .GetCidade(TTipoServicePrevisaoTempo.sptWeatherstackAPI, '60f0318e8b6fa78085190379ad56025c', 'Ananindeua', 'PA');
    lblCidade.Caption := Format('%s, %s, %s°', [aPrevisao.Nome, aPrevisao.Regiao, aPrevisao.PrevisaoTempo.Temperatura]);
  finally
    aPrevisao.DisposeOf;
  end;
end;

procedure TViewVendaMobile.btnConfigurarMouseEnter(Sender: TObject);
begin
  ConfigurarIcon('app_configurar_hot', TSpeedButton(Sender));
end;

procedure TViewVendaMobile.btnConfigurarMouseLeave(Sender: TObject);
begin
  ConfigurarIcon('app_configurar', TSpeedButton(Sender));
end;

procedure TViewVendaMobile.btnSincronizarClick(Sender: TObject);
begin
  if SplitViewMenu.Opened then
    SplitViewMenu.Close
  else
    SplitViewMenu.Open;
end;

procedure TViewVendaMobile.btnSincronizarMouseEnter(Sender: TObject);
begin
  ConfigurarIcon('app_sincronizar_hot', TSpeedButton(Sender));
end;

procedure TViewVendaMobile.btnSincronizarMouseLeave(Sender: TObject);
begin
  ConfigurarIcon('app_sincronizar', TSpeedButton(Sender));
end;

procedure TViewVendaMobile.ConfigurarIcon(aResource: String; Sender: TSpeedButton);
begin
  TServicesUtils.ResourceImage(aResource, Sender);
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

  SplitViewMenu.Opened := False;
  SplitViewMenu.OpenedWidth := pnlNameApp.Width - pnlBotoes.Width;
end;

procedure TViewVendaMobile.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if SplitViewMenu.Opened then
      SplitViewMenu.Close;
  end
  else
    inherited;
end;

procedure TViewVendaMobile.FormShow(Sender: TObject);
begin
  inherited;
  lblUsuario.Caption := StrFormatarNome(gUsuarioLogado.Nome);
end;

procedure TViewVendaMobile.pnlDesktopClick(Sender: TObject);
begin
  SplitViewMenu.Close;
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
