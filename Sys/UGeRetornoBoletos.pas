unit UGeRetornoBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBTable, CheckLst,
  Buttons, ToolWin, ComCtrls, Grids, DBGrids, ComObj, IBSQL, DBClient,
  IBQuery, UGrPadrao, IBUpdateSQL, ACBrBoleto, ACBrBoletoFCFR, ACBrBase,
  FileCtrl;

type
  TfrmGeRetornoBoleto = class(TfrmGrPadrao)
    pnlFiltro: TPanel;
    GroupBox1: TGroupBox;
    lblBanco: TLabel;
    lblDiretorioRetorno: TLabel;
    edBanco: TComboBox;
    edDiretorioRetorno: TEdit;
    Label2: TLabel;
    lstBxRetorno: TCheckListBox;
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    btnFechar: TBitBtn;
    Bevel3: TBevel;
    btnCarregarRetorno: TBitBtn;
    Bevel4: TBevel;
    Bevel5: TBevel;
    pnlTitulos: TPanel;
    Shape1: TShape;
    Bevel6: TBevel;
    Label3: TLabel;
    dbgTitulos: TDBGrid;
    UpdateLanc: TIBSQL;
    btnConfirmarBaixa: TBitBtn;
    CdsTitulos: TClientDataSet;
    DtsTitulos: TDataSource;
    CdsTitulosQuitar: TStringField;
    CdsTitulosNossoNumero: TStringField;
    CdsTitulosDataPagamento: TDateField;
    CdsTitulosValorPago: TCurrencyField;
    CdsTitulosNumeroDocumento: TStringField;
    CdsTitulosLancamento: TLargeintField;
    CdsTitulosParcela: TIntegerField;
    CdsTitulosBanco: TIntegerField;
    CdsTitulosAPagar: TCurrencyField;
    CdsTitulosSacado: TStringField;
    CdsTitulosCnpj: TStringField;
    gFind: TIBQuery;
    CdsTitulosAno: TSmallintField;
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
    lblFormaPagto: TLabel;
    edFormaPagto: TComboBox;
    QryFormaPagto: TIBQuery;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoFCFR: TACBrBoletoFCFR;
    CdsTitulosTotalAPagar: TAggregateField;
    CdsTitulosAnoVenda: TIntegerField;
    CdsTitulosNumVenda: TIntegerField;
    CdsTitulosArquivo: TStringField;
    FileListBox: TFileListBox;
    procedure edBancoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCarregarRetornoClick(Sender: TObject);
    procedure btnConfirmarBaixaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFormaPagtoChange(Sender: TObject);
  private
    { Private declarations }
    CobreBemX : Variant;
    procedure CarregarBancos;
    procedure CarregarFormaPagto(const iBanco : Integer);
    procedure DefinirDiretorioArquivo( iBanco : Integer );
    procedure ListarArquivosRetorno(sDiretorio, sMascara : String; Lista : TStrings);

    function GetAgenciaNumero : String;
    function GetAgenciaDigito : String;
    function GetContaNumero : String;
    function GetContaDigito : String;

    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function DefinirCedenteACBr(iBanco : Integer; sCarteira : String) : Boolean;
    function CarregarRetorno( sArquivo : String; var Objeto : Variant ) : Boolean;
    function CarregarRetornoACBr( sArquivo : String ) : Boolean;
    function ArquivoSelecionado : Boolean;
    function LancamentoIdentificado( Banco : Integer; sNossoNumero, sDocumento : String;
      var Ano, Lancamento : Integer; var Parcela : Integer; var APagar : Currency; var Sacado, Cnpj : String; var Quidado : Boolean;
      var AnoVenda, NumVenda : Integer) : Boolean;
    function QuitarLancamento(Ano, Lancamento : Integer; Parcela : Integer; ValorPago : Currency; DataPagamento : TDateTime; NossoNumero : String) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeRetornoBoleto: TfrmGeRetornoBoleto;

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

  procedure ProcessarRetorno(const AOwer : TComponent);

implementation

uses UDMBusiness, UConstantesDGE, UFuncoes, Contnrs, StrUtils;

{$R *.dfm}

const
  CHECK_QUITAR = 'X';
  FILTRO_ARQUIVO_RETORNO = '*.RET';

