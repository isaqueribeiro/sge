unit Interacao.Versao;

interface

type
  TPropertyValue = (
    ivCOMPANY_NAME      , //= 'CompanyName',
    ivFILE_DESCRIPTION  , //= 'FileDescription',
    ivFILE_VERSION      , //= 'FileVersion',
    ivINTERNAL_NAME     , //= 'InternalName',
    ivLEGAL_COPYRIGHT   , //= 'LegalCopyright',
    ivLEGAL_TRADEMARKS  , //= 'LegalTradeMarks',
    ivORIGINAL_FILENAME , //= 'OriginalFilename'
    ivPRODUCT_ID        , //= 'ProgramID'
    ivPRODUCT_GUUID     , //= 'ProgramGUUID'
    ivPRODUCT_NAME      , //= 'ProductName',
    ivPRODUCT_VERSION   , //= 'ProductVersion'
    ivCOMMENTS          , //= 'Comments'
    ivRELEASE_DATE      , //= 'ReleaseDate'
    ivSYSTEM_ANALYST    , //= 'Systems Analyst'
    ivCONTACTS          , //= 'Contacts'
    ivOWNER             , //= 'Owner'
    ivSPLASHNAME        , //= 'SplashName',
    ivSPLASHDESCRIPTION , //= 'SplashDescription'
    ivGOOGLE_ANALYTICS_PROPERTY_ID //= 'GoogleAnalyticsPropertyID'
  );

  IVersao = interface
    ['{649047C8-D161-40D1-B352-0E646AA0233D}']

    procedure SetCompanyName(const Value : String);

    function GetCompanyName  : String;
    function GetFileVersion  : String;
    function GetInternalName : String;
    function GetProductID    : String;
    function GetProductGUUID : TGUID;
    function GetProductName  : String;
    function GetProductVersion : String;
    function GetVersion : String;
    function GetVersionID : Currency;
    function GetCopyright : String;
    function GetGoogleAnalyticsPropertyID : String;

    property CompanyName: String read GetCompanyName write SetCompanyName;
    property FileVersion: String read GetFileVersion;
    property InternalName: String read GetInternalName;
    property ProductID    : String read GetProductID;
    property ProductGUUID : TGUID read GetProductGUUID;
    property ProductName  : String read GetProductName;
    property ProductVersion: String read GetProductVersion;
    property Version : String read GetVersion;
    property VersionID : Currency read GetVersionID;
    property Copyright : String read GetCopyright;
    property GoogleAnalyticsPropertyID : String read GetGoogleAnalyticsPropertyID;

    function getPropertyValue(aPropertyValue : TPropertyValue): String;
  end;

const
  PROPERTY_VALUE_STR : Array [Low(TPropertyValue)..High(TPropertyValue)] of string = (
    'CompanyName',
    'FileDescription',
    'FileVersion',
    'InternalName',
    'LegalCopyright',
    'LegalTradeMarks',
    'OriginalFilename',
    'ProgramID',
    'ProgramGUUID',
    'ProductName',
    'ProductVersion',
    'Comments',
    'ReleaseDate',
    'Systems Analyst',
    'Contacts',
    'Owner',
    'SplashName',
    'SplashDescription',
    'GoogleAnalyticsPropertyID'
  );

implementation

end.
