unit UGeCotacaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UGrPadrao, StdCtrls,
  Mask, DBCtrls, ExtCtrls, Buttons, DB, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinsDefaultPainters;

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
    GrpBxTexto: TGroupBox;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    Bevel2: TBevel;
    dtsCotacao: TDataSource;
    cdsCotacao: TFDQuery;
    updCotacao: TFDUpdateSQL;
    cdsCotacaoANO: TSmallintField;
    cdsCotacaoCODIGO: TFDAutoIncField;
    cdsCotacaoEMPRESA: TStringField;
    cdsCotacaoNUMERO: TStringField;
    cdsCotacaoDESCRICAO_RESUMO: TStringField;
    cdsCotacaoSTATUS: TSmallintField;
    cdsCotacaoINSERCAO_DATA: TSQLTimeStampField;
    cdsCotacaoEMISSAO_DATA: TDateField;
    cdsCotacaoVALIDADE: TDateField;
    cdsCotacaoCANCELADO_DATA: TDateField;
    cdsCotacaoCANCELADO_USUARIO: TStringField;
    cdsCotacaoCANCELADO_MOTIVO: TMemoField;
    pnlBotoes: TPanel;
    lblInforme: TLabel;
    Bevel3: TBevel;
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

(*
  Tabelas:
  - TBCOTACAO_COMPRA

  Views:

  Procedures:
*)

var
  frmGeCotacaoCompraCancelar: TfrmGeCotacaoCompraCancelar;

  function CancelarCOT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes, UConstantesDGE;

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
      cdsCotacao.ParamByName('ano').AsSmallInt := Ano;
      cdsCotacao.ParamByName('cod').AsInteger  := Numero;
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
        CommitUpdates;

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
