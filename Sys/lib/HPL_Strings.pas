unit HPL_Strings;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, DateUtils;

type
  THopeString = class
  public
    function StrIsInt(const S: string): Boolean;
    function StrIsDate(const S: string): Boolean;
    function StrToQuotedDate(const Format, Date: string): string;
    function StrRemoveAccent(C: Char): Char;
    function StrRemoveAllAccents(const S: string): string;
    function StrFillLeft(Value: Char; const S: string; Count: Smallint): string;
    function StrFillRight(Value: Char; const S: string; Count: Smallint): string;
    function StrIsCPF(const Num: string): Boolean;
    function StrIsCNPJ(const Num: string): Boolean;
    function StrFormatarCnpj(sCnpj: String): String;
    function StrFormatarCpf(sCpf: String): String;
    function StrGetAge(const AStartDate, AEndDate: TDate): string;
    function StrGetAgeYearMonthDay(const StartDate, EndDate: TDate): string;    
    function StrEncode(const S: string): string; virtual;
    function StrDecode(const S: string): string; virtual;
    function StrCentralizar(const S : String; Tam : Smallint) : String;
  end;

implementation

{ THopeString }

function THopeString.StrDecode(const S: string): string;
var
  I: Integer;
  Senha: string[255];
  Caracter: array[0..255] of Byte absolute Senha;
begin
  Senha := S;
  for I := 1 to Length(Senha) do Senha[I] := AnsiChar(23 xor Ord(Caracter[I]));
  Result := Senha;
end;

function THopeString.StrEncode(const S: string): string;
var
  I: Integer;
  Senha: string[255];
  Caracter: array[0..255] of Byte absolute Senha;
begin
  Senha := S;
  for I := 1 to Ord(Senha[0]) do Caracter[I] := 23 xor Caracter[I];
  Result := Senha;
end;

function THopeString.StrCentralizar(const S : String; Tam : Smallint) : String;
var
  i,
  t   : Smallint;
  Str : String;
begin
  i := Tam - Length(Trim(Copy(S, 1, Tam)));
  t := 0;
  if (i > 0) then
    t := i div 2;

  Result := StringOfChar(' ', t) + Trim(Copy(S, 1, Tam)) + StringOfChar(' ', i - t);
end;

function THopeString.StrFillLeft(Value: Char; const S: string;
  Count: Smallint): string;
begin
  Result := Trim(S);
  if (Length(Result) < Count) then
  repeat
    Result := Value + Result;
  until Length(Result) >= Count;
end;

function THopeString.StrFillRight(Value: Char; const S: string;
  Count: Smallint): string;
begin
  Result := Trim(S);
  if (Length(Result) < Count) then
  repeat
    Result := Result + Value;
  until Length(Result) >= Count;
end;

function THopeString.StrGetAge(const AStartDate, AEndDate: TDate): string;
var
  Anos: Integer;
  Meses: Integer;
begin
  Anos := MonthsBetween(AStartDate, AEndDate) div 12;
  Meses := MonthsBetween(AStartDate, AEndDate) mod 12;
  if (Anos > 1)
    then Result := IntToStr(Anos) + ' Anos'
    else Result := IntToStr(Anos) + ' Ano';
  if (Meses > 0) then
    begin
    if (Meses > 1)
      then Result := Result + ' e ' + IntToStr(Meses) + ' Meses'
      else Result := Result + ' e ' + IntToStr(Meses) + ' Mês';
    end;
end;

function THopeString.StrGetAgeYearMonthDay(const StartDate, EndDate: TDate): string;
var
  Anos: Smallint;
  Meses: Smallint;
  Dias: Smallint;
  Data: TDate;
