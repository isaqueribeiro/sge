unit Service.Format.VCL;

interface

uses
  System.SysUtils,
  System.Classes,
  System.MaskUtils,
  Vcl.StdCtrls;

type
  TTypeFormat = (
        typeFormatCNPJ
      , typeFormatCPF
      , typeFormatCNPJorCPF
      , typeFormatInscricaoEstadual
      , typeFormatTelefoneFixo
      , typeFormatCelular
      , typeFormatValor
      , typeFormatMoney
      , typeFormatCEP
      , typeFormatData
      , typeFormatPeso
      , typeFormatPersonalizado
  );

  TServiceFormat = class
    private
    public
      class procedure Formatar(aObject : TObject; const aTypeFormat : TTypeFormat; aExtra : String = '');

      class function Mask(Mascara, Value : String) : String;

      class function SomenteNumero(Value : String) : string;
      class function FormatarValor(Value : String) : String;
      class function FormatMoney(Value : String) : String;
      class function FormatarPeso(Value : string) : String;
      class function FormatarIE(Numero, UF : String): String;
      class function FormatarData(Value : String): String;
  end;

implementation

{ TServiceFormat }

class procedure TServiceFormat.Formatar(aObject: TObject; const aTypeFormat: TTypeFormat; aExtra: String);
var
  aTexto : string;
begin
  TThread.Queue(nil, procedure
  begin
    if aObject is TEdit then
      aTexto := TEdit(aObject).Text;

    case aTypeFormat of
      TTypeFormat.typeFormatCNPJ : aTexto := Mask('##.###.###/####-##', Self.SomenteNumero(aTexto));
      TTypeFormat.typeFormatCPF  : aTexto := Mask('###.###.###-##', Self.SomenteNumero(aTexto));

      TTypeFormat.typeFormatCNPJorCPF :
        begin
          if Length(Self.SomenteNumero(aTexto)) <= 11 then
            aTexto := Mask('##.###.###/####-##', Self.SomenteNumero(aTexto))
          else
            aTexto := Mask('###.###.###-##', Self.SomenteNumero(aTexto));
        end;

      TTypeFormat.typeFormatInscricaoEstadual : aTexto := FormatarIE(SomenteNumero(aTexto), aExtra);
      TTypeFormat.typeFormatTelefoneFixo      : aTexto := Mask('(##) ####-####', Self.SomenteNumero(aTexto));
      TTypeFormat.typeFormatCelular : aTexto := Mask('(##) #####-####', Self.SomenteNumero(aTexto));
      TTypeFormat.typeFormatValor   : aTexto := FormatarValor(Self.SomenteNumero(aTexto));

      TTypeFormat.typeFormatMoney :
        begin
          if aExtra.Trim.IsEmpty then
            aExtra := 'R$';

          aTExto := aExtra.Trim + ' ' + Self.FormatMoney(SomenteNumero(aTexto));
        end;

      TTypeFormat.typeFormatCEP  : aTexto := Mask('##.###-###', Self.SomenteNumero(aTexto));
      TTypeFormat.typeFormatData : aTexto := Self.FormatarData(Self.SomenteNumero(aTexto));
      TTypeFormat.typeFormatPeso : aTexto := Self.FormatarPeso(Self.SomenteNumero(aTexto));
      TTypeFormat.typeFormatPersonalizado : aTexto := Mask(aExtra, Self.SomenteNumero(aTexto));
    end;


    if aObject is TEdit then
    begin
      TEdit(aObject).Text := aTexto;
      TEdit(aObject).SelStart := aTexto.Length;
    end;
  end);
end;

class function TServiceFormat.FormatarData(Value: String): String;
var
  aData : TDateTime;
begin
  Value := Copy(Value.Trim, 1, 8);

  if Length(Value) < 8 then
    Result := Mask('##/##/####', Value)
  else
  begin
    Value := Mask('##/##/####', Value);

    if TryStrToDate(Value, aData) then
      Result := Value
    else
      Result := EmptyStr;
  end;
end;

class function TServiceFormat.FormatarIE(Numero, UF: String): String;
var
  aMascara : String;
