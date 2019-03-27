unit UGeEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, frxClass,
  ExtCtrls, UGrPadraoLogin, dxGDIPlusClasses, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, pngimage, cxControls,
  cxContainer, cxEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxTextEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TFrmEfetuarLogin = class(TfrmGrPadraoLogin)
    ImgLogoIndustria: TImage;
    ImgLogoOPME: TImage;
    procedure FormShow(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function EfetuarLogin : Boolean; overload;
  end;

var
  FrmEfetuarLogin: TFrmEfetuarLogin;

implementation

uses
  UDMBusiness, UPrinc, UFuncoes, UGrUsuario, UConstantesDGE, UDMRecursos;

{$R *.dfm}

function TFrmEfetuarLogin.EfetuarLogin: Boolean;
var
  vSenha : TStringField;
  sSenha : String;
  bReturn : Boolean;
begin
  bReturn := False;

  try

//    DMBusiness.ibdtstUsers.Close;
//    DMBusiness.ibdtstUsers.Open;
    DMBusiness.fdQryUsers.Close;
    DMBusiness.fdQryUsers.Open;

//    if not DMBusiness.ibdtstUsers.Locate('NOME', Usuario, []) then
    if not DMBusiness.fdQryUsers.Locate('NOME', Usuario, []) then
    begin
      pnlMensagem.Caption := 'Entrada recusada ... USUÁRIO DESCONHECIDO!';

      if ( Contador >= 3 ) then
        frmPrinc.Close;

      edNome.SetFocus;
      Exit;
    end;

//    vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;
    vSenha := DMBusiness.fdQryUsers.FieldByName('SENHA') as TStringfield;
    sSenha := GetSenhaFormatada(Senha, False);

    if (vSenha.Value = Senha) or (vSenha.Value = sSenha) then
    begin
      frmPrinc.Enabled := True;
      frmPrinc.stbMain.Panels[1].Text := AnsiLowerCase(edNome.Text + '@' + DMBusiness.ibdtbsBusiness.DatabaseName);
      frmPrinc.FormActivate( Application );

      bReturn := True;
    end
    else
    begin

      pnlMensagem.Caption := 'Entrada recusada ... SENHA INVÁLIDA!';

      if Contador = 3 then
        frmPrinc.close;

      edSenha.setfocus;
      Exit;

    end;

  finally
    Result := bReturn;
  end;
end;

procedure TFrmEfetuarLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ;
end;

procedure TFrmEfetuarLogin.FormCreate(Sender: TObject);
var
  sFileImageBackgroud : String;
begin
  inherited;
  sFileImageBackgroud := gPersonalizaEmpresa.FileNameImagePNG_BackgroundLogin;

  if ( FileExists(sFileImageBackgroud) ) then
  begin
    ImgBackgroud.Picture.LoadFromFile(sFileImageBackgroud);
    ImgBackgroud.Center := True;
  end;
end;

procedure TFrmEfetuarLogin.FormShow(Sender: TObject);
begin
  inherited;
  ImgLogo.Visible          := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV]);
  ImgLogoIndustria.Visible := (gSistema.Codigo = SISTEMA_GESTAO_IND);
  ImgLogoOPME.Visible      := (gSistema.Codigo = SISTEMA_GESTAO_OPME);

  if ( DelphiIsRunning ) then
  begin
    Usuario := 'ISAQUE';
    Senha   := 'admin';

    BtnEntrar.SetFocus;
  end;
end;

procedure TFrmEfetuarLogin.BtnEntrarClick(Sender: TObject);
var
  sCNPJ : String;
begin
  if ( StrIsCNPJ(gLicencaSistema.CNPJ) ) then
    sCNPJ := 'CNPJ: ' + StrFormatarCnpj(gLicencaSistema.CNPJ)
  else
    sCNPJ := 'CPF: ' + StrFormatarCpf(gLicencaSistema.CNPJ);

//  inherited;

  if Trim(edEmpresa.Text) = EmptyStr then
  begin
    ShowWarning('Favor selecionar a empresa!');
    if edEmpresa.Visible and edEmpresa.Enabled then
      edEmpresa.SetFocus;
  end
  else
  if EfetuarLogin then
  begin
    gUsuarioLogado.Login    := Usuario;
    gUsuarioLogado.Nome     := GetUserFullName;
    gUsuarioLogado.Funcao   := GetUserFunctionID;
    gUsuarioLogado.Empresa  := Empresa;
    gUsuarioLogado.Vendedor := GetUserCodigoVendedorID;
    gUsuarioLogado.Logado   := True;

    SetEmpresaIDDefault( Empresa );

    frmPrinc.BrBtnAlterarSenha.Caption := Format('Alteração de Senha (%s)', [gUsuarioLogado.Login]);
    frmPrinc.BrBtnAlterarSenha.Hint    := Format('Alteração de Senha (%s)', [gUsuarioLogado.Login]);
    frmPrinc.TmrMonitorar.Enabled      := True;

    if (StrFormatarCnpj(gUsuarioLogado.Empresa) = StrFormatarCnpj(gLicencaSistema.CNPJ)) then
      frmPrinc.stbMain.Panels.Items[2].Text  := Format('Licenciado a empresa %s, %s', [gLicencaSistema.Empresa, sCNPJ])
    else
      frmPrinc.stbMain.Panels.Items[2].Text  := Format('[%s] Licenciado a empresa %s, %s', [GetEmpresaNome(gUsuarioLogado.Empresa), gLicencaSistema.Empresa, sCNPJ]);

    frmPrinc.Notificar;

    ModalResult := mrOk;

    frmPrinc.ConfigurarRotuloBotoes;
    if GetUserUpdatePassWord then
      frmPrinc.nmUsuarioAlterarSenhaClick( frmPrinc.BrBtnAlterarSenha );
  end
  else
  begin
    Contador := Contador + 1;
    gUsuarioLogado.Logado := False;
  end;
end;

initialization
  FormFunction.RegisterForm('FrmEfetuarLogin', TFrmEfetuarLogin);

end.
