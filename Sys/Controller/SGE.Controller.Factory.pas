unit SGE.Controller.Factory;

interface

uses
  SGE.Controller.Interfaces,
  SGE.Controller.AutorizacaoCompra,
  SGE.Controller.Bairro,
  SGE.Controller.Banco,
  SGE.Controller.Caixa,
  SGE.Controller.CentroCusto,
  SGE.Controller.CFOP,
  SGE.Controller.Cheque,
  SGE.Controller.Cidade,
  SGE.Controller.Cliente,
  SGE.Controller.CondicaoPagto,
  SGE.Controller.Config,
  SGE.Controller.ContaAPagar,
  SGE.Controller.ContaAReceber,
  SGE.Controller.ContaCorrente,
  SGE.Controller.Contrato,
  SGE.Controller.CST,
  SGI.Controller.CotacaoCompra,
  SGE.Controller.Distrito,
  SGE.Controller.Empresa,
  SGE.Controller.Endereco,
  SGE.Controller.Entrada,
  SGE.Controller.Estado,
  SGE.Controller.FormaPagto,
  SGE.Controller.Fornecedor,
  SGE.Controller.IBPT,
  SGE.Controller.Logradouro,
  SGE.Controller.LogTransacao,
  SGE.Controller.Perfil,
  SGE.Controller.PlanoConta,
  SGE.Controller.Produto,
  SGI.Controller.ProdutoAlmoxarifado,
  SGE.Controller.Promocao,
  SGI.Controller.RequisicaoAlmoxarifado,
  SGE.Controller.RequisicaoCompra,
  SGE.Controller.Rotina,
  SGI.Controller.SolicitacaoCompra,
  SGE.Controller.Tabelas,
  SGE.Controller.TipoDespesa,
  SGE.Controller.TipoLogradouro,
  SGE.Controller.TipoReceita,
  SGE.Controller.UF,
  SGE.Controller.Usuario,
  SGE.Controller.Vendedor,
  SGE.Controller.XML_NFeEnviada,
  SGE.Controller.XML_NFeImportada;