begin
  Anos := MonthsBetween(StartDate, EndDate) div 12;
  Meses := MonthsBetween(StartDate, EndDate) mod 12;
  if (DayOf(EndDate) >= DayOf(StartDate))
    then Dias := DayOf(EndDate) - DayOf(StartDate)
    else begin
         Data := StartDate;
         while not IsValidDate(YearOf(EndDate), MonthOf(IncMonth(EndDate, -1)), DayOf(Data)) do
           begin
           Data := IncDay(Data, -1);
           end;
         Dias := DaysBetween(EncodeDate(YearOf(EndDate), MonthOf(IncMonth(EndDate, -1)), DayOf(Data)), EndDate);
         end;
  Result := FormatFloat('000', Anos) + FormatFloat('00', Meses) + FormatFloat('00', Dias);
end;

function THopeString.StrIsCNPJ(const Num: string): Boolean;
var
  Dig: array [1..14] of Byte;
  I, Resto: Byte;
  Dv1, Dv2: Byte;
  Total1, Total2: Integer;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  if ( StrToIntDef(Copy(Valor, 1, 5), 0) = 0 ) then
  begin
    Result := False;
    Exit;
  end;

  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;

  Result := False;

  if Length(Valor) = 14 then
  begin
    for I := 1 to 14 do
      try
        Dig[I] := StrToInt (Valor[I]);
      except
        Dig[i] := 0;
      end;

    Total1 := Dig[1]  * 5 + Dig[2]  * 4 + Dig[3]  * 3 +
              Dig[4]  * 2 + Dig[5]  * 9 + Dig[6]  * 8 +
              Dig[7]  * 7 + Dig[8]  * 6 + Dig[9]  * 5 +
              Dig[10] * 4 + Dig[11] * 3 + Dig[12] * 2 ;

    Resto := Total1 mod 11;

    if Resto > 1 then
      Dv1 := 11 - Resto
    else
      Dv1 := 0;

    Total2 := Dig[1]  * 6 + Dig[2]  * 5 + Dig[3]  * 4 +
              Dig[4]  * 3 + Dig[5]  * 2 + Dig[6]  * 9 +
              Dig[7]  * 8 + Dig[8]  * 7 + Dig[9]  * 6 +
              Dig[10] * 5 + Dig[11] * 4 + Dig[12] * 3 + Dv1 * 2 ;

    Resto := Total2 mod 11;

    if Resto > 1 then
      Dv2 := 11 - Resto
    else
      Dv2 := 0;

    if (Dv1 = Dig[13]) and (Dv2 = Dig[14]) then
      Result := True;
  end;
  
end;

function THopeString.StrIsCPF(const Num: string): Boolean;
var
  I, Numero, Resto: Byte ;
  Dv1, Dv2: Byte ;
  Total, Soma: Integer ;
  Valor: string;
begin
  if ( StrToIntDef(Copy(Num, 1, 2), -1) = -1 ) then
  begin
    Result := False;
    Exit;
  end;

  Valor := Num;
  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then Delete(Valor, I, 1);
  try
    StrToInt(Copy(Valor, 1, 5));
  except
    Result := True;
    Exit;
  end;
  Result := False;
  if Length(Valor) = 11 then
  begin
    Total := 0 ;
    Soma := 0 ;
    for I := 1 to 9 do
    begin
      try
        Numero := StrToInt (Valor[I]);
      except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - I)) ;
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1
      then Dv1 := 11 - Resto
      else Dv1 := 0;
    Total := Total + Soma + 2 * Dv1;
    Resto := Total mod 11;
    if Resto > 1
      then Dv2 := 11 - Resto
      else Dv2 := 0;
    if (IntToStr (Dv1) = Valor[10]) and (IntToStr (Dv2) = Valor[11])
      then Result := True;
  end;
end;

function THopeString.StrFormatarCnpj(sCnpj: String): String;
var
  S : String;
