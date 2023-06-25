unit Service.ReaderOFX;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  Vcl.Controls;

type
  TItemOFX = class
    MovType : String;
    MovDate : TDate;
    Value   : Double;
    ID      : String;
    Document: String;
    Desc    : String;
  end;

  TReaderOFX = class(TComponent)
  private
    FFileOFX   : String;
    FListItems : TObjectList<TItemOFX>;
    procedure Clear;
    procedure Delete(iIndex: Integer);

    function Add: TItemOFX;
    function PrepareFloat(aString: String): String;
    function InfLine(aLine: String; const aEndTag : String = ''): String;
    function FindString(aSubString, aString: String): Boolean;
    function ReplaceString(aString: String; aSOld: String; aNew: String; aInsensitive: Boolean = true): String;
    function StrToDate(aStr : String) : TDate;
  public
    BankID      : Integer;
    AccountID   : String;
    AccountType : String;
    DecimalSeparator : String;
    InitialBalance,
    FinalBalance  : Double;
    InitialDate,
    FinalDate  : TDate;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Process: Boolean;
    function Get(iIndex: Integer): TItemOFX;
    function Count: Integer;
  protected
  published
    property FileOFX : String read FFileOFX write FFileOFX;
  end;

//procedure Register;
//
implementation

constructor TReaderOFX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListItems := TObjectList<TItemOFX>.Create;
  DecimalSeparator := ',';
  InitialBalance := 0.0;
  FinalBalance   := 0.0;
end;

destructor TReaderOFX.Destroy;
begin
  FListItems.DisposeOf;
  inherited Destroy;
end;

procedure TReaderOFX.Delete(iIndex: Integer);
begin
  TItemOFX(FListItems.Items[iIndex]).Free;
  FListItems.Delete(iIndex);
end;

procedure TReaderOFX.Clear;
begin
  while FListItems.Count > 0 do
    Delete(0);

  FListItems.Clear;
end;

function TReaderOFX.Count: Integer;
begin
  Result := FListItems.Count;
end;

function TReaderOFX.Get(iIndex: Integer): TItemOFX;
begin
  Result := TItemOFX(FListItems.Items[iIndex]);
end;

function TReaderOFX.Process: Boolean;
var
  oFile: TStringList;
  i    : Integer;
  bOFX  : Boolean;
  oItem : TItemOFX;
  aLine : String;
  dBalance : Double;
begin
  Result := false;
  Clear;

  bOFX := false;

  if not FileExists(FFileOFX) then
    exit;

  oFile := TStringList.Create;
  oFile.LoadFromFile(FFileOFX);

  dBalance := 0;
  i := 0;

  while (i < oFile.Count) do
  begin
    aLine := oFile.Strings[i];

    if FindString('<OFX>', aLine) then
      bOFX := true;

    if bOFX then
    begin
      // -----------------------------------------------------------------------
      // BankID
      if FindString('<BANKID>', aLine) then
        BankID := StrToIntDef(InfLine(aLine, '</BANKID>'), 0);

      // -----------------------------------------------------------------------
      // AccountID
      if FindString('<ACCTID>', aLine) then
        AccountID := InfLine(aLine, '</ACCTID>');

      // -----------------------------------------------------------------------
      // AccountType
      if FindString('<ACCTTYPE>', aLine) then
        AccountType := InfLine(aLine, '</ACCTTYPE>');

      // -----------------------------------------------------------------------
      // FinalBalance
      if FindString('<LEDGERBAL>', aLine) then
      begin
        Inc(i);
        aLine := oFile.Strings[i];
        if FindString('<BALAMT>', aLine) then
          FinalBalance := StrToFloat(PrepareFloat(InfLine(aLine, '</BALAMT>')));
      end;

      // -----------------------------------------------------------------------
      // InitialDate
      if FindString('<DTSTART>', aLine) then
        InitialDate := StrToDate(InfLine(aLine, '</DTSTART>'));

      // -----------------------------------------------------------------------
      // FinalDate
      if FindString('<DTEND>', aLine) then
        FinalDate := StrToDate(InfLine(aLine, '</DTEND>'));

      // -----------------------------------------------------------------------
      // Moviment
      if FindString('<STMTTRN>', aLine) then
      begin
        oItem := Add;
        Inc(i);
        aLine := oFile.Strings[i];

        if FindString('<TRNTYPE>', aLine) then
          oItem.MovType := InfLine(aLine, '</TRNTYPE>');

        Inc(i);
        aLine := oFile.Strings[i];

        if FindString('<DTPOSTED>', aLine) then
          oItem.MovDate := StrToDate(InfLine(aLine, '</DTPOSTED>'));

        Inc(i);
        aLine := oFile.Strings[i];

        if FindString('<TRNAMT>', aLine) then
        begin
          oItem.Value := StrToFloat(PrepareFloat(InfLine(aLine, '</TRNAMT>')));
          dBalance := dBalance - oItem.Value;
        end;

        Inc(i);
        aLine := oFile.Strings[i];

        if FindString('<FITID>', aLine) then
          oItem.ID := InfLine(aLine, '</FITID>');

        Inc(i);
        aLine := oFile.Strings[i];

        if FindString('<CHKNUM>', aLine) then
          oItem.Document := InfLine(aLine, '</CHKNUM>');

        Inc(i);
        aLine := oFile.Strings[i];

        if FindString('<MEMO>', aLine) then
          oItem.Desc := InfLine(aLine, '</MEMO>');
      end;
      // -----------------------------------------------------------------------
    end;
    Inc(i);
  end;

  InitialBalance := FinalBalance + dBalance;
  Result := bOFX;
