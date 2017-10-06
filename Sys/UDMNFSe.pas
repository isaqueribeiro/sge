unit UDMNFSe;

interface

uses
  UInfoVersao,
  UDMBusiness,
  UEcfFactory,

  PngImage,
  Variants,
  Forms,

  System.SysUtils, System.Classes, Data.DB,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  frxClass, frxDBSet;

type
  TDMNFSe = class(TDataModule)
    frdOSTomador: TfrxDBDataset;
    fdQryOSTomador: TFDQuery;
    frdOSCalculoImposto: TfrxDBDataset;
    fdQryOSCalculoImposto: TFDQuery;
    frdOSDadosServico: TfrxDBDataset;
    fdQryOSDadosServico: TFDQuery;
    frdOSDadosProduto: TfrxDBDataset;
    fdQryOSDadosProduto: TFDQuery;
    frdOSDuplicatas: TfrxDBDataset;
    fdQryOSDuplicatas: TFDQuery;
    frdOSFormaPagtos: TfrxDBDataset;
    fdQryOsFormaPagtos: TFDQuery;
    frrOSOrcamento: TfrxReport;
    frdOSDadosItem: TfrxDBDataset;
    fdQryOSDadosItem: TFDQuery;
  private
    { Private declarations }
    procedure LerConfiguracaoNFSe(const sCNPJEmitente : String; const tipoDANFE : TTipoDANFE = tipoDANFEFast); virtual; abstract;
    procedure GravarConfiguracaoNFSe(const sCNPJEmitente : String); virtual; abstract;

    function ImprimirCupomNaoFiscalOS_PORTA(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoOS, iNumOS : Integer;
      const BlocoImpressaoCupom : TBlocoImpressaoCupom = bicCupomRelatorioGerencial) : Boolean;
  public
    { Public declarations }
    procedure AbrirTomador(iCliente : Integer);
    procedure AbrirOS(AnoOS, NumeroOS : Integer);
    procedure AbrirNFSeEmitida(AnoOS, NumeroOS : Integer); virtual; abstract;

    function ImprimirCupomNaoFiscalOS(const sCNPJEmitente : String; iCodigoCliente : Integer;
      const sDataHoraSaida : String; const iAnoOS, iNumOS : Integer;
      const BlocoImpressaoCupom : TBlocoImpressaoCupom = bicCupomRelatorioGerencial) : Boolean;
  end;

var
  DMNFSe: TDMNFSe;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  UDMRecursos, UDMNFe, UFuncoes, UConstantesDGE, FileCtrl, IniFiles;

{$R *.dfm}

{ TDMNFSe }

procedure TDMNFSe.AbrirOS(AnoOS, NumeroOS: Integer);
begin
  with fdQryOSCalculoImposto do
  begin
    Close;
    ParamByName('ano').AsInteger      := AnoOS;
    ParamByName('controle').AsInteger := NumeroOS;
    Open;
  end;

  with fdQryOSFormaPagtos do
  begin
    Close;
    ParamByName('ano').AsInteger      := AnoOS;
    ParamByName('controle').AsInteger := NumeroOS;
    Open;
  end;

  with fdQryOSDadosItem do
  begin
    Close;
    ParamByName('ano').AsInteger      := AnoOS;
    ParamByName('controle').AsInteger := NumeroOS;
    Open;
  end;

  with fdQryOSDadosServico do
  begin
    Close;
    ParamByName('ano').AsInteger      := AnoOS;
    ParamByName('controle').AsInteger := NumeroOS;
    Open;
  end;

  with fdQryOSDadosProduto do
  begin
    Close;
    ParamByName('ano').AsInteger      := AnoOS;
    ParamByName('controle').AsInteger := NumeroOS;
    Open;
  end;

  with fdQryOSDuplicatas do
  begin
    Close;
    ParamByName('ano').AsInteger      := AnoOS;
    ParamByName('controle').AsInteger := NumeroOS;
    Open;
  end;
end;

procedure TDMNFSe.AbrirTomador(iCliente: Integer);
begin
  with fdQryOSTomador do
  begin
    Close;
    ParamByName('Codigo').AsInteger := iCliente;
    Open;
  end;
end;

