unit UGeCondicaoPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, DBClient, Provider, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeCondicaoPagto = class(TfrmGrPadraoCadastro)
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
    dtsFormaPagtoLista: TDataSource;
    cdsFormaPagtoListaSELECIONAR: TIntegerField;
    cdsFormaPagtoListaCODIGO: TSmallintField;
    dbgFormaPagto: TDBGrid;
    lblRegistroDesativado: TLabel;
    dbAtiva: TDBCheckBox;
    qryFormaPagtoLista: TFDQuery;
    fdQryTabelaCOND_COD: TSmallintField;
    fdQryTabelaCOND_DESCRICAO: TStringField;
    fdQryTabelaCOND_PRAZO: TSmallintField;
    fdQryTabelaCOND_PDV: TSmallintField;
    fdQryTabelaCOND_QTDE_PARCELAS: TSmallintField;
    fdQryTabelaCOND_PRAZO_01: TSmallintField;
    fdQryTabelaCOND_PRAZO_02: TSmallintField;
    fdQryTabelaCOND_PRAZO_03: TSmallintField;
    fdQryTabelaCOND_PRAZO_04: TSmallintField;
    fdQryTabelaCOND_PRAZO_05: TSmallintField;
    fdQryTabelaCOND_PRAZO_06: TSmallintField;
    fdQryTabelaCOND_PRAZO_07: TSmallintField;
    fdQryTabelaCOND_PRAZO_08: TSmallintField;
    fdQryTabelaCOND_PRAZO_09: TSmallintField;
    fdQryTabelaCOND_PRAZO_10: TSmallintField;
    fdQryTabelaCOND_PRAZO_11: TSmallintField;
    fdQryTabelaCOND_PRAZO_12: TSmallintField;
    fdQryTabelaATIVA: TSmallintField;
    fdQryTabelaCOND_DESCRICAO_FULL: TStringField;
    fdQryTabelaAPrazo: TStringField;
    cdsFormaPagtoListaDESCRICAO: TStringField;
    cdsFormaPagtoListaUSAR_PDV: TStringField;
    qryFormaPagtoListaSELECIONAR: TIntegerField;
    qryFormaPagtoListaCODIGO: TSmallintField;
    qryFormaPagtoListaDESCRICAO: TStringField;
    qryFormaPagtoListaUSAR_PDV: TStringField;
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
    procedure fdQryTabelaBeforePost(DataSet: TDataSet);
    procedure fdQryTabelaCalcFields(DataSet: TDataSet);
    procedure fdQryTabelaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
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
  frmGeCondicaoPagto: TfrmGeCondicaoPagto;

  procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean; overload;

implementation

uses
  UDMBusiness, UConstantesDGE;

{$R *.dfm}

procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
var
  frm : TfrmGeCondicaoPagto;
begin
  frm := TfrmGeCondicaoPagto.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeCondicaoPagto;
begin
  frm := TfrmGeCondicaoPagto.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean;
var
  frm : TfrmGeCondicaoPagto;
  I : Integer;
begin
  frm := TfrmGeCondicaoPagto.Create(AOwner);
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

procedure TfrmGeCondicaoPagto.FormCreate(Sender: TObject);
var
  I ,
  X : SmallInt;
begin
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

  UpdateGenerator;

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
end;