begin
  aMascara := EmptyStr;

  if UF.Trim.ToUpper.Equals('AC') Then aMascara := '##.###.###/###-##';
  if UF.Trim.ToUpper.Equals('AL') Then aMascara := '#########';
  if UF.Trim.ToUpper.Equals('AP') Then aMascara := '#########';
  if UF.Trim.ToUpper.Equals('AM') Then aMascara := '##.###.###-#';
  if UF.Trim.ToUpper.Equals('BA') Then aMascara := '######-##';
  if UF.Trim.ToUpper.Equals('CE') Then aMascara := '########-#';
  if UF.Trim.ToUpper.Equals('DF') Then aMascara := '###########-##';
  if UF.Trim.ToUpper.Equals('ES') Then aMascara := '#########';
  if UF.Trim.ToUpper.Equals('GO') Then aMascara := '##.###.###-#';
  if UF.Trim.ToUpper.Equals('MA') Then aMascara := '#########';
  if UF.Trim.ToUpper.Equals('MT') Then aMascara := '##########-#';
  if UF.Trim.ToUpper.Equals('MS') Then aMascara := '#########';
  if UF.Trim.ToUpper.Equals('MG') Then aMascara := '###.###.###/####';
  if UF.Trim.ToUpper.Equals('PA') Then aMascara := '##-######-#';
  if UF.Trim.ToUpper.Equals('PB') Then aMascara := '########-#';
  if UF.Trim.ToUpper.Equals('PR') Then aMascara := '########-##';
  if UF.Trim.ToUpper.Equals('PE') Then aMascara := '##.#.###.#######-#';
  if UF.Trim.ToUpper.Equals('PI') Then aMascara := '#########';
  if UF.Trim.ToUpper.Equals('RJ') Then aMascara := '##.###.##-#';
  if UF.Trim.ToUpper.Equals('RN') Then aMascara := '##.###.###-#';
  if UF.Trim.ToUpper.Equals('RS') Then aMascara := '###/#######';
  if UF.Trim.ToUpper.Equals('RO') Then aMascara := '###.#####-#';
  if UF.Trim.ToUpper.Equals('RR') Then aMascara := '########-#';
  if UF.Trim.ToUpper.Equals('SC') Then aMascara := '###.###.###';
  if UF.Trim.ToUpper.Equals('SP') Then aMascara := '###.###.###.###';
  if UF.Trim.ToUpper.Equals('SE') Then aMascara := '#########-#';
  if UF.Trim.ToUpper.Equals('TO') Then aMascara := '###########';

  Result := Mask(amascara, Numero.Trim);
end;

class function TServiceFormat.FormatarPeso(Value: string): string;
begin
  if Value.Trim.IsEmpty then
    Value := '0';

  try
    Result := FormatFloat(',0.000', StrToCurr(Value.Trim) / 1000);
  except
    Result := FormatFloat(',0.000', 0);
  end;
end;

class function TServiceFormat.FormatarValor(Value: String): string;
begin
  if Value.Trim.IsEmpty then
    Value := '0';

  try
    Result := FormatFloat(',0.00', StrToFloat(Value.Trim) / 100);
  except
    Result := FormatFloat(',0.00', 0);
  end;
end;

class function TServiceFormat.FormatMoney(Value: String): string;
begin
  if Value.Trim.IsEmpty then
    Value := '0';

  try
    Result := FormatFloat(',0.00', StrToCurr(Value.Trim) / 100);
  except
    Result := FormatFloat(',0.00', 0);
  end;
end;

class function TServiceFormat.Mask(Mascara, Value: String): String;
var
  x ,
  p : Integer;
  aRetorno : String;
begin
  aRetorno := EmptyStr;

  p := 0;
  try
    if not Value.Trim.IsEmpty then
      for x := 0 to Mascara.Length - 1 do
      begin
        if (Mascara.Chars[x] = '#') then
        begin
          aRetorno := aRetorno + Value.Chars[p];
          Inc(p);
        end
        else
          aRetorno := aRetorno + Mascara.Chars[x];

        if (p = Length(Value)) then
          break;
      end;
  finally
    Result := aRetorno;
  end;
end;

class function TServiceFormat.SomenteNumero(Value: String): string;
var
  x : integer;
  aRetorno : String;
begin
  aRetorno := EmptyStr;
  try
    for x := 0 to Length(Value) - 1 do
      if (Value.Chars[x] in ['0'..'9']) then
        aRetorno := aRetorno + Value.Chars[x];
  finally
    Result := aRetorno;
  end;
end;

end.
