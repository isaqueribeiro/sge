unit UGeImportarNFE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClipBrd, UGrPadrao,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, Vcl.ComCtrls,
  Datasnap.DBClient;

type
  TfrmGeImportarNFE = class(TfrmGrPadrao)
    qryEmpresa: TIBQuery;
    qryEmpresaCNPJ: TIBStringField;
    qryEmpresaRZSOC: TIBStringField;
    dtsEmpresa: TDataSource;
    GrpBxEmpresa: TGroupBox;
    lblCNPJ: TLabel;
    lblRazaoSocial: TLabel;
    dbCNPJ: TDBEdit;
    dbRazaoSocial: TDBEdit;
    Bevel1: TBevel;
    GrpBxManifesto: TGroupBox;
    lblChaveNFe: TLabel;
    edChaveNFe: TEdit;
    Bevel2: TBevel;
    lblInforme: TLabel;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    btnManifesto: TcxButton;
    GrpBxDadosNFe: TGroupBox;
    lblArquivoXML: TLabel;
    Bevel3: TBevel;
    edArquivoXML: TcxButtonEdit;
    btnCarregarXML: TcxButton;
    pgcNFe: TPageControl;
    tbsNFe: TTabSheet;
    tbsEmitente: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    cdsIdentificacao: TClientDataSet;
    cdsEmitente: TClientDataSet;
    cdsDadosProdutos: TClientDataSet;
    cdsDestinatario: TClientDataSet;
    cdsDuplicatas: TClientDataSet;
    cdsParametros: TClientDataSet;
    cdsCalculoImposto: TClientDataSet;
    cdsTransportador: TClientDataSet;
    cdsVeiculo: TClientDataSet;
    cdsVolumes: TClientDataSet;
    cdsEventos: TClientDataSet;
    cdsISSQN: TClientDataSet;
    cdsFatura: TClientDataSet;
    cdsLocalRetirada: TClientDataSet;
    cdsLocalEntrega: TClientDataSet;
    cdsInformacoesAdicionais: TClientDataSet;
    cdsPagamento: TClientDataSet;
    cdsInutilizacao: TClientDataSet;
    procedure ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnCarregarXMLClick(Sender: TObject);
    procedure edArquivoXMLPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure qryEmpresaCNPJGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    procedure CarregarEmpresa(const sCnpj : String);
    procedure CarregarXML(const sCnpj : String; aArquivoXmlNFe : String);
    procedure SetDataSetsXML;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeImportarNFE: TfrmGeImportarNFE;

(*
  Tabelas:
  - TBEMPRESA
  - TBLOG_TRANSACAO

  Views:

  Procedures:

*)

implementation

uses
  UDMBusiness, UDMNFe, UConstantesDGE, UFuncoes, UDMRecursos,
  pcnConversaoNFe, pcnConversao;

{$R *.dfm}

{ TfrmGrPadrao1 }

procedure TfrmGeImportarNFE.ApenasNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    Abort;
  end;
end;

procedure TfrmGeImportarNFE.btnCarregarXMLClick(Sender: TObject);
begin
  if (Trim(edArquivoXML.Text) = EmptyStr) then
    ShowWarning('Favor selecionar o arquivo XML da NF-e!')
  else
  if not FileExists(Trim(edArquivoXML.Text)) then
    ShowWarning('Arquivo XML não existe!')
  else
    CarregarXML(gUsuarioLogado.Empresa, Trim(edArquivoXML.Text));
end;

procedure TfrmGeImportarNFE.CarregarEmpresa(const sCnpj: String);
begin
  with qryEmpresa do
  begin
    Close;
    ParamByName('cnpj').AsString := sCnpj;
    Open;
  end;
end;

procedure TfrmGeImportarNFE.CarregarXML(const sCnpj: String;
  aArquivoXmlNFe: String);
var
  aNomeArquivoXML,
  aEmitente      ,
  aDestinatario  ,
  aRecibo        ,
  aProtocolo     ,
  aChave         : String;
  aDataHoraEmissao : TDateTime;
  aNotaValida      : Boolean;
  aSerie  ,
  sVersao : String;
  aNumero ,
  aModelo ,
  aVersao : Integer;
  aTipoNota : TTipoNF;
  aValorNF  : Currency;
