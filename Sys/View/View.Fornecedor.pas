unit View.Fornecedor;

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

  cxControls,
  cxStyles,
  cxEdit,
  cxDBLookupComboBox,
  cxDataControllerConditionalFormattingRulesManagerDialog,
  cxVGrid,
  cxDBVGrid,
  cxInplaceContainer,

  ACBrConsultaCPF,
  ACBrBase,
  ACBrSocket,
  ACBrConsultaCNPJ,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UObserverInterface,
  UCliente,
  UGrPadraoCadastro,
  Interacao.Tabela,
  Controller.Tabela;

type
  TFornecedorRegistro = record
    Codigo   : Integer;
    CNPJ_CPF ,
    Nome     ,
    Fantasia : String;
  end;

  TViewFornecedor = class(TViewPadraoCadastro)
    dbPessoaFisica: TDBCheckBox;
    lblRazao: TLabel;
    dbRazao: TDBEdit;
    lblIE: TLabel;
    dbIE: TDBEdit;
    lblIM: TLabel;
    dbIM: TDBEdit;
    GroupBox1: TGroupBox;
    lblCidade: TLabel;
    Bevel5: TBevel;
    lblEstado: TLabel;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    tbsDuplicatas: TTabSheet;
    lblBairro: TLabel;
    lblLogradouro: TLabel;
    lblCEP: TLabel;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblComplemento: TLabel;
    dbComplemento: TDBEdit;
    lblFone: TLabel;
    dbFone: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblHome: TLabel;
    dbHome: TDBEdit;
    lblPais: TLabel;
    lblContato: TLabel;
    dbContato: TDBEdit;
    dtsGrupo: TDataSource;
    lblGrupo: TLabel;
    dbGrupo: TDBLookupComboBox;
    tbsDadosAdcionais: TTabSheet;
    dbTransportadora: TDBCheckBox;
    tbsConsultarCNPJ: TTabSheet;
    tbsConsultarCPF: TTabSheet;
    pnlConsultarCNPJ: TPanel;
    lblCNPJX: TLabel;
    lblCaptchaX: TLabel;
    edCaptcha: TEdit;
    edCNPJ: TMaskEdit;
    pnlCaptcha: TPanel;
    ImgCaptcha: TImage;
    LabAtualizarCaptcha: TLabel;
    ckRemoverEspacosDuplos: TCheckBox;
    BvlConsultar: TBevel;
    pnlRetornoCNPJ: TPanel;
    lblTipoX: TLabel;
    lblRazaoSocialX: TLabel;
    lblAberturaX: TLabel;
    lblEnderecoX: TLabel;
    lblNumeroX: TLabel;
    lblComplementoX: TLabel;
    lblBairroX: TLabel;
    lblCidadeX: TLabel;
    lblUFX: TLabel;
    lblCEPX: TLabel;
    lblSituacaoX: TLabel;
    lblFantasiaX: TLabel;
    EditTipo: TEdit;
    EditRazaoSocial: TEdit;
    EditAbertura: TEdit;
    EditEndereco: TEdit;
    EditNumero: TEdit;
    EditComplemento: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    EditCEP: TEdit;
    EditSituacao: TEdit;
    EditFantasia: TEdit;
    pnlConsultarCPF: TPanel;
    lblCPFX: TLabel;
    edCPF: TMaskEdit;
    lblCNPJ: TLabel;
    ACBrConsultaCNPJ: TACBrConsultaCNPJ;
    ACBrConsultaCPF: TACBrConsultaCPF;
    dbDataCadastro: TDBEdit;
    lblDataCadastro: TLabel;
    lblFoneCelular: TLabel;
    dbFoneCelular: TDBEdit;
    dbFoneFax: TDBEdit;
    lblFoneFax: TLabel;
    lblNomeFantasia: TLabel;
    dbNomeFantasia: TDBEdit;
    dtsBancoFebraban: TDataSource;
    tbsDadoFinanceiro: TTabSheet;
    tbsObservacao: TTabSheet;
    dbObservacao: TDBMemo;
    lblFaturaMinima: TLabel;
    dbFaturaMinima: TDBEdit;
    btnConsultarCNPJ: TcxButton;
    btnVoltar: TcxButton;
    btnRecuperarCNPJ: TcxButton;
    btnConsultarCPF: TcxButton;
    Label15: TLabel;
    EditCNAE1: TEdit;
    Label16: TLabel;
    ListCNAE2: TListBox;
    dbCNPJ: TJvDBComboEdit;
    dbEstado: TJvDBComboEdit;
    dbCidade: TJvDBComboEdit;
    dbBairro: TJvDBComboEdit;
    dbLogradouro: TJvDBComboEdit;
    dbPais: TJvDBComboEdit;
    dbCadastroAtivo: TDBCheckBox;
    lblRegistroDesativado: TLabel;
    lblDataNasc: TLabel;
    edDataNasc: TMaskEdit;
    dbgContaCorrente: TcxDBVerticalGrid;
    dbCtgrConta1: TcxCategoryRow;
    dbBanco1: TcxDBEditorRow;
    dbAgencia1: TcxDBEditorRow;
    dbContaCorrente1: TcxDBEditorRow;
    dbPracaCobranca1: TcxDBEditorRow;
    dbCtgrConta2: TcxCategoryRow;
    dbBanco2: TcxDBEditorRow;
    dbAgencia2: TcxDBEditorRow;
    dbContaCorrente2: TcxDBEditorRow;
    dbPracaCobranca2: TcxDBEditorRow;
    dbCtgrConta3: TcxCategoryRow;
    dbBanco3: TcxDBEditorRow;
    dbAgencia3: TcxDBEditorRow;
    dbContaCorrente3: TcxDBEditorRow;
    dbPracaCobranca3: TcxDBEditorRow;
    dbCEP: TJvDBMaskEdit;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbCNPJButtonClick(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnRecuperarCNPJClick(Sender: TObject);
    procedure btnConsultarCNPJClick(Sender: TObject);
    procedure btnConsultarCPFClick(Sender: TObject);
    procedure edCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure edCaptchaKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgContaCorrenteEnter(Sender: TObject);
    procedure dbgContaCorrenteExit(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerGrupoFornecedor   ,
    FControllerBancoFebrabanView : IControllerCustom;
  public
    { Public declarations }
    procedure FiltarDados(const iTipoPesquisa: Integer); overload;
  end;

(*
  Tabelas:
  - TBFORNECEDOR
  - TBTIPO_LOGRADOURO
  - TBLOGRADOURO
  - TBBAIRRO
  - TBCIDADE
  - TBESTADO
  - TBPAIS
  - TBFORNECEDOR_GRUPO

  Views:
  - VW_BANCO_FEBRABAN

  Procedures:

*)

var
  ViewFornecedor: TViewFornecedor;

  procedure MostrarTabelaFornecedores(const AOwner : TComponent);

  function SelecionarFornecedor(const AOwner : TComponent; var aFornecedor : TFornecedorRegistro) : Boolean; overload;
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarTransportadora(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;

implementation

uses
  UConstantesDGE,
  UDMBusiness,
  UDMRecursos,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  View.Bairro,
  View.Cidade,
  View.Distrito,
  View.Estado,
  View.Logradouro,
  UGrPadrao;

{$R *.dfm}

procedure MostrarTabelaFornecedores(const AOwner : TComponent);
var
  frm : TViewFornecedor;
begin
  frm := TViewFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := '(f.cliente_origem is null) and (f.fornecedor_funcionario = 0)';
    frm.tbsDuplicatas.TabVisible := False; // Temporário
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFornecedor(const AOwner : TComponent; var aFornecedor : TFornecedorRegistro) : Boolean; overload;
var
  frm : TViewFornecedor;
  aCodigo : Integer;
  aNome   : String;
begin
  frm := TViewFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := EmptyStr;

    Result := frm.SelecionarRegistro(aCodigo, aNome);
    if Result then
    begin
      aFornecedor.Codigo   := aCodigo;
      aFornecedor.Nome     := aNome;
      aFornecedor.Fantasia := frm.DtSrcTabela.DataSet.FieldByName('NOMEFANT').AsString;
      aFornecedor.CNPJ_CPF := StrOnlyNumbers(frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString);
    end;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewFornecedor;
begin
  frm := TViewFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := EmptyStr;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean;
var
  frm : TViewFornecedor;
begin
  frm := TViewFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := EmptyStr;

    Result := frm.SelecionarRegistro(Codigo, Nome);
    if ( Result ) then
      CNPJ := frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTransportadora(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
var
  frm : TViewFornecedor;
begin
  frm := TViewFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := '(f.Transportadora = 1)';

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where( frm.WhereAdditional );
    frm.FController.DAO.OrderBy( frm.CampoDescricao );
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);

    if ( Result ) then
      CNPJ := frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TViewFornecedor.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Fornecedor;
  FControllerGrupoFornecedor   := TControllerFactory.New.GrupoFornecedor;
  FControllerBancoFebrabanView := TControllerFactory.New.BancoFebrabanView;

  inherited;
  RotinaID         := ROTINA_CAD_FORNECEDOR_ID;
  ControlFirstEdit := dbPessoaFisica;

  SetGruposFornecedores;

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBFORNECEDOR';
  CampoCodigo        := 'Codforn';
  CampoDescricao     := 'Nomeforn';
  CampoOrdenacao     := 'Nomeforn';
  CampoCadastroAtivo := 'f.ativo';
  WhereAdditional    := '(f.cliente_origem is null) and (f.fornecedor_funcionario = 0)';

  pgcMaisDados.ActivePageIndex := 0;
  tbsConsultarCNPJ.TabVisible  := False;
  tbsConsultarCPF.TabVisible   := False;

  tbsDuplicatas.TabVisible := False; // Temporário

  Tabela
    .Display('CODFORN', 'Código', '##0000', TAlignment.taCenter)
    .Display('FATURAMENTO_MINIMO', 'Fatura Mínima (R$)', ',0.00', TAlignment.taRightJustify);

  AbrirTabelaAuto := True;

  TController(FControllerGrupoFornecedor).LookupComboBox(dbGrupo, dtsGrupo, 'grf_cod', 'grf_cod', 'grf_descricao');
  TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco1, dtsBancoFebraban, 'banco',   'codigo', 'nome_codigo');
  TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco2, dtsBancoFebraban, 'banco_2', 'codigo', 'codigo_nome');
  TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco3, dtsBancoFebraban, 'banco_3', 'codigo', 'codigo_nome');
