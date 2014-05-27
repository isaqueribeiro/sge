unit uRelCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelCli = class(TForm)
    qckrp: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    IBQuery1: TIBQuery;
    QRDBText9: TQRDBText;
    IBQuery1NOME: TIBStringField;
    IBQuery1CNPJ: TIBStringField;
    IBQuery1INSCEST: TIBStringField;
    IBQuery1ENDER: TIBStringField;
    IBQuery1CIDADE: TIBStringField;
    IBQuery1UF: TIBStringField;
    QRSysData3: TQRSysData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCli: TfrmRelCli;

implementation

uses
  UDMBusiness, UFuncoes;

{$R *.dfm}

procedure TfrmRelCli.FormCreate(Sender: TObject);
begin
  lblNomeSistema.Caption := GetProductName + ' - versão ' + GetVersion;

  IBQuery1.Open;

end;

initialization
  FormFunction.RegisterForm('frmRelCli', TfrmRelCli);

end.