type
  TControllerFactory = class(TInterfacedObject, IControllerFactory)
    private
      FAliquotaCOFINSView : IControllerCustom;
      FAliquotaICMS       : IControllerAliquotaICMS;
      FAliquotaPISView    : IControllerCustom;
      FAutorizacaoCompra  : IControllerAutorizacaoCompra;
      FBairro : IControllerBairro;
      FBanco  : IControllerBanco;
      FBancoFebrabanView  : IControllerCustom;
      FCaixa : IControllerCaixa;
      FCaixaMovimento : IControllerCaixaMovimento;
      FCentroCusto        : IControllerCentroCusto;
      FCentroCustoEmpresa : IControllerCustom;
      FCentroCustoInterno : IControllerCustom;
      FCFOP   : IControllerCFOP;
      FCheque : IControllerCheque;
      FCidade,
      FClasseDespesa ,
      FClasseReceita : IControllerCustom;
      FCliente       : IControllerCliente;
      FClienteEstoque,
      FClienteTitulos,
      FClienteTotalCompras ,
      FCombustivelVeiculo  : IControllerCustom;
      FCompetencia         : IControllerCompetencia;
      FCondicaoPagto       ,
      FCondicaoPagtoForma  ,
      FCondicaoPagtoView   : IControllerCustom;
      FConfigSystem : IControllerConfigSystem;
      FConfiguracaoEmpresa : IControllerCustom;
      FContaAPagar : IControllerContaAPagar;
      FContaAReceber : IControllerContaAReceber;
      FContaCorrente      : IControllerContaCorrente;
      FContaCorrenteView  : IControllerCustom;
      FContrato : IControllerContrato;
      FContratoItem : IControllerContratoItem;
      FContratoNotas : IControllerContratoNotas;
      FCorVeiculo  : IControllerCustom;
      FCotacaoCompra : IControllerCotacaoCompra;
      FCotacaoCompraFornecedor : IControllerCotacaoCompraFornecedor;
      FCotacaoCompraFornecedorItens : IControllerCotacaoCompraFornecedorItens;
      FCST         ,
      FDistrito    ,
      FEmpresa     : IControllerCustom;
      FEmpresaView : IControllerEmpresa;
      FEntrada     : IControllerEntrada;
      FEndereco : IControllerEndereco;
      FEntradaDevolucao : IControllerCustom;
      FEntradaProduto   : IControllerEntradaProduto;
      FEstado ,
      FFabricanteProduto,
      FFormaDevolucao,
      FFormaPagto    ,
      FFormaPagtoContaCorrente,
      FFormaPagtoNFCEView     : IControllerCustom;
      FFornecedor     : IControllerFornecedor;
      FFornecedorProduto : IControllerFornecedorProduto;
      FGrupoFornecedor,
      FGrupoProduto   ,
      FIBPT           ,
      FItensAutorizadosParaEntrada,
      FLayoutRemessaBancoView     : IControllerCustom;
      FLogradouro  : IControllerLogradouro;
      FLogTransacao,
      FLoteProduto ,
      FModeloCupomFiscalView,
      FNFeEnviada  ,
      FNFeImportada,
      FNivelIBPT   ,
      FOrigemProdutoView : IControllerCustom;
      FPagamento  : IControllerPagamento;
      FPerfil : IControllerPerfil;
      FPerfilParaCopia ,
      FPlanoConta      ,
      FPlanoContaNivel ,
      FPlanoContaTipo  : IControllerCustom;
      FProduto         : IControllerProduto;
      FProdutoAlmoxarifado : IControllerProdutoAlmoxarifado;
      FProdutoAlmoxarifadoReservado : IControllerProdutoAlmoxarifadoReservado;
      FPromocao        : IControllerPromocao;
      FPromocaoProduto : IControllerCustom;
      FRecebimento     : IControllerRecebimento;
      FRequisicaoAlmoxarifado : IControllerRequisicaoAlmoxarifado;
      FRequisicaoCompra : IControllerRequisicaoCompra;
      FRotina : IControllerRotina;
      FSecaoProduto,
      FSegmento    : IControllerCustom;
      FSolicitacaoCompra : IControllerSolicitacaoCompra;
      FTabelaIBPT      ,
      FTipoAliquotaView   ,
      FTipoAutorizacaoView,
      FTipoChequeView  ,
      FTipoCNPJView    ,
      FTipoComissaoView,
      FTipoContratoView,
      FTipoCotacaoView ,
      FTipoDescontoView,
      FTipoDespesa     ,
      FTipoDespesaPlanoConta   ,
      FTipoDocumentoEntradaView,
      FTipoEntradaView,
      FTipoLogradouro ,
      FTipoProduto    ,
      FTipoReceita    ,
      FTipoReceitaPlanoConta,
      FTipoRequisicaoAlmoxView,
      FTipoRegimeView,
      FTipoRequisicaoView ,
      FTipoSolicitacaoView,
      FTipoTributacao,
      FTipoVeiculo   ,
      FTransportadora,
      FUF : IControllerCustom;
      FUsuario : IControllerUsuario;
      FUnidadeProduto : IControllerCustom;
      FVendedor : IControllerCustom;
      FXML_NFeEnviada : IControllerXML_NFeEnviada;
      FXML_NFeImportada : IControllerXML_NFeImportada;
    protected
      constructor Create;
    public
      destructor Destroy; override;
      class function New : IControllerFactory;

      function AliquotaCOFINSView : IControllerCustom;
      function AliquotaICMS : IControllerAliquotaICMS;
      function AliquotaPISView : IControllerCustom;
      function AutorizacaoCompra  : IControllerAutorizacaoCompra;
      function Bairro : IControllerBairro;
      function Banco : IControllerBanco;
      function BancoFebrabanView : IControllerCustom;
      function Caixa : IControllerCaixa;
      function CaixaMovimento : IControllerCaixaMovimento;
      function CentroCusto : IControllerCentroCusto;
      function CentroCustoEmpresa : IControllerCustom;
      function CentroCustoInterno : IControllerCustom;
      function CFOP : IControllerCFOP;
      function Cheque : IControllerCheque;
      function Cidade : IControllerCustom;
      function ClasseDespesa : IControllerCustom;
      function ClasseReceita : IControllerCustom;
      function Cliente   : IControllerCliente;
      function ClienteEstoque : IControllerCustom;
      function ClienteTotalCompras : IControllerCustom;
      function ClienteTitulos : IControllerCustom;
      function CombustivelVeiculo : IControllerCustom;
      function Competencia : IControllerCompetencia;
      function CondicaoPagto : IControllerCustom;
      function CondicaoPagtoForma : IControllerCustom;
      function CondicaoPagtoView : IControllerCustom;
      function ConfigSystem : IControllerConfigSystem;
      function ConfiguracaoEmpresa : IControllerCustom;
      function ContaAPagar : IControllerContaAPagar;
      function ContaAReceber : IControllerContaAReceber;
      function ContaCorrente : IControllerContaCorrente;
      function ContaCorrenteView : IControllerCustom;
      function Contrato : IControllerContrato;
      function ContratoItem : IControllerContratoItem;
      function ContratoNotas : IControllerContratoNotas;
      function CorVeiculo : IControllerCustom;
      function CotacaoCompra : IControllerCotacaoCompra;
      function CotacaoCompraFornecedor : IControllerCotacaoCompraFornecedor;
      function CotacaoCompraFornecedorItens : IControllerCotacaoCompraFornecedorItens;
      function CST : IControllerCustom;
      function Distrito : IControllerCustom;
      function Empresa : IControllerCustom;
      function EmpresaView : IControllerEmpresa;
      function Endereco : IControllerEndereco;
      function Entrada : IControllerEntrada;
      function EntradaDevolucao : IControllerCustom;
      function EntradaProduto : IControllerEntradaProduto;
      function Estado  : IControllerCustom;
      function FabricanteProduto : IControllerCustom;
      function FormaDevolucao : IControllerCustom;
      function FormaPagto : IControllerCustom;
      function FormaPagtoContaCorrente : IControllerCustom;
      function FormaPagtoNFCEView : IControllerCustom;
      function Fornecedor : IControllerFornecedor;
      function FornecedorProduto : IControllerFornecedorProduto;
      function GrupoFornecedor : IControllerCustom;
      function GrupoProduto : IControllerCustom;
      function IBPT : IControllerCustom;
      function ItensAutorizadosParaEntrada : IControllerCustom;
      function LayoutRemessaBancoView : IControllerCustom;
      function Logradouro : IControllerLogradouro;
      function LogTransacao : IControllerCustom;
      function LoteProduto : IControllerCustom;
      function ModeloCupomFiscalView : IControllerCustom;
      function NFeEnviada : IControllerCustom;
      function NFeImportada : IControllerCustom;
      function NivelIBPT : IControllerCustom;
      function OrigemProdutoView : IControllerCustom;
      function Pagamento         : IControllerPagamento;
      function Perfil : IControllerPerfil;
      function PerfilParaCopia : IControllerCustom;
      function PlanoConta : IControllerCustom;
      function PlanoContaNivel : IControllerCustom;
      function PlanoContaTipo : IControllerCustom;
      function Produto           : IControllerProduto;
      function ProdutoAlmoxarifado : IControllerProdutoAlmoxarifado;
      function ProdutoAlmoxarifadoReservado : IControllerProdutoAlmoxarifadoReservado;
      function Promocao          : IControllerPromocao;
      function PromocaoProduto   : IControllerCustom;
      function Recebimento       : IControllerRecebimento;
      function RequisicaoAlmoxarifado : IControllerRequisicaoAlmoxarifado;
      function RequisicaoCompra  : IControllerRequisicaoCompra;
      function Rotina : IControllerRotina;
      function SecaoProduto : IControllerCustom;
      function Segmento : IControllerCustom;
      function SolicitacaoCompra : IControllerSolicitacaoCompra;
      function TabelaIBPT : IControllerCustom;
      function TipoAliquotaView : IControllerCustom;
      function TipoAutorizacaoView : IControllerCustom;
      function TipoChequeView : IControllerCustom;
      function TipoCNPJView : IControllerCustom;
      function TipoComissaoView : IControllerCustom;
      function TipoContratoView : IControllerCustom;
      function TipoCotacaoView  : IControllerCustom;
      function TipoDescontoView : IControllerCustom;
      function TipoDespesa : IControllerCustom;
      function TipoDespesaPlanoConta : IControllerCustom;
      function TipoDocumentoEntradaView : IControllerCustom;
      function TipoEntradaView : IControllerCustom;
      function TipoLogradouro : IControllerCustom;
      function TipoProduto : IControllerCustom;
      function TipoReceita : IControllerCustom;
      function TipoReceitaPlanoConta : IControllerCustom;
      function TipoRegimeView : IControllerCustom;
      function TipoRequisicaoAlmoxView : IControllerCustom;
      function TipoRequisicaoView : IControllerCustom;
      function TipoSolicitacaoView : IControllerCustom;
      function TipoTributacao : IControllerCustom;
      function TipoVeiculo : IControllerCustom;
      function Transportadora : IControllerCustom;
      function UF : IControllerCustom;
      function Usuario : IControllerUsuario;
      function UnidadeProduto : IControllerCustom;
      function Vendedor : IControllerCustom;
      function XML_NFeEnviada : IControllerXML_NFeEnviada;
      function XML_NFeImportada : IControllerXML_NFeImportada;
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

