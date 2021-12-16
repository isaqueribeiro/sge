unit Controller.Usuario;

interface

uses
  System.SysUtils,
  Firebase,
  Controller.Interfaces,
  Model.Usuario;

type
  TControllerUsuario = class(TInterfacedObject, IControllerUsuario<TControllerUsuario>)
    private
      FUsuario : TUsuario<TControllerUsuario>;
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
      class function New : IControllerUsuario<TControllerUsuario>;

      function Entity : TUsuario<TControllerUsuario>;
      function CodeProject(Value : String) : IControllerUsuario<TControllerUsuario>;
      function ApiKey(Value : String) : IControllerUsuario<TControllerUsuario>;
      function Auth : IControllerUsuario<TControllerUsuario>;
      function RegisterAccount : IControllerUsuario<TControllerUsuario>;
      function AccountRegistered : IControllerUsuario<TControllerUsuario>;
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

{ TControllerUsuario }

function TControllerUsuario.AccountRegistered: IControllerUsuario<TControllerUsuario>;
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

function TControllerUsuario.ApiKey(Value: String): IControllerUsuario<TControllerUsuario>;
begin
  Result  := Self;
  FApiKey := Value.Trim;
end;

function TControllerUsuario.Auth: IControllerUsuario<TControllerUsuario>;
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

function TControllerUsuario.CodeProject(Value: String): IControllerUsuario<TControllerUsuario>;
begin
  Result := Self;
  FCodeProject := Value.Trim;
end;

procedure TControllerUsuario.ConfigFBRealTime;
begin
  if (not Assigned(FFBRealTime)) then
    FFBRealTime := TFBRealTime.Create(nil);

  FFBRealTime.ProjectCode := FCodeProject;
  FFBRealTime.Authentication.EmailPassword.ApiKey   := FApiKey;
  FFBRealTime.Authentication.EmailPassword.Email    := FUsuario.Email;
  FFBRealTime.Authentication.EmailPassword.Password := FUsuario.Passwd;
end;

constructor TControllerUsuario.Create;
begin
  FUsuario := TUsuario<TControllerUsuario>.New(Self);
  FError   := EmptyStr;
  FFBRealTime := TFBRealTime.Create(nil);
end;

destructor TControllerUsuario.Destroy;
begin
  FUsuario.DisposeOf;
  FFBRealTime.DisposeOf;
  inherited;
end;

class function TControllerUsuario.New: IControllerUsuario<TControllerUsuario>;
begin
  Result := Self.Create;
end;

procedure TControllerUsuario.RefreshToken;
begin
  if (Now > FExpired) then
    Self.Auth;
end;

function TControllerUsuario.RegisterAccount: IControllerUsuario<TControllerUsuario>;
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

function TControllerUsuario.Entity: TUsuario<TControllerUsuario>;
begin
  Result := FUsuario;
end;

function TControllerUsuario.Error: String;
begin
  Result := FError.Trim;
end;

function TControllerUsuario.Expired: TDateTime;
begin
  Result := FExpired;
end;

end.