function TDMNFSe.ImprimirCupomNaoFiscalOS(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoOS,
  iNumOS: Integer; const BlocoImpressaoCupom: TBlocoImpressaoCupom): Boolean;
begin
  Result := ImprimirCupomNaoFiscalOS_PORTA(sCNPJEmitente
    , iCodigoCliente
    , sDataHoraSaida
    , iAnoOS
    , iNumOS
    , BlocoImpressaoCupom);
end;

function TDMNFSe.ImprimirCupomNaoFiscalOS_PORTA(const sCNPJEmitente: String;
  iCodigoCliente: Integer; const sDataHoraSaida: String; const iAnoOS,
  iNumOS: Integer; const BlocoImpressaoCupom: TBlocoImpressaoCupom): Boolean;
var
  aEcfTipo   : TEcfTipo;
  aEcfConfig : TEcfConfiguracao;
  aEcf : TEcfFactory;

  bEmitirCumpoExtraParcelas : Boolean;
  cValorTroco,
  cPercentualTributoAprox,
  cValorTributoAprox     ,
  cValorTotalTributoAprox: Currency;

  sUrlConsultaNFCe  ,
  sDuplicata        ,
  sFileNameXML      ,
  sStringQrCode     ,
  sArquivoBmpQrCode : String;
  cTamQrCode        : TTamanhoQrCode;
  sCmd ,
  sPrm : String;
const
  TEXTO_TRIB_APROX_1 = '* Valor Total Aprox. Trib.:';
  TEXTO_TRIB_APROX_2 = '* R$ %s (%s)';
  TEXTO_TRIB_APROX_3 = '* Fonte IBPT';
  TEXTO_NUMERO_DANFE = 'Numero %s Serie %s Emissao %s';
  PESO_LINHA = 2;
begin
  LerConfiguracaoNFSe(sCNPJEmitente, tipoDANFE_ESCPOS);

  if GetCupomNaoFiscalTipoEmissaoID = -1 then
    aEcfTipo := ecfTEXTO
  else
    aEcfTipo := TEcfTipo(GetCupomNaoFiscalTipoEmissaoID);

  DMNFe.AbrirEmitente(sCNPJEmitente);
  AbrirTomador(iCodigoCliente);
  AbrirOS(iAnoOS, iNumOS);
  AbrirNFSeEmitida(iAnoOS, iNumOS);

  fdQryOSDadosItem.Last;
  fdQryOSFormaPagtos.Last;

//  {$IFDEF PRINTER_CUPOM}
//
  // Carregar XML da NF quando este existir