{ TfrmGrRetornoBoleto }

procedure ProcessarRetorno(const AOwer : TComponent);
var
  f : TfrmGeRetornoBoleto;
begin
  try
    f := TfrmGeRetornoBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfrmGeRetornoBoleto.CarregarBancos;
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

procedure TfrmGeRetornoBoleto.DefinirDiretorioArquivo(iBanco: Integer);
begin
  try
    ForceDirectories(Trim(IbQryBancosBCO_DIRETORIO_RETORNO.AsString));
  except
  end;

  if ( DirectoryExists(Trim(IbQryBancosBCO_DIRETORIO_RETORNO.AsString)) ) then
    edDiretorioRetorno.Text := Trim(IbQryBancosBCO_DIRETORIO_RETORNO.AsString) + FormatFloat('000', iBanco) + '\'
  else
    edDiretorioRetorno.Text := ExtractFilePath(ParamStr(0)) + 'Retorno\' + FormatFloat('000', iBanco) + '\';

  edDiretorioRetorno.Text := StringReplace(edDiretorioRetorno.Text, '\\', '\', [rfReplaceAll]);
  ForceDirectories( edDiretorioRetorno.Text );
end;

procedure TfrmGeRetornoBoleto.ListarArquivosRetorno(sDiretorio, sMascara : String; Lista : TStrings);
var
  Rec : TSearchRec;
  I : Integer;
begin
  // Teste

  FileListBox.Directory := sDiretorio;
  FileListBox.Mask      := sMascara;
  FileListBox.Update;

  Lista.Clear;
  for I := 0 to FileListBox.Items.Count - 1 do
    Lista.Add( FileListBox.Items.Strings[I] );
(*
  Lista.Clear;
  if ( SysUtils.FindFirst(sDiretorio + sMascara, faAnyFile, Rec) = 0 ) then
    try
      repeat
        Lista.Add(rec.Name);
      until SysUtils.FindNext(Rec) <> 0;
    finally
      SysUtils.FindClose(Rec);

      // deleta o diretorio ..
      Lista.Delete(1);

      // deleta o diretorio .
      Lista.Delete(0);
    end;
*)
end;

procedure TfrmGeRetornoBoleto.edBancoChange(Sender: TObject);
begin
  if ( not IbQryBancos.Active ) then
    IbQryBancos.Open;

  if ( IbQryBancos.Locate('BCO_COD', StrToIntDef(Copy(edBanco.Text, 1, 3), 0), []) ) then
    edBanco.Tag := IbQryBancosBCO_COD.AsInteger;

  CarregarFormaPagto(IbQryBancosBCO_COD.AsInteger);
  edFormaPagtoChange(edFormaPagto);

  DefinirDiretorioArquivo( edBanco.Tag );

  ListarArquivosRetorno( edDiretorioRetorno.Text, FILTRO_ARQUIVO_RETORNO, lstBxRetorno.Items);
end;

procedure TfrmGeRetornoBoleto.FormShow(Sender: TObject);
begin
  CarregarBancos;
  edBancoChange(edBanco);
end;

procedure TfrmGeRetornoBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGeRetornoBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de leitura dos arquivos de retorno?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeRetornoBoleto.FormCreate(Sender: TObject);
begin
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

procedure TfrmGeRetornoBoleto.dbgTitulosDrawColumnCell(Sender: TObject;
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

 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if (CdsTitulosValorPago.AsCurrency = 0) then
    TDbGrid(Sender).Canvas.Font.Color := clRed;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).Columns[DataCol].Field, State);
end;

function TfrmGeRetornoBoleto.DefinirCedente(Banco, Carteira: Integer; var Objeto: Variant): Boolean;
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

    Objeto.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo            := sAppPath + BOLETO_ARQUIVO_LOGOTIPO;
    Objeto.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras := sAppPath + BOLETO_IMAGENS;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar carga de arquivo(s) de retorno.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeRetornoBoleto.CarregarRetorno(sArquivo: String;
  var Objeto: Variant): Boolean;
var
  I          ,
  Ano        ,
  Lancamento : Integer;
  AnoVenda   ,
  NumVenda   ,
  Parcela    : Integer;
  APagar     : Currency;
  Sacado     ,
  Cnpj       : String;
  Quitado    : Boolean;
