unit SGE.Controller.Produto;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Table
  TControllerProduto = class(TController, IControllerProduto)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerProduto;

      procedure AtualizarMetafonema(aDescricao, aApresentacao, aCodigo : String);
      procedure AtualizarNomeAmigo(aDescricao, aApresentacao, aCodigo : String);
      procedure AtualizarTabelaIBPT(aCodigoNCM, aIdNCM, aCodigoProduto : String);

      function Get(aCodigo : Integer) : IModelDAOCustom;
  end;

  // Table
  TControllerGrupoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerSecaoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerFabricanteProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Table
  TControllerUnidadeProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Origem do Produto (View)
  TControllerOrigemProdutoView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo do Produto
  TControllerTipoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Veículo
  TControllerTipoVeiculo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Cor de Veículo
  TControllerCorVeiculo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipo de Combustível do Veículo
  TControllerCombustivelVeiculo = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Lotes do Produto
  TControllerLoteProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  Controller.Factory,
  UFuncoes,
  UConstantesDGE;

{ TControllerProduto }

procedure TControllerProduto.AtualizarMetafonema(aDescricao, aApresentacao, aCodigo: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPRODUTO Set');
    aScriptSQL.Add('    metafonema = ' + Metafonema(Trim(aDescricao.Trim + ' ' + aApresentacao.Trim)).QuotedString);
    aScriptSQL.Add('where cod = ' + aCodigo.Trim.QuotedString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerProduto.AtualizarNomeAmigo(aDescricao, aApresentacao, aCodigo: String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPRODUTO Set');
    aScriptSQL.Add('    nome_amigo = ' + Trim(aDescricao.Trim + ' ' + aApresentacao.Trim).QuotedString);
    aScriptSQL.Add('where cod = ' + aCodigo.Trim.QuotedString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

procedure TControllerProduto.AtualizarTabelaIBPT(aCodigoNCM, aIdNCM, aCodigoProduto : String);
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPRODUTO Set');
    aScriptSQL.Add('    tabela_ibpt = ' + IfThen(aIdNCM.Trim = '0', 'null', aIdNCM.Trim));
    aScriptSQL.Add('  , ncm_sh      = ' + IfThen((aCodigoNCM.Trim = EmptyStr) or (aCodigoNCM.Trim = TRIBUTO_NCM_SH_PADRAO) or (aCodigoNCM = '10203000'), 'null', aCodigoNCM.Trim.QuotedString));
    aScriptSQL.Add('where cod = ' + aCodigoProduto.Trim.QuotedString);
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

constructor TControllerProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.Produto);
end;

destructor TControllerProduto.Destroy;
begin
  inherited;
end;

function TControllerProduto.Get(aCodigo: Integer): IModelDAOCustom;
begin
  if not Assigned(FBusca) then
    FBusca := TModelDAOFactory.New.Busca;

  FBusca
    .Clear
    .SQL('Select               ')
    .SQL('    p.Codigo         ')
    .SQL('  , p.Cod            ')
    .SQL('  , p.Descri         ')
    .SQL('  , p.Apresentacao   ')
    .SQL('  , p.Descri_apresentacao')
    .SQL('  , p.Modelo         ')
    .SQL('  , p.Preco          ')
    .SQL('  , p.Referencia     ')
    .SQL('  , p.Secao          ')
    .SQL('  , p.Qtde           ')
    .SQL('  , p.Unidade        ')
    .SQL('  , p.Estoqmin       ')
    .SQL('  , p.Codgrupo       ')
    .SQL('  , p.Customedio     ')
    .SQL('  , p.Codemp         ')
    .SQL('  , p.Codsecao       ')
    .SQL('  , p.Codorigem      ')
    .SQL('  , p.Codtributacao  ')
    .SQL('  , p.Cst            ')
    .SQL('  , p.Csosn          ')
    .SQL('  , p.Codcfop        ')
    .SQL('  , p.Codbarra_ean   ')
    .SQL('  , p.Codunidade     ')
    .SQL('  , p.Ncm_sh         ')
    .SQL('  , p.Aliquota_tipo  ')
    .SQL('  , p.Aliquota       ')
    .SQL('  , p.Aliquota_csosn ')
    .SQL('  , p.Aliquota_pis   ')
    .SQL('  , p.Aliquota_cofins')
    .SQL('  , p.Percentual_reducao_BC')
    .SQL('  , p.Valor_ipi            ')
    .SQL('  , p.Reserva              ')
    .SQL('  , case when coalesce(p.Reserva, 0) > 0               ')
    .SQL('      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)')
    .SQL('      else coalesce(p.Qtde, 0) ')
    .SQL('    end as Disponivel          ')
    .SQL('  , g.Descri as Descricao_Grupo')
    .SQL('  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao    ')
    .SQL('  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade')
    .SQL('  , u.Unp_sigla         ')
    .SQL('  , c.Cfop_descricao    ')
    .SQL('  , c.Cfop_especificacao')
    .SQL('from TBPRODUTO p        ')
    .SQL('  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)        ')
    .SQL('  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)    ')
    .SQL('  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)')
    .SQL('  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)')
    .SQL('where (p.Codigo = :codigo)')
    .ParamsByName('codigo', aCodigo)
    .Open;

  Result := FBusca;
end;

class function TControllerProduto.New: IControllerProduto;
begin
  Result := Self.Create;
end;

{ TControllerGrupoProduto }

constructor TControllerGrupoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.GrupoProduto);
end;

destructor TControllerGrupoProduto.Destroy;
begin
  inherited;
end;

class function TControllerGrupoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerSecaoProduto }

constructor TControllerSecaoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.SecaoProduto);
end;

destructor TControllerSecaoProduto.Destroy;
begin
  inherited;
end;

class function TControllerSecaoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerFabricanteProduto }

constructor TControllerFabricanteProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.FabricanteProduto);
end;

destructor TControllerFabricanteProduto.Destroy;
begin
  inherited;
end;

class function TControllerFabricanteProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerUnidadeProduto }

constructor TControllerUnidadeProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.UnidadeProduto);
end;

destructor TControllerUnidadeProduto.Destroy;
begin
  inherited;
end;

class function TControllerUnidadeProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerOrigemProdutoView }

constructor TControllerOrigemProdutoView.Create;
begin
  inherited Create(TModelDAOFactory.New.OrigemProdutoView);
end;

destructor TControllerOrigemProdutoView.Destroy;
begin
  inherited;
end;

class function TControllerOrigemProdutoView.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoProduto }

constructor TControllerTipoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoProduto);
end;

destructor TControllerTipoProduto.Destroy;
begin
  inherited;
end;

class function TControllerTipoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoVeiculo }

constructor TControllerTipoVeiculo.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoVeiculo);
end;

destructor TControllerTipoVeiculo.Destroy;
begin
  inherited;
end;

class function TControllerTipoVeiculo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCorVeiculo }

constructor TControllerCorVeiculo.Create;
begin
  inherited Create(TModelDAOFactory.New.CorVeiculo);
end;

destructor TControllerCorVeiculo.Destroy;
begin
  inherited;
end;

class function TControllerCorVeiculo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerCombustivelVeiculo }

constructor TControllerCombustivelVeiculo.Create;
begin
  inherited Create(TModelDAOFactory.New.CombustivelVeiculo);
end;

destructor TControllerCombustivelVeiculo.Destroy;
begin
  inherited;
end;

class function TControllerCombustivelVeiculo.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerLoteProduto }

constructor TControllerLoteProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.LoteProduto);
end;

destructor TControllerLoteProduto.Destroy;
begin
  inherited;
end;

class function TControllerLoteProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
