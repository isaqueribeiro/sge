unit UGeSolicitacaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeSolicitacaoCompraCancelar = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDescricaoResumo: TLabel;
    lblEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDescricaoResumo: TDBEdit;
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
    cdsSolicitacao: TIBDataSet;
    updSolicitacao: TIBUpdateSQL;
    dtsSolicitacao: TDataSource;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsSolicitacaoANO: TSmallintField;
    cdsSolicitacaoCODIGO: TIntegerField;
    cdsSolicitacaoEMPRESA: TIBStringField;
    cdsSolicitacaoNUMERO: TIBStringField;
    cdsSolicitacaoNOME_SOLICITANTE: TIBStringField;
    cdsSolicitacaoSTATUS: TSmallintField;
    cdsSolicitacaoCANCELADO_DATA: TDateField;
    cdsSolicitacaoCANCELADO_USUARIO: TIBStringField;
    cdsSolicitacaoCANCELADO_MOTIVO: TMemoField;
    cdsSolicitacaoDATA_EMISSAO: TDateField;
    cdsSolicitacaoVALIDADE: TDateField;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeSolicitacaoCompraCancelar: TfrmGeSolicitacaoCompraCancelar;

  function CancelarCOT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function CancelarCOT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeSolicitacaoCompraCancelar;
begin
  frm := TfrmGeSolicitacaoCompraCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsSolicitacao.Close;
      cdsSolicitacao.ParamByName('ano').AsShort   := Ano;
      cdsSolicitacao.ParamByName('cod').AsInteger := Numero;
      cdsSolicitacao.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeSolicitacaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeSolicitacaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsSolicitacao.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da solicitação');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da solicitação deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da solicitação?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      with cdsSolicitacao do
      begin
        Edit;

        cdsSolicitacaoSTATUS.AsInteger           := STATUS_SOLICITACAO_CAN;
        cdsSolicitacaoCANCELADO_DATA.AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsSolicitacaoCANCELADO_USUARIO.AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsSolicitacaoCANCELADO_MOTIVO.AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TfrmGeSolicitacaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
