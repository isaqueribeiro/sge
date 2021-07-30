unit View.CondicaoPagto;

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

  View.PadraoCadastro,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela, UGrPadraoCadastro, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, IBX.IBCustomDataSet, IBX.IBUpdateSQL;

type
  TViewCondicaoPagto = class(TViewPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    dbPrazo: TDBCheckBox;
    lblPrazo01: TLabel;
    dbPrazo01: TDBEdit;
    lblPrazo02: TLabel;
    dbPrazo02: TDBEdit;
    lblPrazo03: TLabel;
    dbPrazo03: TDBEdit;
    dbPrazo04: TDBEdit;
    lblPrazo04: TLabel;
    lblPrazo05: TLabel;
    dbPrazo05: TDBEdit;
    dbPrazo06: TDBEdit;
    lblPrazo06: TLabel;
    dbPrazo07: TDBEdit;
    lblPrazo07: TLabel;
    dbPrazo08: TDBEdit;
    lblPrazo08: TLabel;
    lblPrazo09: TLabel;
    dbPrazo09: TDBEdit;
    dbPrazo10: TDBEdit;
    lblPrazo10: TLabel;
    dbPrazo11: TDBEdit;
    lblPrazo11: TLabel;
    dbPrazo12: TDBEdit;
    lblPrazo12: TLabel;
    dbCondicaoPagtoPDV: TDBCheckBox;
    dspFormaPagtoLista: TDataSetProvider;
    cdsFormaPagtoLista: TClientDataSet;
    dtsFormaPagto: TDataSource;
    cdsFormaPagtoListaSELECIONAR: TIntegerField;
    cdsFormaPagtoListaCODIGO: TSmallintField;
    lblRegistroDesativado: TLabel;
    dbAtiva: TDBCheckBox;
    qryFormaPagtoLista: TFDQuery;
    cdsFormaPagtoListaDESCRICAO: TStringField;
    cdsFormaPagtoListaUSAR_PDV: TStringField;
    qryFormaPagtoListaSELECIONAR: TIntegerField;
    qryFormaPagtoListaCODIGO: TSmallintField;
    qryFormaPagtoListaDESCRICAO: TStringField;
    qryFormaPagtoListaUSAR_PDV: TStringField;
    pnlFormaPagto: TPanel;
    pnlDicas: TPanel;
    lblDicasTitulo: TLabel;
    lblDicasTexto: TLabel;
    dbgFormaPagto: TDBGrid;
    cdsFormaPagto: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure dbgFormaPagtoDblClick(Sender: TObject);
    procedure dbgFormaPagtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure cdsFormaPagtoListaSELECIONARGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure fdQryTabelaAfterScroll(DataSet: TDataSet);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FControllerCondicaoPagtoForma : IControllerCustom;
    procedure CarregarFormaPagto;
  public
    { Public declarations }
    procedure GravarRelacaoFormaCondicao;
  end;

(*
  Tabelas:
  - TBCONDICAOPAGTO
  - TBFORMPAGTO
  - TBFORMPAGTO_CONDICAO

  Views:

  Procedures:

*)

var
  ViewCondicaoPagto: TViewCondicaoPagto;

  procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean; overload;

implementation

uses
  UDMBusiness,
  UConstantesDGE,
  SGE.Controller.Factory;

{$R *.dfm}

procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
var
  frm : TViewCondicaoPagto;
begin
  frm := TViewCondicaoPagto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TViewCondicaoPagto;
begin
  frm := TViewCondicaoPagto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean;
var
  frm : TViewCondicaoPagto;
  I : Integer;
begin
  frm := TViewCondicaoPagto.Create(AOwner);
  try
    with frm, DtSrcTabela.DataSet do
    begin
      Result := SelecionarRegistro(Codigo, Nome);

      if ( Result ) then
      begin
        for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
          if ( not FieldByName('COND_PRAZO_' + FormatFloat('00', I)).IsNull ) then
          begin
            //SetLength(Prazos, Length(Prazos) + I);;
            Prazos[I] := FieldByName('COND_PRAZO_' + FormatFloat('00', I)).AsInteger;
          end;
      end;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TViewCondicaoPagto.FormCreate(Sender: TObject);
var
  I ,
  X : SmallInt;
begin
  FController := TControllerFactory.New.CondicaoPagto;
  FControllerCondicaoPagtoForma := TControllerFactory.New.CondicaoPagtoForma;

  inherited;
  RotinaID            := ROTINA_CAD_CONDICAO_PAGTO_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';

  NomeTabela     := 'TBCONDICAOPAGTO';
  CampoCodigo    := 'Cond_cod';
  CampoDescricao := 'Cond_descricao';
  CampoOrdenacao := '3, 19'; // Cond_prazo, Cond_descricao_full
  CampoCadastroAtivo := 'ATIVA';

  if (gSistema.Codigo = SISTEMA_PDV) then
    WhereAdditional := '(c.Cond_pdv = 1)';

  btbtnIncluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnAlterar.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnExcluir.Visible  := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnCancelar.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  btbtnSalvar.Visible   := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_GESTAO_IND, SISTEMA_GESTAO_OPME]);
  dbgFormaPagto.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV, SISTEMA_GESTAO_OPME]);

  dbCondicaoPagtoPDV.Visible := (gSistema.Codigo in [SISTEMA_GESTAO_COM, SISTEMA_PDV]);
  if not dbCondicaoPagtoPDV.Visible then
    GrpBxDadosNominais.Height := 153;

  for I := -1 to 1 do
  begin
    X := StrToInt(FormatDateTime('YYYY', Date)) + I;
    GerarCompetencias( X );
  end;

  Tabela
    .Display('COND_COD', 'Código', DisplayFormatCodigo, TAlignment.taCenter, True)
    .Display('COND_DESCRICAO', 'Descrição', True);

  AbrirTabelaAuto := True;
  FController.DAO.UpdateGenerator(EmptyStr);
