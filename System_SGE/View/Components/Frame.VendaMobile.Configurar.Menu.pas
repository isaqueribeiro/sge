unit Frame.VendaMobile.Configurar.Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TOnClickMenuButton = procedure (Sender: TObject) of object;
  TFrameVendaMobileConfigurarMenu = class(TFrame)
    PanelContent: TPanel;
    pnlChaveAcesso: TPanel;
    shpChaveAcesso: TShape;
    imgChaveAcesso: TImage;
    lblChaveAcesso: TLabel;
    pnlServidorWeb: TPanel;
    shpServidorWeb: TShape;
    imgServidorWeb: TImage;
    lblServidorWeb: TLabel;
    procedure ChaveAcessoClick(Sender: TObject);
    procedure ChaveAcessoEnter(Sender: TObject);
    procedure ChaveAcessoLeave(Sender: TObject);

    procedure ServidorWebClick(Sender: TObject);
    procedure ServidorWebEnter(Sender: TObject);
    procedure ServidorWebLeave(Sender: TObject);
  private
    { Private declarations }
    FChaveAcessoOnClick : TOnClickMenuButton;
    FServidorWebOnClick : TOnClickMenuButton;
    procedure FormatarBotaoEnter(APanel : TPanel; AShape : TShape; AImage : TImage; ALabel : TLabel; AResourceName : String);
    procedure FormatarBotaoLeave(APanel : TPanel; AShape : TShape; AImage : TImage; ALabel : TLabel; AResourceName : String);
  public
    { Public declarations }
    procedure LimparSelecaoBotao(Sender : TObject);
    procedure SetChaveAcessoOnClick(Value : TOnClickMenuButton);
    procedure SetServidorWebOnClick(Value : TOnClickMenuButton);
    procedure RegistrarEventos;
  end;

implementation

uses
  Service.Utils, Classe.Gerenciador.View;

{$R *.dfm}

{ TFrameVendaMobileConfigurarMenu }

function IfThenColor(AExpressao : Boolean; ATrue, AFalse : TColor) : TColor;
begin
  if AExpressao then
    Result := ATrue
  else
    Result := AFalse;
end;

procedure TFrameVendaMobileConfigurarMenu.ChaveAcessoClick(Sender: TObject);
begin
  LimparSelecaoBotao(Sender);
  RegistrarEventos;

  shpChaveAcesso.Tag := 1;
  FormatarBotaoEnter(PnlChaveAcesso, shpChaveAcesso, ImgChaveAcesso, LblChaveAcesso, 'accesskey_24x24');

  if Assigned(FChaveAcessoOnClick) then
    FChaveAcessoOnClick(Sender);
end;

procedure TFrameVendaMobileConfigurarMenu.ChaveAcessoEnter(Sender: TObject);
begin
  FormatarBotaoEnter(PnlChaveAcesso, shpChaveAcesso, ImgChaveAcesso, LblChaveAcesso, 'accesskey_24x24');
end;

procedure TFrameVendaMobileConfigurarMenu.ChaveAcessoLeave(Sender: TObject);
begin
  FormatarBotaoLeave(PnlChaveAcesso, shpChaveAcesso, ImgChaveAcesso, LblChaveAcesso, 'accesskey_24x24');
end;

procedure TFrameVendaMobileConfigurarMenu.FormatarBotaoEnter(APanel: TPanel; AShape : TShape; AImage: TImage; ALabel: TLabel;
  AResourceName: String);
begin
  APanel.Color       := $001C340A;
  AShape.Brush.Color := IfThenColor(AShape.Tag = 0, $001C340A, clWhite);
  ALabel.Font.Color  := clWhite;
  TServicesUtils.ResourceImage('white_' + AResourceName, AImage);
end;

procedure TFrameVendaMobileConfigurarMenu.FormatarBotaoLeave(APanel: TPanel; AShape : TShape; AImage: TImage; ALabel: TLabel;
  AResourceName: String);
begin
  APanel.Color       := clBtnFace;
  AShape.Brush.Color := IfThenColor(AShape.Tag = 0, clBtnFace, $001C340A);
  ALabel.Font.Color  := $001C340A;
  TServicesUtils.ResourceImage(AResourceName, AImage);
end;

procedure TFrameVendaMobileConfigurarMenu.LimparSelecaoBotao(Sender : TObject);
begin
  shpChaveAcesso.Tag := 0;
  shpServidorWeb.Tag := 0;
  FormatarBotaoLeave(PnlChaveAcesso, shpChaveAcesso, ImgChaveAcesso, LblChaveAcesso, 'accesskey_24x24');
  FormatarBotaoLeave(pnlServidorWeb, shpServidorWeb, imgServidorWeb, lblServidorWeb, 'webserver_24x24');
end;

procedure TFrameVendaMobileConfigurarMenu.RegistrarEventos;
begin
  _GerenciadorView
    .RegistrarEvento('FrameVendaMobileConfigurarMenu.LimparSelecaoBotao', LimparSelecaoBotao);
end;

procedure TFrameVendaMobileConfigurarMenu.ServidorWebClick(Sender: TObject);
begin
  LimparSelecaoBotao(Sender);
  RegistrarEventos;

  shpServidorWeb.Tag := 1;
  FormatarBotaoEnter(pnlServidorWeb, shpServidorWeb, imgServidorWeb, lblServidorWeb, 'webserver_24x24');

  if Assigned(FServidorWebOnClick) then
    FServidorWebOnClick(Sender);
end;

procedure TFrameVendaMobileConfigurarMenu.ServidorWebEnter(Sender: TObject);
begin
  FormatarBotaoEnter(pnlServidorWeb, shpServidorWeb, imgServidorWeb, lblServidorWeb, 'webserver_24x24');
end;

procedure TFrameVendaMobileConfigurarMenu.ServidorWebLeave(Sender: TObject);
begin
  FormatarBotaoLeave(pnlServidorWeb, shpServidorWeb, imgServidorWeb, lblServidorWeb, 'webserver_24x24');
end;

procedure TFrameVendaMobileConfigurarMenu.SetChaveAcessoOnClick(Value: TOnClickMenuButton);
begin
  FChaveAcessoOnClick := Value;
end;

procedure TFrameVendaMobileConfigurarMenu.SetServidorWebOnClick(Value: TOnClickMenuButton);
begin
  FServidorWebOnClick := Value;
end;

end.
