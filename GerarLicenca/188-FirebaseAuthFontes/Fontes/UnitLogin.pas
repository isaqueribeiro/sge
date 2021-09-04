unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Objects,

  System.JSON,
  Firebase.Auth,
  Firebase.Interfaces,
  Firebase.Request,
  Firebase.Response, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    edt_login_email: TEdit;
    edt_login_senha: TEdit;
    rect_login: TRectangle;
    Label1: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    lbl_esqueci: TLabel;
    rect_criar_conta: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure rect_criar_contaClick(Sender: TObject);
    procedure rect_loginClick(Sender: TObject);
    procedure lbl_esqueciClick(Sender: TObject);
  private
    function CreateAccount(email, senha: string; out idUsuario,
      erro: string): boolean;
    function ErrorMessages(erro: string): string;
    function LoginAccount(email, senha: string; out idUsuario,
      erro: string): boolean;
    function ResetPassword(email: string; out erro: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  api_firebase = 'COLOQUE A SUA API AQUI...';

implementation

{$R *.fmx}

function TForm1.ErrorMessages(erro: string): string;
begin
    erro := erro.Replace('EMAIL_NOT_FOUND', 'Email não encontrado');
    erro := erro.Replace('INVALID_PASSWORD', 'Senha inválida');
    erro := erro.Replace('INVALID_EMAIL', 'Email inválido');
    erro := erro.Replace('MISSING_PASSWORD', 'Informe a senha');
    erro := erro.Replace('MISSING_EMAIL', 'Informe o email');
    erro := erro.Replace('WEAK_PASSWORD', 'Senha fraca');
    erro := erro.Replace('EMAIL_EXISTS', 'Email já existe');

    Result := erro;
end;

function TForm1.CreateAccount(email, senha: string;
                              out idUsuario, erro: string): boolean;
var
    fbAuth : IFirebaseAuth;
    resp : IFirebaseResponse;
    json, jsonRet : TJSONObject;
    jsonValue : TJSONValue;
begin
    try
        erro := '';
        fbAuth := TFirebaseAuth.Create;
        fbAuth.SetApiKey(api_firebase);

        resp := fbAuth.CreateUserWithEmailAndPassword(email, senha);

        try
            json := TJSONObject.ParseJSONValue(
                            TEncoding.UTF8.GetBytes(resp.ContentAsString), 0) as TJSONObject;

            if NOT Assigned(json) then
            begin
                Result := false;
                erro := 'Não foi possível verificar o retorno do servidor (JSON inválido)';
                exit;
            end;

        except on ex:exception do
            begin
                Result := false;
                erro := ex.Message;
                exit;
            end;
        end;

        Memo1.Lines.Add(resp.ContentAsString);

        if json.TryGetValue('error', jsonRet) then
        begin
            erro := jsonRet.Values['message'].Value;
            Result := false;
        end
        else if json.TryGetValue('localId', jsonValue) then
        begin
            idUsuario := jsonValue.Value;
            Result := true;
        end
        else
        begin
            erro := 'Retorno desconhecido';
            Result := false;
        end;

        erro := ErrorMessages(erro);

    finally
        if Assigned(json) then
            json.DisposeOf;
    end;
end;

function TForm1.LoginAccount(email, senha: string;
                              out idUsuario, erro: string): boolean;
var
    fbAuth : IFirebaseAuth;
    resp : IFirebaseResponse;
    json, jsonRet : TJSONObject;
    jsonValue : TJSONValue;
begin
    try
        erro := '';
        fbAuth := TFirebaseAuth.Create;
        fbAuth.SetApiKey(api_firebase);

        resp := fbAuth.SignInWithEmailAndPassword(email, senha);

        try
            json := TJSONObject.ParseJSONValue(
                            TEncoding.UTF8.GetBytes(resp.ContentAsString), 0) as TJSONObject;

            if NOT Assigned(json) then
            begin
                Result := false;
                erro := 'Não foi possível verificar o retorno do servidor (JSON inválido)';
                exit;
            end;

        except on ex:exception do
            begin
                Result := false;
                erro := ex.Message;
                exit;
            end;
        end;

        Memo1.Lines.Add(resp.ContentAsString);

        if json.TryGetValue('error', jsonRet) then
        begin
            erro := jsonRet.Values['message'].Value;
            Result := false;
        end
        else if json.TryGetValue('localId', jsonValue) then
        begin
            idUsuario := jsonValue.Value;
            Result := true;
        end
        else
        begin
            erro := 'Retorno desconhecido';
            Result := false;
        end;

        erro := ErrorMessages(erro);

    finally
        if Assigned(json) then
            json.DisposeOf;
    end;
end;

function TForm1.ResetPassword(email: string;
                              out erro: string): boolean;
var
    fbAuth : IFirebaseAuth;
    resp : IFirebaseResponse;
    json, jsonRet : TJSONObject;
    jsonValue : TJSONValue;
begin
    try
        erro := '';
        fbAuth := TFirebaseAuth.Create;
        fbAuth.SetApiKey(api_firebase);

        resp := fbAuth.SendResetPassword(email);

        try
            json := TJSONObject.ParseJSONValue(
                            TEncoding.UTF8.GetBytes(resp.ContentAsString), 0) as TJSONObject;

            if NOT Assigned(json) then
            begin
                Result := false;
                erro := 'Não foi possível verificar o retorno do servidor (JSON inválido)';
                exit;
            end;

        except on ex:exception do
            begin
                Result := false;
                erro := ex.Message;
                exit;
            end;
        end;

        Memo1.Lines.Add(resp.ContentAsString);

        if json.TryGetValue('error', jsonRet) then
        begin
            erro := jsonRet.Values['message'].Value;
            Result := false;
        end
        else if json.TryGetValue('email', jsonValue) then
            Result := true
        else
        begin
            erro := 'Retorno desconhecido';
            Result := false;
        end;

        erro := ErrorMessages(erro);

    finally
        if Assigned(json) then
            json.DisposeOf;
    end;
end;


procedure TForm1.rect_criar_contaClick(Sender: TObject);
var
    idUsuario, erro : string;
begin
    if NOT CreateAccount(edt_login_email.Text,
                         edt_login_senha.Text,
                         idUsuario,
                         erro) then
        showmessage(erro)
    else
        showmessage('Conta criada com sucesso: ' + idUsuario);

end;

procedure TForm1.rect_loginClick(Sender: TObject);
var
    idUsuario, erro : string;
begin
    if NOT LoginAccount(edt_login_email.Text,
                        edt_login_senha.Text,
                        idUsuario,
                        erro) then
        showmessage(erro)
    else
        showmessage('Login OK: ' + idUsuario);
end;

procedure TForm1.lbl_esqueciClick(Sender: TObject);
var
    idUsuario, erro : string;
begin
    if NOT ResetPassword(edt_login_email.Text,
                         erro) then
        showmessage(erro)
    else
        showmessage('Link para redefinição de senha enviado no seu email');

end;

end.
