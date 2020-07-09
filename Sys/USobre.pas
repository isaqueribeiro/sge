unit USobre;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Menus,
  Buttons, ExtCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    FileDescription: TLabel;
    ImgLogo: TImage;
    Bevel1: TBevel;
    OKButton: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LabelTransparente;
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

  procedure ShowAbout(const AOwer : TComponent);

implementation

uses
  UDMBusiness, UFuncoes, UConstantesDGE, Interacao.PersonalizaEmpresa, Controller.Factory;

{$R *.dfm}

procedure ShowAbout(const AOwer : TComponent);
var
  frm : TfrmSobre;
begin
  frm := TfrmSobre.Create(AOwer);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TfrmSobre.FormCreate(Sender: TObject);
var
  sCNPJ : String;
  aEmp  : IPersonalizaEmpresa;
begin
  aEmp := TFactoryController.getInstance().getPersonalizaEmpresa();

  if ( ImgLogo.Picture.Height = 0 ) then
    ImgLogo.Picture.Icon := Application.Icon;

  Caption := 'Sobre o ' + StringReplace(aEmp.InternalName, '_', ' ', [rfReplaceAll]);

  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := StrFormatarCpf(gLicencaSistema.CNPJ);

  ProductName.Caption     := StringReplace(aEmp.InternalName, '_', ' ', [rfReplaceAll]);
  FileDescription.Caption := aEmp.FileDescription;
  {$IFDEF DGE}
  Version.Caption     := 'Versão ' + VERSION_NUMBER;
  Copyright.Caption   := '© 2012 | 2014 - Masterdados Tecnologia da Informação' + #13 + 'Todos os direitos reservados.';
  {$ELSE}
  Version.Caption      := 'Versão ' + GetExeVersion;
  Copyright.Caption    := GetCopyright;
  {$ENDIF}
  Comments.Caption    := 'Licenciado a empresa ' + gLicencaSistema.Empresa + ' CPF/CNPJ.: ' + sCNPJ ;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  LabelTransparente;
end;

procedure TfrmSobre.LabelTransparente;
var
  I : Integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
    if (Components[I] is TLabel) then
    begin
      TLabel(Components[I]).Transparent := False;
      TLabel(Components[I]).Transparent := True;
    end;
end;

end.
 
