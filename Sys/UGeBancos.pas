unit UGeBancos;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

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
    dbGerarBoleto: TDBCheckBox;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    lblCodigoCedente: TLabel;
    dbCodigoCedente: TDBEdit;
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
    lblLayoutRemessa: TLabel;
    dtsLayout: TDataSource;
    dbLayoutRemessa: TDBLookupComboBox;
    lblLayoutRetorno: TLabel;
    dbLayoutRetorno: TDBLookupComboBox;
    dbInstrucao: TDBComboBox;
    fdQryEmpresa: TFDQuery;
    fdQryLayout: TFDQuery;
    fdQryTabelaBCO_CODIGO: TSmallintField;
    fdQryTabelaBCO_COD: TSmallintField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaBCO_CARTEIRA: TStringField;
    fdQryTabelaBCO_NOME: TStringField;
    fdQryTabelaBCO_AGENCIA: TStringField;
    fdQryTabelaBCO_CC: TStringField;
    fdQryTabelaBCO_CODIGO_CEDENTE: TStringField;
    fdQryTabelaBCO_CHAVE: TStringField;
    fdQryTabelaBCO_GERAR_BOLETO: TSmallintField;
    fdQryTabelaBCO_NOSSO_NUM_INICIO: TStringField;
    fdQryTabelaBCO_NOSSO_NUM_FINAL: TStringField;
    fdQryTabelaBCO_NOSSO_NUM_PROXIMO: TStringField;
    fdQryTabelaBCO_CONFG_1: TStringField;
    fdQryTabelaBCO_CONFG_2: TStringField;
    fdQryTabelaBCO_DIRETORIO_REMESSA: TStringField;
    fdQryTabelaBCO_DIRETORIO_RETORNO: TStringField;
    fdQryTabelaBCO_SEQUENCIAL_REM: TIntegerField;
    fdQryTabelaBCO_PERCENTUAL_JUROS: TBCDField;
    fdQryTabelaBCO_PERCENTUAL_MORA: TBCDField;
    fdQryTabelaBCO_DIA_PROTESTO: TSmallintField;
    fdQryTabelaBCO_MSG_INSTRUCAO: TStringField;
    fdQryTabelaBCO_LAYOUT_REMESSA: TSmallintField;
    fdQryTabelaBCO_LAYOUT_RETORNO: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure imgAjudaClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBBANCO_BOLETO

  Views:
  - VW_EMPRESA
  - VW_LAYOUT_REM_RET_BANCO

  Procedures:

*)