function TControllerFactory.NFeEnviada: IControllerCustom;
begin
  if not Assigned(FNFeEnviada) then
    FNFeEnviada := TControllerNFeEnviada.New;

  Result := FNFeEnviada;
end;

function TControllerFactory.NFeImportada: IControllerCustom;
begin
  if not Assigned(FNFeImportada) then
    FNFeImportada := TControllerNFeImportada.New;

  Result := FNFeImportada;
end;

function TControllerFactory.NivelIBPT: IControllerCustom;
begin
  if not Assigned(FNivelIBPT) then
    FNivelIBPT := TControllerNivelIBPT.New;

  Result := FNivelIBPT;
end;

function TControllerFactory.OrigemProdutoView: IControllerCustom;
begin
  if not Assigned(FOrigemProdutoView) then
    FOrigemProdutoView := TControllerOrigemProdutoView.New;

  Result := FOrigemProdutoView;
end;

function TControllerFactory.Pagamento: IControllerPagamento;
begin
  if not Assigned(FPagamento) then
    FPagamento := TControllerPagamento.New;

  Result := FPagamento;
end;

function TControllerFactory.Perfil: IControllerPerfil;
begin
  if not Assigned(FPerfil) then
    FPerfil := TControllerPerfil.New;

  Result := FPerfil;
