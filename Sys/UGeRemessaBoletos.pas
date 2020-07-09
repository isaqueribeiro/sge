unit UGeRemessaBoletos;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, IBCustomDataSet, IBTable, ComCtrls, ACBrBoleto, ACBrBoletoFCFR,
  DBClient, Provider, Buttons, ToolWin, Grids, DBGrids, ComObj, frxClass, frxDBSet, cxButtons,
  ACBrBase, Mask, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    DtsTitulos: TDataSource;
    pnlTitulos: TPanel;
    Shape1: TShape;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel5: TBevel;
    dbgTitulos: TDBGrid;
    Label5: TLabel;
    frrRemessa: TfrxReport;
    frdRemessa: TfrxDBDataset;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoFCFR: TACBrBoletoFCFR;
    edInicio: TJvDateEdit;
    edFinal: TJvDateEdit;
    tlbBotoes: TPanel;
    Bevel3: TBevel;
    btnFechar: TcxButton;
    Bevel4: TBevel;
    btnGerarRemessa: TcxButton;
    Bevel6: TBevel;
    chkEnviarCancelados: TCheckBox;
    Bevel7: TBevel;
    btnHistorico: TcxButton;
    CdsTitulosNumeroDocumento: TStringField;
    fdUpdBancos: TFDUpdateSQL;
    fdQryBancos: TFDQuery;
    IbQryTitulos: TFDQuery;
    UpdTitulos: TFDUpdateSQL;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosNUMLANC: TIntegerField;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosPARCELA_MAXIMA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosNOSSONUMERO: TStringField;
    CdsTitulosCNPJ: TStringField;
    CdsTitulosTIPPAG: TStringField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TCurrencyField;
    CdsTitulosPERCENTMULTA: TCurrencyField;
    CdsTitulosPERCENTDESCONTO: TCurrencyField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    CdsTitulosSITUACAO: TSmallintField;
    CdsTitulosSERIE: TStringField;
    CdsTitulosNFE: TLargeintField;
    CdsTitulosINSCEST: TStringField;
    CdsTitulosNOME: TStringField;
    CdsTitulosFONE: TStringField;
    CdsTitulosENDER: TStringField;
    CdsTitulosENDER_DESC: TStringField;
    CdsTitulosENDER_NUM: TStringField;
    CdsTitulosBAIRRO: TStringField;
    CdsTitulosCIDADE: TStringField;
    CdsTitulosUF: TStringField;
    CdsTitulosCEP: TStringField;
    CdsTitulosEMAIL: TStringField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CdsTitulosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CarregarBancos;
    procedure DefinirNomeArquivo( iBanco : Integer );
    procedure CarregarTitulos( iBanco : Integer; DataInicial, DataFinal : TDate);
    procedure GravarHistoricoRemessa;

    function GetAgenciaNumero : String;
    function GetAgenciaDigito : String;
    function GetContaNumero : String;
    function GetContaDigito : String;
    function GetNossoNumeroRepetido : Boolean;

    function DefinirCedenteACBr(iBanco : Integer; sCarteira : String) : Boolean;
    function InserirBoletoACBr : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBEMPRESA
  - TBBANCO_BOLETO
  - TBCONTREC
  - TBVENDAS
  - TBCLIENTE

  Views:
  - VW_EMPRESA

  Procedures:

*)

var
  frmGeRemessaBoleto: TfrmGeRemessaBoleto;

  procedure GerarArquivoRemessa(const AOwer : TComponent);

implementation

uses UDMBusiness, UConstantesDGE, UFuncoes, UDMRecursos;

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
  edBanco.Items.Clear;

  with fdQryBancos, edBanco do
  begin
    Close;
    ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
    Open;

    if ( not IsEmpty ) then
      Clear;

    while not Eof do
    begin
      Items.Add( FormatFloat('000', fdQryBancos.FieldByName('BCO_COD').AsInteger) + ' - ' + fdQryBancos.FieldByName('BCO_NOME').AsString );

      Next;
    end;

    First;

    edBanco.Tag       := fdQryBancos.FieldByName('BCO_COD').AsInteger;
    edBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeRemessaBoleto.FormShow(Sender: TObject);
