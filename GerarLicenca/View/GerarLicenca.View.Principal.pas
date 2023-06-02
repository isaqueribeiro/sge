unit GerarLicenca.View.Principal;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  XPMan,
  IniFiles,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdBaseComponent,
  dxGDIPlusClasses,

  Data.DB,
  Datasnap.DBClient,

  Controller.Interfaces,
  Controller.Usuario,
  Controller.Cliente,
  Controller.Factory;

type
  TViewPrincipal = class(TForm)
    lblEmpresa: TLabel;
    edEmpresa: TEdit;
    lblCGC: TLabel;
    edCGC: TEdit;
    lblEndereco: TLabel;
    edEndereco: TEdit;
    lblBairro: TLabel;
    edBairro: TEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    lblUF: TLabel;
    edUF: TEdit;
    lblCEP: TLabel;
    edCEP: TEdit;
    lblCompetencia: TLabel;
    edCompetencia: TEdit;
    Label7: TLabel;
    XPManifest: TXPManifest;
    opdLicenca: TOpenDialog;
    lblDataBloqueio: TLabel;
    edDataBloqueio: TEdit;
    chkSGE: TCheckBox;
    chkSGI: TCheckBox;
    chkSGF: TCheckBox;
    Label1: TLabel;
    ImgLogoEmpresa: TImage;
    chkSGO: TCheckBox;
    lblUUID: TLabel;
    edUUID: TEdit;
    lblEmail: TLabel;
    edEmail: TEdit;
    cdsClientes: TClientDataSet;
    dtsClientes: TDataSource;
    dbgClientes: TDBGrid;
    edTokenUserID: TEdit;
    lblNumero: TLabel;
    edNumero: TEdit;
    pnlBotoes: TPanel;
    BtnCarregarLicenca: TButton;
    BtnGerarLicenca: TButton;
    PnlEspaco: TPanel;
    lblFantasia: TLabel;
    edFantasia: TEdit;
    BtnNovaLicenca: TButton;
    lblSenhaAuthCliente: TLabel;
    procedure BtnCarregarLicencaClick(Sender: TObject);
    procedure BtnGerarLicencaClick(Sender: TObject);

    function EncriptSenha(const Value, Key : String) : String;
    function DecriptarSenha(const Value, Key : String) : String;
    function SomenteNumero(Value : String): String;
    function DataBloqueio : TDateTime;

    procedure edCompetenciaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure cdsClientescgcGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnNovaLicencaClick(Sender: TObject);
  private
    { Private declarations }
    FUser : IControllerUsuario<TControllerUsuario>;
    procedure CarregarLicenca(const sNomeArquivo : String);
    procedure GerarLicenca(const sNomeArquivo : String);

    function AuthServer(aFirstAuthentication : Boolean) : Boolean;
    function CreateCustomerAccount : Boolean;
    function CustomerAccountRegistered : Boolean;

    procedure CarregarListaClientes;
    procedure RegistrarCliente(aDocument, aGuidID : String);
    procedure CarregarCliente;
    procedure ClienteCarregado(Sender : TObject);
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

const
  API_CODE_PROJECT_USER     = 'applicencaagil';
  API_CODE_PROJECT_REALTIME = 'applicencaagil-default-rtdb';
  API_FIREBASE = 'AIzaSyDK44Zi7G3m9wDM9sbgQb8FqG-BlDbpa-A';

implementation

uses
  System.DateUtils,
  System.JSON,
  UConstantesDGE,
  Service.Utils,
  GerarLicenca.View.Auth;

{$R *.dfm}

procedure ShowMessageInformacao(sTitulo, sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), PChar(sTitulo), MB_ICONINFORMATION);
end;

procedure ShowMessageAlerta(sTitulo, sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), PChar(sTitulo), MB_ICONWARNING);
end;

