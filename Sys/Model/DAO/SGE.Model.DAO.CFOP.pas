unit SGE.Model.DAO.CFOP;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOCFOP = class(TModelDAO, IModelDAOCustom)
    private
      procedure DataSetNewRecord(DataSet: TDataSet);
      procedure DataSetBeforePost(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOCustom;

      function CreateLookupComboBoxList : IModelDAOCustom;
  end;

implementation

{ TModelDAOCFOP }

constructor TModelDAOCFOP.Create;
begin
  inherited Create;
  FConn
    .Query
      .TableName('TBCFOP')
      .KeyFields('cfop_cod')
      .AutoIncFields('cfop_cod')
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.Cfop_cod')
        .Add('  , c.Cfop_descricao')
        .Add('  , c.Cfop_resumido ')
        .Add('  , c.Cfop_especificacao   ')
        .Add('  , c.Cfop_informacao_fisco')
        .Add('  , c.Cfop_tipo            ')
        .Add('  , c.Cfop_devolucao       ')
        .Add('  , c.Cfop_remessa         ')
        .Add('  , c.Cfop_faturar_remessa ')
        .Add('  , c.Cfop_retorno_interno ')
        .Add('  , c.Cfop_retorno_externo ')
        .Add('  , c.Cfop_altera_custo_produto  ')
        .Add('  , c.Cfop_altera_estoque_produto')
        .Add('  , c.Cfop_cst_padrao_entrada    ')
        .Add('  , c.Cfop_cst_padrao_saida      ')
        .Add('  , c.Cfop_gerar_titulo          ')
        .Add('  , c.Cfop_gerar_duplicata       ')
        .Add('from TBCFOP c')
      .&End
      .OpenEmpty
      .CloseEmpty;

  FConn.Query.DataSet.OnNewRecord := DataSetNewRecord;
  FConn.Query.DataSet.BeforePost  := DataSetBeforePost;
end;

function TModelDAOCFOP.CreateLookupComboBoxList: IModelDAOCustom;
begin
  Result := Self;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.Cfop_cod')
        .Add('  , coalesce(c.cfop_resumido, c.cfop_descricao) as cfop_resumido')
        .Add('  , c.cfop_cod || '' - '' || coalesce(c.cfop_resumido, c.cfop_descricao) as cfop_codigo_resumido')
        .Add('from TBCFOP c')
        .OrderBy('c.Cfop_cod')
      .&End
      .Open;
end;

procedure TModelDAOCFOP.DataSetBeforePost(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    if (FieldByName('CFOP_COD').AsInteger = 0) then
      FieldByName('CFOP_COD').Clear;

    if FieldByName('CFOP_REMESSA').IsNull then
      FieldByName('CFOP_REMESSA').AsInteger := 0;

    if FieldByName('CFOP_FATURAR_REMESSA').IsNull then
      FieldByName('CFOP_FATURAR_REMESSA').AsInteger := 0;

    if FieldByName('CFOP_GERAR_TITULO').IsNull then
      FieldByName('CFOP_GERAR_TITULO').AsInteger := 1;

    if FieldByName('CFOP_GERAR_DUPLICATA').IsNull then
      FieldByName('CFOP_GERAR_DUPLICATA').AsInteger := 1;

    if FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').IsNull then
      FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').AsInteger := 1;

    // Regra 2 : Apenas CFOPs de Remessa terão CFOPs de Retorno
    if (FieldByName('CFOP_REMESSA').AsInteger = 0) then
    begin
      FieldByName('CFOP_RETORNO_INTERNO').Clear;
      FieldByName('CFOP_RETORNO_EXTERNO').Clear;
    end;
  end;
end;

procedure TModelDAOCFOP.DataSetNewRecord(DataSet: TDataSet);
begin
  with FConn.Query.DataSet do
  begin
    FieldByName('Cfop_cod').Clear;
    FieldByName('Cfop_descricao').Clear;
    FieldByName('Cfop_resumido').Clear;
    FieldByName('Cfop_especificacao').Clear;
    FieldByName('Cfop_informacao_fisco').Clear;

    FieldByName('CFOP_ALTERA_CUSTO_PRODUTO').AsInteger   := 1;
    FieldByName('CFOP_ALTERA_ESTOQUE_PRODUTO').AsInteger := 1;
    FieldByName('CFOP_FATURAR_REMESSA').AsInteger        := 0;
    FieldByName('CFOP_DEVOLUCAO').AsInteger              := 0;
    FieldByName('CFOP_REMESSA').AsInteger                := 0;
    FieldByName('CFOP_GERAR_TITULO').AsInteger           := 1;
    FieldByName('CFOP_GERAR_DUPLICATA').AsInteger        := 1;
    FieldByName('CFOP_TIPO').Clear;
    FieldByName('CFOP_CST_PADRAO_ENTRADA').Clear;
    FieldByName('CFOP_CST_PADRAO_SAIDA').Clear;
    FieldByName('CFOP_RETORNO_INTERNO').Clear;
    FieldByName('CFOP_RETORNO_EXTERNO').Clear;
  end;
end;

destructor TModelDAOCFOP.Destroy;
begin
  inherited;
end;

class function TModelDAOCFOP.New: IModelDAOCustom;
begin
  Result := Self.Create;
end;

end.
