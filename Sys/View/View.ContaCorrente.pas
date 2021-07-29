unit View.ContaCorrente;

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

  JvExMask,
  JvToolEdit,
  JvDBControls,

  View.PadraoCadastro,
  SGE.Controller.Interfaces;

type
  TViewContaCorrente = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblBanco: TLabel;
    dbTipo: TDBRadioGroup;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    dbBanco: TJvDBComboEdit;
    lblCodigoContabil: TLabel;
    dbCodigoContabil: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbBancoButtonClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FControllerEmpresaView : IControllerCustom;
    function PermitirSalvarContaCaixa : Boolean;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCONTA_CORRENTE
  - TBBANCO_BOLETO

  Views:
  - VW_EMPRESA
  - VW_CONDICAOPAGTO

  Procedures:

*)

var
  ViewContaCorrente: TViewContaCorrente;

  procedure MostrarTabelaContaCorrente(const AOwner : TComponent);
  function SelecionarContaCorrente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory,
  SGE.Controller,
  SGE.Controller.Helper,
  UGeBancos;

{$R *.dfm}

procedure MostrarTabelaContaCorrente(const AOwner : TComponent);
var
  frm : TViewContaCorrente;
begin
  frm := TViewContaCorrente.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarContaCorrente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewContaCorrente;
begin
  frm := TViewContaCorrente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TViewContaCorrente.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.ContaCorrente;
  FControllerEmpresaView  := TControllerFactory.New.EmpresaView;

  inherited;
  RotinaID         := ROTINA_CAD_CONTA_CORRENTE_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBCONTA_CORRENTE';
  CampoCodigo    := 'cc.Codigo';
  CampoDescricao := 'cc.Descricao';
  CampoOrdenacao := 'cc.Descricao';

  btbtnIncluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnAlterar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnExcluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnCancelar.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnSalvar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  Tabela
    .Display('Codigo',  'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('Descricao', 'Descrição', True)
    .Display('Conta_banco_boleto', 'Banco', True)
    .Display('Tipo', 'Tipo', True);

  AbrirTabelaAuto := True;
  TController(FControllerEmpresaView).LookupComboBox(dbEmpresa, dtsEmpresa, 'empresa', 'cnpj', 'razao');
end;

function TViewContaCorrente.PermitirSalvarContaCaixa: Boolean;
var
  aContaCorrente : IControllerCustom;
begin
  Result := (DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger = 2); // Conta Banco não é analisada
  if not Result then
  begin
    aContaCorrente := TControllerFactory.New.ContaCorrente;
    aContaCorrente.DAO.ClearWhere;
    aContaCorrente.DAO
      .Where('cc.codigo != ' + DtSrcTabela.DataSet.FieldByName('CODIGO').AsString)
      .Where('cc.empresa = ' + DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString)
      .Where('cc.tipo = ' + DtSrcTabela.DataSet.FieldByName('TIPO').AsString)
      .Open;

    Result := aContaCorrente.DAO.DataSet.IsEmpty;

    if not Result then
      ShowWarning('Não pode haver mais de uma Conta Corrente do tipo Caixa para a mesma empresa!');
  end;
end;

procedure TViewContaCorrente.btbtnSalvarClick(Sender: TObject);
begin
  with DtSrcTabela.DataSet do
  begin
    FieldByName('CONTA_BANCO_BOLETO').Required := (FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
    FieldByName('TIPO_DESC').AsString          := dbTipo.Items[ dbTipo.ItemIndex ];
  end;

  if not PermitirSalvarContaCaixa then
    Abort;

  inherited;
end;

procedure TViewContaCorrente.btnFiltrarClick(Sender: TObject);
begin
  WhereAdditional :=
    '((cc.empresa in ( ' +
    '    Select      ' +
    '      e.cnpj    ' +
    '    from VW_EMPRESA e ' +
    '  )) or (cc.tipo = 2) ' +
    '  and (               ' +
    '    cc.bco_codigo_cc in ( ' +
    '      Select             ' +
    '        bb.bco_codigo    ' +
    '      from TBBANCO_BOLETO bb                             ' +
    '        inner join VW_EMPRESA e on (e.cnpj = bb.empresa) ' +
    '    ) ' +
    '  ))  ';

  inherited;
end;

procedure TViewContaCorrente.dbBancoButtonClick(Sender: TObject);
var
  iCodigoUnico,
  iCodigo     : Integer;
  sNome    ,
  sAgencia ,
  sConta   ,
  sEmpresa : String;
begin
  with DtSrcTabela.DataSet do
  begin
    if ( State in [dsEdit, dsInsert] ) then
      if ( SelecionarBanco(Self, iCodigoUnico, iCodigo, sNome, sAgencia, sConta, sEmpresa) ) then
      begin
        FieldByName('BCO_CODIGO_CC').AsInteger      := iCodigoUnico;
        FieldByName('CONTA_BANCO_BOLETO').AsInteger := iCodigo;
        FieldByName('BANCO').AsString   := Trim(sNome + ' AG.: ' + sAgencia + ' C/C.: ' + sConta);
        FieldByName('EMPRESA').AsString := sEmpresa
      end;
  end;
end;

procedure TViewContaCorrente.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  with DtSrcTabela.DataSet do
    if ( Field = FieldByName('TIPO') ) then
    begin
      dbBanco.Button.Enabled := (FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
      dbEmpresa.ReadOnly     := (FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
    end;
end;

procedure TViewContaCorrente.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('CODIGO').AsInteger := GetNextID(NomeTabela, 'CODIGO');
    FieldByName('TIPO').AsInteger   := CONTA_CORRENTE_TIPO_CAIXA;
    FieldByName('EMPRESA').AsString := gUsuarioLogado.Empresa;
    FieldByName('BCO_CODIGO_CC').Clear;
    FieldByName('CONTA_BANCO_BOLETO').Clear;
    FieldByName('CODIGO_CONTABIL').Clear;
  end;
end;

initialization
  FormFunction.RegisterForm('ViewContaCorrente', TViewContaCorrente);

end.
