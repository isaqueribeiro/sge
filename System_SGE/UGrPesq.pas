unit UGrPesq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Buttons, StdCtrls, ExtCtrls,
  Grids, DBGrids, Mask;

type
  TfrmPesq = class(TForm)
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQuery1CNPJ: TIBStringField;
    IBQuery1NOMEFORN: TIBStringField;
    edt: TMaskEdit;
    IBQuery1CODFORN: TIntegerField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesq: TfrmPesq;

implementation

uses
  UDMBusiness, UPrinc, UGeEfetuarLogin;

{$R *.dfm}

procedure TfrmPesq.FormCreate(Sender: TObject);
begin
  frmPrinc.show;
  frmPrinc.Enabled := False;

  FrmEfetuarLogin := TFrmEfetuarLogin.Create(Self);
  FrmEfetuarLogin.FinalizarAplicacao := True;
  FrmEfetuarLogin.ShowModal;
end;

end.
