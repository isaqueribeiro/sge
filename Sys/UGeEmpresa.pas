unit UGeEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, rxToolEdit, RXDBCtrl, Menus, ExtDlgs;

type
  TfrmGeEmpresa = class(TfrmGrPadraoCadastro)
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaPESSOA_FISICA: TSmallintField;
    IbDtstTabelaCNPJ: TIBStringField;
    IbDtstTabelaRZSOC: TIBStringField;
    IbDtstTabelaNMFANT: TIBStringField;
    IbDtstTabelaIE: TIBStringField;
    IbDtstTabelaIM: TIBStringField;
    IbDtstTabelaENDER: TIBStringField;
    IbDtstTabelaCOMPLEMENTO: TIBStringField;
    IbDtstTabelaNUMERO_END: TIBStringField;
    IbDtstTabelaCEP: TIBStringField;
    IbDtstTabelaCIDADE: TIBStringField;
    IbDtstTabelaUF: TIBStringField;
    IbDtstTabelaFONE: TIBStringField;
    IbDtstTabelaLOGO: TBlobField;
    IbDtstTabelaTLG_TIPO: TSmallintField;
    IbDtstTabelaLOG_COD: TIntegerField;
    IbDtstTabelaBAI_COD: TIntegerField;
    IbDtstTabelaCID_COD: TIntegerField;
    IbDtstTabelaEST_COD: TSmallintField;
    IbDtstTabelaLOGRADOURO: TIBStringField;
    IbDtstTabelaBAIRRO: TIBStringField;
    IbDtstTabelaEMAIL: TIBStringField;
    IbDtstTabelaHOME_PAGE: TIBStringField;
    IbDtstTabelaCHAVE_ACESSO_NFE: TIBStringField;
    dbPessoaFisica: TDBCheckBox;
    lblCNPJ: TLabel;
    dbCNPJ: TDBEdit;
    lblRazao: TLabel;
    dbRazao: TDBEdit;
    lblFantasia: TLabel;
    dbFantasia: TDBEdit;
    lblIE: TLabel;
    dbIE: TDBEdit;
    lblIM: TLabel;
    dbIM: TDBEdit;
    GroupBox1: TGroupBox;
    lblCidade: TLabel;
    dbCidade: TRxDBComboEdit;
    Bevel5: TBevel;
    lblEstado: TLabel;
    dbEstado: TRxDBComboEdit;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    tbsParametros: TTabSheet;
    lblBairro: TLabel;
    dbBairro: TRxDBComboEdit;
    lblLogradouro: TLabel;
    dbLogradouro: TRxDBComboEdit;
    lblCEP: TLabel;
    dbCEP: TDBEdit;
    lblNumero: TLabel;
    dbNumero: TDBEdit;
    lblComplemento: TLabel;
    dbComplemento: TDBEdit;
    lblFone1: TLabel;
    dbFone1: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblHome: TLabel;
    dbHome: TDBEdit;
    IbDtstTabelaPAIS_ID: TIBStringField;
    lblPais: TLabel;
    dbPais: TRxDBComboEdit;
    lblChave: TLabel;
    dbChave: TDBEdit;
    IbDtstTabelaEST_NOME: TIBStringField;
    IbDtstTabelaCID_NOME: TIBStringField;
    IbDtstTabelaPAIS_NOME: TIBStringField;
    dbLogo: TDBImage;
    ppmLogo: TPopupMenu;
    ppmCarregarImagem: TMenuItem;
    ppmLimparImagem: TMenuItem;
    opnDialogImage: TOpenPictureDialog;
    IbDtstTabelaTIPO_REGIME_NFE: TSmallintField;
    IbDtstTabelaSERIE_NFE: TSmallintField;
    IbDtstTabelaNUMERO_NFE: TIntegerField;
    tblTipoRegimeNFe: TIBTable;
    dtsTipoRegimeNFe: TDataSource;
    lblTipoRegime: TLabel;
    dbTipoRegime: TDBLookupComboBox;
    lblSerieNFe: TLabel;
    dbSerieNFe: TDBEdit;
    lblNumeroNFe: TLabel;
    dbNumeroNFe: TDBEdit;
    IbDtstTabelaLOTE_ANO_NFE: TSmallintField;
    IbDtstTabelaLOTE_NUM_NFE: TIntegerField;
    lblLoteAno: TLabel;
    dbLoteAno: TDBEdit;
    lblLoteNumero: TLabel;
    dbLoteNumero: TDBEdit;
    lblCNAE: TLabel;
    dbCNAE: TDBEdit;
    IbDtstTabelaCNAE: TIBStringField;
    tblSegmento: TIBTable;
    dtsSegmento: TDataSource;
    IbDtstTabelaSEGMENTO: TSmallintField;
    lblSegmento: TLabel;
    dbSegmento: TDBLookupComboBox;
    IbDtstTabelaFONE2: TIBStringField;
    lblFone2: TLabel;
    dbFone2: TDBEdit;
    IbDtstTabelaUSUARIO: TIBStringField;
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
    procedure ppmCarregarImagemClick(Sender: TObject);
    procedure ppmLimparImagemClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeEmpresa: TfrmGeEmpresa;

  procedure MostrarTabelaEmpresas(const AOwner : TComponent);

implementation

uses UDMBusiness, UGeBairro, UGeCidade, UGeDistrito, UGeEstado,
  UGeLogradouro, DateUtils, ChkDgVer, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaEmpresas(const AOwner : TComponent);
