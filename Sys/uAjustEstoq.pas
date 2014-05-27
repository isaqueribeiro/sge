unit uAjustEstoq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, Buttons, ToolWin, DB,
  IBCustomDataSet;

type
  TfrmAjustEstoq = class(TForm)
    GroupBox1: TGroupBox;
    tlbrCadCatProd: TToolBar;
    btbtnGrav: TBitBtn;
    btbtnCancel: TBitBtn;
    ToolButton1: TToolButton;
    btbtnFech: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label11: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    IBDataSet1: TIBDataSet;
    procedure btbtnGravClick(Sender: TObject);
    procedure btbtnCancelClick(Sender: TObject);
    procedure btbtnFechClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjustEstoq: TfrmAjustEstoq;

implementation

uses UDMBusiness;

{$R *.dfm}

procedure TfrmAjustEstoq.btbtnGravClick(Sender: TObject);
begin
if DMBusiness.ibdtstProduto.Locate('cod', DBEdit1.Text,[loPartialKey]) and (DMBusiness.ibdtstAjustEstoqQTDENOVA.Value > 0) then
begin
  if Application.MessageBox('Deseja gravar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       DMBusiness.ibdtstAjustEstoqQTDEFINAL.Value := DMBusiness.ibdtstAjustEstoqQTDEATUAL.Value + DMBusiness.ibdtstAjustEstoqQTDENOVA.Value;
       DMBusiness.ibdtstAjustEstoq.Post;
       DMBusiness.ibtrnsctnBusiness.Commit;
       ShowMessage('Ajuste realizado com sucesso!');
       Close;
     end
  else DBEdit1.SetFocus;
end
else MessageDlg('Produto não encontrado!, ou a '+#13+
     'Nova Quantidade <= 0 ',mtInformation, [mbOk],0 );
end;

procedure TfrmAjustEstoq.btbtnCancelClick(Sender: TObject);
begin
if Application.MessageBox('Deseja cancelar esse registro ?',
      'Confirmação ...', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idYes then
     begin
       DMBusiness.ibdtstAjustEstoq.Cancel;
       DMBusiness.ibtrnsctnBusiness.Rollback;
       ShowMessage('Ajuste cancelado com sucesso!');
       Close;
     end
end;

procedure TfrmAjustEstoq.btbtnFechClick(Sender: TObject);
begin
   DMBusiness.ibdtstAjustEstoq.Cancel;
   DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
   Close;
end;

procedure TfrmAjustEstoq.FormShow(Sender: TObject);
begin
// DMBusiness.ibdtstAjustEstoq.Open;
// DMBusiness.ibdtstAjustEstoq.Insert;
// DBLookupComboBox3.SetFocus;
end;

procedure TfrmAjustEstoq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DMBusiness.ibdtstAjustEstoq.Cancel;
// DMBusiness.ibtrnsctnBusiness.RollbackRetaining;
 DMBusiness.ibdtstAjustEstoq.Close;
end;

procedure TfrmAjustEstoq.DBEdit4Exit(Sender: TObject);
begin
  DMBusiness.ibdtstAjustEstoqQTDEFINAL.Value := DMBusiness.ibdtstAjustEstoqQTDEATUAL.Value + DMBusiness.ibdtstAjustEstoqQTDENOVA.Value;
end;

procedure TfrmAjustEstoq.DBEdit1Exit(Sender: TObject);
begin
if DMBusiness.ibdtstProduto.Locate('cod', DBEdit1.Text,[loPartialKey]) then
   begin
    DMBusiness.ibdtstAjustEstoqQTDEATUAL.Value := DMBusiness.ibdtstAjustEstoqLookProdQtde.Value;
    DMBusiness.ibdtstAjustEstoqDTAJUST.Value := date+Time;
   end
  else ShowMessage('Produto não encontrado!');

end;

initialization
  FormFunction.RegisterForm('frmAjustEstoq', TfrmAjustEstoq);

end.
