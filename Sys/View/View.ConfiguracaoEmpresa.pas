unit View.ConfiguracaoEmpresa;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,

  Data.DB,
  Datasnap.DBClient,

  JvExMask,
  JvToolEdit,
  JvDBControls,
  JvMaskEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  View.PadraoCadastro,
  SGE.Controller.Interfaces;

type
  TViewConfiguracaoEmpresa = class(TViewPadraoCadastro)
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
    lblFormaPagtoCartaCredito: TLabel;
    dbFormaPagtoCartaCredito: TDBLookupComboBox;
    DtsFormaPagto: TDataSource;
    dbPermitirVendaSemEstoque: TDBCheckBox;
    dbCarregarProdutoPeloEAN: TDBCheckBox;
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
    lblContador: TLabel;
    dbContador: TJvDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaEMPRESAGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure dbContadorButtonClick(Sender: TObject);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView,
    FControllerFormaPagto : IControllerCustom;
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

uses
  UConstantesDGE,
  UDMBusiness,
  UDMRecursos,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Fornecedor;

{$R *.dfm}

procedure TViewConfiguracaoEmpresa.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.ConfiguracaoEmpresa;
  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerFormaPagto  := TControllerFactory.New.FormaPagto;

  inherited;
  ControlFirstEdit := dbEmpresa;

  DisplayFormatCodigo := EmptyStr;

  NomeTabela      := 'TBCONFIGURACAO';
  CampoCodigo     := 'EMPRESA';
  CampoDescricao  := 'e.RZSOC';

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
    .Display('EMPRESA', 'Empresa', True)
    .Display('NFSE_PERCENTUAL_PIS',    'NFS-e: Percentual PIS',    ',0.00#', TAlignment.taRightJustify, True)
    .Display('NFSE_PERCENTUAL_COFINS', 'NFS-e: Percentual COFINS', ',0.00#', TAlignment.taRightJustify, True)
    .Display('NFSE_PERCENTUAL_CSLL',   'NFS-e: Percentual CSLL',   ',0.00#', TAlignment.taRightJustify, True)
    .Display('NFSE_PERCENTUAL_ISSQN',  'NFS-e: Percentual ISSQN',  ',0.00#', TAlignment.taRightJustify, True);

  AbrirTabelaAuto := True;
  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');
  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagtoCartaCredito, DtsFormaPagto, 'venda_forma_pagto_cartacredito', 'codigo', 'codigo_descricao');
end;

procedure TViewConfiguracaoEmpresa.DtSrcTabelaStateChange(
  Sender: TObject);
begin
  inherited;
  dbEmpresa.ReadOnly := (DtSrcTabela.DataSet.State = dsEdit);
end;

procedure TViewConfiguracaoEmpresa.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (FieldByName('CONTADOR_CODIGO').AsInteger = 0) then
      FieldByName('CONTADOR_CODIGO').Clear;

    if (Trim(FieldByName('CONTADOR_CNPJCPF').AsString) = EmptyStr) then
      FieldByName('CONTADOR_CNPJCPF').Clear;

    if (Trim(FieldByName('CONTADOR_NOME').AsString) = EmptyStr) then
      FieldByName('CONTADOR_NOME').Clear;
  end;
end;

procedure TViewConfiguracaoEmpresa.fdQryTabelaEMPRESAGetText(Sender: TField; var Text: string;
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

procedure TViewConfiguracaoEmpresa.fdQryTabelaNewRecord(DataSet: TDataSet);
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

    FieldByName('CONTADOR_CODIGO').Clear;
    FieldByName('CONTADOR_CNPJCPF').Clear;
    FieldByName('CONTADOR_NOME').Clear;
  end;
end;

procedure TViewConfiguracaoEmpresa.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if not OcorreuErro then
    DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString := gUsuarioLogado.Empresa;
end;

procedure TViewConfiguracaoEmpresa.btbtnSalvarClick(Sender: TObject);
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
      FieldByName('CUSTO_OPER_CALCULAR').AsInteger := 0;

    if FieldByName('PERMITIR_VENDA_ESTOQUE_INS').IsNull then
      FieldByName('PERMITIR_VENDA_ESTOQUE_INS').AsInteger := 0;

    if FieldByName('ESTOQUE_UNICO_EMPRESAS').IsNull then
      FieldByName('ESTOQUE_UNICO_EMPRESAS').AsInteger := 0;

    if FieldByName('ESTOQUE_SATELITE_CLIENTE').IsNull then
      FieldByName('ESTOQUE_SATELITE_CLIENTE').AsInteger := 0;

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
  end;
end;

procedure TViewConfiguracaoEmpresa.dbContadorButtonClick(Sender: TObject);
var
  aFornecedor : TFornecedorRegistro;
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarFornecedor(Self, aFornecedor) ) then
      begin
        FieldByName('CONTADOR_CODIGO').AsInteger := aFornecedor.Codigo;
        FieldByName('CONTADOR_CNPJCPF').AsString := aFornecedor.CNPJ_CPF;
        FieldByName('CONTADOR_NOME').AsString    := aFornecedor.Nome;
      end;
end;

procedure TViewConfiguracaoEmpresa.dbgDadosDrawColumnCell(Sender: TObject;
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

function TViewConfiguracaoEmpresa.GetConfiguracaoCadastrada(
  sEmpresa: String): Boolean;
var
  aConfig : IControllerCustom;
begin
  aConfig := TControllerFactory.New.ConfiguracaoEmpresa;
  aConfig.DAO.ClearWhere;
  aConfig.DAO.Where('(c.empresa = ' + sEmpresa.Trim.QuotedString + ')');
  aConfig.DAO.Open;

  Result := not aConfig.DAO.DataSet.IsEmpty;
end;

procedure TViewConfiguracaoEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    if (not btbtnAlterar.Enabled) then
    begin
      if FieldByName('CUSTO_OPER_CALCULAR').IsNull then
        FieldByName('CUSTO_OPER_CALCULAR').AsInteger := 0;

      if FieldByName('PERMITIR_VENDA_ESTOQUE_INS').IsNull then
        FieldByName('PERMITIR_VENDA_ESTOQUE_INS').AsInteger := 0;

      if FieldByName('ESTOQUE_UNICO_EMPRESAS').IsNull then
        FieldByName('ESTOQUE_UNICO_EMPRESAS').AsInteger := 0;

      if FieldByName('ESTOQUE_SATELITE_CLIENTE').IsNull then
        FieldByName('ESTOQUE_SATELITE_CLIENTE').AsInteger := 0;
    end;
end;

initialization
  FormFunction.RegisterForm('ViewConfiguracaoEmpresa', TViewConfiguracaoEmpresa);

end.
