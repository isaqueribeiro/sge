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
  cxFilter,
  cxInplaceContainer,
  dxSkinOffice2019Black,
  dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray,
  dxSkinOffice2019White,
  dxSkinsDefaultPainters,
  dxScrollbarAnnotations,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UGrPadraoCadastro,
  Service.Request.CNPJ,
  Service.Request.CEP,
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
    lblCNPJ: TLabel;
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
    dbCNPJ: TJvDBComboEdit;
    dbEstado: TJvDBComboEdit;
    dbCidade: TJvDBComboEdit;
    dbBairro: TJvDBComboEdit;
    dbLogradouro: TJvDBComboEdit;
    dbPais: TJvDBComboEdit;
    dbCadastroAtivo: TDBCheckBox;
    lblRegistroDesativado: TLabel;
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
    dbCEP: TJvDBComboEdit;
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
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgContaCorrenteEnter(Sender: TObject);
    procedure dbgContaCorrenteExit(Sender: TObject);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbCEPButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FControllerGrupoFornecedor   ,
    FControllerBancoFebrabanView : IControllerCustom;
    FServiceCEP  : TServiceRequestCEP;
    procedure CarregarBancos;
    procedure BuscarCEP(aRetorno : TEndereco);

    function ServiceCEP : TServiceRequestCEP;
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
  UDMRecursos,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  Service.Message,
  Service.Utils,
  View.Servico.ConsultarCNPJ,
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
      aFornecedor.CNPJ_CPF := TServicesUtils.StrOnlyNumbers(frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString);
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

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBFORNECEDOR';
  CampoCodigo        := 'Codforn';
  CampoDescricao     := 'Nomeforn';
  CampoOrdenacao     := 'Nomeforn';
  CampoCadastroAtivo := 'f.ativo';
  WhereAdditional    := '(f.cliente_origem is null) and (f.fornecedor_funcionario = 0)';

  pgcMaisDados.ActivePageIndex := 0;
  tbsDuplicatas.TabVisible     := False; // Temporário

  Tabela
    .Display('CODFORN', 'Código', '##0000', TAlignment.taCenter)
    .Display('FATURAMENTO_MINIMO', 'Fatura Mínima (R$)', ',0.00', TAlignment.taRightJustify);

  AbrirTabelaAuto := False;

  TController(FControllerGrupoFornecedor).LookupComboBox(dbGrupo, dtsGrupo, 'grf_cod', 'grf_cod', 'grf_descricao');
end;

procedure TViewFornecedor.FormDestroy(Sender: TObject);
begin
  FServiceCEP.Free;
  inherited;
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

function TViewFornecedor.ServiceCEP: TServiceRequestCEP;
begin
  if not Assigned(FServiceCEP) then
    FServiceCEP := TServiceRequestCEP.Create;
  Result := FServiceCEP;
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

procedure TViewFornecedor.dbCEPButtonClick(Sender: TObject);
var
  aCEP : String;
  aTipoLog : Smallint;
  aEndereco : IControllerEndereco;
