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
    ivORIGINAL_FILENAME , //= 'OriginalFilename',
    ivPRODUCT_NAME      , //= 'ProductName',
    ivPRODUCT_VERSION   , //= 'ProductVersion',
    ivCOMMENTS          , //= 'Comments',
    ivRELEASE_DATE      , //= 'ReleaseDate',
    ivSYSTEM_ANALYST    , //= 'Systems Analyst',
    ivCONTACTS          , //= 'Contacts',
    ivOWNER             , //= 'Owner',
    ivSPLASHNAME        , //= 'SplashName',
    ivSPLASHDESCRIPTION   //= 'SplashDescription'
  );

  IVersao = interface
    ['{649047C8-D161-40D1-B352-0E646AA0233D}']

    procedure SetCompanyName(const Value : String);

    function GetCompanyName : String;
    function GetFileVersion : String;
    function GetProductVersion : String;

    property CompanyName: String read GetCompanyName write SetCompanyName;
    property FileVersion: String read GetFileVersion;
    property ProductVersion: String read GetProductVersion;

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
    'ProductName',
    'ProductVersion',
    'Comments',
    'ReleaseDate',
    'Systems Analyst',
    'Contacts',
    'Owner',
    'SplashName',
    'SplashDescription'
  );

implementation

end.