begin
  try
    // Parâmetros obrigatórios para recuperação dos arquivos de retorno

    Objeto.ArquivoRetorno.Arquivo      := sArquivo;
    Objeto.ArquivoRetorno.Diretorio    := edDiretorioRetorno.Text;

    Objeto.OcorrenciasCobranca.Clear;
    Objeto.CarregaArquivosRetorno;

    if ( not CdsTitulos.Active ) then
      CdsTitulos.CreateDataSet;

    CdsTitulos.IndexFieldNames := 'NossoNumero';
    for I := 0 to Objeto.OcorrenciasCobranca.Count - 1 do
      if ( Objeto.OcorrenciasCobranca[I].Pagamento ) then
        if not CdsTitulos.FindKey( [Objeto.OcorrenciasCobranca[I].NossoNumero] ) then
        begin
          CdsTitulos.Append;

          CdsTitulosQuitar.AsString          := '.';
          CdsTitulosNossoNumero.AsString     := Objeto.OcorrenciasCobranca[I].NossoNumero;
          CdsTitulosNumeroDocumento.AsString := Objeto.OcorrenciasCobranca[I].NumeroDocumento;
          CdsTitulosDataPagamento.AsDateTime := StrToDate( Objeto.OcorrenciasCobranca[I].DataOcorrencia );
          CdsTitulosValorPago.AsCurrency     := Objeto.OcorrenciasCobranca[I].ValorPago;

          CdsTitulosBanco.AsInteger          := edBanco.Tag;
          CdsTitulosArquivo.AsString         := sArquivo;

          if ( LancamentoIdentificado( CdsTitulosBanco.AsInteger, CdsTitulosNossoNumero.AsString, CdsTitulosNumeroDocumento.AsString,
            Ano, Lancamento, Parcela, APagar, Sacado, Cnpj, Quitado, AnoVenda, NumVenda) ) then
          begin
            if ( (CdsTitulosValorPago.AsCurrency >= APagar) and (not Quitado) ) then
              CdsTitulosQuitar.Value   := CHECK_QUITAR;

            CdsTitulosAno.Value        := Ano;
            CdsTitulosLancamento.Value := Lancamento;
            CdsTitulosParcela.Value    := Parcela;
            CdsTitulosAPagar.Value     := APagar;
            CdsTitulosSacado.Value     := Sacado;
            CdsTitulosCnpj.Value       := Cnpj;
            CdsTitulosAnoVenda.AsInteger := AnoVenda;
            CdsTitulosNumVenda.AsInteger := NumVenda;
          end;

          CdsTitulos.Post;
        end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar carga do arquivo ' + sArquivo + '.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

function TfrmGeRetornoBoleto.CarregarRetornoACBr(
  sArquivo: String): Boolean;
var
  Boleto : TACBrTitulo;
  I          ,
  Ano        ,
  Lancamento : Integer;
  AnoVenda   ,
  NumVenda   ,
  Parcela    : Integer;
  APagar     : Currency;
  Sacado     ,
  Cnpj       : String;
  Quitado    : Boolean;

  iParcela : Integer;
  sNossoNumero    ,
  sNumeroDocumento: String;
