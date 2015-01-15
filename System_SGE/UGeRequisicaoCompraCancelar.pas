unit UGeRequisicaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeRequisicaoCompraCancelar = class(TfrmGrPadrao)
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
    cdsRequisicao: TIBDataSet;
    updRequisicao: TIBUpdateSQL;
    dtsAutorizacao: TDataSource;
    cdsRequisicaoANO: TSmallintField;
    cdsRequisicaoCODIGO: TIntegerField;
    cdsRequisicaoEMPRESA: TIBStringField;
    cdsRequisicaoNUMERO: TIBStringField;
    cdsRequisicaoFORNECEDOR: TIntegerField;
    cdsRequisicaoNOME_CONTATO: TIBStringField;
    cdsRequisicaoTIPO: TSmallintField;
    cdsRequisicaoINSERCAO_DATA: TDateTimeField;
    cdsRequisicaoEMISSAO_DATA: TDateField;
    cdsRequisicaoEMISSAO_USUARIO: TIBStringField;
    cdsRequisicaoVALIDADE: TDateField;
    cdsRequisicaoCOMPETENCIA: TIntegerField;
    cdsRequisicaoMOVITO: TMemoField;
    cdsRequisicaoOBSERVACAO: TMemoField;
    cdsRequisicaoENDERECO_ENTREGA: TMemoField;
    cdsRequisicaoSTATUS: TSmallintField;
    cdsRequisicaoRECEBEDOR_NOME: TIBStringField;
    cdsRequisicaoRECEBEDOR_CPF: TIBStringField;
    cdsRequisicaoRECEBEDOR_FUNCAO: TIBStringField;
    cdsRequisicaoFORMA_PAGTO: TSmallintField;
    cdsRequisicaoCONDICAO_PAGTO: TSmallintField;
    cdsRequisicaoTRANSPORTADOR: TIntegerField;
    cdsRequisicaoVALOR_BRUTO: TIBBCDField;
    cdsRequisicaoVALOR_DESCONTO: TIBBCDField;
    cdsRequisicaoVALOR_TOTAL_FRETE: TIBBCDField;
    cdsRequisicaoVALOR_TOTAL_IPI: TIBBCDField;
    cdsRequisicaoVALOR_TOTAL: TIBBCDField;
    cdsRequisicaoREQUISITADO_DATA: TDateField;
    cdsRequisicaoDATA_FATURA: TDateField;
    cdsRequisicaoREQUISITADO_USUARIO: TIBStringField;
    cdsRequisicaoCANCELADO_DATA: TDateField;
    cdsRequisicaoCANCELADO_USUARIO: TIBStringField;
    cdsRequisicaoCANCELADO_MOTIVO: TMemoField;
    cdsRequisicaoNOMEFORN: TIBStringField;
    cdsRequisicaoCNPJ: TIBStringField;
    cdsRequisicaoPESSOA_FISICA: TSmallintField;
    cdsRequisicaoTRANSPORTADOR_NOME: TIBStringField;
    cdsRequisicaoTRANSPORTADOR_CPF_CNPJ: TIBStringField;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeRequisicaoCompraCancelar: TfrmGeRequisicaoCompraCancelar;

  function CancelarAUT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function CancelarAUT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeRequisicaoCompraCancelar;
begin
  frm := TfrmGeRequisicaoCompraCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsRequisicao.Close;
      cdsRequisicao.ParamByName('ano').AsShort   := Ano;
      cdsRequisicao.ParamByName('cod').AsInteger := Numero;
      cdsRequisicao.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeRequisicaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeRequisicaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeRequisicaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsRequisicao.IsEmpty ) then
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
      with cdsRequisicao do
      begin
        Edit;

        cdsRequisicaoSTATUS.AsInteger           := STATUS_REQUISICAO_CAN;
        cdsRequisicaoCANCELADO_DATA.AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsRequisicaoCANCELADO_USUARIO.AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsRequisicaoCANCELADO_MOTIVO.AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
