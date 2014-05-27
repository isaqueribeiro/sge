unit U_SenhaBaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  Tf_senhaBaixa = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_senhaBaixa: Tf_senhaBaixa;

implementation

uses UBxCP, UCdContPagar;

{$R *.dfm}

procedure Tf_senhaBaixa.BitBtn1Click(Sender: TObject);
begin
     if edit1.Text='america' then
       begin
     // btbtnatu.Enabled:=true;
        Application.CreateForm(TfrmCdContPagar, frmCdContPagar);
        frmcdcontpagar.DBEdit1.Enabled:=true;
        frmcdcontpagar.DBEdit4.Enabled:=true;
        frmcdcontpagar.DBEdit9.Enabled:=true;
        frmcdcontpagar.DBEdit3.Enabled:=true;
        frmcdcontpagar.DBEdit5.Enabled:=true;
        frmcdcontpagar.DBEdit6.Enabled:=true;
        frmcdcontpagar.DBEdit7.Enabled:=true;
        frmcdcontpagar.DBmemo1.Enabled:=true;
        frmcdcontpagar.DBcombobox1.Enabled:=true;
        frmcdcontpagar.DBlookupcombobox1.Enabled:=true;
       
        frmcdcontpagar.DBlookupcombobox3.Enabled:=true;
        frmCdContPagar.btbtnAtual.Enabled := True;
        frmCdContPagar.btbtnGrav.Enabled := False;
        frmCdContPagar.ShowModal;
         //    btbtndesb.Enabled:=false;
        frmCdContPagar.Destroy;
        f_senhaBaixa.Close;
      end
      else
       begin
       showmessage('Senha incorreta!');
       edit1.SetFocus;
       end;
end;

procedure Tf_senhaBaixa.FormShow(Sender: TObject);
begin
edit1.SetFocus;
Edit1.Clear;
end;

end.
