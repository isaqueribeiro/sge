unit SGE.Controller.Factory;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.Bairro,
  SGE.Controller.CentroCusto,
  SGE.Controller.CFOP,
  SGE.Controller.Cidade,
  SGE.Controller.Cliente,
  SGE.Controller.CondicaoPagto,
  SGE.Controller.ContaCorrente,
  SGE.Controller.CST,
  SGE.Controller.Distrito,
  SGE.Controller.Empresa,
  SGE.Controller.FormaPagto,
  SGE.Controller.Fornecedor,
  SGE.Controller.IBPT,
  SGE.Controller.Logradouro,
  SGE.Controller.PlanoConta,
  SGE.Controller.Tabelas,
  SGE.Controller.TipoDespesa,
  SGE.Controller.TipoLogradouro,
  SGE.Controller.TipoReceita,
  SGE.Controller.UF,
  SGE.Controller.Vendedor;

type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    private
      FUF       ,
      FBairro   ,
      FBancoFebrabanView ,
      FCentroCusto       ,
      FCentroCustoEmpresa,
      FCFOP  ,
      FCidade,
      FClasseDespesa ,
      FClasseReceita : IControllerCustom;
      FCliente       : IControllerCliente;
      FClienteEstoque,
      FClienteTitulos,
      FClienteTotalCompras,
      FCondicaoPagto      ,
      FCondicaoPagtoForma ,
      FCondicaoPagtoView  ,
      FConfiguracaoEmpresa,
      FContaCorrente      ,
      FContaCorrenteView  ,
      FCST        ,
      FDistrito   ,
      FEmpresa    ,
      FEmpresaView,
      FFormaPagto ,
      FFormaPagtoContaCorrente,
      FFormaPagtoNFCEView     ,
      FFornecedor     ,
      FGrupoFornecedor,
      FIBPT      ,
      FLogradouro,
      FNivelIBPT ,
      FPlanoConta      ,
      FPlanoContaNivel ,
      FPlanoContaTipo  ,
      FSegmento        ,
      FTabelaIBPT      ,
      FTipoCNPJView    ,
      FTipoComissaoView,
      FTipoDespesa     ,
      FTipoDespesaPlanoConta,
      FTipoLogradouro,
      FTipoReceita   ,
      FTipoReceitaPlanoConta,
      FTipoRegimeView,
      FVendedor : IControllerCustom;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactory;

      function Bairro   : IControllerCustom;
      function BancoFebrabanView : IControllerCustom;
      function CentroCusto : IControllerCustom;
      function CentroCustoEmpresa : IControllerCustom;
      function CFOP : IControllerCustom;
      function Cidade   : IControllerCustom;
      function ClasseDespesa : IControllerCustom;
      function ClasseReceita : IControllerCustom;
      function Cliente   : IControllerCliente;
      function ClienteEstoque : IControllerCustom;
      function ClienteTotalCompras : IControllerCustom;
      function ClienteTitulos : IControllerCustom;
      function CondicaoPagto : IControllerCustom;
      function CondicaoPagtoForma : IControllerCustom;
      function CondicaoPagtoView : IControllerCustom;
      function ConfiguracaoEmpresa : IControllerCustom;
      function ContaCorrente : IControllerCustom;
      function ContaCorrenteView : IControllerCustom;
      function CST : IControllerCustom;
      function Distrito : IControllerCustom;
      function Empresa : IControllerCustom;
      function EmpresaView : IControllerCustom;
      function FormaPagto : IControllerCustom;
      function FormaPagtoContaCorrente : IControllerCustom;
      function FormaPagtoNFCEView : IControllerCustom;
      function Fornecedor : IControllerCustom;
      function GrupoFornecedor : IControllerCustom;
      function IBPT : IControllerCustom;
      function Logradouro : IControllerCustom;
      function NivelIBPT : IControllerCustom;
      function PlanoConta : IControllerCustom;
      function PlanoContaNivel : IControllerCustom;
      function PlanoContaTipo : IControllerCustom;
      function Segmento : IControllerCustom;
      function TabelaIBPT : IControllerCustom;
      function TipoCNPJView : IControllerCustom;
      function TipoComissaoView : IControllerCustom;
      function TipoDespesa : IControllerCustom;
      function TipoDespesaPlanoConta : IControllerCustom;
      function TipoLogradouro : IControllerCustom;
      function TipoReceita : IControllerCustom;
      function TipoReceitaPlanoConta : IControllerCustom;
      function TipoRegimeView : IControllerCustom;
      function UF : IControllerCustom;
      function Vendedor : IControllerCustom;
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

function TControllerFactory.BancoFebrabanView: IControllerCustom;
begin
  if not Assigned(FBancoFebrabanView) then
    FBancoFebrabanView := TControllerBancoFebrabanView.New;

  Result := FBancoFebrabanView;
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

function TControllerFactory.Cliente: IControllerCliente;
begin
  if not Assigned(FCliente) then
    FCliente := TControllerCliente.New;

  Result := FCliente;
end;

function TControllerFactory.ClienteEstoque: IControllerCustom;
begin
  if not Assigned(FClienteEstoque) then
    FClienteEstoque := TControllerClienteEstoque.New;

  Result := FClienteEstoque;
end;

function TControllerFactory.ClienteTitulos: IControllerCustom;
begin
  if not Assigned(FClienteTitulos) then
    FClienteTitulos := TControllerClienteTitulos.New;

  Result := FClienteTitulos;
end;

function TControllerFactory.ClienteTotalCompras: IControllerCustom;
begin
  if not Assigned(FClienteTotalCompras) then
    FClienteTotalCompras := TControllerClienteTotalCompras.New;

  Result := FClienteTotalCompras;
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

function TControllerFactory.ConfiguracaoEmpresa: IControllerCustom;
begin
  if not Assigned(FConfiguracaoEmpresa) then
    FConfiguracaoEmpresa := TControllerConfiguracaoEmpresa.New;

  Result := FConfiguracaoEmpresa;
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

function TControllerFactory.Fornecedor: IControllerCustom;
begin
  if not Assigned(FFornecedor) then
    FFornecedor := TControllerFornecedor.New;

  Result := FFornecedor;
end;

function TControllerFactory.GrupoFornecedor: IControllerCustom;
begin
  if not Assigned(FGrupoFornecedor) then
    FGrupoFornecedor := TControllerGrupoFornecedor.New;

  Result := FGrupoFornecedor;
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

function TControllerFactory.TipoCNPJView: IControllerCustom;
begin
  if not Assigned(FTipoCNPJView) then
    FTipoCNPJView := TControllerTipoCNPJView.New;

  Result := FTipoCNPJView;
end;

function TControllerFactory.TipoComissaoView: IControllerCustom;
begin
  if not Assigned(FTipoComissaoView) then
    FTipoComissaoView := TControllerTipoComissaoView.New;

  Result := FTipoComissaoView;
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

function TControllerFactory.Vendedor: IControllerCustom;
begin
  if not Assigned(FVendedor) then
    FVendedor := TControllerVendedor.New;

  Result := FVendedor;
end;

end.
