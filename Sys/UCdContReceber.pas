unit UCdContReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, IBCustomDataSet, ComCtrls, StdCtrls, Buttons,
  ToolWin, Mask, ExtCtrls, IBQuery;

type
  TfrmCdContReceb = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    tlbrCadCatProd: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    btbtnAtual: TBitBtn;
    Label11: TLabel;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnFechClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure btbtnAtualClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCdContReceb: TfrmCdContReceb;

implementation

uses UGrContReceber, UDMBusiness;

{$R *.dfm}

procedure TfrmCdContReceb.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=13 then perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCdContReceb.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
     try
       frmGrContReceb.ibdtstContRec.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Registro gravado com sucesso!');
       Close;
       except
       showmessage('Este lançamento já foi incluído no sistema');
       end; //try
     end;
end;

procedure TfrmCdContReceb.btbtnFechClick(Sender: TObject);
begin
  Close
end;

procedure TfrmCdContReceb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCdContReceb.btbtnGrav.Enabled := True;
  frmCdContReceb.btbtnAtual.Enabled := False;
  frmGrContReceb.ibdtstContRec.Cancel;
end;

procedure TfrmCdContReceb.DBEdit9Exit(Sender: TObject);
var
rec, desc, total : double;
begin
 rec := frmGrContReceb.ibdtstContRecVALORREC.Value;
 desc := frmGrContReceb.ibdtstContRecVALORMULTA.Value;
 total := rec - desc;
 frmGrContReceb.ibdtstContRecVALORRECTOT.Value := total;
end;

procedure TfrmCdContReceb.DBEdit12Exit(Sender: TObject);
begin
  if DBEdit12.Text = '' then DBEdit12.Text := FloatToStr(0.00);
end;

procedure TfrmCdContReceb.btbtnAtualClick(Sender: TObject);
begin
 if Application.MessageBox('Deseja atualizar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContReceb.ibdtstContRec.Post;
   //    Dm.ibTrnsctnDVM.CommitRetaining;
       ShowMessage('Registro atualizado com sucesso!');
       frmCdContReceb.Close;
     end;
end;

procedure TfrmCdContReceb.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContReceb.ibdtstContRec.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmCdContReceb.Close;
     end
end;

end.
