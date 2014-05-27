unit uRelProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ExtCtrls;

type
  TfrmRelProdutos = class(TForm)
    qckrp: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    IBQuery1: TIBQuery;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    IBQuery1DESCRI: TIBStringField;
    IBQuery1COD: TIBStringField;
    IBQuery1MODELO: TIBStringField;
    IBQuery1REFERENCIA: TIBStringField;
    IBQuery1PRECO: TIBBCDField;
    IBQuery1CUSTOMEDIO: TIBBCDField;
    IBQuery1TotPrecoVenda: TCurrencyField;
    QRDBText7: TQRDBText;
    IBQuery1TotCustoEstoq: TCurrencyField;
    QRDBText4: TQRDBText;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    lblNomeSistema2: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel7: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBand4: TQRBand;
    QRLabel17: TQRLabel;
    QRSysData5: TQRSysData;
    QRBand5: TQRBand;
    QRSysData6: TQRSysData;
    IBQuery2: TIBQuery;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBBCDField1: TIBBCDField;
    IBBCDField2: TIBBCDField;
    IBQuery1FABRIC: TIBStringField;
    QRLabel18: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    IBQuery2FABRIC: TIBStringField;
    IBQuery1QTDE: TIBBCDField;
    IBQuery2QTDE: TIBBCDField;
    procedure qckrpBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure IBQuery1CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutos: TfrmRelProdutos;

implementation

uses
  UDMBusiness, UConstantesDGE, UFuncoes;

{$R *.dfm}

procedure TfrmRelProdutos.qckrpBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if ( GetSegmentoID(GetEmpresaIDDefault) = SEGMENTO_MERCADO_CARRO_ID ) then
   begin
     QRLabel2.Caption := 'RELATÓRIO ESTOQUE DE VEÍCULOS';
     qrlblCliMot.Caption := 'VEÍCULO';
     QRLabel10.Caption := 'PLACA';
     QRLabel5.Enabled := False;
     QRDBText6.Enabled := FALSE;
   end
end;

procedure TfrmRelProdutos.IBQuery1CalcFields(DataSet: TDataSet);
begin
  IBQuery1TotPrecoVenda.Value := IBQuery1PRECO.Value * IBQuery1QTDE.Value;
  IBQuery1TotCustoEstoq.Value := IBQuery1CUSTOMEDIO.Value * IBQuery1QTDE.Value;
end;

procedure TfrmRelProdutos.FormCreate(Sender: TObject);
begin
  lblNomeSistema1.Caption := GetProductName + ' - versão ' + GetVersion;
  lblNomeSistema2.Caption := GetProductName + ' - versão ' + GetVersion;

  IBQuery1.Open;
  IBQuery2.Open;

end;

initialization
  FormFunction.RegisterForm('frmRelProdutos', TfrmRelProdutos);

end.
