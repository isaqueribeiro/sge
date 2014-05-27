unit UfrmRelEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, DBCtrls, EFocCol;

type
  TfrmRelEstoque = class(TForm)
    qckrp: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblTituloRelat: TQRLabel;
    QRDBText9: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblCliMot: TQRLabel;
    QRLabel12: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    ibqryDemanda: TIBQuery;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    qrlblAno: TQRLabel;
    grpbxVendedor: TGroupBox;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    btbtnLista: TBitBtn;
    dblkpcmbbxFabric: TDBLookupComboBox;
    ibdtsFabric: TIBDataSet;
    dtsrcFabric: TDataSource;
    ibdtsFabricCOD: TIntegerField;
    ibdtsFabricNOME: TIBStringField;
    GroupBox1: TGroupBox;
    cmbbxAno: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btbtnListaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoque: TfrmRelEstoque;

implementation

uses
  UDMBusiness, UFuncoes;

{$R *.dfm}

procedure TfrmRelEstoque.FormCreate(Sender: TObject);
begin
  lblNomeSistema.Caption := GetProductName;
  ibdtsFabric.Close;
  ibdtsFabric.Open;
  while not ibdtsFabric.Eof do ibdtsFabric.Next;
end;

procedure TfrmRelEstoque.btbtnListaClick(Sender: TObject);
begin
    ibqryDemanda.Close;
    ibqryDemanda.Params[0].Value := StrToInt(cmbbxAno.Text);
    ibqryDemanda.Params[1].Value := StrToInt(cmbbxAno.Text);
    ibqryDemanda.Params[2].Value := dblkpcmbbxFabric.KeyValue;
    qrlblAno.Caption := 'FABRICANTE: '+ dblkpcmbbxFabric.Text + '  -  ANO: '+ cmbbxAno.Text ;
    ibqryDemanda.Open;
    qckrp.Preview;
end;

initialization
  FormFunction.RegisterForm('frmRelEstoque', TfrmRelEstoque);

end.
