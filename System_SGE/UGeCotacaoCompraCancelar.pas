unit UGeCotacaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmGeCotacaoCompraCancelar = class(TfrmGrPadrao)
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
    cdsCotacao: TIBDataSet;
    updCotacao: TIBUpdateSQL;
    dtsCotacao: TDataSource;
    cdsCotacaoANO: TSmallintField;
    cdsCotacaoCODIGO: TIntegerField;
    cdsCotacaoEMPRESA: TIBStringField;
    cdsCotacaoNUMERO: TIBStringField;
    cdsCotacaoDESCRICAO_RESUMO: TIBStringField;
    cdsCotacaoCANCELADO_DATA: TDateField;
    cdsCotacaoCANCELADO_USUARIO: TIBStringField;
    cdsCotacaoCANCELADO_MOTIVO: TMemoField;
    cdsCotacaoSTATUS: TSmallintField;
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
  frmGeCotacaoCompraCancelar: TfrmGeCotacaoCompraCancelar;

  function CancelarCOT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function CancelarCOT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeCotacaoCompraCancelar;
begin
  frm := TfrmGeCotacaoCompraCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsCotacao.Close;
      cdsCotacao.ParamByName('ano').AsShort   := Ano;
      cdsCotacao.ParamByName('cod').AsInteger := Numero;
      cdsCotacao.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeCotacaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeCotacaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsCotacao.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da cotação');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da cotação deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da cotação?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      with cdsCotacao do
      begin
        Edit;

        cdsCotacaoSTATUS.AsInteger           := STATUS_COTACAO_CAN;
        cdsCotacaoCANCELADO_DATA.AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsCotacaoCANCELADO_USUARIO.AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsCotacaoCANCELADO_MOTIVO.AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TfrmGeCotacaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
