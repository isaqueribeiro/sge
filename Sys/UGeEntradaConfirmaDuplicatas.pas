unit UGeEntradaConfirmaDuplicatas;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBUpdateSQL, ExtCtrls, Grids,
  DBGrids, Mask, DBCtrls, DBClient, Provider, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxButtons, JvExMask, JvToolEdit, JvDBControls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeEntradaConfirmaDuplicatas = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    Bevel1: TBevel;
    dtsDuplicatas: TDataSource;
    dbgTitulos: TDBGrid;
    Bevel2: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    lblDataVencimento: TLabel;
    dbParcela: TDBEdit;
    lblParcela: TLabel;
    lblValor: TLabel;
    dbValor: TDBEdit;
    lblEmissao: TLabel;
    dbEmissao: TDBEdit;
    dspDuplicatas: TDataSetProvider;
    cdsDuplicatas: TClientDataSet;
    cdsDuplicatasTotalParcelas: TAggregateField;
    cdsDuplicatasTotalEntrada: TCurrencyField;
    dbTotalEntrada: TDBEdit;
    dbTotalParcelas: TDBEdit;
    pnlTotais: TPanel;
    Label1: TLabel;
    lblTotalEntrada: TLabel;
    Label2: TLabel;
    lblTotalParcelas: TLabel;
    Label3: TLabel;
    lblTotalDiferenca: TLabel;
    cdsDuplicatasDiaSemana: TSmallintField;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    cdsDuplicatasLancamento: TStringField;
    dbDataVencimento: TJvDBDateEdit;
    qryDuplicatas: TFDQuery;
    qryParcela: TFDQuery;
    cdsDuplicatasANOLANC: TSmallintField;
    cdsDuplicatasNUMLANC: TIntegerField;
    cdsDuplicatasPARCELA: TSmallintField;
    cdsDuplicatasCODFORN: TSmallintField;
    cdsDuplicatasNOTFISC: TStringField;
    cdsDuplicatasTIPPAG: TStringField;
    cdsDuplicatasDTEMISS: TDateField;
    cdsDuplicatasDTVENC: TDateField;
    cdsDuplicatasVALORPAG: TBCDField;
    updParcela: TFDUpdateSQL;
    qryParcelaDTVENC: TDateField;
    qryParcelaVALORPAG: TBCDField;
    cdsDuplicatasDTPAG: TDateField;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ControlEditEnter(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsDuplicatasCalcFields(DataSet: TDataSet);
    procedure dtsDuplicatasDataChange(Sender: TObject; Field: TField);
    procedure dtsDuplicatasUpdateData(Sender: TObject);
    procedure cdsDuplicatasDiaSemanaGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure cdsDuplicatasBeforePost(DataSet: TDataSet);
    procedure cdsDuplicatasAfterScroll(DataSet: TDataSet);
    procedure cdsDuplicatasVALORPAGSetText(Sender: TField; const Text: string);
  private
    { Private declarations }
    fAnoCompra      : Smallint;
    fControleCompra : Integer;
    fDataEmissaoDOC : TDateTime;
    fTotalEntrada   : Currency;
    procedure CarregarDuplicatas;
    procedure UpdateParcelas;
    procedure DisplayTotais;
  public
    { Public declarations }
    property AnoCompra : Smallint read fAnoCompra write fAnoCompra;
    property ControleCompra : Integer read fControleCompra write fControleCompra;
    property DataEmissaoDOC : TDateTime read fDataEmissaoDOC write fDataEmissaoDOC;
    property TotalEntrada   : Currency read fTotalEntrada write fTotalEntrada;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCONTPAG

  Views:

  Procedures:

*)

//var
//  frmGeEntradaConfirmaDuplicatas: TfrmGeEntradaConfirmaDuplicatas;
//
  function DuplicatasConfirmadas(const AOwer : TComponent; Ano : Smallint; Controle : Integer;
    DataEmissaoNF : TDateTime; ValorEntrada : Currency) : Boolean;

implementation

uses DateUtils, UDMBusiness;

{$R *.dfm}

function DuplicatasConfirmadas(const AOwer : TComponent; Ano : Smallint; Controle : Integer;
  DataEmissaoNF : TDateTime; ValorEntrada : Currency) : Boolean;
var
  frm : TfrmGeEntradaConfirmaDuplicatas;
begin
  frm := TfrmGeEntradaConfirmaDuplicatas.Create(AOwer);
  try
    frm.AnoCompra      := Ano;
    frm.ControleCompra := Controle;
    frm.DataEmissaoDOC := DataEmissaoNF;
    frm.TotalEntrada   := ValorEntrada;

    frm.CarregarDuplicatas;

    if frm.cdsDuplicatas.IsEmpty then
      Result := False
    else
      Result := (frm.ShowModal = mrOk);
  finally
    frm.Free;
  end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.FormCreate(Sender: TObject);
begin
  inherited;
  TotalEntrada   := 0;
  AnoCompra      := 0;
  DataEmissaoDOC := Date;
  ControleCompra := 0;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.FormShow(Sender: TObject);