begin
  S := Trim(sCnpj);

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '.' ) then
    S := Copy(S, 1, 6) + '.' + Copy(S, 7, Length(S));

  if ( Copy(S, 11, 1) <> '/' ) then
    S := Copy(S, 1, 10) + '/' + Copy(S, 11, Length(S));

  if ( Copy(S, 16, 1) <> '-' ) then
    S := Copy(S, 1, 15) + '-' + Copy(S, 16, Length(S));

  Result := S;
end;

function THopeString.StrFormatarCpf(sCpf: String): String;
var
  S : String;
begin
  S := Trim(sCpf); // 000.000.000-00

  if ( Copy(S, 4, 1) <> '.' ) then
    S := Copy(S, 1, 3) + '.' + Copy(S, 4, Length(S));

  if ( Copy(S, 8, 1) <> '.' ) then
    S := Copy(S, 1, 7) + '.' + Copy(S, 8, Length(S));

  if ( Copy(S, 12, 1) <> '-' ) then
    S := Copy(S, 1, 11) + '-' + Copy(S, 12, Length(S));

  Result := S;
end;

function THopeString.StrIsDate(const S: string): Boolean;
var
  Dt: TDatetime;
begin
  Result := TryStrToDate(S, Dt);
end;

function THopeString.StrIsInt(const S: string): Boolean;
var
  I: Int64;
begin
  Result := TryStrToInt64(S, I);
end;

function THopeString.StrRemoveAccent(C: Char): Char;
const
  BadMaiSChar = ['"', '!', '@', '#', '$', '%', '¨', '&', '*', '(', ')', '-', '+', '=',
                 '|', '\', '<', ',', '>', '.', ':', ';', '?', '/', '´', '`', '{', '[',
                 '^', '^', '}', ']', '§'];
  BadMaiAChar = ['Á', 'À', 'Ä', 'Ã', 'Â'];
  BadMinAChar = ['á', 'à', 'ä', 'ã', 'â'];
  BadMaiEChar = ['É', 'È', 'Ë', 'Ê'];
  BadMinEChar = ['é', 'è', 'ë', 'ê'];
  BadMaiIChar = ['Í', 'Ì', 'Ï', 'Î'];
  BadMinIChar = ['í', 'ì', 'ï', 'î'];
  BadMaiOChar = ['Ó', 'Ò', 'Ö', 'Õ', 'Ô'];
  BadMinOChar = ['ó', 'ò', 'ö', 'õ', 'ô'];
  BadMaiUChar = ['Ú', 'Ù', 'Ü', 'Û'];
  BadMinUChar = ['ú', 'ù', 'ü', 'û'];
  BadMaiCChar = ['Ç'];
  BadMinCChar = ['ç'];
  BadNumOChar = ['º'];
  BadNumAChar = ['ª'];
  BadChar = ['´', '"', '`', '~', '^','¨'];
var
  U: Char;
begin
  U := C;
  if (U in BadMaiSChar) then U := ' ';
  if (U in BadMaiAChar) then U := 'A';
  if (U in BadMinAChar) then U := 'a';
  if (U in BadMaiEChar) then U := 'E';
  if (U in BadMinEChar) then U := 'e';
  if (U in BadMaiIChar) then U := 'I';
  if (U in BadMinIChar) then U := 'i';
  if (U in BadMaiOChar) then U := 'O';
  if (U in BadMinOChar) then U := 'o';
  if (U in BadMaiUChar) then U := 'U';
  if (U in BadMinUChar) then U := 'u';
  if (U in BadMaiCChar) then U := 'C';
  if (U in BadMinCChar) then U := 'c';
  if (U in BadChar) then U := #0;
  Result := U;
end;

function THopeString.StrRemoveAllAccents(const S: string): string;
var
  I: Integer;
begin
  Result := S;
  for I := 1 to Length(Result) do Result[I] := StrRemoveAccent(Result[I]);
end;

function THopeString.StrToQuotedDate(const Format, Date: string): string;
begin
  try
    Result := QuotedStr(FormatDateTime(Format, StrToDate(Date)));
  except
    Result := '';
  end;
end;

end.

 