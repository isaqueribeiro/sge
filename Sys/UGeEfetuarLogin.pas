unit UGeEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, UGrPadraoLogin;

type
  TFrmEfetuarLogin = class(TfrmGrPadraoLogin)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EfetuarLogin : Boolean; overload;
  end;

var
  FrmEfetuarLogin: TFrmEfetuarLogin;

implementation

uses UDMBusiness, UPrinc;

{$R *.dfm}

function TFrmEfetuarLogin.EfetuarLogin: Boolean;
var
  vSenha  : TStringField;
  bReturn : Boolean;
begin
  bReturn := False;

  try

    if not DMBusiness.ibdtstUsers.Locate('NOME',edNome.Text,[]) then
    begin
      pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';

      if ( Contador >= 3 ) then
        frmPrinc.Close;

      edNome.SetFocus;
      Exit;
    end;

    vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;

    if vSenha.Value<>edSenha.Text then
    begin
      pnlMensagem.Caption:='Entrada recusada ... SENHA INVÁLIDA!';

      if ( Contador >= 3 ) then
        frmPrinc.Close;

      edSenha.SetFocus;
      Exit;
    end;

    frmPrinc.Enabled := True;
    frmPrinc.stbMain.Panels[1].Text := 'Usuário: ' + Usuario;

  finally
    Result := bReturn;
  end;
end;

procedure TFrmEfetuarLogin.FormCreate(Sender: TObject);
begin
  inherited;
  if ( DelphiIsRunning ) then
  begin
    Usuario := 'VIEIRA';
    Senha   := '12345';

    BtnEntrar.Click;
  end;
end;

initialization
  FormFunction.RegisterForm('FrmEfetuarLogin', TFrmEfetuarLogin);

end.
