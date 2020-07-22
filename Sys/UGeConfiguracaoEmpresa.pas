unit UGeConfiguracaoEmpresa;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, IBTable, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, System.ImageList;

type
  TfrmGeConfiguracaoEmpresa = class(TfrmGrPadraoCadastro)
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    pgcConfigurar: TPageControl;
    tbsContaEmail: TTabSheet;
    lblEmailConta: TLabel;
    dbEmailConta: TDBEdit;
    lblEmailSenha: TLabel;
    dbEmailSenha: TDBEdit;
    lblEmailPOP: TLabel;
    dbEmailPOP: TDBEdit;
    dbEmailSMTP: TDBEdit;
    lblEmailSMTP: TLabel;
    lblEmailPorta: TLabel;
    dbEmailPorta: TDBEdit;
    dbEmailAutentica: TDBCheckBox;
    dbEmailConexaoSSL: TDBCheckBox;
    TbsNFe: TTabSheet;
    chkNFE_SolicitaDHSaida: TDBCheckBox;
    chkImprimirCodCliente: TDBCheckBox;
    TbsOutrasConfig: TTabSheet;
    dbCustoOperacional: TDBCheckBox;
    dbEstoqueUnico: TDBCheckBox;
    dbDuplicarCnpj: TDBCheckBox;
    dbEstoqueSatelite: TDBCheckBox;
    dbAutorizacaoInformaCliente: TDBCheckBox;
    chkNFE_Emitir: TDBCheckBox;
    chkNFE_SalvarNotaDenegada: TDBCheckBox;
    grpBxToken: TGroupBox;
    lblTokenId: TLabel;
    edTokenId: TDBEdit;
    lblToken: TLabel;
    edToken: TDBEdit;
    chkNFE_EmitirEntrada: TDBCheckBox;
    TbsNFSe: TTabSheet;
    grpBxNFe: TGroupBox;
    lblNFeSerie: TLabel;
    lblNFeNumero: TLabel;
    dbNFeSerie: TDBEdit;
    dbNFeNumero: TDBEdit;
    chkNFCE_Emitir: TDBCheckBox;
    grpBxNFCe: TGroupBox;
    lblNFCeSerie: TLabel;
    lblNFCeNumero: TLabel;
    dbNFCeSerie: TDBEdit;
    dbNFCeNumero: TDBEdit;
    chkNFSE_Emitir: TDBCheckBox;
    grpBxNFSe: TGroupBox;
    lblNFSeSerie: TLabel;
    lblNFSeNumero: TLabel;
    dbNFSeSerie: TDBEdit;
    dbNFSeNumero: TDBEdit;
    grpBxNFSeAliquotas: TGroupBox;
    lblNFSePIS: TLabel;
    dbNFSePIS: TDBEdit;
    lblNFSeCOFINS: TLabel;
    dbNFSeCOFINS: TDBEdit;
    lblNFSeCSLL: TLabel;
    dbNFSeCSLL: TDBEdit;
    dbNFSeISSQN: TDBEdit;
    lblNFSeISSQN: TLabel;
    tbsVenda: TTabSheet;
    fdQryFormaPagto: TFDQuery;
    lblFormaPagtoCartaCredito: TLabel;
    dbFormaPagtoCartaCredito: TDBLookupComboBox;
    DtsFormaPagto: TDataSource;
    dbPermitirVendaSemEstoque: TDBCheckBox;
    dbCarregarProdutoPeloEAN: TDBCheckBox;
    fdQryEmpresa: TFDQuery;
    fdQryConfiguracoes: TFDQuery;
    dbVerdadeiroFalsoCnpj: TDBCheckBox;
    grpBxRPS: TGroupBox;
    lblRPSSerie: TLabel;
    lblRPSNumero: TLabel;
    dbRPSSerie: TDBEdit;
    dbRPSNumero: TDBEdit;
    lblNFeCartaCorrecao: TLabel;
    dbNFeCartaCorrecao: TDBEdit;
    lblNFeLote: TLabel;
    dbNFeLote: TDBEdit;
    chkImprimirCodReferencia: TDBCheckBox;
    imgGrid: TImageList;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaEMAIL_CONTA: TStringField;
    fdQryTabelaEMAIL_SENHA: TStringField;
    fdQryTabelaEMAIL_POP: TStringField;
    fdQryTabelaEMAIL_SMTP: TStringField;
    fdQryTabelaEMAIL_SMTP_PORTA: TIntegerField;
    fdQryTabelaEMAIL_REQUER_AUTENTICACAO: TSmallintField;
    fdQryTabelaEMAIL_CONEXAO_SSL: TSmallintField;
    fdQryTabelaEMAIL_ASSUNTO_PADRAO: TStringField;
    fdQryTabelaEMAIL_MENSAGEM_PADRAO: TStringField;
    fdQryTabelaCLIENTE_PERMITIR_DUPLICAR_CNPJ: TSmallintField;
    fdQryTabelaCLIENTE_PERMITIR_VF_CNPJ: TSmallintField;
    fdQryTabelaCUSTO_OPER_CALCULAR: TSmallintField;
    fdQryTabelaPERMITIR_VENDA_ESTOQUE_INS: TSmallintField;
    fdQryTabelaVENDA_CARREGA_PRODUTO_EAN: TSmallintField;
    fdQryTabelaVENDA_FORMA_PAGTO_CARTACREDITO: TSmallintField;
    fdQryTabelaESTOQUE_UNICO_EMPRESAS: TSmallintField;
    fdQryTabelaESTOQUE_SATELITE_CLIENTE: TSmallintField;
    fdQryTabelaAUTORIZA_INFORMA_CLIENTE: TSmallintField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaNFE_EMITIR: TSmallintField;
    fdQryTabelaNFE_SERIE: TSmallintField;
    fdQryTabelaNFE_NUMERO: TIntegerField;
    fdQryTabelaNFE_LOTE: TIntegerField;
    fdQryTabelaNFE_CARTA_CORRECAO: TIntegerField;
    fdQryTabelaNFE_EMITIR_ENTRADA: TSmallintField;
    fdQryTabelaNFE_ACEITAR_NOTA_DENEGADA: TSmallintField;
    fdQryTabelaNFE_SOLICITA_DH_SAIDA: TSmallintField;
    fdQryTabelaNFE_IMPRIMIR_COD_CLIENTE: TSmallintField;
    fdQryTabelaNFE_IMPRIMIR_COD_REFERENCIA: TSmallintField;
    fdQryTabelaNFCE_EMITIR: TSmallintField;
    fdQryTabelaNFCE_SERIE: TSmallintField;
    fdQryTabelaNFCE_NUMERO: TIntegerField;
    fdQryTabelaNFCE_TOKEN_ID: TStringField;
    fdQryTabelaNFCE_TOKEN: TStringField;
    fdQryTabelaRPS_SERIE: TStringField;
    fdQryTabelaRPS_NUMERO: TIntegerField;
    fdQryTabelaNFSE_EMITIR: TSmallintField;
    fdQryTabelaNFSE_SERIE: TStringField;
    fdQryTabelaNFSE_NUMERO: TIntegerField;
    fdQryTabelaRZSOC: TStringField;
    fdQryTabelaNMFANT: TStringField;
    fdQryTabelaNFSE_PERCENTUAL_PIS: TFMTBCDField;
    fdQryTabelaNFSE_PERCENTUAL_COFINS: TFMTBCDField;
    fdQryTabelaNFSE_PERCENTUAL_CSLL: TFMTBCDField;
    fdQryTabelaNFSE_PERCENTUAL_ISSQN: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaEMPRESAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    procedure Aplicar_ModeloEstoque;

    function GetConfiguracaoCadastrada(sEmpresa : String) : Boolean;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCONFIGURACAO
  - TBEMRESA
  - TBFORMPAGTO

  Views:

  Procedures:

