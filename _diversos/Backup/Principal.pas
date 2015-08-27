unit Principal;

interface

uses
   DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ExtCtrls, ImgList,   IBServices, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdFTP, IdFTPList, StdCtrls, Buttons,ToolWin, XPMan,
   ZLib, jpeg, IniFiles, TabNotBk, DB, IBDatabase, IBCustomDataSet, StrUtils,
   Mask, DBCtrls, Menus, FMTBcd, SqlExpr, IdExplicitTLSClientServerBase,
   DBTables, ZipForge, cxGraphics, cxControls, cxLookAndFeels,
   cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
   dxSkinsDefaultPainters, cxProgressBar, dxtree;

type
   TfrmPrincipal = class(TForm)
      ibBackup: TIBBackupService;
      idFTP: TIdFTP;
      ibReparo: TIBRestoreService;
      iml16: TImageList;
      Panel1: TPanel;
      imgFTPBackup: TImage;
      Panel3: TPanel;
      ToolBar1: TToolBar;
      btnBackup: TToolButton;
    btnRestaura: TToolButton;
      ToolButton3: TToolButton;
      pnlLocal: TPanel;
      XPManifest1: TXPManifest;
      iml24: TImageList;
      iml24d: TImageList;
      btnConfiguracao: TToolButton;
      btnSobre: TToolButton;
      ToolButton4: TToolButton;
    nbkPrincipal: TNotebook;
    itrBackup: TIBTransaction;
    idbBackup: TIBDatabase;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    idsConfiguracao: TIBDataSet;
    idsBackup: TIBDataSet;
    idsConfiguracaoVERSAO: TDateField;
    idsConfiguracaoDIRSERVIDORLOCAL: TIBStringField;
    idsConfiguracaoDIRSERVIDORREMOTO: TIBStringField;
    idsConfiguracaoVERBOSEBACKUP: TIntegerField;
    idsConfiguracaoVERBOSEREPARO: TIntegerField;
    edPastaLocal: TDBEdit;
    edPastaRemoto: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnSalvar: TBitBtn;
    dtsBackup: TDataSource;
    dtsConfiguracao: TDataSource;
    idsConfiguracaoSENHA: TIBStringField;
    pmnLocal: TPopupMenu;
    Copiarpara1: TMenuItem;
    Colarde1: TMenuItem;
    Excluir1: TMenuItem;
    ckbFTP: TCheckBox;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    idsConfiguracaoSIGLA_ORGAO: TIBStringField;
    GroupBox1: TGroupBox;
    tvwLocal: TTreeView;
    btnUpload: TBitBtn;
    btnDownload: TBitBtn;
    btnCopiar: TBitBtn;
    btnColarDe: TBitBtn;
    GroupBox2: TGroupBox;
    tvwRemoto: TTreeView;
    Image1: TImage;
    btnAtualizar: TBitBtn;
    idsBackupCODIGO: TIBStringField;
    idsBackupPATHORIGEM: TIBStringField;
    idsBackupPATHDESTINO: TIBStringField;
    idsBackupCODOPERADOR: TIBStringField;
    idsBackupENVIADO: TIntegerField;
    idsBackupDATABACKUP: TDateTimeField;
    idsBackupDATARESTAURACAO: TDateTimeField;
    idsBackupNOME_OPERADOR: TIBStringField;
    mmoLog: TMemo;
    ToolButton1: TToolButton;
    lblParam: TLabel;
    Table1: TTable;
    zfBackup: TZipForge;
    pgbProgresso: TcxProgressBar;
    lblLog: TLabel;
    lblPercentagem: TLabel; //lê as variáveis globais de config.txt
      function    AtivaibBackup: Boolean;
      function    AtivaibReparo: Boolean;
      procedure   AtualizaLocal;
      procedure   AtualizaRemoto;
      function    ConectaidFTP: Boolean;
      procedure   Log(sTexto: String; bMostrar: Boolean = True);
      procedure   RealizaBackup;
      procedure   RealizaReparo;
      procedure   ckbFTP_Click(Sender: TObject);
      procedure   btnBackupClick(Sender: TObject);
      procedure   btnRestauraClick(Sender: TObject);
      procedure   FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure   idFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
      procedure   FormShow(Sender: TObject);
      procedure   idFTPConnected(Sender: TObject);
      procedure   idFTPDisconnected(Sender: TObject);

      function    LeIni(sSecao, sChave: string): string; //lê uma sequencia no registro do windows
      procedure   EscreveIni(sSecao, sChave, sValor: string);

      function    Se(bSentenca: Boolean; vVerdadeiro, vFalso: Variant): Variant;
      function    MensagemTraduzida(sMensagemOriginal: string): string;
    procedure btnSairClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
      function Autenticacao: boolean;
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pmnSqlPopup(Sender: TObject);
    procedure btnSobreClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Copiarpara1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure ckbFTPClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure OpenDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure idFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure idFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ZipForge1OverallProgress(Sender: TObject; Progress: Double;
      Operation: TZFProcessOperation; ProgressPhase: TZFProgressPhase;
      var Cancel: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure zfBackupFileProgress(Sender: TObject; FileName: string;
      Progress: Double; Operation: TZFProcessOperation;
      ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
    procedure btnColarDeClick(Sender: TObject);
   private
      procedure Desabilita;
      procedure Habilita;
      procedure ComprimeArquivos(sArquivosCompactar: TStrings; const sArquivoCompactado: String);
      procedure ProgressoCompressao(Sender: TObject);
      procedure ProgressoDescCompressao(Sender: TObject);
      procedure DescomprimeArquivos(FileName, Destination: String);
    procedure Mensagem(sTexto, sCaption: String; iFlags: Integer);
    function GetPathDataBase(sBanco: string): WideString;
    function GetNomeServidor: WideString;
    procedure ComprimeArquivos2(sArquivosCompactar: TStrings;
      const sArquivoCompactado: String);
    function Versao_Executavel(sArquivo: String): String;
    procedure DescomprimeArquivos2(const sArquivoCompactado: String);
    function Confirma(sTexto: String): Boolean;
    procedure HabilitaBotoes(lOpcao: Boolean);
    { Private declarations }
   public
    { Public declarations }
end;

var
   frmPrincipal: TfrmPrincipal;
///variáveis globais
   //
   g_sPrimeiraVez: string[1] = 'S';
   g_bParar: boolean = False;
   g_sAplicativoPrincipal: string = 'ACQUADUTUS';
   g_sNomePastaFTP: string = 'ACQUADUTUS';
   g_sNomeArqIni: string = 'ACQUADUTUS.INI';
   g_sUsuarioFB: string = 'GERASYS.TI';
   g_sSenhaFB: string = 'gsti2010';
   g_sCodOperador: string = 'XXXX';
   g_sNomeOperador: string = 'AAAAAAAAAAAAAAAAAAAA';
   g_sPemiteRest: string[1] = 'N';
   g_sBackupDireto: string[1] = 'N';
   g_sVersao: string[10];

   fArquivo, fArquivoDescompactado, fArquivoCompactado: TFileStream;

   nMax: Integer;
///
implementation

uses Autenticacao, Sobre, CopiarEColar;

{$R *.dfm}

var
   l_iFileSize: Integer = 0;
   l_tInicioTranferencia: TTime;

   l_bPodeFechar: boolean = True;

function TfrmPrincipal.AtivaibBackup: boolean;
Var
   sBaseDados: string;
begin
   //ibBackup.ServerName := LeIni('Conexão', 'Host');
   //ibBackup.DatabaseName := LeIni('Conexão', 'Path');

   sBaseDados := GetPathDataBase('1');

   ibBackup.ServerName := GetNomeServidor;
   ibBackup.DatabaseName := sBaseDados;

   ibBackup.Params.Clear;
   ibBackup.Params.Add('user_name='+g_sUsuarioFB);
   ibBackup.Params.Add('password='+g_sSenhaFB);

   try
      ibBackup.Active := True;
      Result := True;
   except
      on E: Exception do
      begin
         Log('Erro >>'+#13+E.Message+'<<', False);
         Log('Operação cancelada.', False);
         Result := False;
      end;
   end;
end;

function TfrmPrincipal.AtivaibReparo: boolean;
Var
   sBaseDados,
   sNomeServidor: string;
begin
   sNomeServidor := GetNomeServidor;
   sBaseDados := GetPathDataBase('1');
   if Trim(sNomeServidor) <> '' then
      ibReparo.ServerName := sNomeServidor
   else
      ibReparo.ServerName := '';

   ibReparo.DatabaseName.Clear; //
   ibReparo.DatabaseName.Add(sBaseDados);

   ibReparo.Params.Clear;
   ibReparo.Params.Add('user_name='+g_sUsuarioFB);
   ibReparo.Params.Add('password='+g_sSenhaFB);
   try
      ibReparo.Active := True;
      Result := True;
   except
      on E: Exception do
      begin
         Log('Erro >>'+#13+E.Message+'<<', False);
         Log('Operação cancelada.', False);
         Result := False;
      end;
   end;
end;

function TfrmPrincipal.ConectaidFTP: Boolean;
begin
   try
      IdFTP.Connect;
      idFTP.ChangeDir('CLIENTES');
      idFTP.ChangeDir(g_sNomePastaFTP);
      idFTP.ChangeDir(idsConfiguracaoDIRSERVIDORREMOTO.AsString);
      idFTP.ChangeDir('BACKUP');
      AtualizaRemoto;
      Result := True;
   except
      on E: Exception do
      begin
         Log('Erro >>'+#13+E.Message+'<<');
         Log('Operação cancelada.');
         Result := False;
      end;
   end;
end;

procedure TfrmPrincipal.Log(sTexto: String; bMostrar: Boolean = True);
begin
   mmoLog.Lines.Add(sTexto);
   if bMostrar then
      lblLog.Caption := sTexto;
   Application.ProcessMessages;
end;

procedure TfrmPrincipal.RealizaBackup;
label
   lFim;
var
   SearchRec: TSearchRec;

   sNomeGBK, sNomeZLB: String;
   sHora,
   sHora2: String;
   bErro: Boolean;

   sArqCompactar: TStrings;
   sPastaBackup,
   sNomeArqBackup: WideString;
begin

   if g_sBackupDireto <> 'S' then
      if Application.MessageBox('DESEJA REALMENTE INICIAR O BACKUP ?',
         'Confirma', MB_ICONQUESTION+MB_YESNO) = IDNO then
      begin
         Exit;
      end; //

   mmoLog.Lines.Clear;

   Desabilita;
   //pnlStatus.Show;

   // sPastaBackup:= ExtractFilePath(Application.ExeName)+'Backup';
   // If Not DirectoryExists(sPastaBackup) Then
   //   CreateDir(sPastaBackup);
   // sNomeArqBkp := sPastaBackup+'\'+DefineNomeArqBackup;

   sHora := FormatDateTime('dd.mm.yyyy_hh.mm.ss', Now);
   sHora2 := Copy(sHora,7,4)+'_'+Copy(sHora,4,2)+'_'+LeftStr(sHora,2)+'_'+
      RightStr(sHora,8);

   sNomeGBK := idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+
      Trim(idsConfiguracaoDIRSERVIDORREMOTO.AsString)+'_'+sHora2+'.GBK';
   sNomeZLB := ChangeFileExt(sNomeGBK,'.ZIP');

   Log('Ativando o serviço de backup...', False);
   if (not AtivaibBackup) then
   begin
      Log('Erro ao ativar o serviço de backup.', False);
      Log('Operação cancelada.', False);
      goto lFim;
   end;

//->backup com gbak

   bErro := False;

   Log('Inciando o serviço de backup...', False);
   try
      ibBackup.BackupFile.Clear;
      ibBackup.BackupFile.Add(sNomeGBK);

      ibBackup.ServiceStart;
   except
      bErro := True;
   end;

   if (bErro) then
   begin
      ShowMessage('Erro ao iniciar o serviço de backup.');
      Log('Operação cancelada.', False);

      goto lFim;
   end;

   l_bPodeFechar := False;

   Log('Realizando o backup...');

   pgbProgresso.Position := 0;
   pgbProgresso.Properties.Max := idsConfiguracaoVERBOSEBACKUP.AsInteger;

   ibBackup.Tag := 0; //
   while not ibBackup.Eof do
   begin
      ibBackup.Tag := ibBackup.Tag + 1; //total de linhas retornado pelo gbak, mostrado quando CTRL+ALT+B
      pgbProgresso.Position := ibBackup.Tag;
      lblPercentagem.Caption := FormatFloat('#0',
        (pgbProgresso.Position/pgbProgresso.Properties.Max)*100)+' %';
      Application.ProcessMessages;

      try
         ibBackup.GetNextLine;
      except
      on E:Exception do
      begin
         ShowMessage(E.Message);
         bErro := True;
         Break;
      end;
      end;
   end;

   if (bErro) then
   begin
      ShowMessage('Erro ao realizar o backup.');
      Log('Operação cancelada.', False);

      goto lFim;
   end;

//<-

   Log('Compactando o backup...');
   pgbProgresso.Position := 0;
   pgbProgresso.Properties.Max := 0;
   lblPercentagem.Caption := '0%';
   Application.ProcessMessages;

/////////////////////////////////////////////////////////////////////////////////
   // Aqui faz a lista dos arquivos que serão compactados
   sArqCompactar := TStringList.Create;
   sArqCompactar.Clear;
   sArqCompactar.Add(sNomeGBK); // o Arquivo GBK

   // Aqui compacta o GBK
   ComprimeArquivos2(sArqCompactar,sNomeZLB);
/////////////////////////////////////////////////////////////////////////////////

   ibBackup.Active := False;

   idsConfiguracao.Edit;
   idsConfiguracaoVERBOSEBACKUP.AsInteger := ibBackup.Tag;
   idsConfiguracao.Post;
   itrBackup.CommitRetaining;

   idsBackup.Insert;
   idsBackupCODIGO.AsString := sHora;
   idsBackupPATHORIGEM.AsString := ibBackup.DatabaseName;
   idsBackupPATHDESTINO.AsString := ibBackup.BackupFile[0];
   idsBackupCODOPERADOR.AsString := g_sCodOperador;
   idsBackupNOME_OPERADOR.AsString := g_sNomeOperador;
   idsBackupENVIADO.AsInteger := 2; //não
   idsBackupDATABACKUP.AsDateTime := Now;
//   idsBackupDATARESTAURACAO.AsDateTime :=
   idsBackup.Post;
   itrBackup.CommitRetaining;

   idsBackup.Refresh;
//
//<-
   if FileExists(sNomeGBK) then
      DeleteFile(sNomeGBK); //deleta backup

   Log('Operação realizada com sucesso.', False);
   Log('');

   AtualizaLocal;

   Log('Concluído.');
   pgbProgresso.Position := 0;

   lFim:;
   l_bPodeFechar := True;

   //pnlStatus.Hide;
   mmoLog.SetFocus;

end;

procedure TfrmPrincipal.RealizaReparo;
label lFim;
var
   SearchRec: TSearchRec;

   sNomeGBK, sNomeZLB: String;

   bErro: Boolean;
   sDescrErro: string;
begin
   if tvwLocal.SelectionCount = 0 then
   begin
      ShowMessage('Selecione um arquivo.');
      Exit;
   end;

   if Application.MessageBox('A restauração recriará o banco de dados.'+#13+
                             'As alterações após a data do backup serão perdidas.'+#13+
                             'Iniciar a "RESTAURAÇÃO" ?',
                             'Confirma', MB_ICONQUESTION+MB_YESNO) = IDNO then
      Exit;

   Desabilita;

   // O Zlb a descompactar é o q estiver selecionado em: Pasta no Servidor
   sNomeZLB := idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+tvwLocal.Selected.Text;

   // O arquivo GBK é o mesmo nome do arquivo arquivo compatado, só q com a extenção GBK
   // ele precisa ser identificado para fazer a restauração para FDB
   sNomeGBK := ChangeFileExt(sNomeZLB, '.GBK') ;

   Log('Descompactando o backup...');

////////////////////////////////////////////////////////////////////////////////

   try
      DescomprimeArquivos2(sNomeZLB);
      Log('Arquivo de Backup Descompactado ...');
   except
      Log('Erro ao descompactar Arquivo de Backup ...');
   end;

{
   ZZip.Create(nil);
   ZZip.ProgressBar := pgbProgresso;
   ZZip.DecompressFile := sNomeZLB;
   ZZip.DecompressDirFiles := idsConfiguracaoDIRSERVIDORLOCAL.AsString+'BACKUP\';

   ZZip.Decompress;
}
////////////////////////////////////////////////////////////////////////////////

   {
   Log('');
   Log('Copiando os rtms...', False);

   // Aqui copia os rtms para a pasta Relatórios
   if FindFirst(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+'*.rtm', faArchive, SearchRec) = 0 then
   begin
      repeat
         CopyFile(PChar(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'BACKUP\'+SearchRec.Name),
                        PChar(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'RELATORIOS\'+SearchRec.Name), True);
         DeleteFile(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'BACKUP\'+SearchRec.Name);
      until
         FindNext(SearchRec) <> 0;
   end;
   }

   Log('Ativando o serviço de restauração...', False);

   // Aqui restaura de GBK para FDB
   if (not AtivaibReparo) then
   begin
      Log('Erro ao ativar o serviço de restauração.', False);
      Log('Operação cancelada.', False);
      goto lFim;
   end;

//->Retauração do GBK
//
   bErro := False;

   Log('Inciando o serviço de reparo...', False);
   try
      ibReparo.BackupFile.Clear;
      ibReparo.BackupFile.Add(sNomeGBK);
      ibReparo.ServiceStart;
   except
      bErro := True;
   end;

   if bErro then
   begin
      Log('Erro ao iniciar o serviço de reparo.', False);
      Log('Operação cancelada.', False);

      goto lFim;
   end;

   l_bPodeFechar := False;

   Log('Realizando a restauração...');
   pgbProgresso.Position := 0;
   pgbProgresso.Properties.Max := idsConfiguracaoVERBOSEREPARO.AsInteger;

   ibReparo.Tag := 0; //
   while not ibReparo.Eof do
   begin
      ibReparo.Tag := ibReparo.Tag + 1; //total de linhas retornado pelo gbak, mostrado quando CTRL+ALT+R
      pgbProgresso.Position := ibReparo.Tag;
      lblPercentagem.Caption := FormatFloat('#0',
         (pgbProgresso.Position/pgbProgresso.Properties.Max)*100)+' %';
      Application.ProcessMessages;

      try
         ibReparo.GetNextLine;
      except
         on E: Exception do
         begin
            sDescrErro := 'Erro desconhecido ...';
            if Pos('(database might be in use)',E.Message) > 0 then
               sDescrErro := 'É necessário que o Banco não esteja sendo usado no momento ...';
            Mensagem('Não foi possível Restaurar o Banco de Dados ...'+#13+
                     '('+E.Message+')'+#13+
                     sDescrErro,'E R R O !!!',MB_OK+MB_ICONERROR);
            bErro := True;
            Break;
         end;
      end;
   end;

   if bErro then
   begin
      Log('Erro ao realizar a restauração.', False);
      Log('Operação cancelada.', False);

      goto lFim;
   end;

   ibReparo.Active := False;

   idsConfiguracao.Edit;
   idsConfiguracaoVERBOSEREPARO.AsInteger := ibReparo.Tag;
   idsConfiguracao.Post;
   itrBackup.CommitRetaining;

   idsBackup.Close;
   idsBackup.SelectSQL.Clear;
   idsBackup.SelectSQL.Add('select * from BACKUP where CODIGO='''+tvwLocal.Selected.Text+'''');
   idsBackup.Open;

   if not idsBackup.IsEmpty then
   begin
      idsBackup.Edit;
      idsBackupDATARESTAURACAO.AsDateTime := Now;
      idsBackup.Post;
      itrBackup.CommitRetaining;
   end;

   idsBackup.Close;
   idsBackup.SelectSQL.Clear;
   idsBackup.SelectSQL.Add('select * from BACKUP where CODIGO=''''');
   idsBackup.Open;
//
//<-

   if FileExists(sNomeGBK) then
      DeleteFile(sNomeGBK); //deleta backup

   Log('Operação realizada com sucesso.', False);
   Log('');

   AtualizaLocal;

   Log('Concluído.');
   pgbProgresso.Position := 0;
   Application.ProcessMessages;

   lFim:;
   l_bPodeFechar := True;

end;

procedure TfrmPrincipal.idFTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
   nVelocidade: Double;
begin
   if (idFTP.Tag = 1)or(idFTP.Tag = 2) then
   begin
      pgbProgresso.Position := AWorkCount;

      nVelocidade := (AWorkCount/1024)/SecondSpan(Time, l_tInicioTranferencia);

      lblPercentagem.Caption := FormatFloat('#,##0.00', nVelocidade)+' KB/S ';
      lblLog.Caption := FormatFloat('#,##0.00', AWorkCount/1024)+' KB de '+
         FormatFloat('#,##0.00', l_iFileSize/1024)+' KB';
      Application.ProcessMessages;
   end;

   if g_bParar then
   begin
      idFTP.Abort;

      try // embora abort já desconecta, é necessário chamar Disconnect para ocorrer o OnDisconnected
         idFTP.Disconnect;
      except
         //
      end;
   end;
end;

procedure TfrmPrincipal.idFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
   //pnlStatus.Visible := True;

   l_bPodeFechar := False;

   Desabilita;

   //AWorCountMax não é confiável, por isso o uso de iFileSize, capturado antes de Put e Get
   if (idFTP.Tag = 1)or(idFTP.Tag = 2) then
   begin
      l_tInicioTranferencia := Time-0.00001; //0.00001 = 1 segundo //evita divisão por 0

      pgbProgresso.Position := 0;
      pgbProgresso.Properties.Max := l_iFileSize;

      lblLog.Caption := FormatFloat('#,##0.00', 0)+' KB/ '+FormatFloat('#,##0.00', l_iFileSize/1024)+
         ' KB (0 KB/S)';
   end;


end;

procedure TfrmPrincipal.ckbFTP_Click(Sender: TObject);
begin
   if ckbFTP.Checked then
   begin
      Log('Abrindo conexão com servido ftp...', False);
      if (not ConectaidFTP) then
      begin
         ckbFTP.Checked := False;
         Abort;
      end;
      Log('Conectado.', False);
   end
   else
   begin
      if idFTP.Connected then
      begin
         Log('Fechando conexão com servidor ftp...', False);
         idFTP.Disconnect;
         Log('Desconectado.', False);
      end;
   end;
end;

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin

   HabilitaBotoes(False);
   RealizaBackup;
   HabilitaBotoes(True);
   tvwLocal.SetFocus;

end;

procedure TfrmPrincipal.btnRestauraClick(Sender: TObject);
begin
   if Autenticacao then
   begin
      HabilitaBotoes(False);
      RealizaReparo;
      HabilitaBotoes(True);
   end;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_F5) then
   begin
      AtualizaLocal;
      if idFTP.Connected then
         AtualizaRemoto;
   end
   else
   if (Shift = [ssCtrl, ssAlt])and(Key=Ord('B')) then
   begin
      if ibBackup.Tag <> 0 then
         ShowMessage('No último backup "gbak" retornou: '+IntToStr(ibBackup.Tag)+' linha(s).');
   end
   else
   if (Shift = [ssCtrl, ssAlt])and(Key=Ord('R')) then
   begin
      if ibReparo.Tag <> 0 then
         ShowMessage('No último reparo "gbak" retornou: '+IntToStr(ibReparo.Tag)+' linha(s).');
   end;
end;

procedure TfrmPrincipal.AtualizaLocal;
var
   SearchRec: TSearchRec;
begin

   tvwLocal.Items.Clear;

   //if not btnAtualizar.Enabled then
   //begin
      if FindFirst(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+'*.ZIP', faArchive, SearchRec) = 0 then
      begin
         repeat
            if (SearchRec.Name<>'.')and(SearchRec.Name<>'..') then
            begin
               tvwLocal.Items.Add(nil, SearchRec.Name);
               tvwLocal.Items[tvwLocal.Items.Count - 1].ImageIndex := 0;
               tvwLocal.Items[tvwLocal.Items.Count - 1].SelectedIndex := 0;
            end;
         until
            FindNext(SearchRec) <> 0;
      end;
{

   end else
   if not btnPastaRelatorio.Enabled then
   begin
      if FindFirst(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'RELATORIOS\'+'*.RTM', faArchive, SearchRec) = 0 then
      begin
         repeat
            if (SearchRec.Name<>'.')and(SearchRec.Name<>'..') then
            begin
               tvwLocal.Items.Add(nil, SearchRec.Name);

               tvwLocal.Items[tvwLocal.Items.Count - 1].ImageIndex := 0;
               tvwLocal.Items[tvwLocal.Items.Count - 1].SelectedIndex := 0;
            end;
         until
            FindNext(SearchRec) <> 0;
      end;
   end;
}
end;

procedure TfrmPrincipal.AtualizaRemoto;
var
 iContador: Integer;
 sListResult: TStrings;
begin
   sListResult := TStringList.Create;

   tvwRemoto.Items.Clear;

   idFTP.List(sListResult,'', False);

   if sListResult.Count <> 0 then
   begin
      for iContador := 0 to sListResult.Count-1 do
      begin
         if (sListResult[iContador]<>'.')and(sListResult[iContador]<>'..') then
         begin
            tvwRemoto.Items.Add(nil, sListResult[iContador]);

            tvwRemoto.Items[tvwRemoto.Items.Count - 1].ImageIndex := 0;
            tvwRemoto.Items[tvwRemoto.Items.Count - 1].SelectedIndex := 0;
         end;
      end;
   end;

   sListResult.Free;

end;

procedure TfrmPrincipal.idFTPWorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin

   //pnlStatus.Visible := False;

   l_bPodeFechar := True;

   lblLog.Caption := '';
   lblPercentagem.Caption := '';
   pgbProgresso.Position:= 0;

   idFTP.Tag := 0;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
Var
   iTemp: integer;
   sParam: string;
   sNomeServidor,
   sPathdB: string;

begin
   if ParamStr(1) <> '' then
   begin
      sParam := Copy(ParamStr(1),2,60);
      //-1%GERASYS.TI%S%S%ACQUADUTUS.INI%ACQUADUTUS%ACQUADUTUS
      iTemp  := Pos('%',sParam);
      g_sCodOperador := Trim(Copy(sParam,1,iTemp-1));

      sParam := Copy(sParam,iTemp+1,60);
      iTemp  := Pos('%',sParam);
      g_sNomeOperador := Trim(Copy(sParam,1,iTemp-1));

      sParam := Copy(sParam,iTemp+1,60);
      iTemp  := Pos('%',sParam);
      g_sPemiteRest := Trim(Copy(sParam,1,iTemp-1));

      sParam := Copy(sParam,iTemp+1,60);
      iTemp  := Pos('%',sParam);
      g_sBackupDireto := Trim(Copy(sParam,1,iTemp-1));

      sParam := Copy(sParam,iTemp+1,60);
      iTemp  := Pos('%',sParam);
      g_sNomeArqIni := Trim(Copy(sParam,1,iTemp-1));

      sParam := Copy(sParam,iTemp+1,60);
      iTemp  := Pos('%',sParam);
      g_sNomePastaFTP := Trim(Copy(sParam,1,iTemp-1));

      sParam := Copy(sParam,iTemp+1,60);
      iTemp  := Pos('%',sParam);
      g_sAplicativoPrincipal := sParam;

   end;

   Caption := g_sAplicativoPrincipal+' - MÓDULO P/ BACKUP E/OU RESTAURAÇÃO '+
   'DO BANCO DE DADOS - [VER. '+g_sVersao+']';

   {
   mmoLog.Lines.add(g_sCodOperador);
   mmoLog.Lines.add(g_sNomeOperador);
   mmoLog.Lines.add(g_sPemiteRest);
   mmoLog.Lines.add(g_sBackupDireto);
   mmoLog.Lines.add(g_sNomeArqIni);
   mmoLog.Lines.add(g_sNomePastaFTP);
   mmoLog.Lines.add(g_sAplicativoPrincipal);
   }

   nbkPrincipal.PageIndex := 0;
   btnRestaura.Enabled := (g_sPemiteRest = 'S');
   btnConfiguracao.Enabled:= btnRestaura.Enabled;

   lblParam.Caption := ' '+g_sCodOperador+'%'+g_sNomeOperador+'%'+g_sPemiteRest+
      '%'+g_sBackupDireto;
   {
   idbBackup.DatabaseName :=  LeIni('Conexão', 'Host')+':'+
       ExtractFileDir(LeIni('Conexão', 'Path'))+'\BACKUP'+
       ExtractFileExt(LeIni('Conexão', 'Path'));
   }
   idbBackup.Connected := False;
   //idbBackup.Connected := True;


   sNomeServidor := GetNomeServidor;
   sPathdB := GetPathDataBase('2');

   if Trim(sNomeServidor) = '' then
      idbBackup.DatabaseName := sPathdB
   else
      idbBackup.DatabaseName := sNomeServidor+':'+sPathdB;

   try
      idbBackup.Open;
      itrBackup.StartTransaction;
      idsBackup.Open;
      idsConfiguracao.Open;
   except
      on E:Exception do
      begin
         ShowMessage(E.Message);
         Self.Close;
      end;
   end;

   AtualizaLocal;

   //pnlStatus.Hide;
   lblLog.Caption := '';
   lblPercentagem .Caption := '';

end;

procedure TfrmPrincipal.idFTPConnected(Sender: TObject);
begin
   tvwRemoto.Items.Clear;

   tvwRemoto.Enabled := True;

   btnConfiguracao.Enabled := False;
   //btnAtualizar.Enabled := True;
   //btnUpload.Enabled := True;
   //btnDownload.Enabled := True;
end;

procedure TfrmPrincipal.idFTPDisconnected(Sender: TObject);
begin
   tvwRemoto.Items.Clear;

   tvwRemoto.Enabled := False;

   btnConfiguracao.Enabled := True;
   //btnAtualizar.Enabled := False;
   // btnUpload.Enabled := False;
   //btnDownload.Enabled := False;
end;

procedure TfrmPrincipal.EscreveIni(sSecao, sChave, sValor: string);
var
   oArquivo: TIniFile;
begin
   oArquivo := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+g_sNomeArqIni);
   oArquivo.WriteString(sSecao, sChave, sValor);
   oArquivo.Free;
end;

function TfrmPrincipal.LeIni(sSecao, sChave: string): string;
var
   oArquivo: TIniFile;
begin
   oArquivo := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+g_sNomeArqIni);
   Result := oArquivo.ReadString(sSecao, sChave, '');
   oArquivo.Free;
end;

function TfrmPrincipal.Se(bSentenca: Boolean; vVerdadeiro,
  vFalso: Variant): Variant;
begin
   if bSentenca then
      Result := vVerdadeiro
   else
      Result := vFalso;
end;


procedure TfrmPrincipal.ZipForge1OverallProgress(Sender: TObject;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
Var
   crTemp: Currency;
begin
   if ProgressPhase = ppStart then
   begin
      pgbProgresso.Position := 0;
      pgbProgresso.Properties.Max := 100;
      lblPercentagem.Caption := '0 %';
   end;
   crTemp := (pgbProgresso.Position/pgbProgresso.Properties.Max)*100;
   pgbProgresso.Position := Round(Progress);
   lblPercentagem.Caption := FormatFloat('#0',crTemp)+' %';
   Cancel := False;
   Application.ProcessMessages;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmPrincipal.btnAtualizarClick(Sender: TObject);
var
   oArquivo: TextFile;
   sVersao: string;
begin

   if not l_bPodeFechar then Exit;

   //btnPastaBackup.Enabled := not btnPastaBackup.Enabled;
   //btnPastaRelatorio.Enabled := not btnPastaRelatorio.Enabled;

   AtualizaLocal;

   if idFTP.Connected then
   begin
      AtualizaRemoto;
      btnUpload.Enabled := True;
      btnDownload.Enabled := True;
      ckbFTP.Enabled := True;
   end;

{
      //donwload da informação da versão
      try
         Log('Verificando versão...');

         idFTP.ChangeDir('../'); //retorna a raiz
         idFTP.ChangeDir('ATUALIZACAO/');

         l_iFileSize := idFTP.Size('versao.txt');

         idFTP.Tag := 2;
         IdFTP.Get('versao.txt', idsConfiguracaoDIRSERVIDORLOCAL.AsString+
            'ATUALIZACAO\versao.txt', True, False);

         Log('Concluído.');
      except
      on E: Exception do
      begin
         Log('');
         Log('Erro >>'+#13+MensagemTraduzida(E.Message)+'<<', False);

         ShowMessage(MensagemTraduzida(E.Message));

         Exit;
      end;
      end;

      //leitura da informação da versão
      AssignFile(oArquivo, idsConfiguracaoDIRSERVIDORLOCAL.AsString+
         'ATUALIZACAO\versao.txt');
      Reset(oArquivo);
      Readln(oArquivo, sVersao);
      CloseFile(oArquivo);
      try
         DeleteFile(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'ATUALIZACAO\versao.txt');
      except
         //nada mesmo
      end;

      //comparação da informação da versão
      //apenas para o mero aviso:
      //"Versão destualizada" ou "Versão atualizada"
      if Application.MessageBox(PChar(IfThen((StrToDate(sVersao) >
         DateOf(idsConfiguracaoVERSAO.AsDateTime)),
         'Versão desatualizada, baixar agora?', 'Versão atualizada, '+
         'baixar mesmo assim?')), 'Confirma', MB_ICONQUESTION+MB_YESNO)=ID_YES then
      begin
         //donwload da versão
         try
            Log('Baixando...');

            l_iFileSize := idFTP.Size('CAM.ZLB'); //tamanho do arquivo usado pelo componente idFTP

            idFTP.Tag := 2; //2 ativa o controle no progressbar (ver onWork de idFTP)
            IdFTP.Get('CAM.ZLB', idsConfiguracaoDIRSERVIDORLOCAL.AsString+'ATUALIZACAO\CAM.ZLB', True, False);
         except
         on E: Exception do
         begin
            Log('');
            Log('Erro >>'+#13+MensagemTraduzida(E.Message)+'<<', False);

            Exit;
         end;
         end;

         //registro da atualização
         idsConfiguracao.Edit;
         idsConfiguracaoVERSAO.AsDateTime := StrToDate(sVersao);
         idsConfiguracao.Post;
         itrBackup.CommitRetaining;

         Log('Concluído.');
      end;
}

end;

function TfrmPrincipal.Autenticacao: boolean;
begin
   Application.CreateForm(TfrmAutenticacao, frmAutenticacao);
   frmAutenticacao.ShowModal;
   Result := frmAutenticacao.Tag=1;
   frmAutenticacao.Free;
end;

procedure TfrmPrincipal.btnColarDeClick(Sender: TObject);
Var
  sOrigem,
  sDestino: string;
  lOk: Boolean;
  iTemp: integer;
  sCharTemp: string[1];
begin

   if not OpenDialog1.Execute then exit;

   if not FileExists(OpenDialog1.FileName) then
   begin
      Mensagem('Nome de Arquivo inválido ...',
         'Aviso !!!',MB_OK+MB_ICONERROR);
      exit;
   end;

   sOrigem := OpenDialog1.FileName;
   iTemp := Length(sOrigem);
   while True do
   begin
      sCharTemp := Copy(sOrigem,iTemp,1);
      if sCharTemp = '\' then
      begin
         sDestino := Copy(sOrigem,iTemp+1,255);
         break;
      end;
      Dec(iTemp);
   end;

   sDestino := edPastaLocal.Text+'\'+sDestino;

   {
   Mensagem('orígem: '+sOrigem+#13+
            'destino: '+sDestino,
            'Detalhe',MB_OK+MB_ICONINFORMATION);
   }

   if FileExists(sDestino) then
      if not Confirma('Já Existe este Arquivo na Pasta de Destino.'+#13+
         'Deseja substituí-lo ?') then exit;

   screen.Cursor := crHourGlass;
   lOk := CopyFile(PChar(sOrigem), PChar(sDestino), False);
   screen.Cursor := crDefault;

   if lOk then
   begin
      AtualizaLocal;
      Mensagem('Arquivo copiado com sucesso ...',
         'Parabéns !!!',MB_OK+MB_ICONEXCLAMATION);
   end else
      Mensagem('Erro ao copiar de '+sOrigem+' para '+sDestino,
         'Aviso !!!',MB_OK+MB_ICONERROR);

end;

procedure TfrmPrincipal.btnConfiguracaoClick(Sender: TObject);
begin
   if Autenticacao then
   begin
      HabilitaBotoes(False);
      nbkPrincipal.ActivePage := 'Configuração';
      idsConfiguracao.Edit;
      edPastaLocal.SetFocus;
   end;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
   nbkPrincipal.ActivePage := 'Início';

   idsConfiguracao.Post;
   itrBackup.CommitRetaining;

   AtualizaLocal;

   if ckbFTP.Checked then
      AtualizaRemoto;

   HabilitaBotoes(True);

end;

procedure TfrmPrincipal.pmnSqlPopup(Sender: TObject);
begin
   if not ckbFTP.Checked then
   begin
      Abort;
   end;
end;

procedure TfrmPrincipal.btnSobreClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSobre, frmSobre);
   frmSobre.ShowModal;
   frmSobre.Free;
end;

procedure TfrmPrincipal.btnTesteClick(Sender: TObject);
var
   bErro: Byte;
begin

{ Original
 with zfBackup do
    begin
        FileName := 'C:\TesteZipForge\teste2.zip';

        // Create a new archive file
        OpenArchive(fmCreate);

        // Set path to folder with some text files to BaseDir
        BaseDir := 'C:\REMUN_ENVIA';

        // Add all files and directories from 'C:\SOURCE_FOLDER' to the archive
        AddFiles('*.*');

        // Set path to destination folder
        BaseDir := 'C:\TesteZipForge\Descompacta';

        // Extract all files and directories from the archive to 'C:\DESTINATION_FOLDER'
        ExtractFiles('*.*');

        // Close the archive
        CloseArchive;
    end;
    ShowMessage('All files were added and extracted successfully.');
 end;
}

   pgbProgresso.Position := 0;
   Application.ProcessMessages;
   Log('Iniciado O Teste de Compactação ...',False);

   bErro := 0;
   with zfBackup do
   begin
      FileName := 'C:\TesteZipForge\TESTE2.ZIP';
      OpenArchive(fmCreate);
        BaseDir := 'C:\REMUN_ENVIA';
      try
         try
            AddFiles('*.*');
            Log('O Teste de Compactação foi bem sucedido ...',False);
         except
            on E: Exception do
            begin
               Log('Não foi possível criar o Arquivo compactado ...'+#13+
                '('+E.Message+')');
               bErro := 1;
            end;
         end;
      finally
         CloseArchive;
      end;

      Log('Fim do Teste de Compactação ...',False);
      Log(' ',False);
      Log('Iniciado o Teste de Descompactação ...',False);
      pgbProgresso.Position := 0;
      Application.ProcessMessages;

      if bErro = 0 then
      begin
         FileName := 'C:\TesteZipForge\TESTE2.ZIP';
         OpenArchive(fmOpenRead);
         BaseDir := 'C:\TesteZipForge\Descompacta';
         try
            try
               ExtractFiles('*.*');
               Log('O Teste de Descompactação foi bem sucedido ...',False);
            except
               on E: Exception do
               begin
                  Log('Não foi possível Descompactar o Arquivo ...'+#13+
                   '('+E.Message+')');
                  bErro := 1;
               end;
            end;
         finally
            CloseArchive;
         end;
      end;
   end;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose :=  l_bPodeFechar;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  g_sVersao    := Versao_Executavel(Application.ExeName);
end;

procedure TfrmPrincipal.Desabilita;
begin
   //btnReparo.Enabled := False;
   btnConfiguracao.Enabled := False;
   //btnAtualizar.Enabled := False;
   btnSobre.Enabled := False;
   //btnAjuda.Enabled := False;
   btnBackup.Enabled := False;
   if btnRestaura.Enabled then
      btnRestaura.Enabled := False;

   if ckbFTP.Checked then
   begin
      btnUpload.Enabled := False;
      btnDownload.Enabled := False;
   end;

   ckbFTP.Enabled := False;
end;

procedure TfrmPrincipal.Habilita;
begin
   //btnReparo.Enabled := True;
   btnConfiguracao.Enabled := True;
   //btnAtualizar.Enabled := ckbFTP.Checked;
   btnSobre.Enabled := True;
   //btnAjuda.Enabled := True;
   btnBackup.Enabled := True;
   btnRestaura.Enabled := (g_sPemiteRest = 'S');

   if ckbFTP.Checked then
   begin
      btnUpload.Enabled := True;
      btnDownload.Enabled := True;
   end;

   ckbFTP.Enabled := True;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
   if (g_sBackupDireto = 'S') and (g_sPrimeiraVez = 'S') then
      RealizaBackup;
   g_sPrimeiraVez := 'N';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   while idFTP.Connected do
   begin
      Log('Fechando conexão com Servidor Ftp...', False);
      idFTP.Disconnect;
      Log('Desconectado.', False);
   end;

end;

procedure TfrmPrincipal.Copiarpara1Click(Sender: TObject);
begin
   if tvwLocal.SelectionCount = 0 then
   begin
      ShowMessage('Selecione um arquivo.');
      Exit;
   end;

   Application.CreateForm(TfrmCopiarEColar, frmCopiarEColar);
   frmCopiarEColar.Caption := 'Copiar para...';
   frmCopiarEColar.Tag := 0;
   frmCopiarEColar.ShowModal;
   frmCopiarEColar.Free;

   AtualizaLocal;
end;

procedure TfrmPrincipal.Excluir1Click(Sender: TObject);
begin
   if tvwLocal.SelectionCount = 0 then
   begin
      ShowMessage('Selecione um arquivo.');
      Exit;
   end;

   if DeleteFile(frmPrincipal.idsConfiguracaoDIRSERVIDORLOCAL.AsString+'BACKUP\'+
               tvwLocal.Selected.Text) then
      AtualizaLocal;
end;

procedure TfrmPrincipal.btnPararClick(Sender: TObject);
begin
   g_bParar := True;
end;

function TfrmPrincipal.MensagemTraduzida(sMensagemOriginal: string): string;
begin
   if sMensagemOriginal = 'Connection Closed Gracefully.' then
   begin
      Result := 'Operação abortada.';
   end else
   begin
      Result := sMensagemOriginal;
   end;
end;

procedure TfrmPrincipal.btnUploadClick(Sender: TObject);
var
   SearchRec: TSearchRec;
begin
   if tvwLocal.SelectionCount = 0 then
   begin
      ShowMessage('Selecione um arquivo.');
      Exit;
   end;

   HabilitaBotoes(False);

   try

      if not btnAtualizar.Enabled then
      begin
         fArquivo := TFileStream.Create(idsConfiguracaoDIRSERVIDORLOCAL.
            AsString+'\'+
            tvwLocal.Selected.Text, fmOpenRead and fmShareExclusive);
         l_iFileSize := fArquivo.Size;
         fArquivo.Free;

         Log('Eviando o backup...', False);
         idFTP.Tag := 1;
         idFTP.Put(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+
            tvwLocal.Selected.Text, ExtractFileName(idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+
            tvwLocal.Selected.Text), True);

      end;

      AtualizaRemoto;

   except
      on E: Exception do
      begin
         Log('Erro >>'+#13+MensagemTraduzida(E.Message)+'<<', False);
         ShowMessage(MensagemTraduzida(E.Message));
         Exit;
      end;
   end;

   if not btnAtualizar.Enabled then
   begin
      idsBackup.Close;
      idsBackup.SelectSQL.Clear;
      idsBackup.SelectSQL.Add('select * from BACKUP where CODIGO='''+tvwLocal.Selected.Text+'''');
      idsBackup.Open;

      if not idsBackup.IsEmpty then
      begin
         idsBackup.Edit;
         idsBackupENVIADO.AsInteger := 1; //sim
         idsBackup.Post;
         itrBackup.CommitRetaining;
      end;

      idsBackup.Close;
      idsBackup.SelectSQL.Clear;
      idsBackup.SelectSQL.Add('select * from BACKUP where CODIGO=''''');
      idsBackup.Open;
   end;

   Log('Concluído.');

   HabilitaBotoes(True);

end;

procedure TfrmPrincipal.btnDownloadClick(Sender: TObject);
var
   SearchRec: TSearchRec;
begin

   if tvwRemoto.SelectionCount = 0 then
   begin
      ShowMessage('Selecione um arquivo.');
      Exit;
   end;

   if ckbFTP.Checked then
   begin

      HabilitaBotoes(False);

      try
         l_iFileSize := idFTP.Size(ExtractFileName(tvwRemoto.Selected.Text));

         idFTP.Tag := 2;

         if not btnAtualizar.Enabled then
         begin
            Log('Recebendo backup...');
            IdFTP.Get(tvwRemoto.Selected.Text,idsConfiguracaoDIRSERVIDORLOCAL.AsString+'\'+
               tvwRemoto.Selected.Text, True, False);
         end;
         AtualizaLocal;

      except
         on E: Exception do
         begin
            Log('Erro >>'+#13+MensagemTraduzida(E.Message)+'<<', False);

            ShowMessage(MensagemTraduzida(E.Message));

            Exit;
         end;
      end;

      Log('Concluído.');

   end;

   HabilitaBotoes(True);
   tvwLocal.SetFocus;

end;

procedure TfrmPrincipal.ckbFTPClick(Sender: TObject);
begin

   if ckbFTP.Checked then
   begin
      Screen.Cursor := crHourGlass;
      HabilitaBotoes(False);
      Log('Abrindo conexão com Servidor Ftp...', False);
      if (not ConectaidFTP) then
      begin
         Screen.Cursor := crDefault;
         HabilitaBotoes(True);
         ckbFTP.Checked := False;
         Abort;
      end;
      Log('Conectado.', False);
      HabilitaBotoes(True);
      Screen.Cursor := crDefault;
   end else
   begin
      if idFTP.Connected then
      begin
         Log('Fechando conexão com Servidor Ftp...', False);
         idFTP.Disconnect;
         Log('Desconectado.', False);
         btnUpload.Enabled := False;
         btnDownload.Enabled := False;
      end;
   end;

end;

procedure TfrmPrincipal.btnCopiarClick(Sender: TObject);
Var
  sOrigem,
  sDestino: string;
  lOk: Boolean;
begin

   sOrigem := tvwLocal.Selected.Text;
   if Trim(sOrigem) = '' then
   begin
      Mensagem('Selecione um Arquivo para copiar ...',
         'Aviso !!!',MB_OK+MB_ICONWARNING);
      tvwLocal.SetFocus;
      exit;
   end;

   sOrigem := edPastaLocal.Text+'\'+tvwLocal.Selected.Text;

   SaveDialog1.FileName := tvwLocal.Selected.Text;
   if not SaveDialog1.Execute then exit;
   sDestino := SaveDialog1.FileName;

   if FileExists(sDestino) then
      if not Confirma('Já Existe este Arquivo na Pasta de Destino.'+#13+
         'Deseja substituí-lo ?') then exit;

   screen.Cursor := crHourGlass;
   lOk := CopyFile(PChar(sOrigem), PChar(sDestino), False);
   screen.Cursor := crDefault;

   if lOk then
      Mensagem('Arquivo copiado com sucesso ...',
         'Parabéns !!!',MB_OK+MB_ICONEXCLAMATION)
   else
      Mensagem('Erro ao copiar de '+sOrigem+' para '+sDestino,
         'Aviso !!!',MB_OK+MB_ICONERROR);

end;

procedure TfrmPrincipal.SaveDialog1CanClose(Sender: TObject;
  var CanClose: Boolean);
const
   SizeBuffer = 1024;
var
   OldFile: TFileStream;
   NewFile: TFileStream;

   Buffer: Pointer;

   SizeCopied: Integer;
   SizeForCopy, TotalCopied: Int64;
begin
{
   try
      if Self.Tag = 0 then
         OldFile := TFileStream.Create(idsConfiguracaoDIRSERVIDORLOCAL.AsString+
         frmPrincipal.tvwLocal.Selected.Text, fmOpenRead)
      else
         OldFile := TFileStream.Create(SaveDialog1.Files.CommaText,fmOpenRead);
   except
      ShowMessage('Selecione um backup para efetuar a operaçãook');
   end;

   try
      if Self.Tag = 0 then
//         NewFile := TFileStream.Create(SaveDialog1.Files.CommaText, fmOpenWrite or fmCreate)
         NewFile := TFileStream.Create(SaveDialog1.FileName, fmOpenWrite or fmCreate)
      else
         NewFile := TFileStream.Create(idsConfiguracaoDIRSERVIDORLOCAL.AsString+
                    ExtractFileName(SaveDialog1.Files.CommaText), fmOpenWrite or fmCreate)
   except
      OldFile.Free;
      ShowMessage('Selecione um backup para efetuar a operação');
   end;

   SizeForCopy := OldFile.Size;
   TotalCopied := 0;

   with pgbProgresso do
   begin
      Properties.Min := 0;
      Properties.Max := 100;
      Position := 0;
   end;

   GetMem(Buffer, SizeBuffer);

   pnlStatus.Show;
   try
      while TotalCopied < SizeForCopy do
      begin
         SizeCopied := OldFile.Read(Buffer^, SizeBuffer);
         SizeCopied := NewFile.Write(Buffer^, SizeBuffer);

         TotalCopied := TotalCopied + SizeCopied;

         pgbProgresso.Position :=
            Round( (TotalCopied/SizeForCopy)*100 );
         Application.ProcessMessages;
      end;
   finally
      pnlStatus.Hide;

      OldFile.Free;
      NewFile.Free;

      FreeMem(Buffer, SizeBuffer);

//      Self.Close;
   end;
}
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
{
   frmBackupTeste := TfrmBackupTeste.Create(Self);
   frmBackupTeste.ShowModal;
   FreeAndNil(frmBackupTeste);
}
end;

procedure TfrmPrincipal.OpenDialog1CanClose(Sender: TObject;
  var CanClose: Boolean);
const
   SizeBuffer = 1024;
var
   OldFile: TFileStream;
   NewFile: TFileStream;

   Buffer: Pointer;

   SizeCopied: Integer;
   SizeForCopy, TotalCopied: Int64;
begin
{
   try
      if Self.Tag = 0 then
//          OldFile := TFileStream.Create(OpenDialog1.Files.CommaText, fmOpenRead)
         OldFile := TFileStream.Create(OpenDialog1.FileName, fmOpenRead)
      else
         OldFile := TFileStream.Create(idsConfiguracaoDIRSERVIDORLOCAL.AsString+
         tvwLocal.Selected.Text, fmOpenRead)
   except
      ShowMessage('Selecione um backup para efetuar a operação');
   end;

   try
      if Self.Tag = 0 then
         NewFile := TFileStream.Create(idsConfiguracaoDIRSERVIDORLOCAL.AsString+
                                       ExtractFileName(OpenDialog1.FileName),
                                       fmOpenWrite or fmCreate)
      else
//         NewFile := TFileStream.Create(OpenDialog1.Files.CommaText+
         NewFile := TFileStream.Create(ExtractFileName(OpenDialog1.FileName)+
                    ExtractFileName(idsConfiguracaoDIRSERVIDORLOCAL.AsString), fmOpenWrite or fmCreate)
   except
      OldFile.Free;
      ShowMessage('Selecione um backup para efetuar a operação.');
   end;

   SizeForCopy := OldFile.Size;
   TotalCopied := 0;

   with pgbProgresso do
   begin
      Properties.Min := 0;
      Properties.Max := 100;
      Position := 0;
   end;

   GetMem(Buffer, SizeBuffer);

   pnlStatus.Show;
   try
      while TotalCopied < SizeForCopy do
      begin
         SizeCopied := OldFile.Read(Buffer^, SizeBuffer);
         SizeCopied := NewFile.Write(Buffer^, SizeBuffer);

         TotalCopied := TotalCopied + SizeCopied;

         pgbProgresso.Position :=
            Round( (TotalCopied/SizeForCopy)*100 );
         Application.ProcessMessages;
      end;
   finally
      pnlStatus.Hide;

      OldFile.Free;
      NewFile.Free;

      FreeMem(Buffer, SizeBuffer);

//      Self.Close;
   end;
}
end;

procedure TfrmPrincipal.ComprimeArquivos2(sArquivosCompactar: TStrings;
  const sArquivoCompactado: String);
Var
   sNomeArquivo: string;
begin
   sNomeArquivo := sArquivosCompactar[0];
   With zfBackup do
   begin
      FileName := sArquivoCompactado;
      OpenArchive(fmCreate);
      BaseDir  := idsConfiguracaoDIRSERVIDORLOCAL.Value;
      AddFiles(sNomeArquivo);
      CloseArchive;
   end;
end;

procedure TfrmPrincipal.DescomprimeArquivos2(const sArquivoCompactado: String);
Var
   sNomeArquivo: string;
   sDestino: string;
begin
   sNomeArquivo := sArquivoCompactado;
   sDestino     := idsConfiguracaoDIRSERVIDORLOCAL.Value;
   With zfBackup do
   begin
      FileName := sNomeArquivo;
      OpenArchive(fmOpenRead);
      BaseDir := sDestino;
      try
         try
            ExtractFiles('*.*');
            Log('A Descompactação foi bem sucedida ...',False);
         except
            on E: Exception do
            begin
               Log('Não foi possível Descompactar o Arquivo ...'+#13+
                '('+E.Message+')');
            end;
         end;
      finally
         CloseArchive;
      end;
   end;
   pgbProgresso.Position := 0;
   Application.ProcessMessages;
end;

procedure TfrmPrincipal.ComprimeArquivos(sArquivosCompactar: TStrings;
  const sArquivoCompactado: String);
var
  InFile, OutFile, TmpFile: TFileStream;
  Compr: TCompressionStream;
  I, L: Integer;
  S: String;
  ATempPath: array[0..255] of Char;
begin
{

  pnlStatus.Show;
  if sArquivosCompactar.Count > 0 then
  begin

    // Cria o arquivo de saída, será nosso compactado
    OutFile := TFileStream.Create(sArquivoCompactado, fmCreate);
    try
      // Grava o número de arquivos
      L := sArquivosCompactar.Count;
      OutFile.Write(L,SizeOf(L));
      for I := 0 to sArquivosCompactar.Count-1 do
      begin
        //lblLog.Caption := 'Comprimindo: '+IntToStr(I+1)+' de '+IntToStr(sArquivosCompactar.Count);
        lblLog.Caption := 'Comprimindo arquivo ... ';
        InFile := TFileStream.Create(sArquivosCompactar[I], fmOpenRead);
        try
          // Grava o nome do arquivo a compactar
          S := ExtractFilename(sArquivosCompactar[I]);
          L := Length(S);
          OutFile.Write(L,SizeOf(L));
          OutFile.Write(S[1],L);
          // Pega o caminho da pasta temporária do Windows
          ATempPath := #0;
          GetTempPath(256, ATempPath);
          // Grava o tamanho do arquivo a compactar
          L := InFile.Size;
          OutFile.Write(L,SizeOf(L));
          // Comprime o arquivo em um outro temporário
          TmpFile := TFileStream.Create(Trim(ATempPath)+'tmpZLib',fmCreate);
          Compr := TCompressionStream.Create(clMax, TmpFile); // clMax é compressão Máxima
          Compr.OnProgress := ProgressoCompressao; // Atribui o evento para sabermos se a compressão está em andamento
          try
            Compr.CopyFrom(InFile,L); // Efetua a compressão do arquivo
          finally
            Compr.Free;
            TmpFile.Free;
          end;
          // Copia o arquivo comprimido temporário para o nosso arquivo de saída
          TmpFile := TFileStream.Create(Trim(ATempPath)+'tmpZLib',fmOpenRead);
          try
            OutFile.CopyFrom(TmpFile,0);
          finally
            TmpFile.Free;
          end;
        finally
          InFile.Free;
        end;
      end;
      lblLog.Caption := '';
      lblPercentagem.Caption := '';
    finally
      OutFile.Free;
    end;
    DeleteFile(Trim(ATempPath)+'tmpZLib'); // Remove o arquivo temporário
  end;
  pnlStatus.Hide;
}
end;

procedure TfrmPrincipal.ProgressoCompressao(Sender: TObject);
begin
  lblPercentagem.Caption := 'Leitura Atual: '+IntToStr((Sender as TCompressionStream).Position) +
                            ' / Taxa de Compressão: ' + CurrToStrF(100 -
                            (Sender as TCompressionStream).CompressionRate, ffNumber, 2);
  // Processa as mensagens do Windows na aplicação para evitar o estado "Não respondendo"
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.ProgressoDescCompressao(Sender: TObject);
begin
  lblPercentagem.Caption := CurrToStrF(((Sender as TDecompressionStream).Position * 100) / nMax,ffNumber,0);
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.DescomprimeArquivos(FileName, Destination: String);
var
  InFile, OutFile: TFilestream;
  Decompr: TDecompressionStream;
  S: String;
  I,L,C: Integer;
begin
  Destination := IncludeTrailingPathDelimiter(Destination);
  InFile      := TFileStream.Create(FileName,fmOpenRead);
  try
    { Pega o número de arquivos }
    InFile.Read(C,SizeOf(C));
    for I := 1 to C do
    begin
      lblLog.Caption := 'Descompactando: '+IntToStr(I)+' de '+IntToStr(C);
      { Pega o nome do arquivo }
      //InFile.Read(L, SizeOf(L));
      SetLength(S,L);
      InFile.Read(S[1],L);
      { Lê o tamanho do arquivo }
      InFile.Read(L,SizeOf(L));
      { Progresso do arquivo atual. Não se pode ler Decompr.Size, dá erro, por isso utilizamos L }
      nMax := L;
      { Descompacta e grava o arquivo no disco }
      //S := Destination+S; // Adiciona o caminho do arquivo (esta linha é a original)
      s := ChangeFileExt(FileName,'.GBK');
      OutFile := TFileStream.Create(S,fmCreate or fmShareExclusive);
      Decompr := TDecompressionStream.Create(InFile);
      Decompr.OnProgress := ProgressoDescCompressao;
      try
        OutFile.CopyFrom(Decompr,L);
      finally
        OutFile.Free;
        Decompr.Free;
      end;
    end;
    lblLog.Caption := '';
    lblPercentagem.Caption := '';
  finally
    InFile.Free;
  end;
end;

Function TfrmPrincipal.GetPathDataBase(sBanco: string): WideString;
Var
  sPathAplicacao,
  sBaseDados    : WideString;
  tfArq: TextFile;
Begin
  sPathAplicacao := ExtractFilePath(ParamStr(0));
  If FileExists(sPathAplicacao+g_sNomeArqIni) Then
  Begin
     AssignFile(tfArq,sPathAplicacao+g_sNomeArqIni);
     Reset(tfArq);
     while not eof(tfArq) do
     begin
       Readln(tfArq,sBaseDados);
       if sBanco = '1' then
       begin
          if UpperCase(sBaseDados) = '[DATABASE]' then
          begin
             while True do
             begin
                Readln(tfArq,sBaseDados);
                if LeftStr(sBaseDados,3) = '***' then
                   continue
                else
                   break;
             end;
             if LeftStr(sBaseDados,3) <> '***' then break;
          end;
       end else
       begin
          if UpperCase(sBaseDados) = '[DATABASE2]' then
          begin
             Readln(tfArq,sBaseDados);
             break;
          end;
       end;
     end;
     CloseFile(tfArq);
     Result := sBaseDados;
  End else
  begin
     Mensagem('Falta o Arquivo de Inicialização do Sistema ...',
        'E r r o !!!',MB_OK+MB_ICONERROR);
     Result := '';
  end;
end;

Function TfrmPrincipal.GetNomeServidor: WideString;
Var
  sPahtAplicacao,
  sBaseDados    : WideString;
  tfArq: TextFile;
Begin
  sPahtAplicacao := ExtractFilePath(ParamStr(0));
  If FileExists(sPahtAplicacao+g_sNomeArqIni) Then
  Begin
     AssignFile(tfArq,sPahtAplicacao+g_sNomeArqIni);
     Reset(tfArq);
     while not eof(tfArq) do
     begin
       Readln(tfArq,sBaseDados);
       if UpperCase(sBaseDados) = '[SERVIDOR]' then
       begin
          Readln(tfArq,sBaseDados);
          break;
       end;
     end;
     CloseFile(tfArq);
     Result := sBaseDados;
  End else
  begin
     Mensagem('Falta o Arquivo de Inicialização do Sistema ...',
        'E r r o !!!',MB_OK+MB_ICONERROR);
     Result := '';
  end;
end;

Procedure TfrmPrincipal.Mensagem(sTexto: String; sCaption: String; iFlags: Integer);
Begin
   Application.MessageBox(PChar(sTexto), PChar(sCaption), iFlags);
End;

function TfrmPrincipal.Versao_Executavel(sArquivo: String): String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  wHandle : Dword;
  iLen : Integer;
  cDate : Pchar;
  pBuffer : Pointer;
  wSize : Dword;
  cFile: Pchar;
  sFile : String;
begin
  sFile := sArquivo;
  cFile := StrAlloc(Length(sFile) + 1);
  StrPcopy(cFile, sFile);
  iLen := GetFileVersionInfoSizeW(cFile, wHandle);
  Result := '';

  if iLen > 0 then
  begin
    cDate:=StrAlloc(iLen+1);
    if GetFileVersionInfo(cFile,wHandle,iLen,cDate) then
    begin
      VerQueryValue(cDate, '\',pBuffer,wSize);
      F := PFFI(pBuffer);
      Result := Format('%d.%d.%d.%d',
      [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs),
      HiWord(F^.dwFileVersionLs),
      Loword(F^.dwFileVersionLs)]
      );
    end;

    StrDispose(cDate);
  end;

  StrDispose(cFile);

end;

procedure TfrmPrincipal.zfBackupFileProgress(Sender: TObject; FileName: string;
  Progress: Double; Operation: TZFProcessOperation;
  ProgressPhase: TZFProgressPhase; var Cancel: Boolean);
begin
{
   pgbProgresso.Position := Round(Progress);
   lblPercentagem.Caption := FormatFloat('#0',
      (pgbProgresso.Position/pgbProgresso.Properties.Max)*100)+' %';
   Cancel := False;
   Application.ProcessMessages;
}
end;

Function TfrmPrincipal.Confirma(sTexto: String): Boolean;
Var
 iButton: Integer;
Begin
 iButton := Application.MessageBox(PChar(sTexto), 'Confirma !',
  MB_ICONQUESTION + MB_YESNO);
 If iButton = IDYES Then
  Result := True
 Else
  Result := False;
End;

procedure TfrmPrincipal.HabilitaBotoes(lOpcao: Boolean);
begin
   btnBackup.Enabled := lOpcao;
   btnRestaura.Enabled := (lOpcao) and (g_sPemiteRest='S');
   btnConfiguracao.Enabled := lOpcao;
   btnSobre.Enabled := lOpcao;
   btnAtualizar.Enabled := lOpcao;
   if lOpcao = True then
   begin
      if idFTP.Connected then
      begin
         btnUpload.Enabled := True;
         btnDownload.Enabled := True;
      end;
   end else
   begin
      btnUpload.Enabled := False;
      btnDownload.Enabled := False;
   end;
   btnCopiar.Enabled := lOpcao;
   btnColarDe.Enabled := lOpcao;
   ckbFTP.Enabled := lOpcao;

end;


end.


