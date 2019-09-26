unit uAtualizadorAutomatico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP;

type
  TfAtualizadorAutomatico = class(TForm)
    btnAtualizacao: TBitBtn;
    lbStatus: TLabel;
    pbDownload: TProgressBar;
    Button1: TButton;
    IdFTP: TIdFTP;
    procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure btnAtualizacaoClick(Sender: TObject);
  private
    FnTamanhoTotal: integer;

    function VerificarExisteConexaoComInternet: boolean;
    function ObterDiretorioDoExecutavel: string;
    function ConectarAoServidorFTP: boolean;
    function ObterNumeroVersaoLocal: smallint;
    function ObterNumeroVersaoFTP: smallint;
    procedure BaixarAtualizacao;
    procedure DescompactarAtualizacao;
    procedure AtualizarNumeroVersao;
  end;

  // Passo-a-Passo :
  // https://www.andrecelestino.com/delphi-funcionalidade-de-atualizacao-automatica-parte-1/

var
  fAtualizadorAutomatico: TfAtualizadorAutomatico;

implementation

uses
  IdException,
  // declarada para usar a função "InternetGetConnectedState"
  WinInet,
  // declarada para acessar os arquivos INI
  IniFiles,
  // declarada para executar a linha de comando do 7-zip
  ShellAPI;

{$R *.dfm}

{ TForm1 }

function TfAtualizadorAutomatico.VerificarExisteConexaoComInternet: boolean;
var
  nFlags: Cardinal;
begin
  // retorna True se houver conexão com a internet
  result := InternetGetConnectedState(@nFlags, 0);
end;

function TfAtualizadorAutomatico.ConectarAoServidorFTP: boolean;
begin
  // desconecta, caso tenha sido conectado anteriormente
  if IdFTP.Connected then
    IdFTP.Disconnect;

  try
    IdFTP.Connect;
    result := True;
  except
    On E:Exception do
    begin
      ShowMessage('Erro ao acessar o servidor de atualização: ' + E.Message);
      result := False;
    end;
  end;
end;

function TfAtualizadorAutomatico.ObterNumeroVersaoLocal: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // abre o arquivo "VersaoLocal.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoLocal.ini');
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoLocal', 'Numero', EmptyStr);

    // retira os pontos (exemplo: "1.0.0" para "100")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr, [rfReplaceAll]);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

function TfAtualizadorAutomatico.ObterNumeroVersaoFTP: smallint;
var
  sNumeroVersao: string;
  oArquivoINI: TIniFile;
