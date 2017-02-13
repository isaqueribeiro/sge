unit UGeResultadoExercicioImpressao;

interface

uses
  UGrPadraoImpressao,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, Vcl.StdCtrls, cxButtons,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ExtCtrls, dxGDIPlusClasses,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, Vcl.Mask, JvExMask, JvToolEdit, frxClass, frxDBSet,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeResultadoExercicioImpressao = class(TfrmGrPadraoImpressao)
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    lblContaCorrente: TLabel;
    edContaCorrente: TComboBox;
    lblData: TLabel;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    QryContaCorrente: TIBQuery;
    DspContaCorrente: TDataSetProvider;
    CdsContaCorrente: TClientDataSet;
    frDemonstResultOper: TfrxReport;
    DspDemonstResultOper: TDataSetProvider;
    CdsDemonstResultOper: TClientDataSet;
    FrdsDemonstResultOper: TfrxDBDataset;
    fdQryDemonstResultOper: TFDQuery;
    fdQryEmpresas: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edEmpresaChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_DemonstResultOper : TStringList;
    IEmpresa : Array of String;
    IConta   : Array of Integer;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarContaCorrente(const pEmpresa : String);

    procedure MontarRelacaoSaldoConsolidadoDia;
    procedure MontarRelacaoMovimentoCaixaConta;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCAIXA_MOVIMENTO
  - TBCONTA_CORRENTE_SALDO
  - TBCONTA_CORRENTE
  - TBBANCO_BOLETO

  Views:

  Procedures:
  - GET_CAIXA_MOVIMENTO
*)

var
  frmGeResultadoExercicioImpressao: TfrmGeResultadoExercicioImpressao;

const
  REPORT_DEMONSTRATIVO_RESULTADO_OPERACIONAL  = 0;

implementation

uses
  UConstantesDGE, UDMBusiness, DateUtils, UDMNFe;

{$R *.dfm}

{ TfrmGeFluxoCaixaImpressao }

procedure TfrmGeResultadoExercicioImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '       + #13 +
    Format('- Período  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- C/C Sist.: %s', [edContaCorrente.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_RELACAO_SALDO_CONSOLIDADO_DIA:
      begin
        MontarRelacaoSaldoConsolidadoDia;
        frReport := frRelacaoSaldoConsolidadoDia;
      end;

    REPORT_RELACAO_MOVIMENTO_CAIXA_CONTA:
      begin
        MontarRelacaoMovimentoCaixaConta;
        frReport := frRelacaoMovimentoCaixa;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeResultadoExercicioImpressao.CarregarContaCorrente(
  const pEmpresa: String);
var
  I : Integer;
begin
  with CdsContaCorrente do
  begin
    Close;
    ParamByName('empresa').AsString := pEmpresa;
    Open;

    edContaCorrente.Clear;
    SetLength(IConta, RecordCount + 1);

    edContaCorrente.Items.Add( '(Todas)' );
    IConta[0] := 0;
    I := 1;

    while not Eof do
    begin
      edContaCorrente.Items.Add( FieldByName('descricao').AsString + ' [' + Trim(FieldByName('tipo_desc').AsString) + ']' );
      IConta[I] := FieldByName('codigo').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edContaCorrente.ItemIndex := 0;
end;

procedure TfrmGeResultadoExercicioImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeResultadoExercicioImpressao.CarregarEmpresa;
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
      edEmpresa.Items.Add( FieldByName('rzsoc').AsString );
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

procedure TfrmGeResultadoExercicioImpressao.edEmpresaChange(Sender: TObject);
begin
  if ( edEmpresa.ItemIndex > -1 ) then
    CarregarContaCorrente(IEmpresa[edEmpresa.ItemIndex]);
end;

procedure TfrmGeResultadoExercicioImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;

  inherited;

  FSQL_RelacaoSaldoConsolidadoDia := TStringList.Create;
  FSQL_RelacaoSaldoConsolidadoDia.AddStrings( QryRelacaoSaldoConsolidadoDia.SQL );

  FSQL_RelacaoMovimentoCaixaConta := TStringList.Create;
  FSQL_RelacaoMovimentoCaixaConta.AddStrings( QryRelacaoMovimentoCaixa.SQL );
end;

procedure TfrmGeResultadoExercicioImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarEmpresa;
  CarregarContaCorrente(gUsuarioLogado.Empresa);
end;

procedure TfrmGeResultadoExercicioImpressao.MontarRelacaoMovimentoCaixaConta;
begin
  try
    SubTituloRelario := edContaCorrente.Text;
    PeriodoRelatorio := Format('Movimentos do período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoMovimentoCaixa.Close;

    with CdsRelacaoMovimentoCaixa, Params do
    begin
      ParamByName('empresa').AsString := IEmpresa[edEmpresa.ItemIndex];
      ParamByName('conta').AsInteger  := IConta[edContaCorrente.ItemIndex];
      ParamByName('data_inicial').AsDateTime := e1Data.Date;
      ParamByName('data_final').AsDateTime   := e2Data.Date;
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório de movimentações na(s) conta(s).' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeResultadoExercicioImpressao.MontarRelacaoSaldoConsolidadoDia;
begin
  try
    SubTituloRelario := edContaCorrente.Text;
    PeriodoRelatorio := Format('Consolidação no período de %s a %s.', [e1Data.Text, e2Data.Text]);

    CdsRelacaoSaldoConsolidadoDia.Close;

    with QryRelacaoSaldoConsolidadoDia do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoSaldoConsolidadoDia );
      SQL.Add('where (cx.situacao = 1)'); // Apenas movimentos ativos
      SQL.Add('  and (cx.empresa  = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');

      if ( edContaCorrente.ItemIndex > 0 ) then
        SQL.Add('  and (cx.conta_corrente = ' + IntToStr(IConta[edContaCorrente.ItemIndex]) + ')');

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and (cast(cx.datahora as date) >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)) + ')');

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and (cast(cx.datahora as date) <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)) + ')');

      SQL.Add('');
      SQL.Add('group by');
      SQL.Add('    cx.conta_corrente');
      SQL.Add('  , cc.descricao');
      SQL.Add('  , cast(cx.datahora as date)');
      SQL.Add('  , bb.bco_nome');
      SQL.Add('  , bb.bco_agencia');
      SQL.Add('  , bb.bco_cc');
      SQL.Add(' ');
      SQL.Add('order by');
      SQL.Add('    cx.conta_corrente');
      SQL.Add('  , cast(cx.datahora as date)');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório de saldo consolidado por dia.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeResultadoExercicioImpressao', TfrmGeResultadoExercicioImpressao);

end.
