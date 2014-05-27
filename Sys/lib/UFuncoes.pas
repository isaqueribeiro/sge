unit UFuncoes;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ExtCtrls, ShellApi, Printers,
  Graphics, IniFiles, PSApi, Winsock, WinSvc, WinInet;

  function GetExeVersion(const FileName : TFileName) : String; overload;
  function GetExeVersion : String; overload;
  function GetVersion : String;
  function GetCopyright : String;
  function GetInternalName : String;
  function GetProductName : String;
  function GetFileDescription : String;
  function GetCompanyName : String;
  function GetContacts : String;
  function GetConectedInternet : Boolean;
  function GetEmailValido(email : String; bShowMsg : Boolean) : Boolean;

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
    // Há conexão com a Internet através de um roteador
    Result := True
  else
  if ( (Flags and INTERNET_CONNECTION_PROXY) <> 0 ) then
    // Há conexão com a Internet através de um proxy
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
  vet_email : Array [0..49] of String; // 50 posições, capacidade do Edit
  msg       : String;
const
  msg1  = 'Caractere(s) inválido(s) no início do e-mail.';
  msg2  = 'Símbolo @ não foi encontrado.';
  msg3  = 'Excesso do símbolo @.';
  msg4  = 'Caractere(s) inválido(s) antes do símbolo @.';
  msg5  = 'Caractere(s) inválido(s) depois do símbolo @.';
  msg6  = 'Agrupamento de caractere(s) inválido(s) a esqueda do @.';
  msg7  = 'Não existe ponto(s) digitado(s).';
  msg8  = 'Ponto encontrado no final do e-mail.';
  msg9  = 'Ausência de caractere(s) após o último ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada após o @.';
  msg12 = 'Caractere(s) inválido(s) antes do ponto.';
  msg13 = 'Caractere(s) inválido(s) depois do ponto.';
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

  //Verificando se tem o símbolo @ e quantos tem

  if qtd_arroba <> 1 then
  begin
    Result := False;
    msg    := msg3 + #13 + 'Encontrado(s): ' + IntToStr(qtd_arroba) + '.';
  end
  else
  begin
    //Verificando o que vem antes e depois do símbolo @

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
         //Antes do ponto há um símbolo desconhecido do vetor válido 
         Result:= False; 
         msg:= msg12; 
       end 
      else if ponto2 = 36 then 
       begin 
         //Depois do ponto há um símbolo desconhecido do vetor válido 
         Result:= False; 
         msg:= msg13; 
       end 
    end; 

  //Verificação final 
  if ( not Result ) and ( bShowMsg ) then 
   begin 
     msg:= msg +#10+ 'Formato de E-mail não aceitável!!'; 
     //MessageDlg(msg,mtWarning,[mbRetry],0);
   end;

end;

end;

end.
