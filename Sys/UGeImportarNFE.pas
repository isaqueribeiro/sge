unit UGeImportarNFE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClipBrd, UGrPadrao,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TfrmGeImportarNFE = class(TfrmGrPadrao)
    qryEmpresa: TIBQuery;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    dtsEmpresa: TDataSource;
    GrpBxEmpresa: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    Bevel1: TBevel;
    GrpBxManifesto: TGroupBox;
    lblChaveNFe: TLabel;
    edChaveNFe: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    btnManifesto: TcxButton;
    GrpBxDadosNFe: TGroupBox;
    lblArquivoXML: TLabel;
    Bevel3: TBevel;
    edArquivoXML: TcxButtonEdit;
    cxButton1: TcxButton;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarEmpresa(const sCnpj : String);
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeImportarNFE: TfrmGeImportarNFE;

(*
  Tabelas:
  - TBEMPRESA
  - TBLOG_TRANSACAO

  Views:

  Procedures:

*)

implementation

uses
  UDMBusiness, UDMNFe, UConstantesDGE, UFuncoes, UDMRecursos;

{$R *.dfm}

{ TfrmGrPadrao1 }

procedure TfrmGeImportarNFE.ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeImportarNFE.CarregarEmpresa(const sCnpj: String);
begin
  with qryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := sCnpj;
    Open;
  end;
end;

procedure TfrmGeImportarNFE.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarEmpresa(gUsuarioLogado.Empresa);
  btnManifesto.Enabled := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa);
end;

procedure TfrmGeImportarNFE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_F5 ) then
  begin
    if Clipboard.HasFormat( CF_TEXT ) then
      if ( Length(Trim(Clipboard.AsText)) = NFE_TAMANHO_NUMERO_CHAVE ) then // 15160414547157000146650010000000061000000065
        edChaveNFe.Text := Trim(Clipboard.AsText);
  end
  else
    inherited;
end;

procedure TfrmGeImportarNFE.RegistrarRotinaSistema;
begin
  ;
end;

end.
