unit UGeRequisicaoAlmoxCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeRequisicaoAlmoxCancelar = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblCentroCustoOrigem: TLabel;
    lblDataApropriacao: TLabel;
    dbCodigo: TDBEdit;
    dbCentroCustoOrigem: TDBEdit;
    dbDataApropriacao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    Bevel2: TBevel;
    dtsRequisicao: TDataSource;
    lblCentroCustoDestino: TLabel;
    dbCentroCustoDestino: TDBEdit;
    pnlBotoes: TPanel;
    lblInforme: TLabel;
    Bevel3: TBevel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsRequisicao: TFDQuery;
    updRequisicao: TFDUpdateSQL;
    cdsRequisicaoANO: TSmallintField;
    cdsRequisicaoCONTROLE: TFDAutoIncField;
    cdsRequisicaoNUMERO: TStringField;
    cdsRequisicaoEMPRESA: TStringField;
    cdsRequisicaoCCUSTO_ORIGEM: TIntegerField;
    cdsRequisicaoCCUSTO_DESTINO: TIntegerField;
    cdsRequisicaoSTATUS: TSmallintField;
    cdsRequisicaoDATA_EMISSAO: TDateField;
    cdsRequisicaoCANCEL_USUARIO: TStringField;
    cdsRequisicaoCANCEL_DATA: TSQLTimeStampField;
    cdsRequisicaoCANCEL_MOTIVO: TMemoField;
    cdsRequisicaoCC_ORIGEM_DESC: TStringField;
    cdsRequisicaoCC_DESTINO_DESC: TStringField;
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
  - TBREQUISICAO_ALMOX
  - TBEMPRESA
  - TBCENTRO_CUSTO


  Views:

  Procedures:

*)

  function CancelarRequisicaoAlmox(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes, UConstantesDGE;

{$R *.dfm}

function CancelarRequisicaoAlmox(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeRequisicaoAlmoxCancelar;
begin
  frm := TfrmGeRequisicaoAlmoxCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsRequisicao.Close;
      cdsRequisicao.ParamByName('ano').AsSmallInt     := Ano;
      cdsRequisicao.ParamByName('controle').AsInteger := Numero;
      cdsRequisicao.Open;

      dbCancelUsuario.Text  := gUsuarioLogado.Login;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', GetDateTimeDB);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeRequisicaoAlmoxCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeRequisicaoAlmoxCancelar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeRequisicaoAlmoxCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsRequisicao.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da requisição');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da requisição deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da requisição?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      with cdsRequisicao do
      begin
        Edit;

        cdsRequisicaoSTATUS.AsInteger        := STATUS_REQUISICAO_ALMOX_CAN;
        cdsRequisicaoCANCEL_DATA.AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsRequisicaoCANCEL_USUARIO.AsString := AnsiUpperCase( Trim(dbCancelUsuario.Text) );
        cdsRequisicaoCANCEL_MOTIVO.AsString  := AnsiUpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitUpdates;

        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
