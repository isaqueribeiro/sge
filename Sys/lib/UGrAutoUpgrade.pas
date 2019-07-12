unit UGrAutoUpgrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, auHTTP, auAutoUpgrader,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TfrmGeAutoUpgrade = class(TForm)
    Label1: TLabel;
    lblProgresso: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    lblURLApp: TLabel;
    lblURLInfo: TLabel;
    btnVerificarUpgrade: TButton;
    prgBrAtualizacao: TProgressBar;
    AutoUpgraderPro: TauAutoUpgrader;
    auHTTP: TauHTTP;
    imgUpgrade: TImage;
    procedure AbrirUrlClick(Sender: TObject);
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
  private
    { Private declarations }
    procedure LabelTransparente;
  public
    { Public declarations }
  end;

var
  frmGeAutoUpgrade : TfrmGeAutoUpgrade;

  procedure AtivarUpgradeAutomatico;

implementation

{$R *.dfm}

uses
  auUtils,
  UFuncoes,
  UConstantesDGE,
  UDMBusiness,
  uDMRecursos;

procedure AtivarUpgradeAutomatico;
begin
  if FormFunction.EstaAberto('frmGeAutoUpgrade') or Assigned(frmGeAutoUpgrade) then
    Exit;

  try
    frmGeAutoUpgrade := TfrmGeAutoUpgrade.Create(Application);
    frmGeAutoUpgrade.AutoUpgraderPro.AutoCheck := True;
  finally
  end;
end;

procedure TfrmGeAutoUpgrade.AbrirUrlClick(Sender: TObject);
begin
  OpenURL(TLabel(Sender).Caption, True);
end;

procedure TfrmGeAutoUpgrade.AutoUpgraderProAborted(Sender: TObject);
begin
  lblProgresso.Caption      := 'Atualização abortada!';
  prgBrAtualizacao.Position := 0;
end;

procedure TfrmGeAutoUpgrade.AutoUpgraderProFileDone(Sender: TObject;
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
  end;

  // Instalar fontes no Windows
  if ( Pos('.TTF.uTMP', FileName) > 0 ) then
    InstalarFonteWindows(SYS_BAUHS93, SYS_BAUHS93_DESCRIPTION);
end;

procedure TfrmGeAutoUpgrade.AutoUpgraderProNoUpdateAvailable(Sender: TObject);
begin
  lblProgresso.Caption := 'Sem atualização!';
end;

procedure TfrmGeAutoUpgrade.AutoUpgraderProProgress(Sender: TObject;
  const FileURL: string; FileSize, BytesRead, ElapsedTime,
  EstimatedTimeLeft: Integer; PercentsDone, TotalPercentsDone: Byte;
  TransferRate: Single);
begin
  lblProgresso.Caption      := 'Baixando de ' + QuotedStr(FileURL) + '...';
  prgBrAtualizacao.Position := PercentsDone;
end;

procedure TfrmGeAutoUpgrade.btnVerificarUpgradeClick(Sender: TObject);
begin
  lblProgresso.Caption := 'Verificando atualização...';
  AutoUpgraderPro.CheckUpdate;
end;

procedure TfrmGeAutoUpgrade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AutoUpgraderPro.AutoCheck := False;
  Action := caFree;
end;

procedure TfrmGeAutoUpgrade.FormCreate(Sender: TObject);
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
  sAppName := GetInternalName;

  lblURLApp.Caption  := Format(URL_EXE, [sAppName]);
  lblURLInfo.Caption := Format(URL_INF, [sAppName]);

  AutoUpgraderPro.InfoFileURL   := lblURLInfo.Caption;
  AutoUpgraderPro.VersionNumber := GetFileVersion;
  AutoUpgraderPro.VersionDate   := GetReleaseDate;
end;

procedure TfrmGeAutoUpgrade.FormShow(Sender: TObject);
begin
  LabelTransparente;
end;

procedure TfrmGeAutoUpgrade.LabelTransparente;
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

initialization
  FormFunction.RegisterForm('frmGeAutoUpgrade', TfrmGeAutoUpgrade);

end.
