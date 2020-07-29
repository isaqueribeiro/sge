unit UGeVendaCancelar;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeVendaCancelar = class(TfrmGrPadrao)
    dtsVenda: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblCliente: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    lblHoraEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbCliente: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
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
    btnCancelar: TcxButton;
    btFechar: TcxButton;
    cdsVenda: TFDQuery;
    updVenda: TFDUpdateSQL;
    cdsVendaANO: TSmallintField;
    cdsVendaCODCONTROL: TIntegerField;
    cdsVendaCODEMP: TStringField;
    cdsVendaCODCLIENTE: TIntegerField;
    cdsVendaCODCLI: TStringField;
    cdsVendaDTVENDA: TSQLTimeStampField;
    cdsVendaSTATUS: TSmallintField;
    cdsVendaSERIE: TStringField;
    cdsVendaNFE: TLargeintField;
    cdsVendaLOTE_NFE_ANO: TSmallintField;
    cdsVendaLOTE_NFE_NUMERO: TIntegerField;
    cdsVendaNFE_ENVIADA: TSmallintField;
    cdsVendaNFE_DENEGADA: TSmallintField;
    cdsVendaDATAEMISSAO: TDateField;
    cdsVendaHORAEMISSAO: TTimeField;
    cdsVendaCANCEL_USUARIO: TStringField;
    cdsVendaCANCEL_DATAHORA: TSQLTimeStampField;
    cdsVendaCANCEL_MOTIVO: TMemoField;
    cdsVendaCFOP: TIntegerField;
    cdsVendaVERIFICADOR_NFE: TStringField;
    cdsVendaXML_NFE: TMemoField;
    cdsVendaNOME: TStringField;
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
  - TBVENDAS
  - TBCLIENTE

  Views:

  Procedures:

*)

var
  frmGeVendaCancelar: TfrmGeVendaCancelar;

  function CancelarVND(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;

implementation

uses UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function CancelarVND(const AOwer : TComponent; Ano : Smallint; Numero : Integer) : Boolean;
var
  frm : TfrmGeVendaCancelar;
begin
  frm := TfrmGeVendaCancelar.Create(AOwer);
  try
    with frm do
    begin
      cdsVenda.Close;
      cdsVenda.ParamByName('anovenda').AsInteger := Ano;
      cdsVenda.ParamByName('numvenda').AsInteger := Numero;
      cdsVenda.Open;

      dbCancelUsuario.Text  := GetUserApp;
      dbCancelDataHora.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', Now);

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeVendaCancelar.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeVendaCancelar.btnCancelarClick(Sender: TObject);
var
  sMsg : String;
  Cont : Boolean;
begin
  (*
    IMR - 09/09/2014 :
      Tratamento de excessão para notas fiscal emitidas, mas de forma denegada. Com  este bloco de código alterado, as vendas associdas a
      NF-e denegadas poderão ser canceladas, mas suas respectivas notas permanecerão ativas na SEFA.
  *)
  if ( cdsVenda.IsEmpty ) then
    Exit;

  if ( Trim(dbMotivo.Lines.Text) = EmptyStr ) then
  begin
    ShowWarning('Favor informar o motivo de cancelamento da venda');
    dbMotivo.SetFocus;
  end
  else
  if ( Length(Trim(dbMotivo.Lines.Text)) < 15 ) then
  begin
    ShowWarning('Motivo de cancelamento da venda deve possuir 15 caracteres no mínimo.');
    dbMotivo.SetFocus;
  end
  else
  begin
    if ( cdsVendaNFE_DENEGADA.AsInteger = 1 ) then
      sMsg := 'Esta venda possui Nota Fiscal de Saída Denegada e ao cancelar a venda a NF-e denegada permanecerá ativa na SEFA.'#13#13'Confirma o cancelamento da venda?'
    else
    if ( cdsVendaSTATUS.AsInteger = STATUS_VND_NFE ) then
      sMsg := 'Esta venda possui Nota Fiscal de Saída Emitida e ao cancelar a venda a NF-e será cancelada.'#13#13'Confirma o cancelamento da venda?'
    else
      sMsg := 'Confirma o cancelamento da venda?';

    Cont := ShowConfirm(sMsg);

    if ( Cont ) then
      if ( cdsVendaNFE_DENEGADA.AsInteger = 0 ) then
        if ( cdsVendaSTATUS.AsInteger = STATUS_VND_NFE ) then
        begin
          if not GetConectedInternet then
          begin
            ShowWarning('Estação de trabalho sem acesso a Internet!');
            Exit;
          end;

          if not GetEstacaoEmitiNFe(cdsVendaCODEMP.AsString) then
          begin
            ShowWarning('Estação de trabalho não habilitada para cancelar Venda/NFe!');
            Exit;
          end;

          if not DMNFe.GetValidadeCertificado(cdsVendaCODEMP.AsString) then
            Exit;

          lblInforme.Caption := 'Cancelando NF-e junto a SEFA. Aguarde . . . ';
          Application.ProcessMessages;

          Cont := DMNFe.CancelarNFeACBr( cdsVendaCODEMP.AsString, cdsVendaCODCLIENTE.AsInteger,
                  cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger, UpperCase(Trim(dbMotivo.Lines.Text)) );
        end;

    if ( Cont ) then
      with cdsVenda do
      begin
        Edit;

        cdsVendaSTATUS.Value          := STATUS_VND_CAN;
        cdsVendaCANCEL_USUARIO.Value  := UpperCase( Trim(dbCancelUsuario.Text) );
        cdsVendaCANCEL_MOTIVO.Value   := UpperCase( Trim(dbMotivo.Lines.Text) );
        cdsVendaCANCEL_DATAHORA.AsDateTime := StrToDateTimeDef( Trim(dbCancelDataHora.Text), Now );

        Post;
        ApplyUpdates;
        CommitUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TfrmGeVendaCancelar.FormCreate(Sender: TObject);
begin
  inherited;
  lblInforme.Caption := EmptyStr;
end;

procedure TfrmGeVendaCancelar.dbMotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Procedimento para bloquear caracteres especiais
  if (Ord(Key) >= 192) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeVendaCancelar.RegistrarRotinaSistema;
begin
  ;
end;

end.
