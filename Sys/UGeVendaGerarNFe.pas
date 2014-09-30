unit UGeVendaGerarNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBUpdateSQL, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons;

type
  TfrmGeVendaGerarNFe = class(TfrmGrPadrao)
    cdsVenda: TIBDataSet;
    updVenda: TIBUpdateSQL;
    dtsVenda: TDataSource;
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDataHora: TLabel;
    lblSerie: TLabel;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDataHora: TDBEdit;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    dbDataEmissao: TDBEdit;
    lblHoraEmissao: TLabel;
    dbHoraEmissao: TDBEdit;
    Bevel1: TBevel;
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    lblBaseICMS: TLabel;
    dbBaseICMS: TDBEdit;
    lblValorICMS: TLabel;
    dbValorICMS: TDBEdit;
    lblBaseICMSSubs: TLabel;
    dbBaseICMSSubs: TDBEdit;
    lblValorICMSSubs: TLabel;
    dbValorICMSSubs: TDBEdit;
    lblValorPIS: TLabel;
    dbValorPIS: TDBEdit;
    lblTotalProduto: TLabel;
    dbTotalProduto: TDBEdit;
    lblFrete: TLabel;
    dbFrete: TDBEdit;
    lblSeguro: TLabel;
    dbSeguro: TDBEdit;
    lblDesconto: TLabel;
    dbDesconto: TDBEdit;
    lblOutrasDespesas: TLabel;
    dbOutrasDespesas: TDBEdit;
    lblValorIPI: TLabel;
    dbValorIPI: TDBEdit;
    lblValorCOFINS: TLabel;
    dbValorCOFINS: TDBEdit;
    lblTotalNota: TLabel;
    dbTotalNota: TDBEdit;
    cdsVendaANO: TSmallintField;
    cdsVendaCODCONTROL: TIntegerField;
    cdsVendaDTVENDA: TDateTimeField;
    cdsVendaDTFINALIZACAO_VENDA: TDateField;
    cdsVendaDATAEMISSAO: TDateField;
    cdsVendaHORAEMISSAO: TTimeField;
    cdsVendaTOTALVENDA: TIBBCDField;
    cdsVendaSERIE: TIBStringField;
    cdsVendaNFE: TLargeintField;
    cdsVendaSTATUS: TSmallintField;
    btnCalcular: TBitBtn;
    cdsVendaCODEMP: TIBStringField;
    cdsVendaCODCLI: TIBStringField;
    lblInforme: TLabel;
    cdsVendaDESCONTO: TIBBCDField;
    cdsVendaTOTALVENDA_BRUTA: TIBBCDField;
    TmrAlerta: TTimer;
    edDataHoraSaida: TMaskEdit;
    lblDataHoraSaida: TLabel;
    cdsVendaCODCLIENTE: TIntegerField;
    cdsVendaNFE_VALOR_BASE_ICMS: TIBBCDField;
    cdsVendaNFE_VALOR_ICMS: TIBBCDField;
    cdsVendaNFE_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    cdsVendaNFE_VALOR_ICMS_SUBST: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_PRODUTO: TIBBCDField;
    cdsVendaNFE_VALOR_FRETE: TIBBCDField;
    cdsVendaNFE_VALOR_SEGURO: TIBBCDField;
    cdsVendaNFE_VALOR_DESCONTO: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_II: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_IPI: TIBBCDField;
    cdsVendaNFE_VALOR_PIS: TIBBCDField;
    cdsVendaNFE_VALOR_COFINS: TIBBCDField;
    cdsVendaNFE_VALOR_OUTROS: TIBBCDField;
    cdsVendaNFE_VALOR_TOTAL_NOTA: TIBBCDField;
    cdsVendaVALOR_TOTAL_IPI: TIBBCDField;
    cdsVendaVALOR_TOTAL_BRUTO: TIBBCDField;
    cdsVendaVALOR_TOTAL_DESCONTO: TIBBCDField;
    cdsVendaVALOR_TOTAL_LIQUIDO: TIBBCDField;
    cdsVendaVALOR_BASE_ICMS_NORMAL_ENTRADA: TFMTBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TFMTBCDField;
    cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA: TIBBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFMTBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFMTBCDField;
    cdsVendaVALOR_TOTAL_PIS: TIBBCDField;
    cdsVendaVALOR_TOTAL_COFINS: TIBBCDField;
    cdsVendaNFE_DENEGADA: TSmallintField;
    cdsVendaNFE_DENEGADA_MOTIVO: TIBStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrAlertaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iSerieNFe,
    iNumeroNFe  : Integer;
    sFileNameXML ,
    sChaveNFE    ,
    sProtocoloNFE,
    sReciboNFE   : String;
    iNumeroLote  : Int64;
    bDenegada    : Boolean;
    sDenegadaMotivo : String;
    procedure RecalcularTotalNota;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaGerarNFe: TfrmGeVendaGerarNFe;

  function GerarNFe(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64;
    var Mensagem : String) : Boolean;

