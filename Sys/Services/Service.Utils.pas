unit Service.Utils;

interface

uses
  System.SysUtils, System.StrUtils, Soap.EncdDecd,
  Vcl.ExtCtrls, Vcl.Graphics, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TServicesUtils = class
    private
    public
      class procedure ResourceImage( aResourceName : String; aImage : TImage); overload;
      class procedure ResourceImage( aResourceName : String; aButton : TSpeedButton); overload;

      class function PngToBmp(Png : TPngImage) : TBitmap;
      class function Base64FromBitmap(aBitmap : TBitmap) : String;
      class function BitmapFromBase64(const aBase64 : String) : TBitmap;
      class function MonthName(aData : TDateTime) : String;
      class function StrToCurrency(Value : String) : Currency;
  end;
implementation

uses
    System.Classes
  , System.Types
  , System.DateUtils
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

end.