end;

procedure TViewFornecedor.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbHome ) then
      pgcMaisDados.ActivePage := tbsDadosAdcionais
    else
    if ( Sender = dbTransportadora ) then
      pgcMaisDados.ActivePage := tbsDadoFinanceiro;
  end;
end;

procedure TViewFornecedor.dbEstadoButtonClick(Sender: TObject);
var
  iEstado : Integer;
  sEstado ,
  sUF     : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
      begin
        FieldByName('EST_COD').AsInteger := iEstado;
        FieldByName('EST_NOME').AsString := sEstado;
        FieldByName('UF').AsString       := sUF;
      end;
  end;
end;

procedure TViewFornecedor.dbgContaCorrenteEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TViewFornecedor.dbgContaCorrenteExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if ( DtSrcTabela.DataSet.State = dsInsert ) then
  begin
    pgcMaisDados.ActivePage := tbsObservacao;
    dbObservacao.SetFocus;
  end;
end;

procedure TViewFornecedor.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('EST_COD').AsInteger = 0 ) then
      begin
        ShowWarning('Favor informar o Estado primeiramente!');
        dbEstado.SetFocus;
      end
      else
      if ( SelecionarCidade(Self, FieldByName('EST_COD').AsInteger, iCidade, sCidade) ) then
      begin
        FieldByName('CID_COD').AsInteger := iCidade;
        FieldByName('CID_NOME').AsString := sCidade;
        FieldByName('CIDADE').AsString   := Copy(sCidade + ' (' + FieldByName('UF').AsString + ')', 1, FieldByName('CIDADE').Size);
        FieldByName('CEP').AsString      := GetCidadeCEP(iCidade);
      end;
  end;
