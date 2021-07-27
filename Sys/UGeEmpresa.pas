unit UGeEmpresa;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, Menus, ExtDlgs, cxGraphics, JvDBControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxButtons, JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, JvMaskEdit;

type
  TfrmGeEmpresa = class(TfrmGrPadraoCadastro)
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
    Bevel5: TBevel;
    lblEstado: TLabel;
    pgcMaisDados: TPageControl;
    tbsContato: TTabSheet;
    tbsInforme: TTabSheet;
    lblBairro: TLabel;
    lblLogradouro: TLabel;
    lblCEP: TLabel;
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
    lblPais: TLabel;
    dbLogo: TDBImage;
    ppmLogo: TPopupMenu;
    ppmCarregarImagem: TMenuItem;
    ppmLimparImagem: TMenuItem;
    opnDialogImage: TOpenPictureDialog;
    dtsTipoRegimeNFe: TDataSource;
    lblTipoRegime: TLabel;
    dbTipoRegime: TDBLookupComboBox;
    lblCNAE: TLabel;
    dbCNAE: TDBEdit;
    dtsSegmento: TDataSource;
    lblFone2: TLabel;
    dbFone2: TDBEdit;
    dbEstado: TJvDBComboEdit;
    dbCidade: TJvDBComboEdit;
    dbBairro: TJvDBComboEdit;
    dbLogradouro: TJvDBComboEdit;
    dbPais: TJvDBComboEdit;
    fdQrySegmento: TFDQuery;
    fdQryTipoRegimeNFe: TFDQuery;
    lblSegmento: TLabel;
    dbSegmento: TDBLookupComboBox;
    dbAtiva: TDBCheckBox;
    lblRegistroDesativado: TLabel;
    dbCEP: TJvDBMaskEdit;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaPESSOA_FISICA: TSmallintField;
    fdQryTabelaCNPJ: TStringField;
    fdQryTabelaRZSOC: TStringField;
    fdQryTabelaNMFANT: TStringField;
    fdQryTabelaIE: TStringField;
    fdQryTabelaIM: TStringField;
    fdQryTabelaCNAE: TStringField;
    fdQryTabelaSEGMENTO: TSmallintField;
    fdQryTabelaENDER: TStringField;
    fdQryTabelaCOMPLEMENTO: TStringField;
    fdQryTabelaNUMERO_END: TStringField;
    fdQryTabelaBAIRRO: TStringField;
    fdQryTabelaCEP: TStringField;
    fdQryTabelaCIDADE: TStringField;
    fdQryTabelaUF: TStringField;
    fdQryTabelaFONE: TStringField;
    fdQryTabelaFONE2: TStringField;
    fdQryTabelaLOGO: TBlobField;
    fdQryTabelaTLG_TIPO: TSmallintField;
    fdQryTabelaLOG_COD: TIntegerField;
    fdQryTabelaBAI_COD: TIntegerField;
    fdQryTabelaCID_COD: TIntegerField;
    fdQryTabelaEST_COD: TSmallintField;
    fdQryTabelaEMAIL: TStringField;
    fdQryTabelaHOME_PAGE: TStringField;
    fdQryTabelaCHAVE_ACESSO_NFE: TStringField;
    fdQryTabelaTIPO_REGIME_NFE: TSmallintField;
    fdQryTabelaSERIE_NFE: TSmallintField;
    fdQryTabelaNUMERO_NFE: TIntegerField;
    fdQryTabelaLOTE_ANO_NFE: TSmallintField;
    fdQryTabelaLOTE_NUM_NFE: TIntegerField;
    fdQryTabelaCARTA_CORRECAO_NFE: TIntegerField;
    fdQryTabelaSERIE_NFCE: TSmallintField;
    fdQryTabelaNUMERO_NFCE: TIntegerField;
    fdQryTabelaPAIS_ID: TStringField;
    fdQryTabelaUSUARIO: TStringField;
    fdQryTabelaATIVA: TSmallintField;
    fdQryTabelaLOGRADOURO: TStringField;
    fdQryTabelaCID_NOME: TStringField;
    fdQryTabelaEST_NOME: TStringField;
    fdQryTabelaPAIS_NOME: TStringField;
    procedure ProximoCampoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbEstadoButtonClick(Sender: TObject);
    procedure dbCidadeButtonClick(Sender: TObject);
    procedure dbBairroButtonClick(Sender: TObject);
    procedure dbLogradouroButtonClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure ppmCarregarImagemClick(Sender: TObject);
    procedure ppmLimparImagemClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBEMRESA
  - TBSEGMENTO

  Views:
  - VW_TIPO_REGIME_NFE

  Procedures:

*)

var
  frmGeEmpresa: TfrmGeEmpresa;

  procedure MostrarTabelaEmpresas(const AOwner : TComponent);

implementation