end;

function TControllerFactory.PerfilParaCopia: IControllerCustom;
begin
  if not Assigned(FPerfilParaCopia) then
    FPerfilParaCopia := TControllerPerfilParaCopia.New;

  Result := FPerfilParaCopia;
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

function TControllerFactory.Produto: IControllerProduto;
begin
  if not Assigned(FProduto) then
    FProduto := TControllerProduto.New;

  Result := FProduto;
end;

function TControllerFactory.ProdutoAlmoxarifado: IControllerProdutoAlmoxarifado;
begin
  if not Assigned(FProdutoAlmoxarifado) then
    FProdutoAlmoxarifado := TControllerProdutoAlmoxarifado.New;

  Result := FProdutoAlmoxarifado;
end;

function TControllerFactory.ProdutoAlmoxarifadoReservado: IControllerProdutoAlmoxarifadoReservado;
begin
  if not Assigned(FProdutoAlmoxarifadoReservado) then
    FProdutoAlmoxarifadoReservado := TControllerProdutoAlmoxarifadoReservado.New;

  Result := FProdutoAlmoxarifadoReservado;
end;

function TControllerFactory.Promocao: IControllerPromocao;
begin
  if not Assigned(FPromocao) then
    FPromocao := TControllerPromocao.New;

  Result := FPromocao;
end;

function TControllerFactory.PromocaoProduto: IControllerCustom;
begin
  if not Assigned(FPromocaoProduto) then
    FPromocaoProduto := TControllerPromocaoProduto.New;

  Result := FPromocaoProduto;
end;

function TControllerFactory.Recebimento: IControllerRecebimento;
begin
  if not Assigned(FRecebimento) then
    FRecebimento := TControllerRecebimento.New;

  Result := FRecebimento;
end;

function TControllerFactory.RequisicaoAlmoxarifado: IControllerRequisicaoAlmoxarifado;
begin
  if not Assigned(FRequisicaoAlmoxarifado) then
    FRequisicaoAlmoxarifado := TControllerRequisicaoAlmoxarifado.New;

  Result := FRequisicaoAlmoxarifado;
end;

function TControllerFactory.RequisicaoCompra: IControllerRequisicaoCompra;
begin
  if not Assigned(FRequisicaoCompra) then
    FRequisicaoCompra := TControllerRequisicaoCompra.New;

  Result := FRequisicaoCompra;
