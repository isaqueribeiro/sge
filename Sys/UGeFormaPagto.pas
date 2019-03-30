unit UGeFormaPagto;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB, System.ImageList,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, DBClient, Provider, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeFormaPagto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAcrescimo: TLabel;
    dbAcrescimo: TDBEdit;
    dbDecrementarLimite: TDBCheckBox;
    lblFormaPagtoNCFe: TLabel;
    dbFormaPagtoNCFe: TDBLookupComboBox;
    dtsFormaPagtoNCFe: TDataSource;
    dbFormaPagtoPDV: TDBCheckBox;
    dbgContaCorrente: TDBGrid;
    dtsContaCorrenteLista: TDataSource;
    dspContaCorrenteLista: TDataSetProvider;
    cdsContaCorrenteLista: TClientDataSet;
    cdsContaCorrenteListaSELECIONAR: TIntegerField;
    dbFormaPagtoPDVRelatorio: TDBCheckBox;
    dbAtiva: TDBCheckBox;
    fdQryFormaPagtoNCFe: TFDQuery;
    fdQryContaCorrenteLista: TFDQuery;
    cdsContaCorrenteListaCODIGO: TIntegerField;
    cdsContaCorrenteListaDESCRICAO: TStringField;
    cdsContaCorrenteListaTIPO: TStringField;
    cdsContaCorrenteListaRZSOC: TStringField;
    lblRegistroDesativado: TLabel;
    fdQryTabelaCOD: TSmallintField;
    fdQryTabelaDESCRI: TStringField;
    fdQryTabelaACRESCIMO: TSingleField;
    fdQryTabelaFORMAPAGTO_NFCE: TStringField;
    fdQryTabelaFORMAPAGTO_PDV: TSmallintField;
    fdQryTabelaFORMAPAGTO_PDV_CUPOM_EXTRA: TSmallintField;
    fdQryTabelaDEBITAR_LIMITE_CLIENTE: TSmallintField;
    fdQryTabelaATIVA: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure dbgContaCorrenteDblClick(Sender: TObject);
    procedure dbgContaCorrenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsContaCorrenteListaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CarregarContaCorrente;
  public
    { Public declarations }
    procedure GravarRelacaoFormaConta;
  end;

(*
  Tabelas:
  - TBFORMPAGTO
  - TBCONTA_CORRENTE
  - TBEMPRESA
  - TBFORMPAGTO_CONTACOR

  Views:
  - VW_FORMA_PAGTO_NFC_E

  Procedures:

*)

var
  frmGeFormaPagto: TfrmGeFormaPagto;

  procedure MostrarTabelaFormaPagtos(const AOwner : TComponent);

  function SelecionarFormaPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
  function SelecionarFormaPagtoPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaFormaPagtos(const AOwner : TComponent);
var
  frm : TfrmGeFormaPagto;
begin
  frm := TfrmGeFormaPagto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarFormaPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeFormaPagto;
begin
  frm := TfrmGeFormaPagto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarFormaPagtoPDV(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeFormaPagto;
begin
  frm := TfrmGeFormaPagto.Create(AOwner);
  try
    frm.btbtnIncluir.Visible  := False;
    frm.btbtnAlterar.Visible  := False;
    frm.btbtnExcluir.Visible  := False;
    frm.btbtnCancelar.Visible := False;
    frm.btbtnSalvar.Visible   := False;
    frm.btbtnLista.Visible    := False;

//    frm.WhereAdditional := '(p.FormaPagto_PDV = 1)';
//
//    if (gSistema.Codigo <> SISTEMA_PDV) then
//      frm.WhereAdditional := frm.WhereAdditional + ' and ' +
//        '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário

    frm.WhereAdditional := '(p.FormaPagto_PDV = 1) and ' +
      '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário

    with frm, fdQryTabela do
    begin
      Close;
      SQL.Add('where ' + frm.WhereAdditional);
      SQL.Add('order by p.Cod');
      Open;
    end;

    frm.AbrirTabelaAuto := True;

    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeFormaPagto.CarregarContaCorrente;
begin
  with cdsContaCorrenteLista, Params do
  begin
    Close;
    ParamByName('forma_pagto').AsInteger := DtSrcTabela.DataSet.FieldByName('COD').AsInteger;
    Open;
  end;
end;

procedure TfrmGeFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  CarregarLista(fdQryFormaPagtoNCFe);

  RotinaID         := ROTINA_CAD_FORMA_PAGTO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '00';
  NomeTabela     := 'TBFORMPAGTO';
  CampoCodigo    := 'COD';
  CampoDescricao := 'DESCRI';
  CampoOrdenacao := 'COD';
  CampoCadastroAtivo := 'ATIVA';

  if (gSistema.Codigo = SISTEMA_PDV) then
    WhereAdditional := '(p.FormaPagto_PDV = 1) and ' +
      '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário

  dbFormaPagtoPDV.Visible          := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_OPME]);
  dbFormaPagtoPDVRelatorio.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_OPME]);
  if not dbFormaPagtoPDV.Visible then
    GrpBxDadosNominais.Height := 97;

  dbDecrementarLimite.Enabled := (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_ADM, FUNCTION_USER_ID_GERENTE_VND,
    FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SYSTEM_ADM]);
