unit SGE.Controller.Caixa;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  SGE.Controller,
  SGE.Controller.Interfaces,
  SGE.Model.DAO.Interfaces,
  SGE.Model.DAO.Factory,
  UConstantesDGE;

type
  // Caixa (Table)
  TControllerCaixa = class(TController, IControllerCaixa)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCaixa;

      function CaixaAberto(const aEmpresa, aUsuario : String;
        const DataReferencia : TDateTime; const FormaPagto : Smallint; var CxAno, CxNumero, CxContaCorrente : Integer) : Boolean;
  end;

  // Movimentações do Caixa (Table)
  TControllerCaixaMovimento = class(TController, IControllerCaixaMovimento)
    private
      FBusca : IModelDAOCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerCaixaMovimento;

      function Lancamentos(aData : TDateTime; aContaCorrente : Integer; const aAnoCaixa : Integer = 0; const aNumeroCaixa : Integer = 0) : IControllerCaixaMovimento;
  end;


implementation

uses
  Service.Utils;

{ TControllerCaixa }

constructor TControllerCaixa.Create;
begin
  inherited Create(TModelDAOFactory.New.Caixa);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerCaixa.Destroy;
begin
  inherited;
end;

class function TControllerCaixa.New: IControllerCaixa;
begin
  Result := Self.Create;
end;

function TControllerCaixa.CaixaAberto(const aEmpresa, aUsuario: String; const DataReferencia: TDateTime;
  const FormaPagto: Smallint; var CxAno, CxNumero, CxContaCorrente: Integer): Boolean;
var
  aRetorno : Boolean;
begin
  aRetorno := False;
  try
    FBusca
      .Close
      .Clear
      .SQL('Select')
      .SQL('    c.Ano')
      .SQL('  , c.Numero')
      .SQL('  , c.Usuario')
      .SQL('  , c.Data_abertura')
      .SQL('  , c.Conta_corrente')
      .SQL('  , c.Valor_total_credito')
      .SQL('  , c.Valor_total_debito')
      .SQL('from GET_CAIXA_ABERTO_DETALHE(:Empresa, :Usuario, :Data, :FormaPagto) c')
      .ParamsByName('Empresa',    aEmpresa.Trim)
      .ParamsByName('Usuario',    aUsuario.Trim)
      .ParamsByName('Data',       DataReferencia)
      .ParamsByName('FormaPagto', FormaPagto)
      .Open;

    aRetorno := (not FBusca.DataSet.IsEmpty);

    CxAno           := FBusca.DataSet.FieldByName('Ano').AsInteger;
    CxNumero        := FBusca.DataSet.FieldByName('Numero').AsInteger;
    CxContaCorrente := FBusca.DataSet.FieldByName('Conta_corrente').AsInteger;

    FBusca.Close;
  finally
    Result := aRetorno;
  end;
end;

{ TControllerCaixaMovimento }

constructor TControllerCaixaMovimento.Create;
begin
  inherited Create(TModelDAOFactory.New.CaixaMovimento);
  FBusca := TModelDAOFactory.New.Busca;
end;

destructor TControllerCaixaMovimento.Destroy;
begin
  inherited;
end;

function TControllerCaixaMovimento.Lancamentos(aData: TDateTime; aContaCorrente: Integer; const aAnoCaixa,
  aNumeroCaixa: Integer): IControllerCaixaMovimento;
begin
  Result := Self;
  FDAO
    .Close
    .ClearWhere;

  if TServicesUtils.DateIsEmpty(aData) then
    raise Exception.Create('Informe a Data dos Lançamentos financeiros!');

  if (aContaCorrente = 0) then
    raise Exception.Create('Selecione a Conta Conrrente!');

  FDAO
    .Where('m.conta_corrente = :conta')
    .Where('cast(m.datahora as DMN_DATE) = :data')
    .ParamsByName('conta', aContaCorrente)
    .ParamsByName('data', aData);

  if (aAnoCaixa > 0) then
  begin
    FDAO
      .Where('coalesce(m.caixa_ano, 0) = :ano_caixa')
      .ParamsByName('ano_caixa', aAnoCaixa)
  end;

  if (aNumeroCaixa > 0) then
  begin
    FDAO
      .Where('coalesce(m.caixa_num, 0) = :numero_caixa')
      .ParamsByName('numero_caixa', aNumeroCaixa)
  end;

  FDAO.Open;
end;

class function TControllerCaixaMovimento.New: IControllerCaixaMovimento;
begin
  Result := Self.Create;
end;

end.
