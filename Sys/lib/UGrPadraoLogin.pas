unit UGrPadraoLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, ExtCtrls, StdCtrls, Buttons, DB, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, cxControls, cxContainer, cxEdit,
  cxLabel, cxMaskEdit, cxDropDownEdit, cxTextEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGrPadraoLogin = class(TfrmGrPadrao)
    ImgLogo: TImage;
    lblSystemDescription: TLabel;
    lblSystemVersion: TLabel;
    BvlSystemBanner: TBevel;
    ShpLogo: TShape;
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
    fdQryEmpresa: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

(*
  Tabelas:
  - TBEMPRESA

  Views:

  Procedures:

*)

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

procedure TfrmGrPadraoLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  aProcesso : String;
begin
  if not gUsuarioLogado.Logado then
  begin
    Application.Terminate;

    // Remover processo da memória do Windows
    aProcesso := ParamStr(0);
    aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
    KillTask(aProcesso);
  end;
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
  SplashFree;
end;

procedure TfrmGrPadraoLogin.CarregarEmpresa;
begin
  edEmpresa.Properties.Items.Clear;

  fdQryEmpresa.Open;
  fdQryEmpresa.Last;

  SetLength(fCNPJ, fdQryEmpresa.RecordCount);
  fdQryEmpresa.First;
  while not fdQryEmpresa.Eof do
  begin
    edEmpresa.Properties.Items.Add(fdQryEmpresa.FieldByName('fantasia').AsString);
    fCNPJ[ edEmpresa.Properties.Items.Count - 1 ] := fdQryEmpresa.FieldByName('cnpj').AsString;

    fdQryEmpresa.Next;
  end;
  fdQryEmpresa.Close;
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
var
  aProcesso : String;
begin
  if fFinalizarAplicacao then
  begin
    Application.Terminate;

    // Remover processo da memória do Windows
    aProcesso := ParamStr(0);
    aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
    KillTask(aProcesso);
  end
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
    gUsuarioLogado.Logado   := True;

    ModalResult := mrOk;
  end
  else
  begin
    Inc(fContador);
    gUsuarioLogado.Logado := False;
  end;
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
var
  aProcesso : String;
begin
  inherited;
  if not DataBaseOnLine then
  begin
    Application.Terminate;

    // Remover processo da memória do Windows
    aProcesso := ParamStr(0);
    aProcesso := StringReplace(aProcesso, ExtractFilePath(aProcesso), '', [rfReplaceAll]);
    KillTask(aProcesso);
  end
  else
    UpgradeDataBase;
end;

end.

