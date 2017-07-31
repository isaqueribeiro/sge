unit UGeContaCorrente;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, dblookup, IBQuery, IBTable,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeContaCorrente = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCODIGO: TIntegerField;
    IbDtstTabelaDESCRICAO: TIBStringField;
    IbDtstTabelaTIPO: TSmallintField;
    IbDtstTabelaCONTA_BANCO_BOLETO: TSmallintField;
    IbDtstTabelaBANCO: TIBStringField;
    lblBanco: TLabel;
    dbTipo: TDBRadioGroup;
    IbDtstTabelaTIPO_DESC: TIBStringField;
    IbDtstTabelaEMPRESA: TIBStringField;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    dbBanco: TJvDBComboEdit;
    IbDtstTabelaBCO_CODIGO_CC: TSmallintField;
    fdQryEmpresa: TFDQuery;
    IbDtstTabelaCODIGO_CONTABIL: TIBStringField;
    lblCodigoContabil: TLabel;
    dbCodigoContabil: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbBancoButtonClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
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
  frmGeContaCorrente: TfrmGeContaCorrente;

  procedure MostrarTabelaContaCorrente(const AOwner : TComponent);
  function SelecionarContaCorrente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness, UGeBancos, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaContaCorrente(const AOwner : TComponent);
var
  frm : TfrmGeContaCorrente;
begin
  frm := TfrmGeContaCorrente.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarContaCorrente(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeContaCorrente;
begin
  frm := TfrmGeContaCorrente.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeContaCorrente.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID         := ROTINA_CAD_CONTA_CORRENTE_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '000';
  NomeTabela     := 'TBCONTA_CORRENTE';
  CampoCodigo    := 'Codigo';
  CampoDescricao := 'Descricao';

  btbtnIncluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnAlterar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnExcluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnCancelar.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);
  btbtnSalvar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND]);

  CarregarLista(fdQryEmpresa);
end;

procedure TfrmGeContaCorrente.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCODIGO.Value  := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaTIPO.Value    := CONTA_CORRENTE_TIPO_CAIXA;
  IbDtstTabelaEMPRESA.Value := gUsuarioLogado.Empresa;
  IbDtstTabelaBCO_CODIGO_CC.Clear;
  IbDtstTabelaCONTA_BANCO_BOLETO.Clear;
  IbDtstTabelaCODIGO_CONTABIL.Clear;
end;

function TfrmGeContaCorrente.PermitirSalvarContaCaixa: Boolean;
begin
  Result := (IbDtstTabelaTIPO.AsInteger = 2); // Conta Banco não é analisada
  if not Result then
    with DMBusiness, fdQryBusca do
    begin
      if fdQryBusca.Active then
        fdQryBusca.Close;

      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  codigo');
      SQL.Add('from TBCONTA_CORRENTE');
      SQL.Add('where empresa = ' + QuotedStr(IbDtstTabelaEMPRESA.AsString));
      SQL.Add('  and tipo    = ' + IbDtstTabelaTIPO.AsString);
      SQL.Add('  and codigo <> ' + IbDtstTabelaCODIGO.AsString);

      fdQryBusca.Open;

      Result := (fdQryBusca.RecordCount = 0);

      if not Result then
        ShowWarning('Não pode haver mais de uma Conta Corrente do tipo Caixa para a mesma empresa!');
    end;
end;

procedure TfrmGeContaCorrente.btbtnSalvarClick(Sender: TObject);
begin
  IbDtstTabelaCONTA_BANCO_BOLETO.Required := (IbDtstTabelaTIPO.AsInteger = CONTA_CORRENTE_TIPO_BANCO);

  IbDtstTabelaTIPO_DESC.AsString := dbTipo.Items[ dbTipo.ItemIndex ];

  if not PermitirSalvarContaCaixa then
    Abort;

  inherited;
end;

procedure TfrmGeContaCorrente.btnFiltrarClick(Sender: TObject);
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

procedure TfrmGeContaCorrente.dbBancoButtonClick(Sender: TObject);
var
  iCodigoUnico,
  iCodigo     : Integer;
  sNome    ,
  sAgencia ,
  sConta   ,
  sEmpresa : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarBanco(Self, iCodigoUnico, iCodigo, sNome, sAgencia, sConta, sEmpresa) ) then
    begin
      IbDtstTabelaBCO_CODIGO_CC.AsInteger      := iCodigoUnico;
      IbDtstTabelaCONTA_BANCO_BOLETO.AsInteger := iCodigo;
      IbDtstTabelaBANCO.AsString   := sNome + ' AG.: ' + sAgencia + ' C/C.: ' + sConta;
      IbDtstTabelaEMPRESA.AsString := sEmpresa
    end;
end;

procedure TfrmGeContaCorrente.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  if ( Field = IbDtstTabela.FieldByName('TIPO') ) then
  begin
    dbBanco.Button.Enabled := (IbDtstTabela.FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
    dbEmpresa.ReadOnly     := (IbDtstTabela.FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeContaCorrente', TfrmGeContaCorrente);

end.
