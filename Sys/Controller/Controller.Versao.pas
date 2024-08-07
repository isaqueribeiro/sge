unit Controller.Versao;

interface

Uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  Interacao.Versao;

Type
  TVersaoController = class(TInterfacedObject, IVersao)
    strict private
      class var _instance : IVersao;
    private
      FInfoVersao : TStringList;

      procedure SetCompanyName(const Value : String);

      function GetCompanyName : String;
      function GetFileVersion : String;
      function GetInternalName : String;
      function GetProductGUUID: TGUID;
      function GetProductID: String;
      function GetProductName: String;
      function GetProductVersion : String;
      function GetVersion : String;
      function GetVersionID : Currency;
      function GetCopyright : String;
      function GetGoogleAnalyticsPropertyID: String;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property CompanyName: String read GetCompanyName write SetCompanyName;
      property FileVersion: String read GetFileVersion;
      property InternalName : String read GetInternalName;
      property ProductID    : String read GetProductID;
      property ProductGUUID : TGUID read GetProductGUUID;
      property ProductName  : String read GetProductName;
      property ProductVersion: String read GetProductVersion;
      property Version : String read GetVersion;
      property VersionID : Currency read GetVersionID;
      property Copyright : String read GetCopyright;
      property GoogleAnalyticsPropertyID : String read GetGoogleAnalyticsPropertyID;

      function getPropertyValue(aPropertyValue : TPropertyValue): String;

      class function GetInstance() : IVersao;
  end;

implementation

{ TVersaoController }

constructor TVersaoController.Create;
begin
  FInfoVersao := TStringList.Create;
end;

destructor TVersaoController.Destroy;
begin
  FInfoVersao.DisposeOf;
  inherited;
end;

function TVersaoController.GetCompanyName: String;
begin
  Result := getPropertyValue(TPropertyValue.ivCOMPANY_NAME);
end;

function TVersaoController.GetCopyright: String;
begin
  Result := getPropertyValue(TPropertyValue.ivLEGAL_COPYRIGHT);
end;

function TVersaoController.GetFileVersion: String;
begin
  Result := getPropertyValue(TPropertyValue.ivFILE_VERSION);
end;

function TVersaoController.GetGoogleAnalyticsPropertyID: String;
begin
  Result := getPropertyValue(TPropertyValue.ivGOOGLE_ANALYTICS_PROPERTY_ID);
end;

function TVersaoController.GetProductGUUID: TGUID;
begin
  try
    Result := StringToGUID(getPropertyValue(TPropertyValue.ivPRODUCT_GUUID));
  except
    Result := TGUID.Empty;
  end;
end;

function TVersaoController.GetProductID: String;
begin
  Result := getPropertyValue(TPropertyValue.ivPRODUCT_ID);
end;

function TVersaoController.GetProductName: String;
begin
  Result := getPropertyValue(TPropertyValue.ivPRODUCT_NAME);
end;

function TVersaoController.GetProductVersion: String;
begin
  Result := getPropertyValue(TPropertyValue.ivPRODUCT_VERSION);
end;

function TVersaoController.getPropertyValue(aPropertyValue : TPropertyValue): String;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage,
    wCodePage: word;
  end;
var
  Pntr      : Pointer;
  infoSize  : Cardinal;
  buffer    ,
  valorLido : PChar;
  tamanhoValorLido : Cardinal;
  propName ,
  appName  ,
  Language : String;
begin

  propName := PROPERTY_VALUE_STR[aPropertyValue];
  appName  := ParamStr(0);
  Result   := EmptyStr;
  infoSize := GetFileVersionInfoSize(PChar(appName), infoSize);

  if ( infoSize > 0 ) then
  begin
    buffer := AllocMem(infoSize);

    try

      GetFileVersionInfo(PChar(appName), 0, infoSize, buffer);

      if not VerQueryValue(buffer, '\VarFileInfo\Translation\', Pntr, infoSize) then
        RaiseLastOSError;

      Language := Format('%.4x%.4x', [PLandCodepage(Pntr)^.wLanguage, PLandCodepage(Pntr)^.wCodePage]);

      if VerQueryValue(buffer, PChar('StringFileInfo\' + Language + '\' + propName), Pointer(valorLido), tamanhoValorLido) then
      begin

       valorLido := PChar(Trim(valorLido));

       if ( Length(valorLido) > 0 ) then
         Result := valorLido;

      end;

    finally
      FreeMem(buffer, infoSize);
    end;

  end;
end;

function TVersaoController.GetVersion: String;
begin
  Result := getPropertyValue(TPropertyValue.ivFILE_VERSION);
end;

function TVersaoController.GetVersionID: Currency;
var
  I : Integer;
  sVersao   ,
  sVersaoID : String;
  aVersao   : TArray<String>;
  aRetorno  : Currency;
begin
  sVersao := getPropertyValue(TPropertyValue.ivFILE_VERSION);

  aVersao   := sVersao.Split(['.'], 4);
  sVersaoID := EmptyStr;

  for I := Low(aVersao) to High(aVersao) do
    sVersaoID := sVersaoID + FormatFloat('00', StrToIntDef(aVersao[I], 0));

  Result := StrToCurrDef(sVersaoID, 0);
end;

procedure TVersaoController.SetCompanyName(const Value: String);
begin
  FInfoVersao.Values[PROPERTY_VALUE_STR[TPropertyValue.ivCOMPANY_NAME]] := Value;
end;

class function TVersaoController.GetInstance() : IVersao;
begin
  if not Assigned(_instance) then
    _instance := Self.Create;

  Result := _instance;
end;

function TVersaoController.GetInternalName: String;
begin
  Result := getPropertyValue(TPropertyValue.ivINTERNAL_NAME);
end;

end.