end;

function TControllerFactory.Rotina: IControllerRotina;
begin
  if not Assigned(FRotina) then
    FRotina := TControllerRotina.New;

  Result := FRotina;
end;

function TControllerFactory.SecaoProduto: IControllerCustom;
begin
  if not Assigned(FSecaoProduto) then
    FSecaoProduto := TControllerSecaoProduto.New;

  Result := FSecaoProduto;
end;

function TControllerFactory.Segmento: IControllerCustom;
begin
  if not Assigned(FSegmento) then
    FSegmento := TControllerSegmento.New;

  Result := FSegmento;
end;

function TControllerFactory.SolicitacaoCompra: IControllerSolicitacaoCompra;
begin
  if not Assigned(FSolicitacaoCompra) then
    FSolicitacaoCompra := TControllerSolicitacaoCompra.New;

  Result := FSolicitacaoCompra;
end;

function TControllerFactory.CST: IControllerCustom;
begin
  if not Assigned(FCST) then
    FCST := TControllerCST.New;

  Result := FCST;
end;

function TControllerFactory.AliquotaCOFINSView: IControllerCustom;
begin
  if not Assigned(FAliquotaCOFINSView) then
    FAliquotaCOFINSView := TControllerAliquotaCOFINSView.New;

  Result := FAliquotaCOFINSView;
end;

function TControllerFactory.AliquotaICMS: IControllerAliquotaICMS;
begin
  if not Assigned(FAliquotaICMS) then
    FAliquotaICMS := TControllerAliquotaICMS.New;

  Result := FAliquotaICMS;
end;

function TControllerFactory.AliquotaPISView: IControllerCustom;
begin
  if not Assigned(FAliquotaPISView) then
    FAliquotaPISView := TControllerAliquotaPISView.New;

  Result := FAliquotaPISView;
end;

function TControllerFactory.AutorizacaoCompra: IControllerAutorizacaoCompra;
begin
  if not Assigned(FAutorizacaoCompra) then
    FAutorizacaoCompra := TControllerAutorizacaoCompra.New;

  Result := FAutorizacaoCompra;
end;

function TControllerFactory.Bairro: IControllerBairro;
begin
  if not Assigned(FBairro) then
    FBairro := TControllerBairro.New;

  Result := FBairro;
end;

function TControllerFactory.Banco: IControllerBanco;
begin
  if not Assigned(FBanco) then
    FBanco := TControllerBanco.New;

  Result := FBanco;
end;

function TControllerFactory.BancoFebrabanView: IControllerCustom;
begin
  if not Assigned(FBancoFebrabanView) then
    FBancoFebrabanView := TControllerBancoFebrabanView.New;

  Result := FBancoFebrabanView;
end;

function TControllerFactory.Caixa: IControllerCaixa;
begin
  if not Assigned(FCaixa) then
    FCaixa := TControllerCaixa.New;

  Result := FCaixa;
end;

function TControllerFactory.CaixaMovimento: IControllerCaixaMovimento;
begin
  if not Assigned(FCaixaMovimento) then
    FCaixaMovimento := TControllerCaixaMovimento.New;

  Result := FCaixaMovimento;
end;

function TControllerFactory.CentroCusto: IControllerCentroCusto;
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

function TControllerFactory.CentroCustoInterno: IControllerCustom;
begin
  if not Assigned(FCentroCustoInterno) then
    FCentroCustoInterno := TControllerCentroCustoInterno.New;

  Result := FCentroCustoInterno;
end;

function TControllerFactory.CFOP: IControllerCFOP;
begin
  if not Assigned(FCFOP) then
    FCFOP := TControllerCFOP.New;

  Result := FCFOP;
end;

function TControllerFactory.Cheque: IControllerCheque;
begin
  if not Assigned(FCheque) then
    FCheque := TControllerCheque.New;

  Result := FCheque;
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

function TControllerFactory.CombustivelVeiculo: IControllerCustom;
begin
  if not Assigned(FCombustivelVeiculo) then
    FCombustivelVeiculo := TControllerCombustivelVeiculo.New;

  Result := FCombustivelVeiculo;
end;

