unit UGeEfetuarLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons,
  ExtCtrls, UGrPadraoLogin, dxGDIPlusClasses, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, pngimage, cxControls,
  cxContainer, cxEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  
  dxSkinsCore, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  frxClass;

type
  TFrmEfetuarLogin = class(TfrmGrPadraoLogin)
    ImgLogoIndustria: TImage;
    procedure FormShow(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
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
  UDMBusiness, UPrinc, UFuncoes, UGrUsuario, UConstantesDGE;

{$R *.dfm}

function TFrmEfetuarLogin.EfetuarLogin: Boolean;
var
  vSenha : TStringField;
  sSenha : String;
  bReturn : Boolean;
begin
  bReturn := False;

  try

    DMBusiness.ibdtstUsers.Close;
    DMBusiness.ibdtstUsers.Open;

    if not DMBusiness.ibdtstUsers.Locate('NOME', Usuario, []) then
    begin
      pnlMensagem.Caption := 'Entrada recusada ... USUÁRIO DESCONHECIDO!';

      if ( Contador >= 3 ) then
        frmPrinc.Close;

      edNome.SetFocus;
      Exit;
    end;

    vSenha := DMBusiness.ibdtstUsersSENHA as tStringfield;
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

procedure TFrmEfetuarLogin.FormShow(Sender: TObject);
begin
  inherited;
  ImgLogo.Visible          := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV]);
  ImgLogoIndustria.Visible := (gSistema.Codigo = SISTEMA_GESTAO_IND);

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

    SetEmpresaIDDefault( Empresa );

    frmPrinc.BrBtnAlterarSenha.Caption := Format('Alteração de Senha (%s)', [gUsuarioLogado.Login]);
    frmPrinc.BrBtnAlterarSenha.Hint    := Format('Alteração de Senha (%s)', [gUsuarioLogado.Login]);
    frmPrinc.TmrMonitorar.Enabled      := True;

    if (StrFormatarCnpj(gUsuarioLogado.Empresa) = StrFormatarCnpj(gLicencaSistema.CNPJ)) then
      frmPrinc.stbMain.Panels.Items[2].Text  := Format('Licenciado a empresa %s, %s', [gLicencaSistema.Empresa, sCNPJ])
    else
      frmPrinc.stbMain.Panels.Items[2].Text  := Format('[%s] Licenciado a empresa %s, %s', [GetEmpresaNome(gUsuarioLogado.Empresa), gLicencaSistema.Empresa, sCNPJ]);

    ModalResult := mrOk;

    frmPrinc.ConfigurarRotuloBotoes;
    if GetUserUpdatePassWord then
      frmPrinc.nmUsuarioAlterarSenhaClick( frmPrinc.BrBtnAlterarSenha );
  end
  else
    Contador := Contador + 1; 
end;

initialization
  FormFunction.RegisterForm('FrmEfetuarLogin', TFrmEfetuarLogin);

end.
