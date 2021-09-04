unit UGrGerarLicenca;

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
  XPMan,
  IniFiles,
  IdCoder,
  IdCoder3to4,
  IdCoderMIME,
  IdBaseComponent,
  Vcl.ExtCtrls,
  dxGDIPlusClasses,

  Controller.Interfaces,
  Controller.Usuario,
  Controller.Factory;

type
  TFrmGrGerarLicenca = class(TForm)
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
    BtnCarregarLicenca: TButton;
    BtnGerarLicenca: TButton;
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
    procedure BtnCarregarLicencaClick(Sender: TObject);
    procedure BtnGerarLicencaClick(Sender: TObject);

    function EncriptSenha(const Value, Key : String) : String;
    function DecriptarSenha(const Value, Key : String) : String;
    function SomenteNumero(Value : String): String;

    procedure edCompetenciaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FUser : IControllerUsuario<TControllerUsuario>;
    procedure CarregarLicenca(const sNomeArquivo : String);
    procedure GerarLicenca(const sNomeArquivo : String);

    function AuthServer : Boolean;
    function CreateCustomerAccount : Boolean;
    function CustomerAccountRegistered : Boolean;
  public
    { Public declarations }
  end;

var
  FrmGrGerarLicenca: TFrmGrGerarLicenca;

const
  API_FIREBASE = 'AIzaSyDK44Zi7G3m9wDM9sbgQb8FqG-BlDbpa-A';
  USER   = 'isaque.ribeiro@outlook.com';
  PASSWD = 'BereshithBaraElohimG11@2021';

implementation

uses
  System.DateUtils,
  UConstantesDGE;

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

function TFrmGrGerarLicenca.AuthServer: Boolean;
begin
  FUser
    .ApiKey(API_FIREBASE)
    .Entity
      .Email(USER)
      .Passwd(PASSWD)
    .&End
    .Auth;

  Result := FUser.Entity.Registered;
end;

procedure TFrmGrGerarLicenca.BtnCarregarLicencaClick(Sender: TObject);
begin
  if opdLicenca.Execute then
    CarregarLicenca(opdLicenca.FileName);
end;

procedure TFrmGrGerarLicenca.CarregarLicenca(
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
    edCGC.Text      := ini.ReadString('Licenca', edCGC.Name,      '');
    edEndereco.Text := ini.ReadString('Licenca', edEndereco.Name, '');
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
  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;
end;

function TFrmGrGerarLicenca.CreateCustomerAccount: Boolean;
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

function TFrmGrGerarLicenca.CustomerAccountRegistered: Boolean;
begin
  FUser
    .Entity
      .DisplayName(edEmpresa.Text)
      .Email(edEmail.Text)
      .Passwd(SomenteNumero(edCGC.Text) + '@pwd')
    .&End
    .AccountRegistered;

  Result := FUser.Error.IsEmpty;
end;

procedure TFrmGrGerarLicenca.GerarLicenca(const sNomeArquivo: String);
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
    ini.WriteString  ('Licenca', edCGC.Name,      Trim(edCGC.Text));
    ini.WriteString  ('Licenca', edEndereco.Name, Trim(edEndereco.Text));
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

function TFrmGrGerarLicenca.SomenteNumero(Value: String): String;
var
  I : Byte;
begin
  Result := EmptyStr;
  for I := 1 To Value.Length do
    if Value[I] In ['0'..'9'] Then
      Result := Result + Value[I];
end;

procedure TFrmGrGerarLicenca.BtnGerarLicencaClick(Sender: TObject);
var
  sNomeArquivo : String;
  aProsseguir  : Boolean;
begin
  if (Trim(edEmpresa.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa o nome da empresa!');
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

  aProsseguir := AuthServer; // Autenticar

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

    GerarLicenca(sNomeArquivo);

    ShowMessageInformacao('Licença', 'Arquivo gerado com sucesso!' + #13#13 + sNomeArquivo);
  end;
end;

function TFrmGrGerarLicenca.DecriptarSenha(const Value,
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

function TFrmGrGerarLicenca.EncriptSenha(const Value, Key: String): String;
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

procedure TFrmGrGerarLicenca.FormCreate(Sender: TObject);
begin
  FUser := TControllerFactory.New.Usuario;
end;

procedure TFrmGrGerarLicenca.edCompetenciaChange(Sender: TObject);
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
