unit SGI.Controller.RequisicaoAlmoxarifado;

interface

uses
  System.SysUtils,
  System.Classes,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Requisi��es ao Almoxarifado
  TControllerRequisicaoAlmoxarifado = class(TController, IControllerRequisicaoAlmoxarifado)
    private
      FBusca    : IModelDAOCustom;
      FProdutos : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerRequisicaoAlmoxarifado;

      procedure CarregarProdutos;
      procedure AjustarQuantidadeAtendidaDeProdutos;

      function Produtos : IControllerCustom;
      function MarcarComoRecebida : IControllerRequisicaoAlmoxarifado;
      function DevolverRequisicao : IControllerRequisicaoAlmoxarifado;
      function Carregar(aAno, aControle : Integer) : IControllerRequisicaoAlmoxarifado;
  end;

  // Itens da Requisi��es ao Almoxarifado
  TControllerRequisicaoAlmoxarifadoProduto = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

  // Tipos ao Requisi��es ao Almoxarifado (View)
  TControllerTipoRequisicaoAlmoxView = class(TController, IControllerCustom)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCustom;
  end;

implementation

{ TControllerRequisicaoAlmoxarifado }

procedure TControllerRequisicaoAlmoxarifado.AjustarQuantidadeAtendidaDeProdutos;
begin
  if Assigned(FProdutos) then
  begin
    FProdutos.DAO.DataSet.First;
    while not FProdutos.DAO.DataSet.Eof do
    begin
      if (FProdutos.DAO.DataSet.FieldByName('STATUS').AsInteger in [STATUS_ITEM_REQUISICAO_ALMOX_PEN, STATUS_ITEM_REQUISICAO_ALMOX_AGU] ) then
      begin
        FProdutos.DAO.DataSet.Edit;

        if (FProdutos.DAO.DataSet.FieldByName('DISPONIVEL_TMP').AsCurrency <= 0) then
          FProdutos.DAO.DataSet.FieldByName('STATUS').AsInteger := STATUS_ITEM_REQUISICAO_ALMOX_AGU
        else
        if (FProdutos.DAO.DataSet.FieldByName('QTDE').AsCurrency > FProdutos.DAO.DataSet.FieldByName('DISPONIVEL_TMP').AsCurrency) then
          FProdutos.DAO.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency := FProdutos.DAO.DataSet.FieldByName('DISPONIVEL_TMP').AsCurrency
        else
          FProdutos.DAO.DataSet.FieldByName('QTDE_ATENDIDA').AsCurrency := FProdutos.DAO.DataSet.FieldByName('QTDE').AsCurrency;

        FProdutos.DAO.DataSet.Post;
      end;
      FProdutos.DAO.DataSet.Next;
    end;
  end;
end;

function TControllerRequisicaoAlmoxarifado.Carregar(aAno, aControle: Integer): IControllerRequisicaoAlmoxarifado;
begin
  Result := Self;

  DAO
    .Close
    .ClearWhere;

  DAO
    .SQL('where (r.ano = :ano)')
    .SQL('  and (r.controle = :controle)')
    .ParamsByName('ano', aAno)
    .ParamsByName('controle', aControle)
    .Open;
end;

