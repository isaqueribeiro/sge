unit UGrAtualizarSistemas;

interface

uses
  blcksock,
  Winapi.ShellAPI,
  ACBrDownloadClass,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ACBrBase, ACBrDownload, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFrmAtualizarSistemas = class(TForm)
    ACBrDownload: TACBrDownload;
    PrgBrDownloads: TProgressBar;
    lConnectionInfo: TLabel;
    bDownload: TBitBtn;
    bPause: TBitBtn;
    bStop: TBitBtn;
    Bevel1: TBevel;
    PnlBanner: TPanel;
    PrgBrArquivos: TProgressBar;
    LblFileDownload: TLabel;
    imgUpgrade: TImage;
    mmInforme: TMemo;
    ImgCompany: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ACBrDownloadHookMonitor(Sender: TObject; const BytesToDownload, BytesDownloaded: Integer;
      const AverageSpeed: Double; const Hour, Min, Sec: Word);
    procedure ACBrDownloadHookStatus(Sender: TObject; Reason: THookSocketReason; const BytesToDownload,
      BytesDownloaded: Integer);
    procedure bDownloadClick(Sender: TObject);
    procedure bPauseClick(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure ACBrDownloadAfterDownload(Sender: TObject);
  private
    { Private declarations }
    aSistemasAgil     ,
    aArquivosInfoHTTP ,
    aListaArquivosURL : TStringList;
    FPastaBackup : String;

    procedure GerarListaSistemasAgil;
    procedure BaixarVersaoInfo;
    procedure BaixandoVersaoInfo;
    procedure VersaoInfoBaixado(Sender: TObject);

    procedure VerificarVersao(const ForcarDownload : Boolean);
    procedure MontarListaURL;
//    procedure BaixarBaixarArquivos(const PastaBackup : String);
    procedure BackupArquivo(const PastaBackup, aFileName : TFileName);
    procedure BaixarArquivos;
    procedure BaixandoArquivos;
    procedure ArquivosBaixados(Sender: TObject);

    function ExisteConexaoComInternet : Boolean;
    function ObterDiretorioExecutavel : String;
    function ObterVersaoHTTP(const aSistema : String) : String;
    function ObterMessageHTTP(const aSistema : String) : String;
    function ObterIdVersaoHTTP(const sVersao : String) : Currency;
    function ObterListaURLArquivosHTTP(const sArquivoInfoHTTP : TFileName) : TStringList;
  public
    { Public declarations }
    property SistemasAgil : TStringList read aSistemasAgil;
    property ArquivosInfoHTTP : TStringList read aArquivosInfoHTTP;
    property ListaArquivosURL : TStringList read aListaArquivosURL;

    function PrecisaAtualizarSistema : Boolean;
  end;

var
  FrmAtualizarSistemas: TFrmAtualizarSistemas;

implementation

{$R *.dfm}

uses
    WinInet
  , UConstantesDGE
  , UFuncoes;

procedure TFrmAtualizarSistemas.VerificarVersao(const ForcarDownload : Boolean);
var
  aSistema    ,
  aVersaoInfo : String;
  I : Integer;
begin
  for I := 0 to Pred(SistemasAgil.Count) do
  begin
    aSistema := SistemasAgil.Strings[I];

    if FileExists(aSistema) then
    begin
      if ForcarDownload then
        aArquivosInfoHTTP.Add( ObterDiretorioExecutavel + 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf') )
      else
      // Se a versão local for inferior a versão disponibilizada no servidor Web
      if GetExeVersionID(aSistema) < ObterIdVersaoHTTP(ObterVersaoHTTP(aSistema)) then
        aArquivosInfoHTTP.Add( ObterDiretorioExecutavel + 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf') );
    end;
  end;
end;

procedure TFrmAtualizarSistemas.FormCreate(Sender: TObject);
begin
  bDownload.Left := bStop.Left;
  bPause.Visible := False;
  bStop.Visible  := False;

  aSistemasAgil := TStringList.Create;
  aSistemasAgil.Clear;

  aArquivosInfoHTTP := TStringList.Create;
  aArquivosInfoHTTP.Clear;

  GerarListaSistemasAgil;

  mmInforme.Lines.Text := ObterMessageHTTP(ParamStr(1));
  if (mmInforme.Lines.Count > 16) then
    mmInforme.ScrollBars := TScrollStyle.ssVertical;
end;

procedure TFrmAtualizarSistemas.GerarListaSistemasAgil;
var
  aProcesso ,
  aSistemaParaAtualizar : String;
  I : Integer;
begin
  aSistemaParaAtualizar := Trim(ParamStr(1)) + '.exe';

  aSistemasAgil.Clear;

  if (aSistemaParaAtualizar = EmptyStr) or (not FileExists(aSistemaParaAtualizar)) then
  begin
    aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGI.exe');
    aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGO.exe');
    aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGE.exe');
    aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGE_PDV.exe');
  end
  else
    aSistemasAgil.Add(aSistemaParaAtualizar);

  // Remover processo da memória do Windows
  for I := 0 to Pred(aSistemasAgil.Count) do
  begin
    aProcesso := aSistemasAgil.Strings[I];
    aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
    KillTask(aProcesso);
  end;
end;

function TFrmAtualizarSistemas.ObterDiretorioExecutavel: String;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function TFrmAtualizarSistemas.ObterIdVersaoHTTP(const sVersao: String): Currency;
var
  I : Integer;
  sVersaoID : String;
  aVersao   : TArray<String>;
  aRetorno  : Currency;
begin
  aVersao   := sVersao.Split(['.'], 4);
  sVersaoID := EmptyStr;

  for I := Low(aVersao) to High(aVersao) do
    sVersaoID := sVersaoID + FormatFloat('00', StrToIntDef(aVersao[I], 0));

  Result := StrToCurrDef(sVersaoID, 0);
end;

function TFrmAtualizarSistemas.ObterListaURLArquivosHTTP(const sArquivoInfoHTTP: TFileName): TStringList;
var
  aRetorno ,
  aArquivo : TStringList;
  aStr : String;
  I : Integer;
begin
  aRetorno := TStringList.Create;
  aArquivo := TStringList.Create;
  try
    aRetorno.Create;
    aArquivo.Create;

    if FileExists(sArquivoInfoHTTP) then
    begin
      aArquivo.LoadFromFile(sArquivoInfoHTTP);
      for I := 0 to aArquivo.Count - 1 do
      begin
        aStr := Trim(aArquivo.Strings[I]);
        if (AnsiUpperCase(Copy(aStr, 1, 4)) = AnsiUpperCase('#url')) then
          aRetorno.Add( Copy(aStr, Pos('=', aStr) + 1, Length(aStr)) );
      end;
    end;
  finally
    aArquivo.Free;

    Result := aRetorno;
  end;
end;

function TFrmAtualizarSistemas.ObterMessageHTTP(const aSistema: String): String;
var
  aRetorno    ,
  aVersaoInfo : String;
  aInfo : TStringList;
  I : Integer;
  aLer : Boolean;
begin
  aRetorno    := EmptyStr;
  aVersaoInfo := ObterDiretorioExecutavel + 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf');

  if FileExists(aVersaoInfo) then
  begin
    aInfo := TStringList.Create;
    aLer  := False;
    try
      aInfo.LoadFromFile(aVersaoInfo);
      for I := 0 to aInfo.Count - 1 do
      begin
        if not aLer then
          aLer := (Pos('#message=', aInfo.Strings[I]) > 0);

        if aLer then
        begin
          if (aRetorno = EmptyStr) then
            aRetorno := Trim(aSistema + ' Versão ' + ObterVersaoHTTP(aSistema) + #13 + aInfo.Strings[I]) + #13
          else
            aRetorno := aRetorno + #13 + aInfo.Strings[I];

          if (Pos('}', aInfo.Strings[I]) > 0) then
            aLer := False;
        end;
      end;

      aRetorno := StringReplace(aRetorno, '#message={', '', [rfReplaceAll]);
      aRetorno := StringReplace(aRetorno, '}', '', [rfReplaceAll]);

    finally
      aInfo.Free;
    end;
  end;

  Result := aRetorno;
end;

function TFrmAtualizarSistemas.ObterVersaoHTTP(const aSistema: String): String;
var
  aRetorno    ,
  aVersaoInfo : String;
  aInfo : TStringList;
  I : Integer;
begin
  aRetorno    := EmptyStr;
  aVersaoInfo := ObterDiretorioExecutavel + 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf');

  if FileExists(aVersaoInfo) then
  begin
    aInfo := TStringList.Create;
    try
      aInfo.LoadFromFile(aVersaoInfo);
      for I := 0 to aInfo.Count - 1 do
      begin
        if (Pos('#version=', aInfo.Strings[I]) > 0) then
        begin
          aRetorno := StringReplace(aInfo.Strings[I], '#version=', '', [rfReplaceAll]);
          Break;
        end;
      end;
    finally
      aInfo.Free;
    end;
  end;

  Result := aRetorno;
end;

function TFrmAtualizarSistemas.PrecisaAtualizarSistema: Boolean;
var
  aSistema : String;
begin
  aSistema := Trim(ParamStr(1)) + '.exe';
  if not FileExists(aSistema) then
    Result := False
   else
    Result := GetExeVersionID(aSistema) < ObterIdVersaoHTTP(ObterVersaoHTTP(aSistema));
end;

procedure TFrmAtualizarSistemas.ACBrDownloadAfterDownload(Sender: TObject);
var
  aFileOLD ,
  aFileNEW : String;
begin
  TThread.Synchronize(TThread.Current, procedure
  begin
    // Tratamento para arquivos DLL
    if (Pos('._dll', ACBrDownload.DownloadNomeArq) > 0) then
    begin
      aFileOLD := '.\' + ACBrDownload.DownloadNomeArq;
      aFileNEW := ChangeFileExt(aFileOLD, '.dll');
      RenameFile(aFileOLD, aFileNEW);
      DeleteFile(aFileOLD);
    end;
  end);
end;

procedure TFrmAtualizarSistemas.ACBrDownloadHookMonitor(Sender: TObject; const BytesToDownload,
  BytesDownloaded: Integer; const AverageSpeed: Double; const Hour, Min, Sec: Word);
var
  sConnectionInfo: string;
begin
  TThread.Synchronize(TThread.Current, procedure
  begin
    LblFileDownload.Caption := '.\' + ACBrDownload.DownloadNomeArq;
    PrgBrDownloads.Position := BytesDownloaded;

    sConnectionInfo := sConnectionInfo + ' - ' +
                       Format('%.2d:%.2d:%.2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

    sConnectionInfo := FormatFloat('0.00 KB/s'  , AverageSpeed) + sConnectionInfo;
    sConnectionInfo := FormatFloat('###,###,##0', BytesDownloaded / 1024) + ' / ' +
                       FormatFloat('###,###,##0', BytesToDownload / 1024) + ' KB - ' + sConnectionInfo;

    lConnectionInfo.Caption := sConnectionInfo;
  end);
end;

procedure TFrmAtualizarSistemas.ACBrDownloadHookStatus(Sender: TObject; Reason: THookSocketReason;
  const BytesToDownload, BytesDownloaded: Integer);
begin
  TThread.Synchronize(TThread.Current, procedure
  begin
    case Reason of
      HR_Connect :
       begin
         PrgBrDownloads.Position := 0;
         bDownload.Enabled := False;
         bPause.Enabled    := True;
         bStop.Enabled     := True;
       end;

      HR_ReadCount :
       begin
         PrgBrDownloads.Max        := BytesToDownload;
         PrgBrDownloads.Position   := BytesDownloaded;
       end;

      HR_SocketClose :
       begin
         case ACBrDownload.DownloadStatus of
           TDownloadStatus.stStop :
             begin
               PrgBrDownloads.Position := 0;
               lConnectionInfo.Caption := 'Download Encerrado...';
               LblFileDownload.Caption := 'File(s).';
             end;

           TDownloadStatus.stPause :
             lConnectionInfo.Caption := 'Download Pausado...';

           TDownloadStatus.stDownload :
           begin
             lConnectionInfo.Caption := 'Download Finalizado.';
             LblFileDownload.Caption := 'Arquivo(s) baixado(s).';
           end;
         end;

         bDownload.Enabled := True;
         bPause.Enabled    := False;
         bStop.Enabled     := False;
       end;
    end;
  end);
end;

procedure TFrmAtualizarSistemas.MontarListaURL;
var
  I : Integer;
  aListaURL : TStringList;
begin
  aListaArquivosURL := TStringList.Create;
  try
    aListaArquivosURL.BeginUpdate;
    aListaArquivosURL.Clear;

    for I := 0 to Pred(ArquivosInfoHTTP.Count) do
    begin
      aListaURL := ObterListaURLArquivosHTTP(ArquivosInfoHTTP.Strings[I]);
      if (aListaURL.Count > 0) then
        aListaArquivosURL.AddStrings( aListaURL );
    end;
  finally
    aListaArquivosURL.EndUpdate;
    PrgBrArquivos.Max := I; //Pred(aListaArquivosURL.Count);
  end;
end;

procedure TFrmAtualizarSistemas.BackupArquivo(const PastaBackup, aFileName: TFileName);
var
  aBackup : String;
begin
  aBackup := ExtractFileName(aFileName);
  ForceDirectories(PastaBackup);

  if not FileExists(PastaBackup + aBackup) then
    CopyFile(PChar(aFileName), PChar(PastaBackup + aBackup), True);
end;

//procedure TFrmAtualizarSistemas.BaixarBaixarArquivos(const PastaBackup : String);
//var
//  I : Integer;
//  aApp  ,
//  aURL  ,
//  aFile : String;
//  aStr  : TStringList;
//begin
//  PrgBrArquivos.Max := aListaArquivosURL.Count - 1;
//
//  for I := 0 to ListaArquivosURL.Count - 1 do
//  begin
//    aURL := ListaArquivosURL.Strings[I];
//    aStr := TStringList.Create;
//    Split('/', aURL, aStr);
//    aFile := aStr[aStr.Count - 1];
//
//    BackupArquivo(PastaBackup, aFile);
//
//    ACBrDownload.DownloadUrl     := aURL;
//    ACBrDownload.DownloadNomeArq := aFile;
//    ACBrDownload.DownloadDest    := '.\';
//
//    ACBrDownload.StartDownload;
//
//    PrgBrArquivos.Position := I;
//  end;
//
//  PrgBrDownloads.Position := PrgBrDownloads.Max;
//
//  if (PrgBrArquivos.Position = PrgBrArquivos.Max) then
//    Application.MessageBox('Arquivos de sistema atualizados como sucesso', 'Atualizar Sistemas Ágil', MB_ICONINFORMATION);
//end;
//
procedure TFrmAtualizarSistemas.BaixarArquivos;
var
  aThread : TThread;
begin
  aThread := TThread.CreateAnonymousThread(BaixandoArquivos);
  aThread.OnTerminate := ArquivosBaixados;
  aThread.Start;
end;

procedure TFrmAtualizarSistemas.BaixandoArquivos;
var
  I : Integer;
  aApp  ,
  aURL  ,
  aFile : String;
  aStr  : TStringList;
begin
  for I := 0 to Pred(ListaArquivosURL.Count) do
  begin
    aURL := ListaArquivosURL.Strings[I];
    aStr := TStringList.Create;
    Split('/', aURL, aStr);
    aFile := aStr[aStr.Count - 1];

    BackupArquivo(FPastaBackup, aFile);

    ACBrDownload.DownloadUrl     := aURL;
    ACBrDownload.DownloadNomeArq := aFile;
    ACBrDownload.DownloadDest    := '.\';

    ACBrDownload.StartDownload;

    TThread.Synchronize(TThread.Current, procedure
    begin
      PrgBrArquivos.Position := I;
    end);
  end;
end;

procedure TFrmAtualizarSistemas.ArquivosBaixados(Sender: TObject);
var
  aSistema : String;
begin
  bDownload.Enabled := True;
  PrgBrDownloads.Position := PrgBrDownloads.Max;

  if (Sender is TThread) then
  begin
    if Assigned(TThread(Sender).FatalException) then
      Application.MessageBox(PChar('Erro ao tentar baixar arquivos.' + #13 + Exception(TThread(Sender).FatalException).Message), 'Erro!', MB_ICONERROR)
    else
    begin
      if (PrgBrArquivos.Position = PrgBrArquivos.Max) then
        Application.MessageBox('Arquivos de sistema atualizados como sucesso', 'Atualizar Sistemas Ágil', MB_ICONINFORMATION);

      aSistema := Trim(ParamStr(1));
      if (aSistema <> EmptyStr) then
      begin
        aSistema := aSistema + '.exe';

        ShellExecute(Handle, 'Open', PChar(aSistema), '', '', SW_NORMAL);
        Application.Terminate;
      end;
    end;
  end;
end;

procedure TFrmAtualizarSistemas.BaixarVersaoInfo;
//var
//  aSistema    ,
//  aVersaoInfo : String;
//  I : Integer;
var
  aThread : TThread;
begin
//  for I := 0 to SistemasAgil.Count - 1 do
//  begin
//    aSistema := SistemasAgil.Strings[I];
//
//    if FileExists(aSistema) then
//    begin
//      aVersaoInfo := StringReplace(aSistema, '.exe', '_Upgrade.inf', [rfReplaceAll]);
//
//      //ACBrDownload.DownloadUrl     := DOWNLOAD_URL_AGIL_SOFTWARES_UPGRADE + ExtractFileName(aVersaoInfo);
//      ACBrDownload.DownloadUrl     := DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE + ExtractFileName(aVersaoInfo);
//      ACBrDownload.DownloadNomeArq := 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf');
//      ACBrDownload.DownloadDest    := '.\';
//
//      ACBrDownload.StartDownload;
//    end;
//  end;
  bDownload.Enabled := False;

  aThread := TThread.CreateAnonymousThread(BaixandoVersaoInfo);
  aThread.OnTerminate := VersaoInfoBaixado;
  aThread.Start;
end;

procedure TFrmAtualizarSistemas.BaixandoVersaoInfo;
var
  aSistema    ,
  aVersaoInfo : String;
  I : Integer;
begin
  for I := 0 to SistemasAgil.Count - 1 do
  begin
    aSistema := SistemasAgil.Strings[I];

    if FileExists(aSistema) then
    begin
      aVersaoInfo := StringReplace(aSistema, '.exe', '_Upgrade.inf', [rfReplaceAll]);

      //ACBrDownload.DownloadUrl     := DOWNLOAD_URL_AGIL_SOFTWARES_UPGRADE + ExtractFileName(aVersaoInfo);
      ACBrDownload.DownloadUrl     := DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE + ExtractFileName(aVersaoInfo);
      ACBrDownload.DownloadNomeArq := 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf');
      ACBrDownload.DownloadDest    := '.\';

      ACBrDownload.StartDownload;
    end;
  end;
end;

procedure TFrmAtualizarSistemas.VersaoInfoBaixado(Sender: TObject);
begin
  if (Sender is TThread) then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      bDownload.Enabled := True;
      Application.MessageBox(PChar('Erro ao tentar verificar a versão mais recente da aplicação.' + #13 + Exception(TThread(Sender).FatalException).Message), 'Erro!', MB_ICONERROR);
    end
    else
    begin
      VerificarVersao(True);

      mmInforme.Lines.Text := ObterMessageHTTP(ParamStr(1));
      if (mmInforme.Lines.Count > 16) then
        mmInforme.ScrollBars := TScrollStyle.ssVertical;

      MontarListaURL;
      BaixarArquivos;
    end;
  end;
end;

procedure TFrmAtualizarSistemas.bDownloadClick(Sender: TObject);
var
  aPastaBkp,
  aSistema : String;
begin
//  aPastaBkp := ExtractFilePath(ParamStr(0)) + 'files_bkp\' + FormatDateTime('yymmdd"_"hh"h"mm', Now) + '\';
//  ForceDirectories(aPastaBkp);
//
//  aArquivosInfoHTTP.Clear;
//
//  if not ExisteConexaoComInternet then
//    ShowMessage('Sem conexão!')
//  else
//  begin
//    BaixarVersaoInfo;
//    VerificarVersao(True);
//
//    mmInforme.Lines.Text := ObterMessageHTTP(ParamStr(1));
//    if (mmInforme.Lines.Count > 16) then
//      mmInforme.ScrollBars := TScrollStyle.ssVertical;
//
//    MontarListaURL;
//    BaixarBaixarArquivos(aPastaBkp);
//  end;
//
//  aSistema := Trim(ParamStr(1));
//  if (aSistema <> EmptyStr) then
//  begin
//    aSistema := aSistema + '.exe';
//
//    ShellExecute(Handle, 'Open', PChar(aSistema), '', '', SW_NORMAL);
//    Application.Terminate;
//  end;
  if not ExisteConexaoComInternet then
    ShowMessage('Sem conexão com a internet!')
  else
  begin
    aPastaBkp := ExtractFilePath(ParamStr(0)) + 'files_bkp\' + FormatDateTime('yymmdd"_"hh"h"mm', Now) + '\';
    ForceDirectories(aPastaBkp);
    FPastaBackup := aPastaBkp;

    aArquivosInfoHTTP.Clear;
    BaixarVersaoInfo;
  end;
end;

procedure TFrmAtualizarSistemas.bPauseClick(Sender: TObject);
begin
  ACBrDownload.DownloadStatus := TDownloadStatus.stPause;
end;

procedure TFrmAtualizarSistemas.bStopClick(Sender: TObject);
begin
  ACBrDownload.DownloadStatus := TDownloadStatus.stStop;
end;

function TFrmAtualizarSistemas.ExisteConexaoComInternet : Boolean;
var
  nFlags : Cardinal;
begin
  // Retorna True se houver conexão com a internet
  Result := InternetGetConnectedState(@nFlags, 0);
end;

end.