//  if Trim(qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString) <> EmptyStr then
//  begin
//    sFileNameXML := ExtractFilePath( ParamStr(0) ) + DIRECTORY_PRINT  + qryCalculoImposto.FieldByName('XML_NFE_FILENAME').AsString;
//    ForceDirectories( ExtractFilePath(sFileNameXML) );
//    TMemoField(qryCalculoImposto.FieldByName('XML_NFE')).SaveToFile( sFileNameXML );
//
//    CorrigirXML_NFe( qryCalculoImposto.FieldByName('XML_NFE').AsWideString, sFileNameXML );
//    RemoverAcentos_ArquivoTexto( sFileNameXML );
//
//    if FilesExists(sFileNameXML) then
//      with ACBrNFe do
//      begin
//        Configuracoes.Geral.ModeloDF := TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger);
//        Configuracoes.Geral.VersaoDF := TpcnVersaoDF(qryNFeEmitidaVERSAO.AsInteger);
//
//        NotasFiscais.Clear;
//        NotasFiscais.LoadFromString( qryCalculoImposto.FieldByName('XML_NFE').AsWideString );
//      end;
//  end;

  aEcfConfig.Dll              := EmptyStr;
  aEcfConfig.Impressora       := GetCupomNaoFiscalPortaNM;
  aEcfConfig.ModeloEspecifico := GetCupomNaoFiscalModeloEspID;
  aEcfConfig.Porta            := GetCupomNaoFiscalPortaDS;
  aEcfConfig.Empresa  := AnsiUpperCase( DMNFe.qryEmitenteNMFANT.AsString );
  aEcfConfig.Endereco := RemoveAcentos( Trim(DMNFe.qryEmitenteTLG_SIGLA.AsString + ' ' + DMNFe.qryEmitenteLOG_NOME.AsString + ', ' + DMNFe.qryEmitenteNUMERO_END.AsString) );
  aEcfConfig.Bairro   := RemoveAcentos( Trim(DMNFe.qryEmitenteBAI_NOME.AsString) );
  aEcfConfig.Fone     := StrFormatarFONE(DMNFe.qryEmitenteFONE.AsString);
  aEcfConfig.Cep      := StrFormatarCEP(DMNFe.qryEmitenteCEP.AsString);
  aEcfConfig.Cidade   := RemoveAcentos( DMNFe.qryEmitenteCID_NOME.AsString + '/' + DMNFe.qryEmitenteEST_SIGLA.AsString );
  aEcfConfig.Cnpj     := StrFormatarCnpj( sCNPJEmitente );
  aEcfConfig.InscEstadual   := DMNFe.qryEmitenteIE.AsString;
  aEcfConfig.ID             := FormatFloat('###0000000', iNumOS);
  aEcfConfig.ImprimirGliche := True;
  aEcfConfig.NumeroLinhas   := (qryDadosProduto.RecordCount * PESO_LINHA) +  IfThen(iCodigoCliente = CONSUMIDOR_FINAL_CODIGO, 30, 37);

  aEcfConfig.FonteImpressao.Nome    := GetCupomNaoFiscalFonteNome;
  aEcfConfig.FonteImpressao.Tamanho := GetCupomNaoFiscalFonteTamanho;

  if not qryNFeEmitida.IsEmpty then
    aEcfConfig.NumeroLinhas := aEcfConfig.NumeroLinhas + 37;

  aEcfConfig.ArquivoLogo   := Trim(ConfigACBr.edtLogoMarca.Text);
  aEcfConfig.ArquivoQRCode := EmptyStr;

  if ( BlocoImpressaoCupom in [bicCupomRelatorioGerencial, bicCupom] ) then
  begin
    aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
    try

      cValorTroco := 0.0;
      cPercentualTributoAprox := 0.0;
      cValorTributoAprox      := 0.0;
      cValorTotalTributoAprox := 0.0;

      with aEcf do
      begin
        Ecf.SoftHouse := GetCompanyName;
        Ecf.Sistema   := GetProductName;
        Ecf.Versao    := GetProductVersion;

        Ecf.Identifica_Cupom(Now, FormatFloat('###0000000', iNumVenda), qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString);

        if ( qryDestinatario.FieldByName('CODIGO').AsInteger <> CONSUMIDOR_FINAL_CODIGO ) then
          Ecf.Identifica_Consumidor( IfThen(StrIsCPF(qryDestinatario.FieldByName('CNPJ').AsString), StrFormatarCpf(qryDestinatario.FieldByName('CNPJ').AsString), StrFormatarCnpj(qryDestinatario.FieldByName('CNPJ').AsString))
            , RemoveAcentos(AnsiUpperCase(qryDestinatario.FieldByName('NOMEFANT').AsString))
            , Trim(qryDestinatario.FieldByName('TLG_SIGLA').AsString + ' ' + qryDestinatario.FieldByName('LOG_NOME').AsString + ', ' +
              qryDestinatario.FieldByName('NUMERO_END').AsString + ' - ' + qryDestinatario.FieldByName('BAI_NOME').AsString) + ' (' + qryDestinatario.FieldByName('CID_NOME').AsString + ')'
            , Trim(Copy(Trim(qryDestinatario.FieldByName('FONES').AsString), 1, Length(Trim(qryDestinatario.FieldByName('FONES').AsString)) - 1))
          );

        if qryNFeEmitida.IsEmpty then
          Ecf.Titulo_Cupom('NOTA DE ENTREGA')
        else
          Ecf.Titulo_Cupom_DANFE('DANFE NFC-e'
            , 'Documento Auxiliar da Nota Fiscal'
            , 'Eletronica para Consumidor Final'
            , 'Nao permite aprovimento de credito de ICMS');

        qryDadosProduto.First;

        while not qryDadosProduto.Eof do
        begin
          cPercentualTributoAprox := qryDadosProduto.FieldByName('NCM_ALIQUOTA_NAC').AsCurrency;
          if (cPercentualTributoAprox > 0.0) then
            cValorTributoAprox := qryDadosProduto.FieldByName('TOTAL_BRUTO').AsCurrency * cPercentualTributoAprox / 100
          else
            cValorTributoAprox := 0.0;

          Ecf.Incluir_Item(FormatFloat('00', qryDadosProduto.FieldByName('SEQ').AsInteger)
            , qryDadosProduto.FieldByName('CODPROD').AsString
            , RemoveAcentos( Copy(AnsiUpperCase(qryDadosProduto.FieldByName('DESCRI_APRESENTACAO').AsString), 1, 45) )
            , Trim(FormatFloat(',0.###', qryDadosProduto.FieldByName('QTDE').AsCurrency) + ' ' + Copy(Trim(qryDadosProduto.FieldByName('UNP_SIGLA').AsString), 1, 2))
            , FormatFloat(',0.00',  qryDadosProduto.FieldByName('PFINAL').AsCurrency)
            , 'T0'
            , FormatFloat(',0.00',  (qryDadosProduto.FieldByName('QTDE').AsCurrency * qryDadosProduto.FieldByName('PFINAL').AsCurrency))
          );

          cValorTotalTributoAprox := cValorTotalTributoAprox + cValorTributoAprox;
          qryDadosProduto.Next;
        end;

        if (qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) <> 0 then
        begin
          Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), True );
          Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
        end;

        Ecf.Linha;
        Ecf.Incluir_Texto_Valor('QTDE. TOTAL DE ITENS', FormatFloat(',000.##',  qryDadosProduto.RecordCount));
        Ecf.TotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency)  );

        qryFormaPagtos.First;
        bEmitirCumpoExtraParcelas := False;

        while not qryFormaPagtos.Eof do
        begin
          if not bEmitirCumpoExtraParcelas then
            bEmitirCumpoExtraParcelas := (qryFormaPagtos.FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger = 1) and (qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1);

          cValorTroco := qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency -
            qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;

          if ( cValorTroco > 0.0 ) then
          begin
            Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
              FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency));
            Ecf.Incluir_Texto_Valor('* Troco', FormatFloat(',0.00',  cValorTroco));
          end
          else
            Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
              FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency));

          if ( qryFormaPagtos.FieldByName('VENDA_PRAZO').AsInteger = 1 ) then
            Ecf.Texto_Livre('* ' + RemoveAcentos(
              IfThen(Trim(qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString) = EmptyStr
                , qryFormaPagtos.FieldByName('COND_DESCRICAO_FULL').Text
                , qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString)));

          qryFormaPagtos.Next;
        end;

        if (cValorTotalTributoAprox > 0.0) then
        begin
          Ecf.Linha;
          Ecf.Texto_Livre_Negrito(TEXTO_TRIB_APROX_1);
          Ecf.Texto_Livre_Negrito(Format(TEXTO_TRIB_APROX_2, [
            FormatFloat(',0.00', cValorTotalTributoAprox),
            FormatFloat(',0.##"%"', cValorTotalTributoAprox / qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency * 100)]));
          Ecf.Texto_Livre_Negrito(TEXTO_TRIB_APROX_3);
        end;

        if (Trim(qryCalculoImposto.FieldByName('OBS').AsString) <> EmptyStr) then
        begin
          Ecf.Linha;
          Ecf.Texto_Livre( '* Venda: ' + qryCalculoImposto.FieldByName('ANO').AsString + '/' + FormatFloat('###0000000', qryCalculoImposto.FieldByName('CODCONTROL').AsInteger) );
          Ecf.Texto_Livre( '* Cond. Pgto.: ' + qryCalculoImposto.FieldByName('LISTA_COND_PAGO_FULL').AsString);
          Ecf.Texto_Livre( '* ' + Trim(qryCalculoImposto.FieldByName('OBS').AsString) );
        end;

        if not qryNFeEmitida.IsEmpty then
        begin
          Ecf.Linha;
          Ecf.Texto_Livre_Centralizado( Format(TEXTO_NUMERO_DANFE, [FormatFloat('###0000000', qryNFeEmitidaNUMERO.AsInteger)
            , FormatFloat('000', qryNFeEmitidaSERIE.AsInteger)
            , FormatDateTime('dd/mm/yyyy', qryNFeEmitidaDATAEMISSAO.AsDateTime)]) );
          Ecf.Texto_Livre_Centralizado( 'Via Consumidor' );
          Ecf.Texto_Livre_Centralizado( 'Consulte pela Chave de Acesso em:' );

          if (TpcnModeloDF(qryNFeEmitidaMODELO.AsInteger) = moNFCe) then
            sUrlConsultaNFCe :=
              ACBrNFe.GetURLConsultaNFCe(ACBrNFe.Configuracoes.WebServices.UFCodigo
                , ACBrNFe.Configuracoes.WebServices.Ambiente
              )
          else
            sUrlConsultaNFCe := '';

          Ecf.Texto_Livre_Centralizado( sUrlConsultaNFCe );

          Ecf.Texto_Livre_Centralizado( 'CHAVE DE ACESSO' );
          Ecf.Texto_Livre_Centralizado( ACBrDFeUtil.FormatarChaveAcesso(qryNFeEmitidaCHAVE.AsString) );
          Ecf.Linha;
          Ecf.Texto_Livre_Centralizado( 'Consulta via leitor de QR Code' );

          // Gerar Arquivo QRCODE

          sArquivoBmpQRCode := ExtractFilePath(ParamStr(0)) + 'Temp\' + qryNFeEmitidaCHAVE.AsString + '.bmp';
          ForceDirectories( ExtractFilePath(sArquivoBmpQRCode) );

          if (ACBrNFe.NotasFiscais.Count = 0) then
            sStringQRCode := ACBrNFe.GetURLQRCode(
                UFtoCUF(qryEmitenteEST_SIGLA.AsString)             // Código UF
              , ACBrNFe.Configuracoes.WebServices.Ambiente         // Ambiente do WebService
              , 'NFe' + qryNFeEmitidaCHAVE.AsString                // ID da Nota Fiscal (NFe + Chave)
              , qryDestinatario.FieldByName('CNPJ').AsString       // CPJ/CNPJ do Consumidor
              , qryCalculoImposto.FieldByName('DATAEMISSAO').AsDateTime            // Data de Emissão
              , qryCalculoImposto.FieldByName('NFE_VALOR_TOTAL_NOTA').AsCurrency   // Valor da Nota Fiscal
              , qryCalculoImposto.FieldByName('NFE_VALOR_ICMS').AsCurrency         // Valor do ICMS da Nota Fiscal
              , EmptyStr                                                           // Assinatura Digital (A1 ou A3)
            )
          else
          begin
            sStringQRCode := ACBrNFe.NotasFiscais[0].NFe.infNFeSupl.qrCode;
            sStringQRCode :=
              StringReplace(
                StringReplace(
                  StringReplace(
                    StringReplace(sStringQRCode, '![CDATA[', '', [rfReplaceAll])
                  , ']]', '', [rfReplaceAll])
                , '<', '', [rfReplaceAll])
              , '>', '', [rfReplaceAll]);
          end;

          if ( Trim(sStringQRCode) = EmptyStr ) then
            sStringQRCode := ACBrNFe.GetURLQRCode(
                ACBrNFe.NotasFiscais[0].NFe.Ide.cUF
              , ACBrNFe.NotasFiscais[0].NFe.Ide.tpAmb
              , OnlyNumber(ACBrNFe.NotasFiscais[0].NFe.infNFe.ID)
              , Trim(IfThen(ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro <> EmptyStr
                , ACBrNFe.NotasFiscais[0].NFe.Dest.idEstrangeiro
                , ACBrNFe.NotasFiscais[0].NFe.Dest.CNPJCPF))
              , ACBrNFe.NotasFiscais[0].NFe.Ide.dEmi
              , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vNF
              , ACBrNFe.NotasFiscais[0].NFe.Total.ICMSTot.vICMS
              , ACBrNFe.NotasFiscais[0].NFe.signature.DigestValue);

          if Copy(sStringQRCode, 1, 1) = '?' then
            sStringQRCode := sUrlConsultaNFCe + sStringQRCode;

          Case aEcfTipo of
            ecfPadraoWindows, ecfLPTX, ecfTEXTO:
              cTamQrCode := tamQrCode200;

            ecfDaruma, ecfBematech, ecfBematechMp2032DLL:
              cTamQrCode := tamQrCode160;

            else
              cTamQrCode := tamQrCode300;
          end;

          GerarArquivoQRCODEGoogle(sArquivoBmpQrCode, sStringQrCode, cTamQrCode);
          // Esta função está gerando o QRCODE mas na hora da impressão a imagem
          // está sendo sobreposta pelos textos.
          //GerarArquivoQrCode(sArquivoBmpQrCode, sStringQrCode, cTamQrCode);

          if FileExists(sArquivoBmpQRCode) then
            Ecf.ImprimirQRCode( sArquivoBmpQRCode );

          Ecf.Texto_Livre_Centralizado( 'Protocolo de Autorizacao' );
          Ecf.Texto_Livre_Centralizado( qryNFeEmitidaPROTOCOLO.AsString         + ' '
            + FormatDateTime('dd/mm/yyyy', qryNFeEmitidaDATAEMISSAO.AsDateTime) + ' '
            + FormatDateTime('hh:mm:ss',   qryNFeEmitidaHORAEMISSAO.AsDateTime) );
        end;
      end;

    finally
      aEcf.Ecf.Finalizar;
      aEcf.Free;

      DeleteFiles(sArquivoBmpQRCode);
    end;
  end;

  // Bloco para verificar a necessidade de impressa do Cupom Extra
  qryFormaPagtos.First;
  while not qryFormaPagtos.Eof do
  begin
    if not bEmitirCumpoExtraParcelas then
      bEmitirCumpoExtraParcelas := (qryFormaPagtos.FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger = 1) and (qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1);
    qryFormaPagtos.Next;
  end;

  // Emitir Cupom Relatório Gerencial com parcelas para consumidor

  if bEmitirCumpoExtraParcelas and (aEcfTipo in [ecfPadraoWindows, ecfLPTX, ecfTEXTO, ecfBematech, ecfBematechMp2032DLL]) then
    if ( BlocoImpressaoCupom in [bicCupomRelatorioGerencial, bicRelatorioGerencial] ) then
    begin
      aEcfConfig.NumeroLinhas := (qryFormaPagtos.RecordCount * PESO_LINHA) + 37;
      aEcf := TEcfFactory.CriarEcf(aEcfTipo, aEcfConfig);
      try

        with aEcf do
        begin
          Ecf.SoftHouse := GetCompanyName;
          Ecf.Sistema   := GetProductName;
          Ecf.Versao    := GetVersion;

          Ecf.Identifica_Cupom(Now, FormatFloat('###0000000', iNumVenda), qryCalculoImposto.FieldByName('VENDEDOR_NOME').AsString);
          Ecf.Titulo_Livre( 'RELATORIO GERENCIAL' );
          Ecf.Compactar_Fonte;

          Ecf.Linha;

          if (qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) <> 0 then
          begin
            Ecf.SubTotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDABRUTA').AsCurrency), False );
            Ecf.Desconto( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('DESCONTO').AsCurrency + qryCalculoImposto.FieldByName('DESCONTO_CUPOM').AsCurrency) );
            Ecf.Linha;
          end;

          Ecf.TotalVenda( FormatFloat(',0.00',  qryCalculoImposto.FieldByName('TOTALVENDA').AsCurrency)  );

          qryFormaPagtos.First;

          while not qryFormaPagtos.Eof do
          begin
            cValorTroco := qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency - qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency;

            if ( cValorTroco > 0.0  ) then
              Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
                FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_RECEBIDO').AsCurrency))
            else
              Ecf.Incluir_Forma_Pgto(RemoveAcentos(qryFormaPagtos.FieldByName('DESCRI').AsString),
                FormatFloat(',0.00',  qryFormaPagtos.FieldByName('VALOR_FPAGTO').AsCurrency));

            Ecf.Texto_Livre('* ' + RemoveAcentos(
              IfThen(Trim(qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString) = EmptyStr
                , qryFormaPagtos.FieldByName('COND_DESCRICAO_FULL').Text
                , qryFormaPagtos.FieldByName('COND_DESCRICAO_PDV').AsString)));

            if ( cValorTroco > 0.0 ) then
              Ecf.Incluir_Texto_Valor('* Troco', FormatFloat(',0.00',  cValorTroco));

            qryFormaPagtos.Next;
          end;

          Ecf.Linha;
          Ecf.Titulo_Livre( 'VENCIMENTO(S)' );

          qryDuplicatas.First;

          while not qryDuplicatas.Eof do
          begin
            sDuplicata := qryDuplicatas.FieldByName('ANOLANC').AsString + '/' +
              FormatFloat('###00000"."', qryDuplicatas.FieldByName('NUMLANC').AsInteger) +
              FormatFloat('00', qryDuplicatas.FieldByName('PARCELA').AsInteger) + ' ' +
              FormatDateTime('dd/mm/yyyy', qryDuplicatas.FieldByName('DTVENC').AsDateTime);
            Ecf.Incluir_Texto_Valor(Trim(sDuplicata), FormatFloat(',0.00',  qryDuplicatas.FieldByName('VALORREC').AsCurrency));

            qryDuplicatas.Next;
          end;

          Ecf.Texto_Livre('.');
          Ecf.Texto_Livre('.');
          Ecf.Texto_Livre('.');
          Ecf.Texto_Livre('.');
          Ecf.Texto_Livre('.');
          Ecf.Texto_Livre('.');
          Ecf.Pular_Linha(PULAR_LINHA_FINAL);

          Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas, '----------------------------------------') );
          Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas, RemoveAcentos(AnsiUpperCase(qryDestinatario.FieldByName('NOMEFANT').AsString))) );
          Ecf.Texto_Livre( Ecf.Centralizar(Ecf.Num_Colunas,
            IfThen(StrIsCPF(qryDestinatario.FieldByName('CNPJ').AsString)
              , StrFormatarCpf(qryDestinatario.FieldByName('CNPJ').AsString)
              , StrFormatarCnpj(qryDestinatario.FieldByName('CNPJ').AsString))) );
        end;

      finally
        aEcf.Ecf.Finalizar;
        aEcf.Free;
      end;
    end;

