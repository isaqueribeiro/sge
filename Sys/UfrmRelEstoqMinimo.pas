unit UfrmRelEstoqMinimo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, QRCtrls, QuickRpt;

type
  TfrmRelEstoqMinimo = class(TForm)
    grpbxVendedor: TGroupBox;
    dblkpcmbbxFabric: TDBLookupComboBox;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    btbtnLista: TBitBtn;
    ibdtsFabric: TIBDataSet;
    ibdtsFabricCOD: TIntegerField;
    ibdtsFabricNOME: TIBStringField;
    dtsrcFabric: TDataSource;
    qckrpEstMin: TQuickRep;
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
    QRLabel15: TQRLabel;
    QRBand3: TQRBand;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand4: TQRBand;
    QRLabel17: TQRLabel;
    QRSysData5: TQRSysData;
    QRBand5: TQRBand;
    QRSysData6: TQRSysData;
    ibqryEstoqMin: TIBQuery;
    qrlblFabric: TQRLabel;
    procedure btbtnListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelEstoqMinimo: TfrmRelEstoqMinimo;

implementation

uses UDMBusiness, UFuncoes;

{$R *.dfm}

procedure TfrmRelEstoqMinimo.btbtnListaClick(Sender: TObject);
begin

 with ibqryEstoqMin do
 begin
   Close;
   Params[0].Value := dblkpcmbbxFabric.KeyValue;
   Open;
 end;

 if ibqryEstoqMin.IsEmpty then
    MessageDlg ('Relatório Sem Registros!',mtWarning, [mbOk],0)
 else
  begin
   qrlblFabric.Caption := 'FABRICANTE: '+ dblkpcmbbxFabric.Text;
   qckrpEstMin.Preview;
  end;

end;

procedure TfrmRelEstoqMinimo.FormCreate(Sender: TObject);
begin
  lblNomeSistema2.Caption := GetProductName;
  ibdtsFabric.Close;
  ibdtsFabric.Open;
  while not ibdtsFabric.Eof do ibdtsFabric.Next;
end;

end.
