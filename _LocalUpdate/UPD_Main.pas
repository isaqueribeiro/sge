unit UPD_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBClient, cxLookAndFeels, cxGroupBox,
  cxContainer, cxProgressBar, cxLookAndFeelPainters, StdCtrls, cxButtons,
  Gauges, cxImageComboBox, ImgList, ExtCtrls, FileCtrl, ShellAPI,
  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, dxSkinsForm, cxLabel, dxSkinDarkRoom, dxSkinFoggy,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinSeven, dxSkinSharp, dxSkinSpringTime;


type
  TFrmMain = class(TForm)
    grdFileRunTV: TcxGridDBTableView;
    grdFileRunL: TcxGridLevel;
    grdFileRun: TcxGrid;
    cdsFileRun: TClientDataSet;
    dtsFileRun: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cdsFileRunFileName: TStringField;
    grdFileRunTVColumn1: TcxGridDBColumn;
    grdFileRunTVColumn2: TcxGridDBColumn;
    cdsFileRunSourcePath: TStringField;
    cdsFileRunTargetPath: TStringField;
    gagCopyFile: TGauge;
    cdsFileRunStatus: TBooleanField;
    imgStatus: TImageList;
    cxStyleRepository: TcxStyleRepository;
    GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cdsFileRunFileType: TSmallintField;
    bvlLine: TBevel;
    flbArquivos: TFileListBox;
    dxSkinController: TdxSkinController;
    lblCopyFile: TcxLabel;
    pnlBanner: TPanel;
    Bevel1: TBevel;
    imgIcon: TImage;
    cdsFileRunTargetClientPath: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExecuteBAT;
    procedure CopiarArquivo;
    procedure CopiarArquivoHABIL;
    procedure ClientInstall;
    function CopyFile( const Source, Target: string ) : Boolean;
    function GetErrorShellExecute(ERROR : Integer; var sMessage: String) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses UPD_Functions;

{$R *.dfm}
{$R .\Icons.res}

procedure TFrmMain.ExecuteBAT;
var
  FileSource : String;
const
  BAT : String = 'Manutencao.bat';
begin

  FileSource := ExtractFilePath(Application.ExeName)  + BAT;

  WinExec(PChar(FileSource), SW_HIDE);
  
end;

procedure TFrmMain.ClientInstall;
var
  FileSource,
  FileTarget : String;
begin

  FileSource := TargetSite + LibraryClient;
  FileTarget := ExtractSystemDir + LibraryClient;

  if NeedUpdate(FileTarget, FileSource) then
    CopyFile(FileSource, FileTarget);

end;

function TFrmMain.CopyFile( const Source, Target: string ) : boolean;
var
  FromF,
  ToF  : file of byte;
  Buffer  : Array[0..4096] of char;
  NumRead : Integer;
  FileLength: LongInt;
  logFile   ,
  NewPath   : String;
  log : TStringList;
begin

  Result  := False;

  log := TStringList.Create;

  try

    logFile := StringReplace(Application.ExeName, '.exe', '.log', [rfReplaceAll]);
    NewPath := IncludeTrailingPathDelimiter(ExtractFilePath(Target));

    if FileExists(logFile) then
      log.LoadFromFile(logFile);

    if not DirectoryExists(NewPath) then
    begin

      ForceDirectories(NewPath);

    end
    else
    begin
      Result := NeedUpdate(Target, Source);
    end;

    if not Result then
      Exit;

    AssignFile(FromF, Source);
    Reset(FromF);
    AssignFile(ToF, Target);
    ReWrite(ToF);

    FileLength := FileSize(FromF);

    lblCopyFile.Caption := 'Copiando ... ' + Source + ' para ' + Target;
    lblCopyFile.Update;

    log.Add( 'Copiando ' + QuotedStr(Source) + ' para ' + QuotedStr(Target) );

    with gagCopyFile do
    begin
      MinValue := 0;
      MaxValue := FileLength;
      while FileLength > 0 do
      begin
        BlockRead(FromF, Buffer[0], SizeOf(Buffer), NumRead);
        FileLength := FileLength - NumRead;
        BlockWrite(ToF, Buffer[0], NumRead);
        AddProgress(NumRead);
      end;
    end;

    CloseFile(FromF);
    CloseFile(ToF);

  except
    On E : Exception do
      log.Add( 'Erro ao tentar copiar arquivo ' + QuotedStr(Source) + ' para ' + QuotedStr(Target) + ' - System message: ' + E.Message );
  end;

  if ( Assigned(log) ) then
  begin
    log.SaveToFile(logFile);
    log.Free;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  Caption := ExtractSystemNameModule;
  {$IFDEF HABIL}
  LoadSystemListHABIL( cdsFileRun );
  {$ELSE}
  LoadSystemList( cdsFileRun );
  {$ENDIF}
