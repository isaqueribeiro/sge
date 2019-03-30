unit UGeContaCorrente;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, Mask, DBCtrls,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, IBQuery, IBTable,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeContaCorrente = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblBanco: TLabel;
    dbTipo: TDBRadioGroup;
    dtsEmpresa: TDataSource;
    lblEmpresa: TLabel;
    dbEmpresa: TDBLookupComboBox;
    dbBanco: TJvDBComboEdit;
    fdQryEmpresa: TFDQuery;
    lblCodigoContabil: TLabel;
    dbCodigoContabil: TDBEdit;
    fdQryTabelaCODIGO: TIntegerField;
    fdQryTabelaDESCRICAO: TStringField;
    fdQryTabelaTIPO: TSmallintField;
    fdQryTabelaBCO_CODIGO_CC: TSmallintField;
    fdQryTabelaEMPRESA: TStringField;
    fdQryTabelaCONTA_BANCO_BOLETO: TSmallintField;
    fdQryTabelaCODIGO_CONTABIL: TStringField;
    fdQryTabelaTIPO_DESC: TStringField;
    fdQryTabelaBANCO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure dbBancoButtonClick(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
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
  CampoCodigo    := 'cc.Codigo';
  CampoDescricao := 'cc.Descricao';
  CampoOrdenacao := 'cc.Descricao';

  btbtnIncluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnAlterar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnExcluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnCancelar.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnSalvar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);

  CarregarLista(fdQryEmpresa);
end;

function TfrmGeContaCorrente.PermitirSalvarContaCaixa: Boolean;
begin
  Result := (DtSrcTabela.DataSet.FieldByName('TIPO').AsInteger = 2); // Conta Banco não é analisada
  if not Result then
    with DMBusiness, fdQryBusca do
    begin
      if fdQryBusca.Active then
        fdQryBusca.Close;

      SQL.Clear;
      SQL.Add('Select');
      SQL.Add('  codigo');
      SQL.Add('from TBCONTA_CORRENTE');
      SQL.Add('where empresa = ' + QuotedStr(DtSrcTabela.DataSet.FieldByName('EMPRESA').AsString));
      SQL.Add('  and tipo    = ' + DtSrcTabela.DataSet.FieldByName('TIPO').AsString);
      SQL.Add('  and codigo <> ' + DtSrcTabela.DataSet.FieldByName('CODIGO').AsString);

      fdQryBusca.Open;

      Result := (fdQryBusca.RecordCount = 0);

      if not Result then
        ShowWarning('Não pode haver mais de uma Conta Corrente do tipo Caixa para a mesma empresa!');
    end;
end;

procedure TfrmGeContaCorrente.btbtnSalvarClick(Sender: TObject);
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

procedure TfrmGeContaCorrente.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  with DtSrcTabela.DataSet do
    if ( Field = FieldByName('TIPO') ) then
    begin
      dbBanco.Button.Enabled := (FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
      dbEmpresa.ReadOnly     := (FieldByName('TIPO').AsInteger = CONTA_CORRENTE_TIPO_BANCO);
    end;
end;

procedure TfrmGeContaCorrente.fdQryTabelaNewRecord(DataSet: TDataSet);
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
  FormFunction.RegisterForm('frmGeContaCorrente', TfrmGeContaCorrente);

end.
