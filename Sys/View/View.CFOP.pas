unit View.CFOP;

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

  Data.DB,
  Datasnap.DBClient,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxImageComboBox,
  cxDBEdit,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  UConstantesDGE;

type
  TViewCFOP = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbResumido: TDBEdit;
    lblEspecificacao: TLabel;
    dbEspecificacao: TDBMemo;
    GrpBxParametros: TGroupBox;
    dbAlteraCustoEntrada: TDBCheckBox;
    DtsCST: TDataSource;
    lblCSTEntrada: TLabel;
    dbCSTEntrada: TDBLookupComboBox;
    lblCSTSaida: TLabel;
    dbCSTSaida: TDBLookupComboBox;
    lblInformacaoFisco: TLabel;
    dbInformacaoFisco: TDBEdit;
    dbCfopDevolucao: TDBCheckBox;
    dbCfopGerarTitulo: TDBCheckBox;
    dbCfopGerarDuplicata: TDBCheckBox;
    dbCfopRemessa: TDBCheckBox;
    grpBxCfopRetorno: TGroupBox;
    lblCfopRetornoDentro: TLabel;
    dbCfopRetornoDentro: TDBEdit;
    lblCfopRetornoFora: TLabel;
    dbCfopRetornoFora: TDBEdit;
    lblTipo: TLabel;
    dbTipo: TcxDBImageComboBox;
    rgpTipo: TRadioGroup;
    Bevel5: TBevel;
    dbAlteraEstoqueEntradaSaida: TDBCheckBox;
    lblInformeRemessa: TLabel;
    dbCfopFaturarRemessa: TDBCheckBox;
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerCST : IControllerCustom;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCFOP

  Views:

  Procedure:
  - GET_CST_NORMAL
*)

var
  ViewCFOP: TViewCFOP;

  procedure MostrarTabelaCFOP(const AOwner : TComponent);

  function SelecionarCFOP(const AOwner : TComponent; aTipo : TTipoCFOP;  var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMRecursos,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper;

{$R *.dfm}

procedure MostrarTabelaCFOP(const AOwner : TComponent);
var
  frm : TViewCFOP;
begin
  frm := TViewCFOP.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCFOP(const AOwner : TComponent;  aTipo : TTipoCFOP;  var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewCFOP;
  whr : String;
begin
  frm := TViewCFOP.Create(AOwner);
  try
    if (aTipo <> TTipoCFOP.tcfopADefinir) then
    begin
      whr := 'c.Cfop_tipo = ' + Ord(aTipo).ToString;
      frm.rgpTipo.ItemIndex := Ord(aTipo);
      frm.rgpTipo.Enabled   := False;
    end;

    frm.FController.DAO.ClearWhere;
    frm.FController.DAO.Where(whr);
    frm.FController.DAO.Open;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewCFOP.FormCreate(Sender: TObject);
begin
  FControllerCST := TControllerFactory.New.CST;
  FController    := TControllerFactory.New.CFOP;

  inherited;
  RotinaID         := ROTINA_CAD_CFOP_ID;
  ControlFirstEdit := dbCodigo;

  DisplayFormatCodigo := '0000';
  NomeTabela     := 'TBCFOP';
  CampoCodigo    := 'c.CFOP_COD';
  CampoDescricao := 'c.CFOP_DESCRICAO';
  CampoOrdenacao := 'c.CFOP_COD';

  Tabela
    .Display('Cfop_cod',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('Cfop_resumido', 'Descrição resumida',   True)
    .Display('Cfop_tipo',  'Tipo',  TAlignment.taLeftJustify,  True)
    .Display('Cfop_descricao',  'Descrição completa', True);

  AbrirTabelaAuto := True;
  TController(FControllerCST).LookupComboBox(dbCSTEntrada, DtsCST, 'Cfop_cst_padrao_entrada', 'codigo', 'descricao');
  TController(FControllerCST).LookupComboBox(dbCSTSaida,   DtsCST, 'Cfop_cst_padrao_saida', 'codigo', 'descricao');

  lblInformeRemessa.Visible := (gSistema.Codigo = SISTEMA_GESTAO_OPME);
  if lblInformeRemessa.Visible then
    dbCfopRemessa.Caption := 'CFOP de Remessa *';
end;

procedure TViewCFOP.btbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if not btbtnAlterar.Enabled then
    with DtSrcTabela.DataSet do
    begin
      if FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').IsNull then
        FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').AsInteger := 1;
    end;
end;

procedure TViewCFOP.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional := EmptyStr;

  if ( rgpTipo.ItemIndex > 0 ) then
    WhereAdditional := '(c.Cfop_tipo = ' + IntToStr(rgpTipo.ItemIndex) + ')';

  inherited;
end;

procedure TViewCFOP.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  (*

  Regra 1 : CFOP marcado como "Remessa" não gera movimentaçao financeira.
  Regra 2 : Apenas CFOPs de Remessa terão CFOPs de Retorno
  Regra 3 : CFOP marcado como "Faturar Remessa" gera movimentaçao financeira.

  *)
  inherited;

  with DtSrcTabela.DataSet do
  begin
    if (Field = FieldByName('CFOP_REMESSA')) then
    begin
      // Regra 1
      if (State in [dsEdit, dsInsert]) and (FieldByName('CFOP_REMESSA').AsInteger = 1) then
      begin
        FieldByName('CFOP_GERAR_TITULO').AsInteger    := 0;
        FieldByName('CFOP_GERAR_DUPLICATA').AsInteger := 0;
        FieldByName('CFOP_FATURAR_REMESSA').AsInteger := 0;
      end
      else
      // Regra 2
      if (State in [dsEdit, dsInsert]) and (FieldByName('CFOP_REMESSA').AsInteger = 0) then
      begin
        FieldByName('CFOP_RETORNO_INTERNO').Clear;
        FieldByName('CFOP_RETORNO_EXTERNO').Clear;
      end;

      grpBxCfopRetorno.Enabled := (FieldByName('CFOP_REMESSA').AsInteger = 1);
    end
    else
    if (Field = FieldByName('CFOP_FATURAR_REMESSA')) then
    begin
      // Regra 3
      if (State in [dsEdit, dsInsert]) and (FieldByName('CFOP_FATURAR_REMESSA').AsInteger = 1) then
      begin
        FieldByName('CFOP_GERAR_TITULO').AsInteger    := 1;
        FieldByName('CFOP_GERAR_DUPLICATA').AsInteger := 1;
        FieldByName('CFOP_REMESSA').AsInteger         := 0;
      end;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewCFOP', TViewCFOP);

end.

