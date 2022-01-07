unit View.Entrada.ConfirmarDuplicatas;

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
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,

  JvExMask,
  JvToolEdit,
  JvDBControls,

  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UGrPadrao,
  SGE.Controller.Interfaces, dxSkinsDefaultPainters;

type
  TViewEntradaConfirmarDuplicatas = class(TfrmGrPadrao)
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
    cdsDuplicatasANOLANC: TSmallintField;
    cdsDuplicatasNUMLANC: TIntegerField;
    cdsDuplicatasPARCELA: TSmallintField;
    cdsDuplicatasCODFORN: TSmallintField;
    cdsDuplicatasNOTFISC: TStringField;
    cdsDuplicatasTIPPAG: TStringField;
    cdsDuplicatasDTEMISS: TDateField;
    cdsDuplicatasDTVENC: TDateField;
    cdsDuplicatasDTPAG: TDateField;
    cdsDuplicatasVALORPAG: TFMTBCDField;
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
    FController : IControllerCustom;
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

  function DuplicatasConfirmadas(const AOwer : TComponent; Ano : Smallint; Controle : Integer;
    DataEmissaoNF : TDateTime; ValorEntrada : Currency) : Boolean;

implementation

uses
  SYstem.DateUtils,
  Controller.Tabela,
  SGE.Controller.Factory,
  Service.Message;

{$R *.dfm}

function DuplicatasConfirmadas(const AOwer : TComponent; Ano : Smallint; Controle : Integer;
  DataEmissaoNF : TDateTime; ValorEntrada : Currency) : Boolean;
var
  frm : TViewEntradaConfirmarDuplicatas;
begin
  frm := TViewEntradaConfirmarDuplicatas.Create(AOwer);
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

procedure TViewEntradaConfirmarDuplicatas.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewEntradaConfirmarDuplicatas.FormCreate(Sender: TObject);
begin
  FController := TControllerFactory.New.ContaAPagar;

  inherited;
  TotalEntrada   := 0;
  AnoCompra      := 0;
  DataEmissaoDOC := Date;
  ControleCompra := 0;

  dspDuplicatas.DataSet := FController.DAO.DataSet;
end;

procedure TViewEntradaConfirmarDuplicatas.FormShow(Sender: TObject);
begin
  inherited;
  if not cdsDuplicatas.Active then
    CarregarDuplicatas;

  if ( not cdsDuplicatas.IsEmpty ) then
    cdsDuplicatas.Edit;
end;

procedure TViewEntradaConfirmarDuplicatas.ControlEditEnter(
  Sender: TObject);
begin
  inherited;
  if ( (Sender = dbDataVencimento) or (Sender = dbValor) ) then
    if ( not cdsDuplicatas.IsEmpty ) then
      if ( cdsDuplicatas.State <> dsEdit ) then
        cdsDuplicatas.Edit;
end;

procedure TViewEntradaConfirmarDuplicatas.ControlEditExit(Sender: TObject);
begin
  inherited;
  if ( Sender = dbValor ) then
    if ( cdsDuplicatas.State = dsEdit ) then
    begin
      if (cdsDuplicatasDTVENC.AsDateTime < DataEmissaoDOC) then
      begin
        TServiceMessage.ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Entrada');
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

procedure TViewEntradaConfirmarDuplicatas.dbgTitulosDrawColumnCell(
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

procedure TViewEntradaConfirmarDuplicatas.btnConfirmarClick(
  Sender: TObject);
var
  cTotalNF ,
  cTotalDC : Currency;
begin
  cTotalNF := StrToCurrDef( Trim(StringReplace(StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]),  'R$', '', [rfReplaceAll])), 0 );
  cTotalDC := StrToCurrDef( Trim(StringReplace(StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]),  'R$', '', [rfReplaceAll])), 0 );

  if ( cTotalNF <> cTotalDC ) then
  begin
    TServiceMessage.ShowWarning('O Valor Total das parcelas não coincide com o Valor Total de Entrada.');
    cdsDuplicatas.First;

    dbCodigo.SetFocus;
  end
  else
  begin
    UpdateParcelas;
    ModalResult := mrOk;
  end;
end;

