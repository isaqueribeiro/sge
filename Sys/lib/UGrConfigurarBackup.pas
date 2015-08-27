unit UGrConfigurarBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadrao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinMcSkin, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxControls, dxBarBuiltInMenu, cxPC, IB_Services,
  cxContainer, cxEdit, cxTextEdit, cxMemo, Vcl.Mask, JvExMask, JvToolEdit,

  dxSkinscxPCPainter, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

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
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bkpBaseTextNotify(Sender: TObject; const Text: string);
    procedure btnSalvarClick(Sender: TObject);
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
  UDMBusiness, UConstantesDGE, UFuncoes;

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
  with FileINI do
    Result := ReadString('Conexao', 'Base', 'AGIL_COMERCIO.fdb');
end;

function TfrmGrConfigurarBackup.NomeServidor: String;
begin
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
