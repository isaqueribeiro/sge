unit ChkDgVer;

{*******************************************************}
{                                                       }
{       Cálculo do Digito Verificador                   }
{                                                       }
{       CNPJ, CPF e Todas Inscrições Estaduais          }
{                                                       }
{ Autor: Nelson Campos Filho                            }
{                                                       }
{ EMail:  ncampos@sef.mg.gov.br                         }
{                                                       }
{ Criação: 10 março 2000                                }
{                                                       }
{ Versão:  1.26                                         }
{                                                       }
{ Copyright (c) 2000, 2001  Nelson Campos Filho         }
{                                                       }
{ Estas funções podem ser utilizadas para qualquer      }
{ propósito, incluindo aplicações comerciais,           }
{ e livre distribuição                                  }
{                                                       }
{ Qualquer erro encontrado ou alteração efetuada favor  }
{ comunicar o autor.                                    }
{                                                       }
{*******************************************************}

interface

Uses SysUtils;

Function CHKIEMG(const iemg : string):boolean;
Function CHKCGC(const cgc : string):boolean;
Function CHKCPF(const cpf : string):boolean;
Function ChkInscEstadual(const ie, uf : string) : Boolean;

implementation

const
  OrdZero =  Ord('0');

Function AllTrim(const S : string) : string;
  {-Return a string with leading and trailing white space removed}
var
  I, L: Integer;
begin
  L := Length(S);
  I := 1;
  while (I <= L) and (S[I] <= ' ') do Inc(I);
  if I > L then Result := '' else
  begin
    while S[L] <= ' ' do Dec(L);
    Result := Copy(S, I, L - I + 1);
  end;
end; { AllTrim }

Function Empty(const s: String) : Boolean;
var
  aux : string;
begin
  aux := alltrim(s);
  if Length(aux) = 0 then Result := true else Result := false;
end;

Function IsNumero(const s: string) : boolean;
var
  i : byte;
begin
  Result := false;
  for i := 1 to length(s) do
    if not (s[i] in ['0'..'9']) then exit;
  Result := true;
end; { IsNumero }

{ chInt - Converte um caracter numérico para o valor inteiro correspondente. }
function CharToInt( ch: Char ): ShortInt;
begin
  Result := Ord ( ch ) - OrdZero;
end;

{ intCh = Converte um valor inteiro (de 0 a 9) para o caracter numérico
  correspondente. }

function IntToChar ( int: ShortInt ): Char;
begin
  Result := Chr ( int + OrdZero);
end;

Function CHKIEMG(const iemg : string):boolean;
var
  npos,i : byte;
  ptotal, psoma : Integer;
  dig1, dig2 : string[1];
  ie, insc : string;
  nresto : SmallInt;
begin
  //
  Result := true;
  ie := alltrim(iemg);
  if (empty(ie))  then exit;
  if copy(ie,1,2) = 'PR' then exit;
  if copy(ie,1,5) = 'ISENT' then exit;

  Result := false;
  If (Trim(iemg)='.') Then Exit;
  if (length(ie) <> 13) then Exit;
  if not IsNumero(ie) then Exit;

  dig1 := copy(ie,12,1);
  dig2 := copy(ie,13,1);
  insc := copy(ie,1,3) + '0' + copy(ie,4,8);
  //  CALCULA DIGITO 1
  npos := 12;
  i := 1;
  ptotal := 0;
  while npos > 0 do
  begin
    inc(i);
    psoma := CharToInt(insc[npos]) * i;
    IF psoma >= 10 then psoma := psoma - 9;
    inc(ptotal,psoma);
    IF i = 2 then i := 0;
    dec(npos);
  end;
  nResto := ptotal mod 10;
  if NResto = 0 then  nResto := 10;
  nResto := 10 - nResto;
  if nResto <> CharToInt(dig1[1]) then exit;

  // CALCULA DIGITO 2
  npos := 12;
  i := 1;
  ptotal := 0;
  while npos > 0 do
  begin
    inc(i);
    if i = 12 then i := 2;
    inc(ptotal, CharToInt(ie[npos]) * i);
    dec(npos);
  end;
  nResto := ptotal mod 11;
  if (nResto = 0) or (nResto = 1) then nResto := 11;
  nResto := 11 - nResto;
  if nResto <> CharToInt(dig2[1]) then exit;
  Result := true;
