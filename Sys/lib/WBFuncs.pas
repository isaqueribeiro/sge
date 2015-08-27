unit WBFuncs;

(**************************************************************)
(*                                                            *)
(*  TWebbrowser functions by toms                             *)
(*  Version 1.9                                               *)
(*  E-Mail: tom@swissdelphicenter.ch                          *)
(*                                                            *)
(*  Contributors: www.swissdelphicenter.ch                    *)
(*                                                            *)
(*                                                            *)
(**************************************************************)

//{$I versions.inc}

interface

uses
  Windows, Messages, SysUtils, Dialogs, Variants,Forms, Classes, MSHTML,
  UrlMon, SHDocVw, ShellAPI, WinInet, ActiveX, ComObj, ComCtrls,
  // EmbeddedWB,
  // MOZILLACONTROLLib_TLB,
  Graphics;

// What's your favorite Webbrowser?
type
  // Standard TWebbrowser
  TMyBrowser = SHDocVw.TWebbrowser;
  //**************************************
  // TEmbeddedWB:
  //  TMyBrowser = EmbeddedWB.TEmbeddedWB;
  //**************************************
  // TMozillaBrowser:
  // TMyBrowser = MOZILLACONTROLLib_TLB.TMozillaBrowser; {Experimental!! still very buggy!}
  TWebbrowser = TMyBrowser;

const
  // You must also define the GUID for CGI_IWebBrowser to inform MSHTML how to process your command IDs
  CGID_WebBrowser: TGUID = '{ED016940-BD5B-11cf-BA4E-00C04FD70816}';
  // The available commands
  HTMLID_FIND = 1;
  HTMLID_VIEWSOURCE = 2;
  HTMLID_OPTIONS = 3;

type
  TWBFontSize = 0..4;

type
  TEnumFramesProc = function(AHtmlDocument: IHtmlDocument2; Data: Integer): Boolean;


{ ************************************************************************* }
function WB_DocumentLoaded(WB: TWebbrowser): Boolean;
function WB_QueryCommandEnabled(WB: TWebbrowser; const Command: string): Boolean;
function VariantIsObject(const value: OleVariant): boolean;
function InvokeCMD(WB: TWebbrowser; nCmdID: DWORD): Boolean; overload;
function InvokeCMD(WB: TWebbrowser; InvokeIE: Boolean; Value1, Value2: Integer; var vaIn, vaOut: OleVariant): Boolean; overload;
{ ************************************************************************* }
procedure WaitForBrowser(WB: TWebbrowser);
procedure WB_Navigate(WB: TWebbrowser; const URL: string);
procedure WB_SetFocus(WB: TWebbrowser);
procedure WB_GoBack(WB: TWebbrowser);
procedure WB_GoForward(WB: TWebbrowser);
procedure WB_Stop(WB: TWebbrowser);
procedure WB_Refresh(WB: TWebbrowser);
{ ************************************************************************* }
procedure WB_Copy(WB: TWebbrowser);
procedure WB_Paste(WB: TWebbrowser);
procedure WB_Cut(WB: TWebbrowser);
procedure WB_SelectAll(WB: TWebbrowser);
procedure WB_Save(WB: TWebbrowser);
{ ************************************************************************* }
procedure WB_ScrollToTop(WB: TWebbrowser);
procedure WB_ScrollToBottom(WB: TWebbrowser);
{ ************************************************************************* }
procedure SetGlobalOffline(Value: Boolean);
function IsGlobalOffline: Boolean;
{ ************************************************************************* }
procedure WB_ShowPrintDialog(WB: TWebbrowser);
procedure WB_ShowPrintPreview(WB: TWebbrowser);
procedure WB_ShowPageSetup(WB: TWebbrowser);
procedure WB_ShowFindDialog(WB: TWebbrowser);
procedure WB_ShowPropertiesDialog(WB: TWebbrowser);
{ ************************************************************************* }
function WB_SetCharSet(WB: TWebbrowser; const ACharSet: string): Boolean;
procedure WB_Set3DBorderStyle(WB: TWebBrowser; bValue: Boolean);
procedure WB_SearchAndHighlightText(WB: TWebbrowser; aText: string);
procedure WB_ShowScrollBar(WB: TWebbrowser; Value: boolean);
procedure WB_SetZoom(WB: TWebBrowser; Size: TWBFontSize);
function WB_GetZoom(WB: TWebBrowser): TWBFontSize;
function WB_GetCookie(WB: TWebBrowser): string;
{ ************************************************************************* }
procedure WB_ShowSourceCode(WB: TWebbrowser);
{ ************************************************************************* }
function GetElementAtPos(Doc: IHTMLDocument2; x, y: integer): IHTMLElement;
function GetZoneIcon(IconPath: string; var Icon: TIcon): boolean;

