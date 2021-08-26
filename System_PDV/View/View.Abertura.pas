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
    procedure FormShow(Sender: TObject);
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
  UFuncoes, UDMBusiness, Interacao.Versao, Controller.Versao, Controller.Licenca;

procedure ShowAbout(const AOwer : TComponent);
var
  sCNPJ : String;
  ver : IVersao;
  frm : TFrmAbertura;
begin
  frm := TFrmAbertura.Create(AOwer);

  try
    frm.lblPropriedade.Caption := EmptyStr;

    ver := TVersaoController.GetInstance();

    if ( StrIsCNPJ(TLicencaController.GetInstance().CNPJ) ) then
      sCNPJ := StrFormatarCnpj(TLicencaController.GetInstance().CNPJ)
    else
      sCNPJ := StrFormatarCpf(TLicencaController.GetInstance().CNPJ);

    frm.lblPropriedade.Caption :=
      'Propriedade intelectual de ' + ver.getPropertyValue(ivOWNER) + ', ' +
      'com licença de uso para ' + TLicencaController.GetInstance().Empresa    + ', com CPF/CNPJ.: '  + sCNPJ + '.' + #13 +
      'Atualizada em ' + ver.getPropertyValue(ivRELEASE_DATE) + ', ' +
      'tendo como competência limite ' + IntToStr(TLicencaController.GetInstance().Competencia) +
      ' (' + DateToStr(TLicencaController.GetInstance().DataBloqueio) + ').';

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

  lblSystemName.Transparent := False;
  lblSystemDescription.Transparent := False;

  imgLogo.BringToFront;
end;

procedure TFrmAbertura.FormShow(Sender: TObject);
begin
  inherited;
  lblSystemName.Transparent := True;
  lblSystemDescription.Transparent := True;
end;

end.
