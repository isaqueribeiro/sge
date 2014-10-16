unit UGeBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, RxDBComb;

type
  TfrmGeBancos = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAgencia: TLabel;
    dbAgencia: TDBEdit;
    lblConta: TLabel;
    dbConta: TDBEdit;
    lblContrato: TLabel;
    dbContrato: TDBEdit;
    lblCarteira: TLabel;
    dbCarteira: TDBEdit;
    GrpBxDiretorios: TGroupBox;
    lblRemessa: TLabel;
    lblRetorno: TLabel;
    dbRemessa: TDBEdit;
    dbRetorno: TDBEdit;
    Bevel9: TBevel;
    GrpBxConfigCobreBemX: TGroupBox;
    lblConfiguracao1: TLabel;
    lblConfiguracao2: TLabel;
    lblNossoNumeroI: TLabel;
    lblNossoNumeroF: TLabel;
    lblNossoNumeroP: TLabel;
    lblProximaRemessa: TLabel;
    dbConfiguracao1: TDBEdit;
    dbConfiguracao2: TDBEdit;
    dbNossoNumeroI: TDBEdit;
    dbNossoNumeroF: TDBEdit;
    dbNossoNumeroP: TDBEdit;
    dbProximaRemessa: TDBEdit;
    IbDtstTabelaBCO_COD: TSmallintField;
    IbDtstTabelaBCO_CARTEIRA: TIBStringField;
    IbDtstTabelaBCO_NOME: TIBStringField;
    IbDtstTabelaBCO_CHAVE: TIBStringField;
    IbDtstTabelaBCO_AGENCIA: TIBStringField;
    IbDtstTabelaBCO_CC: TIBStringField;
    IbDtstTabelaBCO_NOSSO_NUM_INICIO: TIBStringField;
    IbDtstTabelaBCO_NOSSO_NUM_FINAL: TIBStringField;
    IbDtstTabelaBCO_NOSSO_NUM_PROXIMO: TIBStringField;
    IbDtstTabelaBCO_CONFG_1: TIBStringField;
    IbDtstTabelaBCO_CONFG_2: TIBStringField;
    IbDtstTabelaBCO_DIRETORIO_REMESSA: TIBStringField;
    IbDtstTabelaBCO_DIRETORIO_RETORNO: TIBStringField;
    IbDtstTabelaBCO_SEQUENCIAL_REM: TIntegerField;
    IbDtstTabelaBCO_GERAR_BOLETO: TSmallintField;
    IbDtstTabelaEMPRESA: TIBStringField;
    dbGerarBoleto: TDBCheckBox;
    dtsEmpresa: TDataSource;
    tblEmpresa: TIBTable;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCodigoCedente: TLabel;
    dbCodigoCedente: TDBEdit;
    IbDtstTabelaBCO_CODIGO_CEDENTE: TIBStringField;
    imgAjuda: TImage;
    GrpBxDadosEmissao: TGroupBox;
    lblProtesto: TLabel;
    dbProtesto: TDBEdit;
    bvl1: TBevel;
    lblProtestoD: TLabel;
    lblJuros: TLabel;
    dbJuros: TDBEdit;
    Label2: TLabel;
    lblMora: TLabel;
    dbMora: TDBEdit;
    Label4: TLabel;
    lblInstrucao: TLabel;
    dbInstrucao: TDBEdit;
    IbDtstTabelaBCO_PERCENTUAL_JUROS: TIBBCDField;
    IbDtstTabelaBCO_PERCENTUAL_MORA: TIBBCDField;
    IbDtstTabelaBCO_DIA_PROTESTO: TSmallintField;
    IbDtstTabelaBCO_MSG_INSTRUCAO: TIBStringField;
    lblLayoutRemessa: TLabel;
    IbDtstTabelaBCO_LAYOUT_REMESSA: TSmallintField;
    IbDtstTabelaBCO_LAYOUT_RETORNO: TSmallintField;
    tblLayout: TIBTable;
    dtsLayout: TDataSource;
    dbLayoutRemessa: TDBLookupComboBox;
    lblLayoutRetorno: TLabel;
    dbLayoutRetorno: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure imgAjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeBancos: TfrmGeBancos;

  procedure MostrarTabelaBancos(const AOwner : TComponent);
  function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome, Agencia, Conta, Empresa : String) : Boolean; overload;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaBancos(const AOwner : TComponent);