function GetZoneAttributes(const URL: string): TZoneAttributes;
function GetCachedFileFromURL(strUL: string; var strLocalFile: string): boolean;
{ ************************************************************************* }
function EnumFrames(AHtmlDocument: IHtmlDocument2;
  EnumFramesProc: TEnumFramesProc; Data: Integer): Boolean;
procedure WB_GetObjectView(TV: TTreeView; WB: TWebBrowser);
function WB_GetPlainText(WB: TWebbrowser; s: TStrings): string;
function WB_GetFields(WebBrowser: TWebBrowser; SL: TStrings): Boolean;
procedure WB_GetImages(AWebbrowser: TWebbrowser; sl: TStrings);
procedure WB_GetLinks(WB: TWebbrowser; sl: TStrings);
function WB_GetDocumentSourceToString(Document: IDispatch): string;

implementation

{ ************************************************************************* }
// Check if Webbrowser Document is loaded

function WB_DocumentLoaded(WB: TWebbrowser): Boolean;
var
  iDoc: IHtmlDocument2;
begin
  Result := False;
  if Assigned(WB) then
  begin
    if WB.Document <> nil then
    begin
      WB.ControlInterface.Document.QueryInterface(IHtmlDocument2, iDoc);
      Result := Assigned(iDoc);
    end;
  end;
end;

{ ************************************************************************* }
// Returns a Boolean value that indicates whether a specified command
// can be successfully executed using execCommand,

function WB_QueryCommandEnabled(WB: TWebbrowser; const Command: string): Boolean;
var
  Doc: IHTMLDocument2;
begin
  Result := False;
  Doc := WB.Document as IHTMLDocument2;
  if Assigned(doc) then
    Result := Doc.QueryCommandEnabled(Command);
end;

{ ************************************************************************* }

function VariantIsObject(const value: OleVariant): boolean;
begin
  result := (VarType(value) = varDispatch);
end;

{ ************************************************************************* }
// Execute a specified command or displays help for a command.
// The IOleCommandTarget interface enables objects and their
// containers to dispatch commands to each other. For example,
// an object's toolbars may contain buttons for commands such as
// Print, Print Preview, Save, New, and Zoom.

function InvokeCMD(WB: TWebbrowser; nCmdID: DWORD): Boolean;
var
  vaIn, vaOut: OleVariant;
begin
  Result := InvokeCMD(WB, True, nCmdID, unassigned, vaIn, vaOut);
end;

function InvokeCMD(WB: TWebbrowser; InvokeIE: Boolean; Value1, Value2: Integer; var vaIn, vaOut: OleVariant): Boolean;
var
  CmdTarget: IOleCommandTarget;
  PtrGUID: PGUID;
begin
  New(PtrGUID);
  if InvokeIE then
    PtrGUID^ := CGID_WebBrowser
  else
    PtrGuid := PGUID(nil);
  if WB.Document <> nil then
  try
    WB.Document.QueryInterface(IOleCommandTarget, CmdTarget);
    if CmdTarget <> nil then
    try
      CmdTarget.Exec(PtrGuid, Value1, Value2, vaIn, vaOut);
    finally
      CmdTarget._Release;
    end;
  except end;
  Dispose(PtrGUID);
end;

{ ************************************************************************* }
// wait until document loaded
// READYSTATE_COMPLETE: The current document is fully downloaded


procedure WaitForBrowser(WB: TWebbrowser);
begin
  while (WB.ReadyState <> READYSTATE_COMPLETE)
    and not (Application.Terminated) do
  begin
    Application.ProcessMessages;
    Sleep(0);
  end;
end;


{ ************************************************************************* }
// Navigate to a page

procedure WB_Navigate(WB: TWebbrowser; const URL: string);
// URL: a string specifying the location of the document
var
  BrowserFlags: OleVariant; // a value that determines under more whether a page should be added to the history list,
                            // be read from the cache memory or be written to the cache;
  MyTargetFrameName: OleVariant; // a string that determines in which frame the URL should be displayed;
  MyPostaData: OleVariant; // a value that specifies the HTTP POST data to send to the server;
  MyHeaders: OleVariant; // a value that specifies the HTTP headers to send to the server.
