library UDF_Misc;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  Windows,
  Classes,
  SysUtils,
  Types,
  DateUtils,
  Math,
  Registry,
  MaskUtils,
  unt_Functions in '..\_Defaults\_units\unt_Functions.pas',
  unt_Base64 in '..\_Defaults\_units\unt_Base64.pas',
  unt_BlockCiphers in '..\_Defaults\_units\unt_BlockCiphers.pas',
  unt_Crypto in '..\_Defaults\_units\unt_Crypto.pas',
  unt_CryptoCast128 in '..\_Defaults\_units\unt_CryptoCast128.pas',
  unt_CryptoConst in '..\_Defaults\_units\unt_CryptoConst.pas',
  unt_Constants in '..\_Defaults\_units\unt_Constants.pas';

const
  EXE_GSEC               = 'gsec.exe';
  EXE_GBAK               = 'gbak.exe';
  ROOT_KEY               = HKEY_LOCAL_MACHINE;
  KEY_SOFTWARE_FIREBIRD  = 'SOFTWARE\Firebird Project\Firebird Server\Instances';
  KEY_DIRECTORY_FIREBIRD = 'DefaultInstance';
  DIRECTORY_FIREBIRD_BIN = 'Bin\';
  DIRECTORY_FIREBIRD_UDF = 'UDF\';

{$R *.res}

{Esperar um processo ser finalizado para prosseguir na execução}
function WinExecAndWait32(FileName : String; Visibility : Integer) : Cardinal;
var
  zAppName    : array[0..512] of char;
  zCurDir     : array[0..255] of char;
  WorkDir     : String;
  StartupInfo : TStartupInfo;
  ProcessInfo : TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, Sizeof(StartupInfo), #0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  StartUpInfo.lpReserved  := nil;

  if not CreateProcess(nil,
                       zAppName,                      { pointer to command line string }
                       nil,                           { pointer to process security attributes }
                       nil,                           { pointer to thread security attributes }
                       false,                         { handle inheritance flag }
                       CREATE_NEW_CONSOLE or          { creation flags }
                       NORMAL_PRIORITY_CLASS,
                       nil,                           { pointer to new environment block }
                       nil,                           { pointer to current directory name }
                       StartupInfo,                   { pointer to STARTUPINFO }
                       ProcessInfo) then
    Result := 0  { pointer to PROCESS_INF } // or -1

  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess (ProcessInfo.hProcess, Result);
  end;
end;

function WinExec32(FileCommand : String; const Visibility : Integer = SW_HIDE) : Smallint;
var
  Err : Smallint;
begin
  if ( Trim(FileCommand) <> EmptyStr ) then
  begin
    Err := WinExec( PAnsiChar(FileCommand), Visibility);
    if ( Err > 31 ) then
      Result := 0
    else
      Result := 1;
  end
  else
    Result := 1;
end;

{Verificar se o FireBird está instalado}
function udf_IsFireBirdInstall : Integer; cdecl; export;
var
  Reg : TRegistry;
begin
  try
    Reg := TRegistry.Create;
    with Reg do
    begin
      RootKey := ROOT_KEY;

      if OpenKey(KEY_SOFTWARE_FIREBIRD, False) then
        Result  := 0
      else
        Result  := 1;

      CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

{Retorna o diretório onde o FireBird está instalado}
function udf_GetDirectoryFireBird : PChar; cdecl; export;
var
  Reg : TRegistry;
begin
  if (udf_IsFireBirdInstall = 0) then
    try
      Reg := TRegistry.Create;
      with Reg do
      begin
        RootKey := ROOT_KEY;

        if OpenKey(KEY_SOFTWARE_FIREBIRD, False) then
          Result := PChar(ReadString(KEY_DIRECTORY_FIREBIRD))
        else
          Result := PChar(EmptyStr);

        CloseKey;
      end;
    finally
      Reg.Free;
    end;
end;

{Deletar usuário da base Security2 do FireBird}
function udf_DeleteUser(UserName: PChar) : Integer; cdecl; export;
var
  ERR : Integer;
  Cmd : String;
begin
  try
    if ( udf_IsFireBirdInstall = 0 ) and (Trim(UserName) <> EmptyStr) then
    begin

      if ( UpperCase(Trim(UserName)) <> 'SYSDBA' ) then
      begin

        Cmd := udf_GetDirectoryFireBird + DIRECTORY_FIREBIRD_BIN + EXE_GSEC +
               ' -del ' + UserName + ' -user SYSDBA -password masterkey';

        ERR    := WinExecAndWait32( Cmd, SW_HIDE );
        Result := ERR;

      end
      else
        Result := 1;

    end
    else
      Result := 1;
  except
    Result := 1;
  end;
end;

{Inserir usuário e senha na base Security2 do FireBird}
function udf_InsertUser(UserName, PassWord : PChar; Encrypted : Integer) : Integer; cdecl; export;
var
  ERR : Integer;
  Cmd : String;
