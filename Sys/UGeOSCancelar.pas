unit UGeOSCancelar;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBUpdateSQL, ExtCtrls, StdCtrls,
  Mask, DBCtrls, Buttons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.Menus, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, cxButtons;

type
  TfrmGeOSCancelar = class(TfrmGrPadrao)
    cdsOS: TIBDataSet;
    updOS: TIBUpdateSQL;
    dtsOS: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblCliente: TLabel;
    lblNFSe: TLabel;
    lblDataEmissao: TLabel;
    lblHoraEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbCliente: TDBEdit;
    dbNFSe: TDBEdit;
    dbDataEmissao: TDBEdit;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    lblCancelUsuario: TLabel;
    lblCancelDataHora: TLabel;
    lblMotivo: TLabel;
    dbMotivo: TMemo;
    dbCancelUsuario: TEdit;
    dbCancelDataHora: TEdit;
    lblInforme: TLabel;
    cdsOSANO: TSmallintField;
    cdsOSCONTROLE: TIntegerField;
    cdsOSEMPRESA: TIBStringField;
    cdsOSCLIENTE: TIntegerField;
    cdsOSDATA_CADASTRO: TDateTimeField;
    cdsOSDATA_EMISSAO: TDateField;
    cdsOSDATA_PREVISAO_CONCLUSAO: TDateField;
    cdsOSUSUARIO: TIBStringField;
    cdsOSVENDEDOR: TIntegerField;
    cdsOSSTATUS: TSmallintField;
    cdsOSOBSERVACOES: TMemoField;
    cdsOSRELATO_SOLICITACAO: TMemoField;
    cdsOSDADOS_ENTREGA: TMemoField;
    cdsOSTOTAL_SERVICO: TIBBCDField;
    cdsOSTOTAL_PRODUTO: TIBBCDField;
    cdsOSTOTAL_DESCONTOS_SERVICOS: TIBBCDField;
    cdsOSTOTAL_DESCONTOS_PRODUTOS: TIBBCDField;
    cdsOSTOTAL_DESCONTOS: TIBBCDField;
    cdsOSTOTAL_OS: TIBBCDField;
    cdsOSTOTAL_BRUTO: TIBBCDField;
    cdsOSTOTAL_LIQUIDO: TIBBCDField;
    cdsOSTOTAL_APROVADO_SERVICO: TIBBCDField;
    cdsOSTOTAL_APROVADO_PRODUTO: TIBBCDField;
    cdsOSDATA_APROVACAO: TDateField;
    cdsOSDATA_FINALIZACAO: TDateField;
    cdsOSDATA_FATURA: TDateField;
    cdsOSCOMPETENCIA: TIntegerField;
    cdsOSNFS_LOTE: TIBStringField;
    cdsOSNFS_SERIE: TIBStringField;
    cdsOSNFS_NUMERO: TIntegerField;
    cdsOSNFS_DATAEMISSAO: TDateField;
    cdsOSNFS_HORAEMISSAO: TTimeField;
    cdsOSNFS_CNAE: TIBStringField;
    cdsOSNFS_NCM: TIBStringField;
    cdsOSNFS_DESCRICAO_SERVICO: TMemoField;
    cdsOSNFS_ENVIADA: TSmallintField;
    cdsOSCAIXA_ANO: TSmallintField;
    cdsOSCAIXA_NUM: TIntegerField;
    cdsOSNUMERO: TIBStringField;
    cdsOSNFS: TIBStringField;
    cdsOSSTATUS_DESCRICAO: TIBStringField;
    cdsOSTOMADOR_PF: TSmallintField;
    cdsOSTOMADOR_CNPJ: TIBStringField;
    cdsOSTOMADOR_RAZAO: TIBStringField;
    cdsOSTOMADOR_FANTASIA: TIBStringField;
    cdsOSCANCEL_DATAHORA: TDateTimeField;
    cdsOSCANCEL_USUARIO: TIBStringField;
    cdsOSCANCEL_MOTIVO: TMemoField;
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    procedure btFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbMotivoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBOS
  - TBCLIENTE

  Views:
  - VW_STATUS_OS

  Procedures:

*)

  function CancelarOS(const AOwer : TComponent; pAno : Smallint; pNumero : Integer) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function CancelarOS(const AOwer : TComponent; pAno : Smallint; pNumero : Integer) : Boolean;
var
  AForm : TfrmGeOSCancelar;
begin
  AForm := TfrmGeOSCancelar.Create(AOwer);
  try
    with AForm do
    begin
      cdsOS.Close;
      cdsOS.ParamByName('ano').AsShort   := pAno;
      cdsOS.ParamByName('num').AsInteger := pNumero;
      cdsOS.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeOSCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeOSCancelar.btnCancelarClick(Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  if ( cdsOS.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da Ordem de Serviço');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da Ordem de Serviço deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    if ( cdsOSSTATUS.AsInteger = STATUS_OS_NFS ) then
      sMsg := 'Esta Ordem de Serviço possui Nota Fiscal Emitida e ao cancelar este registro a NFS-e será cancelada.'#13#13'Confirma o cancelamento da Ordem de Serviço?'
    else
      sMsg := 'Confirma o cancelamento da Ordem de Serviço?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      if ( cdsOSSTATUS.AsInteger = STATUS_OS_NFS ) then
      begin
        if not GetConectedInternet then
        begin
          ShowWarning('Estação de trabalho sem acesso a Internet!');
          Exit;
        end;

        if not GetEstacaoEmitiNFSe then
        begin
          ShowWarning('Estação de trabalho não habilitada para cancelar Ordem de Serviço/NFSe!');
          Exit;
        end;

        if not DMNFe.GetValidadeCertificado(cdsOSEMPRESA.AsString) then
          Exit;

        //lblInforme.Caption := 'Cancelando NFS-e junto a SEFA do Município. Aguarde . . . ';
        //Application.ProcessMessages;
        //
        //Cont := DMNFe.CancelarNFSeACBr( cdsVendaCODEMP.AsString, cdsVendaCODCLIENTE.AsInteger,
        //        cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger, UpperCase(Trim(dbMotivo.Lines.Text)) );
      end;

    if ( Cont ) then
      with cdsOS do
      begin
        Edit;

        cdsOSSTATUS.Value          := STATUS_OS_CAN;
        cdsOSCANCEL_DATAHORA.Value := StrToDateTime( Trim(dbCancelDataHora.Text) );
        cdsOSCANCEL_USUARIO.Value  := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsOSCANCEL_MOTIVO.Value   := UpperCase( Trim(dbMotivo.Lines.Text) );

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TfrmGeOSCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  lblInforme.Caption := EmptyStr;
end;

procedure TfrmGeOSCancelar.dbMotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Procedimento para bloquear caracteres especiais
  if (Ord(Key) >= 192) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeOSCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