function TControllerFactory.Competencia: IControllerCompetencia;
begin
  if not Assigned(FCompetencia) then
    FCompetencia := TControllerCompetencia.New;

  Result := FCompetencia;
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

function TControllerFactory.ConfigSystem: IControllerConfigSystem;
begin
  if not Assigned(FConfigSystem) then
    FConfigSystem := TControllerConfigSystem.New;

  Result := FConfigSystem;
end;

function TControllerFactory.ConfiguracaoEmpresa: IControllerCustom;
begin
  if not Assigned(FConfiguracaoEmpresa) then
    FConfiguracaoEmpresa := TControllerConfiguracaoEmpresa.New;

  Result := FConfiguracaoEmpresa;
end;

function TControllerFactory.ContaAPagar: IControllerContaAPagar;
begin
  if not Assigned(FContaAPagar) then
    FContaAPagar := TControllerContaAPagar.New;

  Result := FContaAPagar;
end;

function TControllerFactory.ContaAReceber: IControllerContaAReceber;
begin
  if not Assigned(FContaAReceber) then
    FContaAReceber := TControllerContaAReceber.New;

  Result := FContaAReceber;
end;

function TControllerFactory.ContaCorrente: IControllerContaCorrente;
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

function TControllerFactory.Contrato: IControllerContrato;
begin
  if not Assigned(FContrato) then
    FContrato := TControllerContrato.New;

  Result := FContrato;
end;

function TControllerFactory.ContratoItem: IControllerContratoItem;
begin
  if not Assigned(FContratoItem) then
    FContratoItem := TControllerContratoItem.New;

  Result := FContratoItem;
end;

function TControllerFactory.ContratoNotas: IControllerContratoNotas;
begin
  if not Assigned(FContratoNotas) then
    FContratoNotas := TControllerContratoNotas.New;

  Result := FContratoNotas;
end;

function TControllerFactory.CorVeiculo: IControllerCustom;
begin
  if not Assigned(FCorVeiculo) then
    FCorVeiculo := TControllerCorVeiculo.New;

  Result := FCorVeiculo;
end;

function TControllerFactory.CotacaoCompra: IControllerCotacaoCompra;
begin
  if not Assigned(FCotacaoCompra) then
    FCotacaoCompra := TControllerCotacaoCompra.New;

  Result := FCotacaoCompra;
end;

function TControllerFactory.CotacaoCompraFornecedor: IControllerCotacaoCompraFornecedor;
begin
  if not Assigned(FCotacaoCompraFornecedor) then
    FCotacaoCompraFornecedor := TControllerCotacaoCompraFornecedor.New;

  Result := FCotacaoCompraFornecedor;
end;

function TControllerFactory.CotacaoCompraFornecedorItens: IControllerCotacaoCompraFornecedorItens;
begin
  if not Assigned(FCotacaoCompraFornecedorItens) then
    FCotacaoCompraFornecedorItens := TControllerCotacaoCompraFornecedorItens.New;

  Result := FCotacaoCompraFornecedorItens;
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

function TControllerFactory.EmpresaView: IControllerEmpresa;
begin
  if not Assigned(FEmpresaView) then
    FEmpresaView := TControllerEmpresaView.New;

  Result := FEmpresaView;
end;

function TControllerFactory.Endereco: IControllerEndereco;
begin
  if not Assigned(FEndereco) then
    FEndereco := TControllerEndereco.New;

  Result := FEndereco;
end;

function TControllerFactory.Entrada: IControllerEntrada;
begin
  if not Assigned(FEntrada) then
    FEntrada := TControllerEntrada.New;

  Result := FEntrada;
end;

function TControllerFactory.EntradaDevolucao: IControllerCustom;
begin
  if not Assigned(FEntradaDevolucao) then
    FEntradaDevolucao := TControllerEntradaDevolucao.New;

  Result := FEntradaDevolucao;
end;

function TControllerFactory.EntradaProduto: IControllerEntradaProduto;
begin
  if not Assigned(FEntradaProduto) then
    FEntradaProduto := TControllerEntradaProduto.New;

  Result := FEntradaProduto;
end;

function TControllerFactory.Estado: IControllerCustom;
begin
  if not Assigned(FEstado) then
    FEstado := TControllerEstado.New;

  Result := FEstado;
end;

