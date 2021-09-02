unit UGeRequisicaoCompraPesquisa;

interface

uses
  UGrPadraoPesquisa,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, Menus, cxButtons,
  StdCtrls, Buttons, ExtCtrls, Mask, DBClient, Provider, IBTable, IBUpdateSQL, IBStoredProc,
  JvToolEdit, JvExMask, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver;

type
  TfrmGeRequisicaoCompraPesquisa = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    DspPesquisa: TDataSetProvider;
    CdsPesquisa: TClientDataSet;
    lblTipoRequisicao: TLabel;
    edTipoRequisicao: TComboBox;
    lblFornecedor: TLabel;
    BtnConverter: TSpeedButton;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    edFornecedor: TJvComboEdit;
    CdsPesquisaSELECIONAR: TIntegerField;
    CdsPesquisaANO: TSmallintField;
    CdsPesquisaCODIGO: TIntegerField;
    CdsPesquisaEMPRESA: TStringField;
    CdsPesquisaNUMERO: TStringField;
    CdsPesquisaFORNECEDOR: TIntegerField;
    CdsPesquisaNOME_CONTATO: TStringField;
    CdsPesquisaTIPO: TSmallintField;
    CdsPesquisaINSERCAO_DATA: TSQLTimeStampField;
    CdsPesquisaEMISSAO_DATA: TDateField;
    CdsPesquisaEMISSAO_USUARIO: TStringField;
    CdsPesquisaVALIDADE: TDateField;
    CdsPesquisaCOMPETENCIA: TIntegerField;
    CdsPesquisaMOVITO: TMemoField;
    CdsPesquisaOBSERVACAO: TMemoField;
    CdsPesquisaCLIENTE: TIntegerField;
    CdsPesquisaCENTRO_CUSTO: TIntegerField;
    CdsPesquisaENDERECO_ENTREGA: TMemoField;
    CdsPesquisaSTATUS: TSmallintField;
    CdsPesquisaRECEBEDOR_NOME: TStringField;
    CdsPesquisaRECEBEDOR_CPF: TStringField;
    CdsPesquisaRECEBEDOR_FUNCAO: TStringField;
    CdsPesquisaFORMA_PAGTO: TSmallintField;
    CdsPesquisaCONDICAO_PAGTO: TSmallintField;
    CdsPesquisaTRANSPORTADOR: TIntegerField;
    CdsPesquisaITENS: TIntegerField;
    CdsPesquisaREQUISITADO_DATA: TDateField;
    CdsPesquisaDATA_FATURA: TDateField;
    CdsPesquisaREQUISITADO_USUARIO: TStringField;
    CdsPesquisaCANCELADO_DATA: TDateField;
    CdsPesquisaCANCELADO_USUARIO: TStringField;
    CdsPesquisaCANCELADO_MOTIVO: TMemoField;
    CdsPesquisaNOMEFORN: TStringField;
    CdsPesquisaCNPJ: TStringField;
    CdsPesquisaPESSOA_FISICA: TSmallintField;
    CdsPesquisaTRANSPORTADOR_NOME: TStringField;
    CdsPesquisaTRANSPORTADOR_CPF_CNPJ: TStringField;
    CdsPesquisaNOMECLIENTE: TStringField;
    tblTipoRequisicao: TFDTable;
    cdsAutorizacao: TFDQuery;
    updAutorizacao: TFDUpdateSQL;
    cdsAutorizacaoANO: TSmallintField;
    cdsAutorizacaoCODIGO: TIntegerField;
    cdsAutorizacaoEMPRESA: TStringField;
    cdsAutorizacaoNUMERO: TStringField;
    cdsAutorizacaoFORNECEDOR: TIntegerField;
    cdsAutorizacaoNOME_CONTATO: TStringField;
    cdsAutorizacaoTIPO: TSmallintField;
    cdsAutorizacaoINSERCAO_DATA: TSQLTimeStampField;
    cdsAutorizacaoEMISSAO_DATA: TDateField;
    cdsAutorizacaoEMISSAO_USUARIO: TStringField;
    cdsAutorizacaoVALIDADE: TDateField;
    cdsAutorizacaoCOMPETENCIA: TIntegerField;
    cdsAutorizacaoMOVITO: TMemoField;
    cdsAutorizacaoOBSERVACAO: TMemoField;
    cdsAutorizacaoCLIENTE: TIntegerField;
    cdsAutorizacaoCENTRO_CUSTO: TIntegerField;
    cdsAutorizacaoENDERECO_ENTREGA: TMemoField;
    cdsAutorizacaoSTATUS: TSmallintField;
    cdsAutorizacaoRECEBEDOR_NOME: TStringField;
    cdsAutorizacaoRECEBEDOR_CPF: TStringField;
    cdsAutorizacaoRECEBEDOR_FUNCAO: TStringField;
    cdsAutorizacaoFORMA_PAGTO: TSmallintField;
    cdsAutorizacaoCONDICAO_PAGTO: TSmallintField;
    cdsAutorizacaoTRANSPORTADOR: TIntegerField;
    cdsAutorizacaoAUTORIZADO_DATA: TDateField;
    cdsAutorizacaoDATA_FATURA: TDateField;
    cdsAutorizacaoAUTORIZADO_USUARIO: TStringField;
    cdsAutorizacaoCANCELADO_DATA: TDateField;
    cdsAutorizacaoCANCELADO_USUARIO: TStringField;
    cdsAutorizacaoCANCELADO_MOTIVO: TMemoField;
    stpGerarAutorizacaoItens: TFDStoredProc;
    fdQryPesquisaSELECIONAR: TIntegerField;
    fdQryPesquisaANO: TSmallintField;
    fdQryPesquisaCODIGO: TIntegerField;
    fdQryPesquisaEMPRESA: TStringField;
    fdQryPesquisaNUMERO: TStringField;
    fdQryPesquisaFORNECEDOR: TIntegerField;
    fdQryPesquisaNOME_CONTATO: TStringField;
    fdQryPesquisaTIPO: TSmallintField;
    fdQryPesquisaINSERCAO_DATA: TSQLTimeStampField;
    fdQryPesquisaEMISSAO_DATA: TDateField;
    fdQryPesquisaEMISSAO_USUARIO: TStringField;
    fdQryPesquisaVALIDADE: TDateField;
    fdQryPesquisaCOMPETENCIA: TIntegerField;
    fdQryPesquisaMOVITO: TMemoField;
    fdQryPesquisaOBSERVACAO: TMemoField;
    fdQryPesquisaCLIENTE: TIntegerField;
    fdQryPesquisaCENTRO_CUSTO: TIntegerField;
    fdQryPesquisaENDERECO_ENTREGA: TMemoField;
    fdQryPesquisaSTATUS: TSmallintField;
    fdQryPesquisaRECEBEDOR_NOME: TStringField;
    fdQryPesquisaRECEBEDOR_CPF: TStringField;
    fdQryPesquisaRECEBEDOR_FUNCAO: TStringField;
    fdQryPesquisaFORMA_PAGTO: TSmallintField;
    fdQryPesquisaCONDICAO_PAGTO: TSmallintField;
    fdQryPesquisaTRANSPORTADOR: TIntegerField;
    fdQryPesquisaITENS: TIntegerField;
    fdQryPesquisaREQUISITADO_DATA: TDateField;
    fdQryPesquisaDATA_FATURA: TDateField;
    fdQryPesquisaREQUISITADO_USUARIO: TStringField;
    fdQryPesquisaCANCELADO_DATA: TDateField;
    fdQryPesquisaCANCELADO_USUARIO: TStringField;
    fdQryPesquisaCANCELADO_MOTIVO: TMemoField;
    fdQryPesquisaNOMEFORN: TStringField;
    fdQryPesquisaCNPJ: TStringField;
    fdQryPesquisaPESSOA_FISICA: TSmallintField;
    fdQryPesquisaTRANSPORTADOR_NOME: TStringField;
    fdQryPesquisaTRANSPORTADOR_CPF_CNPJ: TStringField;
    fdQryPesquisaNOMECLIENTE: TStringField;
    fdQryPesquisaVALOR_BRUTO: TFMTBCDField;
    fdQryPesquisaVALOR_DESCONTO: TFMTBCDField;
    fdQryPesquisaVALOR_TOTAL_FRETE: TFMTBCDField;
    fdQryPesquisaVALOR_TOTAL_IPI: TFMTBCDField;
    fdQryPesquisaVALOR_TOTAL: TFMTBCDField;
    fdQryPesquisaFATURAMENTO_MINIMO: TFMTBCDField;
    CdsPesquisaVALOR_BRUTO: TFMTBCDField;
    CdsPesquisaVALOR_DESCONTO: TFMTBCDField;
    CdsPesquisaVALOR_TOTAL_FRETE: TFMTBCDField;
    CdsPesquisaVALOR_TOTAL_IPI: TFMTBCDField;
    CdsPesquisaVALOR_TOTAL: TFMTBCDField;
    CdsPesquisaFATURAMENTO_MINIMO: TFMTBCDField;
    cdsAutorizacaoVALOR_BRUTO: TFMTBCDField;
    cdsAutorizacaoVALOR_DESCONTO: TFMTBCDField;
    cdsAutorizacaoVALOR_TOTAL_FRETE: TFMTBCDField;
    cdsAutorizacaoVALOR_TOTAL_IPI: TFMTBCDField;
    cdsAutorizacaoVALOR_TOTAL: TFMTBCDField;
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