end; // ChkMG

Function CHKCGC(const cgc : string):boolean;
var
  nro : array[1..14] of byte;
  i : byte;
  cal,cal1 : Integer;
  dig : string;
begin
  // 99.999.999/9999-99
  Result := false;
  if (empty(cgc)) or (length(cgc) <> 14) then exit;
  if not IsNumero(cgc) then exit;

  for i := 1 to 12 do nro[i] := CharToInt(cgc[i]);
  cal := 0;
  for i := 1 to 04 do inc(cal,nro[i] * (6-i));
  for i := 5 to 12 do inc(cal,nro[i] * (14-i));
  nro[13] := 11 - (cal mod 11);
  if nro[13] >= 10 then  nro[13] := 0;

  cal1 := 0;
  for i := 1 to 05 do inc(cal1, nro[i] * (7-i));
  for i := 6 to 13 do inc(cal1, nro[i] * (15-i));
  nro[14] := 11-(cal1 mod 11);
  if nro[14] >= 10 then nro[14] := 0;
  dig := IntToChar(nro[13]) + IntToChar(nro[14]);
  if dig <> copy(cgc,13,2) then exit;
  Result := true;
end; // ChkCGC

Function CHKCPF(const cpf : string):boolean;
var
  b, i, soma : Integer;
  dig : SmallInt;
begin
  Result := false;
  //
  If (Trim(cpf)='.') Then
     Exit;
  //
  if (empty(cpf)) or (length(cpf) <> 11) then exit;
  if not IsNumero(cpf) then exit;
  b := 11;
  soma := 0;
  for i := 1 to 10 do
  begin
    inc(soma,CharToInt(cpf[i]) * b);
    dec(b);
  end;
  dig := 11 - (soma mod 11);
  if dig >= 10 then dig := 0;
  Result := (IntToChar(dig) = cpf[11]);
end; // ChkCPF


// ----------------------------------- Inscrições Estaduais

Function ChkIEAC(const ie : string) : Boolean;  // 99.999.999/999-99
var
  b, i, soma : Integer;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 13) then exit;
  if not IsNumero(ie) then exit;
  b := 4;
  soma := 0;
  for i := 1 to 11 do
  begin
    inc(soma,CharToInt(ie[i]) * b);
    dec(b);
    if b = 1 then b := 9;
  end;
  dig := 11 - (soma mod 11);
  if (dig >= 10) then dig := 0;
  Result := (IntToChar(dig) = ie[12]);
  if not Result then exit;

  b := 5;
  soma := 0;
  for i := 1 to 12 do
  begin
    inc(soma,CharToInt(ie[i]) * b);
    dec(b);
    if b = 1 then b := 9;
  end;
  dig := 11 - (soma mod 11);
  if (dig >= 10) then dig := 0;
  Result := (IntToChar(dig) = ie[13]);
end; // ChkIEAC

Function ChkIEAL(const ie : string) : Boolean; // 24XNNNNND
var
  b, i, soma : Integer;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 9) then exit;
  if not IsNumero(ie) then exit;
  if copy(ie,1,2) <> '24' then exit;
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, CharToInt(ie[i]) * b);
    dec(b);
  end;
  soma := soma * 10;
  dig := soma - trunc(soma / 11) * 11;
  if dig = 10 then dig := 0;
  Result := (IntToChar(dig) = ie[09]);
end; // ChkIEAL

Function ChkIEAM(const ie : string) : Boolean;  // 99.999.999-9
var
  b, i, soma : Integer;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 9) then exit;
  if not IsNumero(ie) then exit;
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, CharToInt(ie[i]) * b);
    dec(b);
  end;
  if soma < 11 then dig := 11 - soma else
  begin
    i := (soma mod 11);
    if i <= 1 then dig := 0 else dig := 11 - i;
  end;
  Result := (IntToChar(dig) = ie[09]);
end; // ChkIEAM