*)

implementation

uses UConstantesDGE, UDMBusiness;

{$R *.dfm}

procedure TfrmGeConfiguracaoEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := EmptyStr;
  
  NomeTabela      := 'TBCONFIGURACAO';
  CampoCodigo     := 'EMPRESA';
  CampoDescricao  := 'e.RZSOC';
  AbrirTabelaAuto := True;

  CarregarLista(fdQryFormaPagto);
  CarregarLista(fdQryEmpresa);

  pgcConfigurar.ActivePage := tbsContaEmail;

  dbAutorizacaoInformaCliente.Visible := (GetSegmentoID(gUsuarioLogado.Empresa) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID]);

  TbsNFSe.TabVisible         := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  TbsOutrasConfig.TabVisible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  chkNFE_Emitir.Enabled             := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  chkNFE_EmitirEntrada.Enabled      := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  grpBxNFe.Enabled                  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  chkNFE_SalvarNotaDenegada.Enabled := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  chkNFE_SolicitaDHSaida.Enabled    := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  chkImprimirCodCliente.Enabled     := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  Tabela
    .Display('EMPRESA', 'Empresa')
    .Display('NFSE_PERCENTUAL_PIS',    'NFS-e: Percentual PIS',    ',0.00#', TAlignment.taRightJustify)
    .Display('NFSE_PERCENTUAL_COFINS', 'NFS-e: Percentual COFINS', ',0.00#', TAlignment.taRightJustify)
    .Display('NFSE_PERCENTUAL_CSLL',   'NFS-e: Percentual CSLL',   ',0.00#', TAlignment.taRightJustify)
    .Display('NFSE_PERCENTUAL_ISSQN',  'NFS-e: Percentual ISSQN',  ',0.00#', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );
