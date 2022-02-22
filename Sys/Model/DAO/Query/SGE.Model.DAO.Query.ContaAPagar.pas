unit SGE.Model.DAO.Query.ContaAPagar;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Model.Constantes,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryContaAPagar = class(TModelDAO, IModelDAOQuery)
    private
      FDataInicial,
      FDataFinal  : TDateTime;
      procedure CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQuery;

      function DataIncial(aValue : TDateTime) : IModelDAOQuery;
      function DataFinal(aValue : TDateTime) : IModelDAOQuery;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQuery;
  end;

implementation

{ TModelDAOQueryContaAPagar }

uses
  Service.Utils;

constructor TModelDAOQueryContaAPagar.Create;
begin
  inherited Create;

  FDataInicial := Date;
  FDataFinal   := Date;

  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    c.anolanc')
        .Add('  , c.numlanc')
        .Add('  , cast(c.anolanc || ''/'' || right(''0000000'' || c.numlanc, 7) as varchar(30)) as lancamento')
        .Add('  , c.empresa    ')
        .Add('  , c.parcela    ')
        .Add('  , c.tippag     ')
        .Add('  , c.dtemiss    ')
        .Add('  , c.dtvenc     ')
        .Add('  , c.dtpag      ')
        .Add('  , c.valorpag   ')
        .Add('  , c.valormulta ')
        .Add('  , c.valorpagtot')
        .Add('  , c.valorsaldo ')
        .Add('  , c.valorsaldo as valor_apagar')
        .Add('  ')
        .Add('  , cast(c.anocompra || ''/'' || right(''0000000'' || c.numcompra, 7) as varchar(30)) as entrada')
        .Add('  , c.anocompra     as entrada_ano     ')
        .Add('  , c.numcompra     as entrada_numero  ')
        .Add('  , d.tpd_descricao as entrada_doc_tipo')
        .Add('  , cast(right(''0000000'' || e.nf, 7) || coalesce(''-'' || nullif(trim(e.nfserie), ''''), '''') as varchar(30)) as entrada_doc')
        .Add('  , e.nf            as entrada_doc_numero     ')
        .Add('  , e.nfserie       as entrada_doc_serie      ')
        .Add('  , f.nomeforn      as entrada_fornecedor     ')
        .Add('  , f.cnpj          as entrada_fornecedor_cnpj')
        .Add('  ')
        .Add('  , c.situacao')
        .Add('  , c.quitado as selecionar')
        .Add('from TBCONTPAG c')
        .Add('  left join TBFORNECEDOR f on (f.codforn = c.codforn)')
        .Add('  left join TBCOMPRAS e on (e.ano = c.anocompra and c.numcompra = e.codcontrol)')
        .Add('  left join VW_TIPO_DOCUMENTO_ENTRADA d on (d.tpd_codigo = e.tipo_documento)   ')
        .Add('where (c.empresa  = :empresa) ')
        .Add('  and (c.situacao = :situacao) ')
        .Add('  and (c.quitado  = :quitado) ')
        .Add('  and (c.dtvenc between :data_inicial and :data_final) ')
        .Add('  and ((c.codforn = :codigo) or (:sem_codigo = 1)) ')
        .Add('  and ((f.cnpj    = :cnpj)   or (:sem_cnpj = 1)) ')
        .Add('  and (( (f.nomeforn like :nome) or (f.nomefant like :nome) ) or (:sem_nome = 1)) ')
      .&End
      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
      .ParamByName('situacao', 1) // 1. Ativa
      .ParamByName('quitado',  0) // 0. Pendente de pagamento
      .ParamByName('data_inicial', FDataInicial)
      .ParamByName('data_final',   FDataFinal)
      .ParamByName('codigo',   0)
      .ParamByName('cnpj',     'xxxx')
      .ParamByName('nome',     'xxxx')
      .ParamByName('sem_codigo', 0)
      .ParamByName('sem_cnpj',   0)
      .ParamByName('sem_nome',   0)
      .OrderBy('c.dtvenc')
      .OrderBy('f.nomeforn')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOQueryContaAPagar.Destroy;
begin
  inherited;
end;

function TModelDAOQueryContaAPagar.Execute(aTipo: TTipoPesquisa; aFiltro: String): IModelDAOQuery;
var
  aStr : String;
begin
  Result := Self;
  aStr := aFiltro.Trim.Replace(' ', '%', [rfReplaceAll]);

  FConn.Query.Close;
  FConn
    .Query
      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
      .ParamByName('situacao', 1) // 1. Ativa
      .ParamByName('quitado',  0) // 0. Pendente de pagamento
      .ParamByName('data_inicial', FDataInicial)
      .ParamByName('data_final',   FDataFinal)
      .ParamByName('codigo', 0)
      .ParamByName('cnpj',   EmptyStr)
      .ParamByName('nome',   EmptyStr)
      .ParamByName('sem_codigo', 0)
      .ParamByName('sem_cnpj',   0)
      .ParamByName('sem_nome',   0);

  if (StrToIntDef(aStr, 0) > 0) and (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpCodigo]) then
  begin
    FConn
      .Query
        .ParamByName('codigo', StrToIntDef(aStr, 0))
        .ParamByName('cnpj',   EmptyStr)
        .ParamByName('nome',   EmptyStr)
        .ParamByName('sem_codigo', 0)
        .ParamByName('sem_cnpj',   1)
        .ParamByName('sem_nome',   1);
  end
  else
  if (TServicesUtils.StrIsCPF(aStr) or TServicesUtils.StrIsCNPJ(aStr)) then
  begin
    FConn
      .Query
        .ParamByName('codigo', 0)
        .ParamByName('cnpj',   aStr)
        .ParamByName('nome',   EmptyStr)
        .ParamByName('sem_codigo', 1)
        .ParamByName('sem_cnpj',   0)
        .ParamByName('sem_nome',   1);
  end
  else
  if (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpDescricao]) then
  begin
    FConn
      .Query
        .ParamByName('codigo', 0)
        .ParamByName('cnpj',   EmptyStr)
        .ParamByName('nome',   aStr + '%')
        .ParamByName('sem_codigo', 1)
        .ParamByName('sem_cnpj',   1)
        .ParamByName('sem_nome',   0);
  end;

  FConn.Query.Open;
end;

class function TModelDAOQueryContaAPagar.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

procedure TModelDAOQueryContaAPagar.CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (not Sender.IsNull) then
  begin
    if TServicesUtils.StrIsCPF(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCpf(Sender.AsString)
    else
    if TServicesUtils.StrIsCNPJ(Sender.AsString) then
      Text := TServicesUtils.StrFormatarCnpj(Sender.AsString)
    else
      Text := Sender.AsString;
  end;
end;

function TModelDAOQueryContaAPagar.DataFinal(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataFinal := aValue;
end;

function TModelDAOQueryContaAPagar.DataIncial(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataInicial := aValue;
end;

procedure TModelDAOQueryContaAPagar.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('selecionar').ReadOnly      := False;
  FConn.Query.DataSet.FieldByName('selecionar').Required      := False;
  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags := [];

  FConn.Query.DataSet.FieldByName('entrada_fornecedor_cnpj').OnGetText := CpfCnpjGetText;
end;

end.
