unit UGeEntradaEstoqueGerarNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, DB, IBCustomDataSet, IBUpdateSQL, StdCtrls, Mask,
  DBCtrls, ExtCtrls, Buttons;

type
  TfrmGeEntradaEstoqueGerarNFe = class(TfrmGrPadrao)
    cdsCompra: TIBDataSet;
    updCompra: TIBUpdateSQL;
    dtsCompra: TDataSource;
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
    btnCalcular: TBitBtn;
    lblInforme: TLabel;
    cdsCompraANO: TSmallintField;
    cdsCompraCODCONTROL: TIntegerField;
    cdsCompraCODEMP: TIBStringField;
    cdsCompraCODFORN: TIntegerField;
    cdsCompraDTENT: TDateField;
    cdsCompraDTFINALIZACAO_COMPRA: TDateTimeField;
    cdsCompraDTEMISS: TDateField;
    cdsCompraNF: TIntegerField;
    cdsCompraSTATUS: TSmallintField;
    cdsCompraICMSBASE: TIBBCDField;
    cdsCompraICMSVALOR: TIBBCDField;
    cdsCompraICMSSUBSTBASE: TIBBCDField;
    cdsCompraICMSSUBSTVALOR: TIBBCDField;
    cdsCompraTOTALPROD: TIBBCDField;
    cdsCompraFRETE: TIBBCDField;
    cdsCompraVALORSEGURO: TIBBCDField;
    cdsCompraDESCONTO: TIBBCDField;
    cdsCompraVALORTOTAL_II: TIBBCDField;
    cdsCompraVALORTOTAL_IPI: TIBBCDField;
    cdsCompraVALORPIS: TIBBCDField;
    cdsCompraVALORCOFINS: TIBBCDField;
    cdsCompraOUTROSCUSTOS: TIBBCDField;
    cdsCompraTOTALNF: TIBBCDField;
    cdsCompraHREMISS: TTimeField;
    cdsCompraIPI: TIBBCDField;
    cdsCompraVALOR_TOTAL_IPI: TIBBCDField;
    cdsCompraVALOR_TOTAL_BRUTO: TIBBCDField;
    cdsCompraVALOR_TOTAL_DESCONTO: TIBBCDField;
    cdsCompraVALOR_TOTAL_LIQUIDO: TIBBCDField;
    cdsCompraVALOR_BASE_ICMS_NORMAL_ENTRADA: TIBBCDField;
    cdsCompraVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TIBBCDField;
    cdsCompraVALOR_BASE_ICMS_NORMAL_SAIDA: TIBBCDField;
    cdsCompraVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFloatField;
    cdsCompraVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFloatField;
    cdsCompraVALOR_TOTAL_PIS: TIBBCDField;
    cdsCompraVALOR_TOTAL_COFINS: TIBBCDField;
    cdsCompraNFSERIE: TIBStringField;
    TmrAlerta: TTimer;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TmrAlertaTimer(Sender: TObject);
  private
    { Private declarations }
    iSerieNFe,
    iNumeroNFe  : Integer;
    sFileNameXML ,
    sChaveNFE    ,
    sProtocoloNFE,
    sReciboNFE   : String;
    iNumeroLote  : Int64;
    procedure RecalcularTotalNota;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeEntradaEstoqueGerarNFe: TfrmGeEntradaEstoqueGerarNFe;

  function GerarNFeEntrada(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64) : Boolean;

implementation

uses UDMBusiness, UDMNFe, UFuncoes;

{$R *.dfm}

function GerarNFeEntrada(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64) : Boolean;
var
  frm : TfrmGeEntradaEstoqueGerarNFe;
begin
  frm := TfrmGeEntradaEstoqueGerarNFe.Create(AOwer);
  try
    with frm do
    begin
      cdsCompra.Close;
      cdsCompra.ParamByName('anoCompra').AsShort   := Ano;
      cdsCompra.ParamByName('numCompra').AsInteger := Numero;
      cdsCompra.Open;

      if ( not cdsCompra.IsEmpty ) then
      begin
        cdsCompra.Edit;

        cdsCompraICMSBASE.Value   := cdsCompraVALOR_BASE_ICMS_NORMAL_ENTRADA.AsCurrency;
        cdsCompraICMSVALOR.Value  := cdsCompraVALOR_TOTAL_ICMS_NORMAL_ENTRADA.AsCurrency;
        cdsCompraICMSSUBSTBASE.Value  := 0;
        cdsCompraICMSSUBSTVALOR.Value := 0;

