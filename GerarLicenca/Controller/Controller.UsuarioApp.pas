unit Controller.UsuarioApp;

interface

uses
  System.SysUtils,
  Firebase,
  Controller.Interfaces,
  Model.Usuario;

type
  TControllerUsuarioApp = class(TInterfacedObject, IControllerUsuario<TControllerUsuarioApp>)
    private
      FUsuario : TUsuario<TControllerUsuarioApp>;
      FCodeProject,
      FApiKey  : String;
      FExpired : TDateTime;
      FError   : String;
      FFBRealTime : TFBRealTime;
      procedure ConfigFBRealTime;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerUsuario<TControllerUsuarioApp>;

      function Entity : TUsuario<TControllerUsuarioApp>;
      function CodeProject(Value : String) : IControllerUsuario<TControllerUsuarioApp>;
      function ApiKey(Value : String) : IControllerUsuario<TControllerUsuarioApp>;
      function Auth : IControllerUsuario<TControllerUsuarioApp>;
      function RegisterAccount : IControllerUsuario<TControllerUsuarioApp>;
      function AccountRegistered : IControllerUsuario<TControllerUsuarioApp>;
      function Expired : TDateTime;
      function Error : String;

      procedure RefreshToken;
  end;

implementation

uses
  System.JSON,
  System.DateUtils,
  Firebase.Realtime;
//
//  Firebase.Interfaces,
//  Firebase.Auth,
//  Firebase.Request,
//  Firebase.Response;

{ TControllerUsuarioApp }

function TControllerUsuarioApp.AccountRegistered: IControllerUsuario<TControllerUsuarioApp>;
var
  aResponse : IFirebaseResponse;
  aJson     ,
  aRetorno  : TJSONValue;
begin
  try
    Result := Self;
    FError := EmptyStr;

    FUsuario.Registered(False);
    try
      ConfigFBRealTime;
      aResponse := FFBRealTime.Authentication.EmailPassword.LoginWithEmailAndPassword(FUsuario.Email, FUsuario.Passwd);
      aJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(aResponse.ContentAsString), 0);

      if aJson.TryGetValue('error', aRetorno) then
        raise Exception.Create(aRetorno.GetValue<String>('message'))
      else
        FUsuario
          .doc( aJson.GetValue<String>('localId') )
          .Registered( aJson.GetValue<Boolean>('registered') );
    except
      On E : Exception do
      begin
        if (E.Message = 'INVALID_EMAIL') then
          FError := 'O endereço de e-mail está formatado incorretamente'
        else
        if (E.Message = 'INVALID_PASSWORD') then
          FError := 'A senha da conta não corresponde'
        else
        if (E.Message = 'EMAIL_NOT_FOUND') then
          FError := EmptyStr // 'Não há registro de usuário correspondente a este identificador'
        else
          FError := E.Message;
      end;
    end;
  finally
    if Assigned(aJson) then
      aJson.DisposeOf;
  end;
end;

function TControllerUsuarioApp.ApiKey(Value: String): IControllerUsuario<TControllerUsuarioApp>;
begin
  Result  := Self;
  FApiKey := Value.Trim;
end;

function TControllerUsuarioApp.Auth: IControllerUsuario<TControllerUsuarioApp>;
var
  aResponse : IFirebaseResponse;
  aJson : TJSONValue;
begin
  try
    Result := Self;
    try
      ConfigFBRealTime;

      aResponse := FFBRealTime.Authentication.EmailPassword.LoginWithEmailAndPassword(FUsuario.Email, FUsuario.Passwd);
      aJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(aResponse.ContentAsString), 0);

      FUsuario
        .doc( aJson.GetValue<String>('localId') )
        .Email( aJson.GetValue<String>('email') )
        .DisplayName( aJson.GetValue<String>('displayName') )
        .Registered( aJson.GetValue<Boolean>('registered') )
        .TokenID( aJson.GetValue<String>('idToken') )
        .RefreshToken( aJson.GetValue<String>('refreshToken') )
        .ExpiresIn( aJson.GetValue<Integer>('expiresIn') );

      FExpired := IncSecond(FExpired, FUsuario.ExpiresIn);
    except
      On E : Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    if Assigned(aJson) then
      aJson.DisposeOf;
  end;
end;

function TControllerUsuarioApp.CodeProject(Value: String): IControllerUsuario<TControllerUsuarioApp>;
begin
  Result := Self;
  FCodeProject := Value.Trim;
end;

procedure TControllerUsuarioApp.ConfigFBRealTime;
begin
  if (not Assigned(FFBRealTime)) then
    FFBRealTime := TFBRealTime.Create(nil);

  FFBRealTime.ProjectCode := FCodeProject;
  FFBRealTime.Authentication.EmailPassword.ApiKey   := FApiKey;
  FFBRealTime.Authentication.EmailPassword.Email    := FUsuario.Email;
  FFBRealTime.Authentication.EmailPassword.Password := FUsuario.Passwd;
end;

constructor TControllerUsuarioApp.Create;
begin
  FUsuario := TUsuario<TControllerUsuarioApp>.New(Self);
  FError   := EmptyStr;
  FFBRealTime := TFBRealTime.Create(nil);
end;

destructor TControllerUsuarioApp.Destroy;
begin
  FUsuario.DisposeOf;
  FFBRealTime.DisposeOf;
  inherited;
end;

class function TControllerUsuarioApp.New: IControllerUsuario<TControllerUsuarioApp>;
begin
  Result := Self.Create;
end;

procedure TControllerUsuarioApp.RefreshToken;
begin
  if (Now > FExpired) then
    Self.Auth;
end;

function TControllerUsuarioApp.RegisterAccount: IControllerUsuario<TControllerUsuarioApp>;
var
  aResponse : IFirebaseResponse;
  aJson     ,
  aRetorno  : TJSONValue;
begin
  try
    Result := Self;
    FError := EmptyStr;
    try
      ConfigFBRealTime;

      aResponse := FFBRealTime.Authentication.EmailPassword.CreateUserWithEmailAndPassword(FUsuario.Email, FUsuario.Passwd);
      aJson := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(aResponse.ContentAsString), 0);

      if aJson.TryGetValue('error', aRetorno) then
        raise Exception.Create(aRetorno.GetValue<String>('message'))
      else
        FUsuario
          .doc( aJson.GetValue<String>('localId') )
          .Registered( True );
    except
      On E : Exception do
      begin
        if (E.Message = 'INVALID_EMAIL') then
          FError := 'O endereço de e-mail está formatado incorretamente'
        else
        if (E.Message = 'EMAIL_EXISTS') then
          FError := 'O endereço de e-mail já está sendo usado por outra conta'
        else
        if (E.Message = 'INVALID_ID_TOKEN') then
          FError := 'A credencial do usuário não é mais válida. O usuário deve entrar novamente'
        else
        if (E.Message = 'WEAK_PASSWORD') then
          FError := 'Sua senha deve possuir, no mínimo, 6 caracteres'
        else
          FError := E.Message;
      end;
    end;
  finally
    if Assigned(aJson) then
      aJson.DisposeOf;
  end;
end;

function TControllerUsuarioApp.Entity: TUsuario<TControllerUsuarioApp>;
begin
  Result := FUsuario;
end;

function TControllerUsuarioApp.Error: String;
begin
  Result := FError.Trim;
end;

function TControllerUsuarioApp.Expired: TDateTime;
begin
  Result := FExpired;
end;

end.