procedure ShowStop(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Pare!', MB_ICONSTOP);
end;

procedure ShowError(AMessage : String);
begin
  Application.MessageBox(PChar(AMessage.Trim), 'Erro!', MB_ICONERROR);
end;

function TViewPrincipal.AuthServer(aFirstAuthentication : Boolean) : Boolean;
var
  aForm  : IViewAuth;
  aEmail ,
  aSenha ,
  aToken : String;
begin
  Result := False;

  if aFirstAuthentication then
  begin
    aForm  := TViewAuth.New(Self);
    Result := aForm.Autenticado(aEmail, aSenha, aToken);

    if Result then
    begin
      FUser
        .CodeProject(API_CODE_PROJECT_USER)
        .ApiKey(API_FIREBASE)
        .Entity
          .Email(aEmail)
          .Passwd(aSenha)
        .&End
        .Auth;

      Result := FUser.Entity.Registered;
    end;
  end
  else
  begin
    if FUser.Entity.Email.IsEmpty or FUser.Entity.Email.IsEmpty then
      raise Exception.Create('Usuário sem autenticação!');

    FUser
      .CodeProject(API_CODE_PROJECT_USER)
      .ApiKey(API_FIREBASE)
      .Auth;

    Result := FUser.Entity.Registered;
  end;

  if Result then
    edTokenUserID.Text := FUser.Entity.TokenID;
end;

procedure TViewPrincipal.BtnCarregarLicencaClick(Sender: TObject);
begin
  if opdLicenca.Execute then
    CarregarLicenca(opdLicenca.FileName);
end;

procedure TViewPrincipal.CarregarListaClientes;
var
  aCliente : IControllerCliente<TControllerCliente>;
begin
  if not cdsClientes.Active then
    cdsClientes.CreateDataSet;

  cdsClientes.FieldByName('cgc').OnGetText := cdsClientescgcGetText;

  aCliente := TControllerFactory.New.Cliente;
  aCliente
    .CodeProject(API_CODE_PROJECT_REALTIME)
    .LoadDataSet(FUser.Entity.TokenID, cdsClientes);
end;

procedure TViewPrincipal.cdsClientescgcGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString.Trim.IsEmpty then
    Text := EmptyStr
  else
    Text := TServicesUtils.StrFormatarCnpj(Sender.AsString);
end;

procedure TViewPrincipal.CarregarCliente;
var
  aCliente : IControllerCliente<TControllerCliente>;
begin
  aCliente := TControllerFactory.New.Cliente;
  aCliente
    .CodeProject(API_CODE_PROJECT_REALTIME)
    .Load(FUser.Entity.TokenID, cdsClientes.FieldByName('doc').AsString);
end;

procedure TViewPrincipal.ClienteCarregado(Sender: TObject);
var
  aCliente : IControllerCliente<TControllerCliente>;
begin
  if (Sender is TThread) then
  begin
    if Assigned(TThread(Sender).FatalException)  then
      ShowError(Exception(TThread(Sender).FatalException).Message)
    else
    begin
      aCliente := TControllerFactory.New.Cliente;

      edUUID.Hint := aCliente.Entity.doc;
      edUUID.Text := aCliente.Entity.UUID.ToString;
      edEmpresa.Text  := aCliente.Entity.Razao;
      edFantasia.Text := aCliente.Entity.Fantasia;
      edCGC.Text   := TServicesUtils.StrFormatarCnpj(aCliente.Entity.Cnpj);
      edEmail.Text := aCliente.Entity.Email;

      edEndereco.Text := aCliente.Entity.Endereco.Logradouro;
      edNumero.Text   := aCliente.Entity.Endereco.Numero;
      edBairro.Text   := aCliente.Entity.Endereco.Bairro;
      edCidade.Text   := aCliente.Entity.Endereco.Cidade;
      edUF.Text  := aCliente.Entity.Endereco.UF;
      edCEP.Text := aCliente.Entity.Endereco.Cep;

      edCompetencia.Text  := aCliente.Entity.Licenca.Competencia.ToString;
      edDataBloqueio.Text := FormatDateTime('dd/mm/yyyy', aCliente.Entity.Licenca.Bloqueio);

      chkSGE.Checked := aCliente.Entity.Licenca.Sistemas.SGE;
      chkSGO.Checked := aCliente.Entity.Licenca.Sistemas.SGO;
      chkSGI.Checked := aCliente.Entity.Licenca.Sistemas.SGI;
      chkSGF.Checked := aCliente.Entity.Licenca.Sistemas.SGF;
    end;
  end;
end;

procedure TViewPrincipal.CarregarLicenca(
  const sNomeArquivo: String);
var
  Arquivo : TStringList;
  ini : TIniFile;
  I : Integer;
  aGuid : TGUID;
begin
  Arquivo := TStringList.Create;
  try
    Arquivo.LoadFromFile( sNomeArquivo );

    for I := 0 to Arquivo.Count - 1 do
      Arquivo.Strings[I] := DecriptarSenha(Arquivo.Strings[I], SYS_PASSWD_KEY);

    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');

    edUUID.Hint     := ini.ReadString('Licenca', 'doc',  EmptyStr);
    edUUID.Text     := ini.ReadString('Licenca', edUUID.Name,  '');
    edEmpresa.Text  := ini.ReadString('Licenca', edEmpresa.Name,  '');
    edFantasia.Text := ini.ReadString('Licenca', edFantasia.Name, '');
    edCGC.Text      := ini.ReadString('Licenca', edCGC.Name,      '');
    edEndereco.Text := ini.ReadString('Licenca', edEndereco.Name, '');
    edNumero.Text   := ini.ReadString('Licenca', edNumero.Name,   '');
    edBairro.Text   := ini.ReadString('Licenca', edBairro.Name,   '');
    edCidade.Text   := ini.ReadString('Licenca', edCidade.Name,   '');
    edUF.Text       := ini.ReadString('Licenca', edUF.Name,       '');
    edCEP.Text      := ini.ReadString('Licenca', edCEP.Name,      '');
    edEmail.Text    := ini.ReadString('Licenca', edEmail.Name,    '');
    edCompetencia.Text  := ini.ReadString('Licenca', edCompetencia.Name, FormatDateTime('yyyymm', Date + 30));
    edDataBloqueio.Text := FormatDateTime('dd/mm/yyyy', ini.ReadDateTime('Licenca', edDataBloqueio.Name, Date + 45));
    chkSGE.Checked := ini.ReadBool('Licenca', chkSGE.Name, False);
    chkSGI.Checked := ini.ReadBool('Licenca', chkSGI.Name, False);
    chkSGF.Checked := ini.ReadBool('Licenca', chkSGF.Name, False);
    chkSGO.Checked := ini.ReadBool('Licenca', chkSGO.Name, False);

    if (Trim(edUUID.Text) = EmptyStr) then
    begin
      CreateGUID(aGuid);
      edUUID.Text := aGuid.ToString;
    end;

    edCompetenciaChange( edCompetencia );

    lblSenhaAuthCliente.Caption := 'Senha de autenticação no Firebase Google: ' + SomenteNumero(edCGC.Text) + '@pwd';
  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;
end;

function TViewPrincipal.CreateCustomerAccount: Boolean;
begin
  FUser
    .Entity
      .DisplayName(edEmpresa.Text)
      .Email(edEmail.Text)
      .Passwd(SomenteNumero(edCGC.Text) + '@pwd')
    .&End
    .RegisterAccount;

  Result := FUser.Error.IsEmpty;

  if not Result then
    ShowStop(FUser.Error);
end;

function TViewPrincipal.CustomerAccountRegistered: Boolean;
begin
  FUser
    .Entity
      .DisplayName(edEmpresa.Text)
      .Email(edEmail.Text)
      .Passwd(SomenteNumero(edCGC.Text) + '@pwd')
    .&End
    .AccountRegistered;

  Result := FUser.Entity.Registered;

  if not FUser.Error.IsEmpty then
    ShowStop(FUser.Error);
end;

procedure TViewPrincipal.GerarLicenca(const sNomeArquivo: String);
var
  Arquivo : TStringList;
  ini : TIniFile;
  I : Integer;
begin
  Arquivo := TStringList.Create;
  try
    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');

    if Trim(edUUID.Text) = EmptyStr then
      edUUID.Text := TGUID.Create(Now).ToString;

    ini.WriteString  ('Licenca', 'doc',           edUUID.Hint);
    ini.WriteString  ('Licenca', edUUID.Name,     Trim(edUUID.Text));
    ini.WriteString  ('Licenca', edEmpresa.Name,  Trim(edEmpresa.Text));
    ini.WriteString  ('Licenca', edFantasia.Name, Trim(edFantasia.Text));
    ini.WriteString  ('Licenca', edCGC.Name,      Trim(edCGC.Text));
    ini.WriteString  ('Licenca', edEndereco.Name, Trim(edEndereco.Text));
    ini.WriteString  ('Licenca', edNumero.Name,   Trim(edNumero.Text));
    ini.WriteString  ('Licenca', edBairro.Name,   Trim(edBairro.Text));
    ini.WriteString  ('Licenca', edCidade.Name,   Trim(edCidade.Text));
    ini.WriteString  ('Licenca', edUF.Name,       Trim(edUF.Text));
    ini.WriteString  ('Licenca', edCEP.Name,      Trim(edCEP.Text));
    ini.WriteString  ('Licenca', edEmail.Name,    Trim(edEmail.Text));
    ini.WriteString  ('Licenca', edCompetencia.Name,  Trim(edCompetencia.Text));
    ini.WriteDateTime('Licenca', edDataBloqueio.Name, StrToDateTimeDef(edDataBloqueio.Text, Date + 15));
    ini.WriteBool    ('Licenca', chkSGE.Name, chkSGE.Checked);
    ini.WriteBool    ('Licenca', chkSGI.Name, chkSGI.Checked);
    ini.WriteBool    ('Licenca', chkSGF.Name, chkSGF.Checked);
    ini.WriteBool    ('Licenca', chkSGO.Name, chkSGO.Checked);

    ini.UpdateFile;

    Arquivo.LoadFromFile( ini.FileName );

    for I := 0 to Arquivo.Count - 1 do
      Arquivo.Strings[I] := EncriptSenha(Arquivo.Strings[I], SYS_PASSWD_KEY);

    Arquivo.SaveToFile(sNomeArquivo);

  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;
end;

procedure TViewPrincipal.RegistrarCliente(aDocument, aGuidID : String);
var
  aCliente : IControllerCliente<TControllerCliente>;
begin
  if not cdsClientes.Active then
    cdsClientes.CreateDataSet;

  aCliente := TControllerFactory.New.Cliente;

  if aGuidID.IsEmpty then
    aCliente.Entity.NewID
  else
    aCliente.Entity.UUID( StringToGUID('{' + aGuidID + '}') );

  aCliente
    .Entity
      .doc(aDocument)
      .Razao(edEmpresa.Text)
      .Fantasia(edFantasia.Text)
      .Cnpj(edCGC.Text)
      .Email(edEmail.Text)
      .Endereco
        .Logradouro(edEndereco.Text)
        .Numero(edNumero.Text)
        .Bairro(edBairro.Text)
        .Cep(edCEP.Text)
        .Cidade(edCidade.Text)
        .UF(edUF.Text)
      .&End
      .Licenca
        .Competencia( StrToIntDef(Trim(edCompetencia.Text), FormatDateTime('yyyymm', Date).ToInteger) )
        .Bloqueio( DataBloqueio )
        .Sistemas
          .SGE( chkSGE.Checked )
          .SGO( chkSGO.Checked )
          .SGI( chkSGI.Checked )
          .SGF( chkSGF.Checked )
        .&End
      .&End
    .&End
  .Save( FUser.Entity.TokenID );

  edUUID.Hint := aCliente.Entity.doc;
  edUUID.Text := aCliente.Entity.UUID.ToString;


  if not cdsClientes.Locate('cgc', aCliente.Entity.Cnpj, []) then
    cdsClientes.Append
  else
    cdsClientes.Edit;

  cdsClientes.FieldByName('name').AsString := aCliente.Entity.doc;
  cdsClientes.FieldByName('doc').AsString  := aCliente.Entity.doc;
  cdsClientes.FieldByName('uuid').AsString := aCliente.Entity.UUID.ToString;
  cdsClientes.FieldByName('cgc').AsString  := aCliente.Entity.Cnpj;
  cdsClientes.FieldByName('razao').AsString    := aCliente.Entity.Razao;
  cdsClientes.FieldByName('fantasia').AsString := aCliente.Entity.Fantasia;
  cdsClientes.FieldByName('email').AsString    := aCliente.Entity.Email;

  cdsClientes.Post;
end;

function TViewPrincipal.SomenteNumero(Value: String): String;
var
  I : Byte;
begin
  Result := EmptyStr;
  for I := 1 To Value.Length do
    if Value[I] In ['0'..'9'] Then
      Result := Result + Value[I];
end;

procedure TViewPrincipal.BtnGerarLicencaClick(Sender: TObject);
var
  aCnpj ,
  sNomeArquivo : String;
  aProsseguir  : Boolean;
  aGuidID : String;
begin
  if (Trim(edEmpresa.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa a razão social da empresa!');
    Exit;
  end
  else
  if (Trim(edFantasia.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa o nome fantasia da empresa!');
    Exit;
  end
  else
  if (Trim(edCGC.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa o CGC/CNPJ!');
    Exit;
  end
  else
  if (Trim(edEmail.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa o e-mail do cliente!');
    Exit;
  end
  else
  if (Trim(edCompetencia.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa a competência limite!');
    Exit;
  end;

  if (not TServicesUtils.StrIsCPF(Trim(edCGC.Text))) and (not TServicesUtils.StrIsCNPJ(Trim(edCGC.Text))) then
  begin
    ShowMessageAlerta('Alerta', 'CPF/CNPJ Inválido!');
    Exit;
  end;

  if (not TServicesUtils.EmailValido(Trim(edEmail.Text), TDomainMail.domainMainComBr)) then
  begin
    ShowMessageAlerta('Alerta', 'E-mail Inválido!');
    Exit;
  end;

  // Localizar o registro do cliente...
  if cdsClientes.Active then
  begin
    aCnpj := TServicesUtils.StrOnlyNumbers(edCGC.Text);
    if cdsClientes.Locate('cgc', aCnpj, []) then
    begin
      edUUID.Hint := cdsClientes.FieldByName('doc').AsString;
      aGuidID := cdsClientes.FieldByName('uuid').AsString;
    end
    else
    begin
      edUUID.Hint := EmptyStr;
      aGuidID := EmptyStr;
    end;
  end;

  Screen.Cursor := crHourGlass;
  try
    aProsseguir := AuthServer(False); // Autenticar

    if aProsseguir then
    begin
      aProsseguir := CustomerAccountRegistered; // Verificar conta do cliente
      if not aProsseguir then
        aProsseguir := CreateCustomerAccount;   // Gerar conta para o cliente
    end
    else
      aProsseguir := True;

    if aProsseguir then
    begin
      sNomeArquivo := StringReplace(StringReplace(StringReplace(Trim(edCGC.Text), '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]) + ' - ' + Trim(edEmpresa.Text);
      sNomeArquivo := ExtractFilePath(Application.ExeName) + sNomeArquivo + '.lnc';

      if AuthServer(False) then  // Autenticar para renovar o TokenID
        RegistrarCliente(edUUID.Hint, aGuidID); // Gravar licença no Firestore RealTime

      GerarLicenca(sNomeArquivo);

      lblSenhaAuthCliente.Caption := 'Senha de autenticação no Firebase Google: ' + SomenteNumero(edCGC.Text) + '@pwd';

      ShowMessageInformacao('Licença', 'Arquivo gerado com sucesso!' + #13#13 + sNomeArquivo);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TViewPrincipal.BtnNovaLicencaClick(Sender: TObject);
begin
  edUUID.Text := EmptyStr;
  edUUID.Hint := EmptyStr;
  edEmpresa.Text  := EmptyStr;
  edFantasia.Text := EmptyStr;
  edCGC.Text      := EmptyStr;
  edEndereco.Text := EmptyStr;
  edNumero.Text := EmptyStr;
  edBairro.Text := EmptyStr;
  edCidade.Text := EmptyStr;
  edUF.Text     := EmptyStr;
  edCEP.Text    := EmptyStr;
  edEmail.Text  := EmptyStr;
  edCompetencia.Text  := EmptyStr;
  edDataBloqueio.Text := EmptyStr;
  chkSGE.Checked := False;
  chkSGI.Checked := False;
  chkSGF.Checked := False;
  chkSGO.Checked := False;
end;

function TViewPrincipal.DataBloqueio: TDateTime;
var
  aStr : TStringList;
begin
  aStr := TStringList.Create;
  try
    aStr.Delimiter := '/';
    aStr.DelimitedText := edDataBloqueio.Text;

    if (aStr.Count = 3) then
      Result := EncodeDate(aStr.Strings[2].ToInteger, aStr.Strings[1].ToInteger, aStr.Strings[0].ToInteger)
    else
      Result := IncDay(Date, 15);
  finally
    aStr.DisposeOf;
  end;
end;

procedure TViewPrincipal.dbgClientesDblClick(Sender: TObject);
var
  aThread : TThread;
begin
  if (not dtsClientes.DataSet.IsEmpty) then
  begin
    aThread := TThread.CreateAnonymousThread(CarregarCliente);
    aThread.OnTerminate := ClienteCarregado;
    aThread.Start;
  end;
end;

function TViewPrincipal.DecriptarSenha(const Value,
  Key: String): String;
var
  sKeyChar   ,
  sStrEncode : String;
  IdEncoder  : TIdEncoderMIME;
  IdDecoder  : TIdDecoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  IdDecoder := TIdDecoderMIME.Create(nil);
  try
    sKeyChar   := IdEncoder.EncodeString(Key);
    sStrEncode := Value;

    if (Pos(sKeyChar, sStrEncode) = 0)  then
      raise Exception.Create('Criptografia corrompida!!!')
    else
      sStrEncode := StringReplace(sStrEncode, sKeyChar, EmptyStr, [rfReplaceAll]);

    Result := IdDecoder.DecodeString(sStrEncode);
  finally
    IdEncoder.Free;
    IdDecoder.Free;
  end;
end;

function TViewPrincipal.EncriptSenha(const Value, Key: String): String;
var
  sKeyChar    ,
  sStrEncode  ,
  sResult     : String;
  iTamanhoStr ,
  iPosicaoKey : Integer;
  IdEncoder   : TIdEncoderMIME;
begin
  IdEncoder := TIdEncoderMIME.Create(nil);
  try
    sKeyChar    := IdEncoder.EncodeString(Key);
    sStrEncode  := IdEncoder.EncodeString(Value);
    iTamanhoStr := Length(sStrEncode);

    iPosicaoKey := -1;
    while (iPosicaoKey < 0) do
      iPosicaoKey := Random(iTamanhoStr);

    sResult := Copy(sStrEncode, 1, iPosicaoKey) + sKeyChar + Copy(sStrEncode, iPosicaoKey + 1, iTamanhoStr);

    Result := sResult;
  finally
    IdEncoder.Free;
  end;
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  FUser := TControllerFactory.New.Usuario;
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
var
  aThread : TThread;
begin
  if (Self.Tag = 0) then
    if AuthServer(True) then
    begin
      aThread := TThread.CreateAnonymousThread(CarregarListaClientes);
      aThread.Start;
    end;
end;

procedure TViewPrincipal.edCompetenciaChange(Sender: TObject);
var
  dData : TDateTime;
begin
  if Length(Trim(edCompetencia.Text)) = 6 then
  begin
    if StrToIntDef(Copy(Trim(edCompetencia.Text), 5, 2), 0) > 12 then
      Exit;
      
    dData := StrToDate( '01/' + Copy(Trim(edCompetencia.Text), 5, 2) + '/' + Copy(Trim(edCompetencia.Text), 1, 4) );
    dData := StrToDate( FormatFloat('00"/"', DaysInMonth(dData)) + FormatDateTime('mm/yyyy', dData) );

    edDataBloqueio.Text := FormatDateTime('dd/mm/yyyy', dData + 15);
  end;
end;

end.
