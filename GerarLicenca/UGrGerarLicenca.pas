unit UGrGerarLicenca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, IniFiles;

type
  TFrmGrGerarLicenca = class(TForm)
    lblEmpresa: TLabel;
    edEmpresa: TEdit;
    lblCGC: TLabel;
    edCGC: TEdit;
    lblEndereco: TLabel;
    edEndereco: TEdit;
    lblBairro: TLabel;
    edBairro: TEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    lblUF: TLabel;
    edUF: TEdit;
    lblCEP: TLabel;
    edCEP: TEdit;
    lblCompetencia: TLabel;
    edCompetencia: TEdit;
    Label7: TLabel;
    XPManifest: TXPManifest;
    BtnCarregarLicenca: TButton;
    BtnGerarLicenca: TButton;
    opdLicenca: TOpenDialog;
    lblDataBloqueio: TLabel;
    edDataBloqueio: TEdit;
    procedure BtnCarregarLicencaClick(Sender: TObject);
    procedure BtnGerarLicencaClick(Sender: TObject);

    function EncriptSenha(const Value, Key : String) : String;
    function DecriptarSenha(const Value, Key : String) : String;
    procedure edCompetenciaChange(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarLicenca(const sNomeArquivo : String);
    procedure GerarLicenca(const sNomeArquivo : String);
  public
    { Public declarations }
  end;

var
  FrmGrGerarLicenca: TFrmGrGerarLicenca;

implementation

uses
  UConstantesDGE, DateUtils;

{$R *.dfm}

procedure ShowMessageInformacao(sTitulo, sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), PChar(sTitulo), MB_ICONINFORMATION);
end;

procedure ShowMessageAlerta(sTitulo, sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), PChar(sTitulo), MB_ICONWARNING);
end;

procedure ShowStop(sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Pare!', MB_ICONSTOP);
end;

procedure TFrmGrGerarLicenca.BtnCarregarLicencaClick(Sender: TObject);
begin
  if opdLicenca.Execute then
    CarregarLicenca(opdLicenca.FileName);
end;

procedure TFrmGrGerarLicenca.CarregarLicenca(
  const sNomeArquivo: String);
var
  Arquivo : TStringList;
  ini : TIniFile;
  I : Integer;
begin
  Arquivo := TStringList.Create;
  try
    Arquivo.LoadFromFile( sNomeArquivo );

    for I := 0 to Arquivo.Count - 1 do
      Arquivo.Strings[I] := DecriptarSenha(Arquivo.Strings[I], SYS_PASSWD_KEY);

    Arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + '_temp.ini');

    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');

    edEmpresa.Text  := ini.ReadString('Licenca', edEmpresa.Name,  '');
    edCGC.Text      := ini.ReadString('Licenca', edCGC.Name,      '');
    edEndereco.Text := ini.ReadString('Licenca', edEndereco.Name, '');
    edBairro.Text   := ini.ReadString('Licenca', edBairro.Name,   '');
    edCidade.Text   := ini.ReadString('Licenca', edCidade.Name,   '');
    edUF.Text       := ini.ReadString('Licenca', edUF.Name,       '');
    edCEP.Text      := ini.ReadString('Licenca', edCEP.Name,      '');
    edCompetencia.Text  := ini.ReadString('Licenca', edCompetencia.Name, FormatDateTime('yyyymm', Date + 30));
    edDataBloqueio.Text := FormatDateTime('dd/mm/yyyy', ini.ReadDateTime('Licenca', edDataBloqueio.Name, Date + 45));

    edCompetenciaChange( edCompetencia );
  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;
end;

procedure TFrmGrGerarLicenca.GerarLicenca(const sNomeArquivo: String);
var
  Arquivo : TStringList;
  ini : TIniFile;
  I : Integer;
begin
  Arquivo := TStringList.Create;
  try
    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + '_temp.ini');

    ini.WriteString  ('Licenca', edEmpresa.Name,  Trim(edEmpresa.Text));
    ini.WriteString  ('Licenca', edCGC.Name,      Trim(edCGC.Text));
    ini.WriteString  ('Licenca', edEndereco.Name, Trim(edEndereco.Text));
    ini.WriteString  ('Licenca', edBairro.Name,   Trim(edBairro.Text));
    ini.WriteString  ('Licenca', edCidade.Name,   Trim(edCidade.Text));
    ini.WriteString  ('Licenca', edUF.Name,       Trim(edUF.Text));
    ini.WriteString  ('Licenca', edCEP.Name,      Trim(edCEP.Text));
    ini.WriteString  ('Licenca', edCompetencia.Name,  Trim(edCompetencia.Text));
    ini.WriteDateTime('Licenca', edDataBloqueio.Name, StrToDateTimeDef(edDataBloqueio.Text, Date + 15));

    ini.UpdateFile;

    Arquivo.LoadFromFile( ini.FileName );

    for I := 0 to Arquivo.Count - 1 do
      Arquivo.Strings[I] := EncriptSenha(Arquivo.Strings[I], SYS_PASSWD_KEY);

    Arquivo.SaveToFile(sNomeArquivo);

  finally
    ini.Free;
    Arquivo.Free;

    DeleteFile(ExtractFilePath(Application.ExeName) + '_temp.ini');
  end;
end;

procedure TFrmGrGerarLicenca.BtnGerarLicencaClick(Sender: TObject);
var
  sNomeArquivo : String;
begin
  if (Trim(edEmpresa.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa o nome da empresa!');
    Exit;
  end
  else
  if (Trim(edCGC.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa o CGC/CNPJ!');
    Exit;
  end
  else
  if (Trim(edCompetencia.Text) = EmptyStr) then
  begin
    ShowMessageAlerta('Alerta', 'Favor informa a competência limite!');
    Exit;
  end;

  sNomeArquivo := StringReplace(StringReplace(StringReplace(Trim(edCGC.Text), '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]) + ' - ' + Trim(edEmpresa.Text);
  sNomeArquivo := ExtractFilePath(Application.ExeName) + sNomeArquivo + '.lnc';

  GerarLicenca(sNomeArquivo);
  
  ShowMessageInformacao('Licença', 'Arquivo gerado com sucesso!' + #13#13 + sNomeArquivo);
end;

function TFrmGrGerarLicenca.DecriptarSenha(const Value,
  Key: String): String;
begin
  Result := EncriptSenha(Value, Key);
end;

function TFrmGrGerarLicenca.EncriptSenha(const Value, Key: String): String;
var
  iCarac ,
  KeyAlt : Integer;
begin
  KeyAlt := Length(Key);

  for iCarac := 1 to Length(Key) do
    KeyAlt := KeyAlt xor Ord(Key[iCarac]);

  Result := Value;

  for iCarac := 1 to Length(Value) do
    Result[iCarac] := chr(not(ord(Value[iCarac]) xor Ord(KeyAlt)));
end;

procedure TFrmGrGerarLicenca.edCompetenciaChange(Sender: TObject);
var
  dData : TDateTime;
begin
  if Length(Trim(edCompetencia.Text)) = 6 then
  begin
    if StrToIntDef(Copy(Trim(edCompetencia.Text), 5, 2), 0) > 12 then
      Exit;
      
    dData := StrToDate( '01/' + Copy(Trim(edCompetencia.Text), 5, 2) + '/' + Copy(Trim(edCompetencia.Text), 1, 4) );
    dData := StrToDate( FormatFloat('00"/"', DaysInMonth(dData)) + FormatDateTime('mm/yyyy', dData) );

    edDataBloqueio.Text := FormatDateTime('dd/mm/yyyy', dData + 15);
  end;
end;

end.