procedure TfrmGeCondicaoPagto.DtSrcTabelaDataChange(Sender: TObject;
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

procedure TfrmGeCondicaoPagto.CarregarFormaPagto;
begin
  with cdsFormaPagtoLista, Params do
  begin
    Close;
    ParamByName('condicao_pagto').AsInteger := DtSrcTabela.DataSet.FieldByName('COND_COD').AsInteger;
    Open;
  end;
end;

procedure TfrmGeCondicaoPagto.GravarRelacaoFormaCondicao;
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

procedure TfrmGeCondicaoPagto.dbgFormaPagtoDblClick(Sender: TObject);
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

procedure TfrmGeCondicaoPagto.dbgFormaPagtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgFormaPagtoDblClick(Sender);
end;

procedure TfrmGeCondicaoPagto.btbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if ( not OcorreuErro ) then
    CarregarFormaPagto;
end;

procedure TfrmGeCondicaoPagto.btbtnSalvarClick(Sender: TObject);
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

procedure TfrmGeCondicaoPagto.DtSrcTabelaStateChange(Sender: TObject);
begin
  inherited;
  dtsFormaPagtoLista.AutoEdit := (DtSrcTabela.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TfrmGeCondicaoPagto.fdQryTabelaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CarregarFormaPagto;
end;

procedure TfrmGeCondicaoPagto.fdQryTabelaBeforePost(DataSet: TDataSet);
var
  I     ,
  iQtde : Integer;
  sCmp  ,
  Str   : String;
begin
  inherited;
(*
  IMR - 22/10/2014 :
    Inserção da variável QTDE para que esta defina o número de parcelas da condição de pagamento a prazo a partir dos prazos de vencimentos.
*)


  iQtde := 0;

  // limpar campos de prazos vazios

  with DtSrcTabela.DataSet do
  begin
    for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
    begin
      sCmp := 'COND_PRAZO_' + FormatFloat('00', I);
      if Fields.FindField(sCmp) <> nil then
        if Trim(FieldByName(sCmp).AsString) = EmptyStr then
          FieldByName(sCmp).Clear;
    end;

    if ( FieldByName('COND_PRAZO').AsInteger = 0 ) then
      Str := Trim(FieldByName('COND_DESCRICAO').AsString)
    else
    begin
      Str := Trim(FieldByName('COND_DESCRICAO').AsString) + ' [';

      if ( not FieldByName('COND_PRAZO_01').IsNull ) then
      begin
        Str   := Str + FieldByName('COND_PRAZO_01').AsString;
        iQtde := 1;
      end;

      if ( not FieldByName('COND_PRAZO_02').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_02').AsString;
        iQtde := 2;
      end;

      if ( not FieldByName('COND_PRAZO_03').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_03').AsString;
        iQtde := 3;
      end;

      if ( not FieldByName('COND_PRAZO_04').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_04').AsString;
        iQtde := 4;
      end;

      if ( not FieldByName('COND_PRAZO_05').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_05').AsString;
        iQtde := 5;
      end;

      if ( not FieldByName('COND_PRAZO_06').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_06').AsString;
        iQtde := 6;
      end;

      if ( not FieldByName('COND_PRAZO_07').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_07').AsString;
        iQtde := 7;
      end;

      if ( not FieldByName('COND_PRAZO_08').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_08').AsString;
        iQtde := 8;
      end;

      if ( not FieldByName('COND_PRAZO_09').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_09').AsString;
        iQtde := 9;
      end;

      if ( not FieldByName('COND_PRAZO_10').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_10').AsString;
        iQtde := 10;
      end;

      if ( not FieldByName('COND_PRAZO_11').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_11').AsString;
        iQtde := 11;
      end;

      if ( not FieldByName('COND_PRAZO_12').IsNull ) then
      begin
        Str   := Str + ', ' + FieldByName('COND_PRAZO_12').AsString;
        iQtde := 12;
      end;

      Str := Str + ']';
    end;

    FieldByName('COND_QTDE_PARCELAS').AsInteger := iQtde;
    FieldByName('COND_DESCRICAO_FULL').AsString := Str;
  end;
end;

procedure TfrmGeCondicaoPagto.fdQryTabelaCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
    FieldByName('APrazo').AsString := IfThen(FieldByName('COND_PRAZO').AsInteger = 1, 'X', '.');
end;

procedure TfrmGeCondicaoPagto.fdQryTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  with DtSrcTabela.DataSet do
  begin
    FieldByName('COND_PRAZO').AsInteger := 0;
    FieldByName('COND_PDV').AsInteger   := 0;
    FieldByName('ATIVA').AsInteger      := FLAG_SIM;
    FieldByName('COND_QTDE_PARCELAS').AsInteger := 0;
    FieldByName('COND_PRAZO_01').Clear;
    FieldByName('COND_PRAZO_02').Clear;
    FieldByName('COND_PRAZO_03').Clear;
    FieldByName('COND_PRAZO_04').Clear;
    FieldByName('COND_PRAZO_05').Clear;
    FieldByName('COND_PRAZO_06').Clear;
    FieldByName('COND_PRAZO_07').Clear;
    FieldByName('COND_PRAZO_08').Clear;
    FieldByName('COND_PRAZO_09').Clear;
    FieldByName('COND_PRAZO_10').Clear;
    FieldByName('COND_PRAZO_11').Clear;
    FieldByName('COND_PRAZO_12').Clear;
  end;
end;

procedure TfrmGeCondicaoPagto.cdsFormaPagtoListaSELECIONARGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Case Sender.AsInteger of
      0 : Text := '.';
      1 : Text := 'X';
    end;
end;

initialization
  FormFunction.RegisterForm('frmGeCondicaoPagto', TfrmGeCondicaoPagto);

end.
