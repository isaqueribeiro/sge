unit UGeTipoDespesa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoCadastro, ImgList, IBCustomDataSet, IBUpdateSQL, DB,
  Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  ToolWin, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit, JvDBControls, dxSkinsCore, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeTipoDespesa = class(TfrmGrPadraoCadastro)
    lblDescricao: TLabel;
    dbDescricao: TDBEdit;
    GrpBxDadosClassificacao: TGroupBox;
    IbDtstTabelaCOD: TSmallintField;
    IbDtstTabelaTIPODESP: TIBStringField;
    IbDtstTabelaTIPO_PARTICULAR: TSmallintField;
    IbDtstTabelaTIPO_PARTICULAR_DESC: TIBStringField;
    lblPlanoContas: TLabel;
    IbDtstTabelaPLANO_CONTA: TIntegerField;
    IbDtstTabelaDESCRICAO_RESUMIDA: TIBStringField;
    dbPlanoContas: TJvDBComboEdit;
    GrpBxParametros: TGroupBox;
    Bevel5: TBevel;
    dbTipoParticular: TDBCheckBox;
    dbAtivo: TDBCheckBox;
    IbDtstTabelaATIVO: TSmallintField;
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

var
  frmGeTipoDespesa: TfrmGeTipoDespesa;

  procedure MostrarTipoDespesas(const AOwner : TComponent);
  function SelecionarTipoDespesa(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;

implementation

uses
  UDMBusiness, UConstantesDGE, UGePlanoContas;

{$R *.dfm}

procedure MostrarTipoDespesas(const AOwner : TComponent);
var
  frm : TfrmGeTipoDespesa;
begin
  frm := TfrmGeTipoDespesa.Create(AOwner);
  try
    frm.ShowModal;
  finally
    frm.Destroy;
  end;
end;

function SelecionarTipoDespesa(const AOwner : TComponent; var Codigo : Integer; var Nome : String) : Boolean;
var
  frm : TfrmGeTipoDespesa;
begin
  frm := TfrmGeTipoDespesa.Create(AOwner);
  try
    Result := frm.SelecionarRegistro(Codigo, Nome);
  finally
    frm.Destroy;
  end;
end;

procedure TfrmGeTipoDespesa.FormCreate(Sender: TObject);
begin
  inherited;
  RotinaID            := ROTINA_CAD_TIPO_DESPESA_ID;
  ControlFirstEdit    := dbDescricao;
  DisplayFormatCodigo := '##00';
  NomeTabela     := 'TBTPDESPESA';
  CampoCodigo    := 'COD';
  CampoDescricao := 'TIPODESP';
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaNewRecord(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaCOD.Value                 := GetNextID(NomeTabela, CampoCodigo);
  IbDtstTabelaTIPO_PARTICULAR.AsInteger := 0;
  IbDtstTabelaATIVO.AsInteger           := 1;
  IbDtstTabelaPLANO_CONTA.Clear;
end;

procedure TfrmGeTipoDespesa.IbDtstTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IbDtstTabelaTIPO_PARTICULAR_DESC.AsString := IfThen(IbDtstTabelaTIPO_PARTICULAR.AsInteger = 1, 'S', EmptyStr);
end;

procedure TfrmGeTipoDespesa.dbgDadosDrawColumnCell(Sender: TObject;
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

procedure TfrmGeTipoDespesa.dbPlanoContasButtonClick(Sender: TObject);
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

procedure TfrmGeTipoDespesa.FormKeyDown(Sender: TObject; var Key: Word;
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
  FormFunction.RegisterForm('frmGeTipoDespesa', TfrmGeTipoDespesa);

end.
