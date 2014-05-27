unit UGeGerarBoletos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, ImgList, Grids,
  DBGrids, DB, IBCustomDataSet, IBQuery, Mask, DBCtrls, DBClient, Provider,
  ComObj, IBUpdateSQL, IBTable, IBSQL, UGrPadrao, ACBrBoleto,
  ACBrBoletoFCFR, ACBrBase, ACBrUtil;

type
  TfrmGeGerarBoleto = class(TfrmGrPadrao)
    pnlGuias: TPanel;
    tlbBotoes: TToolBar;
    pgcGuias: TPageControl;
    tbsClientes: TTabSheet;
    tbsTitulos: TTabSheet;
    Bevel1: TBevel;
    ImgList: TImageList;
    Bevel2: TBevel;
    dbgDados: TDBGrid;
    IbQryClientes: TIBQuery;
    IbQryClientesCNPJ: TIBStringField;
    IbQryClientesINSCEST: TIBStringField;
    IbQryClientesNOME: TIBStringField;
    IbQryClientesFONE: TIBStringField;
    IbQryClientesBAIRRO: TIBStringField;
    IbQryClientesCIDADE: TIBStringField;
    IbQryClientesUF: TIBStringField;
    IbQryClientesCEP: TIBStringField;
    IbQryClientesEMAIL: TIBStringField;
    DtsClientes: TDataSource;
    Bevel3: TBevel;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    Label1: TLabel;
    btnFiltrar: TSpeedButton;
    edtFiltrar: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbNome: TDBEdit;
    Label3: TLabel;
    dbCPF: TDBEdit;
    dbEndereco: TDBEdit;
    Label4: TLabel;
    dbBairro: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbFone: TDBEdit;
    Label7: TLabel;
    dbEmail: TDBEdit;
    Label8: TLabel;
    dbCidade: TDBEdit;
    Label9: TLabel;
    dbUF: TDBEdit;
    Label10: TLabel;
    dbCEP: TDBEdit;
    Bevel4: TBevel;
    Bevel5: TBevel;
    btnFechar: TBitBtn;
    Shape1: TShape;
    Label11: TLabel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    dbgTitulos: TDBGrid;
    Bevel8: TBevel;
    IbQryTitulos: TIBQuery;
    DtsTitulos: TDataSource;
    pnlBoleto: TPanel;
    Bevel9: TBevel;
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
    btnGerarBoleto: TBitBtn;
    lbltDemonstrativo: TLabel;
    lbltMsgInstrucoes: TLabel;
    lblbBanco: TLabel;
    cmbBanco: TComboBox;
    IbUpdBancos: TIBUpdateSQL;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    edtMsgInstrucoes: TEdit;
    edtDemonstrativo: TEdit;
    UpdateLanc: TIBSQL;
    IbUpdTitulos: TIBUpdateSQL;
    CdsTitulosGERAR: TStringField;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosNUMLANC: TIntegerField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    IbQryClientesENDER: TIBStringField;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoFCFR: TACBrBoletoFCFR;
    IbQryBancos: TIBQuery;
    IbQryBancosBCO_COD: TSmallintField;
    IbQryBancosBCO_CARTEIRA: TIBStringField;
    IbQryBancosBCO_NOME: TIBStringField;
    IbQryBancosBCO_CHAVE: TIBStringField;
    IbQryBancosBCO_AGENCIA: TIBStringField;
    IbQryBancosBCO_CC: TIBStringField;
    IbQryBancosBCO_GERAR_BOLETO: TSmallintField;
    IbQryBancosBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbQryBancosBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbQryBancosBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbQryBancosBCO_CONFG_1: TIBStringField;
    IbQryBancosBCO_CONFG_2: TIBStringField;
    IbQryBancosBCO_SEQUENCIAL_REM: TIntegerField;
    IbQryBancosBCO_DIRETORIO_REMESSA: TIBStringField;
    IbQryBancosBCO_DIRETORIO_RETORNO: TIBStringField;
    IbQryBancosEMPRESA: TIBStringField;
    IbQryBancosRZSOC: TIBStringField;
    IbQryBancosNMFANT: TIBStringField;
    IbQryBancosIE: TIBStringField;
    IbQryBancosIM: TIBStringField;
    IbQryBancosENDER: TIBStringField;
    IbQryBancosCOMPLEMENTO: TIBStringField;
    IbQryBancosNUMERO_END: TIBStringField;
    IbQryBancosBAIRRO: TIBStringField;
    IbQryBancosCEP: TIBStringField;
    IbQryBancosEMAIL: TIBStringField;
    IbQryBancosCIDADE: TIBStringField;
    IbQryBancosUF: TIBStringField;
    IbQryBancosBCO_CODIGO_CEDENTE: TIBStringField;
    IbQryClientesENDER_DESC: TIBStringField;
    IbQryClientesENDER_NUM: TIBStringField;
    IbQryBancosBCO_PERCENTUAL_JUROS: TIBBCDField;
    IbQryBancosBCO_PERCENTUAL_MORA: TIBBCDField;
    IbQryBancosBCO_DIA_PROTESTO: TSmallintField;
    IbQryBancosBCO_MSG_INSTRUCAO: TIBStringField;
    CdsTitulosSERIE: TStringField;
    CdsTitulosNFE: TLargeintField;
    IbQryBancosBCO_LAYOUT_REMESSA: TSmallintField;
    IbQryBancosBCO_LAYOUT_RETORNO: TSmallintField;
    CdsTitulosPARCELA_MAXIMA: TSmallintField;
    IbQryClientesCODIGO: TIntegerField;
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DtsClientesDataChange(Sender: TObject; Field: TField);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbgTitulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure cmbBancoChange(Sender: TObject);
    procedure DspTitulosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgTitulosDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CobreBemX : Variant;
    FFecharAoGerar : Boolean;
    procedure CarregarBancos;
    procedure GravarBoletosGerados;
    procedure GravarBoletosGeradosACBr(const iProximoNossoNumero : Integer);
    procedure UpdateTitulo( iAno : Smallint; iLancamento : Int64; iBanco : Integer; sNossoNumero : String; Data : TDateTime;
      const cJuros : Currency = 0.0; const cMulta : Currency = 0.0);

    function GetAgenciaNumero : String;
    function GetAgenciaDigito : String;
    function GetContaNumero : String;
    function GetContaDigito : String;

    function CarregarTitulos(iCodigoCliente: Integer; iBanco : Integer) : Boolean;
    function DefinirCedente( Banco, Carteira : Integer; var Objeto : Variant ) : Boolean;
    function DefinirCedenteACBr(iBanco : Integer; sCarteira : String) : Boolean;
    function InserirBoleto( var Objeto : Variant) : Boolean;
    function InserirBoletoACBr(var iProximoNossoNumero : Integer; const NovosBoletos : Boolean = TRUE) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeGerarBoleto : TfrmGeGerarBoleto;

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

  procedure GerarBoleto(const AOwer : TComponent); overload;
  procedure GerarBoleto(const AOwer : TComponent; const NomeCliente : String; const iCodigoCliente : Integer; iAno, iVenda : Integer); overload;

  function ReImprimirBoleto(const AOwer : TComponent; sNomeCliente : String; iCodigoCliente, iAno, iVenda, iBanco : Integer;
    var sFileNamePDF : String; const SomenteGerarPDF : Boolean = FALSE) : Boolean;

