unit View.AutoUpgrade;

interface

uses
  blcksock,
  Winapi.ShellAPI,
  ACBrBase,
  ACBrDownload,
  ACBrDownloadClass,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, // auHTTP, auAutoUpgrader,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFrmAutoUpgrade = class(TForm)
    Label1: TLabel;
    lblProgresso: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lblURLApp: TLabel;
    lblURLInfo: TLabel;
    btnVerificarUpgrade: TButton;
    prgBrAtualizacao: TProgressBar;
    imgUpgrade: TImage;
    ACBrDownload: TACBrDownload;
    procedure btnVerificarUpgradeClick(Sender: TObject);
    procedure AutoUpgraderProProgress(Sender: TObject; const FileURL: string;
      FileSize, BytesRead, ElapsedTime, EstimatedTimeLeft: Integer;
      PercentsDone, TotalPercentsDone: Byte; TransferRate: Single);
    procedure FormCreate(Sender: TObject);
    procedure AutoUpgraderProAborted(Sender: TObject);
    procedure AutoUpgraderProNoUpdateAvailable(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AutoUpgraderProFileDone(Sender: TObject; const FileName: string);
    procedure FormShow(Sender: TObject);
    procedure AutoUpgraderProEndUpgrade(Sender: TObject; var RestartImediately: Boolean);
    procedure lblURLInfoClick(Sender: TObject);
    procedure lblURLAppClick(Sender: TObject);
    procedure ACBrDownloadHookStatus(Sender: TObject; Reason: THookSocketReason; const BytesToDownload,
      BytesDownloaded: Integer);
    procedure ACBrDownloadHookMonitor(Sender: TObject; const BytesToDownload, BytesDownloaded: Integer;
      const AverageSpeed: Double; const Hour, Min, Sec: Word);
    procedure ACBrDownloadAfterDownload(Sender: TObject);
  private
    { Private declarations }
    aFileInfoVersion : TFileName;
    ArquivosBaixados : TStringList;
    procedure LabelTransparente;
    procedure GerarUpgrade;

    procedure BaixarInfo;
    procedure BaixarArquivo(const aUrl, aFileName : String);
    procedure BaixarAtualizacao;

    function ObterVersaoHTTP : String;
    function ObterMessageHTTP : String;
    function ObterIdVersaoHTTP(const sVersao : String) : Currency;
  public
    { Public declarations }
  end;

var
  FrmAutoUpgrade : TFrmAutoUpgrade;

const
  UPGRADE_AGIL = 'UpgradeAgil.exe';

  procedure AtivarUpgradeAutomatico;

implementation

{$R *.dfm}

uses
//  auUtils,
  UFuncoes,
  UConstantesDGE,
  UDMBusiness,
  uDMRecursos;

procedure AtivarUpgradeAutomatico;
begin
  if FormFunction.EstaAberto('frmGeAutoUpgrade') or Assigned(FrmAutoUpgrade) then
    Exit;

  try
    try

      FrmAutoUpgrade := TFrmAutoUpgrade.Create(Application);
      //frmGeAutoUpgrade.AutoUpgraderPro.AutoCheck := True;

      with FrmAutoUpgrade do
      begin
        BaixarInfo;
        if gVersaoApp.VersionID < ObterIdVersaoHTTP(ObterVersaoHTTP) then
          if ShowConfirmation(Caption, ObterMessageHTTP + #13#13 + 'Deseja atualizar agora o sistema?') then
            BaixarAtualizacao;
      end;

    except
    end;
  finally
    if Assigned(FrmAutoUpgrade) then
      FrmAutoUpgrade.Free;
  end;
end;

procedure TFrmAutoUpgrade.GerarUpgrade;
var
  aFileTMP ,
  aFileNEW ,
  aFileOLD ,
  sCommand : String;
  aCommand : TStringList;
  I : Integer;
begin
  if Assigned(ArquivosBaixados) then
    if (ArquivosBaixados.Count > 0) then
    begin
      sCommand := ExtractFilePath(ParamStr(0)) + 'Upgrades.bat';
      aCommand := TStringList.Create;
      try
        aCommand.Add('pause');              // PROVISÓRIO
        aCommand.Add('attrib /s /d -s -h'); // Desocultar arquivos

        for I := ArquivosBaixados.Count - 1 DownTo 0 do
        begin
          aFileTMP := ExtractFileName(ArquivosBaixados.Strings[I]);
          aFileNEW := StringReplace(aFileTMP, '.uTMP', '', [rfReplaceAll]);
          aFileOLD := aFileNEW + '.old';

          if FileExists(aFileOLD) then aCommand.Add('del ' + aFileOLD + ' /s');             // Deletar arquivo antigo
          if FileExists(aFileNEW) then aCommand.Add('rename ' + aFileNEW + ' ' + aFileOLD); // Renomear arquivo atual para guardá-lo
          if FileExists(aFileTMP) then aCommand.Add('rename ' + aFileTMP + ' ' + aFileNEW); // Renomear novo arquivo para disponibilizá-lo
        end;

        aCommand.Add('pause');              // PROVISÓRIO
        aCommand.SaveToFile(sCommand);
      finally
        aCommand.Free;
      end;
    end;
end;

procedure TFrmAutoUpgrade.AutoUpgraderProAborted(Sender: TObject);
begin
  lblProgresso.Caption      := 'Atualização abortada!';
  prgBrAtualizacao.Position := 0;
end;

procedure TFrmAutoUpgrade.AutoUpgraderProEndUpgrade(Sender: TObject; var RestartImediately: Boolean);
begin
  ; //Self.GerarUpgrade;
end;

procedure TFrmAutoUpgrade.AutoUpgraderProFileDone(Sender: TObject;
  const FileName: string);
var
  sFileName : String;
begin
  // Artifício para baixar arquivos de extensão *._DLL, pois determinados
  // servidores Web impedem a publicação de arquivos *.dll.
  // Observação: A extensão "uTMP" pertence ao algorítimo de download dos arquivos.
  if ( Pos('._dll.uTMP', FileName) > 0 ) then
  begin
    sFileName := StringReplace(FileName, '._dll.uTMP', '.dll.uTMP', []);
    RenameFile(FileName, sFileName);
    ArquivosBaixados.Add(sFileName);
  end
  else
    ArquivosBaixados.Add(FileName);

  // Instalar fontes no Windows
  if ( Pos('.TTF.uTMP', FileName) > 0 ) then
    InstalarFonteWindows(SYS_BAUHS93, SYS_BAUHS93_DESCRIPTION);
end;

procedure TFrmAutoUpgrade.AutoUpgraderProNoUpdateAvailable(Sender: TObject);
begin
  lblProgresso.Caption := 'Sem atualização!';
end;

procedure TFrmAutoUpgrade.AutoUpgraderProProgress(Sender: TObject;
  const FileURL: string; FileSize, BytesRead, ElapsedTime,
  EstimatedTimeLeft: Integer; PercentsDone, TotalPercentsDone: Byte;
  TransferRate: Single);
begin
  lblProgresso.Caption      := 'Baixando de ' + QuotedStr(FileURL) + '...';
  prgBrAtualizacao.Position := PercentsDone;
end;

procedure TFrmAutoUpgrade.BaixarArquivo(const aUrl, aFileName: String);
begin
  ACBrDownload.DownloadUrl     := aUrl;
  ACBrDownload.DownloadNomeArq := aFileName + '_v' + ObterVersaoHTTP + Copy(aUrl, Length(aUrl) - 3, 4);
  ACBrDownload.DownloadDest    := '.\';

  DeleteFile('.\' + ACBrDownload.DownloadNomeArq);
  DeleteFile('.\' + ACBrDownload.DownloadNomeArq + '.part');

  ACBrDownload.StartDownload;
end;

procedure TFrmAutoUpgrade.BaixarInfo;
begin
  ACBrDownload.DownloadUrl     := lblURLInfo.Caption;
  ACBrDownload.DownloadNomeArq := 'VersaoHTTP_' + gPersonalizaEmpresa.InternalName + '.inf';
  ACBrDownload.DownloadDest    := '.\';
  ACBrDownload.StartDownload;

  aFileInfoVersion := ExtractFilePath(ParamStr(0)) + ACBrDownload.DownloadNomeArq;
end;

procedure TFrmAutoUpgrade.BaixarAtualizacao;
begin
  //ACBrDownload.DownloadUrl     := 'http://' + DOWNLOAD_URL_AGIL_SOFTWARES_UPGRADE + 'AtualizarSistemasAgil.exe';
  ACBrDownload.DownloadUrl     := 'http://' + DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE + 'AtualizarSistemasAgil.exe';
  ACBrDownload.DownloadNomeArq := UPGRADE_AGIL;
  ACBrDownload.DownloadDest    := '.\';

  DeleteFile('.\' + ACBrDownload.DownloadNomeArq);
  DeleteFile('.\' + ACBrDownload.DownloadNomeArq + '.part');

  ACBrDownload.StartDownload;
end;

procedure TFrmAutoUpgrade.btnVerificarUpgradeClick(Sender: TObject);
begin
  BaixarInfo;
  if gVersaoApp.VersionID >= ObterIdVersaoHTTP(ObterVersaoHTTP) then
  begin
    lblProgresso.Caption := 'Nenhuma versão nova disponível!';
    ShowInformation(Self.Caption, 'Nenhuma versão nova disponível!' + #13 + 'Você está com a versão mais atual do sistema.');
  end
  else
  if ShowConfirmation(Self.Caption, ObterMessageHTTP + #13#13 + 'Deseja atualizar agora o sistema?') then
    BaixarAtualizacao;

//  lblProgresso.Caption := 'Verificando atualização...';
//  AutoUpgraderPro.CheckUpdate;
end;

procedure TFrmAutoUpgrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  AutoUpgraderPro.AutoCheck := False;
  Action := caFree;
end;

procedure TFrmAutoUpgrade.FormCreate(Sender: TObject);
var
  sAppName : String;
const
//  URL_EXE = 'http://' + DOWNLOAD_URL_AGIL_SOFTWARES_UPGRADE + '%s.exe';
//  URL_INF = 'http://' + DOWNLOAD_URL_AGIL_SOFTWARES_UPGRADE + '%s_Upgrade.inf';
//  URL_EXE = 'http://' + DOWNLOAD_URL_HOME_AUTOMACAO_UPGRADE + '%s.exe';
//  URL_INF = 'http://' + DOWNLOAD_URL_HOME_AUTOMACAO_UPGRADE + '%s_Upgrade.inf';
  URL_EXE = 'http://' + DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE + '%s.exe';
  URL_INF = 'http://' + DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE + '%s_Upgrade.inf';
begin
  sAppName := gPersonalizaEmpresa.InternalName;

  lblURLApp.Caption  := Format(URL_EXE, [sAppName]);
  lblURLApp.Hint     := sAppName;
  lblURLInfo.Caption := Format(URL_INF, [sAppName]);
  aFileInfoVersion   := EmptyStr;

//  AutoUpgraderPro.InfoFileURL   := lblURLInfo.Caption;
//  AutoUpgraderPro.VersionNumber := GetFileVersion;
//  AutoUpgraderPro.VersionDate   := GetReleaseDate;

  ArquivosBaixados := TStringList.Create;
  ArquivosBaixados.Clear;
end;

procedure TFrmAutoUpgrade.FormShow(Sender: TObject);
begin
  LabelTransparente;
end;

procedure TFrmAutoUpgrade.LabelTransparente;
var
  I : Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if (Components[I] is TLabel) then
    begin
      TLabel(Components[I]).Transparent := False;
      TLabel(Components[I]).Transparent := True;
    end;
end;

procedure TFrmAutoUpgrade.lblURLAppClick(Sender: TObject);
begin
  BaixarInfo;
  BaixarArquivo(TLabel(Sender).Caption, TLabel(Sender).Hint);
end;

procedure TFrmAutoUpgrade.lblURLInfoClick(Sender: TObject);
begin
//  OpenURL(TLabel(Sender).Caption, True);
end;

function TFrmAutoUpgrade.ObterIdVersaoHTTP(const sVersao: String): Currency;
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

function TFrmAutoUpgrade.ObterMessageHTTP: String;
var
  aRetorno : String;
  aInfo : TStringList;
  I : Integer;
  aLer : Boolean;
begin
  aRetorno := EmptyStr;

  if FileExists(aFileInfoVersion) then
  begin
    aInfo := TStringList.Create;
    aLer  := False;
    try
      aInfo.LoadFromFile(aFileInfoVersion);
      for I := 0 to aInfo.Count - 1 do
      begin
        if not aLer then
          aLer := (Pos('#message=', aInfo.Strings[I]) > 0);

        if aLer then
        begin
          if (aRetorno = EmptyStr) then
            aRetorno := 'Versão ' + ObterVersaoHTTP + #13 + aInfo.Strings[I] + #13
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

function TFrmAutoUpgrade.ObterVersaoHTTP : String;
var
  aRetorno : String;
  aInfo : TStringList;
  I : Integer;
begin
  aRetorno := EmptyStr;

  if FileExists(aFileInfoVersion) then
  begin
    aInfo := TStringList.Create;
    try
      aInfo.LoadFromFile(aFileInfoVersion);
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

procedure TFrmAutoUpgrade.ACBrDownloadAfterDownload(Sender: TObject);
var
  aComando : String;
begin
  if (ACBrDownload.DownloadNomeArq = UPGRADE_AGIL) then
  begin
    aComando := ExtractFilePath(ParamStr(0)) + UPGRADE_AGIL;
    ShowInformation('Atualização Agil', 'Esta aplicação será fechada para que o processo de atualização seja iniciado.');
    Application.Terminate;

    ShellExecute(Handle, 'Open', PChar(aComando), PChar(gPersonalizaEmpresa.InternalName), '', SW_NORMAL);
  end;
end;

procedure TFrmAutoUpgrade.ACBrDownloadHookMonitor(Sender: TObject; const BytesToDownload,
  BytesDownloaded: Integer; const AverageSpeed: Double; const Hour, Min, Sec: Word);
var
  sConnectionInfo: string;
begin
  lblProgresso.Caption := ACBrDownload.DownloadNomeArq;
  prgBrAtualizacao.Position := BytesDownloaded;

  sConnectionInfo := sConnectionInfo + ' - Tempo Restante: ' +
                     Format('%.2d:%.2d:%.2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);

  sConnectionInfo := FormatFloat('0.00 KB/s'  , AverageSpeed) + sConnectionInfo;
  sConnectionInfo := FormatFloat('###,###,##0', BytesDownloaded / 1024) + ' / ' +
                     FormatFloat('###,###,##0', BytesToDownload / 1024) + ' KB - Velocidade: ' + sConnectionInfo;

  lblProgresso.Caption := sConnectionInfo;
end;

procedure TFrmAutoUpgrade.ACBrDownloadHookStatus(Sender: TObject; Reason: THookSocketReason;
  const BytesToDownload, BytesDownloaded: Integer);
begin
  case Reason of
    HR_Connect :
    begin
      prgBrAtualizacao.Position   := 0;
      btnVerificarUpgrade.Enabled := False;
      lblURLApp.Enabled := False;
    end;

   HR_ReadCount :
     begin
       prgBrAtualizacao.Max        := BytesToDownload;
       prgBrAtualizacao.Position   := BytesDownloaded;
     end;

   HR_SocketClose :
     begin
       case ACBrDownload.DownloadStatus of
         TDownloadStatus.stStop :
           begin
             prgBrAtualizacao.Position := 0;
             lblProgresso.Caption := 'Download Encerrado...';
           end;

         TDownloadStatus.stPause :
           lblProgresso.Caption := 'Download Pausado...';

         TDownloadStatus.stDownload :
           lblProgresso.Caption := 'Download Finalizado - Arquivo: ' + ACBrDownload.DownloadNomeArq;
       end;

       btnVerificarUpgrade.Enabled := True;
       lblURLApp.Enabled := True;
     end;
  end;
end;

initialization
  FormFunction.RegisterForm('FrmAutoUpgrade', TFrmAutoUpgrade);

end.
