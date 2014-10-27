unit UGeRequisicaoCompraPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoPesquisa, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, DBClient, Provider,
  IBTable, RXDBCtrl, IBUpdateSQL, IBStoredProc;

type
  TfrmGeRequisicaoCompraPesquisa = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    lblTipoRequisicao: TLabel;
    edTipoRequisicao: TComboBox;
    tblTipoRequisicao: TIBTable;
    lblFornecedor: TLabel;
    edFornecedor: TComboEdit;
    cdsAutorizacao: TIBDataSet;
    cdsAutorizacaoANO: TSmallintField;
    cdsAutorizacaoCODIGO: TIntegerField;
    cdsAutorizacaoEMPRESA: TIBStringField;
    cdsAutorizacaoNUMERO: TIBStringField;
    cdsAutorizacaoFORNECEDOR: TIntegerField;
    cdsAutorizacaoNOME_CONTATO: TIBStringField;
    cdsAutorizacaoTIPO: TSmallintField;
    cdsAutorizacaoINSERCAO_DATA: TDateTimeField;
    cdsAutorizacaoEMISSAO_DATA: TDateField;
    cdsAutorizacaoEMISSAO_USUARIO: TIBStringField;
    cdsAutorizacaoVALIDADE: TDateField;
    cdsAutorizacaoCOMPETENCIA: TIntegerField;
    cdsAutorizacaoCLIENTE: TIntegerField;
    cdsAutorizacaoMOVITO: TMemoField;
    cdsAutorizacaoOBSERVACAO: TMemoField;
    cdsAutorizacaoENDERECO_ENTREGA: TMemoField;
    cdsAutorizacaoSTATUS: TSmallintField;
    cdsAutorizacaoRECEBEDOR_NOME: TIBStringField;
    cdsAutorizacaoRECEBEDOR_CPF: TIBStringField;
    cdsAutorizacaoRECEBEDOR_FUNCAO: TIBStringField;
    cdsAutorizacaoFORMA_PAGTO: TSmallintField;
    cdsAutorizacaoCONDICAO_PAGTO: TSmallintField;
    cdsAutorizacaoTRANSPORTADOR: TIntegerField;
    cdsAutorizacaoVALOR_BRUTO: TIBBCDField;
    cdsAutorizacaoVALOR_DESCONTO: TIBBCDField;
    cdsAutorizacaoVALOR_TOTAL_FRETE: TIBBCDField;
    cdsAutorizacaoVALOR_TOTAL_IPI: TIBBCDField;
    cdsAutorizacaoVALOR_TOTAL: TIBBCDField;
    cdsAutorizacaoAUTORIZADO_DATA: TDateField;
    cdsAutorizacaoDATA_FATURA: TDateField;
    cdsAutorizacaoAUTORIZADO_USUARIO: TIBStringField;
    cdsAutorizacaoCANCELADO_DATA: TDateField;
    cdsAutorizacaoCANCELADO_USUARIO: TIBStringField;
    cdsAutorizacaoCANCELADO_MOTIVO: TMemoField;
    updAutorizacao: TIBUpdateSQL;
    CdsPesquisaANO: TSmallintField;
    CdsPesquisaCODIGO: TIntegerField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaNUMERO: TStringField;
    CdsPesquisaFORNECEDOR: TIntegerField;
    CdsPesquisaNOME_CONTATO: TStringField;
    CdsPesquisaTIPO: TSmallintField;
    CdsPesquisaINSERCAO_DATA: TDateTimeField;
    CdsPesquisaEMISSAO_DATA: TDateField;
    CdsPesquisaEMISSAO_USUARIO: TStringField;
    CdsPesquisaVALIDADE: TDateField;
    CdsPesquisaCOMPETENCIA: TIntegerField;
    CdsPesquisaMOVITO: TMemoField;
    CdsPesquisaOBSERVACAO: TMemoField;
    CdsPesquisaCLIENTE: TIntegerField;
    CdsPesquisaENDERECO_ENTREGA: TMemoField;
    CdsPesquisaSTATUS: TSmallintField;
    CdsPesquisaRECEBEDOR_NOME: TStringField;
    CdsPesquisaRECEBEDOR_CPF: TStringField;
    CdsPesquisaRECEBEDOR_FUNCAO: TStringField;
    CdsPesquisaFORMA_PAGTO: TSmallintField;
    CdsPesquisaCONDICAO_PAGTO: TSmallintField;
    CdsPesquisaTRANSPORTADOR: TIntegerField;
    CdsPesquisaITENS: TIntegerField;
    CdsPesquisaVALOR_BRUTO: TBCDField;
    CdsPesquisaVALOR_DESCONTO: TBCDField;
    CdsPesquisaVALOR_TOTAL_FRETE: TBCDField;
    CdsPesquisaVALOR_TOTAL_IPI: TBCDField;
    CdsPesquisaVALOR_TOTAL: TBCDField;
    CdsPesquisaREQUISITADO_DATA: TDateField;
    CdsPesquisaDATA_FATURA: TDateField;
    CdsPesquisaREQUISITADO_USUARIO: TStringField;
    CdsPesquisaCANCELADO_DATA: TDateField;
    CdsPesquisaCANCELADO_USUARIO: TStringField;
    CdsPesquisaCANCELADO_MOTIVO: TMemoField;
    CdsPesquisaNOMEFORN: TStringField;
    CdsPesquisaCNPJ: TStringField;
    CdsPesquisaPESSOA_FISICA: TSmallintField;
    CdsPesquisaFATURAMENTO_MINIMO: TBCDField;
    CdsPesquisaTRANSPORTADOR_NOME: TStringField;
    CdsPesquisaTRANSPORTADOR_CPF_CNPJ: TStringField;
    CdsPesquisaNOMECLIENTE: TStringField;
    CdsPesquisaSELECIONAR: TIntegerField;
    BtnConverter: TSpeedButton;
    stpGerarAutorizacaoItens: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure CdsPesquisaSTATUSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsPesquisaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFornecedorButtonClick(Sender: TObject);
    procedure edFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConverterClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CarregarTipos;
    procedure GetValorTotal(var iFormaPagto, iCondicaoPagto : Integer;
      var cTotalBruto, cTotalDesconto, cTotalFrete, cTotalIPI, cTotalLiquido : Currency);

    function GetTipoRequisicao : Integer;
    function EstaSelecionada : Boolean;

    function GerarAutorizacao : Boolean;
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  frmGeRequisicaoCompraPesquisa: TfrmGeRequisicaoCompraPesquisa;

