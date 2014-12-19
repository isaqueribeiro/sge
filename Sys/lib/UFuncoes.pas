unit UFuncoes;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ExtCtrls, ShellApi, Printers,
  Graphics, IniFiles, PSApi, Winsock, WinSvc, WinInet, StrUtils;

  function GetExeVersion(const FileName : TFileName) : String; overload;
  function GetExeVersion : String; overload;
  function GetVersion : String;
  function GetCopyright : String;
  function GetInternalName : String;
  function GetProductName : String;
  function GetProductVersion : String;
  function GetFileDescription : String;
  function GetCompanyName : String;
  function GetContacts : String;
  function GetConectedInternet : Boolean;
  function GetEmailValido(email : String; bShowMsg : Boolean) : Boolean;

  function Path_MeusDocumentos : String;
  function Path_Windows : String;
  function Path_Temporario : String;
  function Path_Comando : String;
  function Path_DiretorioWindows : String;

  function Espaco(ALen : Integer = 1) : String;
  function RemoveAcentos(Str : String) : String;
  function LimpaNomePessoa(Value : String) : String;
  function Metafonema(Value : String) : String;

implementation

uses
  UInfoVersao, UConstantesDGE;

var
  vet_valido : Array [0..35] of String = (
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
    'u', 'v', 'w', 'x', 'y', 'z');
    
function GetExeVersion(const FileName : TFileName) : String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  PFileName: Pchar;
begin
   PFileName := StrAlloc(Length(FileName) + 1);
   StrPcopy(PFileName, FileName);
   Len := GetFileVersionInfoSize(PFileName, Handle);
   Result := '';
   if (Len > 0) then
   begin
     Data := StrAlloc(Len + 1);
     if GetFileVersionInfo(PFileName, Handle, Len, Data) then
     begin
       VerQueryValue(Data, '\', Buffer, Tamanho);
       F := PFFI(Buffer);
       Result := Format('%d.%d.%d.%d ', [HiWord(F^.dwFileVersionMs),
                                         LoWord(F^.dwFileVersionMs),
                                         HiWord(F^.dwFileVersionLs),
                                         Loword(F^.dwFileVersionLs)]);
     end;
     StrDispose(Data)
   end;
   StrDispose(PFileName);
end;

Function GetExeVersion : String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := ParamStr(0);
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;

function GetVersion : String;
begin
  {$IFDEF DGE}
  Result := VERSION_NUMBER;
  {$ELSE}
  Result := TInfoVersao.GetInstance().getPropertyValue(ivFILE_VERSION);
  {$ENDIF}
end;

function GetCopyright : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivLEGAL_COPYRIGHT);
end;

function GetInternalName : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivINTERNAL_NAME);
end;

function GetProductName : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivPRODUCT_NAME);
end;

function GetProductVersion : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivPRODUCT_VERSION);
end;

function GetFileDescription : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivFILE_DESCRIPTION);
end;

function GetCompanyName : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivCOMPANY_NAME);
end;

function GetContacts : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivCONTACTS);
end;

function GetConectedInternet : Boolean;
var
  Flags : Cardinal;
begin
  if ( not InternetGetConnectedState(@Flags, 0) ) then
    Result := False
  else
  if ( (Flags and INTERNET_CONNECTION_LAN) <> 0 ) then
    // H· conex„o com a Internet atravÈs de um roteador
    Result := True
  else
  if ( (Flags and INTERNET_CONNECTION_PROXY) <> 0 ) then
    // H· conex„o com a Internet atravÈs de um proxy
    Result := True
  else
    Result := False;
end;

function GetEmailValido(email : String; bShowMsg : Boolean) : Boolean;
var
  i ,
  j ,
  tam_email   ,
  simb_arroba ,
  simb_arroba2,
  qtd_arroba  ,
  qtd_pontos  ,
  qtd_pontos_esq,
  qtd_pontos_dir,
  posicao ,
  posicao2,
  ponto   ,
  ponto2    : Integer;
  vet_email : Array [0..49] of String; // 50 posiÁıes, capacidade do Edit
  msg       : String;
const
  msg1  = 'Caractere(s) inv·lido(s) no inÌcio do e-mail.';
  msg2  = 'SÌmbolo @ n„o foi encontrado.';
  msg3  = 'Excesso do sÌmbolo @.';
  msg4  = 'Caractere(s) inv·lido(s) antes do sÌmbolo @.';
  msg5  = 'Caractere(s) inv·lido(s) depois do sÌmbolo @.';
  msg6  = 'Agrupamento de caractere(s) inv·lido(s) a esqueda do @.';
  msg7  = 'N„o existe ponto(s) digitado(s).';
  msg8  = 'Ponto encontrado no final do e-mail.';
  msg9  = 'AusÍncia de caractere(s) apÛs o ˙ltimo ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada apÛs o @.';
  msg12 = 'Caractere(s) inv·lido(s) antes do ponto.';
  msg13 = 'Caractere(s) inv·lido(s) depois do ponto.';
