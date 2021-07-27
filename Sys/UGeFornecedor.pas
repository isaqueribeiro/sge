unit UGeFornecedor;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ACBrConsultaCPF, ACBrBase,
  ACBrSocket, ACBrConsultaCNPJ, JPEG, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, JvExMask, JvToolEdit,
  JvDBControls, cxControls, cxStyles, cxEdit, cxDBLookupComboBox,
  cxVGrid, cxDBVGrid, cxInplaceContainer, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, JvMaskEdit,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFornecedorRegistro = record
    Codigo   : Integer;
    CNPJ_CPF ,
    Nome     ,
    Fantasia : String;
  end;

  TfrmGeFornecedor = class(TfrmGrPadraoCadastro)
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
    lblFornecedorDesativado: TLabel;
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
    fdQryGrupo: TFDQuery;
    fdQryBancoFebraban: TFDQuery;
    dbCEP: TJvDBMaskEdit;
    fdQryTabelaCODFORN: TIntegerField;
    fdQryTabelaPESSOA_FISICA: TSmallintField;
    fdQryTabelaCNPJ: TStringField;
    fdQryTabelaNOMEFORN: TStringField;
    fdQryTabelaNOMEFANT: TStringField;
    fdQryTabelaINSCEST: TStringField;
    fdQryTabelaINSCMUN: TStringField;
    fdQryTabelaENDER: TStringField;
    fdQryTabelaCOMPLEMENTO: TStringField;
    fdQryTabelaNUMERO_END: TStringField;
    fdQryTabelaCEP: TStringField;
    fdQryTabelaCIDADE: TStringField;
    fdQryTabelaUF: TStringField;
    fdQryTabelaFONE: TStringField;
    fdQryTabelaFONECEL: TStringField;
    fdQryTabelaFONEFAX: TStringField;
    fdQryTabelaTLG_TIPO: TSmallintField;
    fdQryTabelaLOG_COD: TIntegerField;
    fdQryTabelaBAI_COD: TIntegerField;
    fdQryTabelaCID_COD: TIntegerField;
    fdQryTabelaEST_COD: TSmallintField;
    fdQryTabelaEMAIL: TStringField;
    fdQryTabelaSITE: TStringField;
    fdQryTabelaCONTATO: TStringField;
    fdQryTabelaPAIS_ID: TStringField;
    fdQryTabelaGRF_COD: TSmallintField;
    fdQryTabelaTRANSPORTADORA: TSmallintField;
    fdQryTabelaBANCO: TStringField;
    fdQryTabelaAGENCIA: TStringField;
    fdQryTabelaCC: TStringField;
    fdQryTabelaPRACA: TStringField;
    fdQryTabelaBANCO_2: TStringField;
    fdQryTabelaAGENCIA_2: TStringField;
    fdQryTabelaCC_2: TStringField;
    fdQryTabelaPRACA_2: TStringField;
    fdQryTabelaBANCO_3: TStringField;
    fdQryTabelaAGENCIA_3: TStringField;
    fdQryTabelaCC_3: TStringField;
    fdQryTabelaPRACA_3: TStringField;
    fdQryTabelaOBSERVACAO: TMemoField;
    fdQryTabelaDTCAD: TDateField;
    fdQryTabelaATIVO: TSmallintField;
    fdQryTabelaLOGRADOURO: TStringField;
    fdQryTabelaBAI_NOME: TStringField;
    fdQryTabelaCID_NOME: TStringField;
    fdQryTabelaEST_NOME: TStringField;
    fdQryTabelaPAIS_NOME: TStringField;
    fdQryTabelaFATURAMENTO_MINIMO: TFMTBCDField;
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
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgContaCorrenteEnter(Sender: TObject);
    procedure dbgContaCorrenteExit(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
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
  frmGeFornecedor: TfrmGeFornecedor;

  procedure MostrarTabelaFornecedores(const AOwner : TComponent);

  function SelecionarFornecedor(const AOwner : TComponent; var aFornecedor : TFornecedorRegistro) : Boolean; overload;
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarTransportadora(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;

implementation

uses
  UDMBusiness, UGeBairro, View.Cidade, View.Distrito, View.Estado,
  View.Logradouro, UGrPadrao, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaFornecedores(const AOwner : TComponent);
var
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
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
  frm : TfrmGeFornecedor;
  aCodigo : Integer;
  aNome   : String;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
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
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := EmptyStr;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean;
var
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
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
  frm : TfrmGeFornecedor;
begin
  frm := TfrmGeFornecedor.Create(AOwner);
  try
    frm.WhereAdditional := '(f.Transportadora = 1)';

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + WhereAdditional);
      SQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
    if ( Result ) then
      CNPJ := frm.DtSrcTabela.DataSet.FieldByName('CNPJ').AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_FORNECEDOR_ID;
  ControlFirstEdit := dbPessoaFisica;

  SetGruposFornecedores;

  CarregarLista(fdQryGrupo);
  CarregarLista(fdQryBancoFebraban);

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBFORNECEDOR';
  CampoCodigo        := 'Codforn';
  CampoDescricao     := 'Nomeforn';
  CampoCadastroAtivo := 'f.ativo';
  CampoOrdenacao     := 'Nomeforn';
  WhereAdditional    := '(f.cliente_origem is null) and (f.fornecedor_funcionario = 0)';
//
//  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
  tbsConsultarCNPJ.TabVisible  := False;
  tbsConsultarCPF.TabVisible   := False;

  tbsDuplicatas.TabVisible := False; // Temporário

  Tabela
    .Display('CODFORN', 'Código', '##0000', TAlignment.taCenter)
    .Display('FATURAMENTO_MINIMO', 'Fatura Mínima (R$)', ',0.00', TAlignment.taRightJustify)
    .Configurar( fdQryTabela );
end;

procedure TfrmGeFornecedor.ProximoCampoKeyPress(Sender: TObject;
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

procedure TfrmGeFornecedor.dbEstadoButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.dbgContaCorrenteEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TfrmGeFornecedor.dbgContaCorrenteExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if ( DtSrcTabela.DataSet.State = dsInsert ) then
  begin
    pgcMaisDados.ActivePage := tbsObservacao;
    dbObservacao.SetFocus;
  end;
end;

procedure TfrmGeFornecedor.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  // Destacar fornecedores desativados
  if ( DtSrcTabela.DataSet.FieldByName('ATIVO').AsInteger = 0 ) then
    dbgDados.Canvas.Font.Color := lblFornecedorDesativado.Font.Color;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeFornecedor.dbCidadeButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.dbBairroButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.dbLogradouroButtonClick(Sender: TObject);
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

procedure TfrmGeFornecedor.DtSrcTabelaStateChange(Sender: TObject);
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

procedure TfrmGeFornecedor.DtSrcTabelaDataChange(Sender: TObject;
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

procedure TfrmGeFornecedor.btbtnCancelarClick(Sender: TObject);
begin
  try
    dbgContaCorrente.DataController.DataSource := nil;
    inherited;
  finally
    dbgContaCorrente.DataController.DataSource := DtSrcTabela;
  end;
end;

procedure TfrmGeFornecedor.btbtnSalvarClick(Sender: TObject);
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
  end;

  try
    dbgContaCorrente.DataController.DataSource := nil;
    inherited;
  finally
    dbgContaCorrente.DataController.DataSource := DtSrcTabela;
  end;
end;

procedure TfrmGeFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGeFornecedor.dbCNPJButtonClick(Sender: TObject);

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

procedure TfrmGeFornecedor.LabAtualizarCaptchaClick(Sender: TObject);
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

procedure TfrmGeFornecedor.btnVoltarClick(Sender: TObject);
begin
  pgcGuias.ActivePage         := tbsCadastro;
  tbsConsultarCPF.TabVisible  := False;
  tbsConsultarCNPJ.TabVisible := False;
  dbCNPJ.SetFocus;
end;

procedure TfrmGeFornecedor.btnRecuperarCNPJClick(Sender: TObject);
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

procedure TfrmGeFornecedor.btnConsultarCNPJClick(Sender: TObject);
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

procedure TfrmGeFornecedor.btnConsultarCPFClick(Sender: TObject);
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

procedure TfrmGeFornecedor.edCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
    edCaptcha.SetFocus;
end;

procedure TfrmGeFornecedor.fdQryTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if (Trim(FieldByName('BANCO').AsString) = EmptyStr) then
      FieldByName('BANCO').Clear;

    if (Trim(FieldByName('BANCO_2').AsString) = EmptyStr) then
      FieldByName('BANCO_2').Clear;

    if (Trim(FieldByName('BANCO_3').AsString) = EmptyStr) then
      FieldByName('BANCO_3').Clear;

    if ( FieldByName('DTCAD').IsNull ) then
      FieldByName('DTCAD').AsDateTime := GetDateTimeDB;
  end;
end;

procedure TfrmGeFornecedor.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('PESSOA_FISICA').AsInteger  := 0;
    FieldByName('PAIS_ID').AsString         := GetPaisIDDefault;
    FieldByName('PAIS_NOME').AsString       := GetPaisNomeDefault;
    FieldByName('EST_COD').AsInteger        := GetEstadoIDDefault;
    FieldByName('EST_NOME').AsString        := GetEstadoNomeDefault;
    FieldByName('UF').AsString              := GetEstadoUF(GetEstadoIDDefault);
    FieldByName('CID_COD').AsInteger        := GetCidadeIDDefault;
    FieldByName('CID_NOME').AsString        := GetCidadeNomeDefault;
    FieldByName('CIDADE').AsString          := Copy(FieldByName('CID_NOME').AsString + ' (' + Trim(FieldByName('UF').AsString) + ')', 1, FieldByName('CIDADE').Size);
    FieldByName('CEP').AsString             := GetCidadeCEP(GetCidadeIDDefault);
    FieldByName('NUMERO_END').AsString      := 'S/N';
    FieldByName('COMPLEMENTO').AsString     := EmptyStr;
    FieldByName('TRANSPORTADORA').AsInteger := 0;
    FieldByName('DTCAD').AsDateTime         := GetDateTimeDB;
    FieldByName('FATURAMENTO_MINIMO').AsCurrency := 0.0;
    FieldByName('ATIVO').AsInteger          := 1;

    if (fdQryGrupo.RecordCount > 0) then
      FieldByName('GRF_COD').Value := fdQryGrupo.FieldByName('GRF_COD').AsInteger
    else
      FieldByName('GRF_COD').Clear;

    FieldByName('BANCO').Clear;
    FieldByName('AGENCIA').Clear;
    FieldByName('CC').Clear;
    FieldByName('PRACA').Clear;
    FieldByName('BANCO_2').Clear;
    FieldByName('AGENCIA_2').Clear;
    FieldByName('CC_2').Clear;
    FieldByName('PRACA_2').Clear;
    FieldByName('BANCO_3').Clear;
    FieldByName('AGENCIA_3').Clear;
    FieldByName('CC_3').Clear;
    FieldByName('PRACA_3').Clear;
    FieldByName('OBSERVACAO').Clear;
  end;
end;

procedure TfrmGeFornecedor.edCaptchaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
    if ( pgcGuias.ActivePage = tbsConsultarCNPJ ) then
      btnConsultarCNPJ.Click
    else
    if ( pgcGuias.ActivePage = tbsConsultarCPF ) then
      btnConsultarCPF.Click;
end;

procedure TfrmGeFornecedor.FiltarDados(const iTipoPesquisa: Integer);
begin
  try

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with fdQryTabela, SQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( SQLTabela );

      if ( WhereAdditional <> EmptyStr ) then
        Add( 'where (' + WhereAdditional + ')' )
      else
        Add( 'where (1 = 1)' );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
      begin

        if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
          Add( '  and ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
        else
        begin
          Add( '  and (((upper(f.Nomeforn) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
               '      or upper(f.Nomeforn) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + '))');
          Add( '   or ((upper(f.Nomefant) like ' + QuotedStr(UpperCase(Trim(edtFiltrar.Text)) + '%') +
               '      or upper(f.Nomefant) like ' + QuotedStr(UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')))');
        end;
      end;

      Add( 'order by ' + CampoOrdenacao );

      Open;

      try
      
        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + fdQryTabela.SQL.Text);
  end;
end;

procedure TfrmGeFornecedor.btnFiltrarClick(Sender: TObject);
begin
  // inherited;
  FiltarDados(0);
  CentralizarCodigo;
end;

initialization
  FormFunction.RegisterForm('frmGeFornecedor', TfrmGeFornecedor);

end.