var
  frm : TfrmGeEmpresa;
begin
  frm := TfrmGeEmpresa.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeEmpresa.FormCreate(Sender: TObject);
begin
  { DONE -oIsaque -cEmpresa : 22/05/2014 - Inserção automática do segmento INDÚSTRIA para atender meu novo cliente }

  RegistrarSegmentos(SEGMENTO_PADRAO_ID,          SEGMENTO_PADRAO_DS);
  RegistrarSegmentos(SEGMENTO_VAREJO_ATACADO_ID,  SEGMENTO_VAREJO_ATACADO_DS);
  RegistrarSegmentos(SEGMENTO_MERCADO_CARRO_ID,   SEGMENTO_MERCADO_CARRO_DS);
  RegistrarSegmentos(SEGMENTO_SERVICOS_ID,        SEGMENTO_SERVICOS_DS);
  RegistrarSegmentos(SEGMENTO_VAREJO_SERVICOS_ID, SEGMENTO_VAREJO_SERVICOS_DS);
  RegistrarSegmentos(SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_METAL_DS);
  RegistrarSegmentos(SEGMENTO_INDUSTRIA_GERAL_ID, SEGMENTO_INDUSTRIA_GERAL_DS);

  inherited;

  tblTipoRegimeNFe.Open;
  tblSegmento.Open;

  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbPessoaFisica;

  NomeTabela     := 'TBEMPRESA';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'Rzsoc';

  UpdateGenerator;

  pgcMaisDados.ActivePageIndex := 0;
end;

procedure TfrmGeEmpresa.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbHome ) then
      pgcMaisDados.SelectNextPage(False);
  end;
end;

procedure TfrmGeEmpresa.dbEstadoButtonClick(Sender: TObject);
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

procedure TfrmGeEmpresa.dbCidadeButtonClick(Sender: TObject);
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
      IbDtstTabelaCIDADE.AsString   := sCidade + ' (' + IbDtstTabelaUF.AsString + ')';
    end;
end;

procedure TfrmGeEmpresa.dbBairroButtonClick(Sender: TObject);
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
      IbDtstTabelaBAIRRO.AsString   := sBairro;
    end;
end;

procedure TfrmGeEmpresa.dbLogradouroButtonClick(Sender: TObject);
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

procedure TfrmGeEmpresa.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaPESSOA_FISICA.AsInteger := 0;
  IbDtstTabelaPAIS_ID.AsString        := GetPaisIDDefault;
  IbDtstTabelaPAIS_NOME.AsString      := GetPaisNomeDefault;
  
  IbDtstTabelaSERIE_NFE.Value    := 1;
  IbDtstTabelaNUMERO_NFE.Value   := 0;
  IbDtstTabelaLOTE_ANO_NFE.Value := YearOf(Date);
  IbDtstTabelaLOTE_NUM_NFE.Value := 0;
  IbDtstTabelaSEGMENTO.Value     := SEGMENTO_PADRAO_ID;
end;

procedure TfrmGeEmpresa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  ppmCarregarImagem.Enabled := (IbDtstTabela.State in [dsEdit, dsInsert]);
  ppmLimparImagem.Enabled   := (IbDtstTabela.State in [dsEdit, dsInsert]);

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
  begin
    pgcMaisDados.ActivePageIndex := 0;
    
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; ';
  end
  else
    IbDtstTabelaCNPJ.EditMask := '';
end;

procedure TfrmGeEmpresa.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ( Field = IbDtstTabela.FieldByName('PESSOA_FISICA') ) then
    if ( IbDtstTabelaPESSOA_FISICA.AsInteger = 1 ) then
      IbDtstTabelaCNPJ.EditMask := '999.999.999-99;0; '
    else
      IbDtstTabelaCNPJ.EditMask := '99.999.999/9999-99;0; '
end;

procedure TfrmGeEmpresa.btbtnSalvarClick(Sender: TObject);
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

    if ( not ChkInscEstadual(Trim(IbDtstTabelaIE.AsString), Trim(IbDtstTabelaUF.AsString)) ) then
    begin
      ShowWarning('Favor informar uma Inscrição Estadual válida.');
      Abort;
    end;
  end;

  inherited;
end;

procedure TfrmGeEmpresa.ppmCarregarImagemClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( opnDialogImage.Execute ) then
      IbDtstTabelaLOGO.LoadFromFile( opnDialogImage.FileName );
end;

procedure TfrmGeEmpresa.ppmLimparImagemClick(Sender: TObject);
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    IbDtstTabelaLOGO.Clear;
end;

procedure TfrmGeEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if ( IbDtstTabela.State = dsEdit ) then
  begin
    if ( IbDtstTabelaSERIE_NFE.IsNull ) then
      IbDtstTabelaSERIE_NFE.Value    := 1;

    if ( IbDtstTabelaNUMERO_NFE.IsNull ) then
      IbDtstTabelaNUMERO_NFE.Value   := 0;

    if ( IbDtstTabelaLOTE_ANO_NFE.IsNull ) then
      IbDtstTabelaLOTE_ANO_NFE.Value := YearOf(Date);

    if ( IbDtstTabelaLOTE_NUM_NFE.IsNull ) then
      IbDtstTabelaLOTE_NUM_NFE.Value := 0;
  end;
end;

procedure TfrmGeEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

initialization
  FormFunction.RegisterForm('frmGeEmpresa', TfrmGeEmpresa);

end.