begin
  Result := True; //(Pos('@', email) >= 2) and (Pos('.', email) >= Pos('@', email) + 2) and (Pos('.', email) < Length(email));

  Exit;

  qtd_pontos     := 0;
  qtd_pontos_esq := 0;
  qtd_pontos_dir := 0;
  qtd_arroba     := 0;
  posicao        := 0;
  posicao2       := 0;
  simb_arroba    := 0;
  simb_arroba2   := 0;
  ponto          := 0;
  ponto2         := 0;
  msg            := EmptyStr;

  Result := True;

  //Verificando parte inicial do E-mail

  tam_email := Length(email);

  for i:= 0 to tam_email - 1 do
  begin
    vet_email[i] := Copy(email, i + 1, 1);

    if vet_email[i] = '@' then
    begin
      Inc(qtd_arroba);
      posicao := i;
    end;
  end;

  if ( (vet_email[0] = '@') or (vet_email[0] = '.') or (vet_email[0] = '-') ) then
  begin
    Result := False;
    msg    := msg1;
  end;

  //Verificando se tem o sÌmbolo @ e quantos tem

  if qtd_arroba <> 1 then
  begin
    Result := False;
    msg    := msg3 + #13 + 'Encontrado(s): ' + IntToStr(qtd_arroba) + '.';
  end
  else
  begin
    //Verificando o que vem antes e depois do sÌmbolo @

    for i := 0 to 35 do
    begin
      if vet_email[posicao - 1] <> vet_valido[i] then
        Inc(simb_arroba)
      else
        Dec(simb_arroba);

      if vet_email[posicao + 1] <> vet_valido[posicao] then
        Inc(qtd_pontos_dir)
      else
        Inc(qtd_pontos_esq);

      if ((vet_email[i - 1] = '.') or (vet_email[i - 1] = '-')) then
      begin
        Result := False;
        msg    := msg6;
      end;
    end;

    if qtd_pontos <> 3 then
    begin
      Result := False;
      msg    := msg10 + #13 + 'Encontrado(s): ' + IntToStr(qtd_pontos) + ', sendo ' + IntToStr(qtd_pontos_dir) + ' a direita do @.';
    end
    else
    if (not ((((tam_email - posicao2) = 3) and (qtd_pontos_dir = 1)) or
             (((tam_email - posicao2) = 3) and (qtd_pontos_dir = 2)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 3)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 2)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 1)))) then
    begin
      Result := False;
      msg    := msg11 + #10 + 'Encontrado(s) a esquerda do @: '+
      IntToStr(qtd_pontos_esq) +#10+ 'Encontrado(s) a direita do @: '+
      IntToStr(qtd_pontos_dir)+'.';
    end 
   else 
    //Verificando o que vem antes e depois do ponto 
    begin 
      for i:=0 to 35 do 
       begin 
         if vet_email[posicao2-2] <> vet_valido[i] then 
          Inc(ponto) 
         else 
          Dec(ponto); 

         if vet_email[posicao2] <> vet_valido[i] then 
          Inc(ponto2) 
         else 
          Dec(ponto2); 
       end; 

      if ponto = 36 then 
       begin 
         //Antes do ponto h· um sÌmbolo desconhecido do vetor v·lido 
         Result:= False; 
         msg:= msg12; 
       end 
      else if ponto2 = 36 then 
       begin 
         //Depois do ponto h· um sÌmbolo desconhecido do vetor v·lido 
         Result:= False; 
         msg:= msg13; 
       end 
    end; 

  //VerificaÁ„o final
  if ( not Result ) and ( bShowMsg ) then
   begin 
     msg:= msg + #10 + 'Formato de E-mail n„o aceit·vel!!'; 
     //MessageDlg(msg, mtWarning, [mbRetry], 0);
   end;

end;

end;

function Path_MeusDocumentos : String;
begin
  Result := GetEnvironmentVariable('USERPROFILE');

  if Pos('Documents', Result) = 0 then
    Result := GetEnvironmentVariable('USERPROFILE') + '\Documents';

  if not DirectoryExists(Result) then
    Result := GetEnvironmentVariable('USERPROFILE') + '\Documentos';

  if not DirectoryExists(Result) then
    Result := GetEnvironmentVariable('USERPROFILE') + '\Meus Documentos';
end;

function Path_Windows : String;
begin
  Result := GetEnvironmentVariable('PATH');
end;

function Path_Temporario : String;
begin
  Result := GetEnvironmentVariable('TMP');
  if Trim(Result) = EmptyStr then
    Result := GetEnvironmentVariable('TEMP');
end;

function Path_Comando : String;
begin
  Result := GetEnvironmentVariable('COMSPEC');
end;

function Path_DiretorioWindows : String;
begin
  Result := GetEnvironmentVariable('Windir');
end;

function Espaco(ALen : Integer = 1) : String;
begin
  Result := StringOfChar(#32, ALen);
end;

function RemoveAcentos(Str : String) : String;
const
  COM_ACENTO = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹™∫';
  SEM_ACENTO = 'aaeouaoaeioucuAAEOUAOAEIOUCUao';
var
  X : Integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x],COM_ACENTO) <> 0 then
      Str[x] := SEM_ACENTO[Pos(Str[x], COM_ACENTO)];

  Result := Str;