begin
{ Flags:
  Constant             Value Meaning
  NavOpenInNewWindow   $01 Open the resource or file in a new window.
  NavNoHistory         $02 Do not add the resource or file to the history list.
                           The new page replaces the current page in the list.
  NavNoReadFromCache   $04 Do not read from the disk cache for this navigation.
  NavNoWriteToCache    $08 Do not write the results of this navigation to the disk cache.
                       $10 If the navigation fails, the Web browser attempts to navigate common
                           root domains (.com, .org, and so on). If this still fails,
                           the URL is passed to a search engine.
}
  if Assigned(WB) then
  begin
    BrowserFlags := $02;
    MyTargetFrameName := null;
    MyPostaData := null;
    MyHeaders := null;
    WB.Navigate(URL, BrowserFlags, MyTargetFrameName, MyPostaData, MyHeaders);
    WaitforBrowser(WB);
  end;
end;

{ ************************************************************************* }
// Set Focus on Webbrowser Document

procedure WB_SetFocus(WB: TWebbrowser);
begin
  if WB_DocumentLoaded(WB) then
    (WB.Document as IHTMLDocument2).ParentWindow.Focus;
end;

{ ************************************************************************* }
// Navigate Back in History

procedure WB_GoBack(WB: TWebbrowser);
begin
  try
    if WB_DocumentLoaded(WB) then
      WB.GoBack;
  except
  end;
end;

{ ************************************************************************* }
// Navigate Forward in History

procedure WB_GoForward(WB: TWebbrowser);
begin
  try
    if WB_DocumentLoaded(WB) then
      WB.GoForward;
  except
  end;
end;


{ ************************************************************************* }
// Stop loading Webbrowser Document

procedure WB_Stop(WB: TWebbrowser);
begin
  try
    if WB_DocumentLoaded(WB) then
      WB.Stop;
  except
  end;
end;

{ ************************************************************************* }
// Refresh Webbrowser

procedure WB_Refresh(WB: TWebbrowser);
const
  REFRESH_COMPLETELY = 3;
var
  KeyState: TKeyBoardState;
  RefreshLevel: OleVariant;
begin
  if WB_DocumentLoaded(WB) then
  begin
    GetKeyboardState(KeyState);
    try
      if not ((KeyState[vk_Control] and 128) <> 0) then
        WB.Refresh
      else
          // if control key pressed then REFRESH_COMPLETELY
          // RefreshLevel specifies the refresh level.
        RefreshLevel := REFRESH_COMPLETELY;
      WB.DefaultInterface.Refresh2(RefreshLevel);
    except
    end;
  end;
end;

{ ************************************************************************* }
// Copy selected Text

