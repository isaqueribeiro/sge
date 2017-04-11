unit UGeTipoReceita;

interface

uses
  UGrPadraoCadastro,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeTipoReceita = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    lblPlanoContas: TLabel;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaTIPOREC: TIBStringField;
    IbDtstTabelaTIPO_PARTICULAR: TSmallintField;
    IbDtstTabelaPLANO_CONTA: TIntegerField;
    IbDtstTabelaATIVO: TSmallintField;
    IbDtstTabelaTIPO_PARTICULAR_DESC: TIBStringField;
    IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField;
    IbDtstTabelaCLASSIFICACAO: TSmallintField;
    fdQryClassificacao: TFDQuery;
    DtsClassificacao: TDataSource;
    lblClassificacao: TLabel;
    dbClassificacao: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure IbDtstTabelaNewRecord(DataSet: TDataSet);
    procedure IbDtstTabelaBeforePost(DataSet: TDataSet);
    procedure dbPlanoContasButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBTPRECEITA
  - TBPLANO_CONTA

  Views:
  - VW_CLASSIFICAO_RECEITA

  Procedures:

*)

var
  frmGeTipoReceita: TfrmGeTipoReceita;

  procedure MostrarTipoReceitas(const AOwner : TComponent);
  function SelecionarTipoReceita(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UGePlanoContas;

{$R *.dfm}

procedure MostrarTipoReceitas(const AOwner : TComponent);
var
  frm : TfrmGeTipoReceita;
begin
  frm := TfrmGeTipoReceita.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoReceita(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTipoReceita;
begin
  frm := TfrmGeTipoReceita.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTipoReceita.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_TIPO_RECEITA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##00';
  NomeTabela          := 'TBTPRECEITA';
  CampoCodigo         := 'COD';
  CampoDescricao      := 'TIPOREC';
  CampoCadastroAtivo  := 'ATIVO';

  CarregarLista(fdQryClassificacao);
end;

procedure TfrmGeTipoReceita.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value                 := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaCLASSIFICACAO.AsInteger   := 0; // A Definir
  IbDtstTabelaTIPO_PARTICULAR.AsInteger := 0;
  IbDtstTabelaATIVO.AsInteger           := 1;
  IbDtstTabelaPLANO_CONTA.Clear;
end;

procedure TfrmGeTipoReceita.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaTIPOREC.AsString              := Trim(IbDtstTabelaTIPOREC.AsString);
  IbDtstTabelaTIPO_PARTICULAR_DESC.AsString := IfThen(IbDtstTabelaTIPO_PARTICULAR.AsInteger = 1, 'S', EmptyStr);
end;

procedure TfrmGeTipoReceita.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ( Sender = dbgDados ) then
  begin
    if ( IbDtstTabelaATIVO.AsInteger = 0 ) then
      dbgDados.Canvas.Font.Color := clRed;

    dbgDados.DefaultDrawDataCell(Rect, dbgDados.Columns[DataCol].Field, State);
  end;
end;

procedure TfrmGeTipoReceita.dbPlanoContasButtonClick(Sender: TObject);
var
  iCodigo    : Integer;
  sDescricao : String;
begin
  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( SelecionarPlanoConta(Self, tpLancamento, 0, iCodigo, sDescricao) ) then
    begin
      IbDtstTabelaPLANO_CONTA.AsInteger       := iCodigo;
      IbDtstTabelaDESCRICAO_RESUMIDA.AsString := sDescricao;
    end;
end;

procedure TfrmGeTipoReceita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = SYS_KEY_L) Then
  begin

    if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
      if ( dbPlanoContas.Focused ) then
      begin
        IbDtstTabelaPLANO_CONTA.Clear;
        IbDtstTabelaDESCRICAO_RESUMIDA.Clear;
      end;

  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeTipoReceita', TfrmGeTipoReceita);

end.