end;

function LimpaNomePessoa(Value : String) : String;
begin
  Result := Trim(Value);
  if Value <> Espaco(Length(Value)) then
  begin
    Result := RemoveAcentos(Value);
    Result := StringReplace(Result, '.', '',      [rfReplaceAll]);
    Result := StringReplace(Result, Chr(39), ' ', [rfReplaceAll]);  // Apostrofo
    Result := StringReplace(Result, '-', ' ',     [rfReplaceAll]);  // HifÈn
    Result := StringReplace(Result, '  ', ' ',    [rfReplaceAll]);  // Espaco duplo
  end;
end;

function Metafonema(Value : String) : String;
var
  i, p: Integer;
  novo, aux: string;
const
  DELIMITER = '.';
begin

  try

    aux  := LimpaNomePessoa(AnsiUpperCase(Value));
    novo := EmptyStr;

    // Tira acentos que porventura ficaram para tr·s
    for i := 1 to Length(aux) do
    begin
      case aux[i] of
        '¡', '¬', '√', '¿', 'ƒ', '≈': aux[i] := 'A';
        '…', ' ', '»', 'À': aux[i] := 'E';
        'Õ', 'Œ', 'Ã', 'œ': aux[i] := 'I';
        '”', '‘', '’', '“', '÷': aux[i] := 'O';
        '⁄', '€', 'Ÿ', '‹': aux[i] := 'U';
        '«': aux[i] := 'C';
        '—': aux[i] := 'N';
        '›', 'ü', 'Y': aux[i] := 'I';
      else
        if Ord(aux[i]) > 127 then
          aux[i] := #32;
      end;
    end;

    aux := StringReplace(aux, ' ', DELIMITER, [rfReplaceAll]);

    // Retira E , DA, DE e DO do nome
    // JosÈ da Silva = JosÈ Silva
    // Jo„o Costa e Silva = Jo„o Costa Silva
    p := Pos(' DA ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 3);
      p := Pos(' DA ', aux);
    end;

    p := Pos(' DAS ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 4);
      p := Pos(' DAS ', aux);
    end;

    p := Pos(' DE ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 3);
      p := Pos(' DE ', aux);
    end;

    p := Pos(' DI ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 3);
      p := Pos(' DI ', aux);
    end;

    p := Pos(' DO ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 3);
      p := Pos(' DO ', aux);
    end;

    p := Pos(' DOS ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 4);
      p := Pos(' DOS ', aux);
    end;

    p := Pos(' E ', aux);
    while p > 0 do
    begin
      Delete(aux, p, 2);
      p := Pos(' E ', aux);
    end;

    // Retira letras duplicadas
    // Elizabette = Elizabete

    for i := 1 to Length(aux)-1 do
      if aux[i] = aux[i + 1] then
        Delete(aux, i, 1);

    for i := 1 to Length(aux) do
    begin
      case aux[i] of
        // 'A','E','I','O','U','Y','H' e espaÁos: ignora

        'B','D','F','J','K','L','M','N','R','T','V','X', DELIMITER:
          novo := novo + aux[i];

        'C':  // CH = X
          if aux[i+1] = 'H' then
            novo := novo + 'X'
          else // Carol = Karol
          if (aux[i+1] in ['A','O','U']) then // CharInSet(aux[i+1], ['A','O','U']) then
            novo := novo + 'K'
          else // Celina = Selina
          if (aux[i+1] in ['E','I']) then // CharInSet(aux[i+1], ['E','I']) then
            novo := novo + 'S'
          else // Isaac = Isaque, Isac
          if (aux[i-1] = 'A') and (aux[i-2] = 'A') or ( (aux[i-1] = 'A') and (aux[i+1] = ' ')) then
            novo := novo + 'K';

        'G': // Jeferson = Geferson
          if aux[i+i] = 'E' then
            novo := novo + 'J'
          else
            novo := novo + 'G';

        'P': // Phelipe = Felipe
           if aux[i+1] = 'H' then
             novo := novo + 'F'
           else
             novo := novo + 'P';

        'Q': // Keila = Queila
           if aux[i+1] = 'U' then
             novo := novo + 'K'
           else
             novo := novo + 'Q';

        'S':
           case aux[i+1] of
             'H': // SH = X
               novo := novo + 'X';

             'A','E','I','O','U':
               if (aux[i-1] in ['A','E','I','O','U']) then // CharInSet(aux[i-1], ['A','E','I','O','U']) then
                 novo := novo + 'Z' // S entre duas vogais = Z
               else
                 novo := novo + 'S';
           end;

        'W': // Walter = Valter
           novo := novo + 'V';

        'Z': // no final do nome tem som de S -> Luiz = Luis
           if (i = Length(aux)) or (aux[i+1] = ' ') then
             novo := novo + 'S'
           else
             novo := novo + 'Z';
      end;
    end;

    Result := novo + DELIMITER;

  except
    Result := EmptyStr;
  end;

end;

end.