implementation

uses UDMBusiness, StrUtils, TypInfo, DateUtils, UConstantesDGE, UFuncoes;

{$R *.dfm}

procedure GerarBoleto(const AOwer : TComponent);
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure GerarBoleto(const AOwer : TComponent; const NomeCliente : String; const iCodigoCliente : Integer; iAno, iVenda : Integer); overload;
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.IbQryClientes.Close;
    f.IbQryClientes.ParamByName('nome').AsString := NomeCliente;
    f.IbQryClientes.Open;

    if ( f.IbQryClientes.Locate('codigo', iCodigoCliente, []) ) then
    begin
      f.dbgDadosDblClick( f.dbgDados );
      f.FFecharAoGerar := True;

      f.CarregarTitulos(iCodigoCliente, 0);

      f.CdsTitulos.Filter   := 'ANOVENDA = ' + IntToStr(iAno) + ' and NUMVENDA = ' + IntToStr(iVenda);
      f.CdsTitulos.Filtered := True;
      f.ShowModal;
    end
    else
      ShowWarning('Títulos não identificados!');

  finally
    f.Free;
  end;
end;

function ReImprimirBoleto(const AOwer : TComponent; sNomeCliente : String; iCodigoCliente, iAno, iVenda, iBanco : Integer;
  var sFileNamePDF : String; const SomenteGerarPDF : Boolean = FALSE) : Boolean;
