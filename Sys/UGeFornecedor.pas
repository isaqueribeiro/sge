unit UGeFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, ACBrConsultaCPF, ACBrBase,
  ACBrSocket, ACBrConsultaCNPJ, JPEG, IBQuery, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, JvExMask, JvToolEdit,
  JvDBControls, dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxControls, cxStyles,
  cxEdit, cxDBLookupComboBox, cxVGrid, cxDBVGrid, cxInplaceContainer;

type
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
    dbCEP: TDBEdit;
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
    IbDtstTabelaCODFORN: TIntegerField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaNOMEFORN: TIBStringField;
    IbDtstTabelaINSCEST: TIBStringField;
    IbDtstTabelaINSCMUN: TIBStringField;
    IbDtstTabelaENDER: TIBStringField;
    IbDtstTabelaCOMPLEMENTO: TIBStringField;
    IbDtstTabelaNUMERO_END: TIBStringField;
    IbDtstTabelaCEP: TIBStringField;
    IbDtstTabelaCIDADE: TIBStringField;
    IbDtstTabelaUF: TIBStringField;
    IbDtstTabelaFONE: TIBStringField;
    IbDtstTabelaTLG_TIPO: TSmallintField;
    IbDtstTabelaLOG_COD: TIntegerField;
    IbDtstTabelaBAI_COD: TIntegerField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaEMAIL: TIBStringField;
    IbDtstTabelaSITE: TIBStringField;
    IbDtstTabelaPAIS_ID: TIBStringField;
    IbDtstTabelaGRF_COD: TSmallintField;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaBAI_NOME: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaPAIS_NOME: TIBStringField;
    lblContato: TLabel;
    dbContato: TDBEdit;
    IbDtstTabelaCONTATO: TIBStringField;
    tblGrupo: TIBTable;
    dtsGrupo: TDataSource;
    lblGrupo: TLabel;
    dbGrupo: TDBLookupComboBox;
    tbsDadosAdcionais: TTabSheet;
    IbDtstTabelaTRANSPORTADORA: TSmallintField;
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
    IbDtstTabelaDTCAD: TDateField;
    dbDataCadastro: TDBEdit;
    lblDataCadastro: TLabel;
    lblFoneCelular: TLabel;
    dbFoneCelular: TDBEdit;
    dbFoneFax: TDBEdit;
    lblFoneFax: TLabel;
    IbDtstTabelaFONECEL: TIBStringField;
    IbDtstTabelaFONEFAX: TIBStringField;
    lblNomeFantasia: TLabel;
    dbNomeFantasia: TDBEdit;
    IbDtstTabelaNOMEFANT: TIBStringField;
    qryBancoFebraban: TIBQuery;
    dtsBancoFebraban: TDataSource;
    tbsDadoFinanceiro: TTabSheet;
    tbsObservacao: TTabSheet;
    IbDtstTabelaBANCO: TIBStringField;
    IbDtstTabelaAGENCIA: TIBStringField;
    IbDtstTabelaCC: TIBStringField;
    IbDtstTabelaPRACA: TIBStringField;
    IbDtstTabelaOBSERVACAO: TMemoField;
    dbObservacao: TDBMemo;
    IbDtstTabelaFATURAMENTO_MINIMO: TIBBCDField;
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
    IbDtstTabelaATIVO: TSmallintField;
    dbCadastroAtivo: TDBCheckBox;
    lblFornecedorDesativado: TLabel;
    lblDataNasc: TLabel;
    edDataNasc: TMaskEdit;
    IbDtstTabelaBANCO_2: TIBStringField;
    IbDtstTabelaAGENCIA_2: TIBStringField;
    IbDtstTabelaCC_2: TIBStringField;
    IbDtstTabelaPRACA_2: TIBStringField;
    IbDtstTabelaBANCO_3: TIBStringField;
    IbDtstTabelaAGENCIA_3: TIBStringField;
    IbDtstTabelaCC_3: TIBStringField;
    IbDtstTabelaPRACA_3: TIBStringField;
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
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltarDados(const iTipoPesquisa: Integer); overload;
  end;

