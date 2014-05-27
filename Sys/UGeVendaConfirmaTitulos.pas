unit UGeVendaConfirmaTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Buttons, DB, IBCustomDataSet, IBUpdateSQL,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls, DBClient, Provider;

type
  TfrmGeVendaConfirmaTitulos = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    btnConfirmar: TBitBtn;
    btFechar: TBitBtn;
    Bevel1: TBevel;
    qryTitulos: TIBDataSet;
    dtsTitulos: TDataSource;
    dbgTitulos: TDBGrid;
    Bevel2: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    lblDataVencimento: TLabel;
    dbDataVencimento: TDBEdit;
    dbParcela: TDBEdit;
    lblParcela: TLabel;
    lblValor: TLabel;
    dbValor: TDBEdit;
    lblEmissao: TLabel;
    dbEmissao: TDBEdit;
    dspTitulos: TDataSetProvider;
    cdsTitulos: TClientDataSet;
    cdsTitulosANOLANC: TSmallintField;
    cdsTitulosNUMLANC: TIntegerField;
    cdsTitulosPARCELA: TSmallintField;
    cdsTitulosTIPPAG: TStringField;
    cdsTitulosDTEMISS: TDateField;
    cdsTitulosDTVENC: TDateField;
    cdsTitulosLancamento: TStringField;
    cdsTitulosTotalParcelas: TAggregateField;
    cdsTitulosTotalEntrada: TCurrencyField;
    dbTotalEntrada: TDBEdit;
    dbTotalParcelas: TDBEdit;
    updParcela: TIBDataSet;
    pnlTotais: TPanel;
    Label1: TLabel;
    lblTotalVenda: TLabel;
    Label2: TLabel;
    lblTotalParcelas: TLabel;
    Label3: TLabel;
    lblTotalDiferenca: TLabel;
    cdsTitulosDiaSemana: TSmallintField;
    cdsTitulosCNPJ: TStringField;
    cdsTitulosVALORREC: TBCDField;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ControlEditEnter(Sender: TObject);
    procedure ControlEditExit(Sender: TObject);
    procedure dbgTitulosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cdsTitulosCalcFields(DataSet: TDataSet);
    procedure dtsTitulosDataChange(Sender: TObject; Field: TField);
    procedure dtsTitulosUpdateData(Sender: TObject);
    procedure cdsTitulosDiaSemanaGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
    fAnoVenda ,
    fControleVenda : Integer;
    fTotalVenda  : Currency;
    procedure UpdateParcelas;
    procedure DisplayTotais;
  public
    { Public declarations }
    property AnoVenda      : Integer read fAnoVenda write fAnoVenda;
    property ControleVenda : Integer read fControleVenda write fControleVenda;
    property TotalVenda    : Currency read fTotalVenda write fTotalVenda;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeVendaConfirmaTitulos: TfrmGeVendaConfirmaTitulos;

  function TitulosConfirmados(const AOwer : TComponent; Ano, Controle : Integer; ValorVenda : Currency) : Boolean;

implementation

uses DateUtils, UDMBusiness;

{$R *.dfm}

function TitulosConfirmados(const AOwer : TComponent; Ano, Controle : Integer; ValorVenda : Currency) : Boolean;
var
  frm : TfrmGeVendaConfirmaTitulos;
begin
  frm := TfrmGeVendaConfirmaTitulos.Create(AOwer);
  try
    frm.AnoVenda      := Ano;
    frm.ControleVenda := Controle;
    frm.TotalVenda    := ValorVenda;

    Result := (frm.ShowModal = mrOk);
  finally
    frm.Free;
  end;
end;

procedure TfrmGeVendaConfirmaTitulos.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeVendaConfirmaTitulos.FormCreate(Sender: TObject);
begin
  inherited;
  TotalVenda    := 0;
  AnoVenda      := 0;
  ControleVenda := 0;
end;

