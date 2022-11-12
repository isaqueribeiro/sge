unit SGE.Model.DAO.Query.ContaAReceber;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Model.Constantes,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryContaAReceber = class(TModelDAO, IModelDAOQuery)
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

{ TModelDAOQueryContaAReceber }

uses
  Service.Utils;

constructor TModelDAOQueryContaAReceber.Create;
begin
  inherited Create;

  FDataInicial := Date;
  FDataFinal   := Date;

  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    r.anolanc')
        .Add('  , r.numlanc')
        .Add('  , cast(r.anolanc || ''/'' || right(''0000000'' || r.numlanc, 7) as varchar(30)) as lancamento')
        .Add('  , r.empresa')
        .Add('  , r.parcela')
        .Add('  , r.tippag ')
        .Add('  , r.dtemiss')
        .Add('  , r.dtvenc ')
        .Add('  , r.dtrec  ')
        .Add('  , r.valorrec   ')
        .Add('  , r.valormulta ')
        .Add('  , r.valorrectot')
        .Add('  , r.valorsaldo ')
        .Add('  , r.valorsaldo as valor_areceber')
        .Add('  ')
        .Add('  , cast(coalesce(r.anovenda, r.anoos) || ''/'' || right(''0000000'' || coalesce(r.numvenda, r.numos), 7) as varchar(30)) as saida')
        .Add('  , coalesce(r.anovenda, r.anoos) as saida_ano')
        .Add('  , coalesce(r.numvenda, r.numos) as saida_numero')
        .Add('  , Case when coalesce(e.nfe, o.nfs_numero) is null')
        .Add('      then ''Saida sem Nota Fiscal'' ')
        .Add('      else ''Notal Fiscal'' ')
        .Add('    end as saida_doc_tipo ')
        .Add('  , cast(right(''0000000'' || coalesce(e.nfe, o.nfs_numero), 7) || coalesce(''-'' || coalesce(nullif(trim(e.serie), ''''), nullif(trim(o.nfs_serie), '''')), '''') as varchar(30)) as saida_doc')
        .Add('  , e.nfe   as saida_doc_numero  ')
        .Add('  , e.serie as saida_doc_serie   ')
        .Add('  , f.nome  as saida_cliente     ')
        .Add('  , f.cnpj  as saida_cliente_cnpj')
        .Add('  ')
        .Add('  , r.baixado as selecionar')
        .Add('from TBCONTREC r')
        .Add('  left join TBCLIENTE f on (f.codigo = r.cliente)')
        .Add('  left join TBVENDAS e on (e.ano = r.anovenda and e.codcontrol = r.numvenda)')
        .Add('  left join TBOS o on (o.ano = r.anoos and o.controle = r.numos)')
        .Add('where (r.empresa  = :empresa) ')
        .Add('  and (r.situacao = :situacao) ')
        .Add('  and (r.baixado  = :baixado) ')
        .Add('  and (r.dtvenc between :data_inicial and :data_final) ')
        .Add('  and ((r.cliente = :codigo) or (:sem_codigo = 1)) ')
        .Add('  and ((f.cnpj    = :cnpj)   or (:sem_cnpj = 1)) ')
        .Add('  and (( (f.nome like :nome) or (f.nomefant like :nome) ) or (:sem_nome = 1)) ')
      .&End
      .ParamByName('empresa',  Usuario.Empresa.CNPJ)
      .ParamByName('situacao', 1) // 1. Ativa
      .ParamByName('baixado',  0) // 0. Pendente de recebimento
      .ParamByName('data_inicial', FDataInicial)
      .ParamByName('data_final',   FDataFinal)
      .ParamByName('codigo',   0)
      .ParamByName('cnpj',     'xxxx')
      .ParamByName('nome',     'xxxx')
      .ParamByName('sem_codigo', 0)
      .ParamByName('sem_cnpj',   0)
      .ParamByName('sem_nome',   0)
      .OrderBy('r.dtvenc')
      .OrderBy('f.nome')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

destructor TModelDAOQueryContaAReceber.Destroy;
begin
  inherited;
end;

function TModelDAOQueryContaAReceber.Execute(aTipo: TTipoPesquisa; aFiltro: String): IModelDAOQuery;
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
      .ParamByName('baixado',  0) // 0. Pendente de recebimento
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

class function TModelDAOQueryContaAReceber.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

procedure TModelDAOQueryContaAReceber.CpfCnpjGetText(Sender: TField; var Text: string; DisplayText: Boolean);
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

function TModelDAOQueryContaAReceber.DataFinal(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataFinal := aValue;
end;

function TModelDAOQueryContaAReceber.DataIncial(aValue: TDateTime): IModelDAOQuery;
begin
  Result := Self;
  FDataInicial := aValue;
end;

procedure TModelDAOQueryContaAReceber.DataSetAfterOpen(DataSet: TDataSet);
begin
  FConn.Query.DataSet.FieldByName('selecionar').ReadOnly      := False;
  FConn.Query.DataSet.FieldByName('selecionar').Required      := False;
  FConn.Query.DataSet.FieldByName('selecionar').ProviderFlags := [];

  FConn.Query.DataSet.FieldByName('saida_cliente_cnpj').OnGetText := CpfCnpjGetText;
end;

end.
