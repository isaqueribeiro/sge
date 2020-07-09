unit View.Abertura;

interface

uses
  View.PadraoAbertura,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFrmAbertura = class(TFrmPadraoAbertura)
    imgLogo: TImage;
    lblPropriedade: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowAbout(const AOwer : TComponent);

var
  FrmAbertura: TFrmAbertura;

implementation

{$R *.dfm}

uses
  UInfoVersao, UFuncoes, UDMBusiness;

procedure ShowAbout(const AOwer : TComponent);
var
  sCNPJ : String;
  ver : TInfoVersao;
  frm : TFrmAbertura;
begin
  frm := TFrmAbertura.Create(AOwer);

  try
    frm.lblPropriedade.Caption := EmptyStr;

    ver := TInfoVersao.GetInstance;

    if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
      sCNPJ := StrFormatarCnpj(gLicencaSistema.CNPJ)
    else
      sCNPJ := StrFormatarCpf(gLicencaSistema.CNPJ);

    frm.lblPropriedade.Caption :=
      'Propriedade intelectual de ' + ver.getPropertyValue(ivOWNER) + ', ' +
      'com licença de uso para ' + gLicencaSistema.Empresa    + ', com CPF/CNPJ.: '  + sCNPJ + '.' + #13 +
      'Atualizada em ' + ver.getPropertyValue(ivRELEASE_DATE) + ', ' +
      'tendo como competência limite ' + IntToStr(gLicencaSistema.Competencia) +
      ' (' + DateToStr(gLicencaSistema.DataBloqueio) + ').';

    frm.lblPropriedade.Visible := True;
    frm.lblPropriedade.BringToFront;

    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TFrmAbertura.FormCreate(Sender: TObject);
begin
  CirculoSolido := False;
  TamanhoPadrao := True;
  CriarMoldura  := True;
  CriarLinhasInferiores  := True;
  lblPropriedade.Visible := False;

  inherited;

  imgLogo.BringToFront;
end;

end.
