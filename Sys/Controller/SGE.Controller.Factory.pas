unit SGE.Controller.Factory;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.UF,
  SGE.Controller.Cidade,
  SGE.Controller.Distrito,
  SGE.Controller.Bairro,
  SGE.Controller.TipoLogradouro,
  SGE.Controller.Logradouro,
  SGE.Controller.CST,
  SGE.Controller.CFOP,
  SGE.Controller.IBPT,
  SGE.Controller.Empresa,
  SGE.Controller.ContaCorrente,
  SGE.Controller.FormaPagto,
  SGE.Controller.CondicaoPagto,
  SGE.Controller.PlanoConta,
  SGE.Controller.TipoReceita,
  SGE.Controller.TipoDespesa,
  SGE.Controller.CentroCusto,
  SGE.Controller.Tabelas;

type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    private
      FUF       ,
      FCidade   ,
      FDistrito ,
      FBairro   ,
      FTipoLogradouro,
      FLogradouro    ,
      FCST  ,
      FCFOP ,
      FIBPT ,
      FTabelaIBPT   ,
      FNivelIBPT    ,
      FEmpresa      ,
      FEmpresaView  ,
      FContaCorrente,
      FContaCorrenteView,
      FFormaPagto       ,
      FFormaPagtoContaCorrente,
      FFormaPagtoNFCEView     ,
      FCondicaoPagto     ,
      FCondicaoPagtoForma,
      FCondicaoPagtoView ,
      FPlanoConta     ,
      FPlanoContaNivel,
      FPlanoContaTipo ,
      FTipoReceita    ,
      FTipoReceitaPlanoConta,
      FClasseReceita,
      FTipoDespesa  ,
      FTipoDespesaPlanoConta,
      FClasseDespesa,
      FCentroCusto  ,
      FCentroCustoEmpresa,
      FSegmento       ,
      FTipoRegimeView : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactory;

      function UF : IControllerCustom;
      function Cidade   : IControllerCustom;
      function Distrito : IControllerCustom;
      function Bairro   : IControllerCustom;
      function TipoLogradouro : IControllerCustom;
      function Logradouro : IControllerCustom;
      function CST : IControllerCustom;
      function CFOP : IControllerCustom;
      function IBPT : IControllerCustom;
      function TabelaIBPT : IControllerCustom;
      function NivelIBPT : IControllerCustom;
      function Empresa : IControllerCustom;
      function EmpresaView : IControllerCustom;
      function ContaCorrente : IControllerCustom;
      function ContaCorrenteView : IControllerCustom;
      function FormaPagto : IControllerCustom;
      function FormaPagtoContaCorrente : IControllerCustom;
      function FormaPagtoNFCEView : IControllerCustom;
      function CondicaoPagto : IControllerCustom;
      function CondicaoPagtoForma : IControllerCustom;
      function CondicaoPagtoView : IControllerCustom;
      function PlanoConta : IControllerCustom;
      function PlanoContaNivel : IControllerCustom;
      function PlanoContaTipo : IControllerCustom;
      function TipoReceita : IControllerCustom;
      function TipoReceitaPlanoConta : IControllerCustom;
      function ClasseReceita : IControllerCustom;
      function TipoDespesa : IControllerCustom;
      function TipoDespesaPlanoConta : IControllerCustom;
      function ClasseDespesa : IControllerCustom;
      function CentroCusto : IControllerCustom;
      function CentroCustoEmpresa : IControllerCustom;
      function Segmento : IControllerCustom;
      function TipoRegimeView : IControllerCustom;
  end;

implementation

{ TControllerFactory }

constructor TControllerFactory.Create;
begin
  ;
end;

destructor TControllerFactory.Destroy;
begin
  inherited;
end;

class function TControllerFactory.New: IControllerFactory;
begin
  Result := Self.Create;
end;

function TControllerFactory.NivelIBPT: IControllerCustom;
begin
  if not Assigned(FNivelIBPT) then
    FNivelIBPT := TControllerNivelIBPT.New;

  Result := FNivelIBPT;
end;

function TControllerFactory.PlanoConta: IControllerCustom;
begin
  if not Assigned(FPlanoConta) then
    FPlanoConta := TControllerPlanoConta.New;

  Result := FPlanoConta;
end;

function TControllerFactory.PlanoContaNivel: IControllerCustom;
begin
  if not Assigned(FPlanoContaNivel) then
    FPlanoContaNivel := TControllerPlanoContaNivel.New;

  Result := FPlanoContaNivel;
end;

function TControllerFactory.PlanoContaTipo: IControllerCustom;
begin
  if not Assigned(FPlanoContaTipo) then
    FPlanoContaTipo := TControllerPlanoContaTipo.New;

  Result := FPlanoContaTipo;
end;

function TControllerFactory.Segmento: IControllerCustom;
begin
  if not Assigned(FSegmento) then
    FSegmento := TControllerSegmento.New;

  Result := FSegmento;
end;

function TControllerFactory.CST: IControllerCustom;
begin
  if not Assigned(FCST) then
    FCST := TControllerCST.New;

  Result := FCST;
end;

function TControllerFactory.Bairro: IControllerCustom;
begin
  if not Assigned(FBairro) then
    FBairro := TControllerBairro.New;

  Result := FBairro;
end;

function TControllerFactory.CentroCusto: IControllerCustom;
begin
  if not Assigned(FCentroCusto) then
    FCentroCusto := TControllerCentroCusto.New;

  Result := FCentroCusto;
end;

function TControllerFactory.CentroCustoEmpresa: IControllerCustom;
begin
  if not Assigned(FCentroCustoEmpresa) then
    FCentroCustoEmpresa := TControllerCentroCustoEmpresa.New;

  Result := FCentroCustoEmpresa;
