unit Frame.VendaMobile.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses;

type
  TOnClickMenuButton = procedure (Sender: TObject) of object;

  TFrameVendaMobileMenu = class(TFrame)
    PnlSincronizar: TPanel;
    ImgSincronizar: TImage;
    LblSincronizar: TLabel;
    PnlConfigurar: TPanel;
    ImgConfigurar: TImage;
    LblConfigurar: TLabel;
    PanelContent: TPanel;
    procedure SincronizarMouseEnter(Sender: TObject);
    procedure SincronizarMouseLeave(Sender: TObject);
    procedure SincronizarOnClick(Sender: TObject);
    procedure ConfigurarMouseEnter(Sender: TObject);
    procedure ConfigurarMouseLeave(Sender: TObject);
    procedure ConfigurarOnClick(Sender: TObject);
  private
    { Private declarations }
    FSincronizarOnClick : TOnClickMenuButton;
    FConfigurarOnClick : TOnClickMenuButton;
    procedure FormatarBotaoEnter(APanel : TPanel; AImage : TImage; ALabel : TLabel; AResourceName : String);
    procedure FormatarBotaoLeave(APanel : TPanel; AImage : TImage; ALabel : TLabel; AResourceName : String);
  public
    { Public declarations }
    procedure SetSincronizarOnClick(Value : TOnClickMenuButton);
    procedure SetConfigurarOnClick(Value : TOnClickMenuButton);
  end;

implementation

uses
  Service.Utils;

{$R *.dfm}

{ TFrameVendaMobileMenu }

procedure TFrameVendaMobileMenu.FormatarBotaoEnter(APanel: TPanel; AImage: TImage; ALabel: TLabel; AResourceName : String);
begin
  APanel.Color      := clWhite;
  ALabel.Font.Color := $003C7014;
  TServicesUtils.ResourceImage(AResourceName, AImage);
end;

procedure TFrameVendaMobileMenu.FormatarBotaoLeave(APanel: TPanel; AImage: TImage; ALabel: TLabel;
  AResourceName: String);
begin
  APanel.Color      := $003C7014;
  ALabel.Font.Color := clWhite;
  TServicesUtils.ResourceImage('white_' + AResourceName, AImage);
end;

procedure TFrameVendaMobileMenu.ConfigurarMouseEnter(Sender: TObject);
begin
  FormatarBotaoEnter(PnlConfigurar, ImgConfigurar, LblConfigurar, 'setting');
end;

procedure TFrameVendaMobileMenu.ConfigurarMouseLeave(Sender: TObject);
begin
  FormatarBotaoLeave(PnlConfigurar, ImgConfigurar, LblConfigurar, 'setting');
end;

procedure TFrameVendaMobileMenu.ConfigurarOnClick(Sender: TObject);
begin
  if Assigned(FConfigurarOnClick) then
    FConfigurarOnClick(Sender);
end;

procedure TFrameVendaMobileMenu.SincronizarMouseLeave(Sender: TObject);
begin
  FormatarBotaoLeave(PnlSincronizar, ImgSincronizar, LblSincronizar, 'synchronize');
end;

procedure TFrameVendaMobileMenu.SincronizarOnClick(Sender: TObject);
begin
  if Assigned(FSincronizarOnClick) then
    FSincronizarOnClick(Sender);
end;

procedure TFrameVendaMobileMenu.SetConfigurarOnClick(Value: TOnClickMenuButton);
begin
  FConfigurarOnClick := Value;
end;

procedure TFrameVendaMobileMenu.SetSincronizarOnClick(Value: TOnClickMenuButton);
begin
  FSincronizarOnClick := Value;
end;

procedure TFrameVendaMobileMenu.SincronizarMouseEnter(Sender: TObject);
begin
  FormatarBotaoEnter(PnlSincronizar, ImgSincronizar, LblSincronizar, 'synchronize');
end;

end.
