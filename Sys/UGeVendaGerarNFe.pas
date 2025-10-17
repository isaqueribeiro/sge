unit UGeVendaGerarNFe;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, cxGraphics, cxLookAndFeels,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, Menus, cxButtons, cxSpinEdit,
  cxTimeEdit, cxTextEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinMcSkin,
  dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinBasic, dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinWXI;

type
  TfrmGeVendaGerarNFe = class(TfrmGrPadrao)
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
    lblInforme: TLabel;
    TmrAlerta: TTimer;
    lblDataHoraSaida: TLabel;
    btnCalcular: TcxButton;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    chkNaoInformarVencimento: TCheckBox;
    edDataSaida: TcxDateEdit;
    edHoraSaida: TcxTimeEdit;
    cdsVenda: TFDQuery;
    updVenda: TFDUpdateSQL;
    cdsVendaANO: TSmallintField;
    cdsVendaCODCONTROL: TIntegerField;
    cdsVendaCODEMP: TStringField;
    cdsVendaCODCLIENTE: TIntegerField;
    cdsVendaCODCLI: TStringField;
    cdsVendaDTVENDA: TSQLTimeStampField;
    cdsVendaDTFINALIZACAO_VENDA: TDateField;
    cdsVendaDATAEMISSAO: TDateField;
    cdsVendaHORAEMISSAO: TTimeField;
    cdsVendaSERIE: TStringField;
    cdsVendaNFE: TLargeintField;
    cdsVendaCFOP: TIntegerField;
    cdsVendaNFE_DENEGADA: TSmallintField;
    cdsVendaNFE_DENEGADA_MOTIVO: TStringField;
    cdsVendaSTATUS: TSmallintField;
    cdsVendaNFE_VALOR_BASE_ICMS: TFMTBCDField;
    cdsVendaNFE_VALOR_ICMS: TFMTBCDField;
    cdsVendaNFE_VALOR_BASE_ICMS_SUBST: TFMTBCDField;
    cdsVendaNFE_VALOR_ICMS_SUBST: TFMTBCDField;
    cdsVendaNFE_VALOR_TOTAL_PRODUTO: TFMTBCDField;
    cdsVendaNFE_VALOR_FRETE: TFMTBCDField;
    cdsVendaNFE_VALOR_SEGURO: TFMTBCDField;
    cdsVendaNFE_VALOR_DESCONTO: TFMTBCDField;
    cdsVendaNFE_VALOR_TOTAL_II: TFMTBCDField;
    cdsVendaNFE_VALOR_TOTAL_IPI: TFMTBCDField;
    cdsVendaNFE_VALOR_PIS: TFMTBCDField;
    cdsVendaNFE_VALOR_COFINS: TFMTBCDField;
    cdsVendaNFE_VALOR_OUTROS: TFMTBCDField;
    cdsVendaNFE_VALOR_TOTAL_NOTA: TFMTBCDField;
    cdsVendaVALOR_TOTAL_IPI: TFMTBCDField;
    cdsVendaVALOR_TOTAL_BRUTO: TFMTBCDField;
    cdsVendaVALOR_TOTAL_DESCONTO: TFMTBCDField;
    cdsVendaVALOR_TOTAL_LIQUIDO: TFMTBCDField;
    cdsVendaVALOR_BASE_ICMS_NORMAL_ENTRADA: TFMTBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_ENTRADA: TFMTBCDField;
    cdsVendaVALOR_BASE_ICMS_NORMAL_SAIDA: TBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_SAIDA: TFMTBCDField;
    cdsVendaVALOR_TOTAL_ICMS_NORMAL_DEVIDO: TFMTBCDField;
    cdsVendaVALOR_TOTAL_PIS: TBCDField;
    cdsVendaVALOR_TOTAL_COFINS: TBCDField;
    cdsVendaTOTALVENDA_BRUTA: TFMTBCDField;
    cdsVendaDESCONTO: TBCDField;
    cdsVendaTOTALVENDA: TFMTBCDField;
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
    bRetornoErro ,
    bDenegada    : Boolean;
    sDenegadaMotivo : String;
    procedure RecalcularTotalNota;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBVENDAS
  - TVENDASITENS
  - TBPRODUTO

  Views:

  Procedures:

*)