implementation

uses
  DateUtils, UDMBusiness, UConstantesDGE, UGrPadrao, UGeFornecedor;

{$R *.dfm}

{ TFrmGeVendaItemPesquisa }

procedure TfrmGeRequisicaoCompraPesquisa.CarregarTipos;
begin
  edTipoRequisicao.Clear;
  tblTipoRequisicao.Open;
  while not tblTipoRequisicao.Eof do
  begin
    edTipoRequisicao.Items.Add( Trim(tblTipoRequisicao.FieldByName('descricao').AsString) );

    tblTipoRequisicao.Next;
  end;
  edTipoRequisicao.ItemIndex := 0;
end;

function TfrmGeRequisicaoCompraPesquisa.ExecutarPesquisa: Boolean;
var
  sDataInicial,
  sDataFinal  : String;
begin
  Screen.Cursor := crSQLWait;
  try
    sDataInicial := FormatDateTime('yyyy-mm-dd', StrToDateDef(e1Data.Text, Date));
    sDataFinal   := FormatDateTime('yyyy-mm-dd', StrToDateDef(e2Data.Text, Date));

    CdsPesquisa.Close;

    with CdsPesquisa, Params do
    begin
      ParamByName('empresa').AsString := GetEmpresaIDDefault;
      ParamByName('tipo').AsInteger   := GetTipoRequisicao;
      ParamByName('data_inicial').AsDateTime := e1Data.Date;
      ParamByName('data_final').AsDateTime   := e2Data.Date;
      ParamByName('fornecedor').AsInteger    := edFornecedor.Tag;
      ParamByName('todos').AsInteger         := IfThen(edFornecedor.Tag = 0, 1, 0);
    end;

    CdsPesquisa.Open;

    Result := not CdsPesquisa.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := StrToDate(FormatDateTime('"01/"mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;

  CarregarTipos;
end;

function TfrmGeRequisicaoCompraPesquisa.GetTipoRequisicao: Integer;
begin
  Result := edTipoRequisicao.ItemIndex + 1;
end;

procedure TfrmGeRequisicaoCompraPesquisa.CdsPesquisaSTATUSGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      STATUS_REQUISICAO_EDC : Text := 'Em Edição';
      STATUS_REQUISICAO_ABR : Text := 'Aberta';
      STATUS_REQUISICAO_REQ : Text := 'Requisitada';
      STATUS_REQUISICAO_FAT : Text := 'Faturada';
      STATUS_REQUISICAO_CAN : Text := 'Cancelada';
    end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.CdsPesquisaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.dbgDadosDblClick(Sender: TObject);
begin
  if ( not CdsPesquisa.IsEmpty ) then
  begin
    CdsPesquisa.Edit;
    if ( CdsPesquisaSELECIONAR.AsInteger = 0 ) then
      CdsPesquisaSELECIONAR.AsInteger := 1
    else
      CdsPesquisaSELECIONAR.AsInteger := 0;
    CdsPesquisa.Post;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgDadosDblClick(Sender);
end;

procedure TfrmGeRequisicaoCompraPesquisa.edFornecedorButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sCNPJ ,
  sNome : String;
begin
  if ( SelecionarFornecedor(Self, iCodigo, sCNPJ, sNome) ) then
  begin
    edFornecedor.Tag  := iCodigo;
    edFornecedor.Text := sNome;
    BrnPesquisar.Click;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.edFornecedorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_DELETE ) then
  begin
    edFornecedor.Tag  := 0;
    edFornecedor.Text := EmptyStr;

    BrnPesquisar.Click;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.BtnConverterClick(
  Sender: TObject);
begin
  if CdsPesquisa.IsEmpty then
    ShowInformation('Favor pesquisar as requisições para o processo de conversão!')
  else
  if (edFornecedor.Tag = 0) then
    ShowInformation('Favor selecionar o fornecedor para a autorização a ser gerada a partir da conversão!')
  else
  if not EstaSelecionada then
    ShowInformation('Nenhum requisição de compra/serviço foi selecionada para conversão em autorização de compra/serviço!')
  else
  if ShowConfirmation('Confirma a conversão das requisições de compras/serviços selecionadas em um autorização de compra/serviço?') then
    if GerarAutorizacao then
      CdsPesquisa.Close;
end;

function TfrmGeRequisicaoCompraPesquisa.EstaSelecionada: Boolean;
var
  bSelecionada : Boolean;
begin
  bSelecionada := False;

  with CdsPesquisa do
  begin
    First;
    DisableControls;
    while not Eof do
    begin
      if not bSelecionada then
        bSelecionada := (CdsPesquisaSELECIONAR.AsInteger = 1);

      Next;
    end;
    EnableConstraints;
  end;

  Result := bSelecionada;
end;

function TfrmGeRequisicaoCompraPesquisa.GerarAutorizacao: Boolean;
var
  bRetorno : Boolean;
  iAno ,
  iNum : Integer;
  sInsertSQL     ,
  sGeneratorName : String;
  iFormaPagto    ,
  iCondicaoPagto : Integer;
  cTotalBruto   ,
  cTotalDesconto,
  cTotalFrete   ,
  cTotalIPI     ,
  cTotalLiquido : Currency;
begin
  bRetorno := False;
  try
    try
      GetValorTotal(iFormaPagto, iCondicaoPagto, cTotalBruto, cTotalDesconto, cTotalFrete, cTotalIPI, cTotalLiquido);

      sGeneratorName := 'GEN_AUTORIZA_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));

      cdsAutorizacao.GeneratorField.Generator := sGeneratorName;
      cdsAutorizacao.GeneratorField.Field     := 'codigo';

      iAno := YearOf(GetDateDB);
      iNum := GetGeneratorID(sGeneratorName);

      cdsAutorizacao.Close;
      cdsAutorizacao.ParamByName('ano').AsInteger    := iAno;
      cdsAutorizacao.ParamByName('codigo').AsInteger := iNum;
      cdsAutorizacao.ParamByName('empresa').AsString := GetEmpresaIDDefault;
      cdsAutorizacao.Open;

      // Gerar cabeçalho da autorização
      
      cdsAutorizacao.Append;

      cdsAutorizacaoANO.AsInteger    := iAno;
      cdsAutorizacaoCODIGO.AsInteger := iNum;
      cdsAutorizacaoNUMERO.AsString  := FormatFloat('##0000000', cdsAutorizacaoCODIGO.AsInteger) + '/' + Copy(cdsAutorizacaoANO.AsString, 3, 2);
      cdsAutorizacaoEMPRESA.Value    := GetEmpresaIDDefault;
      cdsAutorizacaoTIPO.Value       := GetTipoRequisicao;
      cdsAutorizacaoINSERCAO_DATA.Value    := GetDateTimeDB;
      cdsAutorizacaoEMISSAO_DATA.Value     := GetDateDB;
      cdsAutorizacaoEMISSAO_USUARIO.Value  := GetUserApp;
      cdsAutorizacaoVALIDADE.Value         := cdsAutorizacaoEMISSAO_DATA.Value + GetPrazoValidadeAutorizacaoCompra(GetEmpresaIDDefault);
      cdsAutorizacaoSTATUS.AsInteger       := STATUS_AUTORIZACAO_EDC;

      cdsAutorizacaoFORNECEDOR.AsInteger     := edFornecedor.Tag;
      cdsAutorizacaoFORMA_PAGTO.AsInteger    := iFormaPagto;
      cdsAutorizacaoCONDICAO_PAGTO.AsInteger := iCondicaoPagto;

      cdsAutorizacaoVALOR_BRUTO.AsCurrency       := cTotalBruto;
      cdsAutorizacaoVALOR_DESCONTO.AsCurrency    := cTotalDesconto;
      cdsAutorizacaoVALOR_TOTAL_FRETE.AsCurrency := cTotalFrete;
      cdsAutorizacaoVALOR_TOTAL_IPI.AsCurrency   := cTotalIPI;
      cdsAutorizacaoVALOR_TOTAL.AsCurrency       := cTotalLiquido;

      cdsAutorizacaoRECEBEDOR_NOME.Clear;
      cdsAutorizacaoRECEBEDOR_FUNCAO.Clear;
      cdsAutorizacaoRECEBEDOR_CPF.Clear;
      cdsAutorizacaoAUTORIZADO_DATA.Clear;
      cdsAutorizacaoAUTORIZADO_USUARIO.Clear;
      cdsAutorizacaoCANCELADO_DATA.Clear;
      cdsAutorizacaoCANCELADO_USUARIO.Clear;
      cdsAutorizacaoCANCELADO_MOTIVO.Clear;
      cdsAutorizacaoTRANSPORTADOR.Clear;
      cdsAutorizacaoCLIENTE.Clear;

      cdsAutorizacao.Post;
      cdsAutorizacao.ApplyUpdates;

      CommitTransaction;

      // Associar as requisições selecionadas à autorização

      with CdsPesquisa do
      begin
        First;
        DisableControls;
        while not Eof do
        begin
          if (CdsPesquisaSELECIONAR.AsInteger = 1) then
          begin
            sInsertSQL := 'Insert Into TBAUTORIZA_REQUISITA (AUTORIZACAO_ANO, AUTORIZACAO_COD, AUTORIZACAO_EMP, REQUISICAO_ANO, REQUISICAO_COD, REQUISICAO_EMP) values (' +
              cdsAutorizacaoANO.AsString     + ', ' +
              cdsAutorizacaoCODIGO.AsString  + ', ' +
              QuotedStr(cdsAutorizacaoEMPRESA.AsString) + ', ' +
              CdsPesquisaANO.AsString        + ', ' +
              CdsPesquisaCODIGO.AsString     + ', ' +
              QuotedStr(CdsPesquisaEMPRESA.AsString) + ')';
            ExecuteScriptSQL( sInsertSQL );
          end;

          Next;
        end;
        EnableConstraints;
      end;

      // Gerar Itens da autorização

      stpGerarAutorizacaoItens.Close;
      stpGerarAutorizacaoItens.ParamByName('autorizacao_ano').AsInteger := cdsAutorizacaoANO.AsInteger;
      stpGerarAutorizacaoItens.ParamByName('autorizacao_cod').AsInteger := cdsAutorizacaoCODIGO.AsInteger;
      stpGerarAutorizacaoItens.ParamByName('autorizacao_emp').AsString  := cdsAutorizacaoEMPRESA.AsString;
      stpGerarAutorizacaoItens.ParamByName('usuario').AsString          := GetUserApp;
      stpGerarAutorizacaoItens.ExecProc;

      CommitTransaction;

      // Finalizar autorização

      cdsAutorizacao.Edit;

      cdsAutorizacaoSTATUS.Value             := STATUS_AUTORIZACAO_AUT;
      cdsAutorizacaoAUTORIZADO_DATA.Value    := GetDateDB;
      cdsAutorizacaoAUTORIZADO_USUARIO.Value := GetUserApp;

      cdsAutorizacao.Post;
      cdsAutorizacao.ApplyUpdates;

      CommitTransaction;

      ShowInformation('Autorização finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + cdsAutorizacaoANO.AsString + '/' + FormatFloat('##0000000', cdsAutorizacaoCODIGO.AsInteger));

      bRetorno := True;
    except
      On E : Exception do
        ShowError('Erro ao tentar converter requisições de compras/serviços em autorização!' + #13 + E.Message);
    end;
  finally
    Result := bRetorno;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.GetValorTotal(var iFormaPagto, iCondicaoPagto : Integer;
  var cTotalBruto, cTotalDesconto, cTotalFrete, cTotalIPI, cTotalLiquido: Currency);
begin
  cTotalBruto    := 0.0;
  cTotalDesconto := 0.0;
  cTotalFrete    := 0.0;
  cTotalIPI      := 0.0;
  cTotalLiquido  := 0.0;

  with CdsPesquisa do
  begin
    First;
    DisableControls;
    while not Eof do
    begin
      if (CdsPesquisaSELECIONAR.AsInteger = 1) then
      begin
        iFormaPagto    := CdsPesquisaFORMA_PAGTO.AsInteger;
        iCondicaoPagto := CdsPesquisaCONDICAO_PAGTO.AsInteger;
        
        cTotalBruto    := cTotalBruto    + CdsPesquisaVALOR_BRUTO.AsCurrency;
        cTotalDesconto := cTotalDesconto + CdsPesquisaVALOR_DESCONTO.AsCurrency;
        cTotalFrete    := cTotalFrete    + CdsPesquisaVALOR_TOTAL_FRETE.AsCurrency;
        cTotalIPI      := cTotalIPI      + CdsPesquisaVALOR_TOTAL_IPI.AsCurrency;
        cTotalLiquido  := cTotalLiquido  + CdsPesquisaVALOR_TOTAL.AsCurrency;
      end;

      Next;
    end;
    EnableConstraints;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if ( Key = #13 ) then
    if edFornecedor.Focused then
      BrnPesquisar.Click;
end;

initialization
  FormFunction.RegisterForm('frmGeRequisicaoCompraPesquisa', TfrmGeRequisicaoCompraPesquisa);

end.
