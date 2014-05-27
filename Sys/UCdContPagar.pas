unit UCdContPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, DB, IBCustomDataSet, ComCtrls, Buttons,
  ToolWin, ExtCtrls;

type
  TfrmCdContPagar = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    tlbrCadCatProd: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBEdit3: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label11: TLabel;
    Label12: TLabel;
    btbtnAtual: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFechClick(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnAtualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdContPagar: TfrmCdContPagar;

implementation

uses UGrContPagar, UDMBusiness;

{$R *.dfm}

procedure TfrmCdContPagar.FormShow(Sender: TObject);
begin
  //DBLookupComboBox1.SetFocus
  DBComboBox1.Enabled := True;
  DBEdit3.Enabled := True;
  DBLookupComboBox3.Enabled := True;

end;

procedure TfrmCdContPagar.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContPagar.ibdtstContPag.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro gravado com sucesso!');
       frmGrContPagar.ibdtstContPag.Insert;
       DBLookupComboBox1.SetFocus;
     end;
end;

procedure TfrmCdContPagar.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContPagar.ibdtstContPag.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmCdContPagar.Close;
     end;
end;

procedure TfrmCdContPagar.btbtnFechClick(Sender: TObject);
begin
  Close
end;

procedure TfrmCdContPagar.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCdContPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmGrContPagar.ibdtstContPag.Cancel;
  frmCdContPagar.btbtnAtual.Enabled := False;
  frmCdContPagar.btbtnGrav.Enabled := True;
end;

procedure TfrmCdContPagar.btbtnAtualClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja atualizar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContPagar.ibdtstContPag.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro atualizado com sucesso!');
       frmCdContPagar.Close;
     end;
end;

end.