begin
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';

  CarregarBancos;
  edBancoChange(edBanco);
end;

procedure TfrmGeRemessaBoleto.edBancoChange(Sender: TObject);
begin
  if ( not fdQryBancos.Active ) then
    fdQryBancos.Open;

  if ( fdQryBancos.Locate('BCO_COD', StrToIntDef(Copy(edBanco.Text, 1, 3), 0), []) ) then
    edBanco.Tag := fdQryBancos.FieldByName('BCO_COD').AsInteger;

  DefinirNomeArquivo( edBanco.Tag );

  CarregarTitulos( edBanco.Tag, edInicio.Date, edFinal.Date );
end;

procedure TfrmGeRemessaBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  edInicio.Date := Date;
  edFinal.Date  := Date;
end;

procedure TfrmGeRemessaBoleto.DefinirNomeArquivo(iBanco: Integer);
begin
  try
    ForceDirectories(Trim(fdQryBancos.FieldByName('BCO_DIRETORIO_REMESSA').AsString));
  except
  end;

  if ( DirectoryExists(Trim(fdQryBancos.FieldByName('BCO_DIRETORIO_REMESSA').AsString)) ) then
    edArquivoRemessa.Text := Trim(fdQryBancos.FieldByName('BCO_DIRETORIO_REMESSA').AsString) + FormatFloat('000', iBanco) + '\' + FormatFloat('000', iBanco) + '_' + FormatDateTime('yyyymmdd-hhmmss', Now) + '.rem'
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
    ICarteira := fdQryBancos.FieldByName('BCO_CARTEIRA').AsInteger;

    sBanco    := Copy(edBanco.Text, 1, 3);
    sCarteira := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

    if GetNossoNumeroRepetido then
      Exit;

    if DefinirCedenteACBr( IBanco, sCarteira ) then
    begin
      CdsTitulos.First;

      if ( InserirBoletoACbr ) then
      begin
        edArquivoRemessa.Text := StringReplace(ACBrBoleto.GerarRemessa(fdQryBancos.FieldByName('BCO_SEQUENCIAL_REM').AsInteger), '\\', '\', [rfReplaceAll]);
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
    ParamByName('empresa').AsString   := gUsuarioLogado.Empresa;
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
      sSQL.Add( '     enviado = 1, remessa = ' + fdQryBancos.FieldByName('BCO_SEQUENCIAL_REM').AsString );
      sSQL.Add( ' where codbanco = '   + IntToStr(edBanco.Tag) );
      sSQL.Add( '   and baixado  = 0' );
      sSQL.Add( '   and enviado  = 0' );
      sSQL.Add( '   and dataprocessoboleto between ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edInicio.Date)) + ' and ' + QuotedStr(FormatDateTime('yyyy-mm-dd', edFinal.Date))) ;
      sSQL.EndUpdate;

      ExecuteScriptSQL(sSQL.Text);

      fdQryBancos.Edit;
      fdQryBancos.FieldByName('BCO_SEQUENCIAL_REM').Value := fdQryBancos.FieldByName('BCO_SEQUENCIAL_REM').AsInteger + 1;
      fdQryBancos.Post;
      fdQryBancos.ApplyUpdates;
      fdQryBancos.CommitUpdates;

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
          raise Exception.Create('Sistema não adapitado para gerar boletos para o banco ' + fdQryBancos.FieldByName('BCO_NOME').AsString);
      end;

      Case fdQryBancos.FieldByName('BCO_LAYOUT_REMESSA').AsInteger of
        240: LayoutRemessa := c240;
        400: LayoutRemessa := c400;
      end;

      ACBrBoleto.NomeArqRemessa := ExtractFileName(edArquivoRemessa.Text);
      ACBrBoleto.DirArqRemessa  := ExtractFilePath(edArquivoRemessa.Text);

      ACBrBoletoFCFR.DirLogo        := ExtractFilePath(sAppLogo);
      ACBrBoletoFCFR.FastReportFile := sAppBoleto;
      ACBrBoletoFCFR.SoftwareHouse  := gPersonalizaEmpresa.CompanyName;

      // Dados Conta
      Cedente.Agencia       := GetAgenciaNumero;
      Cedente.AgenciaDigito := GetAgenciaDigito;
      Cedente.Conta         := GetContaNumero;
      Cedente.ContaDigito   := GetContaDigito;
      Cedente.Convenio      := fdQryBancos.FieldByName('BCO_CHAVE').AsString;

      // Dados Cedente
      if StrIsCPF(fdQryBancos.FieldByName('EMPRESA').AsString) then
        Cedente.TipoInscricao := pFisica
      else
      if StrIsCNPJ(fdQryBancos.FieldByName('EMPRESA').AsString) then
        Cedente.TipoInscricao := pJuridica;

      Cedente.CNPJCPF     := fdQryBancos.FieldByName('EMPRESA').AsString;
      Cedente.Nome        := fdQryBancos.FieldByName('RZSOC').AsString;
      Cedente.Logradouro  := fdQryBancos.FieldByName('ENDER').AsString;
      Cedente.NumeroRes   := fdQryBancos.FieldByName('NUMERO_END').AsString;
      Cedente.Complemento := fdQryBancos.FieldByName('COMPLEMENTO').AsString;
      Cedente.Bairro := fdQryBancos.FieldByName('BAIRRO').AsString;
      Cedente.CEP    := fdQryBancos.FieldByName('CEP').AsString;
      Cedente.Cidade := fdQryBancos.FieldByName('CIDADE').AsString;
      Cedente.UF     := fdQryBancos.FieldByName('UF').AsString;

      // Dados Convênio
      Cedente.CodigoCedente     := Trim(fdQryBancos.FieldByName('BCO_CODIGO_CEDENTE').AsString);
      Cedente.Convenio          := fdQryBancos.FieldByName('BCO_CHAVE').AsString;
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
  S := Trim(fdQryBancos.FieldByName('BCO_AGENCIA').AsString);

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
  S := Trim(fdQryBancos.FieldByName('BCO_AGENCIA').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeRemessaBoleto.GetContaDigito: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_CC').AsString);

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
  S := Trim(fdQryBancos.FieldByName('BCO_CC').AsString);

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

        Carteira          := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

        NossoNumero     := CdsTitulosNOSSONUMERO.AsString;

        // Dados de Cobrança
        ValorDocumento    := CdsTitulosVALORREC.AsCurrency;
        ValorAbatimento   := 0.0;
        ValorMoraJuros    := (CdsTitulosVALORREC.AsCurrency * fdQryBancos.FieldByName('BCO_PERCENTUAL_MORA').AsCurrency / 100) / 30;
        ValorDesconto     := CdsTitulosVALORREC.AsCurrency * CdsTitulosPERCENTDESCONTO.AsCurrency / 100;
        DataMoraJuros     := GetProximoDiaUtil(Vencimento);
        DataAbatimento    := StrToCurrDef(EmptyStr, 0);

        if ( CdsTitulosPERCENTDESCONTO.AsCurrency = 0 ) then
          DataDesconto    := StrToCurrDef(EmptyStr, 0)
        else
          DataDesconto    := CdsTitulosDTVENC.AsDateTime;

        if ( fdQryBancos.FieldByName('BCO_DIA_PROTESTO').AsInteger = 0 ) then
          DataProtesto    := StrToCurrDef(EmptyStr, 0)
        else
          DataProtesto    := (Vencimento + fdQryBancos.FieldByName('BCO_DIA_PROTESTO').AsInteger);

        PercentualMulta   := fdQryBancos.FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency;  // Percentual de multa por dia de atraso.

        if ( CdsTitulosSITUACAO.AsInteger = 0 ) then     // Cancelado
          OcorrenciaOriginal.Tipo := toRemessaBaixar
        else
        if ( CdsTitulosSITUACAO.AsInteger = 1 ) then     // Ativo
          OcorrenciaOriginal.Tipo := toRemessaRegistrar;

        Instrucao1        := '00';
        Instrucao2        := '00';

        Mensagem.Text := sMensagem + #13 + StringReplace(fdQryBancos.FieldByName('BCO_MSG_INSTRUCAO').AsString, '<br>', '', [rfReplaceAll]);
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