Function ChkIEAP(const ie : string) : Boolean; // 999999999
var
  p,d, b, i, soma : Integer;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 9) then exit;
  if not IsNumero(ie) then exit;
  p := 0;
  d := 0;
  i := StrToInt(copy(ie,1,8));
  if (i >= 03000001) and (i <= 03017000) then
  begin
    p := 5;
    d := 0;
  end else
  if (i >= 03017001) and (i <= 03019022) then
  begin
    p := 9;
    d := 1;
  end;
  b := 9;
  soma := p;
  for i := 1 to 08 do
  begin
    inc(soma, CharToInt(ie[i]) * b);
    dec(b);
  end;
  dig := 11 - (soma mod 11);
  if dig = 10 then dig := 0 else
  if dig = 11 then dig := d;
  Result := (IntToChar(dig) = ie[09]);
end; // ChkIEAP

Function ChkIEBA(const ie : string) : Boolean; // 999999-99
var
  b, i, soma : Integer;
  nro : array[1..8] of byte;
  NumMod : word;
  dig : SmallInt;
  die : string;
begin
  Result := false;
  if (length(ie) <> 8) then exit;
  die := copy(ie,1,8);
  if not IsNumero(die) then exit;
  for i := 1 to 8 do nro[i] := CharToInt(die[i]);
  if nro[1] in [0, 1, 2, 3, 4, 5, 8] then NumMod := 10 else NumMod := 11;
  // calculo segundo
  b := 7;
  soma := 0;
  for i := 1 to 06 do
  begin
    inc(soma, (nro[i] * b));
    dec(b);
  end;
  i := soma mod NumMod;
  if NumMod = 10 then
  begin
    if i = 0 then dig := 0 else dig := NumMod - i;
  end else
  begin
    if i <= 1 then dig := 0 else dig := NumMod - i;
  end;
  Result := (dig = nro[8]);
  if not Result then exit;
  // calculo segundo
  b := 8;
  soma := 0;
  for i := 1 to 06 do
  begin
    inc(soma, (nro[i] * b));
    dec(b);
  end;
  inc(soma, (nro[8] * 2));
  i := soma mod NumMod;
  if NumMod = 10 then
  begin
    if i = 0 then dig := 0 else dig := NumMod - i;
  end else
  begin
    if i <= 1 then dig := 0 else dig := NumMod - i;
  end;
  Result := (dig = nro[7]);
end; // ChkIEBA

Function ChkIECE(const ie : string) : Boolean; // 999999999
var
  b, i, soma : Integer;
  nro : array[1..9] of byte;
  dig : SmallInt;
  die : string;
begin
  Result := false;
  if (length(ie) > 9) then exit;
  if not IsNumero(ie) then exit;
  die := ie;
  if length(ie) < 9 then
  begin
    repeat
      die := '0' + die;
    until length(die) = 9;
  end;
  for i := 1 to 9 do nro[i] := CharToInt(die[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, (nro[i] * b));
    dec(b);
  end;
  dig := 11 - (soma mod 11);
  if dig >= 10 then dig := 0;
  Result := (dig = nro[9]);
end; // ChkIECE

Function ChkIEDF(const ie : string) : Boolean;  // 999.99999.999.99
var
  b, i, soma : Integer;
  nro : array[1..13] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 13) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 13 do nro[i] := CharToInt(ie[i]);
  b := 4;
  soma := 0;
  for i := 1 to 11 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 1 then b := 9;
  end;
  dig := 11 - (soma mod 11);
  if dig >= 10 then dig := 0;
  Result := (dig = nro[12]);
  if not Result then exit;

  b := 5;
  soma := 0;
  for i := 1 to 12 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 1 then b := 9;
  end;
  dig := 11 - (soma mod 11);
  if dig >= 10 then dig := 0;
  Result := (dig = nro[13]);
end; // ChkIEDF

Function ChkIEES(const ie : string) : Boolean;  // 99999999-9
var
  b, i, soma : Integer;
  nro : array[1..9] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 9) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 9 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := soma mod 11;
  if i < 2 then dig := 0 else dig := 11 - i;
  Result := (dig = nro[9]);