end;

procedure TViewFornecedor.dbBairroButtonClick(Sender: TObject);
var
  iBairro : Integer;
  sBairro : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('CID_COD').AsInteger = 0 ) then
      begin
        ShowWarning('Favor informar a Cidade primeiramente!');
        dbCidade.SetFocus;
      end
      else
      if ( SelecionarBairro(Self, FieldByName('CID_COD').AsInteger, iBairro, sBairro) ) then
      begin
        FieldByName('BAI_COD').AsInteger := iBairro;
        FieldByName('BAI_NOME').AsString := sBairro;
      end;
  end;
end;

procedure TViewFornecedor.dbLogradouroButtonClick(Sender: TObject);
var
  iTipo : Smallint;
  sTipo : String;
  iLogradouro : Integer;
  sLogradouro : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('CID_COD').AsInteger = 0 ) then
      begin
        ShowWarning('Favor informar a Cidade primeiramente!');
        dbCidade.SetFocus;
      end
      else
      if ( SelecionarLogradouro(Self, FieldByName('CID_COD').AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
      begin
        FieldByName('TLG_TIPO').AsInteger  := iTipo;
        FieldByName('LOG_COD').AsInteger   := iLogradouro;
        FieldByName('LOGRADOURO').AsString := Trim(sTipo + ' ' + sLogradouro);
        FieldByName('ENDER').AsString      := Trim(sTipo + ' ' + sLogradouro);
      end;
  end;
end;

procedure TViewFornecedor.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
    begin
      pgcMaisDados.ActivePageIndex := 0;

      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';
    end
    else
    begin
      FieldByName('CNPJ').EditMask := EmptyStr;
      tbsConsultarCNPJ.TabVisible  := False;
      tbsConsultarCPF.TabVisible   := False;
    end;
  end;
end;

procedure TViewFornecedor.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( Field = FieldByName('PESSOA_FISICA') ) then
      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';
  end;
end;

procedure TViewFornecedor.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    with DtSrcTabela.DataSet do
    begin
      FieldByName('PAIS_ID').AsString         := GetPaisIDDefault;
      FieldByName('PAIS_NOME').AsString       := GetPaisNomeDefault;
      FieldByName('EST_COD').AsInteger        := GetEstadoIDDefault;
      FieldByName('EST_NOME').AsString        := GetEstadoNomeDefault;
      FieldByName('UF').AsString              := GetEstadoUF(GetEstadoIDDefault);
      FieldByName('CID_COD').AsInteger        := GetCidadeIDDefault;
      FieldByName('CID_NOME').AsString        := GetCidadeNomeDefault;
      FieldByName('CIDADE').AsString          := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(FieldByName('UF').AsString) + ')', 1, FieldByName('CIDADE').Size);
      FieldByName('CEP').AsString             := GetCidadeCEP(GetCidadeIDDefault);

      if (not FControllerGrupoFornecedor.DAO.DataSet.IsEmpty) then
        FieldByName('GRF_COD').Value := FControllerGrupoFornecedor.DAO.DataSet.FieldByName('GRF_COD').AsInteger
      else
        FieldByName('GRF_COD').Clear;
    end;
end;

procedure TViewFornecedor.btbtnSalvarClick(Sender: TObject);
begin
  if (Length(Trim(dbCEP.Field.AsString)) < 8) then
  begin
    ShowWarning('Favor informar um número de CEP válido.');
    Abort;
  end;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
      if ( not FuncoesString.StrIsCPF(FieldByName('CNPJ').AsString) ) then
      begin
        ShowWarning('Favor informar um CPF válido.');
        Abort;
      end;

    if ( FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
    begin
      if ( not FuncoesString.StrIsCNPJ(FieldByName('CNPJ').AsString) ) then
      begin
        ShowWarning('Favor informar um CNPJ válido.');
        Abort;
      end;

      if ( (Trim(FieldByName('UF').AsString) = EmptyStr) or (FieldByName('EST_COD').AsInteger = 0) ) then
      begin
        ShowWarning('Favor selecionar o Estado.');
        Abort;
      end;

      if ( not StrInscricaoEstadual(Trim(FieldByName('INSCEST').AsString), Trim(FieldByName('UF').AsString)) ) then
      begin
        ShowWarning('Favor informar uma Inscrição Estadual válida.');
        Abort;
      end;
    end;

    inherited;
  end;
end;

procedure TViewFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TViewFornecedor.dbCNPJButtonClick(Sender: TObject);

  procedure AtualizarCamposRetorno;
  var
    bCNPJ,
    bCPF : Boolean;
  begin
    bCNPJ := tbsConsultarCNPJ.TabVisible;
    bCPF  := tbsConsultarCPF.TabVisible;

    if bCNPJ then
      lblRazaoSocialX.Caption := 'Razão Social';

    if bCPF then
      lblRazaoSocialX.Caption := 'Nome';

    lblTipoX.Enabled := bCNPJ;
    EditTipo.Enabled := bCNPJ;
    lblAberturaX.Enabled := bCNPJ;
    EditAbertura.Enabled := bCNPJ;
    lblFantasiaX.Enabled := bCNPJ;
    EditFantasia.Enabled := bCNPJ;
    lblEnderecoX.Enabled := bCNPJ;
    EditEndereco.Enabled := bCNPJ;
    lblNumeroX.Enabled := bCNPJ;
    EditNumero.Enabled := bCNPJ;
    lblComplementoX.Enabled := bCNPJ;
    EditComplemento.Enabled := bCNPJ;
    lblBairroX.Enabled := bCNPJ;
    EditBairro.Enabled := bCNPJ;
    lblCidadeX.Enabled := bCNPJ;
    EditCidade.Enabled := bCNPJ;
    lblUFX.Enabled := bCNPJ;
    EditUF.Enabled := bCNPJ;
    lblCEPX.Enabled := bCNPJ;
    EditCEP.Enabled := bCNPJ;
  end;

begin
  tbsConsultarCPF.TabVisible  := False;
  tbsConsultarCNPJ.TabVisible := False;

  if dbPessoaFisica.Checked then
  begin

    tbsConsultarCPF.TabVisible := True;
    pgcGuias.ActivePage        := tbsConsultarCPF;

    pnlCaptcha.Parent             := pnlConsultarCPF;
    ckRemoverEspacosDuplos.Parent := pnlConsultarCPF;
    lblCaptchaX.Parent    := pnlConsultarCPF;
    edCaptcha.Parent      := pnlConsultarCPF;
    pnlRetornoCNPJ.Parent := tbsConsultarCPF;

    LabAtualizarCaptchaClick(LabAtualizarCaptcha);

    if ( Trim(StrOnlyNumbers(dbCNPJ.Text)) <> EmptyStr ) then
      edCPF.Text := StrFormatarCpf( StrOnlyNumbers(dbCNPJ.Text) )
    else
      edCPF.SetFocus;
  end
  else
  begin
    tbsConsultarCNPJ.TabVisible := True;
    pgcGuias.ActivePage         := tbsConsultarCNPJ;

    pnlCaptcha.Parent             := pnlConsultarCNPJ;
    ckRemoverEspacosDuplos.Parent := pnlConsultarCNPJ;
    lblCaptchaX.Parent    := pnlConsultarCNPJ;
    edCaptcha.Parent      := pnlConsultarCNPJ;
    pnlRetornoCNPJ.Parent := tbsConsultarCNPJ;

    LabAtualizarCaptchaClick(LabAtualizarCaptcha);

    if ( Trim(StrOnlyNumbers(dbCNPJ.Text)) <> EmptyStr ) then
      edCNPJ.Text := StrFormatarCnpj( StrOnlyNumbers(dbCNPJ.Text) )
    else
      edCNPJ.SetFocus;
  end;

  AtualizarCamposRetorno;
end;

procedure TViewFornecedor.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream : TMemoryStream;
  ImgArq : String;
begin
  Stream := TMemoryStream.Create;
  try
    if ( pgcGuias.ActivePage = tbsConsultarCNPJ ) then
      ACBrConsultaCNPJ.Captcha(Stream)
    else
    if ( pgcGuias.ActivePage = tbsConsultarCPF ) then
      ACBrConsultaCPF.Captcha(Stream);

    ImgArq := ExtractFilePath(ParamStr(0)) + PathDelim + 'captch.png';
    Stream.SaveToFile( ImgArq );
    ImgCaptcha.Picture.LoadFromFile( ImgArq );

    edCaptcha.Clear;
    edCaptcha.SetFocus;

    EditTipo.Clear;
    EditAbertura.Clear;
    EditSituacao.Clear;
    EditRazaoSocial.Clear;
    EditFantasia.Clear;
    EditEndereco.Clear;
    EditNumero.Clear;
    EditComplemento.Clear;
    EditBairro.Clear;
    EditCidade.Clear;
    EditUF.Clear;
    EditCEP.Clear;
    EditCNAE1.Clear;
    ListCNAE2.Clear;
  finally
    Stream.Free;
  end;
end;

procedure TViewFornecedor.btnVoltarClick(Sender: TObject);
begin
  pgcGuias.ActivePage         := tbsCadastro;
  tbsConsultarCPF.TabVisible  := False;
  tbsConsultarCNPJ.TabVisible := False;
  dbCNPJ.SetFocus;
end;

procedure TViewFornecedor.btnRecuperarCNPJClick(Sender: TObject);
var
  bCPF  : Boolean;
  iTipo : Smallint;
begin
  bCPF := (pgcGuias.ActivePage = tbsConsultarCPF);
  btnVoltar.Click;

  with DtSrcTabela.DataSet do
  begin
    if not (State in [dsEdit, dsInsert]) then
      Exit;

    if ShowConfirm('Deseja carregar os dados consultados para o cadastro?') then
    begin
      if bCPF then
      begin
        FieldByName('CNPJ').AsString     := StrOnlyNumbers(edCPF.Text);
        FieldByName('NOMEFORN').AsString := Copy(Trim(EditRazaoSocial.Text), 1, FieldByName('NOMEFORN').Size);
      end
      else
      begin
        FieldByName('CNPJ').AsString       := StrOnlyNumbers(edCNPJ.Text);
        FieldByName('NOMEFORN').AsString   := Copy(Trim(EditRazaoSocial.Text), 1, FieldByName('NOMEFORN').Size);
        FieldByName('NOMEFANT').AsString   := Copy(Trim(EditFantasia.Text),    1, FieldByName('NOMEFANT').Size);
        FieldByName('EST_COD').AsInteger   := GetEstadoID( Trim(EditUF.Text) );
        FieldByName('EST_NOME').AsString   := GetEstadoNome( Trim(EditUF.Text) );
        FieldByName('UF').AsString         := Trim(EditUF.Text);
        FieldByName('CID_COD').AsInteger   := GetCidadeID(FieldByName('EST_COD').AsInteger, EditCidade.Text);
        FieldByName('CID_NOME').AsString   := GetCidadeNome(FieldByName('CID_COD').AsInteger);

        if ( (FieldByName('CID_COD').AsInteger = 0) and (Trim(EditCEP.Text) <> EmptyStr) ) then
        begin
          FieldByName('CID_COD').AsInteger  := GetCidadeID(Trim(EditCEP.Text));
          FieldByName('CID_NOME').AsString  := GetCidadeNome(FieldByName('CID_COD').AsInteger);
        end;

        FieldByName('CIDADE').AsString   := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(EditUF.Text) + ')', 1, FieldByName('CIDADE').Size);

        FieldByName('BAI_COD').AsInteger := SetBairro(FieldByName('CID_COD').AsInteger, Copy(Trim(EditBairro.Text), 1, FieldByName('BAI_NOME').Size));
        FieldByName('BAI_NOME').AsString := Trim(EditBairro.Text);

        FieldByName('LOG_COD').AsInteger   := SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(EditEndereco.Text), 1, FieldByName('LOGRADOURO').Size), iTipo);
        FieldByName('LOGRADOURO').AsString := Trim(GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
        FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

        if (iTipo = 0) then
          FieldByName('TLG_TIPO').Clear
        else
          FieldByName('TLG_TIPO').AsInteger := iTipo;

        FieldByName('COMPLEMENTO').AsString := Copy(Trim(EditComplemento.Text), 1, FieldByName('COMPLEMENTO').Size);
        FieldByName('NUMERO_END').AsString  := Copy(Trim(EditNumero.Text),      1, FieldByName('NUMERO_END').Size);
        FieldByName('CEP').AsString         := Copy(StrOnlyNumbers(Trim(EditCEP.Text)), 1, FieldByName('CEP').Size);
      end;
    end;
  end;
end;

procedure TViewFornecedor.btnConsultarCNPJClick(Sender: TObject);
var
  I : Integer;
begin
  if Trim(edCaptcha.Text) <> EmptyStr then
  begin
    if ACBrConsultaCNPJ.Consulta(edCNPJ.Text, Trim(edCaptcha.Text), ckRemoverEspacosDuplos.Checked) then
    begin
      EditTipo.Text        := ACBrConsultaCNPJ.EmpresaTipo;
      EditRazaoSocial.Text := ACBrConsultaCNPJ.RazaoSocial;
      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ.Abertura );
      EditFantasia.Text    := ACBrConsultaCNPJ.Fantasia;
      EditEndereco.Text    := ACBrConsultaCNPJ.Endereco;
      EditNumero.Text      := ACBrConsultaCNPJ.Numero;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditBairro.Text      := ACBrConsultaCNPJ.Bairro;
      EditComplemento.Text := ACBrConsultaCNPJ.Complemento;
      EditCidade.Text      := ACBrConsultaCNPJ.Cidade;
      EditUF.Text          := ACBrConsultaCNPJ.UF;
      EditCEP.Text         := ACBrConsultaCNPJ.CEP;
      EditSituacao.Text    := ACBrConsultaCNPJ.Situacao;
      EditCNAE1.Text       := ACBrConsultaCNPJ.CNAE1;

      for I := 0 to ACBrConsultaCNPJ.CNAE2.Count - 1 do
        ListCNAE2.Items.Add(ACBrConsultaCNPJ.CNAE2[I]);

      btnRecuperarCNPJ.Enabled := True;
    end;
  end
  else
  begin
    ShowWarning('É necessário digitar o captcha.');
    edCaptcha.SetFocus;

    btnRecuperarCNPJ.Enabled := False;
  end;
