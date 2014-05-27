unit UGeRemessaBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBTable, ComCtrls,
  IBSQL, DBClient, Provider, IBUpdateSQL, IBQuery, Buttons, ToolWin, Grids,
  DBGrids, ComObj, frxClass, frxDBSet, UGrPadrao, ACBrBoleto,
  ACBrBoletoFCFR, ACBrBase, Mask, rxToolEdit;

type
  TfrmGeRemessaBoleto = class(TfrmGrPadrao)
    pnlFiltro: TPanel;
    GroupBox1: TGroupBox;
    lblBanco: TLabel;
    edBanco: TComboBox;
    lblInicio: TLabel;
    lblFinal: TLabel;
    edArquivoRemessa: TEdit;
    lblArquivoRemessa: TLabel;
    IbQryTitulos: TIBQuery;
    IbUpdTitulos: TIBUpdateSQL;
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosNOSSONUMERO: TStringField;
    CdsTitulosCNPJ: TStringField;
    CdsTitulosTIPPAG: TStringField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TBCDField;
    CdsTitulosPERCENTMULTA: TBCDField;
    CdsTitulosPERCENTDESCONTO: TBCDField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    DtsTitulos: TDataSource;
    UpdateLanc: TIBSQL;
    pnlTitulos: TPanel;
    Shape1: TShape;
    Bevel2: TBevel;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel3: TBevel;
    btnFechar: TBitBtn;
    Bevel4: TBevel;
    btnGerarRemessa: TBitBtn;
    Bevel5: TBevel;
    Bevel6: TBevel;
    dbgTitulos: TDBGrid;
    Label5: TLabel;
    CdsTitulosINSCEST: TStringField;
    CdsTitulosNOME: TStringField;
    CdsTitulosFONE: TStringField;
    frrRemessa: TfrxReport;
    frdRemessa: TfrxDBDataset;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    CdsTitulosNUMLANC: TIntegerField;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoFCFR: TACBrBoletoFCFR;
    CdsTitulosSERIE: TStringField;
    CdsTitulosNFE: TLargeintField;
    CdsTitulosNumeroDocumento: TStringField;
    IbQryBancos: TIBQuery;
    IbQryBancosBCO_COD: TSmallintField;
    IbQryBancosEMPRESA: TIBStringField;
    IbQryBancosBCO_CARTEIRA: TIBStringField;
    IbQryBancosBCO_NOME: TIBStringField;
    IbQryBancosBCO_AGENCIA: TIBStringField;
    IbQryBancosBCO_CC: TIBStringField;
    IbQryBancosBCO_CODIGO_CEDENTE: TIBStringField;
    IbQryBancosBCO_CHAVE: TIBStringField;
    IbQryBancosBCO_GERAR_BOLETO: TSmallintField;
    IbQryBancosBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbQryBancosBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbQryBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbQryBancosBCO_CONFG_1: TIBStringField;
    IbQryBancosBCO_CONFG_2: TIBStringField;
    IbQryBancosBCO_SEQUENCIAL_REM: TIntegerField;
    IbQryBancosBCO_DIRETORIO_REMESSA: TIBStringField;
    IbQryBancosBCO_DIRETORIO_RETORNO: TIBStringField;
    IbQryBancosBCO_PERCENTUAL_JUROS: TIBBCDField;
    IbQryBancosBCO_PERCENTUAL_MORA: TIBBCDField;
    IbQryBancosBCO_DIA_PROTESTO: TSmallintField;
    IbQryBancosBCO_MSG_INSTRUCAO: TIBStringField;
    IbQryBancosBCO_LAYOUT_REMESSA: TSmallintField;
    IbQryBancosBCO_LAYOUT_RETORNO: TSmallintField;
    IbQryBancosRZSOC: TIBStringField;
    IbQryBancosNMFANT: TIBStringField;
    IbQryBancosIE: TIBStringField;
    IbQryBancosIM: TIBStringField;
    IbQryBancosENDER: TIBStringField;
    IbQryBancosCOMPLEMENTO: TIBStringField;
    IbQryBancosNUMERO_END: TIBStringField;
    IbQryBancosBAIRRO: TIBStringField;
    IbQryBancosCEP: TIBStringField;
    IbQryBancosCIDADE: TIBStringField;
    IbQryBancosUF: TIBStringField;
    IbQryBancosEMAIL: TIBStringField;
    IbUpdBancos: TIBUpdateSQL;
    CdsTitulosPARCELA_MAXIMA: TSmallintField;
    CdsTitulosENDER: TStringField;
    CdsTitulosENDER_DESC: TStringField;
    CdsTitulosENDER_NUM: TStringField;
    CdsTitulosBAIRRO: TStringField;
    CdsTitulosCIDADE: TStringField;
    CdsTitulosUF: TStringField;
    CdsTitulosCEP: TStringField;
    CdsTitulosEMAIL: TStringField;
    edInicio: TDateEdit;
    edFinal: TDateEdit;
    CdsTitulosSITUACAO: TSmallintField;
    chkEnviarCancelados: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure edBancoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure edInicioChange(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure frrRemessaGetValue(const VarName: String;
      var Value: Variant);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CdsTitulosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    CobreBemX : Variant;
    procedure CarregarBancos;
    procedure DefinirNomeArquivo( iBanco : Integer );
    procedure CarregarTitulos( iBanco : Integer; DataInicial, DataFinal : TDate);
    procedure GravarHistoricoRemessa;

    function GetAgenciaNumero : String;
    function GetAgenciaDigito : String;
    function GetContaNumero : String;
    function GetContaDigito : String;
    function GetNossoNumeroRepetido : Boolean;

    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function DefinirCedenteACBr(iBanco : Integer; sCarteira : String) : Boolean;
    function InserirBoleto( var Objeto : Variant ) : Boolean;
    function InserirBoletoACBr : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeRemessaBoleto: TfrmGeRemessaBoleto;

const
  feeSMTPBoletoHTML              = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo  = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel       = $00000005;
  feeOutlookBoletoHTML                = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo   = $00000007;
  feeOutlookMensagemBoletoPDFAnexo    = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel       = $0000000B;
  scpExecutar = $00000000;
  scpOK       = $00000001;
  scpInvalido = $00000002;
  scpErro     = $00000003;

  procedure GerarArquivoRemessa(const AOwer : TComponent);

implementation

uses UDMBusiness, UConstantesDGE, UFuncoes;

{$R *.dfm}

{ TfrmGrRemessaBoleto }

procedure GerarArquivoRemessa(const AOwer : TComponent);
var
  f : TfrmGeRemessaBoleto;
begin
  try
    f := TfrmGeRemessaBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfrmGeRemessaBoleto.CarregarBancos;
begin
  with IbQryBancos, edBanco do
  begin
    Close;
    ParamByName('empresa').AsString := GetEmpresaIDDefault;
    Open;
    
    if ( not IsEmpty ) then
      Clear;

    while not Eof do
    begin
      Items.Add( FormatFloat('000', IbQryBancosBCO_COD.AsInteger) + ' - ' + IbQryBancosBCO_NOME.AsString );

      Next;
    end;

    First;

    edBanco.Tag       := IbQryBancosBCO_COD.AsInteger;
    edBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeRemessaBoleto.FormShow(Sender: TObject);
begin
  CarregarBancos;
  edBancoChange(edBanco);
end;

procedure TfrmGeRemessaBoleto.edBancoChange(Sender: TObject);
begin
  if ( not IbQryBancos.Active ) then
    IbQryBancos.Open;

  if ( IbQryBancos.Locate('BCO_COD', StrToIntDef(Copy(edBanco.Text, 1, 3), 0), []) ) then
    edBanco.Tag := IbQryBancosBCO_COD.AsInteger;

  DefinirNomeArquivo( edBanco.Tag );

  CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
end;

procedure TfrmGeRemessaBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  edInicio.Date := Date;
  edFinal.Date  := Date;
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TfrmGeRemessaBoleto.DefinirNomeArquivo(iBanco: Integer);
begin
  try
    ForceDirectories(Trim(IbQryBancosBCO_DIRETORIO_REMESSA.AsString));
  except
  end;

  if ( DirectoryExists(Trim(IbQryBancosBCO_DIRETORIO_REMESSA.AsString)) ) then
    edArquivoRemessa.Text := Trim(IbQryBancosBCO_DIRETORIO_REMESSA.AsString) + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem'
  else
    edArquivoRemessa.Text := ExtractFilePath(ParamStr(0)) + 'Remessa\' + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem';

  edArquivoRemessa.Text := StringReplace(edArquivoRemessa.Text, '\\', '\', [rfReplaceAll]);  
  ForceDirectories( ExtractFilePath(edArquivoRemessa.Text) );
end;

procedure TfrmGeRemessaBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeRemessaBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de geração de remessas?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
  ;
end;

procedure TfrmGeRemessaBoleto.btnGerarRemessaClick(Sender: TObject);
var
  IBanco    ,
  ICarteira : Integer;
  sBanco    ,
  sCarteira : String;
begin
  try

    if ( CdsTitulos.IsEmpty ) then
    begin
      Application.MessageBox('Não existe relação de boletos para gerar arquivo de remessa.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( Application.MessageBox('Confirma a geração de arquivo de remessa?','Gerar Remessa', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
      Exit;

    if ( edBanco.ItemIndex < 0 ) then
    begin
      Application.MessageBox(PChar('Favor selecionar a entidade financeira para geração dos boletos.'), 'Alerta', MB_ICONWARNING);
      Exit;
    end;

    IBanco    := StrToIntDef( Copy(edBanco.Text, 1, 3), 0 );
    ICarteira := IbQryBancosBCO_CARTEIRA.AsInteger;

    sBanco    := Copy(edBanco.Text, 1, 3);
    sCarteira := IbQryBancosBCO_CARTEIRA.AsString;

    if GetNossoNumeroRepetido then
      Exit;

    {$IFDEF ACBR}
    if DefinirCedenteACBr( IBanco, sCarteira ) then
    {$ELSE}
    if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
    {$ENDIF}
    begin
      CdsTitulos.First;

      {$IFDEF ACBR}
      if ( InserirBoletoACbr ) then
      begin
        edArquivoRemessa.Text := StringReplace(ACBrBoleto.GerarRemessa(IbQryBancosBCO_SEQUENCIAL_REM.AsInteger), '\\', '\', [rfReplaceAll]);
      {$ELSE}
      if ( InserirBoleto( CobreBemX ) ) then
      begin
        CobreBemX.GravaArquivoRemessa;
      {$ENDIF}
        GravarHistoricoRemessa;
        ShowInformation('Remessa', 'Arquivo de remessa gerado com sucesso.'{$IFDEF ACBR} + #13#13 + QuotedStr(edArquivoRemessa.Text){$ENDIF});

        frrRemessa.ShowReport;

        CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
      end;

    end;

  except
    On E : Exception do
      Application.MessageBox(PChar('Erro na tentativa de gerar o arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
  end;
end;

procedure TfrmGeRemessaBoleto.CarregarTitulos(iBanco: Integer; DataInicial,
  DataFinal: TDate);
begin
  with CdsTitulos, Params do
  begin
    Close;
    ParamByName('empresa').AsString   := GetEmpresaIDDefault;
    ParamByName('banco').Value        := iBanco;
    ParamByName('dataInicial').AsDate := DataInicial;
    ParamByName('dataFinal').AsDate   := DataFinal;
    Open;

    btnGerarRemessa.Enabled := not IsEmpty;
  end;
end;

procedure TfrmGeRemessaBoleto.edInicioChange(Sender: TObject);
begin
  CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
end;

procedure TfrmGeRemessaBoleto.dbgTitulosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  if ( CdsTitulosSITUACAO.AsInteger = 0 ) then
    TDbGrid(Sender).Canvas.Font.Color := clRed;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

function TfrmGeRemessaBoleto.DefinirCedente(Banco, Carteira: Integer;
  var Objeto: Variant): Boolean;
var
  sAppPath     ,
  sFileLisence : String;
begin
  try
    sAppPath     := ExtractFilePath(ParamStr(0));
    sFileLisence := sAppPath + BOLETO_LICENCAS + FormatFloat('000', Banco)  + '-' + FormatFloat('00', Carteira) + '.conf';

    if ( not FileExists(sFileLisence) ) then
      raise Exception.Create('Arquivo de licença ' + QuotedStr(sFileLisence) + ' não encontrado');

    // Parâmetros obrigatórios da conta corrente do Cedente

    Objeto.ArquivoLicenca         := sFileLisence;
    Objeto.CodigoAgencia          := IbQryBancosBCO_AGENCIA.AsString;
    Objeto.NumeroContaCorrente    := IbQryBancosBCO_CC.AsString;
    Objeto.CodigoCedente          := IbQryBancosBCO_CHAVE.AsString;
    Objeto.InicioNossoNumero      := IbQryBancosBCO_NOSSO_NUM_INICIO.AsString;
    Objeto.FimNossoNumero         := IbQryBancosBCO_NOSSO_NUM_FINAL.AsString;
    Objeto.OutroDadoConfiguracao1 := Trim(IbQryBancosBCO_CONFG_1.AsString);
    Objeto.OutroDadoConfiguracao2 := Trim(IbQryBancosBCO_CONFG_2.AsString);

    if ( Trim(IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString) = EmptyStr ) then
      Objeto.ProximoNossoNumero  := '1'
    else
      Objeto.ProximoNossoNumero  := IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString;

    // Parâmetros obrigatórios para a geração de arquivos de remessa

    Objeto.ArquivoRemessa.Arquivo      := ExtractFileName(edArquivoRemessa.Text);
    Objeto.ArquivoRemessa.Diretorio    := ExtractFilePath(edArquivoRemessa.Text);
    Objeto.ArquivoRemessa.Sequencia    := IbQryBancosBCO_SEQUENCIAL_REM.AsInteger;
    Objeto.ArquivoRemessa.DataGravacao := FormatDateTime('dd/mm/yyyy', Date);

    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + BOLETO_ARQUIVO_LOGOTIPO;
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + BOLETO_IMAGENS;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de geração de arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeRemessaBoleto.InserirBoleto(var Objeto: Variant): Boolean;
var
  sDocumento  : String;
  Boleto      ,
  EmailSacado : Variant;
begin
  try
    Objeto.DocumentosCobranca.Clear;

    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin
      Boleto := Objeto.DocumentosCobranca.Add;
      sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);

      Boleto.NumeroDocumento := sDocumento;
      Boleto.NomeSacado      := Trim(CdsTitulosNOME.AsString);

      if Length(Trim(CdsTitulosCNPJ.AsString)) > 11 then
        Boleto.CNPJSacado := Trim(CdsTitulosCNPJ.AsString)
      else
        Boleto.CPFSacado  := Trim(CdsTitulosCNPJ.AsString);

      Boleto.EnderecoSacado := Trim(CdsTitulosENDER.AsString);
      Boleto.BairroSacado   := Trim(CdsTitulosBAIRRO.AsString);
      Boleto.CidadeSacado   := Trim(CdsTitulosCIDADE.AsString);
      Boleto.EstadoSacado   := Trim(CdsTitulosUF.AsString);
      Boleto.CepSacado      := Trim(CdsTitulosCEP.AsString);
      Boleto.DataDocumento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDATAPROCESSOBOLETO.AsDateTime);

      if not CdsTitulosDTVENC.IsNull then
        Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDTVENC.AsDateTime);

      Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', CdsTitulosDATAPROCESSOBOLETO.AsDateTime);

      Boleto.ValorDocumento                := CdsTitulosVALORREC.AsFloat;
      Boleto.PercentualJurosDiaAtraso      := CdsTitulosPERCENTJUROS.AsFloat;
      Boleto.PercentualMultaAtraso         := CdsTitulosPERCENTMULTA.AsFloat;
      Boleto.PercentualDesconto            := CdsTitulosPERCENTDESCONTO.AsFloat;
      Boleto.ValorOutrosAcrescimos         := 0;
      Boleto.PadroesBoleto.Demonstrativo   := 'Referente a compra de produtos <br>e/ou a contratação de serviços' + '<br><br>Venda No. ' +
                                              FormatFloat('0000', CdsTitulosANOLANC.AsInteger) + '/' +
                                              FormatFloat('##00000000', CdsTitulosNUMVENDA.AsInteger);;
      Boleto.PadroesBoleto.InstrucoesCaixa := '<br>' + IbQryBancosBCO_MSG_INSTRUCAO.AsString;

      EmailSacado          := Boleto.EnderecosEmailSacado.Add;
      EmailSacado.Nome     := Boleto.NomeSacado;
      EmailSacado.Endereco := Trim(CdsTitulosEMAIL.AsString);

      Boleto.ControleProcessamentoDocumento.Imprime      := scpExecutar;
      Boleto.ControleProcessamentoDocumento.EnviaEmail   := scpExecutar;
      Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

      Boleto.NossoNumero := CdsTitulosNOSSONUMERO.AsString;

      CdsTitulos.Next;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar inserir boleto no arquivo de remessa.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeRemessaBoleto.GravarHistoricoRemessa;
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;
    
    if ( FileExists(edArquivoRemessa.Text) ) then
    begin

      sSQL.BeginUpdate;
      sSQL.Clear;
      sSQL.Add( ' Update TBCONTREC Set ' );
      sSQL.Add( '     enviado = 1, remessa = ' + IbQryBancosBCO_SEQUENCIAL_REM.AsString );
      sSQL.Add( ' where codbanco = '   + IntToStr(edBanco.Tag) );
      sSQL.Add( '   and baixado  = 0' );
      sSQL.Add( '   and enviado  = 0' );
      sSQL.Add( '   and dataprocessoboleto between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edInicio.Date)) + ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edFinal.Date))) ;
      sSQL.EndUpdate;

      with UpdateLanc, SQL  do
      begin
        Clear;
        AddStrings( sSQL );
        ExecQuery;
      end;

      IbQryBancos.Edit;
      IbQryBancosBCO_SEQUENCIAL_REM.Value := IbQryBancosBCO_SEQUENCIAL_REM.AsInteger + 1;
      IbQryBancos.Post;

      CommitTransaction;
    end;
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGeRemessaBoleto.frrRemessaGetValue(const VarName: String;
  var Value: Variant);
begin
  if ( VarName = 'Banco' ) then
    Value := edBanco.Text;
  if ( VarName = 'Arquivo' ) then
    Value := ExtractFileName(edArquivoRemessa.Text);
end;

procedure TfrmGeRemessaBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

procedure TfrmGeRemessaBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_ESCAPE ) then
    btnFechar.Click
  else
    inherited;
end;

procedure TfrmGeRemessaBoleto.CdsTitulosCalcFields(DataSet: TDataSet);
begin
  if ( CdsTitulosNFE.AsLargeInt > 0 ) then
    CdsTitulosNumeroDocumento.AsString := FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt) + '-' + FormatFloat('00', CdsTitulosPARCELA.AsInteger)
  else
    CdsTitulosNumeroDocumento.AsString := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);
end;

function TfrmGeRemessaBoleto.DefinirCedenteACBr(iBanco: Integer;
  sCarteira: String): Boolean;
var
  sAppLogo  ,
  sAppBoleto,
  sAppPath  : String;
begin
  // Esta função deverá ser replicada em: TfrmGeRemessaBoleto.DefinirCedenteACBr()

  try
    sAppPath   := ExtractFilePath(ParamStr(0));
    sAppBoleto := sAppPath + LAYOUT_BOLETO_ENTREGA;
    sAppLogo   := sAppPath + BOLETO_IMAGENS + 'Colorido\' + FormatFloat('000".bmp"', iBanco);

    if not FileExists(sAppBoleto) then
      raise Exception.Create(Format('Arquivo de layout %s não encontrado!', [QuotedStr(sAppBoleto)]));

    if not FileExists(sAppLogo) then
      sAppLogo := sAppPath + BOLETO_IMAGENS + 'PretoBranco\' + FormatFloat('000".bmp"', iBanco);

    if not FileExists(sAppLogo) then
      sAppLogo := EmptyStr;

    // Parâmetros obrigatórios da conta corrente do Cedente

    with ACBrBoleto, Banco do
    begin
      Case iBanco of
        CODIGO_BANCO_BRASIL:
          begin
            TipoCobranca          := cobBancoDoBrasil;
            TamanhoMaximoNossoNum := 17;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_BRADESCO:
          begin
            TipoCobranca          := cobBradesco;
            TamanhoMaximoNossoNum := 11;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_CAIXA:
          begin
            TipoCobranca          := cobCaixaEconomica;
            TamanhoMaximoNossoNum := 15;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_HSBC:
          begin
            TipoCobranca          := cobHSBC;
            TamanhoMaximoNossoNum := 16;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_ITAU:
          begin
            TipoCobranca          := cobItau;
            TamanhoMaximoNossoNum := 8;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_SANTANDER:
          begin
            TipoCobranca          := cobSantander;
            TamanhoMaximoNossoNum := 12;
            Cedente.Modalidade    := '101';
          end;

        else
          raise Exception.Create('Sistema não adapitado para gerar boletos para o banco ' + IbQryBancosBCO_NOME.AsString);
      end;

      Case IbQryBancosBCO_LAYOUT_REMESSA.AsInteger of
        240: LayoutRemessa := c240;
        400: LayoutRemessa := c400;
      end;

      ACBrBoleto.NomeArqRemessa := ExtractFileName(edArquivoRemessa.Text);
      ACBrBoleto.DirArqRemessa  := ExtractFilePath(edArquivoRemessa.Text);

      ACBrBoletoFCFR.DirLogo        := ExtractFilePath(sAppLogo);
      ACBrBoletoFCFR.FastReportFile := sAppBoleto;
      ACBrBoletoFCFR.SoftwareHouse  := GetCompanyName;

      // Dados Conta
      Cedente.Agencia       := GetAgenciaNumero;
      Cedente.AgenciaDigito := GetAgenciaDigito;
      Cedente.Conta         := GetContaNumero;
      Cedente.ContaDigito   := GetContaDigito;
      Cedente.Convenio      := IbQryBancosBCO_CHAVE.AsString;

      // Dados Cedente
      if StrIsCPF(IbQryBancosEMPRESA.AsString) then
        Cedente.TipoInscricao := pFisica
      else
      if StrIsCNPJ(IbQryBancosEMPRESA.AsString) then
        Cedente.TipoInscricao := pJuridica;

      Cedente.CNPJCPF     := IbQryBancosEMPRESA.AsString;
      Cedente.Nome        := IbQryBancosRZSOC.AsString;
      Cedente.Logradouro  := IbQryBancosENDER.AsString;
      Cedente.NumeroRes   := IbQryBancosNUMERO_END.AsString;
      Cedente.Complemento := IbQryBancosCOMPLEMENTO.AsString;
      Cedente.Bairro := IbQryBancosBAIRRO.AsString;
      Cedente.CEP    := IbQryBancosCEP.AsString;
      Cedente.Cidade := IbQryBancosCIDADE.AsString;
      Cedente.UF     := IbQryBancosUF.AsString;

      // Dados Convênio
      Cedente.CodigoCedente     := Trim(IbQryBancosBCO_CODIGO_CEDENTE.AsString);
      Cedente.Convenio          := IbQryBancosBCO_CHAVE.AsString;
      Cedente.CodigoTransmissao := EmptyStr;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de geração de boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeRemessaBoleto.GetAgenciaDigito: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_AGENCIA.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, Pos('-', S) + 1, Length(S))
  else
    S := EmptyStr;

  Result := S;
end;

function TfrmGeRemessaBoleto.GetAgenciaNumero: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_AGENCIA.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeRemessaBoleto.GetContaDigito: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_CC.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, Pos('-', S) + 1, Length(S))
  else
    S := EmptyStr;

  Result := S;
