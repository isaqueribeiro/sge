unit Controller.Licenca;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IniFiles,
  Classe.Licenca,
  Interacao.Licenca,

  Controller.Interfaces,
  Controller.UsuarioApp,
  Controller.ClienteApp,
  Controller.FactoryApp,

  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Licenca;

type
  TLicencaController = class(TInterfacedObject, ILicenca)
    strict private
      class var _instance : ILicenca;
    private
      [weak]
      FModel  : ILicencaModel;
      FUser   : IControllerUsuario<TControllerUsuarioApp>;
      FClient : IControllerCliente<TControllerClienteApp>;
      FFile   : TStringList;
      FCnpjArquivo     ,
      FLinhaCompetencia,
      FLinhaBloqueio   ,
      FTokenGoogleAuth : String;
      FExecutando : Boolean;

      procedure CarregarDados;
      procedure GravarDadosEmpresa;

      procedure Autenticar;
      procedure Autenticando;
      procedure Autenticado(Sender : TObject);

      procedure Sincronizar;
      procedure Sincronizando;
      procedure Sincronizado(Sender : TObject);

      function LicencaValida(aFileName : TFileName) : Boolean;

      const
        API_CODE_PROJECT_USER     = 'applicencaagil';
        API_CODE_PROJECT_REALTIME = 'applicencaagil-default-rtdb';
        //API_FIREBASE = 'AIzaSyDK44Zi7G3m9wDM9sbgQb8FqG-BlDbpa-A';
        API_FIREBASE = 'AIzaSyBMS-N5IC18h3sEmKvsazfYWz8x2Bj8Rrg';
    public
      constructor Create;
      destructor Destroy; override;

      procedure LimparLicenca;

      function Carregar(aFileName : TFileName) : ILicenca; overload;
      function Carregar : ILicenca; overload;

      function Model : ILicencaModel;
      function Empresa : String;
      function NomeFantasia : String;
      function CNPJ : String;
      function DataBloqueio : TDateTime;
      function Competencia : Integer;
      function UsarSGE : Boolean;
      function UsarSGI : Boolean;
      function UsarSGF : Boolean;
      function UsarSGO : Boolean;
      function GetCNPJArquivo(aFileName : TFileName) : String;
      function TokenGoogleAuth : String;

      class function GetInstance() : ILicenca;
  end;

implementation

uses
  UConstantesDGE,
  Service.Encript,
  Service.Utils,
  Model.Constantes,
  SGE.Controller.Interfaces,
  SGE.Controller.Factory;

{ TLicencaController }

function TLicencaController.GetCNPJArquivo(aFileName: TFileName): String;
begin
  Self.LicencaValida(aFileName);
  Result := FCnpjArquivo;
end;

class function TLicencaController.GetInstance: ILicenca;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

procedure TLicencaController.GravarDadosEmpresa;
var
  aEmpresa      ,
  aConfiguracao : IControllerCustom;
  aCompetencia ,
  aDataBloqueio: String;
  aLicenca : IModelDAOCustom;
const
  UPDATE_LICENCA = 'Update SYS_LICENCA lc Set lc.linha_controle = ''%s'' where (lc.linha_controle = ''%s'')';