end; // ChkIEES

Function ChkIEGO(const ie : string) : Boolean; // 99.999.999.9
var
  n, b, i, soma : Integer;
  nro : array[1..9] of byte;
  dig : SmallInt;
  s : string;
begin
  Result := false;
  if (length(ie) <> 9) then exit;
  if not IsNumero(ie) then exit;
  s := copy(ie,1,2);
  if (s = '10') or (s = '11') or (s = '15') then
  begin
    for i := 1 to 9 do nro[i] := CharToInt(ie[i]);
    n := trunc(StrToFloat(ie) / 10);
    if n = 11094402 then
    begin
      if (nro[9] = 0) or (nro[9] = 1) then
      begin
        Result := true;
        exit;
      end;
    end;

    b := 9;
    soma := 0;
    for i := 1 to 08 do
    begin
      inc(soma, nro[i] * b);
      dec(b);
    end;
    i := (soma mod 11);
    if i = 0 then dig := 0 else
    if i = 1 then
    begin
      if (n >= 10103105) and (n <= 10119997) then
        dig := 1
      else
        dig := 0;
    end else
    begin
      dig := 11 - i;
    end;
    Result := (dig = nro[9]);
  end;
end; // ChkIEGO

Function ChkIEMA(const ie : string) : Boolean; // 999999999
var
  b, i, soma : Integer;
  nro : array[1..9] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 9) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 9 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[9]);
end; // ChkIEMA

Function ChkIEMT(const ie : string) : Boolean;  // 9999999999-9
var
  b, i, soma : Integer;
  nro : array[1..11] of byte;
  dig : SmallInt;
  die : string;
begin
  Result := false;
  if (length(ie) < 9) then exit;
  die := ie;
  if length(die) < 11 then
  begin
    repeat
      die := '0' + die;
    until length(die) = 11;
  end;
  if not IsNumero(die) then exit;
  for i := 1 to 11 do nro[i] := CharToInt(die[i]);
  b := 3;
  soma := 0;
  for i := 1 to 10 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 1 then b := 9;
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[11]);
end; // ChkIEMT

Function ChkIEMS(const ie : string) : Boolean; // 999999999
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  if copy(ie,1,2) <> '28' then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[09]);
end; // ChkIEMS

Function ChkIEPA(const ie : string) : Boolean; // 99.999999-9
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  if copy(ie,1,2) <> '15' then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[09]);
end; // ChkIEPA

Function ChkIEPB(const ie : string) : Boolean; // 99999999-9
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[09]);
end; // ChkIEPB

Function ChkIEPR(const ie : string) : Boolean; //  99999999-99
var
  b, i, soma : Integer;
  nro : array[1..10] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 10) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 10 do nro[i] := CharToInt(ie[i]);
  b := 3;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 1 then b := 7;
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[09]);
  if not result then exit;

  b := 4;
  soma := 0;
  for i := 1 to 09 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 1 then b := 7;
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[10]);
end; // ChkIEPR

Function ChkIEPE(const ie : string) : Boolean; // 99.9.999.9999999-9
var
  b, i, soma : Integer;
  nro : array[1..14] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 14) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 14 do nro[i] := CharToInt(ie[i]);
  b := 5;
  soma := 0;
  for i := 1 to 13 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 0 then b := 9;
  end;
  dig := 11 - (soma mod 11);
  if dig > 9 then dig := dig - 10;
  Result := (dig = nro[14]);
end; // ChkIEPE

Function ChkIEPI(const ie : string) : Boolean; // 999999999
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[09]);
end; // ChkIEPI

Function ChkIERJ(const ie : string) : Boolean; // 99.999.99-9
var
  b, i, soma : Integer;
  nro : array[1..08] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 08) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 08 do nro[i] := CharToInt(ie[i]);
  b := 2;
  soma := 0;
  for i := 1 to 07 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
    if b = 1 then b := 7;
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[08]);
end; // ChkIERJ

Function ChkIERN(const ie : string) : Boolean; // 99.999.999-9
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  soma := soma * 10;
  dig := (soma mod 11);
  if (dig = 10) then dig := 0;
  Result := (dig = nro[09]);