end;

function TfrmGeRemessaBoleto.GetContaNumero: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_CC.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeRemessaBoleto.GetNossoNumeroRepetido : Boolean;
var
  bReturn : Boolean;
  sNossoNumeroOLD : String;
begin
  bReturn := False;
  try
    sNossoNumeroOLD := EmptyStr;

    CdsTitulos.IndexFieldNames := 'NOSSONUMERO';
    CdsTitulos.Close;
    CdsTitulos.Open;

    CdsTitulos.First;
    CdsTitulos.DisableControls;

    while not CdsTitulos.Eof do
    begin
      if (CdsTitulosNOSSONUMERO.AsString = sNossoNumeroOLD) then
      begin
        bReturn := True;
        Break;
      end;

      sNossoNumeroOLD := CdsTitulosNOSSONUMERO.AsString;
      CdsTitulos.Next;
    end;
  finally
    CdsTitulos.First;
    CdsTitulos.EnableControls;

    Result := bReturn;

    if Result then
      ShowWarning(Format('O identificador ''%s'' utilizado como NOSSO NÚMERO está repetido!' + #13#13 +
        'Favor comunicar ao suporte.', [sNossoNumeroOLD]));
  end;
end;

function TfrmGeRemessaBoleto.InserirBoletoACBr: Boolean;
var
  sDocumento ,
  sMensagem  : String;
  Boleto : TACBrTitulo;
