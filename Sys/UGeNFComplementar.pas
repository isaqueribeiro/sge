unit UGeNFComplementar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UGrPadraoCadastro, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ImgList, IBX.IBCustomDataSet,
  IBX.IBUpdateSQL, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, JvExMask, JvToolEdit,
  IBX.IBTable, JvDBControls, Vcl.Buttons;

type
  TfrmGeNFComplementar = class(TfrmGrPadraoCadastro)
    btbtnGerarNFe: TcxButton;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    dtsEmpresa: TDataSource;
    tblEmpresa: TIBTable;
    lblDataHora: TLabel;
    dbDataHora: TDBEdit;
    dbEmpresa: TDBLookupComboBox;
    lblEmpresa: TLabel;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    tblModalidadeFrete: TIBTable;
    dtsModalidadeFrete: TDataSource;
    btbtnCancelarNFC: TcxButton;
    lblSerie: TLabel;
    dbSerie: TDBEdit;
    dbNFe: TDBEdit;
    lblNFe: TLabel;
    lblDataEmissao: TLabel;
    dbDataEmissao: TDBEdit;
    lblNFeOrigem: TLabel;
    dbNFeOrigem: TJvDBComboEdit;
    IbDtstTabelaNFC_NUMERO: TIntegerField;
    IbDtstTabelaNFC_EMPRESA: TIBStringField;
    IbDtstTabelaNFC_TIPO: TSmallintField;
    IbDtstTabelaNFC_DATA: TDateField;
    IbDtstTabelaNFC_HORA: TTimeField;
    IbDtstTabelaNFC_EMISSAO: TDateField;
    IbDtstTabelaNFC_ENVIADA: TSmallintField;
    IbDtstTabelaNFC_TEXTO: TWideMemoField;
    IbDtstTabelaNFE_SERIE: TIBStringField;
    IbDtstTabelaNFE_NUMERO: TIntegerField;
    IbDtstTabelaNFE_MODELO: TSmallintField;
    IbDtstTabelaSERIE: TIBStringField;
    IbDtstTabelaNUMERO: TIntegerField;
    IbDtstTabelaRECIBO: TIBStringField;
    IbDtstTabelaFORNECEDOR: TIntegerField;
    IbDtstTabelaCLIENTE: TIntegerField;
    IbDtstTabelaNFC_MODALIDADE_FRETE: TSmallintField;
    IbDtstTabelaNFC_TRANSPORTADORA: TIntegerField;
    IbDtstTabelaNFC_PLACA_VEICULO: TIBStringField;
    IbDtstTabelaNFC_PLACA_UF: TIBStringField;
    IbDtstTabelaNFC_PLACA_RNTC: TIBStringField;
    IbDtstTabelaNFC_VALOR_BASE_ICMS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_ICMS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST: TIBBCDField;
    IbDtstTabelaNFC_VALOR_ICMS_SUBST: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO: TIBBCDField;
    IbDtstTabelaNFC_VALOR_FRETE: TIBBCDField;
    IbDtstTabelaNFC_VALOR_SEGURO: TIBBCDField;
    IbDtstTabelaNFC_VALOR_DESCONTO: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_II: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_IPI: TIBBCDField;
    IbDtstTabelaNFC_VALOR_PIS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_COFINS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_OUTROS: TIBBCDField;
    IbDtstTabelaNFC_VALOR_TOTAL_NOTA: TIBBCDField;
    IbDtstTabelaCANCELADA: TSmallintField;
    IbDtstTabelaCANCELADA_USUARIO: TIBStringField;
    IbDtstTabelaCANCELADA_DATAHORA: TDateTimeField;
    IbDtstTabelaCANCELADA_MOTIVO: TWideMemoField;
    IbDtstTabelaDESTINATARIO_NFE: TIBStringField;
    IbDtstTabelaDESTINATARIO_CODIGO: TIntegerField;
    IbDtstTabelaDESTINATARIO_RAZAO: TIBStringField;
    IbDtstTabelaDESTINATARIO_CNPJ: TIBStringField;
    lblDestintario: TLabel;
    dbDestintario: TJvDBComboEdit;
    lblDestinatarioCnpj: TLabel;
    dbDestinatarioCnpj: TDBEdit;
    dbTipo: TDBRadioGroup;
    IbDtstTabelaNFC_EMISSOR: TIBStringField;
    lblEmissor: TLabel;
    dbEmissor: TDBEdit;
    GrpBxDadosProduto: TGroupBox;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorDiferenca: TLabel;
    lblValorUn: TLabel;
    lblUnidade: TLabel;
    lblCFOP: TLabel;
    lblAliquota: TLabel;
    lblCST: TLabel;
    Bevel7: TBevel;
    lblAliquotaST: TLabel;
    dbProdutoNome: TDBEdit;
    dbQuantidade: TDBEdit;
    dbValorDiferenca: TDBEdit;
    dbValorUn: TDBEdit;
    dbUnidade: TDBEdit;
    dbAliquota: TDBEdit;
    dbCST: TDBEdit;
    pnlBotoesProduto: TPanel;
    btnProdutoEditar: TBitBtn;
    btnProdutoSalvar: TBitBtn;
    dbAliquotaST: TDBEdit;
    dbProduto: TJvDBComboEdit;
    dbCFOP: TJvDBComboEdit;
    lblValorBcIcms: TLabel;
    dbValorBcIcms: TDBEdit;
    lblValorIcms: TLabel;
    dbValorIcms: TDBEdit;
    lblValorBcIcmsST: TLabel;
    dbValorBcIcmsST: TDBEdit;
    dbValorIcmsST: TDBEdit;
    lblValorIcmsST: TLabel;
    lblValorTotalGeral: TLabel;
    dbValorTotalGeral: TDBEdit;
    cdsTabelaItens: TIBDataSet;
    IbUpdTabelaItens: TIBUpdateSQL;
    DtSrcTabelaItens: TDataSource;
    Bevel5: TBevel;
    pgcMaisDados: TPageControl;
    tbsValores: TTabSheet;
    tbsObservacoes: TTabSheet;
    tbsTransporte: TTabSheet;
    TbsInformeNFe: TTabSheet;
    lblLogNFeLote: TLabel;
    lblLogNFeLoteDataEmissao: TLabel;
    lblLogNFeLoteChave: TLabel;
    lblLogNFeLoteRecibo: TLabel;
    lblLogNFeLoteProtocolo: TLabel;
    lblLogNFeLoteArquivo: TLabel;
    lblLogNFeCancelMotivo: TLabel;
    lblLogNFeCancelUsuario: TLabel;
    lblLogNFeCancelData: TLabel;
    lblLogNFeUsuario: TLabel;
    BtnLimparDadosNFe: TSpeedButton;
    dbLogNFeLote: TDBEdit;
    d1LogNFeLoteDataEmissao: TDBEdit;
    d2LogNFeLoteDataEmissao: TDBEdit;
    dbLogNFeLoteChave: TDBEdit;
    dbLogNFeLoteRecibo: TDBEdit;
    dbLogNFeLoteProtocolo: TDBEdit;
    dbLogNFeLoteArquivo: TDBEdit;
    dbLogNFeCancelMotivo: TDBMemo;
    dbLogNFeCancelUsuario: TDBEdit;
    dbLogNFeCancelData: TDBEdit;
    dbLogNFeUsuario: TDBEdit;
    Bevel6: TBevel;
    GrpBxDadosValores: TGroupBox;
    lblValorFrete: TLabel;
    lblBaseICMS: TLabel;
    lblBaseICMSSubs: TLabel;
    lblTotalProduto: TLabel;
    lblValorOutros: TLabel;
    lblTotalNotaFiscal: TLabel;
    lblValorDesconto: TLabel;
    lblValorIPI: TLabel;
    lblValorICMSSubs: TLabel;
    lblValorIcmsNF: TLabel;
    dbValorFrete: TDBEdit;
    dbBaseICMS: TDBEdit;
    dbBaseICMSSubs: TDBEdit;
    dbTotalProduto: TDBEdit;
    dbValorOutros: TDBEdit;
    dbTotalNotaFiscal: TDBEdit;
    dbValorDesconto: TDBEdit;
    dbValorIPI: TDBEdit;
    dbValorICMSSubs: TDBEdit;
    dbValorIcmsNF: TDBEdit;
    dbgProdutos: TDBGrid;
    pnlObservacao: TPanel;
    lblObservacao: TLabel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    dbObservacao: TDBMemo;
    cdsTabelaItensNFC_NUMERO: TIntegerField;
    cdsTabelaItensNFC_ITEM: TSmallintField;
    cdsTabelaItensMOV_ANO: TSmallintField;
    cdsTabelaItensMOV_CONTROLE: TIntegerField;
    cdsTabelaItensMOV_EMPRESA: TIBStringField;
    cdsTabelaItensMOV_SEQ: TSmallintField;
    cdsTabelaItensPRODUTO: TIBStringField;
    cdsTabelaItensQUANTIDADE: TIBBCDField;
    cdsTabelaItensVALOR_DIFERENCA: TIBBCDField;
    cdsTabelaItensVALOR_TOTAL: TIBBCDField;
    cdsTabelaItensALIQUOTA_ICMS: TIBBCDField;
    cdsTabelaItensBC_ICMS: TIBBCDField;
    cdsTabelaItensVALOR_ICMS: TIBBCDField;
    cdsTabelaItensALIQUOTA_ICMS_ST: TIBBCDField;
    cdsTabelaItensBC_ICMS_ST: TIBBCDField;
    cdsTabelaItensVALOR_ICMS_ST: TIBBCDField;
    cdsTabelaItensDESCRI_APRESENTACAO: TIBStringField;
    cdsTabelaItensMOV_QUANTIDADE: TIBBCDField;
    cdsTabelaItensMOV_UNIDADE: TIBStringField;
    cdsTabelaItensMOV_UNIDADE_SIGLA: TIBStringField;
    cdsTabelaItensMOV_VALOR_UN: TIBBCDField;
    cdsTabelaItensMOV_VALOR_TOTAL: TFMTBCDField;
    cdsTabelaItensMOV_CFOP: TIntegerField;
    cdsTabelaItensMOV_CFOP_DESCRICAO: TIBStringField;
    cdsTabelaItensMOV_CST: TIBStringField;
    cdsTabelaItensMOV_CSOSN: TIBStringField;
    cdsTabelaItensMOV_ALIQUOTA: TIBBCDField;
    cdsTabelaItensMOV_ALIQUOTA_CSOSN: TIBBCDField;
    qryNFE: TIBDataSet;
    qryNFEEMPRESA: TIBStringField;
    qryNFEANOVENDA: TSmallintField;
    qryNFENUMVENDA: TIntegerField;
    qryNFEANOCOMPRA: TSmallintField;
    qryNFENUMCOMPRA: TIntegerField;
    qryNFEDATAEMISSAO: TDateField;
    qryNFEHORAEMISSAO: TTimeField;
    qryNFESERIE: TIBStringField;
    qryNFENUMERO: TIntegerField;
    qryNFEMODELO: TSmallintField;
    qryNFEVERSAO: TSmallintField;
    qryNFECHAVE: TIBStringField;
    qryNFEPROTOCOLO: TIBStringField;
    qryNFERECIBO: TIBStringField;
    qryNFEXML_FILENAME: TIBStringField;
    qryNFEXML_FILE: TMemoField;
    qryNFELOTE_ANO: TSmallintField;
    qryNFELOTE_NUM: TIntegerField;
    updNFE: TIBUpdateSQL;
    dtsNFE: TDataSource;
    cdsTabelaItensMOV_VALOR_UN_NOVO: TIBBCDField;
    cdsTabelaItensMOV_TOTAL_GERAL: TIBBCDField;
    lblValorTotal: TLabel;
    dbValorTotal: TDBEdit;
    cdsTabelaItensMOV_ALIQUOTA_ST: TIBBCDField;
    cdsTabelaItensMOV_ALIQUOTA_MVA: TIBBCDField;
    qryProdutos: TIBDataSet;
    btnProdutoCancelar: TBitBtn;
    lblValorSeguro: TLabel;
    dbValorSeguro: TDBEdit;
    IbDtstTabelaNFC_DENEGADA: TSmallintField;
    IbDtstTabelaNFC_DENEGADA_MOTIVO: TIBStringField;
    qryNFENFC_NUMERO: TIntegerField;
    ppImprimir: TPopupMenu;
    nmImprimirEspelho: TMenuItem;
    nmImprimirDANFE: TMenuItem;
    nmGerarDANFEXML: TMenuItem;
    nmEnviarEmailCliente: TMenuItem;
    procedure pgcGuiasChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNFC_DATAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbNFeOrigemButtonClick(Sender: TObject);
    procedure IbDtstTabelaDESTINATARIO_CNPJGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure IbDtstTabelaAfterCancel(DataSet: TDataSet);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaItensStateChange(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btnProdutoEditarClick(Sender: TObject);
    procedure btnProdutoCancelarClick(Sender: TObject);
    procedure btnProdutoSalvarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btbtnGerarNFeClick(Sender: TObject);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    SQL_Itens : TStringList;
    procedure RecarregarRegistro;
    procedure AbrirTabelaItens(const Controle : Integer);
    procedure AbrirNotaFiscal(const Empresa : String; const Controle : Integer);

    procedure HabilitarDesabilitar_Btns;
    procedure CarregarProdutos(const aEmpresa, aSerie : String;const aNumero, aModelo : Integer);
    procedure TotalValor(var aProduto, aBaseICMS, aValorICMS, aBaseICMS_ST, aValorICMS_ST : Currency);

    function GetRotinaGerarNFeID : String;
    function GetRotinaCancelarNFCID : String;

    procedure RegistrarNovaRotinaSistema;
    procedure pgcGuiasOnChange; override;
  public
    { Public declarations }
    property RotinaGerarNFeID    : String read GetRotinaGerarNFeID;
    property RotinaCancelarNFCID : String read GetRotinaCancelarNFCID;
  end;

var
  frmGeNFComplementar: TfrmGeNFComplementar;

implementation

uses
  UDMBusiness, UConstantesDGE, UGeNFEmitida, UDMNFe, UGeConsultarLoteNFe_v2;

{$R *.dfm}

procedure TfrmGeNFComplementar.AbrirNotaFiscal(const Empresa : String; const Controle: Integer);
begin
  with qryNFE do
  begin
    Close;
    ParamByName('empresa').AsString   := Empresa;
    ParamByName('controle').AsInteger := Controle;
    Open;
  end;
end;

procedure TfrmGeNFComplementar.AbrirTabelaItens(const Controle: Integer);
begin
  cdsTabelaItens.Close;

  with cdsTabelaItens, SelectSQL do
  begin
    Clear;
    AddStrings( SQL_Itens );
    Add('where i.nfc_numero = ' + IntToStr(Controle));
    Add('order by');
    Add('    i.nfc_numero');
    Add('  , i.nfc_item');
  end;

  cdsTabelaItens.Open;

  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.btbtnAlterarClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaNUMERO.AsInteger > 0 ) then
  begin
    if ( IbDtstTabelaCANCELADA.AsInteger = 1 ) then
      sMsg := 'Esta nota complementar não pode ser alterada porque está cancelada.'
    else
      sMsg := 'Esta nota complementar não pode ser alterada porque está finalizada.';

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
      AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
    end;
  end;
