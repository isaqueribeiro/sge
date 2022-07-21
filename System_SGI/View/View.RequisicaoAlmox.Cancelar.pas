unit View.RequisicaoAlmox.Cancelar;

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
  TViewRequisicaoAlmoxCancelar = class(TfrmGrPadrao)
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
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController : IControllerRequisicaoAlmoxarifado;
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
  Service.Message,
  SGE.Controller.Factory;

{$R *.dfm}

function CancelarRequisicaoAlmox(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  AForm : TViewRequisicaoAlmoxCancelar;
begin
  AForm := TViewRequisicaoAlmoxCancelar.Create(AOwer);
  try
    with AForm do
    begin
      FController
        .DAO
        .Close
        .ClearWhere;

      FController
        .DAO
        .Where('r.ano      = :ano')
        .Where('r.controle = :codigo')
        .ParamsByName('ano',     Ano)
        .ParamsByName('codigo',  Numero)
        .Open;

      TTabelaController
        .New
        .Tabela(dtsRequisicao.DataSet)
        .Display('CONTROLE',     'Requisição', '###00000', TAlignment.taCenter, True)
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

procedure TViewRequisicaoAlmoxCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewRequisicaoAlmoxCancelar.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewRequisicaoAlmoxCancelar.btnCancelarClick(
  Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if dtsRequisicao.DataSet.IsEmpty then
    Exit;

  if (Trim(dbMotivo.Lines.Text) = EmptyStr) then
  begin
    TServiceMessage.ShowWarning('Favor informar o motivo de cancelamento da requisição');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    TServiceMessage.ShowWarning('Motivo de cancelamento da requisição deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    sMsg := 'Confirma o cancelamento da requisição?';

    Cont := TServiceMessage.ShowConfirm(sMsg);

    if Cont then
      with dtsRequisicao.DataSet do
      begin
        Edit;

        dtsRequisicao.DataSet.FieldByName('STATUS').AsInteger           := STATUS_REQUISICAO_ALMOX_CAN;
        dtsRequisicao.DataSet.FieldByName('CANCELADO_DATA').AsDateTime  := StrToDateTime( Trim(dbCancelDataHora.Text) );
        dtsRequisicao.DataSet.FieldByName('CANCELADO_USUARIO').AsString := UpperCase( Trim(dbCancelUsuario.Text) );
        dtsRequisicao.DataSet.FieldByName('CANCELADO_MOTIVO').AsString  := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TViewRequisicaoAlmoxCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerFactory.New.RequisicaoAlmoxarifado;
  dtsRequisicao.DataSet := FController.DAO.DataSet;
end;

end.
