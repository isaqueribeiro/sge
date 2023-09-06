unit UGeProdutoImpressao;

interface

uses
  UGrPadraoImpressao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxGDIPlusClasses, ExtCtrls, Vcl.Mask, JvExMask, JvToolEdit,
  Buttons, ComCtrls, frxClass, frxDBSet, DBClient, Provider, DB, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TfrmGeProdutoImpressao = class(TfrmGrPadraoImpressao)
    frRelacaoProduto: TfrxReport;
    DspRelacaoProduto: TDataSetProvider;
    CdsRelacaoProduto: TClientDataSet;
    FrdsRelacaoProduto: TfrxDBDataset;
    lblTipoRegistro: TLabel;
    edTipoRegistro: TComboBox;
    lblGrupo: TLabel;
    edGrupo: TComboBox;
    DspGrupo: TDataSetProvider;
    CdsGrupo: TClientDataSet;
    lblFabricante: TLabel;
    edFabricante: TComboBox;
    DspFabricante: TDataSetProvider;
    CdsFabricante: TClientDataSet;
    frDemandaProduto: TfrxReport;
    DspDemandaProduto: TDataSetProvider;
    CdsDemandaProduto: TClientDataSet;
    FrdsDemandaProduto: TfrxDBDataset;
    DspAno: TDataSetProvider;
    CdsAno: TClientDataSet;
    lblAno: TLabel;
    edAno: TComboBox;
    lblEmpresa: TLabel;
    edEmpresa: TComboBox;
    frExtratoMovimentoProduto_IND: TfrxReport;
    DspExtratoMovimentoProduto: TDataSetProvider;
    CdsExtratoMovimentoProduto: TClientDataSet;
    FrdsExtratoMovimentoProduto: TfrxDBDataset;
    lblProduto: TLabel;
    edProduto: TJvComboEdit;
    frExtratoMovimentoProduto_COM: TfrxReport;
    fdQryEmpresas: TFDQuery;
    DspEmpresas: TDataSetProvider;
    CdsEmpresas: TClientDataSet;
    fdQryAno: TFDQuery;
    fdQryFabricante: TFDQuery;
    fdQryGrupo: TFDQuery;
    QryRelacaoProduto: TFDQuery;
    QryDemandaProduto: TFDQuery;
    QryExtratoMovimentoProduto: TFDQuery;
    frRelacaoProdutoValor: TfrxReport;
    lblEstoque: TLabel;
    edEstoque: TComboBox;
    frxReport1: TfrxReport;
    FDQuery1: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    frxDBDataset1: TfrxDBDataset;
    QryRelacaoProdutoFracionado: TFDQuery;
    DspRelacaoProdutoFracionado: TDataSetProvider;
    CdsRelacaoProdutoFracionado: TClientDataSet;
    FrdsRelacaoProdutoFracionado: TfrxDBDataset;
    frrRelacaoProdutoFracionado: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edRelatorioChange(Sender: TObject);
    procedure edProdutoButtonClick(Sender: TObject);
    procedure edProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSQL_RelacaoProduto ,
    FSQL_DemandaProduto ,
    FSQL_RelacaoProdutoFracao    ,
    FSQL_ExtratoMovimentoProduto : TStringList;
    IGrupo ,
    IFabricante : Array of Integer;
    IEmpresa : Array of String;
    procedure CarregarDadosEmpresa; override;
    procedure CarregarEmpresa;
    procedure CarregarGrupo;
    procedure CarregarFabricante;
    procedure CarregarAno;

    procedure MontarRelacaoProduto;
    procedure MontarDemandaProduto;
    procedure MontarRelacaoProdutoFracionado;
    procedure MontarExtratoMovimentoProduto;
  public
    { Public declarations }
  end;

  procedure ExtratoMovimentoProduto(const AOnwer : TComponent;
    const aEmpresa, aProduto : String);

(*
  Tabelas:
  - TBPRODUTO
  - TBGRUPOPROD
  - TBSECAOPROD
  - TBUNIDADEPROD
  - TBFABRICANTE
  - TBCOMPETENCIA
  - TBEMPRESA
  - TBAJUSTESTOQ
  - TBCOMPRAS
  - TBCOMPRASITENS
  - TBINVENTARIO_ALMOX
  - TBINVENTARIO_ALMOX_ITEM
  - TBAPROPRIACAO_ALMOX
  - TBAPROPRIACAO_ALMOX_ITEM
  - TBREQUISICAO_ALMOX
  - TBREQUISICAO_ALMOX_ITEM
  - TBESTOQUE_ALMOX
  - TBCENTRO_CUSTO

  Views:
  - VW_EMPRESA
  - VW_PRODUTO_DEMANDA_ANUAL

  Procedures:

*)

