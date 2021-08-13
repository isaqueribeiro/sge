unit View.Banco;

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
  SGE.Controller.Interfaces,
  UObserverInterface,
  UCliente,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela;

type
  TViewBanco = class(TViewPadraoCadastro)
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
    procedure FormCreate(Sender: TObject);
    procedure imgAjudaClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpresaView,
    FControllerLayoutRemessaBancoView : IControllerCustom;
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
  ViewBanco: TViewBanco;

  procedure MostrarTabelaBancos(const AOwner : TComponent);
  function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarBanco(const AOwner : TComponent;
    var CodigoUnico, Codigo : Integer; var Nome, Agencia, Conta, Empresa : String) : Boolean; overload;

implementation

uses
  System.IOUtils,
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

procedure MostrarTabelaBancos(const AOwner : TComponent);
var
  frm : TViewBanco;
begin
  frm := TViewBanco.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarBanco(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewBanco;
begin
  frm := TViewBanco.Create(AOwner);
  try
    frm.WhereAdditional :=
      '(b.empresa in ( ' +
      '  Select      ' +
      '    e.cnpj    ' +
      '  from VW_EMPRESA e ' +
      '))';

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
  finally
    frm.Destroy;
  end;
end;

function SelecionarBanco(const AOwner : TComponent;
  var CodigoUnico, Codigo : Integer; var Nome, Agencia, Conta, Empresa : String) : Boolean; overload;
var
  frm : TViewBanco;
begin
  frm := TViewBanco.Create(AOwner);
  try
    frm.WhereAdditional :=
      '(b.empresa in ( ' +
      '  Select      ' +
      '    e.cnpj    ' +
      '  from VW_EMPRESA e ' +
      '))';

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
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

procedure TViewBanco.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    with DtSrcTabela.DataSet do
    begin
      FieldByName('BCO_DIRETORIO_REMESSA').AsString := TPath.Combine(TPath.GetDocumentsPath, 'Banco\Remessa\');
      FieldByName('BCO_DIRETORIO_RETORNO').AsString := TPath.Combine(TPath.GetDocumentsPath, 'Banco\Retorno\');
    end;
end;

procedure TViewBanco.btbtnSalvarClick(Sender: TObject);
var
  aBanco : ICOntrollerCustom;
begin
  aBanco := TControllerFactory.New.BancoFebrabanView;
  aBanco.DAO.Open;

  if (not aBanco.DAO.DataSet.Locate('codigo', FormatFloat('000', DtSrcTabela.DataSet.FieldByName('bco_cod').AsInteger), [])) then
  begin
    ShowWarning('', 'O código informado é inválido para a tabela FEBRABAN');
    Abort;
  end;

  with DtSrcTabela.DataSet do
  begin
    if (State in [dsEdit, dsInsert]) then
    begin
      FieldByName('BCO_CODIGO_CEDENTE').Required := (FieldByName('BCO_GERAR_BOLETO').AsInteger = 1);
      FieldByName('BCO_CHAVE').Required          := (FieldByName('BCO_GERAR_BOLETO').AsInteger = 1);
      FieldByName('BCO_CARTEIRA').Required       := (FieldByName('BCO_GERAR_BOLETO').AsInteger = 1);

      FieldByName('BCO_DIRETORIO_REMESSA').AsString := Trim(FieldByName('BCO_DIRETORIO_REMESSA').AsString);
      FieldByName('BCO_DIRETORIO_RETORNO').AsString := Trim(FieldByName('BCO_DIRETORIO_RETORNO').AsString);

      if (FieldByName('BCO_DIRETORIO_REMESSA').AsString = EmptyStr) then
        FieldByName('BCO_DIRETORIO_REMESSA').AsString := TPath.Combine(TPath.GetDocumentsPath, 'Banco\Remessa\');

      if (FieldByName('BCO_DIRETORIO_RETORNO').AsString = EmptyStr) then
        FieldByName('BCO_DIRETORIO_RETORNO').AsString := TPath.Combine(TPath.GetDocumentsPath, 'Banco\Retorno\');

      if (Copy(FieldByName('BCO_DIRETORIO_REMESSA').AsString, Length(FieldByName('BCO_DIRETORIO_REMESSA').AsString), 1) <> '\') then
        FieldByName('BCO_DIRETORIO_REMESSA').AsString := FieldByName('BCO_DIRETORIO_REMESSA').AsString + '\';

      if (Copy(FieldByName('BCO_DIRETORIO_RETORNO').AsString, Length(FieldByName('BCO_DIRETORIO_RETORNO').AsString), 1) <> '\') then
        FieldByName('BCO_DIRETORIO_RETORNO').AsString := FieldByName('BCO_DIRETORIO_RETORNO').AsString + '\';


      ForceDirectories(FieldByName('BCO_DIRETORIO_REMESSA').AsString);
      ForceDirectories(FieldByName('BCO_DIRETORIO_RETORNO').AsString);
    end;
  end;

  inherited;
end;

procedure TViewBanco.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    '(b.empresa in ( ' +
    '  Select      ' +
    '    e.cnpj    ' +
    '  from VW_EMPRESA e ' +
    '))';

  inherited;
end;

procedure TViewBanco.DtSrcTabelaDataChange(Sender: TObject; Field: TField);
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

procedure TViewBanco.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Banco;
  FControllerEmpresaView := TControllerFactory.New.EmpresaView;
  FControllerLayoutRemessaBancoView := TControllerFactory.New.LayoutRemessaBancoView;

  inherited;
  RotinaID         := ROTINA_CAD_BANCO_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBBANCO_BOLETO';
  CampoCodigo    := 'b.bco_cod';
  CampoDescricao := 'b.bco_nome';
  CampoOrdenacao := 'b.bco_nome';

  Tabela
    .Display('bco_cod',     'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('BCO_NOME',    'Nome', True)
    .Display('BCO_AGENCIA', 'Agência', True)
    .Display('BCO_CC',      'C/C', True)
    .Display('BCO_CODIGO_CEDENTE', 'Código do Cedente', False)
    .Display('BCO_CHAVE',    'Convênvio/Contrato', False)
    .Display('BCO_CARTEIRA', 'Carteira', False)
    .Display('BCO_PERCENTUAL_JUROS', '% Multa', ',0.00', TAlignment.taRightJustify, True)
    .Display('BCO_PERCENTUAL_MORA',  '% Mora Mês', ',0.00', TAlignment.taRightJustify, True);


  AbrirTabelaAuto := True;

  TController(FControllerEmpresaView)
    .LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');
  TController(FControllerLayoutRemessaBancoView)
    .LookupComboBox(dbLayoutRemessa, dtsLayout, 'bco_layout_remessa', 'codigo', 'descricao');
  TController(FControllerLayoutRemessaBancoView)
    .LookupComboBox(dbLayoutRemessa, dtsLayout, 'bco_layout_retorno', 'codigo', 'descricao');
end;

procedure TViewBanco.imgAjudaClick(Sender: TObject);
var
  sMsg : String;
begin
  sMsg := 'Informações importantes para a geração de boletos.' + #13 +
    '---' + #13#13 +
    '1. Para alguns bancos o "Código da Empresa" informado por eles é o mesmo "Código do Cedente" solicitado pela aplicação.' + #13#13 +
    '2. O código da Agência deve ser informada com o dígito. Ex: 1232-1' + #13#13 +
    '3. A Conta Corrente (C/C) deverá ser informanda fundamentalmente com o seu dígito. Ex: 06598-7' + #13#13 +
    '4. Para determinados bancos o Código do Cedente é o mesmo número de Conta Corrente.';

  ShowInformation(Self.Caption, sMsg);
end;

initialization
  FormFunction.RegisterForm('ViewBanco', TViewBanco);

end.