function TControllerFactory.FabricanteProduto: IControllerCustom;
begin
  if not Assigned(FFabricanteProduto) then
    FFabricanteProduto := TControllerFabricanteProduto.New;

  Result := FFabricanteProduto;
end;

function TControllerFactory.FormaDevolucao: IControllerCustom;
begin
  if not Assigned(FFormaDevolucao) then
    FFormaDevolucao := TControllerFormaDevolucao.New;

  Result := FFormaDevolucao;
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

function TControllerFactory.Fornecedor: IControllerFornecedor;
begin
  if not Assigned(FFornecedor) then
    FFornecedor := TControllerFornecedor.New;

  Result := FFornecedor;
end;

function TControllerFactory.FornecedorProduto: IControllerFornecedorProduto;
begin
  if not Assigned(FFornecedorProduto) then
    FFornecedorProduto := TControllerFornecedorProduto.New;

  Result := FFornecedorProduto;
end;

function TControllerFactory.GrupoFornecedor: IControllerCustom;
begin
  if not Assigned(FGrupoFornecedor) then
    FGrupoFornecedor := TControllerGrupoFornecedor.New;

  Result := FGrupoFornecedor;
end;

function TControllerFactory.GrupoProduto: IControllerCustom;
begin
  if not Assigned(FGrupoProduto) then
    FGrupoProduto := TControllerGrupoProduto.New;

  Result := FGrupoProduto;
end;

function TControllerFactory.IBPT: IControllerCustom;
begin
  if not Assigned(FIBPT) then
    FIBPT := TControllerIBPT.New;

  Result := FIBPT;
end;

function TControllerFactory.ItensAutorizadosParaEntrada: IControllerCustom;
begin
  if not Assigned(FItensAutorizadosParaEntrada) then
    FItensAutorizadosParaEntrada := TControllerItensAutorizadosParaEntrada.New;

  Result := FItensAutorizadosParaEntrada;
end;

function TControllerFactory.LayoutRemessaBancoView: IControllerCustom;
begin
  if not Assigned(FLayoutRemessaBancoView) then
    FLayoutRemessaBancoView := TControllerLayoutRemessaBancoView.New;

  Result := FLayoutRemessaBancoView;
end;

function TControllerFactory.Logradouro: IControllerLogradouro;
begin
  if not Assigned(FLogradouro) then
    FLogradouro := TControllerLogradouro.New;

  Result := FLogradouro;
end;

function TControllerFactory.LogTransacao: IControllerCustom;
begin
  if not Assigned(FLogTransacao) then
    FLogTransacao := TControllerLogTransacao.New;

  Result := FLogTransacao;
end;

function TControllerFactory.LoteProduto: IControllerCustom;
begin
  if not Assigned(FLoteProduto) then
    FLoteProduto := TControllerLoteProduto.New;

  Result := FLoteProduto;
end;

function TControllerFactory.ModeloCupomFiscalView: IControllerCustom;
begin
  if not Assigned(FModeloCupomFiscalView) then
    FModeloCupomFiscalView := TControllerModeloCupomFiscal.New;

  Result := FModeloCupomFiscalView;
end;

function TControllerFactory.TabelaIBPT: IControllerCustom;
begin
  if not Assigned(FTabelaIBPT) then
    FTabelaIBPT := TControllerTabelaIBPT.New;

  Result := FTabelaIBPT;
end;

function TControllerFactory.TipoAliquotaView: IControllerCustom;
begin
  if not Assigned(FTipoAliquotaView) then
    FTipoAliquotaView := TControllerTipoAliquotaView.New;

  Result := FTipoAliquotaView;
end;

function TControllerFactory.TipoAutorizacaoView: IControllerCustom;
begin
  if not Assigned(FTipoAutorizacaoView) then
    FTipoAutorizacaoView := TControllerTipoAutorizacaoView.New;

  Result := FTipoAutorizacaoView;
end;

function TControllerFactory.TipoChequeView: IControllerCustom;
begin
  if not Assigned(FTipoChequeView) then
    FTipoChequeView := TControllerTipoChequeView.New;

  Result := FTipoChequeView;
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

function TControllerFactory.TipoContratoView: IControllerCustom;
begin
  if not Assigned(FTipoContratoView) then
    FTipoContratoView := TControllerTipoContratoView.New;

  Result := FTipoContratoView;
end;

