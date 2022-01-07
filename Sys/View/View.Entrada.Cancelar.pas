unit View.Entrada.Cancelar;

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
  Datasnap.DBClient,
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UGrPadrao,
  SGE.Controller.Interfaces, dxSkinsDefaultPainters;

type
  TViewEntradaEstoqueCancelar = class(TfrmGrPadrao)
    dtsEntrada: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblFornecedor: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEntrada: TLabel;
    dbCodigo: TDBEdit;
    dbFornecedor: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEntrada: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    lblTotalNota: TLabel;
    dbTotalNota: TDBEdit;
    lblInforme: TLabel;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController : IControllerCustom;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCOMPRAS
  - TBFORNECEDOR

  Views:

  Procedures:

*)

  function CancelarENT(const AOwer : TComponent; Ano : Smallint; Numero : Integer; Empresa : String) : Boolean;

implementation

uses
    Controller.Tabela
  , UConstantesDGE
  , UDMNFe
  , UFuncoes
  , SGE.Controller.Factory
  , Service.Message;

{$R *.dfm}

function CancelarENT(const AOwer : TComponent; Ano : Smallint; Numero : Integer; Empresa : String) : Boolean;
var
  AForm : TViewEntradaEstoqueCancelar;
begin
  AForm := TViewEntradaEstoqueCancelar.Create(AOwer);
  try
    with AForm do
    begin
      FController.DAO.ClearWhere;
      FController
        .DAO
        .Where('c.ano        = :ano')
        .Where('c.Codcontrol = :controle')
        .Where('c.Codemp     = :empresa')
        .ParamsByName('ano',      Ano)
        .ParamsByName('controle', Numero)
        .ParamsByName('empresa',  Empresa)
        .Open;

      dbCancelUsuario.Text  := FController.DAO.Usuario.Login;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      TTabelaController
        .New
        .Tabela(dtsEntrada.DataSet)
        .Display('CODCONTROL', 'No. Entrada', '###0000000', TAlignment.taCenter, True)
        .Display('NFSERIE', 'Série', TAlignment.taCenter, False)
        .Display('TOTALNF', 'Total Nota Fiscal', ',0.00', TAlignment.taRightJustify)
        .Configurar;

      Result := (ShowModal = mrOk);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TViewEntradaEstoqueCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEntradaEstoqueCancelar.btnCancelarClick(Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( dtsEntrada.DataSet.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    TServiceMessage.ShowWarning('Favor informar o motivo de cancelamento da entrada');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    TServiceMessage.ShowWarning('Motivo de cancelamento da compra deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    if (dtsEntrada.DataSet.FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) then
      sMsg := 'Esta compra possui Nota Fiscal de Entrada Emitida e ao cancelar a compra a NF-e será cancelada.'#13#13'Confirma o cancelamento da compra?'
    else
      sMsg := 'Confirma o cancelamento da compra?';

    Cont := TServiceMessage.ShowConfirm(sMsg);

    if Cont then
      if (dtsEntrada.DataSet.FieldByName('STATUS').AsInteger = STATUS_CMP_NFE) then
      begin
        if not GetConectedInternet then
        begin
          TServiceMessage.ShowWarning('Estação de trabalho sem acesso a Internet!');
          Exit;
        end;

        if not DMNFe.GetValidadeCertificado(dtsEntrada.DataSet.FieldByName('CODEMP').AsString) then
          Exit;

        lblInforme.Caption := 'Cancelando NF-e junto a SEFA. Aguarde . . . ';
        Application.ProcessMessages;

        Cont := DMNFe.CancelarNFeEntradaACBr(
            dtsEntrada.DataSet.FieldByName('CODEMP').AsString
          , dtsEntrada.DataSet.FieldByName('CODFORN').AsInteger
          , dtsEntrada.DataSet.FieldByName('ANO').AsInteger
          , dtsEntrada.DataSet.FieldByName('CODCONTROL').AsInteger
          , UpperCase(Trim(dbMotivo.Lines.Text))
        );
      end;

    if Cont then
      with dtsEntrada.DataSet do
      begin
        Edit;

        FieldByName('STATUS').AsInteger           := STATUS_CMP_CAN;
        FieldByName('CANCEL_DATAHORA').AsDateTime := StrToDateTime( Trim(dbCancelDataHora.Text) );
        FieldByName('CANCEL_USUARIO').AsString    := UpperCase( Trim(dbCancelUsuario.Text) );
        FieldByName('CANCEL_MOTIVO').AsString     := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;

        FController.DAO.ApplyUpdates;
        FController.DAO.CommitUpdates;
        FController.DAO.CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TViewEntradaEstoqueCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  FController := TControllerFactory.New.Entrada;
  dtsEntrada.DataSet := FController.DAO.DataSet;
end;

procedure TViewEntradaEstoqueCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
