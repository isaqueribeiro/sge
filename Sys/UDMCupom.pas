unit UDMCupom;

interface

uses
  Interacao.Versao,
  Controller.Versao,
  UFuncoes,
  UEcfFactory,
  UGeConfigurarNFeACBr,
  SHDocVw,

  Windows, SysUtils, Classes, ACBrNFeDANFEClass, ACBrNFe, DB,
  frxExportPDF, frxExportMail, frxDesgn, frxRich, frxCross, frxChart, frxExportImage,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  ACBrUtil, pcnConversao, pcnNFeW, pcnNFeRTXT, pcnAuxiliar, ACBrBase, ACBrBoleto, ACBrBoletoFCFR,
  ACBrValidador;

type
  TDMCupom = class(TDataModule)
    qryCFOP: TFDQuery;
    FDQuery2: TFDQuery;
    qryProduto: TFDQuery;
    qryUltimoVenda: TFDQuery;
    cdsVendaTitulo: TFDQuery;
    cdsVendaNFCe: TFDQuery;
    updVendaNFCe: TFDUpdateSQL;
    cdsVendaVolume: TFDQuery;
    updVendaVolume: TFDUpdateSQL;
    cdsVendaNFCeEMPRESA: TStringField;
    cdsVendaNFCeANOVENDA: TSmallintField;
    cdsVendaNFCeNUMVENDA: TIntegerField;
    cdsVendaNFCeDATAEMISSAO: TDateField;
    cdsVendaNFCeHORAEMISSAO: TTimeField;
    cdsVendaNFCeSERIE: TStringField;
    cdsVendaNFCeNUMERO: TIntegerField;
    cdsVendaNFCeNFC_NUMERO: TIntegerField;
    cdsVendaNFCeMODELO: TSmallintField;
    cdsVendaNFCeVERSAO: TSmallintField;
    cdsVendaNFCeCHAVE: TStringField;
    cdsVendaNFCePROTOCOLO: TStringField;
    cdsVendaNFCeRECIBO: TStringField;
    cdsVendaNFCeXML_FILENAME: TStringField;
    cdsVendaNFCeXML_FILE: TMemoField;
    cdsVendaNFCeLOTE_ANO: TSmallintField;
    cdsVendaNFCeLOTE_NUM: TIntegerField;
    cdsVendaVolumeANO_VENDA: TSmallintField;
    cdsVendaVolumeCONTROLE_VENDA: TIntegerField;
    cdsVendaVolumeSEQUENCIAL: TSmallintField;
    cdsVendaVolumeNUMERO: TStringField;
    cdsVendaVolumeQUANTIDADE: TSmallintField;
    cdsVendaVolumeESPECIE: TStringField;
    cdsVendaVolumeMARCA: TStringField;
    cdsVendaVolumePESO_BRUTO: TBCDField;
    cdsVendaVolumePESO_LIQUIDO: TBCDField;
    cdsVendaFormaPagto: TFDQuery;
    updVendaFormaPagto: TFDUpdateSQL;
    cdsVendaFormaPagtoANO_VENDA: TSmallintField;
    cdsVendaFormaPagtoCONTROLE_VENDA: TIntegerField;
    cdsVendaFormaPagtoFORMAPAGTO_COD: TSmallintField;
    cdsVendaFormaPagtoCONDICAOPAGTO_COD: TSmallintField;
    cdsVendaFormaPagtoVENDA_PRAZO: TSmallintField;
    cdsVendaFormaPagtoVALOR_FPAGTO: TBCDField;
    cdsVendaFormaPagtoVALOR_RECEBIDO: TBCDField;
    cdsVendaFormaPagtoPRAZO_01: TSmallintField;
    cdsVendaFormaPagtoPRAZO_02: TSmallintField;
    cdsVendaFormaPagtoPRAZO_03: TSmallintField;
    cdsVendaFormaPagtoPRAZO_04: TSmallintField;
    cdsVendaFormaPagtoPRAZO_05: TSmallintField;
    cdsVendaFormaPagtoPRAZO_06: TSmallintField;
    cdsVendaFormaPagtoPRAZO_07: TSmallintField;
    cdsVendaFormaPagtoPRAZO_08: TSmallintField;
    cdsVendaFormaPagtoPRAZO_09: TSmallintField;
    cdsVendaFormaPagtoPRAZO_10: TSmallintField;
    cdsVendaFormaPagtoPRAZO_11: TSmallintField;
    cdsVendaFormaPagtoPRAZO_12: TSmallintField;
    cdsVendaFormaPagtoFORMAPAGTO_DESCRICAO: TStringField;
    cdsVendaFormaPagtoCONDICAOPAGTO_DESCRICAO: TStringField;
    cdsVendaFormaPagtoValorTroco: TCurrencyField;
    cdsVendaItem: TFDQuery;
    updVendaItem: TFDUpdateSQL;
    cdsVendaItemANO: TSmallintField;
    cdsVendaItemCODCONTROL: TIntegerField;
    cdsVendaItemSEQ: TSmallintField;
    cdsVendaItemCODPROD: TStringField;
    cdsVendaItemCODEMP: TStringField;
    cdsVendaItemCODCLI: TStringField;
    cdsVendaItemCODCLIENTE: TIntegerField;
    cdsVendaItemCODVENDEDOR: TIntegerField;
    cdsVendaItemDTVENDA: TSQLTimeStampField;
    cdsVendaItemQTDE: TBCDField;
    cdsVendaItemPUNIT: TBCDField;
    cdsVendaItemPUNIT_PROMOCAO: TBCDField;
    cdsVendaItemDESCONTO: TBCDField;
    cdsVendaItemDESCONTO_VALOR: TBCDField;
    cdsVendaItemPFINAL: TBCDField;
    cdsVendaItemQTDEFINAL: TBCDField;
    cdsVendaItemUNID_COD: TSmallintField;
    cdsVendaItemCFOP_COD: TIntegerField;
    cdsVendaItemCST: TStringField;
    cdsVendaItemCSOSN: TStringField;
    cdsVendaItemALIQUOTA: TBCDField;
    cdsVendaItemALIQUOTA_CSOSN: TBCDField;
    cdsVendaItemALIQUOTA_PIS: TBCDField;
    cdsVendaItemALIQUOTA_COFINS: TBCDField;
    cdsVendaItemVALOR_IPI: TBCDField;
    cdsVendaItemPERCENTUAL_REDUCAO_BC: TBCDField;
    cdsVendaItemTOTAL_BRUTO: TBCDField;
    cdsVendaItemTOTAL_DESCONTO: TBCDField;
    cdsVendaItemTOTAL_LIQUIDO: TBCDField;
    cdsVendaItemDESCRI: TStringField;
    cdsVendaItemESTOQUE: TBCDField;
    cdsVendaItemRESERVA: TBCDField;
    cdsVendaItemUNP_SIGLA: TStringField;
    cdsVendaItemCFOP_DESCRICAO: TStringField;
    cdsVendaItemCST_PRODUTO: TStringField;
    cdsVendaItemCSOSN_PRODUTO: TStringField;
    cdsVendaItemMOVIMENTA_ESTOQUE: TSmallintField;
    cdsVenda: TFDQuery;
    updVenda: TFDUpdateSQL;
    cdsVendaANO: TSmallintField;
    cdsVendaCODCONTROL: TIntegerField;
    cdsVendaCODEMP: TStringField;
    cdsVendaCODCLIENTE: TIntegerField;
    cdsVendaCODCLI: TStringField;
    cdsVendaDTVENDA: TSQLTimeStampField;
    cdsVendaSTATUS: TSmallintField;
    cdsVendaTOTALVENDA_BRUTA: TBCDField;
    cdsVendaDESCONTO: TBCDField;
    cdsVendaDESCONTO_CUPOM: TBCDField;
    cdsVendaTOTALVENDA: TBCDField;
    cdsVendaDTFINALIZACAO_VENDA: TDateField;
    cdsVendaOBS: TMemoField;
    cdsVendaFORMAPAG: TStringField;
    cdsVendaFATDIAS: TSmallintField;
    cdsVendaSERIE: TStringField;
    cdsVendaNFE: TLargeintField;
    cdsVendaLOTE_NFE_ANO: TSmallintField;
    cdsVendaLOTE_NFE_NUMERO: TIntegerField;
    cdsVendaLOTE_NFE_RECIBO: TStringField;
    cdsVendaNFE_ENVIADA: TSmallintField;
    cdsVendaNFE_DENEGADA: TSmallintField;
    cdsVendaNFE_DENEGADA_MOTIVO: TStringField;
    cdsVendaDATAEMISSAO: TDateField;
    cdsVendaHORAEMISSAO: TTimeField;
    cdsVendaCANCEL_DATAHORA: TSQLTimeStampField;
    cdsVendaCANCEL_MOTIVO: TMemoField;
    cdsVendaCFOP: TIntegerField;
    cdsVendaVERIFICADOR_NFE: TStringField;
    cdsVendaXML_NFE_FILENAME: TStringField;
    cdsVendaXML_NFE: TMemoField;
    cdsVendaVENDEDOR_COD: TIntegerField;
    cdsVendaUSUARIO: TStringField;
    cdsVendaFORMAPAGTO_COD: TSmallintField;
    cdsVendaCONDICAOPAGTO_COD: TSmallintField;
    cdsVendaVENDA_PRAZO: TSmallintField;
    cdsVendaPRAZO_01: TSmallintField;
    cdsVendaPRAZO_02: TSmallintField;
    cdsVendaPRAZO_03: TSmallintField;
    cdsVendaPRAZO_04: TSmallintField;
    cdsVendaPRAZO_05: TSmallintField;
    cdsVendaPRAZO_06: TSmallintField;
    cdsVendaPRAZO_07: TSmallintField;
    cdsVendaPRAZO_08: TSmallintField;
    cdsVendaPRAZO_09: TSmallintField;
    cdsVendaPRAZO_10: TSmallintField;
    cdsVendaPRAZO_11: TSmallintField;
    cdsVendaPRAZO_12: TSmallintField;
    cdsVendaNFE_MODALIDADE_FRETE: TSmallintField;
    cdsVendaNFE_TRANSPORTADORA: TIntegerField;
    cdsVendaNFE_PLACA_VEICULO: TStringField;
    cdsVendaNFE_PLACA_UF: TStringField;
    cdsVendaNFE_PLACA_RNTC: TStringField;
    cdsVendaNFE_VALOR_TOTAL_PRODUTO: TBCDField;
    cdsVendaNFE_VALOR_DESCONTO: TBCDField;
    cdsVendaNFE_VALOR_TOTAL_NOTA: TBCDField;
    cdsVendaGERAR_ESTOQUE_CLIENTE: TSmallintField;
    cdsVendaTRANSP_NOME: TStringField;
    cdsVendaTRANSP_CNPJ: TStringField;
    cdsVendaTRANSP_IEST: TStringField;
    cdsVendaTRANSP_ENDERECO: TStringField;
    cdsVendaNOME: TStringField;
    cdsVendaBLOQUEADO: TSmallintField;
    cdsVendaBLOQUEADO_MOTIVO: TMemoField;
    cdsVendaLUCRO_CALCULADO: TBCDField;
    cdsVendaDESCONTO_TOTAL: TCurrencyField;
    cdsVendaLOTE_NFE_CODIGO: TIntegerField;
    procedure cdsVendaFormaPagtoCalcFields(DataSet: TDataSet);
    procedure cdsVendaItemSEQGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure cdsVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetUltimaVenda(const Empresa, Usuario : String; const Ano, Status : Smallint) : Integer;
  end;