var
  f : TfrmGeGerarBoleto;
  INossoNum ,
  ICarteira : Integer;
  sBanco    ,
  sCarteira : String;
  bReturn   : Boolean;
begin
  bReturn      := False;
  sFileNamePDF := GetDirectoryTempApp + FormatFloat('0000"."', iAno) + FormatFloat('##000000".pdf"', iVenda);

  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.IbQryClientes.Close;
    f.IbQryClientes.ParamByName('nome').AsString := sNomeCliente;
    f.IbQryClientes.Open;

    if ( f.IbQryClientes.Locate('codigo', iCodigoCliente, []) ) then
      with f do
      begin
        CarregarBancos;
        if ( IbQryBancos.Locate('BCO_COD', iBanco, []) ) then
        begin
          cmbBancoChange( cmbBanco );
          CarregarTitulos(iCodigoCliente, iBanco);

          CdsTitulos.Filter   := 'ANOVENDA = ' + IntToStr(iAno) + ' and NUMVENDA = ' + IntToStr(iVenda);
          CdsTitulos.Filtered := True;

          if CdsTitulos.IsEmpty then
          begin
            Application.MessageBox(PChar('Não existem títulos com boletos gerados para o banco ' + IbQryBancosBCO_NOME.AsString + '.'), 'Alerta', MB_ICONWARNING);
            Exit;
          end;

          ICarteira := StrToIntDef( IbQryBancosBCO_CARTEIRA.AsString, 0 );
          INossoNum := 0;
          sBanco    := Copy(cmbBanco.Text, 1, 3);
          sCarteira := IbQryBancosBCO_CARTEIRA.AsString;

          {$IFDEF ACBR}
          if DefinirCedenteACBr( IBanco, sCarteira ) then
          {$ELSE}
          if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
          {$ENDIF}
          begin

            {$IFDEF ACBR}
            if ( InserirBoletoACBr(INossoNum, False) ) then
              if SomenteGerarPDF then
              begin
                ACBrBoleto.ACBrBoletoFC.NomeArquivo := sFileNamePDF;
                ACBrBoleto.ACBrBoletoFC.GerarPDF;
              end
              else
                ACBrBoleto.Imprimir;
            {$ELSE}
            if ( InserirBoleto( CobreBemX ) ) then
              CobreBemX.ImprimeBoletos;
            {$ENDIF}

          end;

          bReturn := True;
        end;
      end;
  finally
    f.Free;
    
    Result := bReturn;
  end;
end;

//function ReImprimirBoleto(Cnjp : String; Lancamento : Int64; Banco : Integer) : Boolean;
//var
//  f : TfrmGrGerarBoleto;
//begin
//  try
//
//    f := TfrmGrGerarBoleto.Create(Application);
//
//    with f do
//    begin
//      IbQryBancos.Open;
//      if ( IbQryBancos.Locate('BCO_COD', Banco, []) ) then
//      begin
//
//      end;
//    end;
//
//  finally
//    f.Free;
//  end;
//end;