begin
  // deleta o arquivo "VersaoFTP.ini" do computador, caso exista,
  // evitando erro de arquivo já existente
  if FileExists(ObterDiretorioDoExecutavel + 'VersaoFTP.ini') then
    DeleteFile(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');

  // baixa o arquivo "VersaoFTP.ini" para o computador
  IdFTP.Get('atualizacao/VersaoFTP.ini', ObterDiretorioDoExecutavel + 'VersaoFTP.ini', True, True);

  // abre o arquivo "VersaoFTP.ini"
  oArquivoINI := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');
  try
    // lê o número da versão
    sNumeroVersao := oArquivoINI.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // retira os pontos (exemplo: "1.0.1" para "101")
    sNumeroVersao := StringReplace(sNumeroVersao, '.', EmptyStr, [rfReplaceAll]);

    // converte o número da versão para número
    result := StrToIntDef(sNumeroVersao, 0);
  finally
    FreeAndNil(oArquivoINI);
  end;
end;

procedure TfAtualizadorAutomatico.BaixarAtualizacao;
begin
  try
    // deleta o arquivo "Atualizacao.rar", caso exista,
    // evitando erro de arquivo já existente
    if FileExists(ObterDiretorioDoExecutavel + 'Atualizacao.rar') then
      DeleteFile(ObterDiretorioDoExecutavel + 'Atualizacao.rar');

    // obtém o tamanho da atualização e preenche a variável "FnTamanhoTotal"
    FnTamanhoTotal := IdFTP.Size('atualizacao/Atualizacao.rar');

    // faz o download do arquivo "Atualizacao.rar"
    IdFTP.Get('atualizacao/Atualizacao.rar',
      ObterDiretorioDoExecutavel + 'Atualizacao.rar', True, True);
  except
    On E:EIdConnClosedGracefully do
      Exit;

    On E:Exception do
    begin
      ShowMessage('Erro ao baixar a atualização: ' + E.Message);

      // interrompe a atualização
      Abort;
    end;
  end;
end;

procedure TfAtualizadorAutomatico.DescompactarAtualizacao;
var
  sNomeArquivoAtualizacao: string;
begin
  // deleta o backup anterior, ou melhor, de versões anteriores,
  // evitando erro de arquivo já existente
  if FileExists(ObterDiretorioDoExecutavel + 'Sistema_Backup.exe') then
    DeleteFile(ObterDiretorioDoExecutavel + 'Sistema_Backup.exe');

  // Renomeia o executável atual (desatualizado) para "Sistema_Backup.exe"
  RenameFile(ObterDiretorioDoExecutavel + 'Sistema.exe',
    ObterDiretorioDoExecutavel + 'Sistema_Backup.exe');

  // armazena o nome do arquivo de atualização em uma variável
  sNomeArquivoAtualizacao := ObterDiretorioDoExecutavel + 'Atualizacao.rar';

  // executa a linha de comando do 7zip para descompactar o arquivo baixado
  ShellExecute(0, nil, '7z',  PWideChar(' e -aoa ' +
    sNomeArquivoAtualizacao +' -o' + ObterDiretorioDoExecutavel), '', SW_SHOW);
end;

procedure TfAtualizadorAutomatico.AtualizarNumeroVersao;
var
  oArquivoLocal, oArquivoFTP: TIniFile;
  sNumeroNovaVersao: string;
begin
  // abre os dois arquivos INI
  oArquivoFTP := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoFTP.ini');
  oArquivoLocal := TIniFile.Create(ObterDiretorioDoExecutavel + 'VersaoLocal.ini');
  try
    // obtém o número da nova versão no arquivo "VersaoFTP.ini"...
    sNumeroNovaVersao := oArquivoFTP.ReadString('VersaoFTP', 'Numero', EmptyStr);

    // ... e grava este número no arquivo "VersaoLocal.ini"
    oArquivoLocal.WriteString('VersaoLocal', 'Numero', sNumeroNovaVersao);
  finally
    FreeAndNil(oArquivoFTP);
    FreeAndNil(oArquivoLocal);
  end;
end;

procedure TfAtualizadorAutomatico.btnAtualizacaoClick(Sender: TObject);
var
  nNumeroVersaoLocal, nNumeroVersaoFTP: smallint;
begin
  // desativa o botão de atualização para evitar 2 ou mais conexões
  btnAtualizacao.Enabled := False;

  lbStatus.Caption := 'Aguarde...';
  Application.ProcessMessages;

  try
    // se não houver conexão com a internet, sai do método
    if not VerificarExisteConexaoComInternet then
      Exit;

    // se não houver conexão com o servidor FTP, sai do método
    if not ConectarAoServidorFTP then
      Exit;

    // obtém os números das versões (local e FTP)
    nNumeroVersaoLocal := ObterNumeroVersaoLocal;
    nNumeroVersaoFTP := ObterNumeroVersaoFTP;

    // faz uma comparação para identificar se é necessário baixar a atualização
    if nNumeroVersaoLocal < nNumeroVersaoFTP then
    begin
      // processa a atualização
      BaixarAtualizacao;
      DescompactarAtualizacao;
      AtualizarNumeroVersao;

      ShowMessage('O sistema foi atualizado com sucesso!');

      // Reinicia a aplicação para abrir o novo executável
      ShellExecute(Handle, nil, PChar(Application.ExeName), '', nil, SW_SHOWNORMAL);
      Application.Terminate;
    end
    else
      ShowMessage('O sistema já está atualizado!');
  finally
    lbStatus.Caption := EmptyStr;
    btnAtualizacao.Enabled := True;
  end;
end;

procedure TfAtualizadorAutomatico.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  nTamanhoTotal, nTransmitidos, nPorcentagem: real;
begin
  if FnTamanhoTotal = 0 then
    Exit;

  // obtém o tamanho total do arquivo em bytes
  nTamanhoTotal := FnTamanhoTotal div 1024;

  // obtém a quantidade de bytes já baixados
  nTransmitidos := AWorkCount div 1024;

  // calcula a porcentagem de download
  nPorcentagem := (nTransmitidos * 100) / nTamanhoTotal;

  // atualiza o componente TLabel com a porcentagem
  lbStatus.Caption := 'Download: ' +
    Format('%s%%', [FormatFloat('##0', nPorcentagem)]);

  // atualiza a barra de preenchimento do componente TProgressBar
  pbDownload.Position := AWorkCount div 1024;

  // processa as mensagens pendentes do sistema para atualizar os componentes
  Application.ProcessMessages;
end;

procedure TfAtualizadorAutomatico.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  pbDownload.Max := FnTamanhoTotal div 1024;
end;

function TfAtualizadorAutomatico.ObterDiretorioDoExecutavel: string;
begin
  result := ExtractFilePath(Application.ExeName);
end;

end.