begin
  if (DtSrcTabela.DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
  begin
    dbLogradouro.SetFocus;
    aCEP := TServicesUtils.StrOnlyNumbers(DtSrcTabela.DataSet.FieldByName('CEP').AsString);
    ServiceCEP.Consultar(aCEP, BuscarCEP);
  end;
end;

procedure TViewFornecedor.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
  aEndereco : IControllerEndereco;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( FieldByName('EST_COD').AsInteger = 0 ) then
      begin
        TServiceMessage.ShowWarning('Favor informar o Estado primeiramente!');
        dbEstado.SetFocus;
      end
      else
      if ( SelecionarCidade(Self, FieldByName('EST_COD').AsInteger, iCidade, sCidade) ) then
      begin
        aEndereco := TControllerFactory.New.Endereco;

        FieldByName('CID_COD').AsInteger := iCidade;
        FieldByName('CID_NOME').AsString := sCidade;
        FieldByName('CIDADE').AsString   := Copy(sCidade + ' (' + FieldByName('UF').AsString + ')', 1, FieldByName('CIDADE').Size);
        FieldByName('CEP').AsString      := aEndereco.GetCidadeCEP(iCidade);
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
        TServiceMessage.ShowWarning('Favor informar a Cidade primeiramente!');
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
        TServiceMessage.ShowWarning('Favor informar a Cidade primeiramente!');
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
    if (State in [dsEdit, dsInsert]) then
    begin
      pgcMaisDados.ActivePageIndex := 0;

      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';
    end
    else
      FieldByName('CNPJ').EditMask := EmptyStr;

    if Trim(FieldByName('CEP').EditMask).IsEmpty then
      FieldByName('CEP').EditMask := '00\.000\-000;0; ';
  end;
end;

procedure TViewFornecedor.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (Field = FieldByName('PESSOA_FISICA')) then
      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';

    if (Field = FieldByName('CEP')) and Trim(FieldByName('CEP').EditMask).IsEmpty then
      FieldByName('CEP').EditMask := '00\.000\-000;0; ';
  end;
end;

procedure TViewFornecedor.btbtnIncluirClick(Sender: TObject);
var
  aEndereco : IControllerEndereco;
begin
  inherited;
  if (not OcorreuErro) then
    with DtSrcTabela.DataSet do
    begin
      aEndereco := TControllerFactory.New.Endereco;

      FieldByName('PAIS_ID').AsString         := aEndereco.GetPaisIDDefault;
      FieldByName('PAIS_NOME').AsString       := aEndereco.GetPaisNome(aEndereco.GetPaisIDDefault);
      FieldByName('EST_COD').AsInteger        := aEndereco.GetEstadoIDDefault;
      FieldByName('EST_NOME').AsString        := aEndereco.GetEstadoNome(aEndereco.GetEstadoIDDefault);
      FieldByName('UF').AsString              := aEndereco.GetEstadoUF(aEndereco.GetEstadoIDDefault);
      FieldByName('CID_COD').AsInteger        := aEndereco.GetCidadeIDDefault;
      FieldByName('CID_NOME').AsString        := aEndereco.GetCidadeNome(aEndereco.GetCidadeIDDefault);
      FieldByName('CIDADE').AsString          := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(FieldByName('UF').AsString) + ')', 1, FieldByName('CIDADE').Size);
      FieldByName('CEP').AsString             := aEndereco.GetCidadeCEP(aEndereco.GetCidadeIDDefault);

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
    TServiceMessage.ShowWarning('Favor informar um número de CEP válido.');
    Abort;
  end;

  with DtSrcTabela.DataSet do
  begin
    if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
      if ( not FuncoesString.StrIsCPF(FieldByName('CNPJ').AsString) ) then
      begin
        TServiceMessage.ShowWarning('Favor informar um CPF válido.');
        Abort;
      end;

    if ( FieldByName('PESSOA_FISICA').AsInteger = 0 ) then
    begin
      if ( not FuncoesString.StrIsCNPJ(FieldByName('CNPJ').AsString) ) then
      begin
        TServiceMessage.ShowWarning('Favor informar um CNPJ válido.');
        Abort;
      end;

      if ( (Trim(FieldByName('UF').AsString) = EmptyStr) or (FieldByName('EST_COD').AsInteger = 0) ) then
      begin
        TServiceMessage.ShowWarning('Favor selecionar o Estado.');
        Abort;
      end;

      if (not TServicesUtils.StrInscricaoEstadual(Trim(FieldByName('INSCEST').AsString), Trim(FieldByName('UF').AsString))) then
      begin
        TServiceMessage.ShowWarning('Favor informar uma Inscrição Estadual válida.');
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
var
  aPessoa  : TPessoaJuridica;
  aTipoLog : Smallint;
  aEndereco : IControllerEndereco;
  I : Integer;
  aCodigo    ,
  aDescricao : String;