var
  frmGeFornecedor: TfrmGeFornecedor;

  procedure MostrarTabelaFornecedores(const AOwner : TComponent);
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarFornecedor(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;
  function SelecionarTransportadora(const AOwner : TComponent; var Codigo : Integer; var CNPJ, Nome : String) : Boolean; overload;

implementation

uses UDMBusiness, UGeBairro, UGeCidade, UGeDistrito, UGeEstado,
  UGeLogradouro, UGrPadrao, UConstantesDGE;

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
      CNPJ := frm.IbDtstTabelaCNPJ.AsString;
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
    frm.WhereAdditional := 'f.Transportadora = 1';

    with frm, IbDtstTabela do
    begin
      Close;
      SelectSQL.Add('where ' + WhereAdditional);
      SelectSQL.Add('order by ' + CampoDescricao);
      Open;
    end;

    Result := frm.SelecionarRegistro(Codigo, Nome, frm.WhereAdditional);
    if ( Result ) then
      CNPJ := frm.IbDtstTabelaCNPJ.AsString;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_FORNECEDOR_ID;
  ControlFirstEdit := dbPessoaFisica;

  tblGrupo.Open;
  qryBancoFebraban.Open;

  DisplayFormatCodigo := '##0000';

  NomeTabela         := 'TBFORNECEDOR';
  CampoCodigo        := 'Codforn';
  CampoDescricao     := 'Nomeforn';
  CampoCadastroAtivo := 'f.ativo';
  WhereAdditional    := '(f.cliente_origem is null) and (f.fornecedor_funcionario = 0)';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
  tbsConsultarCNPJ.TabVisible  := False;
  tbsConsultarCPF.TabVisible   := False;

  tbsDuplicatas.TabVisible := False; // Temporário
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
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarEstado(Self, iEstado, sEstado, sUF) ) then
    begin
      IbDtstTabelaEST_COD.AsInteger := iEstado;
      IbDtstTabelaEST_NOME.AsString := sEstado;
      IbDtstTabelaUF.AsString       := sUF;
    end;
end;

procedure TfrmGeFornecedor.dbgContaCorrenteEnter(Sender: TObject);
begin
  Self.OnKeyDown := nil;
end;

procedure TfrmGeFornecedor.dbgContaCorrenteExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
  if ( IbDtstTabela.State = dsInsert ) then
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
  if ( IbDtstTabelaATIVO.AsInteger = 0 ) then
    dbgDados.Canvas.Font.Color := lblFornecedorDesativado.Font.Color;

  dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
end;

procedure TfrmGeFornecedor.dbCidadeButtonClick(Sender: TObject);
var
  iCidade : Integer;
  sCidade : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaEST_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar o Estado primeiramente!');
      dbEstado.SetFocus;
    end
    else
    if ( SelecionarCidade(Self, IbDtstTabelaEST_COD.AsInteger, iCidade, sCidade) ) then
    begin
      IbDtstTabelaCID_COD.AsInteger := iCidade;
      IbDtstTabelaCID_NOME.AsString := sCidade;
      IbDtstTabelaCIDADE.AsString   := Copy(sCidade + ' (' + IbDtstTabelaUF.AsString + ')', 1, IbDtstTabelaCIDADE.Size);
      IbDtstTabelaCEP.AsString      := GetCidadeCEP(iCidade);
    end;
end;

procedure TfrmGeFornecedor.dbBairroButtonClick(Sender: TObject);
var
  iBairro : Integer;
  sBairro : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarBairro(Self, IbDtstTabelaCID_COD.AsInteger, iBairro, sBairro) ) then
    begin
      IbDtstTabelaBAI_COD.AsInteger := iBairro;
      IbDtstTabelaBAI_NOME.AsString := sBairro;
    end;
end;

procedure TfrmGeFornecedor.dbLogradouroButtonClick(Sender: TObject);
var
  iTipo : Smallint;
  sTipo : String;
  iLogradouro : Integer;
  sLogradouro : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( IbDtstTabelaCID_COD.AsInteger = 0 ) then
    begin
      ShowWarning('Favor informar a Cidade primeiramente!');
      dbCidade.SetFocus;
    end
    else
    if ( SelecionarLogradouro(Self, IbDtstTabelaCID_COD.AsInteger, iTipo, sTipo, iLogradouro, sLogradouro) ) then
    begin
      IbDtstTabelaTLG_TIPO.AsInteger  := iTipo;
      IbDtstTabelaLOG_COD.AsInteger   := iLogradouro;
      IbDtstTabelaLOGRADOURO.AsString := Trim(sTipo + ' ' + sLogradouro);
      IbDtstTabelaENDER.AsString      := Trim(sTipo + ' ' + sLogradouro);
    end;
