unit URelEstoqVeic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelEstoqVeic = class(TForm)
    qckrp: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText19: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    ibqryEstoqVeic: TIBQuery;
    ibqryEstoqVeicTotPrecoVenda: TCurrencyField;
    ibqryEstoqVeicTotCustoEstoq: TCurrencyField;
    ibqryEstoqVeicNOME: TIBStringField;
    ibqryEstoqVeicDESCRI: TIBStringField;
    ibqryEstoqVeicREFERENCIA: TIBStringField;
    ibqryEstoqVeicCHASSI_VEICULO: TIBStringField;
    ibqryEstoqVeicANO_MODELO_VEICULO: TSmallintField;
    ibqryEstoqVeicANO_FABRICACAO_VEICULO: TSmallintField;
    ibqryEstoqVeicPRECO: TIBBCDField;
    ibqryEstoqVeicQTDE: TIBBCDField;
    QRLabel3: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    ibqryEstoqVeicCOR: TIBStringField;
    ibqryEstoqVeicCODIGO: TIntegerField;
    QRLabel5: TQRLabel;
    ibqryEstoqVeicCOMPRA: TIBBCDField;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoqVeic: TfrmRelEstoqVeic;

implementation

{$R *.dfm}

end.