end;

function TReaderOFX.PrepareFloat(aString: String): String;
begin
  Result := aString;
  Result := ReplaceString(Result, '.', DecimalSeparator);
  Result := ReplaceString(Result, ',', DecimalSeparator);
end;

function TReaderOFX.ReplaceString(aString: String; aSOld: String; aNew: String;
  aInsensitive: Boolean = true): String;
var
  iPosition: Integer;
  sTempNew: String;
begin
  iPosition := 1;
  sTempNew := '';
  while (iPosition > 0) do
  begin
    if aInsensitive then
      iPosition := AnsiPos(UpperCase(aSOld), UpperCase(aString))
    else
      iPosition := AnsiPos(aSOld, aString);
    if (iPosition > 0) then
    begin
      sTempNew := sTempNew + copy(aString, 1, iPosition - 1) + aNew;
      aString := copy(aString, iPosition + Length(aSOld), Length(aString));
    end;
  end;
  sTempNew := sTempNew + aString;
  Result := (sTempNew);
end;

function TReaderOFX.StrToDate(aStr: String): TDate;
begin
  Result := EncodeDate(
    StrToIntDef(Copy(aStr, 1, 4), 0),
    StrToIntDef(Copy(aStr, 5, 2), 0),
    StrToIntDef(Copy(aStr, 7, 2), 0)
  );
end;

function TReaderOFX.InfLine(aLine: String; const aEndTag : String): String;
var
  iTemp: Integer;
begin
  Result := EmptyStr;

  if aEndTag.Trim.IsEmpty then
    aLine  := Trim(aLine)
  else
    aLine  := Trim(aLine).Replace(aEndTag, EmptyStr);

  if FindString('>', aLine) then
  begin
    aLine  := Trim(aLine);
    iTemp  := Pos('>', aLine);
    Result := copy(aLine, iTemp + 1, Length(aLine) - iTemp + 1);
  end;
end;

function TReaderOFX.Add: TItemOFX;
var
  oItem: TItemOFX;
begin
  oItem := TItemOFX.Create;
  FListItems.Add(oItem);
  Result := oItem;
end;

function TReaderOFX.FindString(aSubString, aString: String): Boolean;
begin
  Result := Pos(UpperCase(aSubString), UpperCase(aString)) > 0;
end;

//procedure Register;
//begin
//  RegisterComponents('YoungArts', [TReaderOFX]);
//end;
//

end.