end;

procedure TViewFornecedor.btnConsultarCPFClick(Sender: TObject);
begin
  if Trim(edCaptcha.Text) <> EmptyStr then
  begin
    if ACBrConsultaCPF.Consulta(edCPF.Text, edDataNasc.Text, Trim(edCaptcha.Text)) then
    begin
      EditRazaoSocial.Text := ACBrConsultaCPF.Nome;
      EditSituacao.Text    := ACBrConsultaCPF.Situacao;
      //EditAbertura.Text    := ACBrConsultaCPF.Emissao;
      //EditTipo.Text        := ACBrConsultaCPF.CodCtrlControle;
      //EditFantasia.Text    := ACBrConsultaCPF.DigitoVerificador;

      btnRecuperarCNPJ.Enabled := True;
    end;
  end
  else
  begin
    ShowWarning('É necessário digitar o captcha.');
    edCaptcha.SetFocus;

    btnRecuperarCNPJ.Enabled := False;
  end;
end;

procedure TViewFornecedor.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    edCaptcha.SetFocus;
end;

procedure TViewFornecedor.edCaptchaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
    if ( pgcGuias.ActivePage = tbsConsultarCNPJ ) then
      btnConsultarCNPJ.Click
    else
    if ( pgcGuias.ActivePage = tbsConsultarCPF ) then
      btnConsultarCPF.Click;
