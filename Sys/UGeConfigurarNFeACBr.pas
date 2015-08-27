unit UGeConfigurarNFeACBr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, ExtCtrls, ComCtrls, OleCtrls,
  SHDocVw, TypInfo,

  pcnConversao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeConfigurarNFeACBr = class(TfrmGrPadrao)
    Bevel1: TBevel;
    opnDialog: TOpenDialog;
    btnServico: TcxButton;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    pgcGuiasGerais: TPageControl;
    TbsConfiguracoes: TTabSheet;
    pgcGuiasConfiguracoes: TPageControl;
    TbsCertificado: TTabSheet;
    GroupBox2: TGroupBox;
    lbltCaminho: TLabel;
    lbltSenha: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    lbltNumSerie: TLabel;
    sbtnGetCert: TSpeedButton;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    TbsGeral: TTabSheet;
    GrpBxGeral: TGroupBox;
    sbtnPathSalvar: TSpeedButton;
    lblPathSchemas: TLabel;
    spPathSchemas: TSpeedButton;
    lblFormaEmissao: TLabel;
    lblVersaoDF: TLabel;
    lblIdToken: TLabel;
    lblToken: TLabel;
    edPathLogs: TEdit;
    ckSalvar: TCheckBox;
    edPathSchemas: TEdit;
    cbFormaEmissao: TComboBox;
    cbVersaoDF: TComboBox;
    ckRetirarAcentos: TCheckBox;
    edIdToken: TEdit;
    edToken: TEdit;
    ckEmitirNFCe: TCheckBox;
    rgModoGerarNFe: TRadioGroup;
    TbsWebService: TTabSheet;
    GrpBxWebService: TGroupBox;
    lblUF: TLabel;
    ckVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    GrpBxProxy: TGroupBox;
    lbltProxyHost: TLabel;
    lbltProxyPorta: TLabel;
    lbltProxyUser: TLabel;
    lbltProxySenha: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    WBResposta: TWebBrowser;
    TbsEmitente: TTabSheet;
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
    lblInfoFisco: TLabel;
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
    edInfoFisco: TEdit;
    TbsDanfe: TTabSheet;
    lbltLogoMarca: TLabel;
    sbtnLogoMarca: TSpeedButton;
    rgTipoDanfe: TRadioGroup;
    TbsEmail: TTabSheet;
    GrpBxEmail: TGroupBox;
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
    edtLogoMarca: TEdit;
    ckAtualizarXML: TCheckBox;
    ckExibirErroSchema: TCheckBox;
    lblFormatoAlerta: TLabel;
    edFormatoAlerta: TEdit;
    btnValidadeCertificado: TcxButton;
    ckSalvarSOAP: TCheckBox;
    GrpBxRetornoEnvio: TGroupBox;
    lblTentativas: TLabel;
    lblIntervalo: TLabel;
    lblAguardar: TLabel;
    ckAjustarAut: TCheckBox;
    edTentativas: TEdit;
    edIntervalo: TEdit;
    edAguardar: TEdit;
    TbsArquivos: TTabSheet;
    ckSalvarArqs: TCheckBox;
    ckPastaMensal: TCheckBox;
    ckAdicionaLiteral: TCheckBox;
    ckEmissaoPathNFe: TCheckBox;
    ckSalvaCCeCancelamentoPathEvento: TCheckBox;
    ckSepararPorCNPJ: TCheckBox;
    ckSepararPorModelo: TCheckBox;
    lblPathNFe: TLabel;
    edPathNFe: TEdit;
    sbPathNFe: TSpeedButton;
    lblPathCan: TLabel;
    edPathCan: TEdit;
    sbPathCan: TSpeedButton;
    lblPathCCe: TLabel;
    edPathCCe: TEdit;
    sbPathCCe: TSpeedButton;
    lblPathInu: TLabel;
    edPathInu: TEdit;
    sbPathInu: TSpeedButton;
    lblPathDPEC: TLabel;
    edPathDPEC: TEdit;
    sbPathDPEC: TSpeedButton;
    lblPathEvento: TLabel;
    edPathEvento: TEdit;
    sbPathEvento: TSpeedButton;
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
    procedure FormShow(Sender: TObject);
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathCanClick(Sender: TObject);
    procedure sbPathCCeClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbPathDPECClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
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
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), Integer(I) ) ) ;

  cbFormaEmissao.Items[0]  := 'teNormal' ;
  cbFormaEmissao.ItemIndex := 0 ;

  cbVersaoDF.Items.Clear ;

  For K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), Integer(K) ) ) ;

  cbVersaoDF.Items[0]  := 've200' ;
  cbVersaoDF.ItemIndex := 0 ;

  inherited;
end;

procedure TfrmGeConfigurarNFeACBr.FormShow(Sender: TObject);
begin
  inherited;
  pgcGuiasGerais.ActivePage        := TbsConfiguracoes;
  pgcGuiasConfiguracoes.ActivePage := TbsGeral;
end;

procedure TfrmGeConfigurarNFeACBr.btnSalvarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmGeConfigurarNFeACBr.sbPathCanClick(Sender: TObject);
begin
  PathClick(edPathCan);
end;

procedure TfrmGeConfigurarNFeACBr.sbPathCCeClick(Sender: TObject);
begin
  PathClick(edPathCCe);
end;

procedure TfrmGeConfigurarNFeACBr.sbPathDPECClick(Sender: TObject);
begin
  PathClick(edPathDPEC);
end;

procedure TfrmGeConfigurarNFeACBr.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edPathEvento);
end;

procedure TfrmGeConfigurarNFeACBr.sbPathInuClick(Sender: TObject);
begin
  PathClick(edPathInu);
end;

procedure TfrmGeConfigurarNFeACBr.sbPathNFeClick(Sender: TObject);
begin
  PathClick(edPathNFe);
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
  DMNFe.GetValidadeCertificado(EmptyStr, True);
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