end;

procedure TfrmGeFornecedor.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaPESSOA_FISICA.AsInteger  := 0;
  IbDtstTabelaPAIS_ID.AsString         := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString       := GetPaisNomeDefault;
  IbDtstTabelaEST_COD.AsInteger        := GetEstadoIDDefault;
  IbDtstTabelaEST_NOME.AsString        := GetEstadoNomeDefault;
  IbDtstTabelaUF.AsString              := GetEstadoUF(GetEstadoIDDefault);
  IbDtstTabelaCID_COD.AsInteger        := GetCidadeIDDefault;
  IbDtstTabelaCID_NOME.AsString        := GetCidadeNomeDefault;
  IbDtstTabelaCIDADE.AsString          := Copy(IbDtstTabelaCID_NOME.AsString + ' (' + Trim(IbDtstTabelaUF.AsString) + ')', 1, IbDtstTabelaCIDADE.Size);
  IbDtstTabelaCEP.AsString             := GetCidadeCEP(GetCidadeIDDefault);
  IbDtstTabelaNUMERO_END.AsString      := 'S/N';
  IbDtstTabelaCOMPLEMENTO.AsString     := EmptyStr;
  IbDtstTabelaTRANSPORTADORA.AsInteger := 0;
  IbDtstTabelaDTCAD.AsDateTime         := GetDateTimeDB;
  IbDtstTabelaFATURAMENTO_MINIMO.Value := 0.0;
  IbDtstTabelaATIVO.Value              := 1;
  IbDtstTabelaGRF_COD.Clear;
  IbDtstTabelaBANCO.Clear;
  IbDtstTabelaAGENCIA.Clear;
  IbDtstTabelaCC.Clear;
  IbDtstTabelaPRACA.Clear;
  IbDtstTabelaBANCO_2.Clear;
  IbDtstTabelaAGENCIA_2.Clear;
  IbDtstTabelaCC_2.Clear;
  IbDtstTabelaPRACA_2.Clear;
  IbDtstTabelaBANCO_3.Clear;
  IbDtstTabelaAGENCIA_3.Clear;
  IbDtstTabelaCC_3.Clear;
  IbDtstTabelaPRACA_3.Clear;
  IbDtstTabelaOBSERVACAO.Clear;
end;

procedure TfrmGeFornecedor.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    pgcMaisDados.ActivePageIndex := 0;

    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; ';
  end
  else
  begin
    IbDtstTabelaCNPJ.EditMask   := EmptyStr;
    tbsConsultarCNPJ.TabVisible := False;
    tbsConsultarCPF.TabVisible  := False;
  end;
end;

procedure TfrmGeFornecedor.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ( Field = IbDtstTabela.FieldByName('PESSOA_FISICA') ) then
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; '
end;

