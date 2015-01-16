unit UGeSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, USobre, StdCtrls, ExtCtrls, dxGDIPlusClasses, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeSobre = class(TfrmSobre)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ShowAbout(const AOwer : TComponent);

implementation

uses UDMBusiness, UFuncoes, UConstantesDGE, UInfoVersao;

{$R *.dfm}

procedure ShowAbout(const AOwer : TComponent);
var
  frm : TfrmGeSobre;
begin
  frm := TfrmGeSobre.Create(AOwer);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeSobre.FormCreate(Sender: TObject);
var
  sCNPJ : String;
  ver : TInfoVersao;
begin
  inherited;
  ver := TInfoVersao.GetInstance;

  (* -- Isaque : 22/04/2014 -> Bloco de código descontinuado

  if ( StrIsCNPJ(GetEmpresaIDDefault) ) then
    sCNPJ := StrFormatarCnpj(GetEmpresaIDDefault)
  else
    sCNPJ := StrFormatarCpf(GetEmpresaIDDefault);

  Comments.Caption :=
    'Propriedade intelectual de ' + ver.getPropertyValue(ivOWNER) + ', ' +
    'com licença de uso para ' + GetEmpresaNomeDefault + ' CPF/CNPJ.: '  + sCNPJ + ' ' +
    'atualizada em ' + ver.getPropertyValue(ivRELEASE_DATE) + '.';
  *)
  
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := StrFormatarCpf(gLicencaSistema.CNPJ);

  Comments.Caption :=
    'Propriedade intelectual de ' + ver.getPropertyValue(ivOWNER) + ', ' +
    'com licença de uso para ' + gLicencaSistema.Empresa    + ', com CPF/CNPJ.: '  + sCNPJ + '.' + #13 +
    'Atualizada em ' + ver.getPropertyValue(ivRELEASE_DATE) + ', ' +
    'tendo como competência limite ' + IntToStr(gLicencaSistema.Competencia) +
    ' (' + DateToStr(gLicencaSistema.DataBloqueio) + ').';
end;

end.
