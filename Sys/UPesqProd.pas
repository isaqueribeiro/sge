unit UPesqProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, Grids, DBGrids;

type
  TfrmPesqProd = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    edt: TEdit;
    ComboBox1: TComboBox;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    IBQuery1: TIBQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqProd: TfrmPesqProd;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmPesqProd.SpeedButton1Click(Sender: TObject);
begin
case (ComboBox1.ItemIndex) of
    0 :   //DESCRICAO DO PRODUTO
     begin
      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('select COD, DESCRI as DESCRICAO, MODELO, VALOR from TBPRODUTO where DESCRI like :DESCRI');
      IBQuery1.SQL.Add('order by DESCRI');
      IBQuery1.Params[0].AsString := edt.Text + '%';
      IBQuery1.Open;
     end;
    1 :
     begin
      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('select COD, DESCRI as DESCRICAO, MODELO, VALOR from TBPRODUTO where MODELO like :mod');
      IBQuery1.ParamByName('mod').AsString := edt.Text + '%';
      IBQuery1.Open;
     end;
    2 :
     begin
      IBQuery1.Close;
      IBQuery1.SQL.Clear;
      IBQuery1.SQL.Add('select COD, DESCRI as DESCRICAO, MODELO, VALOR from TBPRODUTO where COD like :cod');
      IBQuery1.SQL.Add('order by COD');
      IBQuery1.ParamByName('cod').AsString := edt.Text;
      IBQuery1.Open;
     end;

   end;
end;

procedure TfrmPesqProd.BitBtn1Click(Sender: TObject);
begin
{ frmContratoV.ibdtstContratoCODPROD.Value := IBQuery1COD.Value;
 frmContratoV.lblProd.Caption := IBQuery1DESCRICAO.Value  + ' ' + IBQuery1MODELO.Value;
 IBQuery1.Close;
 close;
}
end;

procedure TfrmPesqProd.BitBtn2Click(Sender: TObject);
begin
 IBQuery1.Close;
 close;
end;

end.