var
  frm : TfrmGeBancos;
begin
  frm := TfrmGeBancos.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeBancos;
begin
  frm := TfrmGeBancos.Create(AOwner);
  try
    // frm.WhereAdditional := '(b.Empresa = ' + QuotedStr(GetEmpresaIDDefault) + ')';
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome, Agencia, Conta, Empresa : String) : Boolean; overload;
var
  frm : TfrmGeBancos;
begin
  frm := TfrmGeBancos.Create(AOwner);
  try
    // frm.WhereAdditional := '(b.Empresa = ' + QuotedStr(GetEmpresaIDDefault) + ')';
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
    begin
      Agencia := frm.IbDtstTabelaBCO_AGENCIA.AsString;
      Conta   := frm.IbDtstTabelaBCO_CC.AsString;
      Empresa := frm.IbDtstTabelaEMPRESA.AsString;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeBancos.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_BANCO_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  CampoCodigo    := 'bco_cod';
  CampoDescricao := 'bco_nome';

  tblEmpresa.Open;
  tblLayout.Open;
end;

procedure TfrmGeBancos.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaEMPRESA.AsString            := GetEmpresaIDDefault;
  IbDtstTabelaBCO_GERAR_BOLETO.Value      := 0;
  IbDtstTabelaBCO_NOSSO_NUM_INICIO.Value  := FormatFloat('0000000', 1);
  IbDtstTabelaBCO_NOSSO_NUM_FINAL.Value   := FormatFloat('0000000', 999999);
  IbDtstTabelaBCO_NOSSO_NUM_PROXIMO.Value := FormatFloat('0000000', 1);
  IbDtstTabelaBCO_SEQUENCIAL_REM.Value    := 1;
  IbDtstTabelaBCO_CODIGO_CEDENTE.Clear;

  IbDtstTabelaBCO_PERCENTUAL_JUROS.AsCurrency := 0.0;
  IbDtstTabelaBCO_PERCENTUAL_MORA.AsCurrency  := 0.0;
  IbDtstTabelaBCO_DIA_PROTESTO.AsInteger      := 0;
  IbDtstTabelaBCO_MSG_INSTRUCAO.AsString      := 'Não receber pagamento após o vencimento.';
end;

procedure TfrmGeBancos.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  try
    // Normalizando diretório de remessa

    IbDtstTabelaBCO_DIRETORIO_REMESSA.Value := Trim(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString);

    if ( IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString = EmptyStr ) then
      IbDtstTabelaBCO_DIRETORIO_REMESSA.Value := 'C:\Remessa\';

    if ( Copy(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString, Length(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString), 1) <> '\' ) then
      IbDtstTabelaBCO_DIRETORIO_REMESSA.Value := IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString + '\';

    ForceDirectories(IbDtstTabelaBCO_DIRETORIO_REMESSA.AsString);

    // Normalizando diretório de retorno

    IbDtstTabelaBCO_DIRETORIO_RETORNO.Value := Trim(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString);

    if ( IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString = EmptyStr ) then
      IbDtstTabelaBCO_DIRETORIO_RETORNO.Value := 'C:\Retorno\';

    if ( Copy(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString, Length(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString), 1) <> '\' ) then
      IbDtstTabelaBCO_DIRETORIO_RETORNO.Value := IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString + '\';

    ForceDirectories(IbDtstTabelaBCO_DIRETORIO_RETORNO.AsString);
    
    inherited;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar salvar configurações de diretórios de arquivos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Abort;
    end;
  end;
end;

procedure TfrmGeBancos.imgAjudaClick(Sender: TObject);
var
  sMsg : String;
begin
  sMsg := 'Informações importantes para a geração de boletos.' + #13 +
    '---' + #13#13 + 
    '1. Para alguns bancos o "Código da Empresa" informado por eles é o mesmo "Código do Cedente" solicitado pela aplicação.' + #13 +
    '2. O código da Agência deve ser informada com o dígito. Ex: 1232-1' + #13 +
    '3. A Conta Corrente (C/C) deverá ser infrmanda funatmente com o seu dígito. Ex: 06598-7' + #13 +
    '4. Para determinados bancos o Código do Cedente é o mesmo número de Conta Corrente.';

  ShowInformation(Self.Caption, sMsg);
end;

initialization
  FormFunction.RegisterForm('frmGeBancos', TfrmGeBancos);

end.
