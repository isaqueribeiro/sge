unit UBxCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Buttons;

type
  TfrmBxCP = class(TForm)
    btbtnFech: TBitBtn;
    btbtnCancel: TBitBtn;
    btbtnGrav: TBitBtn;
    DBComboBox1: TDBComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    Label11: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFechClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBxCP: TfrmBxCP;

implementation

uses UGrContPagar, U_SenhaBaixa, UDMBusiness;

{$R *.dfm}

procedure TfrmBxCP.btbtnGravClick(Sender: TObject);
begin
 if Application.MessageBox('Deseja confirmar BAIXA deste lançamento ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       if not (frmGrContPagar.ibdtstContPagDTPAG.IsNull) then
         begin
          frmGrContPagar.ibdtstContPag.Refresh;
          DMBusiness.ibtrnsctnBusiness.Commit;
          close;
          ShowMessage('Lançamento baixado com sucesso!');
          frmGrContPagar.ibdtstContPag.Close;
         end
       else ShowMessage('Preencha Data de Pagamento da Baixa!')
     end;
end;

procedure TfrmBxCP.btbtnCancelClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       frmGrContPagar.ibdtstContPag.Cancel;
       ShowMessage('Registro cancelado com sucesso!');
       frmGrContPagar.ibdtstContPag.Insert;
       //DBLookupComboBox1.SetFocus;
     end;
end;

procedure TfrmBxCP.btbtnFechClick(Sender: TObject);
begin
close;
end;

end.