procedure WB_Copy(WB: TWebbrowser);
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(WB, FALSE, OLECMDID_COPY, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;


{ ************************************************************************* }
// Paste from Clipboard

procedure WB_Paste(WB: TWebbrowser);
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(WB, FALSE, OLECMDID_PASTE, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

{ ************************************************************************* }
// Select All Webbrowser Document

procedure WB_SelectAll(WB: TWebbrowser);
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(WB, FALSE, OLECMDID_SELECTALL, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;


{ ************************************************************************* }
// Cut selected Text

procedure WB_Cut(WB: TWebbrowser);
var
  vaIn, vaOut: Olevariant;
begin
  InvokeCmd(WB, FALSE, OLECMDID_CUT, OLECMDEXECOPT_DODEFAULT, vaIn, vaOut);
end;

{ ************************************************************************* }
// Save Webbrowser Document

procedure WB_Save(WB: TWebbrowser);
var
  Dispatch: IDispatch;
  CommandTarget: IOleCommandTarget;
  vaIn: OleVariant;
  vaOut: OleVariant;
begin
  if WB_DocumentLoaded(WB) then
      // ensure not busy
    if not (WB.Busy) then
    begin
      Dispatch := WB.Document;
      Dispatch.QueryInterface(IOleCommandTarget, CommandTarget);
      vaIn := '';
      vaOut := '';
      try
        CommandTarget.Exec(PGUID(nil),
          OLECMDID_SAVEAS,
          OLECMDEXECOPT_DONTPROMPTUSER,
          vaIn, vaOut);
      except
         {handle exceptions}
        on E: Exception do
          MessageDlg('ERROR: Unable to show Save As dialog. ' + #13 + E.ClassName
            + ': ' + E.Message + '.', mtError, [mbOk], 0);
      end; {try..except..}
    end;
end;

{ ************************************************************************* }
// Scroll To Top of Webbrowser Document

procedure WB_ScrollToTop(WB: TWebbrowser);
begin
  if WB_DocumentLoaded(WB) then
  begin
    try
      WB.OleObject.Document.ParentWindow.ScrollTo(0, 0);
    except
    end;
  end;
end;

{ ************************************************************************* }
// Scroll To Bottom of Webbrowser Document

procedure WB_ScrollToBottom(WB: TWebbrowser);
begin
  if WB_DocumentLoaded(WB) then
  begin
    try
      WB.OleObject.Document.ParentWindow.ScrollTo(0, MaxInt);
    except
    end;
  end;
end;


{ ************************************************************************* }
// Set Global Offline

procedure SetGlobalOffline(Value: Boolean);
const
  INTERNET_STATE_DISCONNECTED_BY_USER = $10;
  ISO_FORCE_DISCONNECTED = $1;
  INTERNET_STATE_CONNECTED = $1;
var
  ci: TInternetConnectedInfo;
  dwSize: DWORD;
begin
  dwSize := SizeOf(ci);
  if (Value) then
  begin
    ci.dwConnectedState := INTERNET_STATE_DISCONNECTED_BY_USER;
    ci.dwFlags := ISO_FORCE_DISCONNECTED;
  end else
  begin
    ci.dwFlags := 0;
    ci.dwConnectedState := INTERNET_STATE_CONNECTED;
  end;
  InternetSetOption(nil, INTERNET_OPTION_CONNECTED_STATE, @ci, dwSize);
end;

{ ************************************************************************* }
// Query Global Offline

function IsGlobalOffline: Boolean;
var
  dwState: DWORD;
  dwSize: DWORD;
begin
  dwState := 0;
  dwSize := SizeOf(dwState);
  Result := False;
  if (InternetQueryOption(nil, INTERNET_OPTION_CONNECTED_STATE, @dwState,
    dwSize)) then
    if ((dwState and INTERNET_STATE_DISCONNECTED_BY_USER) <> 0) then
      Result := True;
end;


{ ************************************************************************* }
// Show Printer Dialog

procedure WB_ShowPrintDialog(WB: TWebbrowser);
var
  OleCommandTarget: IOleCommandTarget;
  Command: TOleCmd;
  Success: HResult;
begin
  if WB_DocumentLoaded(WB) then
  begin
    WB.Document.QueryInterface(IOleCommandTarget, OleCommandTarget);
    Command.cmdID := OLECMDID_PRINT;
    if OleCommandTarget.QueryStatus(nil, 1, @Command, nil) <> S_OK then
    begin
      // ShowMessage('Nothing to print');
      Exit;
    end;
    if (Command.cmdf and OLECMDF_ENABLED) <> 0 then
    begin
      Success := -1; //OleCommandTarget.Exec(nil, OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, EmptyParam, EmptyParam);
      case Success of
        S_OK: ;
        OLECMDERR_E_CANCELED: ShowMessage('Cancelado pelo Usuário');
      else ShowMessage('Error');
      end;
    end
    else
   // ShowMessage('Printing not possible');
  end;
end;


{ ************************************************************************* }
// Show Printer Preview Dialog

procedure WB_ShowPrintPreview(WB: TWebbrowser);
var
  vaIn, vaOut: OleVariant;
begin
  if WB_DocumentLoaded(WB) then
  try
    // Execute the print preview command.
    WB.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW,
      OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
  except
  end;
end;

{ ************************************************************************* }
// Show Page Setup Dialog

procedure WB_ShowPageSetup(WB: TWebbrowser);
var
  vaIn, vaOut: OleVariant;
begin
  if WB_DocumentLoaded(WB) then
  try
    // Execute the page setup command.
    WB.ControlInterface.ExecWB(OLECMDID_PAGESETUP, OLECMDEXECOPT_PROMPTUSER,
      vaIn, vaOut);
  except
  end;
end;

{ ************************************************************************* }
// Show Find Dialog

procedure WB_ShowFindDialog(WB: TWebbrowser);
begin
  InvokeCMD(WB, HTMLID_FIND);
end;

{ ************************************************************************* }
// Show Properties Dialog (for local Files)

procedure ShowFileProperties(const FileName: string);
var
  sei: TShellExecuteInfo;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.lpFile := PChar(FileName);
  sei.lpVerb := 'properties';
  sei.fMask := SEE_MASK_INVOKEIDLIST;
  ShellExecuteEx(@sei);
end;

{ ************************************************************************* }
// Show Properties Dialog

procedure WB_ShowPropertiesDialog(WB: TWebbrowser);
var
  eQuery: OLECMDF;
  vaIn, vaOut: OleVariant;
begin
  if WB_DocumentLoaded(WB) then
  begin
    // if a local file
    if FileExists(WB.Locationname) then
      ShowFileProperties(WB.Locationname)
    else
    begin
      // if a remote file
      try
        eQuery := WB.QueryStatusWB(OLECMDID_PROPERTIES);
        if (eQuery and OLECMDF_ENABLED) = OLECMDF_ENABLED then
          WB.ExecWB(OLECMDID_PROPERTIES, OLECMDEXECOPT_PROMPTUSER, vaIn, vaOut);
      except
      end;
    end;
  end;
end;


{ ************************************************************************* }
// Show Webbrowser Source Code (in standard editor)

procedure WB_ShowSourceCode(WB: TWebbrowser);
begin
  InvokeCMD(WB, HTMLID_VIEWSOURCE);
end;

{ ************************************************************************* }
// Get Element under mouse cursor

function GetElementAtPos(Doc: IHTMLDocument2; x, y: integer): IHTMLElement;
begin
  Result := nil;
  Result := Doc.elementFromPoint(x, y);
end;

{ ************************************************************************* }
// Retrieve the Zone Icon

function GetZoneIcon(IconPath: string; var Icon: TIcon): boolean;
var
  FName, ImageName: string;
  h: hInst;
begin
  Result := False;
  FName := Copy(IconPath, 1, Pos('#', IconPath) - 1);
  ImageName := Copy(IconPath, Pos('#', IconPath), Length(IconPath));
  h := LoadLibrary(Pchar(FName));
  try
    if h <> 0 then
    begin
      Icon.Handle := LoadImage(h, Pchar(ImageName), IMAGE_ICON, 16, 16, 0);
      Result := True;
    end;
  finally
    FreeLibrary(h);
  end;
end;

{ ************************************************************************* }
// GetZoneAttributes

function GetZoneAttributes(const URL: string): TZoneAttributes;
var
  dwZone: Cardinal;
  ZoneAttr: TZoneAttributes; //Defined in Urlmon.pas
var
  ZoneManager: IInternetZoneManager;
  SecManager: IInternetSecurityManager;
begin
  ZeroMemory(@ZoneAttr, SizeOf(TZoneAttributes));
  if CoInternetCreateSecuritymanager(nil, SecManager, 0) = S_OK then
    if CoInternetCreateZoneManager(nil, ZoneManager, 0) = S_OK then
    begin
      SecManager.MapUrlToZone(PWideChar(WideString(URL)), dwZone, 0);
      ZoneManager.GetZoneAttributes(dwZone, Result);
    end;
end;

{ ************************************************************************* }
// Set Zoom

procedure WB_SetZoom(WB: TWebBrowser; Size: TWBFontSize);
var
  V: OleVariant;
begin
  if WB_DocumentLoaded(WB) then
  begin

   { if (WB.QueryStatusWB(OLECMDID_ZOOM)
      and OLECMDF_SUPPORTED) = 0 then
    begin
      Exit;
    end; }
    V := Size;
    WB.ExecWB(OLECMDID_ZOOM, OLECMDEXECOPT_DODEFAULT, V);
  end;
end;

{ ************************************************************************* }
// Get Zoom


function WB_GetZoom(WB: TWebBrowser): TWBFontSize;
var
  vaIn, vaOut: Olevariant;
begin
  result := 0;
  if WB_DocumentLoaded(WB) then
  begin
   { if (WB.QueryStatusWB(OLECMDID_ZOOM)
      and OLECMDF_SUPPORTED) = 0 then
    begin
      Exit;
    end; }
    vaIn := null;
    InvokeCmd(WB, FALSE, OLECMDID_ZOOM, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
    result := vaOut;
  end;
end;

{ ************************************************************************* }
// Display the Source Code

procedure WB_GetDocumentSourceToStream(Document: IDispatch; Stream: TStream);
// Save a TWebbrowser Document to a Stream
var
  PersistStreamInit: IPersistStreamInit;
  StreamAdapter: IStream;
begin
  Assert(Assigned(Document));
  Stream.Size := 0;
  Stream.Position := 0;
  if Document.QueryInterface(IPersistStreamInit,
    PersistStreamInit) = S_OK then
  begin
    StreamAdapter := TStreamAdapter.Create(Stream, soReference);
    PersistStreamInit.Save(StreamAdapter, False);
    StreamAdapter := nil;
  end;
end;

function WB_GetDocumentSourceToString(Document: IDispatch): string;
// Save a Webbrowser Document to a string
var
  Stream: TStringStream;
begin
  Result := '';
  Stream := TStringStream.Create('');
  try
    WB_GetDocumentSourceToStream(Document, Stream);
    Result := StringReplace(Stream.Datastring, #$A#9, #$D#$A, [rfReplaceAll]);
    Result := StringReplace(Result, #$A, #$D#$A, [rfReplaceAll]);
    if Copy(Result, 1, 3) = 'ÿþ<' then
      Result := '';
  finally
    Stream.Free;
  end;
end;

{ ************************************************************************* }
// Enumerate Webbrowser Link Names

procedure WB_getLinks(WB: TWebbrowser; sl: TStrings);
var
  u: variant;
  v: IDispatch;
  s: string;

  procedure RecurseLinks(htmlDoc: variant);
  var
    BodyElement: Olevariant;
    ElementCo: Olevariant;
    HTMLFrames: Olevariant;
    HTMLWnd: Olevariant;
    doc: Olevariant;
    j, i: integer;
  begin
    if VarIsEmpty(htmlDoc) then
      exit;
    BodyElement := htmlDoc.body;
    if BodyElement.tagName = 'BODY' then
    begin
      ElementCo := htmlDoc.links;
      j := ElementCo.Length - 1;
      for i := 0 to j do
      begin
        u := ElementCo.item(i);
        s := u.href;
        sl.Add(s);
      end;
    end;
    HTMLFrames := htmlDoc.Frames;
    j := HTMLFrames.length - 1;
    for i := 0 to j do
    begin
      HTMLWnd := HTMLFrames.Item(i);
      try
        doc := HTMLWnd.Document;
        RecurseLinks(doc);
      except
        continue;
      end;
    end;
  end; // RecurseLinks
begin
  v := WB.document;
  sl.Clear;
  RecurseLinks(v);
end;

{ ************************************************************************* }
// Enumerate Webbrowser Image Frame Names

{
// basic code:

procedure WB_GetFrames(AWebbrowser: TWebbrowser; sl: TStrings);
var
  i: Integer;
begin
  sl.Clear;
  if AWebbrowser.OleObject.Document.Frames.Length <> 0 then
  begin
    for i := 0 to AWebbrowser.OleObject.Document.Frames.Length - 1 do
    begin
      sl.Add(AWebbrowser.OleObject.Document.Frames.item(i).Document.URL);
    end;
  end;
end;
}

{ ************************************************************************* }
// enumerate nested frames (recursive)

function EnumFrames(AHtmlDocument: IHtmlDocument2;
  EnumFramesProc: TEnumFramesProc; Data: Integer): Boolean;

  function Enum(AHtmlDocument: IHtmlDocument2): Boolean;
  var
    OleContainer: IOleContainer;
    EnumUnknown: IEnumUnknown;
    Unknown: IUnknown;
    Fetched: LongInt;
    WebBrowser: IWebBrowser;
  begin
    Result := True;
    if not Assigned(AHtmlDocument) then
      Exit;
    Result := EnumFramesProc(AHtmlDocument, Data);
    if not Result then
      Exit;

    if not Supports(AHtmlDocument, IOleContainer, OleContainer) then
      Exit;
    if Failed(OleContainer.EnumObjects(OLECONTF_EMBEDDINGS, EnumUnknown)) then
      Exit;
    while (EnumUnknown.Next(1, Unknown, @Fetched) = S_OK) do
      if Supports(Unknown, IWebBrowser, WebBrowser) then
      begin
        Result := Enum(WebBrowser.Document as IHtmlDocument2);
        if not Result then
          Exit;
      end;
  end;
begin
  Result := Enum(AHtmlDocument);
end;


{ ************************************************************************* }
// Enumerate Webbrowser Elements // Object View

procedure WB_GetObjectView(TV: TTreeView; WB: TWebBrowser);
// by shima
var
  i, j, k: Integer;
  FormItem, Element, SubElement: OleVariant;
  root: TTreeNodes;
  child, child2, child3: TTreeNode;
  s_type: string;

begin
  root := TV.Items;
  root.Clear;
  TV.Items.BeginUpdate;
  try
   // count forms on document
    for I := 0 to WB.OleObject.Document.forms.Length - 1 do
    begin
      FormItem := WB.OleObject.Document.forms.Item(I);

      if VariantIsObject(FormItem.Name) then
        child := root.AddChild(nil, 'Form' + IntToStr(i) + ': ' + FormItem.Name.Name)
      else
        child := root.AddChild(nil, 'Form' + IntToStr(i) + ': ' + FormItem.Name);

      child.ImageIndex := 3;
      child.SelectedIndex := 3;

      for j := 0 to FormItem.Length - 1 do
      begin
        try
          Element := FormItem.Item(j);
          // when the fieldname is found, try to fill out
          child2 := root.AddChild(child, Element.Name + ' = ' + Element.Value);
          s_type := Element.Type;

          if s_type = 'submit' then
            child2.ImageIndex := 1
          else if s_type = 'text' then
            child2.ImageIndex := 0
          else if s_type = 'file' then
            child2.ImageIndex := 2
          else if s_type = 'hidden' then
            child2.ImageIndex := 4
          else if s_type = 'checkbox' then
            child2.ImageIndex := 5
          else if s_type = 'radio' then
            child2.ImageIndex := 6
          else if s_type = 'select-one' then
            child2.ImageIndex := 7
          else
            child2.ImageIndex := -1;

          child2.SelectedIndex := child2.ImageIndex;

          child3 := root.AddChild(child2, s_type);
          child3.ImageIndex := -1;
          child3.SelectedIndex := -1;

          if s_type = 'text' then
          begin
            child3 := root.AddChild(child2, 'MaxLen=' + IntToStr(Element.maxLength));
            child3.ImageIndex := -1;
            child3.SelectedIndex := -1;
          end
          else if s_type = 'select-one' then
          begin
            for k := 0 to Element.Options.Length - 1 do
            begin
              SubElement := Element.Options.Item(k);
              child3 := root.AddChild(child2, SubElement.Text + ' = <' + SubElement.Value + '>');
              child3.ImageIndex := -1;
              child3.SelectedIndex := -1;
            end;
          end;
        except
          on E: Exception do
            root.AddChild(child, E.Message);
        end;
      end;
    end;
    if root.Count > 0 then
      root.GetFirstNode.Expand(True);
  finally
    TV.Items.EndUpdate;
  end;
end;

{ ************************************************************************* }
// Get Cached File Path From URL

function GetCachedFileFromURL(strUL: string; var strLocalFile: string): boolean;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
  dwLastError: LongWord;
begin
  Result := False;
  dwEntrySize := 0;
  // Begin the enumeration of the Internet cache.
  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
  GetMem(lpEntryInfo, dwEntrySize);
  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
  if (hCacheDir <> 0) and (strUL = lpEntryInfo^.lpszSourceUrlName) then
  begin
    strLocalFile := lpEntryInfo^.lpszLocalFileName;
    Result := True;
  end;
  FreeMem(lpEntryInfo);
  if Result = False then
    repeat
      dwEntrySize := 0;
      // Retrieves the next cache group in a cache group enumeration
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      dwLastError := GetLastError();
      if (GetLastError = ERROR_INSUFFICIENT_BUFFER) then
      begin
        GetMem(lpEntryInfo, dwEntrySize);
        if (FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize)) then
        begin
          if strUL = lpEntryInfo^.lpszSourceUrlName then
          begin
            strLocalFile := lpEntryInfo^.lpszLocalFileName;
            Result := True;
            Break;
          end;
        end;
        FreeMem(lpEntryInfo);
      end;
    until (dwLastError = ERROR_NO_MORE_ITEMS);
end;

{ ************************************************************************* }
// Enumerate Webbrowser Image Link Names

procedure WB_GetImages(AWebbrowser: TWebbrowser; sl: TStrings);
var
  k: Integer;
  sImageURL: string;
  strLocalFile: string;
begin
  sl.Clear;
  for k := 0 to AWebbrowser.OleObject.Document.Images.Length - 1 do
  begin
    sImageURL := AWebbrowser.OleObject.Document.Images.Item(k).Src;
    sl.Add('--url  :' + sImageURL);
    GetCachedFileFromURL(sImageURL, strLocalFile);
    sl.Add('--local:' + strLocalFile);
  end;
end;

{ ************************************************************************* }
// Get the plain Text

function WB_GetPlainText(WB: TWebbrowser; s: TStrings): string;
var
  IDoc: IHTMLDocument2;
  Strl: TStringList;
  sHTMLFile: string;
  v: Variant;
begin
  sHTMLFile := WB_GetDocumentSourceToString(WB.Document);
  Strl := TStringList.Create;
  try
    Strl.Add(sHTMLFile);
    Idoc := CreateComObject(Class_HTMLDOcument) as IHTMLDocument2;
    try
      IDoc.designMode := 'on';
      while IDoc.readyState <> 'complete' do
        Application.ProcessMessages;
      v := VarArrayCreate([0, 0], VarVariant);
      v[0] := Strl.Text;
      IDoc.write(PSafeArray(System.TVarData(v).VArray));
      IDoc.designMode := 'off';
      while IDoc.readyState <> 'complete' do
        Application.ProcessMessages;
      s.Text := IDoc.body.innerText;
    finally
      IDoc := nil;
    end;
  finally
    Strl.Free;
  end;
end;

{ ************************************************************************* }
// Enumerate Webbrowser Field Names

function Wb_GetFields(WebBrowser: TWebBrowser; SL: TStrings): Boolean;
var
  i, j: Integer;
  FormItem: Variant;
begin
  sl.Clear;
  Result := True;
  if WebBrowser.OleObject.Document.all.tags('FORM').Length = 0 then
  begin
    Result := False;
    Exit;
  end;
  for I := 0 to WebBrowser.OleObject.Document.forms.Length - 1 do
  begin
    FormItem := WebBrowser.OleObject.Document.forms.Item(I);
    for j := 0 to FormItem.Length - 1 do
    begin
      try
        SL.Add('Name :' + FormItem.Item(j).Name + ' ; ' +
          'ID :' + FormItem.Item(j).ID + ' ; ' +
          'TagName :' + FormItem.Item(j).TagName + ' ; ' +
          'toString :' + FormItem.Item(j).toString + ' ; ' +
          'innerText :' + FormItem.Item(j).innerText + ' ; ' +
          'innerHTML :' + FormItem.Item(j).innerHTML);
      except
        Result := False;
        Exit;
      end;
    end;
  end;
end;


{ ************************************************************************* }
// search and highlight text in TWebBrowser?

procedure WB_SearchAndHighlightText(WB: TWebbrowser; aText: string);
var
  tr: IHTMLTxtRange; //TextRange Object
begin
  if not (WB.Busy) and (WB.Document <> nil) then
  begin
    if Length(aText) > 0 then
    begin
      tr := ((WB.Document as IHTMLDocument2).body as IHTMLBodyElement).createTextRange;
    //Get a body with IHTMLDocument2 Interface and then a TextRang obj. with IHTMLBodyElement Intf.

      while tr.findText(aText, 1, 0) do //while we have result
      begin
        tr.pasteHTML('<span style="background-color: yellow; font-weight: bolder;">' +
          tr.htmlText + '</span>');
      // Set the highlight, now background color will be yellow
        tr.scrollIntoView(True);
      //When IE find a match, we ask to scroll the window... you dont need this...
      end;
    end;
  end;
end;

{ ************************************************************************* }
// Show / Hide 3D border style

procedure WB_Set3DBorderStyle(WB: TWebBrowser; bValue: Boolean);
{
  bValue: True: Show a 3D border style
          False: Show no border
}
var
  Document: IHTMLDocument2;
  Element: IHTMLElement;
  StrBorderStyle: string;
begin
  if Assigned(WB) then
  begin
    Document := TWebBrowser(WB).Document as IHTMLDocument2;
    if Assigned(Document) then
    begin
      Element := Document.Body;
      if Element <> nil then
      begin
        case bValue of
          False: StrBorderStyle := 'none';
          True: StrBorderStyle := '';
        end;
        Element.Style.BorderStyle := StrBorderStyle;
      end;
    end;
  end;
end;

{ ************************************************************************* }
// Show / Hide scrollbars
// http://msdn.microsoft.com/library/default.asp?url=/workshop/author/dhtml/reference/properties/overflow.asp

procedure WB_ShowScrollBar(WB: TWebbrowser; Value: boolean);
begin
  if WB_DocumentLoaded(WB) then
    if Assigned((WB.Document as IHTMLDocument2).body) then
      if Value then
        (WB.Document as IHTMLDocument2).body.style.overflow := 'hidden'
      else
        (WB.Document as IHTMLDocument2).body.style.overflow := '';
end;


{ ************************************************************************* }
// Set Webbrowser Characterset
// http://msdn.microsoft.com/library/default.asp?url=/workshop/author/dhtml/reference/charsets/charset4.asp

function WB_SetCharSet(WB: TWebbrowser; const ACharSet: string): Boolean;
var
  RefreshLevel: OleVariant;
begin
  Result := False;
  if WB_DocumentLoaded(WB) then
  try
    IHTMLDocument2(WB.Document).Set_CharSet(ACharSet);
    Result := True;
    RefreshLevel := 7;
    WB.Refresh2(RefreshLevel);
  except
  end;
end;


{ ************************************************************************* }
// Get Cookie
// http://msdn.microsoft.com/library/default.asp?url=/workshop/browser/mshtml/reference/ifaces/document2/cookie.asp

function WB_GetCookie(WB: TWebBrowser): string;
var
  document: IHTMLDocument2;
begin
  Result := '';
  if WB_DocumentLoaded(WB) then
  begin
    document := WB.Document as IHTMLDocument2;
    if Assigned(document) then
      Result := document.cookie;
  end;
end;

end.

