unit UGeVendaImpressao;

interface

uses
  UGrPadraoImpressao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxGDIPlusClasses, ExtCtrls, Buttons, ComCtrls, DBClient, Provider, DB, frxClass,
  frxDBSet, Mask, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons,
  JvExMask, JvToolEdit,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmGeVendaImpressao = class(TfrmGrPadraoImpressao)
    DpsCidades: TDataSetProvider;
    CdsCidades: TClientDataSet;
    frRelacaoVendaSintetico: TfrxReport;
    DspRelacaoVendaSintetico: TDataSetProvider;
    CdsRelacaoVendaSintetico: TClientDataSet;
    FrdsRelacaoVendaSintetico: TfrxDBDataset;
    lblSituacao: TLabel;
    edSituacao: TComboBox;
    lblData: TLabel;
    lblVendedor: TLabel;
    edVendedor: TComboBox;
    lblCidade: TLabel;
    edCidade: TComboBox;
    DspVendedores: TDataSetProvider;
    CdsVendedores: TClientDataSet;
    frRelacaoVendaAnalitico: TfrxReport;
    DspRelacaoVendaAnalitico: TDataSetProvider;
    CdsRelacaoVendaAnalitico: TClientDataSet;
    FrdsRelacaoVendaAnalitico: TfrxDBDataset;
    frRelacaoVendaComparativo: TfrxReport;
    frRelacaoVendaClienteSintetico: TfrxReport;
    DspRelacaoVendaClienteSintetico: TDataSetProvider;
    CdsRelacaoVendaClienteSintetico: TClientDataSet;
    FrdsRelacaoVendaClienteSintetico: TfrxDBDataset;
    frRelacaoVendaClienteAnalitico: TfrxReport;
    DspRelacaoVendaClienteAnalitico: TDataSetProvider;
    CdsRelacaoVendaClienteAnalitico: TClientDataSet;
    FrdsRelacaoVendaClienteAnalitico: TfrxDBDataset;
    frRelacaoVendaClienteComparativo: TfrxReport;
    DspVendaCompetencia: TDataSetProvider;
    CdsVendaCompetencia: TClientDataSet;
    FrdsVendaCompetencia: TfrxDBDataset;
    chkNFeEmitida: TCheckBox;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    e1Data: TJvDateEdit;
    e2Data: TJvDateEdit;
    frRelacaoVendaRotaEntrega: TfrxReport;
    DspRelacaoVendaRotaEntrega: TDataSetProvider;
    CdsRelacaoVendaRotaEntrega: TClientDataSet;
    FrdsRelacaoVendaRotaEntrega: TfrxDBDataset;
    frRelacaoVendaCfopSintetico: TfrxReport;
    DspRelacaoVendaCfopSintetico: TDataSetProvider;
    CdsRelacaoVendaCfopSintetico: TClientDataSet;
    FrdsRelacaoVendaCfopSintetico: TfrxDBDataset;
    frComissaoVendedorSintetico: TfrxReport;
    DspComissaoVendedorSintetico: TDataSetProvider;
    CdsComissaoVendedorSintetico: TClientDataSet;
    FrdsComissaoVendedorSintetico: TfrxDBDataset;
    fdQryComissaoVendedorSintetico: TFDQuery;
    fdQryEmpresas: TFDQuery;
    fdQryVendedores: TFDQuery;
    fdQryCidades: TFDQuery;
    QryRelacaoVendaSintetico: TFDQuery;
    QryRelacaoVendaRotaEntrega: TFDQuery;
    QryRelacaoVendaAnalitico: TFDQuery;
    QryVendaCompetencia: TFDQuery;
    QryRelacaoVendaClienteSintetico: TFDQuery;
    QryRelacaoVendaClienteAnalitico: TFDQuery;
    QryRelacaoVendaCfopSintetico: TFDQuery;
    frRelacaoRentabilidadeProduto: TfrxReport;
    QryRelacaoRentabilidadeProduto: TFDQuery;
    DspRelacaoRentabilidadeProduto: TDataSetProvider;
    CdsRelacaoRentabilidadeProduto: TClientDataSet;
    FrdsRelacaoRentabilidadeProduto: TfrxDBDataset;
    chkCFOPTituloGerado: TCheckBox;
    dtsCliente: TDataSource;
    fdQryCliente: TFDQuery;
    DspCliente: TDataSetProvider;
    CdsCliente: TClientDataSet;
    lblCliente: TLabel;
    edCliente: TcxLookupComboBox;
    frRelacaoCustoProdutoVendido: TfrxReport;
    QryRelacaoCustoProdutoVendido: TFDQuery;
    DspRelacaoCustoProdutoVendido: TDataSetProvider;
    CdsRelacaoCustoProdutoVendido: TClientDataSet;
    frdsRelacaoCustoProdutoVendido: TfrxDBDataset;    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure edSituacaoChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_VendaCompetencia   ,
    FSQL_RelacaoVendaSintet ,
    FSQL_RelacaoVendaAnalit : TStringList;
    FSQL_RelacaoVendaClienteSintet ,
    FSQL_RelacaoVendaClienteAnalit ,
    FSQL_RelacaoVendaCfopSintet    ,
    FSQL_RelacaoVendaEntrega       ,
    FSQL_ComissaoVendedor          ,
    FSQL_RelacaoRentabilidadeProduto,
    FSQL_RelacaoCustoProdutoVendido : TStringList;
    ICidade   : Array of Integer;
    IVendedor : Array of Integer;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarCidades;
    procedure CarregarCliente;
    procedure CarregarVendedores;

    procedure MontarVendaCompetencia;

    procedure MontarRelacaoVendaVendedorSintetica;
    procedure MontarRelacaoVendaVendedorAnalitica;
    procedure MontarRelacaoVendaVendedorComparativo;
    procedure MontarRelacaoVendaClienteSintetica;
    procedure MontarRelacaoVendaClienteAnalitica;
    procedure MontarRelacaoVendaClienteComparativo;
    procedure MontarRelacaoVendaCfopSintetica;
    procedure MontarRelacaoVendaListaEntrega;
    procedure MontarComissaoVendedor;
    procedure MontarRentabilidadeProduto;
    procedure MontarRelacaoCustoProdutoVendido;
  public
    { Public declarations }
  end;