var
  frmGeVendaGerarNFe: TfrmGeVendaGerarNFe;

  function GerarNFe(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
    var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64;
    var Mensagem   : String;
    var ReturnErro : Boolean) : Boolean;

implementation

uses
    Controller.Tabela
  , UDMBusiness
  , UDMNFe
  , UFuncoes
  , UGeConsultarLoteNFe_v2
  , UConstantesDGE;

{$R *.dfm}

function GerarNFe(const AOwer : TComponent; Ano : Smallint; Numero : Integer;
  var SerieNFe, NumeroNFe  : Integer; var FileNameXML, ChaveNFE, ProtocoloNFE, ReciboNFE   : String; var NumeroLote  : Int64;
  var Mensagem   : String;
  var ReturnErro : Boolean) : Boolean;
var
  frm : TfrmGeVendaGerarNFe;
begin
  frm := TfrmGeVendaGerarNFe.Create(AOwer);
  try
    with frm do
    begin
      cdsVenda.Close;
      cdsVenda.ParamByName('anovenda').AsInteger := Ano;
      cdsVenda.ParamByName('numvenda').AsInteger := Numero;
      cdsVenda.Open;

      chkNaoInformarVencimento.Checked := not GetCfopGerarTitulo(cdsVenda.FieldByName('CFOP').AsInteger);

      lblDataEmissao.Visible   := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      dbDataEmissao.Visible    := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      lblHoraEmissao.Visible   := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      dbHoraEmissao.Visible    := not GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );

      lblDataHoraSaida.Visible := GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      edDataSaida.Visible      := GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );
      edHoraSaida.Visible      := GetSolicitaDHSaidaNFe( cdsVendaCODEMP.AsString );

      if edDataSaida.Visible then
      begin
        edDataSaida.EditValue := FormatDateTime('dd/mm/yyyy', GetDateTimeDB);
        edHoraSaida.EditValue := FormatDateTime('hh:mm:ss', GetDateTimeDB);
      end;

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

      ReturnErro := bRetornoErro;
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

    cdsVendaNFE_VALOR_TOTAL_NOTA.AsCurrency :=
      cdsVendaTOTALVENDA.AsCurrency           + // <- TOTAL VENDA = (TOTAL VENDA BRUTA - TOTAL DESCONTOS)
      cdsVendaNFE_VALOR_TOTAL_IPI.AsCurrency  +
      cdsVendaNFE_VALOR_ICMS_SUBST.AsCurrency +
      cdsVendaNFE_VALOR_FRETE.AsCurrency      +
      cdsVendaNFE_VALOR_SEGURO.AsCurrency     +
      cdsVendaNFE_VALOR_OUTROS.AsCurrency;
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
  bRT ,
  bOK : Boolean;
  sDH ,
  sSD ,
  sVN ,
  sRecibo   ,
  sVendaID  : String;
  aDataHora : TDateTime;
  aTipoMovimento : TTipoMovimento;
  aFileXML       : TStringList;
  aDenegada : Boolean;
  aDenegadaMotivo : String;