implementation

uses
    System.StrUtils
  , UConstantesDGE
  , UDMBusiness
  , UDMRecursos
  , UDMNFe
  , UFuncoes
  , View.Produto;

const
  REPORT_RELACAO_PRODUTO          = 0;
  REPORT_RELACAO_CUSTO_VENDA_PROD = 1;
  REPORT_DEMANDA_PRODUTO          = 2;
  REPORT_RELACAO_PRODUTO_FRACAO   = 3;
  REPORT_EXTRATO_MOV_PRODUTO      = 4;

{$R *.dfm}

procedure ExtratoMovimentoProduto(const AOnwer : TComponent;
  const aEmpresa, aProduto : String);
var
  AForm : TfrmGeProdutoImpressao;
begin
  AForm := TfrmGeProdutoImpressao.Create(AOnwer);
  try
    AForm.CarregarEmpresa;
    AForm.CarregarGrupo;
    AForm.CarregarFabricante;
    AForm.CarregarAno;

    AForm.edRelatorio.ItemIndex := REPORT_EXTRATO_MOV_PRODUTO;
    AForm.edEmpresa.ItemIndex   := IndexOfArray(aEmpresa, AForm.IEmpresa);
    AForm.edProduto.Tag         := StrToInt(aProduto);
    AForm.edProduto.Text        := aProduto + ' - SELE��O AUTOM�TICA';
    AForm.btnVisualizarClick(AForm.btnVisualizar);
  finally
    AForm.Free;
  end;
end;

procedure TfrmGeProdutoImpressao.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  lblProduto.Top := lblEstoque.Top;
  edProduto.Top  := edEstoque.Top;

  // VW_PRODUTO_DEMANDA_ANUAL     -- Para Com�rcio
  // VW_PRODUTO_DEMANDA_ANUAL_IND -- Para Ind�stria

  Case gSistema.Codigo of
    SISTEMA_GESTAO_COM ,
    SISTEMA_GESTAO_OPME:
      QryDemandaProduto.SQL.Text := 'Select p.* from VW_PRODUTO_DEMANDA_ANUAL p';
(*
        'Select ' +
        '    p.* ' +
        '  , coalesce(ep.estoque_almox, 0) as estoque_almox ' +
        'from VW_PRODUTO_DEMANDA_ANUAL p ' +
        '  left join ( ' +
        '    Select ' +
        '        e.empresa ' +
        '      , e.produto ' +
        '      , sum( e.qtde / coalesce(nullif(e.fracionador, 0), 1) ) as estoque_almox ' +
        '    from TBESTOQUE_ALMOX e ' +
        '      inner join TBCENTRO_CUSTO c on (c.codigo = e.centro_custo and c.codcliente is null) ' +
        '    where e.qtde > 0 ' +
        '    group by ' +
        '        e.empresa ' +
        '      , e.produto ' +
        '  ) ep on (ep.empresa = p.empresa_cnpj and ep.produto = p.cod) ';
*)
    SISTEMA_GESTAO_IND:
      QryDemandaProduto.SQL.Text := 'Select p.* from VW_PRODUTO_DEMANDA_ANUAL_IND p';
(*
        'Select ' +
        '    p.* ' +
        '  , coalesce(ep.estoque_almox, 0) as estoque_almox ' +
        'from VW_PRODUTO_DEMANDA_ANUAL_IND p ' +
        '  left join ( ' +
        '    Select ' +
        '        e.empresa ' +
        '      , e.produto ' +
        '      , sum( e.qtde / coalesce(nullif(e.fracionador, 0), 1) ) as estoque_almox ' +
        '    from TBESTOQUE_ALMOX e ' +
        '      inner join TBCENTRO_CUSTO c on (c.codigo = e.centro_custo and c.codcliente is null) ' +
        '    where e.qtde > 0 ' +
        '    group by ' +
        '        e.empresa ' +
        '      , e.produto ' +
        '  ) ep on (ep.empresa = p.empresa_cnpj and ep.produto = p.cod) ';
*)
  end;

  for I := 0 to edRelatorio.Items.Count - 1 do
    edRelatorio.Items.Strings[I] := Format(edRelatorio.Items.Strings[I], [StrDescricaoProduto]);

  inherited;

  Self.Caption := 'Relat�rio de ' + StrDescricaoProduto;

  FSQL_RelacaoProduto := TStringList.Create;
  FSQL_RelacaoProduto.AddStrings( QryRelacaoProduto.SQL );

  FSQL_DemandaProduto := TStringList.Create;
  FSQL_DemandaProduto.AddStrings( QryDemandaProduto.SQL );

  FSQL_RelacaoProdutoFracao := TStringList.Create;
  FSQL_RelacaoProdutoFracao.AddStrings( QryRelacaoProdutoFracionado.SQL );

  FSQL_ExtratoMovimentoProduto := TStringList.Create;
  FSQL_ExtratoMovimentoProduto.AddStrings( QryExtratoMovimentoProduto.SQL );

  SetAtulizarCustoEstoque(GetDateDB);
