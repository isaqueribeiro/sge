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


implementation

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

end.