end;

function TControllerFactory.CFOP: IControllerCustom;
begin
  if not Assigned(FCFOP) then
    FCFOP := TControllerCFOP.New;

  Result := FCFOP;
end;

function TControllerFactory.Cidade: IControllerCustom;
begin
  if not Assigned(FCidade) then
    FCidade := TControllerCidade.New;

  Result := FCidade;
end;

function TControllerFactory.ClasseDespesa: IControllerCustom;
begin
  if not Assigned(FClasseDespesa) then
    FClasseDespesa := TControllerClasseDespesa.New;

  Result := FClasseDespesa;
end;

function TControllerFactory.ClasseReceita: IControllerCustom;
begin
  if not Assigned(FClasseReceita) then
    FClasseReceita := TControllerClasseReceita.New;

  Result := FClasseReceita;
end;

function TControllerFactory.CondicaoPagto: IControllerCustom;
begin
  if not Assigned(FCondicaoPagto) then
    FCondicaoPagto := TControllerCondicaoPagto.New;

  Result := FCondicaoPagto;
end;

function TControllerFactory.CondicaoPagtoForma: IControllerCustom;
begin
  if not Assigned(FCondicaoPagtoForma) then
    FCondicaoPagtoForma := TControllerCondicaoPagtoForma.New;

  Result := FCondicaoPagtoForma;
end;

function TControllerFactory.CondicaoPagtoView: IControllerCustom;
begin
  if not Assigned(FCondicaoPagtoView) then
    FCondicaoPagtoView := TControllerCondicaoPagtoView.New;

  Result := FCondicaoPagtoView;
end;

function TControllerFactory.ContaCorrente: IControllerCustom;
begin
  if not Assigned(FContaCorrente) then
    FContaCorrente := TControllerContaCorrente.New;

  Result := FContaCorrente;
end;

function TControllerFactory.ContaCorrenteView: IControllerCustom;
begin
  if not Assigned(FContaCorrenteView) then
    FContaCorrenteView := TControllerContaCorrenteView.New;

  Result := FContaCorrenteView;
end;

function TControllerFactory.Distrito: IControllerCustom;
begin
  if not Assigned(FDistrito) then
    FDistrito := TControllerDistrito.New;

  Result := FDistrito;
end;

function TControllerFactory.Empresa: IControllerCustom;
begin
  if not Assigned(FEmpresa) then
    FEmpresa := TControllerEmpresa.New;

  Result := FEmpresa;
end;

function TControllerFactory.EmpresaView: IControllerCustom;
begin
  if not Assigned(FEmpresaView) then
    FEmpresaView := TControllerEmpresaView.New;

  Result := FEmpresaView;
end;

function TControllerFactory.FormaPagto: IControllerCustom;
begin
  if not Assigned(FFormaPagto) then
    FFormaPagto := TControllerFormaPagto.New;

  Result := FFormaPagto;
end;

function TControllerFactory.FormaPagtoContaCorrente: IControllerCustom;
begin
  if not Assigned(FFormaPagtoContaCorrente) then
    FFormaPagtoContaCorrente := TControllerFormaPagtoContaCorrente.New;

  Result := FFormaPagtoContaCorrente;
end;

function TControllerFactory.FormaPagtoNFCEView: IControllerCustom;
begin
  if not Assigned(FFormaPagtoNFCEView) then
    FFormaPagtoNFCEView := TControllerFormaPagtoNFCEView.New;

  Result := FFormaPagtoNFCEView;
end;

function TControllerFactory.IBPT: IControllerCustom;
begin
  if not Assigned(FIBPT) then
    FIBPT := TControllerIBPT.New;

  Result := FIBPT;
end;

function TControllerFactory.Logradouro: IControllerCustom;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TControllerLogradouro.New;

  Result := FLogradouro;
end;

function TControllerFactory.TabelaIBPT: IControllerCustom;
begin
  if not Assigned(FTabelaIBPT) then
    FTabelaIBPT := TControllerTabelaIBPT.New;

  Result := FTabelaIBPT;
end;

function TControllerFactory.TipoDespesa: IControllerCustom;
begin
  if not Assigned(FTipoDespesa) then
    FTipoDespesa := TControllerTipoDespesa.New;

  Result := FTipoDespesa;
end;

function TControllerFactory.TipoDespesaPlanoConta: IControllerCustom;
begin
  if not Assigned(FTipoDespesaPlanoCOnta) then
    FTipoDespesaPlanoCOnta := TControllerTipoDespesaPlanoConta.New;

  Result := FTipoDespesaPlanoCOnta;
end;

function TControllerFactory.TipoLogradouro: IControllerCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TControllerTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TControllerFactory.TipoReceita: IControllerCustom;
begin
  if not Assigned(FTipoReceita) then
    FTipoReceita := TControllerTipoReceita.New;

  Result := FTipoReceita;
end;

function TControllerFactory.TipoReceitaPlanoConta: IControllerCustom;
begin
  if not Assigned(FTipoReceitaPlanoCOnta) then
    FTipoReceitaPlanoCOnta := TControllerTipoReceitaPlanoConta.New;

  Result := FTipoReceitaPlanoCOnta;
end;

function TControllerFactory.TipoRegimeView: IControllerCustom;
begin
  if not Assigned(FTipoRegimeView) then
    FTipoRegimeView := TControllerTipoRegimeView.New;

  Result := FTipoRegimeView;
end;

function TControllerFactory.UF: IControllerCustom;
begin
  if not Assigned(FUF) then
    FUF := TControllerUF.New;

  Result := FUF;
end;

end.
