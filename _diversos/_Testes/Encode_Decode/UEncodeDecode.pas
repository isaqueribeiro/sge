unit UEncodeDecode;

interface

uses
  System.NetEncoding,
  IdHashMessageDigest,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormEncodeDecode = class(TForm)
    edtCPF: TEdit;
    edtDataNascimento: TEdit;
    edtEncode64: TEdit;
    Button1: TButton;
    edtHash: TEdit;
    edtDecode64: TEdit;
    Button2: TButton;
    btnEncriptar: TButton;
    edtEncrip: TMemo;
    btnDecriptar: TButton;
    edtDecript: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnEncriptarClick(Sender: TObject);
    procedure btnDecriptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEncodeDecode: TFormEncodeDecode;

  function HashString(const Input : String) : String;
  function EncodeBase64String(const Input : String) : String;
  function DecodeBase64String(const Input : String) : String;

implementation

{$R *.dfm}

(*

PARA BASE SQL SERVER:

-- Encode the string "TestData" in Base64
SELECT
    CAST(N'' AS XML).value(
          'xs:base64Binary(xs:hexBinary(sql:column("bin")))'
        , 'VARCHAR(MAX)'
    )   Base64Encoding
FROM (
    SELECT CAST('667.102.432-8920/02/1980' AS VARBINARY(MAX)) AS bin
) AS bin_sql_server_temp;

-- NjY3LjEwMi40MzItODkyMC8wMi8xOTgw (Na Base)
-- NjY3LjEwMi40MzItODkyMC8wMi8xOTgw (Na Aplicação)


-- Decode the Base64-encoded
SELECT
    CAST(
        CAST(N'' AS XML).value(
            'xs:base64Binary("NjY3LjEwMi40MzItODkyMC8wMi8xOTgw")'
          , 'VARBINARY(MAX)'
        )
        AS VARCHAR(MAX)
    )   ASCIIEncoding
;


*)

function HashString(const Input : String) : String;
var
  aEncode : TIdHashMessageDigest5;
begin
  aEncode := TIdHashMessageDigest5.Create;
  try
    Result  := aEncode.HashStringAsHex(Input);
  finally
    aEncode.Free;
  end;
end;

function EncodeBase64String(const Input : String) : String;
var
  aEncode : TBase64Encoding;
begin
  aEncode := TBase64Encoding.Create;
  try
    Result  := aEncode.Encode(Input);
  finally
    aEncode.Free;
  end;
end;

function DecodeBase64String(const Input : String) : String;
var
  aEncode : TBase64Encoding;
begin
  aEncode := TBase64Encoding.Create;
  try
    try
      Result  := aEncode.Decode(Input);
    except
      Result  := 'Error';
    end;
  finally
    aEncode.Free;
  end;
end;

procedure TFormEncodeDecode.Button1Click(Sender: TObject);
begin
  edtEncode64.Text := EncodeBase64String(edtCPF.Text + edtDataNascimento.Text);
end;

procedure TFormEncodeDecode.Button2Click(Sender: TObject);
begin
  edtDecode64.Text := DecodeBase64String(edtEncode64.Text);
end;

procedure TFormEncodeDecode.btnDecriptarClick(Sender: TObject);
var
  aHash : String;
begin
  aHash := HashString('TheLordIsGod');
  edtDecript.Clear;
  edtDecript.Lines.Add(DecodeBase64String(edtEncrip.Text));
  edtDecript.Lines.Add('---');
  edtDecript.Lines.Add(StringReplace(DecodeBase64String(edtEncrip.Text), aHash, '', [rfReplaceAll]));
end;

procedure TFormEncodeDecode.btnEncriptarClick(Sender: TObject);
var
  aString : String;
begin
  edtHash.Text := HashString('TheLordIsGod');

  aString := StringReplace(edtCPF.Text + edtDataNascimento.Text, '/', edtHash.Text, [rfReplaceAll]);
  aString := StringReplace(aString, '.', edtHash.Text, [rfReplaceAll]);
  aString := StringReplace(aString, '-', edtHash.Text, [rfReplaceAll]);

  edtEncrip.Text := EncodeBase64String(aString);
end;

end.