end;

procedure TfrmGeFormaPagto.dbgContaCorrenteDblClick(Sender: TObject);
begin
  if dtsContaCorrenteLista.AutoEdit then
    if ( not cdsContaCorrenteLista.IsEmpty ) then
    begin
      cdsContaCorrenteLista.Edit;
      if ( cdsContaCorrenteListaSELECIONAR.AsInteger = 0 ) then
        cdsContaCorrenteListaSELECIONAR.AsInteger := 1
      else
        cdsContaCorrenteListaSELECIONAR.AsInteger := 0;
      cdsContaCorrenteLista.Post;
    end;
end;

procedure TfrmGeFormaPagto.dbgContaCorrenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgContaCorrenteDblClick(Sender);
end;

procedure TfrmGeFormaPagto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsContaCorrenteLista.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeFormaPagto.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarContaCorrente;
end;

procedure TfrmGeFormaPagto.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('COD').AsInteger        := GetNextID(NomeTabela, 'COD');
    FieldByName('ACRESCIMO').AsCurrency := 0;
    FieldByName('ATIVA').AsInteger      := 1;
    FieldByName('DEBITAR_LIMITE_CLIENTE').AsInteger     := 1;
    FieldByName('FORMAPAGTO_PDV').AsInteger             := 0;
    FieldByName('FORMAPAGTO_PDV_CUPOM_EXTRA').AsInteger := 0;
    FieldByName('FORMAPAGTO_NFCE').Clear;
  end;
end;

procedure TfrmGeFormaPagto.cdsContaCorrenteListaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

procedure TfrmGeFormaPagto.GravarRelacaoFormaConta;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBFORMPAGTO_CONTACOR (FORMA_PAGTO, CONTA_CORRENTE, SELECIONAR) values (%s, %s, 1)';
  SQL_DELETE = 'Delete from TBFORMPAGTO_CONTACOR where FORMA_PAGTO = %s and CONTA_CORRENTE = %s';
begin
(*
  IMR - 15/10/2014 :
    Rotina que permite a gravação de várias contas correntes para a mesma forma de pagamento.
*)
  cdsContaCorrenteLista.First;
  cdsContaCorrenteLista.DisableControls;
  while not cdsContaCorrenteLista.Eof do
  begin
    if cdsContaCorrenteListaSELECIONAR.AsInteger = 1 then
      sSQL := SQL_INSERT
    else
      sSQL := SQL_DELETE;

    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE, [DtSrcTabela.DataSet.FieldByName('COD').AsString, cdsContaCorrenteListaCODIGO.AsString]) );
      ExecSQL;

      SQL.Clear;
      SQL.Add( Format(sSQL, [DtSrcTabela.DataSet.FieldByName('COD').AsString, cdsContaCorrenteListaCODIGO.AsString]) );
      ExecSQL;

      CommitTransaction;
    end;

    cdsContaCorrenteLista.Next;
  end;
  cdsContaCorrenteLista.First;
  cdsContaCorrenteLista.EnableControls;
end;

procedure TfrmGeFormaPagto.btbtnSalvarClick(Sender: TObject);
begin
(*
  IMR - 15/10/2014 :
    Rotina que permite a gravação de várias contas correntes para a mesma forma de pagamento.
*)
  fdQryTabela.AfterScroll := nil;
  inherited;
  fdQryTabela.AfterScroll := fdQryTabelaAfterScroll;

  if ( not OcorreuErro ) then
    GravarRelacaoFormaConta;
end;

procedure TfrmGeFormaPagto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarContaCorrente;
end;

procedure TfrmGeFormaPagto.btnFiltrarClick(Sender: TObject);
begin
  if (gSistema.Codigo = SISTEMA_PDV) then
  begin
    CampoDescricao  := 'p.cod';
    WhereAdditional := '(p.FormaPagto_PDV = 1) and ' +
      '(p.cod in (Select fc.forma_pagto from TBFORMPAGTO_CONTACOR fc inner join TBCONTA_CORRENTE c on (c.codigo = fc.conta_corrente) where c.tipo = 1))'; // Conta Corrente do tipo Caixa Diário
  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeFormaPagto', TfrmGeFormaPagto);

end.
