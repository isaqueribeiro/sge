unit Controller.PersonalizaEmpresa;

interface

uses
  System.SysUtils, System.IniFiles, Interacao.Versao, Interacao.PersonalizaEmpresa;

type
  TPersonalizaEmpresaController = class(TInterfacedObject, IPersonalizaEmpresa)
    strict private
      class var _instance : IPersonalizaEmpresa;
    private
      FPersonalizaEmpresa : TIniFile;
      [weak]
      FInformacaoVersao   : IVersao;

      function GetExisteArquivo : Boolean;
      function GetCompanyName : String;
      function GetContacts : String;
      function GetLegalCopyright : String;
      function GetFileDescription : String;
      function GetInternalName : String;
      function GetProductName : String;
      function GetProductVersion : String;
      function GetFileNameImagePNG_Company : String;
      function GetFileNameImagePNG_Wallpaper : String;
      function GetFileNameImagePNG_BackgroundLogin : String;
      function GetFileNameImagePNG_Splash : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property ExisteArquivo : Boolean read GetExisteArquivo;
      property CompanyName: String read GetCompanyName;
      property Contacts : String read GetContacts;
      property LegalCopyright : String read GetLegalCopyright;
      property FileDescription: String read GetFileDescription;
      property InternalName : String read GetInternalName;
      property ProductName : String read GetProductName;
      property ProductVersion : String read GetProductVersion;

      property FileNameImagePNG_Company : String read GetFileNameImagePNG_Company;
      property FileNameImagePNG_Wallpaper : String read GetFileNameImagePNG_Wallpaper;
      property FileNameImagePNG_BackgroundLogin : String read GetFileNameImagePNG_BackgroundLogin;
      property FileNameImagePNG_Splash : String read GetFileNameImagePNG_Splash;

      function SetVersao(Value : IVersao) : IPersonalizaEmpresa;

      class function GetInstance() : IPersonalizaEmpresa;
  end;

implementation

{ TPersonalizaEmpresaController }

constructor TPersonalizaEmpresaController.Create;
begin
  FPersonalizaEmpresa := TIniFile.Create( ChangeFileExt(ParamStr(0), '.inf') );
end;

destructor TPersonalizaEmpresaController.Destroy;
begin
  FPersonalizaEmpresa.DisposeOf;
  inherited;
end;

function TPersonalizaEmpresaController.GetCompanyName: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'CompanyName', FInformacaoVersao.CompanyName)
  else
    Result := FInformacaoVersao.CompanyName;
end;

function TPersonalizaEmpresaController.GetContacts: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'Contacts', FInformacaoVersao.getPropertyValue(TPropertyValue.ivCONTACTS))
  else
    Result := FInformacaoVersao.getPropertyValue(ivCONTACTS);
end;

function TPersonalizaEmpresaController.GetExisteArquivo: Boolean;
begin
  Result := FileExists(ChangeFileExt(ParamStr(0), '.inf'));
end;

function TPersonalizaEmpresaController.GetFileDescription: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Strings', 'FileDescription', FInformacaoVersao.getPropertyValue(TPropertyValue.ivFILE_DESCRIPTION))
  else
    Result := FInformacaoVersao.getPropertyValue(ivFILE_DESCRIPTION);
end;

function TPersonalizaEmpresaController.GetFileNameImagePNG_BackgroundLogin: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'BackgroundLogin', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresaController.GetFileNameImagePNG_Company: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'LogoEmpresa', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresaController.GetFileNameImagePNG_Splash: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'BackgroundSplash', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresaController.GetFileNameImagePNG_Wallpaper: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa.ReadString('Images', 'PapelParede', EmptyStr)
  else
    Result := EmptyStr;
end;

function TPersonalizaEmpresaController.GetInternalName: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa
      .ReadString('Strings',
        PROPERTY_VALUE_STR[TPropertyValue.ivINTERNAL_NAME],
        FInformacaoVersao.getPropertyValue(TPropertyValue.ivINTERNAL_NAME))
  else
    Result := FInformacaoVersao.getPropertyValue(TPropertyValue.ivINTERNAL_NAME);
end;

function TPersonalizaEmpresaController.GetLegalCopyright: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa
      .ReadString('Strings',
        PROPERTY_VALUE_STR[TPropertyValue.ivLEGAL_COPYRIGHT],
        FInformacaoVersao.getPropertyValue(TPropertyValue.ivLEGAL_COPYRIGHT))
  else
    Result := FInformacaoVersao.getPropertyValue(TPropertyValue.ivLEGAL_COPYRIGHT);
end;

function TPersonalizaEmpresaController.GetProductName: String;
begin
  if ExisteArquivo then
    Result := FPersonalizaEmpresa
      .ReadString('Strings',
        PROPERTY_VALUE_STR[TPropertyValue.ivPRODUCT_NAME],
        FInformacaoVersao.getPropertyValue(TPropertyValue.ivPRODUCT_NAME))
  else
    Result := FInformacaoVersao.getPropertyValue(TPropertyValue.ivPRODUCT_NAME);
end;

function TPersonalizaEmpresaController.GetProductVersion: String;
begin
  Result := FInformacaoVersao.getPropertyValue(TPropertyValue.ivPRODUCT_VERSION);
end;

function TPersonalizaEmpresaController.SetVersao(Value: IVersao): IPersonalizaEmpresa;
begin
  Result := Self;
  FInformacaoVersao := Value;
end;

class function TPersonalizaEmpresaController.GetInstance: IPersonalizaEmpresa;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

end.