begin
  try
    Result := False;

    ACBrBoleto.NomeArqRetorno := ExtractFileName(sArquivo);
    ACBrBoleto.DirArqRetorno  := ExtractFilePath(sArquivo);
    //ACBrBoleto.DirArqRetorno  := Copy(ExtractFilePath(sArquivo), 1, Length(ExtractFilePath(sArquivo)) - 1);

    ACBrBoleto.LeCedenteRetorno := True;
    ACBrBoleto.LerRetorno;

    if ( not CdsTitulos.Active ) then
      CdsTitulos.CreateDataSet;

    CdsTitulos.IndexFieldNames := 'NossoNumero';

    for I := 0 to ACBrBoleto.ListadeBoletos.Count - 1 do
    begin
      Boleto := ACBrBoleto.ListadeBoletos.Objects[I];

      sNossoNumero     := Boleto.NossoNumero;
      sNumeroDocumento := Boleto.NumeroDocumento;
      iParcela         := Boleto.Parcela;

      if not CdsTitulos.FindKey( [sNossoNumero] ) then
      begin
          CdsTitulos.Append;

          CdsTitulosQuitar.AsString          := '.';
          CdsTitulosNossoNumero.AsString     := sNossoNumero;
          CdsTitulosNumeroDocumento.AsString := sNumeroDocumento;
          CdsTitulosParcela.AsInteger        := iParcela;
          CdsTitulosValorPago.AsCurrency     := Boleto.ValorRecebido;

          if (Boleto.ValorRecebido > 0) then
            CdsTitulosDataPagamento.AsDateTime := Boleto.DataCredito
          else
            CdsTitulosDataPagamento.Clear;

          CdsTitulosBanco.AsInteger          := edBanco.Tag;
          CdsTitulosArquivo.AsString         := sArquivo;

          if ( LancamentoIdentificado( CdsTitulosBanco.AsInteger, CdsTitulosNossoNumero.AsString, CdsTitulosNumeroDocumento.AsString,
            Ano, Lancamento, Parcela, APagar, Sacado, Cnpj, Quitado, AnoVenda, NumVenda) ) then
          begin
            if ( (CdsTitulosValorPago.AsCurrency >= APagar) and (not Quitado) ) then
              CdsTitulosQuitar.Value   := CHECK_QUITAR;

            CdsTitulosAno.Value        := Ano;
            CdsTitulosLancamento.Value := Lancamento;
            CdsTitulosParcela.Value    := Parcela;
            CdsTitulosAPagar.Value     := APagar;
            CdsTitulosSacado.Value     := Sacado;
            CdsTitulosCnpj.Value       := Cnpj;
            CdsTitulosAnoVenda.AsInteger := AnoVenda;
            CdsTitulosNumVenda.AsInteger := NumVenda;
          end;

          CdsTitulos.Post;
      end;
    end;

    CdsTitulos.First;

    Result := not CdsTitulos.IsEmpty;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar iniciar carga do arquivo ' + sArquivo + '.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeRetornoBoleto.btnCarregarRetornoClick(Sender: TObject);
var
  IArquivos ,
  IBanco    ,
  ICarteira : Integer;
  sMensagem,
  sBanco   ,
  sCarteira,
  sFileNew ,
  sFileOld : String;