(*
  Tabelas:
  - TBREQUISITA_COMPRA
  - TBREQUISITA_COMPRAITEM
  - TBAUTORIZA_REQUISITA
  - TBAUTORIZA_COMPRA
  - TBFORNECEDOR
  - TBFORNECEDOR
  - TBCLIENTE

  Views:
  - VW_TIPO_REQUISICAO

  Procedures:
  - SET_AUTORIZACAO_ITENS_REQ

*)

var
  frmGeRequisicaoCompraPesquisa: TfrmGeRequisicaoCompraPesquisa;

implementation

uses
    DateUtils
  , COntroller.Tabela
  , UDMBusiness
  , UDMRecursos
  , UConstantesDGE
  , UGrPadrao
  , View.Fornecedor;

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
      ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
      ParamByName('tipo').AsInteger   := GetTipoRequisicao;
      ParamByName('data_inicial').AsDateTime := e1Data.Date;
      ParamByName('data_final').AsDateTime   := e2Data.Date;
      ParamByName('fornecedor').AsInteger    := edFornecedor.Tag;
      ParamByName('todos').AsInteger         := IfThen(edFornecedor.Tag = 0, 1, 0);
    end;

    CdsPesquisa.Open;

    Result := not CdsPesquisa.IsEmpty;

    BtnConverter.Enabled := Result;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeRequisicaoCompraPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := StrToDate(FormatDateTime('"01/"mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;

  // Configurar tabela de pesquisa
  TTabelaController
    .New
    .Tabela( CdsPesquisa )
    .Display('QUANTIDADE',     'Quantidade', ',0.###', TAlignment.taRightJustify)
    .Display('TOTAL_BRUTO',    'Total Bruto', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_DESCONTO', 'Total Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('TOTAL_FINAL',    'Total Final', ',0.00', TAlignment.taRightJustify)
    .Configurar( CdsPesquisa );

  TTabelaController
    .New
    .Tabela( cdsAutorizacao )
    .Display('VALOR_BRUTO',       'Total Bruto', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_DESCONTO',    'Total Desconto', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_FRETE', 'Total Frete', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL_IPI',   'Total IPI', ',0.00', TAlignment.taRightJustify)
    .Display('VALOR_TOTAL',       'Total Líquido', ',0.00', TAlignment.taRightJustify)
    .Configurar( cdsAutorizacao );

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
  if not CdsPesquisa.Active then
    Exit;

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
  begin
    BtnConverter.Enabled := False;
    
    if GerarAutorizacao then
    begin
      ShowInformation('Para processar nova conversão de requisições, favor pesquisar novamente.');
      Self.Close;
    end;  
  end;
end;

function TfrmGeRequisicaoCompraPesquisa.EstaSelecionada: Boolean;
var
  bSelecionada : Boolean;
begin
  bSelecionada := False;

  if not CdsPesquisa.Active then
    Exit;

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
  sTextoMotivo   ,
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

      sTextoMotivo   := EmptyStr;
      sGeneratorName := 'GEN_AUTORIZA_COMPRA_' + FormatFloat('0000', YearOf(GetDateDB));

      with cdsAutorizacao, UpdateOptions do
      begin
        GeneratorName := sGeneratorName;
        UpdateOptions.KeyFields     := 'codigo';
        UpdateOptions.AutoIncFields := 'codigo';
        UpdateOptions.FetchGeneratorsPoint := TFDFetchGeneratorsPoint.gpImmediate;
      end;

      iAno := YearOf(GetDateDB);
      iNum := GetGeneratorID(sGeneratorName);

      cdsAutorizacao.Close;
      cdsAutorizacao.ParamByName('ano').AsInteger    := iAno;
      cdsAutorizacao.ParamByName('codigo').AsInteger := iNum;
      cdsAutorizacao.ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
      cdsAutorizacao.Open;

      // Gerar cabeçalho da autorização
      
      cdsAutorizacao.Append;

      cdsAutorizacaoANO.AsInteger    := iAno;
      cdsAutorizacaoCODIGO.AsInteger := iNum;
      cdsAutorizacaoNUMERO.AsString  := FormatFloat('##0000000', cdsAutorizacaoCODIGO.AsInteger) + '/' + Copy(cdsAutorizacaoANO.AsString, 3, 2);
      cdsAutorizacaoEMPRESA.Value    := gUsuarioLogado.Empresa;
      cdsAutorizacaoTIPO.Value       := GetTipoRequisicao;
      cdsAutorizacaoINSERCAO_DATA.AsDateTime := GetDateTimeDB;
      cdsAutorizacaoEMISSAO_DATA.AsDateTime  := GetDateDB;
      cdsAutorizacaoEMISSAO_USUARIO.Value  := gUsuarioLogado.Login;
      cdsAutorizacaoVALIDADE.Value         := cdsAutorizacaoEMISSAO_DATA.Value + GetPrazoValidadeAutorizacaoCompra(gUsuarioLogado.Empresa);
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
      cdsAutorizacaoCENTRO_CUSTO.Clear;

      cdsAutorizacao.Post;
      cdsAutorizacao.ApplyUpdates;
      cdsAutorizacao.CommitUpdates;

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
            sTextoMotivo := sTextoMotivo + CdsPesquisaANO.AsString + FormatFloat('"/"##00000', CdsPesquisaCODIGO.AsInteger) + ', ';
            sInsertSQL   := 'Insert Into TBAUTORIZA_REQUISITA (AUTORIZACAO_ANO, AUTORIZACAO_COD, AUTORIZACAO_EMP, REQUISICAO_ANO, REQUISICAO_COD, REQUISICAO_EMP) values (' +
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

      sTextoMotivo := Trim(sTextoMotivo);
      sTextoMotivo := 'Autorização gerada para agrupar as requisições de compras/serviços : ' + Copy(sTextoMotivo, 1, Length(sTextoMotivo) - 1) + '.';

      // Gerar Itens da autorização

      stpGerarAutorizacaoItens.Close;
      stpGerarAutorizacaoItens.ParamByName('autorizacao_ano').AsSmallInt := cdsAutorizacaoANO.AsInteger;
      stpGerarAutorizacaoItens.ParamByName('autorizacao_cod').AsInteger  := cdsAutorizacaoCODIGO.AsInteger;
      stpGerarAutorizacaoItens.ParamByName('autorizacao_emp').AsString   := cdsAutorizacaoEMPRESA.AsString;
      stpGerarAutorizacaoItens.ParamByName('usuario').AsString           := gUsuarioLogado.Login;
      stpGerarAutorizacaoItens.ExecProc;

      CommitTransaction;

      // Finalizar autorização

      cdsAutorizacao.Edit;

      cdsAutorizacaoMOVITO.AsString          := AnsiUpperCase(sTextoMotivo);
      cdsAutorizacaoSTATUS.Value             := STATUS_AUTORIZACAO_AUT;
      cdsAutorizacaoAUTORIZADO_DATA.Value    := GetDateDB;
      cdsAutorizacaoAUTORIZADO_USUARIO.Value := gUsuarioLogado.Login;

      cdsAutorizacao.Post;
      cdsAutorizacao.ApplyUpdates;
      cdsAutorizacao.CommitUpdates;

      CommitTransaction;

      ShowInformation('Autorização gerada e finalizada com sucesso !' + #13#13 + 'Ano/Número: ' + cdsAutorizacaoANO.AsString + '/' + FormatFloat('##0000000', cdsAutorizacaoCODIGO.AsInteger));

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
  if not CdsPesquisa.Active then
    Exit;

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