begin
  aEmpresa := TControllerFactory.New.Empresa;
  aConfiguracao := TControllerFactory.New.ConfiguracaoEmpresa;

  // Atualizar registro da empresa
  if (not FModel.CNPJ.IsEmpty) then
  begin
    aEmpresa
      .DAO
      .Close
      .ClearWhere;

    aEmpresa
      .DAO
      .Open;

    if (not aEmpresa.DAO.DataSet.Locate('cnpj', TServicesUtils.StrOnlyNumbers(FModel.CNPJ), [])) then
    begin
      aEmpresa.DAO.DataSet.Append;
      aEmpresa.DAO.DataSet.FieldByName('Email').AsString := FModel.Email;
      aEmpresa.DAO.DataSet.FieldByName('Usuario').AsString := CONST_MODEL_USER_APP;
    end
    else
      aEmpresa.DAO.DataSet.Edit;

    aEmpresa.DAO.DataSet.FieldByName('Pessoa_fisica').AsInteger := 0;
    aEmpresa.DAO.DataSet.FieldByName('Cnpj').AsString   := TServicesUtils.StrOnlyNumbers(FModel.CNPJ);
    aEmpresa.DAO.DataSet.FieldByName('Rzsoc').AsString  := FModel.Empresa;
    aEmpresa.DAO.DataSet.FieldByName('Nmfant').AsString := FModel.NomeFantasia;
    aEmpresa.DAO.DataSet.FieldByName('Ender').AsString  := FModel.Endereco;
    aEmpresa.DAO.DataSet.FieldByName('Numero_end').AsString := FModel.Numero;
    aEmpresa.DAO.DataSet.FieldByName('Bairro').AsString := FModel.Bairro;
    aEmpresa.DAO.DataSet.FieldByName('Cep').AsString    := TServicesUtils.StrOnlyNumbers(FModel.CEP);
    aEmpresa.DAO.DataSet.FieldByName('Cidade').AsString := FModel.Cidade;
    aEmpresa.DAO.DataSet.FieldByName('Uf').AsString     := FModel.UF;

    aEmpresa.DAO.DataSet.Post;

    aEmpresa.DAO.ApplyUpdates;
    aEmpresa.DAO.CommitUpdates;

    aConfiguracao
      .DAO
      .Close
      .ClearWhere;

    aConfiguracao
      .DAO
      .Open;

    // Gerar as configurações iniciais, caso não existam
    if (not aConfiguracao.DAO.DataSet.Locate('empresa', TServicesUtils.StrOnlyNumbers(FModel.CNPJ), [])) then
    begin
      aConfiguracao.DAO.DataSet.Append;
      aConfiguracao.DAO.DataSet.FieldByName('empresa').AsString     := TServicesUtils.StrOnlyNumbers(FModel.CNPJ);
      aConfiguracao.DAO.DataSet.FieldByName('email_conta').AsString := CONST_CONFIG_SYSTEM_ACCOUNT_USER;
      aConfiguracao.DAO.DataSet.FieldByName('email_senha').AsString := CONST_CONFIG_SYSTEM_ACCOUNT_PWD;
      aConfiguracao.DAO.DataSet.FieldByName('email_pop').AsString   := CONST_CONFIG_SYSTEM_ACCOUNT_POP;
      aConfiguracao.DAO.DataSet.FieldByName('email_smtp').AsString  := CONST_CONFIG_SYSTEM_ACCOUNT_SMTP;
      aConfiguracao.DAO.DataSet.FieldByName('email_smtp_porta').AsInteger := CONST_CONFIG_SYSTEM_ACCOUNT_PORT;
      aConfiguracao.DAO.DataSet.FieldByName('email_requer_autenticacao').AsInteger := CONST_CONFIG_SYSTEM_ACCOUNT_AUTH;
      aConfiguracao.DAO.DataSet.FieldByName('email_conexao_ssl').AsInteger         := CONST_CONFIG_SYSTEM_ACCOUNT_SSL;

      aConfiguracao.DAO.DataSet.FieldByName('Usuario').AsString := CONST_MODEL_USER_APP;
      aConfiguracao.DAO.DataSet.Post;

      aConfiguracao.DAO.ApplyUpdates;
      aConfiguracao.DAO.CommitUpdates;
    end;

    // Atualizar a Licença de Uso
    if (not FLinhaCompetencia.Trim.IsEmpty) and (not FLinhaBloqueio.Trim.IsEmpty) then
    begin
      aLicenca := TModelDAOLicencaSystem.New;
      // -- Atualizar competência
      aCompetencia := TServiceEncript.Encript('edCompetencia=' + IntToStr(FModel.Competencia), SYS_PASSWD_KEY);
      aLicenca.ExecuteScriptSQL(Format(UPDATE_LICENCA, [aCompetencia, FLinhaCompetencia]));
      // -- Atualizar bloqueio
      aDataBloqueio := TServiceEncript.Encript('edDataBloqueio=' + FormatDateTime('dd/mm/yyyy', FModel.DataBloqueio), SYS_PASSWD_KEY);
      aLicenca.ExecuteScriptSQL(Format(UPDATE_LICENCA, [aDataBloqueio, FLinhaBloqueio]));
    end;
  end;
