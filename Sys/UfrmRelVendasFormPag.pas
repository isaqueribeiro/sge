unit UfrmRelVendasFormPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons, ComCtrls;

type
  TfrmRelVendasFormPag = class(TForm)
    qckrpGrpFormPag: TQuickRep;
    TitleBand1: TQRBand;
    lblNomeSistema: TQRLabel;
    QRSysData1: TQRSysData;
    qrlblPeriodo: TQRLabel;
    QRLabel2: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData3: TQRSysData;
    PageFooterBand2: TQRBand;
    QRSysData2: TQRSysData;
    ibqryGrpFormPag: TIBQuery;
    ibqryGrpFormPagDESCRI: TIBStringField;
    ibqryGrpFormPagSUM: TIBBCDField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dttmpcIni: TDateTimePicker;
    dttmpcFim: TDateTimePicker;
    QRDBText4: TQRDBText;
    ibqryEmpresa: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendasFormPag: TfrmRelVendasFormPag;

implementation

uses
  UFuncoes, UDMBusiness;

{$R *.dfm}

procedure TfrmRelVendasFormPag.FormCreate(Sender: TObject);
begin
  lblNomeSistema.Caption := GetProductName;
  dttmpcIni.Date := IncMonth(Date, -1);
  dttmpcFim.Date := Date;
end;

procedure TfrmRelVendasFormPag.BitBtn3Click(Sender: TObject);
begin
 with ibqryGrpFormPag do
 begin
   Close;
   ParamByName('dtini').Value := DateToStr(dttmpcIni.Date);
   ParamByName('dtfim').Value := DateToStr(dttmpcFim.Date);
   Open;
   qrlblPeriodo.Caption:= 'PERÍODO: '+ DateToStr(dttmpcIni.Date) +' a '+ DateToStr(dttmpcFim.date);
   if IsEmpty then
    MessageDlg ('Relatório Sem Registros!',mtWarning, [mbOk],0)
   else qckrpGrpFormPag.Preview;
 end;
         
end;

initialization
  FormFunction.RegisterForm('frmRelVendasFormPag', TfrmRelVendasFormPag);

end.
