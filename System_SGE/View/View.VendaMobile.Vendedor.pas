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
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

//var
//  ViewVendaMobileVendedor: TViewVendaMobileVendedor;
//
implementation

{$R *.dfm}

uses
    UConstantesDGE
  , UDMRecursos
  , UDMBusiness
  , Classe.Gerenciador.View;

{ TViewVendaMobileVendedor }

procedure TViewVendaMobileVendedor.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  _GerenciadorView.RegistrarView('ViewVendaMobileVendedor', TViewVendaMobileVendedor);

end.
