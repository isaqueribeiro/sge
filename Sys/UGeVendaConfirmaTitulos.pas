unit UGeVendaConfirmaTitulos;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, DB, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, DBClient, Provider, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, cxControls, cxContainer, cxEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeVendaConfirmaTitulos = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    Bevel1: TBevel;
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
    cdsTitulosTotalParcelas: TAggregateField;
    cdsTitulosTotalEntrada: TCurrencyField;
    dbTotalEntrada: TDBEdit;
    dbTotalParcelas: TDBEdit;
    pnlTotais: TPanel;
    Label1: TLabel;
    lblTotalVenda: TLabel;
    Label2: TLabel;
    lblTotalParcelas: TLabel;
    Label3: TLabel;
    lblTotalDiferenca: TLabel;
    cdsTitulosDiaSemana: TSmallintField;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    cdsTitulosLancamento: TStringField;
    dtsFormaPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    fdQryFormaPagto: TFDQuery;
    qryTitulos: TFDQuery;
    qryTitulosANOLANC: TSmallintField;
    qryTitulosNUMLANC: TIntegerField;
    qryTitulosPARCELA: TSmallintField;
    qryTitulosCNPJ: TStringField;
    qryTitulosTIPPAG: TStringField;
    qryTitulosFORMA_PAGTO: TSmallintField;
    qryTitulosDTEMISS: TDateField;
    qryTitulosDTVENC: TDateField;
    qryTitulosVALORREC: TBCDField;
    qryTitulosVALORRECTOT: TBCDField;
    qryTitulosVALORSALDO: TBCDField;
    qryTitulosBAIXADO: TSmallintField;
    cdsTitulosANOLANC: TSmallintField;
    cdsTitulosNUMLANC: TIntegerField;
    cdsTitulosPARCELA: TSmallintField;
    cdsTitulosCNPJ: TStringField;
    cdsTitulosTIPPAG: TStringField;
    cdsTitulosFORMA_PAGTO: TSmallintField;
    cdsTitulosDTEMISS: TDateField;
    cdsTitulosDTVENC: TDateField;
    cdsTitulosVALORREC: TBCDField;
    cdsTitulosVALORRECTOT: TBCDField;
    cdsTitulosVALORSALDO: TBCDField;
    cdsTitulosBAIXADO: TSmallintField;
    qryContaAReceber: TFDQuery;
    updContaAReceber: TFDUpdateSQL;
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
    procedure cdsTitulosAfterScroll(DataSet: TDataSet);
    procedure cdsTitulosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    fAnoVenda ,
    fControleVenda  : Integer;
    fDataEmissaoDOC : TDateTime;
    fTotalVenda     : Currency;
    procedure UpdateParcelas;
    procedure DisplayTotais;
  public
    { Public declarations }
    property AnoVenda       : Integer read fAnoVenda write fAnoVenda;
    property ControleVenda  : Integer read fControleVenda write fControleVenda;
    property DataEmissaoDOC : TDateTime read fDataEmissaoDOC write fDataEmissaoDOC;
    property TotalVenda     : Currency read fTotalVenda write fTotalVenda;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCONTREC
  - TBFORMPAGTO

  Views:

  Procedures:

*)


var
  frmGeVendaConfirmaTitulos: TfrmGeVendaConfirmaTitulos;

  function TitulosConfirmados(const AOwer : TComponent; Ano, Controle : Integer;
    DataEmissaoNF : TDateTime; ValorVenda : Currency) : Boolean;

implementation

uses DateUtils, UDMBusiness;

{$R *.dfm}

function TitulosConfirmados(const AOwer : TComponent; Ano, Controle : Integer;
  DataEmissaoNF : TDateTime; ValorVenda : Currency) : Boolean;
var
  frm : TfrmGeVendaConfirmaTitulos;
begin
  frm := TfrmGeVendaConfirmaTitulos.Create(AOwer);
  try
    frm.AnoVenda       := Ano;
    frm.ControleVenda  := Controle;
    frm.DataEmissaoDOC := DataEmissaoNF;
    frm.TotalVenda     := ValorVenda;

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
  TotalVenda     := 0;
  AnoVenda       := 0;
  DataEmissaoDOC := Date;
  ControleVenda  := 0;

  CarregarListaDB(fdQryFormaPagto);
end;

procedure TfrmGeVendaConfirmaTitulos.FormShow(Sender: TObject);
begin
  inherited;
  with qryTitulos, SQL do
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
  if ( (Sender = dbFormaPagto) or (Sender = dbDataVencimento) or (Sender = dbValor) ) then
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
      if (cdsTitulosDTVENC.AsDateTime < DataEmissaoDOC) then
      begin
        ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Saída');
        if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
      end
      else
      begin
        cdsTitulos.Post;

        cdsTitulos.Next;

        if ( not cdsTitulos.Eof ) then
          dbCodigo.SetFocus
        else
          btnConfirmar.SetFocus;
      end;
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

procedure TfrmGeVendaConfirmaTitulos.cdsTitulosAfterScroll(DataSet: TDataSet);
begin
  // Bloquear edição dos campos quando já houver pagamentos realizados ou o título já estiver baixado
  dbFormaPagto.ReadOnly     := (DataSet.FieldByName('ValorrecTot').AsCurrency > 0) or (DataSet.FieldByName('BAIXADO').AsInteger = 0);
  dbDataVencimento.ReadOnly := (DataSet.FieldByName('ValorrecTot').AsCurrency > 0) or (DataSet.FieldByName('BAIXADO').AsInteger = 0);
  dbValor.ReadOnly          := (DataSet.FieldByName('ValorrecTot').AsCurrency > 0) or (DataSet.FieldByName('BAIXADO').AsInteger = 0);
end;

procedure TfrmGeVendaConfirmaTitulos.cdsTitulosBeforePost(DataSet: TDataSet);
begin
  if (cdsTitulosDTVENC.AsDateTime < DataEmissaoDOC) then
  begin
    if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
    ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Venda');
    Abort;
  end
  else
    inherited;
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
    fdQryFormaPagto.Locate('COD', cdsTitulosFORMA_PAGTO.AsInteger, []);

    qryContaAReceber.Close;
    qryContaAReceber.ParamByName('anolanc').AsInteger  := cdsTitulosANOLANC.AsInteger;
    qryContaAReceber.ParamByName('numlanc').AsInteger  := cdsTitulosNUMLANC.AsInteger;
    qryContaAReceber.Open;

    qryContaAReceber.Edit;

    qryContaAReceber.FieldByName('Tippag').AsString       := fdQryFormaPagto.FieldByName('DESCRI').AsString;
    qryContaAReceber.FieldByName('Forma_Pagto').AsInteger := cdsTitulosFORMA_PAGTO.AsInteger;
    qryContaAReceber.FieldByName('Dtvenc').AsDateTime     := cdsTitulosDTVENC.AsDateTime;
    qryContaAReceber.FieldByName('Valorrec').AsCurrency   := cdsTitulosVALORREC.AsCurrency;
    qryContaAReceber.FieldByName('anovenda').AsInteger    := AnoVenda;
    qryContaAReceber.FieldByName('numvenda').AsInteger    := ControleVenda;

    qryContaAReceber.Post;
    qryContaAReceber.ApplyUpdates;
    qryContaAReceber.CommitUpdates;

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
