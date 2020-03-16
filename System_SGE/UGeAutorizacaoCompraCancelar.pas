unit UGeAutorizacaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UGrPadrao, StdCtrls,
  Mask, DBCtrls, ExtCtrls, Buttons, DB, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeAutorizacaoCompraCancelar = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblFornecedor: TLabel;
    lblEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbFornecedor: TDBEdit;
    dbEmissao: TDBEdit;
    lblValidade: TLabel;
    dbValidade: TDBEdit;
    Bevel1: TBevel;
    GrpBxTexto: TGroupBox;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    Bevel2: TBevel;
    dtsAutorizacao: TDataSource;
    cdsAutorizacao: TFDQuery;
    updAutorizacao: TFDUpdateSQL;
    cdsAutorizacaoANO: TSmallintField;
    cdsAutorizacaoCODIGO: TFDAutoIncField;
    cdsAutorizacaoEMPRESA: TStringField;
    cdsAutorizacaoNUMERO: TStringField;
    cdsAutorizacaoFORNECEDOR: TIntegerField;
    cdsAutorizacaoNOME_CONTATO: TStringField;
    cdsAutorizacaoTIPO: TSmallintField;
    cdsAutorizacaoINSERCAO_DATA: TSQLTimeStampField;
    cdsAutorizacaoEMISSAO_DATA: TDateField;
    cdsAutorizacaoEMISSAO_USUARIO: TStringField;
    cdsAutorizacaoVALIDADE: TDateField;
    cdsAutorizacaoCOMPETENCIA: TIntegerField;
    cdsAutorizacaoMOVITO: TMemoField;
    cdsAutorizacaoOBSERVACAO: TMemoField;
    cdsAutorizacaoENDERECO_ENTREGA: TMemoField;
    cdsAutorizacaoSTATUS: TSmallintField;
    cdsAutorizacaoRECEBEDOR_NOME: TStringField;
    cdsAutorizacaoRECEBEDOR_CPF: TStringField;
    cdsAutorizacaoRECEBEDOR_FUNCAO: TStringField;
    cdsAutorizacaoFORMA_PAGTO: TSmallintField;
    cdsAutorizacaoCONDICAO_PAGTO: TSmallintField;
    cdsAutorizacaoTRANSPORTADOR: TIntegerField;
    cdsAutorizacaoVALOR_BRUTO: TBCDField;
    cdsAutorizacaoVALOR_DESCONTO: TBCDField;
    cdsAutorizacaoVALOR_TOTAL_FRETE: TBCDField;
    cdsAutorizacaoVALOR_TOTAL_IPI: TBCDField;
    cdsAutorizacaoVALOR_TOTAL: TBCDField;
    cdsAutorizacaoAUTORIZADO_DATA: TDateField;
    cdsAutorizacaoDATA_FATURA: TDateField;
    cdsAutorizacaoAUTORIZADO_USUARIO: TStringField;
    cdsAutorizacaoCANCELADO_DATA: TDateField;
    cdsAutorizacaoCANCELADO_USUARIO: TStringField;
    cdsAutorizacaoCANCELADO_MOTIVO: TMemoField;
    cdsAutorizacaoNOMEFORN: TStringField;
    cdsAutorizacaoCNPJ: TStringField;
    cdsAutorizacaoPESSOA_FISICA: TSmallintField;
    cdsAutorizacaoTRANSPORTADOR_NOME: TStringField;
    cdsAutorizacaoTRANSPORTADOR_CPF_CNPJ: TStringField;
    pnlBotoes: TPanel;
    lblInforme: TLabel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    Bevel3: TBevel;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBAUTORIZA_COMPRA
  - TBFORNECEDOR

  Views:

  Procedures:
*)

var
  frmGeAutorizacaoCompraCancelar: TfrmGeAutorizacaoCompraCancelar;

  function CancelarAUT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function CancelarAUT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeAutorizacaoCompraCancelar;
begin
  frm := TfrmGeAutorizacaoCompraCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsAutorizacao.Close;
      cdsAutorizacao.ParamByName('ano').AsSmallInt := Ano;
      cdsAutorizacao.ParamByName('cod').AsInteger  := Numero;
      cdsAutorizacao.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeAutorizacaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeAutorizacaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeAutorizacaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsAutorizacao.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da autorização');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da autorização deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da autorização?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      with cdsAutorizacao do
      begin
        Edit;

        cdsAutorizacaoSTATUS.AsInteger           := STATUS_AUTORIZACAO_CAN;
        cdsAutorizacaoCANCELADO_DATA.AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsAutorizacaoCANCELADO_USUARIO.AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsAutorizacaoCANCELADO_MOTIVO.AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitUpdates;

        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
