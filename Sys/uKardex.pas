unit uKardex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RXDBCtrl, Grids, DBGrids, ExtCtrls, rxToolEdit,
  ComCtrls, DB, IBCustomDataSet, IBQuery, Buttons;

type
  TfrmKardex = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dttmpckrINI: TDateTimePicker;
    dttmpckrFIM: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    ibqryProdHist: TIBQuery;
    DataSource1: TDataSource;
    spbtnPesquisa: TSpeedButton;
    ComboEdit1: TComboEdit;
    DBGrid1: TDBGrid;
    procedure spbtnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKardex: TfrmKardex;

implementation

uses UDMBusiness;


{$R *.dfm}

procedure TfrmKardex.spbtnPesquisaClick(Sender: TObject);
begin
 with ibqryProdHist do
 begin
   Close;
   Params[0].AsString := ComboEdit1.Text;
   Params[1].AsDateTime := dttmpckrINI.DateTime;
   Params[2].AsDateTime := dttmpckrFIM.DateTime;
   Open;
 end;

end;

procedure TfrmKardex.FormShow(Sender: TObject);
begin
  ComboEdit1.SetFocus;
 dttmpckrINI.Date := IncMonth(Date, -1);
 dttmpckrFIM.Date := Date;
end;

initialization
  FormFunction.RegisterForm('frmKardex', TfrmKardex);

end.
