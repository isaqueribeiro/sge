unit UGeOSConfirmaTitulos;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBUpdateSQL,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls, DBClient, Provider, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White;

type
  TfrmGeOSConfirmaTitulos = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    Bevel1: TBevel;
    qryTitulos: TIBDataSet;
    dtsTitulos: TDataSource;
    dbgTitulos: TDBGrid;
    Bevel2: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    dbParcela: TDBEdit;
    lblParcela: TLabel;
    lblEmissao: TLabel;
    dbEmissao: TDBEdit;
    dspTitulos: TDataSetProvider;
    cdsTitulos: TClientDataSet;
    cdsTitulosANOLANC: TSmallintField;
    cdsTitulosNUMLANC: TIntegerField;
    cdsTitulosPARCELA: TSmallintField;
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
    lblTotalOS: TLabel;
    Label2: TLabel;
    lblTotalParcelas: TLabel;
    Label3: TLabel;
    lblTotalDiferenca: TLabel;
    cdsTitulosDiaSemana: TSmallintField;
    cdsTitulosVALORREC: TBCDField;
    btnConfirmar: TcxButton;
    btFechar: TcxButton;
    fdQryFormaPagto: TFDQuery;
    dtsFormaPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblDataVencimento: TLabel;
    dbDataVencimento: TDBEdit;
    dbValor: TDBEdit;
    lblValor: TLabel;
    cdsTitulosFORMA_PAGTO: TSmallintField;
    cdsTitulosVALORRECTOT: TBCDField;
    cdsTitulosVALORSALDO: TBCDField;
    cdsTitulosBAIXADO: TSmallintField;
    cdsTitulosCNPJ: TWideStringField;
    cdsTitulosTIPPAG: TWideStringField;
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
    procedure cdsTitulosBeforePost(DataSet: TDataSet);
    procedure cdsTitulosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    fAnoOS ,
    fControleOS : Integer;
    fTotalOS    : Currency;
    fDataEmissaoDOC : TDateTime;
    procedure UpdateParcelas;
    procedure DisplayTotais;
  public
    { Public declarations }
    property AnoOS      : Integer read fAnoOS write fAnoOS;
    property ControleOS : Integer read fControleOS write fControleOS;
    property TotalOS    : Currency read fTotalOS write fTotalOS;
    property DataEmissaoDOC : TDateTime read fDataEmissaoDOC write fDataEmissaoDOC;

    procedure RegistrarRotinaSistema; override;
  end;

var
  frmGeOSConfirmaTitulos: TfrmGeOSConfirmaTitulos;

  function TitulosConfirmados(const AOwer : TComponent; pAno, pControle : Integer;
    pDataEmissaoNF : TDateTime; pValorOS : Currency) : Boolean;

implementation

uses DateUtils, UDMBusiness;

{$R *.dfm}

function TitulosConfirmados(const AOwer : TComponent; pAno, pControle : Integer;
  pDataEmissaoNF : TDateTime; pValorOS : Currency) : Boolean;
var
  frm : TfrmGeOSConfirmaTitulos;
begin
  frm := TfrmGeOSConfirmaTitulos.Create(AOwer);
  try
    frm.AnoOS      := pAno;
    frm.ControleOS := pControle;
    frm.TotalOS    := pValorOS;
    frm.DataEmissaoDOC := pDataEmissaoNF;

    Result := (frm.ShowModal = mrOk);
  finally
    frm.Free;
  end;
end;

procedure TfrmGeOSConfirmaTitulos.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeOSConfirmaTitulos.FormCreate(Sender: TObject);
begin
  inherited;
  TotalOS    := 0;
  AnoOS      := 0;
  ControleOS := 0;
  DataEmissaoDOC := Date;

  CarregarListaDB(fdQryFormaPagto);
end;

procedure TfrmGeOSConfirmaTitulos.FormShow(Sender: TObject);
begin
  inherited;
  with qryTitulos, SelectSQL do
  begin
    Add('where Parcela > 0');
    Add('  and AnoOS = ' + IntToStr(AnoOS));
    Add('  and NumOS = ' + IntToStr(ControleOS));
    Add('order by numlanc, parcela');
  end;
  
  cdsTitulos.Open;
  if ( not cdsTitulos.IsEmpty ) then
      cdsTitulos.Edit;
end;

procedure TfrmGeOSConfirmaTitulos.ControlEditEnter(
  Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDataVencimento) or (Sender = dbValor) ) then
    if ( not cdsTitulos.IsEmpty ) then
      if ( cdsTitulos.State <> dsEdit ) then
        cdsTitulos.Edit;
end;

