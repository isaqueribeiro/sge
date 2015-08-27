unit UGeFornecedorImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ComCtrls, frxClass, DB, IBCustomDataSet, IBQuery,
  DBClient, Provider, frxDBSet, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, dxSkinsCore, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmGeFornecedorImpressao = class(TfrmGrPadraoImpressao)
    frRelacaoFornecedor: TfrxReport;
    QryRelacaoFornecedor: TIBQuery;
    FrdsRelacaoFornecedor: TfrxDBDataset;
    DspRelacaoFornecedor: TDataSetProvider;
    CdsRelacaoFornecedor: TClientDataSet;
    lblTipoFornecedor: TLabel;
    edTipoFornecedor: TComboBox;
    lblCidade: TLabel;
    edCidade: TComboBox;
    QryCidades: TIBQuery;
    DpsCidades: TDataSetProvider;
    CdsCidades: TClientDataSet;
    frRelacaoFornecedorCidade: TfrxReport;
    frRelacaoClienteCredito: TfrxReport;
    QryRelacaoClienteCredito: TIBQuery;
    DspRelacaoClienteCredito: TDataSetProvider;
    CdsRelacaoClienteCredito: TClientDataSet;
    FrdsRelacaoClienteCredito: TfrxDBDataset;
    frFichaFornecedor: TfrxReport;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoFornecedor   ,
    FSQL_RelacaoTotalCompras : TStringList;
    ICidade : Array of Integer;
    procedure CarregarCidades;
    procedure MontarRelacaoFornecedor;
    procedure MontarRelacaoFornecedorPorCidade;
    procedure MontarRelacaoClienteCredito;
  public
    { Public declarations }
  end;

var
  frmGeFornecedorImpressao: TfrmGeFornecedorImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness;

const
  REPORT_RELACAO_FORNECEDOR         = 0;
  REPORT_RELACAO_FORNECEDOR_FICHA   = 1;
  REPORT_RELACAO_FORNECEDOR_CIDADE  = 2;
  REPORT_RELACAO_FORNECEDOR_COMPRAS = 3;

{$R *.dfm}

procedure TfrmGeFornecedorImpressao.btnVisualizarClick(Sender: TObject);
begin
  try
    Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
      Format('- Tipo Fornecedor  : %s', [edTipoFornecedor.Text]) + #13 +
      Format('- Cidade           : %s', [edCidade.Text]);

    Screen.Cursor         := crSQLWait;
    btnVisualizar.Enabled := False;

    Case edRelatorio.ItemIndex of
      REPORT_RELACAO_FORNECEDOR:
        begin
          MontarRelacaoFornecedor;
          frReport := frRelacaoFornecedor;
        end;

      REPORT_RELACAO_FORNECEDOR_FICHA:
        begin
          MontarRelacaoFornecedor;
          frReport := frFichaFornecedor;
        end;

      REPORT_RELACAO_FORNECEDOR_CIDADE:
        begin
          MontarRelacaoFornecedorPorCidade;
          frReport := frRelacaoFornecedorCidade;
        end;
      (*
      REPORT_RELACAO_CLIENTE_CREDITO: // Relação de Créditos/Custo Operacional por Fornecedor
        begin
          MontarRelacaoClienteCredito;
          frReport := frRelacaoClienteCredito;
        end; *)
      else
        Exit;
    end;

    inherited;
  finally
    Screen.Cursor         := crDefault;
    btnVisualizar.Enabled := True;
  end;
end;

procedure TfrmGeFornecedorImpressao.MontarRelacaoFornecedor;
begin
  try
    CdsRelacaoFornecedor.Close;

    with QryRelacaoFornecedor do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoFornecedor );
      SQL.Add('where 1=1');

      Case edTipoFornecedor.ItemIndex of
        1:
          SQL.Add('  and f.pessoa_fisica = 1');
        2:
          SQL.Add('  and f.pessoa_fisica = 0');
      end;

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and (f.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (f.cidade = ' + QuotedStr(edCidade.Text) + ')');

      SQL.Add('order by');
      SQL.Add('    f.pessoa_fisica');
      SQL.Add('  , f.nomeforn');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de fornecedores.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeFornecedorImpressao.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL_RelacaoFornecedor := TStringList.Create;
  FSQL_RelacaoFornecedor.AddStrings( QryRelacaoFornecedor.SQL );
  (*
  FSQL_RelacaoCredito := TStringList.Create;
  FSQL_RelacaoCredito.AddStrings( QryRelacaoClienteCredito.SQL ); *)
end;

procedure TfrmGeFornecedorImpressao.CarregarCidades;
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

procedure TfrmGeFornecedorImpressao.FormShow(Sender: TObject);
begin
  CarregarCidades;
end;

procedure TfrmGeFornecedorImpressao.MontarRelacaoFornecedorPorCidade;
begin
  try
    CdsRelacaoFornecedor.Close;

    with QryRelacaoFornecedor do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoFornecedor );
      SQL.Add('where 1=1');

      Case edTipoFornecedor.ItemIndex of
        1:
          SQL.Add('  and f.pessoa_fisica = 1');
        2:
          SQL.Add('  and f.pessoa_fisica = 0');
      end;

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and (f.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (f.cidade = ' + QuotedStr(edCidade.Text) + ')');

      SQL.Add('order by');
      SQL.Add('    cd.cid_nome');
      SQL.Add('  , es.est_sigla');
      SQL.Add('  , f.pessoa_fisica');
      SQL.Add('  , f.nomeforn');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de fornecedores por cidades.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeFornecedorImpressao.MontarRelacaoClienteCredito;
begin (*
  try
    CdsRelacaoClienteCredito.Close;

    with QryRelacaoClienteCredito do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoCredito );
      SQL.Text := StringReplace(SQL.Text, '1=1', 'v.codemp = ' + QuotedStr(GetEmpresaIDDefault), [rfReplaceAll]); // Vendas da Empresa

      SQL.Add('where 1=1');

      Case edTipoCliente.ItemIndex of
        1:
          SQL.Add('  and c.pessoa_fisica = 1');
        2:
          SQL.Add('  and c.pessoa_fisica = 0');
      end;

      if ( edCidade.ItemIndex > 0 ) then
          SQL.Add('  and (c.cid_cod = ' + IntToStr(ICidade[edCidade.ItemIndex]) + ') or (c.cidade = ' + QuotedStr(edCidade.Text) + ')');

      SQL.Add('order by');
      SQL.Add('    cd.cid_nome');
      SQL.Add('  , es.est_sigla');
      SQL.Add('  , c.pessoa_fisica');
      SQL.Add('  , c.nome');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de clientes/créditos.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end; *)
end;

initialization
  FormFunction.RegisterForm('frmGeFornecedorImpressao', TfrmGeFornecedorImpressao);

end.
