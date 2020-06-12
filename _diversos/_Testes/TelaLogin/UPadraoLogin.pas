unit UPadraoLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoAbertura, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmPadraoLogin = class(TFrmPadraoAbertura)
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    lblEmpresa: TLabel;
    cmbEmpresa: TComboBox;
    btnEntrar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
    shpUsuario : TShape;
    procedure Destacar(const aDestaque : Boolean);
  public
    { Public declarations }
  end;

var
  FrmPadraoLogin: TFrmPadraoLogin;

implementation

{$R *.dfm}


procedure TFrmPadraoLogin.btnEntrarClick(Sender: TObject);
begin
  inherited;
  Destacar(True);
end;

procedure TFrmPadraoLogin.Destacar(const aDestaque: Boolean);
var
  aUsuario ,
  aSenha   : String;
begin
  aUsuario := edtUsuario.Text;
  aSenha   := edtSenha.Text;

  lblUsuario.Font.Color := $000E4C28;
  lblSenha.Font.Color   := $000E4C28;
  lblEmpresa.Font.Color := $000E4C28;

  if aDestaque then
  begin
    if (aUsuario.Trim() = EmptyStr) then lblUsuario.Font.Color := clRed;
    if (aSenha.Trim() = EmptyStr) then lblSenha.Font.Color := clRed;
    if (cmbEmpresa.ItemIndex < 0) then lblEmpresa.Font.Color := clRed;
  end;
end;

procedure TFrmPadraoLogin.FormActivate(Sender: TObject);
begin
  inherited;
  edtUsuario.SetFocus;
end;

procedure TFrmPadraoLogin.FormCreate(Sender: TObject);
begin
  CriarMoldura := True;
  CriarLinhasInferiores := False;

  inherited;
end;

procedure TFrmPadraoLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TFrmPadraoLogin.FormShow(Sender: TObject);
begin
  inherited;
  Self.BringToFront;
  Self.Activate;
end;

end.
