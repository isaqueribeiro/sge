unit View.VendaMobile.Configurar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TViewVendaMobileConfigurar = class(TfrmGrPadrao)
    pnlContent: TPanel;
    pnlHeader: TPanel;
    lblMenu: TLabel;
    lblEtata: TLabel;
    lblRotina: TLabel;
    pnlFooter: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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
  , Classe.Gerenciador.View;

{ TViewVendaMobileConfigurar }

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

procedure TViewVendaMobileConfigurar.InicializarComponentes;
begin
  ;
end;

procedure TViewVendaMobileConfigurar.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  _GerenciadorView.RegistrarView('ViewVendaMobileConfigurar', TViewVendaMobileConfigurar);

end.