//        cdsCompraNFE_VALOR_TOTAL_PRODUTO.Value   := cdsCompraVALOR_TOTAL_BRUTO.AsCurrency;
//        cdsCompraNFE_VALOR_FRETE.Value      := 0;
        cdsCompraVALORSEGURO.Value     := 0;
//        cdsCompraNFE_VALOR_DESCONTO.Value   := cdsCompraVALOR_TOTAL_DESCONTO.AsCurrency;
//        cdsCompraNFE_VALOR_OUTROS.Value     := 0;
        cdsCompraVALORTOTAL_IPI.Value  := cdsCompraIPI.AsCurrency;
        cdsCompraVALORPIS.Value        := cdsCompraVALOR_TOTAL_PIS.AsCurrency;
        cdsCompraVALORCOFINS.Value     := cdsCompraVALOR_TOTAL_COFINS.AsCurrency;
        cdsCompraVALORTOTAL_II.Value   := 0;

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
      end;
    end;
  finally
    frm.Free;
  end;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.RecalcularTotalNota;
begin
  if ( not cdsCompra.IsEmpty ) then
  begin
    if ( cdsCompra.State <> dsEdit ) then
      cdsCompra.Edit;

      cdsCompraDTEMISS.Value := Date;
      cdsCompraHREMISS.Value := Time;

//    cdsCompraTOTALNF.AsCurrency := cdsCompraTOTALVENDA.AsCurrency + cdsCompraNFE_VALOR_ICMS_SUBST.AsCurrency + cdsCompraNFE_VALOR_FRETE.AsCurrency +
//                                   cdsCompraNFE_VALOR_SEGURO.AsCurrency + cdsCompraNFE_VALOR_OUTROS.AsCurrency;
  end;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.btnCalcularClick(Sender: TObject);
begin
  RecalcularTotalNota;
  if ( (dbTotalNota.Visible) and (dbTotalNota.Enabled) ) then
    dbTotalNota.SetFocus;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.btnConfirmarClick(Sender: TObject);
var
  bOK : Boolean;
begin
  if not GetConectedInternet then
  begin
    ShowWarning('Estação de trabalho sem acesso a Internet!');
    Exit;
  end;

  if ( ShowConfirm('Confirma a geração da NF-e de Entrada?') ) then
  begin
    if ( cdsCompra.State = dsEdit ) then
    begin
      cdsCompra.Post;
      cdsCompra.ApplyUpdates;
      CommitTransaction;
    end;

    lblInforme.Visible := True;
    lblInforme.Caption := 'Gerando NF-e junto a SEFA. Aguarde . . . ';
    TmrAlerta.Enabled  := True;
    
    Application.ProcessMessages;
    
    if ( DMNFe.GerarNFeOnLine ) then
      bOK := DMNFe.GerarNFeEntradaOnLineACBr ( cdsCompraCODEMP.AsString, cdsCompraCODFORN.AsInteger, cdsCompraANO.AsInteger, cdsCompraCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote, False)
    else
      bOK := DMNFe.GerarNFeEntradaOffLineACBr( cdsCompraCODEMP.AsString, cdsCompraCODFORN.AsInteger, cdsCompraANO.AsInteger, cdsCompraCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE, False);

    TmrAlerta.Enabled  := False;
    lblInforme.Visible := False;

    if ( bOK ) then
      ModalResult := mrOk;
  end;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.FormCreate(Sender: TObject);
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

procedure TfrmGeEntradaEstoqueGerarNFe.TmrAlertaTimer(Sender: TObject);
begin
  lblInforme.Visible := not lblInforme.Visible;
end;

procedure TfrmGeEntradaEstoqueGerarNFe.RegistrarRotinaSistema;
begin
  ;
end;

end.
