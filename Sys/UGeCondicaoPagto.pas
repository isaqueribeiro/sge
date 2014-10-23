unit UGeCondicaoPagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin;

type
  TfrmGeCondicaoPagto = class(TfrmGrPadraoCadastro)
    lblNome: TLabel;
    dbNome: TDBEdit;
    IbDtstTabelaCOND_COD: TSmallintField;
    IbDtstTabelaCOND_DESCRICAO: TIBStringField;
    IbDtstTabelaCOND_PRAZO: TSmallintField;
    IbDtstTabelaCOND_PRAZO_01: TSmallintField;
    IbDtstTabelaCOND_PRAZO_02: TSmallintField;
    IbDtstTabelaCOND_PRAZO_03: TSmallintField;
    IbDtstTabelaCOND_PRAZO_04: TSmallintField;
    IbDtstTabelaCOND_PRAZO_05: TSmallintField;
    IbDtstTabelaCOND_PRAZO_06: TSmallintField;
    IbDtstTabelaCOND_PRAZO_07: TSmallintField;
    IbDtstTabelaCOND_PRAZO_08: TSmallintField;
    IbDtstTabelaCOND_PRAZO_09: TSmallintField;
    IbDtstTabelaCOND_PRAZO_10: TSmallintField;
    IbDtstTabelaCOND_PRAZO_11: TSmallintField;
    IbDtstTabelaCOND_PRAZO_12: TSmallintField;
    IbDtstTabelaCOND_DESCRICAO_FULL: TIBStringField;
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
    dbFormaPagtoPDV: TDBCheckBox;
    IbDtstTabelaCOND_PDV: TSmallintField;
    IbDtstTabelaCOND_QTDE_PARCELAS: TSmallintField;
    IbDtstTabelaAPrazo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DtSrcTabelaDataChange(Sender: TObject; Field: TField);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure IbDtstTabelaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeCondicaoPagto: TfrmGeCondicaoPagto;

  procedure MostrarTabelaCondicoesPagto(const AOwner : TComponent);
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean; overload;
  function SelecionarCondicaoPagto(const AOwner : TComponent; var Codigo : Integer; var Nome : String; var Prazos : IntegerArray) : Boolean; overload;

implementation

uses UDMBusiness, UConstantesDGE;

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
    Result := frm.SelecionarRegistro(Codigo, Nome);

    if ( Result ) then
    begin
      for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
        if ( not frm.IbDtstTabela.FieldByName('COND_PRAZO_' + FormatFloat('00', I)).IsNull ) then
        begin
          //SetLength(Prazos, Length(Prazos) + I);;
          Prazos[I] := frm.IbDtstTabela.FieldByName('COND_PRAZO_' + FormatFloat('00', I)).AsInteger;
        end;
    end;
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeCondicaoPagto.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_CONDICAO_PAGTO_ID;
  ControlFirstEdit    := dbNome;
  DisplayFormatCodigo := '000';
  
  NomeTabela     := 'TBCONDICAOPAGTO';
  CampoCodigo    := 'Cond_cod';
  CampoDescricao := 'Cond_descricao';

  if (gSistema.Codigo = SISTEMA_PDV) then
    WhereAdditional := '(c.Cond_pdv = 1)';

  UpdateGenerator;

  btbtnIncluir.Visible  := (gSistema.Codigo = SISTEMA_GESTAO);
  btbtnAlterar.Visible  := (gSistema.Codigo = SISTEMA_GESTAO);
  btbtnExcluir.Visible  := (gSistema.Codigo = SISTEMA_GESTAO);
  btbtnCancelar.Visible := (gSistema.Codigo = SISTEMA_GESTAO);
  btbtnSalvar.Visible   := (gSistema.Codigo = SISTEMA_GESTAO);
end;

procedure TfrmGeCondicaoPagto.DtSrcTabelaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if ( Field = IbDtstTabela.FieldByName('COND_PRAZO') ) then
  begin
    dbPrazo01.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo02.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo03.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo04.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo05.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo06.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo07.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo08.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo09.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo10.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo11.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
    dbPrazo12.ReadOnly := (IbDtstTabelaCOND_PRAZO.AsInteger = 0);
  end;
end;

procedure TfrmGeCondicaoPagto.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOND_PRAZO.AsInteger := 0;
  IbDtstTabelaCOND_PDV.AsInteger   := 0;
  IbDtstTabelaCOND_QTDE_PARCELAS.AsInteger := 0;
  IbDtstTabelaCOND_PRAZO_01.Clear;
  IbDtstTabelaCOND_PRAZO_02.Clear;
  IbDtstTabelaCOND_PRAZO_03.Clear;
  IbDtstTabelaCOND_PRAZO_04.Clear;
  IbDtstTabelaCOND_PRAZO_05.Clear;
  IbDtstTabelaCOND_PRAZO_06.Clear;
  IbDtstTabelaCOND_PRAZO_07.Clear;
  IbDtstTabelaCOND_PRAZO_08.Clear;
  IbDtstTabelaCOND_PRAZO_09.Clear;
  IbDtstTabelaCOND_PRAZO_10.Clear;
  IbDtstTabelaCOND_PRAZO_11.Clear;
  IbDtstTabelaCOND_PRAZO_12.Clear;
end;

procedure TfrmGeCondicaoPagto.IbDtstTabelaBeforePost(DataSet: TDataSet);
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

  for I := COND_PARCELA_MIN to COND_PARCELA_MAX do
  begin
    sCmp := 'COND_PRAZO_' + FormatFloat('00', I);
    if IbDtstTabela.Fields.FindField(sCmp) <> nil then
      if Trim(IbDtstTabela.FieldByName(sCmp).AsString) = EmptyStr then
        IbDtstTabela.FieldByName(sCmp).Clear;
  end;

  if ( IbDtstTabelaCOND_PRAZO.AsInteger = 0 ) then
    Str := Trim(IbDtstTabelaCOND_DESCRICAO.AsString)
  else
  begin
    Str := Trim(IbDtstTabelaCOND_DESCRICAO.AsString) + ' [';

    if ( not IbDtstTabelaCOND_PRAZO_01.IsNull ) then
    begin
      Str   := Str + IbDtstTabelaCOND_PRAZO_01.AsString;
      iQtde := 1;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_02.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_02.AsString;
      iQtde := 2;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_03.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_03.AsString;
      iQtde := 3;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_04.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_04.AsString;
      iQtde := 4;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_05.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_05.AsString;
      iQtde := 5;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_06.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_06.AsString;
      iQtde := 6;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_07.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_07.AsString;
      iQtde := 7;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_08.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_08.AsString;
      iQtde := 8;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_09.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_09.AsString;
      iQtde := 9;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_10.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_10.AsString;
      iQtde := 10;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_11.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_11.AsString;
      iQtde := 11;
    end;

    if ( not IbDtstTabelaCOND_PRAZO_12.IsNull ) then
    begin
      Str   := Str + ', ' + IbDtstTabelaCOND_PRAZO_12.AsString;
      iQtde := 12;
    end;

    Str := Str + ']';
  end;

  IbDtstTabelaCOND_QTDE_PARCELAS.AsInteger := iQtde;
  IbDtstTabelaCOND_DESCRICAO_FULL.AsString := Str;
end;

procedure TfrmGeCondicaoPagto.IbDtstTabelaCalcFields(DataSet: TDataSet);
begin
  IbDtstTabelaAPrazo.AsString := IfThen(IbDtstTabelaCOND_PRAZO.AsInteger = 1, 'X', '.');
end;

initialization
  FormFunction.RegisterForm('frmGeCondicaoPagto', TfrmGeCondicaoPagto);

end.
