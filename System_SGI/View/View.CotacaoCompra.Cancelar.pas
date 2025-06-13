unit View.CotacaoCompra.Cancelar;

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
  TViewCotacaoCompraCancelar = class(TfrmGrPadrao)
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
    FController : IControllerCotacaoCompra;
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
  ViewCotacaoCompraCancelar: TViewCotacaoCompraCancelar;

  function CancelarCOT(const AOwer : TComponent; aAno : Smallint; aNumero : Integer; aEmpresa : String) : Boolean;

implementation

uses
  Service.Message,
  SGE.Controller.Factory;

{$R *.dfm}

function CancelarCOT(const AOwer : TComponent; aAno : Smallint; aNumero : Integer; aEmpresa : String) : Boolean;
var
  AForm : TViewCotacaoCompraCancelar;
begin
  AForm := TViewCotacaoCompraCancelar.Create(AOwer);
  try
    with AForm do
    begin
      FController
        .DAO
        .Close
        .ClearWhere;

      FController
        .DAO
        .Where('c.ano     = :ano')
        .Where('c.codigo  = :codigo')
        .Where('c.empresa = :empresa')
        .ParamsByName('ano',     aAno)
        .ParamsByName('codigo',  aNumero)
        .ParamsByName('empresa', aEmpresa)
        .Open;

      TTabelaController
        .New
        .Tabela(dtsCotacao.DataSet)
        .Display('NUMERO',       'Autorização', '###00000', TAlignment.taCenter, True)
        .Display('EMISSAO_DATA', 'Emissão',  'dd/mm/yyyy', TAlignment.taLeftJustify, True)
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

procedure TViewCotacaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewCotacaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if dtsCotacao.DataSet.IsEmpty then
    Exit;

  if Trim(dbMotivo.Lines.Text).IsEmpty then
  begin
    TServiceMessage.ShowWarning('Favor informar o motivo de cancelamento da cotação');
    dbMotivo.SetFocus;
  end
  else
  if (Trim(dbMotivo.Lines.Text).Length < 15) then
  begin
    TServiceMessage.ShowWarning('Motivo de cancelamento da cotação deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da cotação?';

    Cont := TServiceMessage.ShowConfirm(sMsg);

    if Cont then
      with dtsCotacao.DataSet do
      begin
        Edit;

        dtsCotacao.DataSet.FieldByName('STATUS').AsInteger           := STATUS_COTACAO_CAN;
        dtsCotacao.DataSet.FieldByName('CANCELADO_DATA').AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        dtsCotacao.DataSet.FieldByName('CANCELADO_USUARIO').AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        dtsCotacao.DataSet.FieldByName('CANCELADO_MOTIVO').AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TViewCotacaoCompraCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerFactory.New.CotacaoCompra;
  dtsCotacao.DataSet := FController.DAO.DataSet;
end;

procedure TViewCotacaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
