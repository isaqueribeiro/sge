unit UGeVendaPDVOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmGeVendaPDVOrcamento = class(TfrmGrPadrao)
    ImgConsulta: TImage;
    Bevel4: TBevel;
    btnOk: TBitBtn;
    btnNao: TBitBtn;
    lblNumeroOrcamento: TLabel;
    e1NumeroOrcamento: TEdit;
    e2NumeroOrcamento: TEdit;
    Label2: TLabel;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetOrcamentoCod(Value : Integer);

    function GetOrcamentoAno : Smallint;
    function GetOrcamentoCod : Integer;
  public
    { Public declarations }
    property OrcamentoAno : Smallint read GetOrcamentoAno;
    property OrcamentoCod : Integer read GetOrcamentoCod write SetOrcamentoCod;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaPDVOrcamento: TfrmGeVendaPDVOrcamento;

implementation

uses
  UDMCupom, UDMBusiness;

{$R *.dfm}

procedure TfrmGeVendaPDVOrcamento.ApenasNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeVendaPDVOrcamento.FormCreate(Sender: TObject);
begin
  inherited;
  e1NumeroOrcamento.Text := FormatDateTime('yyyy', Date);
  e2NumeroOrcamento.Text := EmptyStr;
end;

function TfrmGeVendaPDVOrcamento.GetOrcamentoAno: Smallint;
begin
  Result := StrToIntDef(Trim(e1NumeroOrcamento.Text), 0);
end;

function TfrmGeVendaPDVOrcamento.GetOrcamentoCod: Integer;
begin
  Result := StrToIntDef(Trim(e2NumeroOrcamento.Text), 0);
end;

procedure TfrmGeVendaPDVOrcamento.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeVendaPDVOrcamento.SetOrcamentoCod(Value: Integer);
begin
  e2NumeroOrcamento.Text := FormatFloat('###0000000', Value);
end;

procedure TfrmGeVendaPDVOrcamento.btnOkClick(Sender: TObject);
begin
  if ( OrcamentoCod = 0 ) then
  begin
    ShowWarning('Favor informar um número de orçamento válido!');
    e2NumeroOrcamento.SetFocus;
  end
  else
    ModalResult := mrOk;
end;

end.
