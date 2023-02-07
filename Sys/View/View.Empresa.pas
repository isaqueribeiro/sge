unit View.Empresa;

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
  SGE.Controller.Interfaces, dxSkinsDefaultPainters;

type
  TViewEmpresa = class(TViewPadraoCadastro)
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
    lblSegmento: TLabel;
    dbSegmento: TDBLookupComboBox;
    dbAtiva: TDBCheckBox;
    lblRegistroDesativado: TLabel;
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
    procedure ppmCarregarImagemClick(Sender: TObject);
    procedure ppmLimparImagemClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerSegmento       ,
    FControllerTipoRegimeView : IControllerCustom;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBEMRESA
  - TBSEGMENTO
  - TBTIPO_LOGRADOURO
  - TBLOGRADOURO
  - TBCIDADE
  - TBESTADO
  - TBPAIS

  Views:
  - VW_TIPO_REGIME_NFE

  Procedures:

*)

var
  ViewEmpresa: TViewEmpresa;

  procedure MostrarTabelaEmpresas(const AOwner : TComponent);

implementation

uses
  System.DateUtils,
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
  UConstantesDGE,
  UGrPadrao;

{$R *.dfm}

procedure MostrarTabelaEmpresas(const AOwner : TComponent);
var
  frm : TViewEmpresa;
begin
  frm := TViewEmpresa.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

procedure TViewEmpresa.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.Empresa;
  FControllerSegmento       := TControllerFactory.New.Segmento;
  FControllerTipoRegimeView := TControllerFactory.New.TipoRegimeView;

  inherited;
  RotinaID         := ROTINA_CAD_EMPRESA_ID;
  AbrirTabelaAuto  := True;
  ControlFirstEdit := dbPessoaFisica;

  DisplayFormatCodigo := '00';
  NomeTabela     := 'TBEMPRESA';
  CampoCodigo    := 'codigo';
  CampoDescricao := 'Rzsoc';
  CampoOrdenacao := 'Rzsoc';
  CampoCadastroAtivo := 'ATIVA';

  pgcMaisDados.ActivePageIndex := 0;

  Tabela
    .Display('CODIGO', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('PESSOA_FISICA', 'Tipo Pessoa', TAlignment.taLeftJustify, True)
    .Display('CNPJ', 'CNPJ', True)
    .Display('RZSOC', 'Razão Social', True)
    .Display('NMFANT', 'Fantasia', True)
    .Display('IE', 'Inscrição Estadual', True)
    .Display('CNAE', 'CNAE Principal', True)
    .Display('EST_COD', 'Estado', True)
    .Display('CID_COD', 'Cidade', True)
    .Display('BAI_COD', 'Bairro', True)
    .Display('CEP', 'CEP', True)
    .Display('LOG_COD', 'Logradouro', True)
    .Display('TIPO_REGIME_NFE', 'Tipo Regime', True)
    .Display('SEGMENTO', 'Segmento', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);

  TController(FControllerSegmento)
    .LookupComboBox(dbSegmento, dtsSegmento, 'Segmento', 'seg_id', 'seg_descricao');
  TController(FControllerTipoRegimeView)
    .LookupComboBox(dbTipoRegime, dtsTipoRegimeNFe, 'Tipo_Regime_nfe', 'codigo', 'descricao');
end;

procedure TViewEmpresa.ProximoCampoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    if ( Sender = dbHome ) then
      pgcMaisDados.SelectNextPage(False);
  end;
end;

procedure TViewEmpresa.dbEstadoButtonClick(Sender: TObject);
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

procedure TViewEmpresa.dbCidadeButtonClick(Sender: TObject);
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

procedure TViewEmpresa.dbBairroButtonClick(Sender: TObject);
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

procedure TViewEmpresa.dbLogradouroButtonClick(Sender: TObject);
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

procedure TViewEmpresa.DtSrcTabelaStateChange(Sender: TObject);
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

procedure TViewEmpresa.DtSrcTabelaDataChange(Sender: TObject;
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

procedure TViewEmpresa.btbtnIncluirClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
    with DtSrcTabela.DataSet do
    begin
      FieldByName('PAIS_ID').AsString        := GetPaisIDDefault;
      FieldByName('PAIS_NOME').AsString      := GetPaisNomeDefault;
    end;
end;

procedure TViewEmpresa.btbtnSalvarClick(Sender: TObject);
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

procedure TViewEmpresa.ppmCarregarImagemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      if ( opnDialogImage.Execute ) then
        TBlobField(FieldByName('LOGO')).LoadFromFile( opnDialogImage.FileName );
end;

procedure TViewEmpresa.ppmLimparImagemClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
    if ( State in [dsEdit, dsInsert] ) then
      FieldByName('LOGO').Clear;
end;

procedure TViewEmpresa.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if (not OcorreuErro) then
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

procedure TViewEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

initialization
  FormFunction.RegisterForm('ViewEmpresa', TViewEmpresa);

end.
