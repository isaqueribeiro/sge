unit UGeSolicitacaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

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
    dtsSolicitacao: TDataSource;
    lblInforme: TLabel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsSolicitacao: TFDQuery;
    updSolicitacao: TFDUpdateSQL;
    cdsSolicitacaoANO: TSmallintField;
    cdsSolicitacaoCODIGO: TFDAutoIncField;
    cdsSolicitacaoEMPRESA: TStringField;
    cdsSolicitacaoNUMERO: TStringField;
    cdsSolicitacaoNOME_SOLICITANTE: TStringField;
    cdsSolicitacaoDATA_EMISSAO: TDateField;
    cdsSolicitacaoVALIDADE: TDateField;
    cdsSolicitacaoSTATUS: TSmallintField;
    cdsSolicitacaoCANCELADO_DATA: TDateField;
    cdsSolicitacaoCANCELADO_USUARIO: TStringField;
    cdsSolicitacaoCANCELADO_MOTIVO: TMemoField;
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
  - TBSOLICITACAO

  Views:

  Procedures:

*)

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
      cdsSolicitacao.ParamByName('ano').AsSmallInt := Ano;
      cdsSolicitacao.ParamByName('cod').AsInteger  := Numero;
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
        CommitUpdates;

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
