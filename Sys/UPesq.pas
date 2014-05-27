unit UPesq;

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
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bttnRelCCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesq: TfrmPesq;

implementation

uses UDMBusiness, UPrinc, UfrmAcessoSistema;

{$R *.dfm}

procedure TfrmPesq.SpeedButton1Click(Sender: TObject);
begin
 IBQuery1.Close;
 IBQuery1.SQL.Clear;
 IBQuery1.SQL.Add('Select CODFORN, CNPJ, NOMEFORN from TBFORNECEDOR where NOMEFORN like :razaosc order by NOMEFORN');
 IBQuery1.Params[0].AsString := edt.Text + '%';
 IBQuery1.Open;
end;

procedure TfrmPesq.BitBtn1Click(Sender: TObject);
begin
//  frmGrEntradaEstoq.ibdtstComprasCODFORN.Value := IBQuery1CODFORN.Value;
//  frmEntradaEstoq.Edit1.Text := IBQuery1NOMEFORN.Value;
//  IBQuery1.Close;
//  close;
end;

procedure TfrmPesq.BitBtn2Click(Sender: TObject);
begin
 IBQuery1.Close;
 close;
end;

procedure TfrmPesq.bttnRelCCClick(Sender: TObject);
begin
 IBQuery1.Open;
 //frmRelCC.ComboEdit1.Text := IBQuery1CPF.Value;
 IBQuery1.Close;
 close;

end;

procedure TfrmPesq.FormShow(Sender: TObject);
begin
 edt.Clear;
end;

procedure TfrmPesq.FormCreate(Sender: TObject);
begin
 frmPrinc.show;
 frmPrinc.Enabled := false;
 frmAcessoSistema := TfrmAcessoSistema.create(self);
 frmAcessoSistema.Show;
end;

end.