end; // ChkIERN

Function ChkIERS(const ie : string) : Boolean;  // 999.999999-9
var
  b, i, soma : Integer;
  nro : array[1..10] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 10) then exit;
  if not IsNumero(ie) then exit;
  i := StrToInt(copy(ie,1,3));
  if (i >= 1) and (i <= 467) then
  begin
    for i := 1 to 10 do nro[i] := CharToInt(ie[i]);
    b := 2;
    soma := 0;
    for i := 1 to 09 do
    begin
      inc(soma, nro[i] * b);
      dec(b);
      if b = 1 then b := 9;
    end;
    dig := 11 - (soma mod 11);
    if (dig >= 10) then dig := 0;
    Result := (dig = nro[10]);
  end;
end; // ChkIERS

// Rondônia - versão antiga
Function ChkIERO(const ie : string) : Boolean; // 999.99999-9
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 6;
  soma := 0;
  for i := 4 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b)
  end;
  dig := 11 - (soma mod 11);
  if (dig >= 10) then dig := dig - 10;
  Result := (dig = nro[09]);
end; // ChkIERO

// Rondônia - versão nova
Function ValidaInscRO(SIE :string): boolean;
var i,x,y,z,j : integer;
   s : string;
begin
   i := 1;    y := 6;
   x := 0;    z := 0;
   j := 0;
   for j := 1 to length(trim(sie))do
       if sie[j] in
['0','1','2','3','4','5','6','7'
,'8','9','0'] then
          s := s + sie[j];
   if not length(s)  <> 14 then begin
      for i := 1 to (14 - length(Trim(s))) do
              s := '0' + trim(s)
   end;
   for i := 1 to (length(s) - 1) do begin
       x := strtoint(s[i])* y;
       z := z + x;
       if y  > 2 then
          dec(y)
       else y := 9;
   end;
   x := z mod 11;
   y := 11 - x;
   if inttostr(y) = s[14] then
      Result := true
   else Result := false;
end;


Function ChkIERR(const ie : string) : Boolean; // 99.999999-9
var
  i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  if copy(ie,1,2) <> '24' then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * i);
  end;
  dig := (soma mod 09);
  Result := (dig = nro[09]);
end; // ChkIERR

Function ChkIESC(const ie : string) : Boolean;  // 999.999.999
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  i := (soma mod 11);
  if (i <= 1) then dig := 0 else dig := 11 - i;
  Result := (dig = nro[09]);
end; // ChkIESC

Function ChkIESP(const ie : string) : Boolean;
var
  i, soma : Integer;
  nro : array[1..12] of byte;
  dig : SmallInt;
  s : string;
begin
  Result := false;
  if UpperCase(copy(ie,1,1)) = 'P' then
  begin
    s := copy(ie,2,9);
    if not IsNumero(s) then exit;
    for i := 1 to 8 do nro[i] := CharToInt(s[i]);
    soma := (nro[1] * 1) + (nro[2] * 3) + (nro[3] * 4) + (nro[4] * 5) +
            (nro[5] * 6) + (nro[6] * 7) + (nro[7] * 8) + (nro[8] * 10);
    dig := (soma mod 11);
    if (dig >= 10) then dig := 0;
    Result := (dig = nro[09]);
    if not Result then exit;
  end else
  begin
    if (length(ie) < 12) then exit;
    if not IsNumero(ie) then exit;
    for i := 1 to 12 do nro[i] := CharToInt(ie[i]);
    soma := (nro[1] * 1) + (nro[2] * 3) + (nro[3] * 4) + (nro[4] * 5) +
            (nro[5] * 6) + (nro[6] * 7) + (nro[7] * 8) + (nro[8] * 10);
    dig := (soma mod 11);
    if (dig >= 10) then dig := 0;
    Result := (dig = nro[09]);
    if not Result then exit;
    soma := (nro[1] * 3) + (nro[2] * 2) + (nro[3] * 10) + (nro[4] * 9) +
            (nro[5] * 8) + (nro[6] * 7) + (nro[7] * 6) + (nro[8] * 5) +
            (nro[9] * 4) + (nro[10] * 3) + (nro[11] * 2);

    dig := (soma mod 11);
    if (dig >= 10) then dig := 0;
    Result := (dig = nro[12]);
  end;
