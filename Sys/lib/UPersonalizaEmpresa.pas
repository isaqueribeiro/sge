unit UPersonalizaEmpresa;

interface

  uses
    Windows, Classes, SysUtils, IniFiles, UInfoVersao;

type

  TPersonalizaEmpresa = class(TObject)
  private
    FPersonalizaEmpresa : TIniFile;
    FInformacaoVersao : TInfoVersao;
    constructor PrivateCreate;

    function GetExisteArquivo : Boolean;
    function GetCompanyName : String;
    function GetContacts : String;
    function GetLegalCopyright : String;
    function GetFileDescription : String;
    function GetInternalName : String;
    function GetProductName : String;
    function GetFileNameImagePNG_Company : String;
    function GetFileNameImagePNG_Wallpaper : String;
    function GetFileNameImagePNG_BackgroundLogin : String;
    function GetFileNameImagePNG_Splash : String;
  public
    constructor Create;

    property ExisteArquivo : Boolean read GetExisteArquivo;
    property CompanyName: String read GetCompanyName;
    property Contacts : String read GetContacts;
    property LegalCopyright : String read GetLegalCopyright;
    property FileDescription: String read GetFileDescription;
    property InternalName : String read GetInternalName;
    property ProductName : String read GetProductName;

    property FileNameImagePNG_Company : String read GetFileNameImagePNG_Company;
    property FileNameImagePNG_Wallpaper : String read GetFileNameImagePNG_Wallpaper;
    property FileNameImagePNG_BackgroundLogin : String read GetFileNameImagePNG_BackgroundLogin;
    property FileNameImagePNG_Splash : String read GetFileNameImagePNG_Splash;

    class function GetInstance : TPersonalizaEmpresa;
  end;

implementation

var
  personalizaEmpresa : TPersonalizaEmpresa;

{ TPersonalizaEmpresa }

class function TPersonalizaEmpresa.GetInstance: TPersonalizaEmpresa;
begin
  if not Assigned(personalizaEmpresa) then
    personalizaEmpresa := TPersonalizaEmpresa.PrivateCreate;

  Result := personalizaEmpresa;
end;

function TPersonalizaEmpresa.GetInternalName: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'InternalName', FInformacaoVersao.getPropertyValue(ivINTERNAL_NAME))
  else
    Result := FInformacaoVersao.getPropertyValue(ivINTERNAL_NAME);
end;

constructor TPersonalizaEmpresa.Create;
begin
  raise Exception.Create('Para obter um TPersonalizaEmpresa invoque o método GetInstance().');
end;

function TPersonalizaEmpresa.GetExisteArquivo: Boolean;
begin
  Result := FileExists(ChangeFileExt(ParamStr(0), '.inf'));
end;

function TPersonalizaEmpresa.GetCompanyName: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'CompanyName', FInformacaoVersao.CompanyName)
  else
    Result := FInformacaoVersao.CompanyName;
end;

function TPersonalizaEmpresa.GetContacts: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'Contacts', FInformacaoVersao.getPropertyValue(ivCONTACTS))
  else
    Result := FInformacaoVersao.getPropertyValue(ivCONTACTS);
end;

function TPersonalizaEmpresa.GetFileDescription: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'FileDescription', FInformacaoVersao.getPropertyValue(ivFILE_DESCRIPTION))
  else
    Result := FInformacaoVersao.getPropertyValue(ivFILE_DESCRIPTION);
end;

function TPersonalizaEmpresa.GetFileNameImagePNG_Wallpaper: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'PapelParede', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresa.GetFileNameImagePNG_BackgroundLogin: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'BackgroundLogin', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresa.GetFileNameImagePNG_Company: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'LogoEmpresa', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresa.GetFileNameImagePNG_Splash: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'BackgroundSplash', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresa.GetLegalCopyright: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'LegalCopyright', FInformacaoVersao.getPropertyValue(ivLEGAL_COPYRIGHT))
  else
    Result := FInformacaoVersao.getPropertyValue(ivLEGAL_COPYRIGHT);
end;

function TPersonalizaEmpresa.GetProductName: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'ProductName', FInformacaoVersao.getPropertyValue(ivPRODUCT_NAME))
  else
    Result := FInformacaoVersao.getPropertyValue(ivPRODUCT_NAME);
end;

constructor TPersonalizaEmpresa.PrivateCreate;
begin
  inherited Create;
  FPersonalizaEmpresa := TIniFile.Create( ChangeFileExt(ParamStr(0), '.inf') );
  FInformacaoVersao   := TInfoVersao.GetInstance;
end;

end.