//  {$ELSE}
//
//  sCmd   := ExtractFilePath(ParamStr(0)) + 'PrinterCupom.exe';
//  Result := FileExists(sCmd);
//
//  if Result then
//  begin
//    sCmd := '"' + Trim(sCmd) + '"';
//    sPrm := sCNPJEmitente
//      + ' ' + IntToStr(iCodigoCliente)
//      + ' ' + IntToStr(iAnoVenda)
//      + ' ' + IntToStr(iNumVenda)
//      + ' ' + IntToStr(Ord(bicCupom));
//    ShellExecute(0, 'Open', PChar(sCmd), PChar(sPrm), nil, SW_SHOW);
//    SetFocus(Application.Handle);
//
//    // Bloco para verificar a necessidade de impressa do Cupom Extra
//    qryFormaPagtos.First;
//    while not qryFormaPagtos.Eof do
//    begin
//      if not bEmitirCumpoExtraParcelas then
//        bEmitirCumpoExtraParcelas := (qryFormaPagtos.FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger = 1) and (qryCalculoImposto.FieldByName('VENDA_PRAZO').AsInteger = 1);
//      qryFormaPagtos.Next;
//    end;
//
//    if bEmitirCumpoExtraParcelas then
//    begin
//      Sleep(1000);
//      sCmd := '"' + Trim(ExtractFilePath(ParamStr(0)) + 'PrinterCupom.exe') + '"';
//      sPrm := sCNPJEmitente
//        + ' ' + IntToStr(iCodigoCliente)
//        + ' ' + IntToStr(iAnoVenda)
//        + ' ' + IntToStr(iNumVenda)
//        + ' ' + IntToStr(Ord(bicRelatorioGerencial));
//      ShellExecute(0, 'Open', PChar(sCmd), PChar(sPrm), nil, SW_SHOW);
//      SetFocus(Application.Handle);
//    end;
//
//  end
//  else
//    ShowError('Arquivo não localizado!' + #13 + sCmd);
//
//  {$ENDIF}
end;

end.