procedure TfrmGeVendaConfirmaTitulos.FormShow(Sender: TObject);
begin
  inherited;
  with qryTitulos, SelectSQL do
  begin
    Add('where Parcela > 0');
    Add('  and AnoVenda = ' + IntToStr(AnoVenda));
    Add('  and NumVenda = ' + IntToStr(ControleVenda));
    Add('order by numlanc, parcela');
  end;
  
  cdsTitulos.Open;
  if ( not cdsTitulos.IsEmpty ) then
      cdsTitulos.Edit;
end;

procedure TfrmGeVendaConfirmaTitulos.ControlEditEnter(
  Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDataVencimento) or (Sender = dbValor) ) then
    if ( not cdsTitulos.IsEmpty ) then
      if ( cdsTitulos.State <> dsEdit ) then
        cdsTitulos.Edit;
end;

procedure TfrmGeVendaConfirmaTitulos.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbValor ) then
    if ( cdsTitulos.State = dsEdit ) then
    begin
      cdsTitulos.Post;

      cdsTitulos.Next;

      if ( not cdsTitulos.Eof ) then
        dbCodigo.SetFocus
      else
        btnConfirmar.SetFocus;
    end;
end;

procedure TfrmGeVendaConfirmaTitulos.dbgTitulosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(cdsTitulos.RecNo) then
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

procedure TfrmGeVendaConfirmaTitulos.btnConfirmarClick(
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
    ShowWarning('O Valor Total das parcelas não coincide com o Valor Total A Prazo da Venda.');
    cdsTitulos.First;

    dbCodigo.SetFocus;
  end
  else
  begin
    UpdateParcelas;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGeVendaConfirmaTitulos.cdsTitulosCalcFields(
  DataSet: TDataSet);
begin
  cdsTitulosDiaSemana.AsInteger     := DayOfWeek(cdsTitulosDTVENC.AsDateTime);
  cdsTitulosLancamento.AsString     := FormatFloat('0000', cdsTitulosANOLANC.AsInteger) + FormatFloat('000000', cdsTitulosNUMLANC.AsInteger);
  cdsTitulosTotalEntrada.AsCurrency := TotalVenda;
end;

procedure TfrmGeVendaConfirmaTitulos.UpdateParcelas;
begin
  cdsTitulos.First;
  while not cdsTitulos.Eof do
  begin
    updParcela.Close;
    updParcela.ParamByName('vencimento').AsDateTime := cdsTitulosDTVENC.AsDateTime;
    updParcela.ParamByName('valor').AsCurrency      := cdsTitulosVALORREC.AsCurrency;
    updParcela.ParamByName('anovenda').AsInteger := AnoVenda;
    updParcela.ParamByName('numvenda').AsInteger := ControleVenda;
    updParcela.ParamByName('anolanc').AsInteger  := cdsTitulosANOLANC.AsInteger;
    updParcela.ParamByName('numlanc').AsInteger  := cdsTitulosNUMLANC.AsInteger;
    updParcela.ExecSQL;

    cdsTitulos.Next;
  end;
  CommitTransaction;
end;

procedure TfrmGeVendaConfirmaTitulos.DisplayTotais;
var
  cTotalVD ,
  cTotalDC : Currency;
begin
  cTotalVD := StrToCurrDef( StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]), 0 );
  cTotalDC := StrToCurrDef( StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]), 0 );

  lblTotalVenda.Caption     := FormatFloat(',0.00', cTotalVD);
  lblTotalParcelas.Caption  := FormatFloat(',0.00', cTotalDC);
  lblTotalDiferenca.Caption := FormatFloat(',0.00', cTotalVD - cTotalDC);
end;

procedure TfrmGeVendaConfirmaTitulos.dtsTitulosDataChange(
  Sender: TObject; Field: TField);
begin
  DisplayTotais;
end;

procedure TfrmGeVendaConfirmaTitulos.dtsTitulosUpdateData(
  Sender: TObject);
begin
  DisplayTotais;
end;

procedure TfrmGeVendaConfirmaTitulos.cdsTitulosDiaSemanaGetText(
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

procedure TfrmGeVendaConfirmaTitulos.RegistrarRotinaSistema;
begin
  ;
end;

end.
