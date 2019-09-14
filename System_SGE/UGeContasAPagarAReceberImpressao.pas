unit UGeContasAPagarAReceberImpressao;

interface

uses
  UGrPadraoImpressao,
  UConstantesDGE,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, Vcl.StdCtrls, cxButtons,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ExtCtrls, dxGDIPlusClasses,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Mask, JvExMask, JvToolEdit, frxClass, frxDBSet,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeContasAPagarAReceberImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    fdQryEmpresas: TFDQuery;
    frCRxCP_PorVencimento: TfrxReport;
    QryCRxCP_PorVencimento: TFDQuery;
    DspCRxCP_PorVencimento: TDataSetProvider;
    CdsCRxCP_PorVencimento: TClientDataSet;
    FrdsCRxCP_PorVencimento: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_DemonstResultOper : TStringList;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;

    procedure MontarRelatorioAPagarAReceberPorVencimento;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCONTPAG
  - TBCONTREC
  - TBCOMPRAS
  - TBVENDAS
  - TBCOMPETENCIA

  Views:
  - VW_EMPRESA

  Procedures:
*)

var
  frmGeContasAPagarAReceberImpressao: TfrmGeContasAPagarAReceberImpressao;

const
  REPORT_CONTAS_APAGAR_ARECEBER_VENCIMENTO = 0;
  REPORT_CONTAS_APAGAR_ARECEBER_FONTE      = 1;

implementation

uses
    DateUtils
  , UDMBusiness
  , UDMNFe
  , UDMRecursos;

{$R *.dfm}

{ TfrmGeFluxoCaixaImpressao }

procedure TfrmGeContasAPagarAReceberImpressao.btnVisualizarClick(Sender: TObject);
var
  aVencimento : TDateTime;
begin
  if (not TryStrToDate(e1Data.Text, aVencimento)) or (not TryStrToDate(e2Data.Text, aVencimento)) then
    ShowWarning('Informe o período de vencimento')
  else
  begin
    Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '       + #13 +
      Format('- Período de Vencimento : %s a %s', [e1Data.Text, e2Data.Text]);

    Screen.Cursor         := crSQLWait;
    btnVisualizar.Enabled := False;

    Case edRelatorio.ItemIndex of
      REPORT_CONTAS_APAGAR_ARECEBER_VENCIMENTO:
        begin
          MontarRelatorioAPagarAReceberPorVencimento;
          frReport := frCRxCP_PorVencimento;
        end;
    end;

    inherited;

    Screen.Cursor         := crDefault;
    btnVisualizar.Enabled := True;
  end;
end;

procedure TfrmGeContasAPagarAReceberImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeContasAPagarAReceberImpressao.CarregarEmpresa;
var
  P ,
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount);

    P := 0;
    I := 0;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('razao').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      if ( IEmpresa[I] = gUsuarioLogado.Empresa ) then
        P := I;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := P;
end;

procedure TfrmGeContasAPagarAReceberImpressao.edRelatorioChange(Sender: TObject);
var
  aDia  : Integer;
  aData : TDateTime;
begin
  inherited;
//  Case edRelatorio.ItemIndex of
//    REPORT_MOVIMENTO_FINANCEIRO_MENSAL_PR :
//      begin
//        aDia  := DayOfWeek(GetDateDB);
//        aData := GetDateDB + (7 - aDia) + 1;
//
//        lblData.Caption := 'Data base final:';
//        e1Data.Date     := aData;
//      end;
//
//    REPORT_DEMONSTRATIVO_RESULTADO_OPERACIONAL :
//      begin
//        lblData.Caption := 'Período:';
//        e1Data.Date     := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
//      end;
//  end;
//
//  e1Data.Visible := (edRelatorio.ItemIndex in [REPORT_MOVIMENTO_FINANCEIRO_MENSAL_PR, REPORT_DEMONSTRATIVO_RESULTADO_OPERACIONAL]);
//  e2Data.Visible := (edRelatorio.ItemIndex in [REPORT_DEMONSTRATIVO_RESULTADO_OPERACIONAL]);
end;

procedure TfrmGeContasAPagarAReceberImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := StrToDate(FormatFloat('00', DaysInMonth(GetDateDB)) + '/' + FormatDateTime('mm/yyyy', GetDateDB));

  inherited;
  edRelatorioChange(edRelatorio);
end;

procedure TfrmGeContasAPagarAReceberImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
end;

procedure TfrmGeContasAPagarAReceberImpressao.MontarRelatorioAPagarAReceberPorVencimento;
begin
  try
    PeriodoRelatorio := Format('Consolidação no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    with CdsCRxCP_PorVencimento do
    begin
      Close;
      ParamByName('empresa').AsString        := IEmpresa[edEmpresa.ItemIndex];
      ParamByName('data_inicial').AsDateTime := e1Data.Date;
      ParamByName('data_final').AsDateTime   := e2Data.Date;
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar o relatório de Contas A Pagar x Contas A Receber por vencimento.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeContasAPagarAReceberImpressao', TfrmGeContasAPagarAReceberImpressao);

end.
