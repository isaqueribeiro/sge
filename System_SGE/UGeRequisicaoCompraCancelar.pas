unit UGeRequisicaoCompraCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, System.ImageList,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

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
    GrpBxCancelamento: TGroupBox;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    Bevel2: TBevel;
    dtsAutorizacao: TDataSource;
    pnlBotoes: TPanel;
    lblInforme: TLabel;
    Bevel3: TBevel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsRequisicao: TFDQuery;
    updRequisicao: TFDUpdateSQL;
    cdsRequisicaoANO: TSmallintField;
    cdsRequisicaoCODIGO: TFDAutoIncField;
    cdsRequisicaoEMPRESA: TStringField;
    cdsRequisicaoNUMERO: TStringField;
    cdsRequisicaoFORNECEDOR: TIntegerField;
    cdsRequisicaoNOME_CONTATO: TStringField;
    cdsRequisicaoTIPO: TSmallintField;
    cdsRequisicaoINSERCAO_DATA: TSQLTimeStampField;
    cdsRequisicaoEMISSAO_DATA: TDateField;
    cdsRequisicaoEMISSAO_USUARIO: TStringField;
    cdsRequisicaoVALIDADE: TDateField;
    cdsRequisicaoCOMPETENCIA: TIntegerField;
    cdsRequisicaoSTATUS: TSmallintField;
    cdsRequisicaoREQUISITADO_DATA: TDateField;
    cdsRequisicaoCANCELADO_DATA: TDateField;
    cdsRequisicaoCANCELADO_USUARIO: TStringField;
    cdsRequisicaoCANCELADO_MOTIVO: TMemoField;
    cdsRequisicaoNOMEFORN: TStringField;
    cdsRequisicaoCNPJ: TStringField;
    cdsRequisicaoPESSOA_FISICA: TSmallintField;
    cdsRequisicaoTRANSPORTADOR_NOME: TStringField;
    cdsRequisicaoTRANSPORTADOR_CPF_CNPJ: TStringField;
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
  - TBREQUISITA_COMPRA
  - TBFORNECEDOR

  Views:

  Procedures:
*)

var
  frmGeRequisicaoCompraCancelar: TfrmGeRequisicaoCompraCancelar;

  function CancelarAUT(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes, UConstantesDGE;

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
      cdsRequisicao.ParamByName('ano').AsSmallInt := Ano;
      cdsRequisicao.ParamByName('cod').AsInteger  := Numero;
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
        CommitUpdates;

        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