begin
  if (DtSrcTabela.DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
  begin
    dbRazao.SetFocus;
    aPessoa.CNPJ := TServicesUtils.StrOnlyNumbers(DtSrcTabela.DataSet.FieldByName('CNPJ').AsString);
    if SelecionarCNPJ(Self, aPessoa) then
    begin
      if TServiceMessage.ShowConfirm('Deseja carregar os dados consultados para o cadastro?') then
      begin
        with DtSrcTabela.DataSet do
        begin
          aEndereco := TControllerFactory.New.Endereco;

          FieldByName('CNPJ').AsString       := TServicesUtils.StrOnlyNumbers(aPessoa.CNPJ);
          FieldByName('NOMEFORN').AsString   := Copy(aPessoa.RazaoSocial, 1, FieldByName('NOMEFORN').Size);
          FieldByName('NOMEFANT').AsString   := Copy(aPessoa.Fantasia,    1, FieldByName('NOMEFANT').Size);
          FieldByName('EST_COD').AsInteger   := aEndereco.GetEstadoID(aPessoa.Endereco.UF);
          FieldByName('EST_NOME').AsString   := aEndereco.GetEstadoNome(aPessoa.Endereco.UF);
          FieldByName('UF').AsString         := aPessoa.Endereco.UF;
          FieldByName('CID_COD').AsInteger   := aEndereco.GetCidadeID(FieldByName('EST_COD').AsInteger, aPessoa.Endereco.Municipio);
          FieldByName('CID_NOME').AsString   := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);

          if ((FieldByName('CID_COD').AsInteger = 0) and (not aPessoa.Endereco.CEP.IsEmpty)) then
          begin
            FieldByName('CID_COD').AsInteger  := aEndereco.GetCidadeID(aPessoa.Endereco.CEP);
            FieldByName('CID_NOME').AsString  := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);
          end;

          FieldByName('CIDADE').AsString   := Copy(FieldByName('CID_NOME').AsString + ' (' + aPessoa.Endereco.UF + ')', 1, FieldByName('CIDADE').Size);

          FieldByName('BAI_COD').AsInteger := aEndereco.SetBairro(FieldByName('CID_COD').AsInteger, Copy(aPessoa.Endereco.Bairro, 1, FieldByName('BAI_NOME').Size));
          FieldByName('BAI_NOME').AsString := aPessoa.Endereco.Bairro;

          FieldByName('LOG_COD').AsInteger   := aEndereco.SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(aPessoa.Endereco.Tipo + ' ' + aPessoa.Endereco.Logradouro), 1, FieldByName('LOGRADOURO').Size), aTipoLog);
          FieldByName('LOGRADOURO').AsString := Trim(aEndereco.GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + aEndereco.GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
          FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

          if (aTipoLog = 0) then
            FieldByName('TLG_TIPO').Clear
          else
            FieldByName('TLG_TIPO').AsInteger := aTipoLog;

          FieldByName('COMPLEMENTO').AsString := Copy(aPessoa.Endereco.Complemento, 1, FieldByName('COMPLEMENTO').Size);
          FieldByName('NUMERO_END').AsString  := Copy(aPessoa.Endereco.Numero,      1, FieldByName('NUMERO_END').Size);
          FieldByName('CEP').AsString         := Copy(TServicesUtils.StrOnlyNumbers(aPessoa.Endereco.CEP), 1, FieldByName('CEP').Size);

          // CNAE's secundárias
          for I := 0 to Pred(aPessoa.Cnaes.Count) do
          begin
            aCodigo    := Trim(Copy(aPessoa.Cnaes.Strings[I], 1, Pos('-', aPessoa.Cnaes.Strings[I]) - 1));
            aDescricao := Trim(Copy(aPessoa.Cnaes.Strings[I], Pos('-', aPessoa.Cnaes.Strings[I]) + 1, aPessoa.Cnaes.Strings[I].Length));

            // IMPLEMENTAR GRAVAÇÃO DOS CNAE's DO FORNECEDOR
            // ....
          end;
        end;
      end;
    end;
  end;
end;

procedure TViewFornecedor.pgcGuiasChange(Sender: TObject);
begin
  if (pgcGuias.ActivePage = tbsCadastro) then
    CarregarBancos;
end;

procedure TViewFornecedor.BuscarCEP(aRetorno: TEndereco);
var
  aTipoLog  : Smallint;
  aEndereco : IControllerEndereco;
begin
  if ServiceCEP.Error.IsEmpty then
  begin
      with DtSrcTabela.DataSet do
      begin
        aEndereco := TControllerFactory.New.Endereco;

        FieldByName('EST_COD').AsInteger   := aEndereco.GetEstadoID(aRetorno.UF);
        FieldByName('EST_NOME').AsString   := aEndereco.GetEstadoNome(aRetorno.UF);
        FieldByName('UF').AsString         := aRetorno.UF;
        FieldByName('CID_COD').AsInteger   := aEndereco.GetCidadeID(FieldByName('EST_COD').AsInteger, aRetorno.Municipio);
        FieldByName('CID_NOME').AsString   := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);

        if ((FieldByName('CID_COD').AsInteger = 0) and (not aRetorno.CEP.IsEmpty)) then
        begin
          FieldByName('CID_COD').AsInteger  := aEndereco.GetCidadeID(aRetorno.CEP);
          FieldByName('CID_NOME').AsString  := aEndereco.GetCidadeNome(FieldByName('CID_COD').AsInteger);
        end;

        FieldByName('CIDADE').AsString   := Copy(FieldByName('CID_NOME').AsString + ' (' + aRetorno.UF + ')', 1, FieldByName('CIDADE').Size);

        FieldByName('BAI_COD').AsInteger := aEndereco.SetBairro(FieldByName('CID_COD').AsInteger, Copy(aRetorno.Bairro, 1, FieldByName('BAI_NOME').Size));
        FieldByName('BAI_NOME').AsString := aRetorno.Bairro;

        FieldByName('LOG_COD').AsInteger   := aEndereco.SetLogradouro(FieldByName('CID_COD').AsInteger, Copy(Trim(aRetorno.Tipo + ' ' + aRetorno.Logradouro), 1, FieldByName('LOGRADOURO').Size), aTipoLog);
        FieldByName('LOGRADOURO').AsString := Trim(aEndereco.GetLogradouroTipo(FieldByName('LOG_COD').AsInteger) + ' ' + aEndereco.GetLogradouroNome(FieldByName('LOG_COD').AsInteger));
        FieldByName('ENDER').AsString      := Trim(FieldByName('LOGRADOURO').AsString);

        if (aTipoLog = 0) then
          FieldByName('TLG_TIPO').Clear
        else
          FieldByName('TLG_TIPO').AsInteger := aTipoLog;

        FieldByName('COMPLEMENTO').AsString := Copy(aRetorno.Complemento, 1, FieldByName('COMPLEMENTO').Size);
        FieldByName('NUMERO_END').AsString  := Copy(aRetorno.Numero,      1, FieldByName('NUMERO_END').Size);
        FieldByName('CEP').AsString         := Copy(TServicesUtils.StrOnlyNumbers(aRetorno.CEP), 1, FieldByName('CEP').Size);
      end;
  end
  else
    TServiceMessage.ShowError(ServiceCEP.Error);
end;

procedure TViewFornecedor.CarregarBancos;
begin
  if (dtsBancoFebraban.Tag = 0) then
  begin
    TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco1, dtsBancoFebraban, 'banco',   'codigo', 'nome_codigo');
    TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco2, dtsBancoFebraban, 'banco_2', 'codigo', 'codigo_nome');
    TController(FControllerBancoFebrabanView).LookupComboBox(dbBanco3, dtsBancoFebraban, 'banco_3', 'codigo', 'codigo_nome');

    dtsBancoFebraban.Tag := 1;
  end;
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
        TServiceMessage.ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
        Abort;
      end;

      FController.DAO.DataSet.Close;
      FController.DAO.ClearWhere;

      if (edtFiltrar.Text <> EmptyStr) then
      begin

        if ( StrToInt64Def(Trim(edtFiltrar.Text), 0) > 0 ) then
        begin
           FController.DAO.Where  (CampoCodigo, StrToIntDef(edtFiltrar.Text, 0));
           FController.DAO.WhereOr( 'f.Cnpj like ' + QuotedStr('%' + TServicesUtils.StrOnlyNumbers(edtFiltrar.Text) + '%') );
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
            TServiceMessage.ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

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
        TServiceMessage.ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13 + E.Message + #13 +
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