begin
  try
    if ( udf_IsFireBirdInstall = 0 )    and
       (Trim(UserName) <> EmptyStr) and
       (Trim(PassWord) <> EmptyStr) then
    begin

      if ( UpperCase(Trim(UserName)) <> 'SYSDBA' ) then
      begin

        if ( Trim(PassWord) = '' ) then
          PassWord := 'masterkey'
        else
          if ( Encrypted = 1 ) then
            PassWord := PChar( Decrypt(PassWord) );

        udf_DeleteUser(UserName);
        Cmd := udf_GetDirectoryFireBird + DIRECTORY_FIREBIRD_BIN + EXE_GSEC +
               ' -add ' + UserName + ' -pw ' + PassWord + ' -user SYSDBA -password masterkey';

       {DONE 0 -oIsaque -cAnalisar : Verificar a possibilitadade de elaborar uma segunda forma de execução (0)}
        ERR    := WinExecAndWait32( Cmd, SW_HIDE );
        Result := ERR;

      end
      else
        Result := 1;
    end
    else
      Result := 1;
  except
    Result := 1;
  end;
end;

{Gerar backup da base de dados informada}
function udf_ExecuteBackup(DirBackup, ServerName, BaseName, UserName : PChar; TimeOut : Integer) : Integer; cdecl; export;
var
  Log,
  Bkp,
  Cmd : String;
  ERR,
  Tmr : Integer;
begin
  try
    if ( udf_IsFireBirdInstall = 0 )      and
       (Trim(DirBackup)  <> EmptyStr) and
       (Trim(ServerName) <> EmptyStr) and
       (Trim(BaseName)   <> EmptyStr) then
    begin

      if ( Copy(DirBackup, Length(DirBackup), 1) <> '\') then
        DirBackup := PChar( DirBackup + '\' );

      if ( not DirectoryExists(DirBackup) ) then
        ForceDirectories(DirBackup);

      Bkp := BaseName  + FormatDateTime('"."yyyymmdd.hhmmss".fbk"', Now);
      Bkp := '"' + DirBackup + Bkp + '"';

      Log := StringReplace(Bkp, '.fbk', '.log', [rfReplaceAll]);
      Log := StringReplace(Log, '"', '', [rfReplaceAll]);

      Cmd := udf_GetDirectoryFireBird + DIRECTORY_FIREBIRD_BIN + EXE_GBAK;
      Cmd := ExtractShortPathName(Cmd) +
             ' -v -y "' + Log + '"'    +
             ' -user SYSDBA -pass masterkey -b ' + ServerName + ':' + BaseName +
             ' ' + Bkp;

      {DONE 0 -oIsaque -cAnalisar : Verificar a possibilitadade de elaborar uma segunda forma de execução (1)}
      ERR := WinExecAndWait32( Cmd, SW_HIDE );
      Bkp := StringReplace(Bkp, '"', '', [rfReplaceAll]);

      Tmr := 0;
      repeat
        Inc(Tmr, 2);
      until (FileExists(Bkp) or (Tmr >= TimeOut));

      Result := ERR;

    end
    else
      Result := 1;
  except
    Result := 1;
  end;
end;

function udf_GetVersionApp(PathNome : PChar) : PChar; cdecl; export;
var
  v1,
  v2,
  v3,
  v4             : Word;
  ver_infosize,
  ver_valuesize,
  dummy          : DWord;
  ver_info       : Pointer;
  ver_value      : PVSFixedFileInfo;
begin
  try
    ver_infosize := GetFileVersionInfoSize(PChar(PathNome), dummy);
    GetMem(ver_info, ver_infosize);
    GetFileVersionInfo(PChar(PathNome), 0, ver_infosize, ver_info);
    VerQueryValue(ver_info, '\', Pointer(ver_value), ver_valuesize);

    With ver_value^ do
    begin
      v1 := dwFileVersionMS shr 16;
      v2 := dwFileVersionMS and $FFFF;
      v3 := dwFileVersionLS shr 16;
      v4 := dwFileVersionLS and $FFFF;
    end;

    FreeMem(ver_info, ver_infosize);

    Result := PChar( IntToStr(v1) + '.' +
                     IntToStr(v2) + '.' +
                     IntToStr(v3) + '.' +
                     IntToStr(v4) );
  except
    Result := PChar(EmptyStr);
  end;
end;

{Retorna a versão do biblioteca esterba de funçoes}
function udf_GetVersionUDF : PChar; cdecl; export;
var
  Udf : String;
begin
  Udf    := udf_GetDirectoryFireBird + DIRECTORY_FIREBIRD_UDF + 'UDF_Misc.dll';
  Result := udf_GetVersionApp(PChar(Udf));
end;

function udf_FormatMaskText( Mask, Text : PChar ): PChar; cdecl; export;
begin
  Result := PChar(FormatMaskText( Mask, Text));
end;

function udf_FormatFloat( Mask : PChar; var X : Double ): PChar; cdecl; export;
begin
  Result := PChar(FormatFloat( Mask, X));
end;

exports
  udf_IsFireBirdInstall,
  udf_GetDirectoryFireBird,
  udf_DeleteUser,
  udf_InsertUser,
  udf_ExecuteBackup,
  udf_GetVersionApp,
  udf_GetVersionUDF,
  udf_FormatMaskText,
  udf_FormatFloat;

begin
  Randomize;
end.