begin
  try

    if ( lstBxRetorno.Items.Count = 0 ) then
    begin
      ShowWarning('Não existe(m) arquivo(s) de retorno para o banco selecionado.');
      Exit;
    end;

    if ( not ArquivoSelecionado ) then
    begin
      ShowWarning('Não existe(m) arquivo(s) de retorno selecionado(s) para carga.');
      Exit;
    end;

    if ( not ShowConfirm('Confirma a carga dos registros de cobrança do(s) arquivo(s) de retorno selecionado(s)?', 'Ler Retorno') ) then
      Exit;

    if ( edBanco.ItemIndex < 0 ) then
    begin
      ShowWarning('Favor selecionar a entidade financeira para geração dos boletos.');
      Exit;
    end;

    IBanco    := StrToIntDef( Copy(edBanco.Text, 1, 3), 0 );
    ICarteira := IbQryBancosBCO_CARTEIRA.AsInteger;

    sBanco    := Copy(edBanco.Text, 1, 3);
    sCarteira := IbQryBancosBCO_CARTEIRA.AsString;
    sMensagem := EmptyStr;

    {$IFDEF ACBR}
    if DefinirCedenteACBr(IBanco, sCarteira) then
    {$ELSE}
    if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
    {$ENDIF}
    begin

      for IArquivos := 0 to lstBxRetorno.Items.Count - 1 do
        if ( lstBxRetorno.Checked[IArquivos] ) then
          {$IFDEF ACBR}
          if ( CarregarRetornoACBr( edDiretorioRetorno.Text + lstBxRetorno.Items.Strings[IArquivos] ) ) then
          {$ELSE}
          if ( CarregarRetorno(lstBxRetorno.Items.Strings[IArquivos], CobreBemX) ) then
          {$ENDIF}
          begin

            lstBxRetorno.Checked[IArquivos] := False;

            sFileOld := edDiretorioRetorno.Text + lstBxRetorno.Items.Strings[IArquivos];
            sFileNew := ChangeFileExt(sFileOld, FormatDateTime('yyyymmdd.hhmmss', Now));
            sFileNew := ExtractFilePath(ParamStr(0)) + 'Retorno\Processados\' + ExtractFileName(sFileNew);

            ForceDirectories( ExtractFilePath(sFileNew) );
            CopyFile(PChar(sFileOld), PChar(sFileNew), False);

            Application.ProcessMessages;
            sMensagem := sMensagem + lstBxRetorno.Items.Strings[IArquivos] + #13;
          end;

      if (Trim(sMensagem) <> EmptyStr) then
        ShowInformation('Retorno', 'Arquivo(s) de retorno carregado(s) com sucesso:' + #13#13 + sMensagem);

      edBancoChange(edBanco);
    end;

  except
    On E : Exception do
      ShowError('Erro na tentativa de carregar os registro de cobrança.' + #13 + E.Message);
  end;
end;

function TfrmGeRetornoBoleto.ArquivoSelecionado: Boolean;
var
  I : Integer;
begin
  Result := False;

  with lstBxRetorno do
    for I := 0 to Items.Count - 1 do
      if ( Checked[i] ) then
      begin
        Result := True;
        Break;
      end;
end;

function TfrmGeRetornoBoleto.LancamentoIdentificado(Banco: Integer;
  sNossoNumero, sDocumento : String; var Ano, Lancamento: Integer; var Parcela: Integer;
  var APagar: Currency; var Sacado, Cnpj: String; var Quidado : Boolean;
  var AnoVenda, NumVenda : Integer): Boolean;
var
  sWHRDoc : String;
  sSQL : TStringList;
  bReturn : Boolean;
begin

  bReturn := False;

  try

    try
      // Buscar pelo NOSSO_NUMERO registros não baixados

      sSQL := TStringList.Create;
      sSQL.BeginUpdate;
      sSQL.Add(' Select ');
      sSQL.Add('     r.anolanc ');
      sSQL.Add('   , r.numlanc ');
      sSQL.Add('   , r.parcela ');
      sSQL.Add('   , coalesce(r.valorsaldo, r.valorrec) as apagar ');
      sSQL.Add('   , c.nome ');
      sSQL.Add('   , r.cnpj ');
      sSQL.Add('   , r.nossonumero ');
      sSQL.Add('   , r.baixado ');
      sSQL.Add('   , r.anovenda ');
      sSQL.Add('   , r.numvenda ');
      sSQL.Add(' from TBCONTREC r ');
      sSQL.Add('   inner join TBCLIENTE c on ( r.cliente = c.codigo ) ');
      sSQL.Add(' where r.codbanco    = ' + IntToStr(Banco) );
      sSQL.Add('   and r.nossonumero = ' + QuotedStr(sNossoNumero) );
      sSQL.EndUpdate;

      with gFind do
      begin
        Close;
        SQL.Clear;
        SQL.AddStrings( sSQL );
        Open;

        bReturn := ( not IsEmpty );

        if ( bReturn ) then
        begin
          Ano        := FieldByName('anolanc').AsInteger;
          Lancamento := FieldByName('numlanc').AsInteger;
          Parcela    := FieldByName('parcela').AsInteger;
          APagar     := FieldByName('apagar').AsCurrency;
          Sacado     := FieldByName('nome').AsString;
          Cnpj       := FieldByName('cnpj').AsString;
          Quidado    := (FieldByName('baixado').AsInteger = 1);
          AnoVenda   := FieldByName('anovenda').AsInteger;
          NumVenda   := FieldByName('numvenda').AsInteger;
        end
      end;

      if ( (not bReturn) and (Trim(sDocumento) <> EmptyStr) ) then
      begin
        // Buscar pelo NUMERO_DOCUMENTO registros não baixados

        // Documento NF-e => NF-e + Nro. Parcela
        if Pos('-', sDocumento) > 0 then
          sWHRDoc := '(v.nfe = ' + Copy(sDocumento, 1, Pos('-', sDocumento) - 1) +
             ' and r.parcela = ' + Copy(sDocumento, Pos('-', sDocumento) + 1, 2) + ')'
        else
        // Documento Lançamento => Ano + Numero Titulo + Nro. Parcela
        if ( Length(Trim(sDocumento)) = 13 ) then
          sWHRDoc := '(r.anolanc = ' + IntToStr( 2000 + StrToInt( Copy(sDocumento, 1, 2)) ) + // 2
                 ' and r.numlanc = ' + Copy(sDocumento,  3, 8) +                              // 8
                 ' and r.parcela = ' + Copy(sDocumento, 11, 3) + ')'                          // 3
        else
          sWHRDoc := '(1 = 0)';

        sSQL.Clear;
        sSQL.BeginUpdate;
        sSQL.Add(' Select ');
        sSQL.Add('     r.anolanc ');
        sSQL.Add('   , r.numlanc ');
        sSQL.Add('   , r.parcela ');
        sSQL.Add('   , coalesce(r.valorsaldo, r.valorrec) as apagar ');
        sSQL.Add('   , c.nome ');
        sSQL.Add('   , r.cnpj ');
        sSQL.Add('   , r.nossonumero ');
        sSQL.Add('   , r.baixado ');
        sSQL.Add('   , r.anovenda ');
        sSQL.Add('   , r.numvenda ');
        sSQL.Add(' from TBCONTREC r ');
        sSQL.Add('   inner join TBCLIENTE c on ( r.cliente = c.codigo ) ');
        sSQL.Add('   left join TBVENDAS v on (v.ano = r.anovenda and v.codcontrol = r.numvenda) ');
        sSQL.Add(' where r.codbanco = ' + IntToStr(Banco) );
        sSQL.Add('   and ' + sWHRDoc );
        sSQL.EndUpdate;

        with gFind do
        begin
          Close;
          SQL.Clear;
          SQL.AddStrings( sSQL );
          Open;

          bReturn := ( not IsEmpty );

          if ( bReturn ) then
          begin
            Ano        := FieldByName('anolanc').AsInteger;
            Lancamento := FieldByName('numlanc').AsInteger;
            Parcela    := FieldByName('parcela').AsInteger;
            APagar     := FieldByName('apagar').AsCurrency;
            Sacado     := FieldByName('nome').AsString;
            Cnpj       := FieldByName('cnpj').AsString;
            Quidado    := (FieldByName('baixado').AsInteger = 1);
            AnoVenda   := FieldByName('anovenda').AsInteger;
            NumVenda   := FieldByName('numvenda').AsInteger;
          end
        end;

      end;

      if ( (not bReturn) and (Trim(sDocumento) <> EmptyStr) ) then
      begin
        // Buscar pela NFE + PARCELA (DOCUMENTO LIVRE) registros não baixados

        // Documento => NF-e + Nro. Parcela
        if (Length(sDocumento) = 5) and (StrToInt(Copy(sDocumento, 4, 1)) = 0) and (StrToInt(Copy(sDocumento, 5, 1)) > 0) then
          sWHRDoc := '(v.nfe = ' + Copy(sDocumento, 1, 3) +
             ' and r.parcela = ' + Copy(sDocumento, 5, 1) + ')'
        else
          sWHRDoc := '(1 = 0)';

        sSQL.Clear;
        sSQL.BeginUpdate;
        sSQL.Add(' Select ');
        sSQL.Add('     r.anolanc ');
        sSQL.Add('   , r.numlanc ');
        sSQL.Add('   , r.parcela ');
        sSQL.Add('   , coalesce(r.valorsaldo, r.valorrec) as apagar ');
        sSQL.Add('   , c.nome ');
        sSQL.Add('   , r.cnpj ');
        sSQL.Add('   , r.nossonumero ');
        sSQL.Add('   , r.baixado ');
        sSQL.Add('   , r.anovenda ');
        sSQL.Add('   , r.numvenda ');
        sSQL.Add(' from TBCONTREC r ');
        sSQL.Add('   inner join TBCLIENTE c on ( r.cliente = c.codigo ) ');
        sSQL.Add('   left join TBVENDAS v on (v.ano = r.anovenda and v.codcontrol = r.numvenda) ');
        sSQL.Add(' where r.codbanco is null');
        sSQL.Add('   and r.nossonumero is null');
        sSQL.Add('   and ' + sWHRDoc );
        sSQL.EndUpdate;

        with gFind do
        begin
          Close;
          SQL.Clear;
          SQL.AddStrings( sSQL );
          Open;

          bReturn := ( not IsEmpty );

          if ( bReturn ) then
          begin
            Ano        := FieldByName('anolanc').AsInteger;
            Lancamento := FieldByName('numlanc').AsInteger;
            Parcela    := FieldByName('parcela').AsInteger;
            APagar     := FieldByName('apagar').AsCurrency;
            Sacado     := FieldByName('nome').AsString;
            Cnpj       := FieldByName('cnpj').AsString;
            Quidado    := (FieldByName('baixado').AsInteger = 1);
            AnoVenda   := FieldByName('anovenda').AsInteger;
            NumVenda   := FieldByName('numvenda').AsInteger;
          end
        end;

      end;

      if ( not bReturn ) then
      begin
        Ano        := 0;
        Lancamento := 0;
        Parcela    := 0;
        APagar     := 0;
        Sacado     := EmptyStr;
        Cnpj       := EmptyStr;
        Quidado    := False;
        AnoVenda   := 0;
        NumVenda   := 0;
      end;

      btnConfirmarBaixa.Enabled := ( btnConfirmarBaixa.Enabled ) or ( bReturn );

    finally
      Result := bReturn;
      sSQL.Free;
    end;

  except
    Result := False;
  end;

end;

procedure TfrmGeRetornoBoleto.btnConfirmarBaixaClick(Sender: TObject);
var
  CxAno    ,
  CxNumero ,
  CxContaCorrente : Integer;
  sTotalAPagar : String;
begin
  try

    CxAno    := 0;
    CxNumero := 0;
    CxContaCorrente := 0;
    sTotalAPagar    := CdsTitulosTotalAPagar.AsString;

    if ( not CaixaAberto(GetEmpresaIDDefault, GetUserApp, GetDateDB, edFormaPagto.Tag, CxAno, CxNumero, CxContaCorrente) ) then
    begin
      ShowWarning('Não existe caixa aberto para o usuário na forma de pagamento BOLETO.');
      Exit;
    end;

    if ( edFormaPagto.Tag = 0 ) then
    begin
      ShowInformation('O código da forma de pagamento BOLETO ainda não foi configurado.' + #13#13 + 'Favor entrar em contato com suporte.');
      Exit;
    end;

    if ( CdsTitulos.IsEmpty ) then
    begin
      Application.MessageBox('Não existe(m) título(s) de cobrança carregado(s) na tela.','Alerta', MB_ICONEXCLAMATION);
      Exit;
    end;

    if ( StrToCurrDef(sTotalAPagar, 0) <= 0 ) then
    begin
      ShowWarning('Não existe(m) título(s) pendentes de baixa.');
      Exit;
    end;

    if ( Application.MessageBox('Confirma a quitação (baixa) do(s) título(s) relacionado(s)?', 'Confirmar baixa', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
      Exit;

    CdsTitulos.First;
    while not CdsTitulos.Eof do
    begin
      if ( CdsTitulosQuitar.AsString = CHECK_QUITAR ) then
      begin

        QuitarLancamento(
          CdsTitulosAno.AsInteger,
          CdsTitulosLancamento.AsInteger,
          CdsTitulosParcela.Value,
          CdsTitulosValorPago.Value,
          CdsTitulosDataPagamento.Value,
          CdsTitulosNossoNumero.AsString);

        if FileExists(CdsTitulosArquivo.AsString) then
          DeleteFile(CdsTitulosArquivo.AsString);

        try
          if ( CxContaCorrente > 0 ) then
          begin
            SetMovimentoCaixa(
                GetUserApp
              , CdsTitulosDataPagamento.AsDateTime + Time
              , edFormaPagto.Tag
              , CdsTitulosAno.AsInteger        // Ano do lançamento do Título
              , CdsTitulosLancamento.AsInteger // Número do lançamento do Título
              , 0
              , CdsTitulosValorPago.AsCurrency
              , tmcxCredito);
              
            GerarSaldoContaCorrente(CxContaCorrente, CdsTitulosDataPagamento.AsDateTime);
          end;
        except
        end;

      end;

      CdsTitulos.Next;
    end;

    CdsTitulos.EmptyDataSet;
    ListarArquivosRetorno( edDiretorioRetorno.Text, FILTRO_ARQUIVO_RETORNO, lstBxRetorno.Items);
    
    ShowInformation('Baixa', 'Processo de baixa de lançamentos executado com sucesso.');

  except
    On E : Exception do
      ShowError('Erro na tentativa de quitar o(s) lançamento(s) identificado(s).' + #13 + E.Message);
  end;
end;

function TfrmGeRetornoBoleto.QuitarLancamento(Ano, Lancamento : Integer; Parcela : Integer;
  ValorPago: Currency; DataPagamento: TDateTime; NossoNumero : String): Boolean;
var
  sSQL  : TStringList;
  iSeq  : Integer;
  sHist : String;
begin
  try

    try
      sSQL := TStringList.Create;

      sSQL.BeginUpdate;
      sSQL.Clear;
      sSQL.Add( ' Insert Into TBCONTREC_BAIXA ' );
      sSQL.Add( '   (ANOLANC, NUMLANC, SEQ, HISTORICO, DATA_PAGTO, FORMA_PAGTO, VALOR_BAIXA, BANCO, DOCUMENTO_BAIXA) ' );
      sSQL.Add( ' values ' );
      sSQL.Add( '   (:ano, :num, :seq, :hist, :data, :forma, :pago, :banco, :doc) ' );
      sSQL.EndUpdate;

      iSeq  := GetNextID('TBCONTREC_BAIXA', 'SEQ', 'where ANOLANC = ' + IntToStr(Ano) + ' and NUMLANC = ' + IntToStr(Lancamento));
      sHist := 'A BAIXA DE TITULO ATRAVES DO PROCESSAMENTO DE ARQUIVO RETORNO BANCARIO';

      with UpdateLanc, SQL  do
      begin
        Clear;
        AddStrings( sSQL );
        ParamByName('ano').AsInteger   := Ano;
        ParamByName('num').AsInteger   := Lancamento;
        ParamByName('seq').AsInteger   := iSeq;
        ParamByName('hist').AsString   := sHist;
        ParamByName('data').AsDateTime := DataPagamento;
        ParamByName('forma').AsInteger := edFormaPagto.Tag;
        ParamByName('pago').AsCurrency := ValorPago;
        ParamByName('banco').AsInteger := edBanco.Tag;
        ParamByName('doc').AsString    := RightStr(Trim(NossoNumero), 10);
        ExecQuery;

        CommitTransaction;
      end;
    finally
      sSQL.Free;
    end;

    Result := True;
    
  except
    Result := False;
  end;
end;

procedure TfrmGeRetornoBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

procedure TfrmGeRetornoBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_ESCAPE ) then
    btnFechar.Click
  else
    inherited;
end;

procedure TfrmGeRetornoBoleto.CarregarFormaPagto(const iBanco: Integer);
begin
  with QryFormaPagto, edFormaPagto do
  begin
    Close;
    ParamByName('banco').AsInteger := iBanco;
    Open;

    if ( not IsEmpty ) then
      Clear;

    while not Eof do
    begin
      Items.Add( FormatFloat('000', FieldByName('forma_pagto').AsInteger) + ' - ' + FieldByName('forma_pagto_desc').AsString );

      Next;
    end;

    First;

    edFormaPagto.Tag       := FieldByName('forma_pagto').AsInteger;
    edFormaPagto.ItemIndex := 0;
  end;
end;

procedure TfrmGeRetornoBoleto.edFormaPagtoChange(Sender: TObject);
begin
  if ( not QryFormaPagto.Active ) then
    QryFormaPagto.Open;

  if ( QryFormaPagto.Locate('forma_pagto', StrToIntDef(Copy(edFormaPagto.Text, 1, 3), 0), []) ) then
    edFormaPagto.Tag := QryFormaPagto.FieldByName('forma_pagto').AsInteger;
end;

function TfrmGeRetornoBoleto.DefinirCedenteACBr(iBanco: Integer;
  sCarteira : String): Boolean;
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

function TfrmGeRetornoBoleto.GetAgenciaDigito: String;
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

function TfrmGeRetornoBoleto.GetAgenciaNumero: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_AGENCIA.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeRetornoBoleto.GetContaDigito: String;
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

function TfrmGeRetornoBoleto.GetContaNumero: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_CC.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

procedure TfrmGeRetornoBoleto.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeRetornoBoleto', TfrmGeRetornoBoleto);

end.
