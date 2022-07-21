unit Service.Utils;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  Soap.EncdDecd,
  Vcl.ExtCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TDomainMail = (domainMainCom, domainMainComBr);
  TServicesUtils = class
    private
    public
      class procedure ResourceImage( aResourceName : String; aImage : TImage); overload;
      class procedure ResourceImage( aResourceName : String; aButton : TSpeedButton); overload;
      class procedure ExtractResource(aResourceName : String; aPath, aFileName : String);
      class procedure Split(pDelimiter : Char; pStr: String; pListOfStrings : TStrings);

      class function PngToBmp(Png : TPngImage) : TBitmap; overload;
      class function PngToBmp(aFileNamePNG : TFileName) : TBitmap; overload;
      class function Base64FromBitmap(aBitmap : TBitmap) : String;
      class function BitmapFromBase64(const aBase64 : String) : TBitmap;
      class function MonthName(aData : TDateTime) : String;
      class function StrToCurrency(Value : String) : Currency;
      class function StrOnlyNumbers(const Str : String) : String;
      class function StrIsCNPJ(const Num : string): Boolean;
      class function StrIsCPF(const Num: string): Boolean;
      class function StrFormatarCnpj(sCnpj: String): String;
      class function StrFormatarCpf(sCpf: String): String;
      class function StrFormatarCEP(Value: String): String;
      class function StrFormatarFone(sFone: String): String;
      class function StrFormatarNome(aNome : String): String;
      class function StrDateFormatBr(aData : String) : TDateTime;
      class function StrRemoveAccent(C : Char): Char;
      class function StrRemoveAccents(Str : String) : String;
      class function StrRemoveAllAccents(const S : String): String;
      class function StrSanitize(Value : String) : String;
      class function StrMetafonema(Value : String) : String;
      class function EmailValido(aEmail : String;
        const aDominio : TDomainMail = TDomainMail.domainMainComBr): Boolean;
  end;

implementation

uses
    System.Types
  , System.DateUtils
  , System.IOUtils
  , System.RegularExpressions
  , IdCoderMIME
  , IdHashMessageDigest;

{ TServicesUtils }

class function TServicesUtils.Base64FromBitmap(aBitmap: TBitmap): String;
var
  aRestorno : String;
  aInput  : TBytesStream;
  aOutput : TStringStream;
begin
  aRestorno := EmptyStr;
  try
    if Assigned(aBitmap) then
    begin
      aInput := TBytesStream.Create;
      aBitmap.SaveToStream(aInput);
      aInput.Position := 0;

      aOutput := TStringStream.Create('', TEncoding.ASCII);
      Soap.EncdDecd.EncodeStream(aInput, aOutput);

      aRestorno := aOutput.DataString;
    end;
  finally
    if Assigned(aInput) then
      aInput.DisposeOf;

    if Assigned(aOutput) then
      aOutput.DisposeOf;

    Result := aRestorno;
  end;
end;

class function TServicesUtils.BitmapFromBase64(const aBase64: String): TBitmap;
var
  aRestorno : TBitmap;
  aInput  : TStringStream;
  aOutput : TBytesStream;
begin
  aRestorno := nil;
  aInput    := TStringStream.Create(aBase64, TEncoding.ASCII);
  aOutput   := TBytesStream.Create;
  try
    if not aBase64.Trim.IsEmpty then
    begin
      Soap.EncdDecd.DecodeStream(aInput, aOutput);
      aOutput.Position := 0;

      aRestorno := TBitmap.Create;
      aRestorno.LoadFromStream(aOutput);
    end;
  finally
    if Assigned(aOutput) then
      aOutput.DisposeOf;

    if Assigned(aInput) then
      aInput.DisposeOf;

    Result := aRestorno;
  end;
end;

class function TServicesUtils.EmailValido(aEmail: String; const aDominio : TDomainMail): Boolean;
var
  aExpressao : TRegEx;
begin
  case aDominio of
    TDomainMail.domainMainCom   : Result := aExpressao.IsMatch(aEmail, '(^[^@]+@[^.]+.com$)');
    TDomainMail.domainMainComBr : Result := aExpressao.IsMatch(aEmail, '(^[^@]+@[^.]+.com$|^[^@]+@[^.]+.com.br$)');
  end;
end;

class function TServicesUtils.MonthName(aData: TDateTime): String;
var
  aRetorno : String;
