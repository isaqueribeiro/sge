unit BackupTeste;

interface

uses
   DateUtils, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ExtCtrls, ImgList,   IBServices, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdFTP, IdFTPList, StdCtrls, Buttons,ToolWin, XPMan,
   ZLib, jpeg, IniFiles, TabNotBk, DB, IBDatabase, IBCustomDataSet, StrUtils,
   Mask, DBCtrls, Menus, FMTBcd, SqlExpr, IdExplicitTLSClientServerBase;

type
  TfrmBackupTeste = class(TForm)
    btnCompact: TButton;
    btnDescompact: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnCompactClick(Sender: TObject);
    procedure btnDescompactClick(Sender: TObject);
  private
    procedure CompressFiles(Arquivos: TStrings; const Compactado: String);
    procedure CompressionProgress(Sender: TObject);
    procedure DecompressionProgress(Sender: TObject);
    procedure DecompressFiles(FileName, Destination: String);
    procedure Descomprimir(ArquivoZip: TFileName; DiretorioDestino: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackupTeste: TfrmBackupTeste;
  nMax: Integer;

implementation

{$R *.dfm}

procedure TfrmBackupTeste.btnCompactClick(Sender: TObject);
Var
  sNomeArqZLib: string;
begin
  OpenDialog1.Execute;
  if (Trim(OpenDialog1.FileName) <> '') and (OpenDialog1.Files.Count > 0) then
  begin
    sNomeArqZLib := Trim(OpenDialog1.FileName);
    sNomeArqZLib := ChangeFileExt(sNomeArqZLib,'.ZLB');
    CompressFiles(OpenDialog1.Files,sNomeArqZLib);
  end;
end;

procedure TfrmBackupTeste.btnDescompactClick(Sender: TObject);
Var
  sArquivoZLb: string;
begin
  if not OpenDialog1.Execute then exit;
  sArquivoZLb := OpenDialog1.FileName;
  DecompressFiles(sArquivoZLb,'C:\TEMP');
  //Descomprimir(sArquivoZLb,'C:\TEMP');
end;

procedure TfrmBackupTeste.CompressFiles(Arquivos: TStrings; const Compactado: String);
var
  InFile, OutFile, TmpFile: TFileStream;
  Compr: TCompressionStream;
  I, L: Integer;
  S: String;
  ATempPath: array[0..255] of Char;
begin
  if Arquivos.Count > 0 then
  begin
    // Cria o arquivo de saída, será nosso compactado
    OutFile := TFileStream.Create(Compactado, fmCreate);
    try
      // Grava o número de arquivos
      L := Arquivos.Count;
      OutFile.Write(L,SizeOf(L));
      for I := 0 to Arquivos.Count-1 do
      begin
        Label1.Caption := 'Comprimindo: '+IntToStr(I+1)+' de '+IntToStr(Arquivos.Count);
        InFile := TFileStream.Create(Arquivos[I], fmOpenRead);
        try
          // Grava o nome do arquivo a compactar
          S := ExtractFilename(Arquivos[I]);
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
          Compr.OnProgress := CompressionProgress; // Atribui o evento para sabermos se a compressão está em andamento
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
      Label1.Caption := '';
      Label2.Caption := '';
    finally
      OutFile.Free;
    end;
    DeleteFile(Trim(ATempPath)+'tmpZLib'); // Remove o arquivo temporário
  end;
end;

procedure TfrmBackupTeste.CompressionProgress(Sender: TObject);
begin
  Label2.Caption := 'Leitura Atual: '+IntToStr((Sender as TCompressionStream).Position) +
                    ' / Taxa de Compressão: ' + CurrToStrF(100 -
                    (Sender as TCompressionStream).CompressionRate, ffNumber, 2);
  // Processa as mensagens do Windows na aplicação para evitar o estado "Não respondendo"
  Application.ProcessMessages;
end;

procedure TfrmBackupTeste.DecompressionProgress(Sender: TObject);
begin
  Label2.Caption := CurrToStrF(((Sender as TDecompressionStream).Position * 100) / nMax,ffNumber,0);
  Application.ProcessMessages;
end;

procedure TfrmBackupTeste.DecompressFiles(FileName, Destination: String);
var
  InFile, OutFile: TFilestream;
  Decompr: TDecompressionStream;
  sNomeArqGBK: String;
  iiI, iL, iC: Integer;
begin
  Destination := IncludeTrailingPathDelimiter(Destination);
  InFile      := TFileStream.Create(FileName,fmOpenRead);
  try
    // Pega o número de arquivos
    InFile.Read(iC,SizeOf(iC));
    //for iI := 1 to iC do
    //begin
    //  Label1.Caption := 'Descompactando: '+IntToStr(iI)+' de '+IntToStr(iC);
      // Pega o nome do arquivo
      InFile.Read(iL,SizeOf(iL));
      SetLength(sNomeArqGBK,iL);
      InFile.Read(sNomeArqGBK[1],iL);
      // Lê o tamanho do arquivo
      InFile.Read(iL,SizeOf(iL));
      // Progresso do arquivo atual. Não se pode ler Decompr.Size, dá erro, por isso utilizamos iL
      nMax := iL;
      // Descompacta e grava o arquivo no disco
      //S := Destination+S; // Adiciona o caminho do arquivo
      sNomeArqGBK := 'RESTAURA_'+FormatDateTime('dd_mm_yyyy_hh_mm_ss',Now)+'.GBK';
      sNomeArqGBK := Destination+sNomeArqGBK;
      OutFile := TFileStream.Create(sNomeArqGBK,fmCreate or fmShareExclusive);
      Decompr := TDecompressionStream.Create(InFile);
      Decompr.OnProgress := DecompressionProgress;
      try
        OutFile.CopyFrom(Decompr,iL);
      finally
        OutFile.Free;
        Decompr.Free;
      end;
    //end;
    Label1.Caption := '';
    Label2.Caption := '';
  finally
    InFile.Free;
  end;
end;

procedure TfrmBackupTeste.Descomprimir(ArquivoZip: TFileName;
   DiretorioDestino: string);
var
   NomeSaida: string;
   FileEntrada, FileOut: TFileStream;
   Descompressor: TDecompressionStream;
   iNumArq, iI, iLen, iSize: Integer;
   bFim: Byte;
begin

  FileEntrada := TFileStream.Create(ArquivoZip, fmOpenRead and
     fmShareExclusive);
  Descompressor := TDecompressionStream.Create(FileEntrada);
  Descompressor.Read(iNumArq,SizeOf(Integer));

  try
     iI:=0;
     While iI < iNumArq do
     begin
        Descompressor.Read(iLen,SizeOf(Integer));
        SetLength(NomeSaida,iLen);
        Descompressor.Read(NomeSaida[1],iLen);
        Descompressor.Read(iSize,SizeOf(Integer));
        FileOut := TFileStream.Create(IncludeTrailingBackslash(
           DiretorioDestino) + NomeSaida, fmCreate or fmShareExclusive);
        try
           FileOut.CopyFrom(Descompressor,iSize);
        finally
           FileOut.Free;
        end;
        Descompressor.Read(bFim,SizeOf(Byte));
        Inc(iI);
     end;
  finally
     FreeAndNil(Descompressor);
     FreeAndNil(FileEntrada);
  end;

end;

end.
