unit UGeConfiguracaoEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, IBQuery;

type
  TfrmGeConfiguracaoEmpresa = class(TfrmGrPadraoCadastro)
    IbDtstTabelaEMPRESA: TIBStringField;
    IbDtstTabelaEMAIL_CONTA: TIBStringField;
    IbDtstTabelaEMAIL_SENHA: TIBStringField;
    IbDtstTabelaEMAIL_POP: TIBStringField;
    IbDtstTabelaEMAIL_SMTP: TIBStringField;
    IbDtstTabelaEMAIL_ASSUNTO_PADRAO: TIBStringField;
    IbDtstTabelaEMAIL_MENSAGEM_PADRAO: TIBStringField;
    IbDtstTabelaRZSOC: TIBStringField;
    IbDtstTabelaNMFANT: TIBStringField;
    tblEmpresa: TIBTable;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    IbDtstTabelaEMAIL_SMTP_PORTA: TIntegerField;
    IbDtstTabelaEMAIL_REQUER_AUTENTICACAO: TSmallintField;
    IbDtstTabelaEMAIL_CONEXAO_SSL: TSmallintField;
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
    qryConfiguracoes: TIBQuery;
    IbDtstTabelaNFE_SOLICITA_DH_SAIDA: TSmallintField;
    TbsNFe: TTabSheet;
    chkNFE_SolicitaDHSaida: TDBCheckBox;
    IbDtstTabelaNFE_IMPRIMIR_COD_CLIENTE: TSmallintField;
    chkImprimirCodCliente: TDBCheckBox;
    IbDtstTabelaCUSTO_OPER_CALCULAR: TSmallintField;
    TabSheet1: TTabSheet;
    dbCustoOperacional: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS: TSmallintField;
    IbDtstTabelaUSUARIO: TIBStringField;
    dbEstoqueUnico: TDBCheckBox;
    IbDtstTabelaESTOQUE_UNICO_EMPRESAS: TSmallintField;
    IbDtstTabelaESTOQUE_SATELITE_CLIENTE: TSmallintField;
    DBCheckBox2: TDBCheckBox;
    IbDtstTabelaCLIENTE_PERMITIR_DUPLICAR_CNPJ: TSmallintField;
    DBCheckBox3: TDBCheckBox;
    IbDtstTabelaAUTORIZA_INFORMA_CLIENTE: TSmallintField;
    dbAutorizacaoInformaCliente: TDBCheckBox;
    chkNFE_Emitir: TDBCheckBox;
    IbDtstTabelaNFE_EMITIR: TSmallintField;
    chkNFE_SalvarNotaDenegada: TDBCheckBox;
    IbDtstTabelaNFE_ACEITAR_NOTA_DENEGADA: TSmallintField;
    IbDtstTabelaNFCE_TOKEN_ID: TIBStringField;
    IbDtstTabelaNFCE_TOKEN: TIBStringField;
    grpBxToken: TGroupBox;
    lblTokenId: TLabel;
    edTokenId: TDBEdit;
    lblToken: TLabel;
    edToken: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure IbDtstTabelaEMPRESAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Aplicar_ModeloEstoque;

    function GetConfiguracaoCadastrada(sEmpresa : String) : Boolean;
  public
    { Public declarations }
  end;

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

  tblEmpresa.Open;

  pgcConfigurar.ActivePage := tbsContaEmail;

  dbAutorizacaoInformaCliente.Visible := (GetSegmentoID(GetEmpresaIDDefault) in [SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_GERAL_ID]);
end;

procedure TfrmGeConfiguracaoEmpresa.DtSrcTabelaStateChange(
  Sender: TObject);
begin
  inherited;
  dbEmpresa.ReadOnly := (IbDtstTabela.State = dsEdit);
end;

procedure TfrmGeConfiguracaoEmpresa.IbDtstTabelaEMPRESAGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if ( Sender.IsNull ) then
    Exit;

  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString)
  else
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString);
end;

