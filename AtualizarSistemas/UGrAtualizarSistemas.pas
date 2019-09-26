unit UGrAtualizarSistemas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ACBrBase, ACBrDownload;

type
  TFrmAtualizarSistemas = class(TForm)
    Teste: TButton;
    ACBrDownload: TACBrDownload;
    procedure FormCreate(Sender: TObject);
    procedure TesteClick(Sender: TObject);
  private
    { Private declarations }
    aSistemasAgil : TStringList;

    procedure BaixarVersaoInfo;
    procedure VerificarVersao;

    function ExisteConexaoComInternet : Boolean;
    function ObterDiretorioExecutavel : String;
    function ObterVersaoHTTP(const aSistema : String) : String;
  public
    { Public declarations }
    property SistemasAgil : TStringList read aSistemasAgil;
  end;

var
  FrmAtualizarSistemas: TFrmAtualizarSistemas;

implementation

{$R *.dfm}

uses
    WinInet
  , UConstantesDGE
  , UFuncoes;

procedure TFrmAtualizarSistemas.TesteClick(Sender: TObject);
begin
  if not ExisteConexaoComInternet then
    ShowMessage('Sem conexão!')
  else
  begin
    BaixarVersaoInfo;
    VerificarVersao;
  end;
end;

procedure TFrmAtualizarSistemas.VerificarVersao;
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

      ShowMessage( GetExeVersion(aSistema) + ' - ' + aSistema + #13 + '> ' + ObterVersaoHTTP(aSistema) );

    end;
  end;
end;

procedure TFrmAtualizarSistemas.FormCreate(Sender: TObject);
begin
  aSistemasAgil := TStringList.Create;
  aSistemasAgil.Clear;

  aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGI.exe');
  aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGO.exe');
  aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGE.exe');
  aSistemasAgil.Add(ObterDiretorioExecutavel + 'SGE_PDV.exe');
end;

function TFrmAtualizarSistemas.ObterDiretorioExecutavel: String;
begin
  Result := ExtractFilePath(ParamStr(0));
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

procedure TFrmAtualizarSistemas.BaixarVersaoInfo;
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

      ACBrDownload.DownloadUrl     := DOWNLOAD_URL_GERASYS_TI_DRH_UPGRADE + ExtractFileName(aVersaoInfo);
      ACBrDownload.DownloadNomeArq := 'VersaoHTTP_' + ChangeFileExt(ExtractFileName(aSistema), '.inf');
      ACBrDownload.DownloadDest    := '.\';

      ACBrDownload.StartDownload;
    end;
  end;
end;

function TFrmAtualizarSistemas.ExisteConexaoComInternet : Boolean;
var
  nFlags : Cardinal;
begin
  // Retorna True se houver conexão com a internet
  Result := InternetGetConnectedState(@nFlags, 0);
end;

end.
