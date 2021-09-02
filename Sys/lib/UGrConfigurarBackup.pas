unit UGrConfigurarBackup;

interface

uses
  UGrPadrao,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxControls,
  cxPC, dxBarBuiltInMenu, cxContainer, cxEdit, cxTextEdit, cxMemo,
  Vcl.Mask, JvExMask, JvToolEdit, IB_Services,

  FireDAC.Stan.Def, FireDAC.VCLUI.Wait, FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinscxPCPainter;

type
  TfrmGrConfigurarBackup = class(TfrmGrPadrao)
    PnlBotoes: TPanel;
    Bevel3: TBevel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    PgcGuias: TcxPageControl;
    TbsConfigurar: TcxTabSheet;
    bkpBase: TpFIBBackupService;
    TbsVerbose: TcxTabSheet;
    mmVerbose: TcxMemo;
    lblServidorBase: TLabel;
    edServidorBase: TEdit;
    lblLocalBackup: TLabel;
    edLocalBackup: TJvDirectoryEdit;
    lblLocalZip7: TLabel;
    edLocalZip7: TJvDirectoryEdit;
    lblLocalNuvem: TLabel;
    edLocalNuvem: TJvDirectoryEdit;
    FDIBBackup: TFDIBBackup;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bkpBaseTextNotify(Sender: TObject; const Text: string);
    procedure btnSalvarClick(Sender: TObject);
    procedure FDIBBackupError(ASender, AInitiator: TObject; var AException: Exception);
    procedure FDIBBackupProgress(ASender: TFDPhysDriverService; const AMessage: string);
  private
    { Private declarations }
    procedure ExecutarBackup;
    procedure CompactarECopiar;

    function GetTime: String;
    function GetNomeBackup : String;

    function NomeServidor : String;
    function NomeBase : String;
    function PathBackup : String;
    function AppZip7 : String;
    function PathBackupNuvem : String;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGrConfigurarBackup: TfrmGrConfigurarBackup;

implementation

uses
  UDMBusiness, UDMRecursos, UConstantesDGE, UFuncoes;

{$R *.dfm}

