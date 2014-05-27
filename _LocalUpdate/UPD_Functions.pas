unit UPD_Functions;

interface

uses
  Forms, Windows, Dialogs, Classes, SysUtils, DB, DBClient, IniFiles;


procedure FontInstall( const FontName : string );
procedure ShowInforme(sMessage: String);
procedure ShowWarning(sMessage: String);
procedure ShowError(sMessage: String);

function ExtractSystemDir : string;
function ExtractWindowsDir : string;
function ExtractSystemNameModule : string;
function NeedUpdate(TargetSite, SourceSite: TFileName): boolean;
function LoadSystemList( const DataSet : TClientDataSet ) : boolean;
function LoadSystemListHABIL( const DataSet : TClientDataSet ) : boolean;

var
  ArqIni : TIniFile;
  LibraryClient,
  SourceSite   ,
  TargetSite   ,
  TargetClientSite,
  FileExecute : String;
  AcessoExe   : Boolean;

implementation


//AddFontResource(PChar('c:\MyFonts\Monospac.ttf'));
//Screen.Fonts.Add(PChar('c:\sgdb\EanBwrP36Tt.ttf'));

function ExtractWindowsDir : string;
var
  MeuBuffer: array [1..128] of Char;
  retorno: Integer;
begin

  retorno := GetWindowsDirectory(@MeuBuffer,128);
  if ((retorno>128)or(retorno=0)) then
     result := ''
  else result := IncludeTrailingPathDelimiter(StrPas(@MeuBuffer));

end;

function ExtractSystemDir : string;
var
  MeuBuffer: array [1..128] of Char;
  Retorno : Integer;
begin

  Retorno := GetSystemDirectory(@MeuBuffer,128);

  if ((retorno>128)or(retorno=0)) then
    Result := ''
  else
    Result := IncludeTrailingPathDelimiter(StrPas(@MeuBuffer));

end;

function FontExists( const FontName : string ) : boolean;
begin
  with Screen.Fonts do
    Result := IndexOf(Trim(FontName)) >= 0;
end;

procedure FontInstall( const FontName : string );
begin
  AddFontResource(PChar(FontName));
end;

procedure ShowInforme(sMessage: String);
begin
  Application.MessageBox(PChar(sMessage), PChar(Application.Title), MB_ICONINFORMATION);
end;

procedure ShowWarning(sMessage: String);
begin
  Application.MessageBox(PChar(sMessage), PChar(Application.Title), MB_ICONWARNING);
end;

procedure ShowError(sMessage: String);
begin
  Application.MessageBox(PChar(sMessage), PChar(Application.Title), MB_ICONERROR);
end;

function ExtractSystemNameModule : string;
var
  ExeName : string;
begin
  ExeName := ExtractFileName(Application.ExeName);
  Result  := copy(ExeName, 1, pos('.', ExeName)-1);
end;

function NeedUpdate(TargetSite, SourceSite: TFileName): boolean;
var
  LocalFileAge, RemoteFileAge: Integer;
begin
  Result := false;

  ForceDirectories( ExtractFilePath(TargetSite) );
  
  LocalFileAge  := FileAge(TargetSite);
  RemoteFileAge := FileAge(SourceSite);

  if (RemoteFileAge = -1) then Exit;

  result := ((RemoteFileAge - LocalFileAge) > 0);

end;

procedure LoadFileConfig;
var
  FileName : string;
begin

  {$IFDEF HABIL}
  FileName := StringReplace(Application.ExeName, '.exe', '.ini', [rfReplaceAll]);

  if not FileExists(FileName) then
  begin
    ShowWarning('Não achei o arquivo de configuração ' + FileName);
    Abort;
  end;

  ArqIni := TIniFile.Create(FileName);
  {$ELSE}
  FileName := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  FileName := FileName + ExtractSystemNameModule;

  if not FileExists(FileName + '.ini') then
  begin
    ShowWarning('Não achei o arquivo de configuração ' + FileName);
    Abort;
  end;

  ArqIni := TIniFile.Create(FileName + '.ini');
  {$ENDIF}

  with ArqIni do
    try
      SourceSite       := ReadString('SystemModule', 'SourceSite', SourceSite );
      TargetSite       := ReadString('SystemModule', 'TargetSite', TargetSite );
      TargetClientSite := ReadString('SystemModule', 'TargetClientSite', EmptyStr );
      LibraryClient := ReadString('Firebird',     'LibraryClient', LibraryClient );
      FileExecute   := ReadString('Controle',     'Executar',      TargetSite + ExtractSystemNameModule + '.exe' );
      AcessoExe     := ReadBool  ('Controle',     'Acesso',        True );

      if ( Trim(TargetSite) <> EmptyStr  ) then
        ForceDirectories(TargetSite);

      if ( Trim(TargetClientSite) <> EmptyStr  ) then
        ForceDirectories(TargetClientSite);
    finally
      SourceSite := IncludeTrailingPathDelimiter(SourceSite);
      TargetSite := IncludeTrailingPathDelimiter(TargetSite);

      if ( TargetClientSite <> EmptyStr ) then
        TargetClientSite := IncludeTrailingPathDelimiter(TargetClientSite);
    end;