const
  MSG_REF_NFE = 'Referente a NF-e %s, parcela %s/%s';
  MSG_REF_DOC = 'Referente ao título %s, parcela %s/%s';
begin
  // Esta função deverá ser replicada em: TfrmGeRemessaBoleto.InserirBoletoACBr()
  
  try

    ACBrBoleto.ListadeBoletos.Clear;

    CdsTitulos.First;
    CdsTitulos.DisableControls;

    while not CdsTitulos.Eof do
    begin

      // Não enviar na remessa boletos cancelados
      if ( not chkEnviarCancelados.Checked ) then
        if ( CdsTitulosSITUACAO.AsInteger = 0 ) then
        begin
          CdsTitulos.Next;
          Continue;
        end;
        
      Boleto := ACBrBoleto.CriarTituloNaLista;

      if ( CdsTitulosNFE.AsLargeInt > 0 ) then
      begin
        sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt), FormatFloat('00', CdsTitulosPARCELA.AsInteger), FormatFloat('00', CdsTitulosPARCELA_MAXIMA.AsInteger)]);
        sDocumento := FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt) + '-' + FormatFloat('00', CdsTitulosPARCELA.AsInteger);
      end
      else
      begin
        sMensagem  := Format(MSG_REF_DOC, [Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger), FormatFloat('00', CdsTitulosPARCELA.AsInteger), FormatFloat('00', CdsTitulosPARCELA_MAXIMA.AsInteger)]);
        sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);
      end;

      with Boleto do
      begin

        // Dados do Sacado
        if StrIsCPF(CdsTitulosCNPJ.AsString) then
          Sacado.Pessoa   := pFisica
        else
        if StrIsCNPJ(CdsTitulosCNPJ.AsString) then
          Sacado.Pessoa   := pJuridica
        else
          Sacado.Pessoa   := pOutras;

        Sacado.CNPJCPF    := CdsTitulosCNPJ.AsString;
        Sacado.NomeSacado := CdsTitulosNOME.AsString;
        Sacado.Logradouro := CdsTitulosENDER_DESC.AsString;
        Sacado.Numero     := CdsTitulosENDER_NUM.AsString;
        Sacado.Bairro     := CdsTitulosBAIRRO.AsString;
        Sacado.Cidade     := CdsTitulosCIDADE.AsString;
        Sacado.UF         := CdsTitulosUF.AsString;
        Sacado.CEP        := StrOnlyNumbers(CdsTitulosCEP.AsString);
        Sacado.Email      := AnsiLowerCase(Trim(CdsTitulosEMAIL.AsString));
        Sacado.Fone       := StrOnlyNumbers(Trim(CdsTitulosFONE.AsString));

        // Dados do Documento
        LocalPagamento := 'Pagar preferêncialmente nas agências do(a) ' + ACBrBoleto.Banco.Nome;

        if not CdsTitulosDTVENC.IsNull then
          Vencimento   := CdsTitulosDTVENC.AsDateTime
        else
          Vencimento   := GetProximoDiaUtil(Date);