procedure TfrmGeConfiguracaoEmpresa.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabela.State = dsInsert ) then
    if ( GetConfiguracaoCadastrada(IbDtstTabelaEMPRESA.AsString) ) then
    begin
      ShowStop('Empresa selecionada já possui registtro de configuração');
      Exit;
    end;

  if IbDtstTabelaCUSTO_OPER_CALCULAR.IsNull then
    IbDtstTabelaCUSTO_OPER_CALCULAR.AsInteger := 0; //Ord(False);

  if IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS.IsNull then
    IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS.AsInteger := 0; //Ord(False);

  if IbDtstTabelaESTOQUE_UNICO_EMPRESAS.IsNull then
    IbDtstTabelaESTOQUE_UNICO_EMPRESAS.AsInteger := 0; //Ord(False);

  if IbDtstTabelaESTOQUE_SATELITE_CLIENTE.IsNull then
    IbDtstTabelaESTOQUE_SATELITE_CLIENTE.AsInteger := 0; //Ord(False);

  inherited;

  if not btbtnSalvar.Enabled then
    Aplicar_ModeloEstoque;
end;

function TfrmGeConfiguracaoEmpresa.GetConfiguracaoCadastrada(
  sEmpresa: String): Boolean;
begin
  with qryConfiguracoes do
  begin
    Close;
    ParamByName('empresa').AsString := sEmpresa;
    open;

    Result := (not IsEmpty);
  end;
end;

procedure TfrmGeConfiguracaoEmpresa.IbDtstTabelaNewRecord(
  DataSet: TDataSet);
begin
  IbDtstTabelaEMPRESA.AsString            := GetEmpresaIDDefault;
  IbDtstTabelaEMAIL_SMTP_PORTA.AsInteger  := PORTA_SMTP_PADRAO;
  IbDtstTabelaEMAIL_REQUER_AUTENTICACAO.AsInteger := 0;
  IbDtstTabelaEMAIL_CONEXAO_SSL.AsInteger         := 0;

  IbDtstTabelaNFE_ACEITAR_NOTA_DENEGADA.AsInteger := 1;
  IbDtstTabelaNFE_SOLICITA_DH_SAIDA.AsInteger     := 0;
  IbDtstTabelaNFE_IMPRIMIR_COD_CLIENTE.AsInteger  := 0;
  IbDtstTabelaCLIENTE_PERMITIR_DUPLICAR_CNPJ.AsInteger := 0;
  IbDtstTabelaCUSTO_OPER_CALCULAR.AsInteger            := 0;
  IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS.AsInteger := 0;
  IbDtstTabelaESTOQUE_UNICO_EMPRESAS.AsInteger     := 0;
  IbDtstTabelaESTOQUE_SATELITE_CLIENTE.AsInteger   := 0;
  IbDtstTabelaAUTORIZA_INFORMA_CLIENTE.AsInteger   := 0;

  IbDtstTabelaNFCE_TOKEN_ID.Clear;
  IbDtstTabelaNFCE_TOKEN.Clear;
end;

procedure TfrmGeConfiguracaoEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if (not btbtnAlterar.Enabled) then
  begin
    if IbDtstTabelaCUSTO_OPER_CALCULAR.IsNull then
      IbDtstTabelaCUSTO_OPER_CALCULAR.AsInteger := 0; //Ord(False);

    if IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS.IsNull then
      IbDtstTabelaPERMITIR_VENDA_ESTOQUE_INS.AsInteger := 0; //Ord(False);

    if IbDtstTabelaESTOQUE_UNICO_EMPRESAS.IsNull then
      IbDtstTabelaESTOQUE_UNICO_EMPRESAS.AsInteger := 0; //Ord(False);

    if IbDtstTabelaESTOQUE_SATELITE_CLIENTE.IsNull then
      IbDtstTabelaESTOQUE_SATELITE_CLIENTE.AsInteger := 0; //Ord(False);
  end;
end;

procedure TfrmGeConfiguracaoEmpresa.Aplicar_ModeloEstoque;
begin
(*
  IMR - 23/07/2014 :
    Rotina descontinuada por entender que outras empresas podem são ser habilitadas para ver o estoque desta empresa,
    mas esta empresa está habilitada para visualizar o estoque de todas.

  with DMBusiness, qryBusca do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update TBCONFIGURACAO Set estoque_unico_empresas = ' + IbDtstTabelaESTOQUE_UNICO_EMPRESAS.AsString);
    SQL.Add('where empresa <> ' + QuotedStr(IbDtstTabelaEMPRESA.AsString));
    ExecSQL;

    CommitTransaction;
  end;
*)
end;

initialization
  FormFunction.RegisterForm('frmGeConfiguracaoEmpresa', TfrmGeConfiguracaoEmpresa);

end.
