unit UGeEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, UGrPadraoLogin, dxGDIPlusClasses;

type
  TFrmEfetuarLogin = class(TfrmGrPadraoLogin)
    procedure FormShow(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EfetuarLogin : Boolean; overload;
  end;

var
  FrmEfetuarLogin: TFrmEfetuarLogin;

implementation

uses
  UDMBusiness, UPrinc, UFuncoes, UGrUsuario;

{$R *.dfm}

function TFrmEfetuarLogin.EfetuarLogin: Boolean;
var
  vSenha : TStringField;
  sSenha : String;
  bReturn : Boolean;
begin
  bReturn := False;

  try

    if not DMBusiness.ibdtstUsers.Locate('NOME', edNome.Text, []) then
    begin
      pnlMensagem.Caption := 'Entrada recusada ... USUÁRIO DESCONHECIDO!';

      if ( Contador >= 3 ) then
        frmPrinc.Close;

      edNome.SetFocus;
      Exit;
    end;

    vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;
    sSenha := GetSenhaFormatada(Senha);

    if (vSenha.Value = edSenha.Text) or (vSenha.Value = sSenha) then
    begin
      frmPrinc.Enabled := True;
      frmPrinc.stbMain.Panels[1].Text := AnsiLowerCase(edNome.Text + '@' + DMBusiness.ibdtbsBusiness.DatabaseName);
      frmPrinc.FormActivate( Application );

      bReturn := True;
    end
    else
    begin

      pnlMensagem.Caption := 'Entrada recusada ... SENHA INVÁLIDA!';

      if Contador = 3 then
        frmPrinc.close;

      edSenha.setfocus;
      Exit;

    end;

  finally
    Result := bReturn;
  end;
end;

procedure TFrmEfetuarLogin.FormShow(Sender: TObject);
begin
  inherited;
  if ( DelphiIsRunning ) then
  begin
    Usuario := 'ISAQUE';
    Senha   := 'admin';

    BtnEntrar.SetFocus;
  end;
end;

procedure TFrmEfetuarLogin.BtnEntrarClick(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := 'CNPJ: ' + StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := 'CPF: ' + StrFormatarCpf(gLicencaSistema.CNPJ);

//  inherited;

  if EfetuarLogin then
  begin
    SetEmpresaIDDefault( Empresa );

    gUsuarioLogado.Login    := GetUserApp;
    gUsuarioLogado.Nome     := GetUserFullName;
    gUsuarioLogado.Funcao   := GetUserFunctionID;
    gUsuarioLogado.Empresa  := Empresa;
    gUsuarioLogado.Vendedor := GetUserCodigoVendedorID;

    if (StrFormatarCnpj(GetEmpresaIDDefault) = StrFormatarCnpj(gLicencaSistema.CNPJ)) then
      frmPrinc.stbMain.Panels.Items[2].Text  := Format('Licenciado a empresa %s, %s', [gLicencaSistema.Empresa, sCNPJ])
    else
      frmPrinc.stbMain.Panels.Items[2].Text  := Format('[%s] Licenciado a empresa %s, %s', [GetEmpresaNomeDefault, gLicencaSistema.Empresa, sCNPJ]);

    ModalResult := mrOk;
  end
  else
    Contador := Contador + 1; //Inc(Contador);
end;

initialization
  FormFunction.RegisterForm('FrmEfetuarLogin', TFrmEfetuarLogin);

end.