var
  DMCupom: TDMCupom;

implementation

uses
  UDMBusiness, UDMNFe;

{$R *.dfm}

function TDMCupom.GetUltimaVenda(const Empresa, Usuario : String; const Ano, Status: Smallint): Integer;
begin
  with qryUltimoVenda do
  begin
    Close;
    ParamByName('empresa').AsString := Empresa;
    ParamByName('usuario').AsString := Usuario;
    ParamByName('ano').AsInteger    := Ano;
    ParamByName('status').AsInteger := Status;
    Open;

    Result := FieldByName('orcamento').AsInteger;
  end;
end;

procedure TDMCupom.cdsVendaCalcFields(DataSet: TDataSet);
begin
  cdsVendaDESCONTO_TOTAL.AsCurrency := cdsVendaDESCONTO.AsCurrency + (cdsVendaDESCONTO_CUPOM.AsCurrency * -1);
end;

procedure TDMCupom.cdsVendaFormaPagtoCalcFields(DataSet: TDataSet);
begin
  if ( cdsVendaFormaPagtoVALOR_RECEBIDO.AsCurrency > cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency ) then
    cdsVendaFormaPagtoValorTroco.AsCurrency := cdsVendaFormaPagtoVALOR_RECEBIDO.AsCurrency - cdsVendaFormaPagtoVALOR_FPAGTO.AsCurrency
  else
    cdsVendaFormaPagtoValorTroco.AsCurrency := 0.0;
end;

procedure TDMCupom.cdsVendaItemSEQGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := IntToStr(Sender.DataSet.RecNo);
end;

end.
