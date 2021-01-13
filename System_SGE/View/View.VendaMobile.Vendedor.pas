unit View.VendaMobile.Vendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls, dxGDIPlusClasses;

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
    pnlMessageIcon: TPanel;
    pnlMessageButton: TPanel;
    pnlMessageText: TPanel;
    Label1: TLabel;
    pnlBtnClose: TPanel;
    imgBtnClose: TImage;
    shpBtnClose: TShape;
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

implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness
  , Classe.Gerenciador.View
  , Service.Utils;

{ TViewVendaMobileVendedor }

procedure TViewVendaMobileVendedor.FormatarBotaoEnter(AShape: TShape; AImage: TImage; AResourceName: String);
begin
  AShape.Visible := True;
  AShape.SendToBack;
  TServicesUtils.ResourceImage(AResourceName, AImage);
end;

procedure TViewVendaMobileVendedor.FormatarBotaoLeave(AShape: TShape; AImage: TImage; AResourceName: String);
begin
  AShape.Visible := False;
  AShape.SendToBack;
  TServicesUtils.ResourceImage(AResourceName, AImage);
end;

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

procedure TViewVendaMobileVendedor.imgBtnCloseMouseEnter(Sender: TObject);
begin
  FormatarBotaoEnter(shpBtnClose, imgBtnClose, 'btn_close_24_info');
end;

procedure TViewVendaMobileVendedor.imgBtnCloseMouseLeave(Sender: TObject);
begin
  FormatarBotaoLeave(shpBtnClose, imgBtnClose, 'btn_close_24_white');
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