end;

procedure TfrmGeConfiguracaoEmpresa.DtSrcTabelaStateChange(
  Sender: TObject);
begin
  inherited;
  dbEmpresa.ReadOnly := (DtSrcTabela.DataSet.State = dsEdit);
end;

procedure TfrmGeConfiguracaoEmpresa.fdQryTabelaEMPRESAGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeConfiguracaoEmpresa.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('EMPRESA').AsString            := gUsuarioLogado.Empresa;
    FieldByName('EMAIL_SMTP_PORTA').AsInteger  := PORTA_SMTP_PADRAO;
    FieldByName('EMAIL_REQUER_AUTENTICACAO').AsInteger := 0;
    FieldByName('EMAIL_CONEXAO_SSL').AsInteger         := 0;

    FieldByName('VENDA_CARREGA_PRODUTO_EAN').AsInteger := 0;

    FieldByName('NFE_EMITIR').AsInteger                := 0;
    FieldByName('NFE_EMITIR_ENTRADA').AsInteger        := 0;
    FieldByName('NFCE_EMITIR').AsInteger               := 0;
    FieldByName('NFSE_EMITIR').AsInteger               := 0;
    FieldByName('NFE_ACEITAR_NOTA_DENEGADA').AsInteger := 1;
    FieldByName('NFE_SOLICITA_DH_SAIDA').AsInteger     := 0;
    FieldByName('NFE_IMPRIMIR_COD_CLIENTE').AsInteger  := 0;
    FieldByName('CLIENTE_PERMITIR_DUPLICAR_CNPJ').AsInteger := 0;
    FieldByName('CUSTO_OPER_CALCULAR').AsInteger            := 0;
    FieldByName('PERMITIR_VENDA_ESTOQUE_INS').AsInteger := 0;
    FieldByName('ESTOQUE_UNICO_EMPRESAS').AsInteger     := 0;
    FieldByName('ESTOQUE_SATELITE_CLIENTE').AsInteger   := 0;
    FieldByName('AUTORIZA_INFORMA_CLIENTE').AsInteger   := 0;

    FieldByName('RPS_SERIE').AsString                := '99';
    FieldByName('RPS_NUMERO').AsCurrency             := 0;
    FieldByName('NFSE_SERIE').AsString               := '99';
    FieldByName('NFSE_NUMERO').AsCurrency            := 0;
    FieldByName('NFSE_PERCENTUAL_PIS').AsCurrency    := 0.0;
    FieldByName('NFSE_PERCENTUAL_COFINS').AsCurrency := 0.0;
    FieldByName('NFSE_PERCENTUAL_CSLL').AsCurrency   := 0.0;
    FieldByName('NFSE_PERCENTUAL_ISSQN').AsCurrency  := 0.0;

    FieldByName('VENDA_FORMA_PAGTO_CARTACREDITO').Clear;

    FieldByName('NFE_SERIE').Clear;
    FieldByName('NFE_NUMERO').Clear;
    FieldByName('NFE_LOTE').Clear;
    FieldByName('NFE_CARTA_CORRECAO').Clear;

    FieldByName('NFCE_SERIE').Clear;
    FieldByName('NFCE_NUMERO').Clear;
    FieldByName('NFCE_TOKEN_ID').Clear;
    FieldByName('NFCE_TOKEN').Clear;
  end;
end;