function TControllerFactory.TipoCotacaoView: IControllerCustom;
begin
  if not Assigned(FTipoCotacaoView) then
    FTipoCotacaoView := TControllerTipoCotacaoView.New;

  Result := FTipoCotacaoView;
end;

function TControllerFactory.TipoDescontoView: IControllerCustom;
begin
  if not Assigned(FTipoDescontoView) then
    FTipoDescontoView := TControllerTipoDescontoView.New;

  Result := FTipoDescontoView;
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

function TControllerFactory.TipoDocumentoEntradaView: IControllerCustom;
begin
  if not Assigned(FTipoDocumentoEntradaView) then
    FTipoDocumentoEntradaView := TControllerTipoDocumentoEntradaView.New;

  Result := FTipoDocumentoEntradaView;
end;

function TControllerFactory.TipoEntradaView: IControllerCustom;
begin
  if not Assigned(FTipoEntradaView) then
    FTipoEntradaView := TControllerTipoEntradaView.New;

  Result := FTipoEntradaView;
end;

function TControllerFactory.TipoLogradouro: IControllerCustom;
begin
  if not Assigned(FTipoLogradouro) then
    FTipoLogradouro := TControllerTipoLogradouro.New;

  Result := FTipoLogradouro;
end;

function TControllerFactory.TipoProduto: IControllerCustom;
begin
  if not Assigned(FTipoProduto) then
    FTipoProduto := TControllerTipoProduto.New;

  Result := FTipoProduto;
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

function TControllerFactory.TipoRequisicaoAlmoxView: IControllerCustom;
begin
  if not Assigned(FTipoRequisicaoAlmoxView) then
    FTipoRequisicaoAlmoxView := TControllerTipoRequisicaoAlmoxView.New;

  Result := FTipoRequisicaoAlmoxView;
end;

function TControllerFactory.TipoRequisicaoView: IControllerCustom;
begin
  if not Assigned(FTipoRequisicaoView) then
    FTipoRequisicaoView := TControllerTipoRequisicaoView.New;

  Result := FTipoRequisicaoView;
end;

function TControllerFactory.TipoSolicitacaoView: IControllerCustom;
begin
  if not Assigned(FTipoSolicitacaoView) then
    FTipoSolicitacaoView := TControllerTipoSolicitacaoView.New;

  Result := FTipoSolicitacaoView;
end;

function TControllerFactory.TipoTributacao: IControllerCustom;
begin
  if not Assigned(FTipoTributacao) then
    FTipoTributacao := TControllerTipoTributacao.New;

  Result := FTipoTributacao;
end;

function TControllerFactory.TipoVeiculo: IControllerCustom;
begin
  if not Assigned(FTipoVeiculo) then
    FTipoVeiculo := TControllerTipoVeiculo.New;

  Result := FTipoVeiculo;
end;

function TControllerFactory.Transportadora: IControllerCustom;
begin
  if not Assigned(FTransportadora) then
    FTransportadora := TControllerTransportadora.New;

  Result := FTransportadora;
end;

function TControllerFactory.UF: IControllerCustom;
begin
  if not Assigned(FUF) then
    FUF := TControllerUF.New;

  Result := FUF;
end;

function TControllerFactory.UnidadeProduto: IControllerCustom;
begin
  if not Assigned(FUnidadeProduto) then
    FUnidadeProduto := TControllerUnidadeProduto.New;

  Result := FUnidadeProduto;
end;

function TControllerFactory.Usuario: IControllerUsuario;
begin
  if not Assigned(FUsuario) then
    FUsuario := TControllerUsuario.New;

  Result := FUsuario;
end;

function TControllerFactory.Vendedor: IControllerCustom;
begin
  if not Assigned(FVendedor) then
    FVendedor := TControllerVendedor.New;

  Result := FVendedor;
end;

function TControllerFactory.XML_NFeEnviada: IControllerXML_NFeEnviada;
begin
  if not Assigned(FXML_NFeEnviada) then
    FXML_NFeEnviada := TControllerXML_NFeEnviada.New;

  Result := FXML_NFeEnviada;
end;

function TControllerFactory.XML_NFeImportada: IControllerXML_NFeImportada;
begin
  if not Assigned(FXML_NFeImportada) then
    FXML_NFeImportada := TControllerXML_NFeImportada.New;

  Result := FXML_NFeImportada;
end;

end.
