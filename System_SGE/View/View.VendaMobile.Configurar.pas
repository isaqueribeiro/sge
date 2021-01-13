unit View.VendaMobile.Configurar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses;

type
  TViewVendaMobileConfigurar = class(TfrmGrPadrao)
    pnlContent: TPanel;
    pnlHeader: TPanel;
    lblMenu: TLabel;
    lblEtata: TLabel;
    lblRotina: TLabel;
    pnlFooter: TPanel;
    pnlBody: TPanel;
    pnlMessage: TPanel;
    pnlMessageIcon: TPanel;
    pnlMessageButton: TPanel;
    pnlBtnClose: TPanel;
    shpBtnClose: TShape;
    imgBtnClose: TImage;
    pnlMessageText: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure imgBtnCloseMouseEnter(Sender: TObject);
    procedure imgBtnCloseMouseLeave(Sender: TObject);
  private
    { Private declarations }
    procedure FormatarBotaoEnter(AShape: TShape; AImage : TImage; AResourceName : String);
    procedure FormatarBotaoLeave(AShape: TShape; AImage : TImage; AResourceName : String);

    procedure InicializarComponentes;
    procedure IdentificarEtapa(AEtapa : Word);
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

//var
//  ViewVendaMobileConfigurar: TViewVendaMobileConfigurar;
//
implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness
  , Service.Utils
  , Classe.Gerenciador.View;

{ TViewVendaMobileConfigurar }

procedure TViewVendaMobileConfigurar.FormatarBotaoEnter(AShape: TShape; AImage: TImage; AResourceName: String);
begin
  AShape.Visible := True;
  AShape.SendToBack;
  TServicesUtils.ResourceImage(AResourceName, AImage);
end;

procedure TViewVendaMobileConfigurar.FormatarBotaoLeave(AShape: TShape; AImage: TImage; AResourceName: String);
begin
  AShape.Visible := False;
  AShape.SendToBack;
  TServicesUtils.ResourceImage(AResourceName, AImage);
end;

procedure TViewVendaMobileConfigurar.FormCreate(Sender: TObject);
begin
  inherited;
  InicializarComponentes;
  IdentificarEtapa( 0 );
end;

procedure TViewVendaMobileConfigurar.IdentificarEtapa(AEtapa: Word);
begin
  case AEtapa of
    0 :
    begin
      lblRotina.Caption := EmptyStr;
      lblEtata.Caption  := 'Servidor';
    end;
  end;
end;

procedure TViewVendaMobileConfigurar.imgBtnCloseMouseEnter(Sender: TObject);
begin
  FormatarBotaoEnter(shpBtnClose, imgBtnClose, 'btn_close_24_info');
end;

procedure TViewVendaMobileConfigurar.imgBtnCloseMouseLeave(Sender: TObject);
begin
  FormatarBotaoLeave(shpBtnClose, imgBtnClose, 'btn_close_24_white');
end;

procedure TViewVendaMobileConfigurar.InicializarComponentes;
begin
  pnlMessage.Visible := False;
  ;
end;

procedure TViewVendaMobileConfigurar.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  _GerenciadorView.RegistrarView('ViewVendaMobileConfigurar', TViewVendaMobileConfigurar);

end.