end;

procedure TLicencaController.Autenticado(Sender: TObject);
begin
  FExecutando := False;

  if (Sender is TThread) then
  begin
//    if Assigned(TThread(Sender).FatalException) then
//      raise Exception.Create('Erro ao tentar autenticar a aplicação no Servidor Web de licenças.' + #13 + Exception(TThread(Sender).FatalException).Message)
//    else
//    begin
//      FTokenGoogleAuth := FUser.Entity.TokenID;
//      if FUser.Entity.Registered then
//        Sincronizar;
//    end;
    if not Assigned(TThread(Sender).FatalException) then
    begin
      FTokenGoogleAuth := FUser.Entity.TokenID;
      if FUser.Entity.Registered then
        Sincronizar;
    end;
  end;
end;

procedure TLicencaController.Autenticando;
begin
  if (not FTokenGoogleAuth.IsEmpty) and (FUser.Expired > Now) then
    FUser
      .CodeProject(API_CODE_PROJECT_USER)
      .ApiKey(API_FIREBASE)
      .RefreshToken
  else
    FUser
      .CodeProject(API_CODE_PROJECT_USER)
      .ApiKey(API_FIREBASE)
      .Entity
        .Email(FModel.Email)
        .Passwd(TServicesUtils.StrOnlyNumbers(FModel.CNPJ) + '@pwd')
      .&End
      .Auth;
end;

procedure TLicencaController.Autenticar;
var
  aThread : TThread;
begin
  if FExecutando then
    Exit;

  if not Assigned(FUser) then
    FUser := TControllerFactoryApp.New.Usuario;

  FExecutando := True;

  aThread := TThread.CreateAnonymousThread(Autenticando);
  aThread.OnTerminate := Autenticado;
  aThread.Start;
end;

function TLicencaController.Carregar: ILicenca;
begin
  Result := Self;
  Self.CarregarDados();
end;

procedure TLicencaController.CarregarDados;
var
  aIni : TIniFile;
  aDao : IModelDAOCustom;
  I : Integer;
  aData ,
  aUUID : String;