procedure TfrmGeConfiguracaoEmpresa.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State = dsInsert ) then
      if ( GetConfiguracaoCadastrada(FieldByName('EMPRESA').AsString) ) then
      begin
        ShowStop('Empresa selecionada já possui registtro de configuração');
        Exit;
      end;

    if FieldByName('CUSTO_OPER_CALCULAR').IsNull then
      FieldByName('CUSTO_OPER_CALCULAR').AsInteger := 0; //Ord(False);

    if FieldByName('PERMITIR_VENDA_ESTOQUE_INS').IsNull then
      FieldByName('PERMITIR_VENDA_ESTOQUE_INS').AsInteger := 0; //Ord(False);

    if FieldByName('ESTOQUE_UNICO_EMPRESAS').IsNull then
      FieldByName('ESTOQUE_UNICO_EMPRESAS').AsInteger := 0; //Ord(False);

    if FieldByName('ESTOQUE_SATELITE_CLIENTE').IsNull then
      FieldByName('ESTOQUE_SATELITE_CLIENTE').AsInteger := 0; //Ord(False);

    FieldByName('NFE_SERIE').Required  := (FieldByName('NFE_EMITIR').AsInteger = 1);
    FieldByName('NFE_NUMERO').Required := (FieldByName('NFE_EMITIR').AsInteger = 1);
    FieldByName('NFE_LOTE').Required           := (FieldByName('NFE_EMITIR').AsInteger = 1);
    FieldByName('NFE_CARTA_CORRECAO').Required := (FieldByName('NFE_EMITIR').AsInteger = 1);

    FieldByName('NFCE_SERIE').Required    := (FieldByName('NFCE_EMITIR').AsInteger = 1);
    FieldByName('NFCE_NUMERO').Required   := (FieldByName('NFCE_EMITIR').AsInteger = 1);
    FieldByName('NFCE_TOKEN_ID').Required := (FieldByName('NFCE_EMITIR').AsInteger = 1);
    FieldByName('NFCE_TOKEN').Required    := (FieldByName('NFCE_EMITIR').AsInteger = 1);

    FieldByName('NFCE_SERIE').Required  := (FieldByName('NFCE_EMITIR').AsInteger = 1);
    FieldByName('NFCE_NUMERO').Required := (FieldByName('NFCE_EMITIR').AsInteger = 1);

    FieldByName('RPS_SERIE').Required   := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('RPS_NUMERO').Required  := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('NFSE_SERIE').Required  := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('NFSE_NUMERO').Required := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('NFSE_PERCENTUAL_PIS').Required    := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('NFSE_PERCENTUAL_COFINS').Required := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('NFSE_PERCENTUAL_CSLL').Required   := (FieldByName('NFSE_EMITIR').AsInteger = 1);
    FieldByName('NFSE_PERCENTUAL_ISSQN').Required  := (FieldByName('NFSE_EMITIR').AsInteger = 1);

    inherited;
    if not btbtnSalvar.Enabled then
      Aplicar_ModeloEstoque;
  end;
end;

procedure TfrmGeConfiguracaoEmpresa.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  aImage : Byte;
begin
  inherited;
  if (dbgDados = Sender) then
  begin

    if (AnsiUpperCase(Column.Field.FieldName) = 'NFE_EMITIR') then
    begin
      aImage := Column.Field.AsInteger;
      dbgDados.Canvas.FillRect(Rect);
      imgGrid.Draw(dbgDados.Canvas, Rect.Left + 10, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'NFCE_EMITIR') then
    begin
      aImage := Column.Field.AsInteger;
      dbgDados.Canvas.FillRect(Rect);
      imgGrid.Draw(dbgDados.Canvas, Rect.Left + 10, Rect.Top + 1, aImage);
    end
    else
    if (AnsiUpperCase(Column.Field.FieldName) = 'NFSE_EMITIR') then
    begin
      aImage := Column.Field.AsInteger;
      dbgDados.Canvas.FillRect(Rect);
      imgGrid.Draw(dbgDados.Canvas, Rect.Left + 10, Rect.Top + 1, aImage);
    end;

  end;
end;

function TfrmGeConfiguracaoEmpresa.GetConfiguracaoCadastrada(
  sEmpresa: String): Boolean;
begin
  with fdQryConfiguracoes do
  begin
    Close;
    ParamByName('empresa').AsString := sEmpresa;
    open;

    Result := (not IsEmpty);
  end;
end;

procedure TfrmGeConfiguracaoEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    if (not btbtnAlterar.Enabled) then
    begin
      if FieldByName('CUSTO_OPER_CALCULAR').IsNull then
        FieldByName('CUSTO_OPER_CALCULAR').AsInteger := 0; //Ord(False);

      if FieldByName('PERMITIR_VENDA_ESTOQUE_INS').IsNull then
        FieldByName('PERMITIR_VENDA_ESTOQUE_INS').AsInteger := 0; //Ord(False);

      if FieldByName('ESTOQUE_UNICO_EMPRESAS').IsNull then
        FieldByName('ESTOQUE_UNICO_EMPRESAS').AsInteger := 0; //Ord(False);

      if FieldByName('ESTOQUE_SATELITE_CLIENTE').IsNull then
        FieldByName('ESTOQUE_SATELITE_CLIENTE').AsInteger := 0; //Ord(False);
    end;
end;

procedure TfrmGeConfiguracaoEmpresa.Aplicar_ModeloEstoque;
begin
(*
  IMR - 23/07/2014 :
    Rotina descontinuada por entender que outras empresas podem são ser habilitadas para ver o estoque desta empresa,
    mas esta empresa está habilitada para visualizar o estoque de todas.
*)
end;

initialization
  FormFunction.RegisterForm('frmGeConfiguracaoEmpresa', TfrmGeConfiguracaoEmpresa);

end.