end;

procedure TFrmMain.CopiarArquivo;
var
  Status : Boolean;
  SystemModule,
  FileSource  ,
  FileTarget  ,
  FileTargetClient : string;
  I : Integer;
  sMessage : String;
begin

  ExecuteBAT;

  SystemModule := cdsFileRunTargetPath.Value + ExtractSystemNameModule + '.exe';

  Update;

  if ( cdsFileRun.Active ) then
  begin

    with cdsFileRun do
    begin
      First;
      while not EOF do
      begin
        Edit;

        FileSource := cdsFileRunSourcePath.AsString + cdsFileRunFileName.AsString;
        FileTarget := cdsFileRunTargetPath.AsString + cdsFileRunFileName.AsString;

        if ( cdsFileRunTargetClientPath.AsString = EmptyStr ) then
          FileTargetClient := EmptyStr
        else
          FileTargetClient := cdsFileRunTargetClientPath.AsString + cdsFileRunFileName.AsString;

        if ( Pos('*', FileSource) = 0 ) then
        begin
          cdsFileRunStatus.Value := CopyFile(FileSource, FileTarget);

          if ( FileTargetClient <> EmptyStr ) then
            cdsFileRunStatus.Value := CopyFile(FileSource, FileTargetClient);
        end
        else
        begin

          // Buscar todos os arquivo de acordo com a máscara informada
          flbArquivos.Directory := ExtractFilePath(FileSource);
          flbArquivos.Mask      := Copy(FileSource, Length(flbArquivos.Directory) + 2, (Length(FileSource)) - (Length(flbArquivos.Directory)));
          flbArquivos.Update;

          for I := 0 to flbArquivos.Items.Count - 1 do
          begin
            FileSource := flbArquivos.Directory + '\' + flbArquivos.Items.Strings[I];

            FileTarget := cdsFileRunTargetPath.AsString + cdsFileRunFileName.AsString;
            FileTarget := StringReplace(FileTarget, flbArquivos.Mask, '', [rfReplaceAll]) +  flbArquivos.Items.Strings[I];

            cdsFileRunStatus.Value := CopyFile(FileSource, FileTarget);

            if ( FileTargetClient <> EmptyStr ) then
            begin
              FileTargetClient := cdsFileRunTargetClientPath.AsString + cdsFileRunFileName.AsString;
              FileTargetClient := StringReplace(FileTargetClient, flbArquivos.Mask, '', [rfReplaceAll]) +  flbArquivos.Items.Strings[I];
              cdsFileRunStatus.Value := CopyFile(FileSource, FileTargetClient);
            end;

            Status := cdsFileRunStatus.Value;

            if ( Status and (cdsFileRunFileType.AsInteger = 1) ) then
              FontInstall(FileTarget);
          end;

        end;

        Post;

        Status := cdsFileRunStatus.Value;

        if ( Status and (cdsFileRunFileType.AsInteger = 1) ) then
          FontInstall(FileTarget);

        if Status then
          ClientInstall;

        grdFileRun.Update;

        Next;
      end;
    end;

    SetCurrentDir(ExtractFileDir(SystemModule));
    sMessage := SystemModule;

    if ( GetErrorShellExecute(ShellExecute(0, 'Open', PChar(SystemModule), nil, nil, Ord(SW_SHOWNORMAL)), sMessage) ) then
      ShowWarning('O sistema apresentou problemas na sua execução. Solicite suporte técnico.' + #13#13 + sMessage);

  end;

  Application.Terminate;

end;

procedure TFrmMain.CopiarArquivoHABIL;
var
  Status : Boolean;
  SystemModule,
  FileSource  ,
  FileTarget  ,
  FileTargetClient: String;
  I : Integer;
  sMessage : String;
begin

  ExecuteBAT;

  SystemModule := Format(FileExecute,  [ExtractSystemNameModule + '.exe']);

  Update;

  DeleteFile( StringReplace(Application.ExeName, '.exe', '.log', [rfReplaceAll]) );

  if ( cdsFileRun.Active ) then
  begin

    with cdsFileRun do
    begin
      First;
      while not EOF do
      begin
        Edit;

        FileSource := cdsFileRunSourcePath.AsString;
        FileTarget := cdsFileRunTargetPath.AsString;

        if ( cdsFileRunTargetClientPath.AsString = EmptyStr ) then
          FileTargetClient := EmptyStr
        else
          FileTargetClient := cdsFileRunTargetClientPath.AsString;

        // Buscar todos os arquivo de acordo com a máscara informada

        if ( DirectoryExists(ExtractFilePath(FileSource)) ) then
        begin
          flbArquivos.Mask      := Copy(FileSource, Length(flbArquivos.Directory) + 2, (Length(FileSource)) - (Length(flbArquivos.Directory)));
          flbArquivos.Directory := ExtractFilePath(FileSource);
          flbArquivos.Update;

          for I := 0 to flbArquivos.Items.Count - 1 do
          begin
            FileSource := IncludeTrailingPathDelimiter(flbArquivos.Directory) + flbArquivos.Items.Strings[I];

            FileTarget := IncludeTrailingPathDelimiter(cdsFileRunTargetPath.AsString);
            FileTarget := StringReplace(FileTarget, flbArquivos.Mask, '', [rfReplaceAll]) +  flbArquivos.Items.Strings[I];

            cdsFileRunStatus.Value := CopyFile(FileSource, FileTarget);

            if ( FileTargetClient <> EmptyStr ) then
            begin
              FileTargetClient := IncludeTrailingPathDelimiter(cdsFileRunTargetClientPath.AsString);
              FileTargetClient := StringReplace(FileTargetClient, flbArquivos.Mask, '', [rfReplaceAll]) +  flbArquivos.Items.Strings[I];
              
              cdsFileRunStatus.Value := CopyFile(FileSource, FileTargetClient);
            end;

            Status := cdsFileRunStatus.Value;

            if ( Status and (cdsFileRunFileType.AsInteger = 1) ) then
              FontInstall(FileTarget);
          end;

          Post;

          Status := cdsFileRunStatus.Value;

          if ( Status and (cdsFileRunFileType.AsInteger = 1) ) then
            FontInstall(FileTarget);

          if Status then
            ClientInstall;

          grdFileRun.Update;
        end;

        Next;
      end;
    end;

    SetCurrentDir(ExtractFileDir(SystemModule));
    sMessage := SystemModule;

    if ( AcessoExe ) then
      if ( Application.ExeName <> SystemModule ) then
        if ( GetErrorShellExecute(ShellExecute(0, 'Open', PChar(SystemModule), nil, nil, Ord(SW_SHOWNORMAL)), sMessage) ) then
          ShowWarning('O sistema apresentou problemas na sua execução. Solicite suporte técnico.' + #13#13 + sMessage);

  end;

  Application.Terminate;

end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
  {$IFDEF HABIL}
  CopiarArquivoHABIL
  {$ELSE}
  CopiarArquivo;
  {$ENDIF}
end;

function TFrmMain.GetErrorShellExecute(ERROR: Integer;
  var sMessage: String): Boolean;
var
  sFile : String;
begin
  Result := False;

  if ( sMessage = EmptyStr ) then
    sFile := EmptyStr
  else
    sFile := #13 + QuotedStr(Trim(sMessage));

  sMessage := EmptyStr;

  Case ERROR of

    ERROR_FILE_NOT_FOUND:
      sMessage := 'The specified file was not found.' + sFile;

    ERROR_PATH_NOT_FOUND:
      sMessage := 'The specified path was not found.' + sFile;

    ERROR_BAD_FORMAT:
      sMessage := 'The .exe file is invalid (non-Win32 .exe or error in .exe image).' + sFile;

    SE_ERR_ACCESSDENIED:
      sMessage := 'The operating system denied access to the specified file.' + sFile;

    SE_ERR_ASSOCINCOMPLETE:
      sMessage := 'The file name association is incomplete or invalid.' + sFile;

    SE_ERR_DDEBUSY:
      sMessage := 'The DDE transaction could not be completed because other DDE transactions were being processed.' + sFile;

    SE_ERR_DDEFAIL:
      sMessage := 'The DDE transaction failed.' + sFile;

    SE_ERR_DDETIMEOUT:
      sMessage := 'The DDE transaction could not be completed because the request timed out.' + sFile;

    SE_ERR_DLLNOTFOUND:
      sMessage := 'The specified DLL was not found.' + sFile;

//    SE_ERR_FNF:
//      sMessage := 'The specified file was not found.' + sFile;
//
    SE_ERR_NOASSOC:
      sMessage := 'There is no application associated with the given file name extension. This error will also be returned if you attempt to print a file that is not printable.' + sFile;

    SE_ERR_OOM:
      sMessage := 'There was not enough memory to complete the operation.' + sFile;

//    SE_ERR_PNF:
//      sMessage := 'The specified path was not found.' + sFile;
//
    SE_ERR_SHARE:
      sMessage := 'A sharing violation occurred.' + sFile;

    else
      sMessage := EmptyStr;
  end;

  Result := (sMessage <> EmptyStr);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  imgIcon.Picture.Icon := Application.Icon;
end;

end.
