unit UGeVendaPDVItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmGeVendaPDVItem = class(TfrmGrPadrao)
    ImgConsulta: TImage;
    Bevel4: TBevel;
    btnOk: TBitBtn;
    btnNao: TBitBtn;
    lblValorAltera: TLabel;
    edValorAltera: TEdit;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    fFormato : String;

    procedure SetValorAltera(const Value: Currency);
    procedure SetTitulo(const Value: String);

    function GetValorAltera : Currency;
    function GetTitulo : String;
  public
    { Public declarations }
    property Titulo : String read GetTitulo write SetTitulo;
    property Formato : String read fFormato write fFormato;
    property ValorAterar : Currency read GetValorAltera write SetValorAltera;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDVItem: TfrmGeVendaPDVItem;

implementation

uses
  UDMCupom, UDMBusiness;

{$R *.dfm}

procedure TfrmGeVendaPDVItem.ApenasNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [',', '0'..'9', #8]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeVendaPDVItem.FormCreate(Sender: TObject);
begin
  inherited;
  fFormato := EmptyStr;
end;

procedure TfrmGeVendaPDVItem.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeVendaPDVItem.btnOkClick(Sender: TObject);
begin
  if ( GetValorAltera = 0 ) then
  begin
    ShowWarning('Favor informar um(a) ' + AnsiLowerCase(lblValorAltera.Caption) + ' válido!');
    edValorAltera.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

function TfrmGeVendaPDVItem.GetValorAltera: Currency;
var
  sValor : String;
begin
  sValor := Trim(edValorAltera.Text);
  sValor := StringReplace(sValor, '.', '', [rfReplaceAll]);

  Result := StrToCurrDef(sValor, 0.0);
end;

procedure TfrmGeVendaPDVItem.SetValorAltera(const Value: Currency);
begin
  edValorAltera.Text := FormatFloat(fFormato, Value);
end;

function TfrmGeVendaPDVItem.GetTitulo: String;
begin
  Result := Trim(lblValorAltera.Caption);
end;

procedure TfrmGeVendaPDVItem.SetTitulo(const Value: String);
begin
  lblValorAltera.Caption := Trim(Value);
end;

end.