(*
  Tabelas:
  - TBCIDADE
  - TBESTADO
  - TBVENDAS
  - TVENDASITENS
  - TBVENDEDOR
  - TBCOMPETENCIA
  - TBPRODUTO
  - TBCLIENTE
  - TBCONTREC
  - TBCONTREC_BAIXA

  Views:
  - VW_EMPRESA
  - VW_STATUS_VENDA

  Procedures:

*)

var
  frmGeVendaImpressao: TfrmGeVendaImpressao;

implementation

uses
    System.StrUtils
  , UConstantesDGE
  , UDMBusiness
  , UDMNFe
  , UDMRecursos;

const
  REPORT_RELACAO_VENDA_VENDEDOR_SINTETICO  = 0;
  REPORT_RELACAO_VENDA_VENDEDOR_ANALITICO  = 1;
  REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI  = 2;
  REPORT_RELACAO_VENDA_CLIENTE_SINTETICO   = 3;
  REPORT_RELACAO_VENDA_CLIENTE_ANALITICO   = 4;
  REPORT_RELACAO_VENDA_CLIENTE_COMPARATI   = 5;
  REPORT_RELACAO_VENDA_CFOP_SINTETICO      = 6;
  REPORT_RELACAO_VENDA_LISTA_ENTREGA       = 7;
  REPORT_COMISSAO_VENDEDOR_BAIXA           = 8;
  REPORT_RENTABILIDADE_ESTIMADA_PRODUTO    = 9;
  REPORT_RELACAO_CUSTO_PRODUTO_VENDIDO     = 10;

  SITUACAO_VENDA_PADRAO = 3; // Vendas finalizadas e com NFs emitidas