begin
  inherited;
  if not cdsDuplicatas.Active then
    CarregarDuplicatas;

  if ( not cdsDuplicatas.IsEmpty ) then
    cdsDuplicatas.Edit;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.ControlEditEnter(
  Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDataVencimento) or (Sender = dbValor) ) then
    if ( not cdsDuplicatas.IsEmpty ) then
      if ( cdsDuplicatas.State <> dsEdit ) then
        cdsDuplicatas.Edit;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbValor ) then
    if ( cdsDuplicatas.State = dsEdit ) then
    begin
      if (cdsDuplicatasDTVENC.AsDateTime < DataEmissaoDOC) then
      begin
        ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Entrada');
        if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
      end
      else
      begin
        if not cdsDuplicatasDTPAG.IsNull then
          cdsDuplicatas.Cancel
        else
          cdsDuplicatas.Post;

        cdsDuplicatas.Next;

        if ( not cdsDuplicatas.Eof ) then
          dbCodigo.SetFocus
        else
          btnConfirmar.SetFocus;
      end;
    end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.dbgTitulosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(cdsDuplicatas.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeEntradaConfirmaDuplicatas.btnConfirmarClick(
  Sender: TObject);
var
  cTotalNF ,
  cTotalDC : Currency;
begin
  if ( not ShowConfirm('Confirma os valores e vencimentos das parcelas?') ) then
    Exit;

  cTotalNF := StrToCurrDef( StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]), 0 );
  cTotalDC := StrToCurrDef( StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]), 0 );

  if ( cTotalNF <> cTotalDC ) then
  begin
    ShowWarning('O Valor Total das parcelas não coincide com o Valor Total de Entrada.');
    cdsDuplicatas.First;

    dbCodigo.SetFocus;
  end
  else
  begin
    UpdateParcelas;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.CarregarDuplicatas;
begin
  if cdsDuplicatas.Active then
    cdsDuplicatas.Close;

  with qryDuplicatas, SQL do
  begin
    Add('where AnoCompra = ' + IntToStr(AnoCompra));
    Add('  and NumCompra = ' + IntToStr(ControleCompra));
    Add('order by numlanc, parcela');
  end;

  cdsDuplicatas.Open;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasAfterScroll(DataSet: TDataSet);
begin
  dbDataVencimento.ReadOnly := not cdsDuplicatasDTPAG.IsNull;
  dbValor.ReadOnly          := not cdsDuplicatasDTPAG.IsNull;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasBeforePost(
  DataSet: TDataSet);
begin
  if (cdsDuplicatasDTVENC.AsDateTime < DataEmissaoDOC) then
  begin
    if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
    ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Entrada');
    Abort;
  end
  else
    inherited;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasCalcFields(
  DataSet: TDataSet);
begin
  cdsDuplicatasDiaSemana.AsInteger     := DayOfWeek(cdsDuplicatasDTVENC.AsDateTime);
  cdsDuplicatasLancamento.AsString     := FormatFloat('0000', cdsDuplicatasANOLANC.AsInteger) + FormatFloat('000000', cdsDuplicatasNUMLANC.AsInteger);
  cdsDuplicatasTotalEntrada.AsCurrency := TotalEntrada;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.UpdateParcelas;
begin
  cdsDuplicatas.First;
  while not cdsDuplicatas.Eof do
  begin
    qryParcela.Close;
    qryParcela.ParamByName('anocompra').AsSmallInt := AnoCompra;
    qryParcela.ParamByName('numcompra').AsInteger  := ControleCompra;
//    qryParcela.ParamByName('anolanc').AsInteger   := cdsDuplicatasANOLANC.AsInteger;
//    qryParcela.ParamByName('numlanc').AsInteger   := cdsDuplicatasNUMLANC.AsInteger;
    qryParcela.ParamByName('anolanc').Assign( cdsDuplicatasANOLANC );
    qryParcela.ParamByName('numlanc').Assign( cdsDuplicatasNUMLANC );
    qryParcela.Open;

    qryParcela.Edit;

    qryParcelaDTVENC.AsDateTime   := cdsDuplicatasDTVENC.AsDateTime;
    qryParcelaVALORPAG.AsCurrency := cdsDuplicatasVALORPAG.AsCurrency;

    qryParcela.Post;
    qryParcela.ApplyUpdates;
    qryParcela.CommitUpdates;

    cdsDuplicatas.Next;
  end;
  CommitTransaction;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.DisplayTotais;
var
  cTotalNF ,
  cTotalDC : Currency;
begin
  cTotalNF := StrToCurrDef( StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]), 0 );
  cTotalDC := StrToCurrDef( StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]), 0 );

  lblTotalEntrada.Caption   := FormatFloat(',0.00', cTotalNF);
  lblTotalParcelas.Caption  := FormatFloat(',0.00', cTotalDC);
  lblTotalDiferenca.Caption := FormatFloat(',0.00', cTotalNF - cTotalDC);
end;

procedure TfrmGeEntradaConfirmaDuplicatas.dtsDuplicatasDataChange(
  Sender: TObject; Field: TField);
begin
  DisplayTotais;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.dtsDuplicatasUpdateData(
  Sender: TObject);
begin
  DisplayTotais;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasDiaSemanaGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Exit;

  Case Sender.AsInteger of
    1 : Text := 'DOM';
    2 : Text := 'SEG';
    3 : Text := 'TER';
    4 : Text := 'QUA';
    5 : Text := 'QUI';
    6 : Text := 'SEX';
    7 : Text := 'SAB';
  end;
end;

procedure TfrmGeEntradaConfirmaDuplicatas.cdsDuplicatasVALORPAGSetText(Sender: TField; const Text: string);
begin
  Sender.AsCurrency := StrToCurrDef(StringReplace(Text, '.', '', [rfReplaceAll]), 0.0);
end;

procedure TfrmGeEntradaConfirmaDuplicatas.RegistrarRotinaSistema;
begin
  ;
end;

end.
