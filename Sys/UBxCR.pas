unit UBxCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Buttons, rxToolEdit, RXDBCtrl;

type
  TfrmBxCR = class(TForm)
    btbtnFech: TBitBtn;
    btbtnCancel: TBitBtn;
    btbtnGrav: TBitBtn;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBText4: TDBText;
    Label5: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFechClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBxCR: TfrmBxCR;

implementation

uses UGrContReceber, UDMBusiness;

{$R *.dfm}

procedure TfrmBxCR.btbtnGravClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja confirmar baixa deste lançamento ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
      if (frmGrContReceb.ibdtstContRecDTREC.IsNull) then ShowMessage('Preencha Data de Recebimento da Baixa!')
       else
         try
           frmGrContReceb.ibdtstContRec.Refresh;
           DMBusiness.ibtrnsctnBusiness.Commit;
           ShowMessage('Lançamento baixado com sucesso!');
           Close;

          except
          showmessage('Este lançamento já foi incluído no sistema');
         end; //try
     end;

end;

procedure TfrmBxCR.btbtnCancelClick(Sender: TObject);
begin
if Application.MessageBox('Deseja cancelar essa Baixa ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContReceb.ibdtstContRec.Cancel;
       ShowMessage('Baixa cancelada com sucesso!');
       Close;
       //DBLookupComboBox2.SetFocus;
     end;
end;

procedure TfrmBxCR.btbtnFechClick(Sender: TObject);
begin
close;
end;

procedure TfrmBxCR.FormShow(Sender: TObject);
begin
  frmGrContReceb.ibdtstContRec.Edit;
  DBText4.Field.Value := DBText3.Field.Value;
end;

procedure TfrmBxCR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmGrContReceb.ibdtstContRec.Cancel;
end;

end.