implementation

uses UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function GerarNFe(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64;
  var Mensagem : String) : Boolean;
var
  frm : TfrmGeVendaGerarNFe;
begin
  frm := TfrmGeVendaGerarNFe.Create(AOwer);
  try
    with frm do
    begin
      edDataHoraSaida.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', GetDateTimeDB);

      cdsVenda.Close;
      cdsVenda.ParamByName('anovenda').AsShort   := Ano;
      cdsVenda.ParamByName('numvenda').AsInteger := Numero;
      cdsVenda.Open;

      lblDataEmissao.Visible := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      dbDataEmissao.Visible  := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      lblHoraEmissao.Visible := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      dbHoraEmissao.Visible  := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      lblDataHoraSaida.Visible := GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      edDataHoraSaida.Visible  := GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );

      if ( not cdsVenda.IsEmpty ) then
      begin
        cdsVenda.Edit;

        cdsVendaNFE_VALOR_BASE_ICMS.Value := cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA.AsCurrency;
        cdsVendaNFE_VALOR_ICMS.Value      := cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA.AsCurrency;
        cdsVendaNFE_VALOR_BASE_ICMS_SUBST.Value := 0;
        cdsVendaNFE_VALOR_ICMS_SUBST.Value      := 0;
        cdsVendaNFE_VALOR_TOTAL_PRODUTO.Value   := cdsVendaTOTALVENDA_BRUTA.AsCurrency;
        cdsVendaNFE_VALOR_FRETE.Value      := 0;
        cdsVendaNFE_VALOR_SEGURO.Value     := 0;
        cdsVendaNFE_VALOR_DESCONTO.Value   := cdsVendaVALOR_TOTAL_DESCONTO.AsCurrency;
        cdsVendaNFE_VALOR_OUTROS.Value     := 0;
        cdsVendaNFE_VALOR_TOTAL_IPI.Value  := cdsVendaVALOR_TOTAL_IPI.AsCurrency;
        cdsVendaNFE_VALOR_PIS.Value        := cdsVendaVALOR_TOTAL_PIS.AsCurrency;
        cdsVendaNFE_VALOR_COFINS.Value     := cdsVendaVALOR_TOTAL_COFINS.AsCurrency;
        cdsVendaNFE_VALOR_TOTAL_II.Value   := 0;

        RecalcularTotalNota;
      end;

      Result := (ShowModal = mrOk);

      if ( Result ) then
      begin
        SerieNFe     := iSerieNFe;
        NumeroNFe    := iNumeroNFe;
        FileNameXML  := sFileNameXML;
        ChaveNFE     := sChaveNFE;
        ProtocoloNFE := sProtocoloNFE;
        ReciboNFE    := sReciboNFE;
        NumeroLote   := iNumeroLote;
        Mensagem     := Trim(sDenegadaMotivo);
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeVendaGerarNFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeVendaGerarNFe.RecalcularTotalNota;
begin
  if ( not cdsVenda.IsEmpty ) then
  begin
    if ( cdsVenda.State <> dsEdit ) then
      cdsVenda.Edit;

      cdsVendaDATAEMISSAO.Value := Date;
      cdsVendaHORAEMISSAO.Value := Time;

    cdsVendaNFE_VALOR_TOTAL_NOTA.AsCurrency := cdsVendaTOTALVENDA.AsCurrency + cdsVendaNFE_VALOR_ICMS_SUBST.AsCurrency + cdsVendaNFE_VALOR_FRETE.AsCurrency +
                                               cdsVendaNFE_VALOR_SEGURO.AsCurrency + cdsVendaNFE_VALOR_OUTROS.AsCurrency;
  end;
end;