{$R *.dfm}

procedure TfrmGeVendaImpressao.CarregarCidades;
var
  I : Integer;
begin
  with CdsCidades do
  begin
    Open;

    edCidade.Clear;
    SetLength(ICidade, RecordCount + 1);

    edCidade.Items.Add('(Todas)');
    ICidade[0] := 0;

    I := 1;

    while not Eof do
    begin
      edCidade.Items.Add( FieldByName('cid_nome').AsString );
      ICidade[I] := FieldByName('cid_cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edCidade.ItemIndex := 0;
end;

procedure TfrmGeVendaImpressao.CarregarCliente;
begin
  if not CdsCliente.Active then
  begin
    CdsCliente.Open;
    edCliente.EditValue := 0;
  end;
end;

procedure TfrmGeVendaImpressao.FormCreate(Sender: TObject);
begin
  e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
  e2Data.Date := GetDateDB;
  edSituacao.ItemIndex := SITUACAO_VENDA_PADRAO; // Vendas finalizadas e com NF-e emitidas

  inherited;

  FSQL_VendaCompetencia := TStringList.Create;
  FSQL_VendaCompetencia.AddStrings( QryVendaCompetencia.SQL );

  FSQL_RelacaoVendaSintet := TStringList.Create;
  FSQL_RelacaoVendaSintet.AddStrings( QryRelacaoVendaSintetico.SQL );

  FSQL_RelacaoVendaAnalit := TStringList.Create;
  FSQL_RelacaoVendaAnalit.AddStrings( QryRelacaoVendaAnalitico.SQL );

  FSQL_RelacaoVendaClienteSintet := TStringList.Create;
  FSQL_RelacaoVendaClienteSintet.AddStrings( QryRelacaoVendaClienteSintetico.SQL );

  FSQL_RelacaoVendaClienteAnalit := TStringList.Create;
  FSQL_RelacaoVendaClienteAnalit.AddStrings( QryRelacaoVendaClienteAnalitico.SQL );

  FSQL_RelacaoVendaCfopSintet := TStringList.Create;
  FSQL_RelacaoVendaCfopSintet.AddStrings( QryRelacaoVendaCfopSintetico.SQL );

  FSQL_RelacaoVendaEntrega := TStringList.Create;
  FSQL_RelacaoVendaEntrega.AddStrings( QryRelacaoVendaRotaEntrega.SQL );

  FSQL_ComissaoVendedor := TStringList.Create;
  FSQL_ComissaoVendedor.AddStrings( fdQryComissaoVendedorSintetico.SQL );

  FSQL_RelacaoRentabilidadeProduto := TStringList.Create;
  FSQL_RelacaoRentabilidadeProduto.AddStrings( QryRelacaoRentabilidadeProduto.SQL );

  FSQL_RelacaoCustoProdutoVendido := TStringList.Create;
  FSQL_RelacaoCustoProdutoVendido.AddStrings( QryRelacaoCustoProdutoVendido.SQL );
end;

procedure TfrmGeVendaImpressao.FormShow(Sender: TObject);
begin
  WaitAMoment(WAIT_AMOMENT_LoadData);
  try
    CarregarEmpresa;
    CarregarVendedores;
    CarregarCidades;
    CarregarCliente;
  finally
    WaitAMomentFree;
    edRelatorioChange(edRelatorio);
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaVendedorSintetica;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if chkNFeEmitida.Visible and chkNFeEmitida.Checked then
      SubTituloRelario := 'NF-e / NFC-e Emitidas';

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaSintetico.Close;

    with QryRelacaoVendaSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , coalesce(vi.codvendedor, v.vendedor_cod)');
      SQL.Add('  , d.nome');
      SQL.Add('  , d.cpf');
      SQL.Add('  , d.comissao');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.nome');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de vendas por vendedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRentabilidadeProduto;
var
  aPeriodoCompra : String;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if chkNFeEmitida.Visible and chkNFeEmitida.Checked then
      SubTituloRelario := 'NF-e / NFC-e Emitidas';

    if ( chkCFOPTituloGerado.Visible ) then
      if ( chkCFOPTituloGerado.Checked ) then
        SubTituloRelario := edSituacao.Text + ' (' + chkCFOPTituloGerado.Caption + ')';

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    if ( edCliente.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para o cliente %s.', [e1Data.Text, e2Data.Text, edCliente.Text]);

    CdsRelacaoVendaCfopSintetico.Close;

    aPeriodoCompra := '(cp.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ') and (cp.status in (' + IntToStr(STATUS_CMP_FIN) + ', ' + IntToStr(STATUS_CMP_NFE) + '))';

    with QryRelacaoRentabilidadeProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoRentabilidadeProduto );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
      begin
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));
        aPeriodoCompra := aPeriodoCompra + ' and (cp.dtent >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e1Data.Date)) + ')';
      end;

      if StrIsDateTime(e2Data.Text) then
      begin
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));
        aPeriodoCompra := aPeriodoCompra + ' and (cp.dtent <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd', e2Data.Date)) + ')';
      end;

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(i.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( edCliente.ItemIndex > 0 ) and ( VarToStr(edCliente.EditValue) <> '0' ) then
        SQL.Add('  and (v.codcliente = ' + VarToStr(edCliente.EditValue) + ')');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and (v.nfe is not null) ');

      if ( chkCFOPTituloGerado.Visible ) then
        if ( chkCFOPTituloGerado.Checked ) then
          SQL.Add('  and (v.cfop_gera_titulo = 1) ');

      SQL.Text := StringReplace(SQL.Text, '1=1', aPeriodoCompra, [rfReplaceAll]);

      SQL.Add('group by');
      SQL.Add('    v.codemp');
      SQL.Add('  , v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , i.codprod');
      SQL.Add('  , p.descri_apresentacao');
      SQL.Add('  , p.customedio');
      SQL.Add('  , c.total_compras');
      SQL.Add('  , c.total_custo');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    v.codemp');
      SQL.Add('  , v.competencia');
      SQL.Add('  , p.descri_apresentacao');
      SQL.Add('  , i.codprod');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório de rentabilidade das vendas por produto.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
    Format('- Período  : %s a %s', [e1Data.Text, e2Data.Text]) + #13 +
    Format('- Situação : %s', [edSituacao.Text]) + #13 +
    Format('- Vendedor : %s', [edVendedor.Text]) + #13 +
    Format('- Cidade   : %s', [edCidade.Text])   + #13 +
    IfThen(chkNFeEmitida.Visible and chkNFeEmitida.Checked, '- Apenas com NFs emitida(s)', EmptyStr);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    // Por vendedores

    REPORT_RELACAO_VENDA_VENDEDOR_SINTETICO:
      begin
        MontarRelacaoVendaVendedorSintetica;
        frReport := frRelacaoVendaSintetico;
      end;

    REPORT_RELACAO_VENDA_VENDEDOR_ANALITICO:
      begin
        MontarRelacaoVendaVendedorAnalitica;
        frReport := frRelacaoVendaAnalitico;
      end;

    REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI:
      begin
        MontarVendaCompetencia;
        MontarRelacaoVendaVendedorComparativo;
        frReport := frRelacaoVendaComparativo;
      end;

    REPORT_COMISSAO_VENDEDOR_BAIXA:
      begin
        MontarComissaoVendedor;
        frReport := frComissaoVendedorSintetico;
      end;

    // Por Clientes

    REPORT_RELACAO_VENDA_CLIENTE_SINTETICO:
      begin
        MontarRelacaoVendaClienteSintetica;
        frReport := frRelacaoVendaClienteSintetico;
      end;

    REPORT_RELACAO_VENDA_CLIENTE_ANALITICO:
      begin
        MontarRelacaoVendaClienteAnalitica;
        frReport := frRelacaoVendaClienteAnalitico;
      end;

    REPORT_RELACAO_VENDA_CLIENTE_COMPARATI:
      begin
        MontarVendaCompetencia;
        MontarRelacaoVendaClienteComparativo;
        frReport := frRelacaoVendaClienteComparativo;
      end;

    // Por CFOP
    REPORT_RELACAO_VENDA_CFOP_SINTETICO:
      begin
        MontarRelacaoVendaCfopSintetica;
        frReport := frRelacaoVendaCfopSintetico;
      end;

    // Por Cidade

    REPORT_RELACAO_VENDA_LISTA_ENTREGA:
      begin
        MontarRelacaoVendaListaEntrega;
        frReport := frRelacaoVendaRotaEntrega;
      end;

    // Por Produto

    REPORT_RENTABILIDADE_ESTIMADA_PRODUTO:
      begin
        MontarRentabilidadeProduto;
        frReport := frRelacaoRentabilidadeProduto;
      end;

    REPORT_RELACAO_CUSTO_PRODUTO_VENDIDO:
      begin
        MontarRelacaoCustoProdutoVendido;
        frReport := frRelacaoCustoProdutoVendido;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeVendaImpressao.CarregarVendedores;
var
  I : Integer;
begin
  with CdsVendedores do
  begin
    Open;

    edVendedor.Clear;
    SetLength(IVendedor, RecordCount + 1);

    edVendedor.Items.Add('(Todos)');
    IVendedor[0] := 0;

    I := 1;

    while not Eof do
    begin
      edVendedor.Items.Add( FieldByName('nome').AsString );
      IVendedor[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edVendedor.ItemIndex := 0;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaVendedorAnalitica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaAnalitico.Close;

    with QryRelacaoVendaAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaAnalit );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        SITUACAO_VENDA_PADRAO:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( edCliente.ItemIndex > 0 ) and ( VarToStr(edCliente.EditValue) <> '0' ) then
        SQL.Add('  and (v.codcliente = ' + VarToStr(edCliente.EditValue) + ')');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , coalesce(vi.codvendedor, v.vendedor_cod)');
      SQL.Add('  , d.nome');
      SQL.Add('  , d.cpf');
      SQL.Add('  , d.comissao');
      SQL.Add('  , v.ano');
      SQL.Add('  , v.codcontrol');
      SQL.Add('  , v.dtvenda');
      SQL.Add('  , v.nfe');
      SQL.Add('  , v.serie');
      SQL.Add('  , v.status');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.nome');
      SQL.Add('  , coalesce(vi.codvendedor, v.vendedor_cod)');
      SQL.Add('  , v.competencia');
      SQL.Add('  , v.dtvenda');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de vendas por vendedor/competência.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  //if ( (edRelatorio.ItemIndex = REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI) or (edRelatorio.ItemIndex = REPORT_RELACAO_VENDA_CLIENTE_COMPARATI) ) then
  if ( edRelatorio.ItemIndex in [REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI, REPORT_RELACAO_VENDA_CLIENTE_COMPARATI] ) then
  begin
    e1Data.Date := StrToDate('01/01/' + FormatDateTime('yyyy', GetDateDB));
    e2Data.Date := StrToDate('31/12/' + FormatDateTime('yyyy', GetDateDB));

    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := SITUACAO_VENDA_PADRAO;
  end
  else
  if (edRelatorio.ItemIndex = REPORT_RELACAO_VENDA_LISTA_ENTREGA) then
  begin
    e1Data.Date := GetDateDB - 7;
    e2Data.Date := GetDateDB;

    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := SITUACAO_VENDA_PADRAO;
  end
  else
  if (edRelatorio.ItemIndex in [REPORT_COMISSAO_VENDEDOR_BAIXA]) then
  begin
    e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
    e2Data.Date := GetDateDB;

    edSituacao.Enabled   := False;
    edSituacao.ItemIndex := SITUACAO_VENDA_PADRAO;
  end
  else
  begin
    e1Data.Date := StrToDate('01/' + FormatDateTime('mm/yyyy', GetDateDB));
    e2Data.Date := GetDateDB;

    edSituacao.Enabled := True;
  end;

  if (edRelatorio.ItemIndex in [REPORT_RELACAO_VENDA_CFOP_SINTETICO, REPORT_COMISSAO_VENDEDOR_BAIXA]) then
  begin
    edCidade.ItemIndex := 0;
    edCidade.Enabled   := False;
  end
  else
    edCidade.Enabled   := True;

  lblCliente.Visible := (edRelatorio.ItemIndex in [
      REPORT_RELACAO_VENDA_VENDEDOR_ANALITICO
    , REPORT_RELACAO_VENDA_CLIENTE_ANALITICO
    , REPORT_RENTABILIDADE_ESTIMADA_PRODUTO]);
  edCliente.Visible  := lblCliente.Visible;

  chkNFeEmitida.Visible := (not (edRelatorio.ItemIndex in [
      REPORT_RELACAO_VENDA_VENDEDOR_COMPARATI
    , REPORT_RELACAO_VENDA_CLIENTE_COMPARATI
    , REPORT_RELACAO_VENDA_LISTA_ENTREGA
    , REPORT_COMISSAO_VENDEDOR_BAIXA]));

  chkCFOPTituloGerado.Visible := (edRelatorio.ItemIndex in [REPORT_RENTABILIDADE_ESTIMADA_PRODUTO, REPORT_RELACAO_CUSTO_PRODUTO_VENDIDO]);
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaVendedorComparativo;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaSintetico.Close;

    with QryRelacaoVendaSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));
      SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));
          
        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , coalesce(vi.codvendedor, v.vendedor_cod)');
      SQL.Add('  , d.nome');
      SQL.Add('  , d.cpf');
      SQL.Add('  , d.comissao');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    d.nome');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório comparativo sintético de vendas por vendedor.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarComissaoVendedor;
