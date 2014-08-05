unit UGeVendaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, dxGDIPlusClasses, StdCtrls;

type
  TfrmGeVendaPDV = class(TfrmGrPadrao)
    PnlInformeGeral: TPanel;
    imgEmpresa: TImage;
    PnlCabecalhoVenda: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDV: TfrmGeVendaPDV;

implementation

uses
  UFuncoes, DateUtils, UDMBusiness, UDMNFe;

{$R *.dfm}

{ TfrmGeVendaPDV }

procedure TfrmGeVendaPDV.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeVendaPDV', TfrmGeVendaPDV);

end.
