unit Controller.Versao;

interface

Uses
  Winapi.Windows, System.SysUtils, System.Classes, Interacao.Versao;

Type
  TVersaoController = class(TInterfacedObject, IVersao)
    strict private
      class var _instance : IVersao;
    private
      FInfoVersao : TStringList;

      procedure SetCompanyName(const Value : String);

      function GetCompanyName : String;
      function GetFileVersion : String;
      function GetProductVersion : String;
    protected
      constructor Create;
    public
      destructor Destroy; override;

      property CompanyName: String read GetCompanyName write SetCompanyName;
      property FileVersion: String read GetFileVersion;
      property ProductVersion: String read GetProductVersion;

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

function TVersaoController.GetFileVersion: String;
begin
  Result := getPropertyValue(TPropertyValue.ivFILE_VERSION);
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

end.