begin
  with DMNFe do
  begin
    aNotaValida := False;

    if Trim(sCnpj) = EmptyStr then
      LerConfiguracao(gUsuarioLogado.Empresa, tipoDANFEFast)
    else
      LerConfiguracao(sCnpj, tipoDANFEFast);

    try
      with ACBrNFe do
      begin
        NotasFiscais.Clear;
        NotasFiscais.LoadFromFile(aArquivoXmlNFe, False);

        with NotasFiscais.Items[0].NFe do
        begin
          DANFE.Logo    := EmptyStr;
          aEmitente     := Emit.CNPJCPF;
          aDestinatario := Dest.CNPJCPF;
          aSerie    := FormatFloat('#00', Ide.serie);
          aNumero   := Ide.nNF;

          Case Ide.modelo of
            MODELO_NFE  : aModelo := Ord(moNFe);
            MODELO_NFCE : aModelo := Ord(moNFCe);
          end;

          aDataHoraEmissao := Ide.dEmi;
          aTipoNota        := TTipoNF(Ord( Ide.tpNF ));

          sVersao := NotasFiscais.Items[0].NFe.infNFe.VersaoStr;

          if ( Trim(sVersao) = 'versao="2.00"' ) then
            aVersao := Ord(ve200)
          else
          if ( Trim(sVersao) = 'versao="3.00"' ) then
            aVersao := Ord(ve300)
          else
          if ( Trim(sVersao) = 'versao="3.10"' ) then
            aVersao := Ord(ve310);
        end;

        if ( (NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC) or (not Assigned(NotasFiscais.Items[0].NFe.procNFe)) ) then
        begin
//          WebServices.ConsultaDPEC.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
//          WebServices.ConsultaDPEC.Executar;
//
//          DANFE.ProtocoloNFe := WebServices.ConsultaDPEC.nRegDPEC + ' ' + DateTimeToStr(WebServices.ConsultaDPEC.dhRegDPEC);
          WebServices.Consulta.NFeChave := NotasFiscais.Items[0].NFe.infNFe.ID;
          WebServices.Consulta.Executar;

          DANFE.ProtocoloNFe := WebServices.Consulta.protNFe.nProt + ' ' + DateTimeToStr(WebServices.Consulta.protNFe.dhRecbto);
        end;

        aNotaValida := Assigned(NotasFiscais.Items[0].NFe.procNFe);

        if aNotaValida then
        begin
          // Capiturar informações iniciais do arquivo
          aChave     := StringReplace(AnsiUpperCase(NotasFiscais.Items[0].NFe.infNFe.ID), 'NFE', '', [rfReplaceAll]);
          aProtocolo := NotasFiscais.Items[0].NFe.procNFe.nProt;
          aRecibo    := aProtocolo;
          aValorNF   := NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;

          aNomeArquivoXML := aChave + '_view.xml';
          NotasFiscais.Items[0].GravarXML(aNomeArquivoXML, ExtractFilePath(aArquivoXmlNFe));

          if (Trim(edChaveNFe.Text) = EmptyStr) then
            edChaveNFe.Text := aChave;

          if (Trim(edChaveNFe.Text) <> aChave) then
          begin
            ShowError('Arquivo selecionado não pertence a chave informada!');
            Exit;
          end;

          // Ler arquivo por completo



        end;
      end;
    except
      On E : Exception do
        ShowError('Erro ao tentar validar/carregar XML da NF-e.' + #13 +
          'Arquivo XML inválido!' + #13#13 +
          'ImprimirArquivoNFeDANFE() --> ' + e.Message);
    end;
  end;
end;

procedure TfrmGeImportarNFE.edArquivoXMLPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  with DMNFe do
  begin
    if opdNotas.Execute then
      edArquivoXML.Text := opdNotas.FileName;
  end;
end;

procedure TfrmGeImportarNFE.FormCreate(Sender: TObject);
begin
  inherited;
  tbsNFe.TabVisible := False; // Provisório

  SetDataSetsXML;
  CarregarEmpresa(gUsuarioLogado.Empresa);
  btnManifesto.Enabled := GetEstacaoEmitiNFe(gUsuarioLogado.Empresa);
  pgcNFe.ActivePage    := tbsEmitente;
end;

