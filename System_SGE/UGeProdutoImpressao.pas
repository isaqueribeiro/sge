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
    lblTipoRegistro: TLabel;
    edTipoRegistro: TComboBox;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    QryGrupo: TIBQuery;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    QryFabricante: TIBQuery;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    frDemandaProduto: TfrxReport;
    QryDemandaProduto: TIBQuery;
    DspDemandaProduto: TDataSetProvider;
    CdsDemandaProduto: TClientDataSet;
    FrdsDemandaProduto: TfrxDBDataset;
    QryAno: TIBQuery;
    DspAno: TDataSetProvider;
    CdsAno: TClientDataSet;
    lblAno: TLabel;
    edAno: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoProduto ,
    FSQL_DemandaProduto : TStringList;
    IGrupo ,
    IFabricante : Array of Integer;
    procedure CarregarGrupo;
    procedure CarregarFabricante;
    procedure CarregarAno;
    procedure MontarRelacaoProduto;
    procedure MontarDemandaProduto;
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
  REPORT_DEMANDA_PRODUTO = 1;

{$R *.dfm}

procedure TfrmGeProdutoImpressao.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to edRelatorio.Items.Count - 1 do
    edRelatorio.Items.Strings[I] := Format(edRelatorio.Items.Strings[I], [StrDescricaoProduto]);

  inherited;

  Self.Caption := 'Relatório de ' + StrDescricaoProduto;

  FSQL_RelacaoProduto := TStringList.Create;
  FSQL_RelacaoProduto.AddStrings( QryRelacaoProduto.SQL );

  FSQL_DemandaProduto := TStringList.Create;
  FSQL_DemandaProduto.AddStrings( QryDemandaProduto.SQL );
end;

procedure TfrmGeProdutoImpressao.MontarRelacaoProduto;
begin
  try
    CdsRelacaoProduto.Close;

    with QryRelacaoProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoProduto );
      SQL.Add('where 1=1');

      Case edTipoRegistro.ItemIndex of
        1:
          SQL.Add('  and p.aliquota_tipo = 0');
        2:
          SQL.Add('  and p.aliquota_tipo = 1');
      end;

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , p.aliquota_tipo');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a relação de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELATÓRIO: '  + #13 +
    Format('- Tipo Registro : %s', [edTipoRegistro.Text]) + #13 +
    Format('- Grupo         : %s', [edGrupo.Text])        + #13 +
    Format('- Fabricante    : %s', [edFabricante.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  Case edRelatorio.ItemIndex of
    REPORT_RELACAO_PRODUTO:
      begin
        SubTituloRelario := EmptyStr;
        MontarRelacaoProduto;
        frReport := frRelacaoProduto;
      end;

    REPORT_DEMANDA_PRODUTO:
      begin
        SubTituloRelario := '- ANO ' + edAno.Text;
        MontarDemandaProduto;
        frReport := frDemandaProduto;
      end;
  end;

  inherited;

  Screen.Cursor         := crDefault;
  btnVisualizar.Enabled := True;
end;

procedure TfrmGeProdutoImpressao.CarregarGrupo;
var
  I : Integer;
begin
  with CdsGrupo do
  begin
    Open;

    edGrupo.Clear;
    SetLength(IGrupo, RecordCount + 1);

    edGrupo.Items.Add('(Todos)');
    IGrupo[0] := 0;

    I := 1;

    while not Eof do
    begin
      edGrupo.Items.Add( FieldByName('descri').AsString );
      IGrupo[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edGrupo.ItemIndex := 0;
end;

procedure TfrmGeProdutoImpressao.FormShow(Sender: TObject);
begin
  inherited;
  CarregarGrupo;
  CarregarFabricante;
  CarregarAno;
end;

procedure TfrmGeProdutoImpressao.CarregarFabricante;
var
  I : Integer;
begin
  with CdsFabricante do
  begin
    Open;

    edFabricante.Clear;
    SetLength(IFabricante, RecordCount + 1);

    edFabricante.Items.Add('(Todos)');
    IFabricante[0] := 0;

    I := 1;

    while not Eof do
    begin
      edFabricante.Items.Add( FieldByName('nome').AsString );
      IFabricante[I] := FieldByName('cod').AsInteger;

      Inc(I);
      Next;
    end;

    Close;
  end;

  edFabricante.ItemIndex := 0;
end;

procedure TfrmGeProdutoImpressao.MontarDemandaProduto;
begin
  try
    CdsDemandaProduto.Close;

    with QryDemandaProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_DemandaProduto );
      SQL.Text := StringReplace(SQL.Text, '9999', edAno.Text, [rfReplaceAll]);
      SQL.Add('where 1=1');

      Case edTipoRegistro.ItemIndex of
        1:
          SQL.Add('  and p.aliquota_tipo = 0');
        2:
          SQL.Add('  and p.aliquota_tipo = 1');
      end;

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , p.aliquota_tipo');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , coalesce(f.nome, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a demanda de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoImpressao.CarregarAno;
begin
  with CdsAno do
  begin
    Open;

    edAno.Clear;

    while not Eof do
    begin
      if (FieldByName('ano').AsInteger > 0) then
        edAno.Items.Add( FieldByName('ano').AsString );
      Next;
    end;

    Close;
  end;

  if (edGrupo.Items.Count = 0) then
    edAno.Items.Add( FormatDateTime('yyyy', GetDateDB) );

  edAno.ItemIndex := 0;
end;

procedure TfrmGeProdutoImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  lblAno.Enabled := (edRelatorio.ItemIndex = REPORT_DEMANDA_PRODUTO);
  edAno.Enabled  := (edRelatorio.ItemIndex = REPORT_DEMANDA_PRODUTO);
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoImpressao', TfrmGeProdutoImpressao);

end.
