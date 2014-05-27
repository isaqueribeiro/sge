unit uRelCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelCP = class(TForm)
    qckrpCP: TQuickRep;
    TitleBand1: TQRBand;
    qrlblPeriodo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    qrlblStatus: TQRLabel;
    lblNomeSistema: TQRLabel;
    QRDBText3: TQRDBText;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    IBQuery1: TIBQuery;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    qrlblFornec: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCP: TfrmRelCP;

implementation

uses
  UDMBusiness, UFuncoes;

{$R *.dfm}

procedure TfrmRelCP.FormCreate(Sender: TObject);
begin
  lblNomeSistema.Caption := GetProductName + ' - versão ' + GetVersion;
end;

end.
