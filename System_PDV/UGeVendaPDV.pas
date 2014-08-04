unit UGeVendaPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, dxGDIPlusClasses;

type
  TfrmGeVendaPDV = class(TfrmGrPadrao)
    PnlInformeGeral: TPanel;
    imgEmpresa: TImage;
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
