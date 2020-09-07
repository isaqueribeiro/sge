unit Interacao.PersonalizaEmpresa;

interface

uses
  System.SysUtils, Interacao.Versao;

type
  IPersonalizaEmpresa = interface
    ['{AE536A22-A15B-4FA3-AB62-DC5F37222FE5}']
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
  end;

implementation

end.
