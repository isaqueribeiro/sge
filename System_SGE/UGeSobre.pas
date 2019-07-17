unit UGeSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, USobre, StdCtrls, ExtCtrls, dxGDIPlusClasses, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, dxSkinsCore,
  dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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

uses UDMBusiness, UFuncoes, UConstantesDGE, UInfoVersao, UDMRecursos;

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

  // Carregar Logotipo da Empresa
  if FileExists(gPersonalizaEmpresa.FileNameImagePNG_Company) then
    ImgLogo.Picture.LoadFromFile(gPersonalizaEmpresa.FileNameImagePNG_Company);
end;

end.
