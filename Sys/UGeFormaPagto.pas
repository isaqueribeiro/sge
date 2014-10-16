unit UGeFormaPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, IBTable, DBClient, Provider;

type
  TfrmGeFormaPagto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblAcrescimo: TLabel;
    dbAcrescimo: TDBEdit;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaDESCRI: TIBStringField;
    IbDtstTabelaACRESCIMO: TFloatField;
    lblContaCorrente: TLabel;
    dbContaCorrente: TDBLookupComboBox;
    tblContaCorrente: TIBTable;
    dtsContaCorrente: TDataSource;
    IbDtstTabelaCONTA_CORRENTE: TIntegerField;
    IbDtstTabelaLkp_ContaCorrente: TStringField;
    dbDecrementarLimite: TDBCheckBox;
    IbDtstTabelaDEBITAR_LIMITE_CLIENTE: TSmallintField;
    lblFormaPagtoNCFe: TLabel;
    dbFormaPagtoNCFe: TDBLookupComboBox;
    tblFormaPagtoNCFe: TIBTable;
    dtsFormaPagtoNCFe: TDataSource;
    IbDtstTabelaFORMAPAGTO_NFCE: TIBStringField;
    IbDtstTabelaFORMAPAGTO_PDV: TSmallintField;
    dbFormaPagtoPDV: TDBCheckBox;
    qryContaCorrenteLista: TIBDataSet;
    dbgContaCorrente: TDBGrid;
    dtsContaCorrenteLista: TDataSource;
    dspContaCorrenteLista: TDataSetProvider;
    cdsContaCorrenteLista: TClientDataSet;
    cdsContaCorrenteListaSELECIONAR: TIntegerField;
    cdsContaCorrenteListaCODIGO: TIntegerField;
    cdsContaCorrenteListaDESCRICAO: TStringField;
    cdsContaCorrenteListaTIPO: TStringField;
    cdsContaCorrenteListaRZSOC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaAfterScroll(DataSet: TDataSet);
    procedure dbgContaCorrenteDblClick(Sender: TObject);
    procedure dbgContaCorrenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsContaCorrenteListaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarContaCorrente;
  public
    { Public declarations }
    procedure GravarRelacaoFormaConta;
  end;

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

    frm.WhereAdditional := '(p.FormaPagto_PDV = 1)';
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
    ParamByName('forma_pagto').AsInteger := IbDtstTabelaCOD.AsInteger;
    Open;
  end;
end;

procedure TfrmGeFormaPagto.FormCreate(Sender: TObject);
begin
  inherited;
  tblContaCorrente.Open;
  tblFormaPagtoNCFe.Open;

  RotinaID         := ROTINA_CAD_FORMA_PAGTO_ID;
  ControlFirstEdit := dbNome;

  DisplayFormatCodigo := '00';
  NomeTabela     := 'TBFORMPAGTO';
  CampoCodigo    := 'COD';
  CampoDescricao := 'DESCRI';

  dbDecrementarLimite.Enabled := (GetUserFunctionID in [FUNCTION_USER_ID_DIRETORIA, FUNCTION_USER_ID_GERENTE_ADM, FUNCTION_USER_ID_GERENTE_VND,
    FUNCTION_USER_ID_GERENTE_FIN, FUNCTION_USER_ID_AUX_FINANC1, FUNCTION_USER_ID_AUX_FINANC2, FUNCTION_USER_ID_SYSTEM_ADM]);
end;

procedure TfrmGeFormaPagto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value       := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaACRESCIMO.Value := 0;
  IbDtstTabelaDEBITAR_LIMITE_CLIENTE.Value := 1;
  IbDtstTabelaFORMAPAGTO_PDV.Value         := 1;
  IbDtstTabelaFORMAPAGTO_NFCE.Clear;
  IbDtstTabelaCONTA_CORRENTE.Clear;
end;

procedure TfrmGeFormaPagto.IbDtstTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarContaCorrente;
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
  dtsContaCorrenteLista.AutoEdit := (IbDtstTabela.State in [dsEdit, dsInsert]);
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
  SQL_INSERT = 'Insert Into TBFORMPAGTO_CONTACOR (FORMA_PAGTO, CONTA_CORRENTE) values (%s, %s)';
  SQL_DELETE = 'Delete from TBFORMPAGTO_CONTACOR where FORMA_PAGTO = %s and CONTA_CORRENTE = %s';
begin
(*
  IMR - 15/10/2014 :
    Rotina que permite a gravação de várias contas correntes para a mesma forma de pagamento.
*)
  cdsContaCorrenteLista.First;
  while not cdsContaCorrenteLista.Eof do
  begin
    if cdsContaCorrenteListaSELECIONAR.AsInteger = 1 then
      sSQL := SQL_INSERT
    else
      sSQL := SQL_DELETE;

    with DMBusiness, qryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE, [IbDtstTabelaCOD.AsString, cdsContaCorrenteListaCODIGO.AsString]) );
      ExecSQL;

      SQL.Clear;
      SQL.Add( Format(sSQL, [IbDtstTabelaCOD.AsString, cdsContaCorrenteListaCODIGO.AsString]) );
      ExecSQL;

      CommitTransaction;
    end;

    cdsContaCorrenteLista.Next;
  end;
end;

procedure TfrmGeFormaPagto.btbtnSalvarClick(Sender: TObject);
begin
(*
  IMR - 15/10/2014 :
    Rotina que permite a gravação de várias contas correntes para a mesma forma de pagamento.
*)
  IbDtstTabela.AfterScroll := nil;
  inherited;
  IbDtstTabela.AfterScroll := IbDtstTabelaAfterScroll;

  if ( not OcorreuErro ) then
    GravarRelacaoFormaConta;
end;

procedure TfrmGeFormaPagto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarContaCorrente;
end;

initialization
  FormFunction.RegisterForm('frmGeFormaPagto', TfrmGeFormaPagto);

end.