end;

procedure TfrmGeProdutoImpressao.FormDestroy(Sender: TObject);
begin
  FSQL_RelacaoProduto.DisposeOf;
  FSQL_DemandaProduto.DisposeOf;
  FSQL_RelacaoProdutoFracao.DisposeOf;
  FSQL_ExtratoMovimentoProduto.DisposeOf;
  inherited;
end;

procedure TfrmGeProdutoImpressao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmGeProdutoImpressao.MontarRelacaoProduto;
begin
  try
    CdsRelacaoProduto.Close;

    with QryRelacaoProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoProduto );
      SQL.Add('where (p.arquivo_morto = 0)');

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

      if ( edEmpresa.ItemIndex > 0 ) then
      begin
        SQL.Text := StringReplace(SQL.Text, '0=0', 'ea.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]), [rfReplaceAll]);
        SQL.Add('  and p.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));
      end;

      if (edEstoque.ItemIndex = 1) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and coalesce(ep.estoque_almox, 0) <= 0')
        else
          SQL.Add('  and p.qtde <= 0');
      end
      else
      if (edEstoque.ItemIndex = 2) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and coalesce(ep.estoque_almox, 0) > 0')
        else
          SQL.Add('  and p.qtde > 0');
      end;

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , p.aliquota_tipo');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a rela��o de ' + StrDescricaoProduto + '.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoImpressao.MontarRelacaoProdutoFracionado;
begin
  try
    CdsRelacaoProdutoFracionado.Close;

    with QryRelacaoProdutoFracionado do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_RelacaoProdutoFracao );
      SQL.Add('where (p.arquivo_morto = 0)');
      SQL.Add('  and (p.fracionador != 1) ');

      Case edTipoRegistro.ItemIndex of
        1 : SQL.Add('  and (p.aliquota_tipo = 0)');
        2 : SQL.Add('  and (p.aliquota_tipo = 1)');
      end;

      if (edGrupo.ItemIndex > 0) then
        SQL.Add('  and (p.codgrupo = ' + IntToStr(IGrupo[edGrupo.ItemIndex]) + ')');

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and (p.codfabricante = ' + IntToStr(IFabricante[edFabricante.ItemIndex]) + ')');

      if ( edEmpresa.ItemIndex > 0 ) then
      begin
        SQL.Text := StringReplace(SQL.Text, '0=0', 'ea.empresa = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]), [rfReplaceAll]);
        SQL.Add('  and (p.codemp = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]) + ')');
      end;

      if (edEstoque.ItemIndex = 1) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and (coalesce(ep.estoque_almox, 0) <= 0)')
        else
          SQL.Add('  and (coalesce(p.qtde, 0) <= 0)');
      end
      else
      if (edEstoque.ItemIndex = 2) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and (coalesce(ep.estoque_almox, 0) > 0)')
        else
          SQL.Add('  and (coalesce(p.qtde, 0) > 0)');
      end;

      SQL.Add('order by');
      SQL.Add('    e.rzsoc');
      SQL.Add('  , p.aliquota_tipo');
      SQL.Add('  , coalesce(g.descri, ''* Indefinido'')');
      SQL.Add('  , p.descri_apresentacao');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar a rela��o de produtos fracionados.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoImpressao.btnVisualizarClick(Sender: TObject);
begin
  Filtros := 'FILTROS APLICADOS AO MONTAR O RELAT�RIO: '  + #13 +
    Format('- Tipo Registro : %s', [edTipoRegistro.Text]) + #13 +
    Format('- Grupo         : %s', [edGrupo.Text])        + #13 +
    Format('- Fabricante    : %s', [edFabricante.Text]);

  Screen.Cursor         := crSQLWait;
  btnVisualizar.Enabled := False;

  try

    Case edRelatorio.ItemIndex of
      REPORT_RELACAO_PRODUTO, REPORT_RELACAO_CUSTO_VENDA_PROD:
        begin
          SubTituloRelario := EmptyStr;
          MontarRelacaoProduto;
          if (edRelatorio.ItemIndex = REPORT_RELACAO_PRODUTO) then
            frReport := frRelacaoProduto
          else
            frReport := frRelacaoProdutoValor;
        end;

      REPORT_DEMANDA_PRODUTO:
        begin
          SubTituloRelario := '- ANO ' + edAno.Text;
          MontarDemandaProduto;
          frReport := frDemandaProduto;
        end;

      REPORT_RELACAO_PRODUTO_FRACAO:
        begin
          SubTituloRelario := EmptyStr;
          MontarRelacaoProdutoFracionado;
          frReport := frrRelacaoProdutoFracionado;
        end;

      REPORT_EXTRATO_MOV_PRODUTO:
        begin
          if ( edProduto.Tag = 0 ) then
          begin
            ShowWarning('Favor selecionar o produto desejado!');
            if edProduto.Visible and edProduto.Enabled then
              edProduto.SetFocus;
            Abort;
          end;

          if ( edEmpresa.ItemIndex = 0 ) then
            edEmpresa.ItemIndex := IndexOfArray(gUsuarioLogado.Empresa, IEmpresa);

          SubTituloRelario := EmptyStr;
          MontarExtratoMovimentoProduto;
          if ( gSistema.Codigo = SISTEMA_GESTAO_IND ) then
            frReport := frExtratoMovimentoProduto_IND
          else
            frReport := frExtratoMovimentoProduto_COM;
        end;
    end;

    inherited;

  finally
    Screen.Cursor         := crDefault;
    btnVisualizar.Enabled := True;
  end;
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
  CarregarEmpresa;
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
      SQL.Add('where (p.arquivo_morto = 0)');
      SQL.Add('  and (p.ano = ' + edAno.Text + ')');

      Case edTipoRegistro.ItemIndex of
        1:
          SQL.Add('  and p.tipo = ''P''');
        2:
          SQL.Add('  and p.tipo = ''S''');
      end;

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.grupo_cod = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.fabricante_cod = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      if ( edEmpresa.ItemIndex > 0 ) then
        SQL.Add('  and p.empresa_cnpj = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if (edEstoque.ItemIndex = 1) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and coalesce(ep.estoque_almox, 0) <= 0')
        else
          SQL.Add('  and p.qtde <= 0');
      end
      else
      if (edEstoque.ItemIndex = 2) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and coalesce(ep.estoque_almox, 0) > 0')
        else
          SQL.Add('  and p.qtde > 0');
      end;

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

procedure TfrmGeProdutoImpressao.MontarExtratoMovimentoProduto;
begin
  try
    CdsExtratoMovimentoProduto.Close;

    with QryExtratoMovimentoProduto do
    begin
      SQL.Clear;
      SQL.AddStrings( FSQL_ExtratoMovimentoProduto );
      SQL.Add('where (p.arquivo_morto = 0)');

      if ( edGrupo.ItemIndex > 0 ) then
        SQL.Add('  and p.grupo_cod = ' + IntToStr(IGrupo[edGrupo.ItemIndex]));

      if ( edFabricante.ItemIndex > 0 ) then
        SQL.Add('  and p.fabricante_cod = ' + IntToStr(IFabricante[edFabricante.ItemIndex]));

      if ( edEmpresa.ItemIndex > 0 ) then
        SQL.Add('  and e.cnpj = ' + QuotedStr(IEmpresa[edEmpresa.ItemIndex]));

      if ( edProduto.Tag > 0 ) then
        SQL.Add(' and ex.produto = ' + QuotedStr(Trim(Copy(edProduto.Text, 1, Pos('-', edProduto.Text) - 1))));

      if (edEstoque.ItemIndex = 1) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and coalesce(ep.estoque_almox, 0) <= 0')
        else
          SQL.Add('  and p.qtde <= 0');
      end
      else
      if (edEstoque.ItemIndex = 2) then
      begin
        if (gSistema.Codigo = SISTEMA_GESTAO_IND) then
          SQL.Add('  and coalesce(ep.estoque_almox, 0) > 0')
        else
          SQL.Add('  and p.qtde > 0');
      end;

      SQL.Add('order by');
      SQL.Add('    ex.empresa');
      SQL.Add('  , p.descri_apresentacao');
      SQL.Add('  , ex.produto');
      SQL.Add('  , ex.data');
      SQL.Add('  , ex.tipo');
    end;
  except
    On E : Exception do
    begin
      ShowError('Erro ao tentar montar o extrato de movimenta��o do produto.' + #13#13 + E.Message);

      Screen.Cursor         := crDefault;
      btnVisualizar.Enabled := True;
    end;
  end;
end;

procedure TfrmGeProdutoImpressao.CarregarAno;
var
  iAno,
  I   : Integer;
begin
  iAno := StrToInt(FormatDateTime('yyyy', Date));
  with CdsAno do
  begin
    Open;

    edAno.Clear;
    I := 0;

    while not Eof do
    begin
      if (FieldByName('ano').AsInteger > 0) then
        edAno.Items.Add( FieldByName('ano').AsString );

      if (FieldByName('ano').AsInteger = iAno) then
        I := edAno.Items.Count - 1;

      Next;
    end;

    Close;
  end;

  if (edGrupo.Items.Count = 0) then
    edAno.Items.Add( FormatDateTime('yyyy', GetDateDB) );

  edAno.ItemIndex := I;
end;

procedure TfrmGeProdutoImpressao.edProdutoButtonClick(Sender: TObject);
var
  iCodigo : Integer;
  sCodigoAlfa,
  sNome   ,
  sUnidade,
  sNCM_SH ,
  sCST    : String;
  iUnidade,
  iCFOP   : Integer;
  cAliquota   ,
  cAliquotaPIS,
  cAliquotaCOFINS ,
  cValorVenda     ,
  cValorPromocao  ,
  cValorIPI       ,
  cPercentualRedBC,
  cValorCusto     ,
  cEstoque        ,
  cReserva        : Currency;
begin
  if SelecionarProdutoParaEntrada(Self,
    iCodigo,
    sCodigoAlfa,
    sNome   ,
    sUnidade,
    sNCM_SH ,
    sCST    ,
    iUnidade,
    iCFOP   ,
    cAliquota   ,
    cAliquotaPIS,
    cAliquotaCOFINS ,
    cValorVenda     ,
    cValorPromocao  ,
    cValorIPI       ,
    cPercentualRedBC,
    cValorCusto     ,
    cEstoque        ,
    cReserva
  ) then
  begin
    edProduto.Tag  := iCodigo;
    edProduto.Text := sCodigoAlfa + ' - ' + sNome;
  end;
end;

procedure TfrmGeProdutoImpressao.edProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfrmGeProdutoImpressao.edRelatorioChange(Sender: TObject);
begin
  inherited;
  lblAno.Enabled := (edRelatorio.ItemIndex = REPORT_DEMANDA_PRODUTO);
  edAno.Enabled  := (edRelatorio.ItemIndex = REPORT_DEMANDA_PRODUTO);
  lblTipoRegistro.Enabled := (edRelatorio.ItemIndex <> REPORT_EXTRATO_MOV_PRODUTO);
  edTipoRegistro.Enabled  := (edRelatorio.ItemIndex <> REPORT_EXTRATO_MOV_PRODUTO);
  lblProduto.Visible := (edRelatorio.ItemIndex = REPORT_EXTRATO_MOV_PRODUTO);
  edProduto.Visible  := (edRelatorio.ItemIndex = REPORT_EXTRATO_MOV_PRODUTO);

  lblAno.Visible     := (edRelatorio.ItemIndex <> REPORT_EXTRATO_MOV_PRODUTO);
  edAno.Visible      := lblAno.Visible;

  lblEstoque.Visible := (edRelatorio.ItemIndex <> REPORT_EXTRATO_MOV_PRODUTO);
  edEstoque.Visible  := lblEstoque.Visible;
end;

procedure TfrmGeProdutoImpressao.CarregarDadosEmpresa;
begin
  with frReport do
    try
      DMNFe.AbrirEmitente(IfThen(edEmpresa.ItemIndex = 0, gUsuarioLogado.Empresa, IEmpresa[edEmpresa.ItemIndex]));
      DMBusiness.ConfigurarEmail(IfThen(edEmpresa.ItemIndex = 0, gUsuarioLogado.Empresa, IEmpresa[edEmpresa.ItemIndex]), EmptyStr, TituloRelario, EmptyStr);
    except
    end;
end;

procedure TfrmGeProdutoImpressao.CarregarEmpresa;
var
  I : Integer;
begin
  with CdsEmpresas do
  begin
    Open;

    edEmpresa.Clear;
    SetLength(IEmpresa, RecordCount + 1);

    edEmpresa.Items.Add('(Todas)');
    IEmpresa[0] := EmptyStr;

    I := 1;

    while not Eof do
    begin
      edEmpresa.Items.Add( FieldByName('razao').AsString );
      IEmpresa[I] := Trim(FieldByName('cnpj').AsString);

      Inc(I);
      Next;
    end;

    Close;
  end;

  edEmpresa.ItemIndex := 0;
end;

initialization
  FormFunction.RegisterForm('frmGeProdutoImpressao', TfrmGeProdutoImpressao);

end.