function TfrmGrConfigurarBackup.AppZip7: String;
begin
  with FileINI do
    Result := StringReplace(
      ReadString('Backup', 'AppZip7', 'C:\Program Files\7-Zip') + '\7z.exe',
      '\\', '\', [rfReplaceAll]);
end;

procedure TfrmGrConfigurarBackup.bkpBaseTextNotify(Sender: TObject;
  const Text: string);
begin
  if Trim(Text) <> EmptyStr then
    mmVerbose.Lines.Add( GetTime + ' - ' + Trim(Text) );

  Application.ProcessMessages;
end;

procedure TfrmGrConfigurarBackup.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGrConfigurarBackup.btnSalvarClick(Sender: TObject);
var
  bSucesso : Boolean;
  sFileNameLOG : String;
begin
  if ShowConfirmation('Confirma a geranção do backup?') then
  begin
    FileINI.WriteString('Backup', 'PathBackup',      edLocalBackup.Text);
    FileINI.WriteString('Backup', 'AppZip7',         edLocalZip7.Text);
    FileINI.WriteString('Backup', 'PathBackupNuvem', edLocalNuvem.Text);
    FileINI.UpdateFile;

    TbsVerbose.TabVisible := True;
    PgcGuias.ActivePage   := TbsVerbose;
    mmVerbose.SetFocus;

    mmVerbose.Clear;
    mmVerbose.Lines.Add(GetTime + ' - Iniciando backup pela aplicação...');

    ExecutarBackup;

    bSucesso := (Pos('gbak:closing file, committing, and finishing', mmVerbose.Lines.Text) > 0);

    if bSucesso then
      mmVerbose.Lines.Add(GetTime + ' - Backup finalizado com sucesso.')
    else
      mmVerbose.Lines.Add(GetTime + ' - Erro(s) na execução do backup.');

    sFileNameLOG := ChangeFileExt(edLocalBackup.Hint, '.log');
    mmVerbose.Lines.SaveToFile(sFileNameLOG);

    if FileExists(AppZip7) then
      CompactarECopiar;

    if bSucesso then
    begin
      ShowInformation('Backup realizado com sucesso!');
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmGrConfigurarBackup.CompactarECopiar;
var
  sCmd : TStringList;
  sFileZip ,
  sFIleIn  ,
  sPathBkp : String;
begin
  sCmd := TStringList.Create;
  try
    sCmd.Clear;
    sCmd.BeginUpdate;

    sFileZip := ChangeFileExt(edLocalBackup.Hint, '.7zAgil');
    sFIleIn  := ChangeFileExt(edLocalBackup.Hint, '.*');
    sPathBkp := StringReplace(edLocalBackup.Text + '\_Bkp', '\\', '\', [rfReplaceAll]);

    ForceDirectories(sPathBkp);

    sCmd.Add('"' + AppZip7 + '" a -t7z -mx9 "' + sFileZip + '" "' + sFIleIn + '" -p' + SYS_SYSDBA_PWD);
    sCmd.Add('Copy "' + sFileZip + '" "' + sPathBkp + '"');

    if DirectoryExists(PathBackupNuvem) then
      sCmd.Add('Copy "' + sFileZip + '" "' + PathBackupNuvem + '"');

    sCmd.Add('Del "'  + edLocalBackup.Hint + '"');
    sCmd.Add('Del "'  + ChangeFileExt(edLocalBackup.Hint, '.log') + '"');
    sCmd.Add('Del "'  + sFileZip + '"');

    sCmd.EndUpdate;
    sCmd.SaveToFile('.\Finally.bat');
  finally
    sCmd.Free;
    WinExec('.\Finally.bat', SW_NORMAL);
  end;
end;

procedure TfrmGrConfigurarBackup.ExecutarBackup;
begin
  Self.Caption       := 'Execução de Backup.... AGUARDE O TÉRMINO!!!';
  edLocalBackup.Hint := GetNomeBackup;

  Application.ProcessMessages;
  Sleep(500);

  try

    // Backup com FIBPlus
    with bkpBase do
    begin
      Protocol        := TCP;
      ServerName      := NomeServidor;
      DatabaseName    := NomeBase;
      BackupFile.Text := edLocalBackup.Hint;

      Params.Clear;
      Params.Add('user_name=' + SYS_SYSDBA_LOGIN);
      Params.Add('password='  + SYS_SYSDBA_PWD);

      Attach;
      try
        ServiceStart;
      finally
        Detach;
        Self.Close;
      end;
    end;

  except

    // Backup com FireDAC
    with FDIBBackup, DMBusiness do
    begin
      DriverLink := fdFBDriverLink;
      Protocol   := TIBProtocol.ipTCPIP;
      Verbose    := True;

      Host     := NomeServidor;
      Database := NomeBase;
      UserName := SYS_SYSDBA_LOGIN;
      Password := SYS_SYSDBA_PWD;

      BackupFiles.Clear;
      BackupFiles.Add(edLocalBackup.Hint);

      try
        mmVerbose.Lines.Add(GetTime + ' - ' + Self.Caption);

        Backup;

        mmVerbose.Lines.Add(GetTime + ' - Backup realizado com conexão FireDAC');
      finally
        Self.Close;
      end;

    end;

  end;
end;

procedure TfrmGrConfigurarBackup.FDIBBackupError(ASender, AInitiator: TObject; var AException: Exception);
begin
  if Trim(AException.Message) <> EmptyStr then
    mmVerbose.Lines.Add( GetTime + ' - ' + Trim(AException.Message) );

  Application.ProcessMessages;
end;

procedure TfrmGrConfigurarBackup.FDIBBackupProgress(ASender: TFDPhysDriverService; const AMessage: string);
begin
  if Trim(AMessage) <> EmptyStr then
    mmVerbose.Lines.Add( GetTime + ' - ' + Trim(AMessage) );

  Application.ProcessMessages;
end;

procedure TfrmGrConfigurarBackup.FormCreate(Sender: TObject);
begin
  inherited;
  PgcGuias.ActivePage   := TbsConfigurar;
  TbsVerbose.TabVisible := False;

  edServidorBase.Text := NomeServidor + ':' + NomeBase;
  edLocalBackup.Text  := PathBackup;
  edLocalBackup.Hint  := GetNomeBackup;
  edLocalZip7.Text    := ExtractFilePath(AppZip7);
  edLocalNuvem.Text   := PathBackupNuvem;
end;

function TfrmGrConfigurarBackup.GetNomeBackup: String;
var
  sFile : String;
begin
  sFile  := PathBackup + '\' + NomeBase + '_' + StringReplace(FormatDateTime('yyyymmdd_hh:mm', Now) + '.fbk', ':', 'h', [rfReplaceAll]);
  Result := StringReplace(sFile, '\\', '\', [rfReplaceAll]);
end;

function TfrmGrConfigurarBackup.GetTime: String;
begin
  Result := FormatDateTime('hh:mm:ss', Now);
end;

function TfrmGrConfigurarBackup.NomeBase: String;
begin
  if (ParamCount >= 2) then
    Result := ParamStr(2) // Base
  else
    with FileINI do
      Result := ReadString('Conexao', 'Base', 'AGIL_COMERCIO.fdb');
end;

function TfrmGrConfigurarBackup.NomeServidor: String;
begin
  if (ParamCount >= 2) then
    Result := ParamStr(1) // Servidor
  else
    with FileINI do
      Result := ReadString('Conexao', 'Servidor', 'localhost');
end;

function TfrmGrConfigurarBackup.PathBackup: String;
var
  sPathBackup : String;
begin
  sPathBackup := ExtractFilePath(Application.ExeName) + '_bkp\';
  with FileINI do
    Result := ReadString('Backup', 'PathBackup', sPathBackup);
end;

function TfrmGrConfigurarBackup.PathBackupNuvem: String;
var
  sPathNuvem : String;
begin
  sPathNuvem := ExtractFilePath(Application.ExeName) + '_Nuvem\';
  with FileINI do
    Result := ReadString('Backup', 'PathBackupNuvem', sPathNuvem);
end;

procedure TfrmGrConfigurarBackup.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGrConfigurarBackup', TfrmGrConfigurarBackup);

end.