begin
  aIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '_temp.ini');
  try
    // Recuperar arquivo criptografado da base de dados
    FFile.BeginUpdate;
    FFile.Clear;
    FFile.Add('[Licenca]');

    aDao := TModelDAOLicencaSystem.New;
    aDao.Open;

    while (not aDao.DataSet.Eof) do
    begin
      // Descriptografar dado
      aData := TServiceEncript.Decript(aDao.DataSet.FieldByName('linha_controle').AsString, SYS_PASSWD_KEY);

      if (Pos('Competencia=', aData) > 0) then
        FLinhaCompetencia := aDao.DataSet.FieldByName('linha_controle').AsString;

      if (Pos('DataBloqueio=', aData) > 0) then
        FLinhaBloqueio := aDao.DataSet.FieldByName('linha_controle').AsString;

      if (aData.Trim.ToUpper <> FFile.Strings[0].Trim.ToUpper) then
        FFile.Add(aData);

      aDao.DataSet.Next;
    end;

    FFile.EndUpdate;
    FFile.SaveToFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');

    // Recuperar dados
    aUUID := aIni.ReadString('Licenca', 'edUUID', TGUID.Empty.ToString);

    FModel
      .doc( aIni.ReadString('Licenca', 'doc',  '') )
      .UUID( StringToGUID(aUUID) )
      .Empresa( aIni.ReadString('Licenca', 'edEmpresa',  '') )
      .NomeFantasia( aIni.ReadString('Licenca', 'edFantasia',  '') )
      .CNPJ( aIni.ReadString('Licenca', 'edCGC',      '') )
      .Email( aIni.ReadString('Licenca', 'edEmail', '') )
      .Endereco( aIni.ReadString('Licenca', 'edEndereco', '') )
      .Numero( aIni.ReadString('Licenca', 'edNumero', 'S/N') )
      .Bairro( aIni.ReadString('Licenca', 'edBairro',   '') )
      .Cidade( aIni.ReadString('Licenca', 'edCidade',   '') )
      .UF( aIni.ReadString('Licenca', 'edUF',       '') )
      .CEP( aIni.ReadString('Licenca', 'edCEP',      '') )
      .Competencia( StrToIntDef(aIni.ReadString('Licenca', 'edCompetencia', FormatDateTime('yyyymm', Date + 30)), 0) )
      .DataBloqueio( aIni.ReadDateTime('Licenca', 'edDataBloqueio', Date + 45) )
      .UsarSGE( aIni.ReadBool('Licenca', 'chkSGE', False) )
      .UsarSGI( aIni.ReadBool('Licenca', 'chkSGI', False) )
      .UsarSGF( aIni.ReadBool('Licenca', 'chkSGF', False) )
      .UsarSGO( aIni.ReadBool('Licenca', 'chkSGO', False) );

    // Buscar dados atualizados da licença no FireBase RealTime através do "FModel.doc"
    if (not FModel.Email.IsEmpty) and (not FModel.doc.IsEmpty) then
      Autenticar;
  finally
    aDao.Close;
    aIni.DisposeOf;

    DeleteFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');
  end;
end;

function TLicencaController.CNPJ: String;
begin
  Result := FModel.CNPJ;
end;

function TLicencaController.Competencia: Integer;
begin
  Result := FModel.Competencia;
end;

function TLicencaController.Carregar(aFileName: TFileName): ILicenca;
var
  aDao : IModelDAOCustom;
  I : Integer;
begin
  Result := Self;
  Self.CarregarDados();

  if (not FModel.IsEmpty) and FileExists(aFileName) then
    if (not LicencaValida(aFileName)) then
      raise Exception.Create('Licença inválida!');

  // Carregar novos dados da licença a partir do arqivo informado
  if FileExists(aFileName) then
  begin
    Self.LimparLicenca;

    FFile.Clear;
    FFile.LoadFromFile(aFileName);

    aDao := TModelDAOLicencaSystem.New;
    aDao.Open;

    for I := 0 to FFile.Count - 1 do
    begin
      aDao.DataSet.Append;
      aDao.DataSet.FieldByName('linha_controle').AsString := FFile.Strings[I];
      aDao.DataSet.Post;
    end;

    aDao.ApplyUpdates;
    aDao.CommitTransaction;
    aDao.Close;

    Self.CarregarDados();
  end;
end;

constructor TLicencaController.Create;
begin
  FModel := TLicenca.New;
  FFile  := TStringList.Create;
  FCnpjArquivo     := EmptyStr;
  FTokenGoogleAuth := EmptyStr;
  FExecutando      := False;
  FLinhaCompetencia := EmptyStr;
  FLinhaBloqueio    := EmptyStr;
end;

function TLicencaController.DataBloqueio: TDateTime;
begin
  Result := FModel.DataBloqueio;
end;

destructor TLicencaController.Destroy;
begin
  FFile.DisposeOf;
  inherited;
end;

function TLicencaController.Empresa: String;
begin
  Result := FModel.Empresa;
end;

function TLicencaController.LicencaValida(aFileName: TFileName): Boolean;
var
  aFile : TSTringList;
  aIni  : TIniFile;
  I : Integer;
