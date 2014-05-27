unit UCdDeposito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, DB, IBCustomDataSet, ComCtrls, Buttons,
  ToolWin, Mask, ExtCtrls;

type
  TfrmCdDeposito = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    lblCod: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    tlbrCadCatProd: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBComboBox2: TDBComboBox;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnFechClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdDeposito: TfrmCdDeposito;

implementation

uses UGrDepositos, UDMBusiness;

{$R *.dfm}

procedure TfrmCdDeposito.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrDepositos.ibdtstLancDepos.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro gravado com sucesso!');
       frmGrDepositos.ibdtstLancDepos.Insert;
       DBLookupComboBox1.SetFocus;
     end
end;

procedure TfrmCdDeposito.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrDepositos.ibdtstLancDepos.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmCdDeposito.Close;
     end
end;

procedure TfrmCdDeposito.FormShow(Sender: TObject);
begin
  DBLookupComboBox1.SetFocus;
end;

procedure TfrmCdDeposito.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCdDeposito.btbtnFechClick(Sender: TObject);
begin
  frmGrDepositos.ibdtstLancDepos.Cancel;
  Close;
end;

procedure TfrmCdDeposito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmGrDepositos.ibdtstLancDepos.Cancel;
end;

end.
