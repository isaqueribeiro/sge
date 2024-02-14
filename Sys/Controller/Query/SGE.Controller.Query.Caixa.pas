unit SGE.Controller.Query.Caixa;

interface

uses
  System.SysUtils,
  Data.DB,
  SGE.Controller.Interfaces,
  SGE.Controller.Query,
  SGE.Model.DAO.Interfaces;

type
  TControllerQueryCaixa = class(TControllerQuery)
    private
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;
  end;

  TControllerQueryCaixaMovimento = class(TControllerQuery, IControllerQueryCaixaMovimento)
    private
      function CustomDAO : IModelDAOQueryCaixaMovimento;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New: IControllerQuery;

      procedure GravarDados;

      function MovimentoConferencia(aValue : Integer) : IControllerQueryCaixaMovimento;
      function ContaCorrente(aValue : Integer) : IControllerQueryCaixaMovimento;
      function Caixa(aValue : String) : IControllerQueryCaixaMovimento;
      function ValorTotalPesquisado : Currency;
      function ValorTotalPesquisadoCredito : Currency;
      function ValorTotalPesquisadoDebito : Currency;
  end;

implementation

{ TControllerQueryCaixa }

uses
  SGE.Model.DAO.Query.Factory;

constructor TControllerQueryCaixa.Create;
begin
  inherited Create(TModelDAOQueryFactory.Instance.Caixa);
end;

destructor TControllerQueryCaixa.Destroy;
begin
  inherited;
end;

class function TControllerQueryCaixa.New: IControllerQuery;
begin
  Result := Self.Create;
end;

{ TControllerQueryCaixaMovimento }

function TControllerQueryCaixaMovimento.Caixa(aValue: String): IControllerQueryCaixaMovimento;
var
  aAno    ,
  aNumero : String;
begin
  Result := Self;

  if (Pos('/', aValue.Trim) > 0) then
  begin
    aAno    := Copy(aValue.Trim, 1, Pos('/', aValue.Trim) - 1);
    aNumero := Copy(aValue.Trim, Pos('/', aValue.Trim) + 1, aValue.Trim.Length);
  end;

  CustomDAO
    .AnoCaixa(StrToIntDef(aAno, 0))
    .NumeroCaixa(StrToIntDef(aNumero, 0));
end;

function TControllerQueryCaixaMovimento.ContaCorrente(aValue: Integer): IControllerQueryCaixaMovimento;
begin
  Result := Self;
  CustomDAO.ContaCorrente(aValue);
end;

constructor TControllerQueryCaixaMovimento.Create;
begin
  inherited Create(TModelDAOQueryFactory.Instance.CaixaMovimento);
end;

function TControllerQueryCaixaMovimento.CustomDAO: IModelDAOQueryCaixaMovimento;
begin
  Supports(DAO, IModelDAOQueryCaixaMovimento, Result);
end;

destructor TControllerQueryCaixaMovimento.Destroy;
begin
  inherited;
end;

procedure TControllerQueryCaixaMovimento.GravarDados;
begin
  if (CustomDAO.DataSet.State in [TDataSetState.dsEdit, TDataSetState.dsInsert]) then
    CustomDAO.DataSet.Post;

  CustomDAO.ApplyUpdates;
  CustomDAO.CommitUpdates;
end;

function TControllerQueryCaixaMovimento.MovimentoConferencia(aValue: Integer): IControllerQueryCaixaMovimento;
begin
  Result := Self;
  CustomDAO.MovimentoConferencia(aValue);
end;

class function TControllerQueryCaixaMovimento.New: IControllerQuery;
begin
  Result := Self.Create;
end;

function TControllerQueryCaixaMovimento.ValorTotalPesquisado: Currency;
begin
  Result := CustomDAO.ValorTotalPesquisado;
end;

function TControllerQueryCaixaMovimento.ValorTotalPesquisadoCredito: Currency;
begin
  Result := CustomDAO.ValorTotalPesquisadoCredito;
end;

function TControllerQueryCaixaMovimento.ValorTotalPesquisadoDebito: Currency;
begin
  Result := CustomDAO.ValorTotalPesquisadoDebito;
end;

end.