procedure TControllerRequisicaoAlmoxarifado.CarregarProdutos;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerRequisicaoAlmoxarifadoProduto.New;

  FProdutos
    .DAO
    .Close
    .ParamsByName('ano',      FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('controle', FDAO.DataSet.FieldByName('CONTROLE').AsInteger)
    .ParamsByName('empresa',  FDAO.DataSet.FieldByName('EMPRESA').AsString)
    .ParamsByName('centro_custo', FDAO.DataSet.FieldByName('CCUSTO_DESTINO').AsInteger)
    .ParamsByName('requisicao_ano', FDAO.DataSet.FieldByName('ANO').AsInteger)
    .ParamsByName('requisicao_cod', FDAO.DataSet.FieldByName('CONTROLE').AsInteger)
    .Open;
end;

constructor TControllerRequisicaoAlmoxarifado.Create;
begin
  inherited Create(TModelDAOFactory.New.RequisicaoAlmoxarifado);
end;

destructor TControllerRequisicaoAlmoxarifado.Destroy;
begin
  inherited;
end;

function TControllerRequisicaoAlmoxarifado.DevolverRequisicao: IControllerRequisicaoAlmoxarifado;
var
  aSQL : TStringList;
begin
  Result := Self;
  aSQL := TStringList.Create;
  try
    if (FDAO.DataSet.FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_ABR) then
      raise Exception.Create('Requisi��o de materiais j� fora marcada como devolvida ao requisitante!');

    if (FDAO.DataSet.FieldByName('status').AsInteger <> STATUS_REQUISICAO_ALMOX_ENV) then
      raise Exception.Create('Apenas requisi��es de materiais enviadas podem ser marcadas como devolvidas.');

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Update TBREQUISICAO_ALMOX r Set');
    aSQL.Add('  r.status = ' + IntToStr(STATUS_REQUISICAO_ALMOX_ABR));
    aSQL.Add('where r.ano      = ' + FDAO.DataSet.FieldByName('ano').AsString);
    aSQL.Add('  and r.controle = ' + FDAO.DataSet.FieldByName('controle').AsString);
    aSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aSQL.Text);
  finally
    aSQL.DisposeOf;
  end;
end;

function TControllerRequisicaoAlmoxarifado.MarcarComoRecebida: IControllerRequisicaoAlmoxarifado;
var
  aSQL : TStringList;
begin
  Result := Self;
  aSQL := TStringList.Create;
  try
    if (FDAO.DataSet.FieldByName('status').AsInteger = STATUS_REQUISICAO_ALMOX_REC) then
      raise Exception.Create('Requisi��o de materiais j� marcada como recebida!');

    if (FDAO.DataSet.FieldByName('status').AsInteger <> STATUS_REQUISICAO_ALMOX_ENV) then
      raise Exception.Create('Apenas requisi��es de materiais enviadas podem ser marcadas como recebidas.');

    aSQL.BeginUpdate;
    aSQL.Clear;
    aSQL.Add('Update TBREQUISICAO_ALMOX r Set');
    aSQL.Add('  r.status = ' + IntToStr(STATUS_REQUISICAO_ALMOX_REC));
    aSQL.Add('where r.ano      = ' + FDAO.DataSet.FieldByName('ano').AsString);
    aSQL.Add('  and r.controle = ' + FDAO.DataSet.FieldByName('controle').AsString);
    aSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aSQL.Text);
  finally
    aSQL.DisposeOf;
  end;
end;

class function TControllerRequisicaoAlmoxarifado.New: IControllerRequisicaoAlmoxarifado;
begin
  Result := Self.Create;
end;

function TControllerRequisicaoAlmoxarifado.Produtos: IControllerCustom;
begin
  if not Assigned(FProdutos) then
    FProdutos := TControllerRequisicaoAlmoxarifadoProduto.New;

  Result := FProdutos;
end;

{ TControllerRequisicaoAlmoxarifadoProduto }

constructor TControllerRequisicaoAlmoxarifadoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.RequisicaoAlmoxarifadoProduto);
end;

destructor TControllerRequisicaoAlmoxarifadoProduto.Destroy;
begin
  inherited;
end;

class function TControllerRequisicaoAlmoxarifadoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

{ TControllerTipoRequisicaoAlmoxView }

constructor TControllerTipoRequisicaoAlmoxView.Create;
begin
  inherited Create(TModelDAOFactory.New.TipoRequisicaoAlmoxView);
end;

destructor TControllerTipoRequisicaoAlmoxView.Destroy;
begin
  inherited;
end;

class function TControllerTipoRequisicaoAlmoxView.New: IControllerCustom;
begin
  Result := Self.Create
end;

end.
