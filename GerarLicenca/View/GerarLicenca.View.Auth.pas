unit GerarLicenca.View.Auth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  IViewAuth = interface
    ['{DB1125A1-58B5-40D5-B3C3-EC848E196D09}']
    function Autenticado(var aEmail, aSenha, aToken : String) : Boolean;
  end;

  TViewAuth = class(TForm, IViewAuth)
    PanelView: TPanel;
    PanelBody: TPanel;
    PanelHeader: TPanel;
    PanelFooter: TPanel;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function New(aOnwer : TComponent) : IViewAuth;

    function Autenticado(var aEmail, aSenha, aToken : String) : Boolean;
  end;

var
  ViewAuth: TViewAuth;

implementation

{$R *.dfm}

{ TViewAuth }

function TViewAuth.Autenticado(var aEmail, aSenha, aToken : String): Boolean;
begin
  Result := (Self.ShowModal = mrOk);
  if Result then
  begin
    aEmail := edtEmail.Text;
    aSenha := edtSenha.Text;
    aToken := edtSenha.Hint;
  end;
end;

procedure TViewAuth.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewAuth.btnConfirmarClick(Sender: TObject);
begin
  if Trim(edtEmail.Text).IsEmpty then
    Application.MessageBox('Informe seu e-mail!', 'Erro!', MB_ICONWARNING)
  else
  if Trim(edtSenha.Text).IsEmpty then
    Application.MessageBox('Informe sua senha!', 'Erro!', MB_ICONWARNING)
  else
    ModalResult := mrOk;
end;

procedure TViewAuth.FormCreate(Sender: TObject);
begin
  edtEmail.Text := EmptyStr;
  edtSenha.Text := EmptyStr;
  edtSenha.Hint := EmptyStr;
end;

procedure TViewAuth.FormShow(Sender: TObject);
begin
  edtEmail.Text := Trim(ParamStr(1));
  edtSenha.Text := Trim(ParamStr(2));
end;

class function TViewAuth.New(aOnwer: TComponent): IViewAuth;
begin
  Result := Self.Create(aOnwer);
end;

end.