procedure TfrmGeGerarBoleto.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

procedure TfrmGeGerarBoleto.dbgDadosDrawColumnCell(Sender: TObject;
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
end;

procedure TfrmGeGerarBoleto.btnFiltrarClick(Sender: TObject);
begin
  if ( Trim(edtFiltrar.Text) = EmptyStr ) then
    Application.MessageBox('Digite uma palavra-chave', 'Alerta!', MB_ICONWARNING)
  else
  with IbQryClientes do
  begin
    Close;
    ParamByName('nome').AsString := StringReplace( Trim(edtFiltrar.Text), ' ', '%', [rfReplaceAll] );
    Open;
    if ( not IsEmpty ) then
      dbgDados.SetFocus
    else
      edtFiltrar.SelectAll;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    pgcGuias.SelectNextPage(False);
  end
  else
  if ( Key in [' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGeGerarBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  pgcGuias.ActivePageIndex := 0;
                  dbgDados.SetFocus;

                  pgcGuiasChange(Sender);
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  btnFechar.Click;

  end;
  inherited;
end;

procedure TfrmGeGerarBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  pgcGuias.ActivePageIndex := 0;
  CobreBemX      := CreateOleObject('CobreBemX.ContaCorrente');
  FFecharAoGerar := False;
end;

procedure TfrmGeGerarBoleto.FormShow(Sender: TObject);
begin
  {$IFDEF ACBR}
  lbltMsgInstrucoes.Enabled := False;
  edtMsgInstrucoes.Enabled  := False;
  lbltDemonstrativo.Enabled := False;
  edtDemonstrativo.Enabled  := False;
  {$ENDIF}

  CarregarBancos;
  if ( pgcGuias.ActivePageIndex = 0 ) then
    edtFiltrar.SetFocus
  else
  if ( pgcGuias.ActivePageIndex = 1 ) then
    dbgTitulos.SetFocus;

  cmbBancoChange(cmbBanco);
end;

procedure TfrmGeGerarBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmGeGerarBoleto.CarregarTitulos(iCodigoCliente: Integer; iBanco : Integer) : Boolean;
begin
  with CdsTitulos, Params do
  begin
    Filtered := False;

    Close;
    ParamByName('cliente').AsInteger := iCodigoCliente;
    ParamByName('banco').AsInteger   := iBanco;
    Open;

    Result := not IsEmpty;
  end;
end;

procedure TfrmGeGerarBoleto.DtsClientesDataChange(Sender: TObject;
  Field: TField);
begin
  CarregarTitulos(IbQryClientesCODIGO.AsInteger, 0);
end;

procedure TfrmGeGerarBoleto.pgcGuiasChange(Sender: TObject);
begin
  try
    btnGerarBoleto.Enabled := ( pgcGuias.ActivePage = tbsTitulos ) and ( CdsTitulos.RecordCount > 0 );
  except
  end;
end;

procedure TfrmGeGerarBoleto.dbgTitulosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgTitulosDblClick(Sender);
end;

function TfrmGeGerarBoleto.DefinirCedente(Banco, Carteira : Integer; var Objeto: Variant): Boolean;
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
      Application.MessageBox(PChar('Erro ao tentar iniciar processo de geração de boletos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.btnGerarBoletoClick(Sender: TObject);
var
  IBanco      ,
  INossoNumero,
  ICarteira   : Integer;
  sBanco    ,
  sCarteira : String;
begin
  if ( Application.MessageBox('Confirma a geração de boletos?','Gerar Boleto', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> ID_YES ) then
    Exit;

  if ( cmbBanco.ItemIndex < 0 ) then
  begin
    Application.MessageBox(PChar('Favor selecionar a entidade financeira para geração dos boletos.'), 'Alerta', MB_ICONWARNING);
    Exit;
  end;

  cmbBancoChange(cmbBanco);

  IBanco    := StrToIntDef( Copy(cmbBanco.Text, 1, 3), 0 );
  ICarteira := StrToIntDef( IbQryBancosBCO_CARTEIRA.AsString, 0 );

  sBanco    := Copy(cmbBanco.Text, 1, 3);
  sCarteira := IbQryBancosBCO_CARTEIRA.AsString;

  {$IFDEF ACBR}
  if DefinirCedenteACBr( IBanco, sCarteira ) then
  {$ELSE}
  if DefinirCedente( IBanco, ICarteira, CobreBemX ) then
  {$ENDIF}
  begin

    CdsTitulos.Filter   := 'GERAR = ' + QuotedStr('X');
    CdsTitulos.Filtered := True;

    if ( CdsTitulos.IsEmpty ) then
    begin
      CdsTitulos.Filtered := False;
      Application.MessageBox(PChar('Não existem títulos selecionados para geração de boletos.'), 'Alerta', MB_ICONWARNING);
      dbgTitulos.SetFocus;
    end
    else
    begin

      {$IFDEF ACBR}
      INossoNumero := 1;
      if ( InserirBoletoACBr(INossoNumero) ) then
      begin
        ACBrBoleto.Imprimir;
        GravarBoletosGeradosACBr(INossoNumero);
      {$ELSE}
      if ( InserirBoleto( CobreBemX ) ) then
      begin
        CobreBemX.ImprimeBoletos;
        GravarBoletosGerados;
      {$ENDIF}
      end;

      if FFecharAoGerar then
        ModalResult := mrOk;
    end;

    CdsTitulos.Filtered := False;

    CdsTitulos.Close;
    CdsTitulos.Open;

  end;
end;

procedure TfrmGeGerarBoleto.CarregarBancos;
begin
  with IbQryBancos, cmbBanco do
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

    cmbBanco.Tag       := IbQryBancosBCO_COD.AsInteger;
    cmbBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeGerarBoleto.cmbBancoChange(Sender: TObject);
begin
  if ( not IbQryBancos.Active ) then
    IbQryBancos.Open;

  if ( IbQryBancos.Locate('BCO_COD', StrToIntDef(Copy(cmbBanco.Text, 1, 3), 0), []) ) then
  begin
    cmbBanco.Tag := IbQryBancosBCO_COD.AsInteger;
    edtMsgInstrucoes.Text := '<br>' + Trim(IbQryBancosBCO_MSG_INSTRUCAO.AsString);
  end;
end;

function TfrmGeGerarBoleto.InserirBoleto(var Objeto: Variant): Boolean;
var
  sAppPath   ,
  sDocumento : String;
  Boleto   ,
  EmailSacado : Variant;
begin
  try
    sAppPath := ExtractFilePath(ParamStr(0));

    Objeto.DocumentosCobranca.Clear;

    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin
      Boleto     := Objeto.DocumentosCobranca.Add;
      sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);

      Boleto.NumeroDocumento := sDocumento;
      Boleto.NomeSacado      := dbNome.Field.AsString;

      if Length(dbCPF.Field.AsString) > 11 then
        Boleto.CNPJSacado := dbCPF.Field.AsString
      else
        Boleto.CPFSacado  := dbCPF.Field.AsString;

      Boleto.EnderecoSacado := dbEndereco.Field.AsString;
      Boleto.BairroSacado   := dbBairro.Field.AsString;
      Boleto.CidadeSacado   := dbCidade.Field.AsString;
      Boleto.EstadoSacado   := dbUF.Field.AsString;
      Boleto.CepSacado      := dbCEP.Field.AsString;
      Boleto.DataDocumento  := FormatDateTime('dd/mm/yyyy', Date);

      if not CdsTitulosDTVENC.IsNull then
        Boleto.DataVencimento  := FormatDateTime('dd/mm/yyyy', CdsTitulosDTVENC.AsDateTime);

      Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', Date);

      Boleto.ValorDocumento                := CdsTitulosVALORREC.AsFloat;
      Boleto.PercentualJurosDiaAtraso      := IbQryBancosBCO_PERCENTUAL_JUROS.AsFloat; // Juros - Multa diária
      Boleto.PercentualMultaAtraso         := IbQryBancosBCO_PERCENTUAL_MORA.AsFloat;  // Mora  - Multa de atraso
      Boleto.PercentualDesconto            := CdsTitulosPERCENTDESCONTO.AsFloat;
      Boleto.ValorOutrosAcrescimos         := 0;
      Boleto.PadroesBoleto.Demonstrativo   := Trim(edtDemonstrativo.Text) + '<br><br>Venda No. ' +
                                              FormatFloat('0000', CdsTitulosANOLANC.AsInteger) + '/' +
                                              FormatFloat('##00000000', CdsTitulosNUMVENDA.AsInteger);
      Boleto.PadroesBoleto.InstrucoesCaixa := Trim(edtMsgInstrucoes.Text);

      EmailSacado          := Boleto.EnderecosEmailSacado.Add;
      EmailSacado.Nome     := Boleto.NomeSacado;
      EmailSacado.Endereco := dbEmail.Field.AsString;

      Boleto.ControleProcessamentoDocumento.Imprime      := scpExecutar;
      Boleto.ControleProcessamentoDocumento.EnviaEmail   := scpExecutar;
      Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;

      if (Trim(CdsTitulosNOSSONUMERO.AsString) <> EmptyStr) then
      begin
        Boleto.NossoNumero := CdsTitulosNOSSONUMERO.AsString;

        if Length(CdsTitulosNOSSONUMERO.AsString) < (Objeto.MascaraNossoNumero + 1) then
          Boleto.CalculaDacNossoNumero := True;
      end;

      if Length(CdsTitulosNOSSONUMERO.AsString) < (Objeto.MascaraNossoNumero + 1) then
        Boleto.CalculaDacNossoNumero := True;

      CdsTitulos.Next;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar gerar boletos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.GravarBoletosGerados;
var
  Ano  ,
  Lanc ,
  I    : Integer;
  N : String;
begin
  CdsTitulos.IndexFieldNames := 'ANOLANC;NUMLANC';

  for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
  begin
    Ano  := 2000 + StrToInt( Copy(CobreBemX.DocumentosCobranca[I].NumeroDocumento, 1, 2));
    Lanc := StrToInt(Copy(CobreBemX.DocumentosCobranca[I].NumeroDocumento, 3, 8));

    if CdsTitulos.FindKey( [Ano, Lanc] ) then
      if ( CdsTitulosNOSSONUMERO.AsString <> CobreBemX.DocumentosCobranca[i].NossoNumero ) then
      begin
        CdsTitulos.Edit;
        CdsTitulosCODBANCO.Value    := IbQryBancosBCO_COD.Value;
        CdsTitulosNOSSONUMERO.Value := CobreBemX.DocumentosCobranca[i].NossoNumero;
        CdsTitulosDATAPROCESSOBOLETO.Value := GetDateTimeDB;
        CdsTitulosPERCENTJUROS.AsCurrency  := IbQryBancosBCO_PERCENTUAL_JUROS.AsCurrency;
        CdsTitulosPERCENTMULTA.AsCurrency  := IbQryBancosBCO_PERCENTUAL_MORA.AsCurrency;
        CdsTitulos.Post;

        CommitTransaction;

        UpdateTitulo(CdsTitulosANOLANC.Value, CdsTitulosNUMLANC.Value, CdsTitulosCODBANCO.Value, CdsTitulosNOSSONUMERO.Value, GetDateTimeDB);
      end;
  end;

  cmbBancoChange(cmbBanco);

  if ( IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString <> CobreBemX.ProximoNossoNumero ) then
  begin
    IbQryBancos.Edit;
    IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString := RightStr( '0000000' + CobreBemX.ProximoNossoNumero, 6 );
    IbQryBancos.Post;

    CommitTransaction;
  end;
end;

procedure TfrmGeGerarBoleto.GravarBoletosGeradosACBr(const iProximoNossoNumero : Integer);
var
  pDOC ,
  pDIG : String;
  I    : Integer;
  N : String;
  Titulo : TACBrTitulo;
  cJuros ,
  cMulta : Currency;
begin
  for I := 0 to ACBrBoleto.ListadeBoletos.Count - 1 do
    with ACBrBoleto, ListadeBoletos do
    begin
      Titulo := ListadeBoletos.Objects[I];

      if Pos('-', Titulo.NumeroDocumento) > 0 then
      begin
        CdsTitulos.IndexFieldNames := 'NFE;PARCELA';

        pDOC := Copy(Titulo.NumeroDocumento, 1, Pos('-', Titulo.NumeroDocumento) - 1);
        pDIG := Copy(Titulo.NumeroDocumento, Pos('-', Titulo.NumeroDocumento) + 1, 2);
      end
      else
      begin
        CdsTitulos.IndexFieldNames := 'ANOLANC;NUMLANC';

        pDOC := IntToStr( 2000 + StrToInt( Copy(Titulo.NumeroDocumento, 1, 2)) );
        pDIG := Copy(Titulo.NumeroDocumento, 3, 8);
      end;

      if CdsTitulos.FindKey( [pDOC, pDIG] ) then
        if ( CdsTitulosNOSSONUMERO.AsString <> Titulo.NossoNumero ) then
        begin
          cJuros := IbQryBancosBCO_PERCENTUAL_JUROS.AsCurrency;
          cMulta := IbQryBancosBCO_PERCENTUAL_MORA.AsCurrency;

          CdsTitulos.Edit;
          CdsTitulosCODBANCO.Value    := IbQryBancosBCO_COD.Value;
          CdsTitulosNOSSONUMERO.Value := Titulo.NossoNumero;
          CdsTitulosDATAPROCESSOBOLETO.Value := GetDateTimeDB;
          CdsTitulosPERCENTJUROS.AsCurrency  := cJuros;
          CdsTitulosPERCENTMULTA.AsCurrency  := cMulta;
          CdsTitulos.Post;

          CommitTransaction;

          UpdateTitulo(CdsTitulosANOLANC.Value, CdsTitulosNUMLANC.Value, CdsTitulosCODBANCO.Value, CdsTitulosNOSSONUMERO.Value,
            GetDateTimeDB, cJuros, cMulta);
        end;
    end;

  cmbBancoChange(cmbBanco);

  if ( IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString <> CobreBemX.ProximoNossoNumero ) then
  begin
    IbQryBancos.Edit;
    IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString := RightStr( FormatFloat('0000000', iProximoNossoNumero), 6 );
    IbQryBancos.Post;

    CommitTransaction;
  end;
end;

procedure TfrmGeGerarBoleto.DspTitulosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TBCONTREC';
end;

procedure TfrmGeGerarBoleto.UpdateTitulo(iAno : Smallint; iLancamento: Int64; iBanco: Integer;
  sNossoNumero: String; Data: TDateTime; const cJuros : Currency = 0.0; const cMulta : Currency = 0.0);
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;

    sSQL.BeginUpdate;
    sSQL.Clear;
    sSQL.Add( ' Update TBCONTREC Set ' );
    sSQL.Add( '     nossonumero = ' + QuotedStr(sNossoNumero) );
    sSQL.Add( '   , codbanco    = ' + IntToStr(iBanco) );
    sSQL.Add( '   , dataprocessoboleto = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Data)) );
    sSQL.Add( '   , percentjuros       = ' + StringReplace(FormatFloat('########0.###', cJuros), ',', '.', [rfReplaceAll]) );
    sSQL.Add( '   , percentmulta       = ' + StringReplace(FormatFloat('########0.###', cMulta), ',', '.', [rfReplaceAll]) );
    sSQL.Add( ' where anolanc = '   + IntToStr(iAno) );
    sSQL.Add( '   and numlanc = '   + IntToStr(iLancamento) );
    sSQL.EndUpdate;

    with UpdateLanc, SQL  do
    begin
      Clear;
      AddStrings( sSQL );
      ExecQuery;

      CommitTransaction;
    end;
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.SelectNextPage(False);
end;

procedure TfrmGeGerarBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de geração de boletos?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeGerarBoleto.dbgTitulosDblClick(Sender: TObject);
begin
  if ( not CdsTitulos.IsEmpty ) then
  begin
    CdsTitulos.Edit;
    if ( CdsTitulosGERAR.AsString = '.' ) then
      CdsTitulosGERAR.Value := 'X'
    else
      CdsTitulosGERAR.Value := '.';
    CdsTitulos.Post;
  end;
end;

procedure TfrmGeGerarBoleto.FormDestroy(Sender: TObject);
begin
  CobreBemX := Unassigned;
end;

function TfrmGeGerarBoleto.DefinirCedenteACBr(iBanco : Integer; sCarteira : String): Boolean;
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

function TfrmGeGerarBoleto.GetAgenciaNumero: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_AGENCIA.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeGerarBoleto.GetAgenciaDigito: String;
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

function TfrmGeGerarBoleto.GetContaDigito: String;
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

function TfrmGeGerarBoleto.GetContaNumero: String;
var
  S : String;
begin
  S := Trim(IbQryBancosBCO_CC.AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeGerarBoleto.InserirBoletoACBr(var iProximoNossoNumero : Integer; const NovosBoletos : Boolean = TRUE) : Boolean;
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

    iProximoNossoNumero := StrToIntDef( Trim(IbQryBancosBCO_NOSSO_NUM_PROXIMO.AsString), 1 );
    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin

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
        if StrIsCPF(dbCPF.Field.AsString) then
          Sacado.Pessoa   := pFisica
        else
        if StrIsCNPJ(dbCPF.Field.AsString) then
          Sacado.Pessoa   := pJuridica
        else
          Sacado.Pessoa   := pOutras;

        Sacado.CNPJCPF    := dbCPF.Field.AsString;
        Sacado.NomeSacado := dbNome.Field.AsString;
        Sacado.Logradouro := IbQryClientesENDER_DESC.AsString;
        Sacado.Numero     := IbQryClientesENDER_NUM.AsString;
        Sacado.Bairro     := dbBairro.Field.AsString;
        Sacado.Cidade     := dbCidade.Field.AsString;
        Sacado.UF         := dbUF.Field.AsString;
        Sacado.CEP        := StrOnlyNumbers(dbCEP.Field.AsString);
        Sacado.Email      := AnsiLowerCase(Trim(IbQryClientesEMAIL.AsString));
        Sacado.Fone       := StrOnlyNumbers(Trim(IbQryClientesFONE.AsString));

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

        if NovosBoletos then
          DataProcessamento := Now
        else
          DataProcessamento := CdsTitulosDATAPROCESSOBOLETO.AsDateTime;

        Carteira          := IbQryBancosBCO_CARTEIRA.AsString;

        if NovosBoletos then
          NossoNumero     := IntToStr(iProximoNossoNumero)
        else
          NossoNumero     := IntToStr( StrToInt(CdsTitulosNOSSONUMERO.AsString) );

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

        OcorrenciaOriginal.Tipo := toRemessaRegistrar;

        Instrucao1        := '00';
        Instrucao2        := '00';

        Mensagem.Text := sMensagem + #13 + StringReplace(Trim(edtMsgInstrucoes.Text), '<br>', '', [rfReplaceAll]);
      end;

      Inc(iProximoNossoNumero);

      CdsTitulos.Next;
    end;


    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar gerar boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeGerarBoleto', TfrmGeGerarBoleto);

end.