begin
  aRetorno := EmptyStr;

  case MonthOf(aData) of
     1 : aRetorno := 'Janeiro';
     2 : aRetorno := 'Fevereiro';
     3 : aRetorno := 'Março';
     4 : aRetorno := 'Abril';
     5 : aRetorno := 'Maio';
     6 : aRetorno := 'Junho';
     7 : aRetorno := 'Julho';
     8 : aRetorno := 'Agosto';
     9 : aRetorno := 'Setembro';
    10 : aRetorno := 'Outubro';
    11 : aRetorno := 'Novembro';
    12 : aRetorno := 'Dezembro';
  end;

  Result := aRetorno;
end;

class function TServicesUtils.PngToBmp(aFileNamePNG: TFileName): TBitmap;
var
  aPng : TPngImage;
begin
  try
    aPng := TPngImage.Create;
    aPng.LoadFromFile(aFileNamePNG);

    Result := TBitmap.Create;
    Result.Assign(aPng);
  finally
    aPng.DisposeOf;
  end;
end;

class function TServicesUtils.PngToBmp(Png: TPngImage): TBitmap;
begin
  Result := TBitmap.Create;
  Result.Assign(Png);
end;

class procedure TServicesUtils.ResourceImage(aResourceName: String; aButton: TSpeedButton);
var
  Resource : TResourceStream;
  aPng : TPngImage;
begin
  Resource := TResourceStream.Create(HInstance, aResourceName, RT_RCDATA);
  try
    aPng := TPngImage.Create;
    aPng.LoadFromStream(Resource);
    aButton.Glyph.Assign( TServicesUtils.PngToBmp(aPng) );
  finally
    Resource.DisposeOf;
    aPng.DisposeOf;
  end;
end;

class procedure TServicesUtils.ExtractResource(aResourceName : String; aPath, aFileName : String);
var
  aResource : TResourceStream;
  aFile : String;
begin
  aFile := TPath.Combine(aPath, aFileName);
  if not FileExists(aFile) then
  begin
    if not DirectoryExists(aPath) then
      ForceDirectories(aPath);

    aResource := TResourceStream.Create(HInstance, aResourceName, RT_RCDATA);
    try
      aResource.SaveToFile(aFile);
    finally
      aResource.DisposeOf;
    end;
  end;
end;

class procedure TServicesUtils.ResourceImage(aResourceName: String; aImage: TImage);
var
  Resource : TResourceStream;
begin
  Resource := TResourceStream.Create(HInstance, aResourceName, RT_RCDATA);
  try
    aImage.Picture.LoadFromStream(Resource);
  finally
    Resource.DisposeOf;
  end;
end;

class function TServicesUtils.StrToCurrency(Value: String): Currency;
begin
  Result := StrToCurrDef(Value.Trim.Replace('.', '').Replace(',', ''), 0) / 100.0;
end;

class procedure TServicesUtils.Split(pDelimiter: Char; pStr: String; pListOfStrings: TStrings);
begin
  with pListOfStrings do
  begin
    Clear;
    Delimiter       := pDelimiter;
    StrictDelimiter := True;
    DelimitedText   := pStr;
  end;
end;

class function TServicesUtils.StrDateFormatBr(aData: String): TDateTime;
var
  aStr : TStringList;
begin
  aStr := TStringList.Create;
  try
    aStr.Delimiter := '/';
    aStr.DelimitedText := aData;

    Result := EncodeDate(aStr[2].ToInteger, aStr[1].ToInteger, aStr[0].ToInteger);
  finally
    aStr.DisposeOf;
  end;
end;

class function TServicesUtils.StrFormatarCEP(Value : String): String;
var
  S : String;
begin
  S := Value.Trim; // 00.000-000

  if ( Copy(S, 3, 1) <> '.' ) then
    S := Copy(S, 1, 2) + '.' + Copy(S, 3, Length(S));

  if ( Copy(S, 7, 1) <> '-' ) then
    S := Copy(S, 1, 6) + '-' + Copy(S, 7, Length(S));

  Result := S;
end;


class function TServicesUtils.StrIsCNPJ(const Num: string): Boolean;
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

class function TServicesUtils.StrIsCPF(const Num: string): Boolean;
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

class function TServicesUtils.StrMetafonema(Value: String): String;
var
  i, p: Integer;
  novo, aux: string;
const
  DELIMITER = '.';
