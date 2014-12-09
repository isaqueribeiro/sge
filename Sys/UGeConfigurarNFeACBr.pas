unit UGeConfigurarNFeACBr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ComCtrls, OleCtrls,
  SHDocVw, TypInfo,

  pcnConversao;

type
  TfrmGeConfigurarNFeACBr = class(TfrmGrPadrao)
    Bevel1: TBevel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    grpBxConfigurar: TGroupBox;
    pgcGuias: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    lbltCaminho: TLabel;
    lbltSenha: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    lbltNumSerie: TLabel;
    sbtnGetCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    lbltLogoMarca: TLabel;
    sbtnLogoMarca: TSpeedButton;
    sbtnPathSalvar: TSpeedButton;
    edtLogoMarca: TEdit;
    edPathLogs: TEdit;
    ckSalvar: TCheckBox;
    rgTipoDanfe: TRadioGroup;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    lblUF: TLabel;
    ckVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    gbProxy: TGroupBox;
    lbltProxyHost: TLabel;
    lbltProxyPorta: TLabel;
    lbltProxyUser: TLabel;
    lbltProxySenha: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    TabSheet4: TTabSheet;
    lbltEmitCNPJ: TLabel;
    lbltEmitIE: TLabel;
    lbltEmitRazao: TLabel;
    lbltEmitFantasia: TLabel;
    lbltEmitLogradouro: TLabel;
    lbltEmitNumero: TLabel;
    lbltEmitComp: TLabel;
    lbltEmitBairro: TLabel;
    lbltEmitCodCidade: TLabel;
    lbltEmitCidade: TLabel;
    lbltEmitUF: TLabel;
    lbltEmitCEP: TLabel;
    lbltEmitFone: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCodCidade: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    lbltSmtpHost: TLabel;
    lbltSmtpPort: TLabel;
    lbltSmtpUser: TLabel;
    lbltSmtpPass: TLabel;
    lbltEmailAssunto: TLabel;
    lblEmailMsg: TLabel;
    edtSmtpHost: TEdit;
    edtSmtpPort: TEdit;
    edtSmtpUser: TEdit;
    edtSmtpPass: TEdit;
    edtEmailAssunto: TEdit;
    cbEmailSSL: TCheckBox;
    mmEmailMsg: TMemo;
    opnDialog: TOpenDialog;
    btnServico: TBitBtn;
    WBResposta: TWebBrowser;
    rgModoGerarNFe: TRadioGroup;
    lblInfoFisco: TLabel;
    edInfoFisco: TEdit;
    btnValidadeCertificado: TBitBtn;
    lblPathSchemas: TLabel;
    edPathSchemas: TEdit;
    spPathSchemas: TSpeedButton;
    lblFormaEmissao: TLabel;
    cbFormaEmissao: TComboBox;
    lblVersaoDF: TLabel;
    cbVersaoDF: TComboBox;
    ckRetirarAcentos: TCheckBox;
    lblIdToken: TLabel;
    edIdToken: TEdit;
    lblToken: TLabel;
    edToken: TEdit;
    ckEmitirNFCe: TCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure edtNumSerieChange(Sender: TObject);
    procedure btnValidadeCertificadoClick(Sender: TObject);
    procedure PathClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeConfigurarNFeACBr: TfrmGeConfigurarNFeACBr;

implementation

uses UDMNFe, FileCtrl, DateUtils;

{$R *.dfm}

procedure TfrmGeConfigurarNFeACBr.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeConfigurarNFeACBr.FormCreate(Sender: TObject);
var
 I : TpcnTipoEmissao;
 J : TpcnModeloDF;
 K : TpcnVersaoDF;
begin
  cbFormaEmissao.Items.Clear ;
  For I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) ) ;
  cbFormaEmissao.Items[0] := 'teNormal' ;
  cbFormaEmissao.ItemIndex := 0 ;

  cbVersaoDF.Items.Clear ;
  For K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(K) ) ) ;
  cbVersaoDF.Items[0] := 've200' ;
  cbVersaoDF.ItemIndex := 0 ;

  inherited;

  pgcGuias.ActivePageIndex := 0;
end;

procedure TfrmGeConfigurarNFeACBr.btnSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmGeConfigurarNFeACBr.sbtnCaminhoCertClick(Sender: TObject);
begin
  with opnDialog do
  begin
    Title      := 'Selecione o Certificado';
    DefaultExt := '*.pfx';
    Filter     := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';
    InitialDir := ExtractFileDir(application.ExeName);

    if Execute then
      edtCaminho.Text := FileName;
  end;
end;

procedure TfrmGeConfigurarNFeACBr.sbtnLogoMarcaClick(Sender: TObject);
begin
  with opnDialog do
  begin
    Title      := 'Selecione o Logo';
    DefaultExt := '*.bmp';
    Filter     := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
    InitialDir := ExtractFileDir(application.ExeName);

    if Execute then
      edtLogoMarca.Text := FileName;
  end;
end;

procedure TfrmGeConfigurarNFeACBr.sbtnPathSalvarClick(Sender: TObject);
var
  Dir : String;
begin
  if Length(edPathLogs.Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := edPathLogs.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    edPathLogs.Text := Dir;
end;

procedure TfrmGeConfigurarNFeACBr.edtNumSerieChange(Sender: TObject);
begin
  btnValidadeCertificado.Enabled := (Trim(edtNumSerie.Text) <> EmptyStr);
end;

procedure TfrmGeConfigurarNFeACBr.btnValidadeCertificadoClick(
  Sender: TObject);
begin
  DMNFe.GetValidadeCertificado(True);
end;

procedure TfrmGeConfigurarNFeACBr.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeConfigurarNFeACBr.PathClick(Sender: TObject);
var
  Dir : String;
begin
  if Length(TEdit(Sender).Text) <= 0 then
     Dir := ExtractFileDir(Application.ExeName)
  else
     Dir := TEdit(Sender).Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP) then
    TEdit(Sender).Text := Dir;
end;

procedure TfrmGeConfigurarNFeACBr.spPathSchemasClick(Sender: TObject);
begin
  PathClick( edPathSchemas );
end;

end.