end;

procedure TViewCondicaoPagto.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    if ( Field = FieldByName('COND_PRAZO') ) then
    begin
      dbPrazo01.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo02.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo03.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo04.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo05.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo06.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo07.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo08.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo09.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo10.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo11.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
      dbPrazo12.ReadOnly := (FieldByName('COND_PRAZO').AsInteger = 0);
    end;
  end;
end;

procedure TViewCondicaoPagto.CarregarFormaPagto;
begin
  with cdsFormaPagtoLista, Params do
  begin
    Close;
    ParamByName('condicao_pagto').AsInteger := DtSrcTabela.DataSet.FieldByName('COND_COD').AsInteger;
    Open;
  end;
end;

procedure TViewCondicaoPagto.GravarRelacaoFormaCondicao;
var
  sSQL : String;
const
  SQL_INSERT = 'Insert Into TBFORMPAGTO_CONDICAO (FORMA_PAGTO, CONDICAO_PAGTO, SELECIONAR) values (%s, %s, 1)';
  SQL_DELETE = 'Delete from TBFORMPAGTO_CONDICAO where FORMA_PAGTO = %s and CONDICAO_PAGTO = %s';
begin
(*
  IMR - 11/03/2015 :
    Rotina que permite a gravação de várias formas de pagamento para a mesma condição de pagamento.
*)
  cdsFormaPagtoLista.First;
  while not cdsFormaPagtoLista.Eof do
  begin
    if cdsFormaPagtoListaSELECIONAR.AsInteger = 1 then
      sSQL := SQL_INSERT
    else
      sSQL := SQL_DELETE;

    with DMBusiness, fdQryBusca do
    begin
      SQL.Clear;
      SQL.Add( Format(SQL_DELETE, [cdsFormaPagtoListaCODIGO.AsString, DtSrcTabela.DataSet.FieldByName('COND_COD').AsString]) );
      ExecSQL;

      SQL.Clear;
      SQL.Add( Format(sSQL, [cdsFormaPagtoListaCODIGO.AsString, DtSrcTabela.DataSet.FieldByName('COND_COD').AsString]) );
      ExecSQL;

      CommitTransaction;
    end;

    cdsFormaPagtoLista.Next;
  end;
  cdsFormaPagtoLista.First;
end;

procedure TViewCondicaoPagto.dbgFormaPagtoDblClick(Sender: TObject);
begin
  if dtsFormaPagtoLista.AutoEdit then
    if ( not cdsFormaPagtoLista.IsEmpty ) then
    begin
      cdsFormaPagtoLista.Edit;
      if ( cdsFormaPagtoListaSELECIONAR.AsInteger = 0 ) then
        cdsFormaPagtoListaSELECIONAR.AsInteger := 1
      else
        cdsFormaPagtoListaSELECIONAR.AsInteger := 0;
      cdsFormaPagtoLista.Post;
    end;
end;

procedure TViewCondicaoPagto.dbgFormaPagtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgFormaPagtoDblClick(Sender);
end;

procedure TViewCondicaoPagto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.btbtnSalvarClick(Sender: TObject);
begin
(*
  IMR - 11/03/2015 :
    Rotina que permite a gravação de várias formas de pagamentos para a mesma condição de pagamento.
*)
  fdQryTabela.AfterScroll := nil;
  inherited;
  fdQryTabela.AfterScroll := fdQryTabelaAfterScroll;

  if ( not OcorreuErro ) then
    GravarRelacaoFormaCondicao;
end;

procedure TViewCondicaoPagto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsFormaPagtoLista.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TViewCondicaoPagto.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarFormaPagto;
end;

procedure TViewCondicaoPagto.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    FieldByName('APrazo').AsString := IfThen(FieldByName('COND_PRAZO').AsInteger = 1, 'X', '.');
end;

procedure TViewCondicaoPagto.cdsFormaPagtoListaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

initialization
  FormFunction.RegisterForm('ViewCondicaoPagto', TViewCondicaoPagto);

end.