procedure TfrmGeFornecedor.btbtnSalvarClick(Sender: TObject);
begin
  if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
    if ( not FuncoesString.StrIsCPF(IbDtstTabelaCNPJ.AsString) ) then
    begin
      ShowWarning('Favor informar um CPF válido.');
      Abort;
    end;

  if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 0 ) then
  begin
    if ( not FuncoesString.StrIsCNPJ(IbDtstTabelaCNPJ.AsString) ) then
    begin
      ShowWarning('Favor informar um CNPJ válido.');
      Abort;
    end;

    if ( (Trim(IbDtstTabelaUF.AsString) = EmptyStr) or (IbDtstTabelaEST_COD.AsInteger = 0) ) then
    begin
      ShowWarning('Favor selecionar o Estado.');
      Abort;
    end;

    if ( not StrInscricaoEstadual(Trim(IbDtstTabelaINSCEST.AsString), Trim(IbDtstTabelaUF.AsString)) ) then
    begin
      ShowWarning('Favor informar uma Inscrição Estadual válida.');
      Abort;
    end;
  end;

  if ( IbDtstTabelaDTCAD.IsNull ) then
    IbDtstTabelaDTCAD.AsDateTime := GetDateTimeDB;
    
  inherited;
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

  if not (IbDtstTabela.State in [dsEdit, dsInsert]) then
    Exit;

  if ShowConfirm('Deseja carregar os dados consultados para o cadastro?') then
  begin
    if bCPF then
    begin
      IbDtstTabelaCNPJ.AsString     := StrOnlyNumbers(edCPF.Text);
      IbDtstTabelaNOMEFORN.AsString := Copy(Trim(EditRazaoSocial.Text), 1, IbDtstTabelaNOMEFORN.Size);
    end
    else
    begin
      IbDtstTabelaCNPJ.AsString       := StrOnlyNumbers(edCNPJ.Text);
      IbDtstTabelaNOMEFORN.AsString   := Copy(Trim(EditRazaoSocial.Text), 1, IbDtstTabelaNOMEFORN.Size);
      IbDtstTabelaNOMEFANT.AsString   := Copy(Trim(EditFantasia.Text),    1, IbDtstTabelaNOMEFANT.Size);
      IbDtstTabelaEST_COD.AsInteger   := GetEstadoID( Trim(EditUF.Text) );
      IbDtstTabelaEST_NOME.AsString   := GetEstadoNome( Trim(EditUF.Text) );
      IbDtstTabelaUF.AsString         := Trim(EditUF.Text);
      IbDtstTabelaCID_COD.AsInteger   := GetCidadeID(IbDtstTabelaEST_COD.AsInteger, EditCidade.Text);
      IbDtstTabelaCID_NOME.AsString   := GetCidadeNome(IbDtstTabelaCID_COD.AsInteger);

      if ( (IbDtstTabelaCID_COD.AsInteger = 0) and (Trim(EditCEP.Text) <> EmptyStr) ) then
      begin
        IbDtstTabelaCID_COD.AsInteger  := GetCidadeID(Trim(EditCEP.Text));
        IbDtstTabelaCID_NOME.AsString  := GetCidadeNome(IbDtstTabelaCID_COD.AsInteger);
      end;

      IbDtstTabelaCIDADE.AsString   := Copy(IbDtstTabelaCID_NOME.AsString + ' (' + Trim(EditUF.Text) + ')', 1, IbDtstTabelaCIDADE.Size);

      IbDtstTabelaBAI_COD.AsInteger := SetBairro(IbDtstTabelaCID_COD.AsInteger, Copy(Trim(EditBairro.Text), 1, IbDtstTabelaBAI_NOME.Size));
      IbDtstTabelaBAI_NOME.AsString := Trim(EditBairro.Text);

      IbDtstTabelaLOG_COD.AsInteger   := SetLogradouro(IbDtstTabelaCID_COD.AsInteger, Copy(Trim(EditEndereco.Text), 1, IbDtstTabelaLOGRADOURO.Size), iTipo);
      IbDtstTabelaLOGRADOURO.AsString := Trim(GetLogradouroTipo(IbDtstTabelaLOG_COD.AsInteger) + ' ' + GetLogradouroNome(IbDtstTabelaLOG_COD.AsInteger));
      IbDtstTabelaENDER.AsString      := Trim(IbDtstTabelaLOGRADOURO.AsString);

      if (iTipo = 0) then
        IbDtstTabelaTLG_TIPO.Clear
      else
        IbDtstTabelaTLG_TIPO.AsInteger := iTipo;

      IbDtstTabelaCOMPLEMENTO.AsString := Copy(Trim(EditComplemento.Text), 1, IbDtstTabelaCOMPLEMENTO.Size);
      IbDtstTabelaNUMERO_END.AsString  := Copy(Trim(EditNumero.Text),      1, IbDtstTabelaNUMERO_END.Size);
      IbDtstTabelaCEP.AsString         := Copy(StrOnlyNumbers(Trim(EditCEP.Text)), 1, IbDtstTabelaCEP.Size);
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

    with IbDtstTabela, SelectSQL do
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
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message + #13#13 + 'Script:' + #13 + IbDtstTabela.SelectSQL.Text);
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