begin
  if FileExists(aFileName) then
  begin
    aFile := TSTringList.Create;
    aIni  := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '_temp.ini');
    FCnpjArquivo := EmptyStr;
    try
      aFile.Clear;
      aFile.LoadFromFile(aFileName);

      for I := 0 to aFile.Count - 1 do
        aFile.Strings[I] := TServiceEncript.Decript(aFile.Strings[I], SYS_PASSWD_KEY);

      aFile.SaveToFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');

      FCnpjArquivo := Trim(aIni.ReadString('Licenca', 'edCGC', EmptyStr));
    finally
      aIni.DisposeOf;
      aFile.DisposeOf;

      DeleteFile(ExtractFilePath(ParamStr(0)) + '_temp.ini');
    end;

    Result := (FCnpjArquivo = Self.CNPJ);
  end
  else
    Result := True;
end;

procedure TLicencaController.LimparLicenca;
begin
  TModelDAOLicencaSystem.New.ExecuteScriptSQL('Delete from SYS_LICENCA');
end;

function TLicencaController.Model: ILicencaModel;
begin
  Result := FModel;
end;

function TLicencaController.NomeFantasia: String;
begin
  Result := FModel.NomeFantasia;
end;

procedure TLicencaController.Sincronizado(Sender: TObject);
begin
  FExecutando := False;

  if (Sender is TThread) then
  begin
    if not Assigned(TThread(Sender).FatalException) then
    begin
      if FClient.Entity.Registered and (not FClient.Entity.Cnpj.IsEmpty) then
      begin
        FModel
          .UUID(FClient.Entity.UUID)
          .Empresa(FClient.Entity.Razao)
          .NomeFantasia(FClient.Entity.Fantasia)
          .CNPJ(TServicesUtils.StrOnlyNumbers(FClient.Entity.Cnpj))
          .Email(FClient.Entity.Email)
          .Endereco(FClient.Entity.Endereco.Logradouro)
          .Numero(FClient.Entity.Endereco.Numero)
          .Bairro(FClient.Entity.Endereco.Bairro)
          .Cidade(FClient.Entity.Endereco.Cidade)
          .UF(FClient.Entity.Endereco.UF)
          .CEP(TServicesUtils.StrOnlyNumbers(FClient.Entity.Endereco.Cep))
          .Competencia(FClient.Entity.Licenca.Competencia)
          .DataBloqueio(FClient.Entity.Licenca.Bloqueio)
          .UsarSGE(FClient.Entity.Licenca.Sistemas.SGE)
          .UsarSGO(FClient.Entity.Licenca.Sistemas.SGO)
          .UsarSGI(FClient.Entity.Licenca.Sistemas.SGI)
          .UsarSGF(FClient.Entity.Licenca.Sistemas.SGF);

        GravarDadosEmpresa;
      end;
    end;
  end;
end;

procedure TLicencaController.Sincronizando;
begin
  FClient
    .CodeProject(API_CODE_PROJECT_REALTIME)
    .Load(FTokenGoogleAuth, FModel.doc);
end;

procedure TLicencaController.Sincronizar;
var
  aThread : TThread;
begin
  if FExecutando then
    Exit;

  if not Assigned(FClient) then
    FClient := TControllerFactoryApp.New.Cliente;

  FExecutando := True;

  aThread := TThread.CreateAnonymousThread(Sincronizando);
  aThread.OnTerminate := Sincronizado;
  aThread.Start;
end;

function TLicencaController.TokenGoogleAuth: String;
begin
  Result := FTokenGoogleAuth;
end;

function TLicencaController.UsarSGE: Boolean;
begin
  Result := FModel.UsarSGE;
end;

function TLicencaController.UsarSGF: Boolean;
begin
  Result := FModel.UsarSGF;
end;

function TLicencaController.UsarSGI: Boolean;
begin
  Result := FModel.UsarSGI;
end;

function TLicencaController.UsarSGO: Boolean;
begin
  Result := FModel.UsarSGO;
end;

end.