end;

function LoadSystemList( const DataSet : TClientDataSet ) : boolean;
var
  FileIndex : Smallint;
  SystemLista : TStringList;
  SystemFonte : TStringList;
  FileName  : string;
begin

  LoadFileConfig;

  FileName := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  FileName := FileName + ExtractSystemNameModule;

  Result := true;

  try
    SystemLista := TStringList.Create;
    SystemLista.LoadFromFile(FileName + '.lst');
  except
    SystemLista.Free;
    ShowError('Não achei o arquivo ' + FileName + '.lst');
    Result := false;
    Exit;
  end;

  try
    SystemFonte := TStringList.Create;
    SystemFonte.LoadFromFile(FileName + '.fnt');
  except
  end;

  with SystemLista, DataSet do
    if Count > 0 then
      try
        Close;
        CreateDataSet;

        for FileIndex := 0 to Count-1 do
        begin
          Append;
          Fields[0].Value := False;
          Fields[1].Value := SystemLista[FileIndex];
          Fields[2].Value := SourceSite;
          Fields[3].Value := TargetSite;
          Fields[4].Value := TargetClientSite;
          Fields[5].Value := 0;
          Post;
        end;
      except
        On E : Exception do
        begin
          ShowError('Há um problema na lista de arquivos.' + #13#13 + E.Message);
          Result := false;
        end;
      end;

  with SystemFonte, DataSet do
    if Count > 0 then
    try
      if not Active then
        CreateDataSet;

      for FileIndex := 0 to Count - 1 do
      begin
        Append;
        Fields[0].Value := False;
        Fields[1].Value := SystemFonte[FileIndex];
        Fields[2].Value := SourceSite;
        Fields[3].Value := TargetSite;
        Fields[4].Value := TargetClientSite;
        Fields[5].Value := 1; // Tipo Fonts
        Post;
      end;
    except
      On E : Exception do
      begin
        ShowError('Há um problema na lista de fontes do windows.' + #13#13 + E.Message);
        Result := false;
      end;
    end;

  if ( Assigned(SystemLista) ) then
    SystemLista.Free;

  if ( Assigned(SystemFonte) ) then
    SystemFonte.Free;

end;

function LoadSystemListHABIL( const DataSet : TClientDataSet ) : boolean;
var
  FileIndex : Smallint;
  Aliases   : TStringList;
  FileName  : string;
begin

  LoadFileConfig;

  FileName := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  FileName := FileName + ExtractSystemNameModule;

  Result := true;

  Aliases := TStringList.Create;
  ArqIni.ReadSection('Aliases', Aliases);

  with Aliases, DataSet do
    if Count > 0 then
      try
        Close;
        CreateDataSet;

        for FileIndex := 0 to Count - 1 do
        begin
          Append;

          Fields[0].Value := False;
          Fields[1].Value := Aliases.Strings[FileIndex];
          Fields[2].Value := SourceSite + Aliases.Strings[FileIndex];
          Fields[3].Value := TargetSite + ArqIni.ReadString('Aliases', Aliases.Strings[FileIndex], EmptyStr);

          if ( TargetClientSite <> EmptyStr ) then
            Fields[4].Value := TargetClientSite + ArqIni.ReadString('Aliases', Aliases.Strings[FileIndex], EmptyStr);

          if ( Pos('ttf', Fields[2].Value) > 0 ) then
            Fields[5].Value := 1 // Tipo Fonts
          else
            Fields[5].Value := 0;

          Post;
        end;
      except
        On E : Exception do
        begin
          ShowError('Há um problema na lista de arquivos configurada na seção "Aliases".' + #13#13 + E.Message);
          Result := false;
        end;
      end;

  if ( Assigned(Aliases) ) then
    Aliases.Free;

end;

end.