end;

procedure TfrmGeNFComplementar.btbtnExcluirClick(Sender: TObject);
var
  sMsg : String;
begin
  RecarregarRegistro;

  if ( IbDtstTabelaNUMERO.AsInteger > 0 ) then
  begin
    if ( IbDtstTabelaCANCELADA.AsInteger = 1 ) then
      sMsg := 'Esta nota complementar não pode ser excluída porque está cancelada.'
    else
      sMsg := 'Esta nota complementar não pode ser excluída porque está finalizada.';

    ShowWarning(sMsg);
    Abort;
  end
  else
  begin
    inherited;
    if ( not OcorreuErro ) then
    begin
      AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
      AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
    end;
  end;
end;

procedure TfrmGeNFComplementar.btbtnGerarNFeClick(Sender: TObject);
var
  iNumeroTmp ,
  iNumero    ,
  iSerieNFe  ,
  iNumeroNFe : Integer;
  sFileNameXML  ,
  sChaveNFE     ,
  sProtocoloNFE ,
  sReciboNFE    ,
  sMensagem     ,
  sDenegadaMotivo,
  sDataHoraSaida : String;
  iNumeroLote   : Int64;
  TipoMovimento : TTipoMovimento;
  bNFeGerada,
  bDenegada : Boolean;
begin
  if ( IbDtstTabela.IsEmpty ) then
    Exit;

  if not GetPermissaoRotinaInterna(Sender, True) then
    Abort;

  RecarregarRegistro;

  pgcGuias.ActivePage := tbsCadastro;

  bNFeGerada := (IbDtstTabelaNUMERO.AsCurrency > 0);

  if bNFeGerada then
  begin
    ShowWarning('Movimento complementar já com NF-e gerada!');
    Abort;
  end;

  if not GetPermititEmissaoNFe( IbDtstTabelaNFC_EMPRESA.AsString ) then
  begin
    ShowInformation('Empresa selecionada não habilitada para emissão de NF-e.' + #13 + 'Favor entrar em contato com suporte.');
    Exit;
  end;

  if ( not DelphiIsRunning ) then
    if not DMNFe.GetValidadeCertificado(IbDtstTabelaNFC_EMPRESA.AsString) then
      Exit;

  // Buscar retorno do envio pendente, caso ele tenha ocorrido
  if not bNFeGerada then
    if ( Trim(IbDtstTabelaRECIBO.AsString) <> EmptyStr ) then
    begin
      bNFeGerada := BuscarRetornoReciboNFe( Self
        , IbDtstTabelaNFC_EMPRESA.AsString
        , IbDtstTabelaRECIBO.AsString
        , iSerieNFe
        , iNumeroNFe
        , sFileNameXML
        , sChaveNFE
        , sProtocoloNFE
        , TipoMovimento );

      if ( Ord(TipoMovimento) <> dbTipo.Field.AsInteger ) then
      begin
        ShowWarning('Tipo do movimento do recibo incompatível!');
        Exit;
      end;

      sReciboNFE  := Trim(IbDtstTabelaRECIBO.AsString);
      iNumeroLote := iNumeroNFe;

      if not bNFeGerada then
        Exit;
    end;

  sDataHoraSaida := FormatDateTime('dd/mm/yyyy', GetDateDB) + ' 23:59:59';

  // Gerar XML da NF e Enviar para a SEFA
  if not bNFeGerada then
    bNFeGerada := DMNFe.GerarNFeComplementarOnLineACBr( IbDtstTabelaNFC_EMPRESA.Value
      , IbDtstTabelaDESTINATARIO_CODIGO.AsInteger
      , sDataHoraSaida
      , TTipoNF(IbDtstTabelaNFC_TIPO.AsInteger)
      , IbDtstTabelaNFC_NUMERO.AsInteger
      , iSerieNFe
      , iNumeroNFe
      , sFileNameXML
      , sChaveNFE
      , sProtocoloNFE
      , sReciboNFE
      , iNumeroLote
      , bDenegada
      , sDenegadaMotivo
      , False);

  if bDenegada then
    try
      IbDtstTabela.DisableControls;
      IbDtstTabela.Edit;

      IbDtstTabelaNFC_DENEGADA.AsInteger       := 1;
      IbDtstTabelaNFC_DENEGADA_MOTIVO.AsString := AnsiUpperCase(Trim(sDenegadaMotivo));

      IbDtstTabela.Post;
      IbDtstTabela.ApplyUpdates;
      CommitTransaction;
    finally
      IbDtstTabela.EnableControls;
    end;

  if bNFeGerada then
    with IbDtstTabela do
    begin
      iNumero := IbDtstTabelaNFC_NUMERO.AsInteger;

      with qryNFE do
      begin
        AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );

        Append;

        qryNFEEMPRESA.Value     := IbDtstTabelaNFC_EMPRESA.AsString;
        qryNFENFC_NUMERO.Value  := IbDtstTabelaNFC_NUMERO.Value;
        qryNFESERIE.Value       := FormatFloat('#00', iSerieNFe);
        qryNFENUMERO.Value      := iNumeroNFe;
        qryNFEMODELO.Value      := DMNFe.GetModeloDF;
        qryNFEVERSAO.Value      := DMNFe.GetVersaoDF;
        qryNFEDATAEMISSAO.Value := GetDateDB;
        qryNFEHORAEMISSAO.Value := GetTimeDB;
        qryNFECHAVE.Value       := sChaveNFE;
        qryNFEPROTOCOLO.Value   := sProtocoloNFE;
        qryNFERECIBO.Value      := sReciboNFE;
        qryNFELOTE_NUM.Value    := iNumeroLote;

        if ( FileExists(sFileNameXML) ) then
        begin
          CorrigirXML_NFe(EmptyWideStr, sFileNameXML);

          qryNFEXML_FILENAME.Value := ExtractFileName( sFileNameXML );
          qryNFEXML_FILE.LoadFromFile( sFileNameXML );
        end;

        qryNFELOTE_ANO.Clear;
        qryNFEANOVENDA.Clear;
        qryNFENUMVENDA.Clear;
        qryNFEANOCOMPRA.Clear;
        qryNFENUMCOMPRA.Clear;

        Post;
        ApplyUpdates;

        CommitTransaction;
      end;

      RecarregarRegistro;

      ShowInformation('Nota Fiscal gerada com sucesso.' + #13#13 +
        'Série/Número: ' + IbDtstTabelaSERIE.AsString + '/' + FormatFloat('##0000000', IbDtstTabelaNUMERO.Value) +
        IfThen(Trim(sMensagem) = EmptyStr, EmptyStr, #13#13 + 'Alerta:' + #13 + sMensagem));

      HabilitarDesabilitar_Btns;

      nmImprimirDANFE.Click;
    end;
end;

procedure TfrmGeNFComplementar.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
  begin
    AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
    AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
  end;
end;

procedure TfrmGeNFComplementar.btbtnSalvarClick(Sender: TObject);
var
  cProduto      ,
  cBaseICMS     ,
  cValorICMS    ,
  cBaseICMS_ST  ,
  cValorICMS_ST : Currency;
begin
  if ( cdsTabelaItens.IsEmpty ) then
    ShowWarning('Favor informar o(s) produto(s) da venda.')
  else
  if ( btnProdutoSalvar.Enabled ) then
  begin
    ShowWarning('Favor salvar ou cancelar alteração em andamento no produto da nota complementar!');
    btnProdutoSalvar.SetFocus;
  end
  else
  begin

    TotalValor( cProduto
      , cBaseICMS
      , cValorICMS
      , cBaseICMS_ST
      , cValorICMS_ST );

    if ( cProduto <> IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO.AsCurrency ) then
    begin
      ShowWarning('O Valor Total dos produtos não coinside com o informado!');
      pgcMaisDados.ActivePage := tbsValores;
      dbTotalProduto.SetFocus;
    end
    else
    if ( cBaseICMS <> IbDtstTabelaNFC_VALOR_BASE_ICMS.AsCurrency ) then
    begin
      ShowWarning('O Valor Total Base de ICMS dos produtos não coinside com o informado!');
      pgcMaisDados.ActivePage := tbsValores;
      dbBaseICMS.SetFocus;
    end
    else
    if ( cValorICMS <> IbDtstTabelaNFC_VALOR_ICMS.AsCurrency ) then
    begin
      ShowWarning('O Valor Total de ICMS dos produtos não coinside com o informado!');
      pgcMaisDados.ActivePage := tbsValores;
      dbValorIcmsNF.SetFocus;
    end
    else
    if ( cBaseICMS_ST <> IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST.AsCurrency ) then
    begin
      ShowWarning('O Valor Total Base de ICMS ST dos produtos não coinside com o informado!');
      pgcMaisDados.ActivePage := tbsValores;
      dbBaseICMSSubs.SetFocus;
    end
    else
    if ( cValorICMS_ST <> IbDtstTabelaNFC_VALOR_ICMS_SUBST.AsCurrency ) then
    begin
      ShowWarning('O Valor Total de ICMS ST dos produtos não coinside com o informado!');
      pgcMaisDados.ActivePage := tbsValores;
      dbValorICMSSubs.SetFocus;
    end
    else
    begin

      if ( IbDtstTabelaNFC_VALOR_TOTAL_NOTA.AsCurrency <= 0 ) then
        IbDtstTabelaNFC_VALOR_TOTAL_NOTA.Clear;

      inherited;

      if (not OcorreuErro) then
      begin
        if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
          cdsTabelaItens.Post;

        cdsTabelaItens.ApplyUpdates;
        CommitTransaction;

        RecarregarRegistro;
        AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
        AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
      end;

      HabilitarDesabilitar_Btns;

    end;

  end;
end;

procedure TfrmGeNFComplementar.btnProdutoCancelarClick(Sender: TObject);
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    cdsTabelaItens.Cancel;
    btnProdutoEditar.SetFocus;
  end;
end;

procedure TfrmGeNFComplementar.btnProdutoEditarClick(Sender: TObject);
begin
  if ( not cdsTabelaItens.IsEmpty ) then
  begin
    cdsTabelaItens.Edit;
    dbProduto.SetFocus;
  end;
end;

procedure TfrmGeNFComplementar.btnProdutoSalvarClick(Sender: TObject);

  procedure GetToTais(var aTotalProduto, aTotalBaseIcms, aTotalIcms,
    aTotalBaseIcmsST, aTotalIcmsST, aTotalNota : Currency);
  var
    Item : Integer;
  begin
    try
      Item := cdsTabelaItensNFC_ITEM.AsInteger;

      aTotalProduto    := 0.0;
      aTotalBaseIcms   := 0.0;
      aTotalIcms       := 0.0;
      aTotalBaseIcmsST := 0.0;
      aTotalIcmsST     := 0.0;
      aTotalNota       := 0.0;

      cdsTabelaItens.DisableControls;
      cdsTabelaItens.First;

      while not cdsTabelaItens.Eof do
      begin
        aTotalProduto    := aTotalProduto    + cdsTabelaItensVALOR_TOTAL.AsCurrency;
        aTotalBaseIcms   := aTotalBaseIcms   + cdsTabelaItensBC_ICMS.AsCurrency;
        aTotalIcms       := aTotalIcms       + cdsTabelaItensVALOR_ICMS.AsCurrency;
        aTotalBaseIcmsST := aTotalBaseIcmsST + cdsTabelaItensBC_ICMS_ST.AsCurrency;
        aTotalIcmsST     := aTotalIcmsST     + cdsTabelaItensVALOR_ICMS_ST.AsCurrency;

        cdsTabelaItens.Next;
      end;

      aTotalNota  := aTotalProduto
        + dbValorICMSSubs.Field.AsCurrency
        + dbValorFrete.Field.AsCurrency
        + dbValorSeguro.Field.AsCurrency
        + dbValorOutros.Field.AsCurrency
        - dbValorDesconto.Field.AsCurrency;
    finally
      cdsTabelaItens.Locate('NFC_ITEM', Item, []);
      cdsTabelaItens.EnableControls;
    end;
  end;

var
  cTotalProduto   ,
  cTotalBaseIcms  ,
  cTotalIcms      ,
  cTotalBaseIcmsST,
  cTotalIcmsST,
  cTotalNota  : Currency;
begin
  if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
  begin
    if ( Trim(cdsTabelaItensPRODUTO.AsString) = EmptyStr ) then
    begin
      ShowWarning('Favor informar o código do produto.');
      dbProduto.SetFocus;
    end
    else
    if ( cdsTabelaItensQUANTIDADE.Value < 0 ) then
    begin
      ShowWarning('Quantidade inválida.');
      dbQuantidade.SetFocus;
    end
    else
    if ( cdsTabelaItensMOV_VALOR_UN_NOVO.Value < cdsTabelaItensMOV_VALOR_UN.Value ) then
    begin
      ShowWarning('Valor unitário inválido como "Valor complementar".');
      dbValorUn.SetFocus;
    end
    else
    begin

      cdsTabelaItens.Post;

      GetToTais( cTotalProduto
        , cTotalBaseIcms
        , cTotalIcms
        , cTotalBaseIcmsST
        , cTotalIcmsST
        , cTotalNota );

      IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO.AsCurrency := cTotalProduto;
      IbDtstTabelaNFC_VALOR_BASE_ICMS.AsCurrency     := cTotalBaseIcms;
      IbDtstTabelaNFC_VALOR_ICMS.AsCurrency          := cTotalIcms;
      IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST.AsCurrency := cTotalBaseIcmsST;
      IbDtstTabelaNFC_VALOR_ICMS_SUBST.AsCurrency      := cTotalIcmsST;
      IbDtstTabelaNFC_VALOR_TOTAL_NOTA.AsCurrency      := cTotalNota;

      if ( btnProdutoEditar.Visible and btnProdutoEditar.Enabled ) then
      begin
        cdsTabelaItens.Next;
        btnProdutoEditar.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmGeNFComplementar.CarregarProdutos(const aEmpresa, aSerie : String;const aNumero, aModelo : Integer);
var
  cAliquotaNormal,
  cAliquotaST    : Currency;
begin
  AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );

  with qryProdutos do
  begin
    Close;
    ParamByName('empresa').AsString := aEmpresa;
    ParamByName('serie').AsString   := aSerie;
    ParamByName('numero').AsInteger := aNumero;
    ParamByName('modelo').AsInteger := aModelo;
    Open;

    AliquotaIcms( GetEmpresaUF(IbDtstTabelaNFC_EMPRESA.AsString)
      , IfThen(TTipoNF(IbDtstTabelaNFC_TIPO.AsInteger) = tnfEntrada,
          GetFornecedorUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger),
          GetClienteUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger))
      , cAliquotaNormal
      , cAliquotaST );

    First;
    while not Eof do
    begin
      cdsTabelaItens.Append;
      cdsTabelaItensNFC_NUMERO.Assign( IbDtstTabelaNFC_NUMERO );
      cdsTabelaItensNFC_ITEM.Value := RecNo;
      cdsTabelaItensMOV_ANO.Value         := FieldByName('mov_ano').AsInteger;
      cdsTabelaItensMOV_CONTROLE.Value    := FieldByName('mov_controle').AsInteger;
      cdsTabelaItensMOV_EMPRESA.Value     := FieldByName('mov_empresa').AsString;
      cdsTabelaItensMOV_SEQ.Value         := FieldByName('mov_seq').AsInteger;
      cdsTabelaItensPRODUTO.Value         := FieldByName('mov_produto').AsString;
      cdsTabelaItensQUANTIDADE.Value      := 0.0;
      cdsTabelaItensVALOR_DIFERENCA.Value := 0.0;
      cdsTabelaItensVALOR_TOTAL.Value     := 0.0;
      cdsTabelaItensALIQUOTA_ICMS.Value   := 0.0;
      cdsTabelaItensBC_ICMS.Value         := 0.0;
      cdsTabelaItensVALOR_ICMS.Value      := 0.0;
      cdsTabelaItensALIQUOTA_ICMS_ST.Value    := 0.0;
      cdsTabelaItensBC_ICMS_ST.Value          := 0.0;
      cdsTabelaItensVALOR_ICMS_ST.Value       := 0.0;
      cdsTabelaItensDESCRI_APRESENTACAO.Value := FieldByName('mov_produto_descricao').AsString;
      cdsTabelaItensMOV_QUANTIDADE.Value      := FieldByName('mov_quantidade').AsCurrency;
      cdsTabelaItensMOV_UNIDADE.Value         := FieldByName('mov_unidade').AsString;
      cdsTabelaItensMOV_UNIDADE_SIGLA.Value   := FieldByName('mov_unidade_sigla').AsString;
      cdsTabelaItensMOV_VALOR_UN.Value        := FieldByName('mov_valor_un').AsCurrency;
      cdsTabelaItensMOV_CFOP.Value            := FieldByName('mov_cfop').AsInteger;
      cdsTabelaItensMOV_CFOP_DESCRICAO.Value  := FieldByName('mov_cfop_descricao').AsString;
      cdsTabelaItensMOV_CST.Value             := FieldByName('mov_cst').AsString;
      cdsTabelaItensMOV_CSOSN.Value           := FieldByName('mov_csosn').AsString;
      cdsTabelaItensMOV_ALIQUOTA.Value        := FieldByName('mov_aliquota').AsCurrency;
      cdsTabelaItensMOV_ALIQUOTA_CSOSN.Value  := FieldByName('mov_aliquota_csosn').AsCurrency;
      cdsTabelaItensMOV_VALOR_UN_NOVO.Value   := FieldByName('mov_valor_un').AsCurrency;
      cdsTabelaItensMOV_VALOR_TOTAL.Value     := FieldByName('mov_valor_total').AsCurrency;
      cdsTabelaItensMOV_TOTAL_GERAL.Value     := FieldByName('mov_valor_total').AsCurrency + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      cdsTabelaItensMOV_ALIQUOTA_ST.Value     := cAliquotaST;
      cdsTabelaItensMOV_ALIQUOTA_MVA.Value    := 0.0;
      cdsTabelaItens.Post;

      Next;
    end;

    cdsTabelaItens.First;
  end;
