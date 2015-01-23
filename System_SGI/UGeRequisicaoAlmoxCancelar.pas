unit UGeRequisicaoAlmoxCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

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
    lblInforme: TLabel;
    cdsRequisicao: TIBDataSet;
    updRequisicao: TIBUpdateSQL;
    dtsRequisicao: TDataSource;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsRequisicaoANO: TSmallintField;
    cdsRequisicaoCONTROLE: TIntegerField;
    cdsRequisicaoNUMERO: TIBStringField;
    cdsRequisicaoEMPRESA: TIBStringField;
    cdsRequisicaoCCUSTO_ORIGEM: TIntegerField;
    cdsRequisicaoCCUSTO_DESTINO: TIntegerField;
    cdsRequisicaoSTATUS: TSmallintField;
    cdsRequisicaoDATA_EMISSAO: TDateField;
    cdsRequisicaoCANCEL_USUARIO: TIBStringField;
    cdsRequisicaoCANCEL_DATA: TDateTimeField;
    cdsRequisicaoCANCEL_MOTIVO: TMemoField;
    cdsRequisicaoCC_ORIGEM_DESC: TIBStringField;
    cdsRequisicaoCC_DESTINO_DESC: TIBStringField;
    lblCentroCustoDestino: TLabel;
    dbCentroCustoDestino: TDBEdit;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function CancelarRequisicaoAlmox(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

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
      cdsRequisicao.ParamByName('ano').AsShort        := Ano;
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
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

end.
