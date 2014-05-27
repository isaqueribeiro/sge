unit UGeAutorizacaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL;

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
    GrpBxImposto: TGroupBox;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    btnCancelar: TBitBtn;
    btFechar: TBitBtn;
    cdsAutorizacao: TIBDataSet;
    updAutorizacao: TIBUpdateSQL;
    dtsAutorizacao: TDataSource;
    cdsAutorizacaoANO: TSmallintField;
    cdsAutorizacaoCODIGO: TIntegerField;
    cdsAutorizacaoEMPRESA: TIBStringField;
    cdsAutorizacaoNUMERO: TIBStringField;
    cdsAutorizacaoFORNECEDOR: TIntegerField;
    cdsAutorizacaoNOME_CONTATO: TIBStringField;
    cdsAutorizacaoTIPO: TSmallintField;
    cdsAutorizacaoINSERCAO_DATA: TDateTimeField;
    cdsAutorizacaoEMISSAO_DATA: TDateField;
    cdsAutorizacaoEMISSAO_USUARIO: TIBStringField;
    cdsAutorizacaoVALIDADE: TDateField;
    cdsAutorizacaoCOMPETENCIA: TIntegerField;
    cdsAutorizacaoMOVITO: TMemoField;
    cdsAutorizacaoOBSERVACAO: TMemoField;
    cdsAutorizacaoENDERECO_ENTREGA: TMemoField;
    cdsAutorizacaoSTATUS: TSmallintField;
    cdsAutorizacaoRECEBEDOR_NOME: TIBStringField;
    cdsAutorizacaoRECEBEDOR_CPF: TIBStringField;
    cdsAutorizacaoRECEBEDOR_FUNCAO: TIBStringField;
    cdsAutorizacaoFORMA_PAGTO: TSmallintField;
    cdsAutorizacaoCONDICAO_PAGTO: TSmallintField;
    cdsAutorizacaoTRANSPORTADOR: TIntegerField;
    cdsAutorizacaoVALOR_BRUTO: TIBBCDField;
    cdsAutorizacaoVALOR_DESCONTO: TIBBCDField;
    cdsAutorizacaoVALOR_TOTAL_FRETE: TIBBCDField;
    cdsAutorizacaoVALOR_TOTAL_IPI: TIBBCDField;
    cdsAutorizacaoVALOR_TOTAL: TIBBCDField;
    cdsAutorizacaoAUTORIZADO_DATA: TDateField;
    cdsAutorizacaoDATA_FATURA: TDateField;
    cdsAutorizacaoAUTORIZADO_USUARIO: TIBStringField;
    cdsAutorizacaoCANCELADO_DATA: TDateField;
    cdsAutorizacaoCANCELADO_USUARIO: TIBStringField;
    cdsAutorizacaoCANCELADO_MOTIVO: TMemoField;
    cdsAutorizacaoNOMEFORN: TIBStringField;
    cdsAutorizacaoCNPJ: TIBStringField;
    cdsAutorizacaoPESSOA_FISICA: TSmallintField;
    cdsAutorizacaoTRANSPORTADOR_NOME: TIBStringField;
    cdsAutorizacaoTRANSPORTADOR_CPF_CNPJ: TIBStringField;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

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
      cdsAutorizacao.ParamByName('ano').AsShort   := Ano;
      cdsAutorizacao.ParamByName('cod').AsInteger := Numero;
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
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
