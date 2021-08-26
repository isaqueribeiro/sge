unit SGE.Controller.Promocao;

interface

uses
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory;

type
  // Promoções de Produto/Serviço
  TControllerPromocao = class(TController, IControllerPromocao)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerPromocao;

      procedure DesativarPromocoes;
      procedure AplicarPromocao;
  end;

  // Produtos/Serviços da promoção
  TControllerPromocaoProduto = class(TController, IControllerCustom)
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
  System.Classes;

{ TControllerPromocao }

procedure TControllerPromocao.AplicarPromocao;
begin
  if (FDAO.DataSet.FieldByName('ativa').AsInteger = 1) and (
    (FDAO.DataSet.FieldByName('Data_final').IsNull) or (FDAO.DataSet.FieldByName('Data_final').AsDateTime > Date)
  ) then
  begin
    // Formar a trigger "TG_PROMOCAO_PRODUTO" ser disparada
    FDAO.DataSet.Edit;
    FDAO.DataSet.FieldByName('ativa').AsInteger := 0;
    FDAO.DataSet.Post;
    FDAO.ApplyUpdates;
    FDAO.CommitUpdates;

    FDAO.DataSet.Edit;
    FDAO.DataSet.FieldByName('ativa').AsInteger := 1;
    FDAO.DataSet.Post;
    FDAO.ApplyUpdates;
    FDAO.CommitUpdates;

  end;
end;

constructor TControllerPromocao.Create;
begin
  inherited Create(TModelDAOFactory.New.Promocao);
end;

procedure TControllerPromocao.DesativarPromocoes;
var
  aScriptSQL  : TStringList;
begin
  aScriptSQL := TStringList.Create;
  try
    aScriptSQL.BeginUpdate;
    aScriptSQL.Clear;
    aScriptSQL.Add('Update TBPROMOCAO Set');
    aScriptSQL.Add('  Ativa = 0');
    aScriptSQL.Add('where (Ativa = 1)');
    aScriptSQL.Add('  and ((Data_inicio > Current_date) or (Data_final < Current_date))');
    aScriptSQL.EndUpdate;

    FDAO.ExecuteScriptSQL(aScriptSQL.Text);
    FDAO.CommitTransaction;
  finally
    aScriptSQL.DisposeOf;
  end;
end;

destructor TControllerPromocao.Destroy;
begin
  inherited;
end;

class function TControllerPromocao.New: IControllerPromocao;
begin
  Result := Self.Create;
end;

{ TControllerPromocaoProduto }

constructor TControllerPromocaoProduto.Create;
begin
  inherited Create(TModelDAOFactory.New.PromocaoProduto);
end;

destructor TControllerPromocaoProduto.Destroy;
begin
  inherited;
end;

class function TControllerPromocaoProduto.New: IControllerCustom;
begin
  Result := Self.Create;
end;

end.