var
  sWhr1 ,
  sWhr2 : String;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edVendedor.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Baixas (recebimentos) no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Baixas (recebimentos) no período de %s a %s, para o(a) vendedor(a) %s.', [e1Data.Text, e2Data.Text, edVendedor.Text]);

    CdsComissaoVendedorSintetico.Close;

    with fdQryComissaoVendedorSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_ComissaoVendedor );

      sWhr1 := '(v.codemp  = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')';
      sWhr2 := '(c.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')';

      if ( edVendedor.ItemIndex > 0 ) then
        sWhr1 := sWhr1 + '  and (coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]) + ')';

      if StrIsDateTime(e1Data.Text) then
        sWhr2 := sWhr2 + '  and (b.data_pagto >= :data_inicial)';

      if StrIsDateTime(e2Data.Text) then
        sWhr2 := sWhr2 + '  and (b.data_pagto <= :data_final)';

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          sWhr1 := sWhr1 + '  and (v.nfe is not null)';

      SQL.Text := StringReplace(SQL.Text, '0 = 0', sWhr1, [rfReplaceAll]);
      SQL.Text := StringReplace(SQL.Text, '1 = 1', sWhr2, [rfReplaceAll]);

      CdsComissaoVendedorSintetico.FetchParams;

      if StrIsDateTime(e1Data.Text) then
        CdsComissaoVendedorSintetico.ParamByName('data_inicial').AsDateTime := e1Data.Date;
      if StrIsDateTime(e2Data.Text) then
        CdsComissaoVendedorSintetico.ParamByName('data_final').AsDateTime   := e2Data.Date;
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de baixas realizadas para comissionamento dos vendedores.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoCustoProdutoVendido;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if chkNFeEmitida.Visible and chkNFeEmitida.Checked then
      SubTituloRelario := 'NF-e / NFC-e Emitidas';

    if ( chkCFOPTituloGerado.Visible ) then
      if ( chkCFOPTituloGerado.Checked ) then
        SubTituloRelario := edSituacao.Text + ' (' + chkCFOPTituloGerado.Caption + ')';

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoCustoProdutoVendido.Close;

    with QryRelacaoCustoProdutoVendido do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoCustoProdutoVendido );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(i.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and (v.nfe is not null) ');

      if ( chkCFOPTituloGerado.Visible ) then
        if ( chkCFOPTituloGerado.Checked ) then
          SQL.Add('  and (v.cfop_gera_titulo = 1) ');

      SQL.Add('group by');
      SQL.Add('    v.codemp');
      SQL.Add('  , v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , i.codprod');
      SQL.Add('  , p.descri_apresentacao');
      SQL.Add('  , p.codgrupo');
      SQL.Add('  , g.descri');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    v.codemp');
      SQL.Add('  , v.competencia');
      SQL.Add('  , g.descri');
      SQL.Add('  , p.codgrupo');
      SQL.Add('  , p.descri_apresentacao');
      SQL.Add('  , i.codprod');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório de custo dos produtos vendidos.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaCfopSintetica;
begin
  try
    SubTituloRelario := edSituacao.Text;
    if chkNFeEmitida.Visible and chkNFeEmitida.Checked then
      SubTituloRelario := 'NF-e / NFC-e Emitidas';

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    if ( edCliente.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para o cliente %s.', [e1Data.Text, e2Data.Text, edCliente.Text]);

    CdsRelacaoVendaCfopSintetico.Close;

    with QryRelacaoVendaCfopSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaCfopSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.codemp');
      SQL.Add('  , v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.cfop');
      SQL.Add('  , f.cfop_descricao');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    v.codemp');
      SQL.Add('  , v.competencia');
      SQL.Add('  , v.cfop');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de vendas por CFOP.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaClienteAnalitica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaClienteAnalitico.Close;

    with QryRelacaoVendaClienteAnalitico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaClienteAnalit );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        SITUACAO_VENDA_PADRAO:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( edCliente.ItemIndex > 0 ) and ( VarToStr(edCliente.EditValue) <> '0' ) then
        SQL.Add('  and (v.codcliente = ' + VarToStr(edCliente.EditValue) + ')');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , coalesce(vi.codvendedor, v.vendedor_cod)');
      SQL.Add('  , d.nome');
      SQL.Add('  , d.cpf');
      SQL.Add('  , d.comissao');
      SQL.Add('  , v.ano');
      SQL.Add('  , v.codcontrol');
      SQL.Add('  , v.dtvenda');
      SQL.Add('  , v.nfe');
      SQL.Add('  , v.serie');
      SQL.Add('  , v.status');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , v.competencia');
      SQL.Add('  , v.dtvenda');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório analítico de vendas por cliente/competência.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaClienteComparativo;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaClienteSintetico.Close;

    with QryRelacaoVendaClienteSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaClienteSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.codcli');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório comparativo sintético de vendas por cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaClienteSintetica;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaClienteSintetico.Close;

    with QryRelacaoVendaClienteSintetico do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaClienteSintet );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and coalesce(vi.codvendedor, v.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('  , v.codcli');
      SQL.Add('  , c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    c.nome');
      SQL.Add('  , c.cnpj');
      SQL.Add('  , v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relatório sintético de vendas por cliente.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarRelacaoVendaListaEntrega;
var
  sWhr : String;
begin
  try
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);

    CdsRelacaoVendaRotaEntrega.Close;

    with QryRelacaoVendaRotaEntrega do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoVendaEntrega );

      sWhr := '(vn.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')';

      if StrIsDateTime(e1Data.Text) then
        sWhr := sWhr + '  and (vn.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)) + ')';

      if StrIsDateTime(e2Data.Text) then
        sWhr := sWhr + '  and (vn.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)) + ')';

      Case edSituacao.ItemIndex of
        1:
          sWhr := sWhr + '  and (vn.status = ' + IntToStr(STATUS_VND_FIN) + ')';

        2:
          sWhr := sWhr + '  and (vn.status = ' + IntToStr(STATUS_VND_NFE) + ')';

        SITUACAO_VENDA_PADRAO:
          sWhr := sWhr + '  and (vn.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE) + ')';

        4:
          sWhr := sWhr + '  and (vn.status = ' + IntToStr(STATUS_VND_CAN) + ')';

        else
          sWhr := sWhr + '  and (vn.status > ' + IntToStr(STATUS_VND_AND) + ')'; // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        sWhr := sWhr + '  and (coalesce(vi.codvendedor, vn.vendedor_cod) = ' + IntToStr(IVendedor[edVendedor.ItemIndex]) + ')';

      if ( edCidade.ItemIndex > 0 ) then
        sWhr := sWhr + '  and ( ((cl.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (cl.cidade = ' + QuotedStr(edCidade.Text) + ')) )';

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          sWhr := sWhr + '  and (v.nfe is not null)';

      SQL.Text := StringReplace(SQL.Text, '1=1', sWhr, [rfReplaceAll]);
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de vendas para entrega por cidade.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.MontarVendaCompetencia;
begin
  try
