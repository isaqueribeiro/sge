unit UGeProdutoKardex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadraoPesquisa, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TfrmGeProdutoKardex = class(TfrmGrPadraoPesquisa)
    lblData: TLabel;
    e1Data: TDateEdit;
    e2Data: TDateEdit;
    lblProduto: TLabel;
    edProduto: TComboEdit;
    QryPesquisaCODEMPRESA: TIBStringField;
    QryPesquisaCODPROD: TIBStringField;
    QryPesquisaDOC: TIBStringField;
    QryPesquisaHISTORICO: TIBStringField;
    QryPesquisaDTHIST: TDateTimeField;
    QryPesquisaQTDEATUAL: TIBBCDField;
    QryPesquisaQTDENOVA: TIBBCDField;
    QryPesquisaQTDEFINAL: TIBBCDField;
    QryPesquisaUNIDADE: TIBStringField;
    QryPesquisaRESP: TIBStringField;
    QryPesquisaMOTIVO: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure edProdutoButtonClick(Sender: TObject);
    procedure edProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecutarPesquisa : Boolean; override;
  end;

var
  frmGeProdutoKardex: TfrmGeProdutoKardex;

implementation

uses
  UDMBusiness, UConstantesDGE, UGrPadrao, UGeProduto;

{$R *.dfm}

{ TfrmGrPadraoPesquisa1 }

function TfrmGeProdutoKardex.ExecutarPesquisa: Boolean;
var
  sDataInicial,
  sDataFinal  : String;
begin
  if (edProduto.Tag = 0) then
  begin
    ShowWarning('Pesquisa', 'Favor selecionar o produto/serviço para pesquisa de histórico no período informado.');
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  try
    sDataInicial     := FormatDateTime('yyyy-mm-dd', StrToDateDef(e1Data.Text, Date)) + ' 00:00:00';
    sDataFinal       := FormatDateTime('yyyy-mm-dd', StrToDateDef(e2Data.Text, Date)) + ' 23:59:59';
    edPesquisar.Text := Trim(edPesquisar.Text);

    QryPesquisa.Close;

    with QryPesquisa do
    begin
      SQL.Clear;
      SQL.AddStrings( SQLSelect );
      SQL.Add('where ph.codprod = ' + QuotedStr(Trim(Copy(edProduto.Text, 1, Pos('-', edProduto.Text) - 1))));
      SQL.Add('  and ph.codempresa = ' + QuotedStr(GetEmpresaIDDefault));
      SQL.Add('  and ph.dthist between ' + QuotedStr(sDataInicial) + ' and ' + QuotedStr(sDataFinal));
      SQL.Add('  and ph.historico like ' + QuotedStr(Trim(edPesquisar.Text) + '%'));
      SQL.Add('order by ph.dthist');
    end;

    QryPesquisa.Open;

    Result := not QryPesquisa.IsEmpty;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeProdutoKardex.FormCreate(Sender: TObject);
begin
  inherited;
  e1Data.Date := Date - 30;
  e2Data.Date := Date;
end;

procedure TfrmGeProdutoKardex.edProdutoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigo ,
  sNome   : String;
begin
  if SelecionarProduto(Self, iCodigo, sCodigo, sNome) then
  begin
    edProduto.Tag  := iCodigo;
    edProduto.Text := sCodigo + ' - ' + sNome;
  end;
end;

procedure TfrmGeProdutoKardex.edProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfrmGeProdutoKardex.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) or ((Shift = [ssCtrl]) and (Key = SYS_KEY_L)) Then
  begin
    if ( edProduto.Focused ) then
    begin
      edProduto.Tag  := 0;
      edProduto.Text := EmptyStr;
    end;
  end;

  inherited;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoKardex', TfrmGeProdutoKardex);

end.
 