uses UDMBusiness, UGeBairro, View.Cidade, View.Distrito, View.Estado,
  View.Logradouro, DateUtils, UConstantesDGE, UGrPadrao;

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
  { DONE -oIsaque -cEmpresa : 11/12/2014 - Inserção dos campos para controle sequencial de NFC-e e CC-e }

  RegistrarSegmentos(SEGMENTO_PADRAO_ID,          SEGMENTO_PADRAO_DS);
  RegistrarSegmentos(SEGMENTO_VAREJO_ATACADO_ID,  SEGMENTO_VAREJO_ATACADO_DS);
  RegistrarSegmentos(SEGMENTO_MERCADO_CARRO_ID,   SEGMENTO_MERCADO_CARRO_DS);
  RegistrarSegmentos(SEGMENTO_SERVICOS_ID,        SEGMENTO_SERVICOS_DS);
  RegistrarSegmentos(SEGMENTO_VAREJO_SERVICOS_ID, SEGMENTO_VAREJO_SERVICOS_DS);
  RegistrarSegmentos(SEGMENTO_INDUSTRIA_METAL_ID, SEGMENTO_INDUSTRIA_METAL_DS);
  RegistrarSegmentos(SEGMENTO_INDUSTRIA_GERAL_ID, SEGMENTO_INDUSTRIA_GERAL_DS);

  inherited;

  CarregarLista(fdQryTipoRegimeNFe);
  CarregarLista(fdQrySegmento);

  RotinaID         := ROTINA_CAD_EMPRESA_ID;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbPessoaFisica;

  NomeTabela     := 'TBEMPRESA';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'Rzsoc';
  CampoOrdenacao := 'Rzsoc';
  CampoCadastroAtivo := 'ATIVA';

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

procedure TfrmGeEmpresa.dbCidadeButtonClick(Sender: TObject);
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
        FieldByName('CIDADE').AsString   := sCidade + ' (' + FieldByName('UF').AsString + ')';
      end;
  end;
end;

procedure TfrmGeEmpresa.dbBairroButtonClick(Sender: TObject);
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
        FieldByName('BAIRRO').AsString   := sBairro;
      end;
  end;
end;

procedure TfrmGeEmpresa.dbLogradouroButtonClick(Sender: TObject);
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

procedure TfrmGeEmpresa.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    ppmCarregarImagem.Enabled := (State in [dsEdit, dsInsert]);
    ppmLimparImagem.Enabled   := (State in [dsEdit, dsInsert]);

    if ( State in [dsEdit, dsInsert] ) then
    begin
      pgcMaisDados.ActivePageIndex := 0;

      if ( FieldByName('PESSOA_FISICA').AsInteger = 1 ) then
        FieldByName('CNPJ').EditMask := '000\.000\.000\-00;0; '
      else
        FieldByName('CNPJ').EditMask := '00\.000\.000\/0000\-00;0; ';
    end
    else
      FieldByName('CNPJ').EditMask := '';
  end;
end;

procedure TfrmGeEmpresa.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('PESSOA_FISICA').AsInteger := 0;
    FieldByName('PAIS_ID').AsString        := GetPaisIDDefault;
    FieldByName('PAIS_NOME').AsString      := GetPaisNomeDefault;

    FieldByName('SERIE_NFE').AsInteger    := 1;
    FieldByName('NUMERO_NFE').AsInteger   := 0;
    FieldByName('SERIE_NFCE').AsInteger   := 1;
    FieldByName('NUMERO_NFCE').AsInteger  := 0;
    FieldByName('LOTE_ANO_NFE').AsInteger := YearOf(Date);
    FieldByName('LOTE_NUM_NFE').AsInteger := 0;
    FieldByName('CARTA_CORRECAO_NFE').AsInteger := 0;
    FieldByName('SEGMENTO').AsInteger     := SEGMENTO_PADRAO_ID;
    FieldByName('ATIVA').AsInteger        := FLAG_SIM;
  end;
end;

procedure TfrmGeEmpresa.DtSrcTabelaDataChange(Sender: TObject;
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

procedure TfrmGeEmpresa.btbtnSalvarClick(Sender: TObject);
begin
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

      if ( not StrInscricaoEstadual(Trim(FieldByName('IE').AsString), Trim(FieldByName('UF').AsString)) ) then
      begin
        ShowWarning('Favor informar uma Inscrição Estadual válida.');
        Abort;
      end;
    end;

    if FieldByName('PAIS_ID').IsNull then
    begin
      FieldByName('PAIS_ID').AsString   := GetPaisIDDefault;
      FieldByName('PAIS_NOME').AsString := GetPaisNomeDefault;
    end;
  end;

  inherited;
end;

procedure TfrmGeEmpresa.ppmCarregarImagemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( opnDialogImage.Execute ) then
        TBlobField(FieldByName('LOGO')).LoadFromFile( opnDialogImage.FileName );
end;

procedure TfrmGeEmpresa.ppmLimparImagemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      FieldByName('LOGO').Clear;
end;

procedure TfrmGeEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  with DtSrcTabela.DataSet do
    if ( State = dsEdit ) then
    begin
      if ( FieldByName('SERIE_NFE').IsNull ) then
        FieldByName('SERIE_NFE').Value    := 1;

      if ( FieldByName('NUMERO_NFE').IsNull ) then
        FieldByName('NUMERO_NFE').Value   := 0;

      if ( FieldByName('LOTE_ANO_NFE').IsNull ) then
        FieldByName('LOTE_ANO_NFE').Value := YearOf(Date);

      if ( FieldByName('LOTE_NUM_NFE').IsNull ) then
        FieldByName('LOTE_NUM_NFE').Value := 0;
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
