unit Autenticacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Mask;

type
  TfrmAutenticacao = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    btnOk: TBitBtn;
    BitBtn4: TBitBtn;
    txtSenha: TMaskEdit;
    procedure BitBtn4Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutenticacao: TfrmAutenticacao;

implementation

uses Principal;

{$R *.dfm}

procedure TfrmAutenticacao.BitBtn4Click(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmAutenticacao.btnOkClick(Sender: TObject);
begin

   if txtSenha.Text = frmPrincipal.idsConfiguracaoSENHA.AsString then
   begin
      Self.Tag := 1;
      Self.Close;
   end
   else
   begin
      ShowMessage('Senha incorreta.');
   end;

end;

procedure TfrmAutenticacao.FormShow(Sender: TObject);
begin

  txtSenha.Clear;

end;

end.