procedure TfrmGeOSConfirmaTitulos.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbValor ) then
    if ( cdsTitulos.State = dsEdit ) then
    begin
      if (cdsTitulosDTVENC.AsDateTime < DataEmissaoDOC) then
      begin
        ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Fatura');
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

procedure TfrmGeOSConfirmaTitulos.dbgTitulosDrawColumnCell(
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

procedure TfrmGeOSConfirmaTitulos.btnConfirmarClick(
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
    ShowWarning('O Valor Total das parcelas não coincide com o Valor Total A Prazo da Ordem de Serviço.');
    cdsTitulos.First;

    dbCodigo.SetFocus;
  end
  else
  begin
    UpdateParcelas;
    ModalResult := mrOk;
  end;
end;

procedure TfrmGeOSConfirmaTitulos.cdsTitulosAfterScroll(DataSet: TDataSet);
begin
  // Bloquear edição dos campos quando já houver pagamentos realizados ou o título já estiver baixado
  dbFormaPagto.ReadOnly     := (DataSet.FieldByName('ValorrecTot').AsCurrency > 0) or (DataSet.FieldByName('BAIXADO').AsInteger = 0);
  dbDataVencimento.ReadOnly := (DataSet.FieldByName('ValorrecTot').AsCurrency > 0) or (DataSet.FieldByName('BAIXADO').AsInteger = 0);
  dbValor.ReadOnly          := (DataSet.FieldByName('ValorrecTot').AsCurrency > 0) or (DataSet.FieldByName('BAIXADO').AsInteger = 0);
end;

procedure TfrmGeOSConfirmaTitulos.cdsTitulosBeforePost(DataSet: TDataSet);
begin
  if (cdsTitulosDTVENC.AsDateTime < DataEmissaoDOC) then
  begin
    if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
    ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Fatura');
    Abort;
  end
  else
    inherited;
end;

procedure TfrmGeOSConfirmaTitulos.cdsTitulosCalcFields(
  DataSet: TDataSet);
begin
  cdsTitulosDiaSemana.AsInteger     := DayOfWeek(cdsTitulosDTVENC.AsDateTime);
  cdsTitulosLancamento.AsString     := FormatFloat('0000', cdsTitulosANOLANC.AsInteger) + FormatFloat('000000', cdsTitulosNUMLANC.AsInteger);
  cdsTitulosTotalEntrada.AsCurrency := TotalOS;
end;

procedure TfrmGeOSConfirmaTitulos.UpdateParcelas;
begin
  cdsTitulos.First;
  while not cdsTitulos.Eof do
  begin
    fdQryFormaPagto.Locate('COD', cdsTitulosFORMA_PAGTO.AsInteger, []);

    updParcela.Close;
    updParcela.ParamByName('Tippag').AsString       := fdQryFormaPagto.FieldByName('DESCRI').AsString;
    updParcela.ParamByName('Forma_Pagto').AsInteger := cdsTitulosFORMA_PAGTO.AsInteger;
    updParcela.ParamByName('vencimento').AsDateTime := cdsTitulosDTVENC.AsDateTime;
    updParcela.ParamByName('valor').AsCurrency      := cdsTitulosVALORREC.AsCurrency;
    updParcela.ParamByName('anoos').AsInteger   := AnoOS;
    updParcela.ParamByName('numos').AsInteger   := ControleOS;
    updParcela.ParamByName('anolanc').AsInteger := cdsTitulosANOLANC.AsInteger;
    updParcela.ParamByName('numlanc').AsInteger := cdsTitulosNUMLANC.AsInteger;
    updParcela.ExecSQL;

    cdsTitulos.Next;
  end;
  CommitTransaction;
end;

procedure TfrmGeOSConfirmaTitulos.DisplayTotais;
var
  cTotalOS ,
  cTotalDC : Currency;
begin
  cTotalOS := StrToCurrDef( StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]), 0 );
  cTotalDC := StrToCurrDef( StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]), 0 );

  lblTotalOS.Caption        := FormatFloat(',0.00', cTotalOS);
  lblTotalParcelas.Caption  := FormatFloat(',0.00', cTotalDC);
  lblTotalDiferenca.Caption := FormatFloat(',0.00', cTotalOS - cTotalDC);
end;

procedure TfrmGeOSConfirmaTitulos.dtsTitulosDataChange(
  Sender: TObject; Field: TField);
begin
  DisplayTotais;
end;

procedure TfrmGeOSConfirmaTitulos.dtsTitulosUpdateData(
  Sender: TObject);
begin
  DisplayTotais;
end;

procedure TfrmGeOSConfirmaTitulos.cdsTitulosDiaSemanaGetText(
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

procedure TfrmGeOSConfirmaTitulos.RegistrarRotinaSistema;
begin
  ;
end;

end.