(*
    SubTituloRelario := edSituacao.Text;

    if ( edCidade.ItemIndex = 0 ) then
      PeriodoRelatorio := Format('Vendas no período de %s a %s.', [e1Data.Text, e2Data.Text])
    else
      PeriodoRelatorio := Format('Vendas no período de %s a %s, para a cidade de %s.', [e1Data.Text, e2Data.Text, edCidade.Text]);
*)
    CdsVendaCompetencia.Close;

    with QryVendaCompetencia do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_VendaCompetencia );
      SQL.Add('where v.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if StrIsDateTime(e1Data.Text) then
        SQL.Add('  and v.dtvenda >= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 00:00:00"', e1Data.Date)));

      if StrIsDateTime(e2Data.Text) then
        SQL.Add('  and v.dtvenda <= ' + QuotedStr(FormatDateTime('yyyy.mm.dd " 23:59:59"', e2Data.Date)));

      Case edSituacao.ItemIndex of
        1:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_FIN));

        2:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_NFE));

        3:
          SQL.Add('  and v.status between ' + IntToStr(STATUS_VND_FIN) + ' and ' + IntToStr(STATUS_VND_NFE));

        4:
          SQL.Add('  and v.status = ' + IntToStr(STATUS_VND_CAN));

        else
          SQL.Add('  and v.status > ' + IntToStr(STATUS_VND_AND)); // Todas as vendas, com excesão das vendas "em atendimento"
      end;

      if ( edVendedor.ItemIndex > 0 ) then
        SQL.Add('  and v.vendedor_cod = ' + IntToStr(IVendedor[edVendedor.ItemIndex]));

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and ((c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + '))');

      if ( chkNFeEmitida.Visible ) then
        if ( chkNFeEmitida.Checked ) then
          SQL.Add('  and v.nfe is not null ');

      SQL.Add('group by');
      SQL.Add('    v.competencia');
      SQL.Add('  , m.cmp_desc');
      SQL.Add('');
      SQL.Add('order by');
      SQL.Add('    v.competencia');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a tabela resumo das vendas por competência.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
//      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeVendaImpressao.edSituacaoChange(Sender: TObject);
begin
  inherited;
  chkNFeEmitida.Visible := (edSituacao.ItemIndex = 4); // Vendas canceladas
end;

procedure TfrmGeVendaImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IEmpresa[edEmpresa.ItemIndex]);
      DMBusiness.ConfigurarEmail(IEmpresa[edEmpresa.ItemIndex], EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeVendaImpressao.CarregarEmpresa;
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

initialization
  FormFunction.RegisterForm('frmGeVendaImpressao', TfrmGeVendaImpressao);

end.