end;

procedure TViewFornecedor.FiltarDados(const iTipoPesquisa: Integer);
var
  aExpressionOr : String;
begin
  try
    WaitAMoment(WAIT_AMOMENT_LoadData);
    edtFiltrar.Text := Trim(edtFiltrar.Text);

    try
      edtFiltrar.Text := Trim(edtFiltrar.Text);

      if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
      begin
        ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
        Abort;
      end;

      FController.DAO.DataSet.Close;
      FController.DAO.ClearWhere;

      if (edtFiltrar.Text <> EmptyStr) then
      begin

        if ( StrToInt64Def(Trim(edtFiltrar.Text), 0) > 0 ) then
        begin
           FController.DAO.Where  (CampoCodigo, StrToIntDef(edtFiltrar.Text, 0));
           FController.DAO.WhereOr( 'f.Cnpj like ' + QuotedStr('%' + StrOnlyNumbers(edtFiltrar.Text) + '%') );
        end
        else
        begin
          aExpressionOr :=
            '  (((upper(f.Nomeforn) like ' + QuotedStr('%' + UpperCase(edtFiltrar.Text) + '%') +
            '  or upper(f.Nomeforn) like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(edtFiltrar.Text)) + '%') + '))' +
            '  or ((upper(f.Nomefant) like ' + QuotedStr('%' + UpperCase(edtFiltrar.Text) + '%') +
            '    or upper(f.Nomefant) like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(edtFiltrar.Text)) + '%') + ')))';

          FController.DAO.Where(aExpressionOr);
        end;
      end;

      if (not WhereAdditional.IsEmpty) then
        FController.DAO.Where('(' + WhereAdditional + ')');

      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      if (not CampoOrdenacao.IsEmpty) then
        FController.DAO.OrderBy(CampoOrdenacao);

      FController.DAO.Open;
      Tabela.Configurar;

      try
        if Showing and (pgcGuias.ActivePage = tbsTabela) then
          if ( not DtSrcTabela.DataSet.IsEmpty ) then
            dbgDados.SetFocus
          else
          begin
            ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

            edtFiltrar.SetFocus;
            edtFiltrar.SelectAll;
          end;
      except
        WaitAMomentFree;
      end;
    except
      On E : Exception do
      begin
        WaitAMomentFree;
        ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13 + E.Message + #13 +
          'Script:' + #13#13 + FController.DAO.SelectSQL);
      end;
    end;
  finally
    WaitAMomentFree;
  end;
end;

procedure TViewFornecedor.btnFiltrarClick(Sender: TObject);
begin
  // inherited;
  FiltarDados(0);
  CentralizarCodigo;
end;

initialization
  FormFunction.RegisterForm('ViewFornecedor', TViewFornecedor);

end.
