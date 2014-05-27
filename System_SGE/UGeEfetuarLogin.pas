unit UGeEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, UGrPadraoLogin, dxGDIPlusClasses;

type
  TFrmEfetuarLogin = class(TfrmGrPadraoLogin)
    Shape1: TShape;
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

    if not DMBusiness.ibdtstUsers.Locate('NOME',edNome.Text,[]) then
    begin
      pnlMensagem.Caption:='Entrada recusada ... USUÁRIO DESCONHECIDO!';

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
      frmPrinc.stbMain.Panels[1].Text := 'Usuário: ' + edNome.Text;
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
begin
//  inherited;
  if EfetuarLogin then
  begin
    SetEmpresaIDDefault( Empresa );

    gUsuarioLogado.Login   := GetUserApp;
    gUsuarioLogado.Nome    := GetUserFullName;
    gUsuarioLogado.Funcao  := GetUserFunctionID;
    gUsuarioLogado.Empresa := Empresa;

    ModalResult := mrOk;
  end
  else
    Contador := Contador + 1; //Inc(Contador);
end;

initialization
  FormFunction.RegisterForm('FrmEfetuarLogin', TFrmEfetuarLogin);

end.
