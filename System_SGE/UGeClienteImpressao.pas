unit UGeClienteImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ToolWin, ComCtrls, frxClass, DB, IBCustomDataSet, IBQuery,
  DBClient, Provider, frxDBSet;

type
  TfrmGeClienteImpressao = class(TfrmGrPadraoImpressao)
    frRelacaoCliente: TfrxReport;
    QryRelacaoCliente: TIBQuery;
    FrdsRelacaoCliente: TfrxDBDataset;
    DspRelacaoCliente: TDataSetProvider;
    CdsRelacaoCliente: TClientDataSet;
    lblTipoCliente: TLabel;
    edTipoCliente: TComboBox;
    lblCidade: TLabel;
    edCidade: TComboBox;
    QryCidades: TIBQuery;
    DpsCidades: TDataSetProvider;
    CdsCidades: TClientDataSet;
    frRelacaoClienteCidade: TfrxReport;
    frRelacaoClienteCredito: TfrxReport;
    QryRelacaoClienteCredito: TIBQuery;
    DspRelacaoClienteCredito: TDataSetProvider;
    CdsRelacaoClienteCredito: TClientDataSet;
    FrdsRelacaoClienteCredito: TfrxDBDataset;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoCliente ,
    FSQL_RelacaoCredito : TStringList;
    ICidade : Array of Integer;
    procedure CarregarCidades;
    procedure MontarRelacaoCliente;
    procedure MontarRelacaoClientePorCidade;
    procedure MontarRelacaoClienteCredito;
  public
    { Public declarations }
  end;

var
  frmGeClienteImpressao: TfrmGeClienteImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness;

const
  REPORT_RELACAO_CLIENTE         = 0;
  REPORT_RELACAO_CLIENTE_CIDADE  = 1;
  REPORT_RELACAO_CLIENTE_CREDITO = 2;

{$R *.dfm}

procedure TfrmGeClienteImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
    Format('- Tipo Cliente  : %s', [edTipoCliente.Text]) + #13 +
    Format('- Cidade        : %s', [edCidade.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_RELACAO_CLIENTE:
      begin
        MontarRelacaoCliente;
        frReport := frRelacaoCliente;
      end;

    REPORT_RELACAO_CLIENTE_CIDADE:
      begin
        MontarRelacaoClientePorCidade;
        frReport := frRelacaoClienteCidade;
      end;

    REPORT_RELACAO_CLIENTE_CREDITO:
      begin
        MontarRelacaoClienteCredito;
        frReport := frRelacaoClienteCredito;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeClienteImpressao.MontarRelacaoCliente;
begin
  try
    CdsRelacaoCliente.Close;

    with QryRelacaoCliente do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoCliente );
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
      SQL.Add('    c.pessoa_fisica');
      SQL.Add('  , c.nome');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de clientes.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeClienteImpressao.FormCreate(Sender: TObject);
begin
  inherited;
  FSQL_RelacaoCliente := TStringList.Create;
  FSQL_RelacaoCliente.AddStrings( QryRelacaoCliente.SQL );

  FSQL_RelacaoCredito := TStringList.Create;
  FSQL_RelacaoCredito.AddStrings( QryRelacaoClienteCredito.SQL );
end;

procedure TfrmGeClienteImpressao.CarregarCidades;
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

procedure TfrmGeClienteImpressao.FormShow(Sender: TObject);
begin
  CarregarCidades;
end;

procedure TfrmGeClienteImpressao.MontarRelacaoClientePorCidade;
begin
  try
    CdsRelacaoCliente.Close;

    with QryRelacaoCliente do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoCliente );
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
      ShowError('Erro ao tentar montar a relação de clientes por cidades.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeClienteImpressao.MontarRelacaoClienteCredito;
begin
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
  end;
end;

initialization
  FormFunction.RegisterForm('frmGeClienteImpressao', TfrmGeClienteImpressao);

end.