procedure TfrmGeVendaGerarNFe.btnCalcularClick(Sender: TObject);
begin
  RecalcularTotalNota;
  if ( (dbTotalNota.Visible) and (dbTotalNota.Enabled) ) then
    dbTotalNota.SetFocus;
end;

procedure TfrmGeVendaGerarNFe.btnConfirmarClick(Sender: TObject);
var
  bOK : Boolean;
  sDH : String;
begin
(*
  IMR - 09/09/2014 :
    Declaração dos campos referidos a NF-e DENEGADA para que estas informações possam ser gravadas na tabela de venda a apartir dela
    bloquear o cancelamento da venda/nota.
*)

  bOK := False;
  
  if not GetConectedInternet then
  begin
    ShowWarning('Estação de trabalho sem acesso a Internet!');
    Exit;
  end;

  if ( ShowConfirm('Confirma a geração da NF-e?') ) then
  begin
    sDH := FormatDateTime('dd/mm/yyyy', cdsVendaDATAEMISSAO.AsDateTime) + ' ' +
      FormatDateTime('hh:mm:ss', cdsVendaHORAEMISSAO.AsDateTime);

    // Validar Data/Hora de saída na NF-e
    if edDataHoraSaida.Visible then
    begin
      if not StrIsDateTime(edDataHoraSaida.Text) then
      begin
        ShowWarning('Data/Hora de saída inválida!');
        edDataHoraSaida.SetFocus;
        Exit;
      end
      else
      if ( StrToDateTime(edDataHoraSaida.Text) < StrToDateTime(sDH) ) then
      begin
        ShowWarning('Data/Hora de saída não pode ser menor que da Data/Hora de emissão da NF-e!');
        edDataHoraSaida.SetFocus;
        Exit;
      end;
    end;

    if ( cdsVenda.State = dsEdit ) then
    begin
      cdsVenda.Post;
      cdsVenda.ApplyUpdates;
      CommitTransaction;
    end;

    lblInforme.Visible := True;
    lblInforme.Caption := 'Gerando NF-e junto a SEFA. Aguarde . . . ';
    TmrAlerta.Enabled  := True;

    Application.ProcessMessages;

    if edDataHoraSaida.Visible then
      sDH := edDataHoraSaida.Text
    else
      sDH := EmptyStr;

    bDenegada       := False;
    sDenegadaMotivo := EmptyStr;

    if ( DMNFe.GerarNFeOnLine ) then
      bOK := DMNFe.GerarNFeOnLineACBr ( cdsVendaCODEMP.AsString, cdsVendaCODCLIENTE.AsInteger, sDH,
               cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote, bDenegada, sDenegadaMotivo, False)
    else
      bOK := DMNFe.GerarNFeOffLineACBr( cdsVendaCODEMP.AsString, cdsVendaCODCLIENTE.AsInteger, sDH,
               cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, False);


    if bDenegada then
    begin
      cdsVenda.Edit;

      cdsVendaNFE_DENEGADA.AsInteger       := 1;
      cdsVendaNFE_DENEGADA_MOTIVO.AsString := AnsiUpperCase(Trim(sDenegadaMotivo));

      cdsVenda.Post;
      cdsVenda.ApplyUpdates;
      CommitTransaction;
    end;

    TmrAlerta.Enabled  := False;
    lblInforme.Visible := False;

    if ( bOK ) then
      ModalResult := mrOk;
  end;
end;

procedure TfrmGeVendaGerarNFe.FormCreate(Sender: TObject);
begin
  inherited;
  iSerieNFe     := 0;
  iNumeroNFe    := 0;
  sFileNameXML  := EmptyStr;
  sChaveNFE     := EmptyStr;
  sProtocoloNFE := EmptyStr;
  sReciboNFE    := EmptyStr;
  iNumeroLote   := 0;
  lblInforme.Caption := EmptyStr;
end;

procedure TfrmGeVendaGerarNFe.TmrAlertaTimer(Sender: TObject);
begin
  lblInforme.Visible := not lblInforme.Visible;
end;

procedure TfrmGeVendaGerarNFe.FormShow(Sender: TObject);
begin
  inherited;
  if ( edDataHoraSaida.Visible and edDataHoraSaida.Enabled ) then
    edDataHoraSaida.SetFocus;
end;

procedure TfrmGeVendaGerarNFe.RegistrarRotinaSistema;
begin
  ;
end;

end.