end;

procedure TfrmGeNFComplementar.ControlEditExit(Sender: TObject);
var
  cAliquotaNormal,
  cAliquotaST    : Currency;
begin
  inherited;
  if ( (Sender = dbQuantidade) or (Sender = dbValorUn) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      cdsTabelaItensVALOR_DIFERENCA.AsCurrency := (cdsTabelaItensMOV_VALOR_UN_NOVO.AsCurrency - cdsTabelaItensMOV_VALOR_UN.AsCurrency);
      cdsTabelaItensVALOR_TOTAL.AsCurrency     :=
        ( (cdsTabelaItensMOV_QUANTIDADE.AsCurrency + cdsTabelaItensQUANTIDADE.AsCurrency) *
          (cdsTabelaItensMOV_VALOR_UN.AsCurrency + cdsTabelaItensVALOR_DIFERENCA.AsCurrency) ) -
        cdsTabelaItensMOV_VALOR_TOTAL.AsCurrency;
      cdsTabelaItensMOV_TOTAL_GERAL.AsCurrency := (cdsTabelaItensMOV_VALOR_TOTAL.AsCurrency + cdsTabelaItensVALOR_TOTAL.AsCurrency);
    end;

  // Buscar os percentuais de Aliquota ICMS
  if ( (Sender = dbValorBcIcms) or (Sender = dbValorBcIcmsST) ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
    begin
      AliquotaIcms( GetEmpresaUF(IbDtstTabelaNFC_EMPRESA.AsString)
        , IfThen(TTipoNF(IbDtstTabelaNFC_TIPO.AsInteger) = tnfEntrada,
            GetFornecedorUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger),
            GetClienteUF(IbDtstTabelaDESTINATARIO_CODIGO.AsInteger))
        , cAliquotaNormal
        , cAliquotaST );
    end;

  // Calcular o valor da Aliquota ICMS de acordo o percentual do ICMS Normal
  if ( Sender = dbValorBcIcms ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( cdsTabelaItensBC_ICMS.AsCurrency > 0 ) then
      begin
        cdsTabelaItensALIQUOTA_ICMS.AsCurrency := 100.0;
        cdsTabelaItensVALOR_ICMS.AsCurrency    := cdsTabelaItensBC_ICMS.AsCurrency * cAliquotaNormal / 100;
      end
      else
      begin
        cdsTabelaItensALIQUOTA_ICMS.AsCurrency := 0.0;
        cdsTabelaItensVALOR_ICMS.AsCurrency    := 0.0;
      end;

  // Calcular o valor da Aliquota ICMS de acordo o percentual do ICMS ST
  if ( Sender = dbValorBcIcmsST ) then
    if ( cdsTabelaItens.State in [dsEdit, dsInsert] ) then
      if ( cdsTabelaItensBC_ICMS_ST.AsCurrency > 0 ) then
      begin
        cdsTabelaItensALIQUOTA_ICMS_ST.AsCurrency := 100.0;
        cdsTabelaItensVALOR_ICMS_ST.AsCurrency    := cdsTabelaItensBC_ICMS_ST.AsCurrency * cAliquotaST / 100;
      end
      else
      begin
        cdsTabelaItensALIQUOTA_ICMS_ST.AsCurrency := 0.0;
        cdsTabelaItensVALOR_ICMS_ST.AsCurrency    := 0.0;
      end;

  if ( Sender = dbValorIcmsST ) then
    if ( btnProdutoSalvar.Visible and btnProdutoSalvar.Enabled ) then
      btnProdutoSalvar.SetFocus;
end;

procedure TfrmGeNFComplementar.dbNFeOrigemButtonClick(Sender: TObject);
var
  sEmpresa,
  sSerie  ,
  sChave  : String;
  iNumero ,
  iModelo ,
  iMovAno ,
  iMovCod : Integer;
  dDataEmissao  : TDateTime;
  aDestinatario : TDestinatarioNF;
begin
  sEmpresa := IbDtstTabelaNFC_EMPRESA.AsString;
  if ( IbDtstTabela.State in [dsInsert] ) then
    if ( SelecionarNFe(Self, sEmpresa, sSerie, sChave, iNumero, iModelo, dDataEmissao, aDestinatario, iMovAno, iMovCod) ) then
    begin
      IbDtstTabelaNFE_SERIE.Value  := sSerie;
      IbDtstTabelaNFE_NUMERO.Value := iNumero;
      IbDtstTabelaNFE_MODELO.Value := iModelo;
      IbDtstTabelaDESTINATARIO_NFE.Value    := FormatFloat('0000000', iNumero) + '-' + sSerie;
      IbDtstTabelaDESTINATARIO_CODIGO.Value := aDestinatario.Codigo;
      IbDtstTabelaDESTINATARIO_RAZAO.Value  := aDestinatario.RazaoSocial;
      IbDtstTabelaDESTINATARIO_CNPJ.Value   := aDestinatario.CpfCnpj;

      IbDtstTabelaFORNECEDOR.Clear;
      IbDtstTabelaCLIENTE.Clear;

      IbDtstTabelaNFC_TIPO.AsInteger := Ord(aDestinatario.Tipo);
      IbDtstTabelaNFC_TEXTO.AsString := 'NOTA COMPLEMENTAR REF. A NF. ' + FormatFloat('0000000', iNumero) + '-' + sSerie + ' ' +
        '[' + FormatarChaveNFe(sChave) + ']';

      Case aDestinatario.Tipo of
        dtFornecedor : IbDtstTabelaFORNECEDOR.AsInteger := aDestinatario.Codigo;
        dtCliente    : IbDtstTabelaCLIENTE.AsInteger    := aDestinatario.Codigo;
      end;

      CarregarProdutos(sEmpresa, sSerie, iNumero, iModelo);
      HabilitarDesabilitar_Btns;
    end;
end;

procedure TfrmGeNFComplementar.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
var
  aTotalNota : Currency;
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    if ((Field = dbValorFrete.Field)  or (Field = dbValorDesconto.Field) or
        (Field = dbValorOutros.Field) or (Field = dbValorIPI.Field)) then
    begin
      aTotalNota  := dbTotalProduto.Field.AsCurrency
        + dbValorICMSSubs.Field.AsCurrency
        + dbValorFrete.Field.AsCurrency
        + dbValorSeguro.Field.AsCurrency
        + dbValorOutros.Field.AsCurrency
        - dbValorDesconto.Field.AsCurrency;

      dbTotalNotaFiscal.Field.AsCurrency := aTotalNota;
    end;
  end;
end;

procedure TfrmGeNFComplementar.DtSrcTabelaItensStateChange(Sender: TObject);
begin
  btnProdutoEditar.Enabled   := ( DtSrcTabelaItens.AutoEdit and (cdsTabelaItens.State = dsBrowse) and (not cdsTabelaItens.IsEmpty) );
  btnProdutoCancelar.Enabled := ( cdsTabelaItens.State in [dsEdit, dsInsert] );
  btnProdutoSalvar.Enabled   := ( cdsTabelaItens.State in [dsEdit, dsInsert] );

  if ( cdsTabelaItens.State in [dsEdit] ) then
    if ( dbQuantidade.Visible and dbQuantidade.Enabled ) then
      dbQuantidade.SetFocus;
end;

procedure TfrmGeNFComplementar.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  pgcMaisDados.ActivePageIndex := 0;
  dbNFeOrigem.Button.Enabled   := (IbDtstTabela.State = dsInsert);

  DtSrcTabelaItens.AutoEdit   := DtSrcTabela.AutoEdit and (IbDtstTabelaRECIBO.AsString = EmptyStr);
  DtSrcTabelaItensStateChange( DtSrcTabelaItens );
end;

procedure TfrmGeNFComplementar.FormCreate(Sender: TObject);
begin
  inherited;
  SQL_Itens := TStringList.Create;
  SQL_Itens.Clear;
  SQL_Itens.AddStrings( cdsTabelaItens.SelectSQL );

  e1Data.Date      := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date      := GetDateDB;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbEmpresa;

  tblEmpresa.Open;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
  tblModalidadeFrete.Open;

  RotinaID := ROTINA_NFE_COMPLEMENTAR_ID;

  DisplayFormatCodigo := '###0000000';

  NomeTabela     := 'TBNFE_COMPLEMENTAR';
  CampoCodigo    := 'nf.nfc_numero';
  CampoDescricao := 'coalesce(f.nomeforn, c.nome)';
  CampoOrdenacao := 'coalesce(nf.nfc_emissao, nf.nfc_data), coalesce(f.nomeforn, c.nome)';

  WhereAdditional := 'coalesce(nf.nfc_emissao, nf.nfc_data) between ' +
    QuotedStr( FormatDateTime('yyyy-mm-dd', e1Data.Date) ) + ' and ' +
    QuotedStr( FormatDateTime('yyyy-mm-dd', e2Data.Date) );

  btbtnGerarNFe.Visible    := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa) and (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  tbsTransporte.TabVisible := False;
end;

procedure TfrmGeNFComplementar.FormShow(Sender: TObject);
begin
  inherited;
  RegistrarNovaRotinaSistema;
end;

function TfrmGeNFComplementar.GetRotinaCancelarNFCID: String;
begin
  Result := GetRotinaInternaID(btbtnCancelarNFC);
end;

function TfrmGeNFComplementar.GetRotinaGerarNFeID: String;
begin
  Result := GetRotinaInternaID(btbtnGerarNFe);
end;

procedure TfrmGeNFComplementar.HabilitarDesabilitar_Btns;
var
  EmEdicao : Boolean;
begin
  EmEdicao := (IbDtstTabela.State in [dsEdit, dsInsert]);

  if ( pgcGuias.ActivePage = tbsCadastro ) then
  begin
    btbtnLista.Enabled       := (not EmEdicao) and (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaNUMERO.AsInteger > 0) and (IbDtstTabelaNFC_ENVIADA.AsInteger = 1) and
      GetPermissaoRotinaInterna(btbtnLista, False);
    btbtnGerarNFe.Enabled    := (not EmEdicao) and (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaRECIBO.AsString = EmptyStr);
    btbtnCancelarNFC.Enabled := (not EmEdicao) and (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaNUMERO.AsInteger > 0) and (IbDtstTabelaNFC_ENVIADA.AsInteger = 1);
  end
  else
  begin
    btbtnLista.Enabled       := (IbDtstTabelaCANCELADA.AsInteger = 0) and (IbDtstTabelaNUMERO.AsInteger > 0) and (IbDtstTabelaNFC_ENVIADA.AsInteger = 1) and
      GetPermissaoRotinaInterna(btbtnLista, False);
    btbtnGerarNFe.Enabled    := False;
    btbtnCancelarNFC.Enabled := False;
  end;
end;

procedure TfrmGeNFComplementar.IbDtstTabelaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
  AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );
end;

procedure TfrmGeNFComplementar.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.IbDtstTabelaDESTINATARIO_CNPJGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    if StrIsCNPJ(Sender.AsString) then
      Text := StrFormatarCnpj(Sender.AsString)
    else
    if StrIsCPF(Sender.AsString) then
      Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeNFComplementar.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  IbDtstTabelaNFC_EMPRESA.Value  := gUsuarioLogado.Empresa;
  IbDtstTabelaNFC_DATA.Value     := GetDateDB;
  IbDtstTabelaNFC_HORA.Value     := GetTimeDB;
  IbDtstTabelaNFC_EMISSAO.Value  := GetDateDB;
  IbDtstTabelaNFC_EMISSOR.Value  := gUsuarioLogado.Login;
  IbDtstTabelaNFC_ENVIADA.Value  := 0;
  IbDtstTabelaNFC_DENEGADA.Value := 0;
  IbDtstTabelaNFC_MODALIDADE_FRETE.Value := 0;

  IbDtstTabelaNFC_VALOR_BASE_ICMS.Value       := 0.0;
  IbDtstTabelaNFC_VALOR_BASE_ICMS_SUBST.Value := 0.0;
  IbDtstTabelaNFC_VALOR_ICMS.Value            := 0.0;
  IbDtstTabelaNFC_VALOR_ICMS_SUBST.Value      := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_PRODUTO.Value   := 0.0;
  IbDtstTabelaNFC_VALOR_FRETE.Value           := 0.0;
  IbDtstTabelaNFC_VALOR_DESCONTO.Value   := 0.0;
  IbDtstTabelaNFC_VALOR_SEGURO.Value     := 0.0;
  IbDtstTabelaNFC_VALOR_OUTROS.Value     := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_II.Value   := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_IPI.Value  := 0.0;
  IbDtstTabelaNFC_VALOR_PIS.Value        := 0.0;
  IbDtstTabelaNFC_VALOR_COFINS.Value     := 0.0;
  IbDtstTabelaNFC_VALOR_TOTAL_NOTA.Value := 0.0;

  IbDtstTabelaCANCELADA.Value            := 0;
  IbDtstTabelaCANCELADA_USUARIO.Clear;
  IbDtstTabelaCANCELADA_DATAHORA.Clear;
  IbDtstTabelaCANCELADA_MOTIVO.Clear;
  IbDtstTabelaNFC_DENEGADA_MOTIVO.Clear;
  IbDtstTabelaNFC_TEXTO.Clear;
  IbDtstTabelaNFE_SERIE.Clear;
  IbDtstTabelaNFE_NUMERO.Clear;
  IbDtstTabelaNFE_MODELO.Clear;
  IbDtstTabelaRECIBO.Clear;
end;

procedure TfrmGeNFComplementar.IbDtstTabelaNFC_DATAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := FormatDateTime('dd/mm/yyyy', Sender.AsDateTime) + ' ' + FormatDateTime('hh:mm', IbDtstTabelaNFC_HORA.AsDateTime);
end;

procedure TfrmGeNFComplementar.pgcGuiasChange(Sender: TObject);
begin
  inherited;
  AbrirTabelaItens( IbDtstTabelaNFC_NUMERO.AsInteger );
  AbrirNotaFiscal( IbDtstTabelaNFC_EMPRESA.AsString, IbDtstTabelaNFC_NUMERO.AsInteger );

  pgcMaisDados.ActivePage := tbsValores;
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.pgcGuiasOnChange;
begin
  HabilitarDesabilitar_Btns;
end;

procedure TfrmGeNFComplementar.RecarregarRegistro;
var
  sID : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    Exit;

  if IbDtstTabela.IsEmpty then
    sID := EmptyStr
  else
    sID := IbDtstTabelaNFC_NUMERO.AsString;

  if ( sID <> EmptyStr ) then
  begin
    IbDtstTabela.Close;
    IbDtstTabela.Open;
    if not IbDtstTabela.Locate(GetCampoCodigoLimpo, sID, []) then
      raise Exception.Create('Registro não sincronizado com a base.' + #13 + 'Favor executar pesquisa para localizá-lo!');
  end;
end;

procedure TfrmGeNFComplementar.RegistrarNovaRotinaSistema;
begin
  if ( Trim(RotinaID) <> EmptyStr ) then
  begin
    if btbtnGerarNFe.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaGerarNFeID, btbtnGerarNFe.Caption, RotinaID);

    if btbtnCancelarNFC.Visible then
      SetRotinaSistema(ROTINA_TIPO_FUNCAO, RotinaCancelarNFCID, btbtnCancelarNFC.Caption, RotinaID);
  end;
end;

procedure TfrmGeNFComplementar.TotalValor(var aProduto, aBaseICMS, aValorICMS,
  aBaseICMS_ST, aValorICMS_ST: Currency);
begin
  aProduto      := 0.0;
  aBaseICMS     := 0.0;
  aValorICMS    := 0.0;
  aBaseICMS_ST  := 0.0;
  aValorICMS_ST := 0.0;

  with cdsTabelaItens do
  begin
    DisableControls;

    if (State in [dsEdit, dsInsert]) then
      Post;

    First;
    while not Eof do
    begin
      aProduto      := aProduto      + cdsTabelaItensVALOR_TOTAL.AsCurrency;
      aBaseICMS     := aBaseICMS     + cdsTabelaItensBC_ICMS.AsCurrency;
      aValorICMS    := aValorICMS    + cdsTabelaItensVALOR_ICMS.AsCurrency;
      aBaseICMS_ST  := aBaseICMS_ST  + cdsTabelaItensBC_ICMS_ST.AsCurrency;
      aValorICMS_ST := aValorICMS_ST + cdsTabelaItensVALOR_ICMS_ST.AsCurrency;

      Next;
    end;
    First;

    EnableControls;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeNFComplementar', TfrmGeNFComplementar);

end.
