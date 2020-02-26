unit UGeApropriacaoEstoqueCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, cxButtons,
  IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light;

type
  TfrmGeApropriacaoEstoqueCancelar = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblCentroCusto: TLabel;
    lblDataApropriacao: TLabel;
    dbCodigo: TDBEdit;
    dbCentroCusto: TDBEdit;
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
    lblInforme: TLabel;
    dtsApropriacao: TDataSource;
    dbEntrada: TDBEdit;
    lblEntrada: TLabel;
    dbFornecedor: TDBEdit;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsApropriacao: TFDQuery;
    updApropriacao: TFDUpdateSQL;
    cdsApropriacaoANO: TSmallintField;
    cdsApropriacaoCONTROLE: TFDAutoIncField;
    cdsApropriacaoNUMERO: TStringField;
    cdsApropriacaoEMPRESA: TStringField;
    cdsApropriacaoCENTRO_CUSTO: TIntegerField;
    cdsApropriacaoSTATUS: TSmallintField;
    cdsApropriacaoDATA_APROPRIACAO: TDateField;
    cdsApropriacaoCANCEL_USUARIO: TStringField;
    cdsApropriacaoCANCEL_DATAHORA: TSQLTimeStampField;
    cdsApropriacaoCANCEL_MOTIVO: TMemoField;
    cdsApropriacaoCC_DESCRICAO: TStringField;
    cdsApropriacaoENTRADA: TStringField;
    cdsApropriacaoNOMEFORN: TStringField;
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
  - TBAPROPRIACAO_ALMOX
  - TBEMPRESA
  - TBCENTRO_CUSTO
  - TBCOMPRAS
  - TBFORNECEDOR

  Views:

  Procedures:

*)

var
  frmGeApropriacaoEstoqueCancelar: TfrmGeApropriacaoEstoqueCancelar;

  function CancelarAPROP(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
    UFuncoes
  , UDMBusiness
  , UDMNFe;

{$R *.dfm}

function CancelarAPROP(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeApropriacaoEstoqueCancelar;
begin
  frm := TfrmGeApropriacaoEstoqueCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsApropriacao.Close;
      cdsApropriacao.ParamByName('ano').AsSmallInt     := Ano;
      cdsApropriacao.ParamByName('controle').AsInteger := Numero;
      cdsApropriacao.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', GetDateTimeDB);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeApropriacaoEstoqueCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeApropriacaoEstoqueCancelar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeApropriacaoEstoqueCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsApropriacao.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da apropriação');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da apropriação deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da apropriação?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      with cdsApropriacao do
      begin
        Edit;

        cdsApropriacaoSTATUS.AsInteger           := STATUS_APROPRIACAO_ESTOQUE_CAN;
        cdsApropriacaoCANCEL_DATAHORA.AsDateTime := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsApropriacaoCANCEL_USUARIO.AsString    := AnsiUpperCase( Trim(dbCancelUsuario.Text) );
        cdsApropriacaoCANCEL_MOTIVO.AsString     := AnsiUpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitUpdates;

        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
