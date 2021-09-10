unit View.AutorizacaoCompra.Cancelar;

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
  Controller.Tabela;

type
  TViewAutorizacaoCompraCancelar = class(TfrmGrPadrao)
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
    GrpBxTexto: TGroupBox;
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
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    Bevel3: TBevel;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController : IControllerAutorizacaoCompra;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBAUTORIZA_COMPRA
  - TBFORNECEDOR

  Views:

  Procedures:
*)

  function CancelarAUT(const AOwer : TComponent; aAno : Smallint; aNumero : Integer; aEmpresa : String) : Boolean;

implementation

uses
  Service.Message,
  SGE.Controller.Factory;

{$R *.dfm}

function CancelarAUT(const AOwer : TComponent; aAno : Smallint; aNumero : Integer; aEmpresa : String) : Boolean;
var
  frm : TViewAutorizacaoCompraCancelar;
begin
  frm := TViewAutorizacaoCompraCancelar.Create(AOwer);
  try
    with frm do
    begin
      FController
        .DAO
        .Close
        .ClearWhere;

      FController
        .DAO
        .Where('a.ano     = :ano')
        .Where('a.codigo  = :codigo')
        .Where('a.empresa = :empresa')
        .ParamsByName('ano',     aAno)
        .ParamsByName('codigo',  aNumero)
        .ParamsByName('empresa', aEmpresa)
        .Open;

      TTabelaController
        .New
        .Tabela(dtsAutorizacao.DataSet)
        .Display('NUMERO',       'Autorização', '###00000', TAlignment.taCenter, True)
        .Display('EMISSAO_DATA', 'Emissão',  'dd/mm/yyyy', TAlignment.taLeftJustify, True)
        .Display('VALIDADE',     'Validade', 'dd/mm/yyyy', TAlignment.taLeftJustify, True)
        .Configurar;

      dbCancelUsuario.Text  := FController.DAO.Usuario.Login;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TViewAutorizacaoCompraCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewAutorizacaoCompraCancelar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewAutorizacaoCompraCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if dtsAutorizacao.DataSet.IsEmpty then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    TServiceMessage.ShowWarning('Favor informar o motivo de cancelamento da autorização');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    TServiceMessage.ShowWarning('Motivo de cancelamento da autorização deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da autorização?';

    Cont := TServiceMessage.ShowConfirm(sMsg);

    if Cont then
      with dtsAutorizacao.DataSet do
      begin
        Edit;

        dtsAutorizacao.DataSet.FieldByName('STATUS').AsInteger           := STATUS_AUTORIZACAO_CAN;
        dtsAutorizacao.DataSet.FieldByName('CANCELADO_DATA').AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        dtsAutorizacao.DataSet.FieldByName('CANCELADO_USUARIO').AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        dtsAutorizacao.DataSet.FieldByName('CANCELADO_MOTIVO').AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TViewAutorizacaoCompraCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerFactory.New.AutorizacaoCompra;
  dtsAutorizacao.DataSet := FController.DAO.DataSet;
end;

end.
