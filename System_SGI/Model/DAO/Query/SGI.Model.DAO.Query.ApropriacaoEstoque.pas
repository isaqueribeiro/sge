unit SGI.Model.DAO.Query.ApropriacaoEstoque;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Model.Constantes,
  SGE.Model.DAO,
  SGE.Model.DAO.Interfaces;

type
  TModelDAOQueryApropriacaoEstoque = class(TModelDAO, IModelDAOQuery)
    private
      FCentroCusto,
      FGrupo      ,
      FFabricante : Integer;
      FApenasComEstoque : Boolean;
      FSelecionar : Boolean;
      procedure Percentuais(const aValorReferencia : Currency);
      procedure SetProviderFlags;
    protected
      constructor Create;
    public
      property CentroCusto : Integer read FCentroCusto write FCentroCusto;
      property CodigoGrupo : Integer read FGrupo write FGrupo;
      property CodigoFabricante : Integer read FFabricante write FFabricante;
      property ApenasComEstoque : Boolean read FApenasComEstoque write FApenasComEstoque;
      property Selecionar : Boolean read FSelecionar write FSelecionar;

      destructor Destroy; override;
      class function New : IModelDAOQuery;

      function DataIncial(aValue : TDateTime) : IModelDAOQuery; virtual; abstract;
      function DataFinal(aValue : TDateTime) : IModelDAOQuery; virtual; abstract;
      function Execute(aTipo : TTipoPesquisa; aFiltro : String) : IModelDAOQuery;
  end;

  TModelDAOQueryApropriacaoEstoqueTotal = class(TModelDAOQueryApropriacaoEstoque, IModelDAOQueryApropriacaoEstoque)
    private
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQueryApropriacaoEstoque;

      procedure CalcularPercentuais(const aValorReferencia : Currency); virtual; abstract;

      function ApenasProdutoComEstoque(Value : Boolean) : IModelDAOQueryApropriacaoEstoque; virtual; abstract;
      function Grupo(Value : Integer) : IModelDAOQueryApropriacaoEstoque; virtual; abstract;
      function Fabricante(Value : Integer) : IModelDAOQueryApropriacaoEstoque; virtual; abstract;
      function SelecionarRegistro(Value : Boolean) : IModelDAOQueryApropriacaoEstoque; virtual; abstract;
      function ExecuteCustom(aTipo : TTipoPesquisa; aCentroCusto : Integer; aFiltro : String) : IModelDAOQueryApropriacaoEstoque;
  end;

  TModelDAOQueryApropriacaoEstoqueGrupo = class(TModelDAOQueryApropriacaoEstoque, IModelDAOQueryApropriacaoEstoque)
    private
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQueryApropriacaoEstoque;

      procedure CalcularPercentuais(const aValorReferencia : Currency);

      function ApenasProdutoComEstoque(Value : Boolean) : IModelDAOQueryApropriacaoEstoque;
      function Grupo(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
      function Fabricante(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
      function SelecionarRegistro(Value : Boolean) : IModelDAOQueryApropriacaoEstoque; virtual; abstract;
      function ExecuteCustom(aTipo : TTipoPesquisa; aCentroCusto : Integer; aFiltro : String) : IModelDAOQueryApropriacaoEstoque;
  end;

  TModelDAOQueryApropriacaoEstoqueFabricante = class(TModelDAOQueryApropriacaoEstoque, IModelDAOQueryApropriacaoEstoque)
    private
      procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQueryApropriacaoEstoque;

      procedure CalcularPercentuais(const aValorReferencia : Currency);

      function ApenasProdutoComEstoque(Value : Boolean) : IModelDAOQueryApropriacaoEstoque;
      function Grupo(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
      function Fabricante(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
      function SelecionarRegistro(Value : Boolean) : IModelDAOQueryApropriacaoEstoque; virtual; abstract;
      function ExecuteCustom(aTipo : TTipoPesquisa; aCentroCusto : Integer; aFiltro : String) : IModelDAOQueryApropriacaoEstoque;
  end;

  TModelDAOQueryApropriacaoEstoqueProduto = class(TModelDAOQueryApropriacaoEstoque, IModelDAOQueryApropriacaoEstoque)
    private
      FScriptSQL : TStringList;

      const
        PRODUTO_SELECAO_FIELD = '''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'' as lote_id--';
        PRODUTO_SELECAO_GROUP = '''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx''--';
     procedure DataSetAfterOpen(DataSet: TDataSet);
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IModelDAOQueryApropriacaoEstoque;

      procedure CalcularPercentuais(const aValorReferencia : Currency);

      function ApenasProdutoComEstoque(Value : Boolean) : IModelDAOQueryApropriacaoEstoque;
      function Grupo(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
      function Fabricante(Value : Integer) : IModelDAOQueryApropriacaoEstoque;
      function SelecionarRegistro(Value : Boolean) : IModelDAOQueryApropriacaoEstoque;
      function ExecuteCustom(aTipo : TTipoPesquisa; aCentroCusto : Integer; aFiltro : String) : IModelDAOQueryApropriacaoEstoque;
  end;

implementation

uses
  System.Math,
  Service.Utils;

{ TModelDAOQueryApropriacaoEstoque }

constructor TModelDAOQueryApropriacaoEstoque.Create;
begin
  inherited Create;
  FCentroCusto      := 999;
  FGrupo      := -1;
  FFabricante := -1;
  FApenasComEstoque := True;
  FSelecionar := False;
end;

destructor TModelDAOQueryApropriacaoEstoque.Destroy;
begin
  inherited;
end;

function TModelDAOQueryApropriacaoEstoque.Execute(aTipo: TTipoPesquisa; aFiltro: String): IModelDAOQuery;
var
  aStr : String;
begin
  Result := Self;
  aStr   := aFiltro.Trim.Replace(' ', '%', [rfReplaceAll]);

  FConn.Query.Close;
  FConn
    .Query
      .ParamByName('empresa', Usuario.Empresa.CNPJ)
      .ParamByName('centro_custo', CentroCusto)
      .ParamByName('desliga_estoque', IfThen(ApenasComEstoque, 0, 1))
      .ParamByName('codigo', 0)
      .ParamByName('descricao', EmptyStr)
      .ParamByName('sem_codigo', 1)
      .ParamByName('sem_descricao', 1);

  if (StrToIntDef(aStr, 0) > 0) and (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpCodigo]) then
  begin
    FConn
      .Query
        .ParamByName('codigo', aStr.ToInteger)
        .ParamByName('descricao', EmptyStr)
        .ParamByName('sem_codigo', 0)
        .ParamByName('sem_descricao', 1);
  end
  else
  if (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpDescricao]) then
  begin
    FConn
      .Query
        .ParamByName('codigo', 0)
        .ParamByName('descricao', '%' + aStr + '%')
        .ParamByName('sem_codigo', 1)
        .ParamByName('sem_descricao', 0);
  end;

  FConn.Query.Open;
end;

class function TModelDAOQueryApropriacaoEstoque.New: IModelDAOQuery;
begin
  Result := Self.Create;
end;

procedure TModelDAOQueryApropriacaoEstoque.Percentuais(const aValorReferencia: Currency);
begin
  with FConn.Query.DataSet do
  begin
    DisableControls;
    try
      First;

      while not Eof do
      begin
        Edit;
        FieldByName('PERCENTUAL').AsCurrency := IfThen(aValorReferencia = 0, 0, (FieldByName('CUSTO_DISPONIVEL').AsCurrency / aValorReferencia) * 100);
        Post;
        Next;
      end;
    finally
      FConn.Query.DataSet.First;
      FConn.Query.DataSet.EnableControls;
    end;
  end;
end;

procedure TModelDAOQueryApropriacaoEstoque.SetProviderFlags;
var
  I : Integer;
begin
  // Ignorar campos no Insert e Update
  for I := 0 to Pred(FConn.Query.DataSet.FieldCount) do
  begin
    FConn.Query.DataSet.Fields[I].ProviderFlags := [];
    FConn.Query.DataSet.Fields[I].ReadOnly := False;
  end;
end;

{ TModelDAOQueryApropriacaoEstoqueTotal }

constructor TModelDAOQueryApropriacaoEstoqueTotal.Create;
begin
  inherited Create;
  FCentroCusto := 999;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    count(e.lote_id)   as lotes  ')
        .Add('  , sum(e.estoque)     as estoque')
        .Add('  , sum(e.reserva)     as reserva')
        .Add('  , sum(e.disponivel)  as disponivel ')
        .Add('  , sum(e.custo_total) as custo_total')
        .Add('  , sum(e.custo_reserva) as custo_reserva')
        .Add('  , sum(e.custo_disponivel) as custo_disponivel')
        .Add('from GET_ESTOQUE_ALMOX_DISPONIVEL(:empresa, :centro_custo, null, null, null, null, null) e')
      .&End
      .ParamByName('empresa', '111')
      .ParamByName('centro_custo', FCentroCusto)
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

procedure TModelDAOQueryApropriacaoEstoqueTotal.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

destructor TModelDAOQueryApropriacaoEstoqueTotal.Destroy;
begin
  inherited;
end;

function TModelDAOQueryApropriacaoEstoqueTotal.ExecuteCustom(aTipo: TTipoPesquisa; aCentroCusto: Integer;
  aFiltro: String): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FCentroCusto := aCentroCusto;

  FConn
    .Query
    .Close;

  FConn
    .Query
      .ParamByName('empresa', Usuario.Empresa.CNPJ)
      .ParamByName('centro_custo', CentroCusto)
      .Open;
end;

class function TModelDAOQueryApropriacaoEstoqueTotal.New: IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self.Create;
end;

{ TModelDAOQueryApropriacaoEstoqueGrupo }

function TModelDAOQueryApropriacaoEstoqueGrupo.ApenasProdutoComEstoque(
  Value: Boolean): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  ApenasComEstoque := Value;
end;

procedure TModelDAOQueryApropriacaoEstoqueGrupo.CalcularPercentuais(const aValorReferencia : Currency);
begin
  Self.Percentuais(aValorReferencia);
end;

constructor TModelDAOQueryApropriacaoEstoqueGrupo.Create;
begin
  inherited Create;
  FCentroCusto := 999;
  FApenasComEstoque := False;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    p.codgrupo as grupo_cod')
        .Add('  , coalesce(g.descri, ''* A Definir'') as grupo_des')
        .Add('  ')
        .Add('  , count(e.lote_id) as itens')
        .Add('  , sum(r.compra_qtde_01)  as compra_qtde_01 ')
        .Add('  , sum(r.compra_valor_01) as compra_valor_01')
        .Add('  , sum(r.venda_qtde_01)  as venda_qtde_01    ')
        .Add('  , sum(r.venda_valor_01) as venda_valor_01  ')
        .Add('  , max(r.data_ultima_compra) as data_ultima_compra')
        .Add('  , max(r.data_ultima_venda)  as data_ultima_venda ')
        .Add('  ')
        .Add('  , sum(e.estoque) as estoque')
        .Add('  , sum(e.reserva) as reserva')
        .Add('  , sum(e.disponivel)  as disponivel ')
        .Add('  , sum(e.custo_total) as custo_total')
        .Add('  , sum(e.custo_reserva) as custo_reserva      ')
        .Add('  , sum(e.custo_disponivel) as custo_disponivel')
        .Add('  ')
        .Add('  , cast(0.0 as numeric(18,4)) as percentual')
        .Add('  ')
        .Add('from GET_ESTOQUE_ALMOX_DISPONIVEL(:empresa, :centro_custo, null, null, null, null, null) e')
        .Add('  inner join TBPRODUTO p on (p.cod = e.produto)')
        .Add('  ')
        .Add('  left join TBGRUPOPROD g on (g.cod = p.codgrupo)')
        .Add('  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produto)')
        .Add('  ')
        .Add('where ((p.codgrupo = :codigo) or (:sem_codigo = 1))')
        .Add('  and ((upper(g.descri) like :descricao) or (g.descri is null) or (:sem_descricao = 1))')
        .Add('  and ((e.estoque > 0.0) or (:desliga_estoque = 1))')
        .Add('  ')
        .Add('group by')
        .Add('    1   ')
        .Add('  , 2   ')
      .&End
      .ParamByName('empresa', '111')
      .ParamByName('centro_custo', FCentroCusto)
      .ParamByName('codigo', 0)
      .ParamByName('descricao', 'zzzz')
      .ParamByName('desliga_estoque', 0)
      .ParamByName('sem_codigo', 0)
      .ParamByName('sem_descricao', 0)
      .OrderBy('2')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

procedure TModelDAOQueryApropriacaoEstoqueGrupo.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

destructor TModelDAOQueryApropriacaoEstoqueGrupo.Destroy;
begin
  inherited;
end;

function TModelDAOQueryApropriacaoEstoqueGrupo.ExecuteCustom(aTipo: TTipoPesquisa; aCentroCusto: Integer; aFiltro: String): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  CentroCusto := aCentroCusto;
  Self.Execute(aTipo, aFiltro);
end;

function TModelDAOQueryApropriacaoEstoqueGrupo.Fabricante(Value: Integer): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FFabricante := Value;
end;

function TModelDAOQueryApropriacaoEstoqueGrupo.Grupo(Value: Integer): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FGrupo := Value;
end;

class function TModelDAOQueryApropriacaoEstoqueGrupo.New: IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self.Create;
end;

{ TModelDAOQueryApropriacaoEstoqueFabricante }

function TModelDAOQueryApropriacaoEstoqueFabricante.ApenasProdutoComEstoque(
  Value: Boolean): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  ApenasComEstoque := Value;
end;

procedure TModelDAOQueryApropriacaoEstoqueFabricante.CalcularPercentuais(const aValorReferencia: Currency);
begin
  Self.Percentuais(aValorReferencia);
end;

constructor TModelDAOQueryApropriacaoEstoqueFabricante.Create;
begin
  inherited Create;
  FCentroCusto := 999;
  FApenasComEstoque := False;
  FConn
    .Query
      .SQL
        .Clear
        .Add('Select')
        .Add('    p.codfabricante as fabricante_cod')
        .Add('  , coalesce(f.nome, ''* A Definir'') as fabricante_nome')
        .Add('  ')
        .Add('  , count(e.lote_id) as itens')
        .Add('  , sum(r.compra_qtde_01)     as compra_qtde_01 ')
        .Add('  , sum(r.compra_valor_01)    as compra_valor_01')
        .Add('  , sum(r.venda_qtde_01)      as venda_qtde_01    ')
        .Add('  , sum(r.venda_valor_01)     as venda_valor_01  ')
        .Add('  , max(r.data_ultima_compra) as data_ultima_compra')
        .Add('  , max(r.data_ultima_venda)  as data_ultima_venda ')
        .Add('  ')
        .Add('  , sum(e.estoque) as estoque')
        .Add('  , sum(e.reserva) as reserva')
        .Add('  , sum(e.disponivel)  as disponivel ')
        .Add('  , sum(e.custo_total) as custo_total')
        .Add('  , sum(e.custo_reserva) as custo_reserva      ')
        .Add('  , sum(e.custo_disponivel) as custo_disponivel')
        .Add('  ')
        .Add('  , cast(0.0 as numeric(18,4)) as percentual')
        .Add('  ')
        .Add('from GET_ESTOQUE_ALMOX_DISPONIVEL(:empresa, :centro_custo, null, null, null, null, null) e')
        .Add('  inner join TBPRODUTO p on (p.cod = e.produto)')
        .Add('  ')
        .Add('  left join TBFABRICANTE f on (f.cod = p.codfabricante)')
        .Add('  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produto)')
        .Add('  ')
        .Add('where ((p.codfabricante = :codigo) or (:sem_codigo = 1))')
        .Add('  and ((upper(f.nome) like :descricao) or (f.nome is null) or (:sem_descricao = 1))')
        .Add('  and ((e.estoque > 0.0) or (:desliga_estoque = 1))')
        .Add('  ')
        .Add('group by')
        .Add('    1   ')
        .Add('  , 2   ')
      .&End
      .ParamByName('empresa', '111')
      .ParamByName('centro_custo', FCentroCusto)
      .ParamByName('codigo', 0)
      .ParamByName('descricao', 'zzzz')
      .ParamByName('desliga_estoque', 0)
      .ParamByName('sem_codigo', 0)
      .ParamByName('sem_descricao', 0)
      .OrderBy('2')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

procedure TModelDAOQueryApropriacaoEstoqueFabricante.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

destructor TModelDAOQueryApropriacaoEstoqueFabricante.Destroy;
begin
  inherited;
end;

function TModelDAOQueryApropriacaoEstoqueFabricante.ExecuteCustom(aTipo: TTipoPesquisa; aCentroCusto: Integer;
  aFiltro: String): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  CentroCusto := aCentroCusto;
  Self.Execute(aTipo, aFiltro);
end;

function TModelDAOQueryApropriacaoEstoqueFabricante.Fabricante(Value: Integer): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FFabricante := Value;
end;

function TModelDAOQueryApropriacaoEstoqueFabricante.Grupo(Value: Integer): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FGrupo := Value;
end;

class function TModelDAOQueryApropriacaoEstoqueFabricante.New: IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self.Create;
end;

{ TModelDAOQueryApropriacaoEstoqueProduto }

function TModelDAOQueryApropriacaoEstoqueProduto.ApenasProdutoComEstoque(
  Value: Boolean): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  ApenasComEstoque := Value;
end;

procedure TModelDAOQueryApropriacaoEstoqueProduto.CalcularPercentuais(const aValorReferencia: Currency);
begin
  Self.Percentuais(aValorReferencia);
end;

constructor TModelDAOQueryApropriacaoEstoqueProduto.Create;
begin
  inherited Create;
  FCentroCusto := 999;
  FApenasComEstoque := False;

  FScriptSQL := TStringList.Create;
  FScriptSQL.BeginUpdate;
  FScriptSQL.Clear;
  FScriptSQL.Add('Select');
  FScriptSQL.Add('    e.produto');
  FScriptSQL.Add('  , p.descri ');
  FScriptSQL.Add('  , p.apresentacao');
  FScriptSQL.Add('  , coalesce(nullif(trim(p.nome_amigo), ''''), p.descri_apresentacao) as descri_apresentacao');
  FScriptSQL.Add('  , p.nome_amigo');
  FScriptSQL.Add('  , p.codgrupo as grupo_cod');
  FScriptSQL.Add('  , g.descri   as grupo_des');
  FScriptSQL.Add('  , p.codfabricante as fabricante_cod ');
  FScriptSQL.Add('  , f.nome          as fabricante_nome');
  FScriptSQL.Add('  , coalesce(e.unidade, p.codunidade_fracionada) as und_cod');
  FScriptSQL.Add('  , u.unp_descricao as und_desc ');
  FScriptSQL.Add('  , u.unp_sigla     as und_sigla');
  FScriptSQL.Add('  , substring(coalesce(nullif(trim(u.unp_sigla), ''''), u.unp_descricao) from 1 for 3) as und');
  FScriptSQL.Add('  , e.fracionador');
  FScriptSQL.Add('  , ' + PRODUTO_SELECAO_FIELD  + 'e.lote_id');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('  , sum(r.compra_qtde_01) as compra_qtde_01  ');
  FScriptSQL.Add('  , sum(r.compra_valor_01) as compra_valor_01');
  FScriptSQL.Add('  , sum(r.venda_qtde_01) as venda_qtde_01    ');
  FScriptSQL.Add('  , sum(r.venda_valor_01) as venda_valor_01  ');
  FScriptSQL.Add('  , max(r.data_ultima_compra) as data_ultima_compra');
  FScriptSQL.Add('  , max(r.data_ultima_venda) as data_ultima_venda  ');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('  , sum(e.estoque) as estoque');
  FScriptSQL.Add('  , sum(e.reserva) as reserva');
  FScriptSQL.Add('  , sum(e.disponivel) as disponivel  ');
  FScriptSQL.Add('  , sum(e.custo_total) as custo_total');
  FScriptSQL.Add('  , sum(e.custo_reserva) as custo_reserva');
  FScriptSQL.Add('  , sum(e.custo_disponivel) as custo_disponivel');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('  , cast(0.0 as numeric(18,4)) as percentual');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('from GET_ESTOQUE_ALMOX_DISPONIVEL(:empresa, :centro_custo, null, null, null, null, null) e');
  FScriptSQL.Add('  inner join TBPRODUTO p on (p.cod = e.produto)');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('  left join TBUNIDADEPROD u on (u.unp_cod = coalesce(e.unidade, p.codunidade_fracionada))');
  FScriptSQL.Add('  left join TBGRUPOPROD g on (g.cod = p.codgrupo)      ');
  FScriptSQL.Add('  left join TBFABRICANTE f on (f.cod = p.codfabricante)');
  FScriptSQL.Add('  left join TBPRODUTO_ROTATIVIDADE r on (r.cod_produto = e.produto)');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('where ((p.cod like :codigo) or (:sem_codigo = 1))');
  FScriptSQL.Add('  and ((:grupo = -1) or (coalesce(p.codgrupo, 0) = :grupo))');
  FScriptSQL.Add('  and ((:fabricante = -1) or (coalesce(p.codfabricante, 0) = :fabricante))');
  FScriptSQL.Add('  and (');
  FScriptSQL.Add('       (upper(p.descri)     like :descricao)           ');
  FScriptSQL.Add('    or (upper(p.descri)     like :descricao_sem_acesso)');
  FScriptSQL.Add('    or (upper(p.nome_amigo) like :descricao)           ');
  FScriptSQL.Add('    or (upper(p.nome_amigo) like :descricao_sem_acesso)');
  FScriptSQL.Add('    or (upper(p.metafonema) like :metafonema)          ');
  FScriptSQL.Add('	or (:sem_descricao = 1)');
  FScriptSQL.Add('  )');
  FScriptSQL.Add('  and ((e.estoque > 0.0) or (:desliga_estoque = 1))');
  FScriptSQL.Add('  ');
  FScriptSQL.Add('group by     ');
  FScriptSQL.Add('    e.produto');
  FScriptSQL.Add('  , p.descri ');
  FScriptSQL.Add('  , p.apresentacao');
  FScriptSQL.Add('  , coalesce(nullif(trim(p.nome_amigo), ''''), p.descri_apresentacao)');
  FScriptSQL.Add('  , p.nome_amigo');
  FScriptSQL.Add('  , p.codgrupo ');
  FScriptSQL.Add('  , g.descri   ');
  FScriptSQL.Add('  , p.codfabricante');
  FScriptSQL.Add('  , f.nome         ');
  FScriptSQL.Add('  , coalesce(e.unidade, p.codunidade_fracionada)');
  FScriptSQL.Add('  , u.unp_descricao');
  FScriptSQL.Add('  , u.unp_sigla    ');
  FScriptSQL.Add('  , substring(coalesce(nullif(trim(u.unp_sigla), ''''), u.unp_descricao) from 1 for 3)');
  FScriptSQL.Add('  , e.fracionador');
  FScriptSQL.Add('  , ' + PRODUTO_SELECAO_GROUP + 'e.lote_id');
  FScriptSQL.EndUpdate;

  FConn
    .Query
      .SQL
        .Clear
        .AddStrings(FScriptSQL)
      .&End
      .ParamByName('empresa', '111')
      .ParamByName('centro_custo', FCentroCusto)
      .ParamByName('grupo', FGrupo)
      .ParamByName('fabricante', FFabricante)
      .ParamByName('codigo', '000000000')
      .ParamByName('descricao',            'ZZZZZZZ')
      .ParamByName('descricao_sem_acesso', 'ZZZZZZZ')
      .ParamByName('metafonema',           'ZZZZZZZ')
      .ParamByName('desliga_estoque', 0)
      .ParamByName('sem_codigo',      0)
      .ParamByName('sem_descricao',   0)
      .OrderBy('p.descri')
      .OrderBy('p.apresentacao')
      .OrderBy('coalesce(nullif(trim(p.nome_amigo), ''''), p.descri_apresentacao)')
    .Open;

  FConn.Query.DataSet.AfterOpen := DataSetAfterOpen;
end;

procedure TModelDAOQueryApropriacaoEstoqueProduto.DataSetAfterOpen(DataSet: TDataSet);
begin
  SetProviderFlags;
end;

destructor TModelDAOQueryApropriacaoEstoqueProduto.Destroy;
begin
  FScriptSQL.DisposeOf;
  inherited;
end;

function TModelDAOQueryApropriacaoEstoqueProduto.ExecuteCustom(aTipo: TTipoPesquisa; aCentroCusto: Integer;
  aFiltro: String): IModelDAOQueryApropriacaoEstoque;
var
  aStr : String;
begin
  Result := Self;
  FCentroCusto := aCentroCusto;
  aStr   := aFiltro.Trim.Replace(' ', '%', [rfReplaceAll]);

  FConn.Query.Close;
  FConn.Query.SQL.Clear;

  if FSelecionar then
    FConn.Query.SQL.Add(
      FScriptSQL.Text
        .Replace(PRODUTO_SELECAO_FIELD, '', [rfReplaceAll])
        .Replace(PRODUTO_SELECAO_GROUP, '', [rfReplaceAll])
    )
  else
    FConn.Query.SQL.Add(FScriptSQL.Text);

  FConn
    .Query
      .ParamByName('empresa', Usuario.Empresa.CNPJ)
      .ParamByName('centro_custo', CentroCusto)
      .ParamByName('grupo', CodigoGrupo)
      .ParamByName('fabricante', CodigoFabricante)
      .ParamByName('desliga_estoque', IfThen(ApenasComEstoque, 0, 1))
      .ParamByName('codigo', 0)
      .ParamByName('descricao', EmptyStr)
      .ParamByName('descricao_sem_acesso', EmptyStr)
      .ParamByName('metafonema', EmptyStr)
      .ParamByName('sem_codigo', 1)
      .ParamByName('sem_descricao', 1);

  if (StrToIntDef(aStr, 0) > 0) and (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpCodigo]) then
  begin
    FConn
      .Query
        .ParamByName('codigo', '%' + aStr + '%')
        .ParamByName('descricao', EmptyStr)
        .ParamByName('sem_codigo', 0)
        .ParamByName('sem_descricao', 1);
  end
  else
  if (atipo in [TTipoPesquisa.tpAutomatico, TTipoPesquisa.tpDescricao]) then
  begin
    FConn
      .Query
        .ParamByName('codigo', 0)
        .ParamByName('descricao', '%' + aStr + '%')
        .ParamByName('descricao_sem_acesso', '%' + TServicesUtils.StrRemoveAccents(aStr) + '%')
        .ParamByName('metafonema', '%' + TServicesUtils.StrMetafonema(aStr) + '%')
        .ParamByName('sem_codigo', 1)
        .ParamByName('sem_descricao', 0);
  end;

  FConn.Query.Open;
end;

function TModelDAOQueryApropriacaoEstoqueProduto.Fabricante(Value: Integer): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FFabricante := Value;
end;

function TModelDAOQueryApropriacaoEstoqueProduto.Grupo(Value: Integer): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FGrupo := Value;
end;

class function TModelDAOQueryApropriacaoEstoqueProduto.New: IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self.Create;
end;

function TModelDAOQueryApropriacaoEstoqueProduto.SelecionarRegistro(Value: Boolean): IModelDAOQueryApropriacaoEstoque;
begin
  Result := Self;
  FSelecionar := Value;
end;

end.

