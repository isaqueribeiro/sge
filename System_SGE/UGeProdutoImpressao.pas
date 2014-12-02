unit UGeProdutoImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoImpressao, StdCtrls, dxGDIPlusClasses, ExtCtrls,
  Buttons, ToolWin, ComCtrls, frxClass, frxDBSet, DBClient, Provider, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmGeProdutoImpressao = class(TfrmGrPadraoImpressao)
    frRelacaoProduto: TfrxReport;
    QryRelacaoProduto: TIBQuery;
    DspRelacaoProduto: TDataSetProvider;
    CdsRelacaoProduto: TClientDataSet;
    FrdsRelacaoProduto: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoProduto : TStringList;
    procedure MontarRelacaoProduto;
  public
    { Public declarations }
  end;

var
  frmGeProdutoImpressao: TfrmGeProdutoImpressao;

implementation

uses
  UConstantesDGE, UDMBusiness;

const
  REPORT_RELACAO_PRODUTO = 0;

{$R *.dfm}

procedure TfrmGeProdutoImpressao.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := 'Relatório de ' + StrDescricaoProduto;

  FSQL_RelacaoProduto := TStringList.Create;
  FSQL_RelacaoProduto.AddStrings( QryRelacaoProduto.SQL );
end;

procedure TfrmGeProdutoImpressao.MontarRelacaoProduto;
begin

end;

procedure TfrmGeProdutoImpressao.btnVisualizarClick(Sender: TObject);
begin
//  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: ' + #13 +
//    Format('- Tipo Cliente  : %s', [edTipoCliente.Text]) + #13 +
//    Format('- Cidade        : %s', [edCidade.Text]);
//
  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_RELACAO_PRODUTO:
      begin
        MontarRelacaoProduto;
        frReport := frRelacaoProduto;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoImpressao', TfrmGeProdutoImpressao);

end.