(*
        O campo Aceite indica se o Sacado (quem recebe o boleto) aceitou o boleto, ou seja, se ele assinou o documento
        de cobrança que originou o boleto. O padrão é usar "Não" no aceite, pois nesse caso não é necessário a
        autorização do Sacado para protestar o título.
        Se escolher "Sim", o Cedente (quem emite o boleto) precisará de algum documento onde o Sacado reconhece a dívida
        para poder protestar o título.
*)
        Aceite            := atNao;
        DataDocumento     := CdsTitulosDTEMISS.AsDateTime;
        NumeroDocumento   := sDocumento;
        Parcela           := CdsTitulosPARCELA.AsInteger;
        EspecieDoc        := 'DM'; // Duplicata Mercantil
        EspecieMod        := 'R$';

        DataProcessamento := CdsTitulosDATAPROCESSOBOLETO.AsDateTime;

        Carteira          := IbQryBancosBCO_CARTEIRA.AsString;

        NossoNumero     := CdsTitulosNOSSONUMERO.AsString;

        // Dados de Cobrança
        ValorDocumento    := CdsTitulosVALORREC.AsCurrency;
        ValorAbatimento   := 0.0;
        ValorMoraJuros    := (CdsTitulosVALORREC.AsCurrency * IbQryBancosBCO_PERCENTUAL_MORA.AsCurrency / 100) / 30;
        ValorDesconto     := CdsTitulosVALORREC.AsCurrency * CdsTitulosPERCENTDESCONTO.AsCurrency / 100;
        DataMoraJuros     := GetProximoDiaUtil(Vencimento);
        DataAbatimento    := StrToCurrDef(EmptyStr, 0);

        if ( CdsTitulosPERCENTDESCONTO.AsCurrency = 0 ) then
          DataDesconto    := StrToCurrDef(EmptyStr, 0)
        else
          DataDesconto    := CdsTitulosDTVENC.AsDateTime;

        if ( IbQryBancosBCO_DIA_PROTESTO.AsInteger = 0 ) then
          DataProtesto    := StrToCurrDef(EmptyStr, 0)
        else
          DataProtesto    := (Vencimento + IbQryBancosBCO_DIA_PROTESTO.AsInteger);

        PercentualMulta   := IbQryBancosBCO_PERCENTUAL_JUROS.AsCurrency;  // Percentual de multa por dia de atraso.

        if ( CdsTitulosSITUACAO.AsInteger = 0 ) then     // Cancelado
          OcorrenciaOriginal.Tipo := toRemessaBaixar
        else
        if ( CdsTitulosSITUACAO.AsInteger = 1 ) then     // Ativo
          OcorrenciaOriginal.Tipo := toRemessaRegistrar;

        Instrucao1        := '00';
        Instrucao2        := '00';

        Mensagem.Text := sMensagem + #13 + StringReplace(IbQryBancosBCO_MSG_INSTRUCAO.AsString, '<br>', '', [rfReplaceAll]);
      end;

      CdsTitulos.Next;
    end;


    Result := True;
  except
    On E : Exception do
    begin
      CdsTitulos.EnableControls;
      
      Application.MessageBox(PChar('Erro ao tentar gerar boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;

  CdsTitulos.EnableControls;
end;

procedure TfrmGeRemessaBoleto.RegistrarRotinaSistema; 
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeRemessaBoleto', TfrmGeRemessaBoleto);

end.