procedure TViewEntradaConfirmarDuplicatas.CarregarDuplicatas;
begin
  if cdsDuplicatas.Active then
    cdsDuplicatas.Close;

  FController
    .DAO
    .ClearWhere;

  FController
    .DAO
    .Where('p.AnoCompra = :ano')
    .Where('p.NumCompra = :controle')
    .OrderBy('p.numlanc')
    .OrderBy('p.parcela')
    .ParamsByName('ano',      AnoCompra)
    .ParamsByName('controle', ControleCompra);

  cdsDuplicatas.FetchParams;
  cdsDuplicatas.ParamByName('ano').AsInteger      := AnoCompra;
  cdsDuplicatas.ParamByName('controle').AsInteger := ControleCompra;
  cdsDuplicatas.Open;

  // Configurar tabela das duplicatas
  TTabelaController
    .New
    .Tabela( cdsDuplicatas )
    .Display('TotalEntrada', 'Total Entrada (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('VALORPAG', 'Valor A Pagar (R$)', ',0.00', TAlignment.taRightJustify)
    .Display('TotalEntrada',  'Total Entrada',  ',0.00', TAlignment.taRightJustify)
    .Display('TotalParcelas', 'Total Parcelas', ',0.00', TAlignment.taRightJustify)
    .Configurar;
end;

procedure TViewEntradaConfirmarDuplicatas.cdsDuplicatasAfterScroll(DataSet: TDataSet);
begin
  dbDataVencimento.ReadOnly := not cdsDuplicatasDTPAG.IsNull;
  dbValor.ReadOnly          := not cdsDuplicatasDTPAG.IsNull;
end;

procedure TViewEntradaConfirmarDuplicatas.cdsDuplicatasBeforePost(
  DataSet: TDataSet);
begin
  if (cdsDuplicatasDTVENC.AsDateTime < DataEmissaoDOC) then
  begin
    if dbDataVencimento.Visible and dbDataVencimento.Enabled then dbDataVencimento.SetFocus;
    TServiceMessage.ShowWarning('A Data de Vencimento não pode ser menor que a Data de Emissão do Documento de Entrada');
    Abort;
  end
  else
    inherited;
end;

procedure TViewEntradaConfirmarDuplicatas.cdsDuplicatasCalcFields(
  DataSet: TDataSet);
begin
  cdsDuplicatasDiaSemana.AsInteger     := DayOfWeek(cdsDuplicatasDTVENC.AsDateTime);
  cdsDuplicatasLancamento.AsString     := FormatFloat('0000', cdsDuplicatasANOLANC.AsInteger) + FormatFloat('000000', cdsDuplicatasNUMLANC.AsInteger);
  cdsDuplicatasTotalEntrada.AsCurrency := TotalEntrada;
end;

procedure TViewEntradaConfirmarDuplicatas.UpdateParcelas;
var
  aParcela : IControllerCustom;
begin
  aParcela := TControllerFactory.New.ContaAPagar;

  aParcela
    .DAO
    .ClearWhere;

  aParcela
    .DAO
    .Where('p.AnoCompra = :AnoCompra')
    .Where('p.NumCompra = :NumCompra')
    .Where('p.Anolanc   = :Anolanc  ')
    .Where('p.Numlanc   = :Numlanc  ')
    .ParamsByName('AnoCompra', 0)
    .ParamsByName('NumCompra', 0)
    .ParamsByName('Anolanc', 0)
    .ParamsByName('Numlanc', 0);

  try
    cdsDuplicatas.First;
    while not cdsDuplicatas.Eof do
    begin
      aParcela
        .DAO
        .Close
        .ParamsByName('AnoCompra', AnoCompra)
        .ParamsByName('NumCompra', ControleCompra)
        .ParamsByName('Anolanc', cdsDuplicatasANOLANC.AsInteger)
        .ParamsByName('Numlanc', cdsDuplicatasNUMLANC.AsInteger)
        .Open;

      aParcela.DAO.DataSet.Edit;

      aParcela.DAO.DataSet.FieldByName('DTVENC').AsDateTime   := cdsDuplicatasDTVENC.AsDateTime;
      aParcela.DAO.DataSet.FieldByName('VALORPAG').AsCurrency := cdsDuplicatasVALORPAG.AsCurrency;

      aParcela.DAO.DataSet.Post;
      aParcela.DAO.ApplyUpdates;
      aParcela.DAO.CommitUpdates;

      cdsDuplicatas.Next;
    end;
  finally
    aParcela.DAO.CommitTransaction;
  end;
end;

procedure TViewEntradaConfirmarDuplicatas.DisplayTotais;
var
  cTotalNF ,
  cTotalDC : Currency;
begin
  cTotalNF := StrToCurrDef( Trim(StringReplace(StringReplace(dbTotalEntrada.Text,  '.', '', [rfReplaceAll]),  'R$', '', [rfReplaceAll])), 0 );
  cTotalDC := StrToCurrDef( Trim(StringReplace(StringReplace(dbTotalParcelas.Text, '.', '', [rfReplaceAll]),  'R$', '', [rfReplaceAll])), 0 );

  lblTotalEntrada.Caption   := FormatFloat(',0.00', cTotalNF);
  lblTotalParcelas.Caption  := FormatFloat(',0.00', cTotalDC);
  lblTotalDiferenca.Caption := FormatFloat(',0.00', cTotalNF - cTotalDC);
end;

procedure TViewEntradaConfirmarDuplicatas.dtsDuplicatasDataChange(
  Sender: TObject; Field: TField);
begin
  DisplayTotais;
end;

procedure TViewEntradaConfirmarDuplicatas.dtsDuplicatasUpdateData(
  Sender: TObject);
begin
  DisplayTotais;
end;

procedure TViewEntradaConfirmarDuplicatas.cdsDuplicatasDiaSemanaGetText(
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

procedure TViewEntradaConfirmarDuplicatas.cdsDuplicatasVALORPAGSetText(Sender: TField; const Text: string);
begin
  Sender.AsCurrency := StrToCurrDef(StringReplace(Text, '.', '', [rfReplaceAll]), 0.0);
end;

procedure TViewEntradaConfirmarDuplicatas.RegistrarRotinaSistema;
begin
  ;
end;

end.
