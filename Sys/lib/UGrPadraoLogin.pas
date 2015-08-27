unit UGrPadraoLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, cxControls, cxContainer, cxEdit,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxTextEdit,

  dxSkinsCore, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGrPadraoLogin = class(TfrmGrPadrao)
    ImgLogo: TImage;
    lblSystemDescription: TLabel;
    lblSystemVersion: TLabel;
    BvlSystemBanner: TBevel;
    ShpLogo: TShape;
    QryEmpresa: TIBQuery;
    QryEmpresaCNPJ: TIBStringField;
    QryEmpresaNMFANT: TIBStringField;
    pnlMensagem: TLabel;
    BtnFechar: TSpeedButton;
    ImgBackgroud: TImage;
    BtnEntrar: TcxButton;
    edNome: TcxTextEdit;
    edSenha: TcxTextEdit;
    edEmpresa: TcxComboBox;
    lblNome: TcxLabel;
    lblSenha: TcxLabel;
    lblEmpresa: TcxLabel;
    lblSystemName: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fFinalizarAplicacao : Boolean;
    fCNPJ : Array of String;
    fContador : Integer;
    procedure CarregarEmpresa;
    procedure SetUsuario(Value : String);
    procedure SetSenha(Value : String);
    procedure SetEmpresa(Value : String);

    function GetUsuario : String;
    function GetSenha : String;
    function GetEmpresa : String;
  public
    { Public declarations }
    property FinalizarAplicacao : Boolean read fFinalizarAplicacao write fFinalizarAplicacao;
    property Usuario : String read GetUsuario write SetUsuario;
    property Senha   : String read GetSenha write SetSenha;
    property Empresa : String read GetEmpresa write SetEmpresa;
    property Contador : Integer read fContador write fContador;

    procedure RegistrarRotinaSistema; override;

    function EfetuarLogin : Boolean; //virtual; abstract;
  end;

var
  frmGrPadraoLogin: TfrmGrPadraoLogin;

implementation

uses
  UConstantesDGE, UFuncoes, UDMBusiness, UDMRecursos;

{$R *.dfm}

{ TfrmGrPadraoLogin }

function TfrmGrPadraoLogin.GetSenha: String;
begin
  Result := Trim(edSenha.Text);
end;

function TfrmGrPadraoLogin.GetUsuario: String;
begin
  Result := Trim(edNome.Text);
end;

procedure TfrmGrPadraoLogin.SetSenha(Value: String);
begin
  edSenha.Text := Value;
end;

procedure TfrmGrPadraoLogin.SetUsuario(Value: String);
begin
  edNome.Text := Value;
end;

procedure TfrmGrPadraoLogin.FormCreate(Sender: TObject);
begin
  inherited;
  fFinalizarAplicacao := False;

  lblSystemName.Caption        := GetInternalName;
  lblSystemDescription.Caption := GetFileDescription;
  lblSystemVersion.Caption     := 'Versão ' + GetExeVersion;

  if DataBaseOnLine then
    CarregarEmpresa;

  if ( Trim(GetEmpresaIDDefault) = EmptyStr ) then
    Empresa := StrOnlyNumbers(gLicencaSistema.CNPJ)
  else
    Empresa := GetEmpresaIDDefault;

  if (edEmpresa.ItemIndex = -1) then
    SetEmpresa(StrOnlyNumbers(gLicencaSistema.CNPJ));

  if ( ImgLogo.Picture.Height = 0 ) then
    ImgLogo.Picture.Icon := Application.Icon;

  fContador := 0;
end;

procedure TfrmGrPadraoLogin.CarregarEmpresa;
begin
  edEmpresa.Properties.Items.Clear;

  QryEmpresa.Open;
  QryEmpresa.Last;

  SetLength(fCNPJ, QryEmpresa.RecordCount);
  QryEmpresa.First;
  while not QryEmpresa.Eof do
  begin
    edEmpresa.Properties.Items.Add(QryEmpresaNMFANT.AsString);
    fCNPJ[ edEmpresa.Properties.Items.Count - 1 ] := QryEmpresaCNPJ.AsString;

    QryEmpresa.Next;
  end;
  QryEmpresa.Close;
end;

function TfrmGrPadraoLogin.GetEmpresa: String;
begin
  Result := fCNPJ[ edEmpresa.ItemIndex ];
end;

procedure TfrmGrPadraoLogin.SetEmpresa(Value: String);
var
  I : Integer;
begin
  for I := 0 to High(fCNPJ) do
    if ( fCNPJ[I] = Value ) then
    begin
      edEmpresa.ItemIndex := I;
      Break;
    end;
end;

procedure TfrmGrPadraoLogin.BtnFecharClick(Sender: TObject);
begin
  if fFinalizarAplicacao then
    Application.Terminate
  else
    Self.Close;  
end;

procedure TfrmGrPadraoLogin.BtnEntrarClick(Sender: TObject);
begin
  if Trim(edEmpresa.Text) = EmptyStr then
  begin
    ShowWarning('Favor selecionar a empresa!');
    if edEmpresa.Visible and edEmpresa.Enabled then
      edEmpresa.SetFocus;
  end
  else
  if EfetuarLogin then
  begin
    SetEmpresaIDDefault( Empresa );

    gUsuarioLogado.Login    := GetUserApp;
    gUsuarioLogado.Nome     := GetUserFullName;
    gUsuarioLogado.Funcao   := GetUserFunctionID;
    gUsuarioLogado.Empresa  := Empresa;
    gUsuarioLogado.Vendedor := GetUserCodigoVendedorID;

    ModalResult := mrOk;
  end
  else
    Inc(fContador);
end;

procedure TfrmGrPadraoLogin.edNomeChange(Sender: TObject);
begin
  pnlMensagem.Caption := EmptyStr;
end;

function TfrmGrPadraoLogin.EfetuarLogin: Boolean;
begin
  Result := False;
end;

procedure TfrmGrPadraoLogin.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGrPadraoLogin.FormShow(Sender: TObject);
begin
  inherited;
  if not DataBaseOnLine then
    Application.Terminate;
end;

end.