begin
  try
    aux  := TServicesUtils.StrSanitize(AnsiUpperCase(Value));
    novo := EmptyStr;

    // Tira acentos que porventura ficaram para trás
    for i := 1 to Length(aux) do
    begin
      case aux[i] of
        'Á', 'Â', 'Ã', 'À', 'Ä', 'Å': aux[i] := 'A';
        'É', 'Ê', 'È', 'Ë': aux[i] := 'E';
        'Í', 'Î', 'Ì', 'Ï': aux[i] := 'I';
        'Ó', 'Ô', 'Õ', 'Ò', 'Ö': aux[i] := 'O';
        'Ú', 'Û', 'Ù', 'Ü': aux[i] := 'U';
        'Ç': aux[i] := 'C';
        'Ñ': aux[i] := 'N';
        'Ý', 'Ÿ', 'Y': aux[i] := 'I';
      else
        if Ord(aux[i]) > 127 then
          aux[i] := #32;
      end;
    end;

    aux := StringReplace(aux, ' ', DELIMITER, [rfReplaceAll]);

    // Retira E , DA, DE e DO do nome
    // José da Silva = José Silva
    // João Costa e Silva = João Costa Silva
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
        // 'A','E','I','O','U','Y','H' e espaços: ignora

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

class function TServicesUtils.StrFormatarCnpj(sCnpj: String): String;
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

class function TServicesUtils.StrFormatarCpf(sCpf: String): String;
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

class function TServicesUtils.StrFormatarFone(sFone: String): String;
var
  S : String;
begin
  S := Trim(sFone); // (91)01234-5678

  if ( Copy(S, 1, 1) <> '(' ) then
    S := '(' + Copy(S, 1, Length(S));

  if ( Copy(S, 4, 1) <> ')' ) then
    S := Copy(S, 1, 3) + ')' + Copy(S, 4, Length(S));

  if ( Copy(S, 10, 1) <> '-' ) then
    S := Copy(S, 1, 9) + '-' + Copy(S, 10, Length(S));

  Result := S;
end;

class function TServicesUtils.StrFormatarNome(aNome : String): String;
const
  excecao: array[0..5] of string = (' da ', ' de ', ' do ', ' das ', ' dos ', ' e ');
var
  tamanho,
  j : Integer;
  i : Byte;
begin
  Result  := AnsiLowerCase(aNome);
  tamanho := Length(Result);

  for j := 1 to tamanho do
    // Se é a primeira letra ou se o caracter anterior é um espaço
    if (j = 1) or ((j > 1) and (Result[j - 1] = Chr(32))) then
      Result[j] := AnsiUpperCase(Result[j])[1];

  for i := 0 to Length(excecao) - 1 do
    Result := StringReplace(Result, excecao[i], excecao[i], [rfReplaceAll, rfIgnoreCase]);
end;

class function TServicesUtils.StrOnlyNumbers(const Str : String) : String;
var
  I : Byte;
  Valor : String;
begin
  Valor := Str;

  for I := 1 to Length(Valor) do
    if not (Valor[I] in ['0'..'9']) then
      Delete(Valor, I, 1);

  Result := Valor;
end;

class function TServicesUtils.StrRemoveAccent(C: Char): Char;
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
  BadMaiNChar = ['Ñ'];
  BadMinNChar = ['ñ'];
  BadChar = ['´', '"', '`', '~', '^','¨'];
var
  U : Char;
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
  if (U in BadMaiNChar) then U := 'N';
  if (U in BadMinNChar) then U := 'n';
  if (U in BadChar) then U := #0;
  Result := U;
end;

class function TServicesUtils.StrRemoveAccents(Str: String): String;
const
  COM_ACENTO = 'ñàâêôûãõáéíóúçüÑÀÂÊÔÛÃÕÁÉÍÓÚÇÜªº';
  SEM_ACENTO = 'naaeouaoaeioucuNAAEOUAOAEIOUCUao';
var
  X : Integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x],COM_ACENTO) <> 0 then
      Str[x] := SEM_ACENTO[Pos(Str[x], COM_ACENTO)];

  Result := Str;
end;

class function TServicesUtils.StrRemoveAllAccents(const S: String): String;
var
  I: Integer;
begin
  Result := S;
  for I := 1 to Length(Result) do
    Result[I] := StrRemoveAccent(Result[I]);
end;

class function TServicesUtils.StrSanitize(Value: String): String;
begin
  Result := Trim(Value);
  if (Value <> StringOfChar(#32, Value.Length)) then
  begin
    Result := TServicesUtils.StrRemoveAccents(Value);
    Result := StringReplace(Result, '.', '',      [rfReplaceAll]);
    Result := StringReplace(Result, Chr(39), ' ', [rfReplaceAll]);  // Apostrofo
    Result := StringReplace(Result, '-', ' ',     [rfReplaceAll]);  // Hifén
    Result := StringReplace(Result, '  ', ' ',    [rfReplaceAll]);  // Espaco duplo
  end;
end;

end.
