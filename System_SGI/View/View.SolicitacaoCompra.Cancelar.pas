unit View.SolicitacaoCompra.Cancelar;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UConstantesDGE,
  UGrPadrao,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,

  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinsDefaultPainters;

type
  TViewSolicitacaoCompraCancelar = class(TfrmGrPadrao)
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
    GrpBxCancelamento: TGroupBox;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    Bevel2: TBevel;
    dtsSolicitacao: TDataSource;
    pnlBotoes: TPanel;
    lblInforme: TLabel;
    Bevel3: TBevel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController : IControllerSolicitacaoCompra;
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
  ViewSolicitacaoCompraCancelar: TViewSolicitacaoCompraCancelar;

  function CancelarCOT(const AOwer : TComponent; aAno : Smallint; aNumero : Integer) : Boolean;

implementation

uses
  Service.Message,
  SGE.Controller.Factory;

{$R *.dfm}

function CancelarCOT(const AOwer : TComponent; aAno : Smallint; aNumero : Integer) : Boolean;
var
  AForm : TViewSolicitacaoCompraCancelar;
begin
  AForm := TViewSolicitacaoCompraCancelar.Create(AOwer);
  try
    with AForm do
    begin
      FController
        .DAO
        .Close
        .ClearWhere;

      FController
        .DAO
        .Where('s.ano     = :ano')
        .Where('s.codigo  = :codigo')
        .ParamsByName('ano',     aAno)
        .ParamsByName('codigo',  aNumero)
        .Open;

      TTabelaController
        .New
        .Tabela(dtsSolicitacao.DataSet)
        .Display('NUMERO',       'Solicitação', '###00000', TAlignment.taCenter, True)
        .Display('DATA_EMISSAO', 'Emissão',  'dd/mm/yyyy', TAlignment.taLeftJustify, True)
        .Display('VALIDADE',     'Validade', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
        .Configurar;

      dbCancelUsuario.Text  := FController.DAO.Usuario.Login;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewSolicitacaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewSolicitacaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if dtsSolicitacao.DataSet.IsEmpty then
    Exit;

  if Trim(dbMotivo.Lines.Text).IsEmpty then
  begin
    TServiceMessage.ShowWarning('Favor informar o motivo de cancelamento da solicitação');
    dbMotivo.SetFocus;
  end
  else
  if (Length(Trim(dbMotivo.Lines.Text)) < 15) then
  begin
    TServiceMessage.ShowWarning('Motivo de cancelamento da solicitação deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da solicitação?';

    Cont := TServiceMessage.ShowConfirm(sMsg);

    if Cont then
      with dtsSolicitacao.DataSet do
      begin
        Edit;

        dtsSolicitacao.DataSet.FieldByName('STATUS').AsInteger           := STATUS_SOLICITACAO_CAN;
        dtsSolicitacao.DataSet.FieldByName('CANCELADO_DATA').AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        dtsSolicitacao.DataSet.FieldByName('CANCELADO_USUARIO').AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        dtsSolicitacao.DataSet.FieldByName('CANCELADO_MOTIVO').AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TViewSolicitacaoCompraCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerFactory.New.SolicitacaoCompra;
  dtsSolicitacao.DataSet := FController.DAO.DataSet;
end;

procedure TViewSolicitacaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