var
  frmGeBancos: TfrmGeBancos;

  procedure MostrarTabelaBancos(const AOwner : TComponent);
  function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarBanco(const AOwner : TComponent;
    var CodigoUnico, Codigo : Integer; var Nome, Agencia, Conta, Empresa : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UConstantesDGE;

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
    // frm.WhereAdditional := '(b.Empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ')';
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarBanco(const AOwner : TComponent;
  var CodigoUnico, Codigo : Integer; var Nome, Agencia, Conta, Empresa : String) : Boolean; overload;
var
  frm : TfrmGeBancos;
begin
  frm := TfrmGeBancos.Create(AOwner);
  try
    // frm.WhereAdditional := '(b.Empresa = ' + QuotedStr(gUsuarioLogado.Empresa) + ')';
    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
      with frm.DtSrcTabela.DataSet do
      begin
        CodigoUnico := FieldByName('BCO_CODIGO').AsInteger;
        Agencia     := FieldByName('BCO_AGENCIA').AsString;
        Conta       := FieldByName('BCO_CC').AsString;
        Empresa     := FieldByName('EMPRESA').AsString;
      end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeBancos.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    '(b.empresa in ( ' +
    '  Select      ' +
    '    e.cnpj    ' +
    '  from VW_EMPRESA e ' +
    '))';

  inherited;
end;

procedure TfrmGeBancos.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( (Field = FieldByName('BCO_PERCENTUAL_JUROS')) or (Field = FieldByName('BCO_PERCENTUAL_MORA')) ) then
        if ( (FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency + FieldByName('BCO_PERCENTUAL_MORA').AsCurrency) = 0.0 ) then
          FieldByName('BCO_MSG_INSTRUCAO').AsString := dbInstrucao.Items.Strings[0]
        else
          FieldByName('BCO_MSG_INSTRUCAO').AsString := dbInstrucao.Items.Strings[1];
  end;
end;

procedure TfrmGeBancos.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  try
    // Normalizando diretório de remessa
    with DtSrcTabela.DataSet do
    begin
      FieldByName('BCO_DIRETORIO_REMESSA').AsString := Trim(FieldByName('BCO_DIRETORIO_REMESSA').AsString);

      if ( FieldByName('BCO_DIRETORIO_REMESSA').AsString = EmptyStr ) then
        FieldByName('BCO_DIRETORIO_REMESSA').AsString := 'C:\Banco\Remessa\';

      if ( Copy(FieldByName('BCO_DIRETORIO_REMESSA').AsString, Length(FieldByName('BCO_DIRETORIO_REMESSA').AsString), 1) <> '\' ) then
        FieldByName('BCO_DIRETORIO_REMESSA').AsString := FieldByName('BCO_DIRETORIO_REMESSA').AsString + '\';

      ForceDirectories(FieldByName('BCO_DIRETORIO_REMESSA').AsString);

      // Normalizando diretório de retorno

      FieldByName('BCO_DIRETORIO_RETORNO').AsString := Trim(FieldByName('BCO_DIRETORIO_RETORNO').AsString);

      if ( FieldByName('BCO_DIRETORIO_RETORNO').AsString = EmptyStr ) then
        FieldByName('BCO_DIRETORIO_RETORNO').AsString := 'C:\Banco\Retorno\';

      if ( Copy(FieldByName('BCO_DIRETORIO_RETORNO').AsString, Length(FieldByName('BCO_DIRETORIO_RETORNO').AsString), 1) <> '\' ) then
        FieldByName('BCO_DIRETORIO_RETORNO').AsString := FieldByName('BCO_DIRETORIO_RETORNO').AsString + '\';

      ForceDirectories(FieldByName('BCO_DIRETORIO_RETORNO').AsString);
    end;

    inherited;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar salvar configurações de diretórios de arquivos.' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Abort;
    end;
  end;
end;

procedure TfrmGeBancos.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('BCO_CODIGO').AsInteger           := GetNextID(NomeTabela, 'BCO_CODIGO'); // Código interno de controle
    FieldByName('EMPRESA').AsString               := gUsuarioLogado.Empresa;
    FieldByName('BCO_GERAR_BOLETO').AsInteger     := 0;
    FieldByName('BCO_NOSSO_NUM_INICIO').AsString  := FormatFloat('0000000', 1);
    FieldByName('BCO_NOSSO_NUM_FINAL').AsString   := FormatFloat('0000000', 999999);
    FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString := FormatFloat('0000000', 1);
    FieldByName('BCO_SEQUENCIAL_REM').AsInteger    := 1;
    FieldByName('BCO_CODIGO_CEDENTE').Clear;

    FieldByName('BCO_LAYOUT_REMESSA').AsInteger    := 400; // cnab400
    FieldByName('BCO_LAYOUT_RETORNO').AsInteger    := 400; // cnab400
    FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency := 0.0;
    FieldByName('BCO_PERCENTUAL_MORA').AsCurrency  := 0.0;
    FieldByName('BCO_DIA_PROTESTO').AsInteger      := 0;
    FieldByName('BCO_MSG_INSTRUCAO').AsString      := 'Não receber pagamento após o vencimento.';
  end;
end;

procedure TfrmGeBancos.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_BANCO_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBBANCO_BOLETO';
  CampoCodigo    := 'b.bco_cod';
  CampoDescricao := 'b.bco_nome';
  CampoOrdenacao := 'b.bco_nome';

  CarregarLista(fdQryEmpresa);
  CarregarLista(fdQryLayout);
end;

procedure TfrmGeBancos.imgAjudaClick(Sender: TObject);
var
  sMsg : String;
begin
  sMsg := 'Informações importantes para a geração de boletos.' + #13 +
    '---' + #13#13 +
    '1. Para alguns bancos o "Código da Empresa" informado por eles é o mesmo "Código do Cedente" solicitado pela aplicação.' + #13 +
    '2. O código da Agência deve ser informada com o dígito. Ex: 1232-1' + #13 +
    '3. A Conta Corrente (C/C) deverá ser informanda fundamentalmente com o seu dígito. Ex: 06598-7' + #13 +
    '4. Para determinados bancos o Código do Cedente é o mesmo número de Conta Corrente.';

  ShowInformation(Self.Caption, sMsg);
end;

initialization
  FormFunction.RegisterForm('frmGeBancos', TfrmGeBancos);

end.
