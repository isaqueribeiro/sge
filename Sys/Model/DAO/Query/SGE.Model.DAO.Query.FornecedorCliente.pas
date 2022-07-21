unit SGE.Model.DAO.Query.FornecedorCliente;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Model.Constantes,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryFornecedorCliente = class(TModelDAO, IModelDAOQuery)
    private
      FDataInicial,
      FDataFinal  : TDateTime;
      procedure TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

{ TModelDAOQueryFornecedorCliente }

uses
  Service.Utils;

procedure TModelDAOQueryFornecedorCliente.CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

constructor TModelDAOQueryFornecedorCliente.Create;
begin
  inherited Create;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select   ')
        .Add('  x.tipo,')
        .Add('  x.id,  ')
        .Add('  x.codigo, ')
        .Add('  x.nome,   ')
        .Add('  x.cnpj,   ')
        .Add('  x.pf,     ')
        .Add('  x.ativo   ')
        .Add('from (      ')
        .Add('  Select    ')
        .Add('      1 as Tipo ') //  -- Fornecedor
        .Add('    , ''01'' || right(''0000000'' || f.codforn, 7) as ID ')
        .Add('    , f.codforn        as Codigo ')
        .Add('    , trim(f.nomeforn) as Nome   ')
        .Add('    , f.cnpj           as Cnpj   ')
        .Add('    , f.pessoa_fisica  as PF     ')
        .Add('    , f.ativo                    ')
        .Add('  from TBFORNECEDOR f            ')
        .Add('  where (f.cliente_origem_cod is null) ')
        .Add('    and ((f.codforn = :codigo) or (:sem_codigo = 1)) ')
        .Add('    and ((f.cnpj    = :cnpj) or (:sem_cnpj = 1)) ')
        .Add('    and (( (f.nomeforn like :nome) or (f.nomefant like :nome) ) or (:sem_nome = 1)) ')
        .Add('  ')
        .Add('  union ')
        .Add('  ')
        .Add('  Select ')
        .Add('      2 as Tipo ') //  -- Cliente
        .Add('    , ''02'' || right(''0000000'' || c.codigo, 7) as ID ')
        .Add('    , c.codigo        as Codigo ')
        .Add('    , trim(c.nome)    as Nome   ')
        .Add('    , c.cnpj          as Cnpj   ')
        .Add('    , c.pessoa_fisica as PF     ')
        .Add('    , c.ativo                   ')
        .Add('  from TBCLIENTE c              ')
        .Add('  where (c.codigo > 1)          ')
        .Add('    and ((c.codigo = :codigo) or (:sem_codigo = 1)) ')
        .Add('    and ((c.cnpj   = :cnpj) or (:sem_cnpj = 1)) ')
        .Add('    and (( (c.nome like :nome) or (c.nomefant like :nome) ) or (:sem_nome = 1)) ')
        .Add(') x       ')
      .&End
      .ParamByName('codigo', 0)
      .ParamByName('cnpj',   'xxxx')
      .ParamByName('nome',   'xxxx')
      .ParamByName('sem_codigo', 0)
      .ParamByName('sem_cnpj',   0)
      .ParamByName('sem_nome',   0)
      .OrderBy('x.nome')
      .OrderBy('x.cnpj')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOQueryFornecedorCliente.Destroy;
begin
  inherited;
end;

class function TModelDAOQueryFornecedorCliente.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

function TModelDAOQueryFornecedorCliente.Execute(aTipo: TTipoPesquisa; aFiltro: String): IModelDAOQuery;
var
  aStr : String;
begin
  Result := Self;
  aStr := aFiltro.Trim.Replace(' ', '%', [rfReplaceAll]);

  FConn.Query.Close;
  FConn
    .Query
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

procedure TModelDAOQueryFornecedorCliente.TipoGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  Case Sender.AsInteger of
    1 : Text := 'Fornecedor';
    2 : Text := 'Cliente';
  end;
end;

function TModelDAOQueryFornecedorCliente.DataFinal(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataFinal := aValue;
end;

function TModelDAOQueryFornecedorCliente.DataIncial(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataInicial := aValue;
end;

procedure TModelDAOQueryFornecedorCliente.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('tipo').OnGetText := TipoGetText;
  FConn.Query.DataSet.FieldByName('cnpj').OnGetText := CpfCnpjGetText;
end;

end.