procedure TfrmGeImportarNFE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_F5 ) then
  begin
    if Clipboard.HasFormat( CF_TEXT ) then
      if ( Length(Trim(Clipboard.AsText)) = NFE_TAMANHO_NUMERO_CHAVE ) then // 15160414547157000146650010000000061000000065
        edChaveNFe.Text := Trim(Clipboard.AsText);
  end
  else
    inherited;
end;

procedure TfrmGeImportarNFE.qryEmpresaCNPJGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeImportarNFE.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeImportarNFE.SetDataSetsXML;
begin
  // cdsIdentificacao
  cdsIdentificacao := TClientDataSet.Create(Self);
  with cdsIdentificacao do
  begin
    FieldDefs.Add('Id'            , ftString, 44);
    FieldDefs.Add('Chave'         , ftString, 60);
    FieldDefs.Add('cUF'           , ftString, 2);
    FieldDefs.Add('cNF'           , ftString, 9);
    FieldDefs.Add('NatOp'         , ftString, 60);
    FieldDefs.Add('IndPag'        , ftString, 1);
    FieldDefs.Add('Mod_'          , ftString, 2);
    FieldDefs.Add('Serie'         , ftString, 3);
    FieldDefs.Add('NNF'           , ftString, 11);
    FieldDefs.Add('DEmi'          , ftString, 19);
    FieldDefs.Add('DSaiEnt'       , ftString, 10);
    FieldDefs.Add('TpNF'          , ftString, 1);
    FieldDefs.Add('CMunFG'        , ftString, 7);
    FieldDefs.Add('TpImp'         , ftString, 1);
    FieldDefs.Add('TpEmis'        , ftString, 1);
    FieldDefs.Add('CDV'           , ftString, 1);
    FieldDefs.Add('TpAmb'         , ftString, 1);
    FieldDefs.Add('FinNFe'        , ftString, 1);
    FieldDefs.Add('ProcEmi'       , ftString, 1);
    FieldDefs.Add('VerProc'       , ftString, 6);
    FieldDefs.Add('HoraSaida'     , ftString, 10);
    FieldDefs.Add('MensagemFiscal', ftString, 200);
    FieldDefs.Add('URL'           , ftString, 1000);
    CreateDataSet;
  end;

  // cdsEmitente
  cdsEmitente := TClientDataSet.Create(Self);
  with cdsEmitente do
  begin
    FieldDefs.Add('CNPJ'          , ftString, 18);
    FieldDefs.Add('XNome'         , ftString, 60);
    FieldDefs.Add('XFant'         , ftString, 60);
    FieldDefs.Add('XLgr'          , ftString, 60);
    FieldDefs.Add('Nro'           , ftString, 60);
    FieldDefs.Add('XCpl'          , ftString, 60);
    FieldDefs.Add('XBairro'       , ftString, 60);
    FieldDefs.Add('CMun'          , ftString, 7);
    FieldDefs.Add('XMun'          , ftString, 60);
    FieldDefs.Add('UF'            , ftString, 2);
    FieldDefs.Add('CEP'           , ftString, 9);
    FieldDefs.Add('CPais'         , ftString, 4);
    FieldDefs.Add('XPais'         , ftString, 60);
    FieldDefs.Add('Fone'          , ftString, 15);
    FieldDefs.Add('IE'            , ftString, 14);
    FieldDefs.Add('IM'            , ftString, 15);
    FieldDefs.Add('IEST'          , ftString, 15);
    FieldDefs.Add('CRT'           , ftString, 1);
    FieldDefs.Add('DESCR_CST'     , ftString, 30);
    FieldDefs.Add('DADOS_ENDERECO', ftString, 1000);
    CreateDataSet;
  end;

  // cdsDestinatario
  cdsDestinatario := TClientDataSet.Create(Self);
  with cdsDestinatario do
  begin
    FieldDefs.Add('CNPJCPF'   , ftString, 18);
    FieldDefs.Add('XNome'     , ftString, 60);
    FieldDefs.Add('XLgr'      , ftString, 60);
    FieldDefs.Add('Nro'       , ftString, 60);
    FieldDefs.Add('XCpl'      , ftString, 60);
    FieldDefs.Add('XBairro'   , ftString, 60);
    FieldDefs.Add('CMun'      , ftString, 7);
    FieldDefs.Add('XMun'      , ftString, 60);
    FieldDefs.Add('UF'        , ftString, 2);
    FieldDefs.Add('CEP'       , ftString, 9);
    FieldDefs.Add('CPais'     , ftString, 4);
    FieldDefs.Add('XPais'     , ftString, 60);
    FieldDefs.Add('Fone'      , ftString, 15);
    FieldDefs.Add('IE'        , ftString, 18);
    FieldDefs.Add('Consumidor', ftString, 150);
    CreateDataSet;
  end;

  // cdsDadosProdutos
  cdsDadosProdutos   := TClientDataSet.Create(Self);
  with cdsDadosProdutos do
  begin
    FieldDefs.Add('CProd'     , ftString, 60);
    FieldDefs.Add('cEAN'      , ftString, 60);
    FieldDefs.Add('XProd'     , ftString, 120);
    FieldDefs.Add('infAdProd' , ftString, 1000);
    FieldDefs.Add('NCM'       , ftString, 9);
    FieldDefs.Add('EXTIPI'    , ftString, 8);
    FieldDefs.Add('genero'    , ftString, 8);
    FieldDefs.Add('CFOP'      , ftString, 4);
    FieldDefs.Add('UCom'      , ftString, 6);
    FieldDefs.Add('QCom'      , ftFloat);
    FieldDefs.Add('VUnCom'    , ftFloat);
    FieldDefs.Add('VProd'     , ftString, 18);
    FieldDefs.Add('cEANTrib'  , ftString, 60);
    FieldDefs.Add('UTrib'     , ftString, 6);
    FieldDefs.Add('QTrib'     , ftFloat);
    FieldDefs.Add('vUnTrib'   , ftFloat);
    FieldDefs.Add('vFrete'    , ftString, 18);
    FieldDefs.Add('vOutro'    , ftString, 18);
    FieldDefs.Add('vSeg'      , ftString, 18);
    FieldDefs.Add('vDesc'     , ftString, 18);
    FieldDefs.Add('ORIGEM'    , ftString, 1);
    FieldDefs.Add('CST'       , ftString, 3);
    FieldDefs.Add('vBC'       , ftString, 18);
    FieldDefs.Add('pICMS'     , ftString, 18);
    FieldDefs.Add('vICMS'     , ftString, 18);
    FieldDefs.Add('vIPI'      , ftString, 18);
    FieldDefs.Add('pIPI'      , ftString, 18);
    FieldDefs.Add('VTotTrib'  , ftString, 18);
    FieldDefs.Add('ChaveNFe'  , ftString, 50);
    FieldDefs.Add('vISSQN'    , ftString, 18);
    FieldDefs.Add('vBcISSQN'  , ftString, 18);
    FieldDefs.Add('vBcST'     , ftString, 18);
    FieldDefs.Add('vICMSST'   , ftString, 18);
    FieldDefs.Add('nLote'     , ftString, 20);
    FieldDefs.Add('qLote'     , ftFloat);
    FieldDefs.Add('dFab'      , ftDateTime);
    FieldDefs.Add('dVal'      , ftDateTime);
    FieldDefs.Add('DescricaoProduto', ftString, 2000);
    FieldDefs.Add('Unidade'   , ftString, 6);
    FieldDefs.Add('Quantidade', ftString, 18);
    FieldDefs.Add('ValorUnitario'   , ftString, 18);
    FieldDefs.Add('Valorliquido'    , ftString, 18);
    FieldDefs.Add('ValorAcrescimos' , ftString, 18);
    CreateDataSet;
  end;

  // cdsParametros
  cdsParametros  := TClientDataSet.Create(Self);
  with cdsParametros do
  begin
    FieldDefs.Add('poscanhoto'    , ftString, 1);
    FieldDefs.Add('ResumoCanhoto' , ftString, 200);
    FieldDefs.Add('Mensagem0'     , ftString, 60);
    FieldDefs.Add('Imagem'        , ftString, 256);
    FieldDefs.Add('Sistema'       , ftString, 150);
    FieldDefs.Add('Usuario'       , ftString, 60);
    FieldDefs.Add('Fax'           , ftString, 60);
    FieldDefs.Add('Site'          , ftString, 60);
    FieldDefs.Add('Email'         , ftString, 60);
    FieldDefs.Add('Desconto'      , ftString, 60);
    FieldDefs.Add('TotalLiquido'          , ftString, 60);
    FieldDefs.Add('ChaveAcesso_Descricao' , ftString, 90);
    FieldDefs.Add('Contingencia_ID'       , ftString, 36);
    FieldDefs.Add('Contingencia_Descricao', ftString, 60);
    FieldDefs.Add('Contingencia_Valor'    , ftString, 60);
    FieldDefs.Add('LinhasPorPagina'       , ftInteger);
    FieldDefs.Add('LogoExpandido'         , ftString, 1);
    FieldDefs.Add('DESCR_CST'             , ftString, 30);
    FieldDefs.Add('ConsultaAutenticidade' , ftString, 300);
    FieldDefs.Add('sDisplayFormat'        , ftString, 25);
    FieldDefs.Add('iFormato'              , ftInteger);
    FieldDefs.Add('Casas_qCom'            , ftInteger);
    FieldDefs.Add('Casas_vUnCom'          , ftInteger);
    FieldDefs.Add('Mask_qCom'             , ftString, 30);
    FieldDefs.Add('Mask_vUnCom'           , ftString, 30);
    FieldDefs.Add('LogoCarregado'         , ftBlob);
    FieldDefs.Add('QrCodeCarregado'       , ftGraphic, 1000);
    FieldDefs.Add('DescricaoViaEstabelec' , ftString, 30);
    FieldDefs.Add('QtdeItens'             , ftInteger);
    FieldDefs.Add('ExpandirDadosAdicionaisAuto', ftString, 1);
    FieldDefs.Add('ImprimeDescAcrescItem'      , ftInteger);
    CreateDataSet;
  end;

  // cdsDuplicatas
  cdsDuplicatas := TClientDataSet.Create(Self);
  with cdsDuplicatas do
  begin
    FieldDefs.Add('NDup'    , ftString, 60);
    FieldDefs.Add('DVenc'   , ftString, 10);
    FieldDefs.Add('VDup'    , ftFloat);
    FieldDefs.Add('ChaveNFe', ftString, 50);
    CreateDataSet;
  end;

  // cdsCalculoImposto
   cdsCalculoImposto := TClientDataSet.Create(Self);
  with cdsCalculoImposto do
  begin
    FieldDefs.Add('VBC'         , ftFloat);
    FieldDefs.Add('VICMS'       , ftFloat);
    FieldDefs.Add('VBCST'       , ftFloat);
    FieldDefs.Add('VST'         , ftFloat);
    FieldDefs.Add('VProd'       , ftFloat);
    FieldDefs.Add('VFrete'      , ftFloat);
    FieldDefs.Add('VSeg'        , ftFloat);
    FieldDefs.Add('VDesc'       , ftFloat);
    FieldDefs.Add('VII'         , ftFloat);
    FieldDefs.Add('VIPI'        , ftFloat);
    FieldDefs.Add('VPIS'        , ftFloat);
    FieldDefs.Add('VCOFINS'     , ftFloat);
    FieldDefs.Add('VOutro'      , ftFloat);
    FieldDefs.Add('VNF'         , ftFloat);
    FieldDefs.Add('VTotTrib'    , ftFloat);
    FieldDefs.Add('VTribPerc'   , ftFloat);
    FieldDefs.Add('VTribFonte'  , ftString, 100);
    FieldDefs.Add('vTotPago'    , ftFloat);
    FieldDefs.Add('vTroco'      , ftFloat);
    FieldDefs.Add('ValorApagar' , ftFloat);
    CreateDataSet;
  end;

  // cdsTransportador
  cdsTransportador := TClientDataSet.Create(Self);
  with cdsTransportador do
  begin
    FieldDefs.Add('ModFrete', ftString, 14);
    FieldDefs.Add('CNPJCPF' , ftString, 18);
    FieldDefs.Add('XNome'   , ftString, 60);
    FieldDefs.Add('IE'      , ftString, 14);
    FieldDefs.Add('XEnder'  , ftString, 60);
    FieldDefs.Add('XMun'    , ftString, 60);
    FieldDefs.Add('UF'      , ftString, 2);
    CreateDataSet;
  end;

  // cdsVeiculo
  cdsVeiculo := TClientDataSet.Create(Self);
  with cdsVeiculo do
  begin
    FieldDefs.Add('PLACA', ftString, 8);
    FieldDefs.Add('UF'   , ftString, 2);
    FieldDefs.Add('RNTC' , ftString, 20);
    CreateDataSet;
  end;

  // cdsVolumes
  cdsVolumes := TClientDataSet.Create(Self);
  with cdsVolumes do
  begin
    FieldDefs.Add('QVol' , ftFloat);
    FieldDefs.Add('Esp'  , ftString, 60);
    FieldDefs.Add('Marca', ftString, 60);
    FieldDefs.Add('NVol' , ftString, 60);
    FieldDefs.Add('PesoL', ftFloat);
    FieldDefs.Add('PesoB', ftFloat);
    CreateDataSet;
  end;

  // csdEvento
  cdsEventos := TClientDataSet.Create(Self);

  // cdsISSQN
  cdsISSQN := TClientDataSet.Create(Self);
  with cdsISSQN do
  begin
     FieldDefs.Add('vSERV', ftFloat);
     FieldDefs.Add('vBC'  , ftFloat);
     FieldDefs.Add('vISS' , ftFloat);
     CreateDataSet;
  end;

   // cdsFatura
  cdsFatura   := TClientDataSet.Create(Self);
  with cdsFatura do
  begin
     FieldDefs.Add('iForma'   , ftInteger);
     FieldDefs.Add('Pagamento', ftString, 20);
     FieldDefs.Add('nFat'     , ftString, 60);
     FieldDefs.Add('vOrig'    , ftFloat);
     FieldDefs.Add('vDesc'    , ftFloat);
     FieldDefs.Add('vLiq'     , ftFloat);
     CreateDataSet;
  end;

  // cdsLocalRetirada
  cdsLocalRetirada := TClientDataSet.Create(Self);
  with cdsLocalRetirada do
  begin
     FieldDefs.Add('CNPJ'   , ftString, 18);
     FieldDefs.Add('XLgr'   , ftString, 60);
     FieldDefs.Add('Nro'    , ftString, 60);
     FieldDefs.Add('XCpl'   , ftString, 60);
     FieldDefs.Add('XBairro', ftString, 60);
     FieldDefs.Add('CMun'   , ftString, 7);
     FieldDefs.Add('XMun'   , ftString, 60);
     FieldDefs.Add('UF'     , ftString, 2);
     CreateDataSet;
  end;

  // cdsLocalEntrega
  cdsLocalEntrega := TClientDataSet.Create(Self);
  with cdsLocalEntrega do
  begin
     FieldDefs.Add('CNPJ'   , ftString, 18);
     FieldDefs.Add('XLgr'   , ftString, 60);
     FieldDefs.Add('Nro'    , ftString, 60);
     FieldDefs.Add('XCpl'   , ftString, 60);
     FieldDefs.Add('XBairro', ftString, 60);
     FieldDefs.Add('CMun'   , ftString, 7);
     FieldDefs.Add('XMun'   , ftString, 60);
     FieldDefs.Add('UF'     , ftString, 2);
     CreateDataSet;
  end;

  // cdsInformacoesAdicionais
  cdsInformacoesAdicionais := TClientDataSet.Create(Self);
  with cdsInformacoesAdicionais do
  begin
    FieldDefs.Add('OBS'      , ftString, 6900);
    FieldDefs.Add('LinhasOBS', ftInteger);
    CreateDataSet;
  end;

  // cdsPagamento
  cdsPagamento := TClientDataSet.Create(Self);
  with cdsPagamento do
  begin
    FieldDefs.Add('tPag' , ftString, 50);
    FieldDefs.Add('vPag' , ftFloat);
    FieldDefs.Add('CNPJ' , ftString, 50);
    FieldDefs.Add('tBand', ftString, 50);
    FieldDefs.Add('cAut' , ftString, 20);
    CreateDataSet;
  end;

  //cdsInutilização
  cdsInutilizacao := TClientDataSet.Create(Self);
end;



initialization
  FormFunction.RegisterForm('frmGeImportarNFE', TfrmGeImportarNFE);

end.