end; // ChkIESP

Function ChkIESE(const ie : string) : Boolean; // 99999999-9
var
  b, i, soma : Integer;
  nro : array[1..09] of byte;
  dig : SmallInt;
begin
  Result := false;
  if (length(ie) <> 09) then exit;
  if not IsNumero(ie) then exit;
  for i := 1 to 09 do nro[i] := CharToInt(ie[i]);
  b := 9;
  soma := 0;
  for i := 1 to 08 do
  begin
    inc(soma, nro[i] * b);
    dec(b);
  end;
  dig := 11 - (soma mod 11);
  if (dig >= 10) then dig := 0;
  Result := (dig = nro[09]);
end; // ChkIESE

Function ChkIETO(const ie : string) : Boolean; // 99.99.999999-9
var
  b, i, soma : Integer;
  nro : array[1..11] of byte;
  dig : SmallInt;
  s : string;
begin
  Result := false;
  if (length(ie) <> 11) then exit;
  if not IsNumero(ie) then exit;
  s := copy(ie,3,2);
  if (s = '01') or (s = '02') or (s = '03') or (s = '99')  then
  begin
    for i := 1 to 11 do nro[i] := CharToInt(ie[i]);
    b := 9;
    soma := 0;
    for i := 1 to 10 do
    begin
      if (i <> 3) and (i <> 4) then
      begin
        inc(soma, nro[i] * b);
        dec(b);
      end;
    end;
    i := (soma mod 11);
    if (i <= 1) then dig := 0 else dig := 11 - i;
    Result := (dig = nro[11]);
  end;
end; // ChkIETO

// --------------------------------------------------------------

Function ChkInscEstadual(const ie, uf : string) : Boolean;
var
  duf, die : string;
begin
  //
  Result:=False;
  If (Trim(ie) = '.') Then Exit;
  //
  duf := UpperCase(uf);
  die := UpperCase(alltrim(ie));

  if (copy(die,1,5) = 'ISENT') or (die = '') then
  begin
    Result := true;
    exit;
  end;
  
  if duf = 'AC'  then Result := ChkIEAC(die) else
  if duf = 'AL'  then Result := ChkIEAL(die) else
  if duf = 'AP'  then Result := ChkIEAP(die) else
  if duf = 'AM'  then Result := ChkIEAM(die) else
  if duf = 'BA'  then Result := ChkIEBA(die) else
  if duf = 'CE'  then Result := ChkIECE(die) else
  if duf = 'DF'  then Result := ChkIEDF(die) else
  if duf = 'ES'  then Result := ChkIEES(die) else
  if duf = 'GO'  then Result := ChkIEGO(die) else
  if duf = 'MA'  then Result := ChkIEMA(die) else
  if duf = 'MG'  then Result := ChkIEMG(die) else
  if duf = 'MT'  then Result := ChkIEMT(die) else
  if duf = 'MS'  then Result := ChkIEMS(die) else
  if duf = 'PA'  then Result := ChkIEPA(die) else
  if duf = 'PB'  then Result := ChkIEPB(die) else
  if duf = 'PR'  then Result := ChkIEPR(die) else
  if duf = 'PE'  then Result := ChkIEPE(die) else
  if duf = 'PI'  then Result := ChkIEPI(die) else
  if duf = 'RJ'  then Result := ChkIERJ(die) else
  if duf = 'RN'  then Result := ChkIERN(die) else
  if duf = 'RS'  then Result := ChkIERS(die) else
  if duf = 'RO'  then Result := (ChkIERO(die) Or ValidaInscRO(die)) else
  if duf = 'RR'  then Result := ChkIERR(die) else
  if duf = 'SC'  then Result := ChkIESC(die) else
  if duf = 'SP'  then Result := ChkIESP(die) else
  if duf = 'SE'  then Result := ChkIESE(die) else
  if duf = 'TO'  then Result := ChkIETO(die) else Result := false;
end; // ChkInscEstadual

end.