begin
(*
  IMR - 04/10/2019 :
    Removida a rotina de verificação do serviço de emissão da NFe da procedure "GerarNFeOnLineACBr()" para que
    esteja num nível de chamada acima.

  IMR - 29/10/2018 :
    Implementação da rotina de tratamento das rejeições sobre a duplicidade de notas
    fiscais.

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

  if chkNaoInformarVencimento.Checked then
    sVN := 'Alerta : Os vencimentos não serão informados na NF-e.' + #13#13
  else
    sVN := EmptyStr;

  DMNFe.LerConfiguracao(cdsVendaCODEMP.AsString, tipoDANFEFast);
  DMNFe.ValidarCnpjDocumento(cdsVendaCODEMP.AsString);

  if not DMNFe.ACBrNFe.WebServices.StatusServico.Executar then
  begin
    ShowWarning('Serviço Inoperante!' + #13#13 +
      'Motivos:' + #13 +
      '--------------------------------------' + #13 +
      '1. Certificado A1 ou A3 não instalado'  + #13 +
      '2. Certificado A3 não conectado na UBS' + #13 +
      '3. Webservice de emissão da NF-e offline.'
    );
    Exit;
  end;

  if (Copy(DMNFe.GetCnpjCertificado, 1, 8) <> Copy(gUsuarioLogado.Empresa, 1, 8)) then
  begin
    ShowWarning('A Empresa selecionada no login do sistema não está de acordo com o Certificado informado!');
    Exit;
  end;

  if ( ShowConfirm(sVN + 'Confirma a geração da NF-e?') ) then
  begin
    sDH := FormatDateTime('dd/mm/yyyy', cdsVendaDATAEMISSAO.AsDateTime) + ' ' +
      FormatDateTime('hh:mm:ss', cdsVendaHORAEMISSAO.AsDateTime);
    sSD := FormatDateTime('dd/mm/yyyy', edDataSaida.Date) + ' ' +
      FormatDateTime('hh:mm:ss', edHoraSaida.Time);

    // Validar Data/Hora de saída na NF-e
    if edDataSaida.Visible and (Trim(edDataSaida.EditValue) <> EmptyStr) and TryStrToDateTime(Trim(sSD), aDataHora) then
    begin
      if not StrIsDateTime(sSD) then
      begin
        ShowWarning('Data/Hora de saída inválida!');
        edDataSaida.SetFocus;
        Exit;
      end
      else
      if ( StrToDateTime(sSD) < StrToDateTime(sDH) ) then
      begin
        ShowWarning('Data/Hora de saída não pode ser menor que da Data/Hora de emissão da NF-e!');
        edDataSaida.SetFocus;
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

    if edDataSaida.Visible and (Trim(edDataSaida.Text) <> EmptyStr) and TryStrToDateTime(Trim(sSD), aDataHora) then
      sDH := Trim(sSD)
    else
      sDH := EmptyStr;

    bDenegada       := False;
    sDenegadaMotivo := EmptyStr;

    if DMNFe.GerarNFeOnLine(cdsVendaCODEMP.AsString) then
      bOK := DMNFe.GerarNFeOnLineACBr ( cdsVendaCODEMP.AsString, cdsVendaCODCLIENTE.AsInteger, sDH,
               cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML,
               sChaveNFE, sProtocoloNFE, sReciboNFE, iNumeroLote, bDenegada, sDenegadaMotivo,
               chkNaoInformarVencimento.Checked, False)
    else
      bOK := DMNFe.GerarNFeOffLineACBr( cdsVendaCODEMP.AsString, cdsVendaCODCLIENTE.AsInteger, sDH,
               cdsVendaANO.AsInteger, cdsVendaCODCONTROL.AsInteger,
               iSerieNFe, iNumeroNFe, sFileNameXML, sChaveNFE,
               chkNaoInformarVencimento.Checked, False);

    if bDenegada then
    begin
      cdsVenda.Edit;

      cdsVendaNFE_DENEGADA.AsInteger       := 1;
      cdsVendaNFE_DENEGADA_MOTIVO.AsString := AnsiUpperCase(Trim(sDenegadaMotivo));

      cdsVenda.Post;
      cdsVenda.ApplyUpdates;
      cdsVenda.CommitUpdates;

      CommitTransaction;
    end;

    if not bOk then
    begin
      // Refeição: Duplicidade de NF-e [nRec:999999999999999]
      // 1. Verificar se a mensagem de rejeição é sobre a duplicação da NF-e.
      // 2. Pegar o número de recibo retornado e buscar na SEFA a NF-e correspondente
      // 3. Identificar a venda nesta NF-e encontrada
      // 4. Comparar a venda encontrada com a venda corrente
      // 5. Se as vendas forem iguais, colocar [nRec:999999999999999] na venda corrente

      if ((DMNFe.MensagemErro) <> EmptyStr) then
      begin
        bRetornoErro := True;
        aFileXML := TStringList.Create;
        try
          if (Pos('Duplicidade', DMNFe.MensagemErro) > 0) then   // Passo 1
          begin
            sRecibo := StrOnlyNumbers( Copy(DMNFe.MensagemErro,  // Passo 2.1
              Pos('[nRec:', DMNFe.MensagemErro),
              Pos(']', DMNFe.MensagemErro)) );
            if ((Trim(sRecibo) <> EmptyStr) and (Trim(sRecibo) <> '000000000000000')) then // Passo 2.2
            begin
              bRT := BuscarRetornoReciboNFe(Self
                , cdsVendaCODEMP.AsString
                , Trim(sRecibo)
                , iSerieNFe
                , iNumeroNFe
                , sFileNameXML
                , sChaveNFE
                , sProtocoloNFE
                , aTipoMovimento
                , aDenegada
                , aDenegadaMotivo);

              if bRT and (aTipoMovimento = tmNFeSaida) then
              begin
                // Analisar o nome do arquivo XML retornado
                if (Trim(sFileNameXML) = EmptyStr) or (not FileExists(sFileNameXML)) then
                  sFileNameXML := DMNFe.GetDiretorioXmlNFe + sChaveNFE + '-nfe.xml';

                if FileExists(sFileNameXML) then                         // Passo 3
                begin
                  aFileXML.LoadFromFile(sFileNameXML);
                  sVendaID := 'Venda: ' + cdsVenda.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', cdsVenda.FieldByName('CODCONTROL').AsInteger);
                  if (Pos(sVendaID, aFileXML.Text) > 0) then             // Passo 3, 4
                  begin
                    sReciboNFE  := Trim(sRecibo);
                    iNumeroLote := iNumeroNFe;
                    DMNFe.GuardarLoteNFeVenda(
                        cdsVendaCODEMP.AsString
                      , cdsVenda.FieldByName('ANO').AsInteger
                      , cdsVenda.FieldByName('CODCONTROL').AsInteger
                      , iNumeroLote
                      , sReciboNFE);                                     // Passo 5

                    bRetornoErro := False;
                  end;
                end;
              end;
            end;
          end;
        finally
          aFileXML.Free;
        end;
      end;

    end;

    TmrAlerta.Enabled  := False;
    lblInforme.Visible := False;

    if ( bOK ) then
      ModalResult := mrOk
    else
      ModalResult := mrCancel;
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
  bRetornoErro  := False;
  lblInforme.Caption := EmptyStr;

  // Configurar tabela
  TTabelaController
    .New
    .Tabela( cdsVenda )
    .Display('TOTALVENDA_BRUTA', 'Total Bruto', ',0.00', TAlignment.taRightJustify)
    .Display('DESCONTO', 'Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('TOTALVENDA', 'Total Venda', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_BASE_ICMS', 'Base Cálculo ICMS', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_ICMS',      'Valor ICMS', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_BASE_ICMS_SUBST', 'Base Cálculo ICMS Subs.', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_ICMS_SUBST',      'Valor ICMS Subs.', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_TOTAL_PRODUTO',   'Total Produto', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_FRETE',      'Valor Frete', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_SEGURO',     'Valor Seguro', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_DESCONTO',   'Descontos ', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_TOTAL_II',   'Valor II', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_TOTAL_IPI',  'Valor IPI', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_PIS',        'Valor PIS', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_COFINS',     'Valor CONFINS', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_OUTROS',     'Outros', ',0.00', TAlignment.taRightJustify)
    .Display('NFE_VALOR_TOTAL_NOTA', 'Total NF', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_IPI',      'Total IPI', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_BRUTO',    'Total Bruto', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_DESCONTO', 'Total Descontos', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_LIQUIDO',  'Total Líquido', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_BASE_ICMS_NORMAL_ENTRADA',  'Base ICMS Entrada', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_ICMS_NORMAL_ENTRADA', 'Valor ICMS Entrada', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_BASE_ICMS_NORMAL_SAIDA',    'Base ICMS Saída', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_ICMS_NORMAL_SAIDA',   'Valor ICMS Saída', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_ICMS_NORMAL_DEVIDO',  'Total ICMS Devido', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_PIS',     'Total PIS', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_COFINS',  'Total CONFINS', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsVenda );
end;

procedure TfrmGeVendaGerarNFe.TmrAlertaTimer(Sender: TObject);
begin
  lblInforme.Visible := not lblInforme.Visible;
end;

procedure TfrmGeVendaGerarNFe.FormShow(Sender: TObject);
begin
  inherited;
  if ( edDataSaida.Visible and edDataSaida.Enabled ) then
    edDataSaida.SetFocus;
end;

procedure TfrmGeVendaGerarNFe.RegistrarRotinaSistema;
begin
  ;
end;

end.
