unit UCdBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfrmCadBanco = class(TForm)
    Panel2: TPanel;
    tlbrCadCatProd: TToolBar;
    btbtnCancel: TBitBtn;
    btbtnGrav: TBitBtn;
    btbtnFech: TBitBtn;
    ToolButton1: TToolButton;
    GroupBox1: TGroupBox;
    lblCod: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    procedure btbtnFechClick(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

uses UGrBanco, UDMBusiness;


{$R *.DFM}

procedure TfrmCadBanco.btbtnFechClick(Sender: TObject);
begin
  Close;
  frmGridBanco.ibdtstBancos.Cancel
end;

procedure TfrmCadBanco.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadBanco.FormShow(Sender: TObject);
begin
  DBEdit6.SetFocus
end;

procedure TfrmCadBanco.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGridBanco.ibdtstBancos.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro gravado com sucesso!');
       frmGridBanco.ibdtstBancos.Insert;
       DBEdit6.SetFocus;
     end

end;

procedure TfrmCadBanco.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGridBanco.ibdtstBancos.Cancel;
       DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
       ShowMessage('Registro cancelado com sucesso!');
       frmGridBanco.ibdtstBancos.Insert;
       DBEdit6.SetFocus;
     end;

end;

procedure TfrmCadBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmGridBanco.ibdtstBancos.Cancel
end;

end.
